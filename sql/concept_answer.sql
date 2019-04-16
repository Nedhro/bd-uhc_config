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

-- concept_answerer-Patient Category
select @general_concept_id := concept_id from concept_name where name = "General" and concept_name_type="FULLY_SPECIFIED" order by date_created desc limit 1;
select @staff_concept_id := concept_id from concept_name where name = "Staff, Self & family" and concept_name_type="FULLY_SPECIFIED" order by date_created desc limit 1;
select @health_card_concept_id := concept_id from concept_name where name = "Health card holder" and concept_name_type="FULLY_SPECIFIED" order by date_created desc limit 1;
select @vip_concept_id := concept_id from concept_name where name = "VIP" and concept_name_type="FULLY_SPECIFIED" order by date_created desc limit 1;
select @mf_concept_id := concept_id from concept_name where name = "MF" and concept_name_type="FULLY_SPECIFIED" order by date_created desc limit 1;
select @corporate_concept_id := concept_id from concept_name where name = "Corporate" and concept_name_type="FULLY_SPECIFIED" order by date_created desc limit 1;
select @patient_category_concept_id := concept_id from concept_name where name = "Patient Category" and concept_name_type="FULLY_SPECIFIED" order by date_created desc limit 1;


-- concept_answerer-Patient Category
insert into concept_answer(concept_id, answer_concept, creator, date_created, sort_weight, uuid)
values(@patient_category_concept_id, @general_concept_id, @super_user_id, NOW(), 1, uuid());
insert into concept_answer(concept_id, answer_concept, creator, date_created, sort_weight, uuid)
values(@patient_category_concept_id, @staff_concept_id, @super_user_id, NOW(), 1, uuid());
insert into concept_answer(concept_id, answer_concept, creator, date_created, sort_weight, uuid)
values(@patient_category_concept_id, @health_card_concept_id, @super_user_id, NOW(), 1, uuid());
insert into concept_answer(concept_id, answer_concept, creator, date_created, sort_weight, uuid)
values(@patient_category_concept_id, @vip_concept_id, @super_user_id, NOW(), 1, uuid());
insert into concept_answer(concept_id, answer_concept, creator, date_created, sort_weight, uuid)
values(@patient_category_concept_id, @mf_concept_id, @super_user_id, NOW(), 1, uuid());
insert into concept_answer(concept_id, answer_concept, creator, date_created, sort_weight, uuid)
values(@patient_category_concept_id, @corporate_concept_id, @super_user_id, NOW(), 1, uuid());


-- concept_answerer-Referred by
select @self_concept_id := concept_id from concept_name where name = "Self" and concept_name_type="FULLY_SPECIFIED" order by date_created desc limit 1;
select @hospital_concept_id := concept_id from concept_name where name = "Hospital" and concept_name_type="FULLY_SPECIFIED" order by date_created desc limit 1;
select @doctor_concept_id := concept_id from concept_name where name = "Doctor" and concept_name_type="FULLY_SPECIFIED" order by date_created desc limit 1;
select @relative_concept_id := concept_id from concept_name where name = "Relative" and concept_name_type="FULLY_SPECIFIED" order by date_created desc limit 1;
select @pharmacy_concept_id := concept_id from concept_name where name = "Pharmacy" and concept_name_type="FULLY_SPECIFIED" order by date_created desc limit 1;
select @promotional_activity_concept_id := concept_id from concept_name where name = "Promotional Activity" and concept_name_type="FULLY_SPECIFIED" order by date_created desc limit 1;
select @referred_by_concept_id := concept_id from concept_name where name = "Referred by" and concept_name_type="FULLY_SPECIFIED" order by date_created desc limit 1;


-- concept_answerer-Referred by
insert into concept_answer(concept_id, answer_concept, creator, date_created, sort_weight, uuid)
values(@referred_by_concept_id, @self_concept_id, @super_user_id, NOW(), 1, uuid());
insert into concept_answer(concept_id, answer_concept, creator, date_created, sort_weight, uuid)
values(@referred_by_concept_id, @hospital_concept_id, @super_user_id, NOW(), 1, uuid());
insert into concept_answer(concept_id, answer_concept, creator, date_created, sort_weight, uuid)
values(@referred_by_concept_id, @doctor_concept_id, @super_user_id, NOW(), 1, uuid());
insert into concept_answer(concept_id, answer_concept, creator, date_created, sort_weight, uuid)
values(@referred_by_concept_id, @relative_concept_id, @super_user_id, NOW(), 1, uuid());
insert into concept_answer(concept_id, answer_concept, creator, date_created, sort_weight, uuid)
values(@referred_by_concept_id, @pharmacy_concept_id, @super_user_id, NOW(), 1, uuid());
insert into concept_answer(concept_id, answer_concept, creator, date_created, sort_weight, uuid)
values(@referred_by_concept_id, @promotional_activity_concept_id, @super_user_id, NOW(), 1, uuid());
