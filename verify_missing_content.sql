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
