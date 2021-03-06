-- sajida config
update idgen_identifier_source set name="SHK", description="ID sequence source for patients in Keraniganj" where name="BDH";
select @identier_id := id from idgen_identifier_source where name="SHK";
update idgen_seq_id_gen set prefix="SHK" where id=@identier_id;
-- location
SELECT @location_id := location_id FROM location WHERE name='Sajida Health Center-Keraniganj (10020242)' LIMIT 1;
update location set parent_location=@location_id,state_province="Dhaka",county_district="Dhaka",address4="Keraniganj Paurashava",address5="Keraniganj" where name="Emergency";
update location set parent_location=@location_id,state_province="Dhaka",county_district="Dhaka",address4="Keraniganj Paurashava",address5="Keraniganj" where name="IPD";
update location set parent_location=@location_id,state_province="Dhaka",county_district="Dhaka",address4="Keraniganj Paurashava",address5="Keraniganj" where name="OPD";
update location set parent_location=@location_id,state_province="Dhaka",county_district="Dhaka",address4="Keraniganj Paurashava",address5="Keraniganj" where name="OT";
update location set parent_location=@location_id,state_province="Dhaka",county_district="Dhaka",address4="Keraniganj Paurashava",address5="Keraniganj" where name="Registration";
update location set parent_location=@location_id,state_province="Dhaka",county_district="Dhaka",address4="Keraniganj Paurashava",address5="Keraniganj" where name="Vaccination";
update location set state_province="Dhaka",county_district="Dhaka",address4="Keraniganj Paurashava",address5="Keraniganj" where location_id=@location_id;

select @report_tag_id := location_tag_id from location_tag where name="Report Location";
select @visit_tag_id := location_tag_id from location_tag where name="Visit Location";
insert into location_tag_map(location_id, location_tag_id) values(@location_id, @report_tag_id);
insert into location_tag_map(location_id, location_tag_id) values(@location_id, @visit_tag_id);


select @codded_data_type := concept_datatype_id from concept_datatype where name="Coded";
select @na_data_type := concept_datatype_id from concept_datatype where name="N/A";
select @misc_class_id := concept_class_id from concept_class where name = "Misc";
select @super_user_id := user_id from users where username = "superman";

-- concept-General
insert into concept(retired, datatype_id, class_id, is_set, creator, date_created, changed_by, date_changed, uuid)
values (0, @na_data_type, @misc_class_id, 0, @super_user_id, NOW(), @super_user_id, NOW(), uuid());
select @general_concept_id := LAST_INSERT_ID();
insert into concept_name(concept_id, name, locale, locale_preferred, creator, date_created, concept_name_type, voided, uuid)
values(@general_concept_id, "General", "en", 0, @super_user_id, NOW(), "SHORT", 0, uuid());
insert into concept_name(concept_id, name, locale, locale_preferred, creator, date_created, concept_name_type, voided, uuid)
values(@general_concept_id, "General", "en", 1, @super_user_id, NOW(), "FULLY_SPECIFIED", 0, uuid());
insert into concept_description(concept_id, description, locale, creator, date_created, uuid)
values(@general_concept_id, "General", "en", @super_user_id, NOW(), uuid());

-- concept-Staff
insert into concept(retired, datatype_id, class_id, is_set, creator, date_created, changed_by, date_changed, uuid)
values (0, @na_data_type, @misc_class_id, 0, @super_user_id, NOW(), @super_user_id, NOW(), uuid());
select @staff_concept_id := LAST_INSERT_ID();
insert into concept_name(concept_id, name, locale, locale_preferred, creator, date_created, concept_name_type, voided, uuid)
values(@staff_concept_id, "Staff, Self & family", "en", 0, @super_user_id, NOW(), "SHORT", 0, uuid());
insert into concept_name(concept_id, name, locale, locale_preferred, creator, date_created, concept_name_type, voided, uuid)
values(@staff_concept_id, "Staff, Self & family", "en", 1, @super_user_id, NOW(), "FULLY_SPECIFIED", 0, uuid());
insert into concept_description(concept_id, description, locale, creator, date_created, uuid)
values(@staff_concept_id, "Staff, Self & family", "en", @super_user_id, NOW(), uuid());

-- concept-Health card holder
insert into concept(retired, datatype_id, class_id, is_set, creator, date_created, changed_by, date_changed, uuid)
values (0, @na_data_type, @misc_class_id, 0, @super_user_id, NOW(), @super_user_id, NOW(), uuid());
select @health_concept_id := LAST_INSERT_ID();
insert into concept_name(concept_id, name, locale, locale_preferred, creator, date_created, concept_name_type, voided, uuid)
values(@health_concept_id, "Health card holder", "en", 0, @super_user_id, NOW(), "SHORT", 0, uuid());
insert into concept_name(concept_id, name, locale, locale_preferred, creator, date_created, concept_name_type, voided, uuid)
values(@health_concept_id, "Health card holder", "en", 1, @super_user_id, NOW(), "FULLY_SPECIFIED", 0, uuid());
insert into concept_description(concept_id, description, locale, creator, date_created, uuid)
values(@health_concept_id, "Health card holder", "en", @super_user_id, NOW(), uuid());


