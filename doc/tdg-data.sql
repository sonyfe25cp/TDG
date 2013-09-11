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
INSERT INTO `ProductLine` VALUES (16,'服装，鞋子，包包','Clothing, Shoes & Handbags',0,1),(17,'服装','Clothing',16,2),(18,'儿童，母婴用品和玩具','Kids , Maternity , Baby & Toys and Games',0,1),(19,'美容, 护肤, 美发','Beauty',0,1),(20,'化妆用品','Makeup',19,2),(21,'眼部化妆','Eyes',20,3),(22,'女装','Women’s Clothing',17,3),(23,'鞋子 ','Shoes',16,2),(24,'男装','Men’s Clothing',17,3),(25,'包包','Handbags',16,2),(26,'服饰配件','Accessories',17,3),(27,'内衣','Intimates',17,3),(28,'家居休闲服','Sleep & Lounge',17,3),(29,'泳衣','Swim',17,3),(30,'女鞋','Women’s Shoes',23,3),(31,'男鞋','Men’s Shoes',23,3),(32,'少年鞋','Boys’ Shoes',23,3),(33,'少女鞋','Girls’ Shoes',23,3),(34,'运动鞋和户外鞋','Athletic and Outdoor Shoes',23,3),(35,'鞋子护理与配件','Shoes Care & Accessories',23,3),(36,'女包','Women’s Handbags',25,3),(37,'男包','Men’s Handbags',25,3),(38,'箱包','Luggage',25,3),(39,'书包，其它包和配件','Backpacks, Bags, Cases and Accessories',25,3),(40,'妈妈用品','Maternity Products',18,2),(41,'婴儿用品','Baby Products',18,2),(42,'儿童服装','Kids’ Clothing',18,2),(43,'玩具和游戏','Toys and Games',18,2),(45,'护肤用品','Skincare Products',19,2),(46,'男士护理','Men’s Grooming',19,2),(47,'美发用品','Hair Care',19,2),(48,'香水','Perfume',19,2),(49,'配件和工具','Tools and Accessories',19,2),(50,'孕妇服装','Maternity Clothing',40,3),(51,'孕妇配件','Maternity Accessories',40,3),(52,'妈妈护理/营养 ','Mom’s care',40,3),(53,'婴儿服装','Baby’s Clothing',41,3),(54,'婴儿喂养用品','Baby Health and Food',41,3),(55,'婴儿护理用品','Baby Care',41,3),(56,'男孩服装','Boys’ Clothing',42,3),(57,'女孩服装','Girls’ Clothing',42,3),(58,'婴儿玩具和游戏','Baby’s toys and Games	',43,3),(59,'儿童玩具和游戏','Kids’ toys and Games',43,3),(60,'','',20,3),(61,'','',20,3),(62,'眼部化妆','Eyes',20,3),(63,'唇部化妆','Lips',20,3),(64,'脸部化妆','Face',20,3),(65,'美甲','Nails',20,3),(66,'脸部护理','Face',45,3),(67,'眼部护理','Eyes ',45,3),(68,'唇部护理','Lip Care',45,3),(69,'身体护理','Bath & Body',45,3),(70,'防晒','Sun',45,3),(71,'刮脸','Shave',46,3),(72,'护肤','Skin Care',46,3),(73,'身体护理','Body Care',46,3),(74,'头发护理','Hair Care',46,3),(75,'洗发水','Shampoo',47,3),(76,'护发素','Conditioner',47,3),(77,'造型用品','Styling Products',47,3),(78,'染发用品','Hair Color',47,3),(79,'特别护理','Hair Treatment',47,3),(80,'女士香水','Women’s Perfume',48,3),(81,'男士香水','Men’s Perfume',48,3),(82,'护发工具','Hair Tools',49,3),(83,'化妆工具','Makeup Brushes',49,3),(84,'美甲工具','Nail Tools',49,3),(85,'化妆包','Cosmetics Bags & Cases',49,3),(86,'清洗工具','Cleansing Tools',49,3),(87,'户外运动用品','Outdoor Recreation ',0,1),(88,'户外运动用品','Outdoor Recreation',87,2),(89,'运动服装','Athletic & Outdoor Clothing ',87,2),(90,'健身用品','Fitness & Exercises Products',87,2),(91,'其它运动用品和配件','All other Sports & Outdoors/ Accessories',87,2),(92,'钓鱼和打猎','Fishing and hunting',88,3),(93,'水上和船上运动','Water Sports& Boating',88,3),(94,'爬山','Climbing',88,3),(95,'露营','Camping& Backpacking',88,3),(96,'雪上运动','Snow Sports',88,3),(97,'自行车运动','Cycling',88,3),(98,'高尔夫','Golf',88,3),(99,'男士服装','Men’s Clothing',89,3),(100,'女士服装','Women’s Clothing',89,3),(101,'男孩服装','Boys’ Clothing',89,3),(102,'女孩服装','Girls’ Clothing',89,3),(103,'食品和医药保健品','',0,1),(104,'食品','Grocery & Gourmet Food',103,2),(105,'酒类','Wine',103,2),(106,'卫生医药保健营养品','Health Care',103,2),(107,'早餐','Breakfast Foods',104,3),(108,'零食','Snacks',104,3),(109,'饮料','Beverages',104,3),(110,'有机食品','Organic Foods',104,3),(111,'无面筋食品','Gluten-Free Foods',104,3),(112,'烘焙食品','Baking Products',104,3),(113,'食品套装礼品','Gourmet gift',104,3),(114,'咖啡&茶','Coffee and Tea',104,3),(115,'其它食品','other foods',104,3),(116,'调味料','Herbs, Spices and seasoning',104,3),(117,'储存便捷快速食品','Pantry',104,3),(118,'健康护理（药品）','Health Care',106,3),(119,'维他命&其它元素补给营养品','Vitamin Supplement& Natural Remedies',106,3),(120,'性福产品','Sexual Wellness',106,3),(121,'减肥产品','Weight Management & Dietary Supplement',106,3),(122,'运动营养品','Sports Nutrition',106,3),(123,'个人护理产品','Personal Care',106,3),(124,'家庭医疗护理器材','Health Care Equipments',106,3),(125,'其他','Other Heal Care',106,3),(126,'电子用品','Electronics',0,1),(127,'电子配件','Electronic Accessories',126,2),(128,'电子产品','',126,2),(129,'珠宝首饰，手表和其它配饰','Jewelry, Watch & Accessories',0,1),(130,'家庭用品，车辆用品和游戏产品','Home, Vehicle & Games',0,1),(131,'其它产品','',0,1),(132,'办公以及上学用品','Office & school supplies',131,2),(133,'艺术，工艺 &缝纫','Art, Craft & Sewing',131,2),(134,'工业用品','Industrial Products',131,2),(135,'实验用品','Lab& Scientific',131,2),(136,'乐器','Musical Instruments',131,2),(137,'书籍/杂志/报纸','Books, Magazines & Newspaper',131,2),(138,'音乐/影视/明星/音像','Movies & Music',131,2),(139,'安全设备&安全用品','Safety Equipment & Safety Supplies',131,2),(140,'鲜花&绿植园艺','Flower & Gardening',131,2),(141,'网络设备/网络相关','Internet devices & Supplies',131,2),(142,'个性定制/设计服务/DIY','',131,2),(143,'圣诞用品','Christmas Products',131,2),(144,'家庭用品','Home Supplies',130,2),(145,'床上用品','Bedding',144,3),(146,'住宅家具','Furniture',144,3),(147,'家居饰品','Decorations',144,3),(148,'厨房/餐饮用具','Kitchen & Dining',144,3),(149,'家用配件','Home Hardware',144,3),(150,'室外，阳台，花园用品','Patio, Garden & Outdoor Products',144,3),(151,'家用工具','Tools& Home Improvement',144,3),(152,'家装主材','Building Supplies',144,3),(153,'卫浴/收纳/整理用具','Cleaning, Bathing & Organizing',144,3),(154,'清洁用品','Janitorial Supplies',144,3),(155,'灯&天花板扇','Lighting & Ceiling fans',144,3),(156,'生活用品','Household Supplies',144,3),(157,'艺术品','Fine Art',144,3),(158,'宠物食品和护理','Pet Food and Supplies',130,2),(159,'车辆用品','',130,2),(160,'游戏产品','Digital Games & Software',130,2),(161,'汽车零件和配件','Automotive Parts & Accessories',159,3),(162,'汽车工具及设备','Automotive Tools & Equipment ',159,3),(163,'摩托车用品及配件','motorcycle & Accessories',159,3),(164,'宠物食品','Pet Foods',158,3),(165,'宠物护理用品','Pet Supplies',158,3),(166,'珠宝首饰','Jewelry',129,2),(167,'手表','Watch',129,2),(168,'其它配饰','Accessories',129,2),(169,'男士手表','Men’s Watch',167,3),(170,'女士手表','Women’s Watch',167,3),(171,'戒指','Rings',166,3),(172,'项链','Necklaces',166,3),(173,'手链','Bracelets',166,3),(174,'耳环&耳钉 ','Earrings',166,3),(175,'男士首饰','Men’s Jewelry',166,3),(181,'手机配件','Cell Phone Accessories',127,3),(182,'电脑配件 ','Computer Accessories',127,3),(183,'电脑硬件','Computer parts& Components',127,3),(184,'电脑软件','Software',127,3),(185,'电脑周边','Computer Peripherals',127,3),(186,'闪存卡/U盘/存储/移动硬盘','Memory Card, Flash disk & Hard Drive',127,3),(187,'音乐播放器配件&MP3/MP4配件','Music player& MP3,MP4 Accessories',127,3),(188,'耳机/耳麦','Headphones',127,3),(189,'其它','other',127,3),(190,'电脑 ','Computer (Desktops & Laptops)',128,3),(191,'相机& 摄像机','Camera, Photo& Video',128,3),(192,'影音电器','Home Audio &Theater',128,3),(193,'安全与监控','Security & Surveillance',128,3),(194,'平板电脑','Tablets',128,3),(195,'手机','Cell Phone',128,3),(196,'MP3/MP4/iPod/录音笔','MP3, MP4 Players & Recorder',128,3),(197,'汽车电子用品','Vehicle Electronics',128,3),(198,'打印机&墨','Printers& Ink',128,3),(199,'厨房用品','Kitchen Electronics',128,3),(200,'生活电器','',128,3);
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
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `brand`
--

