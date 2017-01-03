USE savage_rifts;

-- Adding the benefit table definitions for the remaining tables, and added their rolls
-- added missing table rolls for combat cyborg and crazy frameworks

SELECT @MIND_MELTER_ID:=id FROM framework WHERE type = 'MIND_MELTER';
SELECT @LEY_LINE_WALKER_ID:=id FROM framework WHERE type = 'LEY_LINE_WALKER';
SELECT @MYSTIC_ID:=id FROM framework WHERE type = 'MYSTIC';
SELECT @TECHNO_WIZARD_ID:=id FROM framework WHERE type = 'TECHNO_WIZARD';
SELECT @DRAGON_ID:=id FROM framework WHERE type = 'DRAGON';

-- these 4 have already had their rolls defined in 7.sql, they're here to add them to more frameworks
SELECT @BODY_ARMOR_ID:=id FROM benefit_table WHERE type = 'BODY_ARMOR';
SELECT @CCW_ID:=id FROM benefit_table WHERE type = 'CLOSE_COMBAT_WEAPONS';
SELECT @CYBERNETICS_ID:=id FROM benefit_table WHERE type = 'CYBERNETICS';
SELECT @EDUCATION_ID:=id FROM benefit_table WHERE type = 'EDUCATION';

-- these 7 are having their rolls defined here
SELECT @ENCHANTED_ITEMS_MYSTIC_GADGETS_ID:=id FROM benefit_table WHERE type = 'ENCHANTED_ITEMS_MYSTIC_GADGETS';
SELECT @EXPERIENCE_WISDOM_ID:=id FROM benefit_table WHERE type = 'EXPERIENCE_WISDOM';
SELECT @MAGIC_MYSTICISM_ID:=id FROM benefit_table WHERE type = 'MAGIC_MYSTICISM';
SELECT @PSIONICS_ID:=id FROM benefit_table WHERE type = 'PSIONICS';
SELECT @RANGED_WEAPONS_ID:=id FROM benefit_table WHERE type = 'RANGED_WEAPONS';
SELECT @TRAINING_ID:=id FROM benefit_table WHERE type = 'TRAINING';
SELECT @UNDERWORLD_BLACK_OPS_ID:=id FROM benefit_table WHERE type = 'UNDERWORLD_BLACK_OPS';


-- enchanted items and mystic gadgets table
INSERT INTO `perk` (description, type) VALUES ('Made of a wood unknown to most of the world, your character’s elegant staff is a powerful weapon and tool for magic work. The staff has 10 PPE (which regenerate at the same rate as the caster), grants a +1 to all spellcasting rolls for AB: Magic and AB: Miracles, and contains two spells (powers) of the player’s choice, which can come from any list. Finally, it’s a combat-worthy staff (Str+d6, Reach 1, Parry +1, twohanded) that even does Mega Damage if 2 PPE is channeled through it that round.', 'ENCHANTED_ITEMS_MYSTIC_GADGETS_1');
SET @ENCHANTED_ITEMS_MYSTIC_GADGETS_1_ID = LAST_INSERT_ID();
INSERT INTO `perk` (description, type) VALUES ('Things get ugly out in the world, and the Ley Line Walker Medium Armor is a good insurance policy for dealing with a lot of those things. Cyber-Knights should re-roll on this result. 4 Going covert is much easier with a Shadow Cloak on. 5 – 6 Great for both damaging and slowing down enemies, an Iceblast Shotgun is an arcane favorite.', 'ENCHANTED_ITEMS_MYSTIC_GADGETS_2');
SET @ENCHANTED_ITEMS_MYSTIC_GADGETS_2_ID = LAST_INSERT_ID();
INSERT INTO `perk` (description, type) VALUES ('Going covert is much easier with a Shadow Cloak on. ', 'ENCHANTED_ITEMS_MYSTIC_GADGETS_3');
SET @ENCHANTED_ITEMS_MYSTIC_GADGETS_3_ID = LAST_INSERT_ID();
INSERT INTO `perk` (description, type) VALUES ('Great for both damaging and slowing down enemies, an Iceblast Shotgun is an arcane favorite.', 'ENCHANTED_ITEMS_MYSTIC_GADGETS_4');
SET @ENCHANTED_ITEMS_MYSTIC_GADGETS_4_ID = LAST_INSERT_ID();
INSERT INTO `perk` (description, type) VALUES ('When it’s time to negotiate with strange visitors just arrived through a new Rift, your character’s Communications Band is a vital asset. This upgraded item also enhances the user’s vocal output, granting him a +2 Charisma whenever he is speaking or otherwise using his voice.', 'ENCHANTED_ITEMS_MYSTIC_GADGETS_5');
SET @ENCHANTED_ITEMS_MYSTIC_GADGETS_5_ID = LAST_INSERT_ID();
INSERT INTO `perk` (description, type) VALUES ('Your hero is in good shape with a TW Shard Pistol at her side. 11 For up-close and personal encounters, a Flaming Sword is a good thing to have. It’s also great for barbecues.', 'ENCHANTED_ITEMS_MYSTIC_GADGETS_6');
SET @ENCHANTED_ITEMS_MYSTIC_GADGETS_6_ID = LAST_INSERT_ID();
INSERT INTO `perk` (description, type) VALUES ('For up-close and personal encounters, a Flaming Sword is a good thing to have. It’s also great for barbecues.', 'ENCHANTED_ITEMS_MYSTIC_GADGETS_7');
SET @ENCHANTED_ITEMS_MYSTIC_GADGETS_7_ID = LAST_INSERT_ID();
INSERT INTO `perk` (description, type) VALUES ('A cunning pair of goggles that speaks of a fashion that never goes out of style, your character’s Magic Optic System is a favorite accessory.', 'ENCHANTED_ITEMS_MYSTIC_GADGETS_8');
SET @ENCHANTED_ITEMS_MYSTIC_GADGETS_8_ID = LAST_INSERT_ID();
INSERT INTO `perk` (description, type) VALUES ('The TK Revolver is a favorite among Techno-Wizards and those who don’t like keeping up with ammunition.', 'ENCHANTED_ITEMS_MYSTIC_GADGETS_9');
SET @ENCHANTED_ITEMS_MYSTIC_GADGETS_9_ID = LAST_INSERT_ID();
INSERT INTO `perk` (description, type) VALUES ('Your hero has a rare and coveted suit of TW Combat Mage Armor, which may or may not place him on a few bounty lists in both the Coalition and the Federation of Magic. Alternately, if he’s a Cyber-Knight, he gains a suit of TW Cyber-Knight Heavy Armor.', 'ENCHANTED_ITEMS_MYSTIC_GADGETS_10');
SET @ENCHANTED_ITEMS_MYSTIC_GADGETS_10_ID = LAST_INSERT_ID();
INSERT INTO `perk` (description, type) VALUES ('One of the nastier weapons created by Techno-Wizards, the Draining Blade is just the thing for evening the odds against a superior physical combatant.', 'ENCHANTED_ITEMS_MYSTIC_GADGETS_11');
SET @ENCHANTED_ITEMS_MYSTIC_GADGETS_11_ID = LAST_INSERT_ID();
INSERT INTO `perk` (description, type) VALUES ('Whether your character’s a Techno-Wizard or just wants to travel like one, the Wingboard is a great choice for him.', 'ENCHANTED_ITEMS_MYSTIC_GADGETS_12');
SET @ENCHANTED_ITEMS_MYSTIC_GADGETS_12_ID = LAST_INSERT_ID();
INSERT INTO `perk` (description, type) VALUES ('You may choose any one of the previous results.', 'ENCHANTED_ITEMS_MYSTIC_GADGETS_13');
SET @ENCHANTED_ITEMS_MYSTIC_GADGETS_13_ID = LAST_INSERT_ID();

INSERT INTO perk_range (min, max, benefit_table, perk) VALUES (1, 1, @ENCHANTED_ITEMS_MYSTIC_GADGETS_ID, @ENCHANTED_ITEMS_MYSTIC_GADGETS_1_ID);
INSERT INTO perk_range (min, max, benefit_table, perk) VALUES (2, 3, @ENCHANTED_ITEMS_MYSTIC_GADGETS_ID, @ENCHANTED_ITEMS_MYSTIC_GADGETS_2_ID);
INSERT INTO perk_range (min, max, benefit_table, perk) VALUES (4, 4, @ENCHANTED_ITEMS_MYSTIC_GADGETS_ID, @ENCHANTED_ITEMS_MYSTIC_GADGETS_3_ID);
INSERT INTO perk_range (min, max, benefit_table, perk) VALUES (5, 6, @ENCHANTED_ITEMS_MYSTIC_GADGETS_ID, @ENCHANTED_ITEMS_MYSTIC_GADGETS_4_ID);
INSERT INTO perk_range (min, max, benefit_table, perk) VALUES (7, 8, @ENCHANTED_ITEMS_MYSTIC_GADGETS_ID, @ENCHANTED_ITEMS_MYSTIC_GADGETS_5_ID);
INSERT INTO perk_range (min, max, benefit_table, perk) VALUES (9, 10, @ENCHANTED_ITEMS_MYSTIC_GADGETS_ID, @ENCHANTED_ITEMS_MYSTIC_GADGETS_6_ID);
INSERT INTO perk_range (min, max, benefit_table, perk) VALUES (11, 11, @ENCHANTED_ITEMS_MYSTIC_GADGETS_ID, @ENCHANTED_ITEMS_MYSTIC_GADGETS_7_ID);
INSERT INTO perk_range (min, max, benefit_table, perk) VALUES (12, 13, @ENCHANTED_ITEMS_MYSTIC_GADGETS_ID, @ENCHANTED_ITEMS_MYSTIC_GADGETS_8_ID);
INSERT INTO perk_range (min, max, benefit_table, perk) VALUES (14, 15, @ENCHANTED_ITEMS_MYSTIC_GADGETS_ID, @ENCHANTED_ITEMS_MYSTIC_GADGETS_9_ID);
INSERT INTO perk_range (min, max, benefit_table, perk) VALUES (16, 16, @ENCHANTED_ITEMS_MYSTIC_GADGETS_ID, @ENCHANTED_ITEMS_MYSTIC_GADGETS_10_ID);
INSERT INTO perk_range (min, max, benefit_table, perk) VALUES (17, 17, @ENCHANTED_ITEMS_MYSTIC_GADGETS_ID, @ENCHANTED_ITEMS_MYSTIC_GADGETS_11_ID);
INSERT INTO perk_range (min, max, benefit_table, perk) VALUES (18, 18, @ENCHANTED_ITEMS_MYSTIC_GADGETS_ID, @ENCHANTED_ITEMS_MYSTIC_GADGETS_12_ID);
INSERT INTO perk_range (min, max, benefit_table, perk) VALUES (19, 20, @ENCHANTED_ITEMS_MYSTIC_GADGETS_ID, @ENCHANTED_ITEMS_MYSTIC_GADGETS_13_ID);


-- experience and wisdom table
INSERT INTO `perk` (description, type) VALUES ('Your hero knows how to make the most of second chances. He has Elan.', 'EXPERIENCE_WISDOM_1');
SET @EXPERIENCE_WISDOM_1_ID = LAST_INSERT_ID();
INSERT INTO `perk` (description, type) VALUES ('Your character doesn’t take kindly to threats, and no one messes with her head. She is Strong Willed.', 'EXPERIENCE_WISDOM_2');
SET @EXPERIENCE_WISDOM_2_ID = LAST_INSERT_ID();
INSERT INTO `perk` (description, type) VALUES ('With a nose for opportunities, horse-trading, and five-fingered discounts, your hero is the go-to person for getting what’s needed in a crunch. He has the Scrounger Edge and Connections (Black Market).', 'EXPERIENCE_WISDOM_3');
SET @EXPERIENCE_WISDOM_3_ID = LAST_INSERT_ID();
INSERT INTO `perk` (description, type) VALUES ('Some folks come to understand that lone wolves don’t make it in a world as dangerous as this one. Your hero has Common Bond.', 'EXPERIENCE_WISDOM_4');
SET @EXPERIENCE_WISDOM_4_ID = LAST_INSERT_ID();
INSERT INTO `perk` (description, type) VALUES ('She always gets a strange tingling in the back of her neck when things are about to go all pear-shaped. She’s seen enough trouble to know when it’s coming. Your character has the Danger Sense Edge.', 'EXPERIENCE_WISDOM_5');
SET @EXPERIENCE_WISDOM_5_ID = LAST_INSERT_ID();
INSERT INTO `perk` (description, type) VALUES ('A split second often means the difference between alive and a smear on the landscape. Your character has the Quick Edge. If he already has that Edge, he gains the Level Headed Edge instead.', 'EXPERIENCE_WISDOM_6');
SET @EXPERIENCE_WISDOM_6_ID = LAST_INSERT_ID();
INSERT INTO `perk` (description, type) VALUES ('Some experiences take a person back to the beginning, reconnecting her to her foundations. Select one Background Edge, regardless of requirements, so long as it makes sense and the GM agrees with it.', 'EXPERIENCE_WISDOM_7');
SET @EXPERIENCE_WISDOM_7_ID = LAST_INSERT_ID();
INSERT INTO `perk` (description, type) VALUES ('He’s traveled far and wide, and he knows a lot about the world that could come in handy. Your character gains a +2 on any Common Knowledge rolls related to geography and understanding the people and places of North America. He also gains a +2 on Survival and Streetwise checks in North America.', 'EXPERIENCE_WISDOM_8');
SET @EXPERIENCE_WISDOM_8_ID = LAST_INSERT_ID();
INSERT INTO `perk` (description, type) VALUES ('There are times when no amount of skill, talent, or training is enough. Fortunately for your character, she has a bit of Luck (as in the Edge) on her side. Take Great Luck instead if she already has Luck.', 'EXPERIENCE_WISDOM_9');
SET @EXPERIENCE_WISDOM_9_ID = LAST_INSERT_ID();
INSERT INTO `perk` (description, type) VALUES ('Life on the road, in the wilderness, and wandering the streets of the cities that remain gave your character special insight and some key experience with a particular calling. You may give her one Professional Edge, ignoring requirements, subject to the GM’s approval and it making at least some kind of sense.', 'EXPERIENCE_WISDOM_10');
SET @EXPERIENCE_WISDOM_10_ID = LAST_INSERT_ID();
INSERT INTO `perk` (description, type) VALUES ('There are moments when everything comes together and an opportunity presents itself. Your hero knows how to make the most of just such a moment; choose one Wild Card Edge, regardless of requirements.', 'EXPERIENCE_WISDOM_11');
SET @EXPERIENCE_WISDOM_11_ID = LAST_INSERT_ID();
INSERT INTO `perk` (description, type) VALUES ('You may choose any one of the previous results.', 'EXPERIENCE_WISDOM_12');
SET @EXPERIENCE_WISDOM_12_ID = LAST_INSERT_ID();

