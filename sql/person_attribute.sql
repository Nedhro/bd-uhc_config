select @codded_data_type := concept_datatype_id from concept_datatype where name="Coded";
select @na_data_type := concept_datatype_id from concept_datatype where name="N/A";
select @misc_class_id := concept_class_id from concept_class where name = "Misc";
select @super_user_id := user_id from users where username = "superman";

update person_attribute_type set retired = 1, name="alarmingFieldRetaired1" where name="alarmingField";

select @sensitive_concept_id := concept_id from concept_name where name = "Alarming Field" and concept_name_type="FULLY_SPECIFIED" order by date_created desc limit 1;

select @last_sort_weight := max(sort_weight) from person_attribute_type where retired=0;
insert into person_attribute_type(name, description, format, foreign_key, searchable, creator, date_created, retired, sort_weight, uuid)
values("alarmingField", "Alarming Field", "org.openmrs.Concept", @alarming_field_concept_id, 1, @super_user_id, NOW(), 0, (@last_sort_weight + 1), uuid());