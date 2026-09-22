const studentsRoot = document.getElementById("studentsRoot");

async function initStudents() {
  const { data: { session } } = await supabaseClient.auth.getSession();
  if (!session) {
    window.location.href = "login.html";
    return;
  }
  const role = session.user.app_metadata && session.user.app_metadata.role;
  if (role !== "staff") {
    window.location.href = "dashboard.html";
    return;
  }

  const messageEl = document.getElementById("formMessage");
  const tbody = document.getElementById("studentsTableBody");
  const statsEl = document.getElementById("studentStats");
  const searchInput = document.getElementById("studentSearch");
  const currentUserId = session.user.id;
  let profiles = [];

  function showMessage(text, type) {
    messageEl.textContent = text;
    messageEl.className = "form-message " + type;
  }

  function formatDate(iso) {
    if (!iso) return "";
    return new Date(iso).toLocaleDateString(undefined, { year: "numeric", month: "short", day: "numeric" });
  }

  function renderRows(rows) {
    tbody.innerHTML = "";

    if (!rows.length) {
      const tr = document.createElement("tr");
      const td = document.createElement("td");
      td.colSpan = 5;
      td.className = "students-empty";
      td.textContent = "No accounts match your search.";
      tr.appendChild(td);
      tbody.appendChild(tr);
      return;
    }

    rows.forEach((p) => {
      const tr = document.createElement("tr");

      const nameTd = document.createElement("td");
      nameTd.textContent = p.full_name || "—";

      const emailTd = document.createElement("td");
      emailTd.textContent = p.email;

      const roleTd = document.createElement("td");
      const badge = document.createElement("span");
      badge.className = "role-badge " + (p.role === "staff" ? "role-badge-staff" : "role-badge-student");
      badge.textContent = p.role === "staff" ? "Staff" : "Student";
      roleTd.appendChild(badge);

      const joinedTd = document.createElement("td");
      joinedTd.textContent = formatDate(p.created_at);

      const actionsTd = document.createElement("td");
      if (p.id === currentUserId) {
        actionsTd.textContent = "—";
      } else {
        const actionBtn = document.createElement("button");
        actionBtn.type = "button";
        const promoting = p.role !== "staff";
        actionBtn.className = "btn-manage" + (promoting ? "" : " btn-manage-danger");
        actionBtn.textContent = promoting ? "Promote to Staff" : "Demote to Student";
        actionBtn.addEventListener("click", () => handleRoleChange(p, actionBtn));
        actionsTd.appendChild(actionBtn);
      }

      tr.appendChild(nameTd);
      tr.appendChild(emailTd);
      tr.appendChild(roleTd);
      tr.appendChild(joinedTd);
      tr.appendChild(actionsTd);
      tbody.appendChild(tr);
    });
  }

  async function handleRoleChange(profile, btn) {
    const action = profile.role === "staff" ? "demote" : "promote";
    const verb = action === "promote" ? "Promote" : "Demote";
    const confirmed = window.confirm(
      `${verb} ${profile.email} ${action === "promote" ? "to staff" : "to a student"}?`
    );
    if (!confirmed) return;

    btn.disabled = true;
    const { data, error } = await supabaseClient.functions.invoke("set-staff-role", {
      body: { email: profile.email, action },
    });

    if (error) {
      let msg = error.message;
      try {
        if (error.context && typeof error.context.json === "function") {
          const body = await error.context.json();
          if (body && body.error) msg = body.error;
        }
      } catch (_) {
        // fall back to error.message
      }
      showMessage(msg || "Could not update that account's role.", "error");
      btn.disabled = false;
      return;
    }
    if (data && data.error) {
      showMessage(data.error, "error");
      btn.disabled = false;
      return;
    }

    profile.role = data.role;
    showMessage(`${profile.email} is now ${data.role === "staff" ? "staff" : "a student"}.`, "success");
    renderStats(profiles);
    applySearch();
  }

  function renderStats(rows) {
    const studentCount = rows.filter((p) => p.role !== "staff").length;
    const staffCount = rows.filter((p) => p.role === "staff").length;
    statsEl.textContent = `${studentCount} student${studentCount === 1 ? "" : "s"} · ${staffCount} staff`;
  }

  function applySearch() {
    const query = searchInput.value.trim().toLowerCase();
    if (!query) {
      renderRows(profiles);
      return;
    }
    const filtered = profiles.filter(
      (p) =>
        (p.full_name && p.full_name.toLowerCase().includes(query)) ||
        p.email.toLowerCase().includes(query)
    );
    renderRows(filtered);
  }

  searchInput.addEventListener("input", applySearch);

  const { data, error } = await supabaseClient
    .from("profiles")
    .select("id, email, full_name, role, created_at")
    .order("created_at", { ascending: false });

  if (error) {
    showMessage("Could not load students: " + error.message, "error");
    return;
  }

  profiles = data || [];
  renderStats(profiles);
  renderRows(profiles);
}

if (studentsRoot) {
  initStudents();
}
