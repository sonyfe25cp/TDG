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
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `brand`
--

LOCK TABLES `brand` WRITE;
/*!40000 ALTER TABLE `brand` DISABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart`
--

LOCK TABLES `cart` WRITE;
/*!40000 ALTER TABLE `cart` DISABLE KEYS */;
INSERT INTO `cart` VALUES (19,1000094,10000,20),(20,1000085,10000,10);
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
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `claimItem`
--

LOCK TABLES `claimItem` WRITE;
/*!40000 ALTER TABLE `claimItem` DISABLE KEYS */;
INSERT INTO `claimItem` VALUES (24,'return',0,10000,151,8,1,3,'ddffd',NULL,0),(25,'return',0,10000,152,8,3,3,'asdf',NULL,0),(26,'return',0,10000,153,8,3,3,'dd',NULL,0),(27,'claim',10,10000,154,8,3,4,'爱到底','12322222',1),(28,'claim',10,10000,155,8,3,4,'eees',NULL,1),(29,'claim',10,10000,156,8,3,4,'asdfee11',NULL,1),(30,'claim',9,1,157,8,3,4,'asdf',NULL,1),(31,'claim',10,1,158,8,3,4,'asdf',NULL,1),(32,'claim',10,10000,159,8,4,4,'asdf',NULL,1),(33,'claim',10,10000,160,8,3,4,'asdfs',NULL,1),(34,'return',0,10000,160,8,3,12,'asdf',NULL,1),(35,'claim',10,10000,161,8,3,4,'de1',NULL,0),(36,'claim',10,10000,162,8,1,4,'12312',NULL,0),(37,'claim',2,10000,163,8,1,3,'12333',NULL,0),(38,'claim',10,10000,164,8,3,4,'223',NULL,1),(39,'claim',10,10000,165,8,3,4,'l',NULL,1);
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
) ENGINE=MyISAM AUTO_INCREMENT=10005 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES (1,'chenjie','123123',3,NULL,NULL,NULL),(2,'customer','123123',2,NULL,NULL,NULL),(3,'xiaoxiao','123123',3,NULL,NULL,NULL),(4,'','',3,NULL,NULL,NULL),(5,'a','123123',3,NULL,NULL,NULL),(6,'admin@noprinter.cn','123123',4,NULL,NULL,NULL),(8,'sonyfe25cp@gmail.com','123123',3,'62008054b4d88ZZb277bcee9bd39a69fc111e791dee21e0169042297','6202505c91cbdfh3a3af9c5f714bc4ec6816482311d3ad3169042297',NULL),(10000,'buyer@126.com','123123',3,NULL,NULL,'18689424159'),(10001,'tt@tdg.com','123123',1,NULL,NULL,'12312123123'),(10002,'a1@bit.edu.cn','123123',1,NULL,NULL,'12311'),(10003,'buyer@tdg.com','123123',1,NULL,NULL,''),(10004,'aab@123.com','123123',1,NULL,NULL,'');
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
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customerAddress`
--

LOCK TABLES `customerAddress` WRITE;
/*!40000 ALTER TABLE `customerAddress` DISABLE KEYS */;
INSERT INTO `customerAddress` VALUES (21,'beijing','123','3221','China','2212',8,8),(22,'toko','12211','tokyo','Japan','123331',8,3),(23,'ddd','23','1','USA','222',8,1),(24,'CHina','China','China','China','123123',10000,8),(25,'USA','USA','USA','USA','321321',10000,1),(26,'Germany','Germany','Germany','Germany','121212',10000,6),(27,'cj','Beijing Institute of Technology Copyright Address: 5 South Zhongguancun Street, Haidian District, Beijing','beiji','China','10081',8,8);
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
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8;
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
) ENGINE=InnoDB AUTO_INCREMENT=215 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `financeUnit`
--

LOCK TABLES `financeUnit` WRITE;
/*!40000 ALTER TABLE `financeUnit` DISABLE KEYS */;
INSERT INTO `financeUnit` VALUES (203,'admin','customer-8',2850,'2013-12-28 01:27:11',1,164,'order',0,NULL,0,5,11),(204,'seller-10000','admin',600,'2013-12-28 01:27:11',1,164,'order',4,NULL,0,2,11),(205,'admin','seller-10000',60,'2013-12-28 01:27:11',4,164,'order',0,NULL,0,2,41),(206,'customer-8','admin',570,'2013-12-28 01:27:56',1,164,'order',0,NULL,0,5,13),(207,'admin','seller-10000',120,'2013-12-28 01:27:56',1,164,'order',4,NULL,0,2,13),(208,'seller-10000','admin',12,'2013-12-28 01:27:56',4,164,'order',0,NULL,0,2,42),(209,'admin','customer-8',950,'2013-12-28 01:29:36',1,165,'order',0,NULL,0,5,11),(210,'seller-10000','admin',200,'2013-12-28 01:29:36',1,165,'order',4,NULL,0,2,11),(211,'admin','seller-10000',20,'2013-12-28 01:29:36',4,165,'order',0,NULL,0,2,41),(212,'customer-8','admin',475,'2013-12-28 01:30:29',1,165,'order',0,NULL,0,5,13),(213,'admin','seller-10000',100,'2013-12-28 01:30:29',1,165,'order',4,NULL,0,2,13),(214,'seller-10000','admin',10,'2013-12-28 01:30:29',4,165,'order',0,NULL,0,2,42);
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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1000098 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item`
--

LOCK TABLES `item` WRITE;
/*!40000 ALTER TABLE `item` DISABLE KEYS */;
INSERT INTO `item` VALUES (1000072,'','测试不带子产品','测试不带子产品商品','','/uploads/images/1383582910551.jpg',341,330,'2013-11-06',0,0,1,348,22,1000060,2,31,10000,'2013-11-20',1,8,1,21,3,3,16),(1000073,'001','Test with many children','测试带子产品商品','\"color\":\"red\",\"size\":\"21\"','/uploads/images/1383583110170.jpg',455,345,'2013-11-04',300,50,200,347,2,1000061,2,168,10000,'2013-11-22',1,8,0,0,0,3,129),(1000074,'002','Test with many children','测试带子产品商品','\"color\":\"red\",\"size\":\"33\"','/uploads/images/1383583120391.jpg',455,345,'2013-11-04',300,50,200,351,2,1000061,2,168,10000,'2013-11-22',1,8,0,0,0,3,129),(1000075,'003','Test with many children','测试带子产品商品','\"color\":\"blue\",\"size\":\"22\"','/uploads/images/1383583132473.jpg',455,345,'2013-11-04',300,50,200,339,2,1000061,2,168,10000,'2013-11-22',1,8,0,0,0,3,129),(1000076,'005','Test with many children','测试带子产品商品','\"color\":\"red\",\"size\":\"33\"','undefined',455,345,'2013-11-04',300,50,200,340,2,1000061,2,168,10000,'2013-11-22',1,8,0,0,0,3,129),(1000077,'222','Test with many children','测试带子产品商品','\"color\":\"red\",\"size\":\"43\"','/uploads/images/1383584092736.jpg',455,341,'2013-11-04',300,50,200,351,2,1000061,2,168,10000,'2013-11-22',1,8,0,0,0,3,129),(1000078,'','测试推广','测试推广价格时间','','/uploads/images/1384704060653.jpg',500,400,'2013-11-18',0,0,0,250,5,1000062,1,31,1,'2013-11-18',1,8,0,0,0,1,16),(1000079,'','ceshituiguang','测试推广2222','','/uploads/images/1384704964447.jpg',600,300,'2013-11-18',0,0,50,211,5,1000063,2,67,10000,'2013-11-18',1,8,0,0,0,3,19),(1000080,'','111','新任务1','','/uploads/images/1384706095957.jpg',123,100,'2013-11-18',0,0,2,8,5,1000064,2,69,10000,'2013-11-19',1,8,0,0,0,3,19),(1000081,'233','safa','翻译112312','\"color\":\"red\",\"size\":\"22\"','/uploads/images/1384706601134.jpg',123,100,'2013-11-18',111,20,90,1999,5,1000065,2,68,10000,'2013-11-20',1,8,0,0,0,3,19),(1000082,'ddd','asdf',NULL,'\"color\":\"red\",\"size\":\"222\"','/uploads/images/1384707060543.jpg',233,200,'2013-11-18',0,0,55,2222,5,1000066,2,90,10000,'2013-11-20',1,8,0,0,0,3,87),(1000083,'ede','dews',NULL,'\"color\":\"ede\",\"size\":\"21\"','/uploads/images/1384707299077.jpg',2221,111,'2013-11-18',221,14,333,333,5,1000067,2,91,10000,'2013-11-19',1,8,1,2,3,3,87),(1000084,'','adfa','居然翻译的不行','','/uploads/images/1385397151778.jpg',123123,122,'2013-11-12',0,0,0,221,5,1000068,2,55,10000,'2013-11-28',1,8,0,0,0,3,18),(1000085,'A','seller Special care','Seller 特殊护理1','\"color\":\"Red\",\"size\":\"11\"','/uploads/images/1385446660801.JPG',101,91,'2013-11-26',12,101,301,0,5,1000071,1,79,1,'2013-11-26',1,8,1,12,15,1,19),(1000086,'B','seller Special care','Seller 特殊护理1','\"color\":\"Blue\",\"size\":\"13\"','/uploads/images/1385446769473.JPG',99,90,'2013-11-26',11,100,300,1,5,1000071,1,79,1,'2013-11-26',1,8,1,12,15,1,19),(1000087,'C','seller Special care','Seller 特殊护理1','\"color\":\"Green\",\"size\":\"14\"','/uploads/images/1385446899737.JPG',10,9,'2013-11-26',1,10,30,45,5,1000071,1,79,1,'2013-11-26',1,8,1,12,15,1,19),(1000088,'D','seller Special care','Seller 特殊护理1','\"color\":\"Yellow\",\"size\":\"14\"','/uploads/images/1385447191424.JPG',105,95,'2013-11-26',15,105,305,505,5,1000071,1,79,1,'2013-11-26',1,8,1,12,15,1,19),(1000089,'D','seller Special care','Seller 特殊护理1','\"color\":\"Yellow\",\"size\":\"14\"','/uploads/images/1385447191424.JPG',105,95,'2013-11-26',15,105,305,505,5,1000071,1,79,1,'2013-11-26',1,8,1,12,15,1,19),(1000090,'D','seller Special care','Seller 特殊护理1','\"color\":\"Yellow\",\"size\":\"14\"','/uploads/images/1385447264422.JPG',105,95,'2013-11-26',15,105,305,505,5,1000071,1,79,1,'2013-11-26',1,8,1,12,15,1,19),(1000091,'ABC','seller Special care2','Seller特殊护理2','','/uploads/images/1385447860935.JPG',100,90,'2013-11-26',11,100,300,491,5,1000070,1,79,1,'2013-11-26',1,8,1,12,15,1,19),(1000092,'RedL','Seller Shoe Parent ','Seller 鞋父商品','\"color\":\"Red\",\"size\":\"L\"','/uploads/images/1385540584284.JPG',100,90,'2013-11-27',88,20,300,50,5,1000072,1,32,1,'2013-11-28',1,8,0,0,0,1,16),(1000093,'RedS','Seller Shoe Parent ','Seller 鞋父商品','\"color\":\"Red\",\"size\":\"S\"','/uploads/images/1385540670312.JPG',100,99,'2013-11-27',88,20,300,400,5,1000072,1,32,1,'2013-11-28',1,8,0,0,0,1,16),(1000094,'BlueL','Seller Shoe Parent ','Seller 鞋父商品','\"color\":\"Blue\",\"size\":\"L\"','/uploads/images/1385540703032.JPG',100,99,'2013-11-27',88,20,300,400,5,1000072,1,32,1,'2013-11-28',1,8,0,0,0,1,16),(1000095,'BlueS','Seller Shoe Parent ','Seller 鞋父商品','\"color\":\"Blue\",\"size\":\"S\"','/uploads/images/1385540744253.JPG',100,99,'2013-11-27',88,20,300,400,5,1000072,1,32,1,'2013-11-28',1,8,0,0,0,1,16),(1000096,'ddd','测试折扣','Test 折扣价格','','/uploads/images/1386257035206.jpg',200,150,'2013-12-05',0,0,0,218,5,1000073,2,26,10000,'2013-12-05',1,8,1,154,2,3,16),(1000097,'','鞋父1222','翻译完成咯','','/uploads/images/1388073961210.jpg',100,0,NULL,0,0,0,25,5,1000074,2,57,10000,NULL,1,8,0,0,0,3,18);
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
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `message`
--

