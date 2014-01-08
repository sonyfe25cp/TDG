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
  `level` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin`
--

LOCK TABLES `admin` WRITE;
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
INSERT INTO `admin` VALUES (1,'admin','123123',0),(2,'admin@bbb.com','123123',0),(3,'dasdfa@112.com','123123',0),(4,'desdf','123123',0);
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
) ENGINE=MyISAM AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `brand`
--

LOCK TABLES `brand` WRITE;
/*!40000 ALTER TABLE `brand` DISABLE KEYS */;
INSERT INTO `brand` VALUES (13,'Bravo','Created in 1900<br />','棒','ABC',0,1,7),(14,'asdf','asdfaadfsda0001','顶顶顶顶','的阿斯顿发斯蒂芬',0,1,6),(15,'adsd','asdfasdfddddasdfasdfasdfd1111112','22','1',0,1,7);
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
) ENGINE=InnoDB AUTO_INCREMENT=109 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart`
--

LOCK TABLES `cart` WRITE;
/*!40000 ALTER TABLE `cart` DISABLE KEYS */;
INSERT INTO `cart` VALUES (87,1000114,10000,1);
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
  `flag` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=68 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `claimItem`
--

LOCK TABLES `claimItem` WRITE;
/*!40000 ALTER TABLE `claimItem` DISABLE KEYS */;
INSERT INTO `claimItem` VALUES (66,'claim',10,1,216,8,3,3,'dd','No comment by Admin',0),(67,'claim',10,1,217,8,3,2,'2',NULL,0);
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
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `country`
--

LOCK TABLES `country` WRITE;
/*!40000 ALTER TABLE `country` DISABLE KEYS */;
INSERT INTO `country` VALUES (1,'USA','美国'),(3,'Japan','日本'),(4,'England','英国'),(6,'Germany','å¾·å½'),(9,'China','中国');
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
) ENGINE=MyISAM AUTO_INCREMENT=10005 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES (1,'chenjie','123123',3,NULL,NULL,NULL),(2,'customer','123123',2,NULL,NULL,NULL),(3,'xiaoxiao','123123',3,NULL,NULL,NULL),(4,'','',3,NULL,NULL,NULL),(5,'a','123123',3,NULL,NULL,NULL),(6,'admin@noprinter.cn','123123',4,NULL,NULL,NULL),(8,'sonyfe25cp@gmail.com','123123',3,'62008054b4d88ZZb277bcee9bd39a69fc111e791dee21e0169042297','6202505c91cbdfh3a3af9c5f714bc4ec6816482311d3ad3169042297','12312312312'),(10000,'buyer@126.com','123123',3,NULL,NULL,'18689424159'),(10001,'tt@tdg.com','123123',1,NULL,NULL,'12312123123'),(10002,'a1@bit.edu.cn','123123',1,NULL,NULL,'12311'),(10003,'buyer@tdg.com','123123',1,NULL,NULL,''),(10004,'aab@123.com','123123',1,NULL,NULL,'');
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
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customerAddress`
--

LOCK TABLES `customerAddress` WRITE;
/*!40000 ALTER TABLE `customerAddress` DISABLE KEYS */;
INSERT INTO `customerAddress` VALUES (21,'beijing','123','3221','China','2212',8,8),(22,'toko','12211','tokyo','Japan','123331',8,3),(23,'ddd','23','1','USA','222',8,1),(24,'CHina','China','China','China','123123',10000,8),(25,'USA','USA','USA','USA','321321',10000,1),(26,'Germany','Germany','Germany','Germany','121212',10000,6),(27,'cj','Beijing Institute of Technology Copyright Address: 5 South Zhongguancun Street, Haidian District, Beijing','beiji','China','10081',8,8),(28,'China','China','China','China','123456',10003,8),(29,'USA','USA','USA','USA','123',10003,1),(30,'Japan','Japan','Japan','Japan','123',10003,3);
/*!40000 ALTER TABLE `customerAddress` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `financeRecord`
--

DROP TABLE IF EXISTS `financeRecord`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `financeRecord` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `unitIds` varchar(500) DEFAULT NULL,
  `createAt` date DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `orderMoney` float DEFAULT NULL,
  `translationMoney` float DEFAULT NULL,
  `storeMoney` float DEFAULT NULL,
  `serviceMoney` float DEFAULT NULL,
  `otherMoney` float DEFAULT NULL,
  `totalGetFromAdmin` float DEFAULT NULL,
  `totalPayAdmin` float DEFAULT NULL,
  `total` float DEFAULT NULL,
  `receiver` varchar(500) DEFAULT NULL,
  `coinage` int(11) DEFAULT '0',
  `beginDate` date DEFAULT NULL,
  `endDate` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=271 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `financeRecord`
--

LOCK TABLES `financeRecord` WRITE;
/*!40000 ALTER TABLE `financeRecord` DISABLE KEYS */;
INSERT INTO `financeRecord` VALUES (261,NULL,'2014-01-08',4,0,0,0,0,0,0,0,0,'seller-10004',1,'2014-01-08','2014-01-09'),(262,NULL,'2014-01-08',4,0,0,0,0,0,0,0,0,'seller-10003',1,'2014-01-08','2014-01-09'),(263,NULL,'2014-01-08',4,0,0,0,0,0,0,0,0,'seller-10002',1,'2014-01-08','2014-01-09'),(264,NULL,'2014-01-08',4,0,0,0,0,0,0,0,0,'seller-10001',3,'2014-01-08','2014-01-09'),(265,NULL,'2014-01-08',4,0,0,0,0,0,0,0,0,'seller-10000',2,'2014-01-08','2014-01-09'),(266,NULL,'2014-01-08',4,0,0,0,0,0,0,0,0,'seller-5',0,'2014-01-08','2014-01-09'),(267,NULL,'2014-01-08',4,0,0,0,0,0,0,0,0,'seller-4',0,'2014-01-08','2014-01-09'),(268,NULL,'2014-01-08',4,0,0,0,0,0,0,0,0,'seller-3',0,'2014-01-08','2014-01-09'),(269,NULL,'2014-01-08',4,0,0,0,0,0,0,0,0,'seller-2',0,'2014-01-08','2014-01-09'),(270,'424,423,','2014-01-08',0,20,0,0,3,0,20,3,17,'seller-1',1,'2014-01-08','2014-01-09');
/*!40000 ALTER TABLE `financeRecord` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `financeUnit`
--

DROP TABLE IF EXISTS `financeUnit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `financeUnit` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `receiver` varchar(100) DEFAULT NULL,
  `sender` varchar(100) DEFAULT NULL,
  `money` float DEFAULT NULL,
  `createAt` datetime DEFAULT NULL,
  `financeType` int(11) DEFAULT NULL,
  `relatedId` int(11) DEFAULT NULL,
  `relatedType` varchar(45) DEFAULT NULL,
  `status` int(11) DEFAULT '0',
  `comment` varchar(500) DEFAULT NULL,
  `over` int(11) DEFAULT '0',
  `coinage` int(11) DEFAULT '0',
  `financeDetailsType` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=471 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `financeUnit`
--

