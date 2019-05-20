--  Diabetes Follow up
call add_concept(@concept_id, @s_name_id, @f_name_id, "Diabetes Follow up, Is Patient on ARB", "Is Patient on ARB", "Boolean", "Misc", false);
call add_concept(@concept_id, @s_name_id, @f_name_id, "Diabetes Follow up, Last LDL", "Last LDL", "Text", "Misc", false);
call add_concept(@concept_id, @s_name_id, @f_name_id, "Diabetes Follow up, Last LDL Date", "Last LDL Date", "Date", "Misc", false);
call add_concept(@concept_id, @s_name_id, @f_name_id, "Diabetes Follow up, Last HDL", "Last HDL", "Text", "Misc", false);
call add_concept(@concept_id, @s_name_id, @f_name_id, "Diabetes Follow up, Last HDL Date", "Last HDL Date", "Date", "Misc", false);
call add_concept(@concept_id, @s_name_id, @f_name_id, "Diabetes Follow up, Last TG", "Last TG", "Text", "Misc", false);
call add_concept(@concept_id, @s_name_id, @f_name_id, "Diabetes Follow up, Last  TG Date", "Last  TG Date", "Date", "Misc", false);

call add_concept(@diabetes_follow_up_total_cholesterol, @s_name_id, @f_name_id, "Diabetes Follow up, Total Cholesterol", "Total Cholesterol", "Numeric", "Finding", false);
call add_concept_numeric_db(@diabetes_follow_up_total_cholesterol, null, null, null);

call add_concept(@concept_id, @s_name_id, @f_name_id, "Diabetes Follow up, Ulcer Present on Feet", "Ulcer Present on Feet", "Boolean", "Misc", false);

call add_concept(@concept_id, @s_name_id, @f_name_id, "Diabetes Follow up, Last Eye Exam Date", "Last Eye Exam Date", "Date", "Misc", false);

call add_concept(@diabetes_follow_up_systolic_data, @s_name_id, @f_name_id, "Diabetes Follow up, Systolic Data", "Systolic Data", "Numeric", "Finding", false);
call add_concept_numeric_db(@diabetes_follow_up_systolic_data, null, null, null);

call add_concept(@diabetes_follow_up_diastolic_data, @s_name_id, @f_name_id, "Diabetes Follow up, Diastolic data", "Diastolic data", "Numeric", "Finding", false);
call add_concept_numeric_db(@diabetes_follow_up_diastolic_data, null, null, null);

call add_concept(@concept_id, @s_name_id, @f_name_id, "Diabetes Follow up, HbA1C", "HbA1C", "Text", "Misc", false);

call add_concept(@concept_id, @s_name_id, @f_name_id, "Diabetes Follow up, Last Date of HbA1C", "Last Date of HbA1C", "Date", "Misc", false);

select @diabetes_follow_up_systolic_data := concept_id from concept_name where name = "Diabetes Follow up, Systolic Data" and concept_name_type = "FULLY_SPECIFIED" order by date_created desc limit 1;
update concept_numeric set units ="mmHg" where concept_id = @diabetes_follow_up_systolic_data;

select @diabetes_follow_up_diastolic_data := concept_id from concept_name where name = "Diabetes Follow up, Diastolic data" and concept_name_type = "FULLY_SPECIFIED" order by date_created desc limit 1;
update concept_numeric set units ="mmHg" where concept_id = @diabetes_follow_up_diastolic_data;

call add_concept(@diabetes_follow_up_hba1c_percentage, @s_name_id, @f_name_id, "Diabetes Follow up, HbA1C Percentage", "HbA1C", "Numeric", "Finding", false);
call add_concept_numeric_db(@diabetes_follow_up_hba1c_percentage, null, null, "%");

call add_concept(@diabetes_follow_up_last_ldl_mg_dl, @s_name_id, @f_name_id, "Diabetes Follow up, Last LDL Mg", "Last LDL", "Numeric", "Finding", false);
call add_concept_numeric_db(@diabetes_follow_up_last_ldl_mg_dl, null, null, "mg/dl");

