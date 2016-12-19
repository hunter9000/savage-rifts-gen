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


(@BURSTER_ID, 'BRST_ARCANE_BACKGROUND_PSIONICS', 'BONUS', 'A Burster begins with three powers from the list above, 20 ISP, and a d8 Psionics skill. ')
(@BURSTER_ID, 'BRST_EVERYTHING_BURNS', 'BONUS', 'The fires started by Bursters are some of the most intense possible. They can catch almost anything on fire, and combustible materials don’t stand much of a chance against them. Any time a Burster causes damage with a flame ability, roll a d10 (instead of the usual d6 as indicated in Savage Worlds under Fire). Anything flammable catches fire on a 6 –10, while highly flammable targets ignite on a 3 –10. Things that normally don’t catch fire (metal, ceramics, stone) ignite from a Burster’s flames on a 10, or at least begin to melt. Water super-heats and evaporates nigh-instantly on a 10 as well, and boils away over 2d6 rounds on an 8 or 9. ')
(@BURSTER_ID, 'BRST_FIERY_AURA', 'BONUS', 'At will, as an action (no roll required), a Burster can surround himself with a sheath of flame and heat, causing 3d6 damage to anyone who touches him (with a melee or touch attack, for example). He can add this damage to any Fighting attack he makes, as well. When the aura is activated, it provides +6 Armor to the Burster (this stacks with the armor power, but not worn armor). Neither effect costs any ISP. However, if he spends 3 ISP when he activates his Fiery Aura, the damage becomes Mega Damage and the Armor gains the M.D.C. quality. Fiery Aura goes away whenever the Burster is Incapacitated or is otherwise unconscious.')
(@BURSTER_ID, 'BRST_FIRE_MASTERY', 'BONUS', 'Over a Large Burst Template centered anywhere within 12”, the Burster can create, control, and eliminate fire. He can create minor fire and heat effects (or douse flames) as a free action with no roll. As an action, he can create environmental effects that impose a −2 to Trait rolls (−4 with a raise). For any Trait rolls, use the Psionics skill. None of these effects cost ISP. ')
(@BURSTER_ID, 'BRST_FIREWALKER', 'BONUS', 'The Burster is completely impervious to all sources of fire and heat; he could take a dive into a river of lava and come out unscathed. He only suffers half damage from lightning and electrical attacks, as well as laser weapons. He’s also immune to plasma weapon damage. ')
(@BURSTER_ID, 'BRST_FLAME_BOLT', 'BONUS', 'The Burster can hurl forth a flaming bolt of 4d6 Damage with a Range of 12/24/48. This costs no ISP and does Mega Damage. The Burster may add +2 AP by spending 1 ISP per Flame Bolt, or +4 AP for 2 ISP. Double the bonus for the same cost when on a ley line. Rolling a 1 on the Psionics die when using flame bolt does not result in Brainburn (per Savage Worlds).')
(@BURSTER_ID, 'BRST_MAJOR_PSIONICS', 'BONUS', 'Bursters begin with the Major Psionics Edge. When they take the Power Points Edge, they gain 10 ISP 33 (instead of 5). They are able to spend 2 ISP for a +1 to Psionics rolls, and 4 ISP for a +2 (added before the roll). They can spend +1 ISP for Range × 2 for any ranged (not Self or Touch) powers, or +2 ISP for Range × 10. These last two effects are doubled when on a ley line. ')

(@BURSTER_ID, 'BRST_CYBERNETICS', 'COMPLICATION', 'Simply not a good option for a Burster, as they interfere too much with his powers. If circumstances force a bionic addition, each point of Strain imposes a −1 penalty to the Psionics skill.')
(@BURSTER_ID, 'BRST_ENEMIES', 'COMPLICATION', 'The Coalition considers Bursters a dire threat to life and property, and they are to be destroyed on sight. There are more than a few settlements with long memories of rogue Bursters causing enormous property damage.')
(@BURSTER_ID, 'BRST_QUIRK_PYROMANIAC', 'COMPLICATION', 'Though most are not sociopathic arsonists, Bursters tend to have a thing about starting fires just to watch them burn with loving fascination. This is more aggravating than dangerous (at least most of the time).')


