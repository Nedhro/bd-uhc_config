select cv.concept_full_name as 'Category Name',count(v.visit_id) as 'Patient Count' from visit v
    inner join encounter e on e.visit_id=v.visit_id
    INNER join location l on l.location_id = e.location_id
    INNER JOIN location_tag_map lm on l.location_id= lm.location_id
    inner JOIN location_tag lt on lt.location_tag_id = lm.location_tag_id and lt.name='Report Location'
    inner join visit_type vt on vt.visit_type_id=v.visit_type_id
    inner join person_attribute pa on pa.person_id =v.patient_id
    inner join concept_view cv ON cv.concept_id = pa.value
    where person_attribute_type_id =
      (select pt.person_attribute_type_id from person_attribute_type pt where name = 'patientCategory')
      and cast(v.date_created as DATE) between '#startDate#' AND '#endDate#'
group by cv.concept_full_name order by count(DISTINCT v.patient_id) desc;