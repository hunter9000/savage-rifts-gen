
USE `savage_rifts`;

ALTER TABLE `edge` ADD COLUMN `edge_type` VARCHAR(255) NOT NULL;
ALTER TABLE `edge` ADD COLUMN `edge_category_type` VARCHAR(255) NOT NULL;
ALTER TABLE `edge` ADD COLUMN `description` VARCHAR(2000) NOT NULL;

CREATE TABLE `attribute_raise_selection` (
	`id` BIGINT(20) NOT NULL AUTO_INCREMENT,
	`attribute_type` INT(11) NOT NULL,
	`sheet` BIGINT(20) NOT NULL,
	PRIMARY KEY (`id`),
	INDEX `FK_1tl3p8sl147kfgpq3gjudfmoy` (`sheet`),
	CONSTRAINT `FK_1tl3p8sl147kfgpq3gjudfmoy` FOREIGN KEY (`sheet`) REFERENCES `sheet` (`id`)
) COLLATE='utf8_general_ci' ENGINE=InnoDB;

CREATE TABLE `edge_selection` (
	`id` BIGINT(20) NOT NULL AUTO_INCREMENT,
	`edge` BIGINT(20) NOT NULL,
	`sheet` BIGINT(20) NOT NULL,
	PRIMARY KEY (`id`),
	INDEX `FK_crg8t6bbo6da7l5x0hsgm5fl8` (`edge`),
	INDEX `FK_e2troen9tsd32ybuhg2qupqpg` (`sheet`),
	CONSTRAINT `FK_crg8t6bbo6da7l5x0hsgm5fl8` FOREIGN KEY (`edge`) REFERENCES `edge` (`id`),
	CONSTRAINT `FK_e2troen9tsd32ybuhg2qupqpg` FOREIGN KEY (`sheet`) REFERENCES `sheet` (`id`)
) COLLATE='utf8_general_ci' ENGINE=InnoDB;

CREATE TABLE `money_raise_selection` (
	`id` BIGINT(20) NOT NULL AUTO_INCREMENT,
	`sheet` BIGINT(20) NOT NULL,
	PRIMARY KEY (`id`),
	INDEX `FK_oxk0x7yu138830y4jr64x6n2k` (`sheet`),
	CONSTRAINT `FK_oxk0x7yu138830y4jr64x6n2k` FOREIGN KEY (`sheet`) REFERENCES `sheet` (`id`)
) COLLATE='utf8_general_ci' ENGINE=InnoDB;

CREATE TABLE `skill_raise_selection` (
	`id` BIGINT(20) NOT NULL AUTO_INCREMENT,
	`skill` INT(11) NOT NULL,
	`sheet` BIGINT(20) NOT NULL,
	PRIMARY KEY (`id`),
	INDEX `FK_9cv26g5qve03sf8kxmwraa5t7` (`sheet`),
	CONSTRAINT `FK_9cv26g5qve03sf8kxmwraa5t7` FOREIGN KEY (`sheet`) REFERENCES `sheet` (`id`)
) COLLATE='utf8_general_ci' ENGINE=InnoDB;

-- add prerequisite tables for edges
ALTER TABLE `edge` 
	ADD COLUMN `attribute_prerequisite_logic_type` VARCHAR(255) NOT NULL,
	ADD COLUMN `skill_prerequisite_logic_type` VARCHAR(255) NOT NULL,
	ADD COLUMN `edge_prerequisite_logic_type` VARCHAR(255) NOT NULL,
	MODIFY COLUMN `xp_level_type` VARCHAR(255) NOT NULL,
	DROP COLUMN `required_attribute`;

CREATE TABLE `edge_attribute_prerequisite` (
	`id` BIGINT(20) NOT NULL AUTO_INCREMENT,
	`edge` BIGINT(20) NOT NULL,
	`attribute_type`  VARCHAR(255) NOT NULL,
	`die_type` VARCHAR(255) NOT NULL,
	PRIMARY KEY (`id`),
	INDEX `FK_edge_attribute_prerequisite__edge` (`edge`),
	CONSTRAINT `FK_edge_attribute_prerequisite__edge` FOREIGN KEY (`edge`) REFERENCES `edge` (`id`)
) COLLATE='utf8_general_ci' ENGINE=InnoDB;
	
CREATE TABLE `edge_skill_prerequisite` (
	`id` BIGINT(20) NOT NULL AUTO_INCREMENT,
	`edge` BIGINT(20) NOT NULL,
	`skill_type`  VARCHAR(255) NOT NULL,
	`die_type` VARCHAR(255) NOT NULL,
	PRIMARY KEY (`id`),
	INDEX `FK_edge_skill_prerequisite__edge` (`edge`),
	CONSTRAINT `FK_edge_skill_prerequisite__edge` FOREIGN KEY (`edge`) REFERENCES `edge` (`id`)
) COLLATE='utf8_general_ci' ENGINE=InnoDB;

-- add PK for edge prereqs and framework prereqs
ALTER TABLE `edge_prerequisites` ADD COLUMN id BIGINT(20) NOT NULL AUTO_INCREMENT PRIMARY KEY;
ALTER TABLE `edge_required_framework` ADD COLUMN id BIGINT(20) NOT NULL AUTO_INCREMENT PRIMARY KEY;


-- INSERT INTO `edge` (`edge_type`, `edge_category_type`, `description`, `xp_level_type`, 
					-- `attribute_prerequisite_logic_type`, `skill_prerequisite_logic_type`, `edge_prerequisite_logic_type`) 
	-- VALUES ('type', 'cattype', 'desc', 'NOVICE', 'AND', 'AND', 'AND');
-- SET @<edge_type>_ID = LAST_INSERT_ID();

-- insert into 
-- `edge_prerequisites`
-- `edge_required_framework`
-- `edge_attribute_prerequisite`
-- `edge_skill_prerequisite`

