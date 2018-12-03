#
# SQL Export
# Created by Querious (201048)
# Created: 3 December 2018 at 23:23:22 CET
# Encoding: Unicode (UTF-8)
#


SET @PREVIOUS_FOREIGN_KEY_CHECKS = @@FOREIGN_KEY_CHECKS;
SET FOREIGN_KEY_CHECKS = 0;


DROP TABLE IF EXISTS `comments`;
DROP TABLE IF EXISTS `posts`;
DROP TABLE IF EXISTS `users`;


CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(128) DEFAULT NULL,
  `last_name` varchar(128) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(128) DEFAULT NULL,
  `city` varchar(50) DEFAULT NULL,
  `user_type` tinyint(4) NOT NULL DEFAULT '0',
  `phone` varchar(13) DEFAULT NULL,
  `birthdate` date DEFAULT NULL,
  `bio` text,
  `education` varchar(200) DEFAULT NULL,
  `company` varchar(150) DEFAULT NULL,
  `industry` varchar(200) DEFAULT NULL,
  `role` varchar(64) DEFAULT NULL,
  `recruitment` varchar(64) DEFAULT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `city_id` (`city`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;


CREATE TABLE `posts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `content` text,
  `user_id` int(11) DEFAULT '0',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `allow_comments` tinyint(4) NOT NULL DEFAULT '1',
  `is_pinned` tinyint(4) NOT NULL DEFAULT '0',
  `tags` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `posts_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;


CREATE TABLE `comments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` text,
  `user_id` int(11) DEFAULT '0',
  `post_id` int(11) DEFAULT '0',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `post_id` (`post_id`),
  CONSTRAINT `comments_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `comments_ibfk_2` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8;




SET FOREIGN_KEY_CHECKS = @PREVIOUS_FOREIGN_KEY_CHECKS;


SET @PREVIOUS_FOREIGN_KEY_CHECKS = @@FOREIGN_KEY_CHECKS;
SET FOREIGN_KEY_CHECKS = 0;


LOCK TABLES `users` WRITE;
ALTER TABLE `users` DISABLE KEYS;
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `password`, `city`, `user_type`, `phone`, `birthdate`, `bio`, `education`, `company`, `industry`, `role`, `recruitment`, `created_at`, `updated_at`) VALUES 
	(1,'John','Doe','john@doe.com','admin123','Amsterdam',0,NULL,NULL,NULL,'Erasmus University','Cisco','Software','Mentor',NULL,'2018-11-29 16:50:13','2018-11-29 16:50:13'),
	(2,'Jane','Doe','jane@doe.com','jane123','Utrecht',0,NULL,NULL,NULL,'University of Warsaw','Goldman Sachs','Finance','Mentor',NULL,'2018-11-29 16:50:26','2018-11-29 16:50:26'),
	(3,'Jack','O\'Hearts','jack@hearts.com','jack123','Nijmegen',0,NULL,NULL,NULL,'Bocconi',NULL,'Hardware','Mentee',NULL,'2018-11-29 16:52:45','2018-11-29 16:52:45'),
	(8,'Elvis','Costello','test@email.com','$2y$10$H2l29b450QcFtz2pmfsyquke02kZIewPxYaEO9Pu3d04QVHh9orfO','Amsterdam',0,'123456789','2000-01-01',NULL,'Utrecht University','companyname','Entertainment','Mentor','Not interested','2018-11-29 17:08:03','2018-12-03 14:12:54'),
	(10,'Newer','Account','sample@email.com','$2y$10$wUNC9fGzmaYmtnoORJFl.O5EiKXKJ25PVZCypKt7nS6.Up/DEEqYq','Rotterdam',0,NULL,NULL,NULL,'University of Eindhoven',NULL,'Health','Mentee',NULL,'2018-11-30 01:09:42','2018-11-30 01:23:35'),
	(11,'Admin','McAdmin','admin@admin.com','$2y$10$ppGIAxu4WC0TD..Jywwg9eMPJA76GkHQptPeT4xikfcaMkuJthJIa','Rotterdam',1,'600600600','1990-10-10',NULL,'Delft','Restart','Software','Mentee','Not interested','2018-11-30 21:09:10','2018-12-03 21:34:27'),
	(12,'I have','no name','no@name.com','$2y$10$9pktjP9vYSG82XN35rlc0OyE5EbnP9OTIDCBEf4E5nzllgkzk4zSm','The Hague',0,NULL,NULL,NULL,NULL,NULL,'Entertainment','Mentor',NULL,'2018-12-01 12:23:07','2018-12-01 12:23:07'),
	(16,'June','Carter','june@carter.com','admin123','Eindhoven',0,NULL,'1930-01-01',NULL,NULL,NULL,'Entertainment','Mentee',NULL,'2018-12-03 23:11:14','2018-12-03 23:11:14'),
	(17,'Amy ','McAmy','amy@amy.com','amy1234','Eindhoven',0,'601214536','1950-05-12',NULL,NULL,NULL,'Hardware','Mentor',NULL,'2018-12-03 23:12:28','2018-12-03 23:12:28'),
	(18,'Britta','O\'Britta','britta@britta.com','britta2334','Rotterdam',0,'503153832','1980-02-13',NULL,'Erasmus University','CiC Rotterdam','Real estate','Mentee','Interested','2018-12-03 23:15:34','2018-12-03 23:15:34'),
	(19,'Celine','von Celine','celine@celine.com','celine1234','Utrecht',0,'242153958','1953-03-12',NULL,'Eindhoven University','Picnic','Software','Mentor','Interested','2018-12-03 23:21:27','2018-12-03 23:21:27'),
	(20,'Deborah','de Deborah','deborah@deborah.com','debbie23432','Rotterdam',0,'32342134','1995-12-12',NULL,'Erasmus University','Picnic','Hardware',NULL,'Not interested','2018-12-03 23:22:46','2018-12-03 23:22:46');
ALTER TABLE `users` ENABLE KEYS;
UNLOCK TABLES;


LOCK TABLES `posts` WRITE;
ALTER TABLE `posts` DISABLE KEYS;
INSERT INTO `posts` (`id`, `title`, `content`, `user_id`, `created_at`, `updated_at`, `allow_comments`, `is_pinned`, `tags`) VALUES 
	(1,'title 1','Sample post',1,'2018-11-29 16:54:28','2018-11-29 16:54:28',1,0,'amsterdam networking'),
	(2,'title 2','Another sample post',2,'2018-11-29 16:54:36','2018-11-29 16:54:36',1,0,'rotterdam event'),
	(11,'title 11','Test post33',8,'2018-12-01 04:35:25','2018-12-03 14:27:15',1,0,'suggestion'),
	(12,'title 12','Hope it works',11,'2018-12-01 04:38:58','2018-12-01 04:38:58',1,0,'suggestion'),
	(13,'title 13','I didn\'t fill out my profile.',12,'2018-12-01 12:23:24','2018-12-01 12:27:48',1,0,'amsterdam event announcement'),
	(14,'title 14','dsasfdds',12,'2018-12-01 12:27:46','2018-12-01 12:27:46',1,0,'education '),
	(15,'Test ','Please work',11,'2018-12-01 13:07:33','2018-12-01 13:07:33',1,0,NULL),
	(16,'Please no SQL injections','I\'m making posts so the database isn\'t empty but I don\'t have much to say right now.2',8,'2018-12-01 13:42:05','2018-12-03 14:39:10',1,1,NULL),
	(18,'Test tags','yada yada yada yada ',8,'2018-12-01 21:17:50','2018-12-03 20:41:03',1,0,'Rotterdam social ');
ALTER TABLE `posts` ENABLE KEYS;
UNLOCK TABLES;


LOCK TABLES `comments` WRITE;
ALTER TABLE `comments` DISABLE KEYS;
INSERT INTO `comments` (`id`, `content`, `user_id`, `post_id`, `created_at`, `updated_at`) VALUES 
	(1,'Test test test',2,2,'2018-11-29 16:54:48','2018-11-29 16:54:48'),
	(2,'Another test',3,1,'2018-11-29 16:54:56','2018-11-29 16:54:56'),
	(3,'Comment comment comment',1,2,'2018-11-29 16:55:10','2018-11-29 16:55:10'),
	(4,'Words words words',3,2,'2018-11-29 16:55:24','2018-11-29 16:55:24'),
	(11,'Test test test test tesaaa',8,2,'2018-12-01 02:51:03','2018-12-01 02:51:03'),
	(20,'Please work',8,11,'2018-12-01 04:35:31','2018-12-01 04:35:31'),
	(22,'Your text here',11,11,'2018-12-01 04:38:25','2018-12-01 04:38:25'),
	(23,'Uff.',11,12,'2018-12-01 04:39:04','2018-12-01 04:39:04'),
	(26,'Your text here',12,13,'2018-12-01 12:30:09','2018-12-01 12:30:09');
ALTER TABLE `comments` ENABLE KEYS;
UNLOCK TABLES;




SET FOREIGN_KEY_CHECKS = @PREVIOUS_FOREIGN_KEY_CHECKS;


