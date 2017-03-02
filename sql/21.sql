USE savage_rifts;

UPDATE `edge` SET xp_level_type = 'SEASONED' WHERE edge_type = 'INSPIRE';

INSERT INTO `sql_files` (`sql_file_name`, `run_date`) VALUES ('21.sql', NOW());
