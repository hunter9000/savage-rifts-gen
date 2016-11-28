USE savage_rifts;

-- Adding the benefit table definitions for the remaining tables, and added their rolls
-- added missing table rolls for combat cyborg and crazy frameworks

-- TODO copy descriptions for all tables

-- these 4 have already had their rolls defined in 7.sql, they're here to add them to more frameworks
SELECT @BODY_ARMOR_ID:=id FROM benefit_table WHERE type = 'BODY_ARMOR';
SELECT @CCW_ID:=id FROM benefit_table WHERE type = 'CLOSE_COMBAT_WEAPONS';
SELECT @CYBERNETICS_ID:=id FROM benefit_table WHERE type = 'CYBERNETICS';
SELECT @EDUCATION_ID:=id FROM benefit_table WHERE type = 'EDUCATION';

-- these 7 are having their rolls defined here
SELECT @ENCHANTED_ITEMS_MYSTIC_GADGETS_ID:=id FROM benefit_table WHERE type = 'ENCHANTED_ITEMS_MYSTIC_GADGETS';
SELECT @RANGED_WEAPONS_ID:=id FROM benefit_table WHERE type = 'RANGED_WEAPONS';
SELECT @MAGIC_MYSTICISM_ID:=id FROM benefit_table WHERE type = 'MAGIC_MYSTICISM';
SELECT @PSIONICS_ID:=id FROM benefit_table WHERE type = 'PSIONICS';
SELECT @RANGED_WEAPONS_ID:=id FROM benefit_table WHERE type = 'RANGED_WEAPONS';
SELECT @TRAINING_ID:=id FROM benefit_table WHERE type = 'TRAINING';
SELECT @UNDERWORLD_BLACK_OPS_ID:=id FROM benefit_table WHERE type = 'UNDERWORLD_BLACK_OPS';


-- enchanted items and mystic gadgets table
INSERT INTO perk (description, type) VALUES ('', 'ENCHANTED_ITEMS_MYSTIC_GADGETS_1');
SET @ENCHANTED_ITEMS_MYSTIC_GADGETS_1 = LAST_INSERT_ID();
INSERT INTO perk (description, type) VALUES ('', 'ENCHANTED_ITEMS_MYSTIC_GADGETS_2');
SET @ENCHANTED_ITEMS_MYSTIC_GADGETS_2 = LAST_INSERT_ID();
INSERT INTO perk (description, type) VALUES ('', 'ENCHANTED_ITEMS_MYSTIC_GADGETS_3');
SET @ENCHANTED_ITEMS_MYSTIC_GADGETS_3 = LAST_INSERT_ID();
INSERT INTO perk (description, type) VALUES ('', 'ENCHANTED_ITEMS_MYSTIC_GADGETS_4');
SET @ENCHANTED_ITEMS_MYSTIC_GADGETS_4 = LAST_INSERT_ID();
INSERT INTO perk (description, type) VALUES ('', 'ENCHANTED_ITEMS_MYSTIC_GADGETS_5');
SET @ENCHANTED_ITEMS_MYSTIC_GADGETS_5 = LAST_INSERT_ID();
INSERT INTO perk (description, type) VALUES ('', 'ENCHANTED_ITEMS_MYSTIC_GADGETS_6');
SET @ENCHANTED_ITEMS_MYSTIC_GADGETS_6 = LAST_INSERT_ID();
INSERT INTO perk (description, type) VALUES ('', 'ENCHANTED_ITEMS_MYSTIC_GADGETS_7');
SET @ENCHANTED_ITEMS_MYSTIC_GADGETS_7 = LAST_INSERT_ID();
INSERT INTO perk (description, type) VALUES ('', 'ENCHANTED_ITEMS_MYSTIC_GADGETS_8');
SET @ENCHANTED_ITEMS_MYSTIC_GADGETS_8 = LAST_INSERT_ID();
INSERT INTO perk (description, type) VALUES ('', 'ENCHANTED_ITEMS_MYSTIC_GADGETS_9');
SET @ENCHANTED_ITEMS_MYSTIC_GADGETS_9 = LAST_INSERT_ID();
INSERT INTO perk (description, type) VALUES ('', 'ENCHANTED_ITEMS_MYSTIC_GADGETS_10');
SET @ENCHANTED_ITEMS_MYSTIC_GADGETS_10 = LAST_INSERT_ID();
INSERT INTO perk (description, type) VALUES ('', 'ENCHANTED_ITEMS_MYSTIC_GADGETS_11');
SET @ENCHANTED_ITEMS_MYSTIC_GADGETS_11 = LAST_INSERT_ID();
INSERT INTO perk (description, type) VALUES ('', 'ENCHANTED_ITEMS_MYSTIC_GADGETS_12');
SET @ENCHANTED_ITEMS_MYSTIC_GADGETS_12 = LAST_INSERT_ID();
INSERT INTO perk (description, type) VALUES ('', 'ENCHANTED_ITEMS_MYSTIC_GADGETS_13');
SET @ENCHANTED_ITEMS_MYSTIC_GADGETS_13 = LAST_INSERT_ID();

