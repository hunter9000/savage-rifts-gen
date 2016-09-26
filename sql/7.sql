

DELETE FROM perk_range;
DELETE FROM perk;
DELETE FROM benefit_table;


INSERT INTO benefit_table (is_magic, is_psionic, type) VALUES (false, false, 'BODY_ARMOR');
INSERT INTO benefit_table (is_magic, is_psionic, type) VALUES (false, false, 'CLOSE_COMBAT_WEAPONS');
INSERT INTO benefit_table (is_magic, is_psionic, type) VALUES (false, false, 'CYBERNETICS');
INSERT INTO benefit_table (is_magic, is_psionic, type) VALUES (false, false, 'EDUCATION');
INSERT INTO benefit_table (is_magic, is_psionic, type) VALUES (false, false, 'ENCHANTED_ITEMS_MYSTIC_GADGETS');
INSERT INTO benefit_table (is_magic, is_psionic, type) VALUES (false, false, 'EXPERIENCE_WISDOM');
INSERT INTO benefit_table (is_magic, is_psionic, type) VALUES (true,  false, 'MAGIC_MYSTICISM');
INSERT INTO benefit_table (is_magic, is_psionic, type) VALUES (false, true,  'PSIONICS');
INSERT INTO benefit_table (is_magic, is_psionic, type) VALUES (false, false, 'RANGED_WEAPONS');
INSERT INTO benefit_table (is_magic, is_psionic, type) VALUES (false, false, 'TRAINING');
INSERT INTO benefit_table (is_magic, is_psionic, type) VALUES (false, false, 'UNDERWORLD_BLACK_OPS');


-- body armor table
INSERT INTO perk (description, type) VALUES ('You may trade the starting Armor from your Iconic Framework for any other body armor (not power armor or robot armor) listed in this book. If this is not your first roll, apply all other results from rolling on this table to your newly chosen body armor.', 'BODY_ARMOR_1');
SET @ARMOR1 = LAST_INSERT_ID();
INSERT INTO perk (description, type) VALUES ('Extra high-density plating and other design factors grant +3 Armor to your hero’s starting armor.', 'BODY_ARMOR_2');
SET @ARMOR2 = LAST_INSERT_ID();
INSERT INTO perk (description, type) VALUES ('Specialized paint and camouflage patterns grant your hero +2 to Stealth checks in woodland settings. If the suit also has the urban patterns, your hero can switch between the two as an action.', 'BODY_ARMOR_3');
SET @ARMOR3 = LAST_INSERT_ID();
INSERT INTO perk (description, type) VALUES ('Micro exoskeleton enhancements in the upper torso and arms give your hero a +1 to all Strength checks and fighting damage rolls.', 'BODY_ARMOR_4');
SET @ARMOR4 = LAST_INSERT_ID();
INSERT INTO perk (description, type) VALUES ('Good for all combat situations, this armor suit has +1 embedded Toughness to handle the sharpest blades and most piercing lasers. This result may be applied up to two times.', 'BODY_ARMOR_5');
SET @ARMOR5 = LAST_INSERT_ID();
INSERT INTO perk (description, type) VALUES ('Your suit has an enhanced communication system, providing a 20-mile range. If this result is rolled a second time, the range is increased to 100 miles, which is the maximum benefit.', 'BODY_ARMOR_6');
SET @ARMOR6 = LAST_INSERT_ID();
INSERT INTO perk (description, type) VALUES ('Significant environmental system improvements grant your hero +1 to Vigor checks while wearing this suit. If your suit does not have Full Environmental Protection, this result provides that benefit instead.', 'BODY_ARMOR_7');
SET @ARMOR7 = LAST_INSERT_ID();
INSERT INTO perk (description, type) VALUES ('Extraordinary craftsmanship and lightweight materials mean your adventurer’s suit has its Strength Minimum reduced by one die type, while still gaining +1 Armor. This result may be applied up to two times.', 'BODY_ARMOR_8');
SET @ARMOR8 = LAST_INSERT_ID();
INSERT INTO perk (description, type) VALUES ('Specialized paint and camouflage patterns grant your hero +2 to Stealth checks in urban settings. If the suit also has woodland patterns, your hero can switch between the two as an action.', 'BODY_ARMOR_9');
SET @ARMOR9 = LAST_INSERT_ID();
INSERT INTO perk (description, type) VALUES ('The helmet of his armor has exceptional embedded targeting enhancements, granting your hero +2 on all ranged attacks.', 'BODY_ARMOR_10');
SET @ARMOR10 = LAST_INSERT_ID();
INSERT INTO perk (description, type) VALUES ('Micro exoskeleton enhancements in the legs give your hero a +1 to Pace when wearing this suit.', 'BODY_ARMOR_11');
SET @ARMOR11 = LAST_INSERT_ID();
INSERT INTO perk (description, type) VALUES ('You may choose any one of the results on this table.', 'BODY_ARMOR_12');
SET @ARMOR12 = LAST_INSERT_ID();

