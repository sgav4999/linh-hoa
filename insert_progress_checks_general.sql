-- Inserts a "Progress Check" quiz lesson right after every lesson in
-- General Insurance Principles, built from the existing practice-exam question bank,
-- matched to that lesson's topic. Run as one transaction, "without RLS" mode.

-- lessons.type didn't allow 'quiz' yet (only 'text'/'video' originally) --
-- safe to run even if another one of these three files already did this.
alter table public.lessons drop constraint if exists lessons_type_check;
alter table public.lessons add constraint lessons_type_check check (type in ('text', 'video', 'quiz'));

update public.lessons set position = position + 1000 where module_id = '1bde012a-90f6-43c8-a2ac-0d42e8da2638';
update public.lessons set position = 1 where module_id = '1bde012a-90f6-43c8-a2ac-0d42e8da2638' and title = 'Risk and Risk Management';
insert into public.lessons (id, module_id, title, description, duration, type, content, position)
select gen_random_uuid(), '1bde012a-90f6-43c8-a2ac-0d42e8da2638', 'Progress Check: Risk and Risk Management', '23 practice questions covering Risk and Risk Management.', '23 min', 'quiz', '<div class="lesson-quiz-item" data-correct="d">
<p class="lesson-quiz-question">Which of the following is NOT considered a definition of risk?</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) Exposure to danger</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) Uncertainty</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) The potential for loss</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) The cause of a loss</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>The cause of a loss is called a "peril," not risk. Risk is the uncertainty or chance of loss itself; peril is what actually causes it.</p>
</div>
<div class="lesson-quiz-item" data-correct="b">
<p class="lesson-quiz-question">Risk can be defined as all of the following EXCEPT</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) uncertainty</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) the cause of loss</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) the chance of loss</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) the probability of an unexpected outcome</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>The cause of a loss is called a "peril," not risk; risk is the uncertainty, chance, or probability of loss itself.</p>
</div>
<div class="lesson-quiz-item" data-correct="a">
<p class="lesson-quiz-question">A situation in which there is ONLY a chance of loss or no loss is a</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) pure risk</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) speculative risk</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) particular risk</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) fundamental risk</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>Pure risk involves only the possibility of loss or no loss, with no chance of gain, making it the type of risk that is typically insurable.</p>
</div>
<div class="lesson-quiz-item" data-correct="a">
<p class="lesson-quiz-question">Which of the following statements regarding risk is TRUE?</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) only pure risks are insurable</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) only speculative risks are insurable</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) both pure and speculative risks are insurable</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) neither pure nor speculative risks are insurable</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>Only pure risks (chance of loss only, no chance of gain) are insurable; speculative risks, which carry a chance of profit, are not.</p>
</div>
<div class="lesson-quiz-item" data-correct="a">
<p class="lesson-quiz-question">all of the occurrences listed below are examples of an insurable event as defined by the CA insurance code, except:</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) An insured suffers a financial loss in the state lottery</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) A guest is injured by a fall from the insured''s driveway</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) An insured is sued for unintentional slander of another person</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) An insured is admitted to the hospital for delivery of a newborn</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>A financial loss from state lottery play is a speculative gambling loss, not a recognized insurable event under the California Insurance Code, unlike liability, injury, or medical-need events.</p>
</div>
<div class="lesson-quiz-item" data-correct="c">
<p class="lesson-quiz-question">A situation in which there is a possibility of loss or a gain is a</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) pure risk</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) particular risk</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) speculative risk</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) fundamental risk</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>Speculative risk involves the chance of either a loss or a gain, such as gambling or investing, and is generally not insurable.</p>
</div>
<div class="lesson-quiz-item" data-correct="c">
<p class="lesson-quiz-question">Gambling is a type of</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) Pure risk</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) State lottery</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) Speculative risk</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) Small risk</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>Gambling creates a brand-new risk of loss purely for the chance of gain, which is the definition of speculative risk — unlike pure risk, which offers only the chance of loss with no upside.</p>
</div>
<div class="lesson-quiz-item" data-correct="c">
<p class="lesson-quiz-question">Insurance represents the process of risk</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) Selection</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) avoidance</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) transference</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) assumption</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>Insurance is the mechanism by which the financial risk of loss is transferred from the individual to the insurer in exchange for a premium — this is risk transference, not avoidance or retention.</p>
</div>
<div class="lesson-quiz-item" data-correct="c">
<p class="lesson-quiz-question">An individual who removes the risk of losing money in the stock market by never purchasing stocks is said to be engaging in</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) Risk reduction</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) Risk transference</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) Risk avoidance</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) Risk retention</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>Never buying stocks entirely eliminates that particular risk rather than reducing, transferring, or retaining it, which is the definition of risk avoidance.</p>
</div>
<div class="lesson-quiz-item" data-correct="d">
<p class="lesson-quiz-question">An example of risk sharing would be</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) Adding more security to a high-risk building</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) buying an insurance policy to cover potential liabilities</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) Choosing not to invest in the stock market</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) Doctors pooling their money to cover malpractice exposures</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>Doctors pooling their money to cover malpractice losses spreads the risk across the whole group — the basic pooling mechanism that risk sharing (and insurance itself) relies on.</p>
</div>
<div class="lesson-quiz-item" data-correct="d">
<p class="lesson-quiz-question">All of the following circumstances must be met for loss retention to be an effective risk management technique, EXCEPT: Keeping the loss to yourself</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) Loss cannot be catastrophic</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) highly predictable losses</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) Loss must be measurable</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) Probability of loss is unknown if something is unknown, I do not want to keep</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>Retention only works when a loss is predictable and measurable. If the probability of loss is unknown, it''s too uncertain to safely retain.</p>
</div>
<div class="lesson-quiz-item" data-correct="b">
<p class="lesson-quiz-question">All of the following are benefits of insurance EXCEPT it</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) provides payment for the costs of covered losses</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) eliminates fraudulent losses</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) reduces the uncertainty created by many loss exposures</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) provides a source of investment funds</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>Insurance reduces uncertainty and provides funds to cover losses and for investment, but it does not eliminate fraudulent claims; if anything, insurance can create opportunities for fraud.</p>
</div>
<div class="lesson-quiz-item" data-correct="b">
<p class="lesson-quiz-question">Which of the following would NOT be accomplished with the purchase of an insurance policy?</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) Greater peace of mind</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) Risk is eliminated</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) Payments made for covered losses</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) Uncertainty is reduced</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>Insurance transfers and reduces the financial impact of risk and eases uncertainty, but it does not eliminate the underlying risk itself.</p>
</div>
<div class="lesson-quiz-item" data-correct="b">
<p class="lesson-quiz-question">Which of the following is a hazard? Example: Obese, Smoking Reckless Dishonest</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) peril</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) a condition that may increase the likelihood of a loss occurring</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) a speculative risk</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) a large number of similar exposure units</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>A hazard is a condition that increases the likelihood a loss will occur — as opposed to a peril (the cause of a loss) or risk (the uncertainty itself).</p>
</div>
<div class="lesson-quiz-item" data-correct="a">
<p class="lesson-quiz-question">A situation increase a chance of Loss</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) – Hazard</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) peril</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) risk</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) loss exposure</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>A hazard is a condition that increases the likelihood or severity of a loss; it is distinct from a peril (the actual cause of loss) or risk (the uncertainty itself).</p>
</div>
<div class="lesson-quiz-item" data-correct="c">
<p class="lesson-quiz-question">The increase in the probability of a loss resulting from an insured''s dishonest tendencies us known as</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) physical hazard</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) morale hazard</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) moral hazard</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) legal hazard</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>Moral hazard is the increased chance of loss arising from an insured''s dishonesty or desire to profit from a loss, such as staging or exaggerating a claim.</p>
</div>
<div class="lesson-quiz-item" data-correct="c">
<p class="lesson-quiz-question">A hazard is defined as something that increases the risk. Which of the following is considered to be a morale hazard?</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) Engaging in illegal activities</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) Smoking</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) Driving recklessly</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) Sky diving</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>A morale hazard is carelessness or indifference to a loss because a person is insured; reckless driving reflects that careless attitude rather than dishonesty (moral hazard) or a physical condition.</p>
</div>
<div class="lesson-quiz-item" data-correct="c">
<p class="lesson-quiz-question">The cause of a loss is referred to as a(n)</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) Hazard</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) adversity</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) peril</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) risk</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>The cause of a loss is called a "peril." Risk is the uncertainty of loss itself, while peril is what actually produces the loss.</p>
</div>
<div class="lesson-quiz-item" data-correct="a">
<p class="lesson-quiz-question">The more times an event is repeated, the more predictable the outcome becomes. This is an example of?</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) the law of large numbers</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) standard deviation</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) average dispersion</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) normal variance</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>The law of large numbers holds that the more exposure units (repetitions) observed, the closer actual results come to the expected/predicted outcome, which is the foundation of actuarial pricing.</p>
</div>
<div class="lesson-quiz-item" data-correct="d">
<p class="lesson-quiz-question">People with higher loss exposure have the tendency to purchase insurance more often than those at average risk. This is called bad thing happen to insurance company</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) risk retention</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) preexisting conditions</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) law of large numbers</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) adverse selection</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>Adverse selection is the tendency of people with greater-than-average loss exposure to seek out and purchase insurance more often, which underwriting exists to control.</p>
</div>
<div class="lesson-quiz-item" data-correct="b">
<p class="lesson-quiz-question">The purchase of an insurance policy may accomplish all of the following for the insured EXCEPT</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) a reduction of uncertainty</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) the elimination of the risk</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) a replacement of a large possible loss by a "smaller certain loss"</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) a reduction in worry/greater peace of mind</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>Insurance transfers financial risk and reduces uncertainty, but it does not eliminate the underlying risk of loss itself, which is why the peril can still occur.</p>
</div>
<div class="lesson-quiz-item" data-correct="c">
<p class="lesson-quiz-question">Any situation that presents the possibility of a loss known as</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) consideration</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) a covered loss</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) a loss exposure</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) a medical loss ratio</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>A loss exposure is any circumstance in which a loss is possible, whether or not a loss actually occurs.</p>
</div>
<div class="lesson-quiz-item" data-correct="c">
<p class="lesson-quiz-question">Which policy provision/rule protects the insurer against possible adverse selection?</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) nonforfeiture</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) reinstatement</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) suicide clause</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) entire contract</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>The suicide clause protects the insurer from people who buy a policy already intending to take their own life, a classic adverse-selection risk.</p>
</div>', 2
where not exists (select 1 from public.lessons where module_id = '1bde012a-90f6-43c8-a2ac-0d42e8da2638' and title = 'Progress Check: Risk and Risk Management');
update public.lessons set position = 3 where module_id = '1bde012a-90f6-43c8-a2ac-0d42e8da2638' and title = 'The Insurance Contract';
insert into public.lessons (id, module_id, title, description, duration, type, content, position)
select gen_random_uuid(), '1bde012a-90f6-43c8-a2ac-0d42e8da2638', 'Progress Check: The Insurance Contract', '18 practice questions covering The Insurance Contract.', '18 min', 'quiz', '<div class="lesson-quiz-item" data-correct="a">
<p class="lesson-quiz-question">What is the written instrument called in which the insurance contract is set forth?</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) - The policy</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) a clause</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) a provision</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) a document</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>The policy is the written document that constitutes the insurance contract.</p>
</div>
<div class="lesson-quiz-item" data-correct="a">
<p class="lesson-quiz-question">As defined in the California insurance code, ''insurance" is a</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) contract</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) gamble</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) peril</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) risk</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>The California Insurance Code defines insurance as a contract whereby one party undertakes to indemnify another against a contingent or unknown loss.</p>
</div>
<div class="lesson-quiz-item" data-correct="c">
<p class="lesson-quiz-question">All of the following statements about aleatory contracts are true Except?</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) they may be interpreted as a form of gambling</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) there are case where the insurer pays nothing</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) the insured and insurer contribute equally to the contract</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) if a loss occurs; the insured''s premium is small in relation to the amount the insurer pays</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>Aleatory means an unequal exchange of value — one side may pay far less than it receives. "Equal contribution" is the opposite of that.</p>
</div>
<div class="lesson-quiz-item" data-correct="a">
<p class="lesson-quiz-question">Which statement is CORRECT when describing a contract of adhesion?</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) Contract may be accepted or rejected by the insured</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) Contract involves negotiation between insurer and insured</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) Any confusing language in the contract would be interpreted in favor of the insurer</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) Contract cannot be modified by the insurer</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>Because the insurer writes all the terms, the insured''s only choice is to accept the policy as written or reject it — there''s no negotiation.</p>
</div>
<div class="lesson-quiz-item" data-correct="d">
<p class="lesson-quiz-question">According to the California Insurance Code, how is the word "may" interpret?</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) Irrevocable</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) Mandatory</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) Voluntary</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) Permissive/permission</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>In the California Insurance Code, "may" is permissive, meaning an action is allowed or optional rather than required.</p>
</div>
<div class="lesson-quiz-item" data-correct="d">
<p class="lesson-quiz-question">Which of the following is a requirement of a contract?</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) it must be in writing</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) there must be equal consideration between parties</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) there must be negotiation of the terms between parties</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) there must be an offer &amp; acceptance of the contract terms</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>A valid contract requires an offer by one party and acceptance by the other; the other choices (equal consideration, negotiation, or being in writing) are not universal requirements of insurance contracts.</p>
</div>
<div class="lesson-quiz-item" data-correct="c">
<p class="lesson-quiz-question">In an insurance contract, the element that shows each party is giving something of value is called</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) Offer</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) acceptance</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) consideration</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) purpose</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>Consideration is the element of value each party exchanges under the contract — the insurer''s promise to pay and the applicant''s premium and truthful application answers.</p>
</div>
<div class="lesson-quiz-item" data-correct="b">
<p class="lesson-quiz-question">Which type of clause describes the following statement: "We have issued the policy in consideration of the representations in your applications and payment of the first-term premium".</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) Premium clause</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) Consideration clause</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) Adhesion clause</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) Contestability clause</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>This clause states what the insurer received in exchange for issuing the policy — the applicant''s representations and premium — fulfilling the "consideration" element of the contract.</p>
</div>
<div class="lesson-quiz-item" data-correct="a">
<p class="lesson-quiz-question">According to the California insurance code, an insurance policy must specify all of the following EXCEPT the?</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) financial rating of the insurer</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) property or life being insured</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) risks insured against</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) Policy period</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>A policy must state the property or life insured, the risks covered, and the policy period, but it is not required to disclose the insurer''s financial rating.</p>
</div>
<div class="lesson-quiz-item" data-correct="c">
<p class="lesson-quiz-question">The required contents of a policy include all of the following EXCEPT</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) risks insured against</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) parties to the contract</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) the probability of loss</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) the period during which the insurance is to continue</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>The probability of loss is an actuarial pricing concept, not a required contract element. Required policy contents include the parties, insured risks, and the policy period.</p>
</div>
<div class="lesson-quiz-item" data-correct="c">
<p class="lesson-quiz-question">What are an applicant''s statements concerning occupation, hobbies, and personal health history regarded as?</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) warranty</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) guarantee</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) representation</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) collateral</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>Statements made on an application are representations, believed true to the best of the applicant''s knowledge, rather than warranties, which are guaranteed to be absolutely true.</p>
</div>
<div class="lesson-quiz-item" data-correct="c">
<p class="lesson-quiz-question">According to the principle of Utmost Good Faith, the insured will answer questions on the application to the best of their knowledge and pay the required premium, while the insurer will deal fairly with the insured and it''s</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) Underwriting</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) issuance of the policy</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) promises made</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) legal reserve</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>Utmost good faith obligates the insurer to deal fairly with the insured and to honor the promises made in the contract, in exchange for the insured''s honest disclosures and premium payment.</p>
</div>
<div class="lesson-quiz-item" data-correct="b">
<p class="lesson-quiz-question">Unless it is merely a statement of an expectation or belief, a representation as to the future is considered which of following?</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) liability</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) promise</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) provision</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) restriction</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>A representation about a future event or act, unless it''s just an expectation or belief, is treated as a promise and becomes a binding part of the contract.</p>
</div>
<div class="lesson-quiz-item" data-correct="c">
<p class="lesson-quiz-question">What rule is used to determine the importance of a representation?</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) the law of adhesion</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) aleatory contract</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) the materiality of concealment</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) the insurable interest standard</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>Whether a misrepresentation or concealment matters is judged by materiality — whether it would have affected the insurer''s decision to issue the policy or on what terms.</p>
</div>
<div class="lesson-quiz-item" data-correct="d">
<p class="lesson-quiz-question">Which of the following information is not required to be communicated in a life insurance contract?</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) applicant''s name</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) occupation</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) financial information</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) personal judgment</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>Matters of personal judgment or opinion are not required to be disclosed; only material facts, such as identifying, occupational, and financial information, must be communicated.</p>
</div>
<div class="lesson-quiz-item" data-correct="d">
<p class="lesson-quiz-question">When are parties to a contract required to communicate information solely based on personal judgment for a matter in question?</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) only when the policy terms require it</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) only when relevant</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) only when asked</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) never</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>Matters of personal judgment or opinion, as opposed to fact, are never required to be disclosed, since they aren''t considered material representations.</p>
</div>
<div class="lesson-quiz-item" data-correct="d">
<p class="lesson-quiz-question">When intentional concealment is involved, what course of action is the injured party entitled to?</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) Nothing</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) Reduction in premium</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) Punitive damages</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) Rescission of the contract</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>Intentional concealment of a material fact entitles the innocent party to rescind (void) the contract.</p>
</div>
<div class="lesson-quiz-item" data-correct="a">
<p class="lesson-quiz-question">The neglect/failure to communicate that which a party knows, and ought to communicate, is concealment. Concealment entitles the injured party to rescind the insurance if it is:</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) Intentional or unintentional</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) immaterial</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) Unintentional</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) intentional</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>Concealment allows the injured party to rescind the contract whether it was intentional or unintentional, since withholding material information undermines the insurer''s ability to properly assess the risk either way.</p>
</div>', 4
where not exists (select 1 from public.lessons where module_id = '1bde012a-90f6-43c8-a2ac-0d42e8da2638' and title = 'Progress Check: The Insurance Contract');
update public.lessons set position = 5 where module_id = '1bde012a-90f6-43c8-a2ac-0d42e8da2638' and title = 'Insurance Producers and Distribution';
insert into public.lessons (id, module_id, title, description, duration, type, content, position)
select gen_random_uuid(), '1bde012a-90f6-43c8-a2ac-0d42e8da2638', 'Progress Check: Insurance Producers and Distribution', '33 practice questions covering Insurance Producers and Distribution.', '33 min', 'quiz', '<div class="lesson-quiz-item" data-correct="b">
<p class="lesson-quiz-question">One important function of an insurance company is to identify and sell to potential customers. Which of these BEST describes this function? Insurance company has 4 departments</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) Actuarial</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) Marketing</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) Underwriting</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) Claim</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>The marketing department is responsible for identifying prospective customers and generating sales, as distinct from underwriting (risk selection), actuarial (pricing and statistics), and claims (paying losses).</p>
</div>
<div class="lesson-quiz-item" data-correct="c">
<p class="lesson-quiz-question">An insurer entitled to transact business by complying with the California insurance code is known as?</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) alien carrier</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) approved carrier</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) admitted carrier</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) accepted carrier</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>An admitted carrier is an insurer that has been licensed and authorized by the California Department of Insurance to transact business in the state.</p>
</div>
<div class="lesson-quiz-item" data-correct="b">
<p class="lesson-quiz-question">In California, an insurer organized under the state laws of Oregon is called a(n):</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) unauthorized</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) foreign insurer</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) alien insurer</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) domestic insurer</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>An insurer domiciled in another U.S. state is a "foreign insurer" in California; "domestic" applies only to insurers organized under California law, and "alien" describes insurers domiciled outside the U.S.</p>
</div>
<div class="lesson-quiz-item" data-correct="a">
<p class="lesson-quiz-question">A company that is chartered and organized in any country other than the United States is called a(n) _____ company.</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) Alien</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) Foreign</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) Domestic</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) Nonadmitted</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>An insurer chartered in a country other than the U.S. is an "alien" insurer; "foreign" refers to an insurer chartered in another U.S. state.</p>
</div>
<div class="lesson-quiz-item" data-correct="a">
<p class="lesson-quiz-question">Which one of the following is a domestic insurer?</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) One formed under the laws of California</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) One formed under the laws of a state or government of the United States other than Washington</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) One formed under the laws of a country other than the United States of America</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) One formed under the laws of Washington or under the laws of a state geographically bordering Washington</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>A domestic insurer is one organized under the laws of the same state where it''s doing business — California here.</p>
</div>
<div class="lesson-quiz-item" data-correct="c">
<p class="lesson-quiz-question">All of the following are characteristics of reinsurance EXCEPT it</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) increase underwriting capacity</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) stabilizes in insurer''s profits</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) increases the unearned premium reserve</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) provides protection against a catastrophic loss</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>Reinsurance increases underwriting capacity, stabilizes profits, and protects against catastrophic loss, but it reduces (not increases) the ceding insurer''s need to hold an unearned premium reserve for the risk transferred.</p>
</div>
<div class="lesson-quiz-item" data-correct="c">
<p class="lesson-quiz-question">which of the following is an insurer established by a parent company for the purpose of insuring the parent company''s loss exposure? Create a Child company called</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) Participating insurer</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) fraternal insurer</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) Captive insurer</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) mutual insurer</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>A captive insurer is a subsidiary created by a parent company solely to insure that parent''s own risks, rather than to sell insurance to the public.</p>
</div>
<div class="lesson-quiz-item" data-correct="c">
<p class="lesson-quiz-question">The direct response distribution of insurance utilizes all of the following to promote the sale of the insurance EXCEPT?</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) internet advertising</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) television commercials</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) telephone call from an agent</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) brochures mailed to prospect clients</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>Direct response marketing sells directly to consumers through mass media like internet ads, TV commercials, and mailed brochures, without using a personal agent phone call to make the sale.</p>
</div>
<div class="lesson-quiz-item" data-correct="c">
<p class="lesson-quiz-question">Which is not direct marketing?</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) Internet</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) Brochure for advertising</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) Telephone call from insurance agent</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) Mail</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>A phone call from an agent is personal solicitation, not direct marketing; direct marketing methods like internet ads, brochures, and mail reach consumers without an agent''s personal involvement.</p>
</div>
<div class="lesson-quiz-item" data-correct="a">
<p class="lesson-quiz-question">Before the Commissioner will issue a license, a person must be at least</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) 18 years old</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) 19 years old</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) 20 years old</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) 21 years old</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>California requires license applicants to be at least 18 years old.</p>
</div>
<div class="lesson-quiz-item" data-correct="a">
<p class="lesson-quiz-question">A producer who is licensed in Washington but a resident in another state is called a</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) nonresident producer</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) foreign producer</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) reciprocal producer</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) limited lines producer</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>A producer licensed in a state where they do not legally reside is called a nonresident producer.</p>
</div>
<div class="lesson-quiz-item" data-correct="b">
<p class="lesson-quiz-question">In conjunction with a Washington insurance license renewal, which one of the following is the continuing education REQUIREMENT?</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) 12 hours annually</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) 24 hours every 2 years</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) 15 hours annually</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) 26 hours every 3 years</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>Washington requires insurance producers to complete 24 hours of continuing education during each 2-year license renewal period.</p>
</div>
<div class="lesson-quiz-item" data-correct="c">
<p class="lesson-quiz-question">A licensee who is required to take continuing education MUST include how many ethics coursework hours?</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) 1</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) 2</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) 3</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) 4</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>California requires licensees completing continuing education to include a minimum of 3 hours of ethics coursework.</p>
</div>
<div class="lesson-quiz-item" data-correct="b">
<p class="lesson-quiz-question">An individual insurance producer who allows his or her license to expire may, within ___ months from the expiration date, reinstate the same license without passing a written exam.</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) 6</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) 12</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) 18</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) 24</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>California allows a producer whose license has expired to reinstate it without retaking the written exam if done within 12 months of expiration; after that window, retesting is required.</p>
</div>
<div class="lesson-quiz-item" data-correct="d">
<p class="lesson-quiz-question">A person who is not a legal resident of Washington may be licensed to act in this state without taking a written examination. What kind of license would this be?</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) Admitted</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) Foreign</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) Resident</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) Nonresident</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>A nonresident license lets a person licensed and in good standing in their home state obtain a license in another state, often without retaking the written exam, through reciprocity.</p>
</div>
<div class="lesson-quiz-item" data-correct="b">
<p class="lesson-quiz-question">A temporary producer license can be issued in any of the following circumstances EXCEPT</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) the surviving spouse of a producer</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) a prospective producer who is enrolled in an insurance pre-license class</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) designee of a producer entering active service in the armed services</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) any circumstance the Director deems to be in the public interest</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>A temporary license is meant to cover someone stepping into an existing business (e.g., a deceased/disabled producer''s survivor or a designee), not a student who has merely enrolled in a pre-license class.</p>
</div>
<div class="lesson-quiz-item" data-correct="d">
<p class="lesson-quiz-question">A temporary license is valid for a maximum of __ days</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) 30</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) 60</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) 90</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) 180</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>A temporary producer license issued in California is valid for a maximum of 180 days.</p>
</div>
<div class="lesson-quiz-item" data-correct="c">
<p class="lesson-quiz-question">a person authorized by and on behalf of an insurer who transacts life, disability or life and accident and health insurance is defined as a</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) broker</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) solicitor</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) life agent</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) life and disability analyst</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>This is the definition of a life agent, someone appointed by and representing an insurer to transact life and health business, as distinguished from a broker who represents the client.</p>
</div>
<div class="lesson-quiz-item" data-correct="d">
<p class="lesson-quiz-question">According to the California insurance code, an "insurance broker" is</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) authorized by an insurer to transact insurance</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) employed to assist an insurance agent in transacting insurance</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) hired by an insured to give advice about insurance transactions</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) compensated for transacting insurance on behalf of another person with an insured</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>A broker is someone compensated for transacting insurance on behalf of an insured (the person seeking coverage), rather than being appointed to represent the insurer as an agent is.</p>
</div>
<div class="lesson-quiz-item" data-correct="d">
<p class="lesson-quiz-question">An insurance solicitor is a person authorized to</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) sell life insurance</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) charge of a service fee</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) act a broker on behalf of an insurer</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) assists a broker or agent in selling insurance</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>A solicitor works under the supervision of a licensed agent or broker, assisting with the sale of insurance, rather than transacting business independently.</p>
</div>
<div class="lesson-quiz-item" data-correct="c">
<p class="lesson-quiz-question">When a person charges an insured a fee to review the insured''s existing life policy, what type of license does that person need?</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) a life agent</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) a personal lines agent</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) a life and disability analyst</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) a life or disability adjuster</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>A life and disability analyst license is required to review, evaluate, or advise on existing life and disability insurance policies in exchange for a fee.</p>
</div>
<div class="lesson-quiz-item" data-correct="a">
<p class="lesson-quiz-question">Under State law, the agreement between an insurance producer and insurer under which the insurance producer, for compensation, may sell, solicit, or negotiate policies issued by the insurer is defined as</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) an appointment</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) a binding agreement</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) a certificate of authority</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) a license</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>This contractual relationship is called an appointment, which authorizes the producer to represent that specific insurer.</p>
</div>
<div class="lesson-quiz-item" data-correct="c">
<p class="lesson-quiz-question">The acts that are reasonably necessary to the duties expressly authorized would be covered by an agent''s Agent is given 3 powers: 1. Written, power to represent company 2. Not written, but necessary to sale</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) stipulated authority</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) express authority</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) implied authority</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) apparent authority</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>Implied authority covers acts reasonably necessary to carry out the agent''s expressly granted duties, even though not specifically written into the agency contract.</p>
</div>
<div class="lesson-quiz-item" data-correct="c">
<p class="lesson-quiz-question">The power given to an individual producer that is not specifically addressed in his/her contract is considered what type of authority?</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) Discreet</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) apparent</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) implied</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) express</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>Implied authority covers powers not explicitly spelled out in the agency contract but reasonably assumed necessary to carry out the agent''s duties.</p>
</div>
<div class="lesson-quiz-item" data-correct="a">
<p class="lesson-quiz-question">When the principal gives the agent authority in writing, it''s referred to as</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) express authority</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) implied authority</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) apparent authority</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) imposed authority</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>Express authority is the authority specifically granted to the agent in writing (or orally) by the principal, typically spelled out in the agency agreement.</p>
</div>
<div class="lesson-quiz-item" data-correct="c">
<p class="lesson-quiz-question">Which of the following is an express power given to the agent in an agency agreement?</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) the authority to advertise</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) the authority to collect premiums</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) the authority to represents the insurer</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) the authority to bind the insurer to any risk at any time</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>Express powers are those specifically written into the agency contract, such as the authority to represent the insurer; binding the insurer to any risk at any time is not granted, and advertising/collecting premiums are typically implied or incidental powers.</p>
</div>
<div class="lesson-quiz-item" data-correct="c">
<p class="lesson-quiz-question">Although Scott has an agency contract with Able Insurance Company that spells out his duties under the contract, he also has the authority to do other things necessary to carry out his obligations to both the insured and the insurer under the doctrine of:</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) Apparent authority</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) Express authority</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) Implied authority</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) Residual authority</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>Implied authority covers actions reasonably necessary to carry out the duties expressly given in an agent''s contract, even though those actions aren''t specifically spelled out.</p>
</div>
<div class="lesson-quiz-item" data-correct="d">
<p class="lesson-quiz-question">Falsifying the terms, benefits, advantages, or conditions of an insurance policy is an example of which of the following?</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) Forgery</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) Coercion</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) Concealment</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) Misrepresentation</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>Misrepresentation is making false or misleading statements about a policy''s terms, benefits, advantages, or conditions.</p>
</div>
<div class="lesson-quiz-item" data-correct="c">
<p class="lesson-quiz-question">A producer who shares commissions with a client may be guilty of</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) Fraud</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) redlining</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) rebating</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) commingling</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>Giving a client part of a commission (or other unlawful inducement) as an incentive to buy is rebating, which is prohibited.</p>
</div>
<div class="lesson-quiz-item" data-correct="d">
<p class="lesson-quiz-question">Which of the following is NOT considered to be an act of insurance solicitation/selling?</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) An agency sending out direct mail for a promotion</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) An agent giving a rate quotation</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) Airing a television commercial recommending an insurance product</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) Publishing a magazine where one of the advertisers is an insurer</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>Simply publishing a magazine that happens to carry an insurer''s advertisement is not itself solicitation; giving a rate quote, sending promotional direct mail, and airing a commercial recommending a product all qualify as solicitation.</p>
</div>
<div class="lesson-quiz-item" data-correct="d">
<p class="lesson-quiz-question">Which is an agreement in which an insurer contracts with a third party to insure itself against losses from insurance policies it issues?</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) adhesion</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) avoidance</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) indemnity</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) reinsurance</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>This describes reinsurance — one insurer (the ceding company) transfers part of its risk to another insurer (the reinsurer) to limit its own exposure.</p>
</div>
<div class="lesson-quiz-item" data-correct="c">
<p class="lesson-quiz-question">A person who acts, offers to act, or assumes to act in a capacity where a license is required without having a valid license, is guilty of a</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) felony</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) fraud</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) misdemeanor</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) misrepresentation</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>Under the California Insurance Code, acting as an unlicensed agent/broker is a misdemeanor.</p>
</div>
<div class="lesson-quiz-item" data-correct="a">
<p class="lesson-quiz-question">Any inducement offered to the insured in the sale of insurance products that is not specified in the policy is called</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) rebating</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) twisting</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) misrepresentation</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) defamation</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>Rebating is offering something of value not stated in the policy, such as cash back or a gift, to induce a sale, and it is illegal in California.</p>
</div>', 6
where not exists (select 1 from public.lessons where module_id = '1bde012a-90f6-43c8-a2ac-0d42e8da2638' and title = 'Progress Check: Insurance Producers and Distribution');
update public.lessons set position = 7 where module_id = '1bde012a-90f6-43c8-a2ac-0d42e8da2638' and title = 'Premiums and Rating';
insert into public.lessons (id, module_id, title, description, duration, type, content, position)
select gen_random_uuid(), '1bde012a-90f6-43c8-a2ac-0d42e8da2638', 'Progress Check: Premiums and Rating', '10 practice questions covering Premiums and Rating.', '10 min', 'quiz', '<div class="lesson-quiz-item" data-correct="a">
<p class="lesson-quiz-question">What is the price of insurance for each exposure unit? : one unit of life insurance is $1,000</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) Rate</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) Premium</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) Expense</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) Rating</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>The rate is the cost charged per unit of exposure (such as per $1,000 of coverage); the premium is the rate multiplied by the number of units purchased.</p>
</div>
<div class="lesson-quiz-item" data-correct="c">
<p class="lesson-quiz-question">The statement which best describes the relationship between the premiums of a whole life policy and the premium payment period is</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) The shorter the payment period, the lower the premium</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) The longer the payment period, the higher the premium</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) The shorter the payment period, the higher the premium</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) The payment period has no effect on the premium payment</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>Paying off a policy over fewer years means each payment has to be larger to fund the same coverage, so a shorter payment period means a higher premium.</p>
</div>
<div class="lesson-quiz-item" data-correct="b">
<p class="lesson-quiz-question">Which of these would be the best example of a limited pay life insurance policy?</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) Whole life policy that pays out its cash value over a 20 year period</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) Whole life policy with premiums paid up after 20 years</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) Term life policy that returns cash value after 20 years</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) Term life policy with premiums paid up after 20 years</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>A limited pay policy provides lifetime coverage while premiums are paid only for a limited number of years, such as a whole life policy paid up after 20 years.</p>
</div>
<div class="lesson-quiz-item" data-correct="a">
<p class="lesson-quiz-question">Which premium payment mode that results in the highest overall cost?</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) Monthly (12)</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) quarterly (4)</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) semi-annually (2)</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) annually (1)</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>Because the insurer charges a small fee each time a payment is made, paying monthly (12 times a year) adds up to more total fees than paying annually.</p>
</div>
<div class="lesson-quiz-item" data-correct="d">
<p class="lesson-quiz-question">which of these is affected by the frequency of an insurance policy’s premium payments?</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) Settlement options</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) Cash value</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) Death Benefit</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) Cost</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>Paying premiums more frequently than annually (e.g., monthly) increases the overall cost, since insurers add a fee for the more frequent billing.</p>
</div>
<div class="lesson-quiz-item" data-correct="b">
<p class="lesson-quiz-question">Insurer policy expenses include all of the following EXCEPT</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) taxes</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) premiums</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) agent commissions</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) home office operations</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>Premiums are income to the insurer, not an expense; taxes, agent commissions, and home office operating costs are all expense items charged against that income.</p>
</div>
<div class="lesson-quiz-item" data-correct="c">
<p class="lesson-quiz-question">What is not used to calculate insurer’s expense?</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) Office’s expense</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) Taxes</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) Premium</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) Agent’s commission</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>Premium is the price charged to the policyholder, not a component of the insurer''s own operating expenses like office costs, taxes, and agents'' commissions.</p>
</div>
<div class="lesson-quiz-item" data-correct="b">
<p class="lesson-quiz-question">In health insurance, the result of rising morbidity rates is</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) decreased claims</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) increased premiums</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) increased profitability</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) decreased insurance rates</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>Morbidity measures the rate of sickness and disability in a population; as morbidity rates rise, insurers pay more claims and must raise premiums to stay solvent.</p>
</div>
<div class="lesson-quiz-item" data-correct="a">
<p class="lesson-quiz-question">A single premium cash value policy can be described as</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) a policy that is paid up after only one payment</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) a policy that only requires an annual payment</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) a policy that is guaranteed issue</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) a policy that covers two or more lives</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>A single premium policy is fully paid up and in force after just one lump-sum premium payment, immediately building substantial cash value.</p>
</div>
<div class="lesson-quiz-item" data-correct="d">
<p class="lesson-quiz-question">A life insurance policy that has premiums fully paid up within a stated time period is called</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) stated payment insurance</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) limited universal insurance</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) stated modified insurance</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) limited payment insurance</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>A limited payment policy requires premiums for only a limited, stated number of years, after which the policy is fully paid up while coverage continues.</p>
</div>', 8
where not exists (select 1 from public.lessons where module_id = '1bde012a-90f6-43c8-a2ac-0d42e8da2638' and title = 'Progress Check: Premiums and Rating');
update public.lessons set position = 9 where module_id = '1bde012a-90f6-43c8-a2ac-0d42e8da2638' and title = 'Underwriting';
insert into public.lessons (id, module_id, title, description, duration, type, content, position)
select gen_random_uuid(), '1bde012a-90f6-43c8-a2ac-0d42e8da2638', 'Progress Check: Underwriting', '6 practice questions covering Underwriting.', '6 min', 'quiz', '<div class="lesson-quiz-item" data-correct="a">
<p class="lesson-quiz-question">The personal credit or character of a person makes him/her ineligible for life insurance based on primarily on</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) Consumer report</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) Physician’s statement</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) M.I.B</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) Application</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>An applicant''s credit history and character are typically assessed through a consumer (credit) report obtained during underwriting.</p>
</div>
<div class="lesson-quiz-item" data-correct="b">
<p class="lesson-quiz-question">Which report of an insurance applicant''s creditworthiness and personal characteristics may influence eligibility for life and health insurance?</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) agent''s report</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) consumer report</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) attending physician''s statement</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) medical info bureau disclosure.</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>A consumer report (as governed by the Fair Credit Reporting Act) provides credit and personal-history information that insurers may use in underwriting decisions.</p>
</div>
<div class="lesson-quiz-item" data-correct="d">
<p class="lesson-quiz-question">The insurer''s department with primary responsibility for the risk selection process called</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) actuarial</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) claims</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) marketing</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) underwriting</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>Underwriting is the department responsible for evaluating and selecting the risks an insurer will accept, and on what terms.</p>
</div>
<div class="lesson-quiz-item" data-correct="b">
<p class="lesson-quiz-question">The process by which an insurer decides whether to issue requested insurance is called</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) adverse selection</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) underwriting</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) application</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) competition</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>Underwriting is the process of evaluating an application and deciding whether, and on what terms, to issue the requested insurance.</p>
</div>
<div class="lesson-quiz-item" data-correct="d">
<p class="lesson-quiz-question">Underwriters classify insurance risks as any of the following EXCEPT</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) preferred risks</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) standard risks</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) substandard risks</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) dividend risks</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>Preferred, standard, and substandard are the three real underwriting risk classes. "Dividend risk" isn''t a risk classification — dividends relate to participating policies, not underwriting.</p>
</div>
<div class="lesson-quiz-item" data-correct="d">
<p class="lesson-quiz-question">Who are members of the medical information bureau? M.I.B</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) hospital</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) physicians</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) medical bill reviewers</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) life and health insurer</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>The MIB is funded by, and made up of, life and health insurance companies, who share coded information about applicants'' medical impairments.</p>
</div>', 10
where not exists (select 1 from public.lessons where module_id = '1bde012a-90f6-43c8-a2ac-0d42e8da2638' and title = 'Progress Check: Underwriting');
update public.lessons set position = 11 where module_id = '1bde012a-90f6-43c8-a2ac-0d42e8da2638' and title = 'Insurance Regulation and Producer Conduct';
insert into public.lessons (id, module_id, title, description, duration, type, content, position)
select gen_random_uuid(), '1bde012a-90f6-43c8-a2ac-0d42e8da2638', 'Progress Check: Insurance Regulation and Producer Conduct', '31 practice questions covering Insurance Regulation and Producer Conduct.', '31 min', 'quiz', '<div class="lesson-quiz-item" data-correct="c">
<p class="lesson-quiz-question">What enables applicants to compare different life insurance policies and helps them choose which policy is best for their needs?</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) Policy summary</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) Buyer''s summary</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) Buyer''s guide</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) Policy guide</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>A buyer''s guide is a standardized consumer publication designed to help applicants compare costs and features across different life insurance policies.</p>
</div>
<div class="lesson-quiz-item" data-correct="a">
<p class="lesson-quiz-question">The life insurance buyer''s guide includes information about all of the following EXCEPT how to</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) take civil action against an insurer</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) decide how much life insurance to buy</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) compare life insurance policy rates</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) compare life insurance policy requirements</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>The buyer''s guide helps consumers decide how much insurance to buy and compare policy costs and features, but it does not cover how to pursue civil action against an insurer.</p>
</div>
<div class="lesson-quiz-item" data-correct="d">
<p class="lesson-quiz-question">What is it called when an insurer uses higher rates for an individual solely based on religion, race, or ethnic group or marital status?</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) redlining</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) categorizing</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) social injustice</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) unfair discrimination</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>Charging different rates based on race, religion, ethnicity, or marital status rather than sound actuarial factors is unfair discrimination, which is prohibited by law.</p>
</div>
<div class="lesson-quiz-item" data-correct="b">
<p class="lesson-quiz-question">An insurer would be committing Unfair Discrimination if coverage was denied based upon</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) HIV positive result</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) marital status</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) diabetes</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) a mental disorder</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>Marital status has no bearing on insurable risk, so denying coverage based on it is unfair discrimination — unlike medical conditions such as HIV, diabetes, or mental disorders, which can be legitimate underwriting factors.</p>
</div>
<div class="lesson-quiz-item" data-correct="a">
<p class="lesson-quiz-question">What is considered the purpose of the Guaranty Association?</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) Protect insureds from insolvent insurers</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) Pay premiums for insolvent insureds</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) Provide coverage for uninsured residents</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) Guarantee policy loans</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>The Guaranty Association pays covered claims, up to statutory limits, on behalf of insurers that become insolvent, protecting policyholders from loss.</p>
</div>
<div class="lesson-quiz-item" data-correct="b">
<p class="lesson-quiz-question">Funding for the California Life and Disability Guaranty Association is derived from</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) Washington Insurance Department</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) assessments on member companies</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) the Washington General Treasury</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) a special legislative appropriation</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>The California Life and Health Insurance Guarantee Association is funded through assessments levied on its member insurance companies, not through government funds.</p>
</div>
<div class="lesson-quiz-item" data-correct="c">
<p class="lesson-quiz-question">An agent has advertised that the insurer to which the agent is appointed with is a member of the Insurance Guarantee Association. This agent has committed a(n)</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) Felony</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) misdemeanor</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) unfair method of competition</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) unauthorized trade practice</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>Advertising Guarantee Association membership is prohibited because it could mislead the public into thinking membership guarantees the insurer''s financial strength.</p>
</div>
<div class="lesson-quiz-item" data-correct="b">
<p class="lesson-quiz-question">According to the California Insurance Code, what is the maximum penalty per violation for anyone who unwillfully commits an unfair method of competition?</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) $1,000</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) $5,000</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) $7,000</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) $10,000</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>For an unwillful (unintentional) unfair method of competition or unfair practice, the maximum penalty is $5,000 per violation, lower than the penalty for willful violations.</p>
</div>
<div class="lesson-quiz-item" data-correct="b">
<p class="lesson-quiz-question">It is considered an unfair method of competition for an agent to advertise that the insurer the agent is appointed with is.</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) highly rate by A.M. Best Company</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) a member of the insurance Guarantee Association</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) an admitted insurer in the state of California</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) fully authorized by certification to sell insurance</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>Advertising that an insurer belongs to the insurance Guarantee Association is prohibited because it wrongly implies the state guarantees the insurer''s solvency or backs its policies.</p>
</div>
<div class="lesson-quiz-item" data-correct="b">
<p class="lesson-quiz-question">The California Insurance Code requires that an insurer must have (1)enough assets to cover its liabilities and for reinsurance of all outstanding risks. To remain solvent, it must also possess additional assets equal to what amount? Stable/ strong/solid</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) 50% of its stock value</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) Its paid-in capital (2)</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) $10,000,000</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) Amount determined by the Insurance Guarantee Association</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>Beyond assets covering liabilities, an insurer must maintain additional surplus equal to its paid-in capital to remain solvent under California law.</p>
</div>
<div class="lesson-quiz-item" data-correct="c">
<p class="lesson-quiz-question">How often must an insurer file the national association of insurance commissioners (NAIC) financial statement?</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) monthly</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) quarterly</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) annually</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) every three year</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>Insurers are required to file their NAIC financial statement annually.</p>
</div>
<div class="lesson-quiz-item" data-correct="b">
<p class="lesson-quiz-question">The Commissioner is REQUIRED to examine admitted insurers AT LEAST every</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) 2 years</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) 4 years</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) 5 years</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) 6 years</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>California requires the Insurance Commissioner to examine admitted insurers at least every 4 years to verify solvency and compliance.</p>
</div>
<div class="lesson-quiz-item" data-correct="d">
<p class="lesson-quiz-question">Policies covered under the California life and health insurance guarantee association include all of the following EXCEPT? Not buying insurance/ Self-Insured</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) disability income</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) individual health</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) deferred annuities</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) self-funded group life</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>A self-funded group plan isn''t backed by an insurance company at all, so there''s no insurer for the Guarantee Association to stand behind — the employer bears the risk directly.</p>
</div>
<div class="lesson-quiz-item" data-correct="b">
<p class="lesson-quiz-question">According to the California insurance code, if an insurer''s certificate of authority is revoked, the commissioner can proceed with any of the following actions EXCEPT</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) taking possession of transaction records</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) using Guarantee Funds to pay salaries</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) confiscating the office premises</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) liquidating the business</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>Guaranty association funds exist to pay covered claims of an impaired or insolvent insurer''s policyholders, not to pay the company''s administrative salaries.</p>
</div>
<div class="lesson-quiz-item" data-correct="c">
<p class="lesson-quiz-question">If an insurer must have its rates accepted by the insurance department prior to using them, the insurer would be operating in which of the following types of jurisdictions?</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) file and uses</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) use and file</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) prior approval</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) state mandated</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>Under a prior approval law, an insurer must file its rates with the insurance department and receive approval before it can use them, unlike file-and-use or use-and-file states that allow rates to take effect before or shortly after filing.</p>
</div>
<div class="lesson-quiz-item" data-correct="c">
<p class="lesson-quiz-question">The Commissioner of Insurance serves a term of __ years.</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) 2</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) 3</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) 4</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) 5</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>California''s Insurance Commissioner is an elected official who serves a 4-year term.</p>
</div>
<div class="lesson-quiz-item" data-correct="c">
<p class="lesson-quiz-question">The California Insurance Code has authorized standards for names used by life insurance agents. Which of the following, if any, are automatically acceptable for Lance Manyon, a holder of the CLU designation?</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) Lance Manyon Insurer</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) Lance Manyon Best Buy Insurance Company</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) Lance Manyon Insurance Services</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) Manyon Indemnity Company</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>"Lance Manyon Insurance Services" is acceptable because it uses the agent''s actual name with a generic descriptive term. Names implying he is an insurer, a specific company, or using a different surname (like "Manyon Indemnity Company") could mislead the public into thinking he is an insurance company rather than an agent.</p>
</div>
<div class="lesson-quiz-item" data-correct="a">
<p class="lesson-quiz-question">An agent who is acting as an insurance agent, broker, solicitor, life agent, accident and health, or bail agent acts in which capacity when handling premiums or return premiums for an insured?</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) fiduciary</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) legal representative</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) managing general agent</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) natural agent</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>An agent handling premiums or return premiums holds those funds in trust for the insured or insurer, which is a fiduciary capacity requiring proper accounting and handling.</p>
</div>
<div class="lesson-quiz-item" data-correct="c">
<p class="lesson-quiz-question">How long must life agents keep their transaction records?</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) 3 years</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) 4 years</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) 5 years</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) 6 years</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>California requires life agents to retain their transaction records for 5 years.</p>
</div>
<div class="lesson-quiz-item" data-correct="d">
<p class="lesson-quiz-question">When must insurance records of insurance agents and brokers be made available to the insurance commissioner?</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) within 30 days of written request by the commissioner</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) after the policy is issued</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) annually and submitted with the proper paperwork</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) at all-time/immediately</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>Agents'' and brokers'' insurance records must be kept available for the commissioner''s examination at all times, not just when a request is scheduled or a policy is issued.</p>
</div>
<div class="lesson-quiz-item" data-correct="b">
<p class="lesson-quiz-question">What would a person be guilty of who refuses to deliver any books, records, or assets to the Commissioner once a seizure order has been executed?</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) a felony</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) a misdemeanor</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) misrepresentation</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) contempt of court</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>Refusing to turn over books, records, or assets after a seizure order is a misdemeanor under the California Insurance Code.</p>
</div>
<div class="lesson-quiz-item" data-correct="c">
<p class="lesson-quiz-question">Section 1729.2 of the California insurance code requires insurances producer application and licensees to notify the insurance Commissioner in writing, within _____ days of changes in background information after an application has been submitted or a license has been issued</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) 15</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) 20</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) 30</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) 45</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>Producers must report background changes, such as a conviction, to the Commissioner within 30 days.</p>
</div>
<div class="lesson-quiz-item" data-correct="d">
<p class="lesson-quiz-question">Failure to report background changes within 30days as required under section 1729.2 of the California insurance code could subject a licensee or applicant to</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) suspension</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) denial</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) revocation of the license</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) all of the above</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>Failing to timely report a required background change can result in any of these outcomes — suspension, denial, or revocation — depending on the severity of the violation.</p>
</div>
<div class="lesson-quiz-item" data-correct="c">
<p class="lesson-quiz-question">It is a federal offense for an insurance agent to do all of the following EXCEPT</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) falsify financial record</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) embezzle premium payments</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) misrepresent facts on an insurance application</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) willfully engage in the business of insurance with a felony conviction and without the consent of the commissioner</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>Falsifying financial records, embezzling premiums, and engaging in the business of insurance after a felony conviction without the commissioner''s consent are federal offenses under 18 U.S.C. § 1033; misrepresenting facts on an application is instead addressed as a state-level unfair practice.</p>
</div>
<div class="lesson-quiz-item" data-correct="b">
<p class="lesson-quiz-question">Making an oral or written statement that is intended to injure a person engaged in the insurance business is called</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) false advertising</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) defamation</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) rebating</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) twisting</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>A false or malicious oral or written statement made to injure someone engaged in the insurance business is defamation, distinct from twisting (misrepresenting a policy to induce replacement) or rebating.</p>
</div>
<div class="lesson-quiz-item" data-correct="b">
<p class="lesson-quiz-question">A professional liability for which producers/agent can be sued for mistakes of putting a policy into effect is called</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) fiduciary bond</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) errors and omissions</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) fiduciary trust</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) errors and oversights</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>Errors and omissions (E&amp;O) coverage protects producers against claims arising from mistakes or negligence in performing their professional duties.</p>
</div>
<div class="lesson-quiz-item" data-correct="d">
<p class="lesson-quiz-question">What is not considered unfair trade practice?</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) Making false statement on application</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) Publicly tell untruthful information about individuals who work for an insurance company</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) Report false claim about an insurance company</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) Advising a claimant to hire an attorney</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>Advising a claimant to hire an attorney is not an unfair claims practice; the other choices involve dishonesty, false statements, or defamation, which are prohibited.</p>
</div>
<div class="lesson-quiz-item" data-correct="c">
<p class="lesson-quiz-question">The California code of regulation governing claim settlement practices prohibits all of the following acts of unfair discrimination EXCEPT denial of claim based on</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) gender</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) income</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) reckless behavior</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) a physical handicap</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>Denying a claim because of reckless behavior relates to the insured''s own conduct and policy terms, not unfair discrimination. Denying claims based on gender, income, or physical handicap is prohibited unfair discrimination.</p>
</div>
<div class="lesson-quiz-item" data-correct="d">
<p class="lesson-quiz-question">The primary objectives of insurance regulation (the State monitor) include all of the following EXCEPT?</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) rate regulation</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) consumer protection</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) solvency surveillance</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) interprets policy provisions</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>Interpreting policy provisions is a matter for courts, not a primary objective of state insurance regulation. Regulators focus on rate regulation, consumer protection, and solvency surveillance.</p>
</div>
<div class="lesson-quiz-item" data-correct="a">
<p class="lesson-quiz-question">According to the California insurance code, the commissioner can disapprove/deny a licensee''s request to use a fictitious/fake name for any of the following reasons EXCEPT</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) name is the licensee''s actual name</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) use of the name would be misleading</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) name is too similar to a name already filed</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) name implies that the licensee is an underwriter</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>The commissioner denies fictitious names that are misleading, too similar to an existing name, or imply underwriter status; using one''s own actual name is not a basis for denial.</p>
</div>
<div class="lesson-quiz-item" data-correct="d">
<p class="lesson-quiz-question">Pete is a life agent who has misappropriated fiduciary funds to his own use. What is Pete guilty of?</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) Fiduciary misappropriation</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) Rebating</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) Mishandling</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) Theft</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>Misappropriating funds held in a fiduciary capacity, such as premiums, is theft (conversion), regardless of the agent''s fiduciary title.</p>
</div>', 12
where not exists (select 1 from public.lessons where module_id = '1bde012a-90f6-43c8-a2ac-0d42e8da2638' and title = 'Progress Check: Insurance Regulation and Producer Conduct');
update public.lessons set position = 13 where module_id = '1bde012a-90f6-43c8-a2ac-0d42e8da2638' and title = 'Claims and Policy Provisions';
insert into public.lessons (id, module_id, title, description, duration, type, content, position)
select gen_random_uuid(), '1bde012a-90f6-43c8-a2ac-0d42e8da2638', 'Progress Check: Claims and Policy Provisions', '7 practice questions covering Claims and Policy Provisions.', '7 min', 'quiz', '<div class="lesson-quiz-item" data-correct="a">
<p class="lesson-quiz-question">If the insured of a whole life policy suicide within the first 2 years, what will the insurer pay to the beneficiary?</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) Nothing</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) Premium is fully refunded</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) Death benefit</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) Cash Value of the policy</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>The standard suicide clause excludes the death benefit if the insured dies by suicide within the exclusion period (usually the first two years), so the claim is denied and the insurer pays nothing.</p>
</div>
<div class="lesson-quiz-item" data-correct="d">
<p class="lesson-quiz-question">The conditions, times, and circumstances under which an insured is NOT covered by a health policy are called?</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) reinstatements</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) deductibles</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) inclusions</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) exclusions</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>Exclusions are the specific conditions, circumstances, or perils a health policy does not cover.</p>
</div>
<div class="lesson-quiz-item" data-correct="b">
<p class="lesson-quiz-question">An insurer must furnish/provide to a claimant forms for filing proof of loss within ___ days upon receiving a notice of claim.</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) 10</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) 15</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) 20</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) 25</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>Once notified of a claim, the insurer has 15 days to send the claimant the forms needed to file proof of loss.</p>
</div>
<div class="lesson-quiz-item" data-correct="d">
<p class="lesson-quiz-question">Under the Payment of Claims provision, when are benefits typically payable after proof of loss is received?</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) By the end of the calendar year</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) within 60 days</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) Within 30 days</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) immediately/ promptly</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>Once proof of loss is received and the claim is validated, this provision requires the insurer to pay promptly.</p>
</div>
<div class="lesson-quiz-item" data-correct="b">
<p class="lesson-quiz-question">No legal action can be initiated within ___ after proof of loss has been submitted to the insurance company</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) 30 days</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) 60 days</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) 90 days</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) 120 days</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>This provision gives the insurer 60 days to review and process a claim before the insured can sue over it.</p>
</div>
<div class="lesson-quiz-item" data-correct="d">
<p class="lesson-quiz-question">Making an insured whole by restoring them to the same condition as before a loss is an example of</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) reinsurance</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) the retention of risk</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) fiduciary responsibility</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) the principle of indemnity</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>The principle of indemnity restores an insured to the same financial position held immediately before the loss, without allowing a profit from the claim.</p>
</div>
<div class="lesson-quiz-item" data-correct="a">
<p class="lesson-quiz-question">Insured’s are entitled to recover an amount NOT greater than the amount of their loss under the principle of?</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) adhesion</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) indemnity</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) utmost good faith</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) warranty</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>The insurance contract is a contract of adhesion — drafted entirely by the insurer, with the insured only able to accept or reject its terms as written — and one of those insurer-drafted terms is that recovery can never exceed the actual amount of the loss.</p>
</div>', 14
where not exists (select 1 from public.lessons where module_id = '1bde012a-90f6-43c8-a2ac-0d42e8da2638' and title = 'Progress Check: Claims and Policy Provisions');

