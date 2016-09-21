CREATE TABLE `roll` (
	`id` BIGINT(20) NOT NULL AUTO_INCREMENT,
	`die_type` VARCHAR(255) NOT NULL,
	`modifier` INT(11) NOT NULL,
	PRIMARY KEY (`id`)
) COLLATE='latin1_swedish_ci' ENGINE=InnoDB;


CREATE TABLE `skill_roll` (
	`id` BIGINT(20) NOT NULL AUTO_INCREMENT,
	`skill_type` VARCHAR(255) NOT NULL,
	`roll` BIGINT(20) NOT NULL,
	PRIMARY KEY (`id`),
	INDEX `FK_i2fel4ku4b01ejud524wnmk6i` (`roll`),
	CONSTRAINT `FK_i2fel4ku4b01ejud524wnmk6i` FOREIGN KEY (`roll`) REFERENCES `roll` (`id`)
) COLLATE='latin1_swedish_ci' ENGINE=InnoDB;


CREATE TABLE `language` (
	`id` BIGINT(20) NOT NULL AUTO_INCREMENT,
	`description` VARCHAR(1000) NOT NULL,
	`name` VARCHAR(50) NOT NULL,
	PRIMARY KEY (`id`)
) COLLATE='latin1_swedish_ci' ENGINE=InnoDB;