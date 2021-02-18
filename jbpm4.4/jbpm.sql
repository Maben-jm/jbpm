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
INSERT INTO `JBPM4_EXECUTION` VALUES (10001,'pvm',1,'提交申请','helloworld-1',_binary '\0',NULL,NULL,'helloworld.10001','active-root',NULL,0,10003,NULL,10001,NULL,NULL,NULL),(30001,'pvm',3,'审批「总经理」','helloworld-1',_binary '\0',NULL,NULL,'helloworld.30001','active-root',NULL,0,50002,NULL,30001,NULL,NULL,NULL);
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
INSERT INTO `JBPM4_HIST_ACTINST` VALUES (10003,'task',0,10001,'task','helloworld.10001','提交申请','2021-02-17 21:33:26',NULL,0,NULL,1,10002),(30003,'task',1,30001,'task','helloworld.30001','提交申请','2021-02-17 21:44:38','2021-02-17 21:51:25',406562,'jbpm_no_task_outcome_specified_jbpm',1,30002),(40002,'task',1,30001,'task','helloworld.30001','审批「部门经理」','2021-02-17 21:51:25','2021-02-17 21:52:13',47649,'jbpm_no_task_outcome_specified_jbpm',1,40001),(50002,'task',0,30001,'task','helloworld.30001','审批「总经理」','2021-02-17 21:52:13',NULL,0,NULL,1,50001);
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
INSERT INTO `JBPM4_HIST_TASK` VALUES (10002,0,'helloworld.10001',NULL,'员工',0,NULL,'2021-02-17 21:33:26',NULL,0,1,NULL),(30002,1,'helloworld.30001','jbpm_no_task_outcome_specified_jbpm','员工',0,'completed','2021-02-17 21:44:38','2021-02-17 21:51:25',406571,1,NULL),(40001,1,'helloworld.30001','jbpm_no_task_outcome_specified_jbpm','部门经理',0,'completed','2021-02-17 21:51:25','2021-02-17 21:52:13',47662,1,NULL),(50001,0,'helloworld.30001',NULL,'总经理',0,NULL,'2021-02-17 21:52:13',NULL,0,1,NULL);
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
INSERT INTO `JBPM4_LOB` VALUES (2,0,_binary '<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n\n<process name=\"helloworld\" xmlns=\"http://jbpm.org/4.4/jpdl\">\n   <start name=\"start1\" g=\"46,16,48,48\">\n      <transition name=\"to 提交申请\" to=\"提交申请\" g=\"-64,-19\"/>\n   </start>\n   <end name=\"end1\" g=\"46,346,48,48\"/>\n   <task name=\"提交申请\" g=\"24,96,92,52\" assignee=\"员工\">\n      <transition name=\"to 审批「部门经理」\" to=\"审批「部门经理」\" g=\"-109,-19\"/>\n   </task>\n   <task name=\"审批「部门经理」\" g=\"24,180,92,52\" assignee=\"部门经理\">\n      <transition name=\"to 审批「总经理」\" to=\"审批「总经理」\" g=\"-98,-19\"/>\n   </task>\n   <task name=\"审批「总经理」\" g=\"16,264,109,50\" assignee=\"总经理\">\n      <transition name=\"to end1\" to=\"end1\" g=\"-46,-18\"/>\n   </task>\n</process>',1,'com/maben/jbpm/helloworld/helloworld.jpdl.xml'),(3,0,_binary '�PNG\r\n\Z\n\0\0\0\rIHDR\0\0�\0\0K\0\0\0��H\0\0kMIDATx�\�\�wtUYz\�}�t\�n�=��<�\�3�;\���\�\�k\�a\�n���\�N�����:U�(�DE�*r\��$���$D9g!QBB	��s\�\�=\�Wu\���R}?��n:\�\�#\�_��<{�\0\0\0\0�^)$\�\'\0\0\0\0\0\0~1�z\0\0\0\0\0z)B=\0\0\0\0\0��\0\0\0\0�^�P\0\0\0\0@/E�\0\0\0\0��\"\�\0\0\0\0\�K\�\0\0\0\0\��\0\0\0\0\0�R�z\0\0\0\0\0z)B=\0\0\0\0\0��\0\0\0\0�^�P\0\0\0\0@/E�\0\0\0\0��\"\�\0\0\0\0\�K\�\0\0\0\0\��\0\0\0\0\0�R�z\0\0\0\0\0z)B=\0\0\0\0\0��\0\0\0\0�^\�S\�\�\�\�;G[[�Z[\�\�\�\�h�7l�}\0\0\0\0\0�Oe����\�\�V577���Q������QMM���\�F�\�\�jU\�Pﶵ}l__�\0\0\0\0 >U���*\�ڦ��&ԯ�\�\�\�s�8z�����&,��ƅ~ύ�K��I\�/j\�\�����C�\�u�0K\�\�\�\�\"����\�=\0\0\0\0  >���2\�\�\�f\�\�V\�\�\�-\�8H����\��[�\r��D\�\�Ó�/q�%�Q\�y��{_SW��\��AC\����,����NSz�uUUU��p\0\0\0\0�>\�?�/ߪ�\����GK7\�/̏�x^1Gg\�\\Z�n\�=���D֥�����\�1Sw��*��n\�ՁK�Z�i��-��\���G\�vn�j�k]\�ު�{\0\0\0\0��ҧC�/\�[���N�W\�%��qa\�i_\�\n�\�Pa}��\��T�|Uy��m�.\�۰\�\�\�}^ޒ�\�\�J\�ح\�-\�\����%\�\�)%=I��U���#\�\0\0\0\0��>\�;}��eUE\�zh�F�~˵\�_ʊWY�m\��C�\'�\�΀�UvQ;\�.\���4g\�\�x\�J\�JU[SK�\0\0\0\0<}2\��W\�kkk�\�\�|�\r{N�΅*��\�\�U\�wU\�pK�n\�Ӝ\r�h֚\�t�\��������`\0\0\0\0x\��l��@___�=�V\�\�oi\��P7��V�_&\��_{���G5m��� \�-]�y�{��`�\�\��\0\0\0\0�4��P\�\�ۊ�g�\�\�\�\�����a�B_��K~�7]Y������q�u+�\�\�+\�\�y�U�\0\0\0\0x\��d�onnVUu�[\�n\\�s���W�m�\�[�b��Z�s�F-�g;�S����TCC\�z\0\0\0\0�SѧB�����B~0a��/�\������d��9Ke\�(m��2o�6u<w��}#\�=v���\�\�\�6\�\��\�x\�ג�Ԣ���nzWWSU\\T\�\�\�\�E\�\�\0\0\0\0��>\�-@WVVh��756�;�z\�J�3UА\�T��\�ne\����=�\��\�o\����\�W\�\�[*jLӪݣ4|�\�t\�d�\�\�橼�\�U\�i�\0\0\0\0<i}&\��W\�\�\�ثa�u\�+���\�\�\\SN�U7\�\�{�=�\�\��95�x\�\���\�\�{�m\���\�ԭ\Z\������zEE�ET\�\0\0\0\0OE�\n������~\�d\r���ڟ�R���^�\�1\�\�w�[\�\�2o\�{�\���=�\�{\�\�\�(�\�\�w�\�\�\�;NE�R�Oj\�\�h��t\�\�W����`n=\0\0\0\0\��\�S����\�\�嚷~�F.���\�X��%��\\t܍]Frᱎ�\�Wh\��\�\�\���޿\�\��\��£Z�\�M\r����\�f\�\�\�Vii�\�  \�\0\0\0\0��>\�m\�zCC��K4)�G���\�t�\�&]\�;�Kw�w�$\��\\{\�w\��}n�\�r\�q\�ǟ\���\�\�w���~��Wk�\�\�3�B\�\�W+==S����-�\0\0\0\0\0<)}&\�w̧oPQq�\�,~A�����6\�|�.�\�\�\�=v��{�\�܈�ǹǎ\�\�\�:?;��6]\�N�\�w��\��B/\�E1q�y3M���nZ@SS�\�\0\0\0\0OL\�\n�u�*,*\�G����F\�T\�7Ngl���=f\�{\�\�zｭn�ә[\�\�\'ck\�>��e��˶�\�^�Ԡ\���ۗ)%9Uyyy���\"\�\0\0\0\0��>\�\�,\�\�Å\�ժ�\�d\�f��\�8~o�\��x<=\�{\�^�H��3{~\�\��\�\�һӎ�Yo��B�_+j\�R%߸��w\�\�\0\0\0\0O\\\���R���\�x[GS7x�ۂ��{~ӽ\�:��n¹m\�\�o\�\�\'�c?�\��}۹G�\�\�]X\�\�-Ӎ\�)�z\0\0\0\0�S\�\'C�\�%\�״u?ց\�\\{�\��\�^p߬�1\��\�{\�-�w<��b\�p:_\�{\��ms\�8�\�x��^�_wx�ޚ��)6�P\0\0\0\0xj�X���B}��-��F���\�\"\�vgo\�>���]���\�V�߼s��o\�\0\0\0\0OG��EEE\n���f��v^u��K��Ǎ��޸\�1:߻�~�\�g�\�\\�\�/�N����v�#7^rv�\�\�X�ڹo#�\0\0\0\0�\���P___�\�\�bm?�X\�\��m:6MW�\�Z�]-�\����w������\�~�_\���\��:\�\�8��\�\�\�L�6�X�\r\�X���\�\��d��=��\0\0\0\0<i}&Է�����Aeee��vIcC��\�\�~��̝�U~^i�g:F\�\�#\��^w��\��|��v\�\��:\�\�d�7��3[gΜ\�͛7UPP���\Z577��	\0\0\0\0Ї��Po��ʊJݹsG+��!��V\�nD\�N�UݮJ\�\�\�K�F�YU\��=���o�{\�wls\�\�v�o\�{�uo�������\Z�\�;�\��	�JOOw\�65��	\0\0\0\0\0xR�L���v�\�枟_�I\�]�~\�\�J.8�T\�\�%+\�yu)�#ߍ{\�\���W����n?\�{\���m\��;�H\�\�]Q�u\�\�a]�|Y\�\�ٮ{��\�\0\0\0\0OR�\n��y��%�\�\�\�Һ\�S\\�>�\�\�\�$��9Kō�*�є\��ؘ�\�&\�댎Gotn\�\r�\�^7f|����F��\�\���\�5y\�\��IgϜSJJ\�}�魛\0\0\0\0\0�\'�τzc����Q���n\���W\�h\�.l_��W�m��h\�QEKN\�c��֜�޷\�\�-~��\��Fe\�֧jy\�0}�M�۶@G�Vҥ$eee����\�{\0\0\0\0�SѧB�U\�[ZZ\\��0��u[\'\�д/iΆWu�\�Q/�\�\�w�FN�׏2rU\�f�����L\�\�\�o)\"j��\�ߧs\�λ����;oeG�\0\0\0\0���Po:̫�t�:-\��ܦ�+~�i��\�W֨�\�潪}\�p�h\��-o\�q	�\�\�}���ڳw�N�:�k׮uΥ�J\0\0\0\0xZ�\\��U\�mn}yy�[	?\�f��Ӭ\��4r\�7� >B%	����\�{\�\�q\���M�ڛ�\\����|S�jO�N�<yRW�\\QFF�[񾶶�*=\0\0\0\0\�\�s�\�X��{\�[����T999JINё�{�l�p�Z�O^ ��V\��\�\�Tܐ��\�l\�;���ǎ��\�*k��\�\�I\�}n�\�D���QSW�Dk�\�W|�n�<qRIII.\�\�}\�mq<�\�O�\0\0\0\0��\�P\�[	ߪ\�555n~�/؟>T\���ќ�oj�\�p\�|�ڟi\�\����\���SyU�5)�YpZǯoT��iZ3Pc¾��\���ƅOa\�\'i\�\��:p`�k��\�\�����744��;\0\0\0\0\0��>\�M\�`\�\�߼��K�t�D�bv�Բ����\�\���g���\��;�\\�O\Z�\�_4|�\�5\�{oȜ����|Ks7�\��銉]����\�\�c:wC����\�\�B\���@\0\0\0\0x\��l�7�}\�Y+�ͱ�[ݥ��{A��.$$\��\�Cڵ?F\�\�Wh���Z�n�\�\�\�T\�\�\�q\���Z�i���*o��:x���=�3gθv{[\�\�ų9�\�rO�\0\0\0\0��\�Po|�\�\�\�[\�*\�EEEn�[�n\�\�\�k��xI\�\�%\��\�:y\�N?y�8q\�{��\�x�\'�Op��)))\�>�yyyn�{\��9�z\0\0\0\0��\�\�C��\�[��J�p�\�[���{k�OKKsA���\�nXK�\r\�\�7n(55\�U��2oa\�Z��:o]\0\�\r`\�A�\0\0\0\0<+��P\�k����p\�Y���\�[{~w\�>�m�\�o�y�0o\�yn[\0\0\0\0x֞x��\�l!�qYȶ�,�?n�\�z|_���|�������n�}f,\�\�>�/a\0\0\0\0HO<\�_�rE�vϯ^��ݻwkϞ=n\�sk[\�i�͛7?��l߾�\�cYU=..΅o��[ۼ�֯_�^�.]r��\�\��\r߅\�Vy�\���\�\��6h�\0\0\0\0�C���[[�㰠k�\�[\�6[�nu\�ma9[)><<\�=7�7m\�䂼m�f\�\ZM�4I7nt��l\�\�>��\�ƪ\�Orr�K�,ё#G:_[�����;vhݺu\�{ccc\�1g͚\�y�ӧOw{�6lμU\�}�}\0\0\0\0�`\�c��J����\�`Ԃ\\x>q\�v\�ܩ\�\�H\�\�ǻ�h\�\"W�7VA�깅v�			\�\�\�pa;&&\�x�]�\�y7�R�̙3�m\�6w�`Μ9\�B��^�r�{ޕ-tg߳o\�>\�\�Ν�\�\�h�sss{�;\"\"\"ܹ\0\0\0\0\0̺\r�֢nz�\�ٮe\�ت\�V��j��}�}[W�:\�\�6G݂��s\�ι\�\�\��\���m޺�[έZ�\�] �g!߾\�\�o\�\�{\�\n\��̷������W����ϛ7\�]�Ǐw\��\�]���C\0\0\0\0\0�`\�m���mm\���\r߆U\�-[��pnA�;vA��U­*o\�*\�6�\�\�\�ng�\�\�\�nA\�.XU\�\�B�U\�CCC�k\�.7�\�\��Θ1CQQQnX7��\�\�\�y.[�\�͗7\�\��s����U�\�k�\�َi����=.\�gǷ�~\0\0\0\0\0�Y�\��~�\�nΟ?�+Vt~f�q�\�\�\�>ֲn�ު�6o\�*�\�Zo�Z\�Vy�\�[��\�\�.<[��J���os�\no��>\'\'��;��n�ڰcZx��\�f\�\��Xp���v�6�\�\��&v�\�a\��\�]\��&\0\0\0\0\0@�\�1\�[e\�\�o�\r6t~f+\�\��x\���-ߪ���U\�-H۶�h\�-�\�u�9��t\�R�j�n\�\��V�7Vq��y��\�\�\�8p�]\�\Z\�-�[0�ʽ\�\��S����\�\�w=��V\�\0\0\0\0 �=4\��V��\�wk�/..vAܪ\�W�\�vExkk�}m\��]E\�´�\�[���\�ǂ�UǇ\�V��\�\�ue\�`��-l\�X�x�\�6g\��#��}���ɓ\']+�]8v\��\�\�B�]\0���\0\0\0\0\0f=�zk��6m�\�6\�\�*\�\�-��Wӻ�V}\�\���VA�Vy�{��.X����\�n�z/^tm�\�\�\�o\�{c�UWWw���\nv��\��%ߟ��\�ӧ��Po���[�n��I�z\�֦\0\0\0\0\0\�z��m^{~~~\�k[M>++K555\�\�cA\�\�\�=\�¹m\�?�͓��l~�\�*\�\�\�o�\�m?\�j�V\�J�ͧ�\�m\�|w\�\"��\'֖o�\�.\�\\|\��\�\�n�\����c��\��\0\0\0\0\0F=��_Dyy����\\Uݿ\�nA\�n5g�魅\�*�VY�\�\�쳞>0o\�\�.��z�?k\�{���Nc\�m\�\��XE\�\�?\0\0\0\0\0�쉆��\�\�\�\�|\0\0\0\0\0����N�r�\0\0\0\0\��\�8w\�\�\�\�}\Z\0\0\0\0\0<���R�ݫ\0\0\0\0�`F�\�\�\�\0\0\0\0\0\��ݸv횢��}\Z\0\0\0\0\0<��)))\�\��\0\0\0\0\03B}7\�\�Ҵf͚@�\0\0\0\0\0E�\�Fzz:�\0\0\0\0��\�\�\�\�r����=Ч\0\0\0\0@��\�\�\�\�\�\�ի\�\�\�\�S\0\0\0\0�G��n\�\�\�P\�\�\�\�S\0\0\0\0�G��n(22R\r\r\r�>\0\0\0\0\0zD�\�FQQ��uuu�>\0\0\0\0\0zD�\�FYY��555�>\0\0\0\0\0zD���c\�-]�ԍ\�ӧkٲe\nWXX��\�\0\0\0\0L�~�;��>�H\�Ǐ\�ĉ\�\�ܹs]��\0\0\0\0l�~***4{�l\�\'M�\�����:y�d�O\r\0\0\0\0�껈��\�رc]�_�h��җ����\0\0\0\0\0x\0�����M�<\�U\�J�k׮@�\0\0\0\0\0\�\"\�w\�\�ޮu\�\�i	�1c�rss}J\0\0\0\0\0t�Pߍk׮i�\�\�Z�~��\0\0\0\0\0#B}7\Z\Z\Z\\뽅{\0\0\0\0\0������jmm\r�i\0\0\0\0\0\�#B=\0\0\0\0\0��\0\0\0\0�^�P\0\0\0\0@/E�\0\0\0\0��\"\�\0\0\0\0\�Km�/�mԞk9\Z{A/,=����C:u[�>m��1��;�\'o\�F^y���\0\0\0\0�@Ѕ�ҚF\�\�U�c\\�B��)\�\�P���L!ox\���\��Fx\�\��\�R���\�\Z�Z?]qX�K�s\0\0\0\0\0�XP���kw��&n\��#�\�Sc5l�ym8��C7�Y�Ĭ�5.z\���b\�^\�\�\��\��\�%�\�\�ֺ��1(R#��WMcK�\Z\0\0\0\0@\n�P\�\�\�#\���A�\�o��v�N\�^\�VE�fۼϽ�V\�}w�Yno����빕zo\�}\�H\��c���d��*\��3\0\0\0\0�LP��e\�R2 B�}s�FoOTUm�ڽ�\�\�(\�7|�F�7Z��o�u\'�i��\�\�sw���)\�?\0\0\0\0 �<\�H��\��Ͻ�%�S\\U��)�\�:�U\�S\�V\�O&os����\'\�\�\�\�\0\0\0\0$\Z\����S����^P�b>�\���\r�؟\�(\��\�-���bV 2\0\0\0\0@	h�_r\��_��C\�\�-T\�{���\�\�.\0_�\�\�y\0\0\0\0\0\'`����Y�{�V}��pE�\�r�\�\��:lm�\�J\�j\�\��0m�Z\0\0\0\0P\0C��\�|}f@��h\��x�������\�1m\�w���<��\r\0\0\0\0D\�g\�\�{s�)7o<С9؇\�\�\�TZ�~흕����UQ\�J�\0\0\0\0�i�P�R\�Q���Tˎ\�$\�?°�r��\�>ڤ\��Z�\n+�\�\0\0\0\0�D�B��.�w�~�\����r��]1��1\�\�x\�\��E�yر�j\��\�v{���|�4P?\0\0\0\0 H,\�}\�.\�\'�R����]�U�\�тos\�������\\ݬ�\�*5<b��\�kZz��7w;�\�J\�FeU��̞�<�\��5{\��\��\n\���\�Ł�\�\0\0\0\0\0A�W�z\�e\���4i��s\nUPX��˖k�\�%Z�h�\�\�_�M\�[;�/x��K�i\�z��*,�t�\����z\�\�\�;\�w�ڶ}�{nﵴ~�]Ii�\�\�Y\����FG��\�\�Sg5a\�dEF�׉�gt\�L���L�\'\�\0\0\0\0���P_\\R�w\���\\%\'g�_��ڵ{��\�?�+\�jР�޶\�\�\�\�u\�\�\�)�6m�&O��o~�[\Z:t�f̘\�^�;Q1�c]`�\0~\�\�E8pLG�\�\�\�\�4n\�D/�w\�;�\�*�vu�-.�9�m>rR��,Ӓ%az�\�W5r\�Z�x�Vyᾴ��P\0\0\0\0xbzm��\��\�L��\� }\�;\�Ѡ��\�\�\�z\�\�]�~�\�e\Z?~�y\�\�m��~�L�.$^ֲ�Z�z�.]��C�Oh��9�3gu�f�����\�+�i�\�;o�\�xc�|K�\�\�\�O\�\��WAA��\�۹��	�u\'�XQQ1�9k�^z\�\�\r0s\�\�\�\�u\�~\0\0\0\0xRzm�\�ߤ\�\�z\�wu)\�nܸ���\�ЦM[�eK��V���ks��\�|B��\�\0]��\�^\�շ�\�y�\�WTԹ\�m\�ff\�\��a#��_\�nSx\�*-_�\��mʺ��a\�Fx���c�\\�VS�\�\��\�g�x�҇��p]}4\�=�����X��\�\0\0\0\0\�kC��Zo�\�J�s\�>]�~Kk\�D�y�\�C�F���\�%5�E>f�v��\�h��%nq=Weo��=�Q�>rU��\�2�x\�\�\�.t\��vQ\�\�\�\�\�?\�/\�C/���\�ЎJ}a�\Z\Z\�u>\�fϙ�Y�\�*5-S�V�\����h�2-X��\�ظq�\�\�\�\0\0\0\0OL�\r���J]���4ꃏ�P=O�&O\�G�\�j\��oi괙n�������\�͙�r5\�mgA\�\\�t݅�̬\\͝�P;\������R?\��V����u\�\�W���V7So\����+/�̝�9t\�fΜ\�O�8ٍE�C�xI��0�ys,\��\0\0\0\0�\'�׆z�\�_����\�&\�W^us\�/z}���^K\�;ﾧKIɺ~#ͭ�o\����\�.X\�\�+v\�{!\�\�\�\�\�}@�Ƚ�\�\�\�w\�~�v�k��;w���E護\�qۆ�-\�\�Ys�\��_P\�B����o\�͞=\��m\�\�\�黶��z\���\�\�\�\�v�z\0\0\0\0��\�kC��Zo!\�*\�9w��M#F~�̬<\�.?f\�xM�>[yy�n[��x�\�\�_���\�W^�\�y�{\�.�n}g	���[\��!W��\�\�\�\�}��\�Uv�z[�\�\�\�\�\�\�҈�\�<�\r6)*j�{m�\�\0\0\0\0OR\��^\0/-�ss\�m�<�\�����ߞ\��\�m\�|Mm�\�\�nSw\��E�z�U\�\�\���\�ͽ\��\�k\�+\�\�\�\�{\�W׶�J|ӽ�\�WE�Ӛ�Qg����oǵ��m�.}\�k�-[\�\���3\�h�w\��\�7j\�\�\�nB=\0\0\0\0\�I굡ު\�\�9\Z>|��m��xos\�m���)\�5�ͷ\�gC�Ϭ\�\�n5�\�\�i��7�<\�-r\�elW���x\�ݺ\�\�_Q\�\�\r��\�\��G{m+\��s�\�\���\�b}V�>r�[�\�\�\�{H��C��\�<.�\0\0\0\0�$�\�P\�qK�f�\�\�r����|iY�\�6쵵\�\�Bw���M���[n~�ͫ�\��-�\���wKܱ�~םܒn?�\�\�.4\�qo$g�{n\��F�����%\�\0\0\0\0~�6\����x\��\�?�\�sپ�\�?\�r�\�>\�\�\���}�\�\�\�m�Z�KzB=\0\0\0\0�����#�D���\rB=\0\0\0\0�_�B�?-\�\�B�\�+���G\r\r�\���)\�2 \\I9%��\�\0\0\0\0\0A\"`��\�\"�P�\�\�-�\�?q\�J��eM��\�\�\�\�\�]�\���@�t\0\0\0\0� �P�\��/ԇ\�m�\�/y��O\�hi�.gW跆�їFoRaU}�~:\0\0\0\0@�X��M���~\��7�v���\�,$ח�\�z\'\�܅�o-ޫ���@�t\0\0\0\0� �P�WQ�\��`�~\�\�U:�Zļ���7\��\�\��ܔ�E��\�g\0\0\0\0���z34\�B^\rՋ�\�\�\�^��qX�~\�\�\\�\�[\��{D)��6�?\0\0\0\0 H4\�g�T\�#\�\�so.W\�\�L\�\�w3\�bGAy��2-ֵ\�\�\�w%�?\0\0\0\0 �4ԛ�����q\�:�J+\"\�w	�5���Ɋ�.\�\�=\�Kk��\0\0\0\0�D�C�-�\�\�	׆�_?�\�\�˹�\�\�m�Cu��-\Zh��e\rz1\�B^_�\��A\�\��\�\0\0\0\0���zSY߬�,�\�k����A��p�eת\��\��~c^\�B|��7�6˅���vmK\�\����\�-�g�\��\��g\0\0\0\0������Mcv$\�W\�^\���m�&\r�9�\�Wru3�ZE\�^\�U\�^���i\�\�\�z�K/ѢC\��\��=\n\��\�̊\�\�ܲ@�<\0\0\0\0� 4�\�\�Xj��e�n{s�B^Y��\���\�\��%/\��\��\�}r|yl�~w\�}~\�*\�oUH�e\�߻Q]WuCs�\0\0\0\0@�\n�PoZ\�\�u\����\�\�g\�\�#\�\�W\�]\���>9�\�\�+�[C\�\�Nج�\��7UT\�\�\0\0\0\0\�2\��khnU~e�2���VX\�\'GzQ�r\�jTQ\�\��n\0\0\0\0@/��\0\0\0\0\0t�P\0\0\0\0@/�@�/++SNN����u�\�]���v~VUU����O<hss�jkk�$\Z\�\�\��\�\�\0\0\0\0�nB�\�͛�|�rmڴI;w\�T}}�\Z\Z\ZT^^�U�V\�֭[���Suu��;�={��q���\�c\�\�\�cX�/,,\��\�\�u�\�I7N�8�\�\�\�\�m\�X\�ׯw\�\"\�޽{u\��<x\�=\�\�c�\\��7n\�\�իJKK\�\�ݻݰ\�\�]�v���\���\0\0\0\0x�z\���rnUy{��l�~�\�Ŋ��p\�\�\�\�]p�p\�6n\�\�.�`A>66Vqqq\�\�\�\�ѣG]���u\�V�Y����,��^\�\�\�\�̙3JHH\�\�Ç5e\�ލǾg\�̙���q�\�ʕ.\�\�y]�vM\�\�\�\�\0\0\0\0\�\�=\�7lؠ����޻s玶mۦ��\Z�m���t�h��\�\�\�.\\{\�^[��U\��ݾ}\�]80�\�ڵk]�\����\�\�oiiq\�ؾ}�}�Z�~dd�\�\�\�\�TXX�Ξ=�%K��G�\�`�O�����\0\0\0\0\0�O�V����\�ҥK]H?w��TTT䶵pm{_\0�P\�\�ݱ\�\���ҥK�={�k��\�WTT�`ox\�Vy�y�\�ֺ�`Ŋ\�-t������u\�\�!W�\�\Z\�_�����\�����\r\0\0\0\0�`���\�º��[5\�\���e\�\\\��z��[ۻ�g\�sc�ڎ\��Po�\�*�\�R�\�E\�-\�\�s\�\���v>��\�ƌ.�\�<}�\�\�g��6O\�jj\�}\�g\��>}���c\�o��\0\0\0\0\0�\��\�\�\����\nyAA��x\��w��jo\�\��۱c��9\��Po,�\�\\y�\�[\�\�\�\�[uކ\�\�\���2ov�m\n@qq��^��?w\�\\�h�\�}����\�?.B=\0\0\0\0 \�=\�m�:�C\�/))ɵ�oٲ��jo�\�»\��U\�-\��\�	��m1<ku�\�Z\�\�:\0l\�Y�f����zos\�ͩ_�z�[]߂�U�}�6�\�^[E\��\0\0\0\0\�W=\�c�\�\�Vs>\�֭s!\�\�\�\�x[\�\�\�}\��\�?\�\�m\�\Zo���9�~��\�B��[\�\�m�l��\�:u\�-\�g�\�ϙ3\�=\�E\0;�?B=\0\0\0\0��z�Po����\�\�*oϭ2nr\�v?y��\�>�Rosޭ\�\�X��-�g!\���\�\���Þ۰�\�[����o�����a\�[ȷ\0n	,���[\�\�\0\0\0\0}\�#��\�\�D\�\"o\�*\�֊os\�-�[\����Po�\�,X\�\�3v��\�\�m���&\�\r`�\��-�g}{\�?\�\�X;��M߶�\0n\�m\�1\�B�ͯߵk�;W��?.B=\0\0\0\0 \�=R��{\�\��j��.--u\�u\�\��뎭�o\��\�\�V��\�\�-\�ۣ\�\r\��>��ͯ�v}�\�m{��\�ۅ� \�u��� \�\0\0\0\0�\�#��O#B=\0\0\0\0 \�\�{@�\0\0\0\0;B}�\0\0\0\0�`G�\��\0\0\0\0\��= \�\0\0\0\0����z\0\0\0\0@�#\���P\0\0\0\0v��\�\0\0\0\0��P\�B=\0\0\0\0 \�\�{@�\0\0\0\0;B}�\0\0\0\0�`G�\��\0\0\0\0\��= \�\0\0\0\0����z\0\0\0\0@�#\��ikk\�곲�:_�����\0\0\0\0\0��\�ϖ-[4�|-Z�HS�Nռy�\�s����>=\0\0\0\0\0\�C��s\�\�)�=Z&LФI�\�\�\\վ��!Ч\0\0\0\0�}�~���4w\�\�\�P?c\�-Y�DgΜ	��\0\0\0\0�\0B}{�\�\�رc5q\�D-^�Xaaa����i\0\0\0\0�\0B}w\�\�u�\�-\�[�>>>>Ч\0\0\0\0@��]\�*�QQQ�Z?}�t\�\�\���\0\0\0\0\0\���)))n�<�\�\�\0\0\0\0��\�hjjRDD����}*\0\0\0\0\0�P߃��:����4\0\0\0\0\0\��\0\0\0\0�^�P\0\0\0\0@/E�\0\0\0\0��\"\�\0\0\0\0\�K��Pow�kikSsk\��m\�:\0\0\0\0�x�6\�߭�\�Ƅ���>w��\�\��\�c6���%o|y\\��bz�~qHs\\\���bw!\0\0\0\0��	�P��Ncv$꿌�RH��\ny5T!\�����\�so�\�{\����20B!�/S\�\�K��\�Է\�ձԂ@�\0\0\0\0� T�>&1S_�h���U\�\'\�J\�Τ\\%d�*5�Zi�5}n\\�S�\�\�Zq\"U?_yT��A�B^\�g\�Z��\�O���1\�?\r\0\0\0\0 E���\�\�\�/{!v�B��雋�z!7_u�m��k�Z��\�>:����\��#:�֬�:����\�~�\�\�\�\�\�Rfqu�&\0\0\0\0@�	�P?{�U\�?�\�J͈����vn\Z\�=��\r�v1\�\\z��d�6׹�\�\�;T\\\�\�\n\0\0\0\0D\�w\\\�\�\�\�^�_{{�V�Jw\�\�\�Oi�\�:ڽ��\�ŵ�\�;\\����\�jhn\r�O\0\0\0\0\r�\�MnU{[ n�\�.\�7A��aWr*�_m��\�a\�p.=�?\0\0\0\0 �4\�ϱ��ז\�\�\�\�Rum+���\�KUH�e����)�?\0\0\0\0 H,\�W\�5\�\'l\�\�F(�b��\�:<밋\�-���῾LQ\�\�\0\0\0\0\��\�U\�\��\�\�\�T\�V��v\�c��k\ny%T/.?��\r\0\0\0\0D\�\�\���U�G�-\�\��}�ݕ�\��w=\0\0\0\0 p��g�����6W��P����I�SҠ/�ޤ/^��\�\�@�t\0\0\0\0� �P�/���P�\�\��\�{\�\�\��\�{�s\�zۿ�\�\�`}��\�\�\�<z\Z�s~�;\�\�յm���\�wJ�\�\0\0\0\0�D�B�?N�VH�e:�\�N[Z?еum*(�t��a����F\�5-��\����\n%%%\�\�\�\�޸���:w|�媪n\��M\��_\0����\�Ƕ�m\�\�\��m�oeUS\��\�\�\�?\�;|\�f���a\�g��\���\�\�ńfﳯNߡ��a��]��\0\0\0\0$�I�ommUjj�.\\�\�Ʊ�G�?\��\�H-\�vP\�\�]\�\�s�TXT\�BmQq�\�O�\�W�Z�}���\���&MS�\�[>�]\�BsL\�v��ʫ�8i�ƍ���̻^�oTiY��L���ͱ^ЯQyE��lݡ�hᢥZ�z��M�\�va�ࡺ�tÝ\��\r\�Z�n�֭�\�\�u�k�~wq�wa`\�ԙ:}&Qy�e\n[�e˖{�+\�\���G\�\�ӎ}\�\�1\�?pL�{\�\�\��X�F�\�/r\�`c\�܅:s6��B\0�\0\0\0\0Нg\�+++�\�oj\�ĉ^`����\�\�_z[�㻯\��1���\�\�\�/��ݻxa�M\�)�\Z�\�`\�L�\�}�@;v\�q\�1\��O�\�w\r�]C�ڵ�\�\�v���݅�h/\��� �\�?@��\�_o���/^�A���\�#�G\�\�^WeU��k�����\�^���pwQ **F\�@o�K�F\�7��oߗ����\�r\"\n\n˵m\�.m߾Kۼ��\�s\�u	�.\r\�~���\�#�Y��\�\�½}�\�m;5{\�|�G�z��P\0\0\0\0��\�B��y{�8r�>�\�I:�\�N7nڢc\�\�\�vv���\�~�9�3Nc\�L\�Ν��@ܮ>��GO+ng�/^\�1\�[��zX�J\�\�n��&�\0>{\���\�ViY�&L��+Wnj\�\�������(44O\�\�|}�\�7\r\�ʕ7�\�2o,�\�~���\�\���\�m:|\�bc�t���\"\�\�\�w\�S]}Kg��1b��^KS~~����uk�^}����X�����P\�\��[	�\0\0\0\0��=�Po����J�&M���\Z5J\�?���\�_��\�\���\�z[\�cw{��\��m\�\�\�s\��\�B-Y���\�^h^��C�\�\�\���\�\'z��\�#�z�`\\SӤ�c\'�\���K7����E^з��W\��/{ނ{fV�\�%��T\�-�۹\�~��\�\�,}��?\�\"\�_���\�kʺ�\�\�d\r�\�|�mm޲\���n��\�z\r��N�8\�:\0�¿f\���\�/�)\0v�\�.����E�v-M{v\�\�\�\�\�M�\0\0\0\08\�l����\Z/4URR����4�A��?�\�s��_�+\�t.W^Ѩ#?\�ի��={�\"\"\"u\'���\�={��\�\�͊��v`޼���ކ\�W^y\�{o���\�\'\�\�\�\�յ\�i��~�w\�%5,Z\�\�K�]w��M[�\�\�E����]�_�6\�U\���J\�wDF�WMm��L��o}\�\�\�\�\�uo�����\���]p�)�\���\��\�\�\�\�	�w��\�\0\0\0\0\�3����^h���k\�رz�{\�ӟ�\��\�Qz����z\��m>�\�3\�﹪��	S\\�7�F}��W��w\�m��Х�\�Z���[\�Z�<\��;r\�\�4|�H�\�\�R\\\\�k\�ojn{\�Po\��\�.Xp�~\�N�LІ�\�:t����������\�`��Wt,�g\�RT\\���UZ�`�~��5n�Dw���<��X\�\�)\��\0\0\0\0�N\�,\�WWW{\�y�._����|\r|��R�\�\\�V.�\�ʕk\�\��[�\�h\�\��\�s�H�-Վ�\�\�ϝO\�\\���PoU���NhO��Ί�\�c����_\�\�\�\�\�w���^�>�>�\�w;:�\�gf\�\��(��ca�\n�\�\�?��Ǝ�\�}\�!wA�.X[���܊�w�J]P76��\�s\�\�\���˺p\��{��ڟp!\�]d�}/�\0\0\0\0НgZ�\�ׯ�\�y\�7���\�ן�\���ƻ\�\�\��\��5��n����^#G}\���Po�\��/]Wj\�mw���\����\�\�m޼\�W�Y�0\�ݖ\�\�c]��\�����s\���\�킃��¢*��պ���y\�\��Ϊ�\����\�\�a:�4\�\��S�vo�ٳ\�k\�\�9�\��ͭ�?u\�\�\�\�\�u�\0\0\0\0Нg\�\Z\Z�\�\�l���\�A����@�3u�\�i�-�64�+�n�[(//�\\3f\�ִi��{\���\�ٳ�\\�4i\�\'�\��\����믭[wh{\���\� w�x[a\�nU7f\�x\�\�\�\��\��{;G[-\�V\�/*�RII�;��S�{\�v+\�ݳ��\�\�ЩS	JIIם\�B\�o+\�,/\��^�\�\�\��{�\�\��?x�\�\�\�Νb7�\�W\�?p\��\0\0\0\0p�g\�\Z4l�>�\�x�Y\�^[��\0k�\�p+ϗ�ո\�x��s\���\�k��s\�\�\�r�T�\�\Z\�me{�m\�\�e\n_\�\�3���Q�=ε\�\�E_����>�\�Po\�y>\�\�S�\��\�\�nM7e\�<t\\�U�ں}��\r\�Z\�-\�ۣ��vv|�{�z��\��o�3\�]\�\���ֺ�r3S\�+5w\�BwAc֌لz\0\0\0\0@����oψ\�g^Y�\�Ʌjk��]\�\�[���ڽ�\������\�۽\�m^�\�c\�Z=��aǪ�jr-�6w\�FiY�k���]\�>�\������\�\�]�c-��+*;�q!���5\�������\�\�c��ڞw=/{\�Ρ��\�ώ]\�7�\�{~\�\�>rJG��VFz��j\�NB=\0\0\0\0�	X��\��\�\nym�\�:C�oX%\�\�\�\�?l\�\�\�\r���\�_߱��\�[\�\��\�\�>뺏�\�=�\�\�ֆuXE\�F[��\�\�;�\0\0\0\0\0\'`��\��vy�~i���\��hn&\�\0\0\0\0>�P�\���P�\�r.���MA��oןM٦�J�S��\0\0\0\0$\�_\\~ȅ��\'o��P����Q\�+k\�\�\��RJ~E�~:\0\0\0\0@�X��\�\�C5rK��������f\�RV�~s�j���M*�n\�O\0\0\0\0���\�(\��e�\���ms�\�@\�`j�����WC�\\\�>�z?\0\0\0\0\�\�-`����^�\�G���W�X\�\'[���M�� \�MY;���\r\0\0\0\0D\�\�\�\\\����\�\�\�\�\�-\�>\�ê�[.d\�#��ћTPUȟ\r\0\0\0\0$\Z\�s\�k��|�70\\+N�1���as\�sJ\���\'muU�E���\'\0\0\0\0���z~<E��\��F��\�`\�a:���f\�\�`\r_��[��́�\�\0\0\0\0\0A\"\�\��>\�\��i�:E�\�r�\�-\�:Tjآ�vq#��V\�^�O!��꿏ޤ[�U���\0\0\0\0\0A$(B}]S��;���a�\�\�+�N\�ݼ[�V+J�v����\��\�\�\��}v1\��ފ�V�9}K0n��\�ߗ\�\�\�lfQ�&\0\0\0\0@�	�Po\�ۥ���\�7ߋt�\��i\�:�_{B�\�g)\�v�r�\�UVݪ�6�\0_XѤ��\�:t#_�w]\�W�\�p8B^\�?/�Wzz\0\0\0\0���&\��\\\�.ы\�\�W\�]��WB]����g�:�\�\r}r|q\�z���k����+\�\�%.\����[y*M�-m��I\0\0\0\0\0A*\�B�O�\�\�\�LԿ,�\�v��\��\�s\��\��\�\�H�\���\�z}\�qE_\�TU\�\0\0\0\0.hC�O[{�*\�TT]��ʺ>9\�󥵍�on\r�7\0\0\0\0�	�P\0\0\0\0\0�G�\0\0\0\0��r����QmmmjooWuu�{�(���t\�\�-7���\�\�\�\��Yee�Z[?n\'���WYY\�ǰ\�\�\�\0\0\0\0��s�>::Z���.\\oܸQ���\�r\�JmٲE{�\�q��\�رCǏ\�|m�8p\��c\�ŀu\�ֹ\0/^T\\\\�v\�\�\�\���r�ݝ;wt��y�ͥK�����m۶)66V۷ow#>>^uuu�\�\0\0\0\0\0�E�U\�###u�\�]\�W�^\�\�b����y�\�\�\���\�Ν�\�\�d]�zU�f\�\�\�˗8����G��J}FF�\�׮]s!}Μ9�s�\�q\��\�8vq`�\�\�\��ܹs\nSzz�\�\�û\�\0\0\0\0\0�/\nٹs�V�Z\�*ᵵ�Z�v�\�\�\�t��a?t\�\r6t\�-l[\�޴i�V����Rhh�:Թ��\�X�B���.\����^�`���\�\��\���]��U��,Y�\'N�P\�\����_�����\'r,\0\0\0\0\0���\�n�~�\�Ų�oa|\�.,Rž�Pom�			��\�Y\�\"\�c\���-�[@�N�3gθ�n\�6rssݶ\�\�ͺr劻`|\�z;�\�ԩS\�ܻ�z\�(--}\����K�*33��\0\0\0\0\�Y	\�\�\�q\�\�ZޭBn\�Z�EO�~׮]���QRR�k��aϭb\�\�oܸ�����6{�[o\������\�綏���\�^oa��鮪o\�\"��Bo\�o��k���\�\�]��q\�~�o\�~\��\0\0\0\0\0xVB�\�\�\�\�\�\�By\r\r\rZ�f\�#/�g��)))�o\����\�ox��[з��67\�\�\�\�[8���]H8}���#oy�.\\px\�\���]v\����6�~߾}\���\�\�w�;\�����\��8�\0\0\0\0�`\�\�\�-\��ʳ\�\�\�n���nmgUr_U\�\���\�{�H`���\n��y\�\�\�\�\�\�Ը\�\'O�\�ĉ]K�͑�9����nz�0`\��XW��t��\�[���\�[�>55Յ~��\r�\0\0\0\0\�W�[\�Y\�\�Z\�\"n�\�B��R���\�n�y\�ߪ�vL\����o\�m޼�\�\Zo\���m�����z\�.:\�\\�iӦ�\�ZU\�B�M�7o��`���@�\0\0\0\0�U!V=�ʸ�\�[\�\�\�\��\�l��\�\�XV��\�\�\��xk��ʺ-:g����o���\�Bo\�����o\�dgg�9�\�Vo�y\�v\\�\�[���{[(\�Vη\��\�\�CDD�{n\��V\��!\�\0\0\0\0����[(޺u�k_���ӢE�\\~\�{�[\�]hmmu�[A\�B�d[\�\�B�}f\r��\�n�gw[�\�n�e\�Wy��|�\�\�k;G�ڷ�uؚ\0�ܺ��\��\���i\�ܹLx�z\0\0\0\0@����V5��\�m�𖖖_�\�Va�V~uuun��\�Xз\�G߰\�]��\�v~�a\���\�>\�`���b�ͽ����\0\0\0\0\�B}��P\0\0\0\0v��\�\0\0\0\0��P\�B=\0\0\0\0 \�\�{@�\0\0\0\0;B}�\0\0\0\0�`G�\��\0\0\0\0\��= \�\0\0\0\0����z\0\0\0\0@�#\���P\0\0\0\0v��\�\0\0\0\0��P\�B=\0\0\0\0 \�\�{@�\0\0\0\0;B}�\0\0\0\0�`G��\�\�\�@�\0\0\0\0\0=\"\��innVSS�JOO\�|\�\�\�\�\�\0\0\0\0\�>�z?\�\�њ9s�\�̙�)S�h֬Y���@�\0\0\0\0\0�!\��9w\�ƌ��\'jҤI�0a�-Z�U�V���1Ч\0\0\0\0�}�~���5�|\�-\�[\�~�\�\�JHH��\0\0\0\0�\0B}��\�\�رc]��@\�\�>\0\0\0\0\0��P߅͝�6mZg�߿�O	\0\0\0\0�n\�a\�Y�~ƌ*,,�\�\0\0\0\0\0\�-B}7\�\�\�܂y\�\0\0\0\0V��n\��\�###]�\0\0\0\0 X\�{`����=Ч\0\0\0\0@��\0\0\0\0\0�R�z\0\0\0\0\0z)B=\0\0\0\0\0��\0\0\0\0�^*(B}cK�j\Z�U\��\�qx�?�M-jkc�>\0\0\0\0@������*��H\�K��\�ϧn\�\�}�\���\�\���\��\�\�����1�梽\Z�3QGn橩�-P?\0\0\0\0 <�Poa~p����\�(\�\�P���T�}{�~��H��!�݌\��\�o^�_}w�B�+\�\�%\n����S{�\�w\�\0\0\0�O�g\Z\�#O�\�#ֹ0�����\���\���$\�Fn�\�6\�nY#�\�\��Ffa�\�g�*�|�\�\�pZ_��~\�\\\��\�#ʯ��?%\0\0\0\0 <�P\�\�Ҧѱ\\u\�ƿ�ҹ�b55y�I�\�\�6\��\�FFO\���Z����֎QPި�{�꿌�R\�k���i�Jɯx?\'\0\0\0\0 H<�P?q\�%���L�~p��Nvނ|C�T\����\�ȕ�\n��\�8\��x\�V\�U\�=��\0\0\0\0�z�����_ys��0h�bn� \�\��P\�WF[��Wޠ�\�\�\�5<�t�\�Z��\�\n\0\0\0\0O5\�W7\�\�c�\�?Ls�]�Z��\�h�2�ͼj���h\�ak\0\0\0\0\0���\Z\�\�Ir\�\���Gu�mnnx�p_\���t�>\�?L4a�\�j�\�O\0\0\0\0O-ԗz��\�\�b��o.\�\�˹nq�@߾<lJCUm��f\�N�*�����\�O\0\0\0\0O-\�￑\�\�\��t\�vUԴP�æ7\�-�;\�\��\�O\0\0\0\0O-\�O�\�_[���\�2��\r�[o����A��\�bTZC>\0\0\0\0�eO-\��t\�\�#��>V\�}S�\�?ol\�x�vs\�*��ޣ��o۶�~<���?�\�uO\�\�;�\��\�\�`�s\�-mЗ\�D\�7ދTja\�\��y\0\0\0\0A੅�]\�B��Kw\�\�\�s�`\�\�\�1,�ff\�G{\��\��kj[u\'�\�=VV5���\�m�_P��\�O�.�\�-љ�u\���:���\�\�\�0_XT���΋v�̬<\�շ?̋��\�yض\�\�\�\�Fs\��\�\�?�y\�\��}\�\�\\��\�ި�k\�Oު��|��i��\0\0\0\0� �\�B�?\�\�\�B��\�^\�\�U�kj[��pY\�\�\�\'�[?�\�\��MG��p\�9zZy�e.,W\�\�cU\\R���U��\�7>f\�]H�\�.<�=�Mڸq�^y\�5M�>K�\'Os�\�¶}�c��L���\�Vw\�={z\�\�\�\�z_P\�/�\�\���+�n�.^��9s\�k��%Z�h��|�{�\�;߬\���ٮ��xm۾S���Ҵi�4k\�<���8\����̻�ء�\�;��L�u\�\\\�)yZ?/\0\0\0\0 ,\�[8.(�P��\\�^�p�xÞ\��B��C�\�K�h׮�\���J���w\�}OW�����s���#>ЅW\��\�[p_�v�\"\"V�]���\�\�\�K�\�O��ͱJLL\�\�~�s�Z�N\�9w;C�U\�wx!}츉\�BCjZ�v\�9����jÆ=�\��\�z��Դۚ>c�~��j\��\�Z�^#G~�\�g���\r\���\�\�s\�|\�\'^� \�\0\0\0\0�\nh����ʅw�\�[վ��E�&M\���\�\�yCc��t�>��۷4t\�0}��\�i\�\�	\Z\�\�\�=j����Q\���c\��U\�\�_\�\�\�B���\n_\���o/��c��0\�\�v��\Z=z�\r\Z\�\�k����װ\�#u))Yaa+݅S^Q\��va\�����չ�+��u\��o�1P�^�饗�z��\�\�\�]���\�\�/ؒO�\0\0\0�O������ڮ�\�\Z}�\�W�6|���\�s\��\�\0��\�\���u\�N/P��m\�\�)r�\�\�\�/	\rs!\�.\n:\\?��O\\K{\�͌_(\�\�\�\�u	\�s)\�F����E۶]����ӧ\�\��\�\�}Gi]߉��{\�\�\�ٻw\�\�&\�d\�\�\�5\Zcz\�d7�W��D��G\�BSTP@,�(MA�J�F\�\�;\�\�\�\�\�\�f�\�}�?D�\��_�s�g\��<�����}\�\�n�U�7\�\�1\�\�n�;\n\�-}oĈѱg\��\�YV�f/�n�S\�_P�^\�_ct\��R\\~�\��\�\�ٌ��\�3E}�=_\Zo�Q�]H�\0\0\0���\Z�i�{\�qK�۲=�k֮�[n�-\rk��m�t<�L\�,�S\�C\�\�[?&\"�Ń�\�s��Fi\�\�l����c�%�\�ۛ~��:��l\�|�\�!1p\��x�֯\Z�\�O\�/���\�3g\�˖\��\�\�?�\�^�mڴ\�~>vܤ\�\�={\�\��\�\�c\�؉�tٚl��{\��~\�\�uk��o��N�\\�����\�ٿ\�k�X~�>>�Уѻw�#ޣ�\0\0\�h\'=\�7nڙ\�\�\�����A\�;\�\�?�i\\wݍѰ\�]�\�~�;w���ZO3\�\�\�w\���\�{\�}ѤI\�B\�~Wڧ�f��N\�?^\�?�\��\�`N���xe6\�ߺ�t�]���\�O���-[\�K���X�.�e�\�\�s\�\�\�a�e3\�)\�\�\����^\�f\�\�)�{�\�\�\�\�\�:�l��(Y�&ڶ\�-m��\�o\�ǟ,��:\��\�\�\�OQ\��\�\'�O���\0\0�\�:\�Q�n\r���O�2+���S\�͙����\�ԩK\�Ņ\�N1����\��i=�*���O��SD؛�6�[xiv=\�Zڞ\�߶7z\�}\�\�ٌ��y%Ѡ�]\�m�t`\�\�\�Ņ�{��\�oǍ7\�-Z<�ǼO>\�.\��\��\�/~�\�O\�m۾/����έ�g\'\�ϙ�(F����﫮�:���\�\�\��\0\0\0�[\'=\�S�^~\�ْ�;\�?�я��\�\�\�\����\�\�-|��|���|=IQ���;oI�k\�\�\'\�W\��\�\��آ\�s\�2��>x�/}�\�ƫ�F\�ԩӲ\��\�~���\�}\�\���q\�؉�q\�\�\�=L-��]��\�o�\�]�.\�\n���l�>\��\�cOF�\�k��f\'\�l�x�o�\� ��o�\0\0\0�%N�Ay[�\�^��e\�\�w\�,�\�n�����}>a\�Ԙ�\���Wf3\�)�W�\�͚=�\�?^.\�oڇ?f\���\������NQ�>-\�O��K\�\0֬\�T��\�w��\�N\�O\�O��_�hivz�w\�\�N\�7nR̜9;�u{);\�~��9Y��/\�3f̏G�>i��\��\�\�U��xEv�\�\�k�\�\�X�xE,[����#\�\0\0�K�Ԩ?<d\�\�y�\�t���\�\�W��[Z\�t ]Z\�i�\�\�v�\Z\�Æ��\�\�{ŕW^\�^w}vK�w{j|:o\�\�\�J���\�\\s]v�\�5\�\\�\���\�\��\�o\�Q�����̞�(�\�oݺ}6C�N�O��K\�?}7nr�\�:I?]�x���\�ŀt�~:�?}���z\�\�͙�8�6}��G\���_���/\�\0\08�S\"\���O�\�m޲�-\�\�\�YQ\�MY����\�U��K?O\�mݶ爥�\�f�>�f\Z)\�K7l�\�\�\�\�\��;\�*�\�W��^�r��_��?\�ؕ\�\��Ҟ��1\�\�.}\�^��lWe��&M��\�\�͉�\��\�?Q\0\0�)�U\��v1{�ώ~LU��\�>օ��ǻ}�\�=\�\�[5\�\n������8!\�\0\0\�[j,\��Ġ,\�����\�r9��W^�(�\�e�q\��/\�i\�<\�Wl��?/\0\0\0��\Z��\�<32���__��s\Z�Q}#�dX�qw�ިG�\�\�\�Ƃu[k\�\�\0\0�)�Ƣ�\���,\�\��\�QBFEy\�\�\��o\�\�\�\�36\�\�SS^\0\0\0N5�C\�\��u_ԬOl\�Q{�a��q��.�<6lN�vE���S\�k\�O\0\0�)�Ƣ~\�\�=q\�\�=\�^\�!^��Ҿ�\Z\�vVė\Z���]t������\0\0\0�\"j,ꓦ�N\�f��\��A\�m\�\�\�\�܈ʈ\�\�\��c�8��K�i���\0\0\0�]�F}\��\�q\�\�=⴫\�Gˡ�\����\�/X�=\�lT����]t\Z��&��\0\0\0�\"j4\�\'\����C��M�\�\�K�\�긟�q`T�~\�\�\�񵖯d�\"~\�fh�\�-�\�?+\0\0\0��\Z����\�>\��\�\�h3j^�\�w\�\�\';��:��\���˷\�\��]\�&.��w�\�\\v\"��\0\0\0�NH\�\�-���}&\�i\�<�]�t��\�1�xC\�;�)�\�\�iϽq\�\"������\��X�yo<<xV|�~�,\�/n\�\'\�\�r\"��\0\0\0�\"NH\�WI{�\�\��\�2�\�l�x�\�s\��y\�bު\�z\�\�c\�\�=Q��,&o���J↮��Ч\�\�Bɯ;��5[\�\�\0\0�לШO�\�7�8!�ﭝ��?\�m\�\�\�1�\�\�g\�\n\�3\�:\��\����\\��?u:�\�\����_~x@�2cy\�\����\0\0\0�\nNx\�WY�n[�=7~\�iT|�Y��P�n�Ϸw1�1��0\�W��8랞�\�V�\�\��Sb\�U����d��\0\0\08���?\�\�}�}Ͼض{��6c�\�}٩���\�\0\08\���z\0\0\0\�\��\0\0\0�S�\0\0\0rJ\�\0\0@N\�ڨ߰aC�\\��-\�߳gOTV:5\0\0����?~,Y���\�[�3&z�\�y\�\��C���-[ƚ5k\���\'N�͛7\�\�[\0\0��I�F��}�⥗^��\�\�ݻ}?}�}��w�1߱cG����z����w\�\�\�y\�����\�\�\��)\�ǎ{(\�\�\�{��\�C��\��\��\�ˏ�{\�\�k\�.�-[�n�\�\0\0\0p\�\�hԧ\�\�\�͛\�<}��\�by����\�OD�V��\�>\�lx��~��e�IcԨQ\�sS\�?�\�s�\�/d��\�#�Č3�\�\�ڵ+���裏fA��\�_\�~�s\�\�(**�m۶œO>���^QQ;v�իWW�\n\0\0\0T�\Z�����\�ӧO<8�aO1�\�CŢE���\�ݻG�=\��q\�\�eQ�\"~ݺuY����d3�)\���lĈѾ}�,�\�r�6m\�d{\�\�����޽{�i\�>]x��O+�y\�X�vm��\0\0\0@u��=����\�\"<IK\�\�\�|��\�>͜�4?\�֭[<�\�S\�ŀ4҅��)\�\�\�b;-�o۶m\�i�>�~����=�I�\��K�>���\�ׯ���\�\0\0\0P�NHԧ�$�y�.]�,E}\�֭��iL�>=3g\�\�f\�\�\�~����Oq��ڧU\0]�v\�f뫤�mԧ\��)\�7n\��7�\�\0\0�&\�xԧC�Rp�}�+V�\��K\'\�oݺ5�]O�\����ݧe�[�l\�ƀ�%�i\�}Zbx\�W\�ԧi?\���\�\�?�z�:\�uSԧ=�\��i\�}�N��~\0\0�)�ƣ>\�\�?��\���O�4)��O\�K{\�S@-]\0HR��ǥ\��4����\�g�=�,>\�{:8/=>��?\�O\�k�\�8\\z�t�ޱ\�_��)\�Ӆ\0\0\08U\�x\�\'i&��%�)�\��t�\��=�G\�\�.�V\��>\\z\���\�g頾c��w��鰽t� ]D\0\0\0�S\�	���I+R\�~A\0\0\0N5��\����e�\0\0\0p��\�P�W�\��\0\0\0p*�ǐN\�OQ_QQq�\�\n\0\0\0�-Q\�\���\0\0\0p*�ǰx�\�\�ܹ�\�~\0\0\0p\\��,X \�\0\08\��c�;wn<���\'�m\0\0\0�q��c�9sft\�\��d�\r\0\0\08.QEEEѫW���6\0\0\0\�D�1L�4)��\�{�\�\0\0\0��?�	&\���O�\�\0\0\0�\��\�0f̘<x�\�~\0\0\0p\\��F�\Z#F�8\�o\0\0\0�K\��k׮عsg6^}�\�>|x���;���\�d�=\0\0\0xQP��]ӦM�E�\�\�f͚e�?�\���v\�ړ��\0\0\0\�-D�AS�N��\�;�4i�\�w_��u\�\�ѹs\�طo\�\�~{\0\0\0�������x\�\'�q\�\�Y\�?�\�C\�\�\��\0\0\0p*��9r\�\���:t\��\�\0\0��H\����4\�G���e˖Y\�\0\0��J\��w\�\�ѨQ�쀼�7�\�\0\0\0oK\����8[��\�\0\0\0Ne��(\�\�\�ѭ[�,\�\0\0\�T&ꏡ���d�\0\0\0xG�\0\0\0rJ\�\0\0@N�z\0\0\0\�)Q������\0\0\0�\nQ½|_y\�ݵ;ʶo�[�\Ze;vĞ]�b\�}QQY��ʃC\�\0\0p2���~o!ַ�/��\�ܑcbr\��1��31챶G��BϘ6`P,�\\\�J�\�\�\rcw\�y�\n��nWQQ!\�\0\08)\�SQ_�\�{v�\��%K\�\���G�K�\r?�ɸ��\�\�3.�Fg]w��\�\��4\Z|\�\�\�K��~�4{$\���V\�Ν;cϞ=Y\��{\0\0\0N��Tԧ�޴zM��G<�_F\�B�7�\��\�\�̋�\�E_�\�\��yt��U\��ۣ�-���\�\�S?�m<�\�o\�=\�~&\��\�Q�ß�&~9zԻ\'\��slڰ!\�\�\�b�\�ݱo\�\�Cq\0\0\05\�=��vS�ųW\�\rO�d\����\�_�.W\\o�\�k\�O�s\�\�\���l\�\�صpQ�-X;\�͏-\�g\�\�^}��{�\�|/\���Q��\�D�\��W�h\�1V/�m۷ǮB\�\��\0\0\0� OA?k��x\�?�;>pv\�sΧ�\�\�7ǢWŎy�boIIT�X��VE\�ʕG�U>�/[�-�\�I�cDӇ\�\�/|3\�}�\�ly~�{�E�\�9�e˖CK�=\0\0\05�\�G��=�����~!\�ϊG���(\�\�5v̙˗g�^�F!\�\�iT|\�\�\�ű�1\��\�\�\�4\����ǝMb�\�ٱi\�fa\0\0�	Q�����<\�\Z-��q��ό��\�X2dX\�[�\�P�\�i�~�a�j��-q�|El�=\'\�\�$\�>�\��\�O\�Kw7�\��b�fa\0\0@ͫ�Q�:�����\�/�\�\�wF<���E\�\�ǜ�OK\����b\�\�Y�y\��\�\\t`��\�\��ʃ\��Px������wwܙN\�?\�x�U\�X��D\�\0\0P\�je\�\'\�7m�n�-\��\�\���g�3\��\��\�r�#f\�WĎy�ci!�G?\�*��\��h��_G�^��.��6�\�\�\"�\r��W~\�k�ϷΘ]��1\�~\�hr\�bt�>�z�\�l���������<\��%\0\0\0\�2�2\�+++\�\�]{��\��#\�\�\�:ƞ\�%G��\�\�\�M�s�Ұqv~��u?pv\���3��u:)��\'>/\�T7V�6:[��l��q\�\�\�o�4n{\�\�\�\�\�c\�\�I���4�mۖ\�\�\�l=\0\0\0խ\�E}\n\�m�\�\�K����\�\��7ƆI�,�_��\�\�W�4J\r��\��ev�}z\����-�\�\�F\�\�[�z�zN��\�/b\�K/\�\�%/T�^!�Ƿj�\��l4�\�1�s\�X�tilذ![�o�\0\0�\�V\�>\�\��{5�^�\�\�~�3_\���4����\�\�A��\�w~�\��\����f\���\�\�>�[\�x\����hz����q뿜�n�5fN�k֮\��קe�f\�\0\0�N�.\��\�\��\�\��?��\��\�\��\�bׂ��sΜc\�\�\�<�(�]yC6C����\�\�م�.��1V�|-\�\�\�;��;fω���G�3?�]�\���X�|�\�z\0\0\0jD���4�c�h�\�D��Xk�@�N�sl�:%�Lys�{��߿�=\�\���K�\�}\�\��p�\��\�\�#^~�>\�\�_�\�\�wf�\��X�xq�Y�&\�[�N\��\0\0\0T�Z��\�6v�\�\�\�_�~\��\�1�}�\�8~|�=\��3&֌~zY���\�\�\�9��\�e���ƍ-��\�(M�?rd<�ŭ��wk\�<fN�+W�<b	>\0\0\0T�Z�)�g�|=��\��\�DQ�N�f��X5dȡ1�\�s\�\�3�u��SЧq\�9�\�\�O��;���E�__�>t^t�S?�L�s,]�\�%�\0\0\0PjUԗ��Ǵ���\�%_�\���1\�鎱��(\�\��\�y_�h�\�E���W.�?l	�\�?+\�4��;�GI߾\�X��\�\�=\�~\�h�M�\�\�cIII���\�W\0\0@��UQ��yj�W�i!\��\�ObJۧbqϞ��\������1�Nݸ\�\�Oŭsԟ��7\�\�1��bQ�G�\�y\�-q\�E�?�)&�z-\�W�v\�\�رcG\�ݻW\�\0\0P-jmԷ�\�ObғmbQ׮�\��\�1�0��?�����:�c^\�α��\�\�\�\�%z\\{�[�\�ay\0\0\0T�Z�EeQ��W�S���Q�\�K\�,z\�٤��\��\�\���/���Y���-��W�C��f럿�\�h�\�\�\�\'�z]\�\0\0P#jUԧ=�sF��>��h�\�/Ƥ\�\�b�����_�Cc�3\�ƃ��z���.L|�͛�\�\����zY\���s\�ٛ\�\�\�\�c\nQ�H\�\0\0P\�jM\�\�Q�t\�\�\�v\���\�N�_=thv2��a\�b\��\�\�\�\�\���7\�Ү\�O��8p�}\��W^i��\�W�u\n�\�\�1y\�\�X�H\�\0\0P�jO\�\�\�\�\�uӦh�\�f�\����A�:,6��c\�\�\�l�Ѻ]4�\�W�\�%�\�b@Ï�{�\��X?z�\�36�\�6z\�>�\�\�A�vOG\��i�p\�B\�\0\0P\�jUԧ�\�\�*+�^\rG�Bt?�ݟEq�Wb��\�ujсQT�ޘ/]{K4��y\��\�v)\�\���\�?\�+�\r�m\��f\Z��L���\�w~��q�g������fƒ%K\�\�\0\0�jWk�>I��{�\�\\��?�Q�\�o�\�;\�̉�y�bga�ˆ�g~�����s�\��\�\�\�}\�\�h�\�_Ē��b\��\�kV�\�\�\�FG�o�({l\�kn�׆�Y�g\�ҥKc\�ƍQVV�m\0\0\0�\�P��>\�֧\�\�k\�\�ӗ�1n{\��\�\�~+��oٲ\�[R{�,\�ƞ\�\�X9rTt�\���\�싳[ԥY�4��q0�\�:�\�\�r�uQ<hH\�Y�8�U�^\�㮅c�=Ͳ[\�5<�x�\�S1qҤ�;wn�\\�26o\��v\�\�V\0\0\0@u��Q�/\�v\�1/���>�����\�\�k-�����\�+V\Z\�˗\�\�3c\�\�m�\�\�w���l�|���=/��9?��Ǿ����#�q\�\�(?\�5�Qx��Aâ\�W���\�\��\�\�\�\�\�WŴ\�ӳ��U�\�U�\0\0�\�R\�>Es:a>\�\�w��a\���\'�\�_�i��ƾ�K�rժ#��0�,Y[�M��N]b`�{�\�7D\�\��1��\�\�1�n��\�\�\�8yj6+�s+W��҉�\�_^�ݷ�\�\�_��\�t�I�&\�죖\�\�O\0\0@u�uQ��9-�O\'\�/*�\�.�\"��\�C_�v\�\�\�7ʗ-{ˌ}��r\�\�W�4v/Z�-�/[p`��\�����+���MӦG\�ko�z�v^4:��x�\�\�1\��\�1}��Xt�Vv[�l9��>�G\0\0\0��*\�\�iF<-u߲yKL6*�\�\�\�����|�{1\�cW!�ӌ�ё^�\��[G\�\�1_xnZ��n��\�z\�\�Q�#\�G�\�/�g\�\����L\��\�//<fÆ\r٩�\�B���\0\0\0T�Z�U��)�STO44�\�\�\�����]���X\�(�49[���1\��#���ϙ��\Z\��\�l\�}�3.�g\�5�Q��\�\�ɓ�e�%%%�~��ؾ}����f\�\0\0�N�.ꓪ��U\��Kq=yАx�\'�e��k��A���խgl�:-[f_Y���W�x\�\�\�U��N�\�Μ+F�}o�+�|�ٲ�{\��\\<\��\�B\�9�/>bٽ��\0\0\0ԄZ�)���\�o۾=֯[�ƿ\�\\}S\�}\�g�w~��\���\��f�D\�\�aQ:qrl�256O�[f\�Ȃ�tҔX3v|Ly�Kt��\�hzї�\�\��\��\��Kߊ=�G��I��\�ի�[إ\��ݛ�\0\0��\�ʨO�4[�n)��\�/�;/�v\��~xi\�uΧ���i�>݃��g��}\�\'\��WWƳ��:\���W��W��\��l\���\'�\��\�\�h���D��\�!�^�	\�\�GQQQ̙3\'�����M�6��^\�\0\0Pjm\�\'\�\n�\r7\��e\�b֔��\�]�\�7G�/~3\Z\���s.�;Ϻ8\�:�\�,�|^�x\�%qυ_��?�4�4l���\�N�O���1cF̟??\�C�v\�\�lɽ�\0\0\�D�\�Q��\�\�t\��\�kVǒ\�\�3cfL;.^\�\�\'^y\�\�Ѣet���\�h�}\�Ӫm\�\�%F�cG�Ǎ�)S�Č�3�\�\�\���+�U\0[�n�\�\0\0��\�G}R�\�\�\�gϞl&=ͨ���\����K�Ƣ�c\�91kƌ�1mZL�:��(*�酯gΚ�홟;w^,\\� �,Y�\���u\�\��U�\�z\0\0\0N��D\�\'��}\n\�4k_����Y��Z�*�B=\�_���KJJ�xOS��類_�fu63�b>-\�O��\�bA\�)��\0\0�\�=�I�\�\�>ͮ��O3\�)�ө�iy~\n�\�G�\�O��B>\�*/]H\�?<\�=\0\0\0\'\�{*\��)ʫ?�z�yO��H\�K?K�jV>=W\�\0\0p��\'��\�\�q�F\�_�\�\Z\�g\�1U��\0\0\0�L\�\�?��P�\0\0\0�\nQ\0\0\09%\�\0\0 �D=\0\0\0䔨\0\0���\0\0\0�S�\0\0\0rJ\�\0\0@N�z\0\0\0\�)Q\0\0\09%\�\0\0 �D=\0\0\0䔨\0\0���\0\0\0�S�\0\0\0rJ\�\0\0@N�z\0\0\0\�)Q\0\0\09%\�\0\0 �D=\0\0\0䔨\0\0���\0\0\0�S�\0\0\0rJ\�\0\0@N�z\0\0\0\�)Q\0\0\09%\�\0\0 �D=\0\0\0䔨\0\0���\0\0\0�S�\0\0\0rJ\�\0\0@N�z\0\0\0\�)Q\0\0\09%\�\0\0 �D=\0\0\0䔨\0\0���\0\0\0�S�\0\0\0rJ\�\0\0@N�z\0\0\0\�)Q\0\0\09%\�\0\0 �D=\0\0\0䔨\0\0���\0\0\0�S�\0\0\0rJ\�\0\0@N�z\0\0\0\�)Q\0\0\09%\�\0\0 �D=\0\0\0䔨\0\0���\0\0\0�S�\0\0\0rJ\�\0\0@N�z\0\0\0\�)Q\0\0\09%\�\0\0 �D=\0\0\0䔨\0\0���\0\0\0�S�\0\0\0rJ\�\0\0@N�z\0\0\0\�)Q\0\0\09%\�\0\0 �D=\0\0\0䔨\0\0���\0\0\0�S�\0\0\0rJ\�\0\0@N�z\0\0\0\�)Q\0\0\09%\�\0\0 �D=\0\0\0䔨\0\0���\0\0\0�S�\0\0\0rJ\�\0\0@N�z\0\0\0\�)Q\0\0\09%\�\0\0 �D=\0\0\0䔨\0\0���\0\0\0�S�\0\0\0rJ\�\0\0@N�z\0\0\0\�)Q\0\0\09%\�\0\0 �D=\0\0\0䔨\0\0���\0\0\0�S�\0\0\0rJ\�\0\0@N�z\0\0\0\�)Q\0\0\09%\�\0\0 �D=\0\0\0䔨\0\0���\0\0\0�S�\0\0\0rJ\�\0\0@N�z\0\0\0\�)Q\0\0\09%\�\0\0 �D=\0\0\0䔨\0\0���\0\0\0�S�\0\0\0rJ\�\0\0@N�z\0\0\0\�)Q\0\0\09%\�\0\0 �D=\0\0\0䔨\0\0���\0\0\0�S�\0\0\0rJ\�\0\0@N�z\0\0\0\�)Q\0\0\09%\�\0\0 �D=\0\0\0䔨\0\0���\0\0\0�S�\0\0\0rJ\�\0\0@N�z\0\0\0\�)Q\0\0\09%\�\0\0 �D=\0\0\0䔨\0\0���\0\0\0�S�\0\0\0rJ\�\0\0@N�z\0\0\0\�)Q\0\0\09%\�\0\0 �D=\0\0\0䔨\0\0���\0\0\0�S�\0\0\0rJ\�\0\0@N�z\0\0\0\�)Q\0\0\09%\�\0\0 �D=\0\0\0䔨\0\0���\0\0\0�S�\0\0\0rJ\�\0\0@N�z\0\0\0\�)Q\0\0\09%\�\0\0 �D=\0\0\0䔨\0\0���\0\0\0�S�\0\0\0rJ\�\0\0@N�z\0\0\0\�)Q\0\0\09%\�\0\0 �D=\0\0\0䔨\0\0���\0\0\0�S�\0\0\0rJ\�\0\0@N�z\0\0\0\�)Q\0\0\09%\�\0\0 �D=\0\0\0䔨\0\0���\0\0\0�S�\0\0\0rJ\�\0\0@N�z\0\0\0\�)Q\0\0\09%\�\0\0 �D=\0\0\0䔨\0\0���\0\0\0�S�\0\0\0rJ\�\0\0@N�z\0\0\0\�)Q\0\0\09%\�\0\0 �D=\0\0\0䔨\0\0���\0\0\0�S�\0\0\0rJ\�\0\0@N�z\0\0\0\�)Q\0\0\09��_�ܢ}r$�\0\0\0\0IEND�B`�',1,'com/maben/jbpm/helloworld/helloworld.png'),(20002,0,_binary '<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n\n<process name=\"helloworld\" xmlns=\"http://jbpm.org/4.4/jpdl\">\n    <start name=\"start1\" g=\"252,12,48,48\">\n        <transition name=\"to 提交申请\" to=\"提交申请\" g=\"-71,-17\"/>\n    </start>\n    <end name=\"end1\" g=\"252,403,48,48\"/>\n    <task name=\"提交申请\" g=\"205,92,142,72\" assignee=\"员工\">\n        <transition name=\"to 审批【部门经理】\" to=\"审批【部门经理】\" g=\"-119,-17\"/>\n    </task>\n    <task name=\"审批【部门经理】\" g=\"203,196,147,74\" assignee=\"部门经理\">\n        <transition name=\"to 审批【总经理】\" to=\"审批【总经理】\" g=\"-107,-17\"/>\n    </task>\n    <task name=\"审批【总经理】\" g=\"205,302,143,69\" assignee=\"总经理\">\n        <transition name=\"to end1\" to=\"end1\" g=\"-47,-17\"/>\n    </task>\n</process>',20001,'com/maben/jbpm/helloworld/helloworld.xml'),(20003,0,_binary '�PNG\r\n\Z\n\0\0\0\rIHDR\0\0�\0\04\0\0\0Qg0�\0\0O\�IDATx\�\�{ם��\���$\�q\�8�7h\�V��\�\�$6x;�m2v����$�\�;�c;�\�56!\�8�̝�@,b�\���ľ$��\�����:)�����m\�\�y=Ruթ\�j\�ۿ�ԩ/x\�\0\0���\0\0\0-\0�E\0\0�\0�\0\�\"\0\0Z\0@�\0\0h\0\0-\0�E\0\0�\0�\0\�\"\0\0Z\0@�\0\0h\0\0-\0�E\0\0�\0\0h\0\0-\0�E\0\0�\0�\0\�\"\0\0Z\0@�\0\0h\0\0-\0�E\0\0�\0�\0\�\"\0\0Z\0@�\0\0h\0\0-\0�E\0\0�#�g�Q�\�E@�ZD���9|\����O\�\"p�\0�8Z.\�G�0\�/�ω�@�h\�\"�\�\"�E��\�\"�E��\�\"�E��\�\"�E��\�\"�E��\�\"�E��\�\"�E��\�\"�D-����-�E��W�%E�r����S�\�\�/��\�\�\"ZD�0��,q�sSr��9ކ\\O}��j\�F$�\�\"�=�\�\��\�چ�iӼ�5�3\�7�\�]^\��y|\��K\�\"ZD�0��Œ��I�\�G\���\�4�\�ϓ+Z_\�8)����[\�.��x\�\�\"ZD�0��E\�\�ʂ\�V}\�0{_\���N�򧩮�S\�O��_5���\�,��҃\�\"Z�Ѣ\�\��UE\�M��qӓG���B\�C�\rިwͫ\�}�,\��\�ܚ�|_�\�U\��E��aT�KK���/\�7�q\��g̻8����k����\'\��\�7\�\�\�\�sJ\'\�늲X�F�h-\�`k�\��i��\�љ��\�s{�\�o����\���@\�o��ϕ̩-�:\��t�Np&x��\�� ZD�0�Z�̪�T?\�\�\�w����\�\�Z�����d�	..^TZ�f�\�\�ʂGC�uչ%\�.O\�\��f��z4\�\�\�իh-\� k�hf�\�\��i��������p�qꑪ\�=e\�ʪ�����V.))YT\�z�&\�Ѻܩu�5�\�*O�-�+.]�\�\�յcǎu\�\�-[�\�̙3h-\�\�j�\��\�$\�\�\�y\��G^��f<~v\�\�Ή�7\�T�U���ZUV�ʲE5�ת=/V��_��@y^Y(\�U\�r��\�TB�p�!N�>�\�\"����0i\�g�p��_}�\�?>\�Ӿdj\�\��ʥ�e\r�/��\\VQ\�\\Y�i儏K�~țW6nJݸ�\���\��\�\���\�����)>\�=���\�\"-z_�\��\�\�\�	k�W�?�\�\�3~x��iC݄O�������\�\�\�e5�\�\'���ZYV�_��-/�qM\��u��B��R��P\�-��J��<\�\�\�,\�ٸqcv�hg�+V��lQr\�\�\�\�\�˗�E�C�\�}qR\�\�\�\��\�?�\�k�?�\�\�O�2yM��\�%�?��Q�ϒ	��U,-VV�������ò�\n�)?�||Me^��\���Y-\�۷OI\'kZLv�h-\�\�\�b\�\�ӟ\�����\�?}>\�Kӟ:2y\�\�\�\�����\�\��\�\��8\����\��,+_VZ]U��<����Ӡ\�we9\�T�{(�S[SPR\�\nTJژ�L\�\n\�\�ŋ���{�K~\�\�Ǐ�v\�z��\�\�򧼤�#\�\��\�\�\�5Ux���\�\�\�e\�;wJ�gZAG__�����ٵlu96��\�\"a-�\���\����3\��Ϝq���7<�uR\�PɟK�>�~\�q\��~�GI\�ʖM(_^R��d*��3\��Ǌ\��\�?R�7�*\�W]\�,�fM���i�C�V8r\�\�\�8\�\�֦\�ٰaCtK�,\�E\�T��K!�^�Zo\�\�\�og�h-\�P\�\�\���㎙?�6\�g\�\�\����~�\�}\�fn�\Z�keѿz��\n>t�?���\��\��\�`�ϥ%�9�bIY���\�?J}�\�_�j`�\�1&�s׺|\�\�\�bGGǒ%K�t�~LJ�Zsچ\�?�;O�[�l1:-�EAZ�\�i?<x�?\\y\�\�k3����\'g\Z\�=\�\�{\Z\�\�Wz�ZT�_����>q{>)�~\���\�XZ\\���bCi�\�\�\�ƒ�e��~\�\�&\�}/�\�*(�,�y�\���(�S��M�6I\�&K�\�,۽{�\�s\�W�Es+V��uN�<y�\�U\�D�+K��\�iQ븵�U*\���\�r\�\n�h�\�_�/L��Q\�\��Ͽ4\�\�\�MϞ��\�\�L���S�<2�q߄\�6wіo[��\�hsۊ�m�\�m�\�\��	;廊+w�\��\��\�K�ŋ�\�WJ\ZC��\�W�\�Q;�}-j�D\'tIu��?>���m۶i�YhQ쩌L�Z���ź\�5�ݾi/]��\�\�\�g\�L�����{�Hh\���oG~\���\\ώ<\�|ߎ\�\�B���п\�\�o�y+��B[}�\r��~̿�f�{RAa(\�Z\�XI\�$MKoOtWW�ڤ��%���}�\�Qz�\�\"��{�g��s\��K\�ܽM\��7�p�\�ӓ�>Z�\�5l+�������[�\�?}\�\�?\�u\���{\�_\���1a>3�\�1㖌\�o\�_YX�Wo��\�E�X\�[^P[U\�\r���ױ�E�\�)yI56\�=\�\�J\�R�N�\�\��5ZD�0b�\��Ğ�y�S�\��̩�\';\'޿��\�S\�\��n���~���\�\��_\��\�\�o����}\�;\�x\�w��w�{\�\�߻\�\�\�Y�������\�7�.�tba0K].���k׮56�\\�������\�\�JJ69t萼�j\�*5\�(\\��h��ajQ*ѓ>lx|\�ԟ���\�g�xrҜ�U5\����s���o}y�-�ϋ_�_�\�_�o_�\�Wn�_�헷��;��\�o|�\�;��\�\�\��\�\��\���Q`܌�q�����\"\rБ�n�\�ͦ_q�\�r�#�\�Ǐ�\r�=ѢW�-�E�Z���]S�9;��\�\�|\�m%E���\��\�/n�\�\�~���|\�g�|�\�_�����+�\���\�\�1�\�o\��\�=9o\�y\�w\�\�\�Y\�y�*�\�+�\�\�tpKɩS��>kX�a\���\�\�\�\�J�vvv�dS��A�hFc�K݇S��sʏ{\�\�7\�\�5S[�c\����\���ʭ�\�v\�\�\��\�۾��۾�\�\���o\��Νy�\�u��S�3\���\�O\�O,�L,*�L\�<��\�;s\��#a��\�BR۷o\�=Η/_\�\�\�\"Z�ѭ\�?L�Ύ���{����\'j�E�_�\�-_���_�\���y\�7\��ڝ�~Ϣ;\�{̸\�\�\�\�����`΄�\�	��\�@�\�]��\��8c�\�:��\�߿_-\\�f�i\�+\�K{�\�1.OQ�{D�h�|%���\�\�S\�>釧j\�[7�xmS[��?\��\�^�\����\�\��\�7\��\�=��5\�û�?\Z[�A~\�?�\�Ϭ7�>?**-���4>о\�\\�%===:[4�*�\�\�Mc�ׯ_�\�Iڸu\�V����\�ԇcG�{D�h��\'\�\�V7�D��OWL?T\\��\�\���\�\�\�v�\�w\���]c��NN\�����\�?�|BnumnA��`0\�[�r\�HdժU�v\�:|���\����-�ѳE(]\�\�Ń\�s\�Ω���|6m\�$�H�\�	Y��-�h�|l�@\�$W��J�\�\"�\'.��H[\�\�\�\���v\�sg\�\�\��\��;�\�\�\��\�7��}L��?+�TE\�\�\������\n��Z�sZ�/:;;M\�GwX�\�d�ٳgcN6�z�j\�\�\�.v�h�G\�ihcNx�\�\"dO�ޙU�\�jO�\�V3�HIp߸\�\�}�K�\�r�G�ߵ�[9��\���\\ׯ��OU�o�˭�+�MtUy�|��M-J2\�\�ڪ\�\\6�Ή�\\�A�&OiI\��---\�{�%��z�\�g�1\�]�$tv�h�G��\�q\�\�	��!\�Z�U\�{�.��i۪����\�c��ɭ��\���\�9��\�W�\\i\��*\n\Z+*�\\�*�����<�\�\�AtWWWGG���\�\�ze�\�J}Vrɓ\'O\Z\��z���fR�=v옱�-r��ś\�N\�\"\�y *Z�!�E_X��*�PW��lRg�����p\�\�\�ݙ��\���\��r\'\�\�Թ�+�Ūk�$��f3\�=R-�E\�f��J�\����+\��<?\��qc\�\�/ͫp͜��/,�-�e\�!A��ap�\\��\�M\n�\nl(�nS��{\�ߗ��ʿ?\�\ZrUT�\'��E��a\�k\�SRR4�\���z\�k��\�\��\�cr�ɗ�Ȥ��S\n�\�ܞP��<�\�	�E���-��&V<0%\��\�\�y��\���3�UW\�.�q{���\�=�\�qF�h-\�\�\�%���ܲ�܊�\�\�\���I��*OɄp\�Jx��AyGH-�EL-jr}\r9\�\�E\��ݍ\�\�AGH-�E�J��	�E�h-�E�h-�E�h-�E�h-�E�h-�E�h-�E�h-�E�h�\�\�\"p�\0�8Z.\�G��E|\�h�S0�.b���h\�\"�\�\"�%/F��\0h\0-Z@��\�\"�E\0�h\0-Z@��\�\"�E\0�h\0-Z@��\�\"�E\0�h\0-Z@��\�\"\0Z��-�E@�\0h\�\"\0Z��-�E@�\0h\�\"\0Z��-�E@�\0h\�\"\0Z��-�E@�\0h\�\"\0Z��-�E@�\0h\�\"\0Z@��\�\"�E\0�h\0-Z@��\�\"�E��PbЋ���\�jv\nA��!	�}�2���:\��e�E@������\�\�h\�\"dC��\'h\�zr���\�\�\"�E\��+\�~�\�\�Ji\�bR%жh-:ע�\Zt��67Iq�6�B��G�\�]�\�\�ĺvl\�qvƦ\�\�\�~\�:�\�b��<+\���\�\�\"m��1�]=%[\�#\�\�ž1\�$��#\�C�hqti1�z\�޼\�:�-\�\�+��K�E@��B�IuΤR�n��phR]46ߗ��\Z�h-&\�b�,\�k\�޻d%\�a\�Z�\����E@���a\�~g�%5(���{K\�-BJZ�\�\r�T록\�3C#��E@��W�ɺ,E-:s���:i�-��q�v4a߳){\��-1i�7-Z\�Zt���2�ź11-C\�m\�\�qZ�82͘\�\r\'6�\�MӍ\�\��V-		\�{�E@�����u�8h3M80-ZHh\�\"\0Z��-�E@�\0h\�\"\0Z��-�E@�\0h\�\"\0Z��-�E@�\0h\�\"\0Z��-r\n\0-�E�\�C��l�\�B�\�\"��\�r�\�,\�D@�0Z\�h�]��b��a�kQ+/�w�hF�g\�\"`F�h\�\"N��-ZHN��%@��\�\"�E@�h\�\"�-r~\0-fD��-\�D@�\0v\�\�i�h\'Z@��옑h\�\"N�ǌ�\n@�\0\�\"\�\�\"�Mf\�$\0Z@��G\�D�+-�E�@�hqdi��\0�G�E\����B��?1���b\�?\n-\�h�\'��\�z�E��\�\"�\�\"ZD�ZD�h-h-�E�H�E��\�\"�\�\"�E-�E@�ZD��	��-�E��!\�Z�d\�؜\�I�E�d�h-�El-�ʪ�uӊ)n�S\�4��q��t�\�\\���uӥp��\�\"3-�\�\�R�\�\�\���_��z��(>\�\���\�\�.3�E��a�iQ\�:QX\�{���Խ\�\\�\�\�0\�\���憅�R`\�\���p��\�\"7-6͑<1\�\�_~\Zz\�\�гo�\�z\�m\'ȆϾY�»��\"f�yu��\�\"Z�a�Œ�\�Rw�O�X�\�\�%\�+��{�3�p�l(��>�t\��w$y�:uqc��\�\�\�s\�̙˗/g\�.\\8r\�\�����]��\�b�_����ҥK:�\'Oʑ����E��-*ѳ�\� �_I�Dj�I3��g7<\�\0\�P6�B�~�_Y�\�l�رcK#!���gϞ���m۶�8p �\�:u\�*���+\�\r׮]{\�С�k.[�L\�\�\�\�@�h-Zf��Չ\�%\�\�\r\'6\�qBČRHճo\��\�n\�Z�\�k��سg�����677\�Vk֬t-Jƺr\�J�\�]���\�\�νQ�Vۺuk�K\�ΝC�h-\Z��,�\�\�RVNW��G�Q\n	\�{[\�OIB��O�>��^�zm�p�E�;v8\�\�2�-\��˗/W\�nٲE*\�P�5�\�\�ݍ\�\"Z]Z<q\�ḒT�eҢ�]+-CkH~�^Ә�eH�\�m���\�(	\���P+�_�>�%\�;ZD�hqti���\�T�X�bE�\�\�ږ�)\�8ƒ�R�<~�M��o\�<\�\�\�\�\�J�*a���1\�ѧ��E��G�w\�\�\�	%8	�E��Z�k״�j[\�\�MSHQ1SBg�r:k3nܸ�\�ի�kh\�͡3\\\�r�E�\�\"Z	Z\�u\�\�r\�J\Z\�<(B�\�\�\�\�\�.)��`��,{\�9d�zID\�%k-J\\�|Yڼy�M\�jw�E��G����vGB\�|\��Ę-&ն\�&�j��+�?^\��$j-�FY�-\�G	�hJ\�\��\�aM\��HO��\�\�\�j[<+�Ѭ�(�R#�$%4U�UH9�\n/٫�\�fA���M7\��\�\�հ\��B\"�\�\�\��h-�\�ѥE\�\����\�(E	�!\�===�/xݺu.\\Ȃ�߈��pn?\�\�-�E�8*��l�0bv\�^�~]*\�Z�w��V�6c\�{��bv7kC�B\�\�Zlmm\�<K�,\�Zܷo߆$C2M��\�\�H֢�u)ޙ\�\�\�\'�\�Nܻwo{$,z~$��q\�F��l~\�ʕxZL{O�1[d��h�&-��K��$CKG\�j\�#%��n\�\�N�<��Z\�W\'I�\�E����E�l\�͡oΓ5\�KIiQ\�\�6B�-�E�8�x\�\�	Q�iu���n\�ӆe���\�IՒ5k֘L\'ug\�Pѱ��\����W����e�\':zwZ�\�\�\�҂\�\"ZQZܾ}���b\�ڵbqӖX�}��q�={�l۶\�ا�s\�N�\�;L\r|э�\"S9*Ӛ��E��\�8�\�\�F�h-�4-\�L�i��¤��\"�\�u�\�Z\��~�z\��1�M̾%�=\'\�HO��\�\�HӢ\\ے����:t(\�8Z\r�kQIV՗�,Yb��k\�ʕ��m�.�\�\�\�\�f>\�6jZ�;��D�E@��\�Q7�{t7���\�g�ٜ\�ZKJ[,f?���\����.N�7�\�\"Z]ZT͎7n�����\'\�%��\�B�;w\�\�s\���\��M/\�fM;Z\�\�\�ʾX^iQ\�@�Mv\�ލ\�\"Z]Z������\'Z\'P[o�\'��n�6��H\�%~��ob\�T\�-ܭ�}\�\�6\"k\�\�o@�\ZH�\�\"Z��ő�\���\�i5�&��^��E�z\��\�f\�\�\�ݭ:\�\�kQ�\\��I��,Yr�\�A\�\�\"Z폸2iQ,�\Z�jDS�hQ�����OMң$%\��Gم\�\�٣S��[ޗ��O�9Ww�\�lq�PZG�h-��Őd�o4W��n\�\�iy \�S�\�.0\�h�Q�:��?E\�`TeSTb��^�~ݤ��g\�J\�X�����jL,����Fi\�^Z[[:d1�Nz��}�v�\�Ç�\\,\�\�\�h-�ś�Ŧ9\�~߰����OBϿ#��T�C�\�v�l(��k_�K\�{��,.nz4Z\�\�\�\\�~�$>z���N+Rw�\�۷\�h.�P\�\� \�[�r���O\��g�lZ̠#\�-[�;�%\�̂\�<�b@c�L<-\�\�	�\�]�-�E�h�D?R�\��ZŌR�j\�4;\"��\�\�İ_^(�gA�ڀ�\Z��\'��zΧ��,��@M�f�Q�m\�&�\�)�u\\�tI�PѴ\�<;���\Z�|�\�N\�Ӣi\�1Ɉ\�\"ZD�#X7�|\�\�\�\�׼��z��\�W\"\���	z\��ŉs_\r\�Mς���tתdy�ޒ�;wZ�\\�p���GL$U\�#G���������b�͛7Kb�TE\�X!J	��-B��\���\�3-OX=p\��\�ի�\�u=zT\�Y+�7���E���}eUbFI\�\�]ɍs�A�yT\n\'J\�\�l[$R��\�\�I�E�\�\�b�$K\�\�tGH\n-�E [D�h-ZD�h-ZD�h-ZD�h-ZD�h-ZD�h-ZD�h-ZD�h\�\"ZD�h\�\"ZD�h-�E��Z\���(�\�?1\0�Qh�b\0��\�\��\'&��WZD��\�\"�2^�\�\�\"\0Z��-�E@�\0h\�\"\0Z��-�E@�\0h\�\"\0Z��-�E@�\0h\�\"\0Z��-�E\0�h\0-Z@��\�\"�E\0�h-Z@��\�\"�E\0�h\0-Z@��\�\"�E\0�h\0-Z@��\�\"�E\0�h\0-Z@��\�\"�E\0��-�E@�\0h\�\"\0Z��-�E@���\�p��iC�\�X�l\�\���T,�G��-]-Fo�^-\�1\�\�DB�[�\�m��\�Sw\"Z��j&\�@\�\�H�S?\�x6OvC\�mS<\�%�E@�\�L�i�\�b\�:�3-\�yG\�p\�ӈ-���묙\�:QJ6KJ���;\�qֆ�yx	\�fq\�6ac6>�E@���E��\�Ե\�\��\�Wck1ٓc�բ��4h�E@�{f���$\�<�TU4�Z�p���RѢ}\'&�-&�E\�\0Z��E\�&J]�I�\�fY�)��\'<�\��\�$�ΣE@�i��Ƽ\\�j^��<:\�b�_\0)veN�vD����h1i-f�\�4)g��Ł�;.\�\���\�?Ɏ\nB���Ӣ�Ι\�3�lj\�Y��������\�%��a-Z�Z��U��\�x\�b���\�^O�1�\�D�#�\�%���͛\�\�\�`�\��[�I\�f�ʈEg\��\�:Z��A-f�ںΘ���#S1u��ޥ��\"\�\�\�h\�br�b\��\�}\�L�v\\��s#]�-6\�\rS��2�wC�EE\��j\�\�\\7t���T�o��[���\';\�\�A	h\�b} �;\�\�MvƠ8\�{q\�ՓԔ�OK�鞃R�p\"Z�Q\���16\�\�l���&\�\�ޏl��g6K�%7-\�\�\"�|-Jۥ}-��\�$5\�\�k{6��\�x��\��t\�/�-fC�\�l(H\�\\A\��@��2Z��-�E@�\0h\�\"\0Z��-�E@�\0h\�\"\0Z��-�E@�\0h\�\"\0Z��-�E@��F\�C��l�\�B�\�\"��\�r�\�,\�D@�0Z\�h�]��b��a�kQ+/�w�hF�g\�\"`F�h\�\"N��-ZHN��%@��\�\"�E@�h\�\"�-r~\0-fD��-\�D@�\0v\�\�i�h\'Z@��옑h\�\"N�ǌ�\n@�\0\�\"\�\�\"�Mf\�$\0Z@��\�\�3A�@�h� �8\�Z��\0��\�\"\0W(ZD�\0\\�h-p��\�Ѯ\�\�	b�ZD�h� \�\"ZD��\�\"Z$��\�\"A�E��	-�E�Hh-�E�@�h-ZD�h� \�\"Z�A�$K\�\�tG\\TZD�d�h�@�hq��\�+�\n\�M+n|��iNI\�\�\�\�\��\�1js)J\n\�M�\�\�\"�\�\�0Ӣ8�|\�+\�/-�^���\��\��R\����\\�{)�|\�1#Z$\�\"ZfZ��N\��^k\�\�-uo4\����.\�2GD6��aa�z�})-h-7-6͑<1\�\�_~\Zz\�\�гo�\�z\�m\'ȆϾY�»��\"f�yu��	����K�fK\�YR<qb\�CO�L�\��\�\�|\���l^��ӡ\�ߑ\�Q\�\�ō��\�k׮;vl߾}G�u���+W�9bg\�3��p\�B\Z/��\��<\���w9ڎ��t��K�8\�\�ח\�7u��垞��i����\�<\�-��J�\�\��H\�W=�ZpҌ\�\�\�\r;@6�ͥ����&�\�W\r�l�\�ŋ˗/_�t\�\r��I�]�l�^\�\�յ<&.��H$�W\���\�ƊxZܶm�Z���7\�7\�\�8!��^�ܹs\�\�mܸ1�o���}ɒ%\�֭�y�\�\n�tz\��sTwt\��GY�8Q�hq\�[�\�\�pb\�\'D\�(�T=�fmv�x������y�f�\�-ٜ\�j���v�x\�\�!U\�`iqӦM�\�?u\�Zg\�޽ѯ\�¥�#fJ(�R�\Z\�%�\�:!\�1r\�ڵR\�ʕ+�^���i��\�T\�\�Ç�ǉ\�ǏK��\�^l߾=\�[F�hqY蹷�\"���J\'�2��������fM�r�-M9֬Y3��(v�\�\��\n�옪{j���\�r�\\\�ٳ\�\�\�\�\�\�d_+V�P�={��uk��ϓ\'O�Ww\�ڕ0G3���իW\�[s\�Ν:qNV����rd����ե;\Z�h���\�\�\�۽{�Ң�����w-W�Z\�:::Lj�%�-\�B�\�Vr>��yOO\��8!��\'�\r6��������H^�v$�酁ظq�*G/Qy�I�z�h-{-\�\�\�(\�\�ڢ��\Z\�\�\�V���S\�}��E�K�j�\'N�Xm/\�eJ��Y^\�\�B��ɶ[�n\�\nnmm�0]t�2�W\�\�[�l�\�9�SB�[���uΟ?o�\�\���Ec;i<-J��\�ZD�\�^�1\�T�hU$\�j���\\&-\�\�r�\r�EU�z\�娺���;\�7m\�$9��E��֢�����Z!嬪?\�\�rrĒ\�T�(%�\�I��z�%/�\�+G\�ַ\�hڵh\�5ZD�#S�\�ΝS�\��:����ަ\�Sr����\�L�lj1\��\�؉aꘖ3S��3J�3f\�\�b�S�\�,S������.\'P�I>�uZ�=\�\�Uy��VW\�$S�r�\�\"Z\�Z�b�$����\�\n\�?+\�\�\\���G�ɭ�yVw$�՟�UYkQ.Q�\�%3M\�d�(��t\�\�(\"S�*++\r��\��\���V.K\�=fA���N���v$�T_f��E��Q�W!��~��3-:\�r\��}����M�!Ɇ�e\�f�\�ʁP�\�\�\�e/&�\�d��cn�Dl�z�\�\�\'K�,Y�+\�&-j��*mF�(\�L\�\�\� 99���R\�Բ!\�\"\�\�\n$I7~i%�-��*ָD�\�@\"��\�bZ4�1�)5���Ŷ�6�5�\�=�Pu1�g�\�51kЙТڗ�̳g\�\��\�J�\�FI3\�u�d�mQb\�֭h-�-Jnr\�zK{{���Cut:Ӣ\�\n���\�\r6>|8].���=k\"�\Z\�\�P�Sw\�ʑ���lԢG2�xRH��UZ��\�\�XH\���{�\����\��\�R��\�z�PK$�\0����w���\�t\�\"Z�Z4�\�[t���ʙ�\��C)^\��%�U\��\Z��i��\�\�r&E�\�\�\�ned�ub\Z$(	ct}Y6\�CS�M�7\�\��b\�Z4��\�\"Z��EI9\�,r\��c�,�\�v{\�\�\�i�D�;T�Ktwy&�\\�PD�؊�U��$��\�\�&rSH\�KjC=�RT�+�v=1�Z\�\�߯�\�\�a\�F�K\�iQN8ZD��-�\���\�\�$U,-:�\�%^ۢ�E\�4x0sZTc�L#%O�<��YG___\�23\�m,-�E�x#\ZS5\�\�\\��EU\�9�\�D�n��\�\�k\�T\nf�\�3�Ec���ԩ%�\�b/$C��EIB�\��\�,�i��\�\�\�!�h-{-\�\�v\��\�E��S7G�.q�I�z\�`i1^R�GeZ�:�h-\�q<��\"2�E=FG�\�\�\�!�S}/�\�\�X\�\�bj1ޠw���\�\�-�E\�oxA.WIj\�p\�\�\�o>1�\�e�\"�\�]D\'\�Z�o�\�iiT���v��\�\�,�\�1o\�̐�3��E���bO�Ig\�Z�9�BB-J(a\0�]�\�\�R��Z�|\�\�\0F\�\�\�\�NkQ*\�\�M\�V\�O�dW\�zT�iy̑��\�<-ZD���mQ�ɐ%Ӕ�3��\�=\�1\��HQ���\�@i\�\�K�$�����,\�J�hgZ\�\�Ӱ`1��\�\�\�\�?�H�K���&;He\��\�\�\�ӢE5=�z\�nE5\�O3\�mq����]Iv�(o|߾}r��w��\�\�\�\�޽Q�E�d=h-�Ђa�\����\�z\"U��C��gH��1+�ItLZ�9Q�-���EO�k��!\�ZTw�X<c\'�\�hՠKc�\\;^�r�m����\�\"��\Z���:|��j*2ͯeѶ\�\�\�&F�7#YB-JV\"Ɏ�1Z�*�1ͧ��c\����(\Z:\Z�*\�zq�\�4l0CZq\�\�0N� j�y~\�d�\�\�\�OI9\�<�оM���\�ј-�$[|����wKN\�Q�\n=��p�Y�Dǋ��-Z��Q�z8���N�mI^\�\�j�.�S\�#\�\�ٙF-F\�V\�蜍�\��#-Zԭr\�o1�\��r\�v��\'OF?�@u�\�&\�/\�ʾ\�(\�S\�Ο?\�+T(%\�|՘,G\�B��,[l�S�\��\r[k_�$��;�\�I84\�mȆ��8����4���z�\�\�G��%%ܴi�\�\�\�l�a\�t��1%�x񢺒UÿQ֣F�բ�52�\�ӥE\�\r%\�ӣ%��Y�!�y�\�-\��7�؉����:h_\�\��\�-�\�J�#\�/-lx�U\�(5_�6L�#K�(Nk�\�R�0բ\�\�\�O��G���2\���\��\�a1g.H�O�r\0\�:�֢\�\�5�\�jς�	t*m|u\�Νmmm\�\�\�چ\�S�*��7�]Ǚ3g$_�d(-\�|\�ZuZ\�M/�� ���5�.�������?p�\�v�bqb\�\�WuӇ����28�S~���n���6�\�{WD1\"���E\�V\�\�\�sS���\�Ձ�\�\n9*\�Nդ�1\�Y\�K�\�y�\�A���. I�[ZZLj����?O�(_?\��!\�1O8Z]Z��U�%�w%7\�q\�m\�Q)P�(�-\�`Z�Z\�pQh-fW���,�\�qQh-�-�E-�E��	��\�\"Z$\�\"ZD�h�@�h-�E-�E��	-�E�Hh-�E�@�h-ZD�h� \�\"Z�z��E\0\�\nE�h�+-�E\0�P����1�-�E� \�\"@�x1�@�\0h\�\"\0Z��-�E@�\0h\�\"\0Z��-�E@�\0h\�\"\0Z��-�E@�\0h\�\"\0Z��\�\"�E\0�h\0-Z@��\�\"�E�h\0-Z@��\�\"�E\0�h\0-Z@��\�\"�E\0�h\0-Z@��\�\"�E\0�h\0-Z@��\�\"\0Z��-�E@�\0h\�\"\0Z��-\��\Z+�6�_�E\�ƈ�����ʁe轠E@�#P�\��W�6զM*�\�jK�\�Z�8�\�\�R�_<dS�v\�c_�)�(�\�\"�\�Q�EgY�\':۩��JV�	OZ�8Tj�6K��gVZ|\�X\�\�\�6�\�Ԣ-Z�ZL��ti\��1�ŉ\�o\�A<�FI�hq�{3��\�;VL<\�$UB�ZL\�����l����h1Ztl�Ե�T\�`i1�nb�ぬ\�\"�\���A[_\�I5/ZřS�p6\�\�qWr\�H��-Z̪\�ڜ\�#)g��%�\��@K�����\�\�\"�\��\�b*#Q��\�-��1T�i}\�jXD��G�mn��l\�ٝ|i��b[g*C\�\"�Ŕ\�\�ؼ��g\���\��[l�#\�tՂSl\�D��_�\�솶�o��*\�SaR-�v\�NZ�M�hqi1�T1�q\�vF�8\�b�	�G���~dz\�F����\�тi\�Κm\�\�Y��}-�ذ�-fC�^�\��\�o�sv���;Z\�ܨ\Zǟ\�X�T�\�\"�E�\�n�\\{\�6Gگf��E�c��\�ԇ=\�?�hq��]\�\�b\�)�u֖\� !���dB�\�4\�ȍ--f��`ЏgH��h\0-Z@��\�\"�E\0�h\0-Z@��\�\"�E\0�h\0-Z@��\�\"�E\0�h\0-Z@��9�\�\"W��E@�\0�\�h�E�	hF~e9Zsq\"�E-f4�.Z1W@�0µ���;N��T�	�3h0#Z�h\'Z̈-$�E\��E��h\�\"�E�h��9?�3�E@��q\"�E\0;f\�\0Z��-�E@�\0v\�\�	�h\'Z�cFN�E��i��\0h\�&3r\0-�E@�Y\�� \�\Zh-�G�9\0�\�jB�h��	-�E\0�&����\�\"Z�\�\��\�@�h-ZD�h� \�\"ZD��\�\"Z$�h� \�\"�E�@�h-ZD�h� \�\"ZD�h�@�hq��,\�ұ9\�*�\�\"\�\"Z$\�\"Zl-�ʪ�uӊ)n�S\�4��q��t�\�\\���uӥp�H�E�8̴(N,��J�K�,�~��\��¢� $?�^\n,��@̈	����%��5�\�ڸpK\�͵�n��\��\�\�hnX\�*�^~_\nG�ZD�\�M�Ms$O;񗟆^x7�웡yo��{\�	�\�oV��n\�럈k^],��E-�\�a�Œ�\�Rw�O�X�\�\�%\�+��{�3�p�l(��>�t\��w$y�:uq\�\�k�ڵkǎ۷o\�ѣGl~\�ʕ#G�\�\��L$.\\��\��\���;b�,��ɥK�:::,ʔ�����\�\�\�9�˗/���M�ɻ�yrd9Z�+ѳ�\� �_I�Dj�I3��g7<\�\0\�P6�B�~�_Y4�ŋ/._�|\�ҥ6lp&&\�vٲezIWW\��H��4H㕿~����\"�O�:�\�\�\�ݻc�p���իW\�\n�����\0\�\�ۗ,Y�nݺ\�\�\�\�	N\�d��0�s�\�D��4�)g��Չ\�%\�\�\r\'6\�qBČRHճo\�fW����ŏ͛7�F�9�\����\�h�СC���\�\�M�\�/�ӛH�Ss\�Uɪ\��ڵke\�+W^�zU+4\'\nq���Ç\�Ǐ��Yj/�o\�n,VNZ\�}�\�\�\�soKEX91\\�NeF)$4\�mI?%	͚\�]�r�Y�f\�kQ��\�g�Ylr\�\�9�0�Z�\�t��\�^�Nuc\�ɓ\'\�Nw\�ڕ0G3��(��ƌ�;wn۶͙\�\�L�#�h\�+V�%Z4\Z*^\�J\�WV޲e�q�8Eb��M\�J޻1�\�\�\�9\'Dp�ĴaÆ�\��_Ԓ�{��Ifza 6nܨ\�\�KT\�jҢ�\�)Z�C��w\�\�smmm\�Z�	1�R��Sꒃ�E��Ƭ\�8r\�ȡ�Pٙ\�F/mɻP5\�C�H\�&kr�E\�N	�^l\�O�\�1��(-�[�N/QZ���\�|�%wV\�-Z��E\�;b�*\�[	G\�T\ZeԢ6fF)�\� jq\�֭+;ˑ\�&i�ZA�ҪG^�\'N\�[_\�ַ\�hڵh\�5Z�hW�\�ΝSLWW�M-\�\���\�k׮\��\�\�\�b3ղ�\�x\�o\�\�2a�E\�\n��_έZ���;z���CI�iQ��\�ȩ�%�S/Q\�\�1�(�-Z�qattt����ǊS�N�F։�BOO�\�DgΜ1B쎄���S��\�Z�\�^\"��M�\�ע�\�ҥK	�h�\�P\�)櫪�N\�\�j\\�T�\���l\�ckTf�Bg=\�\�B��\\t}-Z�\�\�\�\")���q�z/+B$�+*ٳg��\�\�k1ZIҢ�(��9����\�%KL�b�\�1\0�P�`�\�[Bk\\�\�b Z�8\�Z4�\���\�_�B�\�b[[[v�(^�y��\�%Ϟ=�\\�b�\�͒q\�Q\�\�x����E��[��E@�VZ�|\�!$\�Q\�\�\�\�\�\��\�ց���{ ��6l\�p��\�Lt�\�Ec�V\'�b:Q��*���:\��\�ݫ.��k׮�\�-�\�tZB|���\�t\�\"�\�Z4��[t��Y�Ʊ�\��C\�t\0�\�y��P�\�9}���kџd�\�\�\�j�R�i��$�\��e\�P#\�7\\\�\�E�|���Ec�h\�b��()�dI\"��\�b\�;@G\rET=S���$a�tO\�Ɩ-[,����Ԇz�vW$�\�zbX����_\�\��\Z�\�Ӣ��h1m�ׯ_߳g�qMIK�	k\�iע�+\�8<�\�ɓ�5��\����bp&z��ŢE@��\�b{{�И���d:;;K��&\�1\�^�%���P��N-\�\�{!�M-Jj:0Ue�nZ�\�7�\�8�-Z�q%\�|\��\�e\�޽�n�x].\�D�:\�\��ض/QJ\�J���=\�\�`b��\�\�1:����q�\�{�?EL6�lb\�~S�\�ݶh:�E��3ն(H���s�.��\�>,\�w�I~��7+\�]u\rG\�o��DϦ#\�\"\�\�ҨOI\�x�͡;XL\�c\�j�!-\ZgC��GKO�\�k\��#�\�Ԁ%5\�ݡ[\�L��ԈcVϣ\�\"Ĺ����1��0Jޝ\�� ���7e[I?\�SXus\�QA�\�---w�E@�ih[T�O2�E\�4\�w<�~�=\��\�QR\���I�\" ]#�\�V ��H.]�$kJi�2��\�\�\�L�\�}�\�L\�}D�O�\�\�?@�C\�.��ZTI���`B-���G��[N;;;cj�s\�t8\�1/�~\�e\�o���!��ubv�\�Ѣ�o߾}rB�w�+S���\�\n=0(�%\�A�hxhAl-�9\��\�\���\�IȐUY*�蘴s�\\լ&�M��Ek�\�ŋ��\�\���\��>љN\�V���\�A�r~,���P�ׯ_�\�3\�\�峈׭�lۢi\�o�<\�ꦞ\���<��m���M\\cq��%ӑJM��E�ٙOۦ�\��\�\�0\�7Z��P_j\�~;�VQI$�\����e\�\�\����澾��oܾM���EHO��l�\�\�\�-}8-D}*��\�\�f�/ηh��fԢ\"��T_HBd|t���\�\�u۴hє�\�\����(-\�\�6yPU\�[\�{\'��\�!�Qu;�XxwT�n+\�$�%\�}��\��?�#V�PJ���q\�\�ThR\��\�T/�}\�\�\�\�\�?	=��$zR\�{\���l.N�}\�/\r\�m�^���\�\�a�Eq�hER0%\�\�? \�7I-U\�AUH�Z��Df�Z\�\�*��M�t\�J9\�\�7��iO\�a�\�߯�g��X\�\�%�\��k\�\�$v\"a�n\�L*tm@7��EHo%��\�6�\�*f���P�\�\�\�%O\'����B)|�j\�t�\�\��r1�\\󲚞=,\�l�Ԡ\�iQ�Xݷo�\��d9*\�\�M��T�\�\�ڤ�\�\�(%�J&A?s\�\�\�˒�Ř��C��-릗\�]z���WW\�_T�J��8Ao�`�8�b�\�CA���\���_����\"!钤H\�\��{J\�0\�ԲU{{�\�0���1�hqI�P�%!)��\�X!\��\��\��]�\�EH����U�%�w%7\�q\�m\�Q)P�(�-ZD�#.T-�\�\�j1X��cs�#.T-�E�E�H�E��\�\"�\�\"ZD�ZD�h-h-�E�H�E��\�\"�\�\"ZD�ZD�h-h-�E�H�E��\�\"�\�\"Z\0�\�	\0h�\0\�\"$\0�\�Q�A��@�h� ��u^�\�\�\"\0Z��-�E@�\0h\�\"\0Z��-�E@�\0h\�\"\0Z��-�E@�\0h\�\"\0Z��-�E\0�h\0-Z@��\�\"�E\0�h-Z@��\�\"�E\0�h\0-Z@��\�\"�E\0�h\0-Z@��\�\"�E\0�h\0-Z@��\�\"�E\0��-�E@�\0h\�\"\0Z��-�E@�\0h\�\"���Ł@�����C�E@�0�����@��a0k�h\�\"�\��?Θ��-B�ES+�s1��,�es̈́\�`\��\�\"�EHU�����j�\�;Z�C�o׎M\�8\�b�{G��!�ZL�\�\�o��N֬m\�-Z�,i1)�ج�&TgR�F��axk\�NF��T-Z��4,&u\'�=\�QZ�\�L���LXr�\Z\�\"�EH��\�N�\�2:-Z\'\���tֶhS�iV�-BJ��8ȝ\��pgZtvZ�\�h�%gus���E@�\0h\�\"\0Z��-�E@�\0h\�\"\0Z��-�E@�\0h\�\"\0Z��-�E@�\0h\�\"\0Z�\�)\0��-�E@�\0hF��\�\"�E\0[f�\�\"\��#���9��8\�\"�3\Z}�����E\�Z\�ʋ�\'Z�Q�ń���-Z��-fD���\�\"g	\�\"`F�h\�\"Z�`G��@��\�\"�E@�8\�\"�3rZ\0-Zĉ�\�\"�E\0;f\�\0Z��-\�1#�\�\"�ߴ\�y\0�p�9	�\�\"�EH�g�\Z�o�E@�ZD��>-r�L-��)�E\�\�3�\\B|��a�_B��\�@�h\�\"ZD�h\�\"ZD�h\�\"ZD�h\�\"ZD�h\�\"ZD�h\�\"ZD�h\�\"ZD�h\�\"ZD�hF�}�\��\����b�?P�D��#+\�jz��\�\"�D-��A_p�\'P\��׸|u\�\�E\r�EM�\�i\��S\�K���V\�	\�&�!ZD�hF�%\�+�\�=�����yE\�s\\�+�}_��\�\�{�\�\�\'#<qw��)\�%Yaj~��,�Ȇ>��\�\"�-�\�$�\��qy\'\�5D�x��\�Y\�\n[0\��G\�\�?vo�E����0=\�-+׋]\��H\�(E�E��a\�k�\��r�&xf�\�K&8#��1\�=5\�-��+�\�z&�\"z\�OY(/\�\n3\"�l���\�)��\�\'E�E��axk1\�V�\�<3r܏\�W ����1\�=��(\��%\�@ ���\">Y(/\�\n�ڬ�\�MdC\�\\\n�(��h-�E�Z�\n�8N�XW\�i\�uK�X����\�y_X���X})�P^*��%ǔ�e��J��\\\�\�+�7L�6�\�\"Z�A\�b\��\�8Q~ֺ<��\�oS���4�\�\\\�3\�G�*��E��a8i\�(.�&G\�\�ʉR)�\�C�\�ȰDY�\��#U\�\�\�\�\�\�H\��\�@xe\�D6����\�=��#��\�\"ZD�0,��FkK�W\��\�_it�<1I�\�w%^Q�b�wJ~\��\\\�\�q��\r#�ȟS\�\�r���\��\�h�T9\�\\�\��+�\��G\�3�զ��\�V�Z�<}}}vֿz�*ZD�0��Eqd8�r~\�\�c\�cn��\�*OT\�\'V�|�<�\Z��\�\�9s\�\Z/\�/߾7WN\�)�/(�\�J�%>eFI\�=0c�\��ùg\�\�x\�\�\�\�\�楑8{�l�u.]�\�\�յcǎu\�\�-[�\�̙3h-\�\�\'x}\ryE�̖�od<vP\�\�.oc�[\�9c�{O\�w\��ݝ㟎 �ȟ�P^�\Z�ܲr��F�Z\n�/�\�\Z[ H\��J�GA�h�E�¥�8}�4ZD�0d�\�V��\�>���\�<w\�\�����*O\'>|_�w\�!ħ\�6\�\�<�\�xo\�\�c\�\�\�\�\�{���\�\�\�p\�t���\�\���G{�h\"ZD�0\�(��q�\�},�=-jyE�_��4P����$=\��\�]�?�+\�\�lQ�ȟ�P~��{O��,�i\�P\�,\��R$\�ޟ\�]Ը�d�+V��lQr\�\�\�\�\�˗�E�CP����ԝg�+�*��Ԃ#��H5xb�wz�K*\�O�U��\�\�/OGrƧ̨�Ͻ+GV��S(R\��I�(���\���k\�h-\�P\�b��\\P4���O�t�(s�z�S�\Z[�\�{r��,)��\�!��A$g�_de\�D<X\�\rk1Vx��<�Pv!�U��pႤc�\"\�\�\�\�\�\�s����\�\�\�\�UK._�,\�\�ܹ����\�ɓ	�\"+\�.�\�\�{\�ر+W��E�#A�\r�E߾7o\�}�u���\�<Ie��F\�\�q��j\�OE\Z�}o\��\\�l~\�ko��\�;���\�ܛט\�d%[I���D@\�k��\�\nmmm׮]۲e����\�۷\�\�˞={LM�+W�<z�(ZD�0̵\�6\��;�\�1�����@\�_E�o\�\�\'\�w��ݝ7\�\�k�FǴ �Ȇ����K��\����\'Wv�e\\��6\�)�\��\�\�O�[�nݴi\�\�Xq�\�A\�Hhu�\�\"W-N\�u?yw\�c�\�Oty�Z�,�=8�p\�]\�w9N\�fT?e�\�Vh\�lL�\�bZ�+\�٢��J4+V��J�,����oɒ%�pժU�\�Ԣ�\�\�\�C�I&(��Z�v\�Z\�^:;;\�KR�Ԡ��.\�J%\�$V��-��^�\�\�ҢD\�\�\�e|iݺuj��\�iQRK\�V\"G]7\�h͚5\�;v�^�\�-�E	�\�\'\"�h�\���ś+\�9�*\�9�^��)\�HV\�ڨ^ڶm[<-�L\�\�۫_2.?r\�^�;j\�F�0r�\\|�.�ܴv��3�E\�>\�\���C7nܸ1��\�l*\��\�\�1�(����32@-tl\�q�zn\�)�\�\0��L\�ikk[�(L\r�ƞh�Z��sLâE��c8wNa�ù]\�\�\�~UHP\nTùg�\��p\�͛7\'\�\�\�իSԢ\�j�d�h-¨���\�p�_�Û�|\��\"s}g�\�?�ǉmn\�@��\�\�h-\�Ț*\"�hzN�a�y\�*�\�\�8j��<�\�\�t\�܁J�\�\rd����\�yt��c�o@\�\\�1U�K\n����\"t/�ʕ+3�\�]�v\���\�\"�-FzW�\�b᪮ab�R5�X^��oL,�&+\�\�\�b�N�R\�%b\�Ӓ-\�.��\�;p\�\0t\�\"o-\�ih\�cOC�^,~Ƌ����ihscMC\�T�\�7MC~�t�\�lMC��V�X\�\�ӓ	-�;wN\�\�\"��~���4\�e��ag�\�]\�\�\��\���C|7Z�kG��}0B\�\��\�\�C|%�Z >0���0K-\�\�\�Ӯ�ʬTx�9\"~<v\�ؾ}�6nܸiӦ�h\�򖪴�e˖U�V�n7��E�\�\�aCZ�r�z\���\�\�\"Z�A\�\�X\�	Lx\�մ\\�T�\r��*x\�U����\n��+O�i�a!�\���ĕxP߷\�֭K]�����v\ZStvv:��\�ǏG�h_�\�\�Q#�eϴ\\���\�\�\'1>�)R\��Q�Y~ �$\\��\�Q߿,.��,f�I��\\�O�j�{\Z\�_�f���B\�\���xq\�\�	��aHh\�F*˾I\�i*\�\�u�\�\�=UnoY؏�@�*p �\�Y!\��\�ʲɌ\\�r�%gW�}{ZkQ�T�;\"!)�\�\��%/^����\�>����EiZ�\�%|7t}�6={l��c�gE�\�2���\�\���#\r�A�Hh\�y/��\\\���\�<��\�\n�/?\�@\�ŉ\�\�H�yN4�EH\�%$ɝԦ�x\�=0c\�Z?�*ܵR4��SW\�X\�q��_\�OY(/\�\n3r\\�Ň\�\�K�yJ�\�\�F�h-\�0֢Tx�\�Jq`�\�[�_\�y(\��9�Y\�\nխ͒>6&��\"\�ByIj\�\�sܲ�\����B�tK>L�\�\�\"Z�!�E\�7��O&�\"���3�\��|\�޼\�\�\�}�\�0��)f�d��)�\�1۪�Ɨ\�w�\�\"Z��ע�/P��Un�T�\'zD|�y\�~�i9.A~i\�+��� ��$\�\�z\�\"ZD�0�\�W	ש�~�3���j|\���\����4<z5_dC��\�\"�@-\�\"ZD��\�\"ZD��\�\"ZD��\�\"ZD��\�\"ZD��\�\"ZD��\�\"ZD��\�\"ZD��\�\"ZD���\�-��E\�>S�i\��\�\��C�\�л\0�8���x�@�CD�\�\�\�5\\�8�\�	��1\�P\�bF�ꢏ���E��-�-Ҷh1��ZD�\0h1�\�13JǥY�o}\��ִ\�\Z���x\�cqT\�G���L\�\�9~���3\�%\n#�\�\�ʦ��\�O��<�rk1a96&\�^��\�t}\"\0�B�1/�>��k\��i1)/[j�ZLx$v\\f\�Lh\�ٙ\����\�T�g;)R�\�0�\�*ٜ\�q\�\�@�i?�Կ�l6w\��\�S9x��6n\�q\rΦg�2��eG�I%e\�$+��h����6E�Zt\�\�g�`��eZ�6�2\�}���\�\'�aj1�+?fu8\��v�\�I\�\�\�\"=\�0*\�8֢͊��^��\Zmj\�A;f�_�W���yp�¨Т�^�Zt\�8�\�迡�\�s�T�\��\\\�X�\0@�CW���8��Jb�JCp�H�-:�a\�6o\�S��\�f9փ.SI\�\�NoF��q�\�g-¨\�bR]��(g�\�T�O3}�\��բ�q�8F���\�\�q5u-:x�9-f��i���L\��a�k1\�1=C|�\�S*}�ë�.;g`�j\�+�,o�aH;�~^\0�h\0-5h\0�\0�\0\�\"\0\0Z\0@�\0\0h\0\0-\0�E\0\0�\0�\0\�\"\0\0Z\0\0�\0�\0\�\"\0\0Z\0@�\0\0h\0\0-\0d��A^\Z�\�\�\�\�\0\0\0\0IEND�B`�',20001,'com/maben/jbpm/helloworld/helloworld.png'),(60002,0,_binary '<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n\n<process name=\"helloworld\" xmlns=\"http://jbpm.org/4.4/jpdl\">\n    <start name=\"start1\" g=\"252,12,48,48\">\n        <transition name=\"to 提交申请\" to=\"提交申请\" g=\"-71,-17\"/>\n    </start>\n    <end name=\"end1\" g=\"252,403,48,48\"/>\n    <task name=\"提交申请\" g=\"205,92,142,72\" assignee=\"员工\">\n        <transition name=\"to 审批【部门经理】\" to=\"审批【部门经理】\" g=\"-119,-17\"/>\n    </task>\n    <task name=\"审批【部门经理】\" g=\"203,196,147,74\" assignee=\"部门经理\">\n        <transition name=\"to 审批【总经理】\" to=\"审批【总经理】\" g=\"-107,-17\"/>\n    </task>\n    <task name=\"审批【总经理】\" g=\"205,302,143,69\" assignee=\"总经理\">\n        <transition name=\"to end1\" to=\"end1\" g=\"-47,-17\"/>\n    </task>\n</process>',60001,'com/maben/jbpm/test_1_helloworld/helloworld.xml'),(60003,0,_binary '�PNG\r\n\Z\n\0\0\0\rIHDR\0\0�\0\04\0\0\0Qg0�\0\0O\�IDATx\�\�{ם��\���$\�q\�8�7h\�V��\�\�$6x;�m2v����$�\�;�c;�\�56!\�8�̝�@,b�\���ľ$��\�����:)�����m\�\�y=Ruթ\�j\�ۿ�ԩ/x\�\0\0���\0\0\0-\0�E\0\0�\0�\0\�\"\0\0Z\0@�\0\0h\0\0-\0�E\0\0�\0�\0\�\"\0\0Z\0@�\0\0h\0\0-\0�E\0\0�\0\0h\0\0-\0�E\0\0�\0�\0\�\"\0\0Z\0@�\0\0h\0\0-\0�E\0\0�\0�\0\�\"\0\0Z\0@�\0\0h\0\0-\0�E\0\0�#�g�Q�\�E@�ZD���9|\����O\�\"p�\0�8Z.\�G�0\�/�ω�@�h\�\"�\�\"�E��\�\"�E��\�\"�E��\�\"�E��\�\"�E��\�\"�E��\�\"�E��\�\"�D-����-�E��W�%E�r����S�\�\�/��\�\�\"ZD�0��,q�sSr��9ކ\\O}��j\�F$�\�\"�=�\�\��\�چ�iӼ�5�3\�7�\�]^\��y|\��K\�\"ZD�0��Œ��I�\�G\���\�4�\�ϓ+Z_\�8)����[\�.��x\�\�\"ZD�0��E\�\�ʂ\�V}\�0{_\���N�򧩮�S\�O��_5���\�,��҃\�\"Z�Ѣ\�\��UE\�M��qӓG���B\�C�\rިwͫ\�}�,\��\�ܚ�|_�\�U\��E��aT�KK���/\�7�q\��g̻8����k����\'\��\�7\�\�\�\�sJ\'\�늲X�F�h-\�`k�\��i��\�љ��\�s{�\�o����\���@\�o��ϕ̩-�:\��t�Np&x��\�� ZD�0�Z�̪�T?\�\�\�w����\�\�Z�����d�	..^TZ�f�\�\�ʂGC�uչ%\�.O\�\��f��z4\�\�\�իh-\� k�hf�\�\��i��������p�qꑪ\�=e\�ʪ�����V.))YT\�z�&\�Ѻܩu�5�\�*O�-�+.]�\�\�յcǎu\�\�-[�\�̙3h-\�\�j�\��\�$\�\�\�y\��G^��f<~v\�\�Ή�7\�T�U���ZUV�ʲE5�ת=/V��_��@y^Y(\�U\�r��\�TB�p�!N�>�\�\"����0i\�g�p��_}�\�?>\�Ӿdj\�\��ʥ�e\r�/��\\VQ\�\\Y�i儏K�~țW6nJݸ�\���\��\�\���\�����)>\�=���\�\"-z_�\��\�\�\�	k�W�?�\�\�3~x��iC݄O�������\�\�\�e5�\�\'���ZYV�_��-/�qM\��u��B��R��P\�-��J��<\�\�\�,\�ٸqcv�hg�+V��lQr\�\�\�\�\�˗�E�C�\�}qR\�\�\�\��\�?�\�k�?�\�\�O�2yM��\�%�?��Q�ϒ	��U,-VV�������ò�\n�)?�||Me^��\���Y-\�۷OI\'kZLv�h-\�\�\�b\�\�ӟ\�����\�?}>\�Kӟ:2y\�\�\�\�����\�\��\�\��8\����\��,+_VZ]U��<����Ӡ\�we9\�T�{(�S[SPR\�\nTJژ�L\�\n\�\�ŋ���{�K~\�\�Ǐ�v\�z��\�\�򧼤�#\�\��\�\�\�5Ux���\�\�\�e\�;wJ�gZAG__�����ٵlu96��\�\"a-�\���\����3\��Ϝq���7<�uR\�PɟK�>�~\�q\��~�GI\�ʖM(_^R��d*��3\��Ǌ\��\�?R�7�*\�W]\�,�fM���i�C�V8r\�\�\�8\�\�֦\�ٰaCtK�,\�E\�T��K!�^�Zo\�\�\�og�h-\�P\�\�\���㎙?�6\�g\�\�\����~�\�}\�fn�\Z�keѿz��\n>t�?���\��\��\�`�ϥ%�9�bIY���\�?J}�\�_�j`�\�1&�s׺|\�\�\�bGGǒ%K�t�~LJ�Zsچ\�?�;O�[�l1:-�EAZ�\�i?<x�?\\y\�\�k3����\'g\Z\�=\�\�{\Z\�\�Wz�ZT�_����>q{>)�~\���\�XZ\\���bCi�\�\�\�ƒ�e��~\�\�&\�}/�\�*(�,�y�\���(�S��M�6I\�&K�\�,۽{�\�s\�W�Es+V��uN�<y�\�U\�D�+K��\�iQ븵�U*\���\�r\�\n�h�\�_�/L��Q\�\��Ͽ4\�\�\�MϞ��\�\�L���S�<2�q߄\�6wіo[��\�hsۊ�m�\�m�\�\��	;廊+w�\��\��\�K�ŋ�\�WJ\ZC��\�W�\�Q;�}-j�D\'tIu��?>���m۶i�YhQ쩌L�Z���ź\�5�ݾi/]��\�\�\�g\�L�����{�Hh\���oG~\���\\ώ<\�|ߎ\�\�B���п\�\�o�y+��B[}�\r��~̿�f�{RAa(\�Z\�XI\�$MKoOtWW�ڤ��%���}�\�Qz�\�\"��{�g��s\��K\�ܽM\��7�p�\�ӓ�>Z�\�5l+�������[�\�?}\�\�?\�u\���{\�_\���1a>3�\�1㖌\�o\�_YX�Wo��\�E�X\�[^P[U\�\r���ױ�E�\�)yI56\�=\�\�J\�R�N�\�\��5ZD�0b�\��Ğ�y�S�\��̩�\';\'޿��\�S\�\��n���~���\�\��_\��\�\�o����}\�;\�x\�w��w�{\�\�߻\�\�\�Y�������\�7�.�tba0K].���k׮56�\\�������\�\�JJ69t萼�j\�*5\�(\\��h��ajQ*ѓ>lx|\�ԟ���\�g�xrҜ�U5\����s���o}y�-�ϋ_�_�\�_�o_�\�Wn�_�헷��;��\�o|�\�;��\�\�\��\�\��\���Q`܌�q�����\"\rБ�n�\�ͦ_q�\�r�#�\�Ǐ�\r�=ѢW�-�E�Z���]S�9;��\�\�|\�m%E���\��\�/n�\�\�~���|\�g�|�\�_�����+�\���\�\�1�\�o\��\�=9o\�y\�w\�\�\�Y\�y�*�\�+�\�\�tpKɩS��>kX�a\���\�\�\�\�J�vvv�dS��A�hFc�K݇S��sʏ{\�\�7\�\�5S[�c\����\���ʭ�\�v\�\�\��\�۾��۾�\�\���o\��Νy�\�u��S�3\���\�O\�O,�L,*�L\�<��\�;s\��#a��\�BR۷o\�=Η/_\�\�\�\"Z�ѭ\�?L�Ύ���{����\'j�E�_�\�-_���_�\���y\�7\��ڝ�~Ϣ;\�{̸\�\�\�\�����`΄�\�	��\�@�\�]��\��8c�\�:��\�߿_-\\�f�i\�+\�K{�\�1.OQ�{D�h�|%���\�\�S\�>釧j\�[7�xmS[��?\��\�^�\����\�\��\�7\��\�=��5\�û�?\Z[�A~\�?�\�Ϭ7�>?**-���4>о\�\\�%===:[4�*�\�\�Mc�ׯ_�\�Iڸu\�V����\�ԇcG�{D�h��\'\�\�V7�D��OWL?T\\��\�\���\�\�\�v�\�w\���]c��NN\�����\�?�|BnumnA��`0\�[�r\�HdժU�v\�:|���\����-�ѳE(]\�\�Ń\�s\�Ω���|6m\�$�H�\�	Y��-�h�|l�@\�$W��J�\�\"�\'.��H[\�\�\�\���v\�sg\�\�\��\��;�\�\�\��\�7��}L��?+�TE\�\�\������\n��Z�sZ�/:;;M\�GwX�\�d�ٳgcN6�z�j\�\�\�.v�h�G\�ihcNx�\�\"dO�ޙU�\�jO�\�V3�HIp߸\�\�}�K�\�r�G�ߵ�[9��\���\\ׯ��OU�o�˭�+�MtUy�|��M-J2\�\�ڪ\�\\6�Ή�\\�A�&OiI\��---\�{�%��z�\�g�1\�]�$tv�h�G��\�q\�\�	��!\�Z�U\�{�.��i۪����\�c��ɭ��\���\�9��\�W�\\i\��*\n\Z+*�\\�*�����<�\�\�AtWWWGG���\�\�ze�\�J}Vrɓ\'O\Z\��z���fR�=v옱�-r��ś\�N\�\"\�y *Z�!�E_X��*�PW��lRg�����p\�\�\�ݙ��\���\��r\'\�\�Թ�+�Ūk�$��f3\�=R-�E\�f��J�\����+\��<?\��qc\�\�/ͫp͜��/,�-�e\�!A��ap�\\��\�M\n�\nl(�nS��{\�ߗ��ʿ?\�\ZrUT�\'��E��a\�k\�SRR4�\���z\�k��\�\��\�cr�ɗ�Ȥ��S\n�\�ܞP��<�\�	�E���-��&V<0%\��\�\�y��\���3�UW\�.�q{���\�=�\�qF�h-\�\�\�%���ܲ�܊�\�\�\���I��*OɄp\�Jx��AyGH-�EL-jr}\r9\�\�E\��ݍ\�\�AGH-�E�J��	�E�h-�E�h-�E�h-�E�h-�E�h-�E�h-�E�h-�E�h�\�\�\"p�\0�8Z.\�G��E|\�h�S0�.b���h\�\"�\�\"�%/F��\0h\0-Z@��\�\"�E\0�h\0-Z@��\�\"�E\0�h\0-Z@��\�\"�E\0�h\0-Z@��\�\"\0Z��-�E@�\0h\�\"\0Z��-�E@�\0h\�\"\0Z��-�E@�\0h\�\"\0Z��-�E@�\0h\�\"\0Z��-�E@�\0h\�\"\0Z@��\�\"�E\0�h\0-Z@��\�\"�E��PbЋ���\�jv\nA��!	�}�2���:\��e�E@������\�\�h\�\"dC��\'h\�zr���\�\�\"�E\��+\�~�\�\�Ji\�bR%жh-:ע�\Zt��67Iq�6�B��G�\�]�\�\�ĺvl\�qvƦ\�\�\�~\�:�\�b��<+\���\�\�\"m��1�]=%[\�#\�\�ž1\�$��#\�C�hqti1�z\�޼\�:�-\�\�+��K�E@��B�IuΤR�n��phR]46ߗ��\Z�h-&\�b�,\�k\�޻d%\�a\�Z�\����E@���a\�~g�%5(���{K\�-BJZ�\�\r�T록\�3C#��E@��W�ɺ,E-:s���:i�-��q�v4a߳){\��-1i�7-Z\�Zt���2�ź11-C\�m\�\�qZ�82͘\�\r\'6�\�MӍ\�\��V-		\�{�E@�����u�8h3M80-ZHh\�\"\0Z��-�E@�\0h\�\"\0Z��-�E@�\0h\�\"\0Z��-�E@�\0h\�\"\0Z��-r\n\0-�E�\�C��l�\�B�\�\"��\�r�\�,\�D@�0Z\�h�]��b��a�kQ+/�w�hF�g\�\"`F�h\�\"N��-ZHN��%@��\�\"�E@�h\�\"�-r~\0-fD��-\�D@�\0v\�\�i�h\'Z@��옑h\�\"N�ǌ�\n@�\0\�\"\�\�\"�Mf\�$\0Z@��G\�D�+-�E�@�hqdi��\0�G�E\����B��?1���b\�?\n-\�h�\'��\�z�E��\�\"�\�\"ZD�ZD�h-h-�E�H�E��\�\"�\�\"�E-�E@�ZD��	��-�E��!\�Z�d\�؜\�I�E�d�h-�El-�ʪ�uӊ)n�S\�4��q��t�\�\\���uӥp��\�\"3-�\�\�R�\�\�\���_��z��(>\�\���\�\�.3�E��a�iQ\�:QX\�{���Խ\�\\�\�\�0\�\���憅�R`\�\���p��\�\"7-6͑<1\�\�_~\Zz\�\�гo�\�z\�m\'ȆϾY�»��\"f�yu��\�\"Z�a�Œ�\�Rw�O�X�\�\�%\�+��{�3�p�l(��>�t\��w$y�:uqc��\�\�\�s\�̙˗/g\�.\\8r\�\�����]��\�b�_����ҥK:�\'Oʑ����E��-*ѳ�\� �_I�Dj�I3��g7<\�\0\�P6�B�~�_Y�\�l�رcK#!���gϞ���m۶�8p �\�:u\�*���+\�\r׮]{\�С�k.[�L\�\�\�\�@�h-Zf��Չ\�%\�\�\r\'6\�qBČRHճo\��\�n\�Z�\�k��سg�����677\�Vk֬t-Jƺr\�J�\�]���\�\�νQ�Vۺuk�K\�ΝC�h-\Z��,�\�\�RVNW��G�Q\n	\�{[\�OIB��O�>��^�zm�p�E�;v8\�\�2�-\��˗/W\�nٲE*\�P�5�\�\�ݍ\�\"Z]Z<q\�ḒT�eҢ�]+-CkH~�^Ә�eH�\�m���\�(	\���P+�_�>�%\�;ZD�hqti���\�T�X�bE�\�\�ږ�)\�8ƒ�R�<~�M��o\�<\�\�\�\�\�J�*a���1\�ѧ��E��G�w\�\�\�	%8	�E��Z�k״�j[\�\�MSHQ1SBg�r:k3nܸ�\�ի�kh\�͡3\\\�r�E�\�\"Z	Z\�u\�\�r\�J\Z\�<(B�\�\�\�\�\�.)��`��,{\�9d�zID\�%k-J\\�|Yڼy�M\�jw�E��G����vGB\�|\��Ę-&ն\�&�j��+�?^\��$j-�FY�-\�G	�hJ\�\��\�aM\��HO��\�\�\�j[<+�Ѭ�(�R#�$%4U�UH9�\n/٫�\�fA���M7\��\�\�հ\��B\"�\�\�\��h-�\�ѥE\�\����\�(E	�!\�===�/xݺu.\\Ȃ�߈��pn?\�\�-�E�8*��l�0bv\�^�~]*\�Z�w��V�6c\�{��bv7kC�B\�\�Zlmm\�<K�,\�Zܷo߆$C2M��\�\�H֢�u)ޙ\�\�\�\'�\�Nܻwo{$,z~$��q\�F��l~\�ʕxZL{O�1[d��h�&-��K��$CKG\�j\�#%��n\�\�N�<��Z\�W\'I�\�E����E�l\�͡oΓ5\�KIiQ\�\�6B�-�E�8�x\�\�	Q�iu���n\�ӆe���\�IՒ5k֘L\'ug\�Pѱ��\����W����e�\':zwZ�\�\�\�҂\�\"ZQZܾ}���b\�ڵbqӖX�}��q�={�l۶\�ا�s\�N�\�;L\r|э�\"S9*Ӛ��E��\�8�\�\�F�h-�4-\�L�i��¤��\"�\�u�\�Z\��~�z\��1�M̾%�=\'\�HO��\�\�HӢ\\ے����:t(\�8Z\r�kQIV՗�,Yb��k\�ʕ��m�.�\�\�\�\�f>\�6jZ�;��D�E@��\�Q7�{t7���\�g�ٜ\�ZKJ[,f?���\����.N�7�\�\"Z]ZT͎7n�����\'\�%��\�B�;w\�\�s\���\��M/\�fM;Z\�\�\�ʾX^iQ\�@�Mv\�ލ\�\"Z]Z������\'Z\'P[o�\'��n�6��H\�%~��ob\�T\�-ܭ�}\�\�6\"k\�\�o@�\ZH�\�\"Z��ő�\���\�i5�&��^��E�z\��\�f\�\�\�ݭ:\�\�kQ�\\��I��,Yr�\�A\�\�\"Z폸2iQ,�\Z�jDS�hQ�����OMң$%\��Gم\�\�٣S��[ޗ��O�9Ww�\�lq�PZG�h-��Őd�o4W��n\�\�iy \�S�\�.0\�h�Q�:��?E\�`TeSTb��^�~ݤ��g\�J\�X�����jL,����Fi\�^Z[[:d1�Nz��}�v�\�Ç�\\,\�\�\�h-�ś�Ŧ9\�~߰����OBϿ#��T�C�\�v�l(��k_�K\�{��,.nz4Z\�\�\�\\�~�$>z���N+Rw�\�۷\�h.�P\�\� \�[�r���O\��g�lZ̠#\�-[�;�%\�̂\�<�b@c�L<-\�\�	�\�]�-�E�h�D?R�\��ZŌR�j\�4;\"��\�\�İ_^(�gA�ڀ�\Z��\'��zΧ��,��@M�f�Q�m\�&�\�)�u\\�tI�PѴ\�<;���\Z�|�\�N\�Ӣi\�1Ɉ\�\"ZD�#X7�|\�\�\�\�׼��z��\�W\"\���	z\��ŉs_\r\�Mς���tתdy�ޒ�;wZ�\\�p���GL$U\�#G���������b�͛7Kb�TE\�X!J	��-B��\���\�3-OX=p\��\�ի�\�u=zT\�Y+�7���E���}eUbFI\�\�]ɍs�A�yT\n\'J\�\�l[$R��\�\�I�E�\�\�b�$K\�\�tGH\n-�E [D�h-ZD�h-ZD�h-ZD�h-ZD�h-ZD�h-ZD�h-ZD�h\�\"ZD�h\�\"ZD�h-�E��Z\���(�\�?1\0�Qh�b\0��\�\��\'&��WZD��\�\"�2^�\�\�\"\0Z��-�E@�\0h\�\"\0Z��-�E@�\0h\�\"\0Z��-�E@�\0h\�\"\0Z��-�E\0�h\0-Z@��\�\"�E\0�h-Z@��\�\"�E\0�h\0-Z@��\�\"�E\0�h\0-Z@��\�\"�E\0�h\0-Z@��\�\"�E\0��-�E@�\0h\�\"\0Z��-�E@���\�p��iC�\�X�l\�\���T,�G��-]-Fo�^-\�1\�\�DB�[�\�m��\�Sw\"Z��j&\�@\�\�H�S?\�x6OvC\�mS<\�%�E@�\�L�i�\�b\�:�3-\�yG\�p\�ӈ-���묙\�:QJ6KJ���;\�qֆ�yx	\�fq\�6ac6>�E@���E��\�Ե\�\��\�Wck1ٓc�բ��4h�E@�{f���$\�<�TU4�Z�p���RѢ}\'&�-&�E\�\0Z��E\�&J]�I�\�fY�)��\'<�\��\�$�ΣE@�i��Ƽ\\�j^��<:\�b�_\0)veN�vD����h1i-f�\�4)g��Ł�;.\�\���\�?Ɏ\nB���Ӣ�Ι\�3�lj\�Y��������\�%��a-Z�Z��U��\�x\�b���\�^O�1�\�D�#�\�%���͛\�\�\�`�\��[�I\�f�ʈEg\��\�:Z��A-f�ںΘ���#S1u��ޥ��\"\�\�\�h\�br�b\��\�}\�L�v\\��s#]�-6\�\rS��2�wC�EE\��j\�\�\\7t���T�o��[���\';\�\�A	h\�b} �;\�\�MvƠ8\�{q\�ՓԔ�OK�鞃R�p\"Z�Q\���16\�\�l���&\�\�ޏl��g6K�%7-\�\�\"�|-Jۥ}-��\�$5\�\�k{6��\�x��\��t\�/�-fC�\�l(H\�\\A\��@��2Z��-�E@�\0h\�\"\0Z��-�E@�\0h\�\"\0Z��-�E@�\0h\�\"\0Z��-�E@��F\�C��l�\�B�\�\"��\�r�\�,\�D@�0Z\�h�]��b��a�kQ+/�w�hF�g\�\"`F�h\�\"N��-ZHN��%@��\�\"�E@�h\�\"�-r~\0-fD��-\�D@�\0v\�\�i�h\'Z@��옑h\�\"N�ǌ�\n@�\0\�\"\�\�\"�Mf\�$\0Z@��\�\�3A�@�h� �8\�Z��\0��\�\"\0W(ZD�\0\\�h-p��\�Ѯ\�\�	b�ZD�h� \�\"ZD��\�\"Z$��\�\"A�E��	-�E�Hh-�E�@�h-ZD�h� \�\"Z�A�$K\�\�tG\\TZD�d�h�@�hq��\�+�\n\�M+n|��iNI\�\�\�\�\��\�1js)J\n\�M�\�\�\"�\�\�0Ӣ8�|\�+\�/-�^���\��\��R\����\\�{)�|\�1#Z$\�\"ZfZ��N\��^k\�\�-uo4\����.\�2GD6��aa�z�})-h-7-6͑<1\�\�_~\Zz\�\�гo�\�z\�m\'ȆϾY�»��\"f�yu��	����K�fK\�YR<qb\�CO�L�\��\�\�|\���l^��ӡ\�ߑ\�Q\�\�ō��\�k׮;vl߾}G�u���+W�9bg\�3��p\�B\Z/��\��<\���w9ڎ��t��K�8\�\�ח\�7u��垞��i����\�<\�-��J�\�\��H\�W=�ZpҌ\�\�\�\r;@6�ͥ����&�\�W\r�l�\�ŋ˗/_�t\�\r��I�]�l�^\�\�յ<&.��H$�W\���\�ƊxZܶm�Z���7\�7\�\�8!��^�ܹs\�\�mܸ1�o���}ɒ%\�֭�y�\�\n�tz\��sTwt\��GY�8Q�hq\�[�\�\�pb\�\'D\�(�T=�fmv�x������y�f�\�-ٜ\�j���v�x\�\�!U\�`iqӦM�\�?u\�Zg\�޽ѯ\�¥�#fJ(�R�\Z\�%�\�:!\�1r\�ڵR\�ʕ+�^���i��\�T\�\�Ç�ǉ\�ǏK��\�^l߾=\�[F�hqY蹷�\"���J\'�2��������fM�r�-M9֬Y3��(v�\�\��\n�옪{j���\�r�\\\�ٳ\�\�\�\�\�\�d_+V�P�={��uk��ϓ\'O�Ww\�ڕ0G3���իW\�[s\�Ν:qNV����rd����ե;\Z�h���\�\�\�۽{�Ң�����w-W�Z\�:::Lj�%�-\�B�\�Vr>��yOO\��8!��\'�\r6��������H^�v$�酁ظq�*G/Qy�I�z�h-{-\�\�\�(\�\�ڢ��\Z\�\�\�V���S\�}��E�K�j�\'N�Xm/\�eJ��Y^\�\�B��ɶ[�n\�\nnmm�0]t�2�W\�\�[�l�\�9�SB�[���uΟ?o�\�\���Ec;i<-J��\�ZD�\�^�1\�T�hU$\�j���\\&-\�\�r�\r�EU�z\�娺���;\�7m\�$9��E��֢�����Z!嬪?\�\�rrĒ\�T�(%�\�I��z�%/�\�+G\�ַ\�hڵh\�5ZD�#S�\�ΝS�\��:����ަ\�Sr����\�L�lj1\��\�؉aꘖ3S��3J�3f\�\�b�S�\�,S������.\'P�I>�uZ�=\�\�Uy��VW\�$S�r�\�\"Z\�Z�b�$����\�\n\�?+\�\�\\���G�ɭ�yVw$�՟�UYkQ.Q�\�%3M\�d�(��t\�\�(\"S�*++\r��\��\���V.K\�=fA���N���v$�T_f��E��Q�W!��~��3-:\�r\��}����M�!Ɇ�e\�f�\�ʁP�\�\�\�e/&�\�d��cn�Dl�z�\�\�\'K�,Y�+\�&-j��*mF�(\�L\�\�\� 99���R\�Բ!\�\"\�\�\n$I7~i%�-��*ָD�\�@\"��\�bZ4�1�)5���Ŷ�6�5�\�=�Pu1�g�\�51kЙТڗ�̳g\�\��\�J�\�FI3\�u�d�mQb\�֭h-�-Jnr\�zK{{���Cut:Ӣ\�\n���\�\r6>|8].���=k\"�\Z\�\�P�Sw\�ʑ���lԢG2�xRH��UZ��\�\�XH\���{�\����\��\�R��\�z�PK$�\0����w���\�t\�\"Z�Z4�\�[t���ʙ�\��C)^\��%�U\��\Z��i��\�\�r&E�\�\�\�ned�ub\Z$(	ct}Y6\�CS�M�7\�\��b\�Z4��\�\"Z��EI9\�,r\��c�,�\�v{\�\�\�i�D�;T�Ktwy&�\\�PD�؊�U��$��\�\�&rSH\�KjC=�RT�+�v=1�Z\�\�߯�\�\�a\�F�K\�iQN8ZD��-�\���\�\�$U,-:�\�%^ۢ�E\�4x0sZTc�L#%O�<��YG___\�23\�m,-�E�x#\ZS5\�\�\\��EU\�9�\�D�n��\�\�k\�T\nf�\�3�Ec���ԩ%�\�b/$C��EIB�\��\�,�i��\�\�\�!�h-{-\�\�v\��\�E��S7G�.q�I�z\�`i1^R�GeZ�:�h-\�q<��\"2�E=FG�\�\�\�!�S}/�\�\�X\�\�bj1ޠw���\�\�-�E\�oxA.WIj\�p\�\�\�o>1�\�e�\"�\�]D\'\�Z�o�\�iiT���v��\�\�,�\�1o\�̐�3��E���bO�Ig\�Z�9�BB-J(a\0�]�\�\�R��Z�|\�\�\0F\�\�\�\�NkQ*\�\�M\�V\�O�dW\�zT�iy̑��\�<-ZD���mQ�ɐ%Ӕ�3��\�=\�1\��HQ���\�@i\�\�K�$�����,\�J�hgZ\�\�Ӱ`1��\�\�\�\�?�H�K���&;He\��\�\�\�ӢE5=�z\�nE5\�O3\�mq����]Iv�(o|߾}r��w��\�\�\�\�޽Q�E�d=h-�Ђa�\����\�z\"U��C��gH��1+�ItLZ�9Q�-���EO�k��!\�ZTw�X<c\'�\�hՠKc�\\;^�r�m����\�\"��\Z���:|��j*2ͯeѶ\�\�\�&F�7#YB-JV\"Ɏ�1Z�*�1ͧ��c\����(\Z:\Z�*\�zq�\�4l0CZq\�\�0N� j�y~\�d�\�\�\�OI9\�<�оM���\�ј-�$[|����wKN\�Q�\n=��p�Y�Dǋ��-Z��Q�z8���N�mI^\�\�j�.�S\�#\�\�ٙF-F\�V\�蜍�\��#-Zԭr\�o1�\��r\�v��\'OF?�@u�\�&\�/\�ʾ\�(\�S\�Ο?\�+T(%\�|՘,G\�B��,[l�S�\��\r[k_�$��;�\�I84\�mȆ��8����4���z�\�\�G��%%ܴi�\�\�\�l�a\�t��1%�x񢺒UÿQ֣F�բ�52�\�ӥE\�\r%\�ӣ%��Y�!�y�\�-\��7�؉����:h_\�\��\�-�\�J�#\�/-lx�U\�(5_�6L�#K�(Nk�\�R�0բ\�\�\�O��G���2\���\��\�a1g.H�O�r\0\�:�֢\�\�5�\�jς�	t*m|u\�Νmmm\�\�\�چ\�S�*��7�]Ǚ3g$_�d(-\�|\�ZuZ\�M/�� ���5�.�������?p�\�v�bqb\�\�WuӇ����28�S~���n���6�\�{WD1\"���E\�V\�\�\�sS���\�Ձ�\�\n9*\�Nդ�1\�Y\�K�\�y�\�A���. I�[ZZLj����?O�(_?\��!\�1O8Z]Z��U�%�w%7\�q\�m\�Q)P�(�-\�`Z�Z\�pQh-fW���,�\�qQh-�-�E-�E��	��\�\"Z$\�\"ZD�h�@�h-�E-�E��	-�E�Hh-�E�@�h-ZD�h� \�\"Z�z��E\0\�\nE�h�+-�E\0�P����1�-�E� \�\"@�x1�@�\0h\�\"\0Z��-�E@�\0h\�\"\0Z��-�E@�\0h\�\"\0Z��-�E@�\0h\�\"\0Z��\�\"�E\0�h\0-Z@��\�\"�E�h\0-Z@��\�\"�E\0�h\0-Z@��\�\"�E\0�h\0-Z@��\�\"�E\0�h\0-Z@��\�\"\0Z��-�E@�\0h\�\"\0Z��-\��\Z+�6�_�E\�ƈ�����ʁe轠E@�#P�\��W�6զM*�\�jK�\�Z�8�\�\�R�_<dS�v\�c_�)�(�\�\"�\�Q�EgY�\':۩��JV�	OZ�8Tj�6K��gVZ|\�X\�\�\�6�\�Ԣ-Z�ZL��ti\��1�ŉ\�o\�A<�FI�hq�{3��\�;VL<\�$UB�ZL\�����l����h1Ztl�Ե�T\�`i1�nb�ぬ\�\"�\���A[_\�I5/ZřS�p6\�\�qWr\�H��-Z̪\�ڜ\�#)g��%�\��@K�����\�\�\"�\��\�b*#Q��\�-��1T�i}\�jXD��G�mn��l\�ٝ|i��b[g*C\�\"�Ŕ\�\�ؼ��g\���\��[l�#\�tՂSl\�D��_�\�솶�o��*\�SaR-�v\�NZ�M�hqi1�T1�q\�vF�8\�b�	�G���~dz\�F����\�тi\�Κm\�\�Y��}-�ذ�-fC�^�\��\�o�sv���;Z\�ܨ\Zǟ\�X�T�\�\"�E�\�n�\\{\�6Gگf��E�c��\�ԇ=\�?�hq��]\�\�b\�)�u֖\� !���dB�\�4\�ȍ--f��`ЏgH��h\0-Z@��\�\"�E\0�h\0-Z@��\�\"�E\0�h\0-Z@��\�\"�E\0�h\0-Z@��9�\�\"W��E@�\0�\�h�E�	hF~e9Zsq\"�E-f4�.Z1W@�0µ���;N��T�	�3h0#Z�h\'Z̈-$�E\��E��h\�\"�E�h��9?�3�E@��q\"�E\0;f\�\0Z��-�E@�\0v\�\�	�h\'Z�cFN�E��i��\0h\�&3r\0-�E@�Y\�� \�\Zh-�G�9\0�\�jB�h��	-�E\0�&����\�\"Z�\�\��\�@�h-ZD�h� \�\"ZD��\�\"Z$�h� \�\"�E�@�h-ZD�h� \�\"ZD�h�@�hq��,\�ұ9\�*�\�\"\�\"Z$\�\"Zl-�ʪ�uӊ)n�S\�4��q��t�\�\\���uӥp�H�E�8̴(N,��J�K�,�~��\��¢� $?�^\n,��@̈	����%��5�\�ڸpK\�͵�n��\��\�\�hnX\�*�^~_\nG�ZD�\�M�Ms$O;񗟆^x7�웡yo��{\�	�\�oV��n\�럈k^],��E-�\�a�Œ�\�Rw�O�X�\�\�%\�+��{�3�p�l(��>�t\��w$y�:uq\�\�k�ڵkǎ۷o\�ѣGl~\�ʕ#G�\�\��L$.\\��\��\���;b�,��ɥK�:::,ʔ�����\�\�\�9�˗/���M�ɻ�yrd9Z�+ѳ�\� �_I�Dj�I3��g7<\�\0\�P6�B�~�_Y4�ŋ/._�|\�ҥ6lp&&\�vٲezIWW\��H��4H㕿~����\"�O�:�\�\�\�ݻc�p���իW\�\n�����\0\�\�ۗ,Y�nݺ\�\�\�\�	N\�d��0�s�\�D��4�)g��Չ\�%\�\�\r\'6\�qBČRHճo\�fW����ŏ͛7�F�9�\����\�h�СC���\�\�M�\�/�ӛH�Ss\�Uɪ\��ڵke\�+W^�zU+4\'\nq���Ç\�Ǐ��Yj/�o\�n,VNZ\�}�\�\�\�soKEX91\\�NeF)$4\�mI?%	͚\�]�r�Y�f\�kQ��\�g�Ylr\�\�9�0�Z�\�t��\�^�Nuc\�ɓ\'\�Nw\�ڕ0G3��(��ƌ�;wn۶͙\�\�L�#�h\�+V�%Z4\Z*^\�J\�WV޲e�q�8Eb��M\�J޻1�\�\�\�9\'Dp�ĴaÆ�\��_Ԓ�{��Ifza 6nܨ\�\�KT\�jҢ�\�)Z�C��w\�\�smmm\�Z�	1�R��Sꒃ�E��Ƭ\�8r\�ȡ�Pٙ\�F/mɻP5\�C�H\�&kr�E\�N	�^l\�O�\�1��(-�[�N/QZ���\�|�%wV\�-Z��E\�;b�*\�[	G\�T\ZeԢ6fF)�\� jq\�֭+;ˑ\�&i�ZA�ҪG^�\'N\�[_\�ַ\�hڵh\�5Z�hW�\�ΝSLWW�M-\�\���\�k׮\��\�\�\�b3ղ�\�x\�o\�\�2a�E\�\n��_έZ���;z���CI�iQ��\�ȩ�%�S/Q\�\�1�(�-Z�qattt����ǊS�N�F։�BOO�\�DgΜ1B쎄���S��\�Z�\�^\"��M�\�ע�\�ҥK	�h�\�P\�)櫪�N\�\�j\\�T�\���l\�ckTf�Bg=\�\�B��\\t}-Z�\�\�\�\")���q�z/+B$�+*ٳg��\�\�k1ZIҢ�(��9����\�%KL�b�\�1\0�P�`�\�[Bk\\�\�b Z�8\�Z4�\���\�_�B�\�b[[[v�(^�y��\�%Ϟ=�\\�b�\�͒q\�Q\�\�x����E��[��E@�VZ�|\�!$\�Q\�\�\�\�\�\��\�ց���{ ��6l\�p��\�Lt�\�Ec�V\'�b:Q��*���:\��\�ݫ.��k׮�\�-�\�tZB|���\�t\�\"�\�Z4��[t��Y�Ʊ�\��C\�t\0�\�y��P�\�9}���kџd�\�\�\�j�R�i��$�\��e\�P#\�7\\\�\�E�|���Ec�h\�b��()�dI\"��\�b\�;@G\rET=S���$a�tO\�Ɩ-[,����Ԇz�vW$�\�zbX����_\�\��\Z�\�Ӣ��h1m�ׯ_߳g�qMIK�	k\�iע�+\�8<�\�ɓ�5��\����bp&z��ŢE@��\�b{{�И���d:;;K��&\�1\�^�%���P��N-\�\�{!�M-Jj:0Ue�nZ�\�7�\�8�-Z�q%\�|\��\�e\�޽�n�x].\�D�:\�\��ض/QJ\�J���=\�\�`b��\�\�1:����q�\�{�?EL6�lb\�~S�\�ݶh:�E��3ն(H���s�.��\�>,\�w�I~��7+\�]u\rG\�o��DϦ#\�\"\�\�ҨOI\�x�͡;XL\�c\�j�!-\ZgC��GKO�\�k\��#�\�Ԁ%5\�ݡ[\�L��ԈcVϣ\�\"Ĺ����1��0Jޝ\�� ���7e[I?\�SXus\�QA�\�---w�E@�ih[T�O2�E\�4\�w<�~�=\��\�QR\���I�\" ]#�\�V ��H.]�$kJi�2��\�\�\�L�\�}�\�L\�}D�O�\�\�?@�C\�.��ZTI���`B-���G��[N;;;cj�s\�t8\�1/�~\�e\�o���!��ubv�\�Ѣ�o߾}rB�w�+S���\�\n=0(�%\�A�hxhAl-�9\��\�\���\�IȐUY*�蘴s�\\լ&�M��Ek�\�ŋ��\�\���\��>љN\�V���\�A�r~,���P�ׯ_�\�3\�\�峈׭�lۢi\�o�<\�ꦞ\���<��m���M\\cq��%ӑJM��E�ٙOۦ�\��\�\�0\�7Z��P_j\�~;�VQI$�\����e\�\�\����澾��oܾM���EHO��l�\�\�\�-}8-D}*��\�\�f�/ηh��fԢ\"��T_HBd|t���\�\�u۴hє�\�\����(-\�\�6yPU\�[\�{\'��\�!�Qu;�XxwT�n+\�$�%\�}��\��?�#V�PJ���q\�\�ThR\��\�T/�}\�\�\�\�\�?	=��$zR\�{\���l.N�}\�/\r\�m�^���\�\�a�Eq�hER0%\�\�? \�7I-U\�AUH�Z��Df�Z\�\�*��M�t\�J9\�\�7��iO\�a�\�߯�g��X\�\�%�\��k\�\�$v\"a�n\�L*tm@7��EHo%��\�6�\�*f���P�\�\�\�%O\'����B)|�j\�t�\�\��r1�\\󲚞=,\�l�Ԡ\�iQ�Xݷo�\��d9*\�\�M��T�\�\�ڤ�\�\�(%�J&A?s\�\�\�˒�Ř��C��-릗\�]z���WW\�_T�J��8Ao�`�8�b�\�CA���\���_����\"!钤H\�\��{J\�0\�ԲU{{�\�0���1�hqI�P�%!)��\�X!\��\��\��]�\�EH����U�%�w%7\�q\�m\�Q)P�(�-ZD�#.T-�\�\�j1X��cs�#.T-�E�E�H�E��\�\"�\�\"ZD�ZD�h-h-�E�H�E��\�\"�\�\"ZD�ZD�h-h-�E�H�E��\�\"�\�\"Z\0�\�	\0h�\0\�\"$\0�\�Q�A��@�h� ��u^�\�\�\"\0Z��-�E@�\0h\�\"\0Z��-�E@�\0h\�\"\0Z��-�E@�\0h\�\"\0Z��-�E\0�h\0-Z@��\�\"�E\0�h-Z@��\�\"�E\0�h\0-Z@��\�\"�E\0�h\0-Z@��\�\"�E\0�h\0-Z@��\�\"�E\0��-�E@�\0h\�\"\0Z��-�E@�\0h\�\"���Ł@�����C�E@�0�����@��a0k�h\�\"�\��?Θ��-B�ES+�s1��,�es̈́\�`\��\�\"�EHU�����j�\�;Z�C�o׎M\�8\�b�{G��!�ZL�\�\�o��N֬m\�-Z�,i1)�ج�&TgR�F��axk\�NF��T-Z��4,&u\'�=\�QZ�\�L���LXr�\Z\�\"�EH��\�N�\�2:-Z\'\���tֶhS�iV�-BJ��8ȝ\��pgZtvZ�\�h�%gus���E@�\0h\�\"\0Z��-�E@�\0h\�\"\0Z��-�E@�\0h\�\"\0Z��-�E@�\0h\�\"\0Z�\�)\0��-�E@�\0hF��\�\"�E\0[f�\�\"\��#���9��8\�\"�3\Z}�����E\�Z\�ʋ�\'Z�Q�ń���-Z��-fD���\�\"g	\�\"`F�h\�\"Z�`G��@��\�\"�E@�8\�\"�3rZ\0-Zĉ�\�\"�E\0;f\�\0Z��-\�1#�\�\"�ߴ\�y\0�p�9	�\�\"�EH�g�\Z�o�E@�ZD��>-r�L-��)�E\�\�3�\\B|��a�_B��\�@�h\�\"ZD�h\�\"ZD�h\�\"ZD�h\�\"ZD�h\�\"ZD�h\�\"ZD�h\�\"ZD�h\�\"ZD�hF�}�\��\����b�?P�D��#+\�jz��\�\"�D-��A_p�\'P\��׸|u\�\�E\r�EM�\�i\��S\�K���V\�	\�&�!ZD�hF�%\�+�\�=�����yE\�s\\�+�}_��\�\�{�\�\�\'#<qw��)\�%Yaj~��,�Ȇ>��\�\"�-�\�$�\��qy\'\�5D�x��\�Y\�\n[0\��G\�\�?vo�E����0=\�-+׋]\��H\�(E�E��a\�k�\��r�&xf�\�K&8#��1\�=5\�-��+�\�z&�\"z\�OY(/\�\n3\"�l���\�)��\�\'E�E��axk1\�V�\�<3r܏\�W ����1\�=��(\��%\�@ ���\">Y(/\�\n�ڬ�\�MdC\�\\\n�(��h-�E�Z�\n�8N�XW\�i\�uK�X����\�y_X���X})�P^*��%ǔ�e��J��\\\�\�+�7L�6�\�\"Z�A\�b\��\�8Q~ֺ<��\�oS���4�\�\\\�3\�G�*��E��a8i\�(.�&G\�\�ʉR)�\�C�\�ȰDY�\��#U\�\�\�\�\�\�H\��\�@xe\�D6����\�=��#��\�\"ZD�0,��FkK�W\��\�_it�<1I�\�w%^Q�b�wJ~\��\\\�\�q��\r#�ȟS\�\�r���\��\�h�T9\�\\�\��+�\��G\�3�զ��\�V�Z�<}}}vֿz�*ZD�0��Eqd8�r~\�\�c\�cn��\�*OT\�\'V�|�<�\Z��\�\�9s\�\Z/\�/߾7WN\�)�/(�\�J�%>eFI\�=0c�\��ùg\�\�x\�\�\�\�\�楑8{�l�u.]�\�\�յcǎu\�\�-[�\�̙3h-\�\�\'x}\ryE�̖�od<vP\�\�.oc�[\�9c�{O\�w\��ݝ㟎 �ȟ�P^�\Z�ܲr��F�Z\n�/�\�\Z[ H\��J�GA�h�E�¥�8}�4ZD�0d�\�V��\�>���\�<w\�\�����*O\'>|_�w\�!ħ\�6\�\�<�\�xo\�\�c\�\�\�\�\�{���\�\�\�p\�t���\�\���G{�h\"ZD�0\�(��q�\�},�=-jyE�_��4P����$=\��\�]�?�+\�\�lQ�ȟ�P~��{O��,�i\�P\�,\��R$\�ޟ\�]Ը�d�+V��lQr\�\�\�\�\�˗�E�CP����ԝg�+�*��Ԃ#��H5xb�wz�K*\�O�U��\�\�/OGrƧ̨�Ͻ+GV��S(R\��I�(���\���k\�h-\�P\�b��\\P4���O�t�(s�z�S�\Z[�\�{r��,)��\�!��A$g�_de\�D<X\�\rk1Vx��<�Pv!�U��pႤc�\"\�\�\�\�\�\�s����\�\�\�\�UK._�,\�\�ܹ����\�ɓ	�\"+\�.�\�\�{\�ر+W��E�#A�\r�E߾7o\�}�u���\�<Ie��F\�\�q��j\�OE\Z�}o\��\\�l~\�ko��\�;���\�ܛט\�d%[I���D@\�k��\�\nmmm׮]۲e����\�۷\�\�˞={LM�+W�<z�(ZD�0̵\�6\��;�\�1�����@\�_E�o\�\�\'\�w��ݝ7\�\�k�FǴ �Ȇ����K��\����\'Wv�e\\��6\�)�\��\�\�O�[�nݴi\�\�Xq�\�A\�Hhu�\�\"W-N\�u?yw\�c�\�Oty�Z�,�=8�p\�]\�w9N\�fT?e�\�Vh\�lL�\�bZ�+\�٢��J4+V��J�,����oɒ%�pժU�\�Ԣ�\�\�\�C�I&(��Z�v\�Z\�^:;;\�KR�Ԡ��.\�J%\�$V��-��^�\�\�ҢD\�\�\�e|iݺuj��\�iQRK\�V\"G]7\�h͚5\�;v�^�\�-�E	�\�\'\"�h�\���ś+\�9�*\�9�^��)\�HV\�ڨ^ڶm[<-�L\�\�۫_2.?r\�^�;j\�F�0r�\\|�.�ܴv��3�E\�>\�\���C7nܸ1��\�l*\��\�\�1�(����32@-tl\�q�zn\�)�\�\0��L\�ikk[�(L\r�ƞh�Z��sLâE��c8wNa�ù]\�\�\�~UHP\nTùg�\��p\�͛7\'\�\�\�իSԢ\�j�d�h-¨���\�p�_�Û�|\��\"s}g�\�?�ǉmn\�@��\�\�h-\�Ț*\"�hzN�a�y\�*�\�\�8j��<�\�\�t\�܁J�\�\rd����\�yt��c�o@\�\\�1U�K\n����\"t/�ʕ+3�\�]�v\���\�\"�-FzW�\�b᪮ab�R5�X^��oL,�&+\�\�\�b�N�R\�%b\�Ӓ-\�.��\�;p\�\0t\�\"o-\�ih\�cOC�^,~Ƌ����ihscMC\�T�\�7MC~�t�\�lMC��V�X\�\�ӓ	-�;wN\�\�\"��~���4\�e��ag�\�]\�\�\��\���C|7Z�kG��}0B\�\��\�\�C|%�Z >0���0K-\�\�\�Ӯ�ʬTx�9\"~<v\�ؾ}�6nܸiӦ�h\�򖪴�e˖U�V�n7��E�\�\�aCZ�r�z\���\�\�\"Z�A\�\�X\�	Lx\�մ\\�T�\r��*x\�U����\n��+O�i�a!�\���ĕxP߷\�֭K]�����v\ZStvv:��\�ǏG�h_�\�\�Q#�eϴ\\���\�\�\'1>�)R\��Q�Y~ �$\\��\�Q߿,.��,f�I��\\�O�j�{\Z\�_�f���B\�\���xq\�\�	��aHh\�F*˾I\�i*\�\�u�\�\�=UnoY؏�@�*p �\�Y!\��\�ʲɌ\\�r�%gW�}{ZkQ�T�;\"!)�\�\��%/^����\�>����EiZ�\�%|7t}�6={l��c�gE�\�2���\�\���#\r�A�Hh\�y/��\\\���\�<��\�\n�/?\�@\�ŉ\�\�H�yN4�EH\�%$ɝԦ�x\�=0c\�Z?�*ܵR4��SW\�X\�q��_\�OY(/\�\n3r\\�Ň\�\�K�yJ�\�\�F�h-\�0֢Tx�\�Jq`�\�[�_\�y(\��9�Y\�\nխ͒>6&��\"\�ByIj\�\�sܲ�\����B�tK>L�\�\�\"Z�!�E\�7��O&�\"���3�\��|\�޼\�\�\�}�\�0��)f�d��)�\�1۪�Ɨ\�w�\�\"Z��ע�/P��Un�T�\'zD|�y\�~�i9.A~i\�+��� ��$\�\�z\�\"ZD�0�\�W	ש�~�3���j|\���\����4<z5_dC��\�\"�@-\�\"ZD��\�\"ZD��\�\"ZD��\�\"ZD��\�\"ZD��\�\"ZD��\�\"ZD��\�\"ZD��\�\"ZD���\�-��E\�>S�i\��\�\��C�\�л\0�8���x�@�CD�\�\�\�5\\�8�\�	��1\�P\�bF�ꢏ���E��-�-Ҷh1��ZD�\0h1�\�13JǥY�o}\��ִ\�\Z���x\�cqT\�G���L\�\�9~���3\�%\n#�\�\�ʦ��\�O��<�rk1a96&\�^��\�t}\"\0�B�1/�>��k\��i1)/[j�ZLx$v\\f\�Lh\�ٙ\����\�T�g;)R�\�0�\�*ٜ\�q\�\�@�i?�Կ�l6w\��\�S9x��6n\�q\rΦg�2��eG�I%e\�$+��h����6E�Zt\�\�g�`��eZ�6�2\�}���\�\'�aj1�+?fu8\��v�\�I\�\�\�\"=\�0*\�8֢͊��^��\Zmj\�A;f�_�W���yp�¨Т�^�Zt\�8�\�迡�\�s�T�\��\\\�X�\0@�CW���8��Jb�JCp�H�-:�a\�6o\�S��\�f9փ.SI\�\�NoF��q�\�g-¨\�bR]��(g�\�T�O3}�\��բ�q�8F���\�\�q5u-:x�9-f��i���L\��a�k1\�1=C|�\�S*}�ë�.;g`�j\�+�,o�aH;�~^\0�h\0-5h\0�\0�\0\�\"\0\0Z\0@�\0\0h\0\0-\0�E\0\0�\0�\0\�\"\0\0Z\0\0�\0�\0\�\"\0\0Z\0@�\0\0h\0\0-\0d��A^\Z�\�\�\�\�\0\0\0\0IEND�B`�',60001,'com/maben/jbpm/test_1_helloworld/helloworld.png');
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
INSERT INTO `JBPM4_TASK` VALUES (10002,'T',1,'提交申请',NULL,'open',NULL,'员工',NULL,0,'2021-02-17 21:33:26',NULL,NULL,_binary '','helloworld.10001','提交申请',_binary '\0',NULL,10001,10001,NULL,'提交申请'),(50001,'T',1,'审批「总经理」',NULL,'open',NULL,'总经理',NULL,0,'2021-02-17 21:52:13',NULL,NULL,_binary '','helloworld.30001','审批「总经理」',_binary '\0',NULL,30001,30001,NULL,'审批「总经理」');
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
