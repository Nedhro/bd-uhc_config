call add_concept(@pnc_delivery_outcome, @s_name_id, @f_name_id, "PNC,Delivery Outcome", "Delivery Outcome", "Coded", "Finding", false);
call add_concept(@pnc_delivery_live_birth, @s_name_id, @f_name_id, "PNC,Live birth", "Live birth", "N/A", "Misc", false);
call add_concept(@pnc_delivery_still_birth, @s_name_id, @f_name_id, "PNC,Still birth", "Still birth", "N/A", "Misc", false);

call add_concept_answer(@pnc_delivery_outcome, @pnc_delivery_live_birth, 1);
call add_concept_answer(@pnc_delivery_outcome, @pnc_delivery_still_birth, 2);


call add_concept(@pnc_active_manage, @s_name_id, @f_name_id, "PNC,AMTSL(Active Management of Third Stage of Labor) Given", "AMTSL(Active Management of Third Stage of Labor) Given", "Boolean", "Misc", false);

call add_concept(@pnc_temperature_id, @s_name_id, @f_name_id, "PNC,Temperature", "Temperature(Deg F)", "Numeric", "Finding", false);
call add_concept_numeric_db(@pnc_temperature_id, null, null, null);
call add_concept(@pnc_pulse_concept_id, @s_name_id, @f_name_id, "PNC,Pulse", "Pulse(Beats Per Minute)", "Numeric", "Finding", false);
call add_concept_numeric_db(@pnc_pulse_concept_id, null, null, null);
call add_concept(@pnc_weight_concept_id, @s_name_id, @f_name_id, "PNC,Weight", "Weight", "Numeric", "Finding", false);
call add_concept_numeric_db(@pnc_weight_concept_id, null, null, null);
call add_concept(@pnc_anemia_concept_id, @s_name_id, @f_name_id, "PNC,Anemia", "Anemia", "Numeric", "Finding", false);
call add_concept_numeric_db(@pnc_anemia_concept_id, null, null, null);


call add_concept(@pnc_oedemae, @s_name_id, @f_name_id, "PNC,Oedema", "Oedema", "Coded", "Question", false);
select @oedemae_one_plus := concept_id from concept_name where name = "One Plus" and concept_name_type = "FULLY_SPECIFIED" order by date_created desc limit 1;
select @oedemae_two_plus := concept_id from concept_name where name = "Two Plus" and concept_name_type = "FULLY_SPECIFIED" order by date_created desc limit 1;
select @oedemae_three_plus := concept_id from concept_name where name = "Three Plus" and concept_name_type = "FULLY_SPECIFIED" order by date_created desc limit 1;


call add_concept_answer(@pnc_oedemae, @oedemae_one_plus, 1);
call add_concept_answer(@pnc_oedemae, @oedemae_two_plus, 2);
call add_concept_answer(@pnc_oedemae, @oedemae_three_plus, 3);

call add_concept(@pnc_jaundiceconcept_id, @s_name_id, @f_name_id, "PNC,Jaundice", "Jaundice", "Numeric", "Finding", false);
call add_concept_numeric_db(@pnc_jaundiceconcept_id, null, null, null);

call add_concept(@concept_id, @s_name_id, @f_name_id, "PNC,Others", "Others", "Text", "Misc", false);

call add_concept(@pnc_fundal_heightconcept_id, @s_name_id, @f_name_id, "PNC,Fundal Height", "Fundal Height(Weeks)", "Numeric", "Finding", false);
call add_concept_numeric_db(@pnc_fundal_heightconcept_id, null, null, null);

call add_concept(@pnc_abdominal, @s_name_id, @f_name_id, "PNC,Abdominal wound", "Abdominal wound", "Coded", "Misc", false);
call add_concept(@pnc_abdominal_healthy_concept_id, @s_name_id, @f_name_id, "PNC,Healthy", "Healthy", "N/A", "Misc", false);
call add_concept(@pnc_abdominal_infected_concept_id, @s_name_id, @f_name_id, "PNC,Infected", "Infected", "N/A", "Misc", false);

call add_concept_answer(@pnc_abdominal, @pnc_abdominal_healthy_concept_id, 1);
call add_concept_answer(@pnc_abdominal, @pnc_abdominal_infected_concept_id, 2);

call add_concept(@concept_id, @s_name_id, @f_name_id, "PNC,Abdomina Other", "Others", "Text", "Misc", false);

call add_concept(@concept_id, @s_name_id, @f_name_id, "PNC,Excesive Veginal bleeding", "Excesive Veginal bleeding", "Boolean", "Misc", false);
call add_concept(@concept_id, @s_name_id, @f_name_id, "PNC,Vaginal Discharge", "Vaginal Discharge", "Boolean", "Misc", false);

call add_concept(@pnc_perineal_concept_id, @s_name_id, @f_name_id, "PNC,Perineal Tear Or Episiotomy Wound", "PNC,Perineal Tear/Episiotomy Wound", "Coded", "Misc", false);
call add_concept(@pnc_perineal_healthy_concept_id, @s_name_id, @f_name_id, "PNC Perineal,Healthy", "Healthy", "N/A", "Misc", false);
call add_concept(@pnc_perineal_infectedconcept_id, @s_name_id, @f_name_id, "PNC,Perineal Infected", "Infected", "N/A", "Misc", false);

