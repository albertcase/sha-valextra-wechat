
DROP TABLE IF EXISTS `wechat_jssdk`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wechat_jssdk` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  `domain` varchar(200) NOT NULL,
  `editorid` int(11) NOT NULL,
  `jsfilename` varchar(50) NOT NULL,
  `jscontent` longtext NOT NULL,
  `createTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `wechat_jssdk_eid` (`editorid`),
  CONSTRAINT `wechat_jssdk_id` FOREIGN KEY (`editorid`) REFERENCES `wechat_admin` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
