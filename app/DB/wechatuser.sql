DROP TABLE IF EXISTS `wechat_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wechat_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `openid` varchar(50) NOT NULL,
  `nickname` varchar(50) NOT NULL,
  `headimgurl` varchar(255) NOT NULL,
  `sex` enum('0','1','2') DEFAULT '0' COMMENT '0 null,1 male,2 female',
  `country` varchar(60) DEFAULT NULL,
  `province` varchar(60) DEFAULT NULL,
  `city` varchar(60) DEFAULT NULL,
  `status` enum('1','2') DEFAULT '1' COMMENT '1 subscript,2 unsubscript',
  `createtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `openid` (`openid`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

-- analyse
DROP TABLE IF EXISTS `request_analyse`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `request_analyse` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ToUserName` varchar(50) NOT NULL,
  `FromUserName` varchar(50) NOT NULL,
  `MsgType` varchar(50) NOT NULL,
  `analyseid` varchar(50) NOT NULL,
  `CreateTime` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `request_analyse` (`analyseid`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `analyse_text`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `request_text` (
  `analyseid` varchar(50) NOT NULL,
  `Content` varchar(255) NOT NULL,
  KEY `text_analyseid` (`analyseid`),
  CONSTRAINT `text_analyseid` FOREIGN KEY (`analyseid`) REFERENCES `request_analyse` (`analyseid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `analyse_image`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `request_image` (
  `analyseid` varchar(50) NOT NULL,
  `PicUrl` varchar(255) NOT NULL,
  `MediaId` varchar(255) NOT NULL,
  KEY `image_analyseid` (`analyseid`),
  CONSTRAINT `image_analyseid` FOREIGN KEY (`analyseid`) REFERENCES `request_analyse` (`analyseid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `analyse_voice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `request_voice` (
  `analyseid` varchar(50) NOT NULL,
  `MediaId` varchar(255) NOT NULL,
  `Format` varchar(255) NOT NULL,
  KEY `voice_analyseid` (`analyseid`),
  CONSTRAINT `voice_analyseid` FOREIGN KEY (`analyseid`) REFERENCES `request_analyse` (`analyseid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `analyse_video`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `request_video` (
  `analyseid` varchar(50) NOT NULL,
  `MediaId` varchar(255) NOT NULL,
  `ThumbMediaId` varchar(255) NOT NULL,
  KEY `video_analyseid` (`analyseid`),
  CONSTRAINT `video_analyseid` FOREIGN KEY (`analyseid`) REFERENCES `request_analyse` (`analyseid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `analyse_shortvideo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `analyse_shortvideo` (
  `analyseid` varchar(50) NOT NULL,
  `MediaId` varchar(255) NOT NULL,
  `ThumbMediaId` varchar(255) NOT NULL,
  KEY `shortvideo_analyseid` (`analyseid`),
  CONSTRAINT `shortvideo_analyseid` FOREIGN KEY (`analyseid`) REFERENCES `request_analyse` (`analyseid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `analyse_location`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `request_location` (
  `analyseid` varchar(50) NOT NULL,
  `Location_X` varchar(255) NOT NULL,
  `Location_Y` varchar(255) NOT NULL,
  `Scale` varchar(255) NOT NULL,
  `Label` varchar(255) NOT NULL,
  KEY `location_analyseid` (`analyseid`),
  CONSTRAINT `location_analyseid` FOREIGN KEY (`analyseid`) REFERENCES `request_analyse` (`analyseid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `analyse_link`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `request_link` (
  `analyseid` varchar(50) NOT NULL,
  `Title` varchar(255) NOT NULL,
  `Description` varchar(255) NOT NULL,
  `Url` varchar(255) NOT NULL,
  KEY `link_analyseid` (`analyseid`),
  CONSTRAINT `link_analyseid` FOREIGN KEY (`analyseid`) REFERENCES `request_analyse` (`analyseid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `analyse_event`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `request_event` (
  `analyseid` varchar(50) NOT NULL,
  `Event` varchar(255) NOT NULL,
  `EventKey` varchar(255) NOT NULL,
  `Ticket` varchar(255) NOT NULL,
  KEY `event_analyseid` (`analyseid`),
  CONSTRAINT `event_analyseid` FOREIGN KEY (`analyseid`) REFERENCES `request_analyse` (`analyseid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