LOCK TABLES `message` WRITE;
/*!40000 ALTER TABLE `message` DISABLE KEYS */;
INSERT INTO `message` VALUES (1,'1','2','seller',0,'2013-07-24 00:00:00',8,'2013-07-30 00:00:00'),(2,'1','23','customer',1,'2013-07-24 00:00:00',NULL,NULL),(3,'阿道夫1','123123','customer',8,'2013-07-29 00:00:00',9,'2013-10-31 00:00:00'),(4,'123','123122','seller',1,'2013-07-29 00:00:00',7,'2013-07-30 00:00:00'),(5,'asdfasdf','asdfasdfsdaf\r\nasd\r\nf\r\nasdf\r\nas\r\ndf\r\n','admin',1,'2013-07-30 00:00:00',NULL,NULL),(6,'asdfa','asdd','admin',1,'2013-07-30 00:00:00',NULL,NULL),(7,'asdfa','asdf','admin',1,'2013-07-30 00:00:00',NULL,NULL),(8,'asdf','asdfasf','admin',1,'2013-07-30 00:00:00',NULL,NULL),(9,'sdf','asdfasdf','admin',1,'2013-10-31 00:00:00',NULL,NULL),(10,'asaaaaa','aaaaaaaaa','seller',1,'2013-10-31 00:00:00',11,'2013-10-31 00:00:00'),(11,'asdfasdfasdf','a3234123123','admin',1,'2013-10-31 00:00:00',NULL,NULL),(12,'asdfasdfddddddd','12312231231231','translator',0,'2013-10-31 00:00:00',13,'2013-10-31 00:00:00'),(13,'aaaaa','eeee','admin',1,'2013-10-31 00:00:00',NULL,NULL),(14,'esd','aa','translator',0,'2013-10-31 00:00:00',NULL,NULL),(15,'ddd','e12','translator',0,'2013-10-31 00:31:22',NULL,NULL),(16,'投诉','订单号：\r\n货不对板。','customer',10000,'2013-11-27 17:31:17',17,'2013-11-27 17:36:51'),(17,'投诉','我们正在联系商户。请耐心等待。','admin',1,'2013-11-27 17:36:51',NULL,NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=199 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orderItem`
--

LOCK TABLES `orderItem` WRITE;
/*!40000 ALTER TABLE `orderItem` DISABLE KEYS */;
INSERT INTO `orderItem` VALUES (125,1000072,1000060,'测试不带子产品',2,10000,2,341,94,1,21,3,3,'aa2',3239.5,199.5,'测试不带子产品商品',NULL,170.5,1619.75,'',0.5,1619.75,1619.75,3239.5,341,NULL),(126,1000073,1000061,'Test with many children',2,10000,4,345,95,0,0,0,3,'001',3277.5,0,'测试带子产品商品',NULL,0,0,'\"颜色\":\"red\",\"尺寸\":\"21\"',0,3277.5,3277.5,13110,1380,NULL),(127,1000075,1000061,'Test with many children',2,10000,1,345,95,0,0,0,3,'003',3277.5,0,'测试带子产品商品',NULL,0,0,'\"颜色\":\"blue\",\"尺寸\":\"22\"',0,3277.5,3277.5,3277.5,345,NULL),(128,1000072,1000060,'测试不带子产品',2,10000,2,330,96,1,0,3,3,'',3135,0,'测试不带子产品商品',NULL,165,1567.5,'',0.5,1567.5,1567.5,3135,330,NULL),(129,1000072,1000060,'测试不带子产品',2,10000,1,330,97,1,0,3,3,'',3135,0,'测试不带子产品商品',NULL,165,1567.5,'',0.5,1567.5,1567.5,1567.5,165,NULL),(130,1000072,1000060,'测试不带子产品',2,10000,1,330,98,1,0,3,3,'',3135,0,'测试不带子产品商品',NULL,165,1567.5,'',0.5,1567.5,1567.5,1567.5,165,NULL),(131,1000076,1000061,'Test with many children',2,10000,1,345,99,0,0,0,3,'005',3277.5,0,'测试带子产品商品',NULL,0,0,'\"颜色\":\"red\",\"尺寸\":\"33\"',0,3277.5,3277.5,3277.5,345,NULL),(132,1000075,1000061,'Test with many children',2,10000,2,345,100,0,0,0,3,'003',3277.5,0,'测试带子产品商品',NULL,0,0,'\"颜色\":\"blue\",\"尺寸\":\"22\"',0,3277.5,3277.5,6555,690,NULL),(133,1000076,1000061,'Test with many children',2,10000,1,345,101,0,0,0,3,'005',3277.5,0,'测试带子产品商品',NULL,0,0,'\"颜色\":\"red\",\"尺寸\":\"33\"',0,3277.5,3277.5,3277.5,345,NULL),(134,1000075,1000061,'Test with many children',2,10000,4,345,102,0,0,0,3,'003',3277.5,0,'测试带子产品商品',NULL,0,0,'\"颜色\":\"blue\",\"尺寸\":\"22\"',0,3277.5,3277.5,13110,1380,NULL),(135,1000075,1000061,'Test with many children',2,10000,1,345,103,0,0,0,3,'003',3277.5,0,'测试带子产品商品',NULL,0,0,'\"颜色\":\"blue\",\"尺寸\":\"22\"',0,3277.5,3277.5,3277.5,345,NULL),(136,1000076,1000061,'Test with many children',2,10000,5,345,104,0,0,0,3,'005',3277.5,0,'测试带子产品商品',NULL,0,0,'\"颜色\":\"red\",\"尺寸\":\"33\"',0,3277.5,3277.5,16387.5,1725,NULL),(137,1000076,1000061,'Test with many children',2,10000,1,345,105,0,0,0,3,'005',3277.5,0,'测试带子产品商品',NULL,0,0,'\"颜色\":\"red\",\"尺寸\":\"33\"',0,3277.5,3277.5,3277.5,345,NULL),(138,1000076,1000061,'Test with many children',2,10000,1,345,106,0,0,0,3,'005',3277.5,0,'测试带子产品商品',NULL,0,0,'\"颜色\":\"red\",\"尺寸\":\"33\"',0,3277.5,3277.5,3277.5,345,NULL),(139,1000079,1000063,'ceshituiguang',2,10000,45,600,107,0,0,0,3,'',5700,0,'测试推广2222',NULL,0,0,'',0,5700,5700,256500,27000,NULL),(140,1000079,1000063,'ceshituiguang',2,10000,4,300,108,0,0,0,3,'',2850,0,'测试推广2222',NULL,0,0,'',0,2850,2850,11400,1200,NULL),(141,1000080,1000064,'111',2,10000,2,100,109,0,0,0,3,'',950,0,'新任务1',NULL,0,0,'',0,950,950,1900,200,NULL),(142,1000091,1000070,'seller Special care2',1,1,1,90,110,1,12,15,1,'ABC',585,78,'Seller特殊护理2',NULL,0,0,'',0,585,585,585,90,NULL),(143,1000085,1000071,'seller Special care',1,1,10,90,111,1,12,15,1,'A',585,78,'Seller 特殊护理1',NULL,0,0,'\"颜色\":\"Red\",\"尺寸\":\"11\"',0,585,585,5850,900,NULL),(144,1000086,1000071,'seller Special care',1,1,10,90,112,1,0,15,1,'B',585,0,'Seller 特殊护理1',NULL,0,0,'\"颜色\":\"Blue\",\"尺寸\":\"13\"',0,585,585,5850,900,NULL),(145,1000086,1000071,'seller Special care',1,1,8,90,113,1,0,15,1,'B',585,0,'Seller 特殊护理1',NULL,0,0,'\"颜色\":\"Blue\",\"尺寸\":\"13\"',0,585,585,4680,720,NULL),(146,1000086,1000071,'seller Special care',1,1,1,90,114,1,0,15,1,'B',585,0,'Seller 特殊护理1',NULL,0,0,'\"颜色\":\"Blue\",\"尺寸\":\"13\"',0,585,585,585,90,NULL),(147,1000087,1000071,'seller Special care',1,1,1,9,115,1,0,15,1,'C',58.5,0,'Seller 特殊护理1',NULL,0,0,'\"颜色\":\"Green\",\"尺寸\":\"14\"',0,58.5,58.5,58.5,9,NULL),(148,1000085,1000071,'seller Special care',1,1,10,101,116,1,12,15,1,'A',656.5,78,'Seller 特殊护理1',NULL,0,0,'\"颜色\":\"Red\",\"尺寸\":\"11\"',0,656.5,656.5,6565,1010,NULL),(149,1000092,1000072,'Seller Shoe Parent ',1,1,2,99,117,0,0,0,1,'RedL',643.5,0,'Seller 鞋父商品',NULL,49.5,321.75,'\"颜色\":\"Red\",\"尺寸\":\"L\"',0.5,321.75,321.75,643.5,99,NULL),(150,1000092,1000072,'Seller Shoe Parent ',1,1,1,100,118,0,0,0,1,'RedL',650,0,'Seller 鞋父商品',NULL,50,325,'\"颜色\":\"Red\",\"尺寸\":\"L\"',0.5,325,325,325,50,NULL),(151,1000092,1000072,'Seller Shoe Parent ',1,1,299,88,119,0,0,0,1,'RedL',572,0,'Seller 鞋父商品',NULL,44,286,'\"颜色\":\"Red\",\"尺寸\":\"L\"',0.5,286,286,85514,13156,NULL),(152,1000092,1000072,'Seller Shoe Parent ',1,1,290,88,120,0,0,0,1,'RedL',572,0,'Seller 鞋父商品',NULL,44,286,'\"颜色\":\"Red\",\"尺寸\":\"L\"',0.5,286,286,82940,12760,NULL),(153,1000094,1000072,'Seller Shoe Parent ',1,1,300,88,121,0,0,0,1,'BlueL',572,0,'Seller 鞋父商品',NULL,44,286,'\"颜色\":\"Blue\",\"尺寸\":\"L\"',0.5,286,286,85800,13200,NULL),(154,1000085,1000071,'seller Special care',1,1,1,101,122,1,12,15,1,'A',656.5,78,'Seller 特殊护理1',NULL,0,0,'\"颜色\":\"Red\",\"尺寸\":\"11\"',0,656.5,656.5,656.5,101,NULL),(155,1000094,1000072,'Seller Shoe Parent ',1,1,2,100,123,0,0,0,1,'BlueL',650,0,'Seller 鞋父商品',NULL,50,325,'\"颜色\":\"Blue\",\"尺寸\":\"L\"',0.5,325,325,650,100,NULL),(156,1000085,1000071,'seller Special care',1,1,291,12,124,1,0,15,1,'A',78,0,'Seller 特殊护理1',NULL,0,0,'\"颜色\":\"Red\",\"尺寸\":\"11\"',0,78,78,22698,3492,NULL),(157,1000085,1000071,'seller Special care',1,1,290,12,125,1,0,15,1,'A',78,0,'Seller 特殊护理1',NULL,0,0,'\"颜色\":\"Red\",\"尺寸\":\"11\"',0,78,78,22620,3480,NULL),(158,1000085,1000071,'seller Special care',1,1,1,101,126,1,0,15,1,'A',656.5,0,'Seller 特殊护理1',NULL,0,0,'\"颜色\":\"Red\",\"尺寸\":\"11\"',0,656.5,656.5,656.5,101,NULL),(159,1000085,1000071,'seller Special care',1,1,1,101,127,1,0,15,1,'A',656.5,0,'Seller 特殊护理1',NULL,0,0,'\"颜色\":\"Red\",\"尺寸\":\"11\"',0,656.5,656.5,656.5,101,NULL),(160,1000087,1000071,'seller Special care',1,1,1,10,128,1,0,15,1,'C',65,0,'Seller 特殊护理1',NULL,0,0,'\"颜色\":\"Green\",\"尺寸\":\"14\"',0,65,65,65,10,NULL),(161,1000087,1000071,'seller Special care',1,1,2,10,129,1,12,15,1,'C',65,78,'Seller 特殊护理1',NULL,0,0,'\"颜色\":\"Green\",\"尺寸\":\"14\"',0,65,65,130,20,NULL),(162,1000091,1000070,'seller Special care2',1,1,2,100,130,1,0,15,1,'ABC',650,0,'Seller特殊护理2',NULL,0,0,'',0,650,650,1300,200,NULL),(163,1000091,1000070,'seller Special care2',1,1,1,100,131,1,12,15,1,'ABC',650,78,'Seller特殊护理2',NULL,0,0,'',0,650,650,650,100,NULL),(164,1000096,1000073,'测试折扣',2,10000,2,150,131,1,154,2,3,'ddd',1425,1463,'Test 折扣价格',NULL,75,712.5,'',0.5,712.5,712.5,1425,150,NULL),(165,1000091,1000070,'seller Special care2',1,1,1,100,132,1,12,15,1,'ABC',650,78,'Seller特殊护理2',NULL,0,0,'',0,650,650,650,100,NULL),(166,1000096,1000073,'测试折扣',2,10000,2,150,133,1,154,2,3,'ddd',1425,1463,'Test 折扣价格',NULL,75,712.5,'',0.5,712.5,712.5,1425,150,NULL),(167,1000081,1000065,'safa',2,10000,1,123,134,0,0,0,3,'233',1168.5,0,'翻译112312',NULL,0,0,'\"颜色\":\"red\",\"尺寸\":\"22\"',0,1168.5,1168.5,1168.5,123,NULL),(168,1000096,1000073,'测试折扣',2,10000,1,200,134,1,0,2,3,'ddd',1900,0,'Test 折扣价格',NULL,100,950,'',0.5,950,950,950,100,NULL),(169,1000096,1000073,'测试折扣',2,10000,1,200,135,1,0,2,3,'ddd',1900,0,'Test 折扣价格',NULL,100,950,'',0.5,950,950,950,100,NULL),(170,1000096,1000073,'测试折扣',2,10000,1,200,136,1,0,2,3,'ddd',1900,0,'Test 折扣价格',NULL,100,950,'',0.5,950,950,950,100,NULL),(171,1000096,1000073,'测试折扣',2,10000,2,200,137,1,0,2,3,'ddd',1900,0,'Test 折扣价格',NULL,100,950,'',0.5,950,950,1900,200,NULL),(172,1000096,1000073,'测试折扣',2,10000,4,200,138,1,0,2,3,'ddd',1900,0,'Test 折扣价格',NULL,100,950,'',0.5,950,950,3800,400,NULL),(173,1000096,1000073,'测试折扣',2,10000,2,200,139,1,0,2,3,'ddd',1900,0,'Test 折扣价格',NULL,100,950,'',0.5,950,950,1900,200,NULL),(174,1000096,1000073,'测试折扣',2,10000,1,200,140,1,0,2,3,'ddd',1900,0,'Test 折扣价格',NULL,100,950,'',0.5,950,950,950,100,NULL),(175,1000096,1000073,'测试折扣',2,10000,5,200,141,1,0,2,3,'ddd',1900,0,'Test 折扣价格',NULL,100,950,'',0.5,950,950,4750,500,NULL),(176,1000096,1000073,'测试折扣',2,10000,3,200,142,1,0,2,3,'ddd',1900,0,'Test 折扣价格',NULL,100,950,'',0.5,950,950,2850,300,NULL),(177,1000096,1000073,'测试折扣',2,10000,1,200,143,1,0,2,3,'ddd',1900,0,'Test 折扣价格',NULL,100,950,'',0.5,950,950,950,100,NULL),(178,1000096,1000073,'测试折扣',2,10000,4,200,144,1,0,2,3,'ddd',1900,0,'Test 折扣价格',NULL,100,950,'',0.5,950,950,3800,400,NULL),(179,1000096,1000073,'测试折扣',2,10000,6,200,145,1,0,2,3,'ddd',1900,0,'Test 折扣价格',NULL,100,950,'',0.5,950,950,5700,600,NULL),(180,1000096,1000073,'测试折扣',2,10000,5,200,147,1,0,2,3,'ddd',1900,0,'Test 折扣价格',16,100,950,'',0.5,950,950,4750,500,26),(181,1000096,1000073,'测试折扣',2,10000,1,200,148,1,0,2,3,'ddd',1900,0,'Test 折扣价格',16,100,950,'',0.5,950,950,950,100,26),(182,1000096,1000073,'测试折扣',2,10000,1,200,149,1,0,2,3,'ddd',1900,0,'Test 折扣价格',16,100,950,'',0.5,950,950,950,100,26),(183,1000096,1000073,'测试折扣',2,10000,2,200,150,1,0,2,3,'ddd',1900,0,'Test 折扣价格',16,100,950,'',0.5,950,950,1900,200,26),(184,1000096,1000073,'测试折扣',2,10000,4,200,151,1,0,2,3,'ddd',1900,0,'Test 折扣价格',16,100,950,'',0.5,950,950,3800,400,26),(185,1000096,1000073,'测试折扣',2,10000,4,200,152,1,0,2,3,'ddd',1900,0,'Test 折扣价格',16,100,950,'',0.5,950,950,3800,400,26),(186,1000096,1000073,'测试折扣',2,10000,1,200,153,1,0,2,3,'ddd',1900,0,'Test 折扣价格',16,100,950,'',0.5,950,950,950,100,26),(187,1000096,1000073,'测试折扣',2,10000,2,200,154,1,0,2,3,'ddd',1900,0,'Test 折扣价格',16,100,950,'',0.5,950,950,1900,200,26),(188,1000096,1000073,'测试折扣',2,10000,3,200,155,1,0,2,3,'ddd',1900,0,'Test 折扣价格',16,100,950,'',0.5,950,950,2850,300,26),(189,1000096,1000073,'测试折扣',2,10000,1,200,156,1,0,2,3,'ddd',1900,0,'Test 折扣价格',16,100,950,'',0.5,950,950,950,100,26),(190,1000091,1000070,'seller Special care2',1,1,5,100,157,1,0,15,1,'ABC',650,0,'Seller特殊护理2',19,0,0,'',0,650,650,3250,500,79),(191,1000091,1000070,'seller Special care2',1,1,2,100,158,1,0,15,1,'ABC',650,0,'Seller特殊护理2',19,0,0,'',0,650,650,1300,200,79),(192,1000096,1000073,'测试折扣',2,10000,2,200,159,1,0,2,3,'ddd',1900,0,'Test 折扣价格',16,100,950,'',0.5,950,950,1900,200,26),(193,1000096,1000073,'测试折扣',2,10000,3,200,160,1,0,2,3,'ddd',1900,0,'Test 折扣价格',16,100,950,'',0.5,950,950,2850,300,26),(194,1000096,1000073,'测试折扣',2,10000,1,200,161,1,0,2,3,'ddd',1900,0,'Test 折扣价格',16,100,950,'',0.5,950,950,950,100,26),(195,1000096,1000073,'测试折扣',2,10000,11,200,162,1,0,2,3,'ddd',1900,0,'Test 折扣价格',16,100,950,'',0.5,950,950,10450,1100,26),(196,1000096,1000073,'测试折扣',2,10000,3,200,163,1,0,2,3,'ddd',1900,0,'Test 折扣价格',16,100,950,'',0.5,950,950,2850,300,26),(197,1000096,1000073,'测试折扣',2,10000,3,200,164,1,0,2,3,'ddd',1900,0,'Test 折扣价格',16,100,950,'',0.5,950,950,2850,300,26),(198,1000096,1000073,'测试折扣',2,10000,1,200,165,1,0,2,3,'ddd',1900,0,'Test 折扣价格',16,100,950,'',0.5,950,950,950,100,26);
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
) ENGINE=InnoDB AUTO_INCREMENT=430 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orderRecord`
--

LOCK TABLES `orderRecord` WRITE;
/*!40000 ALTER TABLE `orderRecord` DISABLE KEYS */;
INSERT INTO `orderRecord` VALUES (148,94,'beijing',8,'用户提交订单，等待支付','Customer submited the order, waiting for pay money','2013-11-05 00:59:18'),(149,94,'beijing',8,'用户已经支付，等待系统确认','Customer pay the order, waiting for repsonse','2013-11-05 00:59:30'),(150,94,'123',10000,'卖家已发货，等待用户查收','Seller has send, waiting for receive','2013-11-05 00:59:49'),(151,94,'123',10000,'卖家已发货，等待用户查收','Seller has send, waiting for receive','2013-11-05 01:00:28'),(152,94,'beijing',8,'买家已收货','Customer has received','2013-11-05 01:00:49'),(153,95,'toko',8,'用户提交订单，等待支付','Customer submited the order, waiting for pay money','2013-11-06 23:27:27'),(154,95,'toko',8,'用户已经支付，等待系统确认','Customer pay the order, waiting for repsonse','2013-11-06 23:27:31'),(155,95,'123',10000,'卖家已发货，等待用户查收','Seller has send, waiting for receive','2013-11-06 23:27:42'),(156,95,'123',10000,'卖家已发货，等待用户查收','Seller has send, waiting for receive','2013-11-06 23:27:54'),(157,95,'123',10000,'卖家已发货，等待用户查收','Seller has send, waiting for receive','2013-11-06 23:37:48'),(158,96,'toko',8,'用户提交订单，等待支付','Customer submited the order, waiting for pay money','2013-11-06 23:47:03'),(159,97,'toko',8,'用户提交订单，等待支付','Customer submited the order, waiting for pay money','2013-11-06 23:55:42'),(160,98,'toko',8,'用户提交订单，等待支付','Customer submited the order, waiting for pay money','2013-11-06 23:56:05'),(161,99,'toko',8,'用户提交订单，等待支付','Customer submited the order, waiting for pay money','2013-11-12 00:25:16'),(162,99,'toko',8,'用户已经支付，等待系统确认','Customer pay the order, waiting for repsonse','2013-11-12 00:25:19'),(164,98,'123',10000,'商户取消该订单','Seller canceled this order','2013-11-13 03:01:57'),(165,100,'toko',8,'用户提交订单，等待支付','Customer submited the order, waiting for pay money','2013-11-15 18:24:33'),(166,100,'toko',8,'用户已经支付，等待系统确认','Customer pay the order, waiting for repsonse','2013-11-15 18:24:37'),(167,101,'toko',8,'用户提交订单，等待支付','Customer submited the order, waiting for pay money','2013-11-15 18:30:15'),(168,101,'toko',8,'用户已经支付，等待系统确认','Customer pay the order, waiting for repsonse','2013-11-15 18:30:18'),(169,102,'toko',8,'用户提交订单，等待支付','Customer submited the order, waiting for pay money','2013-11-15 18:32:31'),(170,103,'toko',8,'用户提交订单，等待支付','Customer submited the order, waiting for pay money','2013-11-16 01:17:51'),(171,103,'toko',8,'用户已经支付，等待系统确认','Customer pay the order, waiting for repsonse','2013-11-16 01:17:53'),(172,104,'toko',8,'用户提交订单，等待支付','Customer submited the order, waiting for pay money','2013-11-16 01:21:02'),(173,104,'toko',8,'用户已经支付，等待系统确认','Customer pay the order, waiting for repsonse','2013-11-16 01:21:04'),(174,105,'toko',8,'用户提交订单，等待支付','Customer submited the order, waiting for pay money','2013-11-16 23:58:45'),(175,105,'123',10000,'商户取消该订单','Seller canceled this order','2013-11-16 23:59:07'),(176,104,'toko',8,'用户投诉该订单','Customer complain this order','2013-11-17 00:00:21'),(177,103,'toko',8,'用户投诉该订单','Customer complain this order','2013-11-17 00:02:51'),(178,101,'toko',8,'用户投诉该订单','Customer complain this order','2013-11-17 00:05:21'),(179,100,'toko',8,'用户投诉该订单','Customer complain this order','2013-11-17 00:09:50'),(180,106,'toko',8,'用户提交订单，等待支付','Customer submited the order, waiting for pay money','2013-11-17 01:19:36'),(181,106,'toko',8,'用户已经支付，等待系统确认','Customer pay the order, waiting for repsonse','2013-11-17 01:21:42'),(182,107,'toko',8,'用户提交订单，等待支付','Customer submited the order, waiting for pay money','2013-11-18 00:18:01'),(183,107,'toko',8,'用户已经支付，等待系统确认','Customer pay the order, waiting for repsonse','2013-11-18 00:18:55'),(184,108,'toko',8,'用户提交订单，等待支付','Customer submited the order, waiting for pay money','2013-11-18 00:33:22'),(185,108,'toko',8,'用户已经支付，等待系统确认','Customer pay the order, waiting for repsonse','2013-11-18 00:33:25'),(186,109,'toko',8,'用户提交订单，等待支付','Customer submited the order, waiting for pay money','2013-11-18 00:36:52'),(187,109,'toko',8,'用户已经支付，等待系统确认','Customer pay the order, waiting for repsonse','2013-11-18 00:36:54'),(188,95,NULL,0,NULL,NULL,'2013-11-25 00:08:10'),(189,110,'Germany',10000,'用户提交订单，等待支付','Customer submited the order, waiting for pay money','2013-11-26 15:02:30'),(190,110,'Germany',10000,'用户已经支付，等待系统确认','Customer pay the order, waiting for repsonse','2013-11-26 15:14:10'),(191,111,'CHina',10000,'用户提交订单，等待支付','Customer submited the order, waiting for pay money','2013-11-26 15:37:50'),(192,111,'CHina',10000,'用户已经支付，等待系统确认','Customer pay the order, waiting for repsonse','2013-11-26 15:37:57'),(193,112,'USA',10000,'用户提交订单，等待支付','Customer submited the order, waiting for pay money','2013-11-26 15:38:17'),(194,112,'USA',10000,'该订单发生错误','Something wrong to this order, such as out of stock , wrong address ','2013-11-26 15:38:21'),(195,112,'USA',10000,'该订单发生错误','Something wrong to this order, such as out of stock , wrong address ','2013-11-26 15:39:43'),(196,113,'USA',10000,'用户提交订单，等待支付','Customer submited the order, waiting for pay money','2013-11-26 15:49:39'),(197,113,'USA',10000,'用户已经支付，等待系统确认','Customer pay the order, waiting for repsonse','2013-11-26 15:49:43'),(198,113,'USA',10000,'该订单发生错误','Something wrong to this order, such as out of stock , wrong address ','2013-11-26 15:55:37'),(199,114,'USA',10000,'用户提交订单，等待支付','Customer submited the order, waiting for pay money','2013-11-26 15:57:04'),(200,114,'USA',10000,'用户已经支付，等待系统确认','Customer pay the order, waiting for repsonse','2013-11-26 15:57:09'),(201,114,'USA',10000,'该订单发生错误','Something wrong to this order, such as out of stock , wrong address ','2013-11-26 15:57:17'),(202,114,'USA',10000,'该订单发生错误','Something wrong to this order, such as out of stock , wrong address ','2013-11-26 16:08:07'),(203,115,'USA',10000,'用户提交订单，等待支付','Customer submited the order, waiting for pay money','2013-11-26 16:08:23'),(204,115,'USA',10000,'用户已经支付，等待系统确认','Customer pay the order, waiting for repsonse','2013-11-26 16:08:28'),(205,115,'USA',10000,'用户已经支付，等待系统确认','Customer pay the order, waiting for repsonse','2013-11-26 16:20:06'),(206,115,'123',1,'卖家已发货，等待用户查收','Seller has send, waiting for receive','2013-11-26 16:31:27'),(207,111,'123',1,'卖家已发货，等待用户查收','Seller has send, waiting for receive','2013-11-26 16:32:42'),(208,116,'CHina',10000,'用户提交订单，等待支付','Customer submited the order, waiting for pay money','2013-11-27 16:07:08'),(209,116,'CHina',10000,'用户已经支付，等待系统确认','Customer pay the order, waiting for repsonse','2013-11-27 16:07:12'),(210,117,'USA',10000,'用户提交订单，等待支付','Customer submited the order, waiting for pay money','2013-11-27 16:52:09'),(211,117,'USA',10000,'用户已经支付，等待系统确认','Customer pay the order, waiting for repsonse','2013-11-27 16:52:16'),(212,111,'CHina',10000,'买家已收货','Customer has received','2013-11-27 17:31:45'),(213,118,'USA',10000,'用户提交订单，等待支付','Customer submited the order, waiting for pay money','2013-11-30 15:43:05'),(214,118,'USA',10000,'用户已经支付，等待系统确认','Customer pay the order, waiting for repsonse','2013-11-30 15:43:11'),(215,119,'USA',10000,'用户提交订单，等待支付','Customer submited the order, waiting for pay money','2013-11-30 15:49:30'),(216,119,'USA',10000,'该订单发生错误','Something wrong to this order, such as out of stock , wrong address ','2013-11-30 15:49:34'),(217,120,'USA',10000,'用户提交订单，等待支付','Customer submited the order, waiting for pay money','2013-11-30 15:50:07'),(218,120,'USA',10000,'用户已经支付，等待系统确认','Customer pay the order, waiting for repsonse','2013-11-30 15:50:10'),(219,121,'USA',10000,'用户提交订单，等待支付','Customer submited the order, waiting for pay money','2013-11-30 16:17:18'),(220,121,'USA',10000,'用户取消该订单','Customer canceled this order','2013-11-30 16:17:48'),(221,122,'CHina',10000,'用户提交订单，等待支付','Customer submited the order, waiting for pay money','2013-11-30 16:58:09'),(222,123,'USA',10000,'用户提交订单，等待支付','Customer submited the order, waiting for pay money','2013-11-30 16:58:22'),(223,115,'USA',10000,'买家已收货','Customer has received','2013-11-30 16:58:47'),(224,110,'123',1,'卖家已发货，等待用户查收','Seller has send, waiting for receive','2013-11-30 17:08:50'),(225,116,'123',1,'卖家已发货，等待用户查收','Seller has send, waiting for receive','2013-11-30 20:40:25'),(226,116,NULL,0,NULL,NULL,'2013-12-01 02:41:30'),(227,110,NULL,0,NULL,NULL,'2013-12-01 02:41:30'),(228,124,'ddd',8,'用户提交订单，等待支付','Customer submited the order, waiting for pay money','2013-12-01 03:23:09'),(229,124,'ddd',8,'该订单发生错误','Something wrong to this order, such as out of stock , wrong address ','2013-12-01 03:23:20'),(230,125,'ddd',8,'用户提交订单，等待支付','Customer submited the order, waiting for pay money','2013-12-01 03:23:43'),(231,125,'ddd',8,'用户已经支付，等待系统确认','Customer pay the order, waiting for repsonse','2013-12-01 03:23:45'),(232,126,'ddd',8,'用户提交订单，等待支付','Customer submited the order, waiting for pay money','2013-12-01 03:28:48'),(233,126,'ddd',8,'该订单发生错误','Something wrong to this order, such as out of stock , wrong address ','2013-12-01 03:30:01'),(234,127,'ddd',8,'用户提交订单，等待支付','Customer submited the order, waiting for pay money','2013-12-01 03:31:24'),(235,127,'ddd',8,'用户已经支付，等待系统确认','Customer pay the order, waiting for repsonse','2013-12-01 03:31:26'),(236,128,'USA',10000,'用户提交订单，等待支付','Customer submited the order, waiting for pay money','2013-12-01 03:37:42'),(237,128,'USA',10000,'用户已经支付，等待系统确认','Customer pay the order, waiting for repsonse','2013-12-01 03:37:46'),(238,129,'Germany',10000,'用户提交订单，等待支付','Customer submited the order, waiting for pay money','2013-12-01 03:41:26'),(239,129,'Germany',10000,'用户已经支付，等待系统确认','Customer pay the order, waiting for repsonse','2013-12-01 03:41:28'),(240,106,'toko',8,'用户投诉该订单','Customer complain this order','2013-12-01 03:55:28'),(241,107,'toko',8,'用户投诉该订单','Customer complain this order','2013-12-01 03:55:54'),(242,109,'123',10000,'卖家已发货，等待用户查收','Seller has send, waiting for receive','2013-12-04 00:15:11'),(243,109,'Server',0,'系统自动关闭订单','System closed the order','2013-12-04 00:15:30'),(244,108,'123',10000,'卖家已发货，等待用户查收','Seller has send, waiting for receive','2013-12-05 22:42:21'),(245,108,'Server',0,'系统自动关闭订单','System closed the order','2013-12-05 22:42:30'),(246,99,'123',10000,'卖家已发货，等待用户查收','Seller has send, waiting for receive','2013-12-05 22:45:03'),(247,99,'Server',0,'系统自动关闭订单','System closed the order','2013-12-05 22:45:30'),(248,123,'USA',10000,'用户取消该订单','Customer canceled this order','2013-12-05 22:51:14'),(249,122,'CHina',10000,'用户取消该订单','Customer canceled this order','2013-12-05 22:51:27'),(250,130,'ddd',8,'用户提交订单，等待支付','Customer submited the order, waiting for pay money','2013-12-05 23:15:58'),(251,130,'ddd',8,'用户取消该订单','Customer canceled this order','2013-12-05 23:16:05'),(252,131,'cj',8,'用户提交订单，等待支付','Customer submited the order, waiting for pay money','2013-12-05 23:48:59'),(253,132,'cj',8,'用户提交订单，等待支付','Customer submited the order, waiting for pay money','2013-12-05 23:48:59'),(254,133,'cj',8,'用户提交订单，等待支付','Customer submited the order, waiting for pay money','2013-12-05 23:48:59'),(255,131,'Server',0,'订单被切分','Order has been splited','2013-12-05 23:48:59'),(256,133,'cj',8,'用户已经支付，等待系统确认','Customer pay the order, waiting for repsonse','2013-12-05 23:49:39'),(257,132,'cj',8,'用户已经支付，等待系统确认','Customer pay the order, waiting for repsonse','2013-12-05 23:50:15'),(258,97,'toko',8,'用户已经支付，等待系统确认','Customer pay the order, waiting for repsonse','2013-12-05 23:50:18'),(259,102,'toko',8,'用户已经支付，等待系统确认','Customer pay the order, waiting for repsonse','2013-12-05 23:50:20'),(260,96,'toko',8,'用户已经支付，等待系统确认','Customer pay the order, waiting for repsonse','2013-12-05 23:50:23'),(261,134,'toko',8,'用户提交订单，等待支付','Customer submited the order, waiting for pay money','2013-12-11 01:00:03'),(262,134,'toko',8,'用户已经支付，等待系统确认','Customer pay the order, waiting for repsonse','2013-12-11 01:00:06'),(263,135,'toko',8,'用户提交订单，等待支付','Customer submited the order, waiting for pay money','2013-12-11 01:02:08'),(264,135,'toko',8,'用户已经支付，等待系统确认','Customer pay the order, waiting for repsonse','2013-12-11 01:02:11'),(265,136,'toko',8,'用户提交订单，等待支付','Customer submited the order, waiting for pay money','2013-12-15 00:27:29'),(266,136,'toko',8,'用户已经支付，等待系统确认','Customer pay the order, waiting for repsonse','2013-12-15 00:27:32'),(267,136,'123',10000,'卖家已发货，等待用户查收','Seller has send, waiting for receive','2013-12-15 00:28:00'),(268,136,'toko',8,'买家要求退货','Customer want to send back','2013-12-15 00:43:54'),(269,136,'Server',0,'关闭订单','System closed the order','2013-12-15 01:32:53'),(270,136,'123',10000,'卖家退款','Seller return money to customer','2013-12-15 01:32:53'),(271,137,'toko',8,'用户提交订单，等待支付','Customer submited the order, waiting for pay money','2013-12-15 01:35:46'),(272,137,'toko',8,'用户已经支付，等待系统确认','Customer pay the order, waiting for repsonse','2013-12-15 01:35:48'),(273,137,'123',10000,'卖家已发货，等待用户查收','Seller has send, waiting for receive','2013-12-15 01:36:03'),(274,137,'toko',8,'买家要求退货','Customer want to send back','2013-12-15 01:36:17'),(275,137,'Server',0,'关闭订单','System closed the order','2013-12-15 01:37:25'),(276,137,'123',10000,'卖家退款','Seller return money to customer','2013-12-15 01:37:27'),(277,138,'toko',8,'用户提交订单，等待支付','Customer submited the order, waiting for pay money','2013-12-15 01:39:31'),(278,138,'toko',8,'用户已经支付，等待系统确认','Customer pay the order, waiting for repsonse','2013-12-15 01:39:33'),(279,138,'123',10000,'卖家已发货，等待用户查收','Seller has send, waiting for receive','2013-12-15 01:39:48'),(280,138,'toko',8,'买家要求退货','Customer want to send back','2013-12-15 01:39:57'),(281,138,'Server',0,'关闭订单','System closed the order','2013-12-15 01:44:59'),(282,138,'123',10000,'卖家退款','Seller return money to customer','2013-12-15 01:44:59'),(283,139,'toko',8,'用户提交订单，等待支付','Customer submited the order, waiting for pay money','2013-12-15 01:46:36'),(284,139,'toko',8,'用户已经支付，等待系统确认','Customer pay the order, waiting for repsonse','2013-12-15 01:46:38'),(285,139,'123',10000,'卖家已发货，等待用户查收','Seller has send, waiting for receive','2013-12-15 01:46:47'),(286,139,'toko',8,'买家要求退货','Customer want to send back','2013-12-15 01:46:52'),(287,139,'Server',0,'关闭订单','System closed the order','2013-12-15 01:53:47'),(288,139,'123',10000,'卖家退款','Seller return money to customer','2013-12-15 01:53:47'),(289,140,'toko',8,'用户提交订单，等待支付','Customer submited the order, waiting for pay money','2013-12-15 01:56:37'),(290,140,'toko',8,'用户已经支付，等待系统确认','Customer pay the order, waiting for repsonse','2013-12-15 01:56:39'),(291,140,'123',10000,'卖家已发货，等待用户查收','Seller has send, waiting for receive','2013-12-15 01:56:50'),(292,140,'toko',8,'买家要求退货','Customer want to send back','2013-12-15 01:56:56'),(293,140,'Server',0,'关闭订单','System closed the order','2013-12-15 01:57:03'),(294,140,'123',10000,'卖家退款','Seller return money to customer','2013-12-15 01:57:03'),(295,141,'toko',8,'用户提交订单，等待支付','Customer submited the order, waiting for pay money','2013-12-15 02:00:41'),(296,141,'toko',8,'用户已经支付，等待系统确认','Customer pay the order, waiting for repsonse','2013-12-15 02:00:44'),(297,141,'123',10000,'卖家已发货，等待用户查收','Seller has send, waiting for receive','2013-12-15 02:00:54'),(298,141,'toko',8,'买家要求退货','Customer want to send back','2013-12-15 02:01:01'),(299,142,'toko',8,'用户提交订单，等待支付','Customer submited the order, waiting for pay money','2013-12-15 02:04:09'),(300,142,'toko',8,'用户已经支付，等待系统确认','Customer pay the order, waiting for repsonse','2013-12-15 02:04:13'),(301,142,'123',10000,'卖家已发货，等待用户查收','Seller has send, waiting for receive','2013-12-15 02:04:26'),(302,142,'toko',8,'买家要求退货','Customer want to send back','2013-12-15 02:04:32'),(303,143,'toko',8,'用户提交订单，等待支付','Customer submited the order, waiting for pay money','2013-12-15 02:18:38'),(304,143,'toko',8,'用户已经支付，等待系统确认','Customer pay the order, waiting for repsonse','2013-12-15 02:18:40'),(305,143,'123',10000,'商户取消该订单','Seller canceled this order','2013-12-15 02:18:47'),(306,144,'toko',8,'用户提交订单，等待支付','Customer submited the order, waiting for pay money','2013-12-15 02:20:51'),(307,144,'toko',8,'用户已经支付，等待系统确认','Customer pay the order, waiting for repsonse','2013-12-15 02:20:53'),(308,144,'123',10000,'卖家已发货，等待用户查收','Seller has send, waiting for receive','2013-12-15 02:21:01'),(309,144,'toko',8,'用户投诉该订单','Customer complain this order','2013-12-15 02:21:08'),(310,144,'Server',0,'关闭订单','System closed the order','2013-12-15 02:21:30'),(311,144,'123',10000,'卖家退款','Seller return money to customer','2013-12-15 02:21:30'),(312,145,'toko',8,'用户提交订单，等待支付','Customer submited the order, waiting for pay money','2013-12-15 02:24:47'),(313,145,'toko',8,'用户已经支付，等待系统确认','Customer pay the order, waiting for repsonse','2013-12-15 02:24:50'),(314,145,'123',10000,'卖家已发货，等待用户查收','Seller has send, waiting for receive','2013-12-15 02:25:17'),(315,145,'toko',8,'用户投诉该订单','Customer complain this order','2013-12-15 02:25:27'),(316,145,'123',10000,'卖家退款','Seller return money to customer','2013-12-15 02:25:40'),(317,145,'Server',0,'关闭订单','System closed the order','2013-12-15 02:25:40'),(318,135,'123',10000,'卖家已发货，等待用户查收','Seller has send, waiting for receive','2013-12-15 02:37:22'),(319,135,'toko',8,'买家已收货','Customer has received','2013-12-15 02:37:28'),(320,146,'toko',8,'用户提交订单，等待支付','Customer submited the order, waiting for pay money','2013-12-16 23:59:53'),(321,147,'toko',8,'用户提交订单，等待支付','Customer submited the order, waiting for pay money','2013-12-17 00:01:26'),(322,147,'toko',8,'用户已经支付，等待系统确认','Customer pay the order, waiting for repsonse','2013-12-17 00:01:50'),(323,148,'toko',8,'用户提交订单，等待支付','Customer submited the order, waiting for pay money','2013-12-17 00:10:55'),(324,148,'toko',8,'用户已经支付，等待系统确认','Customer pay the order, waiting for repsonse','2013-12-17 00:10:58'),(325,149,'toko',8,'用户提交订单，等待支付','Customer submited the order, waiting for pay money','2013-12-17 00:13:31'),(326,150,'toko',8,'用户提交订单，等待支付','Customer submited the order, waiting for pay money','2013-12-17 00:21:58'),(327,150,'toko',8,'用户已经支付，等待系统确认','Customer pay the order, waiting for repsonse','2013-12-17 00:22:00'),(328,151,'toko',8,'用户提交订单，等待支付','Customer submited the order, waiting for pay money','2013-12-17 22:56:04'),(329,151,'toko',8,'用户已经支付，等待系统确认','Customer pay the order, waiting for repsonse','2013-12-17 22:56:06'),(330,151,'123',10000,'卖家已发货，等待用户查收','Seller has send, waiting for receive','2013-12-17 22:56:14'),(331,151,'toko',8,'买家要求退货','Customer want to send back','2013-12-17 22:56:19'),(332,152,'toko',8,'用户提交订单，等待支付','Customer submited the order, waiting for pay money','2013-12-17 22:59:41'),(333,152,'toko',8,'用户已经支付，等待系统确认','Customer pay the order, waiting for repsonse','2013-12-17 22:59:44'),(334,152,'123',10000,'卖家已发货，等待用户查收','Seller has send, waiting for receive','2013-12-17 22:59:58'),(335,152,'toko',8,'买家要求退货','Customer want to send back','2013-12-17 23:01:48'),(336,152,'123',10000,'卖家退款','Seller return money to customer','2013-12-17 23:01:55'),(337,152,'Server',0,'关闭订单','System closed the order','2013-12-17 23:01:56'),(338,153,'toko',8,'用户提交订单，等待支付','Customer submited the order, waiting for pay money','2013-12-17 23:03:18'),(339,153,'toko',8,'用户已经支付，等待系统确认','Customer pay the order, waiting for repsonse','2013-12-17 23:03:20'),(340,149,'toko',8,'用户已经支付，等待系统确认','Customer pay the order, waiting for repsonse','2013-12-17 23:13:11'),(341,153,'123',10000,'卖家已发货，等待用户查收','Seller has send, waiting for receive','2013-12-17 23:13:22'),(342,153,'toko',8,'买家要求退货','Customer want to send back','2013-12-17 23:13:27'),(343,153,'123',10000,'卖家退款','Seller return money to customer','2013-12-17 23:13:30'),(344,153,'Server',0,'关闭订单','System closed the order','2013-12-17 23:13:30'),(345,154,'toko',8,'用户提交订单，等待支付','Customer submited the order, waiting for pay money','2013-12-23 22:49:04'),(346,154,'toko',8,'用户已经支付，等待系统确认','Customer pay the order, waiting for repsonse','2013-12-23 22:49:07'),(347,154,'123',10000,'卖家已发货，等待用户查收','Seller has send, waiting for receive','2013-12-23 22:49:21'),(348,154,'toko',8,'买家已收货','Customer has received','2013-12-23 22:49:28'),(349,154,'toko',8,'用户投诉该订单','Customer complain this order','2013-12-23 22:56:33'),(350,155,'toko',8,'用户提交订单，等待支付','Customer submited the order, waiting for pay money','2013-12-23 23:55:41'),(351,155,'toko',8,'用户已经支付，等待系统确认','Customer pay the order, waiting for repsonse','2013-12-23 23:55:43'),(352,155,'123',10000,'卖家已发货，等待用户查收','Seller has send, waiting for receive','2013-12-23 23:55:56'),(353,155,'toko',8,'买家已收货','Customer has received','2013-12-23 23:56:02'),(354,155,'toko',8,'用户投诉该订单','Customer complain this order','2013-12-23 23:56:10'),(355,155,'Server',0,'关闭订单','System closed the order','2013-12-24 00:08:00'),(356,156,'toko',8,'用户提交订单，等待支付','Customer submited the order, waiting for pay money','2013-12-24 00:13:45'),(357,156,'toko',8,'用户已经支付，等待系统确认','Customer pay the order, waiting for repsonse','2013-12-24 00:13:47'),(358,156,'123',10000,'卖家已发货，等待用户查收','Seller has send, waiting for receive','2013-12-24 00:14:04'),(359,156,'toko',8,'买家已收货','Customer has received','2013-12-24 00:14:13'),(360,156,'toko',8,'用户投诉该订单','Customer complain this order','2013-12-24 00:14:18'),(361,156,'123',10000,'卖家退款','Seller return money to customer','2013-12-24 00:14:40'),(362,156,'Server',0,'关闭订单','System closed the order','2013-12-24 00:14:40'),(363,156,'Server',0,'关闭订单','System closed the order','2013-12-24 00:14:40'),(364,156,'Server',0,'关闭订单','System closed the order','2013-12-24 00:14:40'),(365,157,'ddd',8,'用户提交订单，等待支付','Customer submited the order, waiting for pay money','2013-12-24 00:17:57'),(366,157,'ddd',8,'用户已经支付，等待系统确认','Customer pay the order, waiting for repsonse','2013-12-24 00:18:00'),(367,150,'123',10000,'卖家已发货，等待用户查收','Seller has send, waiting for receive','2013-12-24 00:18:09'),(368,157,'123',1,'卖家已发货，等待用户查收','Seller has send, waiting for receive','2013-12-24 00:18:42'),(369,157,'ddd',8,'买家已收货','Customer has received','2013-12-24 00:19:40'),(370,157,'ddd',8,'用户投诉该订单','Customer complain this order','2013-12-24 00:19:45'),(371,157,'123',1,'卖家退款','Seller return money to customer','2013-12-24 00:20:05'),(372,157,'Server',0,'关闭订单','System closed the order','2013-12-24 00:20:05'),(373,157,'Server',0,'关闭订单','System closed the order','2013-12-24 00:20:05'),(374,157,'Server',0,'关闭订单','System closed the order','2013-12-24 00:20:05'),(375,158,'ddd',8,'用户提交订单，等待支付','Customer submited the order, waiting for pay money','2013-12-24 00:36:47'),(376,158,'ddd',8,'用户已经支付，等待系统确认','Customer pay the order, waiting for repsonse','2013-12-24 00:36:49'),(377,158,'123',1,'卖家已发货，等待用户查收','Seller has send, waiting for receive','2013-12-24 00:37:03'),(378,158,'ddd',8,'买家已收货','Customer has received','2013-12-24 00:37:12'),(379,158,'ddd',8,'用户投诉该订单','Customer complain this order','2013-12-24 00:37:17'),(380,158,'123',1,'卖家退款','Seller return money to customer','2013-12-24 00:37:50'),(381,158,'Server',0,'关闭订单','System closed the order','2013-12-24 00:37:50'),(382,158,'Server',0,'关闭订单','System closed the order','2013-12-24 00:37:50'),(383,158,'Server',0,'关闭订单','System closed the order','2013-12-24 00:37:50'),(384,159,'toko',8,'用户提交订单，等待支付','Customer submited the order, waiting for pay money','2013-12-26 23:24:51'),(385,159,'toko',8,'用户已经支付，等待系统确认','Customer pay the order, waiting for repsonse','2013-12-26 23:24:55'),(386,159,'123',10000,'卖家已发货，等待用户查收','Seller has send, waiting for receive','2013-12-26 23:25:08'),(387,159,'toko',8,'买家已收货','Customer has received','2013-12-26 23:25:13'),(388,159,'toko',8,'用户投诉该订单','Customer complain this order','2013-12-26 23:25:20'),(389,159,'123',10000,'卖家退款','Seller return money to customer','2013-12-26 23:29:30'),(390,160,'toko',8,'用户提交订单，等待支付','Customer submited the order, waiting for pay money','2013-12-26 23:34:06'),(391,160,'toko',8,'用户已经支付，等待系统确认','Customer pay the order, waiting for repsonse','2013-12-26 23:34:08'),(392,160,'123',10000,'卖家已发货，等待用户查收','Seller has send, waiting for receive','2013-12-26 23:34:23'),(393,160,'toko',8,'买家已收货','Customer has received','2013-12-26 23:34:28'),(394,160,'toko',8,'用户投诉该订单','Customer complain this order','2013-12-26 23:34:32'),(395,160,'123',10000,'卖家退款','Seller return money to customer','2013-12-26 23:35:08'),(396,160,'Server',0,'关闭订单','System closed the order','2013-12-26 23:35:08'),(397,160,'toko',8,'买家要求退货','Customer want to send back','2013-12-26 23:35:34'),(398,160,'Server',0,'关闭订单','System closed the order','2013-12-26 23:36:07'),(399,161,'toko',8,'用户提交订单，等待支付','Customer submited the order, waiting for pay money','2013-12-26 23:43:40'),(400,161,'toko',8,'用户已经支付，等待系统确认','Customer pay the order, waiting for repsonse','2013-12-26 23:43:43'),(401,161,'123',10000,'卖家已发货，等待用户查收','Seller has send, waiting for receive','2013-12-26 23:43:55'),(402,161,'toko',8,'买家已收货','Customer has received','2013-12-26 23:44:01'),(403,161,'toko',8,'用户投诉该订单','Customer complain this order','2013-12-26 23:44:05'),(404,161,'123',10000,'卖家退款, 返款比例为 : 100%.','Seller return money to customer, return percent is : 100%.','2013-12-26 23:44:12'),(405,161,'Server',0,'关闭订单','System closed the order','2013-12-26 23:44:13'),(406,161,'Server',0,'关闭订单','System closed the order','2013-12-26 23:44:13'),(407,162,'toko',8,'用户提交订单，等待支付','Customer submited the order, waiting for pay money','2013-12-26 23:52:33'),(408,162,'toko',8,'用户已经支付，等待系统确认','Customer pay the order, waiting for repsonse','2013-12-26 23:52:35'),(409,162,'123',10000,'卖家已发货，等待用户查收','Seller has send, waiting for receive','2013-12-26 23:52:55'),(410,162,'toko',8,'买家已收货','Customer has received','2013-12-26 23:52:59'),(411,162,'toko',8,'用户投诉该订单','Customer complain this order','2013-12-26 23:54:38'),(412,163,'toko',8,'用户提交订单，等待支付','Customer submited the order, waiting for pay money','2013-12-26 23:55:12'),(413,163,'toko',8,'用户已经支付，等待系统确认','Customer pay the order, waiting for repsonse','2013-12-26 23:55:15'),(414,163,'123',10000,'卖家已发货，等待用户查收','Seller has send, waiting for receive','2013-12-26 23:55:40'),(415,163,'toko',8,'用户投诉该订单','Customer complain this order','2013-12-27 00:00:57'),(416,164,'toko',8,'用户提交订单，等待支付','Customer submited the order, waiting for pay money','2013-12-28 01:27:07'),(417,164,'toko',8,'用户已经支付，等待系统确认','Customer pay the order, waiting for repsonse','2013-12-28 01:27:11'),(418,164,'123',10000,'卖家已发货，等待用户查收','Seller has send, waiting for receive','2013-12-28 01:27:29'),(419,164,'toko',8,'买家已收货','Customer has received','2013-12-28 01:27:37'),(420,164,'toko',8,'用户投诉该订单','Customer complain this order','2013-12-28 01:27:42'),(421,164,'123',10000,'卖家退款, 返款比例为 : 20%.','Seller return money to customer, return percent is : 20%.','2013-12-28 01:27:56'),(422,164,'Server',0,'关闭订单','System closed the order','2013-12-28 01:27:56'),(423,165,'toko',8,'用户提交订单，等待支付','Customer submited the order, waiting for pay money','2013-12-28 01:29:34'),(424,165,'toko',8,'用户已经支付，等待系统确认','Customer pay the order, waiting for repsonse','2013-12-28 01:29:36'),(425,165,'123',10000,'卖家已发货，等待用户查收','Seller has send, waiting for receive','2013-12-28 01:29:47'),(426,165,'toko',8,'买家已收货','Customer has received','2013-12-28 01:29:53'),(427,165,'toko',8,'用户投诉该订单','Customer complain this order','2013-12-28 01:30:15'),(428,165,'123',10000,'卖家退款, 返款比例为 : 50%.','Seller return money to customer, return percent is : 50%.','2013-12-28 01:30:29'),(429,165,'Server',0,'关闭订单','System closed the order','2013-12-28 01:30:29');
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
) ENGINE=InnoDB AUTO_INCREMENT=166 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (147,500,0,500,'2013-12-17 00:01:26',NULL,'toko','12211','tokyo','Japan','123331',8,10000,'123',0,NULL,2,NULL,NULL,NULL,NULL,4750,0,4750,1000,9500,1000,9500,0,NULL,NULL,NULL,0,NULL),(148,100,0,100,'2013-12-17 00:10:55',NULL,'toko','12211','tokyo','Japan','123331',8,10000,'123',0,NULL,2,NULL,NULL,NULL,NULL,950,0,950,200,1900,200,1900,0,NULL,NULL,NULL,0,NULL),(149,100,0,100,'2013-12-17 00:13:31',NULL,'toko','12211','tokyo','Japan','123331',8,10000,'123',0,NULL,2,NULL,NULL,NULL,NULL,950,0,950,200,1900,200,1900,0,NULL,NULL,NULL,0,NULL),(150,200,0,200,'2013-12-17 00:21:58',NULL,'toko','12211','tokyo','Japan','123331',8,10000,'123',0,NULL,3,NULL,'123','1231','23123',1900,0,1900,400,3800,400,3800,0,NULL,'2013-12-24 00:18:09',NULL,0,2),(151,400,0,400,'2013-12-17 22:56:03',NULL,'toko','12211','tokyo','Japan','123331',8,10000,'123',0,NULL,6,'2013-12-02 00:00:00','2','1','2',3800,0,3800,800,7600,800,7600,0,NULL,'2013-12-17 22:56:14',NULL,0,2),(152,400,0,400,'2013-12-17 22:59:41',NULL,'toko','12211','tokyo','Japan','123331',8,10000,'123',0,NULL,12,'2013-12-17 00:00:00','2','1','3',3800,0,3800,800,7600,800,7600,0,NULL,'2013-12-17 22:59:58',NULL,0,2),(153,100,0,100,'2013-12-17 23:03:18',NULL,'toko','12211','tokyo','Japan','123331',8,10000,'123',0,NULL,12,'2013-12-10 00:00:00','2','3','1',950,0,950,200,1900,200,1900,0,NULL,'2013-12-17 23:13:22',NULL,0,2),(154,200,0,200,'2013-12-23 22:49:04',NULL,'toko','12211','tokyo','Japan','123331',8,10000,'123',0,NULL,10,'2013-12-17 00:00:00','d','e','1',1900,0,1900,400,3800,400,3800,0,NULL,'2013-12-23 22:49:21',NULL,0,2),(155,300,0,300,'2013-12-23 23:55:41',NULL,'toko','12211','tokyo','Japan','123331',8,10000,'123',0,NULL,12,'2013-12-10 00:00:00','d','e','12323',2850,0,2850,600,5700,600,5700,0,NULL,'2013-12-23 23:55:56',NULL,0,2),(156,100,0,100,'2013-12-24 00:13:45',NULL,'toko','12211','tokyo','Japan','123331',8,10000,'123',0,NULL,12,'2013-12-10 00:00:00','12','23','123123312',950,0,950,200,1900,200,1900,0,NULL,'2013-12-24 00:14:04',NULL,0,2),(157,500,0,500,'2013-12-24 00:17:57',NULL,'ddd','23','1','USA','222',8,1,'123',0,NULL,12,'2013-12-09 00:00:00','231','23123','123',3250,0,3250,500,3250,500,3250,0,NULL,'2013-12-24 00:18:42',NULL,0,1),(158,200,0,200,'2013-12-24 00:36:47',NULL,'ddd','23','1','USA','222',8,1,'123',0,NULL,12,'2013-12-18 00:00:00','123','123','123',1300,0,1300,200,1300,200,1300,0,NULL,'2013-12-24 00:37:03',NULL,0,1),(159,200,0,200,'2013-12-26 23:24:51',NULL,'toko','12211','tokyo','Japan','123331',8,10000,'123',0,NULL,10,'2013-12-02 00:00:00','2','1','2',1900,0,1900,400,3800,400,3800,0,NULL,'2013-12-26 23:25:08',NULL,1,2),(160,300,0,300,'2013-12-26 23:34:06',NULL,'toko','12211','tokyo','Japan','123331',8,10000,'123',0,NULL,12,'2013-12-10 00:00:00','2','1','222',2850,0,2850,600,5700,600,5700,0,NULL,'2013-12-26 23:34:23',NULL,1,2),(161,100,0,100,'2013-12-26 23:43:40',NULL,'toko','12211','tokyo','Japan','123331',8,10000,'123',0,NULL,12,'2013-12-02 00:00:00','1','2','3',950,0,950,200,1900,200,1900,0,NULL,'2013-12-26 23:43:54',NULL,1,2),(162,1100,0,1100,'2013-12-26 23:52:33',NULL,'toko','12211','tokyo','Japan','123331',8,10000,'123',0,NULL,10,'2013-12-30 00:00:00','2','123','123',10450,0,10450,2200,20900,2200,20900,0,NULL,'2013-12-26 23:52:55',NULL,1,2),(163,300,0,300,'2013-12-26 23:55:12',NULL,'toko','12211','tokyo','Japan','123331',8,10000,'123',0,NULL,10,'2013-12-10 00:00:00','2','1','2',2850,0,2850,600,5700,600,5700,0,NULL,'2013-12-26 23:55:40',NULL,1,2),(164,300,0,300,'2013-12-28 01:27:07',NULL,'toko','12211','tokyo','Japan','123331',8,10000,'123',0,NULL,12,'2013-12-10 00:00:00','2','1','2',2850,0,2850,600,5700,600,5700,0,NULL,'2013-12-28 01:27:29',NULL,2,2),(165,100,0,100,'2013-12-28 01:29:34',NULL,'toko','12211','tokyo','Japan','123331',8,10000,'123',0,NULL,12,'2013-12-14 00:00:00','2','1','2',950,0,950,200,1900,200,1900,0,NULL,'2013-12-28 01:29:47',NULL,2,2);
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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `passwordkey`
--