(@MIND_MELTER_ID, 'MM_ARCANE_BACKGROUND_PSIONICS', 'BONUS', 'A Mind Melter begins with a great knowledge and understanding of psionics. He begins with five powers from the list above, 20 ISP, and a d8 Psionics skill. ')
(@MIND_MELTER_ID, 'MM_EXPANDED_AWARENESS', 'BONUS', 'Mind Melters can use detect arcana at will, as a free action.')
(@MIND_MELTER_ID, 'MM_MAJOR_PSIONIC', 'BONUS', 'Mind Melters have the Major Psionic Edge and can spend 2 ISP to gain a +1 with any Psionic skill roll, or 4 ISP for a +2 (paid before the roll is made). These effects are doubled when on a ley line. Each time they take the Power Points Edge, they gain +10 ISP (instead of 5).')
(@MIND_MELTER_ID, 'MM_MASTER_PSIONIC', 'BONUS', 'A Mind Melter has the Master Psionic Edge, gaining all the Mega Powers associated with his selected powers. ')
(@MIND_MELTER_ID, 'MM_MENTAL_RESISTANCE', 'BONUS', 'A Mind Melter has powerful defenses against the psionic powers of others. He has +4 to all checks to resist psionic effects, and +4 armor against psionic damage. This does stack with Arcane Resistance.')

(@MIND_MELTER_ID, 'MM_A_LITTLE_ODD', 'COMPLICATION', 'Though hardly as far gone as a Crazy, Mind Melters tend to be a little different due to the nature of their powers. Each Mind Melter begins with the Quirk Hindrance.')
(@MIND_MELTER_ID, 'MM_CYBERNETICS', 'COMPLICATION', 'No remotely sane Mind Melter would allow any cybernetics to ruin their carefully tuned mind or body. Medical necessity might dictate otherwise, but such characters suffer −1 to the Psionics skill for each point of Strain.')
(@MIND_MELTER_ID, 'MM_ENEMIES', 'COMPLICATION', 'Mind Melters are shot on sight by all Coalition troops, then shot again to be certain they’re dead. True Federation folks also tend to hate them.')
(@MIND_MELTER_ID, 'MM_FEARED', 'COMPLICATION', 'Though it’s possible to hide his true nature, if the general populace discovers the presence of a Mind Melter, they tend to be very nervous— and possibly outright terrified. Mind Melters suffer a −2 Charisma when dealing with those who fear them.')


(@LEY_LINE_WALKER_ID, 'LLW_ARCANE_BACKGROUND_MAGIC', 'BONUS', 'Ley Line Walkers are powerful arcane wielders. They begin with five powers from the list above, 15 PPE, and a d8 Spellcasting skill.')
(@LEY_LINE_WALKER_ID, 'LLW_EXPANDED_AWARENESS', 'BONUS', 'Ley Line Walkers can use detect arcana at will, with no PPE cost, as a free action.')
(@LEY_LINE_WALKER_ID, 'LLW_LEY_LINE_MAGIC_MASTERY', 'BONUS', 'Like all arcane casters (see Ley Lines, page 119), Ley Line Walkers can draw extra PPE from ley lines, though they do so with greater advantage. As a free action, they can roll their Spellcasting skill to draw PPE from a line at a distance of Spirit × 3, and they multiply their current maximum PPE by ×3 while at that distance or closer.')
(@LEY_LINE_WALKER_ID, 'LLW_LEY_LINE_REJUVINATION', 'BONUS', 'While on a ley line, a Walker gains a natural healing roll once per day. ')
(@LEY_LINE_WALKER_ID, 'LLW_LEY_LINE_SENSE', 'BONUS', 'A Ley Line Walker can sense a ley line within 10 miles, and she can automatically tell how powerful it is, in what directions it flows, where it meets other ley lines at nexus points, and other aspects as might apply (such as if a huge amount of its energy is being siphoned for some other purpose). She can also sense any nearby Rifts within 10 miles, and she can automatically sense the eruption of a new Rift, or one opening anew, within 50 miles.')
(@LEY_LINE_WALKER_ID, 'LLW_LEY_LINE_TRANSMISSION', 'BONUS', 'Walkers are able to send and receive spoken messages along ley lines, at any distance. This can be a wide broadcast that anyone along the line can hear, or it can be directed to a single recipient (who needs to be on the line and expecting the message).')
(@LEY_LINE_WALKER_ID, 'LLW_LEY_LINE_WALKING', 'BONUS', 'A Ley Line Walker can, as her name implies, walk the line as though walking across level ground. She can fly at twice her Pace, at an altitude as high as 1,000 feet.')
(@LEY_LINE_WALKER_ID, 'LLW_MASTER_OF_MAGIC', 'BONUS', 'She has Mega Powers for her spells, and A Ley Line Walker begins with the Master of Magic Edge, gaining Mega Powers for all known spells, and also starts with the Rapid Recharge Edge.')