INSERT INTO perk_range (min, max, benefit_table, perk) VALUES (1, 2, @EXPERIENCE_WISDOM_ID, @EXPERIENCE_WISDOM_1_ID);
INSERT INTO perk_range (min, max, benefit_table, perk) VALUES (3, 4, @EXPERIENCE_WISDOM_ID, @EXPERIENCE_WISDOM_2_ID);
INSERT INTO perk_range (min, max, benefit_table, perk) VALUES (5, 5, @EXPERIENCE_WISDOM_ID, @EXPERIENCE_WISDOM_3_ID);
INSERT INTO perk_range (min, max, benefit_table, perk) VALUES (6, 6, @EXPERIENCE_WISDOM_ID, @EXPERIENCE_WISDOM_4_ID);
INSERT INTO perk_range (min, max, benefit_table, perk) VALUES (7, 8, @EXPERIENCE_WISDOM_ID, @EXPERIENCE_WISDOM_5_ID);
INSERT INTO perk_range (min, max, benefit_table, perk) VALUES (9, 9, @EXPERIENCE_WISDOM_ID, @EXPERIENCE_WISDOM_6_ID);
INSERT INTO perk_range (min, max, benefit_table, perk) VALUES (10, 11, @EXPERIENCE_WISDOM_ID, @EXPERIENCE_WISDOM_7_ID);
INSERT INTO perk_range (min, max, benefit_table, perk) VALUES (12, 13, @EXPERIENCE_WISDOM_ID, @EXPERIENCE_WISDOM_8_ID);
INSERT INTO perk_range (min, max, benefit_table, perk) VALUES (14, 14, @EXPERIENCE_WISDOM_ID, @EXPERIENCE_WISDOM_9_ID);
INSERT INTO perk_range (min, max, benefit_table, perk) VALUES (15, 16, @EXPERIENCE_WISDOM_ID, @EXPERIENCE_WISDOM_10_ID);
INSERT INTO perk_range (min, max, benefit_table, perk) VALUES (17, 18, @EXPERIENCE_WISDOM_ID, @EXPERIENCE_WISDOM_11_ID);
INSERT INTO perk_range (min, max, benefit_table, perk) VALUES (19, 20, @EXPERIENCE_WISDOM_ID, @EXPERIENCE_WISDOM_12_ID);


-- magic and mysticism table
INSERT INTO `perk` (description, type) VALUES ('There are times to put it all on the line, no matter the cost. Your character is always prepared to do just that, thanks to having the Soul Drain Edge. Techno-Wizards gain +5 PPE instead.', 'MAGIC_MYSTICISM_1');
SET @MAGIC_MYSTICISM_1_ID = LAST_INSERT_ID();
INSERT INTO `perk` (description, type) VALUES ('In this world, combat proficiency with magic is highly valued and often necessary for survival. Your spell-weaving hero gains the effects of the Marksman Edge, but with her spellcasting skill (instead of Shooting and Throwing).', 'MAGIC_MYSTICISM_2');
SET @MAGIC_MYSTICISM_2_ID = LAST_INSERT_ID();
INSERT INTO `perk` (description, type) VALUES ('More PPE means more power to work with, and your character has it. He gains +5 PPE to his base.', 'MAGIC_MYSTICISM_3');
SET @MAGIC_MYSTICISM_3_ID = LAST_INSERT_ID();
INSERT INTO `perk` (description, type) VALUES ('Arcane casters benefit from a variety of spells. Your hero knows one power of any Rank from her own list or one Novice power normally unavailable.', 'MAGIC_MYSTICISM_4');
SET @MAGIC_MYSTICISM_4_ID = LAST_INSERT_ID();
INSERT INTO `perk` (description, type) VALUES ('Often, one crisis is quickly followed by another, and your caster needs to get his energy back quickly. He has the Rapid Recharge Edge, or Improved Rapid Recharge if he already has the former.', 'MAGIC_MYSTICISM_5');
SET @MAGIC_MYSTICISM_5_ID = LAST_INSERT_ID();
INSERT INTO `perk` (description, type) VALUES ('Some arcane wielders learn how to use certain spells as almost second nature. Choose one power your hero knows; if she casts it successfully, she automatically gains the raise effect.', 'MAGIC_MYSTICISM_6');
SET @MAGIC_MYSTICISM_6_ID = LAST_INSERT_ID();
INSERT INTO `perk` (description, type) VALUES ('Conservation of magical energy is an incredibly powerful talent. On a raise or better when activating a power, your hero reduces the PPE cost by 1 (minimum 0).', 'MAGIC_MYSTICISM_7');
SET @MAGIC_MYSTICISM_7_ID = LAST_INSERT_ID();
INSERT INTO `perk` (description, type) VALUES ('Born to fight the toughest threats, your hero’s combat spells are inherently potent. All of her damage-dealing spells do Mega Damage, and ones which normally do Mega Damage gain +5 AP.', 'MAGIC_MYSTICISM_8');
SET @MAGIC_MYSTICISM_8_ID = LAST_INSERT_ID();
INSERT INTO `perk` (description, type) VALUES ('Putting down opponents before they end you is a powerful lesson in this dangerous world. Your hero gains +2 damage when using direct damage spells and TW weapons.', 'MAGIC_MYSTICISM_9');
SET @MAGIC_MYSTICISM_9_ID = LAST_INSERT_ID();
INSERT INTO `perk` (description, type) VALUES ('You may choose any one of the previous results.', 'MAGIC_MYSTICISM_10');
SET @MAGIC_MYSTICISM_10_ID = LAST_INSERT_ID();

INSERT INTO perk_range (min, max, benefit_table, perk) VALUES (1, 1, @MAGIC_MYSTICISM_ID, @MAGIC_MYSTICISM_1_ID);
INSERT INTO perk_range (min, max, benefit_table, perk) VALUES (2, 3, @MAGIC_MYSTICISM_ID, @MAGIC_MYSTICISM_2_ID);
INSERT INTO perk_range (min, max, benefit_table, perk) VALUES (4, 7, @MAGIC_MYSTICISM_ID, @MAGIC_MYSTICISM_3_ID);
INSERT INTO perk_range (min, max, benefit_table, perk) VALUES (8, 10, @MAGIC_MYSTICISM_ID, @MAGIC_MYSTICISM_4_ID);
INSERT INTO perk_range (min, max, benefit_table, perk) VALUES (11, 13, @MAGIC_MYSTICISM_ID, @MAGIC_MYSTICISM_5_ID);
INSERT INTO perk_range (min, max, benefit_table, perk) VALUES (14, 14, @MAGIC_MYSTICISM_ID, @MAGIC_MYSTICISM_6_ID);
INSERT INTO perk_range (min, max, benefit_table, perk) VALUES (15, 16, @MAGIC_MYSTICISM_ID, @MAGIC_MYSTICISM_7_ID);
INSERT INTO perk_range (min, max, benefit_table, perk) VALUES (17, 17, @MAGIC_MYSTICISM_ID, @MAGIC_MYSTICISM_8_ID);
INSERT INTO perk_range (min, max, benefit_table, perk) VALUES (18, 18, @MAGIC_MYSTICISM_ID, @MAGIC_MYSTICISM_9_ID);
INSERT INTO perk_range (min, max, benefit_table, perk) VALUES (19, 20, @MAGIC_MYSTICISM_ID, @MAGIC_MYSTICISM_10_ID);


-- psionics table
INSERT INTO `perk` (description, type) VALUES ('Some psionics learn to dig deep within, risking their very lives in order to call on even more power. Your character has the Soul Drain Edge.', 'PSIONICS_1');
SET @PSIONICS_1_ID = LAST_INSERT_ID();
INSERT INTO `perk` (description, type) VALUES ('With deep concentration, meditation, or prayer, your hero regains her ISP at a faster rate than most. She gains the Rapid Recharge Edge (or improved Rapid Recharge if she already has the former).', 'PSIONICS_2');
SET @PSIONICS_2_ID = LAST_INSERT_ID();
INSERT INTO `perk` (description, type) VALUES ('More ISP means more power to work with, and your character has it. He gains +10 ISP to his base.', 'PSIONICS_3');
SET @PSIONICS_3_ID = LAST_INSERT_ID();
INSERT INTO `perk` (description, type) VALUES ('Psychic awareness leads many to the ability to sense the feelings of others. This empathy allows your psionic to determine the general emotional state of another being within Smarts range by making an opposed Spirit check. On a raise, she can tell if another character is lying or being evasive in a conversation.', 'PSIONICS_4');
SET @PSIONICS_4_ID = LAST_INSERT_ID();
INSERT INTO `perk` (description, type) VALUES ('Variety of techniques is a power all its own; your psionic knows one power of any Rank from her own list or one Novice power normally unavailable.', 'PSIONICS_5');
SET @PSIONICS_5_ID = LAST_INSERT_ID();
INSERT INTO `perk` (description, type) VALUES ('Some powers become second-nature to the psionic. Choose a power your character knows; when she successfully activates it, she gains the raise effect automatically.', 'PSIONICS_6');
SET @PSIONICS_6_ID = LAST_INSERT_ID();
INSERT INTO `perk` (description, type) VALUES ('Some psionic characters become expert at breaking the influence others have on people. As an action, your character can give an ally an immediate attempt to break out of illusion (and deadly illusion) or puppet (and mind control) at +2, and he can do this once per round until they break free. This benefit also aids anyone under the mind walk Mega Power.', 'PSIONICS_7');
SET @PSIONICS_7_ID = LAST_INSERT_ID();
INSERT INTO `perk` (description, type) VALUES ('Overcoming the will of others is something many psionics strive to perfect. Your hero is a master of such techniques, granting her the Mentalist Edge.', 'PSIONICS_8');
SET @PSIONICS_8_ID = LAST_INSERT_ID();
INSERT INTO `perk` (description, type) VALUES ('Many psionics strive for a level of enlightenment that transcends matters physical, focusing ever more energy and effort via their will. Your hero is able to spend a Benny to use her Spirit in place of any other Trait roll for a round.', 'PSIONICS_9');
SET @PSIONICS_9_ID = LAST_INSERT_ID();
INSERT INTO `perk` (description, type) VALUES ('Many psionics develop a powerful presence that aids them in influencing and unnerving others. Your hero gains +2 on all Intimidation and Persuasion checks. As well, if he has the fear power, he gains +2 when using it.', 'PSIONICS_10');
SET @PSIONICS_10_ID = LAST_INSERT_ID();
INSERT INTO `perk` (description, type) VALUES ('You may choose any one of the previous results.', 'PSIONICS_11');
SET @PSIONICS_11_ID = LAST_INSERT_ID();

