call add_concept(@concept_id, @s_name_id, @f_name_id, "Date and Time of Delivery", "Date and Time of Delivery", "Datetime", "Question", false);
call add_concept(@concept_id, @s_name_id, @f_name_id, "Indication", "Indication", "Text", "Misc", false);

select @vaginal_delivery_concept_id := concept_id from concept_name where name = "Vaginal face delivery" and concept_name_type = "FULLY_SPECIFIED" order by date_created desc limit 1;
update concept_name set name = "Vaginal Delivery" where concept_id = @vaginal_delivery_concept_id and concept_name_type = "SHORT";

select @caesarean_concept_id := concept_id from concept_name where name = "O82 Single delivery by caesarean section" and concept_name_type = "FULLY_SPECIFIED" order by date_created desc limit 1;

call add_concept(@mode_delivery_concept_id, @s_name_id, @f_name_id, "Mode of Delivery", "Mode of Delivery", "Coded", "Question", false);

call add_concept_answer(@mode_delivery_concept_id, @vaginal_delivery_concept_id, 1);
call add_concept_answer(@mode_delivery_concept_id, @caesarean_concept_id, 2);




call add_concept(@concept_id, @s_name_id, @f_name_id, "Date and Time of Birth", "Date and Time of Birth", "Datetime", "Question", false);

select @child_gender_concept_id := concept_id from concept_name where name = "Child gender" and concept_name_type = "FULLY_SPECIFIED" order by date_created desc limit 1;
select @weight_concept_id := concept_id from concept_name where name = "Baby Weight" and concept_name_type = "FULLY_SPECIFIED" order by date_created desc limit 1;
select @apgar1_concept_id := concept_id from concept_name where name = "APGAR score at 1 minute" and concept_name_type = "FULLY_SPECIFIED" order by date_created desc limit 1;
select @apgar5_concept_id := concept_id from concept_name where name = "APGAR score at 5 Minutes" and concept_name_type = "FULLY_SPECIFIED" order by date_created desc limit 1;
select @date_time_birth_concept_id := concept_id from concept_name where name = "Date and Time of Birth" and concept_name_type = "FULLY_SPECIFIED" order by date_created desc limit 1;

call add_concept(@baby_notes_concept_id, @s_name_id, @f_name_id, "Delivery Notes, Baby Notes, Baby Notes", "Baby Notes", "Text", "Misc", false);
call add_concept(@del_baby_notes_concept_id, @s_name_id, @f_name_id, "Delivery Notes, Baby Notes", "Baby Notes", "N/A", "Misc", true);

call add_concept_set_members(@del_baby_notes_concept_id, @child_gender_concept_id, 1);
call add_concept_set_members(@del_baby_notes_concept_id, @weight_concept_id, 2);
call add_concept_set_members(@del_baby_notes_concept_id, @apgar1_concept_id, 3);
call add_concept_set_members(@del_baby_notes_concept_id, @apgar5_concept_id, 4);
call add_concept_set_members(@del_baby_notes_concept_id, @date_time_birth_concept_id, 5);
call add_concept_set_members(@del_baby_notes_concept_id, @baby_notes_concept_id, 6);