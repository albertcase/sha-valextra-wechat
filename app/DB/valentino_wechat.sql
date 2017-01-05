-- MySQL dump 10.13  Distrib 5.6.33, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: valentino_wechat
-- ------------------------------------------------------
-- Server version	5.6.33-0ubuntu0.14.04.1-log

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
-- Table structure for table `analyse_shortvideo`
--

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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `analyse_shortvideo`
--

LOCK TABLES `analyse_shortvideo` WRITE;
/*!40000 ALTER TABLE `analyse_shortvideo` DISABLE KEYS */;
/*!40000 ALTER TABLE `analyse_shortvideo` ENABLE KEYS */;
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
-- Table structure for table `request_analyse`
--

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `request_analyse`
--

LOCK TABLES `request_analyse` WRITE;
/*!40000 ALTER TABLE `request_analyse` DISABLE KEYS */;
/*!40000 ALTER TABLE `request_analyse` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `request_event`
--

DROP TABLE IF EXISTS `request_event`;
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `request_event`
--

LOCK TABLES `request_event` WRITE;
/*!40000 ALTER TABLE `request_event` DISABLE KEYS */;
/*!40000 ALTER TABLE `request_event` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `request_image`
--

DROP TABLE IF EXISTS `request_image`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `request_image` (
  `analyseid` varchar(50) NOT NULL,
  `PicUrl` varchar(255) NOT NULL,
  `MediaId` varchar(255) NOT NULL,
  KEY `image_analyseid` (`analyseid`),
  CONSTRAINT `image_analyseid` FOREIGN KEY (`analyseid`) REFERENCES `request_analyse` (`analyseid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `request_image`
--

LOCK TABLES `request_image` WRITE;
/*!40000 ALTER TABLE `request_image` DISABLE KEYS */;
/*!40000 ALTER TABLE `request_image` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `request_link`
--

DROP TABLE IF EXISTS `request_link`;
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `request_link`
--

LOCK TABLES `request_link` WRITE;
/*!40000 ALTER TABLE `request_link` DISABLE KEYS */;
/*!40000 ALTER TABLE `request_link` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `request_location`
--

DROP TABLE IF EXISTS `request_location`;
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `request_location`
--

LOCK TABLES `request_location` WRITE;
/*!40000 ALTER TABLE `request_location` DISABLE KEYS */;
/*!40000 ALTER TABLE `request_location` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `request_text`
--

DROP TABLE IF EXISTS `request_text`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `request_text` (
  `analyseid` varchar(50) NOT NULL,
  `Content` varchar(255) NOT NULL,
  KEY `text_analyseid` (`analyseid`),
  CONSTRAINT `text_analyseid` FOREIGN KEY (`analyseid`) REFERENCES `request_analyse` (`analyseid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `request_text`
--

LOCK TABLES `request_text` WRITE;
/*!40000 ALTER TABLE `request_text` DISABLE KEYS */;
/*!40000 ALTER TABLE `request_text` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `request_video`
--

DROP TABLE IF EXISTS `request_video`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `request_video` (
  `analyseid` varchar(50) NOT NULL,
  `MediaId` varchar(255) NOT NULL,
  `ThumbMediaId` varchar(255) NOT NULL,
  KEY `video_analyseid` (`analyseid`),
  CONSTRAINT `video_analyseid` FOREIGN KEY (`analyseid`) REFERENCES `request_analyse` (`analyseid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `request_video`
--

LOCK TABLES `request_video` WRITE;
/*!40000 ALTER TABLE `request_video` DISABLE KEYS */;
/*!40000 ALTER TABLE `request_video` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `request_voice`
--

DROP TABLE IF EXISTS `request_voice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `request_voice` (
  `analyseid` varchar(50) NOT NULL,
  `MediaId` varchar(255) NOT NULL,
  `Format` varchar(255) NOT NULL,
  KEY `voice_analyseid` (`analyseid`),
  CONSTRAINT `voice_analyseid` FOREIGN KEY (`analyseid`) REFERENCES `request_analyse` (`analyseid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `request_voice`
--

LOCK TABLES `request_voice` WRITE;
/*!40000 ALTER TABLE `request_voice` DISABLE KEYS */;
/*!40000 ALTER TABLE `request_voice` ENABLE KEYS */;
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
  `brandtype` varchar(50) NOT NULL,
  `storemap` varchar(250) NOT NULL,
  `storelog` varchar(250) NOT NULL,
  `createTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stores`
--

LOCK TABLES `stores` WRITE;
/*!40000 ALTER TABLE `stores` DISABLE KEYS */;
INSERT INTO `stores` VALUES (1,'Valentino北京王府井in88精品店','北京市东城区王府井大街88号\n银泰in88商场L113&L213商铺','(86)10-5978 5868','39.86499','116.379013','周一至周日 10:00 - 22:00','男士系列 | 女士系列 | 配饰系列','','/source/change/store/1.jpg','2016-12-23 08:28:00'),(2,'Valentino北京银泰中心精品店','北京市东城区王府井大街88号银泰in88商场L113&L213商铺','(86)10-5978 5868','39.86499','116.379013','周一至周日 10:00 - 22:30','男士系列 | 女士系列 | 配饰系列','','/source/change/store/2.jpg','2016-12-23 08:28:00'),(3,'Valentino北京新光天地精品店','北京市朝阳区建国路87号新光天地D4035商铺','(86) 10-5738 2555','39.909939','116.478763','周一至周日 10:00 - 22:00','女士鞋履','','/source/change/store/3.jpg','2016-12-23 08:28:00'),(4,'Valentino北京新光天地精品店','北京市朝阳区建国路87号新光天地D1045商铺','(86) 10-5738 1388','39.909939','116.478763','周一至周日 10:00 - 22:00','女士手袋','','/source/change/store/4.jpg','2016-12-23 08:28:00'),(5,'Valentino北京新光天地男装精品店','北京市朝阳区建国路87号新光天地M2007商铺','(86)10-5738 2616','39.86499','116.379013','周一至周日 10:00 - 22:00','男士成衣 | 男士配饰','','/source/change/store/5.jpg','2016-12-23 08:28:00'),(6,'Valentino北京新光天地女装精品店','北京市朝阳区建国路87号新光天地D4012商铺','(86) 10-5738 2589','39.86499','116.379013','周一至周日 10:00 - 22:00','女士成衣','','/source/change/store/6.jpg','2016-12-23 08:28:00'),(7,'Valentino香港Elements圆方男装精品店','香港九龙柯士甸道西一号Elements圆方2025-2026商铺','(852) 2618 6933','22.298341','114.173272','周一至周日 10:00 - 21:00','男士成衣 | 男士配饰','','/source/change/store/7.jpg','2016-12-23 08:28:00'),(8,'Valentino香港Elements圆方女装精品店','香港九龙柯士甸道西一号Elements圆方2045商铺','(852) 2196 8662','22.302757','114.166261','周一至周日 10:00 - 21:00','女士成衣 | 女士配饰','','/source/change/store/8.jpg','2016-12-23 08:28:00'),(9,'Valentino香港国金中心女装精品店','香港中环金融街8号国金中心2070商铺','(852) 2234 7193','22.311668','113.937269','周一至周日 10:30 - 20:00','女士成衣 | 女士配饰','','/source/change/store/9.jpg','2016-12-23 08:28:00'),(10,'Valentino香港置地广场男装精品店','香港中环皇后大道中15号置地广场B20商铺','(852) 2530 2621','22.298341','114.173272','周一至周日 10:30 - 19:30','男士成衣 | 男士配饰','','/source/change/store/10.jpg','2016-12-23 08:28:00'),(11,'Valentino香港置地广场女装精品店','香港中环皇后大道中15号置地广场103-104商铺','(852) 2523 8035','22.299406','114.181263','\"周一至周六 10:30 - 20:00\r周日 11:00 -19:00\"','女士成衣 | 女士配饰','','/source/change/store/11.jpg','2016-12-23 08:28:00'),(12,'Valentino香港广东道旗舰店','香港尖沙嘴广东道7-25号海港城G及LG层G115号商铺','(852) 2328 7821','22.298341','114.173272','周一至周日 10:00 - 22:00','男士系列 | 女士系列 | 配饰系列','','/source/change/store/12.jpg','2016-12-23 08:28:00'),(13,'Valentino香港国际机场精品店','香港国际机场客运大楼6E173 & 6E174商铺','(852) 2602 2845','22.311668','113.937269','周一至周日 7:00 - 23:00','男士系列 | 女士系列 | 配饰系列','','/source/change/store/13.jpg','2016-12-23 08:28:00'),(14,'Valentino上海益丰大厦精品店','上海市黄浦区北京东路99号益丰大厦L105&L205商铺','(86) 21-5308 3671','31.236574','121.50106','周一至周日 11:00 - 22:00','女士配饰','','/source/change/store/14.jpg','2016-12-23 08:28:00'),(15,'Valentino上海恒隆广场男装精品店','上海市南京西路1266号\n恒隆广场303商铺','(86) 21-6288 7896','31.212812','121.41465','周一至周日 10:00 - 22:00','男士成衣 | 男士配饰','','/source/change/store/15.jpg','2016-12-23 08:28:00'),(16,'Valentino上海恒隆广场女装精品店','上海市南京西路1266号\n恒隆广场202商铺','(86) 21-6288 7896','31.214398','121.476959','周一至周日 10:00 - 22:00','女士成衣 | 女士配饰','','/source/change/store/16.jpg','2016-12-23 08:28:00'),(17,'Valentino上海国金中心精品店','上海市浦东新区陆家嘴世纪大道8号\n国金中心L1-27&L2-27商铺','(86) 21-2028 1350','31.236574','121.50106','周一至周日 10:00 - 22:00','男士系列 | 女士系列 | 配饰系列','','/source/change/store/17.jpg','2016-12-23 08:28:00'),(18,'Valentino上海环贸广场女装旗舰店','上海市徐汇区淮海中路999号\n环贸广场L1-106&L2-206&215商铺','(86) 21-6025 8902','31.214398','121.476959','周一至周日 10:00-23:00','女士成衣 | 女士配饰','','/source/change/store/18.jpg','2016-12-23 08:28:00'),(19,'Valentino成都仁恒置地广场女装精品店','成都市人民南路二段一号\n仁恒置地广场114商铺','(86) 28-6873 9290','30.574578','103.955027','周一至周日 10:00 - 22:00','女士成衣 | 女士配饰','','/source/change/store/19.jpg','2016-12-23 08:28:00'),(20,'Valentino成都国际金融中心旗舰店','成都市锦江区红星路三段一号\n国际金融中心108 & 208商铺','(86) 28-6632 0685','30.574578','103.955027','周一至周日 10:00 - 22:00','男士系列 | 女士系列 | 配饰系列','','/source/change/store/20.jpg','2016-12-23 08:28:00'),(21,'Valentino无锡恒隆广场女装精品店','无锡市崇安区人民中路139号恒隆广场126-127商铺','(86) 510-8185 6006','31.596737','120.460157','周一至周日 10:00 - 22:00','女士成衣 | 女士配饰','','/source/change/store/21.jpg','2016-12-23 08:28:00'),(22,'Valentino沈阳恒隆广场旗舰店','沈阳市沈河区青年大街1号市府恒隆广场107-108商铺及207-208商铺','(86) 24-2296 2626','41.636362','123.490787','周一至周日 10:00 - 22:00','男士系列 | 女士系列 | 配饰系列','','/source/change/store/22.jpg','2016-12-23 08:28:00'),(23,'Valentino西安时代广场旗舰店','西安市环城南路336号世纪金花珠江时代广场115商铺','(86) 29-8935 8803','34.277172','108.961917','\"周日至周四 10:00-21:30 \r周五、周六 10:00-22:00\"','男士系列 | 女士系列 | 配饰系列','','/source/change/store/23.jpg','2016-12-23 08:28:00'),(24,'Valentino青岛海信广场精品店','青岛市澳门路117号海信广场1楼1135&1137单元 Valentino商铺','(86) 532-6678 8632','36.266048','120.386826','周一至周日 10:00 - 22:00','男士系列 | 女士系列 | 配饰系列','','/source/change/store/24.jpg','2016-12-23 08:28:00'),(25,'Valentino厦门磐基中心女装精品店','福建省厦门市莲岳路1号磐基中心L116-117店铺','(86) 592-507 8328','24.534585','118.131673','周一至周日 10:00 - 22:00','女士成衣 | 女士配饰','','/source/change/store/25.jpg','2016-12-23 08:28:00'),(26,'Valentino上海IFC国金中心精品店','上海浦东新区世纪大道8号IFC商场首层L1&L2-27','','31.241905','121.508862','周一至周日 10:00 - 22:00','男士系列 | 女士系列 | 配饰系列','','/source/change/store/26.jpg','2016-12-23 08:28:00');
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
INSERT INTO `user_premission` VALUES (1,'user_usercontrol'),(3,'wechat_api_wechatmenu'),(3,'wechat_api_keyword'),(3,'user_selfcontrol');
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wechat_admin`
--

LOCK TABLES `wechat_admin` WRITE;
/*!40000 ALTER TABLE `wechat_admin` DISABLE KEYS */;
INSERT INTO `wechat_admin` VALUES (1,'admin','9f1afee1b1e64871f1dc70174d014933','2016-12-29 07:38:45','2016-05-13 09:25:01'),(3,'leo','c056289c729f32e9230e273cf91d6ffc','2016-12-22 06:10:37','2016-12-22 06:09:29');
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
) ENGINE=InnoDB AUTO_INCREMENT=98 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wechat_events`
--

