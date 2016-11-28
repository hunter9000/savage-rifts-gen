USE savage_rifts;


SELECT @COMBAT_CYBORG_ID:=id FROM `framework` WHERE type = 'COMBAT_CYBORG';
SELECT @CRAZY_ID:=id FROM `framework` WHERE type = 'CRAZY';

-- set combat cyborg to not be able to select race
UPDATE framework SET can_select_race = false WHERE id = @COMBAT_CYBORG_ID;

-- CYBER_KNIGHT
INSERT INTO framework (type) VALUES ('CYBER_KNIGHT');
SET @CYBER_KNIGHT_ID = LAST_INSERT_ID();

-- GLITTER_BOY
INSERT INTO framework (type) VALUES ('GLITTER_BOY');
SET @GLITTER_BOY_ID = LAST_INSERT_ID();

-- JUICER
INSERT INTO framework (type, has_strength_limit, has_agility_limit, has_vigor_limit) VALUES ('JUICER', false, false, false);
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

-- MARS
--INSERT INTO framework (type, starting_attribute_points) VALUES ('MARS', NULL);
--SET @MARS_ID = LAST_INSERT_ID();

-- BURSTER
INSERT INTO framework (type) VALUES ('BURSTER');
SET @BURSTER_ID = LAST_INSERT_ID();

-- MIND_MELTER
INSERT INTO framework (type) VALUES ('MIND_MELTER');
SET @MIND_MELTER_ID = LAST_INSERT_ID();

-- LEY_LINE_WALKER
INSERT INTO framework (type) VALUES ('LEY_LINE_WALKER');
SET @LEY_LINE_WALKER_ID = LAST_INSERT_ID();

-- MYSTIC
INSERT INTO framework (type, starting_attribute_points) VALUES ('MYSTIC', NULL);
SET @MYSTIC_ID = LAST_INSERT_ID();

-- TECHNO_WIZARD
INSERT INTO framework (type, starting_attribute_points) VALUES ('TECHNO_WIZARD', NULL);
SET @TECHNO_WIZARD_ID = LAST_INSERT_ID();

-- DRAGON
INSERT INTO framework (type, starting_attribute_points, can_select_race, has_strength_limit, has_vigor_limit) VALUES ('DRAGON', 3, false, false, false);
SET @DRAGON_ID = LAST_INSERT_ID();
--starting_skill_points = 10

-- start: str d12+4 no limit, vgr d8 no limit
INSERT INTO roll (die_type, modifier) VALUES ('D12', 4);
SET @DRAGON_START_STR = LAST_INSERT_ID();
UPDATE framework SET starting_strength = @DRAGON_START_STR WHERE id = @DRAGON_ID;

INSERT INTO roll (die_type, modifier) VALUES ('D8', 0);
SET @DRAGON_START_VGR = LAST_INSERT_ID();
UPDATE framework SET starting_vigor = @DRAGON_START_VGR WHERE id = @DRAGON_ID;


-- FRAMEWORK FEATURES

