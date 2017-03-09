USE savage_rifts;

-- provided edges
INSERT INTO `perk_provided_edge` (perk, provided_edge, backup_edge) VALUES ((SELECT id FROM perk WHERE type = 'UNDERWORLD_BLACK_OPS_1'), (SELECT id FROM edge WHERE edge_type='MCGUYVER'),  (SELECT id FROM edge WHERE edge_type=''));
INSERT INTO `perk_provided_edge` (perk, provided_edge, backup_edge) VALUES ((SELECT id FROM perk WHERE type = 'UNDERWORLD_BLACK_OPS_3'), (SELECT id FROM edge WHERE edge_type='I_KNOW_A_GUY'),  (SELECT id FROM edge WHERE edge_type=''));
INSERT INTO `perk_provided_edge` (perk, provided_edge, backup_edge) VALUES ((SELECT id FROM perk WHERE type = 'UNDERWORLD_BLACK_OPS_4'), (SELECT id FROM edge WHERE edge_type='DIRTY_FIGHTER'),  (SELECT id FROM edge WHERE edge_type='TRICKY_FIGHTER'));
INSERT INTO `perk_provided_edge` (perk, provided_edge, backup_edge) VALUES ((SELECT id FROM perk WHERE type = 'UNDERWORLD_BLACK_OPS_6'), (SELECT id FROM edge WHERE edge_type='THIEF'),  (SELECT id FROM edge WHERE edge_type=''));
INSERT INTO `perk_provided_edge` (perk, provided_edge, backup_edge) VALUES ((SELECT id FROM perk WHERE type = 'UNDERWORLD_BLACK_OPS_8'), (SELECT id FROM edge WHERE edge_type='SCROUNGER'),  (SELECT id FROM edge WHERE edge_type=''));
INSERT INTO `perk_provided_edge` (perk, provided_edge, backup_edge) VALUES ((SELECT id FROM perk WHERE type = 'UNDERWORLD_BLACK_OPS_9'), (SELECT id FROM edge WHERE edge_type='JACK_OF_ALL_TRADES'),  (SELECT id FROM edge WHERE edge_type=''));
INSERT INTO `perk_provided_edge` (perk, provided_edge, backup_edge) VALUES ((SELECT id FROM perk WHERE type = 'UNDERWORLD_BLACK_OPS_10'), (SELECT id FROM edge WHERE edge_type='ASSASSIN'),  (SELECT id FROM edge WHERE edge_type=''));
INSERT INTO `perk_provided_edge` (perk, provided_edge, backup_edge) VALUES ((SELECT id FROM perk WHERE type = 'TRAINING_2'), (SELECT id FROM edge WHERE edge_type='MARTIAL_ARTIST'),  (SELECT id FROM edge WHERE edge_type='IMPROVED_MARTIAL_ARTIST'));
INSERT INTO `perk_provided_edge` (perk, provided_edge, backup_edge) VALUES ((SELECT id FROM perk WHERE type = 'TRAINING_2'), (SELECT id FROM edge WHERE edge_type='BRAWLER'),  (SELECT id FROM edge WHERE edge_type=''));
INSERT INTO `perk_provided_edge` (perk, provided_edge, backup_edge) VALUES ((SELECT id FROM perk WHERE type = 'TRAINING_4'), (SELECT id FROM edge WHERE edge_type='WOODSMAN'),  (SELECT id FROM edge WHERE edge_type=''));
INSERT INTO `perk_provided_edge` (perk, provided_edge, backup_edge) VALUES ((SELECT id FROM perk WHERE type = 'TRAINING_7'), (SELECT id FROM edge WHERE edge_type='DIRTY_FIGHTER'),  (SELECT id FROM edge WHERE edge_type='TRICKY_FIGHTER'));
INSERT INTO `perk_provided_edge` (perk, provided_edge, backup_edge) VALUES ((SELECT id FROM perk WHERE type = 'TRAINING_9'), (SELECT id FROM edge WHERE edge_type='ACE'),  (SELECT id FROM edge WHERE edge_type='COMBAT_ACE'));
INSERT INTO `perk_provided_edge` (perk, provided_edge, backup_edge) VALUES ((SELECT id FROM perk WHERE type = 'PSIONICS_1'), (SELECT id FROM edge WHERE edge_type='SOUL_DRAIN'),  (SELECT id FROM edge WHERE edge_type=''));
INSERT INTO `perk_provided_edge` (perk, provided_edge, backup_edge) VALUES ((SELECT id FROM perk WHERE type = 'PSIONICS_2'), (SELECT id FROM edge WHERE edge_type='RAPID_RECHARGE'),  (SELECT id FROM edge WHERE edge_type='IMPROVED_RAPID_RECHARGE'));
INSERT INTO `perk_provided_edge` (perk, provided_edge, backup_edge) VALUES ((SELECT id FROM perk WHERE type = 'PSIONICS_8'), (SELECT id FROM edge WHERE edge_type='MENTALIST'),  (SELECT id FROM edge WHERE edge_type=''));
INSERT INTO `perk_provided_edge` (perk, provided_edge, backup_edge) VALUES ((SELECT id FROM perk WHERE type = 'MAGIC_MYSTICISM_1'), (SELECT id FROM edge WHERE edge_type='SOUL_DRAIN'),  (SELECT id FROM edge WHERE edge_type=''));
INSERT INTO `perk_provided_edge` (perk, provided_edge, backup_edge) VALUES ((SELECT id FROM perk WHERE type = 'MAGIC_MYSTICISM_2'), (SELECT id FROM edge WHERE edge_type='MARKSMAN'),  (SELECT id FROM edge WHERE edge_type=''));
INSERT INTO `perk_provided_edge` (perk, provided_edge, backup_edge) VALUES ((SELECT id FROM perk WHERE type = 'MAGIC_MYSTICISM_5'), (SELECT id FROM edge WHERE edge_type='RAPID_RECHARGE'),  (SELECT id FROM edge WHERE edge_type='IMPROVED_RAPID_RECHARGE'));
INSERT INTO `perk_provided_edge` (perk, provided_edge, backup_edge) VALUES ((SELECT id FROM perk WHERE type = 'EXPERIENCE_WISDOM_1'), (SELECT id FROM edge WHERE edge_type='ELAN'),  (SELECT id FROM edge WHERE edge_type=''));
INSERT INTO `perk_provided_edge` (perk, provided_edge, backup_edge) VALUES ((SELECT id FROM perk WHERE type = 'EXPERIENCE_WISDOM_2'), (SELECT id FROM edge WHERE edge_type='STRONG_WILLED'),  (SELECT id FROM edge WHERE edge_type=''));
INSERT INTO `perk_provided_edge` (perk, provided_edge, backup_edge) VALUES ((SELECT id FROM perk WHERE type = 'EXPERIENCE_WISDOM_3'), (SELECT id FROM edge WHERE edge_type='SCROUNGER'),  (SELECT id FROM edge WHERE edge_type=''));
INSERT INTO `perk_provided_edge` (perk, provided_edge, backup_edge) VALUES ((SELECT id FROM perk WHERE type = 'EXPERIENCE_WISDOM_4'), (SELECT id FROM edge WHERE edge_type='COMMON_BOND'),  (SELECT id FROM edge WHERE edge_type=''));
INSERT INTO `perk_provided_edge` (perk, provided_edge, backup_edge) VALUES ((SELECT id FROM perk WHERE type = 'EXPERIENCE_WISDOM_5'), (SELECT id FROM edge WHERE edge_type='DANGER_SENSE'),  (SELECT id FROM edge WHERE edge_type=''));
INSERT INTO `perk_provided_edge` (perk, provided_edge, backup_edge) VALUES ((SELECT id FROM perk WHERE type = 'EXPERIENCE_WISDOM_6'), (SELECT id FROM edge WHERE edge_type='QUICK'),  (SELECT id FROM edge WHERE edge_type='LEVEL_HEADED'));
INSERT INTO `perk_provided_edge` (perk, provided_edge, backup_edge) VALUES ((SELECT id FROM perk WHERE type = 'EXPERIENCE_WISDOM_9'), (SELECT id FROM edge WHERE edge_type='LUCK'),  (SELECT id FROM edge WHERE edge_type='GREAT_LUCK'));


