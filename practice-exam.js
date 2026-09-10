const examRoot = document.getElementById("examRoot");

async function initExam() {
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

  const { data: questions, error } = await supabaseClient
    .from("practice_questions")
    .select("id, question, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation")
    .order("position");

  if (error) {
    showMessage("Could not load practice questions: " + error.message, "error");
    return;
  }

  if (!questions || !questions.length) {
    document.getElementById("examIntroText").textContent = "No practice questions have been added yet. Check back soon.";
    document.getElementById("startExamBtn").disabled = true;
    return;
  }

  document.getElementById("examIntroText").textContent =
    `${questions.length} question${questions.length === 1 ? "" : "s"}. Answer them all, then see your score and review anything you missed.`;

  let currentIndex = 0;
  let answers = new Array(questions.length).fill(null);
  let timerInterval = null;
  let startTime = null;
  let elapsedSeconds = 0;

  function formatTime(totalSeconds) {
    const m = Math.floor(totalSeconds / 60);
    const s = totalSeconds % 60;
    return `${m}:${s.toString().padStart(2, "0")}`;
  }

  function startTimer() {
    startTime = Date.now();
    elapsedSeconds = 0;
    document.getElementById("examTimer").textContent = "0:00";
    timerInterval = setInterval(() => {
      elapsedSeconds = Math.floor((Date.now() - startTime) / 1000);
      document.getElementById("examTimer").textContent = formatTime(elapsedSeconds);
    }, 1000);
  }

  function stopTimer() {
    clearInterval(timerInterval);
  }

  function renderQuestion() {
    const q = questions[currentIndex];
    document.getElementById("examProgress").textContent = `Question ${currentIndex + 1} of ${questions.length}`;
    document.getElementById("examProgressFill").style.width = `${((currentIndex + 1) / questions.length) * 100}%`;
    document.getElementById("examQuestionText").textContent = q.question;

    const optionsEl = document.getElementById("examOptions");
    optionsEl.innerHTML = "";
    ["a", "b", "c", "d"].forEach((letter) => {
      const option = document.createElement("label");
      option.className = "quiz-option";
      if (answers[currentIndex] === letter) option.classList.add("selected");

      const input = document.createElement("input");
      input.type = "radio";
      input.name = "examOption";
      input.value = letter;
      input.checked = answers[currentIndex] === letter;
      input.addEventListener("change", () => {
        answers[currentIndex] = letter;
        renderQuestion();
      });

      const text = document.createElement("span");
      text.textContent = q["choice_" + letter];

      option.appendChild(input);
      option.appendChild(text);
      optionsEl.appendChild(option);
    });

    const prevBtn = document.getElementById("examPrevBtn");
    const nextBtn = document.getElementById("examNextBtn");
    prevBtn.disabled = currentIndex === 0;
    nextBtn.textContent = currentIndex === questions.length - 1 ? "Submit Exam" : "Next →";
  }

  document.getElementById("examPrevBtn").addEventListener("click", () => {
    if (currentIndex > 0) {
      currentIndex--;
      renderQuestion();
    }
  });

  document.getElementById("examNextBtn").addEventListener("click", () => {
    if (currentIndex < questions.length - 1) {
      currentIndex++;
      renderQuestion();
    } else {
      submitExam();
    }
  });

  function submitExam() {
    stopTimer();
    document.getElementById("examQuiz").hidden = true;
    document.getElementById("examResults").hidden = false;

    let correctCount = 0;
    questions.forEach((q, i) => {
      if (answers[i] === q.correct_choice) correctCount++;
    });
    const percent = Math.round((correctCount / questions.length) * 100);

    document.getElementById("examScorePercent").textContent = `${percent}%`;
    document.getElementById("examScoreLabel").textContent = `${correctCount} of ${questions.length} correct`;
    document.getElementById("examTimeTaken").textContent = `Completed in ${formatTime(elapsedSeconds)}`;

    const reviewEl = document.getElementById("examReview");
    reviewEl.innerHTML = "";
    questions.forEach((q, i) => {
      const isCorrect = answers[i] === q.correct_choice;

      const item = document.createElement("div");
      item.className = "review-item " + (isCorrect ? "review-correct" : "review-incorrect");

      const qText = document.createElement("p");
      qText.className = "review-question";
      qText.textContent = `${i + 1}. ${q.question}`;
      item.appendChild(qText);

      const yourAnswer = document.createElement("p");
      yourAnswer.className = "review-answer";
      yourAnswer.textContent = answers[i]
        ? `Your answer: ${answers[i].toUpperCase()}. ${q["choice_" + answers[i]]}`
        : "Your answer: (skipped)";
      item.appendChild(yourAnswer);

      if (!isCorrect) {
        const correctAnswer = document.createElement("p");
        correctAnswer.className = "review-correct-answer";
        correctAnswer.textContent = `Correct answer: ${q.correct_choice.toUpperCase()}. ${q["choice_" + q.correct_choice]}`;
        item.appendChild(correctAnswer);
      }

      if (q.explanation) {
        const explanation = document.createElement("p");
        explanation.className = "review-explanation";
        explanation.textContent = q.explanation;
        item.appendChild(explanation);
      }

      reviewEl.appendChild(item);
    });
  }

  document.getElementById("startExamBtn").addEventListener("click", () => {
    document.getElementById("examIntro").hidden = true;
    document.getElementById("examResults").hidden = true;
    document.getElementById("examQuiz").hidden = false;
    currentIndex = 0;
    answers = new Array(questions.length).fill(null);
    startTimer();
    renderQuestion();
  });

  document.getElementById("retakeExamBtn").addEventListener("click", () => {
    document.getElementById("examResults").hidden = true;
    document.getElementById("examIntro").hidden = false;
  });
}

if (examRoot) {
  initExam();
}