INSERT INTO perk_range (min, max, benefit_table, perk) VALUES (1, 1, @ENCHANTED_ITEMS_MYSTIC_GADGETS_ID, @ENCHANTED_ITEMS_MYSTIC_GADGETS_1);
INSERT INTO perk_range (min, max, benefit_table, perk) VALUES (2, 3, @ENCHANTED_ITEMS_MYSTIC_GADGETS_ID, @ENCHANTED_ITEMS_MYSTIC_GADGETS_2);
INSERT INTO perk_range (min, max, benefit_table, perk) VALUES (4, 4, @ENCHANTED_ITEMS_MYSTIC_GADGETS_ID, @ENCHANTED_ITEMS_MYSTIC_GADGETS_3);
INSERT INTO perk_range (min, max, benefit_table, perk) VALUES (5, 6, @ENCHANTED_ITEMS_MYSTIC_GADGETS_ID, @ENCHANTED_ITEMS_MYSTIC_GADGETS_4);
INSERT INTO perk_range (min, max, benefit_table, perk) VALUES (7, 8, @ENCHANTED_ITEMS_MYSTIC_GADGETS_ID, @ENCHANTED_ITEMS_MYSTIC_GADGETS_5);
INSERT INTO perk_range (min, max, benefit_table, perk) VALUES (9, 10, @ENCHANTED_ITEMS_MYSTIC_GADGETS_ID, @ENCHANTED_ITEMS_MYSTIC_GADGETS_6);
INSERT INTO perk_range (min, max, benefit_table, perk) VALUES (11, 11, @ENCHANTED_ITEMS_MYSTIC_GADGETS_ID, @ENCHANTED_ITEMS_MYSTIC_GADGETS_7);
INSERT INTO perk_range (min, max, benefit_table, perk) VALUES (12, 13, @ENCHANTED_ITEMS_MYSTIC_GADGETS_ID, @ENCHANTED_ITEMS_MYSTIC_GADGETS_8);
INSERT INTO perk_range (min, max, benefit_table, perk) VALUES (14, 15, @ENCHANTED_ITEMS_MYSTIC_GADGETS_ID, @ENCHANTED_ITEMS_MYSTIC_GADGETS_9);
INSERT INTO perk_range (min, max, benefit_table, perk) VALUES (16, 16, @ENCHANTED_ITEMS_MYSTIC_GADGETS_ID, @ENCHANTED_ITEMS_MYSTIC_GADGETS_10);
INSERT INTO perk_range (min, max, benefit_table, perk) VALUES (17, 17, @ENCHANTED_ITEMS_MYSTIC_GADGETS_ID, @ENCHANTED_ITEMS_MYSTIC_GADGETS_11);
INSERT INTO perk_range (min, max, benefit_table, perk) VALUES (18, 18, @ENCHANTED_ITEMS_MYSTIC_GADGETS_ID, @ENCHANTED_ITEMS_MYSTIC_GADGETS_12);
INSERT INTO perk_range (min, max, benefit_table, perk) VALUES (19, 20, @ENCHANTED_ITEMS_MYSTIC_GADGETS_ID, @ENCHANTED_ITEMS_MYSTIC_GADGETS_13);


-- experience and wisdom table
INSERT INTO perk (description, type) VALUES ('', 'RANGED_WEAPONS_1');
SET @RANGED_WEAPONS_1 = LAST_INSERT_ID();
INSERT INTO perk (description, type) VALUES ('', 'RANGED_WEAPONS_2');
SET @RANGED_WEAPONS_2 = LAST_INSERT_ID();
INSERT INTO perk (description, type) VALUES ('', 'RANGED_WEAPONS_3');
SET @RANGED_WEAPONS_3 = LAST_INSERT_ID();
INSERT INTO perk (description, type) VALUES ('', 'RANGED_WEAPONS_4');
SET @RANGED_WEAPONS_4 = LAST_INSERT_ID();
INSERT INTO perk (description, type) VALUES ('', 'RANGED_WEAPONS_5');
SET @RANGED_WEAPONS_5 = LAST_INSERT_ID();
INSERT INTO perk (description, type) VALUES ('', 'RANGED_WEAPONS_6');
SET @RANGED_WEAPONS_6 = LAST_INSERT_ID();
INSERT INTO perk (description, type) VALUES ('', 'RANGED_WEAPONS_7');
SET @RANGED_WEAPONS_7 = LAST_INSERT_ID();
INSERT INTO perk (description, type) VALUES ('', 'RANGED_WEAPONS_8');
SET @RANGED_WEAPONS_8 = LAST_INSERT_ID();
INSERT INTO perk (description, type) VALUES ('', 'RANGED_WEAPONS_9');
SET @RANGED_WEAPONS_9 = LAST_INSERT_ID();
INSERT INTO perk (description, type) VALUES ('', 'RANGED_WEAPONS_10');
SET @RANGED_WEAPONS_10 = LAST_INSERT_ID();
INSERT INTO perk (description, type) VALUES ('', 'RANGED_WEAPONS_11');
SET @RANGED_WEAPONS_11 = LAST_INSERT_ID();
INSERT INTO perk (description, type) VALUES ('', 'RANGED_WEAPONS_12');
SET @RANGED_WEAPONS_12 = LAST_INSERT_ID();

