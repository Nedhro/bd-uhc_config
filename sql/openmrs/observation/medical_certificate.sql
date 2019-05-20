call add_concept(@concept_id, @s_name_id, @f_name_id, "Medical Certificate, Previous Complications", "Previous Complications", "Text", "Misc", false);

call add_concept(@medical_certificate_advice_concept_id, @s_name_id, @f_name_id, "Medical Certificate, Advice", "Advice", "N/A", "Misc", true);

call add_concept(@medical_certificate_advice_name_concept_id, @s_name_id, @f_name_id, "Medical Certificate, Advice Name", "Advice Name", "Text", "Misc", false);

call add_concept(@from_date_concept_id, @s_name_id, @f_name_id, "Medical Certificate, From Date", "From Date", "Date", "Misc", false);
call add_concept(@to_date_concept_id, @s_name_id, @f_name_id, "Medical Certificate, To Date", "To Date", "Date", "Misc", false);

call add_concept_set_members(@medical_certificate_advice_concept_id, @medical_certificate_advice_name_concept_id, 1);
call add_concept_set_members(@medical_certificate_advice_concept_id, @from_date_concept_id, 2);
call add_concept_set_members(@medical_certificate_advice_concept_id, @to_date_concept_id, 3);

call add_concept(@medical_certificate_general_complication_name_concept_id, @s_name_id, @f_name_id, "Medical Certificate, General Complication Name", "Name", "Text", "Misc", false);

call add_concept(@medical_certificate_suffering_from_concept_id, @s_name_id, @f_name_id, "Medical Certificate, Suffering From", "Suffering From", "Text", "Misc", false);

call add_concept(@medical_follow_up_after, @s_name_id, @f_name_id, "Medical, For", "For", "Numeric", "Finding", false);
call add_concept_numeric_db(@medical_follow_up_after, null, null, null);

call add_concept(@medical_certificate_duration_unit, @s_name_id, @f_name_id, "Medical Certificate, Duration Coded Units", "Unit", "Coded", "Misc", false);
call add_concept(@hours_concept_id, @s_name_id, @f_name_id, "Medical Certificate, Duration Hours", "Hour(s)", "N/A", "Misc", false);
call add_concept(@days_concept_id, @s_name_id, @f_name_id, "Medical Certificate, Duration Days", "Day(s)", "N/A", "Misc", false);
call add_concept(@weeks_concept_id, @s_name_id, @f_name_id, "Medical Certificate, Duration Weeks", "Week(s)", "N/A", "Misc", false);
call add_concept(@month_concept_id, @s_name_id, @f_name_id, "Medical Certificate, Duration Months", "Month(s)", "N/A", "Misc", false);
call add_concept(@year_concept_id, @s_name_id, @f_name_id, "Medical Certificate, Duration Years", "Year(s)", "N/A", "Misc", false);

call add_concept_answer(@medical_certificate_duration_unit, @hours_concept_id, 1);
call add_concept_answer(@medical_certificate_duration_unit, @days_concept_id, 2);
call add_concept_answer(@medical_certificate_duration_unit, @weeks_concept_id, 3);
call add_concept_answer(@medical_certificate_duration_unit, @month_concept_id, 4);
call add_concept_answer(@medical_certificate_duration_unit, @year_concept_id, 5);