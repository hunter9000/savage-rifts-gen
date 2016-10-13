USE savage_rifts;

ALTER TABLE `framework` ADD COLUMN `has_strength_limit` BIT(1) NOT NULL DEFAULT b'1';
ALTER TABLE `framework` ADD COLUMN `has_agility_limit` BIT(1) NOT NULL DEFAULT b'1';
ALTER TABLE `framework` ADD COLUMN `has_smarts_limit` BIT(1) NOT NULL DEFAULT b'1';
ALTER TABLE `framework` ADD COLUMN `has_spirit_limit` BIT(1) NOT NULL DEFAULT b'1';
ALTER TABLE `framework` ADD COLUMN `has_vigor_limit` BIT(1) NOT NULL DEFAULT b'1';