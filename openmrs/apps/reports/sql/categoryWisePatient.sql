select cv.concept_full_name as 'Category Name',count(v.visit_id) as 'Patient Count'
    from visit as v
    inner join person_attribute as pa on pa.person_id =v.patient_id
    inner join concept_view as cv ON cv.concept_id = pa.value
    where pa.person_attribute_type_id =
      (select pt.person_attribute_type_id from person_attribute_type as pt where pt.name = 'patientCategory')
      and cast(v.date_created as DATE) between '#startDate#' AND '#endDate#'
group by cv.concept_full_name order by count(v.visit_id) desc;