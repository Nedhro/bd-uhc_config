DELIMITER $$
CREATE PROCEDURE `add_user`(IN given_name varchar(255), IN middle_name varchar(255),
                            IN family_name varchar(255), IN gender varchar(10), IN roleList varchar(300),
                            IN username varchar(20), IN employeeId varchar(255))
BEGIN
    INSERT INTO person (gender, dead, creator, date_created, voided, uuid) VALUES (gender,0,6,NOW(),0,uuid());
    select @personId := LAST_INSERT_ID();
    INSERT INTO person_name (person_id, given_name, middle_name, family_name, creator, date_created, voided, uuid)
    VALUES (@personId, given_name, middle_name, family_name, 6, NOW(), 0, uuid());
    INSERT INTO users (username, system_id, password, salt, creator, date_created, person_id, retired, uuid)
    VALUES (username, username, '495a767bd3a3c0ad069807324b40ea58fb746326648dc2bd342c2ce29533e657862405643be5a4ab47bb5ded37c80b0b80ed5a34e954e5d2c98de9d2323d62d5','af3d32c4ac9fe9d43777fb6420fcd10d19ec493ca45abf16f4899a7967fdbff6f931be35981378e02cb54c2389a40f80b02642ecadadd276d353865dbe87d933',
            6,NOW(),@personId,0,uuid()); -- Ctech@123
    select @user_id := LAST_INSERT_ID();
    INSERT INTO provider(person_id, name, identifier, creator, date_created, retired, uuid)
    values(@personId, CONCAT(IFNULL(null, CONCAT(given_name, ' ')), IFNULL(null, CONCAT(middle_name, ' ')), IFNULL(null, CONCAT(family_name, ' '))),
           employeeId, 6, NOW(), 0, uuid());
    WHILE roleList != '' DO
            SET @role = SUBSTRING_INDEX(roleList, ',', 1);
            INSERT INTO user_role (user_id, role) VALUES (@user_id, @role);
            IF LOCATE(',', roleList) > 0 THEN
                SET roleList = SUBSTRING(roleList, LOCATE(',', roleList) + 1);
                select roleList;
            ELSE
                SET roleList = '';
            END IF;
        END WHILE;
END;
DELIMITER ;





-- call add_user('Md.', 'Salauddin', 'Shazal', 'M', 'Registration', 'shazal', '455');
-- call add_user('Md.', 'Nasir', 'Uddin', 'M', 'Registration', 'nasir', '1500');
-- call add_user('Mohammad', 'Billal', 'Hossain', 'M', 'Registration', 'billal', 'Demo001');
