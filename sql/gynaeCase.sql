call add_concept(@menstrual_history_concept_id, @s_name_id, @f_name_id, "Gynae Case, Gynae History, Menstrual History", "Menstrual History", "Coded", "Misc", false);
call add_concept(@menstrual_history_regullar_id, @s_name_id, @f_name_id, "Gynae Case, Gynae History Status, Regular", "Regular", "N/A", "Misc", false);
call add_concept(@menstrual_history_irregular_id, @s_name_id, @f_name_id, "Gynae Case, Gynae History Status, Irregular", "Irregular", "N/A", "Misc", false);

call add_concept_answer(@menstrual_history_concept_id, @menstrual_history_regullar_id, 1);
call add_concept_answer(@menstrual_history_concept_id, @menstrual_history_irregular_id, 2);

call add_concept(@menstrual_period_concept_id, @s_name_id, @f_name_id, "Gynae Case, Menstrual Period days", "Menstrual Period (days)", "Numeric", "Finding", false);
call add_concept_numeric_db(@menstrual_period_concept_id, null, null, null);

call add_concept(@menstrual_cycle_concept_id, @s_name_id, @f_name_id, "Gynae Case, Menstrual Cycle days", "Menstrual Cycle (days)", "Numeric", "Finding", false);
call add_concept_numeric_db(@menstrual_cycle_concept_id, null, null, null);

call add_concept(@menstrual_flow_concept_id, @s_name_id, @f_name_id, "Gynae Case, Gynae History, Menstrual Flow", "Menstrual Flow", "Coded", "Misc", false);
call add_concept(@menstrual_flow_avgerage_id, @s_name_id, @f_name_id, "Gynae Case, Menstrual Flow Status, Avgerage", "Avgerage", "N/A", "Misc", false);
call add_concept(@menstrual_flow_scanty_id, @s_name_id, @f_name_id, "Gynae Case, Menstrual Flow Status, Scanty", "Scanty", "N/A", "Misc", false);
call add_concept(@menstrual_flow_heavy_id, @s_name_id, @f_name_id, "Gynae Case, Menstrual Flow Status, Heavy", "Heavy", "N/A", "Misc", false);

call add_concept_answer(@menstrual_flow_concept_id, @menstrual_flow_avgerage_id, 1);
call add_concept_answer(@menstrual_flow_concept_id, @menstrual_flow_scanty_id, 2);
call add_concept_answer(@menstrual_flow_concept_id, @menstrual_flow_heavy_id, 3);

call add_concept(@dysmenorrhoea_concept_id, @s_name_id, @f_name_id, "Gynae Case, Gynae History, Dysmenorrhoea", "Dysmenorrhoea", "Coded", "Misc", false);
call add_concept(@dysmenorrhoea_present_id, @s_name_id, @f_name_id, "Gynae Case, Dysmenorrhoea Status, Present", "Present", "N/A", "Misc", false);
call add_concept(@dysmenorrhoea_absent_id, @s_name_id, @f_name_id, "Gynae Case, Dysmenorrhoea Status, Absent", "Absent", "N/A", "Misc", false);

call add_concept_answer(@dysmenorrhoea_concept_id, @dysmenorrhoea_present_id, 1);
call add_concept_answer(@dysmenorrhoea_concept_id, @dysmenorrhoea_absent_id, 2);

call add_concept(@concept_id, @s_name_id, @f_name_id, "Gynae Case, Gynae History, LMP", "LMP", "Date", "Misc", false);

call add_concept(@obstetric_history_married_for, @s_name_id, @f_name_id, "Gynae Case, Obstetric History, Married For", "Married For", "Numeric", "Finding", false);
call add_concept_numeric_db(@obstetric_history_married_for, null, null, null);

call add_concept(@obstetric_history_para_concept_id, @s_name_id, @f_name_id, "Gynae Case, Obstetric History, Para", "Para", "Numeric", "Finding", false);
call add_concept_numeric_db(@obstetric_history_para_concept_id, null, null, null);

call add_concept(@obstetric_history_gravida_concept_id, @s_name_id, @f_name_id, "Gynae Case, Obstetric History, Gravida", "Gravida", "Numeric", "Finding", false);
call add_concept_numeric_db(@obstetric_history_gravida_concept_id, null, null, null);

call add_concept(@obstetric_history_alc_concept_id, @s_name_id, @f_name_id, "Gynae Case, Obstetric History, ALC", "ALC", "Numeric", "Finding", false);
call add_concept_numeric_db(@obstetric_history_alc_concept_id, null, null, null);

call add_concept(@contraceptive_history_concept_id, @s_name_id, @f_name_id, "Gynae Case, Contraceptive History", "Contraceptive History", "Coded", "Misc", false);
call add_concept(@no_concept_id, @s_name_id, @f_name_id, "Gynae Case, Contraceptive History Status, No", "No", "N/A", "Misc", false);
call add_concept(@barrier_concept_id, @s_name_id, @f_name_id, "Gynae Case, Contraceptive History Status, Barrier", "Barrier", "N/A", "Misc", false);
call add_concept(@ocp_concept_id, @s_name_id, @f_name_id, "Gynae Case, Contraceptive History Status, OCP", "OCP", "N/A", "Misc", false);
call add_concept(@dmpa_concept_id, @s_name_id, @f_name_id, "Gynae Case, Contraceptive History Status, DMPA", "DMPA", "N/A", "Misc", false);
call add_concept(@implant_concept_id, @s_name_id, @f_name_id, "Gynae Case, Contraceptive History Status, Implant", "Implant", "N/A", "Misc", false);
call add_concept(@cut_concept_id, @s_name_id, @f_name_id, "Gynae Case, Contraceptive History Status, Cu-T", "Cu-T", "N/A", "Misc", false);
call add_concept(@others_concept_id, @s_name_id, @f_name_id, "Gynae Case, Contraceptive History Status, Others", "Others", "N/A", "Misc", false);

call add_concept_answer(@contraceptive_history_concept_id, @no_concept_id, 1);
call add_concept_answer(@contraceptive_history_concept_id, @barrier_concept_id, 2);
call add_concept_answer(@contraceptive_history_concept_id, @ocp_concept_id, 3);
call add_concept_answer(@contraceptive_history_concept_id, @dmpa_concept_id, 4);
call add_concept_answer(@contraceptive_history_concept_id, @implant_concept_id, 5);
call add_concept_answer(@contraceptive_history_concept_id, @cut_concept_id, 6);
call add_concept_answer(@contraceptive_history_concept_id, @others_concept_id, 7);