call add_concept(@diabetes_follow_up_last_hdl_mg_dl, @s_name_id, @f_name_id, "Diabetes Follow up, Last HDL Mg", "Last HDL", "Numeric", "Finding", false);
call add_concept_numeric_db(@diabetes_follow_up_last_hdl_mg_dl, null, null, "mg/dl");

select @diabetes_follow_up_total_cholesterol := concept_id from concept_name where name = "Diabetes Follow up, Total Cholesterol" and concept_name_type = "FULLY_SPECIFIED" order by date_created desc limit 1;
update concept_numeric set units ="mg/dl" where concept_id = @diabetes_follow_up_total_cholesterol;

--ANC Note
call add_concept(@anc_married_for_concept_id, @s_name_id, @f_name_id, "ANC, Married For", "Married For", "Numeric", "Finding", false);
call add_concept_numeric_db(@anc_married_for_concept_id, null, null, null);
call add_concept(@anc_gravida_concept_id, @s_name_id, @f_name_id, "ANC, Gravida", "Gravida", "Numeric", "Finding", false);
call add_concept_numeric_db(@anc_gravida_concept_id, null, null, null);
call add_concept(@anc_alc_concept_id, @s_name_id, @f_name_id, "ANC, ALC", "ALC", "Numeric", "Finding", false);
call add_concept_numeric_db(@anc_alc_concept_id, null, null, null);

call add_concept(@concept_id, @s_name_id, @f_name_id, "ANC, LMP", "LMP", "Date", "Misc", false);
call add_concept(@concept_id, @s_name_id, @f_name_id, "ANC, EDD", "EDD", "Date", "Misc", false);

call add_concept(@anc_menstrual_history_concept_id, @s_name_id, @f_name_id, "ANC, Menstrual History", "Menstrual History", "Coded", "Misc", false);
call add_concept(@anc_gynae_history_regular_concept_id, @s_name_id, @f_name_id, "ANC, Gynae history Regular", "Regular", "N/A", "Misc", false);
call add_concept(@anc_gynae_history_irregular_concept_id, @s_name_id, @f_name_id, "ANC, Gynae History Irregular", "Irregular", "N/A", "Misc", false);


call add_concept_answer(@anc_menstrual_history_concept_id, @anc_gynae_history_regular_concept_id, 1);
call add_concept_answer(@anc_menstrual_history_concept_id, @anc_gynae_history_irregular_concept_id, 2);

call add_concept(@respiratory_system, @s_name_id, @f_name_id, "ANC, Respiratory System", "Respiratory System", "Coded", "Misc", false);
call add_concept(@respiratory_system_yes, @s_name_id, @f_name_id, "ANC, Respiratory System Yes", "Yes", "N/A", "Misc", false);
call add_concept(@respiratory_system_no, @s_name_id, @f_name_id, "ANC, Respiratory System No", "No", "N/A", "Misc", false);


call add_concept_answer(@respiratory_system, @respiratory_system_yes, 1);
call add_concept_answer(@respiratory_system, @respiratory_system_no, 2);

call add_concept(@anc_cvs, @s_name_id, @f_name_id, "ANC, CVS", "CVS", "Coded", "Misc", false);
call add_concept(@anc_cvs_yes, @s_name_id, @f_name_id, "ANC, CVS Yes", "Yes", "N/A", "Misc", false);
call add_concept(@anc_cvs_no, @s_name_id, @f_name_id, "ANC, CVS No", "No", "N/A", "Misc", false);


call add_concept_answer(@anc_cvs, @anc_cvs_yes, 1);
call add_concept_answer(@anc_cvs, @anc_cvs_no, 2);

call add_concept(@anc_urinary_track, @s_name_id, @f_name_id, "ANC, Urinary Tract", "Urinary Tract", "Coded", "Misc", false);
call add_concept(@anc_urinary_tract_yes, @s_name_id, @f_name_id, "ANC, Urinary Tract Yes", "Yes", "N/A", "Misc", false);
call add_concept(@anc_urinary_tract_no, @s_name_id, @f_name_id, "ANC, Urinary Tract No", "No", "N/A", "Misc", false);


