// ============================================================
// COURSE CONTENT — edit this file to add your real course.
// Replace the example modules/lessons below with your actual curriculum.
//
// Each lesson needs:
//   id          — unique string, no spaces (used to track progress)
//   title       — plain text only (no HTML), shown in the sidebar
//                 and lesson header — use "&" not "&amp;"
//   duration    — plain text, e.g. "12 min"
//   type        — "video" or "text"
//   videoUrl    — (type: "video" only) an embeddable URL, e.g.
//                 a YouTube/Vimeo/Loom "embed" link
//   content     — (type: "text" only) HTML shown in the lesson body.
//                 You can use <p>, <h3>, <ul><li>, <strong>, etc.
//   description — plain text, one line shown under the lesson title
//                 (optional)
// ============================================================

const COURSE_DATA = {
  id: "life-health-combo",
  title: "Life & Health Combo",

  modules: [
    {
      title: "Module 1: Getting Started",
      lessons: [
        {
          id: "m1-l1",
          title: "Welcome to the Course",
          duration: "5 min",
          type: "video",
          videoUrl: "https://www.youtube.com/embed/REPLACE_WITH_YOUR_VIDEO_ID",
          description: "An overview of what you'll learn and how the course is organized."
        },
        {
          id: "m1-l2",
          title: "How Licensing Works in Your State",
          duration: "10 min",
          type: "text",
          description: "What to expect from the exam and application process.",
          content: "<p>Replace this with your real lesson text. You can use basic HTML tags like paragraphs, lists, and bold text.</p><ul><li>Point one</li><li>Point two</li></ul>"
        }
      ]
    },
    {
      title: "Module 2: Life Insurance Fundamentals",
      lessons: [
        {
          id: "m2-l1",
          title: "Types of Life Insurance Policies",
          duration: "15 min",
          type: "video",
          videoUrl: "https://www.youtube.com/embed/REPLACE_WITH_YOUR_VIDEO_ID",
          description: "Term, whole, universal, and variable life policies explained."
        },
        {
          id: "m2-l2",
          title: "Underwriting Basics",
          duration: "12 min",
          type: "text",
          content: "<p>Replace this with your real lesson text.</p>"
        }
      ]
    },
    {
      title: "Module 3: Health Insurance Fundamentals",
      lessons: [
        {
          id: "m3-l1",
          title: "Major Medical & HMOs",
          duration: "14 min",
          type: "video",
          videoUrl: "https://www.youtube.com/embed/REPLACE_WITH_YOUR_VIDEO_ID"
        },
        {
          id: "m3-l2",
          title: "Long-Term Care Coverage",
          duration: "9 min",
          type: "text",
          content: "<p>Replace this with your real lesson text.</p>"
        }
      ]
    }
  ]
};
