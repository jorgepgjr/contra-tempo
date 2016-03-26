CREATE DATABASE  IF NOT EXISTS `contra_tempo` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `contra_tempo`;
-- MySQL dump 10.13  Distrib 5.5.40, for debian-linux-gnu (x86_64)
--
-- Host: 127.0.0.1    Database: contra_tempo
-- ------------------------------------------------------
-- Server version	5.5.40-0ubuntu0.14.04.1

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
-- Table structure for table `turma`
--

DROP TABLE IF EXISTS `turma`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `turma` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `ativa` bit(1) NOT NULL,
  `horario` datetime DEFAULT NULL,
  `nivel` varchar(255) DEFAULT NULL,
  `nome` varchar(255) DEFAULT NULL,
  `sala` varchar(255) DEFAULT NULL,
  `valor_padrao` double DEFAULT NULL,
  `professor_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_qokw1jkc8dj8uu9c4cw7oqd1b` (`professor_id`),
  CONSTRAINT `FK_qokw1jkc8dj8uu9c4cw7oqd1b` FOREIGN KEY (`professor_id`) REFERENCES `professor` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=108 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `turma`
--

LOCK TABLES `turma` WRITE;
/*!40000 ALTER TABLE `turma` DISABLE KEYS */;
INSERT INTO `turma` VALUES (21,'',NULL,NULL,'Sal-quarta',NULL,65,17),(22,'',NULL,NULL,'Sertan.',NULL,65,19),(24,'',NULL,NULL,'Fit Dance',NULL,50,37),(25,'',NULL,NULL,'Sertanejo I - terça/qta',NULL,65,19),(26,'',NULL,NULL,'Samba e forró II -Terça',NULL,75,20),(27,'',NULL,NULL,'Tango 0- Cristopher',NULL,75,21),(28,'',NULL,NULL,'Salsa - quarta',NULL,65,15),(29,'',NULL,NULL,'Dança de Salão -tarde',NULL,70,20),(31,'',NULL,NULL,'Stilleto (Leandro)',NULL,75,16),(33,'',NULL,NULL,'Dança de Salão -Cristopher',NULL,70,21),(35,'',NULL,NULL,'Lindy Hop',NULL,65,25),(37,'',NULL,NULL,'Zouk I -sexta Ewerton',NULL,65,24),(39,'',NULL,NULL,'Zumba',NULL,60,22),(47,'',NULL,NULL,'Dança de Salão - Sabado',NULL,65,20),(48,'',NULL,NULL,'Zouk intens. -sab. Leandro',NULL,80,17),(54,'',NULL,NULL,'SAMBA I - quarta',NULL,65,15),(56,'',NULL,NULL,'Ballet Fit / Jazz',NULL,65,27),(57,'',NULL,NULL,'Forró -seg fechou',NULL,65,20),(58,'',NULL,NULL,'Forró II -Terça',NULL,70,28),(59,'',NULL,NULL,'Samba e Forró III -seg.',NULL,75,15),(61,'',NULL,NULL,'Contemporâneo -sexta',NULL,65,33),(62,'',NULL,NULL,'Zouk (grupo) Leandro',NULL,75,17),(63,'',NULL,NULL,'Zouk I- quarta Leandro',NULL,65,17),(65,'',NULL,NULL,'Zouk & Salsa',NULL,75,29),(66,'',NULL,NULL,'Forró II - Sabado',NULL,70,28),(68,'',NULL,NULL,'Samba Rock I',NULL,65,30),(70,'',NULL,NULL,'Samba e Bolero -sexta Cris',NULL,70,21),(71,'',NULL,NULL,'Dança de Salão -Jimmy',NULL,70,31),(73,'',NULL,NULL,'Gafieira- terça - Vilela',NULL,65,32),(74,'',NULL,NULL,'curso intensivo for/sal/tan/vane',NULL,65,20),(76,'',NULL,NULL,'Stiletto - Sergio',NULL,65,41),(78,'',NULL,NULL,'Street Dance',NULL,50,34),(80,'',NULL,NULL,'Kizomba - Élica',NULL,65,36),(82,'',NULL,NULL,'Gafieira -Leo',NULL,65,19),(83,'',NULL,NULL,'Vanera',NULL,70,38),(84,'',NULL,NULL,'Dança do Ventre',NULL,65,39),(85,'',NULL,NULL,'Sertanejo - Kleber',NULL,100,40),(86,'',NULL,NULL,'Zouk - Erika/Ricardo',NULL,60,24),(87,'',NULL,NULL,'Forró 0-segunda',NULL,65,28),(88,'',NULL,NULL,'Salsa - Vilela',NULL,65,32),(89,'',NULL,NULL,'Zouk III -Élica',NULL,65,36),(91,'',NULL,NULL,'Dance +',NULL,100,27),(96,'',NULL,NULL,'Samba Combo',NULL,80,30),(97,'',NULL,NULL,'Ballet Infantil',NULL,65,42),(98,'',NULL,NULL,'zouk 0 - Élica',NULL,70,36),(99,'',NULL,NULL,'Mix :Sertanejo/forró',NULL,75,19),(101,'',NULL,NULL,'Gafieira - Cristopher',NULL,75,21),(103,'',NULL,NULL,'Bolero e Forró - Cristopher',NULL,75,21),(104,'',NULL,NULL,'Forró 0- sabado',NULL,65,28),(106,'',NULL,NULL,'Bachata',NULL,65,43),(107,'',NULL,NULL,'Dança de Salão sab- Leandro',NULL,75,17);
/*!40000 ALTER TABLE `turma` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-03-26 15:09:11
