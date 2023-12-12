DROP SCHEMA IF EXISTS Tucci;
CREATE SCHEMA IF NOT EXISTS Tucci;

USE Tucci;

DROP TABLE IF EXISTS `SHIPPERS`;

CREATE TABLE IF NOT EXISTS `SHIPPERS` (
`ID` int PRIMARY KEY NOT NULL auto_increment,
`name` varchar(50),
`contact` varchar (50)
) ;

DROP TABLE IF EXISTS `COMMODITIES`;

CREATE TABLE IF NOT EXISTS `COMMODITIES` (
`ID` int PRIMARY KEY NOT NULL AUTO_INCREMENT,
`name` varchar (30)
) ;

DROP TABLE IF EXISTS `CARRIERS`;

CREATE TABLE IF NOT EXISTS `CARRIERS` (
`ID` int NOT NULL PRIMARY KEY AUTO_INCREMENT,
`name` varchar (30)
) ;

DROP TABLE IF EXISTS `VESSELS`;

CREATE TABLE IF NOT EXISTS `VESSELS` (
`ID` int PRIMARY KEY NOT NULL AUTO_INCREMENT,
`name` varchar(30)
) ;

DROP TABLE IF EXISTS `ROUTES`;

CREATE TABLE `ROUTES` (
`ID` int PRIMARY KEY NOT NULL AUTO_INCREMENT,
`org_dest` varchar(30),
`corridor` varchar (30)
) ;

DROP TABLE IF EXISTS `COSTS`;

CREATE TABLE IF NOT EXISTS `COSTS`(
`route_id` int,
`carrier_id` int,
`costo` int,
CONSTRAINT `routes` FOREIGN KEY (`route_id`)
REFERENCES `ROUTES`(`ID`),
CONSTRAINT  `carrier` FOREIGN KEY (`carrier_id`)
REFERENCES `CARRIERS`(`ID`)
) ;

DROP TABLE IF EXISTS `PRICES`;

CREATE TABLE `PRICES` (
`route_id` int,
`price` int,
CONSTRAINT `routes_` FOREIGN KEY (`route_id`)
REFERENCES `ROUTES`(`ID`)
) ;

DROP TABLE IF EXISTS `BOOKINGS`;

CREATE TABLE IF NOT EXISTS `BOOKINGS` (
`ID` int NOT NULL auto_increment,
`quantity` int,
`shipper_id` int,
`commodity_id` int,
`container_type` varchar(10), 
`carrier_id` int,
`vessel_id` int,
`date` date,
`route_id` int,
PRIMARY KEY (`ID`),
CONSTRAINT `shipper_id` FOREIGN KEY (`shipper_id`)
REFERENCES `SHIPPERS`(`ID`),
CONSTRAINT `commodity_id` FOREIGN KEY (`commodity_id`)
REFERENCES `COMMODITIES`(`ID`),
CONSTRAINT `carrier_id` FOREIGN KEY (`carrier_id`)
REFERENCES `CARRIERS`(`ID`),
CONSTRAINT `vessel_id` FOREIGN KEY (`vessel_id`)
REFERENCES `VESSELS`(`ID`),
CONSTRAINT `route_id` FOREIGN KEY (`route_id`)
REFERENCES `ROUTES`(`ID`)
) ;
