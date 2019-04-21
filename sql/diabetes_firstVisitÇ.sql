call add_concept(@concept_id, @s_name_id, @f_name_id, "Date of Last Visit", "Date of Last Visit", "Date", "Misc", false);
call add_concept(@concept_id, @s_name_id, @f_name_id, "Previous Follow Up Location", "Previous Follow Up Location", "Text", "Misc", false);

call add_concept(@diagnosis_confirmed_concept_id, @s_name_id, @f_name_id, "Diagnosis Confirmed", "Diagnosis Confirmed", "Coded", "Misc", false);
call add_concept(@no_Previous_diagnosis_id, @s_name_id, @f_name_id, "No Previous Diagnosis", "No Previous Diagnosis", "N/A", "Misc", false);
call add_concept(@confirmed_elsewhereconcept_id, @s_name_id, @f_name_id, "Confirmed Elsewhere", "Confirmed Elsewhere", "N/A", "Misc", false);

call add_concept_answer(@diagnosis_confirmed_concept_id, @no_Previous_diagnosis_id, 1);
call add_concept_answer(@diagnosis_confirmed_concept_id, @confirmed_elsewhereconcept_id, 2);

call add_concept(@diabetic_type_concept_id, @s_name_id, @f_name_id, "Diabetic Type", "Diabetic Type", "Coded", "Misc", false);
call add_concept(@type_1_dM_id, @s_name_id, @f_name_id, "Type 1 DM", "Type 1 DM", "N/A", "Misc", false);
call add_concept(@type_2_dM_id, @s_name_id, @f_name_id, "Type 2 DM", "Type 2 DM", "N/A", "Misc", false);

call add_concept_answer(@diabetic_type_concept_id, @type_1_dM_id, 1);
call add_concept_answer(@diabetic_type_concept_id, @type_2_dM_id, 2);

call add_concept(@concept_id, @s_name_id, @f_name_id, "Last Known HbA1C Date", "Last Known HbA1C Date", "Date", "Misc", false);
call add_concept(@concept_id, @s_name_id, @f_name_id, "Last Known HbA1C Result", "Last Known HbA1C Result", "Text", "Misc", false);

call add_concept(@concept_id, @s_name_id, @f_name_id, "Last Known Fasting Blood Sugar Date", "Last Known Fasting Blood Sugar Date", "Date", "Misc", false);
call add_concept(@concept_id, @s_name_id, @f_name_id, "Last Known Fasting Blood Sugar", "Last Known Fasting Blood Sugar", "Text", "Misc", false);


call add_concept(@if_new_Patient_suspicion_concept_id, @s_name_id, @f_name_id, "If New Patient /Suspicion", "If New Patient /Suspicion", "Coded", "Misc", false);
call add_concept(@polyuria_concept_id, @s_name_id, @f_name_id, "Polyuria", "Polyuria", "N/A", "Misc", false);
call add_concept(@blurred_vision_concept_id, @s_name_id, @f_name_id, "Blurred Vision", "Blurred Vision", "N/A", "Misc", false);
call add_concept(@polydipsia_concept_id, @s_name_id, @f_name_id, "Polydipsia", "Polydipsia", "N/A", "Misc", false);
call add_concept(@nocturia_concept_id, @s_name_id, @f_name_id, "Nocturia", "Nocturia", "N/A", "Misc", false);
call add_concept(@weight_loss_concept_id, @s_name_id, @f_name_id, "Weight Loss", "Weight Loss", "N/A", "Misc", false);

call add_concept_answer(@if_new_Patient_suspicion_concept_id, @polyuria_concept_id, 1);
call add_concept_answer(@if_new_Patient_suspicion_concept_id, @blurred_vision_concept_id, 2);
call add_concept_answer(@if_new_Patient_suspicion_concept_id, @polydipsia_concept_id, 3);
call add_concept_answer(@if_new_Patient_suspicion_concept_id, @nocturia_concept_id, 4);
call add_concept_answer(@if_new_Patient_suspicion_concept_id, @weight_loss_concept_id, 5);

call add_concept(@concept_id, @s_name_id, @f_name_id, "Family History of Diabetes", "Family History of Diabetes", "Boolean", "Misc", false);
call add_concept(@concept_id, @s_name_id, @f_name_id, "Detail of Family History of Diabetes", "Detail of Family History of Diabetes", "Text", "Misc", false);

