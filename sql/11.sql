USE savage_rifts;

ALTER TABLE `framework` ADD COLUMN `has_strength_limit` BIT(1) NOT NULL DEFAULT b'1';
ALTER TABLE `framework` ADD COLUMN `has_agility_limit` BIT(1) NOT NULL DEFAULT b'1';
ALTER TABLE `framework` ADD COLUMN `has_smarts_limit` BIT(1) NOT NULL DEFAULT b'1';
ALTER TABLE `framework` ADD COLUMN `has_spirit_limit` BIT(1) NOT NULL DEFAULT b'1';
ALTER TABLE `framework` ADD COLUMN `has_vigor_limit` BIT(1) NOT NULL DEFAULT b'1';

ALTER TABLE `sheet` ADD COLUMN `rank` VARCHAR(255) NOT NULL;

ALTER TABLE `skill_roll` ADD COLUMN `sheet` BIGINT(20) NOT NULL;
CREATE INDEX `FK_skill_roll__sheet` ON `skill_roll` (`sheet`);
ALTER TABLE `skill_roll` ADD CONSTRAINT `FK_skill_roll__sheet` FOREIGN KEY (`sheet`) REFERENCES `sheet` (`id`);

