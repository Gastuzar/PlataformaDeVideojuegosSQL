-- MySQL dump 10.13  Distrib 8.0.38, for Win64 (x86_64)
--
-- Host: localhost    Database: plataformavideojuegos
-- ------------------------------------------------------
-- Server version	8.0.39

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
-- Table structure for table `auditoriacambioprecios`
--

DROP TABLE IF EXISTS `auditoriacambioprecios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auditoriacambioprecios` (
  `auditoriaID` int NOT NULL AUTO_INCREMENT,
  `juegoID` int NOT NULL,
  `tituloJuego` varchar(100) DEFAULT NULL,
  `precioAnterior` decimal(10,2) DEFAULT NULL,
  `precioNuevo` decimal(10,2) DEFAULT NULL,
  `fechaCambio` datetime NOT NULL,
  `usuarioResponsable` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`auditoriaID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auditoriacambioprecios`
--

LOCK TABLES `auditoriacambioprecios` WRITE;
/*!40000 ALTER TABLE `auditoriacambioprecios` DISABLE KEYS */;
/*!40000 ALTER TABLE `auditoriacambioprecios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `biblioteca`
--

DROP TABLE IF EXISTS `biblioteca`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `biblioteca` (
  `bibliotecaID` int NOT NULL AUTO_INCREMENT,
  `usuarioID` int NOT NULL,
  `juegoID` int NOT NULL,
  `fecha_de_adicion` date DEFAULT NULL,
  PRIMARY KEY (`bibliotecaID`),
  KEY `usuarioID` (`usuarioID`),
  KEY `juegoID` (`juegoID`),
  CONSTRAINT `biblioteca_ibfk_1` FOREIGN KEY (`usuarioID`) REFERENCES `usuarios` (`usuarioID`),
  CONSTRAINT `biblioteca_ibfk_2` FOREIGN KEY (`juegoID`) REFERENCES `videojuegos` (`juegoID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `biblioteca`
--

LOCK TABLES `biblioteca` WRITE;
/*!40000 ALTER TABLE `biblioteca` DISABLE KEYS */;
INSERT INTO `biblioteca` VALUES (1,1,1,'2023-11-01'),(2,2,2,'2023-11-05'),(3,3,3,'2023-11-10'),(4,4,4,'2023-11-15'),(5,5,5,'2023-11-20');
/*!40000 ALTER TABLE `biblioteca` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bibliotecajuegos`
--

DROP TABLE IF EXISTS `bibliotecajuegos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bibliotecajuegos` (
  `bibliotecaID` int NOT NULL,
  `juegoID` int NOT NULL,
  PRIMARY KEY (`bibliotecaID`,`juegoID`),
  KEY `juegoID` (`juegoID`),
  CONSTRAINT `bibliotecajuegos_ibfk_1` FOREIGN KEY (`bibliotecaID`) REFERENCES `biblioteca` (`bibliotecaID`),
  CONSTRAINT `bibliotecajuegos_ibfk_2` FOREIGN KEY (`juegoID`) REFERENCES `videojuegos` (`juegoID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bibliotecajuegos`
--

LOCK TABLES `bibliotecajuegos` WRITE;
/*!40000 ALTER TABLE `bibliotecajuegos` DISABLE KEYS */;
INSERT INTO `bibliotecajuegos` VALUES (1,1),(2,2),(3,3),(4,4),(5,5);
/*!40000 ALTER TABLE `bibliotecajuegos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `carrito`
--

DROP TABLE IF EXISTS `carrito`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `carrito` (
  `carritoID` int NOT NULL AUTO_INCREMENT,
  `usuarioID` int NOT NULL,
  `juegoID` int NOT NULL,
  `cantidad` int NOT NULL,
  PRIMARY KEY (`carritoID`),
  KEY `usuarioID` (`usuarioID`),
  KEY `juegoID` (`juegoID`),
  CONSTRAINT `carrito_ibfk_1` FOREIGN KEY (`usuarioID`) REFERENCES `usuarios` (`usuarioID`),
  CONSTRAINT `carrito_ibfk_2` FOREIGN KEY (`juegoID`) REFERENCES `videojuegos` (`juegoID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `carrito`
--

LOCK TABLES `carrito` WRITE;
/*!40000 ALTER TABLE `carrito` DISABLE KEYS */;
INSERT INTO `carrito` VALUES (1,1,2,1),(2,2,3,2),(3,3,1,1),(4,4,5,1),(5,5,4,1);
/*!40000 ALTER TABLE `carrito` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `desarrolladores`
--

DROP TABLE IF EXISTS `desarrolladores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `desarrolladores` (
  `desarrolladorID` int NOT NULL AUTO_INCREMENT,
  `nombreDesarrollador` varchar(100) NOT NULL,
  PRIMARY KEY (`desarrolladorID`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `desarrolladores`
--

LOCK TABLES `desarrolladores` WRITE;
/*!40000 ALTER TABLE `desarrolladores` DISABLE KEYS */;
INSERT INTO `desarrolladores` VALUES (1,'Nintendo'),(2,'Sony Interactive Entertainment'),(3,'Electronic Arts'),(4,'Ubisoft'),(5,'Valve'),(6,'Nintendo'),(7,'Sony Interactive Entertainment'),(8,'Electronic Arts'),(9,'Ubisoft'),(10,'Valve');
/*!40000 ALTER TABLE `desarrolladores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `generos`
--

DROP TABLE IF EXISTS `generos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `generos` (
  `generoID` int NOT NULL AUTO_INCREMENT,
  `nombreGenero` varchar(50) NOT NULL,
  PRIMARY KEY (`generoID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `generos`
--

LOCK TABLES `generos` WRITE;
/*!40000 ALTER TABLE `generos` DISABLE KEYS */;
INSERT INTO `generos` VALUES (1,'Aventura'),(2,'Acción'),(3,'Deportes'),(4,'RPG'),(5,'FPS');
/*!40000 ALTER TABLE `generos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `logros`
--

DROP TABLE IF EXISTS `logros`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `logros` (
  `logroID` int NOT NULL AUTO_INCREMENT,
  `juegoID` int NOT NULL,
  `nombreLogro` varchar(100) NOT NULL,
  `descripcion` text,
  PRIMARY KEY (`logroID`),
  KEY `juegoID` (`juegoID`),
  CONSTRAINT `logros_ibfk_1` FOREIGN KEY (`juegoID`) REFERENCES `videojuegos` (`juegoID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `logros`
--

LOCK TABLES `logros` WRITE;
/*!40000 ALTER TABLE `logros` DISABLE KEYS */;
INSERT INTO `logros` VALUES (1,1,'Super Mario Master','Completa el 100% del juego.'),(2,2,'Vengador','Completa la historia principal.'),(3,3,'FIFA Champion','Gana la Copa del Mundo en FIFA 23.'),(4,4,'Viking King','Alcanza el nivel máximo en Assassin’s Creed Valhalla.'),(5,5,'Reality Hero','Supera todas las misiones en Half-Life: Alyx.');
/*!40000 ALTER TABLE `logros` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `plataformas`
--

DROP TABLE IF EXISTS `plataformas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `plataformas` (
  `plataformaID` int NOT NULL AUTO_INCREMENT,
  `nombrePlataforma` varchar(50) NOT NULL,
  PRIMARY KEY (`plataformaID`),
  UNIQUE KEY `nombrePlataforma` (`nombrePlataforma`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plataformas`
--

LOCK TABLES `plataformas` WRITE;
/*!40000 ALTER TABLE `plataformas` DISABLE KEYS */;
INSERT INTO `plataformas` VALUES (3,'Nintendo Switch'),(5,'Oculus VR'),(4,'PC'),(1,'PlayStation 5'),(2,'Xbox Series X');
/*!40000 ALTER TABLE `plataformas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reseñas`
--

DROP TABLE IF EXISTS `reseñas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reseñas` (
  `reseñaID` int NOT NULL AUTO_INCREMENT,
  `usuarioID` int NOT NULL,
  `juegoID` int NOT NULL,
  `calificacion` int NOT NULL,
  `comentario` text,
  PRIMARY KEY (`reseñaID`),
  KEY `usuarioID` (`usuarioID`),
  KEY `juegoID` (`juegoID`),
  CONSTRAINT `reseñas_ibfk_1` FOREIGN KEY (`usuarioID`) REFERENCES `usuarios` (`usuarioID`),
  CONSTRAINT `reseñas_ibfk_2` FOREIGN KEY (`juegoID`) REFERENCES `videojuegos` (`juegoID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reseñas`
--

LOCK TABLES `reseñas` WRITE;
/*!40000 ALTER TABLE `reseñas` DISABLE KEYS */;
INSERT INTO `reseñas` VALUES (1,1,1,5,'Increíble experiencia, uno de los mejores juegos de Mario.'),(2,2,2,4,'Excelente historia, aunque el ritmo del juego fue algo lento.'),(3,3,3,3,'Buen juego, pero me gustaría que tuvieran más modos de juego.'),(4,4,4,5,'Gran mundo abierto, gráficos impresionantes.'),(5,5,5,4,'Un buen juego de realidad virtual, aunque podría tener más contenido.');
/*!40000 ALTER TABLE `reseñas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuarios` (
  `usuarioID` int NOT NULL AUTO_INCREMENT,
  `nombreUsuario` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  PRIMARY KEY (`usuarioID`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` VALUES (1,'GastonZarate','gastonzarate25@gmail.com','password123'),(2,'JulianZarate','julianzarate@gmail.com','password123'),(3,'CarlosDiaz','carlos.diaz@gmail.com','password123'),(4,'AnaGarcia','ana.garcia@gmail.com','password123'),(5,'CandeActis','Candeactis@gmail.com','password123');
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarioslogros`
--

DROP TABLE IF EXISTS `usuarioslogros`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuarioslogros` (
  `usuarioID` int NOT NULL,
  `logroID` int NOT NULL,
  `fechaDesbloqueo` date NOT NULL,
  PRIMARY KEY (`usuarioID`,`logroID`),
  KEY `logroID` (`logroID`),
  CONSTRAINT `usuarioslogros_ibfk_1` FOREIGN KEY (`usuarioID`) REFERENCES `usuarios` (`usuarioID`),
  CONSTRAINT `usuarioslogros_ibfk_2` FOREIGN KEY (`logroID`) REFERENCES `logros` (`logroID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarioslogros`
--

LOCK TABLES `usuarioslogros` WRITE;
/*!40000 ALTER TABLE `usuarioslogros` DISABLE KEYS */;
INSERT INTO `usuarioslogros` VALUES (1,1,'2023-12-01'),(2,2,'2023-12-05'),(3,3,'2023-12-10'),(4,4,'2023-12-15'),(5,5,'2023-12-20');
/*!40000 ALTER TABLE `usuarioslogros` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ventas`
--

DROP TABLE IF EXISTS `ventas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ventas` (
  `ventasID` int NOT NULL AUTO_INCREMENT,
  `usuarioID` int NOT NULL,
  `juegoID` int NOT NULL,
  `fechaCompra` date NOT NULL,
  `precioCompra` decimal(10,2) NOT NULL,
  `tipo_de_pago` enum('DEBITO','CRYPTOMONEDA','CREDITO') NOT NULL,
  PRIMARY KEY (`ventasID`),
  KEY `usuarioID` (`usuarioID`),
  KEY `juegoID` (`juegoID`),
  CONSTRAINT `ventas_ibfk_1` FOREIGN KEY (`usuarioID`) REFERENCES `usuarios` (`usuarioID`),
  CONSTRAINT `ventas_ibfk_2` FOREIGN KEY (`juegoID`) REFERENCES `videojuegos` (`juegoID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ventas`
--

LOCK TABLES `ventas` WRITE;
/*!40000 ALTER TABLE `ventas` DISABLE KEYS */;
INSERT INTO `ventas` VALUES (1,1,1,'2023-12-15',59.99,'CREDITO'),(2,2,2,'2023-12-10',69.99,'CRYPTOMONEDA'),(3,3,3,'2023-12-12',44.99,'DEBITO');
/*!40000 ALTER TABLE `ventas` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `ajustar_precio_venta` BEFORE INSERT ON `ventas` FOR EACH ROW BEGIN
    IF NEW.tipo_de_pago = 'CRYPTOMONEDA' THEN
        SET NEW.precioCompra = NEW.precioCompra * 0.9;
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `ventasjuegos`
--

DROP TABLE IF EXISTS `ventasjuegos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ventasjuegos` (
  `ventasID` int NOT NULL,
  `juegoID` int NOT NULL,
  PRIMARY KEY (`ventasID`,`juegoID`),
  KEY `juegoID` (`juegoID`),
  CONSTRAINT `ventasjuegos_ibfk_1` FOREIGN KEY (`ventasID`) REFERENCES `ventas` (`ventasID`),
  CONSTRAINT `ventasjuegos_ibfk_2` FOREIGN KEY (`juegoID`) REFERENCES `videojuegos` (`juegoID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ventasjuegos`
--

LOCK TABLES `ventasjuegos` WRITE;
/*!40000 ALTER TABLE `ventasjuegos` DISABLE KEYS */;
INSERT INTO `ventasjuegos` VALUES (1,1),(2,2),(3,3);
/*!40000 ALTER TABLE `ventasjuegos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `videojuegos`
--

DROP TABLE IF EXISTS `videojuegos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `videojuegos` (
  `juegoID` int NOT NULL AUTO_INCREMENT,
  `titulo` varchar(100) NOT NULL,
  `desarrolladorID` int NOT NULL,
  `fechaLanzamiento` date DEFAULT NULL,
  `precio` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`juegoID`),
  KEY `desarrolladorID` (`desarrolladorID`),
  CONSTRAINT `videojuegos_ibfk_1` FOREIGN KEY (`desarrolladorID`) REFERENCES `desarrolladores` (`desarrolladorID`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `videojuegos`
--

LOCK TABLES `videojuegos` WRITE;
/*!40000 ALTER TABLE `videojuegos` DISABLE KEYS */;
INSERT INTO `videojuegos` VALUES (1,'Super Mario Odyssey',1,'2017-10-27',59.99),(2,'The Last of Us Part II',2,'2020-06-19',69.99),(3,'FIFA 23',3,'2022-09-30',49.99),(4,'Assassin’s Creed Valhalla',4,'2020-11-10',39.99),(5,'Half-Life: Alyx',5,'2020-03-23',29.99),(6,'Super Mario Odyssey',1,'2017-10-27',59.99),(7,'The Last of Us Part II',2,'2020-06-19',69.99),(8,'FIFA 23',3,'2022-09-30',49.99),(9,'Assassin’s Creed Valhalla',4,'2020-11-10',39.99),(10,'Half-Life: Alyx',5,'2020-03-23',29.99);
/*!40000 ALTER TABLE `videojuegos` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `registrar_cambio_precio` BEFORE UPDATE ON `videojuegos` FOR EACH ROW BEGIN
    -- Verificar si el precio ha cambiado
    IF OLD.precio <> NEW.precio THEN
        INSERT INTO AuditoriaCambioPrecios (
            juegoID, 
            tituloJuego, 
            precioAnterior, 
            precioNuevo, 
            fechaCambio, 
            usuarioResponsable
        )
        VALUES (
            OLD.juegoID, 
            OLD.titulo, 
            OLD.precio, 
            NEW.precio, 
            NOW(), 
            'Gaston' 
        );
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `videojuegosgeneros`
--

DROP TABLE IF EXISTS `videojuegosgeneros`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `videojuegosgeneros` (
  `generoID` int NOT NULL,
  `juegoID` int NOT NULL,
  PRIMARY KEY (`generoID`,`juegoID`),
  KEY `juegoID` (`juegoID`),
  CONSTRAINT `videojuegosgeneros_ibfk_1` FOREIGN KEY (`generoID`) REFERENCES `generos` (`generoID`),
  CONSTRAINT `videojuegosgeneros_ibfk_2` FOREIGN KEY (`juegoID`) REFERENCES `videojuegos` (`juegoID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `videojuegosgeneros`
--

LOCK TABLES `videojuegosgeneros` WRITE;
/*!40000 ALTER TABLE `videojuegosgeneros` DISABLE KEYS */;
INSERT INTO `videojuegosgeneros` VALUES (1,1),(2,2),(3,3),(4,4),(5,5);
/*!40000 ALTER TABLE `videojuegosgeneros` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `videojuegosplataformas`
--

DROP TABLE IF EXISTS `videojuegosplataformas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `videojuegosplataformas` (
  `plataformaID` int NOT NULL,
  `juegoID` int NOT NULL,
  PRIMARY KEY (`plataformaID`,`juegoID`),
  KEY `juegoID` (`juegoID`),
  CONSTRAINT `videojuegosplataformas_ibfk_1` FOREIGN KEY (`plataformaID`) REFERENCES `plataformas` (`plataformaID`),
  CONSTRAINT `videojuegosplataformas_ibfk_2` FOREIGN KEY (`juegoID`) REFERENCES `videojuegos` (`juegoID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `videojuegosplataformas`
--

LOCK TABLES `videojuegosplataformas` WRITE;
/*!40000 ALTER TABLE `videojuegosplataformas` DISABLE KEYS */;
INSERT INTO `videojuegosplataformas` VALUES (1,1),(2,2),(3,3),(4,4),(5,5);
/*!40000 ALTER TABLE `videojuegosplataformas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `vista_biblioteca_usuarios`
--

DROP TABLE IF EXISTS `vista_biblioteca_usuarios`;
/*!50001 DROP VIEW IF EXISTS `vista_biblioteca_usuarios`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vista_biblioteca_usuarios` AS SELECT 
 1 AS `usuarioID`,
 1 AS `nombreUsuario`,
 1 AS `juegoID`,
 1 AS `tituloJuego`,
 1 AS `fecha_de_adicion`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vista_mejores_videojuegos`
--

DROP TABLE IF EXISTS `vista_mejores_videojuegos`;
/*!50001 DROP VIEW IF EXISTS `vista_mejores_videojuegos`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vista_mejores_videojuegos` AS SELECT 
 1 AS `juegoID`,
 1 AS `tituloJuego`,
 1 AS `calificacionPromedio`,
 1 AS `totalReseñas`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vista_resumen_ventas`
--

DROP TABLE IF EXISTS `vista_resumen_ventas`;
/*!50001 DROP VIEW IF EXISTS `vista_resumen_ventas`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vista_resumen_ventas` AS SELECT 
 1 AS `juegoID`,
 1 AS `tituloJuego`,
 1 AS `totalVentas`,
 1 AS `ingresosTotales`,
 1 AS `precioPromedio`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vista_usuarios_compras`
--

DROP TABLE IF EXISTS `vista_usuarios_compras`;
/*!50001 DROP VIEW IF EXISTS `vista_usuarios_compras`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vista_usuarios_compras` AS SELECT 
 1 AS `usuarioID`,
 1 AS `nombreUsuario`,
 1 AS `juegoID`,
 1 AS `tituloJuego`,
 1 AS `fechaCompra`,
 1 AS `precioCompra`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vista_ventas_tipo_pago`
--

DROP TABLE IF EXISTS `vista_ventas_tipo_pago`;
/*!50001 DROP VIEW IF EXISTS `vista_ventas_tipo_pago`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vista_ventas_tipo_pago` AS SELECT 
 1 AS `tipo_de_pago`,
 1 AS `totalVentas`,
 1 AS `ingresosTotales`,
 1 AS `precioPromedio`*/;
SET character_set_client = @saved_cs_client;

--
-- Dumping events for database 'plataformavideojuegos'
--

--
-- Dumping routines for database 'plataformavideojuegos'
--
/*!50003 DROP FUNCTION IF EXISTS `calcular_ingreso_total_usuario` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `calcular_ingreso_total_usuario`(usuarioIDParam INT) RETURNS decimal(10,2)
    DETERMINISTIC
BEGIN
    DECLARE ingreso_total DECIMAL(10, 2);
    SELECT SUM(precioCompra) INTO ingreso_total
    FROM Ventas
    WHERE usuarioID = usuarioIDParam;
    RETURN IFNULL(ingreso_total, 0);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `total_juegos_biblioteca_usuario` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `total_juegos_biblioteca_usuario`(usuarioIDParam INT) RETURNS int
    DETERMINISTIC
BEGIN
    DECLARE totalJuegos INT;
    SELECT COUNT(*) INTO totalJuegos
    FROM Biblioteca
    WHERE usuarioID = usuarioIDParam;
    RETURN totalJuegos;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `agregar_juego_a_biblioteca` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `agregar_juego_a_biblioteca`(
    IN p_usuarioID INT,
    IN p_juegoID INT
)
BEGIN
    -- Verificar si el juego ya está en la biblioteca
    IF NOT EXISTS (
        SELECT 1 
        FROM Biblioteca 
        WHERE usuarioID = p_usuarioID AND juegoID = p_juegoID
    ) THEN
        -- Agregar el juego a la biblioteca
        INSERT INTO Biblioteca (usuarioID, juegoID, fecha_de_adicion)
        VALUES (p_usuarioID, p_juegoID, CURDATE());
    ELSE
        -- Error: el juego ya está en la biblioteca
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'El juego ya está en la biblioteca del usuario';
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `registrar_nueva_venta` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `registrar_nueva_venta`(
    IN p_usuarioID INT, 
    IN p_juegoID INT, 
    IN p_precioCompra DECIMAL(10, 2), 
    IN p_tipoPago ENUM('DEBITO', 'CRYPTOMONEDA', 'CREDITO')
)
BEGIN
    INSERT INTO Ventas (usuarioID, juegoID, fechaCompra, precioCompra, tipo_de_pago)
    VALUES (p_usuarioID, p_juegoID, CURDATE(), p_precioCompra, p_tipoPago);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `vista_biblioteca_usuarios`
--

/*!50001 DROP VIEW IF EXISTS `vista_biblioteca_usuarios`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vista_biblioteca_usuarios` AS select `u`.`usuarioID` AS `usuarioID`,`u`.`nombreUsuario` AS `nombreUsuario`,`b`.`juegoID` AS `juegoID`,`j`.`titulo` AS `tituloJuego`,`b`.`fecha_de_adicion` AS `fecha_de_adicion` from ((`usuarios` `u` join `biblioteca` `b` on((`u`.`usuarioID` = `b`.`usuarioID`))) join `videojuegos` `j` on((`b`.`juegoID` = `j`.`juegoID`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vista_mejores_videojuegos`
--

/*!50001 DROP VIEW IF EXISTS `vista_mejores_videojuegos`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vista_mejores_videojuegos` AS select `j`.`juegoID` AS `juegoID`,`j`.`titulo` AS `tituloJuego`,avg(`r`.`calificacion`) AS `calificacionPromedio`,count(`r`.`reseñaID`) AS `totalReseñas` from (`videojuegos` `j` join `reseñas` `r` on((`j`.`juegoID` = `r`.`juegoID`))) group by `j`.`juegoID`,`j`.`titulo` order by `calificacionPromedio` desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vista_resumen_ventas`
--

/*!50001 DROP VIEW IF EXISTS `vista_resumen_ventas`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vista_resumen_ventas` AS select `j`.`juegoID` AS `juegoID`,`j`.`titulo` AS `tituloJuego`,count(`v`.`ventasID`) AS `totalVentas`,sum(`v`.`precioCompra`) AS `ingresosTotales`,avg(`v`.`precioCompra`) AS `precioPromedio` from (`ventas` `v` join `videojuegos` `j` on((`v`.`juegoID` = `j`.`juegoID`))) group by `j`.`juegoID`,`j`.`titulo` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vista_usuarios_compras`
--

/*!50001 DROP VIEW IF EXISTS `vista_usuarios_compras`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vista_usuarios_compras` AS select `u`.`usuarioID` AS `usuarioID`,`u`.`nombreUsuario` AS `nombreUsuario`,`v`.`juegoID` AS `juegoID`,`j`.`titulo` AS `tituloJuego`,`v`.`fechaCompra` AS `fechaCompra`,`v`.`precioCompra` AS `precioCompra` from ((`usuarios` `u` join `ventas` `v` on((`u`.`usuarioID` = `v`.`usuarioID`))) join `videojuegos` `j` on((`v`.`juegoID` = `j`.`juegoID`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vista_ventas_tipo_pago`
--

/*!50001 DROP VIEW IF EXISTS `vista_ventas_tipo_pago`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vista_ventas_tipo_pago` AS select `v`.`tipo_de_pago` AS `tipo_de_pago`,count(`v`.`ventasID`) AS `totalVentas`,sum(`v`.`precioCompra`) AS `ingresosTotales`,avg(`v`.`precioCompra`) AS `precioPromedio` from `ventas` `v` group by `v`.`tipo_de_pago` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-01-31  0:24:10