call add_concept(@concept_id, @s_name_id, @f_name_id, "HbA1C", "HbA1C", "Text", "Misc", false);
call add_concept(@concept_id, @s_name_id, @f_name_id, "Fasting Glucose Sugar", "Fasting Glucose Sugar", "Text", "Misc", false);
call add_concept(@concept_id, @s_name_id, @f_name_id, "Lipid Panel", "Lipid Panel", "Text", "Misc", false);



call add_concept(@exercise_concept_id, @s_name_id, @f_name_id, "Exercise", "Exercise", "Coded", "Misc", false);
call add_concept(@none_sedentary_concept_id, @s_name_id, @f_name_id, "None/sedentary", "None/sedentary", "N/A", "Misc", false);
call add_concept(@standing_at_work_concept_id, @s_name_id, @f_name_id, "Standing at Work", "Standing at Work", "N/A", "Misc", false);
call add_concept(@labor_of_work_concept_id, @s_name_id, @f_name_id, "Labor of work", "Labor of work", "N/A", "Misc", false);
call add_concept(@cardio_exercise_concept_id, @s_name_id, @f_name_id, "Cardio Exercise", "Cardio Exercise", "N/A", "Misc", false);

call add_concept_answer(@exercise_concept_id, @none_sedentary_concept_id, 1);
call add_concept_answer(@exercise_concept_id, @standing_at_work_concept_id, 2);
call add_concept_answer(@exercise_concept_id, @labor_of_work_concept_id, 3);
call add_concept_answer(@exercise_concept_id, @cardio_exercise_concept_id, 4);

call add_concept(@concept_id, @s_name_id, @f_name_id, "Smoking History", "Smoking History", "Boolean", "Misc", false);
call add_concept(@concept_id, @s_name_id, @f_name_id, "Alcohol Abuse", "Alcohol Abuse", "Boolean", "Misc", false);


call add_concept(@current_home_medication_concept_id, @s_name_id, @f_name_id, "Current Home Medication", "Current Home Medication", "Coded", "Misc", false);
call add_concept(@metformin_concept_id, @s_name_id, @f_name_id, "Metformin", "Metformin", "N/A", "Misc", false);
call add_concept(@glipizide_concept_id, @s_name_id, @f_name_id, "Glipizide", "Glipizide", "N/A", "Misc", false);
call add_concept(@insulin_70_30_concept_id, @s_name_id, @f_name_id, "insulin 70/30", "insulin 70/30", "N/A", "Misc", false);

call add_concept_answer(@current_home_medication_concept_id, @metformin_concept_id, 1);
call add_concept_answer(@current_home_medication_concept_id, @glipizide_concept_id, 2);
call add_concept_answer(@current_home_medication_concept_id, @insulin_70_30_concept_id, 3);



call add_concept(@concept_id, @s_name_id, @f_name_id, "Is Patient on ARB", "Is Patient on ARB", "Boolean", "Misc", false);
call add_concept(@concept_id, @s_name_id, @f_name_id, "Last LDL", "Last LDL", "Text", "Misc", false);
call add_concept(@concept_id, @s_name_id, @f_name_id, "Last LDL Date", "Last LDL Date", "Date", "Misc", false);
call add_concept(@concept_id, @s_name_id, @f_name_id, "Last HDL", "Last HDL", "Text", "Misc", false);
call add_concept(@concept_id, @s_name_id, @f_name_id, "Last HDL Date", "Last HDL Date", "Date", "Misc", false);
call add_concept(@concept_id, @s_name_id, @f_name_id, "Last TG", "Last TG", "Text", "Misc", false);
call add_concept(@concept_id, @s_name_id, @f_name_id, "Last  TG Date", "Last  TG Date", "Date", "Misc", false);

call add_concept(@concept_id, @s_name_id, @f_name_id, "Total Cholesterol", "Total Cholesterol", "Text", "Misc", false);

call add_concept(@concept_id, @s_name_id, @f_name_id, "Ulcer Present on Feet", "Ulcer Present on Feet", "Boolean", "Misc", false);

call add_concept(@concept_id, @s_name_id, @f_name_id, "Last Eye Exam Date", "Last Eye Exam Date", "Date", "Misc", false);
