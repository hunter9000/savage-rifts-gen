USE savage_rifts;

ALTER TABLE `skill_raise_selection` ADD COLUMN `skill_knowledge` BIGINT(20) DEFAULT NULL;

CREATE TABLE `perk_edge_choice` (
    `id` BIGINT(20) NOT NULL AUTO_INCREMENT,
    `perk` BIGINT(20) NOT NULL,
    `edge_category` VARCHAR(255) NOT NULL,

    PRIMARY KEY(`id`),
    INDEX `FK_perk_edge_choice__perk` (`perk`),
    CONSTRAINT `FK_perk_edge_choice__perk` FOREIGN KEY (`perk`) REFERENCES `perk` (`id`)
) COLLATE='utf8_general_ci' ENGINE=InnoDB;

CREATE TABLE `perk_provided_edge` (
    `id` BIGINT(20) NOT NULL AUTO_INCREMENT,
    `perk` BIGINT(20) NOT NULL,
    `provided_edge` BIGINT(20) NOT NULL,
    `backup_edge` BIGINT(20) DEFAULT NULL,

    PRIMARY KEY(`id`),
    INDEX `FK_perk_provided_edge__perk` (`perk`),
    INDEX `FK_perk_provided_edge__provided_edge` (`provided_edge`),
    INDEX `FK_perk_provided_edge__backup_edge` (`backup_edge`),
    CONSTRAINT `FK_perk_provided_edge__perk` FOREIGN KEY (`perk`) REFERENCES `perk` (`id`),
    CONSTRAINT `FK_perk_provided_edge__provided_edge` FOREIGN KEY (`provided_edge`) REFERENCES `edge` (`id`),
    CONSTRAINT `FK_perk_provided_edge__backup_edge` FOREIGN KEY (`backup_edge`) REFERENCES `edge` (`id`)
) COLLATE='utf8_general_ci' ENGINE=InnoDB;


ALTER TABLE `perk` ADD COLUMN `parry_bonus` BIGINT(20) DEFAULT NULL;
ALTER TABLE `perk` ADD COLUMN `isp_bonus` BIGINT(20) DEFAULT NULL;
ALTER TABLE `perk` ADD COLUMN `ppe_bonus` BIGINT(20) DEFAULT NULL;
ALTER TABLE `perk` ADD COLUMN `num_languages_bonus` BIGINT(20) DEFAULT NULL;
ALTER TABLE `perk` ADD COLUMN `max_times_chosen` BIGINT(20) DEFAULT NULL;


CREATE TABLE `skill_purchase` (
    `id` BIGINT(20) NOT NULL AUTO_INCREMENT,
    `sheet` BIGINT(20) NOT NULL,
    `skill_type` VARCHAR(255) NOT NULL,
    `skill_knowledge` BIGINT(20) DEFAULT NULL,
    PRIMARY KEY(`id`),

	INDEX `FK_skill_purchase__sheet` (`sheet`),
    INDEX `FK_skill_purchase__skill_knowledge` (`skill_knowledge`),
    CONSTRAINT `FK_skill_purchase__sheet` FOREIGN KEY (`sheet`) REFERENCES `sheet` (`id`),
	CONSTRAINT `FK_skill_purchase__skill_knowledge` FOREIGN KEY (`skill_knowledge`) REFERENCES `skill_knowledge` (`id`)
) COLLATE='utf8_general_ci' ENGINE=InnoDB;

INSERT INTO `sql_files` (`sql_file_name`, `run_date`) VALUES ('22.sql', NOW());