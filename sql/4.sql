USE savage_rifts;

CREATE TABLE `framework` (
	`id` BIGINT(20) NOT NULL AUTO_INCREMENT,
	`type` VARCHAR(255) NOT NULL,
	`starting_attribute_points` INT(11) NULL DEFAULT NULL,
	`can_select_race` BIT(1) NOT NULL DEFAULT b'1',
	`max_agility` BIGINT(20) NULL DEFAULT NULL,
	`max_smarts` BIGINT(20) NULL DEFAULT NULL,
	`max_spirit` BIGINT(20) NULL DEFAULT NULL,
	`max_strength` BIGINT(20) NULL DEFAULT NULL,
	`max_vigor` BIGINT(20) NULL DEFAULT NULL,
	`starting_agility` BIGINT(20) NULL DEFAULT NULL,
	`starting_smarts` BIGINT(20) NULL DEFAULT NULL,
	`starting_spirit` BIGINT(20) NULL DEFAULT NULL,
	`starting_strength` BIGINT(20) NULL DEFAULT NULL,
	`starting_vigor` BIGINT(20) NULL DEFAULT NULL,

	PRIMARY KEY (`id`),
	UNIQUE INDEX `UK_akguxu30bs0jv0n9imtoxeh6o` (`type`),
    INDEX `FK_roll_max_agility` (`max_agility`),
    INDEX `FK_roll_max_smarts` (`max_smarts`),
    INDEX `FK_roll_max_spirit` (`max_spirit`),
    INDEX `FK_roll_max_strength` (`max_strength`),
    INDEX `FK_roll_max_vigor` (`max_vigor`),
    INDEX `FK_roll_starting_agility` (`starting_agility`),
    INDEX `FK_roll_starting_smarts` (`starting_smarts`),
    INDEX `FK_roll_starting_spirit` (`starting_spirit`),
    INDEX `FK_roll_starting_strength` (`starting_strength`),
    INDEX `FK_roll_starting_vigor` (`starting_vigor`),
    CONSTRAINT `FK_roll_max_agility` FOREIGN KEY (`max_agility`) REFERENCES `roll` (`id`),
    CONSTRAINT `FK_roll_max_smarts` FOREIGN KEY (`max_smarts`) REFERENCES `roll` (`id`),
    CONSTRAINT `FK_roll_max_spirit` FOREIGN KEY (`max_spirit`) REFERENCES `roll` (`id`),
    CONSTRAINT `FK_roll_max_strength` FOREIGN KEY (`max_strength`) REFERENCES `roll` (`id`),
    CONSTRAINT `FK_roll_max_vigor` FOREIGN KEY (`max_vigor`) REFERENCES `roll` (`id`),
    CONSTRAINT `FK_roll_starting_agility` FOREIGN KEY (`starting_agility`) REFERENCES `roll` (`id`),
    CONSTRAINT `FK_roll_starting_smarts` FOREIGN KEY (`starting_smarts`) REFERENCES `roll` (`id`),
    CONSTRAINT `FK_roll_starting_spirit` FOREIGN KEY (`starting_spirit`) REFERENCES `roll` (`id`),
    CONSTRAINT `FK_roll_starting_strength` FOREIGN KEY (`starting_strength`) REFERENCES `roll` (`id`),
    CONSTRAINT `FK_roll_starting_vigor` FOREIGN KEY (`starting_vigor`) REFERENCES `roll` (`id`)
) COLLATE='latin1_swedish_ci' ENGINE=InnoDB;

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

CREATE TABLE `sheet` (
	`id` BIGINT(20) NOT NULL AUTO_INCREMENT,
    `owner` BIGINT(20) NOT NULL,
    `name` VARCHAR(255) NOT NULL,
    `framework` BIGINT(20) NULL DEFAULT NULL,
    `race` BIGINT(20) NULL DEFAULT NULL,

    `creation_step` VARCHAR(255) NOT NULL,

	`agility` BIGINT(20) NOT NULL,
	`smarts` BIGINT(20) NOT NULL,
	`spirit` BIGINT(20) NOT NULL,
	`strength` BIGINT(20) NOT NULL,
	`vigor` BIGINT(20) NOT NULL,

	`remaining_attribute_points` INT(11) NULL DEFAULT NULL,
	`remaining_hindrance_points` INT(11) NULL DEFAULT NULL,
	`remaining_skill_points` INT(11) NULL DEFAULT NULL,

	`isp` INT(11) NULL DEFAULT NULL,
	`ppe` INT(11) NULL DEFAULT NULL,
	`strain` INT(11) NULL DEFAULT NULL,
	`charisma` INT(11) NULL DEFAULT NULL,
	`toughness` INT(11) NULL DEFAULT NULL,
    `pace` INT(11) NULL DEFAULT NULL,
    `parry` INT(11) NULL DEFAULT NULL,

	PRIMARY KEY (`id`),
	INDEX `FK_ckei0v74cktpahb1f6cpvvgx9` (`framework`),
	INDEX `FK_2pvjufx2dja7r1b6hdx091scs` (`owner`),
	INDEX `FK_race` (`race`),
    INDEX `FK_roll_agility` (`agility`),
    INDEX `FK_roll_smarts` (`smarts`),
    INDEX `FK_roll_spirit` (`spirit`),
    INDEX `FK_roll_strength` (`strength`),
    INDEX `FK_roll_vigor` (`vigor`),
	CONSTRAINT `FK_2pvjufx2dja7r1b6hdx091scs` FOREIGN KEY (`owner`) REFERENCES `user` (`id`),
	CONSTRAINT `FK_ckei0v74cktpahb1f6cpvvgx9` FOREIGN KEY (`framework`) REFERENCES `framework` (`id`),
	CONSTRAINT `FK_race` FOREIGN KEY (`race`) REFERENCES `race` (`id`),
    CONSTRAINT `FK_roll_agility` FOREIGN KEY (`agility`) REFERENCES `roll` (`id`),
    CONSTRAINT `FK_roll_smarts` FOREIGN KEY (`smarts`) REFERENCES `roll` (`id`),
    CONSTRAINT `FK_roll_spirit` FOREIGN KEY (`spirit`) REFERENCES `roll` (`id`),
    CONSTRAINT `FK_roll_strength` FOREIGN KEY (`strength`) REFERENCES `roll` (`id`),
    CONSTRAINT `FK_roll_vigor` FOREIGN KEY (`vigor`) REFERENCES `roll` (`id`)
) COLLATE='latin1_swedish_ci' ENGINE=InnoDB;
