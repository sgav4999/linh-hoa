const studentsRoot = document.getElementById("studentsRoot");

async function initStudents() {
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
  const tbody = document.getElementById("studentsTableBody");
  const statsEl = document.getElementById("studentStats");
  const searchInput = document.getElementById("studentSearch");
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
      td.colSpan = 4;
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

      tr.appendChild(nameTd);
      tr.appendChild(emailTd);
      tr.appendChild(roleTd);
      tr.appendChild(joinedTd);
      tbody.appendChild(tr);
    });
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