LOCK TABLES `wechat_events` WRITE;
/*!40000 ALTER TABLE `wechat_events` DISABLE KEYS */;
INSERT INTO `wechat_events` VALUES (1,'20','event','','click','e1482313600124','','news','2016-12-21 09:46:40'),(2,'22','event','','click','e1482313812637','','news','2016-12-21 09:50:12'),(3,'25','event','','click','e1482314369290','','news','2016-12-21 09:59:29'),(4,'26','event','','click','e1482385965876','','news','2016-12-22 05:52:45'),(5,'27','event','','click','e1482386262088','','news','2016-12-22 05:57:42'),(7,'30','event','','click','e1482386718913','','news','2016-12-22 06:05:18'),(8,'31','event','','click','e1482387260047','','news','2016-12-22 06:14:19'),(9,'32','event','','click','e1482387481799','','news','2016-12-22 06:18:01'),(10,'33','event','','click','e1482387699472','','news','2016-12-22 06:21:39'),(11,'34','event','','click','e1482387927649','','news','2016-12-22 06:25:27'),(12,'auto585b731a3cefe','event','','subscribe','','','text','2016-12-22 06:30:50'),(13,'auto585b733085c8e','event','','defaultback','','','text','2016-12-22 06:31:12'),(14,'tag585b92f240b91','text','合作','','','','text','2016-12-22 08:46:42'),(15,'tag585b931e72d87','text','价格','','','','text','2016-12-22 08:47:26'),(16,'tag585b9331ee59b','text','售后','','','','text','2016-12-22 08:47:45'),(17,'tag585b9370c5642','text','真假','','','','text','2016-12-22 08:48:48'),(18,'tag585b9370c5642','text','正品','','','','text','2016-12-22 08:48:48'),(19,'tag585b9370c5642','text','真伪','','','','text','2016-12-22 08:48:48'),(20,'tag585b9370c5642','text','假货','','','','text','2016-12-22 08:48:48'),(21,'tag585b9370c5642','text','是不是正品','','','','text','2016-12-22 08:48:48'),(22,'tag585b93aaacf79','text','坏了','','','','text','2016-12-22 08:49:46'),(23,'tag585b93aaacf79','text','开胶','','','','text','2016-12-22 08:49:46'),(24,'tag585b93aaacf79','text','投诉','','','','text','2016-12-22 08:49:46'),(25,'tag585b93aaacf79','text','脱线','','','','text','2016-12-22 08:49:46'),(26,'tag585b93aaacf79','text','服务','','','','text','2016-12-22 08:49:46'),(27,'tag585b93aaacf79','text','开线','','','','text','2016-12-22 08:49:46'),(28,'tag585b93f3b3b7f','text','店铺','','','','text','2016-12-22 08:50:59'),(29,'tag585b93f3b3b7f','text','店','','','','text','2016-12-22 08:50:59'),(30,'tag585b93f3b3b7f','text','门店','','','','text','2016-12-22 08:50:59'),(31,'tag585b93f3b3b7f','text','精品店','','','','text','2016-12-22 08:50:59'),(32,'tag585b93f3b3b7f','text','旗舰店','','','','text','2016-12-22 08:50:59'),(33,'tag585b94529482b','text','产品','','','','text','2016-12-22 08:52:34'),(34,'tag585b95c5aa637','text','高定','','','','news','2016-12-22 08:58:45'),(35,'tag585b95c5aa637','text','高级定制','','','','news','2016-12-22 08:58:45'),(36,'tag585b95c5aa637','text','定制','','','','news','2016-12-22 08:58:45'),(37,'tag585b95c5aa637','text','Valentino2016高级','','','','news','2016-12-22 08:58:45'),(38,'tag585b95c5aa637','text','16HC','','','','news','2016-12-22 08:58:45'),(39,'tag585b95c5aa637','text','16高定','','','','news','2016-12-22 08:58:45'),(40,'tag585b95ef753c3','text','秀','','','','text','2016-12-22 08:59:27'),(41,'tag585b95ef753c3','text','直播','','','','text','2016-12-22 08:59:27'),(42,'tag585b9754a6be6','text','yang','','','','news','2016-12-22 09:05:24'),(43,'tag585b9754a6be6','text','YANG','','','','news','2016-12-22 09:05:24'),(44,'tag585b9754a6be6','text','巴黎','','','','news','2016-12-22 09:05:24'),(45,'tag585b9754a6be6','text','男装秀','','','','news','2016-12-22 09:05:24'),(46,'tag585b9754a6be6','text','YY','','','','news','2016-12-22 09:05:24'),(47,'tag585b9754a6be6','text','yy','','','','news','2016-12-22 09:05:24'),(48,'tag585b97f95cdb8','text','SPIKE','','','','news','2016-12-22 09:08:09'),(49,'tag585b97f95cdb8','text','spike','','','','news','2016-12-22 09:08:09'),(50,'tag585b97f95cdb8','text','铆钉包','','','','news','2016-12-22 09:08:09'),(51,'tag585b97f95cdb8','text','Spike','','','','news','2016-12-22 09:08:09'),(52,'tag585b991c63494','text','zharan','','','','news','2016-12-22 09:13:00'),(53,'tag585b991c63494','text','扎染','','','','news','2016-12-22 09:13:00'),(54,'tag585b991c63494','text','zaran','','','','news','2016-12-22 09:13:00'),(55,'tag585b991c63494','text','jamaica','','','','news','2016-12-22 09:13:00'),(56,'tag585b99ca43f52','text','丹宁','','','','news','2016-12-22 09:15:54'),(57,'tag585b99ca43f52','text','单宁','','','','news','2016-12-22 09:15:54'),(58,'tag585b99ca43f52','text','牛仔','','','','news','2016-12-22 09:15:54'),(59,'tag585b9b4eb87d3','text','迷彩','','','','news','2016-12-22 09:22:22'),(60,'tag585b9d25909e4','text','手袋','','','','news','2016-12-22 09:30:13'),(61,'tag585b9d25909e4','text','男鞋','','','','news','2016-12-22 09:30:13'),(62,'tag585b9d25909e4','text','钱包','','','','news','2016-12-22 09:30:13'),(63,'tag585b9d25909e4','text','女鞋','','','','news','2016-12-22 09:30:13'),(64,'tag585b9d25909e4','text','单肩包','','','','news','2016-12-22 09:30:13'),(65,'tag585b9d25909e4','text','球鞋','','','','news','2016-12-22 09:30:13'),(66,'tag585b9d25909e4','text','高跟鞋','','','','news','2016-12-22 09:30:13'),(67,'tag585b9d25909e4','text','水粉色','','','','news','2016-12-22 09:30:13'),(68,'tag585b9d25909e4','text','包包','','','','news','2016-12-22 09:30:13'),(69,'tag585b9d25909e4','text','女包','','','','news','2016-12-22 09:30:13'),(70,'tag585b9d25909e4','text','彩虹','','','','news','2016-12-22 09:30:13'),(71,'tag585b9d25909e4','text','背包','','','','news','2016-12-22 09:30:13'),(72,'tag585b9d25909e4','text','单鞋','','','','news','2016-12-22 09:30:13'),(73,'tag585b9d25909e4','text','鞋子','','','','news','2016-12-22 09:30:13'),(74,'tag585b9d25909e4','text','铆钉','','','','news','2016-12-22 09:30:13'),(75,'tag585b9d25909e4','text','双肩包','','','','news','2016-12-22 09:30:13'),(76,'tag585b9d25909e4','text','凉鞋','','','','news','2016-12-22 09:30:13'),(77,'tag585b9d25909e4','text','包','','','','news','2016-12-22 09:30:13'),(78,'tag585b9d25909e4','text','广告大片','','','','news','2016-12-22 09:30:13'),(79,'tag585b9d25909e4','text','男包','','','','news','2016-12-22 09:30:13'),(80,'tag585b9d25909e4','text','早秋配饰','','','','news','2016-12-22 09:30:13'),(81,'tag585b9d25909e4','text','配饰','','','','news','2016-12-22 09:30:13'),(82,'tag585b9eaf03d9b','text','服装','','','','news','2016-12-22 09:36:47'),(83,'tag585b9eaf03d9b','text','衣服','','','','news','2016-12-22 09:36:47'),(84,'tag585b9eaf03d9b','text','成衣','','','','news','2016-12-22 09:36:47'),(85,'tag585ba12535245','text','nanzhuang','','','','news','2016-12-22 09:47:17'),(86,'tag585ba12535245','text','男装','','','','news','2016-12-22 09:47:17'),(87,'tag585ba12535245','text','男','','','','news','2016-12-22 09:47:17'),(88,'tag585ba12535245','text','男士','','','','news','2016-12-22 09:47:17'),(89,'tag5864bfa7402ae','text','上海','','','','news','2016-12-29 07:47:51'),(90,'tag5864c260e5f7c','text','成都','','','','news','2016-12-29 07:59:28'),(91,'tag5864c2f726afc','text','无锡','','','','news','2016-12-29 08:01:59'),(92,'tag5864c35db45e5','text','沈阳','','','','news','2016-12-29 08:03:41'),(93,'tag5864c3b70aa07','text','西安','','','','news','2016-12-29 08:05:11'),(94,'tag5864c4150988a','text','青岛','','','','news','2016-12-29 08:06:45'),(95,'tag5864c45b5b01f','text','厦门','','','','news','2016-12-29 08:07:55'),(96,'tag5864c5350800d','text','香港','','','','news','2016-12-29 08:11:33'),(97,'tag5864c70172e1f','text','北京','','','','news','2016-12-29 08:19:13');
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
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wechat_feedbacks`
--

LOCK TABLES `wechat_feedbacks` WRITE;
/*!40000 ALTER TABLE `wechat_feedbacks` DISABLE KEYS */;
INSERT INTO `wechat_feedbacks` VALUES (1,'20','news','{\"Articles\":[{\"Title\":\"品牌历史\",\"Description\":\"品牌历史\",\"Url\":\"http:\\/\\/wechat.valentinoworld.com\\/maison-history.html\",\"PicUrl\":\"http:\\/\\/valentinowechat.samesamechina.com\\/upload\\/image\\/201612\\/585a4f2a864ee.jpg\"},{\"Title\":\"品牌系列\",\"Description\":\"品牌系列\",\"Url\":\"http:\\/\\/wechat.valentinoworld.com\\/brand.html\",\"PicUrl\":\"http:\\/\\/valentinowechat.samesamechina.com\\/upload\\/image\\/201612\\/585a4f7ad5d08.jpg\"}]}','2016-12-21 09:46:40'),(2,'22','news','{\"Articles\":[{\"Title\":\"高定精神\",\"Description\":\"高定精神\",\"Url\":\"http:\\/\\/wechat.valentinoworld.com\\/culture-of-couture.html\",\"PicUrl\":\"http:\\/\\/valentinowechat.samesamechina.com\\/upload\\/image\\/201612\\/585a50162c314.jpg\"},{\"Title\":\"手工艺传承\",\"Description\":\"手工艺传承\",\"Url\":\"http:\\/\\/wechat.valentinoworld.com\\/craftmanship.html\",\"PicUrl\":\"http:\\/\\/valentinowechat.samesamechina.com\\/upload\\/image\\/201612\\/585a504586311.png\"}]}','2016-12-21 09:50:12'),(3,'25','news','{\"Articles\":[{\"Title\":\"华丽浪漫，朋克摇滚\",\"Description\":\"华丽浪漫，朋克摇滚\",\"Url\":\"http:\\/\\/mp.weixin.qq.com\\/s?__biz=MzA5OTcwNDUwNQ==&mid=2652954323&idx=1&sn=b61bd8cc9283de0df2e9cbe19f57ab34&chksm=8b2a3505bc5dbc131041ab971f4031934d62bbcc313601167b7219f45deaeb55ed1357b1195f&scene=4#wechat_redirect\",\"PicUrl\":\"http:\\/\\/valentinowechat.samesamechina.com\\/upload\\/image\\/201612\\/585a50c8a7daf.jpg\"},{\"Title\":\"刚柔并济，翩翩芭蕾\",\"Description\":\"刚柔并济，翩翩芭蕾\",\"Url\":\"http:\\/\\/mp.weixin.qq.com\\/s?__biz=MzA5OTcwNDUwNQ==&mid=2652954290&idx=1&sn=e73889498341a20580f2816a813bb4f9&chksm=8b2a3564bc5dbc727d8c84e06c3ea09ba64e85e8aa8f06bdc5ba7c4e858b6542a94dfcc77277&scene=4#wechat_redirect\",\"PicUrl\":\"http:\\/\\/valentinowechat.samesamechina.com\\/upload\\/image\\/201612\\/585a518711def.png\"},{\"Title\":\"无与伦比的个性风潮——Rockstud Spike手袋\",\"Description\":\"无与伦比的个性风潮——Rockstud Spike手袋\",\"Url\":\"http:\\/\\/wechat.valentinoworld.com\\/rockstudspike-.html\",\"PicUrl\":\"http:\\/\\/valentinowechat.samesamechina.com\\/upload\\/image\\/201612\\/585a526d9c94d.png\"}]}','2016-12-21 09:59:29'),(4,'26','news','{\"Articles\":[{\"Title\":\"与杨洋一同探索Valentino浪漫之秋\",\"Description\":\"与杨洋一同探索Valentino浪漫之秋\",\"Url\":\"http:\\/\\/mp.weixin.qq.com\\/s?__biz=MzA5OTcwNDUwNQ==&mid=2652954147&idx=1&sn=872c40eba5bdf7df003092fd19eaf639&scene=4#wechat_redirect\",\"PicUrl\":\"http:\\/\\/valentinowechat.samesamechina.com\\/upload\\/image\\/201612\\/585b69dee40a3.jpg\"},{\"Title\":\"秋日密码\",\"Description\":\"秋日密码\",\"Url\":\"http:\\/\\/mp.weixin.qq.com\\/s?__biz=MzA5OTcwNDUwNQ==&mid=2652954147&idx=2&sn=5dc11c128b9f9ee66bb4641982c3af35&scene=0#wechat_redirect\",\"PicUrl\":\"http:\\/\\/valentinowechat.samesamechina.com\\/upload\\/image\\/201612\\/585b6a1215c63.jpg\"}]}','2016-12-22 05:52:45'),(5,'27','news','{\"Articles\":[{\"Title\":\"全黑经典 升华精粹\",\"Description\":\"全黑经典 升华精粹\",\"Url\":\"http:\\/\\/wechat.valentinoworld.com\\/rockstud-untitled_noir.html\",\"PicUrl\":\"http:\\/\\/valentinowechat.samesamechina.com\\/upload\\/image\\/201612\\/585b6a7367e95.jpg\"},{\"Title\":\"日式美学  风格典范\",\"Description\":\"日式美学  风格典范\",\"Url\":\"http:\\/\\/wechat.valentinoworld.com\\/rockstud-untitled.html\",\"PicUrl\":\"http:\\/\\/valentinowechat.samesamechina.com\\/upload\\/image\\/201612\\/585b6b513d17b.jpeg\"}]}','2016-12-22 05:57:41'),(7,'30','news','{\"Articles\":[{\"Title\":\"星光熠熠\",\"Description\":\"星光熠熠\",\"Url\":\"http:\\/\\/wechat.valentinoworld.com\\/local-celebrities.html\",\"PicUrl\":\"http:\\/\\/valentinowechat.samesamechina.com\\/upload\\/image\\/201612\\/585b6ca2a9bfd.jpg\"},{\"Title\":\"戛纳电影节 | Valentino星光\",\"Description\":\"戛纳电影节 | Valentino星光\",\"Url\":\"http:\\/\\/mp.weixin.qq.com\\/s?__biz=MzA5OTcwNDUwNQ==&mid=505469982&idx=1&sn=25c57c324cfa5aa6702a92ceb7fc84ac#rd\",\"PicUrl\":\"http:\\/\\/valentinowechat.samesamechina.com\\/upload\\/image\\/201612\\/585b6cd3d9e87.jpg\"},{\"Title\":\"Met Gala丨Valentino星光\",\"Description\":\"Met Gala丨Valentino星光\",\"Url\":\"http:\\/\\/mp.weixin.qq.com\\/s?__biz=MzA5OTcwNDUwNQ==&mid=505469962&idx=1&sn=5c4ee19b22087534f2e7452d2725a46e#rd\",\"PicUrl\":\"http:\\/\\/valentinowechat.samesamechina.com\\/upload\\/image\\/201612\\/585b6d15877ec.jpg\"}]}','2016-12-22 06:05:18'),(8,'31','news','{\"Articles\":[{\"Title\":\"和范冰冰、宋佳一起探秘Rockstud Spike手袋限定展览\",\"Description\":\"和范冰冰、宋佳一起探秘Rockstud Spike手袋限定展览\",\"Url\":\"http:\\/\\/mp.weixin.qq.com\\/s?__biz=MzA5OTcwNDUwNQ==&mid=2652954187&idx=1&sn=b011c0e7afce31ef5baa4c3dd3438b8e&scene=0#wechat_redirect\",\"PicUrl\":\"http:\\/\\/valentinowechat.samesamechina.com\\/upload\\/image\\/201612\\/585b6d6e61dcf.jpg\"},{\"Title\":\"与杨洋一同探索Valentino浪漫之秋\",\"Description\":\"与杨洋一同探索Valentino浪漫之秋\",\"Url\":\"http:\\/\\/mp.weixin.qq.com\\/s?__biz=MzA5OTcwNDUwNQ==&mid=2652954147&idx=1&sn=872c40eba5bdf7df003092fd19eaf639&scene=4#wechat_redirect\",\"PicUrl\":\"http:\\/\\/valentinowechat.samesamechina.com\\/upload\\/image\\/201612\\/585b6daf636bc.png\"},{\"Title\":\"聆听杨洋心动之选 探索扎染限定作品展\",\"Description\":\"聆听杨洋心动之选 探索扎染限定作品展\",\"Url\":\"http:\\/\\/mp.weixin.qq.com\\/s?__biz=MzA5OTcwNDUwNQ==&mid=2652953928&idx=1&sn=3c6cd9bc11fee84ac687dd68c5e07253#rd\",\"PicUrl\":\"http:\\/\\/valentinowechat.samesamechina.com\\/upload\\/image\\/201612\\/585b6efed76f8.jpg\"},{\"Title\":\"绝美吟唱，《茶花女》优雅再颂\",\"Description\":\"绝美吟唱，《茶花女》优雅再颂\",\"Url\":\"http:\\/\\/mp.weixin.qq.com\\/s?__biz=MzA5OTcwNDUwNQ==&mid=505470020&idx=1&sn=8964350cb1e6ed77faee1b88593a5cd4#rd\",\"PicUrl\":\"http:\\/\\/valentinowechat.samesamechina.com\\/upload\\/image\\/201612\\/585b6f33d14a3.jpg\"}]}','2016-12-22 06:14:19'),(9,'32','news','{\"Articles\":[{\"Title\":\"Valentino2017春夏女装系列\",\"Description\":\"Valentino2017春夏女装系列\",\"Url\":\"http:\\/\\/app.socialvalue.cn\\/i\\/valentino\\/h5_201606\\/\",\"PicUrl\":\"http:\\/\\/valentinowechat.samesamechina.com\\/upload\\/image\\/201612\\/585b6f793080b.jpg\"},{\"Title\":\"Valentino2017春夏男装系列\",\"Description\":\"Valentino2017春夏男装系列\",\"Url\":\"http:\\/\\/app.socialvalue.cn\\/i\\/valentino\\/h5_201604\\/\",\"PicUrl\":\"http:\\/\\/valentinowechat.samesamechina.com\\/upload\\/image\\/201612\\/585b6faa872c9.jpg\"},{\"Title\":\"Valentino2016秋冬女装系列\",\"Description\":\"Valentino2016秋冬女装系列\",\"Url\":\"http:\\/\\/app.socialvalue.cn\\/i\\/valentino\\/h5_201603\\/index#rd?\",\"PicUrl\":\"http:\\/\\/valentinowechat.samesamechina.com\\/upload\\/image\\/201612\\/585b6fe1da1d7.jpg\"},{\"Title\":\"Valentino2016秋冬男装系列\",\"Description\":\"Valentino2016秋冬男装系列\",\"Url\":\"http:\\/\\/app.socialvalue.cn\\/valentino\\/h5_201601#rd?\",\"PicUrl\":\"http:\\/\\/valentinowechat.samesamechina.com\\/upload\\/image\\/201612\\/585b7011b2644.jpg\"}]}','2016-12-22 06:18:01'),(10,'33','news','{\"Articles\":[{\"Title\":\"Valentino2016秋冬女士系列广告特辑\",\"Description\":\"Valentino2016秋冬女士系列广告特辑\",\"Url\":\"http:\\/\\/wechat.valentinoworld.com\\/ad-fw-woman-2016-17.html\",\"PicUrl\":\"http:\\/\\/valentinowechat.samesamechina.com\\/upload\\/image\\/201612\\/585b7055b64a6.jpg\"},{\"Title\":\"Valentino2016秋冬男士系列广告特辑\",\"Description\":\"Valentino2016秋冬男士系列广告特辑\",\"Url\":\"http:\\/\\/wechat.valentinoworld.com\\/ad-fw-man-2016-17.html\",\"PicUrl\":\"http:\\/\\/valentinowechat.samesamechina.com\\/upload\\/image\\/201612\\/585b708614c62.jpg\"},{\"Title\":\"Valentino2016秋冬男士配饰系列广告特辑\",\"Description\":\"Valentino2016秋冬男士配饰系列广告特辑\",\"Url\":\"http:\\/\\/mp.weixin.qq.com\\/s?__biz=MzA5OTcwNDUwNQ==&mid=2652953908&idx=2&sn=20455349b488e9ef47cf2f7c14996cb9&scene=0#wechat_redirect\",\"PicUrl\":\"http:\\/\\/valentinowechat.samesamechina.com\\/upload\\/image\\/201612\\/585b70ef361d5.jpg\"}]}','2016-12-22 06:21:39'),(11,'34','news','{\"Articles\":[{\"Title\":\"Valentino2016秋冬高级定制系列\",\"Description\":\"进入Valentino诗意画卷，点击欣赏完整秀场盛景\",\"Url\":\"http:\\/\\/app.socialvalue.cn\\/i\\/valentino\\/h5_201605\\/\",\"PicUrl\":\"http:\\/\\/valentinowechat.samesamechina.com\\/upload\\/image\\/201612\\/585b71d54e632.jpg\"}]}','2016-12-22 06:25:27'),(12,'auto585b731a3cefe','text','{\"Content\":\"感谢您关注 Valentino官方微信平台，我们将定时为您提供最新产品以及品牌资讯。\\n点击“<a href=\\\"http:\\/\\/www.valentino.cn\\\">范冰冰<\\/a>”，与范冰冰一同回顾Valentino2017巴黎春夏女装秀\\n点击“<a href=\\\"http:\\/\\/we.valentino.chat\\/maison-history.html\\\">品牌<\\/a>”，走进Valentino优雅世界\\n输入“成衣”，发现Valentino极致魅力\\n输入“配饰”，发现Valentino挚爱单品\\n输入城市名(如：上海)或点击\\\"<a href=\\\"http:\\/\\/app.socialvalue.cn\\/i\\/valentino\\/h5_201512\\/\\\">店铺搜索<\\/a>”，获取Valentino精品店信息\"}','2016-12-22 06:30:50'),(13,'auto585b733085c8e','text','{\"Content\":\"您好，我们会尽快处理您的需求。\\n点击“<a href=\\\"http:\\/\\/mp.weixin.qq.com\\/s?__biz=MzA5OTcwNDUwNQ==&mid=2652954271&idx=2&sn=1dbfaeb33365411d4aee67f20b5a2da9&chksm=8b2a3549bc5dbc5fc976b640c380f821ccecb1b503d3b824f8b06fea120f92f69d0d210b1fa7&scene=4#wechat_redirect\\\">范冰冰<\\/a>”，一同探索Valentino浪漫春夏\\n点击“<a href=\\\"http:\\/\\/we.valentino.chat\\/maison-history.html\\\">品牌<\\/a>”，走进Valentino优雅世界\\n输入“成衣”，发现Valentino极致魅力\\n输入“配饰”，发现Valentino挚爱单品\\n输入城市名(如：上海)或点击\\\"<a href=\\\"http:\\/\\/app.socialvalue.cn\\/i\\/valentino\\/h5_201512\\/\\\">店铺搜索<\\/a>”，获取Valentino精品店信息\"}','2016-12-22 06:31:12'),(14,'tag585b92f240b91','text','{\"Content\":\"\\\"您好，感谢您对VALENTINO品牌的关注。\\n请告知您的联系方式,方便我们相关部门负责人与您取得联系。\\n感谢！\\\"\"}','2016-12-22 08:46:42'),(15,'tag585b931e72d87','text','{\"Content\":\"\\\"\\\"\\\"VALENTINO产品都是由意大利工匠精心设计制作的高品质作品，因此，我们衷心建议您通过VALENTINO直营店购买我们的产品。\\n对于一切由其他非正规渠道获得的VALENTINO产品，我们无法保证其品质。\\n您可关注VALENTINO官方微信账号\\\"\\\"valentinowechat\\\"\\\",在菜单栏“探索更多”中点击“精品店”按钮，获取临近直营店店铺信息。\\n亦可登录http:\\/\\/www.valentino.cn\\/cn 探索更多。\\n感谢！\\\"\"}','2016-12-22 08:47:26'),(16,'tag585b9331ee59b','text','{\"Content\":\"\\\"您好，感谢您的分享，我们将竭诚为您提供最周到贴心的售后服务。\\n请发送私信告知您的姓名、电话号码及方便电话联系的时间段，我们将尽快安排客服与您沟通。\\n感谢！\\\"\"}','2016-12-22 08:47:45'),(17,'tag585b9370c5642','text','{\"Content\":\"\\\"您所拥有的VALENTINO产品都是由意大利工匠精心设计制作的高品质作品，因此，我们衷心建议您通过VALENTINO直营店购买我们的产品并保留交易凭证。\\n对于一切由其他非正规渠道获得的VALENTINO产品，我们无法保证其品质。\\n您可关注VALENTINO官方微信账号\\\"\\\"valentinowechat\\\"\\\",在菜单栏“探索更多”中点击“精品店”按钮，获取临近直营店店铺信息。\\n亦可登录http:\\/\\/www.valentino.cn\\/cn 探索更多。\\n感谢！\\\"\"}','2016-12-22 08:48:48'),(18,'tag585b93aaacf79','text','{\"Content\":\"\\\"您好，抱歉给您带来不便。\\n请发送私信告知您的姓名、电话号码及方便电话联系的时间段，我们将尽快安排客服与您沟通。\\n您可关注VALENTINO官方微信账号\\\"\\\"valentinowechat\\\"\\\",在菜单栏“探索更多”中点击“精品店”按钮，获取临近直营店店铺信息。\\n或登录http:\\/\\/www.valentino.cn\\/cn探索更多。\\n感谢！\\\"\"}','2016-12-22 08:49:46'),(19,'tag585b93f3b3b7f','text','{\"Content\":\"\\\"您好！感谢您关注 Valentino。\\n查找店铺，您可以直接输入城市名，如“上海”，获取该城市Valentino精品店信息；您还可以点击文字输入框右侧“+”，发送您的所在“位置”，获取附近Valentino精品店信息。\\\"\"}','2016-12-22 08:50:59'),(20,'tag585b94529482b','text','{\"Content\":\"\\\"您好，感谢您的分享，我们将竭诚为您提供最周到贴心的售后服务。\\n请发送私信告知您的姓名、电话号码及方便电话联系的时间段,我们将尽快安排客服与您沟通。\\n亦可关注VALENTINO官方微信账号\\\"\\\"valentinowechat\\\"\\\",回复\\\"\\\"服务\\\"\\\",获取相关售后资讯; 回复\\\"\\\"售后\\\"\\\",了解更多细则。\\n感谢！\\\"\"}','2016-12-22 08:52:34'),(21,'tag585b95c5aa637','news','{\"Articles\":[{\"Title\":\"Valentino2016秋冬高级定制系列\",\"Description\":\"Valentino2016秋冬高级定制系列\",\"Url\":\"http:\\/\\/app.socialvalue.cn\\/i\\/valentino\\/h5_201605\\/index\",\"PicUrl\":\"http:\\/\\/valentinowechat.samesamechina.com\\/upload\\/image\\/201612\\/585b94f35ced3.jpg\"},{\"Title\":\"盎然诗意 | Valentino2016春夏高级定制系列\",\"Description\":\"盎然诗意 | Valentino2016春夏高级定制系列\",\"Url\":\"http:\\/\\/app.socialvalue.cn\\/i\\/valentino\\/h5_2016001\\/\",\"PicUrl\":\"http:\\/\\/valentinowechat.samesamechina.com\\/upload\\/image\\/201612\\/585b95c19facf.jpg\"}]}','2016-12-22 08:58:45'),(22,'tag585b95ef753c3','text','{\"Content\":\"点击“<a href=\\\"http:\\/\\/www.valentino.cn\\/cn\\\">Valentino2016XXXXXXX时装秀<\\/a>”，零距离直击秀场盛况。\"}','2016-12-22 08:59:27'),(23,'tag585b9754a6be6','news','{\"Articles\":[{\"Title\":\"聆听杨洋心动之选 探索扎染限定作品展\",\"Description\":\"聆听杨洋心动之选 探索扎染限定作品展\",\"Url\":\"http:\\/\\/mp.weixin.qq.com\\/s?__biz=MzA5OTcwNDUwNQ==&mid=2652953928&idx=1&sn=3c6cd9bc11fee84ac687dd68c5e07253&scene=4#wechat_redirect\",\"PicUrl\":\"http:\\/\\/valentinowechat.samesamechina.com\\/upload\\/image\\/201612\\/585b968f9fc13.png\"},{\"Title\":\"遇见巴黎 | 杨洋巴黎游记（一）\",\"Description\":\"遇见巴黎 | 杨洋巴黎游记（一）\",\"Url\":\"http:\\/\\/mp.weixin.qq.com\\/s?__biz=MzA5OTcwNDUwNQ==&mid=505470201&idx=1&sn=53ba45242359e697c1906d9e808ea2db#rd\",\"PicUrl\":\"http:\\/\\/valentinowechat.samesamechina.com\\/upload\\/image\\/201612\\/585b96ccda36c.png\"},{\"Title\":\"遇见巴黎 | 杨洋巴黎游记（二）\",\"Description\":\"遇见巴黎 | 杨洋巴黎游记（二）\",\"Url\":\"http:\\/\\/mp.weixin.qq.com\\/s?__biz=MzA5OTcwNDUwNQ==&mid=505470203&idx=2&sn=77e0f562e61862ac7c61a6847cdd742b#rd\",\"PicUrl\":\"http:\\/\\/valentinowechat.samesamechina.com\\/upload\\/image\\/201612\\/585b970549626.jpg\"}]}','2016-12-22 09:05:24'),(24,'tag585b97f95cdb8','news','{\"Articles\":[{\"Title\":\"无与伦比的个性风潮——Rockstud Spike手袋\",\"Description\":\"朋克风格糅合精湛工艺， 尽显独特气质。\",\"Url\":\"http:\\/\\/we.valentino.chat\\/rockstudspike-.html\",\"PicUrl\":\"http:\\/\\/valentinowechat.samesamechina.com\\/upload\\/image\\/201612\\/585b97f60d0da.jpg\"}]}','2016-12-22 09:08:09'),(25,'tag585b991c63494','news','{\"Articles\":[{\"Title\":\"奇幻扎染 色彩绮梦\",\"Description\":\"奇幻扎染 色彩绮梦\",\"Url\":\"http:\\/\\/mp.weixin.qq.com\\/s?__biz=MzA5OTcwNDUwNQ==&mid=2652954042&idx=1&sn=ee43783e960c389c0f391fed819b16de&scene=0#wechat_redirect\",\"PicUrl\":\"http:\\/\\/valentinowechat.samesamechina.com\\/upload\\/image\\/201612\\/585b986a7b1c6.jpg\"},{\"Title\":\"聆听杨洋心动之选 探索扎染限定作品展\",\"Description\":\"聆听杨洋心动之选 探索扎染限定作品展\",\"Url\":\"http:\\/\\/mp.weixin.qq.com\\/s?__biz=MzA5OTcwNDUwNQ==&mid=2652953928&idx=1&sn=3c6cd9bc11fee84ac687dd68c5e07253&scene=4#wechat_redirect\",\"PicUrl\":\"http:\\/\\/valentinowechat.samesamechina.com\\/upload\\/image\\/201612\\/585b98ed60101.jpg\"},{\"Title\":\"与杨洋一同走进Valentino男装扎染系列限定作品展\",\"Description\":\"与杨洋一同走进Valentino男装扎染系列限定作品展\",\"Url\":\"http:\\/\\/mp.weixin.qq.com\\/s?__biz=MzA5OTcwNDUwNQ==&mid=2652953908&idx=1&sn=df2e0ef6c9bd49eef6723e140128c5ca&scene=4#wechat_redirect\",\"PicUrl\":\"http:\\/\\/valentinowechat.samesamechina.com\\/upload\\/image\\/201612\\/585b9915a7fdc.jpg\"}]}','2016-12-22 09:13:00'),(26,'tag585b99ca43f52','news','{\"Articles\":[{\"Title\":\"蝶舞丹宁\",\"Description\":\"蝶舞丹宁\",\"Url\":\"http:\\/\\/mp.weixin.qq.com\\/s?__biz=MzA5OTcwNDUwNQ==&mid=401581704&idx=2&sn=e273c2f4969792d2562c70dcd32944e2#rd\",\"PicUrl\":\"http:\\/\\/valentinowechat.samesamechina.com\\/upload\\/image\\/201612\\/585b999975200.png\"},{\"Title\":\"丹宁精神\",\"Description\":\"丹宁精神\",\"Url\":\"http:\\/\\/mp.weixin.qq.com\\/s?__biz=MzA5OTcwNDUwNQ==&mid=401142427&idx=2&sn=35a9d8c15321e21ce7a7f2eb1443481b#rd\",\"PicUrl\":\"http:\\/\\/valentinowechat.samesamechina.com\\/upload\\/image\\/201612\\/585b99c72b0a2.png\"}]}','2016-12-22 09:15:54'),(27,'tag585b9b4eb87d3','news','{\"Articles\":[{\"Title\":\"迷彩型格 百变绅士\",\"Description\":\"迷彩型格 百变绅士\",\"Url\":\"http:\\/\\/app.socialvalue.cn\\/i\\/valentino\\/h5_201602\\/\",\"PicUrl\":\"http:\\/\\/valentinowechat.samesamechina.com\\/upload\\/image\\/201612\\/585b9a5eaeba4.jpg\"},{\"Title\":\"狂野“迷”样魅力\",\"Description\":\"狂野“迷”样魅力\",\"Url\":\"http:\\/\\/mp.weixin.qq.com\\/s?__biz=MzA5OTcwNDUwNQ==&mid=206974280&idx=2&sn=98fe282967f3868cb265f26a1a68b46c#rd\",\"PicUrl\":\"http:\\/\\/valentinowechat.samesamechina.com\\/upload\\/image\\/201612\\/585b9a8dc7c38.png\"},{\"Title\":\"迷彩，更迷人 | 2015春夏男士配饰系列\",\"Description\":\"迷彩，更迷人 | 2015春夏男士配饰系列\",\"Url\":\"http:\\/\\/mp.weixin.qq.com\\/s?__biz=MzA5OTcwNDUwNQ==&mid=204796542&idx=2&sn=f0c12be89e2f826a5057ffef9c420604#rd\",\"PicUrl\":\"http:\\/\\/valentinowechat.samesamechina.com\\/upload\\/image\\/201612\\/585b9abd16f5f.png\"},{\"Title\":\"Valentino 2015春夏男士配饰\",\"Description\":\"Valentino 2015春夏男士配饰\",\"Url\":\"http:\\/\\/mp.weixin.qq.com\\/s?__biz=MzA5OTcwNDUwNQ==&mid=202116688&idx=3&sn=2cde586f1a8c3970b7fe8795e847382f#rd\",\"PicUrl\":\"http:\\/\\/valentinowechat.samesamechina.com\\/upload\\/image\\/201612\\/585b9af718690.png\"},{\"Title\":\"似梦似幻 迷彩迷情\",\"Description\":\"似梦似幻 迷彩迷情\",\"Url\":\"http:\\/\\/mp.weixin.qq.com\\/s?__biz=MzA5OTcwNDUwNQ==&mid=201692625&idx=1&sn=7850328979761d7c2fa5336981cb5edc#rd\",\"PicUrl\":\"http:\\/\\/valentinowechat.samesamechina.com\\/upload\\/image\\/201612\\/585b9b20122cd.png\"}]}','2016-12-22 09:22:22'),(28,'tag585b9d25909e4','news','{\"Articles\":[{\"Title\":\"酷黑摇滚 型格态度\",\"Description\":\"酷黑摇滚 型格态度\",\"Url\":\"http:\\/\\/mp.weixin.qq.com\\/s?__biz=MzA5OTcwNDUwNQ==&mid=2652954053&idx=1&sn=d6cd2c0a8dd6261ba49543793b59a12c&scene=0#wechat_redirect  \",\"PicUrl\":\"http:\\/\\/valentinowechat.samesamechina.com\\/upload\\/image\\/201612\\/585b9c49b9b11.jpg\"},{\"Title\":\"奇幻扎染 色彩绮梦\",\"Description\":\"奇幻扎染 色彩绮梦\",\"Url\":\"http:\\/\\/mp.weixin.qq.com\\/s?__biz=MzA5OTcwNDUwNQ==&mid=2652954042&idx=1&sn=ee43783e960c389c0f391fed819b16de&scene=4#wechat_redirect\",\"PicUrl\":\"http:\\/\\/valentinowechat.samesamechina.com\\/upload\\/image\\/201612\\/585b9c813a29b.jpg\"},{\"Title\":\"百变优雅，My Rockstud\",\"Description\":\"百变优雅，My Rockstud\",\"Url\":\"http:\\/\\/mp.weixin.qq.com\\/s?__biz=MzA5OTcwNDUwNQ==&mid=2652954030&idx=2&sn=c642a85962474f294b91d601cdacd853&scene=4#wechat_redirect\",\"PicUrl\":\"http:\\/\\/valentinowechat.samesamechina.com\\/upload\\/image\\/201612\\/585b9ca90a29b.jpg\"},{\"Title\":\"生命中的小物件\",\"Description\":\"生命中的小物件\",\"Url\":\"http:\\/\\/mp.weixin.qq.com\\/s?__biz=MzA5OTcwNDUwNQ==&mid=2652954010&idx=1&sn=20a4ce671ac7230dd4bf8cb4c0d7b402&scene=4#wechat_redirect\",\"PicUrl\":\"http:\\/\\/valentinowechat.samesamechina.com\\/upload\\/image\\/201612\\/585b9cd0d5dbf.jpg\"},{\"Title\":\"型格风尚 | Valentino2016秋冬男士配饰系列广告特辑\",\"Description\":\"型格风尚 | Valentino2016秋冬男士配饰系列广告特辑\",\"Url\":\"http:\\/\\/mp.weixin.qq.com\\/s?__biz=MzA5OTcwNDUwNQ==&mid=2652953908&idx=2&sn=20455349b488e9ef47cf2f7c14996cb9&scene=4#wechat_redirect\",\"PicUrl\":\"http:\\/\\/valentinowechat.samesamechina.com\\/upload\\/image\\/201612\\/585b9cfc03f55.jpg\"},{\"Title\":\"择星之旅\",\"Description\":\"择星之旅\",\"Url\":\"http:\\/\\/mp.weixin.qq.com\\/s?__biz=MzA5OTcwNDUwNQ==&mid=2652953622&idx=2&sn=25e6868cf36133d7859b6f9929287b9d&scene=4#wechat_redirect\",\"PicUrl\":\"http:\\/\\/valentinowechat.samesamechina.com\\/upload\\/image\\/201612\\/585b9d1ca8a89.jpg\"}]}','2016-12-22 09:30:13'),(29,'tag585b9eaf03d9b','news','{\"Articles\":[{\"Title\":\"灵动舞者，情迷芭蕾 | Valentino2016秋冬女士系列广告特辑\",\"Description\":\"灵动舞者，情迷芭蕾 | Valentino2016秋冬女士系列广告特辑\",\"Url\":\"http:\\/\\/mp.weixin.qq.com\\/s?__biz=MzA5OTcwNDUwNQ==&mid=2652954030&idx=1&sn=e252b9fd2b076fb797ab3ac9ed669918&scene=4#wechat_redirect\",\"PicUrl\":\"http:\\/\\/valentinowechat.samesamechina.com\\/upload\\/image\\/201612\\/585b9db622e23.jpg\"},{\"Title\":\"非凡绅士 | Valentino2016秋冬男士系列广告特辑\",\"Description\":\"非凡绅士 | Valentino2016秋冬男士系列广告特辑\",\"Url\":\"http:\\/\\/mp.weixin.qq.com\\/s?__biz=MzA5OTcwNDUwNQ==&mid=2652954010&idx=2&sn=f76e6db663ea1ed46f605e3366d80245&scene=4#wechat_redirect\",\"PicUrl\":\"http:\\/\\/valentinowechat.samesamechina.com\\/upload\\/image\\/201612\\/585b9ddbb7506.jpg\"},{\"Title\":\"「莎翁美梦」，Valentino2016秋冬高级定制时装秀\",\"Description\":\"「莎翁美梦」，Valentino2016秋冬高级定制时装秀\",\"Url\":\"http:\\/\\/mp.weixin.qq.com\\/s?__biz=MzA5OTcwNDUwNQ==&mid=2652953961&idx=1&sn=4ffc5d74e3aa7d0f7ac9dd54543a8b62&scene=4#wechat_redirect\",\"PicUrl\":\"http:\\/\\/valentinowechat.samesamechina.com\\/upload\\/image\\/201612\\/585b9e048cf65.jpg\"},{\"Title\":\"烂漫春花 缤纷绽放\",\"Description\":\"烂漫春花 缤纷绽放\",\"Url\":\"http:\\/\\/mp.weixin.qq.com\\/s?__biz=MzA5OTcwNDUwNQ==&mid=2652953784&idx=1&sn=a004c0fb8a03dc6eb8deb4975534217c&scene=4#wechat_redirect\",\"PicUrl\":\"http:\\/\\/valentinowechat.samesamechina.com\\/upload\\/image\\/201612\\/585b9e308c545.jpg\"},{\"Title\":\"Rockstud Untitled日式侘寂美学\",\"Description\":\"Rockstud Untitled日式侘寂美学\",\"Url\":\"http:\\/\\/mp.weixin.qq.com\\/s?__biz=MzA5OTcwNDUwNQ==&mid=2652953753&idx=1&sn=9a7760e638e0db468d8ffaa0d329aef7&scene=4#wechat_redirect\",\"PicUrl\":\"http:\\/\\/valentinowechat.samesamechina.com\\/upload\\/image\\/201612\\/585b9e576e771.jpg\"},{\"Title\":\"探索「未完成」美学，Valentino2017春夏男装系列\",\"Description\":\"探索「未完成」美学，Valentino2017春夏男装系列\",\"Url\":\"http:\\/\\/mp.weixin.qq.com\\/s?__biz=MzA5OTcwNDUwNQ==&mid=2652953888&idx=1&sn=1c4c8c14f00408646d2aae88a153e22a&scene=4#wechat_redirect\",\"PicUrl\":\"http:\\/\\/valentinowechat.samesamechina.com\\/upload\\/image\\/201612\\/585b9ea3393ef.jpg\"}]}','2016-12-22 09:36:47'),(30,'tag585ba12535245','news','{\"Articles\":[{\"Title\":\"非凡绅士 | Valentino2016秋冬男士系列广告特辑\",\"Description\":\"非凡绅士 | Valentino2016秋冬男士系列广告特辑\",\"Url\":\"http:\\/\\/mp.weixin.qq.com\\/s?__biz=MzA5OTcwNDUwNQ==&mid=2652954010&idx=2&sn=f76e6db663ea1ed46f605e3366d80245&scene=4#wechat_redirect\",\"PicUrl\":\"http:\\/\\/valentinowechat.samesamechina.com\\/upload\\/image\\/201612\\/585b9f0ad009b.jpg\"},{\"Title\":\"探索「未完成」美学，Valentino2017春夏男装系列\",\"Description\":\"探索「未完成」美学，Valentino2017春夏男装系列\",\"Url\":\"http:\\/\\/mp.weixin.qq.com\\/s?__biz=MzA5OTcwNDUwNQ==&mid=2652953888&idx=1&sn=1c4c8c14f00408646d2aae88a153e22a&scene=4#wechat_redirect\",\"PicUrl\":\"http:\\/\\/valentinowechat.samesamechina.com\\/upload\\/image\\/201612\\/585b9f370ee86.jpg\"},{\"Title\":\"刺绣夹克 街头风潮\",\"Description\":\"刺绣夹克 街头风潮\",\"Url\":\"http:\\/\\/mp.weixin.qq.com\\/s?__biz=MzA5OTcwNDUwNQ==&mid=405462661&idx=1&sn=f2bbb64838cba58708eac785edb4713d#rd\",\"PicUrl\":\"http:\\/\\/valentinowechat.samesamechina.com\\/upload\\/image\\/201612\\/585ba02867f1a.png\"},{\"Title\":\"奇幻动物王国\",\"Description\":\"奇幻动物王国\",\"Url\":\"http:\\/\\/mp.weixin.qq.com\\/s?__biz=MzA5OTcwNDUwNQ==&mid=404124137&idx=2&sn=363e53347ce26e75b072274921f7f5c0#rd\",\"PicUrl\":\"http:\\/\\/valentinowechat.samesamechina.com\\/upload\\/image\\/201612\\/585ba062a15e0.jpg\"}]}','2016-12-22 09:47:17'),(31,'qrcode58622666e6269','news','{\"Articles\":[{\"Title\":\"testesteetsttestesteetsttestesteetst\",\"Description\":\"DDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDD\",\"Url\":\"https:\\/\\/mp.weixin.qq.com\\/wiki?t=resource\\/res_main&id=mp1421141115&token=&lang=zh_CN\",\"PicUrl\":\"http:\\/\\/valentinowechat.samesamechina.com\\/upload\\/image\\/201612\\/58622662cc4aa.jpg\"}]}','2016-12-27 08:29:26'),(32,'tag5864bfa7402ae','news','{\"Articles\":[{\"Title\":\"Valentino上海益丰大厦精品店\",\"Description\":\"Valentino上海益丰大厦精品店\",\"Url\":\"http:\\/\\/valentinowechat.samesamechina.com\\/wechat\\/store\\/14\",\"PicUrl\":\"http:\\/\\/valentinowechat.samesamechina.com\\/source\\/change\\/store\\/14.jpg\"},{\"Title\":\"Valentino上海恒隆广场男装精品店\",\"Description\":\"Valentino上海恒隆广场男装精品店\",\"Url\":\"http:\\/\\/valentinowechat.samesamechina.com\\/wechat\\/store\\/15\",\"PicUrl\":\"http:\\/\\/valentinowechat.samesamechina.com\\/source\\/change\\/store\\/15.jpg\"},{\"Title\":\"Valentino上海恒隆广场女装精品店\",\"Description\":\"Valentino上海恒隆广场女装精品店\",\"Url\":\"http:\\/\\/valentinowechat.samesamechina.com\\/wechat\\/store\\/16\",\"PicUrl\":\"http:\\/\\/valentinowechat.samesamechina.com\\/source\\/change\\/store\\/16.jpg\"},{\"Title\":\"Valentino上海国金中心精品店\",\"Description\":\"Valentino上海国金中心精品店\",\"Url\":\"http:\\/\\/valentinowechat.samesamechina.com\\/wechat\\/store\\/17\",\"PicUrl\":\"http:\\/\\/valentinowechat.samesamechina.com\\/source\\/change\\/store\\/17.jpg\"},{\"Title\":\"Valentino上海环贸广场女装旗舰店\",\"Description\":\"Valentino上海环贸广场女装旗舰店\",\"Url\":\"http:\\/\\/valentinowechat.samesamechina.com\\/wechat\\/store\\/18\",\"PicUrl\":\"http:\\/\\/valentinowechat.samesamechina.com\\/source\\/change\\/store\\/18.jpg\"},{\"Title\":\"Valentino上海IFC国金中心精品店\",\"Description\":\"Valentino上海IFC国金中心精品店\",\"Url\":\"http:\\/\\/valentinowechat.samesamechina.com\\/wechat\\/store\\/26\",\"PicUrl\":\"http:\\/\\/valentinowechat.samesamechina.com\\/source\\/change\\/store\\/26.jpg\"}]}','2016-12-29 07:47:51'),(33,'tag5864c260e5f7c','news','{\"Articles\":[{\"Title\":\"Valentino成都仁恒置地广场女装精品店\",\"Description\":\"Valentino成都仁恒置地广场女装精品店\",\"Url\":\"http:\\/\\/valentinowechat.samesamechina.com\\/wechat\\/store\\/19\",\"PicUrl\":\"http:\\/\\/valentinowechat.samesamechina.com\\/source\\/change\\/store\\/19.jpg\"},{\"Title\":\"Valentino成都国际金融中心旗舰店\",\"Description\":\"Valentino成都国际金融中心旗舰店\",\"Url\":\"http:\\/\\/valentinowechat.samesamechina.com\\/wechat\\/store\\/20\",\"PicUrl\":\"http:\\/\\/valentinowechat.samesamechina.com\\/source\\/change\\/store\\/20.jpg\"}]}','2016-12-29 07:59:28'),(34,'tag5864c2f726afc','news','{\"Articles\":[{\"Title\":\"Valentino无锡恒隆广场女装精品店\",\"Description\":\"Valentino无锡恒隆广场女装精品店\",\"Url\":\"http:\\/\\/valentinowechat.samesamechina.com\\/wechat\\/store\\/21\",\"PicUrl\":\"http:\\/\\/valentinowechat.samesamechina.com\\/source\\/change\\/store\\/21.jpg\"}]}','2016-12-29 08:01:59'),(35,'tag5864c35db45e5','news','{\"Articles\":[{\"Title\":\"Valentino沈阳恒隆广场旗舰店\",\"Description\":\"Valentino沈阳恒隆广场旗舰店\",\"Url\":\"http:\\/\\/valentinowechat.samesamechina.com\\/wechat\\/store\\/22\",\"PicUrl\":\"http:\\/\\/valentinowechat.samesamechina.com\\/source\\/change\\/store\\/22.jpg\"}]}','2016-12-29 08:03:41'),(36,'tag5864c3b70aa07','news','{\"Articles\":[{\"Title\":\"Valentino西安时代广场旗舰店\",\"Description\":\"Valentino西安时代广场旗舰店\",\"Url\":\"http:\\/\\/valentinowechat.samesamechina.com\\/wechat\\/store\\/23\",\"PicUrl\":\"http:\\/\\/valentinowechat.samesamechina.com\\/source\\/change\\/store\\/23.jpg\"}]}','2016-12-29 08:05:11'),(37,'tag5864c4150988a','news','{\"Articles\":[{\"Title\":\"Valentino青岛海信广场精品店\",\"Description\":\"Valentino青岛海信广场精品店\",\"Url\":\"http:\\/\\/valentinowechat.samesamechina.com\\/wechat\\/store\\/24\",\"PicUrl\":\"http:\\/\\/valentinowechat.samesamechina.com\\/source\\/change\\/store\\/24.jpg\"}]}','2016-12-29 08:06:45'),(38,'tag5864c45b5b01f','news','{\"Articles\":[{\"Title\":\"Valentino厦门磐基中心女装精品店\",\"Description\":\"Valentino厦门磐基中心女装精品店\",\"Url\":\"http:\\/\\/valentinowechat.samesamechina.com\\/wechat\\/store\\/25\",\"PicUrl\":\"http:\\/\\/valentinowechat.samesamechina.com\\/source\\/change\\/store\\/25.jpg\"}]}','2016-12-29 08:07:55'),(39,'tag5864c5350800d','news','{\"Articles\":[{\"Title\":\"Valentino香港Elements圆方男装精品店\",\"Description\":\"Valentino香港Elements圆方男装精品店\",\"Url\":\"http:\\/\\/valentinowechat.samesamechina.com\\/wechat\\/store\\/7\",\"PicUrl\":\"http:\\/\\/valentinowechat.samesamechina.com\\/source\\/change\\/store\\/7.jpg\"},{\"Title\":\"Valentino香港Elements圆方女装精品店\",\"Description\":\"Valentino香港Elements圆方女装精品店\",\"Url\":\"http:\\/\\/valentinowechat.samesamechina.com\\/wechat\\/store\\/8\",\"PicUrl\":\"http:\\/\\/valentinowechat.samesamechina.com\\/source\\/change\\/store\\/8.jpg\"},{\"Title\":\"Valentino香港国金中心女装精品店\",\"Description\":\"Valentino香港国金中心女装精品店\",\"Url\":\"http:\\/\\/valentinowechat.samesamechina.com\\/wechat\\/store\\/9\",\"PicUrl\":\"http:\\/\\/valentinowechat.samesamechina.com\\/source\\/change\\/store\\/9.jpg\"},{\"Title\":\"Valentino香港置地广场男装精品店\",\"Description\":\"Valentino香港置地广场男装精品店\",\"Url\":\"http:\\/\\/valentinowechat.samesamechina.com\\/wechat\\/store\\/10\",\"PicUrl\":\"http:\\/\\/valentinowechat.samesamechina.com\\/source\\/change\\/store\\/10.jpg\"},{\"Title\":\"Valentino香港置地广场女装精品店\",\"Description\":\"Valentino香港置地广场女装精品店\",\"Url\":\"http:\\/\\/valentinowechat.samesamechina.com\\/wechat\\/store\\/11\",\"PicUrl\":\"http:\\/\\/valentinowechat.samesamechina.com\\/source\\/change\\/store\\/11.jpg\"},{\"Title\":\"Valentino香港广东道旗舰店\",\"Description\":\"Valentino香港广东道旗舰店\",\"Url\":\"http:\\/\\/valentinowechat.samesamechina.com\\/wechat\\/store\\/12\",\"PicUrl\":\"http:\\/\\/valentinowechat.samesamechina.com\\/source\\/change\\/store\\/12.jpg\"},{\"Title\":\"Valentino香港国际机场精品店\",\"Description\":\"Valentino香港国际机场精品店\",\"Url\":\"http:\\/\\/valentinowechat.samesamechina.com\\/wechat\\/store\\/13\",\"PicUrl\":\"http:\\/\\/valentinowechat.samesamechina.com\\/source\\/change\\/store\\/13.jpg\"}]}','2016-12-29 08:11:33'),(40,'tag5864c70172e1f','news','{\"Articles\":[{\"Title\":\"Valentino北京王府井in88精品店\",\"Description\":\"Valentino北京王府井in88精品店\",\"Url\":\"http:\\/\\/valentinowechat.samesamechina.com\\/wechat\\/store\\/1\",\"PicUrl\":\"http:\\/\\/valentinowechat.samesamechina.com\\/source\\/change\\/store\\/1.jpg\"},{\"Title\":\"Valentino北京银泰中心精品店\",\"Description\":\"Valentino北京银泰中心精品店\",\"Url\":\"http:\\/\\/valentinowechat.samesamechina.com\\/wechat\\/store\\/2\",\"PicUrl\":\"http:\\/\\/valentinowechat.samesamechina.com\\/source\\/change\\/store\\/2.jpg\"},{\"Title\":\"Valentino北京新光天地精品店\",\"Description\":\"Valentino北京新光天地精品店\",\"Url\":\"http:\\/\\/valentinowechat.samesamechina.com\\/wechat\\/store\\/3\",\"PicUrl\":\"http:\\/\\/valentinowechat.samesamechina.com\\/source\\/change\\/store\\/3.jpg\"},{\"Title\":\"Valentino北京新光天地精品店\",\"Description\":\"Valentino北京新光天地精品店\",\"Url\":\"http:\\/\\/valentinowechat.samesamechina.com\\/wechat\\/store\\/4\",\"PicUrl\":\"http:\\/\\/valentinowechat.samesamechina.com\\/source\\/change\\/store\\/4.jpg\"},{\"Title\":\"Valentino北京新光天地男装精品店\",\"Description\":\"Valentino北京新光天地男装精品店\",\"Url\":\"http:\\/\\/valentinowechat.samesamechina.com\\/wechat\\/store\\/5\",\"PicUrl\":\"http:\\/\\/valentinowechat.samesamechina.com\\/source\\/change\\/store\\/5.jpg\"},{\"Title\":\"Valentino北京新光天地女装精品店\",\"Description\":\"Valentino北京新光天地女装精品店\",\"Url\":\"http:\\/\\/valentinowechat.samesamechina.com\\/wechat\\/store\\/6\",\"PicUrl\":\"http:\\/\\/valentinowechat.samesamechina.com\\/source\\/change\\/store\\/6.jpg\"}]}','2016-12-29 08:19:13');
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
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wechat_getmsglog`
--

