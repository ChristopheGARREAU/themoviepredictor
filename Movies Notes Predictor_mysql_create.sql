CREATE TABLE `movies` (
	`id` int NOT NULL AUTO_INCREMENT,
	`title` varchar(255) NOT NULL,
	`rating` enum ('TP', '-12', '-16', '-18') NOT NULL,
	`production_budget` int,
	`marketing_budget` int,
	`duration` int NOT NULL,
	`release_date` DATE NOT NULL,
	`3D` bool NOT NULL DEFAULT '0',
	`synopsis` TEXT,
	`original_title` varchar(255) NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `people` (
	`id` int NOT NULL AUTO_INCREMENT,
	`first_name` varchar(255) NOT NULL,
	`last_name` varchar(255) NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `movies_people_roles` (
	`movie_id` int NOT NULL,
	`people_id` int NOT NULL,
	`role_id` int NOT NULL
);

CREATE TABLE `roles` (
	`id` int NOT NULL AUTO_INCREMENT,
	`name` varchar(255) NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `movie_origine_countries` (
	`movie_id` int NOT NULL,
	`country_iso2` char(2) NOT NULL
);

CREATE TABLE `companies` (
	`id` int NOT NULL AUTO_INCREMENT,
	`name` varchar(255) NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `movie_companies_roles` (
	`movie_id` int NOT NULL,
	`companie_id` int NOT NULL,
	`role_id` int NOT NULL
);

ALTER TABLE `movies_people_roles` ADD CONSTRAINT `movies_people_roles_fk0` FOREIGN KEY (`movie_id`) REFERENCES `movies`(`id`);

ALTER TABLE `movies_people_roles` ADD CONSTRAINT `movies_people_roles_fk1` FOREIGN KEY (`people_id`) REFERENCES `people`(`id`);

ALTER TABLE `movies_people_roles` ADD CONSTRAINT `movies_people_roles_fk2` FOREIGN KEY (`role_id`) REFERENCES `roles`(`id`);

ALTER TABLE `movie_origine_countries` ADD CONSTRAINT `movie_origine_countries_fk0` FOREIGN KEY (`movie_id`) REFERENCES `movies`(`id`);

ALTER TABLE `movie_companies_roles` ADD CONSTRAINT `movie_companies_roles_fk0` FOREIGN KEY (`movie_id`) REFERENCES `movies`(`id`);

ALTER TABLE `movie_companies_roles` ADD CONSTRAINT `movie_companies_roles_fk1` FOREIGN KEY (`companie_id`) REFERENCES `companies`(`id`);

ALTER TABLE `movie_companies_roles` ADD CONSTRAINT `movie_companies_roles_fk2` FOREIGN KEY (`role_id`) REFERENCES `roles`(`id`);

