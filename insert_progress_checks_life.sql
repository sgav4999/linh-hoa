-- Inserts a "Progress Check" quiz lesson right after every lesson in
-- Life Insurance, built from the existing practice-exam question bank,
-- matched to that lesson's topic. Run as one transaction, "without RLS" mode.

-- lessons.type didn't allow 'quiz' yet (only 'text'/'video' originally) --
-- safe to run even if another one of these three files already did this.
alter table public.lessons drop constraint if exists lessons_type_check;
alter table public.lessons add constraint lessons_type_check check (type in ('text', 'video', 'quiz'));

update public.lessons set position = position + 1000 where module_id = '929e50a4-5e94-4e93-8f07-fe94b93f0619';
update public.lessons set position = 1 where module_id = '929e50a4-5e94-4e93-8f07-fe94b93f0619' and title = 'Term Life Insurance';
insert into public.lessons (id, module_id, title, description, duration, type, content, position)
select gen_random_uuid(), '929e50a4-5e94-4e93-8f07-fe94b93f0619', 'Progress Check: Term Life Insurance', '11 practice questions covering Term Life Insurance.', '11 min', 'quiz', '<div class="lesson-quiz-item" data-correct="a">
<p class="lesson-quiz-question">Which of the following policies does NOT build cash value?</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) Term</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) Straight Life</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) Endowment</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) Variable Life</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>Term insurance provides pure death protection for a limited period with no savings component, so it never accumulates cash value.</p>
</div>
<div class="lesson-quiz-item" data-correct="a">
<p class="lesson-quiz-question">Which of the following types of life insurance policy has no cash value?</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) 10-year level term</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) Whole life</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) Life paid-up at age 65 (LP65)</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) Universal life</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>A 10-year level term policy is pure protection for a set period with no savings element, so it builds no cash value, unlike whole life, LP65, or universal life.</p>
</div>
<div class="lesson-quiz-item" data-correct="c">
<p class="lesson-quiz-question">Term insurance is appropriate for someone who</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) seeks living benefits for themselves</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) seeks a policy that builds cash value</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) seeks temporary protection and lower premium</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) seeks permanent protection and higher premiums</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>Term insurance provides pure, temporary death protection at a lower premium than permanent insurance, since it builds no cash value and only pays if death occurs during the term.</p>
</div>
<div class="lesson-quiz-item" data-correct="a">
<p class="lesson-quiz-question">Shirley has a $500,000 10-year non-renewable level term life policy. If she dies 15 years after the policy''s inception date, how much will her beneficiary receive?</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) Nothing</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) $100,000</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) $250,000</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) $500,000</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>The policy was non-renewable and its 10-year term already ended 5 years earlier, so there''s no coverage in force — nothing is paid.</p>
</div>
<div class="lesson-quiz-item" data-correct="d">
<p class="lesson-quiz-question">Your clients has just bought a new home which he has financed with a $150k, 7.5% interest, 30-year bank loan. He would like to be sure that if he dies that the unpaid balance of the mortgage would be paid. He wants a policy that will cover the balance - no more, no less- anytime during the life of the mortgage. Which policy is designed to meet this need?</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) level term policy</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) home service policy</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) increasing term policy</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) decreasing term policy</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>A decreasing term policy''s death benefit declines over time to track a shrinking mortgage balance, matching the coverage the client wants without paying for more protection than is owed.</p>
</div>
<div class="lesson-quiz-item" data-correct="d">
<p class="lesson-quiz-question">Which type of insurance policy provides death benefits that matches the projected outstanding debt on an individual''s home?</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) level term</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) joint life</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) family protection</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) mortgage redemption</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>A mortgage redemption policy is a decreasing term policy whose declining death benefit is designed to track the shrinking balance owed on a mortgage.</p>
</div>
<div class="lesson-quiz-item" data-correct="d">
<p class="lesson-quiz-question">Krissa purchases a 10-year level term life insurance policy that has a death benefit of $200,000. Which of these statements is true?</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) The policy automatically converts to whole life after the 10-year period</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) The face amount will remain constant and the premium will increase over the 10-year period</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) The premium will remain constant and the face amount will increase over the 10-year period</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) The face amount and premium will remain constant over the 10-year period</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>"Level" term means both the face amount and the premium stay the same for the entire term.</p>
</div>
<div class="lesson-quiz-item" data-correct="d">
<p class="lesson-quiz-question">All of the following are true about term life insurance policies EXCEPT the</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) insured can choose the premium payment mode</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) insured must answer medical questions on the application</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) face amount is paid if the insured dies during the policy period</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) face amount is paid if the insured survives to the end of the policy period</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>Term insurance only pays a benefit if the insured dies during the term. Surviving to the end pays nothing, since term has no cash value or maturity benefit.</p>
</div>
<div class="lesson-quiz-item" data-correct="b">
<p class="lesson-quiz-question">Which type of insurance guarantees the right to renew the policy each year, regardless of the health, but at an increased premium?</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) level term</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) renewal term</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) decreasing term</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) convertible term</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>Renewable term insurance guarantees annual renewal without new evidence of insurability, with the premium increasing as the insured ages.</p>
</div>
<div class="lesson-quiz-item" data-correct="c">
<p class="lesson-quiz-question">Decreasing term life insurance is often used to</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) provide retirement funds</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) accumulate cash value</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) Provide coverage for a home mortgage</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) provide coverage for estate taxes</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>Decreasing term insurance''s death benefit declines over time, mirroring a mortgage balance, making it a low-cost way to cover that debt as it''s paid down.</p>
</div>
<div class="lesson-quiz-item" data-correct="a">
<p class="lesson-quiz-question">In a renewable term life insurance policy, the contract will usually</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) require a higher premium payable at each renewal</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) require a lower premium payable at each renewal</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) keep the same premium level at each renewal</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) stipulate a higher cash value at each renewal</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>A renewable term policy renews at the insured''s attained (increased) age without new proof of insurability, so the premium goes up at each renewal to reflect the higher mortality risk.</p>
</div>', 2
where not exists (select 1 from public.lessons where module_id = '929e50a4-5e94-4e93-8f07-fe94b93f0619' and title = 'Progress Check: Term Life Insurance');
update public.lessons set position = 3 where module_id = '929e50a4-5e94-4e93-8f07-fe94b93f0619' and title = 'Permanent Life Insurance & Riders';
insert into public.lessons (id, module_id, title, description, duration, type, content, position)
select gen_random_uuid(), '929e50a4-5e94-4e93-8f07-fe94b93f0619', 'Progress Check: Permanent Life Insurance & Riders', '22 practice questions covering Permanent Life Insurance & Riders.', '22 min', 'quiz', '<div class="lesson-quiz-item" data-correct="c">
<p class="lesson-quiz-question">Which type of insurance coverage has both a savings element and a flexible premium option?</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) term life</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) whole life</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) universal life</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) there is currently no insurance product available in the standard market which has both of these features</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>Universal life combines a cash value (savings) component with flexible premiums the owner can adjust in amount and timing.</p>
</div>
<div class="lesson-quiz-item" data-correct="d">
<p class="lesson-quiz-question">Variable life insurance and Universal life insurance are very similar. Which of these features are held exclusively by variable universal life insurance?</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) Policyowner may increase or decrease the premium payments</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) Policyowner may increase or decrease the face amount</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) Policyowner can contribute large sums of money</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) Policyowner has the right to select the investment which will provide the greatest return</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>Only variable universal life gives the policyowner the right to choose and direct how cash value is invested among separate account subaccounts; flexible premiums and adjustable face amounts are shared with regular universal life.</p>
</div>
<div class="lesson-quiz-item" data-correct="d">
<p class="lesson-quiz-question">A life insurance policy written after 1988 that fails to meet the seven-pay test is known as</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) an endowment policy</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) a modified life policy</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) a single premium contract</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) a modified endowment contract</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>A policy that fails the seven-pay test is reclassified as a modified endowment contract (MEC), which loses some of the favorable tax treatment on withdrawals and loans.</p>
</div>
<div class="lesson-quiz-item" data-correct="b">
<p class="lesson-quiz-question">Mark, age 45, has a Modified Endowment Contract (MEC). What is the tax penalty for taking a loan against this policy prior to age 59 1/2?</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) 5%</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) 10%</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) 15%</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) 25%</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>Loans and other pre-59½ distributions from a Modified Endowment Contract are taxed as income to the extent of gain and hit with an additional 10% federal tax penalty.</p>
</div>
<div class="lesson-quiz-item" data-correct="c">
<p class="lesson-quiz-question">An endorsement found in an insurance plan which modifies the provisions of the policy is called a(n)</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) Attachment</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) add-on</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) rider</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) supplement</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>A rider is an endorsement attached to a policy that adds to, modifies, or limits its provisions.</p>
</div>
<div class="lesson-quiz-item" data-correct="c">
<p class="lesson-quiz-question">The additional premium charged by an insurer for adding the accidental death benefit to a whole life policy</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) increases the policy''s cash value</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) increase the yearly dividend amount</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) does not affect the policy’s cash value</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) decrease the length of time that premiums are payable</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>The accidental death rider is a separate charge that pays an extra benefit only if death results from an accident; it does not affect the base policy''s cash value accumulation.</p>
</div>
<div class="lesson-quiz-item" data-correct="a">
<p class="lesson-quiz-question">Which type of life insurance is normally associated with a Payor Benefit rider?</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) Juvenile insurance</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) Family income insurance</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) Spouse insurance</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) Term rider</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>Juvenile insurance commonly carries a payor benefit rider, which waives premiums on the child''s policy if the paying adult dies or becomes disabled.</p>
</div>
<div class="lesson-quiz-item" data-correct="d">
<p class="lesson-quiz-question">The payor rider on a life policy provides that if the payor dies or becomes disabled before the insured juvenile the age specified in the policy that the</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) insurer will make all future payments</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) insured''s estate will make the premium payments</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) insurer will lend money to keep the policy in force</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) insurer will make the payments until the insured juvenile reaches a specified age - usually 21 or 25</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>The payor rider waives future premiums, with the insurer making the payments, until the juvenile insured reaches the specified age (typically 21 or 25), if the payor dies or becomes disabled.</p>
</div>
<div class="lesson-quiz-item" data-correct="b">
<p class="lesson-quiz-question">The insured is totally and permanently disabled. The insured''s policy continues in force without payment of further premiums because the policy contains a</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) guaranteed insurability provision</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) waiver of premium provision</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) reinstatement provision</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) grace period provision</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>The waiver of premium provision keeps a life policy in force without requiring premium payments once the insured becomes totally and permanently disabled, as defined by the policy.</p>
</div>
<div class="lesson-quiz-item" data-correct="a">
<p class="lesson-quiz-question">If an insured dies because of an accident, which type of life insurance rider will provide additional coverage?</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) Accidental death rider</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) Payor rider</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) Accelerated rider</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) Extended term rider</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>An accidental death rider (sometimes called accidental death benefit or "double indemnity") pays an additional death benefit when death results from an accident.</p>
</div>
<div class="lesson-quiz-item" data-correct="d">
<p class="lesson-quiz-question">Guaranteed Insurability insurance refers to an insurance policy with no</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) Deductible</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) waiting period</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) Claim restrictions</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) Medical underwriting</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>A guaranteed insurability provision lets the insured add coverage at specified points without new medical underwriting or proof of insurability.</p>
</div>
<div class="lesson-quiz-item" data-correct="c">
<p class="lesson-quiz-question">Which of the following is NOT a common life insurance policy rider?</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) waiver of premium</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) automatic premium loan</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) extended term</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) accidental death</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>Extended term is a nonforfeiture option for using cash value, not a policy rider; waiver of premium, automatic premium loan, and accidental death are all common riders that add benefits to a policy.</p>
</div>
<div class="lesson-quiz-item" data-correct="c">
<p class="lesson-quiz-question">Which provision will pay a portion of the death benefit prior to the insured''s death due to a serious illness?</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) Cash surrender</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) Return of premium</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) Accelerated death benefit</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) Nonforfeiture</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>The accelerated death benefit provision advances part of the death benefit to a living insured who is diagnosed with a qualifying serious or terminal illness.</p>
</div>
<div class="lesson-quiz-item" data-correct="c">
<p class="lesson-quiz-question">Which of these is considered to be a Living Benefit option in a life insurance policy?</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) Reinstatement</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) Waiver of premium</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) Accelerated death benefit</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) Payor benefit</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>An accelerated death benefit lets the insured access a portion of the death benefit while still living, typically due to a qualifying terminal or catastrophic illness.</p>
</div>
<div class="lesson-quiz-item" data-correct="a">
<p class="lesson-quiz-question">Which of these is NOT a characteristic of the Accelerated Death Benefit option?</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) The face amount and policy premium are not affected by the payment</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) Before payment of the benefit is made, specific conditions must exist, such as suffering from a terminal illness</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) There may be a dollar limit on the maximum benefit</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) The benefit can be offered as a rider at a specific extra cost or may be at no cost</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>Paying an accelerated death benefit reduces the remaining face amount (and typically future premiums), so it does affect the policy''s face amount, contrary to choice a.</p>
</div>
<div class="lesson-quiz-item" data-correct="c">
<p class="lesson-quiz-question">What is the purpose for having an accelerated death benefit on a life insurance policy?</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) It allows for a spouse to be added as a rider to a life insurance policy</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) It allows for policy loans to be advanced to the insured in the event of unemployment</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) It allows for cash advances to be paid against the death benefit if the insured becomes terminally ill</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) It allows for a third party to purchase a life insurance policy at a discounted rate and immediately advance a portion of the death benefit</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>An accelerated death benefit rider lets a terminally ill insured receive a portion of the death benefit early, while still living, to help cover medical or living expenses.</p>
</div>
<div class="lesson-quiz-item" data-correct="c">
<p class="lesson-quiz-question">When a family policy covers children, all of the following are true EXCEPT</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) the coverage is term insurance for a fixed amount</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) there is no additional charge for covering new additions to the new family member</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) evidence of insurability is required to convert coverage for children to permanent insurance</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) all children living with the family are covered even if adopt or born after the policy is issued</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>Children''s term coverage in a family policy typically converts to permanent insurance without requiring evidence of insurability — that''s the false statement; the other choices (fixed-amount term, no extra charge, automatic coverage of newly added children) are all true.</p>
</div>
<div class="lesson-quiz-item" data-correct="c">
<p class="lesson-quiz-question">Which policy feature makes a universal life policy different from a whole life policy?</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) A fixed cash value</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) A fixed death benefit</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) A flexible premium schedule</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) The ability to take out a policy loan</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>Universal life offers a flexible premium schedule, letting the owner vary the amount and timing of premium payments, unlike the fixed premiums of whole life.</p>
</div>
<div class="lesson-quiz-item" data-correct="b">
<p class="lesson-quiz-question">Which federal government agency enforces the security laws enacted by Congress?</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) The Variable Investment Commission</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) The Securities Exchange Commission</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) The Securities Investment Commission</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) The National Securities Regulatory Commission</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>The Securities and Exchange Commission (SEC) is the federal agency responsible for enforcing securities laws, which is relevant to products like variable annuities and variable life insurance.</p>
</div>
<div class="lesson-quiz-item" data-correct="b">
<p class="lesson-quiz-question">Pre-death distributions from a modified endowment contract (MEC) receive different tax treatment than other life insurance policies because</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) the MEC has tax deductible premiums</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) the MEC tends to be an investment vehicle</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) the MEC is considered an illegal product</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) the MEC does not accumulate cash value</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>Because a MEC exceeds the IRS 7-pay test funding limits, it''s treated more like an investment vehicle than pure insurance, so pre-death distributions are taxed gain-first (LIFO), similar to a nonqualified annuity, rather than the cost-basis-first treatment given to ordinary life policies.</p>
</div>
<div class="lesson-quiz-item" data-correct="b">
<p class="lesson-quiz-question">Matt is applying for life insurance and requests a double indemnity rider. A double indemnity benefit will be payable to Matt''s beneficiary if Matt</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) is killed while committing a felony</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) dies instantly from a car accident</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) dies of a stroke</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) is injured in a skiing accident and dies 18 months later</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>A double indemnity/accidental death rider pays only when death results directly and solely from an accident within the required time frame; dying instantly in a car accident qualifies, while death from a felony or death occurring many months after the injury falls outside the rider''s coverage.</p>
</div>
<div class="lesson-quiz-item" data-correct="a">
<p class="lesson-quiz-question">Barbara''s policy includes a rider which allows her to purchase additional insurance at specific dates or events without evidence of insurability. This rider is called a(n)</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) Guaranteed insurability rider</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) Endowment rider</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) Payor rider</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) Family income rider</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>A guaranteed insurability rider lets the insured buy additional coverage at set future dates or life events without having to prove insurability.</p>
</div>', 4
where not exists (select 1 from public.lessons where module_id = '929e50a4-5e94-4e93-8f07-fe94b93f0619' and title = 'Progress Check: Permanent Life Insurance & Riders');
update public.lessons set position = 5 where module_id = '929e50a4-5e94-4e93-8f07-fe94b93f0619' and title = 'Business and Estate Uses of Life Insurance';
insert into public.lessons (id, module_id, title, description, duration, type, content, position)
select gen_random_uuid(), '929e50a4-5e94-4e93-8f07-fe94b93f0619', 'Progress Check: Business and Estate Uses of Life Insurance', '11 practice questions covering Business and Estate Uses of Life Insurance.', '11 min', 'quiz', '<div class="lesson-quiz-item" data-correct="c">
<p class="lesson-quiz-question">Which of the following is present when an applicant stands to lose value if the insured dies?</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) Insurability</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) Offer and acceptance</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) Insurable interest</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) Consideration</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>This describes insurable interest, the requirement that the applicant would suffer a genuine financial or emotional loss upon the insured''s death.</p>
</div>
<div class="lesson-quiz-item" data-correct="b">
<p class="lesson-quiz-question">According to life insurance contract law, insurable interest exists</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) when any business relationship exists</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) at the time of application/beginning</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) at the time of death only</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) when determined by a judge</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>Insurable interest for life insurance must exist at the time the policy is applied for/issued; unlike property insurance, it does not need to continue to exist at the time of death.</p>
</div>
<div class="lesson-quiz-item" data-correct="d">
<p class="lesson-quiz-question">All of these are common personal uses of life insurance EXCEPT</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) Pay final expenses</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) Fund a child''s education</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) Replace an insured''s income</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) Fund a Buy-Sell agreement</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>Funding a buy-sell agreement is a business use of life insurance, not a personal one — the other choices (final expenses, education, income replacement) are all personal needs.</p>
</div>
<div class="lesson-quiz-item" data-correct="b">
<p class="lesson-quiz-question">Bob and Tom are partners in a business. If one of them were to die, which of the following would guarantee a market for each of their share of the business?</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) Split Dollar plan</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) Buy-Sell agreement</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) Deferred compensation plan</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) Key person insurance</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>A buy-sell agreement obligates the surviving partner(s) to purchase the deceased partner''s share, guaranteeing a ready buyer and price for that interest.</p>
</div>
<div class="lesson-quiz-item" data-correct="a">
<p class="lesson-quiz-question">How can partners guarantee a market for their share of the business in the event of death?</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) buy-sell agreement</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) key person insurance</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) split dollar insurance</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) deferred compensation agreements</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>A buy-sell agreement commits the surviving partner(s) to buy out a deceased partner''s interest, ensuring there is always a buyer for that share.</p>
</div>
<div class="lesson-quiz-item" data-correct="a">
<p class="lesson-quiz-question">Which two insurance products are commonly used to fund buy-sell agreement?</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) life insurance and disability insurance</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) life insurance and deferred compensation</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) disability insurance and deferred compensation</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) disability insurance and long-term care insurance</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>Life insurance funds the buyout if an owner dies, and disability insurance funds it if an owner becomes disabled, making these the two products commonly used together.</p>
</div>
<div class="lesson-quiz-item" data-correct="b">
<p class="lesson-quiz-question">Which policy covering two or more individuals pays the face amount only when the first person dies?</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) family policy</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) joint life policy</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) survivorship policy</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) universal life policy</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>A joint life policy covers two or more people and pays its single death benefit upon the first insured''s death, after which the policy terminates.</p>
</div>
<div class="lesson-quiz-item" data-correct="c">
<p class="lesson-quiz-question">What kind of life insurance policy covers two or more people with the death benefit payable upon the last person''s death?</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) Dual Life insurance</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) Joint Life insurance</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) Last Survivor Life insurance</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) Shared Life insurance</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>A last-survivor (survivorship) life policy insures two or more people and pays the death benefit only after the last insured dies.</p>
</div>
<div class="lesson-quiz-item" data-correct="c">
<p class="lesson-quiz-question">John and Mary have a handicapped child that is financially dependent upon them. The death of one of the parents would not be financially disastrous, however the death of both likely would be. Which policy would be best suited for them?</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) Payor protection policy</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) Family income policy</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) Second-to-die policy</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) First-to-die policy</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>A second-to-die (survivorship) policy pays its death benefit only after both insureds have died, which fits a couple who can manage financially after one parent''s death but needs funds to provide for a dependent child once both are gone.</p>
</div>
<div class="lesson-quiz-item" data-correct="c">
<p class="lesson-quiz-question">In an employer-sponsored contributory group Disability Income plan, the employer pays 60% of the premium and each employee pays 40% of the premium. Any income benefits paid are taxed to the employee at</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) Employee has no tax liability</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) 40% of the benefit</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) 60% of the benefit</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) 100% of benefit</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>In a contributory group plan, disability benefits are taxable in the same proportion the employer paid the premium; since the employer paid 60%, 60% of the benefit is taxable to the employee.</p>
</div>
<div class="lesson-quiz-item" data-correct="c">
<p class="lesson-quiz-question">Which benefits are provided by key employee insurance?</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) retirement compensation for long-time employees</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) bonuses to employees for exceptional performance</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) payment to a business when an important employee dies</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) death benefits to the family of a deceased stockholder</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>Key employee (key person) life insurance pays a benefit to the business itself when a key employee dies, helping offset the financial loss and cost of finding a replacement.</p>
</div>', 6
where not exists (select 1 from public.lessons where module_id = '929e50a4-5e94-4e93-8f07-fe94b93f0619' and title = 'Progress Check: Business and Estate Uses of Life Insurance');
update public.lessons set position = 7 where module_id = '929e50a4-5e94-4e93-8f07-fe94b93f0619' and title = 'Beneficiaries, Settlement Options & Nonforfeiture';
insert into public.lessons (id, module_id, title, description, duration, type, content, position)
select gen_random_uuid(), '929e50a4-5e94-4e93-8f07-fe94b93f0619', 'Progress Check: Beneficiaries, Settlement Options & Nonforfeiture', '13 practice questions covering Beneficiaries, Settlement Options & Nonforfeiture.', '13 min', 'quiz', '<div class="lesson-quiz-item" data-correct="d">
<p class="lesson-quiz-question">Sharon is the policyowner of a $50,000 life insurance policy. Her son, Mike, is the beneficiary. If Sharon MUST obtain Mike''s signature in order to change the beneficiary, what kind of beneficiary designation is this?</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) Primary</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) contingent</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) revocable</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) irrevocable</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>An irrevocable beneficiary designation cannot be changed by the policyowner without that beneficiary''s written consent, unlike a revocable designation, which the owner may change at any time.</p>
</div>
<div class="lesson-quiz-item" data-correct="b">
<p class="lesson-quiz-question">All of the following statements about contingent beneficiaries are true EXCEPT</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) more than one contingent beneficiary may be named</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) the contingent beneficiary shares death proceeds equally with the primary beneficiary</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) they receive the death proceeds if the primary beneficiary is deceased at the time of the insured''s death</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) they receive the remaining payments to be made under a settlement agreement upon the primary beneficiary''s death</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>A contingent beneficiary only receives the death proceeds if the primary beneficiary is not living at the insured''s death — they don''t split the payout with a surviving primary beneficiary.</p>
</div>
<div class="lesson-quiz-item" data-correct="b">
<p class="lesson-quiz-question">Pat is insured with a life insurance policy and Karen is his primary beneficiary. They are both involved in an automobile accident where Pat dies instantly and Karen dies 5 days later. Which policy provision will protect the rights of the contingent beneficiary to receive the policy benefits?</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) Nonforfeiture clause</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) Common disaster clause</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) Spendthrift clause</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) Accident indemnity clause</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>The common disaster clause requires a beneficiary to survive the insured by a stated period (or presumes the insured outlived the beneficiary) when both die from the same accident close in time, so the proceeds pass to the contingent beneficiary instead of the primary beneficiary''s estate.</p>
</div>
<div class="lesson-quiz-item" data-correct="b">
<p class="lesson-quiz-question">All of the following are true about life insurance policy settlement options EXCEPT:</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) If none is selected, the insurer will pay the proceeds in cash</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) Settlement options preselected by the policyowner may be changed by the beneficiary at any time</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) If not preselected by the policyowner at time of application, the beneficiary may select one when the insured dies</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) They may be preselected by the policyowner at the time of application</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>Once a policyowner has preselected a settlement option, it is generally binding and cannot simply be changed by the beneficiary at will after the insured''s death.</p>
</div>
<div class="lesson-quiz-item" data-correct="b">
<p class="lesson-quiz-question">Elizabeth is the beneficiary of a life insurance policy. She is receiving the death benefit in payments of $10,000 per month until the principal and interest has been paid out. Which option was chosen?</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) Fixed period</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) fixed amount</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) life income</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) interest only</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>Paying a fixed dollar amount each month until the principal and interest are exhausted, with the payout period varying, is the fixed amount settlement option — as opposed to the fixed period option, where the time frame rather than the payment amount is set.</p>
</div>
<div class="lesson-quiz-item" data-correct="d">
<p class="lesson-quiz-question">Which of the following is NOT a life insurance settlement option?</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) Lump sum option</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) fixed amount option</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) Life income option</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) Extended term option</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>Extended term is a nonforfeiture option for cash value, not a settlement option for paying out death proceeds; lump sum, fixed amount, and life income are all standard settlement options.</p>
</div>
<div class="lesson-quiz-item" data-correct="b">
<p class="lesson-quiz-question">Pam is the primary beneficiary of a life insurance policy and wants to let the death benefit accumulate and receive only the monthly investment proceeds. Which settlement option should she choose?</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) lump sum option</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) interest Option</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) life income option</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) fixed amount option</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>Under the interest (accumulation at interest) settlement option, the insurer holds the death benefit principal and pays the beneficiary only the interest it earns.</p>
</div>
<div class="lesson-quiz-item" data-correct="c">
<p class="lesson-quiz-question">A life insurance policy can be surrendered for its cash value under which policy provision?</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) Dividend options</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) Payor options</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) Nonforfeiture options</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) Settlement options</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>Nonforfeiture options are the provisions that let a policyowner surrender a cash-value policy and receive its cash value (or another nonforfeiture benefit) instead of losing it.</p>
</div>
<div class="lesson-quiz-item" data-correct="a">
<p class="lesson-quiz-question">A $50K whole life policy with a cash value of $10K has been in force for eleven years. The policyowner is unable to continue the premium payments. Which of the following describes the reduced paid-up nonforfeiture option?</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) the cash value is used to select a $20K paid-up policy</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) the policy is surrendered and the policy owner is paid $10K by the insurer</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) the cash value is used to purchase a $50K term insurance policy that is paid up for ten years</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) the policyowner begins to receive monthly payments of $200 from the insurer that will continue for life</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>Reduced paid-up uses the existing cash value as a single premium to buy a smaller, fully paid-up whole life policy — smaller than the original $50K face amount.</p>
</div>
<div class="lesson-quiz-item" data-correct="a">
<p class="lesson-quiz-question">Which situation accurately describes a reduced paid-up nonforfeiture option?</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) Policy has a decreased face amount</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) Face amount of the new policy equals that of the original policy</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) Cash value is surrendered to policyowner</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) Premiums must continue to be paid</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>The new paid-up policy has a lower face amount than the original, since the existing cash value can only fund so much coverage as a single premium.</p>
</div>
<div class="lesson-quiz-item" data-correct="d">
<p class="lesson-quiz-question">Dorian exercised a nonforfeiture option by using his life policy''s cash value to purchase an extended term insurance option. When the term insurance expires,</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) he has the option of resuming the original policy and paying the same premium</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) the coverage can be extended with a lump sum payment</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) all remaining cash values are paid to the policyowner</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) the protection ends</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>Extended term coverage lasts only as long as the cash value can fund it. Once that term runs out, there''s no more coverage and no cash value left.</p>
</div>
<div class="lesson-quiz-item" data-correct="c">
<p class="lesson-quiz-question">A beneficiary has just received a claim payment for a life insurance policy. Which of the following is TRUE regarding the federal income tax liability owed?</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) A flat tax of 10% is owed on all proceeds</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) Federal income tax is owed if proceeds exceed $250,000</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) No federal income tax is owed on life insurance proceeds</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) Tax liability owed depends on the type of life insurance policy</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>Death proceeds paid to a beneficiary under a life insurance policy are generally received free of federal income tax, regardless of the amount.</p>
</div>
<div class="lesson-quiz-item" data-correct="d">
<p class="lesson-quiz-question">When a life insurance policy is surrendered, how does the cost recovery rule apply?</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) The entire cash value is taxable</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) The policy''s cost basis is taxable</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) The insurer withholds the cost basis</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) The policy''s cost basis is exempt from taxation</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>Under the cost-recovery rule, the amount up to the policy''s cost basis (premiums paid) is returned tax-free on surrender, so that portion is exempt from taxation; only any gain above the cost basis is taxable.</p>
</div>', 8
where not exists (select 1 from public.lessons where module_id = '929e50a4-5e94-4e93-8f07-fe94b93f0619' and title = 'Progress Check: Beneficiaries, Settlement Options & Nonforfeiture');
update public.lessons set position = 9 where module_id = '929e50a4-5e94-4e93-8f07-fe94b93f0619' and title = 'Keeping a Policy in Force';
insert into public.lessons (id, module_id, title, description, duration, type, content, position)
select gen_random_uuid(), '929e50a4-5e94-4e93-8f07-fe94b93f0619', 'Progress Check: Keeping a Policy in Force', '16 practice questions covering Keeping a Policy in Force.', '16 min', 'quiz', '<div class="lesson-quiz-item" data-correct="d">
<p class="lesson-quiz-question">The free-look provision gives the policyowner</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) the right to return the policy for a partial refund within a specified number of days</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) the right to contest the terms of the policy</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) the right to change a policy provision</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) the right to return the policy for a full refund within a specified number of days</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>The free-look provision allows the policyowner to examine the policy and return it for a full refund within a specified number of days if not satisfied.</p>
</div>
<div class="lesson-quiz-item" data-correct="b">
<p class="lesson-quiz-question">Individual life insurance policies sold to seniors in the state of California must include a prominently placed statement that divulges all of the following information EXCEPT</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) the policy should be returned to the agent or insurer if not wanted</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) proof of surrender must be notarized at the agent''s principal office</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) a charge might apply if declined after the time allowed for surrender</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) the policy can be returned during a free look period for a full refund</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>California''s senior life insurance disclosure requirements cover the free-look period, the right to return the policy, and any surrender charge, but they do not require that proof of surrender be notarized at the agent''s principal office — no such requirement exists.</p>
</div>
<div class="lesson-quiz-item" data-correct="c">
<p class="lesson-quiz-question">The California Insurance Code allows an individual how many days to cancel a life policy for a full-refund?</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) Up to 10 days</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) Between 15 and 20 days</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) Between 10 and 30 days</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) Between 30 and 45 days</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>California''s free-look period for life insurance falls between 10 and 30 days, depending on the policy type and applicant''s age, during which the policyowner can return the policy for a full refund.</p>
</div>
<div class="lesson-quiz-item" data-correct="c">
<p class="lesson-quiz-question">How long is the free cancellation period for life insurance policies offered to individuals who are 60 or older?</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) 10 days</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) 20 days</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) a period of 30 days</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) 45 days</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>California requires a longer free-look period, a period of 30 days, on life insurance policies sold to applicants age 60 or older, compared to the standard free look given to younger buyers.</p>
</div>
<div class="lesson-quiz-item" data-correct="b">
<p class="lesson-quiz-question">Why is the delivery of a life insurance policy important?</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) the policy is not in effect until it is delivered</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) the free-look period begins on the policy delivery date</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) the grace period begins on the policy delivery date</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) commissions are not paid until the policy is delivered</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>Policy delivery matters because the free-look period, during which the owner may return the policy for a full refund, begins on the date of delivery.</p>
</div>
<div class="lesson-quiz-item" data-correct="d">
<p class="lesson-quiz-question">What time period allows an insured''s life insurance policy to remain in force even if the premium was not paid on the due date?</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) Entire contract period</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) Free-look period</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) Reinstatement period</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) Grace period</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>The grace period keeps a policy in force for a set number of days after the due date, giving the policyholder time to pay an overdue premium without lapsing coverage.</p>
</div>
<div class="lesson-quiz-item" data-correct="a">
<p class="lesson-quiz-question">If an insured dies during the grace period with no premiums paid</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) the policy would be payable, minus the premium amount</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) the policy would be payable only after the beneficiary makes past due premium payment</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) all past premiums will be refunded with interest</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) the claim would be denied</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>The grace period keeps the policy in force even though the premium is overdue, so a death during that window is still covered — the insurer simply deducts the unpaid premium from the death benefit paid to the beneficiary.</p>
</div>
<div class="lesson-quiz-item" data-correct="a">
<p class="lesson-quiz-question">The automatic premium loan provision starts being effective when?</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) After the grace period</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) Nothing active during grace period</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) After the incontestability period</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) Right after the premium is paid</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>The automatic premium loan provision kicks in only after the grace period ends without payment, automatically borrowing against the policy''s cash value to keep it in force.</p>
</div>
<div class="lesson-quiz-item" data-correct="b">
<p class="lesson-quiz-question">Which policy provision allows an insured to continue coverage under a previously lapsed policy?</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) the settlement provision</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) the reinstatement provision</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) the nonforfeiture provision</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) the incontestability provision</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>The reinstatement provision lets an insured restore a lapsed policy, generally by paying past-due premiums and providing evidence of insurability.</p>
</div>
<div class="lesson-quiz-item" data-correct="b">
<p class="lesson-quiz-question">Lapsed individual life insurance may be reinstated at any time within</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) 2 years</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) 3 years</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) 4 years</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) 5 years</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>California law gives policyowners up to 3 years after a lapse to reinstate an individual life insurance policy, subject to proof of insurability and payment of back premiums with interest.</p>
</div>
<div class="lesson-quiz-item" data-correct="c">
<p class="lesson-quiz-question">All of the following statements regarding the reinstatement of a life insurance policy are correct EXCEPT</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) a policy may be reinstated after it has been in effect for 3 years</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) all back premiums must be paid before a policy may be reinstated</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) a policy may be reinstated without proof of insurability</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) once a policy has been surrendered for its cash value, it may not be reinstated</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>Reinstating a lapsed life policy generally requires proof of insurability (an updated statement of health), not just payment of back premiums — insurers want assurance the risk hasn''t worsened.</p>
</div>
<div class="lesson-quiz-item" data-correct="a">
<p class="lesson-quiz-question">What prevents a life insurance policy from being rescinded by the insurer after being in force for two years?</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) Incontestability clause</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) Free-look provision</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) Grace period provision</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) Subrogation</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>The incontestability clause bars the insurer from voiding a policy over misstatements or fraud in the application once it has been in force for the specified contestable period, typically two years.</p>
</div>
<div class="lesson-quiz-item" data-correct="a">
<p class="lesson-quiz-question">Christine has a health insurance policy that has been in force beyond the incontestable period. The insurer has discovered that a fraudulent statement was made on the application. What would the insurer have to pay on a claim, assuming this wasn''t a guaranteed renewable policy?</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) Nothing</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) 50% of the claim''s amount</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) 75% of the claim''s amount</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) 100% of the claim''s amount</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>Fraud is an exception to the incontestability clause, so even after the contestable period has passed the insurer can deny the claim entirely based on the fraudulent statement.</p>
</div>
<div class="lesson-quiz-item" data-correct="d">
<p class="lesson-quiz-question">The insurer can do which of the following under a noncancelable health insurance policy?</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) raises the premium rate</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) change the policy provision</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) refuse to renew the policy for any reason</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) cancels the policy for nonpayment of premium</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>Even under a noncancelable policy, which guarantees renewal at a fixed premium, the insurer can still cancel for nonpayment of premium. It cannot raise rates, change provisions, or refuse renewal.</p>
</div>
<div class="lesson-quiz-item" data-correct="b">
<p class="lesson-quiz-question">What type of changes can be made to a guaranteed renewable health insurance policy?</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) The incontestability period</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) The premium rates of the policyowner</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) The grace period</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) The policy''s provision</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>On a guaranteed renewable policy the insurer cannot cancel it or change its benefits, but it can adjust premium rates for an entire class of insureds.</p>
</div>
<div class="lesson-quiz-item" data-correct="a">
<p class="lesson-quiz-question">The insurer has the option of terminating a health insurance policy on a date stated in the contract. What type of policy is this?</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) Optionally renewable</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) Renewable</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) conditionally renewable</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) cancellable</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>An optionally renewable policy lets the insurer decide, on specified policy anniversary or premium due dates, whether to terminate or continue the coverage.</p>
</div>', 10
where not exists (select 1 from public.lessons where module_id = '929e50a4-5e94-4e93-8f07-fe94b93f0619' and title = 'Progress Check: Keeping a Policy in Force');
update public.lessons set position = 11 where module_id = '929e50a4-5e94-4e93-8f07-fe94b93f0619' and title = 'Participating vs. Non-Participating Insurers';
insert into public.lessons (id, module_id, title, description, duration, type, content, position)
select gen_random_uuid(), '929e50a4-5e94-4e93-8f07-fe94b93f0619', 'Progress Check: Participating vs. Non-Participating Insurers', '10 practice questions covering Participating vs. Non-Participating Insurers.', '10 min', 'quiz', '<div class="lesson-quiz-item" data-correct="d">
<p class="lesson-quiz-question">The major difference between participating and nonparticipating policies is the</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) interest assumption</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) premium payment method</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) settlement options</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) presence of policy dividends</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>Participating policies pay dividends (a return of excess premium) to policyholders; nonparticipating policies don''t.</p>
</div>
<div class="lesson-quiz-item" data-correct="c">
<p class="lesson-quiz-question">A nonparticipating policy will</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) provide a return of premium</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) provide tax advantages</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) not pay dividends</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) give policyowners special privileges</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>Nonparticipating means the policyholder doesn''t share in the insurer''s surplus through dividends — that''s reserved for participating (mutual) policies.</p>
</div>
<div class="lesson-quiz-item" data-correct="d">
<p class="lesson-quiz-question">A nonparticipating company is sometimes called a(n)</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) alien insurer</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) mutual insurer</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) reinsurer</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) stock insurer</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>Stock insurers are owned by stockholders and pay profits to them, not dividends to policyholders — the opposite of a mutual (participating) insurer.</p>
</div>
<div class="lesson-quiz-item" data-correct="a">
<p class="lesson-quiz-question">Which statement is true regarding policy dividends?</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) A dividend option is selected by the insured at the time of policy purchase</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) Dividends are always taxable</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) Dividends are always guaranteed</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) Nonparticipating policies issue dividends</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>The insured chooses how dividends will be applied (e.g., cash, reduced premium, paid-up additions) when the policy is purchased; dividends are never guaranteed, are a return of excess premium so not taxable as income, and are only paid by participating policies.</p>
</div>
<div class="lesson-quiz-item" data-correct="b">
<p class="lesson-quiz-question">Which type of life insurance policy gives an owner the right to share in the insurer''s surplus?</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) level term</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) participating</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) decreasing term</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) non-participating</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>A participating policy entitles the owner to share in the insurer''s divisible surplus through policy dividends.</p>
</div>
<div class="lesson-quiz-item" data-correct="c">
<p class="lesson-quiz-question">Which type of insurer is owned by its policyholders?</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) a fraternal society</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) a reciprocal exchange</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) a mutual insurer</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) a capital stock insurer</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>A mutual insurer is owned by its policyholders, who may share in the company''s surplus through dividends, unlike a stock insurer owned by shareholders.</p>
</div>
<div class="lesson-quiz-item" data-correct="d">
<p class="lesson-quiz-question">Life insurance surplus must be distributed to policyowners at what frequency?</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) Monthly</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) Quarterly</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) Semi-annually</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) Annually</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>Divisible surplus on participating policies is calculated and paid out to policyowners as dividends once a year.</p>
</div>
<div class="lesson-quiz-item" data-correct="d">
<p class="lesson-quiz-question">Which of the following is NOT an option for the use of the policy dividends?</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) purchase paid-up additions</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) reduce the current premium</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) purchase a 1-year term addition</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) funds the distribution of monthly income payments</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>Policy dividends can be used for paid-up additions, reducing the premium, or a one-year term addition, but not to fund ongoing monthly income payments — that isn''t a standard dividend option.</p>
</div>
<div class="lesson-quiz-item" data-correct="d">
<p class="lesson-quiz-question">A policy owner has the right to change all of the following EXCEPT the</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) beneficiary</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) payment mode</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) dividend option</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) dividend schedule</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>A policyowner can change the beneficiary, payment mode, and dividend option, but the dividend schedule itself is set by the insurer, not chosen by the owner.</p>
</div>
<div class="lesson-quiz-item" data-correct="b">
<p class="lesson-quiz-question">The process whereby a mutual insurer becomes a stock company is called:</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) Mutualization</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) Demutualization</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) Reinsurance d</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) Reorganization</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>Demutualization is the conversion of a mutual insurer, owned by its policyholders, into a stock company owned by shareholders.</p>
</div>', 12
where not exists (select 1 from public.lessons where module_id = '929e50a4-5e94-4e93-8f07-fe94b93f0619' and title = 'Progress Check: Participating vs. Non-Participating Insurers');
update public.lessons set position = 13 where module_id = '929e50a4-5e94-4e93-8f07-fe94b93f0619' and title = 'Underwriting and Group Life Insurance';
insert into public.lessons (id, module_id, title, description, duration, type, content, position)
select gen_random_uuid(), '929e50a4-5e94-4e93-8f07-fe94b93f0619', 'Progress Check: Underwriting and Group Life Insurance', '14 practice questions covering Underwriting and Group Life Insurance.', '14 min', 'quiz', '<div class="lesson-quiz-item" data-correct="a">
<p class="lesson-quiz-question">Life insurance policies written without a physical examination are called</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) non-medical</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) preferred</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) standard</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) substandard</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>Non-medical policies are underwritten from the application and other records alone, without requiring a paramedical or physical exam, and are typically limited to smaller face amounts.</p>
</div>
<div class="lesson-quiz-item" data-correct="c">
<p class="lesson-quiz-question">The use of non-medical life insurance accomplishes all of the following EXCEPT</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) there is less demand on the medical profession</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) the processing of life insurance applications is expedited</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) insured’s can avoid answering medical questions on the application</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) insurer are reduced by the cost of paying for medical examination</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>Non-medical life insurance still requires the applicant to answer medical questions on the application; it simply waives the requirement for a physical exam, which speeds processing and reduces cost.</p>
</div>
<div class="lesson-quiz-item" data-correct="c">
<p class="lesson-quiz-question">Who are the parties to the master contract in a group life insurance policy?</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) Insurer and employee</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) Employer and employee</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) Insurer and employer</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) Employer and beneficiary</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>The employer, as master policyholder, contracts directly with the insurer; individual employees just receive a certificate of insurance, not their own contract.</p>
</div>
<div class="lesson-quiz-item" data-correct="c">
<p class="lesson-quiz-question">A master contract and certificate of coverage can be found in which type of policy?</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) Long-term</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) Medicaid</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) Group</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) Medicare</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>Group insurance uses a master contract issued to the group (employer/association), with individual certificates of coverage given to each covered member.</p>
</div>
<div class="lesson-quiz-item" data-correct="d">
<p class="lesson-quiz-question">In an employer-sponsored group accident and health plan, a master contract is issued to the</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) TPA</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) Employees</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) Administrative Services Organization</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) Employer</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>The group''s master contract is issued to the employer, who holds it on behalf of the covered employees.</p>
</div>
<div class="lesson-quiz-item" data-correct="c">
<p class="lesson-quiz-question">In group life insurance, who is issued a certificate of insurance?</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) the insurer</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) the beneficiary</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) the participant</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) the policyholder</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>Individual employees (participants) receive a certificate of insurance as evidence of coverage, since the actual master contract belongs to the employer.</p>
</div>
<div class="lesson-quiz-item" data-correct="a">
<p class="lesson-quiz-question">Which of the following is not ordinary life insurance?</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) Group life</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) Blanket</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) industrial</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) individual</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>Group life is its own classification, written under a master contract covering many people, rather than the individually underwritten ordinary (individual) life insurance category.</p>
</div>
<div class="lesson-quiz-item" data-correct="b">
<p class="lesson-quiz-question">How much employer-provided group term life insurance is exempt from income taxation?</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) $25K</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) $50K</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) $75K</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) $100K</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>Under IRC Section 79, the first $50,000 of employer-provided group term life coverage is excluded from the employee''s taxable income.</p>
</div>
<div class="lesson-quiz-item" data-correct="d">
<p class="lesson-quiz-question">The cost of employer-provided group life insurance above $50K is</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) taxable to the employer</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) tax exempt to the employee</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) tax deductible by the employee</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) taxable as income to the employee</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>Under IRS rules, the cost of employer-paid group term life coverage exceeding $50,000 is taxable income to the employee, even though the employer pays the premium.</p>
</div>
<div class="lesson-quiz-item" data-correct="b">
<p class="lesson-quiz-question">Tim was recently terminated from his employment and opted to change his existing group term life insurance to individual permanent life insurance. What is this process called?</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) Replacement</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) Conversion</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) Transformation</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) Reinstatement</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>This is a conversion, the right to convert group term coverage to an individual permanent policy without evidence of insurability when group coverage ends.</p>
</div>
<div class="lesson-quiz-item" data-correct="c">
<p class="lesson-quiz-question">A terminating employee who wants to exercise the conversion privilege must meet all of the following requirements EXCEPT</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) pay the premium</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) fill out the required forms</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) supply evidence on insurability</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) apply within 31 days of termination</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>The conversion privilege specifically allows a terminated group member to convert to an individual policy without proving insurability; evidence of insurability is not required.</p>
</div>
<div class="lesson-quiz-item" data-correct="d">
<p class="lesson-quiz-question">What is one difference between group life and individual life underwriting?</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) only group life insurance gives a choice of payment plans</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) group life insurance usually requires a medical examination</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) only individual life insurance requires the naming of a beneficiary</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) individual life insurance requires the applicant to answer medical questions</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>Individual life underwriting typically requires the applicant to answer detailed medical questions, while group underwriting is largely guaranteed issue based on the group as a whole rather than each member''s health.</p>
</div>
<div class="lesson-quiz-item" data-correct="b">
<p class="lesson-quiz-question">A group policy may be issued to a labor union. The members eligible for insurance under the policy shall be</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) members of any union</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) all of the members of the union</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) only members of the union who are under the age of 65</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) healthy members of the union</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>Under a group policy issued to a labor union, all members of the union must be eligible for coverage; an insurer cannot selectively cover only some members.</p>
</div>
<div class="lesson-quiz-item" data-correct="a">
<p class="lesson-quiz-question">During the underwriting process for a group health policy, it was discovered that 15 out of 50 members of the group have major health issues. How would the insurer handle this?</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) Accept or reject the whole group</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) Accept the 35 insurable individuals while rejecting the remaining 15</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) Charge a higher premium to the 15 unhealthy individuals</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) Assign the group to a re-insurer</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>Group health coverage is underwritten as a single unit, so the insurer must accept or reject the entire group rather than cherry-picking out the unhealthy members.</p>
</div>', 14
where not exists (select 1 from public.lessons where module_id = '929e50a4-5e94-4e93-8f07-fe94b93f0619' and title = 'Progress Check: Underwriting and Group Life Insurance');
update public.lessons set position = 15 where module_id = '929e50a4-5e94-4e93-8f07-fe94b93f0619' and title = 'Retirement Plans';
insert into public.lessons (id, module_id, title, description, duration, type, content, position)
select gen_random_uuid(), '929e50a4-5e94-4e93-8f07-fe94b93f0619', 'Progress Check: Retirement Plans', '6 practice questions covering Retirement Plans.', '6 min', 'quiz', '<div class="lesson-quiz-item" data-correct="a">
<p class="lesson-quiz-question">Employer contributions to qualified plans are</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) tax-deductible by the employer</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) taxable to the employee</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) only available for key employees</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) only found in 403(b) plans</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>Employer contributions to a qualified retirement plan are tax-deductible as a business expense in the year they are made.</p>
</div>
<div class="lesson-quiz-item" data-correct="b">
<p class="lesson-quiz-question">Which of these statements concerning Traditional IRAs is CORRECT?</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) Earnings are not taxable when withdrawn</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) Earnings are taxable when withdrawn</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) Contributions are never tax-deductible</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) Contributions are always made by the employer</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>Traditional IRA contributions and earnings grow tax-deferred, so earnings are taxed as ordinary income when withdrawn.</p>
</div>
<div class="lesson-quiz-item" data-correct="a">
<p class="lesson-quiz-question">Non-deductible contributions are typically associated with a</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) Roth IRA</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) 401(k)</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) Traditional IRA</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) SEP Plan</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>Roth IRA contributions are made with after-tax dollars and are never tax-deductible, unlike traditional IRA or qualified plan contributions, which can reduce taxable income.</p>
</div>
<div class="lesson-quiz-item" data-correct="b">
<p class="lesson-quiz-question">Retirement plans cannot favor highly compensated employs. The government regulation that prevents this from happening is called</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) Defamation b</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) Nondiscrimination</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) IRC Section 457</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) HR-10</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>Nondiscrimination rules require qualified retirement plans to benefit employees broadly, not just those who are highly compensated.</p>
</div>
<div class="lesson-quiz-item" data-correct="a">
<p class="lesson-quiz-question">What is ESOP stand for?</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) Employee Stock Ownership Plan</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) Employee Savings Optional Plan</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) Employee Savings Opportunity Plan</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) Employer Stock Offering Program</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>ESOP stands for Employee Stock Ownership Plan, a program that gives employees ownership interest in the company through shares of stock.</p>
</div>
<div class="lesson-quiz-item" data-correct="a">
<p class="lesson-quiz-question">In a 5 year vesting schedule, what percentage of employer contributions must be vested after 5 years of service?</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) 100%</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) 80%</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) 60%</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) 40%</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>Under a 5-year cliff vesting schedule, an employee has no vested right to employer contributions until reaching 5 years of service, at which point they become 100% vested all at once.</p>
</div>', 16
where not exists (select 1 from public.lessons where module_id = '929e50a4-5e94-4e93-8f07-fe94b93f0619' and title = 'Progress Check: Retirement Plans');
update public.lessons set position = 17 where module_id = '929e50a4-5e94-4e93-8f07-fe94b93f0619' and title = 'Annuities';
insert into public.lessons (id, module_id, title, description, duration, type, content, position)
select gen_random_uuid(), '929e50a4-5e94-4e93-8f07-fe94b93f0619', 'Progress Check: Annuities', '17 practice questions covering Annuities.', '17 min', 'quiz', '<div class="lesson-quiz-item" data-correct="a">
<p class="lesson-quiz-question">The systematic liquidation of a sum of money is provided by a(n):</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) annuity</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) endowment contract</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) life insurance policy</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) 1035 contract exchange</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>An annuity''s defining function is the systematic liquidation of a sum of money, converting an accumulated fund into a stream of periodic income payments.</p>
</div>
<div class="lesson-quiz-item" data-correct="c">
<p class="lesson-quiz-question">People commonly purchase an annuity to protect against the risk of</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) dying too soon</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) becoming insurable</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) outliving their financial resources</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) dying before their home mortgage is paid off</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>An annuity''s core purpose is to guarantee income for life, protecting against the risk of outliving your savings.</p>
</div>
<div class="lesson-quiz-item" data-correct="a">
<p class="lesson-quiz-question">An immediate annuity has been purchased with a single premium. When does the annuitant typically begin receiving benefit payments?</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) 1 month</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) 6 months</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) 12 months</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) 24 months</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>By definition, an "immediate" annuity starts paying out right away — typically within about one payment interval of purchase, unlike a deferred annuity.</p>
</div>
<div class="lesson-quiz-item" data-correct="b">
<p class="lesson-quiz-question">Kathy''s annuity is currently experiencing tax-deferred growth until she retires. Which phase is this annuity in?</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) Payout period</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) Accumulation period</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) Deferred period</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) Growth period</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>The accumulation period is the phase during which the annuity owner pays in premiums that grow tax-deferred, before annuitization and payout begin.</p>
</div>
<div class="lesson-quiz-item" data-correct="d">
<p class="lesson-quiz-question">During the accumulation period, who can surrender an annuity?</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) Payor</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) Annuitant</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) Beneficiary</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) Policyowner</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>The policyowner controls the contract and holds the right to surrender the annuity during the accumulation period, regardless of who the annuitant or beneficiary is.</p>
</div>
<div class="lesson-quiz-item" data-correct="b">
<p class="lesson-quiz-question">Which policy is a savings instrument designed to first accumulate funds and then systematically to liquidate the funds?</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) term life</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) deferred annuity</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) mortgage insurance</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) disability income insurance</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>A deferred annuity has an accumulation phase where funds grow before an annuitization phase where they are paid out systematically.</p>
</div>
<div class="lesson-quiz-item" data-correct="c">
<p class="lesson-quiz-question">The insured bought an annuity ten years ago. He will retire in 5 years. To determine the value of his annuity, he must multiply the value of the "accumulation units" he owns, times the value of the "separate account". This type of annuity is known as a</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) fixed annuity</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) flexible annuity</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) variable annuity</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) accumulation annuity</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>Variable annuities use accumulation units tied to a separate account invested in securities, so the annuity''s value fluctuates with the underlying investment performance.</p>
</div>
<div class="lesson-quiz-item" data-correct="d">
<p class="lesson-quiz-question">Which of the following is NOT a feature of equity-indexed annuities?</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) Offers long term inflation protection</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) Offers protection during a decline in the stock market</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) offers a minimum guaranteed rate</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) Offers a maximum interest rate that increases annually</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>Equity-indexed annuities cap the maximum interest rate credited, but that cap does not automatically increase every year; they do offer a guaranteed minimum rate and protection against market declines.</p>
</div>
<div class="lesson-quiz-item" data-correct="d">
<p class="lesson-quiz-question">Which of the following is a characteristic of nonqualified annuities?</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) tax- contribution</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) limits on contributions</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) mandatory participation</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) tax-deferred earnings</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>Nonqualified annuities are funded with after-tax dollars but still grow tax-deferred, and unlike qualified plans they have no contribution limits and participation is voluntary.</p>
</div>
<div class="lesson-quiz-item" data-correct="d">
<p class="lesson-quiz-question">An insure replaces an existing annuity with a new one and must pay a surrender charge for cancelling the existing annuity. The new policy holds no greater financial benefits to the insured than the existing contract. This is an example of</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) nonforfeiture</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) a deferred annuity</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) a substandard annuity</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) an unnecessary replacement</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>Replacing an annuity that triggers a surrender charge while providing no real improvement in benefits is the definition of an unnecessary replacement, which regulators scrutinize to protect consumers.</p>
</div>
<div class="lesson-quiz-item" data-correct="a">
<p class="lesson-quiz-question">Which type of annuity stops all payments upon the death of the annuitant?</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) Life annuity</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) Period certain annuity</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) Cash refund annuity</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) Joint and survivor annuity</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>A straight life annuity pays only for the annuitant''s lifetime and stops immediately at death, with no further payments to anyone, unlike period-certain, refund, or joint-and-survivor options.</p>
</div>
<div class="lesson-quiz-item" data-correct="b">
<p class="lesson-quiz-question">A person owns a life annuity. He elects to receive his annuity payments monthly for the remainder of his life with "10 years certain." The annuity will make payments</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) for 120 months, if the insured lives that long</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) for a minimum of 120 months and a maximum of the remainder of his life</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) until his death, when the beneficiary begins receiving payments for 120 additional months</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) during the "period certain" after which the payments will be reduced, but they will continue for the rest of his life</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>A life annuity with a 10-year certain period guarantees payments for at least 120 months even if the annuitant dies early, but continues for life if the annuitant outlives that period.</p>
</div>
<div class="lesson-quiz-item" data-correct="b">
<p class="lesson-quiz-question">A 10-year certain annuity with an installment refund is purchased. The annuitant dies after receiving monthly payments for 5 years. How many remaining payments will the insurer make?</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) none</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) 60 payments</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) 120 payments</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) one lump sum payment</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>A 10-year certain annuity guarantees 120 monthly payments regardless of survival. After 5 years (60 payments), 60 guaranteed payments remain and go to the beneficiary.</p>
</div>
<div class="lesson-quiz-item" data-correct="a">
<p class="lesson-quiz-question">The taxable portion of each annuity payment is calculated using which method?</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) Exclusion Ratio</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) Taxable Ratio</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) Cost Basis</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) Tax Basis</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>The exclusion ratio determines what portion of each annuity payment is a tax-free return of the owner''s cost basis versus taxable interest/growth.</p>
</div>
<div class="lesson-quiz-item" data-correct="a">
<p class="lesson-quiz-question">Which of these is NOT considered to be a purpose of an annuity?</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) Annuities are intended to create an estate</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) Annuities are intended to liquidate an estate</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) Annuities are intended for the tax-free growth of principal</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) Annuities are intended to distribute accumulated principal</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>Annuities are designed to liquidate (distribute) an already-accumulated sum, not to create an estate; life insurance, not annuities, is the tool used to create an estate.</p>
</div>
<div class="lesson-quiz-item" data-correct="a">
<p class="lesson-quiz-question">What fact determines the difference between deferred and immediate annuities?</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) when annuity benefit payments begin</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) the number of annuity benefit payment</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) who receives the annuity benefit payments</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) the dollar amount of the annuity benefit payment</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>The distinction is timing: an immediate annuity begins paying benefits right away, while a deferred annuity delays payments until a later date.</p>
</div>
<div class="lesson-quiz-item" data-correct="b">
<p class="lesson-quiz-question">An annuitant would like to determine the amount of an annuity distribution that is exempt from taxation. What is used to calculate this?</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) Mortality rate</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) Exclusion ratio</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) Morbidity rate</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) Debt-to-Equity ratio</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>The exclusion ratio determines what portion of each annuity payment is a tax-free return of principal versus taxable interest or earnings.</p>
</div>', 18
where not exists (select 1 from public.lessons where module_id = '929e50a4-5e94-4e93-8f07-fe94b93f0619' and title = 'Progress Check: Annuities');