LOCK TABLES `brand` WRITE;
/*!40000 ALTER TABLE `brand` DISABLE KEYS */;
INSERT INTO `brand` VALUES (1,'adidas','<p>\r\n	hi adidas\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n大大\r\n<p>\r\n	<br />\r\n</p>','1233','12222',0,0,5),(2,'sdfsdf','<p>\r\n	阿斯顿发斯蒂芬等等等\r\n</p>\r\n<p>\r\n	<img src=\"http://api.map.baidu.com/staticimage?center=121.473704%2C31.230393&zoom=11&width=558&height=360&markers=121.473704%2C31.230393&markerStyles=l%2CA\" alt=\"\" /> \r\n</p>','121231231','23123123122ccccc',0,0,5),(3,'12111','123123打','zzzhongwen','zhongweno&nbsp;',0,1,5);
/*!40000 ALTER TABLE `brand` ENABLE KEYS */;
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
) ENGINE=MyISAM AUTO_INCREMENT=10000 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES (1,'chenjie','123123',3,NULL,NULL),(2,'customer','123123',2,NULL,NULL),(3,'xiaoxiao','123123',3,NULL,NULL),(4,'','',3,NULL,NULL),(5,'a','123123',3,NULL,NULL),(6,'admin@noprinter.cn','123123',4,NULL,NULL),(8,'sonyfe25cp@gmail.com','123123',2,'62008054b4d88ZZb277bcee9bd39a69fc111e791dee21e0169042297','6202505c91cbdfh3a3af9c5f714bc4ec6816482311d3ad3169042297');
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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customerAddress`
--

LOCK TABLES `customerAddress` WRITE;
/*!40000 ALTER TABLE `customerAddress` DISABLE KEYS */;
INSERT INTO `customerAddress` VALUES (1,'Chenjie','beijing institue of technology','beijing','China','100081',2),(2,'Chenjie','beiyuan jiayuan, shihuabojun','beijing','China','100081',2),(3,'陈杰','北京理工大学计算中心','北京','中国','100081',1),(4,'陈杰','北京理工大学计算中心406','北京','中国','100081',1),(5,'晓晓','世华泊郡','北京','中国','100081',1),(6,'晓晓','海淀区政府','北京','中国','100081',1),(7,'陈杰','北京理工大学计算中心','北京','中国','100081',8),(8,'123','123','123','123','123',8);
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
  `sku` int(11) DEFAULT NULL,
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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1000006 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item`
--

