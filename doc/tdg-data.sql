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
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin`
--

LOCK TABLES `admin` WRITE;
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
INSERT INTO `admin` VALUES (1,'admin','123123',0),(2,'admin@bbb.com','123123',0),(3,'dasdfa@112.com','123123',0),(4,'desdf','123123',0),(5,'admin1','123123',1),(6,'financeadmin','123123',2);
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
) ENGINE=MyISAM AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `brand`
--

LOCK TABLES `brand` WRITE;
/*!40000 ALTER TABLE `brand` DISABLE KEYS */;
INSERT INTO `brand` VALUES (13,'Bravo','Created in 1900<br />','棒','ABC',0,1,7),(14,'asdf','asdfaadfsda0001','顶顶顶顶','的阿斯顿发斯蒂芬',0,1,6),(15,'adsd','asdfasdfddddasdfasdfasdfd1111112','22','1',0,1,7),(16,'dd','<img src=\"/uploads/images/1390667797026.jpg\" alt=\"\" />',NULL,NULL,0,1,1);
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
) ENGINE=InnoDB AUTO_INCREMENT=162 DEFAULT CHARSET=utf8;
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
  `flag` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=78 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `claimItem`
--

LOCK TABLES `claimItem` WRITE;
/*!40000 ALTER TABLE `claimItem` DISABLE KEYS */;
INSERT INTO `claimItem` VALUES (77,'claim',5,10008,280,8,3,3,'',NULL,0);
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
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `country`
--

LOCK TABLES `country` WRITE;
/*!40000 ALTER TABLE `country` DISABLE KEYS */;
INSERT INTO `country` VALUES (1,'USA','美国'),(3,'Japan','日本'),(4,'England','英国'),(9,'China','中国'),(10,'Hongkong','香港'),(11,'Germany','德国');
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
) ENGINE=MyISAM AUTO_INCREMENT=10006 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES (1,'chenjie','123123',3,NULL,NULL,NULL),(2,'customer','123123',2,NULL,NULL,NULL),(3,'xiaoxiao','123123',3,NULL,NULL,NULL),(4,'','',3,NULL,NULL,NULL),(5,'a','123123',3,NULL,NULL,NULL),(6,'admin@noprinter.cn','123123',4,NULL,NULL,NULL),(8,'sonyfe25cp@gmail.com','123123',3,'62008054b4d88ZZb277bcee9bd39a69fc111e791dee21e0169042297','6202505c91cbdfh3a3af9c5f714bc4ec6816482311d3ad3169042297','12312312312'),(10000,'buyer@126.com','123123',3,NULL,NULL,'18689424159'),(10001,'tt@tdg.com','123123',1,NULL,NULL,'12312123123'),(10002,'a1@bit.edu.cn','123123',1,NULL,NULL,'12311'),(10003,'buyer@tdg.com','123123',1,NULL,NULL,''),(10004,'aab@123.com','123123',1,NULL,NULL,''),(10005,'ruby_mao@126.com','321321',1,NULL,NULL,'123456');
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
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customerAddress`
--

LOCK TABLES `customerAddress` WRITE;
/*!40000 ALTER TABLE `customerAddress` DISABLE KEYS */;
INSERT INTO `customerAddress` VALUES (21,'beijing','123','3221','China','2212',8,9),(22,'toko','12211','tokyo','Japan','123331',8,3),(23,'ddd','23','1','USA','222',8,1),(24,'CHina','China','China','China','123123',10000,9),(25,'USA','USA','USA','USA','321321',10000,1),(26,'Germany','Germany','Germany','Germany','121212',10000,6),(27,'cj','Beijing Institute of Technology Copyright Address: 5 South Zhongguancun Street, Haidian District, Beijing','beiji','China','10081',8,9),(28,'China','China','China','China','123456',10003,9),(29,'USA','USA','USA','USA','123',10003,1),(30,'Japan','Japan','Japan','Japan','123',10003,3),(31,'ABC','DEF','GHJ','China','123',10005,9),(32,'1','1','1','Hongkong','1',10005,10),(33,'2','2','2','Germany','2',10005,11);
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
) ENGINE=InnoDB AUTO_INCREMENT=594 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `financeRecord`
--

