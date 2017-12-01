-- MySQL dump 10.13  Distrib 5.7.20, for Linux (x86_64)
--
-- Host: localhost    Database: LibraryManagementSystem
-- ------------------------------------------------------
-- Server version	5.7.20-0ubuntu0.16.04.1

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
-- Table structure for table `bookdetails`
--

DROP TABLE IF EXISTS `bookdetails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bookdetails` (
  `bookId` int(11) NOT NULL AUTO_INCREMENT,
  `Author` varchar(120) NOT NULL,
  `Title` varchar(120) NOT NULL,
  `Pulication` varchar(120) NOT NULL,
  `Edition` varchar(120) NOT NULL,
  `Copies` int(11) NOT NULL,
  `Date_pur` varchar(120) NOT NULL,
  `price` decimal(18,2) NOT NULL,
  `Status` varchar(120) NOT NULL,
  PRIMARY KEY (`bookId`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bookdetails`
--

LOCK TABLES `bookdetails` WRITE;
/*!40000 ALTER TABLE `bookdetails` DISABLE KEYS */;
INSERT INTO `bookdetails` VALUES (1,'Reema Thareja','Data Structure Using C','Oxford','Second',10,'2015/jan/10',435.00,'Available'),(2,'G.V. Kumbhojkar','Applied Mathematics','Jamnadas and co.','Fourth',50,'2014/jun/15',475.00,'Available'),(3,'Puntambekar','SOOAD','Technical','Second',15,'2015/jan/10',300.00,'Available'),(4,'Harish G. Narula','Microprocessor','Tech-Max','Third',15,'2014/jun/15',470.00,'Available'),(5,'Andrew Tanenbum & herbert bos','Operating System','Pearson','Fourth',20,'2016/jun/15',575.00,'Available'),(6,'Sanjesh S. Pawale','Computer Graphics','Tech-Max','First',10,'2014/april/03',450.00,'Available'),(7,'Galvin','Operating System Concept','Wiley','Ninth',10,'2015/jan/10',560.00,'Available'),(10,'David & Andrew','Computer Networks','Wiley','Fifth',15,'2015/01/01',579.00,'Available'),(11,'Ravish Singh','BEEE','Oxford','Fifth',15,'2015-05-13',500.00,'Available'),(12,'NP Dubey','Enginnering Drawing','Wiley','Tenth',20,'2014-08-17',559.00,'Available');
/*!40000 ALTER TABLE `bookdetails` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `issue`
--

DROP TABLE IF EXISTS `issue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `issue` (
  `Regno` int(11) NOT NULL,
  `Date_of_issue` datetime NOT NULL,
  `date_of_return` datetime NOT NULL,
  `bookId` int(11) NOT NULL,
  `Name` varchar(120) NOT NULL,
  `Course` varchar(120) NOT NULL,
  `Author` varchar(120) NOT NULL,
  `Edition` varchar(120) NOT NULL,
  KEY `Regno` (`Regno`),
  CONSTRAINT `issue_ibfk_1` FOREIGN KEY (`Regno`) REFERENCES `student` (`Regno`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `issue`
--

LOCK TABLES `issue` WRITE;
/*!40000 ALTER TABLE `issue` DISABLE KEYS */;
INSERT INTO `issue` VALUES (11025,'2015-10-01 02:00:55','2015-10-15 12:50:55',4,'Sagar Ringe','Computer Engineering','Harish G. Narula','Third'),(11765,'2015-10-01 02:00:55','2015-10-10 02:31:55',3,'Ashish Bokil','Computer Engineering','Puntambekar','Second'),(11834,'2015-10-01 01:30:55','2015-10-15 02:30:55',2,'Harsh Dedhia','Computer Engineering','G.V. Kumbhojkar','Fourth'),(11024,'2015-10-01 02:00:55','2015-10-10 12:30:55',6,'Nir','Computer Engineering','Sanjesh S. Pawale','First'),(10234,'2014-12-08 10:10:10','2014-12-18 10:10:10',1,'ami','Course','Reema Thareja','Second');
/*!40000 ALTER TABLE `issue` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `returnBook`
--

DROP TABLE IF EXISTS `returnBook`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `returnBook` (
  `Regno` int(11) NOT NULL,
  `Date_of_issue` datetime NOT NULL,
  `date_of_return` datetime NOT NULL,
  `bookId` int(11) NOT NULL,
  `Name` varchar(120) NOT NULL,
  `Course` varchar(120) NOT NULL,
  `Author` varchar(120) NOT NULL,
  `Edition` varchar(120) NOT NULL,
  KEY `Regno` (`Regno`),
  CONSTRAINT `returnBook_ibfk_1` FOREIGN KEY (`Regno`) REFERENCES `student` (`Regno`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `returnBook`
--

LOCK TABLES `returnBook` WRITE;
/*!40000 ALTER TABLE `returnBook` DISABLE KEYS */;
INSERT INTO `returnBook` VALUES (11824,'2015-10-01 02:00:55','2015-10-10 12:30:55',1,'Amit Dube','Computer Engineering','Reema Thareja','Second'),(11025,'2015-10-01 02:00:55','2015-10-15 12:50:55',4,'Sagar Ringe','Computer Engineering','Harish G. Narula','Third'),(11765,'2015-10-01 02:00:55','2015-10-10 02:31:55',3,'Ashish Bokil','Computer Engineering','Puntambekar','Second'),(11834,'2015-10-01 01:30:55','2015-10-15 02:30:55',2,'Harsh Dedhia','Computer Engineering','G.V. Kumbhojkar','Fourth');
/*!40000 ALTER TABLE `returnBook` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student`
--

DROP TABLE IF EXISTS `student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `student` (
  `Name` varchar(120) NOT NULL,
  `Regno` int(11) NOT NULL,
  `Date_of_issue` datetime NOT NULL,
  `Address` varchar(120) NOT NULL,
  `date_of_return` datetime NOT NULL,
  `Course` varchar(120) NOT NULL,
  `bookId` int(11) NOT NULL,
  `Gender` varchar(120) NOT NULL,
  PRIMARY KEY (`Regno`),
  KEY `bookId` (`bookId`),
  CONSTRAINT `student_ibfk_1` FOREIGN KEY (`bookId`) REFERENCES `bookdetails` (`bookId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student`
--

LOCK TABLES `student` WRITE;
/*!40000 ALTER TABLE `student` DISABLE KEYS */;
INSERT INTO `student` VALUES ('ami',10234,'2014-12-06 10:10:10','Address','2014-12-18 10:10:10','Course',1,'Male'),('Karan Wadhwa',11023,'2015-10-05 01:30:55','Nerul, Mumbai','2015-10-15 02:30:55','Computer Engineering',12,'Male'),('Nir',11024,'2015-10-01 02:00:55','CST, Mumbai','2015-10-10 12:30:55','Computer Engineering',6,'Male'),('Sagar Ringe',11025,'2015-10-01 02:00:55','Thane','2015-10-15 12:50:55','Computer Engineering',4,'Male'),('Ashish Bokil',11765,'2015-10-01 02:00:55','Nerul, Mumbai','2015-10-10 02:31:55','Computer Engineering',3,'Male'),('Amit Dube',11824,'2015-10-01 02:00:55','Ghatkopar, Mumbai','2015-10-10 12:30:55','Computer Engineering',1,'Male'),('Harsh Dedhia',11834,'2015-10-05 01:30:55','CST, Mumbai','2015-10-15 02:30:55','Computer Engineering',2,'Male');
/*!40000 ALTER TABLE `student` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(30) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(128) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'staff','staff@gmail.com','staff123');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-12-01 14:54:15
