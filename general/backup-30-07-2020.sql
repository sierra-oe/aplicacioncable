-- MariaDB dump 10.17  Distrib 10.4.13-MariaDB, for Linux (x86_64)
--
-- Host: localhost    Database: controlServicios
-- ------------------------------------------------------
-- Server version	10.4.13-MariaDB

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
-- Current Database: `controlServicios`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `controlServicios` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci */;

USE `controlServicios`;

--
-- Table structure for table `clientes`
--

DROP TABLE IF EXISTS `clientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `clientes` (
  `idcliente` int(11) NOT NULL AUTO_INCREMENT,
  `correlativo` varchar(5) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `primernombre` varchar(75) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `segundonombre` varchar(75) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `primerapelldio` varchar(75) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `segundoapellido` varchar(75) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `direccion` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dpi` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `referencias` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `telefono1` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `telefono2` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nit` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nombrezona` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mail` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`idcliente`),
  KEY `fk_clientes_zona1_idx` (`nombrezona`),
  CONSTRAINT `fk_clientes_zona1` FOREIGN KEY (`nombrezona`) REFERENCES `zona` (`nombrezona`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clientes`
--

LOCK TABLES `clientes` WRITE;
/*!40000 ALTER TABLE `clientes` DISABLE KEYS */;
INSERT INTO `clientes` VALUES (1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0',NULL),(2,'1','Oliver ','e','Sierra ','p','hola mundito mundito','1','adsf asdf asdf asd','234234234','234','1','Barrio cenizal',''),(3,'2','maria','r','morales','c','ciudad','2','hola mundo','555','55','2','Barrio cenizal',''),(4,'3','3','3','3','3','333','3','3','3','3','3','barrio garibaldi',NULL),(5,'a','a','a','aa','a','a','a','','','','a','Barrio cenizal',NULL),(6,'32','Juan francisco ',NULL,'Rios López',NULL,'dirección ','2323','referencias','77562','','334','Barrio las flores','');
/*!40000 ALTER TABLE `clientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cobropormes`
--

DROP TABLE IF EXISTS `cobropormes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cobropormes` (
  `cobrosmes` varchar(7) COLLATE utf8mb4_unicode_ci NOT NULL,
  `generado` tinyint(4) DEFAULT 1,
  `fechagenerado` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT 'now()',
  PRIMARY KEY (`cobrosmes`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cobropormes`
--

LOCK TABLES `cobropormes` WRITE;
/*!40000 ALTER TABLE `cobropormes` DISABLE KEYS */;
INSERT INTO `cobropormes` VALUES ('2020-6',1,'now()');
/*!40000 ALTER TABLE `cobropormes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cobros`
--

DROP TABLE IF EXISTS `cobros`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cobros` (
  `idcobro` int(11) NOT NULL AUTO_INCREMENT,
  `numerofactura` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `idempleado` int(11) NOT NULL,
  `fecha` date DEFAULT NULL,
  `totalcobrado` double DEFAULT NULL,
  `idservicioscontratados` int(11) NOT NULL,
  `tipo` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `factura` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `contrasenya` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `zona` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `anyomes` varchar(7) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mesespagados` int(11) DEFAULT NULL,
  `totalporcobrar` double DEFAULT NULL,
  `mesesporcobrar` int(11) DEFAULT NULL,
  `lote_idlote` int(11) DEFAULT NULL,
  `mesesporcobrardet` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `idcliente` int(11) NOT NULL,
  `mesespagadosdet` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`idcobro`),
  KEY `fk_cobros_empleados1_idx` (`idempleado`) USING BTREE,
  KEY `fecha` (`fecha`) USING BTREE,
  KEY `fk_cobros_servicioscontratados1_idx` (`idservicioscontratados`),
  KEY `fk_cobros_lote1` (`lote_idlote`),
  KEY `fk_cobros_clientes1` (`idcliente`),
  CONSTRAINT `fk_cobros_clientes1` FOREIGN KEY (`idcliente`) REFERENCES `clientes` (`idcliente`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_cobros_empleados1` FOREIGN KEY (`idempleado`) REFERENCES `empleados` (`idempleado`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_cobros_lote1` FOREIGN KEY (`lote_idlote`) REFERENCES `lote` (`idlote`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_cobros_servicioscontratados1` FOREIGN KEY (`idservicioscontratados`) REFERENCES `servicioscontratados` (`idservicioscontratados`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=103 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cobros`
--

LOCK TABLES `cobros` WRITE;
/*!40000 ALTER TABLE `cobros` DISABLE KEYS */;
INSERT INTO `cobros` VALUES (99,NULL,1,NULL,0,14,NULL,'','','Barrio cenizal','2020-6',0,300,2,NULL,'Mayo, Junio',2,''),(100,NULL,1,NULL,0,14,NULL,'','','Barrio cenizal','2020-6',0,450,3,NULL,'Abril, Mayo, Junio',2,''),(101,NULL,1,NULL,0,15,NULL,'','','Barrio las flores','2020-6',0,900,3,NULL,'Abril, Mayo, Junio',6,''),(102,NULL,1,'2020-07-26',900,15,NULL,'12','12','Barrio las flores','2020-6',3,300,3,NULL,'Abril, Mayo, Junio',6,'Abril, Mayo, Junio');
/*!40000 ALTER TABLE `cobros` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `empleados`
--

DROP TABLE IF EXISTS `empleados`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `empleados` (
  `idempleado` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `apellido` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `telefono` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `direccion` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `puestos_idpuestos` int(11) NOT NULL,
  PRIMARY KEY (`idempleado`),
  KEY `fk_empleados_puestos_idx` (`puestos_idpuestos`),
  CONSTRAINT `fk_empleados_puestos` FOREIGN KEY (`puestos_idpuestos`) REFERENCES `puesto` (`idpuestos`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empleados`
--

LOCK TABLES `empleados` WRITE;
/*!40000 ALTER TABLE `empleados` DISABLE KEYS */;
INSERT INTO `empleados` VALUES (1,'empleado 1','empleado 1','telefono','direccion',1);
/*!40000 ALTER TABLE `empleados` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estado`
--

DROP TABLE IF EXISTS `estado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `estado` (
  `nombre` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `descripcion` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nivelautorizacion` int(11) DEFAULT NULL,
  PRIMARY KEY (`nombre`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estado`
--

LOCK TABLES `estado` WRITE;
/*!40000 ALTER TABLE `estado` DISABLE KEYS */;
INSERT INTO `estado` VALUES ('Activo','Contratos activos ',0),('Finalizado','Contrato Finalizado',0),('Moroso','Contratos morosos ',0),('Suspendido','Contratos Suspendidos ',0);
/*!40000 ALTER TABLE `estado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lote`
--

DROP TABLE IF EXISTS `lote`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lote` (
  `idlote` int(11) NOT NULL AUTO_INCREMENT,
  `fecha` datetime DEFAULT current_timestamp(),
  `totalcobrado` double DEFAULT NULL,
  `anyomes` varchar(7) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `zona` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`idlote`)
) ENGINE=InnoDB AUTO_INCREMENT=75 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lote`
--

LOCK TABLES `lote` WRITE;
/*!40000 ALTER TABLE `lote` DISABLE KEYS */;
/*!40000 ALTER TABLE `lote` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `puesto`
--

DROP TABLE IF EXISTS `puesto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `puesto` (
  `idpuestos` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(75) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `descripcion` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nivel` int(11) DEFAULT NULL,
  PRIMARY KEY (`idpuestos`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `puesto`
--

LOCK TABLES `puesto` WRITE;
/*!40000 ALTER TABLE `puesto` DISABLE KEYS */;
INSERT INTO `puesto` VALUES (1,'puesto 1','hola mundo ',10);
/*!40000 ALTER TABLE `puesto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `servicios`
--

DROP TABLE IF EXISTS `servicios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `servicios` (
  `idservicio` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tarifa` double DEFAULT NULL,
  `descripcion` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tiposervicio` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `disponible` tinyint(4) DEFAULT 1,
  PRIMARY KEY (`idservicio`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `servicios`
--

LOCK TABLES `servicios` WRITE;
/*!40000 ALTER TABLE `servicios` DISABLE KEYS */;
INSERT INTO `servicios` VALUES (1,'internet 3mb',150,'hola mundo','Internet',1),(2,'telefno ilimitado',300,'hola mundo ','Teléfono',1),(3,'Telefono ilimitado, nternet 3mb y cable 150 canales',355,'hola mundo ','Teléfono, internet y Cable',1);
/*!40000 ALTER TABLE `servicios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `servicioscontratados`
--

DROP TABLE IF EXISTS `servicioscontratados`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `servicioscontratados` (
  `mesesnopagados` int(11) DEFAULT 0,
  `subtotal` double DEFAULT 0,
  `idcliente` int(11) NOT NULL,
  `idservicio` int(11) NOT NULL,
  `contratonumero` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cobropactado` double DEFAULT NULL,
  `duracioncontrato` int(11) DEFAULT NULL,
  `fechainicio` date DEFAULT NULL,
  `idservicioscontratados` int(11) NOT NULL AUTO_INCREMENT,
  `corte` varchar(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nombreestado` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nombrezona` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `detmesesporpagar` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fechasuspension` date DEFAULT NULL,
  `fechareconexion` date DEFAULT NULL,
  `descripcionreconexion` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `descripcionsuspension` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cobroreconexion` double DEFAULT NULL,
  PRIMARY KEY (`idservicioscontratados`),
  KEY `fk_servicioscontratados_clientes1_idx` (`idcliente`),
  KEY `fk_servicioscontratados_servicios1_idx` (`idservicio`),
  KEY `fk_servicioscontratados_estado1_idx` (`nombreestado`),
  CONSTRAINT `fk_servicioscontratados_clientes1` FOREIGN KEY (`idcliente`) REFERENCES `clientes` (`idcliente`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_servicioscontratados_estado1` FOREIGN KEY (`nombreestado`) REFERENCES `estado` (`nombre`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_servicioscontratados_servicios1` FOREIGN KEY (`idservicio`) REFERENCES `servicios` (`idservicio`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `servicioscontratados`
--

LOCK TABLES `servicioscontratados` WRITE;
/*!40000 ALTER TABLE `servicioscontratados` DISABLE KEYS */;
INSERT INTO `servicioscontratados` VALUES (3,0,2,1,'12',150,1,'2020-07-26',14,NULL,'Moroso','Barrio cenizal','Abril, Mayo, Junio','2020-07-26',NULL,'','suspendido por no pagar',NULL),(3,0,6,2,'12',300,2,'2020-07-26',15,NULL,'Suspendido','Barrio las flores','Abril, Mayo, Junio','2020-07-01','2020-07-26','Reconectado pago completo','suspendido por no pagar',580);
/*!40000 ALTER TABLE `servicioscontratados` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `auth_key` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `permiso` int(11) DEFAULT NULL,
  `password_hash` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password_reset_token` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` int(6) NOT NULL DEFAULT 10,
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL,
  `empleados_idempleado` int(11) DEFAULT NULL,
  `estado` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username_UNIQUE` (`username`),
  UNIQUE KEY `email_UNIQUE` (`email`),
  UNIQUE KEY `password_reset_token_UNIQUE` (`password_reset_token`),
  KEY `fk_user_empleados1_idx` (`empleados_idempleado`),
  CONSTRAINT `fk_user_empleados1` FOREIGN KEY (`empleados_idempleado`) REFERENCES `empleados` (`idempleado`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zona`
--

DROP TABLE IF EXISTS `zona`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zona` (
  `nombrezona` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`nombrezona`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zona`
--

LOCK TABLES `zona` WRITE;
/*!40000 ALTER TABLE `zona` DISABLE KEYS */;
INSERT INTO `zona` VALUES ('0'),('Barrio cenizal'),('barrio garibaldi'),('Barrio las flores');
/*!40000 ALTER TABLE `zona` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-07-30  9:58:33
