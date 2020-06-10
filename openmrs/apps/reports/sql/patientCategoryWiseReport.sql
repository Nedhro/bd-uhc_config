
select
    cv.concept_full_name,
    rag.name AS 'Patient Age Group',
    sum(IF(p.gender = 'F', 1, 0)) AS Female,
    sum(IF(p.gender = 'M', 1, 0)) AS Male,
    sum(IF(p.gender = 'O', 1, 0)) AS Other,
    sum(IF(p.gender in ('F','M','O'), 1, 0)) AS total
from obs o
    inner join person p on p.person_id=o.person_id
    inner join reporting_age_group rag ON
            rag.min_years <= TIMESTAMPDIFF(YEAR, p.birthdate,o.date_created) and rag.max_years >= TIMESTAMPDIFF(YEAR, p.birthdate,o.date_created)
        AND rag.report_group_name = 'Registration'
    inner join concept_view c on o.concept_id = c.concept_id and c.concept_full_name='Fee Category'
      and o.voided = 0
      and cast(o.obs_datetime AS DATE) BETWEEN '#startDate#' AND '#endDate#'
    inner join concept_view as cv on cv.concept_id=o.value_coded

group by cv.concept_full_name,rag.sort_order order by cv.concept_full_name, rag.name;