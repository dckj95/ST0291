CREATE DATABASE  IF NOT EXISTS `spairlines` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `spairlines`;
-- MySQL dump 10.13  Distrib 5.6.13, for Win32 (x86)
--
-- Host: localhost    Database: spairlines
-- ------------------------------------------------------
-- Server version	5.6.17

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
-- Table structure for table `aircraft`
--

DROP TABLE IF EXISTS `aircraft`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aircraft` (
  `aircraftID` int(11) NOT NULL AUTO_INCREMENT,
  `model` varchar(45) NOT NULL,
  `flightNum` varchar(45) NOT NULL,
  `economyCap` int(11) NOT NULL,
  `businessCap` int(11) NOT NULL,
  `firstCap` int(11) NOT NULL,
  `totalCap` int(11) NOT NULL,
  `economyImage` varchar(100) NOT NULL,
  `businessImage` varchar(100) NOT NULL,
  `firstImage` varchar(100) NOT NULL,
  PRIMARY KEY (`aircraftID`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aircraft`
--

LOCK TABLES `aircraft` WRITE;
/*!40000 ALTER TABLE `aircraft` DISABLE KEYS */;
INSERT INTO `aircraft` VALUES (1,'Airbus A330-300','SP 20',255,30,0,285,'a330-economy.jpg','a330-business.jpg',''),(2,'Airbus A380-800','SP 21',311,86,12,409,'a380-economy.jpg','a380-business.jpg','a380-first.jpg'),(3,'Airbus A380-800','SP 30',311,86,12,409,'a380-economy.jpg','a380-business.jpg','a380-first.jpg'),(4,'Boeing 777-200','SP 40',234,42,12,288,'777-200-economy.jpg','777-200-business.jpg','777-200-first.jpg'),(5,'Boeing 777-200','SP 50',234,42,12,288,'777-200-economy.jpg','777-200-business.jpg','777-200-first.jpg'),(6,'Boeing 777-300','SP 60',226,50,8,284,'777-300-economy.jpg','777-300-business.jpg','777-300-first.jpg');
/*!40000 ALTER TABLE `aircraft` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `booking`
--

DROP TABLE IF EXISTS `booking`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `booking` (
  `bookingID` int(11) NOT NULL AUTO_INCREMENT,
  `fsID` int(11) NOT NULL,
  `paymentID` int(11) NOT NULL,
  `passengerID` int(11) NOT NULL,
  `economy` int(11) NOT NULL,
  `business` int(11) NOT NULL,
  `first` int(11) NOT NULL,
  `child` int(11) NOT NULL,
  PRIMARY KEY (`bookingID`),
  KEY `fsID_idx` (`fsID`),
  KEY `paymentID_idx` (`paymentID`),
  KEY `passengerID_idx` (`passengerID`),
  CONSTRAINT `fsID` FOREIGN KEY (`fsID`) REFERENCES `flightschedule` (`fsID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `passengerID` FOREIGN KEY (`passengerID`) REFERENCES `passenger` (`passengerID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `paymentID` FOREIGN KEY (`paymentID`) REFERENCES `payment` (`paymentID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `booking`
--

LOCK TABLES `booking` WRITE;
/*!40000 ALTER TABLE `booking` DISABLE KEYS */;
INSERT INTO `booking` VALUES (1,1,1,1,1,0,0,0);
/*!40000 ALTER TABLE `booking` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `flightschedule`
--

DROP TABLE IF EXISTS `flightschedule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `flightschedule` (
  `fsID` int(11) NOT NULL AUTO_INCREMENT,
  `aircraftID` int(11) NOT NULL,
  `depart` varchar(100) NOT NULL,
  `departCode` varchar(10) NOT NULL,
  `departCity` varchar(100) NOT NULL,
  `departCountry` varchar(100) NOT NULL,
  `departDate` date NOT NULL,
  `departTime` varchar(15) NOT NULL,
  `arrive` varchar(100) NOT NULL,
  `arriveCode` varchar(10) NOT NULL,
  `arriveCity` varchar(100) NOT NULL,
  `arriveCountry` varchar(100) NOT NULL,
  `arriveDate` date NOT NULL,
  `arriveTime` varchar(15) NOT NULL,
  `economyCost` decimal(7,2) NOT NULL,
  `businessCost` decimal(7,2) NOT NULL,
  `firstCost` decimal(7,2) NOT NULL,
  `flightTime` varchar(20) NOT NULL,
  PRIMARY KEY (`fsID`),
  KEY `aircraftID_idx` (`aircraftID`),
  CONSTRAINT `aircraftID` FOREIGN KEY (`aircraftID`) REFERENCES `aircraft` (`aircraftID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=67 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `flightschedule`
--

LOCK TABLES `flightschedule` WRITE;
/*!40000 ALTER TABLE `flightschedule` DISABLE KEYS */;
INSERT INTO `flightschedule` VALUES (1,1,'Changi International Airport','SIN','Singapore','Singapore','2014-06-16','0835 GMT+8','Kuala Lumpur International Airport','KUL','Kuala Lumpur','Malaysia','2014-06-16','0930 GMT+8',222.00,372.00,0.00,'55 minutes'),(2,1,'Kuala Lumpur International Airport','KUL','Kuala Lumpur','Malaysia','2014-06-16','1025 GMT+8','Changi International Airport','SIN','Singapore','Singapore','2014-06-16','1120 GMT+8',55.00,377.10,0.00,'55 minutes'),(3,1,'Changi International Airport','SIN','Singapore','Singapore','2014-06-16','1700 GMT+8','Kuala Lumpur International Airport','KUL','Kuala Lumpur','Malaysia','2014-06-16','1755 GMT+8',222.00,372.00,0.00,'55 minutes'),(4,1,'Kuala Lumpur International Airport','KUL','Kuala Lumpur','Malaysia','2014-06-16','1850 GMT+8','Changi International Airport','SIN','Singapore','Singapore','2014-06-16','1945 GMT+8',55.00,377.10,0.00,'55 minutes'),(5,2,'Changi International Airport','SIN','Singapore','Singapore','2014-06-16','0735 GMT+8','Hong Kong Airport','HKG','Hong Kong','Hong Kong','2014-06-16','1120 GMT+8',630.00,1860.00,2700.00,'3 hours 45 minutes'),(6,2,'Hong Kong Airport','HKG','Hong Kong','Hong Kong','2014-06-16','1230 GMT+8','Changi International Airport','SIN','Singapore','Singapore','2014-06-16','1615 GMT+8',332.10,2015.50,2738.90,'3 hours 45 minutes'),(7,2,'Changi International Airport','SIN','Singapore','Singapore','2014-06-16','1700 GMT+8','Hong Kong Airport','HKG','Hong Kong','Hong Kong','2014-06-16','2045 GMT+8',630.00,1860.00,2700.00,'3 hours 45 minutes'),(8,2,'Hong Kong Airport','HKG','Hong Kong','Hong Kong','2014-06-16','2135 GMT+8','Changi International Airport','SIN','Singapore','Singapore','2014-06-17','0120 GMT+8',332.10,2015.50,2738.90,'3 hours 45 minutes'),(9,3,'Changi International Airport','SIN','Singapore','Singapore','2014-06-16','0700 GMT+8','Narita Airport','NRT','Tokyo','Japan','2014-06-16','1505 GMT+9',990.00,3060.00,4800.00,'7 hours 5 minutes'),(10,3,'Narita Airport','NRT','Tokyo','Japan','2014-06-16','1635 GMT+9','Changi International Airport','SIN','Singapore','Singapore','2014-06-16','2240 GMT+8',615.50,2753.70,4373.50,'7 hours 5 minutes'),(11,4,'Changi International Airport','SIN','Singapore','Singapore','2014-06-16','0600 GMT+8','Kingsford Smith Airport','SYD','Sydney','Australia','2014-06-16','1540 GMT+10',870.00,3420.00,4800.00,'7 hours 40 minutes'),(12,4,'Kingsford Smith Airport','SYD','Sydney','Australia','2014-06-16','1630 GMT+10','Changi International Airport','SIN','Singapore','Singapore','2014-06-16','2210 GMT+8',278.00,3366.80,4028.00,'7 hours 40 minutes'),(13,1,'Changi International Airport','SIN','Singapore','Singapore','2014-06-17','0835 GMT+8','Kuala Lumpur International Airport','KUL','Kuala Lumpur','Malaysia','2014-06-17','0930 GMT+8',222.00,372.00,0.00,'55 minutes'),(14,1,'Kuala Lumpur International Airport','KUL','Kuala Lumpur','Malaysia','2014-06-17','1025 GMT+8','Changi International Airport','SIN','Singapore','Singapore','2014-06-17','1120 GMT+8',55.00,377.10,0.00,'55 minutes'),(15,1,'Changi International Airport','SIN','Singapore','Singapore','2014-06-17','1700 GMT+8','Kuala Lumpur International Airport','KUL','Kuala Lumpur','Malaysia','2014-06-17','1755 GMT+8',222.00,372.00,0.00,'55 minutes'),(16,1,'Kuala Lumpur International Airport','KUL','Kuala Lumpur','Malaysia','2014-06-17','1850 GMT+8','Changi International Airport','SIN','Singapore','Singapore','2014-06-17','1945 GMT+8',55.00,377.10,0.00,'55 minutes'),(17,2,'Changi International Airport','SIN','Singapore','Singapore','2014-06-17','0735 GMT+8','Hong Kong Airport','HKG','Hong Kong','Hong Kong','2014-06-17','1120 GMT+8',630.00,1860.00,2700.00,'3 hours 45 minutes'),(18,2,'Hong Kong Airport','HKG','Hong Kong','Hong Kong','2014-06-17','1230 GMT+8','Changi International Airport','SIN','Singapore','Singapore','2014-06-17','1615 GMT+8',332.10,2015.50,2738.90,'3 hours 45 minutes'),(19,2,'Changi International Airport','SIN','Singapore','Singapore','2014-06-17','1700 GMT+8','Hong Kong Airport','HKG','Hong Kong','Hong Kong','2014-06-17','2045 GMT+8',630.00,1860.00,2700.00,'3 hours 45 minutes'),(20,2,'Hong Kong Airport','HKG','Hong Kong','Hong Kong','2014-06-17','2135 GMT+8','Changi International Airport','SIN','Singapore','Singapore','2014-06-18','0120 GMT+8',332.10,2015.50,2738.90,'3 hours 45 minutes'),(21,3,'Changi International Airport','SIN','Singapore','Singapore','2014-06-17','0700 GMT+8','Narita Airport','NRT','Tokyo','Japan','2014-06-17','1505 GMT+9',990.00,3060.00,4800.00,'7 hours 5 minutes'),(22,3,'Narita Airport','NRT','Tokyo','Japan','2014-06-17','1635 GMT+9','Changi International Airport','SIN','Singapore','Singapore','2014-06-17','2240 GMT+8',615.50,2753.70,4373.50,'7 hours 5 minutes'),(23,4,'Changi International Airport','SIN','Singapore','Singapore','2014-06-17','0600 GMT+8','Kingsford Smith Airport','SYD','Sydney','Australia','2014-06-17','1540 GMT+10',870.00,3420.00,4800.00,'7 hours 40 minutes'),(24,4,'Kingsford Smith Airport','SYD','Sydney','Australia','2014-06-17','1630 GMT+10','Changi International Airport','SIN','Singapore','Singapore','2014-06-17','2210 GMT+8',278.00,3366.80,4028.00,'7 hours 40 minutes'),(25,1,'Changi International Airport','SIN','Singapore','Singapore','2014-06-18','0835 GMT+8','Kuala Lumpur International Airport','KUL','Kuala Lumpur','Malaysia','2014-06-18','0930 GMT+8',222.00,372.00,0.00,'55 minutes'),(26,1,'Kuala Lumpur International Airport','KUL','Kuala Lumpur','Malaysia','2014-06-18','1025 GMT+8','Changi International Airport','SIN','Singapore','Singapore','2014-06-18','1120 GMT+8',55.00,377.10,0.00,'55 minutes'),(27,1,'Changi International Airport','SIN','Singapore','Singapore','2014-06-18','1700 GMT+8','Kuala Lumpur International Airport','KUL','Kuala Lumpur','Malaysia','2014-06-18','1755 GMT+8',222.00,372.00,0.00,'55 minutes'),(28,1,'Kuala Lumpur International Airport','KUL','Kuala Lumpur','Malaysia','2014-06-18','1850 GMT+8','Changi International Airport','SIN','Singapore','Singapore','2014-06-18','1945 GMT+8',55.00,377.10,0.00,'55 minutes'),(29,2,'Changi International Airport','SIN','Singapore','Singapore','2014-06-18','0735 GMT+8','Hong Kong Airport','HKG','Hong Kong','Hong Kong','2014-06-18','1120 GMT+8',630.00,1860.00,2700.00,'3 hours 45 minutes'),(30,2,'Hong Kong Airport','HKG','Hong Kong','Hong Kong','2014-06-18','1230 GMT+8','Changi International Airport','SIN','Singapore','Singapore','2014-06-18','1615 GMT+8',332.10,2015.50,2738.90,'3 hours 45 minutes'),(31,2,'Changi International Airport','SIN','Singapore','Singapore','2014-06-18','1700 GMT+8','Hong Kong Airport','HKG','Hong Kong','Hong Kong','2014-06-18','2045 GMT+8',630.00,1860.00,2700.00,'3 hours 45 minutes'),(32,2,'Hong Kong Airport','HKG','Hong Kong','Hong Kong','2014-06-18','2135 GMT+8','Changi International Airport','SIN','Singapore','Singapore','2014-06-19','0120 GMT+8',332.10,2015.50,2738.90,'3 hours 45 minutes'),(33,3,'Changi International Airport','SIN','Singapore','Singapore','2014-06-18','0700 GMT+8','Narita Airport','NRT','Tokyo','Japan','2014-06-18','1505 GMT+9',990.00,3060.00,4800.00,'7 hours 5 minutes'),(34,3,'Narita Airport','NRT','Tokyo','Japan','2014-06-18','1635 GMT+9','Changi International Airport','SIN','Singapore','Singapore','2014-06-18','2240 GMT+8',615.50,2753.70,4373.50,'7 hours 5 minutes'),(35,4,'Changi International Airport','SIN','Singapore','Singapore','2014-06-18','0600 GMT+8','Kingsford Smith Airport','SYD','Sydney','Australia','2014-06-18','1540 GMT+10',870.00,3420.00,4800.00,'7 hours 40 minutes'),(36,4,'Kingsford Smith Airport','SYD','Sydney','Australia','2014-06-18','1630 GMT+10','Changi International Airport','SIN','Singapore','Singapore','2014-06-18','2210 GMT+8',278.00,3366.80,4028.00,'7 hours 40 minutes'),(37,1,'Changi International Airport','SIN','Singapore','Singapore','2014-06-19','0835 GMT+8','Kuala Lumpur International Airport','KUL','Kuala Lumpur','Malaysia','2014-06-19','0930 GMT+8',222.00,372.00,0.00,'55 minutes'),(38,1,'Kuala Lumpur International Airport','KUL','Kuala Lumpur','Malaysia','2014-06-19','1025 GMT+8','Changi International Airport','SIN','Singapore','Singapore','2014-06-19','1120 GMT+8',55.00,377.10,0.00,'55 minutes'),(39,1,'Changi International Airport','SIN','Singapore','Singapore','2014-06-19','1700 GMT+8','Kuala Lumpur International Airport','KUL','Kuala Lumpur','Malaysia','2014-06-19','1755 GMT+8',222.00,372.00,0.00,'55 minutes'),(40,1,'Kuala Lumpur International Airport','KUL','Kuala Lumpur','Malaysia','2014-06-19','1850 GMT+8','Changi International Airport','SIN','Singapore','Singapore','2014-06-19','1945 GMT+8',55.00,377.10,0.00,'55 minutes'),(41,2,'Changi International Airport','SIN','Singapore','Singapore','2014-06-19','0735 GMT+8','Hong Kong Airport','HKG','Hong Kong','Hong Kong','2014-06-19','1120 GMT+8',630.00,1860.00,2700.00,'3 hours 45 minutes'),(42,2,'Hong Kong Airport','HKG','Hong Kong','Hong Kong','2014-06-19','1230 GMT+8','Changi International Airport','SIN','Singapore','Singapore','2014-06-19','1615 GMT+8',332.10,2015.50,2738.90,'3 hours 45 minutes'),(43,2,'Changi International Airport','SIN','Singapore','Singapore','2014-06-19','1700 GMT+8','Hong Kong Airport','HKG','Hong Kong','Hong Kong','2014-06-19','2045 GMT+8',630.00,1860.00,2700.00,'3 hours 45 minutes'),(44,2,'Hong Kong Airport','HKG','Hong Kong','Hong Kong','2014-06-19','2135 GMT+8','Changi International Airport','SIN','Singapore','Singapore','2014-06-20','0120 GMT+8',332.10,2015.50,2738.90,'3 hours 45 minutes'),(45,3,'Changi International Airport','SIN','Singapore','Singapore','2014-06-19','0700 GMT+8','Narita Airport','NRT','Tokyo','Japan','2014-06-19','1505 GMT+9',990.00,3060.00,4800.00,'7 hours 5 minutes'),(46,3,'Narita Airport','NRT','Tokyo','Japan','2014-06-19','1635 GMT+9','Changi International Airport','SIN','Singapore','Singapore','2014-06-19','2240 GMT+8',615.50,2753.70,4373.50,'7 hours 5 minutes'),(47,4,'Changi International Airport','SIN','Singapore','Singapore','2014-06-19','0600 GMT+8','Kingsford Smith Airport','SYD','Sydney','Australia','2014-06-19','1540 GMT+10',870.00,3420.00,4800.00,'7 hours 40 minutes'),(48,4,'Kingsford Smith Airport','SYD','Sydney','Australia','2014-06-19','1630 GMT+10','Changi International Airport','SIN','Singapore','Singapore','2014-06-19','2210 GMT+8',278.00,3366.80,4028.00,'7 hours 40 minutes'),(49,1,'Changi International Airport','SIN','Singapore','Singapore','2014-06-20','0835 GMT+8','Kuala Lumpur International Airport','KUL','Kuala Lumpur','Malaysia','2014-06-20','0930 GMT+8',222.00,372.00,0.00,'55 minutes'),(50,1,'Kuala Lumpur International Airport','KUL','Kuala Lumpur','Malaysia','2014-06-20','1025 GMT+8','Changi International Airport','SIN','Singapore','Singapore','2014-06-20','1120 GMT+8',55.00,377.10,0.00,'55 minutes'),(51,1,'Changi International Airport','SIN','Singapore','Singapore','2014-06-20','1700 GMT+8','Kuala Lumpur International Airport','KUL','Kuala Lumpur','Malaysia','2014-06-20','1755 GMT+8',222.00,372.00,0.00,'55 minutes'),(52,1,'Kuala Lumpur International Airport','KUL','Kuala Lumpur','Malaysia','2014-06-20','1850 GMT+8','Changi International Airport','SIN','Singapore','Singapore','2014-06-20','1945 GMT+8',55.00,377.10,0.00,'55 minutes'),(53,2,'Changi International Airport','SIN','Singapore','Singapore','2014-06-20','0735 GMT+8','Hong Kong Airport','HKG','Hong Kong','Hong Kong','2014-06-20','1120 GMT+8',630.00,1860.00,2700.00,'3 hours 45 minutes'),(54,2,'Hong Kong Airport','HKG','Hong Kong','Hong Kong','2014-06-20','1230 GMT+8','Changi International Airport','SIN','Singapore','Singapore','2014-06-20','1615 GMT+8',332.10,2015.50,2738.90,'3 hours 45 minutes'),(55,2,'Changi International Airport','SIN','Singapore','Singapore','2014-06-20','1700 GMT+8','Hong Kong Airport','HKG','Hong Kong','Hong Kong','2014-06-20','2045 GMT+8',630.00,1860.00,2700.00,'3 hours 45 minutes'),(56,2,'Hong Kong Airport','HKG','Hong Kong','Hong Kong','2014-06-20','2135 GMT+8','Changi International Airport','SIN','Singapore','Singapore','2014-06-21','0120 GMT+8',332.10,2015.50,2738.90,'3 hours 45 minutes'),(57,3,'Changi International Airport','SIN','Singapore','Singapore','2014-06-20','0700 GMT+8','Narita Airport','NRT','Tokyo','Japan','2014-06-20','1505 GMT+9',990.00,3060.00,4800.00,'7 hours 5 minutes'),(58,3,'Narita Airport','NRT','Tokyo','Japan','2014-06-20','1635 GMT+9','Changi International Airport','SIN','Singapore','Singapore','2014-06-20','2240 GMT+8',615.50,2753.70,4373.50,'7 hours 5 minutes'),(59,4,'Changi International Airport','SIN','Singapore','Singapore','2014-06-20','0600 GMT+8','Kingsford Smith Airport','SYD','Sydney','Australia','2014-06-20','1540 GMT+10',870.00,3420.00,4800.00,'7 hours 40 minutes'),(60,4,'Kingsford Smith Airport','SYD','Sydney','Australia','2014-06-20','1630 GMT+10','Changi International Airport','SIN','Singapore','Singapore','2014-06-20','2210 GMT+8',278.00,3366.80,4028.00,'7 hours 40 minutes'),(61,5,'Hong Kong Airport','HKG','Hong Kong','Hong Kong','2014-06-16','1300 GMT+8','San Francisco International Airport','SFO','San Francisco','USA','2014-06-16','1050 GMT-7',831.90,5126.00,10981.90,'12 hours 50 minutes'),(62,5,'San Francisco International Airport','SFO','San Francisco','USA','2014-06-16','1300 GMT-7','Hong Kong Airport','HKG','Hong Kong','Hong Kong','2014-06-17','1650 GMT+8',1517.20,7331.90,9914.50,'12 hours 50 minutes'),(63,5,'Hong Kong Airport','HKG','Hong Kong','Hong Kong','2014-06-18','1300 GMT+8','San Francisco International Airport','SFO','San Francisco','USA','2014-06-18','1050 GMT-7',831.90,5126.00,10981.90,'12 hours 50 minutes'),(64,5,'San Francisco International Airport','SFO','San Francisco','USA','2014-06-18','1300 GMT-7','Hong Kong Airport','HKG','Hong Kong','Hong Kong','2014-06-19','1650 GMT+8',1517.20,7331.90,9914.50,'12 hours 50 minutes'),(65,6,'Narita Airport','NRT','Tokyo','Japan','2014-06-17','1700 GMT+9','Charles De Gaulle Airport','CDG','Paris','France','2014-06-17','2330 GMT+2',912.90,6031.70,10963.50,'13 hours 30 minutes'),(66,6,'Charles De Gaulle Airport','CDG','Paris','France','2014-06-18','0100 GMT+2','Narita Airport','NRT','Tokyo','Japan','2014-06-18','2130 GMT+9',945.00,4445.60,9217.30,'13 hours 30 minutes');
/*!40000 ALTER TABLE `flightschedule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `login`
--

DROP TABLE IF EXISTS `login`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `login` (
  `username` varchar(45) NOT NULL,
  `password` varchar(200) NOT NULL,
  `firstName` varchar(50) NOT NULL,
  `lastName` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `points` int(11) NOT NULL,
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `login`
--

LOCK TABLES `login` WRITE;
/*!40000 ALTER TABLE `login` DISABLE KEYS */;
INSERT INTO `login` VALUES ('admin','4194d1706ed1f408d5e02d672777019f4d5385c766a8c6ca8acba3167d36a7b9','Administrator','A','admin@spairlines.com',0),('john','14381435c28d2527456d17a8bc88f38422dbe0ec23835043ddf16b3996842811','John','Tan','john@gmail.com',240);
/*!40000 ALTER TABLE `login` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `passenger`
--

DROP TABLE IF EXISTS `passenger`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `passenger` (
  `passengerID` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(10) NOT NULL,
  `firstName` varchar(100) NOT NULL,
  `lastName` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `phone` varchar(50) NOT NULL,
  PRIMARY KEY (`passengerID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `passenger`
--

LOCK TABLES `passenger` WRITE;
/*!40000 ALTER TABLE `passenger` DISABLE KEYS */;
INSERT INTO `passenger` VALUES (1,'Mr','John','Tan','john@gmail.com','99993333');
/*!40000 ALTER TABLE `passenger` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment`
--

DROP TABLE IF EXISTS `payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `payment` (
  `paymentID` int(11) NOT NULL AUTO_INCREMENT,
  `cardType` varchar(50) NOT NULL,
  `cardNo` varchar(20) NOT NULL,
  `cardExpiry` varchar(10) NOT NULL,
  `CSC` varchar(10) NOT NULL,
  PRIMARY KEY (`paymentID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment`
--

LOCK TABLES `payment` WRITE;
/*!40000 ALTER TABLE `payment` DISABLE KEYS */;
INSERT INTO `payment` VALUES (1,'Mastercard','5968283948290902`','11/2025','745');
/*!40000 ALTER TABLE `payment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'spairlines'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2014-08-19 12:18:48
