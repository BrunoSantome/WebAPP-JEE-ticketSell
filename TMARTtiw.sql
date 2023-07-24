-- MySQL dump 10.13  Distrib 8.0.22, for macos10.15 (x86_64)
--
-- Host: 127.0.0.1    Database: shoptiw
-- ------------------------------------------------------
-- Server version	8.0.22

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
-- Table structure for table `carrito`
--

DROP TABLE IF EXISTS `carrito`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `carrito` (
  `idUsuario` int NOT NULL,
  `idProd` int NOT NULL,
  PRIMARY KEY (`idUsuario`,`idProd`),
  KEY `fk_carrito_producto_idx` (`idProd`),
  CONSTRAINT `fk_carrito_producto` FOREIGN KEY (`idProd`) REFERENCES `producto` (`idProd`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `fk_carrito_usuario` FOREIGN KEY (`idUsuario`) REFERENCES `usuario` (`idUsuario`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `carrito`
--

LOCK TABLES `carrito` WRITE;
/*!40000 ALTER TABLE `carrito` DISABLE KEYS */;
INSERT INTO `carrito` VALUES (39,22),(24,26),(39,30);
/*!40000 ALTER TABLE `carrito` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detalles_pedido`
--

DROP TABLE IF EXISTS `detalles_pedido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `detalles_pedido` (
  `idPedido` int NOT NULL,
  `idProd` int NOT NULL,
  PRIMARY KEY (`idPedido`,`idProd`),
  KEY `fk_detalles_pedido_producto_idx` (`idProd`),
  CONSTRAINT `fk_detalles_pedido_pedido` FOREIGN KEY (`idPedido`) REFERENCES `pedido` (`idPedido`) ON DELETE CASCADE,
  CONSTRAINT `fk_detalles_pedido_producto` FOREIGN KEY (`idProd`) REFERENCES `producto` (`idProd`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detalles_pedido`
--

LOCK TABLES `detalles_pedido` WRITE;
/*!40000 ALTER TABLE `detalles_pedido` DISABLE KEYS */;
INSERT INTO `detalles_pedido` VALUES (2,23),(1,27),(3,28),(4,29);
/*!40000 ALTER TABLE `detalles_pedido` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pedido`
--

DROP TABLE IF EXISTS `pedido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pedido` (
  `idPedido` int NOT NULL AUTO_INCREMENT,
  `idUsuario` int NOT NULL,
  `pago` varchar(45) NOT NULL,
  `domicilio` varchar(55) NOT NULL,
  `total` double NOT NULL,
  PRIMARY KEY (`idPedido`,`idUsuario`),
  KEY `fk_pedidos_usuario_idx` (`idUsuario`),
  CONSTRAINT `fk_pedidos_usuario` FOREIGN KEY (`idUsuario`) REFERENCES `usuario` (`idUsuario`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedido`
--

LOCK TABLES `pedido` WRITE;
/*!40000 ALTER TABLE `pedido` DISABLE KEYS */;
INSERT INTO `pedido` VALUES (1,28,'8676','calle',9),(2,24,'987','a',9),(3,28,'987','hola',8),(4,28,'98798','holakkkkuuuuuuu',4),(5,24,'908049304','a',9),(6,39,'98798','g',97);
/*!40000 ALTER TABLE `pedido` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `producto`
--

DROP TABLE IF EXISTS `producto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `producto` (
  `idProd` int NOT NULL AUTO_INCREMENT,
  `titulo` varchar(55) NOT NULL,
  `categoria` varchar(50) NOT NULL,
  `descripcion` varchar(5000) NOT NULL,
  `precio` double NOT NULL,
  `idUsuario` int NOT NULL,
  `estado` varchar(45) NOT NULL,
  PRIMARY KEY (`idProd`),
  KEY `fk_producto_usuario_idx` (`idUsuario`),
  CONSTRAINT `fk_producto_usuario` FOREIGN KEY (`idUsuario`) REFERENCES `usuario` (`idUsuario`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `producto`
--

LOCK TABLES `producto` WRITE;
/*!40000 ALTER TABLE `producto` DISABLE KEYS */;
INSERT INTO `producto` VALUES (22,'mesa modernaA','Otros','muy grande',7,28,'Disponible'),(23,'bufanda','Ropa y accesorios','naranja',9,28,'Vendido'),(24,'falda','Muebles','d',90,30,'Vendido'),(25,'abanico','Muebles','a',67,24,'Vendido'),(26,'azul','Muebles','d',9,29,'Disponible'),(27,'naranja','Ropa y accesorios','azulito',9,29,'Vendido'),(28,'s','s','s',8,29,'Vendido'),(29,'w','w','w',4,35,'Vendido'),(30,'ww','Ropa y accesorios','ww',90,28,'Disponible');
/*!40000 ALTER TABLE `producto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuario` (
  `idUsuario` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(55) NOT NULL,
  `apellido1` varchar(45) NOT NULL,
  `apellido2` varchar(35) NOT NULL,
  `email` varchar(55) NOT NULL,
  `password` varchar(55) NOT NULL,
  `ciudad` varchar(55) NOT NULL,
  `isAdmin` int NOT NULL,
  `domicilio` varchar(55) NOT NULL,
  `telefono` varchar(45) NOT NULL,
  PRIMARY KEY (`idUsuario`),
  UNIQUE KEY `email_UNIQUE` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES (24,'lucia','martin','valverde','luciagmail','lucia','madrid',0,'a','98'),(25,'isabel','valverde','gutierrez','isabelgmail','isabel','lima',0,'a','a'),(28,'pilar','martin','valverde','pilargmail','pilar','los',0,'holakkkkuuuuuuu','89008888'),(29,'tamara','t','t','tamaragmail','t','madrid',0,'calle t','89'),(30,'p','p','p','p','p','p',0,'p','p'),(33,'z','z','z','z','z','z',0,'z','z'),(35,'e','e','e','e','e','azul',0,'e','e'),(37,'Administrador','Admin','Admin','adminn','admin','madrid',1,'admin','897'),(39,'gggg','g','g','g','g','g',0,'g','g');
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-11-23 22:21:42
