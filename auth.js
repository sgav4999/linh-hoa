const supabaseClient = window.supabase.createClient(SUPABASE_URL, SUPABASE_ANON_KEY);

function showMessage(el, text, type) {
  if (!el) return;
  el.textContent = text;
  el.className = "form-message " + type;
}

function setLoading(button, isLoading, loadingText, defaultText) {
  button.disabled = isLoading;
  button.textContent = isLoading ? loadingText : defaultText;
}

// Sign up form
const signupForm = document.getElementById("signupForm");
if (signupForm) {
  signupForm.addEventListener("submit", async (e) => {
    e.preventDefault();
    const messageEl = document.getElementById("formMessage");
    const fullName = document.getElementById("fullName").value.trim();
    const email = document.getElementById("email").value.trim();
    const password = document.getElementById("password").value;
    const confirmPassword = document.getElementById("confirmPassword").value;

    if (password !== confirmPassword) {
      showMessage(messageEl, "Passwords do not match.", "error");
      return;
    }

    const submitBtn = signupForm.querySelector('button[type="submit"]');
    setLoading(submitBtn, true, "Creating account...", "Create Account");

    // Every self-service signup is a student account. Admin access can
    // only be granted afterward by an existing admin (Enrolled Students
    // page) or directly in the Supabase dashboard — never by anything
    // the signing-up user submits here.
    const { data, error } = await supabaseClient.auth.signUp({
      email,
      password,
      options: { data: { full_name: fullName } },
    });

    setLoading(submitBtn, false, "Creating account...", "Create Account");

    if (error) {
      showMessage(messageEl, error.message, "error");
      return;
    }

    if (data.session) {
      window.location.href = "dashboard.html";
    } else {
      showMessage(messageEl, "Account created! Check your email to confirm it, then log in.", "success");
      signupForm.reset();
    }
  });
}

// Log in form
const loginForm = document.getElementById("loginForm");
if (loginForm) {
  loginForm.addEventListener("submit", async (e) => {
    e.preventDefault();
    const messageEl = document.getElementById("formMessage");
    const email = document.getElementById("email").value.trim();
    const password = document.getElementById("password").value;

    const submitBtn = loginForm.querySelector('button[type="submit"]');
    setLoading(submitBtn, true, "Logging in...", "Log In");

    const { error } = await supabaseClient.auth.signInWithPassword({ email, password });

    setLoading(submitBtn, false, "Logging in...", "Log In");

    if (error) {
      showMessage(messageEl, error.message, "error");
      return;
    }

    window.location.href = "dashboard.html";
  });
}

// Dashboard (gated page)
const dashboardRoot = document.getElementById("dashboardRoot");
if (dashboardRoot) {
  (async () => {
    const { data: { session } } = await supabaseClient.auth.getSession();
    if (!session) {
      window.location.href = "login.html";
      return;
    }

    const user = session.user;
    const role = user.app_metadata && user.app_metadata.role === "admin" ? "admin" : "student";

    document.getElementById("userName").textContent = (user.user_metadata && user.user_metadata.full_name) || user.email;
    document.getElementById("userEmail").textContent = user.email;

    const roleBadge = document.getElementById("userRole");
    roleBadge.textContent = role === "admin" ? "Admin" : "Student";
    roleBadge.classList.add(role === "admin" ? "role-badge-admin" : "role-badge-student");

    document.querySelectorAll(".student-only").forEach((el) => {
      el.style.display = role === "admin" ? "none" : "";
    });
    document.querySelectorAll(".admin-only").forEach((el) => {
      el.style.display = role === "admin" ? "" : "none";
    });
  })();
}

// Log out (shared across any page with a #logoutBtn)
const logoutBtn = document.getElementById("logoutBtn");
if (logoutBtn) {
  logoutBtn.addEventListener("click", async () => {
    await supabaseClient.auth.signOut();
    window.location.href = "login.html";
  });
}

// Header user menu: avatar + dropdown (Dashboard / Account Settings / Log Out).
// On marketing pages this also swaps out the Log In / Sign Up links.
const userMenuEl = document.getElementById("userMenu");
if (userMenuEl) {
  (async () => {
    const { data: { session } } = await supabaseClient.auth.getSession();
    if (!session) return;

    const loginLink = document.getElementById("navLoginLink");
    const signupLink = document.getElementById("navSignupLink");
    const themeToggleNav = document.getElementById("themeToggleNav");
    if (loginLink) loginLink.style.display = "none";
    if (signupLink) signupLink.style.display = "none";
    if (themeToggleNav) themeToggleNav.style.display = "none";
    userMenuEl.style.display = "";

    const { data: profile } = await supabaseClient
      .from("profiles")
      .select("full_name, email, avatar_url")
      .eq("id", session.user.id)
      .single();

    const name = (profile && profile.full_name) || session.user.email;
    const email = (profile && profile.email) || session.user.email;
    const avatarUrl = profile && profile.avatar_url;

    const nameEl = document.getElementById("userMenuName");
    const emailEl = document.getElementById("userMenuEmail");
    if (nameEl) nameEl.textContent = name;
    if (emailEl) emailEl.textContent = email;

    const avatarEl = document.getElementById("userAvatar");
    if (avatarEl) {
      if (avatarUrl) {
        avatarEl.style.backgroundImage = `url("${avatarUrl}")`;
        avatarEl.textContent = "";
      } else {
        avatarEl.textContent = name.trim().slice(0, 1).toUpperCase();
      }
    }
  })();

  const trigger = document.getElementById("userMenuTrigger");
  const dropdown = document.getElementById("userMenuDropdown");
  if (trigger && dropdown) {
    trigger.addEventListener("click", (e) => {
      e.stopPropagation();
      dropdown.hidden = !dropdown.hidden;
    });
    dropdown.addEventListener("click", (e) => e.stopPropagation());
    document.addEventListener("click", () => {
      dropdown.hidden = true;
    });
  }
}
