-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 02, 2022 at 03:48 PM
-- Server version: 10.4.17-MariaDB
-- PHP Version: 8.0.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `shopping`
--

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--
-- Creation: Dec 31, 2021 at 05:59 PM
--

CREATE TABLE `customer` (
  `Customer ID` int(6) NOT NULL,
  `Name` varchar(50) NOT NULL,
  `Address` varchar(200) NOT NULL,
  `Username` varchar(50) NOT NULL,
  `Password` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- RELATIONSHIPS FOR TABLE `customer`:
--

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`Customer ID`, `Name`, `Address`, `Username`, `Password`) VALUES
(123, 'islam', 'maadi', 'admin2', '234'),
(666, 'dr ali', 'sheraton', 'admin3', '333'),
(1001, 'ahmed', 'sheraton', 'admin', '123');

-- --------------------------------------------------------

--
-- Table structure for table `order`
--
-- Creation: Dec 31, 2021 at 05:59 PM
--

CREATE TABLE `order` (
  `Order Number` int(8) NOT NULL,
  `Date` date NOT NULL,
  `Total Amount` decimal(8,2) NOT NULL,
  `Customer ID` int(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- RELATIONSHIPS FOR TABLE `order`:
--   `Customer ID`
--       `customer` -> `Customer ID`
--

--
-- Dumping data for table `order`
--

INSERT INTO `order` (`Order Number`, `Date`, `Total Amount`, `Customer ID`) VALUES
(100, '2022-01-02', '6000.00', 1001),
(101, '2022-01-02', '3250.00', 666),
(102, '2022-01-02', '650.00', 1001);

-- --------------------------------------------------------

--
-- Table structure for table `order details`
--
-- Creation: Jan 01, 2022 at 08:21 PM
--

CREATE TABLE `order details` (
  `Order Number` int(8) NOT NULL,
  `Product Code` int(8) NOT NULL,
  `Quantity` int(3) NOT NULL,
  `Nights` int(14) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- RELATIONSHIPS FOR TABLE `order details`:
--   `Order Number`
--       `order` -> `Order Number`
--   `Product Code`
--       `product` -> `Product Code`
--

--
-- Dumping data for table `order details`
--

INSERT INTO `order details` (`Order Number`, `Product Code`, `Quantity`, `Nights`) VALUES
(100, 1208, 2, 1),
(101, 567, 1, 5),
(102, 567, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `product`
--
-- Creation: Dec 31, 2021 at 05:59 PM
--

CREATE TABLE `product` (
  `Product Code` int(8) NOT NULL,
  `Name` varchar(30) NOT NULL,
  `Stock` int(4) NOT NULL,
  `Price` decimal(7,2) NOT NULL,
  `Picture` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- RELATIONSHIPS FOR TABLE `product`:
--

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`Product Code`, `Name`, `Stock`, `Price`, `Picture`) VALUES
(567, 'mercure', 1, '650.00', 'products/mercure.jpg'),
(1208, 'rixos', 12, '3000.00', 'products/rixos.png'),
(1455, 'stiegen', 23, '999.00', 'products/st.png\r\n'),
(1577, 'marriot', 3, '2499.00', 'products/marriot.jpg');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`Customer ID`);

--
-- Indexes for table `order`
--
ALTER TABLE `order`
  ADD PRIMARY KEY (`Order Number`),
  ADD KEY `order_ibfk_1` (`Customer ID`);

--
-- Indexes for table `order details`
--
ALTER TABLE `order details`
  ADD PRIMARY KEY (`Order Number`,`Product Code`),
  ADD KEY `Product Code` (`Product Code`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`Product Code`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `customer`
--
ALTER TABLE `customer`
  MODIFY `Customer ID` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12346;

--
-- AUTO_INCREMENT for table `order`
--
ALTER TABLE `order`
  MODIFY `Order Number` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=103;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `order`
--
ALTER TABLE `order`
  ADD CONSTRAINT `order_ibfk_1` FOREIGN KEY (`Customer ID`) REFERENCES `customer` (`Customer ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `order details`
--
ALTER TABLE `order details`
  ADD CONSTRAINT `order details_ibfk_1` FOREIGN KEY (`Order Number`) REFERENCES `order` (`Order Number`),
  ADD CONSTRAINT `order details_ibfk_2` FOREIGN KEY (`Product Code`) REFERENCES `product` (`Product Code`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