(@LEY_LINE_WALKER_ID, 'LLW_CYBERNETICS', 'COMPLICATION', 'Such technology creates havoc for the flow of energy a Walker relies upon, imposing −1 to the Spellcasting skill for each point of Strain.')
(@LEY_LINE_WALKER_ID, 'LLW_DISCONNECTED', 'COMPLICATION', 'Ley Line Walkers constantly deal with the strange, alien, and inhuman. This makes them more than a bit difficult to deal with for the average person. The Walker has a −2 Charisma penalty in most social situations.')
(@LEY_LINE_WALKER_ID, 'LLW_ENEMIES', 'COMPLICATION', 'As with all wielders of magic, Ley Line Walkers are “shoot-on-sight” targets for Coalition forces. Any who refuse to swear fealty to Lord Dunscon may consider the True Federation to be hostile territory as well.')


(@MYSTIC_ID, 'MYST_ARCANE_BACKGROUND_MIRACLES', 'BONUS', 'Mystics begin with four starting powers (from the list above) and 15 PPE. They also have the Mysticism skill at d8 (which counts as Faith for all other Edge requirements).')
(@MYSTIC_ID, 'MYST_ARCANE_BACKGROUND_PSIONICS', 'BONUS', 'As a minor psionic, a Mystic begins with three powers (from the above list) and 10 ISP. He also has a beginning Psionics skill of d6.')
(@MYSTIC_ID, 'MYST_COSMIC_CONFLUENCE', 'BONUS', 'Not only do Mystics enjoy the unique capacity to possess two Arcane Backgrounds, they are able to interchange their ISP and PPE as needed. A Mystic can sacrifice two ISP to use as one PPE, and vice versa. Power Points shifted like this must be used at the moment they are exchanged, they cannot be shifted and then simply stored. For example, if a Mystic shifts 4 PPE in order to gain 2 ISP, he must immediately use those points of ISP to enact a psionic power.')
(@MYSTIC_ID, 'MYST_MASTER_OF_MAGIC', 'BONUS', 'Mystics have the Master of Magic Edge, gaining Mega Powers for all their known powers. They also have the Rapid Recharge Edge, though it only applies to their PPE recovery (not ISP).')
(@MYSTIC_ID, 'MYST_MYSTIC_AWARENESS', 'BONUS', 'Mystics have powerful extrasensory perception and attunement, granting them the Alertness and Danger Sense Edges, as well as the use of detect arcana at will, costing no PPE or ISP, as a free action. They can also sense powerful supernatural beings with a Notice check, anywhere within line of sight.')
(@MYSTIC_ID, 'MYST_SPIRITUAL_CHANNEL', 'BONUS', 'Constantly in contact with spirits, and possibly divine messengers of his faith, a Mystic can use the divination power without using ISP or PPE. Each time he uses it, he must make a Vigor roll to resist gaining a level of Fatigue. Each subsequent use of the power imposes a cumulative −1 penalty on the Vigor check until he gets a full night’s rest (eight hours). It is possible for a Mystic to Incapacitate himself with this ability. Fatigue levels gained from Spiritual Channel can only be recovered with eight hours of rest (succor cannot restore). Mystics have access to communion but activate it normally with 10 PPE.')

