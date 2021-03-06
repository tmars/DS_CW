-- MySQL dump 10.13  Distrib 5.6.17, for Win32 (x86)
--
-- Host: localhost    Database: rsoi_center_sys
-- ------------------------------------------------------
-- Server version	5.5.25

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES cp1251 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `group_id` (`group_id`,`permission_id`),
  KEY `auth_group_permissions_5f412f9a` (`group_id`),
  KEY `auth_group_permissions_83d7f98b` (`permission_id`),
  CONSTRAINT `group_id_refs_id_f4b32aac` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `permission_id_refs_id_6ba0f519` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `content_type_id` (`content_type_id`,`codename`),
  KEY `auth_permission_37ef4eb4` (`content_type_id`),
  CONSTRAINT `content_type_id_refs_id_d043b34a` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can add permission',2,'add_permission'),(5,'Can change permission',2,'change_permission'),(6,'Can delete permission',2,'delete_permission'),(7,'Can add group',3,'add_group'),(8,'Can change group',3,'change_group'),(9,'Can delete group',3,'delete_group'),(10,'Can add user',4,'add_user'),(11,'Can change user',4,'change_user'),(12,'Can delete user',4,'delete_user'),(13,'Can add content type',5,'add_contenttype'),(14,'Can change content type',5,'change_contenttype'),(15,'Can delete content type',5,'delete_contenttype'),(16,'Can add session',6,'add_session'),(17,'Can change session',6,'change_session'),(18,'Can delete session',6,'delete_session'),(19,'Can add brand',7,'add_brand'),(20,'Can change brand',7,'change_brand'),(21,'Can delete brand',7,'delete_brand');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime NOT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(30) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(75) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$12000$WzjF5eWsjDK9$jop0nI4reiHebt9smPE7UPNJ9m4zAiVow1K8+O8sQuU=','2014-05-29 17:31:01',1,'marcky','','','t.mars@mail.ru',1,1,'2014-05-26 12:45:50'),(2,'pbkdf2_sha256$12000$t68v5wSX3dEN$lEE1XbsUgxOIybBLlj2Ka1mVsBZK/UdtNfU6o/B9x5o=','2014-05-29 17:30:29',0,'test','�������','��������','talipov.mars@gmail.com',0,1,'2014-05-28 09:39:06');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`group_id`),
  KEY `auth_user_groups_6340c63c` (`user_id`),
  KEY `auth_user_groups_5f412f9a` (`group_id`),
  CONSTRAINT `group_id_refs_id_274b862c` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `user_id_refs_id_40c41112` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`permission_id`),
  KEY `auth_user_user_permissions_6340c63c` (`user_id`),
  KEY `auth_user_user_permissions_83d7f98b` (`permission_id`),
  CONSTRAINT `permission_id_refs_id_35d9ac25` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `user_id_refs_id_4dc23c39` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_order`
--

DROP TABLE IF EXISTS `catalog_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `office_id` int(11) NOT NULL,
  `order` int(11) NOT NULL,
  `car` int(11) NOT NULL,
  `car_name` varchar(255) NOT NULL,
  `sum` int(11) NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `transaction_code` varchar(8) DEFAULT NULL,
  `status` varchar(10) NOT NULL,
  `create_time` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `office_id_refs_id_53b2e82c` (`office_id`),
  KEY `user_id_refs_id_a07195c1` (`user_id`),
  CONSTRAINT `office_id_refs_id_53b2e82c` FOREIGN KEY (`office_id`) REFERENCES `xml_rpc_server_office` (`id`),
  CONSTRAINT `user_id_refs_id_a07195c1` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_order`
--

LOCK TABLES `catalog_order` WRITE;
/*!40000 ALTER TABLE `catalog_order` DISABLE KEYS */;
INSERT INTO `catalog_order` VALUES (16,1,4,44,1,'Skoda Laguna Grandtour 2.2 dCi Dynamique',124,'2014-05-29','2014-05-30','KF4ZPV4F','paid','2014-05-29 20:02:18'),(17,1,4,45,2,'Audi 320 Ci',110,'2014-05-29','2014-05-30',NULL,'cancelled','2014-05-29 20:08:08'),(18,1,4,46,3,'Honda IS 250 4WD',166,'2014-05-29','2014-05-30','V7ZLMJUG','cancelled','2014-05-29 20:09:27'),(19,1,4,47,4,'Citroen Vectra 2.0 DTI Hatchback',104,'2014-05-29','2014-05-30','OQNV0JG2','paid','2014-05-29 20:23:40'),(20,1,5,2,26,'Mazda Fabia 1.4 TDI Classic',59,'2014-05-29','2014-05-30',NULL,'cancelled','2014-05-29 20:40:55'),(21,1,5,3,34,'Audi 320 Ci',150,'2014-05-29','2014-05-30',NULL,'cancelled','2014-05-29 20:44:17'),(22,1,5,4,34,'Audi 320 Ci',150,'2014-05-29','2014-05-30',NULL,'cancelled','2014-05-29 20:52:57'),(23,1,5,5,34,'Audi 320 Ci',150,'2014-05-29','2014-05-30',NULL,'cancelled','2014-05-29 20:53:21'),(24,1,5,6,34,'Audi 320 Ci',150,'2014-05-29','2014-05-30',NULL,'cancelled','2014-05-29 20:54:10');
/*!40000 ALTER TABLE `catalog_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime NOT NULL,
  `user_id` int(11) NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_6340c63c` (`user_id`),
  KEY `django_admin_log_37ef4eb4` (`content_type_id`),
  CONSTRAINT `content_type_id_refs_id_93d2d1f8` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `user_id_refs_id_c0d12874` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2014-05-28 09:39:06',1,4,'2','test',1,''),(2,'2014-05-28 09:39:39',1,4,'2','test',2,'������� first_name,last_name � email.'),(3,'2014-05-28 22:28:46',1,8,'8','office1 (14)',3,''),(4,'2014-05-28 22:28:46',1,8,'7','office1 (13)',3,''),(5,'2014-05-28 22:28:46',1,8,'6','office1 (12)',3,''),(6,'2014-05-28 22:28:46',1,8,'5','office1 (11)',3,''),(7,'2014-05-28 22:28:46',1,8,'4','office1 (10)',3,''),(8,'2014-05-28 22:28:46',1,8,'3','office1 (9)',3,''),(9,'2014-05-28 22:28:46',1,8,'2','office1 (8)',3,''),(10,'2014-05-28 23:01:55',1,9,'office2','office2',2,'������� bill.'),(11,'2014-05-28 23:02:02',1,9,'office1','office1',2,'������� bill.'),(12,'2014-05-29 13:18:17',1,8,'18','office1 (24)',3,''),(13,'2014-05-29 13:18:17',1,8,'17','office1 (23)',3,''),(14,'2014-05-29 13:18:17',1,8,'16','office1 (22)',3,''),(15,'2014-05-29 13:18:17',1,8,'15','office1 (21)',3,''),(16,'2014-05-29 13:18:18',1,8,'14','office1 (20)',3,''),(17,'2014-05-29 13:18:18',1,8,'13','office1 (19)',3,''),(18,'2014-05-29 13:18:18',1,8,'12','office1 (18)',3,''),(19,'2014-05-29 13:18:18',1,8,'11','office1 (17)',3,''),(20,'2014-05-29 13:18:18',1,8,'10','office1 (16)',3,''),(21,'2014-05-29 13:18:18',1,8,'9','office1 (15)',3,''),(22,'2014-05-29 14:04:26',1,8,'22','office1 (28)',3,''),(23,'2014-05-29 14:04:26',1,8,'21','office1 (27)',3,''),(24,'2014-05-29 14:04:26',1,8,'20','office1 (26)',3,''),(25,'2014-05-29 14:04:27',1,8,'19','office1 (25)',3,''),(26,'2014-05-29 19:57:06',1,8,'15','office1 (43)',3,''),(27,'2014-05-29 19:57:06',1,8,'14','office1 (42)',3,''),(28,'2014-05-29 19:57:06',1,8,'13','office1 (41)',3,''),(29,'2014-05-29 19:57:06',1,8,'12','office1 (40)',3,''),(30,'2014-05-29 19:57:06',1,8,'11','office1 (39)',3,''),(31,'2014-05-29 19:57:06',1,8,'10','office1 (38)',3,''),(32,'2014-05-29 19:57:06',1,8,'9','office1 (37)',3,''),(33,'2014-05-29 19:57:06',1,8,'8','office1 (36)',3,''),(34,'2014-05-29 19:57:06',1,8,'7','office2 (1)',3,''),(35,'2014-05-29 19:57:06',1,8,'6','office1 (35)',3,''),(36,'2014-05-29 19:57:06',1,8,'5','office1 (34)',3,''),(37,'2014-05-29 19:57:06',1,8,'4','office1 (33)',3,''),(38,'2014-05-29 19:57:06',1,8,'3','office1 (32)',3,''),(39,'2014-05-29 19:57:07',1,8,'2','office1 (31)',3,''),(40,'2014-05-29 19:57:07',1,8,'1','office1 (30)',3,'');
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `app_label` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'log entry','admin','logentry'),(2,'permission','auth','permission'),(3,'group','auth','group'),(4,'user','auth','user'),(5,'content type','contenttypes','contenttype'),(6,'session','sessions','session'),(7,'brand','catalog','brand'),(8,'order','catalog','order'),(9,'office','xml_rpc_server','office');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_b7b81f0c` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('26lp87ps61cp2ixc1gq4um0yfv18laoe','MTliMGFkNGYwNjZiZGIxMDY0NWMzYTU5NjQ0MTkzZmU1YzQ0NTg1MDp7fQ==','2014-06-11 20:01:20'),('2bas9c7vbnv49i1ojtjutyx7xu0w0blt','YWZhOThmOTMwYjEyNmQ4NzY1YzllMDU2NGU1YmExMDk4N2ZiMmFhZjp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6MX0=','2014-06-09 20:11:50'),('4mikeayodaodasu23xnw423kmv55uptl','MGY2MDdhOTg5YjI5N2E5ZTYxMjFiY2ZjYTcwZjhiYWVhMWI0NmJjMzp7InN0YXJ0X2RhdGUiOiIyMDE0LTA1LTI5IiwiZW5kX2RhdGUiOiIyMDE0LTA1LTMwIn0=','2014-06-12 12:51:33'),('4mtxq4xx7ukl8oq8oe1s38hs49oes7hf','MTliMGFkNGYwNjZiZGIxMDY0NWMzYTU5NjQ0MTkzZmU1YzQ0NTg1MDp7fQ==','2014-06-11 19:50:25'),('5jyx7whe5s46xs4xcq3vs6xm24arj21b','MTliMGFkNGYwNjZiZGIxMDY0NWMzYTU5NjQ0MTkzZmU1YzQ0NTg1MDp7fQ==','2014-06-12 00:10:42'),('5vjahuaatn1hlvu2gdjknfmh1wz5bqv5','OWJmMDhlOWNmN2QxODIxNDkwYjdlNWM1MDJiODNkYzUzMzRjODM2Zjp7ImVuZF9kYXRlIjoiMjAxNC0wNS0zMCIsIl9hdXRoX3VzZXJfaWQiOjEsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwic3RhcnRfZGF0ZSI6IjIwMTQtMDUtMjkifQ==','2014-06-12 17:15:25'),('6ylsny4ncrd4tcus5vctf2c6quqcf2vc','MTliMGFkNGYwNjZiZGIxMDY0NWMzYTU5NjQ0MTkzZmU1YzQ0NTg1MDp7fQ==','2014-06-09 20:11:02'),('77m5fvcjbiwyc2rxyqs46j301gno2iz1','YWZhOThmOTMwYjEyNmQ4NzY1YzllMDU2NGU1YmExMDk4N2ZiMmFhZjp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6MX0=','2014-06-10 09:17:01'),('a0xpgsuctob7b9mqwlebzs81nns4h18g','YWZhOThmOTMwYjEyNmQ4NzY1YzllMDU2NGU1YmExMDk4N2ZiMmFhZjp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6MX0=','2014-06-11 23:31:02'),('aelhotq38rzoexkl1rvtipo5vmdzzzvq','MzQ3YmZhNjAxMjFhMDEyNDVlNWM5OWJkNDJjNzAxYmUyZGJlYjQ1Nzp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6MSwiZW5kX2RhdGUiOiIyMDE0LTA1LTMwIiwic3RhcnRfZGF0ZSI6IjIwMTQtMDUtMjkifQ==','2014-06-12 17:12:49'),('brok9rzc56e92evut3o0dtll5t3qectz','NmZmYWIwYTgxNmYwYTczMWY1MjU1YjIxMWYzZWU2NzZmNjJhNWZjNDp7ImVuZF9kYXRlIjoiMjAxNC0wNi0wMSIsIl9hdXRoX3VzZXJfaWQiOjEsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwic3RhcnRfZGF0ZSI6IjIwMTQtMDUtMzAifQ==','2014-06-12 00:34:02'),('f6t92himyb07msdmzq9u3o9mj86up6yo','MmI0ZmM4MTE2ZDI1YWJmNGViZmNhOGY1YmE0MzU0NzM0ZjE4MGE0ODp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6Mn0=','2014-06-11 10:26:41'),('imgoxop84j8csfiwnq5zzrderlo85po2','MTliMGFkNGYwNjZiZGIxMDY0NWMzYTU5NjQ0MTkzZmU1YzQ0NTg1MDp7fQ==','2014-06-11 11:09:44'),('jff054e7djm80cb4ex0o2hto42j758ga','YWM2ZmZkOGVlZjA5MDMzYjU1YzFhODc5NzAzMWJiNmQwMzk1YjcwYzp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6MiwiZW5kX2RhdGUiOiIyMDE0LTA1LTMwIiwic3RhcnRfZGF0ZSI6IjIwMTQtMDUtMjkifQ==','2014-06-12 12:51:20'),('kyjhkloj0o8qa2bs04kigkbk9gfc943d','YWZhOThmOTMwYjEyNmQ4NzY1YzllMDU2NGU1YmExMDk4N2ZiMmFhZjp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6MX0=','2014-06-11 22:48:07'),('nalb9hihode5upiq8wn8944d9mqrj6iy','MzQ3YmZhNjAxMjFhMDEyNDVlNWM5OWJkNDJjNzAxYmUyZGJlYjQ1Nzp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6MSwiZW5kX2RhdGUiOiIyMDE0LTA1LTMwIiwic3RhcnRfZGF0ZSI6IjIwMTQtMDUtMjkifQ==','2014-06-12 17:07:40'),('odw625lyua0wqz80hm3uanft24eorgie','YWZhOThmOTMwYjEyNmQ4NzY1YzllMDU2NGU1YmExMDk4N2ZiMmFhZjp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6MX0=','2014-06-09 20:24:03'),('pbizx3pdmob3tu7kvgrgttk5ood99yw0','MTliMGFkNGYwNjZiZGIxMDY0NWMzYTU5NjQ0MTkzZmU1YzQ0NTg1MDp7fQ==','2014-06-11 19:57:10'),('qfyj0huyaw2t60bzqqpcam7ea14ct18t','ZDZkY2U5MzA4NmVjNmYxZDcxOWZjYzMyZDIwNmIwMzg0MTAzOGQ4Njp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6MSwic3RhcnRfZGF0ZSI6IjIwMTQtMDUtMjkiLCJlbmRfZGF0ZSI6IjIwMTQtMDUtMzAifQ==','2014-06-11 22:33:05'),('qtf2noupdsc8r99h6ucyu5spdjvfc75w','MTliMGFkNGYwNjZiZGIxMDY0NWMzYTU5NjQ0MTkzZmU1YzQ0NTg1MDp7fQ==','2014-06-11 19:59:18'),('r52nv5q6skr893706y6h5s5f4wh96w5n','MTliMGFkNGYwNjZiZGIxMDY0NWMzYTU5NjQ0MTkzZmU1YzQ0NTg1MDp7fQ==','2014-06-11 11:38:28'),('t4c0hkyuijvjc36wlxifc2salo5f3hnu','YWZhOThmOTMwYjEyNmQ4NzY1YzllMDU2NGU1YmExMDk4N2ZiMmFhZjp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6MX0=','2014-06-12 17:06:44'),('tdhluefk4uuv6jlgshl1f5cdsithnqpt','MTliMGFkNGYwNjZiZGIxMDY0NWMzYTU5NjQ0MTkzZmU1YzQ0NTg1MDp7fQ==','2014-06-11 20:02:26'),('vsavo799cu19hcq9ms6ncwtjgopwbq51','MmI0ZmM4MTE2ZDI1YWJmNGViZmNhOGY1YmE0MzU0NzM0ZjE4MGE0ODp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6Mn0=','2014-06-11 18:39:07'),('wuhed2fkelemkjpweng7qv6wdlja0sfw','MmI0ZmM4MTE2ZDI1YWJmNGViZmNhOGY1YmE0MzU0NzM0ZjE4MGE0ODp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6Mn0=','2014-06-11 13:52:45'),('yglhrjku8iln6clkx48cmjalraf05gx3','MzQ3YmZhNjAxMjFhMDEyNDVlNWM5OWJkNDJjNzAxYmUyZGJlYjQ1Nzp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6MSwiZW5kX2RhdGUiOiIyMDE0LTA1LTMwIiwic3RhcnRfZGF0ZSI6IjIwMTQtMDUtMjkifQ==','2014-06-12 20:53:03'),('zloejk2oyiawscprem59ikvv0p8nkez8','MTliMGFkNGYwNjZiZGIxMDY0NWMzYTU5NjQ0MTkzZmU1YzQ0NTg1MDp7fQ==','2014-06-11 19:50:36');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xml_rpc_server_office`
--

DROP TABLE IF EXISTS `xml_rpc_server_office`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xml_rpc_server_office` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `url` varchar(50) NOT NULL,
  `bill` varchar(8) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `email` varchar(75) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xml_rpc_server_office`
--

LOCK TABLES `xml_rpc_server_office` WRITE;
/*!40000 ALTER TABLE `xml_rpc_server_office` DISABLE KEYS */;
INSERT INTO `xml_rpc_server_office` VALUES (4,'office1','http://localhost:1302/','12345678',1,'office1@rsoi.ru'),(5,'office2','http://localhost:1303/','87654321',1,'office2@rsoi.ru');
/*!40000 ALTER TABLE `xml_rpc_server_office` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2014-05-29 23:54:48
