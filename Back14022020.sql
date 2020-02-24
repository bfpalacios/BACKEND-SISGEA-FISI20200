CREATE DATABASE  IF NOT EXISTS `sisgea` /*!40100 DEFAULT CHARACTER SET utf8 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `sisgea`;
-- MySQL dump 10.13  Distrib 8.0.16, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: sisgea
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
-- Table structure for table `mae_curso`
--

DROP TABLE IF EXISTS `mae_curso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `mae_curso` (
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
  CONSTRAINT `fk_MAE_CURSO_PLAN_MAE_PLAN_ESTUDIO` FOREIGN KEY (`ID_PLAN`) REFERENCES `mae_plan` (`id_plan`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mae_curso`
--

LOCK TABLES `mae_curso` WRITE;
/*!40000 ALTER TABLE `mae_curso` DISABLE KEYS */;
/*!40000 ALTER TABLE `mae_curso` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mae_docente`
--

DROP TABLE IF EXISTS `mae_docente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `mae_docente` (
  `ID_DOCENTE` varchar(20) NOT NULL,
  `NOMBRES` varchar(40) DEFAULT NULL,
  `APELLIDOS` varchar(40) DEFAULT NULL,
  `TIPO` varchar(4) DEFAULT NULL,
  PRIMARY KEY (`ID_DOCENTE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mae_docente`
--

LOCK TABLES `mae_docente` WRITE;
/*!40000 ALTER TABLE `mae_docente` DISABLE KEYS */;
/*!40000 ALTER TABLE `mae_docente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mae_espacio_academico`
--

DROP TABLE IF EXISTS `mae_espacio_academico`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `mae_espacio_academico` (
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
-- Dumping data for table `mae_espacio_academico`
--

LOCK TABLES `mae_espacio_academico` WRITE;
/*!40000 ALTER TABLE `mae_espacio_academico` DISABLE KEYS */;
INSERT INTO `mae_espacio_academico` (`ID_ESPACIO_ACADEMICO`, `DESCRIPCION`, `AFORO`, `PABELLON`, `TIPO_ESPACIO`, `ASIGNABLE`) VALUES (3,'LABORATORIO 3',30,'1','L',1),(4,'LABORATORIO 4',25,'1','L',1),(5,'LABORATORIO 5',20,'1','L',1),(6,'LABORATORIO 6',30,'1','L',1),(7,'LABORATORIO 7',40,'1','L',1),(8,'LABORATORIO 8',40,'1','L',1),(101,'AULA 101',40,'1','A',1),(102,'AULA 102',40,'1','A',1),(103,'AULA 103',40,'1','A',1),(104,'AULA 104',40,'1','A',1),(105,'AULA 105',40,'1','A',1),(106,'AULA 106',40,'1','A',1),(107,'AULA 107',40,'1','A',1),(108,'AULA 108',40,'1','A',1);
/*!40000 ALTER TABLE `mae_espacio_academico` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mae_horario`
--

DROP TABLE IF EXISTS `mae_horario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `mae_horario` (
  `ID_HORARIO` int NOT NULL AUTO_INCREMENT,
  `ID_CURSO` varchar(20) NOT NULL,
  `SECCION` int NOT NULL,
  `DIA` varchar(4) DEFAULT NULL,
  `HORARIO_INICIO` varchar(8) DEFAULT NULL,
  `HORARIO_FIN` varchar(8) DEFAULT NULL,
  PRIMARY KEY (`ID_HORARIO`,`ID_CURSO`,`SECCION`),
  KEY `fk_MAE_HORARIO_MAE_PROGRAMACION1_idx` (`SECCION`,`ID_CURSO`),
  CONSTRAINT `fk_MAE_HORARIO_MAE_PROGRAMACION1` FOREIGN KEY (`SECCION`, `ID_CURSO`) REFERENCES `mae_programacion` (`seccion`, `id_curso`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mae_horario`
--

LOCK TABLES `mae_horario` WRITE;
/*!40000 ALTER TABLE `mae_horario` DISABLE KEYS */;
/*!40000 ALTER TABLE `mae_horario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mae_horario_detalle`
--

DROP TABLE IF EXISTS `mae_horario_detalle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `mae_horario_detalle` (
  `ID_HORARIO_DETALLE` int NOT NULL AUTO_INCREMENT,
  `ID_CURSO` varchar(20) NOT NULL,
  `SECCION` int NOT NULL,
  `ID_HORARIO` int NOT NULL,
  `TIPO_HORARIO` varchar(45) DEFAULT NULL,
  `HORARIO_INICIO` varchar(8) DEFAULT NULL,
  `HORARIO_FIN` varchar(8) DEFAULT NULL,
  PRIMARY KEY (`ID_HORARIO_DETALLE`,`ID_CURSO`,`SECCION`,`ID_HORARIO`),
  KEY `fk_MAE_HORARIO_DETALLE_MAE_HORARIO1_idx` (`ID_HORARIO`,`ID_CURSO`,`SECCION`),
  CONSTRAINT `fk_MAE_HORARIO_DETALLE_MAE_HORARIO1` FOREIGN KEY (`ID_HORARIO`, `ID_CURSO`, `SECCION`) REFERENCES `mae_horario` (`ID_HORARIO`, `ID_CURSO`, `SECCION`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mae_horario_detalle`
--

LOCK TABLES `mae_horario_detalle` WRITE;
/*!40000 ALTER TABLE `mae_horario_detalle` DISABLE KEYS */;
/*!40000 ALTER TABLE `mae_horario_detalle` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mae_multitab_cab`
--

DROP TABLE IF EXISTS `mae_multitab_cab`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `mae_multitab_cab` (
  `ID_MULTITAB_CAB` int NOT NULL AUTO_INCREMENT,
  `DESCRIPCION` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`ID_MULTITAB_CAB`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mae_multitab_cab`
--

LOCK TABLES `mae_multitab_cab` WRITE;
/*!40000 ALTER TABLE `mae_multitab_cab` DISABLE KEYS */;
INSERT INTO `mae_multitab_cab` (`ID_MULTITAB_CAB`, `DESCRIPCION`) VALUES (1,'TIPO ESPACIO ACADÉMICO'),(2,'TIPO DOCENTE'),(3,'ESCUELA ACADÉMICA'),(4,'TIPO CURSO'),(5,'TIPO DISPONIBILIDAD'),(6,'TIPO SOLICITANTE'),(7,'ESTADO SOLICITUD'),(8,'TIPO SOLICITUD'),(9,'BASE'),(10,'TURNO'),(11,'DÍA'),(12,'PABELLÓN'),(13,'ESTADO ASISTENCIA');
/*!40000 ALTER TABLE `mae_multitab_cab` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mae_multitab_det`
--

DROP TABLE IF EXISTS `mae_multitab_det`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `mae_multitab_det` (
  `ID_MULTITAB_DET` varchar(4) NOT NULL,
  `ID_MULTITAB_CAB` int NOT NULL,
  `DESCRIPCION_ITEM` varchar(50) DEFAULT NULL,
  `ABREVIATURA` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`ID_MULTITAB_DET`,`ID_MULTITAB_CAB`),
  KEY `fk_MAE_MULTITAB_DET_MAE_MULTITAB_CAB1_idx` (`ID_MULTITAB_CAB`),
  CONSTRAINT `fk_MAE_MULTITAB_DET_MAE_MULTITAB_CAB1` FOREIGN KEY (`ID_MULTITAB_CAB`) REFERENCES `mae_multitab_cab` (`ID_MULTITAB_CAB`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mae_multitab_det`
--

LOCK TABLES `mae_multitab_det` WRITE;
/*!40000 ALTER TABLE `mae_multitab_det` DISABLE KEYS */;
INSERT INTO `mae_multitab_det` (`ID_MULTITAB_DET`, `ID_MULTITAB_CAB`, `DESCRIPCION_ITEM`, `ABREVIATURA`) VALUES ('0',13,'POR CONFIRMAR',NULL),('1',13,'ASISTIÓ',NULL),('2006',9,'BASE 6',''),('2007',9,'BASE 7',''),('2008',9,'BASE 8',''),('2009',9,'BASE 9',''),('2010',9,'BASE 10',''),('2011',9,'BASE 11',''),('2012',9,'BASE 12',''),('2013',9,'BASE 13',''),('2014',9,'BASE 14',''),('2015',9,'BASE 15',''),('2016',9,'BASE 16',''),('2017',9,'BASE 17',''),('2018',9,'BASE 18',''),('2019',9,'BASE 19',''),('A',1,'AULA','AUL'),('A',6,'ALUMNO','ALU'),('A',7,'EN REVISIÓN','REV'),('AL',4,'ALTERNATIVO','ALT'),('B',7,'APROBADO','APR'),('C',7,'RECHAZADO','REC'),('C',8,'COMPLEJA','COM'),('D',6,'DOCENTE','DOC'),('D',7,'REPROGRAMADO','REP'),('DO',11,'DOMINGO',''),('E',2,'EXTERNO','EXT'),('E',4,'ELECTIVO','EL'),('E',6,'EXTERNO','EXT'),('I',2,'INTERNO','INT'),('JU',11,'JUEVES',''),('L',1,'LABORATORIO','LAB'),('LU',11,'LUNES',''),('M',10,'MAÑANA','MAN'),('MA',11,'MARTES',''),('MI',11,'MIÉRCOLES',''),('N',10,'NOCHE','NOC'),('O',1,'OTROS','OTR'),('O',4,'OBLIGATORIO','OB'),('P',5,'PRÁCTICA','PR'),('PA',12,'PABELLÓN ANTIGUO','PA'),('PN',12,'PABELLÓN NUEVO','PN'),('S',3,'SISTEMAS','SS'),('S',8,'SIMPLE','SIM'),('SA',11,'SÁBADO',''),('T',5,'TEÓRICA','TE'),('T',10,'TARDE','TAR'),('VI',11,'VIERNES',''),('W',3,'SOTFWARE','SW');
/*!40000 ALTER TABLE `mae_multitab_det` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mae_parametros_generales`
--

DROP TABLE IF EXISTS `mae_parametros_generales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `mae_parametros_generales` (
  `PERIODO` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mae_parametros_generales`
--

LOCK TABLES `mae_parametros_generales` WRITE;
/*!40000 ALTER TABLE `mae_parametros_generales` DISABLE KEYS */;
INSERT INTO `mae_parametros_generales` (`PERIODO`) VALUES ('2020-0');
/*!40000 ALTER TABLE `mae_parametros_generales` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mae_plan`
--

DROP TABLE IF EXISTS `mae_plan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `mae_plan` (
  `ID_PLAN` varchar(20) NOT NULL,
  `FACULTAD` varchar(4) DEFAULT NULL,
  `ESCUELA` varchar(4) DEFAULT NULL,
  `ESPECIALIDAD` varchar(4) DEFAULT NULL,
  `DESCRIPCION` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`ID_PLAN`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mae_plan`
--

LOCK TABLES `mae_plan` WRITE;
/*!40000 ALTER TABLE `mae_plan` DISABLE KEYS */;
/*!40000 ALTER TABLE `mae_plan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mae_pre_requisito`
--

DROP TABLE IF EXISTS `mae_pre_requisito`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `mae_pre_requisito` (
  `ID_PREREQ` int NOT NULL AUTO_INCREMENT,
  `ID_CURSO` varchar(20) NOT NULL,
  `ID_CURSO_PRE_REQUISITO` varchar(20) NOT NULL,
  `DESCRIPCION_PRE_REQUISITO` varchar(40) DEFAULT NULL,
  `GRUPO_PRE_REQUISITO` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`ID_PREREQ`),
  KEY `fk_MAE_PRE_REQUISITO_MAE_CURSO1_idx` (`ID_CURSO`),
  KEY `fk_MAE_PRE_REQUISITO_MAE_CURSO2_idx` (`ID_CURSO_PRE_REQUISITO`),
  CONSTRAINT `fk_MAE_PRE_REQUISITO_MAE_CURSO1` FOREIGN KEY (`ID_CURSO`) REFERENCES `mae_curso` (`ID_CURSO`),
  CONSTRAINT `fk_MAE_PRE_REQUISITO_MAE_CURSO2` FOREIGN KEY (`ID_CURSO_PRE_REQUISITO`) REFERENCES `mae_curso` (`ID_CURSO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mae_pre_requisito`
--

LOCK TABLES `mae_pre_requisito` WRITE;
/*!40000 ALTER TABLE `mae_pre_requisito` DISABLE KEYS */;
/*!40000 ALTER TABLE `mae_pre_requisito` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mae_programacion`
--

DROP TABLE IF EXISTS `mae_programacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `mae_programacion` (
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
  CONSTRAINT `fk_MAE_PROGRAMACION_MAE_CURSO1` FOREIGN KEY (`ID_CURSO`) REFERENCES `mae_curso` (`ID_CURSO`),
  CONSTRAINT `fk_MAE_PROGRAMACION_MAE_DOCENTE1` FOREIGN KEY (`ID_DOCENTE`) REFERENCES `mae_docente` (`ID_DOCENTE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mae_programacion`
--

LOCK TABLES `mae_programacion` WRITE;
/*!40000 ALTER TABLE `mae_programacion` DISABLE KEYS */;
/*!40000 ALTER TABLE `mae_programacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mae_solicitante`
--

DROP TABLE IF EXISTS `mae_solicitante`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `mae_solicitante` (
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
-- Dumping data for table `mae_solicitante`
--

LOCK TABLES `mae_solicitante` WRITE;
/*!40000 ALTER TABLE `mae_solicitante` DISABLE KEYS */;
INSERT INTO `mae_solicitante` (`ID_SOLICITANTE`, `DNI`, `NOMBRES`, `APELLIDO_PATERNO`, `APELLIDO_MATERNO`, `CELULAR`, `EMAIL`, `TIPO_SOLICITANTE`, `BASE`, `ESCUELA`) VALUES (1,4673934,'CARLOS','BRAVO','PEREZ',95573843,'carlos.bravo@unmsm.edu.pe','A',2016,'W'),(2,4673935,'MARCO','MARQUEZ','BRACHO',95573844,'marco.marquez@unmsm.edu.pe','A',2016,'S'),(3,4673936,'FIORELLA','ROJAS','FUENTES',95573845,'fiorella.rojas@unmsm.edu.pe','A',2016,'S'),(4,4673937,'OMAR','LOPEZ','MARIN',95573846,'omar.lopez@unmsm.edu.pe','A',2016,'w'),(5,4673938,'LINDA','PALMA','PEREZ',95573847,'linda.palma@unmsm.edu.pe','A',2016,'w'),(6,4673939,'VERONICA','LODGE','MORAN',95573848,'veronica.lodge@unmsm.edu.pe','A',2016,'w'),(7,4673940,'FILOMENA','FRANCO','LUNA',95573849,'filomena.franco@unmsm.edu.pe','A',2017,'S');
/*!40000 ALTER TABLE `mae_solicitante` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mov_asignacion_recurso`
--

DROP TABLE IF EXISTS `mov_asignacion_recurso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `mov_asignacion_recurso` (
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
  CONSTRAINT `fk_MAE_ASIGNACION_RECURSO_MAE_ESPACIO_ACADEMICO1` FOREIGN KEY (`ID_ESPACIO_ACADEMICO`) REFERENCES `mae_espacio_academico` (`ID_ESPACIO_ACADEMICO`),
  CONSTRAINT `fk_MAE_ASIGNACION_RECURSO_MAE_HORARIO_DETALLE1` FOREIGN KEY (`ID_HORARIO_DETALLE`, `ID_CURSO`, `SECCION`, `ID_HORARIO`) REFERENCES `mae_horario_detalle` (`ID_HORARIO_DETALLE`, `ID_CURSO`, `SECCION`, `ID_HORARIO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mov_asignacion_recurso`
--

LOCK TABLES `mov_asignacion_recurso` WRITE;
/*!40000 ALTER TABLE `mov_asignacion_recurso` DISABLE KEYS */;
/*!40000 ALTER TABLE `mov_asignacion_recurso` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mov_solicitud`
--

DROP TABLE IF EXISTS `mov_solicitud`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `mov_solicitud` (
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
  CONSTRAINT `fk_MOV_SOLICITUD_MAE_ESPACIO_ACADEMICO1` FOREIGN KEY (`ID_ESPACIO_ACADEMICO`) REFERENCES `mae_espacio_academico` (`ID_ESPACIO_ACADEMICO`),
  CONSTRAINT `fk_MOV_SOLICITUD_MAE_SOLICITANTE1` FOREIGN KEY (`ID_SOLICITANTE`) REFERENCES `mae_solicitante` (`ID_SOLICITANTE`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mov_solicitud`
--

LOCK TABLES `mov_solicitud` WRITE;
/*!40000 ALTER TABLE `mov_solicitud` DISABLE KEYS */;
INSERT INTO `mov_solicitud` (`ID_SOLICITUD`, `ID_ESPACIO_ACADEMICO`, `ID_SOLICITANTE`, `ESTADO_SOLICITUD`, `TIPO_SOLICITUD`, `MOTIVO`, `FECHA_REGISTRO`, `FECHA_RESERVA`, `HORA_INICIO`, `HORA_FIN`, `ESTADO_ASISTENCIA`) VALUES (3,108,3,NULL,'A','SDADKSAJDSK',NULL,NULL,NULL,NULL,NULL),(4,4,2,'A','A','dfgvhjn','2020-02-13','2020-02-12','20:00','22:00','0'),(5,8,5,'A','A','juqasndujasd','2020-02-13','2020-02-13','12:00','14:00','0');
/*!40000 ALTER TABLE `mov_solicitud` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `seg_perfil`
--

DROP TABLE IF EXISTS `seg_perfil`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `seg_perfil` (
  `ID_PERFIL` int NOT NULL AUTO_INCREMENT,
  `DESCRIPCION` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`ID_PERFIL`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `seg_perfil`
--

LOCK TABLES `seg_perfil` WRITE;
/*!40000 ALTER TABLE `seg_perfil` DISABLE KEYS */;
/*!40000 ALTER TABLE `seg_perfil` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `seg_perfil_recurso`
--

DROP TABLE IF EXISTS `seg_perfil_recurso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `seg_perfil_recurso` (
  `ID_PERFIL_RECURSO` int NOT NULL AUTO_INCREMENT,
  `ID_RECURSO` varchar(20) NOT NULL,
  `ID_PERFIL` int NOT NULL,
  PRIMARY KEY (`ID_PERFIL_RECURSO`),
  KEY `fk_SEG_PERFIL_RECURSO_SEG_RECURSO1_idx` (`ID_RECURSO`),
  KEY `fk_SEG_PERFIL_RECURSO_SEG_PERFIL1_idx` (`ID_PERFIL`),
  CONSTRAINT `fk_SEG_PERFIL_RECURSO_SEG_PERFIL1` FOREIGN KEY (`ID_PERFIL`) REFERENCES `seg_perfil` (`ID_PERFIL`),
  CONSTRAINT `fk_SEG_PERFIL_RECURSO_SEG_RECURSO1` FOREIGN KEY (`ID_RECURSO`) REFERENCES `seg_recurso` (`id_recurso`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `seg_perfil_recurso`
--

LOCK TABLES `seg_perfil_recurso` WRITE;
/*!40000 ALTER TABLE `seg_perfil_recurso` DISABLE KEYS */;
/*!40000 ALTER TABLE `seg_perfil_recurso` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `seg_perfil_usuario`
--

DROP TABLE IF EXISTS `seg_perfil_usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `seg_perfil_usuario` (
  `ID_USUARIO_PERFIL` int NOT NULL AUTO_INCREMENT,
  `USERNAME` varchar(20) NOT NULL,
  `ID_PERFIL` int NOT NULL,
  PRIMARY KEY (`ID_USUARIO_PERFIL`),
  KEY `fk_SEG_PERFIL_USUARIO_SEG_USUARIO1_idx` (`USERNAME`),
  KEY `fk_SEG_PERFIL_USUARIO_SEG_PERFIL1_idx` (`ID_PERFIL`),
  CONSTRAINT `fk_SEG_PERFIL_USUARIO_SEG_PERFIL1` FOREIGN KEY (`ID_PERFIL`) REFERENCES `seg_perfil` (`ID_PERFIL`),
  CONSTRAINT `fk_SEG_PERFIL_USUARIO_SEG_USUARIO1` FOREIGN KEY (`USERNAME`) REFERENCES `seg_usuario` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `seg_perfil_usuario`
--

LOCK TABLES `seg_perfil_usuario` WRITE;
/*!40000 ALTER TABLE `seg_perfil_usuario` DISABLE KEYS */;
/*!40000 ALTER TABLE `seg_perfil_usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `seg_recurso`
--

DROP TABLE IF EXISTS `seg_recurso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `seg_recurso` (
  `ID_RECURSO` varchar(20) NOT NULL,
  `ID_CATEGORIA_RECURSO` varchar(4) DEFAULT NULL,
  `DECSRIPCION` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`ID_RECURSO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `seg_recurso`
--

LOCK TABLES `seg_recurso` WRITE;
/*!40000 ALTER TABLE `seg_recurso` DISABLE KEYS */;
/*!40000 ALTER TABLE `seg_recurso` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `seg_usuario`
--

DROP TABLE IF EXISTS `seg_usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `seg_usuario` (
  `USERNAME` varchar(20) NOT NULL,
  `NOMBRES` varchar(40) DEFAULT NULL,
  `APELLIDOS` varchar(40) DEFAULT NULL,
  `PASSWORD` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`USERNAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `seg_usuario`
--

LOCK TABLES `seg_usuario` WRITE;
/*!40000 ALTER TABLE `seg_usuario` DISABLE KEYS */;
/*!40000 ALTER TABLE `seg_usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `vie_con_asignacion_espacio_academico`
--

DROP TABLE IF EXISTS `vie_con_asignacion_espacio_academico`;
/*!50001 DROP VIEW IF EXISTS `vie_con_asignacion_espacio_academico`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
/*!50001 CREATE VIEW `vie_con_asignacion_espacio_academico` AS SELECT 
 1 AS `id`,
 1 AS `CICLO`,
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
 1 AS `HORARIO_INICIO`,
 1 AS `HORARIO_FIN`,
 1 AS `ESPACIO`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vie_man_curso`
--

DROP TABLE IF EXISTS `vie_man_curso`;
/*!50001 DROP VIEW IF EXISTS `vie_man_curso`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
/*!50001 CREATE VIEW `vie_man_curso` AS SELECT 
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
-- Temporary view structure for view `vie_man_docente`
--

DROP TABLE IF EXISTS `vie_man_docente`;
/*!50001 DROP VIEW IF EXISTS `vie_man_docente`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
/*!50001 CREATE VIEW `vie_man_docente` AS SELECT 
 1 AS `ID_DOCENTE`,
 1 AS `NOMBRES`,
 1 AS `APELLIDOS`,
 1 AS `TIPO`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vie_man_espacio_academico`
--

DROP TABLE IF EXISTS `vie_man_espacio_academico`;
/*!50001 DROP VIEW IF EXISTS `vie_man_espacio_academico`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
/*!50001 CREATE VIEW `vie_man_espacio_academico` AS SELECT 
 1 AS `ID_ESPACIO_ACADEMICO`,
 1 AS `DESCRIPCION_ESPACIO_ACADEMICO`,
 1 AS `AFORO`,
 1 AS `PABELLON`,
 1 AS `TIPO_ESPACIO`,
 1 AS `DESCRIPCION_TIPO_ESPACIO`,
 1 AS `ASIGNABLE`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vie_man_horario`
--

DROP TABLE IF EXISTS `vie_man_horario`;
/*!50001 DROP VIEW IF EXISTS `vie_man_horario`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
/*!50001 CREATE VIEW `vie_man_horario` AS SELECT 
 1 AS `ID_HORARIO`,
 1 AS `ID_CURSO`,
 1 AS `DESC_CURSO`,
 1 AS `SECCION`,
 1 AS `DIA`,
 1 AS `HORARIO_INICIO`,
 1 AS `HORARIO_FIN`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vie_man_horario_detalle`
--

DROP TABLE IF EXISTS `vie_man_horario_detalle`;
/*!50001 DROP VIEW IF EXISTS `vie_man_horario_detalle`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
/*!50001 CREATE VIEW `vie_man_horario_detalle` AS SELECT 
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
-- Temporary view structure for view `vie_man_multitab_cab`
--

DROP TABLE IF EXISTS `vie_man_multitab_cab`;
/*!50001 DROP VIEW IF EXISTS `vie_man_multitab_cab`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
/*!50001 CREATE VIEW `vie_man_multitab_cab` AS SELECT 
 1 AS `ID_MULTITAB_CAB`,
 1 AS `DESCRIPCION_MULTITAB_CAB`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vie_man_multitab_det`
--

DROP TABLE IF EXISTS `vie_man_multitab_det`;
/*!50001 DROP VIEW IF EXISTS `vie_man_multitab_det`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
/*!50001 CREATE VIEW `vie_man_multitab_det` AS SELECT 
 1 AS `ID_MULTITAB_CAB`,
 1 AS `DESCRIPCION_MULTITAB_CAB`,
 1 AS `ID_MULTITAB_DET`,
 1 AS `DESCRIPCION_ITEM`,
 1 AS `ABREVIATURA`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vie_man_plan_academico`
--

DROP TABLE IF EXISTS `vie_man_plan_academico`;
/*!50001 DROP VIEW IF EXISTS `vie_man_plan_academico`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
/*!50001 CREATE VIEW `vie_man_plan_academico` AS SELECT 
 1 AS `ID_PLAN`,
 1 AS `DESCRIPCION_PLAN`,
 1 AS `FACULTAD`,
 1 AS `ESCUELA`,
 1 AS `DESCRIPCION_ESCUELA`,
 1 AS `ESPECIALIDAD`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vie_man_programacion_academica`
--

DROP TABLE IF EXISTS `vie_man_programacion_academica`;
/*!50001 DROP VIEW IF EXISTS `vie_man_programacion_academica`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
/*!50001 CREATE VIEW `vie_man_programacion_academica` AS SELECT 
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
-- Temporary view structure for view `vie_man_solicitante`
--

DROP TABLE IF EXISTS `vie_man_solicitante`;
/*!50001 DROP VIEW IF EXISTS `vie_man_solicitante`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
/*!50001 CREATE VIEW `vie_man_solicitante` AS SELECT 
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
-- Temporary view structure for view `vie_mant_mae_parametros_generales`
--

DROP TABLE IF EXISTS `vie_mant_mae_parametros_generales`;
/*!50001 DROP VIEW IF EXISTS `vie_mant_mae_parametros_generales`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
/*!50001 CREATE VIEW `vie_mant_mae_parametros_generales` AS SELECT 
 1 AS `PERIODO`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vie_solicitud`
--

DROP TABLE IF EXISTS `vie_solicitud`;
/*!50001 DROP VIEW IF EXISTS `vie_solicitud`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
/*!50001 CREATE VIEW `vie_solicitud` AS SELECT 
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
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
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
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `PRC_ASIGNACION_ESPACIO_ACADEMICO`()
BEGIN
    -- DECLARAMOS VARIABLES LOCALES PARA CADA REGISTRO DE LECTURA
    DECLARE l_id_espacio_academico	INT;
    DECLARE l_id_curso				VARCHAR(20);
    DECLARE l_seccion				INT;
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
    DECLARE l_periodo VARCHAR(20) default (select periodo from mae_parametros_generales);
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
		FROM mae_horario_detalle A
		INNER JOIN mae_programacion	B	ON A.ID_CURSO = B.ID_CURSO
			AND A.SECCION	= B.SECCION
		INNER JOIN mae_horario C	ON	A.ID_HORARIO = C.ID_HORARIO
		ORDER BY B.MATRICULADOS DESC;
            
    -- DECLARAMOS UN MANEJADOR DE ERROR "NOT FOUND"
	DECLARE CONTINUE HANDLER FOR NOT FOUND SET termina = TRUE;
    
    OPEN cursor_asignacion_espacio;
	loop1: LOOP
    FETCH cursor_asignacion_espacio 
    INTO
        l_id_curso,
        l_seccion,
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
				FROM mae_espacio_academico A
				INNER JOIN mov_asignacion_recurso B	ON A.ID_ESPACIO_ACADEMICO = B.ID_ESPACIO_ACADEMICO
				INNER JOIN mae_horario C  ON c.ID_HORARIO = B.ID_HORARIO
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
				FROM mae_espacio_academico A 
				WHERE A.ID_ESPACIO_ACADEMICO != @espacio_asignado
					AND A.TIPO_ESPACIO	= @tipo_espacio
					AND A.AFORO	>= l_matriculados
				LIMIT 1
			);
		ELSE
			SET @espacio_academico = (
				SELECT
					A.ID_ESPACIO_ACADEMICO
				FROM mae_espacio_academico A 
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
			INSERT INTO mov_asignacion_recurso(
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
				l_id_curso,
				l_seccion,
				l_id_horario,
				l_id_horario_detalle,
				l_horario_inicio,
				l_horario_fin
			);
            COMMIT;
            -- SELECT * FROM mov_asignacion_recurso;
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
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
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
            ESTADO_SISTENCOA		= PI_ESTADO_ASISTENCIA
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
/*!50003 DROP PROCEDURE IF EXISTS `PRC_MANT_MAE_DOCENTE` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
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
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
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
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
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
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
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
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
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
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
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
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
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
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
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
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
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
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
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
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
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
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
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
-- Final view structure for view `vie_con_asignacion_espacio_academico`
--

/*!50001 DROP VIEW IF EXISTS `vie_con_asignacion_espacio_academico`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vie_con_asignacion_espacio_academico` AS select `ROWNUM`() AS `id`,`b`.`CICLO` AS `CICLO`,`b`.`DESCRIPCION` AS `CURSO`,`a`.`SECCION` AS `SECCION`,`c`.`ID_DOCENTE` AS `ID_DOCENTE`,concat(`g`.`NOMBRES`,' ',`g`.`APELLIDOS`) AS `NOMBRES_DOCENTE`,`c`.`TOPE` AS `TOPE`,`c`.`MATRICULADOS` AS `MATRICULADOS`,`c`.`TURNO` AS `TURNO`,`h`.`DESCRIPCION_ITEM` AS `DESCRIPCION_TURNO`,`d`.`TIPO_HORARIO` AS `TIPO_HORARIO`,`j`.`DESCRIPCION_ITEM` AS `DESCRIPCION_TIPO_HORARIO`,`e`.`DIA` AS `DIA`,`i`.`DESCRIPCION_ITEM` AS `DESCRIPCION_DIA`,`d`.`HORARIO_INICIO` AS `HORARIO_INICIO`,`d`.`HORARIO_FIN` AS `HORARIO_FIN`,`f`.`DESCRIPCION` AS `ESPACIO` from (((((((((`mov_asignacion_recurso` `a` left join `mae_curso` `b` on((`a`.`ID_CURSO` = `b`.`ID_CURSO`))) left join `mae_programacion` `c` on(((`a`.`ID_CURSO` = `c`.`ID_CURSO`) and (`a`.`SECCION` = `c`.`SECCION`)))) left join `mae_horario_detalle` `d` on(((`a`.`ID_CURSO` = `d`.`ID_CURSO`) and (`a`.`SECCION` = `d`.`SECCION`) and (`a`.`ID_HORARIO` = `d`.`ID_HORARIO`) and (`a`.`ID_HORARIO_DETALLE` = `d`.`ID_HORARIO_DETALLE`)))) left join `mae_horario` `e` on(((`a`.`ID_CURSO` = `d`.`ID_CURSO`) and (`a`.`SECCION` = `d`.`SECCION`) and (`a`.`ID_HORARIO` = `d`.`ID_HORARIO`)))) left join `mae_espacio_academico` `f` on((`a`.`ID_ESPACIO_ACADEMICO` = `f`.`ID_ESPACIO_ACADEMICO`))) left join `mae_docente` `g` on((`c`.`ID_DOCENTE` = `g`.`ID_DOCENTE`))) left join `mae_multitab_det` `h` on(((`c`.`TURNO` = `h`.`ID_MULTITAB_DET`) and (`h`.`ID_MULTITAB_CAB` = 10)))) left join `mae_multitab_det` `i` on(((`e`.`DIA` = `i`.`ID_MULTITAB_DET`) and (`i`.`ID_MULTITAB_CAB` = 11)))) left join `mae_multitab_det` `j` on(((`d`.`TIPO_HORARIO` = `j`.`ID_MULTITAB_DET`) and (`j`.`ID_MULTITAB_CAB` = 5)))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vie_man_curso`
--

/*!50001 DROP VIEW IF EXISTS `vie_man_curso`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vie_man_curso` AS select `a`.`ID_PLAN` AS `ID_PLAN`,`a`.`ID_CURSO` AS `ID_CURSO`,`a`.`CICLO` AS `CICLO`,`a`.`ESPECIALIDAD` AS `ESPECIALIDAD`,`a`.`DESCRIPCION` AS `DESCRIPCION`,`a`.`CREDITAJE` AS `CREDITAJE`,`a`.`TIPO` AS `TIPO`,`a`.`GRUPO` AS `GRUPO` from `mae_curso` `a` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vie_man_docente`
--

/*!50001 DROP VIEW IF EXISTS `vie_man_docente`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vie_man_docente` AS select `a`.`ID_DOCENTE` AS `ID_DOCENTE`,`a`.`NOMBRES` AS `NOMBRES`,`a`.`APELLIDOS` AS `APELLIDOS`,`a`.`TIPO` AS `TIPO` from `mae_docente` `a` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vie_man_espacio_academico`
--

/*!50001 DROP VIEW IF EXISTS `vie_man_espacio_academico`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vie_man_espacio_academico` AS select `a`.`ID_ESPACIO_ACADEMICO` AS `ID_ESPACIO_ACADEMICO`,`a`.`DESCRIPCION` AS `DESCRIPCION_ESPACIO_ACADEMICO`,`a`.`AFORO` AS `AFORO`,`a`.`PABELLON` AS `PABELLON`,`a`.`TIPO_ESPACIO` AS `TIPO_ESPACIO`,`b`.`DESCRIPCION_ITEM` AS `DESCRIPCION_TIPO_ESPACIO`,`a`.`ASIGNABLE` AS `ASIGNABLE` from (`mae_espacio_academico` `a` left join `mae_multitab_det` `b` on(((`a`.`TIPO_ESPACIO` = `b`.`ID_MULTITAB_DET`) and (`b`.`ID_MULTITAB_CAB` = 1)))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vie_man_horario`
--

/*!50001 DROP VIEW IF EXISTS `vie_man_horario`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vie_man_horario` AS select `a`.`ID_HORARIO` AS `ID_HORARIO`,`a`.`ID_CURSO` AS `ID_CURSO`,`b`.`DESCRIPCION` AS `DESC_CURSO`,`a`.`SECCION` AS `SECCION`,`a`.`DIA` AS `DIA`,`a`.`HORARIO_INICIO` AS `HORARIO_INICIO`,`a`.`HORARIO_FIN` AS `HORARIO_FIN` from (`mae_horario` `a` left join `mae_curso` `b` on((`b`.`ID_CURSO` = `a`.`ID_CURSO`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vie_man_horario_detalle`
--

/*!50001 DROP VIEW IF EXISTS `vie_man_horario_detalle`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vie_man_horario_detalle` AS select `a`.`ID_HORARIO_DETALLE` AS `ID_HORARIO_DETALLE`,`a`.`ID_CURSO` AS `ID_CURSO`,`b`.`DESCRIPCION` AS `DESC_CURSO`,`a`.`SECCION` AS `SECCION`,`a`.`ID_HORARIO` AS `ID_HORARIO`,`a`.`TIPO_HORARIO` AS `TIPO_HORARIO`,`a`.`HORARIO_INICIO` AS `HORARIO_INICIO`,`a`.`HORARIO_FIN` AS `HORARIO_FIN` from (`mae_horario_detalle` `a` left join `mae_curso` `b` on((`b`.`ID_CURSO` = `a`.`ID_CURSO`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vie_man_multitab_cab`
--

/*!50001 DROP VIEW IF EXISTS `vie_man_multitab_cab`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vie_man_multitab_cab` AS select `a`.`ID_MULTITAB_CAB` AS `ID_MULTITAB_CAB`,`a`.`DESCRIPCION` AS `DESCRIPCION_MULTITAB_CAB` from `mae_multitab_cab` `a` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vie_man_multitab_det`
--

/*!50001 DROP VIEW IF EXISTS `vie_man_multitab_det`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vie_man_multitab_det` AS select `a`.`ID_MULTITAB_CAB` AS `ID_MULTITAB_CAB`,`b`.`DESCRIPCION` AS `DESCRIPCION_MULTITAB_CAB`,`a`.`ID_MULTITAB_DET` AS `ID_MULTITAB_DET`,`a`.`DESCRIPCION_ITEM` AS `DESCRIPCION_ITEM`,`a`.`ABREVIATURA` AS `ABREVIATURA` from (`mae_multitab_det` `a` left join `mae_multitab_cab` `b` on((`a`.`ID_MULTITAB_CAB` = `b`.`ID_MULTITAB_CAB`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vie_man_plan_academico`
--

/*!50001 DROP VIEW IF EXISTS `vie_man_plan_academico`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vie_man_plan_academico` AS select `a`.`ID_PLAN` AS `ID_PLAN`,`a`.`DESCRIPCION` AS `DESCRIPCION_PLAN`,`a`.`FACULTAD` AS `FACULTAD`,`a`.`ESCUELA` AS `ESCUELA`,`b`.`DESCRIPCION_ITEM` AS `DESCRIPCION_ESCUELA`,`a`.`ESPECIALIDAD` AS `ESPECIALIDAD` from (`mae_plan` `a` left join `mae_multitab_det` `b` on(((`a`.`ESCUELA` = `b`.`ID_MULTITAB_DET`) and (`b`.`ID_MULTITAB_CAB` = 3)))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vie_man_programacion_academica`
--

/*!50001 DROP VIEW IF EXISTS `vie_man_programacion_academica`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vie_man_programacion_academica` AS select `a`.`ID_CURSO` AS `ID_CURSO`,`b`.`DESCRIPCION` AS `DESCRIPCION_CURSO`,`a`.`SECCION` AS `SECCION`,`a`.`ID_DOCENTE` AS `ID_DOCENTE`,concat(`c`.`NOMBRES`,' ',`c`.`APELLIDOS`) AS `NOMBRES_DOCENTE`,`a`.`TOPE` AS `TOPE`,`a`.`MATRICULADOS` AS `MATRICULADOS`,`a`.`TURNO` AS `TURNO`,`d`.`DESCRIPCION_ITEM` AS `DESCRIPCION_TURNO`,`a`.`AULA` AS `AULA` from (((`mae_programacion` `a` left join `mae_curso` `b` on((`a`.`ID_CURSO` = `b`.`ID_CURSO`))) left join `mae_docente` `c` on((`a`.`ID_DOCENTE` = `c`.`ID_DOCENTE`))) left join `mae_multitab_det` `d` on(((`a`.`TURNO` = `d`.`ID_MULTITAB_DET`) and (`d`.`ID_MULTITAB_CAB` = 10)))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vie_man_solicitante`
--

/*!50001 DROP VIEW IF EXISTS `vie_man_solicitante`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vie_man_solicitante` AS select `a`.`ID_SOLICITANTE` AS `ID_SOLICITANTE`,`a`.`DNI` AS `DNI`,`a`.`NOMBRES` AS `NOMBRES`,`a`.`APELLIDO_PATERNO` AS `APELLIDO_PATERNO`,`a`.`APELLIDO_MATERNO` AS `APELLIDO_MATERNO`,`a`.`CELULAR` AS `CELULAR`,`a`.`EMAIL` AS `EMAIL`,`a`.`TIPO_SOLICITANTE` AS `TIPO_SOLICITANTE`,`b`.`DESCRIPCION_ITEM` AS `DESCRIPCION_TIPO_SOLICITANTE`,`a`.`BASE` AS `BASE`,`a`.`ESCUELA` AS `ESCUELA`,`c`.`DESCRIPCION_ITEM` AS `DESCRIPCION_ESCUELA` from ((`mae_solicitante` `a` left join `mae_multitab_det` `b` on(((`a`.`TIPO_SOLICITANTE` = `b`.`ID_MULTITAB_DET`) and (`b`.`ID_MULTITAB_CAB` = 6)))) left join `mae_multitab_det` `c` on(((`a`.`ESCUELA` = `b`.`ID_MULTITAB_DET`) and (`b`.`ID_MULTITAB_CAB` = 3)))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vie_mant_mae_parametros_generales`
--

/*!50001 DROP VIEW IF EXISTS `vie_mant_mae_parametros_generales`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vie_mant_mae_parametros_generales` AS select `mae_parametros_generales`.`PERIODO` AS `PERIODO` from `mae_parametros_generales` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vie_solicitud`
--

/*!50001 DROP VIEW IF EXISTS `vie_solicitud`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vie_solicitud` AS select `a`.`ID_SOLICITUD` AS `ID_SOLICITUD`,`a`.`ID_ESPACIO_ACADEMICO` AS `ID_ESPACIO_ACADEMICO`,`c`.`DESCRIPCION` AS `DESCRIPCION_ESPACIO_ACADEMICO`,`a`.`ID_SOLICITANTE` AS `ID_SOLICITANTE`,`b`.`DNI` AS `DNI`,`b`.`NOMBRES` AS `NOMBRES`,`b`.`APELLIDO_PATERNO` AS `APELLIDO_PATERNO`,`b`.`APELLIDO_MATERNO` AS `APELLIDO_MATERNO`,`a`.`ESTADO_SOLICITUD` AS `ESTADO_SOLICITUD`,`d`.`DESCRIPCION_ITEM` AS `DESCRIPCION_ESTADO_SOLICITUD`,`a`.`TIPO_SOLICITUD` AS `TIPO_SOLICITUD`,`e`.`DESCRIPCION_ITEM` AS `DESCRIPCION_TIPO_SOLICITUD`,`a`.`MOTIVO` AS `MOTIVO`,`a`.`FECHA_REGISTRO` AS `FECHA_REGISTRO`,`a`.`FECHA_RESERVA` AS `FECHA_RESERVA`,`a`.`HORA_INICIO` AS `HORA_INICIO`,`a`.`HORA_FIN` AS `HORA_FIN`,`a`.`ESTADO_ASISTENCIA` AS `ESTADO_ASISTENCIA` from ((((`mov_solicitud` `a` left join `mae_solicitante` `b` on((`a`.`ID_SOLICITANTE` = `b`.`ID_SOLICITANTE`))) left join `mae_espacio_academico` `c` on((`a`.`ID_ESPACIO_ACADEMICO` = `c`.`ID_ESPACIO_ACADEMICO`))) left join `mae_multitab_det` `d` on(((`d`.`ID_MULTITAB_CAB` = 7) and (`d`.`ID_MULTITAB_DET` = `a`.`ESTADO_SOLICITUD`)))) left join `mae_multitab_det` `e` on(((`e`.`ID_MULTITAB_CAB` = 8) and (`e`.`ID_MULTITAB_DET` = `a`.`TIPO_SOLICITUD`)))) */;
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

-- Dump completed on 2020-02-23 22:37:56
