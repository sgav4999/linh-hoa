-- Inserts a "Progress Check" quiz lesson right after every lesson in
-- Health Insurance, built from the existing practice-exam question bank,
-- matched to that lesson's topic. Run as one transaction, "without RLS" mode.

-- lessons.type didn't allow 'quiz' yet (only 'text'/'video' originally) --
-- safe to run even if another one of these three files already did this.
alter table public.lessons drop constraint if exists lessons_type_check;
alter table public.lessons add constraint lessons_type_check check (type in ('text', 'video', 'quiz'));

update public.lessons set position = position + 1000 where module_id = '0a8d5351-dcb3-46c7-9758-0391fc1c57f6';
update public.lessons set position = 1 where module_id = '0a8d5351-dcb3-46c7-9758-0391fc1c57f6' and title = 'Medicare and Medicare Supplement';
insert into public.lessons (id, module_id, title, description, duration, type, content, position)
select gen_random_uuid(), '0a8d5351-dcb3-46c7-9758-0391fc1c57f6', 'Progress Check: Medicare and Medicare Supplement', '15 practice questions covering Medicare and Medicare Supplement.', '15 min', 'quiz', '<div class="lesson-quiz-item" data-correct="d">
<p class="lesson-quiz-question">At what age are individuals eligible for Medicare Part A benefits?</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) 55</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) 59</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) 62</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) 65</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>Medicare Part A is automatically available at age 65, as long as the person has worked and paid Medicare tax for at least 10 years.</p>
</div>
<div class="lesson-quiz-item" data-correct="a">
<p class="lesson-quiz-question">Medicare Part A provides coverage for all of the following EXCEPT</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) physician''s services</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) hospitalization</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) home health care</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) hospice</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>Physician''s services are outpatient care, covered under Part B — Part A covers inpatient hospital care.</p>
</div>
<div class="lesson-quiz-item" data-correct="b">
<p class="lesson-quiz-question">Individuals age 65 or older are exclusively eligible for which optional program?</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) Medicare Part A</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) Medicare Part B</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) MET''s</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) Long-term care</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>Medicare Part B is the optional, voluntary medical insurance program that individuals elect (and pay a premium for) once they become eligible at age 65, unlike Part A, which is generally automatic.</p>
</div>
<div class="lesson-quiz-item" data-correct="c">
<p class="lesson-quiz-question">The eligibility for Medicare Part B for people who turning 65 last how long?</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) 3 months</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) 5 months</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) 7 months</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) 1 months</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>The initial enrollment period for Part B spans 7 months: 3 months before the birthday month, the birthday month itself, and 3 months after.</p>
</div>
<div class="lesson-quiz-item" data-correct="d">
<p class="lesson-quiz-question">All of the following statements about Medicare Part B are correct EXCEPT it</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) requires a premium payment</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) pays for physicians services (this and one more ?)</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) is optional to those enrolling in Medicare part A</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) pays for virtually all drug prescribed by a physician</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>Medicare Part B covers physician services and is optional with a premium, but it does not pay for virtually all prescription drugs — outpatient prescription drug coverage is provided under Part D.</p>
</div>
<div class="lesson-quiz-item" data-correct="d">
<p class="lesson-quiz-question">Which statement regarding Medicare is true?</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) Nursing home coverage is covered by Part B</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) Benefits for prescription drugs are covered by Part A</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) Medicare is available only to individuals age 60 and older</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) Benefits for diagnostic tests and X-rays performed on an outpatient basis are provided by Part B</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>Medicare Part B covers outpatient services, including diagnostic tests and X-rays performed outside a hospital stay.</p>
</div>
<div class="lesson-quiz-item" data-correct="c">
<p class="lesson-quiz-question">After the deductible is satisfied, what percentage of a reasonable charge does Medicare part B pay?</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) 20%</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) 40%</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) 80%</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) 100% (story)</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>After the annual deductible is met, Medicare Part B pays 80% of the Medicare-approved (reasonable) charge for covered services.</p>
</div>
<div class="lesson-quiz-item" data-correct="a">
<p class="lesson-quiz-question">After the deductible, what portion does a patient pay for covered expenses under Medicare part B?</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) 20%</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) 50%</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) 80%</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) 100%</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>Medicare Part B pays 80% of approved charges after the deductible, leaving the patient responsible for the remaining 20% coinsurance.</p>
</div>
<div class="lesson-quiz-item" data-correct="b">
<p class="lesson-quiz-question">Which statement about Medicare is not correct?</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) Medicare part A covers hospital care</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) Medicare part C covers long-term care</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) Medicare part B covers physician services</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) Medicare is a federal health insurance program</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>Medicare Part C (Medicare Advantage) is an alternative way to receive Parts A and B benefits through private plans; it does not specifically cover long-term custodial care.</p>
</div>
<div class="lesson-quiz-item" data-correct="c">
<p class="lesson-quiz-question">Joe is a Medicare participant who receives his benefits through a Managed Health Care Plan. Which Medicare plan does he have?</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) Part A</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) Part B</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) Part C</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) Part D</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>Medicare Part C (Medicare Advantage) delivers Part A and Part B benefits through private managed care plans such as HMOs and PPOs.</p>
</div>
<div class="lesson-quiz-item" data-correct="d">
<p class="lesson-quiz-question">All Medicare Supplement policies sold in the State must be : (which one is must adhere to law to allow renew?</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) non-renewable</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) noncancelable</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) optionally renewable</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) guaranteed renewable</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>Medicare Supplement policies are required to be guaranteed renewable, meaning the insurer cannot cancel coverage as long as premiums are paid.</p>
</div>
<div class="lesson-quiz-item" data-correct="d">
<p class="lesson-quiz-question">When can an insurer cancel a Medicare supplement plan?</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) At any time</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) At the enrollment period</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) On a date specified in the policy</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) After nonpayment</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>A Medicare supplement policy is guaranteed renewable for life, so the insurer can only cancel it for nonpayment of premium (or material misrepresentation), not at will.</p>
</div>
<div class="lesson-quiz-item" data-correct="b">
<p class="lesson-quiz-question">A Medicare Supplement policy must NOT contain benefits which</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) charge additional premiums</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) duplicate Medicare benefits (which exclude?)</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) cover more than Medicare coverage</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) are covered by Workers Compensation</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>Medicare Supplement policies are prohibited from duplicating benefits already provided by Medicare itself.</p>
</div>
<div class="lesson-quiz-item" data-correct="a">
<p class="lesson-quiz-question">Medicare Supplement policies have a free-look period of ( 2 questions, under and over)</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) 30 days</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) 45 days</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) 60 days</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) 10 days</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>Medicare Supplement policies must include a free-look period of at least 30 days, during which the policyholder can return the policy for a full premium refund.</p>
</div>
<div class="lesson-quiz-item" data-correct="b">
<p class="lesson-quiz-question">Who submits Medicare part A claims?</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) patient</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) hospital</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) pharmacies</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) physicians</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>Under Part A, the hospital (or other institutional provider) bills Medicare directly on the patient''s behalf.</p>
</div>', 2
where not exists (select 1 from public.lessons where module_id = '0a8d5351-dcb3-46c7-9758-0391fc1c57f6' and title = 'Progress Check: Medicare and Medicare Supplement');
update public.lessons set position = 3 where module_id = '0a8d5351-dcb3-46c7-9758-0391fc1c57f6' and title = 'The Affordable Care Act (PPACA)';
insert into public.lessons (id, module_id, title, description, duration, type, content, position)
select gen_random_uuid(), '0a8d5351-dcb3-46c7-9758-0391fc1c57f6', 'Progress Check: The Affordable Care Act (PPACA)', '3 practice questions covering The Affordable Care Act (PPACA).', '3 min', 'quiz', '<div class="lesson-quiz-item" data-correct="d">
<p class="lesson-quiz-question">As established by PPACA, an adult child may be covered by a parent''s health insurance plan until what age?</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) 19 years old</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) 23 years old</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) 25 years old</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) 26 years old</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>PPACA requires plans that cover dependents to allow adult children to stay on a parent''s plan until they turn 26.</p>
</div>
<div class="lesson-quiz-item" data-correct="d">
<p class="lesson-quiz-question">Regarding the health benefit exchanges, as created by PPACA, all of the following statements are true EXCEPT</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) the name of California’s exchange is covered California</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) an individual enrolling in a bronze level plan is not eligible for reduced cost-sharing</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) an individual whose household income is 400% of the federal poverty level may receive a premium tax credit</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) an individual may only receive a premium tax credit for a plan if purchased through the exchange</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>Premium tax credits are calculated based on household income and Marketplace enrollment, but eligibility is not strictly limited to plans "purchased through the exchange" in every case — the other statements about Covered California''s name, bronze plans not qualifying for cost-sharing reductions, and the 400% FPL subsidy threshold are the well-established, accurate PPACA rules.</p>
</div>
<div class="lesson-quiz-item" data-correct="d">
<p class="lesson-quiz-question">An individual is allowed to enroll in individual health insurance under the following circumstances EXCEPT</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) during the annual open enrollment period</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) within 60 days of a qualifying event</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) at any time for Medi-Cal/Medicaid</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) within 30 days of being diagnosed with an illness</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>A new diagnosis isn''t a qualifying event that opens individual health enrollment — the recognized entry points are open enrollment, qualifying life events, and anytime eligibility for Medi-Cal/Medicaid.</p>
</div>', 4
where not exists (select 1 from public.lessons where module_id = '0a8d5351-dcb3-46c7-9758-0391fc1c57f6' and title = 'Progress Check: The Affordable Care Act (PPACA)');
update public.lessons set position = 5 where module_id = '0a8d5351-dcb3-46c7-9758-0391fc1c57f6' and title = 'Health Plan Types and Cost Sharing';
insert into public.lessons (id, module_id, title, description, duration, type, content, position)
select gen_random_uuid(), '0a8d5351-dcb3-46c7-9758-0391fc1c57f6', 'Progress Check: Health Plan Types and Cost Sharing', '13 practice questions covering Health Plan Types and Cost Sharing.', '13 min', 'quiz', '<div class="lesson-quiz-item" data-correct="c">
<p class="lesson-quiz-question">Traditional comprehensive major medical plans include all of the following EXCEPT</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) coinsurance</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) deductibles</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) first-dollar coverage</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) out-of-pocket maximums, Stop Loss</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>Comprehensive major medical plans require the insured to share costs through deductibles and coinsurance, so they do not provide first-dollar coverage from the very first expense.</p>
</div>
<div class="lesson-quiz-item" data-correct="b">
<p class="lesson-quiz-question">A policyholder has a major medical plan with a 80%/20% coinsurance and a deductible of $75. and receives a bill for $175, how much will the insurer pay?</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) $35</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) $80</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) $100</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) $140</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>After the $75 deductible, $100 remains. The insurer pays its 80% coinsurance share of that: 80% x $100 = $80.</p>
</div>
<div class="lesson-quiz-item" data-correct="d">
<p class="lesson-quiz-question">A policyholder has a major medical plan with a 80%/20% coinsurance and a deductible of $75. If the insured has previously met her deductible and receives a bill for $175, how much will the insurer pay?</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) $35</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) $74</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) $100</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) $140</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>With the deductible already met, the full $175 is subject to coinsurance, so the insurer pays 80% x $175 = $140.</p>
</div>
<div class="lesson-quiz-item" data-correct="a">
<p class="lesson-quiz-question">A commonly used cost containment measure for emergency hospital care under a major medical expense plan is the</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) deductible</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) premium tax</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) impatient fee</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) pre-admission test</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>A deductible requires the insured to pay an initial amount out of pocket, discouraging unnecessary use of services and helping control overall plan costs.</p>
</div>
<div class="lesson-quiz-item" data-correct="b">
<p class="lesson-quiz-question">When does an insured qualify for stop-loss coverage? (story, protect the insured not to pay too much)</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) When the insured reaches an age stated in the policy</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) When claims exceed a specified limit in a set period of time</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) When claims exceed the policy''s maximum lifetime benefit limit</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) When the average claim amount exceeds the limit stated in the policy</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>Stop-loss (the out-of-pocket maximum) kicks in once the insured''s costs in a given period cross a set dollar threshold, after which the insurer covers 100%.</p>
</div>
<div class="lesson-quiz-item" data-correct="b">
<p class="lesson-quiz-question">The type of health care provider that provides both the health care services and health care coverage is called</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) a preferred provider organization, PPO</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) a health maintenance organization, HMO</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) a major medical organization</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) An EPO</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>An HMO both delivers health care services (through its own or contracted providers) and provides the health coverage itself, unlike a PPO which only contracts for discounted access.</p>
</div>
<div class="lesson-quiz-item" data-correct="b">
<p class="lesson-quiz-question">A person who makes a contract with a HMO, either directly or through an insurer or marketing organization, under which the person or other designated persons are entitled to the health care services is called a</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) Policyowner</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) Subscriber</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) Provider</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) Contractor</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>The individual who contracts with an HMO for health care services is called a subscriber, distinguishing them from the providers who deliver the care.</p>
</div>
<div class="lesson-quiz-item" data-correct="c">
<p class="lesson-quiz-question">Who acts as the gatekeeper in a Health Maintenance Organization (HMO)?</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) Policyowner</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) HMO Arbritrator</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) Primary care physician</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) Insurance Company</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>The primary care physician coordinates a member''s care and must authorize referrals to specialists, acting as the HMO''s gatekeeper.</p>
</div>
<div class="lesson-quiz-item" data-correct="d">
<p class="lesson-quiz-question">Which of the following services are health maintenance organizations (HMO''s) NOT required to provide?</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) Emergency services</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) Hospitalization</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) Preventative services</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) Prescription drug</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>Prescription drug coverage is typically offered as an optional benefit, while emergency, hospitalization, and preventive services are core services HMOs must provide.</p>
</div>
<div class="lesson-quiz-item" data-correct="d">
<p class="lesson-quiz-question">Which statement about Health Maintenance Organizations is NOT true? (Not exact)</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) Members minimize out-of-pocket expenses by using HMO network providers</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) Subscribers pay a fixed periodic fee to the HMO</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) HMOs are known for stressing preventive care</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) When a member uses out-of-network providers, a higher monthly fee is charged</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>HMOs typically charge a higher out-of-pocket cost-share, not a higher recurring premium, when a member goes out-of-network, making choice d untrue.</p>
</div>
<div class="lesson-quiz-item" data-correct="c">
<p class="lesson-quiz-question">How is a health provider reimbursed if they do NOT have an agreement in place with the insurance company?</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) With a contingent fee</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) With a scheduled fee</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) With a usual, customary, and reasonable fee</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) With a reasonably appropriate fee</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>Without a contracted fee schedule, a non-participating provider is paid based on the usual, customary, and reasonable (UCR) charge for that service in the area.</p>
</div>
<div class="lesson-quiz-item" data-correct="c">
<p class="lesson-quiz-question">In medical expense insurance, what serves the same purpose as the elimination period in disability income insurance?</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) coinsurance</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) co-payment</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) deductible</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) maximum benefit</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>A deductible is the fixed dollar amount the insured must pay before medical expense benefits begin, serving the same cost-sharing function that a time-based elimination period serves in disability income insurance.</p>
</div>
<div class="lesson-quiz-item" data-correct="a">
<p class="lesson-quiz-question">Medical expense policies will typically cover which of the following?</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) Injuries caused by accidents</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) Routine dental care</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) Prescription eyeglasses</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) Voluntary cosmetic procedures</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>Basic medical expense policies cover treatment for accidental injuries (and illness), while routine dental care, eyeglasses, and elective cosmetic procedures are typically excluded.</p>
</div>', 6
where not exists (select 1 from public.lessons where module_id = '0a8d5351-dcb3-46c7-9758-0391fc1c57f6' and title = 'Progress Check: Health Plan Types and Cost Sharing');
update public.lessons set position = 7 where module_id = '0a8d5351-dcb3-46c7-9758-0391fc1c57f6' and title = 'Limited Policies and State Programs';
insert into public.lessons (id, module_id, title, description, duration, type, content, position)
select gen_random_uuid(), '0a8d5351-dcb3-46c7-9758-0391fc1c57f6', 'Progress Check: Limited Policies and State Programs', '8 practice questions covering Limited Policies and State Programs.', '8 min', 'quiz', '<div class="lesson-quiz-item" data-correct="a">
<p class="lesson-quiz-question">The most common type of specified/one/dread disease insurance policy is? (Limited policy)</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) cancer</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) cataract</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) diabetes</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) heart disease</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>Cancer policies are by far the most commonly sold type of specified/dread disease coverage.</p>
</div>
<div class="lesson-quiz-item" data-correct="a">
<p class="lesson-quiz-question">Which of the following does specified disease insurance NOT cover?</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) costs covered by medical expense insurance</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) medical expenses that are noncovered</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) incidental costs</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) out-of-pocket expenses</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>Specified disease policies only pay costs related to the one named disease that aren''t already covered by the insured''s regular medical expense insurance, avoiding duplicate payment.</p>
</div>
<div class="lesson-quiz-item" data-correct="b">
<p class="lesson-quiz-question">MRMIP stands for?</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) Minor Risk Medical Insurance Program</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) Major Risk Medical Insurance Program</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) Major Rehabilitation Medical Indemnity Plan</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) Minor Rehabilitation Medical Insurance Plan</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>MRMIP is California''s state program for residents who can''t get coverage elsewhere due to high medical risk, funded by tobacco tax.</p>
</div>
<div class="lesson-quiz-item" data-correct="a">
<p class="lesson-quiz-question">In what order are people on the MRMIP waiting list allowed to enroll?</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) Based on the date an individual''s application is received</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) Priority is given to California residents</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) Based on the individual''s date of birth</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) Priority is given to those with the most serious health issues</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>MRMIP enrolls applicants off its waiting list in the order their applications were received, not by age, residency, or severity of health condition.</p>
</div>
<div class="lesson-quiz-item" data-correct="c">
<p class="lesson-quiz-question">Where must you specifically reside to qualify for MRMIP?</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) North America</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) United States</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) California</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) California and its reciprocal states</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>The Major Risk Medical Insurance Program (MRMIP) requires applicants to be California residents.</p>
</div>
<div class="lesson-quiz-item" data-correct="d">
<p class="lesson-quiz-question">Which of the following is NOT an accurate description of Access for Infants and Mothers Program (AIM)?</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) Low-cost health care coverage for pregnant women</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) Only women who have private insurance plans with a maternity-only deductible or copayment greater than $500 are eligible</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) Eligibility is based on income</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) Only women who have private insurance plans with a maternity-only deductible or copayment greater than $1,500 are eligible</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>AIM eligibility requires a maternity-only deductible or copayment greater than $500, not $1,500, so the $1,500 threshold is the inaccurate statement.</p>
</div>
<div class="lesson-quiz-item" data-correct="d">
<p class="lesson-quiz-question">What does a Hospital Confinement indemnity policy pay for?</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) Pays for the entire cost of the hospital stay</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) Pays for the deductible and coinsurance of the hospital stay</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) Pays for cost of the hospital stay after the deductible and coinsurance has been met</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) Pays a specified daily amount while the insured is confined to a hospital</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>A hospital confinement indemnity policy pays a fixed, predetermined daily benefit for each day the insured is hospitalized, regardless of the actual medical expenses incurred.</p>
</div>
<div class="lesson-quiz-item" data-correct="b">
<p class="lesson-quiz-question">Which type of insurance can be purchased at airport, bus terminals, and railroad stations, vending machine?</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) temporary life insurance</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) travel accident insurance , bao hiem du lich</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) temporary health insurance</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) accidental death and dismemberment</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>Travel accident insurance is the short-term, low-cost accidental death policy traditionally sold from vending machines at transportation terminals.</p>
</div>', 8
where not exists (select 1 from public.lessons where module_id = '0a8d5351-dcb3-46c7-9758-0391fc1c57f6' and title = 'Progress Check: Limited Policies and State Programs');
update public.lessons set position = 9 where module_id = '0a8d5351-dcb3-46c7-9758-0391fc1c57f6' and title = 'Coordination of Benefits and Group Administration';
insert into public.lessons (id, module_id, title, description, duration, type, content, position)
select gen_random_uuid(), '0a8d5351-dcb3-46c7-9758-0391fc1c57f6', 'Progress Check: Coordination of Benefits and Group Administration', '5 practice questions covering Coordination of Benefits and Group Administration.', '5 min', 'quiz', '<div class="lesson-quiz-item" data-correct="d">
<p class="lesson-quiz-question">Coverage is limited for vision and dental insurance in all of the following ways, EXCEPT</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) Number of teeth cleanings per year</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) Dollar amount for eyeglass frames</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) Number of X-rays performed per year</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) Specific dollar amount for examinations</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>Vision and dental plans commonly cap benefits by frequency (cleanings, X-rays) or by a dollar limit on specific items like frames, but they typically don''t set a flat dollar cap on the exam charge itself.</p>
</div>
<div class="lesson-quiz-item" data-correct="d">
<p class="lesson-quiz-question">The group medical plan provision that applies when a claimant has coverage under more than one plan is known as (married, both spouse cover dependent/ primary/ secondary)</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) coinsurance</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) integration</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) maximum benefits</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) coordination of benefits</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>Coordination of benefits determines which of two or more group plans pays first (primary) and which pays second (secondary) so total reimbursement does not exceed actual expenses.</p>
</div>
<div class="lesson-quiz-item" data-correct="d">
<p class="lesson-quiz-question">If a company wants to have their own coverage but they don’t have expertise enough, what can they do?</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) Self-insured</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) Fully insured, hire third party to manage</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) Fully insured</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) Self-insured, hire third party to manage</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>Self-insuring while hiring a third-party administrator lets a company retain its own risk and any savings from doing so, while outsourcing the claims-handling expertise it lacks.</p>
</div>
<div class="lesson-quiz-item" data-correct="b">
<p class="lesson-quiz-question">Susan is insured through her Group Health Insurance plan and changed her coverage to an individual plan with the same insurer after her employment was terminated. This change is called a(n)</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) crossover</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) conversion</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) exchange</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) extension of benefits</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>The conversion privilege lets an insured switch from group coverage to an individual policy with the same insurer, without evidence of insurability, when their group coverage would otherwise end.</p>
</div>
<div class="lesson-quiz-item" data-correct="d">
<p class="lesson-quiz-question">Which of the following statement concerning the usual coordination of benefits provision is correct?</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) Medicare coverage is always primary to medical coverage</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) coverage under COBRA is primary to coverage as an active employee</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) when two plans both have the provision, coverage as an employee is primary and coverage as a dependent is excess</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) coverage under any plan with the provision is primary to coverage under any plan without the provision</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>Under standard coordination of benefits rules, a plan that contains a COB provision takes priority over a plan that has none; Medicare and COBRA are generally secondary to active employee group coverage, ruling out the other choices.</p>
</div>', 10
where not exists (select 1 from public.lessons where module_id = '0a8d5351-dcb3-46c7-9758-0391fc1c57f6' and title = 'Progress Check: Coordination of Benefits and Group Administration');
update public.lessons set position = 11 where module_id = '0a8d5351-dcb3-46c7-9758-0391fc1c57f6' and title = 'Group Health Insurance Laws';
insert into public.lessons (id, module_id, title, description, duration, type, content, position)
select gen_random_uuid(), '0a8d5351-dcb3-46c7-9758-0391fc1c57f6', 'Progress Check: Group Health Insurance Laws', '10 practice questions covering Group Health Insurance Laws.', '10 min', 'quiz', '<div class="lesson-quiz-item" data-correct="b">
<p class="lesson-quiz-question">Health insurance counseling and advocacy program (HICAP) counselors can do all of the following EXCEPT</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) help evaluate policies</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) charge for their services</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) assist in medical record keeping</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) explain Medicare supplement coverage’s</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>HICAP counseling is a free, volunteer service — counselors are prohibited from charging for their advice or giving legal advice.</p>
</div>
<div class="lesson-quiz-item" data-correct="b">
<p class="lesson-quiz-question">The employee retirement income security Act of 1974 (ERISA) regulates group health insurance in the area of</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) family and medical leave</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) disclosure and reporting</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) Americans with disabilities</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) continuation of group health care</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>ERISA primarily governs disclosure and reporting requirements for employee benefit plans, such as providing summary plan descriptions to participants.</p>
</div>
<div class="lesson-quiz-item" data-correct="c">
<p class="lesson-quiz-question">The family and medical leave act (FMLA) covers all of the following EXCEPT</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) the adoption of a child</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) caring for a parent with a serious health condition</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) traveling with a spouse who has been transferred oversea</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) a serious health condition that prevents an employee from working</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>FMLA leave covers medical conditions, childbirth/adoption, and caregiving — it doesn''t extend to unrelated events like accompanying a spouse on an overseas transfer.</p>
</div>
<div class="lesson-quiz-item" data-correct="c">
<p class="lesson-quiz-question">Kimberly is an employee on leave under the Family and Medical Leave Act (FMLA). What will happen to her group health coverage?</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) She will have to purchase short-term health coverage through the State while on leave</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) Her coverage will be temporarily suspended while she is on leave</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) She continues to be enrolled during the leave</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) She will be forced to convert her group plan to an individual plan</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>FMLA specifically protects the employee''s group health coverage, keeping it active throughout the leave period.</p>
</div>
<div class="lesson-quiz-item" data-correct="b">
<p class="lesson-quiz-question">Group health plans obligated by the consolidated omnibus budget reconciliation act (COBRA) cover groups of at least</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) 10 employees’</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) 20 employees</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) 40 employees</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) 60 employees</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>COBRA continuation coverage requirements apply to group health plans sponsored by employers with 20 or more employees.</p>
</div>
<div class="lesson-quiz-item" data-correct="b">
<p class="lesson-quiz-question">Under the Consolidated Omnibus Budget Reconciliation Act (COBRA), a terminated employee''s benefits must</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) be less extensive and premium cannot exceed 102%</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) be the same and the premium cannot exceed 102%</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) be more extensive and the premium cannot exceed 102%</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) be the same as well as the premium</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>COBRA continuation coverage must be identical to what the employee had while actively employed, and the insurer may charge no more than 102% of the premium (the extra 2% covers administration).</p>
</div>
<div class="lesson-quiz-item" data-correct="b">
<p class="lesson-quiz-question">Ron has a new employer and wishes to enroll in the company''s group health plan. In determining whether his pre-existing health condition applies, Ron cannot have more than a ___ day gap without previous health insurance.</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) 45</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) 63</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) 75</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) 90</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>Under HIPAA, a break in health coverage of 63 days or more is a significant gap that forfeits credit for prior creditable coverage toward a new plan''s pre-existing condition exclusion.</p>
</div>
<div class="lesson-quiz-item" data-correct="d">
<p class="lesson-quiz-question">In California, the elderly can receive information about health related issues from?</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) Medi-Cal/Medicaid</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) Medicare</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) Major Risk Medical Insurance Program (MRMIP)</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) Health Insurance Counseling and Advocacy Program (HiCAP)</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>HICAP (Health Insurance Counseling and Advocacy Program) gives California seniors free, unbiased counseling on Medicare and other health insurance questions.</p>
</div>
<div class="lesson-quiz-item" data-correct="d">
<p class="lesson-quiz-question">Which group provides information about health-related issues to the elderly in California?</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) Medicare supplement insurers</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) long-term care insurance providers</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) the national health care anti-fraud association</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) the health insurance counseling and advocacy program (HICAP)</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>The Health Insurance Counseling and Advocacy Program (HICAP) provides free, unbiased information and counseling on health insurance issues to California seniors.</p>
</div>
<div class="lesson-quiz-item" data-correct="d">
<p class="lesson-quiz-question">What is the cost of service from the Health Insurance Counseling Advocacy Program (HICAP)?</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) $10 per appointment</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) $25 per appointment</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) $50 per appointment</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) no charge</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>HICAP provides free, unbiased counseling to Medicare beneficiaries and other consumers on health insurance issues.</p>
</div>', 12
where not exists (select 1 from public.lessons where module_id = '0a8d5351-dcb3-46c7-9758-0391fc1c57f6' and title = 'Progress Check: Group Health Insurance Laws');
update public.lessons set position = 13 where module_id = '0a8d5351-dcb3-46c7-9758-0391fc1c57f6' and title = 'Disability Income Insurance';
insert into public.lessons (id, module_id, title, description, duration, type, content, position)
select gen_random_uuid(), '0a8d5351-dcb3-46c7-9758-0391fc1c57f6', 'Progress Check: Disability Income Insurance', '7 practice questions covering Disability Income Insurance.', '7 min', 'quiz', '<div class="lesson-quiz-item" data-correct="d">
<p class="lesson-quiz-question">Under a disability income insurance policy with an own occupation clause, an individual who can no longer perform the tasks of the job held at the time of injury is considered</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) presumptively disabled</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) medically disabled</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) gainfully disabled</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) totally disabled</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>Under an own-occupation definition, the insured is considered totally disabled if unable to perform the material duties of their own specific occupation, even if able to work in another job.</p>
</div>
<div class="lesson-quiz-item" data-correct="d">
<p class="lesson-quiz-question">Which of the following is a characteristic of the disability elimination period?</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) Benefits are optionally payable</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) Benefits are conditionally payable</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) Benefits are unconditionally payable</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) Benefits are not payable</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>The elimination period is a waiting period (like a deductible in time) during which no disability benefits are payable at all, before benefits begin.</p>
</div>
<div class="lesson-quiz-item" data-correct="c">
<p class="lesson-quiz-question">An insured has a disability income policy with a $1,500 monthly benefit and a 30-day elimination period. The insured is unable to work for 120 days following an accident. What amount will the policy pay?</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) $1,500</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) $3,000</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) $4,500</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) $6,000</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>The 30-day elimination period isn''t covered, leaving 90 days (3 months) of payable benefits; at $1,500 a month that comes to $4,500.</p>
</div>
<div class="lesson-quiz-item" data-correct="a">
<p class="lesson-quiz-question">Which of these statements is NOT true concerning recurrent (happened again) disabilities?</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) The insurer continues coverage after a new elimination period</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) The recurrence of a disability must occur within a specified time period after the prior disability</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) A recurrent disability is considered to be a continuation of the prior disability</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) The recurrent disability must be caused from the original disability</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>A recurrent disability is treated as a continuation of the original claim, so the insurer does not require a new elimination period, contrary to choice a.</p>
</div>
<div class="lesson-quiz-item" data-correct="d">
<p class="lesson-quiz-question">Under group disability insurance an employee is eligible for a partial disability benefit when they can</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) no longer work full or part time because of an accidental injury</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) collect adjusted lost wages while on leave of absence due to illness</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) demonstrate their inability to perform due to loss of sight in one eye</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) performs some of their job activities on a part time basis injury</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>A partial disability benefit applies when an employee can still perform some job duties on a part-time or limited basis, unlike total disability, which prevents performing the job at all.</p>
</div>
<div class="lesson-quiz-item" data-correct="b">
<p class="lesson-quiz-question">All of the following conditions must be met to qualify for residual disability benefits under a disability income policy EXCEPT</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) currently earns at least 20% less than prior income</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) qualifies for social security disability benefits</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) continues to be under a physician''s care</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) is able to work full- or part-time</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>Residual disability benefits are based on a partial loss of income and time/duties while under a physician''s care, not on separately qualifying for Social Security disability benefits.</p>
</div>
<div class="lesson-quiz-item" data-correct="d">
<p class="lesson-quiz-question">Business Overhead Expense Insurance pays for</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) business expenses during an economic downturn</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) business owner''s salary in the event of the owner''s disability</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) any loss in value of a business if the owner becomes disabled</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) business expenses when a business owner becomes disabled</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>Business overhead expense insurance reimburses fixed operating costs, such as rent, utilities, and employee salaries, while the owner is disabled — it doesn''t replace the owner''s own income.</p>
</div>', 14
where not exists (select 1 from public.lessons where module_id = '0a8d5351-dcb3-46c7-9758-0391fc1c57f6' and title = 'Progress Check: Disability Income Insurance');
update public.lessons set position = 15 where module_id = '0a8d5351-dcb3-46c7-9758-0391fc1c57f6' and title = 'Social Security Benefits';
insert into public.lessons (id, module_id, title, description, duration, type, content, position)
select gen_random_uuid(), '0a8d5351-dcb3-46c7-9758-0391fc1c57f6', 'Progress Check: Social Security Benefits', '10 practice questions covering Social Security Benefits.', '10 min', 'quiz', '<div class="lesson-quiz-item" data-correct="d">
<p class="lesson-quiz-question">A worker is entitled to Social Security disability benefits if all of the following are true, EXCEPT for:</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) worker is under age 65</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) worker is insured for disability benefits</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) disability is expected to continue for 12 months or result in death</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) worker cannot perform his or her current job, but is actively seeking other employment</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>Social Security disability requires the inability to do any substantial gainful work, not just the worker''s current job — someone able to seek other employment doesn''t meet that bar.</p>
</div>
<div class="lesson-quiz-item" data-correct="b">
<p class="lesson-quiz-question">Which statement is NOT true regarding Social Security benefits?</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) Benefit eligibility is based upon fully insured status</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) Benefits are designed to replace the entire amount of the worker''s earnings</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) Disability is expected to continue for 12 months or result in death</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) Worker must be totally and permanently disabled for at least 5 months and unable to work again to be eligible for benefits</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>Social Security is only designed to replace a portion of pre-retirement/disability income, not the entire amount a worker earned.</p>
</div>
<div class="lesson-quiz-item" data-correct="c">
<p class="lesson-quiz-question">How long is a person expected to be disabled in order to receive Social Security disability benefits?</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) 4 months</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) 6 months</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) 12 months</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) 18 months</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>To qualify, the disability must be expected to last at least 12 months, or result in death.</p>
</div>
<div class="lesson-quiz-item" data-correct="a">
<p class="lesson-quiz-question">Fully insured status for social security benefits needs</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) 40 quarters</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) 30 quarters</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) 20 quarters</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) 10 quarters</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>Fully insured status under Social Security requires 40 quarters of covered work, generally about 10 years of employment.</p>
</div>
<div class="lesson-quiz-item" data-correct="a">
<p class="lesson-quiz-question">Retirement benefits under social security are available only for workers who are</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) fully insured</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) currently</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) partially</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) totally</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>Social Security retirement benefits require a worker to be "fully insured," meaning they have earned enough quarters of coverage through payroll taxes.</p>
</div>
<div class="lesson-quiz-item" data-correct="c">
<p class="lesson-quiz-question">A worker dies who is credited with 6 quarters of coverage during the last 13-quarter period. What status does the worker have under social security?</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) fully insured</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) partially insured</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) currently insured</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) disability insured</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>A worker with at least 6 quarters of coverage in the last 13 quarters before death is considered "currently insured," which qualifies certain survivors for limited benefits.</p>
</div>
<div class="lesson-quiz-item" data-correct="a">
<p class="lesson-quiz-question">The period in which there are no Social Security benefits for the surviving spouse is called the</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) blackout period</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) elimination period</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) ineligible period</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) dependency period</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>The blackout period is the span with no Social Security survivor benefits, generally after the youngest child turns 16 and before the surviving spouse reaches eligible retirement age.</p>
</div>
<div class="lesson-quiz-item" data-correct="b">
<p class="lesson-quiz-question">A surviving spouse without dependent children is eligible for social security survivor benefits at age</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) 55</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) 60</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) 62</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) 65</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>A surviving spouse with no dependent children becomes eligible for Social Security survivor benefits starting at age 60 (reduced benefits) under current rules.</p>
</div>
<div class="lesson-quiz-item" data-correct="c">
<p class="lesson-quiz-question">Social security survivor benefits are not available for all of the following EXCEPT</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) a surviving spouse over age 50</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) children age 19 who are full-time students</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) a spouse of any age who is caring for children under age 16</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) parents of any age who were dependent upon the deceased worker</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>A surviving spouse caring for the deceased worker''s child under age 16 qualifies for survivor benefits at any age, while a non-disabled spouse otherwise must wait until age 60, a child''s benefit generally requires being under 18 (or 19 and still in secondary school), and a dependent parent must be at least age 62.</p>
</div>
<div class="lesson-quiz-item" data-correct="a">
<p class="lesson-quiz-question">The social security blackout period ends when the surviving spouse reaches the age of</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) 60</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) 61</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) 62</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) 65</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>The Social Security blackout period ends at age 60, when a surviving spouse becomes eligible for reduced early survivor benefits.</p>
</div>', 16
where not exists (select 1 from public.lessons where module_id = '0a8d5351-dcb3-46c7-9758-0391fc1c57f6' and title = 'Progress Check: Social Security Benefits');
update public.lessons set position = 17 where module_id = '0a8d5351-dcb3-46c7-9758-0391fc1c57f6' and title = 'Long-Term Care Insurance and Workers'' Compensation';
insert into public.lessons (id, module_id, title, description, duration, type, content, position)
select gen_random_uuid(), '0a8d5351-dcb3-46c7-9758-0391fc1c57f6', 'Progress Check: Long-Term Care Insurance and Workers'' Compensation', '14 practice questions covering Long-Term Care Insurance and Workers'' Compensation.', '14 min', 'quiz', '<div class="lesson-quiz-item" data-correct="d">
<p class="lesson-quiz-question">Long-term care insurance</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) is another name for basic hospital expense insurance</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) can be cancelled solely on the basis of the insured''s deteriorating health</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) often is called blanket health insurance</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) is designed to provide coverage for at least 12 consecutive months</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>To be classified as long-term care coverage, a policy must provide benefits for a minimum of 12 consecutive months.</p>
</div>
<div class="lesson-quiz-item" data-correct="b">
<p class="lesson-quiz-question">An Outline of ______ is required for long-term care policies and provides a brief description of the important features of the policy.</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) Policy</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) Coverage</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) Summary</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) Benefits</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>Long-term care policies must come with an "Outline of Coverage" that summarizes the policy''s key features in plain language.</p>
</div>
<div class="lesson-quiz-item" data-correct="d">
<p class="lesson-quiz-question">How many "activities of daily living" must an insured be UNABLE to perform in order to meet the chronically ill requirement of a Long-Term Care policy?</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) Summary</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) Benefits</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) Minimum of one activity of daily living</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) Minimum of two activities of daily living</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>Being unable to perform at least 2 of the 6 ADLs (bathing, dressing, eating, transferring, toileting, continence) is the standard trigger for LTC benefits.</p>
</div>
<div class="lesson-quiz-item" data-correct="a">
<p class="lesson-quiz-question">Two of the long-term care chronically ill activities of daily living (ADLs) are</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) eating and dressing</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) bathing and hearing</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) sleeping and walking</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) speaking and incontinence</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>Eating and dressing are two of the standard activities of daily living (along with bathing, toileting, transferring, and continence) used to assess eligibility for long-term care benefits.</p>
</div>
<div class="lesson-quiz-item" data-correct="b">
<p class="lesson-quiz-question">Which of the following conditions would not be included among the chronic illness triggers of a long-term care policy?</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) Alzheimer’s</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) deafness</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) dementia</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) incontinence</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>Deafness is a sensory impairment, not one of the standard chronic illness triggers (such as Alzheimer''s, dementia, or incontinence) used to determine eligibility for long-term care benefits.</p>
</div>
<div class="lesson-quiz-item" data-correct="d">
<p class="lesson-quiz-question">Which long-term care policy provision allows for a periodic increase in policy benefits?</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) portability</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) suitability</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) nonforfeiture</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) inflation protection</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>An inflation protection provision periodically increases a long-term care policy''s benefit amounts to help keep pace with the rising cost of care.</p>
</div>
<div class="lesson-quiz-item" data-correct="b">
<p class="lesson-quiz-question">During the solicitation (1st selling appointment) of a long term care insurance rider, a life agent must consider all of the following EXCEPT the applicant''s?</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) goals and needs</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) attending physician statement (doctor record)</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) ability to pay for the coverage</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) existing long term care coverage</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>The first-appointment discussion focuses on the applicant''s needs, goals, ability to pay, and existing coverage — a physician''s statement is a medical underwriting document gathered later, not part of this initial solicitation.</p>
</div>
<div class="lesson-quiz-item" data-correct="c">
<p class="lesson-quiz-question">The adult day care coverage level of long-term care policy provides for</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) living arrangements in an assisted living center</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) full time care at a facility for elderly individuals</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) part time care at a facility for elderly individuals who live at home</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) full time home health care</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>Adult day care under an LTC policy covers part-time, daytime supervision and care for elderly individuals who still live at home, rather than full-time facility or home care.</p>
</div>
<div class="lesson-quiz-item" data-correct="a">
<p class="lesson-quiz-question">According to the California insurance code, all of the following long-term care (LTC) insurance sales are considered unnecessary EXCEPT</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) a replacement LTC policy with equal benefits for a lower premium</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) a replacement LTC policy with fewer benefits and a higher premium</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) an additional LTC policy to an insured who already has two LTC policies</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) Two additional LTC policies that equal the combined benefits of an existing one</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>Replacing an LTC policy with one offering equal benefits at a lower premium benefits the insured and is not considered an unnecessary sale, unlike replacements that reduce benefits or raise cost, or piling on redundant coverage.</p>
</div>
<div class="lesson-quiz-item" data-correct="d">
<p class="lesson-quiz-question">Rating an individual''s need for long-term care benefits can be measured by</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) gatekeeper authority</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) deductibles</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) custodial need</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) activities of daily living</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>Eligibility for long-term care benefits is typically measured by the insured''s inability to perform a specified number of Activities of Daily Living (ADLs), such as bathing, dressing, or eating.</p>
</div>
<div class="lesson-quiz-item" data-correct="c">
<p class="lesson-quiz-question">An insurance policy issued in California may be called a comprehensive long-term care insurance policy if benefits are provided for combine benefits</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) Respite care only</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) Home care only</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) Institutional (nursing facilities) and home care</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) Loss of life</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>A "comprehensive" long-term care policy must cover both institutional care (nursing facilities) and home/community-based care, not just one setting.</p>
</div>
<div class="lesson-quiz-item" data-correct="c">
<p class="lesson-quiz-question">A person cannot sell long-term care insurance unless that person is licensed as an insurance producer and has successfully completed a one-time education course of</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) 4 hours</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) 6 hours</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) 8 hours</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) 10 hours</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>California requires producers to complete a one-time 8-hour long-term care training course before they may sell LTC insurance.</p>
</div>
<div class="lesson-quiz-item" data-correct="b">
<p class="lesson-quiz-question">which of the following nursing home options would BEST suit an individual who needs some nursing care and supervision but NOT full-time care?</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) Custodial care homes</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) Assisted living facilities</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) Skilled nursing facilities</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) Congregate housing</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>Assisted living facilities provide help with daily activities and some supervision or nursing care without the full-time, intensive care given at a skilled nursing facility.</p>
</div>
<div class="lesson-quiz-item" data-correct="a">
<p class="lesson-quiz-question">Long-term care insurance may be purchased in all of the following forms EXCEPT</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) federal government-sponsored policies</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) riders to cash value life insurance policies</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) Stand alone LTC</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) Link benefit</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>There is no federal government-sponsored long-term care insurance policy available for individual purchase; LTC coverage instead comes from stand-alone policies, riders on cash value life insurance, or linked-benefit (hybrid) products.</p>
</div>', 18
where not exists (select 1 from public.lessons where module_id = '0a8d5351-dcb3-46c7-9758-0391fc1c57f6' and title = 'Progress Check: Long-Term Care Insurance and Workers'' Compensation');

