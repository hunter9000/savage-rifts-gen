
USE `savage_rifts`;

ALTER TABLE `edge` ADD COLUMN `edge_type` VARCHAR(255) NOT NULL;
ALTER TABLE `edge` ADD COLUMN `edge_category_type` VARCHAR(255) NOT NULL;
ALTER TABLE `edge` ADD COLUMN `description` VARCHAR(2000) NOT NULL;

