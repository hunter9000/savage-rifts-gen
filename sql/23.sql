USE savage_rifts;

UPDATE `perk` 
SET description = 'Things get ugly out in the world, and the Ley Line Walker Medium Armor is a good insurance policy for dealing with a lot of those things. Cyber-Knights should re-roll on this result.'
WHERE type = 'ENCHANTED_ITEMS_MYSTIC_GADGETS_2';

UPDATE `perk` 
SET description = 'Your hero is in good shape with a TW Shard Pistol at her side.'
WHERE type = 'ENCHANTED_ITEMS_MYSTIC_GADGETS_6';

INSERT INTO `sql_files` (`sql_file_name`, `run_date`) VALUES ('23.sql', NOW());