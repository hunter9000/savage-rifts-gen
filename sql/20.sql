USE savage_rifts;

CREATE TABLE `race_ability_attr_default` (
	`id` BIGINT(20) NOT NULL AUTO_INCREMENT,
	 BIGINT(20) NOT NULL,
	`attr_type` VARCHAR(255) NOT NULL,

	PRIMARY KEY (`id`),
	INDEX `FK_race_ability_attr_adjustment__race_ability` (),
	CONSTRAINT `FK_race_ability_attr_adjustment__race_ability` FOREIGN KEY () REFERENCES  (`id`)
) COLLATE='utf8_general_ci' ENGINE=InnoDB;

CREATE TABLE `race_ability_hindrance` (
	`id` BIGINT(20) NOT NULL AUTO_INCREMENT,
	 BIGINT(20) NOT NULL,
	`hindrance` BIGINT(20) NOT NULL,

	PRIMARY KEY (`id`),
	INDEX `FK_race_ability_attr_adjustment__race_ability` (),
	INDEX `FK_race_ability_attr_adjustment__hindrance` (`hindrance`),
	CONSTRAINT `FK_race_ability_attr_adjustment__race_ability` FOREIGN KEY () REFERENCES  (`id`),
	CONSTRAINT `FK_race_ability_attr_adjustment__hindrance` FOREIGN KEY (`hindrance`) REFERENCES `hindrance` (`id`)
) COLLATE='utf8_general_ci' ENGINE=InnoDB;



SELECT @ALTARA_ID:=id FROM race WHERE type = 'ALTARA';
SELECT @DNORR_ID:=id FROM race WHERE type = 'D_NORR';
SELECT @DOGBOY_ID:=id FROM race WHERE type = 'DOG_BOY';
SELECT @FENNODI_ID:=id FROM race WHERE type = 'FENNODI';
SELECT @QUICKFLEX_ID:=id FROM race WHERE type = 'QUICK_FLEX';
SELECT @PSISTALKER_ID:=id FROM race WHERE type = 'PSI_STALKER';
SELECT @GRACKLETOOTH_ID:=id FROM race WHERE type = 'GRACKLE_TOOTH';
SELECT @LYNSRIAL_ID:=id FROM race WHERE type = 'LYN_SRIAL';
SELECT @TRIMADORE_ID:=id FROM race WHERE type = 'TRIMADORE';
SELECT @SIMVAN_ID:=id FROM race WHERE type = 'SIMVAN';