INSERT INTO `framework_feature` (`framework`, `framework_feature_type`, `framework_ability_type`, `description`) VALUES
(@CYBER_KNIGHT_ID, 'CK_CYBER_ARMOR', 'BONUS', 'As a free action, Cyber-Knights can summon an organic metal shell, granting +2 Toughness.'),
(@CYBER_KNIGHT_ID, 'CK_CYBERKINETIC_COMBAT', 'BONUS', 'Any purely technology-based attacks, such as lasers, rail guns, and vibro-blades, suffer a −2 to hit a Cyber-Knight. This ability stacks with the deflection power.'),
(@CYBER_KNIGHT_ID, 'CK_FIRST_INTO_BATTLE', 'BONUS', 'Cyber-Knights begin with +2 Pace and a d10 running die. If they take the Fleet-Footed Edge, the Pace bonuses stack and the running die becomes a d12.'),
(@CYBER_KNIGHT_ID, 'CK_INNER_LIGHT', 'BONUS', 'Cyber-Knights begin with the Champion Edge (see Savage Worlds).'),
(@CYBER_KNIGHT_ID, 'CK_INTENSE_COMBAT_TRAINING', 'BONUS', 'A Cyber- Knight begins play with Fighting d8 and two Combat Edges (meeting all requirements except Rank).'),
(@CYBER_KNIGHT_ID, 'CK_MINOR_PSIONIC', 'BONUS', 'Cyber- Knights have Arcane Background (Psionics), 10 ISP, three powers, and Psionics d6. They have access to the following powers: armor, barrier, bolt, boost Trait*, confusion, darksight, deflection*, environmental protection, havoc, healing*, pummel, quickness, smite*, speak language, speed*, succor, warrior’s gift. Powers marked with an asterisk (*) are usable only on the Cyber-Knight but activate as a free action, inflicting no multiple action penalty (a Cyber-Knight with Master Psionic can use mass healing but not as a free action). All other aspects of AB (Psionics) remain the same.'),
(@CYBER_KNIGHT_ID, 'CK_PSI_SWORD', 'BONUS', 'As a free action, Cyber- Knights can summon forth a blade of spirit and will. It may have any appearance but it does not change the effects. The Psi-Sword does Strength + Spirit × 2 damage with AP 6 (and no Strength minimum). For example, a Cyber-Knight with Strength d8 and Spirit d10 does 1d8+2d10 melee damage, AP 6, with his Psi-Sword. Alternately, the Cyber-Knight may split his Psi- Sword into two blades, one for each hand, doing the same damage, but each blade only gaining AP 2. For 2 ISP, the Cyber-Knight can make the blade inflict Mega Damage for as long as the blade is manifested.'),
(@CYBER_KNIGHT_ID, 'CK_REVERED_PROTECTORS', 'BONUS', 'All Cyber-Knights enjoy +2 Charisma when dealing with those who know and love them as guardians of life and freedom. '),

(@CYBER_KNIGHT_ID, 'CK_CODE_OF_HONOR', 'COMPLICATION', 'A Cyber-Knight must adhere to the codes and philosophies of the Order, or he loses some or all of his powers, depending on the degree of transgression. Whether this is a function of the special nanotech treatment he undergoes or a loss of confidence damaging his psyche in some way is a matter of some debate among scholars. Regardless, the Game Master must determine the extent of a Cyber-Knight’s transgressions and assess a penalty accordingly. Minor Transgression: −1 to all Psionics rolls until he performs a noble or heroic deed to atone. Major Transgression: −2 to all Psionics rolls, and all abilities under Cyberkinetic Combat and Inner Light cease to function until he undertakes some kind of personal (or perhaps spiritually guided) quest to atone. His Psi-Sword is also reduced to doing only his Str+Spirit in damage, and all AP values are reduced by 2. Mortal Transgression: The Cyber- Knight commits an action completely opposed to the code. All Cyber- Knight abilities are lost. The character may regain his abilities by fulfilling a significant quest (determined by the Game Master). Should the character commit another Mortal Transgression before regaining his Cyber-Knight status, his spirit is corrupted. The character regains use of his abilities but becomes a Fallen Cyber-Knight (see Savage Foes of North America) under the Game Master’s control.'),
(@CYBER_KNIGHT_ID, 'CK_CYBERNETICS', 'COMPLICATION', 'Cybernetics are not an option for Cyber-Knights, as such devices interfere with their nanotechnology.'),

(@GLITTER_BOY_ID, 'GB_FULLY_TRAINED', 'BONUS', 'All Glitter Boy pilots begin with the Power Armor Jock Edge.'),
(@GLITTER_BOY_ID, 'GB_GLITTER_BOY_ARMOR', 'BONUS', 'Power Armor of the highest caliber (see sidebar)'),
(@GLITTER_BOY_ID, 'GB_HEROIC_LEGACY', 'BONUS', 'A Glitter Boy pilot gets +2 Charisma. If a Glitter Boy is stolen, word passes quickly and the thief is targeted by Glitter Boy pilots across North America.'),
(@GLITTER_BOY_ID, 'GB_MANY_HAVE_FALLEN', 'BONUS', 'Numerous Glitter Boys fell to defend the world, leaving plentiful salvageable parts. Serious repairs cost 250,000 credits and Severe ones 500,000 (see page 122).'),

