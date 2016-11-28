USE savage_rifts;

CREATE TABLE `benefit_table_roll` (
	`id` BIGINT(20) NOT NULL AUTO_INCREMENT,
	`roll_number` INT(11) NOT NULL,
	`framework` BIGINT(20) NOT NULL,
	PRIMARY KEY (`id`),
	INDEX `FK_frnfwodi5sbegs6xueq370c21` (`framework`),
	CONSTRAINT `FK_frnfwodi5sbegs6xueq370c21` FOREIGN KEY (`framework`) REFERENCES `framework` (`id`)
) COLLATE='utf8_general_ci' ENGINE=InnoDB;


CREATE TABLE `benefit_table_roll_allowance` (
	`benefit_table_roll_id` BIGINT(20) NOT NULL,
	`benefit_table_id` BIGINT(20) NOT NULL,
	INDEX `FK_euujxatf1muquv8rbxbpeklga` (`benefit_table_id`),
	INDEX `FK_j93sg13q0pihhvfhdamd6f22s` (`benefit_table_roll_id`),
	CONSTRAINT `FK_euujxatf1muquv8rbxbpeklga` FOREIGN KEY (`benefit_table_id`) REFERENCES `benefit_table` (`id`),
	CONSTRAINT `FK_j93sg13q0pihhvfhdamd6f22s` FOREIGN KEY (`benefit_table_roll_id`) REFERENCES `benefit_table_roll` (`id`)
) COLLATE='utf8_general_ci' ENGINE=InnoDB;



SELECT @BODY_ARMOR_ID:=id FROM benefit_table WHERE type = 'BODY_ARMOR';
SELECT @CCW_ID:=id FROM benefit_table WHERE type = 'CLOSE_COMBAT_WEAPONS';
SELECT @CYBERNETICS_ID:=id FROM benefit_table WHERE type = 'CYBERNETICS';
SELECT @EDUCATION_ID:=id FROM benefit_table WHERE type = 'EDUCATION';


--  #### COMBAT CYBORG
SELECT @COMBAT_CYBORG_ID:=id FROM framework WHERE type = 'COMBAT_CYBORG';

INSERT INTO benefit_table_roll (roll_number, framework) VALUES (1, @COMBAT_CYBORG_ID);
SET @COMBAT_CYBORG_TABLE_ROLL_1 = LAST_INSERT_ID();
INSERT INTO benefit_table_roll (roll_number, framework) VALUES (2, @COMBAT_CYBORG_ID);
SET @COMBAT_CYBORG_TABLE_ROLL_2 = LAST_INSERT_ID();
INSERT INTO benefit_table_roll (roll_number, framework) VALUES (3, @COMBAT_CYBORG_ID);
SET @COMBAT_CYBORG_TABLE_ROLL_3 = LAST_INSERT_ID();

--  rolls 1 and 2 gets Cybernetics, Close Combat Weapons, Ranged Weapons, and Training
INSERT INTO benefit_table_roll_allowance (benefit_table_roll_id, benefit_table_id) VALUES (@COMBAT_CYBORG_TABLE_ROLL_1, @CYBERNETICS_ID);
INSERT INTO benefit_table_roll_allowance (benefit_table_roll_id, benefit_table_id) VALUES (@COMBAT_CYBORG_TABLE_ROLL_1, @CCW_ID);
-- further rolls are added in 16.sql

INSERT INTO benefit_table_roll_allowance (benefit_table_roll_id, benefit_table_id) VALUES (@COMBAT_CYBORG_TABLE_ROLL_2, @CYBERNETICS_ID);
INSERT INTO benefit_table_roll_allowance (benefit_table_roll_id, benefit_table_id) VALUES (@COMBAT_CYBORG_TABLE_ROLL_2, @CCW_ID);
-- further rolls are added in 16.sql

--  roll 3 is any table except magic, psionics, body armor
INSERT INTO benefit_table_roll_allowance (benefit_table_roll_id, benefit_table_id) VALUES (@COMBAT_CYBORG_TABLE_ROLL_3, @CYBERNETICS_ID);
INSERT INTO benefit_table_roll_allowance (benefit_table_roll_id, benefit_table_id) VALUES (@COMBAT_CYBORG_TABLE_ROLL_3, @CCW_ID);
INSERT INTO benefit_table_roll_allowance (benefit_table_roll_id, benefit_table_id) VALUES (@COMBAT_CYBORG_TABLE_ROLL_3, @EDUCATION_ID);
-- further rolls are added in 16.sql



