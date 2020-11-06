CREATE DATABASE `remindme`;
CREATE TABLE `status` (
  `id` int NOT NULL AUTO_INCREMENT,
  `statusName` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `tag` (
  `id` int NOT NULL AUTO_INCREMENT,
  `tagName` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `email` varchar(255) DEFAULT NULL,
  `mobileNumber` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `userName` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `notebook` (
  `id` int NOT NULL AUTO_INCREMENT,
  `noteBookName` varchar(255) DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user` (`user_id`),
  CONSTRAINT `user` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `note` (
  `id` int NOT NULL AUTO_INCREMENT,
  `endDate` date DEFAULT NULL,
  `noteDescription` varchar(255) DEFAULT NULL,
  `noteName` varchar(255) DEFAULT NULL,
  `remainderDate` date DEFAULT NULL,
  `startDate` date DEFAULT NULL,
  `noteBook_id` int DEFAULT NULL,
  `status_id` int DEFAULT NULL,
  `tag_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `status` (`status_id`),
  KEY `tag` (`tag_id`),
  KEY `noteBook` (`noteBook_id`),
  CONSTRAINT `noteBook` FOREIGN KEY (`noteBook_id`) REFERENCES `notebook` (`id`),
  CONSTRAINT `status` FOREIGN KEY (`status_id`) REFERENCES `status` (`id`),
  CONSTRAINT `tag` FOREIGN KEY (`tag_id`) REFERENCES `tag` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;