-- INSERT EDGES
INSERT INTO `edge` (edge_type, edge_category_type, xp_level_type, description, attribute_prerequisite_logic_type, skill_prerequisite_logic_type, edge_prerequisite_logic_type) VALUES ('ALERTNESS', 'BACKGROUND', 'NOVICE', 'Not much gets by your hero. He’s very observant and perceptive, and adds +2 to his Notice rolls to hear, see, or otherwise sense the world around him.', 'OR', 'OR', 'OR');
SET @ALERTNESS_ID = LAST_INSERT_ID();
INSERT INTO `edge` (edge_type, edge_category_type, xp_level_type, description, attribute_prerequisite_logic_type, skill_prerequisite_logic_type, edge_prerequisite_logic_type) VALUES ('AMBIDEXTROUS', 'BACKGROUND', 'NOVICE', 'Your hero is as deft with his left hand as he is with his right. Characters normally suffer a –2 penalty when performing physical tasks with the off-hand (characters are assumed to be right-handed). With this Edge, your warrior ignores the –2 penalty for using his off-hand (see page 75).', 'OR', 'OR', 'OR');
SET @AMBIDEXTROUS_ID = LAST_INSERT_ID();
INSERT INTO `edge` (edge_type, edge_category_type, xp_level_type, description, attribute_prerequisite_logic_type, skill_prerequisite_logic_type, edge_prerequisite_logic_type) VALUES ('ARCANE_BACKGROUND_MAGIC', 'BACKGROUND', 'NOVICE', 'This is the Edge your character must purchase to have any sort of magical, psionic, or other supernatural ability. See Chapter Five for a complete description of Arcane Backgrounds.', 'OR', 'OR', 'OR');
SET @ARCANE_BACKGROUND_MAGIC_ID = LAST_INSERT_ID();
INSERT INTO `edge` (edge_type, edge_category_type, xp_level_type, description, attribute_prerequisite_logic_type, skill_prerequisite_logic_type, edge_prerequisite_logic_type) VALUES ('ARCANE_BACKGROUND_PSIONICS', 'BACKGROUND', 'NOVICE', 'This is the Edge your character must purchase to have any sort of magical, psionic, or other supernatural ability. See Chapter Five for a complete description of Arcane Backgrounds.', 'OR', 'OR', 'OR');
SET @ARCANE_BACKGROUND_PSIONICS_ID = LAST_INSERT_ID();
INSERT INTO `edge` (edge_type, edge_category_type, xp_level_type, description, attribute_prerequisite_logic_type, skill_prerequisite_logic_type, edge_prerequisite_logic_type) VALUES ('ARCANE_BACKGROUND_MIRACLES', 'BACKGROUND', 'NOVICE', 'This is the Edge your character must purchase to have any sort of magical, psionic, or other supernatural ability. See Chapter Five for a complete description of Arcane Backgrounds.', 'OR', 'OR', 'OR');
SET @ARCANE_BACKGROUND_MIRACLES_ID = LAST_INSERT_ID();
INSERT INTO `edge` (edge_type, edge_category_type, xp_level_type, description, attribute_prerequisite_logic_type, skill_prerequisite_logic_type, edge_prerequisite_logic_type) VALUES ('ARCANE_BACKGROUND_SUPER_POWERS', 'BACKGROUND', 'NOVICE', 'This is the Edge your character must purchase to have any sort of magical, psionic, or other supernatural ability. See Chapter Five for a complete description of Arcane Backgrounds.', 'OR', 'OR', 'OR');
SET @ARCANE_BACKGROUND_SUPER_POWERS_ID = LAST_INSERT_ID();
INSERT INTO `edge` (edge_type, edge_category_type, xp_level_type, description, attribute_prerequisite_logic_type, skill_prerequisite_logic_type, edge_prerequisite_logic_type) VALUES ('ARCANE_BACKGROUND_WEIRD_SCIENCE', 'BACKGROUND', 'NOVICE', 'This is the Edge your character must purchase to have any sort of magical, psionic, or other supernatural ability. See Chapter Five for a complete description of Arcane Backgrounds.', 'OR', 'OR', 'OR');
SET @ARCANE_BACKGROUND_WEIRD_SCIENCE_ID = LAST_INSERT_ID();
INSERT INTO `edge` (edge_type, edge_category_type, xp_level_type, description, attribute_prerequisite_logic_type, skill_prerequisite_logic_type, edge_prerequisite_logic_type) VALUES ('ARCANE_RESISTANCE', 'BACKGROUND', 'NOVICE', 'This individual is particularly resistant to magic (including psionics, weird science, etc.), whether by nature or by heritage. He acts as if he had 2 points of Armor when hit by damage-causing arcane powers, and adds +2 to his Trait rolls when resisting opposed powers. Even friendly arcane powers must subtract this modifier to affect the resistant hero.', 'OR', 'OR', 'OR');
SET @ARCANE_RESISTANCE_ID = LAST_INSERT_ID();
INSERT INTO `edge` (edge_type, edge_category_type, xp_level_type, description, attribute_prerequisite_logic_type, skill_prerequisite_logic_type, edge_prerequisite_logic_type) VALUES ('IMPROVED_ARCANE_RESISTANCE', 'BACKGROUND', 'NOVICE', 'As above but Armor and resistance are increased to 4.', 'OR', 'OR', 'OR');
SET @IMPROVED_ARCANE_RESISTANCE_ID = LAST_INSERT_ID();
INSERT INTO `edge` (edge_type, edge_category_type, xp_level_type, description, attribute_prerequisite_logic_type, skill_prerequisite_logic_type, edge_prerequisite_logic_type) VALUES ('ATTRACTIVE', 'BACKGROUND', 'NOVICE', 'It’s no secret that beautiful people have an easier time getting their way in life. This Edge grants your beautiful or handsome character +2 to Charisma.', 'OR', 'OR', 'OR');
SET @ATTRACTIVE_ID = LAST_INSERT_ID();
INSERT INTO `edge` (edge_type, edge_category_type, xp_level_type, description, attribute_prerequisite_logic_type, skill_prerequisite_logic_type, edge_prerequisite_logic_type) VALUES ('VERY_ATTRACTIVE', 'BACKGROUND', 'NOVICE', 'Your hero is drop-dead gorgeous. His Charisma is increased to +4.', 'OR', 'OR', 'OR');
SET @VERY_ATTRACTIVE_ID = LAST_INSERT_ID();
INSERT INTO `edge` (edge_type, edge_category_type, xp_level_type, description, attribute_prerequisite_logic_type, skill_prerequisite_logic_type, edge_prerequisite_logic_type) VALUES ('BERSERK', 'BACKGROUND', 'NOVICE', 'Immediately after suffering a wound (including a Shaken result from physical damage), your hero must make a Smarts roll or go Berserk. While Berserk, his Parry is reduced by 2 but he adds +2 to all Fighting, Strength, melee damage rolls, and Toughness. The warrior ignores all wound modifiers while Berserk, but cannot use any skills, Edges, or maneuvers that require concentration, including Shooting and Taunt, but not Intimidation. Berserkers attack with reckless abandon. Anytime his Fighting die is a 1 (regardless of his Wild Die), he hits a random adjacent target (not the original target). The attack may hit friend as well as foe. If there are no other adjacent targets, the blow simply misses. The Berserker may end his rage by doing nothing (not even moving) for one full action and making a Smarts roll at –2.', 'OR', 'OR', 'OR');
SET @BERSERK_ID = LAST_INSERT_ID();
INSERT INTO `edge` (edge_type, edge_category_type, xp_level_type, description, attribute_prerequisite_logic_type, skill_prerequisite_logic_type, edge_prerequisite_logic_type) VALUES ('BRAVE', 'BACKGROUND', 'NOVICE', 'Those with this Edge have learned to master their fear. Or perhaps are so jaded or emotionally distant they’ve just lost their normal “fight or flight” responses. Either way, your hero adds +2 to Fear tests. If the character is in a setting that uses Guts as a Setting Rule, it adds to that as well.', 'OR', 'OR', 'OR');
SET @BRAVE_ID = LAST_INSERT_ID();
INSERT INTO `edge` (edge_type, edge_category_type, xp_level_type, description, attribute_prerequisite_logic_type, skill_prerequisite_logic_type, edge_prerequisite_logic_type) VALUES ('BRAWNY', 'BACKGROUND', 'NOVICE', 'Your bruiser is very large or perhaps just very fit. His bulk resists damage better than most and adds +1 to his Toughness. In addition, the character can carry more than most proportional to his Strength. He can carry 8 times his Strength in pounds without penalty instead of the usual 5 times his Strength.', 'AND', 'OR', 'OR');
SET @BRAWNY_ID = LAST_INSERT_ID();
INSERT INTO `edge` (edge_type, edge_category_type, xp_level_type, description, attribute_prerequisite_logic_type, skill_prerequisite_logic_type, edge_prerequisite_logic_type) VALUES ('FAST_HEALER', 'BACKGROUND', 'NOVICE', 'Some individuals just seem to heal faster than others. Those with this blessing add +2 to Vigor rolls when checking for natural healing. See page 78 for complete rules on Healing. ', 'OR', 'OR', 'OR');
SET @FAST_HEALER_ID = LAST_INSERT_ID();
INSERT INTO `edge` (edge_type, edge_category_type, xp_level_type, description, attribute_prerequisite_logic_type, skill_prerequisite_logic_type, edge_prerequisite_logic_type) VALUES ('FLEET_FOOTED', 'BACKGROUND', 'NOVICE', 'The hero’s Pace is increased by +2 and he rolls a d10 instead of a d6 when running.', 'OR', 'OR', 'OR');
SET @FLEET_FOOTED_ID = LAST_INSERT_ID();
INSERT INTO `edge` (edge_type, edge_category_type, xp_level_type, description, attribute_prerequisite_logic_type, skill_prerequisite_logic_type, edge_prerequisite_logic_type) VALUES ('LINGUIST', 'BACKGROUND', 'NOVICE', 'The character has an ear for languages and a rare talent for recognizing similarities between them. A character with this Edge starts with a number of languages equal to his Smarts die, and can make a Smarts roll at –2 to make herself understood in any language or dialect she has heard spoken for at least a week.', 'OR', 'OR', 'OR');
SET @LINGUIST_ID = LAST_INSERT_ID();
INSERT INTO `edge` (edge_type, edge_category_type, xp_level_type, description, attribute_prerequisite_logic_type, skill_prerequisite_logic_type, edge_prerequisite_logic_type) VALUES ('LUCK', 'BACKGROUND', 'NOVICE', 'The adventurer seems to be blessed by fate, karma, the gods, or whatever external forces he believes in (or believe in him!) He draws one extra Benny at the beginning of each game session, allowing him to succeed at important tasks more often than most, and survive incredible dangers.', 'OR', 'OR', 'OR');
SET @LUCK_ID = LAST_INSERT_ID();
INSERT INTO `edge` (edge_type, edge_category_type, xp_level_type, description, attribute_prerequisite_logic_type, skill_prerequisite_logic_type, edge_prerequisite_logic_type) VALUES ('GREAT_LUCK', 'BACKGROUND', 'NOVICE', 'The player draws two extra Bennies instead of one at the start of each session.', 'OR', 'OR', 'OR');
SET @GREAT_LUCK_ID = LAST_INSERT_ID();
INSERT INTO `edge` (edge_type, edge_category_type, xp_level_type, description, attribute_prerequisite_logic_type, skill_prerequisite_logic_type, edge_prerequisite_logic_type) VALUES ('QUICK', 'BACKGROUND', 'NOVICE', 'Quick characters have lightning-fast reflexes and a cool head. Whenever you are dealt a 5 or lower in combat, you may discard and draw again until you get a card higher than 5. Characters with both the Level Headed and Quick Edges draw their additional card and take the best as usual. If that card is a Five or less, the Quick Edge may be used to draw a replacement until it’s Six or higher.', 'OR', 'OR', 'OR');
SET @QUICK_ID = LAST_INSERT_ID();
INSERT INTO `edge` (edge_type, edge_category_type, xp_level_type, description, attribute_prerequisite_logic_type, skill_prerequisite_logic_type, edge_prerequisite_logic_type) VALUES ('RICH', 'BACKGROUND', 'NOVICE', 'Unless the hero is planning to remain in one location for a serious length of time, annual salary really isn’t part of the equation for his wealth. He’s managed to accumulate a bit of money, but more important, extra gear. He begins with 5,000 credits and gets two rolls on the Body Armor, Close Combat Weapons, Cybernetics, or Ranged Combat Weapons Tables. The hero may give up the two rolls to instead own one vehicle of his choice.', 'OR', 'OR', 'OR');
SET @RICH_ID = LAST_INSERT_ID();
INSERT INTO `edge` (edge_type, edge_category_type, xp_level_type, description, attribute_prerequisite_logic_type, skill_prerequisite_logic_type, edge_prerequisite_logic_type) VALUES ('FILTHY_RICH', 'BACKGROUND', 'NOVICE', 'This character made some major scores before the current adventure. She’s got 20,000 credits saved up and gets three additional rolls (total of five) on the above listed tables.', 'OR', 'OR', 'OR');
SET @FILTHY_RICH_ID = LAST_INSERT_ID();
INSERT INTO `edge` (edge_type, edge_category_type, xp_level_type, description, attribute_prerequisite_logic_type, skill_prerequisite_logic_type, edge_prerequisite_logic_type) VALUES ('BLOCK', 'COMBAT', 'SEASONED', 'Warriors who engage in frequent hand-to-hand combat are far more skilled in personal defense than most others. They’ve learned not only how to attack, but how to block their opponent’s blows as well. A fighter with this Edge adds +1 to his Parry.', 'OR', 'OR', 'OR');
SET @BLOCK_ID = LAST_INSERT_ID();
INSERT INTO `edge` (edge_type, edge_category_type, xp_level_type, description, attribute_prerequisite_logic_type, skill_prerequisite_logic_type, edge_prerequisite_logic_type) VALUES ('IMPROVED_BLOCK', 'COMBAT', 'VETERAN', 'As above, but the hero adds +2 to his Parry.', 'OR', 'OR', 'OR');
SET @IMPROVED_BLOCK_ID = LAST_INSERT_ID();
INSERT INTO `edge` (edge_type, edge_category_type, xp_level_type, description, attribute_prerequisite_logic_type, skill_prerequisite_logic_type, edge_prerequisite_logic_type) VALUES ('BRAWLER', 'COMBAT', 'NOVICE', 'Frequent fights with his bare hands have given this thug a powerful punch. When he hits a foe with a successful bare-handed Fighting roll, he adds +2 to his damage.', 'OR', 'OR', 'OR');
SET @BRAWLER_ID = LAST_INSERT_ID();
INSERT INTO `edge` (edge_type, edge_category_type, xp_level_type, description, attribute_prerequisite_logic_type, skill_prerequisite_logic_type, edge_prerequisite_logic_type) VALUES ('BRUISER', 'COMBAT', 'SEASONED', 'When the bruiser gets a raise on his bare-handed Fighting attack, he rolls a d8 instead of a d6.', 'OR', 'OR', 'OR');
SET @BRUISER_ID = LAST_INSERT_ID();
INSERT INTO `edge` (edge_type, edge_category_type, xp_level_type, description, attribute_prerequisite_logic_type, skill_prerequisite_logic_type, edge_prerequisite_logic_type) VALUES ('COMBAT_REFLEXES', 'COMBAT', 'SEASONED', 'Your adventurer recovers quickly from shock and trauma. He adds +2 to his Spirit roll when attempting to recover from being Shaken.', 'OR', 'OR', 'OR');
SET @COMBAT_REFLEXES_ID = LAST_INSERT_ID();
INSERT INTO `edge` (edge_type, edge_category_type, xp_level_type, description, attribute_prerequisite_logic_type, skill_prerequisite_logic_type, edge_prerequisite_logic_type) VALUES ('COUNTERATTACK', 'COMBAT', 'SEASONED', 'Fighters with this Edge know how to respond instantly to an enemy’s mistakes. Once per round (if not Shaken), the character receives one free Fighting attack against one adjacent foe who failed a Fighting attack against him. This attack is made at –2, and the Counterattack must be a normal attack (no Disarm, Wild Attack, or other maneuvers), and may not be combined with Frenzy or Sweep. It may be used with the Defend maneuver, but not Full Defense.', 'OR', 'OR', 'OR');
SET @COUNTERATTACK_ID = LAST_INSERT_ID();
INSERT INTO `edge` (edge_type, edge_category_type, xp_level_type, description, attribute_prerequisite_logic_type, skill_prerequisite_logic_type, edge_prerequisite_logic_type) VALUES ('IMPROVED_COUNTERATTACK', 'COMBAT', 'VETERAN', 'As above but the character may ignore the –2 penalty.', 'OR', 'OR', 'OR');
SET @IMPROVED_COUNTERATTACK_ID = LAST_INSERT_ID();
INSERT INTO `edge` (edge_type, edge_category_type, xp_level_type, description, attribute_prerequisite_logic_type, skill_prerequisite_logic_type, edge_prerequisite_logic_type) VALUES ('DODGE', 'COMBAT', 'SEASONED', 'Some crafty types know how to get out of harm’s way. This Edge allows them to use cover, movement, and concealment to make them harder to hit. Unless they are the victim of a surprise attack and taken completely unaware, attackers must subtract 1 from their ranged attack rolls when targeting them (even in close combat). Characters who attempt to evade area effect attacks may add +1 to their Agility roll as well (when allowed).', 'OR', 'OR', 'OR');
SET @DODGE_ID = LAST_INSERT_ID();
INSERT INTO `edge` (edge_type, edge_category_type, xp_level_type, description, attribute_prerequisite_logic_type, skill_prerequisite_logic_type, edge_prerequisite_logic_type) VALUES ('IMPROVED_DODGE', 'COMBAT', 'VETERAN', 'As above but attackers subtract 2 from their attack rolls, and the character adds +2 to evade area effect weapons when allowed.', 'OR', 'OR', 'OR');
SET @IMPROVED_DODGE_ID = LAST_INSERT_ID();
INSERT INTO `edge` (edge_type, edge_category_type, xp_level_type, description, attribute_prerequisite_logic_type, skill_prerequisite_logic_type, edge_prerequisite_logic_type) VALUES ('ELAN', 'COMBAT', 'NOVICE', 'When this spirited hero puts his heart into something it tends to pay off in big ways. When you spend a Benny on a Trait roll (including Soak rolls), add +2 to the final total.', 'OR', 'OR', 'OR');
SET @ELAN_ID = LAST_INSERT_ID();
INSERT INTO `edge` (edge_type, edge_category_type, xp_level_type, description, attribute_prerequisite_logic_type, skill_prerequisite_logic_type, edge_prerequisite_logic_type) VALUES ('EXTRACTION', 'COMBAT', 'NOVICE', 'When a character normally withdraws from a melee, his attacker gets a free attack before he does so—a very dangerous proposition for most. Your hero is adept at retreating from an engagement. Make an Agility roll. If successful, one opponent doesn’t get a free attack anytime you disengage (see page 76).', 'OR', 'OR', 'OR');
SET @EXTRACTION_ID = LAST_INSERT_ID();
INSERT INTO `edge` (edge_type, edge_category_type, xp_level_type, description, attribute_prerequisite_logic_type, skill_prerequisite_logic_type, edge_prerequisite_logic_type) VALUES ('IMPROVED_EXTRACTION', 'COMBAT', 'NOVICE', 'As above but if you succeed with a raise all opponents currently in melee with the character lose their free attack as your warrior withdraws.', 'OR', 'OR', 'OR');
SET @IMPROVED_EXTRACTION_ID = LAST_INSERT_ID();
INSERT INTO `edge` (edge_type, edge_category_type, xp_level_type, description, attribute_prerequisite_logic_type, skill_prerequisite_logic_type, edge_prerequisite_logic_type) VALUES ('FIRST_STRIKE', 'COMBAT', 'NOVICE', 'Once per turn the hero (if not Shaken) gets a free Fighting attack against a single foe who moves adjacent to him. This automatically interrupts the opponent’s action and does not cost the hero his action if he is on Hold or has not yet acted this round.', 'OR', 'OR', 'OR');
SET @FIRST_STRIKE_ID = LAST_INSERT_ID();
INSERT INTO `edge` (edge_type, edge_category_type, xp_level_type, description, attribute_prerequisite_logic_type, skill_prerequisite_logic_type, edge_prerequisite_logic_type) VALUES ('IMPROVED_FIRST_STRIKE', 'COMBAT', 'HEROIC', 'As above but the hero may make one free attack against each and every foe who moves adjacent to him.', 'OR', 'OR', 'OR');
SET @IMPROVED_FIRST_STRIKE_ID = LAST_INSERT_ID();
INSERT INTO `edge` (edge_type, edge_category_type, xp_level_type, description, attribute_prerequisite_logic_type, skill_prerequisite_logic_type, edge_prerequisite_logic_type) VALUES ('FLORENTINE', 'COMBAT', 'NOVICE', 'A character trained to fight “Florentine” is a master at wielding two weapons at once. He adds +1 to his Fighting rolls versus an opponent with a single weapon and no shield. In addition, opponents subtract 1 from any “gang up” bonuses they would normally get against the fighter as his two flashing blades parry their blows.', 'OR', 'OR', 'OR');
SET @FLORENTINE_ID = LAST_INSERT_ID();
INSERT INTO `edge` (edge_type, edge_category_type, xp_level_type, description, attribute_prerequisite_logic_type, skill_prerequisite_logic_type, edge_prerequisite_logic_type) VALUES ('FRENZY', 'COMBAT', 'SEASONED', 'Frenzied fighters make fast and furious melee attacks, sacrificing finesse for raw speed. This allows them to make an extra Fighting attack per round at a –2 penalty to all Fighting rolls. This attack must be taken at the same time as another Fighting attack though it may target any two foes adjacent to the hero (Wild Cards roll two Fighting dice and one Wild Die). The –2 penalty is subtracted from all attacks. A character armed with two weapons still only makes one extra attack.', 'OR', 'OR', 'OR');
SET @FRENZY_ID = LAST_INSERT_ID();
INSERT INTO `edge` (edge_type, edge_category_type, xp_level_type, description, attribute_prerequisite_logic_type, skill_prerequisite_logic_type, edge_prerequisite_logic_type) VALUES ('IMPROVED_FRENZY', 'COMBAT', 'VETERAN', 'As above but the character may ignore the –2 Frenzy penalty.', 'OR', 'OR', 'OR');
SET @IMPROVED_FRENZY_ID = LAST_INSERT_ID();
INSERT INTO `edge` (edge_type, edge_category_type, xp_level_type, description, attribute_prerequisite_logic_type, skill_prerequisite_logic_type, edge_prerequisite_logic_type) VALUES ('GIANT_KILLER', 'COMBAT', 'VETERAN', 'The bigger they are, the harder they are to kill. At least for most. But your hero knows how to find the weak points in massive creatures. Your hero does +1d6 damage when attacking creatures three sizes or more larger than himself. An ogre (Size +3) with this ability, for example, gains the bonus only against creatures of Size +6 or greater. A human Giant Killer (Size 0), can claim the bonus against the ogre, however.', 'OR', 'OR', 'OR');
SET @GIANT_KILLER_ID = LAST_INSERT_ID();
INSERT INTO `edge` (edge_type, edge_category_type, xp_level_type, description, attribute_prerequisite_logic_type, skill_prerequisite_logic_type, edge_prerequisite_logic_type) VALUES ('HARD_TO_KILL', 'COMBAT', 'NOVICE', 'This adventurer has more lives than a truckload of cats. When forced to make Vigor rolls due to Incapacitation, he may ignore his wound modifiers. This only applies to Vigor rolls called for to resist Incapacitation or death (see page 68). He still suffers from wound modifiers for other Trait rolls normally.', 'OR', 'OR', 'OR');
SET @HARD_TO_KILL_ID = LAST_INSERT_ID();
INSERT INTO `edge` (edge_type, edge_category_type, xp_level_type, description, attribute_prerequisite_logic_type, skill_prerequisite_logic_type, edge_prerequisite_logic_type) VALUES ('HARDER_TO_KILL', 'COMBAT', 'VETERAN', 'Your hero is tougher to kill than Rasputin. If he is ever “killed,” roll a die. On an odd result, he’s dead as usual. On an even roll, he’s Incapacitated but somehow escapes death. He may be captured, stripped of all his belongings, or mistakenly left for dead, but he somehow survives.', 'OR', 'OR', 'OR');
SET @HARDER_TO_KILL_ID = LAST_INSERT_ID();
INSERT INTO `edge` (edge_type, edge_category_type, xp_level_type, description, attribute_prerequisite_logic_type, skill_prerequisite_logic_type, edge_prerequisite_logic_type) VALUES ('IMPROVISATIONAL_FIGHTER', 'COMBAT', 'SEASONED', 'Heroes often find themselves fighting with pieces of equipment or furnishings not designed for combat. A character with this Edge has a knack for using such improvised weapons, and does not suffer the usual –1 penalty to attack and Parry when wielding them. See page 73 for details.', 'OR', 'OR', 'OR');
SET @IMPROVISATIONAL_FIGHTER_ID = LAST_INSERT_ID();
INSERT INTO `edge` (edge_type, edge_category_type, xp_level_type, description, attribute_prerequisite_logic_type, skill_prerequisite_logic_type, edge_prerequisite_logic_type) VALUES ('KILLER_INSTINCT', 'COMBAT', 'HEROIC', 'This hero hates losing. If he ties on an opposed roll of any sort, he wins. In addition, if his skill die on an opposed skill roll is a 1, he can reroll it (but must keep the second result, even if it’s another 1).', 'OR', 'OR', 'OR');
SET @KILLER_INSTINCT_ID = LAST_INSERT_ID();
INSERT INTO `edge` (edge_type, edge_category_type, xp_level_type, description, attribute_prerequisite_logic_type, skill_prerequisite_logic_type, edge_prerequisite_logic_type) VALUES ('LEVEL_HEADED', 'COMBAT', 'SEASONED', 'Fighters who can keep their cool when everyone else is running for cover are deadly customers in combat. A hero with this Edge draws an additional Action Card in combat and acts on the best of the draw.', 'OR', 'OR', 'OR');
SET @LEVEL_HEADED_ID = LAST_INSERT_ID();
INSERT INTO `edge` (edge_type, edge_category_type, xp_level_type, description, attribute_prerequisite_logic_type, skill_prerequisite_logic_type, edge_prerequisite_logic_type) VALUES ('IMPROVED_LEVEL_HEADED', 'COMBAT', 'SEASONED', 'As above but the hero draws 3 cards.', 'OR', 'OR', 'OR');
SET @IMPROVED_LEVEL_HEADED_ID = LAST_INSERT_ID();
INSERT INTO `edge` (edge_type, edge_category_type, xp_level_type, description, attribute_prerequisite_logic_type, skill_prerequisite_logic_type, edge_prerequisite_logic_type) VALUES ('MARKSMAN', 'COMBAT', 'SEASONED', 'The hero excels at taking controlled, measured shots. If he does not move in a turn, he may fire as if he took the Aim maneuver. Marksman may never be used with a Rate of Fire greater than 1. Marksman works with both Shooting and Throwing.', 'OR', 'OR', 'OR');
SET @MARKSMAN_ID = LAST_INSERT_ID();
INSERT INTO `edge` (edge_type, edge_category_type, xp_level_type, description, attribute_prerequisite_logic_type, skill_prerequisite_logic_type, edge_prerequisite_logic_type) VALUES ('MARTIAL_ARTIST', 'COMBAT', 'NOVICE', 'This character is highly trained in hand-to-hand fighting. He is never considered unarmed in combat and so is never subject to the Unarmed Defender rule (page 76). With a successful unarmed attack, he adds +d4 to his Strength roll (as if he were using a small weapon).', 'OR', 'OR', 'OR');
SET @MARTIAL_ARTIST_ID = LAST_INSERT_ID();
INSERT INTO `edge` (edge_type, edge_category_type, xp_level_type, description, attribute_prerequisite_logic_type, skill_prerequisite_logic_type, edge_prerequisite_logic_type) VALUES ('IMPROVED_MARTIAL_ARTIST', 'COMBAT', 'VETERAN', 'The character now adds +d6 to his bare-handed damage.', 'OR', 'OR', 'OR');
SET @IMPROVED_MARTIAL_ARTIST_ID = LAST_INSERT_ID();
INSERT INTO `edge` (edge_type, edge_category_type, xp_level_type, description, attribute_prerequisite_logic_type, skill_prerequisite_logic_type, edge_prerequisite_logic_type) VALUES ('NERVES_OF_STEEL', 'COMBAT', 'NOVICE', 'Your hero has learned to fight on through the most intense pain. He may ignore 1 point of wound penalties.', 'OR', 'OR', 'OR');
SET @NERVES_OF_STEEL_ID = LAST_INSERT_ID();
INSERT INTO `edge` (edge_type, edge_category_type, xp_level_type, description, attribute_prerequisite_logic_type, skill_prerequisite_logic_type, edge_prerequisite_logic_type) VALUES ('IMPROVED_NERVES_OF_STEEL', 'COMBAT', 'NOVICE', 'The hero ignores 2 points of wound penalties.', 'OR', 'OR', 'OR');
SET @IMPROVED_NERVES_OF_STEEL_ID = LAST_INSERT_ID();
INSERT INTO `edge` (edge_type, edge_category_type, xp_level_type, description, attribute_prerequisite_logic_type, skill_prerequisite_logic_type, edge_prerequisite_logic_type) VALUES ('QUICK_DRAW', 'COMBAT', 'NOVICE', 'This Edge allows a hero to draw a weapon as a free action (and thus ignore the usual –2 multi-action penalty if he chooses to fire as well). If the character must make an Agility roll to draw a weapon (see page 66), he adds +2 to the roll. ', 'OR', 'OR', 'OR');
SET @QUICK_DRAW_ID = LAST_INSERT_ID();
INSERT INTO `edge` (edge_type, edge_category_type, xp_level_type, description, attribute_prerequisite_logic_type, skill_prerequisite_logic_type, edge_prerequisite_logic_type) VALUES ('ROCK_AND_ROLL', 'COMBAT', 'SEASONED', 'Some veteran shooters learn to compensate for the recoil of fully automatic weapons. If a character with this Edge does not move, he may ignore the recoil penalty for firing a weapon on full automatic.', 'OR', 'OR', 'OR');
SET @ROCK_AND_ROLL_ID = LAST_INSERT_ID();
INSERT INTO `edge` (edge_type, edge_category_type, xp_level_type, description, attribute_prerequisite_logic_type, skill_prerequisite_logic_type, edge_prerequisite_logic_type) VALUES ('STEADY_HANDS', 'COMBAT', 'NOVICE', 'Your hero ignores the “unstable platform” penalty for firing from the backs of animals or while riding in moving vehicles. In addition, when performing actions while Running (see page 65), his penalty is –1 instead of –2. ', 'OR', 'OR', 'OR');
SET @STEADY_HANDS_ID = LAST_INSERT_ID();
INSERT INTO `edge` (edge_type, edge_category_type, xp_level_type, description, attribute_prerequisite_logic_type, skill_prerequisite_logic_type, edge_prerequisite_logic_type) VALUES ('SWEEP', 'COMBAT', 'NOVICE', 'Sweep allows a character to make a single Fighting attack and apply it against all currently adjacent targets at a –2 penalty (friends and foes alike—be careful). Resolve each damage roll separately. The attack is applied immediately when rolled and only affects targets adjacent at that time. A character may not use Sweep in the same round she uses Frenzy, nor may she Sweep more than once per round, or with a second weapon held in another hand. In effect, the hero may only perform Sweep once per action unless she somehow gets two entire actions (perhaps under the effects of a spell or power, for example). ', 'OR', 'OR', 'OR');
SET @SWEEP_ID = LAST_INSERT_ID();
INSERT INTO `edge` (edge_type, edge_category_type, xp_level_type, description, attribute_prerequisite_logic_type, skill_prerequisite_logic_type, edge_prerequisite_logic_type) VALUES ('IMPROVED_SWEEP', 'COMBAT', 'VETERAN', 'As above but the hero may ignore the –2 penalty. ', 'OR', 'OR', 'OR');
SET @IMPROVED_SWEEP_ID = LAST_INSERT_ID();
INSERT INTO `edge` (edge_type, edge_category_type, xp_level_type, description, attribute_prerequisite_logic_type, skill_prerequisite_logic_type, edge_prerequisite_logic_type) VALUES ('TRADEMARK_WEAPON', 'COMBAT', 'NOVICE', 'The hero knows one unique weapon (Excalibur, Old Betsy, Sting) like the back of his hand. When using that weapon, he adds +1 to his Fighting, Shooting, or Throwing rolls. A hero can take this Edge multiple times, applying it to a different weapon each time. If a Trademark Weapon is lost, the hero can replace it, but the benefit of the Edge doesn’t kick in for two game weeks.', 'OR', 'OR', 'OR');
SET @TRADEMARK_WEAPON_ID = LAST_INSERT_ID();
INSERT INTO `edge` (edge_type, edge_category_type, xp_level_type, description, attribute_prerequisite_logic_type, skill_prerequisite_logic_type, edge_prerequisite_logic_type) VALUES ('IMPROVED_TRADEMARK_WEAPON', 'COMBAT', 'VETERAN', 'As above but the bonus when using the weapon increases to +2.', 'OR', 'OR', 'OR');
SET @IMPROVED_TRADEMARK_WEAPON_ID = LAST_INSERT_ID();
INSERT INTO `edge` (edge_type, edge_category_type, xp_level_type, description, attribute_prerequisite_logic_type, skill_prerequisite_logic_type, edge_prerequisite_logic_type) VALUES ('TWO_FISTED', 'COMBAT', 'NOVICE', 'A Two-Fisted hero isn’t ambidextrous—he’s simply learned to fight with two weapons (or both fists) at once. When attacking with a weapon in each hand, he rolls each attack separately but ignores the multi-action penalty (see page 66). ', 'OR', 'OR', 'OR');
SET @TWO_FISTED_ID = LAST_INSERT_ID();
INSERT INTO `edge` (edge_type, edge_category_type, xp_level_type, description, attribute_prerequisite_logic_type, skill_prerequisite_logic_type, edge_prerequisite_logic_type) VALUES ('COMMAND', 'LEADERSHIP', 'NOVICE', 'Command is the ability to give clear instructions to surrounding allies and enforce your hero’s will upon them. This makes your character’s compatriots more willing to fight on despite their wounds, and so adds +1 to their Spirit rolls to recover from being Shaken. ', 'OR', 'OR', 'OR');
SET @COMMAND_ID = LAST_INSERT_ID();
INSERT INTO `edge` (edge_type, edge_category_type, xp_level_type, description, attribute_prerequisite_logic_type, skill_prerequisite_logic_type, edge_prerequisite_logic_type) VALUES ('COMMAND_PRESENCE', 'LEADERSHIP', 'NOVICE', 'A booming voice, effective commands, natural charisma, or simple training results in a much more effective combat element. At the center of that element is the officer in command. A hero with this Edge has a “command radius” of 10” instead of the usual 5”. ', 'OR', 'OR', 'OR');
SET @COMMAND_PRESENCE_ID = LAST_INSERT_ID();
INSERT INTO `edge` (edge_type, edge_category_type, xp_level_type, description, attribute_prerequisite_logic_type, skill_prerequisite_logic_type, edge_prerequisite_logic_type) VALUES ('FERVOR', 'LEADERSHIP', 'VETERAN', 'A simple phrase uttered by a great leader can sometimes have momentous results. A leader with this ability can inspire his men to bloody fervor by yelling a motto, slogan, or other inspirational words. Those in the command radius add +1 to their Fighting damage rolls. ', 'OR', 'OR', 'OR');
SET @FERVOR_ID = LAST_INSERT_ID();
INSERT INTO `edge` (edge_type, edge_category_type, xp_level_type, description, attribute_prerequisite_logic_type, skill_prerequisite_logic_type, edge_prerequisite_logic_type) VALUES ('HOLD_THE_LINE', 'LEADERSHIP', 'SEASONED', 'This Edge strengthens the will of the men under the hero’s command. The troops add +1 to their Toughness. ', 'OR', 'OR', 'OR');
SET @HOLD_THE_LINE_ID = LAST_INSERT_ID();
INSERT INTO `edge` (edge_type, edge_category_type, xp_level_type, description, attribute_prerequisite_logic_type, skill_prerequisite_logic_type, edge_prerequisite_logic_type) VALUES ('INSPIRE', 'LEADERSHIP', 'INSPIRE', 'Leaders with exceptional reputations and experience in battle inspire the soldiers around them. They add +2 to Spirit rolls when recovering from being Shaken (this includes the original +1 bonus for the Command Edge). ', 'OR', 'OR', 'OR');
SET @INSPIRE_ID = LAST_INSERT_ID();
INSERT INTO `edge` (edge_type, edge_category_type, xp_level_type, description, attribute_prerequisite_logic_type, skill_prerequisite_logic_type, edge_prerequisite_logic_type) VALUES ('LEADER_OF_MEN', 'LEADERSHIP', 'VETERAN', 'Command comes easy to this commander. Those under his command work like a well-oiled machine when he’s in charge. Allies under the leader’s command roll a d10 as the Wild Die instead of a d6 when making group rolls. ', 'OR', 'OR', 'OR');
SET @LEADER_OF_MEN_ID = LAST_INSERT_ID();
INSERT INTO `edge` (edge_type, edge_category_type, xp_level_type, description, attribute_prerequisite_logic_type, skill_prerequisite_logic_type, edge_prerequisite_logic_type) VALUES ('NATURAL_LEADER', 'LEADERSHIP', 'NOVICE', 'This Edge signifies a special link between a leader and his men. With it, he may share his Bennies with any troops under his command. ', 'OR', 'OR', 'OR');
SET @NATURAL_LEADER_ID = LAST_INSERT_ID();
INSERT INTO `edge` (edge_type, edge_category_type, xp_level_type, description, attribute_prerequisite_logic_type, skill_prerequisite_logic_type, edge_prerequisite_logic_type) VALUES ('TACTICIAN', 'LEADERSHIP', 'SEASONED', 'The leader has a natural grasp of small unit tactics and can frequently take advantage of a rapidly changing situation. At the beginning of a fight and before any Action Cards are dealt, the hero makes a Knowledge (Battle) roll. For each success and raise he receives one Action Card. These are kept separate from his regular Action Cards and are not placed back into the deck until used or the combat ends (including Jokers!). At the start of any round, the hero may give one or more of these extra cards to his allies, whether Extras or Wild Cards, who then use it as their Action Card for the round in place of the one dealt them. This allows Extras to operate independently of Wild Card characters for one round if they receive their own card. Only one character per encounter may use this Edge. ', 'OR', 'OR', 'OR');
SET @TACTICIAN_ID = LAST_INSERT_ID();
INSERT INTO `edge` (edge_type, edge_category_type, xp_level_type, description, attribute_prerequisite_logic_type, skill_prerequisite_logic_type, edge_prerequisite_logic_type) VALUES ('NEW_POWER', 'POWER', 'NOVICE', 'An arcane character may learn a new power by choosing this Edge (which may be taken multiple times). He may choose from any powers normally available to his particular Arcane Background. ', 'OR', 'OR', 'OR');
SET @NEW_POWER_ID = LAST_INSERT_ID();
INSERT INTO `edge` (edge_type, edge_category_type, xp_level_type, description, attribute_prerequisite_logic_type, skill_prerequisite_logic_type, edge_prerequisite_logic_type) VALUES ('POWER_POINTS', 'POWER', 'NOVICE', 'Wizards, weird scientists, and other arcane types always want more power. This Edge grants them an additional 5 Power Points. Power Points may be selected more than once, but only once per Rank. ', 'OR', 'OR', 'OR');
SET @POWER_POINTS_ID = LAST_INSERT_ID();
INSERT INTO `edge` (edge_type, edge_category_type, xp_level_type, description, attribute_prerequisite_logic_type, skill_prerequisite_logic_type, edge_prerequisite_logic_type) VALUES ('RAPID_RECHARGE', 'POWER', 'SEASONED', 'This Edge allows an arcane character to regain 1 Power Point every 30 minutes. ', 'OR', 'OR', 'OR');
SET @RAPID_RECHARGE_ID = LAST_INSERT_ID();
INSERT INTO `edge` (edge_type, edge_category_type, xp_level_type, description, attribute_prerequisite_logic_type, skill_prerequisite_logic_type, edge_prerequisite_logic_type) VALUES ('IMPROVED_RAPID_RECHARGE', 'POWER', 'VETERAN', 'The character regains 1 Power Point every 15 minutes. ', 'OR', 'OR', 'OR');
SET @IMPROVED_RAPID_RECHARGE_ID = LAST_INSERT_ID();
INSERT INTO `edge` (edge_type, edge_category_type, xp_level_type, description, attribute_prerequisite_logic_type, skill_prerequisite_logic_type, edge_prerequisite_logic_type) VALUES ('SOUL_DRAIN', 'POWER', 'SEASONED', 'Spellcasters, mentalists, and other arcane types in dire need of Power Points may use this Edge to drain energy from their own souls. To use this dangerous ability, the arcane character first decides how many Power Points he wants to draw from himself. Then he makes a Spirit roll minus the number of points heâ€™s trying to drain. (This is a free action.) On a Spirit total of 1 or less, the character suffers a wound and falls unconscious for 1d6 hours. On a failure, the character suffers a wound. On a success or better, the character gets the points he needed and may attempt to cast a spell with them immediately (they may not be saved). ', 'OR', 'OR', 'OR');
SET @SOUL_DRAIN_ID = LAST_INSERT_ID();
INSERT INTO `edge` (edge_type, edge_category_type, xp_level_type, description, attribute_prerequisite_logic_type, skill_prerequisite_logic_type, edge_prerequisite_logic_type) VALUES ('ACE', 'PROFESSIONAL', 'NOVICE', 'Aces are special pilots and drivers who feel more comfortable behind the wheel, throttle, or flight stick than on their own two feet. Aces add +2 to Boating, Driving, and Piloting rolls. In addition, they may also spend Bennies to make Soak rolls for any vehicle or vessel they control. This is a Boating, Driving, or Piloting roll at â€“2 (cancelling their usual +2). Each success and raise negates a wound and any critical hit that would have resulted from it. ', 'OR', 'OR', 'OR');
SET @ACE_ID = LAST_INSERT_ID();
INSERT INTO `edge` (edge_type, edge_category_type, xp_level_type, description, attribute_prerequisite_logic_type, skill_prerequisite_logic_type, edge_prerequisite_logic_type) VALUES ('ACROBAT', 'PROFESSIONAL', 'NOVICE', 'Those who have formal training in the acrobatic arts or are naturally agile may take this Edge. It adds +2 to all Agility rolls made to perform acrobatic maneuvers (including Trick maneuvers), and also adds +1 to a characterâ€™s Parry as long as he has no encumbrance penalty. ', 'AND', 'OR', 'OR');
SET @ACROBAT_ID = LAST_INSERT_ID();
INSERT INTO `edge` (edge_type, edge_category_type, xp_level_type, description, attribute_prerequisite_logic_type, skill_prerequisite_logic_type, edge_prerequisite_logic_type) VALUES ('ADEPT', 'PROFESSIONAL', 'NOVICE', 'Adepts are holy warriors who have trained themselves to be living weapons. Some do so to be ultimate warriors; others do it in the service of a cause or deity. As a free action, an adept can spend 1 Power Point to gain AP 2 with all of his unarmed attacks until his next action. In addition, upon taking this Edge and at each new Rank, they may choose to change the trappings of one of the following powers to work only on themselves but be activated as a free action: boost/lower trait, deflection, healing, smite, or speed. The Adept must have the power to begin with, and this does not allow him to activate more than one power in a round. ', 'OR', 'AND', 'AND');
SET @ADEPT_ID = LAST_INSERT_ID();
INSERT INTO `edge` (edge_type, edge_category_type, xp_level_type, description, attribute_prerequisite_logic_type, skill_prerequisite_logic_type, edge_prerequisite_logic_type) VALUES ('ASSASSIN', 'PROFESSIONAL', 'NOVICE', 'Assassins are trained killers who know how to kill with deadly precision â€” if they can properly approach their prey. Assassins add +2 to any damage roll where they strike a foe unawares (even with ranged attacks). ', 'OR', 'AND', 'OR');
SET @ASSASSIN_ID = LAST_INSERT_ID();
INSERT INTO `edge` (edge_type, edge_category_type, xp_level_type, description, attribute_prerequisite_logic_type, skill_prerequisite_logic_type, edge_prerequisite_logic_type) VALUES ('CHAMPION', 'PROFESSIONAL', 'NOVICE', 'Champions are holy (or unholy) men and women chosen to fight for a particular deity or religion. Most are pious souls ready and willing to lay down their lives for a greater cause, but some may have been born into the role and follow their path with some reluctance. Champions fight the forces of darkness (or good). They add +2 damage when attacking supernaturally evil (or good) creatures, and have +2 Toughness when suffering damage from supernaturally evil (or good) sources, including arcane powers and the weapons, claws, teeth, etc., of such creatures. ', 'AND', 'AND', 'OR');
SET @CHAMPION_ID = LAST_INSERT_ID();
INSERT INTO `edge` (edge_type, edge_category_type, xp_level_type, description, attribute_prerequisite_logic_type, skill_prerequisite_logic_type, edge_prerequisite_logic_type) VALUES ('GADGETEER', 'PROFESSIONAL', 'NOVICE', 'These mechanical gurus are so technically savvy they can quickly build a machine to handle nearly any situation. Once per game session, a gadgeteer can create a â€œjuryriggedâ€ device from spare parts. The device functions just like any other Weird Science device, and uses any power available to Weird Scientists in that setting (though this is still subject to Rank restrictions). It has half the inventorâ€™s Power Points, and once these are used up, the gadget burns out and does not recharge. The inventor must have access to some parts and a reasonable amount of time (GMâ€™s call, but at least 1d20 minutes) to create the gizmo. ', 'OR', 'AND', 'OR');
SET @GADGETEER_ID = LAST_INSERT_ID();
INSERT INTO `edge` (edge_type, edge_category_type, xp_level_type, description, attribute_prerequisite_logic_type, skill_prerequisite_logic_type, edge_prerequisite_logic_type) VALUES ('HOLY_UNHOLY_WARRIOR', 'PROFESSIONAL', 'NOVICE', 'Acolytes, clerics, paladins, holy slayers, and other avatars of the gods are frequently tasked with battling the forces of evil in the mortal world. This Edge gives them a slight advantage against such foes. As an action, a priest or other holy person may call upon his chosen deity to repulse supernaturally evil creatures, such as the undead, demons, and the like. It also works on evil characters with the Arcane Background (Miracles) Edge. Repulsing evil costs 1 Power Point and has a range of the characterâ€™s Spirit. Targeted creatures within that range must make a Spirit roll. Failure means the creature is Shaken; a 1 means it is destroyed. Wild Cards suffer an automatic Wound instead. A character may also be an Unholy Warrior working for the forces of evil. In this case, he repulses good creatures, such as angels, paladins, or good characters with Arcane Background (Miracles). ', 'OR', 'OR', 'OR');
SET @HOLY_UNHOLY_WARRIOR_ID = LAST_INSERT_ID();
INSERT INTO `edge` (edge_type, edge_category_type, xp_level_type, description, attribute_prerequisite_logic_type, skill_prerequisite_logic_type, edge_prerequisite_logic_type) VALUES ('INVESTIGATOR', 'PROFESSIONAL', 'NOVICE', 'Investigators have spent a great deal of time researching ancient legends, working the streets, or deducing devilish mysteries. Some of these heroes are actual Private Investigators for hire while others may be sleuthing mages in a fantasy world or perhaps inquisitive college professors stumbling upon Things Man Was Not Meant to Know in the dark of night. Investigators add +2 to Investigation and Streetwise rolls, as well as Notice rolls made to search through evidence. ', 'OR', 'AND', 'OR');
SET @INVESTIGATOR_ID = LAST_INSERT_ID();
INSERT INTO `edge` (edge_type, edge_category_type, xp_level_type, description, attribute_prerequisite_logic_type, skill_prerequisite_logic_type, edge_prerequisite_logic_type) VALUES ('JACK_OF_ALL_TRADES', 'PROFESSIONAL', 'NOVICE', 'Through advanced schooling, book-learning, computer-  enhanced skill programs, or just amazing intuitive perception, your hero has a talent for picking up skills on the fly. There is little he canâ€™t figure out given a little time and a dash of luck. Any time he makes an unskilled roll for a Smarts-based skill, he may do so at d4 instead of the usual d4â€“2. ', 'OR', 'OR', 'OR');
SET @JACK_OF_ALL_TRADES_ID = LAST_INSERT_ID();
INSERT INTO `edge` (edge_type, edge_category_type, xp_level_type, description, attribute_prerequisite_logic_type, skill_prerequisite_logic_type, edge_prerequisite_logic_type) VALUES ('MCGUYVER', 'PROFESSIONAL', 'NOVICE', 'This character can improvise something when the need for a tool arises. He suffers no negative penalties on Trait rolls for lack of equipment in most situations. In addition, given a few simple tools, props, or devices, he can generally rig devices to help escape from death-traps, weapons to match some bizarre need, or otherwise create something thatâ€™s needed when such a thing isnâ€™t actually present. The extent of this is completely up to the Game Master, but creativity should be rewarded, particularly in dire situations where few other answers are possible. ', 'OR', 'AND', 'OR');
SET @MCGUYVER_ID = LAST_INSERT_ID();
INSERT INTO `edge` (edge_type, edge_category_type, xp_level_type, description, attribute_prerequisite_logic_type, skill_prerequisite_logic_type, edge_prerequisite_logic_type) VALUES ('MENTALIST', 'PROFESSIONAL', 'NOVICE', 'Mentalists are masters of mind control and psionics. Some are pulp heroes, others are trained in secret government academies to root out traitors. Their frequent toying with human minds gives them a +2 on any opposed Psionics roll, whether they are using their powers against a foe or are trying to defend against a rival Mentalist. ', 'OR', 'OR', 'OR');
SET @MENTALIST_ID = LAST_INSERT_ID();
INSERT INTO `edge` (edge_type, edge_category_type, xp_level_type, description, attribute_prerequisite_logic_type, skill_prerequisite_logic_type, edge_prerequisite_logic_type) VALUES ('MR_FIX_IT', 'PROFESSIONAL', 'NOVICE', 'The inventor adds +2 to Repair rolls. With a raise, he halves the time normally required to fix something. This means that if a particular Repair job already states that a raise repairs it in half the time, a Mr. Fix It could finish the job in one-quarter the time with a raise. ', 'OR', 'AND', 'OR');
SET @MR_FIX_IT_ID = LAST_INSERT_ID();
INSERT INTO `edge` (edge_type, edge_category_type, xp_level_type, description, attribute_prerequisite_logic_type, skill_prerequisite_logic_type, edge_prerequisite_logic_type) VALUES ('SCHOLAR', 'PROFESSIONAL', 'NOVICE', 'Learned professors, devoted students, and amateur enthusiasts spend months of their lives studying particular subjects. They become experts in these fields, and rarely fail to answer questions in their particular area of expertise. Pick any two Knowledge skills the Scholar has a d8 or better in. Add +2 to your total whenever these skills are used. Those who study military history have a natural edge when commanding troops in Mass Battles (see page 92)â€”a +2 to a Knowledge (Battle) roll can mean the difference between a rousing victory and a crushing defeat. ', 'OR', 'OR', 'OR');
SET @SCHOLAR_ID = LAST_INSERT_ID();
INSERT INTO `edge` (edge_type, edge_category_type, xp_level_type, description, attribute_prerequisite_logic_type, skill_prerequisite_logic_type, edge_prerequisite_logic_type) VALUES ('THIEF', 'PROFESSIONAL', 'NOVICE', 'Thieves specialize in deceit, treachery, and acrobatics. They can be invaluable where traps must be detected, walls must be climbed, and locks must be picked. Thieves add +2 to Climbing, Lockpick, Stealth, as well as Notice or Repair rolls that relate to traps and similar devices. The bonus to Stealth does not apply when the character is in a wilderness environmentâ€”only in urban areas. ', 'OR', 'AND', 'OR');
SET @THIEF_ID = LAST_INSERT_ID();
INSERT INTO `edge` (edge_type, edge_category_type, xp_level_type, description, attribute_prerequisite_logic_type, skill_prerequisite_logic_type, edge_prerequisite_logic_type) VALUES ('WIZARD', 'PROFESSIONAL', 'NOVICE', 'Wizards range from young apprentices to frighteningly powerful supreme sorcerers. They are often physically weak, however, and rarely have the divine powers or healing abilities of priestly spellcasters. What they lack in spiritual favor, however, they more than make up for in utility and eldritch might. Wizards tend to learn their craft in formalized institutions or under the tutelage of experienced masters. Each raise a Wizard gets on his Spellcasting roll reduces the cost of the spell by 1 Power Point. The Wizard must have the points available to cast the spell in the first place before rolling. ', 'OR', 'AND', 'OR');
SET @WIZARD_ID = LAST_INSERT_ID();
INSERT INTO `edge` (edge_type, edge_category_type, xp_level_type, description, attribute_prerequisite_logic_type, skill_prerequisite_logic_type, edge_prerequisite_logic_type) VALUES ('WOODSMAN', 'PROFESSIONAL', 'NOVICE', 'Woodsmen are rangers, scouts, and hunters who are more at home in the wilderness than in urban areas. They are skilled trackers and scouts, and know how to live off the land for months at a time. Woodsmen gain +2 to Tracking, Survival, and Stealth rolls made in the wilderness (not towns, ruins, or underground). ', 'OR', 'AND', 'OR');
SET @WOODSMAN_ID = LAST_INSERT_ID();
INSERT INTO `edge` (edge_type, edge_category_type, xp_level_type, description, attribute_prerequisite_logic_type, skill_prerequisite_logic_type, edge_prerequisite_logic_type) VALUES ('CHARISMATIC', 'SOCIAL', 'NOVICE', 'Your hero has learned how to work with others, even those who might be somewhat opposed to him or his efforts. This adds +2 to his Charisma. ', 'OR', 'OR', 'OR');
SET @CHARISMATIC_ID = LAST_INSERT_ID();
INSERT INTO `edge` (edge_type, edge_category_type, xp_level_type, description, attribute_prerequisite_logic_type, skill_prerequisite_logic_type, edge_prerequisite_logic_type) VALUES ('COMMON_BOND', 'SOCIAL', 'NOVICE', 'This Edge signifies a special link between close companions— such as a typical party. It doesn’t matter whether or not the characters get along perfectly or not, they’ve just formed a close and common bond during their epic adventures. A character with this Edge may freely give his Bennies to any other Wild Card he can communicate with. This represents the character giving his verbal or spiritual support to the ally. The player should say what his character is doing to give the support. The gesture could be as complex as a rousing speech, or as simple as a knowing nod.', 'OR', 'OR', 'OR');
SET @COMMON_BOND_ID = LAST_INSERT_ID();
INSERT INTO `edge` (edge_type, edge_category_type, xp_level_type, description, attribute_prerequisite_logic_type, skill_prerequisite_logic_type, edge_prerequisite_logic_type) VALUES ('CONNECTIONS', 'SOCIAL', 'NOVICE', 'Whether it’s to the Feds, the cops, the Mob, or some big corporation, your heroine knows someone on the inside— someone who is willing to lend her a hand on occasion (usually once per game session). This Edge may be taken more than once, but each time must be applied to a different organization. The GM should also ensure the organization is limited to a single, unique organization. A hero may, for instance, have Connections (US Army), but he shouldn’t have a blanket Connections (Military). To use a character’s Connections requires that she first get in touch with one of her contacts. This requires a Streetwise roll. Failure means the particular contact wasn’t available, their cell phone wasn’t on, or they were otherwise tied up. Once in contact, the hero must make a Persuasion roll. The GM should feel free to modify both the Persuasion roll and any results based on the circumstances. A failure indicates the heroine’s contacts just couldn’t come through this time, or perhaps just weren’t persuaded that their help was really necessary. On a success, the contact might share information, but won’t do anything too risky to help. On a raise, the contact is willing to leak sensitive information, but stops short of outright betrayal. Two or more raises means the heroine has pushed the right buttons and can count on serious help. The Connection will risk serious consequences for the heroine, and if she needs financial assistance, may provide more than he’s comfortable with. If the heroine asks for muscle, the contact delivers either one expert (a safe-cracker, wheel-man, security expert, etc.) or five average fighter-types for the contact’s particular organization (a mob boss sends five thugs, the Army sends five infantrymen, etc.). ', 'OR', 'OR', 'OR');
SET @CONNECTIONS_ID = LAST_INSERT_ID();
INSERT INTO `edge` (edge_type, edge_category_type, xp_level_type, description, attribute_prerequisite_logic_type, skill_prerequisite_logic_type, edge_prerequisite_logic_type) VALUES ('STRONG_WILLED', 'SOCIAL', 'NOVICE', 'Characters with strong willpower use their voice, steely stares, or quick wits to unnerve their opponents. Strong Willed adds +2 to a character’s Intimidation and Taunt rolls, as well as his Spirit and Smarts rolls when resisting Test of Wills attacks. ', 'OR', 'AND', 'OR');
SET @STRONG_WILLED_ID = LAST_INSERT_ID();
INSERT INTO `edge` (edge_type, edge_category_type, xp_level_type, description, attribute_prerequisite_logic_type, skill_prerequisite_logic_type, edge_prerequisite_logic_type) VALUES ('BEAST_BOND', 'WEIRD', 'NOVICE', 'Some individuals can exert incredible will over their animal companions. These characters may spend their own Bennies for any animals under their control, including mounts, pet dogs, familiars, and so on.', 'OR', 'OR', 'OR');
SET @BEAST_BOND_ID = LAST_INSERT_ID();
INSERT INTO `edge` (edge_type, edge_category_type, xp_level_type, description, attribute_prerequisite_logic_type, skill_prerequisite_logic_type, edge_prerequisite_logic_type) VALUES ('BEAST_MASTER', 'WEIRD', 'NOVICE', 'Animals like your hero, and won’t attack him unless he attacks them first or they are enraged for some reason. His “animal magnetism” is so great he’s attracted a loyal animal of some sort as well. This is typically a dog, wolf, or raptor, though the GM may allow other companions if it fits the setting. The beast is an Extra (not a Wild Card). If it should be killed, the hero finds a replacement in 2d6 days.', 'OR', 'OR', 'OR');
SET @BEAST_MASTER_ID = LAST_INSERT_ID();
INSERT INTO `edge` (edge_type, edge_category_type, xp_level_type, description, attribute_prerequisite_logic_type, skill_prerequisite_logic_type, edge_prerequisite_logic_type) VALUES ('DANGER_SENSE', 'WEIRD', 'NOVICE', 'Your hero can sense when something bad is about to happen. Anytime he’s about to be the victim of a surprise attack, ambush, or other nasty surprise, he gets a Notice roll at –2 just before the attack or event occurs. If successful, the character knows something is about to happen and may take appropriate action against it. This means the hero is on Hold for the first round of a combat. Should the hero fail his roll, he still follows the normal Surprise rules, if applicable (see page 65).', 'OR', 'OR', 'OR');
SET @DANGER_SENSE_ID = LAST_INSERT_ID();
INSERT INTO `edge` (edge_type, edge_category_type, xp_level_type, description, attribute_prerequisite_logic_type, skill_prerequisite_logic_type, edge_prerequisite_logic_type) VALUES ('HEALER', 'WEIRD', 'NOVICE', 'A hero with this Edge adds +2 to all Healing rolls (including natural healing rolls for his own wounds), whether natural or magical in nature. Up to five companions traveling with a Healer add the bonus to their natural healing rolls as well. ', 'OR', 'OR', 'OR');
SET @HEALER_ID = LAST_INSERT_ID();
INSERT INTO `edge` (edge_type, edge_category_type, xp_level_type, description, attribute_prerequisite_logic_type, skill_prerequisite_logic_type, edge_prerequisite_logic_type) VALUES ('LIQUID_COURAGE', 'WEIRD', 'NOVICE', 'Your hero processes alcohol far differently than most. The round after consuming a stiff drink (at least 8 ounces of hard liquor or equivalent), the character’s Vigor increases by one die type (increasing Toughness as well). The hard drinker can also ignore one level of wound modifiers (which stacks with other abilities that do the same). The effect lasts for one hour after it begins. If the drunkard seeks inebriation he suffers –2 to Smarts and Agility-based rolls for as long as he continues to drink and the next 1d6 hours thereafter. ', 'OR', 'OR', 'OR');
SET @LIQUID_COURAGE_ID = LAST_INSERT_ID();
INSERT INTO `edge` (edge_type, edge_category_type, xp_level_type, description, attribute_prerequisite_logic_type, skill_prerequisite_logic_type, edge_prerequisite_logic_type) VALUES ('SCAVENGER', 'WEIRD', 'NOVICE', 'Once per session the hero may “suddenly remember” that he has a much-needed piece of equipment on his person. The item must be capable of being stored in the hero’s pocket or bag (assuming he has one), and the Game Master has the final word on what can be found.', 'OR', 'OR', 'OR');
SET @SCAVENGER_ID = LAST_INSERT_ID();
INSERT INTO `edge` (edge_type, edge_category_type, xp_level_type, description, attribute_prerequisite_logic_type, skill_prerequisite_logic_type, edge_prerequisite_logic_type) VALUES ('DEAD_SHOT', 'WILD_CARD', 'SEASONED', 'The character doubles his total damage when making a successful Shooting or Throwing attack this round.', 'OR', 'OR', 'OR');
SET @DEAD_SHOT_ID = LAST_INSERT_ID();
INSERT INTO `edge` (edge_type, edge_category_type, xp_level_type, description, attribute_prerequisite_logic_type, skill_prerequisite_logic_type, edge_prerequisite_logic_type) VALUES ('MIGHTY_BLOW', 'WILD_CARD', 'SEASONED', 'The character doubles his total damage when making a successful Fighting attack this round. ', 'OR', 'OR', 'OR');
SET @MIGHTY_BLOW_ID = LAST_INSERT_ID();
INSERT INTO `edge` (edge_type, edge_category_type, xp_level_type, description, attribute_prerequisite_logic_type, skill_prerequisite_logic_type, edge_prerequisite_logic_type) VALUES ('POWER_SURGE', 'WILD_CARD', 'SEASONED', 'This Edge is for those characters with Arcane Backgrounds. When dealt a Joker, the character recovers 2d6 Power Points. He may not exceed his usual limit. ', 'OR', 'OR', 'OR');
SET @POWER_SURGE_ID = LAST_INSERT_ID();
INSERT INTO `edge` (edge_type, edge_category_type, xp_level_type, description, attribute_prerequisite_logic_type, skill_prerequisite_logic_type, edge_prerequisite_logic_type) VALUES ('FOLLOWERS', 'LEGENDARY', 'LEGENDARY', 'Heroes often acquire dedicated warbands, “merry men,” or others who voluntarily follow the hero on his adventures. Each time this Edge is chosen, five followers join the hero’s band. Casualties are not automatically replaced, so a hero may need to choose this Edge again on occasion to replenish his losses. The followers must have some way to eat and earn income, and generally want a piece of whatever loot, treasure, or other rewards the hero acquires. Otherwise, they are completely dedicated to their idol and risk their lives for him under any normal conditions. They won’t knowingly throw their lives away except under very special circumstances. The GM determines the followers’ statistics, but in general, use the Soldier statistics presented on page 81. Followers generally come with only basic equipment depending on their particular setting (warriors in fantasy come with at least leather armor and short swords, for example). The hero must purchase any additional equipment for his Followers himself.', 'OR', 'OR', 'OR');
SET @FOLLOWERS_ID = LAST_INSERT_ID();
INSERT INTO `edge` (edge_type, edge_category_type, xp_level_type, description, attribute_prerequisite_logic_type, skill_prerequisite_logic_type, edge_prerequisite_logic_type) VALUES ('MARTIAL_ARTS_MASTER', 'LEGENDARY', 'LEGENDARY', 'The warrior is deadly with his hands. He adds +2 to his bare-handed damage every time he takes this Edge, up to a maximum of five times for a total damage bonus of +10. ', 'OR', 'OR', 'OR');
SET @MARTIAL_ARTS_MASTER_ID = LAST_INSERT_ID();
INSERT INTO `edge` (edge_type, edge_category_type, xp_level_type, description, attribute_prerequisite_logic_type, skill_prerequisite_logic_type, edge_prerequisite_logic_type) VALUES ('PROFESSIONAL', 'LEGENDARY', 'LEGENDARY', 'The character is an expert at a particular skill or attribute (his choice). That Trait becomes d12+1. This Edge may be selected more than once, but it may never be applied to the same skill or attribute twice.', 'OR', 'OR', 'OR');
SET @PROFESSIONAL_ID = LAST_INSERT_ID();
INSERT INTO `edge` (edge_type, edge_category_type, xp_level_type, description, attribute_prerequisite_logic_type, skill_prerequisite_logic_type, edge_prerequisite_logic_type) VALUES ('EXPERT', 'LEGENDARY', 'LEGENDARY', 'As above, but the Trait increases to d12+2.', 'OR', 'OR', 'OR');
SET @EXPERT_ID = LAST_INSERT_ID();
INSERT INTO `edge` (edge_type, edge_category_type, xp_level_type, description, attribute_prerequisite_logic_type, skill_prerequisite_logic_type, edge_prerequisite_logic_type) VALUES ('MASTER', 'LEGENDARY', 'LEGENDARY', 'The character’s Wild Die increases to a d10 when rolling a particular Trait of his choice. This Edge may be chosen multiple times, though it only affects a particular Trait once.', 'OR', 'OR', 'OR');
SET @MASTER_ID = LAST_INSERT_ID();
INSERT INTO `edge` (edge_type, edge_category_type, xp_level_type, description, attribute_prerequisite_logic_type, skill_prerequisite_logic_type, edge_prerequisite_logic_type) VALUES ('SIDEKICK', 'LEGENDARY', 'LEGENDARY', 'A character who triumphs over evil time and time again becomes an inspiration to others. Eventually, one of these young crusaders may attempt to join the hero in his epic quests. The hero gains a Novice Rank sidekick. The sidekick is a Wild Card, gains experience as usual, and has abilities that complement or mimic his hero’s. The player character should control his sidekick just like any other ally. Of course, the sidekick may occasionally cause trouble (by getting captured, running into danger when he’s not supposed to, etc.). The player should be prepared for his “Edge” to occasionally become a “Hindrance.” If the sidekick dies, he isn’t replaced unless the hero chooses this Edge again.', 'OR', 'OR', 'OR');
SET @SIDEKICK_ID = LAST_INSERT_ID();
INSERT INTO `edge` (edge_type, edge_category_type, xp_level_type, description, attribute_prerequisite_logic_type, skill_prerequisite_logic_type, edge_prerequisite_logic_type) VALUES ('TOUGH_AS_NAILS', 'LEGENDARY', 'LEGENDARY', 'Your hero is a grizzled veteran. Increase his Toughness by +1.', 'OR', 'OR', 'OR');
SET @TOUGH_AS_NAILS_ID = LAST_INSERT_ID();
INSERT INTO `edge` (edge_type, edge_category_type, xp_level_type, description, attribute_prerequisite_logic_type, skill_prerequisite_logic_type, edge_prerequisite_logic_type) VALUES ('IMPROVED_TOUGH_AS_NAILS', 'LEGENDARY', 'LEGENDARY', 'Increase your hero’s Toughness by another +1. ', 'OR', 'OR', 'OR');
SET @IMPROVED_TOUGH_AS_NAILS_ID = LAST_INSERT_ID();
INSERT INTO `edge` (edge_type, edge_category_type, xp_level_type, description, attribute_prerequisite_logic_type, skill_prerequisite_logic_type, edge_prerequisite_logic_type) VALUES ('WEAPON_MASTER', 'LEGENDARY', 'LEGENDARY', 'Increase your hero’s Parry by +1.', 'OR', 'OR', 'OR');
SET @WEAPON_MASTER_ID = LAST_INSERT_ID();
INSERT INTO `edge` (edge_type, edge_category_type, xp_level_type, description, attribute_prerequisite_logic_type, skill_prerequisite_logic_type, edge_prerequisite_logic_type) VALUES ('MASTER_OF_ARMS', 'LEGENDARY', 'LEGENDARY', 'Increase your hero’s Parry by another +1. ', 'OR', 'OR', 'OR');
SET @MASTER_OF_ARMS_ID = LAST_INSERT_ID();

