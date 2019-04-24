call add_concept(@hospital_course_concept_id, @s_name_id, @f_name_id, "Hospital Course", "Hospital Course", "Text", "Misc", false);
call add_concept(@treatment_plan_concept_id, @s_name_id, @f_name_id, "Treatment Plan", "Treatment Plan", "Text", "Misc", false);

call add_concept(@absconding_concept_id, @s_name_id, @f_name_id, "Absconding", "Absconding", "N/A", "Misc", false);
select @in_patient_outcome_concept_id := concept_id from concept_name where name = "Inpatient Outcome" and concept_name_type="FULLY_SPECIFIED" order by date_created desc limit 1;
call add_concept_answer(@in_patient_outcome_concept_id, @absconding_concept_id, 1);

call add_concept(@concept_id, @s_name_id, @f_name_id, "Provisional Diagnosis", "Provisional Diagnosis", "Text", "Misc", false);
call add_concept(@concept_id, @s_name_id, @f_name_id, "Lab Investigation Notes", "Lab Investigation Notes", "Text", "Misc", false);
call add_concept(@concept_id, @s_name_id, @f_name_id, "OT Surgery Notes", "OT/Surgery Notes", "Text", "Misc", false);
call add_concept(@concept_id, @s_name_id, @f_name_id, "Radiology Notes", "Radiology Notes", "Text", "Misc", false);

call add_concept(@follow_up_after_concept_id, @s_name_id, @f_name_id, "Follow up After", "After", "Numeric", "Finding", false);
call add_concept_numeric(@follow_up_after_concept_id, null, null, null);

call add_concept(@follow_up_concept_id, @s_name_id, @f_name_id, "Duration Coded Units", "Unit", "Coded", "Misc", false);
call add_concept(@hours_concept_id, @s_name_id, @f_name_id, "Duration Hours", "Hour(s)", "N/A", "Misc", false);
call add_concept(@days_concept_id, @s_name_id, @f_name_id, "Duration Days", "Day(s)", "N/A", "Misc", false);
call add_concept(@weeks_concept_id, @s_name_id, @f_name_id, "Duration Weeks", "Week(s)", "N/A", "Misc", false);
call add_concept(@month_concept_id, @s_name_id, @f_name_id, "Duration Months", "Month(s)", "N/A", "Misc", false);
call add_concept(@year_concept_id, @s_name_id, @f_name_id, "Duration Years", "Year(s)", "N/A", "Misc", false);

call add_concept_answer(@follow_up_concept_id, @hours_concept_id, 1);
call add_concept_answer(@follow_up_concept_id, @days_concept_id, 2);
call add_concept_answer(@follow_up_concept_id, @weeks_concept_id, 3);
call add_concept_answer(@follow_up_concept_id, @month_concept_id, 4);
call add_concept_answer(@follow_up_concept_id, @year_concept_id, 5);