INSERT INTO perk_range (min, max, benefit_table, perk) VALUES (1, 1, @PSIONICS_ID, @PSIONICS_1_ID);
INSERT INTO perk_range (min, max, benefit_table, perk) VALUES (2, 3, @PSIONICS_ID, @PSIONICS_2_ID);
INSERT INTO perk_range (min, max, benefit_table, perk) VALUES (4, 6, @PSIONICS_ID, @PSIONICS_3_ID);
INSERT INTO perk_range (min, max, benefit_table, perk) VALUES (7, 7, @PSIONICS_ID, @PSIONICS_4_ID);
INSERT INTO perk_range (min, max, benefit_table, perk) VALUES (8, 10, @PSIONICS_ID, @PSIONICS_5_ID);
INSERT INTO perk_range (min, max, benefit_table, perk) VALUES (11, 11, @PSIONICS_ID, @PSIONICS_6_ID);
INSERT INTO perk_range (min, max, benefit_table, perk) VALUES (12, 12, @PSIONICS_ID, @PSIONICS_7_ID);
INSERT INTO perk_range (min, max, benefit_table, perk) VALUES (13, 15, @PSIONICS_ID, @PSIONICS_8_ID);
INSERT INTO perk_range (min, max, benefit_table, perk) VALUES (16, 16, @PSIONICS_ID, @PSIONICS_9_ID);
INSERT INTO perk_range (min, max, benefit_table, perk) VALUES (17, 18, @PSIONICS_ID, @PSIONICS_10_ID);
INSERT INTO perk_range (min, max, benefit_table, perk) VALUES (19, 20, @PSIONICS_ID, @PSIONICS_11_ID);


-- ranged weapons table
INSERT INTO `perk` (description, type) VALUES ('Add any Personal Ranged Weapon listed in this book to your character’s gear list. Apply all other results from rolling on this table to your new weapon as you wish.', 'RANGED_WEAPONS_1');
SET @RANGED_WEAPONS_1_ID = LAST_INSERT_ID();
INSERT INTO `perk` (description, type) VALUES ('Your hero came across a cache of grenades, and she knows those can come in handy! She’s got 1d6 armor piercing, 1d8 fragmentation, 1d6 high explosive, and 1d4 plasma grenades. Even after these are gone, she always seems to find more, beginning each session with 1d4 fragmentation grenades.', 'RANGED_WEAPONS_2');
SET @RANGED_WEAPONS_2_ID = LAST_INSERT_ID();
INSERT INTO `perk` (description, type) VALUES ('Exceptional crafting and fine-tuning grants your hero a +1 Shooting with this weapon. This result may be applied a maximum of two times.', 'RANGED_WEAPONS_3');
SET @RANGED_WEAPONS_3_ID = LAST_INSERT_ID();
INSERT INTO `perk` (description, type) VALUES ('The NG-LG6 Laser Rifle combines exceptional firearm capabilities with a handy grenade launcher, making your character a favored squad support member as well as a favored target for enemy shooters.', 'RANGED_WEAPONS_4');
SET @RANGED_WEAPONS_4_ID = LAST_INSERT_ID();
INSERT INTO `perk` (description, type) VALUES ('This weapon is extra deadly, granting a +1 to all damage rolls made with it. This result may be applied a maximum of three times.', 'RANGED_WEAPONS_5');
SET @RANGED_WEAPONS_5_ID = LAST_INSERT_ID();
INSERT INTO `perk` (description, type) VALUES ('Likely taken from a former foe, your hero has a TX-5 Pump Pistol as part of his personal arsenal.', 'RANGED_WEAPONS_6');
SET @RANGED_WEAPONS_6_ID = LAST_INSERT_ID();
INSERT INTO `perk` (description, type) VALUES ('The JA-11 Energy Rifle is a marvel of design and effectiveness. Most Juicers give any non-Juicer the side-eye if they’re carrying one.', 'RANGED_WEAPONS_7');
SET @RANGED_WEAPONS_7_ID = LAST_INSERT_ID();
INSERT INTO `perk` (description, type) VALUES ('Throwing grenades is fine, but shooting them in rapid succession is better. Your hero loves his WI-GL20 Automatic Grenade Launcher, which comes with a full load of his choice of grenades.', 'RANGED_WEAPONS_8');
SET @RANGED_WEAPONS_8_ID = LAST_INSERT_ID();
INSERT INTO `perk` (description, type) VALUES ('Your hero, ready for vampires, carries a modified crossbow that serves to launch wooden stakes (Range 12/24/48, Damage 2d6+2, RoF 1). It has a small clip-feeder, giving it five shots before reloading, which takes an action.', 'RANGED_WEAPONS_9');
SET @RANGED_WEAPONS_9_ID = LAST_INSERT_ID();
INSERT INTO `perk` (description, type) VALUES ('Advanced technology makes this weapon extra effective against armor, giving it +2 AP.', 'RANGED_WEAPONS_10');
SET @RANGED_WEAPONS_10_ID = LAST_INSERT_ID();
INSERT INTO `perk` (description, type) VALUES ('This weapon has a Vibro-Knife embedded, bayonet-style (Str+d6, AP 4, Mega Damage).', 'RANGED_WEAPONS_11');
SET @RANGED_WEAPONS_11_ID = LAST_INSERT_ID();
INSERT INTO `perk` (description, type) VALUES ('It’s big, it’s bulky, and it’s a pain to fire while on the move. Nonetheless, your hero’s NG-E4 Plasma Ejector is exactly what the team needs when the gates of Hell open or a Coalition Death’s Head transport flies overhead.', 'RANGED_WEAPONS_12');
SET @RANGED_WEAPONS_12_ID = LAST_INSERT_ID();
INSERT INTO `perk` (description, type) VALUES ('When your bullets and blasts are splashing off the giant machine’s M.D.C. armor or the horrific demon’s carapace, it’s time to grab the Portable Rocket Launcher.', 'RANGED_WEAPONS_13');
SET @RANGED_WEAPONS_13_ID = LAST_INSERT_ID();
INSERT INTO `perk` (description, type) VALUES ('You may choose any one of the previous results.', 'RANGED_WEAPONS_14');
SET @RANGED_WEAPONS_14_ID = LAST_INSERT_ID();


INSERT INTO perk_range (min, max, benefit_table, perk) VALUES (1, 3, @RANGED_WEAPONS_ID, @RANGED_WEAPONS_1_ID);
INSERT INTO perk_range (min, max, benefit_table, perk) VALUES (4, 4, @RANGED_WEAPONS_ID, @RANGED_WEAPONS_2_ID);
INSERT INTO perk_range (min, max, benefit_table, perk) VALUES (5, 6, @RANGED_WEAPONS_ID, @RANGED_WEAPONS_3_ID);
INSERT INTO perk_range (min, max, benefit_table, perk) VALUES (7, 8, @RANGED_WEAPONS_ID, @RANGED_WEAPONS_4_ID);
INSERT INTO perk_range (min, max, benefit_table, perk) VALUES (9, 10, @RANGED_WEAPONS_ID, @RANGED_WEAPONS_5_ID);
INSERT INTO perk_range (min, max, benefit_table, perk) VALUES (11, 11, @RANGED_WEAPONS_ID, @RANGED_WEAPONS_6_ID);
INSERT INTO perk_range (min, max, benefit_table, perk) VALUES (12, 12, @RANGED_WEAPONS_ID, @RANGED_WEAPONS_7_ID);
INSERT INTO perk_range (min, max, benefit_table, perk) VALUES (13, 13, @RANGED_WEAPONS_ID, @RANGED_WEAPONS_8_ID);
INSERT INTO perk_range (min, max, benefit_table, perk) VALUES (14, 14, @RANGED_WEAPONS_ID, @RANGED_WEAPONS_9_ID);
INSERT INTO perk_range (min, max, benefit_table, perk) VALUES (15, 15, @RANGED_WEAPONS_ID, @RANGED_WEAPONS_10_ID);
INSERT INTO perk_range (min, max, benefit_table, perk) VALUES (16, 16, @RANGED_WEAPONS_ID, @RANGED_WEAPONS_11_ID);
INSERT INTO perk_range (min, max, benefit_table, perk) VALUES (17, 17, @RANGED_WEAPONS_ID, @RANGED_WEAPONS_12_ID);
INSERT INTO perk_range (min, max, benefit_table, perk) VALUES (18, 18, @RANGED_WEAPONS_ID, @RANGED_WEAPONS_13_ID);
INSERT INTO perk_range (min, max, benefit_table, perk) VALUES (19, 20, @RANGED_WEAPONS_ID, @RANGED_WEAPONS_14_ID);


-- training table
INSERT INTO `perk` (description, type) VALUES ('After serving in a military, paramilitary, militia, or security force for some time, your hero has some solid combat training. She gains +5 Skill Points, which may be spent on Fighting, Shooting, or Throwing in any combination.', 'TRAINING_1');
SET @TRAINING_1_ID = LAST_INSERT_ID();
INSERT INTO `perk` (description, type) VALUES ('Whether via formal training in a dedicated school, learning at the hands of a master, or just surviving a dangerous world, your hero’s picked up some serious fighting skills. He’s got the Martial Artist Edge (or Improved Martial Artist, if he already had the former), as well as the Brawler Edge.', 'TRAINING_2');
SET @TRAINING_2_ID = LAST_INSERT_ID();
INSERT INTO `perk` (description, type) VALUES ('Part of your character’s extensive training including full understanding of a particular occupation or area of focus. You may give her one Professional Edge, ignoring requirements, subject to the GM’s approval.', 'TRAINING_3');
SET @TRAINING_3_ID = LAST_INSERT_ID();
INSERT INTO `perk` (description, type) VALUES ('While the cities of Savage Rifts® are deadly in their own right, your hero understands the dangers of the wilderness in ways few ever grasp. He has the Woodsman Edge and gains a one die type increase in Survival and Tracking.', 'TRAINING_4');
SET @TRAINING_4_ID = LAST_INSERT_ID();
INSERT INTO `perk` (description, type) VALUES ('Functional machines and technology often mean the difference between life and death in the world of Savage Rifts®. Fortunately for any group your hero runs with, she’s pretty good with tech, giving her a one die type increase for the Repair skill, as well as +1 on Knowledge (Electronics) and Knowledge (Engineering) rolls.', 'TRAINING_5');
SET @TRAINING_5_ID = LAST_INSERT_ID();
INSERT INTO `perk` (description, type) VALUES ('There are a lot of broken elevators and overgrown mountain trails across the world, making trained climbers a valuable addition to any group. Your character is one of those folks who knows his way around ropes and clamps, granting him a d6 Climbing, or +2 to the skill if he already has it. He also has a good set of climbing gear for a party of four.', 'TRAINING_6');
SET @TRAINING_6_ID = LAST_INSERT_ID();
INSERT INTO `perk` (description, type) VALUES ('When it gets up-close and ugly, your hero knows how to set up her opponents for a nasty fall, while protecting herself. She has the Dirty Fighter Edge (or Tricky Fighter, if she already has Dirty Fighter). She also gains +1 to Parry.', 'TRAINING_7');
SET @TRAINING_7_ID = LAST_INSERT_ID();
INSERT INTO `perk` (description, type) VALUES ('Constant battle, for cause or survival, means your hero knows a great deal about combat. Select one Combat Edge; you may ignore all requirements except other Edges (to take Improved Frenzy; your character must have Frenzy first).', 'TRAINING_8');
SET @TRAINING_8_ID = LAST_INSERT_ID();
INSERT INTO `perk` (description, type) VALUES ('Though lots of folks can jump behind a wheel or grab a stick, your hero understands the nuances of guiding a machine effectively through the worst conditions. She gains the Ace Edge (or Combat Ace, if she already has Ace), as well as a one die type increase in her choice of Boating, Driving, or Piloting.', 'TRAINING_9');
SET @TRAINING_9_ID = LAST_INSERT_ID();
INSERT INTO `perk` (description, type) VALUES ('There are moments when everything comes together and an opportunity presents itself. You’re hero knows how to make the most of just such a moment; choose one Wild Card Edge, regardless of requirements.', 'TRAINING_10');
SET @TRAINING_10_ID = LAST_INSERT_ID();
INSERT INTO `perk` (description, type) VALUES ('You may choose any one of the previous results.', 'TRAINING_11');
SET @TRAINING_11_ID = LAST_INSERT_ID();

INSERT INTO perk_range (min, max, benefit_table, perk) VALUES (1, 3, @TRAINING_ID, @TRAINING_1_ID);
INSERT INTO perk_range (min, max, benefit_table, perk) VALUES (4, 5, @TRAINING_ID, @TRAINING_2_ID);
INSERT INTO perk_range (min, max, benefit_table, perk) VALUES (6, 7, @TRAINING_ID, @TRAINING_3_ID);
INSERT INTO perk_range (min, max, benefit_table, perk) VALUES (8, 9, @TRAINING_ID, @TRAINING_4_ID);
INSERT INTO perk_range (min, max, benefit_table, perk) VALUES (10, 11, @TRAINING_ID, @TRAINING_5_ID);
INSERT INTO perk_range (min, max, benefit_table, perk) VALUES (12, 13, @TRAINING_ID, @TRAINING_6_ID);
INSERT INTO perk_range (min, max, benefit_table, perk) VALUES (14, 14, @TRAINING_ID, @TRAINING_7_ID);
INSERT INTO perk_range (min, max, benefit_table, perk) VALUES (15, 16, @TRAINING_ID, @TRAINING_8_ID);
INSERT INTO perk_range (min, max, benefit_table, perk) VALUES (17, 17, @TRAINING_ID, @TRAINING_9_ID);
INSERT INTO perk_range (min, max, benefit_table, perk) VALUES (18, 18, @TRAINING_ID, @TRAINING_10_ID);
INSERT INTO perk_range (min, max, benefit_table, perk) VALUES (19, 20, @TRAINING_ID, @TRAINING_11_ID);


