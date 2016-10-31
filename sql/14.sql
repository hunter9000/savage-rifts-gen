
USE `savage_rifts`;

ALTER TABLE `edge` ADD COLUMN `edge_type` VARCHAR(255) NOT NULL;
ALTER TABLE `edge` ADD COLUMN `edge_category_type` VARCHAR(255) NOT NULL;
ALTER TABLE `edge` ADD COLUMN `description` VARCHAR(2000) NOT NULL;

CREATE TABLE `attribute_raise_selection` (
	`id` BIGINT(20) NOT NULL AUTO_INCREMENT,
	`attribute_type` INT(11) NOT NULL,
	`sheet` BIGINT(20) NOT NULL,
	PRIMARY KEY (`id`),
	INDEX `FK_1tl3p8sl147kfgpq3gjudfmoy` (`sheet`),
	CONSTRAINT `FK_1tl3p8sl147kfgpq3gjudfmoy` FOREIGN KEY (`sheet`) REFERENCES `sheet` (`id`)
) COLLATE='utf8_general_ci' ENGINE=InnoDB;

CREATE TABLE `edge_selection` (
	`id` BIGINT(20) NOT NULL AUTO_INCREMENT,
	`edge` BIGINT(20) NOT NULL,
	`sheet` BIGINT(20) NOT NULL,
	PRIMARY KEY (`id`),
	INDEX `FK_crg8t6bbo6da7l5x0hsgm5fl8` (`edge`),
	INDEX `FK_e2troen9tsd32ybuhg2qupqpg` (`sheet`),
	CONSTRAINT `FK_crg8t6bbo6da7l5x0hsgm5fl8` FOREIGN KEY (`edge`) REFERENCES `edge` (`id`),
	CONSTRAINT `FK_e2troen9tsd32ybuhg2qupqpg` FOREIGN KEY (`sheet`) REFERENCES `sheet` (`id`)
) COLLATE='utf8_general_ci' ENGINE=InnoDB;

CREATE TABLE `money_raise_selection` (
	`id` BIGINT(20) NOT NULL AUTO_INCREMENT,
	`sheet` BIGINT(20) NOT NULL,
	PRIMARY KEY (`id`),
	INDEX `FK_oxk0x7yu138830y4jr64x6n2k` (`sheet`),
	CONSTRAINT `FK_oxk0x7yu138830y4jr64x6n2k` FOREIGN KEY (`sheet`) REFERENCES `sheet` (`id`)
) COLLATE='utf8_general_ci' ENGINE=InnoDB;

CREATE TABLE `skill_raise_selection` (
	`id` BIGINT(20) NOT NULL AUTO_INCREMENT,
	`skill` INT(11) NOT NULL,
	`sheet` BIGINT(20) NOT NULL,
	PRIMARY KEY (`id`),
	INDEX `FK_9cv26g5qve03sf8kxmwraa5t7` (`sheet`),
	CONSTRAINT `FK_9cv26g5qve03sf8kxmwraa5t7` FOREIGN KEY (`sheet`) REFERENCES `sheet` (`id`)
) COLLATE='utf8_general_ci' ENGINE=InnoDB;

	-- `id` BIGINT(20) NOT NULL AUTO_INCREMENT,
	-- `xp_level_type` VARCHAR(255) NULL DEFAULT NULL,
	-- `required_attribute` BIGINT(20) NULL DEFAULT NULL,		-- remove
	-- PRIMARY KEY (`id`),
	-- INDEX `FK_8g4u4vjp6ejrgbbna8aa7n2x` (`required_attribute`),
	-- CONSTRAINT `FK_8g4u4vjp6ejrgbbna8aa7n2x` FOREIGN KEY (`required_attribute`) REFERENCES `roll` (`id`)

	-- add 
ALTER TABLE `edge` 
	ADD COLUMN `attribute_prerequisite_logic_type` VARCHAR(255) NOT NULL,
	ADD COLUMN `skill_prerequisite_logic_type` VARCHAR(255) NOT NULL,
	ADD COLUMN `edge_prerequisite_logic_type` VARCHAR(255) NOT NULL,
	MODIFY COLUMN `xp_level_type` VARCHAR(255) NOT NULL,
	DROP COLUMN `required_attribute`;

CREATE TABLE `edge_attribute_prerequisite` (
	`id` BIGINT(20) NOT NULL AUTO_INCREMENT,
	`edge` BIGINT(20) NOT NULL,
	`attribute_type`  VARCHAR(255) NOT NULL,
	`die_type` VARCHAR(255) NOT NULL,
	PRIMARY KEY (`id`),
	INDEX `FK_edge_attribute_prerequisite__edge` (`edge`),
	CONSTRAINT `FK_edge_attribute_prerequisite__edge` FOREIGN KEY (`edge`) REFERENCES `edge` (`id`)
) COLLATE='utf8_general_ci' ENGINE=InnoDB;
	
CREATE TABLE `edge_skill_prerequisite` (
	`id` BIGINT(20) NOT NULL AUTO_INCREMENT,
	`edge` BIGINT(20) NOT NULL,
	`skill_type`  VARCHAR(255) NOT NULL,
	`die_type` VARCHAR(255) NOT NULL,
	PRIMARY KEY (`id`),
	INDEX `FK_edge_skill_prerequisite__edge` (`edge`),
	CONSTRAINT `FK_edge_skill_prerequisite__edge` FOREIGN KEY (`edge`) REFERENCES `edge` (`id`)
) COLLATE='utf8_general_ci' ENGINE=InnoDB;


-- INSERT INTO `edge` (`edge_type`, `edge_category_type`, `description`, `xp_level_type`, 
					-- `attribute_prerequisite_logic_type`, `skill_prerequisite_logic_type`, `edge_prerequisite_logic_type`) 
	-- VALUES ('type', 'cattype', 'desc', 'NOVICE', 'AND', 'AND', 'AND');
-- SET @<edge_type>_ID = LAST_INSERT_ID();

-- insert into 
-- `edge_prerequisites`
-- `edge_required_framework`
-- `edge_attribute_prerequisite`
-- `edge_skill_prerequisite`


INSERT INTO `sql_files` (`sql_file_name`, `run_date`) VALUES ('14.sql', NOW());