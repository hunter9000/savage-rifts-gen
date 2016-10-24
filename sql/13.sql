USE savage_rifts;

CREATE TABLE `framework_feature` (
	`id` BIGINT(20) NOT NULL AUTO_INCREMENT,
	`framework` BIGINT(20) NOT NULL,
	`framework_feature_type` VARCHAR(255) NOT NULL,
	`framework_ability_type` VARCHAR(255) NOT NULL,
	`description` VARCHAR(1000) NOT NULL,
	`provided_edge` BIGINT(20) NULL DEFAULT NULL,
	PRIMARY KEY (`id`),
	INDEX `FK_framework_feature__framework` (`framework`),
	INDEX `FK_framework_feature__edge` (`provided_edge`),
	CONSTRAINT `FK_framework_feature__framework` FOREIGN KEY (`framework`) REFERENCES `framework` (`id`),
	CONSTRAINT `FK_framework_feature__edge` FOREIGN KEY (`provided_edge`) REFERENCES `edge` (`id`)
) COLLATE='utf8_general_ci' ENGINE=InnoDB;

SELECT @COMBAT_CYBORG_ID:=id FROM `framework` WHERE type = 'COMBAT_CYBORG';
SELECT @CRAZY_ID:=id FROM `framework` WHERE type = 'CRAZY';

INSERT INTO `framework_feature` (`framework`, `framework_feature_type`, `framework_ability_type`, `description`) VALUES
(@COMBAT_CYBORG_ID, 'BIONIC_AUGMENTATION', 'BONUS', 'Combat Cyborgs begin with Strength d12+2, Agility d10, and Vigor d12. These traits do not have an attribute maximum.'),
(@COMBAT_CYBORG_ID, 'CYBERNETIC_ENHANCEMENTS', 'BONUS', '‘Borgs have these cybernetic systems (already factored into starting stats): Armor Plating (1), Audio Package, Bionic Strength Augmentation, Core Electronics Package, Cyber-Wired Reflexes, Optics Package, Reinforced Frame (1), Synthetic Organ Replacement (see page 100).'),
(@COMBAT_CYBORG_ID, 'HIGH_PERFORMANCE_LEGS', 'BONUS', 'Fullconversion ‘borgs begin with the Fleet-Footed Edge.'),
(@COMBAT_CYBORG_ID, 'MDC_ARMOR', 'BONUS', 'Cyborg construction provides +8 M.D.C. Armor and +3 Toughness, which can be improved with additional cybernetics but does not stack with worn armor, use the higher value.'),
(@COMBAT_CYBORG_ID, 'MORE_MACHINE', 'BONUS', '‘Borgs add +2 to recover from Shaken, ignore one level of wound modifiers, possess a selfcontained breathing apparatus, and are immune to poison and disease.'),
(@COMBAT_CYBORG_ID, 'SIZE', 'BONUS', 'Combat Cyborgs are big and heavy, gaining +1 Toughness from their size.'),
(@COMBAT_CYBORG_ID, 'UPGRADABLE', 'BONUS', '’Borgs start with the Upgradable Edge.'),
(@COMBAT_CYBORG_ID, 'UNARMED_COMBAT', 'BONUS', 'Combat Cyborgs deal Str+d6 (Mega Damage) in unarmed combat and are considered armed.'),

(@COMBAT_CYBORG_ID, 'ALL_THOSE_MOVING_PARTS', 'COMPLICATION', '‘Borgs cannot be healed or treated with medicine when they are hurt. Instead they must be repaired. Fixing a cyborg requires the Repair skill—which is used like the Healing skill, only with no Golden Hour.'),
(@COMBAT_CYBORG_ID, 'GRAY_MATTER', 'COMPLICATION', 'Combat Cyborgs only start with two points (instead of the normal five) for attributes and these may only be spent on Smarts and Spirit. Points from Hindrances and Advances may be used to raise any attribute.'),
(@COMBAT_CYBORG_ID, 'HEAVY', 'COMPLICATION', 'Combat cyborgs are extra-heavy making it difficult to operate Power Armor, Robot Armor, and vehicles not built for them. Power Armor must be reinforced, doubling purchase and repair costs. Operating Robot Armor or a vehicle not refitted for them is done at a −2 to all Trait checks, including firing vehicular weapons.'),
(@COMBAT_CYBORG_ID, 'INHUMAN_APPEARANCE', 'COMPLICATION', '‘Borgs suffer −2 Charisma when dealing with most beings.'),
(@COMBAT_CYBORG_ID, 'LOSS_OF_DEXTERITY', 'COMPLICATION', 'A Combat Cyborg’s systems are designed for combat excellence, not delicate work or even common use. A ‘borg suffers −2 to all Agility rolls and linked skills not directly related to combat.'),
(@COMBAT_CYBORG_ID, 'MALFUNCTION', 'COMPLICATION', 'Cyborgs are subject to the same potential problems all tech items and gear face (see the Technical Difficulties Setting Rule on page 122).'),
(@COMBAT_CYBORG_ID, 'SHADOW_OF_THEMSELVES', 'COMPLICATION', '‘Borgs don’t choose a race, but may increase an attribute one die type or take an Edge (meeting all requirements) to reflect their original race.'),
(@COMBAT_CYBORG_ID, 'SPIRITUALLY_NUMB', 'COMPLICATION', 'Combat Cyborgs can’t take Arcane Background.'),
(@COMBAT_CYBORG_ID, 'TOTAL_CONVERSION', 'COMPLICATION', 'Becoming a Combat Cyborg uses all of a character’s personal Strain ever. They start with only the 6 Strain from the Upgradable Edge and can only gain more from the Beyond the Limit Edge.'),