INSERT INTO perk_range (min, max, benefit_table, perk) VALUES (1, 2, @RANGED_WEAPONS_ID, @RANGED_WEAPONS_1);
INSERT INTO perk_range (min, max, benefit_table, perk) VALUES (3, 4, @RANGED_WEAPONS_ID, @RANGED_WEAPONS_2);
INSERT INTO perk_range (min, max, benefit_table, perk) VALUES (5, 5, @RANGED_WEAPONS_ID, @RANGED_WEAPONS_3);
INSERT INTO perk_range (min, max, benefit_table, perk) VALUES (6, 6, @RANGED_WEAPONS_ID, @RANGED_WEAPONS_4);
INSERT INTO perk_range (min, max, benefit_table, perk) VALUES (7, 8, @RANGED_WEAPONS_ID, @RANGED_WEAPONS_5);
INSERT INTO perk_range (min, max, benefit_table, perk) VALUES (9, 9, @RANGED_WEAPONS_ID, @RANGED_WEAPONS_6);
INSERT INTO perk_range (min, max, benefit_table, perk) VALUES (10, 11, @RANGED_WEAPONS_ID, @RANGED_WEAPONS_7);
INSERT INTO perk_range (min, max, benefit_table, perk) VALUES (12, 13, @RANGED_WEAPONS_ID, @RANGED_WEAPONS_8);
INSERT INTO perk_range (min, max, benefit_table, perk) VALUES (14, 14, @RANGED_WEAPONS_ID, @RANGED_WEAPONS_9);
INSERT INTO perk_range (min, max, benefit_table, perk) VALUES (15, 16, @RANGED_WEAPONS_ID, @RANGED_WEAPONS_10);
INSERT INTO perk_range (min, max, benefit_table, perk) VALUES (17, 18, @RANGED_WEAPONS_ID, @RANGED_WEAPONS_11);
INSERT INTO perk_range (min, max, benefit_table, perk) VALUES (19, 20, @RANGED_WEAPONS_ID, @RANGED_WEAPONS_12);


-- magic and mysticism table
INSERT INTO perk (description, type) VALUES ('', 'MAGIC_MYSTICISM_1');
SET @MAGIC_MYSTICISM_1 = LAST_INSERT_ID();
INSERT INTO perk (description, type) VALUES ('', 'MAGIC_MYSTICISM_2');
SET @MAGIC_MYSTICISM_2 = LAST_INSERT_ID();
INSERT INTO perk (description, type) VALUES ('', 'MAGIC_MYSTICISM_3');
SET @MAGIC_MYSTICISM_3 = LAST_INSERT_ID();
INSERT INTO perk (description, type) VALUES ('', 'MAGIC_MYSTICISM_4');
SET @MAGIC_MYSTICISM_4 = LAST_INSERT_ID();
INSERT INTO perk (description, type) VALUES ('', 'MAGIC_MYSTICISM_5');
SET @MAGIC_MYSTICISM_5 = LAST_INSERT_ID();
INSERT INTO perk (description, type) VALUES ('', 'MAGIC_MYSTICISM_6');
SET @MAGIC_MYSTICISM_6 = LAST_INSERT_ID();
INSERT INTO perk (description, type) VALUES ('', 'MAGIC_MYSTICISM_7');
SET @MAGIC_MYSTICISM_7 = LAST_INSERT_ID();
INSERT INTO perk (description, type) VALUES ('', 'MAGIC_MYSTICISM_8');
SET @MAGIC_MYSTICISM_8 = LAST_INSERT_ID();
INSERT INTO perk (description, type) VALUES ('', 'MAGIC_MYSTICISM_9');
SET @MAGIC_MYSTICISM_9 = LAST_INSERT_ID();
INSERT INTO perk (description, type) VALUES ('', 'MAGIC_MYSTICISM_10');
SET @MAGIC_MYSTICISM_10 = LAST_INSERT_ID();

