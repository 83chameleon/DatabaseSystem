-- MySQL dump 10.13  Distrib 5.7.19, for Win64 (x86_64)
--
-- Host: localhost    Database: laboratorymanager
-- ------------------------------------------------------
-- Server version	5.7.19-log

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
-- Temporary table structure for view `count_course`
--

DROP TABLE IF EXISTS `count_course`;
/*!50001 DROP VIEW IF EXISTS `count_course`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `count_course` AS SELECT 
 1 AS `SSN`,
 1 AS `NAME`,
 1 AS `COUNT(COURSENO)`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `course`
--

DROP TABLE IF EXISTS `course`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `course` (
  `NO` int(11) NOT NULL,
  `NAME` varchar(255) COLLATE utf8_bin NOT NULL,
  `DESCRIPTION` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SSN` int(11) NOT NULL,
  PRIMARY KEY (`NO`),
  KEY `SSN` (`SSN`),
  CONSTRAINT `course_ibfk_1` FOREIGN KEY (`SSN`) REFERENCES `teacher` (`SSN`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course`
--

LOCK TABLES `course` WRITE;
/*!40000 ALTER TABLE `course` DISABLE KEYS */;
INSERT INTO `course` VALUES (1,'数据库','数据库系统',1);
/*!40000 ALTER TABLE `course` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `education`
--

DROP TABLE IF EXISTS `education`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `education` (
  `SSN` int(11) NOT NULL,
  `STARTDATE` varchar(30) COLLATE utf8_bin NOT NULL,
  `ENDDATE` varchar(30) COLLATE utf8_bin NOT NULL,
  `SCHOOLNAME` varchar(255) COLLATE utf8_bin NOT NULL,
  `DEGREE` varchar(255) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`SSN`,`STARTDATE`,`ENDDATE`),
  CONSTRAINT `education_ibfk_1` FOREIGN KEY (`SSN`) REFERENCES `student` (`SSN`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `education`
--

LOCK TABLES `education` WRITE;
/*!40000 ALTER TABLE `education` DISABLE KEYS */;
INSERT INTO `education` VALUES (2,'2015','2019','哈工大','本科'),(2,'2018','2020','浙大','硕士');
/*!40000 ALTER TABLE `education` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `field`
--

DROP TABLE IF EXISTS `field`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `field` (
  `NO` int(11) NOT NULL,
  `NAME` varchar(255) COLLATE utf8_bin NOT NULL,
  `DESCRIPTION` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`NO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `field`
--

LOCK TABLES `field` WRITE;
/*!40000 ALTER TABLE `field` DISABLE KEYS */;
INSERT INTO `field` VALUES (1,'关系型数据库','mysql等数据库');
/*!40000 ALTER TABLE `field` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hobby`
--

DROP TABLE IF EXISTS `hobby`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hobby` (
  `SSN` int(11) NOT NULL,
  `CONTENT` varchar(255) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`SSN`,`CONTENT`),
  CONSTRAINT `hobby_ibfk_1` FOREIGN KEY (`SSN`) REFERENCES `student` (`SSN`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hobby`
--

LOCK TABLES `hobby` WRITE;
/*!40000 ALTER TABLE `hobby` DISABLE KEYS */;
INSERT INTO `hobby` VALUES (2,'跑步');
/*!40000 ALTER TABLE `hobby` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `impression`
--

DROP TABLE IF EXISTS `impression`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `impression` (
  `LABORATORYNO` int(11) NOT NULL,
  `CONTENT` text COLLATE utf8_bin NOT NULL,
  `SSN` int(11) NOT NULL,
  PRIMARY KEY (`LABORATORYNO`,`SSN`),
  KEY `SSN` (`SSN`),
  CONSTRAINT `impression_ibfk_1` FOREIGN KEY (`LABORATORYNO`) REFERENCES `laboratory` (`NO`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `impression_ibfk_2` FOREIGN KEY (`SSN`) REFERENCES `student` (`SSN`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `impression`
--

LOCK TABLES `impression` WRITE;
/*!40000 ALTER TABLE `impression` DISABLE KEYS */;
/*!40000 ALTER TABLE `impression` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `job`
--

DROP TABLE IF EXISTS `job`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `job` (
  `SSN` int(11) NOT NULL,
  `DEPARTMENT` varchar(255) COLLATE utf8_bin NOT NULL,
  `APPOINTMENT` varchar(255) COLLATE utf8_bin NOT NULL,
  `STARTDATE` varchar(30) COLLATE utf8_bin NOT NULL,
  `ENDDATE` varchar(30) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`SSN`,`STARTDATE`,`ENDDATE`),
  CONSTRAINT `job_ibfk_1` FOREIGN KEY (`SSN`) REFERENCES `student` (`SSN`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `job`
--

LOCK TABLES `job` WRITE;
/*!40000 ALTER TABLE `job` DISABLE KEYS */;
INSERT INTO `job` VALUES (2,'彩虹马','前端实习生','2017','2018');
/*!40000 ALTER TABLE `job` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `laboratory`
--

DROP TABLE IF EXISTS `laboratory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `laboratory` (
  `NO` int(11) NOT NULL,
  `NAME` varchar(255) COLLATE utf8_bin NOT NULL,
  `STARTDATE` datetime NOT NULL,
  `NUMBER` int(11) NOT NULL DEFAULT '0',
  `SUPERVISORSSN` int(11) NOT NULL,
  PRIMARY KEY (`NO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `laboratory`
--

LOCK TABLES `laboratory` WRITE;
/*!40000 ALTER TABLE `laboratory` DISABLE KEYS */;
INSERT INTO `laboratory` VALUES (1,'数据库实验室','2006-05-13 03:21:15',17,1);
/*!40000 ALTER TABLE `laboratory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `location`
--

DROP TABLE IF EXISTS `location`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `location` (
  `NO` int(11) NOT NULL,
  `LABNO` int(11) NOT NULL,
  `PHONE` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `LOCATION_P` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `LOCATION_C` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `LOCATION_A` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`NO`),
  KEY `LABNO` (`LABNO`),
  CONSTRAINT `location_ibfk_1` FOREIGN KEY (`LABNO`) REFERENCES `laboratory` (`NO`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `location`
--

LOCK TABLES `location` WRITE;
/*!40000 ALTER TABLE `location` DISABLE KEYS */;
/*!40000 ALTER TABLE `location` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `love`
--

DROP TABLE IF EXISTS `love`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `love` (
  `SSN` int(11) NOT NULL,
  `FIELDNO` int(11) NOT NULL,
  PRIMARY KEY (`SSN`,`FIELDNO`),
  KEY `love_ibfk_1` (`FIELDNO`),
  CONSTRAINT `love_ibfk_1` FOREIGN KEY (`FIELDNO`) REFERENCES `field` (`NO`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `love`
--

LOCK TABLES `love` WRITE;
/*!40000 ALTER TABLE `love` DISABLE KEYS */;
/*!40000 ALTER TABLE `love` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `project`
--

DROP TABLE IF EXISTS `project`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `project` (
  `NO` int(11) NOT NULL,
  `NAME` varchar(255) COLLATE utf8_bin NOT NULL,
  `HOURS` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '0',
  PRIMARY KEY (`NO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project`
--

LOCK TABLES `project` WRITE;
/*!40000 ALTER TABLE `project` DISABLE KEYS */;
INSERT INTO `project` VALUES (1,'mysql项目','30'),(2,'java项目','20'),(3,'git项目','10');
/*!40000 ALTER TABLE `project` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `research`
--

DROP TABLE IF EXISTS `research`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `research` (
  `NAME` varchar(255) COLLATE utf8_bin NOT NULL,
  `NO` int(11) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `HOURS` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `DEGREE` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `DESCRIPTION` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SSN` int(11) NOT NULL,
  PRIMARY KEY (`NO`),
  KEY `SSN` (`SSN`),
  CONSTRAINT `research_ibfk_1` FOREIGN KEY (`SSN`) REFERENCES `teacher` (`SSN`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `research`
--

LOCK TABLES `research` WRITE;
/*!40000 ALTER TABLE `research` DISABLE KEYS */;
INSERT INTO `research` VALUES ('数据库完整性研究',00000000001,'20','博导','数据库完整性',1);
/*!40000 ALTER TABLE `research` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student`
--

DROP TABLE IF EXISTS `student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `student` (
  `SSN` int(11) NOT NULL,
  `NAME` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SALARY` decimal(10,0) DEFAULT '0',
  `EMAIL` varchar(255) COLLATE utf8_bin NOT NULL,
  `TUTORSSN` int(11) DEFAULT NULL,
  `LABORATORYNO` int(11) DEFAULT NULL,
  `PASSWORD` varchar(255) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`SSN`),
  KEY `TUTORSSN` (`TUTORSSN`),
  KEY `TUTORSSN_2` (`TUTORSSN`),
  KEY `TUTORSSN_3` (`TUTORSSN`),
  KEY `TUTORSSN_4` (`TUTORSSN`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student`
--

LOCK TABLES `student` WRITE;
/*!40000 ALTER TABLE `student` DISABLE KEYS */;
INSERT INTO `student` VALUES (2,'Wangfangshuai',300,'134@q.com',1,1,'123456'),(3,'lixiaoming',200,'11',1,1,'123456'),(4,'zhangyide',500,'11111',11,1,'123'),(1150310620,NULL,0,'1187307315@qq.com',0,NULL,'123456');
/*!40000 ALTER TABLE `student` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = gbk */ ;
/*!50003 SET character_set_results = gbk */ ;
/*!50003 SET collation_connection  = gbk_chinese_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `Addtolab` AFTER INSERT ON `STUDENT` FOR EACH ROW update LABORATORY  set LABORATORY.NUMBER=LABORATORY.NUMBER+1  where LABORATORY.`NO` = NEW.LABORATORYNO */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = gbk */ ;
/*!50003 SET character_set_results = gbk */ ;
/*!50003 SET collation_connection  = gbk_chinese_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `update` AFTER UPDATE ON `STUDENT` FOR EACH ROW update LABORATORY  set LABORATORY.NUMBER=LABORATORY.NUMBER+1  where LABORATORY.`NO` = NEW.LABORATORYNO */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = gbk */ ;
/*!50003 SET character_set_results = gbk */ ;
/*!50003 SET collation_connection  = gbk_chinese_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `deletefromlab` AFTER DELETE ON `STUDENT` FOR EACH ROW update LABORATORY  set LABORATORY.NUMBER=LABORATORY.NUMBER-1  where LABORATORY.`NO` = deleted.LABORATORYNO */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `study`
--

