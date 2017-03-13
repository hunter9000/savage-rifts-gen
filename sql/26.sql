USE savage_rifts;

-- fix framework descriptions
UPDATE `framework_feature` SET description='The dragon can sweep all opponents in his rear facing in a 2" long by 4" wide rectangle. This is a Fighting attack which ignores size penalties, doing Str+d8 (Mega Damage).' WHERE framework_ability_type = 'DRGN_TAIL_LASH';
UPDATE `framework_feature` SET description='If a dragon transforms into a humanoid race with a restriction based on its body type (such as Non- Standard Physiology, see page 51), it suffers the same penalties as that race. The GM makes the final c all on what counts as a body type restriction. In their natural form, dragons cannot wear any armor and can only use vehicular weapons specially adapted for their use at four times the normal cost. Most other gear can only be used in humanoid form (again, GM’s call).' WHERE framework_ability_type = 'DRGN_FORM_LIMITS';

INSERT INTO `sql_files` (`sql_file_name`, `run_date`) VALUES ('26.sql', NOW());