LOCK TABLES `wechat_getmsglog` WRITE;
/*!40000 ALTER TABLE `wechat_getmsglog` DISABLE KEYS */;
INSERT INTO `wechat_getmsglog` VALUES (1,'o-jLIwdvqdILL9MJLfKcsGNoueGo','event','<xml><ToUserName><![CDATA[gh_2fa0c25f7db4]]></ToUserName><FromUserName><![CDATA[o-jLIwdvqdILL9MJLfKcsGNoueGo]]></FromUserName><CreateTime>1482392208</CreateTime><MsgType><![CDATA[event]]></MsgType><Event><![CDATA[subscribe]]></Event><EventKey><![CDATA[]]></EventKey></xml>','2016-12-28 03:58:31'),(2,'586338c8e9c97','event','<xml><ToUserName><![CDATA[gh_2fa0c25f7db4]]></ToUserName><FromUserName><![CDATA[586338c8e9c97]]></FromUserName><CreateTime>1482392208</CreateTime><MsgType><![CDATA[event]]></MsgType><Event><![CDATA[subscribe]]></Event><EventKey><![CDATA[]]></EventKey></xml>','2016-12-28 04:00:08'),(3,'586338c9b9369','event','<xml><ToUserName><![CDATA[gh_2fa0c25f7db4]]></ToUserName><FromUserName><![CDATA[586338c9b9369]]></FromUserName><CreateTime>1482392208</CreateTime><MsgType><![CDATA[event]]></MsgType><Event><![CDATA[subscribe]]></Event><EventKey><![CDATA[]]></EventKey></xml>','2016-12-28 04:00:09'),(4,'586338ca4781d','event','<xml><ToUserName><![CDATA[gh_2fa0c25f7db4]]></ToUserName><FromUserName><![CDATA[586338ca4781d]]></FromUserName><CreateTime>1482392208</CreateTime><MsgType><![CDATA[event]]></MsgType><Event><![CDATA[subscribe]]></Event><EventKey><![CDATA[]]></EventKey></xml>','2016-12-28 04:00:10'),(5,'586338d7ebb8d','event','<xml><ToUserName><![CDATA[gh_2fa0c25f7db4]]></ToUserName><FromUserName><![CDATA[586338d7ebb8d]]></FromUserName><CreateTime>1482392208</CreateTime><MsgType><![CDATA[event]]></MsgType><Event><![CDATA[subscribe]]></Event><EventKey><![CDATA[]]></EventKey></xml>','2016-12-28 04:00:23'),(6,'586338d8a89d3','event','<xml><ToUserName><![CDATA[gh_2fa0c25f7db4]]></ToUserName><FromUserName><![CDATA[586338d8a89d3]]></FromUserName><CreateTime>1482392208</CreateTime><MsgType><![CDATA[event]]></MsgType><Event><![CDATA[subscribe]]></Event><EventKey><![CDATA[]]></EventKey></xml>','2016-12-28 04:00:24'),(7,'o-jLIwfXQPRWQy4nSQcGSZGRDl4k','event','<xml><ToUserName><![CDATA[gh_2fa0c25f7db4]]></ToUserName>\n<FromUserName><![CDATA[o-jLIwfXQPRWQy4nSQcGSZGRDl4k]]></FromUserName>\n<CreateTime>1482906351</CreateTime>\n<MsgType><![CDATA[event]]></MsgType>\n<Event><![CDATA[VIEW]]></Event>\n<EventKey><![CDATA[http://mp.weixin.qq.com/s?__biz=MzA5OTcwNDUwNQ==&mid=505470143&idx=1&sn=208a9d7ff26d41ca2679f712326ab808&scene=18#rd]]></EventKey>\n<MenuId>451498135</MenuId>\n</xml>','2016-12-28 06:25:51'),(8,'o-jLIwfXQPRWQy4nSQcGSZGRDl4k','event','<xml><ToUserName><![CDATA[gh_2fa0c25f7db4]]></ToUserName>\n<FromUserName><![CDATA[o-jLIwfXQPRWQy4nSQcGSZGRDl4k]]></FromUserName>\n<CreateTime>1482906353</CreateTime>\n<MsgType><![CDATA[event]]></MsgType>\n<Event><![CDATA[CLICK]]></Event>\n<EventKey><![CDATA[e1482313812637]]></EventKey>\n</xml>','2016-12-28 06:25:53'),(9,'fromUser','text','<xml>\n <ToUserName><![CDATA[toUser]]></ToUserName>\n <FromUserName><![CDATA[fromUser]]></FromUserName>\n <CreateTime>1348831860</CreateTime>\n <MsgType><![CDATA[text]]></MsgType>\n <Content><![CDATA[上海]]></Content>\n <MsgId>1234567890123456</MsgId>\n </xml>','2016-12-29 08:26:24'),(10,'fromUser','text','<xml>\n <ToUserName><![CDATA[toUser]]></ToUserName>\n <FromUserName><![CDATA[fromUser]]></FromUserName>\n <CreateTime>1348831860</CreateTime>\n <MsgType><![CDATA[text]]></MsgType>\n <Content><![CDATA[成都]]></Content>\n <MsgId>1234567890123456</MsgId>\n </xml>','2016-12-29 08:34:59');
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wechat_jssdk`
--

LOCK TABLES `wechat_jssdk` WRITE;
/*!40000 ALTER TABLE `wechat_jssdk` DISABLE KEYS */;
INSERT INTO `wechat_jssdk` VALUES (1,'11','111',1,'58639e1fa3146','','2016-12-28 11:12:31');
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
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wechat_keyword_tag`
--