DROP TABLE IF EXISTS `study`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `study` (
  `SSN` int(11) NOT NULL,
  `COURSENO` int(11) NOT NULL,
  PRIMARY KEY (`SSN`,`COURSENO`),
  KEY `COURSENO` (`COURSENO`),
  CONSTRAINT `study_ibfk_1` FOREIGN KEY (`COURSENO`) REFERENCES `course` (`NO`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `study_ibfk_2` FOREIGN KEY (`SSN`) REFERENCES `student` (`SSN`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `study`
--

LOCK TABLES `study` WRITE;
/*!40000 ALTER TABLE `study` DISABLE KEYS */;
INSERT INTO `study` VALUES (2,1);
/*!40000 ALTER TABLE `study` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teacher`
--

DROP TABLE IF EXISTS `teacher`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `teacher` (
  `SSN` int(11) NOT NULL,
  `NAME` varchar(255) COLLATE utf8_bin NOT NULL,
  `EMAIL` varchar(255) COLLATE utf8_bin NOT NULL,
  `LABORATORYNO` int(11) NOT NULL,
  `PASSWORD` varchar(255) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`SSN`),
  KEY `LABORATORYNO` (`LABORATORYNO`),
  KEY `LABORATORYNO_2` (`LABORATORYNO`),
  KEY `LABORATORYNO_3` (`LABORATORYNO`),
  KEY `LABORATORYNO_4` (`LABORATORYNO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teacher`
--

LOCK TABLES `teacher` WRITE;
/*!40000 ALTER TABLE `teacher` DISABLE KEYS */;
INSERT INTO `teacher` VALUES (1,'zhandechen','11@q.com',1,'12'),(11,'sundalie','1',1,'123');
/*!40000 ALTER TABLE `teacher` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = gbk */ ;
/*!50003 SET character_set_results = gbk */ ;
/*!50003 SET collation_connection  = gbk_chinese_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `AddteachertoLab` AFTER INSERT ON `TEACHER` FOR EACH ROW update LABORATORY  set LABORATORY.NUMBER=LABORATORY.NUMBER+1  where LABORATORY.`NO` = NEW.LABORATORYNO */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = gbk */ ;
/*!50003 SET character_set_results = gbk */ ;
/*!50003 SET collation_connection  = gbk_chinese_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `DeleteteacherfromLab` AFTER DELETE ON `TEACHER` FOR EACH ROW update LABORATORY  set LABORATORY.NUMBER=LABORATORY.NUMBER-1  where LABORATORY.`NO` = DELETED.LABORATORYNO */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `works_for`
--

DROP TABLE IF EXISTS `works_for`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `works_for` (
  `SSN` int(11) NOT NULL,
  `RESEARCHNO` int(11) NOT NULL,
  PRIMARY KEY (`SSN`,`RESEARCHNO`),
  KEY `RESEARCHNO` (`RESEARCHNO`),
  KEY `RESEARCHNO_2` (`RESEARCHNO`),
  KEY `RESEARCHNO_3` (`RESEARCHNO`),
  KEY `RESEARCHNO_4` (`RESEARCHNO`),
  CONSTRAINT `works_for_ibfk_1` FOREIGN KEY (`SSN`) REFERENCES `teacher` (`SSN`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `works_for`
--

LOCK TABLES `works_for` WRITE;
/*!40000 ALTER TABLE `works_for` DISABLE KEYS */;
INSERT INTO `works_for` VALUES (1,1);
/*!40000 ALTER TABLE `works_for` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `works_on`
--

DROP TABLE IF EXISTS `works_on`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `works_on` (
  `SSN` int(11) NOT NULL,
  `PROJECTNO` int(11) NOT NULL,
  PRIMARY KEY (`SSN`,`PROJECTNO`),
  KEY `PROJECTNO` (`PROJECTNO`),
  CONSTRAINT `works_on_ibfk_1` FOREIGN KEY (`PROJECTNO`) REFERENCES `project` (`NO`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `works_on`
--

LOCK TABLES `works_on` WRITE;
/*!40000 ALTER TABLE `works_on` DISABLE KEYS */;
INSERT INTO `works_on` VALUES (1,1),(2,1);
/*!40000 ALTER TABLE `works_on` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `count_course`
--

/*!50001 DROP VIEW IF EXISTS `count_course`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = gbk */;
/*!50001 SET character_set_results     = gbk */;
/*!50001 SET collation_connection      = gbk_chinese_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `count_course` AS select `student`.`SSN` AS `SSN`,`student`.`NAME` AS `NAME`,count(`study`.`COURSENO`) AS `COUNT(COURSENO)` from (`student` join `study`) where (`student`.`SSN` = `study`.`SSN`) group by `study`.`SSN` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-06-02 19:08:26