call add_concept_answer(@pnc_perineal_concept_id, @pnc_perineal_healthy_concept_id, 1);
call add_concept_answer(@pnc_perineal_concept_id, @pnc_perineal_infectedconcept_id, 2);



call add_concept(@pnc_systolic_blood_pressure_concept_id, @s_name_id, @f_name_id, "PNC,Systolic Blood Pressure", "Systolic Blood Pressure", "Numeric", "Finding", false);
call add_concept_numeric_db(@pnc_systolic_blood_pressure_concept_id, 110, 140, null);
call add_concept(@pnc_diastolic_blood_pressure_concept_id, @s_name_id, @f_name_id, "PNC,Diastolic Blood Pressure", "Diastolic Blood Pressure", "Numeric", "Finding", false);
call add_concept_numeric_db(@pnc_diastolic_blood_pressure_concept_id, 80, 90, null);



call add_concept(@pnc_baby_note_concept_id, @s_name_id, @f_name_id, "PNC, Baby Notes", "Baby Notes", "N/A", "Misc", true);
call add_concept(@pnc_child_gender_concept_id, @s_name_id, @f_name_id, "PNC,Child Gender", "Child Gender", "Coded", "Misc", false);
select @baby_male := concept_id from concept_name where name = "Baby male" and concept_name_type = "FULLY_SPECIFIED" order by date_created desc limit 1;
select @baby_female := concept_id from concept_name where name = "Baby female" and concept_name_type = "FULLY_SPECIFIED" order by date_created desc limit 1;
call add_concept_answer(@pnc_child_gender_concept_id, @baby_male, 1);
call add_concept_answer(@pnc_child_gender_concept_id, @baby_female, 2);

call add_concept(@pnc_baby_note_weight_concept_id, @s_name_id, @f_name_id, "PNC,Baby Note Weight", "Weight", "Numeric", "Finding", false);
call add_concept_numeric_db(@pnc_baby_note_weight_concept_id, null, null, null);
call add_concept(@pnc_baby_note_apgar_one_concept_id, @s_name_id, @f_name_id, "PNC, APGAR score at 1 Minutes", "APGAR score at 1 Minutes", "Numeric", "Finding", false);
call add_concept_numeric_db(@pnc_baby_note_apgar_one_concept_id, null, null, null);
call add_concept(@pnc_baby_note_apgar_five_concept_id, @s_name_id, @f_name_id, "PNC, APGAR score at 5 Minutes", "APGAR score at 5 Minutes", "Numeric", "Finding", false);
call add_concept_numeric_db(@pnc_baby_note_apgar_five_concept_id, null, null, null);
call add_concept(@pnc_date_and_time_of_born_concept_id, @s_name_id, @f_name_id, "PNC, Date and Time of Birth", "Date and Time of Birth", "Datetime", "Question", false);
call add_concept(@pnc_baby_note_delivery_note_concept_id, @s_name_id, @f_name_id, "PNC, Delivary Baby Note", "Baby Note", "Text", "Misc", false);

call add_concept_set_members(@pnc_baby_note_concept_id, @pnc_child_gender_concept_id, 1);
call add_concept_set_members(@pnc_baby_note_concept_id, @pnc_baby_note_weight_concept_id, 2);
call add_concept_set_members(@pnc_baby_note_concept_id, @pnc_baby_note_apgar_one_concept_id, 3);
call add_concept_set_members(@pnc_baby_note_concept_id, @pnc_baby_note_apgar_five_concept_id, 4);
call add_concept_set_members(@pnc_baby_note_concept_id, @pnc_date_and_time_of_born_concept_id, 5);
call add_concept_set_members(@pnc_baby_note_concept_id, @pnc_baby_note_delivery_note_concept_id, 6);


call add_concept(@concept_id, @s_name_id, @f_name_id, "PNC, Date and Time of Delivery", "Date and Time of Birth", "Datetime", "Question", false);

call add_concept(@pnc_mood_of_delivery, @s_name_id, @f_name_id, "PNC, Mode of Delivery", "Mode of Delivery", "Coded", "Question", false);
select @pnc_vaginal_face_delivery := concept_id from concept_name where name = "Vaginal face delivery" and concept_name_type = "FULLY_SPECIFIED" order by date_created desc limit 1;
select @single_caesarean := concept_id from concept_name where name = "O82 Single delivery by caesarean section" and concept_name_type = "FULLY_SPECIFIED" order by date_created desc limit 1;

call add_concept_answer(@pnc_mood_of_delivery, @pnc_vaginal_face_delivery, 1);
call add_concept_answer(@pnc_mood_of_delivery, @single_caesarean, 2);

call add_concept(@pnc_medication_during_delivery, @s_name_id, @f_name_id, "PNC, Medication received during delivery", "Mode of Delivery", "Coded", "Question", false);
select @pnc_misopostol := concept_id from concept_name where name = "Misoprostol" and concept_name_type = "FULLY_SPECIFIED" order by date_created desc limit 1;
select @pnc_oxytocin := concept_id from concept_name where name = "Oxytocin" and concept_name_type = "FULLY_SPECIFIED" order by date_created desc limit 1;

call add_concept_answer(@pnc_medication_during_delivery, @pnc_misopostol, 1);
call add_concept_answer(@pnc_medication_during_delivery, @pnc_oxytocin, 2);

call add_concept(@concept_id, @s_name_id, @f_name_id, "PNC, Indication", "Indication", "Text", "Misc", false);








