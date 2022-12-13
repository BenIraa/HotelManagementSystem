-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jul 27, 2022 at 10:40 AM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `hotel_reservation`
--

-- --------------------------------------------------------

--
-- Table structure for table `customerTbale`
--

DROP TABLE IF EXISTS `customerTbale`;
CREATE TABLE `customerTbale` (
  `cust_Id` int(11) NOT NULL,
  `custFname` varchar(225) DEFAULT NULL,
  `custLname` varchar(225) DEFAULT NULL,
  `reservation` varchar(225) DEFAULT NULL,
  `address` varchar(225) DEFAULT NULL,
  `status` varchar(225) DEFAULT NULL,
  `contact_address` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `customerTbale`
--

INSERT INTO `customerTbale` (`cust_Id`, `custFname`, `custLname`, `reservation`, `address`, `status`, `contact_address`) VALUES
(1, 'Ingabire Rosette', 'Rosette', 'Booking room', 'Kigali kicukiro', 'single', 987654321),
(2, 'Nshuti', 'Blaise', 'Booking single room', 'Butare', 'single', 12345678),
(12, 'IKIREZI ', 'Eunice', 'Booking single room', 'Huye', 'single', 987654321);

--
-- Triggers `customerTbale`
--
DROP TRIGGER IF EXISTS `customerTbaleTriggers`;
DELIMITER $$
CREATE TRIGGER `customerTbaleTriggers` AFTER INSERT ON `customerTbale` FOR EACH ROW BEGIN 

INSERT INTO customerTbale VALUES(NEW.cust_Id, NEW.custFname, New.custLname, NEW.reservation, NEW.address, NEW.status, NEW.contact_address, NOW()); END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Stand-in structure for view `customerTbaleView`
-- (See below for the actual view)
--
DROP VIEW IF EXISTS `customerTbaleView`;
CREATE TABLE `customerTbaleView` (
`cust_Id` int(11)
,`custFname` varchar(225)
,`custLname` varchar(225)
,`reservation` varchar(225)
,`address` varchar(225)
,`status` varchar(225)
,`contact_address` int(11)
);

-- --------------------------------------------------------

--
-- Table structure for table `employees`
--

DROP TABLE IF EXISTS `employees`;
CREATE TABLE `employees` (
  `employee_Id` int(11) NOT NULL,
  `fname` varchar(255) DEFAULT NULL,
  `lname` varchar(255) DEFAULT NULL,
  `job_department` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `contact_address` int(11) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `employees`
--

INSERT INTO `employees` (`employee_Id`, `fname`, `lname`, `job_department`, `address`, `contact_address`, `username`, `password`) VALUES
(1, 'IRADUKUNDA ', 'Benjamin', 'Reception', 'Kigali', 987654321, 'BenIraa', 'kigali123'),
(1212, 'Nyombayire', 'assoumpta', 'Reservation ', 'I TUMBA', 987654321, 'Nyomba', '987654321');

--
-- Triggers `employees`
--
DROP TRIGGER IF EXISTS `employeesDelete`;
DELIMITER $$
CREATE TRIGGER `employeesDelete` AFTER DELETE ON `employees` FOR EACH ROW BEGIN
INSERT into Student VALUES (user(), CONCAT('Delete Student Record ',
         OLD.employee_Id,' Name :',OLD.fname, '-> Deleted on ', NOW()));
END
$$
DELIMITER ;
DROP TRIGGER IF EXISTS `employeesTriggers`;
DELIMITER $$
CREATE TRIGGER `employeesTriggers` AFTER INSERT ON `employees` FOR EACH ROW BEGIN 

INSERT INTO employees VALUES(NEW.employee_Id, New.fname, NEW.lname, NEW.job_department, NEW.address, NEW.contact_address, NEW.username, NEW.password, NOW()); 

END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Stand-in structure for view `employeesView`
-- (See below for the actual view)
--
DROP VIEW IF EXISTS `employeesView`;
CREATE TABLE `employeesView` (
`employee_Id` int(11)
,`fname` varchar(255)
,`lname` varchar(255)
,`job_department` varchar(255)
,`address` varchar(255)
,`contact_address` int(11)
,`username` varchar(255)
,`password` varchar(255)
);

-- --------------------------------------------------------

--
-- Table structure for table `PaymentTable`
--

DROP TABLE IF EXISTS `PaymentTable`;
CREATE TABLE `PaymentTable` (
  `payment_id` int(11) NOT NULL,
  `cust_Id` int(11) DEFAULT NULL,
  `payment_amount` int(11) NOT NULL,
  `type` varchar(255) DEFAULT NULL,
  `paynment_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `PaymentTable`
--

INSERT INTO `PaymentTable` (`payment_id`, `cust_Id`, `payment_amount`, `type`, `paynment_date`) VALUES
(1, 1, 2343, 'Booking Room', '2022-07-20'),
(34, 1, 2343, 'Single room', '2022-07-24');

--
-- Triggers `PaymentTable`
--
DROP TRIGGER IF EXISTS `PaymentTabletrigger`;
DELIMITER $$
CREATE TRIGGER `PaymentTabletrigger` AFTER INSERT ON `PaymentTable` FOR EACH ROW BEGIN 

INSERT INTO PaymentTable VALUES(NEW.payment_id, New.cust_ID, NEW.payment_amount, NEW.type, NEW.paynment_date, NOW()); 

END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Stand-in structure for view `PaymentTableView`
-- (See below for the actual view)
--
DROP VIEW IF EXISTS `PaymentTableView`;
CREATE TABLE `PaymentTableView` (
`payment_id` int(11)
,`cust_Id` int(11)
,`payment_amount` int(11)
,`type` varchar(255)
,`paynment_date` date
);

-- --------------------------------------------------------

--
-- Table structure for table `ReportTable`
--

DROP TABLE IF EXISTS `ReportTable`;
CREATE TABLE `ReportTable` (
  `report_id` int(11) NOT NULL,
  `transaction_id` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `ReportTable`
--

INSERT INTO `ReportTable` (`report_id`, `transaction_id`, `name`, `type`) VALUES
(1, 1, 'Nshuti blaise Booked vvip room 1', 'single room');

--
-- Triggers `ReportTable`
--
DROP TRIGGER IF EXISTS `ReportTableTrigger`;
DELIMITER $$
CREATE TRIGGER `ReportTableTrigger` AFTER INSERT ON `ReportTable` FOR EACH ROW BEGIN 

INSERT INTO ReportTable VALUES(NEW.report_id, New.transaction_id, NEW.name, NEW.type,  NOW()); 

END
$$
DELIMITER ;
DROP TRIGGER IF EXISTS `ReportTableUPDATE`;
DELIMITER $$
CREATE TRIGGER `ReportTableUPDATE` AFTER UPDATE ON `ReportTable` FOR EACH ROW BEGIN
INSERT into ReportTable VALUES (user(), CONCAT('Update Report Record ',
         OLD.name,' 89,333 :',OLD.type,'vvip',
         NEW.transaction_id));
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Stand-in structure for view `ReportTableView`
-- (See below for the actual view)
--
DROP VIEW IF EXISTS `ReportTableView`;
CREATE TABLE `ReportTableView` (
`report_id` int(11)
,`transaction_id` int(11)
,`name` varchar(255)
,`type` varchar(255)
);

-- --------------------------------------------------------

--
-- Table structure for table `reservationTable`
--

DROP TABLE IF EXISTS `reservationTable`;
CREATE TABLE `reservationTable` (
  `reservation_id` int(11) NOT NULL,
  `cust_Id` int(11) DEFAULT NULL,
  `room_Id` int(11) DEFAULT NULL,
  `reservation_date` date DEFAULT NULL,
  `date_in` date DEFAULT NULL,
  `date_out` date DEFAULT NULL,
  `days_range` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `reservationTable`
--

INSERT INTO `reservationTable` (`reservation_id`, `cust_Id`, `room_Id`, `reservation_date`, `date_in`, `date_out`, `days_range`) VALUES
(1, 2, 1, '2022-07-22', '2022-07-23', '2022-07-25', 3),
(2, 12, 1, '2022-07-22', '2022-07-23', '2022-07-25', 3);

--
-- Triggers `reservationTable`
--
DROP TRIGGER IF EXISTS `reservationTableTrigger`;
DELIMITER $$
CREATE TRIGGER `reservationTableTrigger` AFTER INSERT ON `reservationTable` FOR EACH ROW BEGIN 

INSERT INTO reservationTable VALUES(NEW.reservation_id, New.cust_Id, NEW.room_Id, NEW.reservation_date, NEW.date_in,
                                    NEW.date_out, NEW.days_range, NOW()); 

END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Stand-in structure for view `reservationTableView`
-- (See below for the actual view)
--
DROP VIEW IF EXISTS `reservationTableView`;
CREATE TABLE `reservationTableView` (
`reservation_id` int(11)
,`cust_Id` int(11)
,`room_Id` int(11)
,`reservation_date` date
,`date_in` date
,`date_out` date
,`days_range` int(11)
);

-- --------------------------------------------------------

--
-- Table structure for table `RoomClassTable`
--

DROP TABLE IF EXISTS `RoomClassTable`;
CREATE TABLE `RoomClassTable` (
  `class_Id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `price` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `RoomClassTable`
--

INSERT INTO `RoomClassTable` (`class_Id`, `name`, `price`) VALUES
(1, 'VVIP', 12345),
(2, 'Maried room', 12345);

--
-- Triggers `RoomClassTable`
--
DROP TRIGGER IF EXISTS `RoomClassTableTrigger`;
DELIMITER $$
CREATE TRIGGER `RoomClassTableTrigger` AFTER INSERT ON `RoomClassTable` FOR EACH ROW BEGIN INSERT INTO RoomClassTable VALUES(NEW.class_id, NEW.name, New.price, NOW()); 

END
$$
DELIMITER ;
DROP TRIGGER IF EXISTS `RoomClassTableUPDATE`;
DELIMITER $$
CREATE TRIGGER `RoomClassTableUPDATE` AFTER UPDATE ON `RoomClassTable` FOR EACH ROW BEGIN
INSERT into RoomClassTable VALUES (user(), CONCAT('Update Room Class Table Record ',
         OLD.price,' 89,333 :',OLD.class_id,3,
         NEW.name));
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Stand-in structure for view `RoomClassTableView`
-- (See below for the actual view)
--
DROP VIEW IF EXISTS `RoomClassTableView`;
CREATE TABLE `RoomClassTableView` (
`class_Id` int(11)
,`name` varchar(255)
,`price` int(11)
);

-- --------------------------------------------------------

--
-- Table structure for table `roomTbale`
--

DROP TABLE IF EXISTS `roomTbale`;
CREATE TABLE `roomTbale` (
  `room_Id` int(11) NOT NULL,
  `room_type` varchar(255) DEFAULT NULL,
  `price` int(11) NOT NULL,
  `room_sample` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `roomTbale`
--

INSERT INTO `roomTbale` (`room_Id`, `room_type`, `price`, `room_sample`, `description`) VALUES
(1, 'Single room', 4321, 'one person', 'This room we allow you to sleep alone'),
(2, 'vip', 654321, 'include Toilet and washing room', 'this room we allow you to sleep with someone else only'),
(121, 'couple room', 11222, 'For couples', 'Allow you to come with your partner');

--
-- Triggers `roomTbale`
--
DROP TRIGGER IF EXISTS `roomTbaleTrigger`;
DELIMITER $$
CREATE TRIGGER `roomTbaleTrigger` AFTER INSERT ON `roomTbale` FOR EACH ROW BEGIN INSERT INTO roomTbale VALUES(NEW.room_Id, NEW.room_type, New.price, New.room_sample, New.description, NOW()); 

END
$$
DELIMITER ;
DROP TRIGGER IF EXISTS `rooomTbaleDelete`;
DELIMITER $$
CREATE TRIGGER `rooomTbaleDelete` AFTER DELETE ON `roomTbale` FOR EACH ROW BEGIN
INSERT into roomTbale VALUES (user(), CONCAT('Delete Student Record ',
         OLD.room_id,' id :',OLD.price, '-> Deleted on ', NOW()));
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Stand-in structure for view `roomTbaleView`
-- (See below for the actual view)
--
DROP VIEW IF EXISTS `roomTbaleView`;
CREATE TABLE `roomTbaleView` (
`room_Id` int(11)
,`room_type` varchar(255)
,`price` int(11)
,`room_sample` varchar(255)
,`description` varchar(255)
);

-- --------------------------------------------------------

--
-- Table structure for table `TransactionTable`
--

DROP TABLE IF EXISTS `TransactionTable`;
CREATE TABLE `TransactionTable` (
  `transaction_id` int(11) NOT NULL,
  `transaction_name` varchar(255) DEFAULT NULL,
  `cust_id` int(11) DEFAULT NULL,
  `employee_Id` int(11) DEFAULT NULL,
  `reservation_id` int(11) DEFAULT NULL,
  `transaction_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `TransactionTable`
--

INSERT INTO `TransactionTable` (`transaction_id`, `transaction_name`, `cust_id`, `employee_Id`, `reservation_id`, `transaction_date`) VALUES
(1, 'booking vvip room', 1, 1, 1, '2022-07-17'),
(33, 'Booking Room', 1, 1, 122, '2022-07-17');

--
-- Triggers `TransactionTable`
--
DROP TRIGGER IF EXISTS `TransactionTableTrigger`;
DELIMITER $$
CREATE TRIGGER `TransactionTableTrigger` AFTER INSERT ON `TransactionTable` FOR EACH ROW BEGIN INSERT INTO TransactionTable VALUES(NEW.transaction_Id, NEW.transaction_name, New.cust_Id, New.employee_Id, New.reservation_id, New.transaction_date, NOW()); 

END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Stand-in structure for view `TransactionTableView`
-- (See below for the actual view)
--
DROP VIEW IF EXISTS `TransactionTableView`;
CREATE TABLE `TransactionTableView` (
`transaction_id` int(11)
,`transaction_name` varchar(255)
,`cust_id` int(11)
,`employee_Id` int(11)
,`reservation_id` int(11)
,`transaction_date` date
);

-- --------------------------------------------------------

--
-- Structure for view `customerTbaleView`
--
DROP TABLE IF EXISTS `customerTbaleView`;

DROP VIEW IF EXISTS `customerTbaleView`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `customerTbaleView`  AS SELECT `customerTbale`.`cust_Id` AS `cust_Id`, `customerTbale`.`custFname` AS `custFname`, `customerTbale`.`custLname` AS `custLname`, `customerTbale`.`reservation` AS `reservation`, `customerTbale`.`address` AS `address`, `customerTbale`.`status` AS `status`, `customerTbale`.`contact_address` AS `contact_address` FROM `customerTbale``customerTbale`  ;

-- --------------------------------------------------------

--
-- Structure for view `employeesView`
--
DROP TABLE IF EXISTS `employeesView`;

DROP VIEW IF EXISTS `employeesView`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `employeesView`  AS SELECT `employees`.`employee_Id` AS `employee_Id`, `employees`.`fname` AS `fname`, `employees`.`lname` AS `lname`, `employees`.`job_department` AS `job_department`, `employees`.`address` AS `address`, `employees`.`contact_address` AS `contact_address`, `employees`.`username` AS `username`, `employees`.`password` AS `password` FROM `employees``employees`  ;

-- --------------------------------------------------------

--
-- Structure for view `PaymentTableView`
--
DROP TABLE IF EXISTS `PaymentTableView`;

DROP VIEW IF EXISTS `PaymentTableView`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `PaymentTableView`  AS SELECT `PaymentTable`.`payment_id` AS `payment_id`, `PaymentTable`.`cust_Id` AS `cust_Id`, `PaymentTable`.`payment_amount` AS `payment_amount`, `PaymentTable`.`type` AS `type`, `PaymentTable`.`paynment_date` AS `paynment_date` FROM `PaymentTable``PaymentTable`  ;

-- --------------------------------------------------------

--
-- Structure for view `ReportTableView`
--
DROP TABLE IF EXISTS `ReportTableView`;

DROP VIEW IF EXISTS `ReportTableView`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `ReportTableView`  AS SELECT `ReportTable`.`report_id` AS `report_id`, `ReportTable`.`transaction_id` AS `transaction_id`, `ReportTable`.`name` AS `name`, `ReportTable`.`type` AS `type` FROM `ReportTable``ReportTable`  ;

-- --------------------------------------------------------

--
-- Structure for view `reservationTableView`
--
DROP TABLE IF EXISTS `reservationTableView`;

DROP VIEW IF EXISTS `reservationTableView`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `reservationTableView`  AS SELECT `reservationTable`.`reservation_id` AS `reservation_id`, `reservationTable`.`cust_Id` AS `cust_Id`, `reservationTable`.`room_Id` AS `room_Id`, `reservationTable`.`reservation_date` AS `reservation_date`, `reservationTable`.`date_in` AS `date_in`, `reservationTable`.`date_out` AS `date_out`, `reservationTable`.`days_range` AS `days_range` FROM `reservationTable``reservationTable`  ;

-- --------------------------------------------------------

--
-- Structure for view `RoomClassTableView`
--
DROP TABLE IF EXISTS `RoomClassTableView`;

DROP VIEW IF EXISTS `RoomClassTableView`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `RoomClassTableView`  AS SELECT `RoomClassTable`.`class_Id` AS `class_Id`, `RoomClassTable`.`name` AS `name`, `RoomClassTable`.`price` AS `price` FROM `RoomClassTable``RoomClassTable`  ;

-- --------------------------------------------------------

--
-- Structure for view `roomTbaleView`
--
DROP TABLE IF EXISTS `roomTbaleView`;

DROP VIEW IF EXISTS `roomTbaleView`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `roomTbaleView`  AS SELECT `roomTbale`.`room_Id` AS `room_Id`, `roomTbale`.`room_type` AS `room_type`, `roomTbale`.`price` AS `price`, `roomTbale`.`room_sample` AS `room_sample`, `roomTbale`.`description` AS `description` FROM `roomTbale``roomTbale`  ;

-- --------------------------------------------------------

--
-- Structure for view `TransactionTableView`
--
DROP TABLE IF EXISTS `TransactionTableView`;

DROP VIEW IF EXISTS `TransactionTableView`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `TransactionTableView`  AS SELECT `TransactionTable`.`transaction_id` AS `transaction_id`, `TransactionTable`.`transaction_name` AS `transaction_name`, `TransactionTable`.`cust_id` AS `cust_id`, `TransactionTable`.`employee_Id` AS `employee_Id`, `TransactionTable`.`reservation_id` AS `reservation_id`, `TransactionTable`.`transaction_date` AS `transaction_date` FROM `TransactionTable``TransactionTable`  ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `customerTbale`
--
ALTER TABLE `customerTbale`
  ADD PRIMARY KEY (`cust_Id`);

--
-- Indexes for table `employees`
--
ALTER TABLE `employees`
  ADD PRIMARY KEY (`employee_Id`);

--
-- Indexes for table `PaymentTable`
--
ALTER TABLE `PaymentTable`
  ADD PRIMARY KEY (`payment_id`),
  ADD KEY `cust_Id` (`cust_Id`);

--
-- Indexes for table `ReportTable`
--
ALTER TABLE `ReportTable`
  ADD PRIMARY KEY (`report_id`),
  ADD KEY `transaction_id` (`transaction_id`);

--
-- Indexes for table `reservationTable`
--
ALTER TABLE `reservationTable`
  ADD PRIMARY KEY (`reservation_id`),
  ADD KEY `cust_Id` (`cust_Id`),
  ADD KEY `FK_reservationRoom` (`room_Id`);

--
-- Indexes for table `RoomClassTable`
--
ALTER TABLE `RoomClassTable`
  ADD PRIMARY KEY (`class_Id`);

--
-- Indexes for table `roomTbale`
--
ALTER TABLE `roomTbale`
  ADD PRIMARY KEY (`room_Id`);

--
-- Indexes for table `TransactionTable`
--
ALTER TABLE `TransactionTable`
  ADD PRIMARY KEY (`transaction_id`),
  ADD KEY `cust_id` (`cust_id`),
  ADD KEY `FK_transactionEmp` (`employee_Id`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `PaymentTable`
--
ALTER TABLE `PaymentTable`
  ADD CONSTRAINT `PaymentTable_ibfk_1` FOREIGN KEY (`cust_Id`) REFERENCES `customerTbale` (`cust_Id`);

--
-- Constraints for table `ReportTable`
--
ALTER TABLE `ReportTable`
  ADD CONSTRAINT `ReportTable_ibfk_1` FOREIGN KEY (`transaction_id`) REFERENCES `TransactionTable` (`transaction_id`);

--
-- Constraints for table `reservationTable`
--
ALTER TABLE `reservationTable`
  ADD CONSTRAINT `FK_reservationRoom` FOREIGN KEY (`room_Id`) REFERENCES `roomTbale` (`room_Id`),
  ADD CONSTRAINT `reservationTable_ibfk_1` FOREIGN KEY (`cust_Id`) REFERENCES `customerTbale` (`cust_Id`);

--
-- Constraints for table `TransactionTable`
--
ALTER TABLE `TransactionTable`
  ADD CONSTRAINT `FK_transactionEmp` FOREIGN KEY (`employee_Id`) REFERENCES `employees` (`employee_Id`),
  ADD CONSTRAINT `TransactionTable_ibfk_1` FOREIGN KEY (`cust_id`) REFERENCES `customerTbale` (`cust_Id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