-- ATTR prereqs
INSERT INTO `edge_attribute_prerequisite` (edge, attribute_type, die_type) VALUES (@AMBIDEXTROUS_ID, 'AGILITY', 'D8');
INSERT INTO `edge_attribute_prerequisite` (edge, attribute_type, die_type) VALUES (@ARCANE_RESISTANCE_ID, 'SPIRIT', 'D8');
INSERT INTO `edge_attribute_prerequisite` (edge, attribute_type, die_type) VALUES (@ATTRACTIVE_ID, 'VIGOR', 'D6');
INSERT INTO `edge_attribute_prerequisite` (edge, attribute_type, die_type) VALUES (@BRAVE_ID, 'SPIRIT', 'D6');
INSERT INTO `edge_attribute_prerequisite` (edge, attribute_type, die_type) VALUES (@BRAWNY_ID, 'STRENGTH', 'D6');
INSERT INTO `edge_attribute_prerequisite` (edge, attribute_type, die_type) VALUES (@BRAWNY_ID, 'VIGOR', 'D6');
INSERT INTO `edge_attribute_prerequisite` (edge, attribute_type, die_type) VALUES (@FAST_HEALER_ID, 'VIGOR', 'D8');
INSERT INTO `edge_attribute_prerequisite` (edge, attribute_type, die_type) VALUES (@FLEET_FOOTED_ID, 'AGILITY', 'D6');
INSERT INTO `edge_attribute_prerequisite` (edge, attribute_type, die_type) VALUES (@LINGUIST_ID, 'SMARTS', 'D6');
INSERT INTO `edge_attribute_prerequisite` (edge, attribute_type, die_type) VALUES (@QUICK_ID, 'AGILITY', 'D8');
INSERT INTO `edge_attribute_prerequisite` (edge, attribute_type, die_type) VALUES (@BRAWLER_ID, 'STRENGTH', 'D8');
INSERT INTO `edge_attribute_prerequisite` (edge, attribute_type, die_type) VALUES (@DODGE_ID, 'AGILITY', 'D8');
INSERT INTO `edge_attribute_prerequisite` (edge, attribute_type, die_type) VALUES (@ELAN_ID, 'SPIRIT', 'D8');
INSERT INTO `edge_attribute_prerequisite` (edge, attribute_type, die_type) VALUES (@EXTRACTION_ID, 'AGILITY', 'D8');
INSERT INTO `edge_attribute_prerequisite` (edge, attribute_type, die_type) VALUES (@FIRST_STRIKE_ID, 'AGILITY', 'D8');
INSERT INTO `edge_attribute_prerequisite` (edge, attribute_type, die_type) VALUES (@FLORENTINE_ID, 'AGILITY', 'D8');
INSERT INTO `edge_attribute_prerequisite` (edge, attribute_type, die_type) VALUES (@HARD_TO_KILL_ID, 'SPIRIT', 'D8');
INSERT INTO `edge_attribute_prerequisite` (edge, attribute_type, die_type) VALUES (@IMPROVISATIONAL_FIGHTER_ID, 'SMARTS', 'D6');
INSERT INTO `edge_attribute_prerequisite` (edge, attribute_type, die_type) VALUES (@LEVEL_HEADED_ID, 'SMARTS', 'D8');
INSERT INTO `edge_attribute_prerequisite` (edge, attribute_type, die_type) VALUES (@NERVES_OF_STEEL_ID, 'VIGOR', 'D8');
INSERT INTO `edge_attribute_prerequisite` (edge, attribute_type, die_type) VALUES (@QUICK_DRAW_ID, 'AGILITY', 'D8');
INSERT INTO `edge_attribute_prerequisite` (edge, attribute_type, die_type) VALUES (@STEADY_HANDS_ID, 'AGILITY', 'D8');
INSERT INTO `edge_attribute_prerequisite` (edge, attribute_type, die_type) VALUES (@SWEEP_ID, 'STRENGTH', 'D8');
INSERT INTO `edge_attribute_prerequisite` (edge, attribute_type, die_type) VALUES (@TWO_FISTED_ID, 'AGILITY', 'D8');
INSERT INTO `edge_attribute_prerequisite` (edge, attribute_type, die_type) VALUES (@COMMAND_ID, 'SMARTS', 'D6');
INSERT INTO `edge_attribute_prerequisite` (edge, attribute_type, die_type) VALUES (@FERVOR_ID, 'SPIRIT', 'D8');
INSERT INTO `edge_attribute_prerequisite` (edge, attribute_type, die_type) VALUES (@HOLD_THE_LINE_ID, 'SMARTS', 'D8');
INSERT INTO `edge_attribute_prerequisite` (edge, attribute_type, die_type) VALUES (@NATURAL_LEADER_ID, 'SPIRIT', 'D8');
INSERT INTO `edge_attribute_prerequisite` (edge, attribute_type, die_type) VALUES (@TACTICIAN_ID, 'SMARTS', 'D8');
INSERT INTO `edge_attribute_prerequisite` (edge, attribute_type, die_type) VALUES (@RAPID_RECHARGE_ID, 'SPIRIT', 'D6');
INSERT INTO `edge_attribute_prerequisite` (edge, attribute_type, die_type) VALUES (@ACE_ID, 'AGILITY', 'D8');
INSERT INTO `edge_attribute_prerequisite` (edge, attribute_type, die_type) VALUES (@ACROBAT_ID, 'AGILITY', 'D8');
INSERT INTO `edge_attribute_prerequisite` (edge, attribute_type, die_type) VALUES (@ACROBAT_ID, 'STRENGTH', 'D6');
INSERT INTO `edge_attribute_prerequisite` (edge, attribute_type, die_type) VALUES (@ASSASSIN_ID, 'AGILITY', 'D8');
INSERT INTO `edge_attribute_prerequisite` (edge, attribute_type, die_type) VALUES (@CHAMPION_ID, 'SPIRIT', 'D8');
INSERT INTO `edge_attribute_prerequisite` (edge, attribute_type, die_type) VALUES (@CHAMPION_ID, 'STRENGTH', 'D6');
INSERT INTO `edge_attribute_prerequisite` (edge, attribute_type, die_type) VALUES (@CHAMPION_ID, 'VIGOR', 'D8');
INSERT INTO `edge_attribute_prerequisite` (edge, attribute_type, die_type) VALUES (@GADGETEER_ID, 'SMARTS', 'D8');
INSERT INTO `edge_attribute_prerequisite` (edge, attribute_type, die_type) VALUES (@HOLY_UNHOLY_WARRIOR_ID, 'SPIRIT', 'D8');
INSERT INTO `edge_attribute_prerequisite` (edge, attribute_type, die_type) VALUES (@INVESTIGATOR_ID, 'SMARTS', 'D8');
INSERT INTO `edge_attribute_prerequisite` (edge, attribute_type, die_type) VALUES (@JACK_OF_ALL_TRADES_ID, 'SMARTS', 'D10');
INSERT INTO `edge_attribute_prerequisite` (edge, attribute_type, die_type) VALUES (@MCGUYVER_ID, 'SMARTS', 'D6');
INSERT INTO `edge_attribute_prerequisite` (edge, attribute_type, die_type) VALUES (@MENTALIST_ID, 'SMARTS', 'D8');
INSERT INTO `edge_attribute_prerequisite` (edge, attribute_type, die_type) VALUES (@MR_FIX_IT_ID, 'SMARTS', 'D10');
INSERT INTO `edge_attribute_prerequisite` (edge, attribute_type, die_type) VALUES (@THIEF_ID, 'AGILITY', 'D8');
INSERT INTO `edge_attribute_prerequisite` (edge, attribute_type, die_type) VALUES (@WIZARD_ID, 'SMARTS', 'D8');
INSERT INTO `edge_attribute_prerequisite` (edge, attribute_type, die_type) VALUES (@WOODSMAN_ID, 'SPIRIT', 'D6');
INSERT INTO `edge_attribute_prerequisite` (edge, attribute_type, die_type) VALUES (@CHARISMATIC_ID, 'SPIRIT', 'D8');
INSERT INTO `edge_attribute_prerequisite` (edge, attribute_type, die_type) VALUES (@COMMON_BOND_ID, 'SPIRIT', 'D8');
INSERT INTO `edge_attribute_prerequisite` (edge, attribute_type, die_type) VALUES (@BEAST_MASTER_ID, 'SPIRIT', 'D8');
INSERT INTO `edge_attribute_prerequisite` (edge, attribute_type, die_type) VALUES (@HEALER_ID, 'SPIRIT', 'D8');
INSERT INTO `edge_attribute_prerequisite` (edge, attribute_type, die_type) VALUES (@LIQUID_COURAGE_ID, 'VIGOR', 'D8');

