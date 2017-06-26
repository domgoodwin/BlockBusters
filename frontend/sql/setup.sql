-- phpMyAdmin SQL Dump
-- version 4.4.15.5
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1:3306
-- Generation Time: May 19, 2017 at 10:34 AM
-- Server version: 5.6.34-log
-- PHP Version: 7.0.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `clarity2`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `PopulateWeeks`()
BEGIN
	SET @i = 0;
    SET @amountToAdd = 10;
    SET @prevMonday = SUBDATE(SUBDATE(NOW(), INTERVAL WEEKDAY(NOW()) DAY), INTERVAL 2 WEEK);
	SET @startDate = (SELECT Monday_Date FROM clarity2.weeks ORDER BY Monday_Date DESC LIMIT 1);
	IF (@startDate IS NULL) THEN
		INSERT INTO clarity2.weeks (Monday_Date) VALUES (@prevMonday);
        SET @startDate = @prevMonday;
	END IF;
	WHILE @i < @amountToAdd DO
		SET @startDate = DATE_ADD(@startDate, INTERVAL 7 DAY);
		INSERT INTO clarity2.weeks (Monday_Date)
		VALUES (@startDate);
		SET @i = @i + 1;
	END WHILE;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `bookings`
--

CREATE TABLE IF NOT EXISTS `bookings` (
  `Booking_ID` int(11) NOT NULL,
  `Project_ID` int(11) DEFAULT NULL,
  `User_ID` int(11) NOT NULL,
  `Date` date NOT NULL,
  `Hours` double(8,3) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=63 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `bookings`
--

INSERT INTO `bookings` (`Booking_ID`, `Project_ID`, `User_ID`, `Date`, `Hours`) VALUES
(1, 2, 2, '1990-01-01', 6.000),
(2, 2, 2, '1990-01-01', 6.000),
(3, 2, 2, '1990-01-01', 6.000),
(4, 2, 2, '1990-01-01', 6.000),
(5, 1, 1, '2016-11-30', 7.000),
(6, 1, 1, '2017-12-31', 1.000),
(7, 1, 1, '2017-12-31', 1.000),
(8, 2, 1, '2017-12-31', 1.000),
(9, 1, 1, '2017-12-31', 1.000),
(10, 1, 1, '2017-12-31', 1.000),
(11, 1, 1, '2017-12-31', 1.000),
(12, 1, 1, '2017-12-31', 1.000),
(13, 1, 1, '2017-05-01', 2.000),
(14, 1, 1, '2017-05-02', 2.000),
(15, 1, 1, '2017-05-03', 2.000),
(16, 1, 1, '2017-05-05', 2.000),
(17, 1, 1, '2017-05-06', 2.000),
(18, 1, 1, '2017-05-01', 2.000),
(19, 1, 1, '2017-05-02', 2.000),
(20, 1, 1, '2017-05-03', 2.000),
(21, 1, 1, '2017-05-05', 2.000),
(22, 1, 1, '2017-05-06', 2.000),
(23, 1, 1, '1990-01-01', 7.250),
(24, 1, 1, '1990-01-01', 7.250),
(25, 1, 1, '1990-01-01', 7.253),
(26, 1, 6, '2017-05-01', 7.500),
(27, 1, 6, '2017-05-02', 7.500),
(28, 1, 6, '2017-05-03', 7.500),
(29, 1, 6, '2017-05-04', 7.500),
(30, 1, 6, '2017-05-05', 7.500),
(31, 2, 8, '2017-05-08', 7.500),
(32, 2, 8, '2017-05-09', 7.500),
(33, 2, 8, '2017-05-10', 7.500),
(34, 2, 8, '2017-05-11', 7.500),
(35, 2, 8, '2017-05-12', 7.500),
(36, 2, 8, '2017-05-13', 600.000),
(37, 2, 8, '2017-05-14', 600.000),
(38, 1, 6, '2017-05-01', 7.500),
(39, 1, 6, '2017-05-02', 7.500),
(40, 1, 6, '2017-05-03', 7.500),
(41, 1, 6, '2017-05-04', 7.500),
(42, 1, 6, '2017-05-05', 7.500),
(43, 5, 13, '2017-05-01', 7.500),
(44, 5, 13, '2017-05-02', 7.500),
(45, 5, 13, '2017-05-03', 7.500),
(46, 5, 13, '2017-05-04', 7.500),
(47, 5, 13, '2017-05-05', 7.500),
(48, 5, 13, '2017-05-01', -7.500),
(49, 5, 13, '2017-05-02', -7.500),
(50, 5, 13, '2017-05-03', -7.500),
(51, 5, 13, '2017-05-04', -7.500),
(52, 5, 13, '2017-05-05', -7.500),
(53, 2, 13, '2017-05-01', 7.500),
(54, 2, 13, '2017-05-02', 7.500),
(55, 2, 13, '2017-05-03', 7.500),
(56, 2, 13, '2017-05-04', 7.500),
(57, 2, 13, '2017-05-05', 7.500),
(58, 1, 6, '2017-07-31', 7.500),
(59, 1, 6, '2017-08-01', 7.500),
(60, 1, 6, '2017-08-02', 7.500),
(61, 1, 6, '2017-08-03', 7.500),
(62, 1, 6, '2017-08-04', 7.500);

-- --------------------------------------------------------

--
-- Table structure for table `projects`
--

CREATE TABLE IF NOT EXISTS `projects` (
  `Project_ID` int(11) NOT NULL,
  `Project_Ref` varchar(45) NOT NULL,
  `Project_Name` varchar(45) NOT NULL,
  `Start_Date` date DEFAULT NULL,
  `End_Date` date DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=357 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `projects`
--

INSERT INTO `projects` (`Project_ID`, `Project_Ref`, `Project_Name`, `Start_Date`, `End_Date`) VALUES
(1, 'P87-1', 'P87 Developer', NULL, NULL),
(2, 'P87-2', 'P87 Project Manager', NULL, NULL),
(3, 'P87-3', 'P87 Tester', NULL, NULL),
(4, 'R39-1', 'R39 Developer', NULL, NULL),
(5, 'ct-1', 'ct developer', '1990-01-01', '1990-01-01'),
(6, 'P87-4', 'P87 pm role', '2016-01-01', '2017-12-31'),
(7, 'P87-4', 'P87 pm role', '2016-01-01', '2017-12-31'),
(8, 'Core-1-P04.103', 'MGMT -  Programme Mgr', '0000-00-00', '0000-00-00'),
(9, 'Core-1-X02.103', 'MGMT -  ADC Delivery Manager', '0000-00-00', '0000-00-00'),
(10, 'Core-1-X02.108', 'MGMT - Lead Developer', '0000-00-00', '0000-00-00'),
(11, 'Core-1-X02.110', 'MGMT - PMO', '0000-00-00', '0000-00-00'),
(12, 'Core-1-X02.406', 'MGMT - Lead Architect', '0000-00-00', '0000-00-00'),
(13, 'ESO-1-X02.104', 'ESO Data Remission - Architect', '0000-00-00', '0000-00-00'),
(14, 'ESO-1-X02.105', 'ESO Data Remission - Project Manager', '0000-00-00', '0000-00-00'),
(15, 'ESO-1-X02.105', 'ESO Data Remission - Lead Business Analyst', '0000-00-00', '0000-00-00'),
(16, 'ESO-1-X02.106', 'ESO Data Remission - Techinical Engineer', '0000-00-00', '0000-00-00'),
(17, 'ESO-1-X02.107', 'ESO Data Remission - Scrum Master', '0000-00-00', '0000-00-00'),
(18, 'ESO-1-X02.108', 'ESO Data Remission - Business Analyst', '0000-00-00', '0000-00-00'),
(19, 'ESO-1-X02.108', 'ESO Data Remission - Lead Developer', '0000-00-00', '0000-00-00'),
(20, 'ESO-1-X02.109', 'ESO Data Remission - Developer', '0000-00-00', '0000-00-00'),
(21, 'ESO-1-X02.110', 'ESO Data Remission - Junior Developer', '0000-00-00', '0000-00-00'),
(22, 'ESO-1-X02.110', 'ESO Data Remission - PMO', '0000-00-00', '0000-00-00'),
(23, 'ESO-1-X02.406', 'ESO Data Remission - Lead Architect', '0000-00-00', '0000-00-00'),
(24, 'ESO-1-P04.18', 'ESO Data Remission - NICE', '0000-00-00', '0000-00-00'),
(25, 'ESO-1-P04.18', 'ESO Data Remission - Pegamento', '0000-00-00', '0000-00-00'),
(26, 'CT-1-X02.104', 'CT Worklist - Architect', '0000-00-00', '0000-00-00'),
(27, 'CT-1-X02.105', 'CT Worklist - Project Manager', '0000-00-00', '0000-00-00'),
(28, 'CT-1-X02.105', 'CT Worklist - Lead Business Analyst', '0000-00-00', '0000-00-00'),
(29, 'CT-1-X02.106', 'CT Worklist - Techinical Engineer', '0000-00-00', '0000-00-00'),
(30, 'CT-1-X02.107', 'CT Worklist - Scrum Master', '0000-00-00', '0000-00-00'),
(31, 'CT-1-X02.108', 'CT Worklist - Business Analyst', '0000-00-00', '0000-00-00'),
(32, 'CT-1-X02.108', 'CT Worklist - Lead Developer', '0000-00-00', '0000-00-00'),
(33, 'CT-1-X02.109', 'CT Worklist - Developer', '0000-00-00', '0000-00-00'),
(34, 'CT-1-X02.110', 'CT Worklist - Junior Developer', '0000-00-00', '0000-00-00'),
(35, 'CT-1-X02.110', 'CT Worklist - PMO', '0000-00-00', '0000-00-00'),
(36, 'CT-1-X02.406', 'CT Worklist - Lead Architect', '0000-00-00', '0000-00-00'),
(37, 'CT-1-P04.18', 'CT Worklist - NICE', '0000-00-00', '0000-00-00'),
(38, 'CT-1-P04.18', 'CT Worklist - Pegamento', '0000-00-00', '0000-00-00'),
(39, 'CT-2-X02.104', 'CT OTRS - Architect', '0000-00-00', '0000-00-00'),
(40, 'CT-2-X02.105', 'CT OTRS - Project Manager', '0000-00-00', '0000-00-00'),
(41, 'CT-2-X02.105', 'CT OTRS - Lead Business Analyst', '0000-00-00', '0000-00-00'),
(42, 'CT-2-X02.106', 'CT OTRS - Techinical Engineer', '0000-00-00', '0000-00-00'),
(43, 'CT-2-X02.107', 'CT OTRS - Scrum Master', '0000-00-00', '0000-00-00'),
(44, 'CT-2-X02.108', 'CT OTRS - Business Analyst', '0000-00-00', '0000-00-00'),
(45, 'CT-2-X02.108', 'CT OTRS - Lead Developer', '0000-00-00', '0000-00-00'),
(46, 'CT-2-X02.109', 'CT OTRS - Developer', '0000-00-00', '0000-00-00'),
(47, 'CT-2-X02.110', 'CT OTRS - Junior Developer', '0000-00-00', '0000-00-00'),
(48, 'CT-2-X02.110', 'CT OTRS - PMO', '0000-00-00', '0000-00-00'),
(49, 'CT-2-X02.406', 'CT OTRS - Lead Architect', '0000-00-00', '0000-00-00'),
(50, 'CT-2-P04.18', 'CT OTRS - NICE', '0000-00-00', '0000-00-00'),
(51, 'CT-2-P04.18', 'CT OTRS - Pegamento', '0000-00-00', '0000-00-00'),
(52, 'CT-3-X02.104', 'CT RLS - Architect', '0000-00-00', '0000-00-00'),
(53, 'CT-3-X02.105', 'CT RLS - Project Manager', '0000-00-00', '0000-00-00'),
(54, 'CT-3-X02.105', 'CT RLS - Lead Business Analyst', '0000-00-00', '0000-00-00'),
(55, 'CT-3-X02.106', 'CT RLS - Techinical Engineer', '0000-00-00', '0000-00-00'),
(56, 'CT-3-X02.107', 'CT RLS - Scrum Master', '0000-00-00', '0000-00-00'),
(57, 'CT-3-X02.108', 'CT RLS - Business Analyst', '0000-00-00', '0000-00-00'),
(58, 'CT-3-X02.108', 'CT RLS - Lead Developer', '0000-00-00', '0000-00-00'),
(59, 'CT-3-X02.109', 'CT RLS - Developer', '0000-00-00', '0000-00-00'),
(60, 'CT-3-X02.110', 'CT RLS - Junior Developer', '0000-00-00', '0000-00-00'),
(61, 'CT-3-X02.110', 'CT RLS - PMO', '0000-00-00', '0000-00-00'),
(62, 'CT-3-X02.406', 'CT RLS - Lead Architect', '0000-00-00', '0000-00-00'),
(63, 'CT-3-P04.18', 'CT RLS - NICE', '0000-00-00', '0000-00-00'),
(64, 'CT-3-P04.18', 'CT RLS - Pegamento', '0000-00-00', '0000-00-00'),
(65, 'AWRS-1-X02.104', 'AWRS - Architect', '0000-00-00', '0000-00-00'),
(66, 'AWRS-1-X02.105', 'AWRS - Project Manager', '0000-00-00', '0000-00-00'),
(67, 'AWRS-1-X02.105', 'AWRS - Lead Business Analyst', '0000-00-00', '0000-00-00'),
(68, 'AWRS-1-X02.106', 'AWRS - Techinical Engineer', '0000-00-00', '0000-00-00'),
(69, 'AWRS-1-X02.107', 'AWRS - Scrum Master', '0000-00-00', '0000-00-00'),
(70, 'AWRS-1-X02.108', 'AWRS - Business Analyst', '0000-00-00', '0000-00-00'),
(71, 'AWRS-1-X02.108', 'AWRS - Lead Developer', '0000-00-00', '0000-00-00'),
(72, 'AWRS-1-X02.109', 'AWRS - Developer', '0000-00-00', '0000-00-00'),
(73, 'AWRS-1-X02.110', 'AWRS - Junior Developer', '0000-00-00', '0000-00-00'),
(74, 'AWRS-1-X02.110', 'AWRS - PMO', '0000-00-00', '0000-00-00'),
(75, 'AWRS-1-X02.406', 'AWRS - Lead Architect', '0000-00-00', '0000-00-00'),
(76, 'AWRS-1-P04.18', 'AWRS - NICE', '0000-00-00', '0000-00-00'),
(77, 'AWRS-1-P04.18', 'AWRS - Pegamento', '0000-00-00', '0000-00-00'),
(78, 'Ops-1-X02.105', 'Dev Ops - Project Manager', '0000-00-00', '0000-00-00'),
(79, 'Ops-1-X02.105', 'Dev Ops - Pegamento', '0000-00-00', '0000-00-00'),
(80, 'Ops-1-X02.105', 'Dev Ops - NICE', '0000-00-00', '0000-00-00'),
(81, 'SA303-1-X02.104', 'SA303 - Architect', '0000-00-00', '0000-00-00'),
(82, 'SA303-1-X02.105', 'SA303 - Project Manager', '0000-00-00', '0000-00-00'),
(83, 'SA303-1-X02.105', 'SA303 - Lead Business Analyst', '0000-00-00', '0000-00-00'),
(84, 'SA303-1-X02.106', 'SA303 - Techinical Engineer', '0000-00-00', '0000-00-00'),
(85, 'SA303-1-X02.107', 'SA303 - Scrum Master', '0000-00-00', '0000-00-00'),
(86, 'SA303-1-X02.108', 'SA303 - Business Analyst', '0000-00-00', '0000-00-00'),
(87, 'SA303-1-X02.108', 'SA303 - Lead Developer', '0000-00-00', '0000-00-00'),
(88, 'SA303-1-X02.109', 'SA303 - Developer', '0000-00-00', '0000-00-00'),
(89, 'SA303-1-X02.110', 'SA303 - Junior Developer', '0000-00-00', '0000-00-00'),
(90, 'SA303-1-X02.110', 'SA303 - PMO', '0000-00-00', '0000-00-00'),
(91, 'SA303-1-X02.406', 'SA303 - Lead Architect', '0000-00-00', '0000-00-00'),
(92, 'SA303-1-P04.18', 'SA303 - NICE', '0000-00-00', '0000-00-00'),
(93, 'SA303-1-P04.18', 'SA303 - Pegamento', '0000-00-00', '0000-00-00'),
(94, 'DODG-1-X02.104', 'DODG - Architect', '0000-00-00', '0000-00-00'),
(95, 'DODG-1-X02.105', 'DODG - Project Manager', '0000-00-00', '0000-00-00'),
(96, 'DODG-1-X02.105', 'DODG - Lead Business Analyst', '0000-00-00', '0000-00-00'),
(97, 'DODG-1-X02.106', 'DODG - Techinical Engineer', '0000-00-00', '0000-00-00'),
(98, 'DODG-1-X02.107', 'DODG - Scrum Master', '0000-00-00', '0000-00-00'),
(99, 'DODG-1-X02.108', 'DODG - Business Analyst', '0000-00-00', '0000-00-00'),
(100, 'DODG-1-X02.108', 'DODG - Lead Developer', '0000-00-00', '0000-00-00'),
(101, 'DODG-1-X02.109', 'DODG - Developer', '0000-00-00', '0000-00-00'),
(102, 'DODG-1-X02.110', 'DODG - Junior Developer', '0000-00-00', '0000-00-00'),
(103, 'DODG-1-X02.110', 'DODG - PMO', '0000-00-00', '0000-00-00'),
(104, 'DODG-1-X02.406', 'DODG - Lead Architect', '0000-00-00', '0000-00-00'),
(105, 'DODG-1-P04.18', 'DODG - NICE', '0000-00-00', '0000-00-00'),
(106, 'DODG-1-P04.18', 'DODG - Pegamento', '0000-00-00', '0000-00-00'),
(107, 'NRL-1-X02.104', 'NRL - Architect', '0000-00-00', '0000-00-00'),
(108, 'NRL-1-X02.105', 'NRL - Project Manager', '0000-00-00', '0000-00-00'),
(109, 'NRL-1-X02.105', 'NRL - Lead Business Analyst', '0000-00-00', '0000-00-00'),
(110, 'NRL-1-X02.106', 'NRL - Techinical Engineer', '0000-00-00', '0000-00-00'),
(111, 'NRL-1-X02.107', 'NRL - Scrum Master', '0000-00-00', '0000-00-00'),
(112, 'NRL-1-X02.108', 'NRL - Business Analyst', '0000-00-00', '0000-00-00'),
(113, 'NRL-1-X02.108', 'NRL - Lead Developer', '0000-00-00', '0000-00-00'),
(114, 'NRL-1-X02.109', 'NRL - Developer', '0000-00-00', '0000-00-00'),
(115, 'NRL-1-X02.110', 'NRL - Junior Developer', '0000-00-00', '0000-00-00'),
(116, 'NRL-1-X02.110', 'NRL - PMO', '0000-00-00', '0000-00-00'),
(117, 'NRL-1-X02.406', 'NRL - Lead Architect', '0000-00-00', '0000-00-00'),
(118, 'NRL-1-P04.18', 'NRL - NICE', '0000-00-00', '0000-00-00'),
(119, 'NRL-1-P04.18', 'NRL - Pegamento', '0000-00-00', '0000-00-00'),
(120, 'P50-1-X02.104', 'P50 - Architect', '0000-00-00', '0000-00-00'),
(121, 'P50-1-X02.105', 'P50 - Project Manager', '0000-00-00', '0000-00-00'),
(122, 'P50-1-X02.105', 'P50 - Lead Business Analyst', '0000-00-00', '0000-00-00'),
(123, 'P50-1-X02.106', 'P50 - Techinical Engineer', '0000-00-00', '0000-00-00'),
(124, 'P50-1-X02.107', 'P50 - Scrum Master', '0000-00-00', '0000-00-00'),
(125, 'NRL-1-X02.108', 'P50 - Business Analyst', '0000-00-00', '0000-00-00'),
(126, 'P50-1-X02.108', 'P50 - Lead Developer', '0000-00-00', '0000-00-00'),
(127, 'P50-1-X02.109', 'P50 - Developer', '0000-00-00', '0000-00-00'),
(128, 'P50-1-X02.110', 'P50 - Junior Developer', '0000-00-00', '0000-00-00'),
(129, 'P50-1-X02.110', 'P50 - PMO', '0000-00-00', '0000-00-00'),
(130, 'P50-1-X02.406', 'P50 - Lead Architect', '0000-00-00', '0000-00-00'),
(131, 'P50-1-P04.18', 'P50 - NICE', '0000-00-00', '0000-00-00'),
(132, 'P50-1-P04.18', 'P50 - Pegamento', '0000-00-00', '0000-00-00'),
(133, 'P87-1-X02.104', 'P87 - Architect', '0000-00-00', '0000-00-00'),
(134, 'P87-1-X02.105', 'P87 - Project Manager', '0000-00-00', '0000-00-00'),
(135, 'P87-1-X02.105', 'P87 - Lead Business Analyst', '0000-00-00', '0000-00-00'),
(136, 'P87-1-X02.106', 'P87 - Techinical Engineer', '0000-00-00', '0000-00-00'),
(137, 'P87-1-X02.107', 'P87 - Scrum Master', '0000-00-00', '0000-00-00'),
(138, 'P87-1-X02.108', 'P87 - Business Analyst', '0000-00-00', '0000-00-00'),
(139, 'P87-1-X02.108', 'P87 - Lead Developer', '0000-00-00', '0000-00-00'),
(140, 'P87-1-X02.109', 'P87 - Developer', '0000-00-00', '0000-00-00'),
(141, 'P87-1-X02.110', 'P87 - Junior Developer', '0000-00-00', '0000-00-00'),
(142, 'P87-1-X02.110', 'P87 - PMO', '0000-00-00', '0000-00-00'),
(143, 'P87-1-X02.406', 'P87 - Lead Architect', '0000-00-00', '0000-00-00'),
(144, 'P87-1-P04.18', 'P87 - NICE', '0000-00-00', '0000-00-00'),
(145, 'P87-1-P04.18', 'P87 - Pegamento', '0000-00-00', '0000-00-00'),
(146, 'R39-1-X02.104', 'R39 - Architect', '0000-00-00', '0000-00-00'),
(147, 'R39-1-X02.105', 'R39 - Project Manager', '0000-00-00', '0000-00-00'),
(148, 'R39-1-X02.105', 'R39 - Lead Business Analyst', '0000-00-00', '0000-00-00'),
(149, 'R39-1-X02.106', 'R39 - Techinical Engineer', '0000-00-00', '0000-00-00'),
(150, 'R39-1-X02.107', 'R39 - Scrum Master', '0000-00-00', '0000-00-00'),
(151, 'R39-1-X02.108', 'R39 - Business Analyst', '0000-00-00', '0000-00-00'),
(152, 'R39-1-X02.108', 'R39 - Lead Developer', '0000-00-00', '0000-00-00'),
(153, 'R39-1-X02.109', 'R39 - Developer', '0000-00-00', '0000-00-00'),
(154, 'R39-1-X02.110', 'R39 - Junior Developer', '0000-00-00', '0000-00-00'),
(155, 'R39-1-X02.110', 'R39 - PMO', '0000-00-00', '0000-00-00'),
(156, 'R39-1-X02.406', 'R39 - Lead Architect', '0000-00-00', '0000-00-00'),
(157, 'R39-1-P04.18', 'R39 - NICE', '0000-00-00', '0000-00-00'),
(158, 'R39-1-P04.18', 'R39 - Pegamento', '0000-00-00', '0000-00-00'),
(159, 'PTRLS-1-X02.406', 'PTRLS - Lead Architect', '0000-00-00', '0000-00-00'),
(160, 'PTRLS-1-P04.18', 'PT RLS - NICE', '0000-00-00', '0000-00-00'),
(161, 'Selecta-1-X02.104', 'Selecta Paste Notes - Architect', '0000-00-00', '0000-00-00'),
(162, 'Selecta-1-X02.105', 'Selecta Paste Notes  - Project Manager', '0000-00-00', '0000-00-00'),
(163, 'Selecta-1-X02.105', 'Selecta Paste Notes  - Lead Business Analyst', '0000-00-00', '0000-00-00'),
(164, 'Selecta-1-X02.106', 'Selecta Paste Notes  - Techinical Engineer', '0000-00-00', '0000-00-00'),
(165, 'Selecta-1-X02.107', 'Selecta Paste Notes  - Scrum Master', '0000-00-00', '0000-00-00'),
(166, 'Selecta-1-X02.108', 'Selecta Paste Notes  - Business Analyst', '0000-00-00', '0000-00-00'),
(167, 'Selecta-1-X02.108', 'Selecta Paste Notes  - Lead Developer', '0000-00-00', '0000-00-00'),
(168, 'Selecta-1-X02.109', 'Selecta Paste Notes  - Developer', '0000-00-00', '0000-00-00'),
(169, 'Selecta-1-X02.110', 'Selecta Paste Notes  - Junior Developer', '0000-00-00', '0000-00-00'),
(170, 'Selecta-1-X02.110', 'Selecta Paste Notes  - PMO', '0000-00-00', '0000-00-00'),
(171, 'Selecta-1-X02.406', 'Selecta Paste Notes  - Lead Architect', '0000-00-00', '0000-00-00'),
(172, 'Selecta-1-P04.18', 'Selecta Paste Notes  - NICE', '0000-00-00', '0000-00-00'),
(173, 'Selecta-1-P04.18', 'Selecta Paste Notes  - Pegamento', '0000-00-00', '0000-00-00'),
(174, 'CTF-1-X02.104', 'CTF Provider - Architect', '0000-00-00', '0000-00-00'),
(175, 'CTF-1-X02.105', 'CTF Provider - Project Manager', '0000-00-00', '0000-00-00'),
(176, 'CTF-1-X02.105', 'CTF Provider - Lead Business Analyst', '0000-00-00', '0000-00-00'),
(177, 'CTF-1-X02.106', 'CTF Provider - Techinical Engineer', '0000-00-00', '0000-00-00'),
(178, 'CTF-1-X02.107', 'CTF Provider - Scrum Master', '0000-00-00', '0000-00-00'),
(179, 'CTF-1-X02.108', 'CTF Provider - Business Analyst', '0000-00-00', '0000-00-00'),
(180, 'CTF-1-X02.108', 'CTF Provider - Lead Developer', '0000-00-00', '0000-00-00'),
(181, 'CTF-1-X02.109', 'CTF Provider - Developer', '0000-00-00', '0000-00-00'),
(182, 'CTF-1-X02.110', 'CTF Provider - Junior Developer', '0000-00-00', '0000-00-00'),
(183, 'CTF-1-X02.110', 'CTF Provider - PMO', '0000-00-00', '0000-00-00'),
(184, 'CTF-1-X02.406', 'CTF Provider - Lead Architect', '0000-00-00', '0000-00-00'),
(185, 'CTF-1-P04.18', 'CTF Provider - NICE', '0000-00-00', '0000-00-00'),
(186, 'CTF-1-P04.18', 'CTF Provider - Pegamento', '0000-00-00', '0000-00-00'),
(187, 'SSTTP-1-X02.104', 'SSTTP - Architect', '0000-00-00', '0000-00-00'),
(188, 'SSTTP-1-X02.105', 'SSTTP - Project Manager', '0000-00-00', '0000-00-00'),
(189, 'SSTTP-1-X02.105', 'SSTTP - Lead Business Analyst', '0000-00-00', '0000-00-00'),
(190, 'SSTTP-1-X02.106', 'SSTTP - Techinical Engineer', '0000-00-00', '0000-00-00'),
(191, 'SSTTP-1-X02.107', 'SSTTP - Scrum Master', '0000-00-00', '0000-00-00'),
(192, 'SSTTP-1-X02.108', 'SSTTP - Business Analyst', '0000-00-00', '0000-00-00'),
(193, 'SSTTP-1-X02.108', 'SSTTP - Lead Developer', '0000-00-00', '0000-00-00'),
(194, 'SSTTP-1-X02.109', 'SSTTP - Developer', '0000-00-00', '0000-00-00'),
(195, 'SSTTP-1-X02.110', 'SSTTP - Junior Developer', '0000-00-00', '0000-00-00'),
(196, 'SSTTP-1-X02.110', 'SSTTP - PMO', '0000-00-00', '0000-00-00'),
(197, 'SSTTP-1-X02.406', 'SSTTP - Lead Architect', '0000-00-00', '0000-00-00'),
(198, 'SSTTP-1-P04.18', 'SSTTP - NICE', '0000-00-00', '0000-00-00'),
(199, 'SSTTP-1-P04.18', 'SSTTP - Pegamento', '0000-00-00', '0000-00-00'),
(200, 'TC-1-X02.104', 'TC Dashboard - Architect', '0000-00-00', '0000-00-00'),
(201, 'TC-1-X02.105', 'TC Dashboard - Project Manager', '0000-00-00', '0000-00-00'),
(202, 'TC-1-X02.105', 'TC Dashboard - Lead Business Analyst', '0000-00-00', '0000-00-00'),
(203, 'TC-1-X02.106', 'TC Dashboard - Techinical Engineer', '0000-00-00', '0000-00-00'),
(204, 'TC-1-X02.107', 'TC Dashboard - Scrum Master', '0000-00-00', '0000-00-00'),
(205, 'TC-1-X02.108', 'TC Dashboard - Business Analyst', '0000-00-00', '0000-00-00'),
(206, 'TC-1-X02.108', 'TC Dashboard - Lead Developer', '0000-00-00', '0000-00-00'),
(207, 'TC-1-X02.109', 'TC Dashboard - Developer', '0000-00-00', '0000-00-00'),
(208, 'TC-1-X02.110', 'TC Dashboard - Junior Developer', '0000-00-00', '0000-00-00'),
(209, 'TC-1-X02.110', 'TC Dashboard - PMO', '0000-00-00', '0000-00-00'),
(210, 'TC-1-X02.406', 'TC Dashboard - Lead Architect', '0000-00-00', '0000-00-00'),
(211, 'TC-1-P04.18', 'TC Dashboard - NICE', '0000-00-00', '0000-00-00'),
(212, 'TC-1-P04.18', 'TC Dashboard - Pegamento', '0000-00-00', '0000-00-00'),
(213, 'TC-2-X02.104', 'Tax Credit Risk Dashboard - Architect', '0000-00-00', '0000-00-00'),
(214, 'TC-2-X02.105', 'Tax Credit Risk Dashboard - Project Manager', '0000-00-00', '0000-00-00'),
(215, 'TC-2-X02.105', 'Tax Credit Risk Dashboard - Lead Business Ana', '0000-00-00', '0000-00-00'),
(216, 'TC-2-X02.106', 'Tax Credit Risk Dashboard - Techinical Engine', '0000-00-00', '0000-00-00'),
(217, 'TC-2-X02.107', 'Tax Credit Risk Dashboard - Scrum Master', '0000-00-00', '0000-00-00'),
(218, 'TC-2-X02.108', 'Tax Credit Risk Dashboard - Business Analyst', '0000-00-00', '0000-00-00'),
(219, 'TC-2-X02.108', 'Tax Credit Risk Dashboard  - Lead Developer', '0000-00-00', '0000-00-00'),
(220, 'TC-2-X02.109', 'Tax Credit Risk Dashboard - Developer', '0000-00-00', '0000-00-00'),
(221, 'TC-2-X02.110', 'Tax Credit Risk Dashboard - Junior Developer', '0000-00-00', '0000-00-00'),
(222, 'TC-2-X02.110', 'Tax Credit Risk Dashboard - PMO', '0000-00-00', '0000-00-00'),
(223, 'TC-2-X02.406', 'Tax Credit Risk Dashboard - Lead Architect', '0000-00-00', '0000-00-00'),
(224, 'TC-2-P04.18', 'Tax Credit Risk Dashboard - NICE', '0000-00-00', '0000-00-00'),
(225, 'TC-2-P04.18', 'Tax Credit Risk Dashboard- Pegamento', '0000-00-00', '0000-00-00'),
(226, 'Tell Us-1-X02.104', 'Tell Us Bereavement - Architect', '0000-00-00', '0000-00-00'),
(227, 'Tell Us-1-X02.105', 'Tell Us Bereavement - Project Manager', '0000-00-00', '0000-00-00'),
(228, 'Tell Us-1-X02.105', 'Tell Us Bereavement - Lead Business Analyst', '0000-00-00', '0000-00-00'),
(229, 'Tell Us-1-X02.106', 'Tell Us Bereavement - Techinical Engineer', '0000-00-00', '0000-00-00'),
(230, 'Tell Us-1-X02.107', 'Tell Us Bereavement - Scrum Master', '0000-00-00', '0000-00-00'),
(231, 'Tell Us-1-X02.108', 'Tell Us Bereavement - Business Analyst', '0000-00-00', '0000-00-00'),
(232, 'Tell Us-1-X02.108', 'Tell Us Bereavement - Lead Developer', '0000-00-00', '0000-00-00'),
(233, 'Tell Us-1-X02.109', 'Tell Us Bereavement - Developer', '0000-00-00', '0000-00-00'),
(234, 'Tell Us-1-X02.110', 'Tell Us Bereavement - Junior Developer', '0000-00-00', '0000-00-00'),
(235, 'Tell Us-1-X02.110', 'Tell Us Bereavement - PMO', '0000-00-00', '0000-00-00'),
(236, 'Tell Us-1-X02.406', 'Tell Us Bereavement- Lead Architect', '0000-00-00', '0000-00-00'),
(237, 'Tell Us-1-P04.18', 'Tell Us Bereavement - NICE', '0000-00-00', '0000-00-00'),
(238, 'Tell Us-1-P04.18', 'Tell Us Bereavement - Pegamento', '0000-00-00', '0000-00-00'),
(239, 'WMI-1-X02.104', 'WMI iForms - Lead Architect', '0000-00-00', '0000-00-00'),
(240, 'WMI-1-P04.18', 'WMI iForms - NICE', '0000-00-00', '0000-00-00'),
(241, 'SA-1-X02.104', 'SA Dashboard - Architect', '0000-00-00', '0000-00-00'),
(242, 'SA-1-X02.105', 'SA Dashboard  - Project Manager', '0000-00-00', '0000-00-00'),
(243, 'SA-1-X02.105', 'SA Dashboard  - Lead Business Analyst', '0000-00-00', '0000-00-00'),
(244, 'SA-1-X02.106', 'SA Dashboard  - Techinical Engineer', '0000-00-00', '0000-00-00'),
(245, 'SA-1-X02.107', 'SA Dashboard  - Scrum Master', '0000-00-00', '0000-00-00'),
(246, 'SA-1-X02.108', 'SA Dashboard  - Business Analyst', '0000-00-00', '0000-00-00'),
(247, 'SA-1-X02.108', 'SA Dashboard  - Lead Developer', '0000-00-00', '0000-00-00'),
(248, 'SA-1-X02.109', 'SA Dashboard  - Developer', '0000-00-00', '0000-00-00'),
(249, 'SA-1-X02.110', 'SA Dashboard  - Junior Developer', '0000-00-00', '0000-00-00'),
(250, 'SA-1-X02.110', 'SA Dashboard  - PMO', '0000-00-00', '0000-00-00'),
(251, 'SA-1-X02.406', 'SA Dashboard  - Lead Architect', '0000-00-00', '0000-00-00'),
(252, 'SA-1-P04.18', 'SA Dashboard  - NICE', '0000-00-00', '0000-00-00'),
(253, 'SA-P04.18', 'SA Dashboard  - Pegamento', '0000-00-00', '0000-00-00'),
(254, 'SA-2-X02.104', 'SA Peak - Architect', '0000-00-00', '0000-00-00'),
(255, 'SA-2-X02.105', 'SA Peak - Project Manager', '0000-00-00', '0000-00-00'),
(256, 'SA-2-X02.105', 'SA Peak - Lead Business Analyst', '0000-00-00', '0000-00-00'),
(257, 'SA-2-X02.106', 'SA Peak - Techinical Engineer', '0000-00-00', '0000-00-00'),
(258, 'SA-X02.107', 'SA Peak - Scrum Master', '0000-00-00', '0000-00-00'),
(259, 'SA-2-X02.108', 'SA Peak - Business Analyst', '0000-00-00', '0000-00-00'),
(260, 'SA-2-X02.108', 'SA Peak - Lead Developer', '0000-00-00', '0000-00-00'),
(261, 'SA-2-X02.109', 'SA Peak - Developer', '0000-00-00', '0000-00-00'),
(262, 'SA-2-X02.110', 'SA Peak - Junior Developer', '0000-00-00', '0000-00-00'),
(263, 'SA-2-X02.110', 'SA Peak - PMO', '0000-00-00', '0000-00-00'),
(264, 'SA-2-X02.406', 'SA Peak - Lead Architect', '0000-00-00', '0000-00-00'),
(265, 'SA-2-P04.18', 'SA Peak - NICE', '0000-00-00', '0000-00-00'),
(266, 'SA-2-P04.18', 'SA Peak- Pegamento', '0000-00-00', '0000-00-00'),
(267, 'SA3-X02.105', 'SA Incomapatibles - ESPM', '0000-00-00', '0000-00-00'),
(268, 'DMS-1-X02.104', 'DMS-EF - Architect', '0000-00-00', '0000-00-00'),
(269, 'DMS-1-X02.105', 'DMS-EF - Project Manager', '0000-00-00', '0000-00-00'),
(270, 'DMS-1-X02.105', 'DMS-EF - Lead Business Analyst', '0000-00-00', '0000-00-00'),
(271, 'DMS-1-X02.106', 'DMS-EF - Techinical Engineer', '0000-00-00', '0000-00-00'),
(272, 'DMS-1-X02.107', 'DMS-EF - Scrum Master', '0000-00-00', '0000-00-00'),
(273, 'DMS-1-X02.108', 'DMS-EF - Business Analyst', '0000-00-00', '0000-00-00'),
(274, 'DMS-1-X02.108', 'DMS-EF - Lead Developer', '0000-00-00', '0000-00-00'),
(275, 'DMS-X02.109', 'DMS-EF - Developer', '0000-00-00', '0000-00-00'),
(276, 'DMS-1-X02.110', 'DMS-EF - Junior Developer', '0000-00-00', '0000-00-00'),
(277, 'DMS-1-X02.110', 'DMS-EF - PMO', '0000-00-00', '0000-00-00'),
(278, 'DMS-1-X02.406', 'DMS-EF - Lead Architect', '0000-00-00', '0000-00-00'),
(279, 'DMS-1-P04.18', 'DMS-EF - NICE', '0000-00-00', '0000-00-00'),
(280, 'DMS-1-P04.18', 'DMS-EF - Pegamento', '0000-00-00', '0000-00-00'),
(281, 'C18-1-X02.104', 'C18 Automation - Architect', '0000-00-00', '0000-00-00'),
(282, 'C18-1-X02.105', 'C18 Automation - Project Manager', '0000-00-00', '0000-00-00'),
(283, 'C18-1-X02.105', 'C18 Automation - Lead Business Analyst', '0000-00-00', '0000-00-00'),
(284, 'C18-1-X02.106', 'C18 Automation - Techinical Engineer', '0000-00-00', '0000-00-00'),
(285, 'C18-1-X02.107', 'C18 Automation - Scrum Master', '0000-00-00', '0000-00-00'),
(286, 'C18-1-X02.108', 'C18 Automation - Business Analyst', '0000-00-00', '0000-00-00'),
(287, 'C18-1-X02.108', 'C18 Automation - Lead Developer', '0000-00-00', '0000-00-00'),
(288, 'C18-1-X02.109', 'C18 Automation - Developer', '0000-00-00', '0000-00-00'),
(289, 'C18-1-X02.110', 'C18 Automation - Junior Developer', '0000-00-00', '0000-00-00'),
(290, 'C18-1-X02.110', 'C18 Automation - PMO', '0000-00-00', '0000-00-00'),
(291, 'C18-1-X02.406', 'C18 Automation - Lead Architect', '0000-00-00', '0000-00-00'),
(292, 'C18-1-P04.18', 'C18 Automation - NICE', '0000-00-00', '0000-00-00'),
(293, 'C18-1-P04.18', 'C18 Automation - Pegamento', '0000-00-00', '0000-00-00'),
(294, 'ADC-1-X02.104', 'ADC Infrastructure Support - Architect', '0000-00-00', '0000-00-00'),
(295, 'ADC-1-X02.106', 'ADC Infrastructure Support - Techinical Engin', '0000-00-00', '0000-00-00'),
(296, 'ADC-1-X02.406', 'ADC Infrastructure Support - Lead Architect', '0000-00-00', '0000-00-00'),
(297, 'CS-1-X02.104', 'CS Change Support - Architect', '0000-00-00', '0000-00-00'),
(298, 'CS-1-X02.105', 'CS Change Support - Project Manager', '0000-00-00', '0000-00-00'),
(299, 'CS-1-X02.106', 'CS Change Support - Techinical Engineer', '0000-00-00', '0000-00-00'),
(300, 'CS-1-X02.406', 'CS Change Support - Lead Architect', '0000-00-00', '0000-00-00'),
(301, 'AIA-1-X02.104', 'AIA - Architect', '0000-00-00', '0000-00-00'),
(302, 'AIA-1-X02.105', 'AIA - Project Manager', '0000-00-00', '0000-00-00'),
(303, 'AIA-1-X02.105', 'AIA - Lead Business Analyst', '0000-00-00', '0000-00-00'),
(304, 'AIA-1-X02.106', 'AIA - Techinical Engineer', '0000-00-00', '0000-00-00'),
(305, 'AIA-1-X02.107', 'AIA - Scrum Master', '0000-00-00', '0000-00-00'),
(306, 'AIA-1-X02.108', 'AIA - Business Analyst', '0000-00-00', '0000-00-00'),
(307, 'AIA-1-X02.108', 'AIA - Lead Developer', '0000-00-00', '0000-00-00'),
(308, 'AIA-1-X02.109', 'AIA - Developer', '0000-00-00', '0000-00-00'),
(309, 'AIA-1-X02.110', 'AIA - Junior Developer', '0000-00-00', '0000-00-00'),
(310, 'AIA-1-X02.110', 'AIA - PMO', '0000-00-00', '0000-00-00'),
(311, 'AIA-1-X02.406', 'AIA - Lead Architect', '0000-00-00', '0000-00-00'),
(312, 'AIA-1-P04.18', 'AIA - NICE', '0000-00-00', '0000-00-00'),
(313, 'AIA-1-P04.18', 'AIA - Pegamento', '0000-00-00', '0000-00-00'),
(314, 'Emp-1-P04.18', 'Emp Reg - NICE', '0000-00-00', '0000-00-00'),
(315, 'CHSO-1-X02.104', 'Company House Shrike Off - Architect', '0000-00-00', '0000-00-00'),
(316, 'CHSO-1-X02.105', 'Company House Shrike Off - Project Manager', '0000-00-00', '0000-00-00'),
(317, 'CHSO-1-X02.105', 'Company House Shrike Off - Lead Business Anal', '0000-00-00', '0000-00-00'),
(318, 'CHSO-1-X02.106', 'Company House Shrike Off - Techinical Enginee', '0000-00-00', '0000-00-00'),
(319, 'CHSO-1-X02.107', 'Company House Shrike Off - Scrum Master', '0000-00-00', '0000-00-00'),
(320, 'CHSO-1-X02.108', 'Company House Shrike Off - Business Analyst', '0000-00-00', '0000-00-00'),
(321, 'CHSO-1-X02.108', 'Company House Shrike Off - Lead Developer', '0000-00-00', '0000-00-00'),
(322, 'CHSO-1-X02.109', 'Company House Shrike Off - Developer', '0000-00-00', '0000-00-00'),
(323, 'CHSO-1-X02.110', 'Company House Shrike Off - Junior Developer', '0000-00-00', '0000-00-00'),
(324, 'CHSO-1-X02.110', 'Company House Shrike Off - PMO', '0000-00-00', '0000-00-00'),
(325, 'CHSO-1-X02.406', 'Company House Shrike Off - Lead Architect', '0000-00-00', '0000-00-00'),
(326, 'CHSO-1-P04.18', 'Company House Shrike Off - NICE', '0000-00-00', '0000-00-00'),
(327, 'CHSO-1-P04.18', 'Company House Shrike Off - Pegamento', '0000-00-00', '0000-00-00'),
(328, 'TES-1-X02.105', 'TES - ESPM', '0000-00-00', '0000-00-00'),
(329, 'TES-1-P04.18', 'TES - NICE', '0000-00-00', '0000-00-00'),
(330, 'HRSS-1-X02.104', 'HRSS JRP - Architect', '0000-00-00', '0000-00-00'),
(331, 'HRSS-1-X02.105', 'HRSS JRP - Project Manager', '0000-00-00', '0000-00-00'),
(332, 'HRSS-1-X02.105', 'HRSS JRP - Lead Business Analyst', '0000-00-00', '0000-00-00'),
(333, 'HRSS-1-X02.106', 'HRSS JRP - Techinical Engineer', '0000-00-00', '0000-00-00'),
(334, 'HRSS-1-X02.107', 'HRSS JRP - Scrum Master', '0000-00-00', '0000-00-00'),
(335, 'HRSS-1-X02.108', 'HRSS JRP - Business Analyst', '0000-00-00', '0000-00-00'),
(336, 'HRSS-1-X02.108', 'HRSS JRP - Lead Developer', '0000-00-00', '0000-00-00'),
(337, 'HRSS-1-X02.109', 'HRSS JRP - Developer', '0000-00-00', '0000-00-00'),
(338, 'HRSS-1-X02.110', 'HRSS JRP - Junior Developer', '0000-00-00', '0000-00-00'),
(339, 'HRSS-1-X02.110', 'HRSS JRP - PMO', '0000-00-00', '0000-00-00'),
(340, 'HRSS-1-X02.406', 'HRSS JRP - Lead Architect', '0000-00-00', '0000-00-00'),
(341, 'HRSS-1-P04.18', 'HRSS JRP - NICE', '0000-00-00', '0000-00-00'),
(342, 'HRSS-1-P04.18', 'HRSS JRP - Pegamento', '0000-00-00', '0000-00-00'),
(343, 'UN-1-X02.104', 'Unallocated - Architect', '0000-00-00', '0000-00-00'),
(344, 'UN-1-X02.105', 'Unallocated - Project Manager', '0000-00-00', '0000-00-00'),
(345, 'UN-1-X02.105', 'Unallocated - Lead Business Analyst', '0000-00-00', '0000-00-00'),
(346, 'UN-1-X02.106', 'Unallocated - Techinical Engineer', '0000-00-00', '0000-00-00'),
(347, 'UN-1-X02.107', 'Unallocated - Scrum Master', '0000-00-00', '0000-00-00'),
(348, 'UN-1-X02.108', 'Unallocated - Business Analyst', '0000-00-00', '0000-00-00'),
(349, 'UN-1-X02.108', 'Unallocated - Lead Developer', '0000-00-00', '0000-00-00'),
(350, 'UN-1-X02.109', 'Unallocated - Developer', '0000-00-00', '0000-00-00'),
(351, 'UN-1-X02.110', 'Unallocated - Junior Developer', '0000-00-00', '0000-00-00'),
(352, 'UN-1-X02.110', 'Unallocated - PMO', '0000-00-00', '0000-00-00'),
(353, 'UN-1-X02.406', 'Unallocated - Lead Architect', '0000-00-00', '0000-00-00'),
(354, 'UN-1-P04.18', 'Unallocated - NICE', '0000-00-00', '0000-00-00'),
(355, 'UN-1-P04.18', 'Unallocated - Pegamento', '0000-00-00', '0000-00-00'),
(356, 'VAT-1-X02.108', 'Vat Reg/DeReg - Business Analyst', '0000-00-00', '0000-00-00');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE IF NOT EXISTS `roles` (
  `Role_ID` int(11) NOT NULL,
  `Role_Name` varchar(45) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`Role_ID`, `Role_Name`) VALUES
(1, 'Standard'),
(2, 'Admin');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `User_ID` int(11) NOT NULL,
  `Username` varchar(45) NOT NULL,
  `Role_ID` int(11) NOT NULL,
  `Passwd` char(128) NOT NULL,
  `Name` varchar(45) NOT NULL,
  `Assigned_Projects` varchar(150) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=132 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`User_ID`, `Username`, `Role_ID`, `Passwd`, `Name`, `Assigned_Projects`) VALUES
(92, 'dom', 2, 'EE26B0DD4AF7E749AA1A8EE3C10AE9923F618980772E473F8819A5D4940E0DB27AC185F8A0E1D5F84F88BC887FD67B143732C304CC5FA9AD8E6F57F50028A8FF', 'dom', '1'),
(93, '273300', 1, '436f0dd71825e877f4dee2c920a63bf7b59d1ae24345e6fb431a11ed35f0b2e141e0291772a83998a59df51d5eee515a7f954b06f07d5074c25b4ba27e0125d6', 'Srinivasan, Ramaswamy', '1,2,5,9'),
(94, '323235', 1, '5798e9614bb9c63d60b8e174708108c5423c73d3705244702ba800942ccce9c37fdda4df2ce499e58852efbf9b4a1f39cffe935f039d88a4572073c5eae53921', 'Hall, Chris', '81,94,133,146,239,281,294,297,343'),
(95, '280903', 1, 'bf63ac62f86d3312caa5448292970bca1b6daf195df2a0c392cc2305e290ebb743e99005e992a27c6bb5560ea2012632e89175a2d2a40c9f29ad0222c6fe5d22', 'Haslam, Joe', '26,226,294,297,301,330,343'),
(96, 'FG1080058', 1, '5cecb63d6e16b5ff3812bfd6cce16655dffb428221bf7bab2ee1349ba8e279c43e83431d60ae1e1f218786711391ed945dc878dab79c6f98d62509b67fecde92', 'Bassi, Harj', '27,40,201'),
(97, '279856', 1, 'e14ada1f81ccd743d5763c68d3b66f53a3b263334388039353c524781c3b7104b7659a60cf18b1c3980b2a2bcd0cc2acbcf092989b22a986469fbb321c9330de', 'Halford, Ashley', '82,108,121,214,282,331'),
(98, 'FG523117', 1, '1df354b87fbf3060299591d349b31b8c69741b8e77bac2e3367e874f8b0eb89d79056bb82d82229b693d79ea4127743c131c6dbb99d5c6be45ae85ad1f648868', 'Higgins, Mark', '95,175,201,227'),
(99, '281389', 1, '978027dea3fb6f6db72866404c894f22352341fc33870697ffbf275ead606f17e7e618ff11e59a7596c495480bbad69444a702fdd47e70608ed600e85704aa09', 'Illingworth, Sam', '27,40,66,78,302'),
(100, '391281', 1, '239391137dcecffc6123beb8cf5743c86c271919535fa03b9669304063da4f38bfbcbcacf09b11715648ab53de9c477d07963ba6f35846f08d5fcb1a990c9088', 'James, Bryan', '134,147,255,269'),
(101, '323227', 1, 'e5c39411cb607fcc311847ef389e51e4c6a5d85b8d4043a0c753677ef59f70d43755233be44382857fffa9ceb54618d5d0eb737cd339295b0476de3620d84c3f', 'Pye, Kevin', '66,82,162,298'),
(102, '274062', 1, 'aaca95c8d2a5484c938ba4101d52a24a3441f6b90e916fe31b11001682f52759ffffb7b0ef01a432a2ee6ae6c45b9a5b5eccebdc6794e6b34770a1f9aab746b8', 'Roberts, Tony', '267,328'),
(103, '268814', 1, '8948ff1be33faf44b57ba3d7d670e62b35ed658c61a347513388ba6dd4cbe00e31683e4285ccd1c8bd3e0fdbc8c3c720419539b00318ba32631e5ec7a701f84b', 'Illingworth, Jason', '136,149,295,299'),
(104, '334829', 1, 'f1b95e1ba7d16d1e1cea8ecc81bc17166919ee0f46641db61a3ada8eb557efc07bf1526a76afe0f7e242b756ad2c0cfe1b2c2459179e51d4b89e30cf7146469f', 'Treharne, Tim', '136,149,295,299'),
(105, 'FG1149364', 1, '8ab886cbe089d8c840d5676b19822ececca60250f12abff35e33e027303dea343c27c427488ee876ddc2dfb2ce12443deccc3e12da8e742db516cb24defd19da', 'Bayode, Victor', '69,85,165'),
(106, 'FG1087917', 1, 'c69a80469bb7096bfb209254354fa37a86fef59ef49c8e91073204f05d0481fc009b7ab82b91b0af63de4f594976c706913e7617a19e044dc054915e1a27c555', 'Kusamotu, Tolu', '30,43,124,137,204,305,334'),
(107, 'FG1162989', 1, '0cd83e31240e107d3386036f1938bc4033f5cdf46c50db49a2455073ed8e3cb7bfda90de88c485580f936735825bb2025b689cfc83b02fdf5d4780eaa44b0589', 'Monplaisir, Frederick', '98,150,230,272'),
(108, '284658', 1, 'de0efb1d9661ec2540a5993cba1829462b246e2adf05939e327852210dc7b5dfd114447d81f6cf0e962611e86a2413ca911604152bdb824805e4f85c2ef0b9d3', 'Corcoran,  Alex', NULL),
(109, '284431', 1, 'ffb28bac78bb3b0b16ac26deff898d88863ff987673ea1fccc38506d35b2d697963cb9fe6b8c5f4b7b34f3e7140de47012895bf410e95a919aa94a6b2eda868e', 'Duncan Stewart, Ethan', '10,151'),
(110, '284405', 1, '10f53c6c797e8a9f0edffd12b15d300307f4d1bed8ed379a5ce4737824058a309bbf540a02482f8f5058f019bad87336d97e43d64c31aba3e36218a995ab8202', 'Fazal, Zubair', '112,306'),
(111, '286451', 1, '43f32a36e1c4eb9f9b5a010fbe5894394ffc9d6ee27c72a22271d862f30faa69b22d26a432a0237738fd91b2d2666bef658cb1c0fde16d6acaa290803f1ba98e', 'Ironmonger, Anthony', '286'),
(112, 'FG1118719', 1, '18365191fdc1ed6e0eaa2497b357f66c47de5a14774e91589610536c99f0758f243d3083e869bad87aedd646e31cdbf4e5ee7c8e52e7e6353a8765a819c2e413', 'Maddocks, Jessica', '126,286'),
(113, 'FG1136348', 1, 'ce2fb0cf055e555c1030f232db52fb78d7a967ed2f4805e431d55483e7bf2f00231d988bc21693f459c05cbe702df0ec9fd4975d2ed945d839164261381669b9', 'Masoeu, Charmaine', '112,306,320'),
(114, '281747', 1, 'f6d996fa9c8c77e45a06aeb352298135064d9e1bc406a422f3a81b49abd59cf0af6b9db0a30e2e24ec7937b9f765f78b2dad1e187cb3d25f4b629d1e8444188d', 'McGeachy, Ben', '10'),
(115, 'FG1146417', 1, '6aab8cd5dbbcf5654d82d075a2b14362dc3e8ba3b78d6393e0718e6ec68e642dda9ef22c37b79244a384405cfc9879e5e51e75c874aa352521f8fae8fc37410f', 'Parma, Elizabeth', '86,99'),
(116, '284391', 1, '937c243f086903b65880a06f3f3ec1d87fab9883ad33af695d46bfdef47a1b0df1c064275bba3beb38770e9210a27dd8558f5bf4ecaec10160d0a74fdb185130', 'Olaru, Ana', '231,273'),
(117, 'FG1084032', 1, '5d54e87c7f53b0d213f33fe86ef42a4b76b38b543b3e11cd1678a1e2fd966c3a5d1b3fd0a8ae733d2a585ab3fa8a4c1637b4e58074e5ee2f0eb2b92d6044800d', 'Omokaro, Osagie', '138,335'),
(118, '272432', 1, 'c8177172a42b44949f5a96b295d0f7c8c8535c2fbf8ced89bbc4db3c858f9fa5f401a28aed2b3bba61a7f765343a9ca2be78e2aad718087f5ae16c56eb4af443', 'Simmonds, David', '218'),
(119, '285609', 1, '7b8f0c7751e1f5c61f565cf359302ea0a7773e90c869f11eb3339bcbdc52b5709aeab3085abbf8c34653b228110129893a47ce8929b0ca60cdef688eea43d2af', 'Woollaston, Duncan', '70,166'),
(120, '286329', 1, '9d9e59a1df51579eb2b00fa8156dbda79ef714056d27e758e948e45231f594624e98026c6a0ad614bfc9482fffb4c7ede45d3b723d25223dd7359ce71f0e0f70', 'Bahra, Kiran', '33,46'),
(121, '286314', 1, '9d5c23de1cf3e763578cab6ea8a3dffc98d9c6d137d0b7a850e5c402f62b283cc53fa1d1382dae51a770caeeb9438fbd7a1e781f246fdabb8f1c54169d1c1827', 'Gibbons, Rachael', '72,168'),
(122, 'FG1186812', 1, 'd2f02a868af4373ba355e3cae6154830bc85626d3299c72ae85d6af2129993ad1998be8388c00469cc51750644cb03d5aca25f9dc44d43d2088fe9ce674d6e67', 'Livingstone, Alastair', '101'),
(123, 'FG1118716', 1, '468407ad8cd3608eca72bdfb737d80d5fee0d0fc010daf638e5e0459acf00daad5f7886b3d15c187473c5dca60f6d5a63eadbb433b55cf5ff02430abd56cce5f', 'Miah, Mohammed', '181,275'),
(124, 'FG1118718', 1, 'c50cf4c6fec5566776c0fee4a647cdc903bd3102182e1bfa0e2659775fd40269db50846f69348abd821aceb232df05e28de2273f988bd17c27582a5337063288', 'Orme, Nathan', '127,288'),
(125, '376571', 2, '34c45f5dc3ff1a20348182fb08b16ab8396aebbf6c128e0ea1355a595493e969f2c1bb96a8d5b9fe9d88e0102f0b34b3021c7b7d19d5c524a9fae9b06ed88a85', 'Behnke, Jean', '11,34,47,73,89,102,128,141,169,221,234,276,289,309,338'),
(126, '286928', 1, '0fa5dedd0a7b3e593be357a966e78c8880d1a883fa418448e098188942e4e4ef328067fddba4303e3aacb1482e9cf42cef24c6d20a74cada0c94963cb3793bf2', 'Morrison, Alex', NULL),
(127, '277443', 1, '50de45ee1c91574dd1a49bd1c1b53ca3014b51a38f0666a9e54fb72b3c12c48e45c0997ca00db4b4eb3e0397053920270ae837aa2183594fdb64cb903d036c43', 'Dhanjal, Raj', '12,36,49,91,104,117,159,259,296,300'),
(128, '285803', 1, 'cf259a349cb3e9b0d9b7edf1fc57b1cfbb619ac853f5f75585d50891008a1f8e45b0b829aedb5cd7d462dc3781aaca3ab5d1245a5f69a08e3c07813005804b5c', 'Moulton, Tristram', NULL),
(129, 'ETR1289', 1, 'cc17da3238479235a3843c19784f71dc65a15550f03963652828e6166854edc06a27e9314bdd1bfa3a9bd82a4f91be236610705c8a459d0904f38eb64396dafa', 'NICE', '160,240,329'),
(130, 'ETR1292', 1, '46774ceb30e28f626124a5a846164a50a096bbf666c42a4fa9aeab6554ae5e9c8981d784b1027527e5aca75b3b65c75898dc5f03dcde3f32c4e52b08d0445087', 'Pegamento', '50,78,92,105,172,211,237,279'),
(131, 'dom2', 2, '6d201beeefb589b08ef0672dac82353d0cbd9ad99e1642c83a1601f3d647bcca003257b5e8f31bdc1d73fbec84fb085c79d6e2677b7ff927e823a54e789140d9', 'dom2', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `weeks`
--

CREATE TABLE IF NOT EXISTS `weeks` (
  `Week_ID` int(11) NOT NULL,
  `Monday_Date` date NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=113 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `weeks`
--

INSERT INTO `weeks` (`Week_ID`, `Monday_Date`) VALUES
(1, '2017-05-01'),
(2, '2017-05-01'),
(3, '2017-05-01'),
(4, '2017-05-08'),
(5, '2017-05-15'),
(6, '2017-05-22'),
(7, '2017-05-29'),
(8, '2017-06-05'),
(9, '2017-06-12'),
(10, '2017-06-19'),
(11, '2017-06-26'),
(12, '2017-07-03'),
(13, '2017-07-10'),
(14, '2017-07-17'),
(15, '2017-07-24'),
(16, '2017-07-31'),
(17, '2017-08-07'),
(18, '2017-08-14'),
(19, '2017-08-21'),
(20, '2017-08-28'),
(21, '2017-09-04'),
(22, '2017-09-11'),
(23, '2017-09-18'),
(24, '2017-09-25'),
(25, '2017-10-02'),
(26, '2017-10-09'),
(27, '2017-10-16'),
(28, '2017-10-23'),
(29, '2017-10-30'),
(30, '2017-11-06'),
(31, '2017-11-13'),
(32, '2017-11-20'),
(33, '2017-11-27'),
(34, '2017-12-04'),
(35, '2017-12-11'),
(36, '2017-12-18'),
(37, '2017-12-25'),
(38, '2018-01-01'),
(39, '2018-01-08'),
(40, '2018-01-15'),
(41, '2018-01-22'),
(42, '2018-01-29'),
(43, '2018-02-05'),
(44, '2018-02-12'),
(45, '2018-02-19'),
(46, '2018-02-26'),
(47, '2018-03-05'),
(48, '2018-03-12'),
(49, '2018-03-19'),
(50, '2018-03-26'),
(51, '2018-04-02'),
(52, '2018-04-09'),
(53, '2018-04-16'),
(54, '2018-04-23'),
(55, '2018-04-30'),
(56, '2018-05-07'),
(57, '2018-05-14'),
(58, '2018-05-21'),
(59, '2018-05-28'),
(60, '2018-06-04'),
(61, '2018-06-11'),
(62, '2018-06-18'),
(63, '2018-06-25'),
(64, '2018-07-02'),
(65, '2018-07-09'),
(66, '2018-07-16'),
(67, '2018-07-23'),
(68, '2018-07-30'),
(69, '2018-08-06'),
(70, '2018-08-13'),
(71, '2018-08-20'),
(72, '2018-08-27'),
(73, '2018-09-03'),
(74, '2018-09-10'),
(75, '2018-09-17'),
(76, '2018-09-24'),
(77, '2018-10-01'),
(78, '2018-10-08'),
(79, '2018-10-15'),
(80, '2018-10-22'),
(81, '2018-10-29'),
(82, '2018-11-05'),
(83, '2018-11-12'),
(84, '2018-11-19'),
(85, '2018-11-26'),
(86, '2018-12-03'),
(87, '2018-12-10'),
(88, '2018-12-17'),
(89, '2018-12-24'),
(90, '2018-12-31'),
(91, '2019-01-07'),
(92, '2019-01-14'),
(93, '2019-01-21'),
(94, '2019-01-28'),
(95, '2019-02-04'),
(96, '2019-02-11'),
(97, '2019-02-18'),
(98, '2019-02-25'),
(99, '2019-03-04'),
(100, '2019-03-11'),
(101, '2019-03-18'),
(102, '2019-03-25'),
(103, '2019-03-25'),
(104, '2019-04-01'),
(105, '2019-04-08'),
(106, '2019-04-15'),
(107, '2019-04-22'),
(108, '2019-04-29'),
(109, '2019-05-06'),
(110, '2019-05-13'),
(111, '2019-05-20'),
(112, '2019-05-27');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bookings`
--
ALTER TABLE `bookings`
  ADD PRIMARY KEY (`Booking_ID`);

--
-- Indexes for table `projects`
--
ALTER TABLE `projects`
  ADD PRIMARY KEY (`Project_ID`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`Role_ID`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`User_ID`);

--
-- Indexes for table `weeks`
--
ALTER TABLE `weeks`
  ADD PRIMARY KEY (`Week_ID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `bookings`
--
ALTER TABLE `bookings`
  MODIFY `Booking_ID` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=63;
--
-- AUTO_INCREMENT for table `projects`
--
ALTER TABLE `projects`
  MODIFY `Project_ID` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=357;
--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `Role_ID` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `User_ID` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=132;
--
-- AUTO_INCREMENT for table `weeks`
--
ALTER TABLE `weeks`
  MODIFY `Week_ID` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=113;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
