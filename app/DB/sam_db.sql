
DROP TABLE IF EXISTS `adp_article`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `adp_article` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pageid` varchar(50) NOT NULL,
  `pagename` varchar(50) NOT NULL,
  `pagetitle` varchar(50) NOT NULL,
  `content` longtext NOT NULL,
  `submiter` varchar(50) NOT NULL,
  `edittime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `createTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `pageid` (`pageid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;


DROP TABLE IF EXISTS `file_path`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `file_path` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `url` varchar(500) NOT NULL,
  `path` varchar(200) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

DROP TABLE IF EXISTS `stores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stores` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `storename` varchar(100) NOT NULL,
  `address` varchar(100) DEFAULT NULL,
  `phone` varchar(30) DEFAULT NULL,
  `lat` varchar(30) DEFAULT NULL,
  `lng` varchar(30) DEFAULT NULL,
  `openhours` varchar(50) NOT NULL,
  `storemap` varchar(200) NOT NULL,
  `createTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;


DROP TABLE IF EXISTS `temp_event_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `temp_event_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `openid` varchar(30) NOT NULL,
  `texts` varchar(100) NOT NULL,
  `event` varchar(800) NOT NULL,
  `templog` varchar(800) NOT NULL,
  `createTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;


LOCK TABLES `temp_event_log` WRITE;
/*!40000 ALTER TABLE `temp_event_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `temp_event_log` ENABLE KEYS */;
UNLOCK TABLES;


DROP TABLE IF EXISTS `wechat_admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wechat_admin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `latestTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `createTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;



LOCK TABLES `wechat_admin` WRITE;
/*!40000 ALTER TABLE `wechat_admin` DISABLE KEYS */;
INSERT INTO `wechat_admin` VALUES (1,'admin','0707e77d5f844af62318bb82dae3089e','2016-12-08 04:00:03','2016-05-13 09:25:01');
/*!40000 ALTER TABLE `wechat_admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_premission`
--

DROP TABLE IF EXISTS `user_premission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_premission` (
  `uid` int(11) NOT NULL,
  `premission` varchar(50) NOT NULL,
  KEY `wechat_admin_id` (`uid`),
  CONSTRAINT `wechat_admin_id` FOREIGN KEY (`uid`) REFERENCES `wechat_admin` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `user_premission` WRITE;
/*!40000 ALTER TABLE `user_premission` DISABLE KEYS */;
INSERT INTO `user_premission` VALUES (1,'user_usercontrol');
/*!40000 ALTER TABLE `user_premission` ENABLE KEYS */;
UNLOCK TABLES;


--
-- Table structure for table `wechat_events`
--
DROP TABLE IF EXISTS `wechat_events`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wechat_events` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `menuId` varchar(50) NOT NULL,
  `getMsgType` varchar(50) NOT NULL,
  `getContent` varchar(250) NOT NULL,
  `getEvent` varchar(100) NOT NULL,
  `getEventKey` varchar(255) NOT NULL,
  `getTicket` varchar(255) NOT NULL,
  `MsgType` varchar(50) NOT NULL,
  `createTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;


DROP TABLE IF EXISTS `wechat_feedbacks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wechat_feedbacks` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `menuId` varchar(50) NOT NULL,
  `MsgType` varchar(50) NOT NULL,
  `MsgData` longtext NOT NULL,
  `createTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;


DROP TABLE IF EXISTS `wechat_getmsglog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wechat_getmsglog` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `openid` varchar(50) NOT NULL,
  `msgType` varchar(50) NOT NULL,
  `msgXml` longtext NOT NULL,
  `createTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wechat_getmsglog`
--

LOCK TABLES `wechat_getmsglog` WRITE;
/*!40000 ALTER TABLE `wechat_getmsglog` DISABLE KEYS */;
/*!40000 ALTER TABLE `wechat_getmsglog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wechat_keyword_tag`
--

DROP TABLE IF EXISTS `wechat_keyword_tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wechat_keyword_tag` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `menuId` varchar(50) NOT NULL,
  `Tagname` varchar(50) NOT NULL,
  `createTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;


DROP TABLE IF EXISTS `wechat_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wechat_menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mOrder` enum('0','1','2') DEFAULT '0',
  `subOrder` enum('0','1','2','3','4','5') DEFAULT '0',
  `menuName` varchar(80) NOT NULL,
  `eventtype` varchar(50) NOT NULL,
  `eventKey` varchar(50) DEFAULT NULL,
  `eventUrl` varchar(255) DEFAULT NULL,
  `eventmedia_id` varchar(255) DEFAULT NULL,
  `createTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
