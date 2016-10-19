USE savage_rifts;

CREATE TABLE `role` (
	`id` BIGINT(20) NOT NULL AUTO_INCREMENT,
	`role_name` VARCHAR(20) NOT NULL,
	PRIMARY KEY (`id`),
	UNIQUE INDEX `UK_iubw515ff0ugtm28p8g3myt0h` (`role_name`)
)
COLLATE='utf8_general_ci' ENGINE=InnoDB;

CREATE TABLE `user` (
	`id` BIGINT(20) NOT NULL AUTO_INCREMENT,
	`email` VARCHAR(255) NOT NULL,
	`password` VARCHAR(255) NOT NULL,
	`username` VARCHAR(255) NOT NULL,
	PRIMARY KEY (`id`),
	UNIQUE INDEX `UK_6dotkott2kjsp8vw4d0m25fb7` (`email`),
	UNIQUE INDEX `UK_r43af9ap4edm43mmtq01oddj6` (`username`)
)
COLLATE='utf8_general_ci' ENGINE=InnoDB;

CREATE TABLE `user_role` (
	`user_id` BIGINT(20) NOT NULL,
	`role_id` BIGINT(20) NOT NULL,
	PRIMARY KEY (`user_id`, `role_id`),
	INDEX `FK_it77eq964jhfqtu54081ebtio` (`role_id`),
	CONSTRAINT `FK_apcc8lxk2xnug8377fatvbn04` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
	CONSTRAINT `FK_it77eq964jhfqtu54081ebtio` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`)
)
COLLATE='utf8_general_ci' ENGINE=InnoDB;


INSERT INTO role (role_name) VALUES ('PLAYER');
INSERT INTO role (role_name) VALUES ('ADMIN');

INSERT INTO user (username, password, email) VALUES ('hunter', '$2a$10$A99ctJHdfKOFiafWzPuo2eWoloUmCMsNbXpq2FbNtIa1SqQSw3PJi', '');

INSERT INTO user_role (user_id, role_id) VALUES (1, 1);
INSERT INTO user_role (user_id, role_id) VALUES (1, 2);


INSERT INTO `sql_files` (`sql_file_name`, `run_date`) VALUES ('2.sql', NOW());

