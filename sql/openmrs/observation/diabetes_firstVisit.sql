call add_concept(@concept_id, @s_name_id, @f_name_id, "Diabetes, Date of Last Visit", "Date of Last Visit", "Date", "Misc", false);
call add_concept(@concept_id, @s_name_id, @f_name_id, "Diabetes, Previous Follow Up Location", "Previous Follow Up Location", "Text", "Misc", false);

call add_concept(@diagnosis_confirmed_concept_id, @s_name_id, @f_name_id, "Diabetes, Diagnosis Confirmed", "Diagnosis Confirmed", "Coded", "Misc", false);
call add_concept(@no_Previous_diagnosis_id, @s_name_id, @f_name_id, "Diabetes, Diagnosis Confirmed, No Previous Diagnosis", "No Previous Diagnosis", "N/A", "Misc", false);
call add_concept(@confirmed_elsewhereconcept_id, @s_name_id, @f_name_id, "Diabetes, Diagnosis Confirmed, Confirmed Elsewhere", "Confirmed Elsewhere", "N/A", "Misc", false);

call add_concept_answer(@diagnosis_confirmed_concept_id, @no_Previous_diagnosis_id, 1);
call add_concept_answer(@diagnosis_confirmed_concept_id, @confirmed_elsewhereconcept_id, 2);

call add_concept(@diabetic_type_concept_id, @s_name_id, @f_name_id, "Diabetic Type", "Diabetic Type", "Coded", "Misc", false);
call add_concept(@type_1_dM_id, @s_name_id, @f_name_id, "Type 1 DM", "Type 1 DM", "N/A", "Misc", false);
call add_concept(@type_2_dM_id, @s_name_id, @f_name_id, "Type 2 DM", "Type 2 DM", "N/A", "Misc", false);

call add_concept_answer(@diabetic_type_concept_id, @type_1_dM_id, 1);
call add_concept_answer(@diabetic_type_concept_id, @type_2_dM_id, 2);

call add_concept(@concept_id, @s_name_id, @f_name_id, "Diabetes, Last Known HbA1C Date", "Last Known HbA1C Date", "Date", "Misc", false);

call add_concept(@diabetes_first_visit_last_known_hba1c_result_percentage, @s_name_id, @f_name_id, "Diabetes, Last Known HbA1C Result Percentage", "Last Known HbA1C Result", "Numeric", "Finding", false);
call add_concept_numeric_db(@diabetes_first_visit_last_known_hba1c_result_percentage, null, null, "%");

call add_concept(@concept_id, @s_name_id, @f_name_id, "Diabetes, Last Known Fasting Blood Sugar Date", "Last Known Fasting Blood Sugar Date", "Date", "Misc", false);

call add_concept(@diabetes_first_visit_last_known_fasting_blood_sugar_mmml_liter, @s_name_id, @f_name_id, "Diabetes, Last Known Fasting Blood Sugar Mmml Liter", "Last Known Fasting Blood Sugar", "Numeric", "Finding", false);
call add_concept_numeric_db(@diabetes_first_visit_last_known_fasting_blood_sugar_mmml_liter, null, null, "mmml/Liter");

call add_concept(@if_new_Patient_suspicion_concept_id, @s_name_id, @f_name_id, "Diabetes, If New Patient Suspicion", "If New Patient /Suspicion", "Coded", "Misc", false);
call add_concept(@polyuria_concept_id, @s_name_id, @f_name_id, "Diabetes New, Polyuria", "Polyuria", "N/A", "Misc", false);
call add_concept(@blurred_vision_concept_id, @s_name_id, @f_name_id, "Diabetes New, Blurred Vision", "Blurred Vision", "N/A", "Misc", false);
call add_concept(@polydipsia_concept_id, @s_name_id, @f_name_id, "Diabetes New, Polydipsia", "Polydipsia", "N/A", "Misc", false);
call add_concept(@nocturia_concept_id, @s_name_id, @f_name_id, "Diabetes New, Nocturia", "Nocturia", "N/A", "Misc", false);
call add_concept(@weight_loss_concept_id, @s_name_id, @f_name_id, "Diabetes New, Weight Loss", "Weight Loss", "N/A", "Misc", false);

call add_concept_answer(@if_new_Patient_suspicion_concept_id, @polyuria_concept_id, 1);
call add_concept_answer(@if_new_Patient_suspicion_concept_id, @blurred_vision_concept_id, 2);
call add_concept_answer(@if_new_Patient_suspicion_concept_id, @polydipsia_concept_id, 3);
call add_concept_answer(@if_new_Patient_suspicion_concept_id, @nocturia_concept_id, 4);
call add_concept_answer(@if_new_Patient_suspicion_concept_id, @weight_loss_concept_id, 5);

