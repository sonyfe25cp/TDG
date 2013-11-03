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
  `discount` float DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=201 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ProductLine`
--

LOCK TABLES `ProductLine` WRITE;
/*!40000 ALTER TABLE `ProductLine` DISABLE KEYS */;
INSERT INTO `ProductLine` VALUES (16,'服装，鞋子，包包','Clothing, Shoes & Handbags',0,1,0.5),(17,'服装','Clothing',16,2,NULL),(18,'儿童，母婴用品和玩具','Kids , Maternity , Baby & Toys and Games',0,1,NULL),(19,'美容, 护肤, 美发','Beauty',0,1,NULL),(20,'化妆用品','Makeup',19,2,NULL),(21,'眼部化妆','Eyes',20,3,NULL),(22,'女装','Women’s Clothing',17,3,NULL),(23,'鞋子 ','Shoes',16,2,NULL),(24,'男装','Men’s Clothing',17,3,NULL),(25,'包包','Handbags',16,2,NULL),(26,'服饰配件','Accessories',17,3,NULL),(27,'内衣','Intimates',17,3,NULL),(28,'家居休闲服','Sleep & Lounge',17,3,NULL),(29,'泳衣','Swim',17,3,NULL),(30,'女鞋','Women’s Shoes',23,3,NULL),(31,'男鞋','Men’s Shoes',23,3,NULL),(32,'少年鞋','Boys’ Shoes',23,3,NULL),(33,'少女鞋','Girls’ Shoes',23,3,NULL),(34,'运动鞋和户外鞋','Athletic and Outdoor Shoes',23,3,NULL),(35,'鞋子护理与配件','Shoes Care & Accessories',23,3,NULL),(36,'女包','Women’s Handbags',25,3,NULL),(37,'男包','Men’s Handbags',25,3,NULL),(38,'箱包','Luggage',25,3,NULL),(39,'书包，其它包和配件','Backpacks, Bags, Cases and Accessories',25,3,NULL),(40,'妈妈用品','Maternity Products',18,2,NULL),(41,'婴儿用品','Baby Products',18,2,NULL),(42,'儿童服装','Kids’ Clothing',18,2,NULL),(43,'玩具和游戏','Toys and Games',18,2,NULL),(45,'护肤用品','Skincare Products',19,2,NULL),(46,'男士护理','Men’s Grooming',19,2,NULL),(47,'美发用品','Hair Care',19,2,NULL),(48,'香水','Perfume',19,2,NULL),(49,'配件和工具','Tools and Accessories',19,2,NULL),(50,'孕妇服装','Maternity Clothing',40,3,NULL),(51,'孕妇配件','Maternity Accessories',40,3,NULL),(52,'妈妈护理/营养 ','Mom’s care',40,3,NULL),(53,'婴儿服装','Baby’s Clothing',41,3,NULL),(54,'婴儿喂养用品','Baby Health and Food',41,3,NULL),(55,'婴儿护理用品','Baby Care',41,3,NULL),(56,'男孩服装','Boys’ Clothing',42,3,NULL),(57,'女孩服装','Girls’ Clothing',42,3,NULL),(58,'婴儿玩具和游戏','Baby’s toys and Games	',43,3,NULL),(59,'儿童玩具和游戏','Kids’ toys and Games',43,3,NULL),(60,'','',20,3,NULL),(61,'','',20,3,NULL),(62,'眼部化妆','Eyes',20,3,NULL),(63,'唇部化妆','Lips',20,3,NULL),(64,'脸部化妆','Face',20,3,NULL),(65,'美甲','Nails',20,3,NULL),(66,'脸部护理','Face',45,3,NULL),(67,'眼部护理','Eyes ',45,3,NULL),(68,'唇部护理','Lip Care',45,3,NULL),(69,'身体护理','Bath & Body',45,3,NULL),(70,'防晒','Sun',45,3,NULL),(71,'刮脸','Shave',46,3,NULL),(72,'护肤','Skin Care',46,3,NULL),(73,'身体护理','Body Care',46,3,NULL),(74,'头发护理','Hair Care',46,3,NULL),(75,'洗发水','Shampoo',47,3,NULL),(76,'护发素','Conditioner',47,3,NULL),(77,'造型用品','Styling Products',47,3,NULL),(78,'染发用品','Hair Color',47,3,NULL),(79,'特别护理','Hair Treatment',47,3,NULL),(80,'女士香水','Women’s Perfume',48,3,NULL),(81,'男士香水','Men’s Perfume',48,3,NULL),(82,'护发工具','Hair Tools',49,3,NULL),(83,'化妆工具','Makeup Brushes',49,3,NULL),(84,'美甲工具','Nail Tools',49,3,NULL),(85,'化妆包','Cosmetics Bags & Cases',49,3,NULL),(86,'清洗工具','Cleansing Tools',49,3,NULL),(87,'户外运动用品','Outdoor Recreation ',0,1,NULL),(88,'户外运动用品','Outdoor Recreation',87,2,NULL),(89,'运动服装','Athletic & Outdoor Clothing ',87,2,NULL),(90,'健身用品','Fitness & Exercises Products',87,2,NULL),(91,'其它运动用品和配件','All other Sports & Outdoors/ Accessories',87,2,NULL),(92,'钓鱼和打猎','Fishing and hunting',88,3,NULL),(93,'水上和船上运动','Water Sports& Boating',88,3,NULL),(94,'爬山','Climbing',88,3,NULL),(95,'露营','Camping& Backpacking',88,3,NULL),(96,'雪上运动','Snow Sports',88,3,NULL),(97,'自行车运动','Cycling',88,3,NULL),(98,'高尔夫','Golf',88,3,NULL),(99,'男士服装','Men’s Clothing',89,3,NULL),(100,'女士服装','Women’s Clothing',89,3,NULL),(101,'男孩服装','Boys’ Clothing',89,3,NULL),(102,'女孩服装','Girls’ Clothing',89,3,NULL),(103,'é£ç©','Foods',0,1,0.5),(104,'食品','Grocery & Gourmet Food',103,2,NULL),(105,'酒类','Wine',103,2,NULL),(106,'卫生医药保健营养品','Health Care',103,2,NULL),(107,'早餐','Breakfast Foods',104,3,NULL),(108,'零食','Snacks',104,3,NULL),(109,'饮料','Beverages',104,3,NULL),(110,'有机食品','Organic Foods',104,3,NULL),(111,'无面筋食品','Gluten-Free Foods',104,3,NULL),(112,'烘焙食品','Baking Products',104,3,NULL),(113,'食品套装礼品','Gourmet gift',104,3,NULL),(114,'咖啡&茶','Coffee and Tea',104,3,NULL),(115,'其它食品','other foods',104,3,NULL),(116,'调味料','Herbs, Spices and seasoning',104,3,NULL),(117,'储存便捷快速食品','Pantry',104,3,NULL),(118,'健康护理（药品）','Health Care',106,3,NULL),(119,'维他命&其它元素补给营养品','Vitamin Supplement& Natural Remedies',106,3,NULL),(120,'性福产品','Sexual Wellness',106,3,NULL),(121,'减肥产品','Weight Management & Dietary Supplement',106,3,NULL),(122,'运动营养品','Sports Nutrition',106,3,NULL),(123,'个人护理产品','Personal Care',106,3,NULL),(124,'家庭医疗护理器材','Health Care Equipments',106,3,NULL),(125,'其他','Other Heal Care',106,3,NULL),(126,'电子用品','Electronics',0,1,NULL),(127,'电子配件','Electronic Accessories',126,2,NULL),(128,'电子产品','',126,2,NULL),(129,'珠宝首饰，手表和其它配饰','Jewelry, Watch & Accessories',0,1,NULL),(130,'家庭用品，车辆用品和游戏产品','Home, Vehicle & Games',0,1,NULL),(131,'其它产品','',0,1,NULL),(132,'办公以及上学用品','Office & school supplies',131,2,NULL),(133,'艺术，工艺 &缝纫','Art, Craft & Sewing',131,2,NULL),(134,'工业用品','Industrial Products',131,2,NULL),(135,'实验用品','Lab& Scientific',131,2,NULL),(136,'乐器','Musical Instruments',131,2,NULL),(137,'书籍/杂志/报纸','Books, Magazines & Newspaper',131,2,NULL),(138,'音乐/影视/明星/音像','Movies & Music',131,2,NULL),(139,'安全设备&安全用品','Safety Equipment & Safety Supplies',131,2,NULL),(140,'鲜花&绿植园艺','Flower & Gardening',131,2,NULL),(141,'网络设备/网络相关','Internet devices & Supplies',131,2,NULL),(142,'个性定制/设计服务/DIY','',131,2,NULL),(143,'圣诞用品','Christmas Products',131,2,NULL),(144,'家庭用品','Home Supplies',130,2,NULL),(145,'床上用品','Bedding',144,3,NULL),(146,'住宅家具','Furniture',144,3,NULL),(147,'家居饰品','Decorations',144,3,NULL),(148,'厨房/餐饮用具','Kitchen & Dining',144,3,NULL),(149,'家用配件','Home Hardware',144,3,NULL),(150,'室外，阳台，花园用品','Patio, Garden & Outdoor Products',144,3,NULL),(151,'家用工具','Tools& Home Improvement',144,3,NULL),(152,'家装主材','Building Supplies',144,3,NULL),(153,'卫浴/收纳/整理用具','Cleaning, Bathing & Organizing',144,3,NULL),(154,'清洁用品','Janitorial Supplies',144,3,NULL),(155,'灯&天花板扇','Lighting & Ceiling fans',144,3,NULL),(156,'生活用品','Household Supplies',144,3,NULL),(157,'艺术品','Fine Art',144,3,NULL),(158,'宠物食品和护理','Pet Food and Supplies',130,2,NULL),(159,'车辆用品','',130,2,NULL),(160,'游戏产品','Digital Games & Software',130,2,NULL),(161,'汽车零件和配件','Automotive Parts & Accessories',159,3,NULL),(162,'汽车工具及设备','Automotive Tools & Equipment ',159,3,NULL),(163,'摩托车用品及配件','motorcycle & Accessories',159,3,NULL),(164,'宠物食品','Pet Foods',158,3,NULL),(165,'宠物护理用品','Pet Supplies',158,3,NULL),(166,'珠宝首饰','Jewelry',129,2,NULL),(167,'手表','Watch',129,2,NULL),(168,'其它配饰','Accessories',129,2,NULL),(169,'男士手表','Men’s Watch',167,3,NULL),(170,'女士手表','Women’s Watch',167,3,NULL),(171,'戒指','Rings',166,3,NULL),(172,'项链','Necklaces',166,3,NULL),(173,'手链','Bracelets',166,3,NULL),(174,'耳环&耳钉 ','Earrings',166,3,NULL),(175,'男士首饰','Men’s Jewelry',166,3,NULL),(181,'手机配件','Cell Phone Accessories',127,3,NULL),(182,'电脑配件 ','Computer Accessories',127,3,NULL),(183,'电脑硬件','Computer parts& Components',127,3,NULL),(184,'电脑软件','Software',127,3,NULL),(185,'电脑周边','Computer Peripherals',127,3,NULL),(186,'闪存卡/U盘/存储/移动硬盘','Memory Card, Flash disk & Hard Drive',127,3,NULL),(187,'音乐播放器配件&MP3/MP4配件','Music player& MP3,MP4 Accessories',127,3,NULL),(188,'耳机/耳麦','Headphones',127,3,NULL),(189,'其它','other',127,3,NULL),(190,'电脑 ','Computer (Desktops & Laptops)',128,3,NULL),(191,'相机& 摄像机','Camera, Photo& Video',128,3,NULL),(192,'影音电器','Home Audio &Theater',128,3,NULL),(193,'安全与监控','Security & Surveillance',128,3,NULL),(194,'平板电脑','Tablets',128,3,NULL),(195,'手机','Cell Phone',128,3,NULL),(196,'MP3/MP4/iPod/录音笔','MP3, MP4 Players & Recorder',128,3,NULL),(197,'汽车电子用品','Vehicle Electronics',128,3,NULL),(198,'打印机&墨','Printers& Ink',128,3,NULL),(199,'厨房用品','Kitchen Electronics',128,3,NULL),(200,'生活电器','',128,3,NULL);
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
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin`
--