LOCK TABLES `item` WRITE;
/*!40000 ALTER TABLE `item` DISABLE KEYS */;
INSERT INTO `item` VALUES (25,1001,'Intel',NULL,'','/uploads/images/1376408094700.png',1234,123,NULL,123,123,123,1234,123,34,0,110201,1),(26,101,'裤子',NULL,'20509:28316;1627207:3232483;',NULL,2110,211,NULL,211,12,22,1234,11,35,1,1623,1),(27,102,'裤子',NULL,'20509:28314;1627207:3232481;',NULL,2110,211,NULL,211,12,22,1234,11,35,1,1623,1),(28,103,'裤子',NULL,'20509:28317;1627207:60092;',NULL,2110,211,NULL,211,12,22,1234,11,35,1,1623,1),(29,123123,'裤子',NULL,'20509:28314;1627207:3232484;',NULL,2110,211,NULL,2100,123,123,1234,1231,35,1,1623,1),(30,123221,'Test',NULL,'','/img/product_default.jpg',1234,123,NULL,123,123,123,1234,12,36,0,110201,1),(1000000,10012,'男装',NULL,'','/img/product_default.jpg',123,123,NULL,123,123,123,123,123,1000005,0,24,1),(1000001,10012,'男装',NULL,'','/img/product_default.jpg',123,123,NULL,123,123,123,123,123,1000008,0,24,1),(1000002,10012,'男装',NULL,'','/img/product_default.jpg',123,123,NULL,123,123,123,123,123,1000009,0,24,1),(1000003,123312,'童装',NULL,'','/img/product_default.jpg',123,121,NULL,123,123,123,123,123,1000010,0,24,1),(1000004,123312,'童装',NULL,'','/img/product_default.jpg',123,121,NULL,123,123,123,123,123,1000011,0,24,1),(1000005,2121,'2332',NULL,'','/img/product_default.jpg',123,123,NULL,123,123,123,123,123,1000012,0,68,1);
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
INSERT INTO `notice` VALUES (1,'<h2>\r\n	使用说明：\r\n</h2>\r\n<p>\r\n	1. 必须先配置店铺设定\r\n</p>\r\n<p>\r\n	2. 币种确定后不可再修改\r\n</p>','seller'),(2,'<img src=\"http://api.map.baidu.com/staticimage?center=121.43001%2C31.120649&zoom=11&width=558&height=360&markers=121.43001%2C31.120649&markerStyles=l%2CA\" alt=\"\" />','admin'),(3,'<img src=\"http://api.map.baidu.com/staticimage?center=121.22764%2C31.253117&zoom=11&width=558&height=360&markers=121.22764%2C31.253117&markerStyles=l%2CA\" alt=\"\" />','customer'),(4,'<img src=\"http://api.map.baidu.com/staticimage?center=121.373669%2C31.612007&zoom=11&width=558&height=360&markers=121.373669%2C31.612007&markerStyles=l%2CA\" alt=\"\" />','translator');
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
  `skuId` int(11) DEFAULT NULL,
  `itemId` int(11) DEFAULT NULL,
  `productId` bigint(20) DEFAULT NULL,
  `name` varchar(500) DEFAULT NULL,
  `coinage` int(11) DEFAULT NULL,
  `sellerId` int(11) DEFAULT NULL,
  `num` int(11) DEFAULT NULL,
  `price` float DEFAULT NULL,
  `orderId` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orderItem`
--

LOCK TABLES `orderItem` WRITE;
/*!40000 ALTER TABLE `orderItem` DISABLE KEYS */;
INSERT INTO `orderItem` VALUES (1,1001,7,0,'柯达数码相机',0,0,1,0,1),(2,1001,7,0,'柯达数码相机',0,0,1,0,2),(3,1001,7,0,'柯达数码相机',0,0,1,0,3),(4,1001,7,0,'柯达数码相机',0,0,1,2100,4),(5,1001,7,0,'柯达数码相机',0,0,1,2100,5),(6,1001,7,0,'柯达数码相机',1,1,1,13650,6),(7,1001,7,0,'柯达数码相机',1,1,1,13650,7),(8,22,13,0,'123',0,1,2,123,8),(9,22,13,0,'123',0,1,2,123,9),(10,22,13,0,'123',0,1,2,123,10),(11,1111,22,0,'阿依莲',1,1,1,8021,12),(12,1024,21,0,'Intel',0,1,1,1234,12),(13,1001,25,0,'Intel',0,1,1,1234,13),(14,102,27,0,'裤子',1,1,1,13715,13),(15,1001,25,34,'Intel',0,1,1,1234,14),(16,102,27,35,'裤子',1,1,1,13715,14),(17,1001,25,34,'Intel',0,1,1,1234,15),(18,102,27,35,'裤子',1,1,1,13715,15),(19,123221,30,36,'Test',0,1,1,1234,15);
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
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orderRecord`
--