-- underworld black ops table
INSERT INTO `perk` (description, type) VALUES ('When all else fails, your hero knows how to take any available resources and juryrig her way into or out of situations. She has the McGyver Edge, and she gains a die type in Repair.', 'UNDERWORLD_BLACK_OPS_1');
SET @UNDERWORLD_BLACK_OPS_1_ID = LAST_INSERT_ID();
INSERT INTO `perk` (description, type) VALUES ('Your character’s innate understanding of computers makes him one of the most valuable people in the world. He gains Knowledge (Computers) d8, as well as +2 when dealing with electronic security.', 'UNDERWORLD_BLACK_OPS_2');
SET @UNDERWORLD_BLACK_OPS_2_ID = LAST_INSERT_ID();
INSERT INTO `perk` (description, type) VALUES ('She’s done more and traveled more than anyone, and she always seems to know someone, somewhere, she can call on for information or aid. Your hero has the I Know a Guy Edge, and she gains +2 on all Connections rolls to contact and gain assistance.', 'UNDERWORLD_BLACK_OPS_3');
SET @UNDERWORLD_BLACK_OPS_3_ID = LAST_INSERT_ID();
INSERT INTO `perk` (description, type) VALUES ('Your character has a knack for taking full advantage of his opponents. He has the Dirty Fighter Edge (or Tricky Fighter, if he already has Dirty Fighter), and whenever he gets a raise on a Trick attempt, he may spend a Benny to gain The Drop on his opponent on that round.', 'UNDERWORLD_BLACK_OPS_4');
SET @UNDERWORLD_BLACK_OPS_4_ID = LAST_INSERT_ID();
INSERT INTO `perk` (description, type) VALUES ('Though few and far between, the cites of Rifts Earth are the hubs of what remains of civilization, vital as sources of information. Your character understands the ebb and flow of their streets and alleyways, gaining a d8 in Streetwise. She is also good at creating fakes of necessary papers, badges, and the like; she’s got experience and training in Forgery (treat as Common Knowledge), with a +2 to related checks.', 'UNDERWORLD_BLACK_OPS_5');
SET @UNDERWORLD_BLACK_OPS_5_ID = LAST_INSERT_ID();
INSERT INTO `perk` (description, type) VALUES ('Your character is inherently gifted at larceny, possessing the Thief Edge without concern for requirements. He also gains +3 Skill Points to spend on Climbing, Lockpicking, and Stealth as he chooses.', 'UNDERWORLD_BLACK_OPS_6');
SET @UNDERWORLD_BLACK_OPS_6_ID = LAST_INSERT_ID();
INSERT INTO `perk` (description, type) VALUES ('Your hero is an infiltration specialist, skilled at blending into a culture or group for undercover work. She gains a +1 to any Investigation, Persuasion, Stealth, and Streetwise rolls related to being undercover, and a +2 to any Common Knowledge rolls for disguising herself and playing the role. She also gains two additional languages on top of what she already knows.', 'UNDERWORLD_BLACK_OPS_7');
SET @UNDERWORLD_BLACK_OPS_7_ID = LAST_INSERT_ID();
INSERT INTO `perk` (description, type) VALUES ('With a nose for opportunities, horse-trading, and five-fingered discounts, your hero is the go-to person for getting what’s needed in a crunch. He has the Scrounger Edge and Connections (Black Market).', 'UNDERWORLD_BLACK_OPS_8');
SET @UNDERWORLD_BLACK_OPS_8_ID = LAST_INSERT_ID();
INSERT INTO `perk` (description, type) VALUES ('Spies and provocateurs are regularly called upon to do just about anything to accomplish a mission; your hero’s made it a point to learn a little something about everything. She has the Jack-of-All-Trades Edge.', 'UNDERWORLD_BLACK_OPS_9');
SET @UNDERWORLD_BLACK_OPS_9_ID = LAST_INSERT_ID();
INSERT INTO `perk` (description, type) VALUES ('There are many killers in the world, but your character is a wetwork expert with a particular set of skills. He gains the Assassin Edge. He also gains +2 for Fighting, Shooting, and Throwing rolls, but only to offset Called Shot penalties.', 'UNDERWORLD_BLACK_OPS_10');
SET @UNDERWORLD_BLACK_OPS_10_ID = LAST_INSERT_ID();
INSERT INTO `perk` (description, type) VALUES ('You may choose any one of the previous results.', 'UNDERWORLD_BLACK_OPS_11');
SET @UNDERWORLD_BLACK_OPS_11_ID = LAST_INSERT_ID();

INSERT INTO perk_range (min, max, benefit_table, perk) VALUES (1, 2, @UNDERWORLD_BLACK_OPS_ID, @UNDERWORLD_BLACK_OPS_1_ID);
INSERT INTO perk_range (min, max, benefit_table, perk) VALUES (3, 4, @UNDERWORLD_BLACK_OPS_ID, @UNDERWORLD_BLACK_OPS_2_ID);
INSERT INTO perk_range (min, max, benefit_table, perk) VALUES (5, 7, @UNDERWORLD_BLACK_OPS_ID, @UNDERWORLD_BLACK_OPS_3_ID);
INSERT INTO perk_range (min, max, benefit_table, perk) VALUES (8, 8, @UNDERWORLD_BLACK_OPS_ID, @UNDERWORLD_BLACK_OPS_4_ID);
INSERT INTO perk_range (min, max, benefit_table, perk) VALUES (9, 10, @UNDERWORLD_BLACK_OPS_ID, @UNDERWORLD_BLACK_OPS_5_ID);
INSERT INTO perk_range (min, max, benefit_table, perk) VALUES (11, 13, @UNDERWORLD_BLACK_OPS_ID, @UNDERWORLD_BLACK_OPS_6_ID);
INSERT INTO perk_range (min, max, benefit_table, perk) VALUES (14, 14, @UNDERWORLD_BLACK_OPS_ID, @UNDERWORLD_BLACK_OPS_7_ID);
INSERT INTO perk_range (min, max, benefit_table, perk) VALUES (15, 16, @UNDERWORLD_BLACK_OPS_ID, @UNDERWORLD_BLACK_OPS_8_ID);
INSERT INTO perk_range (min, max, benefit_table, perk) VALUES (17, 17, @UNDERWORLD_BLACK_OPS_ID, @UNDERWORLD_BLACK_OPS_9_ID);
INSERT INTO perk_range (min, max, benefit_table, perk) VALUES (18, 18, @UNDERWORLD_BLACK_OPS_ID, @UNDERWORLD_BLACK_OPS_10_ID);
INSERT INTO perk_range (min, max, benefit_table, perk) VALUES (19, 20, @UNDERWORLD_BLACK_OPS_ID, @UNDERWORLD_BLACK_OPS_11_ID);


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

SELECT @CYBER_KNIGHT_ID:=id FROM framework WHERE type = 'CYBER_KNIGHT';
SELECT @GLITTER_BOY_ID:=id FROM framework WHERE type = 'GLITTER_BOY';
SELECT @JUICER_ID:=id FROM framework WHERE type = 'JUICER';
SELECT @BURSTER_ID:=id FROM framework WHERE type = 'BURSTER';
SELECT @MIND_MELTER_ID:=id FROM framework WHERE type = 'MIND_MELTER';
SELECT @LEY_LINE_WALKER_ID:=id FROM framework WHERE type = 'LEY_LINE_WALKER';
SELECT @MYSTIC_ID:=id FROM framework WHERE type = 'MYSTIC';
SELECT @TECHNO_WIZARD_ID:=id FROM framework WHERE type = 'TECHNO_WIZARD';
SELECT @DRAGON_ID:=id FROM framework WHERE type = 'DRAGON';

-- add allowances for other frameworks

-- cyber knight gets 5 rolls
-- Cyber-Knights gain three rolls on any of the 
-- following tables: Education, Experience & 
-- Wisdom, Psionics, and Training. 

-- Cyber-Knights gain two rolls on any table 
-- except Cybernetics and Magic & Mysticism. 
INSERT INTO benefit_table_roll (roll_number, framework) VALUES (1, @CYBER_KNIGHT_ID);
SET @CYBER_KNIGHT_TABLE_ROLL_1 = LAST_INSERT_ID();
INSERT INTO benefit_table_roll (roll_number, framework) VALUES (2, @CYBER_KNIGHT_ID);
SET @CYBER_KNIGHT_TABLE_ROLL_2 = LAST_INSERT_ID();
INSERT INTO benefit_table_roll (roll_number, framework) VALUES (3, @CYBER_KNIGHT_ID);
SET @CYBER_KNIGHT_TABLE_ROLL_3 = LAST_INSERT_ID();
INSERT INTO benefit_table_roll (roll_number, framework) VALUES (4, @CYBER_KNIGHT_ID);
SET @CYBER_KNIGHT_TABLE_ROLL_4 = LAST_INSERT_ID();
INSERT INTO benefit_table_roll (roll_number, framework) VALUES (5, @CYBER_KNIGHT_ID);
SET @CYBER_KNIGHT_TABLE_ROLL_5 = LAST_INSERT_ID();

--  rolls 1 2 and 3 gets Education, Experience & Wisdom, Psionics, and Training
INSERT INTO benefit_table_roll_allowance (benefit_table_roll_id, benefit_table_id) VALUES (@CYBER_KNIGHT_TABLE_ROLL_1, @EDUCATION_ID);
INSERT INTO benefit_table_roll_allowance (benefit_table_roll_id, benefit_table_id) VALUES (@CYBER_KNIGHT_TABLE_ROLL_1, @EXPERIENCE_WISDOM_ID);
INSERT INTO benefit_table_roll_allowance (benefit_table_roll_id, benefit_table_id) VALUES (@CYBER_KNIGHT_TABLE_ROLL_1, @PSIONICS_ID);
INSERT INTO benefit_table_roll_allowance (benefit_table_roll_id, benefit_table_id) VALUES (@CYBER_KNIGHT_TABLE_ROLL_1, @TRAINING_ID);

INSERT INTO benefit_table_roll_allowance (benefit_table_roll_id, benefit_table_id) VALUES (@CYBER_KNIGHT_TABLE_ROLL_2, @EDUCATION_ID);
INSERT INTO benefit_table_roll_allowance (benefit_table_roll_id, benefit_table_id) VALUES (@CYBER_KNIGHT_TABLE_ROLL_2, @EXPERIENCE_WISDOM_ID);
INSERT INTO benefit_table_roll_allowance (benefit_table_roll_id, benefit_table_id) VALUES (@CYBER_KNIGHT_TABLE_ROLL_2, @PSIONICS_ID);
INSERT INTO benefit_table_roll_allowance (benefit_table_roll_id, benefit_table_id) VALUES (@CYBER_KNIGHT_TABLE_ROLL_2, @TRAINING_ID);

INSERT INTO benefit_table_roll_allowance (benefit_table_roll_id, benefit_table_id) VALUES (@CYBER_KNIGHT_TABLE_ROLL_3, @EDUCATION_ID);
INSERT INTO benefit_table_roll_allowance (benefit_table_roll_id, benefit_table_id) VALUES (@CYBER_KNIGHT_TABLE_ROLL_3, @EXPERIENCE_WISDOM_ID);
INSERT INTO benefit_table_roll_allowance (benefit_table_roll_id, benefit_table_id) VALUES (@CYBER_KNIGHT_TABLE_ROLL_3, @PSIONICS_ID);
INSERT INTO benefit_table_roll_allowance (benefit_table_roll_id, benefit_table_id) VALUES (@CYBER_KNIGHT_TABLE_ROLL_3, @TRAINING_ID);

--  rolls 4 and 5 are any table except Cybernetics and Magic & Mysticism
INSERT INTO benefit_table_roll_allowance (benefit_table_roll_id, benefit_table_id) VALUES (@CYBER_KNIGHT_TABLE_ROLL_4, @BODY_ARMOR_ID);
INSERT INTO benefit_table_roll_allowance (benefit_table_roll_id, benefit_table_id) VALUES (@CYBER_KNIGHT_TABLE_ROLL_4, @CCW_ID);
INSERT INTO benefit_table_roll_allowance (benefit_table_roll_id, benefit_table_id) VALUES (@CYBER_KNIGHT_TABLE_ROLL_4, @EDUCATION_ID);
INSERT INTO benefit_table_roll_allowance (benefit_table_roll_id, benefit_table_id) VALUES (@CYBER_KNIGHT_TABLE_ROLL_4, @ENCHANTED_ITEMS_MYSTIC_GADGETS_ID);
INSERT INTO benefit_table_roll_allowance (benefit_table_roll_id, benefit_table_id) VALUES (@CYBER_KNIGHT_TABLE_ROLL_4, @EXPERIENCE_WISDOM_ID);
INSERT INTO benefit_table_roll_allowance (benefit_table_roll_id, benefit_table_id) VALUES (@CYBER_KNIGHT_TABLE_ROLL_4, @PSIONICS_ID);
INSERT INTO benefit_table_roll_allowance (benefit_table_roll_id, benefit_table_id) VALUES (@CYBER_KNIGHT_TABLE_ROLL_4, @RANGED_WEAPONS_ID);
INSERT INTO benefit_table_roll_allowance (benefit_table_roll_id, benefit_table_id) VALUES (@CYBER_KNIGHT_TABLE_ROLL_4, @TRAINING_ID);
INSERT INTO benefit_table_roll_allowance (benefit_table_roll_id, benefit_table_id) VALUES (@CYBER_KNIGHT_TABLE_ROLL_4, @UNDERWORLD_BLACK_OPS_ID);

