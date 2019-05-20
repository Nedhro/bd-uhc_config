insert into global_property(property, property_value, uuid)
VALUES("bahmni.sqlGet.providerDesignation", "select pa.value_reference as designation
from provider_attribute as pa
join provider p on pa.provider_id = p.provider_id
join provider_attribute_type as pat on pa.attribute_type_id = pat.provider_attribute_type_id
where p.uuid= ${providerUuid} and pat.name='Designation';", uuid());