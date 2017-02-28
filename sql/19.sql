USE savage_rifts;

-- `id` BIGINT(20) NOT NULL AUTO_INCREMENT,
-- `is_complication` BIT(1) NULL DEFAULT NULL,
-- `included_edge` BIGINT(20) NULL DEFAULT NULL,
-- `race` BIGINT(20) NOT NULL,
-- INDEX `FK_bm22hryqhl1cx6cyvm2grcc7l` (`included_edge`),
-- INDEX `FK_hk1iy0b6oa12m6l4fhw7986eo` (`race`),
-- CONSTRAINT `FK_bm22hryqhl1cx6cyvm2grcc7l` FOREIGN KEY (`included_edge`) REFERENCES `edge` (`id`),

CREATE TABLE `race_ability_attr_adjustment` (
	`id` BIGINT(20) NOT NULL AUTO_INCREMENT,
	`race_ability` BIGINT(20) NOT NULL,
	`attr_type` VARCHAR(255) NOT NULL,
	`bonus` BIGINT(20) NOT NULL,
	PRIMARY KEY (`id`),
	INDEX `FK_race_ability_attr_adjustment__race_ability` (`race_ability`),
	CONSTRAINT `FK_race_ability_attr_adjustment__race_ability` FOREIGN KEY (`race_ability`) REFERENCES `race_ability` (`id`)
) COLLATE='utf8_general_ci' ENGINE=InnoDB;

CREATE TABLE `race_ability_skill_adjustment` (
	`id` BIGINT(20) NOT NULL AUTO_INCREMENT,
	`race_ability` BIGINT(20) NOT NULL,
	`skill_type` VARCHAR(255) NOT NULL,
	`bonus` BIGINT(20) NOT NULL,
	PRIMARY KEY (`id`),
	INDEX `FK_race_ability_skill_adjustment__race_ability` (`race_ability`),
	CONSTRAINT `FK_race_ability_skill_adjustment__race_ability` FOREIGN KEY (`race_ability`) REFERENCES `race_ability` (`id`)
) COLLATE='utf8_general_ci' ENGINE=InnoDB;

ALTER TABLE `race_ability` DROP FOREIGN KEY `FK_bm22hryqhl1cx6cyvm2grcc7l`;
ALTER TABLE `race_ability` DROP INDEX `FK_bm22hryqhl1cx6cyvm2grcc7l`;
ALTER TABLE `race_ability` DROP COLUMN is_complication;
ALTER TABLE `race_ability` DROP COLUMN included_edge;


ALTER TABLE `race_ability` ADD COLUMN race_ability_type VARCHAR(255) NOT NULL;
ALTER TABLE `race_ability` ADD COLUMN name VARCHAR(255) NOT NULL;
ALTER TABLE `race_ability` ADD COLUMN description VARCHAR(1024) NOT NULL;

ALTER TABLE `race_ability` ADD COLUMN restricts_magic_use BIT(1) NOT NULL DEFAULT b'0';
ALTER TABLE `race_ability` ADD COLUMN restricts_psionics_use BIT(1) NOT NULL DEFAULT b'0';
ALTER TABLE `race_ability` ADD COLUMN restricts_cybernetics_use BIT(1) NOT NULL DEFAULT b'0';

ALTER TABLE `race_ability` ADD COLUMN ppe_adjustment BIGINT(20) NOT NULL DEFAULT 0;
ALTER TABLE `race_ability` ADD COLUMN isp_adjustment BIGINT(20) NOT NULL DEFAULT 0;

ALTER TABLE `race_ability` ADD COLUMN charisma_adjustment BIGINT(20) NOT NULL DEFAULT 0;
ALTER TABLE `race_ability` ADD COLUMN toughness_adjustment BIGINT(20) NOT NULL DEFAULT 0;
ALTER TABLE `race_ability` ADD COLUMN parry_adjustment BIGINT(20) NOT NULL DEFAULT 0;
ALTER TABLE `race_ability` ADD COLUMN pace_adjustment BIGINT(20) NOT NULL DEFAULT 0;
ALTER TABLE `race_ability` ADD COLUMN strain_adjustment BIGINT(20) NOT NULL DEFAULT 0;





INSERT INTO `sql_files` (`sql_file_name`, `run_date`) VALUES ('19.sql', NOW());