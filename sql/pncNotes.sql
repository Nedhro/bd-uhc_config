call add_concept(@pnc_delivery_outcome, @s_name_id, @f_name_id, "PNC,Delivery Outcome", "Delivery Outcome", "Coded", "Finding", false);
call add_concept(@pnc_delivery_live_birth, @s_name_id, @f_name_id, "PNC,Live birth", "Live birth", "N/A", "Misc", false);
call add_concept(@pnc_delivery_still_birth, @s_name_id, @f_name_id, "PNC,Still birth", "Still birth", "N/A", "Misc", false);

call add_concept_answer(@pnc_delivery_outcome, @pnc_delivery_live_birth, 1);
call add_concept_answer(@pnc_delivery_outcome, @pnc_delivery_still_birth, 2);


call add_concept(@pnc_active_manage, @s_name_id, @f_name_id, "PNC,AMTSL(Active Management of Third Stage of Labor) Given", "AMTSL(Active Management of Third Stage of Labor) Given", "Boolean", "Misc", false);

call add_concept(@concept_id, @s_name_id, @f_name_id, "PNC,Temperature", "Temperature(Deg F)", "Numeric", "Finding", false);
call add_concept(@concept_id, @s_name_id, @f_name_id, "PNC,Pulse", "Pulse(Beats Per Minute)", "Numeric", "Finding", false);
call add_concept(@concept_id, @s_name_id, @f_name_id, "PNC,Weight", "Weight", "Numeric", "Finding", false);
call add_concept(@concept_id, @s_name_id, @f_name_id, "PNC,Anemia", "Anemia", "Numeric", "Finding", false);


call add_concept(@pnc_oedemae, @s_name_id, @f_name_id, "PNC,Oedema", "Oedema", "Coded", "Question", false);
select @oedemae_one_plus := concept_id from concept_name where name = "One Plus" and concept_name_type = "FULLY_SPECIFIED" order by date_created desc limit 1;
select @oedemae_two_plus := concept_id from concept_name where name = "Two Plus" and concept_name_type = "FULLY_SPECIFIED" order by date_created desc limit 1;
select @oedemae_three_plus := concept_id from concept_name where name = "Three Plus" and concept_name_type = "FULLY_SPECIFIED" order by date_created desc limit 1;


call add_concept_answer(@pnc_oedemae, @oedemae_one_plus, 1);
call add_concept_answer(@pnc_oedemae, @oedemae_two_plus, 2);
call add_concept_answer(@pnc_oedemae, @oedemae_three_plus, 3);

call add_concept(@concept_id, @s_name_id, @f_name_id, "PNC,Jaundice", "Jaundice", "Numeric", "Finding", false);
call add_concept(@concept_id, @s_name_id, @f_name_id, "PNC,Others", "Others", "Text", "Misc", false);



