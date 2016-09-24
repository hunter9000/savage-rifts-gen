
CREATE TABLE `perk` (
	`id` BIGINT(20) NOT NULL AUTO_INCREMENT,
	`description` VARCHAR(1000) NOT NULL,
	`type` VARCHAR(255) NOT NULL,
	PRIMARY KEY (`id`)
) COLLATE='utf8_general_ci' ENGINE=InnoDB;

CREATE TABLE `benefit_table` (
	`id` BIGINT(20) NOT NULL AUTO_INCREMENT,
	`is_magic` BIT(1) NULL DEFAULT NULL,
	`is_psionic` BIT(1) NULL DEFAULT NULL,
	`type` VARCHAR(255) NULL DEFAULT NULL,
	PRIMARY KEY (`id`)
) COLLATE='utf8_general_ci' ENGINE=InnoDB;

CREATE TABLE `perk_range` (
	`id` BIGINT(20) NOT NULL AUTO_INCREMENT,
	`max` INT(11) NOT NULL,
	`min` INT(11) NOT NULL,
	`benefit_table` BIGINT(20) NOT NULL,
	`perk` BIGINT(20) NOT NULL,
	PRIMARY KEY (`id`),
	INDEX `FK_bq5f8911o4x6r0phrka9gs8g0` (`benefit_table`),
	INDEX `FK_83exhdxjix3en3jaaj4rs9aoa` (`perk`),
	CONSTRAINT `FK_83exhdxjix3en3jaaj4rs9aoa` FOREIGN KEY (`perk`) REFERENCES `perk` (`id`),
	CONSTRAINT `FK_bq5f8911o4x6r0phrka9gs8g0` FOREIGN KEY (`benefit_table`) REFERENCES `benefit_table` (`id`)
) COLLATE='utf8_general_ci' ENGINE=InnoDB;
