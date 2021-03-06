call add_concept(@concept_id, @s_name_id, @f_name_id, "Diabetes Follow up, Is Patient on ARB", "Is Patient on ARB", "Boolean", "Misc", false);

call add_concept(@diabetes_follow_up_last_ldl_mg_dl, @s_name_id, @f_name_id, "Diabetes Follow up, Last LDL Mg", "Last LDL", "Numeric", "Finding", false);
call add_concept_numeric_db(@diabetes_follow_up_last_ldl_mg_dl, null, null, "mg/dl");

call add_concept(@concept_id, @s_name_id, @f_name_id, "Diabetes Follow up, Last LDL Date", "Last LDL Date", "Date", "Misc", false);

call add_concept(@diabetes_follow_up_last_hdl_mg_dl, @s_name_id, @f_name_id, "Diabetes Follow up, Last HDL Mg", "Last HDL", "Numeric", "Finding", false);
call add_concept_numeric_db(@diabetes_follow_up_last_hdl_mg_dl, null, null, "mg/dl");

call add_concept(@concept_id, @s_name_id, @f_name_id, "Diabetes Follow up, Last HDL Date", "Last HDL Date", "Date", "Misc", false);
call add_concept(@concept_id, @s_name_id, @f_name_id, "Diabetes Follow up, Last TG", "Last TG", "Text", "Misc", false);
call add_concept(@concept_id, @s_name_id, @f_name_id, "Diabetes Follow up, Last  TG Date", "Last  TG Date", "Date", "Misc", false);

call add_concept(@diabetes_follow_up_total_cholesterol, @s_name_id, @f_name_id, "Diabetes Follow up, Total Cholesterol", "Total Cholesterol", "Numeric", "Finding", false);
call add_concept_numeric_db(@diabetes_follow_up_total_cholesterol, null, null, "mg/dl");

call add_concept(@concept_id, @s_name_id, @f_name_id, "Diabetes Follow up, Ulcer Present on Feet", "Ulcer Present on Feet", "Boolean", "Misc", false);

call add_concept(@concept_id, @s_name_id, @f_name_id, "Diabetes Follow up, Last Eye Exam Date", "Last Eye Exam Date", "Date", "Misc", false);

call add_concept(@diabetes_follow_up_systolic_data, @s_name_id, @f_name_id, "Diabetes Follow up, Systolic Data", "Systolic Data", "Numeric", "Finding", false);
call add_concept_numeric_db(@diabetes_follow_up_systolic_data, null, null, "mmHg");

call add_concept(@diabetes_follow_up_diastolic_data, @s_name_id, @f_name_id, "Diabetes Follow up, Diastolic data", "Diastolic data", "Numeric", "Finding", false);
call add_concept_numeric_db(@diabetes_follow_up_diastolic_data, null, null, "mmHg");

call add_concept(@diabetes_follow_up_hba1c_percentage, @s_name_id, @f_name_id, "Diabetes Follow up, HbA1C Percentage", "HbA1C", "Numeric", "Finding", false);
call add_concept_numeric_db(@diabetes_follow_up_hba1c_percentage, null, null, "%");

call add_concept(@concept_id, @s_name_id, @f_name_id, "Diabetes Follow up, Last Date of HbA1C", "Last Date of HbA1C", "Date", "Misc", false);