LOCK TABLES `admin` WRITE;
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
INSERT INTO `admin` VALUES (1,'admin','123123'),(2,'admin@bbb.com','123123'),(3,'dasdfa@112.com','123123'),(4,'desdf','123123');
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
INSERT INTO `brand` VALUES (6,'Adidas','<p>\r\n	<img src=\"http://t1.gstatic.com/images?q=tbn:ANd9GcR_s4GXvdkwFt6SezWL7Aojk_rJJ0fC8v_9PVFVwf_JZ4I9OuaD_Q&t=1\" alt=\"\" />\r\n</p>\r\n<p>\r\n	<span style=\"color:#222222;font-family:arial, sans-serif;font-size:13px;line-height:16px;background-color:#FFFFFF;\"><a target=\"_blank\" href=\"http://baike.baidu.com/view/28012.htm\">Adidas AG is a German multinational corporation that designs and manufactures sports clothing and accessories based in Herzogenaurach, Bavaria, Germany. Frequently mispronounced as.</a></span><span style=\"color:#333333;font-family:arial, 宋体, sans-serif;font-size:14px;line-height:25px;background-color:#FFFFFF;\"></span>\r\n</p>\r\n<p>\r\n	<span style=\"color:#2C2D2E;font-family:arial, sans-serif;font-size:13px;line-height:16px;\">For over 80 years the adidas Group has been part of the world of sports on every level, delivering state-of-the-art sports footwear, apparel and accessories. Today, the adidas Group is a global leader in the sporting goods industry and offers a broad portfolio of products. Products from the adidas Group are available in virtually every country of the world. Our strategy is simple: continuously strengthen our brands and products to improve our competitive position and financial performance.&nbsp;</span><br />\r\n<span style=\"color:#2C2D2E;font-family:arial, sans-serif;font-size:13px;line-height:16px;\">&nbsp;</span><br />\r\n<strong>adidas</strong><br />\r\n<span style=\"color:#2C2D2E;font-family:arial, sans-serif;font-size:13px;line-height:16px;\">Footwear, apparel, accessories</span><br />\r\n<br />\r\n<strong>Reebok</strong><br />\r\n<span style=\"color:#2C2D2E;font-family:arial, sans-serif;font-size:13px;line-height:16px;\">Footwear, apparel and accessories</span><br />\r\n<span style=\"color:#2C2D2E;font-family:arial, sans-serif;font-size:13px;line-height:16px;\">&nbsp;</span><br />\r\n<strong>TaylorMade-adidas</strong><span style=\"color:#2C2D2E;font-family:arial, sans-serif;font-size:13px;line-height:16px;\">&nbsp;</span><strong>Golf</strong><br />\r\n<span style=\"color:#2C2D2E;font-family:arial, sans-serif;font-size:13px;line-height:16px;\">Golf Equipment: metalwoods, irons putters, golf balls, footwear, apparel and accessories</span><br />\r\n<span style=\"color:#2C2D2E;font-family:arial, sans-serif;font-size:13px;line-height:16px;\">&nbsp;</span><br />\r\n<strong>Rockport</strong><br />\r\n<span style=\"color:#2C2D2E;font-family:arial, sans-serif;font-size:13px;line-height:16px;\">Dress, casual and outdoor footwear, apparel and accessories</span><br />\r\n<span style=\"color:#2C2D2E;font-family:arial, sans-serif;font-size:13px;line-height:16px;\">&nbsp;</span><br />\r\n<strong>CCM-Hockey</strong><br />\r\n<span style=\"color:#2C2D2E;font-family:arial, sans-serif;font-size:13px;line-height:16px;\">Hockey equipment and apparel</span><br />\r\n<span style=\"color:#2C2D2E;font-family:arial, sans-serif;font-size:13px;line-height:16px;\">&nbsp;</span><br />\r\n<span style=\"color:#2C2D2E;font-family:arial, sans-serif;font-size:13px;line-height:16px;\">Activities of the company and its around&nbsp;170 subsidiaries are directed from the Group\'s headquarters in Herzogenaurach, Germany.&nbsp;It is also home to the adidas brand.&nbsp;Reebok Headquarters are located in Canton, Massachusetts. TaylorMade-adidas Golf is based in California. The company also operates&nbsp;creation centres&nbsp;and development departments at other locations around the world, corresponding to the related business activity.&nbsp;</span><br />\r\n<br />\r\n<span style=\"color:#2C2D2E;font-family:arial, sans-serif;font-size:13px;line-height:16px;\">adidas Sourcing Ltd., a fully-owned subsidiary headquartered in Hong Kong, is the worldwide sourcing agent for the adidas Group.</span><br />\r\n<span style=\"color:#2C2D2E;font-family:arial, sans-serif;font-size:13px;line-height:16px;\">Effective December 31, 2012, the adidas Group employed 46,306 people.</span>\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n</p>','阿迪达斯','<p>\r\n	<img src=\"http://t1.gstatic.com/images?q=tbn:ANd9GcR_s4GXvdkwFt6SezWL7Aojk_rJJ0fC8v_9PVFVwf_JZ4I9OuaD_Q&amp;t=1\" alt=\"\" />\r\n</p>\r\n<p>\r\n	<span><span style=\"line-height:16px;\">阿迪达斯非常棒哦！！！！</span></span>\r\n</p>\r\n<p>\r\n	<br />\r\n</p>',0,1,6),(7,'NoPrinter','<p>\r\n	<img src=\"/uploads/images/1379816605101.png\" width=\"647\" height=\"166\" alt=\"\" />\r\n</p>\r\n<p>\r\n	Noprinter is a good service for students in university of beijing.\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	<br />\r\n</p>','打印铺','打印铺是个有良心的店铺',0,1,6),(8,'1668275786','<p>\r\n	1668275786\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	<img src=\"/uploads/images/1380878603026.JPG\" alt=\"\" /> \r\n</p>',NULL,NULL,0,10001,0),(10,'23323','sadfasdf','ddee','asdf',0,1,6);
/*!40000 ALTER TABLE `brand` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cart`
--

DROP TABLE IF EXISTS `cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cart` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `itemId` int(11) DEFAULT NULL,
  `customerId` int(11) DEFAULT NULL,
  `number` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart`
--

LOCK TABLES `cart` WRITE;
/*!40000 ALTER TABLE `cart` DISABLE KEYS */;
/*!40000 ALTER TABLE `cart` ENABLE KEYS */;
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
  `commentByAdmin` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `claimItem`
