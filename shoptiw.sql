-- MySQL dump 10.13  Distrib 8.0.22, for Win64 (x86_64)
--
-- Host: localhost    Database: shoptiw
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
  KEY `fk_carrito_usuario_idx` (`idUsuario`),
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
INSERT INTO `carrito` VALUES (9,10),(9,17),(10,9);
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
  KEY `fk_detalles_pedido_producto_idx` (`idProd`) /*!80000 INVISIBLE */,
  CONSTRAINT `fk_detalles_pedido_pedido` FOREIGN KEY (`idPedido`) REFERENCES `pedido` (`idPedido`),
  CONSTRAINT `fk_detalles_pedido_producto` FOREIGN KEY (`idProd`) REFERENCES `producto` (`idProd`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detalles_pedido`
--

LOCK TABLES `detalles_pedido` WRITE;
/*!40000 ALTER TABLE `detalles_pedido` DISABLE KEYS */;
INSERT INTO `detalles_pedido` VALUES (55,12),(56,8),(56,15);
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
  PRIMARY KEY (`idPedido`),
  KEY `fk_pedidos_usuario_idx` (`idUsuario`),
  CONSTRAINT `fk_pedidos_usuario` FOREIGN KEY (`idUsuario`) REFERENCES `usuario` (`idUsuario`)
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedido`
--

LOCK TABLES `pedido` WRITE;
/*!40000 ALTER TABLE `pedido` DISABLE KEYS */;
INSERT INTO `pedido` VALUES (55,8,'111111111','rosas',100),(56,9,'22222222','loslosloslos',99);
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
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `producto`
--

LOCK TABLES `producto` WRITE;
/*!40000 ALTER TABLE `producto` DISABLE KEYS */;
INSERT INTO `producto` VALUES (8,'Mesa','Muebles','Mesa de madera barnizada y cuida mola mucho',95,8,'Vendido'),(9,'sombrero','Ropa y accesorios','Sombrero negro antiguo y muy ancho',10,8,'Disponible'),(10,'vestido','Ropa y accesorios','vestido de fiesta color claro y de talla mediana',9,8,'Disponible'),(11,'pantalon','Ropa y accesorios','pantalon vaquero color marino socuro',15.66,9,'Disponible'),(12,'sofa','Muebles','Sofa de segunda mano pero en muy buen estado color marron y verde',100,9,'Vendido'),(13,'camisa','Ropa y accesorios','camisa sin estrenar de color marino oscuro y de media manga perfecta para unos vaqueros',8,9,'Disponible'),(14,'bufanda','Ropa y accesorios','bufanda de plumas larga y de color azul celeste muy suave',22,8,'Disponible'),(15,'camiseta','Ropa y accesorios','Camiseta de color azul perfecta para hacer deporte',4.95,8,'Vendido'),(16,'abrigo','Ropa y accesorios','abrigo de piel suave y calentito perfecto para el invierno talla mediana',50,10,'Disponible'),(17,'casco esqui','Ropa y accesorios','casco de color negro perfecto para esquiar solo usado una vez',60,10,'Disponible'),(18,'falda pantalon','Ropa y accesorios','falda pantalon vintage corta para talla m perfecta para fiestas talla mediana',15,12,'Disponible'),(19,'manton','Ropa y accesorios','manton grande con bordado de color dorado y bufanda gratis',60,12,'Disponible');
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
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES (8,'Tamara','Klopsch','Fernandez','t@g','tamara','Madrid',0,'rosas','123456789'),(9,'Pilar','Martin','Valverde','pilar@','0000','Valencia',0,'loslosloslos','369258147'),(10,'Alexandra','Elena','Bonis','alex@gmail.com','alexandra','paris',0,'dosmildoscientos','456789123'),(11,'Manolo','Sanchez','Garcia','sanchez@g.com','manolo','Roma',1,'serpiente','637892257'),(12,'Maria','Gonzalez','Perez','mariagp@gmail.com','maria','cuenca',0,'calle los pilares','485660024');
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

-- Dump completed on 2020-11-23 23:44:14