LOCK TABLES `financeUnit` WRITE;
/*!40000 ALTER TABLE `financeUnit` DISABLE KEYS */;
INSERT INTO `financeUnit` VALUES (422,'admin','customer-8',123.5,'2014-01-08 00:06:31',1,216,'order',0,NULL,0,5,11),(423,'seller-1','admin',20,'2014-01-08 00:06:31',1,216,'order',2,NULL,0,1,11),(424,'admin','seller-1',3,'2014-01-08 00:06:31',4,216,'order',2,NULL,0,1,41),(425,'customer-8','admin',18.525,'2014-01-08 00:36:23',1,216,'order',0,NULL,0,5,13),(426,'admin','seller-1',3,'2014-01-08 00:36:23',1,216,'order',0,NULL,0,1,13),(427,'seller-1','admin',0.45,'2014-01-08 00:36:23',4,216,'order',0,NULL,0,1,42),(428,'admin','customer-8',61.75,'2014-01-08 00:38:37',1,217,'order',0,NULL,0,5,11),(429,'seller-1','admin',10,'2014-01-08 00:38:37',1,217,'order',0,NULL,0,1,11),(430,'admin','seller-1',1.5,'2014-01-08 00:38:37',4,217,'order',0,NULL,0,1,41),(431,'customer-8','admin',61.75,'2014-01-08 00:40:56',1,217,'order',0,NULL,0,5,13),(432,'admin','seller-1',10,'2014-01-08 00:40:56',1,217,'order',0,NULL,0,1,13),(433,'seller-1','admin',1.5,'2014-01-08 00:40:56',4,217,'order',0,NULL,0,1,42),(434,'admin','customer-8',2470,'2014-01-08 00:46:18',1,218,'order',0,NULL,0,5,11),(435,'seller-1','admin',400,'2014-01-08 00:46:18',1,218,'order',0,NULL,0,1,11),(436,'admin','seller-1',60,'2014-01-08 00:46:18',4,218,'order',0,NULL,0,1,41),(437,'translator-1','admin',0,'2014-01-08 21:57:31',2,71,'translationTask',0,NULL,0,5,21),(438,'admin','seller-1',0,'2014-01-08 21:57:31',2,71,'translationTask',0,NULL,0,1,21),(439,'translator-1','admin',0,'2014-01-08 21:57:39',2,70,'translationTask',0,NULL,0,5,21),(440,'admin','seller-1',0,'2014-01-08 21:57:39',2,70,'translationTask',0,NULL,0,1,21),(441,'translator-1','admin',0,'2014-01-08 21:57:55',2,71,'translationTask',0,NULL,0,5,22),(442,'admin','seller-1',0,'2014-01-08 21:57:55',2,71,'translationTask',0,NULL,0,1,22),(443,'translator-1','admin',0,'2014-01-08 22:04:21',2,72,'translationTask',0,NULL,0,5,21),(444,'admin','seller-1',0,'2014-01-08 22:04:21',2,72,'translationTask',0,NULL,0,1,21),(445,'translator-1','admin',0,'2014-01-08 22:07:21',2,73,'translationTask',0,NULL,0,5,21),(446,'admin','seller-1',0,'2014-01-08 22:07:21',2,73,'translationTask',0,NULL,0,1,21),(447,'admin','customer-8',48906,'2014-01-08 22:13:44',1,219,'order',0,NULL,0,5,11),(448,'seller-1','admin',7920,'2014-01-08 22:13:44',1,219,'order',0,NULL,0,1,11),(449,'admin','seller-1',1188,'2014-01-08 22:13:44',4,219,'order',0,NULL,0,1,41),(450,'admin','customer-8',12350,'2014-01-08 22:28:40',1,221,'order',0,NULL,0,5,11),(451,'seller-1','admin',2000,'2014-01-08 22:28:40',1,221,'order',0,NULL,0,1,11),(452,'admin','seller-1',300,'2014-01-08 22:28:41',4,221,'order',0,NULL,0,1,41),(453,'admin','customer-8',12350,'2014-01-08 22:54:14',1,222,'order',0,NULL,0,5,11),(454,'seller-1','admin',2000,'2014-01-08 22:54:14',1,222,'order',0,NULL,0,1,11),(455,'admin','seller-1',300,'2014-01-08 22:54:14',4,222,'order',0,NULL,0,1,41),(456,'admin','customer-8',12350,'2014-01-08 22:59:12',1,223,'order',0,NULL,0,5,11),(457,'seller-1','admin',2000,'2014-01-08 22:59:12',1,223,'order',0,NULL,0,1,11),(458,'admin','seller-1',300,'2014-01-08 22:59:12',4,223,'order',0,NULL,0,1,41),(459,'admin','customer-8',12350,'2014-01-08 23:01:16',1,224,'order',0,NULL,0,5,11),(460,'seller-1','admin',2000,'2014-01-08 23:01:16',1,224,'order',0,NULL,0,1,11),(461,'admin','seller-1',300,'2014-01-08 23:01:16',4,224,'order',0,NULL,0,1,41),(462,'admin','customer-8',37050,'2014-01-08 23:02:56',1,225,'order',0,NULL,0,5,11),(463,'seller-1','admin',6000,'2014-01-08 23:02:56',1,225,'order',0,NULL,0,1,11),(464,'admin','seller-1',900,'2014-01-08 23:02:56',4,225,'order',0,NULL,0,1,41),(465,'admin','customer-8',37050,'2014-01-08 23:06:09',1,226,'order',0,NULL,0,5,11),(466,'seller-1','admin',6000,'2014-01-08 23:06:09',1,226,'order',0,NULL,0,1,11),(467,'admin','seller-1',900,'2014-01-08 23:06:09',4,226,'order',0,NULL,0,1,41),(468,'admin','customer-8',37050,'2014-01-08 23:15:05',1,227,'order',0,NULL,0,5,11),(469,'seller-1','admin',6000,'2014-01-08 23:15:05',1,227,'order',0,NULL,0,1,11),(470,'admin','seller-1',900,'2014-01-08 23:15:05',4,227,'order',0,NULL,0,1,41);
/*!40000 ALTER TABLE `financeUnit` ENABLE KEYS */;
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
  `sellable` int(11) DEFAULT '6',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1000115 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item`
--

LOCK TABLES `item` WRITE;
/*!40000 ALTER TABLE `item` DISABLE KEYS */;
INSERT INTO `item` VALUES (1000072,'','测试不带子产品','测试不带子产品商品','','/uploads/images/1383582910551.jpg',341,330,'2013-11-06',0,0,1,348,22,1000060,2,31,10000,'2013-11-20',1,8,1,21,3,3,16,6),(1000073,'001','Test with many children','测试带子产品商品','\"color\":\"red\",\"size\":\"21\"','/uploads/images/1383583110170.jpg',455,345,'2013-11-04',300,50,200,347,2,1000061,2,168,10000,'2013-11-22',1,8,0,0,0,3,129,6),(1000074,'002','Test with many children','测试带子产品商品','\"color\":\"red\",\"size\":\"33\"','/uploads/images/1383583120391.jpg',455,345,'2013-11-04',300,50,200,351,2,1000061,2,168,10000,'2013-11-22',1,8,0,0,0,3,129,6),(1000075,'003','Test with many children','测试带子产品商品','\"color\":\"blue\",\"size\":\"22\"','/uploads/images/1383583132473.jpg',455,345,'2013-11-04',300,50,200,339,2,1000061,2,168,10000,'2013-11-22',1,8,0,0,0,3,129,6),(1000076,'005','Test with many children','测试带子产品商品','\"color\":\"red\",\"size\":\"33\"','undefined',455,345,'2013-11-04',300,50,200,340,2,1000061,2,168,10000,'2013-11-22',1,8,0,0,0,3,129,6),(1000077,'222','Test with many children','测试带子产品商品','\"color\":\"red\",\"size\":\"43\"','/uploads/images/1383584092736.jpg',455,341,'2013-11-04',300,50,200,351,2,1000061,2,168,10000,'2013-11-22',1,8,0,0,0,3,129,6),(1000078,'','测试推广','测试推广价格时间','','/uploads/images/1384704060653.jpg',500,400,'2013-11-18',0,0,0,250,5,1000062,1,31,1,'2013-11-18',1,8,0,0,0,1,16,6),(1000079,'','ceshituiguang','测试推广2222','','/uploads/images/1384704964447.jpg',600,300,'2013-11-18',0,0,50,211,5,1000063,2,67,10000,'2013-11-18',1,8,0,0,0,3,19,6),(1000080,'','111','新任务1','','/uploads/images/1384706095957.jpg',123,100,'2013-11-18',0,0,2,10,5,1000064,2,69,10000,'2013-11-19',1,8,0,0,0,3,19,6),(1000081,'233','safa','翻译112312','\"color\":\"red\",\"size\":\"22\"','/uploads/images/1384706601134.jpg',123,100,'2013-11-18',111,20,90,1999,5,1000065,2,68,10000,'2013-11-20',1,0,0,0,0,3,19,6),(1000082,'ddd','asdf',NULL,'\"color\":\"red\",\"size\":\"222\"','/uploads/images/1384707060543.jpg',233,200,'2013-11-18',0,0,55,2222,5,1000066,2,90,10000,'2013-11-20',1,8,0,0,0,3,87,6),(1000083,'ede','dews',NULL,'\"color\":\"ede\",\"size\":\"21\"','/uploads/images/1384707299077.jpg',2221,111,'2013-11-18',221,14,333,333,5,1000067,2,91,10000,'2013-11-19',1,8,1,2,3,3,87,6),(1000084,'','adfa','居然翻译的不行','','/uploads/images/1385397151778.jpg',123123,122,'2013-11-12',0,0,0,221,5,1000068,2,55,10000,'2013-11-28',1,8,0,0,0,3,18,6),(1000085,'A','seller Special care','Seller 特殊护理1','\"color\":\"Red\",\"size\":\"11\"','/uploads/images/1385446660801.JPG',101,91,'2013-11-26',12,101,301,0,5,1000071,1,79,1,'2013-11-26',1,8,1,12,15,1,19,6),(1000086,'B','seller Special care','Seller 特殊护理1','\"color\":\"Blue\",\"size\":\"13\"','/uploads/images/1385446769473.JPG',99,90,'2013-11-26',11,100,300,1,5,1000071,1,79,1,'2013-11-26',1,8,1,12,15,1,19,6),(1000087,'C','seller Special care','Seller 特殊护理1','\"color\":\"Green\",\"size\":\"14\"','/uploads/images/1385446899737.JPG',10,9,'2013-11-26',1,10,30,44,5,1000071,1,79,1,'2013-11-26',1,8,1,12,15,1,19,6),(1000088,'D','seller Special care','Seller 特殊护理1','\"color\":\"Yellow\",\"size\":\"14\"','/uploads/images/1385447191424.JPG',105,95,'2013-11-26',15,105,305,505,5,1000071,1,79,1,'2013-11-26',1,8,1,12,15,1,19,6),(1000089,'D','seller Special care','Seller 特殊护理1','\"color\":\"Yellow\",\"size\":\"14\"','/uploads/images/1385447191424.JPG',105,95,'2013-11-26',15,105,305,505,5,1000071,1,79,1,'2013-11-26',1,8,1,12,15,1,19,6),(1000090,'D','seller Special care','Seller 特殊护理1','\"color\":\"Yellow\",\"size\":\"14\"','/uploads/images/1385447264422.JPG',105,95,'2013-11-26',15,105,305,505,5,1000071,1,79,1,'2013-11-26',1,8,1,12,15,1,19,6),(1000091,'ABC','seller Special care2','Seller特殊护理2','','/uploads/images/1385447860935.JPG',100,90,'2013-11-26',11,100,300,491,5,1000070,1,79,1,'2013-11-26',1,8,1,12,15,1,19,6),(1000092,'RedL','Seller Shoe Parent ','Seller 鞋父商品','\"color\":\"Red\",\"size\":\"L\"','/uploads/images/1385540584284.JPG',100,90,'2013-11-27',88,20,300,0,5,1000072,1,32,1,'2013-11-28',1,8,0,0,0,1,16,6),(1000093,'RedS','Seller Shoe Parent ','Seller 鞋父商品','\"color\":\"Red\",\"size\":\"S\"','/uploads/images/1385540670312.JPG',100,99,'2013-11-27',88,20,300,100,5,1000072,1,32,1,'2013-11-28',1,8,0,0,0,1,16,6),(1000094,'BlueL','Seller Shoe Parent ','Seller 鞋父商品','\"color\":\"Blue\",\"size\":\"L\"','/uploads/images/1385540703032.JPG',100,99,'2013-11-27',88,20,300,378,5,1000072,1,32,1,'2013-11-28',1,8,0,0,0,1,16,6),(1000095,'BlueS','Seller Shoe Parent ','Seller 鞋父商品','\"color\":\"Blue\",\"size\":\"S\"','/uploads/images/1385540744253.JPG',100,99,'2013-11-27',88,20,300,380,5,1000072,1,32,1,'2013-11-28',1,8,0,0,0,1,16,6),(1000096,'ddd','测试折扣','Test 折扣价格','','/uploads/images/1386257035206.jpg',200,150,'2013-12-05',0,0,0,296,5,1000073,2,26,10000,'2013-12-05',1,8,1,154,2,3,16,6),(1000097,'','鞋父1222','翻译完成咯','','/uploads/images/1388073961210.jpg',100,0,NULL,0,0,0,25,5,1000074,2,57,10000,NULL,1,8,0,0,0,3,18,6),(1000098,'123','HandBag11','手包11','\"color\":\"Red\",\"size\":\"1\"','/uploads/images/1388410147281.JPG',100,90,'2013-12-30',80,10,100,89,2,1000075,1,39,1,'2013-12-30',1,8,1,12,12,1,16,6),(1000099,'345','HandBag11','手包11','\"color\":\"Red\",\"size\":\"2\"','/uploads/images/1388410258742.JPG',100,90,'2013-12-30',80,10,100,100,2,1000075,1,39,1,'2013-12-30',1,8,1,12,12,1,16,6),(1000100,'678','HandBag11','手包11','\"color\":\"Blue\",\"size\":\"1\"','/uploads/images/1388388596026.JPG',100,90,'2013-12-30',70,10,100,200,2,1000075,1,39,1,'2013-12-30',1,8,1,12,12,1,16,6),(1000101,'123','Handbags','手包12','','/uploads/images/1388388713018.JPG',100,90,'2013-12-30',80,30,50,366,5,1000076,1,39,1,'2013-12-31',1,8,0,0,0,1,16,6),(1000102,'ABC','Test Fitness ','测试测试','\"color\":\"White\",\"size\":\"12\"','/uploads/images/1388480981947.JPG',100,90,'2013-12-31',80,10,50,300,5,1000077,1,120,10004,'2014-01-01',1,8,1,12,13,1,103,6),(1000103,'ABC','Test Fitness ','测试测试','\"color\":\"White\",\"size\":\"13\"','undefined',100,50,'2013-12-31',80,10,50,300,5,1000077,1,120,10004,'2014-01-01',1,8,1,12,13,1,103,6),(1000104,'123','Test Fitness ','测试测试','\"size\":\"15\"','/uploads/images/1388481047725.JPG',100,80,'2013-12-31',80,10,50,299,5,1000077,1,120,10004,'2014-01-01',1,8,1,12,13,1,103,6),(1000105,'','Price Test','价格测试','','/uploads/images/1388488239195.JPG',100,40,'2013-12-31',80,30,100,161,5,1000078,1,192,10004,'2014-01-01',1,8,0,0,0,1,126,6),(1000106,'','ABC',NULL,'','/uploads/images/1388489904966.JPG',100,0,NULL,0,0,0,50,5,1000079,1,122,1,NULL,1,8,0,0,0,1,103,6),(1000107,'ABC','seller Special care','特殊护理测试','','/uploads/images/1385446094356.JPG',100,90,'2013-11-26',11,100,300,500,5,1000069,1,79,1,'2013-11-26',1,8,1,12,15,1,19,6),(1000108,'a11','ShoesWithoutChildren','没有子产品的鞋子','','/uploads/images/1388769550670.jpg',400,380,'2014-01-04',0,0,0,394,5,1000080,1,24,1,'2014-01-05',1,8,1,1.5,2,1,16,6),(1000109,'a001','ShoesWithChildren','有子产品的鞋子','\"color\":\"red\",\"size\":\"11\"','/uploads/images/1388769687735.jpg',350,300,'2014-01-04',310,30,50,491,5,1000081,1,35,1,'2014-01-14',1,8,1,2,3,1,16,6),(1000110,'a002','ShoesWithChildren','有子产品的鞋子','\"color\":\"blue\",\"size\":\"12\"','/uploads/images/1388769699238.jpg',350,300,'2014-01-04',310,30,50,499,5,1000081,1,35,1,'2014-01-14',1,8,1,2,3,1,16,6),(1000111,'a004','ShoesWithChildren','有子产品的鞋子','\"color\":\"red\",\"size\":\"14\"','/uploads/images/1388769721236.jpg',350,300,'2014-01-04',310,30,50,0,5,1000081,1,35,1,'2014-01-14',0,8,1,2,3,1,16,7),(1000112,'a005','ShoesWithChildren','有子产品的鞋子','\"color\":\"blue\",\"size\":\"11\"','/uploads/images/1388769740736.jpg',350,300,'2014-01-04',310,30,50,500,5,1000081,1,35,1,'2014-01-14',1,8,1,2,3,1,16,6),(1000113,'','ABC','ABC','','undefined',100,90,'2014-01-04',80,30,100,0,5,1000082,1,31,1,'2014-01-05',1,8,1,15,15,1,16,7),(1000114,'123','Test1','','','/uploads/images/1388929420229.JPG',10,9,'2014-01-05',8,30,0,188,5,1000083,1,168,1,'2014-01-06',1,8,0,0,0,1,129,6);
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
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `message`
--

LOCK TABLES `message` WRITE;
/*!40000 ALTER TABLE `message` DISABLE KEYS */;
INSERT INTO `message` VALUES (1,'1','2','seller',0,'2013-07-24 00:00:00',8,'2013-07-30 00:00:00'),(2,'1','23','customer',1,'2013-07-24 00:00:00',NULL,NULL),(3,'阿道夫1','123123','customer',8,'2013-07-29 00:00:00',9,'2013-10-31 00:00:00'),(4,'123','123122','seller',1,'2013-07-29 00:00:00',7,'2013-07-30 00:00:00'),(5,'asdfasdf','asdfasdfsdaf\r\nasd\r\nf\r\nasdf\r\nas\r\ndf\r\n','admin',1,'2013-07-30 00:00:00',NULL,NULL),(6,'asdfa','asdd','admin',1,'2013-07-30 00:00:00',NULL,NULL),(7,'asdfa','asdf','admin',1,'2013-07-30 00:00:00',NULL,NULL),(8,'asdf','asdfasf','admin',1,'2013-07-30 00:00:00',NULL,NULL),(9,'sdf','asdfasdf','admin',1,'2013-10-31 00:00:00',NULL,NULL),(10,'asaaaaa','aaaaaaaaa','seller',1,'2013-10-31 00:00:00',11,'2013-10-31 00:00:00'),(11,'asdfasdfasdf','a3234123123','admin',1,'2013-10-31 00:00:00',NULL,NULL),(12,'asdfasdfddddddd','12312231231231','translator',0,'2013-10-31 00:00:00',13,'2013-10-31 00:00:00'),(13,'aaaaa','eeee','admin',1,'2013-10-31 00:00:00',NULL,NULL),(14,'esd','aa','translator',0,'2013-10-31 00:00:00',NULL,NULL),(15,'ddd','e12','translator',0,'2013-10-31 00:31:22',NULL,NULL),(16,'投诉','订单号：\r\n货不对板。','customer',10000,'2013-11-27 17:31:17',17,'2013-11-27 17:36:51'),(17,'投诉','我们正在联系商户。请耐心等待。','admin',1,'2013-11-27 17:36:51',NULL,NULL),(18,'123','123','customer',8,'2013-12-29 22:49:52',19,'2013-12-29 22:50:15'),(19,'123','22222','admin',1,'2013-12-29 22:50:15',NULL,NULL);
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
  `categoryId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=265 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orderItem`
--

LOCK TABLES `orderItem` WRITE;
/*!40000 ALTER TABLE `orderItem` DISABLE KEYS */;
INSERT INTO `orderItem` VALUES (125,1000072,1000060,'测试不带子产品',2,10000,2,341,94,1,21,3,3,'aa2',3239.5,199.5,'测试不带子产品商品',NULL,170.5,1619.75,'',0.5,1619.75,1619.75,3239.5,341,NULL),(126,1000073,1000061,'Test with many children',2,10000,4,345,95,0,0,0,3,'001',3277.5,0,'测试带子产品商品',NULL,0,0,'\"颜色\":\"red\",\"尺寸\":\"21\"',0,3277.5,3277.5,13110,1380,NULL),(127,1000075,1000061,'Test with many children',2,10000,1,345,95,0,0,0,3,'003',3277.5,0,'测试带子产品商品',NULL,0,0,'\"颜色\":\"blue\",\"尺寸\":\"22\"',0,3277.5,3277.5,3277.5,345,NULL),(128,1000072,1000060,'测试不带子产品',2,10000,2,330,96,1,0,3,3,'',3135,0,'测试不带子产品商品',NULL,165,1567.5,'',0.5,1567.5,1567.5,3135,330,NULL),(129,1000072,1000060,'测试不带子产品',2,10000,1,330,97,1,0,3,3,'',3135,0,'测试不带子产品商品',NULL,165,1567.5,'',0.5,1567.5,1567.5,1567.5,165,NULL),(130,1000072,1000060,'测试不带子产品',2,10000,1,330,98,1,0,3,3,'',3135,0,'测试不带子产品商品',NULL,165,1567.5,'',0.5,1567.5,1567.5,1567.5,165,NULL),(131,1000076,1000061,'Test with many children',2,10000,1,345,99,0,0,0,3,'005',3277.5,0,'测试带子产品商品',NULL,0,0,'\"颜色\":\"red\",\"尺寸\":\"33\"',0,3277.5,3277.5,3277.5,345,NULL),(132,1000075,1000061,'Test with many children',2,10000,2,345,100,0,0,0,3,'003',3277.5,0,'测试带子产品商品',NULL,0,0,'\"颜色\":\"blue\",\"尺寸\":\"22\"',0,3277.5,3277.5,6555,690,NULL),(133,1000076,1000061,'Test with many children',2,10000,1,345,101,0,0,0,3,'005',3277.5,0,'测试带子产品商品',NULL,0,0,'\"颜色\":\"red\",\"尺寸\":\"33\"',0,3277.5,3277.5,3277.5,345,NULL),(134,1000075,1000061,'Test with many children',2,10000,4,345,102,0,0,0,3,'003',3277.5,0,'测试带子产品商品',NULL,0,0,'\"颜色\":\"blue\",\"尺寸\":\"22\"',0,3277.5,3277.5,13110,1380,NULL),(135,1000075,1000061,'Test with many children',2,10000,1,345,103,0,0,0,3,'003',3277.5,0,'测试带子产品商品',NULL,0,0,'\"颜色\":\"blue\",\"尺寸\":\"22\"',0,3277.5,3277.5,3277.5,345,NULL),(136,1000076,1000061,'Test with many children',2,10000,5,345,104,0,0,0,3,'005',3277.5,0,'测试带子产品商品',NULL,0,0,'\"颜色\":\"red\",\"尺寸\":\"33\"',0,3277.5,3277.5,16387.5,1725,NULL),(137,1000076,1000061,'Test with many children',2,10000,1,345,105,0,0,0,3,'005',3277.5,0,'测试带子产品商品',NULL,0,0,'\"颜色\":\"red\",\"尺寸\":\"33\"',0,3277.5,3277.5,3277.5,345,NULL),(138,1000076,1000061,'Test with many children',2,10000,1,345,106,0,0,0,3,'005',3277.5,0,'测试带子产品商品',NULL,0,0,'\"颜色\":\"red\",\"尺寸\":\"33\"',0,3277.5,3277.5,3277.5,345,NULL),(139,1000079,1000063,'ceshituiguang',2,10000,45,600,107,0,0,0,3,'',5700,0,'测试推广2222',NULL,0,0,'',0,5700,5700,256500,27000,NULL),(140,1000079,1000063,'ceshituiguang',2,10000,4,300,108,0,0,0,3,'',2850,0,'测试推广2222',NULL,0,0,'',0,2850,2850,11400,1200,NULL),(141,1000080,1000064,'111',2,10000,2,100,109,0,0,0,3,'',950,0,'新任务1',NULL,0,0,'',0,950,950,1900,200,NULL),(142,1000091,1000070,'seller Special care2',1,1,1,90,110,1,12,15,1,'ABC',585,78,'Seller特殊护理2',NULL,0,0,'',0,585,585,585,90,NULL),(143,1000085,1000071,'seller Special care',1,1,10,90,111,1,12,15,1,'A',585,78,'Seller 特殊护理1',NULL,0,0,'\"颜色\":\"Red\",\"尺寸\":\"11\"',0,585,585,5850,900,NULL),(144,1000086,1000071,'seller Special care',1,1,10,90,112,1,0,15,1,'B',585,0,'Seller 特殊护理1',NULL,0,0,'\"颜色\":\"Blue\",\"尺寸\":\"13\"',0,585,585,5850,900,NULL),(145,1000086,1000071,'seller Special care',1,1,8,90,113,1,0,15,1,'B',585,0,'Seller 特殊护理1',NULL,0,0,'\"颜色\":\"Blue\",\"尺寸\":\"13\"',0,585,585,4680,720,NULL),(146,1000086,1000071,'seller Special care',1,1,1,90,114,1,0,15,1,'B',585,0,'Seller 特殊护理1',NULL,0,0,'\"颜色\":\"Blue\",\"尺寸\":\"13\"',0,585,585,585,90,NULL),(147,1000087,1000071,'seller Special care',1,1,1,9,115,1,0,15,1,'C',58.5,0,'Seller 特殊护理1',NULL,0,0,'\"颜色\":\"Green\",\"尺寸\":\"14\"',0,58.5,58.5,58.5,9,NULL),(148,1000085,1000071,'seller Special care',1,1,10,101,116,1,12,15,1,'A',656.5,78,'Seller 特殊护理1',NULL,0,0,'\"颜色\":\"Red\",\"尺寸\":\"11\"',0,656.5,656.5,6565,1010,NULL),(149,1000092,1000072,'Seller Shoe Parent ',1,1,2,99,117,0,0,0,1,'RedL',643.5,0,'Seller 鞋父商品',NULL,49.5,321.75,'\"颜色\":\"Red\",\"尺寸\":\"L\"',0.5,321.75,321.75,643.5,99,NULL),(150,1000092,1000072,'Seller Shoe Parent ',1,1,1,100,118,0,0,0,1,'RedL',650,0,'Seller 鞋父商品',NULL,50,325,'\"颜色\":\"Red\",\"尺寸\":\"L\"',0.5,325,325,325,50,NULL),(151,1000092,1000072,'Seller Shoe Parent ',1,1,299,88,119,0,0,0,1,'RedL',572,0,'Seller 鞋父商品',NULL,44,286,'\"颜色\":\"Red\",\"尺寸\":\"L\"',0.5,286,286,85514,13156,NULL),(152,1000092,1000072,'Seller Shoe Parent ',1,1,290,88,120,0,0,0,1,'RedL',572,0,'Seller 鞋父商品',NULL,44,286,'\"颜色\":\"Red\",\"尺寸\":\"L\"',0.5,286,286,82940,12760,NULL),(153,1000094,1000072,'Seller Shoe Parent ',1,1,300,88,121,0,0,0,1,'BlueL',572,0,'Seller 鞋父商品',NULL,44,286,'\"颜色\":\"Blue\",\"尺寸\":\"L\"',0.5,286,286,85800,13200,NULL),(154,1000085,1000071,'seller Special care',1,1,1,101,122,1,12,15,1,'A',656.5,78,'Seller 特殊护理1',NULL,0,0,'\"颜色\":\"Red\",\"尺寸\":\"11\"',0,656.5,656.5,656.5,101,NULL),(155,1000094,1000072,'Seller Shoe Parent ',1,1,2,100,123,0,0,0,1,'BlueL',650,0,'Seller 鞋父商品',NULL,50,325,'\"颜色\":\"Blue\",\"尺寸\":\"L\"',0.5,325,325,650,100,NULL),(156,1000085,1000071,'seller Special care',1,1,291,12,124,1,0,15,1,'A',78,0,'Seller 特殊护理1',NULL,0,0,'\"颜色\":\"Red\",\"尺寸\":\"11\"',0,78,78,22698,3492,NULL),(157,1000085,1000071,'seller Special care',1,1,290,12,125,1,0,15,1,'A',78,0,'Seller 特殊护理1',NULL,0,0,'\"颜色\":\"Red\",\"尺寸\":\"11\"',0,78,78,22620,3480,NULL),(158,1000085,1000071,'seller Special care',1,1,1,101,126,1,0,15,1,'A',656.5,0,'Seller 特殊护理1',NULL,0,0,'\"颜色\":\"Red\",\"尺寸\":\"11\"',0,656.5,656.5,656.5,101,NULL),(159,1000085,1000071,'seller Special care',1,1,1,101,127,1,0,15,1,'A',656.5,0,'Seller 特殊护理1',NULL,0,0,'\"颜色\":\"Red\",\"尺寸\":\"11\"',0,656.5,656.5,656.5,101,NULL),(160,1000087,1000071,'seller Special care',1,1,1,10,128,1,0,15,1,'C',65,0,'Seller 特殊护理1',NULL,0,0,'\"颜色\":\"Green\",\"尺寸\":\"14\"',0,65,65,65,10,NULL),(161,1000087,1000071,'seller Special care',1,1,2,10,129,1,12,15,1,'C',65,78,'Seller 特殊护理1',NULL,0,0,'\"颜色\":\"Green\",\"尺寸\":\"14\"',0,65,65,130,20,NULL),(162,1000091,1000070,'seller Special care2',1,1,2,100,130,1,0,15,1,'ABC',650,0,'Seller特殊护理2',NULL,0,0,'',0,650,650,1300,200,NULL),(163,1000091,1000070,'seller Special care2',1,1,1,100,131,1,12,15,1,'ABC',650,78,'Seller特殊护理2',NULL,0,0,'',0,650,650,650,100,NULL),(164,1000096,1000073,'测试折扣',2,10000,2,150,131,1,154,2,3,'ddd',1425,1463,'Test 折扣价格',NULL,75,712.5,'',0.5,712.5,712.5,1425,150,NULL),(165,1000091,1000070,'seller Special care2',1,1,1,100,132,1,12,15,1,'ABC',650,78,'Seller特殊护理2',NULL,0,0,'',0,650,650,650,100,NULL),(166,1000096,1000073,'测试折扣',2,10000,2,150,133,1,154,2,3,'ddd',1425,1463,'Test 折扣价格',NULL,75,712.5,'',0.5,712.5,712.5,1425,150,NULL),(167,1000081,1000065,'safa',2,10000,1,123,134,0,0,0,3,'233',1168.5,0,'翻译112312',NULL,0,0,'\"颜色\":\"red\",\"尺寸\":\"22\"',0,1168.5,1168.5,1168.5,123,NULL),(168,1000096,1000073,'测试折扣',2,10000,1,200,134,1,0,2,3,'ddd',1900,0,'Test 折扣价格',NULL,100,950,'',0.5,950,950,950,100,NULL),(169,1000096,1000073,'测试折扣',2,10000,1,200,135,1,0,2,3,'ddd',1900,0,'Test 折扣价格',NULL,100,950,'',0.5,950,950,950,100,NULL),(170,1000096,1000073,'测试折扣',2,10000,1,200,136,1,0,2,3,'ddd',1900,0,'Test 折扣价格',NULL,100,950,'',0.5,950,950,950,100,NULL),(171,1000096,1000073,'测试折扣',2,10000,2,200,137,1,0,2,3,'ddd',1900,0,'Test 折扣价格',NULL,100,950,'',0.5,950,950,1900,200,NULL),(172,1000096,1000073,'测试折扣',2,10000,4,200,138,1,0,2,3,'ddd',1900,0,'Test 折扣价格',NULL,100,950,'',0.5,950,950,3800,400,NULL),(173,1000096,1000073,'测试折扣',2,10000,2,200,139,1,0,2,3,'ddd',1900,0,'Test 折扣价格',NULL,100,950,'',0.5,950,950,1900,200,NULL),(174,1000096,1000073,'测试折扣',2,10000,1,200,140,1,0,2,3,'ddd',1900,0,'Test 折扣价格',NULL,100,950,'',0.5,950,950,950,100,NULL),(175,1000096,1000073,'测试折扣',2,10000,5,200,141,1,0,2,3,'ddd',1900,0,'Test 折扣价格',NULL,100,950,'',0.5,950,950,4750,500,NULL),(176,1000096,1000073,'测试折扣',2,10000,3,200,142,1,0,2,3,'ddd',1900,0,'Test 折扣价格',NULL,100,950,'',0.5,950,950,2850,300,NULL),(177,1000096,1000073,'测试折扣',2,10000,1,200,143,1,0,2,3,'ddd',1900,0,'Test 折扣价格',NULL,100,950,'',0.5,950,950,950,100,NULL),(178,1000096,1000073,'测试折扣',2,10000,4,200,144,1,0,2,3,'ddd',1900,0,'Test 折扣价格',NULL,100,950,'',0.5,950,950,3800,400,NULL),(179,1000096,1000073,'测试折扣',2,10000,6,200,145,1,0,2,3,'ddd',1900,0,'Test 折扣价格',NULL,100,950,'',0.5,950,950,5700,600,NULL),(180,1000096,1000073,'测试折扣',2,10000,5,200,147,1,0,2,3,'ddd',1900,0,'Test 折扣价格',16,100,950,'',0.5,950,950,4750,500,26),(181,1000096,1000073,'测试折扣',2,10000,1,200,148,1,0,2,3,'ddd',1900,0,'Test 折扣价格',16,100,950,'',0.5,950,950,950,100,26),(182,1000096,1000073,'测试折扣',2,10000,1,200,149,1,0,2,3,'ddd',1900,0,'Test 折扣价格',16,100,950,'',0.5,950,950,950,100,26),(183,1000096,1000073,'测试折扣',2,10000,2,200,150,1,0,2,3,'ddd',1900,0,'Test 折扣价格',16,100,950,'',0.5,950,950,1900,200,26),(184,1000096,1000073,'测试折扣',2,10000,4,200,151,1,0,2,3,'ddd',1900,0,'Test 折扣价格',16,100,950,'',0.5,950,950,3800,400,26),(185,1000096,1000073,'测试折扣',2,10000,4,200,152,1,0,2,3,'ddd',1900,0,'Test 折扣价格',16,100,950,'',0.5,950,950,3800,400,26),(186,1000096,1000073,'测试折扣',2,10000,1,200,153,1,0,2,3,'ddd',1900,0,'Test 折扣价格',16,100,950,'',0.5,950,950,950,100,26),(187,1000096,1000073,'测试折扣',2,10000,2,200,154,1,0,2,3,'ddd',1900,0,'Test 折扣价格',16,100,950,'',0.5,950,950,1900,200,26),(188,1000096,1000073,'测试折扣',2,10000,3,200,155,1,0,2,3,'ddd',1900,0,'Test 折扣价格',16,100,950,'',0.5,950,950,2850,300,26),(189,1000096,1000073,'测试折扣',2,10000,1,200,156,1,0,2,3,'ddd',1900,0,'Test 折扣价格',16,100,950,'',0.5,950,950,950,100,26),(190,1000091,1000070,'seller Special care2',1,1,5,100,157,1,0,15,1,'ABC',650,0,'Seller特殊护理2',19,0,0,'',0,650,650,3250,500,79),(191,1000091,1000070,'seller Special care2',1,1,2,100,158,1,0,15,1,'ABC',650,0,'Seller特殊护理2',19,0,0,'',0,650,650,1300,200,79),(192,1000096,1000073,'测试折扣',2,10000,2,200,159,1,0,2,3,'ddd',1900,0,'Test 折扣价格',16,100,950,'',0.5,950,950,1900,200,26),(193,1000096,1000073,'测试折扣',2,10000,3,200,160,1,0,2,3,'ddd',1900,0,'Test 折扣价格',16,100,950,'',0.5,950,950,2850,300,26),(194,1000096,1000073,'测试折扣',2,10000,1,200,161,1,0,2,3,'ddd',1900,0,'Test 折扣价格',16,100,950,'',0.5,950,950,950,100,26),(195,1000096,1000073,'测试折扣',2,10000,11,200,162,1,0,2,3,'ddd',1900,0,'Test 折扣价格',16,100,950,'',0.5,950,950,10450,1100,26),(196,1000096,1000073,'测试折扣',2,10000,3,200,163,1,0,2,3,'ddd',1900,0,'Test 折扣价格',16,100,950,'',0.5,950,950,2850,300,26),(197,1000096,1000073,'测试折扣',2,10000,3,200,164,1,0,2,3,'ddd',1900,0,'Test 折扣价格',16,100,950,'',0.5,950,950,2850,300,26),(198,1000096,1000073,'测试折扣',2,10000,1,200,165,1,0,2,3,'ddd',1900,0,'Test 折扣价格',16,100,950,'',0.5,950,950,950,100,26),(199,1000096,1000073,'测试折扣',2,10000,2,200,166,1,0,2,3,'ddd',1900,0,'Test 折扣价格',16,100,950,'',0.5,950,950,1900,200,26),(200,1000096,1000073,'测试折扣',2,10000,5,200,167,1,0,2,3,'ddd',1900,0,'Test 折扣价格',16,100,950,'',0.5,950,950,4750,500,26),(201,1000096,1000073,'测试折扣',2,10000,1,200,168,1,0,2,3,'ddd',1900,0,'Test 折扣价格',16,100,950,'',0.5,950,950,950,100,26),(202,1000096,1000073,'测试折扣',2,10000,1,200,169,1,0,2,3,'ddd',1900,0,'Test 折扣价格',16,100,950,'',0.5,950,950,950,100,26),(203,1000096,1000073,'测试折扣',2,10000,4,200,170,1,0,2,3,'ddd',1900,0,'Test 折扣价格',16,100,950,'',0.5,950,950,3800,400,26),(204,1000096,1000073,'测试折扣',2,10000,1,200,171,1,0,2,3,'ddd',1900,0,'Test 折扣价格',16,100,950,'',0.5,950,950,950,100,26),(205,1000096,1000073,'测试折扣',2,10000,20,200,172,1,0,2,3,'ddd',1900,0,'Test 折扣价格',16,100,950,'',0.5,950,950,19000,2000,26),(206,1000096,1000073,'测试折扣',2,10000,1,200,173,1,0,2,3,'ddd',1900,0,'Test 折扣价格',16,100,950,'',0.5,950,950,950,100,26),(207,1000096,1000073,'测试折扣',2,10000,4,200,174,1,0,2,3,'ddd',1900,0,'Test 折扣价格',16,100,950,'',0.5,950,950,3800,400,26),(208,1000092,1000072,'Seller Shoe Parent ',1,1,23,88,175,0,0,0,1,'RedL',572,0,'Seller 鞋父商品',16,44,286,'\"颜色\":\"Red\",\"尺寸\":\"L\"',0.5,286,286,6578,1012,32),(209,1000094,1000072,'Seller Shoe Parent ',1,1,2,100,176,0,0,0,1,'BlueL',650,0,'Seller 鞋父商品',16,50,325,'\"颜色\":\"Blue\",\"尺寸\":\"L\"',0.5,325,325,650,100,32),(210,1000094,1000072,'Seller Shoe Parent ',1,1,2,100,177,0,0,0,1,'BlueL',650,0,'Seller 鞋父商品',16,50,325,'\"颜色\":\"Blue\",\"尺寸\":\"L\"',0.5,325,325,650,100,32),(211,1000087,1000071,'seller Special care',1,1,1,10,178,1,12,15,1,'C',65,78,'Seller 特殊护理1',19,0,0,'\"颜色\":\"Green\",\"尺寸\":\"14\"',0,65,65,65,10,79),(212,1000092,1000072,'Seller Shoe Parent ',1,1,1,100,179,0,0,0,1,'RedL',650,0,'Seller 鞋父商品',16,50,325,'\"颜色\":\"Red\",\"尺寸\":\"L\"',0.5,325,325,325,50,32),(213,1000093,1000072,'Seller Shoe Parent ',1,1,300,88,180,0,0,0,1,'RedS',572,0,'Seller 鞋父商品',16,44,286,'\"颜色\":\"Red\",\"尺寸\":\"S\"',0.5,286,286,85800,13200,32),(214,1000092,1000072,'Seller Shoe Parent ',1,1,1,100,181,0,0,0,1,'RedL',650,0,'Seller 鞋父商品',16,50,325,'\"颜色\":\"Red\",\"尺寸\":\"L\"',0.5,325,325,325,50,32),(215,1000094,1000072,'Seller Shoe Parent ',1,1,20,88,181,0,0,0,1,'BlueL',572,0,'Seller 鞋父商品',16,44,286,'\"颜色\":\"Blue\",\"尺寸\":\"L\"',0.5,286,286,5720,880,32),(216,1000095,1000072,'Seller Shoe Parent ',1,1,20,88,181,0,0,0,1,'BlueS',572,0,'Seller 鞋父商品',16,44,286,'\"颜色\":\"Blue\",\"尺寸\":\"S\"',0.5,286,286,5720,880,32),(217,1000092,1000072,'Seller Shoe Parent ',1,1,1,100,182,0,0,0,1,'RedL',650,0,'Seller 鞋父商品',16,50,325,'\"颜色\":\"Red\",\"尺寸\":\"L\"',0.5,325,325,325,50,32),(218,1000092,1000072,'Seller Shoe Parent ',1,1,1,100,183,0,0,0,1,'RedL',650,0,'Seller 鞋父商品',16,50,325,'\"颜色\":\"Red\",\"尺寸\":\"L\"',0.5,325,325,325,50,32),(219,1000101,1000076,'Handbags',1,1,1,90,184,0,0,0,1,'123',585,0,'手包12',16,45,292.5,'',0.5,292.5,292.5,292.5,45,39),(220,1000098,1000075,'HandBag11',1,1,10,80,185,1,0,12,1,'123',520,0,'手包11',16,4,26,'\"颜色\":\"Red\",\"尺寸\":\"1\"',0.05,494,494,4940,760,39),(221,1000105,1000078,'Price Test',1,10004,35,40,186,0,0,0,1,'',260,0,'价格测试',126,1.2,7.8,'',0.03,252.2,252.2,8827,1358,192),(222,1000104,1000077,'Test Fitness ',1,10004,1,80,187,1,0,13,1,'123',520,0,'测试测试',103,4,26,'\"尺寸\":\"15\"',0.05,494,494,494,76,120),(223,1000101,1000076,'Handbags',1,1,31,80,188,0,0,0,1,'123',520,0,'手包12',16,4,26,'',0.05,494,494,15314,2356,39),(224,1000092,1000072,'Seller Shoe Parent ',1,1,20,88,189,0,0,0,1,'RedL',572,0,'Seller 鞋父商品',16,4.4,28.6,'\"颜色\":\"Red\",\"尺寸\":\"L\"',0.05,543.4,543.4,10868,1672,32),(225,1000092,1000072,'Seller Shoe Parent ',1,1,2,100,190,0,0,0,1,'RedL',650,0,'Seller 鞋父商品',16,5,32.5,'\"颜色\":\"Red\",\"尺寸\":\"L\"',0.05,617.5,617.5,1235,190,32),(226,1000098,1000075,'HandBag11',1,1,1,100,191,1,0,12,1,'123',650,0,'手包11',16,5,32.5,'\"颜色\":\"Red\",\"尺寸\":\"1\"',0.05,617.5,617.5,617.5,95,39),(227,1000101,1000076,'Handbags',1,1,1,100,192,0,0,0,1,'123',650,0,'手包12',16,5,32.5,'',0.05,617.5,617.5,617.5,95,39),(228,1000105,1000078,'Price Test',1,10004,3,100,193,0,0,0,1,'',650,0,'价格测试',126,3,19.5,'',0.03,630.5,630.5,1891.5,291,192),(229,1000105,1000078,'Price Test',1,10004,1,100,194,0,0,0,1,'',650,0,'价格测试',126,3,19.5,'',0.03,630.5,630.5,630.5,97,192),(230,1000101,1000076,'Handbags',1,1,1,100,195,0,0,0,1,'123',650,0,'手包12',16,5,32.5,'',0.05,617.5,617.5,617.5,95,39),(231,1000092,1000072,'Seller Shoe Parent ',1,1,21,88,196,0,0,0,1,'RedL',572,0,'Seller 鞋父商品',16,4.4,28.6,'\"颜色\":\"Red\",\"尺寸\":\"L\"',0.05,543.4,543.4,11411.4,1755.6,32),(232,1000092,1000072,'Seller Shoe Parent ',1,1,21,88,197,0,0,0,1,'RedL',572,0,'Seller 鞋父商品',16,4.4,28.6,'\"颜色\":\"Red\",\"尺寸\":\"L\"',0.05,543.4,543.4,11411.4,1755.6,32),(233,1000107,1000069,'seller Special care',1,1,300,11,198,1,12,15,1,'ABC',71.5,78,'特殊护理测试',19,0.55,3.575,'',0.05,67.925,67.925,20377.5,3135,79),(234,1000107,1000069,'seller Special care',1,1,200,11,199,1,0,15,1,'ABC',71.5,0,'特殊护理测试',19,0.55,3.575,'',0.05,67.925,67.925,13585,2090,79),(235,1000109,1000081,'ShoesWithChildren',1,1,3,300,200,1,2,3,1,'a001',1950,13,'有子产品的鞋子',16,15,97.5,'\"颜色\":\"red\",\"尺寸\":\"11\"',0.05,1852.5,1852.5,5557.5,855,35),(236,1000109,1000081,'ShoesWithChildren',1,1,4,300,201,1,2,3,1,'a001',1950,13,'有子产品的鞋子',16,15,97.5,'\"颜色\":\"red\",\"尺寸\":\"11\"',0.05,1852.5,1852.5,7410,1140,35),(237,1000111,1000081,'ShoesWithChildren',1,1,3,300,201,1,2,3,1,'a004',1950,13,'有子产品的鞋子',16,15,97.5,'\"颜色\":\"red\",\"尺寸\":\"14\"',0.05,1852.5,1852.5,5557.5,855,35),(238,1000109,1000081,'ShoesWithChildren',1,1,1,300,202,1,0,3,1,'a001',1950,0,'有子产品的鞋子',16,15,97.5,'\"颜色\":\"red\",\"尺寸\":\"11\"',0.05,1852.5,1852.5,1852.5,285,35),(239,1000108,1000080,'ShoesWithoutChildren',1,1,1,380,203,1,0,2,1,'a11',2470,0,'没有子产品的鞋子',16,19,123.5,'',0.05,2346.5,2346.5,2346.5,361,24),(240,1000114,1000083,'Test1',1,1,1,9,204,0,0,0,1,'123',58.5,0,'',129,0.45,2.925,'',0.05,55.575,55.575,55.575,8.55,168),(241,1000108,1000080,'ShoesWithoutChildren',1,1,1,400,205,1,0,2,1,'a11',2600,0,'没有子产品的鞋子',16,20,130,'',0.05,2470,2470,2470,380,24),(242,1000109,1000081,'ShoesWithChildren',1,1,1,300,206,1,0,3,1,'a001',1950,0,'有子产品的鞋子',16,15,97.5,'\"颜色\":\"red\",\"尺寸\":\"11\"',0.05,1852.5,1852.5,1852.5,285,35),(243,1000114,1000083,'Test1',1,1,1,9,207,0,0,0,1,'123',58.5,0,'',129,0.45,2.925,'',0.05,55.575,55.575,55.575,8.55,168),(244,1000108,1000080,'ShoesWithoutChildren',1,1,1,400,208,1,0,2,1,'a11',2600,0,'没有子产品的鞋子',16,20,130,'',0.05,2470,2470,2470,380,24),(245,1000110,1000081,'ShoesWithChildren',1,1,1,300,209,1,0,3,1,'a002',1950,0,'有子产品的鞋子',16,15,97.5,'\"颜色\":\"blue\",\"尺寸\":\"12\"',0.05,1852.5,1852.5,1852.5,285,35),(246,1000114,1000083,'Test1',1,1,1,10,210,0,0,0,1,'123',65,0,'',129,0.5,3.25,'',0.05,61.75,61.75,61.75,9.5,168),(247,1000113,1000082,'ABC',1,1,1,100,211,1,0,15,1,'',650,0,'ABC',16,5,32.5,'',0.05,617.5,617.5,617.5,95,31),(248,1000114,1000083,'Test1',1,1,5,10,211,0,0,0,1,'123',65,0,'',129,0.5,3.25,'',0.05,61.75,61.75,308.75,47.5,168),(249,1000111,1000081,'ShoesWithChildren',1,1,3,300,212,1,2,3,1,'a004',1950,13,'有子产品的鞋子',16,15,97.5,'\"颜色\":\"red\",\"尺寸\":\"14\"',0.05,1852.5,1852.5,5557.5,855,35),(250,1000114,1000083,'Test1',1,1,1,10,213,0,0,0,1,'123',65,0,'',129,0.5,3.25,'',0.05,61.75,61.75,61.75,9.5,168),(251,1000111,1000081,'ShoesWithChildren',1,1,1,300,214,1,2,3,1,'a004',1950,13,'有子产品的鞋子',16,15,97.5,'\"颜色\":\"red\",\"尺寸\":\"14\"',0.05,1852.5,1852.5,1852.5,285,35),(252,1000108,1000080,'ShoesWithoutChildren',1,1,2,400,215,1,1.5,2,1,'a11',2600,9.75,'没有子产品的鞋子',16,20,130,'',0.05,2470,2470,4940,760,24),(253,1000114,1000083,'Test1',1,1,2,10,216,0,0,0,1,'123',65,0,'',129,0.5,3.25,'',0.05,61.75,61.75,123.5,19,168),(254,1000114,1000083,'Test1',1,1,1,10,217,0,0,0,1,'123',65,0,'',129,0.5,3.25,'',0.05,61.75,61.75,61.75,9.5,168),(255,1000108,1000080,'ShoesWithoutChildren',1,1,1,400,218,1,0,2,1,'a11',2600,0,'没有子产品的鞋子',16,20,130,'',0.05,2470,2470,2470,380,24),(256,1000113,1000082,'ABC',1,1,99,80,219,1,0,15,1,'',520,0,'ABC',16,4,26,'',0.05,494,494,48906,7524,31),(257,1000113,1000082,'ABC',1,1,20,100,220,1,0,15,1,'',650,0,'ABC',16,5,32.5,'',0.05,617.5,617.5,12350,1900,31),(258,1000113,1000082,'ABC',1,1,20,100,221,1,0,15,1,'',650,0,'ABC',16,5,32.5,'',0.05,617.5,617.5,12350,1900,31),(259,1000113,1000082,'ABC',1,1,20,100,222,1,0,15,1,'',650,0,'ABC',16,5,32.5,'',0.05,617.5,617.5,12350,1900,31),(260,1000113,1000082,'ABC',1,1,20,100,223,1,0,15,1,'',650,0,'ABC',16,5,32.5,'',0.05,617.5,617.5,12350,1900,31),(261,1000113,1000082,'ABC',1,1,20,100,224,1,0,15,1,'',650,0,'ABC',16,5,32.5,'',0.05,617.5,617.5,12350,1900,31),(262,1000111,1000081,'ShoesWithChildren',1,1,20,300,225,1,0,3,1,'a004',1950,0,'有子产品的鞋子',16,15,97.5,'\"颜色\":\"red\",\"尺寸\":\"14\"',0.05,1852.5,1852.5,37050,5700,35),(263,1000111,1000081,'ShoesWithChildren',1,1,20,300,226,1,0,3,1,'a004',1950,0,'有子产品的鞋子',16,15,97.5,'\"颜色\":\"red\",\"尺寸\":\"14\"',0.05,1852.5,1852.5,37050,5700,35),(264,1000111,1000081,'ShoesWithChildren',1,1,20,300,227,1,0,3,1,'a004',1950,0,'有子产品的鞋子',16,15,97.5,'\"颜色\":\"red\",\"尺寸\":\"14\"',0.05,1852.5,1852.5,37050,5700,35);
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
) ENGINE=InnoDB AUTO_INCREMENT=680 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orderRecord`
--

