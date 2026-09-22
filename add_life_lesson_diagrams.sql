-- Inserts the two real diagrams found in the source Life doc (Cost of Term
-- Life Insurance by gender, and the Annually-Renewable-vs-Level-Premium
-- chart) into the "Types of Life Insurance" lesson, right where they sat
-- in the original document — between the three term-insurance bullets and
-- the "Second Type: Permanent" paragraph.
--
-- (General.docx had no embedded images at all, and Health.docx's two
-- images were just a decorative bullet icon repeated twice — no real
-- diagrams to add from those two.)
--
-- Uses replace(), so it's safe to run more than once against a course
-- pool that already has it (the anchor text won't be found a second time
-- once the figures are already inserted, so it becomes a no-op).
-- Run in the Supabase SQL Editor, "without RLS" mode.

update public.lessons
set content = replace(
  content,
  '</ul>
<p><strong>The Second Type: Permanent</strong>',
  '</ul>
<figure>
<img src="assets/lessons/term-life-cost-by-gender.png" alt="Line chart showing the cost of term life insurance rising with age for both men and women, with women''s premiums consistently lower than men''s at every age from 25 to 60.">
<figcaption>Term life premiums rise sharply with age, and are consistently lower for women than men.</figcaption>
</figure>
<figure>
<img src="assets/lessons/term-life-premium-comparison.png" alt="Chart comparing premium structures for a $500,000 policy: Annually Renewable Term starts low but rises steeply with age, while 20-year and 30-year Level Premium Term stay flat.">
<figcaption>Annually Renewable Term starts cheap but climbs fast — Level Term trades a higher starting premium for a flat rate across the whole term.</figcaption>
</figure>
<p><strong>The Second Type: Permanent</strong>'
)
where title = 'Types of Life Insurance'
  and content like '%The Second Type: Permanent%'
  and content not like '%term-life-cost-by-gender.png%';

-- Verify: should list every course pool it landed in (life and the combo course).
select module_id, title, content like '%term-life-cost-by-gender.png%' as has_diagrams
from public.lessons
where title = 'Types of Life Insurance';
