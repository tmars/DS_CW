-- MySQL dump 10.13  Distrib 5.6.17, for Win32 (x86)
--
-- Host: localhost    Database: rsoi_office_sys2
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
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can add permission',2,'add_permission'),(5,'Can change permission',2,'change_permission'),(6,'Can delete permission',2,'delete_permission'),(7,'Can add group',3,'add_group'),(8,'Can change group',3,'change_group'),(9,'Can delete group',3,'delete_group'),(10,'Can add user',4,'add_user'),(11,'Can change user',4,'change_user'),(12,'Can delete user',4,'delete_user'),(13,'Can add content type',5,'add_contenttype'),(14,'Can change content type',5,'change_contenttype'),(15,'Can delete content type',5,'delete_contenttype'),(16,'Can add session',6,'add_session'),(17,'Can change session',6,'change_session'),(18,'Can delete session',6,'delete_session'),(19,'Can add car',7,'add_car'),(20,'Can change car',7,'change_car'),(21,'Can delete car',7,'delete_car'),(22,'Can add brand',8,'add_brand'),(23,'Can change brand',8,'change_brand'),(24,'Can delete brand',8,'delete_brand'),(25,'Can add tariff',9,'add_tariff'),(26,'Can change tariff',9,'change_tariff'),(27,'Can delete tariff',9,'delete_tariff');
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
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$12000$ERJNGGv5xCNE$hza0kQ+H6p9rDxAzmbQcim72QmsYBaCuD1HHctas+6Q=','2014-05-29 17:36:39',1,'marcky','','','t.mars@mail.ru',1,1,'2014-05-26 12:51:38');
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
-- Table structure for table `catalog_car`
--

DROP TABLE IF EXISTS `catalog_car`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_car` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `model_name` varchar(100) NOT NULL,
  `pub_date` datetime NOT NULL,
  `body_type` varchar(1) NOT NULL,
  `class_type` varchar(1) NOT NULL,
  `image` varchar(100) NOT NULL,
  `brand_type` int(11) NOT NULL,
  `tarif1` int(11) NOT NULL,
  `tarif2` int(11) NOT NULL,
  `tarif3` int(11) NOT NULL,
  `tarif4` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_car`
--