call add_concept(@concept_id, @s_name_id, @f_name_id, "Family History of Diabetes", "Family History of Diabetes", "Boolean", "Misc", false);
call add_concept(@concept_id, @s_name_id, @f_name_id, "Detail of Family History of Diabetes", "Detail of Family History of Diabetes", "Text", "Misc", false);

call add_concept(@diabetes_first_visit_hba1c_percentage, @s_name_id, @f_name_id, "Diabetes, Diabetes First Visit, HbA1C Percentage", "HbA1C", "Numeric", "Finding", false);
call add_concept_numeric_db(@diabetes_first_visit_hba1c_percentage, null, null, "%");

call add_concept(@diabetes_first_visit_fasting_glucose_sugar_mmml_liter, @s_name_id, @f_name_id, "Diabetes, Fasting Glucose Sugar Mmml Liter", "Fasting Blood Sugar", "Numeric", "Finding", false);
call add_concept_numeric_db(@diabetes_first_visit_fasting_glucose_sugar_mmml_liter, null, null, "mmml/Liter");


call add_concept(@diabetes_total_cholesterol, @s_name_id, @f_name_id, "Diabetes, Total Cholesterol", "Total Cholesterol", "Numeric", "Finding", false);
call add_concept_numeric_db(@diabetes_total_cholesterol, null, null, "mg/dl");

call add_concept(@diabetes_low_density_lipoprotein_ldl, @s_name_id, @f_name_id, "Diabetes, Low Density Lipoprotein LDL", "Low Density Lipoprotein (LDL)", "Numeric", "Finding", false);
call add_concept_numeric_db(@diabetes_low_density_lipoprotein_ldl, null, null, "mg/dl");

call add_concept(@diabetes_high_density_lipoprotein_hdl, @s_name_id, @f_name_id, "Diabetes, High Density Lipoprotein HDL", "High Density Lipoprotein (HDL)", "Numeric", "Finding", false);
call add_concept_numeric_db(@diabetes_high_density_lipoprotein_hdl, null, null, "mg/dl");

call add_concept(@diabetes_triglycerides, @s_name_id, @f_name_id, "Diabetes, Triglycerides", "Triglycerides", "Numeric", "Finding", false);
call add_concept_numeric_db(@diabetes_triglycerides, null, null, "mg/dl");


call add_concept(@exercise_concept_id, @s_name_id, @f_name_id, "Diabetes, Exercise", "Exercise", "Coded", "Misc", false);
call add_concept(@none_sedentary_concept_id, @s_name_id, @f_name_id, "Diabetes Exercise, None sedentary", "None/sedentary", "N/A", "Misc", false);
call add_concept(@standing_at_work_concept_id, @s_name_id, @f_name_id, "Diabetes Exercise, Standing at Work", "Standing at Work", "N/A", "Misc", false);
call add_concept(@labor_of_work_concept_id, @s_name_id, @f_name_id, "Diabetes Exercise, Labor of work", "Labor of work", "N/A", "Misc", false);
call add_concept(@cardio_exercise_concept_id, @s_name_id, @f_name_id, "Diabetes Exercise, Cardio Exercise", "Cardio Exercise", "N/A", "Misc", false);

call add_concept_answer(@exercise_concept_id, @none_sedentary_concept_id, 1);
call add_concept_answer(@exercise_concept_id, @standing_at_work_concept_id, 2);
call add_concept_answer(@exercise_concept_id, @labor_of_work_concept_id, 3);
call add_concept_answer(@exercise_concept_id, @cardio_exercise_concept_id, 4);

call add_concept(@concept_id, @s_name_id, @f_name_id, "Diabetes, Smoking History", "Smoking History", "Boolean", "Misc", false);
call add_concept(@concept_id, @s_name_id, @f_name_id, "Diabetes, Alcohol Abuse", "Alcohol Abuse", "Boolean", "Misc", false);


call add_concept(@current_home_medication_concept_id, @s_name_id, @f_name_id, "Diabetes, Current Home Medication", "Current Home Medication", "Coded", "Misc", false);
call add_concept(@metformin_concept_id, @s_name_id, @f_name_id, "Diabetes Home Medication, Metformin", "Metformin", "N/A", "Misc", false);
call add_concept(@glipizide_concept_id, @s_name_id, @f_name_id, "Diabetes Home Medication, Glipizide", "Glipizide", "N/A", "Misc", false);
call add_concept(@insulin_70_30_concept_id, @s_name_id, @f_name_id, "Diabetes Home Medication, Insulin 70 30", "Insulin 70/30", "N/A", "Misc", false);

call add_concept_answer(@current_home_medication_concept_id, @metformin_concept_id, 1);
call add_concept_answer(@current_home_medication_concept_id, @glipizide_concept_id, 2);
call add_concept_answer(@current_home_medication_concept_id, @insulin_70_30_concept_id, 3);

