-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 10, 2024 at 03:27 PM
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
  `admin_role` varchar(50) NOT NULL,
  `admin_email` varchar(255) NOT NULL,
  `admin_password` varchar(255) NOT NULL,
  `fk_wh_id` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`admin_id`, `admin_name`, `admin_role`, `admin_email`, `admin_password`, `fk_wh_id`) VALUES
(1, 'Abdullah', 'super', 'abd@mail.com', '202cb962ac59075b964b07152d234b70', 1);

-- --------------------------------------------------------

--
-- Table structure for table `admin_notification`
--

CREATE TABLE `admin_notification` (
  `id` int(11) NOT NULL,
  `message` text NOT NULL,
  `date` date NOT NULL,
  `is_read` varchar(50) NOT NULL DEFAULT 'unread',
  `admin_role` varchar(50) NOT NULL,
  `fk_wh_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `bd_notification`
--

CREATE TABLE `bd_notification` (
  `id` int(11) NOT NULL,
  `message` text NOT NULL,
  `date` date NOT NULL,
  `is_read` varchar(50) NOT NULL DEFAULT 'unread',
  `fk_bd_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `bd_payment_details`
--

CREATE TABLE `bd_payment_details` (
  `bdp_id` int(11) NOT NULL,
  `bdp_amount` int(11) NOT NULL,
  `bdp_paid` int(11) NOT NULL,
  `date` date NOT NULL,
  `fk_bd_id` int(11) NOT NULL,
  `fk_delivery_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `bd_payment_records`
--

CREATE TABLE `bd_payment_records` (
  `bdr_id` int(11) NOT NULL,
  `bdr_image` varchar(255) NOT NULL,
  `bdr_paid` int(11) NOT NULL,
  `date` date NOT NULL,
  `fk_bd_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `bd_pending_payments`
--

CREATE TABLE `bd_pending_payments` (
  `bdpp_id` int(11) NOT NULL,
  `bdpp_amount` int(11) NOT NULL,
  `fk_bd_id` int(11) NOT NULL
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
-- Table structure for table `business_developer`
--

CREATE TABLE `business_developer` (
  `bd_id` int(11) NOT NULL,
  `bd_name` varchar(100) NOT NULL,
  `bd_address` varchar(300) NOT NULL,
  `bd_contact` varchar(50) NOT NULL,
  `bd_cnic` varchar(50) NOT NULL,
  `bd_image` varchar(255) NOT NULL,
  `bd_email` varchar(255) NOT NULL,
  `bd_password` varchar(255) NOT NULL,
  `bd_status` varchar(50) NOT NULL DEFAULT 'active',
  `bd_referal_code` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `buyer`
--

CREATE TABLE `buyer` (
  `buyer_id` int(11) NOT NULL,
  `buyer_name` varchar(100) NOT NULL,
  `buyer_address` varchar(300) NOT NULL,
  `buyer_contact` varchar(50) NOT NULL,
  `buyer_cnic` varchar(50) NOT NULL,
  `buyer_image` varchar(255) NOT NULL,
  `buyer_email` varchar(255) NOT NULL,
  `buyer_password` varchar(255) NOT NULL,
  `buyer_status` varchar(50) NOT NULL DEFAULT 'active',
  `fk_bd_id` int(11) NOT NULL,
  `fk_rider_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `buyer_notification`
--

CREATE TABLE `buyer_notification` (
  `id` int(11) NOT NULL,
  `message` text NOT NULL,
  `date` date NOT NULL,
  `is_read` varchar(50) NOT NULL DEFAULT 'unread',
  `fk_buyer_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
-- Table structure for table `company_earnings`
--

CREATE TABLE `company_earnings` (
  `earning_id` int(11) NOT NULL,
  `earning_amount` int(11) NOT NULL,
  `date` date NOT NULL,
  `fk_delivery_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `delivery`
--

CREATE TABLE `delivery` (
  `delivery_id` int(11) NOT NULL,
  `delivery_quantity` int(11) NOT NULL,
  `toatal_cash` int(11) NOT NULL,
  `delivery_status` varchar(50) NOT NULL,
  `delivery_date` date NOT NULL,
  `fk_item_adj_id` int(11) NOT NULL,
  `fk_buyer_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `items`
--

CREATE TABLE `items` (
  `item_id` int(11) NOT NULL,
  `item_category` varchar(255) NOT NULL,
  `item_brand` varchar(255) NOT NULL,
  `item_number` varchar(50) NOT NULL,
  `item_description` text NOT NULL,
  `item_image` varchar(255) NOT NULL,
  `item_price` int(11) NOT NULL,
  `item_quantity` int(11) NOT NULL,
  `more_quantity` int(10) NOT NULL DEFAULT 0,
  `item_sold` int(11) NOT NULL,
  `agreement_date` date NOT NULL,
  `item_profit` int(3) NOT NULL DEFAULT 0,
  `item_status` varchar(30) NOT NULL DEFAULT 'review',
  `fk_item_tracking_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `items`
--

INSERT INTO `items` (`item_id`, `item_category`, `item_brand`, `item_number`, `item_description`, `item_image`, `item_price`, `item_quantity`, `more_quantity`, `item_sold`, `agreement_date`, `item_profit`, `item_status`, `fk_item_tracking_id`) VALUES
(4, 'Charger', 'Samsung', '', 'This is a good handfree', '1Screenshot (8).png', 30, 1200, 0, 0, '2025-01-03', 20, 'approved', 1),
(5, 'Charger', 'Samsung', '', 'A good quality charger', '4Screenshot (4).png', 200, 455, 0, 0, '2024-10-28', 5, 'approved', 1),
(6, 'Handfree', 'Hogo', '', 'This is a good quality handfree', '5Screenshot (1).png', 344, 700, 0, 0, '2024-10-12', 10, 'approved', 1),
(7, 'Data Cable', 'Apple', '', 'Data cable', '7Screenshot (9).png', 100, 200, 0, 0, '0000-00-00', 0, 'rejected', 1),
(10, 'Charger', 'Hogo', '', 'This is a very good charger', '8download (2).jpg', 230, 300, 0, 0, '2024-09-18', 10, 'approved', 4),
(11, 'USB', 'Samsung', '', 'A good quality usb', '11image-1.jpg', 200, 200, 0, 0, '0000-00-00', 0, 'rejected', 4),
(12, 'Handfree', 'Samsung', '', 'good', '12_large_image_2.jpg', 20, 200, 0, 0, '2024-12-25', 6, 'approved', 5),
(13, 'Handfree', 'Gioni', '', 'g6gj7j8u,ih7hmijjyhmhbnyn', '13_large_image_2.jpg', 1200, 455, 0, 0, '0000-00-00', 0, 'rejected', 4),
(14, 'Handfree', 'Samsung', 'm8 95 c-pro', 'This is a quality handfree, which is really awesome and easily adjustable to any ear size.', '14school-building-vector-illustration-83905184.webp', 50, 2000, 0, 0, '2024-10-05', 10, 'approved', 4);

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
-- Table structure for table `item_adjustment`
--

CREATE TABLE `item_adjustment` (
  `item_adj_id` int(11) NOT NULL,
  `item_adj_percent` int(3) NOT NULL,
  `fk_item_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `item_rejection`
--

CREATE TABLE `item_rejection` (
  `rejection_id` int(11) NOT NULL,
  `rejection_reason` text NOT NULL,
  `fk_item_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `item_rejection`
--

INSERT INTO `item_rejection` (`rejection_id`, `rejection_reason`, `fk_item_id`) VALUES
(1, 'The function might be working and your image quality is so low!', 11),
(2, 'Improve the image quality', 7),
(3, 'Improve the image quality', 13);

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
(4, 1, 4),
(5, 1, 6);

-- --------------------------------------------------------

--
-- Table structure for table `rider`
--

CREATE TABLE `rider` (
  `rider_id` int(11) NOT NULL,
  `rider_name` varchar(100) NOT NULL,
  `rider_address` varchar(300) NOT NULL,
  `rider_contact` varchar(50) NOT NULL,
  `rider_cnic` varchar(50) NOT NULL,
  `rider_image` varchar(255) NOT NULL,
  `rider_email` varchar(255) NOT NULL,
  `rider_password` varchar(255) NOT NULL,
  `rider_status` varchar(50) NOT NULL DEFAULT 'active'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `rider_notification`
--

CREATE TABLE `rider_notification` (
  `id` int(11) NOT NULL,
  `message` text NOT NULL,
  `date` date NOT NULL,
  `is_read` varchar(50) NOT NULL DEFAULT 'unread',
  `fk_rider_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `rider_payment_details`
--

CREATE TABLE `rider_payment_details` (
  `rp_id` int(11) NOT NULL,
  `rp_amount` int(11) NOT NULL,
  `rp_paid` int(11) NOT NULL,
  `date` date NOT NULL,
  `fk_rider_id` int(11) NOT NULL,
  `fk_delivery_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `rider_payment_records`
--

CREATE TABLE `rider_payment_records` (
  `rr_id` int(11) NOT NULL,
  `rr_image` varchar(255) NOT NULL,
  `rr_paid` int(11) NOT NULL,
  `date` date NOT NULL,
  `fk_rider_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `rider_pending_payments`
--

CREATE TABLE `rider_pending_payments` (
  `rpp_id` int(11) NOT NULL,
  `rpp_amount` int(11) NOT NULL,
  `fk_rider_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sh_profit`
--

CREATE TABLE `sh_profit` (
  `sh_profit_id` int(11) NOT NULL,
  `table_name` varchar(100) NOT NULL,
  `profit_percent` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
  `ws_status` varchar(30) NOT NULL DEFAULT 'active',
  `ws_password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `wholesaler`
--

INSERT INTO `wholesaler` (`ws_id`, `ws_name`, `ws_company_name`, `ws_home_address`, `ws_office_address`, `ws_personal_contact`, `ws_office_contact`, `ws_cnic`, `ws_image`, `ws_email`, `ws_status`, `ws_password`) VALUES
(1, 'Abdullah', 'Smart Sales', 'Rahwali, Gujranwala', 'Rahwali, Gujranwala', '03457687675', '03128776456', '0987667767656', '4get_in_touch_image.jpg', 'smart@sales.com', 'active', '202cb962ac59075b964b07152d234b70'),
(2, 'Ali', '', 'sdh', 'ksdlfj', '+923135654321', '+923165673656', '76675-9876543-8', 'download (3).jpg', 'email@mail.com', 'active', '202cb962ac59075b964b07152d234b70'),
(4, 'Abdullah Javaid', 'Himalayas', 'Gujranwala', 'Gujranwala', '+923145655543', '+923457666546', '34154-7654322-0', '4get_in_touch_image.jpg', 'abd@mail.com', 'active', '202cb962ac59075b964b07152d234b70'),
(5, 'name', 'name', 'klsdjfl', 'lksjfd', '+923456556666', '+923336666666', '36363-8737033-4', '5whats_new.jpg', 's@s.com', 'active', '698d51a19d8a121ce581499d7b701668'),
(6, 'js', 'js', 'gj', 'g', '+923154565456', '+923216776567', '32414-9876543-9', '6_large_image_1.jpg', 'email@z.com', 'active', '202cb962ac59075b964b07152d234b70'),
(7, 'abd1', 'abd1', 'Gujranwala', 'Gujranwala', '+923457665454', '+923123454345', '65454-9876760-9', '7images-2.jpg', 'abd1@mail.com', 'active', '202cb962ac59075b964b07152d234b70');

-- --------------------------------------------------------

--
-- Table structure for table `ws_notification`
--

CREATE TABLE `ws_notification` (
  `id` int(11) NOT NULL,
  `message` text NOT NULL,
  `date` date NOT NULL,
  `is_read` varchar(50) NOT NULL DEFAULT 'unread',
  `fk_ws_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ws_payment_details`
--

CREATE TABLE `ws_payment_details` (
  `wsp_id` int(11) NOT NULL,
  `wsp_amount` int(11) NOT NULL,
  `wsp_paid` int(11) NOT NULL,
  `date` date NOT NULL,
  `fk_ws_id` int(11) NOT NULL,
  `fk_delivery_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ws_payment_records`
--

CREATE TABLE `ws_payment_records` (
  `wsr_id` int(11) NOT NULL,
  `wsr_image` varchar(255) NOT NULL,
  `wsr_paid` int(11) NOT NULL,
  `date` date NOT NULL,
  `fk_ws_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ws_pending_payments`
--

CREATE TABLE `ws_pending_payments` (
  `wspp_id` int(11) NOT NULL,
  `wspp_amount` int(11) NOT NULL,
  `fk_ws_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ws_warnings`
--

CREATE TABLE `ws_warnings` (
  `warning_id` int(11) NOT NULL,
  `warning_reason` text NOT NULL,
  `fk_item_id` int(11) NOT NULL,
  `fk_ws_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `ws_warnings`
--

INSERT INTO `ws_warnings` (`warning_id`, `warning_reason`, `fk_item_id`, `fk_ws_id`) VALUES
(1, 'You are so lazy', 4, 1),
(2, 'I dont like you', 4, 1),
(3, 'You are crazy', 4, 1),
(4, 'I don\'t know you', 4, 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`admin_id`),
  ADD KEY `fk_wh_id_for_admin` (`fk_wh_id`);

--
-- Indexes for table `admin_notification`
--
ALTER TABLE `admin_notification`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_wh_id_for_admin_notification` (`fk_wh_id`);

--
-- Indexes for table `bd_notification`
--
ALTER TABLE `bd_notification`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_bd_id_for_bd_notification` (`fk_bd_id`);

--
-- Indexes for table `bd_payment_details`
--
ALTER TABLE `bd_payment_details`
  ADD PRIMARY KEY (`bdp_id`),
  ADD KEY `fk_bd_id_for_bd_payment_details` (`fk_bd_id`),
  ADD KEY `fk_delivery_id_for_bd_payment_details` (`fk_delivery_id`);

--
-- Indexes for table `bd_payment_records`
--
ALTER TABLE `bd_payment_records`
  ADD PRIMARY KEY (`bdr_id`),
  ADD KEY `fk_bd_id_for_bd_payment_records` (`fk_bd_id`);

--
-- Indexes for table `bd_pending_payments`
--
ALTER TABLE `bd_pending_payments`
  ADD PRIMARY KEY (`bdpp_id`),
  ADD KEY `fk_bd_id_for_bd_pending_payments` (`fk_bd_id`);

--
-- Indexes for table `brand`
--
ALTER TABLE `brand`
  ADD PRIMARY KEY (`brand_id`);

--
-- Indexes for table `business_developer`
--
ALTER TABLE `business_developer`
  ADD PRIMARY KEY (`bd_id`);

--
-- Indexes for table `buyer`
--
ALTER TABLE `buyer`
  ADD PRIMARY KEY (`buyer_id`),
  ADD KEY `fk_bd_id_for_buyer` (`fk_bd_id`),
  ADD KEY `fk_rider_id_for_buyer` (`fk_rider_id`);

--
-- Indexes for table `buyer_notification`
--
ALTER TABLE `buyer_notification`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_buyer_id_for_buyer_notification` (`fk_buyer_id`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`category_id`);

--
-- Indexes for table `company_earnings`
--
ALTER TABLE `company_earnings`
  ADD PRIMARY KEY (`earning_id`),
  ADD KEY `fk_delivery_id_for_company_earnings` (`fk_delivery_id`);

--
-- Indexes for table `delivery`
--
ALTER TABLE `delivery`
  ADD PRIMARY KEY (`delivery_id`),
  ADD KEY `fk_item_adj_id_for_delivery` (`fk_item_adj_id`),
  ADD KEY `fk_buyer_id_for_delivery` (`fk_buyer_id`);

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
-- Indexes for table `item_adjustment`
--
ALTER TABLE `item_adjustment`
  ADD PRIMARY KEY (`item_adj_id`),
  ADD KEY `fk_item_id_for_item_adjustment` (`fk_item_id`);

--
-- Indexes for table `item_rejection`
--
ALTER TABLE `item_rejection`
  ADD PRIMARY KEY (`rejection_id`),
  ADD KEY `fk_item_id_for_rejection` (`fk_item_id`);

--
-- Indexes for table `item_tracking`
--
ALTER TABLE `item_tracking`
  ADD PRIMARY KEY (`item_tracking_id`),
  ADD KEY `fk_wh_id_for_item_tracking` (`fk_wh_id`),
  ADD KEY `fk_ws_id_for_item_tracking` (`fk_ws_id`);

--
-- Indexes for table `rider`
--
ALTER TABLE `rider`
  ADD PRIMARY KEY (`rider_id`);

--
-- Indexes for table `rider_notification`
--
ALTER TABLE `rider_notification`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_rider_id_for_rider_notification` (`fk_rider_id`);

--
-- Indexes for table `rider_payment_details`
--
ALTER TABLE `rider_payment_details`
  ADD PRIMARY KEY (`rp_id`),
  ADD KEY `fk_rider_id_for_rider_payment_details` (`fk_rider_id`),
  ADD KEY `fk_delivery_id_for_rider_payment_details` (`fk_delivery_id`);

--
-- Indexes for table `rider_payment_records`
--
ALTER TABLE `rider_payment_records`
  ADD PRIMARY KEY (`rr_id`),
  ADD KEY `fk_rider_id_for_rider_payment_records` (`fk_rider_id`);

--
-- Indexes for table `rider_pending_payments`
--
ALTER TABLE `rider_pending_payments`
  ADD PRIMARY KEY (`rpp_id`),
  ADD KEY `fk_rider_id_for_rider_pending_payments` (`fk_rider_id`);

--
-- Indexes for table `sh_profit`
--
ALTER TABLE `sh_profit`
  ADD PRIMARY KEY (`sh_profit_id`);

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
-- Indexes for table `ws_notification`
--
ALTER TABLE `ws_notification`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_ws_id_for_ws_notification` (`fk_ws_id`);

--
-- Indexes for table `ws_payment_details`
--
ALTER TABLE `ws_payment_details`
  ADD PRIMARY KEY (`wsp_id`),
  ADD KEY `fk_ws_id_for_ws_payment_details` (`fk_ws_id`),
  ADD KEY `fk_delivery_id_for_ws_payment_details` (`fk_delivery_id`);

--
-- Indexes for table `ws_payment_records`
--
ALTER TABLE `ws_payment_records`
  ADD PRIMARY KEY (`wsr_id`),
  ADD KEY `fk_ws_id_for_ws_payment_records` (`fk_ws_id`);

--
-- Indexes for table `ws_pending_payments`
--
ALTER TABLE `ws_pending_payments`
  ADD PRIMARY KEY (`wspp_id`),
  ADD KEY `fk_ws_id_for_ws_pending_payments` (`fk_ws_id`);

--
-- Indexes for table `ws_warnings`
--
ALTER TABLE `ws_warnings`
  ADD PRIMARY KEY (`warning_id`),
  ADD KEY `fk_item_id_for_warning` (`fk_item_id`),
  ADD KEY `fk_ws_id_for_warning` (`fk_ws_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `admin_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `admin_notification`
--
ALTER TABLE `admin_notification`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `bd_notification`
--
ALTER TABLE `bd_notification`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `bd_payment_details`
--
ALTER TABLE `bd_payment_details`
  MODIFY `bdp_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `bd_payment_records`
--
ALTER TABLE `bd_payment_records`
  MODIFY `bdr_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `bd_pending_payments`
--
ALTER TABLE `bd_pending_payments`
  MODIFY `bdpp_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `brand`
--
ALTER TABLE `brand`
  MODIFY `brand_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `business_developer`
--
ALTER TABLE `business_developer`
  MODIFY `bd_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `buyer`
--
ALTER TABLE `buyer`
  MODIFY `buyer_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `buyer_notification`
--
ALTER TABLE `buyer_notification`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `category_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `company_earnings`
--
ALTER TABLE `company_earnings`
  MODIFY `earning_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `delivery`
--
ALTER TABLE `delivery`
  MODIFY `delivery_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `items`
--
ALTER TABLE `items`
  MODIFY `item_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `items_sold`
--
ALTER TABLE `items_sold`
  MODIFY `sell_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `item_adjustment`
--
ALTER TABLE `item_adjustment`
  MODIFY `item_adj_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `item_rejection`
--
ALTER TABLE `item_rejection`
  MODIFY `rejection_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `item_tracking`
--
ALTER TABLE `item_tracking`
  MODIFY `item_tracking_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `rider`
--
ALTER TABLE `rider`
  MODIFY `rider_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `rider_notification`
--
ALTER TABLE `rider_notification`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `rider_payment_details`
--
ALTER TABLE `rider_payment_details`
  MODIFY `rp_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `rider_payment_records`
--
ALTER TABLE `rider_payment_records`
  MODIFY `rr_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `rider_pending_payments`
--
ALTER TABLE `rider_pending_payments`
  MODIFY `rpp_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sh_profit`
--
ALTER TABLE `sh_profit`
  MODIFY `sh_profit_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `warehouse`
--
ALTER TABLE `warehouse`
  MODIFY `wh_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `wholesaler`
--
ALTER TABLE `wholesaler`
  MODIFY `ws_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `ws_notification`
--
ALTER TABLE `ws_notification`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ws_payment_details`
--
ALTER TABLE `ws_payment_details`
  MODIFY `wsp_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ws_payment_records`
--
ALTER TABLE `ws_payment_records`
  MODIFY `wsr_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ws_pending_payments`
--
ALTER TABLE `ws_pending_payments`
  MODIFY `wspp_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ws_warnings`
--
ALTER TABLE `ws_warnings`
  MODIFY `warning_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `admin`
--
ALTER TABLE `admin`
  ADD CONSTRAINT `fk_wh_id_for_admin` FOREIGN KEY (`fk_wh_id`) REFERENCES `warehouse` (`wh_id`);

--
-- Constraints for table `admin_notification`
--
ALTER TABLE `admin_notification`
  ADD CONSTRAINT `fk_wh_id_for_admin_notification` FOREIGN KEY (`fk_wh_id`) REFERENCES `warehouse` (`wh_id`);

--
-- Constraints for table `bd_notification`
--
ALTER TABLE `bd_notification`
  ADD CONSTRAINT `fk_bd_id_for_bd_notification` FOREIGN KEY (`fk_bd_id`) REFERENCES `business_developer` (`bd_id`);

--
-- Constraints for table `bd_payment_details`
--
ALTER TABLE `bd_payment_details`
  ADD CONSTRAINT `fk_bd_id_for_bd_payment_details` FOREIGN KEY (`fk_bd_id`) REFERENCES `business_developer` (`bd_id`),
  ADD CONSTRAINT `fk_delivery_id_for_bd_payment_details` FOREIGN KEY (`fk_delivery_id`) REFERENCES `delivery` (`delivery_id`);

--
-- Constraints for table `bd_payment_records`
--
ALTER TABLE `bd_payment_records`
  ADD CONSTRAINT `fk_bd_id_for_bd_payment_records` FOREIGN KEY (`fk_bd_id`) REFERENCES `business_developer` (`bd_id`);

--
-- Constraints for table `bd_pending_payments`
--
ALTER TABLE `bd_pending_payments`
  ADD CONSTRAINT `fk_bd_id_for_bd_pending_payments` FOREIGN KEY (`fk_bd_id`) REFERENCES `business_developer` (`bd_id`);

--
-- Constraints for table `buyer`
--
ALTER TABLE `buyer`
  ADD CONSTRAINT `fk_bd_id_for_buyer` FOREIGN KEY (`fk_bd_id`) REFERENCES `business_developer` (`bd_id`),
  ADD CONSTRAINT `fk_rider_id_for_buyer` FOREIGN KEY (`fk_rider_id`) REFERENCES `rider` (`rider_id`);

--
-- Constraints for table `buyer_notification`
--
ALTER TABLE `buyer_notification`
  ADD CONSTRAINT `fk_buyer_id_for_buyer_notification` FOREIGN KEY (`fk_buyer_id`) REFERENCES `buyer` (`buyer_id`);

--
-- Constraints for table `company_earnings`
--
ALTER TABLE `company_earnings`
  ADD CONSTRAINT `fk_delivery_id_for_company_earnings` FOREIGN KEY (`fk_delivery_id`) REFERENCES `delivery` (`delivery_id`);

--
-- Constraints for table `delivery`
--
ALTER TABLE `delivery`
  ADD CONSTRAINT `fk_buyer_id_for_delivery` FOREIGN KEY (`fk_buyer_id`) REFERENCES `buyer` (`buyer_id`),
  ADD CONSTRAINT `fk_item_adj_id_for_delivery` FOREIGN KEY (`fk_item_adj_id`) REFERENCES `item_adjustment` (`item_adj_id`);

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
-- Constraints for table `item_adjustment`
--
ALTER TABLE `item_adjustment`
  ADD CONSTRAINT `fk_item_id_for_item_adjustment` FOREIGN KEY (`fk_item_id`) REFERENCES `items` (`item_id`);

--
-- Constraints for table `item_rejection`
--
ALTER TABLE `item_rejection`
  ADD CONSTRAINT `fk_item_id_for_rejection` FOREIGN KEY (`fk_item_id`) REFERENCES `items` (`item_id`);

--
-- Constraints for table `item_tracking`
--
ALTER TABLE `item_tracking`
  ADD CONSTRAINT `fk_wh_id_for_item_tracking` FOREIGN KEY (`fk_wh_id`) REFERENCES `warehouse` (`wh_id`),
  ADD CONSTRAINT `fk_ws_id_for_item_tracking` FOREIGN KEY (`fk_ws_id`) REFERENCES `wholesaler` (`ws_id`);

--
-- Constraints for table `rider_notification`
--
ALTER TABLE `rider_notification`
  ADD CONSTRAINT `fk_rider_id_for_rider_notification` FOREIGN KEY (`fk_rider_id`) REFERENCES `rider` (`rider_id`);

--
-- Constraints for table `rider_payment_details`
--
ALTER TABLE `rider_payment_details`
  ADD CONSTRAINT `fk_delivery_id_for_rider_payment_details` FOREIGN KEY (`fk_delivery_id`) REFERENCES `delivery` (`delivery_id`),
  ADD CONSTRAINT `fk_rider_id_for_rider_payment_details` FOREIGN KEY (`fk_rider_id`) REFERENCES `rider` (`rider_id`);

--
-- Constraints for table `rider_payment_records`
--
ALTER TABLE `rider_payment_records`
  ADD CONSTRAINT `fk_rider_id_for_rider_payment_records` FOREIGN KEY (`fk_rider_id`) REFERENCES `rider` (`rider_id`);

--
-- Constraints for table `rider_pending_payments`
--
ALTER TABLE `rider_pending_payments`
  ADD CONSTRAINT `fk_rider_id_for_rider_pending_payments` FOREIGN KEY (`fk_rider_id`) REFERENCES `rider` (`rider_id`);

--
-- Constraints for table `ws_notification`
--
ALTER TABLE `ws_notification`
  ADD CONSTRAINT `fk_ws_id_for_ws_notification` FOREIGN KEY (`fk_ws_id`) REFERENCES `wholesaler` (`ws_id`);

--
-- Constraints for table `ws_payment_details`
--
ALTER TABLE `ws_payment_details`
  ADD CONSTRAINT `fk_delivery_id_for_ws_payment_details` FOREIGN KEY (`fk_delivery_id`) REFERENCES `delivery` (`delivery_id`),
  ADD CONSTRAINT `fk_ws_id_for_ws_payment_details` FOREIGN KEY (`fk_ws_id`) REFERENCES `wholesaler` (`ws_id`);

--
-- Constraints for table `ws_payment_records`
--
ALTER TABLE `ws_payment_records`
  ADD CONSTRAINT `fk_ws_id_for_ws_payment_records` FOREIGN KEY (`fk_ws_id`) REFERENCES `wholesaler` (`ws_id`);

--
-- Constraints for table `ws_pending_payments`
--
ALTER TABLE `ws_pending_payments`
  ADD CONSTRAINT `fk_ws_id_for_ws_pending_payments` FOREIGN KEY (`fk_ws_id`) REFERENCES `wholesaler` (`ws_id`);

--
-- Constraints for table `ws_warnings`
--
ALTER TABLE `ws_warnings`
  ADD CONSTRAINT `fk_item_id_for_warning` FOREIGN KEY (`fk_item_id`) REFERENCES `items` (`item_id`),
  ADD CONSTRAINT `fk_ws_id_for_warning` FOREIGN KEY (`fk_ws_id`) REFERENCES `wholesaler` (`ws_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