(@GLITTER_BOY_ID, 'GB_BIG_AND_SHINY', 'COMPLICATION', 'Glitter Boys are immediately recognizable and often a priority target for heavy weaponry. They suffer −8 to Stealth rolls due to their glittering armored coating. At 10 feet tall and Size 3, Glitter Boys are big targets and man-sized opponents gain +2 to hit them (see page 84).'),
(@GLITTER_BOY_ID, 'GB_CLOSED_OFF', 'COMPLICATION', 'Sealed away from the natural and spiritual worlds, Glitter Boy pilots cannot use magic or psionics while in the suit. Such powers used by others can still affect them.'),
(@GLITTER_BOY_ID, 'GB_DIGGING_IN', 'COMPLICATION', 'Activating/deactivating the stabilization system is an action. Firing the Boom Gun without these measures knocks the Glitter Boy 2d6” back and prone, leaving the pilot Shaken. Once dug in, the Glitter Boy cannot move and can only fire to the front and sides (180 degrees). Digging in makes the Glitter Boy an easier target, attackers gain a +2 to attack rolls against the suit while dug in.'),
(@GLITTER_BOY_ID, 'GB_ENEMIES', 'COMPLICATION', 'The Coalition States consider all Glitter Boys enemies of the state. Few within the True Federation of Magic consider them friends either.'),
(@GLITTER_BOY_ID, 'GB_HIGHLY_TECHNICAL_MACHINERY', 'COMPLICATION', 'Like all devices, armor, vehicles, and weapons, Glitter Boy systems are subject to the Technical Difficulties Setting Rule (see page 122).'),
(@GLITTER_BOY_ID, 'GB_SONIC_BOOM', 'COMPLICATION', 'Firing a Boom Gun causes a sonic boom affecting everyone (except the pilot) within a Large Burst Template. A failure on a Vigor roll −2 inflicts Hard of Hearing (Major) for 3d6 minutes and makes the character Shaken. If he fails with a 1 on the Vigor die, he is Incapacitated and makes a Vigor roll each round to become conscious but Shaken. Anyone in environmentally sealed armor gains +2 to the roll, as do characters with Hard of Hearing (Minor). Characters with the Major version are immune!'),
(@GLITTER_BOY_ID, 'GB_STAND_BY_TO_FIRE', 'COMPLICATION', 'A Glitter Boy cannot move and fire its Boom Gun on the same round. This is why some carry other firearms as alternatives for when they need to move and shoot.'),

(@JUICER_ID, 'JC_INTERNAL_REPAIR_SYSTEM', 'BONUS', 'The biocomp system managing the drugs and chemical processes of the Juicer’s body also works overtime to ensure his continued health and good repair. The Juicer gains Slow Regeneration (a natural healing roll once per day). As well, there’s a continuously replenishing supply of nanites and chemical concoctions available for “emergency repairs.” As an action, the Juicer can makea natural healing roll at +2 to heal wounds; this costs one charge. The system holds a maximum of three charges and requires eight hours to recover one charge.'),
(@JUICER_ID, 'JC_SUPER_ENDURANCE', 'BONUS', 'Juicers begin with +2 Vigor die types, with no Trait maximum. They require only half the normal amount of sleep, and gain +2 on all Fatigue checks.'),
(@JUICER_ID, 'JC_SUPER_REFLEXES', 'BONUS', 'Juicers begin with +2 Agility die types, with no Trait maximum. They have Uncanny Reflexes, granting them −2 to be hit by all attacks. Finally, they begin with the Quick Edge.'),
(@JUICER_ID, 'JC_SUPER_SPEED', 'BONUS', 'Juicers cover enormous ground quickly, doubling their base Pace. They also have the Fleet-Footed Edge (meaning they have Pace of 16” with a d10 running die).'),
(@JUICER_ID, 'JC_SUPER_STRENGTH', 'BONUS', 'Juicers begin with +2 Strength die types, with no Trait maximum. They also begin with the Brawny Edge.'),