-- concept-Sensitive
insert into concept(retired, datatype_id, class_id, is_set, creator, date_created, changed_by, date_changed, uuid)
values (0, @na_data_type, @misc_class_id, 0, @super_user_id, NOW(), @super_user_id, NOW(), uuid());
select @sensitive_concept_id := LAST_INSERT_ID();
insert into concept_name(concept_id, name, locale, locale_preferred, creator, date_created, concept_name_type, voided, uuid)
values(@sensitive_concept_id, "Sensitive", "en", 0, @super_user_id, NOW(), "SHORT", 0, uuid());
insert into concept_name(concept_id, name, locale, locale_preferred, creator, date_created, concept_name_type, voided, uuid)
values(@sensitive_concept_id, "Sensitive", "en", 1, @super_user_id, NOW(), "FULLY_SPECIFIED", 0, uuid());
insert into concept_description(concept_id, description, locale, creator, date_created, uuid)
values(@sensitive_concept_id, "Sensitive", "en", @super_user_id, NOW(), uuid());

-- concept-VIP
insert into concept(retired, datatype_id, class_id, is_set, creator, date_created, changed_by, date_changed, uuid)
values (0, @na_data_type, @misc_class_id, 0, @super_user_id, NOW(), @super_user_id, NOW(), uuid());
select @vip_concept_id := LAST_INSERT_ID();
insert into concept_name(concept_id, name, locale, locale_preferred, creator, date_created, concept_name_type, voided, uuid)
values(@vip_concept_id, "VIP", "en", 0, @super_user_id, NOW(), "SHORT", 0, uuid());
insert into concept_name(concept_id, name, locale, locale_preferred, creator, date_created, concept_name_type, voided, uuid)
values(@vip_concept_id, "VIP", "en", 1, @super_user_id, NOW(), "FULLY_SPECIFIED", 0, uuid());
insert into concept_description(concept_id, description, locale, creator, date_created, uuid)
values(@vip_concept_id, "VIP", "en", @super_user_id, NOW(), uuid());

-- concept-MF
insert into concept(retired, datatype_id, class_id, is_set, creator, date_created, changed_by, date_changed, uuid)
values (0, @na_data_type, @misc_class_id, 0, @super_user_id, NOW(), @super_user_id, NOW(), uuid());
select @mf_concept_id := LAST_INSERT_ID();
insert into concept_name(concept_id, name, locale, locale_preferred, creator, date_created, concept_name_type, voided, uuid)
values(@mf_concept_id, "MF", "en", 0, @super_user_id, NOW(), "SHORT", 0, uuid());
insert into concept_name(concept_id, name, locale, locale_preferred, creator, date_created, concept_name_type, voided, uuid)
values(@mf_concept_id, "MF", "en", 1, @super_user_id, NOW(), "FULLY_SPECIFIED", 0, uuid());
insert into concept_description(concept_id, description, locale, creator, date_created, uuid)
values(@mf_concept_id, "MF", "en", @super_user_id, NOW(), uuid());

-- concept-Corporate
insert into concept(retired, datatype_id, class_id, is_set, creator, date_created, changed_by, date_changed, uuid)
values (0, @na_data_type, @misc_class_id, 0, @super_user_id, NOW(), @super_user_id, NOW(), uuid());
select @corporate_concept_id := LAST_INSERT_ID();
insert into concept_name(concept_id, name, locale, locale_preferred, creator, date_created, concept_name_type, voided, uuid)
values(@corporate_concept_id, "Corporate", "en", 0, @super_user_id, NOW(), "SHORT", 0, uuid());
insert into concept_name(concept_id, name, locale, locale_preferred, creator, date_created, concept_name_type, voided, uuid)
values(@corporate_concept_id, "Corporate", "en", 1, @super_user_id, NOW(), "FULLY_SPECIFIED", 0, uuid());
insert into concept_description(concept_id, description, locale, creator, date_created, uuid)
values(@corporate_concept_id, "Corporate", "en", @super_user_id, NOW(), uuid());


-- concept-Alarming field
insert into concept(retired, datatype_id, class_id, is_set, creator, date_created, changed_by, date_changed, uuid)
values (0, @codded_data_type, @misc_class_id, 0, @super_user_id, NOW(), @super_user_id, NOW(), uuid());
select @alarming_field_concept_id := LAST_INSERT_ID();
insert into concept_name(concept_id, name, locale, locale_preferred, creator, date_created, concept_name_type, voided, uuid)
values(@alarming_field_concept_id, "Alarming field", "en", 0, @super_user_id, NOW(), "SHORT", 0, uuid());
insert into concept_name(concept_id, name, locale, locale_preferred, creator, date_created, concept_name_type, voided, uuid)
values(@alarming_field_concept_id, "Alarming field", "en", 1, @super_user_id, NOW(), "FULLY_SPECIFIED", 0, uuid());
insert into concept_description(concept_id, description, locale, creator, date_created, uuid)
values(@alarming_field_concept_id, "Alarming field", "en", @super_user_id, NOW(), uuid());