INSERT INTO benefit_table_roll_allowance (benefit_table_roll_id, benefit_table_id) VALUES (@CYBER_KNIGHT_TABLE_ROLL_5, @BODY_ARMOR_ID);
INSERT INTO benefit_table_roll_allowance (benefit_table_roll_id, benefit_table_id) VALUES (@CYBER_KNIGHT_TABLE_ROLL_5, @CCW_ID);
INSERT INTO benefit_table_roll_allowance (benefit_table_roll_id, benefit_table_id) VALUES (@CYBER_KNIGHT_TABLE_ROLL_5, @EDUCATION_ID);
INSERT INTO benefit_table_roll_allowance (benefit_table_roll_id, benefit_table_id) VALUES (@CYBER_KNIGHT_TABLE_ROLL_5, @ENCHANTED_ITEMS_MYSTIC_GADGETS_ID);
INSERT INTO benefit_table_roll_allowance (benefit_table_roll_id, benefit_table_id) VALUES (@CYBER_KNIGHT_TABLE_ROLL_5, @EXPERIENCE_WISDOM_ID);
INSERT INTO benefit_table_roll_allowance (benefit_table_roll_id, benefit_table_id) VALUES (@CYBER_KNIGHT_TABLE_ROLL_5, @PSIONICS_ID);
INSERT INTO benefit_table_roll_allowance (benefit_table_roll_id, benefit_table_id) VALUES (@CYBER_KNIGHT_TABLE_ROLL_5, @RANGED_WEAPONS_ID);
INSERT INTO benefit_table_roll_allowance (benefit_table_roll_id, benefit_table_id) VALUES (@CYBER_KNIGHT_TABLE_ROLL_5, @TRAINING_ID);
INSERT INTO benefit_table_roll_allowance (benefit_table_roll_id, benefit_table_id) VALUES (@CYBER_KNIGHT_TABLE_ROLL_5, @UNDERWORLD_BLACK_OPS_ID);

-- glitter boy 5 rolls
-- 3 on any of cybernetics, ccw, ranged weapons, training
-- 2 on any table
INSERT INTO benefit_table_roll (roll_number, framework) VALUES (1, @GLITTER_BOY_ID);
SET @GLITTER_BOY_TABLE_ROLL_1 = LAST_INSERT_ID();
INSERT INTO benefit_table_roll (roll_number, framework) VALUES (2, @GLITTER_BOY_ID);
SET @GLITTER_BOY_TABLE_ROLL_2 = LAST_INSERT_ID();
INSERT INTO benefit_table_roll (roll_number, framework) VALUES (3, @GLITTER_BOY_ID);
SET @GLITTER_BOY_TABLE_ROLL_3 = LAST_INSERT_ID();
INSERT INTO benefit_table_roll (roll_number, framework) VALUES (4, @GLITTER_BOY_ID);
SET @GLITTER_BOY_TABLE_ROLL_4 = LAST_INSERT_ID();
INSERT INTO benefit_table_roll (roll_number, framework) VALUES (5, @GLITTER_BOY_ID);
SET @GLITTER_BOY_TABLE_ROLL_5 = LAST_INSERT_ID();

-- rolls 1 2 3 are any of cybernetics, ccw, ranged weapons, training
INSERT INTO benefit_table_roll_allowance (benefit_table_roll_id, benefit_table_id) VALUES (@GLITTER_BOY_TABLE_ROLL_1, @CCW_ID);
INSERT INTO benefit_table_roll_allowance (benefit_table_roll_id, benefit_table_id) VALUES (@GLITTER_BOY_TABLE_ROLL_1, @CYBERNETICS_ID);
INSERT INTO benefit_table_roll_allowance (benefit_table_roll_id, benefit_table_id) VALUES (@GLITTER_BOY_TABLE_ROLL_1, @RANGED_WEAPONS_ID);
INSERT INTO benefit_table_roll_allowance (benefit_table_roll_id, benefit_table_id) VALUES (@GLITTER_BOY_TABLE_ROLL_1, @TRAINING_ID);

INSERT INTO benefit_table_roll_allowance (benefit_table_roll_id, benefit_table_id) VALUES (@GLITTER_BOY_TABLE_ROLL_2, @CCW_ID);
INSERT INTO benefit_table_roll_allowance (benefit_table_roll_id, benefit_table_id) VALUES (@GLITTER_BOY_TABLE_ROLL_2, @CYBERNETICS_ID);
INSERT INTO benefit_table_roll_allowance (benefit_table_roll_id, benefit_table_id) VALUES (@GLITTER_BOY_TABLE_ROLL_2, @RANGED_WEAPONS_ID);
INSERT INTO benefit_table_roll_allowance (benefit_table_roll_id, benefit_table_id) VALUES (@GLITTER_BOY_TABLE_ROLL_2, @TRAINING_ID);

INSERT INTO benefit_table_roll_allowance (benefit_table_roll_id, benefit_table_id) VALUES (@GLITTER_BOY_TABLE_ROLL_3, @CCW_ID);
INSERT INTO benefit_table_roll_allowance (benefit_table_roll_id, benefit_table_id) VALUES (@GLITTER_BOY_TABLE_ROLL_3, @CYBERNETICS_ID);
INSERT INTO benefit_table_roll_allowance (benefit_table_roll_id, benefit_table_id) VALUES (@GLITTER_BOY_TABLE_ROLL_3, @RANGED_WEAPONS_ID);
INSERT INTO benefit_table_roll_allowance (benefit_table_roll_id, benefit_table_id) VALUES (@GLITTER_BOY_TABLE_ROLL_3, @TRAINING_ID);

-- rolls 4 5 are ANY table
INSERT INTO benefit_table_roll_allowance (benefit_table_roll_id, benefit_table_id) VALUES (@GLITTER_BOY_TABLE_ROLL_4, @BODY_ARMOR_ID);
INSERT INTO benefit_table_roll_allowance (benefit_table_roll_id, benefit_table_id) VALUES (@GLITTER_BOY_TABLE_ROLL_4, @CCW_ID);
INSERT INTO benefit_table_roll_allowance (benefit_table_roll_id, benefit_table_id) VALUES (@GLITTER_BOY_TABLE_ROLL_4, @CYBERNETICS_ID);
INSERT INTO benefit_table_roll_allowance (benefit_table_roll_id, benefit_table_id) VALUES (@GLITTER_BOY_TABLE_ROLL_4, @EDUCATION_ID);
INSERT INTO benefit_table_roll_allowance (benefit_table_roll_id, benefit_table_id) VALUES (@GLITTER_BOY_TABLE_ROLL_4, @ENCHANTED_ITEMS_MYSTIC_GADGETS_ID);
INSERT INTO benefit_table_roll_allowance (benefit_table_roll_id, benefit_table_id) VALUES (@GLITTER_BOY_TABLE_ROLL_4, @EXPERIENCE_WISDOM_ID);
INSERT INTO benefit_table_roll_allowance (benefit_table_roll_id, benefit_table_id) VALUES (@GLITTER_BOY_TABLE_ROLL_4, @MAGIC_MYSTICISM_ID);
INSERT INTO benefit_table_roll_allowance (benefit_table_roll_id, benefit_table_id) VALUES (@GLITTER_BOY_TABLE_ROLL_4, @PSIONICS_ID);
INSERT INTO benefit_table_roll_allowance (benefit_table_roll_id, benefit_table_id) VALUES (@GLITTER_BOY_TABLE_ROLL_4, @RANGED_WEAPONS_ID);
INSERT INTO benefit_table_roll_allowance (benefit_table_roll_id, benefit_table_id) VALUES (@GLITTER_BOY_TABLE_ROLL_4, @TRAINING_ID);
INSERT INTO benefit_table_roll_allowance (benefit_table_roll_id, benefit_table_id) VALUES (@GLITTER_BOY_TABLE_ROLL_4, @UNDERWORLD_BLACK_OPS_ID);

INSERT INTO benefit_table_roll_allowance (benefit_table_roll_id, benefit_table_id) VALUES (@GLITTER_BOY_TABLE_ROLL_5, @BODY_ARMOR_ID);
INSERT INTO benefit_table_roll_allowance (benefit_table_roll_id, benefit_table_id) VALUES (@GLITTER_BOY_TABLE_ROLL_5, @CCW_ID);
INSERT INTO benefit_table_roll_allowance (benefit_table_roll_id, benefit_table_id) VALUES (@GLITTER_BOY_TABLE_ROLL_5, @CYBERNETICS_ID);
INSERT INTO benefit_table_roll_allowance (benefit_table_roll_id, benefit_table_id) VALUES (@GLITTER_BOY_TABLE_ROLL_5, @EDUCATION_ID);
INSERT INTO benefit_table_roll_allowance (benefit_table_roll_id, benefit_table_id) VALUES (@GLITTER_BOY_TABLE_ROLL_5, @ENCHANTED_ITEMS_MYSTIC_GADGETS_ID);
INSERT INTO benefit_table_roll_allowance (benefit_table_roll_id, benefit_table_id) VALUES (@GLITTER_BOY_TABLE_ROLL_5, @EXPERIENCE_WISDOM_ID);
INSERT INTO benefit_table_roll_allowance (benefit_table_roll_id, benefit_table_id) VALUES (@GLITTER_BOY_TABLE_ROLL_5, @MAGIC_MYSTICISM_ID);
INSERT INTO benefit_table_roll_allowance (benefit_table_roll_id, benefit_table_id) VALUES (@GLITTER_BOY_TABLE_ROLL_5, @PSIONICS_ID);
INSERT INTO benefit_table_roll_allowance (benefit_table_roll_id, benefit_table_id) VALUES (@GLITTER_BOY_TABLE_ROLL_5, @RANGED_WEAPONS_ID);
INSERT INTO benefit_table_roll_allowance (benefit_table_roll_id, benefit_table_id) VALUES (@GLITTER_BOY_TABLE_ROLL_5, @TRAINING_ID);
INSERT INTO benefit_table_roll_allowance (benefit_table_roll_id, benefit_table_id) VALUES (@GLITTER_BOY_TABLE_ROLL_5, @UNDERWORLD_BLACK_OPS_ID);

-- Juicers get 5 rolls
-- Juicers gain three rolls on any of the 
-- following tables: Body Armor, Close 
-- Combat Weapons, Ranged Weapons, 
-- Training, and Underworld & Black Ops. 

-- Juicers gain two additional rolls on 
-- any tables except those dealing with 
-- magic or psionics. 
INSERT INTO benefit_table_roll (roll_number, framework) VALUES (1, @JUICER_ID);
SET @JUICER_TABLE_ROLL_1 = LAST_INSERT_ID();
INSERT INTO benefit_table_roll (roll_number, framework) VALUES (2, @JUICER_ID);
SET @JUICER_TABLE_ROLL_2 = LAST_INSERT_ID();
INSERT INTO benefit_table_roll (roll_number, framework) VALUES (3, @JUICER_ID);
SET @JUICER_TABLE_ROLL_3 = LAST_INSERT_ID();
INSERT INTO benefit_table_roll (roll_number, framework) VALUES (4, @JUICER_ID);
SET @JUICER_TABLE_ROLL_4 = LAST_INSERT_ID();
INSERT INTO benefit_table_roll (roll_number, framework) VALUES (5, @JUICER_ID);
SET @JUICER_TABLE_ROLL_5 = LAST_INSERT_ID();

-- rolls 1, 2, 3 are Body Armor, Close Combat Weapons, Ranged Weapons, Training, and Underworld & Black Ops
INSERT INTO benefit_table_roll_allowance (benefit_table_roll_id, benefit_table_id) VALUES (@JUICER_TABLE_ROLL_1, @BODY_ARMOR_ID);
INSERT INTO benefit_table_roll_allowance (benefit_table_roll_id, benefit_table_id) VALUES (@JUICER_TABLE_ROLL_1, @CCW_ID);
INSERT INTO benefit_table_roll_allowance (benefit_table_roll_id, benefit_table_id) VALUES (@JUICER_TABLE_ROLL_1, @RANGED_WEAPONS_ID);
INSERT INTO benefit_table_roll_allowance (benefit_table_roll_id, benefit_table_id) VALUES (@JUICER_TABLE_ROLL_1, @TRAINING_ID);
INSERT INTO benefit_table_roll_allowance (benefit_table_roll_id, benefit_table_id) VALUES (@JUICER_TABLE_ROLL_1, @UNDERWORLD_BLACK_OPS_ID);

