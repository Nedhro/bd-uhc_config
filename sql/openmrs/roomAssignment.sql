insert into location_tag(name, description, creator, date_created, retired, uuid) values("OpdConsultationRoom", "Opd Consultation Room", 1, NOW(), 0, uuid());
select @location_tag_id := location_tag_id from location_tag where name ="OpdConsultationRoom";
select @parent_location_id := location_id from location where name like "OPD";  -- parent location

-- Room 105 (Neurology)
insert into location(name, description, creator, date_created, retired, parent_location, uuid)
values ("Room 105 (Neurology)", "Opd Consultant Room 100", 1, NOW(), 0, @parent_location_id, uuid());

select @locationId := location_id from location where name like "Room 100 (Neurology)";
insert into location_tag_map(location_id, location_tag_id) values(@locationId, @location_tag_id);

-- Room 105 A (Neurology)
insert into location(name, description, creator, date_created, retired, parent_location, uuid)
values ("Room 105 A (Neurology)", "Opd Consultant Room 100", 1, NOW(), 0, @parent_location_id, uuid());

select @locationId := location_id from location where name like "Room 100 (Neurology)";
insert into location_tag_map(location_id, location_tag_id) values(@locationId, @location_tag_id);






call add_concept(@opdConsultationConceptId, @s_name_id, @f_name_id,"Opd Consultation Room", "Consultation Room", "Complex", "Misc", false);
insert into concept_complex(concept_id, handler) VALUES(@opdConsultationConceptId, "LocationObsHandler");

