-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 26, 2024 at 02:51 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `_wire_project_`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `admin_id` int(11) NOT NULL,
  `admin_name` varchar(100) NOT NULL,
  `admin_email` varchar(255) NOT NULL,
  `admin_password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `brand`
--

CREATE TABLE `brand` (
  `brand_id` int(11) NOT NULL,
  `brand_name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `brand`
--

INSERT INTO `brand` (`brand_id`, `brand_name`) VALUES
(1, 'Samsung'),
(2, 'Hogo'),
(3, 'Apple'),
(4, 'Gioni');

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `category_id` int(11) NOT NULL,
  `category_name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`category_id`, `category_name`) VALUES
(1, 'Charger'),
(2, 'Handfree'),
(3, 'USB'),
(4, 'Data Cable');

-- --------------------------------------------------------

--
-- Table structure for table `items`
--

CREATE TABLE `items` (
  `item_id` int(11) NOT NULL,
  `item_category` varchar(255) NOT NULL,
  `item_brand` varchar(255) NOT NULL,
  `item_description` text NOT NULL,
  `item_image` varchar(255) NOT NULL,
  `item_price` int(11) NOT NULL,
  `item_quantity` int(11) NOT NULL,
  `item_sold` int(11) NOT NULL,
  `agreement_date` date NOT NULL,
  `item_profit` int(3) NOT NULL DEFAULT 0,
  `fk_item_tracking_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `items`
--

INSERT INTO `items` (`item_id`, `item_category`, `item_brand`, `item_description`, `item_image`, `item_price`, `item_quantity`, `item_sold`, `agreement_date`, `item_profit`, `fk_item_tracking_id`) VALUES
(4, 'Charger', 'Samsung', 'This is a good handfree', '1Screenshot (8).png', 300, 1200, 0, '2024-09-12', 0, 1),
(5, 'Charger', 'Samsung', 'A good quality charger', '4Screenshot (4).png', 200, 455, 0, '2024-09-12', 0, 1),
(6, 'Handfree', 'Hogo', 'This is a good quality handfree', '5Screenshot (1).png', 344, 701, 72, '2024-09-12', 5, 1),
(7, 'Data Cable', 'Apple', 'Data cable', '7Screenshot (9).png', 10, 200, 0, '0000-00-00', 0, 1),
(10, 'Charger', 'Hogo', 'This is a very good charger', '8download (2).jpg', 230, 300, 0, '0000-00-00', 0, 4);

-- --------------------------------------------------------

--
-- Table structure for table `items_sold`
--

