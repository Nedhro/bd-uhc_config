-- sajida config
update idgen_identifier_source set name="SHK", description="ID sequence source for patients in Keraniganj";

-- location
SELECT @location_id := location_id FROM location WHERE name='Sajida Health Center-Keraniganj (10020242)' LIMIT 1;
update location set parent_location=@location_id,state_province="Dhaka",county_district="Dhaka",address4="Keraniganj Paurashava",address5="Keraniganj" where name="Emergency";
update location set parent_location=@location_id,state_province="Dhaka",county_district="Dhaka",address4="Keraniganj Paurashava",address5="Keraniganj" where name="IPD";
update location set parent_location=@location_id,state_province="Dhaka",county_district="Dhaka",address4="Keraniganj Paurashava",address5="Keraniganj" where name="OPD";
update location set parent_location=@location_id,state_province="Dhaka",county_district="Dhaka",address4="Keraniganj Paurashava",address5="Keraniganj" where name="OT";
update location set parent_location=@location_id,state_province="Dhaka",county_district="Dhaka",address4="Keraniganj Paurashava",address5="Keraniganj" where name="Registration";
update location set parent_location=@location_id,state_province="Dhaka",county_district="Dhaka",address4="Keraniganj Paurashava",address5="Keraniganj" where name="Vaccination";
update location set parent_location=@location_id,state_province="Dhaka",county_district="Dhaka",address4="Keraniganj Paurashava",address5="Keraniganj" where location_id=@location_id;

select @report_tag_id := location_tag_id from location_tag where name="Report Location";
select @visit_tag_id := location_tag_id from location_tag where name="Visit Location";
insert into location_tag_map(location_id, location_tag_id) values(@location_id, @report_tag_id);
insert into location_tag_map(location_id, location_tag_id) values(@location_id, @visit_tag_id);



select @codded_data_type := concept_datatype_id from concept_datatype where name="Coded";
select @na_data_type := concept_datatype_id from concept_datatype where name="N/A";
select @misc_class_id := concept_class_id from concept_class where name = "Misc";
select @super_user_id := user_id from users where username = "superman";

insert into concept(retired, datatype_id, class_id, is_set, creator, date_created, changed_by, date_changed, uuid)
values (0, @na_data_type, @misc_class_id, 0, @super_user_id, NOW(), @super_user_id, NOW(), uuid());

select @general_concept_id := LAST_INSERT_ID();

insert into concept_name(concept_id, name, locale, locale_preferred, creator, date_created, concept_name_type, voided, uuid)
values(@general_concept_id, "General", "en", 0, @super_user_id, NOW(), "SHORT", 0, uuid());
insert into concept_name(concept_id, name, locale, locale_preferred, creator, date_created, concept_name_type, voided, uuid)
values(@general_concept_id, "General", "en", 1, @super_user_id, NOW(), "FULLY_SPECIFIED", 0, uuid());

insert into concept_description(concept_id, description, locale, creator, date_created, uuid)
values(@general_concept_id, "General", "en", @super_user_id, NOW(), uuid());


insert into concept(retired, datatype_id, class_id, is_set, creator, date_created, changed_by, date_changed, uuid)
values (0, @na_data_type, @misc_class_id, 0, @super_user_id, NOW(), @super_user_id, NOW(), uuid());

select @staff_concept_id := LAST_INSERT_ID();

insert into concept_name(concept_id, name, locale, locale_preferred, creator, date_created, concept_name_type, voided, uuid)
values(@staff_concept_id, "Staff , Self & family", "en", 0, @super_user_id, NOW(), "SHORT", 0, uuid());
insert into concept_name(concept_id, name, locale, locale_preferred, creator, date_created, concept_name_type, voided, uuid)
values(@staff_concept_id, "Staff , Self & family", "en", 1, @super_user_id, NOW(), "FULLY_SPECIFIED", 0, uuid());

insert into concept_description(concept_id, description, locale, creator, date_created, uuid)
values(@staff_concept_id, "Staff , Self & family", "en", @super_user_id, NOW(), uuid());


insert into concept(retired, datatype_id, class_id, is_set, creator, date_created, changed_by, date_changed, uuid)
values (0, @na_data_type, @misc_class_id, 0, @super_user_id, NOW(), @super_user_id, NOW(), uuid());

