select pcat.* from
(select
    cv.concept_full_name as 'Category Name',
    (
        CASE
            WHEN count(v.visit_id) < (SELECT COUNT(allv.patient_id) FROM visit as allv ) THEN count(v.visit_id)
            WHEN count(v.visit_id) = (SELECT COUNT(allv.patient_id) FROM visit as allv ) THEN count(v.visit_id)-1
            END) AS 'Patient Count'
from visit as v
inner join person_attribute as pa on pa.person_id =v.patient_id
inner join concept_view as cv ON cv.concept_id = pa.value
where v.patient_id in (SELECT allv.patient_id FROM visit as allv GROUP BY allv.patient_id HAVING COUNT(allv.patient_id) > 1) and
      pa.person_attribute_type_id =
(select pt.person_attribute_type_id from person_attribute_type as pt where pt.name = 'patientCategory')
and cast(v.date_created as DATE) between '#startDate#' AND '#endDate#'
group by cv.concept_full_name order by count(v.visit_id) desc) as pcat;