LOCK TABLES `catalog_car` WRITE;
/*!40000 ALTER TABLE `catalog_car` DISABLE KEYS */;
INSERT INTO `catalog_car` VALUES (1,'Getz 1.6','2014-05-28 21:14:41','h','m','images/cars/car (32).jpg',11,127,114,95,76),(2,'Rio 1.3 RS','2014-05-28 21:14:41','h','m','images/cars/car (11).jpg',5,118,106,88,70),(3,'RX-2','2014-05-28 21:14:41','s','h','images/cars/car (14).jpg',7,126,113,94,75),(4,'Dyane 6 Weekend','2014-05-28 21:14:42','s','h','images/cars/car (33).jpg',13,110,99,82,66),(5,'745i Automatic','2014-05-28 21:14:42','s','h','images/cars/car (4).jpg',1,191,171,143,114),(6,'Grande Punto 1.4 Active','2014-05-28 21:14:43','h','m','images/cars/car (36).jpg',12,145,130,108,87),(7,'Elantra 2.0 CRDi GLS','2014-05-28 21:14:43','h','h','images/cars/car (33).jpg',11,198,178,148,118),(8,'Convertible Sport SMG','2014-05-28 21:14:45','c','h','images/cars/car (10).jpg',1,177,159,132,106),(9,'Civic Coupe VP Automatic','2014-05-28 21:14:45','p','l','images/cars/car (32).jpg',3,92,82,69,55),(10,'Kadett Coupe','2014-05-28 21:14:52','p','l','images/cars/car (30).jpg',14,51,45,38,30),(11,'Octavia 1.9 TDi','2014-05-28 21:14:53','s','m','images/cars/car (30).jpg',8,127,114,95,76),(12,'A6 Avant 3.0 Quattro','2014-05-28 21:14:53','u','h','images/cars/car (10).jpg',0,129,116,96,77),(13,'Clio 3 1.6 Expression Automatic','2014-05-28 21:14:55','h','l','images/cars/car (19).jpg',9,97,87,72,58),(14,'GS 430 Sedan','2014-05-28 21:14:56','s','m','images/cars/car (29).jpg',4,131,117,98,78),(15,'Integra 1.6i','2014-05-28 21:14:57','p','l','images/cars/car (23).jpg',3,70,63,52,42),(16,'100 2.8 E Automatic','2014-05-28 21:14:59','s','m','images/cars/car (9).jpg',0,102,91,76,61),(17,'21','2014-05-28 21:15:01','s','m','images/cars/car (36).jpg',9,119,107,89,71),(18,'M3','2014-05-28 21:15:01','p','h','images/cars/car (30).jpg',1,127,114,95,76),(19,'Megane II Sport Hatch 1.6','2014-05-28 21:15:03','h','m','images/cars/car (14).jpg',9,141,126,105,84),(20,'Accord Coupe 2.4 EX','2014-05-28 21:15:03','p','m','images/cars/car (21).jpg',3,148,133,111,88),(21,'Laguna 2.0T Dynamic','2014-05-28 21:15:05','s','m','images/cars/car (10).jpg',9,134,120,100,80),(22,'Xsara Kombi 2.0 HDi 109 SX Plus','2014-05-28 21:15:06','u','m','images/cars/car (31).jpg',13,107,96,80,64),(23,'Regata 100','2014-05-28 21:15:08','s','m','images/cars/car (13).jpg',12,108,97,81,64),(24,'550i Steptronic','2014-05-28 21:15:08','s','h','images/cars/car (2).jpg',1,133,119,99,79),(25,'Lantra','2014-05-28 21:15:10','s','m','images/cars/car (16).jpg',11,136,122,102,81),(26,'Fabia 1.4 TDI Classic','2014-05-28 21:15:10','h','l','images/cars/car (4).jpg',8,59,53,44,35),(27,'Civic Sedan EX Automatic','2014-05-28 21:15:11','s','l','images/cars/car (26).jpg',3,100,90,75,60),(28,'100 L Avant','2014-05-28 21:15:12','s','h','images/cars/car (35).jpg',0,109,98,81,65),(29,'A4 1.8 T CVT','2014-05-28 21:15:15','s','m','images/cars/car (4).jpg',0,123,110,92,73),(30,'6 2.0i MZR','2014-05-28 21:15:18','s','m','images/cars/car (25).jpg',7,116,104,87,69),(31,'530i','2014-05-28 21:15:20','s','h','images/cars/car (12).jpg',1,120,108,90,72),(32,'Elantra GLS','2014-05-28 21:15:21','s','m','images/cars/car (27).jpg',11,144,129,108,86),(33,'TT 225 Roadster Quattro','2014-05-28 21:15:24','c','h','images/cars/car (26).jpg',0,183,164,137,109),(34,'320 Ci','2014-05-28 21:15:24','p','m','images/cars/car (18).jpg',1,150,135,112,90),(35,'320d Automatic','2014-05-28 21:15:26','s','m','images/cars/car (5).jpg',1,143,128,107,85),(36,'A4 3.2 FSI Quattro','2014-05-28 21:15:27','s','m','images/cars/car (18).jpg',0,103,92,77,61),(37,'A3 2.0 T FSI Ambition DSG','2014-05-28 21:15:27','h','m','images/cars/car (9).jpg',0,101,90,75,60),(38,'Thunderbird Deluxe','2014-05-28 21:15:28','c','h','images/cars/car (8).jpg',2,139,125,104,83),(39,'C5 Kombi 1.8 16V Style','2014-05-28 21:15:28','u','m','images/cars/car (15).jpg',13,121,108,90,72),(40,'Astra 1.4 Caravan','2014-05-28 21:15:31','u','m','images/cars/car (35).jpg',14,147,132,110,88),(41,'A6','2014-05-28 21:15:31','s','h','images/cars/car (19).jpg',0,150,135,112,90),(42,'A3 2.0 TDI Attraction','2014-05-28 21:15:32','h','m','images/cars/car (20).jpg',0,103,92,77,61),(43,'Accord Sedan EX','2014-05-28 21:15:33','s','m','images/cars/car (1).jpg',3,141,126,105,84),(44,'Ceed 1.6 CRDI','2014-05-28 21:15:34','h','m','images/cars/car (23).jpg',5,118,106,88,70),(45,'330Ci','2014-05-28 21:15:36','p','m','images/cars/car (3).jpg',1,100,90,75,60),(46,'Vel Satis 2.2 dCi FAP Expression','2014-05-28 21:15:37','h','h','images/cars/car (19).jpg',9,134,120,100,80),(47,'C3 Pluriel 1.4i','2014-05-28 21:15:37','c','h','images/cars/car (27).jpg',13,121,108,90,72),(48,'5 Turbo 2','2014-05-28 21:15:38','h','l','images/cars/car (6).jpg',9,71,63,53,42),(49,'Astra 1.3 CDTi Caravan','2014-05-28 21:15:40','u','m','images/cars/car (25).jpg',14,130,117,97,78),(50,'Ikon 1.6i LX','2014-05-28 21:15:41','s','m','images/cars/car (34).jpg',2,132,118,99,79);
/*!40000 ALTER TABLE `catalog_car` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_order`
--

DROP TABLE IF EXISTS `catalog_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `car_id` int(11) NOT NULL,
  `sum` int(11) NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `status` varchar(10) NOT NULL,
  `create_time` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `car_id_refs_id_db965695` (`car_id`),
  CONSTRAINT `car_id_refs_id_db965695` FOREIGN KEY (`car_id`) REFERENCES `catalog_car` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_order`
--

LOCK TABLES `catalog_order` WRITE;
/*!40000 ALTER TABLE `catalog_order` DISABLE KEYS */;
INSERT INTO `catalog_order` VALUES (1,4,110,'2014-05-29','2014-05-30','paid','2014-05-29 17:43:16');
/*!40000 ALTER TABLE `catalog_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_tariff`
--

DROP TABLE IF EXISTS `catalog_tariff`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_tariff` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `min_days` int(11) NOT NULL,
  `max_days` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_tariff`
--

LOCK TABLES `catalog_tariff` WRITE;
/*!40000 ALTER TABLE `catalog_tariff` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalog_tariff` ENABLE KEYS */;
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
INSERT INTO `django_admin_log` VALUES (1,'2014-05-26 13:12:31',1,7,'1','Car object',1,''),(2,'2014-05-26 13:31:52',1,7,'1','Audi R8',2,'Изменен image.'),(3,'2014-05-26 13:32:45',1,7,'1','Audi R8',2,'Изменен image.'),(4,'2014-05-26 13:33:38',1,7,'1','Audi R8',2,'Изменен image.'),(5,'2014-05-26 13:36:26',1,7,'1','Audi R8',2,'Изменен image.'),(6,'2014-05-26 13:37:03',1,7,'1','Audi R8',2,'Изменен image.'),(7,'2014-05-26 13:43:09',1,7,'1','Audi R8',2,'Изменен image.'),(8,'2014-05-26 14:10:25',1,8,'1','Brand object',1,''),(9,'2014-05-26 14:13:02',1,7,'1','1 R8',2,'Изменен brand.'),(10,'2014-05-26 14:13:39',1,7,'1','Audi R8',2,'Ни одно поле не изменено.'),(11,'2014-05-26 14:13:49',1,8,'2','BMW',1,''),(12,'2014-05-26 14:13:52',1,8,'3','Ford',1,''),(13,'2014-05-26 14:13:55',1,8,'4','Honda',1,''),(14,'2014-05-26 14:13:57',1,8,'5','Lexus',1,''),(15,'2014-05-26 14:14:00',1,8,'6','Kia',1,''),(16,'2014-05-26 14:14:03',1,8,'7','Nissan',1,''),(17,'2014-05-26 14:14:06',1,8,'8','Mazda',1,''),(18,'2014-05-26 14:14:08',1,8,'9','Skoda',1,''),(19,'2014-05-26 14:14:11',1,8,'10','Renault',1,''),(20,'2014-05-26 14:14:14',1,8,'11','Infinity',1,''),(21,'2014-05-26 14:14:17',1,8,'12','Hyundai',1,''),(22,'2014-05-26 14:14:20',1,8,'13','Fiat',1,''),(23,'2014-05-26 14:16:24',1,7,'1','Audi R8',2,'Ни одно поле не изменено.'),(24,'2014-05-26 14:26:43',1,9,'1','Тариф на сутки',1,''),(25,'2014-05-26 14:27:03',1,9,'2','Тариф на период от 3 до 15 суток',1,''),(26,'2014-05-26 14:27:20',1,9,'3','Тариф на период от 15 до 30 суток',1,''),(27,'2014-05-26 14:33:19',1,7,'1','Audi R8',2,'Изменен tarif1.'),(28,'2014-05-26 14:36:33',1,7,'1','Audi R8',2,'Изменен tarif1,tarif2,tarif3 и tarif4.'),(29,'2014-05-27 09:19:49',1,7,'1','Audi R8',2,'Изменен image.'),(30,'2014-05-27 09:22:05',1,7,'1','Audi R8',2,'Изменен image.'),(31,'2014-05-27 09:25:27',1,7,'1','Audi R8',2,'Изменен image.'),(32,'2014-05-27 09:34:21',1,7,'1','Audi R8',2,'Изменен image.'),(33,'2014-05-27 11:46:17',1,7,'1','Audi R8',2,'Изменен class_type.'),(34,'2014-05-28 06:34:14',1,7,'4','Audi M3',2,'Изменен model_name.'),(35,'2014-05-28 06:34:19',1,7,'3','Audi M2',2,'Изменен model_name.'),(36,'2014-05-28 06:34:25',1,7,'2','Audi M1',2,'Изменен model_name.'),(37,'2014-05-28 06:34:32',1,7,'1','Ford M8',2,'Изменен brand и model_name.'),(38,'2014-05-28 06:34:37',1,7,'2','Ford M1',2,'Изменен brand.'),(39,'2014-05-28 06:34:42',1,7,'3','Ford M2',2,'Изменен brand.'),(40,'2014-05-28 06:34:47',1,7,'4','Ford M3',2,'Изменен brand.');
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
INSERT INTO `django_content_type` VALUES (1,'log entry','admin','logentry'),(2,'permission','auth','permission'),(3,'group','auth','group'),(4,'user','auth','user'),(5,'content type','contenttypes','contenttype'),(6,'session','sessions','session'),(7,'car','catalog','car'),(8,'brand','catalog','brand'),(9,'tariff','catalog','tariff');
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
INSERT INTO `django_session` VALUES ('0j6aq257zcu891befr8zpy8bnzvj862i','YTBkZjdkNTI5MjBkMmEwYzc5NTRmN2E1M2M4ODdiOTdkOTYzNzMyZDp7fQ==','2014-06-10 09:16:53'),('2bhtyh10k9gvgsamjpzxhf6vk62bl0w8','MWVlYzFhNWQxZThjM2JiZDhhYzk0YmMwOWIyOTUwNmU2MzU4MDE2Nzp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6MX0=','2014-06-12 17:06:33'),('6p3f4h4288g8spl01q24kyg5kuht1oii','MWVlYzFhNWQxZThjM2JiZDhhYzk0YmMwOWIyOTUwNmU2MzU4MDE2Nzp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6MX0=','2014-06-10 09:17:08'),('99ywkwq44lvrudkuv13yvdlm63q8v764','MWVlYzFhNWQxZThjM2JiZDhhYzk0YmMwOWIyOTUwNmU2MzU4MDE2Nzp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6MX0=','2014-06-11 10:29:15'),('b1qqk2vk3oybvuedyh2i4e2y7avdxgod','MWVlYzFhNWQxZThjM2JiZDhhYzk0YmMwOWIyOTUwNmU2MzU4MDE2Nzp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6MX0=','2014-06-10 19:17:39'),('d17yixohai9pywsekwh486ij6wftam71','MWVlYzFhNWQxZThjM2JiZDhhYzk0YmMwOWIyOTUwNmU2MzU4MDE2Nzp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6MX0=','2014-06-09 20:23:11'),('fm1d6y98hdpk06aub0hr3i2h9vfz949u','MWVlYzFhNWQxZThjM2JiZDhhYzk0YmMwOWIyOTUwNmU2MzU4MDE2Nzp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6MX0=','2014-06-09 20:49:36'),('hv7xhy67khozs3slgvg1utdu1i6lsjf4','MWVlYzFhNWQxZThjM2JiZDhhYzk0YmMwOWIyOTUwNmU2MzU4MDE2Nzp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6MX0=','2014-06-09 20:11:20'),('ma93meg22nyu2nk7u2osj8tkfr2qe910','MWVlYzFhNWQxZThjM2JiZDhhYzk0YmMwOWIyOTUwNmU2MzU4MDE2Nzp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6MX0=','2014-06-12 17:15:14'),('pllyte3yp6ypt2bw2sk1ish8oi0zwgsx','MWVlYzFhNWQxZThjM2JiZDhhYzk0YmMwOWIyOTUwNmU2MzU4MDE2Nzp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6MX0=','2014-06-12 17:36:39'),('uxq3pi1n10piwy4mqlmbdv8m1e2oh0yh','MWVlYzFhNWQxZThjM2JiZDhhYzk0YmMwOWIyOTUwNmU2MzU4MDE2Nzp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6MX0=','2014-06-09 13:11:01');
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

-- Dump completed on 2014-05-29 20:43:49