INSERT INTO perk_range (min, max, benefit_table, perk) VALUES (1, 1, @MAGIC_MYSTICISM_ID, @MAGIC_MYSTICISM_1);
INSERT INTO perk_range (min, max, benefit_table, perk) VALUES (2, 3, @MAGIC_MYSTICISM_ID, @MAGIC_MYSTICISM_2);
INSERT INTO perk_range (min, max, benefit_table, perk) VALUES (4, 7, @MAGIC_MYSTICISM_ID, @MAGIC_MYSTICISM_3);
INSERT INTO perk_range (min, max, benefit_table, perk) VALUES (8, 10, @MAGIC_MYSTICISM_ID, @MAGIC_MYSTICISM_4);
INSERT INTO perk_range (min, max, benefit_table, perk) VALUES (11, 13, @MAGIC_MYSTICISM_ID, @MAGIC_MYSTICISM_5);
INSERT INTO perk_range (min, max, benefit_table, perk) VALUES (14, 14, @MAGIC_MYSTICISM_ID, @MAGIC_MYSTICISM_6);
INSERT INTO perk_range (min, max, benefit_table, perk) VALUES (15, 16, @MAGIC_MYSTICISM_ID, @MAGIC_MYSTICISM_7);
INSERT INTO perk_range (min, max, benefit_table, perk) VALUES (17, 17, @MAGIC_MYSTICISM_ID, @MAGIC_MYSTICISM_8);
INSERT INTO perk_range (min, max, benefit_table, perk) VALUES (18, 18, @MAGIC_MYSTICISM_ID, @MAGIC_MYSTICISM_9);
INSERT INTO perk_range (min, max, benefit_table, perk) VALUES (19, 20, @MAGIC_MYSTICISM_ID, @MAGIC_MYSTICISM_10);


-- psionics table
INSERT INTO perk (description, type) VALUES ('', 'PSIONICS_1');
SET @PSIONICS_1 = LAST_INSERT_ID();
INSERT INTO perk (description, type) VALUES ('', 'PSIONICS_2');
SET @PSIONICS_2 = LAST_INSERT_ID();
INSERT INTO perk (description, type) VALUES ('', 'PSIONICS_3');
SET @PSIONICS_3 = LAST_INSERT_ID();
INSERT INTO perk (description, type) VALUES ('', 'PSIONICS_4');
SET @PSIONICS_4 = LAST_INSERT_ID();
INSERT INTO perk (description, type) VALUES ('', 'PSIONICS_5');
SET @PSIONICS_5 = LAST_INSERT_ID();
INSERT INTO perk (description, type) VALUES ('', 'PSIONICS_6');
SET @PSIONICS_6 = LAST_INSERT_ID();
INSERT INTO perk (description, type) VALUES ('', 'PSIONICS_7');
SET @PSIONICS_7 = LAST_INSERT_ID();
INSERT INTO perk (description, type) VALUES ('', 'PSIONICS_8');
SET @PSIONICS_8 = LAST_INSERT_ID();
INSERT INTO perk (description, type) VALUES ('', 'PSIONICS_9');
SET @PSIONICS_9 = LAST_INSERT_ID();
INSERT INTO perk (description, type) VALUES ('', 'PSIONICS_10');
SET @PSIONICS_10 = LAST_INSERT_ID();
INSERT INTO perk (description, type) VALUES ('', 'PSIONICS_11');
SET @PSIONICS_11 = LAST_INSERT_ID();

INSERT INTO perk_range (min, max, benefit_table, perk) VALUES (1, 1, @PSIONICS_ID, @PSIONICS_1);
INSERT INTO perk_range (min, max, benefit_table, perk) VALUES (2, 3, @PSIONICS_ID, @PSIONICS_2);
INSERT INTO perk_range (min, max, benefit_table, perk) VALUES (4, 6, @PSIONICS_ID, @PSIONICS_3);
INSERT INTO perk_range (min, max, benefit_table, perk) VALUES (7, 7, @PSIONICS_ID, @PSIONICS_4);
INSERT INTO perk_range (min, max, benefit_table, perk) VALUES (8, 10, @PSIONICS_ID, @PSIONICS_5);
INSERT INTO perk_range (min, max, benefit_table, perk) VALUES (11, 11, @PSIONICS_ID, @PSIONICS_6);
INSERT INTO perk_range (min, max, benefit_table, perk) VALUES (12, 12, @PSIONICS_ID, @PSIONICS_7);
INSERT INTO perk_range (min, max, benefit_table, perk) VALUES (13, 15, @PSIONICS_ID, @PSIONICS_8);
INSERT INTO perk_range (min, max, benefit_table, perk) VALUES (16, 16, @PSIONICS_ID, @PSIONICS_9);
INSERT INTO perk_range (min, max, benefit_table, perk) VALUES (17, 18, @PSIONICS_ID, @PSIONICS_10);
INSERT INTO perk_range (min, max, benefit_table, perk) VALUES (19, 20, @PSIONICS_ID, @PSIONICS_11);


