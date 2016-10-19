USE savage_rifts;

-- COMBAT CYBORG
INSERT INTO framework (type, starting_attribute_points) VALUES ('COMBAT_CYBORG', 2);
SET @COMBAT_CYBORG_ID = LAST_INSERT_ID();

-- start: str d12+2, agi d10, vgr d12
INSERT INTO roll (die_type, modifier) VALUES ('D12', 2);
SET @COMBAT_CYBORG_START_STR = LAST_INSERT_ID();
UPDATE framework SET starting_strength = @COMBAT_CYBORG_START_STR WHERE id = @COMBAT_CYBORG_ID;

INSERT INTO roll (die_type, modifier) VALUES ('D10', 0);
SET @COMBAT_CYBORG_START_AGI = LAST_INSERT_ID();
UPDATE framework SET starting_agility = @COMBAT_CYBORG_START_AGI WHERE id = @COMBAT_CYBORG_ID;

INSERT INTO roll (die_type, modifier) VALUES ('D12', 0);
SET @COMBAT_CYBORG_START_VGR = LAST_INSERT_ID();
UPDATE framework SET starting_vigor = @COMBAT_CYBORG_START_VGR WHERE id = @COMBAT_CYBORG_ID;

-- max: str d12+2, agi d10, vgr d12
INSERT INTO roll (die_type, modifier) VALUES ('D12', 2);
SET @COMBAT_CYBORG_MAX_STR = LAST_INSERT_ID();
UPDATE framework SET max_strength = @COMBAT_CYBORG_MAX_STR WHERE id = @COMBAT_CYBORG_ID;

INSERT INTO roll (die_type, modifier) VALUES ('D10', 0);
SET @COMBAT_CYBORG_MAX_AGI = LAST_INSERT_ID();
UPDATE framework SET max_agility = @COMBAT_CYBORG_MAX_AGI WHERE id = @COMBAT_CYBORG_ID;

INSERT INTO roll (die_type, modifier) VALUES ('D12', 0);
SET @COMBAT_CYBORG_MAX_VGR = LAST_INSERT_ID();
UPDATE framework SET max_vigor = @COMBAT_CYBORG_MAX_VGR WHERE id = @COMBAT_CYBORG_ID;

-- CRAZY
INSERT INTO framework (type, starting_attribute_points) VALUES ('CRAZY', null);
SET @CRAZY_ID = LAST_INSERT_ID();

-- start: str d8, agi d8, vgr d8
INSERT INTO roll (die_type, modifier) VALUES ('D8', 0);
SET @CRAZY_START_STR = LAST_INSERT_ID();
UPDATE framework SET starting_strength = @CRAZY_START_STR WHERE id = @CRAZY_ID;

INSERT INTO roll (die_type, modifier) VALUES ('D8', 0);
SET @CRAZY_START_AGI = LAST_INSERT_ID();
UPDATE framework SET starting_agility = @CRAZY_START_AGI WHERE id = @CRAZY_ID;

INSERT INTO roll (die_type, modifier) VALUES ('D8', 0);
SET @CRAZY_START_VGR = LAST_INSERT_ID();
UPDATE framework SET starting_vigor = @CRAZY_START_VGR WHERE id = @CRAZY_ID;

INSERT INTO `sql_files` (`sql_file_name`, `run_date`) VALUES ('5.sql', NOW());
