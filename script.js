document.getElementById("year").textContent = new Date().getFullYear();

const navToggle = document.getElementById("navToggle");
const navWrap = document.getElementById("navWrap");

if (navToggle && navWrap) {
  navToggle.addEventListener("click", () => {
    navWrap.classList.toggle("open");
  });
}