LOCK TABLES `financeRecord` WRITE;
/*!40000 ALTER TABLE `financeRecord` DISABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=632 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `financeUnit`
--

LOCK TABLES `financeUnit` WRITE;
/*!40000 ALTER TABLE `financeUnit` DISABLE KEYS */;
INSERT INTO `financeUnit` VALUES (626,'admin','customer-8',695.5,'2014-02-09 23:32:34',1,279,'order',0,NULL,0,5,11),(627,'seller-10008','admin',110,'2014-02-09 23:32:34',1,279,'order',0,NULL,0,1,11),(628,'admin','seller-10008',5,'2014-02-09 23:32:34',4,279,'order',0,NULL,0,1,41),(629,'admin','customer-8',160.55,'2014-02-10 00:03:03',1,280,'order',0,NULL,0,5,11),(630,'seller-10008','admin',25,'2014-02-10 00:03:03',1,280,'order',0,NULL,0,1,11),(631,'admin','seller-10008',0.5,'2014-02-10 00:03:03',4,280,'order',0,NULL,0,1,41);
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
INSERT INTO `helpservice` VALUES ('<p>\r\n	购物注意事项\r\n</p>\r\n<p>\r\n	1.&nbsp;\r\n</p>\r\n<p>\r\n	2.&nbsp;\r\n</p>','购物流程管理。 <br />','免责说明<br />','常见问题。<br />','ytetretrter','售后政策<br />','支付说明<br />','价格保护<br />','退款说明<br />','转运知识指导<br />','商家配送说明。 <br />',1,'其他<br />',0);
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
) ENGINE=InnoDB AUTO_INCREMENT=1000141 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item`
--

LOCK TABLES `item` WRITE;
/*!40000 ALTER TABLE `item` DISABLE KEYS */;
INSERT INTO `item` VALUES (1000128,'001','Hand Bag','手包1 ','','/uploads/images/1390884184970.JPG',100,90,'2014-01-28',50,50,200,398,5,1000095,1,39,10009,'2014-01-29',1,8,0,0,0,10,16,6),(1000129,'002','B Hand Bag ','手包2','','/uploads/images/1390884672985.JPG',10,0,NULL,5,20,100,0,5,1000096,1,39,10009,NULL,1,8,1,15,10,10,16,7),(1000130,'0031','Electronic Acessories','电子配件','\"color\":\"Red \",\"size\":\"12\"','/uploads/images/1390884955530.JPG',100,50,'2014-01-28',30,50,100,490,5,1000097,1,181,10009,'2014-01-30',1,8,1,20,5,10,126,6),(1000131,'0032','Electronic Acessories','电子配件','\"color\":\"blue\",\"size\":\"12\"','undefined',90,50,'2014-01-28',30,50,100,40,5,1000097,1,181,10009,'2014-01-30',1,8,1,20,5,10,126,6),(1000132,'0033','Electronic Acessories','电子配件','\"color\":\"Yellow\",\"size\":\"13\"','/uploads/images/1390885033596.JPG',90,60,'2014-01-28',30,50,100,497,5,1000097,1,181,10009,'2014-01-30',1,8,1,20,5,10,126,6),(1000133,'ABC','Electronic Acessories','电子配件','\"color\":\"Yellow\",\"size\":\"10\"','undefined',95,50,'2014-01-28',30,50,100,500,5,1000097,1,181,10009,'2014-01-30',1,8,1,20,5,10,126,6),(1000134,'de','ddd',NULL,'','/uploads/images/1390917269541.jpg',321,0,NULL,0,0,0,22,5,1000098,1,56,10008,NULL,1,8,0,0,0,1,18,0),(1000135,'','Electronics ','电子产品卖家','','/uploads/images/1390963936605.JPG',100,80,'2014-01-28',50,50,100,195,5,1000099,1,183,10008,'2014-01-29',1,8,0,0,0,1,126,6),(1000136,'ABC','Computer','电子产品2','','/uploads/images/1390964352559.JPG',10,0,NULL,5,50,100,62,5,1000100,1,190,10008,NULL,1,8,1,15,20,1,126,6),(1000137,'001','Electronics','电子产品3','\"color\":\"Red\",\"size\":\"10\"','/uploads/images/1390966999129.JPG',100,90,'2014-01-29',50,50,100,98,5,1000101,1,193,10008,'2014-01-31',1,8,1,10,15,1,126,6),(1000138,'002','Electronics','电子产品3','\"color\":\"Blue\",\"size\":\"10\"','/uploads/images/1390967046608.JPG',95,90,'2014-01-28',50,50,100,200,5,1000101,1,193,10008,'2014-01-29',1,8,1,10,15,1,126,6),(1000139,'003','Electronics','电子产品3','\"color\":\"Blue\",\"size\":\"10\"','/uploads/images/1390967098653.JPG',100,90,'2014-01-29',10,50,100,196,5,1000101,1,193,10008,'2014-01-31',1,8,1,10,15,1,126,6),(1000140,'123','Apparel ',NULL,'','/uploads/images/1391304423142.JPG',100,90,'2014-02-02',70,30,100,200,5,1000103,1,22,10008,'2014-02-04',1,8,0,0,0,1,16,0);
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
INSERT INTO `notice` VALUES (1,'<h2>\r\n	Welcome to use tdg seller platf<strong>orm: <br />\r\n</strong> \r\n</h2>\r\n<p>\r\n	<strong><span style=\"color:#64451D;\">Important things to do before you start to list and sell</span></strong><span style=\"color:#64451D;\">:&nbsp;</span> \r\n</p>\r\n<p>\r\n	1. You would need to set up your store at your account setting of Account Management Center. Please note the price currency is default as USD, and once you set up your Ship-From-Country, it\'s normally unchangeable.&nbsp;\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	<strong><span style=\"color:#003399;background-color:#64451D;\"></span><span style=\"color:#003399;background-color:#64451D;\"></span><span style=\"color:#003399;background-color:#64451D;\"><br />\r\n</span></strong> \r\n</p>\r\n<p>\r\n	<br />\r\n<strong><span style=\"color:#003399;background-color:#64451D;\"></span></strong><span style=\"color:#64451D;\"></span> \r\n</p>\r\n<p>\r\n	<br />\r\n</p>','seller'),(2,'<img src=\"http://api.map.baidu.com/staticimage?center=121.43001%2C31.120649&zoom=11&width=558&height=360&markers=121.43001%2C31.120649&markerStyles=l%2CA\" alt=\"\" />','admin'),(3,'<p>\r\n	请注意：\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	现在是销售高峰。。。。\r\n</p>\r\n<p>\r\n	<img src=\"/uploads/images/1390276908695.JPG\" alt=\"\" />\r\n</p>','customer'),(4,'<img src=\"http://api.map.baidu.com/staticimage?center=121.373669%2C31.612007&zoom=11&width=558&height=360&markers=121.373669%2C31.612007&markerStyles=l%2CA\" alt=\"\" />','translator');
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
) ENGINE=InnoDB AUTO_INCREMENT=337 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orderItem`
--

