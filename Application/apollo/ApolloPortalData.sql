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
