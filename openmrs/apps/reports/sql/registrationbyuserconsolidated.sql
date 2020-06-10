select
    u.username as 'User Name',
    count(obs.value_coded) as 'Total Patient'
from obs
         inner join users u on obs.creator = u.user_id
where obs.concept_id = (select conv.concept_id from concept_view as conv where concept_full_name = 'Fee Category')
    and cast(obs.date_created as DATE) between '#startDate#' AND '#endDate#'
    and obs.voided=0
group by obs.creator;