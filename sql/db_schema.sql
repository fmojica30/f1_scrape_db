CREATE TABLE `driver` (
  `id` integer PRIMARY KEY AUTO_INCREMENT,
  `first_name` varchar(100),
  `last_name` varchar(100),
  `start_year` year,
  `nation` varchar(100),
  `active` boolean,
  `world_champion` boolean,
  `winner` boolean
);

CREATE TABLE `constructor` (
  `id` integer PRIMARY KEY AUTO_INCREMENT,
  `name` varchar2(1000),
  `active` boolean,
  `nation` varchar2(1000),
  `start_year` date,
  `winner` boolean,
  `world_champion` boolean
);

CREATE TABLE `constructor_driver_pairings` (
  `driver` integer,
  `constructor` integer,
  `fastest_lap` integer,
  `laps_lead` integer,
  `kilometers_lead` integer,
  `laps_raced` integer,
  `kilometers_raced` integer
);

CREATE TABLE `engine` (
  `id` integer PRIMARY KEY AUTO_INCREMENT,
  `name` varchar2(1000),
  `nation` varchar2(1000),
  `start_year` year,
  `winner` boolean,
  `world_champion` bolean
);

CREATE TABLE `grand_prix` (
  `id` integer PRIMARY KEY AUTO_INCREMENT,
  `name` varchar2(1000),
  `country` varchar2(1000),
  `start_year` year
);

CREATE TABLE `grand_prix_driver_pairings` (
  `driver` integer,
  `constructor` integer,
  `engine` integer,
  `grand_prix` integer,
  `grid_position` integer,
  `race_position` integer,
  `points` integer,
  `season` year,
  `dnf` boolean
);

CREATE TABLE `driver_season_stats` (
  `driver` integer,
  `constructor` integer,
  `engine` integer,
  `season` integer,
  `place` integer,
  `fastest_laps` integer,
  `laps_lead` integer,
  `kilometers_lead` integer,
  `laps_raced` integer,
  `kilometers_raced` integer
);

ALTER TABLE `constructor_driver_pairings` ADD FOREIGN KEY (`driver`) REFERENCES `driver` (`id`);

ALTER TABLE `constructor_driver_pairings` ADD FOREIGN KEY (`constructor`) REFERENCES `constructor` (`id`);

ALTER TABLE `grand_prix_driver_pairings` ADD FOREIGN KEY (`driver`) REFERENCES `driver` (`id`);

ALTER TABLE `grand_prix_driver_pairings` ADD FOREIGN KEY (`constructor`) REFERENCES `constructor` (`id`);

ALTER TABLE `grand_prix_driver_pairings` ADD FOREIGN KEY (`engine`) REFERENCES `engine` (`id`);

ALTER TABLE `grand_prix_driver_pairings` ADD FOREIGN KEY (`grand_prix`) REFERENCES `grand_prix` (`id`);

ALTER TABLE `driver_season_stats` ADD FOREIGN KEY (`driver`) REFERENCES `driver` (`id`);

ALTER TABLE `driver_season_stats` ADD FOREIGN KEY (`constructor`) REFERENCES `constructor` (`id`);

ALTER TABLE `driver_season_stats` ADD FOREIGN KEY (`engine`) REFERENCES `engine` (`id`);
