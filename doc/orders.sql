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
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,0,0,0,NULL,NULL,'apple tv','海淀区政府','北京','中国','100081',1,0,NULL,0,'0',0),(2,0,0,0,NULL,NULL,'陈杰','北京理工大学计算中心406','北京','中国','100081',1,0,NULL,0,'0',0),(3,0,0,0,NULL,NULL,'陈杰','北京理工大学计算中心','北京','中国','100081',1,0,NULL,0,'0',0),(4,0,0,2100,NULL,NULL,'晓晓','世华泊郡','北京','中国','100081',1,0,NULL,0,'0',0),(5,0,0,2100,NULL,NULL,'陈杰','北京理工大学计算中心','北京','中国','100081',8,0,NULL,0,'0',1),(6,0,0,13650,NULL,NULL,'陈杰','北京理工大学计算中心','北京','中国','100081',8,123,'1',0,'0',1),(7,0,0,13650,NULL,NULL,'陈杰','北京理工大学计算中心','北京','中国','100081',8,123,'1',0,'0',1),(32,0,0,99,'2013-08-06',NULL,'shiyulong','bit','beijing','china','100081',1,123,'1',0,NULL,8),(33,0,0,99,'2013-08-06',NULL,'shiyulong','bit','beijing','china','100081',1,123,'1',0,NULL,8),(34,0,0,99,'2013-08-06',NULL,'shiyulong','bit','beijing','china','100081',1,123,'1',0,NULL,8),(35,0,0,99,'2013-08-06',NULL,'shiyulong','bit','beijing','china','100081',1,123,'1',0,NULL,8),(36,0,0,99,'2013-08-06',NULL,'shiyulong','bit','beijing','china','100081',1,123,'1',0,NULL,8),(37,0,0,99,'2013-08-06',NULL,'shiyulong','bit','beijing','china','100081',1,123,'1',0,NULL,8),(38,0,0,99,'2013-08-06',NULL,'shiyulong','bit','beijing','china','100081',1,123,'1',0,NULL,8),(39,0,0,99,'2013-08-06',NULL,'shiyulong','bit','beijing','china','100081',1,123,'1',0,NULL,8),(40,0,0,99,'2013-08-06',NULL,'shiyulong','bit','beijing','china','100081',1,123,'1',0,NULL,8),(41,0,0,99,'2013-08-06',NULL,'shiyulong','bit','beijing','china','100081',1,123,'1',0,NULL,8),(42,0,0,99,'2013-08-06',NULL,'shiyulong','bit','beijing','china','100081',1,123,'1',0,NULL,8),(43,0,0,99,'2013-08-06',NULL,'shiyulong','bit','beijing','china','100081',1,123,'1',0,NULL,8);
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2013-08-06 23:06:01
