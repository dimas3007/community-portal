-- MySQL dump 10.13  Distrib 8.0.28, for Win64 (x86_64)
--
-- Host: localhost    Database: community_portals
-- ------------------------------------------------------
-- Server version	8.0.28

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
-- Table structure for table `bulk_emails`
--

DROP TABLE IF EXISTS `bulk_emails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bulk_emails` (
  `id` bigint NOT NULL,
  `content` varchar(255) DEFAULT NULL,
  `email_from` varchar(255) DEFAULT NULL,
  `email_to` varchar(255) DEFAULT NULL,
  `subject` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bulk_emails`
--

LOCK TABLES `bulk_emails` WRITE;
/*!40000 ALTER TABLE `bulk_emails` DISABLE KEYS */;
INSERT INTO `bulk_emails` VALUES (17,'descripitpon','dimassetiaji30@gmail.com','ujangcobra123@gmail.com','subjecyt');
/*!40000 ALTER TABLE `bulk_emails` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `companys`
--

DROP TABLE IF EXISTS `companys`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `companys` (
  `id` bigint NOT NULL,
  `address` varchar(255) DEFAULT NULL,
  `background_foto` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `profile_foto` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `companys`
--

LOCK TABLES `companys` WRITE;
/*!40000 ALTER TABLE `companys` DISABLE KEYS */;
INSERT INTO `companys` VALUES (1,' Seattle, WA 410 Terry Ave N Arlington, VA','amazonbg.webp','Hello everyone, I will share the results of my mini project assignments from independent campus partners','Amazon','amazon.png'),(2,NULL,'gojekbg.jpg',NULL,'Gojek','gojek.png'),(3,NULL,'googlebg.jpg',NULL,'Google','google.png');
/*!40000 ALTER TABLE `companys` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `degree`
--

DROP TABLE IF EXISTS `degree`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `degree` (
  `id` bigint NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `degree`
--

LOCK TABLES `degree` WRITE;
/*!40000 ALTER TABLE `degree` DISABLE KEYS */;
/*!40000 ALTER TABLE `degree` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `educations`
--

DROP TABLE IF EXISTS `educations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `educations` (
  `id` bigint NOT NULL,
  `address` varchar(255) DEFAULT NULL,
  `background_foto` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `profile_foto` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `educations`
--

LOCK TABLES `educations` WRITE;
/*!40000 ALTER TABLE `educations` DISABLE KEYS */;
/*!40000 ALTER TABLE `educations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employment_types`
--

DROP TABLE IF EXISTS `employment_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employment_types` (
  `id` bigint NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employment_types`
--

LOCK TABLES `employment_types` WRITE;
/*!40000 ALTER TABLE `employment_types` DISABLE KEYS */;
INSERT INTO `employment_types` VALUES (1,'ini merupakan pekerjaan yang setiap hari','Full-Time'),(2,NULL,'Part-Time'),(3,NULL,'Internship'),(4,NULL,'Self-Employed'),(5,NULL,'Freelance'),(6,NULL,'Contract'),(7,NULL,'Apprenticeship'),(8,NULL,'Seasonal');
/*!40000 ALTER TABLE `employment_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `field_study`
--

DROP TABLE IF EXISTS `field_study`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `field_study` (
  `id` bigint NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `field_study`
--

LOCK TABLES `field_study` WRITE;
/*!40000 ALTER TABLE `field_study` DISABLE KEYS */;
/*!40000 ALTER TABLE `field_study` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hibernate_sequence`
--

DROP TABLE IF EXISTS `hibernate_sequence`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hibernate_sequence` (
  `next_val` bigint DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hibernate_sequence`
--

LOCK TABLES `hibernate_sequence` WRITE;
/*!40000 ALTER TABLE `hibernate_sequence` DISABLE KEYS */;
INSERT INTO `hibernate_sequence` VALUES (23);
/*!40000 ALTER TABLE `hibernate_sequence` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jobs_applicants`
--

DROP TABLE IF EXISTS `jobs_applicants`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jobs_applicants` (
  `id` bigint NOT NULL,
  `applicant` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `expected_salary` int NOT NULL,
  `status` varchar(255) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `id_job_opportunity` bigint DEFAULT NULL,
  `id_user` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKfbj19x2n3es4f1m4q9jsy8lxw` (`id_job_opportunity`),
  KEY `FKqkv2bxp28e9cvd2dhs58duvw7` (`id_user`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jobs_applicants`
--

LOCK TABLES `jobs_applicants` WRITE;
/*!40000 ALTER TABLE `jobs_applicants` DISABLE KEYS */;
INSERT INTO `jobs_applicants` VALUES (16,'this is applicant','2022-06-21 17:34:13',100,'apply','2022-06-21 17:34:40',6,3);
/*!40000 ALTER TABLE `jobs_applicants` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jobs_opportunities`
--

DROP TABLE IF EXISTS `jobs_opportunities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jobs_opportunities` (
  `id` bigint NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `description` longtext,
  `location` varchar(255) DEFAULT NULL,
  `salary` int NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `work_experience` varchar(255) DEFAULT NULL,
  `id_company` bigint DEFAULT NULL,
  `id_employment_type` bigint DEFAULT NULL,
  `id_role` bigint DEFAULT NULL,
  `id_user` bigint DEFAULT NULL,
  `id_work_level` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKmwssimlvxtdmh5arjsclx0hi7` (`id_company`),
  KEY `FK11di0on1fvng7vnu0gqow5s3t` (`id_employment_type`),
  KEY `FKtcmjjvwnhp9vgr4mtqlkdrofj` (`id_role`),
  KEY `FKgk2wxmyfg2a36rf3c461whj2n` (`id_user`),
  KEY `FKa8j55psjpf3r4b522ccoty1qw` (`id_work_level`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jobs_opportunities`
--

LOCK TABLES `jobs_opportunities` WRITE;
/*!40000 ALTER TABLE `jobs_opportunities` DISABLE KEYS */;
INSERT INTO `jobs_opportunities` VALUES (6,'2022-06-20 17:19:22','Pollen (pollenliquidation.com) is Asia�s first sustainable liquidation platform, helping brands like Unilever and L�Oreal save over 200 tonnes of business waste from going to landfills across 7 SEA countries. Brands use our liquidation management system (LMS), a headless e-commerce platform that allows for multiple channel liquidation along with built-in sustainability tracking to speed up liquidation recovery rates and provide transparency on business waste savings. To help companies liquidate faster it also manages a B2B marketplace - Pollen Stock (market.pollen.store) with over $10M of inventory currently on offer for regional and global buyers.',' Pollen Liquidation Indonesia ',1000,'2022-06-20 17:19:22','3++ Years',2,4,8,5,2),(7,'2022-06-20 17:24:12','Teduh is a startup striving to solve Indonesia\'s mental health crisis. We provide psychology resources tailored for the Indonesian audience by considering factors such as culture, religion, stigma, and ideology. These resources include online therapy and telemedicine, mindfulness meditation, self-help therapy courses, mood tracker, etc. Teduh seeks to be a one stop solution for Southeast Asians� mental health needs through an innovative, sustainable and customer-centric manner.',' Teduh Indonesia ',500,'2022-06-20 17:24:12','2 Years',1,6,9,5,3);
/*!40000 ALTER TABLE `jobs_opportunities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `likes`
--

DROP TABLE IF EXISTS `likes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `likes` (
  `id` bigint NOT NULL,
  `is_like` bit(1) NOT NULL,
  `id_thread` bigint DEFAULT NULL,
  `id_user` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKtbjg1wnvdm1vogbuochcle452` (`id_thread`),
  KEY `FKor8yrtq5h31c0f3ioumt03hlt` (`id_user`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `likes`
--

LOCK TABLES `likes` WRITE;
/*!40000 ALTER TABLE `likes` DISABLE KEYS */;
INSERT INTO `likes` VALUES (9,_binary '\0',8,3),(14,_binary '\0',12,3),(22,_binary '\0',11,3);
/*!40000 ALTER TABLE `likes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `message`
--

DROP TABLE IF EXISTS `message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `message` (
  `id` bigint NOT NULL,
  `created_at` date DEFAULT NULL,
  `message` varchar(255) DEFAULT NULL,
  `user_from` bigint DEFAULT NULL,
  `user_to` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKc2yr8c7kytq149tvcoa8cxj2` (`user_from`),
  KEY `FKgsu1eowhbfjxab74sdrp2ichm` (`user_to`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `message`
--

LOCK TABLES `message` WRITE;
/*!40000 ALTER TABLE `message` DISABLE KEYS */;
/*!40000 ALTER TABLE `message` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles` (
  `id` bigint NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `foto` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,NULL,'1.png','Data Analyst'),(2,NULL,'2.png','C++'),(3,NULL,'3.png','C#'),(4,NULL,'4.png','Front-End Developer'),(5,NULL,'5.png','Javascript Developer'),(6,NULL,'6.png','Back-End Developer'),(7,NULL,'7.png','Phyton Developer'),(8,NULL,'8.png','IOS Developer'),(9,NULL,'9.png','Typescript Developer'),(10,NULL,'10.png','Web Developer');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `threads`
--

DROP TABLE IF EXISTS `threads`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `threads` (
  `id` bigint NOT NULL,
  `content` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `foto` varchar(255) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `reply_to` bigint DEFAULT NULL,
  `id_user` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKjs608b95bnfrld9q2sc6vhwsb` (`reply_to`),
  KEY `FKpjad5jmpytejk6twx3rda0afm` (`id_user`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `threads`
--

LOCK TABLES `threads` WRITE;
/*!40000 ALTER TABLE `threads` DISABLE KEYS */;
INSERT INTO `threads` VALUES (8,'this is my forst thread','2022-06-21 13:46:42','bokeh-cover-bg.jpg','2022-06-21 13:46:42',NULL,5),(10,'halo your thread is good, good picture','2022-06-21 14:07:47','','2022-06-21 14:07:47',8,3),(11,'nice picture btw :)','2022-06-21 14:13:10','','2022-06-21 14:13:10',8,3),(12,'i know its good #thread','2022-06-21 14:14:41','','2022-06-21 14:14:41',NULL,3),(13,'what???','2022-06-21 14:14:52','','2022-06-21 14:14:52',12,3);
/*!40000 ALTER TABLE `threads` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_educations`
--

DROP TABLE IF EXISTS `user_educations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_educations` (
  `id` bigint NOT NULL,
  `created_at` date DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `is_graduated` bit(1) NOT NULL,
  `last_date` date DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `updated_at` date DEFAULT NULL,
  `id_degree` bigint DEFAULT NULL,
  `id_education` bigint DEFAULT NULL,
  `id_field_study` bigint DEFAULT NULL,
  `id_user` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKik1rruyw8b5uswhdycu8ael30` (`id_degree`),
  KEY `FKj7d97mwet9splcauauq41kl2r` (`id_education`),
  KEY `FK82yga2jqndnuyibv0itmwlp5l` (`id_field_study`),
  KEY `FK7i6fc4mmqkw8otm3htov0otnw` (`id_user`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_educations`
--

LOCK TABLES `user_educations` WRITE;
/*!40000 ALTER TABLE `user_educations` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_educations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_experiences`
--

DROP TABLE IF EXISTS `user_experiences`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_experiences` (
  `id` bigint NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `is_currently_working` bit(1) NOT NULL,
  `last_date` datetime DEFAULT NULL,
  `start_date` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `id_company` bigint DEFAULT NULL,
  `id_employment_type` bigint DEFAULT NULL,
  `id_role` bigint DEFAULT NULL,
  `id_user` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKihn5u4a3fv50gbhplhjqbpcho` (`id_company`),
  KEY `FK9ti8ncdd1p0h5d2q4ok9ndddp` (`id_employment_type`),
  KEY `FKqmals53lk60pcrroqtqj2inhm` (`id_role`),
  KEY `FKglw26d75q3g98ll980qq5q22s` (`id_user`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_experiences`
--

LOCK TABLES `user_experiences` WRITE;
/*!40000 ALTER TABLE `user_experiences` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_experiences` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_profiles`
--

DROP TABLE IF EXISTS `user_profiles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_profiles` (
  `id` bigint NOT NULL,
  `address` varchar(512) NOT NULL,
  `background_foto` varchar(255) DEFAULT NULL,
  `bio` varchar(512) DEFAULT NULL,
  `created_at` date DEFAULT NULL,
  `first_name` varchar(50) NOT NULL,
  `gender` varchar(255) DEFAULT NULL,
  `last_name` varchar(50) NOT NULL,
  `phone` varchar(15) NOT NULL,
  `profile_foto` varchar(255) DEFAULT NULL,
  `updated_at` date DEFAULT NULL,
  `id_user` bigint DEFAULT NULL,
  `id_role` bigint DEFAULT NULL,
  `id_user_type` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK7hsll4ygf8v0apbll4wulr3v5` (`id_user`),
  KEY `FKhr14u7ngyp7iu77ww6gsrsqrt` (`id_role`),
  KEY `FKiu7nt4jpdrie5ns0w009sqv24` (`id_user_type`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_profiles`
--

LOCK TABLES `user_profiles` WRITE;
/*!40000 ALTER TABLE `user_profiles` DISABLE KEYS */;
INSERT INTO `user_profiles` VALUES (3,'Rancabolang St. no 29 Bandung City Indonesia','wallpapers___cyan_abstract_polygons__black_bg__by_kaminohunter_da4f4gg-pre.jpg','this is my bio yas','2022-06-20','Dimas','male','Setiaji','0896565656','https __id.hypebeast.com_files_2022_01_eminem-habiskan-6-miliar-untuk-nft-bored-ape-yacht-club-yang-mirip-dirinya-cover.jpg','2022-06-21',2,10,1),(5,'Singapore st 29',NULL,'bio admin','2022-06-20','Admin','male','ABC','0888955556','963b0fb0-e437-11ec-b659-2799483566a1.jpg','2022-06-21',4,10,2);
/*!40000 ALTER TABLE `user_profiles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_type`
--

DROP TABLE IF EXISTS `user_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_type` (
  `id` bigint NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_type`
--

LOCK TABLES `user_type` WRITE;
/*!40000 ALTER TABLE `user_type` DISABLE KEYS */;
INSERT INTO `user_type` VALUES (1,NULL,'Software Developer'),(2,NULL,'Admin');
/*!40000 ALTER TABLE `user_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` bigint NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `username` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_6dotkott2kjsp8vw4d0m25fb7` (`email`),
  UNIQUE KEY `UK_r43af9ap4edm43mmtq01oddj6` (`username`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (2,'dimas@gmail.com','$2a$10$y06PKIgl6VbnVQMVRbi0EeDJw8970iqS9qYvNihKp.erqckNVerIC','dimas'),(4,'admin@gmail.com','$2a$10$Rirl7KqmU60TJe8F2SaFIuhBZAV2iAhkJ3JFtJzBWoN6qF9hJwkBy','admin');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `visibilitys`
--

DROP TABLE IF EXISTS `visibilitys`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `visibilitys` (
  `id` bigint NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `visibilitys`
--

LOCK TABLES `visibilitys` WRITE;
/*!40000 ALTER TABLE `visibilitys` DISABLE KEYS */;
/*!40000 ALTER TABLE `visibilitys` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `work_level`
--

DROP TABLE IF EXISTS `work_level`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `work_level` (
  `id` bigint NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `work_level`
--

LOCK TABLES `work_level` WRITE;
/*!40000 ALTER TABLE `work_level` DISABLE KEYS */;
INSERT INTO `work_level` VALUES (1,NULL,'Begginer'),(2,NULL,'Intermediate'),(3,NULL,'Senior'),(4,NULL,'Specialist');
/*!40000 ALTER TABLE `work_level` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-06-28 21:05:05
