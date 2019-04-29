call add_concept(@concept_id, @s_name_id, @f_name_id, "Medical Certificate, Previous Complications", "Previous Complications", "Text", "Misc", false);

call add_concept(@medical_certificate_advice_concept_id, @s_name_id, @f_name_id, "Medical Certificate, Advice", "Advice", "N/A", "Misc", true);

call add_concept(@medical_certificate_advice_name_concept_id, @s_name_id, @f_name_id, "Medical Certificate, Advice Name", "Advice Name", "Text", "Misc", false);

call add_concept(@from_date_concept_id, @s_name_id, @f_name_id, "Medical Certificate, From Date", "From Date", "Date", "Misc", false);
call add_concept(@to_date_concept_id, @s_name_id, @f_name_id, "Medical Certificate, To Date", "To Date", "Date", "Misc", false);

call add_concept_set_members(@medical_certificate_advice_concept_id, @medical_certificate_advice_name_concept_id, 1);
call add_concept_set_members(@medical_certificate_advice_concept_id, @from_date_concept_id, 2);
call add_concept_set_members(@medical_certificate_advice_concept_id, @to_date_concept_id, 3);

call add_concept(@medical_certificate_general_complication_name_concept_id, @s_name_id, @f_name_id, "Medical Certificate, General Complication Name", "Name", "Text", "Misc", false);
