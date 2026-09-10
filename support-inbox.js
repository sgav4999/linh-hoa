const inboxRoot = document.getElementById("inboxRoot");

async function initInbox() {
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
  const listEl = document.getElementById("inboxList");
  const statsEl = document.getElementById("inboxStats");
  const filterBtns = document.querySelectorAll(".inbox-filter-btn");
  let submissions = [];
  let currentFilter = "all";

  function showMessage(text, type) {
    messageEl.textContent = text;
    messageEl.className = "form-message " + type;
  }

  function formatDate(iso) {
    return new Date(iso).toLocaleString(undefined, {
      year: "numeric",
      month: "short",
      day: "numeric",
      hour: "numeric",
      minute: "2-digit",
    });
  }

  function renderStats() {
    const newCount = submissions.filter((s) => s.status !== "resolved").length;
    statsEl.textContent = `${submissions.length} total · ${newCount} new`;
  }

  function renderList() {
    listEl.innerHTML = "";
    const filtered = submissions.filter((s) => {
      if (currentFilter === "new") return s.status !== "resolved";
      if (currentFilter === "resolved") return s.status === "resolved";
      return true;
    });

    if (!filtered.length) {
      const empty = document.createElement("p");
      empty.className = "manage-empty";
      empty.textContent = "No messages here.";
      listEl.appendChild(empty);
      return;
    }

    filtered.forEach((s) => {
      const card = document.createElement("div");
      card.className = "inbox-card";

      const header = document.createElement("div");
      header.className = "inbox-card-header";

      const who = document.createElement("div");
      const nameEl = document.createElement("strong");
      nameEl.textContent = s.name;
      const emailLink = document.createElement("a");
      emailLink.href = `mailto:${s.email}?subject=${encodeURIComponent("Re: " + (s.reason || "Your message to Linh Hoa"))}`;
      emailLink.textContent = s.email;
      emailLink.className = "inbox-email-link";
      who.appendChild(nameEl);
      who.appendChild(document.createElement("br"));
      who.appendChild(emailLink);

      const badge = document.createElement("span");
      badge.className = "inbox-status-badge " + (s.status === "resolved" ? "inbox-status-resolved" : "inbox-status-new");
      badge.textContent = s.status === "resolved" ? "Resolved" : "New";

      header.appendChild(who);
      header.appendChild(badge);

      const meta = document.createElement("div");
      meta.className = "inbox-meta";
      meta.textContent = `${s.reason || "General question"} · ${formatDate(s.created_at)}`;

      const message = document.createElement("p");
      message.className = "inbox-message";
      message.textContent = s.message;

      const actions = document.createElement("div");
      actions.className = "manage-actions";

      const toggleBtn = document.createElement("button");
      toggleBtn.type = "button";
      toggleBtn.className = "btn-manage";
      toggleBtn.textContent = s.status === "resolved" ? "Mark as New" : "Mark Resolved";
      toggleBtn.addEventListener("click", () => toggleStatus(s));

      const deleteBtn = document.createElement("button");
      deleteBtn.type = "button";
      deleteBtn.className = "btn-manage btn-manage-danger";
      deleteBtn.textContent = "Delete";
      deleteBtn.addEventListener("click", () => deleteSubmission(s));

      actions.appendChild(toggleBtn);
      actions.appendChild(deleteBtn);

      card.appendChild(header);
      card.appendChild(meta);
      card.appendChild(message);
      card.appendChild(actions);
      listEl.appendChild(card);
    });
  }

  filterBtns.forEach((btn) => {
    btn.addEventListener("click", () => {
      filterBtns.forEach((b) => b.classList.remove("active"));
      btn.classList.add("active");
      currentFilter = btn.dataset.filter;
      renderList();
    });
  });

  async function toggleStatus(submission) {
    const newStatus = submission.status === "resolved" ? "new" : "resolved";
    const { error } = await supabaseClient
      .from("contact_submissions")
      .update({ status: newStatus })
      .eq("id", submission.id);
    if (error) return showMessage(error.message, "error");
    submission.status = newStatus;
    renderStats();
    renderList();
  }

  async function deleteSubmission(submission) {
    if (!window.confirm(`Delete the message from "${submission.name}"? This can't be undone.`)) return;
    const { error } = await supabaseClient.from("contact_submissions").delete().eq("id", submission.id);
    if (error) return showMessage(error.message, "error");
    submissions = submissions.filter((s) => s.id !== submission.id);
    renderStats();
    renderList();
  }

  const { data, error } = await supabaseClient
    .from("contact_submissions")
    .select("id, name, email, reason, message, status, created_at")
    .order("created_at", { ascending: false });

  if (error) {
    showMessage("Could not load messages: " + error.message, "error");
    return;
  }

  submissions = data || [];
  renderStats();
  renderList();
}

if (inboxRoot) {
  initInbox();
}