select @health_concept_id := LAST_INSERT_ID();

insert into concept_name(concept_id, name, locale, locale_preferred, creator, date_created, concept_name_type, voided, uuid)
values(@health_concept_id, "Health card holder", "en", 0, @super_user_id, NOW(), "SHORT", 0, uuid());
insert into concept_name(concept_id, name, locale, locale_preferred, creator, date_created, concept_name_type, voided, uuid)
values(@health_concept_id, "Health card holder", "en", 1, @super_user_id, NOW(), "FULLY_SPECIFIED", 0, uuid());

insert into concept_description(concept_id, description, locale, creator, date_created, uuid)
values(@health_concept_id, "Health card holder", "en", @super_user_id, NOW(), uuid());



insert into concept(retired, datatype_id, class_id, is_set, creator, date_created, changed_by, date_changed, uuid)
values (0, @na_data_type, @misc_class_id, 0, @super_user_id, NOW(), @super_user_id, NOW(), uuid());

select @sensitive_concept_id := LAST_INSERT_ID();

insert into concept_name(concept_id, name, locale, locale_preferred, creator, date_created, concept_name_type, voided, uuid)
values(@sensitive_concept_id, "Sensitive", "en", 0, @super_user_id, NOW(), "SHORT", 0, uuid());
insert into concept_name(concept_id, name, locale, locale_preferred, creator, date_created, concept_name_type, voided, uuid)
values(@sensitive_concept_id, "Sensitive", "en", 1, @super_user_id, NOW(), "FULLY_SPECIFIED", 0, uuid());

insert into concept_description(concept_id, description, locale, creator, date_created, uuid)
values(@sensitive_concept_id, "Sensitive", "en", @super_user_id, NOW(), uuid());


insert into concept(retired, datatype_id, class_id, is_set, creator, date_created, changed_by, date_changed, uuid)
values (0, @na_data_type, @misc_class_id, 0, @super_user_id, NOW(), @super_user_id, NOW(), uuid());

select @vip_concept_id := LAST_INSERT_ID();

insert into concept_name(concept_id, name, locale, locale_preferred, creator, date_created, concept_name_type, voided, uuid)
values(@vip_concept_id, "VIP", "en", 0, @super_user_id, NOW(), "SHORT", 0, uuid());
insert into concept_name(concept_id, name, locale, locale_preferred, creator, date_created, concept_name_type, voided, uuid)
values(@vip_concept_id, "VIP", "en", 1, @super_user_id, NOW(), "FULLY_SPECIFIED", 0, uuid());

insert into concept_description(concept_id, description, locale, creator, date_created, uuid)
values(@vip_concept_id, "VIP", "en", @super_user_id, NOW(), uuid());


insert into concept(retired, datatype_id, class_id, is_set, creator, date_created, changed_by, date_changed, uuid)
values (0, @na_data_type, @misc_class_id, 0, @super_user_id, NOW(), @super_user_id, NOW(), uuid());

select @mf_concept_id := LAST_INSERT_ID();

insert into concept_name(concept_id, name, locale, locale_preferred, creator, date_created, concept_name_type, voided, uuid)
values(@mf_concept_id, "MF", "en", 0, @super_user_id, NOW(), "SHORT", 0, uuid());
insert into concept_name(concept_id, name, locale, locale_preferred, creator, date_created, concept_name_type, voided, uuid)
values(@mf_concept_id, "MF", "en", 1, @super_user_id, NOW(), "FULLY_SPECIFIED", 0, uuid());

insert into concept_description(concept_id, description, locale, creator, date_created, uuid)
values(@mf_concept_id, "MF", "en", @super_user_id, NOW(), uuid());


insert into concept(retired, datatype_id, class_id, is_set, creator, date_created, changed_by, date_changed, uuid)
values (0, @na_data_type, @misc_class_id, 0, @super_user_id, NOW(), @super_user_id, NOW(), uuid());

select @corporate_concept_id := LAST_INSERT_ID();

insert into concept_name(concept_id, name, locale, locale_preferred, creator, date_created, concept_name_type, voided, uuid)
values(@corporate_concept_id, "Corporate", "en", 0, @super_user_id, NOW(), "SHORT", 0, uuid());
insert into concept_name(concept_id, name, locale, locale_preferred, creator, date_created, concept_name_type, voided, uuid)
values(@corporate_concept_id, "Corporate", "en", 1, @super_user_id, NOW(), "FULLY_SPECIFIED", 0, uuid());