--  #### CRAZY
SELECT @CRAZY_ID:=id FROM framework WHERE type = 'CRAZY';

INSERT INTO benefit_table_roll (roll_number, framework) VALUES (1, @CRAZY_ID);
SET @CRAZY_ID_TABLE_ROLL_1 = LAST_INSERT_ID();
INSERT INTO benefit_table_roll (roll_number, framework) VALUES (2, @CRAZY_ID);
SET @CRAZY_ID_TABLE_ROLL_2 = LAST_INSERT_ID();
INSERT INTO benefit_table_roll (roll_number, framework) VALUES (3, @CRAZY_ID);
SET @CRAZY_ID_TABLE_ROLL_3 = LAST_INSERT_ID();
INSERT INTO benefit_table_roll (roll_number, framework) VALUES (4, @CRAZY_ID);
SET @CRAZY_ID_TABLE_ROLL_4 = LAST_INSERT_ID();
INSERT INTO benefit_table_roll (roll_number, framework) VALUES (5, @CRAZY_ID);
SET @CRAZY_ID_TABLE_ROLL_5 = LAST_INSERT_ID();

--  rolls 1, 2, 3 are Body Armor, Close Combat Weapons, Psionics, Ranged Weapons, Training, or Underworld & Black Ops
INSERT INTO benefit_table_roll_allowance (benefit_table_roll_id, benefit_table_id) VALUES (@CRAZY_ID_TABLE_ROLL_1, @BODY_ARMOR_ID);
INSERT INTO benefit_table_roll_allowance (benefit_table_roll_id, benefit_table_id) VALUES (@CRAZY_ID_TABLE_ROLL_1, @CCW_ID);
-- further rolls are added in 16.sql

INSERT INTO benefit_table_roll_allowance (benefit_table_roll_id, benefit_table_id) VALUES (@CRAZY_ID_TABLE_ROLL_2, @BODY_ARMOR_ID);
INSERT INTO benefit_table_roll_allowance (benefit_table_roll_id, benefit_table_id) VALUES (@CRAZY_ID_TABLE_ROLL_2, @CCW_ID);
-- further rolls are added in 16.sql

INSERT INTO benefit_table_roll_allowance (benefit_table_roll_id, benefit_table_id) VALUES (@CRAZY_ID_TABLE_ROLL_3, @BODY_ARMOR_ID);
INSERT INTO benefit_table_roll_allowance (benefit_table_roll_id, benefit_table_id) VALUES (@CRAZY_ID_TABLE_ROLL_3, @CCW_ID);
-- further rolls are added in 16.sql

--  two additional rolls on any tables except those dealing with magic
INSERT INTO benefit_table_roll_allowance (benefit_table_roll_id, benefit_table_id) VALUES (@CRAZY_ID_TABLE_ROLL_4, @BODY_ARMOR_ID);
INSERT INTO benefit_table_roll_allowance (benefit_table_roll_id, benefit_table_id) VALUES (@CRAZY_ID_TABLE_ROLL_4, @CCW_ID);
INSERT INTO benefit_table_roll_allowance (benefit_table_roll_id, benefit_table_id) VALUES (@CRAZY_ID_TABLE_ROLL_4, @CYBERNETICS_ID);
INSERT INTO benefit_table_roll_allowance (benefit_table_roll_id, benefit_table_id) VALUES (@CRAZY_ID_TABLE_ROLL_4, @EDUCATION_ID);
-- further rolls are added in 16.sql

INSERT INTO benefit_table_roll_allowance (benefit_table_roll_id, benefit_table_id) VALUES (@CRAZY_ID_TABLE_ROLL_5, @BODY_ARMOR_ID);
INSERT INTO benefit_table_roll_allowance (benefit_table_roll_id, benefit_table_id) VALUES (@CRAZY_ID_TABLE_ROLL_5, @CCW_ID);
INSERT INTO benefit_table_roll_allowance (benefit_table_roll_id, benefit_table_id) VALUES (@CRAZY_ID_TABLE_ROLL_5, @CYBERNETICS_ID);
INSERT INTO benefit_table_roll_allowance (benefit_table_roll_id, benefit_table_id) VALUES (@CRAZY_ID_TABLE_ROLL_5, @EDUCATION_ID);
-- further rolls are added in 16.sql



INSERT INTO `sql_files` (`sql_file_name`, `run_date`) VALUES ('8.sql', NOW());