call add_concept_answer(@anc_urinary_track, @anc_urinary_tract_yes, 1);
call add_concept_answer(@anc_urinary_track, @anc_urinary_tract_no, 2);
call add_concept(@anc_endocrine_and_metabolic_track, @s_name_id, @f_name_id, "ANC, Endocrine and Metabolic", "Endocrine and Metabolic", "Coded", "Misc", false);
call add_concept(@anc_endocrine_and_metabolic_htn, @s_name_id, @f_name_id, "ANC, Endocrine and Metabolic HTN", "HTN", "N/A", "Misc", false);
call add_concept(@anc_endocrine_and_metabolic_dm, @s_name_id, @f_name_id, "ANC, Endocrine and Metabolic DM", "DM", "N/A", "Misc", false);
call add_concept(@anc_endocrine_and_metabolic_hypothyroidism, @s_name_id, @f_name_id, "ANC, Hypothyroidism", "Hypothyroidism", "N/A", "Misc", false);
call add_concept(@anc_endocrine_and_metabolic_other, @s_name_id, @f_name_id, "ANC, Others", "Others", "N/A", "Misc", false);



call add_concept_answer(@anc_endocrine_and_metabolic_track, @anc_endocrine_and_metabolic_htn, 1);
call add_concept_answer(@anc_endocrine_and_metabolic_track, @anc_endocrine_and_metabolic_dm, 2);
call add_concept_answer(@anc_endocrine_and_metabolic_track, @anc_endocrine_and_metabolic_hypothyroidism, 3);
call add_concept_answer(@anc_endocrine_and_metabolic_track, @anc_endocrine_and_metabolic_other, 4);

call add_concept(@concept_id, @s_name_id, @f_name_id, "ANC, Others Note", "Others", "Text", "Misc", false);

call add_concept(@anc_past_surgical_history_track, @s_name_id, @f_name_id, "ANC, Past Surgical History", "Past Surgical History", "Coded", "Misc", false);
call add_concept(@anc_past_surgical_yes, @s_name_id, @f_name_id, "ANC, Past Surgical History Yes", "Yes", "N/A", "Misc", false);
call add_concept(@anc_past_surgical_no, @s_name_id, @f_name_id, "ANC, Past Surgical History No", "No", "N/A", "Misc", false);


call add_concept_answer(@anc_past_surgical_history_track, @anc_past_surgical_yes, 1);
call add_concept_answer(@anc_past_surgical_history_track, @anc_past_surgical_no, 2);
call add_concept(@anc_temp_id, @s_name_id, @f_name_id, "ANC, Temperature", "Temperature(Deg F)", "Numeric", "Finding", false);
call add_concept_numeric_db(@anc_temp_id, null, null, null);
call add_concept(@anc_weight, @s_name_id, @f_name_id, "ANC, Weight", "Weight", "Numeric", "Finding", false);
call add_concept_numeric_db(@anc_weight, null, null, null);
call add_concept(@anc_anemia, @s_name_id, @f_name_id, "ANC, Anemia", "Anemia", "Numeric", "Finding", false);
call add_concept_numeric_db(@anc_anemia, null, null, null);
call add_concept(@anc_pulse, @s_name_id, @f_name_id, "ANC, Pulse", "Pulse", "Numeric", "Finding", false);
call add_concept_numeric_db(@anc_pulse, null, null, null);
call add_concept(@anc_jaundice, @s_name_id, @f_name_id, "ANC, Jaundice", "Jaundice", "Numeric", "Finding", false);
call add_concept_numeric_db(@anc_jaundice, null, null, null);

call add_concept(@concept_id, @s_name_id, @f_name_id, "ANC, General Examination Others", "Others", "Text", "Misc", false);


call add_concept(@anc_fundal, @s_name_id, @f_name_id, "ANC, Fundal Height", "Fundal Height (weeks)", "Numeric", "Finding", false);
call add_concept_numeric_db(@anc_fundal, null, null, null);
call add_concept(@anc_fetal_movement, @s_name_id, @f_name_id, "ANC, Fetal Movement", "Fetal Movement", "Coded", "Misc", false);
call add_concept(@anc_fetal_present, @s_name_id, @f_name_id, "ANC, Fetal Present", "Present", "N/A", "Misc", false);
call add_concept(@anc_fetal_absent, @s_name_id, @f_name_id, "ANC, Fetal Absent", "Absent", "N/A", "Misc", false);