-- ranged weapons table
INSERT INTO perk (description, type) VALUES ('', 'RANGED_WEAPONS_1');
SET @RANGED_WEAPONS_1 = LAST_INSERT_ID();
INSERT INTO perk (description, type) VALUES ('', 'RANGED_WEAPONS_2');
SET @RANGED_WEAPONS_2 = LAST_INSERT_ID();
INSERT INTO perk (description, type) VALUES ('', 'RANGED_WEAPONS_3');
SET @RANGED_WEAPONS_3 = LAST_INSERT_ID();
INSERT INTO perk (description, type) VALUES ('', 'RANGED_WEAPONS_4');
SET @RANGED_WEAPONS_4 = LAST_INSERT_ID();
INSERT INTO perk (description, type) VALUES ('', 'RANGED_WEAPONS_5');
SET @RANGED_WEAPONS_5 = LAST_INSERT_ID();
INSERT INTO perk (description, type) VALUES ('', 'RANGED_WEAPONS_6');
SET @RANGED_WEAPONS_6 = LAST_INSERT_ID();
INSERT INTO perk (description, type) VALUES ('', 'RANGED_WEAPONS_7');
SET @RANGED_WEAPONS_7 = LAST_INSERT_ID();
INSERT INTO perk (description, type) VALUES ('', 'RANGED_WEAPONS_8');
SET @RANGED_WEAPONS_8 = LAST_INSERT_ID();
INSERT INTO perk (description, type) VALUES ('', 'RANGED_WEAPONS_9');
SET @RANGED_WEAPONS_9 = LAST_INSERT_ID();
INSERT INTO perk (description, type) VALUES ('', 'RANGED_WEAPONS_10');
SET @RANGED_WEAPONS_10 = LAST_INSERT_ID();
INSERT INTO perk (description, type) VALUES ('', 'RANGED_WEAPONS_11');
SET @RANGED_WEAPONS_11 = LAST_INSERT_ID();
INSERT INTO perk (description, type) VALUES ('', 'RANGED_WEAPONS_12');
SET @RANGED_WEAPONS_12 = LAST_INSERT_ID();
INSERT INTO perk (description, type) VALUES ('', 'RANGED_WEAPONS_13');
SET @RANGED_WEAPONS_13 = LAST_INSERT_ID();
INSERT INTO perk (description, type) VALUES ('', 'RANGED_WEAPONS_14');
SET @RANGED_WEAPONS_14 = LAST_INSERT_ID();

INSERT INTO perk_range (min, max, benefit_table, perk) VALUES (1, 3, @RANGED_WEAPONS_ID, @RANGED_WEAPONS_1);
INSERT INTO perk_range (min, max, benefit_table, perk) VALUES (4, 4, @RANGED_WEAPONS_ID, @RANGED_WEAPONS_2);
INSERT INTO perk_range (min, max, benefit_table, perk) VALUES (5, 6, @RANGED_WEAPONS_ID, @RANGED_WEAPONS_3);
INSERT INTO perk_range (min, max, benefit_table, perk) VALUES (7, 8, @RANGED_WEAPONS_ID, @RANGED_WEAPONS_4);
INSERT INTO perk_range (min, max, benefit_table, perk) VALUES (9, 10, @RANGED_WEAPONS_ID, @RANGED_WEAPONS_5);
INSERT INTO perk_range (min, max, benefit_table, perk) VALUES (11, 11, @RANGED_WEAPONS_ID, @RANGED_WEAPONS_6);
INSERT INTO perk_range (min, max, benefit_table, perk) VALUES (12, 12, @RANGED_WEAPONS_ID, @RANGED_WEAPONS_7);
INSERT INTO perk_range (min, max, benefit_table, perk) VALUES (13, 13, @RANGED_WEAPONS_ID, @RANGED_WEAPONS_8);
INSERT INTO perk_range (min, max, benefit_table, perk) VALUES (14, 14, @RANGED_WEAPONS_ID, @RANGED_WEAPONS_9);
INSERT INTO perk_range (min, max, benefit_table, perk) VALUES (15, 15, @RANGED_WEAPONS_ID, @RANGED_WEAPONS_10);
INSERT INTO perk_range (min, max, benefit_table, perk) VALUES (16, 16, @RANGED_WEAPONS_ID, @RANGED_WEAPONS_11);
INSERT INTO perk_range (min, max, benefit_table, perk) VALUES (17, 17, @RANGED_WEAPONS_ID, @RANGED_WEAPONS_12);
INSERT INTO perk_range (min, max, benefit_table, perk) VALUES (18, 18, @RANGED_WEAPONS_ID, @RANGED_WEAPONS_13);
INSERT INTO perk_range (min, max, benefit_table, perk) VALUES (19, 20, @RANGED_WEAPONS_ID, @RANGED_WEAPONS_14);


