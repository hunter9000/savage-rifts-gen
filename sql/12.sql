USE savage_rifts;

CREATE TABLE `hindrance` (
	`id` BIGINT(20) NOT NULL AUTO_INCREMENT,
	`type` VARCHAR(255) NOT NULL,
	`description` VARCHAR(1000) NOT NULL,
	`is_minor` BIT(1) NOT NULL,
	`is_major` BIT(1) NOT NULL,
	PRIMARY KEY (`id`)
) COLLATE='utf8_general_ci' ENGINE=InnoDB;

CREATE TABLE `hindrance_selection` (
	`id` BIGINT(20) NOT NULL AUTO_INCREMENT,
	`hindrance` BIGINT(20) NULL DEFAULT NULL,
	`sheet` BIGINT(20) NULL DEFAULT NULL,
	PRIMARY KEY (`id`),
	INDEX `FK_hindrance_selection__hindrance` (`hindrance`),
	INDEX `FK_hindrance_selection__sheet` (`sheet`),
	CONSTRAINT `FK_hindrance_selection__hindrance` FOREIGN KEY (`hindrance`) REFERENCES `hindrance` (`id`),
	CONSTRAINT `FK_hindrance_selection__sheet` FOREIGN KEY (`sheet`) REFERENCES `sheet` (`id`)
) COLLATE='utf8_general_ci' ENGINE=InnoDB;


INSERT INTO `hindrance` (`type`, `description`, `is_minor`, `is_major`) VALUES 
('ALL_THUMBS', '', true, false),
('ANEMIC', '', true, false),
('ARROGANT', '', false, true),
('BAD_EYES', '', true, true),
('BAD_LUCK', '', false, true),
('BIG_MOUTH', '', true, false),
('BLIND', '', false, true),
('BLOODTHIRSTY', '', false, true),
('CAUTIOUS', '', true, false),
('CLUELESS', '', false, true),
('CODE_OF_HONOR', '', false, true),
('CURIOUS', '', false, true),
('DEATH_WISH', '', true, false),
('DELUSIONAL', '', true, true),
('DOUBTING_THOMAS', '', true, false),
('ELDERLY', '', false, true),
('ENEMY', '', true, true),
('GREEDY', '', true, true),
('HABIT', '', true, true),
('HARD_OF_HEARING', '', true, true),
('HEROIC', '', false, true),
('ILLITERATE', '', true, false),
('LAME', '', false, true),
('LAST_CALL', '', true, false),
('LOYAL', '', true, false),
('MANIA', '', true, true),
('MEAN', '', true, false),
('MONOLOGUER', '', false, true),
('OBESE', '', true, false),
('ONE_ARM', '', false, true),
('ONE_EYE', '', false, true),
('ONE_LEG', '', false, true),
('OUTSIDER', '', true, false),
('OVERCONFIDENT', '', false, true),
('PACIFIST', '', true, true),
('PHOBIA', '', true, true),
('POVERTY', '', true, false),
('QUIRK', '', true, false),
('SMALL', '', false, true),
('STUBBORN', '', true, false),
('UGLY', '', true, false),
('VENGEFUL', '', true, true),
('VOW', '', true, true),
('WANTED', '', true, true),
('YELLOW', '', false, true),
('YOUNG', '', false, true);


INSERT INTO `sql_files` (`sql_file_name`, `run_date`) VALUES ('12.sql', NOW());