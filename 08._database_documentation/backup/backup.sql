-- MySQL dump 10.13  Distrib 8.0.32, for macos11.7 (x86_64)
--
-- Host: localhost    Database: mydb
-- ------------------------------------------------------
-- Server version	8.0.31

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
-- Table structure for table `countries`
--

DROP TABLE IF EXISTS `countries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `countries` (
  `country_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`country_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `countries`
--

LOCK TABLES `countries` WRITE;
/*!40000 ALTER TABLE `countries` DISABLE KEYS */;
INSERT INTO `countries` VALUES (1,'Denmark'),(2,'United States'),(3,'Spain'),(4,'Greece');
/*!40000 ALTER TABLE `countries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `locations`
--

DROP TABLE IF EXISTS `locations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `locations` (
  `location_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `countries_country_id` int NOT NULL,
  PRIMARY KEY (`location_id`,`countries_country_id`),
  KEY `fk_locations_countries1_idx` (`countries_country_id`),
  CONSTRAINT `fk_locations_countries1` FOREIGN KEY (`countries_country_id`) REFERENCES `countries` (`country_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `locations`
--

LOCK TABLES `locations` WRITE;
/*!40000 ALTER TABLE `locations` DISABLE KEYS */;
INSERT INTO `locations` VALUES (1,'New York City',2),(2,'Grand Canyon',2),(3,'Yellowstone',2),(4,'Copenhagen',1),(5,'Barcelonas Sagrada Familia and Gaudi sites',3),(6,'Knossos, Crete',4);
/*!40000 ALTER TABLE `locations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `package_tags`
--

DROP TABLE IF EXISTS `package_tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `package_tags` (
  `tags_tag_id` int NOT NULL,
  `packages_package_id` int NOT NULL,
  KEY `fk_package_tags_tags1_idx` (`tags_tag_id`),
  KEY `fk_package_tags_packages1_idx` (`packages_package_id`),
  CONSTRAINT `fk_package_tags_packages1` FOREIGN KEY (`packages_package_id`) REFERENCES `packages` (`package_id`),
  CONSTRAINT `fk_package_tags_tags1` FOREIGN KEY (`tags_tag_id`) REFERENCES `tags` (`tag_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `package_tags`
--

LOCK TABLES `package_tags` WRITE;
/*!40000 ALTER TABLE `package_tags` DISABLE KEYS */;
INSERT INTO `package_tags` VALUES (7,1),(7,2),(7,3),(8,4);
/*!40000 ALTER TABLE `package_tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `packages`
--

DROP TABLE IF EXISTS `packages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `packages` (
  `package_id` int NOT NULL AUTO_INCREMENT,
  `description` varchar(500) NOT NULL,
  `price` decimal(9,2) NOT NULL,
  `discount` decimal(9,2) DEFAULT NULL,
  PRIMARY KEY (`package_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `packages`
--

LOCK TABLES `packages` WRITE;
/*!40000 ALTER TABLE `packages` DISABLE KEYS */;
INSERT INTO `packages` VALUES (1,'Famous locations in the United states',5400.99,500.00),(2,'Tour in New York City',3899.99,350.00),(3,'Referred to as Europes oldet city, Knossos is an archeologial site on Crete dating back to the bronze age',3200.49,399.99),(4,'The famous & beautiful Scandinavial capital of denmark, Copenhagen',2500.99,200.00);
/*!40000 ALTER TABLE `packages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reviews`
--

DROP TABLE IF EXISTS `reviews`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reviews` (
  `review_id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `rating` int NOT NULL,
  `visit_date` date NOT NULL,
  `text` varchar(500) DEFAULT NULL,
  `trips_trip_id` int NOT NULL,
  `user_user_id` int NOT NULL,
  PRIMARY KEY (`review_id`,`trips_trip_id`,`user_user_id`),
  KEY `fk_reviews_trips1_idx` (`trips_trip_id`),
  KEY `fk_reviews_user1_idx` (`user_user_id`),
  CONSTRAINT `fk_reviews_trips1` FOREIGN KEY (`trips_trip_id`) REFERENCES `trips` (`trip_id`),
  CONSTRAINT `fk_reviews_user1` FOREIGN KEY (`user_user_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reviews`
--

LOCK TABLES `reviews` WRITE;
/*!40000 ALTER TABLE `reviews` DISABLE KEYS */;
INSERT INTO `reviews` VALUES (1,'Super exciting tour in New York',5,'2020-05-01','We got picked up at the hotel by the guide....tbd',2,1),(2,'Hyggelig tur til københavn',5,'2022-04-21','tbd',1,3),(3,'Exceptional tour to knossos',4,'2021-04-11','tbd',5,1);
/*!40000 ALTER TABLE `reviews` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tags`
--

DROP TABLE IF EXISTS `tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tags` (
  `tag_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  PRIMARY KEY (`tag_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tags`
--

LOCK TABLES `tags` WRITE;
/*!40000 ALTER TABLE `tags` DISABLE KEYS */;
INSERT INTO `tags` VALUES (1,'Outdoors'),(2,'Food & Drink'),(3,'Art & Culture'),(4,'By the water'),(5,'Nature'),(6,'City'),(7,'Best seller'),(8,'groups');
/*!40000 ALTER TABLE `tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trip_tags`
--

DROP TABLE IF EXISTS `trip_tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `trip_tags` (
  `tags_tag_id` int NOT NULL,
  `trips_trip_id` int NOT NULL,
  `trips_locations_location_id` int NOT NULL,
  `trips_packages_package_id` int DEFAULT NULL,
  KEY `fk_trip_tags_tags1_idx` (`tags_tag_id`),
  KEY `fk_trip_tags_trips1_idx` (`trips_trip_id`,`trips_locations_location_id`,`trips_packages_package_id`),
  CONSTRAINT `fk_trip_tags_tags1` FOREIGN KEY (`tags_tag_id`) REFERENCES `tags` (`tag_id`),
  CONSTRAINT `fk_trip_tags_trips1` FOREIGN KEY (`trips_trip_id`, `trips_locations_location_id`, `trips_packages_package_id`) REFERENCES `trips` (`trip_id`, `locations_location_id`, `packages_package_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trip_tags`
--

LOCK TABLES `trip_tags` WRITE;
/*!40000 ALTER TABLE `trip_tags` DISABLE KEYS */;
INSERT INTO `trip_tags` VALUES (1,1,4,NULL),(1,2,1,2),(5,2,1,2),(5,3,1,2),(3,4,1,2),(5,5,6,3);
/*!40000 ALTER TABLE `trip_tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trips`
--

DROP TABLE IF EXISTS `trips`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `trips` (
  `trip_id` int NOT NULL AUTO_INCREMENT,
  `description` varchar(500) NOT NULL,
  `price` decimal(9,2) NOT NULL,
  `length` varchar(255) DEFAULT NULL,
  `title` varchar(255) NOT NULL,
  `availabilty` varchar(255) NOT NULL,
  `locations_location_id` int NOT NULL,
  `packages_package_id` int NOT NULL,
  PRIMARY KEY (`trip_id`,`locations_location_id`,`packages_package_id`),
  KEY `fk_trips_locations1_idx` (`locations_location_id`),
  KEY `fk_trips_packages1_idx` (`packages_package_id`),
  CONSTRAINT `fk_trips_locations1` FOREIGN KEY (`locations_location_id`) REFERENCES `locations` (`location_id`),
  CONSTRAINT `fk_trips_packages1` FOREIGN KEY (`packages_package_id`) REFERENCES `packages` (`package_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trips`
--

LOCK TABLES `trips` WRITE;
/*!40000 ALTER TABLE `trips` DISABLE KEYS */;
INSERT INTO `trips` VALUES (1,'tbd',150.00,'Between 1-2 hours','The little mermaid in Copenhagen','everyday',4,4),(2,'tbd',75.00,'Between 1-2 hours','The statue of liberty','everyday',1,2),(3,'tbd',0.00,'1 hour','Central Park','everyday',1,2),(4,'tbd',200.00,'Between 3-4 hours','Metropolitan Museum of Art','All days exept Wednesday, from 10-17 on weekdays & 10-21 Friday, Saturday',1,2),(5,'tbd',299.99,'Around 2 hours','Knossos archeologial site','Tuesday & Thursday between 10-21',6,3);
/*!40000 ALTER TABLE `trips` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `user_id` int NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(32) NOT NULL,
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'admin123@gmail.com','12345','2023-02-28 19:12:05'),(2,'Lynn_Rehman5192@twipet.com','noonewillguessthis','2023-02-28 19:12:05'),(3,'Barry_Moore9181@nickia.com','notapassword','2023-02-28 19:12:05'),(4,'Bob_Bob123@live.dk','randomword','2023-02-28 19:12:05');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-02-28 20:31:35
