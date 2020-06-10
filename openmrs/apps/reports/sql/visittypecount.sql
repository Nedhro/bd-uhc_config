select vt.name as 'Visit Type',count(v.visit_id) as 'Patient Count' from visit as v
 inner join visit_type as vt on vt.visit_type_id=v.visit_type_id
  and cast(v.date_created as DATE) between '#startDate#' AND '#endDate#'
GROUP BY vt.name order by count(v.visit_id) desc;