LOCK TABLES `wechat_keyword_tag` WRITE;
/*!40000 ALTER TABLE `wechat_keyword_tag` DISABLE KEYS */;
INSERT INTO `wechat_keyword_tag` VALUES (1,'tag585b92f240b91','合作','2016-12-22 08:46:42'),(2,'tag585b931e72d87','价格','2016-12-22 08:47:26'),(3,'tag585b9331ee59b','售后','2016-12-22 08:47:45'),(4,'tag585b9370c5642','是不是正品','2016-12-22 08:48:48'),(5,'tag585b93aaacf79','开线','2016-12-22 08:49:46'),(6,'tag585b93f3b3b7f','旗舰店','2016-12-22 08:50:59'),(7,'tag585b94529482b','产品','2016-12-22 08:52:34'),(8,'tag585b95c5aa637','16高定','2016-12-22 08:58:45'),(9,'tag585b95ef753c3','直播','2016-12-22 08:59:27'),(10,'tag585b9754a6be6','yy','2016-12-22 09:05:24'),(11,'tag585b97f95cdb8','Spike','2016-12-22 09:08:09'),(12,'tag585b991c63494','jamaica','2016-12-22 09:13:00'),(13,'tag585b99ca43f52','牛仔','2016-12-22 09:15:54'),(14,'tag585b9b4eb87d3','迷彩','2016-12-22 09:22:22'),(15,'tag585b9d25909e4','配饰','2016-12-22 09:30:13'),(16,'tag585b9eaf03d9b','成衣','2016-12-22 09:36:47'),(17,'tag585ba12535245','男士','2016-12-22 09:47:17'),(18,'tag5864bfa7402ae','上海','2016-12-29 07:47:51'),(19,'tag5864c260e5f7c','成都','2016-12-29 07:59:28'),(20,'tag5864c2f726afc','无锡','2016-12-29 08:01:59'),(21,'tag5864c35db45e5','沈阳','2016-12-29 08:03:41'),(22,'tag5864c3b70aa07','西安','2016-12-29 08:05:11'),(23,'tag5864c4150988a','青岛','2016-12-29 08:06:45'),(24,'tag5864c45b5b01f','厦门','2016-12-29 08:07:55'),(25,'tag5864c5350800d','香港','2016-12-29 08:11:33'),(26,'tag5864c70172e1f','北京','2016-12-29 08:19:13');
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
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wechat_menu`
--

LOCK TABLES `wechat_menu` WRITE;
/*!40000 ALTER TABLE `wechat_menu` DISABLE KEYS */;
INSERT INTO `wechat_menu` VALUES (17,'品牌传承','',NULL,NULL,NULL,'1','2016-12-21 09:34:45'),(18,'最新系列','',NULL,NULL,NULL,'2','2016-12-21 09:34:59'),(19,'即时讯息','',NULL,NULL,NULL,'3','2016-12-21 09:35:09'),(20,'品牌历史','click','e1482313600124',NULL,NULL,'','2016-12-21 09:46:40'),(21,'创作总监','view',NULL,'http://wechat.valentinoworld.com/creative-director.html',NULL,'1','2016-12-21 09:47:49'),(22,'璀璨工艺','click','e1482313812637',NULL,NULL,'2','2016-12-21 09:50:12'),(23,'官方网站','view',NULL,'http://www.valentino.cn/cn',NULL,'3','2016-12-21 09:50:44'),(24,'店铺搜索','view',NULL,'http://mp.weixin.qq.com/s?__biz=MzA5OTcwNDUwNQ==&mid=505470143&idx=1&sn=208a9d7ff26d41ca2679f712326ab808#rd',NULL,'4','2016-12-21 09:51:23'),(25,'女士系列','click','e1482314369290',NULL,NULL,'1','2016-12-21 09:59:29'),(26,'男士系列','click','e1482385965876',NULL,NULL,'2','2016-12-22 05:52:45'),(27,'日式侘寂美学','click','e1482386262088',NULL,NULL,'3','2016-12-22 05:57:41'),(28,'亮黑摇滚','view',NULL,'http://mp.weixin.qq.com/s?__biz=MzA5OTcwNDUwNQ==&mid=2652954212&idx=1&sn=5489407ab0e453999b67c4edd941255b&chksm=8b2a35b2bc5dbca4054598ef5a118a7c1fd2545a2a7151eb181d429b73625419df3258965501&scene=4#wechat_redirect',NULL,'4','2016-12-22 05:58:28'),(30,'星光熠熠','click','e1482386718913',NULL,NULL,'1','2016-12-22 06:05:18'),(31,'活动报道','click','e1482387260047',NULL,NULL,'2','2016-12-22 06:14:19'),(32,'秀场动态','click','e1482387481799',NULL,NULL,'3','2016-12-22 06:18:01'),(33,'广告特辑','click','e1482387699472',NULL,NULL,'4','2016-12-22 06:21:39'),(34,'高级定制','click','e1482387927649',NULL,NULL,'5','2016-12-22 06:25:27');
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
INSERT INTO `wechat_menu_hierarchy` VALUES (17,0),(18,0),(19,0),(20,17),(21,17),(22,17),(23,17),(24,17),(25,18),(26,18),(27,18),(28,18),(30,19),(31,19),(32,19),(33,19),(34,18);
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wechat_oauth`
--

