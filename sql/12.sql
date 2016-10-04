
ALTER TABLE `sheet` DROP COLUMN `has_completed_table_rolls`;
ALTER TABLE `sheet` DROP COLUMN `has_completed_table_roll_swaps`;
ALTER TABLE `sheet` DROP COLUMN `has_selected_hindrances`;
ALTER TABLE `sheet` DROP COLUMN `has_selected_edges`;

ALTER TABLE `sheet` ADD COLUMN `creation_step` VARCHAR(255) NOT NULL;
