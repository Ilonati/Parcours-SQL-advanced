-- MySQL dump 10.13  Distrib 9.3.0, for Win64 (x86_64)
--
-- Host: localhost    Database: gameworld
-- ------------------------------------------------------
-- Server version	9.3.0

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `equipes`
--

DROP TABLE IF EXISTS `equipes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `equipes` (
  `id` int NOT NULL,
  `nom` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `equipes`
--

LOCK TABLES `equipes` WRITE;
/*!40000 ALTER TABLE `equipes` DISABLE KEYS */;
INSERT INTO `equipes` VALUES (1,'RedDragons'),(2,'NightOwls'),(3,'SoloSquad');
/*!40000 ALTER TABLE `equipes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `genres`
--

DROP TABLE IF EXISTS `genres`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `genres` (
  `id` int NOT NULL,
  `nom` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `genres`
--

LOCK TABLES `genres` WRITE;
/*!40000 ALTER TABLE `genres` DISABLE KEYS */;
INSERT INTO `genres` VALUES (1,'FPS'),(2,'RPG'),(3,'Strat?gie'),(4,'Plateforme');
/*!40000 ALTER TABLE `genres` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jeux`
--

DROP TABLE IF EXISTS `jeux`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jeux` (
  `id` int NOT NULL,
  `titre` varchar(100) NOT NULL,
  `annee_sortie` int NOT NULL,
  `id_genre` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_genre` (`id_genre`),
  CONSTRAINT `jeux_ibfk_1` FOREIGN KEY (`id_genre`) REFERENCES `genres` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jeux`
--

LOCK TABLES `jeux` WRITE;
/*!40000 ALTER TABLE `jeux` DISABLE KEYS */;
INSERT INTO `jeux` VALUES (1,'Warzone 3000',2021,1),(2,'Elven Quest',2019,2),(3,'Galaxy Tactics',2020,3),(4,'JumpMaster',2018,4),(5,'CyberStrike',2022,1),(6,'Dungeon Souls',2020,2),(7,'Battle Chess',2023,3),(8,'Sky Jumper',2017,4);
/*!40000 ALTER TABLE `jeux` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `joueurs`
--

DROP TABLE IF EXISTS `joueurs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `joueurs` (
  `id` int NOT NULL,
  `pseudo` varchar(50) NOT NULL,
  `pays` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `joueurs`
--

LOCK TABLES `joueurs` WRITE;
/*!40000 ALTER TABLE `joueurs` DISABLE KEYS */;
INSERT INTO `joueurs` VALUES (1,'ShadowKiller','France'),(2,'Elfae','Canada'),(3,'NoobMaster69','USA'),(4,'Z3r0Cool','Allemagne'),(5,'PixelPro','France'),(6,'MissClick','Espagne'),(7,'LagWizard','Italie'),(8,'Headshotz','France'),(9,'ManaQueen','Br?sil'),(10,'StunLock','France'),(11,'AltF4','Belgique'),(12,'AFKLord','Su?de');
/*!40000 ALTER TABLE `joueurs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `membres_equipes`
--

DROP TABLE IF EXISTS `membres_equipes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `membres_equipes` (
  `id_equipe` int NOT NULL,
  `id_joueur` int NOT NULL,
  PRIMARY KEY (`id_equipe`,`id_joueur`),
  KEY `id_joueur` (`id_joueur`),
  CONSTRAINT `membres_equipes_ibfk_1` FOREIGN KEY (`id_equipe`) REFERENCES `equipes` (`id`),
  CONSTRAINT `membres_equipes_ibfk_2` FOREIGN KEY (`id_joueur`) REFERENCES `joueurs` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `membres_equipes`
--

LOCK TABLES `membres_equipes` WRITE;
/*!40000 ALTER TABLE `membres_equipes` DISABLE KEYS */;
INSERT INTO `membres_equipes` VALUES (1,1),(1,2),(2,3),(2,4),(3,5),(3,6),(2,8);
/*!40000 ALTER TABLE `membres_equipes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `scores`
--

DROP TABLE IF EXISTS `scores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `scores` (
  `id_session` int NOT NULL,
  `id_joueur` int NOT NULL,
  `score` int DEFAULT NULL,
  PRIMARY KEY (`id_session`,`id_joueur`),
  KEY `id_joueur` (`id_joueur`),
  CONSTRAINT `scores_ibfk_1` FOREIGN KEY (`id_session`) REFERENCES `sessions` (`id`),
  CONSTRAINT `scores_ibfk_2` FOREIGN KEY (`id_joueur`) REFERENCES `joueurs` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `scores`
--

LOCK TABLES `scores` WRITE;
/*!40000 ALTER TABLE `scores` DISABLE KEYS */;
INSERT INTO `scores` VALUES (1,1,1200),(1,2,950),(2,1,1300),(2,3,800),(3,2,1500),(3,4,1100),(4,3,1250),(4,5,1400),(5,6,1600),(6,1,1550),(6,7,1333),(6,8,999),(7,2,1432),(7,5,1200),(7,10,800),(8,3,1220),(8,9,1450),(9,6,1100),(9,11,920),(10,1,1350),(10,2,1490),(10,12,1050),(11,4,870),(11,5,900),(11,8,1240),(12,1,1600),(12,2,1200),(12,7,1100),(12,9,1170),(12,10,1250);
/*!40000 ALTER TABLE `scores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sessions`
--

DROP TABLE IF EXISTS `sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sessions` (
  `id` int NOT NULL,
  `id_jeu` int DEFAULT NULL,
  `date_session` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_jeu` (`id_jeu`),
  CONSTRAINT `sessions_ibfk_1` FOREIGN KEY (`id_jeu`) REFERENCES `jeux` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sessions`
--

LOCK TABLES `sessions` WRITE;
/*!40000 ALTER TABLE `sessions` DISABLE KEYS */;
INSERT INTO `sessions` VALUES (1,1,'2024-01-10'),(2,1,'2024-02-15'),(3,2,'2024-01-20'),(4,3,'2024-03-12'),(5,4,'2024-01-28'),(6,5,'2024-04-03'),(7,6,'2024-04-15'),(8,7,'2024-05-01'),(9,8,'2024-05-10'),(10,2,'2024-05-20'),(11,3,'2024-06-01'),(12,5,'2024-06-10');
/*!40000 ALTER TABLE `sessions` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-07-06 14:13:33