SELECT @BODY_ARMOR_TABLE_ID:=id FROM benefit_table WHERE type = 'BODY_ARMOR';

INSERT INTO perk_range (min, max, benefit_table, perk) VALUES (1, 4, @BODY_ARMOR_TABLE_ID, @ARMOR1);
INSERT INTO perk_range (min, max, benefit_table, perk) VALUES (5, 6, @BODY_ARMOR_TABLE_ID, @ARMOR2);
INSERT INTO perk_range (min, max, benefit_table, perk) VALUES (7, 7, @BODY_ARMOR_TABLE_ID, @ARMOR3);
INSERT INTO perk_range (min, max, benefit_table, perk) VALUES (8, 8, @BODY_ARMOR_TABLE_ID, @ARMOR4);
INSERT INTO perk_range (min, max, benefit_table, perk) VALUES (9, 10, @BODY_ARMOR_TABLE_ID, @ARMOR5);
INSERT INTO perk_range (min, max, benefit_table, perk) VALUES (11, 11, @BODY_ARMOR_TABLE_ID, @ARMOR6);
INSERT INTO perk_range (min, max, benefit_table, perk) VALUES (12, 12, @BODY_ARMOR_TABLE_ID, @ARMOR7);
INSERT INTO perk_range (min, max, benefit_table, perk) VALUES (15, 15, @BODY_ARMOR_TABLE_ID, @ARMOR9);
INSERT INTO perk_range (min, max, benefit_table, perk) VALUES (13, 14, @BODY_ARMOR_TABLE_ID, @ARMOR8);
INSERT INTO perk_range (min, max, benefit_table, perk) VALUES (16, 17, @BODY_ARMOR_TABLE_ID, @ARMOR10);
INSERT INTO perk_range (min, max, benefit_table, perk) VALUES (18, 18, @BODY_ARMOR_TABLE_ID, @ARMOR11);
INSERT INTO perk_range (min, max, benefit_table, perk) VALUES (19, 20, @BODY_ARMOR_TABLE_ID, @ARMOR12);




