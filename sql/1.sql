CREATE DATABASE `savage_rifts`;

CREATE TABLE `sql_files` (
	`id` BIGINT(20) NOT NULL AUTO_INCREMENT,
	`sql_file_name` VARCHAR(255) NOT NULL,
	`run_date` DATETIME NOT NULL,
	PRIMARY KEY (`id`)
) COLLATE='utf8_general_ci' ENGINE=InnoDB;