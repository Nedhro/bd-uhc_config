insert into global_property(property, property_value, uuid)
VALUES("bahmni.sqlGet.providerDesignation", "select pa.value_reference as designation
from provider_attribute as pa
join provider p on pa.provider_id = p.provider_id
join provider_attribute_type as pat on pa.attribute_type_id = pat.provider_attribute_type_id
where p.uuid= ${providerUuid} and pat.name='Designation';", uuid());

insert into global_property(property, property_value, uuid)
VALUES("bahmni.sqlGet.providerDesignation2", "select pa.value_reference, pt.name from provider_attribute_type as pt join provider_attribute as pa on pt.provider_attribute_type_id = pa.attribute_type_id join provider as p on pa.provider_id = p.provider_id and p.uuid=${providerUuid};", uuid());
