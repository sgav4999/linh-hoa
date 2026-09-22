-- Read-only. Triages every text lesson by size/density so we can spot
-- likely candidates for splitting, without pasting full lesson bodies.
select
  m.title as module_title,
  l.title as lesson_title,
  l.duration,
  length(l.content) as content_chars,
  (length(l.content) - length(replace(l.content, '<p>', ''))) / length('<p>') as p_count,
  (length(l.content) - length(replace(l.content, '<h3>', ''))) / length('<h3>') as h3_sections,
  (length(l.content) - length(replace(l.content, 'lesson-quiz-item', ''))) / length('lesson-quiz-item') as quiz_questions
from public.lessons l
join public.modules m on m.id = l.module_id
where l.type != 'video' or l.type is null
order by content_chars desc;
