select
    pi.identifier,
    CONCAT(IF(pn.given_name is null, '', CONCAT((pn.given_name), ' ')), IF(pn.family_name is null, '', CONCAT((pn.family_name), ' '))) as 'Patient name',
    p.gender as 'Patient Gender',
    p.birthdate as 'Patient Birth Date',
    v.date_created as 'Visited Date',
    u.username as 'Registrated By'
from visit as v
         inner join person as p on v.patient_id = p.person_id
         inner join person_name as pn on pn.person_id = p.person_id
         inner join patient_identifier as pi on pi.patient_id = p.person_id
         inner join users as u on u.user_id = v.creator
where
    cast(v.date_created AS DATE) between '#startDate#' AND '#endDate#'
  and v.voided=0
  and v.patient_id not in (
    select o.person_id
    from obs as o
    where
        cast(o.date_created AS DATE) between '#startDate#' AND '#endDate#'
      and o.voided=0
      and o.concept_id = (select conv.concept_id from concept_view as conv where concept_full_name = 'Fee Category')
);