-- concept_answerer-Alarming field
insert into concept_answer(concept_id, answer_concept, creator, date_created, sort_weight, uuid)
values(@alarming_field_concept_id, @general_concept_id, @super_user_id, NOW(), 1, uuid());
insert into concept_answer(concept_id, answer_concept, creator, date_created, sort_weight, uuid)
values(@alarming_field_concept_id, @staff_concept_id, @super_user_id, NOW(), 1, uuid());
insert into concept_answer(concept_id, answer_concept, creator, date_created, sort_weight, uuid)
values(@alarming_field_concept_id, @health_concept_id, @super_user_id, NOW(), 1, uuid());
insert into concept_answer(concept_id, answer_concept, creator, date_created, sort_weight, uuid)
values(@alarming_field_concept_id, @sensitive_concept_id, @super_user_id, NOW(), 1, uuid());
insert into concept_answer(concept_id, answer_concept, creator, date_created, sort_weight, uuid)
values(@alarming_field_concept_id, @vip_concept_id, @super_user_id, NOW(), 1, uuid());
insert into concept_answer(concept_id, answer_concept, creator, date_created, sort_weight, uuid)
values(@alarming_field_concept_id, @mf_concept_id, @super_user_id, NOW(), 1, uuid());
insert into concept_answer(concept_id, answer_concept, creator, date_created, sort_weight, uuid)
values(@alarming_field_concept_id, @corporate_concept_id, @super_user_id, NOW(), 1, uuid());

-- person_attribute_type-Alarming field
select @last_sort_weight := max(sort_weight) from person_attribute_type;
insert into person_attribute_type(name, description, format, foreign_key, searchable, creator, date_created, retired, sort_weight, uuid)
values("alarmingField", "Alarming Field", "org.openmrs.Concept", @alarming_field_concept_id, 1, @super_user_id, NOW(), 0, (@last_sort_weight + 1), uuid());

-- concept-Patient Category
insert into concept(retired, datatype_id, class_id, is_set, creator, date_created, changed_by, date_changed, uuid)
values (0, @codded_data_type, @misc_class_id, 0, @super_user_id, NOW(), @super_user_id, NOW(), uuid());
select @patient_cat_field_concept_id := LAST_INSERT_ID();
insert into concept_name(concept_id, name, locale, locale_preferred, creator, date_created, concept_name_type, voided, uuid)
values(@patient_cat_field_concept_id, "Patient Category", "en", 0, @super_user_id, NOW(), "SHORT", 0, uuid());
insert into concept_name(concept_id, name, locale, locale_preferred, creator, date_created, concept_name_type, voided, uuid)
values(@patient_cat_field_concept_id, "Patient Category", "en", 1, @super_user_id, NOW(), "FULLY_SPECIFIED", 0, uuid());
insert into concept_description(concept_id, description, locale, creator, date_created, uuid)
values(@patient_cat_field_concept_id, "Patient Category", "en", @super_user_id, NOW(), uuid());

-- concept_answerer-Patient Category
insert into concept_answer(concept_id, answer_concept, creator, date_created, sort_weight, uuid)
values(@patient_cat_field_concept_id, @general_concept_id, @super_user_id, NOW(), 1, uuid());
insert into concept_answer(concept_id, answer_concept, creator, date_created, sort_weight, uuid)
values(@patient_cat_field_concept_id, @staff_concept_id, @super_user_id, NOW(), 1, uuid());
insert into concept_answer(concept_id, answer_concept, creator, date_created, sort_weight, uuid)
values(@patient_cat_field_concept_id, @health_concept_id, @super_user_id, NOW(), 1, uuid());
insert into concept_answer(concept_id, answer_concept, creator, date_created, sort_weight, uuid)
values(@patient_cat_field_concept_id, @sensitive_concept_id, @super_user_id, NOW(), 1, uuid());
insert into concept_answer(concept_id, answer_concept, creator, date_created, sort_weight, uuid)
values(@patient_cat_field_concept_id, @vip_concept_id, @super_user_id, NOW(), 1, uuid());
insert into concept_answer(concept_id, answer_concept, creator, date_created, sort_weight, uuid)
values(@patient_cat_field_concept_id, @mf_concept_id, @super_user_id, NOW(), 1, uuid());
insert into concept_answer(concept_id, answer_concept, creator, date_created, sort_weight, uuid)
values(@patient_cat_field_concept_id, @corporate_concept_id, @super_user_id, NOW(), 1, uuid());

-- person_attribute_type-Patient Category
select @last_sort_weight := max(sort_weight) from person_attribute_type;
insert into person_attribute_type(name, description, format, foreign_key, searchable, creator, date_created, retired, sort_weight, uuid)
values("patientCategory", "Patient Category", "org.openmrs.Concept", @patient_cat_field_concept_id, 1, @super_user_id, NOW(), 0, (@last_sort_weight + 1), uuid());

-- person_attribute_type-Contact Number
select @last_sort_weight := max(sort_weight) from person_attribute_type;
insert into person_attribute_type(name, description, format, foreign_key, searchable, creator, date_created, retired, sort_weight, uuid)
values("relativeName", "Relative Name", "java.lang.String", null , 0, @super_user_id, NOW(), 0, (@last_sort_weight + 1), uuid());

-- person_attribute_type-Contact Number
select @last_sort_weight := max(sort_weight) from person_attribute_type;
insert into person_attribute_type(name, description, format, foreign_key, searchable, creator, date_created, retired, sort_weight, uuid)
values("relativeContactNumber", "Contact Number", "java.lang.String", null , 0, @super_user_id, NOW(), 0, (@last_sort_weight + 1), uuid());

-- person_attribute_type-Relation
select @last_sort_weight := max(sort_weight) from person_attribute_type;
insert into person_attribute_type(name, description, format, foreign_key, searchable, creator, date_created, retired, sort_weight, uuid)
values("relativeRelation", "Relation", "java.lang.String", null , 0, @super_user_id, NOW(), 0, (@last_sort_weight + 1), uuid());