update public.lessons set position = position + 1000 where module_id = '7cddc217-32f3-47c5-8e08-a81b017d1d61';
update public.lessons set position = 1 where module_id = '7cddc217-32f3-47c5-8e08-a81b017d1d61' and title = 'Risk and Risk Management';
insert into public.lessons (id, module_id, title, description, duration, type, content, position)
select gen_random_uuid(), '7cddc217-32f3-47c5-8e08-a81b017d1d61', 'Progress Check: Risk and Risk Management', '23 practice questions covering Risk and Risk Management.', '23 min', 'quiz', '<div class="lesson-quiz-item" data-correct="d">
<p class="lesson-quiz-question">Which of the following is NOT considered a definition of risk?</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) Exposure to danger</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) Uncertainty</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) The potential for loss</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) The cause of a loss</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>The cause of a loss is called a "peril," not risk. Risk is the uncertainty or chance of loss itself; peril is what actually causes it.</p>
</div>
<div class="lesson-quiz-item" data-correct="b">
<p class="lesson-quiz-question">Risk can be defined as all of the following EXCEPT</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) uncertainty</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) the cause of loss</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) the chance of loss</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) the probability of an unexpected outcome</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>The cause of a loss is called a "peril," not risk; risk is the uncertainty, chance, or probability of loss itself.</p>
</div>
<div class="lesson-quiz-item" data-correct="a">
<p class="lesson-quiz-question">A situation in which there is ONLY a chance of loss or no loss is a</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) pure risk</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) speculative risk</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) particular risk</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) fundamental risk</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>Pure risk involves only the possibility of loss or no loss, with no chance of gain, making it the type of risk that is typically insurable.</p>
</div>
<div class="lesson-quiz-item" data-correct="a">
<p class="lesson-quiz-question">Which of the following statements regarding risk is TRUE?</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) only pure risks are insurable</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) only speculative risks are insurable</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) both pure and speculative risks are insurable</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) neither pure nor speculative risks are insurable</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>Only pure risks (chance of loss only, no chance of gain) are insurable; speculative risks, which carry a chance of profit, are not.</p>
</div>
<div class="lesson-quiz-item" data-correct="a">
<p class="lesson-quiz-question">all of the occurrences listed below are examples of an insurable event as defined by the CA insurance code, except:</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) An insured suffers a financial loss in the state lottery</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) A guest is injured by a fall from the insured''s driveway</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) An insured is sued for unintentional slander of another person</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) An insured is admitted to the hospital for delivery of a newborn</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>A financial loss from state lottery play is a speculative gambling loss, not a recognized insurable event under the California Insurance Code, unlike liability, injury, or medical-need events.</p>
</div>
<div class="lesson-quiz-item" data-correct="c">
<p class="lesson-quiz-question">A situation in which there is a possibility of loss or a gain is a</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) pure risk</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) particular risk</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) speculative risk</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) fundamental risk</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>Speculative risk involves the chance of either a loss or a gain, such as gambling or investing, and is generally not insurable.</p>
</div>
<div class="lesson-quiz-item" data-correct="c">
<p class="lesson-quiz-question">Gambling is a type of</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) Pure risk</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) State lottery</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) Speculative risk</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) Small risk</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>Gambling creates a brand-new risk of loss purely for the chance of gain, which is the definition of speculative risk — unlike pure risk, which offers only the chance of loss with no upside.</p>
</div>
<div class="lesson-quiz-item" data-correct="c">
<p class="lesson-quiz-question">Insurance represents the process of risk</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) Selection</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) avoidance</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) transference</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) assumption</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>Insurance is the mechanism by which the financial risk of loss is transferred from the individual to the insurer in exchange for a premium — this is risk transference, not avoidance or retention.</p>
</div>
<div class="lesson-quiz-item" data-correct="c">
<p class="lesson-quiz-question">An individual who removes the risk of losing money in the stock market by never purchasing stocks is said to be engaging in</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) Risk reduction</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) Risk transference</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) Risk avoidance</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) Risk retention</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>Never buying stocks entirely eliminates that particular risk rather than reducing, transferring, or retaining it, which is the definition of risk avoidance.</p>
</div>
<div class="lesson-quiz-item" data-correct="d">
<p class="lesson-quiz-question">An example of risk sharing would be</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) Adding more security to a high-risk building</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) buying an insurance policy to cover potential liabilities</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) Choosing not to invest in the stock market</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) Doctors pooling their money to cover malpractice exposures</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>Doctors pooling their money to cover malpractice losses spreads the risk across the whole group — the basic pooling mechanism that risk sharing (and insurance itself) relies on.</p>
</div>
<div class="lesson-quiz-item" data-correct="d">
<p class="lesson-quiz-question">All of the following circumstances must be met for loss retention to be an effective risk management technique, EXCEPT: Keeping the loss to yourself</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) Loss cannot be catastrophic</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) highly predictable losses</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) Loss must be measurable</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) Probability of loss is unknown if something is unknown, I do not want to keep</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>Retention only works when a loss is predictable and measurable. If the probability of loss is unknown, it''s too uncertain to safely retain.</p>
</div>
<div class="lesson-quiz-item" data-correct="b">
<p class="lesson-quiz-question">All of the following are benefits of insurance EXCEPT it</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) provides payment for the costs of covered losses</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) eliminates fraudulent losses</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) reduces the uncertainty created by many loss exposures</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) provides a source of investment funds</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>Insurance reduces uncertainty and provides funds to cover losses and for investment, but it does not eliminate fraudulent claims; if anything, insurance can create opportunities for fraud.</p>
</div>
<div class="lesson-quiz-item" data-correct="b">
<p class="lesson-quiz-question">Which of the following would NOT be accomplished with the purchase of an insurance policy?</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) Greater peace of mind</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) Risk is eliminated</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) Payments made for covered losses</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) Uncertainty is reduced</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>Insurance transfers and reduces the financial impact of risk and eases uncertainty, but it does not eliminate the underlying risk itself.</p>
</div>
<div class="lesson-quiz-item" data-correct="b">
<p class="lesson-quiz-question">Which of the following is a hazard? Example: Obese, Smoking Reckless Dishonest</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) peril</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) a condition that may increase the likelihood of a loss occurring</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) a speculative risk</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) a large number of similar exposure units</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>A hazard is a condition that increases the likelihood a loss will occur — as opposed to a peril (the cause of a loss) or risk (the uncertainty itself).</p>
</div>
<div class="lesson-quiz-item" data-correct="a">
<p class="lesson-quiz-question">A situation increase a chance of Loss</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) – Hazard</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) peril</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) risk</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) loss exposure</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>A hazard is a condition that increases the likelihood or severity of a loss; it is distinct from a peril (the actual cause of loss) or risk (the uncertainty itself).</p>
</div>
<div class="lesson-quiz-item" data-correct="c">
<p class="lesson-quiz-question">The increase in the probability of a loss resulting from an insured''s dishonest tendencies us known as</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) physical hazard</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) morale hazard</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) moral hazard</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) legal hazard</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>Moral hazard is the increased chance of loss arising from an insured''s dishonesty or desire to profit from a loss, such as staging or exaggerating a claim.</p>
</div>
<div class="lesson-quiz-item" data-correct="c">
<p class="lesson-quiz-question">A hazard is defined as something that increases the risk. Which of the following is considered to be a morale hazard?</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) Engaging in illegal activities</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) Smoking</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) Driving recklessly</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) Sky diving</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>A morale hazard is carelessness or indifference to a loss because a person is insured; reckless driving reflects that careless attitude rather than dishonesty (moral hazard) or a physical condition.</p>
</div>
<div class="lesson-quiz-item" data-correct="c">
<p class="lesson-quiz-question">The cause of a loss is referred to as a(n)</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) Hazard</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) adversity</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) peril</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) risk</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>The cause of a loss is called a "peril." Risk is the uncertainty of loss itself, while peril is what actually produces the loss.</p>
</div>
<div class="lesson-quiz-item" data-correct="a">
<p class="lesson-quiz-question">The more times an event is repeated, the more predictable the outcome becomes. This is an example of?</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) the law of large numbers</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) standard deviation</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) average dispersion</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) normal variance</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>The law of large numbers holds that the more exposure units (repetitions) observed, the closer actual results come to the expected/predicted outcome, which is the foundation of actuarial pricing.</p>
</div>
<div class="lesson-quiz-item" data-correct="d">
<p class="lesson-quiz-question">People with higher loss exposure have the tendency to purchase insurance more often than those at average risk. This is called bad thing happen to insurance company</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) risk retention</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) preexisting conditions</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) law of large numbers</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) adverse selection</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>Adverse selection is the tendency of people with greater-than-average loss exposure to seek out and purchase insurance more often, which underwriting exists to control.</p>
</div>
<div class="lesson-quiz-item" data-correct="b">
<p class="lesson-quiz-question">The purchase of an insurance policy may accomplish all of the following for the insured EXCEPT</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) a reduction of uncertainty</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) the elimination of the risk</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) a replacement of a large possible loss by a "smaller certain loss"</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) a reduction in worry/greater peace of mind</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>Insurance transfers financial risk and reduces uncertainty, but it does not eliminate the underlying risk of loss itself, which is why the peril can still occur.</p>
</div>
<div class="lesson-quiz-item" data-correct="c">
<p class="lesson-quiz-question">Any situation that presents the possibility of a loss known as</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) consideration</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) a covered loss</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) a loss exposure</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) a medical loss ratio</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>A loss exposure is any circumstance in which a loss is possible, whether or not a loss actually occurs.</p>
</div>
<div class="lesson-quiz-item" data-correct="c">
<p class="lesson-quiz-question">Which policy provision/rule protects the insurer against possible adverse selection?</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) nonforfeiture</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) reinstatement</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) suicide clause</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) entire contract</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>The suicide clause protects the insurer from people who buy a policy already intending to take their own life, a classic adverse-selection risk.</p>
</div>', 2
where not exists (select 1 from public.lessons where module_id = '7cddc217-32f3-47c5-8e08-a81b017d1d61' and title = 'Progress Check: Risk and Risk Management');
update public.lessons set position = 3 where module_id = '7cddc217-32f3-47c5-8e08-a81b017d1d61' and title = 'The Insurance Contract';
insert into public.lessons (id, module_id, title, description, duration, type, content, position)
select gen_random_uuid(), '7cddc217-32f3-47c5-8e08-a81b017d1d61', 'Progress Check: The Insurance Contract', '18 practice questions covering The Insurance Contract.', '18 min', 'quiz', '<div class="lesson-quiz-item" data-correct="a">
<p class="lesson-quiz-question">What is the written instrument called in which the insurance contract is set forth?</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) - The policy</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) a clause</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) a provision</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) a document</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>The policy is the written document that constitutes the insurance contract.</p>
</div>
<div class="lesson-quiz-item" data-correct="a">
<p class="lesson-quiz-question">As defined in the California insurance code, ''insurance" is a</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) contract</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) gamble</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) peril</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) risk</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>The California Insurance Code defines insurance as a contract whereby one party undertakes to indemnify another against a contingent or unknown loss.</p>
</div>
<div class="lesson-quiz-item" data-correct="c">
<p class="lesson-quiz-question">All of the following statements about aleatory contracts are true Except?</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) they may be interpreted as a form of gambling</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) there are case where the insurer pays nothing</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) the insured and insurer contribute equally to the contract</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) if a loss occurs; the insured''s premium is small in relation to the amount the insurer pays</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>Aleatory means an unequal exchange of value — one side may pay far less than it receives. "Equal contribution" is the opposite of that.</p>
</div>
<div class="lesson-quiz-item" data-correct="a">
<p class="lesson-quiz-question">Which statement is CORRECT when describing a contract of adhesion?</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) Contract may be accepted or rejected by the insured</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) Contract involves negotiation between insurer and insured</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) Any confusing language in the contract would be interpreted in favor of the insurer</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) Contract cannot be modified by the insurer</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>Because the insurer writes all the terms, the insured''s only choice is to accept the policy as written or reject it — there''s no negotiation.</p>
</div>
<div class="lesson-quiz-item" data-correct="d">
<p class="lesson-quiz-question">According to the California Insurance Code, how is the word "may" interpret?</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) Irrevocable</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) Mandatory</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) Voluntary</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) Permissive/permission</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>In the California Insurance Code, "may" is permissive, meaning an action is allowed or optional rather than required.</p>
</div>
<div class="lesson-quiz-item" data-correct="d">
<p class="lesson-quiz-question">Which of the following is a requirement of a contract?</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) it must be in writing</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) there must be equal consideration between parties</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) there must be negotiation of the terms between parties</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) there must be an offer &amp; acceptance of the contract terms</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>A valid contract requires an offer by one party and acceptance by the other; the other choices (equal consideration, negotiation, or being in writing) are not universal requirements of insurance contracts.</p>
</div>
<div class="lesson-quiz-item" data-correct="c">
<p class="lesson-quiz-question">In an insurance contract, the element that shows each party is giving something of value is called</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) Offer</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) acceptance</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) consideration</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) purpose</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>Consideration is the element of value each party exchanges under the contract — the insurer''s promise to pay and the applicant''s premium and truthful application answers.</p>
</div>
<div class="lesson-quiz-item" data-correct="b">
<p class="lesson-quiz-question">Which type of clause describes the following statement: "We have issued the policy in consideration of the representations in your applications and payment of the first-term premium".</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) Premium clause</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) Consideration clause</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) Adhesion clause</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) Contestability clause</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>This clause states what the insurer received in exchange for issuing the policy — the applicant''s representations and premium — fulfilling the "consideration" element of the contract.</p>
</div>
<div class="lesson-quiz-item" data-correct="a">
<p class="lesson-quiz-question">According to the California insurance code, an insurance policy must specify all of the following EXCEPT the?</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) financial rating of the insurer</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) property or life being insured</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) risks insured against</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) Policy period</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>A policy must state the property or life insured, the risks covered, and the policy period, but it is not required to disclose the insurer''s financial rating.</p>
</div>
<div class="lesson-quiz-item" data-correct="c">
<p class="lesson-quiz-question">The required contents of a policy include all of the following EXCEPT</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) risks insured against</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) parties to the contract</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) the probability of loss</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) the period during which the insurance is to continue</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>The probability of loss is an actuarial pricing concept, not a required contract element. Required policy contents include the parties, insured risks, and the policy period.</p>
</div>
<div class="lesson-quiz-item" data-correct="c">
<p class="lesson-quiz-question">What are an applicant''s statements concerning occupation, hobbies, and personal health history regarded as?</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) warranty</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) guarantee</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) representation</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) collateral</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>Statements made on an application are representations, believed true to the best of the applicant''s knowledge, rather than warranties, which are guaranteed to be absolutely true.</p>
</div>
<div class="lesson-quiz-item" data-correct="c">
<p class="lesson-quiz-question">According to the principle of Utmost Good Faith, the insured will answer questions on the application to the best of their knowledge and pay the required premium, while the insurer will deal fairly with the insured and it''s</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) Underwriting</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) issuance of the policy</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) promises made</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) legal reserve</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>Utmost good faith obligates the insurer to deal fairly with the insured and to honor the promises made in the contract, in exchange for the insured''s honest disclosures and premium payment.</p>
</div>
<div class="lesson-quiz-item" data-correct="b">
<p class="lesson-quiz-question">Unless it is merely a statement of an expectation or belief, a representation as to the future is considered which of following?</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) liability</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) promise</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) provision</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) restriction</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>A representation about a future event or act, unless it''s just an expectation or belief, is treated as a promise and becomes a binding part of the contract.</p>
</div>
<div class="lesson-quiz-item" data-correct="c">
<p class="lesson-quiz-question">What rule is used to determine the importance of a representation?</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) the law of adhesion</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) aleatory contract</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) the materiality of concealment</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) the insurable interest standard</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>Whether a misrepresentation or concealment matters is judged by materiality — whether it would have affected the insurer''s decision to issue the policy or on what terms.</p>
</div>
<div class="lesson-quiz-item" data-correct="d">
<p class="lesson-quiz-question">Which of the following information is not required to be communicated in a life insurance contract?</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) applicant''s name</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) occupation</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) financial information</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) personal judgment</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>Matters of personal judgment or opinion are not required to be disclosed; only material facts, such as identifying, occupational, and financial information, must be communicated.</p>
</div>
<div class="lesson-quiz-item" data-correct="d">
<p class="lesson-quiz-question">When are parties to a contract required to communicate information solely based on personal judgment for a matter in question?</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) only when the policy terms require it</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) only when relevant</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) only when asked</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) never</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>Matters of personal judgment or opinion, as opposed to fact, are never required to be disclosed, since they aren''t considered material representations.</p>
</div>
<div class="lesson-quiz-item" data-correct="d">
<p class="lesson-quiz-question">When intentional concealment is involved, what course of action is the injured party entitled to?</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) Nothing</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) Reduction in premium</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) Punitive damages</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) Rescission of the contract</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>Intentional concealment of a material fact entitles the innocent party to rescind (void) the contract.</p>
</div>
<div class="lesson-quiz-item" data-correct="a">
<p class="lesson-quiz-question">The neglect/failure to communicate that which a party knows, and ought to communicate, is concealment. Concealment entitles the injured party to rescind the insurance if it is:</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) Intentional or unintentional</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) immaterial</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) Unintentional</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) intentional</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>Concealment allows the injured party to rescind the contract whether it was intentional or unintentional, since withholding material information undermines the insurer''s ability to properly assess the risk either way.</p>
</div>', 4
where not exists (select 1 from public.lessons where module_id = '7cddc217-32f3-47c5-8e08-a81b017d1d61' and title = 'Progress Check: The Insurance Contract');
update public.lessons set position = 5 where module_id = '7cddc217-32f3-47c5-8e08-a81b017d1d61' and title = 'Insurance Producers and Distribution';
insert into public.lessons (id, module_id, title, description, duration, type, content, position)
select gen_random_uuid(), '7cddc217-32f3-47c5-8e08-a81b017d1d61', 'Progress Check: Insurance Producers and Distribution', '33 practice questions covering Insurance Producers and Distribution.', '33 min', 'quiz', '<div class="lesson-quiz-item" data-correct="b">
<p class="lesson-quiz-question">One important function of an insurance company is to identify and sell to potential customers. Which of these BEST describes this function? Insurance company has 4 departments</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) Actuarial</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) Marketing</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) Underwriting</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) Claim</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>The marketing department is responsible for identifying prospective customers and generating sales, as distinct from underwriting (risk selection), actuarial (pricing and statistics), and claims (paying losses).</p>
</div>
<div class="lesson-quiz-item" data-correct="c">
<p class="lesson-quiz-question">An insurer entitled to transact business by complying with the California insurance code is known as?</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) alien carrier</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) approved carrier</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) admitted carrier</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) accepted carrier</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>An admitted carrier is an insurer that has been licensed and authorized by the California Department of Insurance to transact business in the state.</p>
</div>
<div class="lesson-quiz-item" data-correct="b">
<p class="lesson-quiz-question">In California, an insurer organized under the state laws of Oregon is called a(n):</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) unauthorized</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) foreign insurer</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) alien insurer</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) domestic insurer</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>An insurer domiciled in another U.S. state is a "foreign insurer" in California; "domestic" applies only to insurers organized under California law, and "alien" describes insurers domiciled outside the U.S.</p>
</div>
<div class="lesson-quiz-item" data-correct="a">
<p class="lesson-quiz-question">A company that is chartered and organized in any country other than the United States is called a(n) _____ company.</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) Alien</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) Foreign</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) Domestic</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) Nonadmitted</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>An insurer chartered in a country other than the U.S. is an "alien" insurer; "foreign" refers to an insurer chartered in another U.S. state.</p>
</div>
<div class="lesson-quiz-item" data-correct="a">
<p class="lesson-quiz-question">Which one of the following is a domestic insurer?</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) One formed under the laws of California</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) One formed under the laws of a state or government of the United States other than Washington</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) One formed under the laws of a country other than the United States of America</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) One formed under the laws of Washington or under the laws of a state geographically bordering Washington</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>A domestic insurer is one organized under the laws of the same state where it''s doing business — California here.</p>
</div>
<div class="lesson-quiz-item" data-correct="c">
<p class="lesson-quiz-question">All of the following are characteristics of reinsurance EXCEPT it</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) increase underwriting capacity</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) stabilizes in insurer''s profits</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) increases the unearned premium reserve</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) provides protection against a catastrophic loss</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>Reinsurance increases underwriting capacity, stabilizes profits, and protects against catastrophic loss, but it reduces (not increases) the ceding insurer''s need to hold an unearned premium reserve for the risk transferred.</p>
</div>
<div class="lesson-quiz-item" data-correct="c">
<p class="lesson-quiz-question">which of the following is an insurer established by a parent company for the purpose of insuring the parent company''s loss exposure? Create a Child company called</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) Participating insurer</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) fraternal insurer</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) Captive insurer</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) mutual insurer</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>A captive insurer is a subsidiary created by a parent company solely to insure that parent''s own risks, rather than to sell insurance to the public.</p>
</div>
<div class="lesson-quiz-item" data-correct="c">
<p class="lesson-quiz-question">The direct response distribution of insurance utilizes all of the following to promote the sale of the insurance EXCEPT?</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) internet advertising</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) television commercials</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) telephone call from an agent</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) brochures mailed to prospect clients</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>Direct response marketing sells directly to consumers through mass media like internet ads, TV commercials, and mailed brochures, without using a personal agent phone call to make the sale.</p>
</div>
<div class="lesson-quiz-item" data-correct="c">
<p class="lesson-quiz-question">Which is not direct marketing?</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) Internet</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) Brochure for advertising</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) Telephone call from insurance agent</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) Mail</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>A phone call from an agent is personal solicitation, not direct marketing; direct marketing methods like internet ads, brochures, and mail reach consumers without an agent''s personal involvement.</p>
</div>
<div class="lesson-quiz-item" data-correct="a">
<p class="lesson-quiz-question">Before the Commissioner will issue a license, a person must be at least</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) 18 years old</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) 19 years old</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) 20 years old</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) 21 years old</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>California requires license applicants to be at least 18 years old.</p>
</div>
<div class="lesson-quiz-item" data-correct="a">
<p class="lesson-quiz-question">A producer who is licensed in Washington but a resident in another state is called a</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) nonresident producer</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) foreign producer</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) reciprocal producer</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) limited lines producer</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>A producer licensed in a state where they do not legally reside is called a nonresident producer.</p>
</div>
<div class="lesson-quiz-item" data-correct="b">
<p class="lesson-quiz-question">In conjunction with a Washington insurance license renewal, which one of the following is the continuing education REQUIREMENT?</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) 12 hours annually</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) 24 hours every 2 years</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) 15 hours annually</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) 26 hours every 3 years</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>Washington requires insurance producers to complete 24 hours of continuing education during each 2-year license renewal period.</p>
</div>
<div class="lesson-quiz-item" data-correct="c">
<p class="lesson-quiz-question">A licensee who is required to take continuing education MUST include how many ethics coursework hours?</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) 1</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) 2</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) 3</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) 4</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>California requires licensees completing continuing education to include a minimum of 3 hours of ethics coursework.</p>
</div>
<div class="lesson-quiz-item" data-correct="b">
<p class="lesson-quiz-question">An individual insurance producer who allows his or her license to expire may, within ___ months from the expiration date, reinstate the same license without passing a written exam.</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) 6</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) 12</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) 18</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) 24</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>California allows a producer whose license has expired to reinstate it without retaking the written exam if done within 12 months of expiration; after that window, retesting is required.</p>
</div>
<div class="lesson-quiz-item" data-correct="d">
<p class="lesson-quiz-question">A person who is not a legal resident of Washington may be licensed to act in this state without taking a written examination. What kind of license would this be?</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) Admitted</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) Foreign</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) Resident</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) Nonresident</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>A nonresident license lets a person licensed and in good standing in their home state obtain a license in another state, often without retaking the written exam, through reciprocity.</p>
</div>
<div class="lesson-quiz-item" data-correct="b">
<p class="lesson-quiz-question">A temporary producer license can be issued in any of the following circumstances EXCEPT</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) the surviving spouse of a producer</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) a prospective producer who is enrolled in an insurance pre-license class</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) designee of a producer entering active service in the armed services</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) any circumstance the Director deems to be in the public interest</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>A temporary license is meant to cover someone stepping into an existing business (e.g., a deceased/disabled producer''s survivor or a designee), not a student who has merely enrolled in a pre-license class.</p>
</div>
<div class="lesson-quiz-item" data-correct="d">
<p class="lesson-quiz-question">A temporary license is valid for a maximum of __ days</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) 30</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) 60</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) 90</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) 180</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>A temporary producer license issued in California is valid for a maximum of 180 days.</p>
</div>
<div class="lesson-quiz-item" data-correct="c">
<p class="lesson-quiz-question">a person authorized by and on behalf of an insurer who transacts life, disability or life and accident and health insurance is defined as a</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) broker</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) solicitor</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) life agent</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) life and disability analyst</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>This is the definition of a life agent, someone appointed by and representing an insurer to transact life and health business, as distinguished from a broker who represents the client.</p>
</div>
<div class="lesson-quiz-item" data-correct="d">
<p class="lesson-quiz-question">According to the California insurance code, an "insurance broker" is</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) authorized by an insurer to transact insurance</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) employed to assist an insurance agent in transacting insurance</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) hired by an insured to give advice about insurance transactions</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) compensated for transacting insurance on behalf of another person with an insured</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>A broker is someone compensated for transacting insurance on behalf of an insured (the person seeking coverage), rather than being appointed to represent the insurer as an agent is.</p>
</div>
<div class="lesson-quiz-item" data-correct="d">
<p class="lesson-quiz-question">An insurance solicitor is a person authorized to</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) sell life insurance</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) charge of a service fee</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) act a broker on behalf of an insurer</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) assists a broker or agent in selling insurance</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>A solicitor works under the supervision of a licensed agent or broker, assisting with the sale of insurance, rather than transacting business independently.</p>
</div>
<div class="lesson-quiz-item" data-correct="c">
<p class="lesson-quiz-question">When a person charges an insured a fee to review the insured''s existing life policy, what type of license does that person need?</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) a life agent</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) a personal lines agent</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) a life and disability analyst</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) a life or disability adjuster</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>A life and disability analyst license is required to review, evaluate, or advise on existing life and disability insurance policies in exchange for a fee.</p>
</div>
<div class="lesson-quiz-item" data-correct="a">
<p class="lesson-quiz-question">Under State law, the agreement between an insurance producer and insurer under which the insurance producer, for compensation, may sell, solicit, or negotiate policies issued by the insurer is defined as</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) an appointment</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) a binding agreement</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) a certificate of authority</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) a license</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>This contractual relationship is called an appointment, which authorizes the producer to represent that specific insurer.</p>
</div>
<div class="lesson-quiz-item" data-correct="c">
<p class="lesson-quiz-question">The acts that are reasonably necessary to the duties expressly authorized would be covered by an agent''s Agent is given 3 powers: 1. Written, power to represent company 2. Not written, but necessary to sale</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) stipulated authority</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) express authority</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) implied authority</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) apparent authority</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>Implied authority covers acts reasonably necessary to carry out the agent''s expressly granted duties, even though not specifically written into the agency contract.</p>
</div>
<div class="lesson-quiz-item" data-correct="c">
<p class="lesson-quiz-question">The power given to an individual producer that is not specifically addressed in his/her contract is considered what type of authority?</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) Discreet</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) apparent</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) implied</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) express</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>Implied authority covers powers not explicitly spelled out in the agency contract but reasonably assumed necessary to carry out the agent''s duties.</p>
</div>
<div class="lesson-quiz-item" data-correct="a">
<p class="lesson-quiz-question">When the principal gives the agent authority in writing, it''s referred to as</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) express authority</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) implied authority</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) apparent authority</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) imposed authority</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>Express authority is the authority specifically granted to the agent in writing (or orally) by the principal, typically spelled out in the agency agreement.</p>
</div>
<div class="lesson-quiz-item" data-correct="c">
<p class="lesson-quiz-question">Which of the following is an express power given to the agent in an agency agreement?</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) the authority to advertise</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) the authority to collect premiums</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) the authority to represents the insurer</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) the authority to bind the insurer to any risk at any time</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>Express powers are those specifically written into the agency contract, such as the authority to represent the insurer; binding the insurer to any risk at any time is not granted, and advertising/collecting premiums are typically implied or incidental powers.</p>
</div>
<div class="lesson-quiz-item" data-correct="c">
<p class="lesson-quiz-question">Although Scott has an agency contract with Able Insurance Company that spells out his duties under the contract, he also has the authority to do other things necessary to carry out his obligations to both the insured and the insurer under the doctrine of:</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) Apparent authority</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) Express authority</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) Implied authority</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) Residual authority</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>Implied authority covers actions reasonably necessary to carry out the duties expressly given in an agent''s contract, even though those actions aren''t specifically spelled out.</p>
</div>
<div class="lesson-quiz-item" data-correct="d">
<p class="lesson-quiz-question">Falsifying the terms, benefits, advantages, or conditions of an insurance policy is an example of which of the following?</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) Forgery</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) Coercion</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) Concealment</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) Misrepresentation</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>Misrepresentation is making false or misleading statements about a policy''s terms, benefits, advantages, or conditions.</p>
</div>
<div class="lesson-quiz-item" data-correct="c">
<p class="lesson-quiz-question">A producer who shares commissions with a client may be guilty of</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) Fraud</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) redlining</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) rebating</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) commingling</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>Giving a client part of a commission (or other unlawful inducement) as an incentive to buy is rebating, which is prohibited.</p>
</div>
<div class="lesson-quiz-item" data-correct="d">
<p class="lesson-quiz-question">Which of the following is NOT considered to be an act of insurance solicitation/selling?</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) An agency sending out direct mail for a promotion</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) An agent giving a rate quotation</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) Airing a television commercial recommending an insurance product</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) Publishing a magazine where one of the advertisers is an insurer</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>Simply publishing a magazine that happens to carry an insurer''s advertisement is not itself solicitation; giving a rate quote, sending promotional direct mail, and airing a commercial recommending a product all qualify as solicitation.</p>
</div>
<div class="lesson-quiz-item" data-correct="d">
<p class="lesson-quiz-question">Which is an agreement in which an insurer contracts with a third party to insure itself against losses from insurance policies it issues?</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) adhesion</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) avoidance</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) indemnity</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) reinsurance</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>This describes reinsurance — one insurer (the ceding company) transfers part of its risk to another insurer (the reinsurer) to limit its own exposure.</p>
</div>
<div class="lesson-quiz-item" data-correct="c">
<p class="lesson-quiz-question">A person who acts, offers to act, or assumes to act in a capacity where a license is required without having a valid license, is guilty of a</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) felony</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) fraud</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) misdemeanor</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) misrepresentation</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>Under the California Insurance Code, acting as an unlicensed agent/broker is a misdemeanor.</p>
</div>
<div class="lesson-quiz-item" data-correct="a">
<p class="lesson-quiz-question">Any inducement offered to the insured in the sale of insurance products that is not specified in the policy is called</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) rebating</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) twisting</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) misrepresentation</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) defamation</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>Rebating is offering something of value not stated in the policy, such as cash back or a gift, to induce a sale, and it is illegal in California.</p>
</div>', 6
where not exists (select 1 from public.lessons where module_id = '7cddc217-32f3-47c5-8e08-a81b017d1d61' and title = 'Progress Check: Insurance Producers and Distribution');
update public.lessons set position = 7 where module_id = '7cddc217-32f3-47c5-8e08-a81b017d1d61' and title = 'Premiums and Rating';
insert into public.lessons (id, module_id, title, description, duration, type, content, position)
select gen_random_uuid(), '7cddc217-32f3-47c5-8e08-a81b017d1d61', 'Progress Check: Premiums and Rating', '10 practice questions covering Premiums and Rating.', '10 min', 'quiz', '<div class="lesson-quiz-item" data-correct="a">
<p class="lesson-quiz-question">What is the price of insurance for each exposure unit? : one unit of life insurance is $1,000</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) Rate</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) Premium</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) Expense</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) Rating</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>The rate is the cost charged per unit of exposure (such as per $1,000 of coverage); the premium is the rate multiplied by the number of units purchased.</p>
</div>
<div class="lesson-quiz-item" data-correct="c">
<p class="lesson-quiz-question">The statement which best describes the relationship between the premiums of a whole life policy and the premium payment period is</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) The shorter the payment period, the lower the premium</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) The longer the payment period, the higher the premium</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) The shorter the payment period, the higher the premium</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) The payment period has no effect on the premium payment</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>Paying off a policy over fewer years means each payment has to be larger to fund the same coverage, so a shorter payment period means a higher premium.</p>
</div>
<div class="lesson-quiz-item" data-correct="b">
<p class="lesson-quiz-question">Which of these would be the best example of a limited pay life insurance policy?</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) Whole life policy that pays out its cash value over a 20 year period</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) Whole life policy with premiums paid up after 20 years</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) Term life policy that returns cash value after 20 years</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) Term life policy with premiums paid up after 20 years</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>A limited pay policy provides lifetime coverage while premiums are paid only for a limited number of years, such as a whole life policy paid up after 20 years.</p>
</div>
<div class="lesson-quiz-item" data-correct="a">
<p class="lesson-quiz-question">Which premium payment mode that results in the highest overall cost?</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) Monthly (12)</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) quarterly (4)</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) semi-annually (2)</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) annually (1)</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>Because the insurer charges a small fee each time a payment is made, paying monthly (12 times a year) adds up to more total fees than paying annually.</p>
</div>
<div class="lesson-quiz-item" data-correct="d">
<p class="lesson-quiz-question">which of these is affected by the frequency of an insurance policy’s premium payments?</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) Settlement options</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) Cash value</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) Death Benefit</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) Cost</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>Paying premiums more frequently than annually (e.g., monthly) increases the overall cost, since insurers add a fee for the more frequent billing.</p>
</div>
<div class="lesson-quiz-item" data-correct="b">
<p class="lesson-quiz-question">Insurer policy expenses include all of the following EXCEPT</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) taxes</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) premiums</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) agent commissions</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) home office operations</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>Premiums are income to the insurer, not an expense; taxes, agent commissions, and home office operating costs are all expense items charged against that income.</p>
</div>
<div class="lesson-quiz-item" data-correct="c">
<p class="lesson-quiz-question">What is not used to calculate insurer’s expense?</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) Office’s expense</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) Taxes</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) Premium</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) Agent’s commission</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>Premium is the price charged to the policyholder, not a component of the insurer''s own operating expenses like office costs, taxes, and agents'' commissions.</p>
</div>
<div class="lesson-quiz-item" data-correct="b">
<p class="lesson-quiz-question">In health insurance, the result of rising morbidity rates is</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) decreased claims</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) increased premiums</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) increased profitability</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) decreased insurance rates</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>Morbidity measures the rate of sickness and disability in a population; as morbidity rates rise, insurers pay more claims and must raise premiums to stay solvent.</p>
</div>
<div class="lesson-quiz-item" data-correct="a">
<p class="lesson-quiz-question">A single premium cash value policy can be described as</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) a policy that is paid up after only one payment</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) a policy that only requires an annual payment</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) a policy that is guaranteed issue</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) a policy that covers two or more lives</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>A single premium policy is fully paid up and in force after just one lump-sum premium payment, immediately building substantial cash value.</p>
</div>
<div class="lesson-quiz-item" data-correct="d">
<p class="lesson-quiz-question">A life insurance policy that has premiums fully paid up within a stated time period is called</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) stated payment insurance</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) limited universal insurance</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) stated modified insurance</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) limited payment insurance</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>A limited payment policy requires premiums for only a limited, stated number of years, after which the policy is fully paid up while coverage continues.</p>
</div>', 8
where not exists (select 1 from public.lessons where module_id = '7cddc217-32f3-47c5-8e08-a81b017d1d61' and title = 'Progress Check: Premiums and Rating');
update public.lessons set position = 9 where module_id = '7cddc217-32f3-47c5-8e08-a81b017d1d61' and title = 'Underwriting';
insert into public.lessons (id, module_id, title, description, duration, type, content, position)
select gen_random_uuid(), '7cddc217-32f3-47c5-8e08-a81b017d1d61', 'Progress Check: Underwriting', '6 practice questions covering Underwriting.', '6 min', 'quiz', '<div class="lesson-quiz-item" data-correct="a">
<p class="lesson-quiz-question">The personal credit or character of a person makes him/her ineligible for life insurance based on primarily on</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) Consumer report</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) Physician’s statement</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) M.I.B</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) Application</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>An applicant''s credit history and character are typically assessed through a consumer (credit) report obtained during underwriting.</p>
</div>
<div class="lesson-quiz-item" data-correct="b">
<p class="lesson-quiz-question">Which report of an insurance applicant''s creditworthiness and personal characteristics may influence eligibility for life and health insurance?</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) agent''s report</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) consumer report</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) attending physician''s statement</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) medical info bureau disclosure.</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>A consumer report (as governed by the Fair Credit Reporting Act) provides credit and personal-history information that insurers may use in underwriting decisions.</p>
</div>
<div class="lesson-quiz-item" data-correct="d">
<p class="lesson-quiz-question">The insurer''s department with primary responsibility for the risk selection process called</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) actuarial</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) claims</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) marketing</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) underwriting</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>Underwriting is the department responsible for evaluating and selecting the risks an insurer will accept, and on what terms.</p>
</div>
<div class="lesson-quiz-item" data-correct="b">
<p class="lesson-quiz-question">The process by which an insurer decides whether to issue requested insurance is called</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) adverse selection</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) underwriting</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) application</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) competition</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>Underwriting is the process of evaluating an application and deciding whether, and on what terms, to issue the requested insurance.</p>
</div>
<div class="lesson-quiz-item" data-correct="d">
<p class="lesson-quiz-question">Underwriters classify insurance risks as any of the following EXCEPT</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) preferred risks</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) standard risks</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) substandard risks</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) dividend risks</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>Preferred, standard, and substandard are the three real underwriting risk classes. "Dividend risk" isn''t a risk classification — dividends relate to participating policies, not underwriting.</p>
</div>
<div class="lesson-quiz-item" data-correct="d">
<p class="lesson-quiz-question">Who are members of the medical information bureau? M.I.B</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) hospital</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) physicians</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) medical bill reviewers</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) life and health insurer</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>The MIB is funded by, and made up of, life and health insurance companies, who share coded information about applicants'' medical impairments.</p>
</div>', 10
where not exists (select 1 from public.lessons where module_id = '7cddc217-32f3-47c5-8e08-a81b017d1d61' and title = 'Progress Check: Underwriting');
update public.lessons set position = 11 where module_id = '7cddc217-32f3-47c5-8e08-a81b017d1d61' and title = 'Insurance Regulation and Producer Conduct';
insert into public.lessons (id, module_id, title, description, duration, type, content, position)
select gen_random_uuid(), '7cddc217-32f3-47c5-8e08-a81b017d1d61', 'Progress Check: Insurance Regulation and Producer Conduct', '31 practice questions covering Insurance Regulation and Producer Conduct.', '31 min', 'quiz', '<div class="lesson-quiz-item" data-correct="c">
<p class="lesson-quiz-question">What enables applicants to compare different life insurance policies and helps them choose which policy is best for their needs?</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) Policy summary</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) Buyer''s summary</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) Buyer''s guide</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) Policy guide</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>A buyer''s guide is a standardized consumer publication designed to help applicants compare costs and features across different life insurance policies.</p>
</div>
<div class="lesson-quiz-item" data-correct="a">
<p class="lesson-quiz-question">The life insurance buyer''s guide includes information about all of the following EXCEPT how to</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) take civil action against an insurer</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) decide how much life insurance to buy</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) compare life insurance policy rates</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) compare life insurance policy requirements</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>The buyer''s guide helps consumers decide how much insurance to buy and compare policy costs and features, but it does not cover how to pursue civil action against an insurer.</p>
</div>
<div class="lesson-quiz-item" data-correct="d">
<p class="lesson-quiz-question">What is it called when an insurer uses higher rates for an individual solely based on religion, race, or ethnic group or marital status?</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) redlining</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) categorizing</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) social injustice</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) unfair discrimination</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>Charging different rates based on race, religion, ethnicity, or marital status rather than sound actuarial factors is unfair discrimination, which is prohibited by law.</p>
</div>
<div class="lesson-quiz-item" data-correct="b">
<p class="lesson-quiz-question">An insurer would be committing Unfair Discrimination if coverage was denied based upon</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) HIV positive result</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) marital status</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) diabetes</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) a mental disorder</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>Marital status has no bearing on insurable risk, so denying coverage based on it is unfair discrimination — unlike medical conditions such as HIV, diabetes, or mental disorders, which can be legitimate underwriting factors.</p>
</div>
<div class="lesson-quiz-item" data-correct="a">
<p class="lesson-quiz-question">What is considered the purpose of the Guaranty Association?</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) Protect insureds from insolvent insurers</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) Pay premiums for insolvent insureds</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) Provide coverage for uninsured residents</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) Guarantee policy loans</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>The Guaranty Association pays covered claims, up to statutory limits, on behalf of insurers that become insolvent, protecting policyholders from loss.</p>
</div>
<div class="lesson-quiz-item" data-correct="b">
<p class="lesson-quiz-question">Funding for the California Life and Disability Guaranty Association is derived from</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) Washington Insurance Department</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) assessments on member companies</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) the Washington General Treasury</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) a special legislative appropriation</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>The California Life and Health Insurance Guarantee Association is funded through assessments levied on its member insurance companies, not through government funds.</p>
</div>
<div class="lesson-quiz-item" data-correct="c">
<p class="lesson-quiz-question">An agent has advertised that the insurer to which the agent is appointed with is a member of the Insurance Guarantee Association. This agent has committed a(n)</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) Felony</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) misdemeanor</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) unfair method of competition</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) unauthorized trade practice</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>Advertising Guarantee Association membership is prohibited because it could mislead the public into thinking membership guarantees the insurer''s financial strength.</p>
</div>
<div class="lesson-quiz-item" data-correct="b">
<p class="lesson-quiz-question">According to the California Insurance Code, what is the maximum penalty per violation for anyone who unwillfully commits an unfair method of competition?</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) $1,000</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) $5,000</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) $7,000</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) $10,000</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>For an unwillful (unintentional) unfair method of competition or unfair practice, the maximum penalty is $5,000 per violation, lower than the penalty for willful violations.</p>
</div>
<div class="lesson-quiz-item" data-correct="b">
<p class="lesson-quiz-question">It is considered an unfair method of competition for an agent to advertise that the insurer the agent is appointed with is.</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) highly rate by A.M. Best Company</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) a member of the insurance Guarantee Association</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) an admitted insurer in the state of California</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) fully authorized by certification to sell insurance</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>Advertising that an insurer belongs to the insurance Guarantee Association is prohibited because it wrongly implies the state guarantees the insurer''s solvency or backs its policies.</p>
</div>
<div class="lesson-quiz-item" data-correct="b">
<p class="lesson-quiz-question">The California Insurance Code requires that an insurer must have (1)enough assets to cover its liabilities and for reinsurance of all outstanding risks. To remain solvent, it must also possess additional assets equal to what amount? Stable/ strong/solid</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) 50% of its stock value</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) Its paid-in capital (2)</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) $10,000,000</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) Amount determined by the Insurance Guarantee Association</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>Beyond assets covering liabilities, an insurer must maintain additional surplus equal to its paid-in capital to remain solvent under California law.</p>
</div>
<div class="lesson-quiz-item" data-correct="c">
<p class="lesson-quiz-question">How often must an insurer file the national association of insurance commissioners (NAIC) financial statement?</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) monthly</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) quarterly</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) annually</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) every three year</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>Insurers are required to file their NAIC financial statement annually.</p>
</div>
<div class="lesson-quiz-item" data-correct="b">
<p class="lesson-quiz-question">The Commissioner is REQUIRED to examine admitted insurers AT LEAST every</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) 2 years</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) 4 years</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) 5 years</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) 6 years</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>California requires the Insurance Commissioner to examine admitted insurers at least every 4 years to verify solvency and compliance.</p>
</div>
<div class="lesson-quiz-item" data-correct="d">
<p class="lesson-quiz-question">Policies covered under the California life and health insurance guarantee association include all of the following EXCEPT? Not buying insurance/ Self-Insured</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) disability income</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) individual health</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) deferred annuities</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) self-funded group life</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>A self-funded group plan isn''t backed by an insurance company at all, so there''s no insurer for the Guarantee Association to stand behind — the employer bears the risk directly.</p>
</div>
<div class="lesson-quiz-item" data-correct="b">
<p class="lesson-quiz-question">According to the California insurance code, if an insurer''s certificate of authority is revoked, the commissioner can proceed with any of the following actions EXCEPT</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) taking possession of transaction records</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) using Guarantee Funds to pay salaries</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) confiscating the office premises</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) liquidating the business</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>Guaranty association funds exist to pay covered claims of an impaired or insolvent insurer''s policyholders, not to pay the company''s administrative salaries.</p>
</div>
<div class="lesson-quiz-item" data-correct="c">
<p class="lesson-quiz-question">If an insurer must have its rates accepted by the insurance department prior to using them, the insurer would be operating in which of the following types of jurisdictions?</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) file and uses</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) use and file</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) prior approval</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) state mandated</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>Under a prior approval law, an insurer must file its rates with the insurance department and receive approval before it can use them, unlike file-and-use or use-and-file states that allow rates to take effect before or shortly after filing.</p>
</div>
<div class="lesson-quiz-item" data-correct="c">
<p class="lesson-quiz-question">The Commissioner of Insurance serves a term of __ years.</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) 2</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) 3</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) 4</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) 5</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>California''s Insurance Commissioner is an elected official who serves a 4-year term.</p>
</div>
<div class="lesson-quiz-item" data-correct="c">
<p class="lesson-quiz-question">The California Insurance Code has authorized standards for names used by life insurance agents. Which of the following, if any, are automatically acceptable for Lance Manyon, a holder of the CLU designation?</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) Lance Manyon Insurer</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) Lance Manyon Best Buy Insurance Company</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) Lance Manyon Insurance Services</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) Manyon Indemnity Company</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>"Lance Manyon Insurance Services" is acceptable because it uses the agent''s actual name with a generic descriptive term. Names implying he is an insurer, a specific company, or using a different surname (like "Manyon Indemnity Company") could mislead the public into thinking he is an insurance company rather than an agent.</p>
</div>
<div class="lesson-quiz-item" data-correct="a">
<p class="lesson-quiz-question">An agent who is acting as an insurance agent, broker, solicitor, life agent, accident and health, or bail agent acts in which capacity when handling premiums or return premiums for an insured?</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) fiduciary</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) legal representative</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) managing general agent</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) natural agent</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>An agent handling premiums or return premiums holds those funds in trust for the insured or insurer, which is a fiduciary capacity requiring proper accounting and handling.</p>
</div>
<div class="lesson-quiz-item" data-correct="c">
<p class="lesson-quiz-question">How long must life agents keep their transaction records?</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) 3 years</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) 4 years</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) 5 years</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) 6 years</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>California requires life agents to retain their transaction records for 5 years.</p>
</div>
<div class="lesson-quiz-item" data-correct="d">
<p class="lesson-quiz-question">When must insurance records of insurance agents and brokers be made available to the insurance commissioner?</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) within 30 days of written request by the commissioner</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) after the policy is issued</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) annually and submitted with the proper paperwork</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) at all-time/immediately</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>Agents'' and brokers'' insurance records must be kept available for the commissioner''s examination at all times, not just when a request is scheduled or a policy is issued.</p>
</div>
<div class="lesson-quiz-item" data-correct="b">
<p class="lesson-quiz-question">What would a person be guilty of who refuses to deliver any books, records, or assets to the Commissioner once a seizure order has been executed?</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) a felony</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) a misdemeanor</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) misrepresentation</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) contempt of court</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>Refusing to turn over books, records, or assets after a seizure order is a misdemeanor under the California Insurance Code.</p>
</div>
<div class="lesson-quiz-item" data-correct="c">
<p class="lesson-quiz-question">Section 1729.2 of the California insurance code requires insurances producer application and licensees to notify the insurance Commissioner in writing, within _____ days of changes in background information after an application has been submitted or a license has been issued</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) 15</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) 20</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) 30</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) 45</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>Producers must report background changes, such as a conviction, to the Commissioner within 30 days.</p>
</div>
<div class="lesson-quiz-item" data-correct="d">
<p class="lesson-quiz-question">Failure to report background changes within 30days as required under section 1729.2 of the California insurance code could subject a licensee or applicant to</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) suspension</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) denial</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) revocation of the license</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) all of the above</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>Failing to timely report a required background change can result in any of these outcomes — suspension, denial, or revocation — depending on the severity of the violation.</p>
</div>
<div class="lesson-quiz-item" data-correct="c">
<p class="lesson-quiz-question">It is a federal offense for an insurance agent to do all of the following EXCEPT</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) falsify financial record</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) embezzle premium payments</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) misrepresent facts on an insurance application</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) willfully engage in the business of insurance with a felony conviction and without the consent of the commissioner</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>Falsifying financial records, embezzling premiums, and engaging in the business of insurance after a felony conviction without the commissioner''s consent are federal offenses under 18 U.S.C. § 1033; misrepresenting facts on an application is instead addressed as a state-level unfair practice.</p>
</div>
<div class="lesson-quiz-item" data-correct="b">
<p class="lesson-quiz-question">Making an oral or written statement that is intended to injure a person engaged in the insurance business is called</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) false advertising</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) defamation</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) rebating</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) twisting</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>A false or malicious oral or written statement made to injure someone engaged in the insurance business is defamation, distinct from twisting (misrepresenting a policy to induce replacement) or rebating.</p>
</div>
<div class="lesson-quiz-item" data-correct="b">
<p class="lesson-quiz-question">A professional liability for which producers/agent can be sued for mistakes of putting a policy into effect is called</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) fiduciary bond</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) errors and omissions</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) fiduciary trust</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) errors and oversights</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>Errors and omissions (E&amp;O) coverage protects producers against claims arising from mistakes or negligence in performing their professional duties.</p>
</div>
<div class="lesson-quiz-item" data-correct="d">
<p class="lesson-quiz-question">What is not considered unfair trade practice?</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) Making false statement on application</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) Publicly tell untruthful information about individuals who work for an insurance company</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) Report false claim about an insurance company</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) Advising a claimant to hire an attorney</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>Advising a claimant to hire an attorney is not an unfair claims practice; the other choices involve dishonesty, false statements, or defamation, which are prohibited.</p>
</div>
<div class="lesson-quiz-item" data-correct="c">
<p class="lesson-quiz-question">The California code of regulation governing claim settlement practices prohibits all of the following acts of unfair discrimination EXCEPT denial of claim based on</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) gender</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) income</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) reckless behavior</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) a physical handicap</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>Denying a claim because of reckless behavior relates to the insured''s own conduct and policy terms, not unfair discrimination. Denying claims based on gender, income, or physical handicap is prohibited unfair discrimination.</p>
</div>
<div class="lesson-quiz-item" data-correct="d">
<p class="lesson-quiz-question">The primary objectives of insurance regulation (the State monitor) include all of the following EXCEPT?</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) rate regulation</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) consumer protection</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) solvency surveillance</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) interprets policy provisions</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>Interpreting policy provisions is a matter for courts, not a primary objective of state insurance regulation. Regulators focus on rate regulation, consumer protection, and solvency surveillance.</p>
</div>
<div class="lesson-quiz-item" data-correct="a">
<p class="lesson-quiz-question">According to the California insurance code, the commissioner can disapprove/deny a licensee''s request to use a fictitious/fake name for any of the following reasons EXCEPT</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) name is the licensee''s actual name</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) use of the name would be misleading</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) name is too similar to a name already filed</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) name implies that the licensee is an underwriter</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>The commissioner denies fictitious names that are misleading, too similar to an existing name, or imply underwriter status; using one''s own actual name is not a basis for denial.</p>
</div>
<div class="lesson-quiz-item" data-correct="d">
<p class="lesson-quiz-question">Pete is a life agent who has misappropriated fiduciary funds to his own use. What is Pete guilty of?</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) Fiduciary misappropriation</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) Rebating</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) Mishandling</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) Theft</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>Misappropriating funds held in a fiduciary capacity, such as premiums, is theft (conversion), regardless of the agent''s fiduciary title.</p>
</div>', 12
where not exists (select 1 from public.lessons where module_id = '7cddc217-32f3-47c5-8e08-a81b017d1d61' and title = 'Progress Check: Insurance Regulation and Producer Conduct');
update public.lessons set position = 13 where module_id = '7cddc217-32f3-47c5-8e08-a81b017d1d61' and title = 'Claims and Policy Provisions';
insert into public.lessons (id, module_id, title, description, duration, type, content, position)
select gen_random_uuid(), '7cddc217-32f3-47c5-8e08-a81b017d1d61', 'Progress Check: Claims and Policy Provisions', '7 practice questions covering Claims and Policy Provisions.', '7 min', 'quiz', '<div class="lesson-quiz-item" data-correct="a">
<p class="lesson-quiz-question">If the insured of a whole life policy suicide within the first 2 years, what will the insurer pay to the beneficiary?</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) Nothing</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) Premium is fully refunded</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) Death benefit</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) Cash Value of the policy</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>The standard suicide clause excludes the death benefit if the insured dies by suicide within the exclusion period (usually the first two years), so the claim is denied and the insurer pays nothing.</p>
</div>
<div class="lesson-quiz-item" data-correct="d">
<p class="lesson-quiz-question">The conditions, times, and circumstances under which an insured is NOT covered by a health policy are called?</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) reinstatements</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) deductibles</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) inclusions</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) exclusions</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>Exclusions are the specific conditions, circumstances, or perils a health policy does not cover.</p>
</div>
<div class="lesson-quiz-item" data-correct="b">
<p class="lesson-quiz-question">An insurer must furnish/provide to a claimant forms for filing proof of loss within ___ days upon receiving a notice of claim.</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) 10</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) 15</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) 20</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) 25</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>Once notified of a claim, the insurer has 15 days to send the claimant the forms needed to file proof of loss.</p>
</div>
<div class="lesson-quiz-item" data-correct="d">
<p class="lesson-quiz-question">Under the Payment of Claims provision, when are benefits typically payable after proof of loss is received?</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) By the end of the calendar year</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) within 60 days</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) Within 30 days</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) immediately/ promptly</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>Once proof of loss is received and the claim is validated, this provision requires the insurer to pay promptly.</p>
</div>
<div class="lesson-quiz-item" data-correct="b">
<p class="lesson-quiz-question">No legal action can be initiated within ___ after proof of loss has been submitted to the insurance company</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) 30 days</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) 60 days</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) 90 days</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) 120 days</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>This provision gives the insurer 60 days to review and process a claim before the insured can sue over it.</p>
</div>
<div class="lesson-quiz-item" data-correct="d">
<p class="lesson-quiz-question">Making an insured whole by restoring them to the same condition as before a loss is an example of</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) reinsurance</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) the retention of risk</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) fiduciary responsibility</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) the principle of indemnity</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>The principle of indemnity restores an insured to the same financial position held immediately before the loss, without allowing a profit from the claim.</p>
</div>
<div class="lesson-quiz-item" data-correct="a">
<p class="lesson-quiz-question">Insured’s are entitled to recover an amount NOT greater than the amount of their loss under the principle of?</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) adhesion</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) indemnity</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) utmost good faith</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) warranty</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>The insurance contract is a contract of adhesion — drafted entirely by the insurer, with the insured only able to accept or reject its terms as written — and one of those insurer-drafted terms is that recovery can never exceed the actual amount of the loss.</p>
</div>', 14
where not exists (select 1 from public.lessons where module_id = '7cddc217-32f3-47c5-8e08-a81b017d1d61' and title = 'Progress Check: Claims and Policy Provisions');