LOCK TABLES `orderRecord` WRITE;
/*!40000 ALTER TABLE `orderRecord` DISABLE KEYS */;
INSERT INTO `orderRecord` VALUES (148,94,'beijing',8,'用户提交订单，等待支付','Customer submited the order, waiting for pay money','2013-11-05 00:59:18'),(149,94,'beijing',8,'用户已经支付，等待系统确认','Customer pay the order, waiting for repsonse','2013-11-05 00:59:30'),(150,94,'123',10000,'卖家已发货，等待用户查收','Seller has send, waiting for receive','2013-11-05 00:59:49'),(151,94,'123',10000,'卖家已发货，等待用户查收','Seller has send, waiting for receive','2013-11-05 01:00:28'),(152,94,'beijing',8,'买家已收货','Customer has received','2013-11-05 01:00:49'),(153,95,'toko',8,'用户提交订单，等待支付','Customer submited the order, waiting for pay money','2013-11-06 23:27:27'),(154,95,'toko',8,'用户已经支付，等待系统确认','Customer pay the order, waiting for repsonse','2013-11-06 23:27:31'),(155,95,'123',10000,'卖家已发货，等待用户查收','Seller has send, waiting for receive','2013-11-06 23:27:42'),(156,95,'123',10000,'卖家已发货，等待用户查收','Seller has send, waiting for receive','2013-11-06 23:27:54'),(157,95,'123',10000,'卖家已发货，等待用户查收','Seller has send, waiting for receive','2013-11-06 23:37:48'),(158,96,'toko',8,'用户提交订单，等待支付','Customer submited the order, waiting for pay money','2013-11-06 23:47:03'),(159,97,'toko',8,'用户提交订单，等待支付','Customer submited the order, waiting for pay money','2013-11-06 23:55:42'),(160,98,'toko',8,'用户提交订单，等待支付','Customer submited the order, waiting for pay money','2013-11-06 23:56:05'),(161,99,'toko',8,'用户提交订单，等待支付','Customer submited the order, waiting for pay money','2013-11-12 00:25:16'),(162,99,'toko',8,'用户已经支付，等待系统确认','Customer pay the order, waiting for repsonse','2013-11-12 00:25:19'),(164,98,'123',10000,'商户取消该订单','Seller canceled this order','2013-11-13 03:01:57'),(165,100,'toko',8,'用户提交订单，等待支付','Customer submited the order, waiting for pay money','2013-11-15 18:24:33'),(166,100,'toko',8,'用户已经支付，等待系统确认','Customer pay the order, waiting for repsonse','2013-11-15 18:24:37'),(167,101,'toko',8,'用户提交订单，等待支付','Customer submited the order, waiting for pay money','2013-11-15 18:30:15'),(168,101,'toko',8,'用户已经支付，等待系统确认','Customer pay the order, waiting for repsonse','2013-11-15 18:30:18'),(169,102,'toko',8,'用户提交订单，等待支付','Customer submited the order, waiting for pay money','2013-11-15 18:32:31'),(170,103,'toko',8,'用户提交订单，等待支付','Customer submited the order, waiting for pay money','2013-11-16 01:17:51'),(171,103,'toko',8,'用户已经支付，等待系统确认','Customer pay the order, waiting for repsonse','2013-11-16 01:17:53'),(172,104,'toko',8,'用户提交订单，等待支付','Customer submited the order, waiting for pay money','2013-11-16 01:21:02'),(173,104,'toko',8,'用户已经支付，等待系统确认','Customer pay the order, waiting for repsonse','2013-11-16 01:21:04'),(174,105,'toko',8,'用户提交订单，等待支付','Customer submited the order, waiting for pay money','2013-11-16 23:58:45'),(175,105,'123',10000,'商户取消该订单','Seller canceled this order','2013-11-16 23:59:07'),(176,104,'toko',8,'用户投诉该订单','Customer complain this order','2013-11-17 00:00:21'),(177,103,'toko',8,'用户投诉该订单','Customer complain this order','2013-11-17 00:02:51'),(178,101,'toko',8,'用户投诉该订单','Customer complain this order','2013-11-17 00:05:21'),(179,100,'toko',8,'用户投诉该订单','Customer complain this order','2013-11-17 00:09:50'),(180,106,'toko',8,'用户提交订单，等待支付','Customer submited the order, waiting for pay money','2013-11-17 01:19:36'),(181,106,'toko',8,'用户已经支付，等待系统确认','Customer pay the order, waiting for repsonse','2013-11-17 01:21:42'),(182,107,'toko',8,'用户提交订单，等待支付','Customer submited the order, waiting for pay money','2013-11-18 00:18:01'),(183,107,'toko',8,'用户已经支付，等待系统确认','Customer pay the order, waiting for repsonse','2013-11-18 00:18:55'),(184,108,'toko',8,'用户提交订单，等待支付','Customer submited the order, waiting for pay money','2013-11-18 00:33:22'),(185,108,'toko',8,'用户已经支付，等待系统确认','Customer pay the order, waiting for repsonse','2013-11-18 00:33:25'),(186,109,'toko',8,'用户提交订单，等待支付','Customer submited the order, waiting for pay money','2013-11-18 00:36:52'),(187,109,'toko',8,'用户已经支付，等待系统确认','Customer pay the order, waiting for repsonse','2013-11-18 00:36:54'),(188,95,NULL,0,NULL,NULL,'2013-11-25 00:08:10'),(189,110,'Germany',10000,'用户提交订单，等待支付','Customer submited the order, waiting for pay money','2013-11-26 15:02:30'),(190,110,'Germany',10000,'用户已经支付，等待系统确认','Customer pay the order, waiting for repsonse','2013-11-26 15:14:10'),(191,111,'CHina',10000,'用户提交订单，等待支付','Customer submited the order, waiting for pay money','2013-11-26 15:37:50'),(192,111,'CHina',10000,'用户已经支付，等待系统确认','Customer pay the order, waiting for repsonse','2013-11-26 15:37:57'),(193,112,'USA',10000,'用户提交订单，等待支付','Customer submited the order, waiting for pay money','2013-11-26 15:38:17'),(194,112,'USA',10000,'该订单发生错误','Something wrong to this order, such as out of stock , wrong address ','2013-11-26 15:38:21'),(195,112,'USA',10000,'该订单发生错误','Something wrong to this order, such as out of stock , wrong address ','2013-11-26 15:39:43'),(196,113,'USA',10000,'用户提交订单，等待支付','Customer submited the order, waiting for pay money','2013-11-26 15:49:39'),(197,113,'USA',10000,'用户已经支付，等待系统确认','Customer pay the order, waiting for repsonse','2013-11-26 15:49:43'),(198,113,'USA',10000,'该订单发生错误','Something wrong to this order, such as out of stock , wrong address ','2013-11-26 15:55:37'),(199,114,'USA',10000,'用户提交订单，等待支付','Customer submited the order, waiting for pay money','2013-11-26 15:57:04'),(200,114,'USA',10000,'用户已经支付，等待系统确认','Customer pay the order, waiting for repsonse','2013-11-26 15:57:09'),(201,114,'USA',10000,'该订单发生错误','Something wrong to this order, such as out of stock , wrong address ','2013-11-26 15:57:17'),(202,114,'USA',10000,'该订单发生错误','Something wrong to this order, such as out of stock , wrong address ','2013-11-26 16:08:07'),(203,115,'USA',10000,'用户提交订单，等待支付','Customer submited the order, waiting for pay money','2013-11-26 16:08:23'),(204,115,'USA',10000,'用户已经支付，等待系统确认','Customer pay the order, waiting for repsonse','2013-11-26 16:08:28'),(205,115,'USA',10000,'用户已经支付，等待系统确认','Customer pay the order, waiting for repsonse','2013-11-26 16:20:06'),(206,115,'123',1,'卖家已发货，等待用户查收','Seller has send, waiting for receive','2013-11-26 16:31:27'),(207,111,'123',1,'卖家已发货，等待用户查收','Seller has send, waiting for receive','2013-11-26 16:32:42'),(208,116,'CHina',10000,'用户提交订单，等待支付','Customer submited the order, waiting for pay money','2013-11-27 16:07:08'),(209,116,'CHina',10000,'用户已经支付，等待系统确认','Customer pay the order, waiting for repsonse','2013-11-27 16:07:12'),(210,117,'USA',10000,'用户提交订单，等待支付','Customer submited the order, waiting for pay money','2013-11-27 16:52:09'),(211,117,'USA',10000,'用户已经支付，等待系统确认','Customer pay the order, waiting for repsonse','2013-11-27 16:52:16'),(212,111,'CHina',10000,'买家已收货','Customer has received','2013-11-27 17:31:45'),(213,118,'USA',10000,'用户提交订单，等待支付','Customer submited the order, waiting for pay money','2013-11-30 15:43:05'),(214,118,'USA',10000,'用户已经支付，等待系统确认','Customer pay the order, waiting for repsonse','2013-11-30 15:43:11'),(215,119,'USA',10000,'用户提交订单，等待支付','Customer submited the order, waiting for pay money','2013-11-30 15:49:30'),(216,119,'USA',10000,'该订单发生错误','Something wrong to this order, such as out of stock , wrong address ','2013-11-30 15:49:34'),(217,120,'USA',10000,'用户提交订单，等待支付','Customer submited the order, waiting for pay money','2013-11-30 15:50:07'),(218,120,'USA',10000,'用户已经支付，等待系统确认','Customer pay the order, waiting for repsonse','2013-11-30 15:50:10'),(219,121,'USA',10000,'用户提交订单，等待支付','Customer submited the order, waiting for pay money','2013-11-30 16:17:18'),(220,121,'USA',10000,'用户取消该订单','Customer canceled this order','2013-11-30 16:17:48'),(221,122,'CHina',10000,'用户提交订单，等待支付','Customer submited the order, waiting for pay money','2013-11-30 16:58:09'),(222,123,'USA',10000,'用户提交订单，等待支付','Customer submited the order, waiting for pay money','2013-11-30 16:58:22'),(223,115,'USA',10000,'买家已收货','Customer has received','2013-11-30 16:58:47'),(224,110,'123',1,'卖家已发货，等待用户查收','Seller has send, waiting for receive','2013-11-30 17:08:50'),(225,116,'123',1,'卖家已发货，等待用户查收','Seller has send, waiting for receive','2013-11-30 20:40:25'),(226,116,NULL,0,NULL,NULL,'2013-12-01 02:41:30'),(227,110,NULL,0,NULL,NULL,'2013-12-01 02:41:30'),(228,124,'ddd',8,'用户提交订单，等待支付','Customer submited the order, waiting for pay money','2013-12-01 03:23:09'),(229,124,'ddd',8,'该订单发生错误','Something wrong to this order, such as out of stock , wrong address ','2013-12-01 03:23:20'),(230,125,'ddd',8,'用户提交订单，等待支付','Customer submited the order, waiting for pay money','2013-12-01 03:23:43'),(231,125,'ddd',8,'用户已经支付，等待系统确认','Customer pay the order, waiting for repsonse','2013-12-01 03:23:45'),(232,126,'ddd',8,'用户提交订单，等待支付','Customer submited the order, waiting for pay money','2013-12-01 03:28:48'),(233,126,'ddd',8,'该订单发生错误','Something wrong to this order, such as out of stock , wrong address ','2013-12-01 03:30:01'),(234,127,'ddd',8,'用户提交订单，等待支付','Customer submited the order, waiting for pay money','2013-12-01 03:31:24'),(235,127,'ddd',8,'用户已经支付，等待系统确认','Customer pay the order, waiting for repsonse','2013-12-01 03:31:26'),(236,128,'USA',10000,'用户提交订单，等待支付','Customer submited the order, waiting for pay money','2013-12-01 03:37:42'),(237,128,'USA',10000,'用户已经支付，等待系统确认','Customer pay the order, waiting for repsonse','2013-12-01 03:37:46'),(238,129,'Germany',10000,'用户提交订单，等待支付','Customer submited the order, waiting for pay money','2013-12-01 03:41:26'),(239,129,'Germany',10000,'用户已经支付，等待系统确认','Customer pay the order, waiting for repsonse','2013-12-01 03:41:28'),(240,106,'toko',8,'用户投诉该订单','Customer complain this order','2013-12-01 03:55:28'),(241,107,'toko',8,'用户投诉该订单','Customer complain this order','2013-12-01 03:55:54'),(242,109,'123',10000,'卖家已发货，等待用户查收','Seller has send, waiting for receive','2013-12-04 00:15:11'),(243,109,'Server',0,'系统自动关闭订单','System closed the order','2013-12-04 00:15:30'),(244,108,'123',10000,'卖家已发货，等待用户查收','Seller has send, waiting for receive','2013-12-05 22:42:21'),(245,108,'Server',0,'系统自动关闭订单','System closed the order','2013-12-05 22:42:30'),(246,99,'123',10000,'卖家已发货，等待用户查收','Seller has send, waiting for receive','2013-12-05 22:45:03'),(247,99,'Server',0,'系统自动关闭订单','System closed the order','2013-12-05 22:45:30'),(248,123,'USA',10000,'用户取消该订单','Customer canceled this order','2013-12-05 22:51:14'),(249,122,'CHina',10000,'用户取消该订单','Customer canceled this order','2013-12-05 22:51:27'),(250,130,'ddd',8,'用户提交订单，等待支付','Customer submited the order, waiting for pay money','2013-12-05 23:15:58'),(251,130,'ddd',8,'用户取消该订单','Customer canceled this order','2013-12-05 23:16:05'),(252,131,'cj',8,'用户提交订单，等待支付','Customer submited the order, waiting for pay money','2013-12-05 23:48:59'),(253,132,'cj',8,'用户提交订单，等待支付','Customer submited the order, waiting for pay money','2013-12-05 23:48:59'),(254,133,'cj',8,'用户提交订单，等待支付','Customer submited the order, waiting for pay money','2013-12-05 23:48:59'),(255,131,'Server',0,'订单被切分','Order has been splited','2013-12-05 23:48:59'),(256,133,'cj',8,'用户已经支付，等待系统确认','Customer pay the order, waiting for repsonse','2013-12-05 23:49:39'),(257,132,'cj',8,'用户已经支付，等待系统确认','Customer pay the order, waiting for repsonse','2013-12-05 23:50:15'),(258,97,'toko',8,'用户已经支付，等待系统确认','Customer pay the order, waiting for repsonse','2013-12-05 23:50:18'),(259,102,'toko',8,'用户已经支付，等待系统确认','Customer pay the order, waiting for repsonse','2013-12-05 23:50:20'),(260,96,'toko',8,'用户已经支付，等待系统确认','Customer pay the order, waiting for repsonse','2013-12-05 23:50:23'),(261,134,'toko',8,'用户提交订单，等待支付','Customer submited the order, waiting for pay money','2013-12-11 01:00:03'),(262,134,'toko',8,'用户已经支付，等待系统确认','Customer pay the order, waiting for repsonse','2013-12-11 01:00:06'),(263,135,'toko',8,'用户提交订单，等待支付','Customer submited the order, waiting for pay money','2013-12-11 01:02:08'),(264,135,'toko',8,'用户已经支付，等待系统确认','Customer pay the order, waiting for repsonse','2013-12-11 01:02:11'),(265,136,'toko',8,'用户提交订单，等待支付','Customer submited the order, waiting for pay money','2013-12-15 00:27:29'),(266,136,'toko',8,'用户已经支付，等待系统确认','Customer pay the order, waiting for repsonse','2013-12-15 00:27:32'),(267,136,'123',10000,'卖家已发货，等待用户查收','Seller has send, waiting for receive','2013-12-15 00:28:00'),(268,136,'toko',8,'买家要求退货','Customer want to send back','2013-12-15 00:43:54'),(269,136,'Server',0,'关闭订单','System closed the order','2013-12-15 01:32:53'),(270,136,'123',10000,'卖家退款','Seller return money to customer','2013-12-15 01:32:53'),(271,137,'toko',8,'用户提交订单，等待支付','Customer submited the order, waiting for pay money','2013-12-15 01:35:46'),(272,137,'toko',8,'用户已经支付，等待系统确认','Customer pay the order, waiting for repsonse','2013-12-15 01:35:48'),(273,137,'123',10000,'卖家已发货，等待用户查收','Seller has send, waiting for receive','2013-12-15 01:36:03'),(274,137,'toko',8,'买家要求退货','Customer want to send back','2013-12-15 01:36:17'),(275,137,'Server',0,'关闭订单','System closed the order','2013-12-15 01:37:25'),(276,137,'123',10000,'卖家退款','Seller return money to customer','2013-12-15 01:37:27'),(277,138,'toko',8,'用户提交订单，等待支付','Customer submited the order, waiting for pay money','2013-12-15 01:39:31'),(278,138,'toko',8,'用户已经支付，等待系统确认','Customer pay the order, waiting for repsonse','2013-12-15 01:39:33'),(279,138,'123',10000,'卖家已发货，等待用户查收','Seller has send, waiting for receive','2013-12-15 01:39:48'),(280,138,'toko',8,'买家要求退货','Customer want to send back','2013-12-15 01:39:57'),(281,138,'Server',0,'关闭订单','System closed the order','2013-12-15 01:44:59'),(282,138,'123',10000,'卖家退款','Seller return money to customer','2013-12-15 01:44:59'),(283,139,'toko',8,'用户提交订单，等待支付','Customer submited the order, waiting for pay money','2013-12-15 01:46:36'),(284,139,'toko',8,'用户已经支付，等待系统确认','Customer pay the order, waiting for repsonse','2013-12-15 01:46:38'),(285,139,'123',10000,'卖家已发货，等待用户查收','Seller has send, waiting for receive','2013-12-15 01:46:47'),(286,139,'toko',8,'买家要求退货','Customer want to send back','2013-12-15 01:46:52'),(287,139,'Server',0,'关闭订单','System closed the order','2013-12-15 01:53:47'),(288,139,'123',10000,'卖家退款','Seller return money to customer','2013-12-15 01:53:47'),(289,140,'toko',8,'用户提交订单，等待支付','Customer submited the order, waiting for pay money','2013-12-15 01:56:37'),(290,140,'toko',8,'用户已经支付，等待系统确认','Customer pay the order, waiting for repsonse','2013-12-15 01:56:39'),(291,140,'123',10000,'卖家已发货，等待用户查收','Seller has send, waiting for receive','2013-12-15 01:56:50'),(292,140,'toko',8,'买家要求退货','Customer want to send back','2013-12-15 01:56:56'),(293,140,'Server',0,'关闭订单','System closed the order','2013-12-15 01:57:03'),(294,140,'123',10000,'卖家退款','Seller return money to customer','2013-12-15 01:57:03'),(295,141,'toko',8,'用户提交订单，等待支付','Customer submited the order, waiting for pay money','2013-12-15 02:00:41'),(296,141,'toko',8,'用户已经支付，等待系统确认','Customer pay the order, waiting for repsonse','2013-12-15 02:00:44'),(297,141,'123',10000,'卖家已发货，等待用户查收','Seller has send, waiting for receive','2013-12-15 02:00:54'),(298,141,'toko',8,'买家要求退货','Customer want to send back','2013-12-15 02:01:01'),(299,142,'toko',8,'用户提交订单，等待支付','Customer submited the order, waiting for pay money','2013-12-15 02:04:09'),(300,142,'toko',8,'用户已经支付，等待系统确认','Customer pay the order, waiting for repsonse','2013-12-15 02:04:13'),(301,142,'123',10000,'卖家已发货，等待用户查收','Seller has send, waiting for receive','2013-12-15 02:04:26'),(302,142,'toko',8,'买家要求退货','Customer want to send back','2013-12-15 02:04:32'),(303,143,'toko',8,'用户提交订单，等待支付','Customer submited the order, waiting for pay money','2013-12-15 02:18:38'),(304,143,'toko',8,'用户已经支付，等待系统确认','Customer pay the order, waiting for repsonse','2013-12-15 02:18:40'),(305,143,'123',10000,'商户取消该订单','Seller canceled this order','2013-12-15 02:18:47'),(306,144,'toko',8,'用户提交订单，等待支付','Customer submited the order, waiting for pay money','2013-12-15 02:20:51'),(307,144,'toko',8,'用户已经支付，等待系统确认','Customer pay the order, waiting for repsonse','2013-12-15 02:20:53'),(308,144,'123',10000,'卖家已发货，等待用户查收','Seller has send, waiting for receive','2013-12-15 02:21:01'),(309,144,'toko',8,'用户投诉该订单','Customer complain this order','2013-12-15 02:21:08'),(310,144,'Server',0,'关闭订单','System closed the order','2013-12-15 02:21:30'),(311,144,'123',10000,'卖家退款','Seller return money to customer','2013-12-15 02:21:30'),(312,145,'toko',8,'用户提交订单，等待支付','Customer submited the order, waiting for pay money','2013-12-15 02:24:47'),(313,145,'toko',8,'用户已经支付，等待系统确认','Customer pay the order, waiting for repsonse','2013-12-15 02:24:50'),(314,145,'123',10000,'卖家已发货，等待用户查收','Seller has send, waiting for receive','2013-12-15 02:25:17'),(315,145,'toko',8,'用户投诉该订单','Customer complain this order','2013-12-15 02:25:27'),(316,145,'123',10000,'卖家退款','Seller return money to customer','2013-12-15 02:25:40'),(317,145,'Server',0,'关闭订单','System closed the order','2013-12-15 02:25:40'),(318,135,'123',10000,'卖家已发货，等待用户查收','Seller has send, waiting for receive','2013-12-15 02:37:22'),(319,135,'toko',8,'买家已收货','Customer has received','2013-12-15 02:37:28'),(320,146,'toko',8,'用户提交订单，等待支付','Customer submited the order, waiting for pay money','2013-12-16 23:59:53'),(321,147,'toko',8,'用户提交订单，等待支付','Customer submited the order, waiting for pay money','2013-12-17 00:01:26'),(322,147,'toko',8,'用户已经支付，等待系统确认','Customer pay the order, waiting for repsonse','2013-12-17 00:01:50'),(323,148,'toko',8,'用户提交订单，等待支付','Customer submited the order, waiting for pay money','2013-12-17 00:10:55'),(324,148,'toko',8,'用户已经支付，等待系统确认','Customer pay the order, waiting for repsonse','2013-12-17 00:10:58'),(325,149,'toko',8,'用户提交订单，等待支付','Customer submited the order, waiting for pay money','2013-12-17 00:13:31'),(326,150,'toko',8,'用户提交订单，等待支付','Customer submited the order, waiting for pay money','2013-12-17 00:21:58'),(327,150,'toko',8,'用户已经支付，等待系统确认','Customer pay the order, waiting for repsonse','2013-12-17 00:22:00'),(328,151,'toko',8,'用户提交订单，等待支付','Customer submited the order, waiting for pay money','2013-12-17 22:56:04'),(329,151,'toko',8,'用户已经支付，等待系统确认','Customer pay the order, waiting for repsonse','2013-12-17 22:56:06'),(330,151,'123',10000,'卖家已发货，等待用户查收','Seller has send, waiting for receive','2013-12-17 22:56:14'),(331,151,'toko',8,'买家要求退货','Customer want to send back','2013-12-17 22:56:19'),(332,152,'toko',8,'用户提交订单，等待支付','Customer submited the order, waiting for pay money','2013-12-17 22:59:41'),(333,152,'toko',8,'用户已经支付，等待系统确认','Customer pay the order, waiting for repsonse','2013-12-17 22:59:44'),(334,152,'123',10000,'卖家已发货，等待用户查收','Seller has send, waiting for receive','2013-12-17 22:59:58'),(335,152,'toko',8,'买家要求退货','Customer want to send back','2013-12-17 23:01:48'),(336,152,'123',10000,'卖家退款','Seller return money to customer','2013-12-17 23:01:55'),(337,152,'Server',0,'关闭订单','System closed the order','2013-12-17 23:01:56'),(338,153,'toko',8,'用户提交订单，等待支付','Customer submited the order, waiting for pay money','2013-12-17 23:03:18'),(339,153,'toko',8,'用户已经支付，等待系统确认','Customer pay the order, waiting for repsonse','2013-12-17 23:03:20'),(340,149,'toko',8,'用户已经支付，等待系统确认','Customer pay the order, waiting for repsonse','2013-12-17 23:13:11'),(341,153,'123',10000,'卖家已发货，等待用户查收','Seller has send, waiting for receive','2013-12-17 23:13:22'),(342,153,'toko',8,'买家要求退货','Customer want to send back','2013-12-17 23:13:27'),(343,153,'123',10000,'卖家退款','Seller return money to customer','2013-12-17 23:13:30'),(344,153,'Server',0,'关闭订单','System closed the order','2013-12-17 23:13:30'),(345,154,'toko',8,'用户提交订单，等待支付','Customer submited the order, waiting for pay money','2013-12-23 22:49:04'),(346,154,'toko',8,'用户已经支付，等待系统确认','Customer pay the order, waiting for repsonse','2013-12-23 22:49:07'),(347,154,'123',10000,'卖家已发货，等待用户查收','Seller has send, waiting for receive','2013-12-23 22:49:21'),(348,154,'toko',8,'买家已收货','Customer has received','2013-12-23 22:49:28'),(349,154,'toko',8,'用户投诉该订单','Customer complain this order','2013-12-23 22:56:33'),(350,155,'toko',8,'用户提交订单，等待支付','Customer submited the order, waiting for pay money','2013-12-23 23:55:41'),(351,155,'toko',8,'用户已经支付，等待系统确认','Customer pay the order, waiting for repsonse','2013-12-23 23:55:43'),(352,155,'123',10000,'卖家已发货，等待用户查收','Seller has send, waiting for receive','2013-12-23 23:55:56'),(353,155,'toko',8,'买家已收货','Customer has received','2013-12-23 23:56:02'),(354,155,'toko',8,'用户投诉该订单','Customer complain this order','2013-12-23 23:56:10'),(355,155,'Server',0,'关闭订单','System closed the order','2013-12-24 00:08:00'),(356,156,'toko',8,'用户提交订单，等待支付','Customer submited the order, waiting for pay money','2013-12-24 00:13:45'),(357,156,'toko',8,'用户已经支付，等待系统确认','Customer pay the order, waiting for repsonse','2013-12-24 00:13:47'),(358,156,'123',10000,'卖家已发货，等待用户查收','Seller has send, waiting for receive','2013-12-24 00:14:04'),(359,156,'toko',8,'买家已收货','Customer has received','2013-12-24 00:14:13'),(360,156,'toko',8,'用户投诉该订单','Customer complain this order','2013-12-24 00:14:18'),(361,156,'123',10000,'卖家退款','Seller return money to customer','2013-12-24 00:14:40'),(362,156,'Server',0,'关闭订单','System closed the order','2013-12-24 00:14:40'),(363,156,'Server',0,'关闭订单','System closed the order','2013-12-24 00:14:40'),(364,156,'Server',0,'关闭订单','System closed the order','2013-12-24 00:14:40'),(365,157,'ddd',8,'用户提交订单，等待支付','Customer submited the order, waiting for pay money','2013-12-24 00:17:57'),(366,157,'ddd',8,'用户已经支付，等待系统确认','Customer pay the order, waiting for repsonse','2013-12-24 00:18:00'),(367,150,'123',10000,'卖家已发货，等待用户查收','Seller has send, waiting for receive','2013-12-24 00:18:09'),(368,157,'123',1,'卖家已发货，等待用户查收','Seller has send, waiting for receive','2013-12-24 00:18:42'),(369,157,'ddd',8,'买家已收货','Customer has received','2013-12-24 00:19:40'),(370,157,'ddd',8,'用户投诉该订单','Customer complain this order','2013-12-24 00:19:45'),(371,157,'123',1,'卖家退款','Seller return money to customer','2013-12-24 00:20:05'),(372,157,'Server',0,'关闭订单','System closed the order','2013-12-24 00:20:05'),(373,157,'Server',0,'关闭订单','System closed the order','2013-12-24 00:20:05'),(374,157,'Server',0,'关闭订单','System closed the order','2013-12-24 00:20:05'),(375,158,'ddd',8,'用户提交订单，等待支付','Customer submited the order, waiting for pay money','2013-12-24 00:36:47'),(376,158,'ddd',8,'用户已经支付，等待系统确认','Customer pay the order, waiting for repsonse','2013-12-24 00:36:49'),(377,158,'123',1,'卖家已发货，等待用户查收','Seller has send, waiting for receive','2013-12-24 00:37:03'),(378,158,'ddd',8,'买家已收货','Customer has received','2013-12-24 00:37:12'),(379,158,'ddd',8,'用户投诉该订单','Customer complain this order','2013-12-24 00:37:17'),(380,158,'123',1,'卖家退款','Seller return money to customer','2013-12-24 00:37:50'),(381,158,'Server',0,'关闭订单','System closed the order','2013-12-24 00:37:50'),(382,158,'Server',0,'关闭订单','System closed the order','2013-12-24 00:37:50'),(383,158,'Server',0,'关闭订单','System closed the order','2013-12-24 00:37:50'),(384,159,'toko',8,'用户提交订单，等待支付','Customer submited the order, waiting for pay money','2013-12-26 23:24:51'),(385,159,'toko',8,'用户已经支付，等待系统确认','Customer pay the order, waiting for repsonse','2013-12-26 23:24:55'),(386,159,'123',10000,'卖家已发货，等待用户查收','Seller has send, waiting for receive','2013-12-26 23:25:08'),(387,159,'toko',8,'买家已收货','Customer has received','2013-12-26 23:25:13'),(388,159,'toko',8,'用户投诉该订单','Customer complain this order','2013-12-26 23:25:20'),(389,159,'123',10000,'卖家退款','Seller return money to customer','2013-12-26 23:29:30'),(390,160,'toko',8,'用户提交订单，等待支付','Customer submited the order, waiting for pay money','2013-12-26 23:34:06'),(391,160,'toko',8,'用户已经支付，等待系统确认','Customer pay the order, waiting for repsonse','2013-12-26 23:34:08'),(392,160,'123',10000,'卖家已发货，等待用户查收','Seller has send, waiting for receive','2013-12-26 23:34:23'),(393,160,'toko',8,'买家已收货','Customer has received','2013-12-26 23:34:28'),(394,160,'toko',8,'用户投诉该订单','Customer complain this order','2013-12-26 23:34:32'),(395,160,'123',10000,'卖家退款','Seller return money to customer','2013-12-26 23:35:08'),(396,160,'Server',0,'关闭订单','System closed the order','2013-12-26 23:35:08'),(397,160,'toko',8,'买家要求退货','Customer want to send back','2013-12-26 23:35:34'),(398,160,'Server',0,'关闭订单','System closed the order','2013-12-26 23:36:07'),(399,161,'toko',8,'用户提交订单，等待支付','Customer submited the order, waiting for pay money','2013-12-26 23:43:40'),(400,161,'toko',8,'用户已经支付，等待系统确认','Customer pay the order, waiting for repsonse','2013-12-26 23:43:43'),(401,161,'123',10000,'卖家已发货，等待用户查收','Seller has send, waiting for receive','2013-12-26 23:43:55'),(402,161,'toko',8,'买家已收货','Customer has received','2013-12-26 23:44:01'),(403,161,'toko',8,'用户投诉该订单','Customer complain this order','2013-12-26 23:44:05'),(404,161,'123',10000,'卖家退款, 返款比例为 : 100%.','Seller return money to customer, return percent is : 100%.','2013-12-26 23:44:12'),(405,161,'Server',0,'关闭订单','System closed the order','2013-12-26 23:44:13'),(406,161,'Server',0,'关闭订单','System closed the order','2013-12-26 23:44:13'),(407,162,'toko',8,'用户提交订单，等待支付','Customer submited the order, waiting for pay money','2013-12-26 23:52:33'),(408,162,'toko',8,'用户已经支付，等待系统确认','Customer pay the order, waiting for repsonse','2013-12-26 23:52:35'),(409,162,'123',10000,'卖家已发货，等待用户查收','Seller has send, waiting for receive','2013-12-26 23:52:55'),(410,162,'toko',8,'买家已收货','Customer has received','2013-12-26 23:52:59'),(411,162,'toko',8,'用户投诉该订单','Customer complain this order','2013-12-26 23:54:38'),(412,163,'toko',8,'用户提交订单，等待支付','Customer submited the order, waiting for pay money','2013-12-26 23:55:12'),(413,163,'toko',8,'用户已经支付，等待系统确认','Customer pay the order, waiting for repsonse','2013-12-26 23:55:15'),(414,163,'123',10000,'卖家已发货，等待用户查收','Seller has send, waiting for receive','2013-12-26 23:55:40'),(415,163,'toko',8,'用户投诉该订单','Customer complain this order','2013-12-27 00:00:57'),(416,164,'toko',8,'用户提交订单，等待支付','Customer submited the order, waiting for pay money','2013-12-28 01:27:07'),(417,164,'toko',8,'用户已经支付，等待系统确认','Customer pay the order, waiting for repsonse','2013-12-28 01:27:11'),(418,164,'123',10000,'卖家已发货，等待用户查收','Seller has send, waiting for receive','2013-12-28 01:27:29'),(419,164,'toko',8,'买家已收货','Customer has received','2013-12-28 01:27:37'),(420,164,'toko',8,'用户投诉该订单','Customer complain this order','2013-12-28 01:27:42'),(421,164,'123',10000,'卖家退款, 返款比例为 : 20%.','Seller return money to customer, return percent is : 20%.','2013-12-28 01:27:56'),(422,164,'Server',0,'关闭订单','System closed the order','2013-12-28 01:27:56'),(423,165,'toko',8,'用户提交订单，等待支付','Customer submited the order, waiting for pay money','2013-12-28 01:29:34'),(424,165,'toko',8,'用户已经支付，等待系统确认','Customer pay the order, waiting for repsonse','2013-12-28 01:29:36'),(425,165,'123',10000,'卖家已发货，等待用户查收','Seller has send, waiting for receive','2013-12-28 01:29:47'),(426,165,'toko',8,'买家已收货','Customer has received','2013-12-28 01:29:53'),(427,165,'toko',8,'用户投诉该订单','Customer complain this order','2013-12-28 01:30:15'),(428,165,'123',10000,'卖家退款, 返款比例为 : 50%.','Seller return money to customer, return percent is : 50%.','2013-12-28 01:30:29'),(429,165,'Server',0,'关闭订单','System closed the order','2013-12-28 01:30:29'),(430,165,'toko',8,'买家要求退货','Customer want to send back','2013-12-28 14:40:10'),(431,164,'toko',8,'买家要求退货','Customer want to send back','2013-12-28 14:43:54'),(432,166,'toko',8,'用户提交订单，等待支付','Customer submited the order, waiting for pay money','2013-12-28 15:11:15'),(433,166,'toko',8,'用户已经支付，等待系统确认','Customer pay the order, waiting for repsonse','2013-12-28 15:11:17'),(434,166,'123',10000,'卖家已发货，等待用户查收','Seller has send, waiting for receive','2013-12-28 15:11:30'),(435,166,'toko',8,'买家已收货','Customer has received','2013-12-28 15:11:35'),(436,166,'toko',8,'买家要求退货','Customer want to send back','2013-12-28 15:13:58'),(437,166,'123',10000,'卖家退款, 返款比例为 : 100%.','Seller return money to customer, return percent is : 100%.','2013-12-28 15:14:07'),(438,166,'Server',0,'关闭订单','System closed the order','2013-12-28 15:14:07'),(439,167,'toko',8,'用户提交订单，等待支付','Customer submited the order, waiting for pay money','2013-12-28 15:16:44'),(440,167,'toko',8,'用户已经支付，等待系统确认','Customer pay the order, waiting for repsonse','2013-12-28 15:16:45'),(441,167,'123',10000,'卖家已发货，等待用户查收','Seller has send, waiting for receive','2013-12-28 15:16:54'),(442,167,'toko',8,'买家已收货','Customer has received','2013-12-28 15:17:00'),(443,167,'toko',8,'用户投诉该订单','Customer complain this order','2013-12-28 15:17:03'),(444,167,'123',10000,'卖家退款, 返款比例为 : 25%.','Seller return money to customer, return percent is : 25%.','2013-12-28 15:17:22'),(445,167,'Server',0,'关闭订单','System closed the order','2013-12-28 15:17:22'),(446,168,'toko',8,'用户提交订单，等待支付','Customer submited the order, waiting for pay money','2013-12-28 15:21:46'),(447,168,'toko',8,'用户已经支付，等待系统确认','Customer pay the order, waiting for repsonse','2013-12-28 15:21:47'),(448,168,'123',10000,'卖家已发货，等待用户查收','Seller has send, waiting for receive','2013-12-28 15:21:56'),(449,168,'toko',8,'买家已收货','Customer has received','2013-12-28 15:22:01'),(450,168,'toko',8,'用户投诉该订单','Customer complain this order','2013-12-28 15:22:05'),(451,168,'toko',8,'买家已收货','Customer has received','2013-12-28 15:50:37'),(452,168,'toko',8,'用户投诉该订单','Customer complain this order','2013-12-28 15:51:08'),(453,168,'toko',8,'买家已收货','Customer has received','2013-12-28 16:01:14'),(454,168,'toko',8,'用户投诉该订单','Customer complain this order','2013-12-28 16:01:56'),(455,168,'toko',8,'买家已收货','Customer has received','2013-12-28 16:44:10'),(456,169,'toko',8,'用户提交订单，等待支付','Customer submited the order, waiting for pay money','2013-12-28 17:31:12'),(457,169,'toko',8,'用户已经支付，等待系统确认','Customer pay the order, waiting for repsonse','2013-12-28 17:31:15'),(458,170,'toko',8,'用户提交订单，等待支付','Customer submited the order, waiting for pay money','2013-12-28 17:36:00'),(459,171,'toko',8,'用户提交订单，等待支付','Customer submited the order, waiting for pay money','2013-12-28 17:36:19'),(460,172,'toko',8,'用户提交订单，等待支付','Customer submited the order, waiting for pay money','2013-12-28 17:37:28'),(461,169,'toko',8,'用户投诉该订单','Customer complain this order','2013-12-28 17:40:35'),(462,173,'toko',8,'用户提交订单，等待支付','Customer submited the order, waiting for pay money','2013-12-28 21:28:30'),(463,174,'toko',8,'用户提交订单，等待支付','Customer submited the order, waiting for pay money','2013-12-28 21:28:54'),(464,175,'USA',10000,'用户提交订单，等待支付','Customer submited the order, waiting for pay money','2013-12-28 22:47:48'),(465,175,'USA',10000,'用户已经支付，等待系统确认','Customer pay the order, waiting for repsonse','2013-12-28 22:48:01'),(466,176,'USA',10000,'用户提交订单，等待支付','Customer submited the order, waiting for pay money','2013-12-28 23:05:13'),(467,177,'USA',10000,'用户提交订单，等待支付','Customer submited the order, waiting for pay money','2013-12-28 23:05:33'),(468,176,'USA',10000,'用户取消该订单','Customer canceled this order','2013-12-28 23:05:40'),(469,177,'USA',10000,'用户已经支付，等待系统确认','Customer pay the order, waiting for repsonse','2013-12-28 23:05:45'),(470,178,'CHina',10000,'用户提交订单，等待支付','Customer submited the order, waiting for pay money','2013-12-28 23:11:17'),(471,178,'CHina',10000,'用户已经支付，等待系统确认','Customer pay the order, waiting for repsonse','2013-12-28 23:11:23'),(472,175,'123',1,'卖家已发货，等待用户查收','Seller has send, waiting for receive','2013-12-28 23:12:53'),(473,177,'123',1,'卖家已发货，等待用户查收','Seller has send, waiting for receive','2013-12-28 23:13:42'),(474,178,'123',1,'卖家已发货，等待用户查收','Seller has send, waiting for receive','2013-12-28 23:14:51'),(475,175,'USA',10000,'用户投诉该订单','Customer complain this order','2013-12-28 23:15:30'),(476,175,'123',1,'卖家退款, 返款比例为 : 100%.','Seller return money to customer, return percent is : 100%.','2013-12-28 23:15:46'),(477,175,'Server',0,'关闭订单','System closed the order','2013-12-28 23:15:46'),(478,177,'USA',10000,'用户投诉该订单','Customer complain this order','2013-12-28 23:16:26'),(479,179,'ddd',8,'用户提交订单，等待支付','Customer submited the order, waiting for pay money','2013-12-29 14:58:25'),(480,179,'ddd',8,'用户已经支付，等待系统确认','Customer pay the order, waiting for repsonse','2013-12-29 14:58:35'),(481,179,'123',1,'卖家已发货，等待用户查收','Seller has send, waiting for receive','2013-12-29 18:47:54'),(482,178,'CHina',10000,'买家已收货','Customer has received','2013-12-29 18:58:26'),(483,180,'USA',10003,'用户提交订单，等待支付','Customer submited the order, waiting for pay money','2013-12-29 20:15:29'),(484,180,'USA',10003,'用户已经支付，等待系统确认','Customer pay the order, waiting for repsonse','2013-12-29 20:15:40'),(485,180,'123',1,'卖家已发货，等待用户查收','Seller has send, waiting for receive','2013-12-29 20:19:28'),(486,180,'USA',10003,'买家已收货','Customer has received','2013-12-29 20:19:45'),(487,181,'USA',10003,'用户提交订单，等待支付','Customer submited the order, waiting for pay money','2013-12-29 20:21:31'),(488,181,'USA',10003,'用户已经支付，等待系统确认','Customer pay the order, waiting for repsonse','2013-12-29 20:21:43'),(489,181,'123',1,'卖家已发货，等待用户查收','Seller has send, waiting for receive','2013-12-29 21:02:13'),(490,181,'USA',10003,'买家要求退货','Customer want to send back','2013-12-29 21:25:31'),(491,182,'USA',10003,'用户提交订单，等待支付','Customer submited the order, waiting for pay money','2013-12-29 21:41:03'),(492,182,'USA',10003,'用户已经支付，等待系统确认','Customer pay the order, waiting for repsonse','2013-12-29 21:41:07'),(493,182,'123',1,'卖家已发货，等待用户查收','Seller has send, waiting for receive','2013-12-29 21:41:35'),(494,182,'USA',10003,'买家要求退货','Customer want to send back','2013-12-29 21:54:54'),(495,181,'123',1,'卖家退款, 返款比例为 : 75%.','Seller return money to customer, return percent is : 75%.','2013-12-29 21:58:28'),(496,181,'Server',0,'关闭订单','System closed the order','2013-12-29 21:58:28'),(497,183,'USA',10003,'用户提交订单，等待支付','Customer submited the order, waiting for pay money','2013-12-29 22:21:11'),(498,183,'USA',10003,'用户已经支付，等待系统确认','Customer pay the order, waiting for repsonse','2013-12-29 22:22:05'),(499,183,'123',1,'卖家已发货，等待用户查收','Seller has send, waiting for receive','2013-12-29 22:22:52'),(500,183,'USA',10003,'买家已收货','Customer has received','2013-12-29 22:23:32'),(501,177,'123',1,'卖家退款, 返款比例为 : 95%.','Seller return money to customer, return percent is : 95%.','2013-12-30 16:28:31'),(502,177,'Server',0,'关闭订单','System closed the order','2013-12-30 16:28:31'),(503,179,'ddd',8,'用户投诉该订单','Customer complain this order','2013-12-30 23:48:42'),(504,169,'123',10000,'卖家退款, 返款比例为 : 20%.','Seller return money to customer, return percent is : 20%.','2013-12-31 00:04:48'),(505,169,'Server',0,'关闭订单','System closed the order','2013-12-31 00:04:48'),(506,168,'toko',8,'用户投诉该订单','Customer complain this order','2013-12-31 00:13:51'),(507,184,'ddd',8,'用户提交订单，等待支付','Customer submited the order, waiting for pay money','2013-12-31 00:17:12'),(508,184,'ddd',8,'用户已经支付，等待系统确认','Customer pay the order, waiting for repsonse','2013-12-31 00:17:30'),(509,174,'toko',8,'用户已经支付，等待系统确认','Customer pay the order, waiting for repsonse','2013-12-31 00:17:35'),(510,174,'123',10000,'卖家已发货，等待用户查收','Seller has send, waiting for receive','2013-12-31 00:17:46'),(511,174,'toko',8,'买家已收货','Customer has received','2013-12-31 00:17:51'),(512,174,'toko',8,'用户投诉该订单','Customer complain this order','2013-12-31 00:18:00'),(513,185,'USA',10000,'用户提交订单，等待支付','Customer submited the order, waiting for pay money','2013-12-31 22:00:55'),(514,185,'USA',10000,'用户已经支付，等待系统确认','Customer pay the order, waiting for repsonse','2013-12-31 22:01:01'),(515,185,'123',1,'卖家已发货，等待用户查收','Seller has send, waiting for receive','2013-12-31 22:04:07'),(516,186,'USA',10000,'用户提交订单，等待支付','Customer submited the order, waiting for pay money','2013-12-31 22:05:57'),(517,186,'USA',10000,'用户已经支付，等待系统确认','Customer pay the order, waiting for repsonse','2013-12-31 22:06:01'),(518,187,'USA',10000,'用户提交订单，等待支付','Customer submited the order, waiting for pay money','2013-12-31 22:12:09'),(519,187,'USA',10000,'用户已经支付，等待系统确认','Customer pay the order, waiting for repsonse','2013-12-31 22:12:16'),(520,184,'123',1,'商户取消该订单','Seller canceled this order','2013-12-31 22:12:34'),(521,188,'USA',10000,'用户提交订单，等待支付','Customer submited the order, waiting for pay money','2013-12-31 22:13:01'),(522,188,'USA',10000,'用户已经支付，等待系统确认','Customer pay the order, waiting for repsonse','2013-12-31 22:13:07'),(523,186,'AB',10004,'商户取消该订单','Seller canceled this order','2013-12-31 22:17:34'),(524,187,'AB',10004,'卖家已发货，等待用户查收','Seller has send, waiting for receive','2013-12-31 22:19:36'),(525,187,'USA',10000,'用户投诉该订单','Customer complain this order','2013-12-31 22:19:55'),(526,188,'USA',10000,'用户投诉该订单','Customer complain this order','2013-12-31 22:20:09'),(527,188,'123',1,'卖家退款, 返款比例为 : 8%.','Seller return money to customer, return percent is : 8%.','2013-12-31 22:23:13'),(528,188,'Server',0,'关闭订单','System closed the order','2013-12-31 22:23:13'),(529,187,'AB',10004,'卖家退款, 返款比例为 : 100%.','Seller return money to customer, return percent is : 100%.','2013-12-31 22:29:51'),(530,187,'Server',0,'关闭订单','System closed the order','2013-12-31 22:29:51'),(531,185,'Server',0,'系统自动关闭订单','System closed the order','2014-01-01 00:30:00'),(532,189,'USA',10000,'用户提交订单，等待支付','Customer submited the order, waiting for pay money','2014-01-02 22:07:56'),(533,190,'USA',10000,'用户提交订单，等待支付','Customer submited the order, waiting for pay money','2014-01-02 22:08:05'),(534,189,'USA',10000,'用户取消该订单','Customer canceled this order','2014-01-02 22:08:15'),(535,190,'USA',10000,'用户已经支付，等待系统确认','Customer pay the order, waiting for repsonse','2014-01-02 22:08:22'),(536,190,'123',1,'卖家已发货，等待用户查收','Seller has send, waiting for receive','2014-01-02 22:09:39'),(537,190,'123',1,'卖家已发货，等待用户查收','Seller has send, waiting for receive','2014-01-02 22:14:42'),(538,190,'USA',10000,'买家已收货','Customer has received','2014-01-02 22:15:25'),(539,191,'USA',10000,'用户提交订单，等待支付','Customer submited the order, waiting for pay money','2014-01-02 22:16:09'),(540,191,'USA',10000,'用户已经支付，等待系统确认','Customer pay the order, waiting for repsonse','2014-01-02 22:16:13'),(541,191,'USA',10000,'用户投诉该订单','Customer complain this order','2014-01-02 22:16:37'),(542,191,'123',1,'卖家退款, 返款比例为 : 100%.','Seller return money to customer, return percent is : 100%.','2014-01-02 22:16:52'),(543,191,'Server',0,'关闭订单','System closed the order','2014-01-02 22:16:52'),(544,192,'USA',10000,'用户提交订单，等待支付','Customer submited the order, waiting for pay money','2014-01-02 22:22:24'),(545,192,'USA',10000,'用户已经支付，等待系统确认','Customer pay the order, waiting for repsonse','2014-01-02 22:22:28'),(546,192,'123',1,'卖家已发货，等待用户查收','Seller has send, waiting for receive','2014-01-02 22:23:04'),(547,193,'USA',10000,'用户提交订单，等待支付','Customer submited the order, waiting for pay money','2014-01-02 22:28:35'),(548,193,'USA',10000,'用户已经支付，等待系统确认','Customer pay the order, waiting for repsonse','2014-01-02 22:29:01'),(549,192,'Server',0,'系统自动关闭订单','System closed the order','2014-01-02 22:30:00'),(550,193,'AB',10004,'卖家已发货，等待用户查收','Seller has send, waiting for receive','2014-01-02 22:32:19'),(551,193,'USA',10000,'用户投诉该订单','Customer complain this order','2014-01-02 22:32:54'),(552,193,'AB',10004,'卖家退款, 返款比例为 : 40%.','Seller return money to customer, return percent is : 40%.','2014-01-02 22:36:17'),(553,193,'Server',0,'关闭订单','System closed the order','2014-01-02 22:36:17'),(554,194,'USA',10000,'用户提交订单，等待支付','Customer submited the order, waiting for pay money','2014-01-02 22:38:06'),(555,194,'USA',10000,'用户已经支付，等待系统确认','Customer pay the order, waiting for repsonse','2014-01-02 22:38:13'),(556,194,'AB',10004,'商户取消该订单','Seller canceled this order','2014-01-02 22:48:48'),(557,195,'USA',10000,'用户提交订单，等待支付','Customer submited the order, waiting for pay money','2014-01-02 22:50:12'),(558,195,'USA',10000,'用户已经支付，等待系统确认','Customer pay the order, waiting for repsonse','2014-01-02 22:50:16'),(559,195,'123',1,'卖家已发货，等待用户查收','Seller has send, waiting for receive','2014-01-02 22:50:34'),(560,195,'USA',10000,'用户投诉该订单','Customer complain this order','2014-01-02 22:50:50'),(561,195,'USA',10000,'投诉被撤消','the claim is cancelled','2014-01-02 22:50:54'),(562,195,'USA',10000,'买家已收货','Customer has received','2014-01-02 22:52:49'),(563,193,'Server',0,'系统自动关闭订单','System closed the order','2014-01-02 23:30:00'),(564,196,'USA',10003,'用户提交订单，等待支付','Customer submited the order, waiting for pay money','2014-01-03 16:43:34'),(565,197,'USA',10003,'用户提交订单，等待支付','Customer submited the order, waiting for pay money','2014-01-03 16:46:30'),(566,197,'USA',10003,'用户已经支付，等待系统确认','Customer pay the order, waiting for repsonse','2014-01-03 16:46:58'),(567,198,'China',10003,'用户提交订单，等待支付','Customer submited the order, waiting for pay money','2014-01-03 17:01:52'),(568,198,'China',10003,'用户已经支付，等待系统确认','Customer pay the order, waiting for repsonse','2014-01-03 17:03:05'),(569,199,'USA',10003,'用户提交订单，等待支付','Customer submited the order, waiting for pay money','2014-01-03 17:04:04'),(570,199,'USA',10003,'用户已经支付，等待系统确认','Customer pay the order, waiting for repsonse','2014-01-03 17:04:08'),(571,200,'beijing',8,'用户提交订单，等待支付','Customer submited the order, waiting for pay money','2014-01-04 01:24:18'),(572,201,'beijing',8,'用户提交订单，等待支付','Customer submited the order, waiting for pay money','2014-01-04 01:55:26'),(573,201,'beijing',8,'用户已经支付，等待系统确认','Customer pay the order, waiting for repsonse','2014-01-04 01:57:06'),(574,200,'beijing',8,'用户已经支付，等待系统确认','Customer pay the order, waiting for repsonse','2014-01-04 01:57:09'),(575,201,'123',1,'卖家已发货，等待用户查收','Seller has send, waiting for receive','2014-01-04 01:57:20'),(576,200,'123',1,'商户取消该订单','Seller canceled this order','2014-01-04 01:57:29'),(577,201,'beijing',8,'买家已收货','Customer has received','2014-01-04 01:57:43'),(578,202,'USA',10003,'用户提交订单，等待支付','Customer submited the order, waiting for pay money','2014-01-04 22:47:04'),(579,202,'USA',10003,'用户已经支付，等待系统确认','Customer pay the order, waiting for repsonse','2014-01-04 22:47:09'),(580,202,'123',1,'卖家已发货，等待用户查收','Seller has send, waiting for receive','2014-01-04 22:49:47'),(581,203,'USA',10003,'用户提交订单，等待支付','Customer submited the order, waiting for pay money','2014-01-04 23:01:51'),(582,203,'USA',10003,'用户已经支付，等待系统确认','Customer pay the order, waiting for repsonse','2014-01-04 23:01:56'),(583,202,'Server',0,'系统自动关闭订单','System closed the order','2014-01-04 23:30:00'),(584,203,'USA',10003,'用户投诉该订单','Customer complain this order','2014-01-05 10:15:32'),(585,202,'USA',10003,'买家要求退货','Customer want to send back','2014-01-05 10:56:49'),(586,204,'USA',10003,'用户提交订单，等待支付','Customer submited the order, waiting for pay money','2014-01-06 21:46:25'),(587,204,'USA',10003,'用户已经支付，等待系统确认','Customer pay the order, waiting for repsonse','2014-01-06 21:46:30'),(588,204,'123',1,'卖家已发货，等待用户查收','Seller has send, waiting for receive','2014-01-06 21:50:16'),(589,205,'USA',10003,'用户提交订单，等待支付','Customer submited the order, waiting for pay money','2014-01-06 21:52:30'),(590,205,'USA',10003,'用户已经支付，等待系统确认','Customer pay the order, waiting for repsonse','2014-01-06 21:52:35'),(591,205,'123',1,'卖家已发货，等待用户查收','Seller has send, waiting for receive','2014-01-06 21:52:56'),(592,205,'USA',10003,'买家已收货','Customer has received','2014-01-06 21:53:16'),(593,202,'123',1,'卖家退款, 返款比例为 : 100.0%.','Seller return money to customer, return percent is : 100.0%.','2014-01-06 21:54:13'),(594,202,'Server',0,'关闭订单','System closed the order','2014-01-06 21:54:13'),(595,206,'USA',10003,'用户提交订单，等待支付','Customer submited the order, waiting for pay money','2014-01-06 22:04:24'),(596,206,'USA',10003,'用户已经支付，等待系统确认','Customer pay the order, waiting for repsonse','2014-01-06 22:04:28'),(597,206,'123',1,'卖家已发货，等待用户查收','Seller has send, waiting for receive','2014-01-06 22:04:54'),(598,206,'USA',10003,'买家要求退货','Customer want to send back','2014-01-06 22:05:16'),(599,207,'USA',10003,'用户提交订单，等待支付','Customer submited the order, waiting for pay money','2014-01-06 22:15:14'),(600,207,'USA',10003,'用户已经支付，等待系统确认','Customer pay the order, waiting for repsonse','2014-01-06 22:15:19'),(601,207,'123',1,'商户取消该订单','Seller canceled this order','2014-01-06 22:18:02'),(602,208,'USA',10000,'用户提交订单，等待支付','Customer submited the order, waiting for pay money','2014-01-06 22:30:24'),(603,208,'USA',10000,'用户已经支付，等待系统确认','Customer pay the order, waiting for repsonse','2014-01-06 22:30:31'),(604,208,'123',1,'卖家已发货，等待用户查收','Seller has send, waiting for receive','2014-01-06 22:31:38'),(605,208,'123',1,'卖家修改了发货信息','Seller update the shipping information','2014-01-06 22:30:30'),(606,208,'USA',10000,'用户投诉该订单','Customer complain this order','2014-01-06 22:37:32'),(607,208,'USA',10000,'投诉被撤消','the claim is cancelled','2014-01-06 22:37:44'),(608,208,'USA',10000,'投诉被撤消','the claim is cancelled','2014-01-06 22:37:55'),(609,208,'USA',10000,'买家已收货','Customer has received','2014-01-06 22:38:30'),(610,209,'USA',10000,'用户提交订单，等待支付','Customer submited the order, waiting for pay money','2014-01-06 22:38:46'),(611,209,'USA',10000,'用户已经支付，等待系统确认','Customer pay the order, waiting for repsonse','2014-01-06 22:39:11'),(612,209,'USA',10000,'用户投诉该订单','Customer complain this order','2014-01-06 22:39:29'),(613,209,'USA',10000,'投诉被撤消','the claim is cancelled','2014-01-06 22:43:27'),(614,201,'beijing',8,'用户投诉该订单','Customer complain this order','2014-01-07 22:00:46'),(615,210,'ddd',8,'用户提交订单，等待支付','Customer submited the order, waiting for pay money','2014-01-07 22:01:11'),(616,210,'ddd',8,'用户已经支付，等待系统确认','Customer pay the order, waiting for repsonse','2014-01-07 22:01:13'),(617,211,'ddd',8,'用户提交订单，等待支付','Customer submited the order, waiting for pay money','2014-01-07 23:22:22'),(618,211,'ddd',8,'用户已经支付，等待系统确认','Customer pay the order, waiting for repsonse','2014-01-07 23:22:25'),(619,212,'beijing',8,'用户提交订单，等待支付','Customer submited the order, waiting for pay money','2014-01-07 23:23:00'),(620,212,'beijing',8,'用户已经支付，等待系统确认','Customer pay the order, waiting for repsonse','2014-01-07 23:23:03'),(621,212,'123',1,'卖家已发货，等待用户查收','Seller has send, waiting for receive','2014-01-07 23:23:25'),(622,211,'123',1,'卖家已发货，等待用户查收','Seller has send, waiting for receive','2014-01-07 23:23:38'),(623,212,'beijing',8,'买家已收货','Customer has received','2014-01-07 23:23:54'),(624,211,'ddd',8,'买家已收货','Customer has received','2014-01-07 23:23:55'),(625,213,'ddd',8,'用户提交订单，等待支付','Customer submited the order, waiting for pay money','2014-01-07 23:25:34'),(626,214,'beijing',8,'用户提交订单，等待支付','Customer submited the order, waiting for pay money','2014-01-07 23:25:45'),(627,215,'beijing',8,'用户提交订单，等待支付','Customer submited the order, waiting for pay money','2014-01-07 23:25:53'),(628,215,'beijing',8,'用户已经支付，等待系统确认','Customer pay the order, waiting for repsonse','2014-01-07 23:25:56'),(629,214,'beijing',8,'用户已经支付，等待系统确认','Customer pay the order, waiting for repsonse','2014-01-07 23:26:01'),(630,215,'123',1,'卖家已发货，等待用户查收','Seller has send, waiting for receive','2014-01-07 23:26:14'),(631,215,'beijing',8,'买家已收货','Customer has received','2014-01-07 23:26:49'),(632,215,'beijing',8,'用户投诉该订单','Customer complain this order','2014-01-07 23:27:48'),(633,215,'beijing',8,'投诉被撤消','the claim is cancelled','2014-01-07 23:28:48'),(634,215,'beijing',8,'用户投诉该订单','Customer complain this order','2014-01-07 23:29:08'),(635,213,'ddd',8,'用户已经支付，等待系统确认','Customer pay the order, waiting for repsonse','2014-01-07 23:55:46'),(636,213,'123',1,'卖家已发货，等待用户查收','Seller has send, waiting for receive','2014-01-07 23:56:10'),(637,213,'ddd',8,'买家已收货','Customer has received','2014-01-07 23:56:23'),(638,213,'ddd',8,'用户投诉该订单','Customer complain this order','2014-01-07 23:57:40'),(639,213,'ddd',8,'投诉被撤消','the claim is cancelled','2014-01-07 23:58:15'),(640,216,'ddd',8,'用户提交订单，等待支付','Customer submited the order, waiting for pay money','2014-01-08 00:06:28'),(641,216,'ddd',8,'用户已经支付，等待系统确认','Customer pay the order, waiting for repsonse','2014-01-08 00:06:31'),(642,216,'123',1,'卖家已发货，等待用户查收','Seller has send, waiting for receive','2014-01-08 00:06:49'),(643,216,'ddd',8,'用户投诉该订单','Customer complain this order','2014-01-08 00:07:08'),(644,216,'ddd',8,'投诉被撤消','the claim is cancelled','2014-01-08 00:09:51'),(645,216,'ddd',8,'用户投诉该订单','Customer complain this order','2014-01-08 00:11:26'),(646,216,'ddd',8,'投诉被撤消','the claim is cancelled','2014-01-08 00:13:13'),(647,216,'ddd',8,'买家已收货','Customer has received','2014-01-08 00:18:25'),(648,216,'ddd',8,'用户投诉该订单','Customer complain this order','2014-01-08 00:23:11'),(649,216,'ddd',8,'投诉被撤消','the claim is cancelled','2014-01-08 00:23:42'),(650,216,'ddd',8,'用户投诉该订单','Customer complain this order','2014-01-08 00:27:19'),(651,216,'ddd',8,'投诉被撤消','the claim is cancelled','2014-01-08 00:35:03'),(652,216,'ddd',8,'用户投诉该订单','Customer complain this order','2014-01-08 00:35:11'),(653,216,'123',1,'卖家退款, 返款比例为 : 15.0%.','Seller return money to customer, return percent is : 15.0%.','2014-01-08 00:36:23'),(654,216,'Server',0,'关闭订单','System closed the order','2014-01-08 00:36:23'),(655,217,'ddd',8,'用户提交订单，等待支付','Customer submited the order, waiting for pay money','2014-01-08 00:38:35'),(656,217,'ddd',8,'用户已经支付，等待系统确认','Customer pay the order, waiting for repsonse','2014-01-08 00:38:37'),(657,217,'ddd',8,'用户投诉该订单','Customer complain this order','2014-01-08 00:38:41'),(658,217,'ddd',8,'投诉被撤消','the claim is cancelled','2014-01-08 00:40:37'),(659,217,'123',1,'商户取消该订单','Seller canceled this order','2014-01-08 00:40:56'),(660,218,'ddd',8,'用户提交订单，等待支付','Customer submited the order, waiting for pay money','2014-01-08 00:46:03'),(661,218,'ddd',8,'用户已经支付，等待系统确认','Customer pay the order, waiting for repsonse','2014-01-08 00:46:18'),(662,219,'ddd',8,'用户提交订单，等待支付','Customer submited the order, waiting for pay money','2014-01-08 22:13:41'),(663,219,'ddd',8,'用户已经支付，等待系统确认','Customer pay the order, waiting for repsonse','2014-01-08 22:13:44'),(664,220,'ddd',8,'用户提交订单，等待支付','Customer submited the order, waiting for pay money','2014-01-08 22:19:22'),(665,220,'ddd',8,'该订单发生错误','Something wrong to this order, such as out of stock , wrong address ','2014-01-08 22:26:33'),(666,221,'ddd',8,'用户提交订单，等待支付','Customer submited the order, waiting for pay money','2014-01-08 22:27:38'),(667,221,'ddd',8,'用户已经支付，等待系统确认','Customer pay the order, waiting for repsonse','2014-01-08 22:28:45'),(668,222,'ddd',8,'用户提交订单，等待支付','Customer submited the order, waiting for pay money','2014-01-08 22:54:12'),(669,222,'ddd',8,'用户已经支付，等待系统确认','Customer pay the order, waiting for repsonse','2014-01-08 22:54:14'),(670,223,'ddd',8,'用户提交订单，等待支付','Customer submited the order, waiting for pay money','2014-01-08 22:58:26'),(671,223,'ddd',8,'用户已经支付，等待系统确认','Customer pay the order, waiting for repsonse','2014-01-08 22:59:12'),(672,224,'ddd',8,'用户提交订单，等待支付','Customer submited the order, waiting for pay money','2014-01-08 23:01:14'),(673,224,'ddd',8,'用户已经支付，等待系统确认','Customer pay the order, waiting for repsonse','2014-01-08 23:01:16'),(674,225,'ddd',8,'用户提交订单，等待支付','Customer submited the order, waiting for pay money','2014-01-08 23:02:54'),(675,225,'ddd',8,'用户已经支付，等待系统确认','Customer pay the order, waiting for repsonse','2014-01-08 23:02:56'),(676,226,'ddd',8,'用户提交订单，等待支付','Customer submited the order, waiting for pay money','2014-01-08 23:06:07'),(677,226,'ddd',8,'用户已经支付，等待系统确认','Customer pay the order, waiting for repsonse','2014-01-08 23:06:09'),(678,227,'ddd',8,'用户提交订单，等待支付','Customer submited the order, waiting for pay money','2014-01-08 23:15:01'),(679,227,'ddd',8,'用户已经支付，等待系统确认','Customer pay the order, waiting for repsonse','2014-01-08 23:15:05');
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
  `cancelReason` int(11) DEFAULT NULL,
  `cancelComment` varchar(500) DEFAULT NULL,
  `sendLogAt` datetime DEFAULT NULL,
  `returnDate` datetime DEFAULT NULL,
  `returnFlag` int(11) DEFAULT '0',
  `coinage` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=228 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (216,19,0,19,'2014-01-08 00:06:28',NULL,'ddd','23','1','USA','222',8,1,'123',0,NULL,12,'2014-01-08 00:00:00','2','1','3',123.5,0,123.5,20,130,20,130,0,NULL,'2014-01-08 00:06:49',NULL,2,1),(217,9.5,0,9.5,'2014-01-08 00:38:35',NULL,'ddd','23','1','USA','222',8,1,'123',0,NULL,11,NULL,NULL,NULL,NULL,61.75,0,61.75,10,65,10,65,1,'',NULL,NULL,0,1),(218,380,0,380,'2014-01-08 00:46:02',NULL,'ddd','23','1','USA','222',8,1,'123',0,NULL,2,NULL,NULL,NULL,NULL,2470,0,2470,400,2600,400,2600,0,NULL,NULL,NULL,0,1),(219,7524,0,7524,'2014-01-08 22:13:41',NULL,'ddd','23','1','USA','222',8,1,'123',0,NULL,2,NULL,NULL,NULL,NULL,48906,0,48906,7920,51480,7920,51480,0,NULL,NULL,NULL,0,1),(220,1900,0,1900,'2014-01-08 22:19:21',NULL,'ddd','23','1','USA','222',8,1,'123',0,NULL,7,NULL,NULL,NULL,NULL,12350,0,12350,2000,13000,2000,13000,0,NULL,NULL,NULL,0,1),(221,1900,0,1900,'2014-01-08 22:27:38',NULL,'ddd','23','1','USA','222',8,1,'123',0,NULL,2,NULL,NULL,NULL,NULL,12350,0,12350,2000,13000,2000,13000,0,NULL,NULL,NULL,0,1),(222,1900,0,1900,'2014-01-08 22:54:12',NULL,'ddd','23','1','USA','222',8,1,'123',0,NULL,2,NULL,NULL,NULL,NULL,12350,0,12350,2000,13000,2000,13000,0,NULL,NULL,NULL,0,1),(223,1900,0,1900,'2014-01-08 22:58:26',NULL,'ddd','23','1','USA','222',8,1,'123',0,NULL,2,NULL,NULL,NULL,NULL,12350,0,12350,2000,13000,2000,13000,0,NULL,NULL,NULL,0,1),(224,1900,0,1900,'2014-01-08 23:01:14',NULL,'ddd','23','1','USA','222',8,1,'123',0,NULL,2,NULL,NULL,NULL,NULL,12350,0,12350,2000,13000,2000,13000,0,NULL,NULL,NULL,0,1),(225,5700,0,5700,'2014-01-08 23:02:54',NULL,'ddd','23','1','USA','222',8,1,'123',0,NULL,2,NULL,NULL,NULL,NULL,37050,0,37050,6000,39000,6000,39000,0,NULL,NULL,NULL,0,1),(226,5700,0,5700,'2014-01-08 23:06:07',NULL,'ddd','23','1','USA','222',8,1,'123',0,NULL,2,NULL,NULL,NULL,NULL,37050,0,37050,6000,39000,6000,39000,0,NULL,NULL,NULL,0,1),(227,5700,0,5700,'2014-01-08 23:15:01',NULL,'ddd','23','1','USA','222',8,1,'123',0,NULL,2,NULL,NULL,NULL,NULL,37050,0,37050,6000,39000,6000,39000,0,NULL,NULL,NULL,0,1);
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
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `passwordkey`
--