(@JUICER_ID, 'JC_CYBERNETICS', 'COMPLICATION', 'Although it is possible to add cybernetics to the Juicer’s already hacked biology, there is a severe drawback: each point of Strain removes a point of Burn!'),
(@JUICER_ID, 'JC_DEATH_WISH', 'COMPLICATION', 'The Juicer knows he’s going to die, and he wants to go out magnificently, having done something folks remember and are inspired by. He has the Death Wish Hindrance (Minor).'),
(@JUICER_ID, 'JC_DRUG_INDUCED_EUPHORIA_TRANQUILITY', 'COMPLICATION', 'In order to keep the Juicer from burning out over a matter of days, the bio-comp constantly supplies a combination of psychotropic drugs and chemical inhibitors to keep the subject happy and calm. This results in a Juicer living in a constant state somewhere between mildly ecstatic and stoned, which causes −1 to all Smarts or Smarts-linked skill rolls in non-combat or low stress situations. On the first round of any combat, he doesn’t gain the benefits of Uncanny Reflexes or Quick.'),
(@JUICER_ID, 'JC_PSIONICS_AND_MAGIC', 'COMPLICATION', 'The chemical cocktail inside the Juicer makes it impossible for him to use magic or psionics in any way.'),


(@BURSTER_ID, 'BRST_ARCANE_BACKGROUND_PSIONICS', 'BONUS', '')
(@BURSTER_ID, 'BRST_EVERYTHING_BURNS', 'BONUS', '')
(@BURSTER_ID, 'BRST_FIERY_AURA', 'BONUS', '')
(@BURSTER_ID, 'BRST_FIRE_MASTERY', 'BONUS', '')
(@BURSTER_ID, 'BRST_FIREWALKER', 'BONUS', '')
(@BURSTER_ID, 'BRST_FLAME_BOLT', 'BONUS', '')
(@BURSTER_ID, 'BRST_MAJOR_PSIONICS', 'BONUS', '')

(@BURSTER_ID, 'BRST_CYBERNETICS', 'COMPLICATION', '')
(@BURSTER_ID, 'BRST_ENEMIES', 'COMPLICATION', '')
(@BURSTER_ID, 'BRST_QUIRK_PYROMANIAC', 'COMPLICATION', '')


(@MIND_MELTER_ID, 'MM_ARCANE_BACKGROUND_PSIONICS', 'BONUS', '')
(@MIND_MELTER_ID, 'MM_EXPANDED_AWARENESS', 'BONUS', '')
(@MIND_MELTER_ID, 'MM_MAJOR_PSIONIC', 'BONUS', '')
(@MIND_MELTER_ID, 'MM_MASTER_PSIONIC', 'BONUS', '')
(@MIND_MELTER_ID, 'MM_MENTAL_RESISTANCE', 'BONUS', '')

(@MIND_MELTER_ID, 'MM_A_LITTLE_ODD', 'COMPLICATION', '')
(@MIND_MELTER_ID, 'MM_CYBERNETICS', 'COMPLICATION', '')
(@MIND_MELTER_ID, 'MM_ENEMIES', 'COMPLICATION', '')
(@MIND_MELTER_ID, 'MM_FEARED', 'COMPLICATION', '')


(@LEY_LINE_WALKER_ID, 'LLW_ARCANE_BACKGROUND_MAGIC', 'BONUS', '')
(@LEY_LINE_WALKER_ID, 'LLW_EXPANDED_AWARENESS', 'BONUS', '')
(@LEY_LINE_WALKER_ID, 'LLW_LEY_LINE_MAGIC_MASTERY', 'BONUS', '')
(@LEY_LINE_WALKER_ID, 'LLW_LEY_LINE_REJUVINATION', 'BONUS', '')
(@LEY_LINE_WALKER_ID, 'LLW_LEY_LINE_SENSE', 'BONUS', '')
(@LEY_LINE_WALKER_ID, 'LLW_LEY_LINE_TRANSMISSION', 'BONUS', '')
(@LEY_LINE_WALKER_ID, 'LLW_LEY_LINE_WALKING', 'BONUS', '')
(@LEY_LINE_WALKER_ID, 'LLW_MASTER_OF_MAGIC', 'BONUS', '')

(@LEY_LINE_WALKER_ID, 'LLW_CYBERNETICS', 'COMPLICATION', '')
(@LEY_LINE_WALKER_ID, 'LLW_DISCONNECTED', 'COMPLICATION', '')
(@LEY_LINE_WALKER_ID, 'LLW_ENEMIES', 'COMPLICATION', '')