LOCK TABLES `wechat_oauth` WRITE;
/*!40000 ALTER TABLE `wechat_oauth` DISABLE KEYS */;
INSERT INTO `wechat_oauth` VALUES (1,'test','http://valentinowechat.samesamechina.com/wechat/test2','http://valentinowechat.samesamechina.com/wechat/jssdk/test','snsapi_userinfo','585cee77a4bba','2016-12-23 09:29:27');
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wechat_qrcode`
--

LOCK TABLES `wechat_qrcode` WRITE;
/*!40000 ALTER TABLE `wechat_qrcode` DISABLE KEYS */;
INSERT INTO `wechat_qrcode` VALUES (1,'testtest',2,NULL,'gQHe7zwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyYnl5WGNpV09mODExMDAwMGcwM3cAAgRQKlpYAwQAAAAA',NULL,1,2,'http://weixin.qq.com/q/02byyXciWOf8110000g03w','qrcode58622666e6269','1','2016-12-27 08:29:26');
/*!40000 ALTER TABLE `wechat_qrcode` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wechat_users`
--

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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wechat_users`
--

LOCK TABLES `wechat_users` WRITE;
/*!40000 ALTER TABLE `wechat_users` DISABLE KEYS */;
INSERT INTO `wechat_users` VALUES (1,'o-jLIwdvqdILL9MJLfKcsGNoueGo','','','0',NULL,NULL,NULL,'1','2016-12-28 03:58:31'),(2,'586338c8e9c97','','','0',NULL,NULL,NULL,'1','2016-12-28 04:00:08'),(3,'586338c9b9369','','','0',NULL,NULL,NULL,'1','2016-12-28 04:00:09'),(4,'586338ca4781d','','','0',NULL,NULL,NULL,'1','2016-12-28 04:00:10'),(5,'586338d7ebb8d','','','0',NULL,NULL,NULL,'1','2016-12-28 04:00:23'),(6,'586338d8a89d3','','','0',NULL,NULL,NULL,'1','2016-12-28 04:00:24');
/*!40000 ALTER TABLE `wechat_users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-12-29 17:46:00
