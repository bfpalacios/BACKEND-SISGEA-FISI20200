CREATE DATABASE  IF NOT EXISTS `sisgea` /*!40100 DEFAULT CHARACTER SET utf8 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `sisgea`;
-- MySQL dump 10.13  Distrib 8.0.16, for Win64 (x86_64)
--
-- Host: 52.14.227.6    Database: sisgea
-- ------------------------------------------------------
-- Server version	8.0.19

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `MAE_CURSO`
--

DROP TABLE IF EXISTS `MAE_CURSO`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `MAE_CURSO` (
  `ID_PLAN` varchar(20) NOT NULL,
  `ID_CURSO` varchar(20) NOT NULL,
  `CICLO` int DEFAULT NULL,
  `ESPECIALIDAD` varchar(20) DEFAULT NULL,
  `DESCRIPCION` varchar(100) DEFAULT NULL,
  `CREDITAJE` decimal(5,2) DEFAULT NULL,
  `TIPO` varchar(4) DEFAULT NULL,
  `GRUPO` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`ID_CURSO`),
  KEY `fk_MAE_CURSO_PLAN_MAE_PLAN_ESTUDIO_idx` (`ID_PLAN`),
  CONSTRAINT `fk_MAE_CURSO_PLAN_MAE_PLAN_ESTUDIO` FOREIGN KEY (`ID_PLAN`) REFERENCES `MAE_PLAN` (`id_plan`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `MAE_CURSO`
--

LOCK TABLES `MAE_CURSO` WRITE;
/*!40000 ALTER TABLE `MAE_CURSO` DISABLE KEYS */;
/*!40000 ALTER TABLE `MAE_CURSO` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `MAE_DOCENTE`
--

DROP TABLE IF EXISTS `MAE_DOCENTE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `MAE_DOCENTE` (
  `ID_DOCENTE` varchar(20) NOT NULL,
  `NOMBRES` varchar(40) DEFAULT NULL,
  `APELLIDOS` varchar(40) DEFAULT NULL,
  `TIPO` varchar(4) DEFAULT NULL,
  PRIMARY KEY (`ID_DOCENTE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `MAE_DOCENTE`
--

LOCK TABLES `MAE_DOCENTE` WRITE;
/*!40000 ALTER TABLE `MAE_DOCENTE` DISABLE KEYS */;
/*!40000 ALTER TABLE `MAE_DOCENTE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `MAE_ESPACIO_ACADEMICO`
--

DROP TABLE IF EXISTS `MAE_ESPACIO_ACADEMICO`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `MAE_ESPACIO_ACADEMICO` (
  `ID_ESPACIO_ACADEMICO` int NOT NULL,
  `DESCRIPCION` varchar(100) DEFAULT NULL,
  `AFORO` int DEFAULT NULL,
  `PABELLON` varchar(20) DEFAULT NULL,
  `TIPO_ESPACIO` varchar(4) DEFAULT NULL,
  `ASIGNABLE` int DEFAULT NULL,
  PRIMARY KEY (`ID_ESPACIO_ACADEMICO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `MAE_ESPACIO_ACADEMICO`
--

LOCK TABLES `MAE_ESPACIO_ACADEMICO` WRITE;
/*!40000 ALTER TABLE `MAE_ESPACIO_ACADEMICO` DISABLE KEYS */;
INSERT INTO `MAE_ESPACIO_ACADEMICO` (`ID_ESPACIO_ACADEMICO`, `DESCRIPCION`, `AFORO`, `PABELLON`, `TIPO_ESPACIO`, `ASIGNABLE`) VALUES (3,'LABORATORIO 3',30,'1','L',1),(4,'LABORATORIO 4',25,'1','L',1),(5,'LABORATORIO 5',20,'1','L',1),(6,'LABORATORIO 6',30,'1','L',1),(7,'LABORATORIO 7',40,'1','L',1),(8,'LABORATORIO 8',40,'1','L',1),(101,'AULA 101',40,'1','A',1),(102,'AULA 102',40,'1','A',1),(103,'AULA 103',40,'1','A',1),(104,'AULA 104',40,'1','A',1),(105,'AULA 105',40,'1','A',1),(106,'AULA 106',40,'1','A',1),(107,'AULA 107',40,'1','A',1),(108,'AULA 108',40,'1','A',1);
/*!40000 ALTER TABLE `MAE_ESPACIO_ACADEMICO` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `MAE_HORARIO`
--

DROP TABLE IF EXISTS `MAE_HORARIO`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `MAE_HORARIO` (
  `ID_HORARIO` int NOT NULL AUTO_INCREMENT,
  `ID_CURSO` varchar(20) NOT NULL,
  `SECCION` int NOT NULL,
  `DIA` varchar(4) DEFAULT NULL,
  `HORARIO_INICIO` varchar(8) DEFAULT NULL,
  `HORARIO_FIN` varchar(8) DEFAULT NULL,
  PRIMARY KEY (`ID_HORARIO`,`ID_CURSO`,`SECCION`),
  KEY `fk_MAE_HORARIO_MAE_PROGRAMACION1_idx` (`SECCION`,`ID_CURSO`),
  CONSTRAINT `fk_MAE_HORARIO_MAE_PROGRAMACION1` FOREIGN KEY (`SECCION`, `ID_CURSO`) REFERENCES `MAE_PROGRAMACION` (`SECCION`, `ID_CURSO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `MAE_HORARIO`
--

LOCK TABLES `MAE_HORARIO` WRITE;
/*!40000 ALTER TABLE `MAE_HORARIO` DISABLE KEYS */;
/*!40000 ALTER TABLE `MAE_HORARIO` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `MAE_HORARIO_DETALLE`
--

DROP TABLE IF EXISTS `MAE_HORARIO_DETALLE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `MAE_HORARIO_DETALLE` (
  `ID_HORARIO_DETALLE` int NOT NULL AUTO_INCREMENT,
  `ID_CURSO` varchar(20) NOT NULL,
  `SECCION` int NOT NULL,
  `ID_HORARIO` int NOT NULL,
  `TIPO_HORARIO` varchar(45) DEFAULT NULL,
  `HORARIO_INICIO` varchar(8) DEFAULT NULL,
  `HORARIO_FIN` varchar(8) DEFAULT NULL,
  PRIMARY KEY (`ID_HORARIO_DETALLE`,`ID_CURSO`,`SECCION`,`ID_HORARIO`),
  KEY `fk_MAE_HORARIO_DETALLE_MAE_HORARIO1_idx` (`ID_HORARIO`,`ID_CURSO`,`SECCION`),
  CONSTRAINT `fk_MAE_HORARIO_DETALLE_MAE_HORARIO1` FOREIGN KEY (`ID_HORARIO`, `ID_CURSO`, `SECCION`) REFERENCES `MAE_HORARIO` (`ID_HORARIO`, `ID_CURSO`, `SECCION`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `MAE_HORARIO_DETALLE`
--

LOCK TABLES `MAE_HORARIO_DETALLE` WRITE;
/*!40000 ALTER TABLE `MAE_HORARIO_DETALLE` DISABLE KEYS */;
/*!40000 ALTER TABLE `MAE_HORARIO_DETALLE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `MAE_MULTITAB_CAB`
--

DROP TABLE IF EXISTS `MAE_MULTITAB_CAB`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `MAE_MULTITAB_CAB` (
  `ID_MULTITAB_CAB` int NOT NULL AUTO_INCREMENT,
  `DESCRIPCION` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`ID_MULTITAB_CAB`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `MAE_MULTITAB_CAB`
--

LOCK TABLES `MAE_MULTITAB_CAB` WRITE;
/*!40000 ALTER TABLE `MAE_MULTITAB_CAB` DISABLE KEYS */;
INSERT INTO `MAE_MULTITAB_CAB` (`ID_MULTITAB_CAB`, `DESCRIPCION`) VALUES (1,'TIPO ESPACIO ACADÉMICO'),(2,'TIPO DOCENTE'),(3,'ESCUELA ACADÉMICA'),(4,'TIPO CURSO'),(5,'TIPO DISPONIBILIDAD'),(6,'TIPO SOLICITANTE'),(7,'ESTADO SOLICITUD'),(8,'TIPO SOLICITUD'),(9,'BASE'),(10,'TURNO'),(11,'DÍA'),(12,'PABELLÓN'),(13,'ESTADO ASISTENCIA');
/*!40000 ALTER TABLE `MAE_MULTITAB_CAB` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `MAE_MULTITAB_DET`
--

DROP TABLE IF EXISTS `MAE_MULTITAB_DET`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `MAE_MULTITAB_DET` (
  `ID_MULTITAB_DET` varchar(4) NOT NULL,
  `ID_MULTITAB_CAB` int NOT NULL,
  `DESCRIPCION_ITEM` varchar(50) DEFAULT NULL,
  `ABREVIATURA` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`ID_MULTITAB_DET`,`ID_MULTITAB_CAB`),
  KEY `fk_MAE_MULTITAB_DET_MAE_MULTITAB_CAB1_idx` (`ID_MULTITAB_CAB`),
  CONSTRAINT `fk_MAE_MULTITAB_DET_MAE_MULTITAB_CAB1` FOREIGN KEY (`ID_MULTITAB_CAB`) REFERENCES `MAE_MULTITAB_CAB` (`ID_MULTITAB_CAB`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `MAE_MULTITAB_DET`
--

LOCK TABLES `MAE_MULTITAB_DET` WRITE;
/*!40000 ALTER TABLE `MAE_MULTITAB_DET` DISABLE KEYS */;
INSERT INTO `MAE_MULTITAB_DET` (`ID_MULTITAB_DET`, `ID_MULTITAB_CAB`, `DESCRIPCION_ITEM`, `ABREVIATURA`) VALUES ('0',13,'POR CONFIRMAR',NULL),('1',13,'ASISTIÓ',NULL),('2006',9,'BASE 6',''),('2007',9,'BASE 7',''),('2008',9,'BASE 8',''),('2009',9,'BASE 9',''),('2010',9,'BASE 10',''),('2011',9,'BASE 11',''),('2012',9,'BASE 12',''),('2013',9,'BASE 13',''),('2014',9,'BASE 14',''),('2015',9,'BASE 15',''),('2016',9,'BASE 16',''),('2017',9,'BASE 17',''),('2018',9,'BASE 18',''),('2019',9,'BASE 19',''),('A',1,'AULA','AUL'),('A',6,'ALUMNO','ALU'),('A',7,'EN REVISIÓN','REV'),('AL',4,'ALTERNATIVO','ALT'),('B',7,'APROBADO','APR'),('C',7,'RECHAZADO','REC'),('C',8,'COMPLEJA','COM'),('D',6,'DOCENTE','DOC'),('D',7,'REPROGRAMADO','REP'),('DO',11,'DOMINGO',''),('E',2,'EXTERNO','EXT'),('E',4,'ELECTIVO','EL'),('E',6,'EXTERNO','EXT'),('I',2,'INTERNO','INT'),('JU',11,'JUEVES',''),('L',1,'LABORATORIO','LAB'),('LU',11,'LUNES',''),('M',10,'MAÑANA','MAN'),('MA',11,'MARTES',''),('MI',11,'MIÉRCOLES',''),('N',10,'NOCHE','NOC'),('O',1,'OTROS','OTR'),('O',4,'OBLIGATORIO','OB'),('P',5,'PRÁCTICA','PR'),('PA',12,'PABELLÓN ANTIGUO','PA'),('PN',12,'PABELLÓN NUEVO','PN'),('S',3,'SISTEMAS','SS'),('S',8,'SIMPLE','SIM'),('SA',11,'SÁBADO',''),('T',5,'TEÓRICA','TE'),('T',10,'TARDE','TAR'),('VI',11,'VIERNES',''),('W',3,'SOTFWARE','SW');
/*!40000 ALTER TABLE `MAE_MULTITAB_DET` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `MAE_PARAMETROS_GENERALES`
--

DROP TABLE IF EXISTS `MAE_PARAMETROS_GENERALES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `MAE_PARAMETROS_GENERALES` (
  `PERIODO` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `MAE_PARAMETROS_GENERALES`
--

LOCK TABLES `MAE_PARAMETROS_GENERALES` WRITE;
/*!40000 ALTER TABLE `MAE_PARAMETROS_GENERALES` DISABLE KEYS */;
INSERT INTO `MAE_PARAMETROS_GENERALES` (`PERIODO`) VALUES ('2020-0');
/*!40000 ALTER TABLE `MAE_PARAMETROS_GENERALES` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `MAE_PLAN`
--

DROP TABLE IF EXISTS `MAE_PLAN`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `MAE_PLAN` (
  `ID_PLAN` varchar(20) NOT NULL,
  `FACULTAD` varchar(4) DEFAULT NULL,
  `ESCUELA` varchar(4) DEFAULT NULL,
  `ESPECIALIDAD` varchar(4) DEFAULT NULL,
  `DESCRIPCION` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`ID_PLAN`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `MAE_PLAN`
--

LOCK TABLES `MAE_PLAN` WRITE;
/*!40000 ALTER TABLE `MAE_PLAN` DISABLE KEYS */;
/*!40000 ALTER TABLE `MAE_PLAN` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `MAE_PRE_REQUISITO`
--

DROP TABLE IF EXISTS `MAE_PRE_REQUISITO`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `MAE_PRE_REQUISITO` (
  `ID_PREREQ` int NOT NULL AUTO_INCREMENT,
  `ID_CURSO` varchar(20) NOT NULL,
  `ID_CURSO_PRE_REQUISITO` varchar(20) NOT NULL,
  `DESCRIPCION_PRE_REQUISITO` varchar(40) DEFAULT NULL,
  `GRUPO_PRE_REQUISITO` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`ID_PREREQ`),
  KEY `fk_MAE_PRE_REQUISITO_MAE_CURSO1_idx` (`ID_CURSO`),
  KEY `fk_MAE_PRE_REQUISITO_MAE_CURSO2_idx` (`ID_CURSO_PRE_REQUISITO`),
  CONSTRAINT `fk_MAE_PRE_REQUISITO_MAE_CURSO1` FOREIGN KEY (`ID_CURSO`) REFERENCES `MAE_CURSO` (`ID_CURSO`),
  CONSTRAINT `fk_MAE_PRE_REQUISITO_MAE_CURSO2` FOREIGN KEY (`ID_CURSO_PRE_REQUISITO`) REFERENCES `MAE_CURSO` (`ID_CURSO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `MAE_PRE_REQUISITO`
--

LOCK TABLES `MAE_PRE_REQUISITO` WRITE;
/*!40000 ALTER TABLE `MAE_PRE_REQUISITO` DISABLE KEYS */;
/*!40000 ALTER TABLE `MAE_PRE_REQUISITO` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `MAE_PROGRAMACION`
--

DROP TABLE IF EXISTS `MAE_PROGRAMACION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `MAE_PROGRAMACION` (
  `SECCION` int NOT NULL,
  `ID_CURSO` varchar(20) NOT NULL,
  `ID_DOCENTE` varchar(20) NOT NULL,
  `PERIODO` varchar(20) DEFAULT NULL,
  `TOPE` int DEFAULT NULL,
  `MATRICULADOS` int DEFAULT NULL,
  `TURNO` varchar(4) DEFAULT NULL,
  `AULA` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`SECCION`,`ID_CURSO`),
  KEY `fk_MAE_PROGRAMACION_MAE_DOCENTE1_idx` (`ID_DOCENTE`),
  KEY `fk_MAE_PROGRAMACION_MAE_CURSO1_idx` (`ID_CURSO`),
  CONSTRAINT `fk_MAE_PROGRAMACION_MAE_CURSO1` FOREIGN KEY (`ID_CURSO`) REFERENCES `MAE_CURSO` (`ID_CURSO`),
  CONSTRAINT `fk_MAE_PROGRAMACION_MAE_DOCENTE1` FOREIGN KEY (`ID_DOCENTE`) REFERENCES `MAE_DOCENTE` (`ID_DOCENTE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `MAE_PROGRAMACION`
--

LOCK TABLES `MAE_PROGRAMACION` WRITE;
/*!40000 ALTER TABLE `MAE_PROGRAMACION` DISABLE KEYS */;
/*!40000 ALTER TABLE `MAE_PROGRAMACION` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `MAE_SOLICITANTE`
--

DROP TABLE IF EXISTS `MAE_SOLICITANTE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `MAE_SOLICITANTE` (
  `ID_SOLICITANTE` int NOT NULL AUTO_INCREMENT,
  `DNI` int DEFAULT NULL,
  `NOMBRES` varchar(40) DEFAULT NULL,
  `APELLIDO_PATERNO` varchar(40) DEFAULT NULL,
  `APELLIDO_MATERNO` varchar(40) DEFAULT NULL,
  `CELULAR` int DEFAULT NULL,
  `EMAIL` varchar(50) DEFAULT NULL,
  `TIPO_SOLICITANTE` varchar(4) DEFAULT NULL,
  `BASE` int DEFAULT NULL,
  `ESCUELA` varchar(4) DEFAULT NULL,
  PRIMARY KEY (`ID_SOLICITANTE`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `MAE_SOLICITANTE`
--

LOCK TABLES `MAE_SOLICITANTE` WRITE;
/*!40000 ALTER TABLE `MAE_SOLICITANTE` DISABLE KEYS */;
INSERT INTO `MAE_SOLICITANTE` (`ID_SOLICITANTE`, `DNI`, `NOMBRES`, `APELLIDO_PATERNO`, `APELLIDO_MATERNO`, `CELULAR`, `EMAIL`, `TIPO_SOLICITANTE`, `BASE`, `ESCUELA`) VALUES (1,4673934,'CARLOS','BRAVO','PEREZ',95573843,'carlos.bravo@unmsm.edu.pe','A',2016,'W'),(2,4673935,'MARCO','MARQUEZ','BRACHO',95573844,'marco.marquez@unmsm.edu.pe','A',2016,'S'),(3,4673936,'FIORELLA','ROJAS','FUENTES',95573845,'fiorella.rojas@unmsm.edu.pe','A',2016,'S'),(4,4673937,'OMAR','LOPEZ','MARIN',95573846,'omar.lopez@unmsm.edu.pe','A',2016,'w'),(5,4673938,'LINDA','PALMA','PEREZ',95573847,'linda.palma@unmsm.edu.pe','A',2016,'w'),(6,4673939,'VERONICA','LODGE','MORAN',95573848,'veronica.lodge@unmsm.edu.pe','A',2016,'w'),(7,4673940,'FILOMENA','FRANCO','LUNA',95573849,'filomena.franco@unmsm.edu.pe','A',2017,'S');
/*!40000 ALTER TABLE `MAE_SOLICITANTE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `MOV_ASIGNACION_RECURSO`
--

DROP TABLE IF EXISTS `MOV_ASIGNACION_RECURSO`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `MOV_ASIGNACION_RECURSO` (
  `ID_ASIGNACION` int NOT NULL AUTO_INCREMENT,
  `ID_ESPACIO_ACADEMICO` int NOT NULL,
  `ID_CURSO` varchar(20) NOT NULL,
  `SECCION` int NOT NULL,
  `ID_HORARIO` int NOT NULL,
  `ID_HORARIO_DETALLE` int NOT NULL,
  `HORARIO_INICIO` varchar(8) DEFAULT NULL,
  `HORARIO_FIN` varchar(8) DEFAULT NULL,
  PRIMARY KEY (`ID_ASIGNACION`),
  KEY `fk_MAE_ASIGNACION_RECURSO_MAE_ESPACIO_ACADEMICO1_idx` (`ID_ESPACIO_ACADEMICO`),
  KEY `fk_MAE_ASIGNACION_RECURSO_MAE_HORARIO_DETALLE1_idx` (`ID_HORARIO_DETALLE`,`ID_CURSO`,`SECCION`,`ID_HORARIO`),
  CONSTRAINT `fk_MAE_ASIGNACION_RECURSO_MAE_ESPACIO_ACADEMICO1` FOREIGN KEY (`ID_ESPACIO_ACADEMICO`) REFERENCES `MAE_ESPACIO_ACADEMICO` (`ID_ESPACIO_ACADEMICO`),
  CONSTRAINT `fk_MAE_ASIGNACION_RECURSO_MAE_HORARIO_DETALLE1` FOREIGN KEY (`ID_HORARIO_DETALLE`, `ID_CURSO`, `SECCION`, `ID_HORARIO`) REFERENCES `MAE_HORARIO_DETALLE` (`ID_HORARIO_DETALLE`, `ID_CURSO`, `SECCION`, `ID_HORARIO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `MOV_ASIGNACION_RECURSO`
--

LOCK TABLES `MOV_ASIGNACION_RECURSO` WRITE;
/*!40000 ALTER TABLE `MOV_ASIGNACION_RECURSO` DISABLE KEYS */;
/*!40000 ALTER TABLE `MOV_ASIGNACION_RECURSO` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `MOV_SOLICITUD`
--

DROP TABLE IF EXISTS `MOV_SOLICITUD`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `MOV_SOLICITUD` (
  `ID_SOLICITUD` int NOT NULL AUTO_INCREMENT,
  `ID_ESPACIO_ACADEMICO` int NOT NULL,
  `ID_SOLICITANTE` int NOT NULL,
  `ESTADO_SOLICITUD` varchar(4) DEFAULT NULL,
  `TIPO_SOLICITUD` varchar(4) DEFAULT NULL,
  `MOTIVO` varchar(200) DEFAULT NULL,
  `FECHA_REGISTRO` date DEFAULT NULL,
  `FECHA_RESERVA` date DEFAULT NULL,
  `HORA_INICIO` varchar(8) DEFAULT NULL,
  `HORA_FIN` varchar(8) DEFAULT NULL,
  `ESTADO_ASISTENCIA` varchar(4) DEFAULT NULL,
  PRIMARY KEY (`ID_SOLICITUD`),
  KEY `fk_MOV_SOLICITUD_MAE_SOLICITANTE1_idx` (`ID_SOLICITANTE`),
  KEY `fk_MOV_SOLICITUD_MAE_ESPACIO_ACADEMICO1_idx` (`ID_ESPACIO_ACADEMICO`),
  CONSTRAINT `fk_MOV_SOLICITUD_MAE_ESPACIO_ACADEMICO1` FOREIGN KEY (`ID_ESPACIO_ACADEMICO`) REFERENCES `MAE_ESPACIO_ACADEMICO` (`ID_ESPACIO_ACADEMICO`),
  CONSTRAINT `fk_MOV_SOLICITUD_MAE_SOLICITANTE1` FOREIGN KEY (`ID_SOLICITANTE`) REFERENCES `MAE_SOLICITANTE` (`ID_SOLICITANTE`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `MOV_SOLICITUD`
--

LOCK TABLES `MOV_SOLICITUD` WRITE;
/*!40000 ALTER TABLE `MOV_SOLICITUD` DISABLE KEYS */;
INSERT INTO `MOV_SOLICITUD` (`ID_SOLICITUD`, `ID_ESPACIO_ACADEMICO`, `ID_SOLICITANTE`, `ESTADO_SOLICITUD`, `TIPO_SOLICITUD`, `MOTIVO`, `FECHA_REGISTRO`, `FECHA_RESERVA`, `HORA_INICIO`, `HORA_FIN`, `ESTADO_ASISTENCIA`) VALUES (3,108,3,NULL,'A','SDADKSAJDSK',NULL,NULL,NULL,NULL,NULL),(4,4,2,'A','A','dfgvhjn','2020-02-13','2020-02-12','20:00','22:00','0'),(5,8,5,'A','A','juqasndujasd','2020-02-13','2020-02-13','12:00','14:00','0');
/*!40000 ALTER TABLE `MOV_SOLICITUD` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SEG_PERFIL`
--

DROP TABLE IF EXISTS `SEG_PERFIL`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `SEG_PERFIL` (
  `ID_PERFIL` int NOT NULL AUTO_INCREMENT,
  `DESCRIPCION` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`ID_PERFIL`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SEG_PERFIL`
--

LOCK TABLES `SEG_PERFIL` WRITE;
/*!40000 ALTER TABLE `SEG_PERFIL` DISABLE KEYS */;
/*!40000 ALTER TABLE `SEG_PERFIL` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SEG_PERFIL_RECURSO`
--

DROP TABLE IF EXISTS `SEG_PERFIL_RECURSO`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `SEG_PERFIL_RECURSO` (
  `ID_PERFIL_RECURSO` int NOT NULL AUTO_INCREMENT,
  `ID_RECURSO` varchar(20) NOT NULL,
  `ID_PERFIL` int NOT NULL,
  PRIMARY KEY (`ID_PERFIL_RECURSO`),
  KEY `fk_SEG_PERFIL_RECURSO_SEG_RECURSO1_idx` (`ID_RECURSO`),
  KEY `fk_SEG_PERFIL_RECURSO_SEG_PERFIL1_idx` (`ID_PERFIL`),
  CONSTRAINT `fk_SEG_PERFIL_RECURSO_SEG_PERFIL1` FOREIGN KEY (`ID_PERFIL`) REFERENCES `SEG_PERFIL` (`ID_PERFIL`),
  CONSTRAINT `fk_SEG_PERFIL_RECURSO_SEG_RECURSO1` FOREIGN KEY (`ID_RECURSO`) REFERENCES `SEG_RECURSO` (`ID_RECURSO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SEG_PERFIL_RECURSO`
--

LOCK TABLES `SEG_PERFIL_RECURSO` WRITE;
/*!40000 ALTER TABLE `SEG_PERFIL_RECURSO` DISABLE KEYS */;
/*!40000 ALTER TABLE `SEG_PERFIL_RECURSO` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SEG_PERFIL_USUARIO`
--

DROP TABLE IF EXISTS `SEG_PERFIL_USUARIO`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `SEG_PERFIL_USUARIO` (
  `ID_USUARIO_PERFIL` int NOT NULL AUTO_INCREMENT,
  `USERNAME` varchar(20) NOT NULL,
  `ID_PERFIL` int NOT NULL,
  PRIMARY KEY (`ID_USUARIO_PERFIL`),
  KEY `fk_SEG_PERFIL_USUARIO_SEG_USUARIO1_idx` (`USERNAME`),
  KEY `fk_SEG_PERFIL_USUARIO_SEG_PERFIL1_idx` (`ID_PERFIL`),
  CONSTRAINT `fk_SEG_PERFIL_USUARIO_SEG_PERFIL1` FOREIGN KEY (`ID_PERFIL`) REFERENCES `SEG_PERFIL` (`ID_PERFIL`),
  CONSTRAINT `fk_SEG_PERFIL_USUARIO_SEG_USUARIO1` FOREIGN KEY (`USERNAME`) REFERENCES `SEG_USUARIO` (`USERNAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SEG_PERFIL_USUARIO`
--

LOCK TABLES `SEG_PERFIL_USUARIO` WRITE;
/*!40000 ALTER TABLE `SEG_PERFIL_USUARIO` DISABLE KEYS */;
/*!40000 ALTER TABLE `SEG_PERFIL_USUARIO` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SEG_RECURSO`
--

DROP TABLE IF EXISTS `SEG_RECURSO`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `SEG_RECURSO` (
  `ID_RECURSO` varchar(20) NOT NULL,
  `ID_CATEGORIA_RECURSO` varchar(4) DEFAULT NULL,
  `DECSRIPCION` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`ID_RECURSO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SEG_RECURSO`
--

LOCK TABLES `SEG_RECURSO` WRITE;
/*!40000 ALTER TABLE `SEG_RECURSO` DISABLE KEYS */;
/*!40000 ALTER TABLE `SEG_RECURSO` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SEG_USUARIO`
--

DROP TABLE IF EXISTS `SEG_USUARIO`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `SEG_USUARIO` (
  `USERNAME` varchar(20) NOT NULL,
  `NOMBRES` varchar(40) DEFAULT NULL,
  `APELLIDOS` varchar(40) DEFAULT NULL,
  `PASSWORD` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`USERNAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SEG_USUARIO`
--

LOCK TABLES `SEG_USUARIO` WRITE;
/*!40000 ALTER TABLE `SEG_USUARIO` DISABLE KEYS */;
/*!40000 ALTER TABLE `SEG_USUARIO` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `VIE_CON_ASIGNACION_ESPACIO_ACADEMICO`
--

DROP TABLE IF EXISTS `VIE_CON_ASIGNACION_ESPACIO_ACADEMICO`;
/*!50001 DROP VIEW IF EXISTS `VIE_CON_ASIGNACION_ESPACIO_ACADEMICO`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
/*!50001 CREATE VIEW `VIE_CON_ASIGNACION_ESPACIO_ACADEMICO` AS SELECT 
 1 AS `ID`,
 1 AS `ID_ASIGNACION`,
 1 AS `ID_ESPACIO_ACADEMICO`,
 1 AS `CICLO`,
 1 AS `ID_CURSO`,
 1 AS `CURSO`,
 1 AS `SECCION`,
 1 AS `ID_DOCENTE`,
 1 AS `NOMBRES_DOCENTE`,
 1 AS `TOPE`,
 1 AS `MATRICULADOS`,
 1 AS `TURNO`,
 1 AS `DESCRIPCION_TURNO`,
 1 AS `TIPO_HORARIO`,
 1 AS `DESCRIPCION_TIPO_HORARIO`,
 1 AS `DIA`,
 1 AS `DESCRIPCION_DIA`,
 1 AS `ID_HORARIO`,
 1 AS `ID_HORARIO_DETALLE`,
 1 AS `HORARIO_INICIO`,
 1 AS `HORARIO_FIN`,
 1 AS `ESPACIO`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `VIE_MANT_MAE_PARAMETROS_GENERALES`
--

DROP TABLE IF EXISTS `VIE_MANT_MAE_PARAMETROS_GENERALES`;
/*!50001 DROP VIEW IF EXISTS `VIE_MANT_MAE_PARAMETROS_GENERALES`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
/*!50001 CREATE VIEW `VIE_MANT_MAE_PARAMETROS_GENERALES` AS SELECT 
 1 AS `PERIODO`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `VIE_MAN_CURSO`
--

DROP TABLE IF EXISTS `VIE_MAN_CURSO`;
/*!50001 DROP VIEW IF EXISTS `VIE_MAN_CURSO`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
/*!50001 CREATE VIEW `VIE_MAN_CURSO` AS SELECT 
 1 AS `ID_PLAN`,
 1 AS `ID_CURSO`,
 1 AS `CICLO`,
 1 AS `ESPECIALIDAD`,
 1 AS `DESCRIPCION`,
 1 AS `CREDITAJE`,
 1 AS `TIPO`,
 1 AS `GRUPO`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `VIE_MAN_DOCENTE`
--

DROP TABLE IF EXISTS `VIE_MAN_DOCENTE`;
/*!50001 DROP VIEW IF EXISTS `VIE_MAN_DOCENTE`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
/*!50001 CREATE VIEW `VIE_MAN_DOCENTE` AS SELECT 
 1 AS `ID_DOCENTE`,
 1 AS `NOMBRES`,
 1 AS `APELLIDOS`,
 1 AS `TIPO`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `VIE_MAN_ESPACIO_ACADEMICO`
--

DROP TABLE IF EXISTS `VIE_MAN_ESPACIO_ACADEMICO`;
/*!50001 DROP VIEW IF EXISTS `VIE_MAN_ESPACIO_ACADEMICO`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
/*!50001 CREATE VIEW `VIE_MAN_ESPACIO_ACADEMICO` AS SELECT 
 1 AS `ID_ESPACIO_ACADEMICO`,
 1 AS `DESCRIPCION_ESPACIO_ACADEMICO`,
 1 AS `AFORO`,
 1 AS `PABELLON`,
 1 AS `TIPO_ESPACIO`,
 1 AS `DESCRIPCION_TIPO_ESPACIO`,
 1 AS `ASIGNABLE`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `VIE_MAN_HORARIO`
--

DROP TABLE IF EXISTS `VIE_MAN_HORARIO`;
/*!50001 DROP VIEW IF EXISTS `VIE_MAN_HORARIO`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
/*!50001 CREATE VIEW `VIE_MAN_HORARIO` AS SELECT 
 1 AS `ID_HORARIO`,
 1 AS `ID_CURSO`,
 1 AS `DESC_CURSO`,
 1 AS `SECCION`,
 1 AS `DIA`,
 1 AS `HORARIO_INICIO`,
 1 AS `HORARIO_FIN`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `VIE_MAN_HORARIO_DETALLE`
--

DROP TABLE IF EXISTS `VIE_MAN_HORARIO_DETALLE`;
/*!50001 DROP VIEW IF EXISTS `VIE_MAN_HORARIO_DETALLE`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
/*!50001 CREATE VIEW `VIE_MAN_HORARIO_DETALLE` AS SELECT 
 1 AS `ID_HORARIO_DETALLE`,
 1 AS `ID_CURSO`,
 1 AS `DESC_CURSO`,
 1 AS `SECCION`,
 1 AS `ID_HORARIO`,
 1 AS `TIPO_HORARIO`,
 1 AS `HORARIO_INICIO`,
 1 AS `HORARIO_FIN`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `VIE_MAN_MULTITAB_CAB`
--

DROP TABLE IF EXISTS `VIE_MAN_MULTITAB_CAB`;
/*!50001 DROP VIEW IF EXISTS `VIE_MAN_MULTITAB_CAB`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
/*!50001 CREATE VIEW `VIE_MAN_MULTITAB_CAB` AS SELECT 
 1 AS `ID_MULTITAB_CAB`,
 1 AS `DESCRIPCION_MULTITAB_CAB`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `VIE_MAN_MULTITAB_DET`
--

DROP TABLE IF EXISTS `VIE_MAN_MULTITAB_DET`;
/*!50001 DROP VIEW IF EXISTS `VIE_MAN_MULTITAB_DET`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
/*!50001 CREATE VIEW `VIE_MAN_MULTITAB_DET` AS SELECT 
 1 AS `ID_MULTITAB_CAB`,
 1 AS `DESCRIPCION_MULTITAB_CAB`,
 1 AS `ID_MULTITAB_DET`,
 1 AS `DESCRIPCION_ITEM`,
 1 AS `ABREVIATURA`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `VIE_MAN_PLAN_ACADEMICO`
--

DROP TABLE IF EXISTS `VIE_MAN_PLAN_ACADEMICO`;
/*!50001 DROP VIEW IF EXISTS `VIE_MAN_PLAN_ACADEMICO`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
/*!50001 CREATE VIEW `VIE_MAN_PLAN_ACADEMICO` AS SELECT 
 1 AS `ID_PLAN`,
 1 AS `DESCRIPCION_PLAN`,
 1 AS `FACULTAD`,
 1 AS `ESCUELA`,
 1 AS `DESCRIPCION_ESCUELA`,
 1 AS `ESPECIALIDAD`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `VIE_MAN_PROGRAMACION_ACADEMICA`
--

DROP TABLE IF EXISTS `VIE_MAN_PROGRAMACION_ACADEMICA`;
/*!50001 DROP VIEW IF EXISTS `VIE_MAN_PROGRAMACION_ACADEMICA`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
/*!50001 CREATE VIEW `VIE_MAN_PROGRAMACION_ACADEMICA` AS SELECT 
 1 AS `ID_CURSO`,
 1 AS `DESCRIPCION_CURSO`,
 1 AS `SECCION`,
 1 AS `ID_DOCENTE`,
 1 AS `NOMBRES_DOCENTE`,
 1 AS `TOPE`,
 1 AS `MATRICULADOS`,
 1 AS `TURNO`,
 1 AS `DESCRIPCION_TURNO`,
 1 AS `AULA`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `VIE_MAN_SOLICITANTE`
--

DROP TABLE IF EXISTS `VIE_MAN_SOLICITANTE`;
/*!50001 DROP VIEW IF EXISTS `VIE_MAN_SOLICITANTE`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
/*!50001 CREATE VIEW `VIE_MAN_SOLICITANTE` AS SELECT 
 1 AS `ID_SOLICITANTE`,
 1 AS `DNI`,
 1 AS `NOMBRES`,
 1 AS `APELLIDO_PATERNO`,
 1 AS `APELLIDO_MATERNO`,
 1 AS `CELULAR`,
 1 AS `EMAIL`,
 1 AS `TIPO_SOLICITANTE`,
 1 AS `DESCRIPCION_TIPO_SOLICITANTE`,
 1 AS `BASE`,
 1 AS `ESCUELA`,
 1 AS `DESCRIPCION_ESCUELA`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `VIE_SOLICITUD`
--

DROP TABLE IF EXISTS `VIE_SOLICITUD`;
/*!50001 DROP VIEW IF EXISTS `VIE_SOLICITUD`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
/*!50001 CREATE VIEW `VIE_SOLICITUD` AS SELECT 
 1 AS `ID_SOLICITUD`,
 1 AS `ID_ESPACIO_ACADEMICO`,
 1 AS `DESCRIPCION_ESPACIO_ACADEMICO`,
 1 AS `ID_SOLICITANTE`,
 1 AS `DNI`,
 1 AS `NOMBRES`,
 1 AS `APELLIDO_PATERNO`,
 1 AS `APELLIDO_MATERNO`,
 1 AS `ESTADO_SOLICITUD`,
 1 AS `DESCRIPCION_ESTADO_SOLICITUD`,
 1 AS `TIPO_SOLICITUD`,
 1 AS `DESCRIPCION_TIPO_SOLICITUD`,
 1 AS `MOTIVO`,
 1 AS `FECHA_REGISTRO`,
 1 AS `FECHA_RESERVA`,
 1 AS `HORA_INICIO`,
 1 AS `HORA_FIN`,
 1 AS `ESTADO_ASISTENCIA`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vie_con_estado_espacios_academicos`
--

DROP TABLE IF EXISTS `vie_con_estado_espacios_academicos`;
/*!50001 DROP VIEW IF EXISTS `vie_con_estado_espacios_academicos`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
/*!50001 CREATE VIEW `vie_con_estado_espacios_academicos` AS SELECT 
 1 AS `ID`,
 1 AS `ID_ASIGNACION`,
 1 AS `HORARIO`,
 1 AS `ID_ESPACIO_ACADEMICO`,
 1 AS `DESCRIPCION_ESPACIO_ACADEMICO`,
 1 AS `ID_CURSO`,
 1 AS `DESCRIPCION_CURSO`,
 1 AS `DIA`,
 1 AS `ID_HORARIO_DETALLE`,
 1 AS `TIPO_HORARIO`*/;
