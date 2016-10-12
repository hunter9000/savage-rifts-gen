USE savage_rifts;


CREATE TABLE `perk_selection` (
	`id` BIGINT(20) NOT NULL AUTO_INCREMENT,
	`was_swapped_for` BIT(1) NULL DEFAULT NULL,
	`perk` BIGINT(20) NULL DEFAULT NULL,
	`roll` BIGINT(20) NULL DEFAULT NULL,
	`sheet` BIGINT(20) NULL DEFAULT NULL,
	PRIMARY KEY (`id`),
	INDEX `FK_6opldg84qkac5kjfs1i9wy8ie` (`perk`),
	INDEX `FK_7xf0092k64jj8pss132uksf7u` (`roll`),
	INDEX `FK_gec2ca9tyeqrq5x6q1c8y8xn7` (`sheet`),
	CONSTRAINT `FK_6opldg84qkac5kjfs1i9wy8ie` FOREIGN KEY (`perk`) REFERENCES `perk` (`id`),
	CONSTRAINT `FK_7xf0092k64jj8pss132uksf7u` FOREIGN KEY (`roll`) REFERENCES `benefit_table_roll` (`id`),
	CONSTRAINT `FK_gec2ca9tyeqrq5x6q1c8y8xn7` FOREIGN KEY (`sheet`) REFERENCES `sheet` (`id`)
) COLLATE='utf8_general_ci' ENGINE=InnoDB;