-- concept-Self
insert into concept(retired, datatype_id, class_id, is_set, creator, date_created, changed_by, date_changed, uuid)
values (0, @na_data_type, @misc_class_id, 0, @super_user_id, NOW(), @super_user_id, NOW(), uuid());
select @self_concept_id := LAST_INSERT_ID();
insert into concept_name(concept_id, name, locale, locale_preferred, creator, date_created, concept_name_type, voided, uuid)
values(@self_concept_id, "Self", "en", 0, @super_user_id, NOW(), "SHORT", 0, uuid());
insert into concept_name(concept_id, name, locale, locale_preferred, creator, date_created, concept_name_type, voided, uuid)
values(@self_concept_id, "Self", "en", 1, @super_user_id, NOW(), "FULLY_SPECIFIED", 0, uuid());
insert into concept_description(concept_id, description, locale, creator, date_created, uuid)
values(@self_concept_id, "Self", "en", @super_user_id, NOW(), uuid());

-- concept-Hospital
insert into concept(retired, datatype_id, class_id, is_set, creator, date_created, changed_by, date_changed, uuid)
values (0, @na_data_type, @misc_class_id, 0, @super_user_id, NOW(), @super_user_id, NOW(), uuid());
select @hospital_concept_id := LAST_INSERT_ID();
insert into concept_name(concept_id, name, locale, locale_preferred, creator, date_created, concept_name_type, voided, uuid)
values(@hospital_concept_id, "Hospital", "en", 0, @super_user_id, NOW(), "SHORT", 0, uuid());
insert into concept_name(concept_id, name, locale, locale_preferred, creator, date_created, concept_name_type, voided, uuid)
values(@hospital_concept_id, "Hospital", "en", 1, @super_user_id, NOW(), "FULLY_SPECIFIED", 0, uuid());
insert into concept_description(concept_id, description, locale, creator, date_created, uuid)
values(@hospital_concept_id, "Hospital", "en", @super_user_id, NOW(), uuid());

-- concept-Doctor
insert into concept(retired, datatype_id, class_id, is_set, creator, date_created, changed_by, date_changed, uuid)
values (0, @na_data_type, @misc_class_id, 0, @super_user_id, NOW(), @super_user_id, NOW(), uuid());
select @doctors_concept_id := LAST_INSERT_ID();
insert into concept_name(concept_id, name, locale, locale_preferred, creator, date_created, concept_name_type, voided, uuid)
values(@doctors_concept_id, "Doctor", "en", 0, @super_user_id, NOW(), "SHORT", 0, uuid());
insert into concept_name(concept_id, name, locale, locale_preferred, creator, date_created, concept_name_type, voided, uuid)
values(@doctors_concept_id, "Doctor", "en", 1, @super_user_id, NOW(), "FULLY_SPECIFIED", 0, uuid());
insert into concept_description(concept_id, description, locale, creator, date_created, uuid)
values(@doctors_concept_id, "Doctor", "en", @super_user_id, NOW(), uuid());

-- concept-Relative
insert into concept(retired, datatype_id, class_id, is_set, creator, date_created, changed_by, date_changed, uuid)
values (0, @na_data_type, @misc_class_id, 0, @super_user_id, NOW(), @super_user_id, NOW(), uuid());
select @relatives_concept_id := LAST_INSERT_ID();
insert into concept_name(concept_id, name, locale, locale_preferred, creator, date_created, concept_name_type, voided, uuid)
values(@relatives_concept_id, "Relative", "en", 0, @super_user_id, NOW(), "SHORT", 0, uuid());
insert into concept_name(concept_id, name, locale, locale_preferred, creator, date_created, concept_name_type, voided, uuid)
values(@relatives_concept_id, "Relative", "en", 1, @super_user_id, NOW(), "FULLY_SPECIFIED", 0, uuid());
insert into concept_description(concept_id, description, locale, creator, date_created, uuid)
values(@relatives_concept_id, "Relative", "en", @super_user_id, NOW(), uuid());

-- concept-Referred By
insert into concept(retired, datatype_id, class_id, is_set, creator, date_created, changed_by, date_changed, uuid)
values (0, @codded_data_type, @misc_class_id, 0, @super_user_id, NOW(), @super_user_id, NOW(), uuid());
select @referred_by_concept_id := LAST_INSERT_ID();
insert into concept_name(concept_id, name, locale, locale_preferred, creator, date_created, concept_name_type, voided, uuid)
values(@referred_by_concept_id, "Referred By", "en", 0, @super_user_id, NOW(), "SHORT", 0, uuid());
insert into concept_name(concept_id, name, locale, locale_preferred, creator, date_created, concept_name_type, voided, uuid)
values(@referred_by_concept_id, "Referred By", "en", 1, @super_user_id, NOW(), "FULLY_SPECIFIED", 0, uuid());
insert into concept_description(concept_id, description, locale, creator, date_created, uuid)
values(@referred_by_concept_id, "Referred By", "en", @super_user_id, NOW(), uuid());

-- concept_answer-Referred By
insert into concept_answer(concept_id, answer_concept, creator, date_created, sort_weight, uuid)
values(@referred_by_concept_id, @self_concept_id, @super_user_id, NOW(), 1, uuid());
insert into concept_answer(concept_id, answer_concept, creator, date_created, sort_weight, uuid)
values(@referred_by_concept_id, @hospital_concept_id, @super_user_id, NOW(), 1, uuid());
insert into concept_answer(concept_id, answer_concept, creator, date_created, sort_weight, uuid)
values(@referred_by_concept_id, @doctors_concept_id, @super_user_id, NOW(), 1, uuid());
insert into concept_answer(concept_id, answer_concept, creator, date_created, sort_weight, uuid)
values(@referred_by_concept_id, @relatives_concept_id, @super_user_id, NOW(), 1, uuid());

