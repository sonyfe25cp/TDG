-- MySQL dump 10.13  Distrib 5.5.28, for osx10.8 (i386)
--
-- Host: localhost    Database: tdg
-- ------------------------------------------------------
-- Server version	5.5.28

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
-- Table structure for table `ProductLine`
--

DROP TABLE IF EXISTS `ProductLine`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ProductLine` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `english` varchar(45) DEFAULT NULL,
  `parentId` int(11) NOT NULL,
  `level` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=201 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ProductLine`
--

LOCK TABLES `ProductLine` WRITE;
/*!40000 ALTER TABLE `ProductLine` DISABLE KEYS */;
INSERT INTO `ProductLine` VALUES (16,'服装，鞋子，包包','Clothing, Shoes & Handbags',0,1),(17,'服装','Clothing',16,2),(18,'儿童，母婴用品和玩具','Kids , Maternity , Baby & Toys and Games',0,1),(19,'美容, 护肤, 美发','Beauty',0,1),(20,'化妆用品','Makeup',19,2),(21,'眼部化妆','Eyes',20,3),(22,'女装','Women’s Clothing',17,3),(23,'鞋子 ','Shoes',16,2),(24,'男装','Men’s Clothing',17,3),(25,'包包','Handbags',16,2),(26,'服饰配件','Accessories',17,3),(27,'内衣','Intimates',17,3),(28,'家居休闲服','Sleep & Lounge',17,3),(29,'泳衣','Swim',17,3),(30,'女鞋','Women’s Shoes',23,3),(31,'男鞋','Men’s Shoes',23,3),(32,'少年鞋','Boys’ Shoes',23,3),(33,'少女鞋','Girls’ Shoes',23,3),(34,'运动鞋和户外鞋','Athletic and Outdoor Shoes',23,3),(35,'鞋子护理与配件','Shoes Care & Accessories',23,3),(36,'女包','Women’s Handbags',25,3),(37,'男包','Men’s Handbags',25,3),(38,'箱包','Luggage',25,3),(39,'书包，其它包和配件','Backpacks, Bags, Cases and Accessories',25,3),(40,'妈妈用品','Maternity Products',18,2),(41,'婴儿用品','Baby Products',18,2),(42,'儿童服装','Kids’ Clothing',18,2),(43,'玩具和游戏','Toys and Games',18,2),(45,'护肤用品','Skincare Products',19,2),(46,'男士护理','Men’s Grooming',19,2),(47,'美发用品','Hair Care',19,2),(48,'香水','Perfume',19,2),(49,'配件和工具','Tools and Accessories',19,2),(50,'孕妇服装','Maternity Clothing',40,3),(51,'孕妇配件','Maternity Accessories',40,3),(52,'妈妈护理/营养 ','Mom’s care',40,3),(53,'婴儿服装','Baby’s Clothing',41,3),(54,'婴儿喂养用品','Baby Health and Food',41,3),(55,'婴儿护理用品','Baby Care',41,3),(56,'男孩服装','Boys’ Clothing',42,3),(57,'女孩服装','Girls’ Clothing',42,3),(58,'婴儿玩具和游戏','Baby’s toys and Games	',43,3),(59,'儿童玩具和游戏','Kids’ toys and Games',43,3),(60,'','',20,3),(61,'','',20,3),(62,'眼部化妆','Eyes',20,3),(63,'唇部化妆','Lips',20,3),(64,'脸部化妆','Face',20,3),(65,'美甲','Nails',20,3),(66,'脸部护理','Face',45,3),(67,'眼部护理','Eyes ',45,3),(68,'唇部护理','Lip Care',45,3),(69,'身体护理','Bath & Body',45,3),(70,'防晒','Sun',45,3),(71,'刮脸','Shave',46,3),(72,'护肤','Skin Care',46,3),(73,'身体护理','Body Care',46,3),(74,'头发护理','Hair Care',46,3),(75,'洗发水','Shampoo',47,3),(76,'护发素','Conditioner',47,3),(77,'造型用品','Styling Products',47,3),(78,'染发用品','Hair Color',47,3),(79,'特别护理','Hair Treatment',47,3),(80,'女士香水','Women’s Perfume',48,3),(81,'男士香水','Men’s Perfume',48,3),(82,'护发工具','Hair Tools',49,3),(83,'化妆工具','Makeup Brushes',49,3),(84,'美甲工具','Nail Tools',49,3),(85,'化妆包','Cosmetics Bags & Cases',49,3),(86,'清洗工具','Cleansing Tools',49,3),(87,'户外运动用品','Outdoor Recreation ',0,1),(88,'户外运动用品','Outdoor Recreation',87,2),(89,'运动服装','Athletic & Outdoor Clothing ',87,2),(90,'健身用品','Fitness & Exercises Products',87,2),(91,'其它运动用品和配件','All other Sports & Outdoors/ Accessories',87,2),(92,'钓鱼和打猎','Fishing and hunting',88,3),(93,'水上和船上运动','Water Sports& Boating',88,3),(94,'爬山','Climbing',88,3),(95,'露营','Camping& Backpacking',88,3),(96,'雪上运动','Snow Sports',88,3),(97,'自行车运动','Cycling',88,3),(98,'高尔夫','Golf',88,3),(99,'男士服装','Men’s Clothing',89,3),(100,'女士服装','Women’s Clothing',89,3),(101,'男孩服装','Boys’ Clothing',89,3),(102,'女孩服装','Girls’ Clothing',89,3),(103,'é£ç©','Foods',0,1),(104,'食品','Grocery & Gourmet Food',103,2),(105,'酒类','Wine',103,2),(106,'卫生医药保健营养品','Health Care',103,2),(107,'早餐','Breakfast Foods',104,3),(108,'零食','Snacks',104,3),(109,'饮料','Beverages',104,3),(110,'有机食品','Organic Foods',104,3),(111,'无面筋食品','Gluten-Free Foods',104,3),(112,'烘焙食品','Baking Products',104,3),(113,'食品套装礼品','Gourmet gift',104,3),(114,'咖啡&茶','Coffee and Tea',104,3),(115,'其它食品','other foods',104,3),(116,'调味料','Herbs, Spices and seasoning',104,3),(117,'储存便捷快速食品','Pantry',104,3),(118,'健康护理（药品）','Health Care',106,3),(119,'维他命&其它元素补给营养品','Vitamin Supplement& Natural Remedies',106,3),(120,'性福产品','Sexual Wellness',106,3),(121,'减肥产品','Weight Management & Dietary Supplement',106,3),(122,'运动营养品','Sports Nutrition',106,3),(123,'个人护理产品','Personal Care',106,3),(124,'家庭医疗护理器材','Health Care Equipments',106,3),(125,'其他','Other Heal Care',106,3),(126,'电子用品','Electronics',0,1),(127,'电子配件','Electronic Accessories',126,2),(128,'电子产品','',126,2),(129,'珠宝首饰，手表和其它配饰','Jewelry, Watch & Accessories',0,1),(130,'家庭用品，车辆用品和游戏产品','Home, Vehicle & Games',0,1),(131,'其它产品','',0,1),(132,'办公以及上学用品','Office & school supplies',131,2),(133,'艺术，工艺 &缝纫','Art, Craft & Sewing',131,2),(134,'工业用品','Industrial Products',131,2),(135,'实验用品','Lab& Scientific',131,2),(136,'乐器','Musical Instruments',131,2),(137,'书籍/杂志/报纸','Books, Magazines & Newspaper',131,2),(138,'音乐/影视/明星/音像','Movies & Music',131,2),(139,'安全设备&安全用品','Safety Equipment & Safety Supplies',131,2),(140,'鲜花&绿植园艺','Flower & Gardening',131,2),(141,'网络设备/网络相关','Internet devices & Supplies',131,2),(142,'个性定制/设计服务/DIY','',131,2),(143,'圣诞用品','Christmas Products',131,2),(144,'家庭用品','Home Supplies',130,2),(145,'床上用品','Bedding',144,3),(146,'住宅家具','Furniture',144,3),(147,'家居饰品','Decorations',144,3),(148,'厨房/餐饮用具','Kitchen & Dining',144,3),(149,'家用配件','Home Hardware',144,3),(150,'室外，阳台，花园用品','Patio, Garden & Outdoor Products',144,3),(151,'家用工具','Tools& Home Improvement',144,3),(152,'家装主材','Building Supplies',144,3),(153,'卫浴/收纳/整理用具','Cleaning, Bathing & Organizing',144,3),(154,'清洁用品','Janitorial Supplies',144,3),(155,'灯&天花板扇','Lighting & Ceiling fans',144,3),(156,'生活用品','Household Supplies',144,3),(157,'艺术品','Fine Art',144,3),(158,'宠物食品和护理','Pet Food and Supplies',130,2),(159,'车辆用品','',130,2),(160,'游戏产品','Digital Games & Software',130,2),(161,'汽车零件和配件','Automotive Parts & Accessories',159,3),(162,'汽车工具及设备','Automotive Tools & Equipment ',159,3),(163,'摩托车用品及配件','motorcycle & Accessories',159,3),(164,'宠物食品','Pet Foods',158,3),(165,'宠物护理用品','Pet Supplies',158,3),(166,'珠宝首饰','Jewelry',129,2),(167,'手表','Watch',129,2),(168,'其它配饰','Accessories',129,2),(169,'男士手表','Men’s Watch',167,3),(170,'女士手表','Women’s Watch',167,3),(171,'戒指','Rings',166,3),(172,'项链','Necklaces',166,3),(173,'手链','Bracelets',166,3),(174,'耳环&耳钉 ','Earrings',166,3),(175,'男士首饰','Men’s Jewelry',166,3),(181,'手机配件','Cell Phone Accessories',127,3),(182,'电脑配件 ','Computer Accessories',127,3),(183,'电脑硬件','Computer parts& Components',127,3),(184,'电脑软件','Software',127,3),(185,'电脑周边','Computer Peripherals',127,3),(186,'闪存卡/U盘/存储/移动硬盘','Memory Card, Flash disk & Hard Drive',127,3),(187,'音乐播放器配件&MP3/MP4配件','Music player& MP3,MP4 Accessories',127,3),(188,'耳机/耳麦','Headphones',127,3),(189,'其它','other',127,3),(190,'电脑 ','Computer (Desktops & Laptops)',128,3),(191,'相机& 摄像机','Camera, Photo& Video',128,3),(192,'影音电器','Home Audio &Theater',128,3),(193,'安全与监控','Security & Surveillance',128,3),(194,'平板电脑','Tablets',128,3),(195,'手机','Cell Phone',128,3),(196,'MP3/MP4/iPod/录音笔','MP3, MP4 Players & Recorder',128,3),(197,'汽车电子用品','Vehicle Electronics',128,3),(198,'打印机&墨','Printers& Ink',128,3),(199,'厨房用品','Kitchen Electronics',128,3),(200,'生活电器','',128,3);
/*!40000 ALTER TABLE `ProductLine` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ProductParameter`
--

DROP TABLE IF EXISTS `ProductParameter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ProductParameter` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `english` varchar(45) DEFAULT NULL,
  `pvalue` varchar(45) DEFAULT NULL,
  `parentId` int(11) NOT NULL,
  `level` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ProductParameter`
--

LOCK TABLES `ProductParameter` WRITE;
/*!40000 ALTER TABLE `ProductParameter` DISABLE KEYS */;
INSERT INTO `ProductParameter` VALUES (1,'颜色','color','',0,1),(3,'红色','red','#777',1,2),(4,'尺码','size','',0,1),(5,'37','37','',4,2),(6,'38','38','',4,2),(7,'蓝色','blue','#888',1,2);
/*!40000 ALTER TABLE `ProductParameter` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(45) NOT NULL,
  `password` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin`
--

LOCK TABLES `admin` WRITE;
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
INSERT INTO `admin` VALUES (1,'admin','123123');
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `brand`
--

DROP TABLE IF EXISTS `brand`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `brand` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `description` text NOT NULL,
  `nameinchinese` varchar(45) DEFAULT NULL,
  `descriptioninchinese` text,
  `ischinese` int(11) DEFAULT '0',
  `sellerId` int(11) NOT NULL,
  `status` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `brand`
--

LOCK TABLES `brand` WRITE;
/*!40000 ALTER TABLE `brand` DISABLE KEYS */;
INSERT INTO `brand` VALUES (6,'Adidas','<p>\r\n	<img src=\"http://t1.gstatic.com/images?q=tbn:ANd9GcR_s4GXvdkwFt6SezWL7Aojk_rJJ0fC8v_9PVFVwf_JZ4I9OuaD_Q&t=1\" alt=\"\" />\r\n</p>\r\n<p>\r\n	<span style=\"color:#222222;font-family:arial, sans-serif;font-size:13px;line-height:16px;background-color:#FFFFFF;\"><a target=\"_blank\" href=\"http://baike.baidu.com/view/28012.htm\">Adidas AG is a German multinational corporation that designs and manufactures sports clothing and accessories based in Herzogenaurach, Bavaria, Germany. Frequently mispronounced as.</a></span><span style=\"color:#333333;font-family:arial, 宋体, sans-serif;font-size:14px;line-height:25px;background-color:#FFFFFF;\"></span>\r\n</p>\r\n<p>\r\n	<span style=\"color:#2C2D2E;font-family:arial, sans-serif;font-size:13px;line-height:16px;\">For over 80 years the adidas Group has been part of the world of sports on every level, delivering state-of-the-art sports footwear, apparel and accessories. Today, the adidas Group is a global leader in the sporting goods industry and offers a broad portfolio of products. Products from the adidas Group are available in virtually every country of the world. Our strategy is simple: continuously strengthen our brands and products to improve our competitive position and financial performance.&nbsp;</span><br />\r\n<span style=\"color:#2C2D2E;font-family:arial, sans-serif;font-size:13px;line-height:16px;\">&nbsp;</span><br />\r\n<strong>adidas</strong><br />\r\n<span style=\"color:#2C2D2E;font-family:arial, sans-serif;font-size:13px;line-height:16px;\">Footwear, apparel, accessories</span><br />\r\n<br />\r\n<strong>Reebok</strong><br />\r\n<span style=\"color:#2C2D2E;font-family:arial, sans-serif;font-size:13px;line-height:16px;\">Footwear, apparel and accessories</span><br />\r\n<span style=\"color:#2C2D2E;font-family:arial, sans-serif;font-size:13px;line-height:16px;\">&nbsp;</span><br />\r\n<strong>TaylorMade-adidas</strong><span style=\"color:#2C2D2E;font-family:arial, sans-serif;font-size:13px;line-height:16px;\">&nbsp;</span><strong>Golf</strong><br />\r\n<span style=\"color:#2C2D2E;font-family:arial, sans-serif;font-size:13px;line-height:16px;\">Golf Equipment: metalwoods, irons putters, golf balls, footwear, apparel and accessories</span><br />\r\n<span style=\"color:#2C2D2E;font-family:arial, sans-serif;font-size:13px;line-height:16px;\">&nbsp;</span><br />\r\n<strong>Rockport</strong><br />\r\n<span style=\"color:#2C2D2E;font-family:arial, sans-serif;font-size:13px;line-height:16px;\">Dress, casual and outdoor footwear, apparel and accessories</span><br />\r\n<span style=\"color:#2C2D2E;font-family:arial, sans-serif;font-size:13px;line-height:16px;\">&nbsp;</span><br />\r\n<strong>CCM-Hockey</strong><br />\r\n<span style=\"color:#2C2D2E;font-family:arial, sans-serif;font-size:13px;line-height:16px;\">Hockey equipment and apparel</span><br />\r\n<span style=\"color:#2C2D2E;font-family:arial, sans-serif;font-size:13px;line-height:16px;\">&nbsp;</span><br />\r\n<span style=\"color:#2C2D2E;font-family:arial, sans-serif;font-size:13px;line-height:16px;\">Activities of the company and its around&nbsp;170 subsidiaries are directed from the Group\'s headquarters in Herzogenaurach, Germany.&nbsp;It is also home to the adidas brand.&nbsp;Reebok Headquarters are located in Canton, Massachusetts. TaylorMade-adidas Golf is based in California. The company also operates&nbsp;creation centres&nbsp;and development departments at other locations around the world, corresponding to the related business activity.&nbsp;</span><br />\r\n<br />\r\n<span style=\"color:#2C2D2E;font-family:arial, sans-serif;font-size:13px;line-height:16px;\">adidas Sourcing Ltd., a fully-owned subsidiary headquartered in Hong Kong, is the worldwide sourcing agent for the adidas Group.</span><br />\r\n<span style=\"color:#2C2D2E;font-family:arial, sans-serif;font-size:13px;line-height:16px;\">Effective December 31, 2012, the adidas Group employed 46,306 people.</span>\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n</p>','阿迪达斯','<p>\r\n	<img src=\"http://t1.gstatic.com/images?q=tbn:ANd9GcR_s4GXvdkwFt6SezWL7Aojk_rJJ0fC8v_9PVFVwf_JZ4I9OuaD_Q&amp;t=1\" alt=\"\" />\r\n</p>\r\n<p>\r\n	<span><span style=\"line-height:16px;\">阿迪达斯非常棒哦！！！！</span></span>\r\n</p>\r\n<p>\r\n	<br />\r\n</p>',0,1,6),(7,'NoPrinter','<p>\r\n	<img src=\"/uploads/images/1379816605101.png\" width=\"647\" height=\"166\" alt=\"\" />\r\n</p>\r\n<p>\r\n	Noprinter is a good service for students in university of beijing.\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	<br />\r\n</p>','打印铺','打印铺是个有良心的店铺',0,1,6),(8,'1668275786','<p>\r\n	1668275786\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	<img src=\"/uploads/images/1380878603026.JPG\" alt=\"\" /> \r\n</p>',NULL,NULL,0,10001,0),(10,'23323','sadfasdf','ddee','asdf',0,1,6),(11,'bbbbrand','asf',NULL,NULL,0,1,2);
/*!40000 ALTER TABLE `brand` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `claimItem`
--

DROP TABLE IF EXISTS `claimItem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `claimItem` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `claimType` varchar(45) NOT NULL,
  `claimTypeId` int(11) DEFAULT NULL,
  `sellerId` int(11) DEFAULT NULL,
  `claimItemId` int(11) DEFAULT NULL,
  `customerId` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `previousStatus` int(11) DEFAULT NULL,
  `comment` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `claimItem`
--

LOCK TABLES `claimItem` WRITE;
/*!40000 ALTER TABLE `claimItem` DISABLE KEYS */;
INSERT INTO `claimItem` VALUES (1,'order',5,10000,28,8,1,10,NULL),(2,'order',7,10001,32,10000,1,3,NULL),(4,'order',5,1,30,8,1,2,NULL),(5,'order',9,10000,29,8,1,2,NULL),(6,'order',4,10001,41,10000,1,2,NULL),(7,'order',10,1,37,8,1,2,NULL);
/*!40000 ALTER TABLE `claimItem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `country`
--

DROP TABLE IF EXISTS `country`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `country` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `nameInChinese` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `country`
--

LOCK TABLES `country` WRITE;
/*!40000 ALTER TABLE `country` DISABLE KEYS */;
INSERT INTO `country` VALUES (1,'USA','美国'),(3,'Japan','日本'),(4,'England','英国'),(5,'Canada','加拿大'),(6,'Germany','å¾·å½'),(8,'China','ä¸­å½');
/*!40000 ALTER TABLE `country` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(45) NOT NULL,
  `password` varchar(255) NOT NULL,
  `accountstatus` int(11) DEFAULT '0',
  `accessToken` varchar(100) DEFAULT NULL,
  `refreshToken` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=MyISAM AUTO_INCREMENT=10001 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES (1,'chenjie','123123',3,NULL,NULL),(2,'customer','123123',2,NULL,NULL),(3,'xiaoxiao','123123',3,NULL,NULL),(4,'','',3,NULL,NULL),(5,'a','123123',3,NULL,NULL),(6,'admin@noprinter.cn','123123',4,NULL,NULL),(8,'sonyfe25cp@gmail.com','123123',3,'62008054b4d88ZZb277bcee9bd39a69fc111e791dee21e0169042297','6202505c91cbdfh3a3af9c5f714bc4ec6816482311d3ad3169042297'),(10000,'buyer@126.com','123123',3,NULL,NULL);
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customerAddress`
--

DROP TABLE IF EXISTS `customerAddress`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customerAddress` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `city` varchar(255) DEFAULT NULL,
  `country` varchar(255) DEFAULT NULL,
  `postCode` varchar(255) NOT NULL,
  `customerId` int(11) NOT NULL,
  `countryCode` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customerAddress`
--

LOCK TABLES `customerAddress` WRITE;
/*!40000 ALTER TABLE `customerAddress` DISABLE KEYS */;
INSERT INTO `customerAddress` VALUES (1,'Chenjie','beijing institue of technology','beijing','China','100081',2,1),(2,'Chenjie','beiyuan jiayuan, shihuabojun','beijing','China','100081',2,1),(3,'陈杰','北京理工大学计算中心','北京','中国','100081',1,1),(4,'陈杰','北京理工大学计算中心406','北京','中国','100081',1,1),(5,'晓晓','世华泊郡','北京','中国','100081',1,1),(6,'晓晓','海淀区政府','北京','中国','100081',1,1),(7,'陈杰','北京理工大学计算中心','北京','中国','100081',8,1),(8,'123','123','123','123','123',8,1),(9,'chenjie','shuianzhongjie','beijing','USA','100091',8,1),(13,'Ruby','123','London','England','5100',0,4),(14,'GGGG','BBBb','AAA','Canada','2500',0,5),(15,'aaa','CCC','BBB','Canada','1005',10000,5),(16,'1','1','123','China','1',8,8),(17,'CCC','BBB','AAA','China','1005',10000,8);
/*!40000 ALTER TABLE `customerAddress` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `helpservice`
--

DROP TABLE IF EXISTS `helpservice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `helpservice` (
  `tradeRules` text,
  `shoppingProcess` text,
  `orderStatus` text,
  `FAQ` text,
  `contactCustomService` text,
  `afterSalePolicy` text,
  `cashAfterDelivery` text,
  `priceProtect` text,
  `refundInstruction` text,
  `thirdPartyExpress` text,
  `vipIntroduction` text,
  `isChinese` int(11) DEFAULT '1',
  `payOnline` text,
  `id` int(11) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `helpservice`
--

LOCK TABLES `helpservice` WRITE;
/*!40000 ALTER TABLE `helpservice` DISABLE KEYS */;
INSERT INTO `helpservice` VALUES ('<p>\r\n1.注册账号\r\n</p>\r\n<p>\r\n2.查找商品\r\n</p>\r\n<p>\r\n3.放入购物车\r\n</p>\r\n<p>\r\n4.提交订单\r\n</p>\r\n<p>\r\n5.查看订单状态\r\n</p>','1. 注册帐号。&lt;br&gt;2. 查找商品。&lt;br&gt;3. 放入购物车。&lt;br&gt;4. 提交订单。&lt;br&gt;5. 查看订单状态',' 1. 注册帐号。<br>2. 查找商品。<br>3. 放入购物车。<br>4. 提交订单。<br>5. 查看订单状态','1. 注册帐号。<br>2. 查找商品。<br>3. 放入购物车。<br>4. 提交订单。<br>5. 查看订单状态 ','ytetretrter','1. 注册帐号。<br>2. 查找商品。<br>3. 放入购物车。<br>4. 提交订单。<br>5. 查看订单状态 ',' 1. 注册帐号。<br>2. 查找商品。<br>3. 放入购物车。<br>4. 提交订单。<br>5. 查看订单状态',' 1. 注册帐号。<br>2. 查找商品。<br>3. 放入购物车。<br>4. 提交订单。<br>5. 查看订单状态',' 1. 注册帐号。<br>2. 查找商品。<br>3. 放入购物车。<br>4. 提交订单。<br>5. 查看订单状态','1. 注册帐号。<br>2. 查找商品。<br>3. 放入购物车。<br>4. 提交订单。<br>5. 查看订单状态 ','1. 注册帐号。<br>2. 查找商品。<br>3. 放入购物车。<br>4. 提交订单。<br>5. 查看订单状态 ',1,'1. 注册帐号。<br>2. 查找商品。<br>3. 放入购物车。<br>4. 提交订单。<br>5. 查看订单状态 ',0);
/*!40000 ALTER TABLE `helpservice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `item`
--

DROP TABLE IF EXISTS `item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `item` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sku` varchar(100) DEFAULT NULL,
  `name` varchar(500) DEFAULT NULL,
  `nameInChinese` varchar(500) DEFAULT NULL,
  `featureJson` varchar(500) DEFAULT NULL,
  `image` varchar(200) DEFAULT NULL,
  `retailPrice` float DEFAULT NULL,
  `promotionPrice` float DEFAULT NULL,
  `promotionTime` date DEFAULT NULL,
  `wholePrice` float DEFAULT NULL,
  `minimumQuantity` int(11) DEFAULT NULL,
  `maximumAcceptQuantity` int(11) DEFAULT NULL,
  `availableQuantity` int(11) DEFAULT NULL,
  `safeStock` int(11) DEFAULT NULL,
  `productId` int(11) NOT NULL,
  `coinage` int(11) DEFAULT NULL,
  `categoryId` int(11) NOT NULL,
  `sellerId` int(11) NOT NULL,
  `promotionEnd` date DEFAULT NULL,
  `active` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `internationalShippingService` int(11) DEFAULT NULL,
  `internationalShippingFee` double DEFAULT NULL,
  `internationalPromiseDays` int(11) DEFAULT NULL,
  `countryCode` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1000064 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item`
--

LOCK TABLES `item` WRITE;
/*!40000 ALTER TABLE `item` DISABLE KEYS */;
INSERT INTO `item` VALUES (1000021,'9001','puercha','name in chinese ','','/uploads/images/1380612276673.jpg',200,190,'2013-10-02',150,20,100,1400,300,1000029,1,53,1,'2013-10-09',1,8,1,18,5,1),(1000022,'de','adidass','name in chinese ','','/uploads/images/1380639761752.jpg',1000,800,'2013-10-02',850,50,100,10000,200,1000030,2,31,10000,'2013-10-08',1,8,0,0,0,3),(1000023,'iidde','尺子','name in chinese ','','/uploads/images/1380822966613.jpg',500,400,'2013-10-05',200,100,500,10000,200,1000031,1,30,1,'2013-10-31',1,8,0,0,0,1),(1000024,'Jewelry1','Jewelry Test 1','name in chinese ','\"color\":\"Red\",\"size\":\"1\"','/uploads/images/1380878966779.JPG',99,88,NULL,77,99,99,9,1,1000032,3,168,10001,NULL,1,8,0,0,0,5),(1000025,'Jewelry 2','Jewelry Test 1','name in chinese ','\"color\":\"Blue\",\"size\":\"1\"','/uploads/images/1380878994372.JPG',99,88,NULL,77,99,99,9,1,1000032,3,168,10001,NULL,1,8,0,0,0,5),(1000026,'Jewelry 3','Jewelry Test 1','name in chinese ','\"color\":\"Red\",\"size\":\"2\"','/uploads/images/1380879015278.JPG',99,88,NULL,77,99,99,9,1,1000032,3,168,10001,NULL,1,8,0,0,0,5),(1000027,'1668A','Apparel Test 1','name in chinese ','','/uploads/images/1380879656082.JPG',99,88,'2013-10-02',77,77,99,9,8,1000033,3,22,10001,'2013-10-30',1,8,0,0,0,5),(1000028,'1668A','Apparel Test 1','name in chinese ','','/uploads/images/1380879656082.JPG',99,88,'2013-10-02',77,77,99,9,8,1000034,3,22,10001,'2013-10-30',1,8,0,0,0,5),(1000029,'Shoe Child1','Shoe Test 1','name in chinese ','\"color\":\"Red\",\"size\":\"1\"','/uploads/images/1380880699100.JPG',99,88,NULL,77,99,99,100,1,1000035,3,30,10001,NULL,1,8,0,0,0,5),(1000030,'Shoe Child 2','Shoe Test 1','name in chinese ','\"color\":\"Blue \",\"size\":\"2\"','/uploads/images/1380880759160.JPG',99,88,NULL,77,99,99,100,1,1000035,3,30,10001,NULL,1,8,0,0,0,5),(1000031,'Shoe Child 3','Shoe Test 1','name in chinese ','\"color\":\"Red\",\"size\":\"2\"','/uploads/images/1380880803622.JPG',99,88,NULL,77,99,99,100,1,1000035,3,30,10001,NULL,1,8,0,0,0,5),(1000032,'Jewelry 1','Jewelry Test Without Child','name in chinese ','','/uploads/images/1380881120625.JPG',99,88,'2013-10-01',77,77,99,9,1,1000036,3,168,10001,'2013-10-22',1,8,0,0,0,5),(1000033,'Sport1','Sports Test Without Child','name in chinese ','','/uploads/images/1380881919554.JPG',99,88,'2013-10-01',77,77,99,9,6,1000037,3,91,10001,'2013-10-28',1,8,1,123,134,5),(1000034,'Sport2 ','Sport 2 ','name in chinese ','','/uploads/images/1380882036737.JPG',99,88,'2013-10-30',77,77,99,9,5,1000038,3,91,10001,'2013-10-31',1,8,0,0,0,5),(1000035,'Sport3','Sport Test 4','name in chinese ','','/uploads/images/1380882216433.JPG',99,88,'2013-10-01',77,66,77,9,8,1000039,3,91,10001,'2013-10-18',1,8,1,9,10,5),(1000036,'dessd','new one','name in chinese ','','/uploads/images/1380905574863.jpg',1233,123,'2013-10-23',111,11,111,1111,111,1000040,1,33,1,'2013-10-16',1,8,0,0,0,1),(1000037,'22d','测试一下单品','测试哦哦哦哦','','/uploads/images/1380906985615.jpg',123,123,'2013-10-10',123,123,123,123,123,1000041,1,38,1,'2013-10-22',1,8,0,0,0,1),(1000038,'','测试不带各种价格','测试一下不带各种价格','','/uploads/images/1380908806420.jpg',300,0,NULL,0,0,0,400,12,1000042,1,55,1,NULL,1,8,0,0,0,1),(1000039,'New Apparel Child','New Apparel Parent Test1','新服装产品测试','\"color\":\"Blue\",\"size\":\"L\"','/uploads/images/1380930399839.JPG',99,88,NULL,77,77,99,10,1,1000043,3,22,10001,NULL,1,8,0,0,0,5),(1000040,'Apparel Child 2','New Apparel Parent Test1','新服装产品测试','\"color\":\"Blue\",\"size\":\"S\"','/uploads/images/1380930448014.JPG',99,88,NULL,77,77,99,10,1,1000043,3,22,10001,NULL,1,8,0,0,0,5),(1000041,'New Apparel Child3','New Apparel Parent Test1','新服装产品测试','\"color\":\"Red\",\"size\":\"S\"','/uploads/images/1380930491355.JPG',99,88,NULL,77,77,99,10,1,1000043,3,22,10001,NULL,1,8,0,0,0,5),(1000042,'Wellness 1','Wellness Test1','幸福测试1','','/uploads/images/1380933906060.JPG',99,88,'2013-10-04',77,77,99,80,5,1000044,3,120,10001,'2013-10-31',1,8,0,0,0,5),(1000043,'AA1','Apparel Apparel Test1','服装服装测试1','\"color\":\"Red\",\"size\":\"S\"','/uploads/images/1382166188708.JPG',99,88,NULL,77,80,99,99,9,1000045,3,22,10001,NULL,1,8,0,0,0,5),(1000044,'AA2','Apparel Apparel Test1','服装服装测试1','\"color\":\"Red\",\"size\":\"Medium\"','/uploads/images/1382166262340.JPG',99,88,NULL,77,80,99,99,9,1000045,3,22,10001,NULL,1,8,0,0,0,5),(1000045,'AA3','Apparel Apparel Test1','服装服装测试1','\"color\":\"Blue\",\"size\":\"Large\"','/uploads/images/1382166307219.JPG',99,88,NULL,77,80,99,99,9,1000045,3,22,10001,NULL,1,8,0,0,0,5),(1000046,'AA4','Apparel Apparel Test1','服装服装测试1','\"color\":\"Green\",\"size\":\"XXL\"','/uploads/images/1382166421340.JPG',99,88,NULL,77,80,99,99,9,1000045,3,22,10001,NULL,1,8,0,0,0,5),(1000047,'AA6','Apparel Apparel Test1','服装服装测试1','\"color\":\"Purple\",\"size\":\"S\"','/uploads/images/1382166530010.JPG',99,88,NULL,77,80,99,99,9,1000045,3,22,10001,NULL,1,8,0,0,0,5),(1000048,'AA7','Apparel Apparel Test1','服装服装测试1','\"color\":\"Purple\",\"size\":\"M\"','/uploads/images/1382166683257.JPG',99,88,NULL,77,80,99,99,9,1000045,3,22,10001,NULL,1,8,0,0,0,5),(1000049,'AA7','Apparel Apparel Test1','服装服装测试1','\"color\":\"Purple\",\"size\":\"L\"','/uploads/images/1382166768052.JPG',99,88,NULL,77,80,99,99,9,1000045,3,22,10001,NULL,1,8,0,0,0,5),(1000050,'AA8','Apparel Apparel Test1','服装服装测试1','\"color\":\"Purple\",\"size\":\"XXL\"','/uploads/images/1382166875980.JPG',99,88,NULL,77,80,99,99,9,1000045,3,22,10001,NULL,1,8,0,0,0,5),(1000051,'AA9','Apparel Apparel Test1','服装服装测试1','\"color\":\"Yellow\",\"size\":\"S\"','/uploads/images/1382166994406.JPG',99,88,NULL,77,80,99,99,9,1000045,3,22,10001,NULL,1,8,0,0,0,5),(1000052,'Sellertest1','Instrument','乐器SellerTest1','','/uploads/images/1382342502047.JPG',99,88,'2013-10-22',77,77,100,55,5,1000047,1,136,10002,'2013-10-25',1,8,1,13,10,5),(1000053,'ABC123','Man Seller Test2','男子服装测试2','','/uploads/images/1382343221624.JPG',99,88,'2013-10-21',77,50,100,99,10,1000048,3,24,10001,'2013-10-22',1,8,1,12,10,5),(1000054,'ABC','Wine Wine1 提供国际运费Seller','酒酒卖家（提供国际运费）','','/uploads/images/1382346562702.JPG',99,88,'2013-10-21',77,77,100,100,10,1000049,1,105,1,'2013-10-22',1,8,1,12,10,1),(1000055,'Home Child1','Home Parent 1668 Global Shipping','家居父商品1668国际运输','\"color\":\"Red\",\"size\":\"12\"','/uploads/images/1382413841632.JPG',99,88,'2013-10-22',77,77,100,50,20,1000050,3,160,10001,'2013-10-30',1,8,0,0,0,5),(1000056,'Home Child2','Home Parent 1668 Global Shipping','家居父商品1668国际运输','\"color\":\"Blue\",\"size\":\"13\"','/uploads/images/1382413873214.JPG',99,88,'2013-10-23',77,77,100,50,20,1000050,3,160,10001,'2013-10-28',1,8,0,0,0,5),(1000057,'Home Child 3','Home Parent 1668 Global Shipping','家居父商品1668国际运输','\"color\":\"Yellow\",\"size\":\"12\"','/uploads/images/1382413917572.JPG',90,50,'2013-10-21',77,77,100,40,20,1000050,3,160,10001,'2013-10-21',1,8,0,0,0,5),(1000058,'','鞋子','1阿迪达斯222','','/uploads/images/1382460235566.jpg',500,300,'2013-10-24',0,0,0,300,10,1000051,1,32,1,'2013-10-31',1,8,0,0,0,1),(1000059,'','xiezi',NULL,'','/uploads/images/1382547875721.jpg',133,0,NULL,0,0,0,1234,1234,1000052,1,54,1,NULL,1,8,0,0,0,1);
/*!40000 ALTER TABLE `item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `message`
--

DROP TABLE IF EXISTS `message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `message` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(45) NOT NULL,
  `content` text NOT NULL,
  `userType` varchar(45) NOT NULL,
  `userId` int(11) NOT NULL,
  `createAt` date NOT NULL,
  `responseId` int(11) DEFAULT NULL,
  `finishAt` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `message`
--

LOCK TABLES `message` WRITE;
/*!40000 ALTER TABLE `message` DISABLE KEYS */;
INSERT INTO `message` VALUES (1,'1','2','seller',0,'2013-07-24',8,'2013-07-30'),(2,'1','23','customer',1,'2013-07-24',NULL,NULL),(3,'阿道夫1','123123','customer',8,'2013-07-29',NULL,NULL),(4,'123','123122','seller',1,'2013-07-29',7,'2013-07-30'),(5,'asdfasdf','asdfasdfsdaf\r\nasd\r\nf\r\nasdf\r\nas\r\ndf\r\n','admin',1,'2013-07-30',NULL,NULL),(6,'asdfa','asdd','admin',1,'2013-07-30',NULL,NULL),(7,'asdfa','asdf','admin',1,'2013-07-30',NULL,NULL),(8,'asdf','asdfasf','admin',1,'2013-07-30',NULL,NULL);
/*!40000 ALTER TABLE `message` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notice`
--

DROP TABLE IF EXISTS `notice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `notice` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` text,
  `userType` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notice`
--

LOCK TABLES `notice` WRITE;
/*!40000 ALTER TABLE `notice` DISABLE KEYS */;
INSERT INTO `notice` VALUES (1,'<h2>\r\n	Welcome to use tdg seller platform\r\n</h2>\r\n<p>\r\n	1. test\r\n</p>','seller'),(2,'<img src=\"http://api.map.baidu.com/staticimage?center=121.43001%2C31.120649&zoom=11&width=558&height=360&markers=121.43001%2C31.120649&markerStyles=l%2CA\" alt=\"\" />','admin'),(3,'<img src=\"http://api.map.baidu.com/staticimage?center=121.22764%2C31.253117&zoom=11&width=558&height=360&markers=121.22764%2C31.253117&markerStyles=l%2CA\" alt=\"\" />','customer'),(4,'<img src=\"http://api.map.baidu.com/staticimage?center=121.373669%2C31.612007&zoom=11&width=558&height=360&markers=121.373669%2C31.612007&markerStyles=l%2CA\" alt=\"\" />','translator');
/*!40000 ALTER TABLE `notice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orderItem`
--

DROP TABLE IF EXISTS `orderItem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orderItem` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `itemId` int(11) DEFAULT NULL,
  `productId` bigint(20) DEFAULT NULL,
  `name` varchar(500) DEFAULT NULL,
  `coinage` int(11) DEFAULT NULL,
  `sellerId` int(11) DEFAULT NULL,
  `num` int(11) DEFAULT NULL,
  `price` float DEFAULT NULL,
  `orderId` bigint(20) DEFAULT NULL,
  `internationalShippingService` int(11) DEFAULT NULL,
  `internationalShippingFee` double DEFAULT NULL,
  `internationalPromiseDays` int(11) DEFAULT NULL,
  `countryCode` int(11) DEFAULT NULL,
  `sku` varchar(200) DEFAULT NULL,
  `priceRMB` float DEFAULT NULL,
  `ifeeRMB` float DEFAULT NULL,
  `nameInChinese` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=77 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orderItem`
--

LOCK TABLES `orderItem` WRITE;
/*!40000 ALTER TABLE `orderItem` DISABLE KEYS */;
INSERT INTO `orderItem` VALUES (42,1000021,1000029,'puercha',1,1,2,190,27,1,18,5,1,'9001',1235,117,'name in chinese 1'),(43,1000022,1000030,'adidass',2,10000,4,800,28,0,0,0,3,'de',7600,0,'name in chinese 1'),(44,1000022,1000030,'adidass',2,10000,4,800,29,0,0,0,3,'de',7600,0,'name in chinese 1'),(45,1000023,1000031,'尺子',1,1,1,500,30,0,0,0,1,'iidde',3250,0,'name in chinese 1'),(46,1000032,1000036,'Jewelry Test Without Child',3,10001,3,88,31,0,0,0,5,'Jewelry 1',748,0,'name in chinese 1'),(47,1000032,1000036,'Jewelry Test Without Child',3,10001,3,88,32,0,0,0,5,'Jewelry 1',748,0,'name in chinese 1'),(48,1000035,1000039,'Sport Test 4',3,10001,1,88,33,1,9,10,5,'Sport3',748,76.5,'name in chinese 1'),(49,1000033,1000037,'Sports Test Without Child',3,10001,1,88,33,1,123,134,5,'Sport1',748,1045.5,'name in chinese 1'),(50,1000034,1000038,'Sport 2 ',3,10001,1,99,34,0,0,0,5,'Sport2 ',841.5,0,'name in chinese 1'),(51,1000023,1000031,'尺子',1,1,5,400,35,0,0,0,1,'iidde',2600,0,'name in chinese 1'),(52,1000023,1000031,'尺子',1,1,5,400,36,0,0,0,1,'iidde',2600,0,'name in chinese 1'),(53,1000038,1000042,'测试不带各种价格',1,1,41,300,37,0,0,0,1,'',1950,0,'测试一下不带各种价格'),(54,1000041,1000043,'New Apparel Parent Test1',3,10001,1,99,38,0,0,0,0,'New Apparel Child3',841.5,0,'新服装产品测试'),(55,1000039,1000043,'New Apparel Parent Test1',3,10001,2,99,39,0,0,0,0,'New Apparel Child',841.5,0,'新服装产品测试'),(56,1000041,1000043,'New Apparel Parent Test1',3,10001,2,99,39,0,0,0,0,'New Apparel Child3',841.5,0,'新服装产品测试'),(57,1000040,1000043,'New Apparel Parent Test1',3,10001,1,99,39,0,0,0,0,'Apparel Child 2',841.5,0,'新服装产品测试'),(58,1000039,1000043,'New Apparel Parent Test1',3,10001,1,99,40,0,0,0,0,'New Apparel Child',841.5,0,'新服装产品测试'),(59,1000039,1000043,'New Apparel Parent Test1',3,10001,1,99,41,0,0,0,0,'New Apparel Child',841.5,0,'新服装产品测试'),(60,1000039,1000043,'New Apparel Parent Test1',3,10001,1,99,42,0,0,0,0,'New Apparel Child',841.5,0,'新服装产品测试'),(61,1000042,1000044,'Wellness Test1',3,10001,1,88,43,0,0,0,5,'Wellness 1',748,0,'幸福测试1'),(62,1000043,1000045,'Apparel Apparel Test1',3,10001,300,99,44,0,0,0,0,'AA1',841.5,0,'服装服装测试1'),(63,1000043,1000045,'Apparel Apparel Test1',3,10001,300,99,45,0,0,0,0,'AA1',841.5,0,'服装服装测试1'),(64,1000052,1000047,'Instrument',1,10002,200,99,46,1,13,10,5,'Sellertest1',643.5,84.5,'乐器SellerTest1'),(65,1000053,1000048,'Man Seller Test2',3,10001,62,77,46,1,12,10,5,'ABC123',654.5,102,'男子服装测试2'),(66,1000053,1000048,'Man Seller Test2',3,10001,62,77,47,1,12,10,5,'ABC123',654.5,102,'男子服装测试2'),(67,1000052,1000047,'Instrument',1,10002,200,99,48,1,13,10,5,'Sellertest1',643.5,84.5,'乐器SellerTest1'),(68,1000052,1000047,'Instrument',1,10002,200,99,49,1,13,10,5,'Sellertest1',643.5,84.5,'乐器SellerTest1'),(69,1000053,1000048,'Man Seller Test2',3,10001,62,77,49,1,12,10,5,'ABC123',654.5,102,'男子服装测试2'),(70,1000053,1000048,'Man Seller Test2',3,10001,62,77,50,1,12,10,5,'ABC123',654.5,102,'男子服装测试2'),(71,1000052,1000047,'Instrument',1,10002,200,99,51,1,13,10,5,'Sellertest1',643.5,84.5,'乐器SellerTest1'),(72,1000054,1000049,'Wine Wine1 提供国际运费Seller',1,1,1,88,52,1,12,10,1,'ABC',572,78,'酒酒卖家（提供国际运费）'),(73,1000052,1000047,'Instrument',1,10002,201,99,53,1,13,10,5,'Sellertest1',643.5,84.5,'乐器SellerTest1'),(74,1000054,1000049,'Wine Wine1 提供国际运费Seller',1,1,1,88,54,1,12,10,1,'ABC',572,78,'酒酒卖家（提供国际运费）'),(75,1000053,1000048,'Man Seller Test2',3,10001,63,77,55,1,12,10,5,'ABC123',654.5,102,'男子服装测试2'),(76,1000055,1000050,'Home Parent 1668 Global Shipping',3,10001,1,88,56,0,0,0,5,'Home Child1',748,0,'家居父商品1668国际运输');
/*!40000 ALTER TABLE `orderItem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orderRecord`
--

DROP TABLE IF EXISTS `orderRecord`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orderRecord` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `orderId` bigint(20) DEFAULT NULL,
  `username` varchar(45) DEFAULT NULL,
  `userId` int(11) DEFAULT NULL,
  `comment` varchar(500) DEFAULT NULL,
  `commentInEnglish` varchar(500) DEFAULT NULL,
  `createAt` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=95 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orderRecord`
--

LOCK TABLES `orderRecord` WRITE;
/*!40000 ALTER TABLE `orderRecord` DISABLE KEYS */;
INSERT INTO `orderRecord` VALUES (34,27,'chenjie',8,'用户提交订单，等待支付','Customer submited the order, waiting for pay money','2013-10-02'),(35,28,'chenjie',8,'用户提交订单，等待支付','Customer submited the order, waiting for pay money','2013-10-02'),(36,29,'chenjie',8,'用户提交订单，等待支付','Customer submited the order, waiting for pay money','2013-10-02'),(37,29,'chenjie',8,'用户已经支付，等待系统确认','Customer pay the order, waiting for repsonse','2013-10-02'),(38,28,'chenjie',8,'用户已经支付，等待系统确认','Customer pay the order, waiting for repsonse','2013-10-04'),(39,27,'chenjie',8,'用户已经支付，等待系统确认','Customer pay the order, waiting for repsonse','2013-10-04'),(40,27,'123',1,'卖家已发货，等待用户查收','Seller has send, waiting for receive','2013-10-04'),(41,27,'chenjie',8,'买家已收货','Customer has received','2013-10-04'),(42,28,'chenjie',8,'用户投诉该订单','Customer complain this order','2013-10-04'),(43,30,'陈杰',8,'用户提交订单，等待支付','Customer submited the order, waiting for pay money','2013-10-04'),(44,30,'陈杰',8,'用户已经支付，等待系统确认','Customer pay the order, waiting for repsonse','2013-10-04'),(45,31,'Ruby',0,'用户提交订单，等待支付','Customer submited the order, waiting for pay money','2013-10-04'),(46,32,'aaa',10000,'用户提交订单，等待支付','Customer submited the order, waiting for pay money','2013-10-04'),(47,33,'aaa',10000,'用户提交订单，等待支付','Customer submited the order, waiting for pay money','2013-10-04'),(48,32,'aaa',10000,'用户已经支付，等待系统确认','Customer pay the order, waiting for repsonse','2013-10-04'),(49,32,'aaa',10000,'用户已经支付，等待系统确认','Customer pay the order, waiting for repsonse','2013-10-04'),(50,32,'1668275786',10001,'卖家已发货，等待用户查收','Seller has send, waiting for receive','2013-10-04'),(51,34,'aaa',10000,'用户提交订单，等待支付','Customer submited the order, waiting for pay money','2013-10-04'),(52,32,'aaa',10000,'用户投诉该订单','Customer complain this order','2013-10-04'),(53,32,'aaa',10000,'用户投诉该订单','Customer complain this order','2013-10-04'),(54,30,'陈杰',8,'用户投诉该订单','Customer complain this order','2013-10-05'),(55,29,'chenjie',8,'用户投诉该订单','Customer complain this order','2013-10-05'),(56,35,'陈杰',8,'用户提交订单，等待支付','Customer submited the order, waiting for pay money','2013-10-05'),(57,36,'1',8,'用户提交订单，等待支付','Customer submited the order, waiting for pay money','2013-10-05'),(58,37,'chenjie',8,'用户提交订单，等待支付','Customer submited the order, waiting for pay money','2013-10-05'),(59,38,'CCC',10000,'用户提交订单，等待支付','Customer submited the order, waiting for pay money','2013-10-05'),(60,39,'CCC',10000,'用户提交订单，等待支付','Customer submited the order, waiting for pay money','2013-10-05'),(61,40,'CCC',10000,'用户提交订单，等待支付','Customer submited the order, waiting for pay money','2013-10-05'),(62,41,'CCC',10000,'用户提交订单，等待支付','Customer submited the order, waiting for pay money','2013-10-05'),(63,41,'CCC',10000,'用户已经支付，等待系统确认','Customer pay the order, waiting for repsonse','2013-10-05'),(64,41,'CCC',10000,'用户投诉该订单','Customer complain this order','2013-10-05'),(65,41,'CCC',10000,'用户投诉该订单','Customer complain this order','2013-10-05'),(66,42,'aaa',10000,'用户提交订单，等待支付','Customer submited the order, waiting for pay money','2013-10-05'),(67,42,'aaa',10000,'用户已经支付，等待系统确认','Customer pay the order, waiting for repsonse','2013-10-05'),(68,42,'1668275786',10001,'卖家已发货，等待用户查收','Seller has send, waiting for receive','2013-10-05'),(69,43,'aaa',10000,'用户提交订单，等待支付','Customer submited the order, waiting for pay money','2013-10-05'),(70,44,'CCC',10000,'用户提交订单，等待支付','Customer submited the order, waiting for pay money','2013-10-21'),(71,44,'CCC',10000,'用户已经支付，等待系统确认','Customer pay the order, waiting for repsonse','2013-10-21'),(72,45,'CCC',10000,'用户提交订单，等待支付','Customer submited the order, waiting for pay money','2013-10-21'),(73,45,'CCC',10000,'用户已经支付，等待系统确认','Customer pay the order, waiting for repsonse','2013-10-21'),(74,46,'CCC',10000,'用户提交订单，等待支付','Customer submited the order, waiting for pay money','2013-10-21'),(75,47,'CCC',10000,'用户提交订单，等待支付','Customer submited the order, waiting for pay money','2013-10-21'),(76,48,'CCC',10000,'用户提交订单，等待支付','Customer submited the order, waiting for pay money','2013-10-21'),(77,46,'Server',0,'订单被切分','Order has been splited','2013-10-21'),(78,49,'CCC',10000,'用户提交订单，等待支付','Customer submited the order, waiting for pay money','2013-10-21'),(79,50,'CCC',10000,'用户提交订单，等待支付','Customer submited the order, waiting for pay money','2013-10-21'),(80,51,'CCC',10000,'用户提交订单，等待支付','Customer submited the order, waiting for pay money','2013-10-21'),(81,49,'Server',0,'订单被切分','Order has been splited','2013-10-21'),(82,51,'CCC',10000,'用户已经支付，等待系统确认','Customer pay the order, waiting for repsonse','2013-10-21'),(83,50,'CCC',10000,'用户已经支付，等待系统确认','Customer pay the order, waiting for repsonse','2013-10-21'),(84,52,'CCC',10000,'用户提交订单，等待支付','Customer submited the order, waiting for pay money','2013-10-21'),(85,53,'CCC',10000,'用户提交订单，等待支付','Customer submited the order, waiting for pay money','2013-10-21'),(86,53,'CCC',10000,'用户已经支付，等待系统确认','Customer pay the order, waiting for repsonse','2013-10-21'),(87,52,'CCC',10000,'用户已经支付，等待系统确认','Customer pay the order, waiting for repsonse','2013-10-21'),(88,54,'CCC',10000,'用户提交订单，等待支付','Customer submited the order, waiting for pay money','2013-10-21'),(89,55,'CCC',10000,'用户提交订单，等待支付','Customer submited the order, waiting for pay money','2013-10-21'),(90,55,'CCC',10000,'用户已经支付，等待系统确认','Customer pay the order, waiting for repsonse','2013-10-21'),(91,37,'chenjie',8,'用户已经支付，等待系统确认','Customer pay the order, waiting for repsonse','2013-10-24'),(92,37,'chenjie',8,'用户投诉该订单','Customer complain this order','2013-10-24'),(93,36,'1',8,'用户已经支付，等待系统确认','Customer pay the order, waiting for repsonse','2013-10-24'),(94,56,'1',8,'用户提交订单，等待支付','Customer submited the order, waiting for pay money','2013-10-25');
/*!40000 ALTER TABLE `orderRecord` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orders` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `orderPrice` float DEFAULT NULL,
  `transferPrice` float DEFAULT NULL,
  `price` float DEFAULT NULL,
  `createAt` date DEFAULT NULL,
  `comment` text,
  `name` varchar(500) DEFAULT NULL,
  `address` varchar(500) DEFAULT NULL,
  `city` varchar(500) DEFAULT NULL,
  `country` varchar(500) DEFAULT NULL,
  `postCode` varchar(500) DEFAULT NULL,
  `customerId` int(11) NOT NULL,
  `sellerId` int(11) NOT NULL,
  `sellerName` varchar(500) DEFAULT NULL,
  `parentId` bigint(20) NOT NULL,
  `productId` mediumtext,
  `orderStatus` int(11) NOT NULL,
  `sendAt` date DEFAULT NULL,
  `carrier` varchar(200) DEFAULT NULL,
  `trackingWeb` varchar(200) DEFAULT NULL,
  `trackingId` varchar(200) DEFAULT NULL,
  `orderPriceRMB` float DEFAULT NULL,
  `transferPriceRMB` float DEFAULT NULL,
  `priceRMB` float DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (27,380,18,398,'2013-10-02',NULL,'chenjie','shuianzhongjie','beijing','USA','100091',8,1,'123',0,NULL,4,'2013-10-24','ddd','eere','123123',2470,117,2587),(28,3200,0,3200,'2013-10-02',NULL,'chenjie','shuianzhongjie','beijing','USA','100091',8,10000,'123',0,NULL,10,NULL,NULL,NULL,NULL,30400,0,30400),(29,3200,0,3200,'2013-10-02',NULL,'chenjie','shuianzhongjie','beijing','USA','100091',8,10000,'123',0,NULL,10,NULL,NULL,NULL,NULL,30400,0,30400),(30,500,0,500,'2013-10-04',NULL,'陈杰','北京理工大学计算中心','北京','中国','100081',8,1,'123',0,NULL,10,NULL,NULL,NULL,NULL,3250,0,3250),(31,264,0,264,'2013-10-04',NULL,'Ruby','123','London','England','5100',0,10001,'1668275786',0,NULL,1,NULL,NULL,NULL,NULL,2244,0,2244),(32,264,0,264,'2013-10-04',NULL,'aaa','CCC','BBB','Canada','1005',10000,10001,'1668275786',0,NULL,10,'2013-10-23','hhh','www.DHL.com','xxxx123',2244,0,2244),(33,176,132,308,'2013-10-04',NULL,'aaa','CCC','BBB','Canada','1005',10000,10001,'1668275786',0,NULL,1,NULL,NULL,NULL,NULL,1496,1122,2618),(34,99,0,99,'2013-10-04',NULL,'aaa','CCC','BBB','Canada','1005',10000,10001,'1668275786',0,NULL,1,NULL,NULL,NULL,NULL,841.5,0,841.5),(35,2000,0,2000,'2013-10-05',NULL,'陈杰','北京理工大学计算中心','北京','中国','100081',8,1,'123',0,NULL,1,NULL,NULL,NULL,NULL,13000,0,13000),(36,2000,0,2000,'2013-10-05',NULL,'1','1','123','China','1',8,1,'123',0,NULL,2,NULL,NULL,NULL,NULL,13000,0,13000),(37,12300,0,12300,'2013-10-05',NULL,'chenjie','shuianzhongjie','beijing','USA','100091',8,1,'123',0,NULL,10,NULL,NULL,NULL,NULL,79950,0,79950),(38,99,0,99,'2013-10-05',NULL,'CCC','BBB','AAA','China','1005',10000,10001,'1668275786',0,NULL,1,NULL,NULL,NULL,NULL,841.5,0,841.5),(39,495,0,495,'2013-10-05',NULL,'CCC','BBB','AAA','China','1005',10000,10001,'1668275786',0,NULL,1,NULL,NULL,NULL,NULL,4207.5,0,4207.5),(40,99,0,99,'2013-10-05',NULL,'CCC','BBB','AAA','China','1005',10000,10001,'1668275786',0,NULL,1,NULL,NULL,NULL,NULL,841.5,0,841.5),(41,99,0,99,'2013-10-05',NULL,'CCC','BBB','AAA','China','1005',10000,10001,'1668275786',0,NULL,10,NULL,NULL,NULL,NULL,841.5,0,841.5),(42,99,0,99,'2013-10-05',NULL,'aaa','CCC','BBB','Canada','1005',10000,10001,'1668275786',0,NULL,3,'2013-10-04','DHL ','www.dhl.com','123456',841.5,0,841.5),(43,88,0,88,'2013-10-05',NULL,'aaa','CCC','BBB','Canada','1005',10000,10001,'1668275786',0,NULL,1,NULL,NULL,NULL,NULL,748,0,748),(44,29700,0,29700,'2013-10-21',NULL,'CCC','BBB','AAA','China','1005',10000,10001,'1668275786',0,NULL,2,NULL,NULL,NULL,NULL,252450,0,252450),(45,29700,0,29700,'2013-10-21',NULL,'CCC','BBB','AAA','China','1005',10000,10001,'1668275786',0,NULL,2,NULL,NULL,NULL,NULL,252450,0,252450),(46,24574,25,24599,'2013-10-21',NULL,'CCC','BBB','AAA','China','1005',10000,0,NULL,0,NULL,5,NULL,NULL,NULL,NULL,169279,186.5,169466),(47,4774,12,4786,NULL,NULL,'CCC','BBB','AAA','China','1005',10000,10001,'1668275786',46,NULL,1,NULL,NULL,NULL,NULL,40579,102,40681),(48,19800,13,19813,NULL,NULL,'CCC','BBB','AAA','China','1005',10000,10002,'',46,NULL,1,NULL,NULL,NULL,NULL,128700,84.5,128784),(49,24574,25,24599,'2013-10-21',NULL,'CCC','BBB','AAA','China','1005',10000,0,NULL,0,NULL,5,NULL,NULL,NULL,NULL,169279,186.5,169466),(50,4774,12,4786,NULL,NULL,'CCC','BBB','AAA','China','1005',10000,10001,'1668275786',49,NULL,2,NULL,NULL,NULL,NULL,40579,102,40681),(51,19800,13,19813,NULL,NULL,'CCC','BBB','AAA','China','1005',10000,10002,'',49,NULL,2,NULL,NULL,NULL,NULL,128700,84.5,128784),(52,88,12,100,'2013-10-21',NULL,'CCC','BBB','AAA','China','1005',10000,1,'123',0,NULL,2,NULL,NULL,NULL,NULL,572,78,650),(53,19899,13,19912,'2013-10-21',NULL,'CCC','BBB','AAA','China','1005',10000,10002,'',0,NULL,2,NULL,NULL,NULL,NULL,129344,84.5,129428),(54,88,12,100,'2013-10-21',NULL,'CCC','BBB','AAA','China','1005',10000,1,'123',0,NULL,1,NULL,NULL,NULL,NULL,572,78,650),(55,4851,12,4863,'2013-10-21',NULL,'CCC','BBB','AAA','China','1005',10000,10001,'1668275786',0,NULL,2,NULL,NULL,NULL,NULL,41233.5,102,41335.5),(56,88,0,88,'2013-10-25',NULL,'1','1','123','China','1',8,10001,'1668275786',0,NULL,1,NULL,NULL,NULL,NULL,748,0,748);
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `passwordkey`
--

DROP TABLE IF EXISTS `passwordkey`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `passwordkey` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userType` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  `secret` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `passwordkey`
--

LOCK TABLES `passwordkey` WRITE;
/*!40000 ALTER TABLE `passwordkey` DISABLE KEYS */;
INSERT INTO `passwordkey` VALUES (1,'seller','sonyfe25cp@gmail.com','MgTtYe');
/*!40000 ALTER TABLE `passwordkey` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `nameinchinese` varchar(45) DEFAULT NULL,
  `description` text,
  `descriptioninchinese` text,
  `status` int(11) DEFAULT '1',
  `internationalShippingService` int(11) DEFAULT '0',
  `internationalShippingFee` float DEFAULT '0',
  `internationalPromiseDays` int(11) DEFAULT '7',
  `retailPrice` float DEFAULT NULL,
  `promotionPrice` float DEFAULT NULL,
  `promotionTime` date DEFAULT NULL,
  `promotionEnd` date DEFAULT NULL,
  `wholePrice` float DEFAULT NULL,
  `minimumQuantity` int(11) DEFAULT NULL,
  `maximumAcceptQuantity` int(11) DEFAULT NULL,
  `availableQuantity` int(11) DEFAULT NULL,
  `safeStock` int(11) DEFAULT NULL,
  `active` int(11) DEFAULT '1',
  `netWeight` float DEFAULT NULL,
  `grossWeight` float DEFAULT NULL,
  `sizeWithPackage` varchar(45) DEFAULT NULL,
  `mainImage` varchar(200) DEFAULT NULL,
  `subImages` text,
  `basicParams` varchar(500) DEFAULT NULL,
  `hasChildren` int(11) DEFAULT NULL,
  `brandId` int(11) DEFAULT NULL,
  `sellerId` int(11) DEFAULT NULL,
  `productTypeId` int(11) DEFAULT NULL,
  `categoryId` int(11) DEFAULT NULL,
  `coinage` int(11) DEFAULT NULL,
  `countryCode` int(11) DEFAULT NULL,
  `sellable` int(11) DEFAULT NULL,
  `productLine` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1000054 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (1000029,'puercha','普洱茶','puercha is cool !!!','普洱茶很棒哦········',5,1,18,5,200,190,'2013-10-02','2013-10-09',150,20,100,1400,300,1,2,3,'21*23*22','/uploads/images/1380612276673.jpg','/uploads/images/1380612280487.jpg;',NULL,0,7,1,53,41,1,1,6,18),(1000030,'adidass','阿迪的大叔','deadfdasdddd','地方等等等',5,0,0,0,1000,800,'2013-10-02','2013-10-08',850,50,100,10000,200,1,23,122,'31*23*12','/uploads/images/1380639761752.jpg','/uploads/images/1380639767025.jpg;/uploads/images/1380639767078.jpg;/uploads/images/1380639767105.jpg;',NULL,0,6,10000,31,23,2,3,6,16),(1000031,'尺子','卷尺一枚','dddddddddd','卷尺很好用的哦',5,0,0,0,500,400,'2013-10-05','2013-10-31',200,100,500,10000,200,1,2,3,'1*1*2','/uploads/images/1380822966613.jpg','/uploads/images/1380822969781.jpg;',NULL,0,7,1,30,23,1,1,6,16),(1000032,'Jewelry Test 1','珠宝商品测试1 ','<p>\n	GGGGGGGGGGGGGGGGGGGG\n</p>\n<p>\n	<img src=\"/uploads/images/1380878937504.JPG\" alt=\"\" />\n</p>','<p>\r\n	及笄际己3集技既及<span style=\"line-height:1.5;\"></span>\r\n</p>',5,0,0,0,99,88,'2013-10-01','2013-10-31',77,99,99,9,1,1,1,2,'1*2*3','/uploads/images/1380878827395.JPG','/uploads/images/1380878829206.JPG;/uploads/images/1380878836351.JPG;/uploads/images/1380878838876.JPG;',NULL,1,8,10001,168,168,3,5,6,129),(1000033,'Apparel Test 1',NULL,'<p>\n	CCCCCCCCCCCCCC\n</p>\n<p>\n	<img src=\"/uploads/images/1380879766858.JPG\" alt=\"\" />\n</p>',NULL,1,0,0,0,99,88,'2013-10-02','2013-10-30',77,77,99,9,8,1,1,2,'1*2*3','/uploads/images/1380879656082.JPG','/uploads/images/1380879665809.JPG;/uploads/images/1380879679944.JPG;',NULL,0,8,10001,22,17,3,5,NULL,16),(1000034,'Apparel Test 1','服装测试1 ','<p>\n	CCCCCCCCCCCCCC\n</p>\n<p>\n	<img src=\"/uploads/images/1380879766858.JPG\" alt=\"\" />\n</p>','<p>\r\n	次次此赐茨辞瓷慈\r\n</p>\r\n<p>\r\n	<img src=\"/uploads/images/1380880284852.JPG\" alt=\"\" />\r\n</p>',5,0,0,0,99,88,'2013-10-02','2013-10-30',77,77,99,9,8,1,1,2,'1*2*3','/uploads/images/1380879656082.JPG','/uploads/images/1380879665809.JPG;/uploads/images/1380879679944.JPG;',NULL,0,8,10001,22,17,3,5,6,16),(1000035,'Shoe Test 1','鞋子测试1','12233333333555555555<img src=\"/uploads/images/1380880664283.JPG\" alt=\"\" />','<p>\r\n	一号一号以阿浩1一哟阿[[\r\n</p>\r\n<p>\r\n	<img src=\"http://tdg.omartech.com/uploads/images/1380880664283.JPG\" />\r\n</p>',5,0,0,0,99,88,'2013-10-08','2013-10-24',77,99,99,100,1,1,1,2,'1*2*3','/uploads/images/1380880575412.JPG','/uploads/images/1380880581267.JPG;/uploads/images/1380880591865.JPG;',NULL,1,8,10001,30,23,3,5,6,16),(1000036,'Jewelry Test Without Child','珠宝无子商品测试','<p>\n	GOOOOOOOOOOOOOOOO\n</p>\n<p>\n	<img src=\"/uploads/images/1380881200310.JPG\" alt=\"\" />\n</p>','<p>\r\n	个个个哥哥、咯咯\r\n</p>\r\n<p>\r\n	<img src=\"http://tdg.omartech.com/uploads/images/1380881200310.JPG\" />\r\n</p>',5,0,0,0,99,88,'2013-10-01','2013-10-22',77,77,99,9,1,1,1,2,'1*2*3','/uploads/images/1380881120625.JPG','/uploads/images/1380881126826.JPG;/uploads/images/1380881132848.JPG;',NULL,0,8,10001,168,168,3,5,6,129),(1000037,'Sports Test Without Child','运动测试1 ','<p>\n	BBBBBBBB\n</p>\n<p>\n	<img src=\"/uploads/images/1380882017005.JPG\" alt=\"\" />\n</p>','<p>\r\n	BBBBB\r\n</p>\r\n<p>\r\n	<img src=\"http://tdg.omartech.com/uploads/images/1380882017005.JPG\" />\r\n</p>',5,1,123,134,99,88,'2013-10-01','2013-10-28',77,77,99,9,6,1,1,2,'1*2*3','/uploads/images/1380881919554.JPG','/uploads/images/1380881924757.JPG;/uploads/images/1380881932584.JPG;',NULL,0,8,10001,91,91,3,5,6,87),(1000038,'Sport 2 ','运动测试2','<img src=\"/uploads/images/1380882137215.JPG\" alt=\"\" />','<img src=\"http://tdg.omartech.com/uploads/images/1380882137215.JPG\" />',5,0,0,0,99,88,'2013-10-30','2013-10-31',77,77,99,9,5,1,1,2,'1*2*3','/uploads/images/1380882036737.JPG','/uploads/images/1380882049670.JPG;',NULL,0,8,10001,91,91,3,5,6,87),(1000039,'Sport Test 4','运动测试4','<p>\n	SPort3sport3sport3\n</p>\n<p>\n	<img src=\"/uploads/images/1380882309325.JPG\" alt=\"\" />\n</p>','<p>\r\n	运动3&nbsp;\r\n</p>\r\n<p>\r\n	<img src=\"http://tdg.omartech.com/uploads/images/1380882309325.JPG\" />\r\n</p>',5,1,9,10,99,88,'2013-10-01','2013-10-18',77,66,77,9,8,1,1,2,'1*2*3','/uploads/images/1380882216433.JPG','/uploads/images/1380882172453.JPG;/uploads/images/1380882180625.JPG;',NULL,0,8,10001,91,91,3,5,6,87),(1000040,'new one','新的','ddd','<p>\r\n	112313\r\n</p>\r\n<p>\r\n	呢我\r\n</p>',5,0,0,0,1233,123,'2013-10-23','2013-10-16',111,11,111,1111,111,1,1,1,'1*1*1','/uploads/images/1380905574863.jpg','/uploads/images/1380905579019.jpg;/uploads/images/1380905579050.jpg;',NULL,0,0,1,33,23,1,1,6,16),(1000041,'测试一下单品','测试哦哦哦哦','123','对对对',5,0,0,0,123,123,'2013-10-10','2013-10-22',123,123,123,123,123,1,123,123,'123*123*123','/uploads/images/1380906985615.jpg','',NULL,0,0,1,38,25,1,1,6,16),(1000042,'测试不带各种价格','测试一下不带各种价格','ddd','撒的发生',5,0,0,0,300,0,NULL,NULL,0,0,0,400,12,1,2,12,'123*123*123','/uploads/images/1380908806420.jpg','/uploads/images/1380908808819.jpg;',NULL,0,6,1,55,41,1,1,6,18),(1000043,'New Apparel Parent Test1','新服装产品测试','<p>\n	Ha Ha Ha Ha','哈哈好好好h奥',5,0,0,0,99,88,'2013-10-04','2013-10-24',77,77,99,10,1,1,1,2,'1*2*3','/uploads/images/1380930279530.JPG','/uploads/images/1380930283967.JPG;/uploads/images/1380930289408.JPG;',NULL,1,8,10001,22,17,3,5,6,16),(1000044,'Wellness Test1','幸福测试1','<p>\n	GGGGGG\n</p>\n<p>\n	<img src=\"/uploads/images/1380933987889.JPG\" alt=\"\" />\n</p>','<p>\r\n	个个格\r\n</p>\r\n<p>\r\n	<img src=\"http://tdg.omartech.com/uploads/images/1380933987889.JPG\" />\r\n</p>',5,0,0,0,99,88,'2013-10-04','2013-10-31',77,77,99,80,5,1,1,2,'1*2*3','/uploads/images/1380933906060.JPG','/uploads/images/1380933913678.JPG;',NULL,0,8,10001,120,106,3,5,6,103),(1000045,'Apparel Apparel Test1','服装服装测试1','<p>\n	Good Good Good Good\n</p>\n<p>\n	<br />\n</p>','好，好，好。。',5,1,15,10,99,88,'2013-10-01','2013-10-31',77,80,99,99,9,1,1,2,'1*2*3','/uploads/images/1382165334827.JPG','/uploads/images/1382164910828.JPG;/uploads/images/1382164936607.JPG;',NULL,1,8,10001,22,17,3,5,6,16),(1000046,'Electronics','电子产品','aassssssss','assssss',5,0,0,0,99,0,'2013-10-08','2013-10-17',0,0,0,99,9,1,1,2,'1*2*3','/uploads/images/1382170484493.JPG','/uploads/images/1382170506998.JPG;',NULL,1,8,10001,193,128,3,5,6,126),(1000047,'Instrument','乐器SellerTest1','FGGG','FGGGGG',5,1,13,10,99,88,'2013-10-22','2013-10-25',77,77,100,55,5,1,1,2,'1*2*3','/uploads/images/1382342502047.JPG','/uploads/images/1382342509182.JPG;/uploads/images/1382342515146.JPG;',NULL,0,0,10002,136,136,1,5,NULL,131),(1000048,'Man Seller Test2','男子服装测试2','CCCCCC<img src=\"http://http://www.taobao.com/view_image.php?spm=a220o.1000855.0.0.clGa03','CCCCCCC',5,1,12,10,99,88,'2013-10-21','2013-10-22',77,50,100,99,10,1,1,2,'1*2*3','/uploads/images/1382343221624.JPG','/uploads/images/1382343226155.JPG;',NULL,0,0,10001,24,17,3,5,6,16),(1000049,'Wine Wine1 提供国际运费Seller','酒酒卖家（提供国际运费）','<p>\n	ＫＡＫＡ<span style=\"line-height:1.5;\">ＫＡＫＡＫＡ</span>\n</p>\n<p>\n	<span style=\"line-height:1.5;\"><img src=\"/uploads/images/1382346681908.JPG\" alt=\"\" /><br />\n</span>\n</p>','卡卡卡卡卡',5,1,12,10,99,88,'2013-10-21','2013-10-22',77,77,100,100,10,1,1,2,'1*2*3','/uploads/images/1382346562702.JPG','/uploads/images/1382346565720.JPG;',NULL,0,0,1,105,105,1,1,6,103),(1000050,'Home Parent 1668 Global Shipping','家居父商品1668国际运输','<p>\n	GGGGGG\n</p>\n<p>\n	<img src=\"/uploads/images/1382413780196.JPG\" alt=\"\" />\n</p>','<p>\r\n	GGGGGG\r\n</p>\r\n<p>\r\n	<img src=\"http://tdg.omartech.com/uploads/images/1382413780196.JPG\" />\r\n</p>',5,1,12,10,99,88,'2013-10-23','2013-10-31',77,77,100,50,20,1,1,2,'1*2*3','/uploads/images/1382413664735.JPG','/uploads/images/1382413670931.JPG;',NULL,1,0,10001,160,160,3,5,6,130),(1000051,'鞋子','1阿迪达斯222','阿迪','撒旦法',5,0,0,0,500,300,'2013-10-24','2013-10-31',0,0,0,300,10,1,22,33,'1*2*3','/uploads/images/1382460235566.jpg','/uploads/images/1382460241007.jpg;/uploads/images/1382460241070.jpg;/uploads/images/1382460241097.jpg;/uploads/images/1382460241148.jpg;',NULL,0,0,1,32,NULL,1,1,6,16),(1000052,'xiezi',NULL,'dd',NULL,1,0,0,0,133,0,NULL,NULL,0,0,0,1234,1234,1,2,3,'1*1*1','/uploads/images/1382547875721.jpg','',NULL,0,10,1,54,NULL,1,1,0,18),(1000053,'撒旦法',NULL,'asdf',NULL,1,0,0,0,222,0,NULL,NULL,0,0,0,1234,123,1,1,2,'3*4*1','/uploads/images/1382633340611.jpg','',NULL,1,0,1,38,NULL,1,1,0,16);
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `seller`
--

DROP TABLE IF EXISTS `seller`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `seller` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(45) NOT NULL,
  `password` varchar(255) NOT NULL,
  `businessName` varchar(255) DEFAULT NULL,
  `firstName` varchar(255) DEFAULT NULL,
  `lastName` varchar(255) DEFAULT NULL,
  `businessAddress` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `country` varchar(255) DEFAULT NULL,
  `primaryPhoneNumber` varchar(255) DEFAULT NULL,
  `productLines` varchar(255) DEFAULT NULL,
  `secondPhoneNumber` varchar(255) DEFAULT NULL,
  `companyWebsiteAddress` varchar(255) DEFAULT NULL,
  `createdAt` date DEFAULT NULL,
  `lastLoginAt` date DEFAULT NULL,
  `accountStatus` int(11) DEFAULT '0',
  `state` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=10003 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `seller`
--

LOCK TABLES `seller` WRITE;
/*!40000 ALTER TABLE `seller` DISABLE KEYS */;
INSERT INTO `seller` VALUES (1,'seller@tdg.com','123123','123','123','123','123','123','123','12312312312','123','12312312312','123',NULL,NULL,3,NULL),(2,'beijing@123.com','123123','123','123','123','123','123','123','123','123','123','123',NULL,NULL,0,NULL),(3,'asd@123.com','123123','123','123','123','123','123','123','123','123','123','123',NULL,NULL,0,NULL),(4,'aaa@bit.edu.cn','123123','123','123','123','123','123','123','123','123','123','123',NULL,NULL,0,NULL),(5,'ss@bit.edu.cn','123123','123','123','123','123','123','123','123','123','123','123',NULL,NULL,3,'123'),(10000,'seller2@tdg.com','123123','123','123','123','123','123','123','123','123','123','123',NULL,NULL,3,'123'),(10001,'1668275786@qq.com','1668275786','1668275786','','','','','','','','','',NULL,NULL,3,''),(10002,'sellertest1@tdg.com','','','','','','','','','','','',NULL,NULL,3,'');
/*!40000 ALTER TABLE `seller` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sellerHelpService`
--

DROP TABLE IF EXISTS `sellerHelpService`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sellerHelpService` (
  `id` int(11) DEFAULT '0',
  `aboutUs` text,
  `businessProcess` text,
  `contactUs` text,
  `joinUs` text,
  `isChinese` int(11) DEFAULT '1',
  `companyService` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sellerHelpService`
--

LOCK TABLES `sellerHelpService` WRITE;
/*!40000 ALTER TABLE `sellerHelpService` DISABLE KEYS */;
INSERT INTO `sellerHelpService` VALUES (0,'<p>\r\nceshi\r\n</p>\r\n<p>\r\n测试\r\n</p>\r\n<p>\r\n测试\r\n</p>','测试  测试  测试','测试  测试  测试','测试  测试  测试',1,'测试  测试  测试');
/*!40000 ALTER TABLE `sellerHelpService` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sellerIndex`
--

DROP TABLE IF EXISTS `sellerIndex`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sellerIndex` (
  `id` int(11) DEFAULT '0',
  `picturePath` text,
  `textContent` text,
  `isChinese` int(11) DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sellerIndex`
--

LOCK TABLES `sellerIndex` WRITE;
/*!40000 ALTER TABLE `sellerIndex` DISABLE KEYS */;
INSERT INTO `sellerIndex` VALUES (0,'oppo.jpg;tcl.jpg;yingpan.jpg;','测试 测试 测试',1);
/*!40000 ALTER TABLE `sellerIndex` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shopsetting`
--

DROP TABLE IF EXISTS `shopsetting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shopsetting` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `shippingCountry` int(11) DEFAULT NULL,
  `shippingPromiseDays` int(11) DEFAULT NULL,
  `descriptionInChinese` text,
  `defaultCoinage` int(11) DEFAULT '1',
  `ischinese` int(11) DEFAULT NULL,
  `sellerid` int(11) NOT NULL,
  `title` varchar(100) DEFAULT NULL,
  `titleInChinese` varchar(100) DEFAULT NULL,
  `bankName` varchar(100) DEFAULT NULL,
  `bankAddress` varchar(100) DEFAULT NULL,
  `bankCity` varchar(100) DEFAULT NULL,
  `swiftCode` varchar(100) DEFAULT NULL,
  `accountName` varchar(100) DEFAULT NULL,
  `accountNumber` varchar(100) DEFAULT NULL,
  `description` text,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shopsetting`
--

LOCK TABLES `shopsetting` WRITE;
/*!40000 ALTER TABLE `shopsetting` DISABLE KEYS */;
INSERT INTO `shopsetting` VALUES (4,1,1,NULL,1,NULL,1,'spny',NULL,'dd','beijing','beiji','2399299311','chen','92991910211','&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;asdffdee'),(5,3,3,NULL,2,NULL,10000,'japan',NULL,'123','123','123','123','123','123','asdé£'),(6,5,1,NULL,3,NULL,10001,'1668275786',NULL,'','','','','','','<p>	Fashion Jewelry Store</p><p>	<br /></p><p>	<br /></p>'),(7,5,1,NULL,1,NULL,10002,'Sellertest1',NULL,'13223','1233','1233','1123','1233','123344','GGGGG');
/*!40000 ALTER TABLE `shopsetting` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `translationTask`
--

DROP TABLE IF EXISTS `translationTask`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `translationTask` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `taskId` int(11) NOT NULL,
  `sellerId` int(11) NOT NULL,
  `translatorId` int(11) NOT NULL,
  `taskType` varchar(45) NOT NULL,
  `status` int(11) DEFAULT NULL,
  `createdAt` date NOT NULL,
  `count` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `translationTask`
--

LOCK TABLES `translationTask` WRITE;
/*!40000 ALTER TABLE `translationTask` DISABLE KEYS */;
INSERT INTO `translationTask` VALUES (16,1000029,1,1,'product',1,'2013-10-01',1),(17,1000030,10000,1,'product',1,'2013-10-01',1),(18,6,1,1,'brand',1,'2013-10-03',1),(19,7,1,1,'brand',1,'2013-10-03',1),(20,1000031,1,1,'product',1,'2013-10-04',1),(21,1000032,10001,1,'product',1,'2013-10-04',1),(22,1000034,10001,1,'product',1,'2013-10-04',1),(23,1000035,10001,1,'product',1,'2013-10-04',1),(24,1000036,10001,1,'product',1,'2013-10-04',1),(25,1000039,10001,1,'product',1,'2013-10-04',1),(26,1000038,10001,1,'product',1,'2013-10-04',1),(27,1000037,10001,1,'product',1,'2013-10-04',1),(28,1000040,1,1,'product',1,'2013-10-05',1),(29,1000041,1,1,'product',1,'2013-10-05',1),(30,1000042,1,1,'product',1,'2013-10-05',1),(31,1000043,10001,1,'product',1,'2013-10-05',1),(32,1000044,10001,1,'product',1,'2013-10-05',1),(34,1000045,10001,1,'product',1,'2013-10-19',1),(35,1000046,10001,1,'product',1,'2013-10-19',1),(36,1000047,10002,1,'product',1,'2013-10-21',1),(37,1000048,10001,1,'product',1,'2013-10-21',1),(38,1000049,1,1,'product',1,'2013-10-21',1),(39,1000050,10001,1,'product',1,'2013-10-22',1),(40,1000051,1,1,'product',1,'2013-10-23',2),(41,10,1,1,'brand',1,'2013-10-24',2);
/*!40000 ALTER TABLE `translationTask` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `translator`
--

DROP TABLE IF EXISTS `translator`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `translator` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(45) NOT NULL,
  `password` varchar(255) NOT NULL,
  `accountstatus` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `translator`
--

LOCK TABLES `translator` WRITE;
/*!40000 ALTER TABLE `translator` DISABLE KEYS */;
INSERT INTO `translator` VALUES (1,'translator@tdg.com','123123',3),(2,'t2@tdg.com','123123',3),(3,'t3@tdg.com','123123',3);
/*!40000 ALTER TABLE `translator` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2013-10-25  1:52:34