LOCK TABLES `orderRecord` WRITE;
/*!40000 ALTER TABLE `orderRecord` DISABLE KEYS */;
INSERT INTO `orderRecord` VALUES (1,6,'sonyfe25cp@tdg.com',6,'new order','new order in english','2013-07-29'),(2,7,'陈杰',8,'用户提交订单，等待支付',NULL,'2013-07-29'),(3,8,'123',8,'用户提交订单，等待支付',NULL,'2013-08-05'),(4,9,'123',8,'用户提交订单，等待支付',NULL,'2013-08-05'),(5,10,'陈杰',8,'用户提交订单，等待支付',NULL,'2013-08-11'),(6,12,'陈杰',8,'用户提交订单，等待支付',NULL,'2013-08-13'),(7,13,'陈杰',8,'用户提交订单，等待支付',NULL,'2013-08-13'),(8,13,'陈杰',8,'用户已经支付，等待系统确认',NULL,'2013-08-13'),(9,13,'123',1,'卖家已发货，等待用户查收',NULL,'2013-08-13'),(10,14,'陈杰',8,'用户提交订单，等待支付',NULL,'2013-08-14'),(11,13,'陈杰',8,'用户投诉订单',NULL,'2013-08-14'),(12,14,'陈杰',8,'用户已经支付，等待系统确认','Customer pay the order, waiting for repsonse','2013-08-14'),(13,14,'陈杰',8,'用户投诉该订单','Customer complain this order','2013-08-14'),(14,15,'陈杰',8,'用户提交订单，等待支付','Customer submited the order, waiting for pay money','2013-08-18'),(15,15,'陈杰',8,'用户已经支付，等待系统确认','Customer pay the order, waiting for repsonse','2013-08-18');
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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,0,0,0,NULL,NULL,'apple tv','海淀区政府','北京','中国','100081',1,0,NULL,0,'0',0),(2,0,0,0,NULL,NULL,'陈杰','北京理工大学计算中心406','北京','中国','100081',1,0,NULL,0,'0',0),(3,0,0,0,NULL,NULL,'陈杰','北京理工大学计算中心','北京','中国','100081',1,0,NULL,0,'0',0),(4,0,0,2100,NULL,NULL,'晓晓','世华泊郡','北京','中国','100081',1,0,NULL,0,'0',0),(5,0,0,2100,NULL,NULL,'陈杰','北京理工大学计算中心','北京','中国','100081',8,0,NULL,0,'0',1),(6,0,0,13650,NULL,NULL,'陈杰','北京理工大学计算中心','北京','中国','100081',8,123,'1',0,'0',1),(7,0,0,13650,NULL,NULL,'陈杰','北京理工大学计算中心','北京','中国','100081',8,123,'1',0,'0',1),(8,0,0,123,NULL,NULL,'123','123','123','123','123',8,123,'1',0,'0',1),(9,0,0,123,NULL,NULL,'123','123','123','123','123',8,123,'1',0,'0',1),(10,0,0,123,NULL,NULL,'陈杰','北京理工大学计算中心','北京','中国','100081',8,123,'1',0,NULL,1),(11,0,0,9255,NULL,NULL,'陈杰','北京理工大学计算中心','北京','中国','100081',8,123,'1',0,NULL,1),(12,0,0,9255,NULL,NULL,'陈杰','北京理工大学计算中心','北京','中国','100081',8,123,'1',0,NULL,1),(13,0,0,14949,NULL,'快递：1234','陈杰','北京理工大学计算中心','北京','中国','100081',8,1,'123',0,NULL,10),(14,0,0,14949,NULL,NULL,'陈杰','北京理工大学计算中心','北京','中国','100081',8,1,'123',0,NULL,10),(15,0,0,16183,NULL,NULL,'陈杰','北京理工大学计算中心','北京','中国','100081',8,1,'123',0,NULL,2);
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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1000013 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (1000000,'女装',NULL,'asdfasfasdf',NULL,1,0,0,0,154,100,NULL,123,1234,12345,123,12,1,123,123,'123','/img/product_default.jpg','',NULL,1,1,1,22,16,1),(1000001,'男装',NULL,'阿斯顿发送到',NULL,1,0,0,0,123,123,NULL,123,123,123,123,123,0,123,123,'123','/img/product_default.jpg','',NULL,1,0,1,24,16,1),(1000002,'男装',NULL,'阿斯顿发送到',NULL,1,0,0,0,123,123,NULL,123,123,123,123,123,0,123,123,'123','/img/product_default.jpg','',NULL,1,0,1,24,16,1),(1000003,'男装',NULL,'阿斯顿发送到',NULL,1,0,0,0,123,123,NULL,123,123,123,123,123,0,123,123,'123','/img/product_default.jpg','',NULL,1,0,1,24,16,1),(1000004,'男装',NULL,'阿斯顿发送到',NULL,1,0,0,0,123,123,NULL,123,123,123,123,123,0,123,123,'123','/img/product_default.jpg','',NULL,1,0,1,24,16,1),(1000005,'男装',NULL,'阿斯顿发送到',NULL,1,0,0,0,123,123,NULL,123,123,123,123,123,0,123,123,'123','/img/product_default.jpg','',NULL,0,0,1,24,16,1),(1000006,'男装',NULL,'阿斯顿发送到',NULL,1,0,0,0,123,123,NULL,123,123,123,123,123,0,123,123,'123','/img/product_default.jpg','',NULL,1,0,1,24,16,1),(1000007,'男装',NULL,'阿斯顿发送到',NULL,1,0,0,0,123,123,NULL,123,123,123,123,123,0,123,123,'123','/img/product_default.jpg','',NULL,1,0,1,24,16,1),(1000008,'男装',NULL,'阿斯顿发送到',NULL,1,0,0,0,123,123,NULL,123,123,123,123,123,0,123,123,'123','/img/product_default.jpg','',NULL,0,0,1,24,16,1),(1000009,'男装',NULL,'阿斯顿发送到',NULL,1,0,0,0,123,123,NULL,123,123,123,123,123,0,123,123,'123','/img/product_default.jpg','',NULL,0,0,1,24,16,1),(1000010,'童装',NULL,'',NULL,1,1,223,12,123,121,NULL,123,123,123,123,123,0,123,123,'123','/img/product_default.jpg','',NULL,0,1,1,24,16,1),(1000011,'童装',NULL,'',NULL,2,1,223,12,123,121,NULL,123,123,123,123,123,1,123,123,'123','/img/product_default.jpg','',NULL,0,1,1,24,16,1),(1000012,'2332','zhongwen','123','zhognwenwenwen',4,0,0,0,123,123,NULL,123,123,123,123,123,1,123,123,'123','/img/product_default.jpg','',NULL,0,3,1,68,19,1);
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
) ENGINE=InnoDB AUTO_INCREMENT=10000 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `seller`
--

