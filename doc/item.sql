-- MySQL dump 10.13  Distrib 5.5.32, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: tdg
-- ------------------------------------------------------
-- Server version	5.5.32-0ubuntu0.12.04.1

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
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item`
--

LOCK TABLES `item` WRITE;
/*!40000 ALTER TABLE `item` DISABLE KEYS */;
INSERT INTO `item` VALUES (7,1001,'柯达数码相机',NULL,'1627207:3232483;1630707:3266779;',NULL,99,98,'2013-08-06',97,100,200,5000,300,18,1,1402,1),(8,1002,'柯达数码相机',NULL,'1627207:3232484;1630707:3266781;',NULL,99,98,'2013-08-06',97,100,200,5000,300,18,1,1402,1),(9,1003,'柯达数码相机',NULL,'1627207:3232481;1630707:3266785;',NULL,99,98,'2013-08-06',97,100,200,5000,300,18,1,1402,1),(10,1004,'中国移动100元充值卡','中国移动100元充值卡',NULL,NULL,99,98,'2013-08-06',97,100,200,NULL,NULL,20025,0,0,1);
/*!40000 ALTER TABLE `item` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2013-08-06 23:05:42