INSERT INTO `race_ability` (race, race_ability_type, name, description) VALUES (@ALTARA_ID, 'ALTARA_ATTRACTIVE', 'Attractive', ' The forced-evolution process administered to the Warrior Women includes genetically engineering them for beauty. Altara have the Attractive Edge. ');
SET @ALTARA_ATTRACTIVE_ID = LAST_INSERT_ID();
INSERT INTO `race_ability` (race, race_ability_type, name, description) VALUES (@ALTARA_ID, 'ALTARA_BAD_REPUTATION', 'Bad Reputation', ' The Altara Warrior Women are infamous as servants of Splugorth Slavers worldwide. The average person hates and fears Altara; they suffer a -4 Charisma penalty with most folks who discover who and what they are. ');
SET @ALTARA_BAD_REPUTATION_ID = LAST_INSERT_ID();
INSERT INTO `race_ability` (race, race_ability_type, name, description) VALUES (@ALTARA_ID, 'ALTARA_BLIND', 'Blind', ' Although created blind, this is only a minor drawback for the Altara, as they have a natural radar ability extending 1,200 feet (200”) which compensates for the penalties. They cannot read, see colors, or otherwise detect purely visual information. ');
SET @ALTARA_BLIND_ID = LAST_INSERT_ID();
INSERT INTO `race_ability` (race, race_ability_type, name, description) VALUES (@ALTARA_ID, 'ALTARA_GENETIC_ENGINEERING', 'Genetic Engineering', ' Crafted through bio-wizardry to be perfect warriors, Altara begin with a starting Agility, Strength, and Vigor of d6. This increases their natural maximums in these attributes to d12+1. ');
SET @ALTARA_GENETIC_ENGINEERING_ID = LAST_INSERT_ID();
INSERT INTO `race_ability` (race, race_ability_type, name, description) VALUES (@ALTARA_ID, 'ALTARA_INSTILLED_IGNORANCE', 'Instilled Ignorance', ' Altara are taught only what they need to serve their masters, and extreme brainwashing is used to dampen their intellectual acumen. This leaves them woefully under-educated and naive about the world at large. They suffer a -2 to all Smarts rolls. ');
SET @ALTARA_INSTILLED_IGNORANCE_ID = LAST_INSERT_ID();
INSERT INTO `race_ability` (race, race_ability_type, name, description) VALUES (@ALTARA_ID, 'ALTARA_STORM_FOULED_SENSES', 'Storm-Fouled Senses', ' In strong inclement weather, or conditions where the environment is greatly disturbed (sand storms, fires with lots of smoke), the Altara suffer a -2 penalty to Notice, Fighting, Shooting, and Throwing. ');
SET @ALTARA_STORM_FOULED_SENSES_ID = LAST_INSERT_ID();
INSERT INTO `race_ability` (race, race_ability_type, name, description) VALUES (@ALTARA_ID, 'ALTARA_SUPERIOR_SENSES', 'Superior Senses', ' Altara Warrior Women begin with the Alertness Edge, as all of their other senses are exceptional. ');
SET @ALTARA_SUPERIOR_SENSES_ID = LAST_INSERT_ID();
INSERT INTO `race_ability` (race, race_ability_type, name, description) VALUES (@ALTARA_ID, 'ALTARA_WANTED_MINOR', 'Wanted (Minor)', ' Any Minion of Splugorth, including most other Altara Warrior Women, attack to capture or kill a rogue Altara in an instant. ');
SET @ALTARA_WANTED_MINOR_ID = LAST_INSERT_ID();
INSERT INTO `race_ability` (race, race_ability_type, name, description) VALUES (@DNORR_ID, 'DNORR_DISTINCTIVE_D_BEE', 'Distinctive D-Bee', ' Unless they hide their non-human (and devilish) appearance, D\'Norr face a certain amount of prejudice from the Coalition. They suffer a -4 Charisma when dealing with such people. ');
SET @DNORR_DISTINCTIVE_D_BEE_ID = LAST_INSERT_ID();
INSERT INTO `race_ability` (race, race_ability_type, name, description) VALUES (@DNORR_ID, 'DNORR_INTELLIGENT_AND_SPIRITUAL', 'Intelligent and Spiritual', ' D\'Norr are highly intelligent and spiritual, beginning with a d6 Smarts and Spirit. This makes their natural maximums for those Traits d12+1. ');
SET @DNORR_INTELLIGENT_AND_SPIRITUAL_ID = LAST_INSERT_ID();
INSERT INTO `race_ability` (race, race_ability_type, name, description) VALUES (@DNORR_ID, 'DNORR_NATURAL_ARCANE_AFFINITY', 'Natural Arcane Affinity', ' The D\'Norr have +5 PPE naturally, whether they pursue a magical path or not. ');
SET @DNORR_NATURAL_ARCANE_AFFINITY_ID = LAST_INSERT_ID();
INSERT INTO `race_ability` (race, race_ability_type, name, description) VALUES (@DNORR_ID, 'DNORR_PERSONABLE', 'Personable', ' The D\'Norr are highly charming and easy to get along with. They have +1 Charisma. ');
SET @DNORR_PERSONABLE_ID = LAST_INSERT_ID();
INSERT INTO `race_ability` (race, race_ability_type, name, description) VALUES (@DNORR_ID, 'DNORR_RESTRICTED_PATH', 'Restricted Path', ' The D\'Norr have no capacity for psionics and cannot access ISP. ');
SET @DNORR_RESTRICTED_PATH_ID = LAST_INSERT_ID();
INSERT INTO `race_ability` (race, race_ability_type, name, description) VALUES (@DNORR_ID, 'DNORR_SENSITIVE', 'Sensitive', ' Due to their inherently sensitive and compassionate nature, D\'Norr are particularly susceptible to Fear, suffering a -2 whenever making checks against such situations. ');
SET @DNORR_SENSITIVE_ID = LAST_INSERT_ID();
INSERT INTO `race_ability` (race, race_ability_type, name, description) VALUES (@DOGBOY_ID, 'DOGBOY_BREED_ADVANTAGE', 'Breed Advantage', ' A Dog Boy begins with the Breed Advantage Edge (see sidebar). The player decides what breed (or breeds) the character is influenced by. After creation, the Dog Boy may take the Edge again at Novice Rank. ');
SET @DOGBOY_BREED_ADVANTAGE_ID = LAST_INSERT_ID();
INSERT INTO `race_ability` (race, race_ability_type, name, description) VALUES (@DOGBOY_ID, 'DOGBOY_KEEN_SENSE_OF_SMELL', 'Keen Sense of Smell', ' Dog Boys have a sense of smell similar to their canine counterparts. They gain a +2 bonus on Notice checks based on smell, as well as +2 on all Tracking rolls. ');
SET @DOGBOY_KEEN_SENSE_OF_SMELL_ID = LAST_INSERT_ID();
INSERT INTO `race_ability` (race, race_ability_type, name, description) VALUES (@DOGBOY_ID, 'DOGBOY_NATURAL_WEAPONS', 'Natural Weapons', ' Dog Boys bite for Str+d6 damage. ');
SET @DOGBOY_NATURAL_WEAPONS_ID = LAST_INSERT_ID();
INSERT INTO `race_ability` (race, race_ability_type, name, description) VALUES (@DOGBOY_ID, 'DOGBOY_OUTSIDER', 'Outsider', ' Dog Boys are awkward around human populations, and people outside the CS may be frightened of them because they are so closely identified with that regime. They have the Outsider Hindrance and a -2 Charisma with everyone except other Dog Boys. ');
SET @DOGBOY_OUTSIDER_ID = LAST_INSERT_ID();
INSERT INTO `race_ability` (race, race_ability_type, name, description) VALUES (@DOGBOY_ID, 'DOGBOY_PSYCHIC_SENSE', 'Psychic Sense', ' Dog Boys have the inherent ability to detect arcana, interpreting it as a scent. They use the Notice skill (with their Keen Sense of Smell bonus) to detect the presence and location of psychic or magic energies, beings, or items. They can also use the Tracking skill (also with the Keen Sense of Smell bonus) to follow a specific magical or psionic entity. This sense works to detect anything psychic, magic, or supernatural, including invisible and astral beings. Psychic Sense doesn’t work inside sealed armor or vehicles. Cybernetic implants also cause problems; every point of Strain imposes a -1 penalty when the Dog Boy uses his Psychic Sense (the Cyber-Psychic Alignment Edge can negate this penalty). See sidebar on page 60. ');
SET @DOGBOY_PSYCHIC_SENSE_ID = LAST_INSERT_ID();
INSERT INTO `race_ability` (race, race_ability_type, name, description) VALUES (@DOGBOY_ID, 'DOGBOY_RESTRICTED_PATHS', 'Restricted Paths', ' Inherent psionic limitations make arcane magic impossible. Dog Boys cannot take any Arcane Background using PPE, nor any Iconic Framework that includes it. ');
SET @DOGBOY_RESTRICTED_PATHS_ID = LAST_INSERT_ID();
INSERT INTO `race_ability` (race, race_ability_type, name, description) VALUES (@DOGBOY_ID, 'DOGBOY_WANTED_HINDRANCE_MINOR', 'Wanted Hindrance (Minor)', ' Dog Boys operating outside of CS control are wanted by the Coalition, and there’s always a fair bounty for bringing one in. ');
SET @DOGBOY_WANTED_HINDRANCE_MINOR_ID = LAST_INSERT_ID();
INSERT INTO `race_ability` (race, race_ability_type, name, description) VALUES (@DOGBOY_ID, 'DOGBOY_WEAKNESS_LEY_LINE_HYPERSENSITIVITY', 'Weakness (Ley Line Hypersensitivity)', ' Dog Boys lose their Psychic Sense on or close (within 2” or 4 yards) to a ley line. Ley Line storms cause a level of Fatigue from severe headaches and distress as for a psychic (which does not stack if they have the Arcane Background), but their Fatigue requires an hour to recover after the storm ends. ');
SET @DOGBOY_WEAKNESS_LEY_LINE_HYPERSENSITIVITY_ID = LAST_INSERT_ID();
INSERT INTO `race_ability` (race, race_ability_type, name, description) VALUES (@FENNODI_ID, 'FENNODI_DISTINCTIVE_D_BEE', 'Distinctive D-Bee', ' With their nonhuman appearance and inherent psionic ability, Fennodi face prejudice from the Coalition. They suffer -4 Charisma when dealing with CS citizens. ');
SET @FENNODI_DISTINCTIVE_D_BEE_ID = LAST_INSERT_ID();
INSERT INTO `race_ability` (race, race_ability_type, name, description) VALUES (@FENNODI_ID, 'FENNODI_INFRAVISION', 'Infravision', ' Fennodi see in the infrared spectrum. They halve lighting penalties when fighting anything radiating heat. ');
SET @FENNODI_INFRAVISION_ID = LAST_INSERT_ID();
INSERT INTO `race_ability` (race, race_ability_type, name, description) VALUES (@FENNODI_ID, 'FENNODI_ISSUES_WITH_COLD', 'Issues With Cold', ' The Fennodi prefer the prairies and deserts of the New West for a reason. They suffer -4 to resist cold environment effects, and cold-based attacks do +4 damage to them. ');
SET @FENNODI_ISSUES_WITH_COLD_ID = LAST_INSERT_ID();
INSERT INTO `race_ability` (race, race_ability_type, name, description) VALUES (@FENNODI_ID, 'FENNODI_NATURAL_PSIONICS', 'Natural Psionics', ' Fennodi begin with the Arcane Background (Psionics) Edge, and start with the following three powers:  armor, intangibility, and telepathy. If a Fennodi chooses an Iconic Framework providing Arcane Background (Psionics), he follows all the normal rules for the Framework except three of his starting powers are the ones listed above (even if not normally allowed to that Framework). The Fennodi gains one additional power to his starting total (e.g., a Fennodi Burster starts with four powers, a Mind Melter with six). ');
SET @FENNODI_NATURAL_PSIONICS_ID = LAST_INSERT_ID();
INSERT INTO `race_ability` (race, race_ability_type, name, description) VALUES (@FENNODI_ID, 'FENNODI_VISUAL_ACUITY', 'Visual Acuity', ' The Fennodi’s wider range of vision provides +2 to sight-based Notice checks. ');
SET @FENNODI_VISUAL_ACUITY_ID = LAST_INSERT_ID();
INSERT INTO `race_ability` (race, race_ability_type, name, description) VALUES (@QUICKFLEX_ID, 'QUICKFLEX_AGILE', 'Agile', ' Quick-Flex start with a d8 Agility (and a Trait maximum of d12+2).');
SET @QUICKFLEX_AGILE_ID = LAST_INSERT_ID();
INSERT INTO `race_ability` (race, race_ability_type, name, description) VALUES (@QUICKFLEX_ID, 'QUICKFLEX_AMBIDEXTERITY', 'Ambidexterity', ' All Quick-Flex possess the Ambidextrous Edge.');
SET @QUICKFLEX_AMBIDEXTERITY_ID = LAST_INSERT_ID();
INSERT INTO `race_ability` (race, race_ability_type, name, description) VALUES (@QUICKFLEX_ID, 'QUICKFLEX_DISTINCTIVE_D_BEE', 'Distinctive D-Bee', ' Unless they hide their non-human appearance, a Quick-Flex faces prejudice from the Coalition. They suffer -4 Charisma with such folks.');
SET @QUICKFLEX_DISTINCTIVE_D_BEE_ID = LAST_INSERT_ID();
INSERT INTO `race_ability` (race, race_ability_type, name, description) VALUES (@QUICKFLEX_ID, 'QUICKFLEX_ELUSIVE', 'Elusive', ' Quick-Flex are difficult to pin down in close quarters, giving them a natural +1 to their Parry rating. ');
SET @QUICKFLEX_ELUSIVE_ID = LAST_INSERT_ID();
INSERT INTO `race_ability` (race, race_ability_type, name, description) VALUES (@QUICKFLEX_ID, 'QUICKFLEX_FAST', 'Fast', ' Quick-Flex have +2 to Pace and increase their Running die by one die type (usually a Pace of 8 and d8 Running die).');
SET @QUICKFLEX_FAST_ID = LAST_INSERT_ID();
INSERT INTO `race_ability` (race, race_ability_type, name, description) VALUES (@QUICKFLEX_ID, 'QUICKFLEX_RESTRICTED_PATH', 'Restricted Path', ' Their natural hyperactivity and lack of focus makes the pursuit of any magical Arcane Backgrounds impossible for them. Quick-Flex cannot access PPE. The race cannot take any Arcane Background which uses PPE or any Iconic Framework which includes such an Arcane Background. ');
SET @QUICKFLEX_RESTRICTED_PATH_ID = LAST_INSERT_ID();
INSERT INTO `race_ability` (race, race_ability_type, name, description) VALUES (@QUICKFLEX_ID, 'QUICKFLEX_SHORT_ATTENTION_SPAN', 'Short Attention Span', ' Quick-Flex have a difficult time sitting still and focusing on intellectual pursuits. They suffer a -1 to all Smarts rolls.');
SET @QUICKFLEX_SHORT_ATTENTION_SPAN_ID = LAST_INSERT_ID();
INSERT INTO `race_ability` (race, race_ability_type, name, description) VALUES (@QUICKFLEX_ID, 'QUICKFLEX_SUPREME_CONFIDENCE', 'Supreme Confidence', ' All Quick-Flex are inherently Overconfident in addition to any Hindrances chosen by the player.');
SET @QUICKFLEX_SUPREME_CONFIDENCE_ID = LAST_INSERT_ID();
INSERT INTO `race_ability` (race, race_ability_type, name, description) VALUES (@PSISTALKER_ID, 'PSISTALKER_AMBIDEXTERITY', 'Ambidexterity', ' Psi-Stalkers have the Ambidextrous Edge. ');
SET @PSISTALKER_AMBIDEXTERITY_ID = LAST_INSERT_ID();
INSERT INTO `race_ability` (race, race_ability_type, name, description) VALUES (@PSISTALKER_ID, 'PSISTALKER_ANIMAL_EMPATHY', 'Animal Empathy', ' Psi-Stalkers have an inherent empathy with animals. They start with Riding d6 and animals treat them as one of their own. This effect can be problematic if the animal in question is a territorial loner. ');
SET @PSISTALKER_ANIMAL_EMPATHY_ID = LAST_INSERT_ID();
INSERT INTO `race_ability` (race, race_ability_type, name, description) VALUES (@PSISTALKER_ID, 'PSISTALKER_FAST', 'Fast', ' Psi-Stalkers have Pace +2 and increase their Running die by one die type (usually Pace 8 and d8 run die). ');
SET @PSISTALKER_FAST_ID = LAST_INSERT_ID();
INSERT INTO `race_ability` (race, race_ability_type, name, description) VALUES (@PSISTALKER_ID, 'PSISTALKER_OUTSIDER', 'Outsider', ' Psi-Stalkers are creepy and off-putting, and make those with magic or psionic abilities especially nervous (for obvious reasons). They are barely more than a slave class in the Coalition and despised in the Federation of Magic. They suffer -2 Charisma with everyone except others of their kind. ');
SET @PSISTALKER_OUTSIDER_ID = LAST_INSERT_ID();
INSERT INTO `race_ability` (race, race_ability_type, name, description) VALUES (@PSISTALKER_ID, 'PSISTALKER_PSYCHIC_SENSE', 'Psychic Sense', ' Psi-Stalkers have the inherent ability to detect arcana, usable at will. They use the Notice skill to detect the presence and location of any psychic or magic energies, beings, or items. They can also use the Tracking skill to track a specific magical or psionic entity. This sense works to detect anything psychic, magic, or supernatural, including invisible and astral beings. Psychic Sense doesn’t work inside sealed armor or vehicles. Cybernetic implants also cause problems; every point of Strain imposes a -1 penalty when the Psi-Stalker uses his Psychic Sense (the Cyber-Psychic Alignment Edge can negate this penalty). See sidebar on the next page. ');
SET @PSISTALKER_PSYCHIC_SENSE_ID = LAST_INSERT_ID();
INSERT INTO `race_ability` (race, race_ability_type, name, description) VALUES (@PSISTALKER_ID, 'PSISTALKER_PSYCHIC_VAMPIRE', 'Psychic Vampire', ' Psi-Stalkers require a diet of PPE or ISP drained from living beings. They gain this using the Draining PPE/ ISP rules (page 121), which only works by touch. The Psi-Stalker must cut and draw blood from her intended victim or donor (which must be supernaturally, magically, or psionically active to provide sustenance). Psi-Stalkers must consume at least 5 Power Points (PPE or ISP) a day or suffer Fatigue. They starve to death after a week of being Incapacitated by lack of “food.” Each 5 PPE/ISP drained restores one level of Fatigue. Consumed Power Points cannot be used to fuel spells or psionic powers. ');
SET @PSISTALKER_PSYCHIC_VAMPIRE_ID = LAST_INSERT_ID();
INSERT INTO `race_ability` (race, race_ability_type, name, description) VALUES (@PSISTALKER_ID, 'PSISTALKER_RACIAL_ENEMY', 'Racial Enemy', ' Many Psi-Stalker and Simvan tribes have been at war for years. Meetings between the species start argumentative and get worse. Psi-Stalkers suffer -4 Charisma with Simvan. ');
SET @PSISTALKER_RACIAL_ENEMY_ID = LAST_INSERT_ID();
INSERT INTO `race_ability` (race, race_ability_type, name, description) VALUES (@PSISTALKER_ID, 'PSISTALKER_RESTRICTED_PATHS', 'Restricted Paths', ' Working arcane magic is impossible for Psi-Stalkers. They cannot take any Arcane Background using PPE, nor any Iconic Framework that includes it. ');
SET @PSISTALKER_RESTRICTED_PATHS_ID = LAST_INSERT_ID();
INSERT INTO `race_ability` (race, race_ability_type, name, description) VALUES (@GRACKLETOOTH_ID, 'GRACKLETOOTH_CYBER_RESISTANT', 'Cyber Resistant', ' Grackles cannot take any Iconic Framework that includes cybernetics as an inherent ability (including the bio-comp system needed to be a Juicer), nor may they roll on the Cybernetics benefits table. ');
SET @GRACKLETOOTH_CYBER_RESISTANT_ID = LAST_INSERT_ID();
INSERT INTO `race_ability` (race, race_ability_type, name, description) VALUES (@GRACKLETOOTH_ID, 'GRACKLETOOTH_DISTINCTIVE_D_BEE', 'Distinctive D-Bee', ' With their monstrous appearance and powerful frames, Grackles face prejudice. They suffer -4 Charisma with CS citizens. ');
SET @GRACKLETOOTH_DISTINCTIVE_D_BEE_ID = LAST_INSERT_ID();
INSERT INTO `race_ability` (race, race_ability_type, name, description) VALUES (@GRACKLETOOTH_ID, 'GRACKLETOOTH_ISSUES_WITH_COLD', 'Issues With Cold', ' Grackles don’t enjoy the cold. They suffer -4 to resist cold environment effects and take +4 damage from cold-based attacks. ');
SET @GRACKLETOOTH_ISSUES_WITH_COLD_ID = LAST_INSERT_ID();
INSERT INTO `race_ability` (race, race_ability_type, name, description) VALUES (@GRACKLETOOTH_ID, 'GRACKLETOOTH_JUST_HOW_I_WAS_RAISED', '“Just How I Was Raised”', ' Grackles have the Heroic or Overconfident Hindrance for no additional points (the other may be chosen as normal). ');
SET @GRACKLETOOTH_JUST_HOW_I_WAS_RAISED_ID = LAST_INSERT_ID();
INSERT INTO `race_ability` (race, race_ability_type, name, description) VALUES (@GRACKLETOOTH_ID, 'GRACKLETOOTH_NATURAL_WEAPONS', 'Natural Weapons', ' Grackles do Str+d6 damage with their bite, claws, or tail slap. ');
SET @GRACKLETOOTH_NATURAL_WEAPONS_ID = LAST_INSERT_ID();
INSERT INTO `race_ability` (race, race_ability_type, name, description) VALUES (@GRACKLETOOTH_ID, 'GRACKLETOOTH_POWERFUL', 'Powerful', ' Grackles start with Strength d8 (Trait maximum d12+2) and Vigor d6 (Trait maximum d12+1). ');
SET @GRACKLETOOTH_POWERFUL_ID = LAST_INSERT_ID();
INSERT INTO `race_ability` (race, race_ability_type, name, description) VALUES (@GRACKLETOOTH_ID, 'GRACKLETOOTH_PREHENSILE_TAIL', 'Prehensile Tail', ' A Grackle’s tail can hold most melee weapons and pistols, granting an extra non-movement action per round at no multi-action penalty. ');
SET @GRACKLETOOTH_PREHENSILE_TAIL_ID = LAST_INSERT_ID();
INSERT INTO `race_ability` (race, race_ability_type, name, description) VALUES (@GRACKLETOOTH_ID, 'GRACKLETOOTH_RESTRICTED_PATHS', 'Restricted Paths', ' A Grackle Tooth has no capacity for magic or psionics. They cannot take any Arcane Background using PPE or ISP, nor any Iconic Framework that includes it. ');
SET @GRACKLETOOTH_RESTRICTED_PATHS_ID = LAST_INSERT_ID();
INSERT INTO `race_ability` (race, race_ability_type, name, description) VALUES (@GRACKLETOOTH_ID, 'GRACKLETOOTH_STUFF_AINT_BUILT_FOR_ME', '“Stuff Ain’t Built for Me”', ' A Grackle Tooth’s unique physiology and proportions make it difficult for him to find armor he can use. Purchases and repairs are at least tripled in cost, and there’s no way he can manage a Glitter Boy suit or any other power armor built for a normal-sized humanoid frame. He also suffers a -2 to any checks made to operate a vehicle or its weapons not refitted for his race. Any gear gained from an Iconic Framework is assumed to be custom-built for the character. ');
SET @GRACKLETOOTH_STUFF_AINT_BUILT_FOR_ME_ID = LAST_INSERT_ID();
INSERT INTO `race_ability` (race, race_ability_type, name, description) VALUES (@GRACKLETOOTH_ID, 'GRACKLETOOTH_SIZE_2', 'Size +2', ' Grackles run eight to 10 feet tall and weigh from 600 – 800 lbs. Their size grants them +2 Toughness. ');
SET @GRACKLETOOTH_SIZE_2_ID = LAST_INSERT_ID();
INSERT INTO `race_ability` (race, race_ability_type, name, description) VALUES (@LYNSRIAL_ID, 'LYNSRIAL_CYBER_RESISTANT', 'Cyber Resistant', ' Lyn-Srial can’t take cybernetics of any kind. ');
SET @LYNSRIAL_CYBER_RESISTANT_ID = LAST_INSERT_ID();
INSERT INTO `race_ability` (race, race_ability_type, name, description) VALUES (@LYNSRIAL_ID, 'LYNSRIAL_DISTINCTIVE_D_BEE', 'Distinctive D-Bee', ' Lyn-Srial suffer -4 Charisma with CS citizens. ');
SET @LYNSRIAL_DISTINCTIVE_D_BEE_ID = LAST_INSERT_ID();
INSERT INTO `race_ability` (race, race_ability_type, name, description) VALUES (@LYNSRIAL_ID, 'LYNSRIAL_FLIGHT', 'Flight', ' Lyn-Srial fly at Pace +6 (12). ');
SET @LYNSRIAL_FLIGHT_ID = LAST_INSERT_ID();
INSERT INTO `race_ability` (race, race_ability_type, name, description) VALUES (@LYNSRIAL_ID, 'LYNSRIAL_FOUR_ARMS', 'Four Arms', ' Extra arms grant an additional non-movement action each round at no multi-action penalty. ');
SET @LYNSRIAL_FOUR_ARMS_ID = LAST_INSERT_ID();
INSERT INTO `race_ability` (race, race_ability_type, name, description) VALUES (@LYNSRIAL_ID, 'LYNSRIAL_HUNTED_BY_THE_COALITION', 'Hunted by the Coalition', ' Lyn-Srial have the Wanted (Major) Hindrance with the CS for saving refugees of the Tolkeen war. ');
SET @LYNSRIAL_HUNTED_BY_THE_COALITION_ID = LAST_INSERT_ID();
INSERT INTO `race_ability` (race, race_ability_type, name, description) VALUES (@LYNSRIAL_ID, 'LYNSRIAL_INHERENT_NATURE', 'Inherent Nature', ' All Lyn-Srial have the Heroic Hindrance and count as supernaturally good. ');
SET @LYNSRIAL_INHERENT_NATURE_ID = LAST_INSERT_ID();
INSERT INTO `race_ability` (race, race_ability_type, name, description) VALUES (@LYNSRIAL_ID, 'LYNSRIAL_LOW_LIGHT_VISION', 'Low Light Vision', ' Lyn-Srial ignore penalties for Dim and Dark lighting. ');
SET @LYNSRIAL_LOW_LIGHT_VISION_ID = LAST_INSERT_ID();
INSERT INTO `race_ability` (race, race_ability_type, name, description) VALUES (@LYNSRIAL_ID, 'LYNSRIAL_NON_STANDARD_PHYSIOLOGY', 'Non-Standard Physiology', ' Armor purchase/repair is double cost. Can’t use a Glitter Boy suit or other standard humanoid power armor. Suffer a -2 to operate a vehicle or its weapons not refitted for the race. Iconic Framework gear is custom-built. ');
SET @LYNSRIAL_NON_STANDARD_PHYSIOLOGY_ID = LAST_INSERT_ID();
INSERT INTO `race_ability` (race, race_ability_type, name, description) VALUES (@LYNSRIAL_ID, 'LYNSRIAL_POOR_GROUND_SPEED', 'Poor Ground Speed', ' Lyn-Srial have -2 Pace (ground only) and a d4 running die. ');
SET @LYNSRIAL_POOR_GROUND_SPEED_ID = LAST_INSERT_ID();
INSERT INTO `race_ability` (race, race_ability_type, name, description) VALUES (@LYNSRIAL_ID, 'LYNSRIAL_REGENERATION', 'Regeneration', ' Lyn-Srial make natural healing rolls once a day and may regenerate lost limbs. If a Lyn-Srial gains a permanent injury, she makes a Vigor roll after recovering from Incapacitation. On success, the injury heals after 1d6 days. ');
SET @LYNSRIAL_REGENERATION_ID = LAST_INSERT_ID();
INSERT INTO `race_ability` (race, race_ability_type, name, description) VALUES (@LYNSRIAL_ID, 'LYNSRIAL_STRONG', 'Strong', ' Lyn-Srial start with d6 Strength. ');
SET @LYNSRIAL_STRONG_ID = LAST_INSERT_ID();
INSERT INTO `race_ability` (race, race_ability_type, name, description) VALUES (@TRIMADORE_ID, 'TRIMADORE_DISTINCTIVE_D_BEE', 'Distinctive D-Bee', ' Though humanoid, Trimadore are clearly inhuman. They face prejudice from the Coalition. They suffer -4 Charisma with such folks. ');
SET @TRIMADORE_DISTINCTIVE_D_BEE_ID = LAST_INSERT_ID();
INSERT INTO `race_ability` (race, race_ability_type, name, description) VALUES (@TRIMADORE_ID, 'TRIMADORE_LONG_ARMS', 'Long Arms', ' The Trimadore have a Reach of 1. ');
SET @TRIMADORE_LONG_ARMS_ID = LAST_INSERT_ID();
INSERT INTO `race_ability` (race, race_ability_type, name, description) VALUES (@TRIMADORE_ID, 'TRIMADORE_MECHANICAL_SAVANT', 'Mechanical Savant', ' Trimadore are born with an innate capacity for working with and repairing machines. They begin with the Mr. Fix It Edge, ignoring any requirements. ');
SET @TRIMADORE_MECHANICAL_SAVANT_ID = LAST_INSERT_ID();
INSERT INTO `race_ability` (race, race_ability_type, name, description) VALUES (@TRIMADORE_ID, 'TRIMADORE_NON_STANDARD_PHYSIOLOGY', 'Non-Standard Physiology', ' The unique physiology of a Trimadore makes it difficult for him to find armor he can use. Purchases and repairs are at least doubled in cost, and there’s no way he can manage a Glitter Boy suit or other power armor built for a typical humanoid frame. He also suffers -2 to checks made to operate a vehicle or its weapons not refitted for his race. Any gear gained from an Iconic Framework is assumed to be custom-built for the character. ');
SET @TRIMADORE_NON_STANDARD_PHYSIOLOGY_ID = LAST_INSERT_ID();
INSERT INTO `race_ability` (race, race_ability_type, name, description) VALUES (@TRIMADORE_ID, 'TRIMADORE_TECHNICALLY_SAVVY', 'Technically Savvy', ' Trimadore love science and technology, studying all they can about such things from birth. Trimadore start with Repair d6 and their choice of one of the following at d6: Knowledge (Computers), Knowledge (Cybernetics), Knowledge (Electronics), or Knowledge (Engineering). ');
SET @TRIMADORE_TECHNICALLY_SAVVY_ID = LAST_INSERT_ID();
INSERT INTO `race_ability` (race, race_ability_type, name, description) VALUES (@SIMVAN_ID, 'SIMVAN_ANIMAL_EMPATHY', 'Animal Empathy', ' A Simvan has a psionic connection to animals, granting the Beast Master Edge and Riding d6. ');
SET @SIMVAN_ANIMAL_EMPATHY_ID = LAST_INSERT_ID();
INSERT INTO `race_ability` (race, race_ability_type, name, description) VALUES (@SIMVAN_ID, 'SIMVAN_APEX_PREDATOR', 'Apex Predator', ' Simvan consider themselves pinnacle predators; the ultimate victory is to defeat and consume an enemy. Simvan have the Bloodthirsty Hindrance and most know their deadly habits. ');
SET @SIMVAN_APEX_PREDATOR_ID = LAST_INSERT_ID();
INSERT INTO `race_ability` (race, race_ability_type, name, description) VALUES (@SIMVAN_ID, 'SIMVAN_DISTINCTIVE_D_BEE', 'Distinctive D-Bee', ' Simvan are clearly inhuman. They suffer -4 Charisma with CS citizens. ');
SET @SIMVAN_DISTINCTIVE_D_BEE_ID = LAST_INSERT_ID();
INSERT INTO `race_ability` (race, race_ability_type, name, description) VALUES (@SIMVAN_ID, 'SIMVAN_INSTINCTS_OVER_INTELLECT', 'Instincts Over Intellect', ' Simvan act on their instincts. Intellectual pursuits are not common for them. They suffer a -1 penalty to all Smarts rolls. ');
SET @SIMVAN_INSTINCTS_OVER_INTELLECT_ID = LAST_INSERT_ID();
INSERT INTO `race_ability` (race, race_ability_type, name, description) VALUES (@SIMVAN_ID, 'SIMVAN_LOW_LIGHT_VISION', 'Low Light Vision', ' Simvan ignore penalties for Dim and Dark conditions. ');
SET @SIMVAN_LOW_LIGHT_VISION_ID = LAST_INSERT_ID();
INSERT INTO `race_ability` (race, race_ability_type, name, description) VALUES (@SIMVAN_ID, 'SIMVAN_MONSTROUS_BEAST_AFFINITY', 'Monstrous Beast Affinity', ' Simvan have a natural affinity for large creatures. When using the beast friend power, they pay half the cost for a creature’s Size (effectively 1 ISP per +1 Size). Additionally, they may take a larger than normal creature with their Beast Master Edge as a mount (see the list above of common riding animals). ');
SET @SIMVAN_MONSTROUS_BEAST_AFFINITY_ID = LAST_INSERT_ID();
INSERT INTO `race_ability` (race, race_ability_type, name, description) VALUES (@SIMVAN_ID, 'SIMVAN_NATURAL_PSIONICS', 'Natural Psionics', ' Simvan start with the Arcane Background (Psionics) Edge. Beast friend must be one of their first chosen powers. They start with 15 ISP instead of 10. If a Simvan chooses an Iconic Framework providing Arcane Background (Psionics), he follows all the normal rules for the Framework except he gains beast friend as a bonus power and gains +5 ISP in addition to what the Framework normally provides. ');
SET @SIMVAN_NATURAL_PSIONICS_ID = LAST_INSERT_ID();
INSERT INTO `race_ability` (race, race_ability_type, name, description) VALUES (@SIMVAN_ID, 'SIMVAN_RACIAL_ENEMY', 'Racial Enemy', ' Many Psi-Stalker and Simvan tribes have been at war for years. Meetings between them start argumentative and get worse. Simvan suffer -4 Charisma with wild Psi-Stalkers (Coalition Psi-Stalkers don’t like them just because they are D-Bees). ');
SET @SIMVAN_RACIAL_ENEMY_ID = LAST_INSERT_ID();