(@MYSTIC_ID, 'MYST_ARCANE_BACKGROUND_MIRACLES', 'BONUS', '')
(@MYSTIC_ID, 'MYST_ARCANE_BACKGROUND_PSIONICS', 'BONUS', '')
(@MYSTIC_ID, 'MYST_COSMIC_CONFLUENCE', 'BONUS', '')
(@MYSTIC_ID, 'MYST_MASTER_OF_MAGIC', 'BONUS', '')
(@MYSTIC_ID, 'MYST_MYSTIC_AWARENESS', 'BONUS', '')
(@MYSTIC_ID, 'MYST_SPIRITUAL_CHANNEL', 'BONUS', '')

(@MYSTIC_ID, 'MYST_ARCANE_DUALITY', 'COMPLICATION', '')
(@MYSTIC_ID, 'MYST_CYBERNETICS', 'COMPLICATION', '')
(@MYSTIC_ID, 'MYST_ENEMIES', 'COMPLICATION', '')
(@MYSTIC_ID, 'MYST_HIGHER_STANDARD', 'COMPLICATION', '')

(@TECHNO_WIZARD_ID, 'TW_ARCANE_BACKGROUND_WEIRD_SCIENCE', 'BONUS', '')
(@TECHNO_WIZARD_ID, 'TW_ARCANE_MACHINIST', 'BONUS', '')
(@TECHNO_WIZARD_ID, 'TW_MACHINE_MAESTRO', 'BONUS', '')
(@TECHNO_WIZARD_ID, 'TW_REQUIRED_KNOWLEDGE', 'BONUS', '')

(@TECHNO_WIZARD_ID, 'TW_CYBERNETICS', 'COMPLICATION', '')
(@TECHNO_WIZARD_ID, 'TW_DEVICE_DEPENDENT', 'COMPLICATION', '')
(@TECHNO_WIZARD_ID, 'TW_ENEMIES', 'COMPLICATION', '')
(@TECHNO_WIZARD_ID, 'TW_GEARHEAD_GEEK', 'COMPLICATION', '')


(@DRAGON_ID, 'DRGN_ARCANE_BACKGROUND_PSIONICS', 'BONUS', '')
(@DRAGON_ID, 'DRGN_ARMORED_HIDE', 'BONUS', '')
(@DRAGON_ID, 'DRGN_CLAWS_BITE', 'BONUS', '')
(@DRAGON_ID, 'DRGN_FEAR', 'BONUS', '')
(@DRAGON_ID, 'DRGN_FIRE_BREATH', 'BONUS', '')
(@DRAGON_ID, 'DRGN_FLIGHT', 'BONUS', '')
(@DRAGON_ID, 'DRGN_IMPERVIOUS_TO_FIRE', 'BONUS', '')
(@DRAGON_ID, 'DRGN_INFRAVISION', 'BONUS', '')
(@DRAGON_ID, 'DRGN_INHERENTLY_MAGICAL', 'BONUS', '')
(@DRAGON_ID, 'DRGN_LIMITED_METAMORPHOSIS', 'BONUS', '')
(@DRAGON_ID, 'DRGN_MIGHTY', 'BONUS', '')
(@DRAGON_ID, 'DRGN_NIGH_IMMORTALITY', 'BONUS', '')
(@DRAGON_ID, 'DRGN_SIZE', 'BONUS', '')
(@DRAGON_ID, 'DRGN_SLOW_REGENERATION', 'BONUS', '')
(@DRAGON_ID, 'DRGN_TAIL_LASH', 'BONUS', '')

(@DRAGON_ID, 'DRGN_CYBERNETICS', 'COMPLICATION', '')
(@DRAGON_ID, 'DRGN_ENEMIES', 'COMPLICATION', '')
(@DRAGON_ID, 'DRGN_FORM_LIMITS', 'COMPLICATION', '')
(@DRAGON_ID, 'DRGN_HATCHED', 'COMPLICATION', '')
(@DRAGON_ID, 'DRGN_LARGE', 'COMPLICATION', '')
(@DRAGON_ID, 'DRGN_OUTSIDER', 'COMPLICATION', '')
(@DRAGON_ID, 'DRGN_TERRITORIAL', 'COMPLICATION', '')
(@DRAGON_ID, 'DRGN_UNTESTED', 'COMPLICATION', '')
(@DRAGON_ID, 'DRGN_VERY_YOUNG', 'COMPLICATION', '')


INSERT INTO `sql_files` (`sql_file_name`, `run_date`) VALUES ('15.sql', NOW());
