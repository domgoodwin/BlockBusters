CREATE DATABASE `clarity2` /*!40100 DEFAULT CHARACTER SET latin1 */;

CREATE TABLE `bookings` (
  `Booking_ID` int(11) NOT NULL AUTO_INCREMENT,
  `Project_ID` int(11) DEFAULT NULL,
  `User_ID` int(11) NOT NULL,
  `Date` date NOT NULL,
  `Hours` int(11) NOT NULL,
  PRIMARY KEY (`Booking_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


CREATE TABLE `projects` (
  `Project_ID` int(11) NOT NULL AUTO_INCREMENT,
  `Project_Ref` varchar(45) NOT NULL,
  `Project_Name` varchar(45) NOT NULL,
  `Start_Date` date DEFAULT NULL,
  `End_Date` date DEFAULT NULL,
  PRIMARY KEY (`Project_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



CREATE TABLE `roles` (
  `Role_ID` int(11) NOT NULL AUTO_INCREMENT,
  `Role_Name` varchar(45) NOT NULL,
  PRIMARY KEY (`Role_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


CREATE TABLE `users` (
  `User_ID` int(11) NOT NULL AUTO_INCREMENT,
  `Username` varchar(45) NOT NULL,
  `Password` varchar(45) NOT NULL,
  `Role_ID` int(11) NOT NULL,
  PRIMARY KEY (`User_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
