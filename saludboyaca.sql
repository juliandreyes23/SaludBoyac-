-- MySQL dump 10.13  Distrib 8.0.45, for Win64 (x86_64)
--
-- Host: trolley.proxy.rlwy.net    Database: railway
-- ------------------------------------------------------
-- Server version	9.4.0

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
-- Table structure for table `citas`
--

DROP TABLE IF EXISTS `citas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `citas` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_paciente` int NOT NULL,
  `id_medico` int NOT NULL,
  `id_especialidad` int NOT NULL,
  `fecha_cita` date NOT NULL,
  `hora_cita` time NOT NULL,
  `motivo` varchar(300) DEFAULT NULL,
  `estado` enum('PROGRAMADA','CONFIRMADA','ATENDIDA','CANCELADA') DEFAULT 'PROGRAMADA',
  `observaciones` varchar(500) DEFAULT NULL,
  `fecha_registro` datetime DEFAULT CURRENT_TIMESTAMP,
  `id_registrado_por` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_paciente` (`id_paciente`),
  KEY `id_medico` (`id_medico`),
  KEY `id_especialidad` (`id_especialidad`),
  CONSTRAINT `citas_ibfk_1` FOREIGN KEY (`id_paciente`) REFERENCES `pacientes` (`id`),
  CONSTRAINT `citas_ibfk_2` FOREIGN KEY (`id_medico`) REFERENCES `usuarios` (`id`),
  CONSTRAINT `citas_ibfk_3` FOREIGN KEY (`id_especialidad`) REFERENCES `especialidades` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `citas`
--

LOCK TABLES `citas` WRITE;
/*!40000 ALTER TABLE `citas` DISABLE KEYS */;
INSERT INTO `citas` VALUES (1,1,1,1,'2026-05-15','08:30:00','Control General','PROGRAMADA','Paciente requiere ayuno','2026-05-07 11:17:21',3),(2,2,4,3,'2026-05-15','14:00:00','Consulta Pediátrica','PROGRAMADA','Traer carnet de vacunación','2026-05-07 11:17:21',3),(3,11,1,1,'2026-05-16','09:00:00','Dolor abdominal','PROGRAMADA',NULL,'2026-05-07 11:17:21',6),(4,12,5,2,'2026-05-16','10:00:00','Limpieza dental','PROGRAMADA',NULL,'2026-05-07 11:17:21',6),(5,13,7,1,'2026-05-17','11:00:00','Chequeo rutinario','PROGRAMADA','Paciente nuevo','2026-05-07 11:17:21',3);
/*!40000 ALTER TABLE `citas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `especialidades`
--

DROP TABLE IF EXISTS `especialidades`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `especialidades` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(80) NOT NULL,
  `descripcion` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `especialidades`
--