-- person_attribute_type-Referred By
select @last_sort_weight := max(sort_weight) from person_attribute_type;
insert into person_attribute_type(name, description, format, foreign_key, searchable, creator, date_created, retired, sort_weight, uuid)
values("referredBy", "Referred By", "org.openmrs.Concept", @referred_by_concept_id, 1, @super_user_id, NOW(), 0, (@last_sort_weight + 1), uuid());

-- person_attribute_type-Referred By Doctor
select @last_sort_weight := max(sort_weight) from person_attribute_type;
insert into person_attribute_type(name, description, format, foreign_key, searchable, creator, date_created, retired, sort_weight, uuid)
values("referredByDoctor", "Referred By Doctor", "java.lang.String", null , 0, @super_user_id, NOW(), 0, (@last_sort_weight + 1), uuid());

-- person_attribute_type-Referred By Hospital
select @last_sort_weight := max(sort_weight) from person_attribute_type;
insert into person_attribute_type(name, description, format, foreign_key, searchable, creator, date_created, retired, sort_weight, uuid)
values("referredByHospital", "Referred By Hospital", "java.lang.String", null , 0, @super_user_id, NOW(), 0, (@last_sort_weight + 1), uuid());

-- retired Health Id
 update patient_identifier_type set retired = 1 where name ="Health Id";

-- concept-Sensitive-Contagious Disease
insert into concept(retired, datatype_id, class_id, is_set, creator, date_created, changed_by, date_changed, uuid)
values (0, @na_data_type, @misc_class_id, 0, @super_user_id, NOW(), @super_user_id, NOW(), uuid());
select @sencitive_concept_id := LAST_INSERT_ID();
insert into concept_name(concept_id, name, locale, locale_preferred, creator, date_created, concept_name_type, voided, uuid)
values(@sencitive_concept_id, "Sensitive-Contagious Disease", "en", 0, @super_user_id, NOW(), "SHORT", 0, uuid());
insert into concept_name(concept_id, name, locale, locale_preferred, creator, date_created, concept_name_type, voided, uuid)
values(@sencitive_concept_id, "Sensitive-Contagious Disease", "en", 1, @super_user_id, NOW(), "FULLY_SPECIFIED", 0, uuid());
insert into concept_description(concept_id, description, locale, creator, date_created, uuid)
values(@sencitive_concept_id, "Sensitive-Contagious Disease", "en", @super_user_id, NOW(), uuid());

-- concept-Risky
insert into concept(retired, datatype_id, class_id, is_set, creator, date_created, changed_by, date_changed, uuid)
values (0, @na_data_type, @misc_class_id, 0, @super_user_id, NOW(), @super_user_id, NOW(), uuid());
select @risky_concept_id := LAST_INSERT_ID();
insert into concept_name(concept_id, name, locale, locale_preferred, creator, date_created, concept_name_type, voided, uuid)
values(@risky_concept_id, "Risky", "en", 0, @super_user_id, NOW(), "SHORT", 0, uuid());
insert into concept_name(concept_id, name, locale, locale_preferred, creator, date_created, concept_name_type, voided, uuid)
values(@risky_concept_id, "Risky", "en", 1, @super_user_id, NOW(), "FULLY_SPECIFIED", 0, uuid());
insert into concept_description(concept_id, description, locale, creator, date_created, uuid)
values(@risky_concept_id, "Risky", "en", @super_user_id, NOW(), uuid());

-- concept-Blacklist
insert into concept(retired, datatype_id, class_id, is_set, creator, date_created, changed_by, date_changed, uuid)
values (0, @na_data_type, @misc_class_id, 0, @super_user_id, NOW(), @super_user_id, NOW(), uuid());
select @blacklist_concept_id := LAST_INSERT_ID();
insert into concept_name(concept_id, name, locale, locale_preferred, creator, date_created, concept_name_type, voided, uuid)
values(@blacklist_concept_id, "Blacklist", "en", 0, @super_user_id, NOW(), "SHORT", 0, uuid());
insert into concept_name(concept_id, name, locale, locale_preferred, creator, date_created, concept_name_type, voided, uuid)
values(@blacklist_concept_id, "Blacklist", "en", 1, @super_user_id, NOW(), "FULLY_SPECIFIED", 0, uuid());
insert into concept_description(concept_id, description, locale, creator, date_created, uuid)
values(@blacklist_concept_id, "Blacklist", "en", @super_user_id, NOW(), uuid());

-- concept-Pharmacy
insert into concept(retired, datatype_id, class_id, is_set, creator, date_created, changed_by, date_changed, uuid)
values (0, @na_data_type, @misc_class_id, 0, @super_user_id, NOW(), @super_user_id, NOW(), uuid());
select @pharmacy_concept_id := LAST_INSERT_ID();
insert into concept_name(concept_id, name, locale, locale_preferred, creator, date_created, concept_name_type, voided, uuid)
values(@pharmacy_concept_id, "Pharmacy", "en", 0, @super_user_id, NOW(), "SHORT", 0, uuid());
insert into concept_name(concept_id, name, locale, locale_preferred, creator, date_created, concept_name_type, voided, uuid)
values(@pharmacy_concept_id, "Pharmacy", "en", 1, @super_user_id, NOW(), "FULLY_SPECIFIED", 0, uuid());
insert into concept_description(concept_id, description, locale, creator, date_created, uuid)
values(@pharmacy_concept_id, "Pharmacy", "en", @super_user_id, NOW(), uuid());