-- Close Combat Weapons table
INSERT INTO perk (description, type) VALUES ('You may add any Close Combat Weapon listed in this book to your character’s gear list. If this is not your first roll, apply any other results from rolling on this table to your newly chosen weapon as you wish.', 'CLOSE_COMBAT_WEAPONS_1');
SET @CCW1 = LAST_INSERT_ID();
INSERT INTO perk (description, type) VALUES ('Vibro-Swords are very popular, thanks to their combination of efficiency and deadliness.', 'CLOSE_COMBAT_WEAPONS_2');
SET @CCW2 = LAST_INSERT_ID();
INSERT INTO perk (description, type) VALUES ('Exceptional crafting and balance grants your hero a +1 Fighting with this weapon. This result may be applied up to two times.', 'CLOSE_COMBAT_WEAPONS_3');
SET @CCW3 = LAST_INSERT_ID();
INSERT INTO perk (description, type) VALUES ('With a Chain Long Sword, your character can cut even huge robot-armor foes down to size.', 'CLOSE_COMBAT_WEAPONS_4');
SET @CCW4 = LAST_INSERT_ID();
INSERT INTO perk (description, type) VALUES ('This weapon is extra deadly, granting a +1 to all damage rolls made with it. This result may be applied up to three times.', 'CLOSE_COMBAT_WEAPONS_5');
SET @CCW5 = LAST_INSERT_ID();
INSERT INTO perk (description, type) VALUES ('Your hero makes a serious impression (and probably some serious dents) with her Impact Hammer.', 'CLOSE_COMBAT_WEAPONS_6');
SET @CCW6 = LAST_INSERT_ID();
INSERT INTO perk (description, type) VALUES ('The crafter of this weapon knows something about vampires in the world, and she incorporated silver into its making.', 'CLOSE_COMBAT_WEAPONS_7');
SET @CCW7 = LAST_INSERT_ID();
INSERT INTO perk (description, type) VALUES ('Though wanton destruction and violence is rampant throughout the world, there are times when a non-lethal solution is called for. The Coalition developed the Neural Mace for exactly those times.', 'CLOSE_COMBAT_WEAPONS_8');
SET @CCW8 = LAST_INSERT_ID();
INSERT INTO perk (description, type) VALUES ('Advanced technology makes this weapon extra effective against armor, giving it +2 AP.', 'CLOSE_COMBAT_WEAPONS_9');
SET @CCW9 = LAST_INSERT_ID();
INSERT INTO perk (description, type) VALUES ('Going big certainly has its advantages, and nothing goes quite as big as a Chain Greatsword.', 'CLOSE_COMBAT_WEAPONS_10');
SET @CCW10 = LAST_INSERT_ID();
INSERT INTO perk (description, type) VALUES ('The design of the weapon incorporates special guards or other techniques to provide the wielder a +1 Parry.', 'CLOSE_COMBAT_WEAPONS_11');
SET @CCW11 = LAST_INSERT_ID();
INSERT INTO perk (description, type) VALUES ('For some, it’s about the surprise. For others, it’s about not having to switch weapons during an engagement. Your hero’s melee weapon has an embedded laser (Range 15/30/60, Damage 2d6, RoF 1, AP 2, Shots 16).', 'CLOSE_COMBAT_WEAPONS_12');
SET @CCW12 = LAST_INSERT_ID();
INSERT INTO perk (description, type) VALUES ('You may choose any one of the previous results.', 'CLOSE_COMBAT_WEAPONS_13');
SET @CCW13 = LAST_INSERT_ID();


SELECT @CCW_ID:=id FROM benefit_table WHERE type = 'CLOSE_COMBAT_WEAPONS';

INSERT INTO perk_range (min, max, benefit_table, perk) VALUES (1, 4, @CCW_ID, @CCW1);
INSERT INTO perk_range (min, max, benefit_table, perk) VALUES (5, 6, @CCW_ID, @CCW2);
INSERT INTO perk_range (min, max, benefit_table, perk) VALUES (7, 7, @CCW_ID, @CCW3);
INSERT INTO perk_range (min, max, benefit_table, perk) VALUES (8, 9, @CCW_ID, @CCW4);
INSERT INTO perk_range (min, max, benefit_table, perk) VALUES (10, 11, @CCW_ID, @CCW5);
INSERT INTO perk_range (min, max, benefit_table, perk) VALUES (12, 12, @CCW_ID, @CCW6);
INSERT INTO perk_range (min, max, benefit_table, perk) VALUES (13, 13, @CCW_ID, @CCW7);
INSERT INTO perk_range (min, max, benefit_table, perk) VALUES (14, 14, @CCW_ID, @CCW9);
INSERT INTO perk_range (min, max, benefit_table, perk) VALUES (15, 15, @CCW_ID, @CCW8);
INSERT INTO perk_range (min, max, benefit_table, perk) VALUES (16, 16, @CCW_ID, @CCW10);
INSERT INTO perk_range (min, max, benefit_table, perk) VALUES (17, 17, @CCW_ID, @CCW11);
INSERT INTO perk_range (min, max, benefit_table, perk) VALUES (18, 18, @CCW_ID, @CCW12);
INSERT INTO perk_range (min, max, benefit_table, perk) VALUES (19, 20, @CCW_ID, @CCW13);