update public.lessons set position = position + 1000 where module_id = 'f6696f10-e236-4e68-b0ba-6637a2342a27';
update public.lessons set position = 1 where module_id = 'f6696f10-e236-4e68-b0ba-6637a2342a27' and title = 'Risk and Risk Management';
insert into public.lessons (id, module_id, title, description, duration, type, content, position)
select gen_random_uuid(), 'f6696f10-e236-4e68-b0ba-6637a2342a27', 'Progress Check: Risk and Risk Management', '23 practice questions covering Risk and Risk Management.', '23 min', 'quiz', '<div class="lesson-quiz-item" data-correct="d">
<p class="lesson-quiz-question">Which of the following is NOT considered a definition of risk?</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) Exposure to danger</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) Uncertainty</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) The potential for loss</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) The cause of a loss</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>The cause of a loss is called a "peril," not risk. Risk is the uncertainty or chance of loss itself; peril is what actually causes it.</p>
</div>
<div class="lesson-quiz-item" data-correct="b">
<p class="lesson-quiz-question">Risk can be defined as all of the following EXCEPT</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) uncertainty</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) the cause of loss</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) the chance of loss</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) the probability of an unexpected outcome</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>The cause of a loss is called a "peril," not risk; risk is the uncertainty, chance, or probability of loss itself.</p>
</div>
<div class="lesson-quiz-item" data-correct="a">
<p class="lesson-quiz-question">A situation in which there is ONLY a chance of loss or no loss is a</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) pure risk</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) speculative risk</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) particular risk</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) fundamental risk</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>Pure risk involves only the possibility of loss or no loss, with no chance of gain, making it the type of risk that is typically insurable.</p>
</div>
<div class="lesson-quiz-item" data-correct="a">
<p class="lesson-quiz-question">Which of the following statements regarding risk is TRUE?</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) only pure risks are insurable</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) only speculative risks are insurable</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) both pure and speculative risks are insurable</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) neither pure nor speculative risks are insurable</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>Only pure risks (chance of loss only, no chance of gain) are insurable; speculative risks, which carry a chance of profit, are not.</p>
</div>
<div class="lesson-quiz-item" data-correct="a">
<p class="lesson-quiz-question">all of the occurrences listed below are examples of an insurable event as defined by the CA insurance code, except:</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) An insured suffers a financial loss in the state lottery</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) A guest is injured by a fall from the insured''s driveway</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) An insured is sued for unintentional slander of another person</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) An insured is admitted to the hospital for delivery of a newborn</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>A financial loss from state lottery play is a speculative gambling loss, not a recognized insurable event under the California Insurance Code, unlike liability, injury, or medical-need events.</p>
</div>
<div class="lesson-quiz-item" data-correct="c">
<p class="lesson-quiz-question">A situation in which there is a possibility of loss or a gain is a</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) pure risk</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) particular risk</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) speculative risk</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) fundamental risk</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>Speculative risk involves the chance of either a loss or a gain, such as gambling or investing, and is generally not insurable.</p>
</div>
<div class="lesson-quiz-item" data-correct="c">
<p class="lesson-quiz-question">Gambling is a type of</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) Pure risk</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) State lottery</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) Speculative risk</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) Small risk</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>Gambling creates a brand-new risk of loss purely for the chance of gain, which is the definition of speculative risk — unlike pure risk, which offers only the chance of loss with no upside.</p>
</div>
<div class="lesson-quiz-item" data-correct="c">
<p class="lesson-quiz-question">Insurance represents the process of risk</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) Selection</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) avoidance</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) transference</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) assumption</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>Insurance is the mechanism by which the financial risk of loss is transferred from the individual to the insurer in exchange for a premium — this is risk transference, not avoidance or retention.</p>
</div>
<div class="lesson-quiz-item" data-correct="c">
<p class="lesson-quiz-question">An individual who removes the risk of losing money in the stock market by never purchasing stocks is said to be engaging in</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) Risk reduction</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) Risk transference</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) Risk avoidance</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) Risk retention</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>Never buying stocks entirely eliminates that particular risk rather than reducing, transferring, or retaining it, which is the definition of risk avoidance.</p>
</div>
<div class="lesson-quiz-item" data-correct="d">
<p class="lesson-quiz-question">An example of risk sharing would be</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) Adding more security to a high-risk building</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) buying an insurance policy to cover potential liabilities</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) Choosing not to invest in the stock market</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) Doctors pooling their money to cover malpractice exposures</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>Doctors pooling their money to cover malpractice losses spreads the risk across the whole group — the basic pooling mechanism that risk sharing (and insurance itself) relies on.</p>
</div>
<div class="lesson-quiz-item" data-correct="d">
<p class="lesson-quiz-question">All of the following circumstances must be met for loss retention to be an effective risk management technique, EXCEPT: Keeping the loss to yourself</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) Loss cannot be catastrophic</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) highly predictable losses</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) Loss must be measurable</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) Probability of loss is unknown if something is unknown, I do not want to keep</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>Retention only works when a loss is predictable and measurable. If the probability of loss is unknown, it''s too uncertain to safely retain.</p>
</div>
<div class="lesson-quiz-item" data-correct="b">
<p class="lesson-quiz-question">All of the following are benefits of insurance EXCEPT it</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) provides payment for the costs of covered losses</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) eliminates fraudulent losses</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) reduces the uncertainty created by many loss exposures</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) provides a source of investment funds</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>Insurance reduces uncertainty and provides funds to cover losses and for investment, but it does not eliminate fraudulent claims; if anything, insurance can create opportunities for fraud.</p>
</div>
<div class="lesson-quiz-item" data-correct="b">
<p class="lesson-quiz-question">Which of the following would NOT be accomplished with the purchase of an insurance policy?</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) Greater peace of mind</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) Risk is eliminated</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) Payments made for covered losses</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) Uncertainty is reduced</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>Insurance transfers and reduces the financial impact of risk and eases uncertainty, but it does not eliminate the underlying risk itself.</p>
</div>
<div class="lesson-quiz-item" data-correct="b">
<p class="lesson-quiz-question">Which of the following is a hazard? Example: Obese, Smoking Reckless Dishonest</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) peril</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) a condition that may increase the likelihood of a loss occurring</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) a speculative risk</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) a large number of similar exposure units</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>A hazard is a condition that increases the likelihood a loss will occur — as opposed to a peril (the cause of a loss) or risk (the uncertainty itself).</p>
</div>
<div class="lesson-quiz-item" data-correct="a">
<p class="lesson-quiz-question">A situation increase a chance of Loss</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) – Hazard</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) peril</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) risk</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) loss exposure</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>A hazard is a condition that increases the likelihood or severity of a loss; it is distinct from a peril (the actual cause of loss) or risk (the uncertainty itself).</p>
</div>
<div class="lesson-quiz-item" data-correct="c">
<p class="lesson-quiz-question">The increase in the probability of a loss resulting from an insured''s dishonest tendencies us known as</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) physical hazard</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) morale hazard</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) moral hazard</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) legal hazard</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>Moral hazard is the increased chance of loss arising from an insured''s dishonesty or desire to profit from a loss, such as staging or exaggerating a claim.</p>
</div>
<div class="lesson-quiz-item" data-correct="c">
<p class="lesson-quiz-question">A hazard is defined as something that increases the risk. Which of the following is considered to be a morale hazard?</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) Engaging in illegal activities</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) Smoking</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) Driving recklessly</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) Sky diving</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>A morale hazard is carelessness or indifference to a loss because a person is insured; reckless driving reflects that careless attitude rather than dishonesty (moral hazard) or a physical condition.</p>
</div>
<div class="lesson-quiz-item" data-correct="c">
<p class="lesson-quiz-question">The cause of a loss is referred to as a(n)</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) Hazard</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) adversity</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) peril</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) risk</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>The cause of a loss is called a "peril." Risk is the uncertainty of loss itself, while peril is what actually produces the loss.</p>
</div>
<div class="lesson-quiz-item" data-correct="a">
<p class="lesson-quiz-question">The more times an event is repeated, the more predictable the outcome becomes. This is an example of?</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) the law of large numbers</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) standard deviation</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) average dispersion</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) normal variance</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>The law of large numbers holds that the more exposure units (repetitions) observed, the closer actual results come to the expected/predicted outcome, which is the foundation of actuarial pricing.</p>
</div>
<div class="lesson-quiz-item" data-correct="d">
<p class="lesson-quiz-question">People with higher loss exposure have the tendency to purchase insurance more often than those at average risk. This is called bad thing happen to insurance company</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) risk retention</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) preexisting conditions</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) law of large numbers</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) adverse selection</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>Adverse selection is the tendency of people with greater-than-average loss exposure to seek out and purchase insurance more often, which underwriting exists to control.</p>
</div>
<div class="lesson-quiz-item" data-correct="b">
<p class="lesson-quiz-question">The purchase of an insurance policy may accomplish all of the following for the insured EXCEPT</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) a reduction of uncertainty</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) the elimination of the risk</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) a replacement of a large possible loss by a "smaller certain loss"</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) a reduction in worry/greater peace of mind</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>Insurance transfers financial risk and reduces uncertainty, but it does not eliminate the underlying risk of loss itself, which is why the peril can still occur.</p>
</div>
<div class="lesson-quiz-item" data-correct="c">
<p class="lesson-quiz-question">Any situation that presents the possibility of a loss known as</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) consideration</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) a covered loss</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) a loss exposure</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) a medical loss ratio</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>A loss exposure is any circumstance in which a loss is possible, whether or not a loss actually occurs.</p>
</div>
<div class="lesson-quiz-item" data-correct="c">
<p class="lesson-quiz-question">Which policy provision/rule protects the insurer against possible adverse selection?</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) nonforfeiture</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) reinstatement</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) suicide clause</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) entire contract</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>The suicide clause protects the insurer from people who buy a policy already intending to take their own life, a classic adverse-selection risk.</p>
</div>', 2
where not exists (select 1 from public.lessons where module_id = 'f6696f10-e236-4e68-b0ba-6637a2342a27' and title = 'Progress Check: Risk and Risk Management');
update public.lessons set position = 3 where module_id = 'f6696f10-e236-4e68-b0ba-6637a2342a27' and title = 'The Insurance Contract';
insert into public.lessons (id, module_id, title, description, duration, type, content, position)
select gen_random_uuid(), 'f6696f10-e236-4e68-b0ba-6637a2342a27', 'Progress Check: The Insurance Contract', '18 practice questions covering The Insurance Contract.', '18 min', 'quiz', '<div class="lesson-quiz-item" data-correct="a">
<p class="lesson-quiz-question">What is the written instrument called in which the insurance contract is set forth?</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) - The policy</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) a clause</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) a provision</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) a document</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>The policy is the written document that constitutes the insurance contract.</p>
</div>
<div class="lesson-quiz-item" data-correct="a">
<p class="lesson-quiz-question">As defined in the California insurance code, ''insurance" is a</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) contract</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) gamble</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) peril</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) risk</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>The California Insurance Code defines insurance as a contract whereby one party undertakes to indemnify another against a contingent or unknown loss.</p>
</div>
<div class="lesson-quiz-item" data-correct="c">
<p class="lesson-quiz-question">All of the following statements about aleatory contracts are true Except?</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) they may be interpreted as a form of gambling</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) there are case where the insurer pays nothing</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) the insured and insurer contribute equally to the contract</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) if a loss occurs; the insured''s premium is small in relation to the amount the insurer pays</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>Aleatory means an unequal exchange of value — one side may pay far less than it receives. "Equal contribution" is the opposite of that.</p>
</div>
<div class="lesson-quiz-item" data-correct="a">
<p class="lesson-quiz-question">Which statement is CORRECT when describing a contract of adhesion?</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) Contract may be accepted or rejected by the insured</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) Contract involves negotiation between insurer and insured</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) Any confusing language in the contract would be interpreted in favor of the insurer</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) Contract cannot be modified by the insurer</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>Because the insurer writes all the terms, the insured''s only choice is to accept the policy as written or reject it — there''s no negotiation.</p>
</div>
<div class="lesson-quiz-item" data-correct="d">
<p class="lesson-quiz-question">According to the California Insurance Code, how is the word "may" interpret?</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) Irrevocable</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) Mandatory</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) Voluntary</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) Permissive/permission</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>In the California Insurance Code, "may" is permissive, meaning an action is allowed or optional rather than required.</p>
</div>
<div class="lesson-quiz-item" data-correct="d">
<p class="lesson-quiz-question">Which of the following is a requirement of a contract?</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) it must be in writing</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) there must be equal consideration between parties</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) there must be negotiation of the terms between parties</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) there must be an offer &amp; acceptance of the contract terms</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>A valid contract requires an offer by one party and acceptance by the other; the other choices (equal consideration, negotiation, or being in writing) are not universal requirements of insurance contracts.</p>
</div>
<div class="lesson-quiz-item" data-correct="c">
<p class="lesson-quiz-question">In an insurance contract, the element that shows each party is giving something of value is called</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) Offer</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) acceptance</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) consideration</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) purpose</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>Consideration is the element of value each party exchanges under the contract — the insurer''s promise to pay and the applicant''s premium and truthful application answers.</p>
</div>
<div class="lesson-quiz-item" data-correct="b">
<p class="lesson-quiz-question">Which type of clause describes the following statement: "We have issued the policy in consideration of the representations in your applications and payment of the first-term premium".</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) Premium clause</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) Consideration clause</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) Adhesion clause</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) Contestability clause</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>This clause states what the insurer received in exchange for issuing the policy — the applicant''s representations and premium — fulfilling the "consideration" element of the contract.</p>
</div>
<div class="lesson-quiz-item" data-correct="a">
<p class="lesson-quiz-question">According to the California insurance code, an insurance policy must specify all of the following EXCEPT the?</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) financial rating of the insurer</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) property or life being insured</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) risks insured against</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) Policy period</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>A policy must state the property or life insured, the risks covered, and the policy period, but it is not required to disclose the insurer''s financial rating.</p>
</div>
<div class="lesson-quiz-item" data-correct="c">
<p class="lesson-quiz-question">The required contents of a policy include all of the following EXCEPT</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) risks insured against</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) parties to the contract</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) the probability of loss</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) the period during which the insurance is to continue</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>The probability of loss is an actuarial pricing concept, not a required contract element. Required policy contents include the parties, insured risks, and the policy period.</p>
</div>
<div class="lesson-quiz-item" data-correct="c">
<p class="lesson-quiz-question">What are an applicant''s statements concerning occupation, hobbies, and personal health history regarded as?</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) warranty</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) guarantee</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) representation</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) collateral</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>Statements made on an application are representations, believed true to the best of the applicant''s knowledge, rather than warranties, which are guaranteed to be absolutely true.</p>
</div>
<div class="lesson-quiz-item" data-correct="c">
<p class="lesson-quiz-question">According to the principle of Utmost Good Faith, the insured will answer questions on the application to the best of their knowledge and pay the required premium, while the insurer will deal fairly with the insured and it''s</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) Underwriting</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) issuance of the policy</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) promises made</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) legal reserve</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>Utmost good faith obligates the insurer to deal fairly with the insured and to honor the promises made in the contract, in exchange for the insured''s honest disclosures and premium payment.</p>
</div>
<div class="lesson-quiz-item" data-correct="b">
<p class="lesson-quiz-question">Unless it is merely a statement of an expectation or belief, a representation as to the future is considered which of following?</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) liability</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) promise</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) provision</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) restriction</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>A representation about a future event or act, unless it''s just an expectation or belief, is treated as a promise and becomes a binding part of the contract.</p>
</div>
<div class="lesson-quiz-item" data-correct="c">
<p class="lesson-quiz-question">What rule is used to determine the importance of a representation?</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) the law of adhesion</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) aleatory contract</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) the materiality of concealment</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) the insurable interest standard</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>Whether a misrepresentation or concealment matters is judged by materiality — whether it would have affected the insurer''s decision to issue the policy or on what terms.</p>
</div>
<div class="lesson-quiz-item" data-correct="d">
<p class="lesson-quiz-question">Which of the following information is not required to be communicated in a life insurance contract?</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) applicant''s name</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) occupation</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) financial information</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) personal judgment</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>Matters of personal judgment or opinion are not required to be disclosed; only material facts, such as identifying, occupational, and financial information, must be communicated.</p>
</div>
<div class="lesson-quiz-item" data-correct="d">
<p class="lesson-quiz-question">When are parties to a contract required to communicate information solely based on personal judgment for a matter in question?</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) only when the policy terms require it</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) only when relevant</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) only when asked</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) never</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>Matters of personal judgment or opinion, as opposed to fact, are never required to be disclosed, since they aren''t considered material representations.</p>
</div>
<div class="lesson-quiz-item" data-correct="d">
<p class="lesson-quiz-question">When intentional concealment is involved, what course of action is the injured party entitled to?</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) Nothing</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) Reduction in premium</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) Punitive damages</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) Rescission of the contract</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>Intentional concealment of a material fact entitles the innocent party to rescind (void) the contract.</p>
</div>
<div class="lesson-quiz-item" data-correct="a">
<p class="lesson-quiz-question">The neglect/failure to communicate that which a party knows, and ought to communicate, is concealment. Concealment entitles the injured party to rescind the insurance if it is:</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) Intentional or unintentional</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) immaterial</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) Unintentional</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) intentional</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>Concealment allows the injured party to rescind the contract whether it was intentional or unintentional, since withholding material information undermines the insurer''s ability to properly assess the risk either way.</p>
</div>', 4
where not exists (select 1 from public.lessons where module_id = 'f6696f10-e236-4e68-b0ba-6637a2342a27' and title = 'Progress Check: The Insurance Contract');
update public.lessons set position = 5 where module_id = 'f6696f10-e236-4e68-b0ba-6637a2342a27' and title = 'Insurance Producers and Distribution';
insert into public.lessons (id, module_id, title, description, duration, type, content, position)
select gen_random_uuid(), 'f6696f10-e236-4e68-b0ba-6637a2342a27', 'Progress Check: Insurance Producers and Distribution', '33 practice questions covering Insurance Producers and Distribution.', '33 min', 'quiz', '<div class="lesson-quiz-item" data-correct="b">
<p class="lesson-quiz-question">One important function of an insurance company is to identify and sell to potential customers. Which of these BEST describes this function? Insurance company has 4 departments</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) Actuarial</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) Marketing</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) Underwriting</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) Claim</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>The marketing department is responsible for identifying prospective customers and generating sales, as distinct from underwriting (risk selection), actuarial (pricing and statistics), and claims (paying losses).</p>
</div>
<div class="lesson-quiz-item" data-correct="c">
<p class="lesson-quiz-question">An insurer entitled to transact business by complying with the California insurance code is known as?</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) alien carrier</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) approved carrier</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) admitted carrier</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) accepted carrier</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>An admitted carrier is an insurer that has been licensed and authorized by the California Department of Insurance to transact business in the state.</p>
</div>
<div class="lesson-quiz-item" data-correct="b">
<p class="lesson-quiz-question">In California, an insurer organized under the state laws of Oregon is called a(n):</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) unauthorized</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) foreign insurer</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) alien insurer</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) domestic insurer</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>An insurer domiciled in another U.S. state is a "foreign insurer" in California; "domestic" applies only to insurers organized under California law, and "alien" describes insurers domiciled outside the U.S.</p>
</div>
<div class="lesson-quiz-item" data-correct="a">
<p class="lesson-quiz-question">A company that is chartered and organized in any country other than the United States is called a(n) _____ company.</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) Alien</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) Foreign</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) Domestic</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) Nonadmitted</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>An insurer chartered in a country other than the U.S. is an "alien" insurer; "foreign" refers to an insurer chartered in another U.S. state.</p>
</div>
<div class="lesson-quiz-item" data-correct="a">
<p class="lesson-quiz-question">Which one of the following is a domestic insurer?</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) One formed under the laws of California</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) One formed under the laws of a state or government of the United States other than Washington</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) One formed under the laws of a country other than the United States of America</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) One formed under the laws of Washington or under the laws of a state geographically bordering Washington</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>A domestic insurer is one organized under the laws of the same state where it''s doing business — California here.</p>
</div>
<div class="lesson-quiz-item" data-correct="c">
<p class="lesson-quiz-question">All of the following are characteristics of reinsurance EXCEPT it</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) increase underwriting capacity</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) stabilizes in insurer''s profits</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) increases the unearned premium reserve</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) provides protection against a catastrophic loss</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>Reinsurance increases underwriting capacity, stabilizes profits, and protects against catastrophic loss, but it reduces (not increases) the ceding insurer''s need to hold an unearned premium reserve for the risk transferred.</p>
</div>
<div class="lesson-quiz-item" data-correct="c">
<p class="lesson-quiz-question">which of the following is an insurer established by a parent company for the purpose of insuring the parent company''s loss exposure? Create a Child company called</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) Participating insurer</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) fraternal insurer</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) Captive insurer</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) mutual insurer</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>A captive insurer is a subsidiary created by a parent company solely to insure that parent''s own risks, rather than to sell insurance to the public.</p>
</div>
<div class="lesson-quiz-item" data-correct="c">
<p class="lesson-quiz-question">The direct response distribution of insurance utilizes all of the following to promote the sale of the insurance EXCEPT?</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) internet advertising</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) television commercials</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) telephone call from an agent</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) brochures mailed to prospect clients</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>Direct response marketing sells directly to consumers through mass media like internet ads, TV commercials, and mailed brochures, without using a personal agent phone call to make the sale.</p>
</div>
<div class="lesson-quiz-item" data-correct="c">
<p class="lesson-quiz-question">Which is not direct marketing?</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) Internet</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) Brochure for advertising</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) Telephone call from insurance agent</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) Mail</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>A phone call from an agent is personal solicitation, not direct marketing; direct marketing methods like internet ads, brochures, and mail reach consumers without an agent''s personal involvement.</p>
</div>
<div class="lesson-quiz-item" data-correct="a">
<p class="lesson-quiz-question">Before the Commissioner will issue a license, a person must be at least</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) 18 years old</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) 19 years old</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) 20 years old</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) 21 years old</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>California requires license applicants to be at least 18 years old.</p>
</div>
<div class="lesson-quiz-item" data-correct="a">
<p class="lesson-quiz-question">A producer who is licensed in Washington but a resident in another state is called a</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) nonresident producer</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) foreign producer</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) reciprocal producer</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) limited lines producer</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>A producer licensed in a state where they do not legally reside is called a nonresident producer.</p>
</div>
<div class="lesson-quiz-item" data-correct="b">
<p class="lesson-quiz-question">In conjunction with a Washington insurance license renewal, which one of the following is the continuing education REQUIREMENT?</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) 12 hours annually</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) 24 hours every 2 years</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) 15 hours annually</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) 26 hours every 3 years</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>Washington requires insurance producers to complete 24 hours of continuing education during each 2-year license renewal period.</p>
</div>
<div class="lesson-quiz-item" data-correct="c">
<p class="lesson-quiz-question">A licensee who is required to take continuing education MUST include how many ethics coursework hours?</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) 1</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) 2</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) 3</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) 4</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>California requires licensees completing continuing education to include a minimum of 3 hours of ethics coursework.</p>
</div>
<div class="lesson-quiz-item" data-correct="b">
<p class="lesson-quiz-question">An individual insurance producer who allows his or her license to expire may, within ___ months from the expiration date, reinstate the same license without passing a written exam.</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) 6</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) 12</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) 18</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) 24</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>California allows a producer whose license has expired to reinstate it without retaking the written exam if done within 12 months of expiration; after that window, retesting is required.</p>
</div>
<div class="lesson-quiz-item" data-correct="d">
<p class="lesson-quiz-question">A person who is not a legal resident of Washington may be licensed to act in this state without taking a written examination. What kind of license would this be?</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) Admitted</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) Foreign</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) Resident</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) Nonresident</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>A nonresident license lets a person licensed and in good standing in their home state obtain a license in another state, often without retaking the written exam, through reciprocity.</p>
</div>
<div class="lesson-quiz-item" data-correct="b">
<p class="lesson-quiz-question">A temporary producer license can be issued in any of the following circumstances EXCEPT</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) the surviving spouse of a producer</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) a prospective producer who is enrolled in an insurance pre-license class</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) designee of a producer entering active service in the armed services</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) any circumstance the Director deems to be in the public interest</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>A temporary license is meant to cover someone stepping into an existing business (e.g., a deceased/disabled producer''s survivor or a designee), not a student who has merely enrolled in a pre-license class.</p>
</div>
<div class="lesson-quiz-item" data-correct="d">
<p class="lesson-quiz-question">A temporary license is valid for a maximum of __ days</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) 30</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) 60</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) 90</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) 180</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>A temporary producer license issued in California is valid for a maximum of 180 days.</p>
</div>
<div class="lesson-quiz-item" data-correct="c">
<p class="lesson-quiz-question">a person authorized by and on behalf of an insurer who transacts life, disability or life and accident and health insurance is defined as a</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) broker</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) solicitor</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) life agent</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) life and disability analyst</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>This is the definition of a life agent, someone appointed by and representing an insurer to transact life and health business, as distinguished from a broker who represents the client.</p>
</div>
<div class="lesson-quiz-item" data-correct="d">
<p class="lesson-quiz-question">According to the California insurance code, an "insurance broker" is</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) authorized by an insurer to transact insurance</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) employed to assist an insurance agent in transacting insurance</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) hired by an insured to give advice about insurance transactions</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) compensated for transacting insurance on behalf of another person with an insured</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>A broker is someone compensated for transacting insurance on behalf of an insured (the person seeking coverage), rather than being appointed to represent the insurer as an agent is.</p>
</div>
<div class="lesson-quiz-item" data-correct="d">
<p class="lesson-quiz-question">An insurance solicitor is a person authorized to</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) sell life insurance</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) charge of a service fee</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) act a broker on behalf of an insurer</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) assists a broker or agent in selling insurance</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>A solicitor works under the supervision of a licensed agent or broker, assisting with the sale of insurance, rather than transacting business independently.</p>
</div>
<div class="lesson-quiz-item" data-correct="c">
<p class="lesson-quiz-question">When a person charges an insured a fee to review the insured''s existing life policy, what type of license does that person need?</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) a life agent</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) a personal lines agent</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) a life and disability analyst</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) a life or disability adjuster</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>A life and disability analyst license is required to review, evaluate, or advise on existing life and disability insurance policies in exchange for a fee.</p>
</div>
<div class="lesson-quiz-item" data-correct="a">
<p class="lesson-quiz-question">Under State law, the agreement between an insurance producer and insurer under which the insurance producer, for compensation, may sell, solicit, or negotiate policies issued by the insurer is defined as</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) an appointment</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) a binding agreement</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) a certificate of authority</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) a license</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>This contractual relationship is called an appointment, which authorizes the producer to represent that specific insurer.</p>
</div>
<div class="lesson-quiz-item" data-correct="c">
<p class="lesson-quiz-question">The acts that are reasonably necessary to the duties expressly authorized would be covered by an agent''s Agent is given 3 powers: 1. Written, power to represent company 2. Not written, but necessary to sale</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) stipulated authority</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) express authority</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) implied authority</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) apparent authority</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>Implied authority covers acts reasonably necessary to carry out the agent''s expressly granted duties, even though not specifically written into the agency contract.</p>
</div>
<div class="lesson-quiz-item" data-correct="c">
<p class="lesson-quiz-question">The power given to an individual producer that is not specifically addressed in his/her contract is considered what type of authority?</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) Discreet</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) apparent</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) implied</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) express</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>Implied authority covers powers not explicitly spelled out in the agency contract but reasonably assumed necessary to carry out the agent''s duties.</p>
</div>
<div class="lesson-quiz-item" data-correct="a">
<p class="lesson-quiz-question">When the principal gives the agent authority in writing, it''s referred to as</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) express authority</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) implied authority</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) apparent authority</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) imposed authority</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>Express authority is the authority specifically granted to the agent in writing (or orally) by the principal, typically spelled out in the agency agreement.</p>
</div>
<div class="lesson-quiz-item" data-correct="c">
<p class="lesson-quiz-question">Which of the following is an express power given to the agent in an agency agreement?</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) the authority to advertise</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) the authority to collect premiums</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) the authority to represents the insurer</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) the authority to bind the insurer to any risk at any time</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>Express powers are those specifically written into the agency contract, such as the authority to represent the insurer; binding the insurer to any risk at any time is not granted, and advertising/collecting premiums are typically implied or incidental powers.</p>
</div>
<div class="lesson-quiz-item" data-correct="c">
<p class="lesson-quiz-question">Although Scott has an agency contract with Able Insurance Company that spells out his duties under the contract, he also has the authority to do other things necessary to carry out his obligations to both the insured and the insurer under the doctrine of:</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) Apparent authority</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) Express authority</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) Implied authority</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) Residual authority</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>Implied authority covers actions reasonably necessary to carry out the duties expressly given in an agent''s contract, even though those actions aren''t specifically spelled out.</p>
</div>
<div class="lesson-quiz-item" data-correct="d">
<p class="lesson-quiz-question">Falsifying the terms, benefits, advantages, or conditions of an insurance policy is an example of which of the following?</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) Forgery</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) Coercion</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) Concealment</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) Misrepresentation</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>Misrepresentation is making false or misleading statements about a policy''s terms, benefits, advantages, or conditions.</p>
</div>
<div class="lesson-quiz-item" data-correct="c">
<p class="lesson-quiz-question">A producer who shares commissions with a client may be guilty of</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) Fraud</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) redlining</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) rebating</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) commingling</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>Giving a client part of a commission (or other unlawful inducement) as an incentive to buy is rebating, which is prohibited.</p>
</div>
<div class="lesson-quiz-item" data-correct="d">
<p class="lesson-quiz-question">Which of the following is NOT considered to be an act of insurance solicitation/selling?</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) An agency sending out direct mail for a promotion</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) An agent giving a rate quotation</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) Airing a television commercial recommending an insurance product</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) Publishing a magazine where one of the advertisers is an insurer</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>Simply publishing a magazine that happens to carry an insurer''s advertisement is not itself solicitation; giving a rate quote, sending promotional direct mail, and airing a commercial recommending a product all qualify as solicitation.</p>
</div>
<div class="lesson-quiz-item" data-correct="d">
<p class="lesson-quiz-question">Which is an agreement in which an insurer contracts with a third party to insure itself against losses from insurance policies it issues?</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) adhesion</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) avoidance</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) indemnity</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) reinsurance</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>This describes reinsurance — one insurer (the ceding company) transfers part of its risk to another insurer (the reinsurer) to limit its own exposure.</p>
</div>
<div class="lesson-quiz-item" data-correct="c">
<p class="lesson-quiz-question">A person who acts, offers to act, or assumes to act in a capacity where a license is required without having a valid license, is guilty of a</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) felony</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) fraud</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) misdemeanor</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) misrepresentation</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>Under the California Insurance Code, acting as an unlicensed agent/broker is a misdemeanor.</p>
</div>
<div class="lesson-quiz-item" data-correct="a">
<p class="lesson-quiz-question">Any inducement offered to the insured in the sale of insurance products that is not specified in the policy is called</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) rebating</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) twisting</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) misrepresentation</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) defamation</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>Rebating is offering something of value not stated in the policy, such as cash back or a gift, to induce a sale, and it is illegal in California.</p>
</div>', 6
where not exists (select 1 from public.lessons where module_id = 'f6696f10-e236-4e68-b0ba-6637a2342a27' and title = 'Progress Check: Insurance Producers and Distribution');
update public.lessons set position = 7 where module_id = 'f6696f10-e236-4e68-b0ba-6637a2342a27' and title = 'Premiums and Rating';
insert into public.lessons (id, module_id, title, description, duration, type, content, position)
select gen_random_uuid(), 'f6696f10-e236-4e68-b0ba-6637a2342a27', 'Progress Check: Premiums and Rating', '10 practice questions covering Premiums and Rating.', '10 min', 'quiz', '<div class="lesson-quiz-item" data-correct="a">
<p class="lesson-quiz-question">What is the price of insurance for each exposure unit? : one unit of life insurance is $1,000</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) Rate</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) Premium</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) Expense</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) Rating</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>The rate is the cost charged per unit of exposure (such as per $1,000 of coverage); the premium is the rate multiplied by the number of units purchased.</p>
</div>
<div class="lesson-quiz-item" data-correct="c">
<p class="lesson-quiz-question">The statement which best describes the relationship between the premiums of a whole life policy and the premium payment period is</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) The shorter the payment period, the lower the premium</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) The longer the payment period, the higher the premium</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) The shorter the payment period, the higher the premium</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) The payment period has no effect on the premium payment</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>Paying off a policy over fewer years means each payment has to be larger to fund the same coverage, so a shorter payment period means a higher premium.</p>
</div>
<div class="lesson-quiz-item" data-correct="b">
<p class="lesson-quiz-question">Which of these would be the best example of a limited pay life insurance policy?</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) Whole life policy that pays out its cash value over a 20 year period</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) Whole life policy with premiums paid up after 20 years</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) Term life policy that returns cash value after 20 years</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) Term life policy with premiums paid up after 20 years</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>A limited pay policy provides lifetime coverage while premiums are paid only for a limited number of years, such as a whole life policy paid up after 20 years.</p>
</div>
<div class="lesson-quiz-item" data-correct="a">
<p class="lesson-quiz-question">Which premium payment mode that results in the highest overall cost?</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) Monthly (12)</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) quarterly (4)</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) semi-annually (2)</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) annually (1)</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>Because the insurer charges a small fee each time a payment is made, paying monthly (12 times a year) adds up to more total fees than paying annually.</p>
</div>
<div class="lesson-quiz-item" data-correct="d">
<p class="lesson-quiz-question">which of these is affected by the frequency of an insurance policy’s premium payments?</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) Settlement options</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) Cash value</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) Death Benefit</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) Cost</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>Paying premiums more frequently than annually (e.g., monthly) increases the overall cost, since insurers add a fee for the more frequent billing.</p>
</div>
<div class="lesson-quiz-item" data-correct="b">
<p class="lesson-quiz-question">Insurer policy expenses include all of the following EXCEPT</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) taxes</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) premiums</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) agent commissions</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) home office operations</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>Premiums are income to the insurer, not an expense; taxes, agent commissions, and home office operating costs are all expense items charged against that income.</p>
</div>
<div class="lesson-quiz-item" data-correct="c">
<p class="lesson-quiz-question">What is not used to calculate insurer’s expense?</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) Office’s expense</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) Taxes</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) Premium</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) Agent’s commission</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>Premium is the price charged to the policyholder, not a component of the insurer''s own operating expenses like office costs, taxes, and agents'' commissions.</p>
</div>
<div class="lesson-quiz-item" data-correct="b">
<p class="lesson-quiz-question">In health insurance, the result of rising morbidity rates is</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) decreased claims</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) increased premiums</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) increased profitability</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) decreased insurance rates</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>Morbidity measures the rate of sickness and disability in a population; as morbidity rates rise, insurers pay more claims and must raise premiums to stay solvent.</p>
</div>
<div class="lesson-quiz-item" data-correct="a">
<p class="lesson-quiz-question">A single premium cash value policy can be described as</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) a policy that is paid up after only one payment</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) a policy that only requires an annual payment</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) a policy that is guaranteed issue</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) a policy that covers two or more lives</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>A single premium policy is fully paid up and in force after just one lump-sum premium payment, immediately building substantial cash value.</p>
</div>
<div class="lesson-quiz-item" data-correct="d">
<p class="lesson-quiz-question">A life insurance policy that has premiums fully paid up within a stated time period is called</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) stated payment insurance</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) limited universal insurance</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) stated modified insurance</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) limited payment insurance</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>A limited payment policy requires premiums for only a limited, stated number of years, after which the policy is fully paid up while coverage continues.</p>
</div>', 8
where not exists (select 1 from public.lessons where module_id = 'f6696f10-e236-4e68-b0ba-6637a2342a27' and title = 'Progress Check: Premiums and Rating');
update public.lessons set position = 9 where module_id = 'f6696f10-e236-4e68-b0ba-6637a2342a27' and title = 'Underwriting';
insert into public.lessons (id, module_id, title, description, duration, type, content, position)
select gen_random_uuid(), 'f6696f10-e236-4e68-b0ba-6637a2342a27', 'Progress Check: Underwriting', '6 practice questions covering Underwriting.', '6 min', 'quiz', '<div class="lesson-quiz-item" data-correct="a">
<p class="lesson-quiz-question">The personal credit or character of a person makes him/her ineligible for life insurance based on primarily on</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) Consumer report</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) Physician’s statement</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) M.I.B</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) Application</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>An applicant''s credit history and character are typically assessed through a consumer (credit) report obtained during underwriting.</p>
</div>
<div class="lesson-quiz-item" data-correct="b">
<p class="lesson-quiz-question">Which report of an insurance applicant''s creditworthiness and personal characteristics may influence eligibility for life and health insurance?</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) agent''s report</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) consumer report</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) attending physician''s statement</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) medical info bureau disclosure.</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>A consumer report (as governed by the Fair Credit Reporting Act) provides credit and personal-history information that insurers may use in underwriting decisions.</p>
</div>
<div class="lesson-quiz-item" data-correct="d">
<p class="lesson-quiz-question">The insurer''s department with primary responsibility for the risk selection process called</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) actuarial</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) claims</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) marketing</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) underwriting</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>Underwriting is the department responsible for evaluating and selecting the risks an insurer will accept, and on what terms.</p>
</div>
<div class="lesson-quiz-item" data-correct="b">
<p class="lesson-quiz-question">The process by which an insurer decides whether to issue requested insurance is called</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) adverse selection</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) underwriting</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) application</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) competition</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>Underwriting is the process of evaluating an application and deciding whether, and on what terms, to issue the requested insurance.</p>
</div>
<div class="lesson-quiz-item" data-correct="d">
<p class="lesson-quiz-question">Underwriters classify insurance risks as any of the following EXCEPT</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) preferred risks</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) standard risks</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) substandard risks</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) dividend risks</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>Preferred, standard, and substandard are the three real underwriting risk classes. "Dividend risk" isn''t a risk classification — dividends relate to participating policies, not underwriting.</p>
</div>
<div class="lesson-quiz-item" data-correct="d">
<p class="lesson-quiz-question">Who are members of the medical information bureau? M.I.B</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) hospital</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) physicians</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) medical bill reviewers</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) life and health insurer</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>The MIB is funded by, and made up of, life and health insurance companies, who share coded information about applicants'' medical impairments.</p>
</div>', 10
where not exists (select 1 from public.lessons where module_id = 'f6696f10-e236-4e68-b0ba-6637a2342a27' and title = 'Progress Check: Underwriting');
update public.lessons set position = 11 where module_id = 'f6696f10-e236-4e68-b0ba-6637a2342a27' and title = 'Insurance Regulation and Producer Conduct';
insert into public.lessons (id, module_id, title, description, duration, type, content, position)
select gen_random_uuid(), 'f6696f10-e236-4e68-b0ba-6637a2342a27', 'Progress Check: Insurance Regulation and Producer Conduct', '31 practice questions covering Insurance Regulation and Producer Conduct.', '31 min', 'quiz', '<div class="lesson-quiz-item" data-correct="c">
<p class="lesson-quiz-question">What enables applicants to compare different life insurance policies and helps them choose which policy is best for their needs?</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) Policy summary</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) Buyer''s summary</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) Buyer''s guide</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) Policy guide</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>A buyer''s guide is a standardized consumer publication designed to help applicants compare costs and features across different life insurance policies.</p>
</div>
<div class="lesson-quiz-item" data-correct="a">
<p class="lesson-quiz-question">The life insurance buyer''s guide includes information about all of the following EXCEPT how to</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) take civil action against an insurer</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) decide how much life insurance to buy</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) compare life insurance policy rates</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) compare life insurance policy requirements</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>The buyer''s guide helps consumers decide how much insurance to buy and compare policy costs and features, but it does not cover how to pursue civil action against an insurer.</p>
</div>
<div class="lesson-quiz-item" data-correct="d">
<p class="lesson-quiz-question">What is it called when an insurer uses higher rates for an individual solely based on religion, race, or ethnic group or marital status?</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) redlining</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) categorizing</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) social injustice</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) unfair discrimination</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>Charging different rates based on race, religion, ethnicity, or marital status rather than sound actuarial factors is unfair discrimination, which is prohibited by law.</p>
</div>
<div class="lesson-quiz-item" data-correct="b">
<p class="lesson-quiz-question">An insurer would be committing Unfair Discrimination if coverage was denied based upon</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) HIV positive result</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) marital status</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) diabetes</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) a mental disorder</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>Marital status has no bearing on insurable risk, so denying coverage based on it is unfair discrimination — unlike medical conditions such as HIV, diabetes, or mental disorders, which can be legitimate underwriting factors.</p>
</div>
<div class="lesson-quiz-item" data-correct="a">
<p class="lesson-quiz-question">What is considered the purpose of the Guaranty Association?</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) Protect insureds from insolvent insurers</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) Pay premiums for insolvent insureds</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) Provide coverage for uninsured residents</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) Guarantee policy loans</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>The Guaranty Association pays covered claims, up to statutory limits, on behalf of insurers that become insolvent, protecting policyholders from loss.</p>
</div>
<div class="lesson-quiz-item" data-correct="b">
<p class="lesson-quiz-question">Funding for the California Life and Disability Guaranty Association is derived from</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) Washington Insurance Department</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) assessments on member companies</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) the Washington General Treasury</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) a special legislative appropriation</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>The California Life and Health Insurance Guarantee Association is funded through assessments levied on its member insurance companies, not through government funds.</p>
</div>
<div class="lesson-quiz-item" data-correct="c">
<p class="lesson-quiz-question">An agent has advertised that the insurer to which the agent is appointed with is a member of the Insurance Guarantee Association. This agent has committed a(n)</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) Felony</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) misdemeanor</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) unfair method of competition</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) unauthorized trade practice</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>Advertising Guarantee Association membership is prohibited because it could mislead the public into thinking membership guarantees the insurer''s financial strength.</p>
</div>
<div class="lesson-quiz-item" data-correct="b">
<p class="lesson-quiz-question">According to the California Insurance Code, what is the maximum penalty per violation for anyone who unwillfully commits an unfair method of competition?</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) $1,000</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) $5,000</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) $7,000</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) $10,000</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>For an unwillful (unintentional) unfair method of competition or unfair practice, the maximum penalty is $5,000 per violation, lower than the penalty for willful violations.</p>
</div>
<div class="lesson-quiz-item" data-correct="b">
<p class="lesson-quiz-question">It is considered an unfair method of competition for an agent to advertise that the insurer the agent is appointed with is.</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) highly rate by A.M. Best Company</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) a member of the insurance Guarantee Association</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) an admitted insurer in the state of California</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) fully authorized by certification to sell insurance</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>Advertising that an insurer belongs to the insurance Guarantee Association is prohibited because it wrongly implies the state guarantees the insurer''s solvency or backs its policies.</p>
</div>
<div class="lesson-quiz-item" data-correct="b">
<p class="lesson-quiz-question">The California Insurance Code requires that an insurer must have (1)enough assets to cover its liabilities and for reinsurance of all outstanding risks. To remain solvent, it must also possess additional assets equal to what amount? Stable/ strong/solid</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) 50% of its stock value</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) Its paid-in capital (2)</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) $10,000,000</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) Amount determined by the Insurance Guarantee Association</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>Beyond assets covering liabilities, an insurer must maintain additional surplus equal to its paid-in capital to remain solvent under California law.</p>
</div>
<div class="lesson-quiz-item" data-correct="c">
<p class="lesson-quiz-question">How often must an insurer file the national association of insurance commissioners (NAIC) financial statement?</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) monthly</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) quarterly</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) annually</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) every three year</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>Insurers are required to file their NAIC financial statement annually.</p>
</div>
<div class="lesson-quiz-item" data-correct="b">
<p class="lesson-quiz-question">The Commissioner is REQUIRED to examine admitted insurers AT LEAST every</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) 2 years</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) 4 years</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) 5 years</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) 6 years</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>California requires the Insurance Commissioner to examine admitted insurers at least every 4 years to verify solvency and compliance.</p>
</div>
<div class="lesson-quiz-item" data-correct="d">
<p class="lesson-quiz-question">Policies covered under the California life and health insurance guarantee association include all of the following EXCEPT? Not buying insurance/ Self-Insured</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) disability income</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) individual health</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) deferred annuities</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) self-funded group life</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>A self-funded group plan isn''t backed by an insurance company at all, so there''s no insurer for the Guarantee Association to stand behind — the employer bears the risk directly.</p>
</div>
<div class="lesson-quiz-item" data-correct="b">
<p class="lesson-quiz-question">According to the California insurance code, if an insurer''s certificate of authority is revoked, the commissioner can proceed with any of the following actions EXCEPT</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) taking possession of transaction records</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) using Guarantee Funds to pay salaries</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) confiscating the office premises</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) liquidating the business</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>Guaranty association funds exist to pay covered claims of an impaired or insolvent insurer''s policyholders, not to pay the company''s administrative salaries.</p>
</div>
<div class="lesson-quiz-item" data-correct="c">
<p class="lesson-quiz-question">If an insurer must have its rates accepted by the insurance department prior to using them, the insurer would be operating in which of the following types of jurisdictions?</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) file and uses</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) use and file</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) prior approval</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) state mandated</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>Under a prior approval law, an insurer must file its rates with the insurance department and receive approval before it can use them, unlike file-and-use or use-and-file states that allow rates to take effect before or shortly after filing.</p>
</div>
<div class="lesson-quiz-item" data-correct="c">
<p class="lesson-quiz-question">The Commissioner of Insurance serves a term of __ years.</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) 2</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) 3</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) 4</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) 5</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>California''s Insurance Commissioner is an elected official who serves a 4-year term.</p>
</div>
<div class="lesson-quiz-item" data-correct="c">
<p class="lesson-quiz-question">The California Insurance Code has authorized standards for names used by life insurance agents. Which of the following, if any, are automatically acceptable for Lance Manyon, a holder of the CLU designation?</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) Lance Manyon Insurer</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) Lance Manyon Best Buy Insurance Company</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) Lance Manyon Insurance Services</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) Manyon Indemnity Company</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>"Lance Manyon Insurance Services" is acceptable because it uses the agent''s actual name with a generic descriptive term. Names implying he is an insurer, a specific company, or using a different surname (like "Manyon Indemnity Company") could mislead the public into thinking he is an insurance company rather than an agent.</p>
</div>
<div class="lesson-quiz-item" data-correct="a">
<p class="lesson-quiz-question">An agent who is acting as an insurance agent, broker, solicitor, life agent, accident and health, or bail agent acts in which capacity when handling premiums or return premiums for an insured?</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) fiduciary</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) legal representative</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) managing general agent</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) natural agent</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>An agent handling premiums or return premiums holds those funds in trust for the insured or insurer, which is a fiduciary capacity requiring proper accounting and handling.</p>
</div>
<div class="lesson-quiz-item" data-correct="c">
<p class="lesson-quiz-question">How long must life agents keep their transaction records?</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) 3 years</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) 4 years</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) 5 years</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) 6 years</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>California requires life agents to retain their transaction records for 5 years.</p>
</div>
<div class="lesson-quiz-item" data-correct="d">
<p class="lesson-quiz-question">When must insurance records of insurance agents and brokers be made available to the insurance commissioner?</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) within 30 days of written request by the commissioner</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) after the policy is issued</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) annually and submitted with the proper paperwork</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) at all-time/immediately</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>Agents'' and brokers'' insurance records must be kept available for the commissioner''s examination at all times, not just when a request is scheduled or a policy is issued.</p>
</div>
<div class="lesson-quiz-item" data-correct="b">
<p class="lesson-quiz-question">What would a person be guilty of who refuses to deliver any books, records, or assets to the Commissioner once a seizure order has been executed?</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) a felony</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) a misdemeanor</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) misrepresentation</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) contempt of court</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>Refusing to turn over books, records, or assets after a seizure order is a misdemeanor under the California Insurance Code.</p>
</div>
<div class="lesson-quiz-item" data-correct="c">
<p class="lesson-quiz-question">Section 1729.2 of the California insurance code requires insurances producer application and licensees to notify the insurance Commissioner in writing, within _____ days of changes in background information after an application has been submitted or a license has been issued</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) 15</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) 20</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) 30</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) 45</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>Producers must report background changes, such as a conviction, to the Commissioner within 30 days.</p>
</div>
<div class="lesson-quiz-item" data-correct="d">
<p class="lesson-quiz-question">Failure to report background changes within 30days as required under section 1729.2 of the California insurance code could subject a licensee or applicant to</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) suspension</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) denial</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) revocation of the license</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) all of the above</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>Failing to timely report a required background change can result in any of these outcomes — suspension, denial, or revocation — depending on the severity of the violation.</p>
</div>
<div class="lesson-quiz-item" data-correct="c">
<p class="lesson-quiz-question">It is a federal offense for an insurance agent to do all of the following EXCEPT</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) falsify financial record</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) embezzle premium payments</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) misrepresent facts on an insurance application</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) willfully engage in the business of insurance with a felony conviction and without the consent of the commissioner</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>Falsifying financial records, embezzling premiums, and engaging in the business of insurance after a felony conviction without the commissioner''s consent are federal offenses under 18 U.S.C. § 1033; misrepresenting facts on an application is instead addressed as a state-level unfair practice.</p>
</div>
<div class="lesson-quiz-item" data-correct="b">
<p class="lesson-quiz-question">Making an oral or written statement that is intended to injure a person engaged in the insurance business is called</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) false advertising</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) defamation</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) rebating</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) twisting</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>A false or malicious oral or written statement made to injure someone engaged in the insurance business is defamation, distinct from twisting (misrepresenting a policy to induce replacement) or rebating.</p>
</div>
<div class="lesson-quiz-item" data-correct="b">
<p class="lesson-quiz-question">A professional liability for which producers/agent can be sued for mistakes of putting a policy into effect is called</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) fiduciary bond</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) errors and omissions</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) fiduciary trust</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) errors and oversights</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>Errors and omissions (E&amp;O) coverage protects producers against claims arising from mistakes or negligence in performing their professional duties.</p>
</div>
<div class="lesson-quiz-item" data-correct="d">
<p class="lesson-quiz-question">What is not considered unfair trade practice?</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) Making false statement on application</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) Publicly tell untruthful information about individuals who work for an insurance company</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) Report false claim about an insurance company</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) Advising a claimant to hire an attorney</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>Advising a claimant to hire an attorney is not an unfair claims practice; the other choices involve dishonesty, false statements, or defamation, which are prohibited.</p>
</div>
<div class="lesson-quiz-item" data-correct="c">
<p class="lesson-quiz-question">The California code of regulation governing claim settlement practices prohibits all of the following acts of unfair discrimination EXCEPT denial of claim based on</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) gender</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) income</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) reckless behavior</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) a physical handicap</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>Denying a claim because of reckless behavior relates to the insured''s own conduct and policy terms, not unfair discrimination. Denying claims based on gender, income, or physical handicap is prohibited unfair discrimination.</p>
</div>
<div class="lesson-quiz-item" data-correct="d">
<p class="lesson-quiz-question">The primary objectives of insurance regulation (the State monitor) include all of the following EXCEPT?</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) rate regulation</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) consumer protection</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) solvency surveillance</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) interprets policy provisions</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>Interpreting policy provisions is a matter for courts, not a primary objective of state insurance regulation. Regulators focus on rate regulation, consumer protection, and solvency surveillance.</p>
</div>
<div class="lesson-quiz-item" data-correct="a">
<p class="lesson-quiz-question">According to the California insurance code, the commissioner can disapprove/deny a licensee''s request to use a fictitious/fake name for any of the following reasons EXCEPT</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) name is the licensee''s actual name</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) use of the name would be misleading</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) name is too similar to a name already filed</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) name implies that the licensee is an underwriter</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>The commissioner denies fictitious names that are misleading, too similar to an existing name, or imply underwriter status; using one''s own actual name is not a basis for denial.</p>
</div>
<div class="lesson-quiz-item" data-correct="d">
<p class="lesson-quiz-question">Pete is a life agent who has misappropriated fiduciary funds to his own use. What is Pete guilty of?</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) Fiduciary misappropriation</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) Rebating</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) Mishandling</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) Theft</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>Misappropriating funds held in a fiduciary capacity, such as premiums, is theft (conversion), regardless of the agent''s fiduciary title.</p>
</div>', 12
where not exists (select 1 from public.lessons where module_id = 'f6696f10-e236-4e68-b0ba-6637a2342a27' and title = 'Progress Check: Insurance Regulation and Producer Conduct');
update public.lessons set position = 13 where module_id = 'f6696f10-e236-4e68-b0ba-6637a2342a27' and title = 'Claims and Policy Provisions';
insert into public.lessons (id, module_id, title, description, duration, type, content, position)
select gen_random_uuid(), 'f6696f10-e236-4e68-b0ba-6637a2342a27', 'Progress Check: Claims and Policy Provisions', '7 practice questions covering Claims and Policy Provisions.', '7 min', 'quiz', '<div class="lesson-quiz-item" data-correct="a">
<p class="lesson-quiz-question">If the insured of a whole life policy suicide within the first 2 years, what will the insurer pay to the beneficiary?</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) Nothing</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) Premium is fully refunded</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) Death benefit</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) Cash Value of the policy</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>The standard suicide clause excludes the death benefit if the insured dies by suicide within the exclusion period (usually the first two years), so the claim is denied and the insurer pays nothing.</p>
</div>
<div class="lesson-quiz-item" data-correct="d">
<p class="lesson-quiz-question">The conditions, times, and circumstances under which an insured is NOT covered by a health policy are called?</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) reinstatements</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) deductibles</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) inclusions</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) exclusions</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>Exclusions are the specific conditions, circumstances, or perils a health policy does not cover.</p>
</div>
<div class="lesson-quiz-item" data-correct="b">
<p class="lesson-quiz-question">An insurer must furnish/provide to a claimant forms for filing proof of loss within ___ days upon receiving a notice of claim.</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) 10</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) 15</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) 20</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) 25</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>Once notified of a claim, the insurer has 15 days to send the claimant the forms needed to file proof of loss.</p>
</div>
<div class="lesson-quiz-item" data-correct="d">
<p class="lesson-quiz-question">Under the Payment of Claims provision, when are benefits typically payable after proof of loss is received?</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) By the end of the calendar year</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) within 60 days</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) Within 30 days</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) immediately/ promptly</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>Once proof of loss is received and the claim is validated, this provision requires the insurer to pay promptly.</p>
</div>
<div class="lesson-quiz-item" data-correct="b">
<p class="lesson-quiz-question">No legal action can be initiated within ___ after proof of loss has been submitted to the insurance company</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) 30 days</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) 60 days</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) 90 days</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) 120 days</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>This provision gives the insurer 60 days to review and process a claim before the insured can sue over it.</p>
</div>
<div class="lesson-quiz-item" data-correct="d">
<p class="lesson-quiz-question">Making an insured whole by restoring them to the same condition as before a loss is an example of</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) reinsurance</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) the retention of risk</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) fiduciary responsibility</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) the principle of indemnity</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>The principle of indemnity restores an insured to the same financial position held immediately before the loss, without allowing a profit from the claim.</p>
</div>
<div class="lesson-quiz-item" data-correct="a">
<p class="lesson-quiz-question">Insured’s are entitled to recover an amount NOT greater than the amount of their loss under the principle of?</p>
<div class="lesson-quiz-options">
<button type="button" class="lesson-quiz-option" data-letter="a">A) adhesion</button>
<button type="button" class="lesson-quiz-option" data-letter="b">B) indemnity</button>
<button type="button" class="lesson-quiz-option" data-letter="c">C) utmost good faith</button>
<button type="button" class="lesson-quiz-option" data-letter="d">D) warranty</button>
</div>
<p class="lesson-quiz-feedback" hidden></p>
<p class="lesson-quiz-explanation" hidden>The insurance contract is a contract of adhesion — drafted entirely by the insurer, with the insured only able to accept or reject its terms as written — and one of those insurer-drafted terms is that recovery can never exceed the actual amount of the loss.</p>
</div>', 14
where not exists (select 1 from public.lessons where module_id = 'f6696f10-e236-4e68-b0ba-6637a2342a27' and title = 'Progress Check: Claims and Policy Provisions');

-- Verify: final lesson order (progress checks interleaved between
-- every pair of lessons).
select m.title as module_title, l.module_id, l.position, l.title, l.type, l.duration
from public.lessons l join public.modules m on m.id = l.module_id
where m.title = 'General Insurance Principles'
order by l.module_id, l.position;
