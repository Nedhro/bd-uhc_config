select concat(pn.given_name, ' ', pn.family_name) as DoctorName, count(rs.person_a) as NumberOfPatient from person_name as pn
                                                                                                                inner join relationship as rs on rs.person_b=pn.person_id
    and rs.relationship =(select rt.relationship_type_id from relationship_type as rt where a_is_to_b ='Doctor')
    and cast(rs.date_created as DATE) between '#startDate#' AND '#endDate#'
group by concat(pn.given_name, ' ', pn.family_name) order by count(rs.person_a) desc ;