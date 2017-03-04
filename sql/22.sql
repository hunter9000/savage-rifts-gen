USE savage_rifts;

ALTER TABLE `skill_raise_selection` ADD COLUMN `skill_knowledge` BIGINT(20) DEFAULT NULL;

INSERT INTO `sql_files` (`sql_file_name`, `run_date`) VALUES ('22.sql', NOW());