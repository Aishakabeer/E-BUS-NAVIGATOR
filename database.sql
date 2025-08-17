/*
SQLyog Community v13.0.1 (64 bit)
MySQL - 5.5.20-log : Database - e-bus navigator
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

DROP DATABASE `e-bus navigator`;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`e-bus navigator` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `e-bus navigator`;

/*Table structure for table `bus` */

DROP TABLE IF EXISTS `bus`;

CREATE TABLE `bus` (
  `BUS_ID` int(11) NOT NULL AUTO_INCREMENT,
  `LOGIN_ID` bigint(11) DEFAULT NULL,
  `BUS_NAME` varchar(20) DEFAULT NULL,
  `REG_NO` varchar(30) DEFAULT NULL,
  `PH_NO` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`BUS_ID`),
  UNIQUE KEY `REG_NO` (`REG_NO`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

/*Data for the table `bus` */

insert  into `bus`(`BUS_ID`,`LOGIN_ID`,`BUS_NAME`,`REG_NO`,`PH_NO`) values 
(1,7,'SANA','KL01A007',90463214),
(2,6,'JHONYS','KL01M369',904632146),
(3,5,'KOMBAN','KL99G336',124567893);

/*Table structure for table `feedback` */

DROP TABLE IF EXISTS `feedback`;

CREATE TABLE `feedback` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `USER-ID` int(11) DEFAULT NULL,
  `FEEDBACK` varchar(50) DEFAULT NULL,
  `DATE` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*Data for the table `feedback` */

insert  into `feedback`(`ID`,`USER-ID`,`FEEDBACK`,`DATE`) values 
(1,123,'excellent','5/3/21'),
(2,321,'NIICE','6/3/21');

/*Table structure for table `location` */

DROP TABLE IF EXISTS `location`;

CREATE TABLE `location` (
  `LOCATION_ID` int(11) NOT NULL AUTO_INCREMENT,
  `BUS_ID` int(11) DEFAULT NULL,
  `LATITUDE` varchar(30) DEFAULT NULL,
  `LONGITUDE` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`LOCATION_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `location` */

/*Table structure for table `login` */

DROP TABLE IF EXISTS `login`;

CREATE TABLE `login` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `USERNAME` varchar(30) NOT NULL,
  `PASSWORD` varchar(30) DEFAULT NULL,
  `TYPE` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`ID`,`USERNAME`),
  UNIQUE KEY `USERNAME` (`USERNAME`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

/*Data for the table `login` */

insert  into `login`(`ID`,`USERNAME`,`PASSWORD`,`TYPE`) values 
(1,'SarathKpt','7898','admin'),
(2,'Pavin','1234','admin'),
(3,'Adhul','4210','admin'),
(4,'7997790430','0000','user'),
(5,'78946123','0000','bus'),
(6,'123456789','0000','bus'),
(7,'16324789','198','BLOCKED');

/*Table structure for table `passenger` */

DROP TABLE IF EXISTS `passenger`;

CREATE TABLE `passenger` (
  `PASS-ID` int(11) NOT NULL AUTO_INCREMENT,
  `LOGIN-ID` int(11) DEFAULT NULL,
  `FNAME` varchar(30) DEFAULT NULL,
  `LNAME` varchar(30) DEFAULT NULL,
  `GENDER` varchar(30) DEFAULT NULL,
  `PLACE` varchar(30) DEFAULT NULL,
  `POST` varchar(30) DEFAULT NULL,
  `PIN` int(11) DEFAULT NULL,
  `EMAIL` varchar(30) DEFAULT NULL,
  `CONTACT` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`PASS-ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*Data for the table `passenger` */

insert  into `passenger`(`PASS-ID`,`LOGIN-ID`,`FNAME`,`LNAME`,`GENDER`,`PLACE`,`POST`,`PIN`,`EMAIL`,`CONTACT`) values 
(1,123,'rahul','p','male','plkd','plkd',12364,'pottan@gmail.com',100),
(2,321,'arun','vava','male','srnr','srnr',7412,'9@gmail.com',741);


/*Table structure for table `driver` */

DROP TABLE IF EXISTS `driver`;

CREATE TABLE `driver` (
  `DRIVER-ID` int(11) NOT NULL AUTO_INCREMENT,
  `LOGIN-ID` int(11) DEFAULT NULL,
   `BUS_ID` int(11) DEFAULT NULL,
  `NAME` varchar(30) DEFAULT NULL,
  `CONTACT` bigint(20) DEFAULT NULL,
  `BUSNAME` varchar(30) DEFAULT NULL,
   `ADDRESS` varchar(30) DEFAULT NULL,
  `EMAIL` varchar(30) DEFAULT NULL,
  
  PRIMARY KEY (`DRIVER-ID`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;

/*Data for the table `driver` */


insert  into `driver`(`LOGIN-ID`,`BUS_ID`,`FNAME`,`LNAME`,`EMAIL`,`CONTACT`) values 
(567,1,'Raghav','p','pottan@gmail.com',100),
(2876,2,'ravi','c','9@gmail.com',741);


/*Table structure for table `route` */

DROP TABLE IF EXISTS `route`;

CREATE TABLE `route` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `FROMS` varchar(30) DEFAULT NULL,
  `TOS` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

/*Data for the table `route` */

insert  into `route`(`ID`,`FROMS`,`TOS`) values 
(1,'KOZHIKODE','PALAKKAD'),
(2,'PERINTHALMANA','MALAPPURAM'),
(3,'MANKADA','PERINTHALMANA'),
(4,'MANJERI','PERINTHALMANA'),
(5,'ERANAMKULAM','COIMBATHORE');

/*Table structure for table `stop` */

DROP TABLE IF EXISTS `stop`;

CREATE TABLE `stop` (
  `STOP_ID` int(11) NOT NULL AUTO_INCREMENT,
  `ROUTE_ID` int(11) DEFAULT NULL,
  `STOP` varchar(30) DEFAULT NULL,
  `LATITUDE` double DEFAULT NULL,
  `LONGITUDE` double DEFAULT NULL,
  PRIMARY KEY (`STOP_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*Data for the table `stop` */

insert  into `stop`(`STOP_ID`,`ROUTE_ID`,`STOP`,`LATITUDE`,`LONGITUDE`) values 
(1,1,'MALAPPURAM',11.051,76.0711);

/*Table structure for table `time schedule` */

DROP TABLE IF EXISTS `time schedule`;

CREATE TABLE `time schedule` (
  `TIME_ID` int(11) NOT NULL AUTO_INCREMENT,
  `BUS_ID` int(11) DEFAULT NULL,
  `STOP_ID` int(11) DEFAULT NULL,
  `TIME` float DEFAULT NULL,
  PRIMARY KEY (`TIME_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

/*Data for the table `time schedule` */

insert  into `time schedule`(`TIME_ID`,`BUS_ID`,`STOP_ID`,`TIME`) values 
(1,5,1,9);


DROP TABLE IF EXISTS `history travel`;

CREATE TABLE `history travel` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `FROMS` varchar(30) DEFAULT NULL,
  `TOS` varchar(30) DEFAULT NULL,
  `DATE` varchar(30) DEFAULT NULL,
  `BUS_ID` int(11) DEFAULT NULL,
  `PHONE_NUMBER` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

/*Data for the table `route` */

insert  into `history travel`(`ID`,`FROMS`,`TOS`,`DATE`,`BUS_ID`,`PHONE_NUMBER`) values 
(1,'KOZHIKODE','PALAKKAD','5/3/21',1,9037559822),
(2,'PERINTHALMANA','MALAPPURAM','6/3/21',2,9037559822),
(3,'MANKADA','PERINTHALMANA','5/4/21',2,8078544634);
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
CREATE TABLE `bustime` (
  `BUSTIME_ID` int(11) NOT NULL AUTO_INCREMENT,
  `BUS_ID` INT(11) DEFAULT NULL,
  `LOGIN_ID` bigint(11) DEFAULT NULL,
  `BUS_NAME` varchar(20) DEFAULT NULL,
  `STOP` varchar(30) DEFAULT NULL,
  `TIME` VARCHAR(20) DEFAULT NULL,
  PRIMARY KEY (`BUSTIME_ID`)
);

/* Data for the table `bustime` */
INSERT INTO `bustime`(`BUSTIME_ID`, `BUS_ID`, `LOGIN_ID`, `BUS_NAME`, `STOP`, `TIME`) VALUES 
(1, 1, 7, 'SANA', 'THRISSUR', '12:00 PM'),
(2, 2, 6, 'JHONYS', 'KUTTIPURAM', '12:30 PM'),
(3, 3, 5, 'KOMBAN', 'EDAPPAL', '12:40 PM');
