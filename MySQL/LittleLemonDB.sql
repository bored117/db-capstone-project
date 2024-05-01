-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: localhost    Database: littlelemondb
-- ------------------------------------------------------
-- Server version	8.0.36

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
-- Table structure for table `bookings`
--

DROP TABLE IF EXISTS `bookings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bookings` (
  `idBookings` int NOT NULL AUTO_INCREMENT,
  `Date` date NOT NULL,
  `TableNumber` int NOT NULL,
  `Customer_idCustomer` int NOT NULL,
  PRIMARY KEY (`idBookings`),
  KEY `fk_Bookings_Customer1_idx` (`Customer_idCustomer`),
  CONSTRAINT `fk_Bookings_Customer1` FOREIGN KEY (`Customer_idCustomer`) REFERENCES `customer` (`idCustomer`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `city`
--

DROP TABLE IF EXISTS `city`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `city` (
  `idcity` int NOT NULL AUTO_INCREMENT,
  `CITY` varchar(45) NOT NULL,
  PRIMARY KEY (`idcity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `contactdetail`
--

DROP TABLE IF EXISTS `contactdetail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contactdetail` (
  `idContactDetail` int NOT NULL AUTO_INCREMENT,
  `PhoneNumber` varchar(45) DEFAULT NULL,
  `Email` varchar(45) DEFAULT NULL,
  `Address1` varchar(45) DEFAULT NULL,
  `Address2` varchar(45) DEFAULT NULL,
  `city_idcity` int NOT NULL,
  `State_idState` int NOT NULL,
  `ZipCode` char(5) DEFAULT NULL,
  `Zip4` char(4) DEFAULT NULL,
  PRIMARY KEY (`idContactDetail`),
  KEY `fk_ContactDetail_city1_idx` (`city_idcity`),
  KEY `fk_ContactDetail_State1_idx` (`State_idState`),
  CONSTRAINT `fk_ContactDetail_city1` FOREIGN KEY (`city_idcity`) REFERENCES `city` (`idcity`),
  CONSTRAINT `fk_ContactDetail_State1` FOREIGN KEY (`State_idState`) REFERENCES `state` (`idState`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer` (
  `idCustomer` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(45) NOT NULL,
  `ContactDetail_idContactDetail` int NOT NULL,
  PRIMARY KEY (`idCustomer`),
  KEY `fk_Customer_ContactDetail1_idx` (`ContactDetail_idContactDetail`),
  CONSTRAINT `fk_Customer_ContactDetail1` FOREIGN KEY (`ContactDetail_idContactDetail`) REFERENCES `contactdetail` (`idContactDetail`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `menu`
--

DROP TABLE IF EXISTS `menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `menu` (
  `idMenu` int NOT NULL AUTO_INCREMENT,
  `MenuName` varchar(45) NOT NULL,
  `Price` decimal(10,2) NOT NULL,
  `MenuCategory_idMenuCategory` int NOT NULL,
  `menu_idMenu_Course` int NOT NULL,
  PRIMARY KEY (`idMenu`),
  KEY `fk_menuItem_menuItem1_idx` (`menu_idMenu_Course`),
  KEY `fk_Menu_MenuCategory1_idx` (`MenuCategory_idMenuCategory`),
  CONSTRAINT `fk_Menu_MenuCategory1` FOREIGN KEY (`MenuCategory_idMenuCategory`) REFERENCES `menucategory` (`idMenuCategory`),
  CONSTRAINT `fk_menuItem_menuItem1` FOREIGN KEY (`menu_idMenu_Course`) REFERENCES `menu` (`idMenu`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `menucategory`
--

DROP TABLE IF EXISTS `menucategory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `menucategory` (
  `idMenuCategory` int NOT NULL AUTO_INCREMENT,
  `Category` varchar(45) NOT NULL,
  PRIMARY KEY (`idMenuCategory`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `orderdeliverystatus`
--

DROP TABLE IF EXISTS `orderdeliverystatus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orderdeliverystatus` (
  `idOrderDeliveryStatus` int NOT NULL AUTO_INCREMENT,
  `DeliveryDate` date DEFAULT NULL,
  `Status_idStatus` int NOT NULL,
  PRIMARY KEY (`idOrderDeliveryStatus`),
  KEY `fk_OrderDeliveryStatus_Status1_idx` (`Status_idStatus`),
  CONSTRAINT `fk_OrderDeliveryStatus_Status1` FOREIGN KEY (`Status_idStatus`) REFERENCES `status` (`idStatus`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `idOrders` int NOT NULL AUTO_INCREMENT,
  `Bookings_idBookings` int NOT NULL,
  `Menu_idMenu` int NOT NULL,
  `OrderDate` date NOT NULL,
  `Quantity` int NOT NULL,
  `OrderDeliveryStatus_idOrderDeliveryStatus` int NOT NULL,
  PRIMARY KEY (`idOrders`,`Bookings_idBookings`,`Menu_idMenu`),
  KEY `fk_Orders_Bookings1_idx` (`Bookings_idBookings`),
  KEY `fk_Orders_Menu1_idx` (`Menu_idMenu`),
  KEY `fk_Orders_OrderDeliveryStatus1_idx` (`OrderDeliveryStatus_idOrderDeliveryStatus`),
  CONSTRAINT `fk_Orders_Bookings1` FOREIGN KEY (`Bookings_idBookings`) REFERENCES `bookings` (`idBookings`),
  CONSTRAINT `fk_Orders_Menu1` FOREIGN KEY (`Menu_idMenu`) REFERENCES `menu` (`idMenu`),
  CONSTRAINT `fk_Orders_OrderDeliveryStatus1` FOREIGN KEY (`OrderDeliveryStatus_idOrderDeliveryStatus`) REFERENCES `orderdeliverystatus` (`idOrderDeliveryStatus`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `role` (
  `idrole` int NOT NULL,
  `Role` varchar(45) NOT NULL,
  PRIMARY KEY (`idrole`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `staff`
--

DROP TABLE IF EXISTS `staff`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `staff` (
  `idStaff` int NOT NULL AUTO_INCREMENT,
  `Salary` decimal(10,2) NOT NULL,
  `role_idrole` int NOT NULL,
  PRIMARY KEY (`idStaff`),
  KEY `fk_Staff_role1_idx` (`role_idrole`),
  CONSTRAINT `fk_Staff_role1` FOREIGN KEY (`role_idrole`) REFERENCES `role` (`idrole`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `state`
--

DROP TABLE IF EXISTS `state`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `state` (
  `idState` int NOT NULL AUTO_INCREMENT,
  `State` char(2) NOT NULL,
  PRIMARY KEY (`idState`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `status`
--

DROP TABLE IF EXISTS `status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `status` (
  `idStatus` int NOT NULL AUTO_INCREMENT,
  `Status` varchar(45) NOT NULL,
  PRIMARY KEY (`idStatus`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-05-01 10:29:07
