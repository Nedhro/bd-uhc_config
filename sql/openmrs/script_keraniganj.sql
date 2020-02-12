-- sajida config
update idgen_identifier_source set name="SHK", description="ID sequence source for patients in Keraniganj" where name="BDH";
select @identier_id := id from idgen_identifier_source where name="SHK";
update idgen_seq_id_gen set prefix="SHK" where id=@identier_id;

SELECT location_tag_id into @visit_location_tag_id from location_tag where name = 'Visit Location';
SELECT @location_id := location_id from openmrs.location where name='OPD';
INSERT INTO openmrs.location_tag_map values(@location_id,@visit_location_tag_id);

INSERT INTO openmrs.role_privilege (role, privilege) VALUES ('Anonymous', 'Get Locations');

-- retired visit type
update visit_type set changed_by = 6, date_changed =now(), retired = 1, retired_by = 6, date_retired = now(), retire_reason = 'no need now'
where name in ('LAB VISIT', 'ambulatory', 'home', 'field');

-- retired useless login location
update location set retired = 1, retired_by = 6, date_retired = now(), retire_reason = 'no need'
where name in ('Unknown Location', 'Discharge', 'Field');

-- Added location script
insert into location(name, creator, date_created,uuid) values('Emergency', 1, NOW(), uuid());
select @location_tag_id := lt.location_tag_id from location_tag as lt where lt.name='Login Location';
select @location_id := location_id from location where name ='Emergency';
insert into location_tag_map(location_id, location_tag_id) values(@location_id, @location_tag_id);

select @visit_location_tag_id := lt.location_tag_id from location_tag as lt where lt.name='Visit Location';
insert into location_tag_map(location_id, location_tag_id) values(@location_id, @visit_location_tag_id);

select @location_id := location_id from location where name ='Registration';
select @visit_location_tag_id := lt.location_tag_id from location_tag as lt where lt.name='Visit Location';
insert into location_tag_map(location_id, location_tag_id) values(@location_id, @visit_location_tag_id);

-- define visit type according to login location
SELECT @entity1_uuid := uuid FROM location where name = 'Registration';
SELECT @entity2_uuid := uuid FROM visit_type where name = 'outpatient';
SELECT @entity_mapping_type_id := id FROM entity_mapping_type  where name = 'loginlocation_visittype';
INSERT INTO entity_mapping ( uuid, entity_mapping_type_id , entity1_uuid , entity2_uuid , date_created) VALUES (uuid(),@entity_mapping_type_id,@entity1_uuid,@entity2_uuid,NOW());

SELECT @entity1_uuid := uuid FROM location where name = 'OPD';
SELECT @entity2_uuid := uuid FROM visit_type where name = 'outpatient';
SELECT @entity_mapping_type_id := id FROM entity_mapping_type  where name = 'loginlocation_visittype';
INSERT INTO entity_mapping ( uuid, entity_mapping_type_id , entity1_uuid , entity2_uuid , date_created) VALUES (uuid(),@entity_mapping_type_id,@entity1_uuid,@entity2_uuid,NOW());

SELECT @entity1_uuid := uuid FROM location where name = 'Emergency';
SELECT @entity2_uuid := uuid FROM visit_type where name = 'emergency';
SELECT @entity_mapping_type_id := id FROM entity_mapping_type  where name = 'loginlocation_visittype';
INSERT INTO entity_mapping ( uuid, entity_mapping_type_id , entity1_uuid , entity2_uuid , date_created) VALUES (uuid(),@entity_mapping_type_id,@entity1_uuid,@entity2_uuid,NOW());

insert into location(name, state_province, county_district, address4, address5, creator, date_created, uuid) VALUES ('Sajida Hospital, Keraniganj', 'Dhaka', 'Dhaka', 'Keraniganj Paurashava', 'Keraniganj', 1, NOW(), uuid());
select @location_id := LAST_INSERT_ID();
update location set parent_location=@location_id where parent_location is null and location_id <> @location_id;
update location set parent_location=@location_id,state_province="Dhaka",county_district="Dhaka",address4="Keraniganj Paurashava",address5="Keraniganj" where name="Emergency";
update location set parent_location=@location_id,state_province="Dhaka",county_district="Dhaka",address4="Keraniganj Paurashava",address5="Keraniganj" where name="OPD";
update location set parent_location=@location_id,state_province="Dhaka",county_district="Dhaka",address4="Keraniganj Paurashava",address5="Keraniganj" where name="Registration";