-- training table
INSERT INTO perk (description, type) VALUES ('', 'TRAINING_1');
SET @TRAINING_1 = LAST_INSERT_ID();
INSERT INTO perk (description, type) VALUES ('', 'TRAINING_2');
SET @TRAINING_2 = LAST_INSERT_ID();
INSERT INTO perk (description, type) VALUES ('', 'TRAINING_3');
SET @TRAINING_3 = LAST_INSERT_ID();
INSERT INTO perk (description, type) VALUES ('', 'TRAINING_4');
SET @TRAINING_4 = LAST_INSERT_ID();
INSERT INTO perk (description, type) VALUES ('', 'TRAINING_5');
SET @TRAINING_5 = LAST_INSERT_ID();
INSERT INTO perk (description, type) VALUES ('', 'TRAINING_6');
SET @TRAINING_6 = LAST_INSERT_ID();
INSERT INTO perk (description, type) VALUES ('', 'TRAINING_7');
SET @TRAINING_7 = LAST_INSERT_ID();
INSERT INTO perk (description, type) VALUES ('', 'TRAINING_8');
SET @TRAINING_8 = LAST_INSERT_ID();
INSERT INTO perk (description, type) VALUES ('', 'TRAINING_9');
SET @TRAINING_9 = LAST_INSERT_ID();
INSERT INTO perk (description, type) VALUES ('', 'TRAINING_10');
SET @TRAINING_10 = LAST_INSERT_ID();
INSERT INTO perk (description, type) VALUES ('', 'TRAINING_11');
SET @TRAINING_11 = LAST_INSERT_ID();

INSERT INTO perk_range (min, max, benefit_table, perk) VALUES (1, 3, @TRAINING_ID, @TRAINING_1);
INSERT INTO perk_range (min, max, benefit_table, perk) VALUES (4, 5, @TRAINING_ID, @TRAINING_2);
INSERT INTO perk_range (min, max, benefit_table, perk) VALUES (6, 7, @TRAINING_ID, @TRAINING_3);
INSERT INTO perk_range (min, max, benefit_table, perk) VALUES (8, 9, @TRAINING_ID, @TRAINING_4);
INSERT INTO perk_range (min, max, benefit_table, perk) VALUES (10, 11, @TRAINING_ID, @TRAINING_5);
INSERT INTO perk_range (min, max, benefit_table, perk) VALUES (12, 13, @TRAINING_ID, @TRAINING_6);
INSERT INTO perk_range (min, max, benefit_table, perk) VALUES (14, 14, @TRAINING_ID, @TRAINING_7);
INSERT INTO perk_range (min, max, benefit_table, perk) VALUES (15, 16, @TRAINING_ID, @TRAINING_8);
INSERT INTO perk_range (min, max, benefit_table, perk) VALUES (17, 17, @TRAINING_ID, @TRAINING_9);
INSERT INTO perk_range (min, max, benefit_table, perk) VALUES (18, 18, @TRAINING_ID, @TRAINING_10);
INSERT INTO perk_range (min, max, benefit_table, perk) VALUES (19, 20, @TRAINING_ID, @TRAINING_11);


-- underworld black ops table
INSERT INTO perk (description, type) VALUES ('', 'UNDERWORLD_BLACK_OPS_1');
SET @UNDERWORLD_BLACK_OPS_1 = LAST_INSERT_ID();
INSERT INTO perk (description, type) VALUES ('', 'UNDERWORLD_BLACK_OPS_2');
SET @UNDERWORLD_BLACK_OPS_2 = LAST_INSERT_ID();
INSERT INTO perk (description, type) VALUES ('', 'UNDERWORLD_BLACK_OPS_3');
SET @UNDERWORLD_BLACK_OPS_3 = LAST_INSERT_ID();
INSERT INTO perk (description, type) VALUES ('', 'UNDERWORLD_BLACK_OPS_4');
SET @UNDERWORLD_BLACK_OPS_4 = LAST_INSERT_ID();
INSERT INTO perk (description, type) VALUES ('', 'UNDERWORLD_BLACK_OPS_5');
SET @UNDERWORLD_BLACK_OPS_5 = LAST_INSERT_ID();
INSERT INTO perk (description, type) VALUES ('', 'UNDERWORLD_BLACK_OPS_6');
SET @UNDERWORLD_BLACK_OPS_6 = LAST_INSERT_ID();
INSERT INTO perk (description, type) VALUES ('', 'UNDERWORLD_BLACK_OPS_7');
SET @UNDERWORLD_BLACK_OPS_7 = LAST_INSERT_ID();
INSERT INTO perk (description, type) VALUES ('', 'UNDERWORLD_BLACK_OPS_8');
SET @UNDERWORLD_BLACK_OPS_8 = LAST_INSERT_ID();
INSERT INTO perk (description, type) VALUES ('', 'UNDERWORLD_BLACK_OPS_9');
SET @UNDERWORLD_BLACK_OPS_9 = LAST_INSERT_ID();
INSERT INTO perk (description, type) VALUES ('', 'UNDERWORLD_BLACK_OPS_10');
SET @UNDERWORLD_BLACK_OPS_10 = LAST_INSERT_ID();
INSERT INTO perk (description, type) VALUES ('', 'UNDERWORLD_BLACK_OPS_11');
SET @UNDERWORLD_BLACK_OPS_11 = LAST_INSERT_ID();

