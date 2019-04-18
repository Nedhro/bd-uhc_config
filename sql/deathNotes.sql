
select @date_time_arrival_concept_id := concept_id from concept_name where name = "Death Note, Time of Arrival" and concept_name_type = "FULLY_SPECIFIED";
update concept_name set name = "Date and Time of Arrival" where concept_id = @date_time_arrival_concept_id and concept_name_type = "SHORT";

select @date_time_death_concept_id := concept_id from concept_name where name = "Date of death" and concept_name_type = "FULLY_SPECIFIED";
update concept_name set name = "Date and Time of death" where concept_id = @date_time_death_concept_id and concept_name_type = "SHORT";

call add_concept(@concept_id, @s_name_id, @f_name_id, "Death Notes, Primary diseases Causing Death", "Primary diseases Causing Death", "Text", "Misc", false);

call add_concept(@ml_concept_id, @s_name_id, @f_name_id, "Medico Legal", "Medico Legal", "Coded", "Misc", false);
call add_concept(@mlc_concept_id, @s_name_id, @f_name_id, "Medical Legal Case", "Medical Legal Case", "N/A", "Misc", false);
call add_concept(@gc_concept_id, @s_name_id, @f_name_id, "General Case", "General Case", "N/A", "Misc", false);

call add_concept_answer(@ml_concept_id, @mlc_concept_id, 1);
call add_concept_answer(@ml_concept_id, @gc_concept_id, 2);


call add_concept(@concept_id, @s_name_id, @f_name_id, "Death Notes, Provider Name who Pronounced Death", "Provider Name who Pronounced Death", "Text", "Misc", false);
call add_concept(@concept_id, @s_name_id, @f_name_id, "Death Notes, Next to Kin Aware of Death", "Family /Next to kin aware of Death", "Boolean", "Misc", false);


call add_concept(@maternal_death_concept_id, @s_name_id, @f_name_id, "In Cause of Maternal Death ,Death Occurs at", "In Cause of Maternal Death ,Death Occurs at", "Coded", "Misc", false);
call add_concept(@antepartum_concept_id, @s_name_id, @f_name_id, "Antepartum", "Antepartum", "N/A", "Misc", false);
call add_concept(@intrapartum_concept_id, @s_name_id, @f_name_id, "Intrapartum", "Intrapartum", "N/A", "Misc", false);
call add_concept(@postpartum_concept_id, @s_name_id, @f_name_id, "Postpartum", "Postpartum", "N/A", "Misc", false);

call add_concept_answer(@maternal_death_concept_id, @antepartum_concept_id, 1);
call add_concept_answer(@maternal_death_concept_id, @intrapartum_concept_id, 2);
call add_concept_answer(@maternal_death_concept_id, @postpartum_concept_id, 2);

call add_concept(@concept_id, @s_name_id, @f_name_id, "Death Notes, Other Comorbidities", "Other Comorbidities", "Text", "Misc", false);