SET character_set_client = @saved_cs_client;

--
-- Dumping events for database 'sisgea'
--

--
-- Dumping routines for database 'sisgea'
--
/*!50003 DROP FUNCTION IF EXISTS `rownum` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `rownum`() RETURNS int
    DETERMINISTIC
BEGIN
  set @prvrownum=if(@ranklastrun=CURTIME(6),@prvrownum+1,1);
  set @ranklastrun=CURTIME(6);
  RETURN @prvrownum;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `PRC_ASIGNACION_ESPACIO_ACADEMICO` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `PRC_ASIGNACION_ESPACIO_ACADEMICO`()
BEGIN
    -- DECLARAMOS VARIABLES LOCALES PARA CADA REGISTRO DE LECTURA
    DECLARE l_id_espacio_academico	INT;
    DECLARE l_ID_CURSO				VARCHAR(20);
    DECLARE l_SECCION				INT;
    DECLARE l_id_horario			INT;
    DECLARE l_id_horario_detalle	INT;
    DECLARE l_horario_inicio		VARCHAR(8);
    DECLARE l_horario_fin			VARCHAR(8);
    DECLARE l_matriculados			INT;
    DECLARE l_tipo_horario			VARCHAR(4);
    DECLARE l_aforo					INT;
    DECLARE l_turno					VARCHAR(4);
    DECLARE l_dia					VARCHAR(4);
    
    -- DECLARANDO VARIABLES EXTRAS
    DECLARE l_periodo VARCHAR(20) default (select periodo from MAE_PARAMETROS_GENERALES);
    DECLARE l_contador INT DEFAULT 0;
    DECLARE termina	BOOLEAN DEFAULT FALSE;
    
    -- DEFINIMOS LA CONSULTA
    DECLARE cursor_asignacion_espacio CURSOR
    FOR
        SELECT 		
			A.ID_CURSO,
			A.SECCION,
			A.ID_HORARIO,
			A.ID_HORARIO_DETALLE,
			A.HORARIO_INICIO,
			A.HORARIO_FIN,
            A.TIPO_HORARIO,
		    B.MATRICULADOS,
            C.DIA
		FROM MAE_HORARIO_DETALLE A
		INNER JOIN MAE_PROGRAMACION	B	ON A.ID_CURSO = B.ID_CURSO
			AND A.SECCION	= B.SECCION
		INNER JOIN MAE_HORARIO C	ON	A.ID_HORARIO = C.ID_HORARIO
		ORDER BY B.MATRICULADOS DESC;
            
    -- DECLARAMOS UN MANEJADOR DE ERROR "NOT FOUND"
	DECLARE CONTINUE HANDLER FOR NOT FOUND SET termina = TRUE;
    
    OPEN cursor_asignacion_espacio;
	loop1: LOOP
    FETCH cursor_asignacion_espacio 
    INTO
        l_ID_CURSO,
        l_SECCION,
        l_id_horario,
        l_id_horario_detalle,
        l_horario_inicio,
        l_horario_fin,
        l_tipo_horario,
        l_matriculados,
        l_dia;
        -- SI NOS QUEDAMOS SIN ELEMENTOS SALIMOS DEL BUCLE
		IF termina THEN
			LEAVE loop1;
		END IF;
        
        IF l_tipo_horario = 'T' OR l_tipo_horario = 'P' THEN
			SET @tipo_espacio = 'A';
		ELSEIF l_tipo_horario = 'L' THEN
			SET @tipo_espacio = 'L';
        END IF;
        
        SET @espacio_asignado = (
				SELECT
					A.ID_ESPACIO_ACADEMICO
				FROM MAE_ESPACIO_ACADEMICO A
				INNER JOIN MOV_ASIGNACION_RECURSO B	ON A.ID_ESPACIO_ACADEMICO = B.ID_ESPACIO_ACADEMICO
				INNER JOIN MAE_HORARIO C  ON c.ID_HORARIO = B.ID_HORARIO
                WHERE CAST(substring(B.HORARIO_INICIO,1,2) AS UNSIGNED) >= l_horario_inicio
					AND CAST(substring(B.HORARIO_FIN,1,2) AS UNSIGNED) <= l_horario_fin
					AND C.DIA= l_dia
				LIMIT 1
			);
        
        
        
        -- define el id del espacio a asignar
        IF @espacio_asignado IS NOT NULL THEN
			SET @espacio_academico = (
				SELECT
					A.ID_ESPACIO_ACADEMICO
				FROM MAE_ESPACIO_ACADEMICO A 
				WHERE A.ID_ESPACIO_ACADEMICO != @espacio_asignado
					AND A.TIPO_ESPACIO	= @tipo_espacio
					AND A.AFORO	>= l_matriculados
				LIMIT 1
			);
		ELSE
			SET @espacio_academico = (
				SELECT
					A.ID_ESPACIO_ACADEMICO
				FROM MAE_ESPACIO_ACADEMICO A 
				WHERE A.ID_ESPACIO_ACADEMICO IS NOT NULL
					AND A.TIPO_ESPACIO	= CASE WHEN l_tipo_horario='T' THEN 'A' ELSE 'L' END 
					AND A.AFORO	>= l_matriculados
				LIMIT 1
			);
        END IF;
        
        -- asigna a la variable local el id_espacio_academico
        SET l_id_espacio_academico = @espacio_academico;
		
        -- si no existe un registro con las mismas características (MATRICULADOS <= AFORO)
		IF @espacio_academico IS NOT NULL THEN
			INSERT INTO MOV_ASIGNACION_RECURSO(
				ID_ESPACIO_ACADEMICO,
				ID_CURSO,
				SECCION,
				ID_HORARIO,
				ID_HORARIO_DETALLE,
				HORARIO_INICIO,
				HORARIO_FIN
			)
			VALUES (
				l_id_espacio_academico,
				l_ID_CURSO,
				l_SECCION,
				l_id_horario,
				l_id_horario_detalle,
				l_horario_inicio,
				l_horario_fin
			);
            COMMIT;
            -- SELECT * FROM MOV_ASIGNACION_RECURSO;
        END IF;
        
        -- PARA LLEVAR LA CUENTA DE CUÁNTOS REGISTROS ESTOS USANDO DE PIVOT
        SET l_contador = l_contador + 1;
        
    END LOOP;
    CLOSE cursor_asignacion_espacio;
    -- SELECT l_contador;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `PRC_ASIGNACION_ESPACIO_SOLICITANTE` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `PRC_ASIGNACION_ESPACIO_SOLICITANTE`(
	IN		PI_MODO						VARCHAR(20),		
	INOUT 	PIO_ID_SOLICITUD			INT,
	IN		PI_ID_ESPACIO_ACADEMICO		INT,
    IN 		PI_ID_SOLICITANTE			INT,
    IN		PI_ESTADO_SOLICITUD			VARCHAR(4),
    IN		PI_TIPO_SOLICITUD			VARCHAR(4),
    IN		PI_MOTIVO					VARCHAR(200),
    IN		PI_FECHA_REGISTRO			DATE,
    IN		PI_FECHA_RESERVA			DATE,
    IN		PI_HORA_INICIO				VARCHAR(10),
    IN		PI_HORA_FIN					VARCHAR(10),
    IN		PI_ESTADO_ASISTENCIA		VARCHAR(4)
)
BEGIN
	IF PI_MODO = 'INSERT' THEN
		INSERT INTO MOV_SOLICITUD (
			ID_ESPACIO_ACADEMICO,
			ID_SOLICITANTE,
			ESTADO_SOLICITUD,
			TIPO_SOLICITUD,
			MOTIVO,
			FECHA_REGISTRO,
			FECHA_RESERVA,
			HORA_INICIO,
			HORA_FIN,
			ESTADO_ASISTENCIA)
		VALUES(
			PI_ID_ESPACIO_ACADEMICO,
            PI_ID_SOLICITANTE,
            'A',
            PI_TIPO_SOLICITUD,
            PI_MOTIVO,
            sysdate(),
            PI_FECHA_RESERVA,
            PI_HORA_INICIO,
            PI_HORA_FIN,
            '0'
        );
        SELECT LAST_INSERT_ID() INTO PIO_ID_SOLICITUD;
	ELSEIF PI_MODO = 'UPDATE' THEN
		UPDATE MOV_SOLICITUD
		SET
            ID_ESPACIO_ACADEMICO	= PI_ID_ESPACIO_ACADEMICO,
			ID_SOLICITANTE			= PI_ID_SOLICITANTE,
            ESTADO_SOLICITUD		= PI_ESTADO_SOLICITUD,
			TIPO_SOLICITUD			= PI_TIPO_SOLICITUD,
            MOTIVO					= PI_MOTIVO,
            FECHA_REGISTRO			= PI_FECHA_REGISTRO,
            FECHA_RESERVA			= PI_FECHA_RESERVA,
            HORA_INICIO				= PI_HORA_INICIO,
            HORA_FIN				= PI_HORA_FIN,
            ESTADO_ASISTENCIA		= PI_ESTADO_ASISTENCIA
		WHERE ID_SOLICITUD	= PIO_ID_SOLICITUD;
	ELSEIF PI_MODO = 'DELETE' THEN
		DELETE FROM MOV_SOLICITUD
		WHERE ID_SOLICITUD = PIO_ID_SOLICITUD;
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `PRC_ASIGNACION_MANUAL_ESPACIO_ACADEMICO` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`sisgea`@`%` PROCEDURE `PRC_ASIGNACION_MANUAL_ESPACIO_ACADEMICO`(
  IN  PI_MODO						      VARCHAR(20),		
  IN  PI_ID_ASIGNACION		    INT,
  IN  PI_ID_ESPACIO_ACADEMICO INT,
  IN  PI_ID_CURSO             VARCHAR(20),
  IN  PI_SECCION              INT,
  IN  PI_ID_HORARIO           INT,
  IN  PI_ID_HORARIO_DETALLE   INT,
  IN  PI_HORARIO_INICIO			  VARCHAR(8),
  IN  PI_HORARIO_FIN				  VARCHAR(8)
)
BEGIN
  IF PI_MODO = 'UPDATE' THEN
		UPDATE MOV_ASIGNACION_RECURSO
		SET
      ID_ESPACIO_ACADEMICO  = PI_ID_ESPACIO_ACADEMICO,
      ID_CURSO              = PI_ID_CURSO,
      SECCION               = PI_SECCION,
      ID_HORARIO            = PI_ID_HORARIO,
      ID_HORARIO_DETALLE    = PI_ID_HORARIO_DETALLE,
      HORARIO_INICIO        = PI_HORARIO_INICIO,
      HORARIO_FIN           = PI_HORARIO_FIN
		WHERE ID_ASIGNACION = PI_ID_ASIGNACION;
	ELSEIF PI_MODO = 'DELETE' THEN
		DELETE FROM MOV_ASIGNACION_RECURSO
		WHERE ID_ASIGNACION = PI_ID_ASIGNACION;
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `PRC_MANT_MAE_DOCENTE` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `PRC_MANT_MAE_DOCENTE`(
	IN		PI_MODO			VARCHAR(20),
	IN		PI_ID_DOCENTE	VARCHAR(20),
	IN		PI_NOMBRES		VARCHAR(40),
	IN		PI_APELLIDOS	VARCHAR(20),
    IN		PI_TIPO			VARCHAR(4)
)
BEGIN
    IF PI_MODO = 'INSERT' THEN
		INSERT INTO MAE_DOCENTE(
			ID_DOCENTE,
			NOMBRES,
			APELLIDOS,
            TIPO)
		VALUES(
			PI_ID_DOCENTE,
			PI_NOMBRES,
			PI_APELLIDOS,
            PI_TIPO);
	ELSEIF PI_MODO = 'UPDATE' THEN
		UPDATE MAE_DOCENTE
		SET
			NOMBRES		= PI_NOMBRES,
            APELLIDOS	= PI_APELLIDOS,
            TIPO		= PI_TIPO
		WHERE ID_DOCENTE	= PI_ID_DOCENTE;
	ELSEIF PI_MODO = 'DELETE' THEN
		DELETE FROM MAE_DOCENTE
		WHERE ID_DOCENTE	= PI_ID_DOCENTE;
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `PRC_MANT_MAE_ESPACIO_ACADEMICO` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `PRC_MANT_MAE_ESPACIO_ACADEMICO`(
	IN		PI_MODO					VARCHAR(20),
	IN		PI_ID_ESPACIO_ACADEMICO	INT,
	IN		PI_DESCRIPCION			VARCHAR(40),
	IN		PI_AFORO				INT,
	IN		PI_PABELLON				VARCHAR(20),
    IN		PI_TIPO_ESPACIO			VARCHAR(4),
    in		PI_ASIGNABLE			INT
)
BEGIN
    IF PI_MODO = 'INSERT' THEN
		INSERT INTO MAE_ESPACIO_ACADEMICO(
			ID_ESPACIO_ACADEMICO,
			DESCRIPCION,
			AFORO,
            PABELLON,
            TIPO_ESPACIO,
            ASIGNABLE)
		VALUES(
			PI_ID_ESPACIO_ACADEMICO,
			PI_DESCRIPCION,
			PI_AFORO,
            PI_PABELLON,
            PI_TIPO_ESPACIO,
            PI_ASIGNABLE);
	ELSEIF PI_MODO = 'UPDATE' THEN
		UPDATE MAE_ESPACIO_ACADEMICO
		SET
			DESCRIPCION				= PI_DESCRIPCION,
			AFORO					= PI_AFORO,
            PABELLON				= PI_PABELLON,
            TIPO_ESPACIO			= PI_TIPO_ESPACIO,
            ASIGNABLE				= PI_ASIGNABLE
		WHERE ID_ESPACIO_ACADEMICO	= PI_ID_ESPACIO_ACADEMICO;
	ELSEIF PI_MODO = 'DELETE' THEN
		DELETE FROM MAE_ESPACIO_ACADEMICO
		WHERE ID_ESPACIO_ACADEMICO = PI_ID_ESPACIO_ACADEMICO;
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `PRC_MANT_MAE_MULTITAB_CAB` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `PRC_MANT_MAE_MULTITAB_CAB`(
	IN		PI_MODO				VARCHAR(20),
	INOUT	PIO_ID_MULTITAB_CAB	INT,
	IN		PI_DESCRIPCION		VARCHAR(100)
)
BEGIN
    IF PI_MODO = 'INSERT' THEN
		INSERT INTO MAE_MULTITAB_CAB(
			DESCRIPCION)
		VALUES(
			PI_DESCRIPCION);
		SELECT LAST_INSERT_ID() INTO PIO_ID_MULTITAB_CAB;
	ELSEIF PI_MODO = 'UPDATE' THEN
		UPDATE MAE_MULTITAB_CAB
		SET
			DESCRIPCION	= PI_DESCRIPCION
		WHERE ID_MULTITAB_CAB	= PIO_ID_MULTITAB_CAB;
	ELSEIF PI_MODO = 'DELETE' THEN
		DELETE FROM MAE_MULTITAB_CAB
		WHERE ID_MULTITAB_CAB	= PIO_ID_MULTITAB_CAB;
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `PRC_MANT_MAE_MULTITAB_DET` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `PRC_MANT_MAE_MULTITAB_DET`(
	IN		PI_MODO				VARCHAR(20),
	IN		PI_ID_MULTITAB_DET	VARCHAR(4),
    IN		PI_ID_MULTITAB_CAB	INT,
	IN		PI_DESCRIPCION_ITEM	VARCHAR(50),
    IN		PI_ABREVIATURA		VARCHAR(10)
)
BEGIN
    IF PI_MODO = 'INSERT' THEN
		INSERT INTO MAE_MULTITAB_DET(
			ID_MULTITAB_DET,
            ID_MULTITAB_CAB,
            DESCRIPCION_ITEM,
            ABREVIATURA)
		VALUES(
			PI_ID_MULTITAB_DET,
            PI_ID_MULTITAB_CAB,
            PI_DESCRIPCION_ITEM,
            PI_ABREVIATURA);
	ELSEIF PI_MODO = 'UPDATE' THEN
		UPDATE MAE_MULTITAB_DET
		SET
			DESCRIPCION_ITEM	= PI_DESCRIPCION_ITEM,
            ABREVIATURA			= PI_ABREVIATURA
		WHERE ID_MULTITAB_DET	= PI_ID_MULTITAB_DET
			AND ID_MULTITAB_CAB	= PI_ID_MULTITAB_CAB;
	ELSEIF PI_MODO = 'DELETE' THEN
		DELETE FROM MAE_MULTITAB_DET
		WHERE ID_MULTITAB_DET	= PI_ID_MULTITAB_DET
			AND ID_MULTITAB_CAB	= PI_ID_MULTITAB_CAB;
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `PRC_MANT_MAE_PARAMETROS_GENERALES` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `PRC_MANT_MAE_PARAMETROS_GENERALES`(
	IN		PI_MODO			VARCHAR(20),
	IN		PI_PERIODO		VARCHAR(20)
)
BEGIN
	IF PI_MODO = 'UPDATE' THEN
		UPDATE MAE_PARAMETROS_GENERALES
		SET
            PERIODO		= PI_PERIODO;
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `PRC_MANT_MAE_PRE_REQUISITO` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `PRC_MANT_MAE_PRE_REQUISITO`(
	IN		PI_MODO							VARCHAR(20),
	INOUT	PIO_ID_PREREQ					INT,
	IN		PI_ID_CURSO						VARCHAR(20),
	IN		PI_ID_CURSO_PRE_REQUISITO		VARCHAR(20),
	IN		PI_DESCRIPCION_PRE_REQUISITO	VARCHAR(40),
    IN		PI_GRUPO_PRE_REQUISITO			VARCHAR(40)
)
BEGIN
    IF PI_MODO = 'INSERT' THEN
		INSERT INTO MAE_PRE_REQUISITO(
			ID_CURSO,
			ID_CURSO_PRE_REQUISITO,
			DESCRIPCION_PRE_REQUISITO,
            GRUPO_PRE_REQUISITO)
		VALUES(
			PI_ID_CURSO,
			PI_ID_CURSO_PRE_REQUISITO,
			PI_DESCRIPCION_PRE_REQUISITO,
            PI_GRUPO_PRE_REQUISITO);
		SELECT LAST_INSERT_ID() INTO PIO_ID_PREREQ;
	ELSEIF PI_MODO = 'UPDATE' THEN
		UPDATE MAE_PRE_REQUISITO
		SET
			ID_CURSO 					= PI_ID_CURSO,
			ID_CURSO_PRE_REQUISITO		= PI_ID_CURSO_PRE_REQUISITO,
			DESCRIPCION_PRE_REQUISITO	= PI_DESCRIPCION_PRE_REQUISITO,
            GRUPO_PRE_REQUISITO			= PI_GRUPO_PRE_REQUISITO
		WHERE ID_PREREQ	= PIO_ID_PREREQ;
	ELSEIF PI_MODO = 'DELETE' THEN
		DELETE FROM MAE_PRE_REQUISITO
		WHERE ID_PREREQ = PIO_ID_PREREQ;
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `PRC_MANT_MAE_SOLICITANTE` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `PRC_MANT_MAE_SOLICITANTE`(
	IN		PI_MODO				VARCHAR(20),
	INOUT	PIO_SOLICITANTE		INT,
    IN		PI_DNI				INT,
    IN		PI_NOMBRES			VARCHAR(40),
	IN		PI_APELLIDO_PATERNO	VARCHAR(40),
    IN		PI_APELLIDO_MATERNO	VARCHAR(40),
    IN		PI_CELULAR			INT,
    IN		PI_EMAIL			VARCHAR(50),
    IN		PI_TIPO_SOLICITANTE	VARCHAR(4),
    IN		PI_BASE				INT,
    IN		PI_ESCUELA			VARCHAR(4)
)
BEGIN
    IF PI_MODO = 'INSERT' THEN
		INSERT INTO MAE_SOLICITANTE(
            DNI,
            NOMBRES,
            APELLIDO_PATERNO,
            APELLIDO_MATERNO,
            CELULAR,
            EMAIL,
            TIPO_SOLICITANTE,
            BASE,
            ESCUELA)
		VALUES(
            PI_DNI,
            PI_NOMBRES,
            PI_APELLIDO_PATERNO,
            PI_APELLIDO_MATERNO,
            PI_CELULAR,
            PI_EMAIL,
            PI_TIPO_SOLICITANTE,
            PI_BASE,
            PI_ESCUELA);
		SELECT LAST_INSERT_ID() INTO PIO_SOLICITANTE;
	ELSEIF PI_MODO = 'UPDATE' THEN
		UPDATE MAE_SOLICITANTE
		SET
			DNI					= PI_DNI,
			NOMBRES				= PI_NOMBRES,
            APELLIDO_PATERNO	= PI_APELLIDO_PATERNO,
            APELLIDO_MATERNO	= PI_APELLIDO_MATERNO,
            CELULAR				= PI_CELULAR,
            EMAIL				= PI_EMAIL,
            TIPO_SOLICITANTE	= PI_TIPO_SOLICITANTE,
            BASE				= PI_BASE,
            ESCUELA				= PI_ESCUELA
		WHERE ID_SOLICITANTE	= PIO_SOLICITANTE;
	ELSEIF PI_MODO = 'DELETE' THEN
		DELETE FROM MAE_SOLICITANTE
		WHERE ID_SOLICITANTE	= PIO_SOLICITANTE;
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `PRC_MANT_SEG_PERFIL` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `PRC_MANT_SEG_PERFIL`(
	IN		PI_MODO			VARCHAR(20),
	INOUT	PIO_ID_PERFIL	INT,
	IN		PI_DESCRIPCION	VARCHAR(50)
)
BEGIN
    IF PI_MODO = 'INSERT' THEN
		INSERT INTO SEG_PERFIL(
			DESCRIPCION)
		VALUES(
			PI_DESCRIPCION);
		SELECT LAST_INSERT_ID() INTO PIO_ID_PERFIL;
	ELSEIF PI_MODO = 'UPDATE' THEN
		UPDATE SEG_PERFIL
		SET
			DESCRIPCION	= PI_DESCRIPCION
		WHERE ID_PERFIL	= PIO_ID_PERFIL;
	ELSEIF PI_MODO = 'DELETE' THEN
		DELETE FROM SEG_PERFIL
		WHERE ID_PERFIL	= PIO_ID_PERFIL;
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `PRC_MANT_SEG_PERFIL_RECURSO` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `PRC_MANT_SEG_PERFIL_RECURSO`(
	IN		PI_MODO					VARCHAR(20),
	INOUT	PIO_ID_PERFIL_RECURSO	INT,
    IN		PI_ID_RECURSO			VARCHAR(20),
	IN		PI_ID_PERFIL			INT
)
BEGIN
    IF PI_MODO = 'INSERT' THEN
		INSERT INTO SEG_PERFIL_RECURSO(
			ID_RECURSO,
            ID_PERFIL)
		VALUES(
			PI_ID_RECURSO,
            PI_ID_PERFIL);
		SELECT LAST_INSERT_ID() INTO PIO_ID_PERFIL_RECURSO;
	ELSEIF PI_MODO = 'UPDATE' THEN
		UPDATE SEG_PERFIL_RECURSO
		SET
			ID_RECURSO	= PI_ID_RECURSO,
            ID_PERFIL	= PI_ID_PERFIL
		WHERE ID_PERFIL_RECURSO	= PIO_ID_PERFIL_RECURSO;
	ELSEIF PI_MODO = 'DELETE' THEN
		DELETE FROM SEG_PERFIL_RECURSO
		WHERE ID_PERFIL	= PIO_ID_PERFIL;
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `PRC_MANT_SEG_PERFIL_USUARIO` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `PRC_MANT_SEG_PERFIL_USUARIO`(
	IN		PI_MODO					VARCHAR(20),
	INOUT	PIO_ID_USUARIO_PERFIL	INT,
    IN		PI_USERNAME				VARCHAR(20),
	IN		PI_ID_PERFIL			INT
)
BEGIN
    IF PI_MODO = 'INSERT' THEN
		INSERT INTO SEG_PERFIL_USUARIO(
			USERNAME,
            ID_PERFIL)
		VALUES(
			PI_USERNAME,
            PI_ID_PERFIL);
		SELECT LAST_INSERT_ID() INTO PIO_ID_USUARIO_PERFIL;
	ELSEIF PI_MODO = 'UPDATE' THEN
		UPDATE SEG_PERFIL_USUARIO
		SET
			USERNAME	= PI_USERNAME,
            ID_PERFIL	= PI_ID_PERFIL
		WHERE ID_USUARIO_PERFIL	= PIO_ID_USUARIO_PERFIL;
	ELSEIF PI_MODO = 'DELETE' THEN
		DELETE FROM SEG_PERFIL_USUARIO
		WHERE ID_USUARIO_PERFIL	= PIO_ID_USUARIO_PERFIL;
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `PRC_MANT_SEG_RECURSO` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `PRC_MANT_SEG_RECURSO`(
	IN		PI_MODO					VARCHAR(20),
	IN		PI_ID_RECURSO			VARCHAR(20),
    IN		PI_ID_CATEGORIA_RECURSO	VARCHAR(40),
	IN		PI_DESCRIPCION			VARCHAR(100)
)
BEGIN
    IF PI_MODO = 'INSERT' THEN
		INSERT INTO SEG_RECURSO(
			ID_RECURSO,
            ID_CATEGORIA_RECURSO,
            DESCRIPCION)
		VALUES(
			PI_ID_RECURSO,
            PI_ID_CATEGORIA_RECURSO,
            DESCRIPCION);
	ELSEIF PI_MODO = 'UPDATE' THEN
		UPDATE SEG_RECURSO
		SET
			ID_CATEGORIA_RECURSO	= PI_ID_CATEGORIA_RECURSO,
            DESCRIPCION				= PI_DESCRIPCION
		WHERE ID_RECURSO	= PI_ID_RECURSO;
	ELSEIF PI_MODO = 'DELETE' THEN
		DELETE FROM SEG_RECURSO
		WHERE ID_RECURSO	= PI_ID_RECURSO;
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `PRC_MANT_SEG_USUARIO` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `PRC_MANT_SEG_USUARIO`(
	IN		PI_MODO			VARCHAR(20),
	IN		PI_USERNAME		VARCHAR(20),
    IN		PI_NOMBRES		VARCHAR(40),
	IN		PI_APELLIDOS	VARCHAR(40),
    IN		PI_PASSWORD		VARCHAR(45)
)
BEGIN
    IF PI_MODO = 'INSERT' THEN
		INSERT INTO SEG_USUARIO(
			USERNAME,
            NOMBRES,
            APELLIDOS,
            PASSWORD)
		VALUES(
			PI_USERNAME,
            PI_NOMBRES,
            PI_APELLIDOS,
            PI_PASSWORD);
	ELSEIF PI_MODO = 'UPDATE' THEN
		UPDATE SEG_USUARIO
		SET
			NOMBRES		= PI_NOMBRES,
            APELLIDOS	= PI_APELLIDOS,
            PASSWORD	= PI_PASSWORD
		WHERE USERNAME	= PI_USERNAME;
	ELSEIF PI_MODO = 'DELETE' THEN
		DELETE FROM SEG_USUARIO
		WHERE USERNAME	= PI_USERNAME;
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `VIE_CON_ASIGNACION_ESPACIO_ACADEMICO`
--

/*!50001 DROP VIEW IF EXISTS `VIE_CON_ASIGNACION_ESPACIO_ACADEMICO`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`sisgea`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `VIE_CON_ASIGNACION_ESPACIO_ACADEMICO` AS select `ROWNUM`() AS `ID`,`A`.`ID_ASIGNACION` AS `ID_ASIGNACION`,`A`.`ID_ESPACIO_ACADEMICO` AS `ID_ESPACIO_ACADEMICO`,`B`.`CICLO` AS `CICLO`,`A`.`ID_CURSO` AS `ID_CURSO`,`B`.`DESCRIPCION` AS `CURSO`,`A`.`SECCION` AS `SECCION`,`C`.`ID_DOCENTE` AS `ID_DOCENTE`,concat(`G`.`NOMBRES`,' ',`G`.`APELLIDOS`) AS `NOMBRES_DOCENTE`,`C`.`TOPE` AS `TOPE`,`C`.`MATRICULADOS` AS `MATRICULADOS`,`C`.`TURNO` AS `TURNO`,`H`.`DESCRIPCION_ITEM` AS `DESCRIPCION_TURNO`,`D`.`TIPO_HORARIO` AS `TIPO_HORARIO`,`J`.`DESCRIPCION_ITEM` AS `DESCRIPCION_TIPO_HORARIO`,`E`.`DIA` AS `DIA`,`I`.`DESCRIPCION_ITEM` AS `DESCRIPCION_DIA`,`A`.`ID_HORARIO` AS `ID_HORARIO`,`A`.`ID_HORARIO_DETALLE` AS `ID_HORARIO_DETALLE`,`D`.`HORARIO_INICIO` AS `HORARIO_INICIO`,`D`.`HORARIO_FIN` AS `HORARIO_FIN`,`F`.`DESCRIPCION` AS `ESPACIO` from (((((((((`MOV_ASIGNACION_RECURSO` `A` left join `MAE_CURSO` `B` on((`A`.`ID_CURSO` = `B`.`ID_CURSO`))) left join `MAE_PROGRAMACION` `C` on(((`A`.`ID_CURSO` = `C`.`ID_CURSO`) and (`A`.`SECCION` = `C`.`SECCION`)))) left join `MAE_HORARIO_DETALLE` `D` on(((`A`.`ID_CURSO` = `D`.`ID_CURSO`) and (`A`.`SECCION` = `D`.`SECCION`) and (`A`.`ID_HORARIO` = `D`.`ID_HORARIO`) and (`A`.`ID_HORARIO_DETALLE` = `D`.`ID_HORARIO_DETALLE`)))) left join `MAE_HORARIO` `E` on(((`A`.`ID_CURSO` = `D`.`ID_CURSO`) and (`A`.`SECCION` = `D`.`SECCION`) and (`A`.`ID_HORARIO` = `D`.`ID_HORARIO`)))) left join `MAE_ESPACIO_ACADEMICO` `F` on((`A`.`ID_ESPACIO_ACADEMICO` = `F`.`ID_ESPACIO_ACADEMICO`))) left join `MAE_DOCENTE` `G` on((`C`.`ID_DOCENTE` = `G`.`ID_DOCENTE`))) left join `MAE_MULTITAB_DET` `H` on(((`C`.`TURNO` = `H`.`ID_MULTITAB_DET`) and (`H`.`ID_MULTITAB_CAB` = 10)))) left join `MAE_MULTITAB_DET` `I` on(((`E`.`DIA` = `I`.`ID_MULTITAB_DET`) and (`I`.`ID_MULTITAB_CAB` = 11)))) left join `MAE_MULTITAB_DET` `J` on(((`D`.`TIPO_HORARIO` = `J`.`ID_MULTITAB_DET`) and (`J`.`ID_MULTITAB_CAB` = 5)))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `VIE_MANT_MAE_PARAMETROS_GENERALES`
--

/*!50001 DROP VIEW IF EXISTS `VIE_MANT_MAE_PARAMETROS_GENERALES`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `VIE_MANT_MAE_PARAMETROS_GENERALES` AS select `MAE_PARAMETROS_GENERALES`.`PERIODO` AS `PERIODO` from `MAE_PARAMETROS_GENERALES` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `VIE_MAN_CURSO`
--

/*!50001 DROP VIEW IF EXISTS `VIE_MAN_CURSO`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `VIE_MAN_CURSO` AS select `a`.`ID_PLAN` AS `ID_PLAN`,`a`.`ID_CURSO` AS `ID_CURSO`,`a`.`CICLO` AS `CICLO`,`a`.`ESPECIALIDAD` AS `ESPECIALIDAD`,`a`.`DESCRIPCION` AS `DESCRIPCION`,`a`.`CREDITAJE` AS `CREDITAJE`,`a`.`TIPO` AS `TIPO`,`a`.`GRUPO` AS `GRUPO` from `MAE_CURSO` `a` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `VIE_MAN_DOCENTE`
--

/*!50001 DROP VIEW IF EXISTS `VIE_MAN_DOCENTE`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `VIE_MAN_DOCENTE` AS select `a`.`ID_DOCENTE` AS `ID_DOCENTE`,`a`.`NOMBRES` AS `NOMBRES`,`a`.`APELLIDOS` AS `APELLIDOS`,`a`.`TIPO` AS `TIPO` from `MAE_DOCENTE` `a` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `VIE_MAN_ESPACIO_ACADEMICO`
--

/*!50001 DROP VIEW IF EXISTS `VIE_MAN_ESPACIO_ACADEMICO`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `VIE_MAN_ESPACIO_ACADEMICO` AS select `a`.`ID_ESPACIO_ACADEMICO` AS `ID_ESPACIO_ACADEMICO`,`a`.`DESCRIPCION` AS `DESCRIPCION_ESPACIO_ACADEMICO`,`a`.`AFORO` AS `AFORO`,`a`.`PABELLON` AS `PABELLON`,`a`.`TIPO_ESPACIO` AS `TIPO_ESPACIO`,`b`.`DESCRIPCION_ITEM` AS `DESCRIPCION_TIPO_ESPACIO`,`a`.`ASIGNABLE` AS `ASIGNABLE` from (`MAE_ESPACIO_ACADEMICO` `a` left join `MAE_MULTITAB_DET` `b` on(((`a`.`TIPO_ESPACIO` = `b`.`ID_MULTITAB_DET`) and (`b`.`ID_MULTITAB_CAB` = 1)))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `VIE_MAN_HORARIO`
--

/*!50001 DROP VIEW IF EXISTS `VIE_MAN_HORARIO`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `VIE_MAN_HORARIO` AS select `a`.`ID_HORARIO` AS `ID_HORARIO`,`a`.`ID_CURSO` AS `ID_CURSO`,`b`.`DESCRIPCION` AS `DESC_CURSO`,`a`.`SECCION` AS `SECCION`,`a`.`DIA` AS `DIA`,`a`.`HORARIO_INICIO` AS `HORARIO_INICIO`,`a`.`HORARIO_FIN` AS `HORARIO_FIN` from (`MAE_HORARIO` `a` left join `MAE_CURSO` `b` on((`b`.`ID_CURSO` = `a`.`ID_CURSO`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `VIE_MAN_HORARIO_DETALLE`
--

/*!50001 DROP VIEW IF EXISTS `VIE_MAN_HORARIO_DETALLE`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `VIE_MAN_HORARIO_DETALLE` AS select `a`.`ID_HORARIO_DETALLE` AS `ID_HORARIO_DETALLE`,`a`.`ID_CURSO` AS `ID_CURSO`,`b`.`DESCRIPCION` AS `DESC_CURSO`,`a`.`SECCION` AS `SECCION`,`a`.`ID_HORARIO` AS `ID_HORARIO`,`a`.`TIPO_HORARIO` AS `TIPO_HORARIO`,`a`.`HORARIO_INICIO` AS `HORARIO_INICIO`,`a`.`HORARIO_FIN` AS `HORARIO_FIN` from (`MAE_HORARIO_DETALLE` `a` left join `MAE_CURSO` `b` on((`b`.`ID_CURSO` = `a`.`ID_CURSO`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `VIE_MAN_MULTITAB_CAB`
--

/*!50001 DROP VIEW IF EXISTS `VIE_MAN_MULTITAB_CAB`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `VIE_MAN_MULTITAB_CAB` AS select `a`.`ID_MULTITAB_CAB` AS `ID_MULTITAB_CAB`,`a`.`DESCRIPCION` AS `DESCRIPCION_MULTITAB_CAB` from `MAE_MULTITAB_CAB` `a` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `VIE_MAN_MULTITAB_DET`
--

/*!50001 DROP VIEW IF EXISTS `VIE_MAN_MULTITAB_DET`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `VIE_MAN_MULTITAB_DET` AS select `a`.`ID_MULTITAB_CAB` AS `ID_MULTITAB_CAB`,`b`.`DESCRIPCION` AS `DESCRIPCION_MULTITAB_CAB`,`a`.`ID_MULTITAB_DET` AS `ID_MULTITAB_DET`,`a`.`DESCRIPCION_ITEM` AS `DESCRIPCION_ITEM`,`a`.`ABREVIATURA` AS `ABREVIATURA` from (`MAE_MULTITAB_DET` `a` left join `MAE_MULTITAB_CAB` `b` on((`a`.`ID_MULTITAB_CAB` = `b`.`ID_MULTITAB_CAB`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `VIE_MAN_PLAN_ACADEMICO`
--

/*!50001 DROP VIEW IF EXISTS `VIE_MAN_PLAN_ACADEMICO`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `VIE_MAN_PLAN_ACADEMICO` AS select `a`.`ID_PLAN` AS `ID_PLAN`,`a`.`DESCRIPCION` AS `DESCRIPCION_PLAN`,`a`.`FACULTAD` AS `FACULTAD`,`a`.`ESCUELA` AS `ESCUELA`,`b`.`DESCRIPCION_ITEM` AS `DESCRIPCION_ESCUELA`,`a`.`ESPECIALIDAD` AS `ESPECIALIDAD` from (`MAE_PLAN` `a` left join `MAE_MULTITAB_DET` `b` on(((`a`.`ESCUELA` = `b`.`ID_MULTITAB_DET`) and (`b`.`ID_MULTITAB_CAB` = 3)))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `VIE_MAN_PROGRAMACION_ACADEMICA`
--

/*!50001 DROP VIEW IF EXISTS `VIE_MAN_PROGRAMACION_ACADEMICA`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `VIE_MAN_PROGRAMACION_ACADEMICA` AS select `a`.`ID_CURSO` AS `ID_CURSO`,`b`.`DESCRIPCION` AS `DESCRIPCION_CURSO`,`a`.`SECCION` AS `SECCION`,`a`.`ID_DOCENTE` AS `ID_DOCENTE`,concat(`c`.`NOMBRES`,' ',`c`.`APELLIDOS`) AS `NOMBRES_DOCENTE`,`a`.`TOPE` AS `TOPE`,`a`.`MATRICULADOS` AS `MATRICULADOS`,`a`.`TURNO` AS `TURNO`,`d`.`DESCRIPCION_ITEM` AS `DESCRIPCION_TURNO`,`a`.`AULA` AS `AULA` from (((`MAE_PROGRAMACION` `a` left join `MAE_CURSO` `b` on((`a`.`ID_CURSO` = `b`.`ID_CURSO`))) left join `MAE_DOCENTE` `c` on((`a`.`ID_DOCENTE` = `c`.`ID_DOCENTE`))) left join `MAE_MULTITAB_DET` `d` on(((`a`.`TURNO` = `d`.`ID_MULTITAB_DET`) and (`d`.`ID_MULTITAB_CAB` = 10)))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `VIE_MAN_SOLICITANTE`
--

/*!50001 DROP VIEW IF EXISTS `VIE_MAN_SOLICITANTE`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `VIE_MAN_SOLICITANTE` AS select `a`.`ID_SOLICITANTE` AS `ID_SOLICITANTE`,`a`.`DNI` AS `DNI`,`a`.`NOMBRES` AS `NOMBRES`,`a`.`APELLIDO_PATERNO` AS `APELLIDO_PATERNO`,`a`.`APELLIDO_MATERNO` AS `APELLIDO_MATERNO`,`a`.`CELULAR` AS `CELULAR`,`a`.`EMAIL` AS `EMAIL`,`a`.`TIPO_SOLICITANTE` AS `TIPO_SOLICITANTE`,`b`.`DESCRIPCION_ITEM` AS `DESCRIPCION_TIPO_SOLICITANTE`,`a`.`BASE` AS `BASE`,`a`.`ESCUELA` AS `ESCUELA`,`c`.`DESCRIPCION_ITEM` AS `DESCRIPCION_ESCUELA` from ((`MAE_SOLICITANTE` `a` left join `MAE_MULTITAB_DET` `b` on(((`a`.`TIPO_SOLICITANTE` = `b`.`ID_MULTITAB_DET`) and (`b`.`ID_MULTITAB_CAB` = 6)))) left join `MAE_MULTITAB_DET` `c` on(((`a`.`ESCUELA` = `b`.`ID_MULTITAB_DET`) and (`b`.`ID_MULTITAB_CAB` = 3)))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `VIE_SOLICITUD`
--

/*!50001 DROP VIEW IF EXISTS `VIE_SOLICITUD`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `VIE_SOLICITUD` AS select `a`.`ID_SOLICITUD` AS `ID_SOLICITUD`,`a`.`ID_ESPACIO_ACADEMICO` AS `ID_ESPACIO_ACADEMICO`,`c`.`DESCRIPCION` AS `DESCRIPCION_ESPACIO_ACADEMICO`,`a`.`ID_SOLICITANTE` AS `ID_SOLICITANTE`,`b`.`DNI` AS `DNI`,`b`.`NOMBRES` AS `NOMBRES`,`b`.`APELLIDO_PATERNO` AS `APELLIDO_PATERNO`,`b`.`APELLIDO_MATERNO` AS `APELLIDO_MATERNO`,`a`.`ESTADO_SOLICITUD` AS `ESTADO_SOLICITUD`,`d`.`DESCRIPCION_ITEM` AS `DESCRIPCION_ESTADO_SOLICITUD`,`a`.`TIPO_SOLICITUD` AS `TIPO_SOLICITUD`,`e`.`DESCRIPCION_ITEM` AS `DESCRIPCION_TIPO_SOLICITUD`,`a`.`MOTIVO` AS `MOTIVO`,`a`.`FECHA_REGISTRO` AS `FECHA_REGISTRO`,`a`.`FECHA_RESERVA` AS `FECHA_RESERVA`,`a`.`HORA_INICIO` AS `HORA_INICIO`,`a`.`HORA_FIN` AS `HORA_FIN`,`a`.`ESTADO_ASISTENCIA` AS `ESTADO_ASISTENCIA` from ((((`MOV_SOLICITUD` `a` left join `MAE_SOLICITANTE` `b` on((`a`.`ID_SOLICITANTE` = `b`.`ID_SOLICITANTE`))) left join `MAE_ESPACIO_ACADEMICO` `c` on((`a`.`ID_ESPACIO_ACADEMICO` = `c`.`ID_ESPACIO_ACADEMICO`))) left join `MAE_MULTITAB_DET` `d` on(((`d`.`ID_MULTITAB_CAB` = 7) and (`d`.`ID_MULTITAB_DET` = `a`.`ESTADO_SOLICITUD`)))) left join `MAE_MULTITAB_DET` `e` on(((`e`.`ID_MULTITAB_CAB` = 8) and (`e`.`ID_MULTITAB_DET` = `a`.`TIPO_SOLICITUD`)))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vie_con_estado_espacios_academicos`
--

/*!50001 DROP VIEW IF EXISTS `vie_con_estado_espacios_academicos`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`sisgea`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `vie_con_estado_espacios_academicos` AS with recursive `ListaHoras` as (select 8 AS `hora` union all select (`ListaHoras`.`hora` + 1) AS `hora` from `ListaHoras` where (`ListaHoras`.`hora` < 21)) select `ROWNUM`() AS `ID`,`ar`.`ID_ASIGNACION` AS `ID_ASIGNACION`,concat(convert(time_format(sec_to_time(((`lista`.`hora` * 60) * 60)),'%H:%i') using utf8mb4),'-',convert(time_format(sec_to_time((((`lista`.`hora` + 1) * 60) * 60)),'%H:%i') using utf8mb4)) AS `HORARIO`,`esp`.`ID_ESPACIO_ACADEMICO` AS `ID_ESPACIO_ACADEMICO`,`esp`.`DESCRIPCION` AS `DESCRIPCION_ESPACIO_ACADEMICO`,`ar`.`ID_CURSO` AS `ID_CURSO`,`cur`.`DESCRIPCION` AS `DESCRIPCION_CURSO`,`hr`.`DIA` AS `DIA`,`ar`.`ID_HORARIO_DETALLE` AS `ID_HORARIO_DETALLE`,`hd`.`TIPO_HORARIO` AS `TIPO_HORARIO` from (((((`ListaHoras` `lista` join `MAE_ESPACIO_ACADEMICO` `esp`) left join `MOV_ASIGNACION_RECURSO` `ar` on(((`lista`.`hora` between `ar`.`HORARIO_INICIO` and (`ar`.`HORARIO_FIN` - 1)) and (`esp`.`ID_ESPACIO_ACADEMICO` = `ar`.`ID_ESPACIO_ACADEMICO`)))) left join `MAE_CURSO` `cur` on((`cur`.`ID_CURSO` = `ar`.`ID_CURSO`))) left join `MAE_HORARIO` `hr` on((`hr`.`ID_HORARIO` = `ar`.`ID_HORARIO`))) left join `MAE_HORARIO_DETALLE` `hd` on((`hd`.`ID_HORARIO_DETALLE` = `ar`.`ID_HORARIO_DETALLE`))) */;
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

-- Dump completed on 2020-02-27 13:59:14
