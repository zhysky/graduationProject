-- MySQL dump 10.13  Distrib 8.0.15, for Win64 (x86_64)
--
-- Host: localhost    Database: tte
-- ------------------------------------------------------
-- Server version	8.0.15

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8mb4 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `admin` (
  `id` varchar(36) NOT NULL,
  `name` varchar(255) NOT NULL,
  `createdDate` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `updatedDate` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `password` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin`
--

LOCK TABLES `admin` WRITE;
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
INSERT INTO `admin` VALUES ('1c9f920d-690d-4c5b-b523-9fc3f88f88d0','admin','2020-04-15 04:59:51.168753','2020-04-15 04:59:51.168753','$2a$10$guDRxL6no3MA7R15mdFtlervBeb7vZOow3fqqBaULD3vcuc6/9BFi');
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cart`
--

DROP TABLE IF EXISTS `cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `cart` (
  `id` varchar(36) NOT NULL,
  `name` varchar(255) NOT NULL,
  `createdDate` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `updatedDate` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `count` int(11) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `good` varchar(255) DEFAULT NULL,
  `userId` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_756f53ab9466eb52a52619ee019` (`userId`),
  CONSTRAINT `FK_756f53ab9466eb52a52619ee019` FOREIGN KEY (`userId`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart`
--

LOCK TABLES `cart` WRITE;
/*!40000 ALTER TABLE `cart` DISABLE KEYS */;
/*!40000 ALTER TABLE `cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `category` (
  `id` varchar(36) NOT NULL,
  `name` varchar(255) NOT NULL,
  `createdDate` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `updatedDate` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `level` varchar(255) DEFAULT '0',
  `parentId` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_d5456fd7e4c4866fec8ada1fa10` (`parentId`),
  CONSTRAINT `FK_d5456fd7e4c4866fec8ada1fa10` FOREIGN KEY (`parentId`) REFERENCES `category` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES ('0b088f1e-c803-43af-bdf2-ce1ad0605b47','智能手表','2020-04-18 23:20:24.620435','2020-04-18 23:20:24.620435','0','e26cd2f6-2709-4dfb-87ac-fe1bc6ceff8a'),('1fc9b29a-989a-4803-beff-8bc56c06a5fa','漫画','2020-04-18 23:31:51.615724','2020-04-18 23:31:51.615724','0','5b57576d-226a-4b80-8e5e-5230957ca88d'),('250b0fcf-11fd-41f6-a8cf-8fc803346f3d','小说','2020-04-18 23:30:23.907129','2020-04-18 23:30:23.907129','0','5b57576d-226a-4b80-8e5e-5230957ca88d'),('354afd53-ddd8-4360-98bc-8ff3d58e43fd','手机','2020-04-18 23:19:16.209616','2020-04-18 23:19:16.209616','0','e26cd2f6-2709-4dfb-87ac-fe1bc6ceff8a'),('3a8bd027-0022-4b76-b7d0-30c8d333f4ad','电脑','2020-04-18 23:19:32.381843','2020-04-18 23:19:32.381843','0','e26cd2f6-2709-4dfb-87ac-fe1bc6ceff8a'),('49269c1a-64a2-440d-a06a-bf09a8cc2dc8','男装','2020-04-18 23:29:12.070479','2020-04-18 23:29:12.070479','0','d9fe79aa-2faf-46c3-9c1e-550cca2d8361'),('4af1b829-a505-4f1c-adbd-8a371c8e0a37','诗歌','2020-04-18 23:32:27.034519','2020-04-18 23:32:27.034519','0','5b57576d-226a-4b80-8e5e-5230957ca88d'),('4f8eec3b-cef9-4b8c-a1bc-f5f575b48450','糖果巧克力','2020-04-18 23:25:01.766586','2020-04-18 23:25:01.766586','0','c01ba7c9-0165-47f4-859b-523e3c87eb20'),('5133c153-f22c-4469-af09-e31e93e8316d','女装','2020-04-18 23:29:22.295672','2020-04-18 23:29:22.295672','0','d9fe79aa-2faf-46c3-9c1e-550cca2d8361'),('5b57576d-226a-4b80-8e5e-5230957ca88d','图书','2020-04-18 23:29:39.462161','2020-04-18 23:29:39.462161','0',NULL),('740feee1-ed96-40fb-ad81-e9b52a1c9561','耳机','2020-04-18 23:18:40.183878','2020-04-18 23:18:40.183878','0','e26cd2f6-2709-4dfb-87ac-fe1bc6ceff8a'),('7e07bff4-91c2-44a3-a247-de8147c9f1d8','水果','2020-04-18 23:25:21.734491','2020-04-18 23:25:21.734491','0','c01ba7c9-0165-47f4-859b-523e3c87eb20'),('84efebd9-4e8b-449b-b083-03350f047e60','室内休闲','2020-04-18 23:23:23.037195','2020-04-18 23:23:23.037195','0','b285418f-3e10-484d-ad2e-66b68cbf9048'),('854d23a1-e6f8-4d3e-9662-1126d6abac36','方便速食','2020-04-18 23:24:22.006822','2020-04-18 23:24:22.006822','0','c01ba7c9-0165-47f4-859b-523e3c87eb20'),('8a6fd592-8daa-4b09-bd7b-7cf47cfd5aac','球类','2020-04-18 23:22:02.387503','2020-04-18 23:22:02.387503','0','b285418f-3e10-484d-ad2e-66b68cbf9048'),('9afda963-83a6-4136-a44e-3020c3cbda01','游泳','2020-04-18 23:22:14.050811','2020-04-18 23:22:14.050811','0','b285418f-3e10-484d-ad2e-66b68cbf9048'),('9e79a19d-5705-4920-aacd-de5806c47f5f','名著','2020-04-18 23:32:03.520885','2020-04-18 23:32:03.520885','0','5b57576d-226a-4b80-8e5e-5230957ca88d'),('b285418f-3e10-484d-ad2e-66b68cbf9048','体育','2020-04-18 23:21:35.761964','2020-04-18 23:21:35.761964','0',NULL),('c01ba7c9-0165-47f4-859b-523e3c87eb20','食品','2020-04-18 23:23:45.014266','2020-04-18 23:23:45.014266','0',NULL),('c4b83b03-52c1-411e-98d4-b925dabda83c','相机','2020-04-18 23:19:53.247628','2020-04-18 23:19:53.247628','0','e26cd2f6-2709-4dfb-87ac-fe1bc6ceff8a'),('d9fe79aa-2faf-46c3-9c1e-550cca2d8361','服装衣物','2020-04-18 23:27:35.639387','2020-04-18 23:27:35.639387','0',NULL),('e26cd2f6-2709-4dfb-87ac-fe1bc6ceff8a','数码','2020-04-18 23:18:15.635421','2020-04-18 23:18:15.635421','0',NULL),('ec8facca-74e1-40f5-ab1b-810ca9529e07','鞋帽','2020-04-18 23:30:05.131697','2020-04-18 23:30:05.131697','0','d9fe79aa-2faf-46c3-9c1e-550cca2d8361'),('ed7aa682-f148-4158-a25f-ade0c6fda6d2','工具书','2020-04-18 23:32:16.739912','2020-04-18 23:32:16.739912','0','5b57576d-226a-4b80-8e5e-5230957ca88d');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category_closure`
--

DROP TABLE IF EXISTS `category_closure`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `category_closure` (
  `id_ancestor` varchar(255) NOT NULL,
  `id_descendant` varchar(255) NOT NULL,
  PRIMARY KEY (`id_ancestor`,`id_descendant`),
  KEY `IDX_4aa1348fc4b7da9bef0fae8ff4` (`id_ancestor`),
  KEY `IDX_6a22002acac4976977b1efd114` (`id_descendant`),
  CONSTRAINT `FK_4aa1348fc4b7da9bef0fae8ff48` FOREIGN KEY (`id_ancestor`) REFERENCES `category` (`id`),
  CONSTRAINT `FK_6a22002acac4976977b1efd114a` FOREIGN KEY (`id_descendant`) REFERENCES `category` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category_closure`
--

LOCK TABLES `category_closure` WRITE;
/*!40000 ALTER TABLE `category_closure` DISABLE KEYS */;
INSERT INTO `category_closure` VALUES ('0b088f1e-c803-43af-bdf2-ce1ad0605b47','0b088f1e-c803-43af-bdf2-ce1ad0605b47'),('1fc9b29a-989a-4803-beff-8bc56c06a5fa','1fc9b29a-989a-4803-beff-8bc56c06a5fa'),('250b0fcf-11fd-41f6-a8cf-8fc803346f3d','250b0fcf-11fd-41f6-a8cf-8fc803346f3d'),('354afd53-ddd8-4360-98bc-8ff3d58e43fd','354afd53-ddd8-4360-98bc-8ff3d58e43fd'),('3a8bd027-0022-4b76-b7d0-30c8d333f4ad','3a8bd027-0022-4b76-b7d0-30c8d333f4ad'),('49269c1a-64a2-440d-a06a-bf09a8cc2dc8','49269c1a-64a2-440d-a06a-bf09a8cc2dc8'),('4af1b829-a505-4f1c-adbd-8a371c8e0a37','4af1b829-a505-4f1c-adbd-8a371c8e0a37'),('4f8eec3b-cef9-4b8c-a1bc-f5f575b48450','4f8eec3b-cef9-4b8c-a1bc-f5f575b48450'),('5133c153-f22c-4469-af09-e31e93e8316d','5133c153-f22c-4469-af09-e31e93e8316d'),('5b57576d-226a-4b80-8e5e-5230957ca88d','1fc9b29a-989a-4803-beff-8bc56c06a5fa'),('5b57576d-226a-4b80-8e5e-5230957ca88d','250b0fcf-11fd-41f6-a8cf-8fc803346f3d'),('5b57576d-226a-4b80-8e5e-5230957ca88d','4af1b829-a505-4f1c-adbd-8a371c8e0a37'),('5b57576d-226a-4b80-8e5e-5230957ca88d','5b57576d-226a-4b80-8e5e-5230957ca88d'),('5b57576d-226a-4b80-8e5e-5230957ca88d','9e79a19d-5705-4920-aacd-de5806c47f5f'),('5b57576d-226a-4b80-8e5e-5230957ca88d','ed7aa682-f148-4158-a25f-ade0c6fda6d2'),('740feee1-ed96-40fb-ad81-e9b52a1c9561','740feee1-ed96-40fb-ad81-e9b52a1c9561'),('7e07bff4-91c2-44a3-a247-de8147c9f1d8','7e07bff4-91c2-44a3-a247-de8147c9f1d8'),('84efebd9-4e8b-449b-b083-03350f047e60','84efebd9-4e8b-449b-b083-03350f047e60'),('854d23a1-e6f8-4d3e-9662-1126d6abac36','854d23a1-e6f8-4d3e-9662-1126d6abac36'),('8a6fd592-8daa-4b09-bd7b-7cf47cfd5aac','8a6fd592-8daa-4b09-bd7b-7cf47cfd5aac'),('9afda963-83a6-4136-a44e-3020c3cbda01','9afda963-83a6-4136-a44e-3020c3cbda01'),('9e79a19d-5705-4920-aacd-de5806c47f5f','9e79a19d-5705-4920-aacd-de5806c47f5f'),('b285418f-3e10-484d-ad2e-66b68cbf9048','84efebd9-4e8b-449b-b083-03350f047e60'),('b285418f-3e10-484d-ad2e-66b68cbf9048','8a6fd592-8daa-4b09-bd7b-7cf47cfd5aac'),('b285418f-3e10-484d-ad2e-66b68cbf9048','9afda963-83a6-4136-a44e-3020c3cbda01'),('b285418f-3e10-484d-ad2e-66b68cbf9048','b285418f-3e10-484d-ad2e-66b68cbf9048'),('c01ba7c9-0165-47f4-859b-523e3c87eb20','4f8eec3b-cef9-4b8c-a1bc-f5f575b48450'),('c01ba7c9-0165-47f4-859b-523e3c87eb20','7e07bff4-91c2-44a3-a247-de8147c9f1d8'),('c01ba7c9-0165-47f4-859b-523e3c87eb20','854d23a1-e6f8-4d3e-9662-1126d6abac36'),('c01ba7c9-0165-47f4-859b-523e3c87eb20','c01ba7c9-0165-47f4-859b-523e3c87eb20'),('c4b83b03-52c1-411e-98d4-b925dabda83c','c4b83b03-52c1-411e-98d4-b925dabda83c'),('d9fe79aa-2faf-46c3-9c1e-550cca2d8361','49269c1a-64a2-440d-a06a-bf09a8cc2dc8'),('d9fe79aa-2faf-46c3-9c1e-550cca2d8361','5133c153-f22c-4469-af09-e31e93e8316d'),('d9fe79aa-2faf-46c3-9c1e-550cca2d8361','d9fe79aa-2faf-46c3-9c1e-550cca2d8361'),('d9fe79aa-2faf-46c3-9c1e-550cca2d8361','ec8facca-74e1-40f5-ab1b-810ca9529e07'),('e26cd2f6-2709-4dfb-87ac-fe1bc6ceff8a','0b088f1e-c803-43af-bdf2-ce1ad0605b47'),('e26cd2f6-2709-4dfb-87ac-fe1bc6ceff8a','354afd53-ddd8-4360-98bc-8ff3d58e43fd'),('e26cd2f6-2709-4dfb-87ac-fe1bc6ceff8a','3a8bd027-0022-4b76-b7d0-30c8d333f4ad'),('e26cd2f6-2709-4dfb-87ac-fe1bc6ceff8a','740feee1-ed96-40fb-ad81-e9b52a1c9561'),('e26cd2f6-2709-4dfb-87ac-fe1bc6ceff8a','c4b83b03-52c1-411e-98d4-b925dabda83c'),('e26cd2f6-2709-4dfb-87ac-fe1bc6ceff8a','e26cd2f6-2709-4dfb-87ac-fe1bc6ceff8a'),('ec8facca-74e1-40f5-ab1b-810ca9529e07','ec8facca-74e1-40f5-ab1b-810ca9529e07'),('ed7aa682-f148-4158-a25f-ade0c6fda6d2','ed7aa682-f148-4158-a25f-ade0c6fda6d2');
/*!40000 ALTER TABLE `category_closure` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `good`
--

DROP TABLE IF EXISTS `good`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `good` (
  `id` varchar(36) NOT NULL,
  `name` varchar(255) NOT NULL,
  `createdDate` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `updatedDate` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `cover` varchar(255) DEFAULT NULL,
  `price` float DEFAULT '9999',
  `categoryId` varchar(36) DEFAULT NULL,
  `goodInfoId` varchar(36) DEFAULT NULL,
  `tag` varchar(255) DEFAULT '默认',
  PRIMARY KEY (`id`),
  UNIQUE KEY `REL_d7cd06802b299285ef98601daa` (`goodInfoId`),
  KEY `FK_87d29fce743b048a9deaa5cb67e` (`categoryId`),
  CONSTRAINT `FK_87d29fce743b048a9deaa5cb67e` FOREIGN KEY (`categoryId`) REFERENCES `category` (`id`),
  CONSTRAINT `FK_d7cd06802b299285ef98601daa1` FOREIGN KEY (`goodInfoId`) REFERENCES `good_info` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `good`
--

LOCK TABLES `good` WRITE;
/*!40000 ALTER TABLE `good` DISABLE KEYS */;
INSERT INTO `good` VALUES ('00d1def7-02c1-4900-9ebf-b6cb6047d2d7','鞋帽1号','2020-04-19 00:26:01.833494','2020-04-19 00:26:28.000000','http://localhost:2333/uploads/鞋帽-1587227133118.png',85,'ec8facca-74e1-40f5-ab1b-810ca9529e07','856e1ac8-0471-4baa-a394-27c82ad3d5c8','默认'),('0f71effd-85be-43af-960e-2e9bd8f77fda','小说1号','2020-04-19 00:56:32.816468','2020-04-19 00:56:32.816468','http://localhost:2333/uploads/小说-1587228991784.png',35,'250b0fcf-11fd-41f6-a8cf-8fc803346f3d','bc744b19-eb3a-450a-8f43-94b5026076f6','默认'),('10447eb6-7f11-4aba-a842-bcc8d14c545c','游泳1号','2020-04-19 00:42:30.712282','2020-04-19 00:42:30.712282','http://localhost:2333/uploads/游泳-1587228149184.png',345,'9afda963-83a6-4136-a44e-3020c3cbda01','dcaf3488-84fa-4985-a5ff-e66ff83f1142','默认'),('127bfe35-9276-4931-8afb-85e4338d5a52','方便速食1号','2020-04-19 00:38:21.814871','2020-04-19 00:44:26.000000','http://localhost:2333/uploads/方便速食-1587227899999.png',8,'854d23a1-e6f8-4d3e-9662-1126d6abac36','39163787-24be-4b20-b6f6-4c128d6bdd24','默认'),('25b2f12d-22ef-4689-b12e-f6efb3badbe6','电脑1号','2020-04-19 00:10:01.265222','2020-04-19 00:10:01.265222','http://localhost:2333/uploads/电脑-1587226199475.png',7000,'3a8bd027-0022-4b76-b7d0-30c8d333f4ad','79be60c4-d240-44e2-bb6b-b3ded3ec9bb8','商家推荐'),('2a4ccc4b-d82a-4f77-8ec2-318e6d02b1ed','水果1号','2020-04-19 00:36:26.750759','2020-04-19 00:36:26.750759','http://localhost:2333/uploads/水果-1587227749260.png',16,'7e07bff4-91c2-44a3-a247-de8147c9f1d8','9ee28bfc-87b0-4893-94d9-7fbcc0d4fad8','默认'),('4192b519-71d0-4ba6-be8b-5b274f44f4a7','球1号','2020-04-19 00:40:40.749200','2020-04-19 00:40:40.749200','http://localhost:2333/uploads/球-1587228039387.png',88,'8a6fd592-8daa-4b09-bd7b-7cf47cfd5aac','15299f33-796e-4d0b-9902-28ee3f057a9a','默认'),('5c880af1-cdec-4aa3-993a-b4ff0fce3a12','诗歌1号','2020-04-19 00:58:56.226219','2020-04-19 00:58:56.226219','http://localhost:2333/uploads/诗歌-1587229134614.png',26,'4af1b829-a505-4f1c-adbd-8a371c8e0a37','bd82c8ba-9b17-4c04-bd0f-c91cb09819be','默认'),('7c8490fb-0cce-457d-98d4-9872bf6d1209','工具书1号','2020-04-19 01:04:33.111954','2020-04-19 01:04:33.111954','http://localhost:2333/uploads/工具书-1587229472060.png',86,'ed7aa682-f148-4158-a25f-ade0c6fda6d2','5047ce27-11fb-4837-9f26-675d0ac70303','默认'),('7cab397a-3cca-46d3-b713-89dd0ce157ca','名著1号','2020-04-19 01:00:59.350684','2020-04-19 01:00:59.350684','http://localhost:2333/uploads/名著-1587229257719.png',47,'9e79a19d-5705-4920-aacd-de5806c47f5f','73e6c6f4-2376-4acc-9a93-c07a65240750','默认'),('89ab4c6f-4527-4442-953e-0fc111ca722d','相机1号','2020-04-19 00:16:47.330323','2020-04-19 00:16:47.330323','http://localhost:2333/uploads/相机-1587226569326.png',3000,'c4b83b03-52c1-411e-98d4-b925dabda83c','3f217c17-13c4-4490-a005-96b1ea64897e','新货上架'),('9f29a0d8-bc8a-4cd2-b3ee-0bd08bca2a58','糖果巧克力1号','2020-04-19 00:33:58.760358','2020-04-19 00:34:12.000000','http://localhost:2333/uploads/糖果巧克力-1587227593571.png',22,'4f8eec3b-cef9-4b8c-a1bc-f5f575b48450','8a447f11-8e1c-4762-b8d6-9606a60e7d78','默认'),('a1b4f41a-c218-437e-a9b9-e01336476e71','耳机1号','2020-04-19 00:13:12.414660','2020-04-19 00:13:12.414660','http://localhost:2333/uploads/耳机-1587226338385.png',99,'740feee1-ed96-40fb-ad81-e9b52a1c9561','512582eb-e552-4e20-a01d-7c319add95af','商家推荐'),('c3240fbb-5d74-4e11-9df7-248737c3ab61','手机1号','2020-04-19 00:06:19.996858','2020-04-19 00:06:19.996858','http://localhost:2333/uploads/手机-1587225893811.png',2888,'354afd53-ddd8-4360-98bc-8ff3d58e43fd','7f9ec743-cec4-4d33-8986-4da34a666f68','新货上架'),('c359e48d-176f-4d41-980b-e7f5f2039f90','男装1号','2020-04-19 00:19:23.545783','2020-04-19 00:19:36.000000','http://localhost:2333/uploads/男装-1587226706241.png',366,'49269c1a-64a2-440d-a06a-bf09a8cc2dc8','94b78534-d2ed-4fbe-9101-3721ea15fe7b','商家推荐'),('c683bd7a-267b-434d-ad97-ab92c4563154','智能手表1号','2020-04-18 23:59:29.753359','2020-04-18 23:59:29.753359','http://localhost:2333/uploads/手表-1587225427197.png',88,'0b088f1e-c803-43af-bdf2-ce1ad0605b47','e6cdb183-61a1-492b-9b3c-20313101090c','商家推荐'),('d58b40a1-9352-464d-8c95-253a9f6f8e47','室内休闲1号','2020-04-19 00:44:16.541899','2020-04-19 00:44:16.541899','http://localhost:2333/uploads/室内休闲-1587228255296.png',58,'84efebd9-4e8b-449b-b083-03350f047e60','807321cf-0667-4405-b028-6802e95432da','默认'),('efde5021-d77e-4968-a5f7-7fc39add0443','漫画1号','2020-04-19 00:53:12.789701','2020-04-19 00:53:23.000000','http://localhost:2333/uploads/漫画-1587228791060.png',5,'1fc9b29a-989a-4803-beff-8bc56c06a5fa','ae952991-8187-4aa0-a0af-1770b98f16f4','默认'),('f0fd0df6-0665-40f2-98b7-98d09d9ee31c','女装1号','2020-04-19 00:21:39.333170','2020-04-19 00:26:36.000000','http://localhost:2333/uploads/女装-1587226857724.png',666,'5133c153-f22c-4469-af09-e31e93e8316d','e3d280cb-79f0-4838-bdb9-c10d4ba6ddd6','商家推荐');
/*!40000 ALTER TABLE `good` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `good_info`
--

DROP TABLE IF EXISTS `good_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `good_info` (
  `id` varchar(36) NOT NULL,
  `name` varchar(255) NOT NULL,
  `createdDate` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `updatedDate` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `inventory` int(11) DEFAULT '9999',
  `sales` int(11) DEFAULT '9999',
  `pictures` json DEFAULT NULL,
  `describe` varchar(255) DEFAULT NULL,
  `details` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `good_info`
--

LOCK TABLES `good_info` WRITE;
/*!40000 ALTER TABLE `good_info` DISABLE KEYS */;
INSERT INTO `good_info` VALUES ('15299f33-796e-4d0b-9902-28ee3f057a9a','','2020-04-19 00:40:40.733040','2020-04-19 00:40:40.733040',777,666,'[{\"url\": \"http://localhost:2333/uploads/_____46_II_2560_1600-1587227976089.jpeg\", \"name\": \"_____46_II_2560_1600-1587227976089.jpeg\"}, {\"url\": \"http://localhost:2333/uploads/_____47_II_2560_1600-1587227976092.jpeg\", \"name\": \"_____47_II_2560_1600-1587227976092.jpeg\"}, {\"url\": \"http://localhost:2333/uploads/_____48_II_2560_1600-1587227976095.jpeg\", \"name\": \"_____48_II_2560_1600-1587227976095.jpeg\"}]','这是一个球','<p>这是一个球这是一个球这是一个球这是一个球这是一个球这是一个球这是一个球这是一个球这是一个球这是一个球这是一个球这是一个球这是一个球这是一个球这是一个球这是一个球这是一个球这是一个球这是一个球这是一个球这是一个球这是一个球这是一个球这是一个球这是一个球这是一个球这是一个球这是一个球这是一个球这是一个球这是一个球这是一个球这是一个球这是一个球这是一个球这是一个球这是一个球这是一个球这是一个球这是一个球这是一个球这是一个球这是一个球这是一个球这是一个球这是一个球这是一个球这是一个球这是一个球这是一个球这是一个球这是一个球这是一个球这是一个球这是一个球这是一个球这是一个球这是一个球这是一个球这是一个球这是一个球这是一个球这是一个球这是一个球这是一个球这是一个球这是一个球这是一个球这是一个球这是一个球这是一个球这是一个球这是一个球这是一个球这是一个球这是一个球这是一个球这是一个球这是一个球这是一个球这是一个球</p>'),('39163787-24be-4b20-b6f6-4c128d6bdd24','','2020-04-19 00:38:21.797111','2020-04-19 00:44:26.000000',500,5000,'[{\"uid\": 1587228260403, \"url\": \"http://localhost:2333/uploads/_____53_II_2560_1600-1587227817624.jpeg\", \"name\": \"_____53_II_2560_1600-1587227817624.jpeg\", \"status\": \"success\"}, {\"uid\": 1587228260404, \"url\": \"http://localhost:2333/uploads/_____49_II_2560_1600-1587227817622.jpeg\", \"name\": \"_____49_II_2560_1600-1587227817622.jpeg\", \"status\": \"success\"}, {\"uid\": 1587228260405, \"url\": \"http://localhost:2333/uploads/_____61_II_2560_1600-1587227817626.jpeg\", \"name\": \"_____61_II_2560_1600-1587227817626.jpeg\", \"status\": \"success\"}]','这是一个方便速食','<p>这是一个方便速食这是一个方便速食这是一个方便速食这是一个方便速食这是一个方便速食这是一个方便速食这是一个方便速食这是一个方便速食这是一个方便速食这是一个方便速食这是一个方便速食这是一个方便速食这是一个方便速食这是一个方便速食这是一个方便速食这是一个方便速食这是一个方便速食这是一个方便速食这是一个方便速食这是一个方便速食这是一个方便速食这是一个方便速食这是一个方便速食这是一个方便速食这是一个方便速食这是一个方便速食这是一个方便速食这是一个方便速食这是一个方便速食这是一个方便速食这是一个方便速食这是一个方便速食这是一个方便速食这是一个方便速食这是一个方便速食这是一个方便速食这是一个方便速食这是一个方便速食这是一个方便速食这是一个方便速食这是一个方便速食这是一个方便速食这是一个方便速食这是一个方便速食这是一个方便速食这是一个方便速食这是一个方便速食这是一个方便速食这是一个方便速食这是一个方便速食这是一个方便速食这是一个方便速食这是一个方便速食这是一个方便速食这是一个方便速食这是一个方便速食这是一个方便速食</p>'),('3f217c17-13c4-4490-a005-96b1ea64897e','','2020-04-19 00:16:47.328319','2020-04-19 00:16:47.328319',36,12,'[{\"url\": \"http://localhost:2333/uploads/_____59_II_2560_1600-1587226595311.jpeg\", \"name\": \"_____59_II_2560_1600-1587226595311.jpeg\"}, {\"url\": \"http://localhost:2333/uploads/_____51_II_2560_1600-1587226595304.jpeg\", \"name\": \"_____51_II_2560_1600-1587226595304.jpeg\"}, {\"url\": \"http://localhost:2333/uploads/_____52_II_2560_1600-1587226595309.jpeg\", \"name\": \"_____52_II_2560_1600-1587226595309.jpeg\"}]','这是一个 相机','<p>这是一个 相机这是一个 相机这是一个 相机这是一个 相机这是一个 相机这是一个 相机这是一个 相机这是一个 相机这是一个 相机这是一个 相机这是一个 相机这是一个 相机这是一个 相机这是一个 相机这是一个 相机这是一个 相机这是一个 相机这是一个 相机这是一个 相机这是一个 相机这是一个 相机这是一个 相机这是一个 相机这是一个 相机这是一个 相机这是一个 相机这是一个 相机这是一个 相机这是一个 相机这是一个 相机这是一个 相机这是一个 相机这是一个 相机这是一个 相机这是一个 相机这是一个 相机这是一个 相机这是一个 相机这是一个 相机这是一个 相机这是一个 相机这是一个 相机这是一个 相机这是一个 相机这是一个 相机这是一个 相机这是一个 相机这是一个 相机这是一个 相机这是一个 相机这是一个 相机这是一个 相机这是一个 相机这是一个 相机这是一个 相机这是一个 相机这是一个 相机这是一个 相机这是一个 相机这是一个 相机这是一个 相机这是一个 相机这是一个 相机这是一个 相机这是一个 相机这是一个 相机这是一个 相机这是一个 相机这是一个 相机这是一个 相机这是一个 相机这是一个 相机这是一个 相机这是一个 相机这是一个 相机这是一个 相机这是一个 相机这是一个 相机这是一个 相机这是一个 相机这是一个 相机这是一个 相机这是一个 相机这是一个 相机这是一个 相机这是一个 相机这是一个 相机</p>'),('5047ce27-11fb-4837-9f26-675d0ac70303','','2020-04-19 01:04:33.110096','2020-04-19 01:04:33.110096',56,72,'[{\"url\": \"http://localhost:2333/uploads/_____39_VI_2560_1600-1587229326132.jpeg\", \"name\": \"_____39_VI_2560_1600-1587229326132.jpeg\"}, {\"url\": \"http://localhost:2333/uploads/_____5_VI_2560_1600-1587229326128.jpeg\", \"name\": \"_____5_VI_2560_1600-1587229326128.jpeg\"}, {\"url\": \"http://localhost:2333/uploads/_____36_VI_2560_1600-1587229326130.jpeg\", \"name\": \"_____36_VI_2560_1600-1587229326130.jpeg\"}]','这是一个工具书','<p>这是一个工具书这是一个工具书这是一个工具书这是一个工具书这是一个工具书这是一个工具书这是一个工具书这是一个工具书这是一个工具书这是一个工具书这是一个工具书这是一个工具书这是一个工具书这是一个工具书这是一个工具书这是一个工具书这是一个工具书这是一个工具书这是一个工具书这是一个工具书这是一个工具书这是一个工具书这是一个工具书这是一个工具书这是一个工具书这是一个工具书这是一个工具书这是一个工具书这是一个工具书这是一个工具书这是一个工具书这是一个工具书这是一个工具书这是一个工具书这是一个工具书这是一个工具书这是一个工具书这是一个工具书这是一个工具书这是一个工具书这是一个工具书这是一个工具书这是一个工具书这是一个工具书这是一个工具书这是一个工具书这是一个工具书这是一个工具书这是一个工具书这是一个工具书这是一个工具书这是一个工具书这是一个工具书这是一个工具书这是一个工具书这是一个工具书这是一个工具书这是一个工具书这是一个工具书这是一个工具书这是一个工具书这是一个工具书这是一个工具书这是一个工具书这是一个工具书这是一个工具书这是一个工具书这是一个工具书这是一个工具书这是一个工具书这是一个工具书这是一个工具书这是一个工具书这是一个工具书这是一个工具书这是一个工具书这是一个工具书这是一个工具书这是一个工具书这是一个工具书这是一个工具书这是一个工具书这是一个工具书这是一个工具书这是一个工具书这是一个工具书这是一个工具书这是一个工具书这是一个工具书这是一个工具书这是一个工具书这是一个工具书这是一个工具书这是一个工具书这是一个工具书</p>'),('512582eb-e552-4e20-a01d-7c319add95af','','2020-04-19 00:13:12.410979','2020-04-19 00:13:12.410979',77,85,'[{\"url\": \"http://localhost:2333/uploads/_____37_II_2560_1600-1587226367355.jpeg\", \"name\": \"_____37_II_2560_1600-1587226367355.jpeg\"}, {\"url\": \"http://localhost:2333/uploads/_____44_II_2560_1600-1587226367357.jpeg\", \"name\": \"_____44_II_2560_1600-1587226367357.jpeg\"}, {\"url\": \"http://localhost:2333/uploads/_____36_II_2560_1600-1587226367352.jpeg\", \"name\": \"_____36_II_2560_1600-1587226367352.jpeg\"}]','这是一个 耳机','<p>		这是一个 耳机这是一个 耳机这是一个 耳机这是一个 耳机这是一个 耳机这是一个 耳机这是一个 耳机这是一个 耳机这是一个 耳机这是一个 耳机这是一个 耳机这是一个 耳机这是一个 耳机这是一个 耳机这是一个 耳机这是一个 耳机这是一个 耳机这是一个 耳机这是一个 耳机这是一个 耳机这是一个 耳机这是一个 耳机这是一个 耳机这是一个 耳机这是一个 耳机这是一个 耳机这是一个 耳机这是一个 耳机这是一个 耳机这是一个 耳机这是一个 耳机这是一个 耳机这是一个 耳机这是一个 耳机这是一个 耳机这是一个 耳机这是一个 耳机这是一个 耳机这是一个 耳机这是一个 耳机这是一个 耳机这是一个 耳机这是一个 耳机这是一个 耳机这是一个 耳机这是一个 耳机这是一个 耳机这是一个 耳机这是一个 耳机这是一个 耳机这是一个 耳机这是一个 耳机这是一个 耳机这是一个 耳机这是一个 耳机这是一个 耳机这是一个 耳机这是一个 耳机这是一个 耳机这是一个 耳机这是一个 耳机这是一个 耳机这是一个 耳机这是一个 耳机这是一个 耳机这是一个 耳机这是一个 耳机这是一个 耳机这是一个 耳机这是一个 耳机这是一个 耳机这是一个 耳机这是一个 耳机这是一个 耳机这是一个 耳机这是一个 耳机这是一个 耳机这是一个 耳机这是一个 耳机这是一个 耳机</p>'),('73e6c6f4-2376-4acc-9a93-c07a65240750','','2020-04-19 01:00:59.335581','2020-04-19 01:00:59.335581',352,685,'[{\"url\": \"http://localhost:2333/uploads/_____68_VI_2560_1600-1587229203628.jpeg\", \"name\": \"_____68_VI_2560_1600-1587229203628.jpeg\"}, {\"url\": \"http://localhost:2333/uploads/_____67_VI_2560_1600-1587229203624.jpeg\", \"name\": \"_____67_VI_2560_1600-1587229203624.jpeg\"}, {\"url\": \"http://localhost:2333/uploads/_____70_VI_2560_1600-1587229203631.jpeg\", \"name\": \"_____70_VI_2560_1600-1587229203631.jpeg\"}]','这是一个名著','<p>这是一个名著这是一个名著这是一个名著这是一个名著这是一个名著这是一个名著这是一个名著这是一个名著这是一个名著这是一个名著这是一个名著这是一个名著这是一个名著这是一个名著这是一个名著这是一个名著这是一个名著这是一个名著这是一个名著这是一个名著这是一个名著这是一个名著这是一个名著这是一个名著这是一个名著这是一个名著这是一个名著这是一个名著这是一个名著这是一个名著这是一个名著这是一个名著这是一个名著这是一个名著这是一个名著这是一个名著这是一个名著这是一个名著这是一个名著这是一个名著这是一个名著这是一个名著这是一个名著这是一个名著这是一个名著这是一个名著这是一个名著这是一个名著这是一个名著这是一个名著这是一个名著这是一个名著这是一个名著这是一个名著这是一个名著这是一个名著</p><p>这是一个名著这是一个名著这是一个名著这是一个名著这是一个名著这是一个名著这是一个名著这是一个名著这是一个名著这是一个名著这是一个名著这是一个名著这是一个名著这是一个名著这是一个名著这是一个名著这是一个名著这是一个名著这是一个名著这是一个名著这是一个名著这是一个名著这是一个名著这是一个名著这是一个名著这是一个名著这是一个名著这是一个名著这是一个名著这是一个名著这是一个名著这是一个名著这是一个名著这是一个名著这是一个名著这是一个名著这是一个名著这是一个名著这是一个名著这是一个名著这是一个名著这是一个名著这是一个名著这是一个名著这是一个名著这是一个名著这是一个名著这是一个名著这是一个名著这是一个名著这是一个名著这是一个名著这是一个名著这是一个名著这是一个名著这是一个名著这是一个名著这是一个名著这是一个名著这是一个名著这是一个名著这是一个名著这是一个名著这是一个名著</p>'),('79be60c4-d240-44e2-bb6b-b3ded3ec9bb8','','2020-04-19 00:10:01.262932','2020-04-19 00:10:01.262932',52,21,'[{\"url\": \"http://localhost:2333/uploads/_____5_II_2560_1600-1587226114630.jpeg\", \"name\": \"_____5_II_2560_1600-1587226114630.jpeg\"}, {\"url\": \"http://localhost:2333/uploads/_____18_II_2560_1600-1587226114637.jpeg\", \"name\": \"_____18_II_2560_1600-1587226114637.jpeg\"}, {\"url\": \"http://localhost:2333/uploads/_____12_II_2560_1600-1587226114635.jpeg\", \"name\": \"_____12_II_2560_1600-1587226114635.jpeg\"}]','这是一个电脑','<p>		这是一个电脑这是一个电脑这是一个电脑这是一个电脑这是一个电脑这是一个电脑这是一个电脑这是一个电脑这是一个电脑这是一个电脑这是一个电脑这是一个电脑这是一个电脑这是一个电脑这是一个电脑这是一个电脑这是一个电脑这是一个电脑这是一个电脑这是一个电脑这是一个电脑这是一个电脑这是一个电脑这是一个电脑这是一个电脑这是一个电脑这是一个电脑这是一个电脑这是一个电脑这是一个电脑这是一个电脑这是一个电脑这是一个电脑这是一个电脑这是一个电脑这是一个电脑这是一个电脑这是一个电脑这是一个电脑这是一个电脑这是一个电脑这是一个电脑这是一个电脑这是一个电脑这是一个电脑这是一个电脑这是一个电脑这是一个电脑这是一个电脑这是一个电脑这是一个电脑这是一个电脑这是一个电脑这是一个电脑这是一个电脑这是一个电脑这是一个电脑这是一个电脑这是一个电脑这是一个电脑这是一个电脑这是一个电脑这是一个电脑这是一个电脑这是一个电脑这是一个电脑这是一个电脑这是一个电脑这是一个电脑这是一个电脑这是一个电脑这是一个电脑这是一个电脑这是一个电脑这是一个电脑这是一个电脑这是一个电脑这是一个电脑这是一个电脑这是一个电脑这是一个电脑这是一个电脑这是一个电脑这是一个电脑这是一个电脑这是一个电脑这是一个电脑这是一个电脑这是一个电脑这是一个电脑这是一个电脑这是一个电脑这是一个电脑这是一个电脑这是一个电脑这是一个电脑这是一个电脑这是一个电脑这是一个电脑这是一个电脑这是一个电脑这是一个电脑这是一个电脑这是一个电脑这是一个电脑这是一个电脑这是一个电脑这是一个电脑</p>'),('7f9ec743-cec4-4d33-8986-4da34a666f68','','2020-04-19 00:06:19.994521','2020-04-19 00:06:19.994521',200,102,'[{\"url\": \"http://localhost:2333/uploads/_____10_II_2560_1600-1587225971706.jpeg\", \"name\": \"_____10_II_2560_1600-1587225971706.jpeg\"}, {\"url\": \"http://localhost:2333/uploads/_____8_II_2560_1600-1587225971700.jpeg\", \"name\": \"_____8_II_2560_1600-1587225971700.jpeg\"}, {\"url\": \"http://localhost:2333/uploads/_____9_II_2560_1600-1587225971703.jpeg\", \"name\": \"_____9_II_2560_1600-1587225971703.jpeg\"}]','这是一个手机','<p>		这是一个手机这是一个手机这是一个手机这是一个手机这是一个手机这是一个手机这是一个手机这是一个手机这是一个手机这是一个手机这是一个手机这是一个手机这是一个手机这是一个手机这是一个手机这是一个手机这是一个手机这是一个手机这是一个手机这是一个手机这是一个手机这是一个手机这是一个手机这是一个手机这是一个手机这是一个手机</p><p>		这是一个手机这是一个手机这是一个手机这是一个手机这是一个手机这是一个手机这是一个手机这是一个手机这是一个手机这是一个手机这是一个手机这是一个手机这是一个手机这是一个手机这是一个手机这是一个手机这是一个手机这是一个手机这是一个手机这是一个手机这是一个手机这是一个手机这是一个手机这是一个手机这是一个手机这是一个手机</p><p>		这是一个手机这是一个手机这是一个手机这是一个手机这是一个手机这是一个手机这是一个手机这是一个手机这是一个手机这是一个手机这是一个手机这是一个手机这是一个手机这是一个手机这是一个手机这是一个手机这是一个手机这是一个手机这是一个手机这是一个手机这是一个手机这是一个手机这是一个手机这是一个手机这是一个手机这是一个手机</p><p>		这是一个手机这是一个手机这是一个手机这是一个手机这是一个手机这是一个手机这是一个手机这是一个手机这是一个手机这是一个手机这是一个手机这是一个手机这是一个手机这是一个手机这是一个手机这是一个手机这是一个手机这是一个手机这是一个手机这是一个手机这是一个手机这是一个手机这是一个手机这是一个手机这是一个手机这是一个手机</p><p>		这是一个手机这是一个手机这是一个手机这是一个手机这是一个手机这是一个手机这是一个手机这是一个手机这是一个手机这是一个手机这是一个手机这是一个手机这是一个手机这是一个手机这是一个手机这是一个手机这是一个手机这是一个手机这是一个手机这是一个手机这是一个手机这是一个手机这是一个手机这是一个手机这是一个手机这是一个手机</p>'),('807321cf-0667-4405-b028-6802e95432da','','2020-04-19 00:44:16.526089','2020-04-19 00:44:16.526089',156,352,'[{\"url\": \"http://localhost:2333/uploads/_____64_II_2560_1600-1587228193977.jpeg\", \"name\": \"_____64_II_2560_1600-1587228193977.jpeg\"}, {\"url\": \"http://localhost:2333/uploads/_____60_II_2560_1600-1587228193970.jpeg\", \"name\": \"_____60_II_2560_1600-1587228193970.jpeg\"}, {\"url\": \"http://localhost:2333/uploads/_____43_II_2560_1600-1587228193968.jpeg\", \"name\": \"_____43_II_2560_1600-1587228193968.jpeg\"}, {\"url\": \"http://localhost:2333/uploads/_____65_II_2560_1600-1587228193981.jpeg\", \"name\": \"_____65_II_2560_1600-1587228193981.jpeg\"}]','这是一个 室内休闲','<p>这是一个 室内休闲这是一个 室内休闲这是一个 室内休闲这是一个 室内休闲这是一个 室内休闲这是一个 室内休闲这是一个 室内休闲这是一个 室内休闲这是一个 室内休闲这是一个 室内休闲这是一个 室内休闲这是一个 室内休闲这是一个 室内休闲这是一个 室内休闲这是一个 室内休闲这是一个 室内休闲这是一个 室内休闲这是一个 室内休闲这是一个 室内休闲这是一个 室内休闲这是一个 室内休闲这是一个 室内休闲这是一个 室内休闲这是一个 室内休闲这是一个 室内休闲这是一个 室内休闲这是一个 室内休闲这是一个 室内休闲这是一个 室内休闲这是一个 室内休闲这是一个 室内休闲这是一个 室内休闲这是一个 室内休闲这是一个 室内休闲这是一个 室内休闲这是一个 室内休闲这是一个 室内休闲这是一个 室内休闲这是一个 室内休闲这是一个 室内休闲这是一个 室内休闲这是一个 室内休闲这是一个 室内休闲这是一个 室内休闲这是一个 室内休闲这是一个 室内休闲这是一个 室内休闲这是一个 室内休闲这是一个 室内休闲这是一个 室内休闲这是一个 室内休闲这是一个 室内休闲这是一个 室内休闲这是一个 室内休闲这是一个 室内休闲这是一个 室内休闲这是一个 室内休闲这是一个 室内休闲这是一个 室内休闲这是一个 室内休闲这是一个 室内休闲这是一个 室内休闲这是一个 室内休闲这是一个 室内休闲这是一个 室内休闲这是一个 室内休闲这是一个 室内休闲这是一个 室内休闲这是一个 室内休闲这是一个 室内休闲这是一个 室内休闲这是一个 室内休闲这是一个 室内休闲这是一个 室内休闲这是一个 室内休闲这是一个 室内休闲这是一个 室内休闲这是一个 室内休闲这是一个 室内休闲这是一个 室内休闲这是一个 室内休闲这是一个 室内休闲这是一个 室内休闲这是一个 室内休闲这是一个 室内休闲这是一个 室内休闲这是一个 室内休闲这是一个 室内休闲这是一个 室内休闲这是一个 室内休闲这是一个 室内休闲这是一个 室内休闲这是一个 室内休闲这是一个 室内休闲这是一个 室内休闲这是一个 室内休闲这是一个 室内休闲这是一个 室内休闲这是一个 室内休闲</p>'),('856e1ac8-0471-4baa-a394-27c82ad3d5c8','','2020-04-19 00:26:01.817563','2020-04-19 00:26:28.000000',752,85,'[{\"uid\": 1587227179052, \"url\": \"http://localhost:2333/uploads/_____30_II_2560_1600-1587227157877.jpeg\", \"name\": \"_____30_II_2560_1600-1587227157877.jpeg\", \"status\": \"success\"}, {\"uid\": 1587227179053, \"url\": \"http://localhost:2333/uploads/_____33_II_2560_1600-1587227157884.jpeg\", \"name\": \"_____33_II_2560_1600-1587227157884.jpeg\", \"status\": \"success\"}, {\"uid\": 1587227179054, \"url\": \"http://localhost:2333/uploads/_____31_2560_1600-1587227157882.jpeg\", \"name\": \"_____31_2560_1600-1587227157882.jpeg\", \"status\": \"success\"}]','这是一个鞋帽','<p>这是一个鞋帽这是一个鞋帽这是一个鞋帽这是一个鞋帽这是一个鞋帽这是一个鞋帽这是一个鞋帽这是一个鞋帽这是一个鞋帽这是一个鞋帽这是一个鞋帽这是一个鞋帽这是一个鞋帽这是一个鞋帽这是一个鞋帽这是一个鞋帽这是一个鞋帽这是一个鞋帽这是一个鞋帽这是一个鞋帽这是一个鞋帽这是一个鞋帽这是一个鞋帽这是一个鞋帽这是一个鞋帽这是一个鞋帽这是一个鞋帽这是一个鞋帽这是一个鞋帽这是一个鞋帽这是一个鞋帽这是一个鞋帽这是一个鞋帽这是一个鞋帽这是一个鞋帽这是一个鞋帽这是一个鞋帽这是一个鞋帽这是一个鞋帽这是一个鞋帽这是一个鞋帽这是一个鞋帽这是一个鞋帽这是一个鞋帽这是一个鞋帽这是一个鞋帽这是一个鞋帽这是一个鞋帽这是一个鞋帽这是一个鞋帽这是一个鞋帽这是一个鞋帽这是一个鞋帽这是一个鞋帽这是一个鞋帽这是一个鞋帽这是一个鞋帽这是一个鞋帽这是一个鞋帽这是一个鞋帽这是一个鞋帽这是一个鞋帽这是一个鞋帽这是一个鞋帽</p>'),('8a447f11-8e1c-4762-b8d6-9606a60e7d78','','2020-04-19 00:33:58.757527','2020-04-19 00:34:12.000000',888,4000,'[{\"uid\": 1587227644552, \"url\": \"http://localhost:2333/uploads/_____28_II_2560_1600-1587227611443.jpeg\", \"name\": \"_____28_II_2560_1600-1587227611443.jpeg\", \"status\": \"success\"}, {\"uid\": 1587227644553, \"url\": \"http://localhost:2333/uploads/_____35_II_2560_1600-1587227611453.jpeg\", \"name\": \"_____35_II_2560_1600-1587227611453.jpeg\", \"status\": \"success\"}, {\"uid\": 1587227644554, \"url\": \"http://localhost:2333/uploads/_____29_II_2560_1600-1587227611448.jpeg\", \"name\": \"_____29_II_2560_1600-1587227611448.jpeg\", \"status\": \"success\"}]','这是一个糖果巧克力','<p>这是一个糖果巧克力这是一个糖果巧克力这是一个糖果巧克力这是一个糖果巧克力这是一个糖果巧克力这是一个糖果巧克力这是一个糖果巧克力这是一个糖果巧克力这是一个糖果巧克力这是一个糖果巧克力这是一个糖果巧克力这是一个糖果巧克力这是一个糖果巧克力这是一个糖果巧克力这是一个糖果巧克力这是一个糖果巧克力这是一个糖果巧克力这是一个糖果巧克力这是一个糖果巧克力这是一个糖果巧克力这是一个糖果巧克力这是一个糖果巧克力这是一个糖果巧克力这是一个糖果巧克力这是一个糖果巧克力这是一个糖果巧克力这是一个糖果巧克力这是一个糖果巧克力这是一个糖果巧克力这是一个糖果巧克力这是一个糖果巧克力这是一个糖果巧克力这是一个糖果巧克力这是一个糖果巧克力这是一个糖果巧克力这是一个糖果巧克力这是一个糖果巧克力这是一个糖果巧克力这是一个糖果巧克力这是一个糖果巧克力这是一个糖果巧克力这是一个糖果巧克力这是一个糖果巧克力这是一个糖果巧克力这是一个糖果巧克力这是一个糖果巧克力这是一个糖果巧克力这是一个糖果巧克力</p>'),('94b78534-d2ed-4fbe-9101-3721ea15fe7b','','2020-04-19 00:19:23.525291','2020-04-19 00:19:36.000000',852,1596,'[{\"uid\": 1587226767285, \"url\": \"http://localhost:2333/uploads/_____80_II_2560_1600-1587226733911.jpeg\", \"name\": \"_____80_II_2560_1600-1587226733911.jpeg\", \"status\": \"success\"}, {\"uid\": 1587226767286, \"url\": \"http://localhost:2333/uploads/_____82_II_2560_1600-1587226733925.jpeg\", \"name\": \"_____82_II_2560_1600-1587226733925.jpeg\", \"status\": \"success\"}, {\"uid\": 1587226767287, \"url\": \"http://localhost:2333/uploads/_____83_II_2560_1600-1587226733931.jpeg\", \"name\": \"_____83_II_2560_1600-1587226733931.jpeg\", \"status\": \"success\"}, {\"uid\": 1587226767288, \"url\": \"http://localhost:2333/uploads/_____81_II_2560_1600-1587226733920.jpeg\", \"name\": \"_____81_II_2560_1600-1587226733920.jpeg\", \"status\": \"success\"}]','这是一个男装','<p>		这是一个 <strong style=\"color: rgb(119, 159, 211); background-color: rgb(245, 247, 250);\">男装</strong>这是一个 <strong style=\"color: rgb(119, 159, 211); background-color: rgb(245, 247, 250);\">男装</strong>这是一个 <strong style=\"color: rgb(119, 159, 211); background-color: rgb(245, 247, 250);\">男装</strong>这是一个 <strong style=\"color: rgb(119, 159, 211); background-color: rgb(245, 247, 250);\">男装</strong>这是一个 <strong style=\"color: rgb(119, 159, 211); background-color: rgb(245, 247, 250);\">男装</strong>这是一个 <strong style=\"color: rgb(119, 159, 211); background-color: rgb(245, 247, 250);\">男装</strong>这是一个 <strong style=\"color: rgb(119, 159, 211); background-color: rgb(245, 247, 250);\">男装</strong>这是一个 <strong style=\"color: rgb(119, 159, 211); background-color: rgb(245, 247, 250);\">男装</strong>这是一个 <strong style=\"color: rgb(119, 159, 211); background-color: rgb(245, 247, 250);\">男装</strong>这是一个 <strong style=\"color: rgb(119, 159, 211); background-color: rgb(245, 247, 250);\">男装</strong>这是一个 <strong style=\"color: rgb(119, 159, 211); background-color: rgb(245, 247, 250);\">男装</strong>这是一个 <strong style=\"color: rgb(119, 159, 211); background-color: rgb(245, 247, 250);\">男装</strong>这是一个 <strong style=\"color: rgb(119, 159, 211); background-color: rgb(245, 247, 250);\">男装</strong>这是一个 <strong style=\"color: rgb(119, 159, 211); background-color: rgb(245, 247, 250);\">男装</strong>这是一个 <strong style=\"color: rgb(119, 159, 211); background-color: rgb(245, 247, 250);\">男装</strong>这是一个 <strong style=\"color: rgb(119, 159, 211); background-color: rgb(245, 247, 250);\">男装</strong>这是一个 <strong style=\"color: rgb(119, 159, 211); background-color: rgb(245, 247, 250);\">男装</strong>这是一个 <strong style=\"color: rgb(119, 159, 211); background-color: rgb(245, 247, 250);\">男装</strong>这是一个 <strong style=\"color: rgb(119, 159, 211); background-color: rgb(245, 247, 250);\">男装</strong>这是一个 <strong style=\"color: rgb(119, 159, 211); background-color: rgb(245, 247, 250);\">男装</strong>这是一个 <strong style=\"color: rgb(119, 159, 211); background-color: rgb(245, 247, 250);\">男装</strong>这是一个 <strong style=\"color: rgb(119, 159, 211); background-color: rgb(245, 247, 250);\">男装</strong>这是一个 <strong style=\"color: rgb(119, 159, 211); background-color: rgb(245, 247, 250);\">男装</strong>这是一个 <strong style=\"color: rgb(119, 159, 211); background-color: rgb(245, 247, 250);\">男装</strong>这是一个 <strong style=\"color: rgb(119, 159, 211); background-color: rgb(245, 247, 250);\">男装</strong>这是一个 <strong style=\"color: rgb(119, 159, 211); background-color: rgb(245, 247, 250);\">男装</strong>这是一个 <strong style=\"color: rgb(119, 159, 211); background-color: rgb(245, 247, 250);\">男装</strong>这是一个 <strong style=\"color: rgb(119, 159, 211); background-color: rgb(245, 247, 250);\">男装</strong>这是一个 <strong style=\"color: rgb(119, 159, 211); background-color: rgb(245, 247, 250);\">男装</strong>这是一个 <strong style=\"color: rgb(119, 159, 211); background-color: rgb(245, 247, 250);\">男装</strong>这是一个 <strong style=\"color: rgb(119, 159, 211); background-color: rgb(245, 247, 250);\">男装</strong>这是一个 <strong style=\"color: rgb(119, 159, 211); background-color: rgb(245, 247, 250);\">男装</strong>这是一个 <strong style=\"color: rgb(119, 159, 211); background-color: rgb(245, 247, 250);\">男装</strong>这是一个 <strong style=\"color: rgb(119, 159, 211); background-color: rgb(245, 247, 250);\">男装</strong>这是一个 <strong style=\"color: rgb(119, 159, 211); background-color: rgb(245, 247, 250);\">男装</strong>这是一个 <strong style=\"color: rgb(119, 159, 211); background-color: rgb(245, 247, 250);\">男装</strong>这是一个 <strong style=\"color: rgb(119, 159, 211); background-color: rgb(245, 247, 250);\">男装</strong>这是一个 <strong style=\"color: rgb(119, 159, 211); background-color: rgb(245, 247, 250);\">男装</strong>这是一个 <strong style=\"color: rgb(119, 159, 211); background-color: rgb(245, 247, 250);\">男装</strong>这是一个 <strong style=\"color: rgb(119, 159, 211); background-color: rgb(245, 247, 250);\">男装</strong>这是一个 <strong style=\"color: rgb(119, 159, 211); background-color: rgb(245, 247, 250);\">男装</strong>这是一个 <strong style=\"color: rgb(119, 159, 211); background-color: rgb(245, 247, 250);\">男装</strong>这是一个 <strong style=\"color: rgb(119, 159, 211); background-color: rgb(245, 247, 250);\">男装</strong>这是一个 <strong style=\"color: rgb(119, 159, 211); background-color: rgb(245, 247, 250);\">男装</strong>这是一个 <strong style=\"color: rgb(119, 159, 211); background-color: rgb(245, 247, 250);\">男装</strong>这是一个 <strong style=\"color: rgb(119, 159, 211); background-color: rgb(245, 247, 250);\">男装</strong>这是一个 <strong style=\"color: rgb(119, 159, 211); background-color: rgb(245, 247, 250);\">男装</strong>这是一个 <strong style=\"color: rgb(119, 159, 211); background-color: rgb(245, 247, 250);\">男装</strong>这是一个 <strong style=\"color: rgb(119, 159, 211); background-color: rgb(245, 247, 250);\">男装</strong>这是一个 <strong style=\"color: rgb(119, 159, 211); background-color: rgb(245, 247, 250);\">男装</strong>这是一个 <strong style=\"color: rgb(119, 159, 211); background-color: rgb(245, 247, 250);\">男装</strong>这是一个 <strong style=\"color: rgb(119, 159, 211); background-color: rgb(245, 247, 250);\">男装</strong>这是一个 <strong style=\"color: rgb(119, 159, 211); background-color: rgb(245, 247, 250);\">男装</strong>这是一个 <strong style=\"color: rgb(119, 159, 211); background-color: rgb(245, 247, 250);\">男装</strong>这是一个 <strong style=\"color: rgb(119, 159, 211); background-color: rgb(245, 247, 250);\">男装</strong>这是一个 <strong style=\"color: rgb(119, 159, 211); background-color: rgb(245, 247, 250);\">男装</strong>这是一个 <strong style=\"color: rgb(119, 159, 211); background-color: rgb(245, 247, 250);\">男装</strong>这是一个 <strong style=\"color: rgb(119, 159, 211); background-color: rgb(245, 247, 250);\">男装</strong>这是一个 <strong style=\"color: rgb(119, 159, 211); background-color: rgb(245, 247, 250);\">男装</strong>这是一个 <strong style=\"color: rgb(119, 159, 211); background-color: rgb(245, 247, 250);\">男装</strong>这是一个 <strong style=\"color: rgb(119, 159, 211); background-color: rgb(245, 247, 250);\">男装</strong>这是一个 <strong style=\"color: rgb(119, 159, 211); background-color: rgb(245, 247, 250);\">男装</strong>这是一个 <strong style=\"color: rgb(119, 159, 211); background-color: rgb(245, 247, 250);\">男装</strong>这是一个 <strong style=\"color: rgb(119, 159, 211); background-color: rgb(245, 247, 250);\">男装</strong>这是一个 <strong style=\"color: rgb(119, 159, 211); background-color: rgb(245, 247, 250);\">男装</strong>这是一个 <strong style=\"color: rgb(119, 159, 211); background-color: rgb(245, 247, 250);\">男装</strong>这是一个 <strong style=\"color: rgb(119, 159, 211); background-color: rgb(245, 247, 250);\">男装</strong>这是一个 <strong style=\"color: rgb(119, 159, 211); background-color: rgb(245, 247, 250);\">男装</strong>这是一个 <strong style=\"color: rgb(119, 159, 211); background-color: rgb(245, 247, 250);\">男装</strong>这是一个 <strong style=\"color: rgb(119, 159, 211); background-color: rgb(245, 247, 250);\">男装</strong>这是一个 <strong style=\"color: rgb(119, 159, 211); background-color: rgb(245, 247, 250);\">男装</strong>这是一个 <strong style=\"color: rgb(119, 159, 211); background-color: rgb(245, 247, 250);\">男装</strong>这是一个 <strong style=\"color: rgb(119, 159, 211); background-color: rgb(245, 247, 250);\">男装</strong>这是一个 <strong style=\"color: rgb(119, 159, 211); background-color: rgb(245, 247, 250);\">男装</strong>这是一个 <strong style=\"color: rgb(119, 159, 211); background-color: rgb(245, 247, 250);\">男装</strong>这是一个 <strong style=\"color: rgb(119, 159, 211); background-color: rgb(245, 247, 250);\">男装</strong>这是一个 <strong style=\"color: rgb(119, 159, 211); background-color: rgb(245, 247, 250);\">男装</strong>这是一个 <strong style=\"color: rgb(119, 159, 211); background-color: rgb(245, 247, 250);\">男装</strong>这是一个 <strong style=\"color: rgb(119, 159, 211); background-color: rgb(245, 247, 250);\">男装</strong>这是一个 <strong style=\"color: rgb(119, 159, 211); background-color: rgb(245, 247, 250);\">男装</strong>这是一个 <strong style=\"color: rgb(119, 159, 211); background-color: rgb(245, 247, 250);\">男装</strong>这是一个 <strong style=\"color: rgb(119, 159, 211); background-color: rgb(245, 247, 250);\">男装</strong>这是一个 <strong style=\"color: rgb(119, 159, 211); background-color: rgb(245, 247, 250);\">男装</strong>这是一个 <strong style=\"color: rgb(119, 159, 211); background-color: rgb(245, 247, 250);\">男装</strong>这是一个 <strong style=\"color: rgb(119, 159, 211); background-color: rgb(245, 247, 250);\">男装</strong>这是一个 <strong style=\"color: rgb(119, 159, 211); background-color: rgb(245, 247, 250);\">男装</strong>这是一个 <strong style=\"color: rgb(119, 159, 211); background-color: rgb(245, 247, 250);\">男装</strong></p>'),('9ee28bfc-87b0-4893-94d9-7fbcc0d4fad8','','2020-04-19 00:36:26.748607','2020-04-19 00:36:26.748607',752,852,'[{\"url\": \"http://localhost:2333/uploads/_____80_II_2560_1600-1587227778671.jpeg\", \"name\": \"_____80_II_2560_1600-1587227778671.jpeg\"}, {\"url\": \"http://localhost:2333/uploads/_____82_II_2560_1600-1587227778681.jpeg\", \"name\": \"_____82_II_2560_1600-1587227778681.jpeg\"}, {\"url\": \"http://localhost:2333/uploads/_____81_II_2560_1600-1587227778675.jpeg\", \"name\": \"_____81_II_2560_1600-1587227778675.jpeg\"}]','这是一个水果','<p>这是一个水果这是一个水果这是一个水果这是一个水果这是一个水果这是一个水果这是一个水果这是一个水果这是一个水果这是一个水果这是一个水果这是一个水果这是一个水果这是一个水果这是一个水果这是一个水果这是一个水果这是一个水果这是一个水果这是一个水果这是一个水果这是一个水果这是一个水果这是一个水果这是一个水果这是一个水果这是一个水果这是一个水果这是一个水果这是一个水果这是一个水果这是一个水果这是一个水果这是一个水果这是一个水果这是一个水果这是一个水果这是一个水果这是一个水果这是一个水果这是一个水果这是一个水果这是一个水果这是一个水果这是一个水果这是一个水果这是一个水果这是一个水果这是一个水果这是一个水果这是一个水果这是一个水果这是一个水果这是一个水果这是一个水果这是一个水果这是一个水果这是一个水果这是一个水果这是一个水果这是一个水果这是一个水果这是一个水果这是一个水果这是一个水果这是一个水果这是一个水果这是一个水果这是一个水果这是一个水果这是一个水果这是一个水果这是一个水果这是一个水果这是一个水果这是一个水果这是一个水果这是一个水果这是一个水果这是一个水果这是一个水果这是一个水果这是一个水果这是一个水果这是一个水果这是一个水果这是一个水果这是一个水果这是一个水果这是一个水果这是一个水果这是一个水果这是一个水果这是一个水果这是一个水果这是一个水果这是一个水果</p>'),('ae952991-8187-4aa0-a0af-1770b98f16f4','','2020-04-19 00:53:12.773633','2020-04-19 00:53:23.000000',555,33333,'[{\"uid\": 1587228795148, \"url\": \"http://localhost:2333/uploads/9-1587228719819.jpeg\", \"name\": \"9-1587228719819.jpeg\", \"status\": \"success\"}, {\"uid\": 1587228795149, \"url\": \"http://localhost:2333/uploads/3-1587228719810.jpeg\", \"name\": \"3-1587228719810.jpeg\", \"status\": \"success\"}, {\"uid\": 1587228795150, \"url\": \"http://localhost:2333/uploads/2-1587228719804.jpeg\", \"name\": \"2-1587228719804.jpeg\", \"status\": \"success\"}, {\"uid\": 1587228795151, \"url\": \"http://localhost:2333/uploads/3ae02fab9393694d73c05482b90feccf1e3d6b2d-1587228719816.png\", \"name\": \"3ae02fab9393694d73c05482b90feccf1e3d6b2d-1587228719816.png\", \"status\": \"success\"}]','这是一个漫画','<p>这是一个漫画这是一个漫画这是一个漫画这是一个漫画这是一个漫画这是一个漫画这是一个漫画这是一个漫画这是一个漫画这是一个漫画这是一个漫画这是一个漫画这是一个漫画这是一个漫画这是一个漫画这是一个漫画这是一个漫画这是一个漫画这是一个漫画这是一个漫画这是一个漫画这是一个漫画这是一个漫画这是一个漫画这是一个漫画这是一个漫画这是一个漫画这是一个漫画这是一个漫画这是一个漫画这是一个漫画这是一个漫画这是一个漫画这是一个漫画这是一个漫画这是一个漫画这是一个漫画这是一个漫画这是一个漫画这是一个漫画这是一个漫画这是一个漫画这是一个漫画这是一个漫画这是一个漫画这是一个漫画这是一个漫画这是一个漫画这是一个漫画这是一个漫画这是一个漫画这是一个漫画这是一个漫画这是一个漫画这是一个漫画这是一个漫画这是一个漫画这是一个漫画这是一个漫画这是一个漫画这是一个漫画这是一个漫画这是一个漫画这是一个漫画这是一个漫画这是一个漫画这是一个漫画这是一个漫画这是一个漫画这是一个漫画这是一个漫画这是一个漫画这是一个漫画这是一个漫画这是一个漫画这是一个漫画这是一个漫画这是一个漫画这是一个漫画这是一个漫画这是一个漫画这是一个漫画这是一个漫画</p>'),('bc744b19-eb3a-450a-8f43-94b5026076f6','','2020-04-19 00:56:32.813476','2020-04-19 00:56:32.813476',233,221,'[{\"url\": \"http://localhost:2333/uploads/_____85_II_2560_1600-1587228883955.jpeg\", \"name\": \"_____85_II_2560_1600-1587228883955.jpeg\"}, {\"url\": \"http://localhost:2333/uploads/_____91_II_2560_1600-1587228883965.jpeg\", \"name\": \"_____91_II_2560_1600-1587228883965.jpeg\"}, {\"url\": \"http://localhost:2333/uploads/_____86_II_2560_1600-1587228883960.jpeg\", \"name\": \"_____86_II_2560_1600-1587228883960.jpeg\"}]','这是一个小说','<p>这是一个小说这是一个小说这是一个小说这是一个小说这是一个小说这是一个小说这是一个小说这是一个小说这是一个小说这是一个小说这是一个小说这是一个小说这是一个小说这是一个小说这是一个小说这是一个小说这是一个小说这是一个小说这是一个小说这是一个小说这是一个小说这是一个小说这是一个小说这是一个小说这是一个小说这是一个小说这是一个小说这是一个小说这是一个小说这是一个小说这是一个小说这是一个小说这是一个小说这是一个小说这是一个小说这是一个小说这是一个小说这是一个小说这是一个小说这是一个小说这是一个小说这是一个小说这是一个小说这是一个小说这是一个小说这是一个小说这是一个小说这是一个小说这是一个小说这是一个小说这是一个小说这是一个小说这是一个小说这是一个小说这是一个小说这是一个小说这是一个小说这是一个小说这是一个小说这是一个小说这是一个小说这是一个小说这是一个小说这是一个小说这是一个小说这是一个小说这是一个小说这是一个小说这是一个小说这是一个小说这是一个小说这是一个小说这是一个小说这是一个小说这是一个小说这是一个小说这是一个小说</p>'),('bd82c8ba-9b17-4c04-bd0f-c91cb09819be','','2020-04-19 00:58:56.223978','2020-04-19 00:58:56.223978',78,68,'[{\"url\": \"http://localhost:2333/uploads/_____16_VI_2560_1600-1587229059968.jpeg\", \"name\": \"_____16_VI_2560_1600-1587229059968.jpeg\"}, {\"url\": \"http://localhost:2333/uploads/_____17_VI_2560_1600-1587229059974.jpeg\", \"name\": \"_____17_VI_2560_1600-1587229059974.jpeg\"}, {\"url\": \"http://localhost:2333/uploads/_____18_VI_2560_1600-1587229059982.jpeg\", \"name\": \"_____18_VI_2560_1600-1587229059982.jpeg\"}]','这是一个诗歌','<p>这是一个诗歌这是一个诗歌这是一个诗歌这是一个诗歌这是一个诗歌这是一个诗歌这是一个诗歌这是一个诗歌这是一个诗歌这是一个诗歌这是一个诗歌这是一个诗歌这是一个诗歌这是一个诗歌这是一个诗歌这是一个诗歌这是一个诗歌这是一个诗歌这是一个诗歌这是一个诗歌这是一个诗歌这是一个诗歌这是一个诗歌这是一个诗歌这是一个诗歌这是一个诗歌这是一个诗歌这是一个诗歌这是一个诗歌这是一个诗歌这是一个诗歌这是一个诗歌这是一个诗歌这是一个诗歌这是一个诗歌</p>'),('dcaf3488-84fa-4985-a5ff-e66ff83f1142','','2020-04-19 00:42:30.708850','2020-04-19 00:42:30.708850',455,852,'[{\"url\": \"http://localhost:2333/uploads/_____32_II_2560_1600-1587228094794.jpeg\", \"name\": \"_____32_II_2560_1600-1587228094794.jpeg\"}, {\"url\": \"http://localhost:2333/uploads/_____36_II_2560_1600-1587228094797.jpeg\", \"name\": \"_____36_II_2560_1600-1587228094797.jpeg\"}, {\"url\": \"http://localhost:2333/uploads/_____23_II_2560_1600-1587228094789.jpeg\", \"name\": \"_____23_II_2560_1600-1587228094789.jpeg\"}]','这是一个游泳','<p>这是一个游泳这是一个游泳这是一个游泳这是一个游泳这是一个游泳这是一个游泳这是一个游泳这是一个游泳这是一个游泳这是一个游泳这是一个游泳这是一个游泳这是一个游泳这是一个游泳这是一个游泳这是一个游泳这是一个游泳这是一个游泳这是一个游泳这是一个游泳这是一个游泳这是一个游泳这是一个游泳这是一个游泳这是一个游泳这是一个游泳这是一个游泳这是一个游泳这是一个游泳这是一个游泳这是一个游泳这是一个游泳这是一个游泳这是一个游泳这是一个游泳这是一个游泳这是一个游泳这是一个游泳这是一个游泳这是一个游泳这是一个游泳这是一个游泳这是一个游泳这是一个游泳这是一个游泳这是一个游泳这是一个游泳这是一个游泳这是一个游泳这是一个游泳这是一个游泳这是一个游泳这是一个游泳这是一个游泳这是一个游泳这是一个游泳这是一个游泳这是一个游泳这是一个游泳这是一个游泳这是一个游泳这是一个游泳这是一个游泳这是一个游泳这是一个游泳这是一个游泳这是一个游泳这是一个游泳这是一个游泳这是一个游泳这是一个游泳这是一个游泳这是一个游泳这是一个游泳这是一个游泳这是一个游泳这是一个游泳</p>'),('e3d280cb-79f0-4838-bdb9-c10d4ba6ddd6','','2020-04-19 00:21:39.330940','2020-04-19 00:26:36.000000',854,3214,'[{\"uid\": 1587227190933, \"url\": \"http://localhost:2333/uploads/_____100_II_2560_1600-1587226883677.jpeg\", \"name\": \"_____100_II_2560_1600-1587226883677.jpeg\", \"status\": \"success\"}, {\"uid\": 1587227190934, \"url\": \"http://localhost:2333/uploads/_____98_II_2560_1600-1587226883670.jpeg\", \"name\": \"_____98_II_2560_1600-1587226883670.jpeg\", \"status\": \"success\"}, {\"uid\": 1587227190935, \"url\": \"http://localhost:2333/uploads/_____99_II_2560_1600-1587226883673.jpeg\", \"name\": \"_____99_II_2560_1600-1587226883673.jpeg\", \"status\": \"success\"}]','这是一个女装','<p>这是一个女装这是一个女装这是一个女装这是一个女装这是一个女装这是一个女装这是一个女装这是一个女装这是一个女装这是一个女装这是一个女装这是一个女装这是一个女装这是一个女装这是一个女装这是一个女装这是一个女装这是一个女装这是一个女装这是一个女装这是一个女装这是一个女装这是一个女装这是一个女装这是一个女装这是一个女装这是一个女装这是一个女装这是一个女装这是一个女装这是一个女装这是一个女装这是一个女装这是一个女装这是一个女装这是一个女装这是一个女装这是一个女装这是一个女装这是一个女装这是一个女装这是一个女装这是一个女装这是一个女装这是一个女装这是一个女装这是一个女装这是一个女装这是一个女装这是一个女装这是一个女装这是一个女装这是一个女装这是一个女装这是一个女装这是一个女装这是一个女装这是一个女装这是一个女装这是一个女装这是一个女装这是一个女装这是一个女装这是一个女装这是一个女装这是一个女装这是一个女装这是一个女装这是一个女装这是一个女装这是一个女装这是一个女装这是一个女装这是一个女装这是一个女装这是一个女装这是一个女装这是一个女装这是一个女装这是一个女装这是一个女装这是一个女装这是一个女装这是一个女装这是一个女装这是一个女装这是一个女装这是一个女装这是一个女装这是一个女装</p><p>这是一个女装这是一个女装这是一个女装这是一个女装这是一个女装这是一个女装这是一个女装这是一个女装这是一个女装这是一个女装这是一个女装这是一个女装这是一个女装这是一个女装这是一个女装这是一个女装这是一个女装这是一个女装这是一个女装这是一个女装这是一个女装这是一个女装这是一个女装这是一个女装这是一个女装这是一个女装这是一个女装这是一个女装这是一个女装这是一个女装这是一个女装这是一个女装这是一个女装这是一个女装这是一个女装这是一个女装这是一个女装这是一个女装这是一个女装这是一个女装这是一个女装这是一个女装这是一个女装这是一个女装这是一个女装这是一个女装这是一个女装这是一个女装这是一个女装这是一个女装这是一个女装这是一个女装这是一个女装这是一个女装这是一个女装这是一个女装这是一个女装这是一个女装这是一个女装这是一个女装这是一个女装这是一个女装这是一个女装这是一个女装这是一个女装这是一个女装这是一个女装这是一个女装这是一个女装这是一个女装这是一个女装这是一个女装这是一个女装这是一个女装这是一个女装这是一个女装这是一个女装这是一个女装这是一个女装这是一个女装这是一个女装这是一个女装这是一个女装这是一个女装这是一个女装这是一个女装这是一个女装这是一个女装这是一个女装这是一个女装</p><p>这是一个女装这是一个女装这是一个女装这是一个女装这是一个女装这是一个女装这是一个女装这是一个女装这是一个女装这是一个女装这是一个女装这是一个女装这是一个女装这是一个女装这是一个女装这是一个女装这是一个女装这是一个女装这是一个女装这是一个女装这是一个女装这是一个女装这是一个女装这是一个女装这是一个女装这是一个女装这是一个女装这是一个女装这是一个女装这是一个女装这是一个女装这是一个女装这是一个女装这是一个女装这是一个女装这是一个女装这是一个女装这是一个女装这是一个女装这是一个女装这是一个女装这是一个女装这是一个女装这是一个女装这是一个女装这是一个女装这是一个女装这是一个女装这是一个女装这是一个女装这是一个女装这是一个女装这是一个女装这是一个女装这是一个女装这是一个女装这是一个女装这是一个女装这是一个女装这是一个女装这是一个女装这是一个女装这是一个女装这是一个女装这是一个女装这是一个女装这是一个女装这是一个女装这是一个女装这是一个女装这是一个女装这是一个女装这是一个女装这是一个女装这是一个女装这是一个女装这是一个女装这是一个女装这是一个女装这是一个女装这是一个女装这是一个女装这是一个女装这是一个女装这是一个女装这是一个女装这是一个女装这是一个女装这是一个女装这是一个女装</p>'),('e6cdb183-61a1-492b-9b3c-20313101090c','','2020-04-18 23:59:29.728596','2020-04-18 23:59:29.728596',100,50,'[{\"url\": \"http://localhost:2333/uploads/_____1_III_2560_1600-1587225548166.jpeg\", \"name\": \"_____1_III_2560_1600-1587225548166.jpeg\"}, {\"url\": \"http://localhost:2333/uploads/_____2_III_2560_1600-1587225548170.jpeg\", \"name\": \"_____2_III_2560_1600-1587225548170.jpeg\"}, {\"url\": \"http://localhost:2333/uploads/_____3_III_2560_1600-1587225548172.jpeg\", \"name\": \"_____3_III_2560_1600-1587225548172.jpeg\"}]','这是一个智能手表','<p>		这是一个智能手表这是一个智能手表这是一个智能手表这是一个智能手表这是一个智能手表这是一个智能手表这是一个智能手表这是一个智能手表这是一个智能手表这是一个智能手表这是一个智能手表这是一个智能手表这是一个智能手表这是一个智能手表这是一个智能手表这是一个智能手表这是一个智能手表这是一个智能手表</p><p>		这是一个智能手表这是一个智能手表这是一个智能手表这是一个智能手表这是一个智能手表这是一个智能手表这是一个智能手表这是一个智能手表这是一个智能手表这是一个智能手表这是一个智能手表这是一个智能手表这是一个智能手表这是一个智能手表这是一个智能手表这是一个智能手表这是一个智能手表这是一个智能手表</p><p>		这是一个智能手表这是一个智能手表这是一个智能手表这是一个智能手表这是一个智能手表这是一个智能手表这是一个智能手表这是一个智能手表这是一个智能手表这是一个智能手表这是一个智能手表这是一个智能手表这是一个智能手表这是一个智能手表这是一个智能手表这是一个智能手表这是一个智能手表这是一个智能手表</p>');
/*!40000 ALTER TABLE `good_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order`
--

DROP TABLE IF EXISTS `order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `order` (
  `id` varchar(36) NOT NULL,
  `name` varchar(255) NOT NULL,
  `createdDate` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `updatedDate` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `total_price` float DEFAULT NULL,
  `items` json DEFAULT NULL,
  `userId` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_caabe91507b3379c7ba73637b84` (`userId`),
  CONSTRAINT `FK_caabe91507b3379c7ba73637b84` FOREIGN KEY (`userId`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order`
--

LOCK TABLES `order` WRITE;
/*!40000 ALTER TABLE `order` DISABLE KEYS */;
/*!40000 ALTER TABLE `order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `user` (
  `id` varchar(36) NOT NULL,
  `name` varchar(255) NOT NULL,
  `createdDate` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `updatedDate` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `userInfoId` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `REL_5c634c605ff93c4ac0f1be62f0` (`userInfoId`),
  CONSTRAINT `FK_5c634c605ff93c4ac0f1be62f00` FOREIGN KEY (`userInfoId`) REFERENCES `user_info` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_info`
--

DROP TABLE IF EXISTS `user_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `user_info` (
  `id` varchar(36) NOT NULL,
  `name` varchar(255) NOT NULL,
  `createdDate` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `updatedDate` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `email` varchar(255) DEFAULT NULL,
  `sex` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `address` json DEFAULT NULL,
  `userId` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `REL_3a7fa0c3809d19eaf2fb4f6594` (`userId`),
  CONSTRAINT `FK_3a7fa0c3809d19eaf2fb4f65949` FOREIGN KEY (`userId`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_info`
--

LOCK TABLES `user_info` WRITE;
/*!40000 ALTER TABLE `user_info` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'tte'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-04-19  2:43:44
