const accountRoot = document.getElementById("accountRoot");

async function initAccount() {
  const { data: { session } } = await supabaseClient.auth.getSession();
  if (!session) {
    window.location.href = "login.html";
    return;
  }

  const messageEl = document.getElementById("formMessage");
  function showMessage(text, type) {
    messageEl.textContent = text;
    messageEl.className = "form-message " + type;
  }

  const preview = document.getElementById("avatarPreview");
  function renderAvatarPreview(url, name) {
    if (url) {
      preview.style.backgroundImage = `url("${url}")`;
      preview.textContent = "";
    } else {
      preview.style.backgroundImage = "";
      preview.textContent = ((name || session.user.email).trim()[0] || "?").toUpperCase();
    }
  }

  const { data: profile, error: profileError } = await supabaseClient
    .from("profiles")
    .select("full_name, email, avatar_url, phone")
    .eq("id", session.user.id)
    .single();

  if (profileError) {
    showMessage("Could not load your profile: " + profileError.message, "error");
  }

  const currentFullName = (profile && profile.full_name) || "";
  document.getElementById("fullName").value = currentFullName;
  document.getElementById("phone").value = (profile && profile.phone) || "";
  document.getElementById("currentEmailDisplay").textContent = session.user.email;

  let pendingAvatarUrl = (profile && profile.avatar_url) || null;
  renderAvatarPreview(pendingAvatarUrl, currentFullName);

  document.getElementById("avatarInput").addEventListener("change", async (e) => {
    const file = e.target.files[0];
    if (!file) return;

    const filePath = `${session.user.id}/${Date.now()}-${file.name}`;
    const { error: uploadError } = await supabaseClient.storage
      .from("avatars")
      .upload(filePath, file, { upsert: true });

    if (uploadError) {
      showMessage("Could not upload photo: " + uploadError.message, "error");
      return;
    }

    const { data: urlData } = supabaseClient.storage.from("avatars").getPublicUrl(filePath);
    pendingAvatarUrl = urlData.publicUrl;
    renderAvatarPreview(pendingAvatarUrl, document.getElementById("fullName").value);
    showMessage("Photo uploaded — click Save Changes to apply it.", "success");
  });

  document.getElementById("profileForm").addEventListener("submit", async (e) => {
    e.preventDefault();
    const fullName = document.getElementById("fullName").value.trim();
    const phone = document.getElementById("phone").value.trim();

    const { error } = await supabaseClient
      .from("profiles")
      .update({ full_name: fullName, phone: phone || null, avatar_url: pendingAvatarUrl })
      .eq("id", session.user.id);

    if (error) {
      showMessage(error.message, "error");
      return;
    }

    await supabaseClient.auth.updateUser({ data: { full_name: fullName } });
    showMessage("Profile updated.", "success");
  });

  document.getElementById("emailForm").addEventListener("submit", async (e) => {
    e.preventDefault();
    const newEmail = document.getElementById("newEmail").value.trim();

    if (!newEmail || newEmail === session.user.email) {
      showMessage("Enter a different email address.", "error");
      return;
    }

    const { error } = await supabaseClient.auth.updateUser({ email: newEmail });
    if (error) {
      showMessage(error.message, "error");
      return;
    }

    showMessage(`Confirmation link sent to ${newEmail}. Your email won't change until you click it.`, "success");
    e.target.reset();
  });

  document.getElementById("passwordForm").addEventListener("submit", async (e) => {
    e.preventDefault();
    const newPassword = document.getElementById("newPassword").value;
    const confirmPassword = document.getElementById("confirmPassword").value;

    if (newPassword !== confirmPassword) {
      showMessage("Passwords do not match.", "error");
      return;
    }

    const { error } = await supabaseClient.auth.updateUser({ password: newPassword });
    if (error) {
      showMessage(error.message, "error");
      return;
    }

    showMessage("Password updated.", "success");
    e.target.reset();
  });
}

if (accountRoot) {
  initAccount();
}