LOCK TABLES `passwordkey` WRITE;
/*!40000 ALTER TABLE `passwordkey` DISABLE KEYS */;
INSERT INTO `passwordkey` VALUES (1,'seller','sonyfe25cp@gmail.com','MgTtYe'),(2,'seller','seller2@tdg.com','VoLnCk'),(3,'seller','seller2@tdg.com','XdWgEs'),(4,'seller','seller2@tdg.com','XoUyJq'),(5,'seller','seller2@tdg.com','CnSmCy'),(6,'seller','seller2@tdg.com','LxFpQd');
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
) ENGINE=InnoDB AUTO_INCREMENT=1000075 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (1000060,'测试不带子产品','测试不带子产品商品','dddee','测试网络图片上传<img src=\"http://www.iteye.com/upload/logo/user/660600/f2d8c739-d03f-32b4-abb2-5a9a3d507c34.jpg?1333633665\" alt=\"\" />',5,1,21,3,341,330,'2013-11-06','2013-11-20',0,0,1,351,22,1,3,5,'1*2*4','/uploads/images/1383582910551.jpg','/uploads/images/1383582913965.jpg;/uploads/images/1383582914011.jpg;/uploads/images/1383582914053.jpg;',NULL,0,0,10000,31,NULL,2,3,6,16,''),(1000061,'Test with many children','测试带子产品商品','<p>\n	dddd\n</p>','<p>\r\n	<img src=\"/uploads/images/1383583218129.jpg\" alt=\"\" />\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	测试一下图片上传\r\n</p>',5,0,0,0,455,345,'2013-11-04','2013-11-22',300,50,1,351,2,1,3,5,'2*1*3','/uploads/images/1383582971946.jpg','/uploads/images/1383582976185.jpg;/uploads/images/1383582976225.jpg;/uploads/images/1383582976272.jpg;/uploads/images/1383582976325.jpg;',NULL,1,0,10000,168,NULL,2,3,6,129,'0'),(1000062,'测试推广','测试推广价格时间','ddd','123123',5,0,0,0,500,400,'2013-11-18','2013-11-18',0,0,0,250,5,1,3,4,'5*1*2','/uploads/images/1384704060653.jpg','',NULL,0,0,1,31,NULL,1,1,6,16,''),(1000063,'ceshituiguang','测试推广2222','dasdasf','<p>\r\n	阿斯顿发斯蒂芬\r\n</p>\r\n<p>\r\n	<img src=\"/uploads/images/1384705029313.jpg\" alt=\"\" />\r\n</p>',5,0,0,0,600,300,'2013-11-18','2013-11-18',0,0,50,260,5,1,3,21,'1*2*2','/uploads/images/1384704964447.jpg','/uploads/images/1384704967277.jpg;',NULL,0,0,10000,67,NULL,2,3,6,19,''),(1000064,'111','新任务1','第三方','23123',5,0,0,0,123,100,'2013-11-18','2013-11-19',0,0,2,10,5,1,12,21,'3*3*2','/uploads/images/1384706095957.jpg','',NULL,0,0,10000,69,NULL,2,3,6,19,''),(1000065,'safa','翻译112312','dd','撒旦法',5,1,1,2,123,100,'2013-11-18','2013-11-20',111,20,90,2000,5,1,2,3,'1*2*3','/uploads/images/1384706553409.jpg','/uploads/images/1384706557049.jpg;',NULL,1,0,10000,68,NULL,2,3,6,19,'0'),(1000066,'asdf',NULL,'2323',NULL,1,1,2,2,233,200,'2013-11-18','2013-11-20',0,0,55,2222,5,1,2,12,'2*3*1','/uploads/images/1384706999317.jpg','/uploads/images/1384707002563.jpg;/uploads/images/1384707002598.jpg;/uploads/images/1384707002629.jpg;/uploads/images/1384707002677.jpg;',NULL,1,0,10000,90,NULL,2,3,0,87,'0'),(1000067,'dews',NULL,'123',NULL,1,1,2,3,222,111,'2013-11-18','2013-11-19',221,14,333,212,5,1,2,3,'2*2*3','/uploads/images/1384707258944.jpg','',NULL,1,0,10000,91,NULL,2,3,0,87,'0'),(1000068,'adfa','居然翻译的不行','<img src=\"/uploads/images/1385397176670.jpg\" alt=\"\" />','再来一次',4,0,0,0,123123,122,'2013-11-12','2013-11-28',0,0,0,221,5,1,2,3,'1*2*3','/uploads/images/1385397151778.jpg','/uploads/images/1385397155312.jpg;/uploads/images/1385397155354.jpg;/uploads/images/1385397155441.jpg;',NULL,0,0,10000,55,NULL,2,3,0,18,''),(1000069,'seller Special care','Seller 特殊护理3','GGGGGGGGGG<img src=\"/uploads/images/1385446335064.JPG\" alt=\"\" />','<p>\r\n	GGGGGGGGGGG\r\n</p>\r\n<p>\r\n	<img src=\"http://tdg.omartech.com/uploads/images/1385446335064.JPG\" />\r\n</p>',5,1,12,15,100,90,'2013-11-26','2013-11-26',11,100,300,500,5,1,15,20,'1*2*3','/uploads/images/1385446094356.JPG','/uploads/images/1385446097805.JPG;',NULL,1,0,1,79,NULL,1,1,6,19,'0'),(1000070,'seller Special care2','Seller特殊护理2','GGGGGGGHHHHHH<br />\n<p>\n	<img src=\"/uploads/images/1385446387501.JPG\" alt=\"\" /> \n</p>','<p>\r\n	UPdateUPdateUPdate\r\n</p>\r\n<p>\r\n	<img src=\"http://tdg.omartech.com/uploads/images/1385446387501.JPG\" />\r\n</p>',5,1,12,15,100,90,'2013-11-26','2013-11-26',11,100,300,500,5,1,15,20,'1*2*3','/uploads/images/1385447860935.JPG','/uploads/images/1385447874928.JPG;',NULL,0,0,1,79,NULL,1,1,6,19,'ABC'),(1000071,'seller Special care','Seller 特殊护理1','GGGGHHHH<br />\n<img src=\"/uploads/images/1385446507627.JPG\" alt=\"\" /><br />','<p>\r\n	GGGGGGHHHHHH\r\n</p>\r\n<p>\r\n	<img src=\"http://tdg.omartech.com/uploads/images/1385446507627.JPG\" />\r\n</p>',5,1,11,11,101,91,'2013-11-26','2013-11-26',12,101,301,501,5,1,11,21,'1*1*1','/uploads/images/1385447376459.JPG','/uploads/images/1385447380350.JPG;',NULL,1,0,1,79,NULL,1,1,6,19,'0'),(1000072,'Seller Shoe Parent ','Seller 鞋父商品','<p>\n	AAAABBBB\n</p>\n<p>\n	<img src=\"/uploads/images/1385540500880.JPG\" alt=\"\" />\n</p>','<p>\r\n	AAAABBBBB\r\n</p>\r\n<p>\r\n	<img src=\"http://tdg.omartech.com/uploads/images/1385540500880.JPG\" />\r\n</p>',5,0,0,0,100,99,'2013-11-27','2013-11-28',88,20,300,400,5,1,1,2,'1*2*3','/uploads/images/1385540395610.JPG','/uploads/images/1385540408205.JPG;',NULL,1,0,1,32,NULL,1,1,6,16,'0'),(1000073,'测试折扣','Test 折扣价格','asdfasdf','123123大叔',5,1,154,2,200,150,'2013-12-05','2013-12-05',0,0,0,300,5,1,1,2,'3*1*5','/uploads/images/1386257035206.jpg','',NULL,0,0,10000,26,NULL,2,3,6,16,'ddd'),(1000074,'鞋父1222','翻译完成咯','asdfasf','asdfdd阿斯顿发斯蒂芬',5,0,0,0,100,0,NULL,NULL,0,0,0,25,5,1,21,22,'1*2*3','/uploads/images/1388073961210.jpg','/uploads/images/1388073964795.jpg;/uploads/images/1388073964837.jpg;/uploads/images/1388073964868.jpg;/uploads/images/1388073964918.jpg;',NULL,0,0,10000,57,NULL,2,3,0,18,'');
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
) ENGINE=InnoDB AUTO_INCREMENT=201 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productLine`
--

LOCK TABLES `productLine` WRITE;
/*!40000 ALTER TABLE `productLine` DISABLE KEYS */;
INSERT INTO `productLine` VALUES (16,'服装，鞋子，包包','Clothing, Shoes & Handbags',0,1,0.5,0.1),(17,'服装','Clothing',16,2,NULL,0.1),(18,'儿童，母婴用品和玩具','Kids , Maternity , Baby & Toys and Games',0,1,NULL,0.1),(19,'美容, 护肤, 美发','Beauty',0,1,NULL,0.1),(20,'化妆用品','Makeup',19,2,NULL,0.1),(21,'眼部化妆','Eyes',20,3,NULL,0.1),(22,'女装','Women’s Clothing',17,3,NULL,0.1),(23,'鞋子 ','Shoes',16,2,NULL,0.1),(24,'男装','Men’s Clothing',17,3,NULL,0.1),(25,'包包','Handbags',16,2,NULL,0.1),(26,'服饰配件','Accessories',17,3,NULL,0.1),(27,'内衣','Intimates',17,3,NULL,0.1),(28,'家居休闲服','Sleep & Lounge',17,3,NULL,0.1),(29,'泳衣','Swim',17,3,NULL,0.1),(30,'女鞋','Women’s Shoes',23,3,NULL,0.1),(31,'男鞋','Men’s Shoes',23,3,NULL,0.1),(32,'少年鞋','Boys’ Shoes',23,3,NULL,0.1),(33,'少女鞋','Girls’ Shoes',23,3,NULL,0.1),(34,'运动鞋和户外鞋','Athletic and Outdoor Shoes',23,3,NULL,0.1),(35,'鞋子护理与配件','Shoes Care & Accessories',23,3,NULL,0.1),(36,'女包','Women’s Handbags',25,3,NULL,0.1),(37,'男包','Men’s Handbags',25,3,NULL,0.1),(38,'箱包','Luggage',25,3,NULL,0.1),(39,'书包，其它包和配件','Backpacks, Bags, Cases and Accessories',25,3,NULL,0.1),(40,'妈妈用品','Maternity Products',18,2,NULL,0.1),(41,'婴儿用品','Baby Products',18,2,NULL,0.1),(42,'儿童服装','Kids’ Clothing',18,2,NULL,0.1),(43,'玩具和游戏','Toys and Games',18,2,NULL,0.1),(45,'护肤用品','Skincare Products',19,2,NULL,0.1),(46,'男士护理','Men’s Grooming',19,2,NULL,0.1),(47,'美发用品','Hair Care',19,2,NULL,0.1),(48,'香水','Perfume',19,2,NULL,0.1),(49,'配件和工具','Tools and Accessories',19,2,NULL,0.1),(50,'孕妇服装','Maternity Clothing',40,3,NULL,0.1),(51,'孕妇配件','Maternity Accessories',40,3,NULL,0.1),(52,'妈妈护理/营养 ','Mom’s care',40,3,NULL,0.1),(53,'婴儿服装','Baby’s Clothing',41,3,NULL,0.1),(54,'婴儿喂养用品','Baby Health and Food',41,3,NULL,0.1),(55,'婴儿护理用品','Baby Care',41,3,NULL,0.1),(56,'男孩服装','Boys’ Clothing',42,3,NULL,0.1),(57,'女孩服装','Girls’ Clothing',42,3,NULL,0.1),(58,'婴儿玩具和游戏','Baby’s toys and Games	',43,3,NULL,0.1),(59,'儿童玩具和游戏','Kids’ toys and Games',43,3,NULL,0.1),(60,'','',20,3,NULL,0.1),(61,'','',20,3,NULL,0.1),(62,'眼部化妆','Eyes',20,3,NULL,0.1),(63,'唇部化妆','Lips',20,3,NULL,0.1),(64,'脸部化妆','Face',20,3,NULL,0.1),(65,'美甲','Nails',20,3,NULL,0.1),(66,'脸部护理','Face',45,3,NULL,0.1),(67,'眼部护理','Eyes ',45,3,NULL,0.1),(68,'唇部护理','Lip Care',45,3,NULL,0.1),(69,'身体护理','Bath & Body',45,3,NULL,0.1),(70,'防晒','Sun',45,3,NULL,0.1),(71,'刮脸','Shave',46,3,NULL,0.1),(72,'护肤','Skin Care',46,3,NULL,0.1),(73,'身体护理','Body Care',46,3,NULL,0.1),(74,'头发护理','Hair Care',46,3,NULL,0.1),(75,'洗发水','Shampoo',47,3,NULL,0.1),(76,'护发素','Conditioner',47,3,NULL,0.1),(77,'造型用品','Styling Products',47,3,NULL,0.1),(78,'染发用品','Hair Color',47,3,NULL,0.1),(79,'特别护理','Hair Treatment',47,3,NULL,0.1),(80,'女士香水','Women’s Perfume',48,3,NULL,0.1),(81,'男士香水','Men’s Perfume',48,3,NULL,0.1),(82,'护发工具','Hair Tools',49,3,NULL,0.1),(83,'化妆工具','Makeup Brushes',49,3,NULL,0.1),(84,'美甲工具','Nail Tools',49,3,NULL,0.1),(85,'化妆包','Cosmetics Bags & Cases',49,3,NULL,0.1),(86,'清洗工具','Cleansing Tools',49,3,NULL,0.1),(87,'户外运动用品','Outdoor Recreation ',0,1,NULL,0.1),(88,'户外运动用品','Outdoor Recreation',87,2,NULL,0.1),(89,'运动服装','Athletic & Outdoor Clothing ',87,2,NULL,0.1),(90,'健身用品','Fitness & Exercises Products',87,2,NULL,0.1),(91,'其它运动用品和配件','All other Sports & Outdoors/ Accessories',87,2,NULL,0.1),(92,'钓鱼和打猎','Fishing and hunting',88,3,NULL,0.1),(93,'水上和船上运动','Water Sports& Boating',88,3,NULL,0.1),(94,'爬山','Climbing',88,3,NULL,0.1),(95,'露营','Camping& Backpacking',88,3,NULL,0.1),(96,'雪上运动','Snow Sports',88,3,NULL,0.1),(97,'自行车运动','Cycling',88,3,NULL,0.1),(98,'高尔夫','Golf',88,3,NULL,0.1),(99,'男士服装','Men’s Clothing',89,3,NULL,0.1),(100,'女士服装','Women’s Clothing',89,3,NULL,0.1),(101,'男孩服装','Boys’ Clothing',89,3,NULL,0.1),(102,'女孩服装','Girls’ Clothing',89,3,NULL,0.1),(103,'食品和医药保健品','Foods',0,1,0.5,0.1),(104,'食品','Grocery & Gourmet Food',103,2,NULL,0.1),(105,'酒类','Wine',103,2,NULL,0.1),(106,'卫生医药保健营养品','Health Care',103,2,NULL,0.1),(107,'早餐','Breakfast Foods',104,3,NULL,0.1),(108,'零食','Snacks',104,3,NULL,0.1),(109,'饮料','Beverages',104,3,NULL,0.1),(110,'有机食品','Organic Foods',104,3,NULL,0.1),(111,'无面筋食品','Gluten-Free Foods',104,3,NULL,0.1),(112,'烘焙食品','Baking Products',104,3,NULL,0.1),(113,'食品套装礼品','Gourmet gift',104,3,NULL,0.1),(114,'咖啡&茶','Coffee and Tea',104,3,NULL,0.1),(115,'其它食品','other foods',104,3,NULL,0.1),(116,'调味料','Herbs, Spices and seasoning',104,3,NULL,0.1),(117,'储存便捷快速食品','Pantry',104,3,NULL,0.1),(118,'健康护理（药品）','Health Care',106,3,NULL,0.1),(119,'维他命&其它元素补给营养品','Vitamin Supplement& Natural Remedies',106,3,NULL,0.1),(120,'性福产品','Sexual Wellness',106,3,NULL,0.1),(121,'减肥产品','Weight Management & Dietary Supplement',106,3,NULL,0.1),(122,'运动营养品','Sports Nutrition',106,3,NULL,0.1),(123,'个人护理产品','Personal Care',106,3,NULL,0.1),(124,'家庭医疗护理器材','Health Care Equipments',106,3,NULL,0.1),(125,'其他','Other Heal Care',106,3,NULL,0.1),(126,'电子用品','Electronics',0,1,NULL,0.1),(127,'电子配件','Electronic Accessories',126,2,NULL,0.1),(128,'电子产品','',126,2,NULL,0.1),(129,'珠宝首饰，手表和其它配饰','Jewelry, Watch & Accessories',0,1,NULL,0.1),(130,'家庭用品，车辆用品和游戏产品','Home, Vehicle & Games',0,1,NULL,0.1),(131,'其它产品','',0,1,NULL,0.1),(132,'办公以及上学用品','Office & school supplies',131,2,NULL,0.1),(133,'艺术，工艺 &缝纫','Art, Craft & Sewing',131,2,NULL,0.1),(134,'工业用品','Industrial Products',131,2,NULL,0.1),(135,'实验用品','Lab& Scientific',131,2,NULL,0.1),(136,'乐器','Musical Instruments',131,2,NULL,0.1),(137,'书籍/杂志/报纸','Books, Magazines & Newspaper',131,2,NULL,0.1),(138,'音乐/影视/明星/音像','Movies & Music',131,2,NULL,0.1),(139,'安全设备&安全用品','Safety Equipment & Safety Supplies',131,2,NULL,0.1),(140,'鲜花&绿植园艺','Flower & Gardening',131,2,NULL,0.1),(141,'网络设备/网络相关','Internet devices & Supplies',131,2,NULL,0.1),(142,'个性定制/设计服务/DIY','',131,2,NULL,0.1),(143,'圣诞用品','Christmas Products',131,2,NULL,0.1),(144,'家庭用品','Home Supplies',130,2,NULL,0.1),(145,'床上用品','Bedding',144,3,NULL,0.1),(146,'住宅家具','Furniture',144,3,NULL,0.1),(147,'家居饰品','Decorations',144,3,NULL,0.1),(148,'厨房/餐饮用具','Kitchen & Dining',144,3,NULL,0.1),(149,'家用配件','Home Hardware',144,3,NULL,0.1),(150,'室外，阳台，花园用品','Patio, Garden & Outdoor Products',144,3,NULL,0.1),(151,'家用工具','Tools& Home Improvement',144,3,NULL,0.1),(152,'家装主材','Building Supplies',144,3,NULL,0.1),(153,'卫浴/收纳/整理用具','Cleaning, Bathing & Organizing',144,3,NULL,0.1),(154,'清洁用品','Janitorial Supplies',144,3,NULL,0.1),(155,'灯&天花板扇','Lighting & Ceiling fans',144,3,NULL,0.1),(156,'生活用品','Household Supplies',144,3,NULL,0.1),(157,'艺术品','Fine Art',144,3,NULL,0.1),(158,'宠物食品和护理','Pet Food and Supplies',130,2,NULL,0.1),(159,'车辆用品','',130,2,NULL,0.1),(160,'游戏产品','Digital Games & Software',130,2,NULL,0.1),(161,'汽车零件和配件','Automotive Parts & Accessories',159,3,NULL,0.1),(162,'汽车工具及设备','Automotive Tools & Equipment ',159,3,NULL,0.1),(163,'摩托车用品及配件','motorcycle & Accessories',159,3,NULL,0.1),(164,'宠物食品','Pet Foods',158,3,NULL,0.1),(165,'宠物护理用品','Pet Supplies',158,3,NULL,0.1),(166,'珠宝首饰','Jewelry',129,2,NULL,0.1),(167,'手表','Watch',129,2,NULL,0.1),(168,'其它配饰','Accessories',129,2,NULL,0.1),(169,'男士手表','Men’s Watch',167,3,NULL,0.1),(170,'女士手表','Women’s Watch',167,3,NULL,0.1),(171,'戒指','Rings',166,3,NULL,0.1),(172,'项链','Necklaces',166,3,NULL,0.1),(173,'手链','Bracelets',166,3,NULL,0.1),(174,'耳环&耳钉 ','Earrings',166,3,NULL,0.1),(175,'男士首饰','Men’s Jewelry',166,3,NULL,0.1),(181,'手机配件','Cell Phone Accessories',127,3,NULL,0.1),(182,'电脑配件 ','Computer Accessories',127,3,NULL,0.1),(183,'电脑硬件','Computer parts& Components',127,3,NULL,0.1),(184,'电脑软件','Software',127,3,NULL,0.1),(185,'电脑周边','Computer Peripherals',127,3,NULL,0.1),(186,'闪存卡/U盘/存储/移动硬盘','Memory Card, Flash disk & Hard Drive',127,3,NULL,0.1),(187,'音乐播放器配件&MP3/MP4配件','Music player& MP3,MP4 Accessories',127,3,NULL,0.1),(188,'耳机/耳麦','Headphones',127,3,NULL,0.1),(189,'其它','other',127,3,NULL,0.1),(190,'电脑 ','Computer (Desktops & Laptops)',128,3,NULL,0.1),(191,'相机& 摄像机','Camera, Photo& Video',128,3,NULL,0.1),(192,'影音电器','Home Audio &Theater',128,3,NULL,0.1),(193,'安全与监控','Security & Surveillance',128,3,NULL,0.1),(194,'平板电脑','Tablets',128,3,NULL,0.1),(195,'手机','Cell Phone',128,3,NULL,0.1),(196,'MP3/MP4/iPod/录音笔','MP3, MP4 Players & Recorder',128,3,NULL,0.1),(197,'汽车电子用品','Vehicle Electronics',128,3,NULL,0.1),(198,'打印机&墨','Printers& Ink',128,3,NULL,0.1),(199,'厨房用品','Kitchen Electronics',128,3,NULL,0.1),(200,'生活电器','',128,3,NULL,0.1);
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
-- Table structure for table `shopSetting`
--

DROP TABLE IF EXISTS `shopSetting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shopSetting` (
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
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shopSetting`
--

