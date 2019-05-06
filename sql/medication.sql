call add_concept(@in_the_morning_empty_stomach_concept_id, @s_name_id, @f_name_id, "In the morning, Empty stomach", "In the morning, Empty stomach", "N/A", "Misc", false);
call add_concept(@in_the_morning_after_meals_concept_id, @s_name_id, @f_name_id, "	In the morning, After meals", "In the morning, After meals", "N/A", "Misc", false);
call add_concept(@in_the_morning_before_meals_concept_id, @s_name_id, @f_name_id, "In the morning, Before meals", "In the morning, Before meals", "N/A", "Misc", false);
call add_concept(@in_the_evening_after_meals_concept_id, @s_name_id, @f_name_id, "	In the evening, After meals", "In the evening, After meals", "N/A", "Misc", false);
call add_concept(@in_the_evening_before_meals_concept_id, @s_name_id, @f_name_id, "In the evening, Before meals", "In the evening, Before meals", "N/A", "Misc", false);

select @dosing_instructions_concept_id := concept_id from concept_name where name = "Dosing Instructions" and concept_name_type = "FULLY_SPECIFIED" order by date_created desc limit 1;

call add_concept_set_members(@dosing_instructions_concept_id, @in_the_morning_empty_stomach_concept_id, 9);
call add_concept_set_members(@dosing_instructions_concept_id, @in_the_morning_after_meals_concept_id, 10);
call add_concept_set_members(@dosing_instructions_concept_id, @in_the_morning_before_meals_concept_id, 11);
call add_concept_set_members(@dosing_instructions_concept_id, @in_the_evening_after_meals_concept_id, 12);
call add_concept_set_members(@dosing_instructions_concept_id, @in_the_evening_before_meals_concept_id, 13);