insert into concept_description(concept_id, description, locale, creator, date_created, uuid)
values(@corporate_concept_id, "Corporate", "en", @super_user_id, NOW(), uuid());



insert into concept(retired, datatype_id, class_id, is_set, creator, date_created, changed_by, date_changed, uuid)
values (0, @codded_data_type, @misc_class_id, 0, @super_user_id, NOW(), @super_user_id, NOW(), uuid());

select @alarming_field_concept_id := LAST_INSERT_ID();

insert into concept_name(concept_id, name, locale, locale_preferred, creator, date_created, concept_name_type, voided, uuid)
values(@alarming_field_concept_id, "Alarming field", "en", 0, @super_user_id, NOW(), "SHORT", 0, uuid());
insert into concept_name(concept_id, name, locale, locale_preferred, creator, date_created, concept_name_type, voided, uuid)
values(@alarming_field_concept_id, "Alarming field", "en", 1, @super_user_id, NOW(), "FULLY_SPECIFIED", 0, uuid());

insert into concept_description(concept_id, description, locale, creator, date_created, uuid)
values(@alarming_field_concept_id, "Alarming field", "en", @super_user_id, NOW(), uuid());

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

select @last_sort_weight := max(sort_weight) from person_attribute_type;
insert into person_attribute_type(name, description, format, foreign_key, searchable, creator, date_created, retired, sort_weight, uuid)
values("alarmingField", "Alarming Field", "org.openmrs.Concept", @alarming_field_concept_id, 1, @super_user_id, NOW(), 0, (@last_sort_weight + 1), uuid());




insert into concept(retired, datatype_id, class_id, is_set, creator, date_created, changed_by, date_changed, uuid)
values (0, @codded_data_type, @misc_class_id, 0, @super_user_id, NOW(), @super_user_id, NOW(), uuid());

select @patient_cat_field_concept_id := LAST_INSERT_ID();

insert into concept_name(concept_id, name, locale, locale_preferred, creator, date_created, concept_name_type, voided, uuid)
values(@patient_cat_field_concept_id, "Patient Category", "en", 0, @super_user_id, NOW(), "SHORT", 0, uuid());
insert into concept_name(concept_id, name, locale, locale_preferred, creator, date_created, concept_name_type, voided, uuid)
values(@patient_cat_field_concept_id, "Patient Category", "en", 1, @super_user_id, NOW(), "FULLY_SPECIFIED", 0, uuid());

insert into concept_description(concept_id, description, locale, creator, date_created, uuid)
values(@patient_cat_field_concept_id, "Patient Category", "en", @super_user_id, NOW(), uuid());

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

select @last_sort_weight := max(sort_weight) from person_attribute_type;
insert into person_attribute_type(name, description, format, foreign_key, searchable, creator, date_created, retired, sort_weight, uuid)
values("patientCategory", "Patient Category", "org.openmrs.Concept", @patient_cat_field_concept_id, 1, @super_user_id, NOW(), 0, (@last_sort_weight + 1), uuid());



select @last_sort_weight := max(sort_weight) from person_attribute_type;
insert into person_attribute_type(name, description, format, foreign_key, searchable, creator, date_created, retired, sort_weight, uuid)
values("relativeName", "Relative Name", "java.lang.String", null , 0, @super_user_id, NOW(), 0, (@last_sort_weight + 1), uuid());


select @last_sort_weight := max(sort_weight) from person_attribute_type;
insert into person_attribute_type(name, description, format, foreign_key, searchable, creator, date_created, retired, sort_weight, uuid)
values("relativeContactNumber", "Contact Number", "java.lang.String", null , 0, @super_user_id, NOW(), 0, (@last_sort_weight + 1), uuid());


select @last_sort_weight := max(sort_weight) from person_attribute_type;
insert into person_attribute_type(name, description, format, foreign_key, searchable, creator, date_created, retired, sort_weight, uuid)
values("relativeRelation", "Relation", "java.lang.String", null , 0, @super_user_id, NOW(), 0, (@last_sort_weight + 1), uuid());