-- concept-Promotional Activity
insert into concept(retired, datatype_id, class_id, is_set, creator, date_created, changed_by, date_changed, uuid)
values (0, @na_data_type, @misc_class_id, 0, @super_user_id, NOW(), @super_user_id, NOW(), uuid());
select @promotional_activity_concept_id := LAST_INSERT_ID();
insert into concept_name(concept_id, name, locale, locale_preferred, creator, date_created, concept_name_type, voided, uuid)
values(@promotional_activity_concept_id, "Promotional Activity", "en", 0, @super_user_id, NOW(), "SHORT", 0, uuid());
insert into concept_name(concept_id, name, locale, locale_preferred, creator, date_created, concept_name_type, voided, uuid)
values(@promotional_activity_concept_id, "Promotional Activity", "en", 1, @super_user_id, NOW(), "FULLY_SPECIFIED", 0, uuid());
insert into concept_description(concept_id, description, locale, creator, date_created, uuid)
values(@promotional_activity_concept_id, "Promotional Activity", "en", @super_user_id, NOW(), uuid());

-- concept-Alarming Field
insert into concept(retired, datatype_id, class_id, is_set, creator, date_created, changed_by, date_changed, uuid)
values (0, @codded_data_type, @misc_class_id, 0, @super_user_id, NOW(), @super_user_id, NOW(), uuid());
select @alarming_field_concept_id := LAST_INSERT_ID();
insert into concept_name(concept_id, name, locale, locale_preferred, creator, date_created, concept_name_type, voided, uuid)
values(@alarming_field_concept_id, "Alarming Field", "en", 0, @super_user_id, NOW(), "SHORT", 0, uuid());
insert into concept_name(concept_id, name, locale, locale_preferred, creator, date_created, concept_name_type, voided, uuid)
values(@alarming_field_concept_id, "Alarming Field", "en", 1, @super_user_id, NOW(), "FULLY_SPECIFIED", 0, uuid());
insert into concept_description(concept_id, description, locale, creator, date_created, uuid)
values(@alarming_field_concept_id, "Alarming Field", "en", @super_user_id, NOW(), uuid());


-- concept-Staff
insert into concept(retired, datatype_id, class_id, is_set, creator, date_created, changed_by, date_changed, uuid)
values (0, @na_data_type, @misc_class_id, 0, @super_user_id, NOW(), @super_user_id, NOW(), uuid());
select @staff_concept_id := LAST_INSERT_ID();
insert into concept_name(concept_id, name, locale, locale_preferred, creator, date_created, concept_name_type, voided, uuid)
values(@staff_concept_id, "Staff, Self & family", "en", 0, @super_user_id, NOW(), "SHORT", 0, uuid());
insert into concept_name(concept_id, name, locale, locale_preferred, creator, date_created, concept_name_type, voided, uuid)
values(@staff_concept_id, "Staff, Self & family", "en", 1, @super_user_id, NOW(), "FULLY_SPECIFIED", 0, uuid());
insert into concept_description(concept_id, description, locale, creator, date_created, uuid)
values(@staff_concept_id, "Staff, Self & family", "en", @super_user_id, NOW(), uuid());

-- concept-Patient Category
insert into concept(retired, datatype_id, class_id, is_set, creator, date_created, changed_by, date_changed, uuid)
values (0, @codded_data_type, @misc_class_id, 0, @super_user_id, NOW(), @super_user_id, NOW(), uuid());
select @patient_cat_field_concept_id := LAST_INSERT_ID();
insert into concept_name(concept_id, name, locale, locale_preferred, creator, date_created, concept_name_type, voided, uuid)
values(@patient_cat_field_concept_id, "Patient Category", "en", 0, @super_user_id, NOW(), "SHORT", 0, uuid());
insert into concept_name(concept_id, name, locale, locale_preferred, creator, date_created, concept_name_type, voided, uuid)
values(@patient_cat_field_concept_id, "Patient Category", "en", 1, @super_user_id, NOW(), "FULLY_SPECIFIED", 0, uuid());
insert into concept_description(concept_id, description, locale, creator, date_created, uuid)
values(@patient_cat_field_concept_id, "Patient Category", "en", @super_user_id, NOW(), uuid());

-- concept-Referred by
insert into concept(retired, datatype_id, class_id, is_set, creator, date_created, changed_by, date_changed, uuid)
values (0, @codded_data_type, @misc_class_id, 0, @super_user_id, NOW(), @super_user_id, NOW(), uuid());
select @referred_by_concept_id := LAST_INSERT_ID();
insert into concept_name(concept_id, name, locale, locale_preferred, creator, date_created, concept_name_type, voided, uuid)
values(@referred_by_concept_id, "Referred by", "en", 0, @super_user_id, NOW(), "SHORT", 0, uuid());
insert into concept_name(concept_id, name, locale, locale_preferred, creator, date_created, concept_name_type, voided, uuid)
values(@referred_by_concept_id, "Referred by", "en", 1, @super_user_id, NOW(), "FULLY_SPECIFIED", 0, uuid());
insert into concept_description(concept_id, description, locale, creator, date_created, uuid)
values(@referred_by_concept_id, "Referred by", "en", @super_user_id, NOW(), uuid());