(@MYSTIC_ID, 'MYST_ARCANE_DUALITY', 'COMPLICATION', 'Mystics get the Arcane Background Edge twice for two different types of powers, but whenever they take a Power Edge, they must choose whether it applies to magic or psionics. Mystics can take the Power Points Edge twice per Rank but only to gain PPE with one use and ISP with the other.')
(@MYSTIC_ID, 'MYST_CYBERNETICS', 'COMPLICATION', 'Mystics suffer the same penalties from cybernetics as any other arcane character (page 108). Except for them the disruption affects two skills (−1 to both Mysticism and Psionics skills per point of Strain).')
(@MYSTIC_ID, 'MYST_ENEMIES', 'COMPLICATION', 'Mystics are equally illegal and reviled in the Coalition and the True Federation of Magic.')
(@MYSTIC_ID, 'MYST_HIGHER_STANDARD', 'COMPLICATION', 'For no added benefit, a Mystic must take a Hindrance representing his spiritual path and cosmological belief system such as Code of Honor, Major Pacifist, or Major Vow (the Vow must be “good” per GM’s approval). He must hold to that or risk his Arcane Background (Miracles) powers (per Protector in Savage Worlds).')

(@TECHNO_WIZARD_ID, 'TW_ARCANE_BACKGROUND_WEIRD_SCIENCE', 'BONUS', 'Techno-Wizards begin with three powers, each in a gizmo of their own design as with all Weird Science types. Unlike other Weird Scientists, Techno- Wizards have 15 PPE of their own and their gizmos have none. Their PPE pool is used to activate all of their own gizmos, as well as use Techno-Wizard (TW) devices. These sorcerer-scientists start with the Techno-Wizardry skill at d8 (which is equivalent to the Weird Science skill). Anyone who can use a TW device (page 76) can also use a Techno-Wizard’s gizmo, but must spend PPE/ISP to power it as usual. Gizmos are unique items and cease to function after 2d6 days without attention from their creator.')
(@TECHNO_WIZARD_ID, 'TW_ARCANE_MACHINIST', 'BONUS', 'Techno-Wizards begin with a variant of the Gadgeteer Edge which grants enormous flexibility. As an action (instead of 1d20 minutes), 43 the character produces a magical gadget replicating any power available to Techno-Wizards. To make the device requires a successful Techno-Wizardry roll at −2 per Rank the power is above her own. The device has its own pool of PPE equal to half the Techno-Wizard’s normal maximum PPE pool (round down). With a raise, the device gets +5 PPE. The item can only be activated with its own PPE and once used up (or at the end of the session), the device burns out or otherwise becomes unusable. A Techno-Wizard can use Arcane Machinist up to half her Smarts die per session.')
(@TECHNO_WIZARD_ID, 'TW_MACHINE_MAESTRO', 'BONUS', 'A Techno-Wizard can interface with any electronic or mechanical device by touch, gaining +2 to most (see below) non-combat Trait rolls where such are involved (bypassing security, picking locks, operating vehicles, using sensors.). When interfacing with an arcane (usually TW) device, the bonus increases to +4. For combat-related Trait rolls and the creation or repair of TW gizmos and devices, the bonuses lower to +1 and +2, respectively.')
(@TECHNO_WIZARD_ID, 'TW_REQUIRED_KNOWLEDGE', 'BONUS', 'A combination of intense study, practical experience, and intuitive understanding makes the Techno-Wizard an expert in a number of fields. They begin with the following skills for free: Knowledge (Arcana) d6, Knowledge (Engineering) d6, Knowledge (Science) d6, and Repair d6.')

