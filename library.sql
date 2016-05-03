CREATE DATABASE  IF NOT EXISTS `librarysystem` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `librarysystem`;
-- MySQL dump 10.13  Distrib 5.7.9, for osx10.9 (x86_64)
--
-- Host: localhost    Database: librarysystem
-- ------------------------------------------------------
-- Server version	5.7.12

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
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin` (
  `id` varchar(20) NOT NULL,
  `pass` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin`
--

LOCK TABLES `admin` WRITE;
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
INSERT INTO `admin` VALUES ('admin','admin');
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `author`
--

DROP TABLE IF EXISTS `author`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `author` (
  `authorid` int(11) NOT NULL AUTO_INCREMENT,
  `aname` varchar(30) NOT NULL,
  PRIMARY KEY (`authorid`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `author`
--

LOCK TABLES `author` WRITE;
/*!40000 ALTER TABLE `author` DISABLE KEYS */;
INSERT INTO `author` VALUES (1,'John'),(2,'William'),(3,'Smith'),(4,'Peter'),(5,'Susan'),(6,'Van'),(7,'Carter'),(8,'Warner'),(9,'Mike'),(10,'Thomas'),(11,'Marcus');
/*!40000 ALTER TABLE `author` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `book`
--

DROP TABLE IF EXISTS `book`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `book` (
  `docid` int(11) NOT NULL,
  `isbn` varchar(30) NOT NULL,
  PRIMARY KEY (`docid`),
  CONSTRAINT `docidfk4` FOREIGN KEY (`docid`) REFERENCES `document` (`documentid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `book`
--

LOCK TABLES `book` WRITE;
/*!40000 ALTER TABLE `book` DISABLE KEYS */;
INSERT INTO `book` VALUES (3,'13673628379'),(4,'8376726'),(7,'2325'),(8,'5356'),(9,'534928'),(10,'9392'),(11,'7638274'),(12,'87326723'),(13,'237532'),(14,'37823'),(15,'5368'),(16,'32424');
/*!40000 ALTER TABLE `book` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bookwrittenby`
--

DROP TABLE IF EXISTS `bookwrittenby`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bookwrittenby` (
  `docid` int(11) NOT NULL,
  `authorid` int(11) NOT NULL,
  PRIMARY KEY (`docid`,`authorid`),
  KEY `authourfk` (`authorid`),
  CONSTRAINT `authourfk` FOREIGN KEY (`authorid`) REFERENCES `author` (`authorid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `bdocidfk` FOREIGN KEY (`docid`) REFERENCES `document` (`documentid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bookwrittenby`
--

LOCK TABLES `bookwrittenby` WRITE;
/*!40000 ALTER TABLE `bookwrittenby` DISABLE KEYS */;
/*!40000 ALTER TABLE `bookwrittenby` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `borrows`
--

DROP TABLE IF EXISTS `borrows`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `borrows` (
  `bornumber` int(11) NOT NULL AUTO_INCREMENT,
  `readerid` int(11) DEFAULT NULL,
  `docid` int(11) DEFAULT NULL,
  `copyno` int(11) DEFAULT NULL,
  `libid` int(11) DEFAULT NULL,
  `bdtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `rdtime` timestamp NULL DEFAULT '1994-05-04 04:00:00',
  PRIMARY KEY (`bornumber`),
  KEY `readeridfk2` (`readerid`),
  KEY `copyfk2` (`docid`,`copyno`,`libid`),
  CONSTRAINT `copyfk2` FOREIGN KEY (`docid`, `copyno`, `libid`) REFERENCES `copy` (`docid`, `copyno`, `libid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `readeridfk2` FOREIGN KEY (`readerid`) REFERENCES `reader` (`readerid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `borrows`
--

LOCK TABLES `borrows` WRITE;
/*!40000 ALTER TABLE `borrows` DISABLE KEYS */;
/*!40000 ALTER TABLE `borrows` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `branch`
--

DROP TABLE IF EXISTS `branch`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `branch` (
  `libid` int(11) NOT NULL AUTO_INCREMENT,
  `lname` varchar(30) NOT NULL,
  `location` varchar(100) NOT NULL,
  PRIMARY KEY (`libid`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `branch`
--

LOCK TABLES `branch` WRITE;
/*!40000 ALTER TABLE `branch` DISABLE KEYS */;
INSERT INTO `branch` VALUES (2,'lib2','paldi'),(3,'lib3','Jersey City');
/*!40000 ALTER TABLE `branch` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `chiefeditor`
--

DROP TABLE IF EXISTS `chiefeditor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `chiefeditor` (
  `editorid` int(11) NOT NULL AUTO_INCREMENT,
  `ename` varchar(20) NOT NULL,
  PRIMARY KEY (`editorid`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chiefeditor`
--

LOCK TABLES `chiefeditor` WRITE;
/*!40000 ALTER TABLE `chiefeditor` DISABLE KEYS */;
INSERT INTO `chiefeditor` VALUES (2,'jatin'),(3,'siddhrath'),(4,'bhargav'),(5,'sahil'),(6,'abhi'),(7,'dhruv'),(8,'devang'),(9,'harsh');
/*!40000 ALTER TABLE `chiefeditor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `copy`
--

DROP TABLE IF EXISTS `copy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `copy` (
  `docid` int(11) NOT NULL,
  `copyno` int(11) NOT NULL,
  `libid` int(11) NOT NULL,
  `position` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`docid`,`copyno`,`libid`),
  KEY `libidfk` (`libid`),
  CONSTRAINT `docidfk5` FOREIGN KEY (`docid`) REFERENCES `document` (`documentid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `libidfk` FOREIGN KEY (`libid`) REFERENCES `branch` (`libid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `copy`
--

LOCK TABLES `copy` WRITE;
/*!40000 ALTER TABLE `copy` DISABLE KEYS */;
INSERT INTO `copy` VALUES (3,7,2,'front'),(4,3,3,'lower deck'),(4,5,2,'lower deck'),(5,9,3,'upper deck'),(6,6,2,'basement'),(6,6,3,'basement'),(8,5,2,'1st floor'),(8,10,3,'lower deck'),(9,10,2,'back'),(10,6,3,'basement'),(10,10,2,'front'),(11,4,3,'lower deck'),(11,6,3,'2nd floor'),(12,5,3,'2nd floor'),(12,6,2,'3rd floor'),(13,2,3,'upper deck'),(14,5,3,'front'),(14,6,2,'basement'),(14,7,2,'upper deck'),(16,5,3,'basement'),(16,8,3,'upper deck'),(17,6,3,'basement'),(17,7,3,'lower deck'),(18,5,2,'lower deck'),(19,8,2,'basement'),(20,4,3,'2nd floor'),(21,8,2,'upper deck');
/*!40000 ALTER TABLE `copy` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `document`
--

DROP TABLE IF EXISTS `document`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `document` (
  `documentid` int(10) NOT NULL AUTO_INCREMENT,
  `title` varchar(40) NOT NULL,
  `PDate` date DEFAULT NULL,
  `publisherid` int(11) NOT NULL,
  PRIMARY KEY (`documentid`),
  KEY `pubfk` (`publisherid`),
  CONSTRAINT `pubfk` FOREIGN KEY (`publisherid`) REFERENCES `publisher` (`publisherid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `document`
--

LOCK TABLES `document` WRITE;
/*!40000 ALTER TABLE `document` DISABLE KEYS */;
INSERT INTO `document` VALUES (3,'Algorithms','2012-12-02',4),(4,'Network','2004-12-02',6),(5,'Prc1','2014-11-01',10),(6,'proc2','2007-12-07',8),(7,'image process','2006-11-01',5),(8,'software project','2006-12-03',12),(9,'operating system','2003-12-02',12),(10,'database','2003-12-02',6),(11,'health records','2007-12-07',10),(12,'java','2003-12-09',11),(13,'machine learning','2009-12-08',7),(14,'network arch','2004-11-01',10),(15,'cloud computing','2001-12-08',10),(16,'data mining','2004-10-31',8),(17,'jornl science','1999-12-07',11),(18,'managmnt journal','2006-11-01',9),(19,'proced 5','2015-12-02',8),(20,'proced 9','2010-12-09',7),(21,'managmnt','2006-12-06',8);
/*!40000 ALTER TABLE `document` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inveditor`
--

DROP TABLE IF EXISTS `inveditor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `inveditor` (
  `dcoid` int(11) NOT NULL,
  `issueno` int(11) NOT NULL,
  `iname` varchar(30) NOT NULL,
  PRIMARY KEY (`dcoid`,`issueno`,`iname`),
  KEY `jissuefk` (`issueno`,`dcoid`),
  CONSTRAINT `jissuefk2` FOREIGN KEY (`dcoid`, `issueno`) REFERENCES `journalissue` (`docid`, `issueno`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inveditor`
--

LOCK TABLES `inveditor` WRITE;
/*!40000 ALTER TABLE `inveditor` DISABLE KEYS */;
/*!40000 ALTER TABLE `inveditor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `journalissue`
--

DROP TABLE IF EXISTS `journalissue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `journalissue` (
  `docid` int(11) NOT NULL,
  `issueno` int(11) NOT NULL,
  `scope` varchar(30) NOT NULL,
  PRIMARY KEY (`docid`,`issueno`),
  CONSTRAINT `docifk3` FOREIGN KEY (`docid`) REFERENCES `document` (`documentid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `journalissue`
--

LOCK TABLES `journalissue` WRITE;
/*!40000 ALTER TABLE `journalissue` DISABLE KEYS */;
INSERT INTO `journalissue` VALUES (6,3,'technology'),(17,3,'science'),(18,1,'management'),(21,5,'management');
/*!40000 ALTER TABLE `journalissue` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `journalvolume`
--

DROP TABLE IF EXISTS `journalvolume`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `journalvolume` (
  `docid` int(11) NOT NULL,
  `jvolume` varchar(20) NOT NULL,
  `editorid` int(11) NOT NULL,
  PRIMARY KEY (`docid`),
  KEY `editoridfk` (`editorid`),
  CONSTRAINT `docidfk2` FOREIGN KEY (`docid`) REFERENCES `document` (`documentid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `editoridfk` FOREIGN KEY (`editorid`) REFERENCES `chiefeditor` (`editorid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `journalvolume`
--

LOCK TABLES `journalvolume` WRITE;
/*!40000 ALTER TABLE `journalvolume` DISABLE KEYS */;
/*!40000 ALTER TABLE `journalvolume` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proceedings`
--

DROP TABLE IF EXISTS `proceedings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `proceedings` (
  `docid` int(11) NOT NULL,
  `cdate` date NOT NULL,
  `clocation` varchar(100) NOT NULL,
  `ceditor` varchar(20) NOT NULL,
  PRIMARY KEY (`docid`),
  CONSTRAINT `docidfk` FOREIGN KEY (`docid`) REFERENCES `document` (`documentid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proceedings`
--

LOCK TABLES `proceedings` WRITE;
/*!40000 ALTER TABLE `proceedings` DISABLE KEYS */;
INSERT INTO `proceedings` VALUES (5,'2010-12-01','new york','2'),(19,'2007-12-08','jersey city','6'),(20,'2009-12-04','edison','7');
/*!40000 ALTER TABLE `proceedings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `publisher`
--

DROP TABLE IF EXISTS `publisher`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `publisher` (
  `publisherid` int(10) NOT NULL AUTO_INCREMENT,
  `pubname` varchar(20) NOT NULL,
  `address` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`publisherid`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `publisher`
--

LOCK TABLES `publisher` WRITE;
/*!40000 ALTER TABLE `publisher` DISABLE KEYS */;
INSERT INTO `publisher` VALUES (4,'Mcgraw','New york'),(5,'Wiley','New york'),(6,'Princeton','California'),(7,'Oreily','Boston'),(8,'Pearson','Edison'),(9,'Gakken','Jersey city'),(10,'Saraiva','New york'),(11,'Klett','Miami'),(12,'Oxford','England'),(13,'Random house','Michigan');
/*!40000 ALTER TABLE `publisher` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reader`
--

DROP TABLE IF EXISTS `reader`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reader` (
  `readerid` int(11) NOT NULL AUTO_INCREMENT,
  `rtype` varchar(20) NOT NULL,
  `rname` varchar(20) NOT NULL,
  `address` varchar(100) NOT NULL,
  PRIMARY KEY (`readerid`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reader`
--

LOCK TABLES `reader` WRITE;
/*!40000 ALTER TABLE `reader` DISABLE KEYS */;
INSERT INTO `reader` VALUES (1,'student','sid','822 Pavonia Ave'),(3,'null','jf','jghjh'),(4,'student','dj','kjbj');
/*!40000 ALTER TABLE `reader` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reserves`
--

DROP TABLE IF EXISTS `reserves`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reserves` (
  `reserveid` int(11) NOT NULL AUTO_INCREMENT,
  `readerid` int(11) DEFAULT NULL,
  `docid` int(11) DEFAULT NULL,
  `copyno` int(11) DEFAULT NULL,
  `libid` int(11) DEFAULT NULL,
  `dtime` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`reserveid`),
  KEY `readeridfk` (`readerid`),
  KEY `copyfk` (`docid`,`copyno`,`libid`),
  CONSTRAINT `copyfk` FOREIGN KEY (`docid`, `copyno`, `libid`) REFERENCES `copy` (`docid`, `copyno`, `libid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `readeridfk` FOREIGN KEY (`readerid`) REFERENCES `reader` (`readerid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reserves`
--

LOCK TABLES `reserves` WRITE;
/*!40000 ALTER TABLE `reserves` DISABLE KEYS */;
/*!40000 ALTER TABLE `reserves` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-05-03 17:49:10
