-- MySQL dump 10.13  Distrib 5.6.17, for Win32 (x86)
--
-- Host: localhost    Database: rsoi_office_sys1
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
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$12000$ERJNGGv5xCNE$hza0kQ+H6p9rDxAzmbQcim72QmsYBaCuD1HHctas+6Q=','2014-05-28 20:03:55',1,'marcky','','','t.mars@mail.ru',1,1,'2014-05-26 12:51:38');
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
  CONSTRAINT `user_id_refs_id_40c41112` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `group_id_refs_id_274b862c` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
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
  CONSTRAINT `user_id_refs_id_4dc23c39` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `permission_id_refs_id_35d9ac25` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`)
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
INSERT INTO `catalog_car` VALUES (1,'Laguna Grandtour 2.2 dCi Dynamique','2014-05-28 21:16:10','u','h','images/cars/car (32).jpg',9,124,111,93,74),(2,'320 Ci','2014-05-28 21:16:10','p','m','images/cars/car (10).jpg',1,110,99,82,66),(3,'IS 250 4WD','2014-05-28 21:16:11','s','h','images/cars/car (33).jpg',4,166,149,124,99),(4,'Vectra 2.0 DTI Hatchback','2014-05-28 21:16:13','h','m','images/cars/car (4).jpg',14,104,93,78,62),(5,'Astra GTC 2.0 Turbo Panoramic','2014-05-28 21:16:14','s','m','images/cars/car (36).jpg',14,142,127,106,85),(6,'Tiburon 2.0','2014-05-28 21:16:15','p','m','images/cars/car (20).jpg',11,108,97,81,64),(7,'Cortina 1600','2014-05-28 21:16:16','s','m','images/cars/car (26).jpg',2,142,127,106,85),(8,'Panda 4x4','2014-05-28 21:16:17','h','l','images/cars/car (15).jpg',12,64,57,48,38),(9,'Octavia 1.8 T RS Combi','2014-05-28 21:16:18','u','m','images/cars/car (26).jpg',8,104,93,78,62),(10,'650i Convertible','2014-05-28 21:16:19','c','h','images/cars/car (5).jpg',1,189,170,141,113),(11,'C5 1.8 X','2014-05-28 21:16:20','h','m','images/cars/car (32).jpg',13,128,115,96,76),(12,'Ami 6','2014-05-28 21:16:21','s','l','images/cars/car (31).jpg',13,52,46,39,31),(13,'Sentra 2.5 S','2014-05-28 21:16:23','s','m','images/cars/car (33).jpg',6,104,93,78,62),(14,'120i Convertible Sport','2014-05-28 21:16:24','c','h','images/cars/car (37).jpg',1,185,166,138,111),(15,'Civic 1.6 LS','2014-05-28 21:16:24','h','l','images/cars/car (14).jpg',3,95,85,71,57),(16,'A6 2.0','2014-05-28 21:16:25','s','h','images/cars/car (28).jpg',0,160,144,120,96),(17,'TT 3.2 Special Edition Roadster','2014-05-28 21:16:27','p','h','images/cars/car (12).jpg',0,157,141,117,94),(18,'Corsa Lite Gsi','2014-05-28 21:16:28','h','l','images/cars/car (15).jpg',14,83,74,62,49),(19,'523i Exlcusive','2014-05-28 21:16:29','s','h','images/cars/car (28).jpg',1,110,99,82,66),(20,'19 1.4i','2014-05-28 21:16:29','h','l','images/cars/car (33).jpg',9,98,88,73,58),(21,'A4 Cabriolet 1.8 T','2014-05-28 21:16:29','c','h','images/cars/car (34).jpg',0,147,132,110,88),(22,'VelSatis 3.0 DCi Initiale','2014-05-28 21:16:30','h','h','images/cars/car (20).jpg',9,142,127,106,85),(23,'C3 1.4 HDi 16V Exclusive','2014-05-28 21:16:30','h','m','images/cars/audi-r8.jpg',13,119,107,89,71),(24,'Megane II CC Dynamique 1.9','2014-05-28 21:16:31','c','h','images/cars/car (16).jpg',9,115,103,86,69),(25,'Argento Vivo','2014-05-28 21:16:32','c','h','images/cars/car (6).jpg',3,128,115,96,76),(26,'A3 Sportback 1.6 FSi','2014-05-28 21:16:34','h','m','images/cars/car (13).jpg',0,127,114,95,76),(27,'730d','2014-05-28 21:16:35','s','h','images/cars/car (34).jpg',1,195,175,146,117),(28,'G35 Sedan Sport Automatic','2014-05-28 21:16:36','s','h','images/cars/car (25).jpg',10,167,150,125,100),(29,'Doblo 1.3 16V Multijet Trofeo','2014-05-28 21:16:37','u','m','images/cars/car (17).jpg',12,125,112,93,75),(30,'Signum 1.8','2014-05-28 21:16:38','h','h','images/cars/audi-r8.jpg',14,104,93,78,62),(31,'Pulsar 1.5 Sedan','2014-05-28 21:16:38','s','m','images/cars/car (4).jpg',6,125,112,93,75),(32,'Logan 1.4','2014-05-28 21:16:41','s','m','images/cars/car (15).jpg',9,119,107,89,71),(33,'Grande Punto 1.9 Emotion','2014-05-28 21:16:42','h','l','images/cars/car (3).jpg',12,78,70,58,46),(34,'Micra 1.4 Comfort','2014-05-28 21:16:47','h','l','images/cars/car (5).jpg',6,82,73,61,49),(35,'Astra GTC 1.9 CDTi Sport','2014-05-28 21:16:50','p','m','images/cars/car (7).jpg',14,137,123,102,82),(36,'Clio 1.2','2014-05-28 21:16:52','h','l','images/cars/car (3).jpg',9,68,61,51,40),(37,'745Li','2014-05-28 21:16:54','s','h','images/cars/car (8).jpg',1,114,102,85,68),(38,'9 GTL','2014-05-28 21:16:55','h','l','images/cars/car (24).jpg',9,64,57,48,38),(39,'Sierra RS Cosworth','2014-05-28 21:16:56','s','m','images/cars/car (34).jpg',2,118,106,88,70),(40,'Panda 1.1','2014-05-28 21:16:58','h','l','images/cars/car (35).jpg',12,74,66,55,44),(41,'LS Hybrid 600h L','2014-05-28 21:16:58','s','h','images/cars/car (16).jpg',4,194,174,145,116),(42,'A4 Avant 1.8T Quattro','2014-05-28 21:16:59','u','h','images/cars/car (28).jpg',0,120,108,90,72),(43,'3 Sport','2014-05-28 21:17:01','h','m','images/cars/car (14).jpg',7,119,107,89,71),(44,'Astra 1.9 CDTi Enjoy','2014-05-28 21:17:02','h','m','images/cars/car (12).jpg',14,131,117,98,78),(45,'A3 2.0 FSI Attraction Tiptronic','2014-05-28 21:17:02','h','m','images/cars/car (18).jpg',0,134,120,100,80),(46,'Focus 1.8 Viva','2014-05-28 21:17:04','h','m','images/cars/car (18).jpg',2,118,106,88,70),(47,'Getz 1.6','2014-05-28 21:17:05','h','m','images/cars/car (4).jpg',11,111,99,83,66),(48,'Clio 1.5 DCi ESP','2014-05-28 21:17:06','h','l','images/cars/car (18).jpg',9,59,53,44,35),(49,'V8','2014-05-28 21:17:07','s','h','images/cars/car (11).jpg',0,157,141,117,94),(50,'Civic 1.4','2014-05-28 21:17:08','h','m','images/cars/car (5).jpg',3,138,124,103,82);
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
  PRIMARY KEY (`id`),
  KEY `car_id_refs_id_db965695` (`car_id`),
  CONSTRAINT `car_id_refs_id_db965695` FOREIGN KEY (`car_id`) REFERENCES `catalog_car` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_order`