call add_concept_answer(@anc_fetal_movement, @anc_fetal_present, 1);
call add_concept_answer(@anc_fetal_movement, @anc_fetal_absent, 2);


call add_concept(@anc_heartbeat_movement, @s_name_id, @f_name_id, "ANC, Fetal Heartbeat", "Fetal Heartbeat/Sound", "Coded", "Misc", false);
call add_concept(@anc_heartbeat_present, @s_name_id, @f_name_id, "ANC, Heartbeat Present", "Present", "N/A", "Misc", false);
call add_concept(@anc_heartbeat_absent, @s_name_id, @f_name_id, "ANC, Heartbeat Absent", "Absent", "N/A", "Misc", false);

call add_concept_answer(@anc_heartbeat_movement, @anc_heartbeat_present, 1);
call add_concept_answer(@anc_heartbeat_movement, @anc_heartbeat_absent, 2);

call add_concept(@concept_id, @s_name_id, @f_name_id, "ANC, Abdominal Problem", "Problem", "Text", "Misc", false);


call add_concept(@anc_internal_examination_position, @s_name_id, @f_name_id, "ANC, Position", "Position", "Coded", "Misc", false);
call add_concept(@anc_internal_examination_posterior, @s_name_id, @f_name_id, "ANC, Posterior", "Posterior", "N/A", "Misc", false);
call add_concept(@anc_internal_examination_middle, @s_name_id, @f_name_id, "ANC, Middle", "Middle", "N/A", "Misc", false);
call add_concept(@anc_internal_examination_anterior, @s_name_id, @f_name_id, "ANC, Anterior", "Anterior", "N/A", "Misc", false);

call add_concept_answer(@anc_internal_examination_position, @anc_internal_examination_posterior, 1);
call add_concept_answer(@anc_internal_examination_position, @anc_internal_examination_middle, 2);
call add_concept_answer(@anc_internal_examination_position, @anc_internal_examination_anterior, 3);

call add_concept(@anc_internal_examination_consistency, @s_name_id, @f_name_id, "ANC, Consistency", "Consistency", "Coded", "Misc", false);
call add_concept(@anc_internal_examination_firm, @s_name_id, @f_name_id, "ANC, Firm", "Firm", "N/A", "Misc", false);
call add_concept(@anc_internal_examination_medium, @s_name_id, @f_name_id, "ANC, Medium", "Medium", "N/A", "Misc", false);
call add_concept(@anc_internal_examination_soft, @s_name_id, @f_name_id, "ANC, Soft", "Soft", "N/A", "Misc", false);

call add_concept_answer(@anc_internal_examination_consistency, @anc_internal_examination_firm, 1);
call add_concept_answer(@anc_internal_examination_consistency, @anc_internal_examination_medium, 2);
call add_concept_answer(@anc_internal_examination_consistency, @anc_internal_examination_soft, 3);

call add_concept(@concept_id, @s_name_id, @f_name_id, "ANC, Internal Examination Other", "Other", "Text", "Misc", false);

call add_concept(@anc_systolic_blood_pressure_concept_id, @s_name_id, @f_name_id, "ANC, Systolic Blood Pressure", "Systolic Blood Pressure", "Numeric", "Finding", false);
call add_concept_numeric_db(@anc_systolic_blood_pressure_concept_id, 110, 140, null);
call add_concept(@anc_diastolic_blood_pressure_concept_id, @s_name_id, @f_name_id, "ANC, Diastolic Blood Pressure", "Diastolic Blood Pressure", "Numeric", "Finding", false);
call add_concept_numeric_db(@anc_diastolic_blood_pressure_concept_id, 80, 90, null);

update concept_name set name = "ANC, Child Gender" where concept_name_type = "FULLY_SPECIFIED" and name="ANC, Chile Gender";
update concept_name set name = "ANC , 1 to 2 cm" where concept_name_type = "FULLY_SPECIFIED" and name="ANC ,1 to 2 cm";
update concept_name set name = "ANC, plus 1 by plus 2" where concept_name_type = "FULLY_SPECIFIED" and name="ANC, minus 1 by plus 2";
update concept_name set name = "Fourth or more" where concept_name_type = "FULLY_SPECIFIED" and name="Four or more";
update concept_name set name = "Fourth or more" where concept_name_type = "SHORT" and name="Four or more";

