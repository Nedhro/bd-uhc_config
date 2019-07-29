-- Rename 'Staff, Self & family' to 'Staff Self'
select @staff_self := ca.answer_concept from concept_name as cn
                                  inner join concept_answer as ca on ca.answer_concept =cn.concept_id
    and ca.concept_id = (select foreign_key from person_attribute_type where name = "patientCategory")
where name = 'Staff, Self & family' and cn.concept_name_type ='FULLY_SPECIFIED';
update concept_name as cnn set cnn.name= 'Staff Self' where concept_id =@staff_self;

-- added staff Family into Patient Category
select @patCategory_id :=  foreign_key from person_attribute_type where  name = 'patientCategory';
call add_concept(@staff_family, @s_name_id, @f_name_id, "Staff Family", "Staff Family", "N/A", "Misc", false);
call add_concept_answer(@patCategory_id, @staff_family, 7);

-- Rename Promotional Activity To Hospital campaigning
update concept_name set name = "Hospital Campaigning" where concept_name_type = "FULLY_SPECIFIED" and name="Promotional Activity";
update concept_name set name = "Hospital Campaigning" where concept_name_type = "SHORT" and name="Promotional Activity";

-- Remove Black List
delete from concept_answer where concept_id = (select foreign_key from person_attribute_type where name = "alarmingField")
    and answer_concept =(select concept_id from concept_name where name = 'Blacklist' and concept_name_type = 'FULLY_SPECIFIED');
