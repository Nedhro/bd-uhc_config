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

