-- MySQL dump 10.13  Distrib 5.7.21, for Linux (x86_64)
--
-- Host: localhost    Database: pybbs_ys
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
INSERT INTO `permission` VALUES (1,'首页','index',0),(2,'话题','topic',0),(3,'评论','comment',0),(4,'通知','notification',0),(5,'用户','user',0),(6,'验证码','code',0),(7,'标签','tag',0),(8,'权限','permission',0),(9,'系统','system',0),(10,'后台用户','admin_user',0),(11,'仪表盘','index:index',1),(12,'话题列表','topic:list',2),(13,'话题编辑','topic:edit',2),(14,'话题删除','topic:delete',2),(15,'话题加精','topic:good',2),(16,'话题置顶','topic:top',2),(17,'评论列表','comment:list',3),(18,'评论编辑','comment:edit',3),(19,'评论删除','comment:delete',3),(20,'通知列表','notification:list',4),(21,'通知删除','notification:delete',4),(22,'用户列表','user:list',5),(23,'用户编辑','user:edit',5),(24,'用户删除','user:delete',5),(25,'验证码列表','code:list',6),(26,'标签列表','tag:list',7),(27,'标签编辑','tag:edit',7),(28,'标签删除','tag:delete',7),(29,'标签同步','tag:async',7),(30,'权限列表','permission:list',8),(31,'权限编辑','permission:edit',8),(32,'权限删除','permission:delete',8),(33,'角色','role',0),(34,'日志','log',0),(35,'角色列表','role:list',33),(36,'角色编辑','role:edit',33),(37,'角色删除','role:delete',33),(38,'系统设置','system:edit',9),(39,'后台用户列表','admin_user:list',10),(40,'后台用户编辑','admin_user:edit',10),(41,'后台用户创建','admin_user:add',10),(42,'日志列表','log:list',34),(43,'用户刷新Token','user:refresh_token',5),(44,'权限添加','permission:add',8),(45,'索引单个话题','topic:index',2),(46,'索引全部话题','topic:index_all',2),(48,'删除索引','topic:delete_index',2),(49,'删除所有话题索引','topic:delete_all_index',2),(50,'敏感词','sensitive_word',0),(51,'敏感词列表','sensitive_word:list',50),(52,'敏感词添加','sensitive_word:add',50),(53,'敏感词编辑','sensitive_word:edit',50),(54,'敏感词删除','sensitive_word:delete',50),(55,'敏感词导入','sensitive_word:import',50),(56,'评论审核','comment:examine',3);
/*!40000 ALTER TABLE `permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` VALUES (2,'审核员'),(1,'超级管理员');
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
INSERT INTO `system_config` VALUES (1,'admin_remember_me_max_age','30','登录后台记住我功能记住时间，单位：天',23,'number',NULL,1),(2,'base_url','http://localhost:8080','网站部署后访问的域名，注意这个后面没有 \"/\"',23,'url',NULL,0),(3,'comment_layer','1','评论盖楼形式显示',23,'radio',NULL,0),(4,'cookie_domain','localhost','存cookie时用到的域名，要与网站部署后访问的域名一致',23,'text',NULL,0),(5,'cookie_max_age','604800','cookie有效期，单位秒，默认1周',23,'number',NULL,0),(6,'cookie_name','user_token','存cookie时用到的名称',23,'text',NULL,0),(7,'create_comment_score','5','发布评论奖励的积分',26,'number',NULL,0),(8,'create_topic_score','10','创建话题奖励的积分',26,'number',NULL,0),(9,'delete_comment_score','5','删除评论要被扣除的积分',26,'number',NULL,0),(10,'delete_topic_score','10','删除话题要被扣除的积分',26,'number',NULL,0),(11,'intro','<h5>属于Java语言的bbs</h5><p>在这里，您可以提问，回答，分享，诉说，这是个属于Java程序员的社区，欢迎您的加入！</p>','站点介绍',23,'text',NULL,0),(12,'mail_host','smtp.qq.com','邮箱的smtp服务器地址',24,'text',NULL,0),(13,'mail_password','','发送邮件的邮箱密码',24,'password',NULL,0),(14,'mail_username','xxoo@qq.com','发送邮件的邮箱地址',24,'email',NULL,0),(15,'name','朋也社区','站点名称',23,'text',NULL,0),(16,'page_size','20','分页每页条数',23,'number',NULL,0),(17,'websocket','0','是否开启websocket功能',45,'radio',NULL,1),(18,'static_url','http://localhost:8080/static/upload/','静态文件访问地址，主要用于上传图片的访问，注意最后有个\"/\"',25,'url',NULL,0),(19,'up_comment_score','3','点赞评论奖励评论作者的积分',26,'number',NULL,0),(20,'upload_image_size_limit','2','上传头像文件大小，单位MB，默认2MB',25,'number',NULL,0),(21,'upload_path','/Users/hh/git/github/pybbs/static/upload/','上传文件的路径，注意最后有个\"/\"',25,'text',NULL,0),(22,'up_topic_score','3','点赞话题奖励话题作者的积分',26,'number',NULL,0),(23,NULL,NULL,'基础配置',0,NULL,NULL,0),(24,NULL,NULL,'邮箱配置',0,NULL,NULL,0),(25,NULL,NULL,'上传配置',0,NULL,NULL,0),(26,NULL,NULL,'积分配置',0,NULL,NULL,0),(27,NULL,NULL,'Redis配置',0,NULL,NULL,0),(29,'redis_host','','redis服务host地址',27,'text',NULL,0),(30,'redis_port','','redis服务端口（默认: 6379）',27,'number',NULL,0),(31,'redis_password','','redis服务密码',27,'password',NULL,0),(32,'redis_timeout','2000','网站连接redis服务超时时间，单位毫秒',27,'number',NULL,0),(33,'redis_database','0','网站连接redis服务的哪个数据库，默认0号数据库，取值范围0-15',27,'number',NULL,0),(35,NULL,NULL,'Elasticsearch配置',0,NULL,NULL,0),(36,'elasticsearch_host','','elasticsearch服务的地址',35,'text',NULL,0),(37,'elasticsearch_port','','elasticsearch服务的http端口',35,'number',NULL,0),(38,'elasticsearch_index','','索引的名字',35,'text',NULL,0),(40,NULL,NULL,'Github配置',0,'',NULL,0),(41,'oauth_github_client_id','','Github登录配置项ClientId',40,'text',NULL,0),(42,'oauth_github_client_secret','','Github登录配置项ClientSecret',40,'password',NULL,0),(43,'oauth_github_callback_url','','Github登录配置项回调地址',40,'url',NULL,0),(44,'topic_view_increase_interval','600','同一个用户浏览同一个话题多长时间算一次浏览量，默认10分钟，单位秒（只有当配置了redis才会生效）',23,'number',NULL,0),(45,NULL,NULL,'WebSocket',0,'',NULL,0),(46,'websocket_url','','websocket服务的连接地址',45,'text',NULL,1),(48,'theme','default','系统主题',23,'select','default',0),(49,NULL,NULL,'短信配置',0,NULL,NULL,0),(50,'sms_access_key_id','','创建短信连接的key',49,'text',NULL,0),(51,'sms_secret','','创建短信连接的密钥',49,'password',NULL,0),(52,'sms_sign_name','','短信签名，在阿里云申请的签名',49,'text',NULL,0),(53,'sms_template_code','','短信模板Code，在阿里云申请的模板Code',49,'text',NULL,0),(54,NULL,NULL,'WeChat配置',0,'',NULL,0),(55,'oauth_wechat_client_id','','WeChat登录配置项AppId',54,'text',NULL,0),(56,'oauth_wechat_client_secret','','WeChat登录配置项AppSecret',54,'password',NULL,0),(57,'oauth_wechat_callback_url','','WeChat登录配置项回调地址',54,'url',NULL,0),(58,'sms_region_id','','短信服务所在区域 例如: cn-hangzhou',49,'text',NULL,0),(59,'upload_video_size_limit','20','上传视频文件大小，单位MB，默认20MB',25,'number',NULL,0),(60,NULL,NULL,'Gitee配置',0,'',NULL,0),(61,'oauth_gitee_client_id','','Gitee登录配置项AppId',60,'text',NULL,0),(62,'oauth_gitee_client_secret','','Gitee登录配置项AppSecret',60,'password',NULL,0),(63,'oauth_gitee_callback_url','','Gitee登录配置项回调地址',60,'url',NULL,0),(64,NULL,NULL,'新浪微博配置',0,'',NULL,0),(65,'oauth_weibo_client_id','','新浪微博登录配置项AppId',64,'text',NULL,0),(66,'oauth_weibo_client_secret','','新浪微博登录配置项AppSecret',64,'password',NULL,0),(67,'oauth_weibo_callback_url','','新浪微博登录配置项回调地址',64,'url',NULL,0),(68,NULL,NULL,'开源中国配置',0,'',NULL,0),(69,'oauth_oschina_client_id','','开源中国登录配置项AppId',68,'text',NULL,0),(70,'oauth_oschina_client_secret','','开源中国登录配置项AppSecret',68,'password',NULL,0),(71,'oauth_oschina_callback_url','','开源中国登录配置项回调地址',68,'url',NULL,0),(72,'user_need_active','1','新注册用户需要激活',23,'radio',NULL,0),(73,'content_style','MD','发帖或者回复的输入框语法风格',23,'select','RICH,MD',1),(75,NULL,'','云存储',0,NULL,NULL,0),(76,'cloud_storage_platform','LOCAL','云存储平台',75,'select','LOCAL,QINIU,OSS',0),(77,'oss_key','','阿里云存储key',75,'text',NULL,0),(78,'oss_secret','','阿里云存储secret',75,'text',NULL,0),(79,'oss_bucket','','阿里云存储bucket',75,'text',NULL,0),(80,'oss_end_point','http://oss-cn-hangzhou.aliyuncs.com','阿里云存储上传地址（请根据文档来设置）',75,'url',NULL,0),(81,'qiniu_key','','七牛云存储key',75,'text',NULL,0),(82,'qiniu_secret','','七牛云存储secret',75,'text',NULL,0),(83,'qiniu_bucket','','七牛云存储bucket',75,'text',NULL,0),(84,'qiniu_domain','','七牛云存储访问域名(最后没有/)',75,'url',NULL,0),(85,NULL,'','Telegram',0,NULL,NULL,0),(86,'tg_webhook_secret_token','','回调鉴权密钥(webhook)',85,'password',NULL,0),(87,'tg_access_token','','机器人接口令牌',85,'password',NULL,0),(88,'tg_to_chat_id','','TG接收消息用户ID',85,'text',NULL,0),(89,'comment_need_examine','0','评论是否需要审核',23,'radio',NULL,0),(90,NULL,NULL,'系统代理',0,NULL,NULL,0),(91,'http_proxy','','代理地址(如：127.0.0.1)',90,'text',NULL,1),(92,'http_proxy_port','','代理端口(如：1087)',90,'number',NULL,1);
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
INSERT INTO `topic` VALUES (1,'asdfa','asdf','2023-10-01 18:16:31',NULL,1,'MD',0,0,3,'\0','\0',NULL),(2,'懒得看2','对冯绍峰','2023-10-01 18:56:57',NULL,1,'MD',0,0,1,'\0','\0',NULL),(3,'懒得看23','对冯绍峰','2023-10-01 19:16:11',NULL,1,'MD',0,0,1,'\0','\0',NULL),(4,'懒得看233','对冯绍峰','2023-10-01 19:16:15',NULL,1,'MD',0,0,1,'\0','\0',NULL),(5,'懒得看2333','对冯绍峰','2023-10-01 19:16:18',NULL,1,'MD',0,0,1,'\0','\0',NULL),(6,'懒得看2333fs','对冯绍峰','2023-10-01 19:16:53',NULL,1,'MD',0,0,1,'\0','\0',NULL),(7,'懒得看f2333fs','对冯绍峰','2023-10-01 19:16:57',NULL,1,'MD',0,0,1,'\0','\0',NULL),(8,'懒得看f2d333fs','对冯绍峰','2023-10-01 19:17:05',NULL,1,'MD',0,0,1,'\0','\0',NULL),(9,'懒得看f2fad333fs','对冯绍峰','2023-10-01 19:17:10',NULL,1,'MD',0,0,1,'\0','\0',NULL),(10,'懒得看fdfs2fad333fs','对冯绍峰','2023-10-01 19:17:13',NULL,1,'MD',0,0,1,'\0','\0',NULL),(11,'懒得看fdfs2fsfad333fs','对冯绍峰','2023-10-01 19:17:19',NULL,1,'MD',0,0,1,'\0','\0',NULL),(12,'懒得看fdfsaf2fsfad333fs','对冯绍峰','2023-10-01 19:17:26',NULL,1,'MD',0,0,1,'\0','\0',NULL),(13,'懒得看fdfsafdd2fsfad333fs','对冯绍峰','2023-10-01 19:17:33',NULL,1,'MD',0,0,1,'\0','\0',NULL);
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
