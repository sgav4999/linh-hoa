-- Adds the 20 content gaps found by auditing the source docs against
-- the shipped lesson content (3 General, 11 Health, 6 Life). Uses
-- replace(), guarded so re-running this file is a safe no-op.
-- Run in the Supabase SQL Editor, "without RLS" mode.

-- === GENERAL (3 entries) ===

update public.lessons
set content = replace(content, '<li><strong>Offer and Acceptance</strong>: insured needs to submit application request to buy (offer).</li>
</ul>', '<li><strong>Offer and Acceptance</strong>: insured needs to submit application request to buy (offer).</li>
</ul><p>A few more terms tied to the validity of the contract: <strong>Materiality</strong> — a fact important enough that it could affect the policy or premium. If the insured violates a material warranty or conceals a material fact, the insurer''s recourse is <strong>rescission</strong> — cancelling the policy from the start, as if it never existed.</p>')
where title = 'The Insurance Contract'
  and content like '%<li><strong>Offer and Acceptance</strong>: insured needs to submit application request to buy (offer).</li>
</ul>%'
  and content not like '%<p>A few more terms tied to the validity of the co%';

update public.lessons
set content = replace(content, '<li><strong>Alien insurer</strong> — from another country.</li>
</ul>', '<li><strong>Alien insurer</strong> — from another country.</li>
</ul><p>Agents are also classified by residency: a <strong>Resident agent</strong> is licensed in their own (domestic) home state, while a <strong>Non-Resident agent</strong> holds a license to sell in any of the other 49 states.</p>')
where title = 'Insurance Producers and Distribution'
  and content like '%<li><strong>Alien insurer</strong> — from another country.</li>
</ul>%'
  and content not like '%<p>Agents are also classified by residency: a <str%';

update public.lessons
set content = replace(content, 'You can change to a different mode if you like.</p>', 'You can change to a different mode if you like.</p><p>Paying more often than annually costs more overall: the total premium paid over one policy year is <strong>greater</strong> if paid monthly, quarterly, or semi-annually than if paid annually — annual payment is the cheapest way to pay for the year.</p>')
where title = 'Premiums and Rating'
  and content like '%You can change to a different mode if you like.</p>%'
  and content not like '%<p>Paying more often than annually costs more over%';

-- === HEALTH (11 entries) ===

update public.lessons
set content = replace(content, 'Part B pays 80% of the bill; the senior pays the other 20%.', 'Part B pays 80% of the bill; the senior pays the other 20%. A senior who is still covered under an employer''s group health plan when they turn 65 does not need to enroll in Part B during the initial enrollment period — they can wait to enroll until the group coverage ends.')
where title = 'Medicare and Medicare Supplement'
  and content like '%Part B pays 80% of the bill; the senior pays the other 20%.%'
  and content not like '%A senior who is still covered under an employer''s %';

update public.lessons
set content = replace(content, 'It must be renewable/guaranteed renewable, and must cover pre-existing conditions after 6 months.</p>', 'It must be renewable/guaranteed renewable, and must cover pre-existing conditions after 6 months.</p><p>When filing a Medicare claim, the medical provider — the doctor, hospital, or pharmacy — submits the expenses to Medicare first; the patient does not submit the claim.</p>')
where title = 'Medicare and Medicare Supplement'
  and content like '%It must be renewable/guaranteed renewable, and must cover pre-existing conditions after 6 months.</p>%'
  and content not like '%<p>When filing a Medicare claim, the medical provi%';

update public.lessons
set content = replace(content, 'Optional group medical coverages include dental, maternity (pregnancy), prescription drug, and vision.</p>', 'Optional group medical coverages include dental, maternity (pregnancy), prescription drug, and vision.</p><p><strong>Vision care insurance</strong> usually covers eye examinations, eyeglass frames, and contact lenses, but does not cover eye surgery.</p>')
where title = 'Coordination of Benefits and Group Administration'
  and content like '%Optional group medical coverages include dental, maternity (pregnancy), prescription drug, and vision.</p>%'
  and content not like '%<p><strong>Vision care insurance</strong> usually %';

update public.lessons
set content = replace(content, 'Two insurance companies cover one client; one company pays a portion and the other absorbs the other amount.</p>', 'Two insurance companies cover one client; one company pays a portion and the other absorbs the other amount.</p><p>Coordination of benefits applies to medical expense insurance. Limited/indemnity-type policies — such as hospital indemnity, specified disease, and critical illness — are not coordinated with other coverage; they pay their full benefit in addition to any other insurance policies the insured holds.</p>')
where title = 'Coordination of Benefits and Group Administration'
  and content like '%Two insurance companies cover one client; one company pays a portion and the other absorbs the other amount.</p>%'
  and content not like '%<p>Coordination of benefits applies to medical exp%';

update public.lessons
set content = replace(content, 'Health providers (hospitals, doctors) contract with insurers to provide fee-for-service. Subscribers can go to any doctor.</p>', 'Health providers (hospitals, doctors) contract with insurers to provide fee-for-service. Subscribers can go to any doctor.</p><p><strong>Morbidity</strong> is the principle of the likelihood/frequency of sickness or disease in a population, and is a key factor insurers use to price health insurance. Relevant morbidity factors include age, income, and sex.</p>')
where title = 'Health Plan Types and Cost Sharing'
  and content like '%Health providers (hospitals, doctors) contract with insurers to provide fee-for-service. Subscribers can go to any doctor.</p>%'
  and content not like '%<p><strong>Morbidity</strong> is the principle of %';

update public.lessons
set content = replace(content, 'they can be <strong>self-insured</strong> and hire a third party to manage it.</p>', 'they can be <strong>self-insured</strong> and hire a third party to manage it.</p><p>Eligible individuals can obtain group health insurance without providing evidence of insurability by enrolling within a specified eligibility period, rather than submitting an attending physician''s statement.</p>')
where title = 'Coordination of Benefits and Group Administration'
  and content like '%they can be <strong>self-insured</strong> and hire a third party to manage it.</p>%'
  and content not like '%<p>Eligible individuals can obtain group health in%';

update public.lessons
set content = replace(content, 'is a program that has counselors who give health-related advice and information to the elderly without charge (no fee) — volunteer.</p>', 'is a program that has counselors who give health-related advice and information to the elderly without charge (no fee) — volunteer.</p><p>HiCAP counselors complete an intensive training program but are not qualified to give legal advice — they provide information about the Medicare program only.</p>')
where title = 'Group Health Insurance Laws'
  and content like '%is a program that has counselors who give health-related advice and information to the elderly without charge (no fee) — volunteer.</p>%'
  and content not like '%<p>HiCAP counselors complete an intensive training%';

update public.lessons
set content = replace(content, 'if the insured changes to a more hazardous job, benefit decreases; if to a safer job, benefit increases.</p>', 'if the insured changes to a more hazardous job, benefit decreases; if to a safer job, benefit increases.</p><p>For a disability income policy, bodily injury is only classified as accidental if both the cause and the result are accidental — if either one was intentional, it does not qualify.</p>')
where title = 'Disability Income Insurance and Social Security'
  and content like '%if the insured changes to a more hazardous job, benefit decreases; if to a safer job, benefit increases.</p>%'
  and content not like '%<p>For a disability income policy, bodily injury i%';

update public.lessons
set content = replace(content, 'so a family member can take a break/rest).', 'so a family member can take a break/rest). Long-term care riders can also include <strong>adult day care</strong> coverage.')
where title = 'Long-Term Care Insurance and Workers'' Compensation'
  and content like '%so a family member can take a break/rest).%'
  and content not like '%Long-term care riders can also include <strong>adu%';

update public.lessons
set content = replace(content, 'No, if the new one is worse (higher price or less benefit).</p>', 'No, if the new one is worse (higher price or less benefit).</p><p>When an agent writes a replacement long-term care policy, the agent''s first-year sales commission is based on the difference between the new and original policy''s annual premiums.</p>')
where title = 'Long-Term Care Insurance and Workers'' Compensation'
  and content like '%No, if the new one is worse (higher price or less benefit).</p>%'
  and content not like '%<p>When an agent writes a replacement long-term ca%';

update public.lessons
set content = replace(content, 'is insurance your company buys for workers who are injured at work.</p>', 'is insurance your company buys for workers who are injured at work.</p><p>Workers'' compensation medical expense benefits for disabled workers continue with no time limit.</p>')
where title = 'Long-Term Care Insurance and Workers'' Compensation'
  and content like '%is insurance your company buys for workers who are injured at work.</p>%'
  and content not like '%<p>Workers'' compensation medical expense benefits %';

-- === LIFE (6 entries) ===

update public.lessons
set content = replace(content, '<li><strong>Index Universal life</strong>: about 80% to 90% of the cash value stays in the general account, about 10-20% goes to invest. There is a Guaranteed rate and a Cap rate.</li>
</ul>', '<li><strong>Index Universal life</strong>: about 80% to 90% of the cash value stays in the general account, about 10-20% goes to invest. There is a Guaranteed rate and a Cap rate.</li>
</ul><p>Selling <strong>Variable Universal life</strong> (or any product funded through a variable/securities-based sub-account) requires a securities license in addition to the life insurance license, since the cash value is invested directly in the market.</p>')
where title = 'Types of Life Insurance'
  and content like '%<li><strong>Index Universal life</strong>: about 80% to 90% of the cash value stays in the general account, about 10-20% goes to invest. There is a Guaranteed rate and a Cap rate.</li>
</ul>%'
  and content not like '%<p>Selling <strong>Variable Universal life</strong%';

update public.lessons
set content = replace(content, 'It has CASH VALUE/SAVING — the client can loan money out without paying tax.</p>', 'It has CASH VALUE/SAVING — the client can loan money out without paying tax.</p><p><strong>Endowment insurance</strong> is a related product: it pays the full face amount if the insured survives to a stated date (the endowment date), or pays the death benefit if the insured dies before that date. Whole life is essentially an endowment at age 120, but a dedicated endowment policy can also be written to mature at an earlier stated age or after a set number of years.</p>')
where title = 'Types of Life Insurance'
  and content like '%It has CASH VALUE/SAVING — the client can loan money out without paying tax.</p>%'
  and content not like '%<p><strong>Endowment insurance</strong> is a relat%';

update public.lessons
set content = replace(content, '<li>Two people want only 1 policy: <strong>Joint life</strong> — covers 2 lives, pays the death benefit when 1 dies.</li>
</ul>', '<li>Two people want only 1 policy: <strong>Joint life</strong> — covers 2 lives, pays the death benefit when 1 dies.</li>
</ul><p>Tax treatment note: <strong>individual disability income insurance</strong> follows the usual personal-tax rule — premiums are paid with after-tax dollars and are not deductible, but because of that, the benefits received are tax-free to the insured.</p>')
where title = 'Business and Estate Uses of Life Insurance'
  and content like '%<li>Two people want only 1 policy: <strong>Joint life</strong> — covers 2 lives, pays the death benefit when 1 dies.</li>
</ul>%'
  and content not like '%<p>Tax treatment note: <strong>individual disabili%';

update public.lessons
set content = replace(content, 'To reinstate, he needs to: pay all missed premiums, and provide insurability interest (redo blood test).</p>', 'To reinstate, he needs to: pay all missed premiums, and provide insurability interest (redo blood test).</p><p>Policy loans taken against the cash value are also capped by law — the interest rate an insurer can charge on the loan cannot exceed the maximum rate set for the policy''s state of issue.</p>')
where title = 'Life Insurance Policy Provisions'
  and content like '%To reinstate, he needs to: pay all missed premiums, and provide insurability interest (redo blood test).</p>%'
  and content not like '%<p>Policy loans taken against the cash value are a%';

update public.lessons
set content = replace(content, 'Pros: contribution is tax deductible. Cons: distribution / withdrawal is taxable.</p>', 'Pros: contribution is tax deductible. Cons: distribution / withdrawal is taxable.</p><p>Other examples of qualified plans include the <strong>SIMPLE Plan</strong> and the <strong>Keogh Plan</strong> (for self-employed individuals) — both allow tax-deductible contributions, unlike a Roth IRA, which does not qualify for a federal income tax deduction.</p>')
where title = 'Retirement Plans and Annuities'
  and content like '%Pros: contribution is tax deductible. Cons: distribution / withdrawal is taxable.</p>%'
  and content not like '%<p>Other examples of qualified plans include the <%';

update public.lessons
set content = replace(content, '<li><strong>Beneficiary</strong>: is the person who will get money when the annuitant dies.</li>
</ul>', '<li><strong>Beneficiary</strong>: is the person who will get money when the annuitant dies.</li>
</ul><p>Before recommending an annuity, the producer must gather <strong>suitability information</strong> from the client — including age, annual income, financial situation, and financial experience/objectives — to make sure the product is appropriate for that client.</p>')
where title = 'Retirement Plans and Annuities'
  and content like '%<li><strong>Beneficiary</strong>: is the person who will get money when the annuitant dies.</li>
</ul>%'
  and content not like '%<p>Before recommending an annuity, the producer mu%';

-- Verify: lists every lesson touched and whether each gap's guard text now appears.
select title, module_id,
  (content like '%<p>A few more terms tied to the validity of the co%') as gap_1,
  (content like '%<p>Agents are also classified by residency: a <str%') as gap_2,
  (content like '%<p>Paying more often than annually costs more over%') as gap_3,
  (content like '%A senior who is still covered under an employer''s %') as gap_4,
  (content like '%<p>When filing a Medicare claim, the medical provi%') as gap_5,
  (content like '%<p><strong>Vision care insurance</strong> usually %') as gap_6,
  (content like '%<p>Coordination of benefits applies to medical exp%') as gap_7,
  (content like '%<p><strong>Morbidity</strong> is the principle of %') as gap_8,
  (content like '%<p>Eligible individuals can obtain group health in%') as gap_9,
  (content like '%<p>HiCAP counselors complete an intensive training%') as gap_10,
  (content like '%<p>For a disability income policy, bodily injury i%') as gap_11,
  (content like '%Long-term care riders can also include <strong>adu%') as gap_12,
  (content like '%<p>When an agent writes a replacement long-term ca%') as gap_13,
  (content like '%<p>Workers'' compensation medical expense benefits %') as gap_14,
  (content like '%<p>Selling <strong>Variable Universal life</strong%') as gap_15,
  (content like '%<p><strong>Endowment insurance</strong> is a relat%') as gap_16,
  (content like '%<p>Tax treatment note: <strong>individual disabili%') as gap_17,
  (content like '%<p>Policy loans taken against the cash value are a%') as gap_18,
  (content like '%<p>Other examples of qualified plans include the <%') as gap_19,
  (content like '%<p>Before recommending an annuity, the producer mu%') as gap_20
from public.lessons
where title in ('The Insurance Contract', 'Insurance Producers and Distribution', 'Premiums and Rating', 'Medicare and Medicare Supplement', 'Coordination of Benefits and Group Administration', 'Health Plan Types and Cost Sharing', 'Group Health Insurance Laws', 'Disability Income Insurance and Social Security', 'Long-Term Care Insurance and Workers'' Compensation', 'Types of Life Insurance', 'Business and Estate Uses of Life Insurance', 'Life Insurance Policy Provisions', 'Retirement Plans and Annuities')
order by title, module_id;
