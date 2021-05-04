-- MySQL dump 10.13  Distrib 8.0.23, for Linux (x86_64)
--
-- Host: localhost    Database: marcas
-- ------------------------------------------------------
-- Server version       8.0.23

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
-- Table structure for table `comentarios`
--

DROP TABLE IF EXISTS `comentarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comentarios` (
  `id` int NOT NULL AUTO_INCREMENT,
  `comentario` varchar(510) NOT NULL,
  `feed` int NOT NULL,
  `nome` varchar(255) DEFAULT NULL,
  `conta` varchar(255) NOT NULL,
  `data` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_feed_idx` (`feed`),
  CONSTRAINT `fk_comentarios_feeds` FOREIGN KEY (`feed`) REFERENCES `feeds` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comentarios`
--

LOCK TABLES `comentarios` WRITE;
/*!40000 ALTER TABLE `comentarios` DISABLE KEYS */;
INSERT INTO `comentarios` VALUES (1,'teste',1,'Luis Paulo','luispscarvalho@gmail.com','2021-04-16 21:32:35');
/*!40000 ALTER TABLE `comentarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `empresas`
--

DROP TABLE IF EXISTS `empresas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `empresas` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(255) NOT NULL,
  `avatar` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empresas`
--

LOCK TABLES `empresas` WRITE;
/*!40000 ALTER TABLE `empresas` DISABLE KEYS */;
INSERT INTO `empresas` VALUES (1,'Fumetsu no Anata e (To Your Eternity)','avatar.png'),(2,'Tokyo Revengers','avatar.png'),(3,'Vivy – Fluorite Eye’s Song','avatar.png'),(4,'Mars Red','avatar.png'),(5,'Mashiro no Oto','avatar.png'),(6,'Koi to Yobu ni wa Kimochi Warui','avatar.png');
/*!40000 ALTER TABLE `empresas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `feeds`
--

DROP TABLE IF EXISTS `feeds`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `feeds` (
  `id` int NOT NULL AUTO_INCREMENT,
  `data` datetime NOT NULL,
  `produto` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_feeds_produtos_idx` (`produto`),
  CONSTRAINT `fk_feeds_produtos` FOREIGN KEY (`produto`) REFERENCES `produtos` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `feeds`
--

LOCK TABLES `feeds` WRITE;
/*!40000 ALTER TABLE `feeds` DISABLE KEYS */;
INSERT INTO `feeds` VALUES (1,'2021-04-14 18:21:11',1),(2,'2021-04-14 18:21:11',2),(3,'2021-04-14 18:21:11',3),(4,'2021-04-14 18:21:11',4),(5,'2021-04-14 18:21:11',5),(6,'2021-04-14 18:21:11',6);
/*!40000 ALTER TABLE `feeds` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `likes`
--

DROP TABLE IF EXISTS `likes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `likes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `feed` int NOT NULL,
  `email` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_likes_feeds_idx` (`feed`),
  CONSTRAINT `fk_likes_feeds` FOREIGN KEY (`feed`) REFERENCES `feeds` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `likes`
--

LOCK TABLES `likes` WRITE;
/*!40000 ALTER TABLE `likes` DISABLE KEYS */;
INSERT INTO `likes` VALUES (8,1,'luispscarvalho@gmail.com');
/*!40000 ALTER TABLE `likes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `produtos`
--

DROP TABLE IF EXISTS `produtos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `produtos` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(255) NOT NULL,
  `descricao` varchar(510) NOT NULL,
  `preco` varchar(255) NOT NULL,
  `url` varchar(1020) NOT NULL,
  `imagem1` varchar(255) NOT NULL,
  `imagem2` varchar(255) DEFAULT NULL,
  `imagem3` varchar(255) DEFAULT NULL,
  `empresa` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_produtos_empesas_idx` (`empresa`),
  CONSTRAINT `fk_produtos_empesas` FOREIGN KEY (`empresa`) REFERENCES `empresas` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produtos`
--

LOCK TABLES `produtos` WRITE;
/*!40000 ALTER TABLE `produtos` DISABLE KEYS */;
INSERT INTO `produtos` VALUES (1,'Fumetsu no Anata e (To Your Eternity)','A história acompanha um ser capaz de assimilar criaturas mortas e se transformar nelas. Inicialmente ela começa com um lobo, que faz amizade com um garoto que vive sozinho em uma região gélida. A partir de então, a criatura começa a aprender mais sobre a vida, e tudo mais que envolve ela, como sentimentos de perda, alegria, tristeza e até mesmo a raiva.','12/04','https://www.intoxianime.com/2021/03/novos-animes-de-abril-2021/','anime1.jpg','Destalhes1.png',NULL,1),(2,'Tokyo Revengers','A história acompanha Takemichi Hanagaki, um jovem que vive em um apartamento pequeno e é menos prezado pelo seu chefe, mesmo ele sendo mais novo. Hanagaki vê uma nóticia anunciando a morte brutal de sua ex-namorada por membros de uma perigosa gangue da cidade. Ao mesmo tempo, sem qualquer explicação, Hanagaki se vê de volta 20 anos no passado, onde decide subir na hierarquia da gangue que matou sua ex, para que assim possa salvar a garota e garantir uma vida melhor para si.','10/04','https://www.intoxianime.com/2021/03/novos-animes-de-abril-2021/','anime2.jpg','Detalhes2.png',NULL,2),(3,'Vivy – Fluorite Eye’s Song','A história se passa em Nearland, um parque temático de inteligências artificiais onde sonhos, esperanças e ciências coexiste. Vivy foi a primeira IA humana a ser desenvolvida, cuja a função é cantar todos os dias para deixar as pessoas felizes. Entretanto, certo dia ela recebe a inesperada visita de Matsumoto, uma IA que diz vir 100 anos do futuro para se juntar a Vivy e impedir que a humanidade entre em guerra com as IAs.','03/04','https://www.intoxianime.com/2021/03/novos-animes-de-abril-2021/','anime3.jpg','Detalhes3.png',NULL,3),(4,'Mars Red','A história se passa no ano de 1923, onde a existência de vampiros é reconhecida há um bom tempo. Entretanto, devido a um súbito aumento da população de vampiros, junto da criação de um sangue artificial chamado Ascra, fez com que o governo japonês criasse uma força militar especial conhecida como Code Zero, para que pudesse combater essas criaturas que ameaçam os seres humanos, mesmo que para isso tivessem que usar outros vampiros como parte do esquadrão.','05/04','https://www.intoxianime.com/2021/03/novos-animes-de-abril-2021/','anime4.jpg','Detalhes4.png',NULL,3),(5,'Mashiro no Oto','A história acompanha um jovem que, após a morte de seu avô, decide abandonar tudo e viver apenas tocando shamisen, um instrumento tradicional do Japão semelhante a um violão de 3 cordas. Certo dia, ele conhece uma garota com quem acaba criando uma inesperada relação, onde ambos buscam tentar entender através da música quem realmente são, e quais são seus objetivos.','02/04','https://www.intoxianime.com/2021/03/novos-animes-de-abril-2021/','anime5.jpg','Detalhes5.png',NULL,4),(6,'Koi to Yobu ni wa Kimochi Warui','A história acompanha Ryou, um solteirão boa pinta que vive atrás de novas parceiras. Em um certo dia ele é salvo por Ichika Arima, a amiga de sua irmã mais nova. Sem perder tempo, e acreditando ter encontrado um novo alvo, Ryou pede por um beijo e que os dois comecem a sair junto, mas é prontamente rejeito por Ichika. Por conta dessa inesperada reação(e os olhares de nojo), Ryou acredita que Ichika é a sua predestinada, começando então a investir ainda mais na garota.','29/03','https://www.intoxianime.com/2021/03/novos-animes-de-abril-2021/','anime6.jpg','Detalhes6.png',NULL,5);
/*!40000 ALTER TABLE `produtos` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-04-16 21:48:40