--

LOCK TABLES `claimItem` WRITE;
/*!40000 ALTER TABLE `claimItem` DISABLE KEYS */;
INSERT INTO `claimItem` VALUES (8,'order',5,10000,91,8,4,2,NULL,'dasdf');
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
  `phoneNum` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=MyISAM AUTO_INCREMENT=10002 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES (1,'chenjie','123123',3,NULL,NULL,NULL),(2,'customer','123123',2,NULL,NULL,NULL),(3,'xiaoxiao','123123',3,NULL,NULL,NULL),(4,'','',3,NULL,NULL,NULL),(5,'a','123123',3,NULL,NULL,NULL),(6,'admin@noprinter.cn','123123',4,NULL,NULL,NULL),(8,'sonyfe25cp@gmail.com','123123',3,'62008054b4d88ZZb277bcee9bd39a69fc111e791dee21e0169042297','6202505c91cbdfh3a3af9c5f714bc4ec6816482311d3ad3169042297',NULL),(10000,'buyer@126.com','123123',3,NULL,NULL,NULL),(10001,'tt@tdg.com','123123',1,NULL,NULL,'12312123123');
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
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customerAddress`
--

LOCK TABLES `customerAddress` WRITE;
/*!40000 ALTER TABLE `customerAddress` DISABLE KEYS */;
INSERT INTO `customerAddress` VALUES (1,'Chenjie','beijing institue of technology','beijing','China','100081',2,8),(2,'Chenjie','beiyuan jiayuan, shihuabojun','beijing','China','100081',2,8),(3,'陈杰','北京理工大学计算中心','北京','中国','100081',1,8),(4,'陈杰','北京理工大学计算中心406','北京','中国','100081',1,8),(5,'晓晓','世华泊郡','北京','中国','100081',1,8),(6,'晓晓','海淀区政府','北京','中国','100081',1,8),(7,'陈杰','北京理工大学计算中心','北京','中国','100081',8,8),(9,'chenjie','shuianzhongjie','beijing','USA','100091',8,1),(13,'Ruby','123','London','England','5100',0,4),(14,'GGGG','BBBb','AAA','Canada','2500',0,5),(15,'aaa','CCC','BBB','Canada','1005',10000,5),(16,'1','1','123','China','1',8,8),(17,'CCC','BBB','AAA','China','1005',10000,8),(18,'cj','shui an zhong jie ','beijing ','China','100081',8,8),(19,'cana','dadada','wotaihua','Canada','100200312',8,5),(20,'tokoy','tokyo','toyyyy','Japan','1221231',8,3);
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
  `productLineId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1000072 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item`
--

LOCK TABLES `item` WRITE;
/*!40000 ALTER TABLE `item` DISABLE KEYS */;
INSERT INTO `item` VALUES (1000021,'9001','puercha','name in chinese ','','/uploads/images/1380612276673.jpg',200,190,'2013-10-02',150,20,100,1400,300,1000029,1,53,1,'2013-10-09',1,8,1,18,5,1,18),(1000022,'de','adidass','name in chinese ','','/uploads/images/1380639761752.jpg',1000,800,'2013-10-02',850,50,100,10000,200,1000030,2,31,10000,'2013-10-08',1,8,0,0,0,3,16),(1000023,'iidde','尺子','name in chinese ','','/uploads/images/1380822966613.jpg',500,400,'2013-10-05',200,100,500,10000,200,1000031,1,30,1,'2013-10-31',1,8,0,0,0,1,16),(1000024,'Jewelry1','Jewelry Test 1','name in chinese ','\"color\":\"Red\",\"size\":\"1\"','/uploads/images/1380878966779.JPG',99,88,NULL,77,99,99,9,1,1000032,3,168,10001,NULL,1,8,0,0,0,5,129),(1000025,'Jewelry 2','Jewelry Test 1','name in chinese ','\"color\":\"Blue\",\"size\":\"1\"','/uploads/images/1380878994372.JPG',99,88,NULL,77,99,99,9,1,1000032,3,168,10001,NULL,1,8,0,0,0,5,129),(1000026,'Jewelry 3','Jewelry Test 1','name in chinese ','\"color\":\"Red\",\"size\":\"2\"','/uploads/images/1380879015278.JPG',99,88,NULL,77,99,99,9,1,1000032,3,168,10001,NULL,1,8,0,0,0,5,129),(1000027,'1668A','Apparel Test 1','name in chinese ','','/uploads/images/1380879656082.JPG',99,88,'2013-10-02',77,77,99,9,8,1000033,3,22,10001,'2013-10-30',1,8,0,0,0,5,16),(1000028,'1668A','Apparel Test 1','name in chinese ','','/uploads/images/1380879656082.JPG',99,88,'2013-10-02',77,77,99,9,8,1000034,3,22,10001,'2013-10-30',1,8,0,0,0,5,16),(1000029,'Shoe Child1','Shoe Test 1','name in chinese ','\"color\":\"Red\",\"size\":\"1\"','/uploads/images/1380880699100.JPG',99,88,NULL,77,99,99,100,1,1000035,3,30,10001,NULL,1,8,0,0,0,5,16),(1000030,'Shoe Child 2','Shoe Test 1','name in chinese ','\"color\":\"Blue \",\"size\":\"2\"','/uploads/images/1380880759160.JPG',99,88,NULL,77,99,99,100,1,1000035,3,30,10001,NULL,1,8,0,0,0,5,16),(1000031,'Shoe Child 3','Shoe Test 1','name in chinese ','\"color\":\"Red\",\"size\":\"2\"','/uploads/images/1380880803622.JPG',99,88,NULL,77,99,99,100,1,1000035,3,30,10001,NULL,1,8,0,0,0,5,16),(1000032,'Jewelry 1','Jewelry Test Without Child','name in chinese ','','/uploads/images/1380881120625.JPG',99,88,'2013-10-01',77,77,99,9,1,1000036,3,168,10001,'2013-10-22',1,8,0,0,0,5,129),(1000033,'Sport1','Sports Test Without Child','name in chinese ','','/uploads/images/1380881919554.JPG',99,88,'2013-10-01',77,77,99,9,6,1000037,3,91,10001,'2013-10-28',1,8,1,123,134,5,87),(1000034,'Sport2 ','Sport 2 ','name in chinese ','','/uploads/images/1380882036737.JPG',99,88,'2013-10-30',77,77,99,9,5,1000038,3,91,10001,'2013-10-31',1,8,0,0,0,5,87),(1000035,'Sport3','Sport Test 4','name in chinese ','','/uploads/images/1380882216433.JPG',99,88,'2013-10-01',77,66,77,9,8,1000039,3,91,10001,'2013-10-18',1,8,1,9,10,5,87),(1000036,'dessd','new one','name in chinese ','','/uploads/images/1380905574863.jpg',1233,123,'2013-10-23',111,11,111,1111,111,1000040,1,33,1,'2013-10-16',1,8,0,0,0,1,16),(1000037,'22d','测试一下单品','测试哦哦哦哦','','/uploads/images/1380906985615.jpg',123,123,'2013-10-10',123,123,123,123,123,1000041,1,38,1,'2013-10-22',1,8,0,0,0,1,16),(1000038,'','测试不带各种价格','测试一下不带各种价格','','/uploads/images/1380908806420.jpg',300,0,NULL,0,0,0,400,12,1000042,1,55,1,NULL,1,8,0,0,0,1,18),(1000039,'New Apparel Child','New Apparel Parent Test1','新服装产品测试','\"color\":\"Blue\",\"size\":\"L\"','/uploads/images/1380930399839.JPG',99,88,NULL,77,77,99,10,1,1000043,3,22,10001,NULL,1,8,0,0,0,5,16),(1000040,'Apparel Child 2','New Apparel Parent Test1','新服装产品测试','\"color\":\"Blue\",\"size\":\"S\"','/uploads/images/1380930448014.JPG',99,88,NULL,77,77,99,10,1,1000043,3,22,10001,NULL,1,8,0,0,0,5,16),(1000041,'New Apparel Child3','New Apparel Parent Test1','新服装产品测试','\"color\":\"Red\",\"size\":\"S\"','/uploads/images/1380930491355.JPG',99,88,NULL,77,77,99,10,1,1000043,3,22,10001,NULL,1,8,0,0,0,5,16),(1000042,'Wellness 1','Wellness Test1','幸福测试1','','/uploads/images/1380933906060.JPG',99,88,'2013-10-04',77,77,99,80,5,1000044,3,120,10001,'2013-10-31',1,8,0,0,0,5,103),(1000043,'AA1','Apparel Apparel Test1','服装服装测试1','\"color\":\"Red\",\"size\":\"S\"','/uploads/images/1382166188708.JPG',99,88,NULL,77,80,99,99,9,1000045,3,22,10001,NULL,1,8,0,0,0,5,16),(1000044,'AA2','Apparel Apparel Test1','服装服装测试1','\"color\":\"Red\",\"size\":\"Medium\"','/uploads/images/1382166262340.JPG',99,88,NULL,77,80,99,99,9,1000045,3,22,10001,NULL,1,8,0,0,0,5,16),(1000045,'AA3','Apparel Apparel Test1','服装服装测试1','\"color\":\"Blue\",\"size\":\"Large\"','/uploads/images/1382166307219.JPG',99,88,NULL,77,80,99,99,9,1000045,3,22,10001,NULL,1,8,0,0,0,5,16),(1000046,'AA4','Apparel Apparel Test1','服装服装测试1','\"color\":\"Green\",\"size\":\"XXL\"','/uploads/images/1382166421340.JPG',99,88,NULL,77,80,99,99,9,1000045,3,22,10001,NULL,1,8,0,0,0,5,16),(1000047,'AA6','Apparel Apparel Test1','服装服装测试1','\"color\":\"Purple\",\"size\":\"S\"','/uploads/images/1382166530010.JPG',99,88,NULL,77,80,99,99,9,1000045,3,22,10001,NULL,1,8,0,0,0,5,16),(1000048,'AA7','Apparel Apparel Test1','服装服装测试1','\"color\":\"Purple\",\"size\":\"M\"','/uploads/images/1382166683257.JPG',99,88,NULL,77,80,99,99,9,1000045,3,22,10001,NULL,1,8,0,0,0,5,16),(1000049,'AA7','Apparel Apparel Test1','服装服装测试1','\"color\":\"Purple\",\"size\":\"L\"','/uploads/images/1382166768052.JPG',99,88,NULL,77,80,99,99,9,1000045,3,22,10001,NULL,1,8,0,0,0,5,16),(1000050,'AA8','Apparel Apparel Test1','服装服装测试1','\"color\":\"Purple\",\"size\":\"XXL\"','/uploads/images/1382166875980.JPG',99,88,NULL,77,80,99,99,9,1000045,3,22,10001,NULL,1,8,0,0,0,5,16),(1000051,'AA9','Apparel Apparel Test1','服装服装测试1','\"color\":\"Yellow\",\"size\":\"S\"','/uploads/images/1382166994406.JPG',99,88,NULL,77,80,99,99,9,1000045,3,22,10001,NULL,1,8,0,0,0,5,16),(1000052,'Sellertest1','Instrument','乐器SellerTest1','','/uploads/images/1382342502047.JPG',99,88,'2013-10-22',77,77,100,55,5,1000047,1,136,10002,'2013-10-25',1,8,1,13,10,5,131),(1000053,'ABC123','Man Seller Test2','男子服装测试2','','/uploads/images/1382343221624.JPG',99,88,'2013-10-21',77,50,100,99,10,1000048,3,24,10001,'2013-10-22',1,8,1,12,10,5,16),(1000054,'ABC','Wine Wine1 提供国际运费Seller','酒酒卖家（提供国际运费）','','/uploads/images/1382346562702.JPG',99,88,'2013-10-21',77,77,100,100,10,1000049,1,105,1,'2013-10-22',1,8,1,12,10,1,103),(1000055,'Home Child1','Home Parent 1668 Global Shipping','家居父商品1668国际运输','\"color\":\"Red\",\"size\":\"12\"','/uploads/images/1382413841632.JPG',99,88,'2013-10-22',77,77,100,49,20,1000050,3,160,10001,'2013-10-30',1,8,0,0,0,5,130),(1000056,'Home Child2','Home Parent 1668 Global Shipping','家居父商品1668国际运输','\"color\":\"Blue\",\"size\":\"13\"','/uploads/images/1382413873214.JPG',99,88,'2013-10-23',77,77,100,50,20,1000050,3,160,10001,'2013-10-28',1,8,0,0,0,5,130),(1000057,'Home Child 3','Home Parent 1668 Global Shipping','家居父商品1668国际运输','\"color\":\"Yellow\",\"size\":\"12\"','/uploads/images/1382413917572.JPG',90,50,'2013-10-21',77,77,100,40,20,1000050,3,160,10001,'2013-10-21',1,8,0,0,0,5,130),(1000058,'','鞋子','1阿迪达斯222','','/uploads/images/1382460235566.jpg',500,300,'2013-10-24',0,0,0,300,10,1000051,1,32,1,'2013-10-31',1,8,0,0,0,1,16),(1000059,'','xiezi',NULL,'','/uploads/images/1382547875721.jpg',133,0,NULL,0,0,0,1234,1234,1000052,1,54,1,NULL,1,8,0,0,0,1,18),(1000060,'sde','goods from japan','来自日本的货物','','/uploads/images/1383125330178.jpg',67,0,NULL,0,0,0,50,5,1000054,2,24,10000,NULL,1,8,0,0,0,3,16),(1000061,'','another goods from jap','又一个日本货','','/uploads/images/1383125499984.jpg',85,0,NULL,0,0,0,46,5,1000055,2,30,10000,NULL,1,8,1,10,3,3,16),(1000062,'bai002','撒旦法',NULL,'\"color\":\"red\",\"size\":\"36\"','/uploads/images/1383231415520.jpg',222,220,'2013-10-16',0,0,5,5,123,1000053,1,38,1,'2013-11-21',0,0,0,0,0,1,16),(1000063,'ba','撒旦法',NULL,'\"color\":\"red\",\"size\":\"12\"','/uploads/images/1383271114178.jpg',222,0,'2013-11-13',0,0,0,39,123,1000053,1,38,1,'2013-11-30',0,0,0,0,0,1,16),(1000064,'ba','撒旦法',NULL,'\"color\":\"red\",\"size\":\"123\"','undefined',222,0,'2013-11-13',0,0,0,39,123,1000053,1,38,1,'2013-11-30',0,0,0,0,0,1,16),(1000065,'de','撒旦法',NULL,'\"color\":\"dd\",\"size\":\"32\"','/uploads/images/1383271488765.jpg',222,0,'2013-11-27',0,0,0,39,123,1000053,1,38,1,'2013-11-29',0,0,0,0,0,1,16),(1000066,'ddd','撒旦法2',NULL,'','/uploads/images/1383273855197.jpg',222,220,'2013-11-26',0,0,0,39,123,1000053,1,38,1,'2013-11-30',0,0,0,0,0,1,16),(1000067,'eda','撒旦法2',NULL,'','/uploads/images/1383273855197.jpg',222,220,'2013-11-26',0,0,0,39,123,1000053,1,38,1,'2013-11-30',0,0,0,0,0,1,16),(1000068,'add','撒旦法2',NULL,'','/uploads/images/1383273855197.jpg',222,220,'2013-11-26',0,0,0,39,123,1000053,1,38,1,'2013-11-30',0,8,0,0,0,1,16),(1000069,'onlyone','single',NULL,'','/uploads/images/1383275395703.jpg',331,330,'2013-11-12',0,0,0,221,2,1000056,1,53,1,'2013-11-30',1,8,1,2,3,1,18),(1000070,'only','单品珠宝',NULL,'','/uploads/images/1383275603775.jpg',22222,22221,'2013-11-12',0,0,0,33,1,1000057,1,168,1,'2013-11-26',1,8,0,0,0,1,129),(1000071,'d','产品描述测试图片包括网络图片',NULL,'','/uploads/images/1383276749197.jpg',231,11,'2013-11-20',0,0,0,222,11,1000059,1,32,1,'2013-11-28',1,8,0,0,0,1,16);
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
  `createAt` datetime DEFAULT NULL,
  `responseId` int(11) DEFAULT NULL,
  `finishAt` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `message`
--

LOCK TABLES `message` WRITE;
/*!40000 ALTER TABLE `message` DISABLE KEYS */;
INSERT INTO `message` VALUES (1,'1','2','seller',0,'2013-07-24 00:00:00',8,'2013-07-30 00:00:00'),(2,'1','23','customer',1,'2013-07-24 00:00:00',NULL,NULL),(3,'阿道夫1','123123','customer',8,'2013-07-29 00:00:00',9,'2013-10-31 00:00:00'),(4,'123','123122','seller',1,'2013-07-29 00:00:00',7,'2013-07-30 00:00:00'),(5,'asdfasdf','asdfasdfsdaf\r\nasd\r\nf\r\nasdf\r\nas\r\ndf\r\n','admin',1,'2013-07-30 00:00:00',NULL,NULL),(6,'asdfa','asdd','admin',1,'2013-07-30 00:00:00',NULL,NULL),(7,'asdfa','asdf','admin',1,'2013-07-30 00:00:00',NULL,NULL),(8,'asdf','asdfasf','admin',1,'2013-07-30 00:00:00',NULL,NULL),(9,'sdf','asdfasdf','admin',1,'2013-10-31 00:00:00',NULL,NULL),(10,'asaaaaa','aaaaaaaaa','seller',1,'2013-10-31 00:00:00',11,'2013-10-31 00:00:00'),(11,'asdfasdfasdf','a3234123123','admin',1,'2013-10-31 00:00:00',NULL,NULL),(12,'asdfasdfddddddd','12312231231231','translator',0,'2013-10-31 00:00:00',13,'2013-10-31 00:00:00'),(13,'aaaaa','eeee','admin',1,'2013-10-31 00:00:00',NULL,NULL),(14,'esd','aa','translator',0,'2013-10-31 00:00:00',NULL,NULL),(15,'ddd','e12','translator',0,'2013-10-31 00:31:22',NULL,NULL);
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
  `productLineId` int(11) DEFAULT NULL,
  `discountFee` float DEFAULT NULL,
  `discountFeeRMB` float DEFAULT NULL,
  `featureJson` varchar(500) DEFAULT NULL,
  `discount` float DEFAULT NULL,
  `finalPrice` float DEFAULT NULL,
  `finalPriceRMB` float DEFAULT NULL,
  `sumPriceRMB` float DEFAULT NULL,
  `sumPrice` float DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=125 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orderItem`
