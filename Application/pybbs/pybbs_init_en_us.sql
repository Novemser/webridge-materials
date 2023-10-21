-- MySQL dump 10.13  Distrib 5.7.21, for Linux (x86_64)
--
-- Host: localhost    Database: pybbs
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
-- Dumping data for table `admin_user`
--

LOCK TABLES `admin_user` WRITE;
/*!40000 ALTER TABLE `admin_user` DISABLE KEYS */;
INSERT INTO `admin_user` VALUES (1,'admin','$2a$10$0F6RXnrQDF8SsOudYk7uhuWlqq3kjPuPm4UGeDCj0gvO8xj2pbZ4y','2018-11-11 11:11:11',1);
/*!40000 ALTER TABLE `admin_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `code`
--

LOCK TABLES `code` WRITE;
/*!40000 ALTER TABLE `code` DISABLE KEYS */;
INSERT INTO `code` VALUES (1,1,'168036','2023-10-01 18:09:56','2023-10-01 18:39:56','xxx@qq.com',NULL,'\0');
/*!40000 ALTER TABLE `code` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `collect`
--

LOCK TABLES `collect` WRITE;
/*!40000 ALTER TABLE `collect` DISABLE KEYS */;
/*!40000 ALTER TABLE `collect` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `comment`
--

LOCK TABLES `comment` WRITE;
/*!40000 ALTER TABLE `comment` DISABLE KEYS */;
/*!40000 ALTER TABLE `comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `flyway_schema_history`
--

LOCK TABLES `flyway_schema_history` WRITE;
/*!40000 ALTER TABLE `flyway_schema_history` DISABLE KEYS */;
INSERT INTO `flyway_schema_history` VALUES (1,'1','initialize','SQL','V1__initialize.sql',-1378939418,'admin','2023-10-01 08:57:42',180,1),(2,'1.1','user add field','SQL','V1.1__user_add_field.sql',-1736650319,'admin','2023-10-01 08:57:42',53,1),(3,'1.2','update system config default theme','SQL','V1.2__update_system_config_default_theme.sql',687574408,'admin','2023-10-01 08:57:42',1,1),(4,'1.3','delete system config redis ssl','SQL','V1.3__delete_system_config_redis_ssl.sql',-1669204463,'admin','2023-10-01 08:57:42',0,1),(5,'1.4','alter code','SQL','V1.4__alter_code.sql',-327324787,'admin','2023-10-01 08:57:42',32,1),(6,'1.5','add sensitive word','SQL','V1.5__add_sensitive_word.sql',2025643180,'admin','2023-10-01 08:57:42',6,1),(7,'1.6','add permission about sensitive word','SQL','V1.6__add_permission_about_sensitive_word.sql',1809016534,'admin','2023-10-01 08:57:42',0,1),(8,'1.7','alter oauth user','SQL','V1.7__alter_oauth_user.sql',1995083533,'admin','2023-10-01 08:57:42',43,1),(9,'1.8','add sms region id','SQL','V1.8__add_sms_region_id.sql',-1573162888,'admin','2023-10-01 08:57:42',0,1),(10,'1.9','update system config ws','SQL','V1.9__update_system_config_ws.sql',-495143501,'admin','2023-10-01 08:57:42',0,1),(11,'1.10','delete system config search','SQL','V1.10__delete_system_config_search.sql',-1816442396,'admin','2023-10-01 08:57:42',0,1),(12,'1.11','update system config key','SQL','V1.11__update_system_config_key.sql',-1193486508,'admin','2023-10-01 08:57:42',0,1),(13,'1.12','add indexes','SQL','V1.12__add_indexes.sql',-1379568353,'admin','2023-10-01 08:57:42',48,1),(14,'1.13','add social config','SQL','V1.13__add_social_config.sql',1664912674,'admin','2023-10-01 08:57:42',0,1),(15,'1.14','add system config user need active','SQL','V1.14__add_system_config_user_need_active.sql',-524623913,'admin','2023-10-01 08:57:42',0,1),(16,'1.15','modify content character','SQL','V1.15__modify_content_character.sql',-1382265815,'admin','2023-10-01 08:57:42',50,1),(17,'1.16','add column content style','SQL','V1.16__add_column_content_style.sql',2072048403,'admin','2023-10-01 08:57:42',27,1),(18,'1.17','add cloud storage','SQL','V1.17__add_cloud_storage.sql',232327981,'admin','2023-10-01 08:57:42',2,1),(19,'1.18','add tgbot','SQL','V1.18__add_tgbot.sql',-500352882,'admin','2023-10-01 08:57:42',14,1);
/*!40000 ALTER TABLE `flyway_schema_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `notification`
--

LOCK TABLES `notification` WRITE;
/*!40000 ALTER TABLE `notification` DISABLE KEYS */;
/*!40000 ALTER TABLE `notification` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `oauth_user`
--

LOCK TABLES `oauth_user` WRITE;
/*!40000 ALTER TABLE `oauth_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `permission`
--

LOCK TABLES `permission` WRITE;
/*!40000 ALTER TABLE `permission` DISABLE KEYS */;
INSERT INTO `permission` VALUES (1,'Home','index',0),(2,'Topic','topic',0),(3,'Comment','comment',0),(4,'Notification','notification',0),(5,'User','user',0),(6,'Verification Code','code',0),(7,'Tag','tag',0),(8,'Permission','permission',0),(9,'System','system',0),(10,'Admin User','admin_user',0),(11,'Dashboard','index:index',1),(12,'Topic List','topic:list',2),(13,'Edit Topic','topic:edit',2),(14,'Delete Topic','topic:delete',2),(15,'Highlight Topic','topic:good',2),(16,'Pin Topic','topic:top',2),(17,'Comment List','comment:list',3),(18,'Edit Comment','comment:edit',3),(19,'Delete Comment','comment:delete',3),(20,'Notification List','notification:list',4),(21,'Delete Notification','notification:delete',4),(22,'User List','user:list',5),(23,'Edit User','user:edit',5),(24,'Delete User','user:delete',5),(25,'Verification Code List','code:list',6),(26,'Tag List','tag:list',7),(27,'Edit Tag','tag:edit',7),(28,'Delete Tag','tag:delete',7),(29,'Synchronize Tags','tag:async',7),(30,'Permission List','permission:list',8),(31,'Edit Permission','permission:edit',8),(32,'Delete Permission','permission:delete',8),(33,'Role','role',0),(34,'Log','log',0),(35,'Role List','role:list',33),(36,'Edit Role','role:edit',33),(37,'Delete Role','role:delete',33),(38,'System Settings','system:edit',9),(39,'Admin User List','admin_user:list',10),(40,'Edit Admin User','admin_user:edit',10),(41,'Create Admin User','admin_user:add',10),(42,'Log List','log:list',34),(43,'Refresh User Token','user:refresh_token',5),(44,'Add Permission','permission:add',8),(45,'Index Single Topic','topic:index',2),(46,'Index All Topics','topic:index_all',2),(48,'Delete Index','topic:delete_index',2),(49,'Delete All Topic Indexes','topic:delete_all_index',2),(50,'Sensitive Word','sensitive_word',0),(51,'Sensitive Word List','sensitive_word:list',50),(52,'Add Sensitive Word','sensitive_word:add',50),(53,'Edit Sensitive Word','sensitive_word:edit',50),(54,'Delete Sensitive Word','sensitive_word:delete',50),(55,'Import Sensitive Words','sensitive_word:import',50),(56,'Comment Review','comment:examine',3);
/*!40000 ALTER TABLE `permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` VALUES (2,'Reviewer'),(1,'Super Administrator');
/*!40000 ALTER TABLE `role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `role_permission`
--

LOCK TABLES `role_permission` WRITE;
/*!40000 ALTER TABLE `role_permission` DISABLE KEYS */;
INSERT INTO `role_permission` VALUES (2,11),(2,12),(2,13),(2,14),(2,15),(2,16),(2,17),(2,18),(2,19),(2,26),(2,27),(2,28),(2,29),(1,11),(1,12),(1,13),(1,14),(1,15),(1,16),(1,45),(1,46),(1,48),(1,49),(1,17),(1,18),(1,19),(1,20),(1,21),(1,22),(1,23),(1,24),(1,43),(1,25),(1,26),(1,27),(1,28),(1,29),(1,30),(1,31),(1,32),(1,44),(1,38),(1,39),(1,40),(1,41),(1,35),(1,36),(1,37),(1,42),(1,51),(1,52),(1,53),(1,54),(1,55),(1,56),(2,56);
/*!40000 ALTER TABLE `role_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `sensitive_word`
--

LOCK TABLES `sensitive_word` WRITE;
/*!40000 ALTER TABLE `sensitive_word` DISABLE KEYS */;
/*!40000 ALTER TABLE `sensitive_word` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `system_config`
--

LOCK TABLES `system_config` WRITE;
/*!40000 ALTER TABLE `system_config` DISABLE KEYS */;
INSERT INTO `system_config` VALUES (1,'admin_remember_me_max_age','30','Remember me function remember time after logging in to the background, unit: days',23,'number',NULL,1),(2,'base_url','http://localhost:8080','The domain name accessed after the website is deployed, note that there is no "/" after this',23,'url',NULL,0),(3,'comment_layer','1','Comment floor display form',23,'radio',NULL,0),(4,'cookie_domain','localhost','The domain name used when storing cookies must be consistent with the domain name accessed after the website is deployed',23,'text',NULL,0),(5,'cookie_max_age','604800','Cookie validity period, in seconds, default 1 week',23,'number',NULL,0),(6,'cookie_name','user_token','The name used when storing cookies',23,'text',NULL,0),(7,'create_comment_score','5','Points awarded for publishing comments',26,'number',NULL,0),(8,'create_topic_score','10','Points awarded for creating topics',26,'number',NULL,0),(9,'delete_comment_score','5','Points deducted for deleting comments',26,'number',NULL,0),(10,'delete_topic_score','10','Points deducted for deleting topics',26,'number',NULL,0),(11,'intro','<h5>BBS belonging to the Java language</h5><p>Here, you can ask questions, answer, share, and talk. This is a community for Java programmers. Welcome to join us!</p>','Site introduction',23,'text',NULL,0),(12,'mail_host','smtp.qq.com','SMTP server address for email',24,'text',NULL,0),(13,'mail_password','','Email password for sending emails',24,'password',NULL,0),(14,'mail_username','xxoo@qq.com','Email address for sending emails',24,'email',NULL,0),(15,'name','MyCommunity','Site name',23,'text',NULL,0),(16,'page_size','20','Number of items per page for pagination',23,'number',NULL,0),(17,'websocket','0','Whether to enable websocket function',45,'radio',NULL,1),(18,'static_url','http://localhost:8080/static/upload/','Access address for static files, mainly used for accessing uploaded images, note that there is a "/" at the end',25,'url',NULL,0),(19,'up_comment_score','3','Points rewarded to comment author for liking comments',26,'number',NULL,0),(20,'upload_image_size_limit','2','File size limit for uploading avatars, in MB, default 2MB',25,'number',NULL,0),(21,'upload_path','/Users/hh/git/github/pybbs/static/upload/','File upload path, note that there is a "/" at the end',25,'text',NULL,0),(22,'up_topic_score','3','Points rewarded to topic author for liking topics',26,'number',NULL,0),(23,NULL,NULL,'Basic configuration',0,NULL,NULL,0),(24,NULL,NULL,'Email configuration',0,NULL,NULL,0),(25,NULL,NULL,'Upload configuration',0,NULL,NULL,0),(26,NULL,NULL,'Score configuration',0,NULL,NULL,0),(27,NULL,NULL,'Redis configuration',0,NULL,NULL,0),(29,'redis_host','','Redis service host address',27,'text',NULL,0),(30,'redis_port','','Redis service port (default: 6379)',27,'number',NULL,0),(31,'redis_password','','Redis service password',27,'password',NULL,0),(32,'redis_timeout','2000','Website connection timeout to Redis service, in milliseconds',27,'number',NULL,0),(33,'redis_database','0','Which database the website connects to Redis service, default is database 0, value range is 0-15',27,'number',NULL,0),(35,NULL,NULL,'Elasticsearch configuration',0,NULL,NULL,0),(36,'elasticsearch_host','','Elasticsearch service address',35,'text',NULL,0),(37,'elasticsearch_port','','Elasticsearch service http port',35,'number',NULL,0),(38,'elasticsearch_index','','Index name',35,'text',NULL,0),(40,NULL,NULL,'Github configuration',0,'',NULL,0),(41,'oauth_github_client_id','','Github login configuration ClientId',40,'text',NULL,0),(42,'oauth_github_client_secret','','Github login configuration ClientSecret',40,'password',NULL,0),(43,'oauth_github_callback_url','','Github login configuration callback address',40,'url',NULL,0),(44,'topic_view_increase_interval','600','How long does it take for the same user to browse the same topic to count as a view, default is 10 minutes, in seconds (only works when Redis is configured)',23,'number',NULL,0),(45,NULL,NULL,'WebSocket',0,'',NULL,0),(46,'websocket_url','','Websocket service connection address',45,'text',NULL,1),(48,'theme','default','System theme',23,'select','default',0),(49,NULL,NULL,'SMS configuration',0,NULL,NULL,0),(50,'sms_access_key_id','','Key for creating SMS connection',49,'text',NULL,0),(51,'sms_secret','','Secret for creating SMS connection',49,'password',NULL,0),(52,'sms_sign_name','','SMS signature, obtained from Alibaba Cloud',49,'text',NULL,0),(53,'sms_template_code','','SMS template code, obtained from Alibaba Cloud',49,'text',NULL,0),(54,NULL,NULL,'WeChat configuration',0,'',NULL,0),(55,'oauth_wechat_client_id','','WeChat login configuration AppId',54,'text',NULL,0),(56,'oauth_wechat_client_secret','','WeChat login configuration AppSecret',54,'password',NULL,0),(57,'oauth_wechat_callback_url','','WeChat login configuration callback address',54,'url',NULL,0),(58,'sms_region_id','','Region where SMS service is located, for example: cn-hangzhou',49,'text',NULL,0),(59,'upload_video_size_limit','20','File size limit for uploading videos, in MB, default 20MB',25,'number',NULL,0),(60,NULL,NULL,'Gitee configuration',0,'',NULL,0),(61,'oauth_gitee_client_id','','Gitee login configuration AppId',60,'text',NULL,0),(62,'oauth_gitee_client_secret','','Gitee login configuration AppSecret',60,'password',NULL,0),(63,'oauth_gitee_callback_url','','Gitee login configuration callback address',60,'url',NULL,0),(64,NULL,NULL,'Sina Weibo configuration',0,'',NULL,0),(65,'oauth_weibo_client_id','','Sina Weibo login configuration AppId',64,'text',NULL,0),(66,'oauth_weibo_client_secret','','Sina Weibo login configuration AppSecret',64,'password',NULL,0),(67,'oauth_weibo_callback_url','','Sina Weibo login configuration callback address',64,'url',NULL,0),(68,NULL,NULL,'Open Source China configuration',0,'',NULL,0),(69,'oauth_oschina_client_id','','Open Source China login configuration AppId',68,'text',NULL,0),(70,'oauth_oschina_client_secret','','Open Source China login configuration AppSecret',68,'password',NULL,0),(71,'oauth_oschina_callback_url','','Open Source China login configuration callback address',68,'url',NULL,0),(72,'user_need_active','1','Newly registered users need activation',23,'radio',NULL,0),(73,'content_style','MD','Syntax style of post or reply input box',23,'select','RICH,MD',1),(75,NULL,'','Cloud storage',0,NULL,NULL,0),(76,'cloud_storage_platform','LOCAL','Cloud storage platform',75,'select','LOCAL,QINIU,OSS',0),(77,'oss_key','','Aliyun storage key',75,'text',NULL,0),(78,'oss_secret','','Aliyun storage secret',75,'text',NULL,0),(79,'oss_bucket','','Aliyun storage bucket',75,'text',NULL,0),(80,'oss_end_point','http://oss-cn-hangzhou.aliyuncs.com','Aliyun storage upload address (please set according to the documentation)',75,'url',NULL,0),(81,'qiniu_key','','Qiniu storage key',75,'text',NULL,0),(82,'qiniu_secret','','Qiniu storage secret',75,'text',NULL,0),(83,'qiniu_bucket','','Qiniu storage bucket',75,'text',NULL,0),(84,'qiniu_domain','','Qiniu storage access domain (no "/" at the end)',75,'url',NULL,0),(85,NULL,'','Telegram',0,NULL,NULL,0),(86,'tg_webhook_secret_token','','Callback authentication key (webhook)',85,'password',NULL,0),(87,'tg_access_token','','Bot interface token',85,'password',NULL,0),(88,'tg_to_chat_id','','TG user ID for receiving messages',85,'text',NULL,0),(89,'comment_need_examine','0','Whether comments need to be reviewed',23,'radio',NULL,0),(90,NULL,NULL,'System proxy',0,NULL,NULL,0),(91,'http_proxy','','Proxy address (e.g., 127.0.0.1)',90,'text',NULL,1),(92,'http_proxy_port','','Proxy port (e.g., 1087)',90,'number',NULL,1);
/*!40000 ALTER TABLE `system_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `tag`
--

LOCK TABLES `tag` WRITE;
/*!40000 ALTER TABLE `tag` DISABLE KEYS */;
/*!40000 ALTER TABLE `tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `topic`
--

LOCK TABLES `topic` WRITE;
/*!40000 ALTER TABLE `topic` DISABLE KEYS */;
INSERT INTO `topic` VALUES (1,'asdfa','asdf','2023-10-01 18:16:31',NULL,1,'MD',0,0,3,'\0','\0',NULL),(2,'Topic2','Hello','2023-10-01 18:56:57',NULL,1,'MD',0,0,1,'\0','\0',NULL),(3,'Topic3','YESYES','2023-10-01 19:16:11',NULL,1,'MD',0,0,1,'\0','\0',NULL),(4,'Topic4','grant','2023-10-01 19:16:15',NULL,1,'MD',0,0,1,'\0','\0',NULL),(5,'Topic5','five','2023-10-01 19:16:18',NULL,1,'MD',0,0,1,'\0','\0',NULL),(6,'Topic6','Guess what','2023-10-01 19:16:53',NULL,1,'MD',0,0,1,'\0','\0',NULL),(7,'Topic7','7 lucky','2023-10-01 19:16:57',NULL,1,'MD',0,0,1,'\0','\0',NULL),(8,'Topic8','8888','2023-10-01 19:17:05',NULL,1,'MD',0,0,1,'\0','\0',NULL),(9,'Topic9','9009','2023-10-01 19:17:10',NULL,1,'MD',0,0,1,'\0','\0',NULL),(10,'Topic10','10th','2023-10-01 19:17:13',NULL,1,'MD',0,0,1,'\0','\0',NULL),(11,'Topic11','1000','2023-10-01 19:17:19',NULL,1,'MD',0,0,1,'\0','\0',NULL),(12,'Topic12','and','2023-10-01 19:17:26',NULL,1,'MD',0,0,1,'\0','\0',NULL),(13,'Topic13','Topic13!','2023-10-01 19:17:33',NULL,1,'MD',0,0,1,'\0','\0',NULL);
/*!40000 ALTER TABLE `topic` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `topic_tag`
--

LOCK TABLES `topic_tag` WRITE;
/*!40000 ALTER TABLE `topic_tag` DISABLE KEYS */;
/*!40000 ALTER TABLE `topic_tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'user1','$2a$10$imBuSvAu2hFAvRGHp0573OTdwvSN/AoQJva2ZhZynNhsZFfkFdG1.',NULL,'xxx@qq.com',NULL,NULL,NULL,130,'2023-10-01 18:09:56','3e63b9ca-5ab3-4ec4-9947-4bb7bd3ff34e',NULL,'\0','');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-10-01 19:48:16
