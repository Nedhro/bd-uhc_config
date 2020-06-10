select
    l.name as 'Location Name',
    rag.name AS 'Patient Age Group',
    sum(IF(p.gender = 'F', 1, 0)) AS Female,
    sum(IF(p.gender = 'M', 1, 0)) AS Male,
    sum(IF(p.gender = 'O', 1, 0)) AS Other,
    (sum(IF(p.gender = 'F', 1, 0)) + sum(IF(p.gender = 'M', 1, 0)) + sum(IF(p.gender = 'O', 1, 0))) as Total
from obs as o
         inner join person p on p.person_id=o.person_id
         inner JOIN location l ON l.location_id = o.location_id
         INNER JOIN reporting_age_group rag ON
            rag.min_years <= TIMESTAMPDIFF(YEAR, p.birthdate,o.date_created) and rag.max_years >= TIMESTAMPDIFF(YEAR, p.birthdate,o.date_created)
        AND rag.report_group_name = 'Registration'
where o.concept_id = (select conv.concept_id from concept_view as conv where concept_full_name = 'Fee Category')
    and cast(o.date_created as DATE) between '#startDate#' AND '#endDate#'
    and o.voided=0
group by l.name,rag.name order by l.name,rag.name;