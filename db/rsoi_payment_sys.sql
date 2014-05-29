-- MySQL dump 10.13  Distrib 5.6.17, for Win32 (x86)
--
-- Host: localhost    Database: rsoi_payment_sys
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
-- Table structure for table `account_bill`
--

DROP TABLE IF EXISTS `account_bill`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `account_bill` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `number` varchar(8) NOT NULL,
  `balance` int(11) NOT NULL,
  `csv` varchar(3) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `number` (`number`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account_bill`
--

LOCK TABLES `account_bill` WRITE;
/*!40000 ALTER TABLE `account_bill` DISABLE KEYS */;
INSERT INTO `account_bill` VALUES (1,'12341234',8970,'123'),(2,'12345678',896,'123'),(3,'87654321',1256,'123');
/*!40000 ALTER TABLE `account_bill` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `account_client`
--

DROP TABLE IF EXISTS `account_client`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `account_client` (
  `name` varchar(50) NOT NULL,
  `xmlrpc_page` varchar(50) NOT NULL,
  `success_page` varchar(50) NOT NULL,
  `code` varchar(8) NOT NULL,
  PRIMARY KEY (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account_client`
--

LOCK TABLES `account_client` WRITE;
/*!40000 ALTER TABLE `account_client` DISABLE KEYS */;
INSERT INTO `account_client` VALUES ('Центральный офис','http://localhost:1301/xmlrpc/','http://center.rsoi.ru/account/success/','W91U15BX');
/*!40000 ALTER TABLE `account_client` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `account_transaction`
--

DROP TABLE IF EXISTS `account_transaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `account_transaction` (
  `code` varchar(8) NOT NULL,
  `sender_id` int(11) DEFAULT NULL,
  `recipient_id` int(11) NOT NULL,
  `amount` int(11) NOT NULL,
  `create_time` datetime NOT NULL,
  `passed_time` datetime DEFAULT NULL,
  `is_passed` tinyint(1) NOT NULL,
  `client_id` varchar(8) NOT NULL,
  PRIMARY KEY (`code`),
  KEY `sender_id_refs_id_f4a38ac8` (`sender_id`),
  KEY `recipient_id_refs_id_f4a38ac8` (`recipient_id`),
  KEY `client_id_refs_code_d66abcff` (`client_id`),
  CONSTRAINT `client_id_refs_code_d66abcff` FOREIGN KEY (`client_id`) REFERENCES `account_client` (`code`),
  CONSTRAINT `recipient_id_refs_id_f4a38ac8` FOREIGN KEY (`recipient_id`) REFERENCES `account_bill` (`id`),
  CONSTRAINT `sender_id_refs_id_f4a38ac8` FOREIGN KEY (`sender_id`) REFERENCES `account_bill` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account_transaction`
--

LOCK TABLES `account_transaction` WRITE;
/*!40000 ALTER TABLE `account_transaction` DISABLE KEYS */;
INSERT INTO `account_transaction` VALUES ('1HM87PZF',NULL,2,124,'2014-05-29 17:11:01',NULL,0,'W91U15BX'),('1VNG0KHB',1,2,104,'2014-05-29 17:36:09','2014-05-29 17:36:14',1,'W91U15BX'),('47DCZPYV',1,2,104,'2014-05-29 19:32:29','2014-05-29 19:32:35',1,'W91U15BX'),('84KJG3B6',1,2,64,'2014-05-29 17:12:53','2014-05-29 17:12:59',1,'W91U15BX'),('9BDH6RW1',NULL,2,124,'2014-05-29 17:09:15',NULL,0,'W91U15BX'),('9OJDY1RI',1,2,166,'2014-05-29 16:16:24','2014-05-29 16:16:31',1,'W91U15BX'),('ANSFZM6X',1,2,124,'2014-05-29 17:11:54','2014-05-29 17:12:02',1,'W91U15BX'),('ANVEO1TF',NULL,2,124,'2014-05-29 17:07:45',NULL,0,'W91U15BX'),('FJHLCLG6',1,3,110,'2014-05-29 17:43:26','2014-05-29 17:43:31',1,'W91U15BX'),('KF4ZPV4F',1,2,124,'2014-05-29 20:07:54','2014-05-29 20:08:03',1,'W91U15BX'),('LJ130EEK',1,2,110,'2014-05-29 17:15:29','2014-05-29 17:15:38',1,'W91U15BX'),('R6GC9WSH',1,3,124,'2014-05-29 14:05:29','2014-05-29 14:05:33',1,'W91U15BX'),('V7ZLMJUG',NULL,2,166,'2014-05-29 20:09:30',NULL,0,'W91U15BX');
/*!40000 ALTER TABLE `account_transaction` ENABLE KEYS */;
UNLOCK TABLES;

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
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can add permission',2,'add_permission'),(5,'Can change permission',2,'change_permission'),(6,'Can delete permission',2,'delete_permission'),(7,'Can add group',3,'add_group'),(8,'Can change group',3,'change_group'),(9,'Can delete group',3,'delete_group'),(10,'Can add user',4,'add_user'),(11,'Can change user',4,'change_user'),(12,'Can delete user',4,'delete_user'),(13,'Can add content type',5,'add_contenttype'),(14,'Can change content type',5,'change_contenttype'),(15,'Can delete content type',5,'delete_contenttype'),(16,'Can add session',6,'add_session'),(17,'Can change session',6,'change_session'),(18,'Can delete session',6,'delete_session');
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$12000$3f8scLspgLzJ$0diZyO87BLkGnNqqKNho0PNBY4Zd8sOKwnKlYUsfmNg=','2014-05-29 17:36:36',1,'marcky','','','t.mars@mail.ru',1,1,'2014-05-28 22:39:28');
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
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2014-05-28 23:27:36',1,7,'1','12345678',1,''),(2,'2014-05-28 23:27:45',1,7,'2','87654321',1,''),(3,'2014-05-28 23:28:06',1,7,'3','12341234',1,''),(4,'2014-05-28 23:31:27',1,7,'3','12341234',2,'Изменен csv.'),(5,'2014-05-28 23:31:32',1,7,'2','87654321',2,'Изменен csv.'),(6,'2014-05-28 23:31:37',1,7,'1','12345678',2,'Изменен csv.'),(7,'2014-05-29 12:21:04',1,7,'1','12341234',1,''),(8,'2014-05-29 12:21:12',1,7,'2','12345678',1,''),(9,'2014-05-29 12:21:23',1,7,'3','87654321',1,''),(10,'2014-05-29 12:21:31',1,7,'3','87654321',2,'Изменен csv.'),(11,'2014-05-29 13:17:41',1,8,'Y52OXP8L','Y52OXP8L ($110)',3,''),(12,'2014-05-29 13:17:41',1,8,'ILBGZQ4L','ILBGZQ4L ($166)',3,''),(13,'2014-05-29 13:17:41',1,8,'137CJYIX','137CJYIX ($110)',3,''),(14,'2014-05-29 13:47:05',1,9,'W91U15BX','Центральный офис (W91U15BX)',1,''),(15,'2014-05-29 14:00:23',1,9,'W91U15BX','Центральный офис (W91U15BX)',2,'Изменен xmlrpc_page.'),(16,'2014-05-29 14:03:50',1,8,'SJKZTG5O','SJKZTG5O ($166)',3,''),(17,'2014-05-29 14:03:50',1,8,'HO0PSXM4','HO0PSXM4 ($166)',3,''),(18,'2014-05-29 14:03:50',1,8,'3QGRJV1B','3QGRJV1B ($142)',3,''),(19,'2014-05-29 14:03:50',1,8,'0JL32X87','0JL32X87 ($104)',3,''),(20,'2014-05-29 14:05:13',1,7,'1','12341234',2,'Изменен balance.'),(21,'2014-05-29 17:12:42',1,9,'W91U15BX','Центральный офис (W91U15BX)',2,'Изменен success_page.'),(22,'2014-05-29 17:14:32',1,9,'W91U15BX','Центральный офис (W91U15BX)',2,'Изменен success_page.'),(23,'2014-05-29 17:36:46',1,9,'W91U15BX','Центральный офис (W91U15BX)',2,'Изменен success_page.');
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
INSERT INTO `django_content_type` VALUES (1,'log entry','admin','logentry'),(2,'permission','auth','permission'),(3,'group','auth','group'),(4,'user','auth','user'),(5,'content type','contenttypes','contenttype'),(6,'session','sessions','session'),(7,'bill','account','bill'),(8,'transaction','account','transaction'),(9,'client','account','client');
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
INSERT INTO `django_session` VALUES ('12sodn30pdzc03hd7srgab8qi7ast3zt','YTUzYzFjOWEyZjk5YTUxMjQxMGJmYjA2NmI5NzM4MWM1YTI3NTA1YTp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6MX0=','2014-06-12 14:05:58'),('1rrlsmtnaurg6bez2ry51trnwndtfmdb','YTUzYzFjOWEyZjk5YTUxMjQxMGJmYjA2NmI5NzM4MWM1YTI3NTA1YTp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6MX0=','2014-06-12 17:36:36'),('du0bogfxggjh538y85qhdm36s8jgecmu','YTUzYzFjOWEyZjk5YTUxMjQxMGJmYjA2NmI5NzM4MWM1YTI3NTA1YTp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6MX0=','2014-06-12 00:34:36'),('hotb0xku88hni7ntyq0pzs5u8tnnliy8','YTUzYzFjOWEyZjk5YTUxMjQxMGJmYjA2NmI5NzM4MWM1YTI3NTA1YTp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6MX0=','2014-06-11 23:25:09'),('kb9ufjlj0rcm8jd4svd6rs7ohilxrbvy','YTUzYzFjOWEyZjk5YTUxMjQxMGJmYjA2NmI5NzM4MWM1YTI3NTA1YTp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6MX0=','2014-06-12 13:16:19'),('kmso9cilo5vkt7tubdam18yhtkne80zg','YTUzYzFjOWEyZjk5YTUxMjQxMGJmYjA2NmI5NzM4MWM1YTI3NTA1YTp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6MX0=','2014-06-12 16:16:10'),('lz2lnlmxcufw31p02d3p2jq7xf73nv78','YTUzYzFjOWEyZjk5YTUxMjQxMGJmYjA2NmI5NzM4MWM1YTI3NTA1YTp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6MX0=','2014-06-11 23:31:21'),('psec4n4r5m4wk75mmzw6u1vfe03tvly4','YTUzYzFjOWEyZjk5YTUxMjQxMGJmYjA2NmI5NzM4MWM1YTI3NTA1YTp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6MX0=','2014-06-12 14:04:56'),('qpmp7ovjopjp5tb85ojng7kr3r4fizry','YTUzYzFjOWEyZjk5YTUxMjQxMGJmYjA2NmI5NzM4MWM1YTI3NTA1YTp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6MX0=','2014-06-12 12:20:43'),('qx1c9ywkzhk3zc476y1a0a9lq03k4anp','YTUzYzFjOWEyZjk5YTUxMjQxMGJmYjA2NmI5NzM4MWM1YTI3NTA1YTp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6MX0=','2014-06-12 13:43:43'),('siqe6aamfz94c3u4oezxkr4725btv33m','YTUzYzFjOWEyZjk5YTUxMjQxMGJmYjA2NmI5NzM4MWM1YTI3NTA1YTp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6MX0=','2014-06-12 17:14:19'),('syzsecrlbx5fe2enj5cnkz35w46m4vxn','YTUzYzFjOWEyZjk5YTUxMjQxMGJmYjA2NmI5NzM4MWM1YTI3NTA1YTp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6MX0=','2014-06-12 17:11:49'),('tj78ke9zwd8ymzlhwa04ewxsdm9wsndz','YTUzYzFjOWEyZjk5YTUxMjQxMGJmYjA2NmI5NzM4MWM1YTI3NTA1YTp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6MX0=','2014-06-12 16:05:26'),('xglmuyvznu1kbvhssnvu0pryqnxylm22','YTUzYzFjOWEyZjk5YTUxMjQxMGJmYjA2NmI5NzM4MWM1YTI3NTA1YTp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6MX0=','2014-06-11 22:40:09');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2014-05-29 23:11:41