LOCK TABLES `passwordkey` WRITE;
/*!40000 ALTER TABLE `passwordkey` DISABLE KEYS */;
INSERT INTO `passwordkey` VALUES (1,'seller','sonyfe25cp@gmail.com','MgTtYe'),(2,'seller','seller2@tdg.com','VoLnCk'),(3,'seller','seller2@tdg.com','XdWgEs'),(4,'seller','seller2@tdg.com','XoUyJq'),(5,'seller','seller2@tdg.com','CnSmCy'),(6,'seller','seller2@tdg.com','LxFpQd'),(7,'customer','sonyfe25cp@gmail.com','DbUvFr'),(8,'customer','sonyfe25cp@gmail.com','DsKcLr'),(9,'customer','sonyfe25cp@gmail.com','GdQoAc'),(10,'customer','sonyfe25cp@gmail.com','EiJbDu'),(11,'customer','sonyfe25cp@gmail.com','FxLtDi');
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
) ENGINE=InnoDB AUTO_INCREMENT=1000084 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (1000080,'ShoesWithoutChildren','没有子产品的鞋子','<p>\n	asdfafsdf\n</p>\n<p>\n	shoes from usa\n</p>','<p>\r\n	没有子产品\r\n</p>\r\n<p>\r\n	<img src=\"/uploads/images/1388769789075.jpg\" alt=\"\" />\r\n</p>',5,1,1.5,2,400,380,'2014-01-04','2014-01-05',0,0,0,400,5,1,2,3,'4*5*1','/uploads/images/1388769550670.jpg','/uploads/images/1388769554554.jpg;/uploads/images/1388769554643.jpg;/uploads/images/1388769554787.jpg;/uploads/images/1388769554854.jpg;/uploads/images/1388769554957.jpg;/uploads/images/1388769555027.jpg;',NULL,0,0,1,24,NULL,1,1,6,16,'a11'),(1000081,'ShoesWithChildren','有子产品的鞋子','shoes from use','<img src=\"/uploads/images/1388769804227.jpg\" alt=\"\" />',5,1,2,3,350,300,'2014-01-04','2014-01-14',310,30,50,500,5,1,2,3,'4*5*1','/uploads/images/1388769627805.jpg','/uploads/images/1388769631968.jpg;/uploads/images/1388769632077.jpg;/uploads/images/1388769632155.jpg;/uploads/images/1388769632273.jpg;/uploads/images/1388769632373.jpg;/uploads/images/1388769632940.jpg;',NULL,1,0,1,35,NULL,1,1,6,16,'0'),(1000082,'ABC','ABC','<p>\n	GGGGGGG\n</p>\n<p>\n	<img src=\"/uploads/images/1388819354822.JPG\" alt=\"\" />\n</p>','GGGGG',5,1,15,15,100,90,'2014-01-04','2014-01-05',80,30,100,0,5,1,1,2,'1*2*3','undefined','',NULL,0,13,1,31,NULL,1,1,7,16,''),(1000083,'Test1','','<p>\n	GGGGGGGGGGG\n</p>\n<p style=\"text-align:left;\">\n	<img src=\"/uploads/images/1388929582395.JPG\" alt=\"\" /> \n</p>\n<p style=\"text-align:left;\">\n	FFFFFFF\n</p>\n<p style=\"text-align:left;\">\n	HHHHHH\n</p>\n<p style=\"text-align:left;\">\n	ZIZIZIZIZZIZIZIZIZZI\n</p>\n<p style=\"text-align:left;\">\n	<br />\n</p>\n<p style=\"text-align:left;\">\n	HHHHHHHHHHHH\n</p>\n<p style=\"text-align:left;\">\n	FFFFFFFFFFFFF\n</p>\n<p style=\"text-align:left;\">\n	<br />\n</p>','<p>\r\n	GGGGGGGGGGGG\r\n</p>\r\n<p>\r\n	<img src=\"http://tdg.omartech.com/uploads/images/1388929582395.JPG\" /> \r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	HHHHHHH\r\n</p>\r\n<p>\r\n	HHHHHHFFFFF\r\n</p>\r\n<p>\r\n	<br />\r\n</p>',5,0,0,0,10,9,'2014-01-05','2014-01-06',8,30,0,200,5,1,0.5,0.9,'1*2*3','/uploads/images/1388929420229.JPG','/uploads/images/1388929416637.JPG;/uploads/images/1388929477911.JPG;',NULL,0,0,1,168,NULL,1,1,6,129,'123');
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `productLine`
--