select @super_user_id := user_id from users where username = "superman";
select @last_sort_weight := max(sort_weight) from person_attribute_type;
insert into person_attribute_type(name, description, format, foreign_key, searchable, creator, date_created, retired, sort_weight, uuid)
values("healthIdCard", "Health Id Card", "java.lang.String", null , 0, @super_user_id, NOW(), 0, (@last_sort_weight + 1), uuid());

select @last_sort_weight := max(sort_weight) from person_attribute_type;
insert into person_attribute_type(name, description, format, foreign_key, searchable, creator, date_created, retired, sort_weight, uuid)
values("patientCategory", "Patient Category", "org.openmrs.Concept", 293 , 0, @super_user_id, NOW(), 0, (@last_sort_weight + 1), uuid());  -- foreign key should be from concept

-- fixed report module age group problem
INSERT INTO reporting_age_group (name, report_group_name, min_years, min_days, max_years, max_days, sort_order) VALUES ('0-4 years', 'Registration', 0, 0, 5, -1, 1);
INSERT INTO reporting_age_group (name, report_group_name, min_years, min_days, max_years, max_days, sort_order) VALUES ('5-14 years', 'Registration', 5, 0, 15, -1, 2);
INSERT INTO reporting_age_group (name, report_group_name, min_years, min_days, max_years, max_days, sort_order) VALUES ('15-24 years', 'Registration', 15, 0, 25, -1, 3);
INSERT INTO reporting_age_group (name, report_group_name, min_years, min_days, max_years, max_days, sort_order) VALUES ('25-49 years', 'Registration', 25, 0, 50, -1, 4);
INSERT INTO reporting_age_group (name, report_group_name, min_years, min_days, max_years, max_days, sort_order) VALUES ('50+ years', 'Registration', 50, 0, 200, -1, 5);

select @last_sort_weight := max(sort_weight) from person_attribute_type;
insert into person_attribute_type(name, description, format, foreign_key, searchable, creator, date_created, retired, sort_weight, uuid)
values("alarmingField", "Alarming Field", "org.openmrs.Concept", 286 , 0, @super_user_id, NOW(), 0, (@last_sort_weight + 1), uuid());

select @last_sort_weight := max(sort_weight) from person_attribute_type;
insert into person_attribute_type(name, description, format, foreign_key, searchable, creator, date_created, retired, sort_weight, uuid)
values("referredBy", "Referred By", "org.openmrs.Concept", 300 , 0, @super_user_id, NOW(), 0, (@last_sort_weight + 1), uuid());

select @last_sort_weight := max(sort_weight) from person_attribute_type;
insert into person_attribute_type(name, description, format, foreign_key, searchable, creator, date_created, retired, sort_weight, uuid)
values("referredByHospital", "Hospital Name", "java.lang.String", null , 0, @super_user_id, NOW(), 0, (@last_sort_weight + 1), uuid());

select @last_sort_weight := max(sort_weight) from person_attribute_type;
insert into person_attribute_type(name, description, format, foreign_key, searchable, creator, date_created, retired, sort_weight, uuid)
values("referredByDoctor", "Doctor Name", "java.lang.String", null , 0, @super_user_id, NOW(), 0, (@last_sort_weight + 1), uuid());

select @last_sort_weight := max(sort_weight) from person_attribute_type;
insert into person_attribute_type(name, description, format, foreign_key, searchable, creator, date_created, retired, sort_weight, uuid)
values("referredByPharmacy", "Pharmacy Name", "java.lang.String", null , 0, @super_user_id, NOW(), 0, (@last_sort_weight + 1), uuid());