insert into provider_attribute_type(name, description, datatype, min_occurs, creator, date_created, retired, uuid)
values("Designation", "Designation", "org.openmrs.customdatatype.datatype.FreeTextDatatype", 0, 6, NOW(), 0, uuid());

insert into provider_attribute_type(name, description, datatype, min_occurs, creator, date_created, retired, uuid)
values("BMDC Number", "BMDC Number", "org.openmrs.customdatatype.datatype.FreeTextDatatype", 0, 6, NOW(), 0, uuid());

-- delete unnecessary observation from list

select @all_Observation_templates := concept_id from concept_name where name = "All Observation Templates" and concept_name_type = "FULLY_SPECIFIED" order by date_created desc limit 1;
select @family_history_template := concept_id from concept_name where name = "Family History Template" and concept_name_type = "FULLY_SPECIFIED" order by date_created desc limit 1;
select @discharge_summary := concept_id from concept_name where name = "Discharge Summary" and concept_name_type = "FULLY_SPECIFIED" order by date_created desc limit 1;
select @procedure_template := concept_id from concept_name where name = "Procedure Template" and concept_name_type = "FULLY_SPECIFIED" order by date_created desc limit 1;
select @immunization_incident_template := concept_id from concept_name where name = "Immunization Incident Template" and concept_name_type = "FULLY_SPECIFIED" order by date_created desc limit 1;
select @aNC_notes := concept_id from concept_name where name = "ANC Notes" and concept_name_type = "FULLY_SPECIFIED" order by date_created desc limit 1;
select @delivery_note := concept_id from concept_name where name = "Delivery Note" and concept_name_type = "FULLY_SPECIFIED" order by date_created desc limit 1;
select @Injury_notes := concept_id from concept_name where name = "Injury notes set" and concept_name_type = "FULLY_SPECIFIED" order by date_created desc limit 1;
select @non_Communicable_disease := concept_id from concept_name where name = "Non Communicable Disease Set" and concept_name_type = "FULLY_SPECIFIED" order by date_created desc limit 1;
select @paediatric_anthropometry := concept_id from concept_name where name = "Paediatric Anthropometry" and concept_name_type = "FULLY_SPECIFIED" order by date_created desc limit 1;
select @pNC_notes := concept_id from concept_name where name = "PNC Notes" and concept_name_type = "FULLY_SPECIFIED" order by date_created desc limit 1;
select @death_note := concept_id from concept_name where name = "Death Note" and concept_name_type = "FULLY_SPECIFIED" order by date_created desc limit 1;
select @iMCI := concept_id from concept_name where name = "IMCI 0-2m" and concept_name_type = "FULLY_SPECIFIED" order by date_created desc limit 1;
select @IMCI_two_month_five_year := concept_id from concept_name where name = "IMCI 2m-5y, IMCI 2months to 5 years" and concept_name_type = "FULLY_SPECIFIED" order by date_created desc limit 1;
select @breast_cancer_screening := concept_id from concept_name where name = "Breast Cancer Screening Notes" and concept_name_type = "FULLY_SPECIFIED" order by date_created desc limit 1;
select @cervical_cancer := concept_id from concept_name where name = "Cervical Cancer Screening Notes" and concept_name_type = "FULLY_SPECIFIED" order by date_created desc limit 1;
select @diarrhoea_template := concept_id from concept_name where name = "Diarrhoea Template" and concept_name_type = "FULLY_SPECIFIED" order by date_created desc limit 1;
select @Animal_bite := concept_id from concept_name where name = "Animal bite form, recommended" and concept_name_type = "FULLY_SPECIFIED" order by date_created desc limit 1;
select @eye_examination := concept_id from concept_name where name = "Eye examination" and concept_name_type = "FULLY_SPECIFIED" order by date_created desc limit 1;

delete from concept_set where concept_set= @all_Observation_templates and concept_id in (@family_history_template,@discharge_summary,@procedure_template,
                                                                                         @immunization_incident_template,@aNC_notes,@delivery_note,@Injury_notes,
                                                                                         @non_Communicable_disease,@paediatric_anthropometry,@pNC_notes,@death_note,@iMCI,
                                                                                         @IMCI_two_month_five_year,@breast_cancer_screening,@cervical_cancer,@diarrhoea_template,
                                                                                         @Animal_bite,@eye_examination);

-- Appointment Scheduling expected date of Discharged
call add_concept(@expected_date_of_discharged_id, @s_name_id, @f_name_id, "Expected Date of Discharge", "Expected Date of Discharge", "Date", "Misc", false);
call add_concept(@reason_for_change_discharged, @s_name_id, @f_name_id, "Reason For Change in Discharge", "Reason For Change in Discharge", "Text", "Misc", false);


call add_concept(@ipd_intended_discharged, @s_name_id, @f_name_id, "IPD Intended Discharge", "EDD", "N/A", "ConvSet", true);
call add_concept_set_members(@ipd_intended_discharged, @expected_date_of_discharged_id, 1);
call add_concept_set_members(@ipd_intended_discharged, @reason_for_change_discharged, 2);

-- Create Doctor-Patient relationship
insert into relationship_type (a_is_to_b, b_is_to_a,creator, description,retired, date_created,uuid)
    value ('Doctor','Patient',6,'Relationship from a primary care provider to the patient',0,now(),uuid());


update concept_numeric set units='Inch' where concept_id=(select concept_id from concept_name where name="Height" and concept_name_type="FULLY_SPECIFIED");