DROP TABLE IF EXISTS `productLine`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `productLine` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `english` varchar(45) DEFAULT NULL,
  `parentId` int(11) NOT NULL,
  `level` int(11) NOT NULL,
  `discount` float DEFAULT NULL,
  `commission` float DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=207 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productLine`
--

LOCK TABLES `productLine` WRITE;
/*!40000 ALTER TABLE `productLine` DISABLE KEYS */;
INSERT INTO `productLine` VALUES (16,'服装，鞋子，包包','Clothing, Shoes & Handbags',0,1,0.05,0.15),(17,'服装','Clothing',16,2,NULL,0.1),(18,'儿童，母婴用品和玩具','Kids , Maternity , Baby & Toys and Games',0,1,0.05,0.15),(19,'美容, 护肤, 美发','Beauty',0,1,0.05,0.15),(20,'化妆用品','Makeup',19,2,NULL,0.1),(21,'眼部化妆','Eyes',20,3,NULL,0.1),(22,'女装','Women’s Clothing',17,3,NULL,0.1),(23,'鞋子 ','Shoes',16,2,NULL,0.1),(24,'男装','Men’s Clothing',17,3,NULL,0.1),(25,'包包','Handbags',16,2,NULL,0.1),(26,'服饰配件','Accessories',17,3,NULL,0.1),(27,'内衣','Intimates',17,3,NULL,0.1),(28,'家居休闲服','Sleep & Lounge',17,3,NULL,0.1),(29,'泳衣','Swim',17,3,NULL,0.1),(30,'女鞋','Women’s Shoes',23,3,NULL,0.1),(31,'男鞋','Men’s Shoes',23,3,NULL,0.1),(32,'少年鞋','Boys’ Shoes',23,3,NULL,0.1),(33,'少女鞋','Girls’ Shoes',23,3,NULL,0.1),(34,'运动鞋和户外鞋','Athletic and Outdoor Shoes',23,3,NULL,0.1),(35,'鞋子护理与配件','Shoes Care & Accessories',23,3,NULL,0.1),(36,'女包','Women’s Handbags',25,3,NULL,0.1),(37,'男包','Men’s Handbags',25,3,NULL,0.1),(38,'箱包','Luggage',25,3,NULL,0.1),(39,'书包，其它包和配件','Backpacks, Bags, Cases and Accessories',25,3,NULL,0.1),(40,'妈妈用品','Maternity Products',18,2,NULL,0.1),(41,'婴儿用品','Baby Products',18,2,NULL,0.1),(42,'儿童服装','Kids’ Clothing',18,2,NULL,0.1),(43,'玩具和游戏','Toys and Games',18,2,NULL,0.1),(45,'护肤用品','Skincare Products',19,2,NULL,0.1),(46,'男士护理','Men’s Grooming',19,2,NULL,0.1),(47,'美发用品','Hair Care',19,2,NULL,0.1),(48,'香水','Perfume',19,2,NULL,0.1),(49,'配件和工具','Tools and Accessories',19,2,NULL,0.1),(50,'孕妇服装','Maternity Clothing',40,3,NULL,0.1),(51,'孕妇配件','Maternity Accessories',40,3,NULL,0.1),(52,'妈妈护理/营养 ','Mom’s care',40,3,NULL,0.1),(53,'婴儿服装','Baby’s Clothing',41,3,NULL,0.1),(54,'婴儿喂养用品','Baby Health and Food',41,3,NULL,0.1),(55,'婴儿护理用品','Baby Care',41,3,NULL,0.1),(56,'男孩服装','Boys’ Clothing',42,3,NULL,0.1),(57,'女孩服装','Girls’ Clothing',42,3,NULL,0.1),(58,'婴儿玩具和游戏','Baby’s toys and Games	',43,3,NULL,0.1),(59,'儿童玩具和游戏','Kids’ toys and Games',43,3,NULL,0.1),(60,'','',20,3,NULL,0.1),(61,'','',20,3,NULL,0.1),(62,'眼部化妆','Eyes',20,3,NULL,0.1),(63,'唇部化妆','Lips',20,3,NULL,0.1),(64,'脸部化妆','Face',20,3,NULL,0.1),(65,'美甲','Nails',20,3,NULL,0.1),(66,'脸部护理','Face',45,3,NULL,0.1),(67,'眼部护理','Eyes ',45,3,NULL,0.1),(68,'唇部护理','Lip Care',45,3,NULL,0.1),(69,'身体护理','Bath & Body',45,3,NULL,0.1),(70,'防晒','Sun',45,3,NULL,0.1),(71,'刮脸','Shave',46,3,NULL,0.1),(72,'护肤','Skin Care',46,3,NULL,0.1),(73,'身体护理','Body Care',46,3,NULL,0.1),(74,'头发护理','Hair Care',46,3,NULL,0.1),(75,'洗发水','Shampoo',47,3,NULL,0.1),(76,'护发素','Conditioner',47,3,NULL,0.1),(77,'造型用品','Styling Products',47,3,NULL,0.1),(78,'染发用品','Hair Color',47,3,NULL,0.1),(79,'特别护理','Hair Treatment',47,3,NULL,0.1),(80,'女士香水','Women’s Perfume',48,3,NULL,0.1),(81,'男士香水','Men’s Perfume',48,3,NULL,0.1),(82,'护发工具','Hair Tools',49,3,NULL,0.1),(83,'化妆工具','Makeup Brushes',49,3,NULL,0.1),(84,'美甲工具','Nail Tools',49,3,NULL,0.1),(85,'化妆包','Cosmetics Bags & Cases',49,3,NULL,0.1),(86,'清洗工具','Cleansing Tools',49,3,NULL,0.1),(87,'户外运动用品','Outdoor Recreation ',0,1,0.05,0.15),(88,'户外运动用品','Outdoor Recreation',87,2,NULL,0.1),(89,'运动服装','Athletic & Outdoor Clothing ',87,2,NULL,0.1),(90,'健身用品','Fitness & Exercises Products',87,2,NULL,0.1),(91,'其它运动用品和配件','All other Sports & Outdoors/ Accessories',87,2,NULL,0.1),(92,'钓鱼和打猎','Fishing and hunting',88,3,NULL,0.1),(93,'水上和船上运动','Water Sports& Boating',88,3,NULL,0.1),(94,'爬山','Climbing',88,3,NULL,0.1),(95,'露营','Camping& Backpacking',88,3,NULL,0.1),(96,'雪上运动','Snow Sports',88,3,NULL,0.1),(97,'自行车运动','Cycling',88,3,NULL,0.1),(98,'高尔夫','Golf',88,3,NULL,0.1),(99,'男士服装','Men’s Clothing',89,3,NULL,0.1),(100,'女士服装','Women’s Clothing',89,3,NULL,0.1),(101,'男孩服装','Boys’ Clothing',89,3,NULL,0.1),(102,'女孩服装','Girls’ Clothing',89,3,NULL,0.1),(103,'食品和医药保健品','Foods',0,1,0.05,0.15),(104,'食品','Grocery & Gourmet Food',103,2,NULL,0.1),(105,'酒类','Wine',103,2,NULL,0.1),(106,'卫生医药保健营养品','Health Care',103,2,NULL,0.1),(107,'早餐','Breakfast Foods',104,3,NULL,0.1),(108,'零食','Snacks',104,3,NULL,0.1),(109,'饮料','Beverages',104,3,NULL,0.1),(110,'有机食品','Organic Foods',104,3,NULL,0.1),(111,'无面筋食品','Gluten-Free Foods',104,3,NULL,0.1),(112,'烘焙食品','Baking Products',104,3,NULL,0.1),(113,'食品套装礼品','Gourmet gift',104,3,NULL,0.1),(114,'咖啡&茶','Coffee and Tea',104,3,NULL,0.1),(115,'其它食品','other foods',104,3,NULL,0.1),(116,'调味料','Herbs, Spices and seasoning',104,3,NULL,0.1),(117,'储存便捷快速食品','Pantry',104,3,NULL,0.1),(118,'健康护理（药品）','Health Care',106,3,NULL,0.1),(119,'维他命&其它元素补给营养品','Vitamin Supplement& Natural Remedies',106,3,NULL,0.1),(120,'性福产品','Sexual Wellness',106,3,NULL,0.1),(121,'减肥产品','Weight Management & Dietary Supplement',106,3,NULL,0.1),(122,'运动营养品','Sports Nutrition',106,3,NULL,0.1),(123,'个人护理产品','Personal Care',106,3,NULL,0.1),(124,'家庭医疗护理器材','Health Care Equipments',106,3,NULL,0.1),(125,'其他','Other Heal Care',106,3,NULL,0.1),(126,'电子用品','Electronics',0,1,0.03,0.05),(127,'电子配件','Electronic Accessories',126,2,NULL,0.1),(128,'电子产品','',126,2,NULL,0.1),(129,'珠宝首饰，手表和其它配饰','Jewelry, Watch & Accessories',0,1,0.05,0.15),(130,'家庭用品，车辆用品和游戏产品','Home, Vehicle & Games',0,1,0.05,0.15),(131,'其它产品','',0,1,0.05,0.15),(132,'办公以及上学用品','Office & school supplies',131,2,NULL,0.1),(133,'艺术，工艺 &缝纫','Art, Craft & Sewing',131,2,NULL,0.1),(134,'工业用品','Industrial Products',131,2,NULL,0.1),(135,'实验用品','Lab& Scientific',131,2,NULL,0.1),(136,'乐器','Musical Instruments',131,2,NULL,0.1),(137,'书籍/杂志/报纸','Books, Magazines & Newspaper',131,2,NULL,0.1),(138,'音乐/影视/明星/音像','Movies & Music',131,2,NULL,0.1),(139,'安全设备&安全用品','Safety Equipment & Safety Supplies',131,2,NULL,0.1),(140,'鲜花&绿植园艺','Flower & Gardening',131,2,NULL,0.1),(141,'网络设备/网络相关','Internet devices & Supplies',131,2,NULL,0.1),(142,'个性定制/设计服务/DIY','',131,2,NULL,0.1),(143,'圣诞用品','Christmas Products',131,2,NULL,0.1),(144,'家庭用品','Home Supplies',130,2,NULL,0.1),(145,'床上用品','Bedding',144,3,NULL,0.1),(146,'住宅家具','Furniture',144,3,NULL,0.1),(147,'家居饰品','Decorations',144,3,NULL,0.1),(148,'厨房/餐饮用具','Kitchen & Dining',144,3,NULL,0.1),(149,'家用配件','Home Hardware',144,3,NULL,0.1),(150,'室外，阳台，花园用品','Patio, Garden & Outdoor Products',144,3,NULL,0.1),(151,'家用工具','Tools& Home Improvement',144,3,NULL,0.1),(152,'家装主材','Building Supplies',144,3,NULL,0.1),(153,'卫浴/收纳/整理用具','Cleaning, Bathing & Organizing',144,3,NULL,0.1),(154,'清洁用品','Janitorial Supplies',144,3,NULL,0.1),(155,'灯&天花板扇','Lighting & Ceiling fans',144,3,NULL,0.1),(156,'生活用品','Household Supplies',144,3,NULL,0.1),(157,'艺术品','Fine Art',144,3,NULL,0.1),(158,'宠物食品和护理','Pet Food and Supplies',130,2,NULL,0.1),(159,'车辆用品','',130,2,NULL,0.1),(160,'游戏产品','Digital Games & Software',130,2,NULL,0.1),(161,'汽车零件和配件','Automotive Parts & Accessories',159,3,NULL,0.1),(162,'汽车工具及设备','Automotive Tools & Equipment ',159,3,NULL,0.1),(163,'摩托车用品及配件','motorcycle & Accessories',159,3,NULL,0.1),(164,'宠物食品','Pet Foods',158,3,NULL,0.1),(165,'宠物护理用品','Pet Supplies',158,3,NULL,0.1),(166,'珠宝首饰','Jewelry',129,2,NULL,0.1),(167,'手表','Watch',129,2,NULL,0.1),(168,'其它配饰','Accessories',129,2,NULL,0.1),(169,'男士手表','Men’s Watch',167,3,NULL,0.1),(170,'女士手表','Women’s Watch',167,3,NULL,0.1),(171,'戒指','Rings',166,3,NULL,0.1),(172,'项链','Necklaces',166,3,NULL,0.1),(173,'手链','Bracelets',166,3,NULL,0.1),(174,'耳环&耳钉 ','Earrings',166,3,NULL,0.1),(175,'男士首饰','Men’s Jewelry',166,3,NULL,0.1),(181,'手机配件','Cell Phone Accessories',127,3,NULL,0.1),(182,'电脑配件 ','Computer Accessories',127,3,NULL,0.1),(183,'电脑硬件','Computer parts& Components',127,3,NULL,0.1),(184,'电脑软件','Software',127,3,NULL,0.1),(185,'电脑周边','Computer Peripherals',127,3,NULL,0.1),(186,'闪存卡/U盘/存储/移动硬盘','Memory Card, Flash disk & Hard Drive',127,3,NULL,0.1),(187,'音乐播放器配件&MP3/MP4配件','Music player& MP3,MP4 Accessories',127,3,NULL,0.1),(188,'耳机/耳麦','Headphones',127,3,NULL,0.1),(189,'其它','other',127,3,NULL,0.1),(190,'电脑 ','Computer (Desktops & Laptops)',128,3,NULL,0.1),(191,'相机& 摄像机','Camera, Photo& Video',128,3,NULL,0.1),(192,'影音电器','Home Audio &Theater',128,3,NULL,0.1),(193,'安全与监控','Security & Surveillance',128,3,NULL,0.1),(194,'平板电脑','Tablets',128,3,NULL,0.1),(195,'手机','Cell Phone',128,3,NULL,0.1),(196,'MP3/MP4/iPod/录音笔','MP3, MP4 Players & Recorder',128,3,NULL,0.1),(197,'汽车电子用品','Vehicle Electronics',128,3,NULL,0.1),(198,'打印机&墨','Printers& Ink',128,3,NULL,0.1),(199,'厨房用品','Kitchen Electronics',128,3,NULL,0.1),(200,'生活电器','',128,3,NULL,0.1);
/*!40000 ALTER TABLE `productLine` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=10005 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `seller`
--

LOCK TABLES `seller` WRITE;
/*!40000 ALTER TABLE `seller` DISABLE KEYS */;
INSERT INTO `seller` VALUES (1,'seller@tdg.com','123123','123','123','123','123','123','123','12312312312','123','12312312312','123',NULL,NULL,3,NULL),(2,'beijing@123.com','123123','123','123','123','123','123','123','123','123','123','123',NULL,NULL,0,NULL),(3,'asd@123.com','123123','123','123','123','123','123','123','123','123','123','123',NULL,NULL,0,NULL),(4,'aaa@bit.edu.cn','123123','123','123','123','123','123','123','123','123','123','123',NULL,NULL,0,NULL),(5,'ss@bit.edu.cn','123123','123','123','123','123','123','123','123','123','123','123',NULL,NULL,3,'123'),(10000,'seller2@tdg.com','123123','123','123','123','123','123','123','23123123','123','12321','123',NULL,NULL,3,'123'),(10001,'1668275786@qq.com','1668275786','1668275786','','','','','','','','','',NULL,NULL,3,''),(10002,'sellertest1@tdg.com','','','','','','','','','','','',NULL,NULL,3,''),(10003,'tseller@tdg.com','123123','123','123','123','123','123','123','12312312311','123','','123',NULL,NULL,1,'123'),(10004,'sellertest@123.com','123123','AB','l','m','AB','ABC','the US','123456','product line','123456','AB',NULL,NULL,2,'GD');
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
  `companyService` text,
  `platformHelp` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sellerHelpService`
