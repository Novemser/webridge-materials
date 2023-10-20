
/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
DROP TABLE IF EXISTS `BLC_ADDITIONAL_OFFER_INFO`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BLC_ADDITIONAL_OFFER_INFO` (
  `BLC_ORDER_ORDER_ID` bigint(20) NOT NULL,
  `OFFER_INFO_ID` bigint(20) NOT NULL,
  `OFFER_ID` bigint(20) NOT NULL,
  PRIMARY KEY (`BLC_ORDER_ORDER_ID`,`OFFER_ID`),
  KEY `FKlkk2kdjpv0v0ybxnc11p7hg4e` (`OFFER_INFO_ID`),
  KEY `FK40nm1ylfeiv2t6ojcmehu8gcr` (`OFFER_ID`),
  CONSTRAINT `FK40nm1ylfeiv2t6ojcmehu8gcr` FOREIGN KEY (`OFFER_ID`) REFERENCES `BLC_OFFER` (`OFFER_ID`),
  CONSTRAINT `FKlkk2kdjpv0v0ybxnc11p7hg4e` FOREIGN KEY (`OFFER_INFO_ID`) REFERENCES `BLC_OFFER_INFO` (`OFFER_INFO_ID`),
  CONSTRAINT `FKrfc8a02u7yp8qqk206ug62lnb` FOREIGN KEY (`BLC_ORDER_ORDER_ID`) REFERENCES `BLC_ORDER` (`ORDER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `BLC_ADDITIONAL_OFFER_INFO` WRITE;
/*!40000 ALTER TABLE `BLC_ADDITIONAL_OFFER_INFO` DISABLE KEYS */;
/*!40000 ALTER TABLE `BLC_ADDITIONAL_OFFER_INFO` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `BLC_ADDRESS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BLC_ADDRESS` (
  `ADDRESS_ID` bigint(20) NOT NULL,
  `ADDRESS_LINE1` varchar(255) NOT NULL,
  `ADDRESS_LINE2` varchar(255) DEFAULT NULL,
  `ADDRESS_LINE3` varchar(255) DEFAULT NULL,
  `CITY` varchar(255) NOT NULL,
  `COMPANY_NAME` varchar(255) DEFAULT NULL,
  `COUNTY` varchar(255) DEFAULT NULL,
  `EMAIL_ADDRESS` varchar(255) DEFAULT NULL,
  `FAX` varchar(255) DEFAULT NULL,
  `FIRST_NAME` varchar(255) DEFAULT NULL,
  `FULL_NAME` varchar(255) DEFAULT NULL,
  `IS_ACTIVE` bit(1) DEFAULT NULL,
  `IS_BUSINESS` bit(1) DEFAULT NULL,
  `IS_DEFAULT` bit(1) DEFAULT NULL,
  `IS_MAILING` bit(1) DEFAULT NULL,
  `IS_STREET` bit(1) DEFAULT NULL,
  `ISO_COUNTRY_SUB` varchar(255) DEFAULT NULL,
  `LAST_NAME` varchar(255) DEFAULT NULL,
  `POSTAL_CODE` varchar(255) DEFAULT NULL,
  `PRIMARY_PHONE` varchar(255) DEFAULT NULL,
  `SECONDARY_PHONE` varchar(255) DEFAULT NULL,
  `STANDARDIZED` bit(1) DEFAULT NULL,
  `SUB_STATE_PROV_REG` varchar(255) DEFAULT NULL,
  `TOKENIZED_ADDRESS` varchar(255) DEFAULT NULL,
  `VERIFICATION_LEVEL` varchar(255) DEFAULT NULL,
  `ZIP_FOUR` varchar(255) DEFAULT NULL,
  `COUNTRY` varchar(255) DEFAULT NULL,
  `ISO_COUNTRY_ALPHA2` varchar(255) DEFAULT NULL,
  `PHONE_FAX_ID` bigint(20) DEFAULT NULL,
  `PHONE_PRIMARY_ID` bigint(20) DEFAULT NULL,
  `PHONE_SECONDARY_ID` bigint(20) DEFAULT NULL,
  `STATE_PROV_REGION` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ADDRESS_ID`),
  KEY `ADDRESS_COUNTRY_INDEX` (`COUNTRY`),
  KEY `ADDRESS_ISO_COUNTRY_IDX` (`ISO_COUNTRY_ALPHA2`),
  KEY `ADDRESS_PHONE_FAX_IDX` (`PHONE_FAX_ID`),
  KEY `ADDRESS_PHONE_PRI_IDX` (`PHONE_PRIMARY_ID`),
  KEY `ADDRESS_PHONE_SEC_IDX` (`PHONE_SECONDARY_ID`),
  KEY `ADDRESS_STATE_INDEX` (`STATE_PROV_REGION`),
  CONSTRAINT `FK6hgxmyv131s9xr4ei6uih9opw` FOREIGN KEY (`COUNTRY`) REFERENCES `BLC_COUNTRY` (`ABBREVIATION`),
  CONSTRAINT `FKdg3srpny8h476fl59expu2cv0` FOREIGN KEY (`STATE_PROV_REGION`) REFERENCES `BLC_STATE` (`ABBREVIATION`),
  CONSTRAINT `FKlafhchfputda32qhub54fa726` FOREIGN KEY (`PHONE_PRIMARY_ID`) REFERENCES `BLC_PHONE` (`PHONE_ID`),
  CONSTRAINT `FKlbxqgy7cjnjn5ey2wqvpjnhe5` FOREIGN KEY (`PHONE_SECONDARY_ID`) REFERENCES `BLC_PHONE` (`PHONE_ID`),
  CONSTRAINT `FKp37ru1cyeu6fq48ohmjmyvjej` FOREIGN KEY (`ISO_COUNTRY_ALPHA2`) REFERENCES `BLC_ISO_COUNTRY` (`ALPHA_2`),
  CONSTRAINT `FKrgw6kfwuqepeo3u7i75t57l8w` FOREIGN KEY (`PHONE_FAX_ID`) REFERENCES `BLC_PHONE` (`PHONE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `BLC_ADDRESS` WRITE;
/*!40000 ALTER TABLE `BLC_ADDRESS` DISABLE KEYS */;
INSERT INTO `BLC_ADDRESS` VALUES (1,'address','address2',NULL,'city',NULL,NULL,NULL,NULL,'first',NULL,_binary '',_binary '\0',_binary '',_binary '\0',_binary '\0',NULL,'last','123456',NULL,NULL,_binary '\0','AL',NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL);
/*!40000 ALTER TABLE `BLC_ADDRESS` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `BLC_ADMIN_MODULE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BLC_ADMIN_MODULE` (
  `ADMIN_MODULE_ID` bigint(20) NOT NULL,
  `DISPLAY_ORDER` int(11) DEFAULT NULL,
  `ICON` varchar(255) DEFAULT NULL,
  `MODULE_KEY` varchar(255) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  PRIMARY KEY (`ADMIN_MODULE_ID`),
  KEY `ADMINMODULE_NAME_INDEX` (`NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `BLC_ADMIN_MODULE` WRITE;
/*!40000 ALTER TABLE `BLC_ADMIN_MODULE` DISABLE KEYS */;
INSERT INTO `BLC_ADMIN_MODULE` VALUES (-9,250,'blc-icon-inventory','BLCInventory','Inventory');
INSERT INTO `BLC_ADMIN_MODULE` VALUES (-8,150,'fa fa-usd','BLCPricing','Pricing');
INSERT INTO `BLC_ADMIN_MODULE` VALUES (-7,500,'blc-icon-site-updates','BLCWorkflow','Site Updates');
INSERT INTO `BLC_ADMIN_MODULE` VALUES (-6,400,'blc-icon-design','BLCDesign','Design');
INSERT INTO `BLC_ADMIN_MODULE` VALUES (-5,700,'blc-icon-settings','BLCModuleConfiguration','Settings');
INSERT INTO `BLC_ADMIN_MODULE` VALUES (-4,600,'blc-icon-security','BLCOpenAdmin','Security');
INSERT INTO `BLC_ADMIN_MODULE` VALUES (-3,550,'blc-icon-customer-care','BLCCustomerCare','Customer Care');
INSERT INTO `BLC_ADMIN_MODULE` VALUES (-2,200,'blc-icon-content','BLCContentManagement','Content');
INSERT INTO `BLC_ADMIN_MODULE` VALUES (-1,100,'blc-icon-catalog','BLCMerchandising','Catalog');
/*!40000 ALTER TABLE `BLC_ADMIN_MODULE` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `BLC_ADMIN_PASSWORD_TOKEN`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BLC_ADMIN_PASSWORD_TOKEN` (
  `PASSWORD_TOKEN` varchar(255) NOT NULL,
  `ADMIN_USER_ID` bigint(20) NOT NULL,
  `CREATE_DATE` datetime NOT NULL,
  `TOKEN_USED_DATE` datetime DEFAULT NULL,
  `TOKEN_USED_FLAG` bit(1) NOT NULL,
  PRIMARY KEY (`PASSWORD_TOKEN`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `BLC_ADMIN_PASSWORD_TOKEN` WRITE;
/*!40000 ALTER TABLE `BLC_ADMIN_PASSWORD_TOKEN` DISABLE KEYS */;
/*!40000 ALTER TABLE `BLC_ADMIN_PASSWORD_TOKEN` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `BLC_ADMIN_PERMISSION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BLC_ADMIN_PERMISSION` (
  `ADMIN_PERMISSION_ID` bigint(20) NOT NULL,
  `DESCRIPTION` varchar(255) NOT NULL,
  `IS_FRIENDLY` bit(1) DEFAULT NULL,
  `NAME` varchar(255) NOT NULL,
  `PERMISSION_TYPE` varchar(255) NOT NULL,
  PRIMARY KEY (`ADMIN_PERMISSION_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `BLC_ADMIN_PERMISSION` WRITE;
/*!40000 ALTER TABLE `BLC_ADMIN_PERMISSION` DISABLE KEYS */;
INSERT INTO `BLC_ADMIN_PERMISSION` VALUES (-27003,'Maintain Menus',_binary '','PERMISSION_MENU','ALL');
INSERT INTO `BLC_ADMIN_PERMISSION` VALUES (-27002,'View Menus',_binary '','PERMISSION_MENU','READ');
INSERT INTO `BLC_ADMIN_PERMISSION` VALUES (-27001,'All Menu',NULL,'PERMISSION_ALL_MENU','ALL');
INSERT INTO `BLC_ADMIN_PERMISSION` VALUES (-27000,'Read Menu',NULL,'PERMISSION_READ_MENU','READ');
INSERT INTO `BLC_ADMIN_PERMISSION` VALUES (-200,'Read Page Template',_binary '\0','PERMISSION_READ_PAGE_TEMPLATE','READ');
INSERT INTO `BLC_ADMIN_PERMISSION` VALUES (-181,'Maintain Promotion Messages',_binary '','PERMISSION_PROMOTION_MESSAGE','ALL');
INSERT INTO `BLC_ADMIN_PERMISSION` VALUES (-180,'View Promotion Messages',_binary '','PERMISSION_PROMOTION_MESSAGE','READ');
INSERT INTO `BLC_ADMIN_PERMISSION` VALUES (-161,'Maintain Field Definitions',_binary '','PERMISSION_FLDDEF_ALL','ALL');
INSERT INTO `BLC_ADMIN_PERMISSION` VALUES (-160,'View Field Definitions',_binary '','PERMISSION_FLDDEF_VIEW','READ');
INSERT INTO `BLC_ADMIN_PERMISSION` VALUES (-151,'Maintain Permissions',_binary '','PERMISSION_PERM_ALL','ALL');
INSERT INTO `BLC_ADMIN_PERMISSION` VALUES (-150,'View Permissions',_binary '','PERMISSION_PERM_VIEW','READ');
INSERT INTO `BLC_ADMIN_PERMISSION` VALUES (-141,'Maintain Roles',_binary '','PERMISSION_ROLE_ALL','ALL');
INSERT INTO `BLC_ADMIN_PERMISSION` VALUES (-140,'View Roles',_binary '','PERMISSION_ROLE_VIEW','READ');
INSERT INTO `BLC_ADMIN_PERMISSION` VALUES (-131,'Maintain Translations',_binary '','PERMISSION_TRANSLATION','ALL');
INSERT INTO `BLC_ADMIN_PERMISSION` VALUES (-130,'View Translations',_binary '','PERMISSION_TRANSLATION','READ');
INSERT INTO `BLC_ADMIN_PERMISSION` VALUES (-127,'Maintain Module Configurations',_binary '','PERMISSION_MODULECONFIGURATION','ALL');
INSERT INTO `BLC_ADMIN_PERMISSION` VALUES (-126,'View Module Configurations',_binary '','PERMISSION_MODULECONFIGURATION','READ');
INSERT INTO `BLC_ADMIN_PERMISSION` VALUES (-121,'Maintain Users',_binary '','PERMISSION_USER','ALL');
INSERT INTO `BLC_ADMIN_PERMISSION` VALUES (-120,'View Users',_binary '','PERMISSION_USER','READ');
INSERT INTO `BLC_ADMIN_PERMISSION` VALUES (-119,'Maintain Customers',_binary '','PERMISSION_CUSTOMER','ALL');
INSERT INTO `BLC_ADMIN_PERMISSION` VALUES (-118,'View Customers',_binary '','PERMISSION_CUSTOMER','READ');
INSERT INTO `BLC_ADMIN_PERMISSION` VALUES (-115,'Maintain URL Redirects',_binary '','PERMISSION_URLREDIRECT','ALL');
INSERT INTO `BLC_ADMIN_PERMISSION` VALUES (-114,'View URL Redirects',_binary '','PERMISSION_URLREDIRECT','READ');
INSERT INTO `BLC_ADMIN_PERMISSION` VALUES (-111,'Maintain Assets',_binary '','PERMISSION_ASSET','ALL');
INSERT INTO `BLC_ADMIN_PERMISSION` VALUES (-110,'View Assets',_binary '','PERMISSION_ASSET','READ');
INSERT INTO `BLC_ADMIN_PERMISSION` VALUES (-109,'Maintain Pages',_binary '','PERMISSION_PAGE','ALL');
INSERT INTO `BLC_ADMIN_PERMISSION` VALUES (-108,'View Pages',_binary '','PERMISSION_PAGE','READ');
INSERT INTO `BLC_ADMIN_PERMISSION` VALUES (-107,'Maintain Offers',_binary '','PERMISSION_OFFER','ALL');
INSERT INTO `BLC_ADMIN_PERMISSION` VALUES (-106,'View Offers',_binary '','PERMISSION_OFFER','READ');
INSERT INTO `BLC_ADMIN_PERMISSION` VALUES (-105,'Maintain Product Options',_binary '','PERMISSION_PRODUCTOPTIONS','ALL');
INSERT INTO `BLC_ADMIN_PERMISSION` VALUES (-104,'View Product Options',_binary '','PERMISSION_PRODUCTOPTIONS','READ');
INSERT INTO `BLC_ADMIN_PERMISSION` VALUES (-103,'Maintain Products',_binary '','PERMISSION_PRODUCT','ALL');
INSERT INTO `BLC_ADMIN_PERMISSION` VALUES (-102,'View Products',_binary '','PERMISSION_PRODUCT','READ');
INSERT INTO `BLC_ADMIN_PERMISSION` VALUES (-101,'Maintain Categories',_binary '','PERMISSION_CATEGORY','ALL');
INSERT INTO `BLC_ADMIN_PERMISSION` VALUES (-100,'View Categories',_binary '','PERMISSION_CATEGORY','READ');
INSERT INTO `BLC_ADMIN_PERMISSION` VALUES (-55,'All ISO COUNTRIES',_binary '\0','PERMISSION_ALL_ISO_COUNTRIES','ALL');
INSERT INTO `BLC_ADMIN_PERMISSION` VALUES (-54,'Read ISO Countries',_binary '\0','PERMISSION_READ_ISO_COUNTRIES','READ');
INSERT INTO `BLC_ADMIN_PERMISSION` VALUES (-53,'All Catalog Permissions',_binary '\0','PERMISSION_ALL_CATALOG_PERMS','ALL');
INSERT INTO `BLC_ADMIN_PERMISSION` VALUES (-52,'Read Catalog Permissions',_binary '\0','PERMISSION_READ_CATALOG_PERMS','READ');
INSERT INTO `BLC_ADMIN_PERMISSION` VALUES (-51,'All Field Definitions',_binary '\0','PERMISSION_ALL_FIELD_DEFS','ALL');
INSERT INTO `BLC_ADMIN_PERMISSION` VALUES (-50,'Read Field Definitions',_binary '\0','PERMISSION_READ_FIELD_DEFS','READ');
INSERT INTO `BLC_ADMIN_PERMISSION` VALUES (-49,'All Admin Permissions',_binary '\0','PERMISSION_ALL_ADMIN_PERMS','ALL');
INSERT INTO `BLC_ADMIN_PERMISSION` VALUES (-48,'Read Admin Permissions',_binary '\0','PERMISSION_READ_ADMIN_PERMS','READ');
INSERT INTO `BLC_ADMIN_PERMISSION` VALUES (-47,'All Admin Roles',_binary '\0','PERMISSION_ALL_ADMIN_ROLES','ALL');
INSERT INTO `BLC_ADMIN_PERMISSION` VALUES (-46,'Read Admin Roles',_binary '\0','PERMISSION_READ_ADMIN_ROLES','READ');
INSERT INTO `BLC_ADMIN_PERMISSION` VALUES (-45,'All System Property',_binary '\0','PERMISSION_ALL_SYSTEM_PROPERTY','ALL');
INSERT INTO `BLC_ADMIN_PERMISSION` VALUES (-44,'Read System Property',_binary '\0','PERMISSION_READ_SYSTEM_PROPERTY','READ');
INSERT INTO `BLC_ADMIN_PERMISSION` VALUES (-43,'All Site Map Gen Configuration',_binary '\0','PERMISSION_ALL_SITE_MAP_GEN_CONFIG','ALL');
INSERT INTO `BLC_ADMIN_PERMISSION` VALUES (-42,'Read Site Map Gen Configuration',_binary '\0','PERMISSION_READ_SITE_MAP_GEN_CONFIG','READ');
INSERT INTO `BLC_ADMIN_PERMISSION` VALUES (-41,'All Translation',_binary '\0','PERMISSION_ALL_TRANSLATION','ALL');
INSERT INTO `BLC_ADMIN_PERMISSION` VALUES (-40,'Read Translation',_binary '\0','PERMISSION_READ_TRANSLATION','READ');
INSERT INTO `BLC_ADMIN_PERMISSION` VALUES (-39,'All Enumeration',_binary '\0','PERMISSION_ALL_ENUMERATION','ALL');
INSERT INTO `BLC_ADMIN_PERMISSION` VALUES (-38,'Read Enumeration',_binary '\0','PERMISSION_READ_ENUMERATION','READ');
INSERT INTO `BLC_ADMIN_PERMISSION` VALUES (-37,'All Configuration',_binary '\0','PERMISSION_ALL_MODULECONFIGURATION','ALL');
INSERT INTO `BLC_ADMIN_PERMISSION` VALUES (-36,'Read Configuration',_binary '\0','PERMISSION_READ_MODULECONFIGURATION','READ');
INSERT INTO `BLC_ADMIN_PERMISSION` VALUES (-35,'All Currency',_binary '\0','PERMISSION_ALL_CURRENCY','ALL');
INSERT INTO `BLC_ADMIN_PERMISSION` VALUES (-34,'Read Currency',_binary '\0','PERMISSION_READ_CURRENCY','READ');
INSERT INTO `BLC_ADMIN_PERMISSION` VALUES (-33,'All SearchFacet',_binary '\0','PERMISSION_ALL_SEARCHFACET','ALL');
INSERT INTO `BLC_ADMIN_PERMISSION` VALUES (-32,'Read SearchFacet',_binary '\0','PERMISSION_READ_SEARCHFACET','READ');
INSERT INTO `BLC_ADMIN_PERMISSION` VALUES (-31,'All SearchRedirect',_binary '\0','PERMISSION_ALL_SEARCHREDIRECT','ALL');
INSERT INTO `BLC_ADMIN_PERMISSION` VALUES (-30,'Read SearchRedirect',_binary '\0','PERMISSION_READ_SEARCHREDIRECT','READ');
INSERT INTO `BLC_ADMIN_PERMISSION` VALUES (-29,'All URLHandler',_binary '\0','PERMISSION_ALL_URLHANDLER','ALL');
INSERT INTO `BLC_ADMIN_PERMISSION` VALUES (-28,'Read URLHandler',_binary '\0','PERMISSION_READ_URLHANDLER','READ');
INSERT INTO `BLC_ADMIN_PERMISSION` VALUES (-27,'All Admin User',_binary '\0','PERMISSION_ALL_ADMIN_USER','ALL');
INSERT INTO `BLC_ADMIN_PERMISSION` VALUES (-26,'Read Admin User',_binary '\0','PERMISSION_READ_ADMIN_USER','READ');
INSERT INTO `BLC_ADMIN_PERMISSION` VALUES (-23,'All Asset',_binary '\0','PERMISSION_ALL_ASSET','ALL');
INSERT INTO `BLC_ADMIN_PERMISSION` VALUES (-22,'Read Asset',_binary '\0','PERMISSION_READ_ASSET','READ');
INSERT INTO `BLC_ADMIN_PERMISSION` VALUES (-21,'All Page',_binary '\0','PERMISSION_ALL_PAGE','ALL');
INSERT INTO `BLC_ADMIN_PERMISSION` VALUES (-20,'Read Page',_binary '\0','PERMISSION_READ_PAGE','READ');
INSERT INTO `BLC_ADMIN_PERMISSION` VALUES (-19,'All Customer',_binary '\0','PERMISSION_ALL_CUSTOMER','ALL');
INSERT INTO `BLC_ADMIN_PERMISSION` VALUES (-18,'Read Customer',_binary '\0','PERMISSION_READ_CUSTOMER','READ');
INSERT INTO `BLC_ADMIN_PERMISSION` VALUES (-17,'All Order Item',_binary '\0','PERMISSION_ALL_ORDER_ITEM','ALL');
INSERT INTO `BLC_ADMIN_PERMISSION` VALUES (-16,'Read Order Item',_binary '\0','PERMISSION_READ_ORDER_ITEM','READ');
INSERT INTO `BLC_ADMIN_PERMISSION` VALUES (-15,'All Fulfillment Group',_binary '\0','PERMISSION_ALL_FULFILLMENT_GROUP','ALL');
INSERT INTO `BLC_ADMIN_PERMISSION` VALUES (-14,'Read Fulfillment Group',_binary '\0','PERMISSION_READ_FULFILLMENT_GROUP','READ');
INSERT INTO `BLC_ADMIN_PERMISSION` VALUES (-13,'All Order',_binary '\0','PERMISSION_ALL_ORDER','ALL');
INSERT INTO `BLC_ADMIN_PERMISSION` VALUES (-12,'Read Order',_binary '\0','PERMISSION_READ_ORDER','READ');
INSERT INTO `BLC_ADMIN_PERMISSION` VALUES (-11,'All Promotion',_binary '\0','PERMISSION_ALL_PROMOTION','ALL');
INSERT INTO `BLC_ADMIN_PERMISSION` VALUES (-10,'Read Promotion',_binary '\0','PERMISSION_READ_PROMOTION','READ');
INSERT INTO `BLC_ADMIN_PERMISSION` VALUES (-9,'All Sku',_binary '\0','PERMISSION_ALL_SKU','ALL');
INSERT INTO `BLC_ADMIN_PERMISSION` VALUES (-8,'Read Sku',_binary '\0','PERMISSION_READ_SKU','READ');
INSERT INTO `BLC_ADMIN_PERMISSION` VALUES (-7,'All Product Option',_binary '\0','PERMISSION_ALL_PRODUCT_OPTION','ALL');
INSERT INTO `BLC_ADMIN_PERMISSION` VALUES (-6,'Read Product Option',_binary '\0','PERMISSION_READ_PRODUCT_OPTION','READ');
INSERT INTO `BLC_ADMIN_PERMISSION` VALUES (-5,'All Product',_binary '\0','PERMISSION_ALL_PRODUCT','ALL');
INSERT INTO `BLC_ADMIN_PERMISSION` VALUES (-4,'Read Product',_binary '\0','PERMISSION_READ_PRODUCT','READ');
INSERT INTO `BLC_ADMIN_PERMISSION` VALUES (-3,'All Category',_binary '\0','PERMISSION_ALL_CATEGORY','ALL');
INSERT INTO `BLC_ADMIN_PERMISSION` VALUES (-2,'Read Category',_binary '\0','PERMISSION_READ_CATEGORY','READ');
INSERT INTO `BLC_ADMIN_PERMISSION` VALUES (-1,'Default Permission',_binary '\0','PERMISSION_OTHER_DEFAULT','OTHER');
/*!40000 ALTER TABLE `BLC_ADMIN_PERMISSION` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `BLC_ADMIN_PERMISSION_ENTITY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BLC_ADMIN_PERMISSION_ENTITY` (
  `ADMIN_PERMISSION_ENTITY_ID` bigint(20) NOT NULL,
  `CEILING_ENTITY` varchar(255) NOT NULL,
  `ADMIN_PERMISSION_ID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`ADMIN_PERMISSION_ENTITY_ID`),
  KEY `FKr7lum3wwl9kacdlgw4cwdrsas` (`ADMIN_PERMISSION_ID`),
  CONSTRAINT `FKr7lum3wwl9kacdlgw4cwdrsas` FOREIGN KEY (`ADMIN_PERMISSION_ID`) REFERENCES `BLC_ADMIN_PERMISSION` (`ADMIN_PERMISSION_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `BLC_ADMIN_PERMISSION_ENTITY` WRITE;
/*!40000 ALTER TABLE `BLC_ADMIN_PERMISSION_ENTITY` DISABLE KEYS */;
INSERT INTO `BLC_ADMIN_PERMISSION_ENTITY` VALUES (-27003,'org.broadleafcommerce.menu.domain.MenuItem',-27001);
INSERT INTO `BLC_ADMIN_PERMISSION_ENTITY` VALUES (-27002,'org.broadleafcommerce.menu.domain.MenuItem',-27000);
INSERT INTO `BLC_ADMIN_PERMISSION_ENTITY` VALUES (-27001,'org.broadleafcommerce.menu.domain.Menu',-27001);
INSERT INTO `BLC_ADMIN_PERMISSION_ENTITY` VALUES (-27000,'org.broadleafcommerce.menu.domain.Menu',-27000);
INSERT INTO `BLC_ADMIN_PERMISSION_ENTITY` VALUES (-1011,'org.broadleafcommerce.common.i18n.domain.ISOCountry',-55);
INSERT INTO `BLC_ADMIN_PERMISSION_ENTITY` VALUES (-1010,'org.broadleafcommerce.common.i18n.domain.ISOCountry',-54);
INSERT INTO `BLC_ADMIN_PERMISSION_ENTITY` VALUES (-1003,'org.broadleafcommerce.common.site.domain.Site',-53);
INSERT INTO `BLC_ADMIN_PERMISSION_ENTITY` VALUES (-1002,'org.broadleafcommerce.common.site.domain.Site',-52);
INSERT INTO `BLC_ADMIN_PERMISSION_ENTITY` VALUES (-1001,'org.broadleafcommerce.common.site.domain.Catalog',-53);
INSERT INTO `BLC_ADMIN_PERMISSION_ENTITY` VALUES (-1000,'org.broadleafcommerce.common.site.domain.Catalog',-52);
INSERT INTO `BLC_ADMIN_PERMISSION_ENTITY` VALUES (-991,'org.broadleafcommerce.cms.field.domain.FieldDefinition',-51);
INSERT INTO `BLC_ADMIN_PERMISSION_ENTITY` VALUES (-990,'org.broadleafcommerce.cms.field.domain.FieldDefinition',-50);
INSERT INTO `BLC_ADMIN_PERMISSION_ENTITY` VALUES (-983,'org.broadleafcommerce.openadmin.server.security.domain.AdminPermissionQualifiedEntity',-48);
INSERT INTO `BLC_ADMIN_PERMISSION_ENTITY` VALUES (-982,'org.broadleafcommerce.openadmin.server.security.domain.AdminPermissionQualifiedEntity',-49);
INSERT INTO `BLC_ADMIN_PERMISSION_ENTITY` VALUES (-981,'org.broadleafcommerce.openadmin.server.security.domain.AdminPermission',-48);
INSERT INTO `BLC_ADMIN_PERMISSION_ENTITY` VALUES (-980,'org.broadleafcommerce.openadmin.server.security.domain.AdminPermission',-49);
INSERT INTO `BLC_ADMIN_PERMISSION_ENTITY` VALUES (-971,'org.broadleafcommerce.openadmin.server.security.domain.AdminRole',-47);
INSERT INTO `BLC_ADMIN_PERMISSION_ENTITY` VALUES (-970,'org.broadleafcommerce.openadmin.server.security.domain.AdminRole',-46);
INSERT INTO `BLC_ADMIN_PERMISSION_ENTITY` VALUES (-961,'org.broadleafcommerce.common.config.domain.SystemProperty',-45);
INSERT INTO `BLC_ADMIN_PERMISSION_ENTITY` VALUES (-960,'org.broadleafcommerce.common.config.domain.SystemProperty',-44);
INSERT INTO `BLC_ADMIN_PERMISSION_ENTITY` VALUES (-953,'org.broadleafcommerce.common.sitemap.domain.SiteMapURLEntry',-43);
INSERT INTO `BLC_ADMIN_PERMISSION_ENTITY` VALUES (-952,'org.broadleafcommerce.common.sitemap.domain.SiteMapURLEntry',-42);
INSERT INTO `BLC_ADMIN_PERMISSION_ENTITY` VALUES (-951,'org.broadleafcommerce.common.sitemap.domain.SiteMapGeneratorConfiguration',-43);
INSERT INTO `BLC_ADMIN_PERMISSION_ENTITY` VALUES (-950,'org.broadleafcommerce.common.sitemap.domain.SiteMapGeneratorConfiguration',-42);
INSERT INTO `BLC_ADMIN_PERMISSION_ENTITY` VALUES (-911,'org.broadleafcommerce.common.i18n.domain.Translation',-41);
INSERT INTO `BLC_ADMIN_PERMISSION_ENTITY` VALUES (-910,'org.broadleafcommerce.common.i18n.domain.Translation',-40);
INSERT INTO `BLC_ADMIN_PERMISSION_ENTITY` VALUES (-903,'org.broadleafcommerce.common.enumeration.domain.DataDrivenEnumerationValue',-39);
INSERT INTO `BLC_ADMIN_PERMISSION_ENTITY` VALUES (-902,'org.broadleafcommerce.common.enumeration.domain.DataDrivenEnumerationValue',-38);
INSERT INTO `BLC_ADMIN_PERMISSION_ENTITY` VALUES (-901,'org.broadleafcommerce.common.enumeration.domain.DataDrivenEnumeration',-39);
INSERT INTO `BLC_ADMIN_PERMISSION_ENTITY` VALUES (-900,'org.broadleafcommerce.common.enumeration.domain.DataDrivenEnumeration',-38);
INSERT INTO `BLC_ADMIN_PERMISSION_ENTITY` VALUES (-881,'org.broadleafcommerce.common.config.domain.ModuleConfiguration',-37);
INSERT INTO `BLC_ADMIN_PERMISSION_ENTITY` VALUES (-880,'org.broadleafcommerce.common.config.domain.ModuleConfiguration',-36);
INSERT INTO `BLC_ADMIN_PERMISSION_ENTITY` VALUES (-851,'org.broadleafcommerce.common.currency.domain.BroadleafCurrency',-35);
INSERT INTO `BLC_ADMIN_PERMISSION_ENTITY` VALUES (-850,'org.broadleafcommerce.common.currency.domain.BroadleafCurrency',-34);
INSERT INTO `BLC_ADMIN_PERMISSION_ENTITY` VALUES (-813,'org.broadleafcommerce.core.search.domain.IndexFieldType',-33);
INSERT INTO `BLC_ADMIN_PERMISSION_ENTITY` VALUES (-812,'org.broadleafcommerce.core.search.domain.IndexFieldType',-32);
INSERT INTO `BLC_ADMIN_PERMISSION_ENTITY` VALUES (-811,'org.broadleafcommerce.core.search.domain.IndexField',-33);
INSERT INTO `BLC_ADMIN_PERMISSION_ENTITY` VALUES (-810,'org.broadleafcommerce.core.search.domain.IndexField',-32);
INSERT INTO `BLC_ADMIN_PERMISSION_ENTITY` VALUES (-809,'org.broadleafcommerce.core.search.domain.CategoryExcludedSearchFacet',-33);
INSERT INTO `BLC_ADMIN_PERMISSION_ENTITY` VALUES (-808,'org.broadleafcommerce.core.search.domain.CategoryExcludedSearchFacet',-32);
INSERT INTO `BLC_ADMIN_PERMISSION_ENTITY` VALUES (-807,'org.broadleafcommerce.core.search.domain.SearchFacetRange',-33);
INSERT INTO `BLC_ADMIN_PERMISSION_ENTITY` VALUES (-806,'org.broadleafcommerce.core.search.domain.SearchFacetRange',-32);
INSERT INTO `BLC_ADMIN_PERMISSION_ENTITY` VALUES (-805,'org.broadleafcommerce.core.search.domain.CategorySearchFacet',-33);
INSERT INTO `BLC_ADMIN_PERMISSION_ENTITY` VALUES (-804,'org.broadleafcommerce.core.search.domain.CategorySearchFacet',-32);
INSERT INTO `BLC_ADMIN_PERMISSION_ENTITY` VALUES (-803,'org.broadleafcommerce.core.search.domain.Field',-33);
INSERT INTO `BLC_ADMIN_PERMISSION_ENTITY` VALUES (-802,'org.broadleafcommerce.core.search.domain.Field',-32);
INSERT INTO `BLC_ADMIN_PERMISSION_ENTITY` VALUES (-801,'org.broadleafcommerce.core.search.domain.SearchFacet',-33);
INSERT INTO `BLC_ADMIN_PERMISSION_ENTITY` VALUES (-800,'org.broadleafcommerce.core.search.domain.SearchFacet',-32);
INSERT INTO `BLC_ADMIN_PERMISSION_ENTITY` VALUES (-781,'org.broadleafcommerce.core.search.redirect.domain.SearchRedirect',-31);
INSERT INTO `BLC_ADMIN_PERMISSION_ENTITY` VALUES (-780,'org.broadleafcommerce.core.search.redirect.domain.SearchRedirect',-30);
INSERT INTO `BLC_ADMIN_PERMISSION_ENTITY` VALUES (-753,'org.broadleafcommerce.common.locale.domain.Locale',-29);
INSERT INTO `BLC_ADMIN_PERMISSION_ENTITY` VALUES (-752,'org.broadleafcommerce.common.locale.domain.Locale',-28);
INSERT INTO `BLC_ADMIN_PERMISSION_ENTITY` VALUES (-751,'org.broadleafcommerce.cms.url.domain.URLHandler',-29);
INSERT INTO `BLC_ADMIN_PERMISSION_ENTITY` VALUES (-750,'org.broadleafcommerce.cms.url.domain.URLHandler',-28);
INSERT INTO `BLC_ADMIN_PERMISSION_ENTITY` VALUES (-721,'org.broadleafcommerce.openadmin.server.security.domain.AdminUser',-27);
INSERT INTO `BLC_ADMIN_PERMISSION_ENTITY` VALUES (-720,'org.broadleafcommerce.openadmin.server.security.domain.AdminUser',-26);
INSERT INTO `BLC_ADMIN_PERMISSION_ENTITY` VALUES (-603,'org.broadleafcommerce.cms.file.domain.StaticAssetFolder',-23);
INSERT INTO `BLC_ADMIN_PERMISSION_ENTITY` VALUES (-602,'org.broadleafcommerce.cms.file.domain.StaticAssetFolder',-22);
INSERT INTO `BLC_ADMIN_PERMISSION_ENTITY` VALUES (-601,'org.broadleafcommerce.cms.file.domain.StaticAsset',-23);
INSERT INTO `BLC_ADMIN_PERMISSION_ENTITY` VALUES (-600,'org.broadleafcommerce.cms.file.domain.StaticAsset',-22);
INSERT INTO `BLC_ADMIN_PERMISSION_ENTITY` VALUES (-557,'org.broadleafcommerce.common.locale.domain.Locale',-21);
INSERT INTO `BLC_ADMIN_PERMISSION_ENTITY` VALUES (-556,'org.broadleafcommerce.common.locale.domain.Locale',-20);
INSERT INTO `BLC_ADMIN_PERMISSION_ENTITY` VALUES (-555,'org.broadleafcommerce.cms.page.domain.PageItemCriteria',-21);
INSERT INTO `BLC_ADMIN_PERMISSION_ENTITY` VALUES (-554,'org.broadleafcommerce.cms.page.domain.PageItemCriteria',-20);
INSERT INTO `BLC_ADMIN_PERMISSION_ENTITY` VALUES (-552,'org.broadleafcommerce.cms.page.domain.PageTemplate',-200);
INSERT INTO `BLC_ADMIN_PERMISSION_ENTITY` VALUES (-551,'org.broadleafcommerce.cms.page.domain.Page',-21);
INSERT INTO `BLC_ADMIN_PERMISSION_ENTITY` VALUES (-550,'org.broadleafcommerce.cms.page.domain.Page',-20);
INSERT INTO `BLC_ADMIN_PERMISSION_ENTITY` VALUES (-514,'org.broadleafcommerce.core.catalog.domain.CrossSaleProductImpl',-19);
INSERT INTO `BLC_ADMIN_PERMISSION_ENTITY` VALUES (-513,'org.broadleafcommerce.core.catalog.domain.CrossSaleProductImpl',-18);
INSERT INTO `BLC_ADMIN_PERMISSION_ENTITY` VALUES (-512,'org.broadleafcommerce.profile.core.domain.CustomerPhone',-19);
INSERT INTO `BLC_ADMIN_PERMISSION_ENTITY` VALUES (-511,'org.broadleafcommerce.profile.core.domain.CustomerPhone',-18);
INSERT INTO `BLC_ADMIN_PERMISSION_ENTITY` VALUES (-510,'org.broadleafcommerce.profile.core.domain.CustomerPayment',-19);
INSERT INTO `BLC_ADMIN_PERMISSION_ENTITY` VALUES (-509,'org.broadleafcommerce.profile.core.domain.CustomerPayment',-18);
INSERT INTO `BLC_ADMIN_PERMISSION_ENTITY` VALUES (-508,'org.broadleafcommerce.profile.core.domain.CustomerAddress',-19);
INSERT INTO `BLC_ADMIN_PERMISSION_ENTITY` VALUES (-507,'org.broadleafcommerce.profile.core.domain.CustomerAddress',-18);
INSERT INTO `BLC_ADMIN_PERMISSION_ENTITY` VALUES (-506,'org.broadleafcommerce.profile.core.domain.CustomerAttribute',-19);
INSERT INTO `BLC_ADMIN_PERMISSION_ENTITY` VALUES (-504,'org.broadleafcommerce.profile.core.domain.CustomerAttribute',-18);
INSERT INTO `BLC_ADMIN_PERMISSION_ENTITY` VALUES (-503,'org.broadleafcommerce.profile.core.domain.ChallengeQuestion',-19);
INSERT INTO `BLC_ADMIN_PERMISSION_ENTITY` VALUES (-502,'org.broadleafcommerce.profile.core.domain.ChallengeQuestion',-18);
INSERT INTO `BLC_ADMIN_PERMISSION_ENTITY` VALUES (-501,'org.broadleafcommerce.profile.core.domain.Customer',-19);
INSERT INTO `BLC_ADMIN_PERMISSION_ENTITY` VALUES (-500,'org.broadleafcommerce.profile.core.domain.Customer',-18);
INSERT INTO `BLC_ADMIN_PERMISSION_ENTITY` VALUES (-461,'org.broadleafcommerce.core.order.domain.BundleOrderItemFeePriceImpl',-17);
INSERT INTO `BLC_ADMIN_PERMISSION_ENTITY` VALUES (-460,'org.broadleafcommerce.core.order.domain.BundleOrderItemFeePriceImpl',-16);
INSERT INTO `BLC_ADMIN_PERMISSION_ENTITY` VALUES (-459,'org.broadleafcommerce.core.order.domain.OrderItemPriceDetailImpl',-17);
INSERT INTO `BLC_ADMIN_PERMISSION_ENTITY` VALUES (-458,'org.broadleafcommerce.core.order.domain.OrderItemPriceDetailImpl',-16);
INSERT INTO `BLC_ADMIN_PERMISSION_ENTITY` VALUES (-457,'org.broadleafcommerce.core.offer.domain.OrderItemPriceDetailAdjustmentImpl',-17);
INSERT INTO `BLC_ADMIN_PERMISSION_ENTITY` VALUES (-456,'org.broadleafcommerce.core.offer.domain.OrderItemPriceDetailAdjustmentImpl',-16);
INSERT INTO `BLC_ADMIN_PERMISSION_ENTITY` VALUES (-455,'org.broadleafcommerce.core.offer.domain.OrderItemAdjustment',-17);
INSERT INTO `BLC_ADMIN_PERMISSION_ENTITY` VALUES (-454,'org.broadleafcommerce.core.offer.domain.OrderItemAdjustment',-16);
INSERT INTO `BLC_ADMIN_PERMISSION_ENTITY` VALUES (-453,'org.broadleafcommerce.core.order.domain.DiscreteOrderItemFeePrice',-17);
INSERT INTO `BLC_ADMIN_PERMISSION_ENTITY` VALUES (-452,'org.broadleafcommerce.core.order.domain.DiscreteOrderItemFeePrice',-16);
INSERT INTO `BLC_ADMIN_PERMISSION_ENTITY` VALUES (-451,'org.broadleafcommerce.core.order.domain.OrderItem',-17);
INSERT INTO `BLC_ADMIN_PERMISSION_ENTITY` VALUES (-450,'org.broadleafcommerce.core.order.domain.OrderItem',-16);
INSERT INTO `BLC_ADMIN_PERMISSION_ENTITY` VALUES (-407,'org.broadleafcommerce.core.order.domain.FulfillmentGroupItemImpl',-15);
INSERT INTO `BLC_ADMIN_PERMISSION_ENTITY` VALUES (-406,'org.broadleafcommerce.core.order.domain.FulfillmentGroupItemImpl',-14);
INSERT INTO `BLC_ADMIN_PERMISSION_ENTITY` VALUES (-405,'org.broadleafcommerce.core.order.domain.FulfillmentGroupFeeImpl',-15);
INSERT INTO `BLC_ADMIN_PERMISSION_ENTITY` VALUES (-404,'org.broadleafcommerce.core.order.domain.FulfillmentGroupFeeImpl',-14);
INSERT INTO `BLC_ADMIN_PERMISSION_ENTITY` VALUES (-403,'org.broadleafcommerce.core.offer.domain.FulfillmentGroupAdjustment',-15);
INSERT INTO `BLC_ADMIN_PERMISSION_ENTITY` VALUES (-402,'org.broadleafcommerce.core.offer.domain.FulfillmentGroupAdjustment',-14);
INSERT INTO `BLC_ADMIN_PERMISSION_ENTITY` VALUES (-401,'org.broadleafcommerce.core.order.domain.FulfillmentGroup',-15);
INSERT INTO `BLC_ADMIN_PERMISSION_ENTITY` VALUES (-400,'org.broadleafcommerce.core.order.domain.FulfillmentGroup',-14);
INSERT INTO `BLC_ADMIN_PERMISSION_ENTITY` VALUES (-370,'org.broadleafcommerce.core.payment.domain.PaymentTransactionImpl',-13);
INSERT INTO `BLC_ADMIN_PERMISSION_ENTITY` VALUES (-369,'org.broadleafcommerce.core.payment.domain.PaymentTransactionImpl',-12);
INSERT INTO `BLC_ADMIN_PERMISSION_ENTITY` VALUES (-368,'org.broadleafcommerce.profile.core.domain.State',-13);
INSERT INTO `BLC_ADMIN_PERMISSION_ENTITY` VALUES (-367,'org.broadleafcommerce.profile.core.domain.State',-12);
INSERT INTO `BLC_ADMIN_PERMISSION_ENTITY` VALUES (-366,'org.broadleafcommerce.profile.core.domain.Country',-13);
INSERT INTO `BLC_ADMIN_PERMISSION_ENTITY` VALUES (-365,'org.broadleafcommerce.profile.core.domain.Country',-12);
INSERT INTO `BLC_ADMIN_PERMISSION_ENTITY` VALUES (-361,'org.broadleafcommerce.core.payment.domain.OrderPayment',-13);
INSERT INTO `BLC_ADMIN_PERMISSION_ENTITY` VALUES (-360,'org.broadleafcommerce.core.payment.domain.OrderPayment',-12);
INSERT INTO `BLC_ADMIN_PERMISSION_ENTITY` VALUES (-356,'org.broadleafcommerce.core.offer.domain.OrderAdjustment',-13);
INSERT INTO `BLC_ADMIN_PERMISSION_ENTITY` VALUES (-355,'org.broadleafcommerce.core.offer.domain.OrderAdjustment',-12);
INSERT INTO `BLC_ADMIN_PERMISSION_ENTITY` VALUES (-351,'org.broadleafcommerce.core.order.domain.Order',-13);
INSERT INTO `BLC_ADMIN_PERMISSION_ENTITY` VALUES (-350,'org.broadleafcommerce.core.order.domain.Order',-12);
INSERT INTO `BLC_ADMIN_PERMISSION_ENTITY` VALUES (-307,'org.broadleafcommerce.core.offer.domain.OfferTier',-11);
INSERT INTO `BLC_ADMIN_PERMISSION_ENTITY` VALUES (-306,'org.broadleafcommerce.core.offer.domain.OfferTier',-10);
INSERT INTO `BLC_ADMIN_PERMISSION_ENTITY` VALUES (-305,'org.broadleafcommerce.core.offer.domain.OfferCode',-11);
INSERT INTO `BLC_ADMIN_PERMISSION_ENTITY` VALUES (-304,'org.broadleafcommerce.core.offer.domain.OfferCode',-10);
INSERT INTO `BLC_ADMIN_PERMISSION_ENTITY` VALUES (-303,'org.broadleafcommerce.core.offer.domain.OfferItemCriteria',-11);
INSERT INTO `BLC_ADMIN_PERMISSION_ENTITY` VALUES (-302,'org.broadleafcommerce.core.offer.domain.OfferItemCriteria',-10);
INSERT INTO `BLC_ADMIN_PERMISSION_ENTITY` VALUES (-301,'org.broadleafcommerce.core.offer.domain.Offer',-11);
INSERT INTO `BLC_ADMIN_PERMISSION_ENTITY` VALUES (-300,'org.broadleafcommerce.core.offer.domain.Offer',-10);
INSERT INTO `BLC_ADMIN_PERMISSION_ENTITY` VALUES (-251,'org.broadleafcommerce.core.catalog.domain.Sku',-9);
INSERT INTO `BLC_ADMIN_PERMISSION_ENTITY` VALUES (-250,'org.broadleafcommerce.core.catalog.domain.Sku',-8);
INSERT INTO `BLC_ADMIN_PERMISSION_ENTITY` VALUES (-207,'org.broadleafcommerce.core.catalog.domain.SkuProductOptionValueXref',-7);
INSERT INTO `BLC_ADMIN_PERMISSION_ENTITY` VALUES (-206,'org.broadleafcommerce.core.catalog.domain.SkuProductOptionValueXref',-6);
INSERT INTO `BLC_ADMIN_PERMISSION_ENTITY` VALUES (-205,'org.broadleafcommerce.core.catalog.domain.ProductOptionXref',-7);
INSERT INTO `BLC_ADMIN_PERMISSION_ENTITY` VALUES (-204,'org.broadleafcommerce.core.catalog.domain.ProductOptionXref',-6);
INSERT INTO `BLC_ADMIN_PERMISSION_ENTITY` VALUES (-203,'org.broadleafcommerce.core.catalog.domain.ProductOptionValue',-7);
INSERT INTO `BLC_ADMIN_PERMISSION_ENTITY` VALUES (-202,'org.broadleafcommerce.core.catalog.domain.ProductOptionValue',-6);
INSERT INTO `BLC_ADMIN_PERMISSION_ENTITY` VALUES (-201,'org.broadleafcommerce.core.catalog.domain.ProductOption',-7);
INSERT INTO `BLC_ADMIN_PERMISSION_ENTITY` VALUES (-200,'org.broadleafcommerce.core.catalog.domain.ProductOption',-6);
INSERT INTO `BLC_ADMIN_PERMISSION_ENTITY` VALUES (-183,'org.broadleafcommerce.core.offer.domain.AdvancedOfferPromotionMessageXref',-107);
INSERT INTO `BLC_ADMIN_PERMISSION_ENTITY` VALUES (-182,'org.broadleafcommerce.core.offer.domain.AdvancedOfferPromotionMessageXref',-106);
INSERT INTO `BLC_ADMIN_PERMISSION_ENTITY` VALUES (-181,'org.broadleafcommerce.core.promotionMessage.domain.PromotionMessage',-181);
INSERT INTO `BLC_ADMIN_PERMISSION_ENTITY` VALUES (-180,'org.broadleafcommerce.core.promotionMessage.domain.PromotionMessage',-180);
INSERT INTO `BLC_ADMIN_PERMISSION_ENTITY` VALUES (-107,'org.broadleafcommerce.core.catalog.domain.SkuBundleItemImpl',-5);
INSERT INTO `BLC_ADMIN_PERMISSION_ENTITY` VALUES (-106,'org.broadleafcommerce.core.catalog.domain.SkuBundleItemImpl',-4);
INSERT INTO `BLC_ADMIN_PERMISSION_ENTITY` VALUES (-105,'org.broadleafcommerce.core.catalog.domain.UpSaleProductImpl',-5);
INSERT INTO `BLC_ADMIN_PERMISSION_ENTITY` VALUES (-104,'org.broadleafcommerce.core.catalog.domain.UpSaleProductImpl',-4);
INSERT INTO `BLC_ADMIN_PERMISSION_ENTITY` VALUES (-103,'org.broadleafcommerce.core.catalog.domain.ProductAttribute',-5);
INSERT INTO `BLC_ADMIN_PERMISSION_ENTITY` VALUES (-102,'org.broadleafcommerce.core.catalog.domain.ProductAttribute',-4);
INSERT INTO `BLC_ADMIN_PERMISSION_ENTITY` VALUES (-101,'org.broadleafcommerce.core.catalog.domain.Product',-5);
INSERT INTO `BLC_ADMIN_PERMISSION_ENTITY` VALUES (-100,'org.broadleafcommerce.core.catalog.domain.Product',-4);
INSERT INTO `BLC_ADMIN_PERMISSION_ENTITY` VALUES (-14,'org.broadleafcommerce.core.catalog.domain.UpSaleProductImpl',-3);
INSERT INTO `BLC_ADMIN_PERMISSION_ENTITY` VALUES (-13,'org.broadleafcommerce.core.catalog.domain.UpSaleProductImpl',-2);
INSERT INTO `BLC_ADMIN_PERMISSION_ENTITY` VALUES (-12,'org.broadleafcommerce.core.catalog.domain.CrossSaleProductImpl',-3);
INSERT INTO `BLC_ADMIN_PERMISSION_ENTITY` VALUES (-11,'org.broadleafcommerce.core.catalog.domain.CrossSaleProductImpl',-2);
INSERT INTO `BLC_ADMIN_PERMISSION_ENTITY` VALUES (-10,'org.broadleafcommerce.core.catalog.domain.FeaturedProductImpl',-3);
INSERT INTO `BLC_ADMIN_PERMISSION_ENTITY` VALUES (-9,'org.broadleafcommerce.core.catalog.domain.FeaturedProductImpl',-2);
INSERT INTO `BLC_ADMIN_PERMISSION_ENTITY` VALUES (-8,'org.broadleafcommerce.core.catalog.domain.CategoryXrefImpl',-3);
INSERT INTO `BLC_ADMIN_PERMISSION_ENTITY` VALUES (-7,'org.broadleafcommerce.core.catalog.domain.CategoryXrefImpl',-2);
INSERT INTO `BLC_ADMIN_PERMISSION_ENTITY` VALUES (-6,'org.broadleafcommerce.core.catalog.domain.CategoryProductXrefImpl',-3);
INSERT INTO `BLC_ADMIN_PERMISSION_ENTITY` VALUES (-5,'org.broadleafcommerce.core.catalog.domain.CategoryProductXrefImpl',-2);
INSERT INTO `BLC_ADMIN_PERMISSION_ENTITY` VALUES (-4,'org.broadleafcommerce.core.catalog.domain.CategoryAttribute',-3);
INSERT INTO `BLC_ADMIN_PERMISSION_ENTITY` VALUES (-3,'org.broadleafcommerce.core.catalog.domain.CategoryAttribute',-2);
INSERT INTO `BLC_ADMIN_PERMISSION_ENTITY` VALUES (-2,'org.broadleafcommerce.core.catalog.domain.Category',-3);
INSERT INTO `BLC_ADMIN_PERMISSION_ENTITY` VALUES (-1,'org.broadleafcommerce.core.catalog.domain.Category',-2);
/*!40000 ALTER TABLE `BLC_ADMIN_PERMISSION_ENTITY` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `BLC_ADMIN_PERMISSION_XREF`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BLC_ADMIN_PERMISSION_XREF` (
  `CHILD_PERMISSION_ID` bigint(20) NOT NULL,
  `ADMIN_PERMISSION_ID` bigint(20) NOT NULL,
  KEY `FK1m3h00oqtternnpeiupslooan` (`ADMIN_PERMISSION_ID`),
  KEY `FK9gfarfrwe5wnew41w9oyd3j6y` (`CHILD_PERMISSION_ID`),
  CONSTRAINT `FK1m3h00oqtternnpeiupslooan` FOREIGN KEY (`ADMIN_PERMISSION_ID`) REFERENCES `BLC_ADMIN_PERMISSION` (`ADMIN_PERMISSION_ID`),
  CONSTRAINT `FK9gfarfrwe5wnew41w9oyd3j6y` FOREIGN KEY (`CHILD_PERMISSION_ID`) REFERENCES `BLC_ADMIN_PERMISSION` (`ADMIN_PERMISSION_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `BLC_ADMIN_PERMISSION_XREF` WRITE;
/*!40000 ALTER TABLE `BLC_ADMIN_PERMISSION_XREF` DISABLE KEYS */;
INSERT INTO `BLC_ADMIN_PERMISSION_XREF` VALUES (-2,-100);
INSERT INTO `BLC_ADMIN_PERMISSION_XREF` VALUES (-4,-100);
INSERT INTO `BLC_ADMIN_PERMISSION_XREF` VALUES (-32,-100);
INSERT INTO `BLC_ADMIN_PERMISSION_XREF` VALUES (-53,-100);
INSERT INTO `BLC_ADMIN_PERMISSION_XREF` VALUES (-3,-101);
INSERT INTO `BLC_ADMIN_PERMISSION_XREF` VALUES (-4,-101);
INSERT INTO `BLC_ADMIN_PERMISSION_XREF` VALUES (-32,-101);
INSERT INTO `BLC_ADMIN_PERMISSION_XREF` VALUES (-53,-101);
INSERT INTO `BLC_ADMIN_PERMISSION_XREF` VALUES (-4,-102);
INSERT INTO `BLC_ADMIN_PERMISSION_XREF` VALUES (-6,-102);
INSERT INTO `BLC_ADMIN_PERMISSION_XREF` VALUES (-8,-102);
INSERT INTO `BLC_ADMIN_PERMISSION_XREF` VALUES (-34,-102);
INSERT INTO `BLC_ADMIN_PERMISSION_XREF` VALUES (-53,-101);
INSERT INTO `BLC_ADMIN_PERMISSION_XREF` VALUES (-5,-103);
INSERT INTO `BLC_ADMIN_PERMISSION_XREF` VALUES (-6,-103);
INSERT INTO `BLC_ADMIN_PERMISSION_XREF` VALUES (-9,-103);
INSERT INTO `BLC_ADMIN_PERMISSION_XREF` VALUES (-34,-103);
INSERT INTO `BLC_ADMIN_PERMISSION_XREF` VALUES (-53,-103);
INSERT INTO `BLC_ADMIN_PERMISSION_XREF` VALUES (-6,-104);
INSERT INTO `BLC_ADMIN_PERMISSION_XREF` VALUES (-32,-104);
INSERT INTO `BLC_ADMIN_PERMISSION_XREF` VALUES (-53,-104);
INSERT INTO `BLC_ADMIN_PERMISSION_XREF` VALUES (-7,-105);
INSERT INTO `BLC_ADMIN_PERMISSION_XREF` VALUES (-32,-105);
INSERT INTO `BLC_ADMIN_PERMISSION_XREF` VALUES (-53,-105);
INSERT INTO `BLC_ADMIN_PERMISSION_XREF` VALUES (-10,-106);
INSERT INTO `BLC_ADMIN_PERMISSION_XREF` VALUES (-53,-106);
INSERT INTO `BLC_ADMIN_PERMISSION_XREF` VALUES (-11,-107);
INSERT INTO `BLC_ADMIN_PERMISSION_XREF` VALUES (-53,-106);
INSERT INTO `BLC_ADMIN_PERMISSION_XREF` VALUES (-20,-108);
INSERT INTO `BLC_ADMIN_PERMISSION_XREF` VALUES (-200,-108);
INSERT INTO `BLC_ADMIN_PERMISSION_XREF` VALUES (-21,-109);
INSERT INTO `BLC_ADMIN_PERMISSION_XREF` VALUES (-200,-109);
INSERT INTO `BLC_ADMIN_PERMISSION_XREF` VALUES (-22,-110);
INSERT INTO `BLC_ADMIN_PERMISSION_XREF` VALUES (-23,-111);
INSERT INTO `BLC_ADMIN_PERMISSION_XREF` VALUES (-28,-114);
INSERT INTO `BLC_ADMIN_PERMISSION_XREF` VALUES (-29,-115);
INSERT INTO `BLC_ADMIN_PERMISSION_XREF` VALUES (-18,-118);
INSERT INTO `BLC_ADMIN_PERMISSION_XREF` VALUES (-19,-119);
INSERT INTO `BLC_ADMIN_PERMISSION_XREF` VALUES (-26,-120);
INSERT INTO `BLC_ADMIN_PERMISSION_XREF` VALUES (-46,-120);
INSERT INTO `BLC_ADMIN_PERMISSION_XREF` VALUES (-48,-120);
INSERT INTO `BLC_ADMIN_PERMISSION_XREF` VALUES (-27,-121);
INSERT INTO `BLC_ADMIN_PERMISSION_XREF` VALUES (-46,-120);
INSERT INTO `BLC_ADMIN_PERMISSION_XREF` VALUES (-48,-120);
INSERT INTO `BLC_ADMIN_PERMISSION_XREF` VALUES (-36,-126);
INSERT INTO `BLC_ADMIN_PERMISSION_XREF` VALUES (-37,-127);
INSERT INTO `BLC_ADMIN_PERMISSION_XREF` VALUES (-40,-130);
INSERT INTO `BLC_ADMIN_PERMISSION_XREF` VALUES (-41,-131);
INSERT INTO `BLC_ADMIN_PERMISSION_XREF` VALUES (-46,-140);
INSERT INTO `BLC_ADMIN_PERMISSION_XREF` VALUES (-48,-140);
INSERT INTO `BLC_ADMIN_PERMISSION_XREF` VALUES (-47,-141);
INSERT INTO `BLC_ADMIN_PERMISSION_XREF` VALUES (-48,-141);
INSERT INTO `BLC_ADMIN_PERMISSION_XREF` VALUES (-48,-150);
INSERT INTO `BLC_ADMIN_PERMISSION_XREF` VALUES (-49,-151);
INSERT INTO `BLC_ADMIN_PERMISSION_XREF` VALUES (-50,-160);
INSERT INTO `BLC_ADMIN_PERMISSION_XREF` VALUES (-51,-161);
INSERT INTO `BLC_ADMIN_PERMISSION_XREF` VALUES (-180,-106);
INSERT INTO `BLC_ADMIN_PERMISSION_XREF` VALUES (-181,-107);
INSERT INTO `BLC_ADMIN_PERMISSION_XREF` VALUES (-27000,-27002);
INSERT INTO `BLC_ADMIN_PERMISSION_XREF` VALUES (-27001,-27003);
/*!40000 ALTER TABLE `BLC_ADMIN_PERMISSION_XREF` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `BLC_ADMIN_ROLE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BLC_ADMIN_ROLE` (
  `ADMIN_ROLE_ID` bigint(20) NOT NULL,
  `DESCRIPTION` varchar(255) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  PRIMARY KEY (`ADMIN_ROLE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `BLC_ADMIN_ROLE` WRITE;
/*!40000 ALTER TABLE `BLC_ADMIN_ROLE` DISABLE KEYS */;
INSERT INTO `BLC_ADMIN_ROLE` VALUES (-7,'CMS Designer','ROLE_CONTENT_DESIGNER');
INSERT INTO `BLC_ADMIN_ROLE` VALUES (-6,'CMS Approver','ROLE_CONTENT_APPROVER');
INSERT INTO `BLC_ADMIN_ROLE` VALUES (-5,'CMS Editor','ROLE_CONTENT_EDITOR');
INSERT INTO `BLC_ADMIN_ROLE` VALUES (-4,'CSR','ROLE_CUSTOMER_SERVICE_REP');
INSERT INTO `BLC_ADMIN_ROLE` VALUES (-3,'Promotion Manager','ROLE_PROMOTION_MANAGER');
INSERT INTO `BLC_ADMIN_ROLE` VALUES (-2,'Merchandiser','ROLE_MERCHANDISE_MANAGER');
INSERT INTO `BLC_ADMIN_ROLE` VALUES (-1,'Admin Master Access','ROLE_ADMIN');
/*!40000 ALTER TABLE `BLC_ADMIN_ROLE` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `BLC_ADMIN_ROLE_PERMISSION_XREF`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BLC_ADMIN_ROLE_PERMISSION_XREF` (
  `ADMIN_ROLE_ID` bigint(20) NOT NULL,
  `ADMIN_PERMISSION_ID` bigint(20) NOT NULL,
  PRIMARY KEY (`ADMIN_PERMISSION_ID`,`ADMIN_ROLE_ID`),
  KEY `FKl1jm8qymrs3laxvyawcb7mlbt` (`ADMIN_ROLE_ID`),
  CONSTRAINT `FKl1jm8qymrs3laxvyawcb7mlbt` FOREIGN KEY (`ADMIN_ROLE_ID`) REFERENCES `BLC_ADMIN_ROLE` (`ADMIN_ROLE_ID`),
  CONSTRAINT `FKoj1ji2ummmtfdm0xb9jesi7g` FOREIGN KEY (`ADMIN_PERMISSION_ID`) REFERENCES `BLC_ADMIN_PERMISSION` (`ADMIN_PERMISSION_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `BLC_ADMIN_ROLE_PERMISSION_XREF` WRITE;
/*!40000 ALTER TABLE `BLC_ADMIN_ROLE_PERMISSION_XREF` DISABLE KEYS */;
INSERT INTO `BLC_ADMIN_ROLE_PERMISSION_XREF` VALUES (-6,-111);
INSERT INTO `BLC_ADMIN_ROLE_PERMISSION_XREF` VALUES (-6,-109);
INSERT INTO `BLC_ADMIN_ROLE_PERMISSION_XREF` VALUES (-5,-27003);
INSERT INTO `BLC_ADMIN_ROLE_PERMISSION_XREF` VALUES (-5,-161);
INSERT INTO `BLC_ADMIN_ROLE_PERMISSION_XREF` VALUES (-5,-131);
INSERT INTO `BLC_ADMIN_ROLE_PERMISSION_XREF` VALUES (-5,-111);
INSERT INTO `BLC_ADMIN_ROLE_PERMISSION_XREF` VALUES (-5,-109);
INSERT INTO `BLC_ADMIN_ROLE_PERMISSION_XREF` VALUES (-4,-119);
INSERT INTO `BLC_ADMIN_ROLE_PERMISSION_XREF` VALUES (-3,-131);
INSERT INTO `BLC_ADMIN_ROLE_PERMISSION_XREF` VALUES (-3,-107);
INSERT INTO `BLC_ADMIN_ROLE_PERMISSION_XREF` VALUES (-2,-131);
INSERT INTO `BLC_ADMIN_ROLE_PERMISSION_XREF` VALUES (-2,-111);
INSERT INTO `BLC_ADMIN_ROLE_PERMISSION_XREF` VALUES (-2,-105);
INSERT INTO `BLC_ADMIN_ROLE_PERMISSION_XREF` VALUES (-2,-103);
INSERT INTO `BLC_ADMIN_ROLE_PERMISSION_XREF` VALUES (-2,-101);
INSERT INTO `BLC_ADMIN_ROLE_PERMISSION_XREF` VALUES (-1,-27003);
INSERT INTO `BLC_ADMIN_ROLE_PERMISSION_XREF` VALUES (-1,-181);
INSERT INTO `BLC_ADMIN_ROLE_PERMISSION_XREF` VALUES (-1,-161);
INSERT INTO `BLC_ADMIN_ROLE_PERMISSION_XREF` VALUES (-1,-141);
INSERT INTO `BLC_ADMIN_ROLE_PERMISSION_XREF` VALUES (-1,-131);
INSERT INTO `BLC_ADMIN_ROLE_PERMISSION_XREF` VALUES (-1,-121);
INSERT INTO `BLC_ADMIN_ROLE_PERMISSION_XREF` VALUES (-1,-119);
INSERT INTO `BLC_ADMIN_ROLE_PERMISSION_XREF` VALUES (-1,-115);
INSERT INTO `BLC_ADMIN_ROLE_PERMISSION_XREF` VALUES (-1,-111);
INSERT INTO `BLC_ADMIN_ROLE_PERMISSION_XREF` VALUES (-1,-109);
INSERT INTO `BLC_ADMIN_ROLE_PERMISSION_XREF` VALUES (-1,-107);
INSERT INTO `BLC_ADMIN_ROLE_PERMISSION_XREF` VALUES (-1,-105);
INSERT INTO `BLC_ADMIN_ROLE_PERMISSION_XREF` VALUES (-1,-103);
INSERT INTO `BLC_ADMIN_ROLE_PERMISSION_XREF` VALUES (-1,-101);
/*!40000 ALTER TABLE `BLC_ADMIN_ROLE_PERMISSION_XREF` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `BLC_ADMIN_SECTION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BLC_ADMIN_SECTION` (
  `ADMIN_SECTION_ID` bigint(20) NOT NULL,
  `CEILING_ENTITY` varchar(255) DEFAULT NULL,
  `DISPLAY_CONTROLLER` varchar(255) DEFAULT NULL,
  `DISPLAY_ORDER` int(11) DEFAULT NULL,
  `NAME` varchar(255) NOT NULL,
  `SECTION_KEY` varchar(255) NOT NULL,
  `URL` varchar(255) DEFAULT NULL,
  `USE_DEFAULT_HANDLER` bit(1) DEFAULT NULL,
  `ADMIN_MODULE_ID` bigint(20) NOT NULL,
  PRIMARY KEY (`ADMIN_SECTION_ID`),
  UNIQUE KEY `UK_2l8u0qyluf4fwp2iiqp3p4jrn` (`SECTION_KEY`),
  KEY `ADMINSECTION_MODULE_INDEX` (`ADMIN_MODULE_ID`),
  KEY `ADMINSECTION_NAME_INDEX` (`NAME`),
  CONSTRAINT `FK2gpd1e839i00bosr6e54mdnn2` FOREIGN KEY (`ADMIN_MODULE_ID`) REFERENCES `BLC_ADMIN_MODULE` (`ADMIN_MODULE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `BLC_ADMIN_SECTION` WRITE;
/*!40000 ALTER TABLE `BLC_ADMIN_SECTION` DISABLE KEYS */;
INSERT INTO `BLC_ADMIN_SECTION` VALUES (-27000,'org.broadleafcommerce.menu.domain.Menu',NULL,3000,'Menus','Menus','/menu',_binary '',-2);
INSERT INTO `BLC_ADMIN_SECTION` VALUES (-99,'org.broadleafcommerce.core.catalog.domain.Product',NULL,3000,'Base Product','Base Product','/product:product',NULL,-1);
INSERT INTO `BLC_ADMIN_SECTION` VALUES (-17,'org.broadleafcommerce.openadmin.server.security.domain.AdminPermission',NULL,11000,'Permission Management','PermissionManagement','/permission-management',NULL,-5);
INSERT INTO `BLC_ADMIN_SECTION` VALUES (-13,'org.broadleafcommerce.common.config.domain.ModuleConfiguration',NULL,10000,'Configuration Management','ConfigurationManagement','/configuration-management',NULL,-5);
INSERT INTO `BLC_ADMIN_SECTION` VALUES (-12,'org.broadleafcommerce.openadmin.server.security.domain.AdminRole',NULL,3000,'Role Management','RoleManagement','/role-management',NULL,-5);
INSERT INTO `BLC_ADMIN_SECTION` VALUES (-11,'org.broadleafcommerce.openadmin.server.security.domain.AdminUser',NULL,2000,'User Management','UserManagement','/user-management',NULL,-5);
INSERT INTO `BLC_ADMIN_SECTION` VALUES (-10,'org.broadleafcommerce.profile.core.domain.Customer',NULL,1000,'Customer','Customer','/customer',NULL,-3);
INSERT INTO `BLC_ADMIN_SECTION` VALUES (-8,'org.broadleafcommerce.cms.url.domain.URLHandler',NULL,7000,'Redirect URL','RedirectURL','/redirect-url',NULL,-2);
INSERT INTO `BLC_ADMIN_SECTION` VALUES (-6,'org.broadleafcommerce.cms.file.domain.StaticAsset',NULL,4000,'Assets','Assets','/assets',NULL,-2);
INSERT INTO `BLC_ADMIN_SECTION` VALUES (-5,'org.broadleafcommerce.cms.page.domain.Page',NULL,2000,'Pages','Pages','/pages',NULL,-2);
INSERT INTO `BLC_ADMIN_SECTION` VALUES (-4,'org.broadleafcommerce.core.offer.domain.Offer',NULL,1000,'Offer','Offer','/offer',NULL,-8);
INSERT INTO `BLC_ADMIN_SECTION` VALUES (-3,'org.broadleafcommerce.core.catalog.domain.ProductOption',NULL,5000,'Product Options','ProductOptions','/product-options',NULL,-1);
INSERT INTO `BLC_ADMIN_SECTION` VALUES (-2,'org.broadleafcommerce.core.catalog.domain.Product',NULL,3000,'All Products','All Products','/product',NULL,-1);
INSERT INTO `BLC_ADMIN_SECTION` VALUES (-1,'org.broadleafcommerce.core.catalog.domain.Category',NULL,2000,'Category','Category','/category',NULL,-1);
/*!40000 ALTER TABLE `BLC_ADMIN_SECTION` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `BLC_ADMIN_SEC_PERM_XREF`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BLC_ADMIN_SEC_PERM_XREF` (
  `ADMIN_SECTION_ID` bigint(20) NOT NULL,
  `ADMIN_PERMISSION_ID` bigint(20) NOT NULL,
  KEY `FKns2d7kvauk8kgskridssn1gcv` (`ADMIN_PERMISSION_ID`),
  KEY `FK3k1buujb5let82ixj1k9nha3r` (`ADMIN_SECTION_ID`),
  CONSTRAINT `FK3k1buujb5let82ixj1k9nha3r` FOREIGN KEY (`ADMIN_SECTION_ID`) REFERENCES `BLC_ADMIN_SECTION` (`ADMIN_SECTION_ID`),
  CONSTRAINT `FKns2d7kvauk8kgskridssn1gcv` FOREIGN KEY (`ADMIN_PERMISSION_ID`) REFERENCES `BLC_ADMIN_PERMISSION` (`ADMIN_PERMISSION_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `BLC_ADMIN_SEC_PERM_XREF` WRITE;
/*!40000 ALTER TABLE `BLC_ADMIN_SEC_PERM_XREF` DISABLE KEYS */;
INSERT INTO `BLC_ADMIN_SEC_PERM_XREF` VALUES (-1,-100);
INSERT INTO `BLC_ADMIN_SEC_PERM_XREF` VALUES (-1,-101);
INSERT INTO `BLC_ADMIN_SEC_PERM_XREF` VALUES (-2,-102);
INSERT INTO `BLC_ADMIN_SEC_PERM_XREF` VALUES (-2,-103);
INSERT INTO `BLC_ADMIN_SEC_PERM_XREF` VALUES (-99,-100);
INSERT INTO `BLC_ADMIN_SEC_PERM_XREF` VALUES (-99,-101);
INSERT INTO `BLC_ADMIN_SEC_PERM_XREF` VALUES (-3,-104);
INSERT INTO `BLC_ADMIN_SEC_PERM_XREF` VALUES (-3,-105);
INSERT INTO `BLC_ADMIN_SEC_PERM_XREF` VALUES (-4,-106);
INSERT INTO `BLC_ADMIN_SEC_PERM_XREF` VALUES (-4,-107);
INSERT INTO `BLC_ADMIN_SEC_PERM_XREF` VALUES (-5,-108);
INSERT INTO `BLC_ADMIN_SEC_PERM_XREF` VALUES (-5,-109);
INSERT INTO `BLC_ADMIN_SEC_PERM_XREF` VALUES (-6,-110);
INSERT INTO `BLC_ADMIN_SEC_PERM_XREF` VALUES (-6,-111);
INSERT INTO `BLC_ADMIN_SEC_PERM_XREF` VALUES (-8,-114);
INSERT INTO `BLC_ADMIN_SEC_PERM_XREF` VALUES (-8,-115);
INSERT INTO `BLC_ADMIN_SEC_PERM_XREF` VALUES (-10,-118);
INSERT INTO `BLC_ADMIN_SEC_PERM_XREF` VALUES (-10,-119);
INSERT INTO `BLC_ADMIN_SEC_PERM_XREF` VALUES (-11,-120);
INSERT INTO `BLC_ADMIN_SEC_PERM_XREF` VALUES (-11,-121);
INSERT INTO `BLC_ADMIN_SEC_PERM_XREF` VALUES (-12,-140);
INSERT INTO `BLC_ADMIN_SEC_PERM_XREF` VALUES (-12,-141);
INSERT INTO `BLC_ADMIN_SEC_PERM_XREF` VALUES (-13,-126);
INSERT INTO `BLC_ADMIN_SEC_PERM_XREF` VALUES (-13,-127);
INSERT INTO `BLC_ADMIN_SEC_PERM_XREF` VALUES (-17,-150);
INSERT INTO `BLC_ADMIN_SEC_PERM_XREF` VALUES (-17,-151);
INSERT INTO `BLC_ADMIN_SEC_PERM_XREF` VALUES (-27000,-27002);
INSERT INTO `BLC_ADMIN_SEC_PERM_XREF` VALUES (-27000,-27003);
/*!40000 ALTER TABLE `BLC_ADMIN_SEC_PERM_XREF` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `BLC_ADMIN_USER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BLC_ADMIN_USER` (
  `ADMIN_USER_ID` bigint(20) NOT NULL,
  `ACTIVE_STATUS_FLAG` bit(1) DEFAULT NULL,
  `EMAIL` varchar(255) NOT NULL,
  `LOGIN` varchar(255) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `PASSWORD` varchar(255) DEFAULT NULL,
  `PHONE_NUMBER` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ADMIN_USER_ID`),
  KEY `ADMINPERM_EMAIL_INDEX` (`EMAIL`),
  KEY `ADMINUSER_NAME_INDEX` (`NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `BLC_ADMIN_USER` WRITE;
/*!40000 ALTER TABLE `BLC_ADMIN_USER` DISABLE KEYS */;
INSERT INTO `BLC_ADMIN_USER` VALUES (-1,_binary '','admin@yourdomain.com','admin','Administrator','admin',NULL);
/*!40000 ALTER TABLE `BLC_ADMIN_USER` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `BLC_ADMIN_USER_ADDTL_FIELDS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BLC_ADMIN_USER_ADDTL_FIELDS` (
  `ATTRIBUTE_ID` bigint(20) NOT NULL,
  `FIELD_NAME` varchar(255) NOT NULL,
  `FIELD_VALUE` varchar(255) DEFAULT NULL,
  `ADMIN_USER_ID` bigint(20) NOT NULL,
  PRIMARY KEY (`ATTRIBUTE_ID`),
  KEY `ADMINUSERATTRIBUTE_INDEX` (`ADMIN_USER_ID`),
  KEY `ADMINUSERATTRIBUTE_NAME_INDEX` (`FIELD_NAME`),
  CONSTRAINT `FKiiateds21bej9b6qvrom06ayr` FOREIGN KEY (`ADMIN_USER_ID`) REFERENCES `BLC_ADMIN_USER` (`ADMIN_USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `BLC_ADMIN_USER_ADDTL_FIELDS` WRITE;
/*!40000 ALTER TABLE `BLC_ADMIN_USER_ADDTL_FIELDS` DISABLE KEYS */;
/*!40000 ALTER TABLE `BLC_ADMIN_USER_ADDTL_FIELDS` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `BLC_ADMIN_USER_PERMISSION_XREF`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BLC_ADMIN_USER_PERMISSION_XREF` (
  `ADMIN_USER_ID` bigint(20) NOT NULL,
  `ADMIN_PERMISSION_ID` bigint(20) NOT NULL,
  PRIMARY KEY (`ADMIN_PERMISSION_ID`,`ADMIN_USER_ID`),
  KEY `FKj7ms4sgplv582id7ftu4thyn3` (`ADMIN_USER_ID`),
  CONSTRAINT `FK8ia4c6mqqvm9pt1aghjbvdmtb` FOREIGN KEY (`ADMIN_PERMISSION_ID`) REFERENCES `BLC_ADMIN_PERMISSION` (`ADMIN_PERMISSION_ID`),
  CONSTRAINT `FKj7ms4sgplv582id7ftu4thyn3` FOREIGN KEY (`ADMIN_USER_ID`) REFERENCES `BLC_ADMIN_USER` (`ADMIN_USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `BLC_ADMIN_USER_PERMISSION_XREF` WRITE;
/*!40000 ALTER TABLE `BLC_ADMIN_USER_PERMISSION_XREF` DISABLE KEYS */;
/*!40000 ALTER TABLE `BLC_ADMIN_USER_PERMISSION_XREF` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `BLC_ADMIN_USER_ROLE_XREF`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BLC_ADMIN_USER_ROLE_XREF` (
  `ADMIN_USER_ID` bigint(20) NOT NULL,
  `ADMIN_ROLE_ID` bigint(20) NOT NULL,
  PRIMARY KEY (`ADMIN_ROLE_ID`,`ADMIN_USER_ID`),
  KEY `FKa48q2nut9wd1cktfjp3l2f3xv` (`ADMIN_USER_ID`),
  CONSTRAINT `FK4skhb24d5kego6i7iw4y1a448` FOREIGN KEY (`ADMIN_ROLE_ID`) REFERENCES `BLC_ADMIN_ROLE` (`ADMIN_ROLE_ID`),
  CONSTRAINT `FKa48q2nut9wd1cktfjp3l2f3xv` FOREIGN KEY (`ADMIN_USER_ID`) REFERENCES `BLC_ADMIN_USER` (`ADMIN_USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `BLC_ADMIN_USER_ROLE_XREF` WRITE;
/*!40000 ALTER TABLE `BLC_ADMIN_USER_ROLE_XREF` DISABLE KEYS */;
INSERT INTO `BLC_ADMIN_USER_ROLE_XREF` VALUES (-1,-1);
/*!40000 ALTER TABLE `BLC_ADMIN_USER_ROLE_XREF` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `BLC_ADMIN_USER_SANDBOX`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BLC_ADMIN_USER_SANDBOX` (
  `SANDBOX_ID` bigint(20) DEFAULT NULL,
  `ADMIN_USER_ID` bigint(20) NOT NULL,
  PRIMARY KEY (`ADMIN_USER_ID`),
  KEY `FKehxq8fct257ml7j0rbya7ripb` (`SANDBOX_ID`),
  CONSTRAINT `FKay43c311x89bqu7lbswc7xan6` FOREIGN KEY (`ADMIN_USER_ID`) REFERENCES `BLC_ADMIN_USER` (`ADMIN_USER_ID`),
  CONSTRAINT `FKehxq8fct257ml7j0rbya7ripb` FOREIGN KEY (`SANDBOX_ID`) REFERENCES `BLC_SANDBOX` (`SANDBOX_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `BLC_ADMIN_USER_SANDBOX` WRITE;
/*!40000 ALTER TABLE `BLC_ADMIN_USER_SANDBOX` DISABLE KEYS */;
/*!40000 ALTER TABLE `BLC_ADMIN_USER_SANDBOX` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `BLC_ASSET_DESC_MAP`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BLC_ASSET_DESC_MAP` (
  `STATIC_ASSET_ID` bigint(20) NOT NULL,
  `STATIC_ASSET_DESC_ID` bigint(20) NOT NULL,
  `MAP_KEY` varchar(255) NOT NULL,
  PRIMARY KEY (`STATIC_ASSET_ID`,`MAP_KEY`),
  KEY `FKheybfelcjp3ave1pxgmjl78eo` (`STATIC_ASSET_DESC_ID`),
  CONSTRAINT `FKheybfelcjp3ave1pxgmjl78eo` FOREIGN KEY (`STATIC_ASSET_DESC_ID`) REFERENCES `BLC_STATIC_ASSET_DESC` (`STATIC_ASSET_DESC_ID`),
  CONSTRAINT `FKhrepj8vehjv59lcn3xbiq7ays` FOREIGN KEY (`STATIC_ASSET_ID`) REFERENCES `BLC_STATIC_ASSET` (`STATIC_ASSET_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `BLC_ASSET_DESC_MAP` WRITE;
/*!40000 ALTER TABLE `BLC_ASSET_DESC_MAP` DISABLE KEYS */;
/*!40000 ALTER TABLE `BLC_ASSET_DESC_MAP` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `BLC_BANK_ACCOUNT_PAYMENT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BLC_BANK_ACCOUNT_PAYMENT` (
  `PAYMENT_ID` bigint(20) NOT NULL,
  `ACCOUNT_NUMBER` varchar(255) NOT NULL,
  `REFERENCE_NUMBER` varchar(255) NOT NULL,
  `ROUTING_NUMBER` varchar(255) NOT NULL,
  PRIMARY KEY (`PAYMENT_ID`),
  KEY `BANKACCOUNT_INDEX` (`REFERENCE_NUMBER`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `BLC_BANK_ACCOUNT_PAYMENT` WRITE;
/*!40000 ALTER TABLE `BLC_BANK_ACCOUNT_PAYMENT` DISABLE KEYS */;
/*!40000 ALTER TABLE `BLC_BANK_ACCOUNT_PAYMENT` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `BLC_BUNDLE_ORDER_ITEM`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BLC_BUNDLE_ORDER_ITEM` (
  `BASE_RETAIL_PRICE` decimal(19,5) DEFAULT NULL,
  `BASE_SALE_PRICE` decimal(19,5) DEFAULT NULL,
  `ORDER_ITEM_ID` bigint(20) NOT NULL,
  `PRODUCT_BUNDLE_ID` bigint(20) DEFAULT NULL,
  `SKU_ID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`ORDER_ITEM_ID`),
  KEY `FKo17ovssehxe4y3b38xjxodmrq` (`PRODUCT_BUNDLE_ID`),
  KEY `FKepomqf1wy0rsw6utuc5r7gflq` (`SKU_ID`),
  CONSTRAINT `FKepomqf1wy0rsw6utuc5r7gflq` FOREIGN KEY (`SKU_ID`) REFERENCES `BLC_SKU` (`SKU_ID`),
  CONSTRAINT `FKhbcblyyh5lfrmrt1avy8wajgx` FOREIGN KEY (`ORDER_ITEM_ID`) REFERENCES `BLC_ORDER_ITEM` (`ORDER_ITEM_ID`),
  CONSTRAINT `FKo17ovssehxe4y3b38xjxodmrq` FOREIGN KEY (`PRODUCT_BUNDLE_ID`) REFERENCES `BLC_PRODUCT_BUNDLE` (`PRODUCT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `BLC_BUNDLE_ORDER_ITEM` WRITE;
/*!40000 ALTER TABLE `BLC_BUNDLE_ORDER_ITEM` DISABLE KEYS */;
/*!40000 ALTER TABLE `BLC_BUNDLE_ORDER_ITEM` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `BLC_BUND_ITEM_FEE_PRICE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BLC_BUND_ITEM_FEE_PRICE` (
  `BUND_ITEM_FEE_PRICE_ID` bigint(20) NOT NULL,
  `AMOUNT` decimal(19,5) DEFAULT NULL,
  `IS_TAXABLE` bit(1) DEFAULT NULL,
  `NAME` varchar(255) DEFAULT NULL,
  `REPORTING_CODE` varchar(255) DEFAULT NULL,
  `BUND_ORDER_ITEM_ID` bigint(20) NOT NULL,
  PRIMARY KEY (`BUND_ITEM_FEE_PRICE_ID`),
  KEY `FKmlwh6qvntrxs81h26syrft6bj` (`BUND_ORDER_ITEM_ID`),
  CONSTRAINT `FKmlwh6qvntrxs81h26syrft6bj` FOREIGN KEY (`BUND_ORDER_ITEM_ID`) REFERENCES `BLC_BUNDLE_ORDER_ITEM` (`ORDER_ITEM_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `BLC_BUND_ITEM_FEE_PRICE` WRITE;
/*!40000 ALTER TABLE `BLC_BUND_ITEM_FEE_PRICE` DISABLE KEYS */;
/*!40000 ALTER TABLE `BLC_BUND_ITEM_FEE_PRICE` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `BLC_CANDIDATE_FG_OFFER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BLC_CANDIDATE_FG_OFFER` (
  `CANDIDATE_FG_OFFER_ID` bigint(20) NOT NULL,
  `DISCOUNTED_PRICE` decimal(19,5) DEFAULT NULL,
  `FULFILLMENT_GROUP_ID` bigint(20) DEFAULT NULL,
  `OFFER_ID` bigint(20) NOT NULL,
  PRIMARY KEY (`CANDIDATE_FG_OFFER_ID`),
  KEY `CANDIDATE_FG_INDEX` (`FULFILLMENT_GROUP_ID`),
  KEY `CANDIDATE_FGOFFER_INDEX` (`OFFER_ID`),
  CONSTRAINT `FKg5qmns7vl5e1pu96axl8uknal` FOREIGN KEY (`OFFER_ID`) REFERENCES `BLC_OFFER` (`OFFER_ID`),
  CONSTRAINT `FKh9csft0rxeopd0s4in7qp15am` FOREIGN KEY (`FULFILLMENT_GROUP_ID`) REFERENCES `BLC_FULFILLMENT_GROUP` (`FULFILLMENT_GROUP_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `BLC_CANDIDATE_FG_OFFER` WRITE;
/*!40000 ALTER TABLE `BLC_CANDIDATE_FG_OFFER` DISABLE KEYS */;
/*!40000 ALTER TABLE `BLC_CANDIDATE_FG_OFFER` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `BLC_CANDIDATE_ITEM_OFFER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BLC_CANDIDATE_ITEM_OFFER` (
  `CANDIDATE_ITEM_OFFER_ID` bigint(20) NOT NULL,
  `DISCOUNTED_PRICE` decimal(19,5) DEFAULT NULL,
  `OFFER_ID` bigint(20) NOT NULL,
  `ORDER_ITEM_ID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`CANDIDATE_ITEM_OFFER_ID`),
  KEY `CANDIDATE_ITEMOFFER_INDEX` (`OFFER_ID`),
  KEY `CANDIDATE_ITEM_INDEX` (`ORDER_ITEM_ID`),
  CONSTRAINT `FKb14jq3w7049s1h61pthy51m92` FOREIGN KEY (`ORDER_ITEM_ID`) REFERENCES `BLC_ORDER_ITEM` (`ORDER_ITEM_ID`),
  CONSTRAINT `FKno8jmqw67ef9lpuwoumdyh7wj` FOREIGN KEY (`OFFER_ID`) REFERENCES `BLC_OFFER` (`OFFER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `BLC_CANDIDATE_ITEM_OFFER` WRITE;
/*!40000 ALTER TABLE `BLC_CANDIDATE_ITEM_OFFER` DISABLE KEYS */;
/*!40000 ALTER TABLE `BLC_CANDIDATE_ITEM_OFFER` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `BLC_CANDIDATE_ORDER_OFFER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BLC_CANDIDATE_ORDER_OFFER` (
  `CANDIDATE_ORDER_OFFER_ID` bigint(20) NOT NULL,
  `DISCOUNTED_PRICE` decimal(19,5) DEFAULT NULL,
  `OFFER_ID` bigint(20) NOT NULL,
  `ORDER_ID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`CANDIDATE_ORDER_OFFER_ID`),
  KEY `CANDIDATE_ORDEROFFER_INDEX` (`OFFER_ID`),
  KEY `CANDIDATE_ORDER_INDEX` (`ORDER_ID`),
  CONSTRAINT `FK59se4s0394sw56c1rvdw5aepf` FOREIGN KEY (`ORDER_ID`) REFERENCES `BLC_ORDER` (`ORDER_ID`),
  CONSTRAINT `FK7ckpnvor07qankv258p1vxwww` FOREIGN KEY (`OFFER_ID`) REFERENCES `BLC_OFFER` (`OFFER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `BLC_CANDIDATE_ORDER_OFFER` WRITE;
/*!40000 ALTER TABLE `BLC_CANDIDATE_ORDER_OFFER` DISABLE KEYS */;
/*!40000 ALTER TABLE `BLC_CANDIDATE_ORDER_OFFER` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `BLC_CATALOG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BLC_CATALOG` (
  `CATALOG_ID` bigint(20) NOT NULL,
  `ARCHIVED` char(1) DEFAULT NULL,
  `NAME` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`CATALOG_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `BLC_CATALOG` WRITE;
/*!40000 ALTER TABLE `BLC_CATALOG` DISABLE KEYS */;
/*!40000 ALTER TABLE `BLC_CATALOG` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `BLC_CATEGORY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BLC_CATEGORY` (
  `CATEGORY_ID` bigint(20) NOT NULL,
  `ACTIVE_END_DATE` datetime DEFAULT NULL,
  `ACTIVE_START_DATE` datetime DEFAULT NULL,
  `ARCHIVED` char(1) DEFAULT NULL,
  `DESCRIPTION` varchar(255) DEFAULT NULL,
  `DISPLAY_TEMPLATE` varchar(255) DEFAULT NULL,
  `EXTERNAL_ID` varchar(255) DEFAULT NULL,
  `FULFILLMENT_TYPE` varchar(255) DEFAULT NULL,
  `INVENTORY_TYPE` varchar(255) DEFAULT NULL,
  `LONG_DESCRIPTION` longtext,
  `META_DESC` varchar(255) DEFAULT NULL,
  `META_TITLE` varchar(255) DEFAULT NULL,
  `NAME` varchar(255) NOT NULL,
  `OVERRIDE_GENERATED_URL` bit(1) DEFAULT NULL,
  `PRODUCT_DESC_PATTERN_OVERRIDE` varchar(255) DEFAULT NULL,
  `PRODUCT_TITLE_PATTERN_OVERRIDE` varchar(255) DEFAULT NULL,
  `ROOT_DISPLAY_ORDER` decimal(10,6) DEFAULT NULL,
  `TAX_CODE` varchar(255) DEFAULT NULL,
  `URL` varchar(255) DEFAULT NULL,
  `URL_KEY` varchar(255) DEFAULT NULL,
  `DEFAULT_PARENT_CATEGORY_ID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`CATEGORY_ID`),
  KEY `CATEGORY_PARENT_INDEX` (`DEFAULT_PARENT_CATEGORY_ID`),
  KEY `CATEGORY_E_ID_INDEX` (`EXTERNAL_ID`),
  KEY `CATEGORY_NAME_INDEX` (`NAME`),
  KEY `CATEGORY_URL_INDEX` (`URL`),
  KEY `CATEGORY_URLKEY_INDEX` (`URL_KEY`),
  CONSTRAINT `FK6lf7a3qgmh5m8aq8o8url408t` FOREIGN KEY (`DEFAULT_PARENT_CATEGORY_ID`) REFERENCES `BLC_CATEGORY` (`CATEGORY_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `BLC_CATEGORY` WRITE;
/*!40000 ALTER TABLE `BLC_CATEGORY` DISABLE KEYS */;
INSERT INTO `BLC_CATEGORY` VALUES (2001,NULL,'2020-08-16 20:10:50',NULL,'Home','layout/homepage',NULL,NULL,NULL,NULL,NULL,NULL,'Home',_binary '\0',NULL,NULL,-5.000000,NULL,'/',NULL,NULL);
INSERT INTO `BLC_CATEGORY` VALUES (2002,NULL,'2020-08-16 20:10:51',NULL,'Hot Sauces',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Hot Sauces',_binary '\0',NULL,NULL,-4.000000,NULL,'/hot-sauces',NULL,NULL);
INSERT INTO `BLC_CATEGORY` VALUES (2003,NULL,'2020-08-16 20:10:51',NULL,'Merchandise',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Merchandise',_binary '\0',NULL,NULL,-3.000000,NULL,'/merchandise',NULL,NULL);
INSERT INTO `BLC_CATEGORY` VALUES (2004,NULL,'2020-08-16 20:10:51',NULL,'Clearance',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Clearance',_binary '\0',NULL,NULL,-2.000000,NULL,'/clearance',NULL,NULL);
INSERT INTO `BLC_CATEGORY` VALUES (2007,NULL,'2020-08-16 20:10:51',NULL,'Mens',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Mens',_binary '\0',NULL,NULL,NULL,NULL,'/mens',NULL,NULL);
INSERT INTO `BLC_CATEGORY` VALUES (2008,NULL,'2020-08-16 20:10:51',NULL,'Womens',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Womens',_binary '\0',NULL,NULL,NULL,NULL,'/womens',NULL,NULL);
/*!40000 ALTER TABLE `BLC_CATEGORY` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `BLC_CATEGORY_ATTRIBUTE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BLC_CATEGORY_ATTRIBUTE` (
  `CATEGORY_ATTRIBUTE_ID` bigint(20) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `VALUE` varchar(255) DEFAULT NULL,
  `CATEGORY_ID` bigint(20) NOT NULL,
  PRIMARY KEY (`CATEGORY_ATTRIBUTE_ID`),
  KEY `CATEGORYATTRIBUTE_INDEX` (`CATEGORY_ID`),
  KEY `CATEGORYATTRIBUTE_NAME_INDEX` (`NAME`),
  CONSTRAINT `FKhkechh91jg8iog16ry7089anf` FOREIGN KEY (`CATEGORY_ID`) REFERENCES `BLC_CATEGORY` (`CATEGORY_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `BLC_CATEGORY_ATTRIBUTE` WRITE;
/*!40000 ALTER TABLE `BLC_CATEGORY_ATTRIBUTE` DISABLE KEYS */;
/*!40000 ALTER TABLE `BLC_CATEGORY_ATTRIBUTE` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `BLC_CATEGORY_MEDIA_MAP`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BLC_CATEGORY_MEDIA_MAP` (
  `CATEGORY_MEDIA_ID` bigint(20) NOT NULL,
  `MAP_KEY` varchar(255) NOT NULL,
  `BLC_CATEGORY_CATEGORY_ID` bigint(20) NOT NULL,
  `MEDIA_ID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`CATEGORY_MEDIA_ID`),
  KEY `FKfi64uesmjfu96gc0i4urxyf12` (`BLC_CATEGORY_CATEGORY_ID`),
  KEY `FKel78nfydgqxta46k7uvsh5q3x` (`MEDIA_ID`),
  CONSTRAINT `FKel78nfydgqxta46k7uvsh5q3x` FOREIGN KEY (`MEDIA_ID`) REFERENCES `BLC_MEDIA` (`MEDIA_ID`),
  CONSTRAINT `FKfi64uesmjfu96gc0i4urxyf12` FOREIGN KEY (`BLC_CATEGORY_CATEGORY_ID`) REFERENCES `BLC_CATEGORY` (`CATEGORY_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `BLC_CATEGORY_MEDIA_MAP` WRITE;
/*!40000 ALTER TABLE `BLC_CATEGORY_MEDIA_MAP` DISABLE KEYS */;
/*!40000 ALTER TABLE `BLC_CATEGORY_MEDIA_MAP` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `BLC_CATEGORY_PRODUCT_XREF`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BLC_CATEGORY_PRODUCT_XREF` (
  `CATEGORY_PRODUCT_ID` bigint(20) NOT NULL,
  `DEFAULT_REFERENCE` bit(1) DEFAULT NULL,
  `DISPLAY_ORDER` decimal(10,6) DEFAULT NULL,
  `CATEGORY_ID` bigint(20) NOT NULL,
  `PRODUCT_ID` bigint(20) NOT NULL,
  PRIMARY KEY (`CATEGORY_PRODUCT_ID`),
  KEY `FKj8gn00lwi7fih0ueqwdat589e` (`CATEGORY_ID`),
  KEY `FKnwoet42m887na9hjfvqqgr58v` (`PRODUCT_ID`),
  CONSTRAINT `FKj8gn00lwi7fih0ueqwdat589e` FOREIGN KEY (`CATEGORY_ID`) REFERENCES `BLC_CATEGORY` (`CATEGORY_ID`),
  CONSTRAINT `FKnwoet42m887na9hjfvqqgr58v` FOREIGN KEY (`PRODUCT_ID`) REFERENCES `BLC_PRODUCT` (`PRODUCT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `BLC_CATEGORY_PRODUCT_XREF` WRITE;
/*!40000 ALTER TABLE `BLC_CATEGORY_PRODUCT_XREF` DISABLE KEYS */;
INSERT INTO `BLC_CATEGORY_PRODUCT_XREF` VALUES (1,_binary '',1.000000,2002,1);
INSERT INTO `BLC_CATEGORY_PRODUCT_XREF` VALUES (2,_binary '',2.000000,2002,2);
INSERT INTO `BLC_CATEGORY_PRODUCT_XREF` VALUES (3,_binary '',3.000000,2002,3);
INSERT INTO `BLC_CATEGORY_PRODUCT_XREF` VALUES (4,_binary '',4.000000,2002,4);
INSERT INTO `BLC_CATEGORY_PRODUCT_XREF` VALUES (5,_binary '',5.000000,2002,5);
INSERT INTO `BLC_CATEGORY_PRODUCT_XREF` VALUES (6,_binary '',6.000000,2002,6);
INSERT INTO `BLC_CATEGORY_PRODUCT_XREF` VALUES (7,_binary '',7.000000,2002,7);
INSERT INTO `BLC_CATEGORY_PRODUCT_XREF` VALUES (8,_binary '',8.000000,2002,8);
INSERT INTO `BLC_CATEGORY_PRODUCT_XREF` VALUES (9,_binary '',9.000000,2002,9);
INSERT INTO `BLC_CATEGORY_PRODUCT_XREF` VALUES (10,_binary '',10.000000,2002,10);
INSERT INTO `BLC_CATEGORY_PRODUCT_XREF` VALUES (11,_binary '',11.000000,2002,11);
INSERT INTO `BLC_CATEGORY_PRODUCT_XREF` VALUES (12,_binary '',12.000000,2002,12);
INSERT INTO `BLC_CATEGORY_PRODUCT_XREF` VALUES (13,_binary '',13.000000,2002,13);
INSERT INTO `BLC_CATEGORY_PRODUCT_XREF` VALUES (14,_binary '',14.000000,2002,14);
INSERT INTO `BLC_CATEGORY_PRODUCT_XREF` VALUES (15,_binary '',15.000000,2002,15);
INSERT INTO `BLC_CATEGORY_PRODUCT_XREF` VALUES (16,_binary '',16.000000,2002,16);
INSERT INTO `BLC_CATEGORY_PRODUCT_XREF` VALUES (17,_binary '',17.000000,2002,17);
INSERT INTO `BLC_CATEGORY_PRODUCT_XREF` VALUES (18,_binary '',18.000000,2002,18);
INSERT INTO `BLC_CATEGORY_PRODUCT_XREF` VALUES (19,_binary '',19.000000,2002,19);
INSERT INTO `BLC_CATEGORY_PRODUCT_XREF` VALUES (20,NULL,1.000000,2001,3);
INSERT INTO `BLC_CATEGORY_PRODUCT_XREF` VALUES (21,NULL,2.000000,2001,6);
INSERT INTO `BLC_CATEGORY_PRODUCT_XREF` VALUES (22,NULL,3.000000,2001,9);
INSERT INTO `BLC_CATEGORY_PRODUCT_XREF` VALUES (23,NULL,4.000000,2001,12);
INSERT INTO `BLC_CATEGORY_PRODUCT_XREF` VALUES (24,NULL,NULL,2004,7);
INSERT INTO `BLC_CATEGORY_PRODUCT_XREF` VALUES (25,NULL,NULL,2004,8);
INSERT INTO `BLC_CATEGORY_PRODUCT_XREF` VALUES (26,NULL,NULL,2004,10);
INSERT INTO `BLC_CATEGORY_PRODUCT_XREF` VALUES (27,NULL,NULL,2004,11);
INSERT INTO `BLC_CATEGORY_PRODUCT_XREF` VALUES (28,NULL,NULL,2004,18);
INSERT INTO `BLC_CATEGORY_PRODUCT_XREF` VALUES (29,_binary '',1.000000,2003,100);
INSERT INTO `BLC_CATEGORY_PRODUCT_XREF` VALUES (30,_binary '',2.000000,2003,200);
INSERT INTO `BLC_CATEGORY_PRODUCT_XREF` VALUES (31,_binary '',3.000000,2003,300);
INSERT INTO `BLC_CATEGORY_PRODUCT_XREF` VALUES (32,_binary '',4.000000,2003,400);
INSERT INTO `BLC_CATEGORY_PRODUCT_XREF` VALUES (33,_binary '',5.000000,2003,500);
INSERT INTO `BLC_CATEGORY_PRODUCT_XREF` VALUES (34,_binary '',6.000000,2003,600);
INSERT INTO `BLC_CATEGORY_PRODUCT_XREF` VALUES (35,NULL,1.000000,2007,100);
INSERT INTO `BLC_CATEGORY_PRODUCT_XREF` VALUES (36,NULL,1.000000,2008,200);
INSERT INTO `BLC_CATEGORY_PRODUCT_XREF` VALUES (37,NULL,2.000000,2007,300);
INSERT INTO `BLC_CATEGORY_PRODUCT_XREF` VALUES (38,NULL,2.000000,2008,400);
INSERT INTO `BLC_CATEGORY_PRODUCT_XREF` VALUES (39,NULL,3.000000,2007,500);
INSERT INTO `BLC_CATEGORY_PRODUCT_XREF` VALUES (40,NULL,3.000000,2008,600);
/*!40000 ALTER TABLE `BLC_CATEGORY_PRODUCT_XREF` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `BLC_CATEGORY_XREF`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BLC_CATEGORY_XREF` (
  `CATEGORY_XREF_ID` bigint(20) NOT NULL,
  `DEFAULT_REFERENCE` bit(1) DEFAULT NULL,
  `DISPLAY_ORDER` decimal(10,6) DEFAULT NULL,
  `CATEGORY_ID` bigint(20) NOT NULL,
  `SUB_CATEGORY_ID` bigint(20) NOT NULL,
  PRIMARY KEY (`CATEGORY_XREF_ID`),
  KEY `FKe9p1rqdyircs0atgu7e5xlwmx` (`CATEGORY_ID`),
  KEY `FKgrlcy8qrn7lqyiou3vu1piuk1` (`SUB_CATEGORY_ID`),
  CONSTRAINT `FKe9p1rqdyircs0atgu7e5xlwmx` FOREIGN KEY (`CATEGORY_ID`) REFERENCES `BLC_CATEGORY` (`CATEGORY_ID`),
  CONSTRAINT `FKgrlcy8qrn7lqyiou3vu1piuk1` FOREIGN KEY (`SUB_CATEGORY_ID`) REFERENCES `BLC_CATEGORY` (`CATEGORY_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `BLC_CATEGORY_XREF` WRITE;
/*!40000 ALTER TABLE `BLC_CATEGORY_XREF` DISABLE KEYS */;
INSERT INTO `BLC_CATEGORY_XREF` VALUES (8,_binary '',-7.000000,2003,2007);
INSERT INTO `BLC_CATEGORY_XREF` VALUES (9,_binary '',-6.000000,2003,2008);
/*!40000 ALTER TABLE `BLC_CATEGORY_XREF` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `BLC_CAT_SEARCH_FACET_EXCL_XREF`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BLC_CAT_SEARCH_FACET_EXCL_XREF` (
  `CAT_EXCL_SEARCH_FACET_ID` bigint(20) NOT NULL,
  `SEQUENCE` decimal(19,2) DEFAULT NULL,
  `CATEGORY_ID` bigint(20) DEFAULT NULL,
  `SEARCH_FACET_ID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`CAT_EXCL_SEARCH_FACET_ID`),
  KEY `FK66xu32canhiu19e6or98vufcw` (`CATEGORY_ID`),
  KEY `FKmmy51xuqakfxoflomh4dgl7on` (`SEARCH_FACET_ID`),
  CONSTRAINT `FK66xu32canhiu19e6or98vufcw` FOREIGN KEY (`CATEGORY_ID`) REFERENCES `BLC_CATEGORY` (`CATEGORY_ID`),
  CONSTRAINT `FKmmy51xuqakfxoflomh4dgl7on` FOREIGN KEY (`SEARCH_FACET_ID`) REFERENCES `BLC_SEARCH_FACET` (`SEARCH_FACET_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `BLC_CAT_SEARCH_FACET_EXCL_XREF` WRITE;
/*!40000 ALTER TABLE `BLC_CAT_SEARCH_FACET_EXCL_XREF` DISABLE KEYS */;
/*!40000 ALTER TABLE `BLC_CAT_SEARCH_FACET_EXCL_XREF` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `BLC_CAT_SEARCH_FACET_XREF`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BLC_CAT_SEARCH_FACET_XREF` (
  `CATEGORY_SEARCH_FACET_ID` bigint(20) NOT NULL,
  `SEQUENCE` decimal(19,2) DEFAULT NULL,
  `CATEGORY_ID` bigint(20) DEFAULT NULL,
  `SEARCH_FACET_ID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`CATEGORY_SEARCH_FACET_ID`),
  KEY `FK15e8rvxxafd6h16c1ul3pynqh` (`CATEGORY_ID`),
  KEY `FK68dqudo00pmvd760r53lmcq1q` (`SEARCH_FACET_ID`),
  CONSTRAINT `FK15e8rvxxafd6h16c1ul3pynqh` FOREIGN KEY (`CATEGORY_ID`) REFERENCES `BLC_CATEGORY` (`CATEGORY_ID`),
  CONSTRAINT `FK68dqudo00pmvd760r53lmcq1q` FOREIGN KEY (`SEARCH_FACET_ID`) REFERENCES `BLC_SEARCH_FACET` (`SEARCH_FACET_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `BLC_CAT_SEARCH_FACET_XREF` WRITE;
/*!40000 ALTER TABLE `BLC_CAT_SEARCH_FACET_XREF` DISABLE KEYS */;
INSERT INTO `BLC_CAT_SEARCH_FACET_XREF` VALUES (1,1.00,2002,1);
INSERT INTO `BLC_CAT_SEARCH_FACET_XREF` VALUES (2,2.00,2002,2);
INSERT INTO `BLC_CAT_SEARCH_FACET_XREF` VALUES (4,1.00,2003,4);
INSERT INTO `BLC_CAT_SEARCH_FACET_XREF` VALUES (5,3.00,2002,3);
INSERT INTO `BLC_CAT_SEARCH_FACET_XREF` VALUES (6,3.00,2003,3);
INSERT INTO `BLC_CAT_SEARCH_FACET_XREF` VALUES (7,3.00,2004,3);
/*!40000 ALTER TABLE `BLC_CAT_SEARCH_FACET_XREF` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `BLC_CAT_SITE_MAP_GEN_CFG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BLC_CAT_SITE_MAP_GEN_CFG` (
  `ENDING_DEPTH` int(11) NOT NULL,
  `STARTING_DEPTH` int(11) NOT NULL,
  `GEN_CONFIG_ID` bigint(20) NOT NULL,
  `ROOT_CATEGORY_ID` bigint(20) NOT NULL,
  PRIMARY KEY (`GEN_CONFIG_ID`),
  KEY `FKerl6k0300vd4y8haxljr92rmo` (`ROOT_CATEGORY_ID`),
  CONSTRAINT `FKerl6k0300vd4y8haxljr92rmo` FOREIGN KEY (`ROOT_CATEGORY_ID`) REFERENCES `BLC_CATEGORY` (`CATEGORY_ID`),
  CONSTRAINT `FKn5liq0ue5rtn6h7bmsv7q85nn` FOREIGN KEY (`GEN_CONFIG_ID`) REFERENCES `BLC_SITE_MAP_GEN_CFG` (`GEN_CONFIG_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `BLC_CAT_SITE_MAP_GEN_CFG` WRITE;
/*!40000 ALTER TABLE `BLC_CAT_SITE_MAP_GEN_CFG` DISABLE KEYS */;
INSERT INTO `BLC_CAT_SITE_MAP_GEN_CFG` VALUES (0,0,-7,2004);
INSERT INTO `BLC_CAT_SITE_MAP_GEN_CFG` VALUES (0,0,-6,2003);
INSERT INTO `BLC_CAT_SITE_MAP_GEN_CFG` VALUES (0,0,-5,2002);
INSERT INTO `BLC_CAT_SITE_MAP_GEN_CFG` VALUES (0,0,-4,2001);
/*!40000 ALTER TABLE `BLC_CAT_SITE_MAP_GEN_CFG` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `BLC_CHALLENGE_QUESTION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BLC_CHALLENGE_QUESTION` (
  `QUESTION_ID` bigint(20) NOT NULL,
  `QUESTION` varchar(255) NOT NULL,
  PRIMARY KEY (`QUESTION_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `BLC_CHALLENGE_QUESTION` WRITE;
/*!40000 ALTER TABLE `BLC_CHALLENGE_QUESTION` DISABLE KEYS */;
INSERT INTO `BLC_CHALLENGE_QUESTION` VALUES (1,'What is your favorite sports team?');
INSERT INTO `BLC_CHALLENGE_QUESTION` VALUES (2,'What was your high school name?');
INSERT INTO `BLC_CHALLENGE_QUESTION` VALUES (3,'What was your childhood nickname?');
INSERT INTO `BLC_CHALLENGE_QUESTION` VALUES (4,'What street did you live on in third grade?');
INSERT INTO `BLC_CHALLENGE_QUESTION` VALUES (5,'What is your oldest sibling\'s middle name?');
INSERT INTO `BLC_CHALLENGE_QUESTION` VALUES (6,'What school did you attend for sixth grade?');
INSERT INTO `BLC_CHALLENGE_QUESTION` VALUES (7,'Where does your nearest sibling live?');
INSERT INTO `BLC_CHALLENGE_QUESTION` VALUES (8,'What is your youngest brother\'s birthday?');
INSERT INTO `BLC_CHALLENGE_QUESTION` VALUES (9,'In what city or town was your first job?');
/*!40000 ALTER TABLE `BLC_CHALLENGE_QUESTION` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `BLC_CMS_MENU`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BLC_CMS_MENU` (
  `MENU_ID` bigint(20) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  PRIMARY KEY (`MENU_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `BLC_CMS_MENU` WRITE;
/*!40000 ALTER TABLE `BLC_CMS_MENU` DISABLE KEYS */;
INSERT INTO `BLC_CMS_MENU` VALUES (1,'Header Nav');
/*!40000 ALTER TABLE `BLC_CMS_MENU` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `BLC_CMS_MENU_ITEM`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BLC_CMS_MENU_ITEM` (
  `MENU_ITEM_ID` bigint(20) NOT NULL,
  `ACTION_URL` varchar(255) DEFAULT NULL,
  `ALT_TEXT` varchar(255) DEFAULT NULL,
  `CUSTOM_HTML` longtext,
  `IMAGE_URL` varchar(255) DEFAULT NULL,
  `LABEL` varchar(255) DEFAULT NULL,
  `SEQUENCE` decimal(10,6) DEFAULT NULL,
  `MENU_ITEM_TYPE` varchar(255) DEFAULT NULL,
  `LINKED_MENU_ID` bigint(20) DEFAULT NULL,
  `LINKED_PAGE_ID` bigint(20) DEFAULT NULL,
  `PARENT_MENU_ID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`MENU_ITEM_ID`),
  KEY `FKsfd7p9istk4908bchapktbnr0` (`LINKED_MENU_ID`),
  KEY `FKbgy5higr7beta0sxdqvkm9k7r` (`LINKED_PAGE_ID`),
  KEY `FKa7ogt4huutal1mirsufnmy9lr` (`PARENT_MENU_ID`),
  CONSTRAINT `FKa7ogt4huutal1mirsufnmy9lr` FOREIGN KEY (`PARENT_MENU_ID`) REFERENCES `BLC_CMS_MENU` (`MENU_ID`),
  CONSTRAINT `FKbgy5higr7beta0sxdqvkm9k7r` FOREIGN KEY (`LINKED_PAGE_ID`) REFERENCES `BLC_PAGE` (`PAGE_ID`),
  CONSTRAINT `FKsfd7p9istk4908bchapktbnr0` FOREIGN KEY (`LINKED_MENU_ID`) REFERENCES `BLC_CMS_MENU` (`MENU_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `BLC_CMS_MENU_ITEM` WRITE;
/*!40000 ALTER TABLE `BLC_CMS_MENU_ITEM` DISABLE KEYS */;
INSERT INTO `BLC_CMS_MENU_ITEM` VALUES (1,'/',NULL,NULL,NULL,'Home',1.000000,'CATEGORY',NULL,NULL,1);
INSERT INTO `BLC_CMS_MENU_ITEM` VALUES (2,'/hot-sauces',NULL,NULL,NULL,'Hot Sauces',2.000000,'CATEGORY',NULL,NULL,1);
INSERT INTO `BLC_CMS_MENU_ITEM` VALUES (3,'/merchandise',NULL,NULL,NULL,'Merchandise',3.000000,'CATEGORY',NULL,NULL,1);
INSERT INTO `BLC_CMS_MENU_ITEM` VALUES (4,'/clearance',NULL,NULL,NULL,'Clearance',4.000000,'CATEGORY',NULL,NULL,1);
/*!40000 ALTER TABLE `BLC_CMS_MENU_ITEM` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `BLC_CODE_TYPES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BLC_CODE_TYPES` (
  `CODE_ID` bigint(20) NOT NULL,
  `CODE_TYPE` varchar(255) NOT NULL,
  `CODE_DESC` varchar(255) DEFAULT NULL,
  `CODE_KEY` varchar(255) NOT NULL,
  `MODIFIABLE` char(1) DEFAULT NULL,
  PRIMARY KEY (`CODE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `BLC_CODE_TYPES` WRITE;
/*!40000 ALTER TABLE `BLC_CODE_TYPES` DISABLE KEYS */;
/*!40000 ALTER TABLE `BLC_CODE_TYPES` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `BLC_COUNTRY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BLC_COUNTRY` (
  `ABBREVIATION` varchar(255) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  PRIMARY KEY (`ABBREVIATION`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `BLC_COUNTRY` WRITE;
/*!40000 ALTER TABLE `BLC_COUNTRY` DISABLE KEYS */;
INSERT INTO `BLC_COUNTRY` VALUES ('CA','Canada');
INSERT INTO `BLC_COUNTRY` VALUES ('ES','Spain');
INSERT INTO `BLC_COUNTRY` VALUES ('FR','France');
INSERT INTO `BLC_COUNTRY` VALUES ('GB','United Kingdom');
INSERT INTO `BLC_COUNTRY` VALUES ('MX','Mexico');
INSERT INTO `BLC_COUNTRY` VALUES ('US','United States');
/*!40000 ALTER TABLE `BLC_COUNTRY` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `BLC_COUNTRY_SUB`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BLC_COUNTRY_SUB` (
  `ABBREVIATION` varchar(255) NOT NULL,
  `ALT_ABBREVIATION` varchar(255) DEFAULT NULL,
  `NAME` varchar(255) NOT NULL,
  `COUNTRY_SUB_CAT` bigint(20) DEFAULT NULL,
  `COUNTRY` varchar(255) NOT NULL,
  PRIMARY KEY (`ABBREVIATION`),
  KEY `COUNTRY_SUB_ALT_ABRV_IDX` (`ALT_ABBREVIATION`),
  KEY `COUNTRY_SUB_NAME_IDX` (`NAME`),
  KEY `FKtjleoo0nukky2den29i7mlx0c` (`COUNTRY_SUB_CAT`),
  KEY `FKapicr4ced87ut6dfyh5fuway8` (`COUNTRY`),
  CONSTRAINT `FKapicr4ced87ut6dfyh5fuway8` FOREIGN KEY (`COUNTRY`) REFERENCES `BLC_COUNTRY` (`ABBREVIATION`),
  CONSTRAINT `FKtjleoo0nukky2den29i7mlx0c` FOREIGN KEY (`COUNTRY_SUB_CAT`) REFERENCES `BLC_COUNTRY_SUB_CAT` (`COUNTRY_SUB_CAT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `BLC_COUNTRY_SUB` WRITE;
/*!40000 ALTER TABLE `BLC_COUNTRY_SUB` DISABLE KEYS */;
INSERT INTO `BLC_COUNTRY_SUB` VALUES ('CA-AB','AB','ALBERTA',63,'CA');
INSERT INTO `BLC_COUNTRY_SUB` VALUES ('CA-BC','BC','BRITISH COLUMBIA',63,'CA');
INSERT INTO `BLC_COUNTRY_SUB` VALUES ('CA-MB','MB','MANITOBA',63,'CA');
INSERT INTO `BLC_COUNTRY_SUB` VALUES ('CA-NB','NB','NEW BRUNSWICK',63,'CA');
INSERT INTO `BLC_COUNTRY_SUB` VALUES ('CA-NL','NL','NEWFOUNDLAND',63,'CA');
INSERT INTO `BLC_COUNTRY_SUB` VALUES ('CA-NS','NS','NOVA SCOTIA',63,'CA');
INSERT INTO `BLC_COUNTRY_SUB` VALUES ('CA-NT','NT','NORTHWEST TERRITORIES',81,'CA');
INSERT INTO `BLC_COUNTRY_SUB` VALUES ('CA-NU','NU','NUNAVUT',81,'CA');
INSERT INTO `BLC_COUNTRY_SUB` VALUES ('CA-ON','ON','ONTARIO',63,'CA');
INSERT INTO `BLC_COUNTRY_SUB` VALUES ('CA-PE','PE','PRINCE EDWARD ISLAND',63,'CA');
INSERT INTO `BLC_COUNTRY_SUB` VALUES ('CA-QC','QC','QUEBEC',63,'CA');
INSERT INTO `BLC_COUNTRY_SUB` VALUES ('CA-SK','SK','SASKATCHEWAN',63,'CA');
INSERT INTO `BLC_COUNTRY_SUB` VALUES ('CA-YT','YT','YUKON',81,'CA');
INSERT INTO `BLC_COUNTRY_SUB` VALUES ('ES-A','A','Alicante',63,'ES');
INSERT INTO `BLC_COUNTRY_SUB` VALUES ('ES-AB','AB','Albacete',63,'ES');
INSERT INTO `BLC_COUNTRY_SUB` VALUES ('ES-AL','AL','Almería',63,'ES');
INSERT INTO `BLC_COUNTRY_SUB` VALUES ('ES-AV','AV','Ávila',63,'ES');
INSERT INTO `BLC_COUNTRY_SUB` VALUES ('ES-B','B','Barcelona',63,'ES');
INSERT INTO `BLC_COUNTRY_SUB` VALUES ('ES-BA','BA','Badajoz',63,'ES');
INSERT INTO `BLC_COUNTRY_SUB` VALUES ('ES-BI','BI','Vizcaya',63,'ES');
INSERT INTO `BLC_COUNTRY_SUB` VALUES ('ES-BU','BU','Burgos',63,'ES');
INSERT INTO `BLC_COUNTRY_SUB` VALUES ('ES-C','C','A Coruña',63,'ES');
INSERT INTO `BLC_COUNTRY_SUB` VALUES ('ES-CA','CA','Cádiz',63,'ES');
INSERT INTO `BLC_COUNTRY_SUB` VALUES ('ES-CC','CC','Cáceres',63,'ES');
INSERT INTO `BLC_COUNTRY_SUB` VALUES ('ES-CO','CO','Córdoba',63,'ES');
INSERT INTO `BLC_COUNTRY_SUB` VALUES ('ES-CR','CR','Ciudad Real',63,'ES');
INSERT INTO `BLC_COUNTRY_SUB` VALUES ('ES-CS','CS','Castellón',63,'ES');
INSERT INTO `BLC_COUNTRY_SUB` VALUES ('ES-CU','CU','Cuenca',63,'ES');
INSERT INTO `BLC_COUNTRY_SUB` VALUES ('ES-GC','GC','Las Palmas',63,'ES');
INSERT INTO `BLC_COUNTRY_SUB` VALUES ('ES-GI','GI','Girona',63,'ES');
INSERT INTO `BLC_COUNTRY_SUB` VALUES ('ES-GR','GR','Granada',63,'ES');
INSERT INTO `BLC_COUNTRY_SUB` VALUES ('ES-GU','GU','Guadalajara',63,'ES');
INSERT INTO `BLC_COUNTRY_SUB` VALUES ('ES-H','H','Huelva',63,'ES');
INSERT INTO `BLC_COUNTRY_SUB` VALUES ('ES-HU','HU','Huesca',63,'ES');
INSERT INTO `BLC_COUNTRY_SUB` VALUES ('ES-J','J','Jaén',63,'ES');
INSERT INTO `BLC_COUNTRY_SUB` VALUES ('ES-L','L','Lleida',63,'ES');
INSERT INTO `BLC_COUNTRY_SUB` VALUES ('ES-LE','LE','León',63,'ES');
INSERT INTO `BLC_COUNTRY_SUB` VALUES ('ES-LO','LO','La Rioja',63,'ES');
INSERT INTO `BLC_COUNTRY_SUB` VALUES ('ES-LU','LU','Lugo',63,'ES');
INSERT INTO `BLC_COUNTRY_SUB` VALUES ('ES-M','M','Madrid',63,'ES');
INSERT INTO `BLC_COUNTRY_SUB` VALUES ('ES-MA','MA','Málaga',63,'ES');
INSERT INTO `BLC_COUNTRY_SUB` VALUES ('ES-MU','MU','Murcia',63,'ES');
INSERT INTO `BLC_COUNTRY_SUB` VALUES ('ES-NA','NA','Navarra',63,'ES');
INSERT INTO `BLC_COUNTRY_SUB` VALUES ('ES-O','O','Asturias',63,'ES');
INSERT INTO `BLC_COUNTRY_SUB` VALUES ('ES-OR','OR','Ourense',63,'ES');
INSERT INTO `BLC_COUNTRY_SUB` VALUES ('ES-P','P','Palencia',63,'ES');
INSERT INTO `BLC_COUNTRY_SUB` VALUES ('ES-PM','PM','Balears',63,'ES');
INSERT INTO `BLC_COUNTRY_SUB` VALUES ('ES-PO','PO','Pontevedra',63,'ES');
INSERT INTO `BLC_COUNTRY_SUB` VALUES ('ES-S','S','Cantabria',63,'ES');
INSERT INTO `BLC_COUNTRY_SUB` VALUES ('ES-SA','SA','Salamanca',63,'ES');
INSERT INTO `BLC_COUNTRY_SUB` VALUES ('ES-SE','SE','Sevilla',63,'ES');
INSERT INTO `BLC_COUNTRY_SUB` VALUES ('ES-SG','SG','Segovia',63,'ES');
INSERT INTO `BLC_COUNTRY_SUB` VALUES ('ES-SO','SO','Soria',63,'ES');
INSERT INTO `BLC_COUNTRY_SUB` VALUES ('ES-SS','SS','Guipúzcoa',63,'ES');
INSERT INTO `BLC_COUNTRY_SUB` VALUES ('ES-T','T','Tarragona',63,'ES');
INSERT INTO `BLC_COUNTRY_SUB` VALUES ('ES-TE','TE','Teruel',63,'ES');
INSERT INTO `BLC_COUNTRY_SUB` VALUES ('ES-TF','TF','Santa Cruz de Tenerife',63,'ES');
INSERT INTO `BLC_COUNTRY_SUB` VALUES ('ES-TO','TO','Toledo',63,'ES');
INSERT INTO `BLC_COUNTRY_SUB` VALUES ('ES-V','V','Valencia',63,'ES');
INSERT INTO `BLC_COUNTRY_SUB` VALUES ('ES-VA','VA','Valladolid',63,'ES');
INSERT INTO `BLC_COUNTRY_SUB` VALUES ('ES-VI','VI','Álava',63,'ES');
INSERT INTO `BLC_COUNTRY_SUB` VALUES ('ES-Z','Z','Zaragoza',63,'ES');
INSERT INTO `BLC_COUNTRY_SUB` VALUES ('ES-ZA','ZA','Zamora',63,'ES');
INSERT INTO `BLC_COUNTRY_SUB` VALUES ('MX-AGU','AGU','AGUASCALIENTES',79,'MX');
INSERT INTO `BLC_COUNTRY_SUB` VALUES ('MX-BCN','BCN','BAJA CALIFORNIA',79,'MX');
INSERT INTO `BLC_COUNTRY_SUB` VALUES ('MX-BCS','BCS','BAJA CALIFORNIA SUR',79,'MX');
INSERT INTO `BLC_COUNTRY_SUB` VALUES ('MX-CAM','CAM','CAMPECHE',79,'MX');
INSERT INTO `BLC_COUNTRY_SUB` VALUES ('MX-CHH','CHH','CHIHUAHUA',79,'MX');
INSERT INTO `BLC_COUNTRY_SUB` VALUES ('MX-CHP','CHP','CHIAPAS',79,'MX');
INSERT INTO `BLC_COUNTRY_SUB` VALUES ('MX-COA','COA','COAHUILA',79,'MX');
INSERT INTO `BLC_COUNTRY_SUB` VALUES ('MX-COL','COL','COLIMA',79,'MX');
INSERT INTO `BLC_COUNTRY_SUB` VALUES ('MX-DIF','DIF','DISTRITO FEDERAL',39,'MX');
INSERT INTO `BLC_COUNTRY_SUB` VALUES ('MX-DUR','DUR','DURANGO',79,'MX');
INSERT INTO `BLC_COUNTRY_SUB` VALUES ('MX-GRO','GRO','GUERRERO',79,'MX');
INSERT INTO `BLC_COUNTRY_SUB` VALUES ('MX-GUA','GUA','GUANAJUATO',79,'MX');
INSERT INTO `BLC_COUNTRY_SUB` VALUES ('MX-HID','HID','HIDALGO',79,'MX');
INSERT INTO `BLC_COUNTRY_SUB` VALUES ('MX-JAL','JAL','JALISCO',79,'MX');
INSERT INTO `BLC_COUNTRY_SUB` VALUES ('MX-MEX','MEX','MÉXICO',79,'MX');
INSERT INTO `BLC_COUNTRY_SUB` VALUES ('MX-MIC','MIC','MICHOACÁN',79,'MX');
INSERT INTO `BLC_COUNTRY_SUB` VALUES ('MX-MOR','MOR','MORELOS',79,'MX');
INSERT INTO `BLC_COUNTRY_SUB` VALUES ('MX-NAY','NAY','NAYARIT',79,'MX');
INSERT INTO `BLC_COUNTRY_SUB` VALUES ('MX-NLE','NLE','NUEVO LEÓN',79,'MX');
INSERT INTO `BLC_COUNTRY_SUB` VALUES ('MX-OAX','OAX','OAXACA',79,'MX');
INSERT INTO `BLC_COUNTRY_SUB` VALUES ('MX-PUE','PUE','PUEBLA',79,'MX');
INSERT INTO `BLC_COUNTRY_SUB` VALUES ('MX-QUE','QUE','QUERÉTARO',79,'MX');
INSERT INTO `BLC_COUNTRY_SUB` VALUES ('MX-ROO','ROO','QUINTANA ROO',79,'MX');
INSERT INTO `BLC_COUNTRY_SUB` VALUES ('MX-SIN','SIN','SINALOA',79,'MX');
INSERT INTO `BLC_COUNTRY_SUB` VALUES ('MX-SLP','SLP','SAN LUIS POTOSÍ',79,'MX');
INSERT INTO `BLC_COUNTRY_SUB` VALUES ('MX-SON','SON','SONORA',79,'MX');
INSERT INTO `BLC_COUNTRY_SUB` VALUES ('MX-TAB','TAB','TABASCO',79,'MX');
INSERT INTO `BLC_COUNTRY_SUB` VALUES ('MX-TAM','TAM','TAMAULIPAS',79,'MX');
INSERT INTO `BLC_COUNTRY_SUB` VALUES ('MX-TLA','TLA','TLAXCALA',79,'MX');
INSERT INTO `BLC_COUNTRY_SUB` VALUES ('MX-VER','VER','VERACRUZ',79,'MX');
INSERT INTO `BLC_COUNTRY_SUB` VALUES ('MX-YUC','YUC','YUCATÁN',79,'MX');
INSERT INTO `BLC_COUNTRY_SUB` VALUES ('MX-ZAC','ZAC','ZACATECAS',79,'MX');
INSERT INTO `BLC_COUNTRY_SUB` VALUES ('US-AK','AK','ALASKA',79,'US');
INSERT INTO `BLC_COUNTRY_SUB` VALUES ('US-AL','AL','ALABAMA',79,'US');
INSERT INTO `BLC_COUNTRY_SUB` VALUES ('US-AR','AR','ARKANSAS',79,'US');
INSERT INTO `BLC_COUNTRY_SUB` VALUES ('US-AS','AS','AMERICAN SAMOA',57,'US');
INSERT INTO `BLC_COUNTRY_SUB` VALUES ('US-AZ','AZ','ARIZONA',79,'US');
INSERT INTO `BLC_COUNTRY_SUB` VALUES ('US-CA','CA','CALIFORNIA',79,'US');
INSERT INTO `BLC_COUNTRY_SUB` VALUES ('US-CO','CO','COLORADO',79,'US');
INSERT INTO `BLC_COUNTRY_SUB` VALUES ('US-CT','CT','CONNECTICUT',79,'US');
INSERT INTO `BLC_COUNTRY_SUB` VALUES ('US-DC','DC','DISTRICT OF COLUMBIA',31,'US');
INSERT INTO `BLC_COUNTRY_SUB` VALUES ('US-DE','DE','DELAWARE',79,'US');
INSERT INTO `BLC_COUNTRY_SUB` VALUES ('US-FL','FL','FLORIDA',79,'US');
INSERT INTO `BLC_COUNTRY_SUB` VALUES ('US-GA','GA','GEORGIA',79,'US');
INSERT INTO `BLC_COUNTRY_SUB` VALUES ('US-GU','GU','GUAM',57,'US');
INSERT INTO `BLC_COUNTRY_SUB` VALUES ('US-HI','HI','HAWAII',79,'US');
INSERT INTO `BLC_COUNTRY_SUB` VALUES ('US-IA','IA','IOWA',79,'US');
INSERT INTO `BLC_COUNTRY_SUB` VALUES ('US-ID','ID','IDAHO',79,'US');
INSERT INTO `BLC_COUNTRY_SUB` VALUES ('US-IL','IL','ILLINOIS',79,'US');
INSERT INTO `BLC_COUNTRY_SUB` VALUES ('US-IN','IN','INDIANA',79,'US');
INSERT INTO `BLC_COUNTRY_SUB` VALUES ('US-KS','KS','KANSAS',79,'US');
INSERT INTO `BLC_COUNTRY_SUB` VALUES ('US-KY','KY','KENTUCKY',79,'US');
INSERT INTO `BLC_COUNTRY_SUB` VALUES ('US-LA','LA','LOUISIANA',79,'US');
INSERT INTO `BLC_COUNTRY_SUB` VALUES ('US-MA','MA','MASSACHUSETTS',79,'US');
INSERT INTO `BLC_COUNTRY_SUB` VALUES ('US-MD','MD','MARYLAND',79,'US');
INSERT INTO `BLC_COUNTRY_SUB` VALUES ('US-ME','ME','MAINE',79,'US');
INSERT INTO `BLC_COUNTRY_SUB` VALUES ('US-MI','MI','MICHIGAN',79,'US');
INSERT INTO `BLC_COUNTRY_SUB` VALUES ('US-MN','MN','MINNESOTA',79,'US');
INSERT INTO `BLC_COUNTRY_SUB` VALUES ('US-MO','MO','MISSOURI',79,'US');
INSERT INTO `BLC_COUNTRY_SUB` VALUES ('US-MP','MP','NORTHERN MARIANA ISLANDS',57,'US');
INSERT INTO `BLC_COUNTRY_SUB` VALUES ('US-MS','MS','MISSISSIPPI',79,'US');
INSERT INTO `BLC_COUNTRY_SUB` VALUES ('US-MT','MT','MONTANA',79,'US');
INSERT INTO `BLC_COUNTRY_SUB` VALUES ('US-NC','NC','NORTH CAROLINA',79,'US');
INSERT INTO `BLC_COUNTRY_SUB` VALUES ('US-ND','ND','NORTH DAKOTA',79,'US');
INSERT INTO `BLC_COUNTRY_SUB` VALUES ('US-NE','NE','NEBRASKA',79,'US');
INSERT INTO `BLC_COUNTRY_SUB` VALUES ('US-NH','NH','NEW HAMPSHIRE',79,'US');
INSERT INTO `BLC_COUNTRY_SUB` VALUES ('US-NJ','NJ','NEW JERSEY',79,'US');
INSERT INTO `BLC_COUNTRY_SUB` VALUES ('US-NM','NM','NEW MEXICO',79,'US');
INSERT INTO `BLC_COUNTRY_SUB` VALUES ('US-NV','NV','NEVADA',79,'US');
INSERT INTO `BLC_COUNTRY_SUB` VALUES ('US-NY','NY','NEW YORK',79,'US');
INSERT INTO `BLC_COUNTRY_SUB` VALUES ('US-OH','OH','OHIO',79,'US');
INSERT INTO `BLC_COUNTRY_SUB` VALUES ('US-OK','OK','OKLAHOMA',79,'US');
INSERT INTO `BLC_COUNTRY_SUB` VALUES ('US-OR','OR','OREGON',79,'US');
INSERT INTO `BLC_COUNTRY_SUB` VALUES ('US-PA','PA','PENNSYLVANIA',79,'US');
INSERT INTO `BLC_COUNTRY_SUB` VALUES ('US-PR','PR','PUERTO RICO',57,'US');
INSERT INTO `BLC_COUNTRY_SUB` VALUES ('US-RI','RI','RHODE ISLAND',79,'US');
INSERT INTO `BLC_COUNTRY_SUB` VALUES ('US-SC','SC','SOUTH CAROLINA',79,'US');
INSERT INTO `BLC_COUNTRY_SUB` VALUES ('US-SD','SD','SOUTH DAKOTA',79,'US');
INSERT INTO `BLC_COUNTRY_SUB` VALUES ('US-TN','TN','TENNESSEE',79,'US');
INSERT INTO `BLC_COUNTRY_SUB` VALUES ('US-TX','TX','TEXAS',79,'US');
INSERT INTO `BLC_COUNTRY_SUB` VALUES ('US-UM','UM','UNITED STATES MINOR OUTLYING ISLANDS',57,'US');
INSERT INTO `BLC_COUNTRY_SUB` VALUES ('US-UT','UT','UTAH',79,'US');
INSERT INTO `BLC_COUNTRY_SUB` VALUES ('US-VA','VA','VIRGINIA',79,'US');
INSERT INTO `BLC_COUNTRY_SUB` VALUES ('US-VI','VI','VIRGIN ISLANDS',57,'US');
INSERT INTO `BLC_COUNTRY_SUB` VALUES ('US-VT','VT','VERMONT',79,'US');
INSERT INTO `BLC_COUNTRY_SUB` VALUES ('US-WA','WA','WASHINGTON',79,'US');
INSERT INTO `BLC_COUNTRY_SUB` VALUES ('US-WI','WI','WISCONSIN',79,'US');
INSERT INTO `BLC_COUNTRY_SUB` VALUES ('US-WV','WV','WEST VIRGINIA',79,'US');
INSERT INTO `BLC_COUNTRY_SUB` VALUES ('US-WY','WY','WYOMING',79,'US');
/*!40000 ALTER TABLE `BLC_COUNTRY_SUB` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `BLC_COUNTRY_SUB_CAT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BLC_COUNTRY_SUB_CAT` (
  `COUNTRY_SUB_CAT_ID` bigint(20) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  PRIMARY KEY (`COUNTRY_SUB_CAT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `BLC_COUNTRY_SUB_CAT` WRITE;
/*!40000 ALTER TABLE `BLC_COUNTRY_SUB_CAT` DISABLE KEYS */;
INSERT INTO `BLC_COUNTRY_SUB_CAT` VALUES (1,'Administration');
INSERT INTO `BLC_COUNTRY_SUB_CAT` VALUES (2,'Administrative Atoll');
INSERT INTO `BLC_COUNTRY_SUB_CAT` VALUES (3,'Administrative Region');
INSERT INTO `BLC_COUNTRY_SUB_CAT` VALUES (4,'Area');
INSERT INTO `BLC_COUNTRY_SUB_CAT` VALUES (5,'Autonomous City');
INSERT INTO `BLC_COUNTRY_SUB_CAT` VALUES (6,'Autonomous Community');
INSERT INTO `BLC_COUNTRY_SUB_CAT` VALUES (7,'Autonomous District');
INSERT INTO `BLC_COUNTRY_SUB_CAT` VALUES (8,'Autonomous Municipality');
INSERT INTO `BLC_COUNTRY_SUB_CAT` VALUES (9,'Autonomous Province');
INSERT INTO `BLC_COUNTRY_SUB_CAT` VALUES (10,'Autonomous Region');
INSERT INTO `BLC_COUNTRY_SUB_CAT` VALUES (11,'Autonomous Republic');
INSERT INTO `BLC_COUNTRY_SUB_CAT` VALUES (12,'Autonomous Sector');
INSERT INTO `BLC_COUNTRY_SUB_CAT` VALUES (13,'Autonomous Territorial Unit');
INSERT INTO `BLC_COUNTRY_SUB_CAT` VALUES (14,'Borough');
INSERT INTO `BLC_COUNTRY_SUB_CAT` VALUES (15,'Canton');
INSERT INTO `BLC_COUNTRY_SUB_CAT` VALUES (16,'Capital');
INSERT INTO `BLC_COUNTRY_SUB_CAT` VALUES (17,'Capital City');
INSERT INTO `BLC_COUNTRY_SUB_CAT` VALUES (18,'Capital District');
INSERT INTO `BLC_COUNTRY_SUB_CAT` VALUES (19,'Capital Metropolitan City');
INSERT INTO `BLC_COUNTRY_SUB_CAT` VALUES (20,'City');
INSERT INTO `BLC_COUNTRY_SUB_CAT` VALUES (21,'City of County Right');
INSERT INTO `BLC_COUNTRY_SUB_CAT` VALUES (22,'Commune');
INSERT INTO `BLC_COUNTRY_SUB_CAT` VALUES (23,'Constitutional Province');
INSERT INTO `BLC_COUNTRY_SUB_CAT` VALUES (24,'Corporation');
INSERT INTO `BLC_COUNTRY_SUB_CAT` VALUES (25,'Council Area');
INSERT INTO `BLC_COUNTRY_SUB_CAT` VALUES (26,'Country');
INSERT INTO `BLC_COUNTRY_SUB_CAT` VALUES (27,'County');
INSERT INTO `BLC_COUNTRY_SUB_CAT` VALUES (28,'Department');
INSERT INTO `BLC_COUNTRY_SUB_CAT` VALUES (29,'Dependency');
INSERT INTO `BLC_COUNTRY_SUB_CAT` VALUES (30,'Development Region');
INSERT INTO `BLC_COUNTRY_SUB_CAT` VALUES (31,'District');
INSERT INTO `BLC_COUNTRY_SUB_CAT` VALUES (32,'District With Special Status');
INSERT INTO `BLC_COUNTRY_SUB_CAT` VALUES (33,'Division');
INSERT INTO `BLC_COUNTRY_SUB_CAT` VALUES (34,'Economic Prefecture');
INSERT INTO `BLC_COUNTRY_SUB_CAT` VALUES (35,'Emirate');
INSERT INTO `BLC_COUNTRY_SUB_CAT` VALUES (36,'Entity');
INSERT INTO `BLC_COUNTRY_SUB_CAT` VALUES (37,'Federal Capital Territory');
INSERT INTO `BLC_COUNTRY_SUB_CAT` VALUES (38,'Federal Dependency');
INSERT INTO `BLC_COUNTRY_SUB_CAT` VALUES (39,'Federal District');
INSERT INTO `BLC_COUNTRY_SUB_CAT` VALUES (40,'Federal Land');
INSERT INTO `BLC_COUNTRY_SUB_CAT` VALUES (41,'Federal Territory');
INSERT INTO `BLC_COUNTRY_SUB_CAT` VALUES (42,'Federated States');
INSERT INTO `BLC_COUNTRY_SUB_CAT` VALUES (43,'Geographical Entity');
INSERT INTO `BLC_COUNTRY_SUB_CAT` VALUES (44,'Geographical Regions');
INSERT INTO `BLC_COUNTRY_SUB_CAT` VALUES (45,'Governorate');
INSERT INTO `BLC_COUNTRY_SUB_CAT` VALUES (46,'Indigenous Region');
INSERT INTO `BLC_COUNTRY_SUB_CAT` VALUES (47,'Island');
INSERT INTO `BLC_COUNTRY_SUB_CAT` VALUES (48,'Island Council');
INSERT INTO `BLC_COUNTRY_SUB_CAT` VALUES (49,'Local Council');
INSERT INTO `BLC_COUNTRY_SUB_CAT` VALUES (50,'Metropolitan Administration');
INSERT INTO `BLC_COUNTRY_SUB_CAT` VALUES (51,'Metropolitan City');
INSERT INTO `BLC_COUNTRY_SUB_CAT` VALUES (52,'Metropolitan Department');
INSERT INTO `BLC_COUNTRY_SUB_CAT` VALUES (53,'Metropolitan Region');
INSERT INTO `BLC_COUNTRY_SUB_CAT` VALUES (54,'Municipality');
INSERT INTO `BLC_COUNTRY_SUB_CAT` VALUES (55,'Oblast');
INSERT INTO `BLC_COUNTRY_SUB_CAT` VALUES (56,'Outlying Area');
INSERT INTO `BLC_COUNTRY_SUB_CAT` VALUES (57,'Outlying Territory');
INSERT INTO `BLC_COUNTRY_SUB_CAT` VALUES (58,'Overseas Region');
INSERT INTO `BLC_COUNTRY_SUB_CAT` VALUES (59,'Overseas Territorial Collectivity');
INSERT INTO `BLC_COUNTRY_SUB_CAT` VALUES (60,'Parish');
INSERT INTO `BLC_COUNTRY_SUB_CAT` VALUES (61,'Popularate');
INSERT INTO `BLC_COUNTRY_SUB_CAT` VALUES (62,'Prefecture');
INSERT INTO `BLC_COUNTRY_SUB_CAT` VALUES (63,'Province');
INSERT INTO `BLC_COUNTRY_SUB_CAT` VALUES (64,'Quarter');
INSERT INTO `BLC_COUNTRY_SUB_CAT` VALUES (65,'Rayon');
INSERT INTO `BLC_COUNTRY_SUB_CAT` VALUES (66,'Region');
INSERT INTO `BLC_COUNTRY_SUB_CAT` VALUES (67,'Regional Council');
INSERT INTO `BLC_COUNTRY_SUB_CAT` VALUES (68,'Republic');
INSERT INTO `BLC_COUNTRY_SUB_CAT` VALUES (69,'Republican City');
INSERT INTO `BLC_COUNTRY_SUB_CAT` VALUES (70,'Self-governed Part');
INSERT INTO `BLC_COUNTRY_SUB_CAT` VALUES (71,'Special Administrative City');
INSERT INTO `BLC_COUNTRY_SUB_CAT` VALUES (72,'Special Administrative Region');
INSERT INTO `BLC_COUNTRY_SUB_CAT` VALUES (73,'Special City');
INSERT INTO `BLC_COUNTRY_SUB_CAT` VALUES (74,'Special District');
INSERT INTO `BLC_COUNTRY_SUB_CAT` VALUES (75,'Special Island Authority');
INSERT INTO `BLC_COUNTRY_SUB_CAT` VALUES (76,'Special Municipality');
INSERT INTO `BLC_COUNTRY_SUB_CAT` VALUES (77,'Special Region');
INSERT INTO `BLC_COUNTRY_SUB_CAT` VALUES (78,'Special Zone');
INSERT INTO `BLC_COUNTRY_SUB_CAT` VALUES (79,'State');
INSERT INTO `BLC_COUNTRY_SUB_CAT` VALUES (80,'Territorial Unit');
INSERT INTO `BLC_COUNTRY_SUB_CAT` VALUES (81,'Territory');
INSERT INTO `BLC_COUNTRY_SUB_CAT` VALUES (82,'Town Council');
INSERT INTO `BLC_COUNTRY_SUB_CAT` VALUES (83,'Union Territory');
INSERT INTO `BLC_COUNTRY_SUB_CAT` VALUES (84,'Unitary Authority');
INSERT INTO `BLC_COUNTRY_SUB_CAT` VALUES (85,'Urban Community');
INSERT INTO `BLC_COUNTRY_SUB_CAT` VALUES (86,'Zone');
/*!40000 ALTER TABLE `BLC_COUNTRY_SUB_CAT` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `BLC_CREDIT_CARD_PAYMENT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BLC_CREDIT_CARD_PAYMENT` (
  `PAYMENT_ID` bigint(20) NOT NULL,
  `EXPIRATION_MONTH` int(11) NOT NULL,
  `EXPIRATION_YEAR` int(11) NOT NULL,
  `NAME_ON_CARD` varchar(255) NOT NULL,
  `PAN` varchar(255) NOT NULL,
  `REFERENCE_NUMBER` varchar(255) NOT NULL,
  PRIMARY KEY (`PAYMENT_ID`),
  KEY `CREDITCARD_INDEX` (`REFERENCE_NUMBER`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `BLC_CREDIT_CARD_PAYMENT` WRITE;
/*!40000 ALTER TABLE `BLC_CREDIT_CARD_PAYMENT` DISABLE KEYS */;
/*!40000 ALTER TABLE `BLC_CREDIT_CARD_PAYMENT` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `BLC_CURRENCY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BLC_CURRENCY` (
  `CURRENCY_CODE` varchar(255) NOT NULL,
  `DEFAULT_FLAG` bit(1) DEFAULT NULL,
  `FRIENDLY_NAME` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`CURRENCY_CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `BLC_CURRENCY` WRITE;
/*!40000 ALTER TABLE `BLC_CURRENCY` DISABLE KEYS */;
INSERT INTO `BLC_CURRENCY` VALUES ('EUR',_binary '\0','EURO Dollar');
INSERT INTO `BLC_CURRENCY` VALUES ('GBP',_binary '\0','GB Pound');
INSERT INTO `BLC_CURRENCY` VALUES ('MXN',_binary '\0','Mexican Peso');
INSERT INTO `BLC_CURRENCY` VALUES ('USD',_binary '','US Dollar');
/*!40000 ALTER TABLE `BLC_CURRENCY` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `BLC_CUSTOMER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BLC_CUSTOMER` (
  `CUSTOMER_ID` bigint(20) NOT NULL,
  `CREATED_BY` bigint(20) DEFAULT NULL,
  `DATE_CREATED` datetime DEFAULT NULL,
  `DATE_UPDATED` datetime DEFAULT NULL,
  `UPDATED_BY` bigint(20) DEFAULT NULL,
  `CHALLENGE_ANSWER` varchar(255) DEFAULT NULL,
  `DEACTIVATED` bit(1) DEFAULT NULL,
  `EMAIL_ADDRESS` varchar(255) DEFAULT NULL,
  `EXTERNAL_ID` varchar(255) DEFAULT NULL,
  `FIRST_NAME` varchar(255) DEFAULT NULL,
  `IS_TAX_EXEMPT` bit(1) DEFAULT NULL,
  `LAST_NAME` varchar(255) DEFAULT NULL,
  `PASSWORD` varchar(255) DEFAULT NULL,
  `PASSWORD_CHANGE_REQUIRED` bit(1) DEFAULT NULL,
  `IS_PREVIEW` bit(1) DEFAULT NULL,
  `RECEIVE_EMAIL` bit(1) DEFAULT NULL,
  `IS_REGISTERED` bit(1) DEFAULT NULL,
  `TAX_EXEMPTION_CODE` varchar(255) DEFAULT NULL,
  `USER_NAME` varchar(255) DEFAULT NULL,
  `CHALLENGE_QUESTION_ID` bigint(20) DEFAULT NULL,
  `LOCALE_CODE` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`CUSTOMER_ID`),
  KEY `CUSTOMER_CHALLENGE_INDEX` (`CHALLENGE_QUESTION_ID`),
  KEY `CUSTOMER_EMAIL_INDEX` (`EMAIL_ADDRESS`),
  KEY `FK4utjhbg9600iwhb05m40wspj1` (`LOCALE_CODE`),
  CONSTRAINT `FK4utjhbg9600iwhb05m40wspj1` FOREIGN KEY (`LOCALE_CODE`) REFERENCES `BLC_LOCALE` (`LOCALE_CODE`),
  CONSTRAINT `FKsgsex6rdheq2nm6pl23gggtqs` FOREIGN KEY (`CHALLENGE_QUESTION_ID`) REFERENCES `BLC_CHALLENGE_QUESTION` (`QUESTION_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `BLC_CUSTOMER` WRITE;
/*!40000 ALTER TABLE `BLC_CUSTOMER` DISABLE KEYS */;
INSERT INTO `BLC_CUSTOMER` VALUES (200,200,'2020-08-16 20:11:19','2020-08-16 20:11:19',200,NULL,_binary '\0',NULL,NULL,NULL,_binary '\0',NULL,NULL,_binary '\0',NULL,_binary '\0',_binary '\0',NULL,'200',NULL,NULL);
INSERT INTO `BLC_CUSTOMER` VALUES (217,0,'2020-08-17 15:57:55','2020-08-17 15:57:55',0,NULL,_binary '\0','123@qwe.com',NULL,'123',_binary '\0','qwe','123qwe',_binary '\0',NULL,_binary '\0',_binary '',NULL,'123@qwe.com',NULL,NULL);
/*!40000 ALTER TABLE `BLC_CUSTOMER` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `BLC_CUSTOMER_ADDRESS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BLC_CUSTOMER_ADDRESS` (
  `CUSTOMER_ADDRESS_ID` bigint(20) NOT NULL,
  `ADDRESS_NAME` varchar(255) DEFAULT NULL,
  `ARCHIVED` char(1) DEFAULT NULL,
  `ADDRESS_ID` bigint(20) NOT NULL,
  `CUSTOMER_ID` bigint(20) NOT NULL,
  PRIMARY KEY (`CUSTOMER_ADDRESS_ID`),
  KEY `CUSTOMERADDRESS_ADDRESS_INDEX` (`ADDRESS_ID`),
  KEY `FKrpdahw86mewf46g63nitq0w9p` (`CUSTOMER_ID`),
  CONSTRAINT `FKn79uhm41n1b23e6brajb4ggpw` FOREIGN KEY (`ADDRESS_ID`) REFERENCES `BLC_ADDRESS` (`ADDRESS_ID`),
  CONSTRAINT `FKrpdahw86mewf46g63nitq0w9p` FOREIGN KEY (`CUSTOMER_ID`) REFERENCES `BLC_CUSTOMER` (`CUSTOMER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `BLC_CUSTOMER_ADDRESS` WRITE;
/*!40000 ALTER TABLE `BLC_CUSTOMER_ADDRESS` DISABLE KEYS */;
/*!40000 ALTER TABLE `BLC_CUSTOMER_ADDRESS` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `BLC_CUSTOMER_ATTRIBUTE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BLC_CUSTOMER_ATTRIBUTE` (
  `CUSTOMER_ATTR_ID` bigint(20) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `VALUE` varchar(255) DEFAULT NULL,
  `CUSTOMER_ID` bigint(20) NOT NULL,
  PRIMARY KEY (`CUSTOMER_ATTR_ID`),
  KEY `FKo7j035lp80xu9wncbv96a1ry0` (`CUSTOMER_ID`),
  CONSTRAINT `FKo7j035lp80xu9wncbv96a1ry0` FOREIGN KEY (`CUSTOMER_ID`) REFERENCES `BLC_CUSTOMER` (`CUSTOMER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `BLC_CUSTOMER_ATTRIBUTE` WRITE;
/*!40000 ALTER TABLE `BLC_CUSTOMER_ATTRIBUTE` DISABLE KEYS */;
/*!40000 ALTER TABLE `BLC_CUSTOMER_ATTRIBUTE` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `BLC_CUSTOMER_OFFER_XREF`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BLC_CUSTOMER_OFFER_XREF` (
  `CUSTOMER_OFFER_ID` bigint(20) NOT NULL,
  `CUSTOMER_ID` bigint(20) NOT NULL,
  `OFFER_ID` bigint(20) NOT NULL,
  PRIMARY KEY (`CUSTOMER_OFFER_ID`),
  KEY `CUSTOFFER_CUSTOMER_INDEX` (`CUSTOMER_ID`),
  KEY `CUSTOFFER_OFFER_INDEX` (`OFFER_ID`),
  CONSTRAINT `FKg81dq5yxrtsy6cjivd0afkxcj` FOREIGN KEY (`CUSTOMER_ID`) REFERENCES `BLC_CUSTOMER` (`CUSTOMER_ID`),
  CONSTRAINT `FKrks1nkejqmm3n7y4xo5rs6wuk` FOREIGN KEY (`OFFER_ID`) REFERENCES `BLC_OFFER` (`OFFER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `BLC_CUSTOMER_OFFER_XREF` WRITE;
/*!40000 ALTER TABLE `BLC_CUSTOMER_OFFER_XREF` DISABLE KEYS */;
/*!40000 ALTER TABLE `BLC_CUSTOMER_OFFER_XREF` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `BLC_CUSTOMER_PASSWORD_TOKEN`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BLC_CUSTOMER_PASSWORD_TOKEN` (
  `PASSWORD_TOKEN` varchar(255) NOT NULL,
  `CREATE_DATE` datetime NOT NULL,
  `CUSTOMER_ID` bigint(20) NOT NULL,
  `TOKEN_USED_DATE` datetime DEFAULT NULL,
  `TOKEN_USED_FLAG` bit(1) NOT NULL,
  PRIMARY KEY (`PASSWORD_TOKEN`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `BLC_CUSTOMER_PASSWORD_TOKEN` WRITE;
/*!40000 ALTER TABLE `BLC_CUSTOMER_PASSWORD_TOKEN` DISABLE KEYS */;
/*!40000 ALTER TABLE `BLC_CUSTOMER_PASSWORD_TOKEN` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `BLC_CUSTOMER_PAYMENT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BLC_CUSTOMER_PAYMENT` (
  `CUSTOMER_PAYMENT_ID` bigint(20) NOT NULL,
  `IS_DEFAULT` bit(1) DEFAULT NULL,
  `GATEWAY_TYPE` varchar(255) DEFAULT NULL,
  `PAYMENT_TOKEN` varchar(255) DEFAULT NULL,
  `PAYMENT_TYPE` varchar(255) DEFAULT NULL,
  `ADDRESS_ID` bigint(20) DEFAULT NULL,
  `CUSTOMER_ID` bigint(20) NOT NULL,
  PRIMARY KEY (`CUSTOMER_PAYMENT_ID`),
  UNIQUE KEY `CSTMR_PAY_UNIQUE_CNSTRNT` (`CUSTOMER_ID`,`PAYMENT_TOKEN`),
  KEY `CUSTOMERPAYMENT_TYPE_INDEX` (`PAYMENT_TYPE`),
  KEY `FKouuqjxsn30esr7ftg7i5mmr4p` (`ADDRESS_ID`),
  CONSTRAINT `FKhd53v4ilet9h8jxbjh7m2k7yj` FOREIGN KEY (`CUSTOMER_ID`) REFERENCES `BLC_CUSTOMER` (`CUSTOMER_ID`),
  CONSTRAINT `FKouuqjxsn30esr7ftg7i5mmr4p` FOREIGN KEY (`ADDRESS_ID`) REFERENCES `BLC_ADDRESS` (`ADDRESS_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `BLC_CUSTOMER_PAYMENT` WRITE;
/*!40000 ALTER TABLE `BLC_CUSTOMER_PAYMENT` DISABLE KEYS */;
/*!40000 ALTER TABLE `BLC_CUSTOMER_PAYMENT` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `BLC_CUSTOMER_PAYMENT_FIELDS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BLC_CUSTOMER_PAYMENT_FIELDS` (
  `CUSTOMER_PAYMENT_ID` bigint(20) NOT NULL,
  `FIELD_VALUE` longtext,
  `FIELD_NAME` varchar(255) NOT NULL,
  PRIMARY KEY (`CUSTOMER_PAYMENT_ID`,`FIELD_NAME`),
  CONSTRAINT `FKpwpbmvuo4pd8y76dswmq4cr00` FOREIGN KEY (`CUSTOMER_PAYMENT_ID`) REFERENCES `BLC_CUSTOMER_PAYMENT` (`CUSTOMER_PAYMENT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `BLC_CUSTOMER_PAYMENT_FIELDS` WRITE;
/*!40000 ALTER TABLE `BLC_CUSTOMER_PAYMENT_FIELDS` DISABLE KEYS */;
/*!40000 ALTER TABLE `BLC_CUSTOMER_PAYMENT_FIELDS` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `BLC_CUSTOMER_PHONE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BLC_CUSTOMER_PHONE` (
  `CUSTOMER_PHONE_ID` bigint(20) NOT NULL,
  `PHONE_NAME` varchar(255) DEFAULT NULL,
  `CUSTOMER_ID` bigint(20) NOT NULL,
  `PHONE_ID` bigint(20) NOT NULL,
  PRIMARY KEY (`CUSTOMER_PHONE_ID`),
  UNIQUE KEY `CSTMR_PHONE_UNIQUE_CNSTRNT` (`CUSTOMER_ID`,`PHONE_NAME`),
  KEY `CUSTPHONE_PHONE_INDEX` (`PHONE_ID`),
  CONSTRAINT `FK1uy5spxqx6kxiqnvg5la7bjbb` FOREIGN KEY (`PHONE_ID`) REFERENCES `BLC_PHONE` (`PHONE_ID`),
  CONSTRAINT `FK4sg479sv9t1dj7b1pso158tr8` FOREIGN KEY (`CUSTOMER_ID`) REFERENCES `BLC_CUSTOMER` (`CUSTOMER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `BLC_CUSTOMER_PHONE` WRITE;
/*!40000 ALTER TABLE `BLC_CUSTOMER_PHONE` DISABLE KEYS */;
/*!40000 ALTER TABLE `BLC_CUSTOMER_PHONE` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `BLC_CUSTOMER_ROLE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BLC_CUSTOMER_ROLE` (
  `CUSTOMER_ROLE_ID` bigint(20) NOT NULL,
  `CUSTOMER_ID` bigint(20) NOT NULL,
  `ROLE_ID` bigint(20) NOT NULL,
  PRIMARY KEY (`CUSTOMER_ROLE_ID`),
  KEY `CUSTROLE_CUSTOMER_INDEX` (`CUSTOMER_ID`),
  KEY `CUSTROLE_ROLE_INDEX` (`ROLE_ID`),
  CONSTRAINT `FKqcnikrg70t86oju6xf6622f5x` FOREIGN KEY (`ROLE_ID`) REFERENCES `BLC_ROLE` (`ROLE_ID`),
  CONSTRAINT `FKsqxeay9un5o0l77mrtdgjxps4` FOREIGN KEY (`CUSTOMER_ID`) REFERENCES `BLC_CUSTOMER` (`CUSTOMER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `BLC_CUSTOMER_ROLE` WRITE;
/*!40000 ALTER TABLE `BLC_CUSTOMER_ROLE` DISABLE KEYS */;
INSERT INTO `BLC_CUSTOMER_ROLE` VALUES (1,217,1);
/*!40000 ALTER TABLE `BLC_CUSTOMER_ROLE` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `BLC_CUST_SITE_MAP_GEN_CFG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BLC_CUST_SITE_MAP_GEN_CFG` (
  `GEN_CONFIG_ID` bigint(20) NOT NULL,
  PRIMARY KEY (`GEN_CONFIG_ID`),
  CONSTRAINT `FKs5s4vmpbxh4edqjtbted9gxmw` FOREIGN KEY (`GEN_CONFIG_ID`) REFERENCES `BLC_SITE_MAP_GEN_CFG` (`GEN_CONFIG_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `BLC_CUST_SITE_MAP_GEN_CFG` WRITE;
/*!40000 ALTER TABLE `BLC_CUST_SITE_MAP_GEN_CFG` DISABLE KEYS */;
INSERT INTO `BLC_CUST_SITE_MAP_GEN_CFG` VALUES (-1);
/*!40000 ALTER TABLE `BLC_CUST_SITE_MAP_GEN_CFG` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `BLC_DATA_DRVN_ENUM`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BLC_DATA_DRVN_ENUM` (
  `ENUM_ID` bigint(20) NOT NULL,
  `ENUM_KEY` varchar(255) DEFAULT NULL,
  `MODIFIABLE` bit(1) DEFAULT NULL,
  PRIMARY KEY (`ENUM_ID`),
  KEY `ENUM_KEY_INDEX` (`ENUM_KEY`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `BLC_DATA_DRVN_ENUM` WRITE;
/*!40000 ALTER TABLE `BLC_DATA_DRVN_ENUM` DISABLE KEYS */;
/*!40000 ALTER TABLE `BLC_DATA_DRVN_ENUM` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `BLC_DATA_DRVN_ENUM_VAL`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BLC_DATA_DRVN_ENUM_VAL` (
  `ENUM_VAL_ID` bigint(20) NOT NULL,
  `DISPLAY` varchar(255) DEFAULT NULL,
  `HIDDEN` bit(1) DEFAULT NULL,
  `ENUM_KEY` varchar(255) DEFAULT NULL,
  `ENUM_TYPE` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`ENUM_VAL_ID`),
  KEY `HIDDEN_INDEX` (`HIDDEN`),
  KEY `ENUM_VAL_KEY_INDEX` (`ENUM_KEY`),
  KEY `FKq180xbmiqw22rrc9kf0qokaea` (`ENUM_TYPE`),
  CONSTRAINT `FKq180xbmiqw22rrc9kf0qokaea` FOREIGN KEY (`ENUM_TYPE`) REFERENCES `BLC_DATA_DRVN_ENUM` (`ENUM_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `BLC_DATA_DRVN_ENUM_VAL` WRITE;
/*!40000 ALTER TABLE `BLC_DATA_DRVN_ENUM_VAL` DISABLE KEYS */;
/*!40000 ALTER TABLE `BLC_DATA_DRVN_ENUM_VAL` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `BLC_DISCRETE_ORDER_ITEM`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BLC_DISCRETE_ORDER_ITEM` (
  `BASE_RETAIL_PRICE` decimal(19,5) DEFAULT NULL,
  `BASE_SALE_PRICE` decimal(19,5) DEFAULT NULL,
  `ORDER_ITEM_ID` bigint(20) NOT NULL,
  `BUNDLE_ORDER_ITEM_ID` bigint(20) DEFAULT NULL,
  `PRODUCT_ID` bigint(20) DEFAULT NULL,
  `SKU_ID` bigint(20) NOT NULL,
  `SKU_BUNDLE_ITEM_ID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`ORDER_ITEM_ID`),
  KEY `DISCRETE_PRODUCT_INDEX` (`PRODUCT_ID`),
  KEY `DISCRETE_SKU_INDEX` (`SKU_ID`),
  KEY `FKpu94j8xpk9uwpcgcy98ktle06` (`BUNDLE_ORDER_ITEM_ID`),
  KEY `FK1micyx881c06d24amsg3sk2he` (`SKU_BUNDLE_ITEM_ID`),
  CONSTRAINT `FK188b985egh16qfcjt8kv1asa4` FOREIGN KEY (`ORDER_ITEM_ID`) REFERENCES `BLC_ORDER_ITEM` (`ORDER_ITEM_ID`),
  CONSTRAINT `FK1micyx881c06d24amsg3sk2he` FOREIGN KEY (`SKU_BUNDLE_ITEM_ID`) REFERENCES `BLC_SKU_BUNDLE_ITEM` (`SKU_BUNDLE_ITEM_ID`),
  CONSTRAINT `FK2moe4tjwke365lo2s5qgmacx7` FOREIGN KEY (`PRODUCT_ID`) REFERENCES `BLC_PRODUCT` (`PRODUCT_ID`),
  CONSTRAINT `FKmtcs7ax8jo2hy1ae4caafsfkp` FOREIGN KEY (`SKU_ID`) REFERENCES `BLC_SKU` (`SKU_ID`),
  CONSTRAINT `FKpu94j8xpk9uwpcgcy98ktle06` FOREIGN KEY (`BUNDLE_ORDER_ITEM_ID`) REFERENCES `BLC_BUNDLE_ORDER_ITEM` (`ORDER_ITEM_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `BLC_DISCRETE_ORDER_ITEM` WRITE;
/*!40000 ALTER TABLE `BLC_DISCRETE_ORDER_ITEM` DISABLE KEYS */;
INSERT INTO `BLC_DISCRETE_ORDER_ITEM` VALUES (6.99000,6.99000,1,NULL,4,4,NULL);
/*!40000 ALTER TABLE `BLC_DISCRETE_ORDER_ITEM` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `BLC_DISC_ITEM_FEE_PRICE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BLC_DISC_ITEM_FEE_PRICE` (
  `DISC_ITEM_FEE_PRICE_ID` bigint(20) NOT NULL,
  `AMOUNT` decimal(19,5) DEFAULT NULL,
  `NAME` varchar(255) DEFAULT NULL,
  `REPORTING_CODE` varchar(255) DEFAULT NULL,
  `ORDER_ITEM_ID` bigint(20) NOT NULL,
  PRIMARY KEY (`DISC_ITEM_FEE_PRICE_ID`),
  KEY `FK70ocmaswx7p3xymfvildubx5` (`ORDER_ITEM_ID`),
  CONSTRAINT `FK70ocmaswx7p3xymfvildubx5` FOREIGN KEY (`ORDER_ITEM_ID`) REFERENCES `BLC_DISCRETE_ORDER_ITEM` (`ORDER_ITEM_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `BLC_DISC_ITEM_FEE_PRICE` WRITE;
/*!40000 ALTER TABLE `BLC_DISC_ITEM_FEE_PRICE` DISABLE KEYS */;
/*!40000 ALTER TABLE `BLC_DISC_ITEM_FEE_PRICE` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `BLC_DYN_DISCRETE_ORDER_ITEM`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BLC_DYN_DISCRETE_ORDER_ITEM` (
  `ORDER_ITEM_ID` bigint(20) NOT NULL,
  PRIMARY KEY (`ORDER_ITEM_ID`),
  CONSTRAINT `FKhv263skp3pgb4wcxg44umwcjs` FOREIGN KEY (`ORDER_ITEM_ID`) REFERENCES `BLC_DISCRETE_ORDER_ITEM` (`ORDER_ITEM_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `BLC_DYN_DISCRETE_ORDER_ITEM` WRITE;
/*!40000 ALTER TABLE `BLC_DYN_DISCRETE_ORDER_ITEM` DISABLE KEYS */;
/*!40000 ALTER TABLE `BLC_DYN_DISCRETE_ORDER_ITEM` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `BLC_EMAIL_TRACKING`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BLC_EMAIL_TRACKING` (
  `EMAIL_TRACKING_ID` bigint(20) NOT NULL,
  `DATE_SENT` datetime DEFAULT NULL,
  `EMAIL_ADDRESS` varchar(255) DEFAULT NULL,
  `TYPE` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`EMAIL_TRACKING_ID`),
  KEY `EMAILTRACKING_INDEX` (`EMAIL_ADDRESS`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `BLC_EMAIL_TRACKING` WRITE;
/*!40000 ALTER TABLE `BLC_EMAIL_TRACKING` DISABLE KEYS */;
INSERT INTO `BLC_EMAIL_TRACKING` VALUES (1,'2020-08-17 15:57:55','123@qwe.com',NULL);
/*!40000 ALTER TABLE `BLC_EMAIL_TRACKING` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `BLC_EMAIL_TRACKING_CLICKS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BLC_EMAIL_TRACKING_CLICKS` (
  `CLICK_ID` bigint(20) NOT NULL,
  `CUSTOMER_ID` varchar(255) DEFAULT NULL,
  `DATE_CLICKED` datetime NOT NULL,
  `DESTINATION_URI` varchar(255) DEFAULT NULL,
  `QUERY_STRING` varchar(255) DEFAULT NULL,
  `EMAIL_TRACKING_ID` bigint(20) NOT NULL,
  PRIMARY KEY (`CLICK_ID`),
  KEY `TRACKINGCLICKS_CUSTOMER_INDEX` (`CUSTOMER_ID`),
  KEY `TRACKINGCLICKS_TRACKING_INDEX` (`EMAIL_TRACKING_ID`),
  CONSTRAINT `FK3jed270645ahspuibr8wau0po` FOREIGN KEY (`EMAIL_TRACKING_ID`) REFERENCES `BLC_EMAIL_TRACKING` (`EMAIL_TRACKING_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `BLC_EMAIL_TRACKING_CLICKS` WRITE;
/*!40000 ALTER TABLE `BLC_EMAIL_TRACKING_CLICKS` DISABLE KEYS */;
/*!40000 ALTER TABLE `BLC_EMAIL_TRACKING_CLICKS` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `BLC_EMAIL_TRACKING_OPENS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BLC_EMAIL_TRACKING_OPENS` (
  `OPEN_ID` bigint(20) NOT NULL,
  `DATE_OPENED` datetime DEFAULT NULL,
  `USER_AGENT` varchar(255) DEFAULT NULL,
  `EMAIL_TRACKING_ID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`OPEN_ID`),
  KEY `TRACKINGOPEN_TRACKING` (`EMAIL_TRACKING_ID`),
  CONSTRAINT `FKt6fi06g4y7riiqeyuhb0t659n` FOREIGN KEY (`EMAIL_TRACKING_ID`) REFERENCES `BLC_EMAIL_TRACKING` (`EMAIL_TRACKING_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `BLC_EMAIL_TRACKING_OPENS` WRITE;
/*!40000 ALTER TABLE `BLC_EMAIL_TRACKING_OPENS` DISABLE KEYS */;
/*!40000 ALTER TABLE `BLC_EMAIL_TRACKING_OPENS` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `BLC_FG_ADJUSTMENT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BLC_FG_ADJUSTMENT` (
  `FG_ADJUSTMENT_ID` bigint(20) NOT NULL,
  `ADJUSTMENT_REASON` varchar(255) NOT NULL,
  `ADJUSTMENT_VALUE` decimal(19,5) NOT NULL,
  `FULFILLMENT_GROUP_ID` bigint(20) DEFAULT NULL,
  `OFFER_ID` bigint(20) NOT NULL,
  PRIMARY KEY (`FG_ADJUSTMENT_ID`),
  KEY `FGADJUSTMENT_INDEX` (`FULFILLMENT_GROUP_ID`),
  KEY `FGADJUSTMENT_OFFER_INDEX` (`OFFER_ID`),
  CONSTRAINT `FK2ceuqqy88te84f61f0n7kvaw1` FOREIGN KEY (`FULFILLMENT_GROUP_ID`) REFERENCES `BLC_FULFILLMENT_GROUP` (`FULFILLMENT_GROUP_ID`),
  CONSTRAINT `FKt0l1mgyccsuq76n8b0b6pc9a9` FOREIGN KEY (`OFFER_ID`) REFERENCES `BLC_OFFER` (`OFFER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `BLC_FG_ADJUSTMENT` WRITE;
/*!40000 ALTER TABLE `BLC_FG_ADJUSTMENT` DISABLE KEYS */;
/*!40000 ALTER TABLE `BLC_FG_ADJUSTMENT` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `BLC_FG_FEE_TAX_XREF`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BLC_FG_FEE_TAX_XREF` (
  `FULFILLMENT_GROUP_FEE_ID` bigint(20) NOT NULL,
  `TAX_DETAIL_ID` bigint(20) NOT NULL,
  UNIQUE KEY `UK_59ow3plvbkxjfs57k92ahf3eg` (`TAX_DETAIL_ID`),
  KEY `FK2t3oa9322dqgya6r27pb2bcsd` (`FULFILLMENT_GROUP_FEE_ID`),
  CONSTRAINT `FK1aueplsngm018mlqqq9yhgrn6` FOREIGN KEY (`TAX_DETAIL_ID`) REFERENCES `BLC_TAX_DETAIL` (`TAX_DETAIL_ID`),
  CONSTRAINT `FK2t3oa9322dqgya6r27pb2bcsd` FOREIGN KEY (`FULFILLMENT_GROUP_FEE_ID`) REFERENCES `BLC_FULFILLMENT_GROUP_FEE` (`FULFILLMENT_GROUP_FEE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `BLC_FG_FEE_TAX_XREF` WRITE;
/*!40000 ALTER TABLE `BLC_FG_FEE_TAX_XREF` DISABLE KEYS */;
/*!40000 ALTER TABLE `BLC_FG_FEE_TAX_XREF` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `BLC_FG_FG_TAX_XREF`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BLC_FG_FG_TAX_XREF` (
  `FULFILLMENT_GROUP_ID` bigint(20) NOT NULL,
  `TAX_DETAIL_ID` bigint(20) NOT NULL,
  UNIQUE KEY `UK_57834q276cjrrnwjj1ilnj6ve` (`TAX_DETAIL_ID`),
  KEY `FKnah3gdurbtogb0s9sf3humt14` (`FULFILLMENT_GROUP_ID`),
  CONSTRAINT `FKla7cgvy244irmood3xt8rpsjb` FOREIGN KEY (`TAX_DETAIL_ID`) REFERENCES `BLC_TAX_DETAIL` (`TAX_DETAIL_ID`),
  CONSTRAINT `FKnah3gdurbtogb0s9sf3humt14` FOREIGN KEY (`FULFILLMENT_GROUP_ID`) REFERENCES `BLC_FULFILLMENT_GROUP` (`FULFILLMENT_GROUP_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `BLC_FG_FG_TAX_XREF` WRITE;
/*!40000 ALTER TABLE `BLC_FG_FG_TAX_XREF` DISABLE KEYS */;
/*!40000 ALTER TABLE `BLC_FG_FG_TAX_XREF` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `BLC_FG_ITEM_TAX_XREF`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BLC_FG_ITEM_TAX_XREF` (
  `FULFILLMENT_GROUP_ITEM_ID` bigint(20) NOT NULL,
  `TAX_DETAIL_ID` bigint(20) NOT NULL,
  UNIQUE KEY `UK_hs9yvwvlwdy668hf186rgfyvq` (`TAX_DETAIL_ID`),
  KEY `FKl5kovj2ayfp7idroml0qjwan3` (`FULFILLMENT_GROUP_ITEM_ID`),
  CONSTRAINT `FKb5rnxtly8pr3ihvlrxlovnjkb` FOREIGN KEY (`TAX_DETAIL_ID`) REFERENCES `BLC_TAX_DETAIL` (`TAX_DETAIL_ID`),
  CONSTRAINT `FKl5kovj2ayfp7idroml0qjwan3` FOREIGN KEY (`FULFILLMENT_GROUP_ITEM_ID`) REFERENCES `BLC_FULFILLMENT_GROUP_ITEM` (`FULFILLMENT_GROUP_ITEM_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `BLC_FG_ITEM_TAX_XREF` WRITE;
/*!40000 ALTER TABLE `BLC_FG_ITEM_TAX_XREF` DISABLE KEYS */;
/*!40000 ALTER TABLE `BLC_FG_ITEM_TAX_XREF` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `BLC_FIELD`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BLC_FIELD` (
  `FIELD_ID` bigint(20) NOT NULL,
  `ABBREVIATION` varchar(255) DEFAULT NULL,
  `ENTITY_TYPE` varchar(255) NOT NULL,
  `FRIENDLY_NAME` varchar(255) DEFAULT NULL,
  `OVERRIDE_GENERATED_PROP_NAME` bit(1) DEFAULT NULL,
  `PROPERTY_NAME` varchar(255) NOT NULL,
  `TRANSLATABLE` bit(1) DEFAULT NULL,
  PRIMARY KEY (`FIELD_ID`),
  KEY `ENTITY_TYPE_INDEX` (`ENTITY_TYPE`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `BLC_FIELD` WRITE;
/*!40000 ALTER TABLE `BLC_FIELD` DISABLE KEYS */;
INSERT INTO `BLC_FIELD` VALUES (1,'mfg','PRODUCT','Manufacturer',NULL,'manufacturer',NULL);
INSERT INTO `BLC_FIELD` VALUES (2,'heatRange','PRODUCT','Heat Range',NULL,'productAttributes(heatRange).value',NULL);
INSERT INTO `BLC_FIELD` VALUES (3,'price','PRODUCT','Price',NULL,'defaultSku.price',NULL);
INSERT INTO `BLC_FIELD` VALUES (4,'name','PRODUCT','Product Name',NULL,'defaultSku.name',_binary '');
INSERT INTO `BLC_FIELD` VALUES (5,'model','PRODUCT','Model',NULL,'model',NULL);
INSERT INTO `BLC_FIELD` VALUES (6,'desc','PRODUCT','Description',NULL,'defaultSku.description',_binary '');
INSERT INTO `BLC_FIELD` VALUES (7,'ldesc','PRODUCT','Long Description',NULL,'defaultSku.longDescription',_binary '');
INSERT INTO `BLC_FIELD` VALUES (8,'color','PRODUCT','Color',NULL,'productOptionValuesMap(COLOR)',NULL);
INSERT INTO `BLC_FIELD` VALUES (9,'margin','PRODUCT','Margin',NULL,'margin',NULL);
/*!40000 ALTER TABLE `BLC_FIELD` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `BLC_FLD_DEF`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BLC_FLD_DEF` (
  `FLD_DEF_ID` bigint(20) NOT NULL,
  `ALLOW_MULTIPLES` bit(1) DEFAULT NULL,
  `COLUMN_WIDTH` varchar(255) DEFAULT NULL,
  `FLD_ORDER` int(11) DEFAULT NULL,
  `FLD_TYPE` varchar(255) DEFAULT NULL,
  `FRIENDLY_NAME` varchar(255) DEFAULT NULL,
  `HELP_TEXT` varchar(255) DEFAULT NULL,
  `HIDDEN_FLAG` bit(1) DEFAULT NULL,
  `HINT` varchar(255) DEFAULT NULL,
  `MAX_LENGTH` int(11) DEFAULT NULL,
  `NAME` varchar(255) DEFAULT NULL,
  `REQUIRED_FLAG` bit(1) DEFAULT NULL,
  `SECURITY_LEVEL` varchar(255) DEFAULT NULL,
  `TEXT_AREA_FLAG` bit(1) DEFAULT NULL,
  `TOOLTIP` varchar(255) DEFAULT NULL,
  `VLDTN_ERROR_MSSG_KEY` varchar(255) DEFAULT NULL,
  `VLDTN_REGEX` varchar(255) DEFAULT NULL,
  `ENUM_ID` bigint(20) DEFAULT NULL,
  `FLD_GROUP_ID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`FLD_DEF_ID`),
  KEY `FK3p9sauu111ycv4gbk6tymcj9e` (`ENUM_ID`),
  KEY `FKcqfi7hxwka5y9sqqoiolsnssr` (`FLD_GROUP_ID`),
  CONSTRAINT `FK3p9sauu111ycv4gbk6tymcj9e` FOREIGN KEY (`ENUM_ID`) REFERENCES `BLC_DATA_DRVN_ENUM` (`ENUM_ID`),
  CONSTRAINT `FKcqfi7hxwka5y9sqqoiolsnssr` FOREIGN KEY (`FLD_GROUP_ID`) REFERENCES `BLC_FLD_GROUP` (`FLD_GROUP_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `BLC_FLD_DEF` WRITE;
/*!40000 ALTER TABLE `BLC_FLD_DEF` DISABLE KEYS */;
INSERT INTO `BLC_FLD_DEF` VALUES (2,_binary '\0','*',1,'HTML','Body',NULL,_binary '\0',NULL,NULL,'body',NULL,NULL,_binary '\0',NULL,NULL,NULL,NULL,1);
INSERT INTO `BLC_FLD_DEF` VALUES (3,_binary '\0','*',0,'STRING','Title',NULL,_binary '\0',NULL,NULL,'title',NULL,NULL,_binary '\0',NULL,NULL,NULL,NULL,1);
INSERT INTO `BLC_FLD_DEF` VALUES (7,_binary '\0','*',0,'ASSET_LOOKUP','Image URL',NULL,_binary '\0',NULL,150,'imageUrl',_binary '',NULL,_binary '\0',NULL,NULL,NULL,NULL,4);
INSERT INTO `BLC_FLD_DEF` VALUES (8,_binary '\0','*',1,'STRING','Target URL',NULL,_binary '\0',NULL,150,'targetUrl',_binary '',NULL,_binary '\0',NULL,'Invalid Url','^(\\/)[a-z\\d\\-\\_]+$',NULL,4);
INSERT INTO `BLC_FLD_DEF` VALUES (9,_binary '\0','*',0,'STRING','Message Text',NULL,_binary '\0',NULL,150,'messageText',NULL,NULL,_binary '\0',NULL,NULL,NULL,NULL,6);
INSERT INTO `BLC_FLD_DEF` VALUES (10,_binary '\0','*',0,'HTML','HTML Content',NULL,_binary '\0',NULL,NULL,'htmlContent',NULL,NULL,_binary '\0',NULL,NULL,NULL,NULL,5);
/*!40000 ALTER TABLE `BLC_FLD_DEF` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `BLC_FLD_ENUM`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BLC_FLD_ENUM` (
  `FLD_ENUM_ID` bigint(20) NOT NULL,
  `NAME` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`FLD_ENUM_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `BLC_FLD_ENUM` WRITE;
/*!40000 ALTER TABLE `BLC_FLD_ENUM` DISABLE KEYS */;
/*!40000 ALTER TABLE `BLC_FLD_ENUM` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `BLC_FLD_ENUM_ITEM`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BLC_FLD_ENUM_ITEM` (
  `FLD_ENUM_ITEM_ID` bigint(20) NOT NULL,
  `FLD_ORDER` int(11) DEFAULT NULL,
  `FRIENDLY_NAME` varchar(255) DEFAULT NULL,
  `NAME` varchar(255) DEFAULT NULL,
  `FLD_ENUM_ID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`FLD_ENUM_ITEM_ID`),
  KEY `FKjs87xrnu40vfq9uwdi9lv05lr` (`FLD_ENUM_ID`),
  CONSTRAINT `FKjs87xrnu40vfq9uwdi9lv05lr` FOREIGN KEY (`FLD_ENUM_ID`) REFERENCES `BLC_FLD_ENUM` (`FLD_ENUM_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `BLC_FLD_ENUM_ITEM` WRITE;
/*!40000 ALTER TABLE `BLC_FLD_ENUM_ITEM` DISABLE KEYS */;
/*!40000 ALTER TABLE `BLC_FLD_ENUM_ITEM` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `BLC_FLD_GROUP`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BLC_FLD_GROUP` (
  `FLD_GROUP_ID` bigint(20) NOT NULL,
  `INIT_COLLAPSED_FLAG` bit(1) DEFAULT NULL,
  `IS_MASTER_FIELD_GROUP` bit(1) DEFAULT NULL,
  `NAME` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`FLD_GROUP_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `BLC_FLD_GROUP` WRITE;
/*!40000 ALTER TABLE `BLC_FLD_GROUP` DISABLE KEYS */;
INSERT INTO `BLC_FLD_GROUP` VALUES (1,_binary '\0',NULL,'Content');
INSERT INTO `BLC_FLD_GROUP` VALUES (4,_binary '\0',NULL,'Ad Fields');
INSERT INTO `BLC_FLD_GROUP` VALUES (5,_binary '\0',NULL,'HTML Fields');
INSERT INTO `BLC_FLD_GROUP` VALUES (6,_binary '\0',NULL,'Message Fields');
/*!40000 ALTER TABLE `BLC_FLD_GROUP` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `BLC_FULFILLMENT_GROUP`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BLC_FULFILLMENT_GROUP` (
  `FULFILLMENT_GROUP_ID` bigint(20) NOT NULL,
  `DELIVERY_INSTRUCTION` varchar(255) DEFAULT NULL,
  `PRICE` decimal(19,5) DEFAULT NULL,
  `SHIPPING_PRICE_TAXABLE` bit(1) DEFAULT NULL,
  `MERCHANDISE_TOTAL` decimal(19,5) DEFAULT NULL,
  `METHOD` varchar(255) DEFAULT NULL,
  `IS_PRIMARY` bit(1) DEFAULT NULL,
  `REFERENCE_NUMBER` varchar(255) DEFAULT NULL,
  `RETAIL_PRICE` decimal(19,5) DEFAULT NULL,
  `SALE_PRICE` decimal(19,5) DEFAULT NULL,
  `FULFILLMENT_GROUP_SEQUNCE` int(11) DEFAULT NULL,
  `SERVICE` varchar(255) DEFAULT NULL,
  `SHIPPING_OVERRIDE` bit(1) DEFAULT NULL,
  `STATUS` varchar(255) DEFAULT NULL,
  `TOTAL` decimal(19,5) DEFAULT NULL,
  `TOTAL_FEE_TAX` decimal(19,5) DEFAULT NULL,
  `TOTAL_FG_TAX` decimal(19,5) DEFAULT NULL,
  `TOTAL_ITEM_TAX` decimal(19,5) DEFAULT NULL,
  `TOTAL_TAX` decimal(19,5) DEFAULT NULL,
  `TYPE` varchar(255) DEFAULT NULL,
  `ADDRESS_ID` bigint(20) DEFAULT NULL,
  `FULFILLMENT_OPTION_ID` bigint(20) DEFAULT NULL,
  `ORDER_ID` bigint(20) NOT NULL,
  `PERSONAL_MESSAGE_ID` bigint(20) DEFAULT NULL,
  `PHONE_ID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`FULFILLMENT_GROUP_ID`),
  KEY `FG_ADDRESS_INDEX` (`ADDRESS_ID`),
  KEY `FG_METHOD_INDEX` (`METHOD`),
  KEY `FG_ORDER_INDEX` (`ORDER_ID`),
  KEY `FG_MESSAGE_INDEX` (`PERSONAL_MESSAGE_ID`),
  KEY `FG_PHONE_INDEX` (`PHONE_ID`),
  KEY `FG_PRIMARY_INDEX` (`IS_PRIMARY`),
  KEY `FG_REFERENCE_INDEX` (`REFERENCE_NUMBER`),
  KEY `FG_SERVICE_INDEX` (`SERVICE`),
  KEY `FG_STATUS_INDEX` (`STATUS`),
  KEY `FK336lsxych2j78fsd12dxacn7n` (`FULFILLMENT_OPTION_ID`),
  CONSTRAINT `FK336lsxych2j78fsd12dxacn7n` FOREIGN KEY (`FULFILLMENT_OPTION_ID`) REFERENCES `BLC_FULFILLMENT_OPTION` (`FULFILLMENT_OPTION_ID`),
  CONSTRAINT `FK3lis2v456tgcmagt1tkdummdi` FOREIGN KEY (`PHONE_ID`) REFERENCES `BLC_PHONE` (`PHONE_ID`),
  CONSTRAINT `FK44mielsxkxtt1ndfiat2wj9po` FOREIGN KEY (`PERSONAL_MESSAGE_ID`) REFERENCES `BLC_PERSONAL_MESSAGE` (`PERSONAL_MESSAGE_ID`),
  CONSTRAINT `FKavpobeg9yjr9k3wtycirv5i8a` FOREIGN KEY (`ADDRESS_ID`) REFERENCES `BLC_ADDRESS` (`ADDRESS_ID`),
  CONSTRAINT `FKbtadc11h6ysb0fbyq2bsegum7` FOREIGN KEY (`ORDER_ID`) REFERENCES `BLC_ORDER` (`ORDER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `BLC_FULFILLMENT_GROUP` WRITE;
/*!40000 ALTER TABLE `BLC_FULFILLMENT_GROUP` DISABLE KEYS */;
INSERT INTO `BLC_FULFILLMENT_GROUP` VALUES (1,NULL,5.00000,_binary '\0',6.99000,NULL,_binary '\0',NULL,5.00000,5.00000,1,NULL,NULL,NULL,11.99000,0.00000,0.00000,0.00000,0.00000,NULL,1,1,51,NULL,NULL);
/*!40000 ALTER TABLE `BLC_FULFILLMENT_GROUP` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `BLC_FULFILLMENT_GROUP_FEE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BLC_FULFILLMENT_GROUP_FEE` (
  `FULFILLMENT_GROUP_FEE_ID` bigint(20) NOT NULL,
  `AMOUNT` decimal(19,5) DEFAULT NULL,
  `FEE_TAXABLE_FLAG` bit(1) DEFAULT NULL,
  `NAME` varchar(255) DEFAULT NULL,
  `REPORTING_CODE` varchar(255) DEFAULT NULL,
  `TOTAL_FEE_TAX` decimal(19,5) DEFAULT NULL,
  `FULFILLMENT_GROUP_ID` bigint(20) NOT NULL,
  PRIMARY KEY (`FULFILLMENT_GROUP_FEE_ID`),
  KEY `FKss79152pprx7xdwjkmelwf4xo` (`FULFILLMENT_GROUP_ID`),
  CONSTRAINT `FKss79152pprx7xdwjkmelwf4xo` FOREIGN KEY (`FULFILLMENT_GROUP_ID`) REFERENCES `BLC_FULFILLMENT_GROUP` (`FULFILLMENT_GROUP_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `BLC_FULFILLMENT_GROUP_FEE` WRITE;
/*!40000 ALTER TABLE `BLC_FULFILLMENT_GROUP_FEE` DISABLE KEYS */;
/*!40000 ALTER TABLE `BLC_FULFILLMENT_GROUP_FEE` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `BLC_FULFILLMENT_GROUP_ITEM`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BLC_FULFILLMENT_GROUP_ITEM` (
  `FULFILLMENT_GROUP_ITEM_ID` bigint(20) NOT NULL,
  `PRORATED_ORDER_ADJ` decimal(19,2) DEFAULT NULL,
  `QUANTITY` int(11) NOT NULL,
  `STATUS` varchar(255) DEFAULT NULL,
  `TOTAL_ITEM_AMOUNT` decimal(19,5) DEFAULT NULL,
  `TOTAL_ITEM_TAXABLE_AMOUNT` decimal(19,5) DEFAULT NULL,
  `TOTAL_ITEM_TAX` decimal(19,5) DEFAULT NULL,
  `FULFILLMENT_GROUP_ID` bigint(20) NOT NULL,
  `ORDER_ITEM_ID` bigint(20) NOT NULL,
  PRIMARY KEY (`FULFILLMENT_GROUP_ITEM_ID`),
  KEY `FGITEM_FG_INDEX` (`FULFILLMENT_GROUP_ID`),
  KEY `FGITEM_STATUS_INDEX` (`STATUS`),
  KEY `FKmra6tj092ugw58xhvvi43pdb2` (`ORDER_ITEM_ID`),
  CONSTRAINT `FKmra6tj092ugw58xhvvi43pdb2` FOREIGN KEY (`ORDER_ITEM_ID`) REFERENCES `BLC_ORDER_ITEM` (`ORDER_ITEM_ID`),
  CONSTRAINT `FKqfqxv2f0ita9ou48jpi7c3wi9` FOREIGN KEY (`FULFILLMENT_GROUP_ID`) REFERENCES `BLC_FULFILLMENT_GROUP` (`FULFILLMENT_GROUP_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `BLC_FULFILLMENT_GROUP_ITEM` WRITE;
/*!40000 ALTER TABLE `BLC_FULFILLMENT_GROUP_ITEM` DISABLE KEYS */;
INSERT INTO `BLC_FULFILLMENT_GROUP_ITEM` VALUES (1,0.00,1,NULL,6.99000,6.99000,0.00000,1,1);
/*!40000 ALTER TABLE `BLC_FULFILLMENT_GROUP_ITEM` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `BLC_FULFILLMENT_OPTION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BLC_FULFILLMENT_OPTION` (
  `FULFILLMENT_OPTION_ID` bigint(20) NOT NULL,
  `FULFILLMENT_TYPE` varchar(255) NOT NULL,
  `LONG_DESCRIPTION` longtext,
  `NAME` varchar(255) DEFAULT NULL,
  `TAX_CODE` varchar(255) DEFAULT NULL,
  `TAXABLE` bit(1) DEFAULT NULL,
  `USE_FLAT_RATES` bit(1) DEFAULT NULL,
  PRIMARY KEY (`FULFILLMENT_OPTION_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `BLC_FULFILLMENT_OPTION` WRITE;
/*!40000 ALTER TABLE `BLC_FULFILLMENT_OPTION` DISABLE KEYS */;
INSERT INTO `BLC_FULFILLMENT_OPTION` VALUES (1,'PHYSICAL_SHIP','5 - 7 Days','Standard',NULL,NULL,_binary '\0');
INSERT INTO `BLC_FULFILLMENT_OPTION` VALUES (2,'PHYSICAL_SHIP','3 - 5 Days','Priority',NULL,NULL,_binary '\0');
INSERT INTO `BLC_FULFILLMENT_OPTION` VALUES (3,'PHYSICAL_SHIP','1 - 2 Days','Express',NULL,NULL,_binary '\0');
/*!40000 ALTER TABLE `BLC_FULFILLMENT_OPTION` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `BLC_FULFILLMENT_OPTION_FIXED`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BLC_FULFILLMENT_OPTION_FIXED` (
  `PRICE` decimal(19,5) NOT NULL,
  `FULFILLMENT_OPTION_ID` bigint(20) NOT NULL,
  `CURRENCY_CODE` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`FULFILLMENT_OPTION_ID`),
  KEY `FKj5n6w6q7dk09k6ayif4g5t0t3` (`CURRENCY_CODE`),
  CONSTRAINT `FKj5n6w6q7dk09k6ayif4g5t0t3` FOREIGN KEY (`CURRENCY_CODE`) REFERENCES `BLC_CURRENCY` (`CURRENCY_CODE`),
  CONSTRAINT `FKl96yhpl4w0989nil2g6v2t3kq` FOREIGN KEY (`FULFILLMENT_OPTION_ID`) REFERENCES `BLC_FULFILLMENT_OPTION` (`FULFILLMENT_OPTION_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `BLC_FULFILLMENT_OPTION_FIXED` WRITE;
/*!40000 ALTER TABLE `BLC_FULFILLMENT_OPTION_FIXED` DISABLE KEYS */;
INSERT INTO `BLC_FULFILLMENT_OPTION_FIXED` VALUES (5.00000,1,NULL);
INSERT INTO `BLC_FULFILLMENT_OPTION_FIXED` VALUES (10.00000,2,NULL);
INSERT INTO `BLC_FULFILLMENT_OPTION_FIXED` VALUES (20.00000,3,NULL);
/*!40000 ALTER TABLE `BLC_FULFILLMENT_OPTION_FIXED` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `BLC_FULFILLMENT_OPT_BANDED_PRC`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BLC_FULFILLMENT_OPT_BANDED_PRC` (
  `FULFILLMENT_OPTION_ID` bigint(20) NOT NULL,
  PRIMARY KEY (`FULFILLMENT_OPTION_ID`),
  CONSTRAINT `FKsf9j5pdg9lo5e7xhasqn61m0y` FOREIGN KEY (`FULFILLMENT_OPTION_ID`) REFERENCES `BLC_FULFILLMENT_OPTION` (`FULFILLMENT_OPTION_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `BLC_FULFILLMENT_OPT_BANDED_PRC` WRITE;
/*!40000 ALTER TABLE `BLC_FULFILLMENT_OPT_BANDED_PRC` DISABLE KEYS */;
/*!40000 ALTER TABLE `BLC_FULFILLMENT_OPT_BANDED_PRC` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `BLC_FULFILLMENT_OPT_BANDED_WGT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BLC_FULFILLMENT_OPT_BANDED_WGT` (
  `FULFILLMENT_OPTION_ID` bigint(20) NOT NULL,
  PRIMARY KEY (`FULFILLMENT_OPTION_ID`),
  CONSTRAINT `FKsarbwhn57dgx7kt1es3ny384n` FOREIGN KEY (`FULFILLMENT_OPTION_ID`) REFERENCES `BLC_FULFILLMENT_OPTION` (`FULFILLMENT_OPTION_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `BLC_FULFILLMENT_OPT_BANDED_WGT` WRITE;
/*!40000 ALTER TABLE `BLC_FULFILLMENT_OPT_BANDED_WGT` DISABLE KEYS */;
/*!40000 ALTER TABLE `BLC_FULFILLMENT_OPT_BANDED_WGT` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `BLC_FULFILLMENT_PRICE_BAND`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BLC_FULFILLMENT_PRICE_BAND` (
  `FULFILLMENT_PRICE_BAND_ID` bigint(20) NOT NULL,
  `RESULT_AMOUNT` decimal(19,5) NOT NULL,
  `RESULT_AMOUNT_TYPE` varchar(255) NOT NULL,
  `RETAIL_PRICE_MINIMUM_AMOUNT` decimal(19,5) NOT NULL,
  `FULFILLMENT_OPTION_ID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`FULFILLMENT_PRICE_BAND_ID`),
  KEY `FKh2i7xep5l3txpi65xpb3vxxdh` (`FULFILLMENT_OPTION_ID`),
  CONSTRAINT `FKh2i7xep5l3txpi65xpb3vxxdh` FOREIGN KEY (`FULFILLMENT_OPTION_ID`) REFERENCES `BLC_FULFILLMENT_OPT_BANDED_PRC` (`FULFILLMENT_OPTION_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `BLC_FULFILLMENT_PRICE_BAND` WRITE;
/*!40000 ALTER TABLE `BLC_FULFILLMENT_PRICE_BAND` DISABLE KEYS */;
/*!40000 ALTER TABLE `BLC_FULFILLMENT_PRICE_BAND` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `BLC_FULFILLMENT_WEIGHT_BAND`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BLC_FULFILLMENT_WEIGHT_BAND` (
  `FULFILLMENT_WEIGHT_BAND_ID` bigint(20) NOT NULL,
  `RESULT_AMOUNT` decimal(19,5) NOT NULL,
  `RESULT_AMOUNT_TYPE` varchar(255) NOT NULL,
  `MINIMUM_WEIGHT` decimal(19,5) DEFAULT NULL,
  `WEIGHT_UNIT_OF_MEASURE` varchar(255) DEFAULT NULL,
  `FULFILLMENT_OPTION_ID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`FULFILLMENT_WEIGHT_BAND_ID`),
  KEY `FKoij3p9iwe1856w6fd5283bpyl` (`FULFILLMENT_OPTION_ID`),
  CONSTRAINT `FKoij3p9iwe1856w6fd5283bpyl` FOREIGN KEY (`FULFILLMENT_OPTION_ID`) REFERENCES `BLC_FULFILLMENT_OPT_BANDED_WGT` (`FULFILLMENT_OPTION_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `BLC_FULFILLMENT_WEIGHT_BAND` WRITE;
/*!40000 ALTER TABLE `BLC_FULFILLMENT_WEIGHT_BAND` DISABLE KEYS */;
/*!40000 ALTER TABLE `BLC_FULFILLMENT_WEIGHT_BAND` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `BLC_GIFTWRAP_ORDER_ITEM`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BLC_GIFTWRAP_ORDER_ITEM` (
  `ORDER_ITEM_ID` bigint(20) NOT NULL,
  PRIMARY KEY (`ORDER_ITEM_ID`),
  CONSTRAINT `FKtq6vr571td9a8ihss8os1wtr8` FOREIGN KEY (`ORDER_ITEM_ID`) REFERENCES `BLC_DISCRETE_ORDER_ITEM` (`ORDER_ITEM_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `BLC_GIFTWRAP_ORDER_ITEM` WRITE;
/*!40000 ALTER TABLE `BLC_GIFTWRAP_ORDER_ITEM` DISABLE KEYS */;
/*!40000 ALTER TABLE `BLC_GIFTWRAP_ORDER_ITEM` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `BLC_GIFT_CARD_PAYMENT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BLC_GIFT_CARD_PAYMENT` (
  `PAYMENT_ID` bigint(20) NOT NULL,
  `PAN` varchar(255) NOT NULL,
  `PIN` varchar(255) DEFAULT NULL,
  `REFERENCE_NUMBER` varchar(255) NOT NULL,
  PRIMARY KEY (`PAYMENT_ID`),
  KEY `GIFTCARD_INDEX` (`REFERENCE_NUMBER`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `BLC_GIFT_CARD_PAYMENT` WRITE;
/*!40000 ALTER TABLE `BLC_GIFT_CARD_PAYMENT` DISABLE KEYS */;
/*!40000 ALTER TABLE `BLC_GIFT_CARD_PAYMENT` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `BLC_ID_GENERATION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BLC_ID_GENERATION` (
  `ID_TYPE` varchar(255) NOT NULL,
  `BATCH_SIZE` bigint(20) NOT NULL,
  `BATCH_START` bigint(20) NOT NULL,
  `ID_MIN` bigint(20) DEFAULT NULL,
  `ID_MAX` bigint(20) DEFAULT NULL,
  `version` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID_TYPE`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `BLC_ID_GENERATION` WRITE;
/*!40000 ALTER TABLE `BLC_ID_GENERATION` DISABLE KEYS */;
INSERT INTO `BLC_ID_GENERATION` VALUES ('org.broadleafcommerce.profile.core.domain.Customer',100,500,NULL,NULL,5);
/*!40000 ALTER TABLE `BLC_ID_GENERATION` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `BLC_IMG_STATIC_ASSET`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BLC_IMG_STATIC_ASSET` (
  `HEIGHT` int(11) DEFAULT NULL,
  `WIDTH` int(11) DEFAULT NULL,
  `STATIC_ASSET_ID` bigint(20) NOT NULL,
  PRIMARY KEY (`STATIC_ASSET_ID`),
  CONSTRAINT `FK6pugoo2mcm6irchv42bui3tm6` FOREIGN KEY (`STATIC_ASSET_ID`) REFERENCES `BLC_STATIC_ASSET` (`STATIC_ASSET_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `BLC_IMG_STATIC_ASSET` WRITE;
/*!40000 ALTER TABLE `BLC_IMG_STATIC_ASSET` DISABLE KEYS */;
/*!40000 ALTER TABLE `BLC_IMG_STATIC_ASSET` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `BLC_INDEX_FIELD`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BLC_INDEX_FIELD` (
  `INDEX_FIELD_ID` bigint(20) NOT NULL,
  `SEARCHABLE` bit(1) DEFAULT NULL,
  `FIELD_ID` bigint(20) NOT NULL,
  PRIMARY KEY (`INDEX_FIELD_ID`),
  KEY `INDEX_FIELD_SEARCHABLE_INDEX` (`SEARCHABLE`),
  KEY `FKc1x5lu6romu8tsjrlpjmsqqxy` (`FIELD_ID`),
  CONSTRAINT `FKc1x5lu6romu8tsjrlpjmsqqxy` FOREIGN KEY (`FIELD_ID`) REFERENCES `BLC_FIELD` (`FIELD_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `BLC_INDEX_FIELD` WRITE;
/*!40000 ALTER TABLE `BLC_INDEX_FIELD` DISABLE KEYS */;
INSERT INTO `BLC_INDEX_FIELD` VALUES (1,_binary '',1);
INSERT INTO `BLC_INDEX_FIELD` VALUES (2,_binary '\0',2);
INSERT INTO `BLC_INDEX_FIELD` VALUES (3,_binary '\0',3);
INSERT INTO `BLC_INDEX_FIELD` VALUES (4,_binary '',4);
INSERT INTO `BLC_INDEX_FIELD` VALUES (5,_binary '',5);
INSERT INTO `BLC_INDEX_FIELD` VALUES (6,_binary '',6);
INSERT INTO `BLC_INDEX_FIELD` VALUES (7,_binary '',7);
INSERT INTO `BLC_INDEX_FIELD` VALUES (8,_binary '\0',8);
INSERT INTO `BLC_INDEX_FIELD` VALUES (9,_binary '\0',9);
/*!40000 ALTER TABLE `BLC_INDEX_FIELD` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `BLC_INDEX_FIELD_TYPE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BLC_INDEX_FIELD_TYPE` (
  `INDEX_FIELD_TYPE_ID` bigint(20) NOT NULL,
  `FIELD_TYPE` varchar(255) DEFAULT NULL,
  `INDEX_FIELD_ID` bigint(20) NOT NULL,
  PRIMARY KEY (`INDEX_FIELD_TYPE_ID`),
  KEY `FKmv0l0yt2099ffo2pjdrdbbj9h` (`INDEX_FIELD_ID`),
  CONSTRAINT `FKmv0l0yt2099ffo2pjdrdbbj9h` FOREIGN KEY (`INDEX_FIELD_ID`) REFERENCES `BLC_INDEX_FIELD` (`INDEX_FIELD_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `BLC_INDEX_FIELD_TYPE` WRITE;
/*!40000 ALTER TABLE `BLC_INDEX_FIELD_TYPE` DISABLE KEYS */;
INSERT INTO `BLC_INDEX_FIELD_TYPE` VALUES (1,'t',1);
INSERT INTO `BLC_INDEX_FIELD_TYPE` VALUES (2,'s',1);
INSERT INTO `BLC_INDEX_FIELD_TYPE` VALUES (3,'i',2);
INSERT INTO `BLC_INDEX_FIELD_TYPE` VALUES (4,'p',3);
INSERT INTO `BLC_INDEX_FIELD_TYPE` VALUES (5,'t',4);
INSERT INTO `BLC_INDEX_FIELD_TYPE` VALUES (6,'t',5);
INSERT INTO `BLC_INDEX_FIELD_TYPE` VALUES (7,'t',6);
INSERT INTO `BLC_INDEX_FIELD_TYPE` VALUES (8,'t',7);
INSERT INTO `BLC_INDEX_FIELD_TYPE` VALUES (9,'ss',8);
INSERT INTO `BLC_INDEX_FIELD_TYPE` VALUES (10,'p',9);
/*!40000 ALTER TABLE `BLC_INDEX_FIELD_TYPE` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `BLC_ISO_COUNTRY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BLC_ISO_COUNTRY` (
  `ALPHA_2` varchar(255) NOT NULL,
  `ALPHA_3` varchar(255) DEFAULT NULL,
  `NAME` varchar(255) DEFAULT NULL,
  `NUMERIC_CODE` int(11) DEFAULT NULL,
  `STATUS` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ALPHA_2`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `BLC_ISO_COUNTRY` WRITE;
/*!40000 ALTER TABLE `BLC_ISO_COUNTRY` DISABLE KEYS */;
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('AA',NULL,NULL,-1,'USER_ASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('AB',NULL,NULL,-1,'UNASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('AC','ASC','Ascension Island',-1,'EXCEPTIONALLY_RESERVED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('AD','AND','Andorra',20,'OFFICIALLY_ASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('AE','ARE','United Arab Emirates',784,'OFFICIALLY_ASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('AF','AFG','Afghanistan',4,'OFFICIALLY_ASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('AG','ATG','Antigua and Barbuda',28,'OFFICIALLY_ASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('AH',NULL,NULL,-1,'UNASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('AI','AIA','Anguilla',660,'OFFICIALLY_ASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('AJ',NULL,NULL,-1,'UNASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('AK',NULL,NULL,-1,'UNASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('AL','ALB','Albania',8,'OFFICIALLY_ASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('AM','ARM','Armenia',51,'OFFICIALLY_ASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('AN','ANHH','Netherlands Antilles',530,'TRANSITIONALLY_RESERVED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('AO','AGO','Angola',24,'OFFICIALLY_ASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('AP',NULL,NULL,-1,'NOT_USED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('AQ','ATA','Antarctica',10,'OFFICIALLY_ASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('AR','ARG','Argentina',32,'OFFICIALLY_ASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('AS','ASM','American Samoa',16,'OFFICIALLY_ASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('AT','AUT','Austria',40,'OFFICIALLY_ASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('AU','AUS','Australia',36,'OFFICIALLY_ASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('AV',NULL,NULL,-1,'UNASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('AW','ABW','Aruba',533,'OFFICIALLY_ASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('AY',NULL,NULL,-1,'UNASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('AZ','AZE','Azerbaijan',31,'OFFICIALLY_ASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('BA','BIH','Bosnia and Herzegovina',70,'OFFICIALLY_ASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('BB','BRB','Barbados',52,'OFFICIALLY_ASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('BC',NULL,NULL,-1,'UNASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('BD','BGD','Bangladesh',50,'OFFICIALLY_ASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('BE','BEL','Belgium',56,'OFFICIALLY_ASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('BF','BFA','Burkina Faso',854,'OFFICIALLY_ASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('BG','BGR','Bulgaria',100,'OFFICIALLY_ASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('BH','BHR','Bahrain',48,'OFFICIALLY_ASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('BI','BDI','Burundi',108,'OFFICIALLY_ASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('BJ','BEN','Benin',204,'OFFICIALLY_ASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('BK',NULL,NULL,-1,'UNASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('BL','BLM','Saint Barthélemy',652,'OFFICIALLY_ASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('BM','BMU','Bermuda',60,'OFFICIALLY_ASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('BN','BRN','Brunei Darussalam',96,'OFFICIALLY_ASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('BO','BOL','Bolivia, Plurinational State of',68,'OFFICIALLY_ASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('BP',NULL,NULL,-1,'UNASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('BQ','BES','Bonaire, Sint Eustatius and Saba',535,'OFFICIALLY_ASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('BR','BRA','Brazil',76,'OFFICIALLY_ASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('BS','BHS','Bahamas',44,'OFFICIALLY_ASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('BT','BTN','Bhutan',64,'OFFICIALLY_ASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('BU','BUMM','Burma',104,'TRANSITIONALLY_RESERVED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('BV','BVT','Bouvet Island',74,'OFFICIALLY_ASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('BW','BWA','Botswana',72,'OFFICIALLY_ASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('BX',NULL,NULL,-1,'NOT_USED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('BY','BLR','Belarus',112,'OFFICIALLY_ASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('BZ','BLZ','Belize',84,'OFFICIALLY_ASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('CA','CAN','Canada',124,'OFFICIALLY_ASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('CB',NULL,NULL,-1,'UNASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('CC','CCK','Cocos (Keeling) Islands',166,'OFFICIALLY_ASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('CD','COD','Congo, the Democratic Republic of the',180,'OFFICIALLY_ASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('CE',NULL,NULL,-1,'UNASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('CF','CAF','Central African Republic',140,'OFFICIALLY_ASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('CG','COG','Congo',178,'OFFICIALLY_ASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('CH','CHE','Switzerland',756,'OFFICIALLY_ASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('CI','CIV','Côte d\'Ivoire',384,'OFFICIALLY_ASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('CJ',NULL,NULL,-1,'UNASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('CK','COK','Cook Islands',184,'OFFICIALLY_ASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('CL','CHL','Chile',152,'OFFICIALLY_ASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('CM','CMR','Cameroon',120,'OFFICIALLY_ASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('CN','CHN','China',156,'OFFICIALLY_ASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('CO','COL','Colombia',170,'OFFICIALLY_ASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('CP','CPT','Clipperton Island',-1,'EXCEPTIONALLY_RESERVED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('CQ',NULL,NULL,-1,'UNASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('CR','CRI','Costa Rica',188,'OFFICIALLY_ASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('CS','CSXX','Serbia and Montenegro',891,'TRANSITIONALLY_RESERVED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('CT',NULL,NULL,-1,'UNASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('CU','CUB','Cuba',192,'OFFICIALLY_ASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('CV','CPV','Cape Verde',132,'OFFICIALLY_ASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('CW','CUW','Curaçao',531,'OFFICIALLY_ASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('CX','CXR','Christmas Island',162,'OFFICIALLY_ASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('CY','CYP','Cyprus',196,'OFFICIALLY_ASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('CZ','CZE','Czech Republic',203,'OFFICIALLY_ASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('DA',NULL,NULL,-1,'UNASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('DB',NULL,NULL,-1,'UNASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('DC',NULL,NULL,-1,'UNASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('DD',NULL,NULL,-1,'UNASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('DE','DEU','Germany',276,'OFFICIALLY_ASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('DF',NULL,NULL,-1,'UNASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('DG','DGA','Diego Garcia',-1,'EXCEPTIONALLY_RESERVED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('DH',NULL,NULL,-1,'UNASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('DI',NULL,NULL,-1,'UNASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('DJ','DJI','Djibouti',262,'OFFICIALLY_ASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('DK','DNK','Denmark',208,'OFFICIALLY_ASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('DL',NULL,NULL,-1,'UNASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('DM','DMA','Dominica',212,'OFFICIALLY_ASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('DN',NULL,NULL,-1,'UNASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('DO','DOM','Dominican Republic',214,'OFFICIALLY_ASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('DP',NULL,NULL,-1,'UNASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('DQ',NULL,NULL,-1,'UNASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('DR',NULL,NULL,-1,'UNASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('DS',NULL,NULL,-1,'UNASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('DT',NULL,NULL,-1,'UNASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('DU',NULL,NULL,-1,'UNASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('DV',NULL,NULL,-1,'UNASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('DW',NULL,NULL,-1,'UNASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('DX',NULL,NULL,-1,'UNASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('DY',NULL,NULL,-1,'INDETERMINATELY_RESERVED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('DZ','DZA','Algeria',12,'OFFICIALLY_ASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('EA','null','Ceuta, Melilla',-1,'EXCEPTIONALLY_RESERVED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('EB',NULL,NULL,-1,'UNASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('EC','ECU','Ecuador',218,'OFFICIALLY_ASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('ED',NULL,NULL,-1,'UNASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('EE','EST','Estonia',233,'OFFICIALLY_ASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('EF',NULL,NULL,-1,'NOT_USED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('EG','EGY','Egypt',818,'OFFICIALLY_ASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('EH','ESH','Western Sahara',732,'OFFICIALLY_ASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('EI',NULL,NULL,-1,'UNASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('EJ',NULL,NULL,-1,'UNASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('EK',NULL,NULL,-1,'UNASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('EL',NULL,NULL,-1,'UNASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('EM',NULL,NULL,-1,'NOT_USED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('EN',NULL,NULL,-1,'UNASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('EO',NULL,NULL,-1,'UNASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('EP',NULL,NULL,-1,'NOT_USED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('EQ',NULL,NULL,-1,'UNASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('ER','ERI','Eritrea',232,'OFFICIALLY_ASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('ES','ESP','Spain',724,'OFFICIALLY_ASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('ET','ETH','Ethiopia',231,'OFFICIALLY_ASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('EU','null','European Union',-1,'EXCEPTIONALLY_RESERVED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('EV',NULL,NULL,-1,'NOT_USED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('EW',NULL,NULL,-1,'INDETERMINATELY_RESERVED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('EX',NULL,NULL,-1,'UNASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('EY',NULL,NULL,-1,'UNASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('EZ',NULL,NULL,-1,'UNASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('FA',NULL,NULL,-1,'UNASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('FB',NULL,NULL,-1,'UNASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('FC',NULL,NULL,-1,'UNASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('FD',NULL,NULL,-1,'UNASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('FE',NULL,NULL,-1,'UNASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('FF',NULL,NULL,-1,'UNASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('FG',NULL,NULL,-1,'UNASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('FH',NULL,NULL,-1,'UNASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('FI','FIN','Finland',246,'OFFICIALLY_ASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('FJ','FJI','Fiji',242,'OFFICIALLY_ASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('FK','FLK','Falkland Islands (Malvinas)',238,'OFFICIALLY_ASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('FL',NULL,NULL,-1,'INDETERMINATELY_RESERVED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('FM','FSM','Micronesia, Federated States of',583,'OFFICIALLY_ASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('FN',NULL,NULL,-1,'UNASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('FO','FRO','Faroe Islands',234,'OFFICIALLY_ASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('FP',NULL,NULL,-1,'UNASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('FQ',NULL,NULL,-1,'UNASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('FR','FRA','France',250,'OFFICIALLY_ASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('FS',NULL,NULL,-1,'UNASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('FT',NULL,NULL,-1,'UNASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('FU',NULL,NULL,-1,'UNASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('FV',NULL,NULL,-1,'UNASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('FW',NULL,NULL,-1,'UNASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('FX','FXX','France, Metropolitan',-1,'EXCEPTIONALLY_RESERVED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('FY',NULL,NULL,-1,'UNASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('FZ',NULL,NULL,-1,'UNASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('GA','GAB','Gabon',266,'OFFICIALLY_ASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('GB','GBR','United Kingdom',826,'OFFICIALLY_ASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('GC',NULL,NULL,-1,'NOT_USED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('GD','GRD','Grenada',308,'OFFICIALLY_ASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('GE','GEO','Georgia',268,'OFFICIALLY_ASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('GF','GUF','French Guiana',254,'OFFICIALLY_ASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('GG','GGY','Guernsey',831,'OFFICIALLY_ASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('GH','GHA','Ghana',288,'OFFICIALLY_ASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('GI','GIB','Gibraltar',292,'OFFICIALLY_ASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('GJ',NULL,NULL,-1,'UNASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('GK',NULL,NULL,-1,'UNASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('GL','GRL','Greenland',304,'OFFICIALLY_ASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('GM','GMB','Gambia',270,'OFFICIALLY_ASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('GN','GIN','Guinea',324,'OFFICIALLY_ASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('GO',NULL,NULL,-1,'UNASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('GP','GLP','Guadeloupe',312,'OFFICIALLY_ASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('GQ','GNQ','Equatorial Guinea',226,'OFFICIALLY_ASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('GR','GRC','Greece',300,'OFFICIALLY_ASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('GS','SGS','South Georgia and the South Sandwich Islands',239,'OFFICIALLY_ASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('GT','GTM','Guatemala',320,'OFFICIALLY_ASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('GU','GUM','Guam',316,'OFFICIALLY_ASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('GV',NULL,NULL,-1,'UNASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('GW','GNB','Guinea-Bissau',624,'OFFICIALLY_ASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('GX',NULL,NULL,-1,'UNASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('GY','GUY','Guyana',328,'OFFICIALLY_ASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('GZ',NULL,NULL,-1,'UNASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('HA',NULL,NULL,-1,'UNASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('HB',NULL,NULL,-1,'UNASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('HC',NULL,NULL,-1,'UNASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('HD',NULL,NULL,-1,'UNASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('HE',NULL,NULL,-1,'UNASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('HF',NULL,NULL,-1,'UNASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('HG',NULL,NULL,-1,'UNASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('HH',NULL,NULL,-1,'UNASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('HI',NULL,NULL,-1,'UNASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('HJ',NULL,NULL,-1,'UNASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('HK','HKG','Hong Kong',344,'OFFICIALLY_ASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('HL',NULL,NULL,-1,'UNASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('HM','HMD','Heard Island and McDonald Islands',334,'OFFICIALLY_ASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('HN','HND','Honduras',340,'OFFICIALLY_ASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('HO',NULL,NULL,-1,'UNASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('HP',NULL,NULL,-1,'UNASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('HQ',NULL,NULL,-1,'UNASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('HR','HRV','Croatia',191,'OFFICIALLY_ASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('HS',NULL,NULL,-1,'UNASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('HT','HTI','Haiti',332,'OFFICIALLY_ASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('HU','HUN','Hungary',348,'OFFICIALLY_ASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('HV',NULL,NULL,-1,'UNASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('HW',NULL,NULL,-1,'UNASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('HX',NULL,NULL,-1,'UNASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('HY',NULL,NULL,-1,'UNASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('HZ',NULL,NULL,-1,'UNASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('IA',NULL,NULL,-1,'UNASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('IB',NULL,NULL,-1,'NOT_USED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('IC','null','Canary Islands',-1,'EXCEPTIONALLY_RESERVED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('ID','IDN','Indonesia',360,'OFFICIALLY_ASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('IE','IRL','Ireland',372,'OFFICIALLY_ASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('IF',NULL,NULL,-1,'UNASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('IG',NULL,NULL,-1,'UNASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('IH',NULL,NULL,-1,'UNASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('II',NULL,NULL,-1,'UNASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('IJ',NULL,NULL,-1,'UNASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('IK',NULL,NULL,-1,'UNASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('IL','ISR','Israel',376,'OFFICIALLY_ASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('IM','IMN','Isle of Man',833,'OFFICIALLY_ASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('IN','IND','India',356,'OFFICIALLY_ASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('IO','IOT','British Indian Ocean Territory',86,'OFFICIALLY_ASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('IP',NULL,NULL,-1,'UNASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('IQ','IRQ','Iraq',368,'OFFICIALLY_ASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('IR','IRN','Iran, Islamic Republic of',364,'OFFICIALLY_ASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('IS','ISL','Iceland',352,'OFFICIALLY_ASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('IT','ITA','Italy',380,'OFFICIALLY_ASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('IU',NULL,NULL,-1,'UNASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('IV',NULL,NULL,-1,'UNASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('IW',NULL,NULL,-1,'UNASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('IX',NULL,NULL,-1,'UNASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('IY',NULL,NULL,-1,'UNASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('IZ',NULL,NULL,-1,'UNASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('JA',NULL,NULL,-1,'INDETERMINATELY_RESERVED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('JB',NULL,NULL,-1,'UNASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('JC',NULL,NULL,-1,'UNASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('JD',NULL,NULL,-1,'UNASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('JE','JEY','Jersey',832,'OFFICIALLY_ASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('JF',NULL,NULL,-1,'UNASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('JG',NULL,NULL,-1,'UNASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('JH',NULL,NULL,-1,'UNASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('JI',NULL,NULL,-1,'UNASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('JJ',NULL,NULL,-1,'UNASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('JK',NULL,NULL,-1,'UNASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('JL',NULL,NULL,-1,'UNASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('JM','JAM','Jamaica',388,'OFFICIALLY_ASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('JN',NULL,NULL,-1,'UNASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('JO','JOR','Jordan',400,'OFFICIALLY_ASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('JP','JPN','Japan',392,'OFFICIALLY_ASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('JQ',NULL,NULL,-1,'UNASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('JR',NULL,NULL,-1,'UNASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('JS',NULL,NULL,-1,'UNASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('JT',NULL,NULL,-1,'UNASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('JU',NULL,NULL,-1,'UNASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('JV',NULL,NULL,-1,'UNASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('JW',NULL,NULL,-1,'UNASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('JX',NULL,NULL,-1,'UNASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('JY',NULL,NULL,-1,'UNASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('JZ',NULL,NULL,-1,'UNASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('KA',NULL,NULL,-1,'UNASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('KB',NULL,NULL,-1,'UNASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('KC',NULL,NULL,-1,'UNASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('KD',NULL,NULL,-1,'UNASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('KE','KEN','Kenya',404,'OFFICIALLY_ASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('KF',NULL,NULL,-1,'UNASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('KG','KGZ','Kyrgyzstan',417,'OFFICIALLY_ASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('KH','KHM','Cambodia',116,'OFFICIALLY_ASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('KI','KIR','Kiribati',296,'OFFICIALLY_ASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('KJ',NULL,NULL,-1,'UNASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('KK',NULL,NULL,-1,'UNASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('KL',NULL,NULL,-1,'UNASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('KM','COM','Comoros',174,'OFFICIALLY_ASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('KN','KNA','Saint Kitts and Nevis',659,'OFFICIALLY_ASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('KO',NULL,NULL,-1,'UNASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('KP','PRK','Korea, Democratic People\'s Republic of',408,'OFFICIALLY_ASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('KQ',NULL,NULL,-1,'UNASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('KR','KOR','Korea, Republic of',410,'OFFICIALLY_ASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('KS',NULL,NULL,-1,'UNASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('KT',NULL,NULL,-1,'UNASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('KU',NULL,NULL,-1,'UNASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('KV',NULL,NULL,-1,'UNASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('KW','KWT','Kuwait',414,'OFFICIALLY_ASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('KX',NULL,NULL,-1,'UNASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('KY','CYM','Cayman Islands',136,'OFFICIALLY_ASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('KZ','KAZ','Kazakhstan',398,'OFFICIALLY_ASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('LA','LAO','Lao People\'s Democratic Republic',418,'OFFICIALLY_ASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('LB','LBN','Lebanon',422,'OFFICIALLY_ASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('LC','LCA','Saint Lucia',662,'OFFICIALLY_ASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('LD',NULL,NULL,-1,'UNASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('LE',NULL,NULL,-1,'UNASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('LF',NULL,NULL,-1,'INDETERMINATELY_RESERVED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('LG',NULL,NULL,-1,'UNASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('LH',NULL,NULL,-1,'UNASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('LI','LIE','Liechtenstein',438,'OFFICIALLY_ASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('LJ',NULL,NULL,-1,'UNASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('LK','LKA','Sri Lanka',144,'OFFICIALLY_ASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('LL',NULL,NULL,-1,'UNASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('LM',NULL,NULL,-1,'UNASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('LN',NULL,NULL,-1,'UNASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('LO',NULL,NULL,-1,'UNASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('LP',NULL,NULL,-1,'UNASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('LQ',NULL,NULL,-1,'UNASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('LR','LBR','Liberia',430,'OFFICIALLY_ASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('LS','LSO','Lesotho',426,'OFFICIALLY_ASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('LT','LTU','Lithuania',440,'OFFICIALLY_ASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('LU','LUX','Luxembourg',442,'OFFICIALLY_ASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('LV','LVA','Latvia',428,'OFFICIALLY_ASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('LW',NULL,NULL,-1,'UNASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('LX',NULL,NULL,-1,'UNASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('LY','LBY','Libya',434,'OFFICIALLY_ASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('LZ',NULL,NULL,-1,'UNASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('MA','MAR','Morocco',504,'OFFICIALLY_ASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('MB',NULL,NULL,-1,'UNASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('MC','MCO','Monaco',492,'OFFICIALLY_ASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('MD','MDA','Moldova, Republic of',498,'OFFICIALLY_ASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('ME','MNE','Montenegro',499,'OFFICIALLY_ASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('MF','MAF','Saint Martin (French part)',663,'OFFICIALLY_ASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('MG','MDG','Madagascar',450,'OFFICIALLY_ASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('MH','MHL','Marshall Islands',584,'OFFICIALLY_ASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('MI',NULL,NULL,-1,'UNASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('MJ',NULL,NULL,-1,'UNASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('MK','MKD','Macedonia, the former Yugoslav Republic of',807,'OFFICIALLY_ASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('ML','MLI','Mali',466,'OFFICIALLY_ASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('MM','MMR','Myanmar',104,'OFFICIALLY_ASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('MN','MNG','Mongolia',496,'OFFICIALLY_ASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('MO','MAC','Macao',446,'OFFICIALLY_ASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('MP','MNP','Northern Mariana Islands',580,'OFFICIALLY_ASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('MQ','MTQ','Martinique',474,'OFFICIALLY_ASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('MR','MRT','Mauritania',478,'OFFICIALLY_ASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('MS','MSR','Montserrat',500,'OFFICIALLY_ASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('MT','MLT','Malta',470,'OFFICIALLY_ASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('MU','MUS','Mauritius',480,'OFFICIALLY_ASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('MV','MDV','Maldives',462,'OFFICIALLY_ASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('MW','MWI','Malawi',454,'OFFICIALLY_ASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('MX','MEX','Mexico',484,'OFFICIALLY_ASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('MY','MYS','Malaysia',458,'OFFICIALLY_ASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('MZ','MOZ','Mozambique',508,'OFFICIALLY_ASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('NA','NAM','Namibia',516,'OFFICIALLY_ASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('NB',NULL,NULL,-1,'UNASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('NC','NCL','New Caledonia',540,'OFFICIALLY_ASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('ND',NULL,NULL,-1,'UNASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('NE','NER','Niger',562,'OFFICIALLY_ASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('NF','NFK','Norfolk Island',574,'OFFICIALLY_ASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('NG','NGA','Nigeria',566,'OFFICIALLY_ASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('NH',NULL,NULL,-1,'UNASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('NI','NIC','Nicaragua',558,'OFFICIALLY_ASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('NJ',NULL,NULL,-1,'UNASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('NK',NULL,NULL,-1,'UNASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('NL','NLD','Netherlands',528,'OFFICIALLY_ASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('NM',NULL,NULL,-1,'UNASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('NN',NULL,NULL,-1,'UNASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('NO','NOR','Norway',578,'OFFICIALLY_ASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('NP','NPL','Nepal',524,'OFFICIALLY_ASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('NQ',NULL,NULL,-1,'UNASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('NR','NRU','Nauru',520,'OFFICIALLY_ASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('NS',NULL,NULL,-1,'UNASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('NT','NTHH','Neutral Zone',536,'TRANSITIONALLY_RESERVED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('NU','NIU','Niue',570,'OFFICIALLY_ASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('NV',NULL,NULL,-1,'UNASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('NW',NULL,NULL,-1,'UNASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('NX',NULL,NULL,-1,'UNASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('NY',NULL,NULL,-1,'UNASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('NZ','NZL','New Zealand',554,'OFFICIALLY_ASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('OA',NULL,NULL,-1,'NOT_USED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('OB',NULL,NULL,-1,'UNASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('OC',NULL,NULL,-1,'UNASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('OD',NULL,NULL,-1,'UNASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('OE',NULL,NULL,-1,'UNASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('OF',NULL,NULL,-1,'UNASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('OG',NULL,NULL,-1,'UNASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('OH',NULL,NULL,-1,'UNASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('OI',NULL,NULL,-1,'UNASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('OJ',NULL,NULL,-1,'UNASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('OK',NULL,NULL,-1,'UNASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('OL',NULL,NULL,-1,'UNASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('OM','OMN','Oman',512,'OFFICIALLY_ASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('ON',NULL,NULL,-1,'UNASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('OO',NULL,NULL,-1,'UNASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('OP',NULL,NULL,-1,'UNASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('OQ',NULL,NULL,-1,'UNASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('OR',NULL,NULL,-1,'UNASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('OS',NULL,NULL,-1,'UNASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('OT',NULL,NULL,-1,'UNASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('OU',NULL,NULL,-1,'UNASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('OV',NULL,NULL,-1,'UNASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('OW',NULL,NULL,-1,'UNASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('OX',NULL,NULL,-1,'UNASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('OY',NULL,NULL,-1,'UNASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('OZ',NULL,NULL,-1,'UNASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('PA','PAN','Panama',591,'OFFICIALLY_ASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('PB',NULL,NULL,-1,'UNASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('PC',NULL,NULL,-1,'UNASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('PD',NULL,NULL,-1,'UNASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('PE','PER','Peru',604,'OFFICIALLY_ASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('PF','PYF','French Polynesia',258,'OFFICIALLY_ASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('PG','PNG','Papua New Guinea',598,'OFFICIALLY_ASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('PH','PHL','Philippines',608,'OFFICIALLY_ASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('PI',NULL,NULL,-1,'INDETERMINATELY_RESERVED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('PJ',NULL,NULL,-1,'UNASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('PK','PAK','Pakistan',586,'OFFICIALLY_ASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('PL','POL','Poland',616,'OFFICIALLY_ASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('PM','SPM','Saint Pierre and Miquelon',666,'OFFICIALLY_ASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('PN','PCN','Pitcairn',612,'OFFICIALLY_ASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('PO',NULL,NULL,-1,'UNASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('PP',NULL,NULL,-1,'UNASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('PQ',NULL,NULL,-1,'UNASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('PR','PRI','Puerto Rico',630,'OFFICIALLY_ASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('PS','PSE','Palestine, State of',275,'OFFICIALLY_ASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('PT','PRT','Portugal',620,'OFFICIALLY_ASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('PU',NULL,NULL,-1,'UNASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('PV',NULL,NULL,-1,'UNASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('PW','PLW','Palau',585,'OFFICIALLY_ASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('PX',NULL,NULL,-1,'UNASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('PY','PRY','Paraguay',600,'OFFICIALLY_ASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('PZ',NULL,NULL,-1,'UNASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('QA','QAT','Qatar',634,'OFFICIALLY_ASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('QB',NULL,NULL,-1,'UNASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('QC',NULL,NULL,-1,'UNASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('QD',NULL,NULL,-1,'UNASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('QE',NULL,NULL,-1,'UNASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('QF',NULL,NULL,-1,'UNASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('QG',NULL,NULL,-1,'UNASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('QH',NULL,NULL,-1,'UNASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('QI',NULL,NULL,-1,'UNASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('QJ',NULL,NULL,-1,'UNASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('QK',NULL,NULL,-1,'UNASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('QL',NULL,NULL,-1,'UNASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('QM',NULL,NULL,-1,'USER_ASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('QN',NULL,NULL,-1,'USER_ASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('QO',NULL,NULL,-1,'USER_ASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('QP',NULL,NULL,-1,'USER_ASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('QQ',NULL,NULL,-1,'USER_ASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('QR',NULL,NULL,-1,'USER_ASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('QS',NULL,NULL,-1,'USER_ASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('QT',NULL,NULL,-1,'USER_ASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('QU',NULL,NULL,-1,'USER_ASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('QV',NULL,NULL,-1,'USER_ASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('QW',NULL,NULL,-1,'USER_ASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('QX',NULL,NULL,-1,'USER_ASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('QY',NULL,NULL,-1,'USER_ASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('QZ',NULL,NULL,-1,'USER_ASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('RA',NULL,NULL,-1,'INDETERMINATELY_RESERVED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('RB',NULL,NULL,-1,'INDETERMINATELY_RESERVED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('RC',NULL,NULL,-1,'INDETERMINATELY_RESERVED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('RD',NULL,NULL,-1,'UNASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('RE','REU','Réunion',638,'OFFICIALLY_ASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('RF',NULL,NULL,-1,'UNASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('RG',NULL,NULL,-1,'UNASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('RH',NULL,NULL,-1,'INDETERMINATELY_RESERVED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('RI',NULL,NULL,-1,'INDETERMINATELY_RESERVED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('RJ',NULL,NULL,-1,'UNASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('RK',NULL,NULL,-1,'UNASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('RL',NULL,NULL,-1,'INDETERMINATELY_RESERVED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('RM',NULL,NULL,-1,'INDETERMINATELY_RESERVED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('RN',NULL,NULL,-1,'INDETERMINATELY_RESERVED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('RO','ROU','Romania',642,'OFFICIALLY_ASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('RP',NULL,NULL,-1,'INDETERMINATELY_RESERVED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('RQ',NULL,NULL,-1,'UNASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('RR',NULL,NULL,-1,'UNASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('RS','SRB','Serbia',688,'OFFICIALLY_ASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('RT',NULL,NULL,-1,'UNASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('RU','RUS','Russian Federation',643,'OFFICIALLY_ASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('RV',NULL,NULL,-1,'UNASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('RW','RWA','Rwanda',646,'OFFICIALLY_ASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('RX',NULL,NULL,-1,'UNASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('RY',NULL,NULL,-1,'UNASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('RZ',NULL,NULL,-1,'UNASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('SA','SAU','Saudi Arabia',682,'OFFICIALLY_ASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('SB','SLB','Solomon Islands',90,'OFFICIALLY_ASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('SC','SYC','Seychelles',690,'OFFICIALLY_ASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('SD','SDN','Sudan',729,'OFFICIALLY_ASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('SE','SWE','Sweden',752,'OFFICIALLY_ASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('SF','FIN','Finland',246,'TRANSITIONALLY_RESERVED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('SG','SGP','Singapore',702,'OFFICIALLY_ASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('SH','SHN','Saint Helena, Ascension and Tristan da Cunha',654,'OFFICIALLY_ASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('SI','SVN','Slovenia',705,'OFFICIALLY_ASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('SJ','SJM','Svalbard and Jan Mayen',744,'OFFICIALLY_ASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('SK','SVK','Slovakia',703,'OFFICIALLY_ASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('SL','SLE','Sierra Leone',694,'OFFICIALLY_ASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('SM','SMR','San Marino',674,'OFFICIALLY_ASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('SN','SEN','Senegal',686,'OFFICIALLY_ASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('SO','SOM','Somalia',706,'OFFICIALLY_ASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('SP',NULL,NULL,-1,'UNASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('SQ',NULL,NULL,-1,'UNASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('SR','SUR','Suriname',740,'OFFICIALLY_ASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('SS','SSD','South Sudan',728,'OFFICIALLY_ASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('ST','STP','Sao Tome and Principe',678,'OFFICIALLY_ASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('SU','SUN','USSR',-1,'EXCEPTIONALLY_RESERVED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('SV','SLV','El Salvador',222,'OFFICIALLY_ASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('SW',NULL,NULL,-1,'UNASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('SX','SXM','Sint Maarten (Dutch part)',534,'OFFICIALLY_ASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('SY','SYR','Syrian Arab Republic',760,'OFFICIALLY_ASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('SZ','SWZ','Swaziland',748,'OFFICIALLY_ASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('TA','TAA','Tristan da Cunha',-1,'EXCEPTIONALLY_RESERVED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('TB',NULL,NULL,-1,'UNASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('TC','TCA','Turks and Caicos Islands',796,'OFFICIALLY_ASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('TD','TCD','Chad',148,'OFFICIALLY_ASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('TE',NULL,NULL,-1,'UNASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('TF','ATF','French Southern Territories',260,'OFFICIALLY_ASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('TG','TGO','Togo',768,'OFFICIALLY_ASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('TH','THA','Thailand',764,'OFFICIALLY_ASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('TI',NULL,NULL,-1,'UNASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('TJ','TJK','Tajikistan',762,'OFFICIALLY_ASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('TK','TKL','Tokelau',772,'OFFICIALLY_ASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('TL','TLS','Timor-Leste',626,'OFFICIALLY_ASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('TM','TKM','Turkmenistan',795,'OFFICIALLY_ASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('TN','TUN','Tunisia',788,'OFFICIALLY_ASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('TO','TON','Tonga',776,'OFFICIALLY_ASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('TP','TPTL','East Timor',0,'TRANSITIONALLY_RESERVED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('TQ',NULL,NULL,-1,'UNASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('TR','TUR','Turkey',792,'OFFICIALLY_ASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('TS',NULL,NULL,-1,'UNASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('TT','TTO','Trinidad and Tobago',780,'OFFICIALLY_ASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('TU',NULL,NULL,-1,'UNASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('TV','TUV','Tuvalu',798,'OFFICIALLY_ASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('TW','TWN','Taiwan, Province of China',158,'OFFICIALLY_ASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('TX',NULL,NULL,-1,'UNASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('TY',NULL,NULL,-1,'UNASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('TZ','TZA','Tanzania, United Republic of',834,'OFFICIALLY_ASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('UA','UKR','Ukraine',804,'OFFICIALLY_ASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('UB',NULL,NULL,-1,'UNASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('UC',NULL,NULL,-1,'UNASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('UD',NULL,NULL,-1,'UNASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('UE',NULL,NULL,-1,'UNASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('UF',NULL,NULL,-1,'UNASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('UG','UGA','Uganda',800,'OFFICIALLY_ASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('UH',NULL,NULL,-1,'UNASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('UI',NULL,NULL,-1,'UNASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('UJ',NULL,NULL,-1,'UNASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('UK','null','United Kingdom',-1,'EXCEPTIONALLY_RESERVED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('UL',NULL,NULL,-1,'UNASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('UM','UMI','United States Minor Outlying Islands',581,'OFFICIALLY_ASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('UN',NULL,NULL,-1,'UNASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('UO',NULL,NULL,-1,'UNASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('UP',NULL,NULL,-1,'UNASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('UQ',NULL,NULL,-1,'UNASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('UR',NULL,NULL,-1,'UNASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('US','USA','United States',840,'OFFICIALLY_ASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('UT',NULL,NULL,-1,'UNASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('UU',NULL,NULL,-1,'UNASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('UV',NULL,NULL,-1,'UNASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('UW',NULL,NULL,-1,'UNASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('UX',NULL,NULL,-1,'UNASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('UY','URY','Uruguay',858,'OFFICIALLY_ASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('UZ','UZB','Uzbekistan',860,'OFFICIALLY_ASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('VA','VAT','Holy See (Vatican City State)',336,'OFFICIALLY_ASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('VB',NULL,NULL,-1,'UNASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('VC','VCT','Saint Vincent and the Grenadines',670,'OFFICIALLY_ASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('VD',NULL,NULL,-1,'UNASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('VE','VEN','Venezuela, Bolivarian Republic of',862,'OFFICIALLY_ASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('VF',NULL,NULL,-1,'UNASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('VG','VGB','Virgin Islands, British',92,'OFFICIALLY_ASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('VH',NULL,NULL,-1,'UNASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('VI','VIR','Virgin Islands, U.S.',850,'OFFICIALLY_ASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('VJ',NULL,NULL,-1,'UNASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('VK',NULL,NULL,-1,'UNASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('VL',NULL,NULL,-1,'UNASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('VM',NULL,NULL,-1,'UNASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('VN','VNM','Viet Nam',704,'OFFICIALLY_ASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('VO',NULL,NULL,-1,'UNASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('VP',NULL,NULL,-1,'UNASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('VQ',NULL,NULL,-1,'UNASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('VR',NULL,NULL,-1,'UNASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('VS',NULL,NULL,-1,'UNASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('VT',NULL,NULL,-1,'UNASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('VU','VUT','Vanuatu',548,'OFFICIALLY_ASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('VV',NULL,NULL,-1,'UNASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('VW',NULL,NULL,-1,'UNASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('VX',NULL,NULL,-1,'UNASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('VY',NULL,NULL,-1,'UNASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('VZ',NULL,NULL,-1,'UNASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('WA',NULL,NULL,-1,'UNASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('WB',NULL,NULL,-1,'UNASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('WC',NULL,NULL,-1,'UNASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('WD',NULL,NULL,-1,'UNASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('WE',NULL,NULL,-1,'UNASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('WF','WLF','Wallis and Futuna',876,'OFFICIALLY_ASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('WG',NULL,NULL,-1,'INDETERMINATELY_RESERVED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('WH',NULL,NULL,-1,'UNASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('WI',NULL,NULL,-1,'UNASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('WJ',NULL,NULL,-1,'UNASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('WK',NULL,NULL,-1,'UNASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('WL',NULL,NULL,-1,'INDETERMINATELY_RESERVED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('WM',NULL,NULL,-1,'UNASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('WN',NULL,NULL,-1,'UNASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('WO',NULL,NULL,-1,'NOT_USED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('WP',NULL,NULL,-1,'UNASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('WQ',NULL,NULL,-1,'UNASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('WR',NULL,NULL,-1,'UNASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('WS','WSM','Samoa',882,'OFFICIALLY_ASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('WT',NULL,NULL,-1,'UNASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('WU',NULL,NULL,-1,'UNASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('WV',NULL,NULL,-1,'INDETERMINATELY_RESERVED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('WW',NULL,NULL,-1,'UNASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('WX',NULL,NULL,-1,'UNASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('WY',NULL,NULL,-1,'UNASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('WZ',NULL,NULL,-1,'UNASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('XA',NULL,NULL,-1,'USER_ASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('XB',NULL,NULL,-1,'USER_ASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('XC',NULL,NULL,-1,'USER_ASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('XD',NULL,NULL,-1,'USER_ASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('XE',NULL,NULL,-1,'USER_ASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('XF',NULL,NULL,-1,'USER_ASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('XG',NULL,NULL,-1,'USER_ASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('XH',NULL,NULL,-1,'USER_ASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('XI',NULL,NULL,-1,'USER_ASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('XJ',NULL,NULL,-1,'USER_ASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('XK','XXK','Kosovo, Republic of',-1,'USER_ASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('XL',NULL,NULL,-1,'USER_ASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('XM',NULL,NULL,-1,'USER_ASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('XN',NULL,NULL,-1,'USER_ASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('XO',NULL,NULL,-1,'USER_ASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('XP',NULL,NULL,-1,'USER_ASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('XQ',NULL,NULL,-1,'USER_ASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('XR',NULL,NULL,-1,'USER_ASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('XS',NULL,NULL,-1,'USER_ASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('XT',NULL,NULL,-1,'USER_ASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('XU',NULL,NULL,-1,'USER_ASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('XV',NULL,NULL,-1,'USER_ASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('XW',NULL,NULL,-1,'USER_ASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('XX',NULL,NULL,-1,'USER_ASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('XY',NULL,NULL,-1,'USER_ASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('XZ',NULL,NULL,-1,'USER_ASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('YA',NULL,NULL,-1,'UNASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('YB',NULL,NULL,-1,'UNASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('YC',NULL,NULL,-1,'UNASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('YD',NULL,NULL,-1,'UNASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('YE','YEM','Yemen',887,'OFFICIALLY_ASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('YF',NULL,NULL,-1,'UNASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('YG',NULL,NULL,-1,'UNASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('YH',NULL,NULL,-1,'UNASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('YI',NULL,NULL,-1,'UNASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('YJ',NULL,NULL,-1,'UNASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('YK',NULL,NULL,-1,'UNASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('YL',NULL,NULL,-1,'UNASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('YM',NULL,NULL,-1,'UNASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('YN',NULL,NULL,-1,'UNASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('YO',NULL,NULL,-1,'UNASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('YP',NULL,NULL,-1,'UNASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('YQ',NULL,NULL,-1,'UNASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('YR',NULL,NULL,-1,'UNASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('YS',NULL,NULL,-1,'UNASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('YT','MYT','Mayotte',175,'OFFICIALLY_ASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('YU','YUCS','Yugoslavia',890,'TRANSITIONALLY_RESERVED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('YV',NULL,NULL,-1,'INDETERMINATELY_RESERVED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('YW',NULL,NULL,-1,'UNASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('YX',NULL,NULL,-1,'UNASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('YY',NULL,NULL,-1,'UNASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('YZ',NULL,NULL,-1,'UNASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('ZA','ZAF','South Africa',710,'OFFICIALLY_ASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('ZB',NULL,NULL,-1,'UNASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('ZC',NULL,NULL,-1,'UNASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('ZD',NULL,NULL,-1,'UNASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('ZE',NULL,NULL,-1,'UNASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('ZF',NULL,NULL,-1,'UNASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('ZG',NULL,NULL,-1,'UNASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('ZH',NULL,NULL,-1,'UNASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('ZI',NULL,NULL,-1,'UNASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('ZJ',NULL,NULL,-1,'UNASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('ZK',NULL,NULL,-1,'UNASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('ZL',NULL,NULL,-1,'UNASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('ZM','ZMB','Zambia',894,'OFFICIALLY_ASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('ZN',NULL,NULL,-1,'UNASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('ZO',NULL,NULL,-1,'UNASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('ZP',NULL,NULL,-1,'UNASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('ZQ',NULL,NULL,-1,'UNASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('ZR','ZRCD','Zaire',0,'TRANSITIONALLY_RESERVED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('ZS',NULL,NULL,-1,'UNASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('ZT',NULL,NULL,-1,'UNASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('ZU',NULL,NULL,-1,'UNASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('ZV',NULL,NULL,-1,'UNASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('ZW','ZWE','Zimbabwe',716,'OFFICIALLY_ASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('ZX',NULL,NULL,-1,'UNASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('ZY',NULL,NULL,-1,'UNASSIGNED');
INSERT INTO `BLC_ISO_COUNTRY` VALUES ('ZZ',NULL,NULL,-1,'USER_ASSIGNED');
/*!40000 ALTER TABLE `BLC_ISO_COUNTRY` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `BLC_ITEM_OFFER_QUALIFIER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BLC_ITEM_OFFER_QUALIFIER` (
  `ITEM_OFFER_QUALIFIER_ID` bigint(20) NOT NULL,
  `QUANTITY` bigint(20) DEFAULT NULL,
  `OFFER_ID` bigint(20) NOT NULL,
  `ORDER_ITEM_ID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`ITEM_OFFER_QUALIFIER_ID`),
  KEY `FKo9i9n1thqcqt9nu0fv2nlg1ec` (`OFFER_ID`),
  KEY `FK9fl5rced4g4u8sxh1j4mrwkto` (`ORDER_ITEM_ID`),
  CONSTRAINT `FK9fl5rced4g4u8sxh1j4mrwkto` FOREIGN KEY (`ORDER_ITEM_ID`) REFERENCES `BLC_ORDER_ITEM` (`ORDER_ITEM_ID`),
  CONSTRAINT `FKo9i9n1thqcqt9nu0fv2nlg1ec` FOREIGN KEY (`OFFER_ID`) REFERENCES `BLC_OFFER` (`OFFER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `BLC_ITEM_OFFER_QUALIFIER` WRITE;
/*!40000 ALTER TABLE `BLC_ITEM_OFFER_QUALIFIER` DISABLE KEYS */;
/*!40000 ALTER TABLE `BLC_ITEM_OFFER_QUALIFIER` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `BLC_LOCALE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BLC_LOCALE` (
  `LOCALE_CODE` varchar(255) NOT NULL,
  `DEFAULT_FLAG` bit(1) DEFAULT NULL,
  `FRIENDLY_NAME` varchar(255) DEFAULT NULL,
  `USE_IN_SEARCH_INDEX` bit(1) DEFAULT NULL,
  `CURRENCY_CODE` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`LOCALE_CODE`),
  KEY `FK6gs37rhrtyd5ei2oqspxxrc3x` (`CURRENCY_CODE`),
  CONSTRAINT `FK6gs37rhrtyd5ei2oqspxxrc3x` FOREIGN KEY (`CURRENCY_CODE`) REFERENCES `BLC_CURRENCY` (`CURRENCY_CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `BLC_LOCALE` WRITE;
/*!40000 ALTER TABLE `BLC_LOCALE` DISABLE KEYS */;
INSERT INTO `BLC_LOCALE` VALUES ('en',_binary '\0','English',NULL,'USD');
INSERT INTO `BLC_LOCALE` VALUES ('en_GB',_binary '\0','English (United Kingdom)',NULL,'GBP');
INSERT INTO `BLC_LOCALE` VALUES ('en_US',_binary '','English US',NULL,'USD');
INSERT INTO `BLC_LOCALE` VALUES ('es',_binary '\0','Spanish',NULL,'EUR');
INSERT INTO `BLC_LOCALE` VALUES ('es_ES',_binary '\0','Spanish (Spain)',NULL,'EUR');
INSERT INTO `BLC_LOCALE` VALUES ('es_MX',_binary '\0','Spanish (Mexico)',NULL,'MXN');
INSERT INTO `BLC_LOCALE` VALUES ('fr',_binary '\0','French',NULL,'EUR');
INSERT INTO `BLC_LOCALE` VALUES ('fr_FR',_binary '\0','French (France)',NULL,'EUR');
/*!40000 ALTER TABLE `BLC_LOCALE` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `BLC_MEDIA`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BLC_MEDIA` (
  `MEDIA_ID` bigint(20) NOT NULL,
  `ALT_TEXT` varchar(255) DEFAULT NULL,
  `TAGS` varchar(255) DEFAULT NULL,
  `TITLE` varchar(255) DEFAULT NULL,
  `URL` varchar(255) NOT NULL,
  PRIMARY KEY (`MEDIA_ID`),
  KEY `MEDIA_TITLE_INDEX` (`TITLE`),
  KEY `MEDIA_URL_INDEX` (`URL`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `BLC_MEDIA` WRITE;
/*!40000 ALTER TABLE `BLC_MEDIA` DISABLE KEYS */;
INSERT INTO `BLC_MEDIA` VALUES (101,'primary',NULL,'Sudden Death Sauce Bottle','/cmsstatic/img/sauces/Sudden-Death-Sauce-Bottle.jpg');
INSERT INTO `BLC_MEDIA` VALUES (102,'alt1',NULL,'Sudden Death Sauce Close-up','/cmsstatic/img/sauces/Sudden-Death-Sauce-Close.jpg');
INSERT INTO `BLC_MEDIA` VALUES (201,'primary',NULL,'Sweet Death Sauce Bottle','/cmsstatic/img/sauces/Sweet-Death-Sauce-Bottle.jpg');
INSERT INTO `BLC_MEDIA` VALUES (202,'alt1',NULL,'Sweet Death Sauce Close-up','/cmsstatic/img/sauces/Sweet-Death-Sauce-Close.jpg');
INSERT INTO `BLC_MEDIA` VALUES (203,'alt2',NULL,'Sweet Death Sauce Close-up','/cmsstatic/img/sauces/Sweet-Death-Sauce-Skull.jpg');
INSERT INTO `BLC_MEDIA` VALUES (204,'alt3',NULL,'Sweet Death Sauce Close-up','/cmsstatic/img/sauces/Sweet-Death-Sauce-Tile.jpg');
INSERT INTO `BLC_MEDIA` VALUES (205,'alt4',NULL,'Sweet Death Sauce Close-up','/cmsstatic/img/sauces/Sweet-Death-Sauce-Grass.jpg');
INSERT INTO `BLC_MEDIA` VALUES (206,'alt5',NULL,'Sweet Death Sauce Close-up','/cmsstatic/img/sauces/Sweet-Death-Sauce-Logo.jpg');
INSERT INTO `BLC_MEDIA` VALUES (301,'primary',NULL,'Hoppin Hot Sauce Bottle','/cmsstatic/img/sauces/Hoppin-Hot-Sauce-Bottle.jpg');
INSERT INTO `BLC_MEDIA` VALUES (302,'alt1',NULL,'Hoppin Hot Sauce Close-up','/cmsstatic/img/sauces/Hoppin-Hot-Sauce-Close.jpg');
INSERT INTO `BLC_MEDIA` VALUES (401,'primary',NULL,'Day of the Dead Chipotle Hot Sauce Bottle','/cmsstatic/img/sauces/Day-of-the-Dead-Chipotle-Hot-Sauce-Bottle.jpg');
INSERT INTO `BLC_MEDIA` VALUES (402,'alt1',NULL,'Day of the Dead Chipotle Hot Sauce Close-up','/cmsstatic/img/sauces/Day-of-the-Dead-Chipotle-Hot-Sauce-Close.jpg');
INSERT INTO `BLC_MEDIA` VALUES (501,'primary',NULL,'Day of the Dead Habanero Hot Sauce Bottle','/cmsstatic/img/sauces/Day-of-the-Dead-Habanero-Hot-Sauce-Bottle.jpg');
INSERT INTO `BLC_MEDIA` VALUES (502,'alt1',NULL,'Day of the Dead Habanero Hot Sauce Close-up','/cmsstatic/img/sauces/Day-of-the-Dead-Habanero-Hot-Sauce-Close.jpg');
INSERT INTO `BLC_MEDIA` VALUES (601,'primary',NULL,'Day of the Dead Scotch Bonnet Hot Sauce Bottle','/cmsstatic/img/sauces/Day-of-the-Dead-Scotch-Bonnet-Hot-Sauce-Bottle.jpg');
INSERT INTO `BLC_MEDIA` VALUES (602,'alt1',NULL,'Day of the Dead Scotch Bonnet Hot Sauce Close-up','/cmsstatic/img/sauces/Day-of-the-Dead-Scotch-Bonnet-Hot-Sauce-Close.jpg');
INSERT INTO `BLC_MEDIA` VALUES (701,'primary',NULL,'Green Ghost Bottle','/cmsstatic/img/sauces/Green-Ghost-Bottle.jpg');
INSERT INTO `BLC_MEDIA` VALUES (702,'alt1',NULL,'Green Ghost Close-up','/cmsstatic/img/sauces/Green-Ghost-Close.jpg');
INSERT INTO `BLC_MEDIA` VALUES (801,'primary',NULL,'Blazin Saddle XXX Hot Habanero Pepper Sauce Bottle','/cmsstatic/img/sauces/Blazin-Saddle-XXX-Hot-Habanero-Pepper-Sauce-Bottle.jpg');
INSERT INTO `BLC_MEDIA` VALUES (802,'alt1',NULL,'Blazin Saddle XXX Hot Habanero Pepper Sauce Close-up','/cmsstatic/img/sauces/Blazin-Saddle-XXX-Hot-Habanero-Pepper-Sauce-Close.jpg');
INSERT INTO `BLC_MEDIA` VALUES (901,'primary',NULL,'Armageddon The Hot Sauce To End All Bottle','/cmsstatic/img/sauces/Armageddon-The-Hot-Sauce-To-End-All-Bottle.jpg');
INSERT INTO `BLC_MEDIA` VALUES (902,'alt1',NULL,'Armageddon The Hot Sauce To End All Close-up','/cmsstatic/img/sauces/Armageddon-The-Hot-Sauce-To-End-All-Close.jpg');
INSERT INTO `BLC_MEDIA` VALUES (1001,'primary',NULL,'Dr. Chilemeisters Insane Hot Sauce Bottle','/cmsstatic/img/sauces/Dr.-Chilemeisters-Insane-Hot-Sauce-Bottle.jpg');
INSERT INTO `BLC_MEDIA` VALUES (1002,'alt1',NULL,'Dr. Chilemeisters Insane Hot Sauce Close-up','/cmsstatic/img/sauces/Dr.-Chilemeisters-Insane-Hot-Sauce-Close.jpg');
INSERT INTO `BLC_MEDIA` VALUES (1101,'primary',NULL,'Bull Snort Cowboy Cayenne Pepper Hot Sauce Bottle','/cmsstatic/img/sauces/Bull-Snort-Cowboy-Cayenne-Pepper-Hot-Sauce-Bottle.jpg');
INSERT INTO `BLC_MEDIA` VALUES (1102,'alt1',NULL,'Bull Snort Cowboy Cayenne Pepper Hot Sauce Close-up','/cmsstatic/img/sauces/Bull-Snort-Cowboy-Cayenne-Pepper-Hot-Sauce-Close.jpg');
INSERT INTO `BLC_MEDIA` VALUES (1201,'primary',NULL,'Cafe Louisiane Sweet Cajun Blackening Sauce Bottle','/cmsstatic/img/sauces/Cafe-Louisiane-Sweet-Cajun-Blackening-Sauce-Bottle.jpg');
INSERT INTO `BLC_MEDIA` VALUES (1202,'alt1',NULL,'Cafe Louisiane Sweet Cajun Blackening Sauce Close-up','/cmsstatic/img/sauces/Cafe-Louisiane-Sweet-Cajun-Blackening-Sauce-Close.jpg');
INSERT INTO `BLC_MEDIA` VALUES (1301,'primary',NULL,'Bull Snort Smokin Toncils Hot Sauce Bottle','/cmsstatic/img/sauces/Bull-Snort-Smokin-Toncils-Hot-Sauce-Bottle.jpg');
INSERT INTO `BLC_MEDIA` VALUES (1302,'alt1',NULL,'Bull Snort Smokin Toncils Hot Sauce Close-up','/cmsstatic/img/sauces/Bull-Snort-Smokin-Toncils-Hot-Sauce-Close.jpg');
INSERT INTO `BLC_MEDIA` VALUES (1401,'primary',NULL,'Cool Cayenne Pepper Hot Sauce Bottle','/cmsstatic/img/sauces/Cool-Cayenne-Pepper-Hot-Sauce-Bottle.jpg');
INSERT INTO `BLC_MEDIA` VALUES (1402,'alt1',NULL,'Cool Cayenne Pepper Hot Sauce Close-up','/cmsstatic/img/sauces/Cool-Cayenne-Pepper-Hot-Sauce-Close.jpg');
INSERT INTO `BLC_MEDIA` VALUES (1501,'primary',NULL,'Roasted Garlic Hot Sauce Bottle','/cmsstatic/img/sauces/Roasted-Garlic-Hot-Sauce-Bottle.jpg');
INSERT INTO `BLC_MEDIA` VALUES (1502,'alt1',NULL,'Roasted Garlic Hot Sauce Close-up','/cmsstatic/img/sauces/Roasted-Garlic-Hot-Sauce-Close.jpg');
INSERT INTO `BLC_MEDIA` VALUES (1601,'primary',NULL,'Scotch Bonnet Hot Sauce Bottle','/cmsstatic/img/sauces/Scotch-Bonnet-Hot-Sauce-Bottle.jpg');
INSERT INTO `BLC_MEDIA` VALUES (1602,'alt1',NULL,'Scotch Bonnet Hot Sauce Close-up','/cmsstatic/img/sauces/Scotch-Bonnet-Hot-Sauce-Close.jpg');
INSERT INTO `BLC_MEDIA` VALUES (1701,'primary',NULL,'Insanity Sauce Bottle','/cmsstatic/img/sauces/Insanity-Sauce-Bottle.jpg');
INSERT INTO `BLC_MEDIA` VALUES (1702,'alt1',NULL,'Insanity Sauce Close-up','/cmsstatic/img/sauces/Insanity-Sauce-Close.jpg');
INSERT INTO `BLC_MEDIA` VALUES (1801,'primary',NULL,'Hurtin Jalepeno Hot Sauce Bottle','/cmsstatic/img/sauces/Hurtin-Jalepeno-Hot-Sauce-Bottle.jpg');
INSERT INTO `BLC_MEDIA` VALUES (1802,'alt1',NULL,'Hurtin Jalepeno Hot Sauce Close-up','/cmsstatic/img/sauces/Hurtin-Jalepeno-Hot-Sauce-Close.jpg');
INSERT INTO `BLC_MEDIA` VALUES (1901,'primary',NULL,'Roasted Red Pepper and Chipotle Hot Sauce Bottle','/cmsstatic/img/sauces/Roasted-Red-Pepper-and-Chipotle-Hot-Sauce-Bottle.jpg');
INSERT INTO `BLC_MEDIA` VALUES (1902,'alt1',NULL,'Roasted Red Pepper and Chipotle Hot Sauce Close-up','/cmsstatic/img/sauces/Roasted-Red-Pepper-and-Chipotle-Hot-Sauce-Close.jpg');
INSERT INTO `BLC_MEDIA` VALUES (10001,'primary','Black','Hawt Like a Habanero Men\'s Black','/cmsstatic/img/merch/habanero_mens_black.jpg');
INSERT INTO `BLC_MEDIA` VALUES (10002,'primary','Red','Hawt Like a Habanero Men\'s Red','/cmsstatic/img/merch/habanero_mens_red.jpg');
INSERT INTO `BLC_MEDIA` VALUES (10003,'primary','Silver','Hawt Like a Habanero Men\'s Silver','/cmsstatic/img/merch/habanero_mens_silver.jpg');
INSERT INTO `BLC_MEDIA` VALUES (20001,'primary','Black','Hawt Like a Habanero Women\'s Black','/cmsstatic/img/merch/habanero_womens_black.jpg');
INSERT INTO `BLC_MEDIA` VALUES (20002,'primary','Red','Hawt Like a Habanero Women\'s Red','/cmsstatic/img/merch/habanero_womens_red.jpg');
INSERT INTO `BLC_MEDIA` VALUES (20003,'primary','Silver','Hawt Like a Habanero Women\'s Silver','/cmsstatic/img/merch/habanero_womens_silver.jpg');
INSERT INTO `BLC_MEDIA` VALUES (30001,'primary','Black','Heat Clinic Hand-Drawn Men\'s Black','/cmsstatic/img/merch/heat_clinic_handdrawn_mens_black.jpg');
INSERT INTO `BLC_MEDIA` VALUES (30002,'primary','Red','Heat Clinic Hand-Drawn Men\'s Red','/cmsstatic/img/merch/heat_clinic_handdrawn_mens_red.jpg');
INSERT INTO `BLC_MEDIA` VALUES (30003,'primary','Silver','Heat Clinic Hand-Drawn Men\'s Silver','/cmsstatic/img/merch/heat_clinic_handdrawn_mens_silver.jpg');
INSERT INTO `BLC_MEDIA` VALUES (40001,'primary','Black','Heat Clinic Hand-Drawn Women\'s Black','/cmsstatic/img/merch/heat_clinic_handdrawn_womens_black.jpg');
INSERT INTO `BLC_MEDIA` VALUES (40002,'primary','Red','Heat Clinic Hand-Drawn Women\'s Red','/cmsstatic/img/merch/heat_clinic_handdrawn_womens_red.jpg');
INSERT INTO `BLC_MEDIA` VALUES (40003,'primary','Silver','Heat Clinic Hand-Drawn Women\'s Silver','/cmsstatic/img/merch/heat_clinic_handdrawn_womens_silver.jpg');
INSERT INTO `BLC_MEDIA` VALUES (50001,'primary','Black','Heat Clinic Mascot Men\'s Black','/cmsstatic/img/merch/heat_clinic_mascot_mens_black.jpg');
INSERT INTO `BLC_MEDIA` VALUES (50002,'primary','Red','Heat Clinic Mascot Men\'s Red','/cmsstatic/img/merch/heat_clinic_mascot_mens_red.jpg');
INSERT INTO `BLC_MEDIA` VALUES (50003,'primary','Silver','Heat Clinic Mascot Men\'s Silver','/cmsstatic/img/merch/heat_clinic_mascot_mens_silver.jpg');
INSERT INTO `BLC_MEDIA` VALUES (60001,'primary','Black','Heat Clinic Mascot Women\'s Black','/cmsstatic/img/merch/heat_clinic_mascot_womens_black.jpg');
INSERT INTO `BLC_MEDIA` VALUES (60002,'primary','Red','Heat Clinic Mascot Women\'s Red','/cmsstatic/img/merch/heat_clinic_mascot_womens_red.jpg');
INSERT INTO `BLC_MEDIA` VALUES (60003,'primary','Silver','Heat Clinic Mascot Women\'s Silver','/cmsstatic/img/merch/heat_clinic_mascot_womens_silver.jpg');
/*!40000 ALTER TABLE `BLC_MEDIA` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `BLC_MODULE_CONFIGURATION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BLC_MODULE_CONFIGURATION` (
  `MODULE_CONFIG_ID` bigint(20) NOT NULL,
  `ACTIVE_END_DATE` datetime DEFAULT NULL,
  `ACTIVE_START_DATE` datetime DEFAULT NULL,
  `ARCHIVED` char(1) DEFAULT NULL,
  `CREATED_BY` bigint(20) DEFAULT NULL,
  `DATE_CREATED` datetime DEFAULT NULL,
  `DATE_UPDATED` datetime DEFAULT NULL,
  `UPDATED_BY` bigint(20) DEFAULT NULL,
  `CONFIG_TYPE` varchar(255) NOT NULL,
  `IS_DEFAULT` bit(1) NOT NULL,
  `MODULE_NAME` varchar(255) NOT NULL,
  `MODULE_PRIORITY` int(11) NOT NULL,
  PRIMARY KEY (`MODULE_CONFIG_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `BLC_MODULE_CONFIGURATION` WRITE;
/*!40000 ALTER TABLE `BLC_MODULE_CONFIGURATION` DISABLE KEYS */;
INSERT INTO `BLC_MODULE_CONFIGURATION` VALUES (-1,NULL,'2020-08-16 20:10:51',NULL,NULL,NULL,NULL,NULL,'SITE_MAP',_binary '','SITE_MAP',100);
/*!40000 ALTER TABLE `BLC_MODULE_CONFIGURATION` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `BLC_OFFER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BLC_OFFER` (
  `OFFER_ID` bigint(20) NOT NULL,
  `APPLY_TO_CHILD_ITEMS` bit(1) DEFAULT NULL,
  `APPLY_TO_SALE_PRICE` bit(1) DEFAULT NULL,
  `ARCHIVED` char(1) DEFAULT NULL,
  `AUTOMATICALLY_ADDED` bit(1) DEFAULT NULL,
  `COMBINABLE_WITH_OTHER_OFFERS` bit(1) DEFAULT NULL,
  `OFFER_DESCRIPTION` varchar(255) DEFAULT NULL,
  `OFFER_DISCOUNT_TYPE` varchar(255) DEFAULT NULL,
  `END_DATE` datetime DEFAULT NULL,
  `MARKETING_MESSASGE` varchar(255) DEFAULT NULL,
  `MAX_USES_PER_CUSTOMER` bigint(20) DEFAULT NULL,
  `MAX_USES` int(11) DEFAULT NULL,
  `OFFER_NAME` varchar(255) NOT NULL,
  `OFFER_ITEM_QUALIFIER_RULE` varchar(255) DEFAULT NULL,
  `OFFER_ITEM_TARGET_RULE` varchar(255) DEFAULT NULL,
  `ORDER_MIN_TOTAL` decimal(19,5) DEFAULT NULL,
  `OFFER_PRIORITY` int(11) DEFAULT NULL,
  `QUALIFYING_ITEM_MIN_TOTAL` decimal(19,5) DEFAULT NULL,
  `REQUIRES_RELATED_TAR_QUAL` bit(1) DEFAULT NULL,
  `START_DATE` datetime DEFAULT NULL,
  `TARGET_MIN_TOTAL` decimal(19,5) DEFAULT NULL,
  `TARGET_SYSTEM` varchar(255) DEFAULT NULL,
  `TOTALITARIAN_OFFER` bit(1) DEFAULT NULL,
  `OFFER_TYPE` varchar(255) NOT NULL,
  `OFFER_VALUE` decimal(19,5) NOT NULL,
  PRIMARY KEY (`OFFER_ID`),
  KEY `OFFER_DISCOUNT_INDEX` (`OFFER_DISCOUNT_TYPE`),
  KEY `OFFER_MARKETING_MESSAGE_INDEX` (`MARKETING_MESSASGE`),
  KEY `OFFER_NAME_INDEX` (`OFFER_NAME`),
  KEY `OFFER_TYPE_INDEX` (`OFFER_TYPE`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `BLC_OFFER` WRITE;
/*!40000 ALTER TABLE `BLC_OFFER` DISABLE KEYS */;
INSERT INTO `BLC_OFFER` VALUES (1,_binary '\0',_binary '\0',NULL,_binary '',_binary '',NULL,'PERCENT_OFF','2020-01-01 00:00:00',NULL,NULL,0,'Shirts Special',NULL,'NONE',NULL,NULL,NULL,NULL,'2020-08-16 00:00:00',NULL,NULL,NULL,'ORDER_ITEM',20.00000);
/*!40000 ALTER TABLE `BLC_OFFER` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `BLC_OFFER_AUDIT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BLC_OFFER_AUDIT` (
  `OFFER_AUDIT_ID` bigint(20) NOT NULL,
  `CUSTOMER_ID` bigint(20) DEFAULT NULL,
  `OFFER_CODE_ID` bigint(20) DEFAULT NULL,
  `OFFER_ID` bigint(20) DEFAULT NULL,
  `ORDER_ID` bigint(20) DEFAULT NULL,
  `REDEEMED_DATE` datetime DEFAULT NULL,
  PRIMARY KEY (`OFFER_AUDIT_ID`),
  KEY `OFFERAUDIT_CUSTOMER_INDEX` (`CUSTOMER_ID`),
  KEY `OFFERAUDIT_OFFER_CODE_INDEX` (`OFFER_CODE_ID`),
  KEY `OFFERAUDIT_OFFER_INDEX` (`OFFER_ID`),
  KEY `OFFERAUDIT_ORDER_INDEX` (`ORDER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `BLC_OFFER_AUDIT` WRITE;
/*!40000 ALTER TABLE `BLC_OFFER_AUDIT` DISABLE KEYS */;
/*!40000 ALTER TABLE `BLC_OFFER_AUDIT` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `BLC_OFFER_CODE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BLC_OFFER_CODE` (
  `OFFER_CODE_ID` bigint(20) NOT NULL,
  `ARCHIVED` char(1) DEFAULT NULL,
  `EMAIL_ADDRESS` varchar(255) DEFAULT NULL,
  `MAX_USES` int(11) DEFAULT NULL,
  `OFFER_CODE` varchar(255) NOT NULL,
  `END_DATE` datetime DEFAULT NULL,
  `START_DATE` datetime DEFAULT NULL,
  `USES` int(11) DEFAULT NULL,
  `OFFER_ID` bigint(20) NOT NULL,
  PRIMARY KEY (`OFFER_CODE_ID`),
  KEY `OFFER_CODE_EMAIL_INDEX` (`EMAIL_ADDRESS`),
  KEY `OFFERCODE_OFFER_INDEX` (`OFFER_ID`),
  KEY `OFFERCODE_CODE_INDEX` (`OFFER_CODE`),
  CONSTRAINT `FK4rcfx31u6n9esw1ob98u8o87o` FOREIGN KEY (`OFFER_ID`) REFERENCES `BLC_OFFER` (`OFFER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `BLC_OFFER_CODE` WRITE;
/*!40000 ALTER TABLE `BLC_OFFER_CODE` DISABLE KEYS */;
/*!40000 ALTER TABLE `BLC_OFFER_CODE` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `BLC_OFFER_INFO`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BLC_OFFER_INFO` (
  `OFFER_INFO_ID` bigint(20) NOT NULL,
  PRIMARY KEY (`OFFER_INFO_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `BLC_OFFER_INFO` WRITE;
/*!40000 ALTER TABLE `BLC_OFFER_INFO` DISABLE KEYS */;
/*!40000 ALTER TABLE `BLC_OFFER_INFO` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `BLC_OFFER_INFO_FIELDS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BLC_OFFER_INFO_FIELDS` (
  `OFFER_INFO_FIELDS_ID` bigint(20) NOT NULL,
  `FIELD_VALUE` varchar(255) DEFAULT NULL,
  `FIELD_NAME` varchar(255) NOT NULL,
  PRIMARY KEY (`OFFER_INFO_FIELDS_ID`,`FIELD_NAME`),
  CONSTRAINT `FKohr0h2751uuxgawkbkakbptqn` FOREIGN KEY (`OFFER_INFO_FIELDS_ID`) REFERENCES `BLC_OFFER_INFO` (`OFFER_INFO_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `BLC_OFFER_INFO_FIELDS` WRITE;
/*!40000 ALTER TABLE `BLC_OFFER_INFO_FIELDS` DISABLE KEYS */;
/*!40000 ALTER TABLE `BLC_OFFER_INFO_FIELDS` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `BLC_OFFER_ITEM_CRITERIA`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BLC_OFFER_ITEM_CRITERIA` (
  `OFFER_ITEM_CRITERIA_ID` bigint(20) NOT NULL,
  `ORDER_ITEM_MATCH_RULE` longtext,
  `QUANTITY` int(11) NOT NULL,
  PRIMARY KEY (`OFFER_ITEM_CRITERIA_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `BLC_OFFER_ITEM_CRITERIA` WRITE;
/*!40000 ALTER TABLE `BLC_OFFER_ITEM_CRITERIA` DISABLE KEYS */;
INSERT INTO `BLC_OFFER_ITEM_CRITERIA` VALUES (1,'MvelHelper.toUpperCase(orderItem.?category.?name)==MvelHelper.toUpperCase(\"merchandise\")',1);
/*!40000 ALTER TABLE `BLC_OFFER_ITEM_CRITERIA` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `BLC_OFFER_RULE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BLC_OFFER_RULE` (
  `OFFER_RULE_ID` bigint(20) NOT NULL,
  `MATCH_RULE` longtext,
  PRIMARY KEY (`OFFER_RULE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `BLC_OFFER_RULE` WRITE;
/*!40000 ALTER TABLE `BLC_OFFER_RULE` DISABLE KEYS */;
/*!40000 ALTER TABLE `BLC_OFFER_RULE` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `BLC_OFFER_RULE_MAP`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BLC_OFFER_RULE_MAP` (
  `OFFER_OFFER_RULE_ID` bigint(20) NOT NULL,
  `MAP_KEY` varchar(255) NOT NULL,
  `BLC_OFFER_OFFER_ID` bigint(20) NOT NULL,
  `OFFER_RULE_ID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`OFFER_OFFER_RULE_ID`),
  KEY `FKmwr0lw44aa4hulm8c9qg39x9x` (`BLC_OFFER_OFFER_ID`),
  KEY `FK8ndq3dtgs1cr4ds9eil3sxcti` (`OFFER_RULE_ID`),
  CONSTRAINT `FK8ndq3dtgs1cr4ds9eil3sxcti` FOREIGN KEY (`OFFER_RULE_ID`) REFERENCES `BLC_OFFER_RULE` (`OFFER_RULE_ID`),
  CONSTRAINT `FKmwr0lw44aa4hulm8c9qg39x9x` FOREIGN KEY (`BLC_OFFER_OFFER_ID`) REFERENCES `BLC_OFFER` (`OFFER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `BLC_OFFER_RULE_MAP` WRITE;
/*!40000 ALTER TABLE `BLC_OFFER_RULE_MAP` DISABLE KEYS */;
/*!40000 ALTER TABLE `BLC_OFFER_RULE_MAP` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `BLC_ORDER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BLC_ORDER` (
  `ORDER_ID` bigint(20) NOT NULL,
  `CREATED_BY` bigint(20) DEFAULT NULL,
  `DATE_CREATED` datetime DEFAULT NULL,
  `DATE_UPDATED` datetime DEFAULT NULL,
  `UPDATED_BY` bigint(20) DEFAULT NULL,
  `EMAIL_ADDRESS` varchar(255) DEFAULT NULL,
  `NAME` varchar(255) DEFAULT NULL,
  `ORDER_NUMBER` varchar(255) DEFAULT NULL,
  `IS_PREVIEW` bit(1) DEFAULT NULL,
  `ORDER_STATUS` varchar(255) DEFAULT NULL,
  `ORDER_SUBTOTAL` decimal(19,5) DEFAULT NULL,
  `SUBMIT_DATE` datetime DEFAULT NULL,
  `TAX_OVERRIDE` bit(1) DEFAULT NULL,
  `ORDER_TOTAL` decimal(19,5) DEFAULT NULL,
  `TOTAL_SHIPPING` decimal(19,5) DEFAULT NULL,
  `TOTAL_TAX` decimal(19,5) DEFAULT NULL,
  `CURRENCY_CODE` varchar(255) DEFAULT NULL,
  `CUSTOMER_ID` bigint(20) NOT NULL,
  `LOCALE_CODE` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ORDER_ID`),
  KEY `ORDER_CUSTOMER_INDEX` (`CUSTOMER_ID`),
  KEY `ORDER_EMAIL_INDEX` (`EMAIL_ADDRESS`),
  KEY `ORDER_NAME_INDEX` (`NAME`),
  KEY `ORDER_NUMBER_INDEX` (`ORDER_NUMBER`),
  KEY `ORDER_STATUS_INDEX` (`ORDER_STATUS`),
  KEY `FKl58agohje8ndhoow8s8hlday1` (`CURRENCY_CODE`),
  KEY `FKc90jmu6i66weyh7o0u5q94jtv` (`LOCALE_CODE`),
  CONSTRAINT `FKc90jmu6i66weyh7o0u5q94jtv` FOREIGN KEY (`LOCALE_CODE`) REFERENCES `BLC_LOCALE` (`LOCALE_CODE`),
  CONSTRAINT `FKh0ouiaamkm2k7qfgc6cjacukg` FOREIGN KEY (`CUSTOMER_ID`) REFERENCES `BLC_CUSTOMER` (`CUSTOMER_ID`),
  CONSTRAINT `FKl58agohje8ndhoow8s8hlday1` FOREIGN KEY (`CURRENCY_CODE`) REFERENCES `BLC_CURRENCY` (`CURRENCY_CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `BLC_ORDER` WRITE;
/*!40000 ALTER TABLE `BLC_ORDER` DISABLE KEYS */;
INSERT INTO `BLC_ORDER` VALUES (1,200,'2020-08-16 20:11:19','2020-08-16 20:11:19',200,NULL,NULL,NULL,NULL,'IN_PROCESS',NULL,NULL,NULL,NULL,NULL,NULL,'USD',200,'en_US');
INSERT INTO `BLC_ORDER` VALUES (51,217,'2020-08-17 15:58:03','2020-09-03 18:09:05',217,'123@qwe.com',NULL,NULL,NULL,'IN_PROCESS',6.99000,NULL,NULL,11.99000,5.00000,0.00000,'USD',217,'en_US');
/*!40000 ALTER TABLE `BLC_ORDER` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `BLC_ORDER_ADJUSTMENT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BLC_ORDER_ADJUSTMENT` (
  `ORDER_ADJUSTMENT_ID` bigint(20) NOT NULL,
  `ADJUSTMENT_REASON` varchar(255) NOT NULL,
  `ADJUSTMENT_VALUE` decimal(19,5) NOT NULL,
  `OFFER_ID` bigint(20) NOT NULL,
  `ORDER_ID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`ORDER_ADJUSTMENT_ID`),
  KEY `ORDERADJUST_OFFER_INDEX` (`OFFER_ID`),
  KEY `ORDERADJUST_ORDER_INDEX` (`ORDER_ID`),
  CONSTRAINT `FKh9agwlogxxgfxbxe7rcgrwv4u` FOREIGN KEY (`ORDER_ID`) REFERENCES `BLC_ORDER` (`ORDER_ID`),
  CONSTRAINT `FKmlymutb81ohtx11e2u64tjqyu` FOREIGN KEY (`OFFER_ID`) REFERENCES `BLC_OFFER` (`OFFER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `BLC_ORDER_ADJUSTMENT` WRITE;
/*!40000 ALTER TABLE `BLC_ORDER_ADJUSTMENT` DISABLE KEYS */;
/*!40000 ALTER TABLE `BLC_ORDER_ADJUSTMENT` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `BLC_ORDER_ATTRIBUTE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BLC_ORDER_ATTRIBUTE` (
  `ORDER_ATTRIBUTE_ID` bigint(20) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `VALUE` varchar(255) DEFAULT NULL,
  `ORDER_ID` bigint(20) NOT NULL,
  PRIMARY KEY (`ORDER_ATTRIBUTE_ID`),
  UNIQUE KEY `ATTR_NAME_ORDER_ID` (`NAME`,`ORDER_ID`),
  KEY `FKa5k0dl8lmasauj4cmems5e16s` (`ORDER_ID`),
  CONSTRAINT `FKa5k0dl8lmasauj4cmems5e16s` FOREIGN KEY (`ORDER_ID`) REFERENCES `BLC_ORDER` (`ORDER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `BLC_ORDER_ATTRIBUTE` WRITE;
/*!40000 ALTER TABLE `BLC_ORDER_ATTRIBUTE` DISABLE KEYS */;
/*!40000 ALTER TABLE `BLC_ORDER_ATTRIBUTE` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `BLC_ORDER_ITEM`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BLC_ORDER_ITEM` (
  `ORDER_ITEM_ID` bigint(20) NOT NULL,
  `CREATED_BY` bigint(20) DEFAULT NULL,
  `DATE_CREATED` datetime DEFAULT NULL,
  `DATE_UPDATED` datetime DEFAULT NULL,
  `UPDATED_BY` bigint(20) DEFAULT NULL,
  `DISCOUNTS_ALLOWED` bit(1) DEFAULT NULL,
  `HAS_VALIDATION_ERRORS` bit(1) DEFAULT NULL,
  `ITEM_TAXABLE_FLAG` bit(1) DEFAULT NULL,
  `NAME` varchar(255) DEFAULT NULL,
  `ORDER_ITEM_TYPE` varchar(255) DEFAULT NULL,
  `PRICE` decimal(19,5) DEFAULT NULL,
  `QUANTITY` int(11) NOT NULL,
  `RETAIL_PRICE` decimal(19,5) DEFAULT NULL,
  `RETAIL_PRICE_OVERRIDE` bit(1) DEFAULT NULL,
  `SALE_PRICE` decimal(19,5) DEFAULT NULL,
  `SALE_PRICE_OVERRIDE` bit(1) DEFAULT NULL,
  `TOTAL_TAX` decimal(19,2) DEFAULT NULL,
  `CATEGORY_ID` bigint(20) DEFAULT NULL,
  `GIFT_WRAP_ITEM_ID` bigint(20) DEFAULT NULL,
  `ORDER_ID` bigint(20) DEFAULT NULL,
  `PARENT_ORDER_ITEM_ID` bigint(20) DEFAULT NULL,
  `PERSONAL_MESSAGE_ID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`ORDER_ITEM_ID`),
  KEY `ORDERITEM_CATEGORY_INDEX` (`CATEGORY_ID`),
  KEY `ORDERITEM_GIFT_INDEX` (`GIFT_WRAP_ITEM_ID`),
  KEY `ORDERITEM_ORDER_INDEX` (`ORDER_ID`),
  KEY `ORDERITEM_TYPE_INDEX` (`ORDER_ITEM_TYPE`),
  KEY `ORDERITEM_PARENT_INDEX` (`PARENT_ORDER_ITEM_ID`),
  KEY `ORDERITEM_MESSAGE_INDEX` (`PERSONAL_MESSAGE_ID`),
  CONSTRAINT `FK3553qqcmvw5i3durebksttod3` FOREIGN KEY (`GIFT_WRAP_ITEM_ID`) REFERENCES `BLC_GIFTWRAP_ORDER_ITEM` (`ORDER_ITEM_ID`),
  CONSTRAINT `FK4vocoseu9tnln1vq4r2gygh3n` FOREIGN KEY (`PARENT_ORDER_ITEM_ID`) REFERENCES `BLC_ORDER_ITEM` (`ORDER_ITEM_ID`),
  CONSTRAINT `FK737vx8aceqsa8wyb6hjt44x58` FOREIGN KEY (`CATEGORY_ID`) REFERENCES `BLC_CATEGORY` (`CATEGORY_ID`),
  CONSTRAINT `FK8b71a8di9bu8jrssp98u8ka0s` FOREIGN KEY (`ORDER_ID`) REFERENCES `BLC_ORDER` (`ORDER_ID`),
  CONSTRAINT `FKccrkxx60l5x2q24dl97x9iu0a` FOREIGN KEY (`PERSONAL_MESSAGE_ID`) REFERENCES `BLC_PERSONAL_MESSAGE` (`PERSONAL_MESSAGE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `BLC_ORDER_ITEM` WRITE;
/*!40000 ALTER TABLE `BLC_ORDER_ITEM` DISABLE KEYS */;
INSERT INTO `BLC_ORDER_ITEM` VALUES (1,217,'2020-08-17 16:01:50','2020-08-17 16:01:50',217,NULL,NULL,_binary '','Day of the Dead Chipotle Hot Sauce','org.broadleafcommerce.core.order.domain.DiscreteOrderItem',6.99000,1,6.99000,NULL,6.99000,NULL,NULL,2002,NULL,51,NULL,NULL);
/*!40000 ALTER TABLE `BLC_ORDER_ITEM` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `BLC_ORDER_ITEM_ADD_ATTR`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BLC_ORDER_ITEM_ADD_ATTR` (
  `ORDER_ITEM_ID` bigint(20) NOT NULL,
  `VALUE` varchar(255) DEFAULT NULL,
  `NAME` varchar(255) NOT NULL,
  PRIMARY KEY (`ORDER_ITEM_ID`,`NAME`),
  CONSTRAINT `FK2xfsv1rmg5hy926njxrgrkxja` FOREIGN KEY (`ORDER_ITEM_ID`) REFERENCES `BLC_DISCRETE_ORDER_ITEM` (`ORDER_ITEM_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `BLC_ORDER_ITEM_ADD_ATTR` WRITE;
/*!40000 ALTER TABLE `BLC_ORDER_ITEM_ADD_ATTR` DISABLE KEYS */;
/*!40000 ALTER TABLE `BLC_ORDER_ITEM_ADD_ATTR` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `BLC_ORDER_ITEM_ADJUSTMENT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BLC_ORDER_ITEM_ADJUSTMENT` (
  `ORDER_ITEM_ADJUSTMENT_ID` bigint(20) NOT NULL,
  `APPLIED_TO_SALE_PRICE` bit(1) DEFAULT NULL,
  `ADJUSTMENT_REASON` varchar(255) NOT NULL,
  `ADJUSTMENT_VALUE` decimal(19,5) NOT NULL,
  `OFFER_ID` bigint(20) NOT NULL,
  `ORDER_ITEM_ID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`ORDER_ITEM_ADJUSTMENT_ID`),
  KEY `OIADJUST_ITEM_INDEX` (`ORDER_ITEM_ID`),
  KEY `FKkw991n1so1bd0nvmtgky3d4rm` (`OFFER_ID`),
  CONSTRAINT `FKkw991n1so1bd0nvmtgky3d4rm` FOREIGN KEY (`OFFER_ID`) REFERENCES `BLC_OFFER` (`OFFER_ID`),
  CONSTRAINT `FKniw5eryl2ea895x5p3wh4sd0u` FOREIGN KEY (`ORDER_ITEM_ID`) REFERENCES `BLC_ORDER_ITEM` (`ORDER_ITEM_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `BLC_ORDER_ITEM_ADJUSTMENT` WRITE;
/*!40000 ALTER TABLE `BLC_ORDER_ITEM_ADJUSTMENT` DISABLE KEYS */;
/*!40000 ALTER TABLE `BLC_ORDER_ITEM_ADJUSTMENT` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `BLC_ORDER_ITEM_ATTRIBUTE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BLC_ORDER_ITEM_ATTRIBUTE` (
  `ORDER_ITEM_ATTRIBUTE_ID` bigint(20) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `VALUE` varchar(255) NOT NULL,
  `ORDER_ITEM_ID` bigint(20) NOT NULL,
  PRIMARY KEY (`ORDER_ITEM_ATTRIBUTE_ID`),
  UNIQUE KEY `ATTR_NAME_ORDER_ITEM_ID` (`NAME`,`ORDER_ITEM_ID`),
  KEY `FK5f2l8atn9sh06yhbjx72i8tl1` (`ORDER_ITEM_ID`),
  CONSTRAINT `FK5f2l8atn9sh06yhbjx72i8tl1` FOREIGN KEY (`ORDER_ITEM_ID`) REFERENCES `BLC_ORDER_ITEM` (`ORDER_ITEM_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `BLC_ORDER_ITEM_ATTRIBUTE` WRITE;
/*!40000 ALTER TABLE `BLC_ORDER_ITEM_ATTRIBUTE` DISABLE KEYS */;
/*!40000 ALTER TABLE `BLC_ORDER_ITEM_ATTRIBUTE` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `BLC_ORDER_ITEM_CART_MESSAGE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BLC_ORDER_ITEM_CART_MESSAGE` (
  `ORDER_ITEM_ID` bigint(20) NOT NULL,
  `CART_MESSAGE` varchar(255) DEFAULT NULL,
  KEY `FKpm9ip11x3m6rnkla1khhgqmfn` (`ORDER_ITEM_ID`),
  CONSTRAINT `FKpm9ip11x3m6rnkla1khhgqmfn` FOREIGN KEY (`ORDER_ITEM_ID`) REFERENCES `BLC_ORDER_ITEM` (`ORDER_ITEM_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `BLC_ORDER_ITEM_CART_MESSAGE` WRITE;
/*!40000 ALTER TABLE `BLC_ORDER_ITEM_CART_MESSAGE` DISABLE KEYS */;
/*!40000 ALTER TABLE `BLC_ORDER_ITEM_CART_MESSAGE` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `BLC_ORDER_ITEM_DTL_ADJ`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BLC_ORDER_ITEM_DTL_ADJ` (
  `ORDER_ITEM_DTL_ADJ_ID` bigint(20) NOT NULL,
  `APPLIED_TO_SALE_PRICE` bit(1) DEFAULT NULL,
  `OFFER_NAME` varchar(255) DEFAULT NULL,
  `ADJUSTMENT_REASON` varchar(255) NOT NULL,
  `ADJUSTMENT_VALUE` decimal(19,5) NOT NULL,
  `OFFER_ID` bigint(20) NOT NULL,
  `ORDER_ITEM_PRICE_DTL_ID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`ORDER_ITEM_DTL_ADJ_ID`),
  KEY `FKtaukfbw7rtre7kmvl6fla49t6` (`OFFER_ID`),
  KEY `FKtecvjagoubp6v2337mqm5gnmg` (`ORDER_ITEM_PRICE_DTL_ID`),
  CONSTRAINT `FKtaukfbw7rtre7kmvl6fla49t6` FOREIGN KEY (`OFFER_ID`) REFERENCES `BLC_OFFER` (`OFFER_ID`),
  CONSTRAINT `FKtecvjagoubp6v2337mqm5gnmg` FOREIGN KEY (`ORDER_ITEM_PRICE_DTL_ID`) REFERENCES `BLC_ORDER_ITEM_PRICE_DTL` (`ORDER_ITEM_PRICE_DTL_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `BLC_ORDER_ITEM_DTL_ADJ` WRITE;
/*!40000 ALTER TABLE `BLC_ORDER_ITEM_DTL_ADJ` DISABLE KEYS */;
/*!40000 ALTER TABLE `BLC_ORDER_ITEM_DTL_ADJ` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `BLC_ORDER_ITEM_PRICE_DTL`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BLC_ORDER_ITEM_PRICE_DTL` (
  `ORDER_ITEM_PRICE_DTL_ID` bigint(20) NOT NULL,
  `QUANTITY` int(11) NOT NULL,
  `USE_SALE_PRICE` bit(1) DEFAULT NULL,
  `ORDER_ITEM_ID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`ORDER_ITEM_PRICE_DTL_ID`),
  KEY `FKerm8r2c1fj0vvd2rj0uxmavlj` (`ORDER_ITEM_ID`),
  CONSTRAINT `FKerm8r2c1fj0vvd2rj0uxmavlj` FOREIGN KEY (`ORDER_ITEM_ID`) REFERENCES `BLC_ORDER_ITEM` (`ORDER_ITEM_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `BLC_ORDER_ITEM_PRICE_DTL` WRITE;
/*!40000 ALTER TABLE `BLC_ORDER_ITEM_PRICE_DTL` DISABLE KEYS */;
INSERT INTO `BLC_ORDER_ITEM_PRICE_DTL` VALUES (1,1,_binary '',1);
/*!40000 ALTER TABLE `BLC_ORDER_ITEM_PRICE_DTL` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `BLC_ORDER_LOCK`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BLC_ORDER_LOCK` (
  `LOCK_KEY` varchar(255) NOT NULL,
  `ORDER_ID` bigint(20) NOT NULL,
  `LAST_UPDATED` bigint(20) DEFAULT NULL,
  `LOCKED` char(1) DEFAULT NULL,
  PRIMARY KEY (`LOCK_KEY`,`ORDER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `BLC_ORDER_LOCK` WRITE;
/*!40000 ALTER TABLE `BLC_ORDER_LOCK` DISABLE KEYS */;
INSERT INTO `BLC_ORDER_LOCK` VALUES ('f3a7e1a5-f4ad-4ecd-ac82-7697d5304c01',51,1597651310090,'N');
/*!40000 ALTER TABLE `BLC_ORDER_LOCK` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `BLC_ORDER_MULTISHIP_OPTION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BLC_ORDER_MULTISHIP_OPTION` (
  `ORDER_MULTISHIP_OPTION_ID` bigint(20) NOT NULL,
  `ADDRESS_ID` bigint(20) DEFAULT NULL,
  `FULFILLMENT_OPTION_ID` bigint(20) DEFAULT NULL,
  `ORDER_ID` bigint(20) DEFAULT NULL,
  `ORDER_ITEM_ID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`ORDER_MULTISHIP_OPTION_ID`),
  KEY `MULTISHIP_OPTION_ORDER_INDEX` (`ORDER_ID`),
  KEY `FKt77nf9y3nokcclqibjhihjily` (`ADDRESS_ID`),
  KEY `FK1d1sd1fr2cdv0kvf2s5yclo55` (`FULFILLMENT_OPTION_ID`),
  KEY `FK8poefpppeoej296cr2g1otfki` (`ORDER_ITEM_ID`),
  CONSTRAINT `FK1d1sd1fr2cdv0kvf2s5yclo55` FOREIGN KEY (`FULFILLMENT_OPTION_ID`) REFERENCES `BLC_FULFILLMENT_OPTION` (`FULFILLMENT_OPTION_ID`),
  CONSTRAINT `FK8poefpppeoej296cr2g1otfki` FOREIGN KEY (`ORDER_ITEM_ID`) REFERENCES `BLC_ORDER_ITEM` (`ORDER_ITEM_ID`),
  CONSTRAINT `FKrpsf6ltf21ohrgimnktmq5dn3` FOREIGN KEY (`ORDER_ID`) REFERENCES `BLC_ORDER` (`ORDER_ID`),
  CONSTRAINT `FKt77nf9y3nokcclqibjhihjily` FOREIGN KEY (`ADDRESS_ID`) REFERENCES `BLC_ADDRESS` (`ADDRESS_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `BLC_ORDER_MULTISHIP_OPTION` WRITE;
/*!40000 ALTER TABLE `BLC_ORDER_MULTISHIP_OPTION` DISABLE KEYS */;
/*!40000 ALTER TABLE `BLC_ORDER_MULTISHIP_OPTION` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `BLC_ORDER_OFFER_CODE_XREF`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BLC_ORDER_OFFER_CODE_XREF` (
  `ORDER_ID` bigint(20) NOT NULL,
  `OFFER_CODE_ID` bigint(20) NOT NULL,
  KEY `FKdtidg8l9a5wpcuwpnqbwwhuve` (`OFFER_CODE_ID`),
  KEY `FKljh9nh9lgxkgnebscn8u8sbgf` (`ORDER_ID`),
  CONSTRAINT `FKdtidg8l9a5wpcuwpnqbwwhuve` FOREIGN KEY (`OFFER_CODE_ID`) REFERENCES `BLC_OFFER_CODE` (`OFFER_CODE_ID`),
  CONSTRAINT `FKljh9nh9lgxkgnebscn8u8sbgf` FOREIGN KEY (`ORDER_ID`) REFERENCES `BLC_ORDER` (`ORDER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `BLC_ORDER_OFFER_CODE_XREF` WRITE;
/*!40000 ALTER TABLE `BLC_ORDER_OFFER_CODE_XREF` DISABLE KEYS */;
/*!40000 ALTER TABLE `BLC_ORDER_OFFER_CODE_XREF` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `BLC_ORDER_PAYMENT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BLC_ORDER_PAYMENT` (
  `ORDER_PAYMENT_ID` bigint(20) NOT NULL,
  `AMOUNT` decimal(19,5) DEFAULT NULL,
  `ARCHIVED` char(1) DEFAULT NULL,
  `GATEWAY_TYPE` varchar(255) DEFAULT NULL,
  `REFERENCE_NUMBER` varchar(255) DEFAULT NULL,
  `PAYMENT_TYPE` varchar(255) NOT NULL,
  `ADDRESS_ID` bigint(20) DEFAULT NULL,
  `ORDER_ID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`ORDER_PAYMENT_ID`),
  KEY `ORDERPAYMENT_ADDRESS_INDEX` (`ADDRESS_ID`),
  KEY `ORDERPAYMENT_ORDER_INDEX` (`ORDER_ID`),
  KEY `ORDERPAYMENT_REFERENCE_INDEX` (`REFERENCE_NUMBER`),
  KEY `ORDERPAYMENT_TYPE_INDEX` (`PAYMENT_TYPE`),
  CONSTRAINT `FK7k9dsqtdku90rongw4f2xsgg5` FOREIGN KEY (`ADDRESS_ID`) REFERENCES `BLC_ADDRESS` (`ADDRESS_ID`),
  CONSTRAINT `FKh0n8n75hk2l646hsxyyqrwgpx` FOREIGN KEY (`ORDER_ID`) REFERENCES `BLC_ORDER` (`ORDER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `BLC_ORDER_PAYMENT` WRITE;
/*!40000 ALTER TABLE `BLC_ORDER_PAYMENT` DISABLE KEYS */;
/*!40000 ALTER TABLE `BLC_ORDER_PAYMENT` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `BLC_ORDER_PAYMENT_TRANSACTION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BLC_ORDER_PAYMENT_TRANSACTION` (
  `PAYMENT_TRANSACTION_ID` bigint(20) NOT NULL,
  `TRANSACTION_AMOUNT` decimal(19,2) DEFAULT NULL,
  `ARCHIVED` char(1) DEFAULT NULL,
  `CUSTOMER_IP_ADDRESS` varchar(255) DEFAULT NULL,
  `DATE_RECORDED` datetime DEFAULT NULL,
  `RAW_RESPONSE` longtext,
  `SAVE_TOKEN` bit(1) DEFAULT NULL,
  `SUCCESS` bit(1) DEFAULT NULL,
  `TRANSACTION_TYPE` varchar(255) DEFAULT NULL,
  `ORDER_PAYMENT` bigint(20) NOT NULL,
  `PARENT_TRANSACTION` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`PAYMENT_TRANSACTION_ID`),
  KEY `FKq3hymseoakriel7rw57g3vh5n` (`ORDER_PAYMENT`),
  KEY `FKjg77vkh5u48omyy8uhagkswxs` (`PARENT_TRANSACTION`),
  CONSTRAINT `FKjg77vkh5u48omyy8uhagkswxs` FOREIGN KEY (`PARENT_TRANSACTION`) REFERENCES `BLC_ORDER_PAYMENT_TRANSACTION` (`PAYMENT_TRANSACTION_ID`),
  CONSTRAINT `FKq3hymseoakriel7rw57g3vh5n` FOREIGN KEY (`ORDER_PAYMENT`) REFERENCES `BLC_ORDER_PAYMENT` (`ORDER_PAYMENT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `BLC_ORDER_PAYMENT_TRANSACTION` WRITE;
/*!40000 ALTER TABLE `BLC_ORDER_PAYMENT_TRANSACTION` DISABLE KEYS */;
/*!40000 ALTER TABLE `BLC_ORDER_PAYMENT_TRANSACTION` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `BLC_PAGE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BLC_PAGE` (
  `PAGE_ID` bigint(20) NOT NULL,
  `ACTIVE_END_DATE` datetime DEFAULT NULL,
  `ACTIVE_START_DATE` datetime DEFAULT NULL,
  `DESCRIPTION` varchar(255) DEFAULT NULL,
  `EXCLUDE_FROM_SITE_MAP` bit(1) DEFAULT NULL,
  `FULL_URL` varchar(255) DEFAULT NULL,
  `META_DESCRIPTION` varchar(255) DEFAULT NULL,
  `META_TITLE` varchar(255) DEFAULT NULL,
  `OFFLINE_FLAG` bit(1) DEFAULT NULL,
  `PRIORITY` int(11) DEFAULT NULL,
  `PAGE_TMPLT_ID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`PAGE_ID`),
  KEY `PAGE_FULL_URL_INDEX` (`FULL_URL`),
  KEY `FKo95c7m41ycmhf4dwpebvemasl` (`PAGE_TMPLT_ID`),
  CONSTRAINT `FKo95c7m41ycmhf4dwpebvemasl` FOREIGN KEY (`PAGE_TMPLT_ID`) REFERENCES `BLC_PAGE_TMPLT` (`PAGE_TMPLT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `BLC_PAGE` WRITE;
/*!40000 ALTER TABLE `BLC_PAGE` DISABLE KEYS */;
INSERT INTO `BLC_PAGE` VALUES (1,NULL,NULL,'About Us',NULL,'/about_us',NULL,'About Us',NULL,NULL,2);
INSERT INTO `BLC_PAGE` VALUES (2,NULL,NULL,'Frequently Asked Questions',NULL,'/faq',NULL,'FAQ',NULL,NULL,2);
INSERT INTO `BLC_PAGE` VALUES (3,NULL,NULL,'New to Hot Sauce',NULL,'/new-to-hot-sauce',NULL,'New to Hot Sauce',NULL,NULL,1);
/*!40000 ALTER TABLE `BLC_PAGE` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `BLC_PAGE_ATTRIBUTES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BLC_PAGE_ATTRIBUTES` (
  `ATTRIBUTE_ID` bigint(20) NOT NULL,
  `FIELD_NAME` varchar(255) NOT NULL,
  `FIELD_VALUE` varchar(255) DEFAULT NULL,
  `PAGE_ID` bigint(20) NOT NULL,
  PRIMARY KEY (`ATTRIBUTE_ID`),
  KEY `PAGEATTRIBUTE_NAME_INDEX` (`FIELD_NAME`),
  KEY `PAGEATTRIBUTE_INDEX` (`PAGE_ID`),
  CONSTRAINT `FK94785hg4iuw1k22qh6b8hysxe` FOREIGN KEY (`PAGE_ID`) REFERENCES `BLC_PAGE` (`PAGE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `BLC_PAGE_ATTRIBUTES` WRITE;
/*!40000 ALTER TABLE `BLC_PAGE_ATTRIBUTES` DISABLE KEYS */;
/*!40000 ALTER TABLE `BLC_PAGE_ATTRIBUTES` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `BLC_PAGE_FLD`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BLC_PAGE_FLD` (
  `PAGE_FLD_ID` bigint(20) NOT NULL,
  `FLD_KEY` varchar(255) DEFAULT NULL,
  `LOB_VALUE` longtext,
  `VALUE` varchar(255) DEFAULT NULL,
  `PAGE_ID` bigint(20) NOT NULL,
  PRIMARY KEY (`PAGE_FLD_ID`),
  KEY `FK8t4im2p53x0mfufl92k87tsnx` (`PAGE_ID`),
  CONSTRAINT `FK8t4im2p53x0mfufl92k87tsnx` FOREIGN KEY (`PAGE_ID`) REFERENCES `BLC_PAGE` (`PAGE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `BLC_PAGE_FLD` WRITE;
/*!40000 ALTER TABLE `BLC_PAGE_FLD` DISABLE KEYS */;
INSERT INTO `BLC_PAGE_FLD` VALUES (1,'body',NULL,'test content',1);
INSERT INTO `BLC_PAGE_FLD` VALUES (2,'title',NULL,'About Us',1);
INSERT INTO `BLC_PAGE_FLD` VALUES (3,'body',NULL,'<h2 style=\"text-align:center;\">This is an example of a content-managed page.</h2><h4 style=\"text-align:center;\"><a href=\"http://www.broadleafcommerce.com/features/content\">Click Here</a> to see more about Content Management in Broadleaf.</h4>',2);
INSERT INTO `BLC_PAGE_FLD` VALUES (4,'body',NULL,'<h2 style=\"text-align:center;\">This is an example of a content-managed page.</h2>',3);
/*!40000 ALTER TABLE `BLC_PAGE_FLD` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `BLC_PAGE_ITEM_CRITERIA`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BLC_PAGE_ITEM_CRITERIA` (
  `PAGE_ITEM_CRITERIA_ID` bigint(20) NOT NULL,
  `ORDER_ITEM_MATCH_RULE` longtext,
  `QUANTITY` int(11) NOT NULL,
  PRIMARY KEY (`PAGE_ITEM_CRITERIA_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `BLC_PAGE_ITEM_CRITERIA` WRITE;
/*!40000 ALTER TABLE `BLC_PAGE_ITEM_CRITERIA` DISABLE KEYS */;
/*!40000 ALTER TABLE `BLC_PAGE_ITEM_CRITERIA` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `BLC_PAGE_RULE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BLC_PAGE_RULE` (
  `PAGE_RULE_ID` bigint(20) NOT NULL,
  `MATCH_RULE` longtext,
  PRIMARY KEY (`PAGE_RULE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `BLC_PAGE_RULE` WRITE;
/*!40000 ALTER TABLE `BLC_PAGE_RULE` DISABLE KEYS */;
/*!40000 ALTER TABLE `BLC_PAGE_RULE` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `BLC_PAGE_RULE_MAP`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BLC_PAGE_RULE_MAP` (
  `BLC_PAGE_PAGE_ID` bigint(20) NOT NULL,
  `PAGE_RULE_ID` bigint(20) NOT NULL,
  `MAP_KEY` varchar(255) NOT NULL,
  PRIMARY KEY (`BLC_PAGE_PAGE_ID`,`MAP_KEY`),
  KEY `FKhj9uu6o7fb0n81g5yvk48skem` (`PAGE_RULE_ID`),
  CONSTRAINT `FKhj9uu6o7fb0n81g5yvk48skem` FOREIGN KEY (`PAGE_RULE_ID`) REFERENCES `BLC_PAGE_RULE` (`PAGE_RULE_ID`),
  CONSTRAINT `FKtqx8xsmgx0hkrvery3ipqwwi0` FOREIGN KEY (`BLC_PAGE_PAGE_ID`) REFERENCES `BLC_PAGE` (`PAGE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `BLC_PAGE_RULE_MAP` WRITE;
/*!40000 ALTER TABLE `BLC_PAGE_RULE_MAP` DISABLE KEYS */;
/*!40000 ALTER TABLE `BLC_PAGE_RULE_MAP` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `BLC_PAGE_TMPLT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BLC_PAGE_TMPLT` (
  `PAGE_TMPLT_ID` bigint(20) NOT NULL,
  `TMPLT_DESCR` varchar(255) DEFAULT NULL,
  `TMPLT_NAME` varchar(255) DEFAULT NULL,
  `TMPLT_PATH` varchar(255) DEFAULT NULL,
  `LOCALE_CODE` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`PAGE_TMPLT_ID`),
  KEY `FK19poavwqssando5ll1qid9kmf` (`LOCALE_CODE`),
  CONSTRAINT `FK19poavwqssando5ll1qid9kmf` FOREIGN KEY (`LOCALE_CODE`) REFERENCES `BLC_LOCALE` (`LOCALE_CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `BLC_PAGE_TMPLT` WRITE;
/*!40000 ALTER TABLE `BLC_PAGE_TMPLT` DISABLE KEYS */;
INSERT INTO `BLC_PAGE_TMPLT` VALUES (1,'This template provides the default layout with header and footer surrounding the content and title. This template also includes featured products below the page content.','Default Template','content/default',NULL);
INSERT INTO `BLC_PAGE_TMPLT` VALUES (2,'This template provides a plain layout with header and footer surrounding the content and title.','Plain Template','content/plain',NULL);
/*!40000 ALTER TABLE `BLC_PAGE_TMPLT` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `BLC_PAYMENT_LOG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BLC_PAYMENT_LOG` (
  `PAYMENT_LOG_ID` bigint(20) NOT NULL,
  `AMOUNT_PAID` decimal(19,5) DEFAULT NULL,
  `EXCEPTION_MESSAGE` varchar(255) DEFAULT NULL,
  `LOG_TYPE` varchar(255) NOT NULL,
  `ORDER_PAYMENT_ID` bigint(20) DEFAULT NULL,
  `ORDER_PAYMENT_REF_NUM` varchar(255) DEFAULT NULL,
  `TRANSACTION_SUCCESS` bit(1) DEFAULT NULL,
  `TRANSACTION_TIMESTAMP` datetime NOT NULL,
  `TRANSACTION_TYPE` varchar(255) NOT NULL,
  `USER_NAME` varchar(255) NOT NULL,
  `CURRENCY_CODE` varchar(255) DEFAULT NULL,
  `CUSTOMER_ID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`PAYMENT_LOG_ID`),
  KEY `PAYMENTLOG_CUSTOMER_INDEX` (`CUSTOMER_ID`),
  KEY `PAYMENTLOG_LOGTYPE_INDEX` (`LOG_TYPE`),
  KEY `PAYMENTLOG_ORDERPAYMENT_INDEX` (`ORDER_PAYMENT_ID`),
  KEY `PAYMENTLOG_REFERENCE_INDEX` (`ORDER_PAYMENT_REF_NUM`),
  KEY `PAYMENTLOG_TRANTYPE_INDEX` (`TRANSACTION_TYPE`),
  KEY `PAYMENTLOG_USER_INDEX` (`USER_NAME`),
  KEY `FK1tulv4shboj3o32mjrbk2jh93` (`CURRENCY_CODE`),
  CONSTRAINT `FK1tulv4shboj3o32mjrbk2jh93` FOREIGN KEY (`CURRENCY_CODE`) REFERENCES `BLC_CURRENCY` (`CURRENCY_CODE`),
  CONSTRAINT `FK39ybfiu04bab30cqo45cap3ew` FOREIGN KEY (`CUSTOMER_ID`) REFERENCES `BLC_CUSTOMER` (`CUSTOMER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `BLC_PAYMENT_LOG` WRITE;
/*!40000 ALTER TABLE `BLC_PAYMENT_LOG` DISABLE KEYS */;
/*!40000 ALTER TABLE `BLC_PAYMENT_LOG` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `BLC_PERSONAL_MESSAGE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BLC_PERSONAL_MESSAGE` (
  `PERSONAL_MESSAGE_ID` bigint(20) NOT NULL,
  `MESSAGE` varchar(255) DEFAULT NULL,
  `MESSAGE_FROM` varchar(255) DEFAULT NULL,
  `MESSAGE_TO` varchar(255) DEFAULT NULL,
  `OCCASION` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`PERSONAL_MESSAGE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `BLC_PERSONAL_MESSAGE` WRITE;
/*!40000 ALTER TABLE `BLC_PERSONAL_MESSAGE` DISABLE KEYS */;
/*!40000 ALTER TABLE `BLC_PERSONAL_MESSAGE` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `BLC_PGTMPLT_FLDGRP_XREF`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BLC_PGTMPLT_FLDGRP_XREF` (
  `PG_TMPLT_FLD_GRP_ID` bigint(20) NOT NULL,
  `GROUP_ORDER` decimal(10,6) DEFAULT NULL,
  `FLD_GROUP_ID` bigint(20) DEFAULT NULL,
  `PAGE_TMPLT_ID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`PG_TMPLT_FLD_GRP_ID`),
  KEY `FKoy5hlxlq3pii0gj8yalskxv88` (`FLD_GROUP_ID`),
  KEY `FKr3xcn67le94r6oxnaebm5ebnk` (`PAGE_TMPLT_ID`),
  CONSTRAINT `FKoy5hlxlq3pii0gj8yalskxv88` FOREIGN KEY (`FLD_GROUP_ID`) REFERENCES `BLC_FLD_GROUP` (`FLD_GROUP_ID`),
  CONSTRAINT `FKr3xcn67le94r6oxnaebm5ebnk` FOREIGN KEY (`PAGE_TMPLT_ID`) REFERENCES `BLC_PAGE_TMPLT` (`PAGE_TMPLT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `BLC_PGTMPLT_FLDGRP_XREF` WRITE;
/*!40000 ALTER TABLE `BLC_PGTMPLT_FLDGRP_XREF` DISABLE KEYS */;
INSERT INTO `BLC_PGTMPLT_FLDGRP_XREF` VALUES (-200,0.000000,1,2);
INSERT INTO `BLC_PGTMPLT_FLDGRP_XREF` VALUES (-100,0.000000,1,1);
/*!40000 ALTER TABLE `BLC_PGTMPLT_FLDGRP_XREF` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `BLC_PHONE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BLC_PHONE` (
  `PHONE_ID` bigint(20) NOT NULL,
  `COUNTRY_CODE` varchar(255) DEFAULT NULL,
  `EXTENSION` varchar(255) DEFAULT NULL,
  `IS_ACTIVE` bit(1) DEFAULT NULL,
  `IS_DEFAULT` bit(1) DEFAULT NULL,
  `PHONE_NUMBER` varchar(255) NOT NULL,
  PRIMARY KEY (`PHONE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `BLC_PHONE` WRITE;
/*!40000 ALTER TABLE `BLC_PHONE` DISABLE KEYS */;
INSERT INTO `BLC_PHONE` VALUES (1,NULL,NULL,_binary '',_binary '\0','11111111');
/*!40000 ALTER TABLE `BLC_PHONE` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `BLC_PRODUCT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BLC_PRODUCT` (
  `PRODUCT_ID` bigint(20) NOT NULL,
  `ARCHIVED` char(1) DEFAULT NULL,
  `CAN_SELL_WITHOUT_OPTIONS` bit(1) DEFAULT NULL,
  `CANONICAL_URL` varchar(255) DEFAULT NULL,
  `DISPLAY_TEMPLATE` varchar(255) DEFAULT NULL,
  `IS_FEATURED_PRODUCT` bit(1) NOT NULL,
  `MANUFACTURE` varchar(255) DEFAULT NULL,
  `META_DESC` varchar(255) DEFAULT NULL,
  `META_TITLE` varchar(255) DEFAULT NULL,
  `MODEL` varchar(255) DEFAULT NULL,
  `OVERRIDE_GENERATED_URL` bit(1) DEFAULT NULL,
  `URL` varchar(255) DEFAULT NULL,
  `URL_KEY` varchar(255) DEFAULT NULL,
  `DEFAULT_CATEGORY_ID` bigint(20) DEFAULT NULL,
  `DEFAULT_SKU_ID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`PRODUCT_ID`),
  KEY `PRODUCT_CATEGORY_INDEX` (`DEFAULT_CATEGORY_ID`),
  KEY `PRODUCT_URL_INDEX` (`URL`,`URL_KEY`),
  KEY `FK9dljxk44kotarjr9ngebtxntx` (`DEFAULT_SKU_ID`),
  CONSTRAINT `FK57aoxhpvwg389v7sx4m153mde` FOREIGN KEY (`DEFAULT_CATEGORY_ID`) REFERENCES `BLC_CATEGORY` (`CATEGORY_ID`),
  CONSTRAINT `FK9dljxk44kotarjr9ngebtxntx` FOREIGN KEY (`DEFAULT_SKU_ID`) REFERENCES `BLC_SKU` (`SKU_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `BLC_PRODUCT` WRITE;
/*!40000 ALTER TABLE `BLC_PRODUCT` DISABLE KEYS */;
INSERT INTO `BLC_PRODUCT` VALUES (1,NULL,NULL,NULL,NULL,_binary '','Blair\'s',NULL,NULL,NULL,_binary '\0','/hot-sauces/sudden_death_sauce',NULL,NULL,1);
INSERT INTO `BLC_PRODUCT` VALUES (2,NULL,NULL,NULL,NULL,_binary '\0','Blair\'s',NULL,NULL,NULL,_binary '\0','/hot-sauces/sweet_death_sauce',NULL,NULL,2);
INSERT INTO `BLC_PRODUCT` VALUES (3,NULL,NULL,NULL,NULL,_binary '\0','Salsa Express',NULL,NULL,NULL,_binary '\0','/hot-sauces/hoppin_hot_sauce',NULL,NULL,3);
INSERT INTO `BLC_PRODUCT` VALUES (4,NULL,NULL,NULL,NULL,_binary '\0','Spice Exchange',NULL,NULL,NULL,_binary '\0','/hot-sauces/day_of_the_dead_chipotle_hot_sauce',NULL,NULL,4);
INSERT INTO `BLC_PRODUCT` VALUES (5,NULL,NULL,NULL,NULL,_binary '\0','Spice Exchange',NULL,NULL,NULL,_binary '\0','/hot-sauces/day_of_the_dead_habanero_hot_sauce',NULL,NULL,5);
INSERT INTO `BLC_PRODUCT` VALUES (6,NULL,NULL,NULL,NULL,_binary '\0','Spice Exchange',NULL,NULL,NULL,_binary '\0','/hot-sauces/day_of_the_dead_scotch_bonnet_sauce',NULL,NULL,6);
INSERT INTO `BLC_PRODUCT` VALUES (7,NULL,NULL,NULL,NULL,_binary '\0','Garden Row',NULL,NULL,NULL,_binary '\0','/hot-sauces/green_ghost',NULL,NULL,7);
INSERT INTO `BLC_PRODUCT` VALUES (8,NULL,NULL,NULL,NULL,_binary '\0','D. L. Jardine\'s',NULL,NULL,NULL,_binary '\0','/hot-sauces/blazin_saddle_hot_habanero_pepper_sauce',NULL,NULL,8);
INSERT INTO `BLC_PRODUCT` VALUES (9,NULL,NULL,NULL,NULL,_binary '','Figueroa Brothers',NULL,NULL,NULL,_binary '\0','/hot-sauces/armageddon_hot_sauce_to_end_all',NULL,NULL,9);
INSERT INTO `BLC_PRODUCT` VALUES (10,NULL,NULL,NULL,NULL,_binary '\0','Figueroa Brothers',NULL,NULL,NULL,_binary '\0','/hot-sauces/dr_chilemeisters_insane_hot_sauce',NULL,NULL,10);
INSERT INTO `BLC_PRODUCT` VALUES (11,NULL,NULL,NULL,NULL,_binary '\0','Brazos Legends',NULL,NULL,NULL,_binary '\0','/hot-sauces/bull_snort_cowboy_cayenne_pepper_hot_sauce',NULL,NULL,11);
INSERT INTO `BLC_PRODUCT` VALUES (12,NULL,NULL,NULL,NULL,_binary '\0','Garden Row',NULL,NULL,NULL,_binary '\0','/hot-sauces/cafe_louisiane_sweet_cajun_blackening_sauce',NULL,NULL,12);
INSERT INTO `BLC_PRODUCT` VALUES (13,NULL,NULL,NULL,NULL,_binary '','Brazos Legends',NULL,NULL,NULL,_binary '\0','/hot-sauces/bull_snort_smokin_toncils_hot_sauce',NULL,NULL,13);
INSERT INTO `BLC_PRODUCT` VALUES (14,NULL,NULL,NULL,NULL,_binary '\0','Dave\'s Gourmet',NULL,NULL,NULL,_binary '\0','/hot-sauces/cool_cayenne_pepper_hot_sauce',NULL,NULL,14);
INSERT INTO `BLC_PRODUCT` VALUES (15,NULL,NULL,NULL,NULL,_binary '\0','Dave\'s Gourmet',NULL,NULL,NULL,_binary '\0','/hot-sauces/roasted_garlic_hot_sauce',NULL,NULL,15);
INSERT INTO `BLC_PRODUCT` VALUES (16,NULL,NULL,NULL,NULL,_binary '\0','Dave\'s Gourmet',NULL,NULL,NULL,_binary '\0','/hot-sauces/scotch_bonnet_hot_sauce',NULL,NULL,16);
INSERT INTO `BLC_PRODUCT` VALUES (17,NULL,NULL,NULL,NULL,_binary '\0','Dave\'s Gourmet',NULL,NULL,NULL,_binary '\0','/hot-sauces/insanity_sauce',NULL,NULL,17);
INSERT INTO `BLC_PRODUCT` VALUES (18,NULL,NULL,NULL,NULL,_binary '\0','Dave\'s Gourmet',NULL,NULL,NULL,_binary '\0','/hot-sauces/hurtin_jalepeno_hot_sauce',NULL,NULL,18);
INSERT INTO `BLC_PRODUCT` VALUES (19,NULL,NULL,NULL,NULL,_binary '\0','Dave\'s Gourmet',NULL,NULL,NULL,_binary '\0','/hot-sauces/roasted_red_pepper_chipotle_hot_sauce',NULL,NULL,19);
INSERT INTO `BLC_PRODUCT` VALUES (100,NULL,NULL,NULL,NULL,_binary '\0','The Heat Clinic',NULL,NULL,NULL,NULL,'/merchandise/hawt_like_a_habanero_mens',NULL,NULL,100);
INSERT INTO `BLC_PRODUCT` VALUES (200,NULL,NULL,NULL,NULL,_binary '\0','The Heat Clinic',NULL,NULL,NULL,NULL,'/merchandise/hawt_like_a_habanero_womens',NULL,NULL,200);
INSERT INTO `BLC_PRODUCT` VALUES (300,NULL,NULL,NULL,NULL,_binary '\0','The Heat Clinic',NULL,NULL,NULL,NULL,'/merchandise/heat_clinic_hand-drawn_mens',NULL,NULL,300);
INSERT INTO `BLC_PRODUCT` VALUES (400,NULL,NULL,NULL,NULL,_binary '\0','The Heat Clinic',NULL,NULL,NULL,NULL,'/merchandise/heat_clinic_hand-drawn_womens',NULL,NULL,400);
INSERT INTO `BLC_PRODUCT` VALUES (500,NULL,NULL,NULL,NULL,_binary '\0','The Heat Clinic',NULL,NULL,NULL,NULL,'/merchandise/heat_clinic_mascot_mens',NULL,NULL,500);
INSERT INTO `BLC_PRODUCT` VALUES (600,NULL,NULL,NULL,NULL,_binary '\0','The Heat Clinic',NULL,NULL,NULL,NULL,'/merchandise/heat_clinic_mascot_womens',NULL,NULL,600);
/*!40000 ALTER TABLE `BLC_PRODUCT` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `BLC_PRODUCT_ATTRIBUTE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BLC_PRODUCT_ATTRIBUTE` (
  `PRODUCT_ATTRIBUTE_ID` bigint(20) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `VALUE` varchar(255) DEFAULT NULL,
  `PRODUCT_ID` bigint(20) NOT NULL,
  PRIMARY KEY (`PRODUCT_ATTRIBUTE_ID`),
  KEY `PRODUCTATTRIBUTE_NAME_INDEX` (`NAME`),
  KEY `PRODUCTATTRIBUTE_INDEX` (`PRODUCT_ID`),
  CONSTRAINT `FK5rahmy0l6hsgbvgb37ojlkx09` FOREIGN KEY (`PRODUCT_ID`) REFERENCES `BLC_PRODUCT` (`PRODUCT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `BLC_PRODUCT_ATTRIBUTE` WRITE;
/*!40000 ALTER TABLE `BLC_PRODUCT_ATTRIBUTE` DISABLE KEYS */;
INSERT INTO `BLC_PRODUCT_ATTRIBUTE` VALUES (1,'heatRange','4',1);
INSERT INTO `BLC_PRODUCT_ATTRIBUTE` VALUES (2,'heatRange','1',2);
INSERT INTO `BLC_PRODUCT_ATTRIBUTE` VALUES (3,'heatRange','2',3);
INSERT INTO `BLC_PRODUCT_ATTRIBUTE` VALUES (4,'heatRange','2',4);
INSERT INTO `BLC_PRODUCT_ATTRIBUTE` VALUES (5,'heatRange','4',5);
INSERT INTO `BLC_PRODUCT_ATTRIBUTE` VALUES (6,'heatRange','4',6);
INSERT INTO `BLC_PRODUCT_ATTRIBUTE` VALUES (7,'heatRange','3',7);
INSERT INTO `BLC_PRODUCT_ATTRIBUTE` VALUES (8,'heatRange','4',8);
INSERT INTO `BLC_PRODUCT_ATTRIBUTE` VALUES (9,'heatRange','5',9);
INSERT INTO `BLC_PRODUCT_ATTRIBUTE` VALUES (10,'heatRange','5',10);
INSERT INTO `BLC_PRODUCT_ATTRIBUTE` VALUES (11,'heatRange','2',11);
INSERT INTO `BLC_PRODUCT_ATTRIBUTE` VALUES (12,'heatRange','1',12);
INSERT INTO `BLC_PRODUCT_ATTRIBUTE` VALUES (13,'heatRange','2',13);
INSERT INTO `BLC_PRODUCT_ATTRIBUTE` VALUES (14,'heatRange','2',14);
INSERT INTO `BLC_PRODUCT_ATTRIBUTE` VALUES (15,'heatRange','1',15);
INSERT INTO `BLC_PRODUCT_ATTRIBUTE` VALUES (16,'heatRange','3',16);
INSERT INTO `BLC_PRODUCT_ATTRIBUTE` VALUES (17,'heatRange','5',17);
INSERT INTO `BLC_PRODUCT_ATTRIBUTE` VALUES (18,'heatRange','3',18);
INSERT INTO `BLC_PRODUCT_ATTRIBUTE` VALUES (19,'heatRange','1',19);
/*!40000 ALTER TABLE `BLC_PRODUCT_ATTRIBUTE` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `BLC_PRODUCT_BUNDLE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BLC_PRODUCT_BUNDLE` (
  `AUTO_BUNDLE` bit(1) DEFAULT NULL,
  `BUNDLE_PROMOTABLE` bit(1) DEFAULT NULL,
  `ITEMS_PROMOTABLE` bit(1) DEFAULT NULL,
  `PRICING_MODEL` varchar(255) DEFAULT NULL,
  `BUNDLE_PRIORITY` int(11) DEFAULT NULL,
  `PRODUCT_ID` bigint(20) NOT NULL,
  PRIMARY KEY (`PRODUCT_ID`),
  CONSTRAINT `FK2hern8ie7vx4k6cawbryglb9g` FOREIGN KEY (`PRODUCT_ID`) REFERENCES `BLC_PRODUCT` (`PRODUCT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `BLC_PRODUCT_BUNDLE` WRITE;
/*!40000 ALTER TABLE `BLC_PRODUCT_BUNDLE` DISABLE KEYS */;
/*!40000 ALTER TABLE `BLC_PRODUCT_BUNDLE` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `BLC_PRODUCT_CROSS_SALE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BLC_PRODUCT_CROSS_SALE` (
  `CROSS_SALE_PRODUCT_ID` bigint(20) NOT NULL,
  `PROMOTION_MESSAGE` varchar(255) DEFAULT NULL,
  `SEQUENCE` decimal(10,6) DEFAULT NULL,
  `CATEGORY_ID` bigint(20) DEFAULT NULL,
  `PRODUCT_ID` bigint(20) DEFAULT NULL,
  `RELATED_SALE_PRODUCT_ID` bigint(20) NOT NULL,
  PRIMARY KEY (`CROSS_SALE_PRODUCT_ID`),
  KEY `CROSSSALE_CATEGORY_INDEX` (`CATEGORY_ID`),
  KEY `CROSSSALE_INDEX` (`PRODUCT_ID`),
  KEY `CROSSSALE_RELATED_INDEX` (`RELATED_SALE_PRODUCT_ID`),
  CONSTRAINT `FKak6hk19vp8ioy27lrt7x9be7w` FOREIGN KEY (`CATEGORY_ID`) REFERENCES `BLC_CATEGORY` (`CATEGORY_ID`),
  CONSTRAINT `FKeq0i4yj6td2qxh0tnekeomrxk` FOREIGN KEY (`PRODUCT_ID`) REFERENCES `BLC_PRODUCT` (`PRODUCT_ID`),
  CONSTRAINT `FKovg4s9i9ejesgcygfpyjq7eqa` FOREIGN KEY (`RELATED_SALE_PRODUCT_ID`) REFERENCES `BLC_PRODUCT` (`PRODUCT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `BLC_PRODUCT_CROSS_SALE` WRITE;
/*!40000 ALTER TABLE `BLC_PRODUCT_CROSS_SALE` DISABLE KEYS */;
/*!40000 ALTER TABLE `BLC_PRODUCT_CROSS_SALE` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `BLC_PRODUCT_FEATURED`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BLC_PRODUCT_FEATURED` (
  `FEATURED_PRODUCT_ID` bigint(20) NOT NULL,
  `PROMOTION_MESSAGE` varchar(255) DEFAULT NULL,
  `SEQUENCE` decimal(10,6) DEFAULT NULL,
  `CATEGORY_ID` bigint(20) DEFAULT NULL,
  `PRODUCT_ID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`FEATURED_PRODUCT_ID`),
  KEY `PRODFEATURED_CATEGORY_INDEX` (`CATEGORY_ID`),
  KEY `PRODFEATURED_PRODUCT_INDEX` (`PRODUCT_ID`),
  CONSTRAINT `FK83xhh0734p8wo8w64di8qwd9o` FOREIGN KEY (`CATEGORY_ID`) REFERENCES `BLC_CATEGORY` (`CATEGORY_ID`),
  CONSTRAINT `FKr4v6adrqqmd1qe09i6mb8fj8p` FOREIGN KEY (`PRODUCT_ID`) REFERENCES `BLC_PRODUCT` (`PRODUCT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `BLC_PRODUCT_FEATURED` WRITE;
/*!40000 ALTER TABLE `BLC_PRODUCT_FEATURED` DISABLE KEYS */;
INSERT INTO `BLC_PRODUCT_FEATURED` VALUES (1,NULL,1.000000,2001,18);
INSERT INTO `BLC_PRODUCT_FEATURED` VALUES (2,NULL,2.000000,2001,15);
INSERT INTO `BLC_PRODUCT_FEATURED` VALUES (3,NULL,3.000000,2001,200);
INSERT INTO `BLC_PRODUCT_FEATURED` VALUES (4,NULL,4.000000,2001,100);
INSERT INTO `BLC_PRODUCT_FEATURED` VALUES (5,NULL,1.000000,2003,500);
INSERT INTO `BLC_PRODUCT_FEATURED` VALUES (8,NULL,1.000000,2002,4);
INSERT INTO `BLC_PRODUCT_FEATURED` VALUES (9,NULL,2.000000,2002,5);
INSERT INTO `BLC_PRODUCT_FEATURED` VALUES (10,NULL,3.000000,2002,3);
INSERT INTO `BLC_PRODUCT_FEATURED` VALUES (11,NULL,4.000000,2002,12);
/*!40000 ALTER TABLE `BLC_PRODUCT_FEATURED` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `BLC_PRODUCT_OPTION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BLC_PRODUCT_OPTION` (
  `PRODUCT_OPTION_ID` bigint(20) NOT NULL,
  `ATTRIBUTE_NAME` varchar(255) DEFAULT NULL,
  `DISPLAY_ORDER` int(11) DEFAULT NULL,
  `ERROR_CODE` varchar(255) DEFAULT NULL,
  `ERROR_MESSAGE` varchar(255) DEFAULT NULL,
  `LABEL` varchar(255) DEFAULT NULL,
  `NAME` varchar(255) DEFAULT NULL,
  `VALIDATION_STRATEGY_TYPE` varchar(255) DEFAULT NULL,
  `VALIDATION_TYPE` varchar(255) DEFAULT NULL,
  `REQUIRED` bit(1) DEFAULT NULL,
  `OPTION_TYPE` varchar(255) DEFAULT NULL,
  `USE_IN_SKU_GENERATION` bit(1) DEFAULT NULL,
  `VALIDATION_STRING` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`PRODUCT_OPTION_ID`),
  KEY `PRODUCT_OPTION_NAME_INDEX` (`NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `BLC_PRODUCT_OPTION` WRITE;
/*!40000 ALTER TABLE `BLC_PRODUCT_OPTION` DISABLE KEYS */;
INSERT INTO `BLC_PRODUCT_OPTION` VALUES (1,'COLOR',NULL,NULL,NULL,'Shirt Color','Shirt Color','NONE',NULL,_binary '','COLOR',NULL,NULL);
INSERT INTO `BLC_PRODUCT_OPTION` VALUES (2,'SIZE',NULL,NULL,NULL,'Shirt Size','Shirt Size','NONE',NULL,_binary '','SIZE',NULL,NULL);
INSERT INTO `BLC_PRODUCT_OPTION` VALUES (3,'NAME',NULL,'INVALID_NAME','Name must be less than 30 characters, with only letters and spaces','Personalized Name','Personalized Name','SUBMIT_ORDER','REGEX',_binary '\0','TEXT',_binary '\0','[a-zA-Z ]{0,30}');
/*!40000 ALTER TABLE `BLC_PRODUCT_OPTION` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `BLC_PRODUCT_OPTION_VALUE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BLC_PRODUCT_OPTION_VALUE` (
  `PRODUCT_OPTION_VALUE_ID` bigint(20) NOT NULL,
  `ATTRIBUTE_VALUE` varchar(255) DEFAULT NULL,
  `DISPLAY_ORDER` bigint(20) DEFAULT NULL,
  `PRICE_ADJUSTMENT` decimal(19,5) DEFAULT NULL,
  `PRODUCT_OPTION_ID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`PRODUCT_OPTION_VALUE_ID`),
  KEY `FK9ixc1gbymkin77d6krmc3mub7` (`PRODUCT_OPTION_ID`),
  CONSTRAINT `FK9ixc1gbymkin77d6krmc3mub7` FOREIGN KEY (`PRODUCT_OPTION_ID`) REFERENCES `BLC_PRODUCT_OPTION` (`PRODUCT_OPTION_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `BLC_PRODUCT_OPTION_VALUE` WRITE;
/*!40000 ALTER TABLE `BLC_PRODUCT_OPTION_VALUE` DISABLE KEYS */;
INSERT INTO `BLC_PRODUCT_OPTION_VALUE` VALUES (1,'Black',1,NULL,1);
INSERT INTO `BLC_PRODUCT_OPTION_VALUE` VALUES (2,'Red',2,NULL,1);
INSERT INTO `BLC_PRODUCT_OPTION_VALUE` VALUES (3,'Silver',3,NULL,1);
INSERT INTO `BLC_PRODUCT_OPTION_VALUE` VALUES (11,'S',1,NULL,2);
INSERT INTO `BLC_PRODUCT_OPTION_VALUE` VALUES (12,'M',2,NULL,2);
INSERT INTO `BLC_PRODUCT_OPTION_VALUE` VALUES (13,'L',3,NULL,2);
INSERT INTO `BLC_PRODUCT_OPTION_VALUE` VALUES (14,'XL',4,NULL,2);
/*!40000 ALTER TABLE `BLC_PRODUCT_OPTION_VALUE` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `BLC_PRODUCT_OPTION_XREF`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BLC_PRODUCT_OPTION_XREF` (
  `PRODUCT_OPTION_XREF_ID` bigint(20) NOT NULL,
  `PRODUCT_ID` bigint(20) NOT NULL,
  `PRODUCT_OPTION_ID` bigint(20) NOT NULL,
  PRIMARY KEY (`PRODUCT_OPTION_XREF_ID`),
  KEY `FKhqikdn2uw75plhcwn4cmjtt4m` (`PRODUCT_ID`),
  KEY `FKswm8iotfkm6a9iyj6ru3rmpv8` (`PRODUCT_OPTION_ID`),
  CONSTRAINT `FKhqikdn2uw75plhcwn4cmjtt4m` FOREIGN KEY (`PRODUCT_ID`) REFERENCES `BLC_PRODUCT` (`PRODUCT_ID`),
  CONSTRAINT `FKswm8iotfkm6a9iyj6ru3rmpv8` FOREIGN KEY (`PRODUCT_OPTION_ID`) REFERENCES `BLC_PRODUCT_OPTION` (`PRODUCT_OPTION_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `BLC_PRODUCT_OPTION_XREF` WRITE;
/*!40000 ALTER TABLE `BLC_PRODUCT_OPTION_XREF` DISABLE KEYS */;
INSERT INTO `BLC_PRODUCT_OPTION_XREF` VALUES (1,100,1);
INSERT INTO `BLC_PRODUCT_OPTION_XREF` VALUES (2,200,1);
INSERT INTO `BLC_PRODUCT_OPTION_XREF` VALUES (3,300,1);
INSERT INTO `BLC_PRODUCT_OPTION_XREF` VALUES (4,400,1);
INSERT INTO `BLC_PRODUCT_OPTION_XREF` VALUES (5,500,1);
INSERT INTO `BLC_PRODUCT_OPTION_XREF` VALUES (6,600,1);
INSERT INTO `BLC_PRODUCT_OPTION_XREF` VALUES (7,100,2);
INSERT INTO `BLC_PRODUCT_OPTION_XREF` VALUES (8,200,2);
INSERT INTO `BLC_PRODUCT_OPTION_XREF` VALUES (9,300,2);
INSERT INTO `BLC_PRODUCT_OPTION_XREF` VALUES (10,400,2);
INSERT INTO `BLC_PRODUCT_OPTION_XREF` VALUES (11,500,2);
INSERT INTO `BLC_PRODUCT_OPTION_XREF` VALUES (12,600,2);
INSERT INTO `BLC_PRODUCT_OPTION_XREF` VALUES (13,100,3);
/*!40000 ALTER TABLE `BLC_PRODUCT_OPTION_XREF` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `BLC_PRODUCT_UP_SALE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BLC_PRODUCT_UP_SALE` (
  `UP_SALE_PRODUCT_ID` bigint(20) NOT NULL,
  `PROMOTION_MESSAGE` varchar(255) DEFAULT NULL,
  `SEQUENCE` decimal(10,6) DEFAULT NULL,
  `CATEGORY_ID` bigint(20) DEFAULT NULL,
  `PRODUCT_ID` bigint(20) DEFAULT NULL,
  `RELATED_SALE_PRODUCT_ID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`UP_SALE_PRODUCT_ID`),
  KEY `UPSALE_CATEGORY_INDEX` (`CATEGORY_ID`),
  KEY `UPSALE_PRODUCT_INDEX` (`PRODUCT_ID`),
  KEY `UPSALE_RELATED_INDEX` (`RELATED_SALE_PRODUCT_ID`),
  CONSTRAINT `FKgefhcqet8553xhh9bdjb1jbjo` FOREIGN KEY (`PRODUCT_ID`) REFERENCES `BLC_PRODUCT` (`PRODUCT_ID`),
  CONSTRAINT `FKkcx4cl73kctdinewei1fk2vvl` FOREIGN KEY (`CATEGORY_ID`) REFERENCES `BLC_CATEGORY` (`CATEGORY_ID`),
  CONSTRAINT `FKm1r8s9j593gpcgluy5uyfa862` FOREIGN KEY (`RELATED_SALE_PRODUCT_ID`) REFERENCES `BLC_PRODUCT` (`PRODUCT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `BLC_PRODUCT_UP_SALE` WRITE;
/*!40000 ALTER TABLE `BLC_PRODUCT_UP_SALE` DISABLE KEYS */;
/*!40000 ALTER TABLE `BLC_PRODUCT_UP_SALE` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `BLC_PROMOTION_MESSAGE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BLC_PROMOTION_MESSAGE` (
  `PROMOTION_MESSAGE_ID` bigint(20) NOT NULL,
  `ARCHIVED` char(1) DEFAULT NULL,
  `END_DATE` datetime DEFAULT NULL,
  `PROMOTION_MESSASGE` varchar(255) DEFAULT NULL,
  `MESSAGE_PLACEMENT` varchar(255) DEFAULT NULL,
  `NAME` varchar(255) DEFAULT NULL,
  `PROMOTION_MESSAGE_PRIORITY` int(11) DEFAULT NULL,
  `START_DATE` datetime DEFAULT NULL,
  `LOCALE_CODE` varchar(255) DEFAULT NULL,
  `MEDIA_ID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`PROMOTION_MESSAGE_ID`),
  KEY `PROMOTION_MESSAGE_NAME_INDEX` (`NAME`),
  KEY `FK3dgs3j2b8mshpafd25qvtftgv` (`LOCALE_CODE`),
  KEY `FK59dkr5skbs8ve2v27truld8kc` (`MEDIA_ID`),
  CONSTRAINT `FK3dgs3j2b8mshpafd25qvtftgv` FOREIGN KEY (`LOCALE_CODE`) REFERENCES `BLC_LOCALE` (`LOCALE_CODE`),
  CONSTRAINT `FK59dkr5skbs8ve2v27truld8kc` FOREIGN KEY (`MEDIA_ID`) REFERENCES `BLC_MEDIA` (`MEDIA_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `BLC_PROMOTION_MESSAGE` WRITE;
/*!40000 ALTER TABLE `BLC_PROMOTION_MESSAGE` DISABLE KEYS */;
/*!40000 ALTER TABLE `BLC_PROMOTION_MESSAGE` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `BLC_PRORATED_ORDER_ITEM_ADJUST`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BLC_PRORATED_ORDER_ITEM_ADJUST` (
  `PRORATED_ORDER_ITEM_ADJUST_ID` bigint(20) NOT NULL,
  `PRORATED_QUANTITY` int(11) NOT NULL,
  `ADJUSTMENT_REASON` varchar(255) NOT NULL,
  `PRORATED_ADJUSTMENT_VALUE` decimal(19,5) NOT NULL,
  `OFFER_ID` bigint(20) NOT NULL,
  `ORDER_ITEM_ID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`PRORATED_ORDER_ITEM_ADJUST_ID`),
  KEY `POIADJUST_ITEM_INDEX` (`ORDER_ITEM_ID`),
  KEY `FKkud7s4f923plknu6u4041v3oa` (`OFFER_ID`),
  CONSTRAINT `FKfmq7jd0v7r11g8hlvyuw50u6q` FOREIGN KEY (`ORDER_ITEM_ID`) REFERENCES `BLC_ORDER_ITEM` (`ORDER_ITEM_ID`),
  CONSTRAINT `FKkud7s4f923plknu6u4041v3oa` FOREIGN KEY (`OFFER_ID`) REFERENCES `BLC_OFFER` (`OFFER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `BLC_PRORATED_ORDER_ITEM_ADJUST` WRITE;
/*!40000 ALTER TABLE `BLC_PRORATED_ORDER_ITEM_ADJUST` DISABLE KEYS */;
/*!40000 ALTER TABLE `BLC_PRORATED_ORDER_ITEM_ADJUST` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `BLC_QUAL_CRIT_OFFER_XREF`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BLC_QUAL_CRIT_OFFER_XREF` (
  `OFFER_QUAL_CRIT_ID` bigint(20) NOT NULL,
  `OFFER_ID` bigint(20) NOT NULL,
  `OFFER_ITEM_CRITERIA_ID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`OFFER_QUAL_CRIT_ID`),
  KEY `FKmmxl8rjhiuu6hc7qhyy85pjov` (`OFFER_ID`),
  KEY `FK6e8y3yk68wvw90gtsesduqbrb` (`OFFER_ITEM_CRITERIA_ID`),
  CONSTRAINT `FK6e8y3yk68wvw90gtsesduqbrb` FOREIGN KEY (`OFFER_ITEM_CRITERIA_ID`) REFERENCES `BLC_OFFER_ITEM_CRITERIA` (`OFFER_ITEM_CRITERIA_ID`),
  CONSTRAINT `FKmmxl8rjhiuu6hc7qhyy85pjov` FOREIGN KEY (`OFFER_ID`) REFERENCES `BLC_OFFER` (`OFFER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `BLC_QUAL_CRIT_OFFER_XREF` WRITE;
/*!40000 ALTER TABLE `BLC_QUAL_CRIT_OFFER_XREF` DISABLE KEYS */;
/*!40000 ALTER TABLE `BLC_QUAL_CRIT_OFFER_XREF` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `BLC_QUAL_CRIT_PAGE_XREF`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BLC_QUAL_CRIT_PAGE_XREF` (
  `PAGE_ID` bigint(20) NOT NULL,
  `PAGE_ITEM_CRITERIA_ID` bigint(20) NOT NULL,
  PRIMARY KEY (`PAGE_ID`,`PAGE_ITEM_CRITERIA_ID`),
  UNIQUE KEY `UK_dg6txhn3dw4k680q2sjyeumml` (`PAGE_ITEM_CRITERIA_ID`),
  CONSTRAINT `FKm0ov6kstmsab8gy93m53c05tg` FOREIGN KEY (`PAGE_ID`) REFERENCES `BLC_PAGE` (`PAGE_ID`),
  CONSTRAINT `FKpe7oenmm4t3g8ypvo5j2yjrd7` FOREIGN KEY (`PAGE_ITEM_CRITERIA_ID`) REFERENCES `BLC_PAGE_ITEM_CRITERIA` (`PAGE_ITEM_CRITERIA_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `BLC_QUAL_CRIT_PAGE_XREF` WRITE;
/*!40000 ALTER TABLE `BLC_QUAL_CRIT_PAGE_XREF` DISABLE KEYS */;
/*!40000 ALTER TABLE `BLC_QUAL_CRIT_PAGE_XREF` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `BLC_QUAL_CRIT_SC_XREF`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BLC_QUAL_CRIT_SC_XREF` (
  `SC_ID` bigint(20) NOT NULL,
  `SC_ITEM_CRITERIA_ID` bigint(20) NOT NULL,
  PRIMARY KEY (`SC_ID`,`SC_ITEM_CRITERIA_ID`),
  UNIQUE KEY `UK_afqd4tvahqdouwkfb55xjuycm` (`SC_ITEM_CRITERIA_ID`),
  CONSTRAINT `FK6v9jfn06vkk5kpio9jdu08t30` FOREIGN KEY (`SC_ITEM_CRITERIA_ID`) REFERENCES `BLC_SC_ITEM_CRITERIA` (`SC_ITEM_CRITERIA_ID`),
  CONSTRAINT `FKq0wnd7j8o8ss4umkpdjn38ota` FOREIGN KEY (`SC_ID`) REFERENCES `BLC_SC` (`SC_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `BLC_QUAL_CRIT_SC_XREF` WRITE;
/*!40000 ALTER TABLE `BLC_QUAL_CRIT_SC_XREF` DISABLE KEYS */;
/*!40000 ALTER TABLE `BLC_QUAL_CRIT_SC_XREF` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `BLC_RATING_DETAIL`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BLC_RATING_DETAIL` (
  `RATING_DETAIL_ID` bigint(20) NOT NULL,
  `RATING` double NOT NULL,
  `RATING_SUBMITTED_DATE` datetime NOT NULL,
  `CUSTOMER_ID` bigint(20) NOT NULL,
  `RATING_SUMMARY_ID` bigint(20) NOT NULL,
  PRIMARY KEY (`RATING_DETAIL_ID`),
  KEY `RATING_CUSTOMER_INDEX` (`CUSTOMER_ID`),
  KEY `FKorvii76lm0rnac92c67q1oles` (`RATING_SUMMARY_ID`),
  CONSTRAINT `FKjjjou706ellmb65wmy7gpv07s` FOREIGN KEY (`CUSTOMER_ID`) REFERENCES `BLC_CUSTOMER` (`CUSTOMER_ID`),
  CONSTRAINT `FKorvii76lm0rnac92c67q1oles` FOREIGN KEY (`RATING_SUMMARY_ID`) REFERENCES `BLC_RATING_SUMMARY` (`RATING_SUMMARY_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `BLC_RATING_DETAIL` WRITE;
/*!40000 ALTER TABLE `BLC_RATING_DETAIL` DISABLE KEYS */;
/*!40000 ALTER TABLE `BLC_RATING_DETAIL` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `BLC_RATING_SUMMARY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BLC_RATING_SUMMARY` (
  `RATING_SUMMARY_ID` bigint(20) NOT NULL,
  `AVERAGE_RATING` double NOT NULL,
  `ITEM_ID` varchar(255) NOT NULL,
  `RATING_TYPE` varchar(255) NOT NULL,
  PRIMARY KEY (`RATING_SUMMARY_ID`),
  KEY `RATINGSUMM_ITEM_INDEX` (`ITEM_ID`),
  KEY `RATINGSUMM_TYPE_INDEX` (`RATING_TYPE`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `BLC_RATING_SUMMARY` WRITE;
/*!40000 ALTER TABLE `BLC_RATING_SUMMARY` DISABLE KEYS */;
/*!40000 ALTER TABLE `BLC_RATING_SUMMARY` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `BLC_REVIEW_DETAIL`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BLC_REVIEW_DETAIL` (
  `REVIEW_DETAIL_ID` bigint(20) NOT NULL,
  `HELPFUL_COUNT` int(11) NOT NULL,
  `NOT_HELPFUL_COUNT` int(11) NOT NULL,
  `REVIEW_SUBMITTED_DATE` datetime NOT NULL,
  `REVIEW_STATUS` varchar(255) NOT NULL,
  `REVIEW_TEXT` varchar(255) NOT NULL,
  `CUSTOMER_ID` bigint(20) NOT NULL,
  `RATING_DETAIL_ID` bigint(20) DEFAULT NULL,
  `RATING_SUMMARY_ID` bigint(20) NOT NULL,
  PRIMARY KEY (`REVIEW_DETAIL_ID`),
  KEY `REVIEWDETAIL_CUSTOMER_INDEX` (`CUSTOMER_ID`),
  KEY `REVIEWDETAIL_RATING_INDEX` (`RATING_DETAIL_ID`),
  KEY `REVIEWDETAIL_SUMMARY_INDEX` (`RATING_SUMMARY_ID`),
  KEY `REVIEWDETAIL_STATUS_INDEX` (`REVIEW_STATUS`),
  CONSTRAINT `FKdc0r2t22u3ghe0ihma8dcd5y6` FOREIGN KEY (`CUSTOMER_ID`) REFERENCES `BLC_CUSTOMER` (`CUSTOMER_ID`),
  CONSTRAINT `FKhp1g51hyv3y8gr2tedxm0pgyl` FOREIGN KEY (`RATING_DETAIL_ID`) REFERENCES `BLC_RATING_DETAIL` (`RATING_DETAIL_ID`),
  CONSTRAINT `FKn9hvs3m8fhodmipm3fvmwhw74` FOREIGN KEY (`RATING_SUMMARY_ID`) REFERENCES `BLC_RATING_SUMMARY` (`RATING_SUMMARY_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `BLC_REVIEW_DETAIL` WRITE;
/*!40000 ALTER TABLE `BLC_REVIEW_DETAIL` DISABLE KEYS */;
/*!40000 ALTER TABLE `BLC_REVIEW_DETAIL` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `BLC_REVIEW_FEEDBACK`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BLC_REVIEW_FEEDBACK` (
  `REVIEW_FEEDBACK_ID` bigint(20) NOT NULL,
  `IS_HELPFUL` bit(1) NOT NULL,
  `CUSTOMER_ID` bigint(20) NOT NULL,
  `REVIEW_DETAIL_ID` bigint(20) NOT NULL,
  PRIMARY KEY (`REVIEW_FEEDBACK_ID`),
  KEY `REVIEWFEED_CUSTOMER_INDEX` (`CUSTOMER_ID`),
  KEY `REVIEWFEED_DETAIL_INDEX` (`REVIEW_DETAIL_ID`),
  CONSTRAINT `FKaledeh8wwn4ykopccqh3to8k5` FOREIGN KEY (`REVIEW_DETAIL_ID`) REFERENCES `BLC_REVIEW_DETAIL` (`REVIEW_DETAIL_ID`),
  CONSTRAINT `FKmppbg4bf4h8v1m9efgm10ty4b` FOREIGN KEY (`CUSTOMER_ID`) REFERENCES `BLC_CUSTOMER` (`CUSTOMER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `BLC_REVIEW_FEEDBACK` WRITE;
/*!40000 ALTER TABLE `BLC_REVIEW_FEEDBACK` DISABLE KEYS */;
/*!40000 ALTER TABLE `BLC_REVIEW_FEEDBACK` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `BLC_ROLE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BLC_ROLE` (
  `ROLE_ID` bigint(20) NOT NULL,
  `ROLE_NAME` varchar(255) NOT NULL,
  PRIMARY KEY (`ROLE_ID`),
  KEY `ROLE_NAME_INDEX` (`ROLE_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `BLC_ROLE` WRITE;
/*!40000 ALTER TABLE `BLC_ROLE` DISABLE KEYS */;
INSERT INTO `BLC_ROLE` VALUES (1,'ROLE_USER');
/*!40000 ALTER TABLE `BLC_ROLE` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `BLC_SANDBOX`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BLC_SANDBOX` (
  `SANDBOX_ID` bigint(20) NOT NULL,
  `ARCHIVED` char(1) DEFAULT NULL,
  `AUTHOR` bigint(20) DEFAULT NULL,
  `COLOR` varchar(255) DEFAULT NULL,
  `DESCRIPTION` varchar(255) DEFAULT NULL,
  `GO_LIVE_DATE` datetime DEFAULT NULL,
  `SANDBOX_NAME` varchar(255) DEFAULT NULL,
  `SANDBOX_TYPE` varchar(255) DEFAULT NULL,
  `PARENT_SANDBOX_ID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`SANDBOX_ID`),
  KEY `SANDBOX_NAME_INDEX` (`SANDBOX_NAME`),
  KEY `FK5e7j7mfpr1en8q48yxkbjmduw` (`PARENT_SANDBOX_ID`),
  CONSTRAINT `FK5e7j7mfpr1en8q48yxkbjmduw` FOREIGN KEY (`PARENT_SANDBOX_ID`) REFERENCES `BLC_SANDBOX` (`SANDBOX_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `BLC_SANDBOX` WRITE;
/*!40000 ALTER TABLE `BLC_SANDBOX` DISABLE KEYS */;
/*!40000 ALTER TABLE `BLC_SANDBOX` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `BLC_SANDBOX_MGMT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BLC_SANDBOX_MGMT` (
  `SANDBOX_MGMT_ID` bigint(20) NOT NULL,
  `SANDBOX_ID` bigint(20) NOT NULL,
  PRIMARY KEY (`SANDBOX_MGMT_ID`),
  UNIQUE KEY `UK_owins1o4pyal0j5pdlqfkd4b7` (`SANDBOX_ID`),
  CONSTRAINT `FKri581qivns8jshddbsl6m83hr` FOREIGN KEY (`SANDBOX_ID`) REFERENCES `BLC_SANDBOX` (`SANDBOX_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `BLC_SANDBOX_MGMT` WRITE;
/*!40000 ALTER TABLE `BLC_SANDBOX_MGMT` DISABLE KEYS */;
/*!40000 ALTER TABLE `BLC_SANDBOX_MGMT` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `BLC_SC`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BLC_SC` (
  `SC_ID` bigint(20) NOT NULL,
  `CONTENT_NAME` varchar(255) NOT NULL,
  `OFFLINE_FLAG` bit(1) DEFAULT NULL,
  `PRIORITY` int(11) NOT NULL,
  `LOCALE_CODE` varchar(255) NOT NULL,
  `SC_TYPE_ID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`SC_ID`),
  KEY `CONTENT_NAME_INDEX` (`CONTENT_NAME`),
  KEY `SC_OFFLN_FLG_INDX` (`OFFLINE_FLAG`),
  KEY `CONTENT_PRIORITY_INDEX` (`PRIORITY`),
  KEY `FK13qnfvvq355l9cckfxkqqh59` (`LOCALE_CODE`),
  KEY `FKp9be5g25yydwn151wnwvbj9hu` (`SC_TYPE_ID`),
  CONSTRAINT `FK13qnfvvq355l9cckfxkqqh59` FOREIGN KEY (`LOCALE_CODE`) REFERENCES `BLC_LOCALE` (`LOCALE_CODE`),
  CONSTRAINT `FKp9be5g25yydwn151wnwvbj9hu` FOREIGN KEY (`SC_TYPE_ID`) REFERENCES `BLC_SC_TYPE` (`SC_TYPE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `BLC_SC` WRITE;
/*!40000 ALTER TABLE `BLC_SC` DISABLE KEYS */;
INSERT INTO `BLC_SC` VALUES (-140,'RHS - The Essentials Collection',_binary '\0',5,'en',4);
INSERT INTO `BLC_SC` VALUES (-130,'Home Page Featured Products Title',_binary '\0',5,'en',3);
INSERT INTO `BLC_SC` VALUES (-110,'Home Page Snippet - Aficionado',_binary '\0',5,'en',2);
INSERT INTO `BLC_SC` VALUES (-105,'Member Special - $10 off next order over $50',_binary '\0',3,'en',1);
INSERT INTO `BLC_SC` VALUES (-104,'Shirt Special - 20% off all shirts',_binary '\0',1,'en',1);
INSERT INTO `BLC_SC` VALUES (-103,'Buy One Get One - Twice the Burn',_binary '\0',2,'en',1);
INSERT INTO `BLC_SC` VALUES (-102,'Member Special - $10 off next order over $50',_binary '\0',3,'en',1);
INSERT INTO `BLC_SC` VALUES (-101,'Shirt Special - 20% off all shirts',_binary '\0',1,'en',1);
INSERT INTO `BLC_SC` VALUES (-100,'Buy One Get One - Twice the Burn',_binary '\0',2,'en',1);
INSERT INTO `BLC_SC` VALUES (151,'Promocion - 20% de descuento en todas las camisas',_binary '\0',1,'es',1);
INSERT INTO `BLC_SC` VALUES (152,'Promocion - 20% de descuento en todas las camisas',_binary '\0',1,'fr',1);
INSERT INTO `BLC_SC` VALUES (153,'Home Page Snippet (es) - Aficionado',_binary '\0',5,'es',2);
INSERT INTO `BLC_SC` VALUES (154,'Home Page Snippet (es) - Aficionado',_binary '\0',5,'fr',2);
INSERT INTO `BLC_SC` VALUES (155,'Home Page Featured Products Title',_binary '\0',5,'es',3);
INSERT INTO `BLC_SC` VALUES (156,'Home Page Featured Products Title',_binary '\0',5,'fr',3);
/*!40000 ALTER TABLE `BLC_SC` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `BLC_SC_FLD`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BLC_SC_FLD` (
  `SC_FLD_ID` bigint(20) NOT NULL,
  `FLD_KEY` varchar(255) DEFAULT NULL,
  `LOB_VALUE` longtext,
  `VALUE` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`SC_FLD_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `BLC_SC_FLD` WRITE;
/*!40000 ALTER TABLE `BLC_SC_FLD` DISABLE KEYS */;
INSERT INTO `BLC_SC_FLD` VALUES (-13,'targetUrl',NULL,'/hot-sauces');
INSERT INTO `BLC_SC_FLD` VALUES (-12,'imageUrl',NULL,'/img/rhs-ad.jpg');
INSERT INTO `BLC_SC_FLD` VALUES (-11,'messageText',NULL,'The Heat Clinic\'s Top Selling Sauces');
INSERT INTO `BLC_SC_FLD` VALUES (-9,'htmlContent',NULL,'<h2>HOT SAUCE AFICIONADO?</h2> Create an account to join our Heat Clinic Frequent Care Program. The place to get all the deals on burn treatment.');
INSERT INTO `BLC_SC_FLD` VALUES (-6,'targetUrl',NULL,'/register');
INSERT INTO `BLC_SC_FLD` VALUES (-5,'imageUrl',NULL,'/cmsstatic/img/banners/member-special.jpg');
INSERT INTO `BLC_SC_FLD` VALUES (-4,'targetUrl',NULL,'/merchandise');
INSERT INTO `BLC_SC_FLD` VALUES (-3,'imageUrl',NULL,'/cmsstatic/img/banners/shirt-special.jpg');
INSERT INTO `BLC_SC_FLD` VALUES (-2,'targetUrl',NULL,'/hot-sauces');
INSERT INTO `BLC_SC_FLD` VALUES (-1,'imageUrl',NULL,'/cmsstatic/img/banners/buy-one-get-one-home-banner.jpg');
INSERT INTO `BLC_SC_FLD` VALUES (51,'imageUrl',NULL,'/cmsstatic/img/banners/promocion-camisas.jpg');
INSERT INTO `BLC_SC_FLD` VALUES (52,'targetUrl',NULL,'/merchandise');
INSERT INTO `BLC_SC_FLD` VALUES (53,'imageUrl',NULL,'/cmsstatic/img/banners/shirts-speciale.jpg');
INSERT INTO `BLC_SC_FLD` VALUES (54,'targetUrl',NULL,'/merchandise');
INSERT INTO `BLC_SC_FLD` VALUES (55,'htmlContent',NULL,'<h2>AFICIONADO DE SALSAS PICANTES?</h2> Haga click para unirse a nuerto programa de Cuidades Intensivos de Heat Clinic. El lugar para conseguir las mejores ofertas.');
INSERT INTO `BLC_SC_FLD` VALUES (56,'htmlContent',NULL,'<h2>AFICIONADO SAUCE PIQUANTE?</h2> Cliquez ici pour vous joindre &agrave; notre clinique de chaleur du Programme de soins fr&eacute;quents. L&#39;endroit pour obtenir toutes les offres sur le traitement des br&ucirc;lures.');
INSERT INTO `BLC_SC_FLD` VALUES (57,'messageText',NULL,'Las Salsas M&aacute;s vendidas de Heat Clinic');
INSERT INTO `BLC_SC_FLD` VALUES (58,'messageText',NULL,'La Clinique Heat Sauces Meilleures Ventes');
/*!40000 ALTER TABLE `BLC_SC_FLD` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `BLC_SC_FLDGRP_XREF`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BLC_SC_FLDGRP_XREF` (
  `BLC_SC_FLDGRP_XREF_ID` bigint(20) NOT NULL,
  `GROUP_ORDER` int(11) DEFAULT NULL,
  `FLD_GROUP_ID` bigint(20) DEFAULT NULL,
  `SC_FLD_TMPLT_ID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`BLC_SC_FLDGRP_XREF_ID`),
  KEY `FKotfd5rhlje73tldskasabxd7k` (`FLD_GROUP_ID`),
  KEY `FKtqvhk2j6dxo8kruvflvpstgf` (`SC_FLD_TMPLT_ID`),
  CONSTRAINT `FKotfd5rhlje73tldskasabxd7k` FOREIGN KEY (`FLD_GROUP_ID`) REFERENCES `BLC_FLD_GROUP` (`FLD_GROUP_ID`),
  CONSTRAINT `FKtqvhk2j6dxo8kruvflvpstgf` FOREIGN KEY (`SC_FLD_TMPLT_ID`) REFERENCES `BLC_SC_FLD_TMPLT` (`SC_FLD_TMPLT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `BLC_SC_FLDGRP_XREF` WRITE;
/*!40000 ALTER TABLE `BLC_SC_FLDGRP_XREF` DISABLE KEYS */;
INSERT INTO `BLC_SC_FLDGRP_XREF` VALUES (-3,0,6,-3);
INSERT INTO `BLC_SC_FLDGRP_XREF` VALUES (-2,0,5,-2);
INSERT INTO `BLC_SC_FLDGRP_XREF` VALUES (-1,0,4,-1);
/*!40000 ALTER TABLE `BLC_SC_FLDGRP_XREF` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `BLC_SC_FLD_MAP`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BLC_SC_FLD_MAP` (
  `BLC_SC_SC_FIELD_ID` bigint(20) NOT NULL,
  `MAP_KEY` varchar(255) NOT NULL,
  `SC_ID` bigint(20) NOT NULL,
  `SC_FLD_ID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`BLC_SC_SC_FIELD_ID`),
  KEY `FKh54fvkukkun10yu69gr7neyj9` (`SC_ID`),
  KEY `FKrwpb5a8l5uoeu4u046uihdx1g` (`SC_FLD_ID`),
  CONSTRAINT `FKh54fvkukkun10yu69gr7neyj9` FOREIGN KEY (`SC_ID`) REFERENCES `BLC_SC` (`SC_ID`),
  CONSTRAINT `FKrwpb5a8l5uoeu4u046uihdx1g` FOREIGN KEY (`SC_FLD_ID`) REFERENCES `BLC_SC_FLD` (`SC_FLD_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `BLC_SC_FLD_MAP` WRITE;
/*!40000 ALTER TABLE `BLC_SC_FLD_MAP` DISABLE KEYS */;
INSERT INTO `BLC_SC_FLD_MAP` VALUES (-173,'targetUrl',-105,-6);
INSERT INTO `BLC_SC_FLD_MAP` VALUES (-172,'imageUrl',-105,-5);
INSERT INTO `BLC_SC_FLD_MAP` VALUES (-171,'targetUrl',-104,-4);
INSERT INTO `BLC_SC_FLD_MAP` VALUES (-170,'imageUrl',-104,-3);
INSERT INTO `BLC_SC_FLD_MAP` VALUES (-169,'targetUrl',-103,-2);
INSERT INTO `BLC_SC_FLD_MAP` VALUES (-168,'imageUrl',-103,-1);
INSERT INTO `BLC_SC_FLD_MAP` VALUES (-167,'targetUrl',-140,-13);
INSERT INTO `BLC_SC_FLD_MAP` VALUES (-166,'imageUrl',-140,-12);
INSERT INTO `BLC_SC_FLD_MAP` VALUES (-165,'messageText',-130,-11);
INSERT INTO `BLC_SC_FLD_MAP` VALUES (-164,'htmlContent',-110,-9);
INSERT INTO `BLC_SC_FLD_MAP` VALUES (-163,'targetUrl',-102,-6);
INSERT INTO `BLC_SC_FLD_MAP` VALUES (-162,'imageUrl',-102,-5);
INSERT INTO `BLC_SC_FLD_MAP` VALUES (-161,'targetUrl',-101,-4);
INSERT INTO `BLC_SC_FLD_MAP` VALUES (-160,'imageUrl',-101,-3);
INSERT INTO `BLC_SC_FLD_MAP` VALUES (-159,'targetUrl',-100,-2);
INSERT INTO `BLC_SC_FLD_MAP` VALUES (-158,'imageUrl',-100,-1);
INSERT INTO `BLC_SC_FLD_MAP` VALUES (-157,'messageText',156,58);
INSERT INTO `BLC_SC_FLD_MAP` VALUES (-156,'messageText',155,57);
INSERT INTO `BLC_SC_FLD_MAP` VALUES (-155,'htmlContent',154,56);
INSERT INTO `BLC_SC_FLD_MAP` VALUES (-154,'htmlContent',153,55);
INSERT INTO `BLC_SC_FLD_MAP` VALUES (-153,'targetUrl',152,54);
INSERT INTO `BLC_SC_FLD_MAP` VALUES (-152,'imageUrl',152,53);
INSERT INTO `BLC_SC_FLD_MAP` VALUES (-151,'targetUrl',151,52);
INSERT INTO `BLC_SC_FLD_MAP` VALUES (-150,'imageUrl',151,51);
/*!40000 ALTER TABLE `BLC_SC_FLD_MAP` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `BLC_SC_FLD_TMPLT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BLC_SC_FLD_TMPLT` (
  `SC_FLD_TMPLT_ID` bigint(20) NOT NULL,
  `NAME` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`SC_FLD_TMPLT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `BLC_SC_FLD_TMPLT` WRITE;
/*!40000 ALTER TABLE `BLC_SC_FLD_TMPLT` DISABLE KEYS */;
INSERT INTO `BLC_SC_FLD_TMPLT` VALUES (-3,'Message Template');
INSERT INTO `BLC_SC_FLD_TMPLT` VALUES (-2,'HTML Template');
INSERT INTO `BLC_SC_FLD_TMPLT` VALUES (-1,'Ad Template');
/*!40000 ALTER TABLE `BLC_SC_FLD_TMPLT` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `BLC_SC_ITEM_CRITERIA`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BLC_SC_ITEM_CRITERIA` (
  `SC_ITEM_CRITERIA_ID` bigint(20) NOT NULL,
  `ORDER_ITEM_MATCH_RULE` longtext,
  `QUANTITY` int(11) NOT NULL,
  `SC_ID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`SC_ITEM_CRITERIA_ID`),
  KEY `FKi62rdb9fuxn6lfdo7d4q9haow` (`SC_ID`),
  CONSTRAINT `FKi62rdb9fuxn6lfdo7d4q9haow` FOREIGN KEY (`SC_ID`) REFERENCES `BLC_SC` (`SC_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `BLC_SC_ITEM_CRITERIA` WRITE;
/*!40000 ALTER TABLE `BLC_SC_ITEM_CRITERIA` DISABLE KEYS */;
/*!40000 ALTER TABLE `BLC_SC_ITEM_CRITERIA` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `BLC_SC_RULE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BLC_SC_RULE` (
  `SC_RULE_ID` bigint(20) NOT NULL,
  `MATCH_RULE` longtext,
  PRIMARY KEY (`SC_RULE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `BLC_SC_RULE` WRITE;
/*!40000 ALTER TABLE `BLC_SC_RULE` DISABLE KEYS */;
/*!40000 ALTER TABLE `BLC_SC_RULE` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `BLC_SC_RULE_MAP`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BLC_SC_RULE_MAP` (
  `BLC_SC_SC_ID` bigint(20) NOT NULL,
  `SC_RULE_ID` bigint(20) NOT NULL,
  `MAP_KEY` varchar(255) NOT NULL,
  PRIMARY KEY (`BLC_SC_SC_ID`,`MAP_KEY`),
  KEY `FK31d3qpemphv6qdbha0cl1x361` (`SC_RULE_ID`),
  CONSTRAINT `FK31d3qpemphv6qdbha0cl1x361` FOREIGN KEY (`SC_RULE_ID`) REFERENCES `BLC_SC_RULE` (`SC_RULE_ID`),
  CONSTRAINT `FKo4q8t9hx8iprk9bc9tllwhdhk` FOREIGN KEY (`BLC_SC_SC_ID`) REFERENCES `BLC_SC` (`SC_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `BLC_SC_RULE_MAP` WRITE;
/*!40000 ALTER TABLE `BLC_SC_RULE_MAP` DISABLE KEYS */;
/*!40000 ALTER TABLE `BLC_SC_RULE_MAP` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `BLC_SC_TYPE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BLC_SC_TYPE` (
  `SC_TYPE_ID` bigint(20) NOT NULL,
  `DESCRIPTION` varchar(255) DEFAULT NULL,
  `NAME` varchar(255) DEFAULT NULL,
  `SC_FLD_TMPLT_ID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`SC_TYPE_ID`),
  KEY `SC_TYPE_NAME_INDEX` (`NAME`),
  KEY `FKh7idqa2kh7vusepjor3bc80b3` (`SC_FLD_TMPLT_ID`),
  CONSTRAINT `FKh7idqa2kh7vusepjor3bc80b3` FOREIGN KEY (`SC_FLD_TMPLT_ID`) REFERENCES `BLC_SC_FLD_TMPLT` (`SC_FLD_TMPLT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `BLC_SC_TYPE` WRITE;
/*!40000 ALTER TABLE `BLC_SC_TYPE` DISABLE KEYS */;
INSERT INTO `BLC_SC_TYPE` VALUES (1,NULL,'Homepage Banner Ad',-1);
INSERT INTO `BLC_SC_TYPE` VALUES (2,NULL,'Homepage Middle Promo Snippet',-2);
INSERT INTO `BLC_SC_TYPE` VALUES (3,NULL,'Homepage Featured Products Title',-3);
INSERT INTO `BLC_SC_TYPE` VALUES (4,NULL,'Right Hand Side Banner Ad',-1);
/*!40000 ALTER TABLE `BLC_SC_TYPE` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `BLC_SEARCH_FACET`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BLC_SEARCH_FACET` (
  `SEARCH_FACET_ID` bigint(20) NOT NULL,
  `MULTISELECT` bit(1) DEFAULT NULL,
  `LABEL` varchar(255) DEFAULT NULL,
  `NAME` varchar(255) DEFAULT NULL,
  `REQUIRES_ALL_DEPENDENT` bit(1) DEFAULT NULL,
  `SEARCH_DISPLAY_PRIORITY` int(11) DEFAULT NULL,
  `SHOW_ON_SEARCH` bit(1) DEFAULT NULL,
  `USE_FACET_RANGES` bit(1) DEFAULT NULL,
  `INDEX_FIELD_TYPE_ID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`SEARCH_FACET_ID`),
  KEY `FKrrhp7pwx3bjh2rhadrtv2ro81` (`INDEX_FIELD_TYPE_ID`),
  CONSTRAINT `FKrrhp7pwx3bjh2rhadrtv2ro81` FOREIGN KEY (`INDEX_FIELD_TYPE_ID`) REFERENCES `BLC_INDEX_FIELD_TYPE` (`INDEX_FIELD_TYPE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `BLC_SEARCH_FACET` WRITE;
/*!40000 ALTER TABLE `BLC_SEARCH_FACET` DISABLE KEYS */;
INSERT INTO `BLC_SEARCH_FACET` VALUES (1,_binary '','Manufacturer','Manufacturer Facet',NULL,0,_binary '',_binary '\0',2);
INSERT INTO `BLC_SEARCH_FACET` VALUES (2,_binary '','Heat Range','Heat Range Facet',NULL,0,_binary '\0',_binary '\0',3);
INSERT INTO `BLC_SEARCH_FACET` VALUES (3,_binary '','Price','Price Facet',NULL,1,_binary '',_binary '',4);
INSERT INTO `BLC_SEARCH_FACET` VALUES (4,_binary '','Color','Color Facet',NULL,0,_binary '',_binary '\0',9);
/*!40000 ALTER TABLE `BLC_SEARCH_FACET` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `BLC_SEARCH_FACET_RANGE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BLC_SEARCH_FACET_RANGE` (
  `SEARCH_FACET_RANGE_ID` bigint(20) NOT NULL,
  `MAX_VALUE` decimal(19,5) DEFAULT NULL,
  `MIN_VALUE` decimal(19,5) NOT NULL,
  `SEARCH_FACET_ID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`SEARCH_FACET_RANGE_ID`),
  KEY `SEARCH_FACET_INDEX` (`SEARCH_FACET_ID`),
  CONSTRAINT `FKm1k6kfkc59c8jdx51qym3tcai` FOREIGN KEY (`SEARCH_FACET_ID`) REFERENCES `BLC_SEARCH_FACET` (`SEARCH_FACET_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `BLC_SEARCH_FACET_RANGE` WRITE;
/*!40000 ALTER TABLE `BLC_SEARCH_FACET_RANGE` DISABLE KEYS */;
INSERT INTO `BLC_SEARCH_FACET_RANGE` VALUES (1,5.00000,0.00000,3);
INSERT INTO `BLC_SEARCH_FACET_RANGE` VALUES (2,10.00000,5.00000,3);
INSERT INTO `BLC_SEARCH_FACET_RANGE` VALUES (3,15.00000,10.00000,3);
INSERT INTO `BLC_SEARCH_FACET_RANGE` VALUES (4,NULL,15.00000,3);
/*!40000 ALTER TABLE `BLC_SEARCH_FACET_RANGE` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `BLC_SEARCH_FACET_XREF`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BLC_SEARCH_FACET_XREF` (
  `ID` bigint(20) NOT NULL,
  `REQUIRED_FACET_ID` bigint(20) NOT NULL,
  `SEARCH_FACET_ID` bigint(20) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK4xpicfgot9h1utp316cbi8268` (`REQUIRED_FACET_ID`),
  KEY `FKtdvsplwk8dl6mnb0p7fdyte13` (`SEARCH_FACET_ID`),
  CONSTRAINT `FK4xpicfgot9h1utp316cbi8268` FOREIGN KEY (`REQUIRED_FACET_ID`) REFERENCES `BLC_SEARCH_FACET` (`SEARCH_FACET_ID`),
  CONSTRAINT `FKtdvsplwk8dl6mnb0p7fdyte13` FOREIGN KEY (`SEARCH_FACET_ID`) REFERENCES `BLC_SEARCH_FACET` (`SEARCH_FACET_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `BLC_SEARCH_FACET_XREF` WRITE;
/*!40000 ALTER TABLE `BLC_SEARCH_FACET_XREF` DISABLE KEYS */;
/*!40000 ALTER TABLE `BLC_SEARCH_FACET_XREF` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `BLC_SEARCH_INTERCEPT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BLC_SEARCH_INTERCEPT` (
  `SEARCH_REDIRECT_ID` bigint(20) NOT NULL,
  `ACTIVE_END_DATE` datetime DEFAULT NULL,
  `ACTIVE_START_DATE` datetime DEFAULT NULL,
  `PRIORITY` int(11) DEFAULT NULL,
  `SEARCH_TERM` varchar(255) NOT NULL,
  `URL` varchar(255) NOT NULL,
  PRIMARY KEY (`SEARCH_REDIRECT_ID`),
  KEY `SEARCH_ACTIVE_INDEX` (`ACTIVE_END_DATE`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `BLC_SEARCH_INTERCEPT` WRITE;
/*!40000 ALTER TABLE `BLC_SEARCH_INTERCEPT` DISABLE KEYS */;
INSERT INTO `BLC_SEARCH_INTERCEPT` VALUES (-2,NULL,'1992-10-15 14:28:36',-10,'sale','/clearance');
INSERT INTO `BLC_SEARCH_INTERCEPT` VALUES (-1,NULL,'1992-10-15 14:28:36',1,'insanity','/hot-sauces/insanity_sauce');
/*!40000 ALTER TABLE `BLC_SEARCH_INTERCEPT` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `BLC_SEARCH_SYNONYM`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BLC_SEARCH_SYNONYM` (
  `SEARCH_SYNONYM_ID` bigint(20) NOT NULL,
  `SYNONYMS` varchar(255) DEFAULT NULL,
  `TERM` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`SEARCH_SYNONYM_ID`),
  KEY `SEARCHSYNONYM_TERM_INDEX` (`TERM`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `BLC_SEARCH_SYNONYM` WRITE;
/*!40000 ALTER TABLE `BLC_SEARCH_SYNONYM` DISABLE KEYS */;
/*!40000 ALTER TABLE `BLC_SEARCH_SYNONYM` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `BLC_SHIPPING_RATE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BLC_SHIPPING_RATE` (
  `ID` bigint(20) NOT NULL,
  `BAND_RESULT_PCT` int(11) NOT NULL,
  `BAND_RESULT_QTY` decimal(19,2) NOT NULL,
  `BAND_UNIT_QTY` decimal(19,2) NOT NULL,
  `FEE_BAND` int(11) NOT NULL,
  `FEE_SUB_TYPE` varchar(255) DEFAULT NULL,
  `FEE_TYPE` varchar(255) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `SHIPPINGRATE_FEESUB_INDEX` (`FEE_SUB_TYPE`),
  KEY `SHIPPINGRATE_FEE_INDEX` (`FEE_TYPE`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `BLC_SHIPPING_RATE` WRITE;
/*!40000 ALTER TABLE `BLC_SHIPPING_RATE` DISABLE KEYS */;
/*!40000 ALTER TABLE `BLC_SHIPPING_RATE` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `BLC_SITE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BLC_SITE` (
  `SITE_ID` bigint(20) NOT NULL,
  `ARCHIVED` char(1) DEFAULT NULL,
  `DEACTIVATED` bit(1) DEFAULT NULL,
  `NAME` varchar(255) DEFAULT NULL,
  `SITE_IDENTIFIER_TYPE` varchar(255) DEFAULT NULL,
  `SITE_IDENTIFIER_VALUE` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`SITE_ID`),
  KEY `BLC_SITE_ID_VAL_INDEX` (`SITE_IDENTIFIER_VALUE`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `BLC_SITE` WRITE;
/*!40000 ALTER TABLE `BLC_SITE` DISABLE KEYS */;
/*!40000 ALTER TABLE `BLC_SITE` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `BLC_SITE_CATALOG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BLC_SITE_CATALOG` (
  `SITE_CATALOG_XREF_ID` bigint(20) NOT NULL,
  `CATALOG_ID` bigint(20) NOT NULL,
  `SITE_ID` bigint(20) NOT NULL,
  PRIMARY KEY (`SITE_CATALOG_XREF_ID`),
  KEY `FKho5bxxfvt21ijan47er38vnyu` (`CATALOG_ID`),
  KEY `FKmktxeb1okchyhs2mxat1nk6s5` (`SITE_ID`),
  CONSTRAINT `FKho5bxxfvt21ijan47er38vnyu` FOREIGN KEY (`CATALOG_ID`) REFERENCES `BLC_CATALOG` (`CATALOG_ID`),
  CONSTRAINT `FKmktxeb1okchyhs2mxat1nk6s5` FOREIGN KEY (`SITE_ID`) REFERENCES `BLC_SITE` (`SITE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `BLC_SITE_CATALOG` WRITE;
/*!40000 ALTER TABLE `BLC_SITE_CATALOG` DISABLE KEYS */;
/*!40000 ALTER TABLE `BLC_SITE_CATALOG` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `BLC_SITE_MAP_CFG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BLC_SITE_MAP_CFG` (
  `INDEXED_SITE_MAP_FILE_NAME` varchar(255) DEFAULT NULL,
  `INDEXED_SITE_MAP_FILE_PATTERN` varchar(255) DEFAULT NULL,
  `MAX_URL_ENTRIES_PER_FILE` int(11) DEFAULT NULL,
  `SITE_MAP_FILE_NAME` varchar(255) DEFAULT NULL,
  `MODULE_CONFIG_ID` bigint(20) NOT NULL,
  PRIMARY KEY (`MODULE_CONFIG_ID`),
  CONSTRAINT `FKdskgdyr42vk7c8g92bxir3wej` FOREIGN KEY (`MODULE_CONFIG_ID`) REFERENCES `BLC_MODULE_CONFIGURATION` (`MODULE_CONFIG_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `BLC_SITE_MAP_CFG` WRITE;
/*!40000 ALTER TABLE `BLC_SITE_MAP_CFG` DISABLE KEYS */;
INSERT INTO `BLC_SITE_MAP_CFG` VALUES (NULL,NULL,NULL,NULL,-1);
/*!40000 ALTER TABLE `BLC_SITE_MAP_CFG` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `BLC_SITE_MAP_GEN_CFG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BLC_SITE_MAP_GEN_CFG` (
  `GEN_CONFIG_ID` bigint(20) NOT NULL,
  `CHANGE_FREQ` varchar(255) NOT NULL,
  `DISABLED` bit(1) NOT NULL,
  `GENERATOR_TYPE` varchar(255) NOT NULL,
  `PRIORITY` varchar(255) DEFAULT NULL,
  `MODULE_CONFIG_ID` bigint(20) NOT NULL,
  PRIMARY KEY (`GEN_CONFIG_ID`),
  KEY `FKmw4fb38sdenx8kjrxg5v8mjei` (`MODULE_CONFIG_ID`),
  CONSTRAINT `FKmw4fb38sdenx8kjrxg5v8mjei` FOREIGN KEY (`MODULE_CONFIG_ID`) REFERENCES `BLC_SITE_MAP_CFG` (`MODULE_CONFIG_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `BLC_SITE_MAP_GEN_CFG` WRITE;
/*!40000 ALTER TABLE `BLC_SITE_MAP_GEN_CFG` DISABLE KEYS */;
INSERT INTO `BLC_SITE_MAP_GEN_CFG` VALUES (-8,'HOURLY',_binary '','SKU','0.5',-1);
INSERT INTO `BLC_SITE_MAP_GEN_CFG` VALUES (-7,'HOURLY',_binary '\0','CATEGORY','0.5',-1);
INSERT INTO `BLC_SITE_MAP_GEN_CFG` VALUES (-6,'HOURLY',_binary '\0','CATEGORY','0.5',-1);
INSERT INTO `BLC_SITE_MAP_GEN_CFG` VALUES (-5,'HOURLY',_binary '\0','CATEGORY','0.5',-1);
INSERT INTO `BLC_SITE_MAP_GEN_CFG` VALUES (-4,'HOURLY',_binary '\0','CATEGORY','0.5',-1);
INSERT INTO `BLC_SITE_MAP_GEN_CFG` VALUES (-3,'HOURLY',_binary '\0','PAGE','0.5',-1);
INSERT INTO `BLC_SITE_MAP_GEN_CFG` VALUES (-2,'HOURLY',_binary '\0','PRODUCT','0.5',-1);
INSERT INTO `BLC_SITE_MAP_GEN_CFG` VALUES (-1,'HOURLY',_binary '\0','CUSTOM','0.5',-1);
/*!40000 ALTER TABLE `BLC_SITE_MAP_GEN_CFG` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `BLC_SITE_MAP_URL_ENTRY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BLC_SITE_MAP_URL_ENTRY` (
  `URL_ENTRY_ID` bigint(20) NOT NULL,
  `CHANGE_FREQ` varchar(255) NOT NULL,
  `LAST_MODIFIED` datetime NOT NULL,
  `LOCATION` varchar(255) NOT NULL,
  `PRIORITY` varchar(255) NOT NULL,
  `GEN_CONFIG_ID` bigint(20) NOT NULL,
  PRIMARY KEY (`URL_ENTRY_ID`),
  KEY `FKrvkeinfysjshg9ulmxno9rhla` (`GEN_CONFIG_ID`),
  CONSTRAINT `FKrvkeinfysjshg9ulmxno9rhla` FOREIGN KEY (`GEN_CONFIG_ID`) REFERENCES `BLC_CUST_SITE_MAP_GEN_CFG` (`GEN_CONFIG_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `BLC_SITE_MAP_URL_ENTRY` WRITE;
/*!40000 ALTER TABLE `BLC_SITE_MAP_URL_ENTRY` DISABLE KEYS */;
/*!40000 ALTER TABLE `BLC_SITE_MAP_URL_ENTRY` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `BLC_SKU`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BLC_SKU` (
  `SKU_ID` bigint(20) NOT NULL,
  `ACTIVE_END_DATE` datetime DEFAULT NULL,
  `ACTIVE_START_DATE` datetime DEFAULT NULL,
  `AVAILABLE_FLAG` char(1) DEFAULT NULL,
  `COST` decimal(19,5) DEFAULT NULL,
  `DESCRIPTION` varchar(255) DEFAULT NULL,
  `CONTAINER_SHAPE` varchar(255) DEFAULT NULL,
  `DEPTH` decimal(19,2) DEFAULT NULL,
  `DIMENSION_UNIT_OF_MEASURE` varchar(255) DEFAULT NULL,
  `GIRTH` decimal(19,2) DEFAULT NULL,
  `HEIGHT` decimal(19,2) DEFAULT NULL,
  `CONTAINER_SIZE` varchar(255) DEFAULT NULL,
  `WIDTH` decimal(19,2) DEFAULT NULL,
  `DISCOUNTABLE_FLAG` char(1) DEFAULT NULL,
  `DISPLAY_TEMPLATE` varchar(255) DEFAULT NULL,
  `EXTERNAL_ID` varchar(255) DEFAULT NULL,
  `FULFILLMENT_TYPE` varchar(255) DEFAULT NULL,
  `INVENTORY_TYPE` varchar(255) DEFAULT NULL,
  `IS_MACHINE_SORTABLE` bit(1) DEFAULT NULL,
  `LONG_DESCRIPTION` longtext,
  `NAME` varchar(255) DEFAULT NULL,
  `QUANTITY_AVAILABLE` int(11) DEFAULT NULL,
  `RETAIL_PRICE` decimal(19,5) DEFAULT NULL,
  `SALE_PRICE` decimal(19,5) DEFAULT NULL,
  `TAX_CODE` varchar(255) DEFAULT NULL,
  `TAXABLE_FLAG` char(1) DEFAULT NULL,
  `UPC` varchar(255) DEFAULT NULL,
  `URL_KEY` varchar(255) DEFAULT NULL,
  `WEIGHT` decimal(19,2) DEFAULT NULL,
  `WEIGHT_UNIT_OF_MEASURE` varchar(255) DEFAULT NULL,
  `CURRENCY_CODE` varchar(255) DEFAULT NULL,
  `DEFAULT_PRODUCT_ID` bigint(20) DEFAULT NULL,
  `ADDL_PRODUCT_ID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`SKU_ID`),
  KEY `SKU_ACTIVE_END_INDEX` (`ACTIVE_END_DATE`),
  KEY `SKU_ACTIVE_START_INDEX` (`ACTIVE_START_DATE`),
  KEY `SKU_AVAILABLE_INDEX` (`AVAILABLE_FLAG`),
  KEY `SKU_DISCOUNTABLE_INDEX` (`DISCOUNTABLE_FLAG`),
  KEY `SKU_EXTERNAL_ID_INDEX` (`EXTERNAL_ID`),
  KEY `SKU_NAME_INDEX` (`NAME`),
  KEY `SKU_TAXABLE_INDEX` (`TAXABLE_FLAG`),
  KEY `SKU_UPC_INDEX` (`UPC`),
  KEY `SKU_URL_KEY_INDEX` (`URL_KEY`),
  KEY `FKdowfc15iv11csxhs4itbfbowh` (`CURRENCY_CODE`),
  KEY `FK9akww2wqlf0xt7rvupxtv193c` (`DEFAULT_PRODUCT_ID`),
  KEY `FKseqmjfh1kdphq3eeplsuf6nj4` (`ADDL_PRODUCT_ID`),
  CONSTRAINT `FK9akww2wqlf0xt7rvupxtv193c` FOREIGN KEY (`DEFAULT_PRODUCT_ID`) REFERENCES `BLC_PRODUCT` (`PRODUCT_ID`),
  CONSTRAINT `FKdowfc15iv11csxhs4itbfbowh` FOREIGN KEY (`CURRENCY_CODE`) REFERENCES `BLC_CURRENCY` (`CURRENCY_CODE`),
  CONSTRAINT `FKseqmjfh1kdphq3eeplsuf6nj4` FOREIGN KEY (`ADDL_PRODUCT_ID`) REFERENCES `BLC_PRODUCT` (`PRODUCT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `BLC_SKU` WRITE;
/*!40000 ALTER TABLE `BLC_SKU` DISABLE KEYS */;
INSERT INTO `BLC_SKU` VALUES (1,NULL,'2020-08-16 20:10:51',NULL,3.89000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,'CHECK_QUANTITY',NULL,'As my Chilipals know, I am never one to be satisfied. Hence, the creation of Sudden Death. When you need to go beyond... Sudden Death will deliver! ','Sudden Death Sauce',10000,10.99000,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,1,NULL);
INSERT INTO `BLC_SKU` VALUES (2,NULL,'2020-08-16 20:10:51',NULL,3.79000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,'CHECK_QUANTITY',NULL,'The perfect topper for chicken, fish, burgers or pizza. A great blend of Habanero, Mango, Passion Fruit and more make this Death Sauce an amazing tropical treat.','Sweet Death Sauce',10000,10.99000,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,2,NULL);
INSERT INTO `BLC_SKU` VALUES (3,NULL,'2020-08-16 20:10:51',NULL,3.00000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,'Tangy, ripe cayenne peppes flow together with garlic, onion, tomato paste and a hint of cane sugar to make this a smooth sauce with a bite.  Wonderful on eggs, poultry, pork, or fish, this sauce blends to make rich marinades and soups.','Hoppin\' Hot Sauce',NULL,4.99000,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,3,NULL);
INSERT INTO `BLC_SKU` VALUES (4,NULL,'2020-08-16 20:10:51',NULL,4.50000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,'When any pepper is dried and smoked, it is referred to as a Chipotle. Usually with a wrinkled, drak brown appearance, the Chipotle delivers a smokey, sweet flavor which is generally used for adding a smokey, roasted flavor to salsas, stews and marinades.','Day of the Dead Chipotle Hot Sauce',NULL,6.99000,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,4,NULL);
INSERT INTO `BLC_SKU` VALUES (5,NULL,'2020-08-16 20:10:51',NULL,5.50000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,'If you want hot, this is the chile to choose. Native to the Carribean, Yucatan and Northern Coast of South America, the Habanero presents itself in a variety of colors ranging from light green to a bright red. The Habanero\'s bold heat, unique flavor and aroma has made it the favorite of chile lovers.','Day of the Dead Habanero Hot Sauce',NULL,6.99000,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,5,NULL);
INSERT INTO `BLC_SKU` VALUES (6,NULL,'2020-08-16 20:10:51',NULL,5.40000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,'Often mistaken for the Habanero, the Scotch Bonnet has a deeply inverted tip as opposed to the pointed end of the Habanero. Ranging in many colors from green to yellow-orange, the Scotch Bonnet is a staple in West Indies and Barbados style pepper sauces.','Day of the Dead Scotch Bonnet Hot Sauce',NULL,6.99000,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,6,NULL);
INSERT INTO `BLC_SKU` VALUES (7,NULL,'2020-08-16 20:10:51',NULL,8.10000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,'Made with Naga Bhut Jolokia, the World\'s Hottest pepper.','Green Ghost',NULL,11.99000,9.99000,NULL,'Y',NULL,NULL,NULL,NULL,NULL,7,NULL);
INSERT INTO `BLC_SKU` VALUES (8,NULL,'2020-08-16 20:10:51',NULL,3.00000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,'You bet your boots, this hot sauce earned its name from folks that appreciate an outstanding hot sauce. What you\'ll find here is a truly original zesty flavor, not an overpowering pungency that is found in those ordinary Tabasco pepper sauces - even though the pepper used in this product was tested at 285,000 Scoville units. So, saddle up for a ride to remember. To make sure we brought you only the finest Habanero pepper sauce, we went to the foothills of the Mayan mountains in Belize, Central America. This product is prepared entirely by hand using only fresh vegetables and all natural ingredients.','Blazin\' Saddle XXX Hot Habanero Pepper Sauce',NULL,4.99000,3.99000,NULL,'Y',NULL,NULL,NULL,NULL,NULL,8,NULL);
INSERT INTO `BLC_SKU` VALUES (9,NULL,'2020-08-16 20:10:51',NULL,5.30000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,'All Hell is breaking loose, fire &amp; brimstone rain down? prepare to meet your maker.','Armageddon The Hot Sauce To End All',NULL,12.99000,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,9,NULL);
INSERT INTO `BLC_SKU` VALUES (10,NULL,'2020-08-16 20:10:51',NULL,6.89000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,'Here is the Prescription for those who enjoy intolerable heat. Dr. Chilemeister\'s sick and evil deadly brew should be used with caution. Pain can become addictive!','Dr. Chilemeister\'s Insane Hot Sauce',NULL,12.99000,10.99000,NULL,'Y',NULL,NULL,NULL,NULL,NULL,10,NULL);
INSERT INTO `BLC_SKU` VALUES (11,NULL,'2020-08-16 20:10:51',NULL,2.29000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,'Been there, roped that. Hotter than a buckin\' mare in heat! Sprinkle on meat entrees, seafood and vegetables. Use as additive in barbecue sauce or any food that needs a spicy flavor. Start with a few drops and work up to the desired flavor.','Bull Snort Cowboy Cayenne Pepper Hot Sauce',NULL,3.99000,2.99000,NULL,'Y',NULL,NULL,NULL,NULL,NULL,11,NULL);
INSERT INTO `BLC_SKU` VALUES (12,NULL,'2020-08-16 20:10:51',NULL,3.09000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,'One of the more unusual sauces we sell. The original was an old style Cajun sauce and this is it\'s updated blackening version. It\'s sweet but you get a great hit of cinnamon and cloves with a nice kick of cayenne heat. Use on all foods to give that Cajun flair!','Cafe Louisiane Sweet Cajun Blackening Sauce',NULL,4.99000,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,12,NULL);
INSERT INTO `BLC_SKU` VALUES (13,NULL,'2020-08-16 20:10:51',NULL,2.99000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,'Everything is bigger in Texas, even the burn of a Bull Snortin\' Hot Sauce! shower on that Texas sized steak they call the Ole 96er or your plane Jane vegetables. If you are a fan on making BBQ sauce from scratch like I am, you can use Bull Snort Smokin\' Tonsils Hot Sauce as an additive. Red hot habaneros and cayenne peppers give this tonsil tingler it\'s famous flavor and red hot heat. Bull Snort Smokin\' Tonsils Hot Sauce\'ll have your bowels buckin\' with just a drop!','Bull Snort Smokin\' Toncils Hot Sauce',NULL,3.99000,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,13,NULL);
INSERT INTO `BLC_SKU` VALUES (14,NULL,'2020-08-16 20:10:51',NULL,3.99000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,'This sauce gets its great flavor from aged peppers and cane vinegar. It will enhance the flavor of most any meal.','Cool Cayenne Pepper Hot Sauce',NULL,5.99000,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,14,NULL);
INSERT INTO `BLC_SKU` VALUES (15,NULL,'2020-08-16 20:10:51',NULL,4.29000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,'This sauce gets its great flavor from aged peppers and cane vinegar. It will enhance the flavor of most any meal.','Roasted Garlic Hot Sauce',NULL,5.99000,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,15,NULL);
INSERT INTO `BLC_SKU` VALUES (16,NULL,'2020-08-16 20:10:51',NULL,2.89000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,'This sauce gets its great flavor from aged peppers and cane vinegar. It will enhance the flavor of most any meal.','Scotch Bonnet Hot Sauce',NULL,5.99000,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,16,NULL);
INSERT INTO `BLC_SKU` VALUES (17,NULL,'2020-08-16 20:10:51',NULL,3.50000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,'This sauce gets its great flavor from aged peppers and cane vinegar. It will enhance the flavor of most any meal.','Insanity Sauce',NULL,5.99000,4.99000,NULL,'Y',NULL,NULL,NULL,NULL,NULL,17,NULL);
INSERT INTO `BLC_SKU` VALUES (18,NULL,'2020-08-16 20:10:51',NULL,3.25000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,'This sauce gets its great flavor from aged peppers and cane vinegar. It will enhance the flavor of most any meal.','Hurtin\' Jalapeno Hot Sauce',NULL,5.99000,4.49000,NULL,'Y',NULL,NULL,NULL,NULL,NULL,18,NULL);
INSERT INTO `BLC_SKU` VALUES (19,NULL,'2020-08-16 20:10:51',NULL,2.59000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,'This sauce gets its great flavor from aged peppers and cane vinegar. It will enhance the flavor of most any meal.','Roasted Red Pepper & Chipotle Hot Sauce',NULL,5.99000,4.09000,NULL,'Y',NULL,NULL,NULL,NULL,NULL,19,NULL);
INSERT INTO `BLC_SKU` VALUES (100,NULL,'2020-08-16 20:10:51',NULL,4.99000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,'Men\'s Habanero collection standard short sleeve screen-printed tee shirt in soft 30 singles cotton in regular fit.','Hawt Like a Habanero Shirt (Men\'s)',NULL,14.99000,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,100,NULL);
INSERT INTO `BLC_SKU` VALUES (111,NULL,'2020-08-16 20:10:51',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,'Men\'s Habanero collection standard short sleeve screen-printed tee shirt in soft 30 singles cotton in regular fit.','Hawt Like a Habanero Shirt (Men\'s)',NULL,14.99000,NULL,NULL,'Y',NULL,'/black_s',NULL,NULL,NULL,NULL,100);
INSERT INTO `BLC_SKU` VALUES (112,NULL,'2020-08-16 20:10:51',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,'Men\'s Habanero collection standard short sleeve screen-printed tee shirt in soft 30 singles cotton in regular fit.','Hawt Like a Habanero Shirt (Men\'s)',NULL,14.99000,NULL,NULL,'Y',NULL,'/black_m',NULL,NULL,NULL,NULL,100);
INSERT INTO `BLC_SKU` VALUES (113,NULL,'2020-08-16 20:10:51',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,'Men\'s Habanero collection standard short sleeve screen-printed tee shirt in soft 30 singles cotton in regular fit.','Hawt Like a Habanero Shirt (Men\'s)',NULL,14.99000,NULL,NULL,'Y',NULL,'/black_l',NULL,NULL,NULL,NULL,100);
INSERT INTO `BLC_SKU` VALUES (114,NULL,'2020-08-16 20:10:51',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,'Men\'s Habanero collection standard short sleeve screen-printed tee shirt in soft 30 singles cotton in regular fit.','Hawt Like a Habanero Shirt (Men\'s)',NULL,16.99000,NULL,NULL,'Y',NULL,'/black_xl',NULL,NULL,NULL,NULL,100);
INSERT INTO `BLC_SKU` VALUES (121,NULL,'2020-08-16 20:10:51',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,'Men\'s Habanero collection standard short sleeve screen-printed tee shirt in soft 30 singles cotton in regular fit.','Hawt Like a Habanero Shirt (Men\'s)',NULL,14.99000,NULL,NULL,'Y',NULL,'/red_s',NULL,NULL,NULL,NULL,100);
INSERT INTO `BLC_SKU` VALUES (122,NULL,'2020-08-16 20:10:51',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,'Men\'s Habanero collection standard short sleeve screen-printed tee shirt in soft 30 singles cotton in regular fit.','Hawt Like a Habanero Shirt (Men\'s)',NULL,14.99000,NULL,NULL,'Y',NULL,'/red_m',NULL,NULL,NULL,NULL,100);
INSERT INTO `BLC_SKU` VALUES (123,NULL,'2020-08-16 20:10:51',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,'Men\'s Habanero collection standard short sleeve screen-printed tee shirt in soft 30 singles cotton in regular fit.','Hawt Like a Habanero Shirt (Men\'s)',NULL,14.99000,NULL,NULL,'Y',NULL,'/red_l',NULL,NULL,NULL,NULL,100);
INSERT INTO `BLC_SKU` VALUES (124,NULL,'2020-08-16 20:10:51',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,'Men\'s Habanero collection standard short sleeve screen-printed tee shirt in soft 30 singles cotton in regular fit.','Hawt Like a Habanero Shirt (Men\'s)',NULL,16.99000,NULL,NULL,'Y',NULL,'/red_xl',NULL,NULL,NULL,NULL,100);
INSERT INTO `BLC_SKU` VALUES (131,NULL,'2020-08-16 20:10:51',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,'Men\'s Habanero collection standard short sleeve screen-printed tee shirt in soft 30 singles cotton in regular fit.','Hawt Like a Habanero Shirt (Men\'s)',NULL,14.99000,NULL,NULL,'Y',NULL,'/silver_s',NULL,NULL,NULL,NULL,100);
INSERT INTO `BLC_SKU` VALUES (132,NULL,'2020-08-16 20:10:51',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,'Men\'s Habanero collection standard short sleeve screen-printed tee shirt in soft 30 singles cotton in regular fit.','Hawt Like a Habanero Shirt (Men\'s)',NULL,14.99000,NULL,NULL,'Y',NULL,'/silver_m',NULL,NULL,NULL,NULL,100);
INSERT INTO `BLC_SKU` VALUES (133,NULL,'2020-08-16 20:10:51',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,'Men\'s Habanero collection standard short sleeve screen-printed tee shirt in soft 30 singles cotton in regular fit.','Hawt Like a Habanero Shirt (Men\'s)',NULL,14.99000,NULL,NULL,'Y',NULL,'/silver_l',NULL,NULL,NULL,NULL,100);
INSERT INTO `BLC_SKU` VALUES (134,NULL,'2020-08-16 20:10:51',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,'Men\'s Habanero collection standard short sleeve screen-printed tee shirt in soft 30 singles cotton in regular fit.','Hawt Like a Habanero Shirt (Men\'s)',NULL,16.99000,NULL,NULL,'Y',NULL,'/silver_xl',NULL,NULL,NULL,NULL,100);
INSERT INTO `BLC_SKU` VALUES (200,NULL,'2020-08-16 20:10:51',NULL,4.69000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,'Women\'s Habanero collection standard short sleeve screen-printed tee shirt in soft 30 singles cotton in regular fit.','Hawt Like a Habanero Shirt (Women\'s)',NULL,14.99000,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,200,NULL);
INSERT INTO `BLC_SKU` VALUES (211,NULL,'2020-08-16 20:10:51',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,'Women\'s Habanero collection standard short sleeve screen-printed tee shirt in soft 30 singles cotton in regular fit.','Hawt Like a Habanero Shirt (Women\'s)',NULL,14.99000,NULL,NULL,'Y',NULL,'/black_s',NULL,NULL,NULL,NULL,200);
INSERT INTO `BLC_SKU` VALUES (212,NULL,'2020-08-16 20:10:51',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,'Women\'s Habanero collection standard short sleeve screen-printed tee shirt in soft 30 singles cotton in regular fit.','Hawt Like a Habanero Shirt (Women\'s)',NULL,14.99000,NULL,NULL,'Y',NULL,'/black_m',NULL,NULL,NULL,NULL,200);
INSERT INTO `BLC_SKU` VALUES (213,NULL,'2020-08-16 20:10:51',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,'Women\'s Habanero collection standard short sleeve screen-printed tee shirt in soft 30 singles cotton in regular fit.','Hawt Like a Habanero Shirt (Women\'s)',NULL,14.99000,NULL,NULL,'Y',NULL,'/black_l',NULL,NULL,NULL,NULL,200);
INSERT INTO `BLC_SKU` VALUES (214,NULL,'2020-08-16 20:10:51',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,'Women\'s Habanero collection standard short sleeve screen-printed tee shirt in soft 30 singles cotton in regular fit.','Hawt Like a Habanero Shirt (Women\'s)',NULL,16.99000,NULL,NULL,'Y',NULL,'/black_xl',NULL,NULL,NULL,NULL,200);
INSERT INTO `BLC_SKU` VALUES (221,NULL,'2020-08-16 20:10:51',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,'Women\'s Habanero collection standard short sleeve screen-printed tee shirt in soft 30 singles cotton in regular fit.','Hawt Like a Habanero Shirt (Women\'s)',NULL,14.99000,NULL,NULL,'Y',NULL,'/red_s',NULL,NULL,NULL,NULL,200);
INSERT INTO `BLC_SKU` VALUES (222,NULL,'2020-08-16 20:10:51',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,'Women\'s Habanero collection standard short sleeve screen-printed tee shirt in soft 30 singles cotton in regular fit.','Hawt Like a Habanero Shirt (Women\'s)',NULL,14.99000,NULL,NULL,'Y',NULL,'/red_m',NULL,NULL,NULL,NULL,200);
INSERT INTO `BLC_SKU` VALUES (223,NULL,'2020-08-16 20:10:51',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,'Women\'s Habanero collection standard short sleeve screen-printed tee shirt in soft 30 singles cotton in regular fit.','Hawt Like a Habanero Shirt (Women\'s)',NULL,14.99000,NULL,NULL,'Y',NULL,'/red_l',NULL,NULL,NULL,NULL,200);
INSERT INTO `BLC_SKU` VALUES (224,NULL,'2020-08-16 20:10:51',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,'Women\'s Habanero collection standard short sleeve screen-printed tee shirt in soft 30 singles cotton in regular fit.','Hawt Like a Habanero Shirt (Women\'s)',NULL,16.99000,NULL,NULL,'Y',NULL,'/red_xl',NULL,NULL,NULL,NULL,200);
INSERT INTO `BLC_SKU` VALUES (231,NULL,'2020-08-16 20:10:51',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,'Women\'s Habanero collection standard short sleeve screen-printed tee shirt in soft 30 singles cotton in regular fit.','Hawt Like a Habanero Shirt (Women\'s)',NULL,14.99000,NULL,NULL,'Y',NULL,'/silver_s',NULL,NULL,NULL,NULL,200);
INSERT INTO `BLC_SKU` VALUES (232,NULL,'2020-08-16 20:10:51',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,'Women\'s Habanero collection standard short sleeve screen-printed tee shirt in soft 30 singles cotton in regular fit.','Hawt Like a Habanero Shirt (Women\'s)',NULL,14.99000,NULL,NULL,'Y',NULL,'/silver_m',NULL,NULL,NULL,NULL,200);
INSERT INTO `BLC_SKU` VALUES (233,NULL,'2020-08-16 20:10:51',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,'Women\'s Habanero collection standard short sleeve screen-printed tee shirt in soft 30 singles cotton in regular fit.','Hawt Like a Habanero Shirt (Women\'s)',NULL,14.99000,NULL,NULL,'Y',NULL,'/silver_l',NULL,NULL,NULL,NULL,200);
INSERT INTO `BLC_SKU` VALUES (234,NULL,'2020-08-16 20:10:51',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,'Women\'s Habanero collection standard short sleeve screen-printed tee shirt in soft 30 singles cotton in regular fit.','Hawt Like a Habanero Shirt (Women\'s)',NULL,16.99000,NULL,NULL,'Y',NULL,'/silver_xl',NULL,NULL,NULL,NULL,200);
INSERT INTO `BLC_SKU` VALUES (300,NULL,'2020-08-16 20:10:51',NULL,5.29000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,'This hand-drawn logo shirt for men features a regular fit in three different colors','Heat Clinic Hand-Drawn (Men\'s)',NULL,15.99000,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,300,NULL);
INSERT INTO `BLC_SKU` VALUES (311,NULL,'2020-08-16 20:10:51',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,'This hand-drawn logo shirt for men features a regular fit in three different colors','Heat Clinic Hand-Drawn (Men\'s)',NULL,15.99000,NULL,NULL,'Y',NULL,'/black_s',NULL,NULL,NULL,NULL,300);
INSERT INTO `BLC_SKU` VALUES (312,NULL,'2020-08-16 20:10:51',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,'This hand-drawn logo shirt for men features a regular fit in three different colors','Heat Clinic Hand-Drawn (Men\'s)',NULL,15.99000,NULL,NULL,'Y',NULL,'/black_m',NULL,NULL,NULL,NULL,300);
INSERT INTO `BLC_SKU` VALUES (313,NULL,'2020-08-16 20:10:51',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,'This hand-drawn logo shirt for men features a regular fit in three different colors','Heat Clinic Hand-Drawn (Men\'s)',NULL,15.99000,NULL,NULL,'Y',NULL,'/black_l',NULL,NULL,NULL,NULL,300);
INSERT INTO `BLC_SKU` VALUES (314,NULL,'2020-08-16 20:10:51',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,'This hand-drawn logo shirt for men features a regular fit in three different colors','Heat Clinic Hand-Drawn (Men\'s)',NULL,16.99000,NULL,NULL,'Y',NULL,'/black_xl',NULL,NULL,NULL,NULL,300);
INSERT INTO `BLC_SKU` VALUES (321,NULL,'2020-08-16 20:10:51',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,'This hand-drawn logo shirt for men features a regular fit in three different colors','Heat Clinic Hand-Drawn (Men\'s)',NULL,15.99000,NULL,NULL,'Y',NULL,'/red_s',NULL,NULL,NULL,NULL,300);
INSERT INTO `BLC_SKU` VALUES (322,NULL,'2020-08-16 20:10:51',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,'This hand-drawn logo shirt for men features a regular fit in three different colors','Heat Clinic Hand-Drawn (Men\'s)',NULL,15.99000,NULL,NULL,'Y',NULL,'/red_m',NULL,NULL,NULL,NULL,300);
INSERT INTO `BLC_SKU` VALUES (323,NULL,'2020-08-16 20:10:51',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,'This hand-drawn logo shirt for men features a regular fit in three different colors','Heat Clinic Hand-Drawn (Men\'s)',NULL,15.99000,NULL,NULL,'Y',NULL,'/red_l',NULL,NULL,NULL,NULL,300);
INSERT INTO `BLC_SKU` VALUES (324,NULL,'2020-08-16 20:10:51',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,'This hand-drawn logo shirt for men features a regular fit in three different colors','Heat Clinic Hand-Drawn (Men\'s)',NULL,16.99000,NULL,NULL,'Y',NULL,'/red_xl',NULL,NULL,NULL,NULL,300);
INSERT INTO `BLC_SKU` VALUES (331,NULL,'2020-08-16 20:10:51',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,'This hand-drawn logo shirt for men features a regular fit in three different colors','Heat Clinic Hand-Drawn (Men\'s)',NULL,15.99000,NULL,NULL,'Y',NULL,'/silver_s',NULL,NULL,NULL,NULL,300);
INSERT INTO `BLC_SKU` VALUES (332,NULL,'2020-08-16 20:10:51',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,'This hand-drawn logo shirt for men features a regular fit in three different colors','Heat Clinic Hand-Drawn (Men\'s)',NULL,15.99000,NULL,NULL,'Y',NULL,'/silver_m',NULL,NULL,NULL,NULL,300);
INSERT INTO `BLC_SKU` VALUES (333,NULL,'2020-08-16 20:10:51',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,'This hand-drawn logo shirt for men features a regular fit in three different colors','Heat Clinic Hand-Drawn (Men\'s)',NULL,15.99000,NULL,NULL,'Y',NULL,'/silver_l',NULL,NULL,NULL,NULL,300);
INSERT INTO `BLC_SKU` VALUES (334,NULL,'2020-08-16 20:10:51',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,'This hand-drawn logo shirt for men features a regular fit in three different colors','Heat Clinic Hand-Drawn (Men\'s)',NULL,16.99000,NULL,NULL,'Y',NULL,'/silver_xl',NULL,NULL,NULL,NULL,300);
INSERT INTO `BLC_SKU` VALUES (400,NULL,'2020-08-16 20:10:51',NULL,5.49000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,'This hand-drawn logo shirt for women features a regular fit in three different colors','Heat Clinic Hand-Drawn (Women\'s)',NULL,15.99000,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,400,NULL);
INSERT INTO `BLC_SKU` VALUES (411,NULL,'2020-08-16 20:10:51',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,'This hand-drawn logo shirt for women features a regular fit in three different colors','Heat Clinic Hand-Drawn (Women\'s)',NULL,15.99000,NULL,NULL,'Y',NULL,'/black_s',NULL,NULL,NULL,NULL,400);
INSERT INTO `BLC_SKU` VALUES (412,NULL,'2020-08-16 20:10:51',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,'This hand-drawn logo shirt for women features a regular fit in three different colors','Heat Clinic Hand-Drawn (Women\'s)',NULL,15.99000,NULL,NULL,'Y',NULL,'/black_m',NULL,NULL,NULL,NULL,400);
INSERT INTO `BLC_SKU` VALUES (413,NULL,'2020-08-16 20:10:51',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,'This hand-drawn logo shirt for women features a regular fit in three different colors','Heat Clinic Hand-Drawn (Women\'s)',NULL,15.99000,NULL,NULL,'Y',NULL,'/black_l',NULL,NULL,NULL,NULL,400);
INSERT INTO `BLC_SKU` VALUES (414,NULL,'2020-08-16 20:10:51',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,'This hand-drawn logo shirt for women features a regular fit in three different colors','Heat Clinic Hand-Drawn (Women\'s)',NULL,16.99000,NULL,NULL,'Y',NULL,'/black_xl',NULL,NULL,NULL,NULL,400);
INSERT INTO `BLC_SKU` VALUES (421,NULL,'2020-08-16 20:10:51',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,'This hand-drawn logo shirt for women features a regular fit in three different colors','Heat Clinic Hand-Drawn (Women\'s)',NULL,15.99000,NULL,NULL,'Y',NULL,'/red_s',NULL,NULL,NULL,NULL,400);
INSERT INTO `BLC_SKU` VALUES (422,NULL,'2020-08-16 20:10:51',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,'This hand-drawn logo shirt for women features a regular fit in three different colors','Heat Clinic Hand-Drawn (Women\'s)',NULL,15.99000,NULL,NULL,'Y',NULL,'/red_m',NULL,NULL,NULL,NULL,400);
INSERT INTO `BLC_SKU` VALUES (423,NULL,'2020-08-16 20:10:51',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,'This hand-drawn logo shirt for women features a regular fit in three different colors','Heat Clinic Hand-Drawn (Women\'s)',NULL,15.99000,NULL,NULL,'Y',NULL,'/red_l',NULL,NULL,NULL,NULL,400);
INSERT INTO `BLC_SKU` VALUES (424,NULL,'2020-08-16 20:10:51',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,'This hand-drawn logo shirt for women features a regular fit in three different colors','Heat Clinic Hand-Drawn (Women\'s)',NULL,16.99000,NULL,NULL,'Y',NULL,'/red_xl',NULL,NULL,NULL,NULL,400);
INSERT INTO `BLC_SKU` VALUES (431,NULL,'2020-08-16 20:10:51',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,'This hand-drawn logo shirt for women features a regular fit in three different colors','Heat Clinic Hand-Drawn (Women\'s)',NULL,15.99000,NULL,NULL,'Y',NULL,'/silver_s',NULL,NULL,NULL,NULL,400);
INSERT INTO `BLC_SKU` VALUES (432,NULL,'2020-08-16 20:10:51',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,'This hand-drawn logo shirt for women features a regular fit in three different colors','Heat Clinic Hand-Drawn (Women\'s)',NULL,15.99000,NULL,NULL,'Y',NULL,'/silver_m',NULL,NULL,NULL,NULL,400);
INSERT INTO `BLC_SKU` VALUES (433,NULL,'2020-08-16 20:10:51',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,'This hand-drawn logo shirt for women features a regular fit in three different colors','Heat Clinic Hand-Drawn (Women\'s)',NULL,15.99000,NULL,NULL,'Y',NULL,'/silver_l',NULL,NULL,NULL,NULL,400);
INSERT INTO `BLC_SKU` VALUES (434,NULL,'2020-08-16 20:10:51',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,'This hand-drawn logo shirt for women features a regular fit in three different colors','Heat Clinic Hand-Drawn (Women\'s)',NULL,16.99000,NULL,NULL,'Y',NULL,'/silver_xl',NULL,NULL,NULL,NULL,400);
INSERT INTO `BLC_SKU` VALUES (500,NULL,'2020-08-16 20:10:51',NULL,4.89000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,'Don\'t you just love our mascot? Get your very own shirt today!','Heat Clinic Mascot (Men\'s)',NULL,15.99000,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,500,NULL);
INSERT INTO `BLC_SKU` VALUES (511,NULL,'2020-08-16 20:10:51',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,'Don\'t you just love our mascot? Get your very own shirt today!','Heat Clinic Mascot (Men\'s)',NULL,15.99000,NULL,NULL,'Y',NULL,'/black_s',NULL,NULL,NULL,NULL,500);
INSERT INTO `BLC_SKU` VALUES (512,NULL,'2020-08-16 20:10:51',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,'Don\'t you just love our mascot? Get your very own shirt today!','Heat Clinic Mascot (Men\'s)',NULL,15.99000,NULL,NULL,'Y',NULL,'/black_m',NULL,NULL,NULL,NULL,500);
INSERT INTO `BLC_SKU` VALUES (513,NULL,'2020-08-16 20:10:51',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,'Don\'t you just love our mascot? Get your very own shirt today!','Heat Clinic Mascot (Men\'s)',NULL,15.99000,NULL,NULL,'Y',NULL,'/black_l',NULL,NULL,NULL,NULL,500);
INSERT INTO `BLC_SKU` VALUES (514,NULL,'2020-08-16 20:10:51',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,'Don\'t you just love our mascot? Get your very own shirt today!','Heat Clinic Mascot (Men\'s)',NULL,16.99000,NULL,NULL,'Y',NULL,'/black_xl',NULL,NULL,NULL,NULL,500);
INSERT INTO `BLC_SKU` VALUES (521,NULL,'2020-08-16 20:10:51',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,'Don\'t you just love our mascot? Get your very own shirt today!','Heat Clinic Mascot (Men\'s)',NULL,15.99000,NULL,NULL,'Y',NULL,'/red_s',NULL,NULL,NULL,NULL,500);
INSERT INTO `BLC_SKU` VALUES (522,NULL,'2020-08-16 20:10:51',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,'Don\'t you just love our mascot? Get your very own shirt today!','Heat Clinic Mascot (Men\'s)',NULL,15.99000,NULL,NULL,'Y',NULL,'/red_m',NULL,NULL,NULL,NULL,500);
INSERT INTO `BLC_SKU` VALUES (523,NULL,'2020-08-16 20:10:51',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,'Don\'t you just love our mascot? Get your very own shirt today!','Heat Clinic Mascot (Men\'s)',NULL,15.99000,NULL,NULL,'Y',NULL,'/red_l',NULL,NULL,NULL,NULL,500);
INSERT INTO `BLC_SKU` VALUES (524,NULL,'2020-08-16 20:10:51',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,'Don\'t you just love our mascot? Get your very own shirt today!','Heat Clinic Mascot (Men\'s)',NULL,16.99000,NULL,NULL,'Y',NULL,'/red_xl',NULL,NULL,NULL,NULL,500);
INSERT INTO `BLC_SKU` VALUES (531,NULL,'2020-08-16 20:10:51',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,'Don\'t you just love our mascot? Get your very own shirt today!','Heat Clinic Mascot (Men\'s)',NULL,15.99000,NULL,NULL,'Y',NULL,'/silver_s',NULL,NULL,NULL,NULL,500);
INSERT INTO `BLC_SKU` VALUES (532,NULL,'2020-08-16 20:10:51',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,'Don\'t you just love our mascot? Get your very own shirt today!','Heat Clinic Mascot (Men\'s)',NULL,15.99000,NULL,NULL,'Y',NULL,'/silver_m',NULL,NULL,NULL,NULL,500);
INSERT INTO `BLC_SKU` VALUES (533,NULL,'2020-08-16 20:10:51',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,'Don\'t you just love our mascot? Get your very own shirt today!','Heat Clinic Mascot (Men\'s)',NULL,15.99000,NULL,NULL,'Y',NULL,'/silver_l',NULL,NULL,NULL,NULL,500);
INSERT INTO `BLC_SKU` VALUES (534,NULL,'2020-08-16 20:10:51',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,'Don\'t you just love our mascot? Get your very own shirt today!','Heat Clinic Mascot (Men\'s)',NULL,16.99000,NULL,NULL,'Y',NULL,'/silver_xl',NULL,NULL,NULL,NULL,500);
INSERT INTO `BLC_SKU` VALUES (600,NULL,'2020-08-16 20:10:51',NULL,4.99000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,'Don\'t you just love our mascot? Get your very own shirt today!','Heat Clinic Mascot (Women\'s)',NULL,15.99000,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,600,NULL);
INSERT INTO `BLC_SKU` VALUES (611,NULL,'2020-08-16 20:10:51',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,'Don\'t you just love our mascot? Get your very own shirt today!','Heat Clinic Mascot (Women\'s)',NULL,15.99000,NULL,NULL,'Y',NULL,'/black_s',NULL,NULL,NULL,NULL,600);
INSERT INTO `BLC_SKU` VALUES (612,NULL,'2020-08-16 20:10:51',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,'Don\'t you just love our mascot? Get your very own shirt today!','Heat Clinic Mascot (Women\'s)',NULL,15.99000,NULL,NULL,'Y',NULL,'/black_m',NULL,NULL,NULL,NULL,600);
INSERT INTO `BLC_SKU` VALUES (613,NULL,'2020-08-16 20:10:51',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,'Don\'t you just love our mascot? Get your very own shirt today!','Heat Clinic Mascot (Women\'s)',NULL,15.99000,NULL,NULL,'Y',NULL,'/black_l',NULL,NULL,NULL,NULL,600);
INSERT INTO `BLC_SKU` VALUES (614,NULL,'2020-08-16 20:10:51',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,'Don\'t you just love our mascot? Get your very own shirt today!','Heat Clinic Mascot (Women\'s)',NULL,16.99000,NULL,NULL,'Y',NULL,'/black_xl',NULL,NULL,NULL,NULL,600);
INSERT INTO `BLC_SKU` VALUES (621,NULL,'2020-08-16 20:10:51',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,'Don\'t you just love our mascot? Get your very own shirt today!','Heat Clinic Mascot (Women\'s)',NULL,15.99000,NULL,NULL,'Y',NULL,'/red_s',NULL,NULL,NULL,NULL,600);
INSERT INTO `BLC_SKU` VALUES (622,NULL,'2020-08-16 20:10:51',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,'Don\'t you just love our mascot? Get your very own shirt today!','Heat Clinic Mascot (Women\'s)',NULL,15.99000,NULL,NULL,'Y',NULL,'/red_m',NULL,NULL,NULL,NULL,600);
INSERT INTO `BLC_SKU` VALUES (623,NULL,'2020-08-16 20:10:51',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,'Don\'t you just love our mascot? Get your very own shirt today!','Heat Clinic Mascot (Women\'s)',NULL,15.99000,NULL,NULL,'Y',NULL,'/red_l',NULL,NULL,NULL,NULL,600);
INSERT INTO `BLC_SKU` VALUES (624,NULL,'2020-08-16 20:10:51',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,'Don\'t you just love our mascot? Get your very own shirt today!','Heat Clinic Mascot (Women\'s)',NULL,16.99000,NULL,NULL,'Y',NULL,'/red_xl',NULL,NULL,NULL,NULL,600);
INSERT INTO `BLC_SKU` VALUES (631,NULL,'2020-08-16 20:10:51',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,'Don\'t you just love our mascot? Get your very own shirt today!','Heat Clinic Mascot (Women\'s)',NULL,15.99000,NULL,NULL,'Y',NULL,'/silver_s',NULL,NULL,NULL,NULL,600);
INSERT INTO `BLC_SKU` VALUES (632,NULL,'2020-08-16 20:10:51',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,'Don\'t you just love our mascot? Get your very own shirt today!','Heat Clinic Mascot (Women\'s)',NULL,15.99000,NULL,NULL,'Y',NULL,'/silver_m',NULL,NULL,NULL,NULL,600);
INSERT INTO `BLC_SKU` VALUES (633,NULL,'2020-08-16 20:10:51',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,'Don\'t you just love our mascot? Get your very own shirt today!','Heat Clinic Mascot (Women\'s)',NULL,15.99000,NULL,NULL,'Y',NULL,'/silver_l',NULL,NULL,NULL,NULL,600);
INSERT INTO `BLC_SKU` VALUES (634,NULL,'2020-08-16 20:10:51',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,'Don\'t you just love our mascot? Get your very own shirt today!','Heat Clinic Mascot (Women\'s)',NULL,16.99000,NULL,NULL,'Y',NULL,'/silver_xl',NULL,NULL,NULL,NULL,600);
/*!40000 ALTER TABLE `BLC_SKU` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `BLC_SKU_ATTRIBUTE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BLC_SKU_ATTRIBUTE` (
  `SKU_ATTR_ID` bigint(20) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `VALUE` varchar(255) NOT NULL,
  `SKU_ID` bigint(20) NOT NULL,
  PRIMARY KEY (`SKU_ATTR_ID`),
  KEY `SKUATTR_NAME_INDEX` (`NAME`),
  KEY `SKUATTR_SKU_INDEX` (`SKU_ID`),
  CONSTRAINT `FK6w8gul2489hdbmxha9ftu6qbq` FOREIGN KEY (`SKU_ID`) REFERENCES `BLC_SKU` (`SKU_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `BLC_SKU_ATTRIBUTE` WRITE;
/*!40000 ALTER TABLE `BLC_SKU_ATTRIBUTE` DISABLE KEYS */;
INSERT INTO `BLC_SKU_ATTRIBUTE` VALUES (1,'heatRange','4',1);
INSERT INTO `BLC_SKU_ATTRIBUTE` VALUES (2,'heatRange','1',2);
INSERT INTO `BLC_SKU_ATTRIBUTE` VALUES (3,'heatRange','2',3);
INSERT INTO `BLC_SKU_ATTRIBUTE` VALUES (4,'heatRange','2',4);
INSERT INTO `BLC_SKU_ATTRIBUTE` VALUES (5,'heatRange','4',5);
INSERT INTO `BLC_SKU_ATTRIBUTE` VALUES (6,'heatRange','4',6);
INSERT INTO `BLC_SKU_ATTRIBUTE` VALUES (7,'heatRange','3',7);
INSERT INTO `BLC_SKU_ATTRIBUTE` VALUES (8,'heatRange','4',8);
INSERT INTO `BLC_SKU_ATTRIBUTE` VALUES (9,'heatRange','5',9);
INSERT INTO `BLC_SKU_ATTRIBUTE` VALUES (10,'heatRange','5',10);
INSERT INTO `BLC_SKU_ATTRIBUTE` VALUES (11,'heatRange','2',11);
INSERT INTO `BLC_SKU_ATTRIBUTE` VALUES (12,'heatRange','1',12);
INSERT INTO `BLC_SKU_ATTRIBUTE` VALUES (13,'heatRange','2',13);
INSERT INTO `BLC_SKU_ATTRIBUTE` VALUES (14,'heatRange','2',14);
INSERT INTO `BLC_SKU_ATTRIBUTE` VALUES (15,'heatRange','1',15);
INSERT INTO `BLC_SKU_ATTRIBUTE` VALUES (16,'heatRange','3',16);
INSERT INTO `BLC_SKU_ATTRIBUTE` VALUES (17,'heatRange','5',17);
INSERT INTO `BLC_SKU_ATTRIBUTE` VALUES (18,'heatRange','3',18);
INSERT INTO `BLC_SKU_ATTRIBUTE` VALUES (19,'heatRange','1',19);
/*!40000 ALTER TABLE `BLC_SKU_ATTRIBUTE` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `BLC_SKU_AVAILABILITY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BLC_SKU_AVAILABILITY` (
  `SKU_AVAILABILITY_ID` bigint(20) NOT NULL,
  `AVAILABILITY_DATE` datetime DEFAULT NULL,
  `AVAILABILITY_STATUS` varchar(255) DEFAULT NULL,
  `LOCATION_ID` bigint(20) DEFAULT NULL,
  `QTY_ON_HAND` int(11) DEFAULT NULL,
  `RESERVE_QTY` int(11) DEFAULT NULL,
  `SKU_ID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`SKU_AVAILABILITY_ID`),
  KEY `SKUAVAIL_STATUS_INDEX` (`AVAILABILITY_STATUS`),
  KEY `SKUAVAIL_LOCATION_INDEX` (`LOCATION_ID`),
  KEY `SKUAVAIL_SKU_INDEX` (`SKU_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `BLC_SKU_AVAILABILITY` WRITE;
/*!40000 ALTER TABLE `BLC_SKU_AVAILABILITY` DISABLE KEYS */;
/*!40000 ALTER TABLE `BLC_SKU_AVAILABILITY` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `BLC_SKU_BUNDLE_ITEM`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BLC_SKU_BUNDLE_ITEM` (
  `SKU_BUNDLE_ITEM_ID` bigint(20) NOT NULL,
  `ITEM_SALE_PRICE` decimal(19,5) DEFAULT NULL,
  `QUANTITY` int(11) NOT NULL,
  `SEQUENCE` decimal(10,6) DEFAULT NULL,
  `PRODUCT_BUNDLE_ID` bigint(20) NOT NULL,
  `SKU_ID` bigint(20) NOT NULL,
  PRIMARY KEY (`SKU_BUNDLE_ITEM_ID`),
  KEY `FK78yrrdqjalrqrei5kfnybkrs8` (`PRODUCT_BUNDLE_ID`),
  KEY `FKbhe93esmsur5uyhl0v6dj392t` (`SKU_ID`),
  CONSTRAINT `FK78yrrdqjalrqrei5kfnybkrs8` FOREIGN KEY (`PRODUCT_BUNDLE_ID`) REFERENCES `BLC_PRODUCT_BUNDLE` (`PRODUCT_ID`),
  CONSTRAINT `FKbhe93esmsur5uyhl0v6dj392t` FOREIGN KEY (`SKU_ID`) REFERENCES `BLC_SKU` (`SKU_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `BLC_SKU_BUNDLE_ITEM` WRITE;
/*!40000 ALTER TABLE `BLC_SKU_BUNDLE_ITEM` DISABLE KEYS */;
/*!40000 ALTER TABLE `BLC_SKU_BUNDLE_ITEM` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `BLC_SKU_FEE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BLC_SKU_FEE` (
  `SKU_FEE_ID` bigint(20) NOT NULL,
  `AMOUNT` decimal(19,5) NOT NULL,
  `DESCRIPTION` varchar(255) DEFAULT NULL,
  `EXPRESSION` longtext,
  `FEE_TYPE` varchar(255) DEFAULT NULL,
  `NAME` varchar(255) DEFAULT NULL,
  `TAXABLE` bit(1) DEFAULT NULL,
  `CURRENCY_CODE` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`SKU_FEE_ID`),
  KEY `FKm9vf5c5ktjqu4wilne2f6926k` (`CURRENCY_CODE`),
  CONSTRAINT `FKm9vf5c5ktjqu4wilne2f6926k` FOREIGN KEY (`CURRENCY_CODE`) REFERENCES `BLC_CURRENCY` (`CURRENCY_CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `BLC_SKU_FEE` WRITE;
/*!40000 ALTER TABLE `BLC_SKU_FEE` DISABLE KEYS */;
/*!40000 ALTER TABLE `BLC_SKU_FEE` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `BLC_SKU_FEE_XREF`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BLC_SKU_FEE_XREF` (
  `SKU_FEE_ID` bigint(20) NOT NULL,
  `SKU_ID` bigint(20) NOT NULL,
  KEY `FK3vmkt7ojjlpk2fle4cp8eq55f` (`SKU_ID`),
  KEY `FKky8dxmeg4o49qyc7kiwojnuek` (`SKU_FEE_ID`),
  CONSTRAINT `FK3vmkt7ojjlpk2fle4cp8eq55f` FOREIGN KEY (`SKU_ID`) REFERENCES `BLC_SKU` (`SKU_ID`),
  CONSTRAINT `FKky8dxmeg4o49qyc7kiwojnuek` FOREIGN KEY (`SKU_FEE_ID`) REFERENCES `BLC_SKU_FEE` (`SKU_FEE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `BLC_SKU_FEE_XREF` WRITE;
/*!40000 ALTER TABLE `BLC_SKU_FEE_XREF` DISABLE KEYS */;
/*!40000 ALTER TABLE `BLC_SKU_FEE_XREF` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `BLC_SKU_FULFILLMENT_EXCLUDED`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BLC_SKU_FULFILLMENT_EXCLUDED` (
  `SKU_ID` bigint(20) NOT NULL,
  `FULFILLMENT_OPTION_ID` bigint(20) NOT NULL,
  KEY `FKbf81qj596ta3xs2erw4o7m1ft` (`FULFILLMENT_OPTION_ID`),
  KEY `FKs0toanodthismt1hugerli3e8` (`SKU_ID`),
  CONSTRAINT `FKbf81qj596ta3xs2erw4o7m1ft` FOREIGN KEY (`FULFILLMENT_OPTION_ID`) REFERENCES `BLC_FULFILLMENT_OPTION` (`FULFILLMENT_OPTION_ID`),
  CONSTRAINT `FKs0toanodthismt1hugerli3e8` FOREIGN KEY (`SKU_ID`) REFERENCES `BLC_SKU` (`SKU_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `BLC_SKU_FULFILLMENT_EXCLUDED` WRITE;
/*!40000 ALTER TABLE `BLC_SKU_FULFILLMENT_EXCLUDED` DISABLE KEYS */;
/*!40000 ALTER TABLE `BLC_SKU_FULFILLMENT_EXCLUDED` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `BLC_SKU_FULFILLMENT_FLAT_RATES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BLC_SKU_FULFILLMENT_FLAT_RATES` (
  `SKU_ID` bigint(20) NOT NULL,
  `RATE` decimal(19,5) DEFAULT NULL,
  `FULFILLMENT_OPTION_ID` bigint(20) NOT NULL,
  PRIMARY KEY (`SKU_ID`,`FULFILLMENT_OPTION_ID`),
  KEY `FKklcbu8knfitgnhlj1sa2vyd30` (`FULFILLMENT_OPTION_ID`),
  CONSTRAINT `FK1ruxosbsx27uicd9dny1ls9td` FOREIGN KEY (`SKU_ID`) REFERENCES `BLC_SKU` (`SKU_ID`),
  CONSTRAINT `FKklcbu8knfitgnhlj1sa2vyd30` FOREIGN KEY (`FULFILLMENT_OPTION_ID`) REFERENCES `BLC_FULFILLMENT_OPTION` (`FULFILLMENT_OPTION_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `BLC_SKU_FULFILLMENT_FLAT_RATES` WRITE;
/*!40000 ALTER TABLE `BLC_SKU_FULFILLMENT_FLAT_RATES` DISABLE KEYS */;
/*!40000 ALTER TABLE `BLC_SKU_FULFILLMENT_FLAT_RATES` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `BLC_SKU_MEDIA_MAP`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BLC_SKU_MEDIA_MAP` (
  `SKU_MEDIA_ID` bigint(20) NOT NULL,
  `MAP_KEY` varchar(255) NOT NULL,
  `MEDIA_ID` bigint(20) DEFAULT NULL,
  `BLC_SKU_SKU_ID` bigint(20) NOT NULL,
  PRIMARY KEY (`SKU_MEDIA_ID`),
  KEY `FKl3netvy66i56mjj6bo43mjmn2` (`MEDIA_ID`),
  KEY `FKc3mu07614ovbqwbnd1lxdg2ac` (`BLC_SKU_SKU_ID`),
  CONSTRAINT `FKc3mu07614ovbqwbnd1lxdg2ac` FOREIGN KEY (`BLC_SKU_SKU_ID`) REFERENCES `BLC_SKU` (`SKU_ID`),
  CONSTRAINT `FKl3netvy66i56mjj6bo43mjmn2` FOREIGN KEY (`MEDIA_ID`) REFERENCES `BLC_MEDIA` (`MEDIA_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `BLC_SKU_MEDIA_MAP` WRITE;
/*!40000 ALTER TABLE `BLC_SKU_MEDIA_MAP` DISABLE KEYS */;
INSERT INTO `BLC_SKU_MEDIA_MAP` VALUES (-100,'primary',101,1);
INSERT INTO `BLC_SKU_MEDIA_MAP` VALUES (-99,'primary',201,2);
INSERT INTO `BLC_SKU_MEDIA_MAP` VALUES (-98,'primary',301,3);
INSERT INTO `BLC_SKU_MEDIA_MAP` VALUES (-97,'primary',401,4);
INSERT INTO `BLC_SKU_MEDIA_MAP` VALUES (-96,'primary',501,5);
INSERT INTO `BLC_SKU_MEDIA_MAP` VALUES (-95,'primary',601,6);
INSERT INTO `BLC_SKU_MEDIA_MAP` VALUES (-94,'primary',701,7);
INSERT INTO `BLC_SKU_MEDIA_MAP` VALUES (-93,'primary',801,8);
INSERT INTO `BLC_SKU_MEDIA_MAP` VALUES (-92,'primary',901,9);
INSERT INTO `BLC_SKU_MEDIA_MAP` VALUES (-91,'primary',1001,10);
INSERT INTO `BLC_SKU_MEDIA_MAP` VALUES (-90,'primary',1101,11);
INSERT INTO `BLC_SKU_MEDIA_MAP` VALUES (-89,'primary',1201,12);
INSERT INTO `BLC_SKU_MEDIA_MAP` VALUES (-88,'primary',1301,13);
INSERT INTO `BLC_SKU_MEDIA_MAP` VALUES (-87,'primary',1401,14);
INSERT INTO `BLC_SKU_MEDIA_MAP` VALUES (-86,'primary',1501,15);
INSERT INTO `BLC_SKU_MEDIA_MAP` VALUES (-85,'primary',1601,16);
INSERT INTO `BLC_SKU_MEDIA_MAP` VALUES (-84,'primary',1701,17);
INSERT INTO `BLC_SKU_MEDIA_MAP` VALUES (-83,'primary',1801,18);
INSERT INTO `BLC_SKU_MEDIA_MAP` VALUES (-82,'primary',1901,19);
INSERT INTO `BLC_SKU_MEDIA_MAP` VALUES (-81,'alt1',102,1);
INSERT INTO `BLC_SKU_MEDIA_MAP` VALUES (-80,'alt1',202,2);
INSERT INTO `BLC_SKU_MEDIA_MAP` VALUES (-79,'alt1',302,3);
INSERT INTO `BLC_SKU_MEDIA_MAP` VALUES (-78,'alt1',402,4);
INSERT INTO `BLC_SKU_MEDIA_MAP` VALUES (-77,'alt1',502,5);
INSERT INTO `BLC_SKU_MEDIA_MAP` VALUES (-76,'alt1',602,6);
INSERT INTO `BLC_SKU_MEDIA_MAP` VALUES (-75,'alt1',702,7);
INSERT INTO `BLC_SKU_MEDIA_MAP` VALUES (-74,'alt1',802,8);
INSERT INTO `BLC_SKU_MEDIA_MAP` VALUES (-73,'alt1',902,9);
INSERT INTO `BLC_SKU_MEDIA_MAP` VALUES (-72,'alt1',1002,10);
INSERT INTO `BLC_SKU_MEDIA_MAP` VALUES (-71,'alt1',1102,11);
INSERT INTO `BLC_SKU_MEDIA_MAP` VALUES (-70,'alt1',1202,12);
INSERT INTO `BLC_SKU_MEDIA_MAP` VALUES (-69,'alt1',1302,13);
INSERT INTO `BLC_SKU_MEDIA_MAP` VALUES (-68,'alt1',1402,14);
INSERT INTO `BLC_SKU_MEDIA_MAP` VALUES (-67,'alt1',1502,15);
INSERT INTO `BLC_SKU_MEDIA_MAP` VALUES (-66,'alt1',1602,16);
INSERT INTO `BLC_SKU_MEDIA_MAP` VALUES (-65,'alt1',1702,17);
INSERT INTO `BLC_SKU_MEDIA_MAP` VALUES (-64,'alt1',1802,18);
INSERT INTO `BLC_SKU_MEDIA_MAP` VALUES (-63,'alt1',1902,19);
INSERT INTO `BLC_SKU_MEDIA_MAP` VALUES (-62,'alt2',203,2);
INSERT INTO `BLC_SKU_MEDIA_MAP` VALUES (-61,'alt3',204,2);
INSERT INTO `BLC_SKU_MEDIA_MAP` VALUES (-60,'alt4',205,2);
INSERT INTO `BLC_SKU_MEDIA_MAP` VALUES (-59,'alt5',206,2);
INSERT INTO `BLC_SKU_MEDIA_MAP` VALUES (-58,'primary',10001,100);
INSERT INTO `BLC_SKU_MEDIA_MAP` VALUES (-57,'primary',20002,200);
INSERT INTO `BLC_SKU_MEDIA_MAP` VALUES (-56,'primary',30003,300);
INSERT INTO `BLC_SKU_MEDIA_MAP` VALUES (-55,'primary',40002,400);
INSERT INTO `BLC_SKU_MEDIA_MAP` VALUES (-54,'primary',50003,500);
INSERT INTO `BLC_SKU_MEDIA_MAP` VALUES (-53,'primary',60001,600);
INSERT INTO `BLC_SKU_MEDIA_MAP` VALUES (-52,'alt1',10002,100);
INSERT INTO `BLC_SKU_MEDIA_MAP` VALUES (-51,'alt1',20001,200);
INSERT INTO `BLC_SKU_MEDIA_MAP` VALUES (-50,'alt1',30001,300);
INSERT INTO `BLC_SKU_MEDIA_MAP` VALUES (-49,'alt1',40001,400);
INSERT INTO `BLC_SKU_MEDIA_MAP` VALUES (-48,'alt1',50001,500);
INSERT INTO `BLC_SKU_MEDIA_MAP` VALUES (-47,'alt1',60002,600);
INSERT INTO `BLC_SKU_MEDIA_MAP` VALUES (-46,'alt2',10003,100);
INSERT INTO `BLC_SKU_MEDIA_MAP` VALUES (-45,'alt2',20003,200);
INSERT INTO `BLC_SKU_MEDIA_MAP` VALUES (-44,'alt2',30002,300);
INSERT INTO `BLC_SKU_MEDIA_MAP` VALUES (-43,'alt2',40003,400);
INSERT INTO `BLC_SKU_MEDIA_MAP` VALUES (-42,'alt2',50002,500);
INSERT INTO `BLC_SKU_MEDIA_MAP` VALUES (-41,'alt2',60003,600);
/*!40000 ALTER TABLE `BLC_SKU_MEDIA_MAP` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `BLC_SKU_OPTION_VALUE_XREF`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BLC_SKU_OPTION_VALUE_XREF` (
  `SKU_OPTION_VALUE_XREF_ID` bigint(20) NOT NULL,
  `PRODUCT_OPTION_VALUE_ID` bigint(20) NOT NULL,
  `SKU_ID` bigint(20) NOT NULL,
  PRIMARY KEY (`SKU_OPTION_VALUE_XREF_ID`),
  KEY `FKc9e8sa4v1mqlbhd9hjp6bxujh` (`PRODUCT_OPTION_VALUE_ID`),
  KEY `FKci6tv12pfsh2srrakx3ridy8v` (`SKU_ID`),
  CONSTRAINT `FKc9e8sa4v1mqlbhd9hjp6bxujh` FOREIGN KEY (`PRODUCT_OPTION_VALUE_ID`) REFERENCES `BLC_PRODUCT_OPTION_VALUE` (`PRODUCT_OPTION_VALUE_ID`),
  CONSTRAINT `FKci6tv12pfsh2srrakx3ridy8v` FOREIGN KEY (`SKU_ID`) REFERENCES `BLC_SKU` (`SKU_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `BLC_SKU_OPTION_VALUE_XREF` WRITE;
/*!40000 ALTER TABLE `BLC_SKU_OPTION_VALUE_XREF` DISABLE KEYS */;
INSERT INTO `BLC_SKU_OPTION_VALUE_XREF` VALUES (1,1,111);
INSERT INTO `BLC_SKU_OPTION_VALUE_XREF` VALUES (2,11,111);
INSERT INTO `BLC_SKU_OPTION_VALUE_XREF` VALUES (3,1,112);
INSERT INTO `BLC_SKU_OPTION_VALUE_XREF` VALUES (4,12,112);
INSERT INTO `BLC_SKU_OPTION_VALUE_XREF` VALUES (5,1,113);
INSERT INTO `BLC_SKU_OPTION_VALUE_XREF` VALUES (6,13,113);
INSERT INTO `BLC_SKU_OPTION_VALUE_XREF` VALUES (7,1,114);
INSERT INTO `BLC_SKU_OPTION_VALUE_XREF` VALUES (8,14,114);
INSERT INTO `BLC_SKU_OPTION_VALUE_XREF` VALUES (9,2,121);
INSERT INTO `BLC_SKU_OPTION_VALUE_XREF` VALUES (10,11,121);
INSERT INTO `BLC_SKU_OPTION_VALUE_XREF` VALUES (11,2,122);
INSERT INTO `BLC_SKU_OPTION_VALUE_XREF` VALUES (12,12,122);
INSERT INTO `BLC_SKU_OPTION_VALUE_XREF` VALUES (13,2,123);
INSERT INTO `BLC_SKU_OPTION_VALUE_XREF` VALUES (14,13,123);
INSERT INTO `BLC_SKU_OPTION_VALUE_XREF` VALUES (15,2,124);
INSERT INTO `BLC_SKU_OPTION_VALUE_XREF` VALUES (16,14,124);
INSERT INTO `BLC_SKU_OPTION_VALUE_XREF` VALUES (17,3,131);
INSERT INTO `BLC_SKU_OPTION_VALUE_XREF` VALUES (18,11,131);
INSERT INTO `BLC_SKU_OPTION_VALUE_XREF` VALUES (19,3,132);
INSERT INTO `BLC_SKU_OPTION_VALUE_XREF` VALUES (20,12,132);
INSERT INTO `BLC_SKU_OPTION_VALUE_XREF` VALUES (21,3,133);
INSERT INTO `BLC_SKU_OPTION_VALUE_XREF` VALUES (22,13,133);
INSERT INTO `BLC_SKU_OPTION_VALUE_XREF` VALUES (23,3,134);
INSERT INTO `BLC_SKU_OPTION_VALUE_XREF` VALUES (24,14,134);
INSERT INTO `BLC_SKU_OPTION_VALUE_XREF` VALUES (25,1,211);
INSERT INTO `BLC_SKU_OPTION_VALUE_XREF` VALUES (26,11,211);
INSERT INTO `BLC_SKU_OPTION_VALUE_XREF` VALUES (27,1,212);
INSERT INTO `BLC_SKU_OPTION_VALUE_XREF` VALUES (28,12,212);
INSERT INTO `BLC_SKU_OPTION_VALUE_XREF` VALUES (29,1,213);
INSERT INTO `BLC_SKU_OPTION_VALUE_XREF` VALUES (30,13,213);
INSERT INTO `BLC_SKU_OPTION_VALUE_XREF` VALUES (31,1,214);
INSERT INTO `BLC_SKU_OPTION_VALUE_XREF` VALUES (32,14,214);
INSERT INTO `BLC_SKU_OPTION_VALUE_XREF` VALUES (33,2,221);
INSERT INTO `BLC_SKU_OPTION_VALUE_XREF` VALUES (34,11,221);
INSERT INTO `BLC_SKU_OPTION_VALUE_XREF` VALUES (35,2,222);
INSERT INTO `BLC_SKU_OPTION_VALUE_XREF` VALUES (36,12,222);
INSERT INTO `BLC_SKU_OPTION_VALUE_XREF` VALUES (37,2,223);
INSERT INTO `BLC_SKU_OPTION_VALUE_XREF` VALUES (38,13,223);
INSERT INTO `BLC_SKU_OPTION_VALUE_XREF` VALUES (39,2,224);
INSERT INTO `BLC_SKU_OPTION_VALUE_XREF` VALUES (40,14,224);
INSERT INTO `BLC_SKU_OPTION_VALUE_XREF` VALUES (41,3,231);
INSERT INTO `BLC_SKU_OPTION_VALUE_XREF` VALUES (42,11,231);
INSERT INTO `BLC_SKU_OPTION_VALUE_XREF` VALUES (43,3,232);
INSERT INTO `BLC_SKU_OPTION_VALUE_XREF` VALUES (44,12,232);
INSERT INTO `BLC_SKU_OPTION_VALUE_XREF` VALUES (45,3,233);
INSERT INTO `BLC_SKU_OPTION_VALUE_XREF` VALUES (46,13,233);
INSERT INTO `BLC_SKU_OPTION_VALUE_XREF` VALUES (47,3,234);
INSERT INTO `BLC_SKU_OPTION_VALUE_XREF` VALUES (48,14,234);
INSERT INTO `BLC_SKU_OPTION_VALUE_XREF` VALUES (49,1,311);
INSERT INTO `BLC_SKU_OPTION_VALUE_XREF` VALUES (50,11,311);
INSERT INTO `BLC_SKU_OPTION_VALUE_XREF` VALUES (51,1,312);
INSERT INTO `BLC_SKU_OPTION_VALUE_XREF` VALUES (52,12,312);
INSERT INTO `BLC_SKU_OPTION_VALUE_XREF` VALUES (53,1,313);
INSERT INTO `BLC_SKU_OPTION_VALUE_XREF` VALUES (54,13,313);
INSERT INTO `BLC_SKU_OPTION_VALUE_XREF` VALUES (55,1,314);
INSERT INTO `BLC_SKU_OPTION_VALUE_XREF` VALUES (56,14,314);
INSERT INTO `BLC_SKU_OPTION_VALUE_XREF` VALUES (57,2,321);
INSERT INTO `BLC_SKU_OPTION_VALUE_XREF` VALUES (58,11,321);
INSERT INTO `BLC_SKU_OPTION_VALUE_XREF` VALUES (59,2,322);
INSERT INTO `BLC_SKU_OPTION_VALUE_XREF` VALUES (60,12,322);
INSERT INTO `BLC_SKU_OPTION_VALUE_XREF` VALUES (61,2,323);
INSERT INTO `BLC_SKU_OPTION_VALUE_XREF` VALUES (62,13,323);
INSERT INTO `BLC_SKU_OPTION_VALUE_XREF` VALUES (63,2,324);
INSERT INTO `BLC_SKU_OPTION_VALUE_XREF` VALUES (64,14,324);
INSERT INTO `BLC_SKU_OPTION_VALUE_XREF` VALUES (65,3,331);
INSERT INTO `BLC_SKU_OPTION_VALUE_XREF` VALUES (66,11,331);
INSERT INTO `BLC_SKU_OPTION_VALUE_XREF` VALUES (67,3,332);
INSERT INTO `BLC_SKU_OPTION_VALUE_XREF` VALUES (68,12,332);
INSERT INTO `BLC_SKU_OPTION_VALUE_XREF` VALUES (69,3,333);
INSERT INTO `BLC_SKU_OPTION_VALUE_XREF` VALUES (70,13,333);
INSERT INTO `BLC_SKU_OPTION_VALUE_XREF` VALUES (71,3,334);
INSERT INTO `BLC_SKU_OPTION_VALUE_XREF` VALUES (72,14,334);
INSERT INTO `BLC_SKU_OPTION_VALUE_XREF` VALUES (73,1,411);
INSERT INTO `BLC_SKU_OPTION_VALUE_XREF` VALUES (74,11,411);
INSERT INTO `BLC_SKU_OPTION_VALUE_XREF` VALUES (75,1,412);
INSERT INTO `BLC_SKU_OPTION_VALUE_XREF` VALUES (76,12,412);
INSERT INTO `BLC_SKU_OPTION_VALUE_XREF` VALUES (77,1,413);
INSERT INTO `BLC_SKU_OPTION_VALUE_XREF` VALUES (78,13,413);
INSERT INTO `BLC_SKU_OPTION_VALUE_XREF` VALUES (79,1,414);
INSERT INTO `BLC_SKU_OPTION_VALUE_XREF` VALUES (80,14,414);
INSERT INTO `BLC_SKU_OPTION_VALUE_XREF` VALUES (81,2,421);
INSERT INTO `BLC_SKU_OPTION_VALUE_XREF` VALUES (82,11,421);
INSERT INTO `BLC_SKU_OPTION_VALUE_XREF` VALUES (83,2,422);
INSERT INTO `BLC_SKU_OPTION_VALUE_XREF` VALUES (84,12,422);
INSERT INTO `BLC_SKU_OPTION_VALUE_XREF` VALUES (85,2,423);
INSERT INTO `BLC_SKU_OPTION_VALUE_XREF` VALUES (86,13,423);
INSERT INTO `BLC_SKU_OPTION_VALUE_XREF` VALUES (87,2,424);
INSERT INTO `BLC_SKU_OPTION_VALUE_XREF` VALUES (88,14,424);
INSERT INTO `BLC_SKU_OPTION_VALUE_XREF` VALUES (89,3,431);
INSERT INTO `BLC_SKU_OPTION_VALUE_XREF` VALUES (90,11,431);
INSERT INTO `BLC_SKU_OPTION_VALUE_XREF` VALUES (91,3,432);
INSERT INTO `BLC_SKU_OPTION_VALUE_XREF` VALUES (92,12,432);
INSERT INTO `BLC_SKU_OPTION_VALUE_XREF` VALUES (93,3,433);
INSERT INTO `BLC_SKU_OPTION_VALUE_XREF` VALUES (94,13,433);
INSERT INTO `BLC_SKU_OPTION_VALUE_XREF` VALUES (95,3,434);
INSERT INTO `BLC_SKU_OPTION_VALUE_XREF` VALUES (96,14,434);
INSERT INTO `BLC_SKU_OPTION_VALUE_XREF` VALUES (97,1,511);
INSERT INTO `BLC_SKU_OPTION_VALUE_XREF` VALUES (98,11,511);
INSERT INTO `BLC_SKU_OPTION_VALUE_XREF` VALUES (99,1,512);
INSERT INTO `BLC_SKU_OPTION_VALUE_XREF` VALUES (100,12,512);
INSERT INTO `BLC_SKU_OPTION_VALUE_XREF` VALUES (101,1,513);
INSERT INTO `BLC_SKU_OPTION_VALUE_XREF` VALUES (102,13,513);
INSERT INTO `BLC_SKU_OPTION_VALUE_XREF` VALUES (103,1,514);
INSERT INTO `BLC_SKU_OPTION_VALUE_XREF` VALUES (104,14,514);
INSERT INTO `BLC_SKU_OPTION_VALUE_XREF` VALUES (105,2,521);
INSERT INTO `BLC_SKU_OPTION_VALUE_XREF` VALUES (106,11,521);
INSERT INTO `BLC_SKU_OPTION_VALUE_XREF` VALUES (107,2,522);
INSERT INTO `BLC_SKU_OPTION_VALUE_XREF` VALUES (108,12,522);
INSERT INTO `BLC_SKU_OPTION_VALUE_XREF` VALUES (109,2,523);
INSERT INTO `BLC_SKU_OPTION_VALUE_XREF` VALUES (110,13,523);
INSERT INTO `BLC_SKU_OPTION_VALUE_XREF` VALUES (111,2,524);
INSERT INTO `BLC_SKU_OPTION_VALUE_XREF` VALUES (112,14,524);
INSERT INTO `BLC_SKU_OPTION_VALUE_XREF` VALUES (113,3,531);
INSERT INTO `BLC_SKU_OPTION_VALUE_XREF` VALUES (114,11,531);
INSERT INTO `BLC_SKU_OPTION_VALUE_XREF` VALUES (115,3,532);
INSERT INTO `BLC_SKU_OPTION_VALUE_XREF` VALUES (116,12,532);
INSERT INTO `BLC_SKU_OPTION_VALUE_XREF` VALUES (117,3,533);
INSERT INTO `BLC_SKU_OPTION_VALUE_XREF` VALUES (118,13,533);
INSERT INTO `BLC_SKU_OPTION_VALUE_XREF` VALUES (119,3,534);
INSERT INTO `BLC_SKU_OPTION_VALUE_XREF` VALUES (120,14,534);
INSERT INTO `BLC_SKU_OPTION_VALUE_XREF` VALUES (121,1,611);
INSERT INTO `BLC_SKU_OPTION_VALUE_XREF` VALUES (122,11,611);
INSERT INTO `BLC_SKU_OPTION_VALUE_XREF` VALUES (123,1,612);
INSERT INTO `BLC_SKU_OPTION_VALUE_XREF` VALUES (124,12,612);
INSERT INTO `BLC_SKU_OPTION_VALUE_XREF` VALUES (125,1,613);
INSERT INTO `BLC_SKU_OPTION_VALUE_XREF` VALUES (126,13,613);
INSERT INTO `BLC_SKU_OPTION_VALUE_XREF` VALUES (127,1,614);
INSERT INTO `BLC_SKU_OPTION_VALUE_XREF` VALUES (128,14,614);
INSERT INTO `BLC_SKU_OPTION_VALUE_XREF` VALUES (129,2,621);
INSERT INTO `BLC_SKU_OPTION_VALUE_XREF` VALUES (130,11,621);
INSERT INTO `BLC_SKU_OPTION_VALUE_XREF` VALUES (131,2,622);
INSERT INTO `BLC_SKU_OPTION_VALUE_XREF` VALUES (132,12,622);
INSERT INTO `BLC_SKU_OPTION_VALUE_XREF` VALUES (133,2,623);
INSERT INTO `BLC_SKU_OPTION_VALUE_XREF` VALUES (134,13,623);
INSERT INTO `BLC_SKU_OPTION_VALUE_XREF` VALUES (135,2,624);
INSERT INTO `BLC_SKU_OPTION_VALUE_XREF` VALUES (136,14,624);
INSERT INTO `BLC_SKU_OPTION_VALUE_XREF` VALUES (137,3,631);
INSERT INTO `BLC_SKU_OPTION_VALUE_XREF` VALUES (138,11,631);
INSERT INTO `BLC_SKU_OPTION_VALUE_XREF` VALUES (139,3,632);
INSERT INTO `BLC_SKU_OPTION_VALUE_XREF` VALUES (140,12,632);
INSERT INTO `BLC_SKU_OPTION_VALUE_XREF` VALUES (141,3,633);
INSERT INTO `BLC_SKU_OPTION_VALUE_XREF` VALUES (142,13,633);
INSERT INTO `BLC_SKU_OPTION_VALUE_XREF` VALUES (143,3,634);
INSERT INTO `BLC_SKU_OPTION_VALUE_XREF` VALUES (144,14,634);
/*!40000 ALTER TABLE `BLC_SKU_OPTION_VALUE_XREF` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `BLC_STATE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BLC_STATE` (
  `ABBREVIATION` varchar(255) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `COUNTRY` varchar(255) NOT NULL,
  PRIMARY KEY (`ABBREVIATION`),
  KEY `STATE_NAME_INDEX` (`NAME`),
  KEY `FKr63uepn8p8qx02xcg43851gno` (`COUNTRY`),
  CONSTRAINT `FKr63uepn8p8qx02xcg43851gno` FOREIGN KEY (`COUNTRY`) REFERENCES `BLC_COUNTRY` (`ABBREVIATION`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `BLC_STATE` WRITE;
/*!40000 ALTER TABLE `BLC_STATE` DISABLE KEYS */;
INSERT INTO `BLC_STATE` VALUES ('AA','ARMED FORCES AMERICA','US');
INSERT INTO `BLC_STATE` VALUES ('AB','ALBERTA','CA');
INSERT INTO `BLC_STATE` VALUES ('AE','ARMED FORCES','US');
INSERT INTO `BLC_STATE` VALUES ('AK','ALASKA','US');
INSERT INTO `BLC_STATE` VALUES ('AL','ALABAMA','US');
INSERT INTO `BLC_STATE` VALUES ('AP','ARMED FORCES PACIFIC','US');
INSERT INTO `BLC_STATE` VALUES ('AR','ARKANSAS','US');
INSERT INTO `BLC_STATE` VALUES ('AS','AMERICAN SAMOA','US');
INSERT INTO `BLC_STATE` VALUES ('AZ','ARIZONA','US');
INSERT INTO `BLC_STATE` VALUES ('BC','BRITISH COLUMBIA','CA');
INSERT INTO `BLC_STATE` VALUES ('CA','CALIFORNIA','US');
INSERT INTO `BLC_STATE` VALUES ('CO','COLORADO','US');
INSERT INTO `BLC_STATE` VALUES ('CT','CONNECTICUT','US');
INSERT INTO `BLC_STATE` VALUES ('DC','DISTRICT OF COLUMBIA','US');
INSERT INTO `BLC_STATE` VALUES ('DE','DELAWARE','US');
INSERT INTO `BLC_STATE` VALUES ('FL','FLORIDA','US');
INSERT INTO `BLC_STATE` VALUES ('FM','FEDERATED STATES OF MICRONESIA','US');
INSERT INTO `BLC_STATE` VALUES ('GA','GEORGIA','US');
INSERT INTO `BLC_STATE` VALUES ('GU','GUAM','US');
INSERT INTO `BLC_STATE` VALUES ('HI','HAWAII','US');
INSERT INTO `BLC_STATE` VALUES ('IA','IOWA','US');
INSERT INTO `BLC_STATE` VALUES ('ID','IDAHO','US');
INSERT INTO `BLC_STATE` VALUES ('IL','ILLINOIS','US');
INSERT INTO `BLC_STATE` VALUES ('IN','INDIANA','US');
INSERT INTO `BLC_STATE` VALUES ('KS','KANSAS','US');
INSERT INTO `BLC_STATE` VALUES ('KY','KENTUCKY','US');
INSERT INTO `BLC_STATE` VALUES ('LA','LOUISIANA','US');
INSERT INTO `BLC_STATE` VALUES ('MA','MASSACHUSETTS','US');
INSERT INTO `BLC_STATE` VALUES ('MB','MANITOBA','CA');
INSERT INTO `BLC_STATE` VALUES ('MD','MARYLAND','US');
INSERT INTO `BLC_STATE` VALUES ('ME','MAINE','US');
INSERT INTO `BLC_STATE` VALUES ('MH','MARSHALL ISLANDS','US');
INSERT INTO `BLC_STATE` VALUES ('MI','MICHIGAN','US');
INSERT INTO `BLC_STATE` VALUES ('MN','MINNESOTA','US');
INSERT INTO `BLC_STATE` VALUES ('MO','MISSOURI','US');
INSERT INTO `BLC_STATE` VALUES ('MP','NORTHERN MARIANA ISLANDS','US');
INSERT INTO `BLC_STATE` VALUES ('MS','MISSISSIPPI','US');
INSERT INTO `BLC_STATE` VALUES ('MT','MONTANA','US');
INSERT INTO `BLC_STATE` VALUES ('NB','NEW BRUNSWICK','CA');
INSERT INTO `BLC_STATE` VALUES ('NC','NORTH CAROLINA','US');
INSERT INTO `BLC_STATE` VALUES ('ND','NORTH DAKOTA','US');
INSERT INTO `BLC_STATE` VALUES ('NE','NEBRASKA','US');
INSERT INTO `BLC_STATE` VALUES ('NH','NEW HAMPSHIRE','US');
INSERT INTO `BLC_STATE` VALUES ('NJ','NEW JERSEY','US');
INSERT INTO `BLC_STATE` VALUES ('NL','NEWFOUNDLAND','CA');
INSERT INTO `BLC_STATE` VALUES ('NM','NEW MEXICO','US');
INSERT INTO `BLC_STATE` VALUES ('NS','NOVA SCOTIA','CA');
INSERT INTO `BLC_STATE` VALUES ('NT','NORTHWEST TERRITORIES','CA');
INSERT INTO `BLC_STATE` VALUES ('NU','NUNAVUT','CA');
INSERT INTO `BLC_STATE` VALUES ('NV','NEVADA','US');
INSERT INTO `BLC_STATE` VALUES ('NY','NEW YORK','US');
INSERT INTO `BLC_STATE` VALUES ('OH','OHIO','US');
INSERT INTO `BLC_STATE` VALUES ('OK','OKLAHOMA','US');
INSERT INTO `BLC_STATE` VALUES ('ON','ONTARIO','CA');
INSERT INTO `BLC_STATE` VALUES ('OR','OREGON','US');
INSERT INTO `BLC_STATE` VALUES ('PA','PENNSYLVANIA','US');
INSERT INTO `BLC_STATE` VALUES ('PE','PRINCE EDWARD ISLAND','CA');
INSERT INTO `BLC_STATE` VALUES ('PR','PUERTO RICO','US');
INSERT INTO `BLC_STATE` VALUES ('PW','PALAU','US');
INSERT INTO `BLC_STATE` VALUES ('QC','QUEBEC','CA');
INSERT INTO `BLC_STATE` VALUES ('RI','RHODE ISLAND','US');
INSERT INTO `BLC_STATE` VALUES ('SC','SOUTH CAROLINA','US');
INSERT INTO `BLC_STATE` VALUES ('SD','SOUTH DAKOTA','US');
INSERT INTO `BLC_STATE` VALUES ('SK','SASKATCHEWAN','CA');
INSERT INTO `BLC_STATE` VALUES ('TN','TENNESSEE','US');
INSERT INTO `BLC_STATE` VALUES ('TX','TEXAS','US');
INSERT INTO `BLC_STATE` VALUES ('UT','UTAH','US');
INSERT INTO `BLC_STATE` VALUES ('VA','VIRGINIA','US');
INSERT INTO `BLC_STATE` VALUES ('VI','VIRGIN ISLANDS','US');
INSERT INTO `BLC_STATE` VALUES ('VT','VERMONT','US');
INSERT INTO `BLC_STATE` VALUES ('WA','WASHINGTON','US');
INSERT INTO `BLC_STATE` VALUES ('WI','WISCONSIN','US');
INSERT INTO `BLC_STATE` VALUES ('WV','WEST VIRGINIA','US');
INSERT INTO `BLC_STATE` VALUES ('WY','WYOMING','US');
INSERT INTO `BLC_STATE` VALUES ('YT','YUKON','CA');
/*!40000 ALTER TABLE `BLC_STATE` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `BLC_STATIC_ASSET`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BLC_STATIC_ASSET` (
  `STATIC_ASSET_ID` bigint(20) NOT NULL,
  `ALT_TEXT` varchar(255) DEFAULT NULL,
  `FILE_EXTENSION` varchar(255) DEFAULT NULL,
  `FILE_SIZE` bigint(20) DEFAULT NULL,
  `FULL_URL` varchar(255) NOT NULL,
  `MIME_TYPE` varchar(255) DEFAULT NULL,
  `NAME` varchar(255) NOT NULL,
  `STORAGE_TYPE` varchar(255) DEFAULT NULL,
  `TITLE` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`STATIC_ASSET_ID`),
  KEY `ASST_FULL_URL_INDX` (`FULL_URL`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `BLC_STATIC_ASSET` WRITE;
/*!40000 ALTER TABLE `BLC_STATIC_ASSET` DISABLE KEYS */;
INSERT INTO `BLC_STATIC_ASSET` VALUES (-2005,NULL,NULL,NULL,'/img/banners/shirts-speciale.jpg','image/jpg','Shirts Speciale','FILESYSTEM',NULL);
INSERT INTO `BLC_STATIC_ASSET` VALUES (-2004,NULL,NULL,NULL,'/img/banners/shirt-special.jpg','image/jpg','Shirt Special','FILESYSTEM',NULL);
INSERT INTO `BLC_STATIC_ASSET` VALUES (-2003,NULL,NULL,NULL,'/img/banners/promocion-camisas.jpg','image/jpg','Promocion Camisas','FILESYSTEM',NULL);
INSERT INTO `BLC_STATIC_ASSET` VALUES (-2002,NULL,NULL,NULL,'/img/banners/member-special.jpg','image/jpg','Member Special','FILESYSTEM',NULL);
INSERT INTO `BLC_STATIC_ASSET` VALUES (-2001,NULL,NULL,NULL,'/img/banners/buy-two-get-one.jpg','image/jpg','Buy Two Get One','FILESYSTEM',NULL);
INSERT INTO `BLC_STATIC_ASSET` VALUES (-2000,NULL,NULL,NULL,'/img/banners/buy-one-get-one-home-banner.jpg','image/jpg','Buy One Get One','FILESYSTEM',NULL);
INSERT INTO `BLC_STATIC_ASSET` VALUES (101,NULL,NULL,NULL,'/img/sauces/Sudden-Death-Sauce-Bottle.jpg','image/jpg','Sudden Death Sauce Bottle','FILESYSTEM',NULL);
INSERT INTO `BLC_STATIC_ASSET` VALUES (102,NULL,NULL,NULL,'/img/sauces/Sudden-Death-Sauce-Close.jpg','image/jpg','Sudden Death Sauce Close-up','FILESYSTEM',NULL);
INSERT INTO `BLC_STATIC_ASSET` VALUES (201,NULL,NULL,NULL,'/img/sauces/Sweet-Death-Sauce-Bottle.jpg','image/jpg','Sweet Death Sauce Bottle','FILESYSTEM',NULL);
INSERT INTO `BLC_STATIC_ASSET` VALUES (202,NULL,NULL,NULL,'/img/sauces/Sweet-Death-Sauce-Close.jpg','image/jpg','Sweet Death Sauce Close-up','FILESYSTEM',NULL);
INSERT INTO `BLC_STATIC_ASSET` VALUES (203,NULL,NULL,NULL,'/img/sauces/Sweet-Death-Sauce-Skull.jpg','image/jpg','Sweet Death Sauce Close-up','FILESYSTEM',NULL);
INSERT INTO `BLC_STATIC_ASSET` VALUES (204,NULL,NULL,NULL,'/img/sauces/Sweet-Death-Sauce-Tile.jpg','image/jpg','Sweet Death Sauce Close-up','FILESYSTEM',NULL);
INSERT INTO `BLC_STATIC_ASSET` VALUES (205,NULL,NULL,NULL,'/img/sauces/Sweet-Death-Sauce-Grass.jpg','image/jpg','Sweet Death Sauce Close-up','FILESYSTEM',NULL);
INSERT INTO `BLC_STATIC_ASSET` VALUES (206,NULL,NULL,NULL,'/img/sauces/Sweet-Death-Sauce-Logo.jpg','image/jpg','Sweet Death Sauce Close-up','FILESYSTEM',NULL);
INSERT INTO `BLC_STATIC_ASSET` VALUES (301,NULL,NULL,NULL,'/img/sauces/Hoppin-Hot-Sauce-Bottle.jpg','image/jpg','Hoppin Hot Sauce Bottle','FILESYSTEM',NULL);
INSERT INTO `BLC_STATIC_ASSET` VALUES (302,NULL,NULL,NULL,'/img/sauces/Hoppin-Hot-Sauce-Close.jpg','image/jpg','Hoppin Hot Sauce Close-up','FILESYSTEM',NULL);
INSERT INTO `BLC_STATIC_ASSET` VALUES (401,NULL,NULL,NULL,'/img/sauces/Day-of-the-Dead-Chipotle-Hot-Sauce-Bottle.jpg','image/jpg','Day of the Dead Chipotle Hot Sauce Bottle','FILESYSTEM',NULL);
INSERT INTO `BLC_STATIC_ASSET` VALUES (402,NULL,NULL,NULL,'/img/sauces/Day-of-the-Dead-Chipotle-Hot-Sauce-Close.jpg','image/jpg','Day of the Dead Chipotle Hot Sauce Close-up','FILESYSTEM',NULL);
INSERT INTO `BLC_STATIC_ASSET` VALUES (501,NULL,NULL,NULL,'/img/sauces/Day-of-the-Dead-Habanero-Hot-Sauce-Bottle.jpg','image/jpg','Day of the Dead Habanero Hot Sauce Bottle','FILESYSTEM',NULL);
INSERT INTO `BLC_STATIC_ASSET` VALUES (502,NULL,NULL,NULL,'/img/sauces/Day-of-the-Dead-Habanero-Hot-Sauce-Close.jpg','image/jpg','Day of the Dead Habanero Hot Sauce Close-up','FILESYSTEM',NULL);
INSERT INTO `BLC_STATIC_ASSET` VALUES (601,NULL,NULL,NULL,'/img/sauces/Day-of-the-Dead-Scotch-Bonnet-Hot-Sauce-Bottle.jpg','image/jpg','Day of the Dead Scotch Bonnet Hot Sauce Bottle','FILESYSTEM',NULL);
INSERT INTO `BLC_STATIC_ASSET` VALUES (602,NULL,NULL,NULL,'/img/sauces/Day-of-the-Dead-Scotch-Bonnet-Hot-Sauce-Close.jpg','image/jpg','Day of the Dead Scotch Bonnet Hot Sauce Close-up','FILESYSTEM',NULL);
INSERT INTO `BLC_STATIC_ASSET` VALUES (701,NULL,NULL,NULL,'/img/sauces/Green-Ghost-Bottle.jpg','image/jpg','Green Ghost Bottle','FILESYSTEM',NULL);
INSERT INTO `BLC_STATIC_ASSET` VALUES (702,NULL,NULL,NULL,'/img/sauces/Green-Ghost-Close.jpg','image/jpg','Green Ghost Close-up','FILESYSTEM',NULL);
INSERT INTO `BLC_STATIC_ASSET` VALUES (801,NULL,NULL,NULL,'/img/sauces/Blazin-Saddle-XXX-Hot-Habanero-Pepper-Sauce-Bottle.jpg','image/jpg','Blazin Saddle XXX Hot Habanero Pepper Sauce Bottle','FILESYSTEM',NULL);
INSERT INTO `BLC_STATIC_ASSET` VALUES (802,NULL,NULL,NULL,'/img/sauces/Blazin-Saddle-XXX-Hot-Habanero-Pepper-Sauce-Close.jpg','image/jpg','Blazin Saddle XXX Hot Habanero Pepper Sauce Close-up','FILESYSTEM',NULL);
INSERT INTO `BLC_STATIC_ASSET` VALUES (901,NULL,NULL,NULL,'/img/sauces/Armageddon-The-Hot-Sauce-To-End-All-Bottle.jpg','image/jpg','Armageddon The Hot Sauce To End All Bottle','FILESYSTEM',NULL);
INSERT INTO `BLC_STATIC_ASSET` VALUES (902,NULL,NULL,NULL,'/img/sauces/Armageddon-The-Hot-Sauce-To-End-All-Close.jpg','image/jpg','Armageddon The Hot Sauce To End All Close-up','FILESYSTEM',NULL);
INSERT INTO `BLC_STATIC_ASSET` VALUES (1001,NULL,NULL,NULL,'/img/sauces/Dr.-Chilemeisters-Insane-Hot-Sauce-Bottle.jpg','image/jpg','Dr. Chilemeisters Insane Hot Sauce Bottle','FILESYSTEM',NULL);
INSERT INTO `BLC_STATIC_ASSET` VALUES (1002,NULL,NULL,NULL,'/img/sauces/Dr.-Chilemeisters-Insane-Hot-Sauce-Close.jpg','image/jpg','Dr. Chilemeisters Insane Hot Sauce Close-up','FILESYSTEM',NULL);
INSERT INTO `BLC_STATIC_ASSET` VALUES (1101,NULL,NULL,NULL,'/img/sauces/Bull-Snort-Cowboy-Cayenne-Pepper-Hot-Sauce-Bottle.jpg','image/jpg','Bull Snort Cowboy Cayenne Pepper Hot Sauce Bottle','FILESYSTEM',NULL);
INSERT INTO `BLC_STATIC_ASSET` VALUES (1102,NULL,NULL,NULL,'/img/sauces/Bull-Snort-Cowboy-Cayenne-Pepper-Hot-Sauce-Close.jpg','image/jpg','Bull Snort Cowboy Cayenne Pepper Hot Sauce Close-up','FILESYSTEM',NULL);
INSERT INTO `BLC_STATIC_ASSET` VALUES (1201,NULL,NULL,NULL,'/img/sauces/Cafe-Louisiane-Sweet-Cajun-Blackening-Sauce-Bottle.jpg','image/jpg','Cafe Louisiane Sweet Cajun Blackening Sauce Bottle','FILESYSTEM',NULL);
INSERT INTO `BLC_STATIC_ASSET` VALUES (1202,NULL,NULL,NULL,'/img/sauces/Cafe-Louisiane-Sweet-Cajun-Blackening-Sauce-Close.jpg','image/jpg','Cafe Louisiane Sweet Cajun Blackening Sauce Close-up','FILESYSTEM',NULL);
INSERT INTO `BLC_STATIC_ASSET` VALUES (1301,NULL,NULL,NULL,'/img/sauces/Bull-Snort-Smokin-Toncils-Hot-Sauce-Bottle.jpg','image/jpg','Bull Snort Smokin Toncils Hot Sauce Bottle','FILESYSTEM',NULL);
INSERT INTO `BLC_STATIC_ASSET` VALUES (1302,NULL,NULL,NULL,'/img/sauces/Bull-Snort-Smokin-Toncils-Hot-Sauce-Close.jpg','image/jpg','Bull Snort Smokin Toncils Hot Sauce Close-up','FILESYSTEM',NULL);
INSERT INTO `BLC_STATIC_ASSET` VALUES (1401,NULL,NULL,NULL,'/img/sauces/Cool-Cayenne-Pepper-Hot-Sauce-Bottle.jpg','image/jpg','Cool Cayenne Pepper Hot Sauce Bottle','FILESYSTEM',NULL);
INSERT INTO `BLC_STATIC_ASSET` VALUES (1402,NULL,NULL,NULL,'/img/sauces/Cool-Cayenne-Pepper-Hot-Sauce-Close.jpg','image/jpg','Cool Cayenne Pepper Hot Sauce Close-up','FILESYSTEM',NULL);
INSERT INTO `BLC_STATIC_ASSET` VALUES (1501,NULL,NULL,NULL,'/img/sauces/Roasted-Garlic-Hot-Sauce-Bottle.jpg','image/jpg','Roasted Garlic Hot Sauce Bottle','FILESYSTEM',NULL);
INSERT INTO `BLC_STATIC_ASSET` VALUES (1502,NULL,NULL,NULL,'/img/sauces/Roasted-Garlic-Hot-Sauce-Close.jpg','image/jpg','Roasted Garlic Hot Sauce Close-up','FILESYSTEM',NULL);
INSERT INTO `BLC_STATIC_ASSET` VALUES (1601,NULL,NULL,NULL,'/img/sauces/Scotch-Bonnet-Hot-Sauce-Bottle.jpg','image/jpg','Scotch Bonnet Hot Sauce Bottle','FILESYSTEM',NULL);
INSERT INTO `BLC_STATIC_ASSET` VALUES (1602,NULL,NULL,NULL,'/img/sauces/Scotch-Bonnet-Hot-Sauce-Close.jpg','image/jpg','Scotch Bonnet Hot Sauce Close-up','FILESYSTEM',NULL);
INSERT INTO `BLC_STATIC_ASSET` VALUES (1701,NULL,NULL,NULL,'/img/sauces/Insanity-Sauce-Bottle.jpg','image/jpg','Insanity Sauce Bottle','FILESYSTEM',NULL);
INSERT INTO `BLC_STATIC_ASSET` VALUES (1702,NULL,NULL,NULL,'/img/sauces/Insanity-Sauce-Close.jpg','image/jpg','Insanity Sauce Close-up','FILESYSTEM',NULL);
INSERT INTO `BLC_STATIC_ASSET` VALUES (1801,NULL,NULL,NULL,'/img/sauces/Hurtin-Jalepeno-Hot-Sauce-Bottle.jpg','image/jpg','Hurtin Jalepeno Hot Sauce Bottle','FILESYSTEM',NULL);
INSERT INTO `BLC_STATIC_ASSET` VALUES (1802,NULL,NULL,NULL,'/img/sauces/Hurtin-Jalepeno-Hot-Sauce-Close.jpg','image/jpg','Hurtin Jalepeno Hot Sauce Close-up','FILESYSTEM',NULL);
INSERT INTO `BLC_STATIC_ASSET` VALUES (1901,NULL,NULL,NULL,'/img/sauces/Roasted-Red-Pepper-and-Chipotle-Hot-Sauce-Bottle.jpg','image/jpg','Roasted Red Pepper and Chipotle Hot Sauce Bottle','FILESYSTEM',NULL);
INSERT INTO `BLC_STATIC_ASSET` VALUES (1902,NULL,NULL,NULL,'/img/sauces/Roasted-Red-Pepper-and-Chipotle-Hot-Sauce-Close.jpg','image/jpg','Roasted Red Pepper and Chipotle Hot Sauce Close-up','FILESYSTEM',NULL);
INSERT INTO `BLC_STATIC_ASSET` VALUES (10001,NULL,NULL,NULL,'/img/merch/habanero_mens_black.jpg','image/jpg','Hawt Like a Habanero Men\'s Black','FILESYSTEM',NULL);
INSERT INTO `BLC_STATIC_ASSET` VALUES (10002,NULL,NULL,NULL,'/img/merch/habanero_mens_red.jpg','image/jpg','Hawt Like a Habanero Men\'s Red','FILESYSTEM',NULL);
INSERT INTO `BLC_STATIC_ASSET` VALUES (10003,NULL,NULL,NULL,'/img/merch/habanero_mens_silver.jpg','image/jpg','Hawt Like a Habanero Men\'s Silver','FILESYSTEM',NULL);
INSERT INTO `BLC_STATIC_ASSET` VALUES (20001,NULL,NULL,NULL,'/img/merch/habanero_womens_black.jpg','image/jpg','Hawt Like a Habanero Women\'s Black','FILESYSTEM',NULL);
INSERT INTO `BLC_STATIC_ASSET` VALUES (20002,NULL,NULL,NULL,'/img/merch/habanero_womens_red.jpg','image/jpg','Hawt Like a Habanero Women\'s Red','FILESYSTEM',NULL);
INSERT INTO `BLC_STATIC_ASSET` VALUES (20003,NULL,NULL,NULL,'/img/merch/habanero_womens_silver.jpg','image/jpg','Hawt Like a Habanero Women\'s Silver','FILESYSTEM',NULL);
INSERT INTO `BLC_STATIC_ASSET` VALUES (30001,NULL,NULL,NULL,'/img/merch/heat_clinic_handdrawn_mens_black.jpg','image/jpg','Heat Clinic Hand-Drawn Men\'s Black','FILESYSTEM',NULL);
INSERT INTO `BLC_STATIC_ASSET` VALUES (30002,NULL,NULL,NULL,'/img/merch/heat_clinic_handdrawn_mens_red.jpg','image/jpg','Heat Clinic Hand-Drawn Men\'s Red','FILESYSTEM',NULL);
INSERT INTO `BLC_STATIC_ASSET` VALUES (30003,NULL,NULL,NULL,'/img/merch/heat_clinic_handdrawn_mens_silver.jpg','image/jpg','Heat Clinic Hand-Drawn Men\'s Silver','FILESYSTEM',NULL);
INSERT INTO `BLC_STATIC_ASSET` VALUES (40001,NULL,NULL,NULL,'/img/merch/heat_clinic_handdrawn_womens_black.jpg','image/jpg','Heat Clinic Hand-Drawn Women\'s Black','FILESYSTEM',NULL);
INSERT INTO `BLC_STATIC_ASSET` VALUES (40002,NULL,NULL,NULL,'/img/merch/heat_clinic_handdrawn_womens_red.jpg','image/jpg','Heat Clinic Hand-Drawn Women\'s Red','FILESYSTEM',NULL);
INSERT INTO `BLC_STATIC_ASSET` VALUES (40003,NULL,NULL,NULL,'/img/merch/heat_clinic_handdrawn_womens_silver.jpg','image/jpg','Heat Clinic Hand-Drawn Women\'s Silver','FILESYSTEM',NULL);
INSERT INTO `BLC_STATIC_ASSET` VALUES (50001,NULL,NULL,NULL,'/img/merch/heat_clinic_mascot_mens_black.jpg','image/jpg','Heat Clinic Mascot Men\'s Black','FILESYSTEM',NULL);
INSERT INTO `BLC_STATIC_ASSET` VALUES (50002,NULL,NULL,NULL,'/img/merch/heat_clinic_mascot_mens_red.jpg','image/jpg','Heat Clinic Mascot Men\'s Red','FILESYSTEM',NULL);
INSERT INTO `BLC_STATIC_ASSET` VALUES (50003,NULL,NULL,NULL,'/img/merch/heat_clinic_mascot_mens_silver.jpg','image/jpg','Heat Clinic Mascot Men\'s Silver','FILESYSTEM',NULL);
INSERT INTO `BLC_STATIC_ASSET` VALUES (60001,NULL,NULL,NULL,'/img/merch/heat_clinic_mascot_womens_black.jpg','image/jpg','Heat Clinic Mascot Women\'s Black','FILESYSTEM',NULL);
INSERT INTO `BLC_STATIC_ASSET` VALUES (60002,NULL,NULL,NULL,'/img/merch/heat_clinic_mascot_womens_red.jpg','image/jpg','Heat Clinic Mascot Women\'s Red','FILESYSTEM',NULL);
INSERT INTO `BLC_STATIC_ASSET` VALUES (60003,NULL,NULL,NULL,'/img/merch/heat_clinic_mascot_womens_silver.jpg','image/jpg','Heat Clinic Mascot Women\'s Silver','FILESYSTEM',NULL);
/*!40000 ALTER TABLE `BLC_STATIC_ASSET` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `BLC_STATIC_ASSET_DESC`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BLC_STATIC_ASSET_DESC` (
  `STATIC_ASSET_DESC_ID` bigint(20) NOT NULL,
  `DESCRIPTION` varchar(255) DEFAULT NULL,
  `LONG_DESCRIPTION` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`STATIC_ASSET_DESC_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `BLC_STATIC_ASSET_DESC` WRITE;
/*!40000 ALTER TABLE `BLC_STATIC_ASSET_DESC` DISABLE KEYS */;
/*!40000 ALTER TABLE `BLC_STATIC_ASSET_DESC` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `BLC_STATIC_ASSET_STRG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BLC_STATIC_ASSET_STRG` (
  `STATIC_ASSET_STRG_ID` bigint(20) NOT NULL,
  `FILE_DATA` longblob,
  `STATIC_ASSET_ID` bigint(20) NOT NULL,
  PRIMARY KEY (`STATIC_ASSET_STRG_ID`),
  KEY `STATIC_ASSET_ID_INDEX` (`STATIC_ASSET_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `BLC_STATIC_ASSET_STRG` WRITE;
/*!40000 ALTER TABLE `BLC_STATIC_ASSET_STRG` DISABLE KEYS */;
/*!40000 ALTER TABLE `BLC_STATIC_ASSET_STRG` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `BLC_STORE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BLC_STORE` (
  `STORE_ID` bigint(20) NOT NULL,
  `ARCHIVED` char(1) DEFAULT NULL,
  `LATITUDE` double DEFAULT NULL,
  `LONGITUDE` double DEFAULT NULL,
  `STORE_NAME` varchar(255) NOT NULL,
  `STORE_OPEN` bit(1) DEFAULT NULL,
  `STORE_HOURS` varchar(255) DEFAULT NULL,
  `STORE_NUMBER` varchar(255) DEFAULT NULL,
  `ADDRESS_ID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`STORE_ID`),
  KEY `FKg65fln1wkn5rai85klf8ei1uy` (`ADDRESS_ID`),
  CONSTRAINT `FKg65fln1wkn5rai85klf8ei1uy` FOREIGN KEY (`ADDRESS_ID`) REFERENCES `BLC_ADDRESS` (`ADDRESS_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `BLC_STORE` WRITE;
/*!40000 ALTER TABLE `BLC_STORE` DISABLE KEYS */;
/*!40000 ALTER TABLE `BLC_STORE` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `BLC_SYSTEM_PROPERTY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BLC_SYSTEM_PROPERTY` (
  `BLC_SYSTEM_PROPERTY_ID` bigint(20) NOT NULL,
  `FRIENDLY_GROUP` varchar(255) DEFAULT NULL,
  `FRIENDLY_NAME` varchar(255) DEFAULT NULL,
  `FRIENDLY_TAB` varchar(255) DEFAULT NULL,
  `PROPERTY_NAME` varchar(255) NOT NULL,
  `OVERRIDE_GENERATED_PROP_NAME` bit(1) DEFAULT NULL,
  `PROPERTY_TYPE` varchar(255) DEFAULT NULL,
  `PROPERTY_VALUE` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`BLC_SYSTEM_PROPERTY_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `BLC_SYSTEM_PROPERTY` WRITE;
/*!40000 ALTER TABLE `BLC_SYSTEM_PROPERTY` DISABLE KEYS */;
/*!40000 ALTER TABLE `BLC_SYSTEM_PROPERTY` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `BLC_TAR_CRIT_OFFER_XREF`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BLC_TAR_CRIT_OFFER_XREF` (
  `OFFER_TAR_CRIT_ID` bigint(20) NOT NULL,
  `OFFER_ID` bigint(20) NOT NULL,
  `OFFER_ITEM_CRITERIA_ID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`OFFER_TAR_CRIT_ID`),
  KEY `FK5n28fyhs3hvqqn38rap5yns9i` (`OFFER_ID`),
  KEY `FKj44eau35bu6hfq5w53civq01y` (`OFFER_ITEM_CRITERIA_ID`),
  CONSTRAINT `FK5n28fyhs3hvqqn38rap5yns9i` FOREIGN KEY (`OFFER_ID`) REFERENCES `BLC_OFFER` (`OFFER_ID`),
  CONSTRAINT `FKj44eau35bu6hfq5w53civq01y` FOREIGN KEY (`OFFER_ITEM_CRITERIA_ID`) REFERENCES `BLC_OFFER_ITEM_CRITERIA` (`OFFER_ITEM_CRITERIA_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `BLC_TAR_CRIT_OFFER_XREF` WRITE;
/*!40000 ALTER TABLE `BLC_TAR_CRIT_OFFER_XREF` DISABLE KEYS */;
INSERT INTO `BLC_TAR_CRIT_OFFER_XREF` VALUES (-100,1,1);
/*!40000 ALTER TABLE `BLC_TAR_CRIT_OFFER_XREF` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `BLC_TAX_DETAIL`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BLC_TAX_DETAIL` (
  `TAX_DETAIL_ID` bigint(20) NOT NULL,
  `AMOUNT` decimal(19,5) DEFAULT NULL,
  `TAX_COUNTRY` varchar(255) DEFAULT NULL,
  `JURISDICTION_NAME` varchar(255) DEFAULT NULL,
  `RATE` decimal(19,5) DEFAULT NULL,
  `TAX_REGION` varchar(255) DEFAULT NULL,
  `TAX_NAME` varchar(255) DEFAULT NULL,
  `TYPE` varchar(255) DEFAULT NULL,
  `CURRENCY_CODE` varchar(255) DEFAULT NULL,
  `MODULE_CONFIG_ID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`TAX_DETAIL_ID`),
  KEY `FK7rwcm52210yymslbjj8m25cvi` (`CURRENCY_CODE`),
  KEY `FK53heksajqlpbnfd8yrbudum8a` (`MODULE_CONFIG_ID`),
  CONSTRAINT `FK53heksajqlpbnfd8yrbudum8a` FOREIGN KEY (`MODULE_CONFIG_ID`) REFERENCES `BLC_MODULE_CONFIGURATION` (`MODULE_CONFIG_ID`),
  CONSTRAINT `FK7rwcm52210yymslbjj8m25cvi` FOREIGN KEY (`CURRENCY_CODE`) REFERENCES `BLC_CURRENCY` (`CURRENCY_CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `BLC_TAX_DETAIL` WRITE;
/*!40000 ALTER TABLE `BLC_TAX_DETAIL` DISABLE KEYS */;
/*!40000 ALTER TABLE `BLC_TAX_DETAIL` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `BLC_TRANSLATION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BLC_TRANSLATION` (
  `TRANSLATION_ID` bigint(20) NOT NULL,
  `ENTITY_ID` varchar(255) DEFAULT NULL,
  `ENTITY_TYPE` varchar(255) DEFAULT NULL,
  `FIELD_NAME` varchar(255) DEFAULT NULL,
  `LOCALE_CODE` varchar(255) DEFAULT NULL,
  `TRANSLATED_VALUE` longtext,
  PRIMARY KEY (`TRANSLATION_ID`),
  KEY `TRANSLATION_INDEX` (`ENTITY_TYPE`,`ENTITY_ID`,`FIELD_NAME`,`LOCALE_CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `BLC_TRANSLATION` WRITE;
/*!40000 ALTER TABLE `BLC_TRANSLATION` DISABLE KEYS */;
INSERT INTO `BLC_TRANSLATION` VALUES (-1003,'3','Page','pageTemplate|body','es','<h2 style=\"text-align:center;\">Este es un ejemplo de una p&aacute;gina de contenido-manejado.</h2>');
INSERT INTO `BLC_TRANSLATION` VALUES (-1002,'2','Page','pageTemplate|body','es','<h2 style=\"text-align:center;\">Este es un ejemplo de una p&aacute;gina de contenido-manejado.</h2><h4 style=\"text-align:center;\">Haga <a href=\"http://www.broadleafcommerce.com/features/content\">click aqu&iacute;</a> para mas informaci&oacute;n.</h4>');
INSERT INTO `BLC_TRANSLATION` VALUES (-1001,'1','Page','pageTemplate|body','es','prueba de contenido');
INSERT INTO `BLC_TRANSLATION` VALUES (-1000,'1','Page','pageTemplate|title','es','Espa&ntilde;ol G&eacute;nerico');
INSERT INTO `BLC_TRANSLATION` VALUES (-398,'6','MenuItem','label','fr','FAQ');
INSERT INTO `BLC_TRANSLATION` VALUES (-397,'5','MenuItem','label','fr','Nouveau Hot Sauce?');
INSERT INTO `BLC_TRANSLATION` VALUES (-396,'3','FulfillmentOption','longDescription','fr','1 - 2 Journ&eacute;es');
INSERT INTO `BLC_TRANSLATION` VALUES (-395,'3','FulfillmentOption','name','fr','Express');
INSERT INTO `BLC_TRANSLATION` VALUES (-394,'2','FulfillmentOption','longDescription','fr','3 - 5 Journ&eacute;es');
INSERT INTO `BLC_TRANSLATION` VALUES (-393,'2','FulfillmentOption','name','fr','Priorit&eacute;');
INSERT INTO `BLC_TRANSLATION` VALUES (-392,'1','FulfillmentOption','longDescription','fr','5 - 7 Journ&eacute;es');
INSERT INTO `BLC_TRANSLATION` VALUES (-391,'1','FulfillmentOption','name','fr','Norme');
INSERT INTO `BLC_TRANSLATION` VALUES (-382,'3','SearchFacet','label','fr','Prix');
INSERT INTO `BLC_TRANSLATION` VALUES (-381,'2','SearchFacet','label','fr','Degr&eacute; de chaleur');
INSERT INTO `BLC_TRANSLATION` VALUES (-380,'1','SearchFacet','label','fr','Fabricant');
INSERT INTO `BLC_TRANSLATION` VALUES (-300,'600','Sku','longDescription','fr','Avez-vous pas juste notre mascotte? Obtenez votre chemise propre aujourd\'hui!');
INSERT INTO `BLC_TRANSLATION` VALUES (-299,'600','Sku','name','fr','Mascot Clinique chaleur (Femmes)');
INSERT INTO `BLC_TRANSLATION` VALUES (-298,'500','Sku','longDescription','fr','Avez-vous pas juste notre mascotte? Obtenez votre chemise propre aujourd\'hui!');
INSERT INTO `BLC_TRANSLATION` VALUES (-297,'500','Sku','name','fr','Mascot Clinique chaleur (Hommes)');
INSERT INTO `BLC_TRANSLATION` VALUES (-296,'400','Sku','longDescription','fr','Ce t-shirt logo dessin&eacute; &agrave; la main pour les femmes dispose d\'une coupe r&eacute;guli&egrave;re en trois couleurs diff&eacute;rentes.');
INSERT INTO `BLC_TRANSLATION` VALUES (-295,'400','Sku','name','fr','Clinique de chaleur tir&eacute; par la main (Femmes)');
INSERT INTO `BLC_TRANSLATION` VALUES (-294,'300','Sku','longDescription','fr','Ce t-shirt logo dessin&eacute; &agrave; la main pour les hommes dispose d\'une coupe r&eacute;guli&egrave;re en trois couleurs diff&eacute;rentes.');
INSERT INTO `BLC_TRANSLATION` VALUES (-293,'300','Sku','name','fr','Clinique de chaleur tir&eacute; par la main (Hommes)');
INSERT INTO `BLC_TRANSLATION` VALUES (-292,'200','Sku','longDescription','fr','Collecte de femmes Habanero standards chemise &agrave; manches courtes shirt s&eacute;rigraphi&eacute; &agrave; 30 coton doux singles en coupe regular.');
INSERT INTO `BLC_TRANSLATION` VALUES (-291,'200','Sku','name','fr','Hawt comme une chemise Habanero (Femmes)');
INSERT INTO `BLC_TRANSLATION` VALUES (-290,'100','Sku','longDescription','fr','Collecte Hommes Habanero standards chemise &agrave; manches courtes t s&eacute;rigraphi&eacute;es en 30 coton doux singles en coupe regular.');
INSERT INTO `BLC_TRANSLATION` VALUES (-289,'100','Sku','name','fr','Hawt comme une chemise Habanero (Hommes)');
INSERT INTO `BLC_TRANSLATION` VALUES (-288,'19','Sku','longDescription','fr','Cette sauce tire sa saveur des poivrons grand &acirc;ge et le vinaigre de canne. Il permettra d\'am&eacute;liorer la saveur de la plupart de n\'importe quel repas.');
INSERT INTO `BLC_TRANSLATION` VALUES (-287,'19','Sku','name','fr','Sauce chaudes Chipotle');
INSERT INTO `BLC_TRANSLATION` VALUES (-286,'18','Sku','longDescription','fr','Cette sauce tire sa saveur des poivrons grand &acirc;ge et le vinaigre de canne. Il permettra d\'am&eacute;liorer la saveur de la plupart de n\'importe quel repas.');
INSERT INTO `BLC_TRANSLATION` VALUES (-285,'18','Sku','name','fr','Sauces chaudes Jalapeno');
INSERT INTO `BLC_TRANSLATION` VALUES (-284,'17','Sku','longDescription','fr','Cette sauce tire sa saveur des poivrons grand &acirc;ge et le vinaigre de canne. Il permettra d\'am&eacute;liorer la saveur de la plupart de n\'importe quel repas.');
INSERT INTO `BLC_TRANSLATION` VALUES (-283,'17','Sku','name','fr','Sauce Scotch Bonnet chaud');
INSERT INTO `BLC_TRANSLATION` VALUES (-282,'16','Sku','longDescription','fr','Cette sauce tire sa saveur des poivrons grand &acirc;ge et le vinaigre de canne. Il permettra d\'am&eacute;liorer la saveur de la plupart de n\'importe quel repas.');
INSERT INTO `BLC_TRANSLATION` VALUES (-281,'16','Sku','name','fr','Sauce Scotch Bonnet chaud');
INSERT INTO `BLC_TRANSLATION` VALUES (-280,'15','Sku','longDescription','fr','Cette sauce tire sa saveur des poivrons grand &acirc;ge et le vinaigre de canne. Il permettra d\'am&eacute;liorer la saveur de la plupart de n\'importe quel repas.');
INSERT INTO `BLC_TRANSLATION` VALUES (-279,'15','Sku','name','fr','Sauce &agrave; l\'ail rôti chaud');
INSERT INTO `BLC_TRANSLATION` VALUES (-278,'14','Sku','longDescription','fr','Cette sauce tire sa saveur des poivrons grand &acirc;ge et le vinaigre de canne. Il permettra d\'am&eacute;liorer la saveur de la plupart de n\'importe quel repas.');
INSERT INTO `BLC_TRANSLATION` VALUES (-277,'14','Sku','name','fr','Frais Poivre de Cayenne Hot Sauce');
INSERT INTO `BLC_TRANSLATION` VALUES (-276,'13','Sku','longDescription','fr','Todo es m&aacute;s grande en Texas, incluso lo picante de la Salsa de Snortin Bull! Tout est plus grand au Texas, m&ecirc;me la brûlure de Hot Sauce une Snortin Bull! douche sur le Texas Steak taille qu\'ils appellent le 96er Ole ou vos l&eacute;gumes Jane avion. Si vous &ecirc;tes un fan sur faire de la sauce barbecue &agrave; partir de z&eacute;ro comme je suis, vous pouvez utiliser la sauce Bull amygdales Snort Smokin \'Hot tant qu\'additif. Red hot habaneros et piments donner &agrave; cette tingler amygdales sa saveur c&eacute;l&egrave;bre et rouge de chaleur chaud. Bull Snort Smokin \'Hot amygdales Sauce\'ll avoir vos entrailles buckin »avec une goutte d\'eau.');
INSERT INTO `BLC_TRANSLATION` VALUES (-275,'13','Sku','name','fr','Bull Snort Smokin \'Hot Sauce Toncils');
INSERT INTO `BLC_TRANSLATION` VALUES (-274,'12','Sku','longDescription','fr','L\'une des sauces les plus insolites que nous vendons. L\'original &eacute;tait un vieux style sauce cajun et c\'est ça le noircissement &agrave; jour de version. C\'est gentil, mais vous obtenez un grand succ&egrave;s de cannelle et de clou de girofle avec un coup de chaleur agr&eacute;able de Cayenne. Utilisez-le sur tous les aliments &agrave; donner cette ambiance cajun.');
INSERT INTO `BLC_TRANSLATION` VALUES (-273,'12','Sku','name','fr','Caf&eacute; Cajun Louisiane Douce Sauce Blackening');
INSERT INTO `BLC_TRANSLATION` VALUES (-272,'11','Sku','longDescription','fr','Been there, encord&eacute;s cela. Hotter than jument buckin \'en chaleur! Saupoudrez de plats de viande, de fruits de mer et l&eacute;gumes. Utilisation comme additif dans une sauce barbecue ou tout aliment qui a besoin d\'une saveur &eacute;pic&eacute;e. Commencez avec quelques gouttes et travailler jusqu\'&agrave; la saveur d&eacute;sir&eacute;e.');
INSERT INTO `BLC_TRANSLATION` VALUES (-271,'11','Sku','name','fr','Bull Snort Cowboy poivre de Cayenne Hot Sauce');
INSERT INTO `BLC_TRANSLATION` VALUES (-270,'10','Sku','longDescription','fr','Voici la prescription pour ceux qui aiment la chaleur intol&eacute;rable. Dr Chilemeister potion de malades et mal mortel doit &ecirc;tre utilis&eacute; avec prudence. La douleur peut devenir une d&eacute;pendance!');
INSERT INTO `BLC_TRANSLATION` VALUES (-269,'10','Sku','name','fr','Dr Chilemeister Sauce Hot Insane');
INSERT INTO `BLC_TRANSLATION` VALUES (-268,'9','Sku','longDescription','fr','Tout l\'enfer se d&eacute;chaîne, le feu et le soufre pleuvoir? se pr&eacute;parer &agrave; rencontrer votre machine?');
INSERT INTO `BLC_TRANSLATION` VALUES (-267,'9','Sku','name','fr','Armageddon Le Hot Sauce To End All');
INSERT INTO `BLC_TRANSLATION` VALUES (-266,'8','Sku','longDescription','fr','Vous misez vos bottes, cette sauce chaude valu son nom de gens qui appr&eacute;cient une sauce chaude exceptionnel. Ce que vous trouverez ici est une saveur piquante vraiment original, pas un piquant irr&eacute;sistible que l\'on retrouve dans les sauces au poivre Tabasco ordinaires - m&ecirc;me si le piment utilis&eacute; dans ce produit a &eacute;t&eacute; test&eacute; &agrave; 285.000 unit&eacute;s Scoville. Alors, en selle pour une balade inoubliable. Pour vous assurer que nous vous avons apport&eacute; la plus belle sauce au poivre de Habanero, nous sommes all&eacute;s aux contreforts des montagnes mayas au Belize, en Am&eacute;rique centrale. Ce produit est pr&eacute;par&eacute; enti&egrave;rement &agrave; la main en utilisant uniquement des l&eacute;gumes frais et de tous les ingr&eacute;dients naturels.');
INSERT INTO `BLC_TRANSLATION` VALUES (-265,'8','Sku','name','fr','Blazin \'Selle XXX Hot Habanero sauce au poivre');
INSERT INTO `BLC_TRANSLATION` VALUES (-264,'7','Sku','longDescription','fr','Fabriqu&eacute; avec Naga Bhut Jolokia, plus chaud poivre dans le monde.');
INSERT INTO `BLC_TRANSLATION` VALUES (-263,'7','Sku','name','fr','Green Ghost');
INSERT INTO `BLC_TRANSLATION` VALUES (-262,'6','Sku','longDescription','fr','Souvent confondu avec le Habanero, le Scotch Bonnet a une pointe profond&eacute;ment invers&eacute;e par rapport &agrave; l\'extr&eacute;mit&eacute; pointue de l\'Habanero. Allant dans de nombreuses couleurs allant du vert au jaune-orange, le Scotch Bonnet est un aliment de base dans les Antilles et sauces au poivre de style Barbade.');
INSERT INTO `BLC_TRANSLATION` VALUES (-261,'6','Sku','name','fr','Jour de la sauce Scotch Bonnet Hot Morte');
INSERT INTO `BLC_TRANSLATION` VALUES (-260,'5','Sku','longDescription','fr','Si vous voulez chaud, c\'est le piment de choisir. Originaire de la Caraïbe, du Yucatan et du Nord Côte de l\'Am&eacute;rique du Sud, le Habanero se pr&eacute;sente dans une vari&eacute;t&eacute; de couleurs allant du vert p&acirc;le au rouge vif. La chaleur gras Habanero, la saveur et l\'arôme unique, en a fait le favori des amateurs de chili.');
INSERT INTO `BLC_TRANSLATION` VALUES (-259,'5','Sku','name','fr','Jour de la sauce Habanero Hot Morte');
INSERT INTO `BLC_TRANSLATION` VALUES (-258,'4','Sku','longDescription','fr','Lorsque tout le poivre est s&eacute;ch&eacute; et fum&eacute;, il est consid&eacute;r&eacute; comme un Chipotle. Normalement, avec un aspect froiss&eacute;, drak brun, le chipotle fum&eacute; offre une saveur douce qui est g&eacute;n&eacute;ralement utilis&eacute; pour ajouter un smokey, saveur rôtie aux salsas, les ragoûts et marinades.');
INSERT INTO `BLC_TRANSLATION` VALUES (-257,'4','Sku','name','fr','Jour de la sauce chaude Morte Chipotle');
INSERT INTO `BLC_TRANSLATION` VALUES (-256,'3','Sku','longDescription','fr','Tangy, venu de Cayenne poivron flux avec l\'ail, l\'oignon p&acirc;te de tomate, et un soupçon de sucre de canne pour en faire une sauce onctueuse avec une morsure. Magnifique sur les œufs, la volaille, le porc ou le poisson, cette sauce marie pour faire des marinades et des soupes riches.');
INSERT INTO `BLC_TRANSLATION` VALUES (-255,'3','Sku','name','fr','Hot Sauce Hoppin');
INSERT INTO `BLC_TRANSLATION` VALUES (-254,'2','Sku','longDescription','fr','Le parfait topper pour le poulet, le poisson, des hamburgers ou une pizza. Un grand m&eacute;lange de Habanero, mangue, fruits de la passion et de plus faire cette sauce Mort d\'un festin incroyable tropicale');
INSERT INTO `BLC_TRANSLATION` VALUES (-253,'2','Sku','name','fr','Sauce Sweet Death');
INSERT INTO `BLC_TRANSLATION` VALUES (-252,'1','Sku','longDescription','fr','Comme mes Chilipals sais, je suis pas du genre &agrave; &ecirc;tre satisfaite. Par cons&eacute;quent, la cr&eacute;ation de la mort subite. Lorsque vous avez besoin d\'aller au-del&agrave; ... Mort subite livrera!');
INSERT INTO `BLC_TRANSLATION` VALUES (-251,'1','Sku','name','fr','Sauce mort subite');
INSERT INTO `BLC_TRANSLATION` VALUES (-247,'14','ProdOptionVal','attributeValue','fr','XG');
INSERT INTO `BLC_TRANSLATION` VALUES (-246,'13','ProdOptionVal','attributeValue','fr','G');
INSERT INTO `BLC_TRANSLATION` VALUES (-245,'12','ProdOptionVal','attributeValue','fr','M');
INSERT INTO `BLC_TRANSLATION` VALUES (-244,'11','ProdOptionVal','attributeValue','fr','P');
INSERT INTO `BLC_TRANSLATION` VALUES (-243,'3','ProdOptionVal','attributeValue','fr','Argent');
INSERT INTO `BLC_TRANSLATION` VALUES (-242,'2','ProdOptionVal','attributeValue','fr','Rouge');
INSERT INTO `BLC_TRANSLATION` VALUES (-241,'1','ProdOptionVal','attributeValue','fr','Noir');
INSERT INTO `BLC_TRANSLATION` VALUES (-232,'2','ProdOption','label','fr','Shirt Taille');
INSERT INTO `BLC_TRANSLATION` VALUES (-231,'1','ProdOption','label','fr','Shirt Couleur');
INSERT INTO `BLC_TRANSLATION` VALUES (-215,'2005','Category','description','fr','Cartes Cadeaux');
INSERT INTO `BLC_TRANSLATION` VALUES (-214,'2004','Category','description','fr','Soldes');
INSERT INTO `BLC_TRANSLATION` VALUES (-213,'2003','Category','description','fr','Goodies');
INSERT INTO `BLC_TRANSLATION` VALUES (-212,'2002','Category','description','fr','Sauces piquantes');
INSERT INTO `BLC_TRANSLATION` VALUES (-211,'2001','Category','description','fr','Accueil');
INSERT INTO `BLC_TRANSLATION` VALUES (-205,'2005','Category','name','fr','Cartes Cadeaux');
INSERT INTO `BLC_TRANSLATION` VALUES (-204,'2004','Category','name','fr','Soldes');
INSERT INTO `BLC_TRANSLATION` VALUES (-203,'2003','Category','name','fr','Goodies');
INSERT INTO `BLC_TRANSLATION` VALUES (-202,'2002','Category','name','fr','Sauces piquantes');
INSERT INTO `BLC_TRANSLATION` VALUES (-201,'2001','Category','name','fr','Accueil');
INSERT INTO `BLC_TRANSLATION` VALUES (-198,'6','MenuItem','label','es','FAQ');
INSERT INTO `BLC_TRANSLATION` VALUES (-197,'5','MenuItem','label','aes','Nuevo a la Salsa?');
INSERT INTO `BLC_TRANSLATION` VALUES (-196,'3','FulfillmentOption','longDescription','es','1 - 2 D&iacute;as');
INSERT INTO `BLC_TRANSLATION` VALUES (-195,'3','FulfillmentOption','name','es','Express');
INSERT INTO `BLC_TRANSLATION` VALUES (-194,'2','FulfillmentOption','longDescription','es','3 - 5 D&iacute;as');
INSERT INTO `BLC_TRANSLATION` VALUES (-193,'2','FulfillmentOption','name','es','Ejecutiva');
INSERT INTO `BLC_TRANSLATION` VALUES (-192,'1','FulfillmentOption','longDescription','es','5 - 7 D&iacute;as');
INSERT INTO `BLC_TRANSLATION` VALUES (-191,'1','FulfillmentOption','name','es','Estándar');
INSERT INTO `BLC_TRANSLATION` VALUES (-182,'3','SearchFacet','label','es','Precio');
INSERT INTO `BLC_TRANSLATION` VALUES (-181,'2','SearchFacet','label','es','Rango de Calor');
INSERT INTO `BLC_TRANSLATION` VALUES (-180,'1','SearchFacet','label','es','Fabricante');
INSERT INTO `BLC_TRANSLATION` VALUES (-100,'600','Sku','longDescription','es','&iquest;No te encanta nuestra mascota? Compre su propia camiseta hoy!');
INSERT INTO `BLC_TRANSLATION` VALUES (-99,'600','Sku','name','es','Mascota de Heat Clinic (Mujeres)');
INSERT INTO `BLC_TRANSLATION` VALUES (-98,'500','Sku','longDescription','es','&iquest;No te encanta nuestra mascota? Compre su propia camiseta hoy!');
INSERT INTO `BLC_TRANSLATION` VALUES (-97,'500','Sku','name','es','Mascota de Heat Clinic (Hombres)');
INSERT INTO `BLC_TRANSLATION` VALUES (-96,'400','Sku','longDescription','es','Esta camiseta tiene el logo dibujado a mano para hombres, ofrece un ajuste regular en tres colores diferentes.');
INSERT INTO `BLC_TRANSLATION` VALUES (-95,'400','Sku','name','es','Heat Clinic dibujado a mano (Mujeres)');
INSERT INTO `BLC_TRANSLATION` VALUES (-94,'300','Sku','longDescription','es','Esta camiseta tiene el logo dibujado a mano para hombres, ofrece un ajuste regular en tres colores diferentes.');
INSERT INTO `BLC_TRANSLATION` VALUES (-93,'300','Sku','name','es','Heat Clinic dibujado a mano (Hombres)');
INSERT INTO `BLC_TRANSLATION` VALUES (-92,'200','Sku','longDescription','es','Colecci&oacute;n de Mujeres Habanero est&aacute;ndar de manga corta serigrafiadas, camiseta de algod&oacute;n suave en ajuste normal.');
INSERT INTO `BLC_TRANSLATION` VALUES (-91,'200','Sku','name','es','Camisa de Habanero Hawt (Mujeres)');
INSERT INTO `BLC_TRANSLATION` VALUES (-90,'100','Sku','longDescription','es','Colecci&oacute;n de Hombres Habanero est&aacute;ndar de manga corta serigrafiadas, camiseta de algod&oacute;n suave en ajuste normal.');
INSERT INTO `BLC_TRANSLATION` VALUES (-89,'100','Sku','name','es','Camisa de Habanero Hawt (Hombres)');
INSERT INTO `BLC_TRANSLATION` VALUES (-88,'19','Sku','longDescription','es','Esta salsa debe su gran sabor a los pimientos de edad y vinagre de ca&ntilde;a. Mejorar&aacute; el sabor de cualquier comida.');
INSERT INTO `BLC_TRANSLATION` VALUES (-87,'19','Sku','name','es','Salsa de Pimienta Roja y Chipotle');
INSERT INTO `BLC_TRANSLATION` VALUES (-86,'18','Sku','longDescription','es','Esta salsa debe su gran sabor a los pimientos de edad y vinagre de ca&ntilde;a. Mejorar&aacute; el sabor de cualquier comida.');
INSERT INTO `BLC_TRANSLATION` VALUES (-85,'18','Sku','name','es','Salsa de Jalape&ntilde;o Ardiente');
INSERT INTO `BLC_TRANSLATION` VALUES (-84,'17','Sku','longDescription','es','Esta salsa debe su gran sabor a los pimientos de edad y vinagre de ca&ntilde;a. Mejorar&aacute; el sabor de cualquier comida.');
INSERT INTO `BLC_TRANSLATION` VALUES (-83,'17','Sku','name','es','Salsa de Locura');
INSERT INTO `BLC_TRANSLATION` VALUES (-82,'16','Sku','longDescription','es','Esta salsa debe su gran sabor a los pimientos de edad y vinagre de ca&ntilde;a. Mejorar&aacute; el sabor de cualquier comida.');
INSERT INTO `BLC_TRANSLATION` VALUES (-81,'16','Sku','name','es','Salsa de Locura');
INSERT INTO `BLC_TRANSLATION` VALUES (-80,'15','Sku','longDescription','es','Esta salsa debe su gran sabor a los pimientos de edad y vinagre de ca&ntilde;a. Mejorar&aacute; el sabor de cualquier comida.');
INSERT INTO `BLC_TRANSLATION` VALUES (-79,'15','Sku','name','es','Salsa de Ajo Tostado');
INSERT INTO `BLC_TRANSLATION` VALUES (-78,'14','Sku','longDescription','es','Esta salsa debe su gran sabor a los pimientos de edad y vinagre de ca&ntilde;a. Mejorar&aacute; el sabor de cualquier comida.');
INSERT INTO `BLC_TRANSLATION` VALUES (-77,'14','Sku','name','es','Salsa de Cayene Fresco');
INSERT INTO `BLC_TRANSLATION` VALUES (-76,'13','Sku','longDescription','es','Todo es m&aacute;s grande en Texas, incluso lo picante de la Salsa de Snortin Bull! Si usted es un fan de hacer la salsa de barbacoa a partir de cero, como yo, puede utilizar la Salsa de Snortin Bull como aditivo. Habaneros ardientes y los pimientos de cayena dan a la garganta un sabor y calor al rojo vivo.');
INSERT INTO `BLC_TRANSLATION` VALUES (-75,'13','Sku','name','es','Salsa Mata-Gargantas de Bull Snort');
INSERT INTO `BLC_TRANSLATION` VALUES (-74,'12','Sku','longDescription','es','Una de las salsas m&aacute;s inusuales que vendemos. La original era un viejo estilo salsa caj&uacute;n y esto versi&oacute;n actualizada ennegrecimiento. Es dulce, pero se obtiene un gran sabor de canela y clavo de olor con un tiro agradable de piacnte de Cayena. Use en todos los alimentos para dar ese toque caj&uacute;n.');
INSERT INTO `BLC_TRANSLATION` VALUES (-73,'12','Sku','name','es','Salsa Dulce de Cajun de Lousiane');
INSERT INTO `BLC_TRANSLATION` VALUES (-72,'11','Sku','longDescription','es','Espolvorear con platos de carne, pescado y verduras. Use como aditivo en la salsa de barbacoa o cualquier alimento que necesita un sabor picante. Comience con unas gotas y aumente hasta llegar al sabor deseado.');
INSERT INTO `BLC_TRANSLATION` VALUES (-71,'11','Sku','name','es','Salsa Picante del Vaquero');
INSERT INTO `BLC_TRANSLATION` VALUES (-70,'10','Sku','longDescription','es','Aquí est&aacute; la receta para aquellos que disfrutan de picante intolerable. Esta salsa macabra y mortal del Dr. Chilemeister se debe utilizar con precauci&oacute;n. El dolor puede llegar a ser adictivo!');
INSERT INTO `BLC_TRANSLATION` VALUES (-69,'10','Sku','name','es','Salsa Loca del Dr. Chilemeister');
INSERT INTO `BLC_TRANSLATION` VALUES (-68,'9','Sku','longDescription','es','Todo el infierno se ha desatado, fuego y azufre. Est&aacute; listo para el fin?');
INSERT INTO `BLC_TRANSLATION` VALUES (-67,'9','Sku','name','es','Fin del Mundo Salsa');
INSERT INTO `BLC_TRANSLATION` VALUES (-66,'8','Sku','longDescription','es','Esta salsa caliente recibe su nombre por la gente que aprecian una salsa picante. Lo que vas a encontrar aquí es un sabor picante realmente original, no una acritud abrumador que se encuentra en las salsas de chile Tabasco ordinarios - a pesar de la pimienta usado en este producto ha sido probado en 285.000 unidades Scoville. Por lo tanto, ensillar a dar un paseo para recordar. Para asegurarnos de que usted trajo s&oacute;lo la mejor salsa de pimiento habanero, nos fuimos a las faldas de las monta&ntilde;as mayas en Belice, Am&eacute;rica Central. Este producto se prepara totalmente a mano utilizando s&oacute;lo las verduras frescas y solo ingredientes naturales.');
INSERT INTO `BLC_TRANSLATION` VALUES (-65,'8','Sku','name','es','Salsa de Habanero de la Silla Ardiente');
INSERT INTO `BLC_TRANSLATION` VALUES (-64,'7','Sku','longDescription','es','Hecho con Naga Jolokia Bhut, el chile m&aacute;s picante del mundo.');
INSERT INTO `BLC_TRANSLATION` VALUES (-63,'7','Sku','name','es','Fantasma Verde');
INSERT INTO `BLC_TRANSLATION` VALUES (-62,'6','Sku','longDescription','es','Parecido al Habanero, el Bonnet Escoc&eacute;s tiene una punta profundamente invertidas en comparaci&oacute;n con el extremo puntiagudo del Habanero. Van en colores de verde a amarillo-naranja, el Bonnet Escoc&eacute;s es un alimento b&aacute;sico en West Indies, en Barbados y salsas estilo pimienta.');
INSERT INTO `BLC_TRANSLATION` VALUES (-61,'6','Sku','name','es','Salsa del D&iacute;a de los Muertos de Bonnet Escoc&eacute;s');
INSERT INTO `BLC_TRANSLATION` VALUES (-60,'5','Sku','longDescription','es','Si quieres picante, este es el Chile a elegir. Originario del Caribe, Yucat&aacute;n y la Costa norte de Am&eacute;rica del Sur, el habanero se presenta en una variedad de colores que van desde el verde claro a un rojo brillante. El calor, sabor y aroma &uacute;nicos del Habanero ha convertido el chile en el favorito de los amantes del picante.');
INSERT INTO `BLC_TRANSLATION` VALUES (-59,'5','Sku','name','es','Salsa del D&iacute;a de los Muertos de Habanero');
INSERT INTO `BLC_TRANSLATION` VALUES (-58,'4','Sku','longDescription','es','Cuando cualquier pimienta se seca y se fuma, se refiere como un Chipotle. Por lo general, con una apariencia arrugada, caf&eacute; oscuro, el Chipotle ofrece un sabor ahumado y dulce que se utiliza generalmente para agregar un sabor asado a las salsas, guisos y adobos.');
INSERT INTO `BLC_TRANSLATION` VALUES (-57,'4','Sku','name','es','Salsa del D&iacute;a de los Muertos de Chipotle');
INSERT INTO `BLC_TRANSLATION` VALUES (-55,'3','Sku','name','es','Salsa de la Muerte Saltante');
INSERT INTO `BLC_TRANSLATION` VALUES (-54,'2','Sku','longDescription','es','El perfecto acompa&ntilde;ante para el pollo, el pescado, hamburguesas o pizza. Una gran mezcla de habanero, mango, fruta de la pasi&oacute;n y mucho m&aacute;s hacen de esta salsa de la Muerte una delicia tropical incre&iacute;ble.');
INSERT INTO `BLC_TRANSLATION` VALUES (-53,'2','Sku','name','es','Salsa de la Muerte Dulce');
INSERT INTO `BLC_TRANSLATION` VALUES (-52,'1','Sku','longDescription','es','Como mis amigos salseros saben, nunca soy f&aacute;cil de satisfacer. Por lo tanto, naci&oacute; la creaci&oacute;n de la Muerte S&uacute;bita. Cuando este listo para saborear al m&aacute;s all&aacute; ... Muerte s&uacute;bita entregar&aacute;!');
INSERT INTO `BLC_TRANSLATION` VALUES (-51,'1','Sku','name','es','Salsa de la Muerte S&uacute;bita');
INSERT INTO `BLC_TRANSLATION` VALUES (-47,'14','ProdOptionVal','attributeValue','es','XG');
INSERT INTO `BLC_TRANSLATION` VALUES (-46,'13','ProdOptionVal','attributeValue','es','G');
INSERT INTO `BLC_TRANSLATION` VALUES (-45,'12','ProdOptionVal','attributeValue','es','M');
INSERT INTO `BLC_TRANSLATION` VALUES (-44,'11','ProdOptionVal','attributeValue','es','CH');
INSERT INTO `BLC_TRANSLATION` VALUES (-43,'3','ProdOptionVal','attributeValue','es','Plateado');
INSERT INTO `BLC_TRANSLATION` VALUES (-42,'2','ProdOptionVal','attributeValue','es','Rojo');
INSERT INTO `BLC_TRANSLATION` VALUES (-41,'1','ProdOptionVal','attributeValue','es','Negro');
INSERT INTO `BLC_TRANSLATION` VALUES (-32,'2','ProdOption','label','es','Tama&ntilde;o de Camisa');
INSERT INTO `BLC_TRANSLATION` VALUES (-31,'1','ProdOption','label','es','Color de Camisa');
INSERT INTO `BLC_TRANSLATION` VALUES (-15,'2005','Category','description','es','Tarjetas de Regalo');
INSERT INTO `BLC_TRANSLATION` VALUES (-14,'2004','Category','description','es','Descuento');
INSERT INTO `BLC_TRANSLATION` VALUES (-13,'2003','Category','description','es','Mercanc&iacute;a');
INSERT INTO `BLC_TRANSLATION` VALUES (-12,'2002','Category','description','es','Salsas Picantes');
INSERT INTO `BLC_TRANSLATION` VALUES (-11,'2001','Category','description','es','Inicio');
INSERT INTO `BLC_TRANSLATION` VALUES (-5,'2005','Category','name','es','Tarjetas de Regalo');
INSERT INTO `BLC_TRANSLATION` VALUES (-4,'2004','Category','name','es','Descuento');
INSERT INTO `BLC_TRANSLATION` VALUES (-3,'2003','Category','name','es','Mercanc&iacute;a');
INSERT INTO `BLC_TRANSLATION` VALUES (-2,'2002','Category','name','es','Salsas');
INSERT INTO `BLC_TRANSLATION` VALUES (-1,'2001','Category','name','es','Inicio');
/*!40000 ALTER TABLE `BLC_TRANSLATION` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `BLC_TRANS_ADDITNL_FIELDS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BLC_TRANS_ADDITNL_FIELDS` (
  `PAYMENT_TRANSACTION_ID` bigint(20) NOT NULL,
  `FIELD_VALUE` longtext,
  `FIELD_NAME` varchar(255) NOT NULL,
  PRIMARY KEY (`PAYMENT_TRANSACTION_ID`,`FIELD_NAME`),
  CONSTRAINT `FKdmq1toto9pwrhw5uife2ssq45` FOREIGN KEY (`PAYMENT_TRANSACTION_ID`) REFERENCES `BLC_ORDER_PAYMENT_TRANSACTION` (`PAYMENT_TRANSACTION_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `BLC_TRANS_ADDITNL_FIELDS` WRITE;
/*!40000 ALTER TABLE `BLC_TRANS_ADDITNL_FIELDS` DISABLE KEYS */;
/*!40000 ALTER TABLE `BLC_TRANS_ADDITNL_FIELDS` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `BLC_URL_HANDLER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BLC_URL_HANDLER` (
  `URL_HANDLER_ID` bigint(20) NOT NULL,
  `INCOMING_URL` varchar(255) NOT NULL,
  `IS_REGEX` bit(1) DEFAULT NULL,
  `NEW_URL` varchar(255) NOT NULL,
  `URL_REDIRECT_TYPE` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`URL_HANDLER_ID`),
  KEY `INCOMING_URL_INDEX` (`INCOMING_URL`),
  KEY `IS_REGEX_HANDLER_INDEX` (`IS_REGEX`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `BLC_URL_HANDLER` WRITE;
/*!40000 ALTER TABLE `BLC_URL_HANDLER` DISABLE KEYS */;
INSERT INTO `BLC_URL_HANDLER` VALUES (1,'/googlePerm',NULL,'http://www.google.com','REDIRECT_PERM');
INSERT INTO `BLC_URL_HANDLER` VALUES (2,'/googleTemp',NULL,'http://www.google.com','REDIRECT_TEMP');
INSERT INTO `BLC_URL_HANDLER` VALUES (3,'/insanity',NULL,'/hot-sauces/insanity_sauce','FORWARD');
INSERT INTO `BLC_URL_HANDLER` VALUES (4,'/jalepeno',NULL,'/hot-sauces/hurtin_jalepeno_hot_sauce','REDIRECT_TEMP');
/*!40000 ALTER TABLE `BLC_URL_HANDLER` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `BLC_UserConnection`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BLC_UserConnection` (
  `providerId` varchar(255) NOT NULL,
  `providerUserId` varchar(255) NOT NULL,
  `userId` varchar(255) NOT NULL,
  `accessToken` varchar(255) NOT NULL,
  `displayName` varchar(255) DEFAULT NULL,
  `expireTime` bigint(20) DEFAULT NULL,
  `imageUrl` varchar(255) DEFAULT NULL,
  `profileUrl` varchar(255) DEFAULT NULL,
  `rank` int(11) NOT NULL,
  `refreshToken` varchar(255) DEFAULT NULL,
  `secret` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`providerId`,`providerUserId`,`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `BLC_UserConnection` WRITE;
/*!40000 ALTER TABLE `BLC_UserConnection` DISABLE KEYS */;
/*!40000 ALTER TABLE `BLC_UserConnection` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `BLC_ZIP_CODE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BLC_ZIP_CODE` (
  `ZIP_CODE_ID` varchar(255) NOT NULL,
  `ZIP_CITY` varchar(255) DEFAULT NULL,
  `ZIP_LATITUDE` double DEFAULT NULL,
  `ZIP_LONGITUDE` double DEFAULT NULL,
  `ZIP_STATE` varchar(255) DEFAULT NULL,
  `ZIPCODE` int(11) DEFAULT NULL,
  PRIMARY KEY (`ZIP_CODE_ID`),
  KEY `ZIPCODE_CITY_INDEX` (`ZIP_CITY`),
  KEY `ZIPCODE_LATITUDE_INDEX` (`ZIP_LATITUDE`),
  KEY `ZIPCODE_LONGITUDE_INDEX` (`ZIP_LONGITUDE`),
  KEY `ZIPCODE_STATE_INDEX` (`ZIP_STATE`),
  KEY `ZIPCODE_ZIP_INDEX` (`ZIPCODE`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `BLC_ZIP_CODE` WRITE;
/*!40000 ALTER TABLE `BLC_ZIP_CODE` DISABLE KEYS */;
/*!40000 ALTER TABLE `BLC_ZIP_CODE` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `SEQUENCE_GENERATOR`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SEQUENCE_GENERATOR` (
  `ID_NAME` varchar(255) NOT NULL,
  `ID_VAL` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`ID_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `SEQUENCE_GENERATOR` WRITE;
/*!40000 ALTER TABLE `SEQUENCE_GENERATOR` DISABLE KEYS */;
INSERT INTO `SEQUENCE_GENERATOR` VALUES ('AddressImpl',51);
INSERT INTO `SEQUENCE_GENERATOR` VALUES ('CategoryExcludedSearchFacetImpl',1000);
INSERT INTO `SEQUENCE_GENERATOR` VALUES ('CategoryImpl',10000);
INSERT INTO `SEQUENCE_GENERATOR` VALUES ('CategoryProductImpl',1000);
INSERT INTO `SEQUENCE_GENERATOR` VALUES ('CategoryProductXrefImpl',1000);
INSERT INTO `SEQUENCE_GENERATOR` VALUES ('CategorySearchFacetImpl',1000);
INSERT INTO `SEQUENCE_GENERATOR` VALUES ('CategoryXrefImpl',1000);
INSERT INTO `SEQUENCE_GENERATOR` VALUES ('ChallengeQuestionImpl',1000);
INSERT INTO `SEQUENCE_GENERATOR` VALUES ('CountrySubdivisionCategoryImpl',1000);
INSERT INTO `SEQUENCE_GENERATOR` VALUES ('CustomerRoleImpl',51);
INSERT INTO `SEQUENCE_GENERATOR` VALUES ('EmailTrackingImpl',51);
INSERT INTO `SEQUENCE_GENERATOR` VALUES ('FeaturedProductImpl',1000);
INSERT INTO `SEQUENCE_GENERATOR` VALUES ('FieldDefinitionImpl',1000);
INSERT INTO `SEQUENCE_GENERATOR` VALUES ('FieldEnumerationImpl',1000);
INSERT INTO `SEQUENCE_GENERATOR` VALUES ('FieldEnumerationItemImpl',1000);
INSERT INTO `SEQUENCE_GENERATOR` VALUES ('FieldGroupImpl',1000);
INSERT INTO `SEQUENCE_GENERATOR` VALUES ('FieldImpl',1000);
INSERT INTO `SEQUENCE_GENERATOR` VALUES ('FulfillmentGroupImpl',51);
INSERT INTO `SEQUENCE_GENERATOR` VALUES ('FulfillmentGroupItemImpl',51);
INSERT INTO `SEQUENCE_GENERATOR` VALUES ('FulfillmentOptionImpl',1000);
INSERT INTO `SEQUENCE_GENERATOR` VALUES ('IndexFieldImpl',1000);
INSERT INTO `SEQUENCE_GENERATOR` VALUES ('IndexFieldTypeImpl',1000);
INSERT INTO `SEQUENCE_GENERATOR` VALUES ('MediaImpl',100000);
INSERT INTO `SEQUENCE_GENERATOR` VALUES ('MenuImpl',1000);
INSERT INTO `SEQUENCE_GENERATOR` VALUES ('MenuItemImpl',1000);
INSERT INTO `SEQUENCE_GENERATOR` VALUES ('OfferCodeImpl',1000);
INSERT INTO `SEQUENCE_GENERATOR` VALUES ('OfferImpl',1000);
INSERT INTO `SEQUENCE_GENERATOR` VALUES ('OfferItemCriteriaImpl',1000);
INSERT INTO `SEQUENCE_GENERATOR` VALUES ('OrderImpl',101);
INSERT INTO `SEQUENCE_GENERATOR` VALUES ('OrderItemImpl',51);
INSERT INTO `SEQUENCE_GENERATOR` VALUES ('OrderItemPriceDetailImpl',51);
INSERT INTO `SEQUENCE_GENERATOR` VALUES ('PageFieldImpl',1000);
INSERT INTO `SEQUENCE_GENERATOR` VALUES ('PageImpl',1000);
INSERT INTO `SEQUENCE_GENERATOR` VALUES ('PageTemplateImpl',1000);
INSERT INTO `SEQUENCE_GENERATOR` VALUES ('PhoneImpl',51);
INSERT INTO `SEQUENCE_GENERATOR` VALUES ('ProductAttributeImpl',1000);
INSERT INTO `SEQUENCE_GENERATOR` VALUES ('ProductImpl',10000);
INSERT INTO `SEQUENCE_GENERATOR` VALUES ('ProductOptionImpl',1000);
INSERT INTO `SEQUENCE_GENERATOR` VALUES ('ProductOptionValueImpl',1000);
INSERT INTO `SEQUENCE_GENERATOR` VALUES ('ProductOptionXrefImpl',1000);
INSERT INTO `SEQUENCE_GENERATOR` VALUES ('RoleImpl',1000);
INSERT INTO `SEQUENCE_GENERATOR` VALUES ('SearchFacetImpl',1000);
INSERT INTO `SEQUENCE_GENERATOR` VALUES ('SearchFacetRangeImpl',1000);
INSERT INTO `SEQUENCE_GENERATOR` VALUES ('SearchInterceptImpl',1000);
INSERT INTO `SEQUENCE_GENERATOR` VALUES ('SkuAttributeImpl',1000);
INSERT INTO `SEQUENCE_GENERATOR` VALUES ('SkuImpl',10000);
INSERT INTO `SEQUENCE_GENERATOR` VALUES ('SkuProductOptionValueXrefImpl',1000);
INSERT INTO `SEQUENCE_GENERATOR` VALUES ('StaticAssetImpl',100000);
INSERT INTO `SEQUENCE_GENERATOR` VALUES ('StructuredContentFieldImpl',1000);
INSERT INTO `SEQUENCE_GENERATOR` VALUES ('StructuredContentImpl',1000);
INSERT INTO `SEQUENCE_GENERATOR` VALUES ('StructuredContentRuleImpl',1000);
INSERT INTO `SEQUENCE_GENERATOR` VALUES ('StructuredContentTypeImpl',1000);
INSERT INTO `SEQUENCE_GENERATOR` VALUES ('URLHandlerImpl',1000);
/*!40000 ALTER TABLE `SEQUENCE_GENERATOR` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
