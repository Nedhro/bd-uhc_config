/*Reflexes*/
call add_concept(@neonate_reflexes_id, @s_name_id, @f_name_id, "Neonate, Reflexes", "Reflexes", "Coded", "Finding", false);
call add_concept(@neonate_reflexes_good_id, @s_name_id, @f_name_id, "Neonate, Reflexes, Good", "Good", "N/A", "Misc", false);
call add_concept(@neonate_reflexes_moderate_id, @s_name_id, @f_name_id, "Neonate, Reflexes, Moderate", "Moderate", "N/A", "Misc", false);
call add_concept(@neonate_reflexes_poor_id, @s_name_id, @f_name_id, "Neonate, Reflexes, Poor", "Poor", "N/A", "Misc", false);

call add_concept_answer(@neonate_reflexes_id, @neonate_reflexes_good_id, 1);
call add_concept_answer(@neonate_reflexes_id, @neonate_reflexes_moderate_id, 2);
call add_concept_answer(@neonate_reflexes_id, @neonate_reflexes_poor_id, 3);

/*Activities*/
call add_concept(@neonate_activities_id, @s_name_id, @f_name_id, "Neonate, Activities", "Activities", "Coded", "Finding", false);
call add_concept(@neonate_activities_good_id, @s_name_id, @f_name_id, "Neonate, Activities, Good", "Good", "N/A", "Misc", false);
call add_concept(@neonate_activities_moderate_id, @s_name_id, @f_name_id, "Neonate, Activities, Moderate", "Moderate", "N/A", "Misc", false);
call add_concept(@neonate_activities_poor_id, @s_name_id, @f_name_id, "Neonate, Activities, Poor", "Poor", "N/A", "Misc", false);

call add_concept_answer(@neonate_activities_id, @neonate_activities_good_id, 1);
call add_concept_answer(@neonate_activities_id, @neonate_activities_moderate_id, 2);
call add_concept_answer(@neonate_activities_id, @neonate_activities_poor_id, 3);


/*Color*/
call add_concept(@neonate_color_id, @s_name_id, @f_name_id, "Neonate, Color", "Color", "Coded", "Finding", false);
call add_concept(@neonate_color_pink_id, @s_name_id, @f_name_id, "Neonate, Color, Pink", "Pink", "N/A", "Misc", false);
call add_concept(@neonate_color_yellow_id, @s_name_id, @f_name_id, "Neonate, Color, Yellow", "Yellow", "N/A", "Misc", false);

call add_concept_answer(@neonate_color_id, @neonate_color_pink_id, 1);
call add_concept_answer(@neonate_color_id, @neonate_color_yellow_id, 2);


/*R/R*/

call add_concept(@neonate_rbr_id, @s_name_id, @f_name_id, "Neonate, Respiratory Rate", "Respiratory Rate(R/R)", "Numeric", "Finding", false);
call add_concept_numeric_db(@neonate_rbr_id, null, null, "min");

/*H/R*/

call add_concept(@neonate_heart_rate_id, @s_name_id, @f_name_id, "Neonate, Heart Rate", "Heart Rate(H/R)", "Numeric", "Finding", false);
call add_concept_numeric_db(@neonate_heart_rate_id, null, null, "bpm");

/*Lungs*/
call add_concept(@neonate_lungs_id, @s_name_id, @f_name_id, "Neonate, Lungs", "Lungs", "Coded", "Finding", false);
call add_concept(@neonate_lungs_vesicular_id, @s_name_id, @f_name_id, "Neonate, Lungs, Vesicular", "Vesicular", "N/A", "Misc", false);
call add_concept(@neonate_lungs_added_sound_id, @s_name_id, @f_name_id, "Neonate, Lungs, Added Sound", "Added Sound", "N/A", "Misc", false);

call add_concept_answer(@neonate_lungs_id, @neonate_lungs_vesicular_id, 1);
call add_concept_answer(@neonate_lungs_id, @neonate_lungs_added_sound_id, 2);

/*Abdomen*/
call add_concept(@neonate_abdomen_id, @s_name_id, @f_name_id, "Neonate, Abdomen", "Abdomen", "Coded", "Finding", false);
call add_concept(@neonate_abdomen_soft_id, @s_name_id, @f_name_id, "Neonate, Abdomen, Soft", "Soft", "N/A", "Misc", false);
call add_concept(@neonate_abdomen_tender_id, @s_name_id, @f_name_id, "Neonate, Abdomen, Tender", "Tender", "N/A", "Misc", false);
call add_concept(@neonate_abdomen_dis_tender_id, @s_name_id, @f_name_id, "Neonate, Abdomen, Dis-Tender", "Dis-Tender", "N/A", "Misc", false);

call add_concept_answer(@neonate_abdomen_id, @neonate_abdomen_soft_id, 1);
call add_concept_answer(@neonate_abdomen_id, @neonate_abdomen_tender_id, 2);
call add_concept_answer(@neonate_abdomen_id, @neonate_abdomen_dis_tender_id, 3);

/*OFC*/

call add_concept(@neonate_ofc_id, @s_name_id, @f_name_id, "Neonate, OFC", "OFC", "Numeric", "Finding", false);
call add_concept_numeric_db(@neonate_ofc_id, null, null, "cm");

/*Length*/

call add_concept(@neonate_length_id, @s_name_id, @f_name_id, "Neonate, Length", "Length", "Numeric", "Finding", false);
call add_concept_numeric_db(@neonate_length_id, null, null, "cm");



