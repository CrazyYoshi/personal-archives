-- MariaDB dump 10.18  Distrib 10.5.7-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: portfolio
-- ------------------------------------------------------
-- Server version	10.5.7-MariaDB-1:10.5.7+maria~buster

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Current Database: `portfolio`
--

/*!40000 DROP DATABASE IF EXISTS `portfolio`*/;

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `portfolio` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `portfolio`;

--
-- Table structure for table `portfolio_entries`
--

DROP TABLE IF EXISTS `portfolio_entries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `portfolio_entries` (
  `art_id` int(11) NOT NULL,
  `titre` text NOT NULL,
  `description` text NOT NULL,
  `src` text NOT NULL,
  `preview` text NOT NULL,
  `year` year(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `portfolio_entries`
--

LOCK TABLES `portfolio_entries` WRITE;
/*!40000 ALTER TABLE `portfolio_entries` DISABLE KEYS */;
INSERT INTO `portfolio_entries` VALUES (1,'JunkWorld - Colorisé','La version coloris&eacute;e de l\'artwork.','assets/portfolio/junkworldcolor.jpeg','assets/portfolio/junkworldcolor.jpeg',2014),(2,'AnID - Brainstorming logo','Charg&eacute; de r&eacute;aliser tous les documents de l&rsquo;agence sous inDesign, le logo originel posait probl&egrave;me &agrave; int&eacute;grer et ne correspondais pas &agrave; l&rsquo;image jeune et innovante que nous voulions donner de l&rsquo;agence. J&rsquo;ai donc &eacute;t&eacute; charg&eacute; de r&eacute;fl&eacute;chir &agrave; une refonte du logo de base cr&eacute;&eacute;e par notre chef de projet, voici les diff&eacute;rents logos et variantes auxquels j&rsquo;ai pu penser et soumis au reste de l&rsquo;agence.','assets/portfolio/anid_brainstormlogo.svg','assets/portfolio/anid_brainstormlogo.svg',2014),(3,'Pillz - Infographie','Apr&egrave;s avoir &eacute;tabli diff&eacute;rentes variantes pour le logo de notre application, il nous a fallu &eacute;tablir quel logo conviendrait le mieux pour celle-ci. Petit rappel&nbsp;: &laquo;&nbsp;Dans le cadre de notre projet tuteuré, nous nous proposons de réaliser une application mobile à vocation médicale, Pillz, dont le principal objectif est de permettre aux utilisateurs suivant un traitement de le prendre en temps voulu et de manière consciencieuse.&nbsp;&raquo; Le logo devait donc &ecirc;tre choisi de telle fa&ccedil;on &agrave; mettre l&rsquo;utilisateur en confiance. Une enqu&ecirc;te a &eacute;t&eacute; diffus&eacute;e sur les r&eacute;seaux sociaux et une infographie des r&eacute;sultats suivie.','assets/portfolio/anid_infographielogo.svg','assets/portfolio/anid_infographielogo.svg',2014),(4,'Pillz - FAQ','Dans le cadre du DUT MMI, nous devons réaliser un projet tuteuré en agence sur les deux ans de formation. Dans mon cas, il s’agissait de l’application Pillz. Ici, j’ai réalisé en tant que graphiste une foire aux questions avec la partie communicante de l’agence.','assets/portfolio/anid_pillz_faq.pdf','assets/portfolio/anid_pillz_faq.svg',2015),(5,'CV - Développeur Web','Il s’agit de la 3e ré-édition de mon CV graphique, je le souhaitais plus sobre sans pour autant être dénué d’expression.','assets/portfolio/MAAMAR_Miloud_CV-Graphique_WebDev.pdf','assets/portfolio/MAAMAR_Miloud_CV-Graphique_WebDev.svg',2015),(6,'JunkWorld - Original','Lors du cours d’écriture multimédia dispensée du DUT MMI, nous devions réaliser un jeu vidéo en 3D immersive sur Unity et Blender par groupe de 3-4.\r\nAllant de sa conception à sa réalisation, nous avons dû réaliser des artworks pour ce jeu. \r\nIci il s’agit d’une vue en perspective vue d’un autre immeuble, la version colorisée est aussi disponible sur le site.','assets/portfolio/junkworldnocolor.jpeg','assets/portfolio/junkworldnocolor.jpeg',2014),(7,'JunkWorld','Lors du cours d’écriture multimédia dispensée du DUT MMI, nous devions réaliser un jeu vidéo en 3D immersive sur Unity et Blender par groupe de 3-4. \r\nCe jeu à la manière Subway surfer consiste à traverser la ville infestée de robots dépollueurs, sans se faire tuer par ceux-ci. ','http://mmi.junkworld.amnesia.cafe','assets/portfolio/junkworldpreview.png',2015),(8,'Younion','Il s’agit ici du second site web développé en première année de DUT MMI. Comprenant une animation flash en entrée de site, un jeu réalisé en canvas/JS.','http://mmi.younion.amnesia.cafe','assets/portfolio/younionpreview.png',2014),(9,'ScreenPics','Il s’agit ici d’une bibliothèque d’image dynamique, elle combine essentiellement du jQuery/Ajax ainsi que du PHP pour fonctionner.\r\nElle a été réalisée en début de seconde année de DUT MMI.','http://mmi.mmi.screenpics.amnesia.cafe','assets/portfolio/screenpicspreview.png',2014),(10,'Nippon wallpaper','Originellement blanc et noir, j’avais réalisé ce fond d’écran en première année de DUT MMI. J’ai récemment modifié ses couleurs, ce qui donne à mon avis un rendu plus doux et moins agressif que la première version.','assets/portfolio/Nippon.jpg','assets/portfolio/Nippon.jpg',2015);
/*!40000 ALTER TABLE `portfolio_entries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `portfolio_tagsPerArts`
--

DROP TABLE IF EXISTS `portfolio_tagsPerArts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `portfolio_tagsPerArts` (
  `art_id` int(11) NOT NULL,
  `tag` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `portfolio_tagsPerArts`
--

LOCK TABLES `portfolio_tagsPerArts` WRITE;
/*!40000 ALTER TABLE `portfolio_tagsPerArts` DISABLE KEYS */;
INSERT INTO `portfolio_tagsPerArts` VALUES (1,'graphisme'),(1,'artwork'),(1,'étudiant'),(1,'multimédia'),(2,'graphisme'),(2,'logo'),(2,'étudiant'),(3,'graphisme'),(3,'logo'),(3,'étudiant'),(4,'PAO'),(4,'étudiant'),(5,'PAO'),(5,'personnel'),(6,'artwork'),(6,'étudiant'),(6,'multimédia'),(7,'étudiant'),(7,'multimédia'),(8,'site'),(8,'étudiant'),(8,'multimédia'),(9,'site'),(9,'étudiant'),(9,'multimédia'),(10,'graphisme'),(10,'artwork'),(10,'personnel');
/*!40000 ALTER TABLE `portfolio_tagsPerArts` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-11-16 20:05:48
