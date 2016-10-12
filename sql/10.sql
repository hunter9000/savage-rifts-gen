USE savage_rifts;

CREATE TABLE `edge` (
	`id` BIGINT(20) NOT NULL AUTO_INCREMENT,
	`xp_level_type` VARCHAR(255) NULL DEFAULT NULL,
	`required_attribute` BIGINT(20) NULL DEFAULT NULL,
	PRIMARY KEY (`id`),
	INDEX `FK_8g4u4vjp6ejrgbbna8aa7n2x` (`required_attribute`),
	CONSTRAINT `FK_8g4u4vjp6ejrgbbna8aa7n2x` FOREIGN KEY (`required_attribute`) REFERENCES `roll` (`id`)
) COLLATE='utf8_general_ci' ENGINE=InnoDB;

CREATE TABLE `edge_prerequisites` (
	`edge_id` BIGINT(20) NOT NULL,
	`prerequisite_edge_id` BIGINT(20) NOT NULL,
	INDEX `FK_b1pgpk7u7p6wgq08d9exnhhkp` (`prerequisite_edge_id`),
	INDEX `FK_jqhgk7kn444qpm1llia1uqhwt` (`edge_id`),
	CONSTRAINT `FK_b1pgpk7u7p6wgq08d9exnhhkp` FOREIGN KEY (`prerequisite_edge_id`) REFERENCES `edge` (`id`),
	CONSTRAINT `FK_jqhgk7kn444qpm1llia1uqhwt` FOREIGN KEY (`edge_id`) REFERENCES `edge` (`id`)
) COLLATE='utf8_general_ci' ENGINE=InnoDB;

CREATE TABLE `edge_required_framework` (
	`edge_id` BIGINT(20) NOT NULL,
	`framework_id` BIGINT(20) NOT NULL,
	INDEX `FK_75l6s3mrw478a0ccydu6ikg16` (`framework_id`),
	INDEX `FK_7s87o1r9hpo8q8gnt7a3q4xh0` (`edge_id`),
	CONSTRAINT `FK_75l6s3mrw478a0ccydu6ikg16` FOREIGN KEY (`framework_id`) REFERENCES `framework` (`id`),
	CONSTRAINT `FK_7s87o1r9hpo8q8gnt7a3q4xh0` FOREIGN KEY (`edge_id`) REFERENCES `edge` (`id`)
) COLLATE='utf8_general_ci' ENGINE=InnoDB;

CREATE TABLE `race` (
	`id` BIGINT(20) NOT NULL AUTO_INCREMENT,
	`has_magic` BIT(1) NOT NULL,
	`has_psionics` BIT(1) NOT NULL,
	PRIMARY KEY (`id`)
) COLLATE='utf8_general_ci' ENGINE=InnoDB;

CREATE TABLE `race_ability` (
	`id` BIGINT(20) NOT NULL AUTO_INCREMENT,
	`is_complication` BIT(1) NULL DEFAULT NULL,
	`included_edge` BIGINT(20) NULL DEFAULT NULL,
	`race` BIGINT(20) NOT NULL,
	PRIMARY KEY (`id`),
	INDEX `FK_bm22hryqhl1cx6cyvm2grcc7l` (`included_edge`),
	INDEX `FK_hk1iy0b6oa12m6l4fhw7986eo` (`race`),
	CONSTRAINT `FK_bm22hryqhl1cx6cyvm2grcc7l` FOREIGN KEY (`included_edge`) REFERENCES `edge` (`id`),
	CONSTRAINT `FK_hk1iy0b6oa12m6l4fhw7986eo` FOREIGN KEY (`race`) REFERENCES `race` (`id`)
) COLLATE='utf8_general_ci' ENGINE=InnoDB;
