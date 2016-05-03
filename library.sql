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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `author`
--

LOCK TABLES `author` WRITE;
/*!40000 ALTER TABLE `author` DISABLE KEYS */;
INSERT INTO `author` VALUES (1,'sid'),(2,'sid2');
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
  `rdtime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`bornumber`),
  KEY `readeridfk2` (`readerid`),
  KEY `copyfk2` (`docid`,`copyno`,`libid`),
  CONSTRAINT `copyfk2` FOREIGN KEY (`docid`, `copyno`, `libid`) REFERENCES `copy` (`docid`, `copyno`, `libid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `readeridfk2` FOREIGN KEY (`readerid`) REFERENCES `reader` (`readerid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chiefeditor`
--

LOCK TABLES `chiefeditor` WRITE;
/*!40000 ALTER TABLE `chiefeditor` DISABLE KEYS */;
INSERT INTO `chiefeditor` VALUES (2,'jatin'),(3,'habibi');
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
INSERT INTO `copy` VALUES (1,1,2,'lkjhgf');
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `document`
--

LOCK TABLES `document` WRITE;
/*!40000 ALTER TABLE `document` DISABLE KEYS */;
INSERT INTO `document` VALUES (1,'60 shades of grey','2015-12-05',3),(2,'algorms','2015-12-04',1);
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `publisher`
--

LOCK TABLES `publisher` WRITE;
/*!40000 ALTER TABLE `publisher` DISABLE KEYS */;
INSERT INTO `publisher` VALUES (1,'pub1','harrison'),(2,'sidrocks','asdfghj'),(3,'hsbchs','jhsdgg');
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
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

-- Dump completed on 2016-05-03 14:23:17