LOCK TABLES `especialidades` WRITE;
/*!40000 ALTER TABLE `especialidades` DISABLE KEYS */;
INSERT INTO `especialidades` VALUES (1,'Medicina General',NULL),(2,'Odontología',NULL),(3,'Pediatría',NULL),(4,'Ginecología',NULL),(5,'Optometría',NULL),(6,'Cardiología','Cuidado del corazón y sistema circulatorio'),(7,'Dermatología','Tratamiento de la piel y afecciones cutáneas'),(8,'Pediatría Postnatal','Atención especializada para recién nacidos'),(9,'Psicología','Salud mental y bienestar emocional'),(10,'Fisioterapia','Rehabilitación física y muscular');
/*!40000 ALTER TABLE `especialidades` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `horarios`
--

DROP TABLE IF EXISTS `horarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `horarios` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_medico` int NOT NULL,
  `dia_semana` tinyint NOT NULL COMMENT '1=Lun 2=Mar 3=Mié 4=Jue 5=Vie',
  `hora_inicio` time NOT NULL,
  `hora_fin` time NOT NULL,
  `max_citas` int DEFAULT '10',
  PRIMARY KEY (`id`),
  KEY `id_medico` (`id_medico`),
  CONSTRAINT `horarios_ibfk_1` FOREIGN KEY (`id_medico`) REFERENCES `usuarios` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `horarios`
--

LOCK TABLES `horarios` WRITE;
/*!40000 ALTER TABLE `horarios` DISABLE KEYS */;
INSERT INTO `horarios` VALUES (1,1,1,'08:00:00','12:00:00',8),(2,4,2,'14:00:00','18:00:00',10),(3,5,3,'07:00:00','13:00:00',12),(4,1,4,'08:00:00','12:00:00',8),(5,7,5,'09:00:00','15:00:00',10);
/*!40000 ALTER TABLE `horarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `log_accesos`
--

DROP TABLE IF EXISTS `log_accesos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `log_accesos` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_usuario` int DEFAULT NULL,
  `username` varchar(50) DEFAULT NULL,
  `accion` varchar(50) NOT NULL,
  `ip` varchar(45) DEFAULT NULL,
  `resultado` enum('EXITO','FALLO') NOT NULL,
  `fecha` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `log_accesos`
--

LOCK TABLES `log_accesos` WRITE;
/*!40000 ALTER TABLE `log_accesos` DISABLE KEYS */;
INSERT INTO `log_accesos` VALUES (6,1,'cpedraza','LOGIN','192.168.1.15','EXITO','2026-05-07 11:18:19'),(7,2,'msuarez','LOGIN','186.120.33.45','EXITO','2026-05-07 11:18:19'),(8,3,'jbaez','LOGIN','190.15.201.10','EXITO','2026-05-07 11:18:19'),(9,4,'lfernandez','LOGOUT','192.168.1.20','EXITO','2026-05-07 11:18:19'),(10,5,'rgomez','LOGIN','172.16.0.5','EXITO','2026-05-07 11:18:19');
/*!40000 ALTER TABLE `log_accesos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `otp_tokens`
--

DROP TABLE IF EXISTS `otp_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `otp_tokens` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_usuario` int NOT NULL,
  `codigo` varchar(6) NOT NULL,
  `fecha_gen` datetime DEFAULT CURRENT_TIMESTAMP,
  `expira_en` datetime NOT NULL,
  `usado` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `id_usuario` (`id_usuario`),
  CONSTRAINT `otp_tokens_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `otp_tokens`
--

LOCK TABLES `otp_tokens` WRITE;
/*!40000 ALTER TABLE `otp_tokens` DISABLE KEYS */;
INSERT INTO `otp_tokens` VALUES (1,1,'542891','2026-05-07 11:17:22','2026-05-07 11:22:22',0),(2,2,'129034','2026-05-07 11:17:22','2026-05-07 11:22:22',1),(3,3,'882103','2026-05-07 11:17:22','2026-05-07 11:22:22',0),(4,4,'334512','2026-05-07 11:17:22','2026-05-07 11:22:22',0),(5,5,'901223','2026-05-07 11:17:22','2026-05-07 11:22:22',1),(6,1,'665252','2026-05-07 20:14:32','2026-05-07 20:24:32',0),(7,1,'909840','2026-05-07 20:14:34','2026-05-07 20:24:34',1),(8,1,'592050','2026-05-07 20:16:17','2026-05-07 20:26:17',1),(9,1,'638171','2026-05-07 20:17:09','2026-05-07 20:27:09',1),(10,1,'573218','2026-05-07 20:23:32','2026-05-07 20:33:32',1),(11,1,'418759','2026-05-07 20:24:53','2026-05-07 20:34:53',1);
/*!40000 ALTER TABLE `otp_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pacientes`
--

DROP TABLE IF EXISTS `pacientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pacientes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombres` varchar(80) NOT NULL,
  `apellidos` varchar(80) NOT NULL,
  `documento` varchar(20) NOT NULL,
  `fecha_nacimiento` date NOT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `eps` varchar(80) NOT NULL,
  `vereda_barrio` varchar(80) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `documento` (`documento`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pacientes`
--

LOCK TABLES `pacientes` WRITE;
/*!40000 ALTER TABLE `pacientes` DISABLE KEYS */;
INSERT INTO `pacientes` VALUES (1,'Jorge','Morales','1122334455','1984-04-10','3201112233','jorge.morales@gmail.com','Sura','San José'),(2,'Camila','Ruiz','1133445566','1997-09-15','3212223344','camila.ruiz@hotmail.com','Nueva EPS','El Bosque'),(3,'Felipe','Castillo','1144556677','1990-01-22','3223334455','felipe.castillo@gmail.com','Sanitas','Villa María'),(4,'Natalia','Ortega','1155667788','1989-06-30','3234445566','natalia.ortega@yahoo.com','Famisanar','Santa Rosa'),(5,'Ricardo','Vega','1166778899','1993-03-12','3245556677','ricardo.vega@gmail.com','Coomeva','Los Pinos'),(6,'Andrea','Mendoza','1177889900','1998-12-05','3256667788','andrea.mendoza@hotmail.com','Sura','El Jardín'),(7,'Sebastián','Navarro','1188990011','1991-08-18','3267778899','sebastian.navarro@gmail.com','Nueva EPS','San Miguel'),(8,'Valentina','Cruz','1199001122','1995-11-27','3278889900','valentina.cruz@yahoo.com','Sanitas','La Esperanza'),(9,'Daniel','Herrera','1200112233','1987-05-09','3289990011','daniel.herrera@gmail.com','Coosalud','El Porvenir'),(10,'Laura','Silva','1211223344','1999-02-14','3290001122','laura.silva@hotmail.com','Famisanar','Villa del Sol'),(11,'Mateo','Suárez','1122334456','1995-05-12','3101112233','mateo.suarez@gmail.com','Sanitas','Centro'),(12,'Sofia','Paez','1133445577','2000-11-20','3202223344','sofia.paez@hotmail.com','Sura','La Pradera'),(13,'Carlos','Ruiz','1144556688','1988-03-15','3003334455','carlos.ruiz@yahoo.com','Nueva EPS','Bolívar'),(14,'Diana','Luna','1155667799','1992-08-30','3154445566','diana.luna@gmail.com','Compensar','Norte'),(15,'Samuel','Toro','1166778800','1975-01-05','3115556677','samuel.toro@outlook.com','Coosalud','Sauces');
/*!40000 ALTER TABLE `pacientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuarios` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombres` varchar(80) NOT NULL,
  `apellidos` varchar(80) NOT NULL,
  `documento` varchar(20) NOT NULL,
  `email` varchar(100) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `rol` enum('MEDICO','RECEPCIONISTA','ENFERMERO') NOT NULL,
  `especialidad` varchar(80) DEFAULT NULL,
  `lang_preferido` varchar(5) DEFAULT 'es',
  `activo` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `documento` (`documento`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` VALUES (1,'Carlos Ernesto','Pedraza Rondón','1052345678','Juliandreyes23@gmail.com','cpedraza','admin123','MEDICO','Medicina General','es',1),(2,'María Eugenia','Suárez Cely','1052345679','paulavillate241@gmail.com','msuarez','enfermero1','ENFERMERO',NULL,'es',1),(3,'Jorge Hernando','Báez Morales','1052345680','pilivillate0@gmail.com','jbaez','recep123','RECEPCIONISTA',NULL,'es',1),(4,'Lucía','Fernández','1052345681','lfernandez@saludboyaca.gov.co','lfernandez','doc123','MEDICO','Pediatría','es',1),(5,'Roberto','Gómez','1052345682','rgomez@saludboyaca.gov.co','rgomez','doc456','MEDICO','Odontología','es',1),(6,'Ana','Martínez','1052345683','amartinez@saludboyaca.gov.co','amartinez','admin789','RECEPCIONISTA',NULL,'es',1),(7,'Kevin','Castro','1052345684','kcastro@gmail.com','kcastro','pass123','MEDICO','Medicina General','es',1),(8,'Elena','Ríos','1052345685','erios@saludboyaca.gov.co','erios','recep456','RECEPCIONISTA',NULL,'es',1);
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-05-07 17:13:24
