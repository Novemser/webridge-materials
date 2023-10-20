-- MySQL dump 10.13  Distrib 8.0.22, for Linux (x86_64)
--
-- Host: 127.0.0.1    Database: SALESMANAGER
-- ------------------------------------------------------
-- Server version	8.0.22

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
-- /*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
-- /*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `CATALOG`
--

DROP TABLE IF EXISTS `CATALOG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8 */;
CREATE TABLE `CATALOG` (
  `id` bigint NOT NULL,
  `DATE_CREATED` datetime DEFAULT NULL,
  `DATE_MODIFIED` datetime DEFAULT NULL,
  `UPDT_ID` varchar(60) DEFAULT NULL,
  `CODE` varchar(100) NOT NULL,
  `DEFAULT_CATALOG` bit(1) DEFAULT NULL,
  `SORT_ORDER` int DEFAULT NULL,
  `VISIBLE` bit(1) DEFAULT NULL,
  `MERCHANT_ID` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK32mubpubtaqu30n34bwl7xiis` (`MERCHANT_ID`,`CODE`),
  CONSTRAINT `FKranq0rweb0r6j31j565ak51g8` FOREIGN KEY (`MERCHANT_ID`) REFERENCES `MERCHANT_STORE` (`MERCHANT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CATALOG`
--

LOCK TABLES `CATALOG` WRITE;
/*!40000 ALTER TABLE `CATALOG` DISABLE KEYS */;
/*!40000 ALTER TABLE `CATALOG` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CATALOG_ENTRY`
--

DROP TABLE IF EXISTS `CATALOG_ENTRY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8 */;
CREATE TABLE `CATALOG_ENTRY` (
  `id` bigint NOT NULL,
  `DATE_CREATED` datetime DEFAULT NULL,
  `DATE_MODIFIED` datetime DEFAULT NULL,
  `UPDT_ID` varchar(60) DEFAULT NULL,
  `VISIBLE` bit(1) DEFAULT NULL,
  `CATALOG_ID` bigint NOT NULL,
  `CATEGORY_ID` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK5q8159i414r299kia2w9re90k` (`CATEGORY_ID`,`CATALOG_ID`),
  KEY `FKqp2j48hb3vodovb8gn2o4gox` (`CATALOG_ID`),
  CONSTRAINT `FK374wks7em54d0oghju0earttl` FOREIGN KEY (`CATEGORY_ID`) REFERENCES `CATEGORY` (`CATEGORY_ID`),
  CONSTRAINT `FKqp2j48hb3vodovb8gn2o4gox` FOREIGN KEY (`CATALOG_ID`) REFERENCES `CATALOG` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CATALOG_ENTRY`
--

LOCK TABLES `CATALOG_ENTRY` WRITE;
/*!40000 ALTER TABLE `CATALOG_ENTRY` DISABLE KEYS */;
/*!40000 ALTER TABLE `CATALOG_ENTRY` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CATEGORY`
--

DROP TABLE IF EXISTS `CATEGORY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8 */;
CREATE TABLE `CATEGORY` (
  `CATEGORY_ID` bigint NOT NULL,
  `DATE_CREATED` datetime DEFAULT NULL,
  `DATE_MODIFIED` datetime DEFAULT NULL,
  `UPDT_ID` varchar(60) DEFAULT NULL,
  `CATEGORY_IMAGE` varchar(100) DEFAULT NULL,
  `CATEGORY_STATUS` bit(1) DEFAULT NULL,
  `CODE` varchar(100) NOT NULL,
  `DEPTH` int DEFAULT NULL,
  `FEATURED` bit(1) DEFAULT NULL,
  `LINEAGE` varchar(255) DEFAULT NULL,
  `SORT_ORDER` int DEFAULT NULL,
  `VISIBLE` bit(1) DEFAULT NULL,
  `MERCHANT_ID` int NOT NULL,
  `PARENT_ID` bigint DEFAULT NULL,
  PRIMARY KEY (`CATEGORY_ID`),
  UNIQUE KEY `UK3mq9i6qmgquvoieslx39pej6x` (`MERCHANT_ID`,`CODE`),
  KEY `FKn3kekntr7pm8g9v8ask698ato` (`PARENT_ID`),
  CONSTRAINT `FK8a09asq5fcx0a88i4m8nsixy` FOREIGN KEY (`MERCHANT_ID`) REFERENCES `MERCHANT_STORE` (`MERCHANT_ID`),
  CONSTRAINT `FKn3kekntr7pm8g9v8ask698ato` FOREIGN KEY (`PARENT_ID`) REFERENCES `CATEGORY` (`CATEGORY_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CATEGORY`
--

LOCK TABLES `CATEGORY` WRITE;
/*!40000 ALTER TABLE `CATEGORY` DISABLE KEYS */;
INSERT INTO `CATEGORY` VALUES (1,'2020-12-21 05:37:47','2020-12-21 05:37:47',NULL,NULL,_binary '\0','computerbooks',0,_binary '\0','/1/',0,_binary '',1,NULL),(2,'2020-12-21 05:37:47','2020-12-21 05:37:47',NULL,NULL,_binary '\0','novels',0,_binary '\0','/2/',0,_binary '\0',1,NULL),(3,'2020-12-21 05:37:47','2020-12-21 05:37:47',NULL,NULL,_binary '\0','tech',1,_binary '\0','/1//3/',0,_binary '\0',1,1),(4,'2020-12-21 05:37:47','2020-12-21 05:37:47',NULL,NULL,_binary '\0','web',1,_binary '\0','/1//4/',0,_binary '',1,1),(5,'2020-12-21 05:37:48','2020-12-21 05:37:48',NULL,NULL,_binary '\0','fiction',1,_binary '\0','/2//5/',0,_binary '',1,2),(6,'2020-12-21 05:37:48','2020-12-21 05:37:48',NULL,NULL,_binary '\0','business',0,_binary '\0','/6/',0,_binary '',1,NULL),(7,'2020-12-21 05:37:48','2020-12-21 05:37:48',NULL,NULL,_binary '\0','cloud',2,_binary '\0','/1//3//7/',0,_binary '',1,3);
/*!40000 ALTER TABLE `CATEGORY` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CATEGORY_DESCRIPTION`
--

DROP TABLE IF EXISTS `CATEGORY_DESCRIPTION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8 */;
CREATE TABLE `CATEGORY_DESCRIPTION` (
  `DESCRIPTION_ID` bigint NOT NULL,
  `DATE_CREATED` datetime DEFAULT NULL,
  `DATE_MODIFIED` datetime DEFAULT NULL,
  `UPDT_ID` varchar(60) DEFAULT NULL,
  `DESCRIPTION` longtext,
  `NAME` varchar(120) NOT NULL,
  `TITLE` varchar(100) DEFAULT NULL,
  `CATEGORY_HIGHLIGHT` varchar(255) DEFAULT NULL,
  `META_DESCRIPTION` varchar(255) DEFAULT NULL,
  `META_KEYWORDS` varchar(255) DEFAULT NULL,
  `META_TITLE` varchar(120) DEFAULT NULL,
  `SEF_URL` varchar(120) DEFAULT NULL,
  `LANGUAGE_ID` int NOT NULL,
  `CATEGORY_ID` bigint NOT NULL,
  PRIMARY KEY (`DESCRIPTION_ID`),
  UNIQUE KEY `UKbuesqq6cyx7e5hy3mf30cfieq` (`CATEGORY_ID`,`LANGUAGE_ID`),
  KEY `FKl4j5boteutpu1p8f67kydpnmd` (`LANGUAGE_ID`),
  CONSTRAINT `FKa58u7d0ydfgref1iaux5efyov` FOREIGN KEY (`CATEGORY_ID`) REFERENCES `CATEGORY` (`CATEGORY_ID`),
  CONSTRAINT `FKl4j5boteutpu1p8f67kydpnmd` FOREIGN KEY (`LANGUAGE_ID`) REFERENCES `LANGUAGE` (`LANGUAGE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CATEGORY_DESCRIPTION`
--

LOCK TABLES `CATEGORY_DESCRIPTION` WRITE;
/*!40000 ALTER TABLE `CATEGORY_DESCRIPTION` DISABLE KEYS */;
INSERT INTO `CATEGORY_DESCRIPTION` VALUES (1,'2020-12-21 05:37:47','2020-12-21 05:37:47',NULL,NULL,'Livres d\'informatique',NULL,NULL,NULL,NULL,NULL,'livres-informatiques',2,1),(2,'2020-12-21 05:37:47','2020-12-21 05:37:47',NULL,NULL,'Computer Books',NULL,NULL,NULL,NULL,NULL,'computer-books',1,1),(3,'2020-12-21 05:37:47','2020-12-21 05:37:47',NULL,NULL,'Novels',NULL,NULL,NULL,NULL,NULL,'novels',1,2),(4,'2020-12-21 05:37:47','2020-12-21 05:37:47',NULL,NULL,'Romans',NULL,NULL,NULL,NULL,NULL,'romans',2,2),(5,'2020-12-21 05:37:47','2020-12-21 05:37:47',NULL,NULL,'Technology',NULL,NULL,NULL,NULL,NULL,'technology',1,3),(6,'2020-12-21 05:37:47','2020-12-21 05:37:47',NULL,NULL,'Technologie',NULL,NULL,NULL,NULL,NULL,'technologie',2,3),(7,'2020-12-21 05:37:47','2020-12-21 05:37:47',NULL,NULL,'Web',NULL,NULL,NULL,NULL,NULL,'the-web',1,4),(8,'2020-12-21 05:37:47','2020-12-21 05:37:47',NULL,NULL,'Web',NULL,NULL,NULL,NULL,NULL,'le-web',2,4),(9,'2020-12-21 05:37:48','2020-12-21 05:37:48',NULL,NULL,'Fiction',NULL,NULL,NULL,NULL,NULL,'fiction',1,5),(10,'2020-12-21 05:37:48','2020-12-21 05:37:48',NULL,NULL,'Sc Fiction',NULL,NULL,NULL,NULL,NULL,'fiction',2,5),(11,'2020-12-21 05:37:48','2020-12-21 05:37:48',NULL,NULL,'Affaires',NULL,NULL,NULL,NULL,NULL,'affaires',2,6),(12,'2020-12-21 05:37:48','2020-12-21 05:37:48',NULL,NULL,'Business',NULL,NULL,NULL,NULL,NULL,'business',1,6),(13,'2020-12-21 05:37:48','2020-12-21 05:37:48',NULL,NULL,'Programmation pour le cloud',NULL,NULL,NULL,NULL,NULL,'programmation-cloud',2,7),(14,'2020-12-21 05:37:48','2020-12-21 05:37:48',NULL,NULL,'Cloud computing',NULL,NULL,NULL,NULL,NULL,'cloud-computing',1,7);
/*!40000 ALTER TABLE `CATEGORY_DESCRIPTION` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CONTENT`
--

DROP TABLE IF EXISTS `CONTENT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8 */;
CREATE TABLE `CONTENT` (
  `CONTENT_ID` bigint NOT NULL,
  `DATE_CREATED` datetime DEFAULT NULL,
  `DATE_MODIFIED` datetime DEFAULT NULL,
  `UPDT_ID` varchar(60) DEFAULT NULL,
  `CODE` varchar(100) NOT NULL,
  `CONTENT_POSITION` varchar(10) DEFAULT NULL,
  `CONTENT_TYPE` varchar(10) DEFAULT NULL,
  `LINK_TO_MENU` bit(1) DEFAULT NULL,
  `PRODUCT_GROUP` varchar(255) DEFAULT NULL,
  `SORT_ORDER` int DEFAULT NULL,
  `VISIBLE` bit(1) DEFAULT NULL,
  `MERCHANT_ID` int NOT NULL,
  PRIMARY KEY (`CONTENT_ID`),
  UNIQUE KEY `UKt1v2ld0mrwviquqourql4uub0` (`MERCHANT_ID`,`CODE`),
  KEY `CODE_IDX` (`CODE`),
  CONSTRAINT `FKfmoi0fkjbtfty3o8fs94t11r1` FOREIGN KEY (`MERCHANT_ID`) REFERENCES `MERCHANT_STORE` (`MERCHANT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CONTENT`
--

LOCK TABLES `CONTENT` WRITE;
/*!40000 ALTER TABLE `CONTENT` DISABLE KEYS */;
/*!40000 ALTER TABLE `CONTENT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CONTENT_DESCRIPTION`
--

DROP TABLE IF EXISTS `CONTENT_DESCRIPTION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8 */;
CREATE TABLE `CONTENT_DESCRIPTION` (
  `DESCRIPTION_ID` bigint NOT NULL,
  `DATE_CREATED` datetime DEFAULT NULL,
  `DATE_MODIFIED` datetime DEFAULT NULL,
  `UPDT_ID` varchar(60) DEFAULT NULL,
  `DESCRIPTION` longtext,
  `NAME` varchar(120) NOT NULL,
  `TITLE` varchar(100) DEFAULT NULL,
  `META_DESCRIPTION` varchar(255) DEFAULT NULL,
  `META_KEYWORDS` varchar(255) DEFAULT NULL,
  `META_TITLE` varchar(255) DEFAULT NULL,
  `SEF_URL` varchar(120) DEFAULT NULL,
  `LANGUAGE_ID` int NOT NULL,
  `CONTENT_ID` bigint NOT NULL,
  PRIMARY KEY (`DESCRIPTION_ID`),
  UNIQUE KEY `UKn0w5r7ctbp88r4rvk7ayklofm` (`CONTENT_ID`,`LANGUAGE_ID`),
  KEY `FK47yxf681u0rfw2kvarhqb0r3v` (`LANGUAGE_ID`),
  CONSTRAINT `FK47yxf681u0rfw2kvarhqb0r3v` FOREIGN KEY (`LANGUAGE_ID`) REFERENCES `LANGUAGE` (`LANGUAGE_ID`),
  CONSTRAINT `FKk7fabfxn2flvcofwwpyg5sys` FOREIGN KEY (`CONTENT_ID`) REFERENCES `CONTENT` (`CONTENT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CONTENT_DESCRIPTION`
--

LOCK TABLES `CONTENT_DESCRIPTION` WRITE;
/*!40000 ALTER TABLE `CONTENT_DESCRIPTION` DISABLE KEYS */;
/*!40000 ALTER TABLE `CONTENT_DESCRIPTION` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `COUNTRY`
--

DROP TABLE IF EXISTS `COUNTRY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8 */;
CREATE TABLE `COUNTRY` (
  `COUNTRY_ID` int NOT NULL,
  `COUNTRY_ISOCODE` varchar(255) NOT NULL,
  `COUNTRY_SUPPORTED` bit(1) DEFAULT NULL,
  `GEOZONE_ID` bigint DEFAULT NULL,
  PRIMARY KEY (`COUNTRY_ID`),
  UNIQUE KEY `UK_dqb99v22pt27v0tgeqo958e6x` (`COUNTRY_ISOCODE`),
  KEY `FKd2q9e14kh1j6tm1gpbct2xwws` (`GEOZONE_ID`),
  CONSTRAINT `FKd2q9e14kh1j6tm1gpbct2xwws` FOREIGN KEY (`GEOZONE_ID`) REFERENCES `GEOZONE` (`GEOZONE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `COUNTRY`
--

LOCK TABLES `COUNTRY` WRITE;
/*!40000 ALTER TABLE `COUNTRY` DISABLE KEYS */;
INSERT INTO `COUNTRY` VALUES (13,'CA',_binary '',NULL);
/*!40000 ALTER TABLE `COUNTRY` ENABLE KEYS */;
UNLOCK TABLES;
DELETE FROM `COUNTRY` WHERE COUNTRY_ID != 13;

--
-- Table structure for table `COUNTRY_DESCRIPTION`
--

DROP TABLE IF EXISTS `COUNTRY_DESCRIPTION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8 */;
CREATE TABLE `COUNTRY_DESCRIPTION` (
  `DESCRIPTION_ID` bigint NOT NULL,
  `DATE_CREATED` datetime DEFAULT NULL,
  `DATE_MODIFIED` datetime DEFAULT NULL,
  `UPDT_ID` varchar(60) DEFAULT NULL,
  `DESCRIPTION` longtext,
  `NAME` varchar(120) NOT NULL,
  `TITLE` varchar(100) DEFAULT NULL,
  `LANGUAGE_ID` int NOT NULL,
  `COUNTRY_ID` int NOT NULL,
  PRIMARY KEY (`DESCRIPTION_ID`),
  UNIQUE KEY `UKt7nshki1rbp6157ed0v6cx4y4` (`COUNTRY_ID`,`LANGUAGE_ID`),
  KEY `FKersrbjot9p9nfukxfd2l27c7t` (`LANGUAGE_ID`),
  CONSTRAINT `FKersrbjot9p9nfukxfd2l27c7t` FOREIGN KEY (`LANGUAGE_ID`) REFERENCES `LANGUAGE` (`LANGUAGE_ID`),
  CONSTRAINT `FKkd2sy7q97wr2ahvyiiqc4txji` FOREIGN KEY (`COUNTRY_ID`) REFERENCES `COUNTRY` (`COUNTRY_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `COUNTRY_DESCRIPTION`
--

LOCK TABLES `COUNTRY_DESCRIPTION` WRITE;
/*!40000 ALTER TABLE `COUNTRY_DESCRIPTION` DISABLE KEYS */;
INSERT INTO `COUNTRY_DESCRIPTION` VALUES (37,'2020-12-21 05:37:26','2020-12-21 05:37:26',NULL,NULL,'Canada',NULL,1,13),(38,'2020-12-21 05:37:26','2020-12-21 05:37:26',NULL,NULL,'Canada',NULL,2,13),(39,'2020-12-21 05:37:26','2020-12-21 05:37:26',NULL,NULL,'Canadá',NULL,3,13);
/*!40000 ALTER TABLE `COUNTRY_DESCRIPTION` ENABLE KEYS */;
UNLOCK TABLES;
DELETE FROM `COUNTRY_DESCRIPTION` WHERE COUNTRY_ID NOT IN (SELECT COUNTRY_ID FROM COUNTRY);

--
-- Table structure for table `CURRENCY`
--

DROP TABLE IF EXISTS `CURRENCY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8 */;
CREATE TABLE `CURRENCY` (
  `CURRENCY_ID` bigint NOT NULL,
  `CURRENCY_CODE` varchar(255) DEFAULT NULL,
  `CURRENCY_CURRENCY_CODE` varchar(255) NOT NULL,
  `CURRENCY_NAME` varchar(255) DEFAULT NULL,
  `CURRENCY_SUPPORTED` bit(1) DEFAULT NULL,
  PRIMARY KEY (`CURRENCY_ID`),
  UNIQUE KEY `UK_m7ku15ekud52vp67ry73a36te` (`CURRENCY_CURRENCY_CODE`),
  UNIQUE KEY `UK_1ubr7n96hjajamtggqp090a4x` (`CURRENCY_CODE`),
  UNIQUE KEY `UK_7r1k69cbk5giewqr5c9r4v6f` (`CURRENCY_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CURRENCY`
--

LOCK TABLES `CURRENCY` WRITE;
/*!40000 ALTER TABLE `CURRENCY` DISABLE KEYS */;
INSERT INTO `CURRENCY` VALUES (1,'FJD','FJD','FJD',_binary ''),(2,'MXN','MXN','MXN',_binary ''),(3,'STD','STD','STD',_binary ''),(4,'LVL','LVL','LVL',_binary ''),(5,'SCR','SCR','SCR',_binary ''),(6,'CDF','CDF','CDF',_binary ''),(7,'BBD','BBD','BBD',_binary ''),(8,'GTQ','GTQ','GTQ',_binary ''),(9,'CLP','CLP','CLP',_binary ''),(10,'HNL','HNL','HNL',_binary ''),(11,'UGX','UGX','UGX',_binary ''),(12,'ZAR','ZAR','ZAR',_binary ''),(13,'MXV','MXV','MXV',_binary ''),(14,'TND','TND','TND',_binary ''),(15,'BSD','BSD','BSD',_binary ''),(16,'SLL','SLL','SLL',_binary ''),(17,'SDG','SDG','SDG',_binary ''),(18,'IQD','IQD','IQD',_binary ''),(19,'CUP','CUP','CUP',_binary ''),(20,'GMD','GMD','GMD',_binary ''),(21,'TWD','TWD','TWD',_binary ''),(22,'RSD','RSD','RSD',_binary ''),(23,'DOP','DOP','DOP',_binary ''),(24,'KMF','KMF','KMF',_binary ''),(25,'MYR','MYR','MYR',_binary ''),(26,'FKP','FKP','FKP',_binary ''),(27,'XOF','XOF','XOF',_binary ''),(28,'GEL','GEL','GEL',_binary ''),(29,'UYU','UYU','UYU',_binary ''),(30,'MAD','MAD','MAD',_binary ''),(31,'CVE','CVE','CVE',_binary ''),(32,'AZN','AZN','AZN',_binary ''),(33,'OMR','OMR','OMR',_binary ''),(34,'PGK','PGK','PGK',_binary ''),(35,'KES','KES','KES',_binary ''),(36,'SEK','SEK','SEK',_binary ''),(37,'BTN','BTN','BTN',_binary ''),(38,'UAH','UAH','UAH',_binary ''),(39,'GNF','GNF','GNF',_binary ''),(40,'ERN','ERN','ERN',_binary ''),(41,'MZN','MZN','MZN',_binary ''),(42,'SVC','SVC','SVC',_binary ''),(43,'ARS','ARS','ARS',_binary ''),(44,'QAR','QAR','QAR',_binary ''),(45,'IRR','IRR','IRR',_binary ''),(46,'MRO','MRO','MRO',_binary ''),(47,'CNY','CNY','CNY',_binary ''),(48,'XPF','XPF','XPF',_binary ''),(49,'THB','THB','THB',_binary ''),(50,'UZS','UZS','UZS',_binary ''),(51,'BDT','BDT','BDT',_binary ''),(52,'LYD','LYD','LYD',_binary ''),(53,'BMD','BMD','BMD',_binary ''),(54,'KWD','KWD','KWD',_binary ''),(55,'PHP','PHP','PHP',_binary ''),(56,'RUB','RUB','RUB',_binary ''),(57,'PYG','PYG','PYG',_binary ''),(58,'ISK','ISK','ISK',_binary ''),(59,'JMD','JMD','JMD',_binary ''),(60,'COP','COP','COP',_binary ''),(61,'USD','USD','USD',_binary ''),(62,'MKD','MKD','MKD',_binary ''),(63,'DZD','DZD','DZD',_binary ''),(64,'PAB','PAB','PAB',_binary ''),(65,'SGD','SGD','SGD',_binary ''),(66,'ETB','ETB','ETB',_binary ''),(67,'KGS','KGS','KGS',_binary ''),(68,'SOS','SOS','SOS',_binary ''),(69,'VUV','VUV','VUV',_binary ''),(70,'VEF','VEF','VEF',_binary ''),(71,'LAK','LAK','LAK',_binary ''),(72,'BND','BND','BND',_binary ''),(73,'ZMK','ZMK','ZMK',_binary ''),(74,'XAF','XAF','XAF',_binary ''),(75,'LRD','LRD','LRD',_binary ''),(76,'HRK','HRK','HRK',_binary ''),(77,'CHF','CHF','CHF',_binary ''),(78,'ALL','ALL','ALL',_binary ''),(79,'DJF','DJF','DJF',_binary ''),(80,'TZS','TZS','TZS',_binary ''),(81,'VND','VND','VND',_binary ''),(82,'AUD','AUD','AUD',_binary ''),(83,'ILS','ILS','ILS',_binary ''),(84,'GHS','GHS','GHS',_binary ''),(85,'GYD','GYD','GYD',_binary ''),(86,'KPW','KPW','KPW',_binary ''),(87,'BOB','BOB','BOB',_binary ''),(88,'KHR','KHR','KHR',_binary ''),(89,'MDL','MDL','MDL',_binary ''),(90,'IDR','IDR','IDR',_binary ''),(91,'KYD','KYD','KYD',_binary ''),(92,'AMD','AMD','AMD',_binary ''),(93,'BWP','BWP','BWP',_binary ''),(94,'SHP','SHP','SHP',_binary ''),(95,'TRY','TRY','TRY',_binary ''),(96,'LBP','LBP','LBP',_binary ''),(97,'TJS','TJS','TJS',_binary ''),(98,'JOD','JOD','JOD',_binary ''),(99,'HKD','HKD','HKD',_binary ''),(100,'RWF','RWF','RWF',_binary ''),(101,'AED','AED','AED',_binary ''),(102,'EUR','EUR','EUR',_binary ''),(103,'LSL','LSL','LSL',_binary ''),(104,'DKK','DKK','DKK',_binary ''),(105,'CAD','CAD','CAD',_binary ''),(106,'BOV','BOV','BOV',_binary ''),(107,'BGN','BGN','BGN',_binary ''),(108,'MMK','MMK','MMK',_binary ''),(109,'NOK','NOK','NOK',_binary ''),(110,'MUR','MUR','MUR',_binary ''),(111,'SYP','SYP','SYP',_binary ''),(112,'GIP','GIP','GIP',_binary ''),(113,'RON','RON','RON',_binary ''),(114,'LKR','LKR','LKR',_binary ''),(115,'NGN','NGN','NGN',_binary ''),(116,'CRC','CRC','CRC',_binary ''),(117,'CZK','CZK','CZK',_binary ''),(118,'PKR','PKR','PKR',_binary ''),(119,'XCD','XCD','XCD',_binary ''),(120,'ANG','ANG','ANG',_binary ''),(121,'HTG','HTG','HTG',_binary ''),(122,'BHD','BHD','BHD',_binary ''),(123,'KZT','KZT','KZT',_binary ''),(124,'SRD','SRD','SRD',_binary ''),(125,'SZL','SZL','SZL',_binary ''),(126,'LTL','LTL','LTL',_binary ''),(127,'SAR','SAR','SAR',_binary ''),(128,'TTD','TTD','TTD',_binary ''),(129,'YER','YER','YER',_binary ''),(130,'MVR','MVR','MVR',_binary ''),(131,'AFN','AFN','AFN',_binary ''),(132,'INR','INR','INR',_binary ''),(133,'AWG','AWG','AWG',_binary ''),(134,'KRW','KRW','KRW',_binary ''),(135,'NPR','NPR','NPR',_binary ''),(136,'JPY','JPY','JPY',_binary ''),(137,'MNT','MNT','MNT',_binary ''),(138,'AOA','AOA','AOA',_binary ''),(139,'PLN','PLN','PLN',_binary ''),(140,'GBP','GBP','GBP',_binary ''),(141,'SBD','SBD','SBD',_binary ''),(142,'HUF','HUF','HUF',_binary ''),(143,'BYR','BYR','BYR',_binary ''),(144,'BIF','BIF','BIF',_binary ''),(145,'MWK','MWK','MWK',_binary ''),(146,'MGA','MGA','MGA',_binary ''),(147,'XDR','XDR','XDR',_binary ''),(148,'BZD','BZD','BZD',_binary ''),(149,'BAM','BAM','BAM',_binary ''),(150,'EGP','EGP','EGP',_binary ''),(151,'MOP','MOP','MOP',_binary ''),(152,'NAD','NAD','NAD',_binary ''),(153,'NIO','NIO','NIO',_binary ''),(154,'PEN','PEN','PEN',_binary ''),(155,'NZD','NZD','NZD',_binary ''),(156,'WST','WST','WST',_binary ''),(157,'CLF','CLF','CLF',_binary ''),(158,'BRL','BRL','BRL',_binary '');
/*!40000 ALTER TABLE `CURRENCY` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CUSTOMER`
--

DROP TABLE IF EXISTS `CUSTOMER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8 */;
CREATE TABLE `CUSTOMER` (
  `CUSTOMER_ID` bigint NOT NULL,
  `CUSTOMER_ANONYMOUS` bit(1) DEFAULT NULL,
  `DATE_CREATED` datetime DEFAULT NULL,
  `DATE_MODIFIED` datetime DEFAULT NULL,
  `UPDT_ID` varchar(60) DEFAULT NULL,
  `BILLING_STREET_ADDRESS` varchar(256) DEFAULT NULL,
  `BILLING_CITY` varchar(100) DEFAULT NULL,
  `BILLING_COMPANY` varchar(100) DEFAULT NULL,
  `BILLING_FIRST_NAME` varchar(64) NOT NULL,
  `BILLING_LAST_NAME` varchar(64) NOT NULL,
  `LATITUDE` varchar(100) DEFAULT NULL,
  `LONGITUDE` varchar(100) DEFAULT NULL,
  `BILLING_POSTCODE` varchar(20) DEFAULT NULL,
  `BILLING_STATE` varchar(100) DEFAULT NULL,
  `BILLING_TELEPHONE` varchar(32) DEFAULT NULL,
  `CUSTOMER_COMPANY` varchar(100) DEFAULT NULL,
  `REVIEW_AVG` decimal(19,2) DEFAULT NULL,
  `REVIEW_COUNT` int DEFAULT NULL,
  `CUSTOMER_DOB` datetime DEFAULT NULL,
  `DELIVERY_STREET_ADDRESS` varchar(256) DEFAULT NULL,
  `DELIVERY_CITY` varchar(100) DEFAULT NULL,
  `DELIVERY_COMPANY` varchar(100) DEFAULT NULL,
  `DELIVERY_FIRST_NAME` varchar(64) DEFAULT NULL,
  `DELIVERY_LAST_NAME` varchar(64) DEFAULT NULL,
  `DELIVERY_POSTCODE` varchar(20) DEFAULT NULL,
  `DELIVERY_STATE` varchar(100) DEFAULT NULL,
  `DELIVERY_TELEPHONE` varchar(32) DEFAULT NULL,
  `CUSTOMER_EMAIL_ADDRESS` varchar(96) NOT NULL,
  `CUSTOMER_GENDER` varchar(1) DEFAULT NULL,
  `CUSTOMER_NICK` varchar(96) DEFAULT NULL,
  `CUSTOMER_PASSWORD` varchar(60) DEFAULT NULL,
  `PROVIDER` varchar(255) DEFAULT NULL,
  `BILLING_COUNTRY_ID` int NOT NULL,
  `BILLING_ZONE_ID` bigint DEFAULT NULL,
  `LANGUAGE_ID` int NOT NULL,
  `DELIVERY_COUNTRY_ID` int DEFAULT NULL,
  `DELIVERY_ZONE_ID` bigint DEFAULT NULL,
  `MERCHANT_ID` int NOT NULL,
  PRIMARY KEY (`CUSTOMER_ID`),
  UNIQUE KEY `UKapr0m3g0lqgdjgtc2m8dmk267` (`MERCHANT_ID`,`CUSTOMER_EMAIL_ADDRESS`),
  KEY `FK5pas8t9mknk4kkin55t4v300l` (`BILLING_COUNTRY_ID`),
  KEY `FKp0xcpa3i2mgdr0kq43xiibx40` (`BILLING_ZONE_ID`),
  KEY `FKdgjqmj04qt89gmfloo4ofojcw` (`LANGUAGE_ID`),
  KEY `FKbxyooiceli2ko29bupdye6jgn` (`DELIVERY_COUNTRY_ID`),
  KEY `FK3k21jw28bbx043c2mnhevg9w4` (`DELIVERY_ZONE_ID`),
  CONSTRAINT `FK3k21jw28bbx043c2mnhevg9w4` FOREIGN KEY (`DELIVERY_ZONE_ID`) REFERENCES `ZONE` (`ZONE_ID`),
  CONSTRAINT `FK5pas8t9mknk4kkin55t4v300l` FOREIGN KEY (`BILLING_COUNTRY_ID`) REFERENCES `COUNTRY` (`COUNTRY_ID`),
  CONSTRAINT `FK8122nrpakxu3umk1od4v0xxoa` FOREIGN KEY (`MERCHANT_ID`) REFERENCES `MERCHANT_STORE` (`MERCHANT_ID`),
  CONSTRAINT `FKbxyooiceli2ko29bupdye6jgn` FOREIGN KEY (`DELIVERY_COUNTRY_ID`) REFERENCES `COUNTRY` (`COUNTRY_ID`),
  CONSTRAINT `FKdgjqmj04qt89gmfloo4ofojcw` FOREIGN KEY (`LANGUAGE_ID`) REFERENCES `LANGUAGE` (`LANGUAGE_ID`),
  CONSTRAINT `FKp0xcpa3i2mgdr0kq43xiibx40` FOREIGN KEY (`BILLING_ZONE_ID`) REFERENCES `ZONE` (`ZONE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
create index idx_cust_nick on CUSTOMER (CUSTOMER_NICK);
--
-- Dumping data for table `CUSTOMER`
--

LOCK TABLES `CUSTOMER` WRITE;
/*!40000 ALTER TABLE `CUSTOMER` DISABLE KEYS */;
INSERT INTO `CUSTOMER` VALUES (1,_binary '\0',NULL,NULL,NULL,'350 Du Languadoc','Boucherville','CSTI Consulting','Leonardo','DiCaprio',NULL,NULL,'J1B-8J6',NULL,NULL,'CSTI Consulting',NULL,NULL,'2020-12-21 05:37:49','358 Du Languadoc','Boucherville',NULL,'Leonardo','DiCaprio','J1B-8J6',NULL,NULL,'test@shopizer.com','M','shopizer','$2a$10$1tFq1yqpgWTv42M0c5BkYOYGYXGBCia7UAyxdmphFQiYXUwAKwXpe',NULL,13,9,1,13,9,1);
/*!40000 ALTER TABLE `CUSTOMER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CUSTOMER_ATTRIBUTE`
--

DROP TABLE IF EXISTS `CUSTOMER_ATTRIBUTE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8 */;
CREATE TABLE `CUSTOMER_ATTRIBUTE` (
  `CUSTOMER_ATTRIBUTE_ID` bigint NOT NULL,
  `CUSTOMER_ATTR_TXT_VAL` varchar(255) DEFAULT NULL,
  `CUSTOMER_ID` bigint NOT NULL,
  `OPTION_ID` bigint NOT NULL,
  `OPTION_VALUE_ID` bigint NOT NULL,
  PRIMARY KEY (`CUSTOMER_ATTRIBUTE_ID`),
  UNIQUE KEY `UK46kbpre88yh963gewm3kmdni1` (`OPTION_ID`,`CUSTOMER_ID`),
  KEY `FKc3318o13i2bpxkci1bh52we5a` (`CUSTOMER_ID`),
  KEY `FK9fl7iexvdeeeoch9fh35o5vw4` (`OPTION_VALUE_ID`),
  CONSTRAINT `FK4xugs9yd9w4o3sw11fisb8tj5` FOREIGN KEY (`OPTION_ID`) REFERENCES `CUSTOMER_OPTION` (`CUSTOMER_OPTION_ID`),
  CONSTRAINT `FK9fl7iexvdeeeoch9fh35o5vw4` FOREIGN KEY (`OPTION_VALUE_ID`) REFERENCES `CUSTOMER_OPTION_VALUE` (`CUSTOMER_OPTION_VALUE_ID`),
  CONSTRAINT `FKc3318o13i2bpxkci1bh52we5a` FOREIGN KEY (`CUSTOMER_ID`) REFERENCES `CUSTOMER` (`CUSTOMER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CUSTOMER_ATTRIBUTE`
--

LOCK TABLES `CUSTOMER_ATTRIBUTE` WRITE;
/*!40000 ALTER TABLE `CUSTOMER_ATTRIBUTE` DISABLE KEYS */;
/*!40000 ALTER TABLE `CUSTOMER_ATTRIBUTE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CUSTOMER_GROUP`
--

DROP TABLE IF EXISTS `CUSTOMER_GROUP`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8 */;
CREATE TABLE `CUSTOMER_GROUP` (
  `CUSTOMER_ID` bigint NOT NULL,
  `GROUP_ID` int NOT NULL,
  KEY `FKgrr5v89l1m9sl2qol62bbctq4` (`GROUP_ID`),
  KEY `FK257h3e27f4ujw08doqtq46hho` (`CUSTOMER_ID`),
  CONSTRAINT `FK257h3e27f4ujw08doqtq46hho` FOREIGN KEY (`CUSTOMER_ID`) REFERENCES `CUSTOMER` (`CUSTOMER_ID`),
  CONSTRAINT `FKgrr5v89l1m9sl2qol62bbctq4` FOREIGN KEY (`GROUP_ID`) REFERENCES `SM_GROUP` (`GROUP_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CUSTOMER_GROUP`
--

LOCK TABLES `CUSTOMER_GROUP` WRITE;
/*!40000 ALTER TABLE `CUSTOMER_GROUP` DISABLE KEYS */;
-- INSERT INTO `CUSTOMER_GROUP` VALUES (1,8);
/*!40000 ALTER TABLE `CUSTOMER_GROUP` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CUSTOMER_OPTIN`
--

DROP TABLE IF EXISTS `CUSTOMER_OPTIN`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8 */;
CREATE TABLE `CUSTOMER_OPTIN` (
  `CUSTOMER_OPTIN_ID` bigint NOT NULL,
  `EMAIL` varchar(255) NOT NULL,
  `FIRST` varchar(255) DEFAULT NULL,
  `LAST` varchar(255) DEFAULT NULL,
  `OPTIN_DATE` datetime DEFAULT NULL,
  `VALUE` longtext,
  `MERCHANT_ID` int NOT NULL,
  `OPTIN_ID` bigint DEFAULT NULL,
  PRIMARY KEY (`CUSTOMER_OPTIN_ID`),
  UNIQUE KEY `UKc4fnyu0pvxxtrbko10rm1jqyw` (`EMAIL`,`OPTIN_ID`),
  KEY `FKk5v94dvhsgibaw89hv4m8o5yw` (`MERCHANT_ID`),
  KEY `FK7qym878m07cwvs4foe68lvqjt` (`OPTIN_ID`),
  CONSTRAINT `FK7qym878m07cwvs4foe68lvqjt` FOREIGN KEY (`OPTIN_ID`) REFERENCES `OPTIN` (`OPTIN_ID`),
  CONSTRAINT `FKk5v94dvhsgibaw89hv4m8o5yw` FOREIGN KEY (`MERCHANT_ID`) REFERENCES `MERCHANT_STORE` (`MERCHANT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CUSTOMER_OPTIN`
--

LOCK TABLES `CUSTOMER_OPTIN` WRITE;
/*!40000 ALTER TABLE `CUSTOMER_OPTIN` DISABLE KEYS */;
/*!40000 ALTER TABLE `CUSTOMER_OPTIN` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CUSTOMER_OPTION`
--

DROP TABLE IF EXISTS `CUSTOMER_OPTION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8 */;
CREATE TABLE `CUSTOMER_OPTION` (
  `CUSTOMER_OPTION_ID` bigint NOT NULL,
  `CUSTOMER_OPT_ACTIVE` bit(1) DEFAULT NULL,
  `CUSTOMER_OPT_CODE` varchar(255) DEFAULT NULL,
  `CUSTOMER_OPTION_TYPE` varchar(10) DEFAULT NULL,
  `CUSTOMER_OPT_PUBLIC` bit(1) DEFAULT NULL,
  `SORT_ORDER` int DEFAULT NULL,
  `MERCHANT_ID` int NOT NULL,
  PRIMARY KEY (`CUSTOMER_OPTION_ID`),
  UNIQUE KEY `UKrov34a6g4dhhiqukvhp1ggm0u` (`MERCHANT_ID`,`CUSTOMER_OPT_CODE`),
  KEY `CUST_OPT_CODE_IDX` (`CUSTOMER_OPT_CODE`),
  CONSTRAINT `FKcmqnh0rn2hukdfowean5tdy8k` FOREIGN KEY (`MERCHANT_ID`) REFERENCES `MERCHANT_STORE` (`MERCHANT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CUSTOMER_OPTION`
--

LOCK TABLES `CUSTOMER_OPTION` WRITE;
/*!40000 ALTER TABLE `CUSTOMER_OPTION` DISABLE KEYS */;
/*!40000 ALTER TABLE `CUSTOMER_OPTION` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CUSTOMER_OPTION_DESC`
--

DROP TABLE IF EXISTS `CUSTOMER_OPTION_DESC`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8 */;
CREATE TABLE `CUSTOMER_OPTION_DESC` (
  `DESCRIPTION_ID` bigint NOT NULL,
  `DATE_CREATED` datetime DEFAULT NULL,
  `DATE_MODIFIED` datetime DEFAULT NULL,
  `UPDT_ID` varchar(60) DEFAULT NULL,
  `DESCRIPTION` longtext,
  `NAME` varchar(120) NOT NULL,
  `TITLE` varchar(100) DEFAULT NULL,
  `CUSTOMER_OPTION_COMMENT` varchar(4000) DEFAULT NULL,
  `LANGUAGE_ID` int NOT NULL,
  `CUSTOMER_OPTION_ID` bigint NOT NULL,
  PRIMARY KEY (`DESCRIPTION_ID`),
  UNIQUE KEY `UK6ovl4t1ciag1wubtcebaoo7vi` (`CUSTOMER_OPTION_ID`,`LANGUAGE_ID`),
  KEY `FKm4iu7v9db17wk2a03xqbqdlfa` (`LANGUAGE_ID`),
  CONSTRAINT `FKc2yiucjbw0wjha8ww7a01qfeo` FOREIGN KEY (`CUSTOMER_OPTION_ID`) REFERENCES `CUSTOMER_OPTION` (`CUSTOMER_OPTION_ID`),
  CONSTRAINT `FKm4iu7v9db17wk2a03xqbqdlfa` FOREIGN KEY (`LANGUAGE_ID`) REFERENCES `LANGUAGE` (`LANGUAGE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CUSTOMER_OPTION_DESC`
--

LOCK TABLES `CUSTOMER_OPTION_DESC` WRITE;
/*!40000 ALTER TABLE `CUSTOMER_OPTION_DESC` DISABLE KEYS */;
/*!40000 ALTER TABLE `CUSTOMER_OPTION_DESC` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CUSTOMER_OPTION_SET`
--

DROP TABLE IF EXISTS `CUSTOMER_OPTION_SET`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8 */;
CREATE TABLE `CUSTOMER_OPTION_SET` (
  `CUSTOMER_OPTIONSET_ID` bigint NOT NULL,
  `SORT_ORDER` int DEFAULT NULL,
  `CUSTOMER_OPTION_ID` bigint NOT NULL,
  `CUSTOMER_OPTION_VALUE_ID` bigint NOT NULL,
  PRIMARY KEY (`CUSTOMER_OPTIONSET_ID`),
  UNIQUE KEY `UK4peli2ritnnq2xqpyq188srm6` (`CUSTOMER_OPTION_ID`,`CUSTOMER_OPTION_VALUE_ID`),
  KEY `FKj9vnvyh6hhhftjbcsymgiodm9` (`CUSTOMER_OPTION_VALUE_ID`),
  CONSTRAINT `FK1y5qtsuabhpwft3dyhqrgmtb4` FOREIGN KEY (`CUSTOMER_OPTION_ID`) REFERENCES `CUSTOMER_OPTION` (`CUSTOMER_OPTION_ID`),
  CONSTRAINT `FKj9vnvyh6hhhftjbcsymgiodm9` FOREIGN KEY (`CUSTOMER_OPTION_VALUE_ID`) REFERENCES `CUSTOMER_OPTION_VALUE` (`CUSTOMER_OPTION_VALUE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CUSTOMER_OPTION_SET`
--

LOCK TABLES `CUSTOMER_OPTION_SET` WRITE;
/*!40000 ALTER TABLE `CUSTOMER_OPTION_SET` DISABLE KEYS */;
/*!40000 ALTER TABLE `CUSTOMER_OPTION_SET` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CUSTOMER_OPTION_VALUE`
--

DROP TABLE IF EXISTS `CUSTOMER_OPTION_VALUE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8 */;
CREATE TABLE `CUSTOMER_OPTION_VALUE` (
  `CUSTOMER_OPTION_VALUE_ID` bigint NOT NULL,
  `CUSTOMER_OPT_VAL_CODE` varchar(255) DEFAULT NULL,
  `CUSTOMER_OPT_VAL_IMAGE` varchar(255) DEFAULT NULL,
  `SORT_ORDER` int DEFAULT NULL,
  `MERCHANT_ID` int NOT NULL,
  PRIMARY KEY (`CUSTOMER_OPTION_VALUE_ID`),
  UNIQUE KEY `UKcb1fmv71nrx7m1rlx1ff5qvdt` (`MERCHANT_ID`,`CUSTOMER_OPT_VAL_CODE`),
  KEY `CUST_OPT_VAL_CODE_IDX` (`CUSTOMER_OPT_VAL_CODE`),
  CONSTRAINT `FKho87ssg5rnvwauj3y690a96g6` FOREIGN KEY (`MERCHANT_ID`) REFERENCES `MERCHANT_STORE` (`MERCHANT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CUSTOMER_OPTION_VALUE`
--

LOCK TABLES `CUSTOMER_OPTION_VALUE` WRITE;
/*!40000 ALTER TABLE `CUSTOMER_OPTION_VALUE` DISABLE KEYS */;
/*!40000 ALTER TABLE `CUSTOMER_OPTION_VALUE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CUSTOMER_OPT_VAL_DESCRIPTION`
--

DROP TABLE IF EXISTS `CUSTOMER_OPT_VAL_DESCRIPTION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8 */;
CREATE TABLE `CUSTOMER_OPT_VAL_DESCRIPTION` (
  `DESCRIPTION_ID` bigint NOT NULL,
  `DATE_CREATED` datetime DEFAULT NULL,
  `DATE_MODIFIED` datetime DEFAULT NULL,
  `UPDT_ID` varchar(60) DEFAULT NULL,
  `DESCRIPTION` longtext,
  `NAME` varchar(120) NOT NULL,
  `TITLE` varchar(100) DEFAULT NULL,
  `LANGUAGE_ID` int NOT NULL,
  `CUSTOMER_OPT_VAL_ID` bigint DEFAULT NULL,
  PRIMARY KEY (`DESCRIPTION_ID`),
  UNIQUE KEY `UKge7f2t1d31r87wnk09h9u1tnv` (`CUSTOMER_OPT_VAL_ID`,`LANGUAGE_ID`),
  KEY `FK6rfssi3qfx4pswicxrfb18c1` (`LANGUAGE_ID`),
  CONSTRAINT `FK6rfssi3qfx4pswicxrfb18c1` FOREIGN KEY (`LANGUAGE_ID`) REFERENCES `LANGUAGE` (`LANGUAGE_ID`),
  CONSTRAINT `FKhwrs6fyqk6vh11yvcflu42yef` FOREIGN KEY (`CUSTOMER_OPT_VAL_ID`) REFERENCES `CUSTOMER_OPTION_VALUE` (`CUSTOMER_OPTION_VALUE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CUSTOMER_OPT_VAL_DESCRIPTION`
--

LOCK TABLES `CUSTOMER_OPT_VAL_DESCRIPTION` WRITE;
/*!40000 ALTER TABLE `CUSTOMER_OPT_VAL_DESCRIPTION` DISABLE KEYS */;
/*!40000 ALTER TABLE `CUSTOMER_OPT_VAL_DESCRIPTION` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CUSTOMER_REVIEW`
--

DROP TABLE IF EXISTS `CUSTOMER_REVIEW`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8 */;
CREATE TABLE `CUSTOMER_REVIEW` (
  `CUSTOMER_REVIEW_ID` bigint NOT NULL,
  `DATE_CREATED` datetime DEFAULT NULL,
  `DATE_MODIFIED` datetime DEFAULT NULL,
  `UPDT_ID` varchar(60) DEFAULT NULL,
  `REVIEW_DATE` datetime DEFAULT NULL,
  `REVIEWS_RATING` double DEFAULT NULL,
  `REVIEWS_READ` bigint DEFAULT NULL,
  `STATUS` int DEFAULT NULL,
  `CUSTOMERS_ID` bigint DEFAULT NULL,
  `REVIEWED_CUSTOMER_ID` bigint DEFAULT NULL,
  PRIMARY KEY (`CUSTOMER_REVIEW_ID`),
  UNIQUE KEY `UK2momthbfrtgico2yyod8w18pk` (`CUSTOMERS_ID`,`REVIEWED_CUSTOMER_ID`),
  KEY `FK7pmqdk9od2af7cl6alx82fkek` (`REVIEWED_CUSTOMER_ID`),
  CONSTRAINT `FK7pmqdk9od2af7cl6alx82fkek` FOREIGN KEY (`REVIEWED_CUSTOMER_ID`) REFERENCES `CUSTOMER` (`CUSTOMER_ID`),
  CONSTRAINT `FKayt6tbxp7d4g1qyg8crw2n73p` FOREIGN KEY (`CUSTOMERS_ID`) REFERENCES `CUSTOMER` (`CUSTOMER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CUSTOMER_REVIEW`
--

LOCK TABLES `CUSTOMER_REVIEW` WRITE;
/*!40000 ALTER TABLE `CUSTOMER_REVIEW` DISABLE KEYS */;
/*!40000 ALTER TABLE `CUSTOMER_REVIEW` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CUSTOMER_REVIEW_DESCRIPTION`
--

DROP TABLE IF EXISTS `CUSTOMER_REVIEW_DESCRIPTION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8 */;
CREATE TABLE `CUSTOMER_REVIEW_DESCRIPTION` (
  `DESCRIPTION_ID` bigint NOT NULL,
  `DATE_CREATED` datetime DEFAULT NULL,
  `DATE_MODIFIED` datetime DEFAULT NULL,
  `UPDT_ID` varchar(60) DEFAULT NULL,
  `DESCRIPTION` longtext,
  `NAME` varchar(120) NOT NULL,
  `TITLE` varchar(100) DEFAULT NULL,
  `LANGUAGE_ID` int NOT NULL,
  `CUSTOMER_REVIEW_ID` bigint DEFAULT NULL,
  PRIMARY KEY (`DESCRIPTION_ID`),
  UNIQUE KEY `UK1va9q0nhoe3wli25ktpmouvyh` (`CUSTOMER_REVIEW_ID`,`LANGUAGE_ID`),
  KEY `FK5pkgrlk32uqaxkrbve5mws1hj` (`LANGUAGE_ID`),
  CONSTRAINT `FK5pkgrlk32uqaxkrbve5mws1hj` FOREIGN KEY (`LANGUAGE_ID`) REFERENCES `LANGUAGE` (`LANGUAGE_ID`),
  CONSTRAINT `FKhf88oagf6t62k28afn8uaijc7` FOREIGN KEY (`CUSTOMER_REVIEW_ID`) REFERENCES `CUSTOMER_REVIEW` (`CUSTOMER_REVIEW_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CUSTOMER_REVIEW_DESCRIPTION`
--

LOCK TABLES `CUSTOMER_REVIEW_DESCRIPTION` WRITE;
/*!40000 ALTER TABLE `CUSTOMER_REVIEW_DESCRIPTION` DISABLE KEYS */;
/*!40000 ALTER TABLE `CUSTOMER_REVIEW_DESCRIPTION` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FILE_HISTORY`
--

DROP TABLE IF EXISTS `FILE_HISTORY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8 */;
CREATE TABLE `FILE_HISTORY` (
  `FILE_HISTORY_ID` bigint NOT NULL,
  `ACCOUNTED_DATE` datetime DEFAULT NULL,
  `DATE_ADDED` datetime NOT NULL,
  `DATE_DELETED` datetime DEFAULT NULL,
  `DOWNLOAD_COUNT` int NOT NULL,
  `FILE_ID` bigint DEFAULT NULL,
  `FILESIZE` int NOT NULL,
  `MERCHANT_ID` int NOT NULL,
  PRIMARY KEY (`FILE_HISTORY_ID`),
  UNIQUE KEY `UKav35sb3v4nxq8v1n1rkxufir` (`MERCHANT_ID`,`FILE_ID`),
  CONSTRAINT `FK2k8h4penkjlbtc23vamwyek2g` FOREIGN KEY (`MERCHANT_ID`) REFERENCES `MERCHANT_STORE` (`MERCHANT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FILE_HISTORY`
--

LOCK TABLES `FILE_HISTORY` WRITE;
/*!40000 ALTER TABLE `FILE_HISTORY` DISABLE KEYS */;
/*!40000 ALTER TABLE `FILE_HISTORY` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `GEOZONE`
--

DROP TABLE IF EXISTS `GEOZONE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8 */;
CREATE TABLE `GEOZONE` (
  `GEOZONE_ID` bigint NOT NULL,
  `GEOZONE_CODE` varchar(255) DEFAULT NULL,
  `GEOZONE_NAME` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`GEOZONE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `GEOZONE`
--

LOCK TABLES `GEOZONE` WRITE;
/*!40000 ALTER TABLE `GEOZONE` DISABLE KEYS */;
/*!40000 ALTER TABLE `GEOZONE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `GEOZONE_DESCRIPTION`
--

DROP TABLE IF EXISTS `GEOZONE_DESCRIPTION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8 */;
CREATE TABLE `GEOZONE_DESCRIPTION` (
  `DESCRIPTION_ID` bigint NOT NULL,
  `DATE_CREATED` datetime DEFAULT NULL,
  `DATE_MODIFIED` datetime DEFAULT NULL,
  `UPDT_ID` varchar(60) DEFAULT NULL,
  `DESCRIPTION` longtext,
  `NAME` varchar(120) NOT NULL,
  `TITLE` varchar(100) DEFAULT NULL,
  `LANGUAGE_ID` int NOT NULL,
  `GEOZONE_ID` bigint DEFAULT NULL,
  PRIMARY KEY (`DESCRIPTION_ID`),
  UNIQUE KEY `UKsoq8o99w3c8ys3ntamt5i4mat` (`GEOZONE_ID`,`LANGUAGE_ID`),
  KEY `FK1t2hp628edebe5d6co2whbla9` (`LANGUAGE_ID`),
  CONSTRAINT `FK1t2hp628edebe5d6co2whbla9` FOREIGN KEY (`LANGUAGE_ID`) REFERENCES `LANGUAGE` (`LANGUAGE_ID`),
  CONSTRAINT `FKn82te2yb2st4hk2qlhl8ileb9` FOREIGN KEY (`GEOZONE_ID`) REFERENCES `GEOZONE` (`GEOZONE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `GEOZONE_DESCRIPTION`
--

LOCK TABLES `GEOZONE_DESCRIPTION` WRITE;
/*!40000 ALTER TABLE `GEOZONE_DESCRIPTION` DISABLE KEYS */;
/*!40000 ALTER TABLE `GEOZONE_DESCRIPTION` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `LANGUAGE`
--

DROP TABLE IF EXISTS `LANGUAGE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8 */;
CREATE TABLE `LANGUAGE` (
  `LANGUAGE_ID` int NOT NULL,
  `DATE_CREATED` datetime DEFAULT NULL,
  `DATE_MODIFIED` datetime DEFAULT NULL,
  `UPDT_ID` varchar(60) DEFAULT NULL,
  `CODE` varchar(255) NOT NULL,
  `SORT_ORDER` int DEFAULT NULL,
  PRIMARY KEY (`LANGUAGE_ID`),
  KEY `CODE_IDX2` (`CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `LANGUAGE`
--

LOCK TABLES `LANGUAGE` WRITE;
/*!40000 ALTER TABLE `LANGUAGE` DISABLE KEYS */;
INSERT INTO `LANGUAGE` VALUES (1,'2020-12-21 05:37:26','2020-12-21 05:37:26',NULL,'en',NULL),(2,'2020-12-21 05:37:26','2020-12-21 05:37:26',NULL,'fr',NULL),(3,'2020-12-21 05:37:26','2020-12-21 05:37:26',NULL,'es',NULL);
/*!40000 ALTER TABLE `LANGUAGE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `MANUFACTURER`
--

DROP TABLE IF EXISTS `MANUFACTURER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8 */;
CREATE TABLE `MANUFACTURER` (
  `MANUFACTURER_ID` bigint NOT NULL,
  `DATE_CREATED` datetime DEFAULT NULL,
  `DATE_MODIFIED` datetime DEFAULT NULL,
  `UPDT_ID` varchar(60) DEFAULT NULL,
  `CODE` varchar(100) NOT NULL,
  `MANUFACTURER_IMAGE` varchar(255) DEFAULT NULL,
  `SORT_ORDER` int DEFAULT NULL,
  `MERCHANT_ID` int NOT NULL,
  PRIMARY KEY (`MANUFACTURER_ID`),
  UNIQUE KEY `UK6brqfdkga7jc78n8dh3v595y3` (`MERCHANT_ID`,`CODE`),
  CONSTRAINT `FKhswph4nthrqwffjekccudsrt2` FOREIGN KEY (`MERCHANT_ID`) REFERENCES `MERCHANT_STORE` (`MERCHANT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `MANUFACTURER`
--

LOCK TABLES `MANUFACTURER` WRITE;
/*!40000 ALTER TABLE `MANUFACTURER` DISABLE KEYS */;
INSERT INTO `MANUFACTURER` VALUES (1,'2020-12-21 05:37:36','2020-12-21 05:37:36',NULL,'DEFAULT',NULL,0,1),(2,'2020-12-21 05:37:48','2020-12-21 05:37:48',NULL,'oreilley',NULL,0,1),(3,'2020-12-21 05:37:48','2020-12-21 05:37:48',NULL,'sams',NULL,0,1),(4,'2020-12-21 05:37:48','2020-12-21 05:37:48',NULL,'packt',NULL,0,1),(5,'2020-12-21 05:37:48','2020-12-21 05:37:48',NULL,'manning',NULL,0,1),(6,'2020-12-21 05:37:48','2020-12-21 05:37:48',NULL,'novells',NULL,0,1);
/*!40000 ALTER TABLE `MANUFACTURER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `MANUFACTURER_DESCRIPTION`
--

DROP TABLE IF EXISTS `MANUFACTURER_DESCRIPTION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8 */;
CREATE TABLE `MANUFACTURER_DESCRIPTION` (
  `DESCRIPTION_ID` bigint NOT NULL,
  `DATE_CREATED` datetime DEFAULT NULL,
  `DATE_MODIFIED` datetime DEFAULT NULL,
  `UPDT_ID` varchar(60) DEFAULT NULL,
  `DESCRIPTION` longtext,
  `NAME` varchar(120) NOT NULL,
  `TITLE` varchar(100) DEFAULT NULL,
  `DATE_LAST_CLICK` datetime DEFAULT NULL,
  `MANUFACTURERS_URL` varchar(255) DEFAULT NULL,
  `URL_CLICKED` int DEFAULT NULL,
  `LANGUAGE_ID` int NOT NULL,
  `MANUFACTURER_ID` bigint NOT NULL,
  PRIMARY KEY (`DESCRIPTION_ID`),
  UNIQUE KEY `UKlpv09p83sc887clxe04nroup6` (`MANUFACTURER_ID`,`LANGUAGE_ID`),
  KEY `FK20t33wr4tp1kt1uyw7s8a3afl` (`LANGUAGE_ID`),
  CONSTRAINT `FK20t33wr4tp1kt1uyw7s8a3afl` FOREIGN KEY (`LANGUAGE_ID`) REFERENCES `LANGUAGE` (`LANGUAGE_ID`),
  CONSTRAINT `FKre4iys57n5cfbgpg3qqgewtrh` FOREIGN KEY (`MANUFACTURER_ID`) REFERENCES `MANUFACTURER` (`MANUFACTURER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `MANUFACTURER_DESCRIPTION`
--

LOCK TABLES `MANUFACTURER_DESCRIPTION` WRITE;
/*!40000 ALTER TABLE `MANUFACTURER_DESCRIPTION` DISABLE KEYS */;
INSERT INTO `MANUFACTURER_DESCRIPTION` VALUES (1,'2020-12-21 05:37:36','2020-12-21 05:37:36',NULL,'DEFAULT','DEFAULT',NULL,NULL,NULL,NULL,1,1),(2,'2020-12-21 05:37:48','2020-12-21 05:37:48',NULL,NULL,'O\'Reilley',NULL,NULL,NULL,NULL,1,2),(3,'2020-12-21 05:37:48','2020-12-21 05:37:48',NULL,NULL,'Sams',NULL,NULL,NULL,NULL,1,3),(4,'2020-12-21 05:37:48','2020-12-21 05:37:48',NULL,NULL,'Packt',NULL,NULL,NULL,NULL,1,4),(5,'2020-12-21 05:37:48','2020-12-21 05:37:48',NULL,NULL,'Manning',NULL,NULL,NULL,NULL,1,5),(6,'2020-12-21 05:37:48','2020-12-21 05:37:48',NULL,NULL,'Novells publishing',NULL,NULL,NULL,NULL,1,6);
/*!40000 ALTER TABLE `MANUFACTURER_DESCRIPTION` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `MERCHANT_CONFIGURATION`
--

DROP TABLE IF EXISTS `MERCHANT_CONFIGURATION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8 */;
CREATE TABLE `MERCHANT_CONFIGURATION` (
  `MERCHANT_CONFIG_ID` bigint NOT NULL,
  `ACTIVE` bit(1) DEFAULT NULL,
  `DATE_CREATED` datetime DEFAULT NULL,
  `DATE_MODIFIED` datetime DEFAULT NULL,
  `UPDT_ID` varchar(60) DEFAULT NULL,
  `CONFIG_KEY` varchar(255) DEFAULT NULL,
  `TYPE` varchar(255) DEFAULT NULL,
  `VALUE` longtext,
  `MERCHANT_ID` int DEFAULT NULL,
  PRIMARY KEY (`MERCHANT_CONFIG_ID`),
  UNIQUE KEY `UKj0c3h8onw3m6hjcr3yylst9fb` (`MERCHANT_ID`,`CONFIG_KEY`),
  CONSTRAINT `FKf9bkgf0ysbp5fo9j69shm0pri` FOREIGN KEY (`MERCHANT_ID`) REFERENCES `MERCHANT_STORE` (`MERCHANT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `MERCHANT_CONFIGURATION`
--

LOCK TABLES `MERCHANT_CONFIGURATION` WRITE;
/*!40000 ALTER TABLE `MERCHANT_CONFIGURATION` DISABLE KEYS */;
INSERT INTO `MERCHANT_CONFIGURATION` VALUES (1,_binary '\0','2020-12-21 05:37:36','2020-12-21 05:37:36',NULL,'CONFIG','CONFIG','{\"allowPurchaseItems\":true,\"displayContactUs\":false,\"displayCustomerAgreement\":false,\"defaultSearchConfigPath\":{},\"displayCustomerSection\":false,\"displayAddToCartOnFeaturedItems\":true,\"displayPagesMenu\":true,\"testMode\":false,\"displayStoreAddress\":false,\"displaySearchBox\":true,\"debugMode\":false,\"useDefaultSearchConfig\":{}}',1),(50,_binary '\0','2021-07-01 18:14:18','2021-07-01 18:14:18',NULL,'PAYMENT','INTEGRATION','df02614ab6600db0eb4d78e2c4df5574f9ba1903c78f9da01dded48dcbe5fa1395559a2eb8160dd8615b22e900932a7bac035d6eaa57b1ec05f4cedf94c2d8054819918ba0b244669d6987678949825eee5e06278ad1acdb473840b69721531c51e62999ba70c79fdd7257895873ce0eb02d1bba996482399c3256701d13db15023665fbecfccba25ba1a2845fe1521d56170e9baeb01ae17abb29609869425d',1);
/*!40000 ALTER TABLE `MERCHANT_CONFIGURATION` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `MERCHANT_LANGUAGE`
--

DROP TABLE IF EXISTS `MERCHANT_LANGUAGE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8 */;
CREATE TABLE `MERCHANT_LANGUAGE` (
  `stores_MERCHANT_ID` int NOT NULL,
  `languages_LANGUAGE_ID` int NOT NULL,
  KEY `FKjwy0pjijh1qmcoivq50o2jgec` (`languages_LANGUAGE_ID`),
  KEY `FKiisj0tmoujv6n3iqmytvo39kn` (`stores_MERCHANT_ID`),
  CONSTRAINT `FKiisj0tmoujv6n3iqmytvo39kn` FOREIGN KEY (`stores_MERCHANT_ID`) REFERENCES `MERCHANT_STORE` (`MERCHANT_ID`),
  CONSTRAINT `FKjwy0pjijh1qmcoivq50o2jgec` FOREIGN KEY (`languages_LANGUAGE_ID`) REFERENCES `LANGUAGE` (`LANGUAGE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `MERCHANT_LANGUAGE`
--

LOCK TABLES `MERCHANT_LANGUAGE` WRITE;
/*!40000 ALTER TABLE `MERCHANT_LANGUAGE` DISABLE KEYS */;
INSERT INTO `MERCHANT_LANGUAGE` VALUES (1,1);
/*!40000 ALTER TABLE `MERCHANT_LANGUAGE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `MERCHANT_LOG`
--

DROP TABLE IF EXISTS `MERCHANT_LOG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8 */;
CREATE TABLE `MERCHANT_LOG` (
  `MERCHANT_LOG_ID` bigint NOT NULL,
  `LOG` longtext,
  `MODULE` varchar(25) DEFAULT NULL,
  `MERCHANT_ID` int NOT NULL,
  PRIMARY KEY (`MERCHANT_LOG_ID`),
  KEY `FKto727b9r68qrtn2vvdqdvd4ic` (`MERCHANT_ID`),
  CONSTRAINT `FKto727b9r68qrtn2vvdqdvd4ic` FOREIGN KEY (`MERCHANT_ID`) REFERENCES `MERCHANT_STORE` (`MERCHANT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `MERCHANT_LOG`
--

LOCK TABLES `MERCHANT_LOG` WRITE;
/*!40000 ALTER TABLE `MERCHANT_LOG` DISABLE KEYS */;
/*!40000 ALTER TABLE `MERCHANT_LOG` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `MERCHANT_STORE`
--

DROP TABLE IF EXISTS `MERCHANT_STORE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8 */;
CREATE TABLE `MERCHANT_STORE` (
  `MERCHANT_ID` int NOT NULL,
  `DATE_CREATED` datetime DEFAULT NULL,
  `DATE_MODIFIED` datetime DEFAULT NULL,
  `UPDT_ID` varchar(60) DEFAULT NULL,
  `STORE_CODE` varchar(100) NOT NULL,
  `CONTINUESHOPPINGURL` varchar(150) DEFAULT NULL,
  `CURRENCY_FORMAT_NATIONAL` bit(1) DEFAULT NULL,
  `DOMAIN_NAME` varchar(80) DEFAULT NULL,
  `IN_BUSINESS_SINCE` date DEFAULT NULL,
  `INVOICE_TEMPLATE` varchar(25) DEFAULT NULL,
  `IS_RETAILER` bit(1) DEFAULT NULL,
  `SEIZEUNITCODE` varchar(5) DEFAULT NULL,
  `STORE_EMAIL` varchar(60) NOT NULL,
  `STORE_LOGO` varchar(100) DEFAULT NULL,
  `STORE_TEMPLATE` varchar(25) DEFAULT NULL,
  `STORE_ADDRESS` varchar(255) DEFAULT NULL,
  `STORE_CITY` varchar(100) DEFAULT NULL,
  `STORE_NAME` varchar(100) NOT NULL,
  `STORE_PHONE` varchar(50) DEFAULT NULL,
  `STORE_POSTAL_CODE` varchar(15) DEFAULT NULL,
  `STORE_STATE_PROV` varchar(100) DEFAULT NULL,
  `USE_CACHE` bit(1) DEFAULT NULL,
  `WEIGHTUNITCODE` varchar(5) DEFAULT NULL,
  `COUNTRY_ID` int NOT NULL,
  `CURRENCY_ID` bigint NOT NULL,
  `LANGUAGE_ID` int NOT NULL,
  `PARENT_ID` int DEFAULT NULL,
  `ZONE_ID` bigint DEFAULT NULL,
  PRIMARY KEY (`MERCHANT_ID`),
  UNIQUE KEY `UK_4pvtsnqv4nlao8725n9ldpguf` (`STORE_CODE`),
  KEY `FK2gn7vpkd9x832urw7c6jlawnn` (`COUNTRY_ID`),
  KEY `FK63hlw9wp1k1x3f5tke7t2us7s` (`CURRENCY_ID`),
  KEY `FKdnemo9tl8tjhkxko83psvkv19` (`LANGUAGE_ID`),
  KEY `FKgkoele515h76u39b9defibkm9` (`PARENT_ID`),
  KEY `FK5o24aky9161jyofyxmg0g53vv` (`ZONE_ID`),
  CONSTRAINT `FK2gn7vpkd9x832urw7c6jlawnn` FOREIGN KEY (`COUNTRY_ID`) REFERENCES `COUNTRY` (`COUNTRY_ID`),
  CONSTRAINT `FK5o24aky9161jyofyxmg0g53vv` FOREIGN KEY (`ZONE_ID`) REFERENCES `ZONE` (`ZONE_ID`),
  CONSTRAINT `FK63hlw9wp1k1x3f5tke7t2us7s` FOREIGN KEY (`CURRENCY_ID`) REFERENCES `CURRENCY` (`CURRENCY_ID`),
  CONSTRAINT `FKdnemo9tl8tjhkxko83psvkv19` FOREIGN KEY (`LANGUAGE_ID`) REFERENCES `LANGUAGE` (`LANGUAGE_ID`),
  CONSTRAINT `FKgkoele515h76u39b9defibkm9` FOREIGN KEY (`PARENT_ID`) REFERENCES `MERCHANT_STORE` (`MERCHANT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `MERCHANT_STORE`
--

LOCK TABLES `MERCHANT_STORE` WRITE;
/*!40000 ALTER TABLE `MERCHANT_STORE` DISABLE KEYS */;
INSERT INTO `MERCHANT_STORE` VALUES (1,NULL,NULL,NULL,'DEFAULT',NULL,_binary '\0','localhost:8080','2020-12-21',NULL,_binary '','IN','john@test.com',NULL,'december','1234 Street address','My city','Default store','888-888-8888','H2H-2H2',NULL,_binary '\0','LB',13,105,1,NULL,9);
/*!40000 ALTER TABLE `MERCHANT_STORE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `MODULE_CONFIGURATION`
--

DROP TABLE IF EXISTS `MODULE_CONFIGURATION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8 */;
CREATE TABLE `MODULE_CONFIGURATION` (
  `MODULE_CONF_ID` bigint NOT NULL,
  `DATE_CREATED` datetime DEFAULT NULL,
  `DATE_MODIFIED` datetime DEFAULT NULL,
  `UPDT_ID` varchar(60) DEFAULT NULL,
  `CODE` varchar(255) NOT NULL,
  `DETAILS` longtext,
  `CONFIGURATION` varchar(4000) DEFAULT NULL,
  `CUSTOM_IND` bit(1) DEFAULT NULL,
  `IMAGE` varchar(255) DEFAULT NULL,
  `MODULE` varchar(255) DEFAULT NULL,
  `REGIONS` varchar(255) DEFAULT NULL,
  `TYPE` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`MODULE_CONF_ID`),
  KEY `MODULE_CONFIGURATION_MODULE` (`MODULE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `MODULE_CONFIGURATION`
--

LOCK TABLES `MODULE_CONFIGURATION` WRITE;
/*!40000 ALTER TABLE `MODULE_CONFIGURATION` DISABLE KEYS */;
INSERT INTO `MODULE_CONFIGURATION` VALUES (1,'2020-12-21 05:37:36','2020-12-21 05:37:36',NULL,'usps',NULL,NULL,_binary '\0','usps.jpg','SHIPPING','[\"US\"]',NULL),(2,'2020-12-21 05:37:36','2020-12-21 05:37:36',NULL,'canadapost',NULL,NULL,_binary '\0','canadapost.jpg','SHIPPING','[\"CA\"]',NULL),(3,'2020-12-21 05:37:36','2020-12-21 05:37:36',NULL,'ups',NULL,NULL,_binary '\0','ups.jpg','SHIPPING','[\"US\",\"CA\",\"FR\",\"GB\"]',NULL),(4,'2020-12-21 05:37:36','2020-12-21 05:37:36',NULL,'weightBased',NULL,NULL,_binary '',NULL,'SHIPPING','[\"*\"]',NULL),(5,'2020-12-21 05:37:36','2020-12-21 05:37:36',NULL,'customQuotesRules',NULL,NULL,_binary '\0',NULL,'SHIPPING','[\"*\"]',NULL),(6,'2020-12-21 05:37:36','2020-12-21 05:37:36',NULL,'priceByDistance',NULL,NULL,_binary '\0',NULL,'SHIPPING','[\"*\"]',NULL),(7,'2020-12-21 05:37:36','2020-12-21 05:37:36',NULL,'storePickUp',NULL,NULL,_binary '\0',NULL,'SHIPPING','[\"*\"]',NULL),(8,'2020-12-21 05:37:36','2020-12-21 05:37:36',NULL,'moneyorder',NULL,NULL,_binary '\0','moneyorder.gif','PAYMENT','[\"*\"]','moneyorder'),(9,'2020-12-21 05:37:36','2020-12-21 05:37:36',NULL,'paypal-express-checkout',NULL,NULL,_binary '\0','icon-paypal.png','PAYMENT','[\"*\"]','paypal'),(10,'2020-12-21 05:37:36','2020-12-21 05:37:36',NULL,'beanstream',NULL,NULL,_binary '\0','beanstream.gif','PAYMENT','[\"US\",\"CA\",\"GB\"]','creditcard'),(11,'2020-12-21 05:37:36','2020-12-21 05:37:36',NULL,'stripe',NULL,NULL,_binary '\0','stripe.png','PAYMENT','[\"US\",\"CA\",\"GB\",\"AU\",\"FI\",\"DK\",\"IE\",\"NO\",\"SE\",\"ES\",\"PT\"]','creditcard'),(12,'2020-12-21 05:37:36','2020-12-21 05:37:36',NULL,'stripe3',NULL,NULL,_binary '\0','stripe.png','PAYMENT','[\"US\",\"CA\",\"GB\",\"AU\",\"FI\",\"DK\",\"IE\",\"NO\",\"SE\",\"ES\",\"PT\"]','creditcard'),(13,'2020-12-21 05:37:36','2020-12-21 05:37:36',NULL,'braintree',NULL,NULL,_binary '\0','braintree.jpg','PAYMENT',NULL,'creditcard');
/*!40000 ALTER TABLE `MODULE_CONFIGURATION` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `OPTIN`
--

DROP TABLE IF EXISTS `OPTIN`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8 */;
CREATE TABLE `OPTIN` (
  `OPTIN_ID` bigint NOT NULL,
  `CODE` varchar(255) NOT NULL,
  `DESCRIPTION` varchar(255) DEFAULT NULL,
  `END_DATE` datetime DEFAULT NULL,
  `TYPE` varchar(255) NOT NULL,
  `START_DATE` datetime DEFAULT NULL,
  `MERCHANT_ID` int DEFAULT NULL,
  PRIMARY KEY (`OPTIN_ID`),
  UNIQUE KEY `UKmanlx6siq6ddf14cud40k8gw6` (`MERCHANT_ID`,`CODE`),
  CONSTRAINT `FK37xvfo4the20avv7f1e1771fh` FOREIGN KEY (`MERCHANT_ID`) REFERENCES `MERCHANT_STORE` (`MERCHANT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `OPTIN`
--

LOCK TABLES `OPTIN` WRITE;
/*!40000 ALTER TABLE `OPTIN` DISABLE KEYS */;
INSERT INTO `OPTIN` VALUES (1,'NEWSLETTER',NULL,NULL,'NEWSLETTER',NULL,1);
/*!40000 ALTER TABLE `OPTIN` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ORDERS`
--

DROP TABLE IF EXISTS `ORDERS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8 */;
CREATE TABLE `ORDERS` (
  `ORDER_ID` bigint NOT NULL,
  `BILLING_STREET_ADDRESS` varchar(256) DEFAULT NULL,
  `BILLING_CITY` varchar(100) DEFAULT NULL,
  `BILLING_COMPANY` varchar(100) DEFAULT NULL,
  `BILLING_FIRST_NAME` varchar(64) NOT NULL,
  `BILLING_LAST_NAME` varchar(64) NOT NULL,
  `LATITUDE` varchar(100) DEFAULT NULL,
  `LONGITUDE` varchar(100) DEFAULT NULL,
  `BILLING_POSTCODE` varchar(20) DEFAULT NULL,
  `BILLING_STATE` varchar(100) DEFAULT NULL,
  `BILLING_TELEPHONE` varchar(32) DEFAULT NULL,
  `CHANNEL` varchar(255) DEFAULT NULL,
  `CONFIRMED_ADDRESS` bit(1) DEFAULT NULL,
  `CARD_TYPE` varchar(255) DEFAULT NULL,
  `CC_CVV` varchar(255) DEFAULT NULL,
  `CC_EXPIRES` varchar(255) DEFAULT NULL,
  `CC_NUMBER` varchar(255) DEFAULT NULL,
  `CC_OWNER` varchar(255) DEFAULT NULL,
  `CURRENCY_VALUE` decimal(19,2) DEFAULT NULL,
  `CUSTOMER_AGREED` bit(1) DEFAULT NULL,
  `CUSTOMER_EMAIL_ADDRESS` varchar(50) NOT NULL,
  `CUSTOMER_ID` bigint DEFAULT NULL,
  `DATE_PURCHASED` date DEFAULT NULL,
  `DELIVERY_STREET_ADDRESS` varchar(256) DEFAULT NULL,
  `DELIVERY_CITY` varchar(100) DEFAULT NULL,
  `DELIVERY_COMPANY` varchar(100) DEFAULT NULL,
  `DELIVERY_FIRST_NAME` varchar(64) DEFAULT NULL,
  `DELIVERY_LAST_NAME` varchar(64) DEFAULT NULL,
  `DELIVERY_POSTCODE` varchar(20) DEFAULT NULL,
  `DELIVERY_STATE` varchar(100) DEFAULT NULL,
  `DELIVERY_TELEPHONE` varchar(32) DEFAULT NULL,
  `IP_ADDRESS` varchar(255) DEFAULT NULL,
  `LAST_MODIFIED` datetime DEFAULT NULL,
  `LOCALE` varchar(255) DEFAULT NULL,
  `ORDER_DATE_FINISHED` datetime DEFAULT NULL,
  `ORDER_TYPE` varchar(255) DEFAULT NULL,
  `PAYMENT_MODULE_CODE` varchar(255) DEFAULT NULL,
  `PAYMENT_TYPE` varchar(255) DEFAULT NULL,
  `SHIPPING_MODULE_CODE` varchar(255) DEFAULT NULL,
  `CART_CODE` varchar(255) DEFAULT NULL,
  `ORDER_STATUS` varchar(255) DEFAULT NULL,
  `ORDER_TOTAL` decimal(19,2) DEFAULT NULL,
  `BILLING_COUNTRY_ID` int NOT NULL,
  `BILLING_ZONE_ID` bigint DEFAULT NULL,
  `CURRENCY_ID` bigint DEFAULT NULL,
  `DELIVERY_COUNTRY_ID` int DEFAULT NULL,
  `DELIVERY_ZONE_ID` bigint DEFAULT NULL,
  `MERCHANTID` int DEFAULT NULL,
  PRIMARY KEY (`ORDER_ID`),
  KEY `FKipesu5tupnriahutgle6xu9ed` (`BILLING_COUNTRY_ID`),
  KEY `FKit6ti99mv5uvuxqskhurv3y59` (`BILLING_ZONE_ID`),
  KEY `FKfusivmw6q3gjxnmp47n9s74qi` (`CURRENCY_ID`),
  KEY `FKnlx97vjyorunxglhy5bird06c` (`DELIVERY_COUNTRY_ID`),
  KEY `FKn9uvjl8105fsly4doo8rqnv5b` (`DELIVERY_ZONE_ID`),
  KEY `FKaodv5ffayq8x50q311o2y8m1` (`MERCHANTID`),
  CONSTRAINT `FKaodv5ffayq8x50q311o2y8m1` FOREIGN KEY (`MERCHANTID`) REFERENCES `MERCHANT_STORE` (`MERCHANT_ID`),
  CONSTRAINT `FKfusivmw6q3gjxnmp47n9s74qi` FOREIGN KEY (`CURRENCY_ID`) REFERENCES `CURRENCY` (`CURRENCY_ID`),
  CONSTRAINT `FKipesu5tupnriahutgle6xu9ed` FOREIGN KEY (`BILLING_COUNTRY_ID`) REFERENCES `COUNTRY` (`COUNTRY_ID`),
  CONSTRAINT `FKit6ti99mv5uvuxqskhurv3y59` FOREIGN KEY (`BILLING_ZONE_ID`) REFERENCES `ZONE` (`ZONE_ID`),
  CONSTRAINT `FKn9uvjl8105fsly4doo8rqnv5b` FOREIGN KEY (`DELIVERY_ZONE_ID`) REFERENCES `ZONE` (`ZONE_ID`),
  CONSTRAINT `FKnlx97vjyorunxglhy5bird06c` FOREIGN KEY (`DELIVERY_COUNTRY_ID`) REFERENCES `COUNTRY` (`COUNTRY_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ORDERS`
--

LOCK TABLES `ORDERS` WRITE;
/*!40000 ALTER TABLE `ORDERS` DISABLE KEYS */;
INSERT INTO `ORDERS` VALUES (1,'350 Du Languadoc','Boucherville','CSTI Consulting','Leonardo','DiCaprio',NULL,NULL,'J1B-8J6',NULL,NULL,NULL,_binary '\0',NULL,NULL,NULL,NULL,NULL,0.98,_binary '\0','leo@shopizer.com',1,'2020-12-21','358 Du Languadoc','Boucherville',NULL,'Leonardo','DiCaprio','J1B-8J6',NULL,NULL,'ipAddress','2020-12-21 05:37:49','en_US','2020-12-21 05:37:49','ORDER','paypal','PAYPAL',NULL,NULL,'DELIVERED',23.99,13,9,105,13,9,1);
/*!40000 ALTER TABLE `ORDERS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ORDER_ACCOUNT`
--

DROP TABLE IF EXISTS `ORDER_ACCOUNT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8 */;
CREATE TABLE `ORDER_ACCOUNT` (
  `ORDER_ACCOUNT_ID` bigint NOT NULL,
  `ORDER_ACCOUNT_BILL_DAY` int NOT NULL,
  `ORDER_ACCOUNT_END_DATE` date DEFAULT NULL,
  `ORDER_ACCOUNT_START_DATE` date NOT NULL,
  `ORDER_ID` bigint NOT NULL,
  PRIMARY KEY (`ORDER_ACCOUNT_ID`),
  KEY `FKi6l5isodh81m5hy8ua06hx73n` (`ORDER_ID`),
  CONSTRAINT `FKi6l5isodh81m5hy8ua06hx73n` FOREIGN KEY (`ORDER_ID`) REFERENCES `ORDERS` (`ORDER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ORDER_ACCOUNT`
--

LOCK TABLES `ORDER_ACCOUNT` WRITE;
/*!40000 ALTER TABLE `ORDER_ACCOUNT` DISABLE KEYS */;
/*!40000 ALTER TABLE `ORDER_ACCOUNT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ORDER_ACCOUNT_PRODUCT`
--

DROP TABLE IF EXISTS `ORDER_ACCOUNT_PRODUCT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8 */;
CREATE TABLE `ORDER_ACCOUNT_PRODUCT` (
  `ORDER_ACCOUNT_PRODUCT_ID` bigint NOT NULL,
  `ORDER_ACCOUNT_PRODUCT_ACCNT_DT` date DEFAULT NULL,
  `ORDER_ACCOUNT_PRODUCT_END_DT` date DEFAULT NULL,
  `ORDER_ACCOUNT_PRODUCT_EOT` datetime DEFAULT NULL,
  `ORDER_ACCOUNT_PRODUCT_L_ST_DT` datetime DEFAULT NULL,
  `ORDER_ACCOUNT_PRODUCT_L_TRX_ST` int NOT NULL,
  `ORDER_ACCOUNT_PRODUCT_PM_FR_TY` int NOT NULL,
  `ORDER_ACCOUNT_PRODUCT_ST_DT` date NOT NULL,
  `ORDER_ACCOUNT_PRODUCT_STATUS` int NOT NULL,
  `ORDER_ACCOUNT_ID` bigint NOT NULL,
  `ORDER_PRODUCT_ID` bigint NOT NULL,
  PRIMARY KEY (`ORDER_ACCOUNT_PRODUCT_ID`),
  KEY `FK7oxc8ygov7vd2ajt185jhiwts` (`ORDER_ACCOUNT_ID`),
  KEY `FK5kiyyb8ekqi9bfowytww8atcx` (`ORDER_PRODUCT_ID`),
  CONSTRAINT `FK5kiyyb8ekqi9bfowytww8atcx` FOREIGN KEY (`ORDER_PRODUCT_ID`) REFERENCES `ORDER_PRODUCT` (`ORDER_PRODUCT_ID`),
  CONSTRAINT `FK7oxc8ygov7vd2ajt185jhiwts` FOREIGN KEY (`ORDER_ACCOUNT_ID`) REFERENCES `ORDER_ACCOUNT` (`ORDER_ACCOUNT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ORDER_ACCOUNT_PRODUCT`
--

LOCK TABLES `ORDER_ACCOUNT_PRODUCT` WRITE;
/*!40000 ALTER TABLE `ORDER_ACCOUNT_PRODUCT` DISABLE KEYS */;
/*!40000 ALTER TABLE `ORDER_ACCOUNT_PRODUCT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ORDER_ATTRIBUTE`
--

DROP TABLE IF EXISTS `ORDER_ATTRIBUTE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8 */;
CREATE TABLE `ORDER_ATTRIBUTE` (
  `ORDER_ATTRIBUTE_ID` bigint NOT NULL,
  `IDENTIFIER` varchar(255) NOT NULL,
  `VALUE` varchar(255) NOT NULL,
  `ORDER_ID` bigint NOT NULL,
  PRIMARY KEY (`ORDER_ATTRIBUTE_ID`),
  KEY `FK4nw5yrtgb4in6leve76bmdnua` (`ORDER_ID`),
  CONSTRAINT `FK4nw5yrtgb4in6leve76bmdnua` FOREIGN KEY (`ORDER_ID`) REFERENCES `ORDERS` (`ORDER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ORDER_ATTRIBUTE`
--

LOCK TABLES `ORDER_ATTRIBUTE` WRITE;
/*!40000 ALTER TABLE `ORDER_ATTRIBUTE` DISABLE KEYS */;
/*!40000 ALTER TABLE `ORDER_ATTRIBUTE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ORDER_PRODUCT`
--

DROP TABLE IF EXISTS `ORDER_PRODUCT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8 */;
CREATE TABLE `ORDER_PRODUCT` (
  `ORDER_PRODUCT_ID` bigint NOT NULL,
  `ONETIME_CHARGE` decimal(19,2) NOT NULL,
  `PRODUCT_NAME` varchar(64) NOT NULL,
  `PRODUCT_QUANTITY` int DEFAULT NULL,
  `PRODUCT_SKU` varchar(255) DEFAULT NULL,
  `ORDER_ID` bigint NOT NULL,
  PRIMARY KEY (`ORDER_PRODUCT_ID`),
  KEY `FKf0sghmn59s14cxrjtrvkvi5yk` (`ORDER_ID`),
  CONSTRAINT `FKf0sghmn59s14cxrjtrvkvi5yk` FOREIGN KEY (`ORDER_ID`) REFERENCES `ORDERS` (`ORDER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ORDER_PRODUCT`
--

LOCK TABLES `ORDER_PRODUCT` WRITE;
/*!40000 ALTER TABLE `ORDER_PRODUCT` DISABLE KEYS */;
INSERT INTO `ORDER_PRODUCT` VALUES (1,19.99,'Product name',1,'TB12345',1);
/*!40000 ALTER TABLE `ORDER_PRODUCT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ORDER_PRODUCT_ATTRIBUTE`
--

DROP TABLE IF EXISTS `ORDER_PRODUCT_ATTRIBUTE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8 */;
CREATE TABLE `ORDER_PRODUCT_ATTRIBUTE` (
  `ORDER_PRODUCT_ATTRIBUTE_ID` bigint NOT NULL,
  `PRODUCT_ATTRIBUTE_IS_FREE` bit(1) NOT NULL,
  `PRODUCT_ATTRIBUTE_NAME` varchar(255) DEFAULT NULL,
  `PRODUCT_ATTRIBUTE_PRICE` decimal(15,4) NOT NULL,
  `PRODUCT_ATTRIBUTE_VAL_NAME` varchar(255) DEFAULT NULL,
  `PRODUCT_ATTRIBUTE_WEIGHT` decimal(15,4) DEFAULT NULL,
  `PRODUCT_OPTION_ID` bigint NOT NULL,
  `PRODUCT_OPTION_VALUE_ID` bigint NOT NULL,
  `ORDER_PRODUCT_ID` bigint NOT NULL,
  PRIMARY KEY (`ORDER_PRODUCT_ATTRIBUTE_ID`),
  KEY `FK7j86rvwaysbok1nuofrnmhmkx` (`ORDER_PRODUCT_ID`),
  CONSTRAINT `FK7j86rvwaysbok1nuofrnmhmkx` FOREIGN KEY (`ORDER_PRODUCT_ID`) REFERENCES `ORDER_PRODUCT` (`ORDER_PRODUCT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ORDER_PRODUCT_ATTRIBUTE`
--

LOCK TABLES `ORDER_PRODUCT_ATTRIBUTE` WRITE;
/*!40000 ALTER TABLE `ORDER_PRODUCT_ATTRIBUTE` DISABLE KEYS */;
/*!40000 ALTER TABLE `ORDER_PRODUCT_ATTRIBUTE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ORDER_PRODUCT_DOWNLOAD`
--

DROP TABLE IF EXISTS `ORDER_PRODUCT_DOWNLOAD`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8 */;
CREATE TABLE `ORDER_PRODUCT_DOWNLOAD` (
  `ORDER_PRODUCT_DOWNLOAD_ID` bigint NOT NULL,
  `DOWNLOAD_COUNT` int NOT NULL,
  `DOWNLOAD_MAXDAYS` int NOT NULL,
  `ORDER_PRODUCT_FILENAME` varchar(255) NOT NULL,
  `ORDER_PRODUCT_ID` bigint NOT NULL,
  PRIMARY KEY (`ORDER_PRODUCT_DOWNLOAD_ID`),
  KEY `FKstrda0eweharld63j8pxa2o2r` (`ORDER_PRODUCT_ID`),
  CONSTRAINT `FKstrda0eweharld63j8pxa2o2r` FOREIGN KEY (`ORDER_PRODUCT_ID`) REFERENCES `ORDER_PRODUCT` (`ORDER_PRODUCT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ORDER_PRODUCT_DOWNLOAD`
--

LOCK TABLES `ORDER_PRODUCT_DOWNLOAD` WRITE;
/*!40000 ALTER TABLE `ORDER_PRODUCT_DOWNLOAD` DISABLE KEYS */;
INSERT INTO `ORDER_PRODUCT_DOWNLOAD` VALUES (1,1,31,'Your digital file name',1);
/*!40000 ALTER TABLE `ORDER_PRODUCT_DOWNLOAD` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ORDER_PRODUCT_PRICE`
--

DROP TABLE IF EXISTS `ORDER_PRODUCT_PRICE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8 */;
CREATE TABLE `ORDER_PRODUCT_PRICE` (
  `ORDER_PRODUCT_PRICE_ID` bigint NOT NULL,
  `DEFAULT_PRICE` bit(1) NOT NULL,
  `PRODUCT_PRICE` decimal(19,2) NOT NULL,
  `PRODUCT_PRICE_CODE` varchar(64) NOT NULL,
  `PRODUCT_PRICE_NAME` varchar(255) DEFAULT NULL,
  `PRODUCT_PRICE_SPECIAL` decimal(19,2) DEFAULT NULL,
  `PRD_PRICE_SPECIAL_END_DT` datetime DEFAULT NULL,
  `PRD_PRICE_SPECIAL_ST_DT` datetime DEFAULT NULL,
  `ORDER_PRODUCT_ID` bigint NOT NULL,
  PRIMARY KEY (`ORDER_PRODUCT_PRICE_ID`),
  KEY `FKnkukiqxrieonyulercgnh857s` (`ORDER_PRODUCT_ID`),
  CONSTRAINT `FKnkukiqxrieonyulercgnh857s` FOREIGN KEY (`ORDER_PRODUCT_ID`) REFERENCES `ORDER_PRODUCT` (`ORDER_PRODUCT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ORDER_PRODUCT_PRICE`
--

LOCK TABLES `ORDER_PRODUCT_PRICE` WRITE;
/*!40000 ALTER TABLE `ORDER_PRODUCT_PRICE` DISABLE KEYS */;
INSERT INTO `ORDER_PRODUCT_PRICE` VALUES (1,_binary '',19.99,'baseprice','Base Price',NULL,NULL,NULL,1);
/*!40000 ALTER TABLE `ORDER_PRODUCT_PRICE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ORDER_STATUS_HISTORY`
--

DROP TABLE IF EXISTS `ORDER_STATUS_HISTORY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8 */;
CREATE TABLE `ORDER_STATUS_HISTORY` (
  `ORDER_STATUS_HISTORY_ID` bigint NOT NULL,
  `COMMENTS` longtext,
  `CUSTOMER_NOTIFIED` int DEFAULT NULL,
  `DATE_ADDED` datetime NOT NULL,
  `status` varchar(255) DEFAULT NULL,
  `ORDER_ID` bigint NOT NULL,
  PRIMARY KEY (`ORDER_STATUS_HISTORY_ID`),
  KEY `FKmhghgf1xy3o0npsp8xkj6wyvq` (`ORDER_ID`),
  CONSTRAINT `FKmhghgf1xy3o0npsp8xkj6wyvq` FOREIGN KEY (`ORDER_ID`) REFERENCES `ORDERS` (`ORDER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ORDER_STATUS_HISTORY`
--

LOCK TABLES `ORDER_STATUS_HISTORY` WRITE;
/*!40000 ALTER TABLE `ORDER_STATUS_HISTORY` DISABLE KEYS */;
INSERT INTO `ORDER_STATUS_HISTORY` VALUES (1,'We received your order',1,'2020-12-21 05:37:49','ORDERED',1);
/*!40000 ALTER TABLE `ORDER_STATUS_HISTORY` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ORDER_TOTAL`
--

DROP TABLE IF EXISTS `ORDER_TOTAL`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8 */;
CREATE TABLE `ORDER_TOTAL` (
  `ORDER_ACCOUNT_ID` bigint NOT NULL,
  `MODULE` varchar(60) DEFAULT NULL,
  `CODE` varchar(255) NOT NULL,
  `ORDER_TOTAL_TYPE` varchar(255) DEFAULT NULL,
  `ORDER_VALUE_TYPE` varchar(255) DEFAULT NULL,
  `SORT_ORDER` int NOT NULL,
  `TEXT` longtext,
  `TITLE` varchar(255) DEFAULT NULL,
  `VALUE` decimal(15,4) NOT NULL,
  `ORDER_ID` bigint NOT NULL,
  PRIMARY KEY (`ORDER_ACCOUNT_ID`),
  KEY `FK1tfvgk5smm80efdcc8uop4he3` (`ORDER_ID`),
  CONSTRAINT `FK1tfvgk5smm80efdcc8uop4he3` FOREIGN KEY (`ORDER_ID`) REFERENCES `ORDERS` (`ORDER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ORDER_TOTAL`
--

LOCK TABLES `ORDER_TOTAL` WRITE;
/*!40000 ALTER TABLE `ORDER_TOTAL` DISABLE KEYS */;
INSERT INTO `ORDER_TOTAL` VALUES (1,'summary','subtotal',NULL,'ONE_TIME',0,'Summary','Summary',19.9900,1),(2,'tax','tax',NULL,'ONE_TIME',1,'Tax','Tax',4.0000,1),(3,'total','total',NULL,'ONE_TIME',2,'Total','Total',23.9900,1);
/*!40000 ALTER TABLE `ORDER_TOTAL` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PERMISSION`
--

DROP TABLE IF EXISTS `PERMISSION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8 */;
CREATE TABLE `PERMISSION` (
  `PERMISSION_ID` int NOT NULL,
  `DATE_CREATED` datetime DEFAULT NULL,
  `DATE_MODIFIED` datetime DEFAULT NULL,
  `UPDT_ID` varchar(60) DEFAULT NULL,
  `PERMISSION_NAME` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`PERMISSION_ID`),
  UNIQUE KEY `UK_ss26hgwetkj8ms5y5jn2co4j3` (`PERMISSION_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PERMISSION`
--

LOCK TABLES `PERMISSION` WRITE;
/*!40000 ALTER TABLE `PERMISSION` DISABLE KEYS */;
INSERT INTO `PERMISSION` VALUES (1,'2020-12-21 05:37:26','2020-12-21 05:37:26',NULL,'AUTH'),(2,'2020-12-21 05:37:26','2020-12-21 05:37:26',NULL,'SUPERADMIN'),(3,'2020-12-21 05:37:26','2020-12-21 05:37:26',NULL,'ADMIN'),(4,'2020-12-21 05:37:26','2020-12-21 05:37:26',NULL,'PRODUCTS'),(5,'2020-12-21 05:37:26','2020-12-21 05:37:26',NULL,'ORDER'),(6,'2020-12-21 05:37:26','2020-12-21 05:37:26',NULL,'CONTENT'),(7,'2020-12-21 05:37:26','2020-12-21 05:37:26',NULL,'STORE'),(8,'2020-12-21 05:37:26','2020-12-21 05:37:26',NULL,'TAX'),(9,'2020-12-21 05:37:26','2020-12-21 05:37:26',NULL,'PAYMENT'),(10,'2020-12-21 05:37:26','2020-12-21 05:37:26',NULL,'CUSTOMER'),(11,'2020-12-21 05:37:26','2020-12-21 05:37:26',NULL,'SHIPPING'),(12,'2020-12-21 05:37:26','2020-12-21 05:37:26',NULL,'AUTH_CUSTOMER');
/*!40000 ALTER TABLE `PERMISSION` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PERMISSION_GROUP`
--

DROP TABLE IF EXISTS `PERMISSION_GROUP`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8 */;
CREATE TABLE `PERMISSION_GROUP` (
  `GROUP_ID` int NOT NULL,
  `PERMISSION_ID` int NOT NULL,
  PRIMARY KEY (`GROUP_ID`,`PERMISSION_ID`),
  KEY `FK77ly3khyuu40odly02d351s84` (`PERMISSION_ID`),
  CONSTRAINT `FK77ly3khyuu40odly02d351s84` FOREIGN KEY (`PERMISSION_ID`) REFERENCES `PERMISSION` (`PERMISSION_ID`),
  CONSTRAINT `FKr7ylutdgqp1nrlbhjwit6y17g` FOREIGN KEY (`GROUP_ID`) REFERENCES `SM_GROUP` (`GROUP_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PERMISSION_GROUP`
--

LOCK TABLES `PERMISSION_GROUP` WRITE;
/*!40000 ALTER TABLE `PERMISSION_GROUP` DISABLE KEYS */;
INSERT INTO `PERMISSION_GROUP` VALUES (1,1),(2,1),(3,1),(4,1),(5,1),(6,1),(7,1),(8,1),(1,2),(1,3),(2,3),(3,3),(1,4),(2,4),(3,4),(5,4),(1,5),(2,5),(3,5),(6,5),(1,6),(2,6),(3,6),(4,6),(7,6),(1,7),(2,7),(3,7),(4,7),(1,8),(2,8),(3,8),(4,8),(1,9),(2,9),(3,9),(4,9),(1,10),(2,10),(3,10),(4,10),(1,11),(2,11),(3,11),(4,11),(8,12);
/*!40000 ALTER TABLE `PERMISSION_GROUP` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PRODUCT`
--

DROP TABLE IF EXISTS `PRODUCT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8 */;
CREATE TABLE `PRODUCT` (
  `PRODUCT_ID` bigint NOT NULL,
  `DATE_CREATED` datetime DEFAULT NULL,
  `DATE_MODIFIED` datetime DEFAULT NULL,
  `UPDT_ID` varchar(60) DEFAULT NULL,
  `AVAILABLE` bit(1) DEFAULT NULL,
  `COND` int DEFAULT NULL,
  `DATE_AVAILABLE` datetime DEFAULT NULL,
  `PREORDER` bit(1) DEFAULT NULL,
  `PRODUCT_HEIGHT` decimal(19,2) DEFAULT NULL,
  `PRODUCT_FREE` bit(1) DEFAULT NULL,
  `PRODUCT_LENGTH` decimal(19,2) DEFAULT NULL,
  `QUANTITY_ORDERED` int DEFAULT NULL,
  `REVIEW_AVG` decimal(19,2) DEFAULT NULL,
  `REVIEW_COUNT` int DEFAULT NULL,
  `PRODUCT_SHIP` bit(1) DEFAULT NULL,
  `PRODUCT_VIRTUAL` bit(1) DEFAULT NULL,
  `PRODUCT_WEIGHT` decimal(19,2) DEFAULT NULL,
  `PRODUCT_WIDTH` decimal(19,2) DEFAULT NULL,
  `REF_SKU` varchar(255) DEFAULT NULL,
  `RENTAL_DURATION` int DEFAULT NULL,
  `RENTAL_PERIOD` int DEFAULT NULL,
  `RENTAL_STATUS` int DEFAULT NULL,
  `SKU` varchar(255) DEFAULT NULL,
  `SORT_ORDER` int DEFAULT NULL,
  `MANUFACTURER_ID` bigint DEFAULT NULL,
  `MERCHANT_ID` int NOT NULL,
  `CUSTOMER_ID` bigint DEFAULT NULL,
  `TAX_CLASS_ID` bigint DEFAULT NULL,
  `PRODUCT_TYPE_ID` bigint DEFAULT NULL,
  PRIMARY KEY (`PRODUCT_ID`),
  UNIQUE KEY `UKs8ofsn9pehdrstjg52j5qabxh` (`MERCHANT_ID`,`SKU`),
  KEY `FKra5mmrdxn3ci86hod7q1u3vu9` (`MANUFACTURER_ID`),
  KEY `FKqtt5f0aht5h7ough5rbkkcb33` (`CUSTOMER_ID`),
  KEY `FKb8oqtc3j8sqo0t8xdrne7pg69` (`TAX_CLASS_ID`),
  KEY `FKeiirvj8eu40h103fth8es1mt0` (`PRODUCT_TYPE_ID`),
  CONSTRAINT `FKb8oqtc3j8sqo0t8xdrne7pg69` FOREIGN KEY (`TAX_CLASS_ID`) REFERENCES `TAX_CLASS` (`TAX_CLASS_ID`),
  CONSTRAINT `FKeiirvj8eu40h103fth8es1mt0` FOREIGN KEY (`PRODUCT_TYPE_ID`) REFERENCES `PRODUCT_TYPE` (`PRODUCT_TYPE_ID`),
  CONSTRAINT `FKhhoq1nd9e0i4m7rt8gkh7d67h` FOREIGN KEY (`MERCHANT_ID`) REFERENCES `MERCHANT_STORE` (`MERCHANT_ID`),
  CONSTRAINT `FKqtt5f0aht5h7ough5rbkkcb33` FOREIGN KEY (`CUSTOMER_ID`) REFERENCES `CUSTOMER` (`CUSTOMER_ID`),
  CONSTRAINT `FKra5mmrdxn3ci86hod7q1u3vu9` FOREIGN KEY (`MANUFACTURER_ID`) REFERENCES `MANUFACTURER` (`MANUFACTURER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PRODUCT`
--

LOCK TABLES `PRODUCT` WRITE;
/*!40000 ALTER TABLE `PRODUCT` DISABLE KEYS */;
INSERT INTO `PRODUCT` VALUES (1,'2020-12-21 05:37:48','2020-12-21 05:37:48',NULL,_binary '',NULL,'2020-12-21 05:37:48',_binary '\0',10.00,_binary '\0',3.00,NULL,NULL,NULL,_binary '',_binary '\0',NULL,6.00,NULL,NULL,NULL,NULL,'TB12345',0,5,1,NULL,NULL,NULL),(2,'2020-12-21 05:37:48','2020-12-21 05:37:48',NULL,_binary '',NULL,'2020-12-21 05:37:48',_binary '\0',4.00,_binary '\0',3.00,NULL,NULL,NULL,_binary '',_binary '\0',NULL,1.00,NULL,NULL,NULL,NULL,'TB2468',0,4,1,NULL,NULL,NULL),(3,'2020-12-21 05:37:48','2020-12-21 05:37:48',NULL,_binary '',NULL,'2020-12-21 05:37:48',_binary '\0',4.00,_binary '\0',3.00,NULL,NULL,NULL,_binary '',_binary '\0',NULL,1.00,NULL,NULL,NULL,NULL,'NB1111',0,2,1,NULL,NULL,NULL),(4,'2020-12-21 05:37:48','2020-12-21 05:37:48',NULL,_binary '',NULL,'2020-12-21 05:37:48',_binary '\0',4.00,_binary '\0',3.00,NULL,NULL,NULL,_binary '',_binary '\0',NULL,1.00,NULL,NULL,NULL,NULL,'SF333345',0,3,1,NULL,NULL,NULL),(5,'2020-12-21 05:37:48','2020-12-21 05:37:48',NULL,_binary '',NULL,'2020-12-21 05:37:48',_binary '\0',4.00,_binary '\0',3.00,NULL,NULL,NULL,_binary '',_binary '\0',NULL,1.00,NULL,NULL,NULL,NULL,'SF333346',0,4,1,NULL,NULL,NULL),(6,'2020-12-21 05:37:49','2020-12-21 05:37:49',NULL,_binary '',NULL,'2020-12-21 05:37:49',_binary '\0',4.00,_binary '\0',3.00,NULL,NULL,NULL,_binary '',_binary '\0',NULL,1.00,NULL,NULL,NULL,NULL,'LL333444',0,6,1,NULL,NULL,NULL);
/*!40000 ALTER TABLE `PRODUCT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PRODUCT_ATTRIBUTE`
--

DROP TABLE IF EXISTS `PRODUCT_ATTRIBUTE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8 */;
CREATE TABLE `PRODUCT_ATTRIBUTE` (
  `PRODUCT_ATTRIBUTE_ID` bigint NOT NULL,
  `PRODUCT_ATTRIBUTE_DEFAULT` bit(1) DEFAULT NULL,
  `PRODUCT_ATTRIBUTE_DISCOUNTED` bit(1) DEFAULT NULL,
  `PRODUCT_ATTRIBUTE_FOR_DISP` bit(1) DEFAULT NULL,
  `PRODUCT_ATTRIBUTE_REQUIRED` bit(1) DEFAULT NULL,
  `PRODUCT_ATTRIBUTE_FREE` bit(1) DEFAULT NULL,
  `PRODUCT_ATRIBUTE_PRICE` decimal(19,2) DEFAULT NULL,
  `PRODUCT_ATTRIBUTE_WEIGHT` decimal(19,2) DEFAULT NULL,
  `PRODUCT_ATTRIBUTE_SORT_ORD` int DEFAULT NULL,
  `PRODUCT_ID` bigint NOT NULL,
  `OPTION_ID` bigint NOT NULL,
  `OPTION_VALUE_ID` bigint NOT NULL,
  PRIMARY KEY (`PRODUCT_ATTRIBUTE_ID`),
  UNIQUE KEY `UKo0c6cfxcfejwfa2877gfgpuco` (`OPTION_ID`,`OPTION_VALUE_ID`,`PRODUCT_ID`),
  KEY `FKml3nvemdjya159a7669qt1gjd` (`PRODUCT_ID`),
  KEY `FK3rleultg9fn2dxruefbb18d5t` (`OPTION_VALUE_ID`),
  CONSTRAINT `FK2st60u9twmvvaowwn88mt3lrx` FOREIGN KEY (`OPTION_ID`) REFERENCES `PRODUCT_OPTION` (`PRODUCT_OPTION_ID`),
  CONSTRAINT `FK3rleultg9fn2dxruefbb18d5t` FOREIGN KEY (`OPTION_VALUE_ID`) REFERENCES `PRODUCT_OPTION_VALUE` (`PRODUCT_OPTION_VALUE_ID`),
  CONSTRAINT `FKml3nvemdjya159a7669qt1gjd` FOREIGN KEY (`PRODUCT_ID`) REFERENCES `PRODUCT` (`PRODUCT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PRODUCT_ATTRIBUTE`
--

LOCK TABLES `PRODUCT_ATTRIBUTE` WRITE;
/*!40000 ALTER TABLE `PRODUCT_ATTRIBUTE` DISABLE KEYS */;
/*!40000 ALTER TABLE `PRODUCT_ATTRIBUTE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PRODUCT_AVAILABILITY`
--

DROP TABLE IF EXISTS `PRODUCT_AVAILABILITY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8 */;
CREATE TABLE `PRODUCT_AVAILABILITY` (
  `PRODUCT_AVAIL_ID` bigint NOT NULL,
  `DATE_CREATED` datetime DEFAULT NULL,
  `DATE_MODIFIED` datetime DEFAULT NULL,
  `UPDT_ID` varchar(60) DEFAULT NULL,
  `AVAILABLE` bit(1) DEFAULT NULL,
  `OWNER` varchar(255) DEFAULT NULL,
  `DATE_AVAILABLE` date DEFAULT NULL,
  `FREE_SHIPPING` bit(1) DEFAULT NULL,
  `QUANTITY` int DEFAULT NULL,
  `QUANTITY_ORD_MAX` int DEFAULT NULL,
  `QUANTITY_ORD_MIN` int DEFAULT NULL,
  `STATUS` bit(1) DEFAULT NULL,
  `REGION` varchar(255) DEFAULT NULL,
  `REGION_VARIANT` varchar(255) DEFAULT NULL,
  `MERCHANT_ID` int DEFAULT NULL,
  `PRODUCT_ID` bigint NOT NULL,
  PRIMARY KEY (`PRODUCT_AVAIL_ID`),
  KEY `FKmjs1xqdsgji88j5uduj83bntl` (`MERCHANT_ID`),
  KEY `FK5sbh4dx25pmjcqx958hr9ys8h` (`PRODUCT_ID`),
  CONSTRAINT `FK5sbh4dx25pmjcqx958hr9ys8h` FOREIGN KEY (`PRODUCT_ID`) REFERENCES `PRODUCT` (`PRODUCT_ID`),
  CONSTRAINT `FKmjs1xqdsgji88j5uduj83bntl` FOREIGN KEY (`MERCHANT_ID`) REFERENCES `MERCHANT_STORE` (`MERCHANT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PRODUCT_AVAILABILITY`
--

LOCK TABLES `PRODUCT_AVAILABILITY` WRITE;
/*!40000 ALTER TABLE `PRODUCT_AVAILABILITY` DISABLE KEYS */;
INSERT INTO `PRODUCT_AVAILABILITY` VALUES (1,NULL,NULL,NULL,NULL,NULL,'2020-12-21',_binary '\0',100,0,0,_binary '','*',NULL,NULL,1),(2,NULL,NULL,NULL,NULL,NULL,'2020-12-21',_binary '\0',100,0,0,_binary '','*',NULL,NULL,2),(3,NULL,NULL,NULL,NULL,NULL,'2020-12-21',_binary '\0',100,0,0,_binary '','*',NULL,NULL,3),(4,NULL,NULL,NULL,NULL,NULL,'2020-12-21',_binary '\0',100,0,0,_binary '','*',NULL,NULL,4),(5,NULL,NULL,NULL,NULL,NULL,'2020-12-21',_binary '\0',100,0,0,_binary '','*',NULL,NULL,5),(6,NULL,NULL,NULL,NULL,NULL,'2020-12-21',_binary '\0',100,0,0,_binary '','*',NULL,NULL,6);
/*!40000 ALTER TABLE `PRODUCT_AVAILABILITY` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PRODUCT_CATEGORY`
--

DROP TABLE IF EXISTS `PRODUCT_CATEGORY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8 */;
CREATE TABLE `PRODUCT_CATEGORY` (
  `PRODUCT_ID` bigint NOT NULL,
  `CATEGORY_ID` bigint NOT NULL,
  PRIMARY KEY (`PRODUCT_ID`,`CATEGORY_ID`),
  KEY `FK3xw1sbaa29r534jvedimdd7md` (`CATEGORY_ID`),
  CONSTRAINT `FK3xw1sbaa29r534jvedimdd7md` FOREIGN KEY (`CATEGORY_ID`) REFERENCES `CATEGORY` (`CATEGORY_ID`),
  CONSTRAINT `FKa7245ly271mb0crlhxwhhppsq` FOREIGN KEY (`PRODUCT_ID`) REFERENCES `PRODUCT` (`PRODUCT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PRODUCT_CATEGORY`
--

LOCK TABLES `PRODUCT_CATEGORY` WRITE;
/*!40000 ALTER TABLE `PRODUCT_CATEGORY` DISABLE KEYS */;
INSERT INTO `PRODUCT_CATEGORY` VALUES (1,3),(2,3),(4,3),(5,3),(1,4),(2,4),(6,6),(3,7);
/*!40000 ALTER TABLE `PRODUCT_CATEGORY` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PRODUCT_DESCRIPTION`
--

DROP TABLE IF EXISTS `PRODUCT_DESCRIPTION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8 */;
CREATE TABLE `PRODUCT_DESCRIPTION` (
  `DESCRIPTION_ID` bigint NOT NULL,
  `DATE_CREATED` datetime DEFAULT NULL,
  `DATE_MODIFIED` datetime DEFAULT NULL,
  `UPDT_ID` varchar(60) DEFAULT NULL,
  `DESCRIPTION` longtext,
  `NAME` varchar(120) NOT NULL,
  `TITLE` varchar(100) DEFAULT NULL,
  `META_DESCRIPTION` varchar(255) DEFAULT NULL,
  `META_KEYWORDS` varchar(255) DEFAULT NULL,
  `META_TITLE` varchar(255) DEFAULT NULL,
  `DOWNLOAD_LNK` varchar(255) DEFAULT NULL,
  `PRODUCT_HIGHLIGHT` varchar(255) DEFAULT NULL,
  `SEF_URL` varchar(255) DEFAULT NULL,
  `LANGUAGE_ID` int NOT NULL,
  `PRODUCT_ID` bigint NOT NULL,
  PRIMARY KEY (`DESCRIPTION_ID`),
  UNIQUE KEY `UKq4dnkx5b776ayqas2h4rr2d8q` (`PRODUCT_ID`,`LANGUAGE_ID`),
  KEY `PRODUCT_DESCRIPTION_SEF_URL` (`SEF_URL`),
  KEY `FK6esjdaa6vu2t5vjin788a8og6` (`LANGUAGE_ID`),
  CONSTRAINT `FK6esjdaa6vu2t5vjin788a8og6` FOREIGN KEY (`LANGUAGE_ID`) REFERENCES `LANGUAGE` (`LANGUAGE_ID`),
  CONSTRAINT `FKm46yjcu59q79qrokgglwq2ove` FOREIGN KEY (`PRODUCT_ID`) REFERENCES `PRODUCT` (`PRODUCT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PRODUCT_DESCRIPTION`
--

LOCK TABLES `PRODUCT_DESCRIPTION` WRITE;
/*!40000 ALTER TABLE `PRODUCT_DESCRIPTION` DISABLE KEYS */;
INSERT INTO `PRODUCT_DESCRIPTION` VALUES (1,'2020-12-21 05:37:48','2020-12-21 05:37:48',NULL,NULL,'Spring in Action',NULL,NULL,NULL,NULL,NULL,NULL,'Spring-in-Action',1,1),(2,'2020-12-21 05:37:48','2020-12-21 05:37:48',NULL,NULL,'Node Web Development',NULL,NULL,NULL,NULL,NULL,NULL,'Node-Web-Development',1,2),(3,'2020-12-21 05:37:48','2020-12-21 05:37:48',NULL,NULL,'Programming for PAAS',NULL,NULL,NULL,NULL,NULL,NULL,'programming-for-paas',1,3),(4,'2020-12-21 05:37:48','2020-12-21 05:37:48',NULL,NULL,'Android development',NULL,NULL,NULL,NULL,NULL,NULL,'android-application-development',1,4),(5,'2020-12-21 05:37:48','2020-12-21 05:37:48',NULL,NULL,'Android 3.0 Cookbook',NULL,NULL,NULL,NULL,NULL,NULL,'android-3-cookbook',1,5),(6,'2020-12-21 05:37:49','2020-12-21 05:37:49',NULL,NULL,'The Big Switch',NULL,NULL,NULL,NULL,NULL,NULL,'the-big-switch',1,6);
/*!40000 ALTER TABLE `PRODUCT_DESCRIPTION` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PRODUCT_DIGITAL`
--

DROP TABLE IF EXISTS `PRODUCT_DIGITAL`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8 */;
CREATE TABLE `PRODUCT_DIGITAL` (
  `PRODUCT_DIGITAL_ID` bigint NOT NULL,
  `FILE_NAME` varchar(255) NOT NULL,
  `PRODUCT_ID` bigint NOT NULL,
  PRIMARY KEY (`PRODUCT_DIGITAL_ID`),
  UNIQUE KEY `UKjuk1qgkh9v5w7ghvb18krwo8v` (`PRODUCT_ID`,`FILE_NAME`),
  CONSTRAINT `FK47fmb5cg68pws7k26txyl1il6` FOREIGN KEY (`PRODUCT_ID`) REFERENCES `PRODUCT` (`PRODUCT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PRODUCT_DIGITAL`
--

LOCK TABLES `PRODUCT_DIGITAL` WRITE;
/*!40000 ALTER TABLE `PRODUCT_DIGITAL` DISABLE KEYS */;
/*!40000 ALTER TABLE `PRODUCT_DIGITAL` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PRODUCT_IMAGE`
--

DROP TABLE IF EXISTS `PRODUCT_IMAGE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8 */;
CREATE TABLE `PRODUCT_IMAGE` (
  `PRODUCT_IMAGE_ID` bigint NOT NULL,
  `DEFAULT_IMAGE` bit(1) DEFAULT NULL,
  `IMAGE_CROP` bit(1) DEFAULT NULL,
  `IMAGE_TYPE` int DEFAULT NULL,
  `PRODUCT_IMAGE` varchar(255) DEFAULT NULL,
  `PRODUCT_IMAGE_URL` varchar(255) DEFAULT NULL,
  `PRODUCT_ID` bigint NOT NULL,
  PRIMARY KEY (`PRODUCT_IMAGE_ID`),
  KEY `FKgab836d8rxqg8vv55nm02r65i` (`PRODUCT_ID`),
  CONSTRAINT `FKgab836d8rxqg8vv55nm02r65i` FOREIGN KEY (`PRODUCT_ID`) REFERENCES `PRODUCT` (`PRODUCT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PRODUCT_IMAGE`
--

LOCK TABLES `PRODUCT_IMAGE` WRITE;
/*!40000 ALTER TABLE `PRODUCT_IMAGE` DISABLE KEYS */;
INSERT INTO `PRODUCT_IMAGE` VALUES (1,_binary '',_binary '\0',0,'spring.png',NULL,1),(2,_binary '',_binary '\0',0,'node.jpg',NULL,2),(3,_binary '',_binary '\0',0,'paas.JPG',NULL,3),(4,_binary '',_binary '\0',0,'android.jpg',NULL,4),(5,_binary '',_binary '\0',0,'android2.jpg',NULL,5),(6,_binary '',_binary '\0',0,'google.jpg',NULL,6);
/*!40000 ALTER TABLE `PRODUCT_IMAGE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PRODUCT_IMAGE_DESCRIPTION`
--

DROP TABLE IF EXISTS `PRODUCT_IMAGE_DESCRIPTION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8 */;
CREATE TABLE `PRODUCT_IMAGE_DESCRIPTION` (
  `DESCRIPTION_ID` bigint NOT NULL,
  `DATE_CREATED` datetime DEFAULT NULL,
  `DATE_MODIFIED` datetime DEFAULT NULL,
  `UPDT_ID` varchar(60) DEFAULT NULL,
  `DESCRIPTION` longtext,
  `NAME` varchar(120) NOT NULL,
  `TITLE` varchar(100) DEFAULT NULL,
  `ALT_TAG` varchar(100) DEFAULT NULL,
  `LANGUAGE_ID` int NOT NULL,
  `PRODUCT_IMAGE_ID` bigint NOT NULL,
  PRIMARY KEY (`DESCRIPTION_ID`),
  UNIQUE KEY `UKn7yhdj6ccydgf201gibb882cd` (`PRODUCT_IMAGE_ID`,`LANGUAGE_ID`),
  KEY `FKlhdnpki4sf98wev0pcj2bvnih` (`LANGUAGE_ID`),
  CONSTRAINT `FK1dhldo18nj9l2y6qympgucynq` FOREIGN KEY (`PRODUCT_IMAGE_ID`) REFERENCES `PRODUCT_IMAGE` (`PRODUCT_IMAGE_ID`),
  CONSTRAINT `FKlhdnpki4sf98wev0pcj2bvnih` FOREIGN KEY (`LANGUAGE_ID`) REFERENCES `LANGUAGE` (`LANGUAGE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PRODUCT_IMAGE_DESCRIPTION`
--

LOCK TABLES `PRODUCT_IMAGE_DESCRIPTION` WRITE;
/*!40000 ALTER TABLE `PRODUCT_IMAGE_DESCRIPTION` DISABLE KEYS */;
/*!40000 ALTER TABLE `PRODUCT_IMAGE_DESCRIPTION` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PRODUCT_OPTION`
--

DROP TABLE IF EXISTS `PRODUCT_OPTION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8 */;
CREATE TABLE `PRODUCT_OPTION` (
  `PRODUCT_OPTION_ID` bigint NOT NULL,
  `PRODUCT_OPTION_CODE` varchar(255) DEFAULT NULL,
  `PRODUCT_OPTION_SORT_ORD` int DEFAULT NULL,
  `PRODUCT_OPTION_TYPE` varchar(10) DEFAULT NULL,
  `PRODUCT_OPTION_READ` bit(1) DEFAULT NULL,
  `MERCHANT_ID` int NOT NULL,
  PRIMARY KEY (`PRODUCT_OPTION_ID`),
  UNIQUE KEY `UKhfcw5oi9ulljlog1b7ns1r9tu` (`MERCHANT_ID`,`PRODUCT_OPTION_CODE`),
  KEY `PRD_OPTION_CODE_IDX` (`PRODUCT_OPTION_CODE`),
  CONSTRAINT `FKp8cski5t5f5m4et4fw0uilcgu` FOREIGN KEY (`MERCHANT_ID`) REFERENCES `MERCHANT_STORE` (`MERCHANT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PRODUCT_OPTION`
--

LOCK TABLES `PRODUCT_OPTION` WRITE;
/*!40000 ALTER TABLE `PRODUCT_OPTION` DISABLE KEYS */;
/*!40000 ALTER TABLE `PRODUCT_OPTION` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PRODUCT_OPTION_DESC`
--

DROP TABLE IF EXISTS `PRODUCT_OPTION_DESC`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8 */;
CREATE TABLE `PRODUCT_OPTION_DESC` (
  `DESCRIPTION_ID` bigint NOT NULL,
  `DATE_CREATED` datetime DEFAULT NULL,
  `DATE_MODIFIED` datetime DEFAULT NULL,
  `UPDT_ID` varchar(60) DEFAULT NULL,
  `DESCRIPTION` longtext,
  `NAME` varchar(120) NOT NULL,
  `TITLE` varchar(100) DEFAULT NULL,
  `PRODUCT_OPTION_COMMENT` varchar(4000) DEFAULT NULL,
  `LANGUAGE_ID` int NOT NULL,
  `PRODUCT_OPTION_ID` bigint NOT NULL,
  PRIMARY KEY (`DESCRIPTION_ID`),
  UNIQUE KEY `UKmkcm8isyyyqbjd1yyb8mrpkuw` (`PRODUCT_OPTION_ID`,`LANGUAGE_ID`),
  KEY `FK8fiwk5o1gbn2r2u8529yaf9xt` (`LANGUAGE_ID`),
  CONSTRAINT `FK8fiwk5o1gbn2r2u8529yaf9xt` FOREIGN KEY (`LANGUAGE_ID`) REFERENCES `LANGUAGE` (`LANGUAGE_ID`),
  CONSTRAINT `FKgjqmfofile4hwv867irsnvuc0` FOREIGN KEY (`PRODUCT_OPTION_ID`) REFERENCES `PRODUCT_OPTION` (`PRODUCT_OPTION_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PRODUCT_OPTION_DESC`
--

LOCK TABLES `PRODUCT_OPTION_DESC` WRITE;
/*!40000 ALTER TABLE `PRODUCT_OPTION_DESC` DISABLE KEYS */;
/*!40000 ALTER TABLE `PRODUCT_OPTION_DESC` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PRODUCT_OPTION_SET`
--

DROP TABLE IF EXISTS `PRODUCT_OPTION_SET`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8 */;
CREATE TABLE `PRODUCT_OPTION_SET` (
  `PRODUCT_OPTION_SET_ID` bigint NOT NULL,
  `PRODUCT_OPTION_SET_CODE` varchar(255) DEFAULT NULL,
  `PRODUCT_OPTION_SET_DISP` bit(1) DEFAULT NULL,
  `PRODUCT_OPTION_ID` bigint NOT NULL,
  `MERCHANT_ID` int NOT NULL,
  PRIMARY KEY (`PRODUCT_OPTION_SET_ID`),
  UNIQUE KEY `UKk1qq8j685uj17bylgnkra1n5f` (`MERCHANT_ID`,`PRODUCT_OPTION_SET_CODE`),
  KEY `FK4njy17416fn86muojmtbav1d0` (`PRODUCT_OPTION_ID`),
  CONSTRAINT `FK4njy17416fn86muojmtbav1d0` FOREIGN KEY (`PRODUCT_OPTION_ID`) REFERENCES `PRODUCT_OPTION` (`PRODUCT_OPTION_ID`),
  CONSTRAINT `FK8d5vylmhvmckmframdehgwqau` FOREIGN KEY (`MERCHANT_ID`) REFERENCES `MERCHANT_STORE` (`MERCHANT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PRODUCT_OPTION_SET`
--

LOCK TABLES `PRODUCT_OPTION_SET` WRITE;
/*!40000 ALTER TABLE `PRODUCT_OPTION_SET` DISABLE KEYS */;
/*!40000 ALTER TABLE `PRODUCT_OPTION_SET` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PRODUCT_OPTION_VALUE`
--

DROP TABLE IF EXISTS `PRODUCT_OPTION_VALUE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8 */;
CREATE TABLE `PRODUCT_OPTION_VALUE` (
  `PRODUCT_OPTION_VALUE_ID` bigint NOT NULL,
  `PRODUCT_OPTION_VAL_CODE` varchar(255) DEFAULT NULL,
  `PRODUCT_OPT_FOR_DISP` bit(1) DEFAULT NULL,
  `PRODUCT_OPT_VAL_IMAGE` varchar(255) DEFAULT NULL,
  `PRODUCT_OPT_VAL_SORT_ORD` int DEFAULT NULL,
  `MERCHANT_ID` int NOT NULL,
  PRIMARY KEY (`PRODUCT_OPTION_VALUE_ID`),
  UNIQUE KEY `UKixbpi4hxrhljh935c3xfvnvsh` (`MERCHANT_ID`,`PRODUCT_OPTION_VAL_CODE`),
  KEY `PRD_OPTION_VAL_CODE_IDX` (`PRODUCT_OPTION_VAL_CODE`),
  CONSTRAINT `FKnd3nw0mamlk8bkxo8ad5m85pq` FOREIGN KEY (`MERCHANT_ID`) REFERENCES `MERCHANT_STORE` (`MERCHANT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PRODUCT_OPTION_VALUE`
--

LOCK TABLES `PRODUCT_OPTION_VALUE` WRITE;
/*!40000 ALTER TABLE `PRODUCT_OPTION_VALUE` DISABLE KEYS */;
/*!40000 ALTER TABLE `PRODUCT_OPTION_VALUE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PRODUCT_OPTION_VALUE_DESCRIPTION`
--

DROP TABLE IF EXISTS `PRODUCT_OPTION_VALUE_DESCRIPTION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8 */;
CREATE TABLE `PRODUCT_OPTION_VALUE_DESCRIPTION` (
  `DESCRIPTION_ID` bigint NOT NULL,
  `DATE_CREATED` datetime DEFAULT NULL,
  `DATE_MODIFIED` datetime DEFAULT NULL,
  `UPDT_ID` varchar(60) DEFAULT NULL,
  `DESCRIPTION` longtext,
  `NAME` varchar(120) NOT NULL,
  `TITLE` varchar(100) DEFAULT NULL,
  `LANGUAGE_ID` int NOT NULL,
  `PRODUCT_OPTION_VALUE_ID` bigint DEFAULT NULL,
  PRIMARY KEY (`DESCRIPTION_ID`),
  UNIQUE KEY `UKasgc60ot1wy0uho96n0j8429p` (`PRODUCT_OPTION_VALUE_ID`,`LANGUAGE_ID`),
  KEY `FK19mnby7atlt85exlypxdxhacx` (`LANGUAGE_ID`),
  CONSTRAINT `FK19mnby7atlt85exlypxdxhacx` FOREIGN KEY (`LANGUAGE_ID`) REFERENCES `LANGUAGE` (`LANGUAGE_ID`),
  CONSTRAINT `FKqttc6b79yp2s1hyrhg4thag6s` FOREIGN KEY (`PRODUCT_OPTION_VALUE_ID`) REFERENCES `PRODUCT_OPTION_VALUE` (`PRODUCT_OPTION_VALUE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PRODUCT_OPTION_VALUE_DESCRIPTION`
--

LOCK TABLES `PRODUCT_OPTION_VALUE_DESCRIPTION` WRITE;
/*!40000 ALTER TABLE `PRODUCT_OPTION_VALUE_DESCRIPTION` DISABLE KEYS */;
/*!40000 ALTER TABLE `PRODUCT_OPTION_VALUE_DESCRIPTION` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PRODUCT_OPT_SET_OPT_VALUE`
--

DROP TABLE IF EXISTS `PRODUCT_OPT_SET_OPT_VALUE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8 */;
CREATE TABLE `PRODUCT_OPT_SET_OPT_VALUE` (
  `ProductOptionSet_PRODUCT_OPTION_SET_ID` bigint NOT NULL,
  `values_PRODUCT_OPTION_VALUE_ID` bigint NOT NULL,
  KEY `FK9dwatblxwc64a5la3bb7qnwd8` (`values_PRODUCT_OPTION_VALUE_ID`),
  KEY `FK3u6iyag8x8w9tkt7sqcoibjq6` (`ProductOptionSet_PRODUCT_OPTION_SET_ID`),
  CONSTRAINT `FK3u6iyag8x8w9tkt7sqcoibjq6` FOREIGN KEY (`ProductOptionSet_PRODUCT_OPTION_SET_ID`) REFERENCES `PRODUCT_OPTION_SET` (`PRODUCT_OPTION_SET_ID`),
  CONSTRAINT `FK9dwatblxwc64a5la3bb7qnwd8` FOREIGN KEY (`values_PRODUCT_OPTION_VALUE_ID`) REFERENCES `PRODUCT_OPTION_VALUE` (`PRODUCT_OPTION_VALUE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PRODUCT_OPT_SET_OPT_VALUE`
--

LOCK TABLES `PRODUCT_OPT_SET_OPT_VALUE` WRITE;
/*!40000 ALTER TABLE `PRODUCT_OPT_SET_OPT_VALUE` DISABLE KEYS */;
/*!40000 ALTER TABLE `PRODUCT_OPT_SET_OPT_VALUE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PRODUCT_OPT_SET_PRD_TYPE`
--

DROP TABLE IF EXISTS `PRODUCT_OPT_SET_PRD_TYPE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8 */;
CREATE TABLE `PRODUCT_OPT_SET_PRD_TYPE` (
  `ProductOptionSet_PRODUCT_OPTION_SET_ID` bigint NOT NULL,
  `productTypes_PRODUCT_TYPE_ID` bigint NOT NULL,
  PRIMARY KEY (`ProductOptionSet_PRODUCT_OPTION_SET_ID`,`productTypes_PRODUCT_TYPE_ID`),
  KEY `FKiem30u1enm0p25i7t53jganf4` (`productTypes_PRODUCT_TYPE_ID`),
  CONSTRAINT `FK4655h91s0eiinonako9n4h9ha` FOREIGN KEY (`ProductOptionSet_PRODUCT_OPTION_SET_ID`) REFERENCES `PRODUCT_OPTION_SET` (`PRODUCT_OPTION_SET_ID`),
  CONSTRAINT `FKiem30u1enm0p25i7t53jganf4` FOREIGN KEY (`productTypes_PRODUCT_TYPE_ID`) REFERENCES `PRODUCT_TYPE` (`PRODUCT_TYPE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PRODUCT_OPT_SET_PRD_TYPE`
--

LOCK TABLES `PRODUCT_OPT_SET_PRD_TYPE` WRITE;
/*!40000 ALTER TABLE `PRODUCT_OPT_SET_PRD_TYPE` DISABLE KEYS */;
/*!40000 ALTER TABLE `PRODUCT_OPT_SET_PRD_TYPE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PRODUCT_PRICE`
--

DROP TABLE IF EXISTS `PRODUCT_PRICE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8 */;
CREATE TABLE `PRODUCT_PRICE` (
  `PRODUCT_PRICE_ID` bigint NOT NULL,
  `PRODUCT_PRICE_CODE` varchar(255) NOT NULL,
  `DEFAULT_PRICE` bit(1) DEFAULT NULL,
  `PRODUCT_PRICE_AMOUNT` decimal(19,2) NOT NULL,
  `PRODUCT_PRICE_SPECIAL_AMOUNT` decimal(19,2) DEFAULT NULL,
  `PRODUCT_PRICE_SPECIAL_END_DATE` date DEFAULT NULL,
  `PRODUCT_PRICE_SPECIAL_ST_DATE` date DEFAULT NULL,
  `PRODUCT_PRICE_TYPE` varchar(20) DEFAULT NULL,
  `PRODUCT_AVAIL_ID` bigint NOT NULL,
  PRIMARY KEY (`PRODUCT_PRICE_ID`),
  KEY `FK1dic7jnnk1qikgvwcrf4dw12r` (`PRODUCT_AVAIL_ID`),
  CONSTRAINT `FK1dic7jnnk1qikgvwcrf4dw12r` FOREIGN KEY (`PRODUCT_AVAIL_ID`) REFERENCES `PRODUCT_AVAILABILITY` (`PRODUCT_AVAIL_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PRODUCT_PRICE`
--

LOCK TABLES `PRODUCT_PRICE` WRITE;
/*!40000 ALTER TABLE `PRODUCT_PRICE` DISABLE KEYS */;
INSERT INTO `PRODUCT_PRICE` VALUES (1,'base',_binary '',39.99,NULL,NULL,NULL,'ONE_TIME',1),(2,'base',_binary '',29.99,NULL,NULL,NULL,'ONE_TIME',2),(3,'base',_binary '',19.99,NULL,NULL,NULL,'ONE_TIME',3),(4,'base',_binary '',18.99,NULL,NULL,NULL,'ONE_TIME',4),(5,'base',_binary '',18.99,NULL,NULL,NULL,'ONE_TIME',5),(6,'base',_binary '',18.99,NULL,NULL,NULL,'ONE_TIME',6);
/*!40000 ALTER TABLE `PRODUCT_PRICE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PRODUCT_PRICE_DESCRIPTION`
--

DROP TABLE IF EXISTS `PRODUCT_PRICE_DESCRIPTION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8 */;
CREATE TABLE `PRODUCT_PRICE_DESCRIPTION` (
  `DESCRIPTION_ID` bigint NOT NULL,
  `DATE_CREATED` datetime DEFAULT NULL,
  `DATE_MODIFIED` datetime DEFAULT NULL,
  `UPDT_ID` varchar(60) DEFAULT NULL,
  `DESCRIPTION` longtext,
  `NAME` varchar(120) NOT NULL,
  `TITLE` varchar(100) DEFAULT NULL,
  `PRICE_APPENDER` varchar(255) DEFAULT NULL,
  `LANGUAGE_ID` int NOT NULL,
  `PRODUCT_PRICE_ID` bigint NOT NULL,
  PRIMARY KEY (`DESCRIPTION_ID`),
  UNIQUE KEY `UKfrsw8d41sxxogvxxoyd8nwaxu` (`PRODUCT_PRICE_ID`,`LANGUAGE_ID`),
  KEY `FK7bmbrjr8ar5icwdpt8myj6gei` (`LANGUAGE_ID`),
  CONSTRAINT `FK7bmbrjr8ar5icwdpt8myj6gei` FOREIGN KEY (`LANGUAGE_ID`) REFERENCES `LANGUAGE` (`LANGUAGE_ID`),
  CONSTRAINT `FKbwxw861ipjsct606j3dagdjsf` FOREIGN KEY (`PRODUCT_PRICE_ID`) REFERENCES `PRODUCT_PRICE` (`PRODUCT_PRICE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PRODUCT_PRICE_DESCRIPTION`
--

LOCK TABLES `PRODUCT_PRICE_DESCRIPTION` WRITE;
/*!40000 ALTER TABLE `PRODUCT_PRICE_DESCRIPTION` DISABLE KEYS */;
INSERT INTO `PRODUCT_PRICE_DESCRIPTION` VALUES (1,'2020-12-21 05:37:48','2020-12-21 05:37:48',NULL,NULL,'Base price',NULL,NULL,1,1),(2,'2020-12-21 05:37:48','2020-12-21 05:37:48',NULL,NULL,'Base price',NULL,NULL,1,2),(3,'2020-12-21 05:37:48','2020-12-21 05:37:48',NULL,NULL,'Base price',NULL,NULL,1,3),(4,'2020-12-21 05:37:48','2020-12-21 05:37:48',NULL,NULL,'Base price',NULL,NULL,1,4),(5,'2020-12-21 05:37:48','2020-12-21 05:37:48',NULL,NULL,'Base price',NULL,NULL,1,5),(6,'2020-12-21 05:37:49','2020-12-21 05:37:49',NULL,NULL,'Base price',NULL,NULL,1,6);
/*!40000 ALTER TABLE `PRODUCT_PRICE_DESCRIPTION` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PRODUCT_RELATIONSHIP`
--

DROP TABLE IF EXISTS `PRODUCT_RELATIONSHIP`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8 */;
CREATE TABLE `PRODUCT_RELATIONSHIP` (
  `PRODUCT_RELATIONSHIP_ID` bigint NOT NULL,
  `ACTIVE` bit(1) DEFAULT NULL,
  `CODE` varchar(255) DEFAULT NULL,
  `PRODUCT_ID` bigint DEFAULT NULL,
  `RELATED_PRODUCT_ID` bigint DEFAULT NULL,
  `MERCHANT_ID` int NOT NULL,
  PRIMARY KEY (`PRODUCT_RELATIONSHIP_ID`),
  KEY `FKso3cvinykac5wdwu1tjgfotor` (`PRODUCT_ID`),
  KEY `FKfskwtawyt85g9h6761fa69ya5` (`RELATED_PRODUCT_ID`),
  KEY `FKnprvswtbgrm6bjfq3cbdl3qsm` (`MERCHANT_ID`),
  CONSTRAINT `FKfskwtawyt85g9h6761fa69ya5` FOREIGN KEY (`RELATED_PRODUCT_ID`) REFERENCES `PRODUCT` (`PRODUCT_ID`),
  CONSTRAINT `FKnprvswtbgrm6bjfq3cbdl3qsm` FOREIGN KEY (`MERCHANT_ID`) REFERENCES `MERCHANT_STORE` (`MERCHANT_ID`),
  CONSTRAINT `FKso3cvinykac5wdwu1tjgfotor` FOREIGN KEY (`PRODUCT_ID`) REFERENCES `PRODUCT` (`PRODUCT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PRODUCT_RELATIONSHIP`
--

LOCK TABLES `PRODUCT_RELATIONSHIP` WRITE;
/*!40000 ALTER TABLE `PRODUCT_RELATIONSHIP` DISABLE KEYS */;
INSERT INTO `PRODUCT_RELATIONSHIP` VALUES (1,_binary '','FEATURED_ITEM',NULL,1,1),(2,_binary '','FEATURED_ITEM',NULL,6,1),(3,_binary '','FEATURED_ITEM',NULL,5,1),(4,_binary '','FEATURED_ITEM',NULL,2,1);
/*!40000 ALTER TABLE `PRODUCT_RELATIONSHIP` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PRODUCT_REVIEW`
--

DROP TABLE IF EXISTS `PRODUCT_REVIEW`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8 */;
CREATE TABLE `PRODUCT_REVIEW` (
  `PRODUCT_REVIEW_ID` bigint NOT NULL,
  `DATE_CREATED` datetime DEFAULT NULL,
  `DATE_MODIFIED` datetime DEFAULT NULL,
  `UPDT_ID` varchar(60) DEFAULT NULL,
  `REVIEW_DATE` datetime DEFAULT NULL,
  `REVIEWS_RATING` double DEFAULT NULL,
  `REVIEWS_READ` bigint DEFAULT NULL,
  `STATUS` int DEFAULT NULL,
  `CUSTOMERS_ID` bigint DEFAULT NULL,
  `PRODUCT_ID` bigint DEFAULT NULL,
  PRIMARY KEY (`PRODUCT_REVIEW_ID`),
  UNIQUE KEY `UK9ew5idgdbk8a77534hbnhd4yb` (`CUSTOMERS_ID`,`PRODUCT_ID`),
  KEY `FKbfi8de7kxultg1vevq6jc1hn7` (`PRODUCT_ID`),
  CONSTRAINT `FK7tm0jrt0hiugo3ep49t3subou` FOREIGN KEY (`CUSTOMERS_ID`) REFERENCES `CUSTOMER` (`CUSTOMER_ID`),
  CONSTRAINT `FKbfi8de7kxultg1vevq6jc1hn7` FOREIGN KEY (`PRODUCT_ID`) REFERENCES `PRODUCT` (`PRODUCT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PRODUCT_REVIEW`
--

LOCK TABLES `PRODUCT_REVIEW` WRITE;
/*!40000 ALTER TABLE `PRODUCT_REVIEW` DISABLE KEYS */;
/*!40000 ALTER TABLE `PRODUCT_REVIEW` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PRODUCT_REVIEW_DESCRIPTION`
--

DROP TABLE IF EXISTS `PRODUCT_REVIEW_DESCRIPTION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8 */;
CREATE TABLE `PRODUCT_REVIEW_DESCRIPTION` (
  `DESCRIPTION_ID` bigint NOT NULL,
  `DATE_CREATED` datetime DEFAULT NULL,
  `DATE_MODIFIED` datetime DEFAULT NULL,
  `UPDT_ID` varchar(60) DEFAULT NULL,
  `DESCRIPTION` longtext,
  `NAME` varchar(120) NOT NULL,
  `TITLE` varchar(100) DEFAULT NULL,
  `LANGUAGE_ID` int NOT NULL,
  `PRODUCT_REVIEW_ID` bigint DEFAULT NULL,
  PRIMARY KEY (`DESCRIPTION_ID`),
  UNIQUE KEY `UKqno5wjdtcj8pm3ykkkh7t4rxj` (`PRODUCT_REVIEW_ID`,`LANGUAGE_ID`),
  KEY `FK7byc5jsf5bm4lk674ac44e50m` (`LANGUAGE_ID`),
  CONSTRAINT `FK7byc5jsf5bm4lk674ac44e50m` FOREIGN KEY (`LANGUAGE_ID`) REFERENCES `LANGUAGE` (`LANGUAGE_ID`),
  CONSTRAINT `FKmjivhigdcxmytndlpjuhf4o25` FOREIGN KEY (`PRODUCT_REVIEW_ID`) REFERENCES `PRODUCT_REVIEW` (`PRODUCT_REVIEW_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PRODUCT_REVIEW_DESCRIPTION`
--

LOCK TABLES `PRODUCT_REVIEW_DESCRIPTION` WRITE;
/*!40000 ALTER TABLE `PRODUCT_REVIEW_DESCRIPTION` DISABLE KEYS */;
/*!40000 ALTER TABLE `PRODUCT_REVIEW_DESCRIPTION` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PRODUCT_TYPE`
--

DROP TABLE IF EXISTS `PRODUCT_TYPE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8 */;
CREATE TABLE `PRODUCT_TYPE` (
  `PRODUCT_TYPE_ID` bigint NOT NULL,
  `PRD_TYPE_ADD_TO_CART` bit(1) DEFAULT NULL,
  `DATE_CREATED` datetime DEFAULT NULL,
  `DATE_MODIFIED` datetime DEFAULT NULL,
  `UPDT_ID` varchar(60) DEFAULT NULL,
  `PRD_TYPE_CODE` varchar(255) DEFAULT NULL,
  `MERCHANT_ID` int DEFAULT NULL,
  PRIMARY KEY (`PRODUCT_TYPE_ID`),
  KEY `FKswkvtaq4om2di6x8cd4m22ofn` (`MERCHANT_ID`),
  CONSTRAINT `FKswkvtaq4om2di6x8cd4m22ofn` FOREIGN KEY (`MERCHANT_ID`) REFERENCES `MERCHANT_STORE` (`MERCHANT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PRODUCT_TYPE`
--

LOCK TABLES `PRODUCT_TYPE` WRITE;
/*!40000 ALTER TABLE `PRODUCT_TYPE` DISABLE KEYS */;
INSERT INTO `PRODUCT_TYPE` VALUES (1,NULL,'2020-12-21 05:37:36','2020-12-21 05:37:36',NULL,'GENERAL',NULL);
/*!40000 ALTER TABLE `PRODUCT_TYPE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PRODUCT_TYPE_DESCRIPTION`
--

DROP TABLE IF EXISTS `PRODUCT_TYPE_DESCRIPTION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8 */;
CREATE TABLE `PRODUCT_TYPE_DESCRIPTION` (
  `DESCRIPTION_ID` bigint NOT NULL,
  `DATE_CREATED` datetime DEFAULT NULL,
  `DATE_MODIFIED` datetime DEFAULT NULL,
  `UPDT_ID` varchar(60) DEFAULT NULL,
  `DESCRIPTION` longtext,
  `NAME` varchar(120) NOT NULL,
  `TITLE` varchar(100) DEFAULT NULL,
  `LANGUAGE_ID` int NOT NULL,
  `PRODUCT_TYPE_ID` bigint NOT NULL,
  PRIMARY KEY (`DESCRIPTION_ID`),
  UNIQUE KEY `UKbnra4lwqjkju4yh04824sw6be` (`PRODUCT_TYPE_ID`,`LANGUAGE_ID`),
  KEY `FK81q74whco5y9fd51aa330hlc0` (`LANGUAGE_ID`),
  CONSTRAINT `FK81q74whco5y9fd51aa330hlc0` FOREIGN KEY (`LANGUAGE_ID`) REFERENCES `LANGUAGE` (`LANGUAGE_ID`),
  CONSTRAINT `FKpwc89ulk7c9asbp2nfy2t4x2j` FOREIGN KEY (`PRODUCT_TYPE_ID`) REFERENCES `PRODUCT_TYPE` (`PRODUCT_TYPE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PRODUCT_TYPE_DESCRIPTION`
--

LOCK TABLES `PRODUCT_TYPE_DESCRIPTION` WRITE;
/*!40000 ALTER TABLE `PRODUCT_TYPE_DESCRIPTION` DISABLE KEYS */;
/*!40000 ALTER TABLE `PRODUCT_TYPE_DESCRIPTION` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PRODUCT_VARIANT`
--

DROP TABLE IF EXISTS `PRODUCT_VARIANT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8 */;
CREATE TABLE `PRODUCT_VARIANT` (
  `PRODUCT_VARIANT_ID` bigint NOT NULL,
  `DATE_CREATED` datetime DEFAULT NULL,
  `DATE_MODIFIED` datetime DEFAULT NULL,
  `UPDT_ID` varchar(60) DEFAULT NULL,
  `PRODUCT_AQUANTITY` int DEFAULT NULL,
  `PRODUCT_ATTRIBUTE_ID` bigint NOT NULL,
  `PRODUCT_AVAIL_ID` bigint NOT NULL,
  PRIMARY KEY (`PRODUCT_VARIANT_ID`),
  KEY `FKb1p1mgaa76xdqmx029cabgc1s` (`PRODUCT_ATTRIBUTE_ID`),
  KEY `FKnaa1t3g2d6lt3f13yy0gg9t4o` (`PRODUCT_AVAIL_ID`),
  CONSTRAINT `FKb1p1mgaa76xdqmx029cabgc1s` FOREIGN KEY (`PRODUCT_ATTRIBUTE_ID`) REFERENCES `PRODUCT_ATTRIBUTE` (`PRODUCT_ATTRIBUTE_ID`),
  CONSTRAINT `FKnaa1t3g2d6lt3f13yy0gg9t4o` FOREIGN KEY (`PRODUCT_AVAIL_ID`) REFERENCES `PRODUCT_AVAILABILITY` (`PRODUCT_AVAIL_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PRODUCT_VARIANT`
--

LOCK TABLES `PRODUCT_VARIANT` WRITE;
/*!40000 ALTER TABLE `PRODUCT_VARIANT` DISABLE KEYS */;
/*!40000 ALTER TABLE `PRODUCT_VARIANT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SHIPING_ORIGIN`
--

DROP TABLE IF EXISTS `SHIPING_ORIGIN`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8 */;
CREATE TABLE `SHIPING_ORIGIN` (
  `SHIP_ORIGIN_ID` bigint NOT NULL,
  `ACTIVE` bit(1) DEFAULT NULL,
  `STREET_ADDRESS` varchar(256) DEFAULT NULL,
  `CITY` varchar(100) DEFAULT NULL,
  `POSTCODE` varchar(20) DEFAULT NULL,
  `STATE` varchar(100) DEFAULT NULL,
  `COUNTRY_ID` int DEFAULT NULL,
  `MERCHANT_ID` int NOT NULL,
  `ZONE_ID` bigint DEFAULT NULL,
  PRIMARY KEY (`SHIP_ORIGIN_ID`),
  KEY `FKpqig59usqvs9h0dw4lm8rv7yy` (`COUNTRY_ID`),
  KEY `FKp0dbwsv3sdsp57ex7j5k9b0oq` (`MERCHANT_ID`),
  KEY `FK6k73f1n18kr7mqp708aiwq047` (`ZONE_ID`),
  CONSTRAINT `FK6k73f1n18kr7mqp708aiwq047` FOREIGN KEY (`ZONE_ID`) REFERENCES `ZONE` (`ZONE_ID`),
  CONSTRAINT `FKp0dbwsv3sdsp57ex7j5k9b0oq` FOREIGN KEY (`MERCHANT_ID`) REFERENCES `MERCHANT_STORE` (`MERCHANT_ID`),
  CONSTRAINT `FKpqig59usqvs9h0dw4lm8rv7yy` FOREIGN KEY (`COUNTRY_ID`) REFERENCES `COUNTRY` (`COUNTRY_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SHIPING_ORIGIN`
--

LOCK TABLES `SHIPING_ORIGIN` WRITE;
/*!40000 ALTER TABLE `SHIPING_ORIGIN` DISABLE KEYS */;
/*!40000 ALTER TABLE `SHIPING_ORIGIN` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SHIPPING_QUOTE`
--

DROP TABLE IF EXISTS `SHIPPING_QUOTE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8 */;
CREATE TABLE `SHIPPING_QUOTE` (
  `SHIPPING_QUOTE_ID` bigint NOT NULL,
  `CART_ID` bigint DEFAULT NULL,
  `CUSTOMER_ID` bigint DEFAULT NULL,
  `DELIVERY_STREET_ADDRESS` varchar(256) DEFAULT NULL,
  `DELIVERY_CITY` varchar(100) DEFAULT NULL,
  `DELIVERY_COMPANY` varchar(100) DEFAULT NULL,
  `DELIVERY_FIRST_NAME` varchar(64) DEFAULT NULL,
  `DELIVERY_LAST_NAME` varchar(64) DEFAULT NULL,
  `DELIVERY_POSTCODE` varchar(20) DEFAULT NULL,
  `DELIVERY_STATE` varchar(100) DEFAULT NULL,
  `DELIVERY_TELEPHONE` varchar(32) DEFAULT NULL,
  `SHIPPING_NUMBER_DAYS` int DEFAULT NULL,
  `FREE_SHIPPING` bit(1) DEFAULT NULL,
  `QUOTE_HANDLING` decimal(19,2) DEFAULT NULL,
  `IP_ADDRESS` varchar(255) DEFAULT NULL,
  `MODULE` varchar(255) NOT NULL,
  `OPTION_CODE` varchar(255) DEFAULT NULL,
  `OPTION_DELIVERY_DATE` datetime DEFAULT NULL,
  `OPTION_NAME` varchar(255) DEFAULT NULL,
  `OPTION_SHIPPING_DATE` datetime DEFAULT NULL,
  `ORDER_ID` bigint DEFAULT NULL,
  `QUOTE_PRICE` decimal(19,2) DEFAULT NULL,
  `QUOTE_DATE` datetime DEFAULT NULL,
  `DELIVERY_COUNTRY_ID` int DEFAULT NULL,
  `DELIVERY_ZONE_ID` bigint DEFAULT NULL,
  PRIMARY KEY (`SHIPPING_QUOTE_ID`),
  KEY `FK9vb7tbjl8ivygdiqw883fewx7` (`DELIVERY_COUNTRY_ID`),
  KEY `FKiioesp0vl6x4om1jeajj4uy1t` (`DELIVERY_ZONE_ID`),
  CONSTRAINT `FK9vb7tbjl8ivygdiqw883fewx7` FOREIGN KEY (`DELIVERY_COUNTRY_ID`) REFERENCES `COUNTRY` (`COUNTRY_ID`),
  CONSTRAINT `FKiioesp0vl6x4om1jeajj4uy1t` FOREIGN KEY (`DELIVERY_ZONE_ID`) REFERENCES `ZONE` (`ZONE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SHIPPING_QUOTE`
--

LOCK TABLES `SHIPPING_QUOTE` WRITE;
/*!40000 ALTER TABLE `SHIPPING_QUOTE` DISABLE KEYS */;
/*!40000 ALTER TABLE `SHIPPING_QUOTE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SHOPPING_CART`
--

DROP TABLE IF EXISTS `SHOPPING_CART`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8 */;
CREATE TABLE `SHOPPING_CART` (
  `SHP_CART_ID` bigint NOT NULL,
  `DATE_CREATED` datetime DEFAULT NULL,
  `DATE_MODIFIED` datetime DEFAULT NULL,
  `UPDT_ID` varchar(60) DEFAULT NULL,
  `CUSTOMER_ID` bigint DEFAULT NULL,
  `IP_ADDRESS` varchar(255) DEFAULT NULL,
  `ORDER_ID` bigint DEFAULT NULL,
  `PROMO_ADDED` datetime DEFAULT NULL,
  `PROMO_CODE` varchar(255) DEFAULT NULL,
  `SHP_CART_CODE` varchar(255) NOT NULL,
  `MERCHANT_ID` int NOT NULL,
  PRIMARY KEY (`SHP_CART_ID`),
  UNIQUE KEY `UK_8ld8p40fwrjobi7t3n95pna35` (`SHP_CART_CODE`),
  KEY `SHP_CART_CODE_IDX` (`SHP_CART_CODE`),
  KEY `SHP_CART_CUSTOMER_IDX` (`CUSTOMER_ID`),
  KEY `FKqvghr5rmjefe3lw9mcolk30a0` (`MERCHANT_ID`),
  CONSTRAINT `FKqvghr5rmjefe3lw9mcolk30a0` FOREIGN KEY (`MERCHANT_ID`) REFERENCES `MERCHANT_STORE` (`MERCHANT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SHOPPING_CART`
--

LOCK TABLES `SHOPPING_CART` WRITE;
/*!40000 ALTER TABLE `SHOPPING_CART` DISABLE KEYS */;
/*!40000 ALTER TABLE `SHOPPING_CART` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SHOPPING_CART_ATTR_ITEM`
--

DROP TABLE IF EXISTS `SHOPPING_CART_ATTR_ITEM`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8 */;
CREATE TABLE `SHOPPING_CART_ATTR_ITEM` (
  `SHP_CART_ATTR_ITEM_ID` bigint NOT NULL,
  `DATE_CREATED` datetime DEFAULT NULL,
  `DATE_MODIFIED` datetime DEFAULT NULL,
  `UPDT_ID` varchar(60) DEFAULT NULL,
  `PRODUCT_ATTR_ID` bigint NOT NULL,
  `SHP_CART_ITEM_ID` bigint NOT NULL,
  PRIMARY KEY (`SHP_CART_ATTR_ITEM_ID`),
  KEY `FKp42tpa623hyo9ww69v0ohb3er` (`SHP_CART_ITEM_ID`),
  CONSTRAINT `FKp42tpa623hyo9ww69v0ohb3er` FOREIGN KEY (`SHP_CART_ITEM_ID`) REFERENCES `SHOPPING_CART_ITEM` (`SHP_CART_ITEM_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SHOPPING_CART_ATTR_ITEM`
--

LOCK TABLES `SHOPPING_CART_ATTR_ITEM` WRITE;
/*!40000 ALTER TABLE `SHOPPING_CART_ATTR_ITEM` DISABLE KEYS */;
/*!40000 ALTER TABLE `SHOPPING_CART_ATTR_ITEM` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SHOPPING_CART_ITEM`
--

DROP TABLE IF EXISTS `SHOPPING_CART_ITEM`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8 */;
CREATE TABLE `SHOPPING_CART_ITEM` (
  `SHP_CART_ITEM_ID` bigint NOT NULL,
  `DATE_CREATED` datetime DEFAULT NULL,
  `DATE_MODIFIED` datetime DEFAULT NULL,
  `UPDT_ID` varchar(60) DEFAULT NULL,
  `PRODUCT_ID` bigint NOT NULL,
  `QUANTITY` int DEFAULT NULL,
  `SHP_CART_ID` bigint NOT NULL,
  PRIMARY KEY (`SHP_CART_ITEM_ID`),
  KEY `FK2gbimdwe9uysd5xadnfl0xq83` (`SHP_CART_ID`),
  CONSTRAINT `FK2gbimdwe9uysd5xadnfl0xq83` FOREIGN KEY (`SHP_CART_ID`) REFERENCES `SHOPPING_CART` (`SHP_CART_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SHOPPING_CART_ITEM`
--

LOCK TABLES `SHOPPING_CART_ITEM` WRITE;
/*!40000 ALTER TABLE `SHOPPING_CART_ITEM` DISABLE KEYS */;
/*!40000 ALTER TABLE `SHOPPING_CART_ITEM` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SM_GROUP`
--

DROP TABLE IF EXISTS `SM_GROUP`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8 */;
CREATE TABLE `SM_GROUP` (
  `GROUP_ID` int NOT NULL,
  `DATE_CREATED` datetime DEFAULT NULL,
  `DATE_MODIFIED` datetime DEFAULT NULL,
  `UPDT_ID` varchar(60) DEFAULT NULL,
  `GROUP_NAME` varchar(255) DEFAULT NULL,
  `GROUP_TYPE` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`GROUP_ID`),
  UNIQUE KEY `UK_t83rjsoml3o785oj37lpqpyko` (`GROUP_NAME`),
  KEY `SM_GROUP_GROUP_TYPE` (`GROUP_TYPE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SM_GROUP`
--

LOCK TABLES `SM_GROUP` WRITE;
/*!40000 ALTER TABLE `SM_GROUP` DISABLE KEYS */;
INSERT INTO `SM_GROUP` VALUES (1,'2020-12-21 05:37:26','2020-12-21 05:37:26',NULL,'SUPERADMIN','ADMIN'),(2,'2020-12-21 05:37:26','2020-12-21 05:37:26',NULL,'ADMIN','ADMIN'),(3,'2020-12-21 05:37:26','2020-12-21 05:37:26',NULL,'ADMIN_RETAILER','ADMIN'),(4,'2020-12-21 05:37:26','2020-12-21 05:37:26',NULL,'ADMIN_STORE','ADMIN'),(5,'2020-12-21 05:37:26','2020-12-21 05:37:26',NULL,'ADMIN_CATALOGUE','ADMIN'),(6,'2020-12-21 05:37:26','2020-12-21 05:37:26',NULL,'ADMIN_ORDER','ADMIN'),(7,'2020-12-21 05:37:26','2020-12-21 05:37:26',NULL,'ADMIN_CONTENT','ADMIN'),(8,'2020-12-21 05:37:26','2020-12-21 05:37:26',NULL,'CUSTOMER','CUSTOMER');
/*!40000 ALTER TABLE `SM_GROUP` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SM_SEQUENCER`
--

DROP TABLE IF EXISTS `SM_SEQUENCER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8 */;
CREATE TABLE `SM_SEQUENCER` (
  `SEQ_NAME` varchar(255) NOT NULL,
  `SEQ_COUNT` bigint DEFAULT NULL,
  PRIMARY KEY (`SEQ_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SM_SEQUENCER`
--

LOCK TABLES `SM_SEQUENCER` WRITE;
/*!40000 ALTER TABLE `SM_SEQUENCER` DISABLE KEYS */;
INSERT INTO `SM_SEQUENCER` VALUES ('category_description_seq',15),('CATEGORY_SEQ_NEXT_VAL',1),('country_description_seq',286),('COUNTRY_SEQ_NEXT_VAL',2),('CURRENCY_SEQ_NEXT_VAL',4),('CUSTOMER_SEQ_NEXT_VAL',1),('GROUP_SEQ_NEXT_VAL',1),('LANG_SEQ_NEXT_VAL',1),('MANUFACT_SEQ_NEXT_VAL',1),('manufacturer_description_seq',7),('MERCH_CONF_SEQ_NEXT_VAL',1),('MOD_CONF_SEQ_NEXT_VAL',1),('OPTIN_SEQ_NEXT_VAL',1),('ORDER_ID_SEQ_NEXT_VAL',1),('ORDER_PRD_PRICE_ID_NEXT_VAL',1),('ORDER_PRODUCT_DL_ID_NEXT_VALUE',1),('ORDER_PRODUCT_ID_NEXT_VALUE',1),('ORDER_TOTAL_ID_NEXT_VALUE',1),('PERMISSION_SEQ_NEXT_VAL',1),('PRD_TYPE_SEQ_NEXT_VAL',1),('PRODUCT_AVAIL_SEQ_NEXT_VAL',1),('product_description_seq',7),('PRODUCT_IMG_SEQ_NEXT_VAL',1),('product_price_description_seq',7),('PRODUCT_PRICE_SEQ_NEXT_VAL',1),('PRODUCT_RELATION_SEQ_NEXT_VAL',1),('PRODUCT_SEQ_NEXT_VAL',1),('STATUS_HIST_ID_NEXT_VALUE',1),('STORE_SEQ_NEXT_VAL',1),('SYST_CONF_SEQ_NEXT_VAL',1),('TX_CLASS_SEQ_NEXT_VAL',1),('USER_SEQ_NEXT_VAL',1),('zone_description_seq',652),('ZONE_SEQ_NEXT_VAL',5);
/*!40000 ALTER TABLE `SM_SEQUENCER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SM_TRANSACTION`
--

DROP TABLE IF EXISTS `SM_TRANSACTION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8 */;
CREATE TABLE `SM_TRANSACTION` (
  `TRANSACTION_ID` bigint NOT NULL,
  `AMOUNT` decimal(19,2) DEFAULT NULL,
  `DATE_CREATED` datetime DEFAULT NULL,
  `DATE_MODIFIED` datetime DEFAULT NULL,
  `UPDT_ID` varchar(60) DEFAULT NULL,
  `DETAILS` longtext,
  `PAYMENT_TYPE` varchar(255) DEFAULT NULL,
  `TRANSACTION_DATE` datetime DEFAULT NULL,
  `TRANSACTION_TYPE` varchar(255) DEFAULT NULL,
  `ORDER_ID` bigint DEFAULT NULL,
  PRIMARY KEY (`TRANSACTION_ID`),
  KEY `FK7j0s1gqh2tue1fyh5nyj5kwkp` (`ORDER_ID`),
  CONSTRAINT `FK7j0s1gqh2tue1fyh5nyj5kwkp` FOREIGN KEY (`ORDER_ID`) REFERENCES `ORDERS` (`ORDER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SM_TRANSACTION`
--

LOCK TABLES `SM_TRANSACTION` WRITE;
/*!40000 ALTER TABLE `SM_TRANSACTION` DISABLE KEYS */;
/*!40000 ALTER TABLE `SM_TRANSACTION` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SYSTEM_CONFIGURATION`
--

DROP TABLE IF EXISTS `SYSTEM_CONFIGURATION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8 */;
CREATE TABLE `SYSTEM_CONFIGURATION` (
  `SYSTEM_CONFIG_ID` bigint NOT NULL,
  `DATE_CREATED` datetime DEFAULT NULL,
  `DATE_MODIFIED` datetime DEFAULT NULL,
  `UPDT_ID` varchar(60) DEFAULT NULL,
  `CONFIG_KEY` varchar(255) DEFAULT NULL,
  `VALUE` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`SYSTEM_CONFIG_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SYSTEM_CONFIGURATION`
--

LOCK TABLES `SYSTEM_CONFIGURATION` WRITE;
/*!40000 ALTER TABLE `SYSTEM_CONFIGURATION` DISABLE KEYS */;
INSERT INTO `SYSTEM_CONFIGURATION` VALUES (1,'2020-12-21 05:37:49','2020-12-21 05:37:49','SYSTEM','TEST_DATA_LOADED','true');
/*!40000 ALTER TABLE `SYSTEM_CONFIGURATION` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SYSTEM_NOTIFICATION`
--

DROP TABLE IF EXISTS `SYSTEM_NOTIFICATION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8 */;
CREATE TABLE `SYSTEM_NOTIFICATION` (
  `SYSTEM_NOTIF_ID` bigint NOT NULL,
  `DATE_CREATED` datetime DEFAULT NULL,
  `DATE_MODIFIED` datetime DEFAULT NULL,
  `UPDT_ID` varchar(60) DEFAULT NULL,
  `END_DATE` date DEFAULT NULL,
  `CONFIG_KEY` varchar(255) DEFAULT NULL,
  `START_DATE` date DEFAULT NULL,
  `VALUE` varchar(255) DEFAULT NULL,
  `MERCHANT_ID` int DEFAULT NULL,
  `USER_ID` bigint DEFAULT NULL,
  PRIMARY KEY (`SYSTEM_NOTIF_ID`),
  UNIQUE KEY `UKnpdnlc390vgr2mhepib1mtrmr` (`MERCHANT_ID`,`CONFIG_KEY`),
  KEY `FK3dykr9pm9ln1uektuw18blb6m` (`USER_ID`),
  CONSTRAINT `FK3dykr9pm9ln1uektuw18blb6m` FOREIGN KEY (`USER_ID`) REFERENCES `USERS` (`USER_ID`),
  CONSTRAINT `FKs6qk7l06e0s6m9n04momedgt7` FOREIGN KEY (`MERCHANT_ID`) REFERENCES `MERCHANT_STORE` (`MERCHANT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SYSTEM_NOTIFICATION`
--

LOCK TABLES `SYSTEM_NOTIFICATION` WRITE;
/*!40000 ALTER TABLE `SYSTEM_NOTIFICATION` DISABLE KEYS */;
/*!40000 ALTER TABLE `SYSTEM_NOTIFICATION` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TAX_CLASS`
--

DROP TABLE IF EXISTS `TAX_CLASS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8 */;
CREATE TABLE `TAX_CLASS` (
  `TAX_CLASS_ID` bigint NOT NULL,
  `TAX_CLASS_CODE` varchar(10) NOT NULL,
  `TAX_CLASS_TITLE` varchar(32) NOT NULL,
  `MERCHANT_ID` int DEFAULT NULL,
  PRIMARY KEY (`TAX_CLASS_ID`),
  UNIQUE KEY `UKa4q5q57a8oeh2ojeo8dhr935k` (`MERCHANT_ID`,`TAX_CLASS_CODE`),
  KEY `TAX_CLASS_CODE_IDX` (`TAX_CLASS_CODE`),
  CONSTRAINT `FK82i8puujghcv7fc82qwsgjg8w` FOREIGN KEY (`MERCHANT_ID`) REFERENCES `MERCHANT_STORE` (`MERCHANT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TAX_CLASS`
--

LOCK TABLES `TAX_CLASS` WRITE;
/*!40000 ALTER TABLE `TAX_CLASS` DISABLE KEYS */;
INSERT INTO `TAX_CLASS` VALUES (1,'DEFAULT','DEFAULT',1);
/*!40000 ALTER TABLE `TAX_CLASS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TAX_RATE`
--

DROP TABLE IF EXISTS `TAX_RATE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8 */;
CREATE TABLE `TAX_RATE` (
  `TAX_RATE_ID` bigint NOT NULL,
  `DATE_CREATED` datetime DEFAULT NULL,
  `DATE_MODIFIED` datetime DEFAULT NULL,
  `UPDT_ID` varchar(60) DEFAULT NULL,
  `TAX_CODE` varchar(255) DEFAULT NULL,
  `PIGGYBACK` bit(1) DEFAULT NULL,
  `STORE_STATE_PROV` varchar(100) DEFAULT NULL,
  `TAX_PRIORITY` int DEFAULT NULL,
  `TAX_RATE` decimal(7,4) NOT NULL,
  `COUNTRY_ID` int NOT NULL,
  `MERCHANT_ID` int NOT NULL,
  `PARENT_ID` bigint DEFAULT NULL,
  `TAX_CLASS_ID` bigint NOT NULL,
  `ZONE_ID` bigint DEFAULT NULL,
  PRIMARY KEY (`TAX_RATE_ID`),
  UNIQUE KEY `UK8gh6l9n0xq03b91sglp62oelu` (`TAX_CODE`,`MERCHANT_ID`),
  KEY `FK6wm34jcwoembe1qsmle2wtwnv` (`COUNTRY_ID`),
  KEY `FKfwp6yka2qps9jna473e6c6yc1` (`MERCHANT_ID`),
  KEY `FKt8isen27i3ioa0tw3bl8qlvdh` (`PARENT_ID`),
  KEY `FK7bpa9pbl1gnj5y3xbgs3wc0eg` (`TAX_CLASS_ID`),
  KEY `FKm9snpf6o1nb4j1t80nas8d1ix` (`ZONE_ID`),
  CONSTRAINT `FK6wm34jcwoembe1qsmle2wtwnv` FOREIGN KEY (`COUNTRY_ID`) REFERENCES `COUNTRY` (`COUNTRY_ID`),
  CONSTRAINT `FK7bpa9pbl1gnj5y3xbgs3wc0eg` FOREIGN KEY (`TAX_CLASS_ID`) REFERENCES `TAX_CLASS` (`TAX_CLASS_ID`),
  CONSTRAINT `FKfwp6yka2qps9jna473e6c6yc1` FOREIGN KEY (`MERCHANT_ID`) REFERENCES `MERCHANT_STORE` (`MERCHANT_ID`),
  CONSTRAINT `FKm9snpf6o1nb4j1t80nas8d1ix` FOREIGN KEY (`ZONE_ID`) REFERENCES `ZONE` (`ZONE_ID`),
  CONSTRAINT `FKt8isen27i3ioa0tw3bl8qlvdh` FOREIGN KEY (`PARENT_ID`) REFERENCES `TAX_RATE` (`TAX_RATE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TAX_RATE`
--

LOCK TABLES `TAX_RATE` WRITE;
/*!40000 ALTER TABLE `TAX_RATE` DISABLE KEYS */;
/*!40000 ALTER TABLE `TAX_RATE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TAX_RATE_DESCRIPTION`
--

DROP TABLE IF EXISTS `TAX_RATE_DESCRIPTION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8 */;
CREATE TABLE `TAX_RATE_DESCRIPTION` (
  `DESCRIPTION_ID` bigint NOT NULL,
  `DATE_CREATED` datetime DEFAULT NULL,
  `DATE_MODIFIED` datetime DEFAULT NULL,
  `UPDT_ID` varchar(60) DEFAULT NULL,
  `DESCRIPTION` longtext,
  `NAME` varchar(120) NOT NULL,
  `TITLE` varchar(100) DEFAULT NULL,
  `LANGUAGE_ID` int NOT NULL,
  `TAX_RATE_ID` bigint DEFAULT NULL,
  PRIMARY KEY (`DESCRIPTION_ID`),
  UNIQUE KEY `UKt3xg8pl88yacdxg49nb46effg` (`TAX_RATE_ID`,`LANGUAGE_ID`),
  KEY `FKsicb2ydx42o04pvlnxw2mlx0w` (`LANGUAGE_ID`),
  CONSTRAINT `FK65c2lqslk5kx25dpkem2r0vxq` FOREIGN KEY (`TAX_RATE_ID`) REFERENCES `TAX_RATE` (`TAX_RATE_ID`),
  CONSTRAINT `FKsicb2ydx42o04pvlnxw2mlx0w` FOREIGN KEY (`LANGUAGE_ID`) REFERENCES `LANGUAGE` (`LANGUAGE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TAX_RATE_DESCRIPTION`
--

LOCK TABLES `TAX_RATE_DESCRIPTION` WRITE;
/*!40000 ALTER TABLE `TAX_RATE_DESCRIPTION` DISABLE KEYS */;
/*!40000 ALTER TABLE `TAX_RATE_DESCRIPTION` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USERS`
--

DROP TABLE IF EXISTS `USERS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8 */;
CREATE TABLE `USERS` (
  `USER_ID` bigint NOT NULL,
  `ACTIVE` bit(1) DEFAULT NULL,
  `ADMIN_EMAIL` varchar(255) DEFAULT NULL,
  `ADMIN_NAME` varchar(100) DEFAULT NULL,
  `ADMIN_PASSWORD` varchar(60) DEFAULT NULL,
  `ADMIN_A1` varchar(255) DEFAULT NULL,
  `ADMIN_A2` varchar(255) DEFAULT NULL,
  `ADMIN_A3` varchar(255) DEFAULT NULL,
  `DATE_CREATED` datetime DEFAULT NULL,
  `DATE_MODIFIED` datetime DEFAULT NULL,
  `UPDT_ID` varchar(60) DEFAULT NULL,
  `ADMIN_FIRST_NAME` varchar(255) DEFAULT NULL,
  `LAST_ACCESS` datetime DEFAULT NULL,
  `ADMIN_LAST_NAME` varchar(255) DEFAULT NULL,
  `LOGIN_ACCESS` datetime DEFAULT NULL,
  `ADMIN_Q1` varchar(255) DEFAULT NULL,
  `ADMIN_Q2` varchar(255) DEFAULT NULL,
  `ADMIN_Q3` varchar(255) DEFAULT NULL,
  `LANGUAGE_ID` int DEFAULT NULL,
  `MERCHANT_ID` int NOT NULL,
  PRIMARY KEY (`USER_ID`),
  UNIQUE KEY `UK7cwrowcnjlfxpxpdd1op9ymab` (`MERCHANT_ID`,`ADMIN_NAME`),
  KEY `FK4yb3ho4yxvcjniqg09opbm7ja` (`LANGUAGE_ID`),
  CONSTRAINT `FK4yb3ho4yxvcjniqg09opbm7ja` FOREIGN KEY (`LANGUAGE_ID`) REFERENCES `LANGUAGE` (`LANGUAGE_ID`),
  CONSTRAINT `FKtpio656e5t0cja7kx7p79rkh6` FOREIGN KEY (`MERCHANT_ID`) REFERENCES `MERCHANT_STORE` (`MERCHANT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USERS`
--

LOCK TABLES `USERS` WRITE;
/*!40000 ALTER TABLE `USERS` DISABLE KEYS */;
INSERT INTO `USERS` VALUES (1,_binary '','admin@shopizer.com','admin@shopizer.com','$2a$10$oFCrI6dUrdU1T17lPz9t3uUpNq/eDq4JaG6tiGCkZBQCHvBC8iAoO',NULL,NULL,NULL,'2020-12-21 05:37:36','2020-12-21 05:37:36',NULL,'Administrator',NULL,'User',NULL,NULL,NULL,NULL,NULL,1);
/*!40000 ALTER TABLE `USERS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_GROUP`
--

DROP TABLE IF EXISTS `USER_GROUP`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8 */;
CREATE TABLE `USER_GROUP` (
  `USER_ID` bigint NOT NULL,
  `GROUP_ID` int NOT NULL,
  KEY `FK75kainrhn4kh8j3sw2xbe7v61` (`GROUP_ID`),
  KEY `FK9op4wv63nonsby8y9myjhtho` (`USER_ID`),
  CONSTRAINT `FK75kainrhn4kh8j3sw2xbe7v61` FOREIGN KEY (`GROUP_ID`) REFERENCES `SM_GROUP` (`GROUP_ID`),
  CONSTRAINT `FK9op4wv63nonsby8y9myjhtho` FOREIGN KEY (`USER_ID`) REFERENCES `USERS` (`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_GROUP`
--

LOCK TABLES `USER_GROUP` WRITE;
/*!40000 ALTER TABLE `USER_GROUP` DISABLE KEYS */;
INSERT INTO `USER_GROUP` VALUES (1,1),(1,2);
/*!40000 ALTER TABLE `USER_GROUP` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `UserConnection`
--

DROP TABLE IF EXISTS `UserConnection`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8 */;
CREATE TABLE `UserConnection` (
  `providerId` varchar(255) NOT NULL,
  `providerUserId` varchar(255) NOT NULL,
  `userId` varchar(255) NOT NULL,
  `accessToken` varchar(255) DEFAULT NULL,
  `displayName` varchar(255) DEFAULT NULL,
  `expireTime` bigint DEFAULT NULL,
  `imageUrl` varchar(255) DEFAULT NULL,
  `profileUrl` varchar(255) DEFAULT NULL,
  `refreshToken` varchar(255) DEFAULT NULL,
  `secret` varchar(255) DEFAULT NULL,
  `userRank` int NOT NULL,
  PRIMARY KEY (`providerId`,`providerUserId`,`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `UserConnection`
--

LOCK TABLES `UserConnection` WRITE;
/*!40000 ALTER TABLE `UserConnection` DISABLE KEYS */;
/*!40000 ALTER TABLE `UserConnection` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ZONE`
--

DROP TABLE IF EXISTS `ZONE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8 */;
CREATE TABLE `ZONE` (
  `ZONE_ID` bigint NOT NULL,
  `ZONE_CODE` varchar(255) NOT NULL,
  `COUNTRY_ID` int NOT NULL,
  PRIMARY KEY (`ZONE_ID`),
  UNIQUE KEY `UK_4tq3p5w8k4h4easyf5t3n1jdr` (`ZONE_CODE`),
  KEY `FKhn2c1w3e1twhjg7tiwv7vuk67` (`COUNTRY_ID`),
  CONSTRAINT `FKhn2c1w3e1twhjg7tiwv7vuk67` FOREIGN KEY (`COUNTRY_ID`) REFERENCES `COUNTRY` (`COUNTRY_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ZONE`
--

LOCK TABLES `ZONE` WRITE;
/*!40000 ALTER TABLE `ZONE` DISABLE KEYS */;
INSERT INTO `ZONE` VALUES (9,'QC',13);
-- INSERT INTO `ZONE` VALUES (1,'Guipuzcoa',79),(2,'HI',91),(3,'PR',91),(4,'Zamora',79),(5,'Vizcaya',79),(6,'OTR',64),(7,'Albacete',79),(8,'Lleida',79),(9,'QC',13),(10,'NRW',30),(11,'IA',91),(12,'ID',91),(13,'YT',13),(14,'Leon',79),(15,'ACorua',79),(16,'Castellon',79),(17,'LasPalmas',79),(18,'Pontevedra',79),(19,'AA',91),(20,'Teruel',79),(21,'AB',13),(22,'AC',91),(23,'IL',91),(24,'AE',91),(25,'AF',91),(26,'IN',91),(27,'AG',82),(28,'A Corua',79),(29,'AI',82),(30,'AK',91),(31,'Caceres',79),(32,'Segovia',79),(33,'AL',91),(34,'AM',91),(35,'ZG',82),(36,'Malaga',79),(37,'CEN',64),(38,'ZH',82),(39,'LaRioja',79),(40,'AP',91),(41,'Melilla',79),(42,'AR',91),(43,'AS',91),(44,'NSW',4),(45,'Madrid',79),(46,'RI',91),(47,'AZ',91),(48,'Ceuta',79),(49,'BC',13),(50,'Huelva',79);
/*!40000 ALTER TABLE `ZONE` ENABLE KEYS */;
UNLOCK TABLES;
DELETE FROM `ZONE` WHERE COUNTRY_ID != 13 OR ZONE_ID != 9;

--
-- Table structure for table `ZONE_DESCRIPTION`
--

DROP TABLE IF EXISTS `ZONE_DESCRIPTION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8 */;
CREATE TABLE `ZONE_DESCRIPTION` (
  `DESCRIPTION_ID` bigint NOT NULL,
  `DATE_CREATED` datetime DEFAULT NULL,
  `DATE_MODIFIED` datetime DEFAULT NULL,
  `UPDT_ID` varchar(60) DEFAULT NULL,
  `DESCRIPTION` longtext,
  `NAME` varchar(120) NOT NULL,
  `TITLE` varchar(100) DEFAULT NULL,
  `LANGUAGE_ID` int NOT NULL,
  `ZONE_ID` bigint NOT NULL,
  PRIMARY KEY (`DESCRIPTION_ID`),
  UNIQUE KEY `UKm64laxgrv9fxm6io232ap4su9` (`ZONE_ID`,`LANGUAGE_ID`),
  KEY `FK69ybu7r3bgpcq65c77ji1udh3` (`LANGUAGE_ID`),
  CONSTRAINT `FK69ybu7r3bgpcq65c77ji1udh3` FOREIGN KEY (`LANGUAGE_ID`) REFERENCES `LANGUAGE` (`LANGUAGE_ID`),
  CONSTRAINT `FKpv4elin6w3b03756obqvk447f` FOREIGN KEY (`ZONE_ID`) REFERENCES `ZONE` (`ZONE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ZONE_DESCRIPTION`
--

LOCK TABLES `ZONE_DESCRIPTION` WRITE;
/*!40000 ALTER TABLE `ZONE_DESCRIPTION` DISABLE KEYS */;
INSERT INTO `ZONE_DESCRIPTION` VALUES (24,'2020-12-21 05:37:28','2020-12-21 05:37:28',NULL,NULL,'Quebec',NULL,1,9),(25,'2020-12-21 05:37:28','2020-12-21 05:37:28',NULL,NULL,'Québec',NULL,2,9),(26,'2020-12-21 05:37:28','2020-12-21 05:37:28',NULL,NULL,'Quebec',NULL,3,9);
/*!40000 ALTER TABLE `ZONE_DESCRIPTION` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;
DELETE FROM `ZONE_DESCRIPTION` WHERE ZONE_ID NOT IN (SELECT ZONE_ID FROM ZONE);

DROP TABLE IF EXISTS `hibernate_sequences`;
CREATE TABLE `hibernate_sequences` (
`sequence_name` varchar(255) NOT NULL,
`next_val` bigint(20) DEFAULT NULL,
PRIMARY KEY (`sequence_name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- /*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
-- /*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-12-21 13:40:58