(@TECHNO_WIZARD_ID, 'TW_CYBERNETICS', 'COMPLICATION', 'Despite their love of technology, even Techno-Wizards suffer penalties to their magic from implanted cybernetics (page 108).')
(@TECHNO_WIZARD_ID, 'TW_DEVICE_DEPENDENT', 'COMPLICATION', 'As with any Weird Scientist, a Techno-Wizard must have her gizmos for her powers or parts to use Arcane Machinist. She must have gear and tools to make her magic work.')
(@TECHNO_WIZARD_ID, 'TW_ENEMIES', 'COMPLICATION', 'Like all practitioners of arcane arts, Techno-Wizards are outlaws in Coalition States. Those who do not bow to Lord Dunscon’s authority in the True Federation—including those serving the Tomorrow Legion—are also deemed enemies of the state there.')
(@TECHNO_WIZARD_ID, 'TW_GEARHEAD_GEEK', 'COMPLICATION', 'The Techno-Wizard relationship with technology and machinery results in odd behaviors. Some talk, hum, or sing to their gear, while others paint sigils, runes, and arcane diagrams all over their machines. However it manifests, every Techno-Wizard has a Quirk Hindrance of this kind.')


(@DRAGON_ID, 'DRGN_ARCANE_BACKGROUND_PSIONICS', 'BONUS', 'As a Minor Psionic, a Dragon Hatchling begins with three powers (from the Mind Melter list) and 10 ISP. He also has a beginning Psionic skill of d6.')
(@DRAGON_ID, 'DRGN_ARMORED_HIDE', 'BONUS', 'The Hatchling has +16 M.D.C. Armor and +6 Toughness in dragon form.')
(@DRAGON_ID, 'DRGN_CLAWS_BITE', 'BONUS', 'Dragons can naturally attack with massive teeth and talons (Str+3d6 AP 4, Mega Damage).')
(@DRAGON_ID, 'DRGN_FEAR', 'BONUS', 'In his natural form, a Dragon Hatchling is a terrifying creature to most folks, who must make a Fear check when first seeing him.')
(@DRAGON_ID, 'DRGN_FIRE_BREATH', 'BONUS', 'Flame Wind Hatchlings can fire a bolt of flame at Range 12/24/48 and Damage 4d6 (Mega Damage), using their Shooting skill. Alternately, they can do 2d10, Mega Damage in a Cone Template starting from their mouths. Every target within the cone makes an Agility roll −2 to avoid the attack. Those who fail suffer 2d10 damage.')
(@DRAGON_ID, 'DRGN_FLIGHT', 'BONUS', 'The Hatchling has a Flying Pace of 12" and Climb 0. Flight is usable in another form if it has wings.')
(@DRAGON_ID, 'DRGN_IMPERVIOUS_TO_FIRE', 'BONUS', 'Fire and heat (including plasma weapons) do not affect a Flame Wind Dragon at all.')
(@DRAGON_ID, 'DRGN_INFRAVISION', 'BONUS', 'Dragons halve the penalties for dark lighting against living targets (round down).')
(@DRAGON_ID, 'DRGN_INHERENTLY_MAGICAL', 'BONUS', 'Hatchlings know no magic spells, but they have a natural pool of 10 PPE and can use any Techno- Wizard devices. A dragon who takes an Arcane Background adds his starting PPE to any gained from the Edge. Additionally, whenever he takes the Power Points Edge, he gains +10 PPE instead of +5.')
(@DRAGON_ID, 'DRGN_LIMITED_METAMORPHOSIS', 'BONUS', 'A dragon begins life able to adopt a single human or humanoid form for a limited amount of time each day. He can maintain this humanoid form for a number of hours equal to his Spirit die before needing at least six hours of rest. The dragon gains no special properties of what he mimics, only the size and appearance, but he retains all of his own abilities except those only usable in dragon form (marked with an *). Weapons and other personal effects (up to body armor) are assumed into the dragon’s form and reappear when returning to humanoid form. Any other objects are dropped. The process does not work in reverse, all gear carried by the dragon is dropped when transforming into humanoid form.')
(@DRAGON_ID, 'DRGN_MIGHTY', 'BONUS', 'Even Dragon Hatchlings are incredibly strong, beginning with a Strength of d12+4. They are also very resilient, starting with a d8 Vigor. Neither attribute has a maximum limit.')
(@DRAGON_ID, 'DRGN_NIGH_IMMORTALITY', 'BONUS', 'Unless killed through violence or other means, dragons can live anywhere from 6,000 to 12,000 years. They require only magical energy to sustain themselves, eating and drinking simply for pleasure. They are immune to normal poisons and diseases.')
(@DRAGON_ID, 'DRGN_SIZE', 'BONUS', 'In their natural forms, Dragon Hatchlings are usually 15 –20 feet from snout to tail-tip, and weigh up to 7 tons. This means, when not using their Metamorphosis abilities, Hatchlings gain +6 Toughness.')
(@DRAGON_ID, 'DRGN_SLOW_REGENERATION', 'BONUS', 'These creatures can even regenerate lost limbs over time, making a natural healing roll once per day.')
(@DRAGON_ID, 'DRGN_TAIL_LASH', 'BONUS', 'The dragon can sweep all opponents in his rear facing in a 2" long by 4" wide rectangle. This is a Fighting attack which ignores size penalties, doing Str+d8 (Mega Damage). DRAGON HATCHLING COMPLICATIONS For all their power, Dragon Hatchlings begin life with a number of limitations and difficulties.')