INSERT INTO perk_range (min, max, benefit_table, perk) VALUES (, @UNDERWORLD_BLACK_OPS_ID, @UNDERWORLD_BLACK_OPS_1);
INSERT INTO perk_range (min, max, benefit_table, perk) VALUES (, @UNDERWORLD_BLACK_OPS_ID, @UNDERWORLD_BLACK_OPS_2);
INSERT INTO perk_range (min, max, benefit_table, perk) VALUES (, @UNDERWORLD_BLACK_OPS_ID, @UNDERWORLD_BLACK_OPS_3);
INSERT INTO perk_range (min, max, benefit_table, perk) VALUES (, @UNDERWORLD_BLACK_OPS_ID, @UNDERWORLD_BLACK_OPS_4);
INSERT INTO perk_range (min, max, benefit_table, perk) VALUES (, @UNDERWORLD_BLACK_OPS_ID, @UNDERWORLD_BLACK_OPS_5);
INSERT INTO perk_range (min, max, benefit_table, perk) VALUES (, @UNDERWORLD_BLACK_OPS_ID, @UNDERWORLD_BLACK_OPS_6);
INSERT INTO perk_range (min, max, benefit_table, perk) VALUES (, @UNDERWORLD_BLACK_OPS_ID, @UNDERWORLD_BLACK_OPS_7);
INSERT INTO perk_range (min, max, benefit_table, perk) VALUES (, @UNDERWORLD_BLACK_OPS_ID, @UNDERWORLD_BLACK_OPS_8);
INSERT INTO perk_range (min, max, benefit_table, perk) VALUES (, @UNDERWORLD_BLACK_OPS_ID, @UNDERWORLD_BLACK_OPS_9);
INSERT INTO perk_range (min, max, benefit_table, perk) VALUES (, @UNDERWORLD_BLACK_OPS_ID, @UNDERWORLD_BLACK_OPS_10);
INSERT INTO perk_range (min, max, benefit_table, perk) VALUES (, @UNDERWORLD_BLACK_OPS_ID, @UNDERWORLD_BLACK_OPS_11);


-- create the table rolls for the frameworks

-- combat cyborg. this was started in 8.sql
SELECT @COMBAT_CYBORG_ID:=id FROM framework WHERE type = 'COMBAT_CYBORG';
SELECT @COMBAT_CYBORG_TABLE_ROLL_1:=id FROM benefit_table_roll WHERE roll_number = 1 AND framework = @COMBAT_CYBORG_ID;
SELECT @COMBAT_CYBORG_TABLE_ROLL_2:=id FROM benefit_table_roll WHERE roll_number = 2 AND framework = @COMBAT_CYBORG_ID;
SELECT @COMBAT_CYBORG_TABLE_ROLL_3:=id FROM benefit_table_roll WHERE roll_number = 3 AND framework = @COMBAT_CYBORG_ID;


INSERT INTO benefit_table_roll_allowance (benefit_table_roll_id, benefit_table_id) VALUES (@COMBAT_CYBORG_TABLE_ROLL_1, @RANGED_WEAPONS_ID);
INSERT INTO benefit_table_roll_allowance (benefit_table_roll_id, benefit_table_id) VALUES (@COMBAT_CYBORG_TABLE_ROLL_1, @TRAINING_ID);

INSERT INTO benefit_table_roll_allowance (benefit_table_roll_id, benefit_table_id) VALUES (@COMBAT_CYBORG_TABLE_ROLL_2, @RANGED_WEAPONS_ID);
INSERT INTO benefit_table_roll_allowance (benefit_table_roll_id, benefit_table_id) VALUES (@COMBAT_CYBORG_TABLE_ROLL_2, @TRAINING_ID);

INSERT INTO benefit_table_roll_allowance (benefit_table_roll_id, benefit_table_id) VALUES (@COMBAT_CYBORG_TABLE_ROLL_3, @EXPERIENCE_WISDOM_ID);
INSERT INTO benefit_table_roll_allowance (benefit_table_roll_id, benefit_table_id) VALUES (@COMBAT_CYBORG_TABLE_ROLL_3, @RANGED_WEAPONS_ID);
INSERT INTO benefit_table_roll_allowance (benefit_table_roll_id, benefit_table_id) VALUES (@COMBAT_CYBORG_TABLE_ROLL_3, @TRAINING_ID);
INSERT INTO benefit_table_roll_allowance (benefit_table_roll_id, benefit_table_id) VALUES (@COMBAT_CYBORG_TABLE_ROLL_3, @UNDERWORLD_BLACK_OPS_ID);


-- crazy. this was started in 8.sql
SELECT @CRAZY_ID:=id FROM framework WHERE type = 'CRAZY';

SELECT @CRAZY_ID_TABLE_ROLL_1:=id FROM benefit_table_roll WHERE roll_number = 1 AND framework = @CRAZY_ID;
SELECT @CRAZY_ID_TABLE_ROLL_2:=id FROM benefit_table_roll WHERE roll_number = 2 AND framework = @CRAZY_ID;
SELECT @CRAZY_ID_TABLE_ROLL_3:=id FROM benefit_table_roll WHERE roll_number = 3 AND framework = @CRAZY_ID;
SELECT @CRAZY_ID_TABLE_ROLL_4:=id FROM benefit_table_roll WHERE roll_number = 4 AND framework = @CRAZY_ID;
SELECT @CRAZY_ID_TABLE_ROLL_5:=id FROM benefit_table_roll WHERE roll_number = 5 AND framework = @CRAZY_ID;