update public.lessons set position = position + 1000 where module_id = 'dcc403da-41ac-4b2d-988a-ccce1d0a0dab';
update public.lessons set position = 1 where module_id = 'dcc403da-41ac-4b2d-988a-ccce1d0a0dab' and title = 'Term Life Insurance';
insert into public.lessons (id, module_id, title, description, duration, type, content, position)
select gen_random_uuid(), 'dcc403da-41ac-4b2d-988a-ccce1d0a0dab', 'Progress Check: Term Life Insurance', '11 practice questions covering Term Life Insurance.', '11 min', 'quiz', '<div class="lesson-quiz-item" data-correct="a">
<p class="lesson-quiz-question">Which of the following policies does NOT build cash value?</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) Term</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) Straight Life</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) Endowment</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) Variable Life</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>Term insurance provides pure death protection for a limited period with no savings component, so it never accumulates cash value.</p>
</div>
<div class="lesson-quiz-item" data-correct="a">
<p class="lesson-quiz-question">Which of the following types of life insurance policy has no cash value?</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) 10-year level term</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) Whole life</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) Life paid-up at age 65 (LP65)</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) Universal life</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>A 10-year level term policy is pure protection for a set period with no savings element, so it builds no cash value, unlike whole life, LP65, or universal life.</p>
</div>
<div class="lesson-quiz-item" data-correct="c">
<p class="lesson-quiz-question">Term insurance is appropriate for someone who</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) seeks living benefits for themselves</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) seeks a policy that builds cash value</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) seeks temporary protection and lower premium</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) seeks permanent protection and higher premiums</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>Term insurance provides pure, temporary death protection at a lower premium than permanent insurance, since it builds no cash value and only pays if death occurs during the term.</p>
</div>
<div class="lesson-quiz-item" data-correct="a">
<p class="lesson-quiz-question">Shirley has a $500,000 10-year non-renewable level term life policy. If she dies 15 years after the policy''s inception date, how much will her beneficiary receive?</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) Nothing</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) $100,000</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) $250,000</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) $500,000</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>The policy was non-renewable and its 10-year term already ended 5 years earlier, so there''s no coverage in force — nothing is paid.</p>
</div>
<div class="lesson-quiz-item" data-correct="d">
<p class="lesson-quiz-question">Your clients has just bought a new home which he has financed with a $150k, 7.5% interest, 30-year bank loan. He would like to be sure that if he dies that the unpaid balance of the mortgage would be paid. He wants a policy that will cover the balance - no more, no less- anytime during the life of the mortgage. Which policy is designed to meet this need?</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) level term policy</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) home service policy</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) increasing term policy</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) decreasing term policy</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>A decreasing term policy''s death benefit declines over time to track a shrinking mortgage balance, matching the coverage the client wants without paying for more protection than is owed.</p>
</div>
<div class="lesson-quiz-item" data-correct="d">
<p class="lesson-quiz-question">Which type of insurance policy provides death benefits that matches the projected outstanding debt on an individual''s home?</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) level term</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) joint life</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) family protection</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) mortgage redemption</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>A mortgage redemption policy is a decreasing term policy whose declining death benefit is designed to track the shrinking balance owed on a mortgage.</p>
</div>
<div class="lesson-quiz-item" data-correct="d">
<p class="lesson-quiz-question">Krissa purchases a 10-year level term life insurance policy that has a death benefit of $200,000. Which of these statements is true?</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) The policy automatically converts to whole life after the 10-year period</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) The face amount will remain constant and the premium will increase over the 10-year period</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) The premium will remain constant and the face amount will increase over the 10-year period</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) The face amount and premium will remain constant over the 10-year period</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>"Level" term means both the face amount and the premium stay the same for the entire term.</p>
</div>
<div class="lesson-quiz-item" data-correct="d">
<p class="lesson-quiz-question">All of the following are true about term life insurance policies EXCEPT the</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) insured can choose the premium payment mode</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) insured must answer medical questions on the application</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) face amount is paid if the insured dies during the policy period</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) face amount is paid if the insured survives to the end of the policy period</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>Term insurance only pays a benefit if the insured dies during the term. Surviving to the end pays nothing, since term has no cash value or maturity benefit.</p>
</div>
<div class="lesson-quiz-item" data-correct="b">
<p class="lesson-quiz-question">Which type of insurance guarantees the right to renew the policy each year, regardless of the health, but at an increased premium?</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) level term</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) renewal term</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) decreasing term</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) convertible term</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>Renewable term insurance guarantees annual renewal without new evidence of insurability, with the premium increasing as the insured ages.</p>
</div>
<div class="lesson-quiz-item" data-correct="c">
<p class="lesson-quiz-question">Decreasing term life insurance is often used to</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) provide retirement funds</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) accumulate cash value</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) Provide coverage for a home mortgage</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) provide coverage for estate taxes</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>Decreasing term insurance''s death benefit declines over time, mirroring a mortgage balance, making it a low-cost way to cover that debt as it''s paid down.</p>
</div>
<div class="lesson-quiz-item" data-correct="a">
<p class="lesson-quiz-question">In a renewable term life insurance policy, the contract will usually</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) require a higher premium payable at each renewal</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) require a lower premium payable at each renewal</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) keep the same premium level at each renewal</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) stipulate a higher cash value at each renewal</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>A renewable term policy renews at the insured''s attained (increased) age without new proof of insurability, so the premium goes up at each renewal to reflect the higher mortality risk.</p>
</div>', 2
where not exists (select 1 from public.lessons where module_id = 'dcc403da-41ac-4b2d-988a-ccce1d0a0dab' and title = 'Progress Check: Term Life Insurance');
update public.lessons set position = 3 where module_id = 'dcc403da-41ac-4b2d-988a-ccce1d0a0dab' and title = 'Permanent Life Insurance & Riders';
insert into public.lessons (id, module_id, title, description, duration, type, content, position)
select gen_random_uuid(), 'dcc403da-41ac-4b2d-988a-ccce1d0a0dab', 'Progress Check: Permanent Life Insurance & Riders', '22 practice questions covering Permanent Life Insurance & Riders.', '22 min', 'quiz', '<div class="lesson-quiz-item" data-correct="c">
<p class="lesson-quiz-question">Which type of insurance coverage has both a savings element and a flexible premium option?</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) term life</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) whole life</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) universal life</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) there is currently no insurance product available in the standard market which has both of these features</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>Universal life combines a cash value (savings) component with flexible premiums the owner can adjust in amount and timing.</p>
</div>
<div class="lesson-quiz-item" data-correct="d">
<p class="lesson-quiz-question">Variable life insurance and Universal life insurance are very similar. Which of these features are held exclusively by variable universal life insurance?</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) Policyowner may increase or decrease the premium payments</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) Policyowner may increase or decrease the face amount</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) Policyowner can contribute large sums of money</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) Policyowner has the right to select the investment which will provide the greatest return</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>Only variable universal life gives the policyowner the right to choose and direct how cash value is invested among separate account subaccounts; flexible premiums and adjustable face amounts are shared with regular universal life.</p>
</div>
<div class="lesson-quiz-item" data-correct="d">
<p class="lesson-quiz-question">A life insurance policy written after 1988 that fails to meet the seven-pay test is known as</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) an endowment policy</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) a modified life policy</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) a single premium contract</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) a modified endowment contract</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>A policy that fails the seven-pay test is reclassified as a modified endowment contract (MEC), which loses some of the favorable tax treatment on withdrawals and loans.</p>
</div>
<div class="lesson-quiz-item" data-correct="b">
<p class="lesson-quiz-question">Mark, age 45, has a Modified Endowment Contract (MEC). What is the tax penalty for taking a loan against this policy prior to age 59 1/2?</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) 5%</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) 10%</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) 15%</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) 25%</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>Loans and other pre-59½ distributions from a Modified Endowment Contract are taxed as income to the extent of gain and hit with an additional 10% federal tax penalty.</p>
</div>
<div class="lesson-quiz-item" data-correct="c">
<p class="lesson-quiz-question">An endorsement found in an insurance plan which modifies the provisions of the policy is called a(n)</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) Attachment</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) add-on</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) rider</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) supplement</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>A rider is an endorsement attached to a policy that adds to, modifies, or limits its provisions.</p>
</div>
<div class="lesson-quiz-item" data-correct="c">
<p class="lesson-quiz-question">The additional premium charged by an insurer for adding the accidental death benefit to a whole life policy</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) increases the policy''s cash value</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) increase the yearly dividend amount</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) does not affect the policy’s cash value</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) decrease the length of time that premiums are payable</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>The accidental death rider is a separate charge that pays an extra benefit only if death results from an accident; it does not affect the base policy''s cash value accumulation.</p>
</div>
<div class="lesson-quiz-item" data-correct="a">
<p class="lesson-quiz-question">Which type of life insurance is normally associated with a Payor Benefit rider?</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) Juvenile insurance</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) Family income insurance</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) Spouse insurance</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) Term rider</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>Juvenile insurance commonly carries a payor benefit rider, which waives premiums on the child''s policy if the paying adult dies or becomes disabled.</p>
</div>
<div class="lesson-quiz-item" data-correct="d">
<p class="lesson-quiz-question">The payor rider on a life policy provides that if the payor dies or becomes disabled before the insured juvenile the age specified in the policy that the</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) insurer will make all future payments</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) insured''s estate will make the premium payments</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) insurer will lend money to keep the policy in force</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) insurer will make the payments until the insured juvenile reaches a specified age - usually 21 or 25</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>The payor rider waives future premiums, with the insurer making the payments, until the juvenile insured reaches the specified age (typically 21 or 25), if the payor dies or becomes disabled.</p>
</div>
<div class="lesson-quiz-item" data-correct="b">
<p class="lesson-quiz-question">The insured is totally and permanently disabled. The insured''s policy continues in force without payment of further premiums because the policy contains a</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) guaranteed insurability provision</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) waiver of premium provision</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) reinstatement provision</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) grace period provision</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>The waiver of premium provision keeps a life policy in force without requiring premium payments once the insured becomes totally and permanently disabled, as defined by the policy.</p>
</div>
<div class="lesson-quiz-item" data-correct="a">
<p class="lesson-quiz-question">If an insured dies because of an accident, which type of life insurance rider will provide additional coverage?</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) Accidental death rider</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) Payor rider</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) Accelerated rider</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) Extended term rider</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>An accidental death rider (sometimes called accidental death benefit or "double indemnity") pays an additional death benefit when death results from an accident.</p>
</div>
<div class="lesson-quiz-item" data-correct="d">
<p class="lesson-quiz-question">Guaranteed Insurability insurance refers to an insurance policy with no</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) Deductible</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) waiting period</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) Claim restrictions</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) Medical underwriting</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>A guaranteed insurability provision lets the insured add coverage at specified points without new medical underwriting or proof of insurability.</p>
</div>
<div class="lesson-quiz-item" data-correct="c">
<p class="lesson-quiz-question">Which of the following is NOT a common life insurance policy rider?</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) waiver of premium</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) automatic premium loan</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) extended term</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) accidental death</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>Extended term is a nonforfeiture option for using cash value, not a policy rider; waiver of premium, automatic premium loan, and accidental death are all common riders that add benefits to a policy.</p>
</div>
<div class="lesson-quiz-item" data-correct="c">
<p class="lesson-quiz-question">Which provision will pay a portion of the death benefit prior to the insured''s death due to a serious illness?</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) Cash surrender</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) Return of premium</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) Accelerated death benefit</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) Nonforfeiture</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>The accelerated death benefit provision advances part of the death benefit to a living insured who is diagnosed with a qualifying serious or terminal illness.</p>
</div>
<div class="lesson-quiz-item" data-correct="c">
<p class="lesson-quiz-question">Which of these is considered to be a Living Benefit option in a life insurance policy?</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) Reinstatement</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) Waiver of premium</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) Accelerated death benefit</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) Payor benefit</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>An accelerated death benefit lets the insured access a portion of the death benefit while still living, typically due to a qualifying terminal or catastrophic illness.</p>
</div>
<div class="lesson-quiz-item" data-correct="a">
<p class="lesson-quiz-question">Which of these is NOT a characteristic of the Accelerated Death Benefit option?</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) The face amount and policy premium are not affected by the payment</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) Before payment of the benefit is made, specific conditions must exist, such as suffering from a terminal illness</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) There may be a dollar limit on the maximum benefit</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) The benefit can be offered as a rider at a specific extra cost or may be at no cost</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>Paying an accelerated death benefit reduces the remaining face amount (and typically future premiums), so it does affect the policy''s face amount, contrary to choice a.</p>
</div>
<div class="lesson-quiz-item" data-correct="c">
<p class="lesson-quiz-question">What is the purpose for having an accelerated death benefit on a life insurance policy?</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) It allows for a spouse to be added as a rider to a life insurance policy</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) It allows for policy loans to be advanced to the insured in the event of unemployment</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) It allows for cash advances to be paid against the death benefit if the insured becomes terminally ill</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) It allows for a third party to purchase a life insurance policy at a discounted rate and immediately advance a portion of the death benefit</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>An accelerated death benefit rider lets a terminally ill insured receive a portion of the death benefit early, while still living, to help cover medical or living expenses.</p>
</div>
<div class="lesson-quiz-item" data-correct="c">
<p class="lesson-quiz-question">When a family policy covers children, all of the following are true EXCEPT</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) the coverage is term insurance for a fixed amount</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) there is no additional charge for covering new additions to the new family member</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) evidence of insurability is required to convert coverage for children to permanent insurance</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) all children living with the family are covered even if adopt or born after the policy is issued</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>Children''s term coverage in a family policy typically converts to permanent insurance without requiring evidence of insurability — that''s the false statement; the other choices (fixed-amount term, no extra charge, automatic coverage of newly added children) are all true.</p>
</div>
<div class="lesson-quiz-item" data-correct="c">
<p class="lesson-quiz-question">Which policy feature makes a universal life policy different from a whole life policy?</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) A fixed cash value</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) A fixed death benefit</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) A flexible premium schedule</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) The ability to take out a policy loan</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>Universal life offers a flexible premium schedule, letting the owner vary the amount and timing of premium payments, unlike the fixed premiums of whole life.</p>
</div>
<div class="lesson-quiz-item" data-correct="b">
<p class="lesson-quiz-question">Which federal government agency enforces the security laws enacted by Congress?</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) The Variable Investment Commission</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) The Securities Exchange Commission</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) The Securities Investment Commission</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) The National Securities Regulatory Commission</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>The Securities and Exchange Commission (SEC) is the federal agency responsible for enforcing securities laws, which is relevant to products like variable annuities and variable life insurance.</p>
</div>
<div class="lesson-quiz-item" data-correct="b">
<p class="lesson-quiz-question">Pre-death distributions from a modified endowment contract (MEC) receive different tax treatment than other life insurance policies because</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) the MEC has tax deductible premiums</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) the MEC tends to be an investment vehicle</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) the MEC is considered an illegal product</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) the MEC does not accumulate cash value</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>Because a MEC exceeds the IRS 7-pay test funding limits, it''s treated more like an investment vehicle than pure insurance, so pre-death distributions are taxed gain-first (LIFO), similar to a nonqualified annuity, rather than the cost-basis-first treatment given to ordinary life policies.</p>
</div>
<div class="lesson-quiz-item" data-correct="b">
<p class="lesson-quiz-question">Matt is applying for life insurance and requests a double indemnity rider. A double indemnity benefit will be payable to Matt''s beneficiary if Matt</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) is killed while committing a felony</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) dies instantly from a car accident</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) dies of a stroke</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) is injured in a skiing accident and dies 18 months later</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>A double indemnity/accidental death rider pays only when death results directly and solely from an accident within the required time frame; dying instantly in a car accident qualifies, while death from a felony or death occurring many months after the injury falls outside the rider''s coverage.</p>
</div>
<div class="lesson-quiz-item" data-correct="a">
<p class="lesson-quiz-question">Barbara''s policy includes a rider which allows her to purchase additional insurance at specific dates or events without evidence of insurability. This rider is called a(n)</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) Guaranteed insurability rider</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) Endowment rider</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) Payor rider</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) Family income rider</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>A guaranteed insurability rider lets the insured buy additional coverage at set future dates or life events without having to prove insurability.</p>
</div>', 4
where not exists (select 1 from public.lessons where module_id = 'dcc403da-41ac-4b2d-988a-ccce1d0a0dab' and title = 'Progress Check: Permanent Life Insurance & Riders');
update public.lessons set position = 5 where module_id = 'dcc403da-41ac-4b2d-988a-ccce1d0a0dab' and title = 'Business and Estate Uses of Life Insurance';
insert into public.lessons (id, module_id, title, description, duration, type, content, position)
select gen_random_uuid(), 'dcc403da-41ac-4b2d-988a-ccce1d0a0dab', 'Progress Check: Business and Estate Uses of Life Insurance', '11 practice questions covering Business and Estate Uses of Life Insurance.', '11 min', 'quiz', '<div class="lesson-quiz-item" data-correct="c">
<p class="lesson-quiz-question">Which of the following is present when an applicant stands to lose value if the insured dies?</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) Insurability</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) Offer and acceptance</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) Insurable interest</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) Consideration</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>This describes insurable interest, the requirement that the applicant would suffer a genuine financial or emotional loss upon the insured''s death.</p>
</div>
<div class="lesson-quiz-item" data-correct="b">
<p class="lesson-quiz-question">According to life insurance contract law, insurable interest exists</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) when any business relationship exists</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) at the time of application/beginning</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) at the time of death only</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) when determined by a judge</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>Insurable interest for life insurance must exist at the time the policy is applied for/issued; unlike property insurance, it does not need to continue to exist at the time of death.</p>
</div>
<div class="lesson-quiz-item" data-correct="d">
<p class="lesson-quiz-question">All of these are common personal uses of life insurance EXCEPT</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) Pay final expenses</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) Fund a child''s education</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) Replace an insured''s income</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) Fund a Buy-Sell agreement</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>Funding a buy-sell agreement is a business use of life insurance, not a personal one — the other choices (final expenses, education, income replacement) are all personal needs.</p>
</div>
<div class="lesson-quiz-item" data-correct="b">
<p class="lesson-quiz-question">Bob and Tom are partners in a business. If one of them were to die, which of the following would guarantee a market for each of their share of the business?</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) Split Dollar plan</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) Buy-Sell agreement</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) Deferred compensation plan</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) Key person insurance</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>A buy-sell agreement obligates the surviving partner(s) to purchase the deceased partner''s share, guaranteeing a ready buyer and price for that interest.</p>
</div>
<div class="lesson-quiz-item" data-correct="a">
<p class="lesson-quiz-question">How can partners guarantee a market for their share of the business in the event of death?</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) buy-sell agreement</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) key person insurance</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) split dollar insurance</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) deferred compensation agreements</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>A buy-sell agreement commits the surviving partner(s) to buy out a deceased partner''s interest, ensuring there is always a buyer for that share.</p>
</div>
<div class="lesson-quiz-item" data-correct="a">
<p class="lesson-quiz-question">Which two insurance products are commonly used to fund buy-sell agreement?</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) life insurance and disability insurance</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) life insurance and deferred compensation</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) disability insurance and deferred compensation</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) disability insurance and long-term care insurance</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>Life insurance funds the buyout if an owner dies, and disability insurance funds it if an owner becomes disabled, making these the two products commonly used together.</p>
</div>
<div class="lesson-quiz-item" data-correct="b">
<p class="lesson-quiz-question">Which policy covering two or more individuals pays the face amount only when the first person dies?</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) family policy</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) joint life policy</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) survivorship policy</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) universal life policy</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>A joint life policy covers two or more people and pays its single death benefit upon the first insured''s death, after which the policy terminates.</p>
</div>
<div class="lesson-quiz-item" data-correct="c">
<p class="lesson-quiz-question">What kind of life insurance policy covers two or more people with the death benefit payable upon the last person''s death?</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) Dual Life insurance</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) Joint Life insurance</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) Last Survivor Life insurance</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) Shared Life insurance</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>A last-survivor (survivorship) life policy insures two or more people and pays the death benefit only after the last insured dies.</p>
</div>
<div class="lesson-quiz-item" data-correct="c">
<p class="lesson-quiz-question">John and Mary have a handicapped child that is financially dependent upon them. The death of one of the parents would not be financially disastrous, however the death of both likely would be. Which policy would be best suited for them?</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) Payor protection policy</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) Family income policy</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) Second-to-die policy</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) First-to-die policy</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>A second-to-die (survivorship) policy pays its death benefit only after both insureds have died, which fits a couple who can manage financially after one parent''s death but needs funds to provide for a dependent child once both are gone.</p>
</div>
<div class="lesson-quiz-item" data-correct="c">
<p class="lesson-quiz-question">In an employer-sponsored contributory group Disability Income plan, the employer pays 60% of the premium and each employee pays 40% of the premium. Any income benefits paid are taxed to the employee at</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) Employee has no tax liability</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) 40% of the benefit</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) 60% of the benefit</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) 100% of benefit</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>In a contributory group plan, disability benefits are taxable in the same proportion the employer paid the premium; since the employer paid 60%, 60% of the benefit is taxable to the employee.</p>
</div>
<div class="lesson-quiz-item" data-correct="c">
<p class="lesson-quiz-question">Which benefits are provided by key employee insurance?</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) retirement compensation for long-time employees</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) bonuses to employees for exceptional performance</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) payment to a business when an important employee dies</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) death benefits to the family of a deceased stockholder</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>Key employee (key person) life insurance pays a benefit to the business itself when a key employee dies, helping offset the financial loss and cost of finding a replacement.</p>
</div>', 6
where not exists (select 1 from public.lessons where module_id = 'dcc403da-41ac-4b2d-988a-ccce1d0a0dab' and title = 'Progress Check: Business and Estate Uses of Life Insurance');
update public.lessons set position = 7 where module_id = 'dcc403da-41ac-4b2d-988a-ccce1d0a0dab' and title = 'Beneficiaries, Settlement Options & Nonforfeiture';
insert into public.lessons (id, module_id, title, description, duration, type, content, position)
select gen_random_uuid(), 'dcc403da-41ac-4b2d-988a-ccce1d0a0dab', 'Progress Check: Beneficiaries, Settlement Options & Nonforfeiture', '13 practice questions covering Beneficiaries, Settlement Options & Nonforfeiture.', '13 min', 'quiz', '<div class="lesson-quiz-item" data-correct="d">
<p class="lesson-quiz-question">Sharon is the policyowner of a $50,000 life insurance policy. Her son, Mike, is the beneficiary. If Sharon MUST obtain Mike''s signature in order to change the beneficiary, what kind of beneficiary designation is this?</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) Primary</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) contingent</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) revocable</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) irrevocable</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>An irrevocable beneficiary designation cannot be changed by the policyowner without that beneficiary''s written consent, unlike a revocable designation, which the owner may change at any time.</p>
</div>
<div class="lesson-quiz-item" data-correct="b">
<p class="lesson-quiz-question">All of the following statements about contingent beneficiaries are true EXCEPT</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) more than one contingent beneficiary may be named</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) the contingent beneficiary shares death proceeds equally with the primary beneficiary</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) they receive the death proceeds if the primary beneficiary is deceased at the time of the insured''s death</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) they receive the remaining payments to be made under a settlement agreement upon the primary beneficiary''s death</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>A contingent beneficiary only receives the death proceeds if the primary beneficiary is not living at the insured''s death — they don''t split the payout with a surviving primary beneficiary.</p>
</div>
<div class="lesson-quiz-item" data-correct="b">
<p class="lesson-quiz-question">Pat is insured with a life insurance policy and Karen is his primary beneficiary. They are both involved in an automobile accident where Pat dies instantly and Karen dies 5 days later. Which policy provision will protect the rights of the contingent beneficiary to receive the policy benefits?</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) Nonforfeiture clause</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) Common disaster clause</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) Spendthrift clause</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) Accident indemnity clause</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>The common disaster clause requires a beneficiary to survive the insured by a stated period (or presumes the insured outlived the beneficiary) when both die from the same accident close in time, so the proceeds pass to the contingent beneficiary instead of the primary beneficiary''s estate.</p>
</div>
<div class="lesson-quiz-item" data-correct="b">
<p class="lesson-quiz-question">All of the following are true about life insurance policy settlement options EXCEPT:</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) If none is selected, the insurer will pay the proceeds in cash</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) Settlement options preselected by the policyowner may be changed by the beneficiary at any time</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) If not preselected by the policyowner at time of application, the beneficiary may select one when the insured dies</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) They may be preselected by the policyowner at the time of application</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>Once a policyowner has preselected a settlement option, it is generally binding and cannot simply be changed by the beneficiary at will after the insured''s death.</p>
</div>
<div class="lesson-quiz-item" data-correct="b">
<p class="lesson-quiz-question">Elizabeth is the beneficiary of a life insurance policy. She is receiving the death benefit in payments of $10,000 per month until the principal and interest has been paid out. Which option was chosen?</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) Fixed period</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) fixed amount</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) life income</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) interest only</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>Paying a fixed dollar amount each month until the principal and interest are exhausted, with the payout period varying, is the fixed amount settlement option — as opposed to the fixed period option, where the time frame rather than the payment amount is set.</p>
</div>
<div class="lesson-quiz-item" data-correct="d">
<p class="lesson-quiz-question">Which of the following is NOT a life insurance settlement option?</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) Lump sum option</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) fixed amount option</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) Life income option</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) Extended term option</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>Extended term is a nonforfeiture option for cash value, not a settlement option for paying out death proceeds; lump sum, fixed amount, and life income are all standard settlement options.</p>
</div>
<div class="lesson-quiz-item" data-correct="b">
<p class="lesson-quiz-question">Pam is the primary beneficiary of a life insurance policy and wants to let the death benefit accumulate and receive only the monthly investment proceeds. Which settlement option should she choose?</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) lump sum option</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) interest Option</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) life income option</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) fixed amount option</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>Under the interest (accumulation at interest) settlement option, the insurer holds the death benefit principal and pays the beneficiary only the interest it earns.</p>
</div>
<div class="lesson-quiz-item" data-correct="c">
<p class="lesson-quiz-question">A life insurance policy can be surrendered for its cash value under which policy provision?</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) Dividend options</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) Payor options</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) Nonforfeiture options</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) Settlement options</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>Nonforfeiture options are the provisions that let a policyowner surrender a cash-value policy and receive its cash value (or another nonforfeiture benefit) instead of losing it.</p>
</div>
<div class="lesson-quiz-item" data-correct="a">
<p class="lesson-quiz-question">A $50K whole life policy with a cash value of $10K has been in force for eleven years. The policyowner is unable to continue the premium payments. Which of the following describes the reduced paid-up nonforfeiture option?</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) the cash value is used to select a $20K paid-up policy</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) the policy is surrendered and the policy owner is paid $10K by the insurer</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) the cash value is used to purchase a $50K term insurance policy that is paid up for ten years</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) the policyowner begins to receive monthly payments of $200 from the insurer that will continue for life</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>Reduced paid-up uses the existing cash value as a single premium to buy a smaller, fully paid-up whole life policy — smaller than the original $50K face amount.</p>
</div>
<div class="lesson-quiz-item" data-correct="a">
<p class="lesson-quiz-question">Which situation accurately describes a reduced paid-up nonforfeiture option?</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) Policy has a decreased face amount</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) Face amount of the new policy equals that of the original policy</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) Cash value is surrendered to policyowner</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) Premiums must continue to be paid</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>The new paid-up policy has a lower face amount than the original, since the existing cash value can only fund so much coverage as a single premium.</p>
</div>
<div class="lesson-quiz-item" data-correct="d">
<p class="lesson-quiz-question">Dorian exercised a nonforfeiture option by using his life policy''s cash value to purchase an extended term insurance option. When the term insurance expires,</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) he has the option of resuming the original policy and paying the same premium</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) the coverage can be extended with a lump sum payment</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) all remaining cash values are paid to the policyowner</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) the protection ends</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>Extended term coverage lasts only as long as the cash value can fund it. Once that term runs out, there''s no more coverage and no cash value left.</p>
</div>
<div class="lesson-quiz-item" data-correct="c">
<p class="lesson-quiz-question">A beneficiary has just received a claim payment for a life insurance policy. Which of the following is TRUE regarding the federal income tax liability owed?</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) A flat tax of 10% is owed on all proceeds</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) Federal income tax is owed if proceeds exceed $250,000</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) No federal income tax is owed on life insurance proceeds</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) Tax liability owed depends on the type of life insurance policy</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>Death proceeds paid to a beneficiary under a life insurance policy are generally received free of federal income tax, regardless of the amount.</p>
</div>
<div class="lesson-quiz-item" data-correct="d">
<p class="lesson-quiz-question">When a life insurance policy is surrendered, how does the cost recovery rule apply?</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) The entire cash value is taxable</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) The policy''s cost basis is taxable</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) The insurer withholds the cost basis</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) The policy''s cost basis is exempt from taxation</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>Under the cost-recovery rule, the amount up to the policy''s cost basis (premiums paid) is returned tax-free on surrender, so that portion is exempt from taxation; only any gain above the cost basis is taxable.</p>
</div>', 8
where not exists (select 1 from public.lessons where module_id = 'dcc403da-41ac-4b2d-988a-ccce1d0a0dab' and title = 'Progress Check: Beneficiaries, Settlement Options & Nonforfeiture');
update public.lessons set position = 9 where module_id = 'dcc403da-41ac-4b2d-988a-ccce1d0a0dab' and title = 'Keeping a Policy in Force';
insert into public.lessons (id, module_id, title, description, duration, type, content, position)
select gen_random_uuid(), 'dcc403da-41ac-4b2d-988a-ccce1d0a0dab', 'Progress Check: Keeping a Policy in Force', '16 practice questions covering Keeping a Policy in Force.', '16 min', 'quiz', '<div class="lesson-quiz-item" data-correct="d">
<p class="lesson-quiz-question">The free-look provision gives the policyowner</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) the right to return the policy for a partial refund within a specified number of days</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) the right to contest the terms of the policy</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) the right to change a policy provision</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) the right to return the policy for a full refund within a specified number of days</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>The free-look provision allows the policyowner to examine the policy and return it for a full refund within a specified number of days if not satisfied.</p>
</div>
<div class="lesson-quiz-item" data-correct="b">
<p class="lesson-quiz-question">Individual life insurance policies sold to seniors in the state of California must include a prominently placed statement that divulges all of the following information EXCEPT</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) the policy should be returned to the agent or insurer if not wanted</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) proof of surrender must be notarized at the agent''s principal office</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) a charge might apply if declined after the time allowed for surrender</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) the policy can be returned during a free look period for a full refund</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>California''s senior life insurance disclosure requirements cover the free-look period, the right to return the policy, and any surrender charge, but they do not require that proof of surrender be notarized at the agent''s principal office — no such requirement exists.</p>
</div>
<div class="lesson-quiz-item" data-correct="c">
<p class="lesson-quiz-question">The California Insurance Code allows an individual how many days to cancel a life policy for a full-refund?</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) Up to 10 days</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) Between 15 and 20 days</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) Between 10 and 30 days</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) Between 30 and 45 days</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>California''s free-look period for life insurance falls between 10 and 30 days, depending on the policy type and applicant''s age, during which the policyowner can return the policy for a full refund.</p>
</div>
<div class="lesson-quiz-item" data-correct="c">
<p class="lesson-quiz-question">How long is the free cancellation period for life insurance policies offered to individuals who are 60 or older?</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) 10 days</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) 20 days</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) a period of 30 days</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) 45 days</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>California requires a longer free-look period, a period of 30 days, on life insurance policies sold to applicants age 60 or older, compared to the standard free look given to younger buyers.</p>
</div>
<div class="lesson-quiz-item" data-correct="b">
<p class="lesson-quiz-question">Why is the delivery of a life insurance policy important?</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) the policy is not in effect until it is delivered</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) the free-look period begins on the policy delivery date</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) the grace period begins on the policy delivery date</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) commissions are not paid until the policy is delivered</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>Policy delivery matters because the free-look period, during which the owner may return the policy for a full refund, begins on the date of delivery.</p>
</div>
<div class="lesson-quiz-item" data-correct="d">
<p class="lesson-quiz-question">What time period allows an insured''s life insurance policy to remain in force even if the premium was not paid on the due date?</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) Entire contract period</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) Free-look period</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) Reinstatement period</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) Grace period</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>The grace period keeps a policy in force for a set number of days after the due date, giving the policyholder time to pay an overdue premium without lapsing coverage.</p>
</div>
<div class="lesson-quiz-item" data-correct="a">
<p class="lesson-quiz-question">If an insured dies during the grace period with no premiums paid</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) the policy would be payable, minus the premium amount</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) the policy would be payable only after the beneficiary makes past due premium payment</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) all past premiums will be refunded with interest</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) the claim would be denied</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>The grace period keeps the policy in force even though the premium is overdue, so a death during that window is still covered — the insurer simply deducts the unpaid premium from the death benefit paid to the beneficiary.</p>
</div>
<div class="lesson-quiz-item" data-correct="a">
<p class="lesson-quiz-question">The automatic premium loan provision starts being effective when?</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) After the grace period</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) Nothing active during grace period</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) After the incontestability period</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) Right after the premium is paid</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>The automatic premium loan provision kicks in only after the grace period ends without payment, automatically borrowing against the policy''s cash value to keep it in force.</p>
</div>
<div class="lesson-quiz-item" data-correct="b">
<p class="lesson-quiz-question">Which policy provision allows an insured to continue coverage under a previously lapsed policy?</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) the settlement provision</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) the reinstatement provision</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) the nonforfeiture provision</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) the incontestability provision</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>The reinstatement provision lets an insured restore a lapsed policy, generally by paying past-due premiums and providing evidence of insurability.</p>
</div>
<div class="lesson-quiz-item" data-correct="b">
<p class="lesson-quiz-question">Lapsed individual life insurance may be reinstated at any time within</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) 2 years</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) 3 years</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) 4 years</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) 5 years</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>California law gives policyowners up to 3 years after a lapse to reinstate an individual life insurance policy, subject to proof of insurability and payment of back premiums with interest.</p>
</div>
<div class="lesson-quiz-item" data-correct="c">
<p class="lesson-quiz-question">All of the following statements regarding the reinstatement of a life insurance policy are correct EXCEPT</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) a policy may be reinstated after it has been in effect for 3 years</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) all back premiums must be paid before a policy may be reinstated</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) a policy may be reinstated without proof of insurability</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) once a policy has been surrendered for its cash value, it may not be reinstated</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>Reinstating a lapsed life policy generally requires proof of insurability (an updated statement of health), not just payment of back premiums — insurers want assurance the risk hasn''t worsened.</p>
</div>
<div class="lesson-quiz-item" data-correct="a">
<p class="lesson-quiz-question">What prevents a life insurance policy from being rescinded by the insurer after being in force for two years?</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) Incontestability clause</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) Free-look provision</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) Grace period provision</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) Subrogation</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>The incontestability clause bars the insurer from voiding a policy over misstatements or fraud in the application once it has been in force for the specified contestable period, typically two years.</p>
</div>
<div class="lesson-quiz-item" data-correct="a">
<p class="lesson-quiz-question">Christine has a health insurance policy that has been in force beyond the incontestable period. The insurer has discovered that a fraudulent statement was made on the application. What would the insurer have to pay on a claim, assuming this wasn''t a guaranteed renewable policy?</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) Nothing</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) 50% of the claim''s amount</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) 75% of the claim''s amount</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) 100% of the claim''s amount</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>Fraud is an exception to the incontestability clause, so even after the contestable period has passed the insurer can deny the claim entirely based on the fraudulent statement.</p>
</div>
<div class="lesson-quiz-item" data-correct="d">
<p class="lesson-quiz-question">The insurer can do which of the following under a noncancelable health insurance policy?</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) raises the premium rate</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) change the policy provision</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) refuse to renew the policy for any reason</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) cancels the policy for nonpayment of premium</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>Even under a noncancelable policy, which guarantees renewal at a fixed premium, the insurer can still cancel for nonpayment of premium. It cannot raise rates, change provisions, or refuse renewal.</p>
</div>
<div class="lesson-quiz-item" data-correct="b">
<p class="lesson-quiz-question">What type of changes can be made to a guaranteed renewable health insurance policy?</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) The incontestability period</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) The premium rates of the policyowner</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) The grace period</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) The policy''s provision</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>On a guaranteed renewable policy the insurer cannot cancel it or change its benefits, but it can adjust premium rates for an entire class of insureds.</p>
</div>
<div class="lesson-quiz-item" data-correct="a">
<p class="lesson-quiz-question">The insurer has the option of terminating a health insurance policy on a date stated in the contract. What type of policy is this?</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) Optionally renewable</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) Renewable</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) conditionally renewable</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) cancellable</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>An optionally renewable policy lets the insurer decide, on specified policy anniversary or premium due dates, whether to terminate or continue the coverage.</p>
</div>', 10
where not exists (select 1 from public.lessons where module_id = 'dcc403da-41ac-4b2d-988a-ccce1d0a0dab' and title = 'Progress Check: Keeping a Policy in Force');
update public.lessons set position = 11 where module_id = 'dcc403da-41ac-4b2d-988a-ccce1d0a0dab' and title = 'Participating vs. Non-Participating Insurers';
insert into public.lessons (id, module_id, title, description, duration, type, content, position)
select gen_random_uuid(), 'dcc403da-41ac-4b2d-988a-ccce1d0a0dab', 'Progress Check: Participating vs. Non-Participating Insurers', '10 practice questions covering Participating vs. Non-Participating Insurers.', '10 min', 'quiz', '<div class="lesson-quiz-item" data-correct="d">
<p class="lesson-quiz-question">The major difference between participating and nonparticipating policies is the</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) interest assumption</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) premium payment method</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) settlement options</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) presence of policy dividends</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>Participating policies pay dividends (a return of excess premium) to policyholders; nonparticipating policies don''t.</p>
</div>
<div class="lesson-quiz-item" data-correct="c">
<p class="lesson-quiz-question">A nonparticipating policy will</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) provide a return of premium</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) provide tax advantages</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) not pay dividends</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) give policyowners special privileges</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>Nonparticipating means the policyholder doesn''t share in the insurer''s surplus through dividends — that''s reserved for participating (mutual) policies.</p>
</div>
<div class="lesson-quiz-item" data-correct="d">
<p class="lesson-quiz-question">A nonparticipating company is sometimes called a(n)</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) alien insurer</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) mutual insurer</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) reinsurer</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) stock insurer</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>Stock insurers are owned by stockholders and pay profits to them, not dividends to policyholders — the opposite of a mutual (participating) insurer.</p>
</div>
<div class="lesson-quiz-item" data-correct="a">
<p class="lesson-quiz-question">Which statement is true regarding policy dividends?</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) A dividend option is selected by the insured at the time of policy purchase</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) Dividends are always taxable</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) Dividends are always guaranteed</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) Nonparticipating policies issue dividends</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>The insured chooses how dividends will be applied (e.g., cash, reduced premium, paid-up additions) when the policy is purchased; dividends are never guaranteed, are a return of excess premium so not taxable as income, and are only paid by participating policies.</p>
</div>
<div class="lesson-quiz-item" data-correct="b">
<p class="lesson-quiz-question">Which type of life insurance policy gives an owner the right to share in the insurer''s surplus?</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) level term</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) participating</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) decreasing term</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) non-participating</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>A participating policy entitles the owner to share in the insurer''s divisible surplus through policy dividends.</p>
</div>
<div class="lesson-quiz-item" data-correct="c">
<p class="lesson-quiz-question">Which type of insurer is owned by its policyholders?</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) a fraternal society</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) a reciprocal exchange</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) a mutual insurer</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) a capital stock insurer</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>A mutual insurer is owned by its policyholders, who may share in the company''s surplus through dividends, unlike a stock insurer owned by shareholders.</p>
</div>
<div class="lesson-quiz-item" data-correct="d">
<p class="lesson-quiz-question">Life insurance surplus must be distributed to policyowners at what frequency?</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) Monthly</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) Quarterly</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) Semi-annually</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) Annually</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>Divisible surplus on participating policies is calculated and paid out to policyowners as dividends once a year.</p>
</div>
<div class="lesson-quiz-item" data-correct="d">
<p class="lesson-quiz-question">Which of the following is NOT an option for the use of the policy dividends?</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) purchase paid-up additions</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) reduce the current premium</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) purchase a 1-year term addition</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) funds the distribution of monthly income payments</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>Policy dividends can be used for paid-up additions, reducing the premium, or a one-year term addition, but not to fund ongoing monthly income payments — that isn''t a standard dividend option.</p>
</div>
<div class="lesson-quiz-item" data-correct="d">
<p class="lesson-quiz-question">A policy owner has the right to change all of the following EXCEPT the</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) beneficiary</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) payment mode</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) dividend option</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) dividend schedule</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>A policyowner can change the beneficiary, payment mode, and dividend option, but the dividend schedule itself is set by the insurer, not chosen by the owner.</p>
</div>
<div class="lesson-quiz-item" data-correct="b">
<p class="lesson-quiz-question">The process whereby a mutual insurer becomes a stock company is called:</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) Mutualization</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) Demutualization</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) Reinsurance d</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) Reorganization</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>Demutualization is the conversion of a mutual insurer, owned by its policyholders, into a stock company owned by shareholders.</p>
</div>', 12
where not exists (select 1 from public.lessons where module_id = 'dcc403da-41ac-4b2d-988a-ccce1d0a0dab' and title = 'Progress Check: Participating vs. Non-Participating Insurers');
update public.lessons set position = 13 where module_id = 'dcc403da-41ac-4b2d-988a-ccce1d0a0dab' and title = 'Underwriting and Group Life Insurance';
insert into public.lessons (id, module_id, title, description, duration, type, content, position)
select gen_random_uuid(), 'dcc403da-41ac-4b2d-988a-ccce1d0a0dab', 'Progress Check: Underwriting and Group Life Insurance', '14 practice questions covering Underwriting and Group Life Insurance.', '14 min', 'quiz', '<div class="lesson-quiz-item" data-correct="a">
<p class="lesson-quiz-question">Life insurance policies written without a physical examination are called</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) non-medical</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) preferred</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) standard</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) substandard</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>Non-medical policies are underwritten from the application and other records alone, without requiring a paramedical or physical exam, and are typically limited to smaller face amounts.</p>
</div>
<div class="lesson-quiz-item" data-correct="c">
<p class="lesson-quiz-question">The use of non-medical life insurance accomplishes all of the following EXCEPT</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) there is less demand on the medical profession</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) the processing of life insurance applications is expedited</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) insured’s can avoid answering medical questions on the application</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) insurer are reduced by the cost of paying for medical examination</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>Non-medical life insurance still requires the applicant to answer medical questions on the application; it simply waives the requirement for a physical exam, which speeds processing and reduces cost.</p>
</div>
<div class="lesson-quiz-item" data-correct="c">
<p class="lesson-quiz-question">Who are the parties to the master contract in a group life insurance policy?</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) Insurer and employee</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) Employer and employee</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) Insurer and employer</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) Employer and beneficiary</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>The employer, as master policyholder, contracts directly with the insurer; individual employees just receive a certificate of insurance, not their own contract.</p>
</div>
<div class="lesson-quiz-item" data-correct="c">
<p class="lesson-quiz-question">A master contract and certificate of coverage can be found in which type of policy?</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) Long-term</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) Medicaid</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) Group</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) Medicare</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>Group insurance uses a master contract issued to the group (employer/association), with individual certificates of coverage given to each covered member.</p>
</div>
<div class="lesson-quiz-item" data-correct="d">
<p class="lesson-quiz-question">In an employer-sponsored group accident and health plan, a master contract is issued to the</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) TPA</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) Employees</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) Administrative Services Organization</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) Employer</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>The group''s master contract is issued to the employer, who holds it on behalf of the covered employees.</p>
</div>
<div class="lesson-quiz-item" data-correct="c">
<p class="lesson-quiz-question">In group life insurance, who is issued a certificate of insurance?</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) the insurer</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) the beneficiary</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) the participant</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) the policyholder</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>Individual employees (participants) receive a certificate of insurance as evidence of coverage, since the actual master contract belongs to the employer.</p>
</div>
<div class="lesson-quiz-item" data-correct="a">
<p class="lesson-quiz-question">Which of the following is not ordinary life insurance?</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) Group life</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) Blanket</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) industrial</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) individual</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>Group life is its own classification, written under a master contract covering many people, rather than the individually underwritten ordinary (individual) life insurance category.</p>
</div>
<div class="lesson-quiz-item" data-correct="b">
<p class="lesson-quiz-question">How much employer-provided group term life insurance is exempt from income taxation?</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) $25K</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) $50K</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) $75K</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) $100K</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>Under IRC Section 79, the first $50,000 of employer-provided group term life coverage is excluded from the employee''s taxable income.</p>
</div>
<div class="lesson-quiz-item" data-correct="d">
<p class="lesson-quiz-question">The cost of employer-provided group life insurance above $50K is</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) taxable to the employer</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) tax exempt to the employee</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) tax deductible by the employee</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) taxable as income to the employee</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>Under IRS rules, the cost of employer-paid group term life coverage exceeding $50,000 is taxable income to the employee, even though the employer pays the premium.</p>
</div>
<div class="lesson-quiz-item" data-correct="b">
<p class="lesson-quiz-question">Tim was recently terminated from his employment and opted to change his existing group term life insurance to individual permanent life insurance. What is this process called?</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) Replacement</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) Conversion</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) Transformation</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) Reinstatement</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>This is a conversion, the right to convert group term coverage to an individual permanent policy without evidence of insurability when group coverage ends.</p>
</div>
<div class="lesson-quiz-item" data-correct="c">
<p class="lesson-quiz-question">A terminating employee who wants to exercise the conversion privilege must meet all of the following requirements EXCEPT</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) pay the premium</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) fill out the required forms</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) supply evidence on insurability</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) apply within 31 days of termination</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>The conversion privilege specifically allows a terminated group member to convert to an individual policy without proving insurability; evidence of insurability is not required.</p>
</div>
<div class="lesson-quiz-item" data-correct="d">
<p class="lesson-quiz-question">What is one difference between group life and individual life underwriting?</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) only group life insurance gives a choice of payment plans</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) group life insurance usually requires a medical examination</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) only individual life insurance requires the naming of a beneficiary</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) individual life insurance requires the applicant to answer medical questions</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>Individual life underwriting typically requires the applicant to answer detailed medical questions, while group underwriting is largely guaranteed issue based on the group as a whole rather than each member''s health.</p>
</div>
<div class="lesson-quiz-item" data-correct="b">
<p class="lesson-quiz-question">A group policy may be issued to a labor union. The members eligible for insurance under the policy shall be</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) members of any union</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) all of the members of the union</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) only members of the union who are under the age of 65</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) healthy members of the union</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>Under a group policy issued to a labor union, all members of the union must be eligible for coverage; an insurer cannot selectively cover only some members.</p>
</div>
<div class="lesson-quiz-item" data-correct="a">
<p class="lesson-quiz-question">During the underwriting process for a group health policy, it was discovered that 15 out of 50 members of the group have major health issues. How would the insurer handle this?</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) Accept or reject the whole group</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) Accept the 35 insurable individuals while rejecting the remaining 15</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) Charge a higher premium to the 15 unhealthy individuals</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) Assign the group to a re-insurer</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>Group health coverage is underwritten as a single unit, so the insurer must accept or reject the entire group rather than cherry-picking out the unhealthy members.</p>
</div>', 14
where not exists (select 1 from public.lessons where module_id = 'dcc403da-41ac-4b2d-988a-ccce1d0a0dab' and title = 'Progress Check: Underwriting and Group Life Insurance');
update public.lessons set position = 15 where module_id = 'dcc403da-41ac-4b2d-988a-ccce1d0a0dab' and title = 'Retirement Plans';
insert into public.lessons (id, module_id, title, description, duration, type, content, position)
select gen_random_uuid(), 'dcc403da-41ac-4b2d-988a-ccce1d0a0dab', 'Progress Check: Retirement Plans', '6 practice questions covering Retirement Plans.', '6 min', 'quiz', '<div class="lesson-quiz-item" data-correct="a">
<p class="lesson-quiz-question">Employer contributions to qualified plans are</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) tax-deductible by the employer</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) taxable to the employee</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) only available for key employees</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) only found in 403(b) plans</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>Employer contributions to a qualified retirement plan are tax-deductible as a business expense in the year they are made.</p>
</div>
<div class="lesson-quiz-item" data-correct="b">
<p class="lesson-quiz-question">Which of these statements concerning Traditional IRAs is CORRECT?</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) Earnings are not taxable when withdrawn</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) Earnings are taxable when withdrawn</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) Contributions are never tax-deductible</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) Contributions are always made by the employer</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>Traditional IRA contributions and earnings grow tax-deferred, so earnings are taxed as ordinary income when withdrawn.</p>
</div>
<div class="lesson-quiz-item" data-correct="a">
<p class="lesson-quiz-question">Non-deductible contributions are typically associated with a</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) Roth IRA</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) 401(k)</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) Traditional IRA</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) SEP Plan</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>Roth IRA contributions are made with after-tax dollars and are never tax-deductible, unlike traditional IRA or qualified plan contributions, which can reduce taxable income.</p>
</div>
<div class="lesson-quiz-item" data-correct="b">
<p class="lesson-quiz-question">Retirement plans cannot favor highly compensated employs. The government regulation that prevents this from happening is called</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) Defamation b</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) Nondiscrimination</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) IRC Section 457</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) HR-10</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>Nondiscrimination rules require qualified retirement plans to benefit employees broadly, not just those who are highly compensated.</p>
</div>
<div class="lesson-quiz-item" data-correct="a">
<p class="lesson-quiz-question">What is ESOP stand for?</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) Employee Stock Ownership Plan</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) Employee Savings Optional Plan</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) Employee Savings Opportunity Plan</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) Employer Stock Offering Program</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>ESOP stands for Employee Stock Ownership Plan, a program that gives employees ownership interest in the company through shares of stock.</p>
</div>
<div class="lesson-quiz-item" data-correct="a">
<p class="lesson-quiz-question">In a 5 year vesting schedule, what percentage of employer contributions must be vested after 5 years of service?</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) 100%</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) 80%</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) 60%</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) 40%</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>Under a 5-year cliff vesting schedule, an employee has no vested right to employer contributions until reaching 5 years of service, at which point they become 100% vested all at once.</p>
</div>', 16
where not exists (select 1 from public.lessons where module_id = 'dcc403da-41ac-4b2d-988a-ccce1d0a0dab' and title = 'Progress Check: Retirement Plans');
update public.lessons set position = 17 where module_id = 'dcc403da-41ac-4b2d-988a-ccce1d0a0dab' and title = 'Annuities';
insert into public.lessons (id, module_id, title, description, duration, type, content, position)
select gen_random_uuid(), 'dcc403da-41ac-4b2d-988a-ccce1d0a0dab', 'Progress Check: Annuities', '17 practice questions covering Annuities.', '17 min', 'quiz', '<div class="lesson-quiz-item" data-correct="a">
<p class="lesson-quiz-question">The systematic liquidation of a sum of money is provided by a(n):</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) annuity</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) endowment contract</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) life insurance policy</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) 1035 contract exchange</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>An annuity''s defining function is the systematic liquidation of a sum of money, converting an accumulated fund into a stream of periodic income payments.</p>
</div>
<div class="lesson-quiz-item" data-correct="c">
<p class="lesson-quiz-question">People commonly purchase an annuity to protect against the risk of</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) dying too soon</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) becoming insurable</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) outliving their financial resources</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) dying before their home mortgage is paid off</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>An annuity''s core purpose is to guarantee income for life, protecting against the risk of outliving your savings.</p>
</div>
<div class="lesson-quiz-item" data-correct="a">
<p class="lesson-quiz-question">An immediate annuity has been purchased with a single premium. When does the annuitant typically begin receiving benefit payments?</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) 1 month</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) 6 months</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) 12 months</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) 24 months</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>By definition, an "immediate" annuity starts paying out right away — typically within about one payment interval of purchase, unlike a deferred annuity.</p>
</div>
<div class="lesson-quiz-item" data-correct="b">
<p class="lesson-quiz-question">Kathy''s annuity is currently experiencing tax-deferred growth until she retires. Which phase is this annuity in?</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) Payout period</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) Accumulation period</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) Deferred period</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) Growth period</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>The accumulation period is the phase during which the annuity owner pays in premiums that grow tax-deferred, before annuitization and payout begin.</p>
</div>
<div class="lesson-quiz-item" data-correct="d">
<p class="lesson-quiz-question">During the accumulation period, who can surrender an annuity?</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) Payor</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) Annuitant</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) Beneficiary</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) Policyowner</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>The policyowner controls the contract and holds the right to surrender the annuity during the accumulation period, regardless of who the annuitant or beneficiary is.</p>
</div>
<div class="lesson-quiz-item" data-correct="b">
<p class="lesson-quiz-question">Which policy is a savings instrument designed to first accumulate funds and then systematically to liquidate the funds?</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) term life</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) deferred annuity</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) mortgage insurance</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) disability income insurance</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>A deferred annuity has an accumulation phase where funds grow before an annuitization phase where they are paid out systematically.</p>
</div>
<div class="lesson-quiz-item" data-correct="c">
<p class="lesson-quiz-question">The insured bought an annuity ten years ago. He will retire in 5 years. To determine the value of his annuity, he must multiply the value of the "accumulation units" he owns, times the value of the "separate account". This type of annuity is known as a</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) fixed annuity</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) flexible annuity</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) variable annuity</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) accumulation annuity</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>Variable annuities use accumulation units tied to a separate account invested in securities, so the annuity''s value fluctuates with the underlying investment performance.</p>
</div>
<div class="lesson-quiz-item" data-correct="d">
<p class="lesson-quiz-question">Which of the following is NOT a feature of equity-indexed annuities?</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) Offers long term inflation protection</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) Offers protection during a decline in the stock market</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) offers a minimum guaranteed rate</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) Offers a maximum interest rate that increases annually</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>Equity-indexed annuities cap the maximum interest rate credited, but that cap does not automatically increase every year; they do offer a guaranteed minimum rate and protection against market declines.</p>
</div>
<div class="lesson-quiz-item" data-correct="d">
<p class="lesson-quiz-question">Which of the following is a characteristic of nonqualified annuities?</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) tax- contribution</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) limits on contributions</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) mandatory participation</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) tax-deferred earnings</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>Nonqualified annuities are funded with after-tax dollars but still grow tax-deferred, and unlike qualified plans they have no contribution limits and participation is voluntary.</p>
</div>
<div class="lesson-quiz-item" data-correct="d">
<p class="lesson-quiz-question">An insure replaces an existing annuity with a new one and must pay a surrender charge for cancelling the existing annuity. The new policy holds no greater financial benefits to the insured than the existing contract. This is an example of</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) nonforfeiture</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) a deferred annuity</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) a substandard annuity</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) an unnecessary replacement</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>Replacing an annuity that triggers a surrender charge while providing no real improvement in benefits is the definition of an unnecessary replacement, which regulators scrutinize to protect consumers.</p>
</div>
<div class="lesson-quiz-item" data-correct="a">
<p class="lesson-quiz-question">Which type of annuity stops all payments upon the death of the annuitant?</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) Life annuity</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) Period certain annuity</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) Cash refund annuity</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) Joint and survivor annuity</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>A straight life annuity pays only for the annuitant''s lifetime and stops immediately at death, with no further payments to anyone, unlike period-certain, refund, or joint-and-survivor options.</p>
</div>
<div class="lesson-quiz-item" data-correct="b">
<p class="lesson-quiz-question">A person owns a life annuity. He elects to receive his annuity payments monthly for the remainder of his life with "10 years certain." The annuity will make payments</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) for 120 months, if the insured lives that long</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) for a minimum of 120 months and a maximum of the remainder of his life</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) until his death, when the beneficiary begins receiving payments for 120 additional months</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) during the "period certain" after which the payments will be reduced, but they will continue for the rest of his life</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>A life annuity with a 10-year certain period guarantees payments for at least 120 months even if the annuitant dies early, but continues for life if the annuitant outlives that period.</p>
</div>
<div class="lesson-quiz-item" data-correct="b">
<p class="lesson-quiz-question">A 10-year certain annuity with an installment refund is purchased. The annuitant dies after receiving monthly payments for 5 years. How many remaining payments will the insurer make?</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) none</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) 60 payments</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) 120 payments</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) one lump sum payment</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>A 10-year certain annuity guarantees 120 monthly payments regardless of survival. After 5 years (60 payments), 60 guaranteed payments remain and go to the beneficiary.</p>
</div>
<div class="lesson-quiz-item" data-correct="a">
<p class="lesson-quiz-question">The taxable portion of each annuity payment is calculated using which method?</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) Exclusion Ratio</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) Taxable Ratio</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) Cost Basis</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) Tax Basis</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>The exclusion ratio determines what portion of each annuity payment is a tax-free return of the owner''s cost basis versus taxable interest/growth.</p>
</div>
<div class="lesson-quiz-item" data-correct="a">
<p class="lesson-quiz-question">Which of these is NOT considered to be a purpose of an annuity?</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) Annuities are intended to create an estate</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) Annuities are intended to liquidate an estate</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) Annuities are intended for the tax-free growth of principal</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) Annuities are intended to distribute accumulated principal</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>Annuities are designed to liquidate (distribute) an already-accumulated sum, not to create an estate; life insurance, not annuities, is the tool used to create an estate.</p>
</div>
<div class="lesson-quiz-item" data-correct="a">
<p class="lesson-quiz-question">What fact determines the difference between deferred and immediate annuities?</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) when annuity benefit payments begin</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) the number of annuity benefit payment</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) who receives the annuity benefit payments</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) the dollar amount of the annuity benefit payment</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>The distinction is timing: an immediate annuity begins paying benefits right away, while a deferred annuity delays payments until a later date.</p>
</div>
<div class="lesson-quiz-item" data-correct="b">
<p class="lesson-quiz-question">An annuitant would like to determine the amount of an annuity distribution that is exempt from taxation. What is used to calculate this?</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) Mortality rate</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) Exclusion ratio</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) Morbidity rate</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) Debt-to-Equity ratio</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>The exclusion ratio determines what portion of each annuity payment is a tax-free return of principal versus taxable interest or earnings.</p>
</div>', 18
where not exists (select 1 from public.lessons where module_id = 'dcc403da-41ac-4b2d-988a-ccce1d0a0dab' and title = 'Progress Check: Annuities');

-- Verify: final lesson order (progress checks interleaved between
-- every pair of lessons).
select m.title as module_title, l.module_id, l.position, l.title, l.type, l.duration
from public.lessons l join public.modules m on m.id = l.module_id
where m.title = 'Life Insurance'
order by l.module_id, l.position;
