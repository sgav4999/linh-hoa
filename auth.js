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
  const roleCards = signupForm.querySelectorAll(".role-card");
  roleCards.forEach((card) => {
    card.addEventListener("click", () => {
      roleCards.forEach((c) => c.classList.remove("selected"));
      card.classList.add("selected");
      card.querySelector('input[type="radio"]').checked = true;
    });
  });

  signupForm.addEventListener("submit", async (e) => {
    e.preventDefault();
    const messageEl = document.getElementById("formMessage");
    const fullName = document.getElementById("fullName").value.trim();
    const email = document.getElementById("email").value.trim();
    const password = document.getElementById("password").value;
    const confirmPassword = document.getElementById("confirmPassword").value;
    const roleInput = signupForm.querySelector('input[name="role"]:checked');
    const role = roleInput ? roleInput.value : "student";

    if (password !== confirmPassword) {
      showMessage(messageEl, "Passwords do not match.", "error");
      return;
    }

    const submitBtn = signupForm.querySelector('button[type="submit"]');
    setLoading(submitBtn, true, "Creating account...", "Create Account");

    const { data, error } = await supabaseClient.auth.signUp({
      email,
      password,
      options: { data: { full_name: fullName, role: role } },
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
      roleCards.forEach((c) => c.classList.remove("selected"));
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
    const role = user.user_metadata && user.user_metadata.role === "staff" ? "staff" : "student";

    document.getElementById("userName").textContent = (user.user_metadata && user.user_metadata.full_name) || user.email;
    document.getElementById("userEmail").textContent = user.email;

    const roleBadge = document.getElementById("userRole");
    roleBadge.textContent = role === "staff" ? "Staff" : "Student";
    roleBadge.classList.add(role === "staff" ? "role-badge-staff" : "role-badge-student");

    document.querySelectorAll(".student-only").forEach((el) => {
      el.style.display = role === "staff" ? "none" : "";
    });
    document.querySelectorAll(".staff-only").forEach((el) => {
      el.style.display = role === "staff" ? "" : "none";
    });
  })();

  const logoutBtn = document.getElementById("logoutBtn");
  if (logoutBtn) {
    logoutBtn.addEventListener("click", async () => {
      await supabaseClient.auth.signOut();
      window.location.href = "login.html";
    });
  }
}