-- EDGES
INSERT INTO `race_ability_edge` (race_ability, edge) VALUES (@ALTARA_ATTRACTIVE_ID, (SELECT id FROM edge WHERE type = 'ATTRACTIVE'));
INSERT INTO `race_ability_edge` (race_ability, edge) VALUES (@ALTARA_SUPERIOR_SENSES_ID, (SELECT id FROM edge WHERE type = 'ALERTNESS'));
INSERT INTO `race_ability_edge` (race_ability, edge) VALUES (@FENNODI_NATURAL_PSIONICS_ID, (SELECT id FROM edge WHERE type = 'ARCANE_BACKGROUND_PSIONICS'));
INSERT INTO `race_ability_edge` (race_ability, edge) VALUES (@QUICKFLEX_AMBIDEXTERITY_ID, (SELECT id FROM edge WHERE type = 'AMBIDEXTROUS'));
INSERT INTO `race_ability_edge` (race_ability, edge) VALUES (@PSISTALKER_AMBIDEXTERITY_ID, (SELECT id FROM edge WHERE type = 'AMBIDEXTROUS'));
INSERT INTO `race_ability_edge` (race_ability, edge) VALUES (@TRIMADORE_MECHANICAL_SAVANT_ID, (SELECT id FROM edge WHERE type = 'MR_FIX_IT'));
INSERT INTO `race_ability_edge` (race_ability, edge) VALUES (@SIMVAN_ANIMAL_EMPATHY_ID, (SELECT id FROM edge WHERE type = 'BEAST_MASTER'));
INSERT INTO `race_ability_edge` (race_ability, edge) VALUES (@SIMVAN_NATURAL_PSIONICS_ID, (SELECT id FROM edge WHERE type = 'ARCANE_BACKGROUND_PSIONICS'));


INSERT INTO `sql_files` (`sql_file_name`, `run_date`) VALUES ('20.sql', NOW());
