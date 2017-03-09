USE savage_rifts;

-- drop framework.provided_edge
ALTER TABLE `framework_feature` DROP FOREIGN KEY `FK_framework_feature__edge`;
ALTER TABLE `framework_feature` DROP COLUMN `provided_edge`;

-- create table for frameowrk provided edges
CREATE TABLE `framework_edge` (
    `id` BIGINT(20) NOT NULL AUTO_INCREMENT,
    `framework_feature` BIGINT(20) NOT NULL,
    `edge` BIGINT(20) NOT NULL,

    PRIMARY KEY(`id`),
    INDEX `FK_framework_edge__framework_feature` (`framework_feature`),
    INDEX `FK_framework_edge__edge` (`edge`),
    CONSTRAINT `FK_framework_edge__framework_feature` FOREIGN KEY (`framework_feature`) REFERENCES `framework_feature` (`id`),
    CONSTRAINT `FK_framework_edge__edge` FOREIGN KEY (`edge`) REFERENCES `edge` (`id`)
) COLLATE='utf8_general_ci' ENGINE=InnoDB;

INSERT INTO `framework_edge` (framework_feature, edge) VALUES ((SELECT id FROM framework_feature WHERE framework_feature_type = 'HIGH_PERFORMANCE_LEGS'), (SELECT id FROM edge WHERE edge_type = 'FLEET_FOOTED'));
INSERT INTO `framework_edge` (framework_feature, edge) VALUES ((SELECT id FROM framework_feature WHERE framework_feature_type = 'UPGRADABLE'), (SELECT id FROM edge WHERE edge_type = 'UPGRADABLE'));
INSERT INTO `framework_edge` (framework_feature, edge) VALUES ((SELECT id FROM framework_feature WHERE framework_feature_type = 'MINOR_PSIONIC'), (SELECT id FROM edge WHERE edge_type = 'ARCANE_BACKGROUND_PSIONICS'));
INSERT INTO `framework_edge` (framework_feature, edge) VALUES ((SELECT id FROM framework_feature WHERE framework_feature_type = 'QUICK'), (SELECT id FROM edge WHERE edge_type = 'QUICK'));
INSERT INTO `framework_edge` (framework_feature, edge) VALUES ((SELECT id FROM framework_feature WHERE framework_feature_type = 'CK_INNER_LIGHT'), (SELECT id FROM edge WHERE edge_type = 'CHAMPION'));
INSERT INTO `framework_edge` (framework_feature, edge) VALUES ((SELECT id FROM framework_feature WHERE framework_feature_type = 'CK_MINOR_PSIONIC'), (SELECT id FROM edge WHERE edge_type = 'ARCANE_BACKGROUND_PSIONICS'));
INSERT INTO `framework_edge` (framework_feature, edge) VALUES ((SELECT id FROM framework_feature WHERE framework_feature_type = 'GB_FULLY_TRAINED'), (SELECT id FROM edge WHERE edge_type = 'POWER_ARMOR_JOCK'));
INSERT INTO `framework_edge` (framework_feature, edge) VALUES ((SELECT id FROM framework_feature WHERE framework_feature_type = 'JC_SUPER_REFLEXES'), (SELECT id FROM edge WHERE edge_type = 'QUICK'));
INSERT INTO `framework_edge` (framework_feature, edge) VALUES ((SELECT id FROM framework_feature WHERE framework_feature_type = 'JC_SUPER_SPEED'), (SELECT id FROM edge WHERE edge_type = 'FLEET_FOOTED'));
INSERT INTO `framework_edge` (framework_feature, edge) VALUES ((SELECT id FROM framework_feature WHERE framework_feature_type = 'JC_SUPER_STRENGTH'), (SELECT id FROM edge WHERE edge_type = 'BRAWNY'));
INSERT INTO `framework_edge` (framework_feature, edge) VALUES ((SELECT id FROM framework_feature WHERE framework_feature_type = 'BRST_MAJOR_PSIONICS'), (SELECT id FROM edge WHERE edge_type = 'MAJOR_PSIONIC'));
INSERT INTO `framework_edge` (framework_feature, edge) VALUES ((SELECT id FROM framework_feature WHERE framework_feature_type = 'MM_MAJOR_PSIONIC'), (SELECT id FROM edge WHERE edge_type = 'MAJOR_PSIONIC'));
INSERT INTO `framework_edge` (framework_feature, edge) VALUES ((SELECT id FROM framework_feature WHERE framework_feature_type = 'MM_MASTER_PSIONIC'), (SELECT id FROM edge WHERE edge_type = 'MASTER_PSIONIC'));
INSERT INTO `framework_edge` (framework_feature, edge) VALUES ((SELECT id FROM framework_feature WHERE framework_feature_type = 'LLW_MASTER_OF_MAGIC'), (SELECT id FROM edge WHERE edge_type = 'MASTER_OF_MAGIC'));
INSERT INTO `framework_edge` (framework_feature, edge) VALUES ((SELECT id FROM framework_feature WHERE framework_feature_type = 'LLW_MASTER_OF_MAGIC'), (SELECT id FROM edge WHERE edge_type = 'RAPID_RECHARGE'));
INSERT INTO `framework_edge` (framework_feature, edge) VALUES ((SELECT id FROM framework_feature WHERE framework_feature_type = 'MYST_ARCANE_BACKGROUND_MIRACLES'), (SELECT id FROM edge WHERE edge_type = 'ARCANE_BACKGROUND_MAGIC'));
INSERT INTO `framework_edge` (framework_feature, edge) VALUES ((SELECT id FROM framework_feature WHERE framework_feature_type = 'MYST_ARCANE_BACKGROUND_PSIONICS'), (SELECT id FROM edge WHERE edge_type = 'ARCANE_BACKGROUND_PSIONICS'));
INSERT INTO `framework_edge` (framework_feature, edge) VALUES ((SELECT id FROM framework_feature WHERE framework_feature_type = 'MYST_MASTER_OF_MAGIC'), (SELECT id FROM edge WHERE edge_type = 'MASTER_OF_MAGIC'));
INSERT INTO `framework_edge` (framework_feature, edge) VALUES ((SELECT id FROM framework_feature WHERE framework_feature_type = 'MYST_MASTER_OF_MAGIC'), (SELECT id FROM edge WHERE edge_type = 'RAPID_RECHARGE'));
INSERT INTO `framework_edge` (framework_feature, edge) VALUES ((SELECT id FROM framework_feature WHERE framework_feature_type = 'MYST_MYSTIC_AWARENESS'), (SELECT id FROM edge WHERE edge_type = 'ALERTNESS'));
INSERT INTO `framework_edge` (framework_feature, edge) VALUES ((SELECT id FROM framework_feature WHERE framework_feature_type = 'MYST_MYSTIC_AWARENESS'), (SELECT id FROM edge WHERE edge_type = 'DANGER_SENSE'));
INSERT INTO `framework_edge` (framework_feature, edge) VALUES ((SELECT id FROM framework_feature WHERE framework_feature_type = 'TW_ARCANE_BACKGROUND_WEIRD_SCIENCE'), (SELECT id FROM edge WHERE edge_type = 'ARCANE_BACKGROUND_WEIRD_SCIENCE'));
INSERT INTO `framework_edge` (framework_feature, edge) VALUES ((SELECT id FROM framework_feature WHERE framework_feature_type = 'TW_ARCANE_MACHINIST'), (SELECT id FROM edge WHERE edge_type = 'GADGETEER'));
INSERT INTO `framework_edge` (framework_feature, edge) VALUES ((SELECT id FROM framework_feature WHERE framework_feature_type = 'DRGN_ARCANE_BACKGROUND_PSIONICS'), (SELECT id FROM edge WHERE edge_type = 'ARCANE_BACKGROUND_PSIONICS'));


INSERT INTO `sql_files` (`sql_file_name`, `run_date`) VALUES ('25.sql', NOW());