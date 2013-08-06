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
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orderItem`
--

LOCK TABLES `orderItem` WRITE;
/*!40000 ALTER TABLE `orderItem` DISABLE KEYS */;
INSERT INTO `orderItem` VALUES (1,1001,7,0,'柯达数码相机',0,0,1,0,1),(2,1001,7,0,'柯达数码相机',0,0,1,0,2),(3,1001,7,0,'柯达数码相机',0,0,1,0,3),(4,1001,7,0,'柯达数码相机',0,0,1,2100,4),(5,1001,7,0,'柯达数码相机',0,0,1,2100,5),(6,1001,7,0,'柯达数码相机',1,1,1,13650,6),(7,1001,7,0,'柯达数码相机',1,1,1,13650,7),(32,1004,10,20025,'中国移动100元充值卡',0,1,1,99,32),(33,1004,10,20025,'中国移动100元充值卡',0,1,1,99,33),(34,1004,10,20025,'中国移动100元充值卡',0,1,1,99,34),(35,1004,10,20025,'中国移动100元充值卡',0,1,1,99,35),(36,1004,10,20025,'中国移动100元充值卡',0,1,1,99,36),(37,1004,10,20025,'中国移动100元充值卡',0,1,1,99,37),(38,1004,10,20025,'中国移动100元充值卡',0,1,1,99,38),(39,1004,10,20025,'中国移动100元充值卡',0,1,1,99,39),(40,1004,10,20025,'中国移动100元充值卡',0,1,1,99,40),(41,1004,10,20025,'中国移动100元充值卡',0,1,1,99,41),(42,1004,10,20025,'中国移动100元充值卡',0,1,1,99,42),(43,1004,10,20025,'中国移动100元充值卡',0,1,1,99,43);
/*!40000 ALTER TABLE `orderItem` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2013-08-06 23:06:52
