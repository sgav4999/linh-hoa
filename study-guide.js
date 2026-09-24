const studyGuideRoot = document.getElementById("studyGuideRoot");
const STUDY_GUIDE_COURSES = ["life", "health", "life-health-combo"];

// Condenses a lesson's HTML into its key facts: every bullet list item
// (already written as dense notes) plus any paragraph that defines a term
// (marked with <strong>). Embedded "Check Your Knowledge" quiz blocks are
// skipped — they're questions, not facts to study.
function extractKeyPoints(html) {
  const container = document.createElement("div");
  container.innerHTML = html || "";
  const points = [];
  Array.from(container.children).forEach((el) => {
    if (el.classList && el.classList.contains("lesson-quiz-item")) return;
    if (el.tagName === "H3" && /check your knowledge/i.test(el.textContent)) return;
    if (el.tagName === "UL" || el.tagName === "OL") {
      el.querySelectorAll(":scope > li").forEach((li) => points.push(li.innerHTML.trim()));
    } else if (el.tagName === "P" && el.querySelector("strong")) {
      points.push(el.innerHTML.trim());
    }
  });
  return points;
}

async function initStudyGuide() {
  const { data: { session } } = await supabaseClient.auth.getSession();
  if (!session) {
    window.location.href = "login.html";
    return;
  }

  const params = new URLSearchParams(window.location.search);
  let currentSlug = params.get("course") || "life-health-combo";
  if (!STUDY_GUIDE_COURSES.includes(currentSlug)) currentSlug = "life-health-combo";

  const tabsEl = document.getElementById("studyGuideTabs");
  const bodyEl = document.getElementById("studyGuideBody");

  function renderTabs() {
    tabsEl.querySelectorAll(".study-guide-tab").forEach((btn) => {
      btn.classList.toggle("active", btn.dataset.course === currentSlug);
    });
  }

  async function loadGuide(slug) {
    bodyEl.innerHTML = '<p class="study-guide-loading">Loading study guide...</p>';

    const { data: course, error: courseError } = await supabaseClient
      .from("courses")
      .select("id, title")
      .eq("slug", slug)
      .single();

    if (courseError || !course) {
      bodyEl.innerHTML = '<p class="study-guide-loading">This course could not be loaded.</p>';
      return;
    }

    document.getElementById("studyGuideEyebrow").textContent = "Study Guide · " + course.title;

    const { data: moduleRows, error: modulesError } = await supabaseClient
      .from("modules")
      .select("id, title, position, lessons(id, title, type, content, position)")
      .eq("course_id", course.id)
      .order("position")
      .order("position", { foreignTable: "lessons" });

    if (modulesError || !moduleRows || !moduleRows.length) {
      bodyEl.innerHTML = '<p class="study-guide-loading">No study guide content is available for this course yet.</p>';
      return;
    }

    bodyEl.innerHTML = "";
    moduleRows.forEach((mod) => {
      const lessonSections = mod.lessons
        .filter((lesson) => lesson.type !== "quiz")
        .map((lesson) => {
          const points = extractKeyPoints(lesson.content);
          if (!points.length) return "";
          return (
            '<div class="study-guide-lesson">' +
            "<h3>" + lesson.title + "</h3>" +
            "<ul>" + points.map((p) => "<li>" + p + "</li>").join("") + "</ul>" +
            "</div>"
          );
        })
        .join("");

      if (!lessonSections) return;

      const moduleSection = document.createElement("div");
      moduleSection.className = "study-guide-module";
      moduleSection.innerHTML = "<h2>" + mod.title + "</h2>" + lessonSections;
      bodyEl.appendChild(moduleSection);
    });

    if (!bodyEl.children.length) {
      bodyEl.innerHTML = '<p class="study-guide-loading">No study guide content is available for this course yet.</p>';
    }
  }

  tabsEl.querySelectorAll(".study-guide-tab").forEach((btn) => {
    btn.addEventListener("click", () => {
      if (btn.dataset.course === currentSlug) return;
      currentSlug = btn.dataset.course;
      const url = new URL(window.location.href);
      url.searchParams.set("course", currentSlug);
      window.history.replaceState(null, "", url);
      renderTabs();
      loadGuide(currentSlug);
    });
  });

  document.getElementById("printGuideBtn").addEventListener("click", () => window.print());

  renderTabs();
  loadGuide(currentSlug);
}

if (studyGuideRoot) {
  initStudyGuide();
}