(@DRAGON_ID, 'DRGN_CYBERNETICS', 'COMPLICATION', 'Dragons cannot take cybernetics at any point. Their bodies reject such foreign implants.')
(@DRAGON_ID, 'DRGN_ENEMIES', 'COMPLICATION', 'Dragons are illegal and reviled by the Coalition. Any known dragon is immediately hunted with extreme prejudice.')
(@DRAGON_ID, 'DRGN_FORM_LIMITS', 'COMPLICATION', 'If a dragon transforms into a humanoid race with a restriction based on its body type (such as Non- Standard Physiology, see page 51), it suffers the same penalties as that race. The GM m akes t he fi nal c all o n what 47 counts as a body type restriction. In their natural form, dragons cannot wear any armor and can only use vehicular weapons specially adapted for their use at four times the normal cost. Most other gear can only be used in humanoid form (again, GM’s call).')
(@DRAGON_ID, 'DRGN_HATCHED', 'COMPLICATION', 'Dragons are born not made. They do not choose a race.')
(@DRAGON_ID, 'DRGN_LARGE', 'COMPLICATION', 'When not shape shifted into a humanoid form, dragons make for very big targets. Normal-sized opponents gain +2 on all attacks against them.')
(@DRAGON_ID, 'DRGN_OUTSIDER', 'COMPLICATION', 'Dragon Hatchlings understand so little of the world, they inevitably cause socially awkward situations wherever they go, even in humanoid form. All Dragon Hatchlings have the Outsider Hindrance.')
(@DRAGON_ID, 'DRGN_TERRITORIAL', 'COMPLICATION', 'Dragons tend to dislike their own, and other dragons generally treat a newcomer as invading their territory unless great care is taken in interactions.')
(@DRAGON_ID, 'DRGN_UNTESTED', 'COMPLICATION', 'Being so young and without any life experiences, Dragon Hatchlings have not had time to develop moral codes, physical limitations, or foibles. When creating a Dragon Hatchling character, the player selects no Hindrances to start (and, thus, doesn’t get the extra points to spend on character creation). Instead, he selects one Hindrance at the end of the first session. He may then select another Hindrance at the end of the second session, and a last one at the end of the third session. Only when all Hindrances are selected (one Major and two Minor, per normal rules), may the player spend the points on his character, working out what is appropriate with the Game Master. This represents imprinting and a “growth spurt” for the Dragon Hatchling.')
(@DRAGON_ID, 'DRGN_VERY_YOUNG', 'COMPLICATION', 'Dragon Hatchlings start out very young. They begin with only 3 points to adjust their attributes and only 10 skill points. Unlike the Young Hindrance (which they cannot take), this complication does not grant an extra Benny each session.')



INSERT INTO `sql_files` (`sql_file_name`, `run_date`) VALUES ('15.sql', NOW());
