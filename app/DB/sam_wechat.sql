-- MySQL dump 10.13  Distrib 5.6.19, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: sam_wechat
-- ------------------------------------------------------
-- Server version	5.6.19-0ubuntu0.14.04.4

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
-- Table structure for table `adp_article`
--

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

--
-- Dumping data for table `adp_article`
--

LOCK TABLES `adp_article` WRITE;
/*!40000 ALTER TABLE `adp_article` DISABLE KEYS */;
/*!40000 ALTER TABLE `adp_article` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `file_path`
--

DROP TABLE IF EXISTS `file_path`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `file_path` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `url` varchar(500) NOT NULL,
  `path` varchar(200) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `file_path`
--

LOCK TABLES `file_path` WRITE;
/*!40000 ALTER TABLE `file_path` DISABLE KEYS */;
/*!40000 ALTER TABLE `file_path` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stores`
--

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stores`
--

LOCK TABLES `stores` WRITE;
/*!40000 ALTER TABLE `stores` DISABLE KEYS */;
/*!40000 ALTER TABLE `stores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `temp_event_log`
--

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

--
-- Dumping data for table `temp_event_log`
--

LOCK TABLES `temp_event_log` WRITE;
/*!40000 ALTER TABLE `temp_event_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `temp_event_log` ENABLE KEYS */;
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

--
-- Dumping data for table `user_premission`
--

LOCK TABLES `user_premission` WRITE;
/*!40000 ALTER TABLE `user_premission` DISABLE KEYS */;
INSERT INTO `user_premission` VALUES (1,'user_usercontrol');
/*!40000 ALTER TABLE `user_premission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wechat_admin`
--

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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wechat_admin`
--

LOCK TABLES `wechat_admin` WRITE;
/*!40000 ALTER TABLE `wechat_admin` DISABLE KEYS */;
INSERT INTO `wechat_admin` VALUES (1,'admin','0707e77d5f844af62318bb82dae3089e','2016-12-21 07:05:48','2016-05-13 09:25:01');
/*!40000 ALTER TABLE `wechat_admin` ENABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wechat_events`
--

LOCK TABLES `wechat_events` WRITE;
/*!40000 ALTER TABLE `wechat_events` DISABLE KEYS */;
/*!40000 ALTER TABLE `wechat_events` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wechat_feedbacks`
--

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wechat_feedbacks`
--

LOCK TABLES `wechat_feedbacks` WRITE;
/*!40000 ALTER TABLE `wechat_feedbacks` DISABLE KEYS */;
/*!40000 ALTER TABLE `wechat_feedbacks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wechat_getmsglog`
--

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
-- Table structure for table `wechat_jssdk`
--

DROP TABLE IF EXISTS `wechat_jssdk`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wechat_jssdk` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `domain` varchar(50) NOT NULL,
  `editorid` int(11) NOT NULL,
  `jsfilename` varchar(50) NOT NULL,
  `jscontent` longtext NOT NULL,
  `createTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `wechat_jssdk_eid` (`editorid`),
  CONSTRAINT `wechat_jssdk_id` FOREIGN KEY (`editorid`) REFERENCES `wechat_admin` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wechat_jssdk`
--

LOCK TABLES `wechat_jssdk` WRITE;
/*!40000 ALTER TABLE `wechat_jssdk` DISABLE KEYS */;
/*!40000 ALTER TABLE `wechat_jssdk` ENABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wechat_keyword_tag`
--

LOCK TABLES `wechat_keyword_tag` WRITE;
/*!40000 ALTER TABLE `wechat_keyword_tag` DISABLE KEYS */;
/*!40000 ALTER TABLE `wechat_keyword_tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wechat_menu`
--

DROP TABLE IF EXISTS `wechat_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wechat_menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `menuName` varchar(80) NOT NULL,
  `eventtype` varchar(50) NOT NULL,
  `eventKey` varchar(50) DEFAULT NULL,
  `eventUrl` varchar(255) DEFAULT NULL,
  `eventmedia_id` varchar(255) DEFAULT NULL,
  `width` enum('1','2','3','4','5') DEFAULT '1',
  `createTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wechat_menu`
--

LOCK TABLES `wechat_menu` WRITE;
/*!40000 ALTER TABLE `wechat_menu` DISABLE KEYS */;
/*!40000 ALTER TABLE `wechat_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wechat_menu_hierarchy`
--

DROP TABLE IF EXISTS `wechat_menu_hierarchy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wechat_menu_hierarchy` (
  `tid` int(11) NOT NULL,
  `parent` int(11) DEFAULT '0',
  KEY `wechat_menu_id` (`tid`),
  CONSTRAINT `wechat_menu_id` FOREIGN KEY (`tid`) REFERENCES `wechat_menu` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wechat_menu_hierarchy`
--

LOCK TABLES `wechat_menu_hierarchy` WRITE;
/*!40000 ALTER TABLE `wechat_menu_hierarchy` DISABLE KEYS */;
/*!40000 ALTER TABLE `wechat_menu_hierarchy` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wechat_oauth`
--

DROP TABLE IF EXISTS `wechat_oauth`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wechat_oauth` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  `redirect_url` varchar(250) NOT NULL,
  `callback_url` varchar(250) NOT NULL,
  `scope` varchar(50) NOT NULL,
  `oauthfile` varchar(50) NOT NULL,
  `createTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wechat_oauth`
--

LOCK TABLES `wechat_oauth` WRITE;
/*!40000 ALTER TABLE `wechat_oauth` DISABLE KEYS */;
/*!40000 ALTER TABLE `wechat_oauth` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wechat_qrcode`
--

DROP TABLE IF EXISTS `wechat_qrcode`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wechat_qrcode` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `qrName` varchar(200) NOT NULL,
  `qrSceneid` int(11) DEFAULT NULL,
  `qrScenestr` varchar(200) DEFAULT NULL,
  `qrTicket` varchar(255) NOT NULL,
  `qrExpire` int(11) DEFAULT NULL,
  `qrSubscribe` int(11) DEFAULT '0',
  `qrScan` int(11) DEFAULT '0',
  `qrUrl` varchar(255) DEFAULT NULL,
  `feedbackid` varchar(200) DEFAULT NULL,
  `qrtype` enum('1','2') DEFAULT '1' COMMENT '1.永久,2.临时',
  `createTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `qrTicket` (`qrTicket`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wechat_qrcode`
--

LOCK TABLES `wechat_qrcode` WRITE;
/*!40000 ALTER TABLE `wechat_qrcode` DISABLE KEYS */;
/*!40000 ALTER TABLE `wechat_qrcode` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-12-21  7:26:29
