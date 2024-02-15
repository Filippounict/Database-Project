-- MySQL dump 10.13  Distrib 8.0.32, for Win64 (x86_64)
--
-- Host: localhost    Database: cinemamultisala
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
-- Table structure for table `abbonamento`
--

DROP TABLE IF EXISTS `abbonamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `abbonamento` (
  `IdAbbonamento` int NOT NULL,
  `IdCliente` int NOT NULL,
  `tipologia` varchar(255) NOT NULL,
  `dataInizio` date NOT NULL,
  PRIMARY KEY (`IdAbbonamento`),
  KEY `IdCliente` (`IdCliente`),
  CONSTRAINT `abbonamento_ibfk_1` FOREIGN KEY (`IdCliente`) REFERENCES `cliente` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `abbonamento`
--

LOCK TABLES `abbonamento` WRITE;
/*!40000 ALTER TABLE `abbonamento` DISABLE KEYS */;
INSERT INTO `abbonamento` VALUES (1500,2,'settimanale','2022-11-10'),(1501,4,'mensile','2022-02-08');
/*!40000 ALTER TABLE `abbonamento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cliente` (
  `Id` int NOT NULL,
  `cognome` varchar(255) DEFAULT NULL,
  `data_di_nascita` date DEFAULT NULL,
  `indirizzo_email` varchar(255) DEFAULT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  `nome` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
INSERT INTO `cliente` VALUES (1,'Rossi','1990-01-01','rossi@gmail.com','3331234567','Mario'),(2,'Bianchi','1985-02-15','bianchi@hotmail.com','3456789012','Rolando'),(3,'Verdi','1978-06-20','verdi@yahoo.com','3894561234','Giuseppe'),(4,'Neri','1995-09-10','neri@libero.it','3339876543','Piero'),(5,'Gialli','1980-12-05','gialli@outlook.com','3471234567','Filippo');
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `evento`
--

DROP TABLE IF EXISTS `evento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `evento` (
  `IdEvento` varchar(50) NOT NULL,
  `codiceFilm` varchar(50) NOT NULL,
  `dataEvento` date NOT NULL,
  `oraEvento` time NOT NULL,
  `tipoEvento` varchar(50) NOT NULL,
  `prezzoEvento` decimal(6,2) NOT NULL,
  `NumeroSala` int NOT NULL,
  PRIMARY KEY (`IdEvento`),
  KEY `codiceFilm` (`codiceFilm`),
  KEY `NumeroSala` (`NumeroSala`),
  CONSTRAINT `evento_ibfk_1` FOREIGN KEY (`codiceFilm`) REFERENCES `film` (`codiceFilm`),
  CONSTRAINT `evento_ibfk_2` FOREIGN KEY (`NumeroSala`) REFERENCES `sala` (`NumeroSala`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `evento`
--

LOCK TABLES `evento` WRITE;
/*!40000 ALTER TABLE `evento` DISABLE KEYS */;
INSERT INTO `evento` VALUES ('E1','F001','2022-11-12','20:30:00','2D',8.50,500),('E2','F002','2022-10-09','21:30:00','3D',12.00,501),('E3','F003','2022-09-12','20:00:00','4D',15.00,502),('E4','F004','2022-02-13','17:30:00','2D',12.00,503),('E5','F005','2022-10-10','18:00:00','3D',11.00,504);
/*!40000 ALTER TABLE `evento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `film`
--

DROP TABLE IF EXISTS `film`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `film` (
  `codiceFilm` varchar(50) NOT NULL,
  `titolo` varchar(100) NOT NULL,
  `genere` varchar(50) NOT NULL,
  `durata` time NOT NULL,
  `data_di_uscita` date NOT NULL,
  `regista` varchar(100) NOT NULL,
  PRIMARY KEY (`codiceFilm`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `film`
--

LOCK TABLES `film` WRITE;
/*!40000 ALTER TABLE `film` DISABLE KEYS */;
INSERT INTO `film` VALUES ('F001','The Shawshank Redemption','Drammatico','02:22:00','1994-09-14','Frank Darabont'),('F002','The Godfather','Drammatico','02:58:00','1972-03-24','Francis Ford Coppola'),('F003','The Dark Knight','Azione','02:32:00','2008-07-23','Christopher Nolan'),('F004','Pulp Fiction','Criminalità','02:34:00','1994-09-10','Quentin Tarantino'),('F005','Forrest Gump','Commedia','02:22:00','1994-11-03','Robert Zemeckis');
/*!40000 ALTER TABLE `film` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `posto`
--

DROP TABLE IF EXISTS `posto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `posto` (
  `identificativoPosto` varchar(50) NOT NULL,
  `identificativoFila` varchar(50) NOT NULL,
  `NumeroSala` int NOT NULL,
  `IdPrenotazione` int NOT NULL,
  PRIMARY KEY (`identificativoPosto`,`identificativoFila`,`NumeroSala`,`IdPrenotazione`),
  KEY `NumeroSala` (`NumeroSala`),
  KEY `IdPrenotazione` (`IdPrenotazione`),
  CONSTRAINT `posto_ibfk_1` FOREIGN KEY (`NumeroSala`) REFERENCES `sala` (`NumeroSala`),
  CONSTRAINT `posto_ibfk_2` FOREIGN KEY (`IdPrenotazione`) REFERENCES `prenotazione` (`IdPrenotazione`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `posto`
--

LOCK TABLES `posto` WRITE;
/*!40000 ALTER TABLE `posto` DISABLE KEYS */;
INSERT INTO `posto` VALUES ('F1','F',500,1000),('A2','A',501,1001),('A6','A',502,1002),('B9','B',503,1003),('C2','C',504,1004);
/*!40000 ALTER TABLE `posto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prenotazione`
--

DROP TABLE IF EXISTS `prenotazione`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `prenotazione` (
  `IdPrenotazione` int NOT NULL,
  `IdCliente` int NOT NULL,
  `IdEvento` varchar(50) NOT NULL,
  `costiPrenotazione` decimal(6,2) NOT NULL,
  `dataPrenotazione` date NOT NULL,
  `statoPrenotazione` varchar(50) NOT NULL,
  PRIMARY KEY (`IdPrenotazione`),
  KEY `IdCliente` (`IdCliente`),
  KEY `IdEvento` (`IdEvento`),
  CONSTRAINT `prenotazione_ibfk_1` FOREIGN KEY (`IdCliente`) REFERENCES `cliente` (`Id`),
  CONSTRAINT `prenotazione_ibfk_2` FOREIGN KEY (`IdEvento`) REFERENCES `evento` (`IdEvento`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prenotazione`
--

LOCK TABLES `prenotazione` WRITE;
/*!40000 ALTER TABLE `prenotazione` DISABLE KEYS */;
INSERT INTO `prenotazione` VALUES (1000,1,'E1',10.00,'2022-11-11','attiva'),(1001,2,'E2',15.00,'2022-10-08','attiva'),(1002,3,'E3',17.00,'2022-09-10','annullata'),(1003,4,'E4',15.00,'2022-02-11','attiva'),(1004,5,'E5',15.00,'2022-10-09','annullata');
/*!40000 ALTER TABLE `prenotazione` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sala`
--

DROP TABLE IF EXISTS `sala`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sala` (
  `NumeroSala` int NOT NULL,
  `codiceFilm` varchar(50) NOT NULL,
  `capienza` int NOT NULL,
  `tipologia` varchar(50) NOT NULL,
  PRIMARY KEY (`NumeroSala`),
  KEY `codiceFilm` (`codiceFilm`),
  CONSTRAINT `sala_ibfk_1` FOREIGN KEY (`codiceFilm`) REFERENCES `film` (`codiceFilm`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sala`
--

LOCK TABLES `sala` WRITE;
/*!40000 ALTER TABLE `sala` DISABLE KEYS */;
INSERT INTO `sala` VALUES (500,'F001',90,'2D'),(501,'F002',125,'3D'),(502,'F003',150,'4D'),(503,'F004',80,'2D'),(504,'F005',100,'3D');
/*!40000 ALTER TABLE `sala` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'cinemamultisala'
--

--
-- Dumping routines for database 'cinemamultisala'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-02-28 17:22:51
