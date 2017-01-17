DROP TABLE IF EXISTS `wechat_material`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wechat_material` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` blob NOT NULL,
  `thumb_media_id` varchar(255) DEFAULT NULL,
  `show_cover_pic` varchar(400) DEFAULT NULL,
  `author` varchar(400) DEFAULT NULL,
  `digest` blob NOT NULL,
  `url` varchar(400) DEFAULT NULL,
  `content_source_url` varchar(400) DEFAULT NULL,
  `thumb_url` varchar(400) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `thumb_media_id` (`thumb_media_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;
