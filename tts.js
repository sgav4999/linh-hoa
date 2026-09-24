// Thin wrapper around the browser's built-in SpeechSynthesis API, shared by
// lesson pages, progress-check quizzes, and the practice exam. No external
// API, no cost — voice quality depends on the visitor's browser/OS.
window.TTS = (() => {
  const supported = "speechSynthesis" in window && "SpeechSynthesisUtterance" in window;
  let activeButton = null;

  function setButtonState(btn, speaking) {
    btn.classList.toggle("is-speaking", speaking);
    btn.setAttribute("aria-label", speaking ? "Stop reading aloud" : "Read aloud");
  }

  function stop() {
    if (supported) window.speechSynthesis.cancel();
    if (activeButton) setButtonState(activeButton, false);
    activeButton = null;
  }

  function speak(getText, btn) {
    if (!supported) return;
    const resumingSameButton = activeButton === btn;
    stop();
    if (resumingSameButton) return; // clicking the same button again just stops it

    const text = (typeof getText === "function" ? getText() : getText || "").trim();
    if (!text) return;

    const utterance = new SpeechSynthesisUtterance(text);
    utterance.rate = 1;
    const clear = () => {
      if (activeButton === btn) {
        setButtonState(btn, false);
        activeButton = null;
      }
    };
    utterance.onend = clear;
    utterance.onerror = clear;

    activeButton = btn;
    setButtonState(btn, true);
    window.speechSynthesis.speak(utterance);
  }

  function makeButton(small) {
    const btn = document.createElement("button");
    btn.type = "button";
    btn.className = small ? "btn-listen btn-listen-sm" : "btn-listen";
    btn.innerHTML =
      '<svg class="listen-icon-play" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M11 5 6 9H2v6h4l5 4V5Z"/><path d="M15.5 8.5a5 5 0 0 1 0 7"/><path d="M18.5 5.5a9 9 0 0 1 0 13"/></svg>' +
      '<svg class="listen-icon-stop" viewBox="0 0 24 24" fill="currentColor"><rect x="6" y="6" width="12" height="12" rx="2"/></svg>' +
      (small ? "" : '<span class="listen-label">Listen</span><span class="listen-label-stop">Stop</span>');
    setButtonState(btn, false);
    return btn;
  }

  // Creates a listen button wired to read whatever getText() returns at
  // click time (so it naturally picks up content that's hidden until an
  // answer is checked). Returns the button, or null if TTS isn't supported.
  function attach(getText, opts) {
    if (!supported) return null;
    const options = opts || {};
    const btn = makeButton(!!options.small);
    if (options.title) btn.title = options.title;
    btn.addEventListener("click", (e) => {
      e.preventDefault();
      speak(getText, btn);
    });
    return btn;
  }

  return { supported, speak, stop, attach };
})();
