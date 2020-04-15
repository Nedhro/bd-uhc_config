insert into global_property(property, property_value, uuid)
VALUES("bahmni.sqlGet.providerDesignation", 'select pa.value_reference as designation
from provider_attribute as pa
join provider p on pa.provider_id = p.provider_id
join provider_attribute_type as pat on pa.attribute_type_id = pat.provider_attribute_type_id
where p.uuid= ${providerUuid} and pat.name="Designation";', uuid());

insert into global_property(property, property_value, uuid)
VALUES("bahmni.sqlGet.providerDesignation2", 'select pa.value_reference, pt.name from provider_attribute_type as pt join provider_attribute as pa on pt.provider_attribute_type_id = pa.attribute_type_id join provider as p on pa.provider_id = p.provider_id and p.uuid=${providerUuid};', uuid());


insert into global_property(property, property_value, uuid)
VALUES("bahmni.sqlGet.orderUuid", 'select p.uuid as uuid, pn.given_name, pn.middle_name, pn.family_name from orders as o join provider p on o.orderer = p.provider_id join person_name pn on pn.person_id = p.person_id where o.uuid=${orderUuid};', uuid());

insert into global_property(property, property_value, uuid)
VALUES("bahmni.sqlGet.bedMapInfo", 'select l.location_id, l.name, b.bed_number, l.parent_location, bm.bed_id, pi.identifier, bm.date_stopped, b.uuid, bm.date_created, b.date_changed
from location as l
    join bed_location_map bl on l.location_id = bl.location_id
    join bed_patient_assignment_map bm on bl.bed_id = bm.bed_id
    join bed b on b.bed_id=bm.bed_id
    join patient_identifier pi on bm.patient_id= pi.patient_id
where pi.identifier=${patientIdentifier} order by bm.date_started DESC;', uuid());

insert into global_property(property, property_value, uuid)
VALUES("bahmni.sqlGet.bedMapRoomInfo", 'select l.location_id, l.name, l.parent_location, l.description, l.date_created, l.date_changed
from location as l join location ll on l.parent_location =ll.location_id
where l.location_id=${parentId} order by l.date_created DESC;', uuid());


update global_property set property_value = '{"provider":["Doctor"]}' where property = "bahmni.relationshipTypeMap";

insert into global_property(property, property_value, uuid)
VALUES('emrapi.sqlSearch.myreferredpatient',
       'select distinct
           concat(pn.given_name," ", ifnull(pn.family_name,'''')) as name,
           pi.identifier as identifier,
           concat("",p.uuid) as uuid,
           concat("",v.uuid) as activeVisitUuid,
           IF(va.value_reference = "Admitted", "true", "false") as hasBeenAdmitted
       from
           obs o
               join encounter e on o.encounter_id = e.encounter_id
               join visit v on v.visit_id = e.visit_id and v.voided =0
               join person p on e.patient_id = p.person_id
               join person_name pn on p.person_id =pn.person_id
               join patient_identifier pi on v.patient_id = pi.patient_id and pi.voided =0
               join patient_identifier_type pit on pi.identifier_type = pit.patient_identifier_type_id
               join global_property gp on gp.property="bahmni.primaryIdentifierType" and gp.property_value=pit.uuid
               left outer join visit_attribute va on va.visit_id = v.visit_id and va.voided = 0 and va.attribute_type_id = (
               select visit_attribute_type_id from visit_attribute_type where name="Admission Status"
           ) and va.voided =0
       where o.concept_id = (select concept_id from concept_name where name = "Assign Doctor" and concept_name_type = "FULLY_SPECIFIED")
         and (cast(o.value_complex as UNSIGNED )= (select p1.provider_id from provider p1 where p1.uuid =${provider_uuid}))
         and v.date_stopped is null
         and v.voided = 0
       order by e.encounter_datetime desc;',
       uuid());