-- Cybernetics table
INSERT INTO perk (description, type) VALUES ('Your hero wanted maximum capabilities, never mind others seeing her as a freak. She got an Extra Set of Arms installed.', 'CYBERNETICS_1');
SET @CYBERNETICS1 = LAST_INSERT_ID();
INSERT INTO perk (description, type) VALUES ('When the armor piercing lasers and flechettes fly, your cyborg’s level of Reinforced Frame is the best.', 'CYBERNETICS_2');
SET @CYBERNETICS2 = LAST_INSERT_ID();
INSERT INTO perk (description, type) VALUES ('Your hero wants to give that Juicer a run for his money, so he got a level of Cyber-Wired Reflexes installed.', 'CYBERNETICS_3');
SET @CYBERNETICS3 = LAST_INSERT_ID();
INSERT INTO perk (description, type) VALUES ('Your cyborg is the one everyone wants on watch since she has the Expanded Detection and Security Array.', 'CYBERNETICS_4');
SET @CYBERNETICS4 = LAST_INSERT_ID();
INSERT INTO perk (description, type) VALUES ('Instantaneously knowing how to do what he needs makes your hero extra useful with his Wired Skill Port and four-step skill load.', 'CYBERNETICS_5');
SET @CYBERNETICS5 = LAST_INSERT_ID();
INSERT INTO perk (description, type) VALUES ('Who has time to actually train? Not your character, which is why he has a level of Embedded Combat Coding.', 'CYBERNETICS_6');
SET @CYBERNETICS6 = LAST_INSERT_ID();
INSERT INTO perk (description, type) VALUES ('Booster Jets make for great tactical options, and they’re a lot of fun, too!', 'CYBERNETICS_7');
SET @CYBERNETICS7 = LAST_INSERT_ID();
INSERT INTO perk (description, type) VALUES ('Nothing like a Range Data System to make hitting all those pesky enemy targets diving for cover that much easier.', 'CYBERNETICS_8');
SET @CYBERNETICS8 = LAST_INSERT_ID();
INSERT INTO perk (description, type) VALUES ('There’s a good chance your cyborg was meant for amphibious operations with his Aquatic Mode Upgrade.', 'CYBERNETICS_9');
SET @CYBERNETICS9 = LAST_INSERT_ID();
INSERT INTO perk (description, type) VALUES ('Stronger is always better as far as your character is concerned, so he has a level of Bionic Strength Augmentation.', 'CYBERNETICS_10');
SET @CYBERNETICS10 = LAST_INSERT_ID();
INSERT INTO perk (description, type) VALUES ('Whoever put your hero back together didn’t want her checking out any time soon. She has the Nano-Repair System.', 'CYBERNETICS_11');
SET @CYBERNETICS11 = LAST_INSERT_ID();
INSERT INTO perk (description, type) VALUES ('It’s not all about combat efficiency for your cyborg. He has a Subject Matter Expert Port and a four-step skill load on hand.', 'CYBERNETICS_12');
SET @CYBERNETICS12 = LAST_INSERT_ID();
INSERT INTO perk (description, type) VALUES ('Let’s face it, everyone expects your hero to take point, so that extra level of Armor Plating is always a good idea.', 'CYBERNETICS_13');
SET @CYBERNETICS13 = LAST_INSERT_ID();
INSERT INTO perk (description, type) VALUES ('Choose any single cybernetic upgrade you wish and qualify for.', 'CYBERNETICS_14');
SET @CYBERNETICS14 = LAST_INSERT_ID();

SELECT @CYBERNETICS_ID:=id FROM benefit_table WHERE type = 'CYBERNETICS';

