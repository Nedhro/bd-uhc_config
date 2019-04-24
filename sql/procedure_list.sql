create procedure add_concept_numeric_db(IN concept_id int, IN low_normal double, IN hi_normal double, IN units varchar(50))
BEGIN
  INSERT INTO concept_numeric (concept_id, low_normal, hi_normal, units, precise) values (concept_id, low_normal, hi_normal, units, 1);
END;