(@CRAZY_ID, 'BIO_REGENERATION', 'BONUS', 'Awakening certain portions of the brain via the Mind Over Matter implants grants the Crazy a natural healing roll once every 24 hours.'),
(@CRAZY_ID, 'ENHANCED_ATTRIBUTES', 'BONUS', 'Crazies gain +2 die types to Agility, Strength, and Vigor. These traits have no maximum.'),
(@CRAZY_ID, 'ENHANCED_SPEED', 'BONUS', 'Crazies double their base Pace.'),
(@CRAZY_ID, 'HEIGHTENED_SENSES', 'BONUS', 'Crazies gain +2 to Notice and Tracking rolls. They also ignore two points of Range penalties.'),
(@CRAZY_ID, 'MINOR_PSIONIC', 'BONUS', 'Unlocking the brain’s potential grants a Crazy Arcane Background (Psionics), 10 ISP, three powers, and Psionics d6. Crazies have access to the following powers: armor, barrier, blind, bolt, boost/lower Trait, clairvoyance, confusion, damage field, darksight, deflection, disguise, dispel, divination, drain Power Points, entangle, environmental protection, farsight, fear, fly, havoc, healing, illusion, intangibility, invisibility, mind reading, pummel, puppet, slow, slumber, smite, speak language, stun, telekinesis, telepathy, teleport, warrior’s gift.'),
(@CRAZY_ID, 'QUICK', 'BONUS', 'Crazies begin with the Quick Edge.'),
(@CRAZY_ID, 'SUPER_ENDURANCE', 'BONUS', 'Crazies require only half the normal amount of sleep, and gain +4 on all checks to resist Fatigue.'),
(@CRAZY_ID, 'SUPER_REFLEXES', 'BONUS', 'Crazies have uncanny reflexes, granting them a −2 to be hit as long as they are aware of the attack.'),

(@CRAZY_ID, 'CYBERNETICS', 'COMPLICATION', 'Crazies suffer −1 to Psionics per point of Strain (page 108).'),
(@CRAZY_ID, 'DISTINCTIVE_APPEARANCE', 'COMPLICATION', 'The protrusions from the skull alone mark a Crazy for what she is. Most also indulge in tattoos, body piercings, and other means of declaring themselves to the world.'),
(@CRAZY_ID, 'MAGIC', 'COMPLICATION', 'M.O.M. implants jumble the mind in such a way as to make the use of magic impossible.'),
(@CRAZY_ID, 'NEEDS_ACTION', 'COMPLICATION', 'Crazies live in a constant state of heightened adrenaline and awareness, even those suffering from depression cannot escape the feeling. During particular slow periods, the Game Master may call for a Spirit roll. Failure means the Crazy gains −2 Charisma as she becomes irritable and impatient. She also suffers a −1 to all Trait rolls from the distraction of her frenzied mind, until some kind of high alert status or action kicks in.'),
(@CRAZY_ID, 'UNSTABLE_PSYCHO', 'COMPLICATION', 'From the start (and for no added benefit), the character gains a psychological or emotional Hindrance determined by rolling on the Psyche Degradation Table. Representing the constant degradation of the Crazy’s psychological state, the character gains an additional Hindrance from the table each time she achieves a new Rank.');

INSERT INTO `sql_files` (`sql_file_name`, `run_date`) VALUES ('13.sql', NOW());