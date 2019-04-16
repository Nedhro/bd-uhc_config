select @super_user_id := user_id from users where username = "superman";

select @general_concept_id := concept_id from concept_name where name = "General" and concept_name_type="FULLY_SPECIFIED" order by date_created desc limit 1;
select @sensitive_concept_id := concept_id from concept_name where name = "Sensitive-Contagious Disease" and concept_name_type="FULLY_SPECIFIED" order by date_created desc limit 1;
select @risky_concept_id := concept_id from concept_name where name = "Risky" and concept_name_type="FULLY_SPECIFIED" order by date_created desc limit 1;
select @blacklist_concept_id := concept_id from concept_name where name = "Blacklist" and concept_name_type="FULLY_SPECIFIED" order by date_created desc limit 1;
select @alarming_field_concept_id := concept_id from concept_name where name = "Alarming Field" and concept_name_type="FULLY_SPECIFIED" order by date_created desc limit 1;


-- concept_answerer-Alarming field
insert into concept_answer(concept_id, answer_concept, creator, date_created, sort_weight, uuid)
values(@alarming_field_concept_id, @general_concept_id, @super_user_id, NOW(), 1, uuid());
insert into concept_answer(concept_id, answer_concept, creator, date_created, sort_weight, uuid)
values(@alarming_field_concept_id, @sensitive_concept_id, @super_user_id, NOW(), 1, uuid());
insert into concept_answer(concept_id, answer_concept, creator, date_created, sort_weight, uuid)
values(@alarming_field_concept_id, @risky_concept_id, @super_user_id, NOW(), 1, uuid());
insert into concept_answer(concept_id, answer_concept, creator, date_created, sort_weight, uuid)
values(@alarming_field_concept_id, @blacklist_concept_id, @super_user_id, NOW(), 1, uuid());

