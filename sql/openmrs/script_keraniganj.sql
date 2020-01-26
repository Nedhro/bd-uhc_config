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