INSERT INTO benefit_table_roll_allowance (benefit_table_roll_id, benefit_table_id) VALUES (@JUICER_TABLE_ROLL_2, @BODY_ARMOR_ID);
INSERT INTO benefit_table_roll_allowance (benefit_table_roll_id, benefit_table_id) VALUES (@JUICER_TABLE_ROLL_2, @CCW_ID);
INSERT INTO benefit_table_roll_allowance (benefit_table_roll_id, benefit_table_id) VALUES (@JUICER_TABLE_ROLL_2, @RANGED_WEAPONS_ID);
INSERT INTO benefit_table_roll_allowance (benefit_table_roll_id, benefit_table_id) VALUES (@JUICER_TABLE_ROLL_2, @TRAINING_ID);
INSERT INTO benefit_table_roll_allowance (benefit_table_roll_id, benefit_table_id) VALUES (@JUICER_TABLE_ROLL_2, @UNDERWORLD_BLACK_OPS_ID);

INSERT INTO benefit_table_roll_allowance (benefit_table_roll_id, benefit_table_id) VALUES (@JUICER_TABLE_ROLL_3, @BODY_ARMOR_ID);
INSERT INTO benefit_table_roll_allowance (benefit_table_roll_id, benefit_table_id) VALUES (@JUICER_TABLE_ROLL_3, @CCW_ID);
INSERT INTO benefit_table_roll_allowance (benefit_table_roll_id, benefit_table_id) VALUES (@JUICER_TABLE_ROLL_3, @RANGED_WEAPONS_ID);
INSERT INTO benefit_table_roll_allowance (benefit_table_roll_id, benefit_table_id) VALUES (@JUICER_TABLE_ROLL_3, @TRAINING_ID);
INSERT INTO benefit_table_roll_allowance (benefit_table_roll_id, benefit_table_id) VALUES (@JUICER_TABLE_ROLL_3, @UNDERWORLD_BLACK_OPS_ID);

-- rolls 4 and 5 are any but magic or psionics. 
INSERT INTO benefit_table_roll_allowance (benefit_table_roll_id, benefit_table_id) VALUES (@JUICER_TABLE_ROLL_4, @BODY_ARMOR_ID);
INSERT INTO benefit_table_roll_allowance (benefit_table_roll_id, benefit_table_id) VALUES (@JUICER_TABLE_ROLL_4, @CCW_ID);
INSERT INTO benefit_table_roll_allowance (benefit_table_roll_id, benefit_table_id) VALUES (@JUICER_TABLE_ROLL_4, @CYBERNETICS_ID);
INSERT INTO benefit_table_roll_allowance (benefit_table_roll_id, benefit_table_id) VALUES (@JUICER_TABLE_ROLL_4, @EDUCATION_ID);
INSERT INTO benefit_table_roll_allowance (benefit_table_roll_id, benefit_table_id) VALUES (@JUICER_TABLE_ROLL_4, @ENCHANTED_ITEMS_MYSTIC_GADGETS_ID);
INSERT INTO benefit_table_roll_allowance (benefit_table_roll_id, benefit_table_id) VALUES (@JUICER_TABLE_ROLL_4, @EXPERIENCE_WISDOM_ID);
INSERT INTO benefit_table_roll_allowance (benefit_table_roll_id, benefit_table_id) VALUES (@JUICER_TABLE_ROLL_4, @RANGED_WEAPONS_ID);
INSERT INTO benefit_table_roll_allowance (benefit_table_roll_id, benefit_table_id) VALUES (@JUICER_TABLE_ROLL_4, @TRAINING_ID);
INSERT INTO benefit_table_roll_allowance (benefit_table_roll_id, benefit_table_id) VALUES (@JUICER_TABLE_ROLL_4, @UNDERWORLD_BLACK_OPS_ID);

INSERT INTO benefit_table_roll_allowance (benefit_table_roll_id, benefit_table_id) VALUES (@JUICER_TABLE_ROLL_5, @BODY_ARMOR_ID);
INSERT INTO benefit_table_roll_allowance (benefit_table_roll_id, benefit_table_id) VALUES (@JUICER_TABLE_ROLL_5, @CCW_ID);
INSERT INTO benefit_table_roll_allowance (benefit_table_roll_id, benefit_table_id) VALUES (@JUICER_TABLE_ROLL_5, @CYBERNETICS_ID);
INSERT INTO benefit_table_roll_allowance (benefit_table_roll_id, benefit_table_id) VALUES (@JUICER_TABLE_ROLL_5, @EDUCATION_ID);
INSERT INTO benefit_table_roll_allowance (benefit_table_roll_id, benefit_table_id) VALUES (@JUICER_TABLE_ROLL_5, @ENCHANTED_ITEMS_MYSTIC_GADGETS_ID);
INSERT INTO benefit_table_roll_allowance (benefit_table_roll_id, benefit_table_id) VALUES (@JUICER_TABLE_ROLL_5, @EXPERIENCE_WISDOM_ID);
INSERT INTO benefit_table_roll_allowance (benefit_table_roll_id, benefit_table_id) VALUES (@JUICER_TABLE_ROLL_5, @RANGED_WEAPONS_ID);
INSERT INTO benefit_table_roll_allowance (benefit_table_roll_id, benefit_table_id) VALUES (@JUICER_TABLE_ROLL_5, @TRAINING_ID);
INSERT INTO benefit_table_roll_allowance (benefit_table_roll_id, benefit_table_id) VALUES (@JUICER_TABLE_ROLL_5, @UNDERWORLD_BLACK_OPS_ID);


-- bursters get 4 rolls
-- Bursters gain three rolls on the Experience 
-- & Wisdom Table or the Psionics Table. 

-- Bursters gain one additional roll on any 
-- table except Cybernetics or anything 
-- to do with magic. 
INSERT INTO benefit_table_roll (roll_number, framework) VALUES (1, @BURSTER_ID);
SET @BURSTER_TABLE_ROLL_1 = LAST_INSERT_ID();
INSERT INTO benefit_table_roll (roll_number, framework) VALUES (2, @BURSTER_ID);
SET @BURSTER_TABLE_ROLL_2 = LAST_INSERT_ID();
INSERT INTO benefit_table_roll (roll_number, framework) VALUES (3, @BURSTER_ID);
SET @BURSTER_TABLE_ROLL_3 = LAST_INSERT_ID();
INSERT INTO benefit_table_roll (roll_number, framework) VALUES (4, @BURSTER_ID);
SET @BURSTER_TABLE_ROLL_4 = LAST_INSERT_ID();

-- rolls 1 2 and 3 are on Experience & Wisdom Table or the Psionics
INSERT INTO benefit_table_roll_allowance (benefit_table_roll_id, benefit_table_id) VALUES (@BURSTER_TABLE_ROLL_1, @EXPERIENCE_WISDOM_ID);
INSERT INTO benefit_table_roll_allowance (benefit_table_roll_id, benefit_table_id) VALUES (@BURSTER_TABLE_ROLL_1, @PSIONICS_ID);

INSERT INTO benefit_table_roll_allowance (benefit_table_roll_id, benefit_table_id) VALUES (@BURSTER_TABLE_ROLL_2, @EXPERIENCE_WISDOM_ID);
INSERT INTO benefit_table_roll_allowance (benefit_table_roll_id, benefit_table_id) VALUES (@BURSTER_TABLE_ROLL_2, @PSIONICS_ID);

INSERT INTO benefit_table_roll_allowance (benefit_table_roll_id, benefit_table_id) VALUES (@BURSTER_TABLE_ROLL_3, @EXPERIENCE_WISDOM_ID);
INSERT INTO benefit_table_roll_allowance (benefit_table_roll_id, benefit_table_id) VALUES (@BURSTER_TABLE_ROLL_3, @PSIONICS_ID);

-- roll 4 is anything except Cybernetics or anything to do with magic
INSERT INTO benefit_table_roll_allowance (benefit_table_roll_id, benefit_table_id) VALUES (@BURSTER_TABLE_ROLL_4, @BODY_ARMOR_ID);
INSERT INTO benefit_table_roll_allowance (benefit_table_roll_id, benefit_table_id) VALUES (@BURSTER_TABLE_ROLL_4, @CCW_ID);
INSERT INTO benefit_table_roll_allowance (benefit_table_roll_id, benefit_table_id) VALUES (@BURSTER_TABLE_ROLL_4, @ENCHANTED_ITEMS_MYSTIC_GADGETS_ID);
INSERT INTO benefit_table_roll_allowance (benefit_table_roll_id, benefit_table_id) VALUES (@BURSTER_TABLE_ROLL_4, @EDUCATION_ID);
INSERT INTO benefit_table_roll_allowance (benefit_table_roll_id, benefit_table_id) VALUES (@BURSTER_TABLE_ROLL_4, @EXPERIENCE_WISDOM_ID);
INSERT INTO benefit_table_roll_allowance (benefit_table_roll_id, benefit_table_id) VALUES (@BURSTER_TABLE_ROLL_4, @PSIONICS_ID);
INSERT INTO benefit_table_roll_allowance (benefit_table_roll_id, benefit_table_id) VALUES (@BURSTER_TABLE_ROLL_4, @RANGED_WEAPONS_ID);
INSERT INTO benefit_table_roll_allowance (benefit_table_roll_id, benefit_table_id) VALUES (@BURSTER_TABLE_ROLL_4, @TRAINING_ID);
INSERT INTO benefit_table_roll_allowance (benefit_table_roll_id, benefit_table_id) VALUES (@BURSTER_TABLE_ROLL_4, @UNDERWORLD_BLACK_OPS_ID);



-- mind melter 4 rolls
-- 3 on any of enchanted items, xp + wisdom, or psionics
-- one on anything except cybernetics or magic + mysticism
INSERT INTO benefit_table_roll (roll_number, framework) VALUES (1, @MIND_MELTER_ID);
SET @MIND_MELTER_TABLE_ROLL_1 = LAST_INSERT_ID();
INSERT INTO benefit_table_roll (roll_number, framework) VALUES (2, @MIND_MELTER_ID);
SET @MIND_MELTER_TABLE_ROLL_2 = LAST_INSERT_ID();
INSERT INTO benefit_table_roll (roll_number, framework) VALUES (3, @MIND_MELTER_ID);
SET @MIND_MELTER_TABLE_ROLL_3 = LAST_INSERT_ID();
INSERT INTO benefit_table_roll (roll_number, framework) VALUES (4, @MIND_MELTER_ID);
SET @MIND_MELTER_TABLE_ROLL_4 = LAST_INSERT_ID();

-- rolls 1, 2, 3 any of enchanted items, xp + wisdom, or psionics
INSERT INTO benefit_table_roll_allowance (benefit_table_roll_id, benefit_table_id) VALUES (@MIND_MELTER_TABLE_ROLL_1, @ENCHANTED_ITEMS_MYSTIC_GADGETS_ID);
INSERT INTO benefit_table_roll_allowance (benefit_table_roll_id, benefit_table_id) VALUES (@MIND_MELTER_TABLE_ROLL_1, @EXPERIENCE_WISDOM_ID);
INSERT INTO benefit_table_roll_allowance (benefit_table_roll_id, benefit_table_id) VALUES (@MIND_MELTER_TABLE_ROLL_1, @PSIONICS_ID);

INSERT INTO benefit_table_roll_allowance (benefit_table_roll_id, benefit_table_id) VALUES (@MIND_MELTER_TABLE_ROLL_2, @ENCHANTED_ITEMS_MYSTIC_GADGETS_ID);
INSERT INTO benefit_table_roll_allowance (benefit_table_roll_id, benefit_table_id) VALUES (@MIND_MELTER_TABLE_ROLL_2, @EXPERIENCE_WISDOM_ID);
INSERT INTO benefit_table_roll_allowance (benefit_table_roll_id, benefit_table_id) VALUES (@MIND_MELTER_TABLE_ROLL_2, @PSIONICS_ID);

INSERT INTO benefit_table_roll_allowance (benefit_table_roll_id, benefit_table_id) VALUES (@MIND_MELTER_TABLE_ROLL_3, @ENCHANTED_ITEMS_MYSTIC_GADGETS_ID);
INSERT INTO benefit_table_roll_allowance (benefit_table_roll_id, benefit_table_id) VALUES (@MIND_MELTER_TABLE_ROLL_3, @EXPERIENCE_WISDOM_ID);
INSERT INTO benefit_table_roll_allowance (benefit_table_roll_id, benefit_table_id) VALUES (@MIND_MELTER_TABLE_ROLL_3, @PSIONICS_ID);

