-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 02, 2019 at 12:44 PM
-- Server version: 10.1.37-MariaDB
-- PHP Version: 7.2.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `inventory`
--

-- --------------------------------------------------------

--
-- Table structure for table `fooditems`
--

CREATE TABLE `fooditems` (
  `MID` int(11) NOT NULL,
  `Quantity` int(11) NOT NULL,
  `FID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `fooditems`
--

INSERT INTO `fooditems` (`MID`, `Quantity`, `FID`) VALUES
(1, 4, 1),
(1, 2, 2),
(2, 2, 1),
(2, 7, 2),
(2, 1, 3),
(3, 2, 3),
(4, 3, 2),
(5, 2, 1),
(4, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `menu`
--

CREATE TABLE `menu` (
  `MID` int(11) NOT NULL,
  `Name` varchar(50) NOT NULL,
  `V_NV` varchar(50) NOT NULL,
  `Price` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `menu`
--

INSERT INTO `menu` (`MID`, `Name`, `V_NV`, `Price`) VALUES
(1, 'Burger', 'V', 120),
(2, 'Pizza', 'NV', 200),
(3, 'Fries', 'V', 80),
(4, 'MilkShake', 'V', 180),
(5, 'Brownie', 'NV', 150);

-- --------------------------------------------------------

--
-- Table structure for table `ordermenu`
--

CREATE TABLE `ordermenu` (
  `OID` int(11) NOT NULL,
  `MID` int(11) NOT NULL,
  `Mname` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ordermenu`
--

INSERT INTO `ordermenu` (`OID`, `MID`, `Mname`) VALUES
(9, 2, 'Pizza'),
(10, 1, 'Burger');

-- --------------------------------------------------------

--
-- Table structure for table `stock`
--

CREATE TABLE `stock` (
  `FID` int(11) NOT NULL,
  `Fname` varchar(50) NOT NULL,
  `Available` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `stock`
--

INSERT INTO `stock` (`FID`, `Fname`, `Available`) VALUES
(1, 'tomato', 5),
(2, 'potato', 1),
(3, 'beet', 3),
(4, 'milk', 7),
(5, 'cheese', 19),
(7, 'milk', 7),
(8, 'cheese', 19),
(9, 'milk', 7),
(10, 'cheese', 19),
(11, 'milk', 7),
(12, 'cheese', 19);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `uid` int(11) NOT NULL,
  `uname` varchar(50) NOT NULL,
  `pass` varchar(50) NOT NULL,
  `role` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`uid`, `uname`, `pass`, `role`) VALUES
(1, 'kareena', 'kar123', 'manager'),
(2, 'manasvi', 'man123', 'stock'),
(3, 'janice', 'jan123', 'manager'),
(4, 'kjhgfx', 'ljhghf', 'stock'),
(7, 'kjhgfx', 'ljhghf', 'manager'),
(8, 'lkjhgfdg', 'jhg', 'stock'),
(9, 'gfgdf', 'knjhgfd', 'stock'),
(10, 'hanc9e', 'kjsd', 'manager'),
(11, 'mjhfgd', 'hgfhdtq', 'manager');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `fooditems`
--
ALTER TABLE `fooditems`
  ADD KEY `menu` (`MID`),
  ADD KEY `quantity` (`FID`);

--
-- Indexes for table `menu`
--
ALTER TABLE `menu`
  ADD PRIMARY KEY (`MID`);

--
-- Indexes for table `ordermenu`
--
ALTER TABLE `ordermenu`
  ADD PRIMARY KEY (`OID`);

--
-- Indexes for table `stock`
--
ALTER TABLE `stock`
  ADD PRIMARY KEY (`FID`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`uid`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `menu`
--
ALTER TABLE `menu`
  MODIFY `MID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `ordermenu`
--
ALTER TABLE `ordermenu`
  MODIFY `OID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `stock`
--
ALTER TABLE `stock`
  MODIFY `FID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `uid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `fooditems`
--
ALTER TABLE `fooditems`
  ADD CONSTRAINT `menu` FOREIGN KEY (`MID`) REFERENCES `menu` (`MID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `quantity` FOREIGN KEY (`FID`) REFERENCES `stock` (`FID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