INSERT INTO perk_range (min, max, benefit_table, perk) VALUES (1, 1, @CYBERNETICS_ID, @CYBERNETICS1);
INSERT INTO perk_range (min, max, benefit_table, perk) VALUES (2, 3, @CYBERNETICS_ID, @CYBERNETICS2);
INSERT INTO perk_range (min, max, benefit_table, perk) VALUES (4, 4, @CYBERNETICS_ID, @CYBERNETICS3);
INSERT INTO perk_range (min, max, benefit_table, perk) VALUES (5, 6, @CYBERNETICS_ID, @CYBERNETICS4);
INSERT INTO perk_range (min, max, benefit_table, perk) VALUES (7, 7, @CYBERNETICS_ID, @CYBERNETICS5);
INSERT INTO perk_range (min, max, benefit_table, perk) VALUES (8, 8, @CYBERNETICS_ID, @CYBERNETICS6);
INSERT INTO perk_range (min, max, benefit_table, perk) VALUES (9, 9, @CYBERNETICS_ID, @CYBERNETICS7);
INSERT INTO perk_range (min, max, benefit_table, perk) VALUES (10, 11, @CYBERNETICS_ID, @CYBERNETICS9);
INSERT INTO perk_range (min, max, benefit_table, perk) VALUES (12, 12, @CYBERNETICS_ID, @CYBERNETICS8);
INSERT INTO perk_range (min, max, benefit_table, perk) VALUES (13, 14, @CYBERNETICS_ID, @CYBERNETICS10);
INSERT INTO perk_range (min, max, benefit_table, perk) VALUES (15, 15, @CYBERNETICS_ID, @CYBERNETICS11);
INSERT INTO perk_range (min, max, benefit_table, perk) VALUES (16, 16, @CYBERNETICS_ID, @CYBERNETICS12);
INSERT INTO perk_range (min, max, benefit_table, perk) VALUES (17, 18, @CYBERNETICS_ID, @CYBERNETICS13);
INSERT INTO perk_range (min, max, benefit_table, perk) VALUES (19, 20, @CYBERNETICS_ID, @CYBERNETICS14);






-- Education table
INSERT INTO perk (description, type) VALUES ('Your hero’s voracious appetite for knowledge led to her picking up a little something about pretty much everything. She has the Jack-of-All-Trades Edge.', 'EDUCATION_1');
SET @EDUCATION1 = LAST_INSERT_ID();
INSERT INTO perk (description, type) VALUES ('Your character is a talented medic and a huge boon for any group he runs with. He has the Healer Edge and the Healing skill at d6.', 'EDUCATION_2');
SET @EDUCATION2 = LAST_INSERT_ID();
INSERT INTO perk (description, type) VALUES ('Your character has a passion for languages, and a real gift for them as well. She has the Linguist Edge. She also has a strong likelihood of getting paid work as a translator in most civilized areas (what there are of them).', 'EDUCATION_3');
SET @EDUCATION3 = LAST_INSERT_ID();
INSERT INTO perk (description, type) VALUES ('Following in the footsteps of Erin Tarn, your character is a student of the past. Only by understanding what has come before can he hope to make the most of what is to come. He gets Knowledge (History) at d8 and +2 on all Common Knowledge checks.', 'EDUCATION_4');
SET @EDUCATION4 = LAST_INSERT_ID();
INSERT INTO perk (description, type) VALUES ('The principles of technology are vital to building a future out of the catastrophes of the past. Your hero has the necessary foundation to be a part of that with a d8 in Knowledge (Electronics). She also gains +1 on any Repair rolls with electronic machinery.', 'EDUCATION_5');
SET @EDUCATION5 = LAST_INSERT_ID();
INSERT INTO perk (description, type) VALUES ('He’s traveled far and wide, and he knows a lot about the world that could come in handy. Your character gains a +2 on any Common Knowledge rolls related to geography and understanding the people and places of North America. He also gains a +2 on Survival and Streetwise checks in North America.', 'EDUCATION_6');
SET @EDUCATION6 = LAST_INSERT_ID();
INSERT INTO perk (description, type) VALUES ('Understanding the ebb and flow of power in the habitable lands of North America may very well mean the difference between life and death, making your hero’s grasp of such matters extremely valuable. She gains Knowledge (Politics) at d8. She also gains +2 to Persuasion.', 'EDUCATION_7');
SET @EDUCATION7 = LAST_INSERT_ID();
INSERT INTO perk (description, type) VALUES ('The world was ended in war, reborn in war, and war remains the most prevalent truth of the age. Your character understands this better than anyone, and he gains a d8 in Knowledge (Battle) to prove it. He also has the Command Edge (or one Leadership Edge of her choice if she already has Command).', 'EDUCATION_8');
SET @EDUCATION8 = LAST_INSERT_ID();
INSERT INTO perk (description, type) VALUES ('Your character’s innate understanding of computers makes her one of the most valuable people in the world, whether most folks understand that or not. She gains Knowledge (Computers) at d8, as well as +2 when dealing with electronic security.', 'EDUCATION_9');
SET @EDUCATION9 = LAST_INSERT_ID();
INSERT INTO perk (description, type) VALUES ('Born with a natural inquisitiveness, your hero has a gift for research and finding things out. He has the Investigator Edge and the Investigation skill at d6.', 'EDUCATION_10');
SET @EDUCATION10 = LAST_INSERT_ID();
INSERT INTO perk (description, type) VALUES ('Either her parents did everything they could to educate her, she attended one of the few schools left in the world, or she might even have found and lived in an ancient library. However managed, she has five additional skill points to spend at character creation, but they may only be spent on Healing, Investigation, and Knowledge skills.', 'EDUCATION_11');
SET @EDUCATION11 = LAST_INSERT_ID();
INSERT INTO perk (description, type) VALUES ('You may choose any one of the previous results.', 'EDUCATION_12');
SET @EDUCATION12 = LAST_INSERT_ID();



