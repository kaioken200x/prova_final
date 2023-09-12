-- MySQL dump 10.13  Distrib 8.0.32, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: prova
-- ------------------------------------------------------
-- Server version	8.0.32

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
-- Table structure for table `funcao`
--

DROP TABLE IF EXISTS `funcao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `funcao` (
  `id` int NOT NULL,
  `nome` varchar(85) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `funcao`
--

LOCK TABLES `funcao` WRITE;
/*!40000 ALTER TABLE `funcao` DISABLE KEYS */;
INSERT INTO `funcao` VALUES (1,'desenvolvedor'),(2,'motorista'),(3,'segurança'),(4,'gerente');
/*!40000 ALTER TABLE `funcao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `funcionario`
--

DROP TABLE IF EXISTS `funcionario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `funcionario` (
  `id` int NOT NULL,
  `nome` varchar(45) NOT NULL,
  `matricula` varchar(45) NOT NULL,
  `data_cadastro` datetime DEFAULT NULL,
  `funcao_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `funcionarios` (`id`,`matricula`),
  KEY `funcao_id_idx` (`funcao_id`),
  CONSTRAINT `funcao_id` FOREIGN KEY (`funcao_id`) REFERENCES `funcao` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `funcionario`
--

LOCK TABLES `funcionario` WRITE;
/*!40000 ALTER TABLE `funcionario` DISABLE KEYS */;
INSERT INTO `funcionario` VALUES (1,'Lucas','100','2023-09-12 09:19:10',4),(2,'Rafael','90','2023-09-12 09:19:10',3),(3,'Maria','120','2023-09-12 09:19:10',2),(4,'Pedro','115','2023-09-12 09:19:10',1);
/*!40000 ALTER TABLE `funcionario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rastreamento`
--

DROP TABLE IF EXISTS `rastreamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rastreamento` (
  `id` int NOT NULL,
  `id_veiculo` int NOT NULL,
  `velocidade_registrada` int NOT NULL,
  `id_funcionario` int NOT NULL,
  `latitude` varchar(16) NOT NULL,
  `longitudo` varchar(16) NOT NULL,
  `data` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `rastreamento` (`id`,`id_veiculo`,`id_funcionario`),
  KEY `id_funcionario_idx` (`id_funcionario`),
  KEY `id_veiculo_idx` (`id_veiculo`),
  CONSTRAINT `id_funcionario` FOREIGN KEY (`id_funcionario`) REFERENCES `funcionario` (`id`),
  CONSTRAINT `id_veiculo` FOREIGN KEY (`id_veiculo`) REFERENCES `veiculo` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rastreamento`
--

LOCK TABLES `rastreamento` WRITE;
/*!40000 ALTER TABLE `rastreamento` DISABLE KEYS */;
INSERT INTO `rastreamento` VALUES (1,2,75,2,'-21.9289748','-43.7719023','2023-09-10 10:15:01'),(2,4,100,1,'-21.7290384','-43.464923','2023-09-12 10:15:01'),(3,2,110,3,'-21.7290384','-43.464923','2023-09-05 10:15:01'),(4,3,150,4,'-21.7290384','-43.464923','2023-09-01 10:15:01');
/*!40000 ALTER TABLE `rastreamento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `veiculo`
--

DROP TABLE IF EXISTS `veiculo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `veiculo` (
  `id` int NOT NULL,
  `placa` varchar(10) NOT NULL,
  `vel_maxima` int NOT NULL,
  `data_cadastro` datetime DEFAULT NULL,
  `nome` varchar(60) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `funcionarios` (`id`,`placa`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `veiculo`
--

LOCK TABLES `veiculo` WRITE;
/*!40000 ALTER TABLE `veiculo` DISABLE KEYS */;
INSERT INTO `veiculo` VALUES (1,'kkk1234',80,'2023-09-12 09:08:49','hb20s'),(2,'kkk1D34',100,'2023-09-12 09:13:27','gol'),(3,'kkk1B34',90,'2023-09-12 09:13:27','Fiat Uno'),(4,'kkk1X34',120,'2023-09-12 09:13:27','Sandeiro'),(5,'kkk1Xh4',115,'2023-09-12 09:13:27','Opala');
/*!40000 ALTER TABLE `veiculo` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-09-12 12:39:54
