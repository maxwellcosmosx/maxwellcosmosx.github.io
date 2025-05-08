/*M!999999\- enable the sandbox mode */ 
-- MariaDB dump 10.19-11.7.2-MariaDB, for Linux (x86_64)
--
-- Host: localhost    Database: language
-- ------------------------------------------------------
-- Server version	11.7.2-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*M!100616 SET @OLD_NOTE_VERBOSITY=@@NOTE_VERBOSITY, NOTE_VERBOSITY=0 */;

--
-- Table structure for table `collocations`
--

DROP TABLE IF EXISTS `collocations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `collocations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `item` varchar(80) NOT NULL,
  `example` varchar(100) NOT NULL,
  `explanation` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `item` (`item`,`example`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `collocations`
--

LOCK TABLES `collocations` WRITE;
/*!40000 ALTER TABLE `collocations` DISABLE KEYS */;
INSERT INTO `collocations` VALUES (1,'aggravate sth.','Air pollution may aggravate a child\'s asthma.','恶化');
INSERT INTO `collocations` VALUES (2,'agonize over sth.','All the way home she agonized over what she should do.','纠结于 痛苦思考');
INSERT INTO `collocations` VALUES (3,'anyway','','无论如何');
INSERT INTO `collocations` VALUES (4,'assail so.','','攻击');
INSERT INTO `collocations` VALUES (5,'at the checkout','','在结账台');
INSERT INTO `collocations` VALUES (6,'authorize so. to vp.','','授权..去..');
INSERT INTO `collocations` VALUES (7,'authorize sth.','','批准 许可');
INSERT INTO `collocations` VALUES (8,'avert one\'s gaze','','移开自己的视线');
INSERT INTO `collocations` VALUES (9,'avert sth.','','避免');
INSERT INTO `collocations` VALUES (10,'be a breath of fresh air','Her arrival at the office <c>was a breath of fresh air</c>.','新鲜空气<br>#比喻新事物#');
INSERT INTO `collocations` VALUES (11,'be approaching zero','The probability of success <c>is approaching zero</c>.','趋近于0');
INSERT INTO `collocations` VALUES (12,'be down to earth','Despite his fame, he remains <c>very down to earth</c>.','务实 不做作');
INSERT INTO `collocations` VALUES (13,'be eager for sth.','He <c>was eager for</c> a promotion at work.','渴望得到');
INSERT INTO `collocations` VALUES (14,'be eager to vp.','The children <c>were eager to</c> open their Christmas presents.','渴望');
INSERT INTO `collocations` VALUES (15,'be in conflict with so.','He <c>was in conflict with</c> his boss over the project.','争吵');
INSERT INTO `collocations` VALUES (16,'be keen on n.','She <c>is keen on</c> photography.','热衷于');
INSERT INTO `collocations` VALUES (17,'conform to sth.','','顺应..');
INSERT INTO `collocations` VALUES (18,'curb sth.','The government wants to <c>curb</c> inflation.','抑制..');
INSERT INTO `collocations` VALUES (19,'dissent from sth.','','反对');
INSERT INTO `collocations` VALUES (20,'exacerbate','Their speeches <c>exacerbated</c> the problem.','恶化');
INSERT INTO `collocations` VALUES (21,'exploit sth. to vp.','The hackers <c>exploited a software vulnerability to</c> access the system.','利用..干坏事');
INSERT INTO `collocations` VALUES (22,'invoke sth.','The program <c>invokes</c> a subroutine to process the data.','调用 引用');
INSERT INTO `collocations` VALUES (23,'preclude so. from vp_ger.','The safety measures <c>preclude visitors from</c> entering the restricted area.','阻止某人做');
INSERT INTO `collocations` VALUES (24,'reach a consensus','','达成共识');
INSERT INTO `collocations` VALUES (25,'smoke crack','Stop <c>smoking crack</c>.','吸食可卡因');
INSERT INTO `collocations` VALUES (26,'spaz out','He <c>spazzed out</c> when his team loapt.','发癫');
INSERT INTO `collocations` VALUES (27,'stand with arms akimbo','','叉腰站');
INSERT INTO `collocations` VALUES (28,'stave off sth.','','阻止 避免');
INSERT INTO `collocations` VALUES (29,'take sth. in stride','As a public figure, you need to learn to <c>take insults in stride</c>.','从容面对..');
INSERT INTO `collocations` VALUES (30,'talk smack','He loves to <c>talk smack</c> but can\'t back it up.','讲垃圾话 挑衅');
INSERT INTO `collocations` VALUES (31,'tend to zero','As the experiment progresses, the error <c>tends to zero</c>.','趋近于0');
INSERT INTO `collocations` VALUES (32,'unwind','A hot bath helps me <c>unwind</c> and forget my worries.','放空 放松');
INSERT INTO `collocations` VALUES (33,'waver between n. and n.','He wavered between accepting the job or staying in school.','动摇 犹豫');
INSERT INTO `collocations` VALUES (34,'with the exception of sth.','<c>With the exception of</c> Elon, they are all on the left.','除了');
INSERT INTO `collocations` VALUES (35,'with the expectation that nc.','The first step was to abolish the agency, <c>with the expectation that</c> competitive markets would','为了');
INSERT INTO `collocations` VALUES (36,'with the intention of vp_ger.','She acted <c>with the intention of</c> helping him.','带有明确目的');
INSERT INTO `collocations` VALUES (37,'wrap it up','Alright, let\'s <c>wrap it up</c>. Someone\'s snoring in the back.','赶快结束');
INSERT INTO `collocations` VALUES (38,'wrap one\'s head around sth.','I can\'t <c>wrap my head around</c> quantum physics.','理解');
INSERT INTO `collocations` VALUES (39,'you\'re more than welcome to vp.','<c>You\'re more than welcome to</c> leave.','你可以随意..');
/*!40000 ALTER TABLE `collocations` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*M!100616 SET NOTE_VERBOSITY=@OLD_NOTE_VERBOSITY */;

-- Dump completed on 2025-05-08 21:00:42