--

LOCK TABLES `catalog_order` WRITE;
/*!40000 ALTER TABLE `catalog_order` DISABLE KEYS */;
INSERT INTO `catalog_order` VALUES (8,2,330,'2014-05-28','2014-05-31','reserve'),(9,4,208,'2014-05-29','2014-05-31','reserve'),(10,1,248,'2014-05-29','2014-05-31','reserve'),(11,7,284,'2014-05-29','2014-05-31','reserve'),(12,5,142,'2014-05-29','2014-05-30','reserve'),(13,5,284,'2014-06-01','2014-06-03','reserve');
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
INSERT INTO `django_admin_log` VALUES (1,'2014-05-26 13:12:31',1,7,'1','Car object',1,''),(2,'2014-05-26 13:31:52',1,7,'1','Audi R8',2,'Изменен image.'),(3,'2014-05-26 13:32:45',1,7,'1','Audi R8',2,'Изменен image.'),(4,'2014-05-26 13:33:38',1,7,'1','Audi R8',2,'Изменен image.'),(5,'2014-05-26 13:36:26',1,7,'1','Audi R8',2,'Изменен image.'),(6,'2014-05-26 13:37:03',1,7,'1','Audi R8',2,'Изменен image.'),(7,'2014-05-26 13:43:09',1,7,'1','Audi R8',2,'Изменен image.'),(8,'2014-05-26 14:10:25',1,8,'1','Brand object',1,''),(9,'2014-05-26 14:13:02',1,7,'1','1 R8',2,'Изменен brand.'),(10,'2014-05-26 14:13:39',1,7,'1','Audi R8',2,'Ни одно поле не изменено.'),(11,'2014-05-26 14:13:49',1,8,'2','BMW',1,''),(12,'2014-05-26 14:13:52',1,8,'3','Ford',1,''),(13,'2014-05-26 14:13:55',1,8,'4','Honda',1,''),(14,'2014-05-26 14:13:57',1,8,'5','Lexus',1,''),(15,'2014-05-26 14:14:00',1,8,'6','Kia',1,''),(16,'2014-05-26 14:14:03',1,8,'7','Nissan',1,''),(17,'2014-05-26 14:14:06',1,8,'8','Mazda',1,''),(18,'2014-05-26 14:14:08',1,8,'9','Skoda',1,''),(19,'2014-05-26 14:14:11',1,8,'10','Renault',1,''),(20,'2014-05-26 14:14:14',1,8,'11','Infinity',1,''),(21,'2014-05-26 14:14:17',1,8,'12','Hyundai',1,''),(22,'2014-05-26 14:14:20',1,8,'13','Fiat',1,''),(23,'2014-05-26 14:16:24',1,7,'1','Audi R8',2,'Ни одно поле не изменено.'),(24,'2014-05-26 14:26:43',1,9,'1','Тариф на сутки',1,''),(25,'2014-05-26 14:27:03',1,9,'2','Тариф на период от 3 до 15 суток',1,''),(26,'2014-05-26 14:27:20',1,9,'3','Тариф на период от 15 до 30 суток',1,''),(27,'2014-05-26 14:33:19',1,7,'1','Audi R8',2,'Изменен tarif1.'),(28,'2014-05-26 14:36:33',1,7,'1','Audi R8',2,'Изменен tarif1,tarif2,tarif3 и tarif4.'),(29,'2014-05-27 09:19:49',1,7,'1','Audi R8',2,'Изменен image.'),(30,'2014-05-27 09:22:05',1,7,'1','Audi R8',2,'Изменен image.'),(31,'2014-05-27 09:25:27',1,7,'1','Audi R8',2,'Изменен image.'),(32,'2014-05-27 09:34:21',1,7,'1','Audi R8',2,'Изменен image.'),(33,'2014-05-27 11:46:17',1,7,'1','Audi R8',2,'Изменен class_type.'),(34,'2014-05-28 20:21:28',1,10,'1','Citroen Corsa Lite Gsi [18]',3,''),(35,'2014-05-28 20:45:12',1,10,'5','Citroen Vectra 2.0 DTI Hatchback [4]',3,''),(36,'2014-05-28 20:45:12',1,10,'4','Citroen Vectra 2.0 DTI Hatchback [4]',3,''),(37,'2014-05-28 20:45:12',1,10,'3','Citroen Corsa Lite Gsi [18]',3,''),(38,'2014-05-28 20:45:12',1,10,'2','Citroen Corsa Lite Gsi [18]',3,''),(39,'2014-05-28 20:59:18',1,10,'7','Skoda Laguna Grandtour 2.2 dCi Dynamique [1]',3,''),(40,'2014-05-28 20:59:18',1,10,'6','Citroen Vectra 2.0 DTI Hatchback [4]',3,'');
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
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'log entry','admin','logentry'),(2,'permission','auth','permission'),(3,'group','auth','group'),(4,'user','auth','user'),(5,'content type','contenttypes','contenttype'),(6,'session','sessions','session'),(7,'car','catalog','car'),(8,'brand','catalog','brand'),(9,'tariff','catalog','tariff'),(10,'order','catalog','order');
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
INSERT INTO `django_session` VALUES ('0j6aq257zcu891befr8zpy8bnzvj862i','YTBkZjdkNTI5MjBkMmEwYzc5NTRmN2E1M2M4ODdiOTdkOTYzNzMyZDp7fQ==','2014-06-10 09:16:53'),('1qahsl0v41b0t8y78891aqsdsq3sl5r0','MWVlYzFhNWQxZThjM2JiZDhhYzk0YmMwOWIyOTUwNmU2MzU4MDE2Nzp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6MX0=','2014-06-11 19:57:00'),('2gb0h65rxcby4ytryg3vyaxvdp68h0ng','MWVlYzFhNWQxZThjM2JiZDhhYzk0YmMwOWIyOTUwNmU2MzU4MDE2Nzp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6MX0=','2014-06-11 19:58:36'),('2h2kcw1q264no39twdt6isq4osb9zxb7','MWVlYzFhNWQxZThjM2JiZDhhYzk0YmMwOWIyOTUwNmU2MzU4MDE2Nzp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6MX0=','2014-06-11 19:50:19'),('6p3f4h4288g8spl01q24kyg5kuht1oii','MWVlYzFhNWQxZThjM2JiZDhhYzk0YmMwOWIyOTUwNmU2MzU4MDE2Nzp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6MX0=','2014-06-10 09:17:08'),('b1qqk2vk3oybvuedyh2i4e2y7avdxgod','MWVlYzFhNWQxZThjM2JiZDhhYzk0YmMwOWIyOTUwNmU2MzU4MDE2Nzp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6MX0=','2014-06-10 19:17:39'),('cvqx8r2ift54e1rolalqaen8cuz5p8fj','MWVlYzFhNWQxZThjM2JiZDhhYzk0YmMwOWIyOTUwNmU2MzU4MDE2Nzp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6MX0=','2014-06-11 19:50:33'),('d17yixohai9pywsekwh486ij6wftam71','MWVlYzFhNWQxZThjM2JiZDhhYzk0YmMwOWIyOTUwNmU2MzU4MDE2Nzp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6MX0=','2014-06-09 20:23:11'),('dc7bnmgiiwhtnetyeepl0e1k6nhyjc1w','MWVlYzFhNWQxZThjM2JiZDhhYzk0YmMwOWIyOTUwNmU2MzU4MDE2Nzp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6MX0=','2014-06-11 11:34:18'),('fm1d6y98hdpk06aub0hr3i2h9vfz949u','MWVlYzFhNWQxZThjM2JiZDhhYzk0YmMwOWIyOTUwNmU2MzU4MDE2Nzp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6MX0=','2014-06-09 20:49:36'),('fmm87rmjkxro8l9d3irxh46lmc3s0bzv','MWVlYzFhNWQxZThjM2JiZDhhYzk0YmMwOWIyOTUwNmU2MzU4MDE2Nzp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6MX0=','2014-06-11 11:38:40'),('htk7me3p87rjflhssddf93wamjaltne8','MWVlYzFhNWQxZThjM2JiZDhhYzk0YmMwOWIyOTUwNmU2MzU4MDE2Nzp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6MX0=','2014-06-11 20:02:19'),('hv7xhy67khozs3slgvg1utdu1i6lsjf4','MWVlYzFhNWQxZThjM2JiZDhhYzk0YmMwOWIyOTUwNmU2MzU4MDE2Nzp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6MX0=','2014-06-09 20:11:20'),('iget6mjnl8toqqdra86n4nqw44jg1ck3','MWVlYzFhNWQxZThjM2JiZDhhYzk0YmMwOWIyOTUwNmU2MzU4MDE2Nzp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6MX0=','2014-06-11 20:03:55'),('rgm452kbg09br69d01bsaywuystlemln','YTBkZjdkNTI5MjBkMmEwYzc5NTRmN2E1M2M4ODdiOTdkOTYzNzMyZDp7fQ==','2014-06-11 20:03:40'),('uxq3pi1n10piwy4mqlmbdv8m1e2oh0yh','MWVlYzFhNWQxZThjM2JiZDhhYzk0YmMwOWIyOTUwNmU2MzU4MDE2Nzp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6MX0=','2014-06-09 13:11:01'),('zuykxs2u0ryeh2qru7cr5c3bg40xfgy0','MWVlYzFhNWQxZThjM2JiZDhhYzk0YmMwOWIyOTUwNmU2MzU4MDE2Nzp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6MX0=','2014-06-11 20:01:17');
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

-- Dump completed on 2014-05-29  1:06:09
