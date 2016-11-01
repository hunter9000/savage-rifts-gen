USE savage_rifts;

-- CYBER_KNIGHT
INSERT INTO framework (type, starting_attribute_points) VALUES ('CYBER_KNIGHT', NULL);
SET @CYBER_KNIGHT_ID = LAST_INSERT_ID();

-- GLITTER_BOY
INSERT INTO framework (type, starting_attribute_points) VALUES ('GLITTER_BOY', NULL);
SET @GLITTER_BOY_ID = LAST_INSERT_ID();

-- JUICER
INSERT INTO framework (type, starting_attribute_points, has_strength_limit, has_agility_limit, has_vigor_limit) VALUES ('JUICER', NULL, false, false, false);
SET @JUICER_ID = LAST_INSERT_ID();

INSERT INTO roll (die_type, modifier) VALUES ('D8', 0);
SET @JUICER_START_STR = LAST_INSERT_ID();
UPDATE framework SET starting_strength = @JUICER_START_STR WHERE id = @JUICER_ID;

INSERT INTO roll (die_type, modifier) VALUES ('D8', 0);
SET @JUICER_START_AGI = LAST_INSERT_ID();
UPDATE framework SET starting_agility = @JUICER_START_AGI WHERE id = @JUICER_ID;

INSERT INTO roll (die_type, modifier) VALUES ('D8', 0);
SET @JUICER_START_VGR = LAST_INSERT_ID();
UPDATE framework SET starting_vigor = @JUICER_START_VGR WHERE id = @JUICER_ID;

-- #######

-- MARS
INSERT INTO framework (type, starting_attribute_points) VALUES ('MARS', NULL);
SET @MARS_ID = LAST_INSERT_ID();

-- BURSTER
INSERT INTO framework (type, starting_attribute_points) VALUES ('BURSTER', NULL);
SET @BURSTER_ID = LAST_INSERT_ID();

-- MIND_MELTER
INSERT INTO framework (type, starting_attribute_points) VALUES ('MIND_MELTER', NULL);
SET @MIND_MELTER_ID = LAST_INSERT_ID();

-- LEY_LINE_WALKER
INSERT INTO framework (type, starting_attribute_points) VALUES ('LEY_LINE_WALKER', NULL);
SET @LEY_LINE_WALKER_ID = LAST_INSERT_ID();

-- MYSTIC
INSERT INTO framework (type, starting_attribute_points) VALUES ('MYSTIC', NULL);
SET @MYSTIC_ID = LAST_INSERT_ID();

-- TECHNO_WIZARD
INSERT INTO framework (type, starting_attribute_points) VALUES ('TECHNO_WIZARD', NULL);
SET @TECHNO_WIZARD_ID = LAST_INSERT_ID();

-- DRAGON
INSERT INTO framework (type, starting_attribute_points) VALUES ('DRAGON', NULL);
SET @DRAGON_ID = LAST_INSERT_ID();



-- ---------------



-- start: str d12+2, agi d10, vgr d12
-- INSERT INTO roll (die_type, modifier) VALUES ('D12', 2);
-- SET @COMBAT_CYBORG_START_STR = LAST_INSERT_ID();
-- UPDATE framework SET starting_strength = @COMBAT_CYBORG_START_STR WHERE id = @COMBAT_CYBORG_ID;

-- INSERT INTO roll (die_type, modifier) VALUES ('D10', 0);
-- SET @COMBAT_CYBORG_START_AGI = LAST_INSERT_ID();
-- UPDATE framework SET starting_agility = @COMBAT_CYBORG_START_AGI WHERE id = @COMBAT_CYBORG_ID;

-- INSERT INTO roll (die_type, modifier) VALUES ('D12', 0);
-- SET @COMBAT_CYBORG_START_VGR = LAST_INSERT_ID();
-- UPDATE framework SET starting_vigor = @COMBAT_CYBORG_START_VGR WHERE id = @COMBAT_CYBORG_ID;

-- max: str d12+2, agi d10, vgr d12
-- INSERT INTO roll (die_type, modifier) VALUES ('D12', 2);
-- SET @COMBAT_CYBORG_MAX_STR = LAST_INSERT_ID();
-- UPDATE framework SET max_strength = @COMBAT_CYBORG_MAX_STR WHERE id = @COMBAT_CYBORG_ID;

-- INSERT INTO roll (die_type, modifier) VALUES ('D10', 0);
-- SET @COMBAT_CYBORG_MAX_AGI = LAST_INSERT_ID();
-- UPDATE framework SET max_agility = @COMBAT_CYBORG_MAX_AGI WHERE id = @COMBAT_CYBORG_ID;

-- INSERT INTO roll (die_type, modifier) VALUES ('D12', 0);
-- SET @COMBAT_CYBORG_MAX_VGR = LAST_INSERT_ID();
-- UPDATE framework SET max_vigor = @COMBAT_CYBORG_MAX_VGR WHERE id = @COMBAT_CYBORG_ID;

-- CRAZY
-- INSERT INTO framework (type, starting_attribute_points) VALUES ('CRAZY', null);
-- SET @CRAZY_ID = LAST_INSERT_ID();

-- start: str d8, agi d8, vgr d8
-- INSERT INTO roll (die_type, modifier) VALUES ('D8', 0);
-- SET @CRAZY_START_STR = LAST_INSERT_ID();
-- UPDATE framework SET starting_strength = @CRAZY_START_STR WHERE id = @CRAZY_ID;

-- INSERT INTO roll (die_type, modifier) VALUES ('D8', 0);
-- SET @CRAZY_START_AGI = LAST_INSERT_ID();
-- UPDATE framework SET starting_agility = @CRAZY_START_AGI WHERE id = @CRAZY_ID;

-- INSERT INTO roll (die_type, modifier) VALUES ('D8', 0);
-- SET @CRAZY_START_VGR = LAST_INSERT_ID();
-- UPDATE framework SET starting_vigor = @CRAZY_START_VGR WHERE id = @CRAZY_ID;



INSERT INTO `framework_feature` (`framework`, `framework_feature_type`, `framework_ability_type`, `description`) VALUES
(@CYBER_KNIGHT_ID, 'CYBER_ARMOR', 'BONUS', ''),
(@CYBER_KNIGHT_ID, 'CYBERKINETIC_COMBAT', 'BONUS', ''),
(@CYBER_KNIGHT_ID, 'FIRST_INTO_BATTLE', 'BONUS', ''),
(@CYBER_KNIGHT_ID, 'INNER_LIGHT', 'BONUS', ''),
(@CYBER_KNIGHT_ID, 'INTENSE_COMBAT_TRAINING', 'BONUS', ''),
(@CYBER_KNIGHT_ID, 'MINOR_PSIONIC', 'BONUS', ''),
(@CYBER_KNIGHT_ID, 'PSI_SWORD', 'BONUS', ''),
(@CYBER_KNIGHT_ID, 'REVERED_PROTECTORS', 'BONUS', ''),

(@CYBER_KNIGHT_ID, 'CODE_OF_HONOR', 'COMPLICATION', ''),
(@CYBER_KNIGHT_ID, 'CYBERNETICS', 'COMPLICATION', ''),


INSERT INTO `sql_files` (`sql_file_name`, `run_date`) VALUES ('15.sql', NOW());
