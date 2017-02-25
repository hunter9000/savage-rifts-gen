USE savage_rifts;

-- add skill knowledge to the prerequisite table for skills
ALTER TABLE `edge_skill_prerequisite` ADD COLUMN `skill_knowledge` BIGINT(20) DEFAULT NULL;
ALTER TABLE `edge_skill_prerequisite` ADD CONSTRAINT `FK_edge_skill_prerequisite__skill_knowledge` FOREIGN KEY(`skill_knowledge`) REFERENCES `skill_knowledge` (`id`);

-- make the category optionsl
ALTER TABLE `skill_knowledge` MODIFY COLUMN knowledge_category VARCHAR(255) DEFAULT NULL;

-- add BATTLE and ARCANA knowledge types
INSERT INTO `skill_knowledge` (name, knowledge_category) VALUES ('BATTLE', null);
SET @BATTLE_ID = LAST_INSERT_ID();
INSERT INTO `skill_knowledge` (name, knowledge_category) VALUES ('ARCANA', null);
SET @ARCANA_ID = LAST_INSERT_ID();


-- insert knowledge types for the prereqs that have them
UPDATE `edge_skill_prerequisite` SET skill_knowledge = @BATTLE_ID WHERE edge = (SELECT id FROM `edge` WHERE edge_type = 'TACTICIAN');
UPDATE `edge_skill_prerequisite` SET skill_knowledge = @ARCANA_ID WHERE edge = (SELECT id FROM `edge` WHERE edge_type = 'SOUL_DRAIN');
UPDATE `edge_skill_prerequisite` SET skill_knowledge = @ARCANA_ID WHERE edge = (SELECT id FROM `edge` WHERE edge_type = 'WIZARD');
UPDATE `edge_skill_prerequisite` SET skill_knowledge = @ARCANA_ID WHERE edge = (SELECT id FROM `edge` WHERE edge_type = 'MASTER_OF_MAGIC');



INSERT INTO `sql_files` (`sql_file_name`, `run_date`) VALUES ('18.sql', NOW());