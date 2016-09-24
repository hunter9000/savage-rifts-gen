


INSERT INTO framework (type, max_agility_die_type, max_smarts_die_type, max_spirit_die_type, max_strength_die_type, max_vigor_die_type,
                        starting_attribute_points,
                        starting_agility_die_type, starting_smarts_die_type, starting_spirit_die_type, starting_strength_die_type, starting_vigor_die_type)
            VALUES ('COMBAT_CYBORG', 'D4', null, null, 'D4', null,
                    2,
                    'D10', null, null, 'D12', 'D12');

INSERT INTO framework (type, max_agility_die_type, max_smarts_die_type, max_spirit_die_type, max_strength_die_type, max_vigor_die_type,
                        starting_attribute_points,
                        starting_agility_die_type, starting_smarts_die_type, starting_spirit_die_type, starting_strength_die_type, starting_vigor_die_type)
            VALUES ('CRAZY', null, null, null, null, null,
                    null,
                    'D8', null, null, 'D8', 'D8');

COMMIT;