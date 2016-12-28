USE savage_rifts;

-- create skill_knowledge
CREATE TABLE `skill_knowledge` (
    `id` BIGINT(20) NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(255) NOT NULL,
    `knowledge_category` VARCHAR(255) NOT NULL,
    `user` BIGINT(20) DEFAULT NULL,
    PRIMARY KEY (`id`),
    INDEX `FK_skill_knowledge__user` (`user`),
    CONSTRAINT `FK_skill_knowledge__user` FOREIGN KEY (`user`) REFERENCES `user` (`id`)
) COLLATE='utf8_general_ci' ENGINE=InnoDB;

-- add a skill_knowledge to skill_roll
ALTER TABLE `skill_roll` ADD COLUMN `skill_knowledge` BIGINT(20) DEFAULT NULL;
ALTER TABLE `skill_roll` ADD CONSTRAINT `FK_skill_roll__skill_knowledge` FOREIGN KEY(`skill_knowledge`) REFERENCES `skill_knowledge` (`id`);

INSERT INTO `sql_files` (`sql_file_name`, `run_date`) VALUES ('17.sql', NOW());