update concept_name set name = "ANC, Caesarean section" where concept_name_type = "FULLY_SPECIFIED" and name="ANC, Cesarean section";
update concept_name set name = "Caesarean section" where concept_name_type = "SHORT" and name="Cesarean section";

update concept_name set name = "ANC, Dilation" where concept_name_type = "FULLY_SPECIFIED" and name="ANC, Dillation";
update concept_name set name = "Dilation" where concept_name_type = "SHORT" and name="Dillation";


select @anc_married_for_concept_id := concept_id from concept_name where name = "ANC, Married For" and concept_name_type = "FULLY_SPECIFIED" order by date_created desc limit 1;
update concept_numeric set units ="Year" where concept_id = @anc_married_for_concept_id;

select @anc_weight := concept_id from concept_name where name = "ANC, Weight" and concept_name_type = "FULLY_SPECIFIED" order by date_created desc limit 1;
update concept_numeric set units ="kg" where concept_id = @anc_weight;

select @anc_pulse := concept_id from concept_name where name = "ANC, Pulse" and concept_name_type = "FULLY_SPECIFIED" order by date_created desc limit 1;
update concept_numeric set units ="bpm" where concept_id = @anc_pulse;

select @anc_systolic_blood_pressure_concept_id := concept_id from concept_name where name = "ANC, Systolic Blood Pressure" and concept_name_type = "FULLY_SPECIFIED" order by date_created desc limit 1;
update concept_numeric set units ="mmHg" where concept_id = @anc_systolic_blood_pressure_concept_id;

select @anc_diastolic_blood_pressure_concept_id := concept_id from concept_name where name = "ANC, Diastolic Blood Pressure" and concept_name_type = "FULLY_SPECIFIED" order by date_created desc limit 1;
update concept_numeric set units ="mmHg" where concept_id = @anc_diastolic_blood_pressure_concept_id;

select @anc_temp_id := concept_id from concept_name where name = "ANC, Temperature" and concept_name_type = "FULLY_SPECIFIED" order by date_created desc limit 1;
update concept_numeric set units ="Deg F" where concept_id = @anc_temp_id;

select @anc_fundal := concept_id from concept_name where name = "ANC, Fundal Height" and concept_name_type = "FULLY_SPECIFIED" order by date_created desc limit 1;
update concept_numeric set units ="cm" where concept_id = @anc_fundal;

--PNC Notes

call add_concept(@pnc_delivery_outcome, @s_name_id, @f_name_id, "PNC, Delivery Outcome", "Delivery Outcome", "Coded", "Finding", false);
call add_concept(@pnc_delivery_live_birth, @s_name_id, @f_name_id, "PNC, Live birth", "Live birth", "N/A", "Misc", false);
call add_concept(@pnc_delivery_still_birth, @s_name_id, @f_name_id, "PNC, Still birth", "Still birth", "N/A", "Misc", false);

call add_concept_answer(@pnc_delivery_outcome, @pnc_delivery_live_birth, 1);
call add_concept_answer(@pnc_delivery_outcome, @pnc_delivery_still_birth, 2);


call add_concept(@pnc_temperature_id, @s_name_id, @f_name_id, "PNC, Temperature", "Temperature(Deg F)", "Numeric", "Finding", false);
call add_concept_numeric_db(@pnc_temperature_id, null, null, null);
call add_concept(@pnc_pulse_concept_id, @s_name_id, @f_name_id, "PNC, Pulse", "Pulse(Beats Per Minute)", "Numeric", "Finding", false);
call add_concept_numeric_db(@pnc_pulse_concept_id, null, null, null);
call add_concept(@pnc_weight_concept_id, @s_name_id, @f_name_id, "PNC, Weight", "Weight", "Numeric", "Finding", false);
call add_concept_numeric_db(@pnc_weight_concept_id, null, null, null);
call add_concept(@pnc_anemia_concept_id, @s_name_id, @f_name_id, "PNC, Anemia", "Anemia", "Numeric", "Finding", false);
call add_concept_numeric_db(@pnc_anemia_concept_id, null, null, null);
call add_concept(@pnc_oedemae, @s_name_id, @f_name_id, "PNC, Oedema", "Oedema", "Coded", "Question", false);
select @oedemae_one_plus := concept_id from concept_name where name = "One Plus" and concept_name_type = "FULLY_SPECIFIED" order by date_created desc limit 1;
select @oedemae_two_plus := concept_id from concept_name where name = "Two Plus" and concept_name_type = "FULLY_SPECIFIED" order by date_created desc limit 1;
select @oedemae_three_plus := concept_id from concept_name where name = "Three Plus" and concept_name_type = "FULLY_SPECIFIED" order by date_created desc limit 1;


