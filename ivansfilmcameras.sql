-- phpMyAdmin SQL Dump
-- version 4.4.15.10
-- https://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Mar 20, 2020 at 09:37 PM
-- Server version: 5.5.64-MariaDB
-- PHP Version: 5.4.16

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ivansfilmcameras`
--

-- --------------------------------------------------------

--
-- Table structure for table `Acquisitions`
--

CREATE TABLE IF NOT EXISTS `Acquisitions` (
  `AcquisitionID` int(11) NOT NULL,
  `AcquisitionPrice` decimal(7,2) DEFAULT NULL,
  `AcquisitionDate` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Acquisitions`
--

INSERT INTO `Acquisitions` (`AcquisitionID`, `AcquisitionPrice`, `AcquisitionDate`) VALUES
(1, 400.00, '2020-02-29'),
(2, 345.32, '2020-02-11'),
(3, 20.00, '2020-02-18'),
(4, 56.32, '2020-02-11'),
(5, 1000.00, '2020-02-01');

-- --------------------------------------------------------

--
-- Table structure for table `AcquisitionsDetails`
--

CREATE TABLE IF NOT EXISTS `AcquisitionsDetails` (
  `AcquisitionDetailID` int(11) NOT NULL,
  `CameraID` int(11) DEFAULT NULL,
  `PartID` int(11) DEFAULT NULL,
  `FilmID` int(11) DEFAULT NULL,
  `AcquisitionID` int(11) DEFAULT NULL,
  `VendorID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `AcquisitionsDetails`
--

INSERT INTO `AcquisitionsDetails` (`AcquisitionDetailID`, `CameraID`, `PartID`, `FilmID`, `AcquisitionID`, `VendorID`) VALUES
(1, 2, 3, 4, 5, 1),
(2, 3, 4, 5, 1, 2),
(3, 4, 5, 1, 2, 3),
(4, 5, 1, 2, 3, 4),
(5, 1, 2, 3, 4, 5);

-- --------------------------------------------------------

--
-- Table structure for table `Cameras`
--

CREATE TABLE IF NOT EXISTS `Cameras` (
  `CameraID` int(11) NOT NULL,
  `AcquisitionID` int(11) DEFAULT NULL,
  `CameraMake` varchar(50) DEFAULT NULL,
  `CameraModel` varchar(50) DEFAULT NULL,
  `CameraYear` varchar(20) DEFAULT NULL,
  `CameraCondition` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Cameras`
--

INSERT INTO `Cameras` (`CameraID`, `AcquisitionID`, `CameraMake`, `CameraModel`, `CameraYear`, `CameraCondition`) VALUES
(1, 5, 'Leica', 'MP', '2003', 'Excellent'),
(2, 4, 'Nikon', 'F6', '2000', 'Fair'),
(3, 2, 'Olympus ', 'OM-1', '1997', 'Good'),
(4, 3, 'Pentax', 'K1000', '1994', 'Excellent'),
(5, 1, 'Canon ', 'Canonet QL-17 G-III', '1987', 'Fair');

-- --------------------------------------------------------

--
-- Table structure for table `Customers`
--

CREATE TABLE IF NOT EXISTS `Customers` (
  `CustomerID` int(11) NOT NULL,
  `CustomerName` varchar(55) DEFAULT NULL,
  `CustomerEmail` varchar(100) DEFAULT NULL,
  `CustomerPhone` varchar(35) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Customers`
--

INSERT INTO `Customers` (`CustomerID`, `CustomerName`, `CustomerEmail`, `CustomerPhone`) VALUES
(1, 'Jeff Ross', 'jeffross@email.com', '2349839378'),
(2, 'Mike Will', 'mikewill@email.com', '2367896543'),
(3, 'Sonny Lax', 'sonnylax@email.com', '3243987645'),
(4, 'Didier Drogba', 'didierdrogba@email.com', '3467896543'),
(5, 'Cristiano Ronaldo', 'cr7@email.com', '4567896578');

-- --------------------------------------------------------

--
-- Table structure for table `Films`
--

CREATE TABLE IF NOT EXISTS `Films` (
  `FilmID` int(11) NOT NULL,
  `AcquisitionID` int(11) DEFAULT NULL,
  `FilmMake` varchar(50) DEFAULT NULL,
  `FilmType` varchar(50) DEFAULT NULL,
  `FilmISO` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Films`
--

INSERT INTO `Films` (`FilmID`, `AcquisitionID`, `FilmMake`, `FilmType`, `FilmISO`) VALUES
(1, 2, 'CineStill', 'Color', '50'),
(2, 3, 'Lomography', 'Color', '400'),
(3, 4, 'Kodak', 'Ektar', '100'),
(4, 5, 'Kodak ', 'Portra', '400'),
(5, 1, 'Kodak', 'TX', '400');

-- --------------------------------------------------------

--
-- Table structure for table `Parts`
--

CREATE TABLE IF NOT EXISTS `Parts` (
  `PartID` int(11) NOT NULL,
  `AcquisitionID` int(11) DEFAULT NULL,
  `PartMake` varchar(50) DEFAULT NULL,
  `PartModel` varchar(50) DEFAULT NULL,
  `PartDescription` varchar(250) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Parts`
--

INSERT INTO `Parts` (`PartID`, `AcquisitionID`, `PartMake`, `PartModel`, `PartDescription`) VALUES
(1, 5, 'Pentax', 'Dim Flash X10', 'Flash can fit any Pentax camera.'),
(2, 4, 'Pentax', '50mm 1.4 ', 'Lens for the Pentax K1000'),
(3, 2, 'Canon ', '35mm 1.2 ', 'Fits any Canon camera.'),
(4, 3, 'Fuji', 'Shutter Holder', 'Hooks up to most shutters for long exposures. '),
(5, 1, 'Olympus', '28mm 1.4', 'For most Olympus makes. ');

-- --------------------------------------------------------

--
-- Table structure for table `Sales`
--

CREATE TABLE IF NOT EXISTS `Sales` (
  `SaleID` int(11) NOT NULL,
  `CustomerID` int(11) DEFAULT NULL,
  `SalePrice` decimal(9,2) DEFAULT NULL,
  `SaleDate` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Sales`
--

INSERT INTO `Sales` (`SaleID`, `CustomerID`, `SalePrice`, `SaleDate`) VALUES
(1, 4, 300.00, '2020-03-03'),
(2, 5, 601.40, '2020-03-09'),
(3, 1, 498.98, '2020-03-05'),
(4, 2, 456.34, '2020-03-07'),
(5, 3, 236.53, '2020-03-06');

-- --------------------------------------------------------

--
-- Table structure for table `SalesDetails`
--

CREATE TABLE IF NOT EXISTS `SalesDetails` (
  `SalesDetailsID` int(11) NOT NULL,
  `CameraID` int(11) DEFAULT NULL,
  `PartID` int(11) DEFAULT NULL,
  `FilmID` int(11) DEFAULT NULL,
  `SaleID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `SalesDetails`
--

INSERT INTO `SalesDetails` (`SalesDetailsID`, `CameraID`, `PartID`, `FilmID`, `SaleID`) VALUES
(1, 2, 3, 4, 5),
(2, 3, 4, 5, 1),
(3, 4, 5, 1, 2),
(4, 5, 1, 2, 3),
(5, 1, 2, 3, 4);

-- --------------------------------------------------------

--
-- Table structure for table `Vendors`
--

CREATE TABLE IF NOT EXISTS `Vendors` (
  `VendorID` int(11) NOT NULL,
  `VendorName` varchar(100) DEFAULT NULL,
  `VendorEmail` varchar(150) DEFAULT NULL,
  `VendorPhone` varchar(35) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Vendors`
--

INSERT INTO `Vendors` (`VendorID`, `VendorName`, `VendorEmail`, `VendorPhone`) VALUES
(1, 'Robi''s Cameras', 'robiscameras@email.com', '3456789876'),
(2, 'Julian Williams', 'julwill@email.com', '3456789345'),
(3, 'Dylan Muller', 'dylanmuller@email.com', '2345624567'),
(4, 'Jay Estrada', 'jayestrada@email.com', '3546784563'),
(5, 'Jose Alvorado', 'josealvorado@email.com', '2536754567');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `Acquisitions`
--
ALTER TABLE `Acquisitions`
  ADD PRIMARY KEY (`AcquisitionID`);

--
-- Indexes for table `AcquisitionsDetails`
--
ALTER TABLE `AcquisitionsDetails`
  ADD PRIMARY KEY (`AcquisitionDetailID`),
  ADD KEY `CameraID` (`CameraID`),
  ADD KEY `PartID` (`PartID`),
  ADD KEY `FilmID` (`FilmID`),
  ADD KEY `AcquisitionID` (`AcquisitionID`),
  ADD KEY `VendorID` (`VendorID`);

--
-- Indexes for table `Cameras`
--
ALTER TABLE `Cameras`
  ADD PRIMARY KEY (`CameraID`),
  ADD KEY `AcquisitionID` (`AcquisitionID`);

--
-- Indexes for table `Customers`
--
ALTER TABLE `Customers`
  ADD PRIMARY KEY (`CustomerID`);

--
-- Indexes for table `Films`
--
ALTER TABLE `Films`
  ADD PRIMARY KEY (`FilmID`),
  ADD KEY `AcquisitionID` (`AcquisitionID`);

--
-- Indexes for table `Parts`
--
ALTER TABLE `Parts`
  ADD PRIMARY KEY (`PartID`),
  ADD KEY `AcquisitionID` (`AcquisitionID`);

--
-- Indexes for table `Sales`
--
ALTER TABLE `Sales`
  ADD PRIMARY KEY (`SaleID`),
  ADD KEY `CustomerID` (`CustomerID`);

--
-- Indexes for table `SalesDetails`
--
ALTER TABLE `SalesDetails`
  ADD PRIMARY KEY (`SalesDetailsID`),
  ADD KEY `CameraID` (`CameraID`),
  ADD KEY `PartID` (`PartID`),
  ADD KEY `FilmID` (`FilmID`),
  ADD KEY `SaleID` (`SaleID`);

--
-- Indexes for table `Vendors`
--
ALTER TABLE `Vendors`
  ADD PRIMARY KEY (`VendorID`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `AcquisitionsDetails`
--
ALTER TABLE `AcquisitionsDetails`
  ADD CONSTRAINT `AcquisitionsDetails_ibfk_1` FOREIGN KEY (`CameraID`) REFERENCES `Cameras` (`CameraID`),
  ADD CONSTRAINT `AcquisitionsDetails_ibfk_2` FOREIGN KEY (`PartID`) REFERENCES `Parts` (`PartID`),
  ADD CONSTRAINT `AcquisitionsDetails_ibfk_3` FOREIGN KEY (`FilmID`) REFERENCES `Films` (`FilmID`),
  ADD CONSTRAINT `AcquisitionsDetails_ibfk_4` FOREIGN KEY (`AcquisitionID`) REFERENCES `Acquisitions` (`AcquisitionID`),
  ADD CONSTRAINT `AcquisitionsDetails_ibfk_5` FOREIGN KEY (`VendorID`) REFERENCES `Vendors` (`VendorID`);

--
-- Constraints for table `Cameras`
--
ALTER TABLE `Cameras`
  ADD CONSTRAINT `Cameras_ibfk_1` FOREIGN KEY (`AcquisitionID`) REFERENCES `Acquisitions` (`AcquisitionID`);

--
-- Constraints for table `Films`
--
ALTER TABLE `Films`
  ADD CONSTRAINT `Films_ibfk_1` FOREIGN KEY (`AcquisitionID`) REFERENCES `Acquisitions` (`AcquisitionID`);

--
-- Constraints for table `Parts`
--
ALTER TABLE `Parts`
  ADD CONSTRAINT `Parts_ibfk_1` FOREIGN KEY (`AcquisitionID`) REFERENCES `Acquisitions` (`AcquisitionID`);

--
-- Constraints for table `Sales`
--
ALTER TABLE `Sales`
  ADD CONSTRAINT `Sales_ibfk_1` FOREIGN KEY (`CustomerID`) REFERENCES `Customers` (`CustomerID`);

--
-- Constraints for table `SalesDetails`
--
ALTER TABLE `SalesDetails`
  ADD CONSTRAINT `SalesDetails_ibfk_1` FOREIGN KEY (`CameraID`) REFERENCES `Cameras` (`CameraID`),
  ADD CONSTRAINT `SalesDetails_ibfk_2` FOREIGN KEY (`PartID`) REFERENCES `Parts` (`PartID`),
  ADD CONSTRAINT `SalesDetails_ibfk_3` FOREIGN KEY (`FilmID`) REFERENCES `Films` (`FilmID`),
  ADD CONSTRAINT `SalesDetails_ibfk_4` FOREIGN KEY (`SaleID`) REFERENCES `Sales` (`SaleID`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