--

LOCK TABLES `orderItem` WRITE;
/*!40000 ALTER TABLE `orderItem` DISABLE KEYS */;
INSERT INTO `orderItem` VALUES (104,1000058,1000051,'鞋子',1,1,3,300,76,0,0,0,1,'',1950,0,'1阿迪达斯222',NULL,150,975,'',0.5,975,975,2925,450),(105,1000061,1000055,'another goods from jap',2,10000,2,85,76,1,10,3,3,'',807.5,95,'又一个日本货',NULL,42.5,403.75,'',0.5,403.75,403.75,807.5,85),(106,1000058,1000051,'鞋子',1,1,3,300,77,0,0,0,1,'',1950,0,'1阿迪达斯222',NULL,150,975,'',0.5,975,975,2925,450),(107,1000061,1000055,'another goods from jap',2,10000,2,85,78,1,10,3,3,'',807.5,95,'又一个日本货',NULL,42.5,403.75,'',0.5,403.75,403.75,807.5,85),(108,1000061,1000055,'another goods from jap',2,10000,25,85,79,1,0,3,3,'',807.5,0,'又一个日本货',NULL,42.5,403.75,'',0.5,403.75,403.75,10093.8,1062.5),(109,1000061,1000055,'another goods from jap',2,10000,1,85,80,1,10,3,3,'',807.5,95,'又一个日本货',NULL,42.5,403.75,'',0.5,403.75,403.75,403.75,42.5),(110,1000055,1000050,'Home Parent 1668 Global Shipping',3,10001,5,99,80,0,0,0,5,'Home Child1',841.5,0,'家居父商品1668国际运输',NULL,0,0,'\"颜色\":\"Red\",\"尺寸\":\"12\"',0,841.5,841.5,4207.5,495),(111,1000055,1000050,'Home Parent 1668 Global Shipping',3,10001,5,99,81,0,0,0,5,'Home Child1',841.5,0,'家居父商品1668国际运输',NULL,0,0,'\"颜色\":\"Red\",\"尺寸\":\"12\"',0,841.5,841.5,4207.5,495),(112,1000061,1000055,'another goods from jap',2,10000,1,85,82,1,10,3,3,'',807.5,95,'又一个日本货',NULL,42.5,403.75,'',0.5,403.75,403.75,403.75,42.5),(113,1000060,1000054,'goods from japan',2,10000,5,67,84,0,0,0,3,'sde',636.5,0,'来自日本的货物',NULL,33.5,318.25,'',0.5,318.25,318.25,1591.25,167.5),(114,1000060,1000054,'goods from japan',2,10000,3,67,85,0,0,0,3,'sde',636.5,0,'来自日本的货物',NULL,33.5,318.25,'',0.5,318.25,318.25,954.75,100.5),(115,1000061,1000055,'another goods from jap',2,10000,7,85,86,1,0,3,3,'',807.5,0,'又一个日本货',NULL,42.5,403.75,'',0.5,403.75,403.75,2826.25,297.5),(116,1000060,1000054,'goods from japan',2,10000,1,67,86,0,0,0,3,'sde',636.5,0,'来自日本的货物',NULL,33.5,318.25,'',0.5,318.25,318.25,318.25,33.5),(117,1000055,1000050,'Home Parent 1668 Global Shipping',3,10001,1,99,87,0,0,0,5,'Home Child1',841.5,0,'家居父商品1668国际运输',NULL,0,0,'\"颜色\":\"Red\",\"尺寸\":\"12\"',0,841.5,841.5,841.5,99),(118,1000061,1000055,'another goods from jap',2,10000,2,85,87,1,10,3,3,'',807.5,95,'又一个日本货',NULL,42.5,403.75,'',0.5,403.75,403.75,807.5,85),(119,1000055,1000050,'Home Parent 1668 Global Shipping',3,10001,1,99,88,0,0,0,5,'Home Child1',841.5,0,'家居父商品1668国际运输',NULL,0,0,'\"颜色\":\"Red\",\"尺寸\":\"12\"',0,841.5,841.5,841.5,99),(120,1000061,1000055,'another goods from jap',2,10000,2,85,89,1,10,3,3,'',807.5,95,'又一个日本货',NULL,42.5,403.75,'',0.5,403.75,403.75,807.5,85),(121,1000060,1000054,'goods from japan',2,10000,71,67,90,0,0,0,3,'sde',636.5,0,'来自日本的货物',NULL,33.5,318.25,'',0.5,318.25,318.25,22595.8,2378.5),(122,1000060,1000054,'goods from japan',2,10000,70,67,91,0,0,0,3,'sde',636.5,0,'来自日本的货物',NULL,33.5,318.25,'',0.5,318.25,318.25,22277.5,2345),(123,1000060,1000054,'goods from japan',2,10000,1,67,92,0,0,0,3,'sde',636.5,0,'来自日本的货物',NULL,33.5,318.25,'',0.5,318.25,318.25,318.25,33.5),(124,1000061,1000055,'another goods from jap',2,10000,4,85,93,1,0,3,3,'',807.5,0,'又一个日本货',NULL,42.5,403.75,'',0.5,403.75,403.75,1615,170);
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
  `createAt` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=147 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orderRecord`
--

LOCK TABLES `orderRecord` WRITE;
/*!40000 ALTER TABLE `orderRecord` DISABLE KEYS */;
INSERT INTO `orderRecord` VALUES (116,76,'chenjie',8,'用户提交订单，等待支付','Customer submited the order, waiting for pay money','2013-10-30 00:00:00'),(117,77,'chenjie',8,'用户提交订单，等待支付','Customer submited the order, waiting for pay money','2013-10-30 00:00:00'),(118,78,'chenjie',8,'用户提交订单，等待支付','Customer submited the order, waiting for pay money','2013-10-30 00:00:00'),(119,76,'Server',0,'订单被切分','Order has been splited','2013-10-30 00:00:00'),(120,78,'chenjie',8,'用户已经支付，等待系统确认','Customer pay the order, waiting for repsonse','2013-10-30 00:00:00'),(121,77,'chenjie',8,'用户已经支付，等待系统确认','Customer pay the order, waiting for repsonse','2013-10-30 00:00:00'),(122,79,'tokoy',8,'用户提交订单，等待支付','Customer submited the order, waiting for pay money','2013-10-30 00:00:00'),(123,80,'cana',8,'用户提交订单，等待支付','Customer submited the order, waiting for pay money','2013-10-30 00:00:00'),(124,81,'cana',8,'用户提交订单，等待支付','Customer submited the order, waiting for pay money','2013-10-30 00:00:00'),(125,82,'cana',8,'用户提交订单，等待支付','Customer submited the order, waiting for pay money','2013-10-30 00:00:00'),(126,80,'Server',0,'订单被切分','Order has been splited','2013-10-30 00:00:00'),(127,84,'tokoy',8,'用户提交订单，等待支付','Customer submited the order, waiting for pay money','2013-10-30 00:00:00'),(128,85,'tokoy',8,'用户提交订单，等待支付','Customer submited the order, waiting for pay money','2013-10-30 00:00:00'),(129,86,'tokoy',8,'用户提交订单，等待支付','Customer submited the order, waiting for pay money','2013-10-31 00:36:42'),(130,86,'tokoy',8,'用户已经支付，等待系统确认','Customer pay the order, waiting for repsonse','2013-10-31 00:36:46'),(131,87,'cana',8,'用户提交订单，等待支付','Customer submited the order, waiting for pay money','2013-11-01 11:36:44'),(132,88,'cana',8,'用户提交订单，等待支付','Customer submited the order, waiting for pay money','2013-11-01 11:36:44'),(133,89,'cana',8,'用户提交订单，等待支付','Customer submited the order, waiting for pay money','2013-11-01 11:36:45'),(134,87,'Server',0,'订单被切分','Order has been splited','2013-11-01 11:36:46'),(135,89,'cana',8,'该订单发生错误','Something wrong to this order, such as out of stock , wrong address ','2013-11-01 11:48:15'),(136,88,'cana',8,'用户已经支付，等待系统确认','Customer pay the order, waiting for repsonse','2013-11-01 11:52:00'),(137,90,'tokoy',8,'用户提交订单，等待支付','Customer submited the order, waiting for pay money','2013-11-01 11:55:57'),(138,90,'tokoy',8,'该订单发生错误','Something wrong to this order, such as out of stock , wrong address ','2013-11-01 11:56:08'),(139,91,'tokoy',8,'用户提交订单，等待支付','Customer submited the order, waiting for pay money','2013-11-01 11:58:02'),(140,91,'tokoy',8,'用户已经支付，等待系统确认','Customer pay the order, waiting for repsonse','2013-11-01 11:58:07'),(141,91,'tokoy',8,'用户投诉该订单','Customer complain this order','2013-11-02 22:40:57'),(142,92,'tokoy',8,'用户提交订单，等待支付','Customer submited the order, waiting for pay money','2013-11-03 01:58:00'),(143,92,'tokoy',8,'该订单发生错误','Something wrong to this order, such as out of stock , wrong address ','2013-11-03 01:58:05'),(144,93,'tokoy',8,'用户提交订单，等待支付','Customer submited the order, waiting for pay money','2013-11-03 01:59:04'),(145,93,'tokoy',8,'用户已经支付，等待系统确认','Customer pay the order, waiting for repsonse','2013-11-03 01:59:07'),(146,93,'123',10000,'卖家已发货，等待用户查收','Seller has send, waiting for receive','2013-11-03 02:04:51');
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
  `createAt` datetime DEFAULT NULL,
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
  `sendAt` datetime DEFAULT NULL,
  `carrier` varchar(200) DEFAULT NULL,
  `trackingWeb` varchar(200) DEFAULT NULL,
  `trackingId` varchar(200) DEFAULT NULL,
  `orderPriceRMB` float DEFAULT NULL,
  `transferPriceRMB` float DEFAULT NULL,
  `priceRMB` float DEFAULT NULL,
  `originPrice` float DEFAULT NULL,
  `originPriceRMB` float DEFAULT NULL,
  `originTotal` float DEFAULT NULL,
  `originTotalRMB` float DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=94 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (76,535,10,545,'2013-10-30 00:00:00',NULL,'chenjie','shuianzhongjie','beijing','USA','100091',8,0,NULL,0,NULL,5,NULL,NULL,NULL,NULL,3732.5,95,3827.5,1070,7465,1080,7560),(77,450,0,450,'2013-10-30 00:00:00',NULL,'chenjie','shuianzhongjie','beijing','USA','100091',8,1,'123',76,NULL,2,NULL,NULL,NULL,NULL,2925,0,2925,900,5850,900,5850),(78,85,10,95,'2013-10-30 00:00:00',NULL,'chenjie','shuianzhongjie','beijing','USA','100091',8,10000,'123',76,NULL,2,NULL,NULL,NULL,NULL,807.5,95,902.5,170,1615,180,1710),(79,1062.5,0,1062.5,'2013-10-30 00:00:00',NULL,'tokoy','tokyo','toyyyy','Japan','1221231',8,10000,'123',0,NULL,1,NULL,NULL,NULL,NULL,10093.8,0,10093.8,2125,20187.5,2125,20187.5),(80,537.5,10,547.5,'2013-10-30 00:00:00',NULL,'cana','dadada','wotaihua','Canada','100200312',8,0,NULL,0,NULL,5,NULL,NULL,NULL,NULL,4611.25,95,4706.25,580,5015,590,5110),(81,495,0,495,'2013-10-30 00:00:00',NULL,'cana','dadada','wotaihua','Canada','100200312',8,10001,'1668275786',80,NULL,1,NULL,NULL,NULL,NULL,4207.5,0,4207.5,495,4207.5,495,4207.5),(82,42.5,10,52.5,'2013-10-30 00:00:00',NULL,'cana','dadada','wotaihua','Canada','100200312',8,10000,'123',80,NULL,1,NULL,NULL,NULL,NULL,403.75,95,498.75,85,807.5,95,902.5),(83,1719.5,0,1719.5,'2013-10-30 00:00:00',NULL,'tokoy','tokyo','toyyyy','Japan','1221231',8,10000,'123',0,NULL,1,NULL,NULL,NULL,NULL,16335.2,0,16335.2,3439,32670.5,3439,32670.5),(84,167.5,0,167.5,'2013-10-30 00:00:00',NULL,'tokoy','tokyo','toyyyy','Japan','1221231',8,10000,'123',0,NULL,1,NULL,NULL,NULL,NULL,1591.25,0,1591.25,335,3182.5,335,3182.5),(85,100.5,0,100.5,'2013-10-30 00:00:00',NULL,'tokoy','tokyo','toyyyy','Japan','1221231',8,10000,'123',0,NULL,1,NULL,NULL,NULL,NULL,954.75,0,954.75,201,1909.5,201,1909.5),(86,331,0,331,'2013-10-31 00:36:41',NULL,'tokoy','tokyo','toyyyy','Japan','1221231',8,10000,'123',0,NULL,2,NULL,NULL,NULL,NULL,3144.5,0,3144.5,662,6289,662,6289),(87,184,10,194,'2013-11-01 11:36:44',NULL,'cana','dadada','wotaihua','Canada','100200312',8,0,NULL,0,NULL,5,NULL,NULL,NULL,NULL,1649,95,1744,269,2456.5,279,2551.5),(88,99,0,99,'2013-11-01 11:36:44',NULL,'cana','dadada','wotaihua','Canada','100200312',8,10001,'1668275786',87,NULL,2,NULL,NULL,NULL,NULL,841.5,0,841.5,99,841.5,99,841.5),(89,85,10,95,'2013-11-01 11:36:44',NULL,'cana','dadada','wotaihua','Canada','100200312',8,10000,'123',87,NULL,7,NULL,NULL,NULL,NULL,807.5,95,902.5,170,1615,180,1710),(90,2378.5,0,2378.5,'2013-11-01 11:55:57',NULL,'tokoy','tokyo','toyyyy','Japan','1221231',8,10000,'123',0,NULL,7,NULL,NULL,NULL,NULL,22595.8,0,22595.8,4757,45191.5,4757,45191.5),(91,2345,0,2345,'2013-11-01 11:58:02',NULL,'tokoy','tokyo','toyyyy','Japan','1221231',8,10000,'123',0,NULL,10,NULL,NULL,NULL,NULL,22277.5,0,22277.5,4690,44555,4690,44555),(92,33.5,0,33.5,'2013-11-03 01:58:00',NULL,'tokoy','tokyo','toyyyy','Japan','1221231',8,10000,'123',0,NULL,7,NULL,NULL,NULL,NULL,318.25,0,318.25,67,636.5,67,636.5),(93,170,0,170,'2013-11-03 01:59:04',NULL,'tokoy','tokyo','toyyyy','Japan','1221231',8,10000,'123',0,NULL,3,'2013-11-20 00:00:00','kuaidi','ass\r\na\r\nd\r\n','1102011,2,,2312313',1615,0,1615,340,3230,340,3230);
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
  `sku` varchar(300) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1000060 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (1000029,'puercha','普洱茶','puercha is cool !!!','普洱茶很棒哦········',5,1,18,5,200,190,'2013-10-02','2013-10-09',150,20,100,39,300,1,2,3,'21*23*22','/uploads/images/1380612276673.jpg','/uploads/images/1380612280487.jpg;',NULL,0,7,1,53,41,1,1,6,18,NULL),(1000030,'adidass','阿迪的大叔','deadfdasdddd','地方等等等',5,0,0,0,1000,800,'2013-10-02','2013-10-08',850,50,100,39,200,1,23,122,'31*23*12','/uploads/images/1380639761752.jpg','/uploads/images/1380639767025.jpg;/uploads/images/1380639767078.jpg;/uploads/images/1380639767105.jpg;',NULL,0,6,10000,31,23,2,3,6,16,NULL),(1000031,'尺子','卷尺一枚','dddddddddd','卷尺很好用的哦',0,0,0,0,500,400,'2013-10-05','2013-10-31',200,100,500,39,200,1,2,3,'1*1*2','/uploads/images/1380822966613.jpg','/uploads/images/1380822969781.jpg;',NULL,0,7,1,30,23,1,1,6,16,NULL),(1000032,'Jewelry Test 1','珠宝商品测试1 ','<p>\n	GGGGGGGGGGGGGGGGGGGG\n</p>\n<p>\n	<img src=\"/uploads/images/1380878937504.JPG\" alt=\"\" />\n</p>','<p>\r\n	及笄际己3集技既及<span style=\"line-height:1.5;\"></span>\r\n</p>',5,0,0,0,99,88,'2013-10-01','2013-10-31',77,99,99,39,1,1,1,2,'1*2*3','/uploads/images/1380878827395.JPG','/uploads/images/1380878829206.JPG;/uploads/images/1380878836351.JPG;/uploads/images/1380878838876.JPG;',NULL,1,8,10001,168,168,3,5,6,129,NULL),(1000033,'Apparel Test 1',NULL,'<p>\n	CCCCCCCCCCCCCC\n</p>\n<p>\n	<img src=\"/uploads/images/1380879766858.JPG\" alt=\"\" />\n</p>',NULL,1,0,0,0,99,88,'2013-10-02','2013-10-30',77,77,99,39,8,1,1,2,'1*2*3','/uploads/images/1380879656082.JPG','/uploads/images/1380879665809.JPG;/uploads/images/1380879679944.JPG;',NULL,0,8,10001,22,17,3,5,NULL,16,NULL),(1000034,'Apparel Test 1','服装测试1 ','<p>\n	CCCCCCCCCCCCCC\n</p>\n<p>\n	<img src=\"/uploads/images/1380879766858.JPG\" alt=\"\" />\n</p>','<p>\r\n	次次此赐茨辞瓷慈\r\n</p>\r\n<p>\r\n	<img src=\"/uploads/images/1380880284852.JPG\" alt=\"\" />\r\n</p>',5,0,0,0,99,88,'2013-10-02','2013-10-30',77,77,99,39,8,1,1,2,'1*2*3','/uploads/images/1380879656082.JPG','/uploads/images/1380879665809.JPG;/uploads/images/1380879679944.JPG;',NULL,0,8,10001,22,17,3,5,6,16,NULL),(1000035,'Shoe Test 1','鞋子测试1','12233333333555555555<img src=\"/uploads/images/1380880664283.JPG\" alt=\"\" />','<p>\r\n	一号一号以阿浩1一哟阿[[\r\n</p>\r\n<p>\r\n	<img src=\"http://tdg.omartech.com/uploads/images/1380880664283.JPG\" />\r\n</p>',5,0,0,0,99,88,'2013-10-08','2013-10-24',77,99,99,39,1,1,1,2,'1*2*3','/uploads/images/1380880575412.JPG','/uploads/images/1380880581267.JPG;/uploads/images/1380880591865.JPG;',NULL,1,8,10001,30,23,3,5,6,16,NULL),(1000036,'Jewelry Test Without Child','珠宝无子商品测试','<p>\n	GOOOOOOOOOOOOOOOO\n</p>\n<p>\n	<img src=\"/uploads/images/1380881200310.JPG\" alt=\"\" />\n</p>','<p>\r\n	个个个哥哥、咯咯\r\n</p>\r\n<p>\r\n	<img src=\"http://tdg.omartech.com/uploads/images/1380881200310.JPG\" />\r\n</p>',5,0,0,0,99,88,'2013-10-01','2013-10-22',77,77,99,39,1,1,1,2,'1*2*3','/uploads/images/1380881120625.JPG','/uploads/images/1380881126826.JPG;/uploads/images/1380881132848.JPG;',NULL,0,8,10001,168,168,3,5,6,129,NULL),(1000037,'Sports Test Without Child','运动测试1 ','<p>\n	BBBBBBBB\n</p>\n<p>\n	<img src=\"/uploads/images/1380882017005.JPG\" alt=\"\" />\n</p>','<p>\r\n	BBBBB\r\n</p>\r\n<p>\r\n	<img src=\"http://tdg.omartech.com/uploads/images/1380882017005.JPG\" />\r\n</p>',5,1,123,134,99,88,'2013-10-01','2013-10-28',77,77,99,39,6,1,1,2,'1*2*3','/uploads/images/1380881919554.JPG','/uploads/images/1380881924757.JPG;/uploads/images/1380881932584.JPG;',NULL,0,8,10001,91,91,3,5,6,87,NULL),(1000038,'Sport 2 ','运动测试2','<img src=\"/uploads/images/1380882137215.JPG\" alt=\"\" />','<img src=\"http://tdg.omartech.com/uploads/images/1380882137215.JPG\" />',5,0,0,0,99,88,'2013-10-30','2013-10-31',77,77,99,39,5,1,1,2,'1*2*3','/uploads/images/1380882036737.JPG','/uploads/images/1380882049670.JPG;',NULL,0,8,10001,91,91,3,5,6,87,NULL),(1000039,'Sport Test 4','运动测试4','<p>\n	SPort3sport3sport3\n</p>\n<p>\n	<img src=\"/uploads/images/1380882309325.JPG\" alt=\"\" />\n</p>','<p>\r\n	运动3&nbsp;\r\n</p>\r\n<p>\r\n	<img src=\"http://tdg.omartech.com/uploads/images/1380882309325.JPG\" />\r\n</p>',5,1,9,10,99,88,'2013-10-01','2013-10-18',77,66,77,39,8,1,1,2,'1*2*3','/uploads/images/1380882216433.JPG','/uploads/images/1380882172453.JPG;/uploads/images/1380882180625.JPG;',NULL,0,8,10001,91,91,3,5,6,87,NULL),(1000040,'new one','新的','ddd','<p>\r\n	112313\r\n</p>\r\n<p>\r\n	呢我\r\n</p>',5,0,0,0,1233,123,'2013-10-23','2013-10-16',111,11,111,39,111,1,1,1,'1*1*1','/uploads/images/1380905574863.jpg','/uploads/images/1380905579019.jpg;/uploads/images/1380905579050.jpg;',NULL,0,0,1,33,23,1,1,6,16,NULL),(1000041,'测试一下单品','测试哦哦哦哦','123','对对对',5,0,0,0,123,123,'2013-10-10','2013-10-22',123,123,123,39,123,1,123,123,'123*123*123','/uploads/images/1380906985615.jpg','',NULL,0,0,1,38,25,1,1,6,16,NULL),(1000042,'测试不带各种价格','测试一下不带各种价格','ddd','撒的发生',5,0,0,0,300,0,NULL,NULL,0,0,0,39,12,1,2,12,'123*123*123','/uploads/images/1380908806420.jpg','/uploads/images/1380908808819.jpg;',NULL,0,6,1,55,41,1,1,6,18,NULL),(1000043,'New Apparel Parent Test1','新服装产品测试','<p>\n	Ha Ha Ha Ha','哈哈好好好h奥',5,0,0,0,99,88,'2013-10-04','2013-10-24',77,77,99,39,1,1,1,2,'1*2*3','/uploads/images/1380930279530.JPG','/uploads/images/1380930283967.JPG;/uploads/images/1380930289408.JPG;',NULL,1,8,10001,22,17,3,5,6,16,NULL),(1000044,'Wellness Test1','幸福测试1','<p>\n	GGGGGG\n</p>\n<p>\n	<img src=\"/uploads/images/1380933987889.JPG\" alt=\"\" />\n</p>','<p>\r\n	个个格\r\n</p>\r\n<p>\r\n	<img src=\"http://tdg.omartech.com/uploads/images/1380933987889.JPG\" />\r\n</p>',5,0,0,0,99,88,'2013-10-04','2013-10-31',77,77,99,39,5,1,1,2,'1*2*3','/uploads/images/1380933906060.JPG','/uploads/images/1380933913678.JPG;',NULL,0,8,10001,120,106,3,5,6,103,NULL),(1000045,'Apparel Apparel Test1','服装服装测试1','<p>\n	Good Good Good Good\n</p>\n<p>\n	<br />\n</p>','好，好，好。。',5,1,15,10,99,88,'2013-10-01','2013-10-31',77,80,99,39,9,1,1,2,'1*2*3','/uploads/images/1382165334827.JPG','/uploads/images/1382164910828.JPG;/uploads/images/1382164936607.JPG;',NULL,1,8,10001,22,17,3,5,6,16,NULL),(1000046,'Electronics','电子产品','aassssssss','assssss',5,0,0,0,99,0,'2013-10-08','2013-10-17',0,0,0,39,9,1,1,2,'1*2*3','/uploads/images/1382170484493.JPG','/uploads/images/1382170506998.JPG;',NULL,1,8,10001,193,128,3,5,6,126,NULL),(1000047,'Instrument','乐器SellerTest1','FGGG','FGGGGG',5,1,13,10,99,88,'2013-10-22','2013-10-25',77,77,100,39,5,1,1,2,'1*2*3','/uploads/images/1382342502047.JPG','/uploads/images/1382342509182.JPG;/uploads/images/1382342515146.JPG;',NULL,0,0,10002,136,136,1,5,NULL,131,NULL),(1000048,'Man Seller Test2','男子服装测试2','CCCCCC<img src=\"http://http://www.taobao.com/view_image.php?spm=a220o.1000855.0.0.clGa03','CCCCCCC',5,1,12,10,99,88,'2013-10-21','2013-10-22',77,50,100,39,10,1,1,2,'1*2*3','/uploads/images/1382343221624.JPG','/uploads/images/1382343226155.JPG;',NULL,0,0,10001,24,17,3,5,6,16,NULL),(1000049,'Wine Wine1 提供国际运费Seller','酒酒卖家（提供国际运费）','<p>\n	ＫＡＫＡ<span style=\"line-height:1.5;\">ＫＡＫＡＫＡ</span>\n</p>\n<p>\n	<span style=\"line-height:1.5;\"><img src=\"/uploads/images/1382346681908.JPG\" alt=\"\" /><br />\n</span>\n</p>','卡卡卡卡卡',5,1,12,10,99,88,'2013-10-21','2013-10-22',77,77,100,39,10,1,1,2,'1*2*3','/uploads/images/1382346562702.JPG','/uploads/images/1382346565720.JPG;',NULL,0,0,1,105,105,1,1,6,103,NULL),(1000050,'Home Parent 1668 Global Shipping','家居父商品1668国际运输','<p>\n	GGGGGG\n</p>\n<p>\n	<img src=\"/uploads/images/1382413780196.JPG\" alt=\"\" />\n</p>','<p>\r\n	GGGGGG\r\n</p>\r\n<p>\r\n	<img src=\"http://tdg.omartech.com/uploads/images/1382413780196.JPG\" />\r\n</p>',5,1,12,10,99,88,'2013-10-23','2013-10-31',77,77,100,39,20,1,1,2,'1*2*3','/uploads/images/1382413664735.JPG','/uploads/images/1382413670931.JPG;',NULL,1,0,10001,160,160,3,5,6,130,NULL),(1000051,'鞋子','1阿迪达斯222','阿迪','撒旦法',5,0,0,0,500,300,'2013-10-24','2013-10-31',0,0,0,39,10,1,22,33,'1*2*3','/uploads/images/1382460235566.jpg','/uploads/images/1382460241007.jpg;/uploads/images/1382460241070.jpg;/uploads/images/1382460241097.jpg;/uploads/images/1382460241148.jpg;',NULL,0,0,1,32,NULL,1,1,6,16,NULL),(1000052,'xiezi',NULL,'dd',NULL,1,0,0,0,133,0,NULL,NULL,0,0,0,39,1234,1,2,3,'1*1*1','/uploads/images/1382547875721.jpg','',NULL,0,10,1,54,NULL,1,1,0,18,NULL),(1000053,'撒旦法2',NULL,'bddasaaaaaae',NULL,2,0,0,0,222,220,'2013-11-26','2013-11-30',0,0,0,39,123,1,1,2,'3*4*1','/uploads/images/1383273855197.jpg','/uploads/images/1383239130358.jpg;/uploads/images/1383274054374.jpg;/uploads/images/1383274201758.jpg;/uploads/images/1383274208104.jpg;',NULL,0,10,1,38,NULL,1,1,0,16,'add'),(1000054,'goods from japan','来自日本的货物','asdffds','asd飞点点点',5,0,0,0,67,0,NULL,NULL,0,0,0,39,5,1,123,2132,'2*1*2','/uploads/images/1383125330178.jpg','/uploads/images/1383125334871.jpg;/uploads/images/1383125334932.jpg;/uploads/images/1383125335117.jpg;',NULL,0,0,10000,24,NULL,2,3,6,16,NULL),(1000055,'another goods from jap','又一个日本货','','另一个日本玩意',5,1,10,3,85,0,NULL,NULL,0,0,0,39,5,1,3,4,'1*2*3','/uploads/images/1383125499984.jpg','/uploads/images/1383125503907.jpg;/uploads/images/1383125503925.jpg;/uploads/images/1383125503956.jpg;',NULL,0,0,10000,30,NULL,2,3,6,16,NULL),(1000056,'single',NULL,'eweddaaaa',NULL,2,1,2,3,331,330,'2013-11-12','2013-11-30',0,0,0,221,2,1,3,4,'2*1*3','/uploads/images/1383275395703.jpg','/uploads/images/1383275398187.jpg;',NULL,0,0,1,53,NULL,1,1,0,18,'onlyone'),(1000057,'单品珠宝',NULL,'等等等',NULL,1,0,0,0,22222,22221,'2013-11-12','2013-11-26',0,0,0,33,1,1,2,3,'2*2*3','/uploads/images/1383275603775.jpg','/uploads/images/1383275606157.jpg;',NULL,0,0,1,168,NULL,1,1,0,129,'only'),(1000058,'测试多个珠宝',NULL,'等等等',NULL,1,0,0,0,12345,0,NULL,NULL,0,0,0,212,1,1,2,3,'1*2*3','/uploads/images/1383275666268.jpg','/uploads/images/1383275669366.jpg;',NULL,1,0,1,168,NULL,1,1,0,129,'0'),(1000059,'产品描述测试图片包括网络图片',NULL,'<p>\n	<img src=\"/uploads/images/1383276707198.jpg\" alt=\"\" />\n</p>\n<p>\n	<img src=\"http://lamb-mei.com/wp-content/uploads/2013/08/copy-21309_4852565747631_974470889_n.jpg\" alt=\"\" />\n</p>',NULL,1,0,0,0,231,11,'2013-11-20','2013-11-28',0,0,0,222,11,1,2,3,'1*2*1','/uploads/images/1383276749197.jpg','/uploads/images/1383276751613.jpg;',NULL,0,0,1,32,NULL,1,1,0,16,'d');
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
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `translationTask`
--

LOCK TABLES `translationTask` WRITE;
/*!40000 ALTER TABLE `translationTask` DISABLE KEYS */;
INSERT INTO `translationTask` VALUES (16,1000029,1,1,'product',1,'2013-10-01',1),(17,1000030,10000,1,'product',1,'2013-10-01',1),(18,6,1,1,'brand',1,'2013-10-03',1),(19,7,1,1,'brand',1,'2013-10-03',1),(20,1000031,1,1,'product',1,'2013-10-04',1),(21,1000032,10001,1,'product',1,'2013-10-04',1),(22,1000034,10001,1,'product',1,'2013-10-04',1),(23,1000035,10001,1,'product',1,'2013-10-04',1),(24,1000036,10001,1,'product',1,'2013-10-04',1),(25,1000039,10001,1,'product',1,'2013-10-04',1),(26,1000038,10001,1,'product',1,'2013-10-04',1),(27,1000037,10001,1,'product',1,'2013-10-04',1),(28,1000040,1,1,'product',1,'2013-10-05',1),(29,1000041,1,1,'product',1,'2013-10-05',1),(30,1000042,1,1,'product',1,'2013-10-05',1),(31,1000043,10001,1,'product',1,'2013-10-05',1),(32,1000044,10001,1,'product',1,'2013-10-05',1),(34,1000045,10001,1,'product',1,'2013-10-19',1),(35,1000046,10001,1,'product',1,'2013-10-19',1),(36,1000047,10002,1,'product',1,'2013-10-21',1),(37,1000048,10001,1,'product',1,'2013-10-21',1),(38,1000049,1,1,'product',1,'2013-10-21',1),(39,1000050,10001,1,'product',1,'2013-10-22',1),(40,1000051,1,1,'product',1,'2013-10-23',2),(41,10,1,1,'brand',1,'2013-10-24',2),(42,1000054,10000,1,'product',1,'2013-10-30',1),(43,1000055,10000,1,'product',1,'2013-10-30',1);
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

-- Dump completed on 2013-11-03 23:29:54
