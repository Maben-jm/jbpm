-- MySQL dump 10.13  Distrib 8.0.22, for osx10.15 (x86_64)
--
-- Host: 127.0.0.1    Database: jbpm
-- ------------------------------------------------------
-- Server version	8.0.22

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `JBPM4_DEPLOYMENT`
--

DROP TABLE IF EXISTS `JBPM4_DEPLOYMENT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `JBPM4_DEPLOYMENT` (
  `DBID_` bigint NOT NULL,
  `NAME_` longtext,
  `TIMESTAMP_` bigint DEFAULT NULL,
  `STATE_` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`DBID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `JBPM4_DEPLOYMENT`
--

LOCK TABLES `JBPM4_DEPLOYMENT` WRITE;
/*!40000 ALTER TABLE `JBPM4_DEPLOYMENT` DISABLE KEYS */;
INSERT INTO `JBPM4_DEPLOYMENT` VALUES (1,NULL,0,'active'),(20001,NULL,0,'active'),(60001,NULL,0,'active');
/*!40000 ALTER TABLE `JBPM4_DEPLOYMENT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `JBPM4_DEPLOYPROP`
--

DROP TABLE IF EXISTS `JBPM4_DEPLOYPROP`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `JBPM4_DEPLOYPROP` (
  `DBID_` bigint NOT NULL,
  `DEPLOYMENT_` bigint DEFAULT NULL,
  `OBJNAME_` varchar(255) DEFAULT NULL,
  `KEY_` varchar(255) DEFAULT NULL,
  `STRINGVAL_` varchar(255) DEFAULT NULL,
  `LONGVAL_` bigint DEFAULT NULL,
  PRIMARY KEY (`DBID_`),
  KEY `IDX_DEPLPROP_DEPL` (`DEPLOYMENT_`),
  KEY `FK_DEPLPROP_DEPL` (`DEPLOYMENT_`),
  CONSTRAINT `FK_DEPLPROP_DEPL` FOREIGN KEY (`DEPLOYMENT_`) REFERENCES `JBPM4_DEPLOYMENT` (`DBID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `JBPM4_DEPLOYPROP`
--

LOCK TABLES `JBPM4_DEPLOYPROP` WRITE;
/*!40000 ALTER TABLE `JBPM4_DEPLOYPROP` DISABLE KEYS */;
INSERT INTO `JBPM4_DEPLOYPROP` VALUES (4,1,'helloworld','langid','jpdl-4.4',NULL),(5,1,'helloworld','pdid','helloworld-1',NULL),(6,1,'helloworld','pdkey','helloworld',NULL),(7,1,'helloworld','pdversion',NULL,1);
/*!40000 ALTER TABLE `JBPM4_DEPLOYPROP` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `JBPM4_EXECUTION`
--

DROP TABLE IF EXISTS `JBPM4_EXECUTION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `JBPM4_EXECUTION` (
  `DBID_` bigint NOT NULL,
  `CLASS_` varchar(255) NOT NULL,
  `DBVERSION_` int NOT NULL,
  `ACTIVITYNAME_` varchar(255) DEFAULT NULL,
  `PROCDEFID_` varchar(255) DEFAULT NULL,
  `HASVARS_` bit(1) DEFAULT NULL,
  `NAME_` varchar(255) DEFAULT NULL,
  `KEY_` varchar(255) DEFAULT NULL,
  `ID_` varchar(255) DEFAULT NULL,
  `STATE_` varchar(255) DEFAULT NULL,
  `SUSPHISTSTATE_` varchar(255) DEFAULT NULL,
  `PRIORITY_` int DEFAULT NULL,
  `HISACTINST_` bigint DEFAULT NULL,
  `PARENT_` bigint DEFAULT NULL,
  `INSTANCE_` bigint DEFAULT NULL,
  `SUPEREXEC_` bigint DEFAULT NULL,
  `SUBPROCINST_` bigint DEFAULT NULL,
  `PARENT_IDX_` int DEFAULT NULL,
  PRIMARY KEY (`DBID_`),
  UNIQUE KEY `ID_` (`ID_`),
  KEY `IDX_EXEC_SUPEREXEC` (`SUPEREXEC_`),
  KEY `IDX_EXEC_PARENT` (`PARENT_`),
  KEY `IDX_EXEC_INSTANCE` (`INSTANCE_`),
  KEY `IDX_EXEC_SUBPI` (`SUBPROCINST_`),
  KEY `FK_EXEC_INSTANCE` (`INSTANCE_`),
  KEY `FK_EXEC_PARENT` (`PARENT_`),
  KEY `FK_EXEC_SUBPI` (`SUBPROCINST_`),
  KEY `FK_EXEC_SUPEREXEC` (`SUPEREXEC_`),
  CONSTRAINT `FK_EXEC_INSTANCE` FOREIGN KEY (`INSTANCE_`) REFERENCES `JBPM4_EXECUTION` (`DBID_`),
  CONSTRAINT `FK_EXEC_PARENT` FOREIGN KEY (`PARENT_`) REFERENCES `JBPM4_EXECUTION` (`DBID_`),
  CONSTRAINT `FK_EXEC_SUBPI` FOREIGN KEY (`SUBPROCINST_`) REFERENCES `JBPM4_EXECUTION` (`DBID_`),
  CONSTRAINT `FK_EXEC_SUPEREXEC` FOREIGN KEY (`SUPEREXEC_`) REFERENCES `JBPM4_EXECUTION` (`DBID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `JBPM4_EXECUTION`
--

LOCK TABLES `JBPM4_EXECUTION` WRITE;
/*!40000 ALTER TABLE `JBPM4_EXECUTION` DISABLE KEYS */;
INSERT INTO `JBPM4_EXECUTION` VALUES (10001,'pvm',1,'æäº¤ç”³è¯·','helloworld-1',_binary '\0',NULL,NULL,'helloworld.10001','active-root',NULL,0,10003,NULL,10001,NULL,NULL,NULL),(30001,'pvm',3,'å®¡æ‰¹ã€Œæ€»ç»ç†ã€','helloworld-1',_binary '\0',NULL,NULL,'helloworld.30001','active-root',NULL,0,50002,NULL,30001,NULL,NULL,NULL);
/*!40000 ALTER TABLE `JBPM4_EXECUTION` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `JBPM4_HIST_ACTINST`
--

DROP TABLE IF EXISTS `JBPM4_HIST_ACTINST`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `JBPM4_HIST_ACTINST` (
  `DBID_` bigint NOT NULL,
  `CLASS_` varchar(255) NOT NULL,
  `DBVERSION_` int NOT NULL,
  `HPROCI_` bigint DEFAULT NULL,
  `TYPE_` varchar(255) DEFAULT NULL,
  `EXECUTION_` varchar(255) DEFAULT NULL,
  `ACTIVITY_NAME_` varchar(255) DEFAULT NULL,
  `START_` datetime DEFAULT NULL,
  `END_` datetime DEFAULT NULL,
  `DURATION_` bigint DEFAULT NULL,
  `TRANSITION_` varchar(255) DEFAULT NULL,
  `NEXTIDX_` int DEFAULT NULL,
  `HTASK_` bigint DEFAULT NULL,
  PRIMARY KEY (`DBID_`),
  KEY `IDX_HTI_HTASK` (`HTASK_`),
  KEY `IDX_HACTI_HPROCI` (`HPROCI_`),
  KEY `FK_HACTI_HPROCI` (`HPROCI_`),
  KEY `FK_HTI_HTASK` (`HTASK_`),
  CONSTRAINT `FK_HACTI_HPROCI` FOREIGN KEY (`HPROCI_`) REFERENCES `JBPM4_HIST_PROCINST` (`DBID_`),
  CONSTRAINT `FK_HTI_HTASK` FOREIGN KEY (`HTASK_`) REFERENCES `JBPM4_HIST_TASK` (`DBID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `JBPM4_HIST_ACTINST`
--

LOCK TABLES `JBPM4_HIST_ACTINST` WRITE;
/*!40000 ALTER TABLE `JBPM4_HIST_ACTINST` DISABLE KEYS */;
INSERT INTO `JBPM4_HIST_ACTINST` VALUES (10003,'task',0,10001,'task','helloworld.10001','æäº¤ç”³è¯·','2021-02-17 21:33:26',NULL,0,NULL,1,10002),(30003,'task',1,30001,'task','helloworld.30001','æäº¤ç”³è¯·','2021-02-17 21:44:38','2021-02-17 21:51:25',406562,'jbpm_no_task_outcome_specified_jbpm',1,30002),(40002,'task',1,30001,'task','helloworld.30001','å®¡æ‰¹ã€Œéƒ¨é—¨ç»ç†ã€','2021-02-17 21:51:25','2021-02-17 21:52:13',47649,'jbpm_no_task_outcome_specified_jbpm',1,40001),(50002,'task',0,30001,'task','helloworld.30001','å®¡æ‰¹ã€Œæ€»ç»ç†ã€','2021-02-17 21:52:13',NULL,0,NULL,1,50001);
/*!40000 ALTER TABLE `JBPM4_HIST_ACTINST` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `JBPM4_HIST_DETAIL`
--

DROP TABLE IF EXISTS `JBPM4_HIST_DETAIL`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `JBPM4_HIST_DETAIL` (
  `DBID_` bigint NOT NULL,
  `CLASS_` varchar(255) NOT NULL,
  `DBVERSION_` int NOT NULL,
  `USERID_` varchar(255) DEFAULT NULL,
  `TIME_` datetime DEFAULT NULL,
  `HPROCI_` bigint DEFAULT NULL,
  `HPROCIIDX_` int DEFAULT NULL,
  `HACTI_` bigint DEFAULT NULL,
  `HACTIIDX_` int DEFAULT NULL,
  `HTASK_` bigint DEFAULT NULL,
  `HTASKIDX_` int DEFAULT NULL,
  `HVAR_` bigint DEFAULT NULL,
  `HVARIDX_` int DEFAULT NULL,
  `MESSAGE_` longtext,
  `OLD_STR_` varchar(255) DEFAULT NULL,
  `NEW_STR_` varchar(255) DEFAULT NULL,
  `OLD_INT_` int DEFAULT NULL,
  `NEW_INT_` int DEFAULT NULL,
  `OLD_TIME_` datetime DEFAULT NULL,
  `NEW_TIME_` datetime DEFAULT NULL,
  `PARENT_` bigint DEFAULT NULL,
  `PARENT_IDX_` int DEFAULT NULL,
  PRIMARY KEY (`DBID_`),
  KEY `IDX_HDET_HACTI` (`HACTI_`),
  KEY `IDX_HDET_HPROCI` (`HPROCI_`),
  KEY `IDX_HDET_HTASK` (`HTASK_`),
  KEY `IDX_HDET_HVAR` (`HVAR_`),
  KEY `FK_HDETAIL_HVAR` (`HVAR_`),
  KEY `FK_HDETAIL_HPROCI` (`HPROCI_`),
  KEY `FK_HDETAIL_HTASK` (`HTASK_`),
  KEY `FK_HDETAIL_HACTI` (`HACTI_`),
  CONSTRAINT `FK_HDETAIL_HACTI` FOREIGN KEY (`HACTI_`) REFERENCES `JBPM4_HIST_ACTINST` (`DBID_`),
  CONSTRAINT `FK_HDETAIL_HPROCI` FOREIGN KEY (`HPROCI_`) REFERENCES `JBPM4_HIST_PROCINST` (`DBID_`),
  CONSTRAINT `FK_HDETAIL_HTASK` FOREIGN KEY (`HTASK_`) REFERENCES `JBPM4_HIST_TASK` (`DBID_`),
  CONSTRAINT `FK_HDETAIL_HVAR` FOREIGN KEY (`HVAR_`) REFERENCES `JBPM4_HIST_VAR` (`DBID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `JBPM4_HIST_DETAIL`
--

LOCK TABLES `JBPM4_HIST_DETAIL` WRITE;
/*!40000 ALTER TABLE `JBPM4_HIST_DETAIL` DISABLE KEYS */;
/*!40000 ALTER TABLE `JBPM4_HIST_DETAIL` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `JBPM4_HIST_PROCINST`
--

DROP TABLE IF EXISTS `JBPM4_HIST_PROCINST`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `JBPM4_HIST_PROCINST` (
  `DBID_` bigint NOT NULL,
  `DBVERSION_` int NOT NULL,
  `ID_` varchar(255) DEFAULT NULL,
  `PROCDEFID_` varchar(255) DEFAULT NULL,
  `KEY_` varchar(255) DEFAULT NULL,
  `START_` datetime DEFAULT NULL,
  `END_` datetime DEFAULT NULL,
  `DURATION_` bigint DEFAULT NULL,
  `STATE_` varchar(255) DEFAULT NULL,
  `ENDACTIVITY_` varchar(255) DEFAULT NULL,
  `NEXTIDX_` int DEFAULT NULL,
  PRIMARY KEY (`DBID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `JBPM4_HIST_PROCINST`
--

LOCK TABLES `JBPM4_HIST_PROCINST` WRITE;
/*!40000 ALTER TABLE `JBPM4_HIST_PROCINST` DISABLE KEYS */;
INSERT INTO `JBPM4_HIST_PROCINST` VALUES (10001,0,'helloworld.10001','helloworld-1',NULL,'2021-02-17 21:33:26',NULL,NULL,'active',NULL,1),(30001,0,'helloworld.30001','helloworld-1',NULL,'2021-02-17 21:44:38',NULL,NULL,'active',NULL,1);
/*!40000 ALTER TABLE `JBPM4_HIST_PROCINST` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `JBPM4_HIST_TASK`
--

DROP TABLE IF EXISTS `JBPM4_HIST_TASK`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `JBPM4_HIST_TASK` (
  `DBID_` bigint NOT NULL,
  `DBVERSION_` int NOT NULL,
  `EXECUTION_` varchar(255) DEFAULT NULL,
  `OUTCOME_` varchar(255) DEFAULT NULL,
  `ASSIGNEE_` varchar(255) DEFAULT NULL,
  `PRIORITY_` int DEFAULT NULL,
  `STATE_` varchar(255) DEFAULT NULL,
  `CREATE_` datetime DEFAULT NULL,
  `END_` datetime DEFAULT NULL,
  `DURATION_` bigint DEFAULT NULL,
  `NEXTIDX_` int DEFAULT NULL,
  `SUPERTASK_` bigint DEFAULT NULL,
  PRIMARY KEY (`DBID_`),
  KEY `IDX_HSUPERT_SUB` (`SUPERTASK_`),
  KEY `FK_HSUPERT_SUB` (`SUPERTASK_`),
  CONSTRAINT `FK_HSUPERT_SUB` FOREIGN KEY (`SUPERTASK_`) REFERENCES `JBPM4_HIST_TASK` (`DBID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `JBPM4_HIST_TASK`
--

LOCK TABLES `JBPM4_HIST_TASK` WRITE;
/*!40000 ALTER TABLE `JBPM4_HIST_TASK` DISABLE KEYS */;
INSERT INTO `JBPM4_HIST_TASK` VALUES (10002,0,'helloworld.10001',NULL,'å‘˜å·¥',0,NULL,'2021-02-17 21:33:26',NULL,0,1,NULL),(30002,1,'helloworld.30001','jbpm_no_task_outcome_specified_jbpm','å‘˜å·¥',0,'completed','2021-02-17 21:44:38','2021-02-17 21:51:25',406571,1,NULL),(40001,1,'helloworld.30001','jbpm_no_task_outcome_specified_jbpm','éƒ¨é—¨ç»ç†',0,'completed','2021-02-17 21:51:25','2021-02-17 21:52:13',47662,1,NULL),(50001,0,'helloworld.30001',NULL,'æ€»ç»ç†',0,NULL,'2021-02-17 21:52:13',NULL,0,1,NULL);
/*!40000 ALTER TABLE `JBPM4_HIST_TASK` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `JBPM4_HIST_VAR`
--

DROP TABLE IF EXISTS `JBPM4_HIST_VAR`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `JBPM4_HIST_VAR` (
  `DBID_` bigint NOT NULL,
  `DBVERSION_` int NOT NULL,
  `PROCINSTID_` varchar(255) DEFAULT NULL,
  `EXECUTIONID_` varchar(255) DEFAULT NULL,
  `VARNAME_` varchar(255) DEFAULT NULL,
  `VALUE_` varchar(255) DEFAULT NULL,
  `HPROCI_` bigint DEFAULT NULL,
  `HTASK_` bigint DEFAULT NULL,
  PRIMARY KEY (`DBID_`),
  KEY `IDX_HVAR_HPROCI` (`HPROCI_`),
  KEY `IDX_HVAR_HTASK` (`HTASK_`),
  KEY `FK_HVAR_HPROCI` (`HPROCI_`),
  KEY `FK_HVAR_HTASK` (`HTASK_`),
  CONSTRAINT `FK_HVAR_HPROCI` FOREIGN KEY (`HPROCI_`) REFERENCES `JBPM4_HIST_PROCINST` (`DBID_`),
  CONSTRAINT `FK_HVAR_HTASK` FOREIGN KEY (`HTASK_`) REFERENCES `JBPM4_HIST_TASK` (`DBID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `JBPM4_HIST_VAR`
--

LOCK TABLES `JBPM4_HIST_VAR` WRITE;
/*!40000 ALTER TABLE `JBPM4_HIST_VAR` DISABLE KEYS */;
/*!40000 ALTER TABLE `JBPM4_HIST_VAR` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `JBPM4_ID_GROUP`
--

DROP TABLE IF EXISTS `JBPM4_ID_GROUP`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `JBPM4_ID_GROUP` (
  `DBID_` bigint NOT NULL,
  `DBVERSION_` int NOT NULL,
  `ID_` varchar(255) DEFAULT NULL,
  `NAME_` varchar(255) DEFAULT NULL,
  `TYPE_` varchar(255) DEFAULT NULL,
  `PARENT_` bigint DEFAULT NULL,
  PRIMARY KEY (`DBID_`),
  KEY `IDX_GROUP_PARENT` (`PARENT_`),
  KEY `FK_GROUP_PARENT` (`PARENT_`),
  CONSTRAINT `FK_GROUP_PARENT` FOREIGN KEY (`PARENT_`) REFERENCES `JBPM4_ID_GROUP` (`DBID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `JBPM4_ID_GROUP`
--

LOCK TABLES `JBPM4_ID_GROUP` WRITE;
/*!40000 ALTER TABLE `JBPM4_ID_GROUP` DISABLE KEYS */;
/*!40000 ALTER TABLE `JBPM4_ID_GROUP` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `JBPM4_ID_MEMBERSHIP`
--

DROP TABLE IF EXISTS `JBPM4_ID_MEMBERSHIP`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `JBPM4_ID_MEMBERSHIP` (
  `DBID_` bigint NOT NULL,
  `DBVERSION_` int NOT NULL,
  `USER_` bigint DEFAULT NULL,
  `GROUP_` bigint DEFAULT NULL,
  `NAME_` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`DBID_`),
  KEY `IDX_MEM_USER` (`USER_`),
  KEY `IDX_MEM_GROUP` (`GROUP_`),
  KEY `FK_MEM_USER` (`USER_`),
  KEY `FK_MEM_GROUP` (`GROUP_`),
  CONSTRAINT `FK_MEM_GROUP` FOREIGN KEY (`GROUP_`) REFERENCES `JBPM4_ID_GROUP` (`DBID_`),
  CONSTRAINT `FK_MEM_USER` FOREIGN KEY (`USER_`) REFERENCES `JBPM4_ID_USER` (`DBID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `JBPM4_ID_MEMBERSHIP`
--

LOCK TABLES `JBPM4_ID_MEMBERSHIP` WRITE;
/*!40000 ALTER TABLE `JBPM4_ID_MEMBERSHIP` DISABLE KEYS */;
/*!40000 ALTER TABLE `JBPM4_ID_MEMBERSHIP` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `JBPM4_ID_USER`
--

DROP TABLE IF EXISTS `JBPM4_ID_USER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `JBPM4_ID_USER` (
  `DBID_` bigint NOT NULL,
  `DBVERSION_` int NOT NULL,
  `ID_` varchar(255) DEFAULT NULL,
  `PASSWORD_` varchar(255) DEFAULT NULL,
  `GIVENNAME_` varchar(255) DEFAULT NULL,
  `FAMILYNAME_` varchar(255) DEFAULT NULL,
  `BUSINESSEMAIL_` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`DBID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `JBPM4_ID_USER`
--

LOCK TABLES `JBPM4_ID_USER` WRITE;
/*!40000 ALTER TABLE `JBPM4_ID_USER` DISABLE KEYS */;
/*!40000 ALTER TABLE `JBPM4_ID_USER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `JBPM4_JOB`
--

DROP TABLE IF EXISTS `JBPM4_JOB`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `JBPM4_JOB` (
  `DBID_` bigint NOT NULL,
  `CLASS_` varchar(255) NOT NULL,
  `DBVERSION_` int NOT NULL,
  `DUEDATE_` datetime DEFAULT NULL,
  `STATE_` varchar(255) DEFAULT NULL,
  `ISEXCLUSIVE_` bit(1) DEFAULT NULL,
  `LOCKOWNER_` varchar(255) DEFAULT NULL,
  `LOCKEXPTIME_` datetime DEFAULT NULL,
  `EXCEPTION_` longtext,
  `RETRIES_` int DEFAULT NULL,
  `PROCESSINSTANCE_` bigint DEFAULT NULL,
  `EXECUTION_` bigint DEFAULT NULL,
  `CFG_` bigint DEFAULT NULL,
  `SIGNAL_` varchar(255) DEFAULT NULL,
  `EVENT_` varchar(255) DEFAULT NULL,
  `REPEAT_` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`DBID_`),
  KEY `IDX_JOBDUEDATE` (`DUEDATE_`),
  KEY `IDX_JOB_PRINST` (`PROCESSINSTANCE_`),
  KEY `IDX_JOB_EXE` (`EXECUTION_`),
  KEY `IDX_JOB_CFG` (`CFG_`),
  KEY `IDX_JOBLOCKEXP` (`LOCKEXPTIME_`),
  KEY `IDX_JOBRETRIES` (`RETRIES_`),
  KEY `FK_JOB_CFG` (`CFG_`),
  CONSTRAINT `FK_JOB_CFG` FOREIGN KEY (`CFG_`) REFERENCES `JBPM4_LOB` (`DBID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `JBPM4_JOB`
--

LOCK TABLES `JBPM4_JOB` WRITE;
/*!40000 ALTER TABLE `JBPM4_JOB` DISABLE KEYS */;
/*!40000 ALTER TABLE `JBPM4_JOB` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `JBPM4_LOB`
--

DROP TABLE IF EXISTS `JBPM4_LOB`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `JBPM4_LOB` (
  `DBID_` bigint NOT NULL,
  `DBVERSION_` int NOT NULL,
  `BLOB_VALUE_` longblob,
  `DEPLOYMENT_` bigint DEFAULT NULL,
  `NAME_` longtext,
  PRIMARY KEY (`DBID_`),
  KEY `IDX_LOB_DEPLOYMENT` (`DEPLOYMENT_`),
  KEY `FK_LOB_DEPLOYMENT` (`DEPLOYMENT_`),
  CONSTRAINT `FK_LOB_DEPLOYMENT` FOREIGN KEY (`DEPLOYMENT_`) REFERENCES `JBPM4_DEPLOYMENT` (`DBID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `JBPM4_LOB`
--

LOCK TABLES `JBPM4_LOB` WRITE;
/*!40000 ALTER TABLE `JBPM4_LOB` DISABLE KEYS */;
INSERT INTO `JBPM4_LOB` VALUES (2,0,_binary '<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n\n<process name=\"helloworld\" xmlns=\"http://jbpm.org/4.4/jpdl\">\n   <start name=\"start1\" g=\"46,16,48,48\">\n      <transition name=\"to æäº¤ç”³è¯·\" to=\"æäº¤ç”³è¯·\" g=\"-64,-19\"/>\n   </start>\n   <end name=\"end1\" g=\"46,346,48,48\"/>\n   <task name=\"æäº¤ç”³è¯·\" g=\"24,96,92,52\" assignee=\"å‘˜å·¥\">\n      <transition name=\"to å®¡æ‰¹ã€Œéƒ¨é—¨ç»ç†ã€\" to=\"å®¡æ‰¹ã€Œéƒ¨é—¨ç»ç†ã€\" g=\"-109,-19\"/>\n   </task>\n   <task name=\"å®¡æ‰¹ã€Œéƒ¨é—¨ç»ç†ã€\" g=\"24,180,92,52\" assignee=\"éƒ¨é—¨ç»ç†\">\n      <transition name=\"to å®¡æ‰¹ã€Œæ€»ç»ç†ã€\" to=\"å®¡æ‰¹ã€Œæ€»ç»ç†ã€\" g=\"-98,-19\"/>\n   </task>\n   <task name=\"å®¡æ‰¹ã€Œæ€»ç»ç†ã€\" g=\"16,264,109,50\" assignee=\"æ€»ç»ç†\">\n      <transition name=\"to end1\" to=\"end1\" g=\"-46,-18\"/>\n   </task>\n</process>',1,'com/maben/jbpm/helloworld/helloworld.jpdl.xml'),(3,0,_binary '‰PNG\r\n\Z\n\0\0\0\rIHDR\0\0õ\0\0K\0\0\0¦¶H\0\0kMIDATxœ\ì\ÝwtUYz\ç}õt\Ûn»=žµ<ž\Õ3ö;\ïôø\í±\Çk\Æa\ìn§±»\ÝNªªƒ»:U¢(¨DEª*r\Î$‚ˆ‰$D9g!QBB	¡œs\Ö\ï=\ÏWu\ÝÀ½R}?‹½n:\ç\Ü#\î_¿ó<{Ÿ\0\0\0\0€^)$\Ð\'\0\0\0\0\0\0~1„z\0\0\0\0\0z)B=\0\0\0\0\0½¡\0\0\0\0€^ŠP\0\0\0\0@/E¨\0\0\0\0 —\"\Ô\0\0\0\0\ÐK\ê\0\0\0\0\è¥õ\0\0\0\0\0ôR„z\0\0\0\0\0z)B=\0\0\0\0\0½¡\0\0\0\0€^ŠP\0\0\0\0@/E¨\0\0\0\0 —\"\Ô\0\0\0\0\ÐK\ê\0\0\0\0\è¥õ\0\0\0\0\0ôR„z\0\0\0\0\0z)B=\0\0\0\0\0½¡\0\0\0\0€^\êS\ê\Û\Û\Û;G[[›Z[\Û\Ô\Ö\Íh½7l¾}\0\0\0\0\0¤Oe¨÷…ò\Ö\ÖV577«±±Qõõõª­­QMMõý£\ÖF\ê\êjU\ßPï¶µ}l__À\0\0\0\0 >U¡¾³*\ßÚ¦¦¦&Ô¯¤\Õ\æ\Ãs´8z¦­ü¹&,ûÆ…~ÏñK¿¯I\á/j\Î\ÚþŠŒ«C‰\ëu·0K\Õ\Õ\Õ\î\"€ü––\Â=\0\0\0\0  >¡¾³2\ï…\ï\æ¦f\Õ\ÔV\é\è\Å-\Þ8H£þ£†\Ìý[\rÿŽD\Ð\ÆÃ“µ/q¹%­Q\ì©yŠˆ{_SW¿¨\áÿAC\æü¦,ÿ‰¢öNSzöuUUU«Žp\0\0\0\0>\ê?ž/ßª†\Æ¿¾GK7\Ñ/Ì‹x^1Gg\ê\\Z¬n\Ü=ª¬²DÖ¥ª¢õŽª\Úîª¤1Swª®*µð”’n\ïÕK‘Z°i€†-øš\î¬­G\èvnšjªk]\åÞªÿ{\0\0\0\0À³Ò§C½/\Ð[½®¾Nñ§W\ê£%ÿªqa\Ïi_\â\n¥\äŸPa}šª\ÛóT­|Uy•m¹.\ÔÛ°\ç\î«\î}^Þ’£\Ì\ÒJ\ÌØ­\Ð-\ï\êýù§%\Ñ\ï)%=I••Uª««#\Ø\0\0\0\0ž™>\ê;}»ôeUE\ÚzhF‡~Ëµ\Ó_ÊŠWYóm\ÔýCü\'\ÜÎ€ŸUvQ;\Ï.\Öøˆ4g\í\ëºx\ã¸J\ËJU[SK°\0\0\0\0<}2\ÔûW\èkkkµ\å\Ð|\r{N»Î…*§òŠ\ç\æU\íwU\ÔpK—n\ïÓœ\r¯hÖš\×tù\Æ•••«¦¦†`\0\0\0\0x\êúl¨·@___§=§V\ê£\Ðoi\×ùP7¤»Vû_&\Ìû_{þõ»G5mõµ \ê-]»yÁ{»˜`Á\Þ\æò\0\0\0\0ð4ô¹P\ï«\ÒÛŠôg®\Å\é\Ã\Åÿ¢ˆ¸a®B_õ½K~¥7]Y«‘‹¾¡•q£u+ó†\Ê\Ë+\Ý\ây¾Uñ\0\0\0\0x\Òúd¨onnVUu…[\Än\\øsº”µW•m\Ô[³bï‚º›Z±s„F-þg;·Sùª¬¬TCC\Õz\0\0\0\0ÀSÑ§B½»½ ­B~0a½†/ø\í½®’†•µd«´9Ke\Þ(mº­2o”6u<w¯›}#\Ë=v¾ï†·½\×\ì\Û6\Ë\Ëö\ïx\î½×’£Ô¢³šñ‚nzWWSU\\T\â\æ\×\ÛE\æ\Ö\0\0\0\0ž´>\ê-@WVVhÁ†756ü;ºz\ç Jš3UÐ\æTº‘\æne\×ù¼óµ=¦\Þÿ\Úo\Ü…÷Ž\ãŽW\ï½\Æ[*jLÓªÝ£4|Á\×t\èd¬\î\ææ©¼¼\ÜU\ëiÁ\0\0\0\0<i}&\ÔûW\é\Ï\ßØ«aó¿®u\Æ+½ô¼\î\Ô\\SNõU7\î\Ü{ô=¿\Ó\Íû95öx\Í\ïùý\Û\Ú{÷m\ï÷ù\éÔ­\Z\æ…ú±£•œzEE…ET\ë\0\0\0\0OEŸ\nõœ«««µ~\ïd\ršý—ÚŸ´R™••^ž\Ð1\Ê\ÎwŽ[\Þ\ëŒ2o\Ü{¼\å÷¹=¿\å{\ï\Þ\È(÷\í\ëw¬\Î\ã\Þ;NE‚RŠOj\â\Êhüòt\ê\ÂW­¯¨¨`n=\0\0\0\0\à‰\ëS¡¾©©\Ù\Ðåš·~ F.þ†Ž\ÞX¯›%§”\\tÜ]Frá±Ž÷\ï½Wh\Ûó\Û\æ\ØýûÞ¿\í\Çó\ÆõÂ£Z´\åM\ržóµ÷\Èf\Ý\Î\ÊVii©\ë  \Ô\0\0\0\0ž¤>\êm\ÎzCC£ K4)üGš¼ú\ßtü\æ&]\Î; Kw÷wŽ$\ßó\\{\Üw\ïý}n¸\Ïr\íq\ßÇŸ\çú¶\ß\çw¿÷»~–»WkŽ\Õ\Û3þB\Û\ãW+==S………-ø\0\0\0\0\0<)}&\ÔwÌ§oPQq‘\Æ,~A·½©“·6\ë|ö.\Ë\Þ\é=vŒ„{\çÜˆóžÇ¹ÇŽ\ç¾\í\â:?;ÿÀ6]\ÇN¿\ãw¼·\ãüB/\ÔE1qºy3MùùùnZ@SSó\ê\0\0\0\0OL\ß\nõuõ*,*\ÐG‹¾«ûF\êT\æ7Nglùø¹=f\Ü{\Ì\Üzï½­n›Ó™[\î\ß\'ck\ç>ûeø§Ë¶¾\í^Ô \Ù¥Û—)%9Uyyyªªª\"\Ô\0\0\0\0ž¨>\ê\ë,\Ô\èÃ…\ßÕªý\èd\Æf¿­\Þ8~oœ\èòx<=\Æ{\ã^ŸHÿø3{~\â\Öý\ã\ÏÒ»ÓŽ³Yo¬ñBý_+j\ÛR%ß¸©»w\ï\ê\0\0\0\0O\\\ßõ®Rÿœ–\ìx[GS7xÁÛ‚ö¦{~Ó½\ç›:ùñnÂ¹m\×\ào\Ý\Û\'½c?·\ï½÷}Û¹G¿\ã\Å]X\ä\Úï£¶-Ó\ë)„z\0\0\0\0ÀS\Ñ\'Cý\Ø%\ß×´u?Ö\ë«\\{ü\Éô\Í^pß¬“1\îù\É{\Ï-ðw<·÷b\Üp:_\ß{\Ìðms\ï8\Çxðó“^¸_wx¼Þšþ´)6œP\0\0\0\0xjúX¨¯óB}¡¦-ÿ¹F…þ³\â“\"\Üvgo\Ç>»‘µ]‹¶½\åV¿ß¼s•’o\ê\0\0\0\0OGŸõEEE\n¢÷fÿ¥v^u·©K¼³Ç‹¹Þ¸\Ó1:ß»÷~¢\ßgþ\Û\\ô\Û/ñN¼÷ÿÀv#7^rv¹\Û\éXøÚ¹o#¡\0\0\0\0ð\Ôô©P___¯\â\âbm?¾X\ï\Ìøm:6MWó\ëZÁ]-°\Çû‡½w½óù·\ë~Ÿ_\Ë÷½\ï÷:\ß\ï8÷Ž\ï\Û\îLú6Xô\r\ÍXû²Ÿ\Ø\ã…úd·ú=·´\0\0\0\0<i}&Ô·µµ©¡¡Aeeeº‘vIcC¿§\é\ë~ª„ÌºU~^i¥g:F\É\Ç#\Õ÷^w£¤\ç÷|û¥v\Ù\æ¦÷:\ê\Èd½7û¯3[gÎœ\ÖÍ›7UPP šš\Z577ú¿	\0\0\0\0Ð‡ô©Po•ðÊŠJÝ¹sG+¶¤!óþV\ÇnD\éNõUÝ®J\Ò\í\ÊK÷F’YU\Ãÿ=·½oŸ{\ïwls\é\Þv÷o\ã{žuoÿŒ²š¾ö§\Z³\ì;Š\Ý¥	‰JOOw\Ý65Àº	\0\0\0\0\0xRúL¨·¶võ\ÖæžŸ_ I\Ç]µ~\á\æJ.8®Â†T\å\Õ%+\ßyu)#ß{\ï\Õú½Wÿñûùn?\ß{\ãþým\ßŠ;»H\Ã\æ]Q“u\ä\Øa]¾|Y\Ù\ÙÙ®{À¦\ê\0\0\0\0ORŸ\nõ¾yõ¥%¥\Ê\Ê\ÌÒº\ÝS\\µ>ö\Ô\å\Õ$«´9KÅ™*±Ñ”\ÑñØ˜¡\â&\ßëŒŽGotn\ç\rû\Ü^7f|¼¯™÷F†®\ä\Ðøˆ\ç5y\å‹\Ú¿IgÏœSJJ\Ê}óé­›\0\0\0\0\0€\'¥Ï„zc¡¹±±Q•••n\Åù‹W\Ïh\îº.l_º½W•m¹ªh\ÍQEKN\çc¹ÖœûÞ·\×\å-~£›\×÷Fe\ëÖ§jy\Ü0}úM­Û¶@GŽVÒ¥$eee©¤¤„\Ö{\0\0\0\0ÀSÑ§B½U\ë[ZZ\\ˆ¶0•u[\'\ÏÐ´/iÎ†Wuý\îQ/ˆ\ç\ÞwüFN—×2rU\Ùfþ–¢L\×\è\Ðo)\"jªö\ïß§s\çÎ»òòóó;oeG•\0\0\0\0ð¤õ©Po:Ì«¬t¡:-\í–œÜ¦©+~¦i«¬\ÃWÖ¨ \îæ½ª}\×pÿh\Ãö-o\Îq	–\ï\î}ø¦ñÚ³w§N:­k×®uÎ¥§J\0\0\0\0xZú\\¨÷U\ëmn}yy¹[	?\åf²‹Ó¬\Õý4r\Ñ7¼ >B%	÷…ô‡ü\Ü{\Û\Üq\í÷¥M™Ú›°\\–¿ —|S¦jOüN<yRW®\\QFF†[ñ¾¶¶–*=\0\0\0\0\à©\és¡\ÞXˆ¶{\Â[•¼´´T999JINÑ‘“{´lópZôO^ ÿžV\ï£\Ë\ÙTÜ®ò\æl\Ø;ƒþ½ÇŽùô\Ù*k¾­\Û\åI\Ú}n©\æD½¦ÿQSWýDk·\ÌW|ün<qRIII.\Ð\Û}\émq<›\ßO•\0\0\0\0ð´ô\ÉP\ï[	ßª\ä555n~½/ØŸ>T\Ûö¬Ñœµojø\Âp\á|úÚŸi\Õ\îŸ®¤\Ûû”SyUù5)ºYpZÇ¯oTô‘iZ3PcÂ¾£÷\çþ½Æ…Oa\ë\'i\ë\Îõ:p`Ÿk¹·\Û\×ù½µþ744¸Ž;\0\0\0\0\0ž†>\êM\×`\ï«\Øß¼™ªK“tøD¼bv¬Ô²˜‘š¸\â\îþòƒgÿ­†\Îû;\\ôO\Zµ\è_4|Á\×5\Ä{oÈœÿ«–|Ks7ô\×ò¨éŠ‰]­½ûö\è\è‘c:wîœ›CŸ™™©\Â\ÂB\è­õŸ@\0\0\0\0x\Úúl¨7ª}\çY+¾Í±·[Ý¥§§{Aüº.$$\êø\éCÚµ?F\Ñ\ÛWhõ¦…Z±nŽ\Â\×\ÌT\Ø\ê\îq\Åú¹Z³i‰÷ù*o»­:xð€Ž=®3gÎ¸v{[\å\ÞÅ³9ô\ÖrO…\0\0\0\0ð¬ô\éPo|Á\Þ\æ\Ø[\Ý*\éEEEn½[·n\é\Ú\Õkº˜xI\ç\Ï%\èô\é³:y\â´N?yÿ8q\Ê{ÿ”\ÎxŸ\'œOp­ö)))\î>ôyyyn•{\ë°9ôz\0\0\0\0À³\Ò\çC½ñµ\â[°·Jºp«\Ú[»¼…{kOKKsAýúõ\ënXK½\r\ß\ë7n(55\ÕUù­2oa\ÞZú­:o]\0\Ö\r`\ßA \0\0\0\0<+ŸŠP\ï¯k¸¯¨¨p\éYÀ·û\Ú[{~w\Ã>³m¬\Êo•yÿ0o\Õyn[\0\0\0\0xÖžx¨·\Ðl!÷qYÈ¶ñ¨,˜?n\îz|_¸·¶|»§¼õªªªn‡}f,\È\Û>¶/a\0\0\0\0HO<\Ô_¹rE‡vÏ¯^½ªÝ»wkÏž=n\Øsk[\ïi¿Í›7?ò÷lß¾½\ÇcYU=..Î…o«ª[Û¼µÖ¯_¿^—.]r¯­\í\Þ¹\rß…\êVy÷\ÍÁ·\ç¾\áñ6h³\0\0\0\0ƒC½µ™[[úã° k«\Â[\à6[·nu\Ïma9[)><<\Ü=7¬7m\Úä‚¼m³f\Í\ZMš4I7nt¯·l\Ù\â>·¹\îÆª\é¶Orr²K–,Ñ‘#G:_[‹¼…ù;vhÝºu\î{ccc\Ý1gÍš\ÕyüÓ§Ow{þ6lÎ¼U\ä}¯}\0\0\0\0€`\Òc¨·J÷þýû\ë`Ô‚\\x>q\â„v\îÜ©\È\ÈH\Å\ÇÇ»±h\Ñ\"W½7VA·ê¹…vð			\Ê\È\Èpa;&&\Æx»]œ\Íy7¶RýÌ™3µm\Û6w±`Îœ9\îB€½^¹r¥{Þ•-tgß³o\ß>\ì\çÎ«\è\èhøsss{ü;\"\"\"Ü¹\0\0\0\0\0Ìº\rõÖ¢nzö\ìÙ®e\ÞØª\ïVù¶j»…}»}[WÀ:\äª\ï6GÝ‚´ôs\çÎ¹\æ\Ú\ìý\Ùû¢mÞº±[Î­Zµ\Ê] ðg!ß¾\ß\×o\Û\Ø{\Ö\n\ïûÌ·¿³÷‚‚W©÷µþÏ›7\Ï]°Çw\Õÿ\î¬]»¶³C\0\0\0\0\0€`\Õm¨·€mm\ê€­\rß†U\Æ-[¸·pnA¹;vAÀ¶UÂ­*o\Ú*\å6ö\î\Ý\ëng­\ì\Ö\ÞnA\Û.XU\ß\ÇBºU\ëCCCµk\×.7Ÿ\Ý\Ø÷Î˜1CQQQnX7Àò\å\Ë\Ýy.[¶\ÌÍ—7\Ô\íösö™‹Uø\í»­kÀ\ÎÙŽi‰‰‰=.\ÌgÇ·–~\0\0\0\0\0‚Y\í÷~­\ênÎŸ?¯+Vt~f•q›\Ó\î\Ü>Ö²nÞªü6o\Ý*ö\ÖZoûZ\è¶Vy«\Þ[ÿö\í\Û.<[ø·J½¯‚osò­\no¬¥>\'\'§ó;­‚nûÚ°cZx·‹\Öf\ï«\ÔûXp·ùûvŽ6À\Î\Çþ&vÁ\àa\í÷\Ö]\à›&\0\0\0\0\0@°\ê1\Ô[e\Û\×oú\r6t~f+\Ç\Ûüx\Ôþ¬-ßªø¶¯U\ã-HÛ¶öh\ì¹-¾\×uñ9»°t\éR·j¾n\Û\ÎøV¢7Vq·öyûö\Ü\æ\Ç8pÀ]\è\Z\ê-¼[0·Ê½\Û\Úñ­SÀªöó\ç\Ïw=±‹V\å\0\0\0\0 ˜=4\ÔûV±·\Öwk¿/..vAÜª\à«W¯\îvExkk·}m\ÞûÂ…]E\ÞÂ´µ\È[«ü…\ØÇ‚»UÇ‡\îV¼·\Û\Çue\ç`óù-l\ÛX¼x±\è6g\Þ­#ÀŸ}§ÿÉ“\']+¾]8v\ì˜¶\ï\ÃB½]\0°…û\0\0\0\0\0f=†zk‡Ÿ6mš\è6\Ï\Ý*\ß\Ò-œûWÓ»²V}\Û\Öö·VA·Vyó¾{¾û.X¥ÿúõ\ënõz/^tmú\Þ\í\â€o\å{cûUWWw¾¶‹\nvÁÀ\Øñ¬%ßŸ…ü\éÓ§»ó±Poó÷­[Ànƒ÷I•z\ÛÖ¦\0\0\0\0\0\Ìzõ”m^{~~~\çk[M>++K555\Ý\îcA\Ø\Ú\â=\êÂ¹m\ë»?½Í“·÷l~»\Ç*\ï\Ö\Âoó\ém?\ßjúV\á·J¼Í§·\Ïm\Þ|w\ì\"€£\'Ö–o¡\ß.\Ø\\|\ßñ­\Å\ßn»\çû»ºc•ÿ\Åû\0\0\0\0\0F=†ú_Dyy¹òòò\\UÝ¿\ÊnA\Ýn5góé­…\ß*ÿVY·\Å\êì³ž>0o\ß\Ç.ô´z½?k\å¿{÷®ûNc\Ïm\ß\î¦øXE\ß\Â?\0\0\0\0\0Áì‰†ú¾\Â\æ\Ý\Û|\0\0\0\0\0‚¡¾§Nr‹\0\0\0\0\Ìõ\Ý8w\îœ\â\â\â}\Z\0\0\0\0\0<¡¾¶R¿Ý«\0\0\0\0€`F¨ï†­\Ø\è\Ó\0\0\0\0\0\à¡õÝ¸víš¢¢¢}\Z\0\0\0\0\0<¡¾)))\î\Þö\0\0\0\0\03B}7\Ò\ÒÒ´fÍš@Ÿ\0\0\0\0\0E¨\ïFzz:¡\0\0\0\0ôõ\Ý\È\Ê\Êr¡¾½½=Ð§\0\0\0\0@õ\Ý\È\É\É\Ñ\êÕ«\Õ\Ò\Ò\èS\0\0\0\0 G„ún\ä\æ\æºP\ß\Ô\Ô\èS\0\0\0\0 G„ún(22R\r\r\r>\0\0\0\0\0zD¨\ïFQQ‘õuuu>\0\0\0\0\0zD¨\ïFYY™õ555>\0\0\0\0\0zD¨÷³c\Ç-]ºÔ\éÓ§kÙ²e\nWXX˜«\Þ\0\0\0\0Lõ~Ž;¦>úH\ãÇ\×Ä‰\Ý\ãÜ¹s]¸§\0\0\0\0lõ~***4{öl\è\'Mš\äªõ¡¡¡:yòd O\r\0\0\0\0€ê»ˆ‹‹\ÓØ±c]°_´h‘«Ò———ú´\0\0\0\0\0x\0¡¾‹œœMž<\ÙU\ê­J¿k×®@Ÿ\0\0\0\0\0\Ý\"\Ôw\Ñ\ÞÞ®u\ë\ÖiÂ„	š1c†rss}J\0\0\0\0\0t‹Pßk×®iô\è\ÑZ¿~½ù\0\0\0\0\0#B}7\Z\Z\Z\\ë½…{\0\0\0\0\0‚¡¾•••jmm\rôi\0\0\0\0\0\Ð#B=\0\0\0\0\0½¡\0\0\0\0€^ŠP\0\0\0\0@/E¨\0\0\0\0 —\"\Ô\0\0\0\0\ÐKm¨/«mÔžk9\Z{A/,= ¿š¹C:u[Ÿ>m»¾1¬;¡\'o\êF^y ÿû\0\0\0\0½@Ð…úÒšF\Í\ÞUÿc\\ŒBú‡)\ä\ÕP…¼¾L!ox\Ï„÷\ÍñFx\Ç\ßú\ÚR…¼ª\ß\Z²Z?]qX³Kýs\0\0\0\0\0‚XP…úøkwô¿&n\é·#ô\çSc5lóym8“©C7ò•˜Y¦Ä¬¾5.z\ãô­b\Å^\Ì\Ñ\Üý\×ô\Ý%ô\Û\ÃÖº‹¿1(R#¶žWMcK \Z\0\0\0\0@\nŠP\ß\î\Ð#\ÉúõA«\Òo™þvöN\Å^\ÊVEfÛ¼Ï½‡V\Í}w´Yno•š›¤ë¹•zo\Ó}\á½H\ïÿc©¾½dŸò*\êý3\0\0\0\0‚LP„úe\ÇR2 BŸ}s¹FoOTUm«Ú½€\Û\Ø(\Õ7|ºFƒ7Z¼o¿u\'¸i¯†\ê\ësw«²¾)\Ð?\0\0\0\0 ˆ<\ÔH¾«\ß©Ï½¡%‡S\\U¾©)ð\á:†U\îS\îV\éO&osÁþõµ\'\Ô\Ü\Ú\èŸ\0\0\0\0$\Z\ê«šõ§S¶¹ó¶^P›b>…\Õù‡\r«ØŸ\Ï(\Õ±\Þ-¨·õbV 2\0\0\0\0@	h¨_r\ä†ô_±C\å\Õ-T\è{¶®ÀÂƒ\É\î.\0_™\Ë\Ây\0\0\0\0\0\'`¡¾ª¾Yÿ{òV}öpEŸ\Ïr­\æ\ÏÁ:lm\ÒJ\ëj\Ø\îû0m¡Z\0\0\0\0P\0Cý±\Ô|}f@¸þh\Â•xµ‰¶û‡»\è1m\ÏwûŸ­<¨Ÿ\r\0\0\0\0D\êg\ì½\ì{sý)7o<Ð¡9Ø‡\Ý\Ò\ïTZ±~í•ú£‰›UQ\ÇJø\0\0\0\0ði°PÿR\äQ…¼¶TËŽ\Þ$\Ô?Â°õrŠô\ß>Ú¤\ß²Z·\n+õ\Ó\0\0\0\0‚DÀBý¿.Žw¡~û\Åµµür÷]1¿ñ1\æ³\ïx\Ü\ïùEöyØ±ªj\Ûô\Çv{»º|§4P?\0\0\0\0 H,\Ô}\Þ.\ê\'üR¡¾®¾]•U\îÑ‚os\Ëý£©¹‡€\\Ý¬¢\â*5<b°·\í«kZz®¤7w;¶\ÝJ\ÞFeU“ûÌž·<\Ûõ5{\Çÿ\êô\n\é¦‹\ÙÅú\é\0\0\0\0\0A¢W‡z\Ée\åõš4iª²s\nUPX¡¥Ë–kÁ\Â%Z´h©\æ\Ï_¬M\Ñ[;¿/x·µK©i\Ùzÿý*,¬t\Û÷™¯z\ß\Î\Û;\Îwó–Ú¶}§{nïµ´~¼]Ii­\æ\ÌY\àó¶÷¼FGŽž\Ö\ÉSg5a\ÂdEF®×‰“gt\æL¢ù¿L°\'\Ô\0\0\0\0üõúP_\\R­w\ß¬ôŒ\\%\'g¨_¿þÚµ{¿ö\í?ª+\×jÐ ÁÞ¶\í\Ê\È\Ìu\á\â\Ä)š6m¦&Ož¦o~ó[\Z:t˜fÌ˜\í^;Q1›c]`·\0~\æ\ÌE8pLGŽ\×\è\Ñ\ã4n\ÜD/°w\ï;—\ä*÷vuõ-.ð¿9ðm>rR‹—,Ó’%azù\åW5r\ä‡Z´x©Vyá¾´¬–P\0\0\0\0xbzm¨·\Öú\ä”L½ó\Î }\ç;\ßÑ ÷†\è\à¡\ãz\íµ\×]…~ñ\âe\Z?~’y\ß\Ým®‚~úL¢.$^Ö²°Z½zƒ.]º¢C‡Oh‚ô9¥3guóf–õ·³ô\ê+¯iò”\éš;o¾\Þxc€|Kó¼\ç\ã\ÇO\Ö\ë¯÷WAA…«\ìÛ¹˜ó	—u\'·XQQ1š9k®^z\é\×\r0s\æ\í\ß\Äu\Ð~\0\0\0\0xRzm¨\ï˜ß¤\É\éz\ë­wu)\é†nÜ¸¥þý\ßÐ¦M[µeKœöV‰¯­ks­õ\æ|B’·\Í\0]¾’\â^\×Õ·º\Öy«\ÂWTÔ¹\àm\Ûff\Þ\Õða#•—_\î½nSx\Ä*-_±\ÚðmÊº¯a\ÃFxŸ•¹c¯\\¹VS§\Î\Ôñ\ãg•xñš«Ò‡…­p]}4\Ö=·‘••÷X‹ó\ê\0\0\0\0\ÓkC½¯Zoó\å­J¿s\×>]»~Kk\ÖD¹yõ\ÂC—F¸¹ð\Å%5®E>fóv½ø\ãŸhÁ‚%nq=Weo•Ž=­Q£>rUõ‚\Â2µx\Ç\Í\Î.t\íóvQ\à\Ã\Ç\è\ç?\É/\ëC/¤¿÷\ÞÐŽJ}a…\Z\Z\Ûu>\á’fÏ™¯Y³\æ*5-S«V­\Óü‹µhñ2-Xª…\ÞØ¸q‹\î\æ•\ê\0\0\0\0OL¯\rõŽóJ]ˆþù4êƒ¼P=O“&O\ÓG£\Çj\à›oiê´™n±º½û«¨¨\ÚÍ™¿r5\ÙmgA\Û\\ºtÝ…÷Ì¬\\Í·P;\âöª½½£R?\ÌùV•¯ª®u\Â\ÂWªº¦V7So\ëý÷‡+/¯Ì‡9t\è„fÎœ\ëžO˜8ÙE‹CµxI¨»0°ys,\í÷\0\0\0\0€\'ª×†z«\Ò_½–¦±\ã&\ê•W^us\à/z}©¾¯^K\Õ;ï¾§KIÉº~#Í­o\íúµõ\í.X\ß\Í+v\è…{!\Ý\æ\ä\ï\Þ}@¶È½µ\Ò\Û\âw\Ö~ûvkŸŸ;w¡–…Eè­·\ÞqÛ†…-\×\ÌYsô\Æ•_P\îB½­’¿o\ßÍž=\ßým\ï\á\æé»¶ûðz\×û®\È\Õ\ë\Ýv„z\0\0\0\0À“\ÒkC½¯Zo!\Ü*\á9wŠ½M#F~ Ì¬<\×.?f\ÌxMŸ>[yy¥n[¶žx»\Õ\Ý_üùŸ\ë•W^ó\Ây‰{\Ï.øn}g	†¦­[\ã´ÿ!Wý·\ã\í\ß\Ø}µ\äUv†z[¤\Ï\æ\Ù\Ç\Æ\îÒˆ£\Ü<ý\r6)*j“{mó\ê\0\0\0\0OR\ïõ^\0/-«ss\Üm¡<›\ßÿ®ßž\Ûý\ãm\î|Mm«\Û\ÞnSw\îüE·z½U\á\ã\âö¸\ÛÍ½\ìû\Õk\Ö+\í\Ö\í\Î{\ÚW×¶¸J|Ó½•\íWE®ÓšµQî¹½góô­²oÇµ°¾mû.}\ík¯-[\ã\Üüü3\æhw\Ìõ\ë7j\è\Ð\ánB=\0\0\0\0\àIêµ¡Þª\é\Ù9\Z>|”»m­xos\åmžý”)\Ó5ðÍ·\ÝgC¼Ï¬\Í\Þn5÷\î»\ïiÀ€7±<\Ò-r\çelW¿x\ÕÝº\î\å—_Q\ä\ê\r®š\ï\ë°G{m+\ßûsÿ\ï\ìññ‡\Üb}Vñ>r”[•\ß\ì\Ý{H¯÷C»÷\è<.¡\0\0\0\0ð$ô\ÚP\ßqK»f¥\Ü\Ìr·–³ª|iY­\Ø6ìµµ\ä\ÛBw…•®Mÿú[n~½Í«÷\å¶-¬\Ûö¹wKÜ±»~×Ü’n?ó\ß\Æ.4\Øqo$g¸{n\ßýFºûþžö%\Ô\0\0\0\0~½6\Ôû‚´x\Ïö\Ü?¨\ÛsÙ¾ \í«¨?\ì–rþ\Û>\Ð\ê\ßôð}»\Ç\à\ÝmóZôKzB=\0\0\0\0 «€‡ú#¿D¨ÿ´\rB=\0\0\0\0À_ÀBý?-\Ü\ãBý\î+¹„úG\r\r·\äû³)\Û2 \\I9%ú\é\0\0\0\0\0A\"`¡þ\ß\"¹P¿\ê\Ô-µ\ê?q\ØJÿùeMúÿ\Æ\Æ\è\×\Þ]¥\äüŠ@ýt\0\0\0\0€ °Pÿ\áö/Ô‡\ê£m‰\Ò/y«·O\Ãhi–.gWè·†®Ñ—FoRaU} ~:\0\0\0\0@X¨Mº­~\Ëô7³vª¶¾\í‰,$×—‡\ì¶z\'\ÒÜ…o-Þ«¶öö@ýt\0\0\0\0€ °PŸWQ§\ßý`ƒ~\ã\ÝU:™ZÄ¼ú‡Œ7\Úõ\í\ÅûÜ”…E‡¯\êg\0\0\0\0‘€…z34\æ¬B^\rÕ‹‡\Õ\Ü\Ô^ ƒqX•~\×\å\\ý\Ê[\Ëõ{D)·¼6?\0\0\0\0 H4\Ôg•T\ë‹#\Ö\ëso.W\Ô\ÙL\æ\Öw3\ìbGAy£¾2-Öµ\Þ\Ï\Üw%?\0\0\0\0 ˆ4Ô›ù¯¹û®q\Ä:J+\"\Øw	ô5õ­úÉŠ£.\Ð\Û=\êKký“\0\0\0\0‚DÀC½-ø\Ö\í	×†ÿ_?ˆ\Ò\îË¹®\Ý\Üm Cu †-\Zhÿùe\rz1\âˆB^_ª\ß¹A\×\î–ú\ç\0\0\0\0‘€‡zSYß¬Ÿ,÷\Âk¿¥úõA‘úpûe×ª\Ý¶\í÷~c^\ßB|“÷7¶6Ë…ùºúvmK\Ì\Öÿ™²\Ý-Œgó\è§\äúg\0\0\0\0™ õ¦¹µMcv$\êW\Þ^\áªöÿmô&\r‹9§\ÝWru3¯ZE\Í^\ØU\ß^¨¯¬i\Õ\í\âzK/Ñ¢C\Éú\Æü=\n\áý\ßÌŠ\Ó\ÕÜ²@ÿ<\0\0\0\0€ 4¡\Þ\çXj¾¾e·n{s¹B^Y¢\áú\á\ëô%/\äÿ\áø\Í}r|ylŒ~w\Ô}~\Ð*\ïoUH¿e\Þß»Q]WuCs \0\0\0\0@\nºPoZ\Ú\Úu\Ô÷ƒ£\Ï\è¯g\Æ\é‹#\×\ëW\Þ]\éýˆ>9þ\Ý\Û+ô[C\Ö\èNØ¬†\Òò7UT\Õ\èŸ\0\0\0\0\ä‚2\ÔûkhnU~e2Š«”VX\Ù\'GzQ•r\ÊjTQ\×\èÿn\0\0\0\0@/ô¡\0\0\0\0\0tP\0\0\0\0@/õ@¨/++SNNŽ²³³u÷\î]µ¶¶v~VUU¥¶¶¶O<hss³jkkù$\Z\Õ\Þ\Þþ\È\Û\0\0\0\0€nBý\æÍ›µ|ùrmÚ´I;w\îT}}½\Z\Z\ZT^^®U«V\éÖ­[ª««SuuµŽ;¦={ö¸qþüù\Îc\ä\æ\æºcX°/,,\Ôñ\ã\Çuò\äI7Nœ8¡\ä\ä\ä\Îm\íX\ë×¯w\ì\"\ÂÞ½{u\àÀ<x\Ð=\Ú\Åc®\\¹¢7n\è\êÕ«JKK\Ó\îÝ»Ý°\ï·\Ç]»v©¤¤\äü·\0\0\0\0x„z\Øœ­rnUy{´°l~ñ\âÅŠˆˆp\Ï\ã\ã\ã]p¿p\á‚6n\Ü\è.»`A>66Vqqq\Ê\Ë\Ë\ÓÑ£G]˜·±u\ëV­Y³¦óû,¨û^\ç\ç\ç\ëÌ™3JHH\Ð\áÃ‡5e\ÊÞÇ¾g\æÌ™Š‰‰q\åÊ•.\à\Ûy]»vM\á\á\á\Û\0\0\0\0\Ð\×=\ê7lØ ”””ûÞ»sçŽ¶mÛ¦šš\Z®m›ôôt÷h­ö\Ñ\Ñ\Ñ.\\{\ß^[¸÷U\ÙýÝ¾}\Û]80¶\ïÚµk]·\àŸ••\å\Þoiiq\ÇØ¾}û}ûZ›~dd¤\ë\È\Ì\ÌTXX˜Îž=«%K–¸G»\à`O‚“ý½\0\0\0\0\0«OõV©¯¬¬\ÔÒ¥K]H?wîœ¢¢¢TTTä¶µpm{_\0¶P\í\íÝ±\Ð\ïûüÒ¥Kš={¶k·\ãWTT¸`ox\ìVy¿yó¦\ÛÖº¬`ÅŠ\î»-t‡††ºŠýÂ…u\è\Ð!W±\ï\Z\ê¯_¿®ŒŒŒ\Çþ±ó±¿\r\0\0\0\0€`õ‰¡\ÞÂºµ»[5\Ü\Âû²e\Ë\\\à¶öz«¦[Û»½g\Õsc¡ÚŽ\ÑÿPo¡\Ù*ô\ÖRñ\âE\Ð-\È\Ûs\ß\çö½v>ø­\íÆŒ.ô\Û<}«\Ú\Ûgöý6O\ßjj\ê}\ßg\ëœ>}ú±ÿc\ìoµ®\0\0\0\0\0‚\Õ¡\Þ\Ú\áý²³\nyAA«x\Ûüw¤­jo\á\ÜºÛ±c‡Ž9\â¶œPo,À\Û\\y«\Â[\å\Þ\æ\Ô[uÞ†\Í\í·\Åõ¬2ov¶m\n@qq±û^›£?w\î\\÷h¯\í}¶ˆžµ\æ?.B=\0\0\0\0 \Ø=\êm:›C\ï/))Éµ¶oÙ²¥³joÁ\ÞÂ»\Í·U\ë-\Û€\Ç	õšm1<ku·\ãZ\Õ\ß:\0l\á¼Y³f¹•ø­zos\ïÍ©_½zµ[]ß‚¾Uò}6§\ß^[E\ß¡\0\0\0\0\ÐW=\ê»có\è\íVs>\ëÖ­s!\Ú\æ\Ö\Ûx[\Õ\Þ\ê}\èõ\Ä?\Ô\Ûm\ì¬\Zo·¡³9ò¾~»¨\à¿B¾±[\è\Ùmól¾µ\èŸ:u\Ê-\Þg«\îÏ™3\Ç=\ÚE\0;¾?B=\0\0\0\0 ¯z¤Po·˜³ù\ë\Ö*oÏ­2nr\Òv?y÷¾\í>©RosÞ­\Å\ßX˜÷-¼g!\Þöµ\Û\Úù¾ÃžÛ°û\Ý[»¿¯šo÷•——»a\ï[È·\0n	,üû³[\ï\ê\0\0\0\0}\Ñ#…ú\Ä\ÄD\×\"o\Ù*\ßÖŠos\ì-Œ[\àö÷°Poó\å,X\à\Ç3v‘À\Ú\ímŸ¦¦&\×\r`\ß¾-Šg}{\î?\Ç\ßX;¾¯Mß¶·\0n\Ïm\Ø1\ìB€Í¯ßµk—;W«ð?.B=\0\0\0\0 \Ø=R¨·{\Î\Ûð±j¸½.--u\Øu\Ý\Ö½ëŽ­¤o\Õù\Ö\ÖV÷º\ë¾\Ö-\ÜÛ£\ï¹\r\ßö>¶ŸÍ¯·v}þ\Ïm{û«\èÛ…» \Ðužý£ \Ô\0\0\0\0‚\Ý#…úO#B=\0\0\0\0 \Ø\ê{@¨\0\0\0\0;B}õ\0\0\0\0€`G¨\ï¡\0\0\0\0\ìõ= \Ô\0\0\0\0‚¡¾„z\0\0\0\0@°#\Ô÷€P\0\0\0\0v„ú\ê\0\0\0\0ÁŽP\ßB=\0\0\0\0 \Ø\ê{@¨\0\0\0\0;B}õ\0\0\0\0€`G¨\ï¡\0\0\0\0\ìõ= \Ô\0\0\0\0‚¡¾„z\0\0\0\0@°#\Ôûikk\ëê³²²:_···úô\0\0\0\0\0¸¡\ÞÏ–-[4þ|-Z´HS§NÕ¼yó\Üs………>=\0\0\0\0\0\îC¨÷s\ê\Ô)=Z&LÐ¤I“\Ü\ã‚\\Õ¾¡¡!Ð§\0\0\0\0À}õ~ªªª4w\î\Ü\ÎP?c\Æ-Y²DgÎœ	ô©\0\0\0\0ð\0B}{ö\ì\ÑØ±c5q\âD-^¼Xaaaª¬¬ôi\0\0\0\0ð\0B}w\ï\Þuó\é-\Ô[•>>>>Ð§\0\0\0\0@·õ]\Ø*÷QQQ®Z?}út\å\ç\çú”\0\0\0\0\0\è¡¾)))nÁ<÷\Ü\Ê\0\0\0\0¬õ\ÝhjjRDD„’““}*\0\0\0\0\0ôˆPßƒºº:µµµú4\0\0\0\0\0\è¡\0\0\0\0€^ŠP\0\0\0\0@/E¨\0\0\0\0 —\"\Ô\0\0\0\0\ÐKõŠPow•kikSsk\ß­m\Ü:\0\0\0\0ðx‚6\Ôß­¨\ÓÆ„½³ñ´¾>w·þ\ç„\Íú\ïc6õ¹ñ%o|y\\´þbz¬~qHs\\\Õù¬bw!\0\0\0\0€‡	ºP·¼Ncv$ê¿ŒŠRH¿¥\ny5T!\Âõ™·–\ëso¯\è{\ãú¬÷20B!¯/S\È\ËKô«\ï¬Ô·\ïÕ±Ô‚@ÿ\0\0\0\0€ T¡>&1S_úh£òŸó‚­U\è\'\íJ\ÒÎ¤\\%d”*5¯Ziù5}n\\»S©\Ã\ÉZq\"U?_yT¿÷A”B^\Õg\ßZ¡\ëOª¬¶1\Ð?\r\0\0\0\0 E¨·ù\ä\Ó\ã/{!v¹Bú‡é›‹öz!7_uõm’ýk‘Zš¥\æ¦>:¼¿­µ\Ùþ#:þÖ¬¢:½¨\ß~­\î—\ê\ï\ç\ìRfqu &\0\0\0\0@	ŠP?{ÿU\æ?ÿ\ÎJÍˆ¿ªú†vn\Z\å=ÿô\rúv1\ã\\z±þdò6×¹ð\Õ\é;T\\\Ý\èŸ\n\0\0\0\0D\êw\\\Î\Ö\ç\ß^©_{{…VŸJw\Õ\ê\ÆOi˜\ï:Ú½ÿ‹\ÛÅµú\Ë;\\°ÿñò\Ãjhn\rôO\0\0\0\0\rõ\åµMnU{[ nò®\Ë.\Ð7A˜¦aWr*ô_mžý\ëa\Úp.=?\0\0\0\0 ˆ4\ÔÏ±¶û×–\ê\ï\æ\ìRum+ú†µ\â‡KUHÿe®¿¢¾)?\0\0\0\0 H,\ÔW\Ô5\é\'l\Ö\çF(öbŽ«\Ò:<ë°‹\Õ-úªµá¿¾LQ\ç©\Ö\0\0\0\0\ê¥\ÜU\È\áú\ã\É\ÛT\æVªôv\Ñcö¾k\ny%T/.?¨Ÿ\r\0\0\0\0D\ê§\ì¹\ä´ñUúG­-\Ò\Ùô}þÝ•ú\Ãñ›¹w=\0\0\0\0 p¡þg«Ž¸ùô6W¼Pÿ‰£©IºSÒ /Þ¤/^­´\Â\Ê@ýt\0\0\0\0€ °Pÿ/‹÷ºP¿\ã\Ò·\Â{\×\Û\Øô\à{s\ßzÛ¿¹\å\ãá¿¯}ö¨\Ç\ê\î<z\Zs~;\ì\ØÕµm÷­¡\ËwJõ\Ó\0\0\0\0‚DÀBý?NVH¿e:ž\ÖN[Z?Ðµum*(¬t¾a¡¶¤´F\Õ5-Ÿž\íóü‚\n%%%\ë\â\Å\ëÞ¸¦²ò:w|ùåªªn\î÷M\Í÷_\0ð§¶®\ÕÇ¶±m\Û\Ú\ï­m÷oeUS\çù\Ù\ß\ã?\ì;|\çfûùŽa\ßgŸù\ÎÁ÷\Ø\ÝÅ„fï³¯Nß¡þaº˜]¨Ÿ\0\0\0\0$žI¨ommUjjª.\\¸\àÆ±£GôÂ‹?\Óü\ÑH-\ßvP\ç\Ï]\Ð\Ùs—TXT\éBmQqµ\ÆO˜\äW­Z§}ûŽ¨\ÝÀ“&MS¢\Ð[>¡]\ßBsL\Ìv½òÊ«š8iªÆ›¨ŒÌ»^oTiY¦L™®˜Í±^Ð¯QyEƒ¶lÝ¡–há¢¥Z½zƒ·M\Övaðà¡º”tÃ\Ûú\r\ÑZ·n“Ö­\Ö\Úuµk÷~wqÀwa`\êÔ™:}&Qyùe\n[©eË–{+\Ü\ãþýG\Õ\âÓŽ}\à\à1\í?pLñ{\é\Ô\é­X¹Fó\ç/r\ç`c\îÜ…:s6±óB\0¡\0\0\0\0Ðg\ê+++õ\æ›oj\âÄ‰^`«ùó\æ\êŸ_z[ÿã»¯\éý1“½÷\æ\ë\ç/½¬Ý»xaºM\É)™\Zô\Þ`\ÝL½\í}¶@;v\ìq\Ç1\âO¸\ìžw\r¼]CýÚµµ\Ì\Ôv ®¾Ý…ôh/\è¿ýö õ\ï?@¯¿\Þ_o½õŽ/^¦Aƒ†¸\í#–G\êµ\×^WeUƒªkš”‘™£\Í^øúþpwQ **F\ë½@oK—F\è7º°oß—š–­\ßr\"\n\nËµm\Û.mß¾KÛ¼ñü\ßs\ìÂ„u	„.\r\Ó~ðú\à#­Y¥÷\Þ\âÂ½}÷\Öm;5{\Î|…G¬z €P\0\0\0\0ð÷\ÌB½…y{ô8r¬>û\ãI:˜\ÒN7nÚ¢c\Ç\Ï\êvv†¦\ï~÷93Nc\ÆL\ÐÎû¼@Ü®>­£GO+ng¼/^\ï1\Ø[¶ŠzXøJ\×\ân•ô†&¹\0>{\Î¥¦\ÞViYµ&L˜¬+Wnj\ä\È•ž‘«·(44ÂO\Ö\í|}ø\á7\r\àÊ•7À\×2o,œ\Û~…²·\ì\âÀ¦\èm:|\ä”bc÷tþ«\"\×\é\Ýw\ßS]}Kg»¿1b”®^KS~~¹»¸°ukœ^}µŸ–¯X­‰§¸ÿP\ï\Úö[	õ\0\0\0\0€=“Po¼ªªJ“&Mòû\Z5J\Ï?÷œþ\ì_¾¯\×\ß¢·\ßz[\Ûcw{¡·\Õ°m\Ê\È\Ìs\Õñ\ìœB-Y¦Ÿü\ä§^h^ª¡C‡\ë\Ç\Þóñ\ã\'zø\æ#…zÿ`\\SÓ¤±c\'¸\êù¥K7ô¦÷½E^Ð·€‰W\Ýñ/{Þ‚{fVž\Þ%¥µT\Ì-œÛ¹\Ù~öù\Í\Ô,}ÿû?\Ð\"\ï_ñ‚ù…\ÄkÊº\ã\çd\rð¦\Þ|ómmÞ²\Ýö­nÿŠ\Êz\rü¾Nœ8\ç:\0¬Â¿f\Íýü\ç/»)\0vñ\Â.ø¾·©Eºv-M{v\ï\Ó\ß\Ì\ÞM¨\0\0\0\08\Ïl¡¼šš\Z/4URR’òòò4ðAú÷?©\Øs©Š_¡+\Öt.W^Ñ¨#?\ÐÕ«©š={ž\"\"\"u\'·À…\è={º°\Û\ÜÍŠùõv`Þ¼…®õÞ†\íW^y\Í{o‘†¦\ã\'\Î\ê\í·\ßÕµ\ëi¡~¤w\Å%5,Z\ç\ê‹Kª]wÁ¦M[ô\Æ\ÜEˆø½‡]˜_³6\ÊU\ØóòJ\ÜwDF®WMm«¦L¡o}\ë\Û\ê\×\ïuo›®ýÿ\ä©·]p°)þ\í÷­\Þù\Ä\Ç\Ò\Ä	õwóö\ê\0\0\0\0\Î3õµµµ^h Áƒk\ìØ±zþ{\ßÓŸü\ëõ\æQzù¥—µz\Í¦m>º\Í3\á…ï¹ªú„	S\\7£F}¤„W¨œw\êmÁ»Ð¥\ÛZ¸¾“[\ìZü<\î«;r\ä”\Î4|øH¥\Ü\ÌR\\\\¼k\Éojn{\äPo\í÷\Æ.Xp¿~\ã–NžLÐ†¨\Í:tø„ûŽƒ‡Ž¹ùü\Ö`û–Wt,Àg\çRT\\¡ððUZ°`±~ô£5nüDw¡Á¡<õ¶X\à\Ô)\Óõ\0\0\0\0€N\Ï,\ÔWWW{\áy¸._¾¬üü|\r|·£R¿\ã\\šV.\ÔÊ•k\Ý\Üô[·\îh\ê\Ô®\ês§H‹-ÕŽñ\î\êÏO\ê\\ü®§PoUüƒ‡NhOüÁÎŠ¾\ícÁû¥—_\Ñ\ä\É\Ó\Üw¼üò«^ð>©>­\ä”w;:«\Ögf\å»\Ðþ(¡¾ca¼\n½\â\ë§?ý¹ÆŽ›\à}\ï!wAÁ.X[þøñ“ÜŠöwóJ]P76ÿ¸\ês\î\ä\ëüùËºp\á²ú{³­ÚŸp!\É]dð}/¡\0\0\0\0ÐgZ©\ï×¯Ÿ\Þy\ç7§þ¹\çŸ×Ÿý\ë÷õÆ»\ï\ë\Å½\è…ú5®ªn¡·¬¼^#G}\è¶³Po«\âõ/]Wj\Úmw¸‡µ\àûªó¾\ç\êmÞ¼\ÍW÷Y¸0\ÔÝ–\î£\Ñc]¸·\êý«¯õs\íôŸ\êí‚ƒ…úÂ¢*•–Õº€ž‘y\Ç\ÝþÎªü\ÆþŽ÷\ß\îŽa:¦4\è\ØñSî‚‚­voýÙ³\çk\Æ\Ì9ú\áÿÍ­ˆ?u\Ú\Å\Æ\î\î¼u¡\0\0\0\0Ðg\ê\Z\Z­\ì\ìl•••\é­Aƒõ…û@»3uò\ÄiŠ-ô64¶+÷n©[(//¿\\3f\ÌÖ´i³´{\Ï·¸\ÜÙ³—\\Ÿ4i\ê\'¶\áû\È¸ûõë¯­[wh{\ì½ó\Î w¯x[a\ßnU7f\Ìx\×\Ð\Ô\Òþ\Ðö{;G[-\ßV\é/*®RII•;§©S§{\ï½ïŽ™v+\ÃÝ³þõ\×\ßÐ©S	JII×\ÜB\ïo+\Ñ,/\Äïˆ‹÷^¹\×\Ù\Ùº{·\Ø\Íó?xð¸\î\æ\ëÎb7ÿ\ÞW\Ù?p\à¡\0\0\0\0pŸg\ê»\Z4l„>÷\âxºY\ê^[ ·\0kò¡\ïp+Ï—–Õ¸\Öx›ó¾s\ç·ð\Ük¯õs\Ý\Ù\ÂrŸT©\ï\Z\ême{»m\Ü\Òe\n_\î\î3¿ÿÀQ=Îµ\æ\ÛE_·€…ú>ø\èPo\ßy>\á²\ëS§\ÍôŽ\Û\înM7e\Ê<t\\•UõÚº}§†\r\éZ\ì-\äÛ£½¶vv|û{¹z½†\æªþo¿3\È]\Ì\æý½ÖºŸr3S\á+5w\ÞBwAcÖŒÙ„z\0\0\0\0@§€…úoÏˆ\Òg^Y¨\ÃÉ…jkù¸]\Þ\æµ[¼¸¸Ú½¶\Öö††Žû\ÃÛ½\âm^º\Íc\ïZ=ÿ¤aÇª¬jr-ý6w\ßFiYk‘¿]\è>óµ\ëû¶½•ž\ëª\å]c-ôú+*;÷q!½­£5\ßö±ý«ª›\Ü\ßcöÚžw=/{\ßÎ¡¼¢\ÞÏŽ]\æž7¨\Â{~\ê\Ô>rJGžVFz¶þj\æNB=\0\0\0\0À	X¨ÿ\Úü\Ý\nym™\ê:C½oX%\Û\Ú\í\Ñ?l\Û\ë\Ç\rôþ\Ü_ß±ý¿\Ã[\ß\êó\Ý\Ç>ëºÿ\ç=\Ç\ÙÖ†uXE\ßF[›ô\Õ\é;õ\0\0\0\0\0\'`¡þ\ëóvy¡~i·¡ž\Ñýhn&\Ô\0\0\0\0>°Pÿ\Ï÷¸P¿\ër.¡þ†MA¨­o×ŸMÙ¦JºS¨Ÿ\0\0\0\0$\ê_\\~È…ú•\'o©Pÿ‰£±Q\Ê+k\Ôï\Ö\ç­RJ~E ~:\0\0\0\0@X¨³\ã‚\êC5rK‚ô·¦û´Ž–f\éRV¹~sðjýþ˜M*®n\ÔO\0\0\0\0õ»®\æ(\äõeú\êŒª®ms•\è@\ç`j•–½©WCõ\\\è>·z?\0\0\0\0\à\Ó-`¡¾°ª^ÿ\ïGõù·W²X\Þ\'[¿®¾Mÿ´ \ÞMY;ž¨Ÿ\r\0\0\0\0D\ê\Í\Û\\\åùù¥\Ô\Ø\Ø\Þ\ã-\â>\íÃªô[.d\ë³#ô¥Ñ›TPUÈŸ\r\0\0\0\0$\Z\ês\Ëkõÿ|¥70\\+N¤1·¾›as\ésJ\êõ¿\'muUúE‡¯ò\'\0\0\0\0‘€†z~<EŸ®\ßºFû¯\ç¹`\ßa:†úòšf\×\É`\r_›»[•õÍþ\É\0\0\0\0\0A\"\à¡\ÞŽ>\ëª\Ðÿiø:EŸ\Ïró\ë-\Ð:TjØ¢vq#«°V\ß^¼O!ý–ê¿Þ¤[…Uþ©\0\0\0\0\0A$(B}]S‹¬;©þaú\ì\Û+ôN\ÔÝ¼[¥V+J·vü¦¦Ž\ãú\â°\ß\ìý}v1\ÃþÞŠšV­9}K0n³»\íß—\Ç\Æ\èlfQ &\0\0\0\0@	ŠPo\ÚÛ¥™û®\è7ß‹t­\æÿi\Ä:õ_{B›\Îg)\év¹rŠ\ëUVÝªò¾6¼\0_XÑ¤”»\Õ:t#_“w]\ÖW¦\ïp8B^\Ó?/ŒWzz\0\0\0\0Àƒ‚&\Ôû\\\Ì.Ñ‹\Ë\ëW\ß]¥WB]°ý‚ôgø:ý\î¨\r}r|q\äzý‡¡kô™·–+\ä\å%.\Ðÿ¯‰[y*M-mþI\0\0\0\0\0A*\èB½O¢\î\Ç\íLÔ¿,Œ\×ï‰v¡÷\×­\ês\ãó\Þø\Â\àHý\ç‘ô•\é±z}\íqE_\ÈTU\â\0\0\0\0.hC½O[{»*\ë›TT]¯üÊº>9\ì¾ó¥µªon\rô7\0\0\0\0 	úP\0\0\0\0\0ºG¨\0\0\0\0 —r¡¾±±QmmmjooWuuµ{þ(ŠŠŠt\ë\Ö-7²²²\Ô\Ò\Ò\ÒùYee¥Z[?n\'¯¯¯WYY\ÙÇ°\ï²\Ï\ì»\0\0\0\0À£s¡>::Zùùù.\\oÜ¸Q´³\í·r\åJmÙ²E{ö\ìqûû\ìØ±CÇ\ï|mŸ8p\àc\ØÅ€u\ëÖ¹\0/^T\\\\œv\ï\Þ\í¶·\Çòòr·Ý;wtþüy·Í¥K—”˜˜¨mÛ¶)66VÛ·ow#>>^uuu¿\Ô\0\0\0\0\0½EˆU\Ï###u÷\î]\ÊW¯^\íª\ìbýúõºyó\æ\ï\Ûþº\çÎ«\ä\äd]½zU³f\Í\Ò\åË—8¶…ÿ£GºJ}FF†\ì×®]s!}Îœ9®sÀ\Øq\ìû\ì8vq`ó\æ\Í\îñÜ¹s\nSzzº\Â\ÃÃ»\í\0\0\0\0\0 /\nÙ¹s§V­Z\å*áµµµZ»v­\Ò\Ò\Òtøða?t\ç\r6t\ê-l[\ÐÞ´i“VýŠŠRhh¨:Ô¹µ\ï¯X±B……….\Äû¼½^°`øþ\ì\íü\ÌÁƒ]§€Uô—,Y¢\'N¸P\ï«\ìÿ²®_¿®ªªª\'r,\0\0\0\0\0ž†›\Ón¡~ñ\âÅ²€oa|\áÂ….,RÅ¾§Pomó			¼ö\ìY\×\"\ïc\íóô-ð[@·N3gÎ¸n\Ý6rssÝ¶\Í\ÍÍºråŠ»`|\Õz;ž\ãÔ©S\îÜ»†z\ë(--}\ìÿ˜¥K—*33ó±÷\0\0\0\0\àY	\É\É\Éq\á\ÙZÞ­Bn\ßZñEO¡~×®]Š‰‰QRR’k¹·aÏ­b\ï\êoÜ¸¡ýû÷»6{›[o\íõðóòò\Üç¶ö’’\×^oaúôé®ªo\ì\"„¯Bo\ço¡¾kûýò\å\Ë]…ÿq\Ù~·o\ß~\ìý\0\0\0\0\0xVBö\î\Ý\ë\æ\Ñ\ÛBy\r\r\rZ³f\Í#/”g­ð)))¼o\íû¸­\Úox«¨[Ð·ùó67\Þ\Ç\æ\Ñ[8·ª»]H8}ú´›#oyô.\\px\ß\êüö]v\ÑÁªö6ÿ~ß¾}\îøó\ç\ÏwŽ;\æþ¶½¯\Úÿ8õ\0\0\0\0€`\ç\Ú\ï-\ÈûÊ³\ç\Ö\Ânû“nmgUr_U\Ý\Çöµ\Ö{»H`·º³\nº…y\Ó\Ô\Ô\äž\×\ÔÔ¸\×\'Ož\ÔÄ‰]K½Í‘·9ôþ­ònz»0`\îùXW…tû«\ì[—€µ\×[…>55Õ…~ÿø\r¡\0\0\0\0\ÐW¹[\ÚY\Å\ÝZ\ï­\"n¡\ÞB·¯Rþ¸¬\Òn•y\ÛßªðvL\í­‚o\ÏmÞ¼±\Ö\Zo\íõþmüö¹ÿ‚z\Æ.:\Ø\\ýiÓ¦¹\ãZU\ÞB¿M˜7ož»`¯»®@¨\0\0\0\0ôU!V=·Ê¸µ\Ê[\å\Ý\æ\×¸\àl÷…\à\íXV¡·\Û\Ø\Ùüxk•·Êº-:g÷´·°oö½\ÖBo\íÿô­‚o\Ûdgg»9ó\ÖVo•y\Öv\\«\â[»½…{[(\ÏVÎ·\Õù\í\ÂCDD„{n\ïùV\Ð÷!\Ô\0\0\0\0úª«’[(Þºu«k_‹‹Ó¢E‹\\~\Ü{¾[\ë»]hmmu•[A\ÞB¾d[\ä\ÎB¹}f\r¬µ\ßn›gw[\Þn·e\ËWy·ó|‹\æ\Ùk;GöÚ·uØš\0öÜº¬õ\ßþ\ë°¿i\îÜ¹Lx„z\0\0\0\0@°±¹óV5÷±\Ðm•ð–––_ú\àVa·V~uuunžþ\ÃXÐ·\ï·Gß°\×]÷³\×v~¾a\Ûøž\Û>\Ö`­þ¶b¾Í½÷ÿû¡\0\0\0\0\ìB}ÁŠP\0\0\0\0v„ú\ê\0\0\0\0ÁŽP\ßB=\0\0\0\0 \Ø\ê{@¨\0\0\0\0;B}õ\0\0\0\0€`G¨\ï¡\0\0\0\0\ìõ= \Ô\0\0\0\0‚¡¾„z\0\0\0\0@°#\Ô÷€P\0\0\0\0v„ú\ê\0\0\0\0ÁŽP\ßB=\0\0\0\0 \Ø\ê{@¨\0\0\0\0;B}õ\0\0\0\0€`G¨ï…ú\ì\ì\ì@Ÿ\0\0\0\0\0=\"\ÔûinnVSS“JOO\ï|\Ý\Ö\Ö\è\Ó\0\0\0\0\à>„z?\Ñ\ÑÑš9s¦\æÌ™£)S¦hÖ¬Yî¹‚‚‚@Ÿ\0\0\0\0\0÷!\Ôû9w\îœÆŒ£‰\'jÒ¤Iš0a‚-Z¤U«V©±±1Ð§\0\0\0\0À}õ~ª««5þ|\æ-\Ø[\Õ~ñ\â\ÅJHHô©\0\0\0\0ð\0B}ûö\í\ÓØ±c]¨·@\î\Â>\0\0\0\0\0Á†Pß…ÍŸ6mZg¨ß¿ O	\0\0\0\0€n\ê»a\æYµ~ÆŒ*,,ô\é\0\0\0\0\0\Ð-B}7\Ò\Ò\ÒÜ‚y\î\0\0\0\0V„ún\Øý\ê###]¸\0\0\0\0 X\ê{`Á¾½½=Ð§\0\0\0\0@õ\0\0\0\0\0ôR„z\0\0\0\0\0z)B=\0\0\0\0\0½¡\0\0\0\0€^*(B}cK«j\Z›U\ÝÀ\èqxÿ?õM-jkcñ>\0\0\0\0@‡€…úô¢*…ŸH\ÑK«Ž\êÏ§n\×\ï}¥\ß¾Ž\Ñ\Íø\Þø\â\Èõúƒñ1úæ¢½\Z·3QGnæ©©¥-P?\0\0\0\0 <óPoa~pôý‡÷\×(\ä\ÕP…¼¶TŸ}{…~ý½Hýû!«ÝŒ\ßò\Æo^­_}w¥B„+\ä\å%\n¡¿Ÿ½S{®\Þw\Þ\0\0\0€O§g\Z\ê#O§\ê‹#Ö¹0ÿ…Á‘ú\î’ýš\à†Ž$\èFn•\î–6\ènY#£\Ë\ÈóFfa\Îg”*ú|–\Þ\ÚpZ_£~\Ë\\\Èÿ\éŠ#Ê¯¬–?%\0\0\0\0 <“P\ß\ÜÒ¦Ñ±\\u\ÙÆ¿…Ò¹ôb55y¶I­\Í\Þ6\Þó\ÆFFO\Ãþ¯Z¼ÿ§öÖŽQPÞ¨™{¯ê¿ŒŠR\Èk¡ú‹i±JÉ¯x?\'\0\0\0\0 H<“P?q\×%…¼¾Lÿ~p¤–NvÞ‚|CƒT\Ïø…†\ï‚È•œ\nýõ\Ì8\ìÿx\ÒV\åU\Ô=‹Ÿ\0\0\0\0žz¨¾¡_ys¹¾0h•bn» \Ú\ÐøP\ÜWF[‹”WÞ ¯\Í\Ý\í¦5<¿t¿\êšZžö\Ï\n\0\0\0\0O5\ÔW7\è\Ëc£\Ò?Lsö]—Z‚û\âhõ2üÍ¼jýþ˜h\×ak\0\0\0\0\0ú¾§\Z\ê§\îIr\Õ\ãœ¿Guõmnnx p_\Ö±útº>\Ó?L4a‹\ÊjŸ\æO\0\0\0\0O-Ô—z¡ò\Ë\ãbô«o.\×\îË¹nq·@ß¾<lJCUm«þf\ÖN·*þš³·ž\ÖO\0\0\0\0O-\Ôï¿‘\ë\Ú\îÿt\êvUÔ´P¥Ã¦7\Ø-­;\â‡\áŸ\ÖO\0\0\0\0O-\ÔO²\ï_[ªÁ›\Î2—þ\r›[o÷²ÿõA«ô\ãbTZC>\0\0\0\0ôeO-\Ôÿt\å\ê#Ž¥>V\ë}Só\Ã?ol\êx´vs\ß*úöÞ£®¨oÛ¶´~<ü÷ó?¦\ïuO\ç\ã;\Çœ\ç\ì`°s\Ê-mÐ—\ÆD\ë7Þ‹Tja\å\Óúy\0\0\0\0Aà©…ú]\ïBýŽKw\Ô\Þ\Òsµ`\Ý\Ú\Ö1,ðff\æ¹G{\íû\Ì kj[u\'·\Ø=VV5©º¦\Åm›_P®ª\ê¦Oö.ô\Þ-Ñ™³u\êô:• ’\Ò\Ú\Î0_XT©òŠúÎ‹vüÌ¬<\ÕÕ·?Ì‹Š«\ÝyØ¶\Í\Í\á\ßFs\Ëý\Ú\Ú?öy\ã½\ïò}\Ç\ã\\ø\ÄÞ¨®k\ÓOÞªº|§ôiý¼\0\0\0\0€ ð\ÔBý?\Ì\ß\íBý¡\î^\ê\ÝU¬kj[”pY\×\á\Ã\'»[?ý\é\Ï½MGŽœp\ï9zZyùe.,W\é£\ÑcU\\R­ððUŠ\ï˜7>f\Ì]H¼\ê.<´=½MÚ¸q‹^y\å5MŸ>K“\'Os¡\ÝÂ¶}»c¦L¡ú\ÆVw\Ü={z\Ç\ï\í\Ûz_P\Ï/¨\Ð\Ð÷‡+÷n±.^º®9s\ækþ‚%Z´h©÷|{¯\Å;ß¬\ÛŠŽÙ®¸¸xmÛ¾S‡œÒ´i³4k\Ö<÷ýö8\Õû¾ŒÌ»ŸØ¡ð¨£\Ù;¿¯Lu\ë\\\Ê)yZ?/\0\0\0\0 ,\Ô[8.(¬Pÿþ\\^¸p‰xÃž\ÏöBò’Cõ\ÒK¯h×®ý\Þö­Jºœ¬w\ß}OW¯¥¹ð·s¯û®#>Ð…W\Ýó‡µ\Å[p_»v£\"\"V©]÷·ò—–\Õ\è\ì¹Kú\ÉO¦˜Í±JLL\Ò\Ï~ös­ZµN\Ù9w;C½U\Üwx!}ì¸‰\îBCjZ¶v\ï9 ƒ‡ŽjÃ†=÷\Üóº\ä…zû®Ô´Ûš>c¶~ðƒj\Þü\ÅZ¹^#G~¨\Óg½¿û\r\ïû’\Ü\ßs\î|\Ò\'^ \Ô\0\0\0\0º\nh¥¾¨¨Ê…w«\Ä[Õ¾¾¡E“&M\Óù„\Ë\îyCc««tŸ> Û·4t\è0}÷»\Ïi\Ì\Ø	\Z\ë\Ø\Ø=jö’õ¨Q\éÀÁc\Ú½U\ç\Ï_\î±\ê\íBýº\n_\éžû¿o/¾øcŸ0\É\ìvü‰\Z=zœ\r\Z\ìŽ\ïk«¯¬¬×°\á#u))Yaa+Ý…S^Q\ëª÷va\Âø¦”–Õ¹÷+«šu\Æóo¼1P‘^¸é¥—µzõõ\ë\×\ß]ðõ\î\Â/Ø’O¨\0\0\0€O€…úŽðÚ®’\Ò\Z}ø\áW±6|„¾û\Üs\êÿ\Æ\0÷¼\ß\ëýµu\ÛN/P·»m\ï\Ü)r\Ú\æ\Ð/	\rs!\Ü.\n:\\?þñO\\K{\ÊÍŒ_(\Ô\ï\Û\Äu	\ßs)\é†FŒü ³EÛ¶]ú‘÷½Ó§\Ï\Öÿ\ß\Þ}Gi]ß‰÷ž{\î½\ç\îÙ»w\ï\î&\Ùd\Ó\ì\Æ5\Zcz\Ùd7½W“˜D±G\ÅBSTP@,¨(MA©J¥F\Ú\Ð;\Ã\Ð\Û\Ð\Ë\Ðf†\Ï}¾?DŒ\Éð_¯s¾g\Úó<óÀüõþ}\Ë\ï†nŠU«7\Ä\è1\âº\ënˆ;\n\ï-}oÄˆÑ±g\ïþ\ØYV³f/ŠnüS\Ì_P£^\×_ct\íöR\\~ù\Ñý\Å\ÞÙŒý¤\É3E}ú=_\Zo¼Q”]Hõ\0\0\0¼“\Zõiù{\é†qKÛ²=ñkÖ®[n¹-\rkŸ·mût<óL\ç,¦S\à¦C\ì\î¨[?&\"¸Åƒ\Äs»Fi\é\ælùýˆ‘c²%õ\ÇÛ›~¼¨:ôµl\Ö|ð\à!1p\àx¥Ö¯\Z’\í“O\ï/ýþô\Ú3g\ÎË–\çÿ\ì\ç?\×^ŸmÚ´\Ï~>vÜ¤\ì\ß={\Î\â¸ö\Ú\ëc\ÌØ‰±tÙšl¦ÿ{\ßû~\á\ßukö»oº©N¶\\ÿª«þ˜\íÙ¿\æškX~Ÿ>>øÐ£Ñ»w¿#Þ£¨\0\0\àh\'=\ê7nÚ™\Í\Ì\ßø§›£A\Ã;\ã\Ç?þi\\wÝÑ°\á]ñ›\Ë~;w‹ý…ZO3\â\í\Úw\Ìö¬\ß{\ï}Ñ¤I\ÓB\Ë~WÚ§žf»«N\Ð?^\Ô?û\Ü…\êˆ`NÁ¾¸xe6\ëßºð³t€]“ûš\ÅO¶–-[\ÅK½úºX.¤eþ\é\çs\ç\Ç\Ða¯e3\ï)\Ô\Ó\Þÿ¾ý^\Éf\à\Ó)ý{÷\í\Ï\â»\é\æ:±lùº(Yº&Ú¶\ë-m¿ú\Õo\â±ÇŸ,ü›:\Äò\ë\í\ïOQ\ßò\Ñ\'¢OŸ¢\0\0€\ã:\éQŸn\r—öœO™2+›©¯S\çÍ™úö…ˆ\ïÔ©K\ÒÅ…\èN1œ–¹§\å÷i=*Ÿ¤¨OûðSDØ›ÿ6Á[xiv=\í¿¯ZÚž\í“ß¶7z\Â}\á¢\åÙŒÿ¼y%Ñ Á]\Ùmò’t`\æ\Ì\ÙÅ…ô{¾ý\íoÇ7\Þ-Z<£Ç¼O>\Ù.\î¼ó\îø\Å/~™\í©O\æmÛ¾/ô´½ Î­·g\'\âÏ™»(Fž½ï«®º:»ðú\ë\ã³\Øõ\0\0\0¼[\'=\êSô^~\ÅÙ’õ;\î¨?úÑ³ñ\Ó\ç\é\Ôø£—\ß\×-|ºŸ|Šú´|=IQŸ¬›;oI´k\×\á¸\'\ÉW\Ý¾\ê\ëôØ¢\Âs\Ó2ù´>xº/}³\æÆ«ƒF\ÄÔ©Ó²\Óø\Ó~ûòŠý\Ù}\î\Óˆôq\ìØ‰±q\ã\Î\ì=L-š“]¨’\Þoº\å]—.\Ý\n±ÿ‹l¶>\ì÷\ØcOFó\Âkÿò——f\'\ã·lùx¶o¿\ê ¾ôoõ\0\0\0ü%NòAy[¶\î‰^½ûe\Ë\Ów\ì,‹\Ûn«¯ž}>a\ÂÔ˜ð\ç©—¾Wf3\Ú)ºW¯\ÙÍš=\ï½?^.\ÄoÚ‡?f\ìñò\Ë²û¾¿›NQŸ>-\ËO·§K\Û\0Ö¬\ÙTø³\ßwýõ\ÊN\ÆO\ßO÷“_¸hivzýw\Ô\ÏN\È7nRÌœ9;ºu{);\Ù~úŒ9Yô¯/\Ý3fÌG>iòô\ìü\â\âU±¸xEvñ\à\Úk¯\Ë\ÎX¼xE,[¶öˆ÷#\ê\0\0øKœÔ¨?<d\Ó\ìyŠ\Øt¹‰“\ì\ßW‡¨[Z\ßt ]Z\æ¾ió\Î\ì–v\Z\ÝÃ†Œ\î\Ý{Å•W^\×^w}vK»w{j|:o\Õ\ê\ÙJ€ôú\×\\s]v°\Ý5\×\\\ß›·\î\Êö\Üo\ßQž’Ÿ¶Ìž³(›\ÑoÝº}6CŸNðO·¾K\ï?}7nrö\ïª:I?]¼xðÁ–\ÙÅ€tš~:±?}¼ýöz\Ù\ëÍ™³8š6} ð˜G\â÷—_‘€/\ê\0\08žS\"\êŸ¹O‡\ÆmÞ²û-\Þ\í\ØYQ\ïMY§Ÿ¥ý\îU·™K?O\îmÝ¶çˆ¥õ\ïf¶>½f\Z)\ÜK7l\Ò\Ò\í\Ù\Éü;\Ë*³\ïW”—^¿rÿ›_§°?\ÖØ•\Æ\î·þÒžÿô1\Ý\î.}\Ü^øºlWeöû&Mš‘\Í\ÞÍ‰õ\ë·÷\Ð?Q\0\0À)õU\Ñüv1{øÏŽ~LU”¿\Û>Ö……£Ç»}ü\Û=\ç\í[5\Ò\nƒª±û¯¸8!\ê\0\0\Þ[j,\ê¿ýÄ ,\êû­ˆý\ïr9¼ñW^(Œ\íe•q\áý/\Çi\×<\ÓWl¬©?/\0\0\0§€\Z‹ú\ß<32‹ú§__ûs\Z½Q}#­dX¹qwœÞ¨Gü\Ý\Í\ÏÆ‚u[k\ê\Ï\0\0À) Æ¢¾\ÉÀ¢,\ê\ë¼ø\çQBFEy\Ä\Ä\âñ¿o\î\ç\Ü\Ó36\î\ØSS^\0\0\0N5õC\ç¬\Ìöu_Ô¬Ol\ÙQ{ªa¿»qü‘.ž<6lNœvE›øùS\Ãk\êO\0\0À)¢Æ¢~\ã\Î=q\Ö\Ý=\ã^\×!^™±Ò¾ú\Z\ÙvVÄ—\Z§ý¡]tž°¨¦þ´\0\0\0œ\"j,ê“¦¯N\Ëfÿ\ëñA\Ùm\Û\Ì\Ö\×ÜˆÊˆ\Î\ã\Çûcû8¯ñK±i§¥÷\0\0\0µ]F}\éö\Ýq\æ\Ý=â´«\ÛGË¡³\í­¯¡‘ö\Ò/X½=\ÎlTø¿¾ª]t\Z· &ÿ¬\0\0\0œ\"j4\ê“\'\Çÿ¸®CüýM\â¥\ÉK³\åê¸Ÿ¼q`T‚~\Í\æ\Ýñµ–¯d«\"~\Øfh”\í-¯\é?+\0\0\0§€\Zú¤ñ€©\Ù>\ï¸\å\Ùh3j^”ï¨\Øw\à¾\ê\';Šó:öþ\Ó’™Ë·\Ä\ê§]\Ù&.¸¯w¬\Ú\\v\"þ¤\0\0\0œNH\Ô\ï-¯Œ†}&\Çi\×<§]ûtüò\é‘1±xC\ì;¦)ð\Ó\çiÏ½q\ì‘\"¾¼ðÿ´¿\âÀX»yo<<xV|¨~·,\è/n\Þ\'\æ®\Þr\"þœ\0\0\0œ\"NH\ÔWI{½\ß\Çó\Ù2ñ¿¿\å¹l©x«\ás\ãõy\ëbÞª\í±z\Ó\ãc\Í\æ=Q²¾,&oŒž“Jâ†®²ûÐ§\Õ\éBÉ¯;ŽŒ5[\Í\Ð\0\0¼×œÐ¨O­\ß7¿8!þï­³¸?\ím\ã¿\ß\Ð1þ\î\æg\ã\n\ß3\Þ:\Òÿ\Õÿ©ó\\ü¯?u:°\Ú\á÷­³_~x@¼2cy\ì\ß¢ÿŠ\0\0\0œ\nNx\ÔWY´n[´=7~\ÛiT|ªYŸøPƒnñÏ·w1Ž1þ©0\ÞW÷…8ëžžñ\íVƒ\â\îþSb\ä¼U±§¼òdýù\0\0\08œ´¨?\Ü\î}±}Ï¾Ø¶{¯ñ6cû\î}Ù©ö•¦\å\0\08\à”ˆz\0\0\0\à\Ýõ\0\0\0S¢\0\0\0rJ\Ô\0\0@N\ÕÚ¨ß°aC¬\\¹ò-\ßß³gOTV:5\0\0€ü«ñ¨Ÿ?~,Y²¤¦\Í[Œ3&zö\ìy\è\ëóC†‰–-[Æš5k\Þñù\'NŒÍ›7\×\ä[\0\0€¿IFý¾}ûâ¥—^Š\Æ\îÝ»}?}¾}ûöwœ1ß±cG”••úzÿþý±w\ï\Þ\ìy\éù‡ÿ¬\ê\ç\éû)\àÇŽ{(\ê\Ó\ï{þù\ç£C‡ñ\àƒ\Æò\åËû{\Ó\ë´k\×.–-[önÿ\É\0\0\0p\Â\ÔhÔ§\Ù\î\æÍ›\Ç<}ûö\Íbyüøññ\ÄOD«V­²\Ð>\ÖlxŠò~ýúeIcÔ¨Q\ÙsS\ä?÷\Üsñ\Â/d¯ñ\È#ÄŒ3²\ç\ìÚµ+»€ðè£fAžþ\å—_\Î~¶s\ç\Î(**ŠmÛ¶Å“O>ùŽ±^QQ;vŒÕ«WWÿ\n\0\0\0T“\Zúòòò\èÓ§O<8›aO1ý\ÐCÅ¢E‹²õ\îÝ»G=\Þò¼q\ã\ÆeQ\"~ÝºuY¨—””d3ó)\ä‡žýlÄˆÑ¾}û,ø\Órû6m\Úd{\é\ÓòúôœÞ½{ñºi\Æ>]x§¨O+žy\æ™X»vmµþ\0\0\0@uªñ=õýû÷\Ï\"<IK\â\Ó\ì|•´\×>Íœ¾4?\éÖ­[<õ\ÔS\ÙÅ€4Ò…€ú)\ê\Ó\ã«b;-£oÛ¶m\áiö>½~•´þð=õIš\ÍÿK¢>½Ÿõ\ë×¯ÿ›þ\í\0\0\0P“NHÔ§õ$…y—.]ý,E}\ëÖ­õiLŸ>=3g\Î\Ìf\ì\Ó\ì~Šøª¨Oqž–Ú§U\0]»v\Ífë«¤‹mÔ§\åú)\ê7n\Üø7ý\Û\0\0 &\ÕxÔ§CòRp§}ò+V¬\ÈªK\'\âoÝº5›]Oû\à–öÝ§eõ[¶l\ÉÆ€²%õi\É}Zbx\ÔW\ÍÔ§i?\Åº•\Ý\Ã?½zõ:\âuSÔ§=ú\ïõi\ï}§Nœ~\0\0À)­Æ£>\Í\Æ?þø\ã‡ö·Oš4)›O\ßK{\êS@-]\0HR€§Ç¥\Ùþ4›Ÿ¢þ\ÙgŸ=´,>\Å{:8/=>´?\í¥O\Òk§\×8\\zt€Þ±\î_¸ó)\êÓ…\0\0\08U\Õx\Ô\'i&ýð%ö)À\Ó÷tÀ\Ýñ¤=ôG\ß\Ò.½V\Õóª¾>\\z\Ýôú\égé ¾c½—wú½é°½tñ ]D\0\0\0€S\Õ	‰ú¼I+R\Ô~A\0\0\0N5¢þ\Òþýªeý\0\0\0pªõ\ÇPµWÿ\è¥ý\0\0\0p*õÇN\ÇOQ_QQq²\ß\n\0\0\0¼-Q\é\Äþõ\0\0\0p*õÇ°xñ\â\èÜ¹ó\É~\0\0\0p\\¢þ,X \ê\0\08\å‰úc˜;wn<ÿüó\'ûm\0\0\0Àq‰úc˜9sft\ï\Þýd¿\r\0\0\08.QEEEÑ«W¯“ý6\0\0\0\à¸Dý1Lš4)úö\í{²\ß\0\0\0—¨?†	&\ÄÀOö\Û\0\0\0€\ãõ\Ç0fÌ˜<xð\É~\0\0\0p\\¢þF\Z#FŒ8\Ùo\0\0\0ŽK\Ô´k×®Ø¹sg6^}õ\Õ>|xöùŽ;¢¢¢\âd¿=\0\0\0xQPº…]Ó¦M£E‹\Ù\ÇfÍšeŸ?ø\àƒ±v\íÚ“ýö\0\0\0\à-DýAS§N»\ï¾;š4i÷\Ýw_ö±u\ë\ÖÑ¹s\çØ·o\ß\É~{\0\0\0ð¢þ ²²²x\â‰\'¢q\ã\ÆY\Ð?ô\ÐC\Ù\×\éžõ\0\0\0p*õ‡9r\ä¡\Ùúô:t\Èö\Õ\0\0À©H\Ô¦´´4\ÛGŸ¢¾eË–Y\ä\0\0À©J\Ô¥w\ï\ÞÑ¨Q£ì€¼7ž\ì·\0\0\0oK\Ô¥¸¸8[‚Ÿ\â\0\0\0Ne¢þ(\å\å\åÑ­[·,\î\0\0\àT&ê¡²²òd¿\0\0\0xG¢\0\0\0rJ\Ô\0\0@N‰z\0\0\0\È)Qÿö§±ÿ¡\0\0\0§\nQÂ½|_y\ìÝµ;Ê¶o[¶\Ze;vÄž]»b\ï¾}QQY™ÊƒC\è\0\0p2½§£~o!Ö·­/µ\ÇÜ‘cbr\ïþ1ªý31ì±¶G»ÿBÏ˜6`P,ž\\\ëJ–\Æ\Ö\rcw\áyû\n‘ŸnWQQ!\î\0\08)\ÞSQ_•\Ý{v•\Åú%K\ãî½¢\Ûõ·G³K¾\r?þÉ¸óô\ã\Î3.ŠFg]wŸý\é\ìó4\Z|\ì“\Ñ\èœK¢õ~¯4{$\æŒ¥«V\ÅÎ;cÏž=Y\à‹{\0\0\0N´÷TÔ§ðÞ´zMŒ¾G<ñ½_F\ÃB¬7ø\èù\Ñ\èÌ‹¢\éE_Ž\Ö\ßýytüõU\Ñó†Û£÷-õ£ó\×\ÇS?ým<ô\Åo\Å=\ç~&\îü\ØQÿÃŸˆ&~9zÔ»\'\æŽýslÚ°!\Ê\Ê\Êb÷\îÝ±o\ï\ÞCq\0\0\05\í=õûvï‰¥S¦Å³W\Þ\rOÿd\Ôÿ·ó¢\é…_Š.W\\o´\ëk\ÇOˆs\ç\Å\Îù¢l\á\ÂØµpQ”-X;\çÍ-\Óg\Ä\Ü^}£ƒ{£\å|/\îüøQ÷ƒ\çDó\ÏÿWŒh\×1V/‰mÛ·Ç®B\Ø\ïö\0\0\0œ ï‰¨OA?kðˆx\ì›?‰;>pv\ÜsÎ§£\Û\Õ7Ç¢WÅŽyóboIIT¬X•«VE\åÊ•GŽU>–/[»-Ž\ÒI“cDÓ‡\ã\á/|3\ê}ð\Üly~¯{›Eñ\ì9±eË–CKò…=\0\0\05­\ÖGý¾=‚þ‘ÿø~!\èÏŠG¿þƒ(\ê\Ü5vÌ™Ë—gÁ^‘F!\ê\ßiT|\Ü\î\ÅÅ±òµ1\Ñõ\ê›\â\Î4\ëÿ‘ó£ÇMbñ\ÌÙ±i\Ófa\0\0À	Q«£¾¢¼<\æŽ\Z-ÿó‡qûûÏŒ§ú\ÛX2dX\ì[¶\ìP \íi¶~ÿa£jöþ-q¿|El›=\'\Þ\Õ$\î>û\â¨÷\áO\ÄKw7\â¹óbófa\0\0@Í«•QŸ:…ôò³£\í/‹\Û\ßwF<ùŸE\É\ÐÇœ™OK\ì³ø…‹b\ë\ÌY±y\Úô\Ø\\t`¤¯\Ó\ÞúÊƒ\Ëó¸Px…Ÿõ«wwÜ™N\Ï?\ã¢xµU\ÛX¾¤D\Ø\0\0P\ãje\Ô\'\Û7mŽn¸-\îø\à\ÙñÀgÿ3\æõ\îû\ærû#f\ÝWÄŽyóci!øG?\Ò*ž¿\âúhÿ£_Gû^š.¿¿6†\ß\×\"–\r‘¤W~\Ôk¤Ï·Î˜]¯º1\ê~\èœhr\á—bt¯>±zõ\êlý®ƒ÷´¯¬¬<\Ùÿ%\0\0\0\Ô2µ2\ê+++\â\Ï]{û‹\Ñð#\ç\Ç\í:Æž\â%GýÁ\Ã\ï\ÖMøs¼Ò°qv~ýu?pv\Üþ¾3ôu:)¿ñ\'>/\ßT7V¾6:[¾ôlÿšq\ã\ã\Éoý4n{\ß\Ñ\î\Ê\ëc\æ\ÄI±®´4¶mÛ–\Ý\î\Îl=\0\0\0Õ­\ÖE}\n\çm¥\â\éKÿ·ýó\é\Ñý7Æ†I“,_¾ü\Ð\ØW²4J\r¶\ßÿevŠ}z\ì­ÿôñ¸-\Â\ç‡F\á\ë[ŽzÿzN´þ\Þ/b\îK/\Ç\Þ%/T½^!ôÇ·j\Ïûl4ø\Ø1¬s\×XºtilØ°![†o¶\0\0€\êV\ë¢>\Í\Òõ{5š^ü\Õ\ì~ò3_\è‘øž4Š‹³\é\ë’Aƒ£\Íw~ž\í·¿õ\è›‘—f\ïþü\Å\Â>²[\áx\Ý¯¿¥hz´ûÁ¥që¿œn¸5fNœkÖ®\Íö×§eøf\ë\0\0¨Nµ.\ê÷\í\Ý½\ê\Ýõ?ü‰\èð³\ß\Åò\á£b×‚ù±sÎœc\î\Ü\Ø<µ(º]yC6Cÿ—ý›\ã\ãÙ…€.—ý1VŽ|-\Ê\æ\Í;ôº;fÏ‰Á›G£3?÷]òµ\Óÿ•X¶|¹\Ùz\0\0\0jD­Šú4¾có–hó£\ßDüXkò@”Nøsl:%¶LysŒ{ô‰¸ÿß¿=\æ\Ýý›Kò\ë}\è\Üýp«\Øø\Æ\Ä#^~¯>\Ñ\â³_\Û\Þwf¼\Úñ¹X´xq¬Y³&\Û[ŸN\Âõ\0\0\0T—Zõ•\é6v³\æ\Ä\Ã_û~\Ôý\à¹1¥}‡\Ø8~|¬=\æÀ3&ÖŒ~zY¶Œþ\Ý\Ï\Ò9žú\Ée±°ñÆ-¼ö\è(M¯?rd<ñÅ­…Ÿwk\Ò<fN›+W®<b	>\0\0\0T‡Zõ)˜g|=šþ\Ñô\â¯DQ‡N±føðX5dÈ¡1­\ãs\Ñ\â3ÿuþñ£SÐ§q\Ï9—\Ä\ä¶O½ù;†ƒE§__õ>t^t¬S?¦Løs,]¶\ìˆ%ø\0\0\0PjUÔ———Ç´þƒ¢\Ù%_‹\Çþó1\íéŽ±¬¿(\é\Ó÷\Ðy_‹hò‰\ÏEÿ÷W.½?l	þ\ï?+\Æ4¨ð;úGIß¾\ÙXòò\Ë\Ù=\ë~\ì‚hõMñ\Æ\ë£cIII”––\ÚW\0\0@µªUQŸ‚yj¿W¢i!\êŸø\ÖObJÛ§bqÏž±ð\Å³± û‹1°NÝ¸\ç\ÌOÅ­sÔŸž˜7\à\æº1ÿ…bQG÷\èy\Ý-q\×E»?þ)&Œz-\ÛW¿v\í\ÚØ±cG\ìÝ»W\Ô\0\0P-jmÔ·ú\æObÒ“mbQ×®±\àù\ç³1¿0²¨?«ú¢þ•:õc^\çÎ± ö\Ù\ï\è\Ò%z\\{ó[¢\Þay\0\0\0T·ZõEeQÿðW¾Sˆú¶Qü\ÒK\Ù,z\ÕÙ¤ù\å÷\í\É÷‡/¿ÿÀYñúý-¢¸W¯C¯ŸfëŸ¿ü\Úhð\Ñ\Ë\ï\'Œz]\Ô\0\0P#jUÔ§=õsFŽ>ÿhò\É/Æ¤\Ö\íbùÀ±´_¿Ccú3\ÏÆƒŸûzµ”—.L|¢Í›¿\ã\àþý§zY\ÜñÁs\âÙ›\ë\Æ\Ä\Ñc\nQ¿H\Ô\0\0P\íjM\Ô\ïQ¿t\Ö\ì\ì–v\é»ñ´\ÊN¦_=thv2ýªa\Ãb\å Á\Ñ\é\Ò\Ë\ãŽœý7\ßÒ®\ÓOó»÷8pú}\áõW^iÿñ\ØW¿u\n¯\Ý\í¾1y\â\ÄX¸H\Ô\0\0PýjO\Ô\ï\ß\å\å±uÓ¦hó“\ßf§\Û÷¿­A¬:,6Œ¥c\Ç\Æ\Øl¼Ñº]4ÿ\ÔWþ\ê%ø\éb@Ãþ{Œ\äñX?zô\×36û\é6z\Í>õ\å\ì¢AŸvOG\Ñôi±p\áB\å\0\0P\íjUÔ§û\Ô\ï*+‹^\rGƒBt?ùÝŸEq¿Wbûô\é±ujÑQT›Þ˜/]{K4øðy\ïú\Öv)\è\ë‚ý\Å?\Þ+†\rm\Ó¼f\Z›§LŽ¾·\Ýw~ü“qÿg¾ƒ»÷Œ³fÆ’%K\Ü\Ò\0\0€jWk¢>I±¼{÷\î˜\\ùû?ýQ¿\ío´\ë;\æÌ‰²yóbga”Ë†‹g~þû¨ûÁsÿ\â“ð\Ó\ã\ê}\è\Ühû\Ý_Ä’ƒb\×ü\ÙkV½\î\ê\×FG«oü({l\ÛknŠ×†Y³g\ÇÒ¥Kc\ãÆQVV–m\0\0\0€\êP«¢>\ÍÖ§\å\í¥k\Ö\ÄÓ—ý1n{\ßñ\Ô\Ï~+±½oÙ²\Ø[R{—,\ÉÆž\â\âX9rTt½\âú¸\çì‹³[Ô¥Yû4ÿ–q0ú\ï:ý\Â\èrùuQ<hH\ìY¼8öU½^\áã®…cð=Í²[\Ù5<ó¢x¹\ÍS1qÒ¤˜;wn¬\\¹26o\Þ»v\í\ÊV\0\0\0@u¨…Q¿/\Êv\ìˆ1/öŠû>ý•¨û¯\ç\Äk-‹²ù¢²\×+V\Z\åË—\Ç\Ö3c\Ü\ãm¢\Õ\×wŸõ©l¯|½ž›=/†9?‹þÇ¾öýõÀ#±q\Ê\Ô(?\ì5²Qx’AÃ¢\åW¾·þ\Ë\éñ\ä\å\×\Æ\ÈWÅ´\éÓ³ýôU‡\ä¥U¢\0\0€\êR\ë¢>Es:a>\Í\Öw»µa\Ôûð\'¢\É_ˆi»Æ¾¥K£rÕª#ƒ¼0ö,Y[¦M¢N]b`ƒ{£\ë•7D\ç\ßþ1žÿ\Ý\Õ1 n£˜\Ü\á¹\Ø8yj6+ôs+W­ŒÒ‰“\â™_^žÝ·¾\É\Å_þ\ÏtŽI“&\Åì£–\Þ\ÛO\0\0@uªuQŸ¢9-ÁO\'\Í/*š\í.½\"»½\ÝC_þv\Ì\í\Ý7Ê—-{ËŒ}úºr\åŠ\ØW²4v/Zœ-¥/[p`¤¯\ÓòúŠ•+Žù¼MÓ¦G\×ko‰zÿv^4:÷’x±\Ù\Ã1\îõ\Ñ1}úôXtðVv[¶l9´ô>½G\0\0\0¨µ*\ê“\ÍiF<-uß²yKL6*ÿ\î\Ï\ãö÷|õ{1\ã…cW!¶ÓŒýÑ‘^‘\Åý[G\Å\Ñ1_xnZº¿nü„\èz\Í\ÍQÿ#\çGƒ\Ó/Œg\ë\ß¯“§L\Éö\Ò//<fÃ†\rÙ©÷\éBƒ¥÷\0\0\0T§ZõU³õ)¦STO44ý\Î\Ï\âö÷Ÿ÷]ð…ûX\ë(49[Ž¿õ1\âþ#üƒ¶Ï™‹¼\Z\íü\ël\ß}ƒ3.Šg\ë5ŠQƒ‡\Æ\äÉ“³e÷%%%±~ýúØ¾}û¡½ôf\é\0\0¨Nµ.ê“ª½õU\ËðKq=yÐxò\'—e·¤kð‘óAþ›˜Õ­glš:-[f_Y÷ý«W…x\Ï\Æ\êU‡¾Nû\é·Îœ+F¼}o¿+š|òÙ²þ{\Îÿ\\<\×ð\ÞB\Ð9ô‹/>bÙ½½ô\0\0\0Ô„Zõ)¢«–\áoÛ¾=Ö¯[³Æ¿\Ï\\}S\Ü}\Þg¢î¿žw~ü“\Ñö—\ÆðfD\É\àaQ:qrl˜256OŸ[f\ÌÈ‚¿tÒ”X3v|Ly¦Kt»ú\æhzÑ—³\ç\Öû\Èù\ÑüKßŠ=£GŒŒI‡ý\êÕ«³[Ø¥\Ãñª–Ý›¥\0\0 º\ÕÊ¨Oû4[žn)—–\Ã/š;/†v\ê­~xi\ÜuÎ§³ýðiö>Ýƒ¾ùg¾}\ë\'\ÑñWWÆ³¿»:\ÚüðWñðW¿\Ïûl\Ôÿð\'²\Ãð\ê\ì‚hü©¯D‡›\îˆ!½^Ž	\ã\ÇGQQQÌ™3\'Š‹‹³úM›6±^\Ð\0\0Pjm\Ô\'\Ç\nû\r7\Æòe\ËbÖ”©ñ\ê³]¢\ãµ7Gó/~3\Z\Âý®s.‰;Ïº8\î:û\â,ø|^øx\î%qÏ…_Œ–?¸4º4lƒº÷\ÌN¸O·­›1cFÌŸ??\ÛC¿v\í\ÚlÉ½ \0\0\àD¨\ÕQŸö\é\àºt\ßø\ÕkVÇ’\â\â˜3cfL;.^\ë\Õ\'^y\ê™\èÑ¢et¿ÿÁ\Âh‘}\ìÓªm\ì\Ô%FôcG½Ç)S¦ÄŒ™3³\î\Ó\ìüŠ+²U\0[·nµ\ä\0\0€¦\ÖG}Rö\å\å\å±gÏžl&=Í¨§“ñ\Óþ÷¥K—Æ¢…c\îœ91kÆŒ˜1mZL›:õÀ(*Šé…¯gÎš•í™Ÿ;w^,\\° –,Y’\Åüºu\ë²\åöU§\Üz\0\0\0N”÷D\Ô\'‡‡}\n\ï4k_÷¥¥¥Yœ¯Zµ*–B=\Ý_¾¤úKJJ²xOSø§ï§_³fu63Ÿb>-\éO³ó\ébA\Õ)÷‚\0\0€\á=õIŠ\í£\ã>Í®§¸O3\í)ðÓ©õiy~\ný\ÃGš\ÕOŸ“B>\Ý*/]H\Ï?<\æ=\0\0\0\'\Ê{*\ê«÷)Ê«?…zšyO¡øH\ßK?K£jV>=W\Ì\0\0p²¼\'£¾\Ê\áqŸF\Ú_ù\Ç\Z\ég\é1Uó\0\0\0œL\ï\é¨?–ªP»\0\0\0§\nQ\0\0\09%\ê\0\0 §D=\0\0\0ä”¨\0\0€œõ\0\0\0S¢\0\0\0rJ\Ô\0\0@N‰z\0\0\0\È)Q\0\0\09%\ê\0\0 §D=\0\0\0ä”¨\0\0€œõ\0\0\0S¢\0\0\0rJ\Ô\0\0@N‰z\0\0\0\È)Q\0\0\09%\ê\0\0 §D=\0\0\0ä”¨\0\0€œõ\0\0\0S¢\0\0\0rJ\Ô\0\0@N‰z\0\0\0\È)Q\0\0\09%\ê\0\0 §D=\0\0\0ä”¨\0\0€œõ\0\0\0S¢\0\0\0rJ\Ô\0\0@N‰z\0\0\0\È)Q\0\0\09%\ê\0\0 §D=\0\0\0ä”¨\0\0€œõ\0\0\0S¢\0\0\0rJ\Ô\0\0@N‰z\0\0\0\È)Q\0\0\09%\ê\0\0 §D=\0\0\0ä”¨\0\0€œõ\0\0\0S¢\0\0\0rJ\Ô\0\0@N‰z\0\0\0\È)Q\0\0\09%\ê\0\0 §D=\0\0\0ä”¨\0\0€œõ\0\0\0S¢\0\0\0rJ\Ô\0\0@N‰z\0\0\0\È)Q\0\0\09%\ê\0\0 §D=\0\0\0ä”¨\0\0€œõ\0\0\0S¢\0\0\0rJ\Ô\0\0@N‰z\0\0\0\È)Q\0\0\09%\ê\0\0 §D=\0\0\0ä”¨\0\0€œõ\0\0\0S¢\0\0\0rJ\Ô\0\0@N‰z\0\0\0\È)Q\0\0\09%\ê\0\0 §D=\0\0\0ä”¨\0\0€œõ\0\0\0S¢\0\0\0rJ\Ô\0\0@N‰z\0\0\0\È)Q\0\0\09%\ê\0\0 §D=\0\0\0ä”¨\0\0€œõ\0\0\0S¢\0\0\0rJ\Ô\0\0@N‰z\0\0\0\È)Q\0\0\09%\ê\0\0 §D=\0\0\0ä”¨\0\0€œõ\0\0\0S¢\0\0\0rJ\Ô\0\0@N‰z\0\0\0\È)Q\0\0\09%\ê\0\0 §D=\0\0\0ä”¨\0\0€œõ\0\0\0S¢\0\0\0rJ\Ô\0\0@N‰z\0\0\0\È)Q\0\0\09%\ê\0\0 §D=\0\0\0ä”¨\0\0€œõ\0\0\0S¢\0\0\0rJ\Ô\0\0@N‰z\0\0\0\È)Q\0\0\09%\ê\0\0 §D=\0\0\0ä”¨\0\0€œõ\0\0\0S¢\0\0\0rJ\Ô\0\0@N‰z\0\0\0\È)Q\0\0\09%\ê\0\0 §D=\0\0\0ä”¨\0\0€œõ\0\0\0S¢\0\0\0rJ\Ô\0\0@N‰z\0\0\0\È)Q\0\0\09%\ê\0\0 §D=\0\0\0ä”¨\0\0€œõ\0\0\0S¢\0\0\0rJ\Ô\0\0@N‰z\0\0\0\È)Q\0\0\09%\ê\0\0 §D=\0\0\0ä”¨\0\0€œõ\0\0\0S¢\0\0\0rJ\Ô\0\0@N‰z\0\0\0\È)Q\0\0\09%\ê\0\0 §D=\0\0\0ä”¨\0\0€œõ\0\0\0S¢\0\0\0rJ\Ô\0\0@N‰z\0\0\0\È)Q\0\0\09%\ê\0\0 §D=\0\0\0ä”¨\0\0€œõ\0\0\0S¢\0\0\0rJ\Ô\0\0@N‰z\0\0\0\È)Q\0\0\09%\ê\0\0 §D=\0\0\0ä”¨\0\0€œõ\0\0\0S¢\0\0\0rJ\Ô\0\0@N‰z\0\0\0\È)Q\0\0\09%\ê\0\0 §D=\0\0\0ä”¨\0\0€œõ\0\0\0S¢\0\0\0rJ\Ô\0\0@N‰z\0\0\0\È)Q\0\0\09%\ê\0\0 §D=\0\0\0ä”¨\0\0€œõ\0\0\0S¢\0\0\0rJ\Ô\0\0@N‰z\0\0\0\È)Q\0\0\09%\ê\0\0 §D=\0\0\0ä”¨\0\0€œõ\0\0\0S¢\0\0\0rJ\Ô\0\0@N‰z\0\0\0\È)Q\0\0\09õÿ_¹Ü¢}r$…\0\0\0\0IEND®B`‚',1,'com/maben/jbpm/helloworld/helloworld.png'),(20002,0,_binary '<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n\n<process name=\"helloworld\" xmlns=\"http://jbpm.org/4.4/jpdl\">\n    <start name=\"start1\" g=\"252,12,48,48\">\n        <transition name=\"to æäº¤ç”³è¯·\" to=\"æäº¤ç”³è¯·\" g=\"-71,-17\"/>\n    </start>\n    <end name=\"end1\" g=\"252,403,48,48\"/>\n    <task name=\"æäº¤ç”³è¯·\" g=\"205,92,142,72\" assignee=\"å‘˜å·¥\">\n        <transition name=\"to å®¡æ‰¹ã€éƒ¨é—¨ç»ç†ã€‘\" to=\"å®¡æ‰¹ã€éƒ¨é—¨ç»ç†ã€‘\" g=\"-119,-17\"/>\n    </task>\n    <task name=\"å®¡æ‰¹ã€éƒ¨é—¨ç»ç†ã€‘\" g=\"203,196,147,74\" assignee=\"éƒ¨é—¨ç»ç†\">\n        <transition name=\"to å®¡æ‰¹ã€æ€»ç»ç†ã€‘\" to=\"å®¡æ‰¹ã€æ€»ç»ç†ã€‘\" g=\"-107,-17\"/>\n    </task>\n    <task name=\"å®¡æ‰¹ã€æ€»ç»ç†ã€‘\" g=\"205,302,143,69\" assignee=\"æ€»ç»ç†\">\n        <transition name=\"to end1\" to=\"end1\" g=\"-47,-17\"/>\n    </task>\n</process>',20001,'com/maben/jbpm/helloworld/helloworld.xml'),(20003,0,_binary '‰PNG\r\n\Z\n\0\0\0\rIHDR\0\0²\0\04\0\0\0Qg0§\0\0O\íIDATx\Ú\í½‰{×¨\âûž$\×q\ì8‹7h\íV¯’\Ð\Ö$6x;‹m2v–ññŠñ$“\Ü;‰c;±\ï56!\Ï8™Ì‰@,b\Ø‹„Ä¾$‹\Ëýüýº:)ª»«««m\ï\ïy=RuÕ©\êj\ÕÛ¿³Ô©/x\Å\0\0 ù§\0\0\0-\0 E\0\0´\0€\0\Ð\"\0\0Z\0@‹\0\0h\0\0-\0 E\0\0´\0€\0\Ð\"\0\0Z\0@‹\0\0h\0\0-\0 E\0\0´\0\0h\0\0-\0 E\0\0´\0€\0\Ð\"\0\0Z\0@‹\0\0h\0\0-\0 E\0\0´\0€\0\Ð\"\0\0Z\0@‹\0\0h\0\0-\0 E\0\0´#€gˆQü\ç£E@‹ZD‹Œ9|\â€‹„O\Ð\"p‘\0Ÿ8Z.\àG‹0\Ú/’Ï‰¨@‹h\Ð\"\Ñ\" E´ˆ\Ñ\" E´ˆ\Ñ\" E´ˆ\Ñ\" E´ˆ\Ñ\" E´ˆ\Ñ\" E´ˆ\Ñ\" E´ˆ\Ñ\"ŒD-–Áþù-¢E´£W‹%Er—¿ºÀS“\ïª\É/¹Š\Ê\Ð\"ZD‹0Šµ,qªsSrü9Þ†\\O}¡·j\ÐF$ˆ\Ñ\"š=Á\Ò\Âòš\ÜÚ†üiÓ¼5¿3\Õ7½\Ö]^\á”y|\ÂøK\Ð\"ZD‹0š²Å’’‚I¡\ÜG\ëýó§\Ô4¥\éÏ“+Z_\Ð8)·¤¶À[\í.ªòx\Ë\Ð\"ZD‹0š²E\Ñ\â´Ê‚\ÕV}\Ð0{_\Ã÷ŽN™ò§©®¹S\ÇO™œ_5±°´\Ê,—ŒÒƒ\Ñ\"Z„Ñ¢\Å\Ò÷UE\ÏMšôqÓ“G§ýøB\ÓC­\rÞ¨wÍ«\Î}²,\çÁ\ÒÜšŠ|_¨\ÐU\åñ•¢E´ˆaT¢KK¼³ª/\Õ7üq\ÚºgÌ»8ý»“k—„‚‹\'\äÿ\Ú7\î\ï\Ø\ËsJ\'\å»ëŠ²X›F‚h-\Â`kñ\åúižñ\ÌÑ™óÿ\Ïs{¦\Ôo«œ°¢\Ô÷§@\áoýùÏ•Ì©-œ:\Ñªt—Np&x¼¼\Î‘ ZD‹0˜ZôÌªò¿T?\í\ß\ïŸwô¡ø¿\Î\íŸZ»¿¢¬µdÂŠ’	..^TZüf™\ï\åÊ‚GC¹uÕ¹%\Õ.O\È\í®ðf²‡z4\ë\ï\êÕ«h-\Â k±hf•\ï\Åúiºÿù£üüó‡p¹qê‘ª\ê=e\ÕÊª——…–—V.))YT\îz©&\çÑºÜ©u•5®\â*O -¦+.]º\Ô\ÕÕµcÇŽu\ë\Ö-[¶\ìÌ™3h-\Â\àj±\Ò÷\â$\Ñ\â\Çy\íóG^þÿf<~v\Ò\ÌÎ‰“7\×T¯U­¬¨ZUVñ—Ê²E5×ª=/V¹¾_žÿ@y^Y(\ßU\ír•£\ÅTB«p©!NŸ>\Ñ\"ª¨ô½0i\Úg¼pô¡_}þ\È?>\ë¥Ó¾dj\Ó\æúÊ¥µe\r•/«¬\\VQ\Ó\\Yýiå„K‹~È›W6nJÝ¸¢\Éù®\Ðð\Ò\âùó\çûûû³)>\ë=š„ˆ\Ñ\"-z_˜\Ôô\Ç\é\Ï	kñWŸ?ø\Ó\Ë3~x¬¡iCÝ„Oª‹ÿ«¢ô¯\å\å\Íe5«\Ë\'®©¨ZYVú_¼¿-/üqM\Þýuù“B®ªR—˜P\ä-óøJ†¬<\Ø\Ü\Ü,\ÒÙ¸qcv„hg+V¬lQr\Æ\î\î\î\åË—£E´C¥\í}qR\ã\Ç\Ó\Òý\à?þ\ÐkŸ?ø\ê\åO™2yM•ÿ\Ï%ž?ýÿQüÏ’	Ÿ–U,-VV­ª¬ø´¢ôÃ²À\nŸ)?«||Me^°º\Ðò•Y-\îÛ·OI\'kZLvh-\Â\Ð\Òb\Ã\ÇÓŸ\éšõ‹ÿû\à?}>\ë•KÓŸ:2y\Ê\Ú\Ê\àŸ‹‹þ\Í\ïù\Ø\çù8\àû÷’\âÿ,+_VZ]U½®<´¶¸üÓ \ïwe9\ÏTŽ{(”S[SPR\í\nTJÚ˜úL\É\n\è\âÅ‹{÷î•´K~\Ê\ïÇ¿v\íšzõò\å\Ëò§¼¤¤#\Ù\Ùñ\è\í\í5Ux»ºº\Ú\Û\Ûe\å;wJºgZAG__Ÿ©„žžÙµlu96÷ˆ\Ñ\"a-þ\Ûô¿\ïœùóÿ3\ëŸÏœqúŽ7<¸uR\í²PÉŸKŠ>ò~\èq\ä÷~þGI\é§Ê–M(_^R¾´dÂŸ*‚ÿ3\äùÇŠ\Â•\å?Rž7±*\×W]\à®,ò–fM‹’”i¡C¤V8r\ä\È\Ò8\Ñ\ÖÖ¦\×Ù°aCtKŸ,\ÙE\ïTô§K!®^½Zo\Ò\ß\ßogh-\ÂP\×\â\Ô›öãŽ™?»6\ëg\×\ï\éü´ÿ~ª\é‰}\Ófnš\ZúkeÑ¿zò»\n>t»?òý«\×ó±\ß÷\Ç`ðÏ¥%ÿ9¡bIY¨¹¬\ì?J}ÿ\Ó_øj`ü\ìŠ1&s×º|\å\Ù\ÑbGGÇ’%K´tŒ~LJ‹ZsÚ†\Æ?;O‹[¶l1:-¢EAZü\×i?<xÿ?\\y\à\Õk3žÿ¬ñ\'g\Z\Ð=\í\Û{\Z\ê\×WzÿZTð_®¿¸Š>q{>)ò~\âñý\ÕXZ\\²¢´bCiõ\Ö\Ò\ÐÆ’²eÿ‡~\×\Ï&\ä}/”\×*(¯,ò•yœ\æŒöµ(õS¥’M›6I\Ö&K¤\î,Û½{·\Ôs\íW¢Es+V¬uNž<yõ\êU\ÙD„+K´û\âiQë¸µµU*\Ýû÷\ï¿r\å\n•h´\Ã_‹/LšòQ\Ó\Ó¦Ï¿4\ã\å\ËMÏžú\ß\ÏLùû“Sž<2©qß„\à6wÑ–o[¡¿\ÍhsÛŠ‚mž\âm¾\Ò\íþ	;å»Š+w«\Ú•\ëü\åKüÅ‹ý\ÞWJ\ZC¹ž\ÚW¥\ÇQ;£}-j•D\'tIu€œ?>úö’mÛ¶i¯YhQì©ŒL—Z„‘¤Åº\É5þÝ¾i/]˜ö\â\Å\Æg\ÎLþñ©úž¨{üHh\êþ€oG~\á¶÷ö\\ÏŽ<\ïŽ|ßŽ\ß\ÎB¿°£Ð¿\Í\íoó”´y+¶ûB[}¡\ržò¿~Ì¿¿f¼{RAa(\ÓZ\ÔXI\è$MKoOtWW—Ú¤¥¥%ž¥º}ô\èQz¢\Ñ\"Œ¬{¢g†‡s\×ÿK\ãÜ½M\Ï÷7¾p¾\á™Ó“Ÿ>Z÷\Ý5l+›°²ð¾ÿ¸û[ó\î?}\ë\Þ?\ßu\ßÿ¾{\ì_\î÷—1a>3ö\Ó1ã–Œ\Éo\ï_YXüWoð÷\ÅEÿX\êš[^P[U\à\r¹œŽ×±¯E\Ð)yI56\Þ=\Å\ÉJ\êÂ…RN¨\Å\èú5ZD‹0b´\ØðÄž†y½SŸ\ïŸúÌ©ú\';\'Þ¿¹²\êS\Î\Âûný§¯~ñ¾ü\åŸ\Ýò•_\Üú\Õ\×o»ý¯}\í­;\îx\ëwüöw¼{\Ç\×ß»\ã®\î\ÌY”“ÿ›¢œ–\Ý7¹.§tba0K].ýýýk×®56ó­\\¹²½½ýúõ\ë\ÉJJ69tè¼ºj\Õ*5\Û(\\‹žh´ˆajQ*Ñ“>lx|\×ÔŸœ›ò\ìg“xrÒœ½U5\Ëü…‹s¿ù«o}yÁ-ÿÏ‹_ü_ú\Ò_ùo_þ\éWnù_½í—·ý­;¾õ\Ûo|ó\Í;¿ñ\Ú\Ý\ßú\Ù\Øû\æŽÿQ`ÜŒŠq‰¹®š\"ï„¬\rÐ‘´nó\æÍ¦_q¥\îr±#©\ãÇ‹\r=Ñ¢W½-¢EZœú½]SŸ9;ù™\Ï\ê¿|\âŒm%Eÿú\ßø\Ê/n»\å\ç·~ù§·|\ég·|ù\ç_ùòÿ¸õ+¯\ßþõ\ß\Ý1ö\Ão\æý\Ë=9o\çy\Ùw\ï\Ü\à¸Y\åy“*ó\Ë+ý\î”\ïtpKÉ©S§¤>kX³a\Ã›’\ê\í\í\ÕJŸvvvªdS³A‹hFc—KÝ‡S¿»sÊ{\ê\Ü7\é‰\ã5S[ýc\Ýõ¥Ÿ\ßò¥üÊ­¯\Ýv\ë\ë·\Ýú\ËÛ¾ú«Û¾ú\ë¯\Ýþ›o\ÜõÎy‹\îu¿—Sð3\ïø¹\ÆO\å•O,ôL,*ªL\Ë<ŒŽ\ï·;s\æŒ²#aœ¡\ËBRÛ·o\×=Î—/_\Ö\Ë\Ñ\"Z„Ñ­\Å?LùÎŽúŸ©{¦¯þû\'j·E‹_ü\Å-_üù­_ý\Õ·¿y\Ç7\ÞýÚ¿~Ï¢;\ï{Ì¸\ß\ä\å\Î÷ü ´`Î„‚\Æ	¡ò\Â@¥\Û]™®\Ç¦8c\Î:¤—\ïß¿_-\\³fi\É+\ÕK{ö\ì1.OQ‹{D‹h†|%úùº\Ú\ÅS\Û>é‡§j\Ü[7÷xmS[ñø?\Üó\ß^û\ê—ÿùö\Û\ßü\æ7\Þù\Ö=‹¾5\îÃ»ò?\Z[øA~\Þ?ø\ÆÏ¬7¡>?**-õ‹…4>Ð¾\Å\\¦%===:[4¾*Š\Ô\ËMcª×¯_\ÖIÚ¸u\ëVµ¼¹¹\ÙÔ‡cG‹{D‹h†…\'\Ï\ÙV7÷Dõ·OWL?T\\¶©\à\Þ¹ó\Ö\ß\Üvû\Ûw\Üõþ]cŽ÷NN\Îùù¯»\Ü?õ|BnumnA½«`0\ç[¼r\åŠHdÕªU»v\í:|ø°ñ\àÁƒº-–Ñ³E(]\ê\ÛÅƒ\â¬s\çÎ©™£|6m\Ú$…H\Æ	Y˜¬-öhœ|lÿ@\è$Wö®Jò‹\Ñ\"Ž\'.žüH[\í£\Ç\Ê\ë»óv\Þsg\Ë\×\ïø\èö;þ\×\×\îù\Ã7óþ}LÁ¹?+÷TE\îœ\Ê\Â…µ•®’\n·§Â“ZsZ´/:;;M\ëGwX‹\ÝdùÙ³gcN6±zõj\ã\è\ã½.v´h±G\ëihcNx\Ñ\"dO‹Þ™U¾\êjOž\ÕV3óHIpß¸\Û\Ö}õKŸ\ÞrûG·ßµð[9¿¿\×ý‡\\×¯¼¹OUŽo¬Ë­¨+ðMtUyý|øŸM-J2\Ø\ÚÚª\ï\\6ŽÎ‰®\\«AŽ&OiI\Éú---\Æ{œ%…”z´\Ôgµ1\å]”$tv´h±G¦’\Ñq\â\Ä	´ˆ!\ëZœU\å{±.ô‡úiÛªšºý¾\íc¾öÉ­·ý\é«÷ü\ë½9òþ\ÙWð\\i\á÷*\n\Z+*«\\Á*—§²¨¨<£\ï\ÈAtWWWGG‡ü”\Ô\Ïze©\ÛJ}VrÉ“\'O\Z\ï¼zõª¤fR«=vì˜±ö-r”•Å›\ÆN\ê¤\"\Þy *Z„!ªE_X‹“*þPW¿­lRg‘ý˜»ÿp\Ç\Ý\ïÝ™¿¨\Ðõ›\â‚„r\'\Õ\ç—Ô¹‹+¼Åªk¥$õ‰f3\×=R-¢E\Èf¶’Jô„\Å«¶ú+\Úó<?\æõqc\ä\ç/Í«pÍœ˜¨/,¨-ò”e\í!A´ˆap»\\ª‹\æM\n¼\nl(ðnSø¡{\Üß—ŸÊ¿?\äš\ZrUT¹\'– E´ˆa\äk\ÑSRR4­\Úýƒz\×k•ù\Ê\Ëû\ßcrÿÉ—óÈ¤¼‰S\nŠ\ëÜžP‘·<û\ï	¢E´ƒ—-—º&V<0%\ïñ\Ú\Üy¥¹\Ïùó¾3ÁUW\í.­q{«ŠŠ\Ê=™\ìqF‹h-\Â\Ð\Ë%®’šÜ²†ÜŠ¦\Ü\Ð\ÔüªI®ò*OÉ„p\ïJx…’AyGH-¢EL-jr}\r9\Þ\é¹E\ÓóÝ\î¢\êAGH-¢E¼Jô	¢E´h-¢E´h-¢E´h-¢E´h-¢E´h-¢E´h-¢E´h-¢E´hø\Ä\Ñ\"p‘\0Ÿ8Z.\àG‹ÀE|\âh‘S0ò.b´ÿùh\Ð\"\Ñ\"€%/F‚ó\0h\0-Z@‹€\Ð\" E\0´h\0-Z@‹€\Ð\" E\0´h\0-Z@‹€\Ð\" E\0´h\0-Z@‹€\Ð\"\0Z´€- E@‹\0h\Ð\"\0Z´ˆ- E@‹\0h\Ð\"\0Z´€- E@‹\0h\Ð\"\0Z´€- E@‹\0h\Ð\"\0Z´€- E@‹\0h\Ð\"\0Z@‹€\Ð\" E\0´h\0-Z@‹€\Ñ\" E°øPbÐ‹²¿­\Åjv\nA‹€!	—}Á2†‚“:\à˜e¢E@‹„Œ†‘\Õ\Êh\Ð\"dC‹©\'h\Özr¶•³\Í\Ñ\" E\Ú“+\Ê~ò\å\ØJi\×bR%Ð¶h-:×¢³\Ztô«67Iq¿6‹B‹€G¸\ã]ð\É\ÚÄºvl\ÓqvÆ¦\Ü\î\×~\åš:€\Ñb±³<+\Åþû\Í\Ò\"m‹€1£]=%[\Õ#\í\ËÅ¾1\í$¶š#\í—C¶hqti1¡z\ÒÞ¼\è :Ÿ-\Æ\Ì+µK¢E@‹£B‹IuÎ¤RµnŽ´phR]46ß—³¾\Z´h-&\Ðb¼,\Ìk\ãÞ»d%\è¬a\ÑZ‹\Éö½ E@‹£¢a\Ñ~gˆ%5(©®ž{K\È-BJZ´\ß\rTë¡\Ü3C#÷¡E@‹£W‹Éº,E-:s¨ƒñ:iŽ-ŽÀq‹v4aß³){\Ìô-1i¿7-Z\ÉZt¯¥2´Åº11-C\Êm\î\×qZ´82Í˜\Ô\r\'6…\èMÓ\Ò\ÎòV-		\Ç{£E@‹ñûu­8h3M80-ZHh\Ð\"\0Z´€- E@‹\0h\Ð\"\0Z´€- E@‹\0h\Ð\"\0Z´€- E@‹\0h\Ð\"\0Z´€-r\n\0- E®\îC‹€l™\ÑB‹\Ð\"Œü\Êr´\æ,\âD@‹0Z\Ìhô]´þb®€a„kQ+/úwœhF©g\Ð\"`F´h\Ð\"N´˜-ZHN‹œ%@‹€\Ñ\" E@‹h\Ð\"€-r~\0-fD‹€-\âD@‹\0v\Ì\Èi´h\'Z@‹€ì˜‘h\Ð\"N´ÇŒœ\n@‹\0\Ó\"\ç\Ð\"ÀMf\ä$\0Z@‹€G\ÏD‚+-¢E‚@‹hqdi‘ó\0üG¡E\àŸøB‹À?1ð…b\à?\n-\Âhÿ\'þœ\Èz E´ˆ\Ñ\"\Ñ\"ZD‹ZD‹h-h-¢E´H E´ˆ\Ñ\"\Ñ\" E-¢E@‹ZD‹€	´ˆ-¢E´ˆ!\ëZ–d\éØœ\îI¡E´d‹h-¢El-úÊª‚uÓŠ)nšS\Ò4»¸q¶ütŒ\Ú\\Š’ƒuÓ¥p´ˆ\Ñ\"3-Š\Ë\ç¾Rý\Ò\Â\ê‹«_þ z¾°(>\É\Ï¿—\Ë\ç.3¢E´ˆa˜iQ\Ò:QX\Ã{­·Ô½\Ñ\\û\ë\æº0\Ë\Ùüæ†…­R`\è\å÷¥p´ˆ\Ñ\"7-6Í‘<1\ì\Ä_~\Zz\á\ÝÐ³o†\æ½z\îm\'È†Ï¾YýÂ»µ¯\"f¬yu±Ž\Ñ\"Z„a¦Å’¦\ÙRw–OœXú\Ð\Ó%\Ó+¹ÿ{¥3Ÿp€l(›—>üt\èùw$y”:uqc¶µ\Ø\Ó\Ós\æÌ™Ë—/g\Ô.\\8r\ä\Èþýû¯]»–\Æb¯_¿®ŽÿÒ¥K:ò“\'OÊ‘÷÷÷£E´ˆ-*Ñ³«\ç •_IôDjÁI3‚“g7<\ì\0\ÙP6—Bª~ò›°_Y”\ålñØ±cK#!¿—±gÏžµ¿£mÛ¶©8p \Î:u\ê”*¶««+\Ù\r×®]{\èÐ¡„k.[¶L\Ê\ï\è\è@‹h-Zf‹óÕ‰\ç½%\é\Þ\r\'6\ÍqBÄŒRHÕ³o\Ö†\Ån\ÑZ”\äk©Ø³gýõöö677\ËVkÖ¬t-JÆºr\åJµ\á®]»ôò\Î\ÎÎ½Q¡VÛºukôK\çÎC‹h-\Zµ¸,ô\Ü\ÛRVNW¥“G™Q\n	\Í{[\ÒOIB‡‚OŸ>­®^½zm¬p E‰;v8\Ë\ì2‘-\ÊúË—/W\ÛnÙ²E*\ã²P¿5›\Ñ\ÝÝ\Ñ\"Z]Z<q\âDÌ­TªeÒ¢¤]+-CkH~±^Ó˜ÁeH‹\êm¶´´\Í(	\à–¨P+¬_¿>ú%\Ù;ZD‹hqti±££\ãT¬X±bE´\Û\ÚÚ–¦)\Ä8Æ’¥R¿<~¨M¤†o\Ù<\Þ\Û\ï\ï\ï—J½*aÿþý1\×Ñ§‚¶E´ˆG²w\î\Ü\Ù	%8	ùEþ”Zóµk×´“j[\Ã\îMSHQ1SBg¡r:k3nÜ¸ñ\êÕ«ªkh\ÕÍ¡3\\\ÓrýE‚\Ñ\"Z	Z\Ôu\Ã\è¸r\åJ\Z\Û<(B‰\Ù\á\Û\Þ\Þ.)ž¬`¿¦,{\ì¼9d‰zID\ï%k-J\\¾|YÚ¼y³M\Ûjw£E´ˆG‚»ººvGB\×|\åµÄ˜-&Õ¶\â&j™†+ž?^\×¶$j-šFY·-\ê±G	µhJ\Ï\Þª\ÉaM\ËõHO´ˆ\Ñ\â\èj[<+”Ñ¬µ(žR#þ$%4UŠUH9º\n/Ù«ª\ÃfA‹²¯M7\Çñ\ã\ÇÕ°\í±B\"•\ë\è—\Äûh-¢\ÅÑ¥E\Ç\ã»»»\Õ(E	‹!\Ó===º/xÝºu.\\È‚£ßˆ²›pn?\ä\ë-¢E´8*´¨l•0bv\Ý^¿~]*\ÅZñºw•V¢6c\Ì{µûbv7kC™B\åª\ÑZlmm\Ý<K–,\ÑZÜ·oß†$C2M´ˆ\Ñ\âHÖ¢¤u)Þ™\×\×\×\'²\ÐNÜ»wo{$,z~$¤»q\ãFµ‰l~\åÊ•xZL{O´1[dª´hñ&-ª´K¨¶$CKG\Äj\î#%«þn\É\ÚNž<³“Z\ßW\'I¢\ÎE‘¦þ­Eñl\×Í¡oÎ“5\ÞKIiQ\Ò\Û6BŽ-¢E´8µx\â\Ä	Q’iu²¹˜n\ÔÓ†eôöö\ÊIÕ’5kÖ˜L\'ug\åPÑ±šœ\æüùó«W¯Ž™¾e®\':zwZ¦\Ö\Ñ\ÒÒ‚\Ñ\"ZQZÜ¾}»¨¬b\íÚµbqÓ–X¡}ý’q={ölÛ¶\ÍØ§¼s\çNµ\íŽ;L\r|Ñ\"S9*Óšƒ¢E‘õ\Ù8¡\î\ìF‹h-Ž4-\ê¼L‡i±›Â¤÷‹\"õ\Ýuº\çZ\Ï±~ýz\Óú1§MÌ¾%“=\'\ÔHO´ˆ\Ñ\âHÓ¢\\Û’úµ··:t(\Ú8Z\r©kQIVÕ——,Ybœªk\åÊ•ª®mÿ.—\æ\æ\æ\èf>\Ý6jZ®;©©D£E@‹©\ÐQ7À{t7±©ý\ÙgŸÙœ\àZKJ[,f?Œµ³\Ð­µ¸.N¨7‚\Ñ\"Z]ZTÍŽ7n´­¢§§\'\Ù%œ\ÆB‹;w\î\Üs\èú¸\ÔúM/\éfM;Z\ì\ë\ë“Ê¾X^iQ\Î@¼Mv\ïÞ\Ñ\"Z]Z”Š­–—¾\'Z\'P[o‹\'œ˜nŽ6õðH\Î%~‰¢ob\ÄT\Ú-Ü­»}\Ô\Í6\"k\Ý\åo@’\ZH„\Ñ\"ZŒ©Å‘ù\Ð©\îi5°&•©^¼EŽz\ä¶ú\Óf\Ú\Ø\ÝÝ­:\Ê\íkQŽ\\¬½I¼—,Yrð\àA\Ú\Ñ\"Zí¸2iQ,¦î™“\Z¥jDSƒhQŠ’Š­¾OMÒ£$%\å“GÙ…\È\ÑÙ£S™[Þ—ºùO9Wwø\èlqœPZG‹h-š³Åd‹o4W¿ðn\é\Ãiy \êS¡\ç.0\ë•hñ‘Q‹:³“?E\Æ`TeSTb¬ù^¿~Ý¤³³g\ÏJ\íX¬ª£újL,²•¤¥Fi\Ê^Z[[:d1•Nzµ¸}ûv½\ëÃ‡»\\,\Ú\Õ\ßh-¢Å›³Å¦9\Õ~ß°°µöõOBÏ¿#‰žTCó\Þv€l(›‹k_ûK\Ã{›«,.nz4Z\ì\ì\ì\\¿~½$>z€‹øN+Rw¶\ìÛ·\Ïh.²P\Í\Å \î[¹r¥¾™O\ßÀg¬lZÌ #\å–-[¢;©%\ÍÌ‚\Õ<µb@cŸL<-\Ê\Û	•\ç®]»-¢E´h¬D?Rý\ÒÂ†÷ZÅŒRój\Ã4;\"¼¹\ä‰\âÄ°_^(…gA‹Ú€º\Z«³\'±’zÎ§öŽ,—´@M¡f‘Q³m\Õ&¾\Ó)˜u\\ºtIòPÑ´\Þ<;¸’\Z½|˜\ÆN\ÆÓ¢i\Ú1Éˆ\Ñ\"ZD‹#X7½|\î‚\Ð\Ë\ï×¼º¸zþ¢\êW\"\ÌÿÀ	z\Û‹Å‰s_\r\ÔMÏ‚ûúút×ªdyúÞ’;wZô\\¸p¡§§GL$U\ì#GŽˆõº»»ý¼b™Í›7Kb•TE\ØX!J	¦¨-Bö®\æø’\Ä3-OX=p\àÀ\êÕ«µ\ëu=zT\ÍY+º7µ„¢E´ˆ‹}eUbFI\ë\Â]ÉsöA›yT\n\'J\á\Ùl[$R´ˆ\Ñ\âI¡E´\Ù\Õb°$K\Ç\ætGH\n-¢E [D‹h-ZD‹h-ZD‹h-ZD‹h-ZD‹h-ZD‹h-ZD‹h-ZD‹h\Ð\"ZD‹h\Ð\"ZD‹h-¢E´ÀZ\äŸ€ÿ(´\È?1\0ÿQh‘b\0þ£\Ð\â¨ý\'&ˆôWZD‹\Ñ\"Œ2^Œ\ç\Ð\"\0Z´€- E@‹\0h\Ð\"\0Z´€- E@‹\0h\Ð\"\0Z´€- E@‹\0h\Ð\"\0Z´€- E\0´h\0-Z@‹€\Ð\" E\0´h-Z@‹€\Ð\" E\0´h\0-Z@‹€\Ð\" E\0´h\0-Z@‹€\Ð\" E\0´h\0-Z@‹€\Ð\" E\0´€- E@‹\0h\Ð\"\0Z´€-¢E@‹©¼\çp°²iCû\åX”l\Ç\Ç³ðT,ûG¼ó€-]-Fo˜^-\Ú1\Ô\âDB•[„\ãm•\ÍSw\"Z´˜j&\â@\Ö\ÊH¯S?\æx6OvC\ëmS<\É% E@‹\ÃL‹i¬\ä¦b\ë:¾3-\ÚyG\Ép\ÂÓˆ-¦³†ë¬™\Ì:QJ6KJ‹¯­;\ÚqÖ†²yx	\ífq\Ì6ac6> E@‹ƒ¦E›õ\ÄÔµ\è\à˜\íWck1Ù“c§Õ¢ü´4h¢E@‹{fõ™$\Û<—TU4Z´pŸµ¹RÑ¢}\'&›-&«E\è\0Z´«E\Ç&J]‹Iõ\ÉfY‹)ö°\'<ó\Éö\Õ$¬Î£E@‹i®öÆ¼\\“j^´®<:\ÐbŠ_\0)veN‹vD™–þ´h1i-f¨\Û4)g®¿Å­;.\Ò\Õ•–\Ñ?ÉŽ\nB‹€“Ó¢ƒÎ™\Ô3¯lj\ÑYŠ—–þ–˜ƒ\Ö%¤«a-Z¢Z´¹U¦µ\èx\Äbºº¡\Ó^Oø1¥\îD´#¿\Ë%•šµÍ›\ç\ì\ß`—\Ñû[œI\Üfò˜ÊˆEg\éžý\Ú:Z´˜A-f³ÚºÎ˜‰‹£#S1u²÷Þ¥·±\"\í\Ý\Ðh\Ðbr©b\ê÷\Û}\âL‹v\\Ÿ°s#]ý-6\Û\rS¿·2½wC£EE\ã“j\é\Ë\\7töµ˜TŸoºú[œõø\';\Æ\ÛA	h\Ðb} Ž;\ì\äMvÆ 8\ë{q\ÖÕ“Ô”öOKŠéžƒR™p\"Z„Q\Ñ‰16\Ý\ál¦¯Œ&\Å\ÉÞl¿Žg6K½%7-\ã\Ñ\"Œ|-JÛ¥}-¦ž\æ$5\à\Æk{6Šµ\èx\ãžôt\Ý/„-fC‹\Ùl(H\ï\\A\Ãñ³@‹€2Z´€- E@‹\0h\Ð\"\0Z´€- E@‹\0h\Ð\"\0Z´€- E@‹\0h\Ð\"\0Z´€- E@‹œF\îC‹€l™\ÑB‹\Ð\"Œü\Êr´\æ,\âD@‹0Z\Ìhô]´þb®€a„kQ+/úwœhF©g\Ð\"`F´h\Ð\"N´˜-ZHN‹œ%@‹€\Ñ\" E@‹h\Ð\"€-r~\0-fD‹€-\âD@‹\0v\Ì\Èi´h\'Z@‹€ì˜‘h\Ð\"N´ÇŒœ\n@‹\0\Ó\"\ç\Ð\"ÀMf\ä$\0Z@‹€\Ó\Ä3Aù@‹h‘ ´8\ØZ¤²\0ÀŠ\Ñ\"\0W(ZD‹\0\\¡h-p…¢\ÅÑ®\Å\Ï	b˜ZD‹h‘ \Ð\"ZD‹\Ñ\"Z$´ˆ\Ñ\"A E´ˆ	-¢E´Hh-¢E‚@‹h-ZD‹h‘ \Ð\"Z´A°$K\Ç\ætG\\TZD‹d‹h‘@‹hq°µ\è+«\n\ÖM+n|¤¸iNI\Ó\ì\â\Æ\Ùò\Ó1js)J\n\ÖM—\Â\Ñ\"\Ñ\â0Ó¢8±|\î+\Õ/-¬^°¸ú\åª\ç‹R\àƒü\\ð{)°|\î1#Z$\Ð\"ZfZ”´N\Öð^k\ã\Â-uo4\×þº¹.\Ì2GD6£¹aa«zù})-h-7-6Í‘<1\ì\Ä_~\Zz\á\ÝÐ³o†\æ½z\îm\'È†Ï¾YýÂ»µ¯\"f¬yu±Ž	´ˆ‡™KšfK\ÝYR<qb\éCO—L¬\äþ\ï•\Î|\Â²¡l^úðÓ¡\çß‘\äQ\ê\ÔÅƒ¯\Åk×®;vlß¾}Gu°ù•+WŽ9bg\Û3‘¸p\áB\Z/ªƒ\îˆ²<\æú²w9ÚŽŽŽtÀ¥K—8\Ð\××—\Æ7uùòåžžž¡i±ýû÷\Ç<\á²-ŽªJô\ì\êùH\åW=‘ZpÒŒ\à\ä™\Å\r;@6”Í¥ªŸü&¬\ÅW\r…lñ\âÅ‹Ë—/_ºt\é†\rœ‰I¶]¶l™^\Ò\ÕÕµ<&.„H$W\éúõ\ë—ÆŠxZÜ¶m›Z¡··7\æ7\Ä\å8!ö^ÿÜ¹s\ê\ÔmÜ¸1oª½½}É’%\ëÖ­‹y\é\nùtz\í…ñsTwt\ÈGY¶8Qhq\Þ[’\î\Ýpb\Ó\'D\Ì(…T=ûfmvµxþüù¾ø±yófõ\Ï-Ùœ\Åjýýýv´x\è\Ð!U\Ú`iqÓ¦Mñ\Ö?u\ê”Zg\ïÞ½Ñ¯\ÊÂ¥ñ#fJ(ûR¯\Z\Ó%‘\ï:!\ß1r\íÚµR\àÊ•+¯^½ª¿iš…\ÚT\Î\áÃ‡÷Ç‰\ãÇKŠ·\Ô^lß¾=\æ[F‹hqYè¹·¥\"¬œ®J\'2£š÷¶¤Ÿ’„fM‹r-M9Ö¬Y3ôµ(vø\ì³\Ïô\n’ì˜ª{jµ––\Ór©\\\ïÙ³\Ç\â\í\Ç\Ì\Ýd_+V¬Pû={ö¬ukŠ˜Ï“\'OªWw\íÚ•0G3…©¨Õ«W\Ç[s\çÎ:qNV‹òõ rd´ˆ‡·Õ¥;\Z´h´‰„\È\Î\æ»Û½{·Ò¢œ«“†w-W­Z\ï:::Lj%»-\ÃB‹\ÊVr>¹yOO\ÏÁ8!‚‹\'¦\r6¬ˆ„¶˜ü¢–H^¬v$™é…Ø¸q£*G/Qy«I‹z§h-{-\Ê\Ù\ç(\Ú\ÚÚ¢µ¨\Z\Ý\ä\ÚV—±úS\ê}ƒ¨E©Kšjú\'NœXm/\ÄeJ‹’Y^\å­\ÉB‘ˆÉ¶[·n\Õ\nnmmµ0]t¨2£W\Ö\í¼[¶l±\Ù9£SB©[ô“¨uÎŸ?oò¯\Ô\åõ¥Ec;i<-JŽ¬\ÞZD‹\Ã^‹1\ÔTµhU$\äj¹‚\\&-\ê”\Çr™\r¢EUñz\Ûå¨º»»£;\Ç7m\Ú$9—øEþŒÖ¢®½š¤£Z!å¬ª?\Å\ÅrrÄ’\âµT´(%¨\ÝI–ªzù%/³\Ç+G\ì©Ö·\ÖhÚµh\Ü5ZD‹#S‹\çÎSÿ\Üñ:¢µ¯ÁÞ¦\ÅSr­¶´´\ØL‹lj1\Þñ«\ÞØ‰aê˜–3S‹ª3JŽ3f\çŒ\Öb²S‹\â,Sª¨»€¢….\'P‹I>¥uZ”=\ê\ÖUy›¦VW\Õ$S‹rª\Ñ\"Z\ÞZ”b©$öööö\Ç\n\Ý?+\ë\Ä\\¡§§GòÉ­ŒyVw$´ÕŸ’UYkQ.Q¹\Ú%3M\è²dµ(®¹t\é’\Å(\"S®*++\r‰û\Ô“\åø¥V.K\ä=fA‹ªÁNö¨úv$ñT_f’²E­Q¢W!‚»~ýº3-:\èr\Ñõ}´ˆ‡·M!É†©e\Íf—\ËÊPý\Ñ\Å\Êe/&Š\ç²dµ­cn¥Dl¼z÷\í\Û\'K–,Y¢+\È&-j›¨*mFµ(\ßL\Ê\Ñ\â 99«ª½R\ÏÔ²!\ß\"\Ñ\ã\n$I7~i%•-¶„*Ö¸D’\Å@\"´ˆ\ÑbZ41þ)5µ…­Å¶¶6‹5õ\à=üPu1¯g“\Å51kÐ™Ð¢Ú—õÌ³g\Ï\ê¾•\äJ¯\ÓFI3\ãuød¢mQb\ëÖ­h-Ž-Jnr\ÆzK{{û™›Cut:Ó¢\Ô\nõ­\Å\r6>|8].²»˜=k\"¡\Z\Î\ÔPùSw\àÊ‘«¤¦lÔ¢G2µxRH»UZŠ\é\ÔXH\Éõ{•\Ð·•ƒ\Ñý\ÂRŽ¤\ÆzœPK$ô\0–w—º\Ãt\Ð\"ZöZ4µ\Ð[t¹¨”Ê™³\Ü³C)^\â£%“U\ê\Z“¬iñô\é\Ór&E²\ß\î\înedõub\Z$(	ct}Y6\ÔCSõMœ7\í\È÷b\êZ4–\Ñ\"ZŒ¡EI9\Å,r\Ñ–c–,ù\ïv{\Ñ\Ù\ÙiªD‹;T—Ktwy&º\\ôPD•ØŠ”U¿¹$Œ’\î\É&rSH\ÈKjC=šRT»+úv=1¬Z\Ò\ßß¯ó\Ó\åa\ÌFK\âiQN8ZD‹´-š\ãúõ\ë¦\æ$U,-:ž\Ä%^Û¢±E\Ò4x0sZTc¡L#%Ož<©†YG___\Ì23\Ñm,-¢E´x#\ZS5\é‹\ä\\ƒ¥EU\åŒ9Œ\ÎD¡n£Ž\Ö\âµk\×T\nfº\ì3¤Ec³¬¢Ô©%¹\Ûb/$C´©EIB\Ýª\Ê,¢i¹¾\×\Û\Æ!ýh-{-\Ê\Åv\Êº\ËE®öS7G¼.q¢Iz\Ë`i1^R£GeZ„:ªh-\êq<¦©\"2¡E=FGô\Ô\Ñ\Ñ!ŽS}/ò§ˆ\É\æX\Ì\Õbj1Þ wû“¤\é\Ä-¢E\ÚoxA.WIj\Ôp\î¡\Ð\åo>1­\Åe±\"¡\å]D\'\íZ”o¦\èiiTˆ§¤v¼þ\æ\Ð,¦\å1o\ßÌ3Œ¡E´ˆ‡bO´Ig\ÑZŒ9™BB-J(a\0¥]‹\Ñ\íR™•Zª|\Ì\Ô\0F\É\å\í\ìNkQ*\ã\âM\ÙV\ÒOùdW\ÝzTiyÌ‘›Ÿ\ß<-ZD‹£¨mQÉ%Ó”‹3•®\Ó=\Ñ1\ïôHQ‹¢’\è@i\×\â¥K—$û–Š³”,\æJøhgZ\Ô\î³Ó°`1“£\ê\æ\æ\æ?´H—Kúµ¨&;He\Æ“\Û\Û\ÛÓ¢E5=šz\ê‹nE5\ÖO3\×mq¥¼£˜]Iv´(o|ß¾}r’w «\Æ\Ê\Þ\ÞÞ½Q¡E¿d=h-òÐ‚aù\Ð“°Ž\Üz\"U•ªCµúgH‹ª1+•ItLZŒ9Q®-öõõEOÁkœŽ!\ÓZTw¡X<c\'¡\åhÕ Kc­\\;^·r²m‹¦©¿\Ñ\"¸\Z®¸:|ø°j*2Í¯eÑ¶\Ø\Ö\Ö&Fˆ7#YB-JV\"ÉŽš1Z‹*‹1Í§Šc\ÎÁ¥µ(\Z:\Zñ*\ÑzqŸ\Ê4l0CZq\Ë\Ù0NÁ j‹y~\ìd‹\ê\ä\ÈOI9\í<›Ð¾M³Š¡\ÅÑ˜-†$[|£¹ú…wKN\ËQŸ\n=ÿ»pY¯DÇ‹„ó-Z„„Q‹z8›¾ñN®mI^\Ô\ïj’.ùS\ß#\Ñ\ÙÙ™F-F\çV\Îèœ„\éû#-ZÔ­r\Æo1¯\éÁr\êv”“\'OF?ö@u…\É&\Ñ/\éÊ¾\ì(\æS\ÉÎŸ?\ß+T(%\Ç|Õ˜,G\ÏB‹£,[lšS½\à÷\r[k_ÿ$ôü;’\èI84\ïmÈ†²¹8±öµ¿4¼·¹zÁ\â\â¦G‡©%%Ü´i“\Ô\Õ\Ål¼a\ÎtÁˆ1%¹xñ¢º’UÃ¿QÖ£F’Õ¢š52\ãÓ¥E\É\r%\ÅÓ£%ŒõY!ªy½\ä-\èŒ7“Ø‰„’“:h_\Ö\ßº\É-Ž\æJô#\Õ/-lx¯U\Ì(5_¡6L³#Â›Kž(Nkñ\å…Rø0Õ¢\é\Ú\ÐO‹Gµˆ‰2\äú”\Õô\ìa1g.H¥O‹r\0\Æ:£Ö¢\ê\á5…\êjÏ‚õ	t*m|u\çÎmmm\Ý\Ý\ÝÚ†\ÆS½*™ˆ7¬]Ç™3g$_–d(-\Æ|\ìZuZ\ÖM/Ÿ» ôòû5¯.®ž¿¨ú•ó?p‚\ÞvÁbqb\Å\ÜWuÓ‡‚¥ª¥28ûS~õöönŠ„¤6’\Î{WD1\" ˜óE\ËV\í\í\íªsS¶Šž\ÞÕ—\Ä\n9*\ãNÕ¤ª1\çY\ÉKª\âyð\àA±•. I–[ZZLj³±³º?Oö(_?\Ñú!\ß1O8Z]Zô•U‰%­w%7\Îq\Øm\æQ)Pœ(…-\Ä`Z–Z\ÊpQh-fW‹Á’,›\ÓqQh-’-¢E-¢E´ˆ	´ˆ\Ñ\"Z$\Ð\"ZD‹h‘@‹h-¢E-¢E´ˆ	-¢E´Hh-¢E‚@‹h-ZD‹h‘ \Ð\"Z€z…¢E\0\à\nE‹h€+-¢E\0®P´˜ø¤1”-¢E‚ \Ð\"@šx1œ@‹\0h\Ð\"\0Z´€- E@‹\0h\Ð\"\0Z´€- E@‹\0h\Ð\"\0Z´€- E@‹\0h\Ð\"\0Z´€\Ð\" E\0´h\0-Z@‹€\Ð\" E´h\0-Z@‹€\Ð\" E\0´h\0-Z@‹€\Ð\" E\0´h\0-Z@‹€\Ð\" E\0´h\0-Z@‹€\Ð\"\0Z´€- E@‹\0h\Ð\"\0Z´ˆ-\Öù\Z+›6´_ŽE\ÉÆˆ¹Žƒ·Êeè½ E@‹#P‹\Ñ¦W‹6Õ¦M*\ÖjKö\ßZ´8´\è\àR_<dS‹v\Ôc_‹)ž(‹\Ð\" \ÅQ¤EgY§\':Û©£JV‹	OZ´8Tj¸6K³¹gVZ|\íX\è\É\Ú6©\äÔ¢-Z–ZL¨†ti\ÑÁ1§Å‰\Öo\ÍA<©FI´hqð{3µ\ë;VL<\Ë$UBŠZL\Êøö˜l¶˜¬ h1Ztl¢Ôµ˜T\î`i1©nb›ã¬\Ñ\" \ÅÁ¬A[_\êI5/ZÅ™Süp6\ê\ÐqWr\ÌH½¿-ZÌª\ÖÚœ\é#)g®¿%•\×þ@K›­Žû\ë\Ñ\" \ÅÁ\Ñb*#Qœ\Ë-¦«1Týi}\éjXD‹€G mn•l\ÑÙ|i¡™b[g*C\Ð\" Å”\Æ\ÓØ¼­‡g\Û‚—\Ñû[ló¶#\åtÕ‚Sl\ëD‹€_‹\Ùì†¶®o¦ž*\ÆSaR-¤v\ÞNZ’M´hqi1©T1õq\ÑvF®8\ÓbÂ‡	»Gœµ¦~dz\ï†F‹€“ó…\ãÑ‚i\é†Îšm\î\ÑY¿‡}-¦Ø°ˆ-fC‹^§\Óù\Ùo’sv‹³¾;Z\ÌÜ¨\ZÇŸ\ÔX¢Tþ\Ð\" E‡\ín©\\{\É6GÚ¯f¦¨Eƒc¬ó\ÇÔ‡=\Ú?´hq¤µ]\Ú\×b\ê)’uÖ–\ì !›÷œdB‹\Þ4\ÍÈ--f³¡`ÐgH½´h\0-Z@‹€\Ð\" E\0´h\0-Z@‹€\Ð\" E\0´h\0-Z@‹€\Ð\" E\0´h\0-Z@‹€9€\Ð\"W÷¡E@‹\0¶\Ìh¡EŒ	hF~e9Zsq\" E-f4ú.Z1W@‹0Âµ¨•ý;N´£T‹	ƒ3h0#Z´h\'ZÌˆ-$§E\Î EÀŒh\Ð\" E´hÀŽ9?€3¢E@‹€q\" E\0;f\ä´\0Z´ˆ- E@‹\0v\Ì\È	´h\'ZˆcFN E€¿i‘ó\0h\à&3r\0- E@‹Y\ç‚ \Ò\Zh-G¢9\0£\çjB‹h€«	-¢E\0®&´ˆ¸š\Ð\"ZŒ\Í\ç‘\Å@‹h-ZD‹h‘ \Ð\"ZD‹\Ñ\"Z$´h‘ \Ð\" E‚@‹h-ZD‹h‘ \Ð\"ZD‹h‘@‹hq´,\ÉÒ±9\Ý*\Ñ\"\Ù\"Z$\Ð\"Zl-úÊª‚uÓŠ)nšS\Ò4»¸q¶ütŒ\Ú\\Š’ƒuÓ¥p´H E´8Ì´(N,ŸûJõK«,®~ùƒ\êùÂ¢ø $?ü^\n,Ÿ»@Ìˆ	´ˆ‡™%­…5¼\×Ú¸pK\ÝÍµ¿n®³\Ì‘\Í\ßhnX\Ø*†^~_\nG‹ZD‹\ÃM‹Ms$O;ñ—Ÿ†^x7ôì›¡yo…ž{\Û	²\á³oV¿ðn\íëŸˆk^],…£E-¢\Åa¦Å’¦\ÙRw–OœXú\Ð\Ó%\Ó+¹ÿ{¥3Ÿp€l(›—>üt\èùw$y”:uq\ã\àkñÚµkÇŽÛ·o\ßÑ£Gl~\åÊ•#GŽ\Ø\ÙöL$.\\¸\Æõ\àÁƒ;b…,·É¥K—:::,Ê”÷²ÿþó\ç\Ï\Û9€Ë—/÷ôôM‹É»ˆyrd9Z„+Ñ³«\ç •_IôDjÁI3‚“g7<\ì\0\ÙP6—Bª~ò›°_Y4²Å‹/._¾|\éÒ¥6lp&&\ÙvÙ²ezIWW\×òH˜¸4Hã•¿~ýú¥±\"žO:¥\Þ\ì\îÝ»c®pýúõÕ«W\Ë\n²šüžð\0\Ú\ÛÛ—,Y²nÝº\Þ\Þ\Þ\Ì	N\Îd¯½0žsõ\ÑD‡œ4´)g‹óÕ‰\ç½%\é\Þ\r\'6\ÍqBÄŒRHÕ³o\ÖfW‹’ûôÅÍ›7«F²9‹\Õúûû\íhñÐ¡Cª´Á\Ò\â¦M›\â­/¦Ó›HŽSs\êUÉª\ìÀÚµke\å•+W^½zU+4\'\nq®©œÃ‡\ïÇ—ƒYj/¶o\ßn,VNZ\Ä}™\Ó\â²\ÐsoKEX91\\•NeF)$4\ïmI?%	Íš\åº]šr¬Y³f\èkQŒó\ÙgŸYlr\î\Ü9•0®Zµ\Êt„ò\å¡^ŠNuc\ÆÉ“\'\ÕNw\íÚ•0G3…©(•¢ÆŒ;wnÛ¶Í™\å\ËL½#´h\Ñ+V¬%Z4\Z*^\ÈJ\ÍWVÞ²e‹q¹8Eb³õM\ÙJÞ»1\î\é\é9\'DpñÄ´aÃ†‘\Ð“_Ô’½{÷ªIfza 6nÜ¨\Ê\ÑKT\ÞjÒ¢„\Þ)Z´C‹»w\ï\îsmmm\ÑZ¼	1ˆRƒúSê’ƒ¨E©ŸÆ¬\é«8r\äÈ¡PÙ™\èF/mÉ»P5\âC†H\Ø&kr«E\çŒN	¥^l\ÑO¢\Ö1öù(-®[·N/QZ”Ÿ¦\ê|´%wV\ï-ZŒ¡E\É;b¾*\â[	G\ÌT\ZeÔ¢6fF)—\î jq\ëÖ­+;Ë‘\ã•&i©ZAªÒªG^ò²\'N\Ä[_\ì©Ö·\ÖhÚµh\Ü5Z´hW‹\çÎSLWW—M-\Æ\ë°©\Åk×®\Éõ\ß\Ò\Òb3Õ²©\Åx\Ço\Ò\â2a­E\Ý\n©_Î­Z¿»»;z”“œCIiQö¨\ÙÈ©“%òS/Q\Í\Ç1µ(§-ZŒqatttôöööÇŠS§N©FÖ‰¹BOO\äDgÎœ1BìŽ„ö£úSª‡\ÖZ”\Ë^\"™©M—\Ù×¢¸\ìÒ¥K	µh³\ÝP\ë)æ«ªÁN\ê\ìj\\ŽT¨\Õ¤l\ÑckTf§Bg=\î\ÇB‹º\\t}-ZŒ\Û\Õ\à¬\")—¥ýq‹z/+B$³+*Ù³gµ\Ë\ìk1ZIÒ¢ü(’¯9­­­ò\ç’%KL­bü\è1\0’P¿`’\Ê[Bk\\¢\Éb Z´8\ÈZ4µ\Ðÿ”\Ú_ŠBŒ\Öb[[[v´(^‹y–Œ\ã%Ïž=«\\©bó\æÍ’q\ë´Q\Ò\Ìx‡‘‰¶E‰­[·¢E@‹VZ”|\çŒ!$\ÇQ\Ë\Û\Û\Û\Ï\Üº\ÇÖ¥¦¹{ ´•6l\Øpøð\áLt¹\Èî²£Ec•V\'ƒb:Q¡¼*ù£¯:\ã÷\îÝ«.¥œk×®©\å-‘\ÐtZB|šº\Ãt\Ð\" \ÅZ4µú[t¹¬Y³Æ±³\Ü¯C\Ét\0²\Úy¡»P¢\Ë9}ú´¼kÑŸd»\Ý\Ý\Ýj¤R¿i $Œ\Ñõe\ÙP#\Õ7\\\ê\ÝE‡|‡¥®Ecùh\Ðb–´()§dI\"‚Á\ÒbÂ’\Ó;@G\rET=Â’S«›ÿ$a”tO\ÎÆ–-[,¦—Ô†zð¹¨vW$ô\ízbXµ¤¿¿_\ç§\ËÂ˜\Z—\ÄÓ¢œ´h1m‹×¯_ß³gqMIK‹	k\Çi×¢¾+\Æ8<û\äÉ“ò5“ð\Èûúúbp&z¢Å¢E@‹™\Òb{{»Ð˜¶¨‰d:;;K‹ñ&\Å1\Ö^%·£›Pµ¥N-\É\Ý{!¢M-Jj:0Ue–nZ®\Ú7£\Ã8ü-ZŒq%\Ë|\Êº\Ëe\ïÞ½§nŽx].\âD“:\Õ\ÍƒØ¶/QJ\èJ‘‹ø=\æ\Ì`b®˜\í\è1:¢§ŽŽqœ\ê{‘?EL6¿lb\Î~S‹\ÑÝ¶h:±E‹€3Õ¶(H¢¤†s….‹ù\Ä>,\î“w¡I~‘©7+\ï]u\rG\ßo£µDÏ¦#\ß\"\Ñ\ÓÒ¨OI\íxýÍ¡;XL\Ëc\Þj™!-\ZgC‹€GKO´\äk\Ö÷#‹\ËÔ€%5\ÝÝ¡[\îL‰¡ÔˆcVÏ£\Û\"Ä¹²Ž¤1÷®0JÞ\ÔÀ ©Œ‹7e[I?\åSXus\èQA¦\å---w¢E@‹ih[T£O2¤E\É4\å‚w<‡~ô=\Ññ\îQR\Ðù I‹\" ]#Ž\ÙV ›¿H.]º$kJi’2‹¹\Î\Ì\èL‹\Ú}ú\ÖL\Ç}D§OŸ\æ\æ?@‹C\â.—„ZTIœýš`B-¶··G¯£[N;;;cjñs\Ãt8\ê1/ò~\Åe\êo‹’!®”ubvû\ØÑ¢¸oß¾}rBŒw‹+S÷öö\î\n=0(ú%\ëA‹hxhAl-¹9\Äº\Ë\Åô’\êIÈUY*“è˜´s¢\\Õ¬&õMñEkñ\âÅ‹’Š\×\Ôýˆ\êö>Ñ™N\ÅVúŽ”\èAˆr~,ž‡“P‹×¯_—\Ã3\Õ\Êå³ˆ×­œlÛ¢i\êo´<\âê¦ž\Õü¤<’°m±­­M\\cq‰µ%Ó‘JMƒ­E•Ù™OÛ¦£\çõ\Ò\Ï0\Ê7Z‹¦P_j\ä~;¦VQI$¥\ã¢¶˜e\Ú\É\Õ‘Ÿ¢æ¾¾¾„oÜ¾M³Š¡EHO¶’lñ\æ\ê\Þ-}8-D}*ôü\ï\Âf½/Î·hª‚fÔ¢\"§§T_HBd|t”ü©\ï»\ÐuÛ´hÑ”¯\é\ÙŒ÷œ(-\Æ\ë¹6yPU\é[\ß{\'¹¡\é!¢Qu;ŠXxwT¨n+\Ù$ú%\Ý}úô\é˜óŠŸ?¾#V¨PJŽùªq\î²\è¡ThR\Î›\æT/ø}\Ã\Â\Ö\Ú\×?	=ÿŽ$zR\Í{\Û²¡l.N¬}\í/\r\ïm®^°¸¸\é\ÑaªEq‡hER0%\Ý\Ý? \Æ7I-U\ÙAUHZ±ùDf›Z\Ô\íƒ*”šMõt\íJ9\ì\Õ7‡±iO\×a÷\ïß¯¬g¼ûX\Ï\ë%»\Óõk\ã\Í$v\"a‚n\ÜL*tm@7 EHo%ú‘\ê—6¼\×*f”š¯P¦\Ù\á\Í%O\'†µøòB)|˜j\Ñt½\é§\È©r1Ÿ\\ó²šž=,\æl©Ô \ãiQÀXÝ·oŸ\éöd9*\Ó\ãM’–T®\Û\ÚÚ¤¶\Ý\Ú(%¯J&A?s\æŒ\ä\ÚË’¥Å˜ýC‹-ë¦—\Ï]zùýšWW\Ï_TýJ„ù8Ao»`±8±bî«º\éCA‹’©\Îþ”_½½½›\"!é’¤H\Æ\Þ©{J\Ý0\æÔ²U{{»\ê0•­ô1©hqI¬P½%!)ªÀ\îX!\Çý\à\áò]ó\ä EHõƒô•U‰%­w%7\Îq\Øm\æQ)Pœ(…-ZD‹#.T-¢\Å\ìj1X’¥csº#.T-¢E²E´H E´ˆ\Ñ\"\Ñ\"ZD‹ZD‹h-h-¢E´H E´ˆ\Ñ\"\Ñ\"ZD‹ZD‹h-h-¢E´H E´ˆ\Ñ\"\Ñ\"Z\0´\È	\0h‘\0\Ð\"$\0 \ÅQûA‘®@‹h‘ ´u^Œ\ç\Ð\"\0Z´€- E@‹\0h\Ð\"\0Z´€- E@‹\0h\Ð\"\0Z´€- E@‹\0h\Ð\"\0Z´€- E\0´h\0-Z@‹€\Ð\" E\0´h-Z@‹€\Ð\" E\0´h\0-Z@‹€\Ð\" E\0´h\0-Z@‹€\Ð\" E\0´h\0-Z@‹€\Ð\" E\0´€- E@‹\0h\Ð\"\0Z´€-¢E@‹\0h\Ð\"ŒðÿÅ@‹€¬´øC E@‹0ªµø…¨@‹€a0k¦h\Ð\" \ÅÁ?Î˜‡Š-BšES+ös1‹­,üesÍ„\Ç`\çð\Ð\" EHU‹ö­”¢j“\Ú;Z´C¥o×ŽM\ë8\Öb²{G‹€!³ZL˜\è\Ùoû³NÖ¬m\î-Z„,i1)ûØ¬ö&TgR¦F‹€axk\ÑNF™‰T-Z„ô4,&u\'‰=\ÙQZ´\ÃL‹©ŒLXr†\Z\Ñ\" EH³“\ê†N¯\Ó2:-Z\'\ãtÖ¶hSÁiV‰-BJ·£8È\ÔøpgZtvZ´\Íhÿ%gus…¤ñ¢E@‹\0h\Ð\"\0Z´€- E@‹\0h\Ð\"\0Z´€- E@‹\0h\Ð\"\0Z´€- E@‹\0h\Ð\"\0Z´\È)\0´€- E@‹\0hFžû\Ð\" E\0[f´\Ð\"\Æ´#¿²­9‹…8\Ð\"Œ3\Z}­¿˜« E\áZ\ÔÊ‹þ\'Z„QªÅ„Á´˜-Z´ˆ-fD‹€’\Ó\"g	\Ð\"`F´h\Ð\"Z´`G‹œ@‹€\Ñ\" E@‹8\Ð\"€3rZ\0-ZÄ‰€\Ð\" E\0;f\ä„\0Z´ˆ-\Ä1#§\Ð\"Àß´\Èy\0´p“9	€\Ð\" EH†gˆ\Züo£E@‹ZD‹>-røL-—Ÿ) E\à\â3´\\B|¦€a´_BŸ\Ê@‹h\Ð\"ZD‹h\Ð\"ZD‹h\Ð\"ZD‹h\Ð\"ZD‹h\Ð\"ZD‹h\Ð\"ZD‹h\Ð\"ZD‹h\Ð\"ZD‹hF­}ò\Óþ\éóýþb¿?PøD–ø#+\Èjz´ˆ\Ñ\"ŒD-úƒA_p‚\'P\éö×¸|u\Þ\ÉE\rùEM¹\îi\äùS\ÊK²‚¬V\æ	\È&²!ZD‹hFš%\ã+ö\Ë=þ‰…¾©yE\Ós\\Ž+˜}_Á·\ï\Í{ü\î\Ü\'#<qw®ü)\å%Yaj~‘¬,›È†>´ˆ\Ñ\"Œ-ú\á$±\Ü¨qy\'\ç5Dœxÿø\ÂY\ã\n[0\ç¾üG\Ç\ä?voùEþ”…ò’¬0=\Ç-+×‹]\ÞòH\Ú(E¡E´ˆa\Øk±\Ä¨rû&xfŽ\æK&8#§°1\×=5\Ï-–¬+ô\Ôz&º\"z\åOY(/\É\n3\"¥lòÀ¸\Â)ž\Û\'E¡E´ˆaxk1\àVù\ê<3rÜ\ÜW ù ˜®1\Ï=© (\Îý%\Þ@ œ†ñ\">Y(/\É\n²Ú¬±\áMdC\Ù\\\n©(òüh-¢EžZ”\n¯8NœXW\ài\ÊuK¥X²¿¦°\Ãy_Xˆ¢¸X})²P^*óø%Ç”•e“‘J÷´\\\Ù\Ö+†7L­6\Ñ\"Z„A\Ðb\Ð¯\Õ8Q~Öº<ªÿ\ÄoS¬þ½4²\á´\\\×3\ÖG¬*…£E´ˆa8i\Ñ(.÷&G\ê\ÎÊ‰R)Á\ÂCƒ\ÞÈ°DY©\Ô‚#U\ã\Ê\ä\Ï\Ò\ÈH\Åð¸\Å@xe\ÙD6œô·”\Ó=¥À#«ù\Ð\"ZD‹0,´¨FkK–W\ãò\Î_it©<1Iñ\Äw%^Q¡b¡wJ~\Ñô\\\×\Ìq…Ž\r#¿ÈŸS\Â\ãr¼²‚\ç÷\ßh T9\ãŒ\\÷\ì±Œ+œ\èòG\Æ3úÕ¦‡—\ÎV­Zµ<}}}vÖ¿zõ*ZD‹0”²Eqd8Žr~\Ñ\Ãc\Ãcnšò\Ü*OT\Ò\'V¹|’<Š\Z·ø\Ä\Ý9s\ï\Z/\È/ß¾7WN\Ï)¬/(’\ÕJ½%>eFI\Ã=0có\ëóÃ¹g\Ð\éx\Æ\á¥\Å\æ\ææ¥‘8{öl¼u.]º\Ô\ÕÕµcÇŽu\ë\Ö-[¶\ìÌ™3h-\Â\Ê\'x}\ryEŽÌ–úod<vP\å‰\Õ.oc®[\Ã9cò¿{O\î“w\åüÝãŸŽ ¿ÈŸ²P^’\ZóÜ²r‰÷F…Z\n©/ô\Ì\Z[ H\á²©JûGA¶h­E­Â¥†8}ú4ZD‹0d´\èVºý\ê>–ðø\Ä<w\È\í÷±øƒ*O\'>|_Áw\ï½!Ä§\Â6\Ì\Ñ<¥\åxo\î\Ãc\Ô\æ\á\áŠ\á{¨‹«\Ü\Þ\Æp\Çt¡º¦\Ê\í÷ûG{¶h\"ZD‹0\ä´(žªqù\Ô},=-jyE‘_þ”4P”÷ý»$=\Ìù\Ñ]¹?¼+\ç\élQ–ÈŸ²P~‘¾{Ož¬,µi\ÙP\é¯,\Ü÷R$\ÅÞŸ\ã’]Ô¸¼d‹+V¬lQr\Æ\î\î\î\åË—£E´CP‹Áº¯Ôg+œ*¹žÔ‚#·¦H5xb¡wz®K*\ÈO†U˜óƒ»\Â\È/OGrÆ§Ì¨—Ï½+GVžžS(R\íòIž(…‡«\ç…¿´k\Ñh-\ÂP\ÔbÀœ\\P4û¾©OŽtŒ(s•zýSò‹\Z[ð\Ý{r¥š,)¡¸\ï©!šøA$g”_de\ÙD<X\ê\rk1Vxü“<²Pv!²U‰¾pá‚¤c»\"\Ñ\Õ\Õ\Õ\ß\ßsµ¾¾¾\ã‘\è\í\íUK._¾,\ë\ïÜ¹³½½ý\äÉ“	÷\"+\Ë.ö\î\Ý{\ìØ±+W® E´#A‹\rùEß¾7o\Î}ùu…žï»˜\Ë<Ieù“F\ê\Îqµ¨j\ÓOE\Z¿}o\îô\\·l~\ãko ®\Ð;û¾ü\ïÜ›×˜\çd%[I™šðD@\ÑkŠþ\Ô\nmmm×®]Û²e‹–šŠ\íÛ·\Ç\ÛËž={LM„+W®<zô(ZD‹0Ìµ\è6\åº¿;÷\Ñ1ùµ…žÀ@\Û_E‘o\æ¸\Â\'\îw³üÝ7\Ú\ãkñFÇ´ ›È†²¹®¤Kú\Ñûò¿\'Wvðe\\‹¢6\í)“\ãö\ï\ßO‹[·nÝ´i\Ó\ÒXqð\àA\ë½HhuŒ\Ñ\"W-N\Ëu?yw\îc÷\æOty¼Z¬,ò=8¶p\î]\Êw9N\ÔfT?e“\ÇVh\ÑlL¾\ìbZŽ+\ÓÙ¢¤„J4+V¬J´,‘Š­¸oÉ’%²pÕªU’\ÆÔ¢Ž\Ö\Ö\ÖC‡I&(©ŸZ²v\íZ\Ó^:;;\ÕKR¬Ô ¥†.\ÅJ%\Ú$V´ˆ-²¯^½\Ú\ÒÒ¢D\Ó\Õ\Õe|iÝºujù\âiQRK\ãV\"G]7\íhÍš5\ê¥;v˜^’\Ô-¢E	•\è\'\"•h©\íú­Å›+\Ñ9‰*\Ñ9ƒ^‰©)\ËHV\ÝÚ¨^Ú¶m[<-šL\Ú\ÛÛ«_2.?r\äˆ^®;j\è‰F‹0r»\\|¦.—Ü´v¹ù3©E\í>\Ñ\âþ›C7nÜ¸1¦¥\îl*\íò\å\Ë1µ(¥©…’32@-tl\Ðq—zn\Ð)ÿ\Û\0üL\Ðikk[š(L\r…Æžh›Z”ŠsLÃ¢E´£c8wNaòÃ¹]\á\á\Ü~UHP\nTÃ¹g\Íøp\îÍ›7\'\Ô\â\êÕ«SÔ¢\ä•j¡d h-Â¨¸ù¯\Ìpó_½Ã›ÿ|\æ›ÿ\"s}gú\æ?Ç‰mn\â@‹ñ\ê\ãh-\ÂÈš*\"¿hzNøay\î*·\ï\Æ8jªˆ<÷\Ã\áªt\ÞÜJô\ß\rd‹ú—¹\áytò›cªo@\Í\\º1U„K\nŸ’ù©\"t/ðÊ•+3§\Å]»v\Å¸ƒ\Ñ\"Œ-FzWô\Äbáª®ab±R5±X^ò‹oL,¦&+\Ë\Î\Äb§NR\ã%b\ÞÓ’-\ê.—˜\â;p\à\0t\Ð\"o-\êih\ëcOCž^,~Æ‹¤“…‘ihscMC\ë’Tž\è7MC~tþ\älMC«þV¬X\Ñ\ÓÓ“	-ž;wN\ß\Ê\"»»~ýº±4\íe´ˆag‹\ê¡]\Þ\Æ\Ýü\ÐÿÀC|7Z®kG¦¤}0B\ä¡\î©ù\î\ÈC|%±Z >0¾°¦0K-\è\ë\ëÓ®‘Ê¬Tx9\"~<v\ìØ¾}û6nÜ¸iÓ¦µh\êò–ª´²eË–U«V™n7Œ©E©\é\ëaCZ¯rœz\áùó\ç\Ñ\"Z„A\Í\äX\î	Lx\ÄÕ´\\—T¥\r¸*x\ÄUÀøˆ«\nõˆ+Oøiªa!†\ÓÁÁÄ•xPß·\ëÖ­K]‹½½½úv\ZStvv:˜†\ÖÇG‹h_‹\Þ\ÈQ#•eÏ´\\÷¦¢\Ú\ë\'1>µ)R\ÈÀQýY~ ª$\\’¾\é´Qß¿,.“¼,fÿI´¯\\¹O‹j’{\Z\Ë_³fšŠB\ï\×ú˜xq\â\Ä	´ˆaHh\ÑF*Ë¾I\Þi*\Ñ\Ëu‹\Ý\ê=UnoYØ@¬*p ò\ØY!\äö\ÊÊ²ÉŒ\\•rº%gW®}{ZkQ‡TŸ;\"!)¤\Í\çð%/^”’¥ü\Ï>ûŒ¢¢EiZ¸\é%|7t}¤6={lÁ£cògEž\Ð2© ¨\Ú\å«ðø#\rˆAõHh\äy/’†\\\Þðø\Ä<÷ƒ\ã\n½/?\Ò@\ÎÅ‰\Î\æ†H—yN4 EH\Ã%$ÉÔ¦§x\Â=0c\ÃZ?ú*ÜµR4¹ÀSW\èX\è­q…‘_\äOY(/\É\n3r\\¢Å‡\Ç\æKõyJ¤\î¬\ï°F‹h-\Â0Ö¢Txƒ\áJq`¢\Ë[Ÿ_\Ôy(\àý9®Y\ã\nÕ­Í’>6&Œü\"\ÊByIj\Í\ÓsÜ²ò\äü¢šB©tK>L±\îŒ\Ñ\"Z„!¡E\Ý7­úO&ú\"÷À„3Á\Ù÷|\çÞ¼\Ç\ï\É}ò\î0ò‹ü)fŒd”®)ù\á1Ûª—Æ—\Öw„\Ñ\"Z„Á×¢º/P¥Un¿T™\'zD|y\á~˜i9.A~i\Ì+’…ò’¬ «©$\Ñ\çz\Ñ\"ZD‹0µ\îW	×©ý~õ3ð‡‡j|\áÁ‰\êø÷ð4<z5_dC´ˆ\Ñ\"Œ@-\Ð\"ZD‹€\Ñ\"ZD‹€\Ñ\"ZD‹€\Ñ\"ZD‹€\Ñ\"ZD‹€\Ñ\"ZD‹€\Ñ\"ZD‹€\Ñ\"ZD‹€\Ñ\"ZD‹€\Ï-—ð™¢E\à>S´i\áñ\È\ÐúCó\ÊÐ»\0´8ü´øxœ@‹CD‹\Ä\È\Ì5\\µ8š\åˆ	´ˆ1\ãP\ÔbF¿ê¢™Š E«‹-Ž-Ò¶h1—ZD‹\0h1¹\å13JÇ¥Y”o}\ÌñÖ´\Ù\Z–„x\ÇcqT\ÖG’¬¶L\Û\Ú9~Ÿƒ3\É%\n#¼\í¬\ÅÊ¦¹¬\ËOª÷<õrk1a96&\á^²£\Åt}\"\0£B‹1/›>·k\ëòi1)/[jŠZLx$v\\f\ÛLh\ÑÙ™\ä…‘ \ÅT®g;)R¼\ë0©\Ü*Ùœ\Ëq\â\æ@‹i?˜Ô¿®l6w\Øù\ÄS9x€‘6n\Ñq\rÎ¦g“2”£eG‹I%e\Ç$+¸´h‘¡€“6EŠZt\Ð\Ìgó`œõeZ‹6ó2\Ù}†´˜\Ô\'‚aj1•+?fu8\Þ…v¦\ÛI\çž\é\Õ\"=\Ñ0*\è8Ö¢ÍŠ³ƒ^‚ô\Zmj\ÑA;f²_©W¢“ªyp‰Â¨Ð¢^ûZt\Ö8•\Êè¿¡ \Ås«T²\é»\\\ÒXÿ\0@‹CW‹©÷8Š˜Jb•JCp´HŒ-:±a\Ý6o\ßSö\Ùf9Öƒ.SI\ß\ÏNoF–¹q‹\Ög-Â¨\ÖbR]“Ž(g•\ÄTúO3}—\ËðÕ¢ýq©8F‘“º\Ç\Ëq5u-:x”9-f¢¦iÿžñL\Üa„k1\Å1=C|™\ÖS*}¸Ã«ñ.;g`¸j\Ò+š,o€aH;‘~^\0´h\0-5h\0´\0€\0\Ð\"\0\0Z\0@‹\0\0h\0\0-\0 E\0\0´\0€\0\Ð\"\0\0Z\0\0´\0€\0\Ð\"\0\0Z\0@‹\0\0h\0\0-\0d”ÿA^\Zñ\Ê\â\æ\á\0\0\0\0IEND®B`‚',20001,'com/maben/jbpm/helloworld/helloworld.png'),(60002,0,_binary '<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n\n<process name=\"helloworld\" xmlns=\"http://jbpm.org/4.4/jpdl\">\n    <start name=\"start1\" g=\"252,12,48,48\">\n        <transition name=\"to æäº¤ç”³è¯·\" to=\"æäº¤ç”³è¯·\" g=\"-71,-17\"/>\n    </start>\n    <end name=\"end1\" g=\"252,403,48,48\"/>\n    <task name=\"æäº¤ç”³è¯·\" g=\"205,92,142,72\" assignee=\"å‘˜å·¥\">\n        <transition name=\"to å®¡æ‰¹ã€éƒ¨é—¨ç»ç†ã€‘\" to=\"å®¡æ‰¹ã€éƒ¨é—¨ç»ç†ã€‘\" g=\"-119,-17\"/>\n    </task>\n    <task name=\"å®¡æ‰¹ã€éƒ¨é—¨ç»ç†ã€‘\" g=\"203,196,147,74\" assignee=\"éƒ¨é—¨ç»ç†\">\n        <transition name=\"to å®¡æ‰¹ã€æ€»ç»ç†ã€‘\" to=\"å®¡æ‰¹ã€æ€»ç»ç†ã€‘\" g=\"-107,-17\"/>\n    </task>\n    <task name=\"å®¡æ‰¹ã€æ€»ç»ç†ã€‘\" g=\"205,302,143,69\" assignee=\"æ€»ç»ç†\">\n        <transition name=\"to end1\" to=\"end1\" g=\"-47,-17\"/>\n    </task>\n</process>',60001,'com/maben/jbpm/test_1_helloworld/helloworld.xml'),(60003,0,_binary '‰PNG\r\n\Z\n\0\0\0\rIHDR\0\0²\0\04\0\0\0Qg0§\0\0O\íIDATx\Ú\í½‰{×¨\âûž$\×q\ì8‹7h\íV¯’\Ð\Ö$6x;‹m2v–ññŠñ$“\Ü;‰c;±\ï56!\Ï8™Ì‰@,b\Ø‹„Ä¾$‹\Ëýüýº:)ª»«««m\ï\ïy=RuÕ©\êj\ÕÛ¿³Ô©/x\Å\0\0 ù§\0\0\0-\0 E\0\0´\0€\0\Ð\"\0\0Z\0@‹\0\0h\0\0-\0 E\0\0´\0€\0\Ð\"\0\0Z\0@‹\0\0h\0\0-\0 E\0\0´\0\0h\0\0-\0 E\0\0´\0€\0\Ð\"\0\0Z\0@‹\0\0h\0\0-\0 E\0\0´\0€\0\Ð\"\0\0Z\0@‹\0\0h\0\0-\0 E\0\0´#€gˆQü\ç£E@‹ZD‹Œ9|\â€‹„O\Ð\"p‘\0Ÿ8Z.\àG‹0\Ú/’Ï‰¨@‹h\Ð\"\Ñ\" E´ˆ\Ñ\" E´ˆ\Ñ\" E´ˆ\Ñ\" E´ˆ\Ñ\" E´ˆ\Ñ\" E´ˆ\Ñ\" E´ˆ\Ñ\"ŒD-–Áþù-¢E´£W‹%Er—¿ºÀS“\ïª\É/¹Š\Ê\Ð\"ZD‹0Šµ,qªsSrü9Þ†\\O}¡·j\ÐF$ˆ\Ñ\"š=Á\Ò\Âòš\ÜÚ†üiÓ¼5¿3\Õ7½\Ö]^\á”y|\ÂøK\Ð\"ZD‹0š²Å’’‚I¡\ÜG\ëýó§\Ô4¥\éÏ“+Z_\Ð8)·¤¶À[\í.ªòx\Ë\Ð\"ZD‹0š²E\Ñ\â´Ê‚\ÕV}\Ð0{_\Ã÷ŽN™ò§©®¹S\ÇO™œ_5±°´\Ê,—ŒÒƒ\Ñ\"Z„Ñ¢\Å\Ò÷UE\ÏMšôqÓ“G§ýøB\ÓC­\rÞ¨wÍ«\Î}²,\çÁ\ÒÜšŠ|_¨\ÐU\åñ•¢E´ˆaT¢KK¼³ª/\Õ7üq\ÚºgÌ»8ý»“k—„‚‹\'\äÿ\Ú7\î\ï\Ø\ËsJ\'\å»ëŠ²X›F‚h-\Â`kñ\åúižñ\ÌÑ™óÿ\Ïs{¦\Ôo«œ°¢\Ô÷§@\áoýùÏ•Ì©-œ:\Ñªt—Np&x¼¼\Î‘ ZD‹0˜ZôÌªò¿T?\í\ß\ïŸwô¡ø¿\Î\íŸZ»¿¢¬µdÂŠ’	..^TZüf™\ï\åÊ‚GC¹uÕ¹%\Õ.O\È\í®ðf²‡z4\ë\ï\êÕ«h-\Â k±hf•\ï\Åúiºÿù£üüó‡p¹qê‘ª\ê=e\ÕÊª——…–—V.))YT\îz©&\çÑºÜ©u•5®\â*O -¦+.]º\Ô\ÕÕµcÇŽu\ë\Ö-[¶\ìÌ™3h-\Â\àj±\Ò÷\â$\Ñ\â\Çy\íóG^þÿf<~v\Ò\ÌÎ‰“7\×T¯U­¬¨ZUVñ—Ê²E5×ª=/V¹¾_žÿ@y^Y(\ßU\ír•£\ÅTB«p©!NŸ>\Ñ\"ª¨ô½0i\Úg¼pô¡_}þ\È?>\ë¥Ó¾dj\Ó\æúÊ¥µe\r•/«¬\\VQ\Ó\\Yýiå„K‹~È›W6nJÝ¸¢\Éù®\Ðð\Ò\âùó\çûûû³)>\ë=š„ˆ\Ñ\"-z_˜\Ôô\Ç\é\Ï	kñWŸ?ø\Ó\Ë3~x¬¡iCÝ„Oª‹ÿ«¢ô¯\å\å\Íe5«\Ë\'®©¨ZYVú_¼¿-/üqM\Þýuù“B®ªR—˜P\ä-óøJ†¬<\Ø\Ü\Ü,\ÒÙ¸qcv„hg+V¬lQr\Æ\î\î\î\åË—£E´C¥\í}qR\ã\Ç\Ó\Òý\à?þ\ÐkŸ?ø\ê\åO™2yM•ÿ\Ï%ž?ýÿQüÏ’	Ÿ–U,-VV­ª¬ø´¢ôÃ²À\nŸ)?«||Me^°º\Ðò•Y-\îÛ·OI\'kZLvh-\Â\Ð\Òb\Ã\ÇÓŸ\éšõ‹ÿû\à?}>\ë•KÓŸ:2y\Ê\Ú\Ê\àŸ‹‹þ\Í\ïù\Ø\çù8\àû÷’\âÿ,+_VZ]U½®<´¶¸üÓ \ïwe9\ÏTŽ{(”S[SPR\í\nTJÚ˜úL\É\n\è\âÅ‹{÷î•´K~\Ê\ïÇ¿v\íšzõò\å\Ëò§¼¤¤#\Ù\Ùñ\è\í\í5Ux»ºº\Ú\Û\Ûe\å;wJºgZAG__Ÿ©„žžÙµlu96÷ˆ\Ñ\"a-þ\Ûô¿\ïœùóÿ3\ëŸÏœqúŽ7<¸uR\í²PÉŸKŠ>ò~\èq\ä÷~þGI\é§Ê–M(_^R¾´dÂŸ*‚ÿ3\äùÇŠ\Â•\å?Rž7±*\×W]\à®,ò–fM‹’”i¡C¤V8r\ä\È\Ò8\Ñ\ÖÖ¦\×Ù°aCtKŸ,\ÙE\ïTô§K!®^½Zo\Ò\ß\ßogh-\ÂP\×\â\Ô›öãŽ™?»6\ëg\×\ï\éü´ÿ~ª\é‰}\Ófnš\ZúkeÑ¿zò»\n>t»?òý«\×ó±\ß÷\Ç`ðÏ¥%ÿ9¡bIY¨¹¬\ì?J}ÿ\Ó_øj`ü\ìŠ1&s×º|\å\Ù\ÑbGGÇ’%K´tŒ~LJ‹ZsÚ†\Æ?;O‹[¶l1:-¢EAZü\×i?<xÿ?\\y\à\Õk3žÿ¬ñ\'g\Z\Ð=\í\Û{\Z\ê\×WzÿZTð_®¿¸Š>q{>)ò~\âñý\ÕXZ\\²¢´bCiõ\Ö\Ò\ÐÆ’²eÿ‡~\×\Ï&\ä}/”\×*(¯,ò•yœ\æŒöµ(õS¥’M›6I\Ö&K¤\î,Û½{·\Ôs\íW¢Es+V¬uNž<yõ\êU\ÙD„+K´û\âiQë¸µµU*\Ýû÷\ï¿r\å\n•h´\Ã_‹/LšòQ\Ó\Ó¦Ï¿4\ã\å\ËMÏžú\ß\ÏLùû“Sž<2©qß„\à6wÑ–o[¡¿\ÍhsÛŠ‚mž\âm¾\Ò\íþ	;å»Š+w«\Ú•\ëü\åKüÅ‹ý\ÞWJ\ZC¹ž\ÚW¥\ÇQ;£}-j•D\'tIu€œ?>úö’mÛ¶i¯YhQì©ŒL—Z„‘¤Åº\É5þÝ¾i/]˜ö\â\Å\Æg\ÎLþñ©úž¨{üHh\êþ€oG~\á¶÷ö\\ÏŽ<\ïŽ|ßŽ\ß\ÎB¿°£Ð¿\Í\íoó”´y+¶ûB[}¡\ržò¿~Ì¿¿f¼{RAa(\ÓZ\ÔXI\è$MKoOtWW—Ú¤¥¥%ž¥º}ô\èQz¢\Ñ\"Œ¬{¢g†‡s\×ÿK\ãÜ½M\Ï÷7¾p¾\á™Ó“Ÿ>Z÷\Ý5l+›°²ð¾ÿ¸û[ó\î?}\ë\Þ?\ßu\ßÿ¾{\ì_\î÷—1a>3ö\Ó1ã–Œ\Éo\ï_YXüWoð÷\ÅEÿX\êš[^P[U\à\r¹œŽ×±¯E\Ð)yI56\Þ=\Å\ÉJ\êÂ…RN¨\Å\èú5ZD‹0b´\ØðÄž†y½SŸ\ïŸúÌ©ú\';\'Þ¿¹²\êS\Î\Âûný§¯~ñ¾ü\åŸ\Ýò•_\Üú\Õ\×o»ý¯}\í­;\îx\ëwüöw¼{\Ç\×ß»\ã®\î\ÌY”“ÿ›¢œ–\Ý7¹.§tba0K].ýýýk×®56ó­\\¹²½½ýúõ\ë\ÉJJ69tè¼ºj\Õ*5\Û(\\‹žh´ˆajQ*Ñ“>lx|\×ÔŸœ›ò\ìg“xrÒœ½U5\Ëü…‹s¿ù«o}yÁ-ÿÏ‹_ü_ú\Ò_ùo_þ\éWnù_½í—·ý­;¾õ\Ûo|ó\Í;¿ñ\Ú\Ý\ßú\Ù\Øû\æŽÿQ`ÜŒŠq‰¹®š\"ï„¬\rÐ‘´nó\æÍ¦_q¥\îr±#©\ãÇ‹\r=Ñ¢W½-¢EZœú½]SŸ9;ù™\Ï\ê¿|\âŒm%Eÿú\ßø\Ê/n»\å\ç·~ù§·|\ég·|ù\ç_ùòÿ¸õ+¯\ßþõ\ß\Ý1ö\Ão\æý\Ë=9o\çy\Ùw\ï\Ü\à¸Y\åy“*ó\Ë+ý\î”\ïtpKÉ©S§¤>kX³a\Ã›’\ê\í\í\ÕJŸvvvªdS³A‹hFc—KÝ‡S¿»sÊ{\ê\Ü7\é‰\ã5S[ýc\Ýõ¥Ÿ\ßò¥üÊ­¯\Ýv\ë\ë·\Ýú\ËÛ¾ú«Û¾ú\ë¯\Ýþ›o\ÜõÎy‹\îu¿—Sð3\ïø¹\ÆO\å•O,ôL,*ªL\Ë<ŒŽ\ï·;s\æŒ²#aœ¡\ËBRÛ·o\×=Î—/_\Ö\Ë\Ñ\"Z„Ñ­\Å?LùÎŽúŸ©{¦¯þû\'j·E‹_ü\Å-_üù­_ý\Õ·¿y\Ç7\ÞýÚ¿~Ï¢;\ï{Ì¸\ß\ä\å\Î÷ü ´`Î„‚\Æ	¡ò\Â@¥\Û]™®\Ç¦8c\Î:¤—\ïß¿_-\\³fi\É+\ÕK{ö\ì1.OQ‹{D‹h†|%úùº\Ú\ÅS\Û>é‡§j\Ü[7÷xmS[ñø?\Üó\ß^û\ê—ÿùö\Û\ßü\æ7\Þù\Ö=‹¾5\îÃ»ò?\Z[øA~\Þ?ø\ÆÏ¬7¡>?**-õ‹…4>Ð¾\Å\\¦%===:[4¾*Š\Ô\ËMcª×¯_\ÖIÚ¸u\ëVµ¼¹¹\ÙÔ‡cG‹{D‹h†…\'\Ï\ÙV7÷Dõ·OWL?T\\¶©\à\Þ¹ó\Ö\ß\Üvû\Ûw\Üõþ]cŽ÷NN\Îùù¯»\Ü?õ|BnumnA½«`0\ç[¼r\åŠHdÕªU»v\í:|ø°ñ\àÁƒº-–Ñ³E(]\ê\ÛÅƒ\â¬s\çÎ©™£|6m\Ú$…H\Æ	Y˜¬-öhœ|lÿ@\è$Wö®Jò‹\Ñ\"Ž\'.žüH[\í£\Ç\Ê\ë»óv\Þsg\Ë\×\ïø\èö;þ\×\×\îù\Ã7óþ}LÁ¹?+÷TE\îœ\Ê\Â…µ•®’\n·§Â“ZsZ´/:;;M\ëGwX‹\ÝdùÙ³gcN6±zõj\ã\è\ã½.v´h±G\ëihcNx\Ñ\"dO‹Þ™U¾\êjOž\ÕV3óHIpß¸\Û\Ö}õKŸ\ÞrûG·ßµð[9¿¿\×ý‡\\×¯¼¹OUŽo¬Ë­¨+ðMtUyý|øŸM-J2\Ø\ÚÚª\ï\\6ŽÎ‰®\\«AŽ&OiI\Éú---\Æ{œ%…”z´\Ôgµ1\å]”$tv´h±G¦’\Ñq\â\Ä	´ˆ!\ëZœU\å{±.ô‡úiÛªšºý¾\íc¾öÉ­·ý\é«÷ü\ë½9òþ\ÙWð\\i\á÷*\n\Z+*«\\Á*—§²¨¨<£\ï\ÈAtWWWGG‡ü”\Ô\Ïze©\ÛJ}VrÉ“\'O\Z\ï¼zõª¤fR«=vì˜±ö-r”•Å›\ÆN\ê¤\"\Þy *Z„!ªE_X‹“*þPW¿­lRg‘ý˜»ÿp\Ç\Ý\ïÝ™¿¨\Ðõ›\â‚„r\'\Õ\ç—Ô¹‹+¼Åªk¥$õ‰f3\×=R-¢E\Èf¶’Jô„\Å«¶ú+\Úó<?\æõqc\ä\ç/Í«pÍœ˜¨/,¨-ò”e\í!A´ˆap»\\ª‹\æM\n¼\nl(ðnSø¡{\Üß—ŸÊ¿?\äš\ZrUT¹\'– E´ˆa\äk\ÑSRR4­\Úýƒz\×k•ù\Ê\Ëû\ßcrÿÉ—óÈ¤¼‰S\nŠ\ëÜžP‘·<û\ï	¢E´ƒ—-—º&V<0%\ïñ\Ú\Üy¥¹\Ïùó¾3ÁUW\í.­q{«ŠŠ\Ê=™\ìqF‹h-\Â\Ð\Ë%®’šÜ²†ÜŠ¦\Ü\Ð\ÔüªI®ò*OÉ„p\ïJx…’AyGH-¢EL-jr}\r9\Þ\é¹E\ÓóÝ\î¢\êAGH-¢E¼Jô	¢E´h-¢E´h-¢E´h-¢E´h-¢E´h-¢E´h-¢E´h-¢E´hø\Ä\Ñ\"p‘\0Ÿ8Z.\àG‹ÀE|\âh‘S0ò.b´ÿùh\Ð\"\Ñ\"€%/F‚ó\0h\0-Z@‹€\Ð\" E\0´h\0-Z@‹€\Ð\" E\0´h\0-Z@‹€\Ð\" E\0´h\0-Z@‹€\Ð\"\0Z´€- E@‹\0h\Ð\"\0Z´ˆ- E@‹\0h\Ð\"\0Z´€- E@‹\0h\Ð\"\0Z´€- E@‹\0h\Ð\"\0Z´€- E@‹\0h\Ð\"\0Z@‹€\Ð\" E\0´h\0-Z@‹€\Ñ\" E°øPbÐ‹²¿­\Åjv\nA‹€!	—}Á2†‚“:\à˜e¢E@‹„Œ†‘\Õ\Êh\Ð\"dC‹©\'h\Özr¶•³\Í\Ñ\" E\Ú“+\Ê~ò\å\ØJi\×bR%Ð¶h-:×¢³\Ztô«67Iq¿6‹B‹€G¸\ã]ð\É\ÚÄºvl\ÓqvÆ¦\Ü\î\×~\åš:€\Ñb±³<+\Åþû\Í\Ò\"m‹€1£]=%[\Õ#\í\ËÅ¾1\í$¶š#\í—C¶hqti1¡z\ÒÞ¼\è :Ÿ-\Æ\Ì+µK¢E@‹£B‹IuÎ¤RµnŽ´phR]46ß—³¾\Z´h-&\Ðb¼,\Ìk\ãÞ»d%\è¬a\ÑZ‹\Éö½ E@‹£¢a\Ñ~gˆ%5(©®ž{K\È-BJZ´\ß\rTë¡\Ü3C#÷¡E@‹£W‹Éº,E-:s¨ƒñ:iŽ-ŽÀq‹v4aß³){\Ìô-1i¿7-Z\ÉZt¯¥2´Åº11-C\Êm\î\×qZ´82Í˜\Ô\r\'6…\èMÓ\Ò\ÎòV-		\Ç{£E@‹ñûu­8h3M80-ZHh\Ð\"\0Z´€- E@‹\0h\Ð\"\0Z´€- E@‹\0h\Ð\"\0Z´€- E@‹\0h\Ð\"\0Z´€-r\n\0- E®\îC‹€l™\ÑB‹\Ð\"Œü\Êr´\æ,\âD@‹0Z\Ìhô]´þb®€a„kQ+/úwœhF©g\Ð\"`F´h\Ð\"N´˜-ZHN‹œ%@‹€\Ñ\" E@‹h\Ð\"€-r~\0-fD‹€-\âD@‹\0v\Ì\Èi´h\'Z@‹€ì˜‘h\Ð\"N´ÇŒœ\n@‹\0\Ó\"\ç\Ð\"ÀMf\ä$\0Z@‹€G\ÏD‚+-¢E‚@‹hqdi‘ó\0üG¡E\àŸøB‹À?1ð…b\à?\n-\Âhÿ\'þœ\Èz E´ˆ\Ñ\"\Ñ\"ZD‹ZD‹h-h-¢E´H E´ˆ\Ñ\"\Ñ\" E-¢E@‹ZD‹€	´ˆ-¢E´ˆ!\ëZ–d\éØœ\îI¡E´d‹h-¢El-úÊª‚uÓŠ)nšS\Ò4»¸q¶ütŒ\Ú\\Š’ƒuÓ¥p´ˆ\Ñ\"3-Š\Ë\ç¾Rý\Ò\Â\ê‹«_þ z¾°(>\É\Ï¿—\Ë\ç.3¢E´ˆa˜iQ\Ò:QX\Ã{­·Ô½\Ñ\\û\ë\æº0\Ë\Ùüæ†…­R`\è\å÷¥p´ˆ\Ñ\"7-6Í‘<1\ì\Ä_~\Zz\á\ÝÐ³o†\æ½z\îm\'È†Ï¾YýÂ»µ¯\"f¬yu±Ž\Ñ\"Z„a¦Å’¦\ÙRw–OœXú\Ð\Ó%\Ó+¹ÿ{¥3Ÿp€l(›—>üt\èùw$y”:uqc¶µ\Ø\Ó\Ós\æÌ™Ë—/g\Ô.\\8r\ä\Èþýû¯]»–\Æb¯_¿®ŽÿÒ¥K:ò“\'OÊ‘÷÷÷£E´ˆ-*Ñ³«\ç •_IôDjÁI3‚“g7<\ì\0\ÙP6—Bª~ò›°_Y”\ålñØ±cK#!¿—±gÏžµ¿£mÛ¶©8p \Î:u\ê”*¶««+\Ù\r×®]{\èÐ¡„k.[¶L\Ê\ï\è\è@‹h-Zf‹óÕ‰\ç½%\é\Þ\r\'6\ÍqBÄŒRHÕ³o\Ö†\Ån\ÑZ”\äk©Ø³gýõöö677\ËVkÖ¬t-JÆºr\åJµ\á®]»ôò\Î\ÎÎ½Q¡VÛºukôK\çÎC‹h-\Zµ¸,ô\Ü\ÛRVNW¥“G™Q\n	\Í{[\ÒOIB‡‚OŸ>­®^½zm¬p E‰;v8\Ë\ì2‘-\ÊúË—/W\ÛnÙ²E*\ã²P¿5›\Ñ\ÝÝ\Ñ\"Z]Z<q\âDÌ­TªeÒ¢¤]+-CkH~±^Ó˜ÁeH‹\êm¶´´\Í(	\à–¨P+¬_¿>ú%\Ù;ZD‹hqti±££\ãT¬X±bE´\Û\ÚÚ–¦)\Ä8Æ’¥R¿<~¨M¤†o\Ù<\Þ\Û\ï\ï\ï—J½*aÿþý1\×Ñ§‚¶E´ˆG²w\î\Ü\Ù	%8	ùEþ”Zóµk×´“j[\Ã\îMSHQ1SBg¡r:k3nÜ¸ñ\êÕ«ªkh\ÕÍ¡3\\\ÓrýE‚\Ñ\"Z	Z\Ôu\Ã\è¸r\åJ\Z\Û<(B‰\Ù\á\Û\Þ\Þ.)ž¬`¿¦,{\ì¼9d‰zID\ï%k-J\\¾|YÚ¼y³M\Ûjw£E´ˆG‚»ººvGB\×|\åµÄ˜-&Õ¶\â&j™†+ž?^\×¶$j-šFY·-\ê±G	µhJ\Ï\Þª\ÉaM\ËõHO´ˆ\Ñ\â\èj[<+”Ñ¬µ(žR#þ$%4UŠUH9º\n/Ù«ª\ÃfA‹²¯M7\Çñ\ã\ÇÕ°\í±B\"•\ë\è—\Äûh-¢\ÅÑ¥E\Ç\ã»»»\Õ(E	‹!\Ó===º/xÝºu.\\È‚£ßˆ²›pn?\ä\ë-¢E´8*´¨l•0bv\Ý^¿~]*\ÅZñºw•V¢6c\Ì{µûbv7kC™B\åª\ÑZlmm\Ý<K–,\ÑZÜ·oß†$C2M´ˆ\Ñ\âHÖ¢¤u)Þ™\×\×\×\'²\ÐNÜ»wo{$,z~$¤»q\ãFµ‰l~\åÊ•xZL{O´1[dª´hñ&-ª´K¨¶$CKG\Äj\î#%«þn\É\ÚNž<³“Z\ßW\'I¢\ÎE‘¦þ­Eñl\×Í¡oÎ“5\ÞKIiQ\Ò\Û6BŽ-¢E´8µx\â\Ä	Q’iu²¹˜n\ÔÓ†eôöö\ÊIÕ’5kÖ˜L\'ug\åPÑ±šœ\æüùó«W¯Ž™¾e®\':zwZ¦\Ö\Ñ\ÒÒ‚\Ñ\"ZQZÜ¾}»¨¬b\íÚµbqÓ–X¡}ý’q={ölÛ¶\ÍØ§¼s\çNµ\íŽ;L\r|Ñ\"S9*Óšƒ¢E‘õ\Ù8¡\î\ìF‹h-Ž4-\ê¼L‡i±›Â¤÷‹\"õ\Ýuº\çZ\Ï±~ýz\Óú1§MÌ¾%“=\'\ÔHO´ˆ\Ñ\âHÓ¢\\Û’úµ··:t(\Ú8Z\r©kQIVÕ——,Ybœªk\åÊ•ª®mÿ.—\æ\æ\æ\èf>\Ý6jZ®;©©D£E@‹©\ÐQ7À{t7±©ý\ÙgŸÙœ\àZKJ[,f?Œµ³\Ð­µ¸.N¨7‚\Ñ\"Z]ZTÍŽ7n´­¢§§\'\Ù%œ\ÆB‹;w\î\Üs\èú¸\ÔúM/\éfM;Z\ì\ë\ë“Ê¾X^iQ\Î@¼Mv\ïÞ\Ñ\"Z]Z”Š­–—¾\'Z\'P[o‹\'œ˜nŽ6õðH\Î%~‰¢ob\ÄT\Ú-Ü­»}\Ô\Í6\"k\Ý\åo@’\ZH„\Ñ\"ZŒ©Å‘ù\Ð©\îi5°&•©^¼EŽz\ä¶ú\Óf\Ú\Ø\ÝÝ­:\Ê\íkQŽ\\¬½I¼—,Yrð\àA\Ú\Ñ\"Zí¸2iQ,¦î™“\Z¥jDSƒhQŠ’Š­¾OMÒ£$%\å“GÙ…\È\ÑÙ£S™[Þ—ºùO9Wwø\èlqœPZG‹h-š³Åd‹o4W¿ðn\é\Ãiy \êS¡\ç.0\ë•hñ‘Q‹:³“?E\Æ`TeSTb¬ù^¿~Ý¤³³g\ÏJ\íX¬ª£újL,²•¤¥Fi\Ê^Z[[:d1•Nzµ¸}ûv½\ëÃ‡»\\,\Ú\Õ\ßh-¢Å›³Å¦9\Õ~ß°°µöõOBÏ¿#‰žTCó\Þv€l(›‹k_ûK\Ã{›«,.nz4Z\ì\ì\ì\\¿~½$>z€‹øN+Rw¶\ìÛ·\Ïh.²P\Í\Å \î[¹r¥¾™O\ßÀg¬lZÌ #\å–-[¢;©%\ÍÌ‚\Õ<µb@cŸL<-\Ê\Û	•\ç®]»-¢E´h¬D?Rý\ÒÂ†÷ZÅŒRój\Ã4;\"¼¹\ä‰\âÄ°_^(…gA‹Ú€º\Z«³\'±’zÎ§öŽ,—´@M¡f‘Q³m\Õ&¾\Ó)˜u\\ºtIòPÑ´\Þ<;¸’\Z½|˜\ÆN\ÆÓ¢i\Ú1Éˆ\Ñ\"ZD‹#X7½|\î‚\Ð\Ë\ï×¼º¸zþ¢\êW\"\ÌÿÀ	z\Û‹Å‰s_\r\ÔMÏ‚ûúút×ªdyúÞ’;wZô\\¸p¡§§GL$U\ì#GŽˆõº»»ý¼b™Í›7Kb•TE\ØX!J	¦¨-Bö®\æø’\Ä3-OX=p\àÀ\êÕ«µ\ëu=zT\ÍY+º7µ„¢E´ˆ‹}eUbFI\ë\Â]ÉsöA›yT\n\'J\á\Ùl[$R´ˆ\Ñ\âI¡E´\Ù\Õb°$K\Ç\ætGH\n-¢E [D‹h-ZD‹h-ZD‹h-ZD‹h-ZD‹h-ZD‹h-ZD‹h-ZD‹h\Ð\"ZD‹h\Ð\"ZD‹h-¢E´ÀZ\äŸ€ÿ(´\È?1\0ÿQh‘b\0þ£\Ð\â¨ý\'&ˆôWZD‹\Ñ\"Œ2^Œ\ç\Ð\"\0Z´€- E@‹\0h\Ð\"\0Z´€- E@‹\0h\Ð\"\0Z´€- E@‹\0h\Ð\"\0Z´€- E\0´h\0-Z@‹€\Ð\" E\0´h-Z@‹€\Ð\" E\0´h\0-Z@‹€\Ð\" E\0´h\0-Z@‹€\Ð\" E\0´h\0-Z@‹€\Ð\" E\0´€- E@‹\0h\Ð\"\0Z´€-¢E@‹©¼\çp°²iCû\åX”l\Ç\Ç³ðT,ûG¼ó€-]-Fo˜^-\Ú1\Ô\âDB•[„\ãm•\ÍSw\"Z´˜j&\â@\Ö\ÊH¯S?\æx6OvC\ëmS<\É% E@‹\ÃL‹i¬\ä¦b\ë:¾3-\ÚyG\Ép\ÂÓˆ-¦³†ë¬™\Ì:QJ6KJ‹¯­;\ÚqÖ†²yx	\ífq\Ì6ac6> E@‹ƒ¦E›õ\ÄÔµ\è\à˜\íWck1Ù“c§Õ¢ü´4h¢E@‹{fõ™$\Û<—TU4Z´pŸµ¹RÑ¢}\'&›-&«E\è\0Z´«E\Ç&J]‹Iõ\ÉfY‹)ö°\'<ó\Éö\Õ$¬Î£E@‹i®öÆ¼\\“j^´®<:\ÐbŠ_\0)veN‹vD™–þ´h1i-f¨\Û4)g®¿Å­;.\Ò\Õ•–\Ñ?ÉŽ\nB‹€“Ó¢ƒÎ™\Ô3¯lj\ÑYŠ—–þ–˜ƒ\Ö%¤«a-Z¢Z´¹U¦µ\èx\Äbºº¡\Ó^Oø1¥\îD´#¿\Ë%•šµÍ›\ç\ì\ß`—\Ñû[œI\Üfò˜ÊˆEg\éžý\Ú:Z´˜A-f³ÚºÎ˜‰‹£#S1u²÷Þ¥·±\"\í\Ý\Ðh\Ðbr©b\ê÷\Û}\âL‹v\\Ÿ°s#]ý-6\Û\rS¿·2½wC£EE\ã“j\é\Ë\\7töµ˜TŸoºú[œõø\';\Æ\ÛA	h\Ðb} Ž;\ì\äMvÆ 8\ë{q\ÖÕ“Ô”öOKŠéžƒR™p\"Z„Q\Ñ‰16\Ý\ál¦¯Œ&\Å\ÉÞl¿Žg6K½%7-\ã\Ñ\"Œ|-JÛ¥}-¦ž\æ$5\à\Æk{6Šµ\èx\ãžôt\Ý/„-fC‹\Ùl(H\ï\\A\Ãñ³@‹€2Z´€- E@‹\0h\Ð\"\0Z´€- E@‹\0h\Ð\"\0Z´€- E@‹\0h\Ð\"\0Z´€- E@‹œF\îC‹€l™\ÑB‹\Ð\"Œü\Êr´\æ,\âD@‹0Z\Ìhô]´þb®€a„kQ+/úwœhF©g\Ð\"`F´h\Ð\"N´˜-ZHN‹œ%@‹€\Ñ\" E@‹h\Ð\"€-r~\0-fD‹€-\âD@‹\0v\Ì\Èi´h\'Z@‹€ì˜‘h\Ð\"N´ÇŒœ\n@‹\0\Ó\"\ç\Ð\"ÀMf\ä$\0Z@‹€\Ó\Ä3Aù@‹h‘ ´8\ØZ¤²\0ÀŠ\Ñ\"\0W(ZD‹\0\\¡h-p…¢\ÅÑ®\Å\Ï	b˜ZD‹h‘ \Ð\"ZD‹\Ñ\"Z$´ˆ\Ñ\"A E´ˆ	-¢E´Hh-¢E‚@‹h-ZD‹h‘ \Ð\"Z´A°$K\Ç\ætG\\TZD‹d‹h‘@‹hq°µ\è+«\n\ÖM+n|¤¸iNI\Ó\ì\â\Æ\Ùò\Ó1js)J\n\ÖM—\Â\Ñ\"\Ñ\â0Ó¢8±|\î+\Õ/-¬^°¸ú\åª\ç‹R\àƒü\\ð{)°|\î1#Z$\Ð\"ZfZ”´N\Öð^k\ã\Â-uo4\×þº¹.\Ì2GD6£¹aa«zù})-h-7-6Í‘<1\ì\Ä_~\Zz\á\ÝÐ³o†\æ½z\îm\'È†Ï¾YýÂ»µ¯\"f¬yu±Ž	´ˆ‡™KšfK\ÝYR<qb\éCO—L¬\äþ\ï•\Î|\Â²¡l^úðÓ¡\çß‘\äQ\ê\ÔÅƒ¯\Åk×®;vlß¾}Gu°ù•+WŽ9bg\Û3‘¸p\áB\Z/ªƒ\îˆ²<\æú²w9ÚŽŽŽtÀ¥K—8\Ð\××—\Æ7uùòåžžž¡i±ýû÷\Ç<\á²-ŽªJô\ì\êùH\åW=‘ZpÒŒ\à\ä™\Å\r;@6”Í¥ªŸü&¬\ÅW\r…lñ\âÅ‹Ë—/_ºt\é†\rœ‰I¶]¶l™^\Ò\ÕÕµ<&.„H$W\éúõ\ë—ÆŠxZÜ¶m›Z¡··7\æ7\Ä\å8!ö^ÿÜ¹s\ê\ÔmÜ¸1oª½½}É’%\ëÖ­‹y\é\nùtz\í…ñsTwt\ÈGY¶8Qhq\Þ[’\î\Ýpb\Ó\'D\Ì(…T=ûfmvµxþüù¾ø±yófõ\Ï-Ùœ\Åjýýýv´x\è\Ð!U\Ú`iqÓ¦Mñ\Ö?u\ê”Zg\ïÞ½Ñ¯\ÊÂ¥ñ#fJ(ûR¯\Z\Ó%‘\ï:!\ß1r\íÚµR\àÊ•+¯^½ª¿iš…\ÚT\Î\áÃ‡÷Ç‰\ãÇKŠ·\Ô^lß¾=\æ[F‹hqYè¹·¥\"¬œ®J\'2£š÷¶¤Ÿ’„fM‹r-M9Ö¬Y3ôµ(vø\ì³\Ïô\n’ì˜ª{jµ––\Ór©\\\ïÙ³\Ç\â\í\Ç\Ì\Ýd_+V¬Pû={ö¬ukŠ˜Ï“\'OªWw\íÚ•0G3…©¨Õ«W\Ç[s\çÎ:qNV‹òõ rd´ˆ‡·Õ¥;\Z´h´‰„\È\Î\æ»Û½{·Ò¢œ«“†w-W­Z\ï:::Lj%»-\ÃB‹\ÊVr>¹yOO\ÏÁ8!‚‹\'¦\r6¬ˆ„¶˜ü¢–H^¬v$™é…Ø¸q£*G/Qy«I‹z§h-{-\Ê\Ù\ç(\Ú\ÚÚ¢µ¨\Z\Ý\ä\ÚV—±úS\ê}ƒ¨E©Kšjú\'NœXm/\ÄeJ‹’Y^\å­\ÉB‘ˆÉ¶[·n\Õ\nnmmµ0]t¨2£W\Ö\í¼[¶l±\Ù9£SB©[ô“¨uÎŸ?oò¯\Ô\åõ¥Ec;i<-JŽ¬\ÞZD‹\Ã^‹1\ÔTµhU$\äj¹‚\\&-\ê”\Çr™\r¢EUñz\Ûå¨º»»£;\Ç7m\Ú$9—øEþŒÖ¢®½š¤£Z!å¬ª?\Å\ÅrrÄ’\âµT´(%¨\ÝI–ªzù%/³\Ç+G\ì©Ö·\ÖhÚµh\Ü5ZD‹#S‹\çÎSÿ\Üñ:¢µ¯ÁÞ¦\ÅSr­¶´´\ØL‹lj1\Þñ«\ÞØ‰aê˜–3S‹ª3JŽ3f\çŒ\Öb²S‹\â,Sª¨»€¢….\'P‹I>¥uZ”=\ê\ÖUy›¦VW\Õ$S‹rª\Ñ\"Z\ÞZ”b©$öööö\Ç\n\Ý?+\ë\Ä\\¡§§GòÉ­ŒyVw$´ÕŸ’UYkQ.Q¹\Ú%3M\è²dµ(®¹t\é’\Å(\"S®*++\r‰û\Ô“\åø¥V.K\ä=fA‹ªÁNö¨úv$ñT_f’²E­Q¢W!‚»~ýº3-:\èr\Ñõ}´ˆ‡·M!É†©e\Íf—\ËÊPý\Ñ\Å\Êe/&Š\ç²dµ­cn¥Dl¼z÷\í\Û\'K–,Y¢+\È&-j›¨*mFµ(\ßL\Ê\Ñ\â 99«ª½R\ÏÔ²!\ß\"\Ñ\ã\n$I7~i%•-¶„*Ö¸D’\Å@\"´ˆ\ÑbZ41þ)5µ…­Å¶¶6‹5õ\à=üPu1¯g“\Å51kÐ™Ð¢Ú—õÌ³g\Ï\ê¾•\äJ¯\ÓFI3\ãuød¢mQb\ëÖ­h-Ž-Jnr\ÆzK{{û™›Cut:Ó¢\Ô\nõ­\Å\r6>|8].²»˜=k\"¡\Z\Î\ÔPùSw\àÊ‘«¤¦lÔ¢G2µxRH»UZŠ\é\ÔXH\Éõ{•\Ð·•ƒ\Ñý\ÂRŽ¤\ÆzœPK$ô\0–w—º\Ãt\Ð\"ZöZ4µ\Ð[t¹¨”Ê™³\Ü³C)^\â£%“U\ê\Z“¬iñô\é\Ór&E²\ß\î\înedõub\Z$(	ct}Y6\ÔCSõMœ7\í\È÷b\êZ4–\Ñ\"ZŒ¡EI9\Å,r\Ñ–c–,ù\ïv{\Ñ\Ù\ÙiªD‹;T—Ktwy&º\\ôPD•ØŠ”U¿¹$Œ’\î\É&rSH\ÈKjC=šRT»+úv=1¬Z\Ò\ßß¯ó\Ó\åa\ÌFK\âiQN8ZD‹´-š\ãúõ\ë¦\æ$U,-:ž\Ä%^Û¢±E\Ò4x0sZTc¡L#%Ož<©†YG___\Ì23\Ñm,-¢E´x#\ZS5\é‹\ä\\ƒ¥EU\åŒ9Œ\ÎD¡n£Ž\Ö\âµk\×T\nfº\ì3¤Ec³¬¢Ô©%¹\Ûb/$C´©EIB\Ýª\Ê,¢i¹¾\×\Û\Æ!ýh-{-\Ê\Åv\Êº\ËE®öS7G¼.q¢Iz\Ë`i1^R£GeZ„:ªh-\êq<¦©\"2¡E=FGô\Ô\Ñ\Ñ!ŽS}/ò§ˆ\É\æX\Ì\Õbj1Þ wû“¤\é\Ä-¢E\ÚoxA.WIj\Ôp\î¡\Ð\åo>1­\Åe±\"¡\å]D\'\íZ”o¦\èiiTˆ§¤v¼þ\æ\Ð,¦\å1o\ßÌ3Œ¡E´ˆ‡bO´Ig\ÑZŒ9™BB-J(a\0¥]‹\Ñ\íR™•Zª|\Ì\Ô\0F\É\å\í\ìNkQ*\ã\âM\ÙV\ÒOùdW\ÝzTiyÌ‘›Ÿ\ß<-ZD‹£¨mQÉ%Ó”‹3•®\Ó=\Ñ1\ïôHQ‹¢’\è@i\×\â¥K—$û–Š³”,\æJøhgZ\Ô\î³Ó°`1“£\ê\æ\æ\æ?´H—Kúµ¨&;He\Æ“\Û\Û\ÛÓ¢E5=šz\ê‹nE5\ÖO3\×mq¥¼£˜]Iv´(o|ß¾}r’w «\Æ\Ê\Þ\ÞÞ½Q¡E¿d=h-òÐ‚aù\Ð“°Ž\Üz\"U•ªCµúgH‹ª1+•ItLZŒ9Q®-öõõEOÁkœŽ!\ÓZTw¡X<c\'¡\åhÕ Kc­\\;^·r²m‹¦©¿\Ñ\"¸\Z®¸:|ø°j*2Í¯eÑ¶\Ø\Ö\Ö&Fˆ7#YB-JV\"ÉŽš1Z‹*‹1Í§Šc\ÎÁ¥µ(\Z:\Zñ*\ÑzqŸ\Ê4l0CZq\Ë\Ù0NÁ j‹y~\ìd‹\ê\ä\ÈOI9\í<›Ð¾M³Š¡\ÅÑ˜-†$[|£¹ú…wKN\ËQŸ\n=ÿ»pY¯DÇ‹„ó-Z„„Q‹z8›¾ñN®mI^\Ô\ïj’.ùS\ß#\Ñ\ÙÙ™F-F\çV\Îèœ„\éû#-ZÔ­r\Æo1¯\éÁr\êv”“\'OF?ö@u…\É&\Ñ/\éÊ¾\ì(\æS\ÉÎŸ?\ß+T(%\Ç|Õ˜,G\ÏB‹£,[lšS½\à÷\r[k_ÿ$ôü;’\èI84\ïmÈ†²¹8±öµ¿4¼·¹zÁ\â\â¦G‡©%%Ü´i“\Ô\Õ\Ål¼a\ÎtÁˆ1%¹xñ¢º’UÃ¿QÖ£F’Õ¢š52\ãÓ¥E\É\r%\ÅÓ£%ŒõY!ªy½\ä-\èŒ7“Ø‰„’“:h_\Ö\ßº\É-Ž\æJô#\Õ/-lx¯U\Ì(5_¡6L³#Â›Kž(Nkñ\å…Rø0Õ¢\é\Ú\ÐO‹Gµˆ‰2\äú”\Õô\ìa1g.H¥O‹r\0\Æ:£Ö¢\ê\á5…\êjÏ‚õ	t*m|u\çÎmmm\Ý\Ý\ÝÚ†\ÆS½*™ˆ7¬]Ç™3g$_–d(-\Æ|\ìZuZ\ÖM/Ÿ» ôòû5¯.®ž¿¨ú•ó?p‚\ÞvÁbqb\Å\ÜWuÓ‡‚¥ª¥28ûS~õöönŠ„¤6’\Î{WD1\" ˜óE\ËV\í\í\íªsS¶Šž\ÞÕ—\Ä\n9*\ãNÕ¤ª1\çY\ÉKª\âyð\àA±•. I–[ZZLj³±³º?Oö(_?\Ñú!\ß1O8Z]Zô•U‰%­w%7\Îq\Øm\æQ)Pœ(…-\Ä`Z–Z\ÊpQh-fW‹Á’,›\ÓqQh-’-¢E-¢E´ˆ	´ˆ\Ñ\"Z$\Ð\"ZD‹h‘@‹h-¢E-¢E´ˆ	-¢E´Hh-¢E‚@‹h-ZD‹h‘ \Ð\"Z€z…¢E\0\à\nE‹h€+-¢E\0®P´˜ø¤1”-¢E‚ \Ð\"@šx1œ@‹\0h\Ð\"\0Z´€- E@‹\0h\Ð\"\0Z´€- E@‹\0h\Ð\"\0Z´€- E@‹\0h\Ð\"\0Z´€\Ð\" E\0´h\0-Z@‹€\Ð\" E´h\0-Z@‹€\Ð\" E\0´h\0-Z@‹€\Ð\" E\0´h\0-Z@‹€\Ð\" E\0´h\0-Z@‹€\Ð\"\0Z´€- E@‹\0h\Ð\"\0Z´ˆ-\Öù\Z+›6´_ŽE\ÉÆˆ¹Žƒ·Êeè½ E@‹#P‹\Ñ¦W‹6Õ¦M*\ÖjKö\ßZ´8´\è\àR_<dS‹v\Ôc_‹)ž(‹\Ð\" \ÅQ¤EgY§\':Û©£JV‹	OZ´8Tj¸6K³¹gVZ|\íX\è\É\Ú6©\äÔ¢-Z–ZL¨†ti\ÑÁ1§Å‰\Öo\ÍA<©FI´hqð{3µ\ë;VL<\Ë$UBŠZL\Êøö˜l¶˜¬ h1Ztl¢Ôµ˜T\î`i1©nb›ã¬\Ñ\" \ÅÁ¬A[_\êI5/ZÅ™Süp6\ê\ÐqWr\ÌH½¿-ZÌª\ÖÚœ\é#)g®¿%•\×þ@K›­Žû\ë\Ñ\" \ÅÁ\Ñb*#Qœ\Ë-¦«1Týi}\éjXD‹€G mn•l\ÑÙ|i¡™b[g*C\Ð\" Å”\Æ\ÓØ¼­‡g\Û‚—\Ñû[ló¶#\åtÕ‚Sl\ëD‹€_‹\Ùì†¶®o¦ž*\ÆSaR-¤v\ÞNZ’M´hqi1©T1õq\ÑvF®8\ÓbÂ‡	»Gœµ¦~dz\ï†F‹€“ó…\ãÑ‚i\é†Îšm\î\ÑY¿‡}-¦Ø°ˆ-fC‹^§\Óù\Ùo’sv‹³¾;Z\ÌÜ¨\ZÇŸ\ÔX¢Tþ\Ð\" E‡\ín©\\{\É6GÚ¯f¦¨Eƒc¬ó\ÇÔ‡=\Ú?´hq¤µ]\Ú\×b\ê)’uÖ–\ì !›÷œdB‹\Þ4\ÍÈ--f³¡`ÐgH½´h\0-Z@‹€\Ð\" E\0´h\0-Z@‹€\Ð\" E\0´h\0-Z@‹€\Ð\" E\0´h\0-Z@‹€9€\Ð\"W÷¡E@‹\0¶\Ìh¡EŒ	hF~e9Zsq\" E-f4ú.Z1W@‹0Âµ¨•ý;N´£T‹	ƒ3h0#Z´h\'ZÌˆ-$§E\Î EÀŒh\Ð\" E´hÀŽ9?€3¢E@‹€q\" E\0;f\ä´\0Z´ˆ- E@‹\0v\Ì\È	´h\'ZˆcFN E€¿i‘ó\0h\à&3r\0- E@‹Y\ç‚ \Ò\Zh-G¢9\0£\çjB‹h€«	-¢E\0®&´ˆ¸š\Ð\"ZŒ\Í\ç‘\Å@‹h-ZD‹h‘ \Ð\"ZD‹\Ñ\"Z$´h‘ \Ð\" E‚@‹h-ZD‹h‘ \Ð\"ZD‹h‘@‹hq´,\ÉÒ±9\Ý*\Ñ\"\Ù\"Z$\Ð\"Zl-úÊª‚uÓŠ)nšS\Ò4»¸q¶ütŒ\Ú\\Š’ƒuÓ¥p´H E´8Ì´(N,ŸûJõK«,®~ùƒ\êùÂ¢ø $?ü^\n,Ÿ»@Ìˆ	´ˆ‡™%­…5¼\×Ú¸pK\ÝÍµ¿n®³\Ì‘\Í\ßhnX\Ø*†^~_\nG‹ZD‹\ÃM‹Ms$O;ñ—Ÿ†^x7ôì›¡yo…ž{\Û	²\á³oV¿ðn\íëŸˆk^],…£E-¢\Åa¦Å’¦\ÙRw–OœXú\Ð\Ó%\Ó+¹ÿ{¥3Ÿp€l(›—>üt\èùw$y”:uq\ã\àkñÚµkÇŽÛ·o\ßÑ£Gl~\åÊ•#GŽ\Ø\ÙöL$.\\¸\Æõ\àÁƒ;b…,·É¥K—:::,Ê”÷²ÿþó\ç\Ï\Û9€Ë—/÷ôôM‹É»ˆyrd9Z„+Ñ³«\ç •_IôDjÁI3‚“g7<\ì\0\ÙP6—Bª~ò›°_Y4²Å‹/._¾|\éÒ¥6lp&&\ÙvÙ²ezIWW\×òH˜¸4Hã•¿~ýú¥±\"žO:¥\Þ\ì\îÝ»c®pýúõÕ«W\Ë\n²šüžð\0\Ú\ÛÛ—,Y²nÝº\Þ\Þ\Þ\Ì	N\Îd¯½0žsõ\ÑD‡œ4´)g‹óÕ‰\ç½%\é\Þ\r\'6\ÍqBÄŒRHÕ³o\ÖfW‹’ûôÅÍ›7«F²9‹\Õúûû\íhñÐ¡Cª´Á\Ò\â¦M›\â­/¦Ó›HŽSs\êUÉª\ìÀÚµke\å•+W^½zU+4\'\nq®©œÃ‡\ïÇ—ƒYj/¶o\ßn,VNZ\Ä}™\Ó\â²\ÐsoKEX91\\•NeF)$4\ïmI?%	Íš\åº]šr¬Y³f\èkQŒó\ÙgŸYlr\î\Ü9•0®Zµ\Êt„ò\å¡^ŠNuc\ÆÉ“\'\ÕNw\íÚ•0G3…©(•¢ÆŒ;wnÛ¶Í™\å\ËL½#´h\Ñ+V¬%Z4\Z*^\ÈJ\ÍWVÞ²e‹q¹8Eb³õM\ÙJÞ»1\î\é\é9\'DpñÄ´aÃ†‘\Ð“_Ô’½{÷ªIfza 6nÜ¨\Ê\ÑKT\ÞjÒ¢„\Þ)Z´C‹»w\ï\îsmmm\ÑZ¼	1ˆRƒúSê’ƒ¨E©ŸÆ¬\é«8r\äÈ¡PÙ™\èF/mÉ»P5\âC†H\Ø&kr«E\çŒN	¥^l\ÑO¢\Ö1öù(-®[·N/QZ”Ÿ¦\ê|´%wV\ï-ZŒ¡E\É;b¾*\â[	G\ÌT\ZeÔ¢6fF)—\î jq\ëÖ­+;Ë‘\ã•&i©ZAªÒªG^ò²\'N\Ä[_\ì©Ö·\ÖhÚµh\Ü5Z´hW‹\çÎSLWW—M-\Æ\ë°©\Åk×®\Éõ\ß\Ò\Òb3Õ²©\Åx\Ço\Ò\â2a­E\Ý\n©_Î­Z¿»»;z”“œCIiQö¨\ÙÈ©“%òS/Q\Í\Ç1µ(§-ZŒqatttôöööÇŠS§N©FÖ‰¹BOO\äDgÎœ1BìŽ„ö£úSª‡\ÖZ”\Ë^\"™©M—\Ù×¢¸\ìÒ¥K	µh³\ÝP\ë)æ«ªÁN\ê\ìj\\ŽT¨\Õ¤l\ÑckTf§Bg=\î\ÇB‹º\\t}-ZŒ\Û\Õ\à¬\")—¥ýq‹z/+B$³+*Ù³gµ\Ë\ìk1ZIÒ¢ü(’¯9­­­ò\ç’%KL­bü\è1\0’P¿`’\Ê[Bk\\¢\Éb Z´8\ÈZ4µ\Ðÿ”\Ú_ŠBŒ\Öb[[[v´(^‹y–Œ\ã%Ïž=«\\©bó\æÍ’q\ë´Q\Ò\Ìx‡‘‰¶E‰­[·¢E@‹VZ”|\çŒ!$\ÇQ\Ë\Û\Û\Û\Ï\Üº\ÇÖ¥¦¹{ ´•6l\Øpøð\áLt¹\Èî²£Ec•V\'ƒb:Q¡¼*ù£¯:\ã÷\îÝ«.¥œk×®©\å-‘\ÐtZB|šº\Ãt\Ð\" \ÅZ4µú[t¹¬Y³Æ±³\Ü¯C\Ét\0²\Úy¡»P¢\Ë9}ú´¼kÑŸd»\Ý\Ý\Ýj¤R¿i $Œ\Ñõe\ÙP#\Õ7\\\ê\ÝE‡|‡¥®Ecùh\Ðb–´()§dI\"‚Á\ÒbÂ’\Ó;@G\rET=Â’S«›ÿ$a”tO\ÎÆ–-[,¦—Ô†zð¹¨vW$ô\ízbXµ¤¿¿_\ç§\ËÂ˜\Z—\ÄÓ¢œ´h1m‹×¯_ß³gqMIK‹	k\Çi×¢¾+\Æ8<û\äÉ“ò5“ð\Èûúúbp&z¢Å¢E@‹™\Òb{{»Ð˜¶¨‰d:;;K‹ñ&\Å1\Ö^%·£›Pµ¥N-\É\Ý{!¢M-Jj:0Ue–nZ®\Ú7£\Ã8ü-ZŒq%\Ë|\Êº\Ëe\ïÞ½§nŽx].\âD“:\Õ\ÍƒØ¶/QJ\èJ‘‹ø=\æ\Ì`b®˜\í\è1:¢§ŽŽqœ\ê{‘?EL6¿lb\Î~S‹\ÑÝ¶h:±E‹€3Õ¶(H¢¤†s….‹ù\Ä>,\î“w¡I~‘©7+\ï]u\rG\ßo£µDÏ¦#\ß\"\Ñ\ÓÒ¨OI\íxýÍ¡;XL\Ëc\Þj™!-\ZgC‹€GKO´\äk\Ö÷#‹\ËÔ€%5\ÝÝ¡[\îL‰¡ÔˆcVÏ£\Û\"Ä¹²Ž¤1÷®0JÞ\ÔÀ ©Œ‹7e[I?\åSXus\èQA¦\å---w¢E@‹ih[T£O2¤E\É4\å‚w<‡~ô=\Ññ\îQR\Ðù I‹\" ]#Ž\ÙV ›¿H.]º$kJi’2‹¹\Î\Ì\èL‹\Ú}ú\ÖL\Ç}D§OŸ\æ\æ?@‹C\â.—„ZTIœýš`B-¶··G¯£[N;;;cjñs\Ãt8\ê1/ò~\Åe\êo‹’!®”ubvû\ØÑ¢¸oß¾}rBŒw‹+S÷öö\î\n=0(ú%\ëA‹hxhAl-¹9\Äº\Ë\Åô’\êIÈUY*“è˜´s¢\\Õ¬&õMñEkñ\âÅ‹’Š\×\Ôýˆ\êö>Ñ™N\ÅVúŽ”\èAˆr~,ž‡“P‹×¯_—\Ã3\Õ\Êå³ˆ×­œlÛ¢i\êo´<\âê¦ž\Õü¤<’°m±­­M\\cq‰µ%Ó‘JMƒ­E•Ù™OÛ¦£\çõ\Ò\Ï0\Ê7Z‹¦P_j\ä~;¦VQI$¥\ã¢¶˜e\Ú\É\Õ‘Ÿ¢æ¾¾¾„oÜ¾M³Š¡EHO¶’lñ\æ\ê\Þ-}8-D}*ôü\ï\Âf½/Î·hª‚fÔ¢\"§§T_HBd|t”ü©\ï»\ÐuÛ´hÑ”¯\é\ÙŒ÷œ(-\Æ\ë¹6yPU\é[\ß{\'¹¡\é!¢Qu;ŠXxwT¨n+\Ù$ú%\Ý}úô\é˜óŠŸ?¾#V¨PJŽùªq\î²\è¡ThR\Î›\æT/ø}\Ã\Â\Ö\Ú\×?	=ÿŽ$zR\Í{\Û²¡l.N¬}\í/\r\ïm®^°¸¸\é\ÑaªEq‡hER0%\Ý\Ý? \Æ7I-U\ÙAUHZ±ùDf›Z\Ô\íƒ*”šMõt\íJ9\ì\Õ7‡±iO\×a÷\ïß¯¬g¼ûX\Ï\ë%»\Óõk\ã\Í$v\"a‚n\ÜL*tm@7 EHo%ú‘\ê—6¼\×*f”š¯P¦\Ù\á\Í%O\'†µøòB)|˜j\Ñt½\é§\È©r1Ÿ\\ó²šž=,\æl©Ô \ãiQÀXÝ·oŸ\éöd9*\Ó\ãM’–T®\Û\ÚÚ¤¶\Ý\Ú(%¯J&A?s\æŒ\ä\ÚË’¥Å˜ýC‹-ë¦—\Ï]zùýšWW\Ï_TýJ„ù8Ao»`±8±bî«º\éCA‹’©\Îþ”_½½½›\"!é’¤H\Æ\Þ©{J\Ý0\æÔ²U{{»\ê0•­ô1©hqI¬P½%!)ªÀ\îX!\Çý\à\áò]ó\ä EHõƒô•U‰%­w%7\Îq\Øm\æQ)Pœ(…-ZD‹#.T-¢\Å\ìj1X’¥csº#.T-¢E²E´H E´ˆ\Ñ\"\Ñ\"ZD‹ZD‹h-h-¢E´H E´ˆ\Ñ\"\Ñ\"ZD‹ZD‹h-h-¢E´H E´ˆ\Ñ\"\Ñ\"Z\0´\È	\0h‘\0\Ð\"$\0 \ÅQûA‘®@‹h‘ ´u^Œ\ç\Ð\"\0Z´€- E@‹\0h\Ð\"\0Z´€- E@‹\0h\Ð\"\0Z´€- E@‹\0h\Ð\"\0Z´€- E\0´h\0-Z@‹€\Ð\" E\0´h-Z@‹€\Ð\" E\0´h\0-Z@‹€\Ð\" E\0´h\0-Z@‹€\Ð\" E\0´h\0-Z@‹€\Ð\" E\0´€- E@‹\0h\Ð\"\0Z´€-¢E@‹\0h\Ð\"ŒðÿÅ@‹€¬´øC E@‹0ªµø…¨@‹€a0k¦h\Ð\" \ÅÁ?Î˜‡Š-BšES+ös1‹­,üesÍ„\Ç`\çð\Ð\" EHU‹ö­”¢j“\Ú;Z´C¥o×ŽM\ë8\Öb²{G‹€!³ZL˜\è\Ùoû³NÖ¬m\î-Z„,i1)ûØ¬ö&TgR¦F‹€axk\ÑNF™‰T-Z„ô4,&u\'‰=\ÙQZ´\ÃL‹©ŒLXr†\Z\Ñ\" EH³“\ê†N¯\Ó2:-Z\'\ãtÖ¶hSÁiV‰-BJ·£8È\ÔøpgZtvZ´\Íhÿ%gus…¤ñ¢E@‹\0h\Ð\"\0Z´€- E@‹\0h\Ð\"\0Z´€- E@‹\0h\Ð\"\0Z´€- E@‹\0h\Ð\"\0Z´\È)\0´€- E@‹\0hFžû\Ð\" E\0[f´\Ð\"\Æ´#¿²­9‹…8\Ð\"Œ3\Z}­¿˜« E\áZ\ÔÊ‹þ\'Z„QªÅ„Á´˜-Z´ˆ-fD‹€’\Ó\"g	\Ð\"`F´h\Ð\"Z´`G‹œ@‹€\Ñ\" E@‹8\Ð\"€3rZ\0-ZÄ‰€\Ð\" E\0;f\ä„\0Z´ˆ-\Ä1#§\Ð\"Àß´\Èy\0´p“9	€\Ð\" EH†gˆ\Züo£E@‹ZD‹>-røL-—Ÿ) E\à\â3´\\B|¦€a´_BŸ\Ê@‹h\Ð\"ZD‹h\Ð\"ZD‹h\Ð\"ZD‹h\Ð\"ZD‹h\Ð\"ZD‹h\Ð\"ZD‹h\Ð\"ZD‹h\Ð\"ZD‹hF­}ò\Óþ\éóýþb¿?PøD–ø#+\Èjz´ˆ\Ñ\"ŒD-úƒA_p‚\'P\éö×¸|u\Þ\ÉE\rùEM¹\îi\äùS\ÊK²‚¬V\æ	\È&²!ZD‹hFš%\ã+ö\Ë=þ‰…¾©yE\Ós\\Ž+˜}_Á·\ï\Í{ü\î\Ü\'#<qw®ü)\å%Yaj~‘¬,›È†>´ˆ\Ñ\"Œ-ú\á$±\Ü¨qy\'\ç5Dœxÿø\ÂY\ã\n[0\ç¾üG\Ç\ä?voùEþ”…ò’¬0=\Ç-+×‹]\ÞòH\Ú(E¡E´ˆa\Øk±\Ä¨rû&xfŽ\æK&8#§°1\×=5\Ï-–¬+ô\Ôz&º\"z\åOY(/\É\n3\"¥lòÀ¸\Â)ž\Û\'E¡E´ˆaxk1\àVù\ê<3rÜ\ÜW ù ˜®1\Ï=© (\Îý%\Þ@ œ†ñ\">Y(/\É\n²Ú¬±\áMdC\Ù\\\n©(òüh-¢EžZ”\n¯8NœXW\ài\ÊuK¥X²¿¦°\Ãy_Xˆ¢¸X})²P^*óø%Ç”•e“‘J÷´\\\Ù\Ö+†7L­6\Ñ\"Z„A\Ðb\Ð¯\Õ8Q~Öº<ªÿ\ÄoS¬þ½4²\á´\\\×3\ÖG¬*…£E´ˆa8i\Ñ(.÷&G\ê\ÎÊ‰R)Á\ÂCƒ\ÞÈ°DY©\Ô‚#U\ã\Ê\ä\Ï\Ò\ÈH\Åð¸\Å@xe\ÙD6œô·”\Ó=¥À#«ù\Ð\"ZD‹0,´¨FkK–W\ãò\Î_it©<1Iñ\Äw%^Q¡b¡wJ~\Ñô\\\×\Ìq…Ž\r#¿ÈŸS\Â\ãr¼²‚\ç÷\ßh T9\ãŒ\\÷\ì±Œ+œ\èòG\Æ3úÕ¦‡—\ÎV­Zµ<}}}vÖ¿zõ*ZD‹0”²Eqd8Žr~\Ñ\Ãc\Ãcnšò\Ü*OT\Ò\'V¹|’<Š\Z·ø\Ä\Ý9s\ï\Z/\È/ß¾7WN\Ï)¬/(’\ÕJ½%>eFI\Ã=0có\ëóÃ¹g\Ð\éx\Æ\á¥\Å\æ\ææ¥‘8{öl¼u.]º\Ô\ÕÕµcÇŽu\ë\Ö-[¶\ìÌ™3h-\Â\Ê\'x}\ryEŽÌ–úod<vP\å‰\Õ.oc®[\Ã9cò¿{O\î“w\åüÝãŸŽ ¿ÈŸ²P^’\ZóÜ²r‰÷F…Z\n©/ô\Ì\Z[ H\á²©JûGA¶h­E­Â¥†8}ú4ZD‹0d´\èVºý\ê>–ðø\Ä<w\È\í÷±øƒ*O\'>|_Áw\ï½!Ä§\Â6\Ì\Ñ<¥\åxo\î\Ãc\Ô\æ\á\áŠ\á{¨‹«\Ü\Þ\Æp\Çt¡º¦\Ê\í÷ûG{¶h\"ZD‹0\ä´(žªqù\Ô},=-jyE‘_þ”4P”÷ý»$=\Ìù\Ñ]¹?¼+\ç\élQ–ÈŸ²P~‘¾{Ož¬,µi\ÙP\é¯,\Ü÷R$\ÅÞŸ\ã’]Ô¸¼d‹+V¬lQr\Æ\î\î\î\åË—£E´CP‹Áº¯Ôg+œ*¹žÔ‚#·¦H5xb¡wz®K*\ÈO†U˜óƒ»\Â\È/OGrÆ§Ì¨—Ï½+GVžžS(R\íòIž(…‡«\ç…¿´k\Ñh-\ÂP\ÔbÀœ\\P4û¾©OŽtŒ(s•zýSò‹\Z[ð\Ý{r¥š,)¡¸\ï©!šøA$g”_de\ÙD<X\ê\rk1Vxü“<²Pv!²U‰¾pá‚¤c»\"\Ñ\Õ\Õ\Õ\ß\ßsµ¾¾¾\ã‘\è\í\íUK._¾,\ë\ïÜ¹³½½ý\äÉ“	÷\"+\Ë.ö\î\Ý{\ìØ±+W® E´#A‹\rùEß¾7o\Î}ùu…žï»˜\Ë<Ieù“F\ê\Îqµ¨j\ÓOE\Z¿}o\îô\\·l~\ãko ®\Ð;û¾ü\ïÜ›×˜\çd%[I™šðD@\ÑkŠþ\Ô\nmmm×®]Û²e‹–šŠ\íÛ·\Ç\ÛËž={LM„+W®<zô(ZD‹0Ìµ\è6\åº¿;÷\Ñ1ùµ…žÀ@\Û_E‘o\æ¸\Â\'\îw³üÝ7\Ú\ãkñFÇ´ ›È†²¹®¤Kú\Ñûò¿\'Wvðe\\‹¢6\í)“\ãö\ï\ßO‹[·nÝ´i\Ó\ÒXqð\àA\ë½HhuŒ\Ñ\"W-N\Ëu?yw\îc÷\æOty¼Z¬,ò=8¶p\î]\Êw9N\ÔfT?e“\ÇVh\ÑlL¾\ìbZŽ+\ÓÙ¢¤„J4+V¬J´,‘Š­¸oÉ’%²pÕªU’\ÆÔ¢Ž\Ö\Ö\ÖC‡I&(©ŸZ²v\íZ\Ó^:;;\ÕKR¬Ô ¥†.\ÅJ%\Ú$V´ˆ-²¯^½\Ú\ÒÒ¢D\Ó\Õ\Õe|iÝºujù\âiQRK\ãV\"G]7\íhÍš5\ê¥;v˜^’\Ô-¢E	•\è\'\"•h©\íú­Å›+\Ñ9‰*\Ñ9ƒ^‰©)\ËHV\ÝÚ¨^Ú¶m[<-šL\Ú\ÛÛ«_2.?r\äˆ^®;j\è‰F‹0r»\\|¦.—Ü´v¹ù3©E\í>\Ñ\âþ›C7nÜ¸1¦¥\îl*\íò\å\Ë1µ(¥©…’32@-tl\Ðq—zn\Ð)ÿ\Û\0üL\Ðikk[š(L\r…Æžh›Z”ŠsLÃ¢E´£c8wNaòÃ¹]\á\á\Ü~UHP\nTÃ¹g\Íøp\îÍ›7\'\Ô\â\êÕ«SÔ¢\ä•j¡d h-Â¨¸ù¯\Ìpó_½Ã›ÿ|\æ›ÿ\"s}gú\æ?Ç‰mn\â@‹ñ\ê\ãh-\ÂÈš*\"¿hzNøay\î*·\ï\Æ8jªˆ<÷\Ã\áªt\ÞÜJô\ß\rd‹ú—¹\áytò›cªo@\Í\\º1U„K\nŸ’ù©\"t/ðÊ•+3§\Å]»v\Å¸ƒ\Ñ\"Œ-FzWô\Äbáª®ab±R5±X^ò‹oL,¦&+\Ë\Î\Äb§NR\ã%b\ÞÓ’-\ê.—˜\â;p\à\0t\Ð\"o-\êih\ëcOCž^,~Æ‹¤“…‘ihscMC\ë’Tž\è7MC~tþ\älMC«þV¬X\Ñ\ÓÓ“	-ž;wN\ß\Ê\"»»~ýº±4\íe´ˆag‹\ê¡]\Þ\Æ\Ýü\ÐÿÀC|7Z®kG¦¤}0B\ä¡\î©ù\î\ÈC|%±Z >0¾°¦0K-\è\ë\ëÓ®‘Ê¬Tx9\"~<v\ìØ¾}û6nÜ¸iÓ¦µh\êò–ª´²eË–U«V™n7Œ©E©\é\ëaCZ¯rœz\áùó\ç\Ñ\"Z„A\Í\äX\î	Lx\ÄÕ´\\—T¥\r¸*x\ÄUÀøˆ«\nõˆ+Oøiªa!†\ÓÁÁÄ•xPß·\ëÖ­K]‹½½½úv\ZStvv:˜†\ÖÇG‹h_‹\Þ\ÈQ#•eÏ´\\÷¦¢\Ú\ë\'1>µ)R\ÈÀQýY~ ª$\\’¾\é´Qß¿,.“¼,fÿI´¯\\¹O‹j’{\Z\Ë_³fšŠB\ï\×ú˜xq\â\Ä	´ˆaHh\ÑF*Ë¾I\Þi*\Ñ\Ëu‹\Ý\ê=UnoYØ@¬*p ò\ØY!\äö\ÊÊ²ÉŒ\\•rº%gW®}{ZkQ‡TŸ;\"!)¤\Í\çð%/^”’¥ü\Ï>ûŒ¢¢EiZ¸\é%|7t}¤6={lÁ£cògEž\Ð2© ¨\Ú\å«ðø#\rˆAõHh\äy/’†\\\Þðø\Ä<÷ƒ\ã\n½/?\Ò@\ÎÅ‰\Î\æ†H—yN4 EH\Ã%$ÉÔ¦§x\Â=0c\ÃZ?ú*ÜµR4¹ÀSW\èX\è­q…‘_\äOY(/\É\n3r\\¢Å‡\Ç\æKõyJ¤\î¬\ï°F‹h-\Â0Ö¢Txƒ\áJq`¢\Ë[Ÿ_\Ôy(\àý9®Y\ã\nÕ­Í’>6&Œü\"\ÊByIj\Í\ÓsÜ²ò\äü¢šB©tK>L±\îŒ\Ñ\"Z„!¡E\Ý7­úO&ú\"÷À„3Á\Ù÷|\çÞ¼\Ç\ï\É}ò\î0ò‹ü)fŒd”®)ù\á1Ûª—Æ—\Öw„\Ñ\"Z„Á×¢º/P¥Un¿T™\'zD|y\á~˜i9.A~i\Ì+’…ò’¬ «©$\Ñ\çz\Ñ\"ZD‹0µ\îW	×©ý~õ3ð‡‡j|\áÁ‰\êø÷ð4<z5_dC´ˆ\Ñ\"Œ@-\Ð\"ZD‹€\Ñ\"ZD‹€\Ñ\"ZD‹€\Ñ\"ZD‹€\Ñ\"ZD‹€\Ñ\"ZD‹€\Ñ\"ZD‹€\Ñ\"ZD‹€\Ñ\"ZD‹€\Ï-—ð™¢E\à>S´i\áñ\È\ÐúCó\ÊÐ»\0´8ü´øxœ@‹CD‹\Ä\È\Ì5\\µ8š\åˆ	´ˆ1\ãP\ÔbF¿ê¢™Š E«‹-Ž-Ò¶h1—ZD‹\0h1¹\å13JÇ¥Y”o}\ÌñÖ´\Ù\Z–„x\ÇcqT\ÖG’¬¶L\Û\Ú9~Ÿƒ3\É%\n#¼\í¬\ÅÊ¦¹¬\ËOª÷<õrk1a96&\á^²£\Åt}\"\0£B‹1/›>·k\ëòi1)/[jŠZLx$v\\f\ÛLh\ÑÙ™\ä…‘ \ÅT®g;)R¼\ë0©\Ü*Ùœ\Ëq\â\æ@‹i?˜Ô¿®l6w\Øù\ÄS9x€‘6n\Ñq\rÎ¦g“2”£eG‹I%e\Ç$+¸´h‘¡€“6EŠZt\Ð\Ìgó`œõeZ‹6ó2\Ù}†´˜\Ô\'‚aj1•+?fu8\Þ…v¦\ÛI\çž\é\Õ\"=\Ñ0*\è8Ö¢ÍŠ³ƒ^‚ô\Zmj\ÑA;f²_©W¢“ªyp‰Â¨Ð¢^ûZt\Ö8•\Êè¿¡ \Ås«T²\é»\\\ÒXÿ\0@‹CW‹©÷8Š˜Jb•JCp´HŒ-:±a\Ý6o\ßSö\Ùf9Öƒ.SI\ß\ÏNoF–¹q‹\Ög-Â¨\ÖbR]“Ž(g•\ÄTúO3}—\ËðÕ¢ýq©8F‘“º\Ç\Ëq5u-:x”9-f¢¦iÿžñL\Üa„k1\Å1=C|™\ÖS*}¸Ã«ñ.;g`¸j\Ò+š,o€aH;‘~^\0´h\0-5h\0´\0€\0\Ð\"\0\0Z\0@‹\0\0h\0\0-\0 E\0\0´\0€\0\Ð\"\0\0Z\0\0´\0€\0\Ð\"\0\0Z\0@‹\0\0h\0\0-\0d”ÿA^\Zñ\Ê\â\æ\á\0\0\0\0IEND®B`‚',60001,'com/maben/jbpm/test_1_helloworld/helloworld.png');
/*!40000 ALTER TABLE `JBPM4_LOB` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `JBPM4_PARTICIPATION`
--

DROP TABLE IF EXISTS `JBPM4_PARTICIPATION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `JBPM4_PARTICIPATION` (
  `DBID_` bigint NOT NULL,
  `DBVERSION_` int NOT NULL,
  `GROUPID_` varchar(255) DEFAULT NULL,
  `USERID_` varchar(255) DEFAULT NULL,
  `TYPE_` varchar(255) DEFAULT NULL,
  `TASK_` bigint DEFAULT NULL,
  `SWIMLANE_` bigint DEFAULT NULL,
  PRIMARY KEY (`DBID_`),
  KEY `IDX_PART_TASK` (`TASK_`),
  KEY `FK_PART_TASK` (`TASK_`),
  KEY `FK_PART_SWIMLANE` (`SWIMLANE_`),
  CONSTRAINT `FK_PART_SWIMLANE` FOREIGN KEY (`SWIMLANE_`) REFERENCES `JBPM4_SWIMLANE` (`DBID_`),
  CONSTRAINT `FK_PART_TASK` FOREIGN KEY (`TASK_`) REFERENCES `JBPM4_TASK` (`DBID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `JBPM4_PARTICIPATION`
--

LOCK TABLES `JBPM4_PARTICIPATION` WRITE;
/*!40000 ALTER TABLE `JBPM4_PARTICIPATION` DISABLE KEYS */;
/*!40000 ALTER TABLE `JBPM4_PARTICIPATION` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `JBPM4_PROPERTY`
--

DROP TABLE IF EXISTS `JBPM4_PROPERTY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `JBPM4_PROPERTY` (
  `KEY_` varchar(255) NOT NULL,
  `VERSION_` int NOT NULL,
  `VALUE_` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`KEY_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `JBPM4_PROPERTY`
--

LOCK TABLES `JBPM4_PROPERTY` WRITE;
/*!40000 ALTER TABLE `JBPM4_PROPERTY` DISABLE KEYS */;
INSERT INTO `JBPM4_PROPERTY` VALUES ('next.dbid',7,'70001');
/*!40000 ALTER TABLE `JBPM4_PROPERTY` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `JBPM4_SWIMLANE`
--

DROP TABLE IF EXISTS `JBPM4_SWIMLANE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `JBPM4_SWIMLANE` (
  `DBID_` bigint NOT NULL,
  `DBVERSION_` int NOT NULL,
  `NAME_` varchar(255) DEFAULT NULL,
  `ASSIGNEE_` varchar(255) DEFAULT NULL,
  `EXECUTION_` bigint DEFAULT NULL,
  PRIMARY KEY (`DBID_`),
  KEY `IDX_SWIMLANE_EXEC` (`EXECUTION_`),
  KEY `FK_SWIMLANE_EXEC` (`EXECUTION_`),
  CONSTRAINT `FK_SWIMLANE_EXEC` FOREIGN KEY (`EXECUTION_`) REFERENCES `JBPM4_EXECUTION` (`DBID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `JBPM4_SWIMLANE`
--

LOCK TABLES `JBPM4_SWIMLANE` WRITE;
/*!40000 ALTER TABLE `JBPM4_SWIMLANE` DISABLE KEYS */;
/*!40000 ALTER TABLE `JBPM4_SWIMLANE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `JBPM4_TASK`
--

DROP TABLE IF EXISTS `JBPM4_TASK`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `JBPM4_TASK` (
  `DBID_` bigint NOT NULL,
  `CLASS_` char(1) NOT NULL,
  `DBVERSION_` int NOT NULL,
  `NAME_` varchar(255) DEFAULT NULL,
  `DESCR_` longtext,
  `STATE_` varchar(255) DEFAULT NULL,
  `SUSPHISTSTATE_` varchar(255) DEFAULT NULL,
  `ASSIGNEE_` varchar(255) DEFAULT NULL,
  `FORM_` varchar(255) DEFAULT NULL,
  `PRIORITY_` int DEFAULT NULL,
  `CREATE_` datetime DEFAULT NULL,
  `DUEDATE_` datetime DEFAULT NULL,
  `PROGRESS_` int DEFAULT NULL,
  `SIGNALLING_` bit(1) DEFAULT NULL,
  `EXECUTION_ID_` varchar(255) DEFAULT NULL,
  `ACTIVITY_NAME_` varchar(255) DEFAULT NULL,
  `HASVARS_` bit(1) DEFAULT NULL,
  `SUPERTASK_` bigint DEFAULT NULL,
  `EXECUTION_` bigint DEFAULT NULL,
  `PROCINST_` bigint DEFAULT NULL,
  `SWIMLANE_` bigint DEFAULT NULL,
  `TASKDEFNAME_` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`DBID_`),
  KEY `IDX_TASK_SUPERTASK` (`SUPERTASK_`),
  KEY `FK_TASK_SUPERTASK` (`SUPERTASK_`),
  KEY `FK_TASK_SWIML` (`SWIMLANE_`),
  CONSTRAINT `FK_TASK_SUPERTASK` FOREIGN KEY (`SUPERTASK_`) REFERENCES `JBPM4_TASK` (`DBID_`),
  CONSTRAINT `FK_TASK_SWIML` FOREIGN KEY (`SWIMLANE_`) REFERENCES `JBPM4_SWIMLANE` (`DBID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `JBPM4_TASK`
--

LOCK TABLES `JBPM4_TASK` WRITE;
/*!40000 ALTER TABLE `JBPM4_TASK` DISABLE KEYS */;
INSERT INTO `JBPM4_TASK` VALUES (10002,'T',1,'æäº¤ç”³è¯·',NULL,'open',NULL,'å‘˜å·¥',NULL,0,'2021-02-17 21:33:26',NULL,NULL,_binary '','helloworld.10001','æäº¤ç”³è¯·',_binary '\0',NULL,10001,10001,NULL,'æäº¤ç”³è¯·'),(50001,'T',1,'å®¡æ‰¹ã€Œæ€»ç»ç†ã€',NULL,'open',NULL,'æ€»ç»ç†',NULL,0,'2021-02-17 21:52:13',NULL,NULL,_binary '','helloworld.30001','å®¡æ‰¹ã€Œæ€»ç»ç†ã€',_binary '\0',NULL,30001,30001,NULL,'å®¡æ‰¹ã€Œæ€»ç»ç†ã€');
/*!40000 ALTER TABLE `JBPM4_TASK` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `JBPM4_VARIABLE`
--

DROP TABLE IF EXISTS `JBPM4_VARIABLE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `JBPM4_VARIABLE` (
  `DBID_` bigint NOT NULL,
  `CLASS_` varchar(255) NOT NULL,
  `DBVERSION_` int NOT NULL,
  `KEY_` varchar(255) DEFAULT NULL,
  `CONVERTER_` varchar(255) DEFAULT NULL,
  `HIST_` bit(1) DEFAULT NULL,
  `EXECUTION_` bigint DEFAULT NULL,
  `TASK_` bigint DEFAULT NULL,
  `LOB_` bigint DEFAULT NULL,
  `DATE_VALUE_` datetime DEFAULT NULL,
  `DOUBLE_VALUE_` double DEFAULT NULL,
  `CLASSNAME_` varchar(255) DEFAULT NULL,
  `LONG_VALUE_` bigint DEFAULT NULL,
  `STRING_VALUE_` varchar(255) DEFAULT NULL,
  `TEXT_VALUE_` longtext,
  `EXESYS_` bigint DEFAULT NULL,
  PRIMARY KEY (`DBID_`),
  KEY `IDX_VAR_EXECUTION` (`EXECUTION_`),
  KEY `IDX_VAR_LOB` (`LOB_`),
  KEY `IDX_VAR_EXESYS` (`EXESYS_`),
  KEY `IDX_VAR_TASK` (`TASK_`),
  KEY `FK_VAR_LOB` (`LOB_`),
  KEY `FK_VAR_EXESYS` (`EXESYS_`),
  KEY `FK_VAR_TASK` (`TASK_`),
  KEY `FK_VAR_EXECUTION` (`EXECUTION_`),
  CONSTRAINT `FK_VAR_EXECUTION` FOREIGN KEY (`EXECUTION_`) REFERENCES `JBPM4_EXECUTION` (`DBID_`),
  CONSTRAINT `FK_VAR_EXESYS` FOREIGN KEY (`EXESYS_`) REFERENCES `JBPM4_EXECUTION` (`DBID_`),
  CONSTRAINT `FK_VAR_LOB` FOREIGN KEY (`LOB_`) REFERENCES `JBPM4_LOB` (`DBID_`),
  CONSTRAINT `FK_VAR_TASK` FOREIGN KEY (`TASK_`) REFERENCES `JBPM4_TASK` (`DBID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `JBPM4_VARIABLE`
--

LOCK TABLES `JBPM4_VARIABLE` WRITE;
/*!40000 ALTER TABLE `JBPM4_VARIABLE` DISABLE KEYS */;
/*!40000 ALTER TABLE `JBPM4_VARIABLE` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-02-18 12:07:03