update public.lessons set position = position + 1000 where module_id = '5b2b91d3-1ac3-4ea8-b29a-c97281e05ef2';
update public.lessons set position = 1 where module_id = '5b2b91d3-1ac3-4ea8-b29a-c97281e05ef2' and title = 'Medicare and Medicare Supplement';
insert into public.lessons (id, module_id, title, description, duration, type, content, position)
select gen_random_uuid(), '5b2b91d3-1ac3-4ea8-b29a-c97281e05ef2', 'Progress Check: Medicare and Medicare Supplement', '15 practice questions covering Medicare and Medicare Supplement.', '15 min', 'quiz', '<div class="lesson-quiz-item" data-correct="d">
<p class="lesson-quiz-question">At what age are individuals eligible for Medicare Part A benefits?</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) 55</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) 59</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) 62</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) 65</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>Medicare Part A is automatically available at age 65, as long as the person has worked and paid Medicare tax for at least 10 years.</p>
</div>
<div class="lesson-quiz-item" data-correct="a">
<p class="lesson-quiz-question">Medicare Part A provides coverage for all of the following EXCEPT</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) physician''s services</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) hospitalization</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) home health care</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) hospice</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>Physician''s services are outpatient care, covered under Part B — Part A covers inpatient hospital care.</p>
</div>
<div class="lesson-quiz-item" data-correct="b">
<p class="lesson-quiz-question">Individuals age 65 or older are exclusively eligible for which optional program?</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) Medicare Part A</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) Medicare Part B</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) MET''s</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) Long-term care</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>Medicare Part B is the optional, voluntary medical insurance program that individuals elect (and pay a premium for) once they become eligible at age 65, unlike Part A, which is generally automatic.</p>
</div>
<div class="lesson-quiz-item" data-correct="c">
<p class="lesson-quiz-question">The eligibility for Medicare Part B for people who turning 65 last how long?</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) 3 months</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) 5 months</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) 7 months</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) 1 months</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>The initial enrollment period for Part B spans 7 months: 3 months before the birthday month, the birthday month itself, and 3 months after.</p>
</div>
<div class="lesson-quiz-item" data-correct="d">
<p class="lesson-quiz-question">All of the following statements about Medicare Part B are correct EXCEPT it</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) requires a premium payment</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) pays for physicians services (this and one more ?)</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) is optional to those enrolling in Medicare part A</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) pays for virtually all drug prescribed by a physician</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>Medicare Part B covers physician services and is optional with a premium, but it does not pay for virtually all prescription drugs — outpatient prescription drug coverage is provided under Part D.</p>
</div>
<div class="lesson-quiz-item" data-correct="d">
<p class="lesson-quiz-question">Which statement regarding Medicare is true?</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) Nursing home coverage is covered by Part B</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) Benefits for prescription drugs are covered by Part A</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) Medicare is available only to individuals age 60 and older</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) Benefits for diagnostic tests and X-rays performed on an outpatient basis are provided by Part B</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>Medicare Part B covers outpatient services, including diagnostic tests and X-rays performed outside a hospital stay.</p>
</div>
<div class="lesson-quiz-item" data-correct="c">
<p class="lesson-quiz-question">After the deductible is satisfied, what percentage of a reasonable charge does Medicare part B pay?</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) 20%</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) 40%</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) 80%</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) 100% (story)</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>After the annual deductible is met, Medicare Part B pays 80% of the Medicare-approved (reasonable) charge for covered services.</p>
</div>
<div class="lesson-quiz-item" data-correct="a">
<p class="lesson-quiz-question">After the deductible, what portion does a patient pay for covered expenses under Medicare part B?</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) 20%</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) 50%</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) 80%</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) 100%</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>Medicare Part B pays 80% of approved charges after the deductible, leaving the patient responsible for the remaining 20% coinsurance.</p>
</div>
<div class="lesson-quiz-item" data-correct="b">
<p class="lesson-quiz-question">Which statement about Medicare is not correct?</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) Medicare part A covers hospital care</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) Medicare part C covers long-term care</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) Medicare part B covers physician services</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) Medicare is a federal health insurance program</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>Medicare Part C (Medicare Advantage) is an alternative way to receive Parts A and B benefits through private plans; it does not specifically cover long-term custodial care.</p>
</div>
<div class="lesson-quiz-item" data-correct="c">
<p class="lesson-quiz-question">Joe is a Medicare participant who receives his benefits through a Managed Health Care Plan. Which Medicare plan does he have?</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) Part A</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) Part B</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) Part C</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) Part D</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>Medicare Part C (Medicare Advantage) delivers Part A and Part B benefits through private managed care plans such as HMOs and PPOs.</p>
</div>
<div class="lesson-quiz-item" data-correct="d">
<p class="lesson-quiz-question">All Medicare Supplement policies sold in the State must be : (which one is must adhere to law to allow renew?</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) non-renewable</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) noncancelable</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) optionally renewable</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) guaranteed renewable</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>Medicare Supplement policies are required to be guaranteed renewable, meaning the insurer cannot cancel coverage as long as premiums are paid.</p>
</div>
<div class="lesson-quiz-item" data-correct="d">
<p class="lesson-quiz-question">When can an insurer cancel a Medicare supplement plan?</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) At any time</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) At the enrollment period</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) On a date specified in the policy</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) After nonpayment</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>A Medicare supplement policy is guaranteed renewable for life, so the insurer can only cancel it for nonpayment of premium (or material misrepresentation), not at will.</p>
</div>
<div class="lesson-quiz-item" data-correct="b">
<p class="lesson-quiz-question">A Medicare Supplement policy must NOT contain benefits which</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) charge additional premiums</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) duplicate Medicare benefits (which exclude?)</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) cover more than Medicare coverage</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) are covered by Workers Compensation</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>Medicare Supplement policies are prohibited from duplicating benefits already provided by Medicare itself.</p>
</div>
<div class="lesson-quiz-item" data-correct="a">
<p class="lesson-quiz-question">Medicare Supplement policies have a free-look period of ( 2 questions, under and over)</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) 30 days</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) 45 days</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) 60 days</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) 10 days</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>Medicare Supplement policies must include a free-look period of at least 30 days, during which the policyholder can return the policy for a full premium refund.</p>
</div>
<div class="lesson-quiz-item" data-correct="b">
<p class="lesson-quiz-question">Who submits Medicare part A claims?</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) patient</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) hospital</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) pharmacies</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) physicians</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>Under Part A, the hospital (or other institutional provider) bills Medicare directly on the patient''s behalf.</p>
</div>', 2
where not exists (select 1 from public.lessons where module_id = '5b2b91d3-1ac3-4ea8-b29a-c97281e05ef2' and title = 'Progress Check: Medicare and Medicare Supplement');
update public.lessons set position = 3 where module_id = '5b2b91d3-1ac3-4ea8-b29a-c97281e05ef2' and title = 'The Affordable Care Act (PPACA)';
insert into public.lessons (id, module_id, title, description, duration, type, content, position)
select gen_random_uuid(), '5b2b91d3-1ac3-4ea8-b29a-c97281e05ef2', 'Progress Check: The Affordable Care Act (PPACA)', '3 practice questions covering The Affordable Care Act (PPACA).', '3 min', 'quiz', '<div class="lesson-quiz-item" data-correct="d">
<p class="lesson-quiz-question">As established by PPACA, an adult child may be covered by a parent''s health insurance plan until what age?</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) 19 years old</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) 23 years old</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) 25 years old</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) 26 years old</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>PPACA requires plans that cover dependents to allow adult children to stay on a parent''s plan until they turn 26.</p>
</div>
<div class="lesson-quiz-item" data-correct="d">
<p class="lesson-quiz-question">Regarding the health benefit exchanges, as created by PPACA, all of the following statements are true EXCEPT</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) the name of California’s exchange is covered California</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) an individual enrolling in a bronze level plan is not eligible for reduced cost-sharing</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) an individual whose household income is 400% of the federal poverty level may receive a premium tax credit</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) an individual may only receive a premium tax credit for a plan if purchased through the exchange</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>Premium tax credits are calculated based on household income and Marketplace enrollment, but eligibility is not strictly limited to plans "purchased through the exchange" in every case — the other statements about Covered California''s name, bronze plans not qualifying for cost-sharing reductions, and the 400% FPL subsidy threshold are the well-established, accurate PPACA rules.</p>
</div>
<div class="lesson-quiz-item" data-correct="d">
<p class="lesson-quiz-question">An individual is allowed to enroll in individual health insurance under the following circumstances EXCEPT</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) during the annual open enrollment period</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) within 60 days of a qualifying event</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) at any time for Medi-Cal/Medicaid</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) within 30 days of being diagnosed with an illness</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>A new diagnosis isn''t a qualifying event that opens individual health enrollment — the recognized entry points are open enrollment, qualifying life events, and anytime eligibility for Medi-Cal/Medicaid.</p>
</div>', 4
where not exists (select 1 from public.lessons where module_id = '5b2b91d3-1ac3-4ea8-b29a-c97281e05ef2' and title = 'Progress Check: The Affordable Care Act (PPACA)');
update public.lessons set position = 5 where module_id = '5b2b91d3-1ac3-4ea8-b29a-c97281e05ef2' and title = 'Health Plan Types and Cost Sharing';
insert into public.lessons (id, module_id, title, description, duration, type, content, position)
select gen_random_uuid(), '5b2b91d3-1ac3-4ea8-b29a-c97281e05ef2', 'Progress Check: Health Plan Types and Cost Sharing', '13 practice questions covering Health Plan Types and Cost Sharing.', '13 min', 'quiz', '<div class="lesson-quiz-item" data-correct="c">
<p class="lesson-quiz-question">Traditional comprehensive major medical plans include all of the following EXCEPT</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) coinsurance</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) deductibles</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) first-dollar coverage</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) out-of-pocket maximums, Stop Loss</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>Comprehensive major medical plans require the insured to share costs through deductibles and coinsurance, so they do not provide first-dollar coverage from the very first expense.</p>
</div>
<div class="lesson-quiz-item" data-correct="b">
<p class="lesson-quiz-question">A policyholder has a major medical plan with a 80%/20% coinsurance and a deductible of $75. and receives a bill for $175, how much will the insurer pay?</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) $35</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) $80</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) $100</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) $140</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>After the $75 deductible, $100 remains. The insurer pays its 80% coinsurance share of that: 80% x $100 = $80.</p>
</div>
<div class="lesson-quiz-item" data-correct="d">
<p class="lesson-quiz-question">A policyholder has a major medical plan with a 80%/20% coinsurance and a deductible of $75. If the insured has previously met her deductible and receives a bill for $175, how much will the insurer pay?</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) $35</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) $74</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) $100</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) $140</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>With the deductible already met, the full $175 is subject to coinsurance, so the insurer pays 80% x $175 = $140.</p>
</div>
<div class="lesson-quiz-item" data-correct="a">
<p class="lesson-quiz-question">A commonly used cost containment measure for emergency hospital care under a major medical expense plan is the</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) deductible</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) premium tax</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) impatient fee</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) pre-admission test</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>A deductible requires the insured to pay an initial amount out of pocket, discouraging unnecessary use of services and helping control overall plan costs.</p>
</div>
<div class="lesson-quiz-item" data-correct="b">
<p class="lesson-quiz-question">When does an insured qualify for stop-loss coverage? (story, protect the insured not to pay too much)</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) When the insured reaches an age stated in the policy</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) When claims exceed a specified limit in a set period of time</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) When claims exceed the policy''s maximum lifetime benefit limit</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) When the average claim amount exceeds the limit stated in the policy</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>Stop-loss (the out-of-pocket maximum) kicks in once the insured''s costs in a given period cross a set dollar threshold, after which the insurer covers 100%.</p>
</div>
<div class="lesson-quiz-item" data-correct="b">
<p class="lesson-quiz-question">The type of health care provider that provides both the health care services and health care coverage is called</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) a preferred provider organization, PPO</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) a health maintenance organization, HMO</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) a major medical organization</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) An EPO</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>An HMO both delivers health care services (through its own or contracted providers) and provides the health coverage itself, unlike a PPO which only contracts for discounted access.</p>
</div>
<div class="lesson-quiz-item" data-correct="b">
<p class="lesson-quiz-question">A person who makes a contract with a HMO, either directly or through an insurer or marketing organization, under which the person or other designated persons are entitled to the health care services is called a</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) Policyowner</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) Subscriber</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) Provider</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) Contractor</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>The individual who contracts with an HMO for health care services is called a subscriber, distinguishing them from the providers who deliver the care.</p>
</div>
<div class="lesson-quiz-item" data-correct="c">
<p class="lesson-quiz-question">Who acts as the gatekeeper in a Health Maintenance Organization (HMO)?</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) Policyowner</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) HMO Arbritrator</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) Primary care physician</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) Insurance Company</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>The primary care physician coordinates a member''s care and must authorize referrals to specialists, acting as the HMO''s gatekeeper.</p>
</div>
<div class="lesson-quiz-item" data-correct="d">
<p class="lesson-quiz-question">Which of the following services are health maintenance organizations (HMO''s) NOT required to provide?</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) Emergency services</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) Hospitalization</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) Preventative services</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) Prescription drug</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>Prescription drug coverage is typically offered as an optional benefit, while emergency, hospitalization, and preventive services are core services HMOs must provide.</p>
</div>
<div class="lesson-quiz-item" data-correct="d">
<p class="lesson-quiz-question">Which statement about Health Maintenance Organizations is NOT true? (Not exact)</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) Members minimize out-of-pocket expenses by using HMO network providers</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) Subscribers pay a fixed periodic fee to the HMO</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) HMOs are known for stressing preventive care</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) When a member uses out-of-network providers, a higher monthly fee is charged</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>HMOs typically charge a higher out-of-pocket cost-share, not a higher recurring premium, when a member goes out-of-network, making choice d untrue.</p>
</div>
<div class="lesson-quiz-item" data-correct="c">
<p class="lesson-quiz-question">How is a health provider reimbursed if they do NOT have an agreement in place with the insurance company?</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) With a contingent fee</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) With a scheduled fee</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) With a usual, customary, and reasonable fee</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) With a reasonably appropriate fee</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>Without a contracted fee schedule, a non-participating provider is paid based on the usual, customary, and reasonable (UCR) charge for that service in the area.</p>
</div>
<div class="lesson-quiz-item" data-correct="c">
<p class="lesson-quiz-question">In medical expense insurance, what serves the same purpose as the elimination period in disability income insurance?</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) coinsurance</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) co-payment</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) deductible</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) maximum benefit</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>A deductible is the fixed dollar amount the insured must pay before medical expense benefits begin, serving the same cost-sharing function that a time-based elimination period serves in disability income insurance.</p>
</div>
<div class="lesson-quiz-item" data-correct="a">
<p class="lesson-quiz-question">Medical expense policies will typically cover which of the following?</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) Injuries caused by accidents</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) Routine dental care</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) Prescription eyeglasses</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) Voluntary cosmetic procedures</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>Basic medical expense policies cover treatment for accidental injuries (and illness), while routine dental care, eyeglasses, and elective cosmetic procedures are typically excluded.</p>
</div>', 6
where not exists (select 1 from public.lessons where module_id = '5b2b91d3-1ac3-4ea8-b29a-c97281e05ef2' and title = 'Progress Check: Health Plan Types and Cost Sharing');
update public.lessons set position = 7 where module_id = '5b2b91d3-1ac3-4ea8-b29a-c97281e05ef2' and title = 'Limited Policies and State Programs';
insert into public.lessons (id, module_id, title, description, duration, type, content, position)
select gen_random_uuid(), '5b2b91d3-1ac3-4ea8-b29a-c97281e05ef2', 'Progress Check: Limited Policies and State Programs', '8 practice questions covering Limited Policies and State Programs.', '8 min', 'quiz', '<div class="lesson-quiz-item" data-correct="a">
<p class="lesson-quiz-question">The most common type of specified/one/dread disease insurance policy is? (Limited policy)</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) cancer</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) cataract</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) diabetes</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) heart disease</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>Cancer policies are by far the most commonly sold type of specified/dread disease coverage.</p>
</div>
<div class="lesson-quiz-item" data-correct="a">
<p class="lesson-quiz-question">Which of the following does specified disease insurance NOT cover?</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) costs covered by medical expense insurance</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) medical expenses that are noncovered</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) incidental costs</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) out-of-pocket expenses</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>Specified disease policies only pay costs related to the one named disease that aren''t already covered by the insured''s regular medical expense insurance, avoiding duplicate payment.</p>
</div>
<div class="lesson-quiz-item" data-correct="b">
<p class="lesson-quiz-question">MRMIP stands for?</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) Minor Risk Medical Insurance Program</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) Major Risk Medical Insurance Program</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) Major Rehabilitation Medical Indemnity Plan</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) Minor Rehabilitation Medical Insurance Plan</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>MRMIP is California''s state program for residents who can''t get coverage elsewhere due to high medical risk, funded by tobacco tax.</p>
</div>
<div class="lesson-quiz-item" data-correct="a">
<p class="lesson-quiz-question">In what order are people on the MRMIP waiting list allowed to enroll?</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) Based on the date an individual''s application is received</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) Priority is given to California residents</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) Based on the individual''s date of birth</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) Priority is given to those with the most serious health issues</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>MRMIP enrolls applicants off its waiting list in the order their applications were received, not by age, residency, or severity of health condition.</p>
</div>
<div class="lesson-quiz-item" data-correct="c">
<p class="lesson-quiz-question">Where must you specifically reside to qualify for MRMIP?</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) North America</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) United States</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) California</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) California and its reciprocal states</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>The Major Risk Medical Insurance Program (MRMIP) requires applicants to be California residents.</p>
</div>
<div class="lesson-quiz-item" data-correct="d">
<p class="lesson-quiz-question">Which of the following is NOT an accurate description of Access for Infants and Mothers Program (AIM)?</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) Low-cost health care coverage for pregnant women</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) Only women who have private insurance plans with a maternity-only deductible or copayment greater than $500 are eligible</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) Eligibility is based on income</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) Only women who have private insurance plans with a maternity-only deductible or copayment greater than $1,500 are eligible</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>AIM eligibility requires a maternity-only deductible or copayment greater than $500, not $1,500, so the $1,500 threshold is the inaccurate statement.</p>
</div>
<div class="lesson-quiz-item" data-correct="d">
<p class="lesson-quiz-question">What does a Hospital Confinement indemnity policy pay for?</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) Pays for the entire cost of the hospital stay</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) Pays for the deductible and coinsurance of the hospital stay</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) Pays for cost of the hospital stay after the deductible and coinsurance has been met</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) Pays a specified daily amount while the insured is confined to a hospital</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>A hospital confinement indemnity policy pays a fixed, predetermined daily benefit for each day the insured is hospitalized, regardless of the actual medical expenses incurred.</p>
</div>
<div class="lesson-quiz-item" data-correct="b">
<p class="lesson-quiz-question">Which type of insurance can be purchased at airport, bus terminals, and railroad stations, vending machine?</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) temporary life insurance</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) travel accident insurance , bao hiem du lich</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) temporary health insurance</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) accidental death and dismemberment</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>Travel accident insurance is the short-term, low-cost accidental death policy traditionally sold from vending machines at transportation terminals.</p>
</div>', 8
where not exists (select 1 from public.lessons where module_id = '5b2b91d3-1ac3-4ea8-b29a-c97281e05ef2' and title = 'Progress Check: Limited Policies and State Programs');
update public.lessons set position = 9 where module_id = '5b2b91d3-1ac3-4ea8-b29a-c97281e05ef2' and title = 'Coordination of Benefits and Group Administration';
insert into public.lessons (id, module_id, title, description, duration, type, content, position)
select gen_random_uuid(), '5b2b91d3-1ac3-4ea8-b29a-c97281e05ef2', 'Progress Check: Coordination of Benefits and Group Administration', '5 practice questions covering Coordination of Benefits and Group Administration.', '5 min', 'quiz', '<div class="lesson-quiz-item" data-correct="d">
<p class="lesson-quiz-question">Coverage is limited for vision and dental insurance in all of the following ways, EXCEPT</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) Number of teeth cleanings per year</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) Dollar amount for eyeglass frames</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) Number of X-rays performed per year</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) Specific dollar amount for examinations</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>Vision and dental plans commonly cap benefits by frequency (cleanings, X-rays) or by a dollar limit on specific items like frames, but they typically don''t set a flat dollar cap on the exam charge itself.</p>
</div>
<div class="lesson-quiz-item" data-correct="d">
<p class="lesson-quiz-question">The group medical plan provision that applies when a claimant has coverage under more than one plan is known as (married, both spouse cover dependent/ primary/ secondary)</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) coinsurance</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) integration</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) maximum benefits</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) coordination of benefits</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>Coordination of benefits determines which of two or more group plans pays first (primary) and which pays second (secondary) so total reimbursement does not exceed actual expenses.</p>
</div>
<div class="lesson-quiz-item" data-correct="d">
<p class="lesson-quiz-question">If a company wants to have their own coverage but they don’t have expertise enough, what can they do?</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) Self-insured</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) Fully insured, hire third party to manage</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) Fully insured</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) Self-insured, hire third party to manage</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>Self-insuring while hiring a third-party administrator lets a company retain its own risk and any savings from doing so, while outsourcing the claims-handling expertise it lacks.</p>
</div>
<div class="lesson-quiz-item" data-correct="b">
<p class="lesson-quiz-question">Susan is insured through her Group Health Insurance plan and changed her coverage to an individual plan with the same insurer after her employment was terminated. This change is called a(n)</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) crossover</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) conversion</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) exchange</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) extension of benefits</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>The conversion privilege lets an insured switch from group coverage to an individual policy with the same insurer, without evidence of insurability, when their group coverage would otherwise end.</p>
</div>
<div class="lesson-quiz-item" data-correct="d">
<p class="lesson-quiz-question">Which of the following statement concerning the usual coordination of benefits provision is correct?</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) Medicare coverage is always primary to medical coverage</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) coverage under COBRA is primary to coverage as an active employee</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) when two plans both have the provision, coverage as an employee is primary and coverage as a dependent is excess</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) coverage under any plan with the provision is primary to coverage under any plan without the provision</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>Under standard coordination of benefits rules, a plan that contains a COB provision takes priority over a plan that has none; Medicare and COBRA are generally secondary to active employee group coverage, ruling out the other choices.</p>
</div>', 10
where not exists (select 1 from public.lessons where module_id = '5b2b91d3-1ac3-4ea8-b29a-c97281e05ef2' and title = 'Progress Check: Coordination of Benefits and Group Administration');
update public.lessons set position = 11 where module_id = '5b2b91d3-1ac3-4ea8-b29a-c97281e05ef2' and title = 'Group Health Insurance Laws';
insert into public.lessons (id, module_id, title, description, duration, type, content, position)
select gen_random_uuid(), '5b2b91d3-1ac3-4ea8-b29a-c97281e05ef2', 'Progress Check: Group Health Insurance Laws', '10 practice questions covering Group Health Insurance Laws.', '10 min', 'quiz', '<div class="lesson-quiz-item" data-correct="b">
<p class="lesson-quiz-question">Health insurance counseling and advocacy program (HICAP) counselors can do all of the following EXCEPT</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) help evaluate policies</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) charge for their services</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) assist in medical record keeping</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) explain Medicare supplement coverage’s</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>HICAP counseling is a free, volunteer service — counselors are prohibited from charging for their advice or giving legal advice.</p>
</div>
<div class="lesson-quiz-item" data-correct="b">
<p class="lesson-quiz-question">The employee retirement income security Act of 1974 (ERISA) regulates group health insurance in the area of</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) family and medical leave</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) disclosure and reporting</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) Americans with disabilities</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) continuation of group health care</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>ERISA primarily governs disclosure and reporting requirements for employee benefit plans, such as providing summary plan descriptions to participants.</p>
</div>
<div class="lesson-quiz-item" data-correct="c">
<p class="lesson-quiz-question">The family and medical leave act (FMLA) covers all of the following EXCEPT</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) the adoption of a child</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) caring for a parent with a serious health condition</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) traveling with a spouse who has been transferred oversea</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) a serious health condition that prevents an employee from working</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>FMLA leave covers medical conditions, childbirth/adoption, and caregiving — it doesn''t extend to unrelated events like accompanying a spouse on an overseas transfer.</p>
</div>
<div class="lesson-quiz-item" data-correct="c">
<p class="lesson-quiz-question">Kimberly is an employee on leave under the Family and Medical Leave Act (FMLA). What will happen to her group health coverage?</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) She will have to purchase short-term health coverage through the State while on leave</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) Her coverage will be temporarily suspended while she is on leave</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) She continues to be enrolled during the leave</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) She will be forced to convert her group plan to an individual plan</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>FMLA specifically protects the employee''s group health coverage, keeping it active throughout the leave period.</p>
</div>
<div class="lesson-quiz-item" data-correct="b">
<p class="lesson-quiz-question">Group health plans obligated by the consolidated omnibus budget reconciliation act (COBRA) cover groups of at least</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) 10 employees’</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) 20 employees</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) 40 employees</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) 60 employees</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>COBRA continuation coverage requirements apply to group health plans sponsored by employers with 20 or more employees.</p>
</div>
<div class="lesson-quiz-item" data-correct="b">
<p class="lesson-quiz-question">Under the Consolidated Omnibus Budget Reconciliation Act (COBRA), a terminated employee''s benefits must</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) be less extensive and premium cannot exceed 102%</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) be the same and the premium cannot exceed 102%</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) be more extensive and the premium cannot exceed 102%</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) be the same as well as the premium</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>COBRA continuation coverage must be identical to what the employee had while actively employed, and the insurer may charge no more than 102% of the premium (the extra 2% covers administration).</p>
</div>
<div class="lesson-quiz-item" data-correct="b">
<p class="lesson-quiz-question">Ron has a new employer and wishes to enroll in the company''s group health plan. In determining whether his pre-existing health condition applies, Ron cannot have more than a ___ day gap without previous health insurance.</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) 45</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) 63</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) 75</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) 90</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>Under HIPAA, a break in health coverage of 63 days or more is a significant gap that forfeits credit for prior creditable coverage toward a new plan''s pre-existing condition exclusion.</p>
</div>
<div class="lesson-quiz-item" data-correct="d">
<p class="lesson-quiz-question">In California, the elderly can receive information about health related issues from?</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) Medi-Cal/Medicaid</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) Medicare</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) Major Risk Medical Insurance Program (MRMIP)</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) Health Insurance Counseling and Advocacy Program (HiCAP)</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>HICAP (Health Insurance Counseling and Advocacy Program) gives California seniors free, unbiased counseling on Medicare and other health insurance questions.</p>
</div>
<div class="lesson-quiz-item" data-correct="d">
<p class="lesson-quiz-question">Which group provides information about health-related issues to the elderly in California?</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) Medicare supplement insurers</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) long-term care insurance providers</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) the national health care anti-fraud association</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) the health insurance counseling and advocacy program (HICAP)</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>The Health Insurance Counseling and Advocacy Program (HICAP) provides free, unbiased information and counseling on health insurance issues to California seniors.</p>
</div>
<div class="lesson-quiz-item" data-correct="d">
<p class="lesson-quiz-question">What is the cost of service from the Health Insurance Counseling Advocacy Program (HICAP)?</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) $10 per appointment</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) $25 per appointment</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) $50 per appointment</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) no charge</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>HICAP provides free, unbiased counseling to Medicare beneficiaries and other consumers on health insurance issues.</p>
</div>', 12
where not exists (select 1 from public.lessons where module_id = '5b2b91d3-1ac3-4ea8-b29a-c97281e05ef2' and title = 'Progress Check: Group Health Insurance Laws');
update public.lessons set position = 13 where module_id = '5b2b91d3-1ac3-4ea8-b29a-c97281e05ef2' and title = 'Disability Income Insurance';
insert into public.lessons (id, module_id, title, description, duration, type, content, position)
select gen_random_uuid(), '5b2b91d3-1ac3-4ea8-b29a-c97281e05ef2', 'Progress Check: Disability Income Insurance', '7 practice questions covering Disability Income Insurance.', '7 min', 'quiz', '<div class="lesson-quiz-item" data-correct="d">
<p class="lesson-quiz-question">Under a disability income insurance policy with an own occupation clause, an individual who can no longer perform the tasks of the job held at the time of injury is considered</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) presumptively disabled</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) medically disabled</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) gainfully disabled</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) totally disabled</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>Under an own-occupation definition, the insured is considered totally disabled if unable to perform the material duties of their own specific occupation, even if able to work in another job.</p>
</div>
<div class="lesson-quiz-item" data-correct="d">
<p class="lesson-quiz-question">Which of the following is a characteristic of the disability elimination period?</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) Benefits are optionally payable</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) Benefits are conditionally payable</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) Benefits are unconditionally payable</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) Benefits are not payable</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>The elimination period is a waiting period (like a deductible in time) during which no disability benefits are payable at all, before benefits begin.</p>
</div>
<div class="lesson-quiz-item" data-correct="c">
<p class="lesson-quiz-question">An insured has a disability income policy with a $1,500 monthly benefit and a 30-day elimination period. The insured is unable to work for 120 days following an accident. What amount will the policy pay?</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) $1,500</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) $3,000</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) $4,500</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) $6,000</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>The 30-day elimination period isn''t covered, leaving 90 days (3 months) of payable benefits; at $1,500 a month that comes to $4,500.</p>
</div>
<div class="lesson-quiz-item" data-correct="a">
<p class="lesson-quiz-question">Which of these statements is NOT true concerning recurrent (happened again) disabilities?</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) The insurer continues coverage after a new elimination period</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) The recurrence of a disability must occur within a specified time period after the prior disability</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) A recurrent disability is considered to be a continuation of the prior disability</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) The recurrent disability must be caused from the original disability</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>A recurrent disability is treated as a continuation of the original claim, so the insurer does not require a new elimination period, contrary to choice a.</p>
</div>
<div class="lesson-quiz-item" data-correct="d">
<p class="lesson-quiz-question">Under group disability insurance an employee is eligible for a partial disability benefit when they can</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) no longer work full or part time because of an accidental injury</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) collect adjusted lost wages while on leave of absence due to illness</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) demonstrate their inability to perform due to loss of sight in one eye</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) performs some of their job activities on a part time basis injury</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>A partial disability benefit applies when an employee can still perform some job duties on a part-time or limited basis, unlike total disability, which prevents performing the job at all.</p>
</div>
<div class="lesson-quiz-item" data-correct="b">
<p class="lesson-quiz-question">All of the following conditions must be met to qualify for residual disability benefits under a disability income policy EXCEPT</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) currently earns at least 20% less than prior income</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) qualifies for social security disability benefits</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) continues to be under a physician''s care</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) is able to work full- or part-time</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>Residual disability benefits are based on a partial loss of income and time/duties while under a physician''s care, not on separately qualifying for Social Security disability benefits.</p>
</div>
<div class="lesson-quiz-item" data-correct="d">
<p class="lesson-quiz-question">Business Overhead Expense Insurance pays for</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) business expenses during an economic downturn</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) business owner''s salary in the event of the owner''s disability</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) any loss in value of a business if the owner becomes disabled</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) business expenses when a business owner becomes disabled</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>Business overhead expense insurance reimburses fixed operating costs, such as rent, utilities, and employee salaries, while the owner is disabled — it doesn''t replace the owner''s own income.</p>
</div>', 14
where not exists (select 1 from public.lessons where module_id = '5b2b91d3-1ac3-4ea8-b29a-c97281e05ef2' and title = 'Progress Check: Disability Income Insurance');
update public.lessons set position = 15 where module_id = '5b2b91d3-1ac3-4ea8-b29a-c97281e05ef2' and title = 'Social Security Benefits';
insert into public.lessons (id, module_id, title, description, duration, type, content, position)
select gen_random_uuid(), '5b2b91d3-1ac3-4ea8-b29a-c97281e05ef2', 'Progress Check: Social Security Benefits', '10 practice questions covering Social Security Benefits.', '10 min', 'quiz', '<div class="lesson-quiz-item" data-correct="d">
<p class="lesson-quiz-question">A worker is entitled to Social Security disability benefits if all of the following are true, EXCEPT for:</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) worker is under age 65</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) worker is insured for disability benefits</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) disability is expected to continue for 12 months or result in death</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) worker cannot perform his or her current job, but is actively seeking other employment</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>Social Security disability requires the inability to do any substantial gainful work, not just the worker''s current job — someone able to seek other employment doesn''t meet that bar.</p>
</div>
<div class="lesson-quiz-item" data-correct="b">
<p class="lesson-quiz-question">Which statement is NOT true regarding Social Security benefits?</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) Benefit eligibility is based upon fully insured status</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) Benefits are designed to replace the entire amount of the worker''s earnings</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) Disability is expected to continue for 12 months or result in death</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) Worker must be totally and permanently disabled for at least 5 months and unable to work again to be eligible for benefits</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>Social Security is only designed to replace a portion of pre-retirement/disability income, not the entire amount a worker earned.</p>
</div>
<div class="lesson-quiz-item" data-correct="c">
<p class="lesson-quiz-question">How long is a person expected to be disabled in order to receive Social Security disability benefits?</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) 4 months</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) 6 months</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) 12 months</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) 18 months</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>To qualify, the disability must be expected to last at least 12 months, or result in death.</p>
</div>
<div class="lesson-quiz-item" data-correct="a">
<p class="lesson-quiz-question">Fully insured status for social security benefits needs</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) 40 quarters</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) 30 quarters</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) 20 quarters</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) 10 quarters</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>Fully insured status under Social Security requires 40 quarters of covered work, generally about 10 years of employment.</p>
</div>
<div class="lesson-quiz-item" data-correct="a">
<p class="lesson-quiz-question">Retirement benefits under social security are available only for workers who are</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) fully insured</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) currently</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) partially</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) totally</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>Social Security retirement benefits require a worker to be "fully insured," meaning they have earned enough quarters of coverage through payroll taxes.</p>
</div>
<div class="lesson-quiz-item" data-correct="c">
<p class="lesson-quiz-question">A worker dies who is credited with 6 quarters of coverage during the last 13-quarter period. What status does the worker have under social security?</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) fully insured</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) partially insured</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) currently insured</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) disability insured</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>A worker with at least 6 quarters of coverage in the last 13 quarters before death is considered "currently insured," which qualifies certain survivors for limited benefits.</p>
</div>
<div class="lesson-quiz-item" data-correct="a">
<p class="lesson-quiz-question">The period in which there are no Social Security benefits for the surviving spouse is called the</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) blackout period</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) elimination period</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) ineligible period</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) dependency period</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>The blackout period is the span with no Social Security survivor benefits, generally after the youngest child turns 16 and before the surviving spouse reaches eligible retirement age.</p>
</div>
<div class="lesson-quiz-item" data-correct="b">
<p class="lesson-quiz-question">A surviving spouse without dependent children is eligible for social security survivor benefits at age</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) 55</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) 60</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) 62</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) 65</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>A surviving spouse with no dependent children becomes eligible for Social Security survivor benefits starting at age 60 (reduced benefits) under current rules.</p>
</div>
<div class="lesson-quiz-item" data-correct="c">
<p class="lesson-quiz-question">Social security survivor benefits are not available for all of the following EXCEPT</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) a surviving spouse over age 50</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) children age 19 who are full-time students</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) a spouse of any age who is caring for children under age 16</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) parents of any age who were dependent upon the deceased worker</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>A surviving spouse caring for the deceased worker''s child under age 16 qualifies for survivor benefits at any age, while a non-disabled spouse otherwise must wait until age 60, a child''s benefit generally requires being under 18 (or 19 and still in secondary school), and a dependent parent must be at least age 62.</p>
</div>
<div class="lesson-quiz-item" data-correct="a">
<p class="lesson-quiz-question">The social security blackout period ends when the surviving spouse reaches the age of</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) 60</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) 61</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) 62</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) 65</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>The Social Security blackout period ends at age 60, when a surviving spouse becomes eligible for reduced early survivor benefits.</p>
</div>', 16
where not exists (select 1 from public.lessons where module_id = '5b2b91d3-1ac3-4ea8-b29a-c97281e05ef2' and title = 'Progress Check: Social Security Benefits');
update public.lessons set position = 17 where module_id = '5b2b91d3-1ac3-4ea8-b29a-c97281e05ef2' and title = 'Long-Term Care Insurance and Workers'' Compensation';
insert into public.lessons (id, module_id, title, description, duration, type, content, position)
select gen_random_uuid(), '5b2b91d3-1ac3-4ea8-b29a-c97281e05ef2', 'Progress Check: Long-Term Care Insurance and Workers'' Compensation', '14 practice questions covering Long-Term Care Insurance and Workers'' Compensation.', '14 min', 'quiz', '<div class="lesson-quiz-item" data-correct="d">
<p class="lesson-quiz-question">Long-term care insurance</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) is another name for basic hospital expense insurance</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) can be cancelled solely on the basis of the insured''s deteriorating health</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) often is called blanket health insurance</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) is designed to provide coverage for at least 12 consecutive months</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>To be classified as long-term care coverage, a policy must provide benefits for a minimum of 12 consecutive months.</p>
</div>
<div class="lesson-quiz-item" data-correct="b">
<p class="lesson-quiz-question">An Outline of ______ is required for long-term care policies and provides a brief description of the important features of the policy.</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) Policy</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) Coverage</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) Summary</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) Benefits</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>Long-term care policies must come with an "Outline of Coverage" that summarizes the policy''s key features in plain language.</p>
</div>
<div class="lesson-quiz-item" data-correct="d">
<p class="lesson-quiz-question">How many "activities of daily living" must an insured be UNABLE to perform in order to meet the chronically ill requirement of a Long-Term Care policy?</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) Summary</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) Benefits</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) Minimum of one activity of daily living</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) Minimum of two activities of daily living</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>Being unable to perform at least 2 of the 6 ADLs (bathing, dressing, eating, transferring, toileting, continence) is the standard trigger for LTC benefits.</p>
</div>
<div class="lesson-quiz-item" data-correct="a">
<p class="lesson-quiz-question">Two of the long-term care chronically ill activities of daily living (ADLs) are</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) eating and dressing</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) bathing and hearing</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) sleeping and walking</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) speaking and incontinence</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>Eating and dressing are two of the standard activities of daily living (along with bathing, toileting, transferring, and continence) used to assess eligibility for long-term care benefits.</p>
</div>
<div class="lesson-quiz-item" data-correct="b">
<p class="lesson-quiz-question">Which of the following conditions would not be included among the chronic illness triggers of a long-term care policy?</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) Alzheimer’s</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) deafness</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) dementia</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) incontinence</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>Deafness is a sensory impairment, not one of the standard chronic illness triggers (such as Alzheimer''s, dementia, or incontinence) used to determine eligibility for long-term care benefits.</p>
</div>
<div class="lesson-quiz-item" data-correct="d">
<p class="lesson-quiz-question">Which long-term care policy provision allows for a periodic increase in policy benefits?</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) portability</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) suitability</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) nonforfeiture</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) inflation protection</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>An inflation protection provision periodically increases a long-term care policy''s benefit amounts to help keep pace with the rising cost of care.</p>
</div>
<div class="lesson-quiz-item" data-correct="b">
<p class="lesson-quiz-question">During the solicitation (1st selling appointment) of a long term care insurance rider, a life agent must consider all of the following EXCEPT the applicant''s?</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) goals and needs</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) attending physician statement (doctor record)</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) ability to pay for the coverage</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) existing long term care coverage</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>The first-appointment discussion focuses on the applicant''s needs, goals, ability to pay, and existing coverage — a physician''s statement is a medical underwriting document gathered later, not part of this initial solicitation.</p>
</div>
<div class="lesson-quiz-item" data-correct="c">
<p class="lesson-quiz-question">The adult day care coverage level of long-term care policy provides for</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) living arrangements in an assisted living center</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) full time care at a facility for elderly individuals</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) part time care at a facility for elderly individuals who live at home</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) full time home health care</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>Adult day care under an LTC policy covers part-time, daytime supervision and care for elderly individuals who still live at home, rather than full-time facility or home care.</p>
</div>
<div class="lesson-quiz-item" data-correct="a">
<p class="lesson-quiz-question">According to the California insurance code, all of the following long-term care (LTC) insurance sales are considered unnecessary EXCEPT</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) a replacement LTC policy with equal benefits for a lower premium</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) a replacement LTC policy with fewer benefits and a higher premium</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) an additional LTC policy to an insured who already has two LTC policies</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) Two additional LTC policies that equal the combined benefits of an existing one</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>Replacing an LTC policy with one offering equal benefits at a lower premium benefits the insured and is not considered an unnecessary sale, unlike replacements that reduce benefits or raise cost, or piling on redundant coverage.</p>
</div>
<div class="lesson-quiz-item" data-correct="d">
<p class="lesson-quiz-question">Rating an individual''s need for long-term care benefits can be measured by</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) gatekeeper authority</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) deductibles</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) custodial need</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) activities of daily living</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>Eligibility for long-term care benefits is typically measured by the insured''s inability to perform a specified number of Activities of Daily Living (ADLs), such as bathing, dressing, or eating.</p>
</div>
<div class="lesson-quiz-item" data-correct="c">
<p class="lesson-quiz-question">An insurance policy issued in California may be called a comprehensive long-term care insurance policy if benefits are provided for combine benefits</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) Respite care only</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) Home care only</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) Institutional (nursing facilities) and home care</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) Loss of life</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>A "comprehensive" long-term care policy must cover both institutional care (nursing facilities) and home/community-based care, not just one setting.</p>
</div>
<div class="lesson-quiz-item" data-correct="c">
<p class="lesson-quiz-question">A person cannot sell long-term care insurance unless that person is licensed as an insurance producer and has successfully completed a one-time education course of</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) 4 hours</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) 6 hours</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) 8 hours</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) 10 hours</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>California requires producers to complete a one-time 8-hour long-term care training course before they may sell LTC insurance.</p>
</div>
<div class="lesson-quiz-item" data-correct="b">
<p class="lesson-quiz-question">which of the following nursing home options would BEST suit an individual who needs some nursing care and supervision but NOT full-time care?</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) Custodial care homes</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) Assisted living facilities</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) Skilled nursing facilities</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) Congregate housing</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>Assisted living facilities provide help with daily activities and some supervision or nursing care without the full-time, intensive care given at a skilled nursing facility.</p>
</div>
<div class="lesson-quiz-item" data-correct="a">
<p class="lesson-quiz-question">Long-term care insurance may be purchased in all of the following forms EXCEPT</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) federal government-sponsored policies</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) riders to cash value life insurance policies</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) Stand alone LTC</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) Link benefit</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>There is no federal government-sponsored long-term care insurance policy available for individual purchase; LTC coverage instead comes from stand-alone policies, riders on cash value life insurance, or linked-benefit (hybrid) products.</p>
</div>', 18
where not exists (select 1 from public.lessons where module_id = '5b2b91d3-1ac3-4ea8-b29a-c97281e05ef2' and title = 'Progress Check: Long-Term Care Insurance and Workers'' Compensation');

-- Verify: final lesson order (progress checks interleaved between
-- every pair of lessons).
select m.title as module_title, l.module_id, l.position, l.title, l.type, l.duration
from public.lessons l join public.modules m on m.id = l.module_id
where m.title = 'Health Insurance'
order by l.module_id, l.position;
