-- MySQL dump 10.13  Distrib 5.7.21, for Linux (x86_64)
--
-- Host: localhost    Database: ApolloPortalDB
-- ------------------------------------------------------
-- Server version	5.7.21-1ubuntu1

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

--
-- Table structure for table `App`
--

DROP TABLE IF EXISTS `App`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `App` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `AppId` varchar(500) NOT NULL DEFAULT 'default' COMMENT 'AppID',
  `Name` varchar(500) NOT NULL DEFAULT 'default' COMMENT '应用名',
  `OrgId` varchar(32) NOT NULL DEFAULT 'default' COMMENT '部门Id',
  `OrgName` varchar(64) NOT NULL DEFAULT 'default' COMMENT '部门名字',
  `OwnerName` varchar(500) NOT NULL DEFAULT 'default' COMMENT 'ownerName',
  `OwnerEmail` varchar(500) NOT NULL DEFAULT 'default' COMMENT 'ownerEmail',
  `IsDeleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '1: deleted, 0: normal',
  `DeletedAt` bigint(20) NOT NULL DEFAULT '0' COMMENT 'Delete timestamp based on milliseconds',
  `DataChange_CreatedBy` varchar(64) NOT NULL DEFAULT 'default' COMMENT '创建人邮箱前缀',
  `DataChange_CreatedTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `DataChange_LastModifiedBy` varchar(64) DEFAULT '' COMMENT '最后修改人邮箱前缀',
  `DataChange_LastTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后修改时间',
  PRIMARY KEY (`Id`),
  UNIQUE KEY `UK_AppId_DeletedAt` (`AppId`,`DeletedAt`),
  KEY `DataChange_LastTime` (`DataChange_LastTime`),
  KEY `IX_Name` (`Name`(191))
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COMMENT='应用表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `AppNamespace`
--

DROP TABLE IF EXISTS `AppNamespace`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `AppNamespace` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `Name` varchar(32) NOT NULL DEFAULT '' COMMENT 'namespace名字，注意，需要全局唯一',
  `AppId` varchar(64) NOT NULL DEFAULT '' COMMENT 'app id',
  `Format` varchar(32) NOT NULL DEFAULT 'properties' COMMENT 'namespace的format类型',
  `IsPublic` bit(1) NOT NULL DEFAULT b'0' COMMENT 'namespace是否为公共',
  `Comment` varchar(64) NOT NULL DEFAULT '' COMMENT '注释',
  `IsDeleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '1: deleted, 0: normal',
  `DeletedAt` bigint(20) NOT NULL DEFAULT '0' COMMENT 'Delete timestamp based on milliseconds',
  `DataChange_CreatedBy` varchar(64) NOT NULL DEFAULT 'default' COMMENT '创建人邮箱前缀',
  `DataChange_CreatedTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `DataChange_LastModifiedBy` varchar(64) DEFAULT '' COMMENT '最后修改人邮箱前缀',
  `DataChange_LastTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后修改时间',
  PRIMARY KEY (`Id`),
  UNIQUE KEY `UK_AppId_Name_DeletedAt` (`AppId`,`Name`,`DeletedAt`),
  KEY `Name_AppId` (`Name`,`AppId`),
  KEY `DataChange_LastTime` (`DataChange_LastTime`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COMMENT='应用namespace定义';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Authorities`
--

DROP TABLE IF EXISTS `Authorities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Authorities` (
  `Id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增Id',
  `Username` varchar(64) NOT NULL,
  `Authority` varchar(50) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Consumer`
--

DROP TABLE IF EXISTS `Consumer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Consumer` (
  `Id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增Id',
  `AppId` varchar(500) NOT NULL DEFAULT 'default' COMMENT 'AppID',
  `Name` varchar(500) NOT NULL DEFAULT 'default' COMMENT '应用名',
  `OrgId` varchar(32) NOT NULL DEFAULT 'default' COMMENT '部门Id',
  `OrgName` varchar(64) NOT NULL DEFAULT 'default' COMMENT '部门名字',
  `OwnerName` varchar(500) NOT NULL DEFAULT 'default' COMMENT 'ownerName',
  `OwnerEmail` varchar(500) NOT NULL DEFAULT 'default' COMMENT 'ownerEmail',
  `IsDeleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '1: deleted, 0: normal',
  `DeletedAt` bigint(20) NOT NULL DEFAULT '0' COMMENT 'Delete timestamp based on milliseconds',
  `DataChange_CreatedBy` varchar(64) NOT NULL DEFAULT 'default' COMMENT '创建人邮箱前缀',
  `DataChange_CreatedTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `DataChange_LastModifiedBy` varchar(64) DEFAULT '' COMMENT '最后修改人邮箱前缀',
  `DataChange_LastTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后修改时间',
  PRIMARY KEY (`Id`),
  UNIQUE KEY `UK_AppId_DeletedAt` (`AppId`,`DeletedAt`),
  KEY `DataChange_LastTime` (`DataChange_LastTime`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='开放API消费者';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ConsumerAudit`
--

DROP TABLE IF EXISTS `ConsumerAudit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ConsumerAudit` (
  `Id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增Id',
  `ConsumerId` int(11) unsigned DEFAULT NULL COMMENT 'Consumer Id',
  `Uri` varchar(1024) NOT NULL DEFAULT '' COMMENT '访问的Uri',
  `Method` varchar(16) NOT NULL DEFAULT '' COMMENT '访问的Method',
  `DataChange_CreatedTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `DataChange_LastTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后修改时间',
  PRIMARY KEY (`Id`),
  KEY `IX_DataChange_LastTime` (`DataChange_LastTime`),
  KEY `IX_ConsumerId` (`ConsumerId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='consumer审计表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ConsumerRole`
--

DROP TABLE IF EXISTS `ConsumerRole`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ConsumerRole` (
  `Id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增Id',
  `ConsumerId` int(11) unsigned DEFAULT NULL COMMENT 'Consumer Id',
  `RoleId` int(10) unsigned DEFAULT NULL COMMENT 'Role Id',
  `IsDeleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '1: deleted, 0: normal',
  `DeletedAt` bigint(20) NOT NULL DEFAULT '0' COMMENT 'Delete timestamp based on milliseconds',
  `DataChange_CreatedBy` varchar(64) NOT NULL DEFAULT 'default' COMMENT '创建人邮箱前缀',
  `DataChange_CreatedTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `DataChange_LastModifiedBy` varchar(64) DEFAULT '' COMMENT '最后修改人邮箱前缀',
  `DataChange_LastTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后修改时间',
  PRIMARY KEY (`Id`),
  UNIQUE KEY `UK_ConsumerId_RoleId_DeletedAt` (`ConsumerId`,`RoleId`,`DeletedAt`),
  KEY `IX_DataChange_LastTime` (`DataChange_LastTime`),
  KEY `IX_RoleId` (`RoleId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='consumer和role的绑定表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ConsumerToken`
--

DROP TABLE IF EXISTS `ConsumerToken`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ConsumerToken` (
  `Id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增Id',
  `ConsumerId` int(11) unsigned DEFAULT NULL COMMENT 'ConsumerId',
  `Token` varchar(128) NOT NULL DEFAULT '' COMMENT 'token',
  `Expires` datetime NOT NULL DEFAULT '2099-01-01 00:00:00' COMMENT 'token失效时间',
  `IsDeleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '1: deleted, 0: normal',
  `DeletedAt` bigint(20) NOT NULL DEFAULT '0' COMMENT 'Delete timestamp based on milliseconds',
  `DataChange_CreatedBy` varchar(64) NOT NULL DEFAULT 'default' COMMENT '创建人邮箱前缀',
  `DataChange_CreatedTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `DataChange_LastModifiedBy` varchar(64) DEFAULT '' COMMENT '最后修改人邮箱前缀',
  `DataChange_LastTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后修改时间',
  PRIMARY KEY (`Id`),
  UNIQUE KEY `UK_Token_DeletedAt` (`Token`,`DeletedAt`),
  KEY `DataChange_LastTime` (`DataChange_LastTime`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='consumer token表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Favorite`
--

DROP TABLE IF EXISTS `Favorite`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Favorite` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `UserId` varchar(32) NOT NULL DEFAULT 'default' COMMENT '收藏的用户',
  `AppId` varchar(500) NOT NULL DEFAULT 'default' COMMENT 'AppID',
  `Position` int(32) NOT NULL DEFAULT '10000' COMMENT '收藏顺序',
  `IsDeleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '1: deleted, 0: normal',
  `DeletedAt` bigint(20) NOT NULL DEFAULT '0' COMMENT 'Delete timestamp based on milliseconds',
  `DataChange_CreatedBy` varchar(64) NOT NULL DEFAULT 'default' COMMENT '创建人邮箱前缀',
  `DataChange_CreatedTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `DataChange_LastModifiedBy` varchar(64) DEFAULT '' COMMENT '最后修改人邮箱前缀',
  `DataChange_LastTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后修改时间',
  PRIMARY KEY (`Id`),
  UNIQUE KEY `UK_UserId_AppId_DeletedAt` (`UserId`,`AppId`,`DeletedAt`),
  KEY `AppId` (`AppId`(191)),
  KEY `DataChange_LastTime` (`DataChange_LastTime`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='应用收藏表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Permission`
--

DROP TABLE IF EXISTS `Permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Permission` (
  `Id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增Id',
  `PermissionType` varchar(32) NOT NULL DEFAULT '' COMMENT '权限类型',
  `TargetId` varchar(256) NOT NULL DEFAULT '' COMMENT '权限对象类型',
  `IsDeleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '1: deleted, 0: normal',
  `DeletedAt` bigint(20) NOT NULL DEFAULT '0' COMMENT 'Delete timestamp based on milliseconds',
  `DataChange_CreatedBy` varchar(64) NOT NULL DEFAULT 'default' COMMENT '创建人邮箱前缀',
  `DataChange_CreatedTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `DataChange_LastModifiedBy` varchar(64) DEFAULT '' COMMENT '最后修改人邮箱前缀',
  `DataChange_LastTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后修改时间',
  PRIMARY KEY (`Id`),
  UNIQUE KEY `UK_TargetId_PermissionType_DeletedAt` (`TargetId`,`PermissionType`,`DeletedAt`),
  KEY `IX_DataChange_LastTime` (`DataChange_LastTime`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4 COMMENT='permission表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Role`
--

DROP TABLE IF EXISTS `Role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Role` (
  `Id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增Id',
  `RoleName` varchar(256) NOT NULL DEFAULT '' COMMENT 'Role name',
  `IsDeleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '1: deleted, 0: normal',
  `DeletedAt` bigint(20) NOT NULL DEFAULT '0' COMMENT 'Delete timestamp based on milliseconds',
  `DataChange_CreatedBy` varchar(64) NOT NULL DEFAULT 'default' COMMENT '创建人邮箱前缀',
  `DataChange_CreatedTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `DataChange_LastModifiedBy` varchar(64) DEFAULT '' COMMENT '最后修改人邮箱前缀',
  `DataChange_LastTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后修改时间',
  PRIMARY KEY (`Id`),
  UNIQUE KEY `UK_RoleName_DeletedAt` (`RoleName`,`DeletedAt`),
  KEY `IX_DataChange_LastTime` (`DataChange_LastTime`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COMMENT='角色表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `RolePermission`
--

DROP TABLE IF EXISTS `RolePermission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `RolePermission` (
  `Id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增Id',
  `RoleId` int(10) unsigned DEFAULT NULL COMMENT 'Role Id',
  `PermissionId` int(10) unsigned DEFAULT NULL COMMENT 'Permission Id',
  `IsDeleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '1: deleted, 0: normal',
  `DeletedAt` bigint(20) NOT NULL DEFAULT '0' COMMENT 'Delete timestamp based on milliseconds',
  `DataChange_CreatedBy` varchar(64) NOT NULL DEFAULT 'default' COMMENT '创建人邮箱前缀',
  `DataChange_CreatedTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `DataChange_LastModifiedBy` varchar(64) DEFAULT '' COMMENT '最后修改人邮箱前缀',
  `DataChange_LastTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后修改时间',
  PRIMARY KEY (`Id`),
  UNIQUE KEY `UK_RoleId_PermissionId_DeletedAt` (`RoleId`,`PermissionId`,`DeletedAt`),
  KEY `IX_DataChange_LastTime` (`DataChange_LastTime`),
  KEY `IX_PermissionId` (`PermissionId`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4 COMMENT='角色和权限的绑定表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `SPRING_SESSION`
--

DROP TABLE IF EXISTS `SPRING_SESSION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SPRING_SESSION` (
  `PRIMARY_ID` char(36) NOT NULL,
  `SESSION_ID` char(36) NOT NULL,
  `CREATION_TIME` bigint(20) NOT NULL,
  `LAST_ACCESS_TIME` bigint(20) NOT NULL,
  `MAX_INACTIVE_INTERVAL` int(11) NOT NULL,
  `EXPIRY_TIME` bigint(20) NOT NULL,
  `PRINCIPAL_NAME` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`PRIMARY_ID`),
  UNIQUE KEY `SPRING_SESSION_IX1` (`SESSION_ID`),
  KEY `SPRING_SESSION_IX2` (`EXPIRY_TIME`),
  KEY `SPRING_SESSION_IX3` (`PRINCIPAL_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `SPRING_SESSION_ATTRIBUTES`
--

DROP TABLE IF EXISTS `SPRING_SESSION_ATTRIBUTES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SPRING_SESSION_ATTRIBUTES` (
  `SESSION_PRIMARY_ID` char(36) NOT NULL,
  `ATTRIBUTE_NAME` varchar(200) NOT NULL,
  `ATTRIBUTE_BYTES` blob NOT NULL,
  PRIMARY KEY (`SESSION_PRIMARY_ID`,`ATTRIBUTE_NAME`),
  CONSTRAINT `SPRING_SESSION_ATTRIBUTES_FK` FOREIGN KEY (`SESSION_PRIMARY_ID`) REFERENCES `SPRING_SESSION` (`PRIMARY_ID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ServerConfig`
--

DROP TABLE IF EXISTS `ServerConfig`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ServerConfig` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增Id',
  `Key` varchar(64) NOT NULL DEFAULT 'default' COMMENT '配置项Key',
  `Value` varchar(2048) NOT NULL DEFAULT 'default' COMMENT '配置项值',
  `Comment` varchar(1024) DEFAULT '' COMMENT '注释',
  `IsDeleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '1: deleted, 0: normal',
  `DeletedAt` bigint(20) NOT NULL DEFAULT '0' COMMENT 'Delete timestamp based on milliseconds',
  `DataChange_CreatedBy` varchar(64) NOT NULL DEFAULT 'default' COMMENT '创建人邮箱前缀',
  `DataChange_CreatedTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `DataChange_LastModifiedBy` varchar(64) DEFAULT '' COMMENT '最后修改人邮箱前缀',
  `DataChange_LastTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后修改时间',
  PRIMARY KEY (`Id`),
  UNIQUE KEY `UK_Key_DeletedAt` (`Key`,`DeletedAt`),
  KEY `DataChange_LastTime` (`DataChange_LastTime`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COMMENT='配置服务自身配置';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `UserRole`
--

DROP TABLE IF EXISTS `UserRole`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `UserRole` (
  `Id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增Id',
  `UserId` varchar(128) DEFAULT '' COMMENT '用户身份标识',
  `RoleId` int(10) unsigned DEFAULT NULL COMMENT 'Role Id',
  `IsDeleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '1: deleted, 0: normal',
  `DeletedAt` bigint(20) NOT NULL DEFAULT '0' COMMENT 'Delete timestamp based on milliseconds',
  `DataChange_CreatedBy` varchar(64) NOT NULL DEFAULT 'default' COMMENT '创建人邮箱前缀',
  `DataChange_CreatedTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `DataChange_LastModifiedBy` varchar(64) DEFAULT '' COMMENT '最后修改人邮箱前缀',
  `DataChange_LastTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后修改时间',
  PRIMARY KEY (`Id`),
  UNIQUE KEY `UK_UserId_RoleId_DeletedAt` (`UserId`,`RoleId`,`DeletedAt`),
  KEY `IX_DataChange_LastTime` (`DataChange_LastTime`),
  KEY `IX_RoleId` (`RoleId`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COMMENT='用户和role的绑定表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Users`
--

DROP TABLE IF EXISTS `Users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Users` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增Id',
  `Username` varchar(64) NOT NULL DEFAULT 'default' COMMENT '用户登录账户',
  `Password` varchar(512) NOT NULL DEFAULT 'default' COMMENT '密码',
  `UserDisplayName` varchar(512) NOT NULL DEFAULT 'default' COMMENT '用户名称',
  `Email` varchar(64) NOT NULL DEFAULT 'default' COMMENT '邮箱地址',
  `Enabled` tinyint(4) DEFAULT NULL COMMENT '是否有效',
  PRIMARY KEY (`Id`),
  UNIQUE KEY `UK_Username` (`Username`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COMMENT='用户表';
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-10-05 13:35:47

-- MySQL dump 10.13  Distrib 5.7.21, for Linux (x86_64)
--
-- Host: localhost    Database: ApolloPortalDB
-- ------------------------------------------------------
-- Server version	5.7.21-1ubuntu1

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

--
-- Dumping data for table `App`
--

LOCK TABLES `App` WRITE;
/*!40000 ALTER TABLE `App` DISABLE KEYS */;
INSERT INTO `App` VALUES (1,'dd','aaaa','TEST1','样例部门1','apollo','apollo@acme.com','\0',0,'apollo','2023-10-04 08:32:23','apollo','2023-10-04 08:32:23'),(2,'adf','asdfasdfa','TEST1','样例部门1','apollo','apollo@acme.com','\0',0,'apollo','2023-10-04 08:59:47','apollo','2023-10-04 08:59:47'),(3,'app1','app1','TEST2','样例部门2','apollo','apollo@acme.com','\0',0,'apollo','2023-10-04 13:18:10','apollo','2023-10-04 13:18:10');
/*!40000 ALTER TABLE `App` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `AppNamespace`
--

LOCK TABLES `AppNamespace` WRITE;
/*!40000 ALTER TABLE `AppNamespace` DISABLE KEYS */;
INSERT INTO `AppNamespace` VALUES (1,'application','dd','properties','\0','default app namespace','\0',0,'apollo','2023-10-04 08:32:23','apollo','2023-10-04 08:32:23'),(2,'application','adf','properties','\0','default app namespace','\0',0,'apollo','2023-10-04 08:59:47','apollo','2023-10-04 08:59:47'),(3,'application','app1','properties','\0','default app namespace','\0',0,'apollo','2023-10-04 13:18:10','apollo','2023-10-04 13:18:10'),(4,'namespace1','app1','properties','','','\0',0,'apollo','2023-10-04 13:21:55','apollo','2023-10-04 13:21:55');
/*!40000 ALTER TABLE `AppNamespace` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `Authorities`
--

LOCK TABLES `Authorities` WRITE;
/*!40000 ALTER TABLE `Authorities` DISABLE KEYS */;
INSERT INTO `Authorities` VALUES (1,'apollo','ROLE_user'),(2,'user1','ROLE_user'),(3,'user2','ROLE_user'),(4,'user3','ROLE_user'),(5,'user4','ROLE_user'),(6,'user5','ROLE_user'),(7,'user6','ROLE_user'),(8,'user7','ROLE_user'),(9,'user8','ROLE_user'),(10,'user9','ROLE_user'),(11,'user10','ROLE_user');
/*!40000 ALTER TABLE `Authorities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `Consumer`
--

LOCK TABLES `Consumer` WRITE;
/*!40000 ALTER TABLE `Consumer` DISABLE KEYS */;
/*!40000 ALTER TABLE `Consumer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `ConsumerAudit`
--

LOCK TABLES `ConsumerAudit` WRITE;
/*!40000 ALTER TABLE `ConsumerAudit` DISABLE KEYS */;
/*!40000 ALTER TABLE `ConsumerAudit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `ConsumerRole`
--

LOCK TABLES `ConsumerRole` WRITE;
/*!40000 ALTER TABLE `ConsumerRole` DISABLE KEYS */;
/*!40000 ALTER TABLE `ConsumerRole` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `ConsumerToken`
--

LOCK TABLES `ConsumerToken` WRITE;
/*!40000 ALTER TABLE `ConsumerToken` DISABLE KEYS */;
/*!40000 ALTER TABLE `ConsumerToken` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `Favorite`
--

LOCK TABLES `Favorite` WRITE;
/*!40000 ALTER TABLE `Favorite` DISABLE KEYS */;
/*!40000 ALTER TABLE `Favorite` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `Permission`
--

LOCK TABLES `Permission` WRITE;
/*!40000 ALTER TABLE `Permission` DISABLE KEYS */;
INSERT INTO `Permission` VALUES (1,'CreateApplication','SystemRole','\0',0,'apollo','2023-10-04 08:23:56','apollo','2023-10-04 08:23:56'),(2,'AssignRole','dd','\0',0,'apollo','2023-10-04 08:32:23','apollo','2023-10-04 08:32:23'),(3,'CreateNamespace','dd','\0',0,'apollo','2023-10-04 08:32:23','apollo','2023-10-04 08:32:23'),(4,'CreateCluster','dd','\0',0,'apollo','2023-10-04 08:32:23','apollo','2023-10-04 08:32:23'),(5,'ManageAppMaster','dd','\0',0,'apollo','2023-10-04 08:32:23','apollo','2023-10-04 08:32:23'),(6,'ModifyNamespace','dd+application','\0',0,'apollo','2023-10-04 08:32:23','apollo','2023-10-04 08:32:23'),(7,'ReleaseNamespace','dd+application','\0',0,'apollo','2023-10-04 08:32:23','apollo','2023-10-04 08:32:23'),(8,'ModifyNamespace','dd+application+DEV','\0',0,'apollo','2023-10-04 08:32:23','apollo','2023-10-04 08:32:23'),(9,'ReleaseNamespace','dd+application+DEV','\0',0,'apollo','2023-10-04 08:32:23','apollo','2023-10-04 08:32:23'),(10,'AssignRole','adf','\0',0,'apollo','2023-10-04 08:59:47','apollo','2023-10-04 08:59:47'),(11,'CreateCluster','adf','\0',0,'apollo','2023-10-04 08:59:47','apollo','2023-10-04 08:59:47'),(12,'CreateNamespace','adf','\0',0,'apollo','2023-10-04 08:59:47','apollo','2023-10-04 08:59:47'),(13,'ManageAppMaster','adf','\0',0,'apollo','2023-10-04 08:59:47','apollo','2023-10-04 08:59:47'),(14,'ModifyNamespace','adf+application','\0',0,'apollo','2023-10-04 08:59:47','apollo','2023-10-04 08:59:47'),(15,'ReleaseNamespace','adf+application','\0',0,'apollo','2023-10-04 08:59:47','apollo','2023-10-04 08:59:47'),(16,'ModifyNamespace','adf+application+DEV','\0',0,'apollo','2023-10-04 08:59:47','apollo','2023-10-04 08:59:47'),(17,'ReleaseNamespace','adf+application+DEV','\0',0,'apollo','2023-10-04 08:59:47','apollo','2023-10-04 08:59:47'),(18,'CreateNamespace','app1','\0',0,'apollo','2023-10-04 13:18:10','apollo','2023-10-04 13:18:10'),(19,'AssignRole','app1','\0',0,'apollo','2023-10-04 13:18:10','apollo','2023-10-04 13:18:10'),(20,'CreateCluster','app1','\0',0,'apollo','2023-10-04 13:18:10','apollo','2023-10-04 13:18:10'),(21,'ManageAppMaster','app1','\0',0,'apollo','2023-10-04 13:18:10','apollo','2023-10-04 13:18:10'),(22,'ModifyNamespace','app1+application','\0',0,'apollo','2023-10-04 13:18:10','apollo','2023-10-04 13:18:10'),(23,'ReleaseNamespace','app1+application','\0',0,'apollo','2023-10-04 13:18:10','apollo','2023-10-04 13:18:10'),(24,'ModifyNamespace','app1+application+DEV','\0',0,'apollo','2023-10-04 13:18:10','apollo','2023-10-04 13:18:10'),(25,'ReleaseNamespace','app1+application+DEV','\0',0,'apollo','2023-10-04 13:18:10','apollo','2023-10-04 13:18:10'),(26,'ModifyNamespace','app1+namespace1','\0',0,'apollo','2023-10-04 13:21:55','apollo','2023-10-04 13:21:55'),(27,'ReleaseNamespace','app1+namespace1','\0',0,'apollo','2023-10-04 13:21:55','apollo','2023-10-04 13:21:55'),(28,'ModifyNamespace','app1+namespace1+DEV','\0',0,'apollo','2023-10-04 13:21:55','apollo','2023-10-04 13:21:55'),(29,'ReleaseNamespace','app1+namespace1+DEV','\0',0,'apollo','2023-10-04 13:21:55','apollo','2023-10-04 13:21:55');
/*!40000 ALTER TABLE `Permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `Role`
--

LOCK TABLES `Role` WRITE;
/*!40000 ALTER TABLE `Role` DISABLE KEYS */;
INSERT INTO `Role` VALUES (1,'CreateApplication+SystemRole','\0',0,'apollo','2023-10-04 08:23:56','apollo','2023-10-04 08:23:56'),(2,'Master+dd','\0',0,'apollo','2023-10-04 08:32:23','apollo','2023-10-04 08:32:23'),(3,'ManageAppMaster+dd','\0',0,'apollo','2023-10-04 08:32:23','apollo','2023-10-04 08:32:23'),(4,'ModifyNamespace+dd+application','\0',0,'apollo','2023-10-04 08:32:23','apollo','2023-10-04 08:32:23'),(5,'ReleaseNamespace+dd+application','\0',0,'apollo','2023-10-04 08:32:23','apollo','2023-10-04 08:32:23'),(6,'ModifyNamespace+dd+application+DEV','\0',0,'apollo','2023-10-04 08:32:23','apollo','2023-10-04 08:32:23'),(7,'ReleaseNamespace+dd+application+DEV','\0',0,'apollo','2023-10-04 08:32:23','apollo','2023-10-04 08:32:23'),(8,'Master+adf','\0',0,'apollo','2023-10-04 08:59:47','apollo','2023-10-04 08:59:47'),(9,'ManageAppMaster+adf','\0',0,'apollo','2023-10-04 08:59:47','apollo','2023-10-04 08:59:47'),(10,'ModifyNamespace+adf+application','\0',0,'apollo','2023-10-04 08:59:47','apollo','2023-10-04 08:59:47'),(11,'ReleaseNamespace+adf+application','\0',0,'apollo','2023-10-04 08:59:47','apollo','2023-10-04 08:59:47'),(12,'ModifyNamespace+adf+application+DEV','\0',0,'apollo','2023-10-04 08:59:47','apollo','2023-10-04 08:59:47'),(13,'ReleaseNamespace+adf+application+DEV','\0',0,'apollo','2023-10-04 08:59:47','apollo','2023-10-04 08:59:47'),(14,'Master+app1','\0',0,'apollo','2023-10-04 13:18:10','apollo','2023-10-04 13:18:10'),(15,'ManageAppMaster+app1','\0',0,'apollo','2023-10-04 13:18:10','apollo','2023-10-04 13:18:10'),(16,'ModifyNamespace+app1+application','\0',0,'apollo','2023-10-04 13:18:10','apollo','2023-10-04 13:18:10'),(17,'ReleaseNamespace+app1+application','\0',0,'apollo','2023-10-04 13:18:10','apollo','2023-10-04 13:18:10'),(18,'ModifyNamespace+app1+application+DEV','\0',0,'apollo','2023-10-04 13:18:10','apollo','2023-10-04 13:18:10'),(19,'ReleaseNamespace+app1+application+DEV','\0',0,'apollo','2023-10-04 13:18:10','apollo','2023-10-04 13:18:10'),(20,'ModifyNamespace+app1+namespace1','\0',0,'apollo','2023-10-04 13:21:55','apollo','2023-10-04 13:21:55'),(21,'ReleaseNamespace+app1+namespace1','\0',0,'apollo','2023-10-04 13:21:55','apollo','2023-10-04 13:21:55'),(22,'ModifyNamespace+app1+namespace1+DEV','\0',0,'apollo','2023-10-04 13:21:55','apollo','2023-10-04 13:21:55'),(23,'ReleaseNamespace+app1+namespace1+DEV','\0',0,'apollo','2023-10-04 13:21:55','apollo','2023-10-04 13:21:55');
/*!40000 ALTER TABLE `Role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `RolePermission`
--

LOCK TABLES `RolePermission` WRITE;
/*!40000 ALTER TABLE `RolePermission` DISABLE KEYS */;
INSERT INTO `RolePermission` VALUES (1,1,1,'\0',0,'apollo','2023-10-04 08:23:56','apollo','2023-10-04 08:23:56'),(2,2,2,'\0',0,'apollo','2023-10-04 08:32:23','apollo','2023-10-04 08:32:23'),(3,2,3,'\0',0,'apollo','2023-10-04 08:32:23','apollo','2023-10-04 08:32:23'),(4,2,4,'\0',0,'apollo','2023-10-04 08:32:23','apollo','2023-10-04 08:32:23'),(5,3,5,'\0',0,'apollo','2023-10-04 08:32:23','apollo','2023-10-04 08:32:23'),(6,4,6,'\0',0,'apollo','2023-10-04 08:32:23','apollo','2023-10-04 08:32:23'),(7,5,7,'\0',0,'apollo','2023-10-04 08:32:23','apollo','2023-10-04 08:32:23'),(8,6,8,'\0',0,'apollo','2023-10-04 08:32:23','apollo','2023-10-04 08:32:23'),(9,7,9,'\0',0,'apollo','2023-10-04 08:32:23','apollo','2023-10-04 08:32:23'),(10,8,10,'\0',0,'apollo','2023-10-04 08:59:47','apollo','2023-10-04 08:59:47'),(11,8,11,'\0',0,'apollo','2023-10-04 08:59:47','apollo','2023-10-04 08:59:47'),(12,8,12,'\0',0,'apollo','2023-10-04 08:59:47','apollo','2023-10-04 08:59:47'),(13,9,13,'\0',0,'apollo','2023-10-04 08:59:47','apollo','2023-10-04 08:59:47'),(14,10,14,'\0',0,'apollo','2023-10-04 08:59:47','apollo','2023-10-04 08:59:47'),(15,11,15,'\0',0,'apollo','2023-10-04 08:59:47','apollo','2023-10-04 08:59:47'),(16,12,16,'\0',0,'apollo','2023-10-04 08:59:47','apollo','2023-10-04 08:59:47'),(17,13,17,'\0',0,'apollo','2023-10-04 08:59:47','apollo','2023-10-04 08:59:47'),(18,14,18,'\0',0,'apollo','2023-10-04 13:18:10','apollo','2023-10-04 13:18:10'),(19,14,19,'\0',0,'apollo','2023-10-04 13:18:10','apollo','2023-10-04 13:18:10'),(20,14,20,'\0',0,'apollo','2023-10-04 13:18:10','apollo','2023-10-04 13:18:10'),(21,15,21,'\0',0,'apollo','2023-10-04 13:18:10','apollo','2023-10-04 13:18:10'),(22,16,22,'\0',0,'apollo','2023-10-04 13:18:10','apollo','2023-10-04 13:18:10'),(23,17,23,'\0',0,'apollo','2023-10-04 13:18:10','apollo','2023-10-04 13:18:10'),(24,18,24,'\0',0,'apollo','2023-10-04 13:18:10','apollo','2023-10-04 13:18:10'),(25,19,25,'\0',0,'apollo','2023-10-04 13:18:10','apollo','2023-10-04 13:18:10'),(26,20,26,'\0',0,'apollo','2023-10-04 13:21:55','apollo','2023-10-04 13:21:55'),(27,21,27,'\0',0,'apollo','2023-10-04 13:21:55','apollo','2023-10-04 13:21:55'),(28,22,28,'\0',0,'apollo','2023-10-04 13:21:55','apollo','2023-10-04 13:21:55'),(29,23,29,'\0',0,'apollo','2023-10-04 13:21:55','apollo','2023-10-04 13:21:55');
/*!40000 ALTER TABLE `RolePermission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `SPRING_SESSION`
--

LOCK TABLES `SPRING_SESSION` WRITE;
/*!40000 ALTER TABLE `SPRING_SESSION` DISABLE KEYS */;
INSERT INTO `SPRING_SESSION` VALUES ('93131bf3-a091-4cd3-a000-cc1ce28f42c0','3c7223e5-53af-43fa-96c4-e121d59f88c0',1696846810738,1696848234056,86400000,1783248234056,'apollo');
/*!40000 ALTER TABLE `SPRING_SESSION` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `SPRING_SESSION_ATTRIBUTES`
--

LOCK TABLES `SPRING_SESSION_ATTRIBUTES` WRITE;
/*!40000 ALTER TABLE `SPRING_SESSION_ATTRIBUTES` DISABLE KEYS */;
INSERT INTO `SPRING_SESSION_ATTRIBUTES` VALUES ('93131bf3-a091-4cd3-a000-cc1ce28f42c0','SPRING_SECURITY_CONTEXT','{\"@class\":\"org.springframework.security.core.context.SecurityContextImpl\",\"authentication\":{\"@class\":\"org.springframework.security.authentication.UsernamePasswordAuthenticationToken\",\"authorities\":[\"java.util.Collections$UnmodifiableRandomAccessList\",[{\"@class\":\"org.springframework.security.core.authority.SimpleGrantedAuthority\",\"authority\":\"ROLE_user\"}]],\"details\":{\"@class\":\"org.springframework.security.web.authentication.WebAuthenticationDetails\",\"remoteAddress\":\"127.0.0.1\",\"sessionId\":\"4d55ab5d-6cef-4a00-b73c-bac090b27537\"},\"authenticated\":true,\"principal\":{\"@class\":\"org.springframework.security.core.userdetails.User\",\"password\":null,\"username\":\"apollo\",\"authorities\":[\"java.util.Collections$UnmodifiableSet\",[{\"@class\":\"org.springframework.security.core.authority.SimpleGrantedAuthority\",\"authority\":\"ROLE_user\"}]],\"accountNonExpired\":true,\"accountNonLocked\":true,\"credentialsNonExpired\":true,\"enabled\":true},\"credentials\":null}}');
/*!40000 ALTER TABLE `SPRING_SESSION_ATTRIBUTES` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `ServerConfig`
--

LOCK TABLES `ServerConfig` WRITE;
/*!40000 ALTER TABLE `ServerConfig` DISABLE KEYS */;
INSERT INTO `ServerConfig` VALUES (1,'apollo.portal.envs','dev','可支持的环境列表','\0',0,'default','2023-10-04 08:07:52','','2023-10-04 08:07:52'),(2,'organizations','[{\"orgId\":\"TEST1\",\"orgName\":\"样例部门1\"},{\"orgId\":\"TEST2\",\"orgName\":\"样例部门2\"}]','部门列表','\0',0,'default','2023-10-04 08:07:52','','2023-10-04 08:07:52'),(3,'superAdmin','apollo','Portal超级管理员','\0',0,'default','2023-10-04 08:07:52','','2023-10-04 08:07:52'),(4,'api.readTimeout','10000','http接口read timeout','\0',0,'default','2023-10-04 08:07:52','','2023-10-04 08:07:52'),(5,'consumer.token.salt','someSalt','consumer token salt','\0',0,'default','2023-10-04 08:07:52','','2023-10-04 08:07:52'),(6,'admin.createPrivateNamespace.switch','true','是否允许项目管理员创建私有namespace','\0',0,'default','2023-10-04 08:07:52','','2023-10-04 08:07:52'),(7,'configView.memberOnly.envs','pro','只对项目成员显示配置信息的环境列表，多个env以英文逗号分隔','\0',0,'default','2023-10-04 08:07:52','','2023-10-04 08:07:52'),(8,'apollo.portal.meta.servers','{}','各环境Meta Service列表','\0',0,'default','2023-10-04 08:07:52','','2023-10-04 08:07:52');
/*!40000 ALTER TABLE `ServerConfig` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `UserRole`
--

LOCK TABLES `UserRole` WRITE;
/*!40000 ALTER TABLE `UserRole` DISABLE KEYS */;
INSERT INTO `UserRole` VALUES (1,'apollo',2,'\0',0,'apollo','2023-10-04 08:32:23','apollo','2023-10-04 08:32:23'),(2,'apollo',4,'\0',0,'apollo','2023-10-04 08:32:23','apollo','2023-10-04 08:32:23'),(3,'apollo',5,'\0',0,'apollo','2023-10-04 08:32:23','apollo','2023-10-04 08:32:23'),(4,'apollo',8,'\0',0,'apollo','2023-10-04 08:59:47','apollo','2023-10-04 08:59:47'),(5,'apollo',10,'\0',0,'apollo','2023-10-04 08:59:47','apollo','2023-10-04 08:59:47'),(6,'apollo',11,'\0',0,'apollo','2023-10-04 08:59:47','apollo','2023-10-04 08:59:47'),(7,'apollo',14,'\0',0,'apollo','2023-10-04 13:18:10','apollo','2023-10-04 13:18:10'),(8,'apollo',16,'\0',0,'apollo','2023-10-04 13:18:10','apollo','2023-10-04 13:18:10'),(9,'apollo',17,'\0',0,'apollo','2023-10-04 13:18:10','apollo','2023-10-04 13:18:10'),(10,'apollo',20,'\0',0,'apollo','2023-10-04 13:21:55','apollo','2023-10-04 13:21:55'),(11,'apollo',21,'\0',0,'apollo','2023-10-04 13:21:55','apollo','2023-10-04 13:21:55');
/*!40000 ALTER TABLE `UserRole` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `Users`
--

LOCK TABLES `Users` WRITE;
/*!40000 ALTER TABLE `Users` DISABLE KEYS */;
INSERT INTO `Users` VALUES (1,'apollo','$2a$10$7r20uS.BQ9uBpf3Baj3uQOZvMVvB1RN3PYoKE94gtz2.WAOuiiwXS','apollo','apollo@acme.com',1),(2,'user1','{bcrypt}$2a$10$Ueh90zXusCMJu6.hMHMWL.xeV2vDxa76BoVM7qxs2Y5kYVFkKs9Uq','user1','xx',1),(3,'user2','{bcrypt}$2a$10$5IEhr5K61ctChfmJY1hVmOT/FeNRWAhzEn3MT2KyWqHKxQgwDk9xi','user2','xx',1),(4,'user3','{bcrypt}$2a$10$SKHILNMRin7qWvh7LZiYy.T1HEScif6KSh5uqVmGfakl4CTUMlxwS','user3','33',1),(5,'user4','{bcrypt}$2a$10$4UBHvnPPBisZvw1UckxjXu.9BXvQ7wi59qGFB8izs1iIiWIxxe6z2','user4','ddd',1),(6,'user5','{bcrypt}$2a$10$vRQMh8osZ1desk/bT5/SfuLEh2oFKnktYUOp9S69K4n12GoUE9EhC','user5','99',1),(7,'user6','{bcrypt}$2a$10$Bw9GRyjUVGDM3a0ehNEoeeUfkP9pDcv5O9dBoczj3w4MQtGyqnLou','user6','99',1),(8,'user7','{bcrypt}$2a$10$lwAO3MbBW/Qc.g.YwGDb8u1KYgOz/pMVBlvkO74WOZGX3zuOBAZ0u','user7','999u',1),(9,'user8','{bcrypt}$2a$10$poW3jA2Eb5f23LYkJuSmhe7fMfBDeNLfHISNj6/YGlLu5e/Y3m8GS','user8','234',1),(10,'user9','{bcrypt}$2a$10$14K59S7PwPTp/91JqC9HYOkDd4VfwssNnImfO8OZ.QcXtIxlnOE/C','user9','8',1),(11,'user10','{bcrypt}$2a$10$o6jbI.t2RqUh/cLVBWgKt.ASTlJkLsCsPZs467VuaBaSUOLJzCjay','user10','ii',1);
/*!40000 ALTER TABLE `Users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-10-09 20:28:33