SELECT @EDUCATION_ID:=id FROM benefit_table WHERE type = 'EDUCATION';

INSERT INTO perk_range (min, max, benefit_table, perk) VALUES (1, 2, @EDUCATION_ID, @EDUCATION1);
INSERT INTO perk_range (min, max, benefit_table, perk) VALUES (3, 4, @EDUCATION_ID, @EDUCATION2);
INSERT INTO perk_range (min, max, benefit_table, perk) VALUES (5, 5, @EDUCATION_ID, @EDUCATION3);
INSERT INTO perk_range (min, max, benefit_table, perk) VALUES (6, 7, @EDUCATION_ID, @EDUCATION4);
INSERT INTO perk_range (min, max, benefit_table, perk) VALUES (8, 8, @EDUCATION_ID, @EDUCATION5);
INSERT INTO perk_range (min, max, benefit_table, perk) VALUES (9, 10, @EDUCATION_ID, @EDUCATION6);
INSERT INTO perk_range (min, max, benefit_table, perk) VALUES (11, 11, @EDUCATION_ID, @EDUCATION7);
INSERT INTO perk_range (min, max, benefit_table, perk) VALUES (12, 12, @EDUCATION_ID, @EDUCATION8);
INSERT INTO perk_range (min, max, benefit_table, perk) VALUES (13, 14, @EDUCATION_ID, @EDUCATION9);
INSERT INTO perk_range (min, max, benefit_table, perk) VALUES (15, 16, @EDUCATION_ID, @EDUCATION10);
INSERT INTO perk_range (min, max, benefit_table, perk) VALUES (17, 18, @EDUCATION_ID, @EDUCATION11);
INSERT INTO perk_range (min, max, benefit_table, perk) VALUES (19, 20, @EDUCATION_ID, @EDUCATION12);



SELECT @ENCHANTED_ITEMS_MYSTIC_GADGETS_ID:=id FROM benefit_table WHERE type = 'ENCHANTED_ITEMS_MYSTIC_GADGETS';
SELECT @EXPERIENCE_WISDOM_ID:=id FROM benefit_table WHERE type = 'EXPERIENCE_WISDOM';
SELECT @MAGIC_MYSTICISM_ID:=id FROM benefit_table WHERE type = 'MAGIC_MYSTICISM';
SELECT @PSIONICS_ID:=id FROM benefit_table WHERE type = 'PSIONICS';
SELECT @RANGED_WEAPONS_ID:=id FROM benefit_table WHERE type = 'RANGED_WEAPONS';
SELECT @TRAINING_ID:=id FROM benefit_table WHERE type = 'TRAINING';
SELECT @UNDERWORLD_BLACK_OPS_ID:=id FROM benefit_table WHERE type = 'UNDERWORLD_BLACK_OPS';


COMMIT;