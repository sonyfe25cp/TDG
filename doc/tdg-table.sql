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
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

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
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

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
) ENGINE=InnoDB AUTO_INCREMENT=1000022 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

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
  `internationalShippingService` int(11) DEFAULT NULL,
  `internationalShippingFee` double DEFAULT NULL,
  `internationalPromiseDays` int(11) DEFAULT NULL,
  `countryCode` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

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
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1000030 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

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
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

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
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

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
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2013-10-01 15:46:01