call add_concept_answer(@pnc_oedemae, @oedemae_one_plus, 1);
call add_concept_answer(@pnc_oedemae, @oedemae_two_plus, 2);
call add_concept_answer(@pnc_oedemae, @oedemae_three_plus, 3);

call add_concept(@pnc_jaundiceconcept_id, @s_name_id, @f_name_id, "PNC, Jaundice", "Jaundice", "Numeric", "Finding", false);
call add_concept_numeric_db(@pnc_jaundiceconcept_id, null, null, null);

call add_concept(@concept_id, @s_name_id, @f_name_id, "PNC, Others", "Others", "Text", "Misc", false);

call add_concept(@pnc_fundal_heightconcept_id, @s_name_id, @f_name_id, "PNC, Fundal Height", "Fundal Height(Weeks)", "Numeric", "Finding", false);
call add_concept_numeric_db(@pnc_fundal_heightconcept_id, null, null, null);

call add_concept(@pnc_abdominal, @s_name_id, @f_name_id, "PNC, Abdominal wound", "Abdominal wound", "Coded", "Misc", false);
call add_concept(@pnc_abdominal_healthy_concept_id, @s_name_id, @f_name_id, "PNC, Healthy", "Healthy", "N/A", "Misc", false);
call add_concept(@pnc_abdominal_infected_concept_id, @s_name_id, @f_name_id, "PNC, Infected", "Infected", "N/A", "Misc", false);

call add_concept_answer(@pnc_abdominal, @pnc_abdominal_healthy_concept_id, 1);
call add_concept_answer(@pnc_abdominal, @pnc_abdominal_infected_concept_id, 2);

call add_concept(@concept_id, @s_name_id, @f_name_id, "PNC, Abdominal Others", "Others", "Text", "Misc", false);

call add_concept(@concept_id, @s_name_id, @f_name_id, "PNC, Excessive Vaginal Bleeding", "Excessive Vaginal Bleeding", "Boolean", "Misc", false);
call add_concept(@concept_id, @s_name_id, @f_name_id, "PNC, Vaginal Discharge", "Vaginal Discharge", "Boolean", "Misc", false);

call add_concept(@pnc_perineal_concept_id, @s_name_id, @f_name_id, "PNC, Perineal Tear Or Episiotomy Wound", "PNC,Perineal Tear/Episiotomy Wound", "Coded", "Misc", false);
call add_concept(@pnc_perineal_healthy_concept_id, @s_name_id, @f_name_id, "PNC Perineal, Healthy", "Healthy", "N/A", "Misc", false);
call add_concept(@pnc_perineal_infectedconcept_id, @s_name_id, @f_name_id, "PNC, Perineal Infected", "Infected", "N/A", "Misc", false);

call add_concept_answer(@pnc_perineal_concept_id, @pnc_perineal_healthy_concept_id, 1);
call add_concept_answer(@pnc_perineal_concept_id, @pnc_perineal_infectedconcept_id, 2);



call add_concept(@pnc_systolic_blood_pressure_concept_id, @s_name_id, @f_name_id, "PNC, Systolic Blood Pressure", "Systolic Blood Pressure", "Numeric", "Finding", false);
call add_concept_numeric_db(@pnc_systolic_blood_pressure_concept_id, 110, 140, null);
call add_concept(@pnc_diastolic_blood_pressure_concept_id, @s_name_id, @f_name_id, "PNC, Diastolic Blood Pressure", "Diastolic Blood Pressure", "Numeric", "Finding", false);
call add_concept_numeric_db(@pnc_diastolic_blood_pressure_concept_id, 80, 90, null);