-- Create Drug dose Frequency
call add_concept(@once_day_evening, @s_name_id, @f_name_id, "Once a Day (Evening)", "Once a Day (Evening)", "N/A", "Frequency", false);
insert into order_frequency(concept_id, frequency_per_day, creator, date_created, retired, changed_by, uuid)
values (@once_day_evening, 1, 1, NOW(), 0, 1, uuid());

call add_concept(@once_day_noon, @s_name_id, @f_name_id, "Once a Day (Noon)", "Once a Day (Noon)", "N/A", "Frequency", false);
insert into order_frequency(concept_id, frequency_per_day, creator, date_created, retired, changed_by, uuid)
values (@once_day_noon, 1, 1, NOW(), 0, 1, uuid());


-- medication instruction
update concept_name set name = "খাওয়ার আগে" where name = "Before meals" and concept_name_type ="FULLY_SPECIFIED";
update concept_name set name = "খালি পেটে" where name = "Empty stomach" and concept_name_type ="FULLY_SPECIFIED";
update concept_name set name = "খাওয়ার পরে" where name = "After meals" and concept_name_type ="FULLY_SPECIFIED";
update concept_name set name = "সকালে" where name = "In the morning" and concept_name_type ="FULLY_SPECIFIED";
update concept_name set name = "সন্ধ্যায়" where name = "In the evening" and concept_name_type ="FULLY_SPECIFIED";
update concept_name set name = "শয়নকালে" where name = "At bedtime" and concept_name_type ="FULLY_SPECIFIED";
update concept_name set name = "অবিলম্বে" where name = "Immediately" and concept_name_type ="FULLY_SPECIFIED";
update concept_name set name = "নির্দেশ অনুসারে" where name = "As directed" and concept_name_type ="FULLY_SPECIFIED";
update concept_name set name = "সকালে, খালি পেটে" where name = "In the morning, Empty stomach" and concept_name_type ="FULLY_SPECIFIED";
update concept_name set name = "সকালে, খাওয়ার পরে" where name = "	In the morning, After meals" and concept_name_type ="FULLY_SPECIFIED";
update concept_name set name = "সকালে, খাওয়ার আগে" where name = "In the morning, Before meals" and concept_name_type ="FULLY_SPECIFIED";
update concept_name set name = "সন্ধ্যায়, খাওয়ার পরে" where name = "	In the evening, After meals" and concept_name_type ="FULLY_SPECIFIED";
update concept_name set name = "সন্ধ্যায়, খাওয়ার আগে" where name = "In the evening, Before meals" and concept_name_type ="FULLY_SPECIFIED";

-- update Frequency name Once a day to Once a Day(Morning)
update concept_name set name = "Once a day (Morning)" where name = "Once a day" and concept_name_type ="FULLY_SPECIFIED";


-- assigned doctor

call add_concept(@assignDoctor, @s_name_id, @f_name_id, "Assign Doctor", "Assigned Doctor", "Complex", "Misc", false);
INSERT INTO concept_complex (concept_id,handler) values(@assignDoctor,"ProviderObsHandler");

-- Basic examination update
select @Vitals := concept_id from concept_name where name = "Vitals" and concept_name_type = "FULLY_SPECIFIED" order by date_created desc limit 1;
select @previousblood := concept_id from concept_name where name = "Blood Pressure" and concept_name_type = "FULLY_SPECIFIED" order by date_created desc limit 1;
delete from concept_set where concept_set = @Vitals and concept_id = @previousblood;

call add_concept(@bp, @s_name_id, @f_name_id, "Basic Examination Detail Blood Pressures", "Blood Pressure", "N/A", "Finding", true);

call add_concept(@systolic_blood_data, @s_name_id, @f_name_id, "Basic examination Detail Systolic blood", "Systolic blood pressure", "N/A", "Concept Details", true);

call add_concept(@systolic_blood_pressure, @s_name_id, @f_name_id, "Basic examination Detail Systolic blood Pressure", "Systolic blood Pressure", "Numeric", "Finding", false);
call add_concept_numeric_db(@systolic_blood_pressure, null, null, null);


call add_concept(@systolic_abnormal, @s_name_id, @f_name_id, "Basic examination Detail Systolic Abnormal", "Systolic Abnormal", "Boolean", "Abnormal", false);

call add_concept_set_members(@systolic_blood_data, @systolic_blood_pressure, 1);
call add_concept_set_members(@systolic_blood_data, @systolic_abnormal, 2);

call add_concept(@diastolic_blood_data, @s_name_id, @f_name_id, "Basic examination Detail Diastolic blood", "Diastolic blood pressures", "N/A", "Concept Details", true);

call add_concept(@diastolic_blood_pressure, @s_name_id, @f_name_id, "Basic examination Detail Diastolic blood pressure", "Diastolic blood pressure", "Numeric", "Finding", false);
call add_concept_numeric_db(@diastolic_blood_pressure, null, null, null);

call add_concept(@diastolic_abnormal, @s_name_id, @f_name_id, "Basic examination Detail Diastolic Abnormal", "Basic Diastolic Abnormal", "Boolean", "Abnormal", false);

call add_concept_set_members(@diastolic_blood_data, @diastolic_blood_pressure, 1);
call add_concept_set_members(@diastolic_blood_data, @diastolic_abnormal, 2);

call add_concept_set_members(@bp, @systolic_blood_data, 1);
call add_concept_set_members(@bp, @diastolic_blood_data, 2);
call add_concept_set_members(@Vitals, @bp, 2);

