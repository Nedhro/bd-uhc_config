select  pa.address5 as 'Thana',count(v.visit_id) as 'Total Visit' from visit as v
    inner join person_address as pa on pa.person_id = v.patient_id
    and cast(v.date_created as DATE) between '#startDate#' AND '#endDate#'
GROUP BY pa.address5 order by count(v.visit_id) desc;