-- roll 4 anything except cybernetics or magic + mysticism
INSERT INTO benefit_table_roll_allowance (benefit_table_roll_id, benefit_table_id) VALUES (@MIND_MELTER_TABLE_ROLL_4, @BODY_ARMOR_ID);
INSERT INTO benefit_table_roll_allowance (benefit_table_roll_id, benefit_table_id) VALUES (@MIND_MELTER_TABLE_ROLL_4, @CCW_ID);
INSERT INTO benefit_table_roll_allowance (benefit_table_roll_id, benefit_table_id) VALUES (@MIND_MELTER_TABLE_ROLL_4, @EDUCATION_ID);
INSERT INTO benefit_table_roll_allowance (benefit_table_roll_id, benefit_table_id) VALUES (@MIND_MELTER_TABLE_ROLL_4, @ENCHANTED_ITEMS_MYSTIC_GADGETS_ID);
INSERT INTO benefit_table_roll_allowance (benefit_table_roll_id, benefit_table_id) VALUES (@MIND_MELTER_TABLE_ROLL_4, @EXPERIENCE_WISDOM_ID);
INSERT INTO benefit_table_roll_allowance (benefit_table_roll_id, benefit_table_id) VALUES (@MIND_MELTER_TABLE_ROLL_4, @PSIONICS_ID);
INSERT INTO benefit_table_roll_allowance (benefit_table_roll_id, benefit_table_id) VALUES (@MIND_MELTER_TABLE_ROLL_4, @RANGED_WEAPONS_ID);
INSERT INTO benefit_table_roll_allowance (benefit_table_roll_id, benefit_table_id) VALUES (@MIND_MELTER_TABLE_ROLL_4, @TRAINING_ID);
INSERT INTO benefit_table_roll_allowance (benefit_table_roll_id, benefit_table_id) VALUES (@MIND_MELTER_TABLE_ROLL_4, @UNDERWORLD_BLACK_OPS_ID);

-- ley line walkers get 5 rolls
-- Walkers gain three rolls on any of the 
-- following tables: Enchanted Items & Mystic 
-- Gadgets, Education, Experience & Wisdom, 
-- and Magic & Mysticism. 

-- They also get two rolls on any table of 
-- their choice, except for Psionics. 
INSERT INTO benefit_table_roll (roll_number, framework) VALUES (1, @LEY_LINE_WALKER_ID);
SET @LEY_LINE_WALKER_TABLE_ROLL_1 = LAST_INSERT_ID();
INSERT INTO benefit_table_roll (roll_number, framework) VALUES (2, @LEY_LINE_WALKER_ID);
SET @LEY_LINE_WALKER_TABLE_ROLL_2 = LAST_INSERT_ID();
INSERT INTO benefit_table_roll (roll_number, framework) VALUES (3, @LEY_LINE_WALKER_ID);
SET @LEY_LINE_WALKER_TABLE_ROLL_3 = LAST_INSERT_ID();
INSERT INTO benefit_table_roll (roll_number, framework) VALUES (4, @LEY_LINE_WALKER_ID);
SET @LEY_LINE_WALKER_TABLE_ROLL_4 = LAST_INSERT_ID();
INSERT INTO benefit_table_roll (roll_number, framework) VALUES (5, @LEY_LINE_WALKER_ID);
SET @LEY_LINE_WALKER_TABLE_ROLL_5 = LAST_INSERT_ID();

-- rolls 1 2 3 any of Enchanted Items & Mystic Gadgets, Education, Experience & Wisdom, or Magic & Mysticism
INSERT INTO benefit_table_roll_allowance (benefit_table_roll_id, benefit_table_id) VALUES (@LEY_LINE_WALKER_TABLE_ROLL_1, @EDUCATION_ID);
INSERT INTO benefit_table_roll_allowance (benefit_table_roll_id, benefit_table_id) VALUES (@LEY_LINE_WALKER_TABLE_ROLL_1, @ENCHANTED_ITEMS_MYSTIC_GADGETS_ID);
INSERT INTO benefit_table_roll_allowance (benefit_table_roll_id, benefit_table_id) VALUES (@LEY_LINE_WALKER_TABLE_ROLL_1, @EXPERIENCE_WISDOM_ID);
INSERT INTO benefit_table_roll_allowance (benefit_table_roll_id, benefit_table_id) VALUES (@LEY_LINE_WALKER_TABLE_ROLL_1, @MAGIC_MYSTICISM_ID);

INSERT INTO benefit_table_roll_allowance (benefit_table_roll_id, benefit_table_id) VALUES (@LEY_LINE_WALKER_TABLE_ROLL_2, @EDUCATION_ID);
INSERT INTO benefit_table_roll_allowance (benefit_table_roll_id, benefit_table_id) VALUES (@LEY_LINE_WALKER_TABLE_ROLL_2, @ENCHANTED_ITEMS_MYSTIC_GADGETS_ID);
INSERT INTO benefit_table_roll_allowance (benefit_table_roll_id, benefit_table_id) VALUES (@LEY_LINE_WALKER_TABLE_ROLL_2, @EXPERIENCE_WISDOM_ID);
INSERT INTO benefit_table_roll_allowance (benefit_table_roll_id, benefit_table_id) VALUES (@LEY_LINE_WALKER_TABLE_ROLL_2, @MAGIC_MYSTICISM_ID);

INSERT INTO benefit_table_roll_allowance (benefit_table_roll_id, benefit_table_id) VALUES (@LEY_LINE_WALKER_TABLE_ROLL_3, @EDUCATION_ID);
INSERT INTO benefit_table_roll_allowance (benefit_table_roll_id, benefit_table_id) VALUES (@LEY_LINE_WALKER_TABLE_ROLL_3, @ENCHANTED_ITEMS_MYSTIC_GADGETS_ID);
INSERT INTO benefit_table_roll_allowance (benefit_table_roll_id, benefit_table_id) VALUES (@LEY_LINE_WALKER_TABLE_ROLL_3, @EXPERIENCE_WISDOM_ID);
INSERT INTO benefit_table_roll_allowance (benefit_table_roll_id, benefit_table_id) VALUES (@LEY_LINE_WALKER_TABLE_ROLL_3, @MAGIC_MYSTICISM_ID);

-- rolls 4 and 5 are any except for Psionics. 
INSERT INTO benefit_table_roll_allowance (benefit_table_roll_id, benefit_table_id) VALUES (@LEY_LINE_WALKER_TABLE_ROLL_4, @BODY_ARMOR_ID);
INSERT INTO benefit_table_roll_allowance (benefit_table_roll_id, benefit_table_id) VALUES (@LEY_LINE_WALKER_TABLE_ROLL_4, @CCW_ID);
INSERT INTO benefit_table_roll_allowance (benefit_table_roll_id, benefit_table_id) VALUES (@LEY_LINE_WALKER_TABLE_ROLL_4, @CYBERNETICS_ID);
INSERT INTO benefit_table_roll_allowance (benefit_table_roll_id, benefit_table_id) VALUES (@LEY_LINE_WALKER_TABLE_ROLL_4, @EDUCATION_ID);
INSERT INTO benefit_table_roll_allowance (benefit_table_roll_id, benefit_table_id) VALUES (@LEY_LINE_WALKER_TABLE_ROLL_4, @ENCHANTED_ITEMS_MYSTIC_GADGETS_ID);
INSERT INTO benefit_table_roll_allowance (benefit_table_roll_id, benefit_table_id) VALUES (@LEY_LINE_WALKER_TABLE_ROLL_4, @EXPERIENCE_WISDOM_ID);
INSERT INTO benefit_table_roll_allowance (benefit_table_roll_id, benefit_table_id) VALUES (@LEY_LINE_WALKER_TABLE_ROLL_4, @MAGIC_MYSTICISM_ID);
INSERT INTO benefit_table_roll_allowance (benefit_table_roll_id, benefit_table_id) VALUES (@LEY_LINE_WALKER_TABLE_ROLL_4, @RANGED_WEAPONS_ID);
INSERT INTO benefit_table_roll_allowance (benefit_table_roll_id, benefit_table_id) VALUES (@LEY_LINE_WALKER_TABLE_ROLL_4, @TRAINING_ID);
INSERT INTO benefit_table_roll_allowance (benefit_table_roll_id, benefit_table_id) VALUES (@LEY_LINE_WALKER_TABLE_ROLL_4, @UNDERWORLD_BLACK_OPS_ID);

INSERT INTO benefit_table_roll_allowance (benefit_table_roll_id, benefit_table_id) VALUES (@LEY_LINE_WALKER_TABLE_ROLL_5, @BODY_ARMOR_ID);
INSERT INTO benefit_table_roll_allowance (benefit_table_roll_id, benefit_table_id) VALUES (@LEY_LINE_WALKER_TABLE_ROLL_5, @CCW_ID);
INSERT INTO benefit_table_roll_allowance (benefit_table_roll_id, benefit_table_id) VALUES (@LEY_LINE_WALKER_TABLE_ROLL_5, @CYBERNETICS_ID);
INSERT INTO benefit_table_roll_allowance (benefit_table_roll_id, benefit_table_id) VALUES (@LEY_LINE_WALKER_TABLE_ROLL_5, @EDUCATION_ID);
INSERT INTO benefit_table_roll_allowance (benefit_table_roll_id, benefit_table_id) VALUES (@LEY_LINE_WALKER_TABLE_ROLL_5, @ENCHANTED_ITEMS_MYSTIC_GADGETS_ID);
INSERT INTO benefit_table_roll_allowance (benefit_table_roll_id, benefit_table_id) VALUES (@LEY_LINE_WALKER_TABLE_ROLL_5, @EXPERIENCE_WISDOM_ID);
INSERT INTO benefit_table_roll_allowance (benefit_table_roll_id, benefit_table_id) VALUES (@LEY_LINE_WALKER_TABLE_ROLL_5, @MAGIC_MYSTICISM_ID);
INSERT INTO benefit_table_roll_allowance (benefit_table_roll_id, benefit_table_id) VALUES (@LEY_LINE_WALKER_TABLE_ROLL_5, @RANGED_WEAPONS_ID);
INSERT INTO benefit_table_roll_allowance (benefit_table_roll_id, benefit_table_id) VALUES (@LEY_LINE_WALKER_TABLE_ROLL_5, @TRAINING_ID);
INSERT INTO benefit_table_roll_allowance (benefit_table_roll_id, benefit_table_id) VALUES (@LEY_LINE_WALKER_TABLE_ROLL_5, @UNDERWORLD_BLACK_OPS_ID);

-- mystic 5 rolls
-- 3 on enchanted items, xp + wisdom, or magic + mysticism
-- 2 on any except cybernetics
INSERT INTO benefit_table_roll (roll_number, framework) VALUES (1, @MYSTIC_ID);
SET @MYSTIC_TABLE_ROLL_1 = LAST_INSERT_ID();
INSERT INTO benefit_table_roll (roll_number, framework) VALUES (2, @MYSTIC_ID);
SET @MYSTIC_TABLE_ROLL_2 = LAST_INSERT_ID();
INSERT INTO benefit_table_roll (roll_number, framework) VALUES (3, @MYSTIC_ID);
SET @MYSTIC_TABLE_ROLL_3 = LAST_INSERT_ID();
INSERT INTO benefit_table_roll (roll_number, framework) VALUES (4, @MYSTIC_ID);
SET @MYSTIC_TABLE_ROLL_4 = LAST_INSERT_ID();
INSERT INTO benefit_table_roll (roll_number, framework) VALUES (5, @MYSTIC_ID);
SET @MYSTIC_TABLE_ROLL_5 = LAST_INSERT_ID();

-- rolls 1, 2, 3 any of enchanted items, xp + wisdom, or magic + mysticism
INSERT INTO benefit_table_roll_allowance (benefit_table_roll_id, benefit_table_id) VALUES (@MYSTIC_TABLE_ROLL_1, @ENCHANTED_ITEMS_MYSTIC_GADGETS_ID);
INSERT INTO benefit_table_roll_allowance (benefit_table_roll_id, benefit_table_id) VALUES (@MYSTIC_TABLE_ROLL_1, @EXPERIENCE_WISDOM_ID);
INSERT INTO benefit_table_roll_allowance (benefit_table_roll_id, benefit_table_id) VALUES (@MYSTIC_TABLE_ROLL_1, @MAGIC_MYSTICISM_ID);

INSERT INTO benefit_table_roll_allowance (benefit_table_roll_id, benefit_table_id) VALUES (@MYSTIC_TABLE_ROLL_2, @ENCHANTED_ITEMS_MYSTIC_GADGETS_ID);
INSERT INTO benefit_table_roll_allowance (benefit_table_roll_id, benefit_table_id) VALUES (@MYSTIC_TABLE_ROLL_2, @EXPERIENCE_WISDOM_ID);
INSERT INTO benefit_table_roll_allowance (benefit_table_roll_id, benefit_table_id) VALUES (@MYSTIC_TABLE_ROLL_2, @MAGIC_MYSTICISM_ID);

INSERT INTO benefit_table_roll_allowance (benefit_table_roll_id, benefit_table_id) VALUES (@MYSTIC_TABLE_ROLL_3, @ENCHANTED_ITEMS_MYSTIC_GADGETS_ID);
INSERT INTO benefit_table_roll_allowance (benefit_table_roll_id, benefit_table_id) VALUES (@MYSTIC_TABLE_ROLL_3, @EXPERIENCE_WISDOM_ID);
INSERT INTO benefit_table_roll_allowance (benefit_table_roll_id, benefit_table_id) VALUES (@MYSTIC_TABLE_ROLL_3, @MAGIC_MYSTICISM_ID);