-- edge prereqs
INSERT INTO `edge_prerequisites` (edge_id, prerequisite_edge_id) VALUES (@IMPROVED_ARCANE_RESISTANCE_ID, @ARCANE_RESISTANCE_ID);
INSERT INTO `edge_prerequisites` (edge_id, prerequisite_edge_id) VALUES (@VERY_ATTRACTIVE_ID, @ATTRACTIVE_ID);
INSERT INTO `edge_prerequisites` (edge_id, prerequisite_edge_id) VALUES (@GREAT_LUCK_ID, @LUCK_ID);
INSERT INTO `edge_prerequisites` (edge_id, prerequisite_edge_id) VALUES (@FILTHY_RICH_ID, @RICH_ID);
INSERT INTO `edge_prerequisites` (edge_id, prerequisite_edge_id) VALUES (@IMPROVED_BLOCK_ID, @BLOCK_ID);
INSERT INTO `edge_prerequisites` (edge_id, prerequisite_edge_id) VALUES (@BRUISER_ID, @BRAWLER_ID);
INSERT INTO `edge_prerequisites` (edge_id, prerequisite_edge_id) VALUES (@IMPROVED_COUNTERATTACK_ID, @COUNTERATTACK_ID);
INSERT INTO `edge_prerequisites` (edge_id, prerequisite_edge_id) VALUES (@IMPROVED_DODGE_ID, @DODGE_ID);
INSERT INTO `edge_prerequisites` (edge_id, prerequisite_edge_id) VALUES (@IMPROVED_EXTRACTION_ID, @EXTRACTION_ID);
INSERT INTO `edge_prerequisites` (edge_id, prerequisite_edge_id) VALUES (@IMPROVED_FIRST_STRIKE_ID, @FIRST_STRIKE_ID);
INSERT INTO `edge_prerequisites` (edge_id, prerequisite_edge_id) VALUES (@IMPROVED_FRENZY_ID, @FRENZY_ID);
INSERT INTO `edge_prerequisites` (edge_id, prerequisite_edge_id) VALUES (@HARDER_TO_KILL_ID, @HARD_TO_KILL_ID);
INSERT INTO `edge_prerequisites` (edge_id, prerequisite_edge_id) VALUES (@IMPROVED_LEVEL_HEADED_ID, @LEVEL_HEADED_ID);
INSERT INTO `edge_prerequisites` (edge_id, prerequisite_edge_id) VALUES (@IMPROVED_MARTIAL_ARTIST_ID, @MARTIAL_ARTIST_ID);
INSERT INTO `edge_prerequisites` (edge_id, prerequisite_edge_id) VALUES (@IMPROVED_NERVES_OF_STEEL_ID, @NERVES_OF_STEEL_ID);
INSERT INTO `edge_prerequisites` (edge_id, prerequisite_edge_id) VALUES (@IMPROVED_SWEEP_ID, @SWEEP_ID);
INSERT INTO `edge_prerequisites` (edge_id, prerequisite_edge_id) VALUES (@IMPROVED_TRADEMARK_WEAPON_ID, @TRADEMARK_WEAPON_ID);
INSERT INTO `edge_prerequisites` (edge_id, prerequisite_edge_id) VALUES (@COMMAND_PRESENCE_ID, @COMMAND_ID);
INSERT INTO `edge_prerequisites` (edge_id, prerequisite_edge_id) VALUES (@FERVOR_ID, @COMMAND_ID);
INSERT INTO `edge_prerequisites` (edge_id, prerequisite_edge_id) VALUES (@HOLD_THE_LINE_ID, @COMMAND_ID);
INSERT INTO `edge_prerequisites` (edge_id, prerequisite_edge_id) VALUES (@INSPIRE_ID, @COMMAND_ID);
INSERT INTO `edge_prerequisites` (edge_id, prerequisite_edge_id) VALUES (@LEADER_OF_MEN_ID, @COMMAND_ID);
INSERT INTO `edge_prerequisites` (edge_id, prerequisite_edge_id) VALUES (@NATURAL_LEADER_ID, @COMMAND_ID);
INSERT INTO `edge_prerequisites` (edge_id, prerequisite_edge_id) VALUES (@TACTICIAN_ID, @COMMAND_ID);
INSERT INTO `edge_prerequisites` (edge_id, prerequisite_edge_id) VALUES (@NEW_POWER_ID, @ARCANE_BACKGROUND_MAGIC_ID);
INSERT INTO `edge_prerequisites` (edge_id, prerequisite_edge_id) VALUES (@NEW_POWER_ID, @ARCANE_BACKGROUND_PSIONICS_ID);
INSERT INTO `edge_prerequisites` (edge_id, prerequisite_edge_id) VALUES (@NEW_POWER_ID, @ARCANE_BACKGROUND_MIRACLES_ID);
INSERT INTO `edge_prerequisites` (edge_id, prerequisite_edge_id) VALUES (@NEW_POWER_ID, @ARCANE_BACKGROUND_SUPER_POWERS_ID);
INSERT INTO `edge_prerequisites` (edge_id, prerequisite_edge_id) VALUES (@NEW_POWER_ID, @ARCANE_BACKGROUND_WEIRD_SCIENCE_ID);
INSERT INTO `edge_prerequisites` (edge_id, prerequisite_edge_id) VALUES (@POWER_POINTS_ID, @ARCANE_BACKGROUND_MAGIC_ID);
INSERT INTO `edge_prerequisites` (edge_id, prerequisite_edge_id) VALUES (@POWER_POINTS_ID, @ARCANE_BACKGROUND_PSIONICS_ID);
INSERT INTO `edge_prerequisites` (edge_id, prerequisite_edge_id) VALUES (@POWER_POINTS_ID, @ARCANE_BACKGROUND_MIRACLES_ID);
INSERT INTO `edge_prerequisites` (edge_id, prerequisite_edge_id) VALUES (@POWER_POINTS_ID, @ARCANE_BACKGROUND_SUPER_POWERS_ID);
INSERT INTO `edge_prerequisites` (edge_id, prerequisite_edge_id) VALUES (@POWER_POINTS_ID, @ARCANE_BACKGROUND_WEIRD_SCIENCE_ID);
INSERT INTO `edge_prerequisites` (edge_id, prerequisite_edge_id) VALUES (@RAPID_RECHARGE_ID, @ARCANE_BACKGROUND_MAGIC_ID);
INSERT INTO `edge_prerequisites` (edge_id, prerequisite_edge_id) VALUES (@RAPID_RECHARGE_ID, @ARCANE_BACKGROUND_PSIONICS_ID);
INSERT INTO `edge_prerequisites` (edge_id, prerequisite_edge_id) VALUES (@RAPID_RECHARGE_ID, @ARCANE_BACKGROUND_MIRACLES_ID);
INSERT INTO `edge_prerequisites` (edge_id, prerequisite_edge_id) VALUES (@RAPID_RECHARGE_ID, @ARCANE_BACKGROUND_SUPER_POWERS_ID);
INSERT INTO `edge_prerequisites` (edge_id, prerequisite_edge_id) VALUES (@RAPID_RECHARGE_ID, @ARCANE_BACKGROUND_WEIRD_SCIENCE_ID);
INSERT INTO `edge_prerequisites` (edge_id, prerequisite_edge_id) VALUES (@IMPROVED_RAPID_RECHARGE_ID, @RAPID_RECHARGE_ID);
INSERT INTO `edge_prerequisites` (edge_id, prerequisite_edge_id) VALUES (@SOUL_DRAIN_ID, @ARCANE_BACKGROUND_MAGIC_ID);
INSERT INTO `edge_prerequisites` (edge_id, prerequisite_edge_id) VALUES (@SOUL_DRAIN_ID, @ARCANE_BACKGROUND_PSIONICS_ID);
INSERT INTO `edge_prerequisites` (edge_id, prerequisite_edge_id) VALUES (@SOUL_DRAIN_ID, @ARCANE_BACKGROUND_MIRACLES_ID);
INSERT INTO `edge_prerequisites` (edge_id, prerequisite_edge_id) VALUES (@SOUL_DRAIN_ID, @ARCANE_BACKGROUND_SUPER_POWERS_ID);
INSERT INTO `edge_prerequisites` (edge_id, prerequisite_edge_id) VALUES (@ADEPT_ID, @ARCANE_BACKGROUND_MIRACLES_ID);
INSERT INTO `edge_prerequisites` (edge_id, prerequisite_edge_id) VALUES (@ADEPT_ID, @MARTIAL_ARTIST_ID);
INSERT INTO `edge_prerequisites` (edge_id, prerequisite_edge_id) VALUES (@CHAMPION_ID, @ARCANE_BACKGROUND_MIRACLES_ID);
INSERT INTO `edge_prerequisites` (edge_id, prerequisite_edge_id) VALUES (@GADGETEER_ID, @ARCANE_BACKGROUND_WEIRD_SCIENCE_ID);
INSERT INTO `edge_prerequisites` (edge_id, prerequisite_edge_id) VALUES (@HOLY_UNHOLY_WARRIOR_ID, @ARCANE_BACKGROUND_MIRACLES_ID);
INSERT INTO `edge_prerequisites` (edge_id, prerequisite_edge_id) VALUES (@MENTALIST_ID, @ARCANE_BACKGROUND_PSIONICS_ID);
INSERT INTO `edge_prerequisites` (edge_id, prerequisite_edge_id) VALUES (@MR_FIX_IT_ID, @ARCANE_BACKGROUND_WEIRD_SCIENCE_ID);
INSERT INTO `edge_prerequisites` (edge_id, prerequisite_edge_id) VALUES (@WIZARD_ID, @ARCANE_BACKGROUND_MAGIC_ID);
INSERT INTO `edge_prerequisites` (edge_id, prerequisite_edge_id) VALUES (@MARTIAL_ARTS_MASTER_ID, @IMPROVED_MARTIAL_ARTIST_ID);
INSERT INTO `edge_prerequisites` (edge_id, prerequisite_edge_id) VALUES (@EXPERT_ID, @PROFESSIONAL_ID);
INSERT INTO `edge_prerequisites` (edge_id, prerequisite_edge_id) VALUES (@MASTER_ID, @EXPERT_ID);
INSERT INTO `edge_prerequisites` (edge_id, prerequisite_edge_id) VALUES (@IMPROVED_TOUGH_AS_NAILS_ID, @TOUGH_AS_NAILS_ID);
INSERT INTO `edge_prerequisites` (edge_id, prerequisite_edge_id) VALUES (@MASTER_OF_ARMS_ID, @WEAPON_MASTER_ID);



INSERT INTO `sql_files` (`sql_file_name`, `run_date`) VALUES ('14.sql', NOW());