select @pnc_baby_note := concept_id from concept_name where name = "PNC, Baby Notes" and concept_name_type = "FULLY_SPECIFIED" order by date_created desc limit 1;
call add_concept(@pnc_baby_note_apgar_one_concept_id, @s_name_id, @f_name_id, "PNC, Baby Note APGAR score at 1 Minutes", "APGAR score at 1 Minutes", "Numeric", "Finding", false);
call add_concept_numeric_db(@pnc_baby_note_apgar_one_concept_id, null, null, null);

call add_concept_set_members(@pnc_baby_note, @pnc_baby_note_apgar_one_concept_id, 3);

update concept_name set name = "PNC, Child Gender" where concept_name_type = "FULLY_SPECIFIED" and name="PNC,Child Gender";
update concept_name set name = "PNC, Baby Note Weight" where concept_name_type = "FULLY_SPECIFIED" and name="PNC,Baby Note Weight";
update concept_name set name = "PNC, Delivery Baby Note" where concept_name_type = "FULLY_SPECIFIED" and name="PNC, Delivary Baby Note";

select @pnc_weight_concept_id := concept_id from concept_name where name = "PNC, Weight" and concept_name_type = "FULLY_SPECIFIED" order by date_created desc limit 1;
update concept_numeric set units ="kg" where concept_id = @pnc_weight_concept_id;

select @pnc_pulse_concept_id := concept_id from concept_name where name = "PNC, Pulse" and concept_name_type = "FULLY_SPECIFIED" order by date_created desc limit 1;
update concept_numeric set units ="bpm" where concept_id = @pnc_pulse_concept_id;

--Gynae Case
call add_concept(@menstrual_period_concept_id, @s_name_id, @f_name_id, "Gynae Case, Menstrual Period days", "Menstrual Period (days)", "Numeric", "Finding", false);
call add_concept_numeric_db(@menstrual_period_concept_id, null, null, null);

call add_concept(@menstrual_cycle_concept_id, @s_name_id, @f_name_id, "Gynae Case, Menstrual Cycle days", "Menstrual Cycle (days)", "Numeric", "Finding", false);
call add_concept_numeric_db(@menstrual_cycle_concept_id, null, null, null);

call add_concept(@obstetric_history_married_for, @s_name_id, @f_name_id, "Gynae Case, Married For", "Married For", "Numeric", "Finding", false);
call add_concept_numeric_db(@obstetric_history_married_for, null, null, null);


call add_concept(@anc_bishop_scoring_result, @s_name_id, @f_name_id, "ANC, Bishop Scoring Result", "Bishop Scoring Result", "Numeric", "Finding", false);
call add_concept_numeric_db(@anc_bishop_scoring_result, null, null, null);

select @medication_received_concept_id := concept_id from concept_name where name = "PNC, Medication received during delivery" and concept_name_type = "FULLY_SPECIFIED" order by date_created desc limit 1;
update concept_name set name = "Medication received during delivery" where concept_name_type = "SHORT" and concept_id=@medication_received_concept_id;


select @gynae_married_for_concept_id := concept_id from concept_name where name = "Gynae Case, Married For" and concept_name_type = "FULLY_SPECIFIED" order by date_created desc limit 1;
update concept_numeric set units ="Year" where concept_id = @gynae_married_for_concept_id;

--diabetes first visit

call add_concept(@diabetes_first_visit_last_known_hba1c_result_percentage, @s_name_id, @f_name_id, "Diabetes, Last Known HbA1C Result Percentage", "Last Known HbA1C Result", "Numeric", "Finding", false);
call add_concept_numeric_db(@diabetes_first_visit_last_known_hba1c_result_percentage, null, null, "%");

call add_concept(@diabetes_first_visit_last_known_fasting_blood_sugar_mmml_liter, @s_name_id, @f_name_id, "Diabetes, Last Known Fasting Blood Sugar Mmml Liter", "Last Known Fasting Blood Sugar", "Numeric", "Finding", false);
call add_concept_numeric_db(@diabetes_first_visit_last_known_fasting_blood_sugar_mmml_liter, null, null, "mmml/Liter");

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










