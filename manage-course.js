const manageRoot = document.getElementById("manageRoot");
const MANAGE_COURSE_SLUG = "life-health-combo";

async function initManage() {
  const { data: { session } } = await supabaseClient.auth.getSession();
  if (!session) {
    window.location.href = "login.html";
    return;
  }
  const role = session.user.user_metadata && session.user.user_metadata.role;
  if (role !== "staff") {
    window.location.href = "dashboard.html";
    return;
  }

  const messageEl = document.getElementById("formMessage");
  let courseId = null;
  let messageTimeout = null;

  function showMessage(text, type) {
    messageEl.textContent = text;
    messageEl.className = "form-message " + type;
    clearTimeout(messageTimeout);
    messageTimeout = setTimeout(() => {
      messageEl.className = "form-message";
    }, 4000);
  }

  function button(label, onClick, extraClass) {
    const b = document.createElement("button");
    b.type = "button";
    b.textContent = label;
    b.className = "btn-manage" + (extraClass ? " " + extraClass : "");
    b.addEventListener("click", onClick);
    return b;
  }

  async function loadCourse() {
    const { data, error } = await supabaseClient
      .from("courses")
      .select("id, title")
      .eq("slug", MANAGE_COURSE_SLUG)
      .single();
    if (error || !data) {
      showMessage("Could not load the course.", "error");
      return null;
    }
    document.getElementById("manageCourseTitle").textContent = "Manage: " + data.title;
    return data;
  }

  async function loadModules() {
    const { data, error } = await supabaseClient
      .from("modules")
      .select("id, title, position, lessons(id, title, duration, type, video_url, content, description, position)")
      .eq("course_id", courseId)
      .order("position")
      .order("position", { foreignTable: "lessons" });
    if (error) {
      showMessage("Could not load modules: " + error.message, "error");
      return [];
    }
    return data || [];
  }

  async function refresh() {
    document.getElementById("moduleFormContainer").innerHTML = "";
    const modules = await loadModules();
    renderModules(modules);
  }

  function renderModules(modules) {
    const container = document.getElementById("moduleManageList");
    container.innerHTML = "";

    if (!modules.length) {
      const empty = document.createElement("p");
      empty.className = "manage-empty";
      empty.textContent = "No modules yet. Click “+ Add Module” to create the first one.";
      container.appendChild(empty);
      return;
    }

    modules.forEach((mod) => {
      const modCard = document.createElement("div");
      modCard.className = "manage-module-card";
      modCard.dataset.moduleId = mod.id;

      const modHeader = document.createElement("div");
      modHeader.className = "manage-module-header";

      const modTitleWrap = document.createElement("div");
      modTitleWrap.className = "manage-title-wrap";
      const modHandle = document.createElement("span");
      modHandle.className = "drag-handle";
      modHandle.textContent = "⠿";
      modHandle.title = "Drag to reorder";
      const modTitle = document.createElement("h3");
      modTitle.textContent = mod.title;
      modTitleWrap.appendChild(modHandle);
      modTitleWrap.appendChild(modTitle);

      const modActions = document.createElement("div");
      modActions.className = "manage-actions";

      const editBtn = button("Edit", () => openModuleForm(mod));
      const deleteBtn = button("Delete", () => deleteModule(mod), "btn-manage-danger");

      [editBtn, deleteBtn].forEach((b) => modActions.appendChild(b));
      modHeader.appendChild(modTitleWrap);
      modHeader.appendChild(modActions);
      modCard.appendChild(modHeader);

      const lessonList = document.createElement("div");
      lessonList.className = "manage-lesson-list";

      mod.lessons.forEach((lesson) => {
        const row = document.createElement("div");
        row.className = "manage-lesson-row";
        row.dataset.lessonId = lesson.id;

        const handle = document.createElement("span");
        handle.className = "drag-handle";
        handle.textContent = "⠿";
        handle.title = "Drag to reorder";

        const info = document.createElement("div");
        info.className = "manage-lesson-info";

        const titleEl = document.createElement("strong");
        titleEl.textContent = lesson.title;
        const metaEl = document.createElement("span");
        metaEl.className = "manage-lesson-meta";
        metaEl.textContent = `${lesson.type} · ${lesson.duration || ""}`;

        info.appendChild(titleEl);
        info.appendChild(metaEl);

        const actions = document.createElement("div");
        actions.className = "manage-actions";
        const lEdit = button("Edit", () => openLessonForm(mod, lesson));
        const lDelete = button("Delete", () => deleteLesson(lesson), "btn-manage-danger");
        [lEdit, lDelete].forEach((b) => actions.appendChild(b));

        row.appendChild(handle);
        row.appendChild(info);
        row.appendChild(actions);
        lessonList.appendChild(row);
      });

      modCard.appendChild(lessonList);

      const addLessonBtn = button("+ Add Lesson", () => openLessonForm(mod, null), "btn-manage-add");
      modCard.appendChild(addLessonBtn);

      container.appendChild(modCard);

      makeListDraggable(lessonList, ".manage-lesson-row", ".drag-handle", (items) => {
        reorderLessons(items);
      });
    });

    makeListDraggable(container, ".manage-module-card", ".drag-handle", (items) => {
      reorderModules(items);
    });
  }

  // --- Module CRUD ---

  document.getElementById("addModuleBtn").addEventListener("click", () => openModuleForm(null));

  function openModuleForm(existingModule) {
    const container = document.getElementById("moduleFormContainer");
    container.innerHTML = "";

    const form = document.createElement("form");
    form.className = "manage-form";
    form.innerHTML = `
      <label>Module title</label>
      <input type="text" name="title" required>
      <div class="manage-form-actions">
        <button type="submit" class="btn btn-primary">${existingModule ? "Save Module" : "Create Module"}</button>
        <button type="button" class="btn btn-secondary" data-cancel>Cancel</button>
      </div>
    `;

    if (existingModule) form.title.value = existingModule.title;

    form.querySelector("[data-cancel]").addEventListener("click", () => {
      container.innerHTML = "";
    });

    form.addEventListener("submit", async (e) => {
      e.preventDefault();
      const title = form.title.value.trim();
      if (!title) return;

      if (existingModule) {
        const { error } = await supabaseClient.from("modules").update({ title }).eq("id", existingModule.id);
        if (error) return showMessage(error.message, "error");
        showMessage("Module updated.", "success");
      } else {
        const { count } = await supabaseClient
          .from("modules")
          .select("id", { count: "exact", head: true })
          .eq("course_id", courseId);
        const { error } = await supabaseClient
          .from("modules")
          .insert({ course_id: courseId, title, position: (count || 0) + 1 });
        if (error) return showMessage(error.message, "error");
        showMessage("Module created.", "success");
      }
      refresh();
    });

    container.appendChild(form);
    form.title.focus();
  }

  async function deleteModule(mod) {
    if (!window.confirm(`Delete "${mod.title}" and all its lessons? This can't be undone.`)) return;
    const { error } = await supabaseClient.from("modules").delete().eq("id", mod.id);
    if (error) return showMessage(error.message, "error");
    showMessage("Module deleted.", "success");
    refresh();
  }

  async function reorderModules(items) {
    const ids = items.map((el) => el.dataset.moduleId);
    await Promise.all(
      ids.map((id, index) => supabaseClient.from("modules").update({ position: index + 1 }).eq("id", id))
    );
    refresh();
  }

  // --- Lesson CRUD ---

  function openLessonForm(mod, existingLesson) {
    document.querySelectorAll(".manage-lesson-form").forEach((f) => f.remove());

    const form = document.createElement("form");
    form.className = "manage-form manage-lesson-form";
    form.innerHTML = `
      <label>Lesson title</label>
      <input type="text" name="title" required>
      <label>Duration (e.g. 10 min)</label>
      <input type="text" name="duration">
      <label>Type</label>
      <select name="type">
        <option value="video">Video</option>
        <option value="text">Text</option>
      </select>
      <label>Video URL (embed link — only used when Type is Video)</label>
      <input type="text" name="videoUrl" placeholder="https://www.youtube.com/embed/...">
      <label>Content (HTML — only used when Type is Text)</label>
      <textarea name="content" rows="4" placeholder="&lt;p&gt;Lesson text goes here.&lt;/p&gt;"></textarea>
      <label>Description (optional, shown under the lesson title)</label>
      <input type="text" name="description">
      <div class="manage-form-actions">
        <button type="submit" class="btn btn-primary">${existingLesson ? "Save Lesson" : "Add Lesson"}</button>
        <button type="button" class="btn btn-secondary" data-cancel>Cancel</button>
      </div>
    `;

    if (existingLesson) {
      form.title.value = existingLesson.title;
      form.duration.value = existingLesson.duration || "";
      form.type.value = existingLesson.type;
      form.videoUrl.value = existingLesson.video_url || "";
      form.content.value = existingLesson.content || "";
      form.description.value = existingLesson.description || "";
    }

    form.querySelector("[data-cancel]").addEventListener("click", () => form.remove());

    form.addEventListener("submit", async (e) => {
      e.preventDefault();
      const title = form.title.value.trim();
      if (!title) return;

      const payload = {
        title,
        duration: form.duration.value.trim() || null,
        type: form.type.value,
        video_url: form.videoUrl.value.trim() || null,
        content: form.content.value.trim() || null,
        description: form.description.value.trim() || null,
      };

      if (existingLesson) {
        const { error } = await supabaseClient.from("lessons").update(payload).eq("id", existingLesson.id);
        if (error) return showMessage(error.message, "error");
        showMessage("Lesson updated.", "success");
      } else {
        const { error } = await supabaseClient
          .from("lessons")
          .insert({ ...payload, module_id: mod.id, position: mod.lessons.length + 1 });
        if (error) return showMessage(error.message, "error");
        showMessage("Lesson added.", "success");
      }
      refresh();
    });

    const modCard = document.querySelector(`.manage-module-card[data-module-id="${mod.id}"]`);
    modCard.insertBefore(form, modCard.querySelector(".btn-manage-add"));
    form.title.focus();
  }

  async function deleteLesson(lesson) {
    if (!window.confirm(`Delete "${lesson.title}"? This can't be undone.`)) return;
    const { error } = await supabaseClient.from("lessons").delete().eq("id", lesson.id);
    if (error) return showMessage(error.message, "error");
    showMessage("Lesson deleted.", "success");
    refresh();
  }

  async function reorderLessons(items) {
    const ids = items.map((el) => el.dataset.lessonId);
    await Promise.all(
      ids.map((id, index) => supabaseClient.from("lessons").update({ position: index + 1 }).eq("id", id))
    );
    refresh();
  }

  const course = await loadCourse();
  if (!course) return;
  courseId = course.id;
  refresh();
}

if (manageRoot) {
  initManage();
}