CREATE TABLE `items_sold` (
  `sell_id` int(11) NOT NULL,
  `sell_price` int(11) NOT NULL,
  `sell_quantity` int(11) NOT NULL,
  `sell_date` date NOT NULL,
  `fk_item_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `item_tracking`
--

CREATE TABLE `item_tracking` (
  `item_tracking_id` int(11) NOT NULL,
  `fk_wh_id` int(11) NOT NULL,
  `fk_ws_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `item_tracking`
--

INSERT INTO `item_tracking` (`item_tracking_id`, `fk_wh_id`, `fk_ws_id`) VALUES
(1, 1, 1),
(4, 1, 4);

-- --------------------------------------------------------

--
-- Table structure for table `warehouse`
--

CREATE TABLE `warehouse` (
  `wh_id` int(11) NOT NULL,
  `wh_name` varchar(255) NOT NULL,
  `wh_area` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `warehouse`
--

INSERT INTO `warehouse` (`wh_id`, `wh_name`, `wh_area`) VALUES
(1, 'Gujranwala', 'Gujranwala');

-- --------------------------------------------------------

--
-- Table structure for table `wholesaler`
--

CREATE TABLE `wholesaler` (
  `ws_id` int(11) NOT NULL,
  `ws_name` varchar(255) NOT NULL,
  `ws_company_name` varchar(255) NOT NULL,
  `ws_home_address` varchar(500) NOT NULL,
  `ws_office_address` varchar(255) NOT NULL,
  `ws_personal_contact` varchar(255) NOT NULL,
  `ws_office_contact` varchar(255) NOT NULL,
  `ws_cnic` varchar(100) NOT NULL,
  `ws_image` varchar(255) NOT NULL,
  `ws_email` varchar(255) NOT NULL,
  `ws_password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `wholesaler`
--

INSERT INTO `wholesaler` (`ws_id`, `ws_name`, `ws_company_name`, `ws_home_address`, `ws_office_address`, `ws_personal_contact`, `ws_office_contact`, `ws_cnic`, `ws_image`, `ws_email`, `ws_password`) VALUES
(1, 'Abdullah', 'Smart Sales', 'Rahwali, Gujranwala', 'Rahwali, Gujranwala', '03457687675', '03128776456', '0987667767656', 'Screenshot (2).png', 'smart@sales.com', '1234'),
(2, 'Ali', '', 'sdh', 'ksdlfj', '+923135654321', '+923165673656', '76675-9876543-8', 'download (3).jpg', 'email@mail.com', '202cb962ac59075b964b07152d234b70'),
(4, 'Abdullah Javaid', 'Himalayas', 'Gujranwala', 'Gujranwala', '+923145655543', '+923457666546', '34154-7654322-0', '4get_in_touch_image.jpg', 'abd@mail.com', '202cb962ac59075b964b07152d234b70'),
(5, 'name', 'name', 'klsdjfl', 'lksjfd', '+923456556666', '+923336666666', '36363-8737033-4', '5whats_new.jpg', 's@s.com', '698d51a19d8a121ce581499d7b701668');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`admin_id`);

--
-- Indexes for table `brand`
--
ALTER TABLE `brand`
  ADD PRIMARY KEY (`brand_id`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`category_id`);

--
-- Indexes for table `items`
--
ALTER TABLE `items`
  ADD PRIMARY KEY (`item_id`),
  ADD KEY `fk_item_tracking_id_for_items` (`fk_item_tracking_id`);

--
-- Indexes for table `items_sold`
--
ALTER TABLE `items_sold`
  ADD PRIMARY KEY (`sell_id`),
  ADD KEY `fk_item_id_for_items_sold` (`fk_item_id`);

--
-- Indexes for table `item_tracking`
--
ALTER TABLE `item_tracking`
  ADD PRIMARY KEY (`item_tracking_id`),
  ADD KEY `fk_wh_id_for_item_tracking` (`fk_wh_id`),
  ADD KEY `fk_ws_id_for_item_tracking` (`fk_ws_id`);

--
-- Indexes for table `warehouse`
--
ALTER TABLE `warehouse`
  ADD PRIMARY KEY (`wh_id`);

--
-- Indexes for table `wholesaler`
--
ALTER TABLE `wholesaler`
  ADD PRIMARY KEY (`ws_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `admin_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `brand`
--
ALTER TABLE `brand`
  MODIFY `brand_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `category_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `items`
--
ALTER TABLE `items`
  MODIFY `item_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `items_sold`
--
ALTER TABLE `items_sold`
  MODIFY `sell_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `item_tracking`
--
ALTER TABLE `item_tracking`
  MODIFY `item_tracking_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `warehouse`
--
ALTER TABLE `warehouse`
  MODIFY `wh_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `wholesaler`
--
ALTER TABLE `wholesaler`
  MODIFY `ws_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `items`
--
ALTER TABLE `items`
  ADD CONSTRAINT `fk_item_tracking_id_for_items` FOREIGN KEY (`fk_item_tracking_id`) REFERENCES `item_tracking` (`item_tracking_id`);

--
-- Constraints for table `items_sold`
--
ALTER TABLE `items_sold`
  ADD CONSTRAINT `fk_item_id_for_items_sold` FOREIGN KEY (`fk_item_id`) REFERENCES `items` (`item_id`);

--
-- Constraints for table `item_tracking`
--
ALTER TABLE `item_tracking`
  ADD CONSTRAINT `fk_wh_id_for_item_tracking` FOREIGN KEY (`fk_wh_id`) REFERENCES `warehouse` (`wh_id`),
  ADD CONSTRAINT `fk_ws_id_for_item_tracking` FOREIGN KEY (`fk_ws_id`) REFERENCES `wholesaler` (`ws_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