-- rolls 4, 5 any except cybernetics
INSERT INTO benefit_table_roll_allowance (benefit_table_roll_id, benefit_table_id) VALUES (@MYSTIC_TABLE_ROLL_4, @BODY_ARMOR_ID);
INSERT INTO benefit_table_roll_allowance (benefit_table_roll_id, benefit_table_id) VALUES (@MYSTIC_TABLE_ROLL_4, @CCW_ID);
INSERT INTO benefit_table_roll_allowance (benefit_table_roll_id, benefit_table_id) VALUES (@MYSTIC_TABLE_ROLL_4, @EDUCATION_ID);
INSERT INTO benefit_table_roll_allowance (benefit_table_roll_id, benefit_table_id) VALUES (@MYSTIC_TABLE_ROLL_4, @ENCHANTED_ITEMS_MYSTIC_GADGETS_ID);
INSERT INTO benefit_table_roll_allowance (benefit_table_roll_id, benefit_table_id) VALUES (@MYSTIC_TABLE_ROLL_4, @EXPERIENCE_WISDOM_ID);
INSERT INTO benefit_table_roll_allowance (benefit_table_roll_id, benefit_table_id) VALUES (@MYSTIC_TABLE_ROLL_4, @MAGIC_MYSTICISM_ID);
INSERT INTO benefit_table_roll_allowance (benefit_table_roll_id, benefit_table_id) VALUES (@MYSTIC_TABLE_ROLL_4, @PSIONICS_ID);
INSERT INTO benefit_table_roll_allowance (benefit_table_roll_id, benefit_table_id) VALUES (@MYSTIC_TABLE_ROLL_4, @RANGED_WEAPONS_ID);
INSERT INTO benefit_table_roll_allowance (benefit_table_roll_id, benefit_table_id) VALUES (@MYSTIC_TABLE_ROLL_4, @TRAINING_ID);
INSERT INTO benefit_table_roll_allowance (benefit_table_roll_id, benefit_table_id) VALUES (@MYSTIC_TABLE_ROLL_4, @UNDERWORLD_BLACK_OPS_ID);

INSERT INTO benefit_table_roll_allowance (benefit_table_roll_id, benefit_table_id) VALUES (@MYSTIC_TABLE_ROLL_5, @BODY_ARMOR_ID);
INSERT INTO benefit_table_roll_allowance (benefit_table_roll_id, benefit_table_id) VALUES (@MYSTIC_TABLE_ROLL_5, @CCW_ID);
INSERT INTO benefit_table_roll_allowance (benefit_table_roll_id, benefit_table_id) VALUES (@MYSTIC_TABLE_ROLL_5, @EDUCATION_ID);
INSERT INTO benefit_table_roll_allowance (benefit_table_roll_id, benefit_table_id) VALUES (@MYSTIC_TABLE_ROLL_5, @ENCHANTED_ITEMS_MYSTIC_GADGETS_ID);
INSERT INTO benefit_table_roll_allowance (benefit_table_roll_id, benefit_table_id) VALUES (@MYSTIC_TABLE_ROLL_5, @EXPERIENCE_WISDOM_ID);
INSERT INTO benefit_table_roll_allowance (benefit_table_roll_id, benefit_table_id) VALUES (@MYSTIC_TABLE_ROLL_5, @MAGIC_MYSTICISM_ID);
INSERT INTO benefit_table_roll_allowance (benefit_table_roll_id, benefit_table_id) VALUES (@MYSTIC_TABLE_ROLL_5, @PSIONICS_ID);
INSERT INTO benefit_table_roll_allowance (benefit_table_roll_id, benefit_table_id) VALUES (@MYSTIC_TABLE_ROLL_5, @RANGED_WEAPONS_ID);
INSERT INTO benefit_table_roll_allowance (benefit_table_roll_id, benefit_table_id) VALUES (@MYSTIC_TABLE_ROLL_5, @TRAINING_ID);
INSERT INTO benefit_table_roll_allowance (benefit_table_roll_id, benefit_table_id) VALUES (@MYSTIC_TABLE_ROLL_5, @UNDERWORLD_BLACK_OPS_ID);


-- techno wizard gets 5 rolls
-- Techno-Wizards gain three rolls 
-- on the following tables: Education, 
-- Enchanted Items & Mystic Gadgets, and 
-- Magic & Mysticism. 

-- Techno-Wizards gain two rolls on any 
-- table except Psionics. 
INSERT INTO benefit_table_roll (roll_number, framework) VALUES (1, @TECHNO_WIZARD_ID);
SET @TECHNO_WIZARD_TABLE_ROLL_1 = LAST_INSERT_ID();
INSERT INTO benefit_table_roll (roll_number, framework) VALUES (2, @TECHNO_WIZARD_ID);
SET @TECHNO_WIZARD_TABLE_ROLL_2 = LAST_INSERT_ID();
INSERT INTO benefit_table_roll (roll_number, framework) VALUES (3, @TECHNO_WIZARD_ID);
SET @TECHNO_WIZARD_TABLE_ROLL_3 = LAST_INSERT_ID();
INSERT INTO benefit_table_roll (roll_number, framework) VALUES (4, @TECHNO_WIZARD_ID);
SET @TECHNO_WIZARD_TABLE_ROLL_4 = LAST_INSERT_ID();
INSERT INTO benefit_table_roll (roll_number, framework) VALUES (5, @TECHNO_WIZARD_ID);
SET @TECHNO_WIZARD_TABLE_ROLL_5 = LAST_INSERT_ID();

-- rolls 1 2 3 any of Education, Enchanted Items & Mystic Gadgets, and Magic & Mysticism. 
INSERT INTO benefit_table_roll_allowance (benefit_table_roll_id, benefit_table_id) VALUES (@TECHNO_WIZARD_TABLE_ROLL_1, @EDUCATION_ID);
INSERT INTO benefit_table_roll_allowance (benefit_table_roll_id, benefit_table_id) VALUES (@TECHNO_WIZARD_TABLE_ROLL_1, @ENCHANTED_ITEMS_MYSTIC_GADGETS_ID);
INSERT INTO benefit_table_roll_allowance (benefit_table_roll_id, benefit_table_id) VALUES (@TECHNO_WIZARD_TABLE_ROLL_1, @MAGIC_MYSTICISM_ID);

INSERT INTO benefit_table_roll_allowance (benefit_table_roll_id, benefit_table_id) VALUES (@TECHNO_WIZARD_TABLE_ROLL_2, @EDUCATION_ID);
INSERT INTO benefit_table_roll_allowance (benefit_table_roll_id, benefit_table_id) VALUES (@TECHNO_WIZARD_TABLE_ROLL_2, @ENCHANTED_ITEMS_MYSTIC_GADGETS_ID);
INSERT INTO benefit_table_roll_allowance (benefit_table_roll_id, benefit_table_id) VALUES (@TECHNO_WIZARD_TABLE_ROLL_2, @MAGIC_MYSTICISM_ID);

INSERT INTO benefit_table_roll_allowance (benefit_table_roll_id, benefit_table_id) VALUES (@TECHNO_WIZARD_TABLE_ROLL_3, @EDUCATION_ID);
INSERT INTO benefit_table_roll_allowance (benefit_table_roll_id, benefit_table_id) VALUES (@TECHNO_WIZARD_TABLE_ROLL_3, @ENCHANTED_ITEMS_MYSTIC_GADGETS_ID);
INSERT INTO benefit_table_roll_allowance (benefit_table_roll_id, benefit_table_id) VALUES (@TECHNO_WIZARD_TABLE_ROLL_3, @MAGIC_MYSTICISM_ID);

-- rolls 4 and 5 on any except Psionics
INSERT INTO benefit_table_roll_allowance (benefit_table_roll_id, benefit_table_id) VALUES (@TECHNO_WIZARD_TABLE_ROLL_4, @BODY_ARMOR_ID);
INSERT INTO benefit_table_roll_allowance (benefit_table_roll_id, benefit_table_id) VALUES (@TECHNO_WIZARD_TABLE_ROLL_4, @CCW_ID);
INSERT INTO benefit_table_roll_allowance (benefit_table_roll_id, benefit_table_id) VALUES (@TECHNO_WIZARD_TABLE_ROLL_4, @CYBERNETICS_ID);
INSERT INTO benefit_table_roll_allowance (benefit_table_roll_id, benefit_table_id) VALUES (@TECHNO_WIZARD_TABLE_ROLL_4, @EDUCATION_ID);
INSERT INTO benefit_table_roll_allowance (benefit_table_roll_id, benefit_table_id) VALUES (@TECHNO_WIZARD_TABLE_ROLL_4, @ENCHANTED_ITEMS_MYSTIC_GADGETS_ID);
INSERT INTO benefit_table_roll_allowance (benefit_table_roll_id, benefit_table_id) VALUES (@TECHNO_WIZARD_TABLE_ROLL_4, @EXPERIENCE_WISDOM_ID);
INSERT INTO benefit_table_roll_allowance (benefit_table_roll_id, benefit_table_id) VALUES (@TECHNO_WIZARD_TABLE_ROLL_4, @MAGIC_MYSTICISM_ID);
INSERT INTO benefit_table_roll_allowance (benefit_table_roll_id, benefit_table_id) VALUES (@TECHNO_WIZARD_TABLE_ROLL_4, @RANGED_WEAPONS_ID);
INSERT INTO benefit_table_roll_allowance (benefit_table_roll_id, benefit_table_id) VALUES (@TECHNO_WIZARD_TABLE_ROLL_4, @TRAINING_ID);
INSERT INTO benefit_table_roll_allowance (benefit_table_roll_id, benefit_table_id) VALUES (@TECHNO_WIZARD_TABLE_ROLL_4, @UNDERWORLD_BLACK_OPS_ID);

INSERT INTO benefit_table_roll_allowance (benefit_table_roll_id, benefit_table_id) VALUES (@TECHNO_WIZARD_TABLE_ROLL_5, @BODY_ARMOR_ID);
INSERT INTO benefit_table_roll_allowance (benefit_table_roll_id, benefit_table_id) VALUES (@TECHNO_WIZARD_TABLE_ROLL_5, @CCW_ID);
INSERT INTO benefit_table_roll_allowance (benefit_table_roll_id, benefit_table_id) VALUES (@TECHNO_WIZARD_TABLE_ROLL_5, @CYBERNETICS_ID);
INSERT INTO benefit_table_roll_allowance (benefit_table_roll_id, benefit_table_id) VALUES (@TECHNO_WIZARD_TABLE_ROLL_5, @EDUCATION_ID);
INSERT INTO benefit_table_roll_allowance (benefit_table_roll_id, benefit_table_id) VALUES (@TECHNO_WIZARD_TABLE_ROLL_5, @ENCHANTED_ITEMS_MYSTIC_GADGETS_ID);
INSERT INTO benefit_table_roll_allowance (benefit_table_roll_id, benefit_table_id) VALUES (@TECHNO_WIZARD_TABLE_ROLL_5, @EXPERIENCE_WISDOM_ID);
INSERT INTO benefit_table_roll_allowance (benefit_table_roll_id, benefit_table_id) VALUES (@TECHNO_WIZARD_TABLE_ROLL_5, @MAGIC_MYSTICISM_ID);
INSERT INTO benefit_table_roll_allowance (benefit_table_roll_id, benefit_table_id) VALUES (@TECHNO_WIZARD_TABLE_ROLL_5, @RANGED_WEAPONS_ID);
INSERT INTO benefit_table_roll_allowance (benefit_table_roll_id, benefit_table_id) VALUES (@TECHNO_WIZARD_TABLE_ROLL_5, @TRAINING_ID);
INSERT INTO benefit_table_roll_allowance (benefit_table_roll_id, benefit_table_id) VALUES (@TECHNO_WIZARD_TABLE_ROLL_5, @UNDERWORLD_BLACK_OPS_ID);

-- dragon 2 rolls
-- both rolls are any of education, psionics, training
INSERT INTO benefit_table_roll (roll_number, framework) VALUES (1, @DRAGON_ID);
SET @DRAGON_TABLE_ROLL_1 = LAST_INSERT_ID();
INSERT INTO benefit_table_roll (roll_number, framework) VALUES (2, @DRAGON_ID);
SET @DRAGON_TABLE_ROLL_2 = LAST_INSERT_ID();

-- rolls 1 and 2 are any of education, psionics, training
INSERT INTO benefit_table_roll_allowance (benefit_table_roll_id, benefit_table_id) VALUES (@DRAGON_TABLE_ROLL_1, @EDUCATION_ID);
INSERT INTO benefit_table_roll_allowance (benefit_table_roll_id, benefit_table_id) VALUES (@DRAGON_TABLE_ROLL_1, @PSIONICS_ID);
INSERT INTO benefit_table_roll_allowance (benefit_table_roll_id, benefit_table_id) VALUES (@DRAGON_TABLE_ROLL_1, @TRAINING_ID);

INSERT INTO benefit_table_roll_allowance (benefit_table_roll_id, benefit_table_id) VALUES (@DRAGON_TABLE_ROLL_2, @EDUCATION_ID);
INSERT INTO benefit_table_roll_allowance (benefit_table_roll_id, benefit_table_id) VALUES (@DRAGON_TABLE_ROLL_2, @PSIONICS_ID);
INSERT INTO benefit_table_roll_allowance (benefit_table_roll_id, benefit_table_id) VALUES (@DRAGON_TABLE_ROLL_2, @TRAINING_ID);



INSERT INTO `sql_files` (`sql_file_name`, `run_date`) VALUES ('16.sql', NOW());