select @last_sort_weight := max(sort_weight) from person_attribute_type;
insert into person_attribute_type(name, description, format, foreign_key, searchable, creator, date_created, retired, sort_weight, uuid)
values("referredByPromotionalActivity", "Promotional Activity Name", "	java.lang.String", null , 0, @super_user_id, NOW(), 0, (@last_sort_weight + 1), uuid());

select @last_sort_weight := max(sort_weight) from person_attribute_type;
insert into person_attribute_type(name, description, format, foreign_key, searchable, creator, date_created, retired, sort_weight, uuid)
values("relativeName", "Relative Name", "java.lang.String", null , 0, @super_user_id, NOW(), 0, (@last_sort_weight + 1), uuid());

select @last_sort_weight := max(sort_weight) from person_attribute_type;
insert into person_attribute_type(name, description, format, foreign_key, searchable, creator, date_created, retired, sort_weight, uuid)
values("relativeContactNumber", "Relative Contact Number", "	java.lang.String", null , 0, @super_user_id, NOW(), 0, (@last_sort_weight + 1), uuid());

select @last_sort_weight := max(sort_weight) from person_attribute_type;
insert into person_attribute_type(name, description, format, foreign_key, searchable, creator, date_created, retired, sort_weight, uuid)
values("relativeRelation", "Relative Relation", "java.lang.String", null , 0, @super_user_id, NOW(), 0, (@last_sort_weight + 1), uuid());

select @last_sort_weight := max(sort_weight) from person_attribute_type;
insert into person_attribute_type(name, description, format, foreign_key, searchable, creator, date_created, retired, sort_weight, uuid)
values("genderAttr", "Gender", "java.lang.String", null , 0, @super_user_id, NOW(), 0, (@last_sort_weight + 1), uuid());

select @last_sort_weight := max(sort_weight) from person_attribute_type;
insert into person_attribute_type(name, description, format, foreign_key, searchable, creator, date_created, retired, sort_weight, uuid)
values("staffid", "Staff ID", "java.lang.String", null , 0, @super_user_id, NOW(), 0, (@last_sort_weight + 1), uuid());

select @last_sort_weight := max(sort_weight) from person_attribute_type;
insert into person_attribute_type(name, description, format, foreign_key, searchable, creator, date_created, retired, sort_weight, uuid)
values("mfid", "MF ID", "java.lang.String", null , 0, @super_user_id, NOW(), 0, (@last_sort_weight + 1), uuid());

-- set gender for superman user
update person set gender = 'M' where person_id =
                                     (select user.person_id from users as user where username = 'superman');

-- retired relationship type
update relationship_type set retired = 1 where a_is_to_b = 'Supervisor' and b_is_to_a = 'Supervisee';


-- Bed  Management for Sajida Hospital Center, Keraniganj Starts ***

-- 1. Firstly, check the location table to collect parent location id by named "Sajida Hospital, Keraniganj" location id.
-- 2. Copy the location id of "Sajida Hospital, Keraniganj"  from location table and use as parent_location
-- 3. Edit and update the location.sql file from Bed Management folder updating first 4 queries with the parent_location ; These are the 4 new parent locations.
-- 4. Then, execute the location.sql file from Bed Management Folder
-- 5. Run the following query if "Admission Location" doesn't exist in the location_tag table.

    insert into location_tag (name, description, creator, retired, date_created, uuid) values('Admission Location', 'SHCK Patients Admission Locations', 6, 0, NOW(), uuid()); -- superman user
    SET @location_tag_id = (select location_tag_id from location_tag where name='Admission Location');

-- 6. Check the location_tag_id from location tag table of  and copy it
-- 7. Edit and update the location_tag_map.sql file from Bed Management folder with the location_tag_id .
-- 8. Execute the location_tag_map.sql file from Bed Management Folder.
-- 9. Then, To add Bed types executing the openmrs_bed_type.sql file from Bed Management Folder.
-- 10. After that, To add beds execute the openmrs_bed.sql from Bed Management Folder.
-- 11. Finally, For location mapping execute the openmrs_bed_location_map.sql from Bed Management Folder.

-- Bed  Management for Sajida Hospital Center, Keraniganj ends ***



