

ALTER TABLE `race` ADD COLUMN `description` VARCHAR(1000) NOT NULL;
ALTER TABLE `race` ADD COLUMN `type` VARCHAR(255) NOT NULL;

INSERT INTO `race` (`type`, `description`, `has_magic`, `has_psionics`) VALUES ('ALTARA', '', false, false);
INSERT INTO `race` (`type`, `description`, `has_magic`, `has_psionics`) VALUES ('D_NORR', '', false, false);
INSERT INTO `race` (`type`, `description`, `has_magic`, `has_psionics`) VALUES ('DOG_BOY', '', false, false);
INSERT INTO `race` (`type`, `description`, `has_magic`, `has_psionics`) VALUES ('FENNODI', '', false, false);
INSERT INTO `race` (`type`, `description`, `has_magic`, `has_psionics`) VALUES ('GRACKLE_TOOTH', '', false, false);
INSERT INTO `race` (`type`, `description`, `has_magic`, `has_psionics`) VALUES ('LYN_SRIAL', '', false, false);
INSERT INTO `race` (`type`, `description`, `has_magic`, `has_psionics`) VALUES ('PSI_STALKER', '', false, false);
INSERT INTO `race` (`type`, `description`, `has_magic`, `has_psionics`) VALUES ('QUICK_FLEX', '', false, false);
INSERT INTO `race` (`type`, `description`, `has_magic`, `has_psionics`) VALUES ('SIMVAN', '', false, false);
INSERT INTO `race` (`type`, `description`, `has_magic`, `has_psionics`) VALUES ('TRIMADORE', '', false, false);