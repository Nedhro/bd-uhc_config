select @codded_data_type := concept_datatype_id from concept_datatype where name="Coded";
select @na_data_type := concept_datatype_id from concept_datatype where name="N/A";
select @misc_class_id := concept_class_id from concept_class where name = "Misc";
select @super_user_id := user_id from users where username = "superman";

update person_attribute_type set retired = 1, name="alarmingFieldRetaired1" where name="alarmingField";
select @alarming_field_concept_id := concept_id from concept_name where name = "Alarming Field" and concept_name_type="FULLY_SPECIFIED" order by date_created desc limit 1;
select @last_sort_weight := max(sort_weight) from person_attribute_type where retired=0;
insert into person_attribute_type(name, description, format, foreign_key, searchable, creator, date_created, retired, sort_weight, uuid)
values("alarmingField", "Alarming Field", "org.openmrs.Concept", @alarming_field_concept_id, 1, @super_user_id, NOW(), 0, (@last_sort_weight + 1), uuid());


update person_attribute_type set retired = 1, name="patientCategoryRetaired1" where name="patientCategory";
select @patient_category_concept_id := concept_id from concept_name where name = "Patient Category" and concept_name_type="FULLY_SPECIFIED" order by date_created desc limit 1;
select @last_sort_weight := max(sort_weight) from person_attribute_type where retired=0;
insert into person_attribute_type(name, description, format, foreign_key, searchable, creator, date_created, retired, sort_weight, uuid)
values("patientCategory", "Patient Category", "org.openmrs.Concept", @patient_category_concept_id, 1, @super_user_id, NOW(), 0, (@last_sort_weight + 1), uuid());

-- person_attribute_type-Referred By Pharmacy
select @last_sort_weight := max(sort_weight) from person_attribute_type;
insert into person_attribute_type(name, description, format, foreign_key, searchable, creator, date_created, retired, sort_weight, uuid)
values("referredByPharmacy", "Referred By Pharmacy", "java.lang.String", null , 0, @super_user_id, NOW(), 0, (@last_sort_weight + 1), uuid());

-- person_attribute_type-Referred By Promotional Activity
select @last_sort_weight := max(sort_weight) from person_attribute_type;
insert into person_attribute_type(name, description, format, foreign_key, searchable, creator, date_created, retired, sort_weight, uuid)
values("referredByPromotionalActivity", "Referred By Promotional Activity", "java.lang.String", null , 0, @super_user_id, NOW(), 0, (@last_sort_weight + 1), uuid());

update person_attribute_type set retired = 1, name="referredByRetaired1" where name="referredBy";
select @referred_by_concept_id := concept_id from concept_name where name = "Referred By" and concept_name_type="FULLY_SPECIFIED" order by date_created desc limit 1;
select @last_sort_weight := max(sort_weight) from person_attribute_type where retired=0;
insert into person_attribute_type(name, description, format, foreign_key, searchable, creator, date_created, retired, sort_weight, uuid)
values("referredBy", "Referred By", "org.openmrs.Concept", @referred_by_concept_id, 1, @super_user_id, NOW(), 0, (@last_sort_weight + 1), uuid());