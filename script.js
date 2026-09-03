document.getElementById("year").textContent = new Date().getFullYear();

const navToggle = document.getElementById("navToggle");
const navWrap = document.getElementById("navWrap");

if (navToggle && navWrap) {
  navToggle.addEventListener("click", () => {
    navWrap.classList.toggle("open");
  });
}

// Animate a stat number (e.g. "12,000+", "95%") from 0 up to its target value.
function animateStatNumber(el) {
  const text = el.textContent.trim();
  const match = text.match(/^([^\d]*)([\d,]+)(.*)$/);
  if (!match) return;

  const [, prefix, numStr, suffix] = match;
  if (suffix.startsWith("/")) return; // skip odd formats like "24/7"

  const target = parseInt(numStr.replace(/,/g, ""), 10);
  if (isNaN(target)) return;

  const duration = 1100;
  const start = performance.now();

  function tick(now) {
    const progress = Math.min((now - start) / duration, 1);
    const eased = 1 - Math.pow(1 - progress, 3);
    const current = Math.round(target * eased);
    el.textContent = prefix + current.toLocaleString() + suffix;
    if (progress < 1) requestAnimationFrame(tick);
  }

  requestAnimationFrame(tick);
}

// Scroll-reveal + stat count-up, both gated on the same intersection check.
const revealEls = document.querySelectorAll(".reveal:not(.visible)");
const prefersReducedMotion = window.matchMedia("(prefers-reduced-motion: reduce)").matches;

if (prefersReducedMotion) {
  revealEls.forEach((el) => el.classList.add("visible"));
  document.querySelectorAll(".stat-num").forEach((el) => {}); // leave static text as-is
} else if ("IntersectionObserver" in window && revealEls.length) {
  const observer = new IntersectionObserver(
    (entries) => {
      entries.forEach((entry) => {
        if (!entry.isIntersecting) return;
        entry.target.classList.add("visible");
        const statNum = entry.target.matches(".stat-num")
          ? entry.target
          : entry.target.querySelector(".stat-num");
        if (statNum) animateStatNumber(statNum);
        observer.unobserve(entry.target);
      });
    },
    { threshold: 0.2 }
  );
  revealEls.forEach((el) => observer.observe(el));
} else {
  revealEls.forEach((el) => el.classList.add("visible"));
}
