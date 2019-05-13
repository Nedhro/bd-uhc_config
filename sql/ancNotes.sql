call add_concept(@anc_married_for_concept_id, @s_name_id, @f_name_id, "ANC, Married For", "Married For", "Numeric", "Finding", false);
call add_concept_numeric_db(@anc_married_for_concept_id, null, null, "Year");

call add_concept(@anc_gravida_concept_id, @s_name_id, @f_name_id, "ANC, Gravida", "Gravida", "Numeric", "Finding", false);
call add_concept_numeric_db(@anc_gravida_concept_id, null, null, null);
call add_concept(@anc_alc_concept_id, @s_name_id, @f_name_id, "ANC, ALC", "ALC", "Numeric", "Finding", false);
call add_concept_numeric_db(@anc_alc_concept_id, null, null, null);



call add_concept(@anc_menstrual_history_concept_id, @s_name_id, @f_name_id, "ANC, Menstrual History", "Menstrual History", "Coded", "Misc", false);
call add_concept(@anc_gynae_history_regular_concept_id, @s_name_id, @f_name_id, "ANC, Gynae history Regular", "Regular", "N/A", "Misc", false);
call add_concept(@anc_gynae_history_irregular_concept_id, @s_name_id, @f_name_id, "ANC, Gynae History Irregular", "Irregular", "N/A", "Misc", false);


call add_concept_answer(@anc_menstrual_history_concept_id, @anc_gynae_history_regular_concept_id, 1);
call add_concept_answer(@anc_menstrual_history_concept_id, @anc_gynae_history_irregular_concept_id, 2);


call add_concept(@concept_id, @s_name_id, @f_name_id, "ANC, LMP", "LMP", "Date", "Misc", false);
call add_concept(@concept_id, @s_name_id, @f_name_id, "ANC, EDD", "EDD", "Date", "Misc", false);



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

call add_concept(@anc_temp_id, @s_name_id, @f_name_id, "ANC, Temperature", "Temperature", "Numeric", "Finding", false);
call add_concept_numeric_db(@anc_temp_id, null, null, "Deg F");

call add_concept(@anc_weight, @s_name_id, @f_name_id, "ANC, Weight", "Weight", "Numeric", "Finding", false);
call add_concept_numeric_db(@anc_weight, null, null, "kg");

call add_concept(@anc_anemia, @s_name_id, @f_name_id, "ANC, Anemia", "Anemia", "Numeric", "Finding", false);
call add_concept_numeric_db(@anc_anemia, null, null, null);
call add_concept(@anc_pulse, @s_name_id, @f_name_id, "ANC, Pulse", "Pulse", "Numeric", "Finding", false);
call add_concept_numeric_db(@anc_pulse, null, null, "bpm");

call add_concept(@anc_jaundice, @s_name_id, @f_name_id, "ANC, Jaundice", "Jaundice", "Numeric", "Finding", false);
call add_concept_numeric_db(@anc_jaundice, null, null, null);

call add_concept(@concept_id, @s_name_id, @f_name_id, "ANC, General Examination Others", "Others", "Text", "Misc", false);


call add_concept(@anc_fundal, @s_name_id, @f_name_id, "ANC, Fundal Height", "Fundal Height (weeks)", "Numeric", "Finding", false);
call add_concept_numeric_db(@anc_fundal, null, null, "cm");

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



call add_concept(@anc_internal_examination_effacement, @s_name_id, @f_name_id, "ANC, Effacement", "Effacement", "Coded", "Misc", false);
call add_concept(@anc_internal_examination_thirty, @s_name_id, @f_name_id, "ANC, 0 to 30 Percentage", "0-30%", "N/A", "Misc", false);
call add_concept(@anc_internal_examination_fourty_fifty, @s_name_id, @f_name_id, "ANC, 40 to 50 Percentage", "40-50%", "N/A", "Misc", false);
call add_concept(@anc_internal_examination_fifty_sixty, @s_name_id, @f_name_id, "ANC, 50 to 70 Percentage", "50-70%", "N/A", "Misc", false);
call add_concept(@anc_internal_examination_fifty_eighty, @s_name_id, @f_name_id, "ANC, 80 Percentage Plus", "80%+", "N/A", "Misc", false);

call add_concept_answer(@anc_internal_examination_effacement, @anc_internal_examination_thirty, 1);
call add_concept_answer(@anc_internal_examination_effacement, @anc_internal_examination_fourty_fifty, 2);
call add_concept_answer(@anc_internal_examination_effacement, @anc_internal_examination_fifty_sixty, 3);
call add_concept_answer(@anc_internal_examination_effacement, @anc_internal_examination_fifty_eighty, 4);


call add_concept(@anc_internal_examination_dillation, @s_name_id, @f_name_id, "ANC, Dilation", "Dilation", "Coded", "Misc", false);
call add_concept(@anc_internal_examination_closed, @s_name_id, @f_name_id, "ANC, Closed", "Closed", "N/A", "Misc", false);
call add_concept(@anc_internal_examination_one_two, @s_name_id, @f_name_id, "ANC , 1 to 2 cm", "1-2 cm", "N/A", "Misc", false);
call add_concept(@anc_internal_examination_three_four, @s_name_id, @f_name_id, "ANC, 3 to 4 cm", "3-4 cm", "N/A", "Misc", false);
call add_concept(@anc_internal_examination_five_plus, @s_name_id, @f_name_id, "ANC, 5 Plus cm", "5+ cm", "N/A", "Misc", false);