--

LOCK TABLES `sellerHelpService` WRITE;
/*!40000 ALTER TABLE `sellerHelpService` DISABLE KEYS */;
INSERT INTO `sellerHelpService` VALUES (0,'<p>\r\n	ceshi\r\n</p>\r\n<p>\r\n	测试\r\n</p>\r\n<p>\r\n	测试111\r\n</p>','测试  测试  测试','测试  测试  测试','测试  测试  测试',1,'测试  测试  测试',NULL);
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
  `backAddress` varchar(300) DEFAULT NULL,
  `useSystemStoreAddress` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shopsetting`
--

LOCK TABLES `shopsetting` WRITE;
/*!40000 ALTER TABLE `shopsetting` DISABLE KEYS */;
INSERT INTO `shopsetting` VALUES (4,1,3,NULL,1,NULL,1,'spny',NULL,'aaaa','aaaaaa','aaaaa','2399299310000','XIn','92991910200000','&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;asdffdee','GGGGGGGG',0),(5,3,1,NULL,2,NULL,10000,'japan',NULL,'123','123','123','123','123','123','北京','朝阳区卖家店',1),(6,5,1,NULL,3,NULL,10001,'1668275786',NULL,'','','','','','','<p>	Fashion Jewelry Store</p><p>	<br /></p><p>	<br /></p>',NULL,0),(7,5,1,NULL,1,NULL,10002,'Sellertest1',NULL,'13223','1233','1233','1123','1233','123344','GGGGG',NULL,0),(8,9,1,NULL,1,NULL,10003,'1231232',NULL,'1','123','123','123','123','22','2','1222',1),(9,1,1,NULL,1,NULL,10004,'ABCABC',NULL,'','','','','','','ABC DEF<br />','ABC DEF',0);
/*!40000 ALTER TABLE `shopsetting` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `systemSetting`
--

DROP TABLE IF EXISTS `systemSetting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `systemSetting` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `storeAddress` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `systemSetting`
--

