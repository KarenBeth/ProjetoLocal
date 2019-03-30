-- MySQL dump 10.16  Distrib 10.1.38-MariaDB, for Win64 (AMD64)
--
-- Host: 127.0.0.1    Database: mydb
-- ------------------------------------------------------
-- Server version	10.1.38-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `aluno`
--

DROP TABLE IF EXISTS `aluno`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aluno` (
  `aluno_id` int(11) NOT NULL,
  `ra` varchar(45) NOT NULL,
  PRIMARY KEY (`aluno_id`),
  UNIQUE KEY `ra_UNIQUE` (`ra`),
  CONSTRAINT `fk_Aluno_Usuario1` FOREIGN KEY (`aluno_id`) REFERENCES `usuario` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aluno`
--

LOCK TABLES `aluno` WRITE;
/*!40000 ALTER TABLE `aluno` DISABLE KEYS */;
INSERT INTO `aluno` VALUES (6,'806395712'),(4,'80802347'),(5,'808137324'),(2,'81813245'),(1,'818149040'),(3,'818246244'),(11,'844638549'),(10,'846139536'),(12,'857638068'),(13,'986046147');
/*!40000 ALTER TABLE `aluno` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `atividade`
--

DROP TABLE IF EXISTS `atividade`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `atividade` (
  `id` int(11) NOT NULL,
  `tema_id` int(11) NOT NULL,
  `numero` int(11) DEFAULT NULL,
  `descricao` varchar(250) DEFAULT NULL,
  `formato_entrega` varchar(45) DEFAULT NULL,
  `dt_inicio` datetime DEFAULT NULL,
  `dt_fim` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_atividade_tema1_idx` (`tema_id`),
  CONSTRAINT `fk_atividade_tema1` FOREIGN KEY (`tema_id`) REFERENCES `tema` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `atividade`
--

LOCK TABLES `atividade` WRITE;
/*!40000 ALTER TABLE `atividade` DISABLE KEYS */;
INSERT INTO `atividade` VALUES (1,1,1,'Deve ser feito um sistema de cadastro','Presencial','2018-03-01 00:00:00','2018-04-01 00:00:00'),(2,1,2,'Deve ser feito um sistema de login','Presencial ','2018-04-02 00:00:00','2018-05-10 00:00:00'),(3,2,1,'Deve ser eleborado um site','E-mail	','2018-09-08 00:00:00','2018-10-01 00:00:00'),(4,2,2,'Deve se criar um site responsivo utilizado Bootstrap','GitHub','2018-10-05 00:00:00','2018-11-25 00:00:00'),(5,3,1,'Deve ser feito um site que possua sistema de login','Presencial','2019-03-10 00:00:00','2019-03-16 00:00:00'),(6,3,2,'Deve ser feito um sistema de cadastro de professores','GitHub','2019-03-17 00:00:00','2019-03-23 00:00:00'),(7,3,3,'Entrega Banco de Dados','E-mail	','2019-03-24 00:00:00','2019-03-30 00:00:00'),(8,3,4,'Deve ser feito um sistema de verificacao de plagio','GitHub','2019-03-31 00:00:00','2019-04-06 00:00:00'),(9,3,5,'Refatoracao do codigo','Presencial','2019-04-07 00:00:00','2019-04-13 00:00:00'),(10,3,6,'Correcao de erros projeto finalizado','GitHub','2019-04-14 00:00:00','2019-04-20 00:00:00');
/*!40000 ALTER TABLE `atividade` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `avaliacao`
--

DROP TABLE IF EXISTS `avaliacao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `avaliacao` (
  `id` int(11) NOT NULL,
  `entrega_id` int(11) NOT NULL,
  `turma_aluno_id` int(11) NOT NULL,
  `nota` decimal(4,2) DEFAULT NULL,
  `dt_avaliacao` datetime DEFAULT NULL,
  `comentarios` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_Avaliacao_entregas1_idx` (`entrega_id`),
  KEY `fk_Avaliacao_Aluno_has_turma1_idx` (`turma_aluno_id`),
  CONSTRAINT `fk_Avaliacao_Aluno_has_turma1` FOREIGN KEY (`turma_aluno_id`) REFERENCES `turma_aluno` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Avaliacao_entregas1` FOREIGN KEY (`entrega_id`) REFERENCES `entrega` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `avaliacao`
--

LOCK TABLES `avaliacao` WRITE;
/*!40000 ALTER TABLE `avaliacao` DISABLE KEYS */;
/*!40000 ALTER TABLE `avaliacao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `banca`
--

DROP TABLE IF EXISTS `banca`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `banca` (
  `id` int(11) NOT NULL,
  `grupo_id` int(11) NOT NULL,
  `data` datetime DEFAULT NULL,
  `sala` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_banca_grupo1_idx` (`grupo_id`),
  CONSTRAINT `fk_banca_grupo1` FOREIGN KEY (`grupo_id`) REFERENCES `grupo` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `banca`
--

LOCK TABLES `banca` WRITE;
/*!40000 ALTER TABLE `banca` DISABLE KEYS */;
INSERT INTO `banca` VALUES (1,1,'2019-05-20 00:00:00','102A'),(2,2,'2019-06-01 00:00:00','103E');
/*!40000 ALTER TABLE `banca` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `entrega`
--

DROP TABLE IF EXISTS `entrega`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `entrega` (
  `grupo_id` int(11) NOT NULL,
  `atividade_id` int(11) NOT NULL,
  `id` int(11) NOT NULL,
  `dt_cadastro` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `grupo_id_UNIQUE` (`grupo_id`),
  UNIQUE KEY `atividade_id_UNIQUE` (`atividade_id`),
  KEY `fk_grupo_has_entregas_entregas1_idx` (`atividade_id`),
  KEY `fk_grupo_has_entregas_grupo1_idx` (`grupo_id`),
  CONSTRAINT `fk_grupo_has_entregas_entregas1` FOREIGN KEY (`atividade_id`) REFERENCES `atividade` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_grupo_has_entregas_grupo1` FOREIGN KEY (`grupo_id`) REFERENCES `grupo` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `entrega`
--

LOCK TABLES `entrega` WRITE;
/*!40000 ALTER TABLE `entrega` DISABLE KEYS */;
INSERT INTO `entrega` VALUES (1,5,1,'2019-03-15 00:00:00');
/*!40000 ALTER TABLE `entrega` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grupo`
--

DROP TABLE IF EXISTS `grupo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grupo` (
  `id` int(11) NOT NULL,
  `orientador_id` int(11) NOT NULL,
  `numero` int(11) NOT NULL,
  `nome` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_grupo_Professor1_idx` (`orientador_id`),
  CONSTRAINT `fk_grupo_Professor1` FOREIGN KEY (`orientador_id`) REFERENCES `professor` (`professor_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grupo`
--

LOCK TABLES `grupo` WRITE;
/*!40000 ALTER TABLE `grupo` DISABLE KEYS */;
INSERT INTO `grupo` VALUES (1,8,1,'Pedro Quessada'),(2,8,1,'Karen Beth'),(3,8,1,'Arthur Agostinho'),(4,8,1,'Jamal Mirando'),(5,8,1,'Guilherme Bodelon'),(6,9,2,'Gustavo Xinzao'),(7,9,2,'Yara Faria'),(8,9,2,'Jaqueline Pereira'),(9,9,2,'Bruno Nascimento'),(10,9,2,'Paloma Pereira');
/*!40000 ALTER TABLE `grupo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `professor`
--

DROP TABLE IF EXISTS `professor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `professor` (
  `professor_id` int(11) NOT NULL,
  `administrador` int(11) DEFAULT '0',
  `matricula` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`professor_id`),
  UNIQUE KEY `matricula_UNIQUE` (`matricula`),
  KEY `fk_Professor_Usuario_idx` (`professor_id`),
  CONSTRAINT `fk_Professor_Usuario` FOREIGN KEY (`professor_id`) REFERENCES `usuario` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `professor`
--

LOCK TABLES `professor` WRITE;
/*!40000 ALTER TABLE `professor` DISABLE KEYS */;
INSERT INTO `professor` VALUES (7,0,'2019usjt8823'),(8,1,'2005usjt3374'),(9,0,'2000anima8234'),(14,0,'2010anima8364'),(15,1,'2012usjt7356');
/*!40000 ALTER TABLE `professor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `professores_banca`
--

DROP TABLE IF EXISTS `professores_banca`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `professores_banca` (
  `banca_id` int(11) NOT NULL,
  `Professor_id` int(11) NOT NULL,
  `id` int(11) NOT NULL,
  `avaliacao` decimal(4,2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `banca_id_UNIQUE` (`banca_id`),
  UNIQUE KEY `Professor_id_UNIQUE` (`Professor_id`),
  KEY `fk_banca_has_Professor_Professor1_idx` (`Professor_id`),
  KEY `fk_banca_has_Professor_banca1_idx` (`banca_id`),
  CONSTRAINT `fk_banca_has_Professor_Professor1` FOREIGN KEY (`Professor_id`) REFERENCES `professor` (`professor_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_banca_has_Professor_banca1` FOREIGN KEY (`banca_id`) REFERENCES `banca` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `professores_banca`
--

LOCK TABLES `professores_banca` WRITE;
/*!40000 ALTER TABLE `professores_banca` DISABLE KEYS */;
INSERT INTO `professores_banca` VALUES (1,7,1,80.00);
/*!40000 ALTER TABLE `professores_banca` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tema`
--

DROP TABLE IF EXISTS `tema`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tema` (
  `id` int(11) NOT NULL,
  `dt_cadastro` datetime DEFAULT NULL,
  `titulo` varchar(100) NOT NULL,
  `introducao` varchar(250) DEFAULT NULL,
  `requisitos` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tema`
--

LOCK TABLES `tema` WRITE;
/*!40000 ALTER TABLE `tema` DISABLE KEYS */;
INSERT INTO `tema` VALUES (1,'2018-02-15 00:00:00','Java','Introducao a Java Orientado a Objetos','Logica de Programacao'),(2,'2018-08-22 00:00:00','HTML','Introducao a HTML e CSS','Sem conhecimentos necessarios'),(3,'2019-03-02 00:00:00','Java Web','Elaboracao de projeto utilizando Java e HTML','Java e HTML');
/*!40000 ALTER TABLE `tema` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `turma`
--

DROP TABLE IF EXISTS `turma`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `turma` (
  `id` int(11) NOT NULL,
  `semestre_letivo` int(11) NOT NULL,
  `ano_letivo` int(11) NOT NULL,
  `sigla` varchar(45) NOT NULL,
  `tema_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `sigla_UNIQUE` (`sigla`),
  UNIQUE KEY `ano_letivo_UNIQUE` (`ano_letivo`),
  UNIQUE KEY `semestre_letivo_UNIQUE` (`semestre_letivo`),
  KEY `fk_turma_tema1_idx` (`tema_id`),
  CONSTRAINT `fk_turma_tema1` FOREIGN KEY (`tema_id`) REFERENCES `tema` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `turma`
--

LOCK TABLES `turma` WRITE;
/*!40000 ALTER TABLE `turma` DISABLE KEYS */;
INSERT INTO `turma` VALUES (1,1,2019,'SIN-MCA',3),(2,2,2018,'SIN-MCA1',2);
/*!40000 ALTER TABLE `turma` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `turma_aluno`
--

DROP TABLE IF EXISTS `turma_aluno`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `turma_aluno` (
  `Aluno_id` int(11) NOT NULL,
  `turma_id` int(11) NOT NULL,
  `grupo_id` int(11) NOT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`),
  UNIQUE KEY `Aluno_id_UNIQUE` (`Aluno_id`),
  UNIQUE KEY `turma_id_UNIQUE` (`turma_id`),
  KEY `fk_Aluno_has_turma_turma1_idx` (`turma_id`),
  KEY `fk_Aluno_has_turma_Aluno1_idx` (`Aluno_id`),
  KEY `fk_Aluno_has_turma_grupo1_idx` (`grupo_id`),
  CONSTRAINT `fk_Aluno_has_turma_Aluno1` FOREIGN KEY (`Aluno_id`) REFERENCES `aluno` (`aluno_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Aluno_has_turma_grupo1` FOREIGN KEY (`grupo_id`) REFERENCES `grupo` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Aluno_has_turma_turma1` FOREIGN KEY (`turma_id`) REFERENCES `turma` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `turma_aluno`
--

LOCK TABLES `turma_aluno` WRITE;
/*!40000 ALTER TABLE `turma_aluno` DISABLE KEYS */;
/*!40000 ALTER TABLE `turma_aluno` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuario` (
  `id` int(11) NOT NULL,
  `nome` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  `senha` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email_UNIQUE` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES (0,'','',''),(1,'Pedro Quessada','pedro.quessada@usjt.br','aluno123'),(2,'Jamal Miranda','jamal.miranda@gmail.com.br','aluno123'),(3,'Arthur Agostinho','arthur.agostinho@outlook.com','aluno123'),(4,'Karen Beth','karen.beth@hotmail.com','aluno123'),(5,'Gustavo Xinzao','gustavoxinzao@hotmail.com','aluno123'),(6,'Guilherme Bodelon','guigui.bo@usjt.com','aluno123'),(7,'Jose Fonseca ','fonseca.jose@gmai.com','admin123'),(8,'Zezinho da Silva','silva.zeze@hotmail.com','prof123'),(9,'Maria Aparecida','maria.aparecida@outlook.com','prof123'),(10,'Yara Faria','yara.faria@yahoo.com.br','aluno123'),(11,'Jaqueline Pereira','jaque.pereira@gmail.com','aluno123'),(12,'Bruno Nascimento','bruno.nascimento@gmail.com','aluno123'),(13,'Paloma Pereira','paloma.pereira@hotmail.com','aluno123'),(14,'Napoleao','napoleao@usjt.com','prof123'),(15,'Ayrton Sena','seninha@gmail.com','admin123');
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'mydb'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-03-30 17:01:54