LOCK TABLES `shopSetting` WRITE;
/*!40000 ALTER TABLE `shopSetting` DISABLE KEYS */;
INSERT INTO `shopSetting` VALUES (4,1,1,NULL,1,NULL,1,'spny',NULL,'dd','beijing','beiji','2399299311','chen','92991910211','&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;asdffdee',NULL),(5,3,1,NULL,2,NULL,10000,'japan',NULL,'123','123','123','123','123','123','北京','asdfasdfddd'),(6,5,1,NULL,3,NULL,10001,'1668275786',NULL,'','','','','','','<p>	Fashion Jewelry Store</p><p>	<br /></p><p>	<br /></p>',NULL),(7,5,1,NULL,1,NULL,10002,'Sellertest1',NULL,'13223','1233','1233','1123','1233','123344','GGGGG',NULL);
/*!40000 ALTER TABLE `shopSetting` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=59 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `translationTask`
--

LOCK TABLES `translationTask` WRITE;
/*!40000 ALTER TABLE `translationTask` DISABLE KEYS */;
INSERT INTO `translationTask` VALUES (16,1000029,1,1,'product',1,'2013-10-01',1),(17,1000030,10000,1,'product',1,'2013-10-01',1),(18,6,1,1,'brand',1,'2013-10-03',1),(19,7,1,1,'brand',1,'2013-10-03',1),(20,1000031,1,1,'product',1,'2013-10-04',1),(21,1000032,10001,1,'product',1,'2013-10-04',1),(22,1000034,10001,1,'product',1,'2013-10-04',1),(23,1000035,10001,1,'product',1,'2013-10-04',1),(24,1000036,10001,1,'product',1,'2013-10-04',1),(25,1000039,10001,1,'product',1,'2013-10-04',1),(26,1000038,10001,1,'product',1,'2013-10-04',1),(27,1000037,10001,1,'product',1,'2013-10-04',1),(28,1000040,1,1,'product',1,'2013-10-05',1),(29,1000041,1,1,'product',1,'2013-10-05',1),(30,1000042,1,1,'product',1,'2013-10-05',1),(31,1000043,10001,1,'product',1,'2013-10-05',1),(32,1000044,10001,1,'product',1,'2013-10-05',1),(34,1000045,10001,1,'product',1,'2013-10-19',1),(35,1000046,10001,1,'product',1,'2013-10-19',1),(36,1000047,10002,1,'product',1,'2013-10-21',1),(37,1000048,10001,1,'product',1,'2013-10-21',1),(38,1000049,1,1,'product',1,'2013-10-21',1),(39,1000050,10001,1,'product',1,'2013-10-22',1),(40,1000051,1,1,'product',1,'2013-10-23',2),(41,10,1,1,'brand',1,'2013-10-24',2),(42,1000054,10000,1,'product',1,'2013-10-30',1),(43,1000055,10000,1,'product',1,'2013-10-30',1),(44,1000061,10000,1,'product',1,'2013-11-05',1),(45,1000060,10000,1,'product',1,'2013-11-05',1),(46,1000062,1,1,'product',1,'2013-11-18',1),(47,1000063,10000,1,'product',1,'2013-11-18',1),(48,1000064,10000,1,'product',1,'2013-11-18',1),(49,1000065,10000,1,'product',1,'2013-11-18',1),(50,1000071,1,1,'product',1,'2013-11-26',2),(51,1000070,1,1,'product',1,'2013-11-26',1),(52,1000069,1,1,'product',1,'2013-11-26',1),(53,1000070,1,1,'product',1,'2013-11-26',1),(54,1000070,1,1,'product',1,'2013-11-26',1),(55,1000072,1,1,'product',1,'2013-11-27',1),(56,1000073,10000,1,'product',1,'2013-12-05',1),(57,1000074,10000,1,'product',1,'2013-12-27',1),(58,1000068,10000,1,'product',1,'2013-12-27',2);
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

-- Dump completed on 2013-12-28  1:32:29
