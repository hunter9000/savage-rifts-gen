USE savage_rifts;

ALTER TABLE `race` ADD COLUMN `type` VARCHAR(255) NOT NULL;

INSERT INTO `race` (`type`, `has_magic`, `has_psionics`) VALUES ('ALTARA', true, true);
INSERT INTO `race` (`type`, `has_magic`, `has_psionics`) VALUES ('D_NORR', true, false);
INSERT INTO `race` (`type`, `has_magic`, `has_psionics`) VALUES ('DOG_BOY', false, true);
INSERT INTO `race` (`type`, `has_magic`, `has_psionics`) VALUES ('FENNODI', true, true);
INSERT INTO `race` (`type`, `has_magic`, `has_psionics`) VALUES ('GRACKLE_TOOTH', false, false);
INSERT INTO `race` (`type`, `has_magic`, `has_psionics`) VALUES ('LYN_SRIAL', true, true);
INSERT INTO `race` (`type`, `has_magic`, `has_psionics`) VALUES ('PSI_STALKER', false, true);
INSERT INTO `race` (`type`, `has_magic`, `has_psionics`) VALUES ('QUICK_FLEX', false, true);
INSERT INTO `race` (`type`, `has_magic`, `has_psionics`) VALUES ('SIMVAN', true, true);
INSERT INTO `race` (`type`, `has_magic`, `has_psionics`) VALUES ('TRIMADORE', true, true);