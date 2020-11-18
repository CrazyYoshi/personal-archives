-- MariaDB dump 10.18  Distrib 10.5.7-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: sunrise
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
-- Current Database: `sunrise`
--

/*!40000 DROP DATABASE IF EXISTS `sunrise`*/;

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `sunrise` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `sunrise`;

--
-- Table structure for table `color`
--

DROP TABLE IF EXISTS `color`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `color` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(45) DEFAULT NULL,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `color`
--

LOCK TABLES `color` WRITE;
/*!40000 ALTER TABLE `color` DISABLE KEYS */;
INSERT INTO `color` VALUES (1,'#fefefe','gris'),(2,'#9460a4','violet'),(3,'#fff','blanc'),(4,'#000','noir');
/*!40000 ALTER TABLE `color` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `doc_types`
--

DROP TABLE IF EXISTS `doc_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `doc_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `extensions` varchar(45) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `doc_types`
--

LOCK TABLES `doc_types` WRITE;
/*!40000 ALTER TABLE `doc_types` DISABLE KEYS */;
INSERT INTO `doc_types` VALUES (1,'pdf','Portable Document Format'),(2,'jpg','JPEG'),(4,'png','PNG'),(5,'svg','SVG'),(6,'url','Site');
/*!40000 ALTER TABLE `doc_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `experience`
--

DROP TABLE IF EXISTS `experience`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `experience` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `place` varchar(255) DEFAULT NULL,
  `date_start` date DEFAULT NULL,
  `date_end` date DEFAULT NULL,
  `job` varchar(255) DEFAULT NULL,
  `description` longtext DEFAULT NULL,
  `logo` int(11) NOT NULL,
  `bg-color` int(11) NOT NULL,
  `color` int(11) NOT NULL,
  PRIMARY KEY (`id`,`logo`,`bg-color`,`color`),
  KEY `fk_experience_files1_idx` (`logo`),
  KEY `fk_experience_color2_idx` (`bg-color`),
  KEY `fk_experience_color3_idx` (`color`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `experience`
--

LOCK TABLES `experience` WRITE;
/*!40000 ALTER TABLE `experience` DISABLE KEYS */;
INSERT INTO `experience` VALUES (1,'TVFIL78','TVFIL78 à Montigny-le-Bretonneux (78180)','2014-06-16','2014-07-16','Assistant webmaster, Community manager','Gestion communauté Twitter, Facebook, Google Plus; Edition et envoi de la newsletter; Gestion de contenu CMS Wordpress; Developpement d\'une nouvelle newsletter',3,1,4),(2,'AnID','IUT de Vélizy (78140)','2014-01-01','2015-04-13','Développeur Web et Mobile, Graphiste','Infographies, supports de communication, Identité visuelle / Travail de géolocalisation avec les Api Google Maps et Places',2,2,1),(3,'Laboratoire d\'Ingénierie des Systèmes de Versailles','LISV à Vélizy (78140)','2015-04-13','2015-07-24','Graphiste, Développeur','Conception et développement d\'un prototype d\'aide et d\'assistance à l\'apprentissage d\'une aide à la mobilité.',1,1,4);
/*!40000 ALTER TABLE `experience` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `file_nature`
--

DROP TABLE IF EXISTS `file_nature`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `file_nature` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nature` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `file_nature`
--

LOCK TABLES `file_nature` WRITE;
/*!40000 ALTER TABLE `file_nature` DISABLE KEYS */;
INSERT INTO `file_nature` VALUES (1,'Logo'),(2,'Photographie'),(3,'Preview'),(4,'Lien'),(5,'Placeholder'),(6,'photo-originals');
/*!40000 ALTER TABLE `file_nature` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `files`
--

DROP TABLE IF EXISTS `files`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `files` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `path` varchar(255) DEFAULT NULL,
  `type` int(11) NOT NULL,
  `file_nature_id` int(11) NOT NULL,
  PRIMARY KEY (`id`,`type`,`file_nature_id`),
  KEY `fk_files_doc_types1_idx` (`type`),
  KEY `fk_files_file_nature1_idx` (`file_nature_id`),
  CONSTRAINT `fk_files_doc_types1` FOREIGN KEY (`type`) REFERENCES `doc_types` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_files_file_nature1` FOREIGN KEY (`file_nature_id`) REFERENCES `file_nature` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=87 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `files`
--

LOCK TABLES `files` WRITE;
/*!40000 ALTER TABLE `files` DISABLE KEYS */;
INSERT INTO `files` VALUES (1,'Logo LISV','/files/logo/lisv.svg',5,1),(2,'Logo ANID','/files/logo/anid.svg',5,1),(3,'Logo TVFIL78','/files/logo/tvfil78.svg',5,1),(6,'Junkworld','https://mmi.junkworld.amnesia.cafe',6,4),(12,'Logo After Effect','/files/tech/aftereffect.png',2,1),(13,'Logo Angularjs','/files/tech/angularjs.png',4,1),(14,'Logo Apache','/files/tech/apache.png',4,1),(15,'Logo Blender','/files/tech/blender.png',4,1),(16,'Logo Bootstrap','/files/tech/bootstrap.png',4,1),(17,'Logo Cordova','/files/tech/cordova.png',2,1),(18,'Logo C-Sharp','/files/tech/c-sharp.png',4,1),(19,'Logo CSS3','/files/tech/css3.png',2,1),(20,'Logo Debian','/files/tech/debian.png',4,1),(21,'Logo Final Cut Pro X','/files/tech/fcpx.jpg',2,1),(22,'Logo Flash Pro','/files/tech/flashpro.png',2,1),(23,'Logo Git','/files/tech/git.png',2,1),(24,'Logo Gulp','/files/tech/gulp.png',4,1),(25,'Logo Html5','/files/tech/html5.png',2,1),(26,'Logo Illustrator','/files/tech/illustrator.png',2,1),(27,'Logo Indesign','/files/tech/indesign.png',2,1),(28,'Logo Ionic','/files/tech/ionic.png',4,1),(29,'logo Jquery','/files/tech/jquery.png',2,1),(30,'Logo JavaScript','/files/tech/javascript.png',2,1),(31,'Logo MySql','/files/tech/mysql.svg',4,1),(32,'Logo Pandasuite','/files/tech/pandasuite.png',4,1),(33,'Logo Photoshop','/files/tech/photoshop.png',2,1),(34,'Logo PHP','/files/tech/php.jpg',2,1),(35,'Logo Processing','/files/tech/processing.png',2,1),(36,'Logo Puredata','/files/tech/puredata.png',2,1),(37,'Logo SASS','/files/tech/sass.png',4,1),(38,'Logo SQLITE','/files/tech/sqlite.png',4,1),(39,'Logo Unity','/files/tech/unity.png',4,1),(40,'Placeholder Image','/files/portfolio/photography/placeholder-image.jpg',2,5),(41,'Placeholder Image Preview','/files/portfolio/photography/placeholder-image-preview.jpg',2,5),(42,'Fleurs','/files/portfolio/photography/fleurs.jpg',2,6),(43,'Placeholder image black','/files/portfolio/photography/placeholder-image-photographie.jpg',2,5),(44,'Fleurs Preview','/files/portfolio/photography/fleurs.preview.jpg',2,2),(45,'aladecouverteducanada.preview','/files/portfolio/webapps/aladecouverteducanada.preview.jpg',2,3),(46,'derives.preview','/files/portfolio/webapps/derives.preview.jpg',2,3),(47,'empreintes.preview','/files/portfolio/webapps/empreintes.preview.jpg',2,3),(48,'imaginonshochelaga.preview','/files/portfolio/webapps/imaginonshochelaga.preview.jpg',2,3),(49,'jumper.preview','/files/portfolio/webapps/jumper.preview.jpg',2,3),(50,'memoires.preview','/files/portfolio/webapps/memoires.preview.jpg',2,3),(51,'microblog.preview','/files/portfolio/webapps/microblog.preview.jpg',2,3),(52,'portfolio2015-2017.preview','/files/portfolio/webapps/portfolio2015-2017.preview.jpg',2,3),(53,'prototype_web_angularjs.preview','/files/portfolio/webapps/prototype_web_angularjs.preview.jpg',2,3),(54,'querredetroie.preview','/files/portfolio/webapps/querredetroie.preview.jpg',2,3),(55,'screenpics.preview','/files/portfolio/webapps/screenpics.preview.jpg',2,3),(56,'thundercatz.preview','/files/portfolio/webapps/thundercatz.preview.jpg',2,3),(57,'vayaterra.preview','/files/portfolio/webapps/vayaterra.preview.jpg',2,3),(58,'younion.preview','/files/portfolio/webapps/younion.preview.jpg',2,3),(59,'sunrise.preview','/files/portfolio/webapps/sunrise.preview.jpg',2,3),(60,'Sunrise','https://archive.pw3.amnesia.cafe',6,4),(61,'The (Ugly) Flat One-Page','https://archive.pw2.amnesia.cafe',6,4),(62,'New dawn','https://cen.newdawn.amnesia.cafe',6,4),(63,'Thundercatz','https://cen.thundercatz.amnesia.cafe',6,4),(64,'Jumper','https://cen.jumper.amnesia.cafe',6,4),(65,'Imaginons Hochelaga','https://cen.imaginons-hochelaga.amnesia.cafe',6,4),(66,'Mémoires','https://cen.imaginons-hochelaga.amnesia.cafe/memoires/',6,4),(67,'Dérives','https://imaginons-hochelaga.fr/derives/',6,4),(68,'Empreintes','https://imaginons-hochelaga.fr/empreintes/',6,4),(69,'Microblog','https://cen.microblog.amnesia.cafe',6,4),(70,'Guerre de Troie','https://www.youtube.com/watch?v=ZbIGNYH2Sz4',6,4),(71,'Screenpics','https://mmi.screenpics.amnesia.cafe',6,4),(72,'Vayaterra','https://cdnl.vayaterra.amnesia.cafe',6,4),(73,'A la découverte du Canada','https://www.youtube.com/watch?v=MSgQjdW18Q0',6,4),(74,'Logo Compass','/files/tech/compass.png',4,1),(75,'Une fleur dans un champ','/files/portfolio/photography/DSC_1922-1.preview.jpg',2,2),(76,'Une fleur dans un champ','/files/portfolio/photography/DSC_1922-1.jpg',2,6),(79,'Sbeeat Coast','/files/portfolio/photography/DSC_2845.preview.jpg',2,2),(80,'Sbeeat Coast','/files/portfolio/photography/DSC_2845.jpg',2,6),(81,'Sunrise in Oran\'s Port','/files/portfolio/photography/DSC_3161-1.preview.jpg',2,2),(82,'Sunrise in Oran\'s Port','/files/portfolio/photography/DSC_3161-1.jpg',2,6),(83,'In the coutryside','/files/portfolio/photography/DSC_3167.preview.jpg',2,2),(84,'In the coutryside','/files/portfolio/photography/DSC_3167.jpg',2,6),(85,'The Eiffel Tower seen from Montparnasse','/files/portfolio/photography/DSC_3315.preview.jpg',2,2),(86,'The Eiffel Tower seen from Montparnasse','/files/portfolio/photography/DSC_3315.jpg',2,6);
/*!40000 ALTER TABLE `files` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `leisures`
--

DROP TABLE IF EXISTS `leisures`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `leisures` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `leisure_fr` varchar(255) DEFAULT NULL,
  `leisure_en` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `leisures`
--

LOCK TABLES `leisures` WRITE;
/*!40000 ALTER TABLE `leisures` DISABLE KEYS */;
INSERT INTO `leisures` VALUES (1,'photographie','photography'),(2,'jeux-vidéo','video games'),(3,'balades','strolls'),(4,'nature','nature'),(5,'lecture','reading'),(6,'musique','music'),(7,'films','movies'),(8,'series tv','tv series'),(9,'animations','animations'),(10,'animés','animes'),(11,'manga','manga'),(12,'developpement','development'),(13,'se perdre sur le web','lose myself on the web'),(14,'parler','talking'),(15,'écouter','listening'),(16,'cuisiner','cooking'),(17,'technologie','technology'),(18,'apprendre','learning'),(19,'dessiner','draw'),(20,'peindre','painting');
/*!40000 ALTER TABLE `leisures` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `misc_json`
--

DROP TABLE IF EXISTS `misc_json`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `misc_json` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `data_nature` varchar(255) DEFAULT NULL,
  `json` longtext DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `misc_json`
--

LOCK TABLES `misc_json` WRITE;
/*!40000 ALTER TABLE `misc_json` DISABLE KEYS */;
INSERT INTO `misc_json` VALUES (1,'personal','{\r\n   \"name\":\"Miloud\",\r\n   \"surname\":\"Maamar\",\r\n   \"logo\":\"/files/logo/logo.svg\",\r\n   \"tel\":\"0615730508\",\r\n   \"address\":\"4 Rue Louis Aragon\",\r\n   \"zipcode\":\"78190\",\r\n   \"town\":\"Trappes\",\r\n   \"birthday\":\"22\",\r\n   \"mail\":\"mail@removed.com\",\r\n   \"avatar\":\"/files/avatar/avatar.jpg\"\r\n}');
/*!40000 ALTER TABLE `misc_json` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `portfolio`
--

DROP TABLE IF EXISTS `portfolio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `portfolio` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `description` longtext DEFAULT NULL,
  `date` date DEFAULT NULL,
  `original` int(11) NOT NULL,
  `preview` int(11) NOT NULL,
  PRIMARY KEY (`id`,`original`,`preview`),
  KEY `fk_portfolio_files1_idx` (`original`),
  KEY `fk_portfolio_files2_idx` (`preview`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `portfolio`
--

LOCK TABLES `portfolio` WRITE;
/*!40000 ALTER TABLE `portfolio` DISABLE KEYS */;
INSERT INTO `portfolio` VALUES (3,'The (Ugly) flat One-Page','Ce portfolio avait été développé sous des délais limités, \r\nil a été décliné à de nombreuses reprises pour convenir à différentes chartes graphiques. \r\nA l\'époque je restais encore indécis quand à mon identité graphique. Je souhaitais suivre les tendances actuelles (flat, material, one-page...)\r\nmais restais tout de même assez limité en temps, compétences et connaissances techniques. \r\n\r\nCette version du portfolio avait été développée en tentant d\'instaurer des notions du modèle MVC. \r\nIl s\'agit d\'un des premiers projet sur lesquels j\'ai pu m\'initier à SASS, aux animations CSS et leur activation par le biais d\'HTML Hacks (checkbox).\r\nLe site sollicite l\'utilisation d\'une base de données MySQL, de PHP et de jQuery (ajax) pour lier le back au front.','2015-08-20',61,52),(4,'The Sunrise Project','Etant amateur de photographie et en vacances au moment de sa conception, le projet tire son nom de ma volonté à capturer les éphémères et uniques couchers \r\nde soleil. Ceux-ci marquant la fin d\'un jour, ils marquent également le début de la nuit, une transition vers un nouveau jour, une nouvelle étape. \r\nC\'est après de nombreux reports que j\'ai finalement entrepris une refonte intégrale de mon site web. Cette fois-ci en adoptant une optique d\'évolution sur le long-terme. \r\nDes améliorations sont prévues sur le long terme, elles seront mises à jour au fur et à mesure de leur avancement dans la section Roadmap. \r\n\r\n\r\nL\'objectif à terme étant d\'obtenir un site web personnel dynamique, moderne, responsive et ergonomique.\r\n\r\nSur les différents objectifs, des choix technique ont été pris : \r\n	- l\'utilisation d\'AngularJs pour faciliter la maintenance du code de par l\'utilisation du modèle MVC, ainsi que de garantir l\'aspect dynamique du site. \r\n	- l\'utilisation d\'un environnement de développement basé sur Gulp pour l\'automatisation des tâches et obtenir une production propre\r\n	- l\'utilisation de SASS associée à Compass et Breakpoint pour maintenir un css facilement modifiable, compatible cross-browser et responsive.\r\n	- l\'utilisation d\'une base de données MySQL couplée à des scripts PHP dans l\'optique de faciliter la gestion du contenu du site. ','2017-12-01',60,59),(5,'New Dawn','Comme son nom l\'indique, ce projet devait marquer le début d\'une nouvelle ère. C\'est un projet de refonte pour un portfolio qui a été initié dans un cours d\'intégration web en Master CEN. \r\nAvec ce projet, j\'ai voulu apprendre davantage sur l\'utilisation d\'angularjs. Néanmoins le résultat final ne me satisfaisait pas, autant sur l\'aspect esthétique que sur l\'originalité de la conception, j\'ai donc \r\nRenoncé à utiliser cette version. ',NULL,62,53),(6,'Thundercatz','Simple petite page vitrine développée dans le cadre d\'un cours de communication en 1ère année de Master Création Edition Numérique. \r\nPage vitrine pour une campagne politique fictive pour un candidat de la race supérieure féline, Charles Whiskers. ',NULL,63,56),(7,'Jumper','Mini jeu développé dans le cadre d\'une semaine intensive portant sur Unity.',NULL,64,49),(8,'Imaginons Hochelaga','Dans le cadre du programme IDEFI Créatic et des ateliers laboratoires, nous avons eu l\'opportunité durant une semaine de nous rendre à \r\nMontréal afin d\'étudier les divergences culturelles et sociales, l\'histoire et l\'évolution du quartier d\'Hochelaga à Montréal. \r\n\r\n\r\nDans le cadre de cet atelier, j\'ai eu à charge le développement sur deux-trois soirs passés en laboratoire, le développement de 3 projets web synthétisant nos \r\nrecherches sur place, et plus tard le développement d\'une page liant ces 3 projets.\r\nLes rendu concernés sont : Imaginons Hochelaga, Mémoires, Empreintes et Dérives.\r\n\r\n\r\nPage d\'accueil semi-responsive mettant en avant les différents projets de l\'atelier laboratoire délocalisé à Montreal. \r\n',NULL,65,48),(9,'Dérives','Dans le cadre du programme IDEFI Créatic et des ateliers laboratoires, nous avons eu l\'opportunité durant une semaine de nous rendre à \r\nMontréal afin d\'étudier les divergences culturelles et sociales, l\'histoire et l\'évolution du quartier d\'Hochelaga à Montréal. \r\n\r\n\r\nDans le cadre de cet atelier, j\'ai eu à charge le développement sur deux-trois soirs passés en laboratoire, le développement de 3 projets web synthétisant nos \r\nrecherches sur place, et plus tard le développement d\'une page liant ces 3 projets.\r\nLes rendu concernés sont : Imaginons Hochelaga, Mémoires, Empreintes et Dérives.\r\n\r\nProjet artistique synthétisant les recherches de l\'atelier laboratoire sur Hochelaga. \r\n',NULL,67,46),(10,'Mémoires','Dans le cadre du programme IDEFI Créatic et des ateliers laboratoires, nous avons eu l\'opportunité durant une semaine de nous rendre à \r\nMontréal afin d\'étudier les divergences culturelles et sociales, l\'histoire et l\'évolution du quartier d\'Hochelaga à Montréal. \r\n\r\n\r\nDans le cadre de cet atelier, j\'ai eu à charge le développement sur deux-trois soirs passés en laboratoire, le développement de 3 projets web synthétisant nos \r\nrecherches sur place, et plus tard le développement d\'une page liant ces 3 projets.\r\nLes rendu concernés sont : Imaginons Hochelaga, Mémoires, Empreintes et Dérives.\r\n\r\nSite basé sur un template acheté par Créatic. Adaptation de celui-ci pour convenir aux besoins du projet. \r\n',NULL,66,50),(11,'Empreintes','Dans le cadre du programme IDEFI Créatic et des ateliers laboratoires, nous avons eu l\'opportunité durant une semaine de nous rendre à \r\nMontréal afin d\'étudier les divergences culturelles et sociales, l\'histoire et l\'évolution du quartier d\'Hochelaga à Montréal. \r\n\r\n\r\nDans le cadre de cet atelier, j\'ai eu à charge le développement sur deux-trois soirs passés en laboratoire, le développement de 3 projets web synthétisant nos \r\nrecherches sur place, et plus tard le développement d\'une page liant ces 3 projets.\r\nLes rendu concernés sont : Imaginons Hochelaga, Mémoires, Empreintes et Dérives.\r\n\r\nProjet artistique synthétisant les recherches de l\'atelier laboratoire sur Hochelaga. \r\n',NULL,68,47),(12,'Microblog','Dans le cadre du Master Cen, nous devions réaliser un projet web plus ou moins simple dans le cadre d\'une évaluation des connaissances en PHP et Bases de données. \r\nJ\'ai donc entrepris le développement d\'un petit blog, peu esthétique certes mais fonctionnel, accompagné d\'une interface de gestion et d\'une hiérarchisation des utilisateurs par droits.\r\nLe projet est exclusivement réalisé en PHP (accompagnée d\'une BDD), pas de javascript et très peu de CSS. De la ré-écriture d\'URL (URL-rewriting) est mise en place. ',NULL,69,51),(13,'App interactive : La Guerre de Troie','Dans le cadre du cours d\'éditorialisation en 1ère année de Master Cen, nous avons eu à développer une application mobile en usant de PandaSuite, un outil avec pour objectif de faciliter l\'accès au développement mobile par le biais d\'une interface What You See is What You Get. \r\nEn groupe nous avons alors conçu une application ludique et interactive retraçant la guerre de Troie.',NULL,70,54),(14,'Screenpics','En première année de DUT Métiers du Multimédia et de l\'Internet lors des travaux pratiques de développement et d\'intégration Web, nous avons appris et approfondis nos connaissances en javascript, c\'est aussi lors de ces TP que nous avons entrevus la librairie jQuery. Nous avions au choix, la réalisation d\'un nuage de mots animés ou une autre thématique dont je n\'ai plus certitude, serait-ce l\'implémentation d\'une base de données et l\'utilisation d\'Ajax ? J\'avais décidé d\'allier les deux options d\'évaluation sur ce petit projet.\r\nCette petite bibliothèque d\'images est un synthèse des possibilités de rendus demandés, on y retrouve essentiellement du filtrage avec différents mots-clés animés sous la forme d\'un nuage de mots et une visionneuse.',NULL,71,55),(15,'Vayaterra','En 3ème année de licence pro Création et Développement Numérique en Ligne, nous avions à charge la réalisation d\'un projet tutoré. A cet effet nous avions pour commanditaire Mundigo, pour le prototypage d\'une application web et mobile à destination des voyageurs et curieux. Vayaterra, c\'était une plateforme collaborative permettant aux amateurs de voyages et de découvertes la possibilité de réaliser sous la supervision d\'une équipe audio-visuelle des web-docs et documentaires télévisés. Un amateur publiait sur la plateforme une demande de projet, il avait la possibilité d\'effectuer une demande de crowdfunding, gérer une fiche de route retraçant l\'ensemble du projet...\r\n\r\nL\'application mobile était un compagnon du voyageur, par le biais de la géolocalisation le parcours était tracé progressivement sur la page du projet. Cette fonctionnalité de géolocalisation avait également pour but de prévenir un danger, garder une dernière position en cas de perte de contact avec le voyageur. \r\nPar le biais de cette application, le voyageur pouvait également mettre à jour la page du projet, prendre des notes en rapport avec ce dernier. ',NULL,72,57);
/*!40000 ALTER TABLE `portfolio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `portfolio_has_skills`
--

DROP TABLE IF EXISTS `portfolio_has_skills`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `portfolio_has_skills` (
  `portfolio_id` int(11) NOT NULL,
  `skills_id` int(11) NOT NULL,
  PRIMARY KEY (`portfolio_id`,`skills_id`),
  KEY `fk_portfolio_has_skills_skills1_idx` (`skills_id`),
  KEY `fk_portfolio_has_skills_portfolio1_idx` (`portfolio_id`),
  CONSTRAINT `fk_portfolio_has_skills_portfolio1` FOREIGN KEY (`portfolio_id`) REFERENCES `portfolio` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_portfolio_has_skills_skills1` FOREIGN KEY (`skills_id`) REFERENCES `skills` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `portfolio_has_skills`
--

LOCK TABLES `portfolio_has_skills` WRITE;
/*!40000 ALTER TABLE `portfolio_has_skills` DISABLE KEYS */;
INSERT INTO `portfolio_has_skills` VALUES (3,7),(3,12),(3,16),(3,17),(3,18),(3,21),(3,24),(4,2),(4,7),(4,12),(4,16),(4,17),(4,18),(4,21),(4,24),(4,27),(5,2),(5,7),(5,12),(5,18),(5,21),(5,24),(5,27),(6,7),(6,12),(6,24),(7,6),(7,26),(8,7),(8,12),(8,16),(8,17),(8,24),(9,7),(9,12),(9,16),(9,17),(10,7),(10,12),(11,7),(11,12),(11,16),(11,17),(12,7),(12,12),(12,18),(12,21),(12,24),(13,7),(13,12),(13,17),(13,19),(14,7),(14,12),(14,16),(14,17),(14,21),(15,2),(15,5),(15,7),(15,12),(15,15),(15,16),(15,17),(15,21),(15,28);
/*!40000 ALTER TABLE `portfolio_has_skills` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `portfolio_has_tags`
--

DROP TABLE IF EXISTS `portfolio_has_tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `portfolio_has_tags` (
  `portfolio_id` int(11) NOT NULL,
  `tags_id` int(11) NOT NULL,
  PRIMARY KEY (`portfolio_id`,`tags_id`),
  KEY `fk_portfolio_has_tags_tags1_idx` (`tags_id`),
  KEY `fk_portfolio_has_tags_portfolio1_idx` (`portfolio_id`),
  CONSTRAINT `fk_portfolio_has_tags_portfolio1` FOREIGN KEY (`portfolio_id`) REFERENCES `portfolio` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_portfolio_has_tags_tags1` FOREIGN KEY (`tags_id`) REFERENCES `tags` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `portfolio_has_tags`
--

LOCK TABLES `portfolio_has_tags` WRITE;
/*!40000 ALTER TABLE `portfolio_has_tags` DISABLE KEYS */;
INSERT INTO `portfolio_has_tags` VALUES (3,1),(3,5),(3,6),(3,7),(3,8),(4,1),(4,5),(4,8),(4,9),(5,1),(5,3),(5,5),(5,8),(5,10),(6,1),(6,3),(6,6),(6,7),(6,10),(7,3),(7,10),(7,13),(8,1),(8,3),(8,9),(8,10),(8,14),(8,15),(9,1),(9,3),(9,10),(9,14),(9,15),(10,1),(10,3),(10,9),(10,10),(10,14),(10,15),(10,16),(11,1),(11,3),(11,10),(11,15),(12,1),(12,3),(12,10),(13,3),(13,10),(13,17),(14,1),(14,3),(14,10),(15,1),(15,3),(15,12),(15,17);
/*!40000 ALTER TABLE `portfolio_has_tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roadmap_tasks`
--

DROP TABLE IF EXISTS `roadmap_tasks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `roadmap_tasks` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `done` tinyint(1) DEFAULT 0,
  `parent` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_roadmap_tasks_roadmap_tasks1_idx` (`parent`),
  CONSTRAINT `fk_roadmap_tasks_roadmap_tasks1` FOREIGN KEY (`parent`) REFERENCES `roadmap_tasks` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roadmap_tasks`
--

LOCK TABLES `roadmap_tasks` WRITE;
/*!40000 ALTER TABLE `roadmap_tasks` DISABLE KEYS */;
INSERT INTO `roadmap_tasks` VALUES (1,'Sunrise Project',0,NULL),(2,'Amnesia.cafe',0,NULL),(3,'Portage VPS',0,NULL),(4,'Sécurisation',0,3),(5,'Réinstallation des serveurs et modules',0,3),(6,'Résolution des pointeurs DNS vers le nouveau VPS',0,3),(7,'Développement d\'un accueil pour mon Labo Web',0,2),(8,'Amélioration du responsive',0,1),(9,'Portfolio',0,8),(10,'Formulaire de Contact',0,8),(11,'Roadmap',0,8),(12,'Animations CSS',0,1),(13,'Contact',0,12),(14,'Loader ',0,12),(15,'Logo',0,12),(16,'Formulaire de contact HS.',0,1),(17,'Portfolio à compléter.',0,1),(18,'Remplacement du logo',0,1),(19,'Ajout d\'un loader animé',0,1),(20,'Ajout d\'un bouton permettant de cacher l\'interface et ne voir que les photos de fond.',0,1);
/*!40000 ALTER TABLE `roadmap_tasks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `skills`
--

DROP TABLE IF EXISTS `skills`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `skills` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `file` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`,`file`),
  KEY `fk_skills_files1_idx` (`file`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `skills`
--

LOCK TABLES `skills` WRITE;
/*!40000 ALTER TABLE `skills` DISABLE KEYS */;
INSERT INTO `skills` VALUES (1,'After Effect',12),(2,'AngularJs',13),(3,'Blender',15),(4,'Bootstrap',16),(5,'Cordova',17),(6,'C-Sharp',18),(7,'CSS3',19),(8,'Debian',20),(9,'Flash Pro',22),(10,'Git',23),(11,'Gulp',24),(12,'Html5',25),(13,'Illustrator',26),(14,'InDesign',27),(15,'Ionic',28),(16,'jQuery',29),(17,'JavaScript',30),(18,'MySQL',31),(19,'Pandasuite',32),(20,'Photoshop',33),(21,'PHP',34),(22,'Processing',35),(23,'PureData',36),(24,'Sass',37),(25,'SQLite',38),(26,'Unity',39),(27,'Compass',74),(28,'Spip',0);
/*!40000 ALTER TABLE `skills` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tags`
--

DROP TABLE IF EXISTS `tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tags` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tag` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tags`
--

LOCK TABLES `tags` WRITE;
/*!40000 ALTER TABLE `tags` DISABLE KEYS */;
INSERT INTO `tags` VALUES (1,'Web'),(2,'Graphique'),(3,'Universitaire'),(4,'Projet'),(5,'Personnel'),(6,'Flat'),(7,'One-page'),(8,'MVC'),(9,'Responsive'),(10,'Master CEN'),(11,'DUT MMI'),(12,'LP CDNL'),(13,'Jeu'),(14,'Créatic'),(15,'Hochelaga'),(16,'Template'),(17,'Mobile');
/*!40000 ALTER TABLE `tags` ENABLE KEYS */;
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
