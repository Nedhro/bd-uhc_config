select
        u.username as 'User Name',
       sum(o.value_numeric) as 'Total Collected Amount'
from patient as pat
         inner join visit v on pat.patient_id = v.patient_id
         inner join obs o on o.person_id = pat.patient_id
         left join users u on v.creator = u.user_id
where o.concept_id = (select cn.concept_id from concept_name as cn where cn.name="Registration Fee" and cn.concept_name_type="FULLY_SPECIFIED" limit 1)
  and cast(o.date_created AS DATE) BETWEEN '#startDate#' AND '#endDate#'
group by v.creator;