LOCK TABLES `orderItem` WRITE;
/*!40000 ALTER TABLE `orderItem` DISABLE KEYS */;
INSERT INTO `orderItem` VALUES (335,1000137,1000101,'Electronics',1,10008,1,100,279,1,10,15,1,'001',650,65,'电子产品3',126,3,19.5,'\"颜色\":\"Red\",\"尺寸\":\"10\"',0.03,630.5,630.5,630.5,97,193),(336,1000136,1000100,'Computer',1,10008,1,10,280,1,15,20,1,'ABC',65,97.5,'电子产品2',126,0.3,1.95,'',0.03,63.05,63.05,63.05,9.7,190);
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
) ENGINE=InnoDB AUTO_INCREMENT=860 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orderRecord`
--

LOCK TABLES `orderRecord` WRITE;
/*!40000 ALTER TABLE `orderRecord` DISABLE KEYS */;
INSERT INTO `orderRecord` VALUES (850,279,'cj',8,'用户提交订单，等待支付','Customer submited the order, waiting for pay money','2014-02-09 23:32:30'),(851,279,'cj',8,'用户已经支付，等待系统确认','Customer pay the order, waiting for repsonse','2014-02-09 23:32:34'),(852,279,'123',10008,'卖家已发货，等待用户查收','Seller has send, waiting for receive','2014-02-10 00:00:30'),(853,279,'cj',8,'买家已收货','Customer has received','2014-02-10 00:00:42'),(854,280,'beijing',8,'用户提交订单，等待支付','Customer submited the order, waiting for pay money','2014-02-10 00:02:35'),(855,280,'beijing',8,'用户已经支付，等待系统确认','Customer pay the order, waiting for repsonse','2014-02-10 00:03:03'),(856,280,'123',10008,'卖家已发货，等待用户查收','Seller has send, waiting for receive','2014-02-10 00:03:22'),(857,280,'beijing',8,'用户投诉该订单','Customer complain this order','2014-02-10 00:10:48'),(858,280,'beijing',8,'投诉被撤消','the claim is cancelled','2014-02-10 00:10:57'),(859,280,'beijing',8,'买家已收货','Customer has received','2014-02-10 00:11:11');
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
  `customerObserveFlag` int(11) DEFAULT '0',
  `sellerObserveFlag` int(11) DEFAULT '0',
  `paidAt` datetime DEFAULT NULL,
  `overAt` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=281 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (279,97,10,107,'2014-02-09 23:32:30',NULL,'cj','Beijing Institute of Technology Copyright Address: 5 South Zhongguancun Street, Haidian District, Beijing','beiji','China','10081',8,10008,'123',0,NULL,4,'2014-02-04 00:00:00','2','1','2',630.5,65,695.5,100,650,110,715,0,NULL,'2014-02-10 00:00:30',NULL,0,1,2,1,'2014-02-09 23:32:34',NULL),(280,9.7,15,24.7,'2014-02-10 00:02:35',NULL,'beijing','123','3221','China','2212',8,10008,'123',0,NULL,4,'2014-02-05 00:00:00','2','1','2',63.05,97.5,160.55,10,65,25,162.5,0,NULL,'2014-02-10 00:03:22',NULL,0,1,2,2,'2014-02-10 00:03:03',NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `passwordkey`
--

LOCK TABLES `passwordkey` WRITE;
/*!40000 ALTER TABLE `passwordkey` DISABLE KEYS */;
INSERT INTO `passwordkey` VALUES (1,'seller','sonyfe25cp@gmail.com','MgTtYe'),(2,'seller','seller2@tdg.com','VoLnCk'),(3,'seller','seller2@tdg.com','XdWgEs'),(4,'seller','seller2@tdg.com','XoUyJq'),(5,'seller','seller2@tdg.com','CnSmCy'),(6,'seller','seller2@tdg.com','LxFpQd'),(7,'customer','sonyfe25cp@gmail.com','DbUvFr'),(8,'customer','sonyfe25cp@gmail.com','DsKcLr'),(9,'customer','sonyfe25cp@gmail.com','GdQoAc'),(10,'customer','sonyfe25cp@gmail.com','EiJbDu'),(11,'customer','sonyfe25cp@gmail.com','FxLtDi'),(12,'seller','1668275786@qq.com','QpItNe'),(13,'customer','ruby_mao@126.com','MiTcEv'),(14,'seller','1668275786@qq.com','WuPeIw');
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
) ENGINE=InnoDB AUTO_INCREMENT=1000104 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (1000095,'Hand Bag','手包1 ','<p>\n	ABCD\n</p>\n<p>\n	<img src=\"/uploads/images/1390884551471.JPG\" alt=\"\" />\n</p>','手包1',5,0,0,0,100,90,'2014-01-28','2014-01-29',50,50,200,398,5,1,1,2,'1*2*3','/uploads/images/1390884184970.JPG','/uploads/images/1390884191197.JPG;',NULL,0,0,10009,39,NULL,1,10,6,16,'001'),(1000096,'B Hand Bag ','手包2','<p>\n	ABC\n</p>\n<p>\n	<br />\n</p>\n<p>\n	<br />\n</p>\n<p>\n	<br />\n</p>','手包2',5,1,15,10,10,0,NULL,NULL,5,20,100,0,5,1,1,2,'1*2*3','/uploads/images/1390884672985.JPG','',NULL,0,0,10009,39,NULL,1,10,7,16,'002'),(1000097,'Electronic Acessories','电子配件','BCDEFG','电子配件',5,1,20,5,100,50,'2014-01-28','2014-01-30',30,50,100,500,5,1,1,2,'1*2*3','/uploads/images/1390884821428.JPG','',NULL,1,0,10009,181,NULL,1,10,6,126,'0'),(1000098,'ddd',NULL,'ddd',NULL,2,0,0,0,321,0,NULL,NULL,0,0,0,22,5,1,1,2,'2*3*1','/uploads/images/1390917269541.jpg','',NULL,0,0,10008,56,NULL,1,1,0,18,'de'),(1000099,'Electronics ','电子产品卖家','<p>\n	ABCD\n</p>\n<p>\n	<img src=\"/uploads/images/1390964031485.JPG\" alt=\"\" />\n</p>','<p>\r\n	电子产品卖家\r\n</p>\r\n<p>\r\n	<img src=\"http://tdg.omartech.com/uploads/images/1390964031485.JPG\" />\r\n</p>',5,0,0,0,100,80,'2014-01-28','2014-01-29',50,50,100,195,5,1,1,2,'1*2*3','/uploads/images/1390963936605.JPG','',NULL,0,0,10008,183,NULL,1,1,6,126,''),(1000100,'Computer','电子产品2','BCD','电子产品卖家。&nbsp;',5,1,15,20,10,0,NULL,NULL,5,50,100,62,5,1,1,2,'1*2*3','/uploads/images/1390964352559.JPG','/uploads/images/1390964465917.JPG;',NULL,0,0,10008,190,NULL,1,1,6,126,'ABC'),(1000101,'Electronics','电子产品3','<p>\n	ABCD\n</p>','电子产品卖家',5,1,10,15,100,90,'2014-01-29','2014-01-31',50,50,100,200,5,1,1,2,'1*2*3','/uploads/images/1390966821949.JPG','/uploads/images/1390966877155.JPG;',NULL,1,0,10008,193,NULL,1,1,6,126,'0'),(1000102,'Electronics',NULL,'',NULL,1,1,10,15,100,90,'2014-01-29','2014-01-31',50,50,100,200,5,1,1,2,'1*2*3','undefined','',NULL,1,0,10008,193,NULL,1,1,0,126,'0'),(1000103,'Apparel ',NULL,'<p>\n	ABC\n</p>\n<p>\n	<img src=\"/uploads/images/1391304495108.JPG\" alt=\"\" />\n</p>',NULL,2,0,0,0,100,90,'2014-02-02','2014-02-04',70,30,100,200,5,1,1,2,'1*2*3','/uploads/images/1391304423142.JPG','',NULL,0,0,10008,22,NULL,1,1,0,16,'123');
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
) ENGINE=InnoDB AUTO_INCREMENT=10010 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `seller`
--

LOCK TABLES `seller` WRITE;
/*!40000 ALTER TABLE `seller` DISABLE KEYS */;
INSERT INTO `seller` VALUES (10008,'seller@tdg.com','123123','123','123','123','123','123','123','123','123','123','123',NULL,NULL,1,'123'),(10009,'ruby_mao@126.com','123123','ABCD','Ruby','Mao','ABCD','ABD','AB','123456','ABCD','','ABCD',NULL,NULL,1,'AB');
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
INSERT INTO `sellerHelpService` VALUES (0,'<p>\r\n	About us\r\n</p>\r\n<p>\r\n	About us\r\n</p>','<p>\r\n	Workflow\r\n</p>\r\n<p>\r\n	Workflow\r\n</p>','<p>\r\n	Contact us\r\n</p>\r\n<p>\r\n	Contact us\r\n</p>','测试  测试  测试',1,'<p>\r\n	FAQ\r\n</p>\r\n<p>\r\n	FAQ\r\n</p>','<p>\r\n	Help Help Help Help\r\n</p>\r\n<p>\r\n	Help Help Help Help\r\n</p>');
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
INSERT INTO `sellerIndex` VALUES (0,'oppo.jpg;tcl.jpg;yingpan.jpg;','<p class=\"MsoNormal\">\r\n	<b><span style=\"font-size: 12pt; line-height: 115%; color: rgb(229, 102, 0);\" color:#984806;\"=\"\">Join Y.H. China Town to quickly expand into\r\nChina market without effort!</span></b> \r\n</p>\r\n<p class=\"MsoNormal\">\r\n	<b>Huge Opportunities in\r\nChina Market</b>:\r\n</p>\r\n<p style=\"margin-left:.5in;text-indent:-.25in;\">\r\n	<span style=\"font-size:11.0pt;font-family:Symbol;color:#4B4B4B;\"><span>·<span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span></span></span><span style=\"font-size:11.0pt;font-family:\" color:#4b4b4b;\"=\"\">China’s online retail market will explode over next the five\r\nyears. China is estimated to become the largest e-Commerce market in the world\r\nby 2015. </span> \r\n</p>\r\n<p style=\"margin-left:.5in;text-indent:-.25in;\">\r\n	<span style=\"font-size:11.0pt;font-family:Symbol;color:#4B4B4B;\"><span>·<span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span></span></span><span style=\"font-size:11.0pt;font-family:\" color:#4b4b4b;\"=\"\">China’s $64 billion online retail market (second in size only to\r\nthe United State) will explode over next five years to $271 billion. The\r\nChinese online shopping sold over 35 billion CNY (about 5.6 billion USD) of\r\ngoods on China Singles Day (November 11) on 2013. </span> \r\n</p>\r\n<p style=\"margin-left:.5in;text-indent:-.25in;\">\r\n	<span style=\"font-size:11.0pt;font-family:Symbol;color:#4B4B4B;\"><span>·<span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span></span></span><span style=\"font-size:11.0pt;font-family:\" color:#4b4b4b;\"=\"\">China consumers online shopped over 7B USD Import consumption\r\ngoods via ten thousands China purchase agents each year with fast growing rate.</span> \r\n</p>\r\n<p style=\"margin-left:.5in;text-indent:-.25in;\">\r\n	<span style=\"font-size:11.0pt;font-family:Symbol;color:#4B4B4B;\"><span>·<span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span></span></span><span style=\"font-size:11.0pt;font-family:\" color:#4b4b4b;\"=\"\">China has over 13M online individual merchants and over 6M\r\nonline professional merchants, who are eagerly expanding their import products\r\nselection. </span> \r\n</p>\r\n<p style=\"margin-left:.5in;text-indent:-.25in;\">\r\n	<span style=\"font-size:11.0pt;font-family:Symbol;color:#4B4B4B;\"><span>·<span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span></span></span><span style=\"font-size:11.0pt;font-family:\" color:#4b4b4b;\"=\"\">China has already become largest luxury products consumption\r\nmarket in the world. </span> \r\n</p>\r\n<p>\r\n	<span style=\"font-size:11.0pt;font-family:\" color:#4b4b4b;\"=\"\">&nbsp;</span> \r\n</p>\r\n<p>\r\n	<b><span style=\"font-size:11.0pt;font-family:;\">Dragon Quick Trader: </span></b> \r\n</p>\r\n<p style=\"text-align:center;\" align=\"center\">\r\n	<b><span style=\"font-family:\" color:#e56600;\"=\"\">Bridge</span></b> \r\n</p>\r\n<p style=\"text-align:center;\" align=\"center\">\r\n	<span style=\"font-size:10.5pt;font-family:\" color:#4b4b4b;\"=\"\">&nbsp;</span> \r\n</p>\r\n<p style=\"text-align:center;\" align=\"center\">\r\n	<b><span style=\"font-family:\" color:#984806;\"=\"\"><span style=\"color:#E56600;\">Global Seller </span><span><span style=\"color:#E56600;\">&nbsp;&nbsp;&nbsp;</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><span>&nbsp;&nbsp;&nbsp;&nbsp;<span style=\"color:#E56600;\">&nbsp;&nbsp;</span></span><span style=\"color:#E56600;\">D. Q. Trader Marketplace </span></span></b><b><span style=\"font-family:\" color:#4b4b4b;\"=\"\"><span style=\"color:#E56600;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><span style=\"color:#E56600;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span></span></b><b><span style=\"font-family:\" color:#e56600;\"=\"\">China Buyer</span></b> \r\n</p>\r\n<p style=\"margin-left:.5in;text-align:center;\" align=\"center\">\r\n	<b><span style=\"font-family:\" color:#4b4b4b;background-color:#e53333;\"=\"\"><span style=\"background-color:#FFFFFF;color:#FF9900;\">Z</span><span style=\"background-color:#FFFFFF;\"></span><span style=\"background-color:#FFFFFF;color:#FF9900;\">ero Cost to\r\nexpand your business into China quickly!!</span></span></b> \r\n</p>\r\n<p style=\"text-align:center;\" align=\"center\">\r\n	<b><span style=\"font-size: 11pt; color: rgb(0, 51, 153);\" color:#003399;background-color:#ffffff;\"=\"\">NO Need Fulfill Order Internationally; NO Need\r\nUnderstand Chinese</span></b> \r\n</p>\r\n<p style=\"text-align:center;\" align=\"center\">\r\n	<b><span style=\"font-size: 11pt; color: rgb(0, 51, 153);\" color:#003399;background-color:#ffffff;\"=\"\">NO Need face China Policy Challenges; NO\r\nMonthly Subscription Fee</span></b> \r\n</p>\r\n<p style=\"text-align:center;\" align=\"center\">\r\n	<b><span style=\"font-size: 11pt; color: rgb(0, 51, 153);\" color:#003399;background-color:#ffffff;\"=\"\">Sell to China as easy as you sell domestically</span></b> \r\n</p>\r\n<p style=\"text-align:center;\" align=\"center\">\r\n	<b><span style=\"color: rgb(255, 153, 0);\" color:#ff9900;background-color:#ffffff;\"=\"\">Join Y.H. China\r\nTown B2B2C Marketplace Now!!</span></b> \r\n</p>\r\n<p>\r\n	<b><span style=\"font-size:10.5pt;font-family:\" color:#4b4b4b;background-color:#ffffff;\"=\"\">&nbsp;</span></b> \r\n</p>\r\n<p>\r\n	<span style=\"font-size:11.0pt;font-family:\" color:#4b4b4b;\"=\"\">D.Q. Trader is an Online <b><span style=\"color:#E53333;\">B2B2C</span></b> marketplace to bridge Global\r\nSuppliers and China buyers (China online purchase agents, China retailers, China\r\nconsumers, etc.) in Global Consumption Product Selection.</span> \r\n</p>\r\n<p style=\"margin-left:.5in;text-indent:-.25in;\">\r\n	<span style=\"font-size:11.0pt;font-family:Symbol;color:#4B4B4B;\"><span>·<span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span></span></span><span style=\"font-size:11.0pt;font-family:\" color:#4b4b4b;\"=\"\">Product Offer Bridge: We bridge foreign products offered from\r\nyou to China Buyers.</span> \r\n</p>\r\n<p style=\"margin-left:.5in;text-indent:-.25in;\">\r\n	<span style=\"font-size:11.0pt;font-family:Symbol;color:#4B4B4B;\"><span>·<span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span></span></span><span style=\"font-size:11.0pt;font-family:\" color:#4b4b4b;\"=\"\">Payment Trust Bridge: We provide payment escort service between\r\nyou and China Buyers. </span> \r\n</p>\r\n<p style=\"margin-left:.5in;text-indent:-.25in;\">\r\n	<span style=\"font-size:11.0pt;font-family:Symbol;color:#4B4B4B;\"><span>·<span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span></span></span><span style=\"font-size:11.0pt;font-family:\" color:#4b4b4b;\"=\"\">Flexible Sourcing and Selling Model Bridge: You can offer retail\r\nprice and volume price simultaneously to China buyers. </span> \r\n</p>\r\n<p style=\"margin-left:.5in;text-indent:-.25in;\">\r\n	<span style=\"font-size:11.0pt;font-family:Symbol;color:#4B4B4B;\"><span>·<span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span></span></span><span style=\"font-size:11.0pt;font-family:\" color:#4b4b4b;\"=\"\">International logistic Bridge: You don’t have to deal with\r\ninternational logistics if you don’t want to. </span> \r\n</p>\r\n<p style=\"margin-left:.5in;text-indent:-.25in;\">\r\n	<span style=\"font-size:11.0pt;font-family:Symbol;color:#4B4B4B;\"><span>·<span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span></span></span><span style=\"font-size:11.0pt;font-family:\" color:#4b4b4b;\"=\"\">Localization Bridge: We have professional team to localize your\r\noffer and provide local customer service. </span> \r\n</p>\r\n<br />',1);
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
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shopsetting`
--

