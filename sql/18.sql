USE savage_rifts;

ALTER TABLE `edge_skill_prerequisite` ADD COLUMN `skill_knowledge` BIGINT(20) DEFAULT NULL;
ALTER TABLE `edge_skill_prerequisite` ADD CONSTRAINT `FK_edge_skill_prerequisite__skill_knowledge` FOREIGN KEY(`skill_knowledge`) REFERENCES `skill_knowledge` (`id`);

-- insert knowledge types for the prereqs that have them

INSERT INTO `sql_files` (`sql_file_name`, `run_date`) VALUES ('18.sql', NOW());