LOCK TABLES `seller` WRITE;
/*!40000 ALTER TABLE `seller` DISABLE KEYS */;
INSERT INTO `seller` VALUES (1,'seller@tdg.com','123123','123','123','123','123','123','123','12312312312','123','12312312312','123',NULL,NULL,3,NULL),(2,'beijing@123.com','123123','123','123','123','123','123','123','123','123','123','123',NULL,NULL,0,NULL),(3,'asd@123.com','123123','123','123','123','123','123','123','123','123','123','123',NULL,NULL,0,NULL),(4,'aaa@bit.edu.cn','123123','123','123','123','123','123','123','123','123','123','123',NULL,NULL,0,NULL),(5,'ss@bit.edu.cn','123123','123','123','123','123','123','123','123','123','123','123',NULL,NULL,3,'123');
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
  `shippingCountry` varchar(200) DEFAULT NULL,
  `shippingPromiseDays` int(11) DEFAULT NULL,
  `description` text,
  `descriptionInChinese` text,
  `defaultCoinage` int(11) DEFAULT '1',
  `ischinese` int(11) DEFAULT NULL,
  `sellerid` int(11) NOT NULL,
  `title` varchar(100) DEFAULT NULL,
  `titleInChinese` varchar(100) DEFAULT NULL,
  `information` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shopsetting`
--

LOCK TABLES `shopsetting` WRITE;
/*!40000 ALTER TABLE `shopsetting` DISABLE KEYS */;
INSERT INTO `shopsetting` VALUES (2,'美国',7,'撒旦法',NULL,1,NULL,1,'爱TDG',NULL,''),(3,'123',1,'123',NULL,3,NULL,5,'123123',NULL,NULL);
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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `translationTask`
--

LOCK TABLES `translationTask` WRITE;
/*!40000 ALTER TABLE `translationTask` DISABLE KEYS */;
INSERT INTO `translationTask` VALUES (1,1000012,1,1,'product',1,'2013-09-11'),(2,1000011,1,1,'product',0,'2013-09-11'),(3,1,0,1,'brand',1,'2013-09-12'),(4,2,0,1,'brand',1,'2013-09-12'),(5,3,1,1,'brand',1,'2013-09-12');
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
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `translator`
--

LOCK TABLES `translator` WRITE;
/*!40000 ALTER TABLE `translator` DISABLE KEYS */;
INSERT INTO `translator` VALUES (1,'translator@tdg.com','123123',3);
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

-- Dump completed on 2013-09-12  1:45:05