LOCK TABLES `systemSetting` WRITE;
/*!40000 ALTER TABLE `systemSetting` DISABLE KEYS */;
INSERT INTO `systemSetting` VALUES (1,'海淀区网站退货中心');
/*!40000 ALTER TABLE `systemSetting` ENABLE KEYS */;
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
  `createdAt` datetime DEFAULT NULL,
  `count` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=74 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `translationTask`
--

LOCK TABLES `translationTask` WRITE;
/*!40000 ALTER TABLE `translationTask` DISABLE KEYS */;
INSERT INTO `translationTask` VALUES (16,1000029,1,1,'product',1,'2013-10-01 00:00:00',1),(17,1000030,10000,1,'product',1,'2013-10-01 00:00:00',1),(18,6,1,1,'brand',1,'2013-10-03 00:00:00',1),(19,7,1,1,'brand',1,'2013-10-03 00:00:00',1),(20,1000031,1,1,'product',1,'2013-10-04 00:00:00',1),(21,1000032,10001,1,'product',1,'2013-10-04 00:00:00',1),(22,1000034,10001,1,'product',1,'2013-10-04 00:00:00',1),(23,1000035,10001,1,'product',1,'2013-10-04 00:00:00',1),(24,1000036,10001,1,'product',1,'2013-10-04 00:00:00',1),(25,1000039,10001,1,'product',1,'2013-10-04 00:00:00',1),(26,1000038,10001,1,'product',1,'2013-10-04 00:00:00',1),(27,1000037,10001,1,'product',1,'2013-10-04 00:00:00',1),(28,1000040,1,1,'product',1,'2013-10-05 00:00:00',1),(29,1000041,1,1,'product',1,'2013-10-05 00:00:00',1),(30,1000042,1,1,'product',1,'2013-10-05 00:00:00',1),(31,1000043,10001,1,'product',1,'2013-10-05 00:00:00',1),(32,1000044,10001,1,'product',1,'2013-10-05 00:00:00',1),(34,1000045,10001,1,'product',1,'2013-10-19 00:00:00',1),(35,1000046,10001,1,'product',1,'2013-10-19 00:00:00',1),(36,1000047,10002,1,'product',1,'2013-10-21 00:00:00',1),(37,1000048,10001,1,'product',1,'2013-10-21 00:00:00',1),(38,1000049,1,1,'product',1,'2013-10-21 00:00:00',1),(39,1000050,10001,1,'product',1,'2013-10-22 00:00:00',1),(40,1000051,1,1,'product',1,'2013-10-23 00:00:00',2),(41,10,1,1,'brand',1,'2013-10-24 00:00:00',2),(42,1000054,10000,1,'product',1,'2013-10-30 00:00:00',1),(43,1000055,10000,1,'product',1,'2013-10-30 00:00:00',1),(44,1000061,10000,1,'product',1,'2013-11-05 00:00:00',1),(45,1000060,10000,1,'product',1,'2013-11-05 00:00:00',1),(46,1000062,1,1,'product',1,'2013-11-18 00:00:00',1),(47,1000063,10000,1,'product',1,'2013-11-18 00:00:00',1),(48,1000064,10000,1,'product',1,'2013-11-18 00:00:00',1),(49,1000065,10000,1,'product',1,'2013-11-18 00:00:00',1),(50,1000071,1,1,'product',1,'2013-11-26 00:00:00',2),(51,1000070,1,1,'product',1,'2013-11-26 00:00:00',1),(52,1000069,1,1,'product',1,'2013-11-26 00:00:00',1),(53,1000070,1,1,'product',1,'2013-11-26 00:00:00',1),(54,1000070,1,1,'product',1,'2013-11-26 00:00:00',1),(55,1000072,1,1,'product',1,'2013-11-27 00:00:00',1),(56,1000073,10000,1,'product',1,'2013-12-05 00:00:00',1),(57,1000074,10000,1,'product',1,'2013-12-27 00:00:00',1),(58,1000068,10000,1,'product',1,'2013-12-27 00:00:00',2),(59,1000075,1,1,'product',1,'2013-12-30 15:35:18',1),(60,1000076,1,1,'product',1,'2013-12-30 15:39:07',1),(61,1000077,10004,1,'product',1,'2013-12-31 17:21:18',1),(62,1000078,10004,1,'product',1,'2013-12-31 19:13:09',1),(63,1000069,1,1,'product',1,'2014-01-03 16:58:15',1),(64,1000081,1,1,'product',1,'2014-01-04 01:22:36',1),(65,1000080,1,1,'product',1,'2014-01-04 01:22:36',1),(66,1000082,1,1,'product',1,'2014-01-04 15:13:05',1),(67,13,1,1,'brand',1,'2014-01-04 15:33:29',1),(68,1000083,1,1,'product',1,'2014-01-05 21:52:31',2),(69,1000083,1,1,'product',1,'2014-01-05 22:05:44',1),(70,14,1,1,'brand',1,'2014-01-08 21:52:01',1),(71,15,1,1,'brand',1,'2014-01-08 21:52:43',2),(72,15,1,1,'brand',1,'2014-01-08 22:03:55',1),(73,15,1,1,'brand',1,'2014-01-08 22:07:15',1);
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

-- Dump completed on 2014-01-08 23:24:37