LOCK TABLES `shopsetting` WRITE;
/*!40000 ALTER TABLE `shopsetting` DISABLE KEYS */;
INSERT INTO `shopsetting` VALUES (10,1,3,NULL,1,NULL,10008,'HHHHHH',NULL,'123','123','123','123','123','123','asdfasdf','beijing',0),(11,10,3,NULL,1,NULL,10009,'ABCD',NULL,'','','','','','','ABCD is XXXXXXX','ABCD EFG ',0);
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
INSERT INTO `systemSetting` VALUES (1,'广州退货中心');
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
) ENGINE=InnoDB AUTO_INCREMENT=89 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `translationTask`
--

LOCK TABLES `translationTask` WRITE;
/*!40000 ALTER TABLE `translationTask` DISABLE KEYS */;
INSERT INTO `translationTask` VALUES (83,1000097,10009,1,'product',1,'2014-01-28 13:09:20',1),(84,1000096,10009,1,'product',1,'2014-01-28 13:09:20',1),(85,1000095,10009,1,'product',1,'2014-01-28 13:09:20',1),(86,1000099,10008,1,'product',1,'2014-01-29 10:54:59',1),(87,1000100,10008,1,'product',1,'2014-01-29 11:02:21',1),(88,1000101,10008,1,'product',1,'2014-01-29 11:52:19',1);
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

-- Dump completed on 2014-02-10  0:22:29