-- edge choices
INSERT INTO `perk_edge_choice` (perk, edge_category) VALUES ((SELECT id FROM perk WHERE type = 'TRAINING_3'), 'PROFESSIONAL');
INSERT INTO `perk_edge_choice` (perk, edge_category) VALUES ((SELECT id FROM perk WHERE type = 'TRAINING_8'), 'COMBAT');
INSERT INTO `perk_edge_choice` (perk, edge_category) VALUES ((SELECT id FROM perk WHERE type = 'TRAINING_10'), 'WILD_CARD');
INSERT INTO `perk_edge_choice` (perk, edge_category) VALUES ((SELECT id FROM perk WHERE type = 'EXPERIENCE_WISDOM_7'), 'BACKGROUND');
INSERT INTO `perk_edge_choice` (perk, edge_category) VALUES ((SELECT id FROM perk WHERE type = 'EXPERIENCE_WISDOM_10'), 'PROFESSIONAL');
INSERT INTO `perk_edge_choice` (perk, edge_category) VALUES ((SELECT id FROM perk WHERE type = 'EXPERIENCE_WISDOM_11'), 'WILD_CARD');

-- bonuses
UPDATE `perk` SET parry_bonus = NULL, isp_bonus=NULL, ppe_bonus=NULL, num_languages_bonus=2, max_times_chosen=NULL WHERE type = 'UNDERWORLD_BLACK_OPS_7';
UPDATE `perk` SET parry_bonus = 1, isp_bonus=NULL, ppe_bonus=NULL, num_languages_bonus=NULL, max_times_chosen=NULL WHERE type = 'TRAINING_7';
UPDATE `perk` SET parry_bonus = NULL, isp_bonus=10, ppe_bonus=NULL, num_languages_bonus=NULL, max_times_chosen=NULL WHERE type = 'PSIONICS_3';
UPDATE `perk` SET parry_bonus = NULL, isp_bonus=NULL, ppe_bonus=NULL, num_languages_bonus=NULL, max_times_chosen=2 WHERE type = 'RANGED_WEAPONS_3';
UPDATE `perk` SET parry_bonus = NULL, isp_bonus=NULL, ppe_bonus=NULL, num_languages_bonus=NULL, max_times_chosen=3 WHERE type = 'RANGED_WEAPONS_5';
UPDATE `perk` SET parry_bonus = NULL, isp_bonus=NULL, ppe_bonus=5, num_languages_bonus=NULL, max_times_chosen=NULL WHERE type = 'MAGIC_MYSTICISM_3';


INSERT INTO `sql_files` (`sql_file_name`, `run_date`) VALUES ('24.sql', NOW());