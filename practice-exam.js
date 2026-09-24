const examRoot = document.getElementById("examRoot");
const EXAM_COURSE_SLUG = new URLSearchParams(window.location.search).get("course") || "life-health-combo";

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

  const { data: course, error: courseError } = await supabaseClient
    .from("courses")
    .select("id, title")
    .eq("slug", EXAM_COURSE_SLUG)
    .single();

  if (courseError || !course) {
    showMessage("Could not load this course.", "error");
    return;
  }

  document.getElementById("examEyebrow").textContent = "Practice Exam · " + course.title;

  const { data: questions, error } = await supabaseClient
    .from("practice_questions")
    .select("id, question, choice_a, choice_b, choice_c, choice_d, correct_choice, explanation")
    .eq("course_id", course.id)
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
  let submitted = new Array(questions.length).fill(false);
  let optionOrders = questions.map(() => ["a", "b", "c", "d"]);
  let timerInterval = null;
  let startTime = null;
  let elapsedSeconds = 0;

  function shuffle(arr) {
    for (let i = arr.length - 1; i > 0; i--) {
      const j = Math.floor(Math.random() * (i + 1));
      [arr[i], arr[j]] = [arr[j], arr[i]];
    }
    return arr;
  }

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
    const isSubmitted = submitted[currentIndex];
    document.getElementById("examProgress").textContent = `Question ${currentIndex + 1} of ${questions.length}`;
    document.getElementById("examProgressFill").style.width = `${((currentIndex + 1) / questions.length) * 100}%`;
    document.getElementById("examQuestionText").textContent = q.question;

    if (window.TTS) {
      TTS.stop();
      const listenContainer = document.getElementById("examListenContainer");
      listenContainer.innerHTML = "";
      const listenBtn = TTS.attach(() => getExamListenText(currentIndex), { title: "Listen to this question" });
      if (listenBtn) listenContainer.appendChild(listenBtn);
    }

    const optionsEl = document.getElementById("examOptions");
    optionsEl.innerHTML = "";
    optionOrders[currentIndex].forEach((letter) => {
      const option = document.createElement("label");
      option.className = "quiz-option";
      if (answers[currentIndex] === letter) option.classList.add("selected");

      if (isSubmitted) {
        option.classList.add("locked");
        if (letter === q.correct_choice) option.classList.add("correct");
        else if (letter === answers[currentIndex]) option.classList.add("incorrect");
      }

      const input = document.createElement("input");
      input.type = "radio";
      input.name = "examOption";
      input.value = letter;
      input.checked = answers[currentIndex] === letter;
      input.disabled = isSubmitted;
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

    const checkBtn = document.getElementById("examCheckBtn");
    const feedback = document.getElementById("examFeedback");
    const explanation = document.getElementById("examExplanation");

    if (isSubmitted) {
      checkBtn.hidden = true;
      const isCorrect = answers[currentIndex] === q.correct_choice;
      feedback.hidden = false;
      feedback.className = "lesson-quiz-feedback " + (isCorrect ? "correct" : "incorrect");
      feedback.textContent = isCorrect
        ? "Correct!"
        : `Incorrect. Correct answer: ${q.correct_choice.toUpperCase()}) ${q["choice_" + q.correct_choice]}`;
      if (!isCorrect && q.explanation) {
        explanation.hidden = false;
        explanation.textContent = q.explanation;
      } else {
        explanation.hidden = true;
      }
    } else {
      checkBtn.hidden = false;
      checkBtn.disabled = !answers[currentIndex];
      feedback.hidden = true;
      explanation.hidden = true;
    }

    const prevBtn = document.getElementById("examPrevBtn");
    const nextBtn = document.getElementById("examNextBtn");
    prevBtn.disabled = currentIndex === 0;
    nextBtn.textContent = currentIndex === questions.length - 1 ? "Finish" : "Next →";
  }

  // Built manually rather than read off the DOM, since the on-screen
  // options have no "A)"/"B)" prefix — only spoken aloud does.
  function getExamListenText(index) {
    const q = questions[index];
    const parts = [q.question];
    optionOrders[index].forEach((letter) => {
      if (q["choice_" + letter]) parts.push(letter.toUpperCase() + ". " + q["choice_" + letter]);
    });
    const feedback = document.getElementById("examFeedback");
    if (!feedback.hidden) parts.push(feedback.textContent);
    const explanation = document.getElementById("examExplanation");
    if (!explanation.hidden) parts.push("Explanation: " + explanation.textContent);
    return parts.join(". ");
  }

  document.getElementById("examCheckBtn").addEventListener("click", () => {
    if (!answers[currentIndex]) return;
    submitted[currentIndex] = true;
    renderQuestion();
  });

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
    if (window.TTS) TTS.stop();
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
    shuffle(questions);
    optionOrders = questions.map(() => shuffle(["a", "b", "c", "d"]));
    currentIndex = 0;
    answers = new Array(questions.length).fill(null);
    submitted = new Array(questions.length).fill(false);
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