INSERT INTO benefit_table_roll_allowance (benefit_table_roll_id, benefit_table_id) VALUES (@CRAZY_ID_TABLE_ROLL_1, @PSIONICS_ID);
INSERT INTO benefit_table_roll_allowance (benefit_table_roll_id, benefit_table_id) VALUES (@CRAZY_ID_TABLE_ROLL_1, @RANGED_WEAPONS_ID);
INSERT INTO benefit_table_roll_allowance (benefit_table_roll_id, benefit_table_id) VALUES (@CRAZY_ID_TABLE_ROLL_1, @TRAINING_ID);
INSERT INTO benefit_table_roll_allowance (benefit_table_roll_id, benefit_table_id) VALUES (@CRAZY_ID_TABLE_ROLL_1, @UNDERWORLD_BLACK_OPS_ID);

INSERT INTO benefit_table_roll_allowance (benefit_table_roll_id, benefit_table_id) VALUES (@CRAZY_ID_TABLE_ROLL_2, @PSIONICS_ID);
INSERT INTO benefit_table_roll_allowance (benefit_table_roll_id, benefit_table_id) VALUES (@CRAZY_ID_TABLE_ROLL_2, @RANGED_WEAPONS_ID);
INSERT INTO benefit_table_roll_allowance (benefit_table_roll_id, benefit_table_id) VALUES (@CRAZY_ID_TABLE_ROLL_2, @TRAINING_ID);
INSERT INTO benefit_table_roll_allowance (benefit_table_roll_id, benefit_table_id) VALUES (@CRAZY_ID_TABLE_ROLL_2, @UNDERWORLD_BLACK_OPS_ID);

INSERT INTO benefit_table_roll_allowance (benefit_table_roll_id, benefit_table_id) VALUES (@CRAZY_ID_TABLE_ROLL_3, @PSIONICS_ID);
INSERT INTO benefit_table_roll_allowance (benefit_table_roll_id, benefit_table_id) VALUES (@CRAZY_ID_TABLE_ROLL_3, @RANGED_WEAPONS_ID);
INSERT INTO benefit_table_roll_allowance (benefit_table_roll_id, benefit_table_id) VALUES (@CRAZY_ID_TABLE_ROLL_3, @TRAINING_ID);
INSERT INTO benefit_table_roll_allowance (benefit_table_roll_id, benefit_table_id) VALUES (@CRAZY_ID_TABLE_ROLL_3, @UNDERWORLD_BLACK_OPS_ID);

INSERT INTO benefit_table_roll_allowance (benefit_table_roll_id, benefit_table_id) VALUES (@CRAZY_ID_TABLE_ROLL_4, @EXPERIENCE_WISDOM_ID);
INSERT INTO benefit_table_roll_allowance (benefit_table_roll_id, benefit_table_id) VALUES (@CRAZY_ID_TABLE_ROLL_4, @PSIONICS_ID);
INSERT INTO benefit_table_roll_allowance (benefit_table_roll_id, benefit_table_id) VALUES (@CRAZY_ID_TABLE_ROLL_4, @RANGED_WEAPONS_ID);
INSERT INTO benefit_table_roll_allowance (benefit_table_roll_id, benefit_table_id) VALUES (@CRAZY_ID_TABLE_ROLL_4, @TRAINING_ID);
INSERT INTO benefit_table_roll_allowance (benefit_table_roll_id, benefit_table_id) VALUES (@CRAZY_ID_TABLE_ROLL_4, @UNDERWORLD_BLACK_OPS_ID);

INSERT INTO benefit_table_roll_allowance (benefit_table_roll_id, benefit_table_id) VALUES (@CRAZY_ID_TABLE_ROLL_5, @EXPERIENCE_WISDOM_ID);
INSERT INTO benefit_table_roll_allowance (benefit_table_roll_id, benefit_table_id) VALUES (@CRAZY_ID_TABLE_ROLL_5, @PSIONICS_ID);
INSERT INTO benefit_table_roll_allowance (benefit_table_roll_id, benefit_table_id) VALUES (@CRAZY_ID_TABLE_ROLL_5, @RANGED_WEAPONS_ID);
INSERT INTO benefit_table_roll_allowance (benefit_table_roll_id, benefit_table_id) VALUES (@CRAZY_ID_TABLE_ROLL_5, @TRAINING_ID);
INSERT INTO benefit_table_roll_allowance (benefit_table_roll_id, benefit_table_id) VALUES (@CRAZY_ID_TABLE_ROLL_5, @UNDERWORLD_BLACK_OPS_ID);




INSERT INTO `sql_files` (`sql_file_name`, `run_date`) VALUES ('16.sql', NOW());