call add_concept_answer(@anc_internal_examination_dillation, @anc_internal_examination_closed, 1);
call add_concept_answer(@anc_internal_examination_dillation, @anc_internal_examination_one_two, 2);
call add_concept_answer(@anc_internal_examination_dillation, @anc_internal_examination_three_four, 3);
call add_concept_answer(@anc_internal_examination_dillation, @anc_internal_examination_five_plus, 4);

call add_concept(@anc_internal_examination_station, @s_name_id, @f_name_id, "ANC, Station", "Station", "Coded", "Misc", false);
call add_concept(@anc_internal_examination_minus_three, @s_name_id, @f_name_id, "ANC, minus 3", "-3", "N/A", "Misc", false);
call add_concept(@anc_internal_examination_minus_two, @s_name_id, @f_name_id, "ANC, minus 2", "-2", "N/A", "Misc", false);
call add_concept(@anc_internal_examination_minus_one_ten, @s_name_id, @f_name_id, "ANC, minus 1 by 10", "-1/10", "N/A", "Misc", false);
call add_concept(@anc_internal_examination_plus_one_plus_two, @s_name_id, @f_name_id, "ANC, plus 1 by plus 2", "+1/+2", "N/A", "Misc", false);

call add_concept_answer(@anc_internal_examination_station, @anc_internal_examination_minus_three, 1);
call add_concept_answer(@anc_internal_examination_station, @anc_internal_examination_minus_two, 2);
call add_concept_answer(@anc_internal_examination_station, @anc_internal_examination_minus_one_ten, 3);
call add_concept_answer(@anc_internal_examination_station, @anc_internal_examination_plus_one_plus_two, 4);


call add_concept(@concept_id, @s_name_id, @f_name_id, "ANC, Internal Examination Other", "Other", "Text", "Misc", false);
call add_concept(@anc_bishop_scoring_result, @s_name_id, @f_name_id, "ANC, Bishop Scoring Result", "Bishop Scoring Result", "Numeric", "Finding", false);
call add_concept_numeric_db(@anc_bishop_scoring_result, null, null, null);


call add_concept(@anc_obstetric_concept_id, @s_name_id, @f_name_id, "ANC, Obstetric Details", "Obstetric Details", "N/A", "Misc", true);

call add_concept(@anc_type_of_delivery, @s_name_id, @f_name_id, "ANC, Type of Delivery", "Type of Delivery", "Coded", "Misc", false);
call add_concept(@anc_vagainal_delivery, @s_name_id, @f_name_id, "ANC, Vagainal delivery", "Vagainal delivery", "N/A", "Misc", false);
call add_concept(@anc_cesarean_section, @s_name_id, @f_name_id, "ANC, Caesarean section", "Caesarean section", "N/A", "Misc", false);

call add_concept_answer(@anc_type_of_delivery, @anc_vagainal_delivery, 1);
call add_concept_answer(@anc_type_of_delivery, @anc_cesarean_section, 2);

call add_concept(@anc_delivery_outcome, @s_name_id, @f_name_id, "ANC, Delivery Outcome", "Delivery Outcome", "Coded", "Misc", false);
call add_concept(@anc_live_birth, @s_name_id, @f_name_id, "ANC, Live Birth", "Live Birth", "N/A", "Misc", false);
call add_concept(@anc_still_birth, @s_name_id, @f_name_id, "ANC, Still Birth", "Still Birth", "N/A", "Misc", false);
call add_concept(@anc_abortus, @s_name_id, @f_name_id, "ANC, Abortus", "Abortus", "N/A", "Misc", false);

call add_concept_answer(@anc_delivery_outcome, @anc_live_birth, 1);
call add_concept_answer(@anc_delivery_outcome, @anc_still_birth, 2);
call add_concept_answer(@anc_delivery_outcome, @anc_abortus, 3);

call add_concept(@anc_child_gender_concept_id, @s_name_id, @f_name_id, "ANC, Child Gender", "Child Gender", "Coded", "Misc", false);
select @baby_male := concept_id from concept_name where name = "Baby male" and concept_name_type = "FULLY_SPECIFIED" order by date_created desc limit 1;
select @baby_female := concept_id from concept_name where name = "Baby female" and concept_name_type = "FULLY_SPECIFIED" order by date_created desc limit 1;
call add_concept_answer(@anc_child_gender_concept_id, @baby_male, 1);
call add_concept_answer(@anc_child_gender_concept_id, @baby_female, 2);

call add_concept(@anc_obstetric_details_problem, @s_name_id, @f_name_id, "ANC, Problem", "Problem", "Text", "Misc", false);

call add_concept_set_members(@anc_obstetric_concept_id, @anc_type_of_delivery, 1);
call add_concept_set_members(@anc_obstetric_concept_id, @anc_delivery_outcome, 2);
call add_concept_set_members(@anc_obstetric_concept_id, @anc_child_gender_concept_id, 3);
call add_concept_set_members(@anc_obstetric_concept_id, @anc_obstetric_details_problem, 4);


call add_concept(@anc_systolic_blood_pressure_concept_id, @s_name_id, @f_name_id, "ANC, Systolic Blood Pressure", "Systolic Blood Pressure", "Numeric", "Finding", false);
call add_concept_numeric_db(@anc_systolic_blood_pressure_concept_id, 110, 140, "mmHg");

call add_concept(@anc_diastolic_blood_pressure_concept_id, @s_name_id, @f_name_id, "ANC, Diastolic Blood Pressure", "Diastolic Blood Pressure", "Numeric", "Finding", false);
call add_concept_numeric_db(@anc_diastolic_blood_pressure_concept_id, 80, 90, "mmHg");

update concept_name set name = "Fourth or more" where concept_name_type = "FULLY_SPECIFIED" and name="Four or more";
update concept_name set name = "Fourth or more" where concept_name_type = "SHORT" and name="Four or more";



