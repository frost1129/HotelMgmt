-- MySQL dump 10.13  Distrib 8.0.31, for Win64 (x86_64)
--
-- Host: localhost    Database: hotel-mgmt
-- ------------------------------------------------------
-- Server version	8.0.31

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
-- Table structure for table `accounts`
--

DROP TABLE IF EXISTS `accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `accounts` (
  `UserID` varchar(12) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `UserPass` varchar(16) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `AccountType` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `AccountStatus` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT 'active',
  PRIMARY KEY (`UserID`),
  UNIQUE KEY `UserID_UNIQUE` (`UserID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounts`
--

LOCK TABLES `accounts` WRITE;
/*!40000 ALTER TABLE `accounts` DISABLE KEYS */;
INSERT INTO `accounts` VALUES ('010203040506','TranAn@123','customer','active'),('040302010000','m3lik3milk@A','employee','active'),('040302011111','m3lik3milk@A','customer','active'),('040302015348','m3lik3milk','customer','active'),('060202008868','TanDat1410','customer','active'),('105936486424','NhutNam1450','customer','active'),('116436865540','Jessica0111','customer','active'),('119887461713','SinhTien7410','customer','active'),('185585708403','TanDat1410','customer','blacklisted'),('201062943795','Abcdefgh123','customer','active'),('240241484375','KinhKong753','customer','active'),('296701904069','HoangTau741','customer','active'),('297872950340','QuocTrung450','customer','active'),('314670700646','MyDuyen2304','customer','active'),('386842547181','HoangTu879','employe','active'),('414368063065','HinhChu4130','customer','active'),('466332040979','DuyKhang0501','customer','active'),('467547478989','TanDat1410','customer','close'),('605778767782','TanDat1410','employee','close'),('613664395310','MinhPhuc1234','customer','active'),('639987213568','TanDat1410','employee','active'),('881364984536','KhaiQuan451','customer','active'),('919147901061','ThanhHai7452','customer','active'),('950301000647','TanDat1410','employee','blacklisted');
/*!40000 ALTER TABLE `accounts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bill`
--

DROP TABLE IF EXISTS `bill`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bill` (
  `BillID` int NOT NULL AUTO_INCREMENT,
  `BookingID` int NOT NULL,
  `CreateDate` date NOT NULL,
  `Total` decimal(18,0) NOT NULL,
  PRIMARY KEY (`BillID`),
  KEY `fk_booking_bill_idx` (`BookingID`),
  CONSTRAINT `fk_booking_bill` FOREIGN KEY (`BookingID`) REFERENCES `booking` (`BookingID`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bill`
--

LOCK TABLES `bill` WRITE;
/*!40000 ALTER TABLE `bill` DISABLE KEYS */;
INSERT INTO `bill` VALUES (1,10005,'2020-11-30',90840000),(2,10007,'2018-04-29',45045200),(3,10008,'2018-12-31',478510000),(4,10012,'2017-02-01',4521050000),(5,10014,'2016-12-10',4564823000),(6,10016,'2016-11-30',985036000);
/*!40000 ALTER TABLE `bill` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `booking`
--

DROP TABLE IF EXISTS `booking`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `booking` (
  `BookingID` int NOT NULL AUTO_INCREMENT,
  `CreateDate` timestamp(2) NOT NULL,
  `StartDate` date NOT NULL,
  `EndDate` date NOT NULL,
  `Status` enum('booked','checked-in','checked-out','canceled','abandoned') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'booked',
  `CustomerID` int NOT NULL,
  PRIMARY KEY (`BookingID`),
  KEY `fk_booking_customers1_idx` (`CustomerID`),
  CONSTRAINT `fk_booking_customers1` FOREIGN KEY (`CustomerID`) REFERENCES `customers` (`CustomerID`)
) ENGINE=InnoDB AUTO_INCREMENT=10027 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `booking`
--

LOCK TABLES `booking` WRITE;
/*!40000 ALTER TABLE `booking` DISABLE KEYS */;
INSERT INTO `booking` VALUES (10000,'2020-12-11 17:00:00.00','2020-12-12','2020-12-14','checked-out',1000),(10001,'2020-12-12 07:00:00.00','2020-12-12','2020-12-14','checked-out',1000),(10002,'2020-01-12 16:59:59.00','2020-02-01','2020-02-02','checked-out',1001),(10003,'2020-01-12 16:59:59.00','2020-02-01','2020-02-02','checked-out',1002),(10004,'2020-05-04 07:26:45.00','2020-05-04','2020-05-04','canceled',1002),(10005,'2020-11-30 13:11:01.00','2020-12-02','2020-12-10','checked-out',1004),(10006,'2021-10-14 14:14:10.00','2021-10-15','2021-10-19','abandoned',1003),(10007,'2018-04-29 11:41:54.00','2018-05-02','2018-05-10','booked',1005),(10008,'2018-12-30 17:00:00.00','2018-12-31','2019-01-02','checked-out',1005),(10009,'2022-05-12 03:13:12.00','2022-05-12','2020-05-15','abandoned',1009),(10010,'2019-09-04 21:00:08.00','2019-11-08','2020-12-01','checked-in',1008),(10011,'2018-12-11 18:00:00.00','2019-12-12','2019-12-14','abandoned',1001),(10012,'2017-02-01 10:25:10.00','2017-02-01','2017-02-09','checked-out',1006),(10013,'2016-12-31 17:01:02.00','2017-01-01','2020-01-10','abandoned',1010),(10014,'2016-12-10 13:40:12.00','2016-12-15','2016-12-16','checked-out',1010),(10015,'2016-11-30 13:12:38.00','2016-12-05','2016-12-07','checked-out',1016),(10016,'2016-11-30 13:12:38.00','2016-12-05','2016-12-07','checked-out',1015),(10017,'2016-11-30 13:12:38.00','2016-12-05','2016-12-07','checked-out',1010),(10018,'2016-11-30 13:12:38.00','2016-12-05','2016-12-07','abandoned',1014),(10019,'2016-11-30 13:12:38.00','2016-12-05','2016-12-07','checked-out',1012),(10020,'2016-11-30 13:12:38.00','2016-12-05','2016-12-07','canceled',1016),(10021,'2022-12-03 10:00:00.00','2022-12-14','2022-12-15','canceled',1017),(10022,'2022-12-03 10:00:00.00','2022-12-14','2022-12-15','canceled',1017),(10023,'2022-12-03 10:00:00.00','2022-12-14','2022-12-15','canceled',1017),(10024,'2022-12-03 07:39:25.58','2022-12-07','2022-12-10','booked',1017),(10025,'2022-12-03 07:45:13.67','2022-12-08','2022-12-27','booked',1017),(10026,'2022-12-05 03:01:04.77','2022-12-06','2022-12-09','booked',1017);
/*!40000 ALTER TABLE `booking` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `booking_food`
--

DROP TABLE IF EXISTS `booking_food`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `booking_food` (
  `BookingID` int NOT NULL,
  `FoodID` int NOT NULL,
  `Quantity` int NOT NULL,
  `TotalBill` decimal(18,0) NOT NULL,
  PRIMARY KEY (`BookingID`,`FoodID`),
  KEY `fk_booking_has_food_food1_idx` (`FoodID`),
  KEY `fk_booking_has_food_booking1_idx` (`BookingID`),
  CONSTRAINT `fk_booking_has_food_booking1` FOREIGN KEY (`BookingID`) REFERENCES `booking` (`BookingID`),
  CONSTRAINT `fk_booking_has_food_food1` FOREIGN KEY (`FoodID`) REFERENCES `food` (`FoodID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `booking_food`
--

LOCK TABLES `booking_food` WRITE;
/*!40000 ALTER TABLE `booking_food` DISABLE KEYS */;
INSERT INTO `booking_food` VALUES (10000,10,5,7500000),(10000,11,1,550001),(10000,12,500,63492000),(10001,13,1,50000),(10002,14,2,30000),(10003,14,2,30000),(10004,15,1,15000000),(10005,16,1,20000000),(10007,17,2,2900000),(10009,20,3,150000),(10010,10,5,7500000),(10012,12,100,12698400),(10012,13,2,100000),(10012,16,1,20000000),(10012,27,1,20000),(10012,28,24,1320000),(10014,28,1,55000),(10016,29,1,123500),(10019,22,1,20000),(10020,12,100,12698400),(10020,13,2,100000),(10020,16,1,20000000),(10020,22,1,20000),(10020,27,1,20000),(10020,28,24,1320000),(10020,29,1,123500);
/*!40000 ALTER TABLE `booking_food` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `booking_room`
--

DROP TABLE IF EXISTS `booking_room`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `booking_room` (
  `BookingID` int NOT NULL,
  `RoomID` int NOT NULL,
  PRIMARY KEY (`BookingID`,`RoomID`),
  KEY `fk_booking_has_room_room1_idx` (`RoomID`),
  KEY `fk_booking_has_room_booking1_idx` (`BookingID`),
  CONSTRAINT `fk_booking_has_room_booking1` FOREIGN KEY (`BookingID`) REFERENCES `booking` (`BookingID`),
  CONSTRAINT `fk_booking_has_room_room1` FOREIGN KEY (`RoomID`) REFERENCES `room` (`RoomID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `booking_room`
--

LOCK TABLES `booking_room` WRITE;
/*!40000 ALTER TABLE `booking_room` DISABLE KEYS */;
INSERT INTO `booking_room` VALUES (10000,1),(10000,2),(10002,2),(10008,2),(10010,2),(10016,2),(10000,3),(10006,3),(10025,3),(10001,4),(10019,4),(10002,5),(10013,5),(10009,101),(10014,101),(10024,101),(10007,102),(10026,102),(10012,103),(10015,103),(10002,104),(10004,104),(10020,104),(10003,105),(10019,105),(10011,201),(10018,201),(10017,202),(10005,204),(10011,205);
/*!40000 ALTER TABLE `booking_room` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `booking_services`
--

DROP TABLE IF EXISTS `booking_services`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `booking_services` (
  `BookingID` int NOT NULL,
  `ServiceID` int unsigned NOT NULL,
  PRIMARY KEY (`BookingID`,`ServiceID`),
  KEY `fk_booking_has_services_services1_idx` (`ServiceID`),
  KEY `fk_booking_has_services_booking1_idx` (`BookingID`),
  CONSTRAINT `fk_booking_has_services_booking1` FOREIGN KEY (`BookingID`) REFERENCES `booking` (`BookingID`),
  CONSTRAINT `fk_booking_has_services_services1` FOREIGN KEY (`ServiceID`) REFERENCES `services` (`ServiceID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `booking_services`
--

LOCK TABLES `booking_services` WRITE;
/*!40000 ALTER TABLE `booking_services` DISABLE KEYS */;
INSERT INTO `booking_services` VALUES (10000,1),(10004,1),(10017,1),(10024,1),(10000,2),(10002,2),(10009,2),(10017,2),(10000,3),(10003,3),(10017,3),(10026,3),(10007,4),(10023,4),(10003,5),(10004,5),(10015,5),(10026,5),(10010,6),(10024,6),(10005,7),(10017,7),(10020,8),(10004,9),(10007,9),(10011,9),(10013,9),(10017,9),(10000,10),(10007,10),(10010,10),(10020,10),(10024,10);
/*!40000 ALTER TABLE `booking_services` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customers`
--

DROP TABLE IF EXISTS `customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customers` (
  `CustomerID` int NOT NULL AUTO_INCREMENT,
  `UserID` varchar(12) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `FirstName` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `LastName` varchar(80) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `Birthday` date NOT NULL,
  `PhoneNum` varchar(11) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `Email` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `Address` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`CustomerID`),
  KEY `fk_customers_accounts_idx` (`UserID`),
  CONSTRAINT `fk_customers_accounts` FOREIGN KEY (`UserID`) REFERENCES `accounts` (`UserID`)
) ENGINE=InnoDB AUTO_INCREMENT=1020 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customers`
--

LOCK TABLES `customers` WRITE;
/*!40000 ALTER TABLE `customers` DISABLE KEYS */;
INSERT INTO `customers` VALUES (1000,'060202008868','Anh',' Hu???nh Nh???t','2002-09-09','0985456210','lalala@gmail.com','TPHCM'),(1001,'105936486424','Anh','La Ho??ng','2002-12-20','0123620589','AnhLaHoang@gmail.com','TPHCM'),(1002,'116436865540','Anh','L?? H???ng','2002-12-20','0452100361','anhlyhong@gmail.com','H?? N???i'),(1003,'119887461713','Anh','Phan Th???','2002-01-18','0216325944','anhphanthig@gmail.com','H???i Ph??ng'),(1004,'185585708403','B??nh','Th??ng L???','1992-12-05','0125630220','binhthongle@gmail.com','Vinh'),(1005,'201062943795','C?????ng','Nguy???n Qu???c','1992-12-05','0236987452','cuongnguyenquoc@gmail.com','?????ng Nai'),(1006,'240241484375','Dung','L??u Ng???c Th??y','1985-02-12','0112569874','dungluungocthuy@gmail.com','T??y Ninh'),(1007,'296701904069','Duy','Nguy???n V??n','2000-04-13','0985213694','duynguyenvan@gmail.com','T??y Ninh'),(1008,'297872950340','D??ng','Qu??nh ?????i','1964-08-27','0123658940','dungquanhdai@gmail.com','B??nh Thu???n'),(1009,'314670700646','?????t','Ph???m Ti???n','2001-09-27','0259874100','datphantien@gmail.com','???? L???t'),(1010,'386842547181','??oan','Tr???n Th???c','2002-09-27','0123456789','doantranthuc@gmail.com','L??m ?????ng'),(1011,'414368063065','H??','Thi???u Th??? Thu','1896-07-04','0123502010','hathieuthithu@gmail.com','B??nh Ph?????c'),(1012,'466332040979','H???ng','Nguy???n Th??y','1987-04-05','0235103201','hangnguyenthuy@gmail.com','C?? Mau'),(1013,'467547478989','Hi???u','L??u C??ng','1980-04-05','0125413697','hieuluucong@gmail.com','T??y Ninh'),(1014,'613664395310','Kh??nh','Ho??ng H?? Minh','1998-10-04','0120000122','khanhHoanghaminh@gmail.com','H?? T??nh'),(1015,'881364984536','T??m','Nguy???n Th??? Ng???c','1993-01-01','0124985630','khanhHoanghaminh@gmail.com','H?? T??nh'),(1016,'919147901061','Uy??n','L?? Ph????ng','2002-10-31','0202332101','uyenlephuong@gmail.com','B??nh ?????nh'),(1017,'040302011111','Linh','V??','2002-11-29','0393617000','',NULL),(1018,'010203040506','An','Tr???n','2003-12-24','0123456789',NULL,NULL),(1019,'040302015348','V??','Linh','2022-11-29','0393617000',NULL,NULL);
/*!40000 ALTER TABLE `customers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employees`
--

DROP TABLE IF EXISTS `employees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employees` (
  `EmployeeID` int NOT NULL AUTO_INCREMENT,
  `UserID` varchar(12) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `FirstName` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `LastName` varchar(80) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `Birthday` date NOT NULL,
  `PhoneNum` varchar(11) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `Email` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `Address` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`EmployeeID`),
  UNIQUE KEY `EmployeeID_UNIQUE` (`EmployeeID`),
  KEY `fk_employees_accounts` (`UserID`),
  CONSTRAINT `fk_employees_accounts` FOREIGN KEY (`UserID`) REFERENCES `accounts` (`UserID`)
) ENGINE=InnoDB AUTO_INCREMENT=1005 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employees`
--

LOCK TABLES `employees` WRITE;
/*!40000 ALTER TABLE `employees` DISABLE KEYS */;
INSERT INTO `employees` VALUES (1001,'605778767782','?????t','L????ng T???n','2002-10-14','0386221906','datluongtan@gmail.com','B??nh Thu???n'),(1002,'639987213568','Khang','Tr???n Duy','2002-01-05','0123520145','khangtranduy@gmail.com','TPHCM'),(1003,'950301000647','Qu??n','Nguy???n Minh','2002-12-02','0123652014','quannguyenminh@gmail.com','B??nh D????ng'),(1004,'040302010000','Linh','V??','2002-11-29','0393617000','2051012054linh@ou.edu.vn','TPHCM');
/*!40000 ALTER TABLE `employees` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `food`
--

DROP TABLE IF EXISTS `food`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `food` (
  `FoodID` int NOT NULL AUTO_INCREMENT,
  `FoodName` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `Category` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `PricePerUnit` decimal(18,0) NOT NULL,
  `UnitType` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `IsDeleted` date DEFAULT NULL,
  PRIMARY KEY (`FoodID`),
  UNIQUE KEY `FoodID_UNIQUE` (`FoodID`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `food`
--

LOCK TABLES `food` WRITE;
/*!40000 ALTER TABLE `food` DISABLE KEYS */;
INSERT INTO `food` VALUES (10,'T??m chi??n x??','Appetizer',1500000,'ph???n','2022-11-22'),(11,'G???i c??? h??? d???a','Appetizer',55000,'ph???n',NULL),(12,'Th???t ngu???i b??t b???u','Appetizer',130000,'ph???n',NULL),(13,'S??p miso','Appetizer',50000,'ph???n',NULL),(14,'B??nh ph??ng t??m','Appetizer',15000,'ph???n',NULL),(15,'T??m h??m','Main dishes',15000000,'con',NULL),(16,'Cua ng???c trai','Main dishes',20000000,'ph???n',NULL),(17,'G?? quay ti??u','Main dishes',1450000,'con',NULL),(18,'Beefsteak','Main dishes',452000,'200g',NULL),(19,'Soup','Main dishes',100000,'ph???n',NULL),(20,'Ice cream','Deserts',50000,'ph???n',NULL),(21,'Snack','Deserts',25000,'g??i',NULL),(22,'Banana','Deserts',20000,'ph???n',NULL),(23,'Chocolate cake','Deserts',50000,'ph???n',NULL),(24,'Pumpkin Soup','Deserts',15000,'ph???n',NULL),(25,'Wine','Drinks',15000001,'chai',NULL),(26,'Water','Drinks',12000,'chai',NULL),(27,'Milk','Drinks',20000,'ly',NULL),(28,'Beer','Drinks',55000,'chai',NULL),(29,'CockTail','Drinks',123500,'ly',NULL);
/*!40000 ALTER TABLE `food` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `room`
--

DROP TABLE IF EXISTS `room`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `room` (
  `RoomID` int NOT NULL AUTO_INCREMENT,
  `PricePerDay` double NOT NULL,
  `AllowSmoking` tinyint NOT NULL,
  `SingleBed` int DEFAULT NULL,
  `DoubleBed` int DEFAULT NULL,
  `RoomName` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `Description` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`RoomID`),
  UNIQUE KEY `RoomID_UNIQUE` (`RoomID`),
  UNIQUE KEY `RoomName_UNIQUE` (`RoomName`)
) ENGINE=InnoDB AUTO_INCREMENT=206 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `room`
--

LOCK TABLES `room` WRITE;
/*!40000 ALTER TABLE `room` DISABLE KEYS */;
INSERT INTO `room` VALUES (1,150000,0,0,1,'NK.001','Ph??ng d??? tr???'),(2,150000,1,1,0,'NK.002',NULL),(3,123000,1,1,1,'NK.003','Ph??ng d??nh cho ng?????i th??ch h???c oop'),(4,120000,0,0,1,'NK.004','Ph??ng h??t thu???c theo y??u c???u'),(5,250000,2,1,0,'NK.005',NULL),(101,350000,1,2,3,'NK.101','Ph??ng gia ????nh'),(102,150000,1,1,0,'NK.102','Ph??ng ?????c th??n'),(103,123000,0,1,1,'NK.103','Ph??ng thi???t k??? theo y??u c???u'),(104,1200000,1,NULL,NULL,'NK.104','Ph??ng thi???t k??? theo y??u c???u'),(105,120000,0,2,2,'NK.105',NULL),(201,150000,1,1,1,'NK.201','Ph??ng t???ng th???ng'),(202,1200000,1,1,1,'NK.202','Ph??ng ph?? t???ng th???ng'),(203,1000000,0,2,2,'NK.203','Ph??ng th????ng gia'),(204,1500000,0,2,3,'NK.204','Ph??ng d??nh cho ??o??n V.I.P'),(205,500000,0,1,2,'NK.205','Kh??ch V.I.P');
/*!40000 ALTER TABLE `room` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `services`
--

DROP TABLE IF EXISTS `services`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `services` (
  `ServiceID` int unsigned NOT NULL AUTO_INCREMENT,
  `Name` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `ChargePerHour` decimal(18,0) NOT NULL,
  `IsDeleted` date DEFAULT NULL,
  PRIMARY KEY (`ServiceID`),
  UNIQUE KEY `ServiceID_UNIQUE` (`ServiceID`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `services`
--

LOCK TABLES `services` WRITE;
/*!40000 ALTER TABLE `services` DISABLE KEYS */;
INSERT INTO `services` VALUES (1,'D???n d???p ph??ng',120000,NULL),(2,'L??m ?????y th???c ??n trong t??? l???nh',120000,NULL),(3,'Gi???t ???i',150000,NULL),(4,'Xe ????a r?????c',120000,NULL),(5,'D???ch v??? massage',532000,NULL),(6,'D???ch v??? spa',350000,NULL),(7,'?????t ph??ng h???p',5000000,NULL),(8,'Thu?? b???o v??? ph??ng',3600000,NULL),(9,'Thu?? qu???n gia ri??ng',9540000,NULL),(10,'Thu?? b??c s?? ri??ng',2600000,NULL);
/*!40000 ALTER TABLE `services` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-12-05 10:17:13
