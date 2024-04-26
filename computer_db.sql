-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 29, 2023 at 03:56 PM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.0.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `computer_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `id` int(10) UNSIGNED NOT NULL,
  `username` varchar(60) NOT NULL,
  `password` varchar(60) NOT NULL,
  `email` varchar(60) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `gender` tinyint(2) NOT NULL DEFAULT 1,
  `fullname` varchar(60) NOT NULL,
  `lever` tinyint(4) NOT NULL DEFAULT 0,
  `status` tinyint(2) NOT NULL DEFAULT 1,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id`, `username`, `password`, `email`, `phone`, `gender`, `fullname`, `lever`, `status`, `created_at`, `updated_at`) VALUES
(1, '123Boss', '8a134c42eee93eb7cc8a57cb1278aae5', 'admin@gmail.com', '0999999999', 1, 'Boss shop', 1, 1, '2022-05-02 15:50:38', '2023-11-29 00:49:03'),
(2, 'vuongquoc', '5e4997230bf822b3240823547bd1effd', 'vuongquoc@gmail.com', '0345678945', 1, 'Quốc Vương', 2, 0, '2022-05-02 15:50:38', '2023-11-29 00:53:22'),
(6, 'admin1', '5e4997230bf822b3240823547bd1effd', 'admin1@gmail.com', '0356565656', 0, 'ZZZZZZZZ', 0, 1, '2022-05-04 17:02:20', '2023-11-29 00:52:59'),
(8, 'admin2', 'c84258e9c39059a89ab77d846ddab909', 'admin2@gmail.com', '0795446708', 1, 'Cao Cao', 0, 1, '2023-11-29 00:56:04', '2023-11-29 00:56:04');

-- --------------------------------------------------------

--
-- Table structure for table `advertise`
--

CREATE TABLE `advertise` (
  `id` int(10) UNSIGNED NOT NULL,
  `manufacturer_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `photo` varchar(200) NOT NULL,
  `rules` tinyint(4) NOT NULL DEFAULT 1,
  `created_at` datetime DEFAULT current_timestamp(),
  `deleted_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `advertise`
--

INSERT INTO `advertise` (`id`, `manufacturer_id`, `product_id`, `photo`, `rules`, `created_at`, `deleted_at`, `updated_at`) VALUES
(6, 10, 8, 'banner.png', 1, NULL, NULL, '2022-05-14 22:22:18'),
(7, 9, 15, 'banner1.png', 1, NULL, NULL, '2022-05-14 22:22:16'),
(8, 11, 7, 'banner2.png', 1, NULL, NULL, '2022-05-14 22:22:13'),
(9, 10, 8, 'banner3.png', 1, NULL, NULL, '2022-05-14 22:22:11'),
(16, 24, 0, 'b1.jpg', 3, NULL, NULL, '2022-05-14 22:22:08'),
(17, 24, 0, 'b2.jpg', 3, NULL, NULL, '2022-05-14 22:22:06'),
(18, 14, 0, 'b3.png', 2, NULL, NULL, '2022-05-14 22:22:01'),
(19, 23, 0, 'b4.png', 2, NULL, NULL, '2022-05-14 22:22:03'),
(20, 24, 0, 'b5.jpg', 2, '2022-05-14 22:21:02', NULL, '2023-11-28 00:26:26');

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `product_lap_id` int(11) NOT NULL,
  `content` text NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `config_laptop`
--

CREATE TABLE `config_laptop` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `name_detail` varchar(50) NOT NULL,
  `icon` varchar(150) DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `deleted_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `config_laptop`
--

INSERT INTO `config_laptop` (`id`, `name`, `name_detail`, `icon`, `created_at`, `deleted_at`, `updated_at`) VALUES
(1, 'ram', 'Dung lượng RAM', NULL, '2022-05-09 17:03:07', NULL, '2022-05-09 17:03:07'),
(2, 'ssd', 'Ổ cứng', NULL, '2022-05-09 17:03:35', NULL, '2022-05-09 17:03:35'),
(3, 'cpu', 'Loại CPU', NULL, '2022-05-09 17:03:43', NULL, '2022-05-09 17:03:43'),
(4, 'screen', 'Kích thước màn hình', NULL, '2022-05-09 17:03:43', NULL, '2022-05-09 17:03:43');

-- --------------------------------------------------------

--
-- Table structure for table `config_product_laptop`
--

CREATE TABLE `config_product_laptop` (
  `pro_laptop_id` int(11) NOT NULL,
  `config_laptop_id` int(11) NOT NULL,
  `values` varchar(100) NOT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `deleted_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `config_product_laptop`
--

INSERT INTO `config_product_laptop` (`pro_laptop_id`, `config_laptop_id`, `values`, `created_at`, `deleted_at`, `updated_at`) VALUES
(1, 1, '8GB', '2022-05-09 21:55:53', NULL, '2022-05-09 21:55:53'),
(2, 1, '8GB', '2022-05-09 22:30:33', NULL, '2022-05-09 22:30:33'),
(3, 1, '16GB', '2022-05-10 01:21:49', NULL, '2022-05-10 01:21:49'),
(4, 1, '4GB', '0000-00-00 00:00:00', NULL, '2022-05-10 02:37:38'),
(10, 1, '8GB', '2022-05-10 02:49:00', NULL, '2022-05-10 02:49:00'),
(11, 1, '8GB', '2022-05-10 02:50:58', NULL, '2022-05-10 02:50:58'),
(15, 1, '8GB', '2022-05-14 21:57:39', NULL, '2022-05-14 21:57:39'),
(1, 2, '512GB M.2 NVMe™ PCIe® 3.0', '2022-05-09 21:55:53', NULL, '2022-05-09 21:55:53'),
(2, 2, '256GB', '2022-05-09 22:30:33', NULL, '2022-05-09 22:30:33'),
(3, 2, '512GB SSD', '2022-05-10 01:21:49', NULL, '2022-05-10 01:21:49'),
(4, 2, '512GB SSD PCle NVMe', '0000-00-00 00:00:00', NULL, '2022-05-10 02:37:38'),
(10, 2, '512GB SSD NVMe M.2 PCIe Gen 3 x 4', '2022-05-10 02:49:00', NULL, '2022-05-10 02:49:00'),
(11, 2, '512GB M.2 NVMe™ PCIe® 3.0 SSD', '2022-05-10 02:50:58', NULL, '2022-05-10 02:50:58'),
(15, 2, '512GB NVMe PCIe Gen3x4 SSD, 2 khe M.2 SSD NVMe PCIe Gen3x4', '2022-05-14 21:57:39', NULL, '2022-05-14 21:57:39'),
(1, 3, 'Intel® Core™ i5-10300H', '2022-05-09 21:55:53', NULL, '2022-05-09 21:55:53'),
(2, 3, 'Intel Core i3 Gen 11', '2022-05-09 22:30:33', NULL, '2022-05-09 22:30:33'),
(3, 3, 'M1 Pro/M1 Max', '2022-05-10 01:21:49', NULL, '2022-05-10 01:21:49'),
(4, 3, 'Intel Core i5-1135G7 2.40 GHz up to 4.20 GHz, 8MB', '0000-00-00 00:00:00', NULL, '2022-05-10 02:37:38'),
(10, 3, 'AMD Ryzen 7 4800H', '2022-05-10 02:49:00', NULL, '2022-05-10 02:49:00'),
(11, 3, 'Intel® Core™ i5-1135G7', '2022-05-10 02:50:58', NULL, '2022-05-10 02:50:58'),
(15, 3, 'AMD RyzenTM 7 5700U', '2022-05-14 21:57:39', NULL, '2022-05-14 21:57:39'),
(1, 4, '15.6 inches', '2022-05-09 21:55:53', NULL, '2022-05-09 21:55:53'),
(2, 4, '14 inches', '2022-05-09 22:30:33', NULL, '2022-05-09 22:30:33'),
(3, 4, '14.2 inches', '2022-05-10 01:21:49', NULL, '2022-05-10 01:21:49'),
(4, 4, '14 inches', '0000-00-00 00:00:00', NULL, '2022-05-10 02:37:38'),
(10, 4, '15.6 inches', '2022-05-10 02:49:00', NULL, '2022-05-10 02:49:00'),
(11, 4, '14 inches', '2022-05-10 02:50:58', NULL, '2022-05-10 02:50:58'),
(15, 4, '15.6 inches', '2022-05-14 21:57:39', NULL, '2022-05-14 21:57:39');

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(200) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `status` tinyint(2) NOT NULL DEFAULT 1,
  `gender` tinyint(2) NOT NULL DEFAULT 1,
  `address` varchar(200) DEFAULT NULL,
  `token` varchar(50) DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `deleted_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`id`, `name`, `email`, `password`, `phone`, `status`, `gender`, `address`, `token`, `created_at`, `deleted_at`, `updated_at`) VALUES
(1, 'long3', 'long3@gmail.com', '202cb962ac59075b964b07152d234b70', '321', 1, 1, '123 meo2', NULL, '2022-05-05 16:35:47', '2022-05-14 21:03:58', '2022-05-20 16:49:09'),
(35, 'toan1', 'toan1@gmail.com', '100ed97f6f776fc4bf78f00a00e0ee19', '0963836224', 1, 1, 'Hà Nội', NULL, '2023-01-11 09:51:35', NULL, '2023-01-11 09:51:35'),
(36, 'toan2', 'toan2@gmail.com', '100ed97f6f776fc4bf78f00a00e0ee19', '0963836224', 1, 1, 'Thái Bình', NULL, '2023-01-11 09:52:22', NULL, '2023-01-11 09:52:22'),
(37, 'quoc', 'quoc@gmail.com', 'f6d0a7bf3af1d84dd93c800e4b57fa04', '0795446708', 1, 1, 'Cần Thơ', NULL, '2023-11-17 22:01:37', NULL, '2023-11-17 22:01:37'),
(38, 'quoc2', 'quoc2@gmail.com', '8a134c42eee93eb7cc8a57cb1278aae5', '0795446708', 1, 1, 'an giang', NULL, '2023-11-22 20:15:07', NULL, '2023-11-22 20:15:07'),
(44, 'vuong quoc', 'quoc3@gmail.com', 'f6d0a7bf3af1d84dd93c800e4b57fa04', '0795446708', 1, 1, 'Cần Thơ', NULL, '2023-11-27 23:40:11', NULL, '2023-11-27 23:40:11'),
(49, 'Nam', 'quoc5@gmail.com', 'f6d0a7bf3af1d84dd93c800e4b57fa04', '0795446708', 1, 1, 'Cần Thơ', NULL, '2023-11-28 00:05:27', NULL, '2023-11-28 00:05:27');

-- --------------------------------------------------------

--
-- Table structure for table `forgot_password`
--

CREATE TABLE `forgot_password` (
  `customer_id` int(11) NOT NULL,
  `token` varchar(250) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `manufactures`
--

CREATE TABLE `manufactures` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `address` text NOT NULL,
  `phone` char(15) NOT NULL,
  `photo` varchar(200) NOT NULL,
  `rules` tinyint(3) NOT NULL DEFAULT 1,
  `created_at` datetime DEFAULT current_timestamp(),
  `deleted_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `manufactures`
--

INSERT INTO `manufactures` (`id`, `name`, `address`, `phone`, `photo`, `rules`, `created_at`, `deleted_at`, `updated_at`) VALUES
(5, 'Minion', 'Việt Nam', '0202022', '!!!!', 0, NULL, NULL, NULL),
(6, 'PHANTOM', 'Tàu', '+8912121212', '!!!!', 1, NULL, NULL, NULL),
(9, 'VIPER & TITAN', 'Mỹ', '3232323232', '', 1, NULL, NULL, NULL),
(10, 'MINION WHITE', 'Hàn quóc', '-980004448', '', 1, NULL, NULL, NULL),
(11, 'G-STUDIO', 'Tàu', '-00444111', '', 1, NULL, NULL, NULL),
(14, 'Asus', 'Tàu', '+999', '', 2, '0000-00-00 00:00:00', NULL, '0000-00-00 00:00:00'),
(20, 'HP', 'Nhật', '+999', '', 2, '0000-00-00 00:00:00', NULL, '0000-00-00 00:00:00'),
(22, 'Dell', 'Mỹ tho', '+888', '', 2, '0000-00-00 00:00:00', NULL, '0000-00-00 00:00:00'),
(23, 'MSI', 'Tân bắc, Đài loan', '+777', '', 2, '0000-00-00 00:00:00', NULL, '0000-00-00 00:00:00'),
(24, 'Apple(macbook)', 'mỹ tho', '+9999', '', 2, '0000-00-00 00:00:00', NULL, '0000-00-00 00:00:00'),
(29, 'ROG Strix Scar', 'TP.HCM', '0795446708', '111', 1, '2023-11-29 00:45:49', NULL, '2023-11-29 00:45:49');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `name_receiver` varchar(60) NOT NULL,
  `phone_receiver` varchar(20) NOT NULL,
  `address_receiver` varchar(200) NOT NULL,
  `status` tinyint(2) NOT NULL DEFAULT 1,
  `total_price` float NOT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `deleted_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `customer_id`, `name_receiver`, `phone_receiver`, `address_receiver`, `status`, `total_price`, `created_at`, `deleted_at`, `updated_at`) VALUES
(3, 1, 'long3', '321', 'meo 321', 2, 30990000, '2022-04-01 08:55:37', NULL, '2022-05-01 08:55:37'),
(4, 1, 'long3', '321', '123 meo2', 2, 18290000, '2022-05-01 09:49:11', NULL, '2022-05-01 09:49:11'),
(5, 2, 'ko phai meo dau', '20999', 'meo ko o nha', 2, 91130000, '2022-05-03 10:15:34', NULL, '2022-05-03 10:15:34'),
(6, 2, 'meo duc', '242424', 'meo duc boy', 1, 10600000, '2022-05-03 17:37:00', NULL, '2022-05-03 17:37:00'),
(7, 2, 'meo', '12121', 'meo hoang', 0, 65730000, '2022-05-06 18:35:49', NULL, '2022-05-06 18:35:49'),
(13, 3, 'lucas', '+99999', '-99999', 1, 31380000, '2022-05-10 08:44:03', NULL, '2022-05-10 08:44:03'),
(14, 3, 'lucas', '+99999', '-99999', 0, 37780000, '2022-05-13 17:39:36', NULL, '2022-05-13 17:39:36'),
(15, 3, 'lucas', '+99999', '-99999', 0, 18290000, '2022-05-14 14:06:53', NULL, '2022-05-14 14:06:53'),
(16, 3, 'lucas', '+99999', 'ko quen', 0, 58300000, '2022-05-22 08:45:01', NULL, '2022-05-22 08:45:01'),
(17, 3, 'lucas', '+99999', 'quen', 1, 47070000, '2022-05-22 08:45:12', NULL, '2022-05-22 08:45:12'),
(18, 44, 'vuong quoc', '0795446708', 'Cần Thơ', 1, 10490000, '2023-11-27 16:43:06', NULL, '2023-11-27 16:43:06'),
(19, 44, 'vuong quoc', '0795446708', 'Cần Thơ', 0, 154500000, '2023-11-27 17:00:19', NULL, '2023-11-27 17:00:19'),
(20, 49, 'Nam', '0795446708', 'Cần Thơ', 1, 51000000, '2023-11-27 17:05:46', NULL, '2023-11-27 17:05:46'),
(21, 44, 'vuong quoc', '0795446708', 'Cần Thơ', 2, 9490000, '2023-11-28 16:48:55', NULL, '2023-11-28 16:48:55');

-- --------------------------------------------------------

--
-- Table structure for table `order_detail`
--

CREATE TABLE `order_detail` (
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `product_lp_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `deleted_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `order_detail`
--

INSERT INTO `order_detail` (`order_id`, `product_id`, `product_lp_id`, `quantity`, `created_at`, `deleted_at`, `updated_at`) VALUES
(13, 0, 11, 2, '2022-05-10 15:44:03', NULL, '2022-05-10 15:44:03'),
(14, 0, 10, 2, '2022-05-14 00:39:36', NULL, '2022-05-14 00:39:36'),
(17, 0, 11, 3, '2022-05-22 15:45:12', NULL, '2022-05-22 15:45:12'),
(19, 7, 0, 1, '2023-11-28 00:00:19', NULL, '2023-11-28 00:00:19'),
(3, 8, 0, 1, '2022-05-13 09:02:23', NULL, NULL),
(5, 8, 0, 2, NULL, NULL, NULL),
(18, 8, 0, 1, '2023-11-27 23:43:06', NULL, '2023-11-27 23:43:06'),
(4, 9, 0, 1, '2022-05-13 09:02:23', NULL, NULL),
(7, 9, 0, 2, NULL, NULL, NULL),
(15, 9, 0, 1, '2022-05-14 21:06:53', NULL, '2022-05-14 21:06:53'),
(19, 9, 0, 1, '2023-11-28 00:00:19', NULL, '2023-11-28 00:00:19'),
(20, 9, 0, 1, '2023-11-28 00:05:46', NULL, '2023-11-28 00:05:46'),
(6, 10, 0, 2, NULL, NULL, NULL),
(21, 10, 0, 1, '2023-11-28 23:48:55', NULL, '2023-11-28 23:48:55'),
(5, 15, 0, 1, NULL, NULL, NULL),
(7, 15, 0, 1, NULL, NULL, NULL),
(16, 15, 0, 2, '2022-05-22 15:45:01', NULL, '2022-05-22 15:45:01');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `photo` varchar(200) NOT NULL,
  `price` float NOT NULL,
  `descriptions` text NOT NULL,
  `slug` varchar(200) NOT NULL,
  `manufacturer_id` int(11) NOT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `deleted_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `photo`, `price`, `descriptions`, `slug`, `manufacturer_id`, `created_at`, `deleted_at`, `updated_at`) VALUES
(7, 'G-STUDIO 9 PlUS i4090', 'gstudio-9pl.jpg', 103500000, 'Mọi bộ PC đồ họa đều có những yêu cầu về khai thác sức mạnh, tất cả những điều ấy sẽ được ASUS ProArt Z790 CREATOR WIFI DDR5 đáp ứng. Hoàn thiện từ series mainboard ProArt chuyên phục vụ cho công việc sáng tạo, chiếc mainboard ASUS trang bị chipset Z790 mạnh mẽ nhằm đáp ứng sức mạnh từ những CPU thế hệ mới nhất từ Intel như Intel Gen 13. Sở hữu những chuẩn kết nối tiên tiến nhất, ASUS ProArt Z790 CREATOR WIFI DDR5 sẽ khai thác và trình bày mọi tinh hoa của mình đến với người dùng sáng tạo.', '⭐Tặng ngay màn hình ASUS ProArt PA278CV trị giá 10,990,000đ, Mua thêm RAM giảm ngay 300,000đ .\r\n          ⭐Bộ sticker dán \r\n          ⭐Áo mưa \r\n          ⭐Móc khóa, dây đeo và áo khoác\"', 11, NULL, NULL, NULL),
(8, 'MINION i1650 WHITE', 'minion-i1560-w.jpg', 10490000, 'Mọi bộ PC đồ họa đều có những yêu cầu về khai thác sức mạnh, tất cả những điều ấy sẽ được ASUS ProArt Z790 CREATOR WIFI DDR5 đáp ứng. Hoàn thiện từ series mainboard ProArt chuyên phục vụ cho công việc sáng tạo, chiếc mainboard ASUS trang bị chipset Z790 mạnh mẽ nhằm đáp ứng sức mạnh từ những CPU thế hệ mới nhất từ Intel như Intel Gen 13. Sở hữu những chuẩn kết nối tiên tiến nhất, ASUS ProArt Z790 CREATOR WIFI DDR5 sẽ khai thác và trình bày mọi tinh hoa của mình đến với người dùng sáng tạo.', '⭐Tặng ngay màn hình ASUS ProArt PA278CV trị giá 10,990,000đ, Mua thêm RAM giảm ngay 300,000đ .\r\n          ⭐Bộ sticker dán \r\n          ⭐Áo mưa \r\n          ⭐Móc khóa, dây đeo và áo khoác\"', 10, NULL, NULL, NULL),
(9, 'TITAN PLUS i4060Ti', 'titan-pl-i4060ti.jpg', 51000000, 'Mọi bộ PC đồ họa đều có những yêu cầu về khai thác sức mạnh, tất cả những điều ấy sẽ được ASUS ProArt Z790 CREATOR WIFI DDR5 đáp ứng. Hoàn thiện từ series mainboard ProArt chuyên phục vụ cho công việc sáng tạo, chiếc mainboard ASUS trang bị chipset Z790 mạnh mẽ nhằm đáp ứng sức mạnh từ những CPU thế hệ mới nhất từ Intel như Intel Gen 13. Sở hữu những chuẩn kết nối tiên tiến nhất, ASUS ProArt Z790 CREATOR WIFI DDR5 sẽ khai thác và trình bày mọi tinh hoa của mình đến với người dùng sáng tạo.', '⭐Tặng ngay màn hình ASUS ProArt PA278CV trị giá 10,990,000đ, Mua thêm RAM giảm ngay 300,000đ .\r\n          ⭐Bộ sticker dán \r\n          ⭐Áo mưa \r\n          ⭐Móc khóa, dây đeo và áo khoác\"', 9, NULL, NULL, NULL),
(10, 'MINION i1650', 'union-i1650.jpg', 9490000, 'Mọi bộ PC đồ họa đều có những yêu cầu về khai thác sức mạnh, tất cả những điều ấy sẽ được ASUS ProArt Z790 CREATOR WIFI DDR5 đáp ứng. Hoàn thiện từ series mainboard ProArt chuyên phục vụ cho công việc sáng tạo, chiếc mainboard ASUS trang bị chipset Z790 mạnh mẽ nhằm đáp ứng sức mạnh từ những CPU thế hệ mới nhất từ Intel như Intel Gen 13. Sở hữu những chuẩn kết nối tiên tiến nhất, ASUS ProArt Z790 CREATOR WIFI DDR5 sẽ khai thác và trình bày mọi tinh hoa của mình đến với người dùng sáng tạo.', '⭐Tặng ngay màn hình ASUS ProArt PA278CV trị giá 10,990,000đ, Mua thêm RAM giảm ngay 300,000đ .\r\n          ⭐Bộ sticker dán \r\n          ⭐Áo mưa \r\n          ⭐Móc khóa, dây đeo và áo khoác\"', 5, NULL, NULL, NULL),
(14, 'VIPER Plus i3060', 'viper-pl-i3060.jpg', 28990000, 'Mọi bộ PC đồ họa đều có những yêu cầu về khai thác sức mạnh, tất cả những điều ấy sẽ được ASUS ProArt Z790 CREATOR WIFI DDR5 đáp ứng. Hoàn thiện từ series mainboard ProArt chuyên phục vụ cho công việc sáng tạo, chiếc mainboard ASUS trang bị chipset Z790 mạnh mẽ nhằm đáp ứng sức mạnh từ những CPU thế hệ mới nhất từ Intel như Intel Gen 13. Sở hữu những chuẩn kết nối tiên tiến nhất, ASUS ProArt Z790 CREATOR WIFI DDR5 sẽ khai thác và trình bày mọi tinh hoa của mình đến với người dùng sáng tạo.', '⭐Tặng ngay màn hình ASUS ProArt PA278CV trị giá 10,990,000đ, Mua thêm RAM giảm ngay 300,000đ .\r\n          ⭐Bộ sticker dán \r\n          ⭐Áo mưa \r\n          ⭐Móc khóa, dây đeo và áo khoác\"', 9, NULL, NULL, NULL),
(15, 'VIPER PLUS i4060', 'viper-pl-i4060.jpg', 29990000, 'Mọi bộ PC đồ họa đều có những yêu cầu về khai thác sức mạnh, tất cả những điều ấy sẽ được ASUS ProArt Z790 CREATOR WIFI DDR5 đáp ứng. Hoàn thiện từ series mainboard ProArt chuyên phục vụ cho công việc sáng tạo, chiếc mainboard ASUS trang bị chipset Z790 mạnh mẽ nhằm đáp ứng sức mạnh từ những CPU thế hệ mới nhất từ Intel như Intel Gen 13. Sở hữu những chuẩn kết nối tiên tiến nhất, ASUS ProArt Z790 CREATOR WIFI DDR5 sẽ khai thác và trình bày mọi tinh hoa của mình đến với người dùng sáng tạo.', '⭐Tặng ngay màn hình ASUS ProArt PA278CV trị giá 10,990,000đ, Mua thêm RAM giảm ngay 300,000đ .\r\n          ⭐Bộ sticker dán \r\n          ⭐Áo mưa \r\n          ⭐Móc khóa, dây đeo và áo khoác\"', 9, NULL, NULL, NULL),
(17, 'PHANTOM PLUS a4090', 'phantom-pl-a4080.webp', 130500000, 'Mọi bộ PC đồ họa đều có những yêu cầu về khai thác sức mạnh, tất cả những điều ấy sẽ được ASUS ProArt Z790 CREATOR WIFI DDR5 đáp ứng. Hoàn thiện từ series mainboard ProArt chuyên phục vụ cho công việc sáng tạo, chiếc mainboard ASUS trang bị chipset Z790 mạnh mẽ nhằm đáp ứng sức mạnh từ những CPU thế hệ mới nhất từ Intel như Intel Gen 13. Sở hữu những chuẩn kết nối tiên tiến nhất, ASUS ProArt Z790 CREATOR WIFI DDR5 sẽ khai thác và trình bày mọi tinh hoa của mình đến với người dùng sáng tạo.', '⭐Tặng ngay màn hình ASUS ProArt PA278CV trị giá 10,990,000đ, Mua thêm RAM giảm ngay 300,000đ .\r\n          ⭐Bộ sticker dán \r\n          ⭐Áo mưa \r\n          ⭐Móc khóa, dây đeo và áo khoác\"', 6, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `product_laptop`
--

CREATE TABLE `product_laptop` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL,
  `photo` varchar(200) NOT NULL,
  `price` float NOT NULL,
  `descriptions` text NOT NULL,
  `manufacturer_id` int(11) NOT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `deleted_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_laptop`
--

INSERT INTO `product_laptop` (`id`, `name`, `photo`, `price`, `descriptions`, `manufacturer_id`, `created_at`, `deleted_at`, `updated_at`) VALUES
(1, 'Laptop Asus Gaming TUF FX506LH HN188W', '1laptopasus.jpg', 16990000, 'Laptop ASUS Gaming TUF FX506LH-HN188W - Chiếc máy gaming giá rẻ\r\nLaptop ASUS TUF Gaming F15 FX506LH-HN188W là laptop chuẩn gaming và đây sẽ là dòng máy không làm mọi người dùng phải thất vọng vì thông số cấu hình và tính năng của máy. Hãy cùng đi sâu hơn vào những con số lý tưởng laptop Asus Gaming bên dưới nội dung dưới đây nhé.\r\n\r\nChuẩn gaming nhẹ nhàng nhưng bền bỉ\r\nLaptop ASUS Gaming TUF FX506LH-HN188W có trọng lượng vào khoảng 2.2kg. Có thể thấy đây là mẫu thiết kế tuy không quá nhẹ như những chiếc máy phổ thông nhưng gần như là hoàn hảo dành cho một mẫu laptop gaming.\r\n\r\nLaptop ASUS Gaming TUF FX506LH-HN188W\r\n\r\nChưa kể, laptop ASUS Gaming TUF FX506LH-HN188W còn vượt qua được những thử nghiệm MIL-STD-810G nghiêm ngặt bao gồm phơi nhiễm bức xạ mặt trời, độ cao và nhiệt độ cao. Vì thế mà độ bền của laptop này bền bỉ hơn bao giờ hết.\r\n\r\nMàn hình siêu mỏng, bứt phá hiệu năng\r\nLaptop ASUS TUF F15 FX506LH-HN188W được sử dụng màn hình kích thước 15.6 inches Full HD IPS đi kèm màn hình Nano-Edge mới với viền màn hình siêu mỏng, gói gọn trong 6.5 mm giúp mở rộng thêm không gian hiển thị lên nhiều lần.\r\n\r\nLaptop ASUS Gaming TUF FX506LH-HN188W\r\n\r\nNgoài ra, laptop ASUS TUF F15 FX506LH-HN188W được cung cấp hiệu năng bởi con chip Intel Core i5-10300H, xung nhịp tối đa 4.5GHz 4 nhân và 8 luồng. Đây là chip có hiệu năng mạnh mẽ giúp người sử dụng chạy trên trên mọi tựa game với lối đồ họa khác nhau hay đảm nhận các tác vụ văn phòng mượt mà.\r\n\r\nKết hợp cùng với đó là CPU mạnh mẽ được gia cố bởi NVIDIA GeForce GTX 1650 4GB GDDR6, góp phần tạo nên chất lượng của laptop. Điều này còn giúp cho laptop có khả năng phản hồi cao với các tác vụ đồ họa nặng với hình ảnh đầu ra mượt mà nhất.\r\n\r\nMua ngay laptop ASUS Gaming TUF FX506LH-HN188W tại CellphoneS\r\nLaptop ASUS Gaming TUF FX506LH-HN188W đang là phiên bản được bán chạy nhất hiện nay và nhận được nhiều lời khen có cánh. Hãy đến ngay cửa hàng CellphoneS để được tận tay trải nghiệm và tư vấn sản phẩm trước khi đặt mua nhé.', 14, '2022-05-09 21:14:22', NULL, '2022-05-09 21:14:22'),
(2, 'Laptop Dell Insprion 14 5406-3661SLV Nhập khẩu chính hãng', '2dell.jpg', 13990000, 'Laptop Dell insprion 14 5406-3661SLV – Màn hình cảm ứng tiện lợi\r\nLaptop Dell insprion 14 5406-3661SLV là một sản phẩm thuộc thương hiệu Dell với màn hình cảm ứng tiện lợi cùng hiệu năng vượt trội. Chiếc laptop Dell Inspiron này hứa hẹn mang lại những trải nghiệm dùng mượt mà cho người sử dụng.\r\n\r\nThiết kế nhỏ gọn, màn hình hỗ trợ cảm ứng\r\nLaptop Dell insprion 14 5406-3661SLV sở hữu một thiết kế vô cùng nhỏ gọn. Laptop với màn hình 14 inch, độ phân giải cao mang lại khả nang hiển thị rõ nét. Màn hình trên mẫu laptop chất lượng này còn hỗ trợ cảm ứng nhờ đó người dùng có thể điều khiển một cách tiện lợi.\r\n\r\nLaptop Dell insprion 14 5406-3661SLV\r\n\r\nVề thiết kế bên ngoài, Dell insprion 14 5406-3661SLV được trang bị một thiết kế trang nhã với tone màu bạc sang trọng. Bàn phím rút gọn với hành trình phím sâu, mang lại trải nghiệm đánh máy thoải mái.\r\n\r\nHiệu năng ổn định với chip Intel i3, bộ nhớ RAM lớn\r\nVề cấu hình, Dell insprion 14 5406-3661SLV được trang bị con chip Intel thế hệ 11, kết hợp với bộ nhớ RAM lớn cùng ổ cứng SSD tốc độ đọc – ghi cao. Laptop Dell insprion 14 5406-3661SLV cho một trải nghiệm dùng ổn định ở các tác vụ cơ bản.\r\n\r\nLaptop Dell insprion 14 5406-3661SLV\r\n\r\nVề thời lượng sử dụng, laptop Dell insprion 14 5406-3661SLV được trang bị viên pin mang lại thời gian sử dụng lâu ấn tượng.\r\n\r\nMua ngay laptop Dell insprion 14 5406-3661SLV chính hãng tại CellphoneS\r\nLaptop Dell insprion 14 5406-3661SLV với thiết kế mỏng nhẹ, giá cả phải chăng. Hiện mẫu laptop Dell giá rẻ chất lượng này được bán chính hãng với nhiều khuyến mãi tại hệ thống bán lẻ CellphoneS.', 22, '2022-05-09 22:24:45', NULL, '2022-05-09 22:24:45'),
(3, 'Macbook Pro 14 inch 2021 | Chính hãng Apple Việt Nam', '3mac2021.jpg', 49990000, 'Macbook Pro 14 inch - Chiếc Macbook đáng mong đợi nhất 2021\r\nKế thừa những tinh hoa từ đời MacBook tốt nhất cùng với những nâng cấp đáng kể trong nhiều năm qua, Macbook Pro 14 inch dự kiến sẽ là mẫu laptop làm cho giới công nghệ \"phát sốt\", cũng như là cỗ máy xử lý công việc tối ưu hiệu quả.\r\n\r\nThiết kế lưng máy phẳng tối giản, màn hình XDR Retina 14 inch rực rỡ\r\nMacbook Pro 14 inch\r\n\r\nMáy sẽ mang kiểu dáng được Apple tái thiết kế lại cho dòng MacBook Pro năm 2021. MacBook Pro 14 inch 2021 sẽ được làm phẳng tối giản ở các cạnh nhằm tạo vẻ hiện đại cho máy.\r\n\r\nĐặc biệt, máy sẽ được trang bị khe cắm thẻ SDXC. Đây chính là điểm ưu đối với các nhiếp ảnh gia hoặc người dùng không chuộng cổng USB-C để sao lưu dữ liệu.\r\n\r\nMacbook Pro 14 2021 sẽ có màn hình kích thước 14 inch và sử dụng công nghệ màn hình Liquid Retina XDR tiên tiến. Tấm nền sẽ cải thiện độ sáng và độ bão hòa trên màn hình một cách đáng kể, qua đó giúp cho những công việc thiết kế đồ họa hay giải trí trở nên tốt hơn.\r\n\r\nBộ vi xử lý hiệu năng mạnh mẽ cần thiết cho mọi công việc\r\nMacbook Pro 14 inch\r\n\r\nThời gian gần đây Apple đã tự mình phát triển thành công bộ vi xử lý riêng, mang tên Apple M1 Pro chip, cho các dòng MacBook của hãng. Và đối với MacBook Pro 14 inch 2021, Apple mang đến cho dòng máy này con chip Apple M1 Pro Chip - thế hệ nối tiếp của Apple M1 trước đó.\r\n\r\nChip Apple có lõi bên trong và kết hợp với chip đồ họa riêng biệt mạnh gấp nhiều lần trước đó, giúp cho máy hoàn toàn phù hợp để sử dụng phần mềm đồ họa nặng, cũng như vận hành mượt mà những tựa game cấu hình cao.\r\n\r\nMáy được Apple trang bị công nghệ hiện đại chứa đựng RAM cùng vị trí như GPU và CPU, do đó mà với dung lượng RAM ổn định, chiếc máy vẫn sẽ vận hành với hiệu năng tốt nhất.\r\n\r\nNgoài ra, cũng đáng chú ý đó là Mac Pro 2021 14 inch sẽ hoàn toàn tương thích với công nghệ Wi-Fi 6 mới nhất. Bởi vì các đời MacBook Pro chạy chip M1 trước đó vốn đã có sẵn Wi-Fi 6, nên sẽ không ngạc nhiên khi MacBook Pro 14 2021 cũng được lắp đặt khả năng kết nối mới nhất này.\r\n\r\nThời lượng pin đáp ứng làm việc và giải trí\r\nMacbook Pro 14 inch\r\n\r\nHẳn bạn còn nhớ MacBook Pro chạy chip M1 trước đó có thời lượng sử dụng lên đến nhiều giờ. Vì thế bạn hoàn toàn yên tâm về thời gian sử dụng, bởi MacBook Pro 2021 14 inch sẽ có viên pin cung cấp cho máy khi hoạt động liên tục. Kết hợp cùng với khả năng giảm lượng pin tiêu thụ trên chip, có thể khẳng định thời lượng pin trên MacBook Pro 14 inch 2021 sẽ làm hài lòng tất cả người dùng.\r\n\r\nNgoài ra, cũng đáng chú ý rằng âm thanh trên Macbook Pro 14 inch cũng được nâng cấp đáng kể. Âm thanh của máy được tinh chỉnh nhằm tạo âm thanh cân bằng hơn, bass sâu hơn, và tích hợp microphone chống ồn giúp cho cuộc trò chuyện video call trở nên suôn sẻ & rõ tiếng.\r\n\r\nHiệu năng tản nhiệt ổn định, tản nhiệt hiệu quả\r\nMacbook Pro 14 inch\r\n\r\nPhần tản nhiệt chính với cấu trúc quạt bên trong, cũng như bảng mạch chủ tạo không gian thoát nhiệt hiệu quả hơn. Nhờ đó, bạn có thể yên tâm sử dụng MacBook Pro 14 inch và giải trí hoặc làm việc đồ họa nặng mà không phải lo nóng máy. Hệ thống tản nhiệt sẽ làm cho trải nghiệm dùng máy của bạn ổn định hơn nhiều lần.\r\n\r\nMột chi tiết khác cũng đáng chú ý đó là cổng MagSafe. Apple đã quyết định mang cổng MagSafe lên dòng MacBook Pro mới, mà khởi đầu chính là MacBook Pro 14 inch. \r\n\r\nHơn nữa, với sự phổ biến của MagSafe đối với người dùng iPhone, không ngạc nhiên khi sắp tới Apple sẽ trang bị cổng MagSafe cho MacBook Pro 2021 14 inch để đảm bảo người dùng có thể sử dụng cùng loại phụ kiện cho nhiều thiết bị.\r\n\r\nMua Macbook Pro 14 inch 2021 tại CellphoneS\r\nCó thể thấy, đây hứa hẹn sẽ là chiếc laptop hấp dẫn nhất trong năm 2021, và sẽ là thiết bị đồng hành cùng bạn trong mọi công việc. Để sớm có ngay trong tay chiếc Macbook Pro 14 inch 2021 chính hãng Apple Việt Nam với giá ưu đãi cùng nhiều phần quà hấp dẫn, bạn hãy đến với hệ thống CellphoneS và đặt trước ngay.\r\n\r\nHệ thống CellphoneS mang đến cho bạn loạt sản phẩm mới nhất đến từ Apple và các thương hiệu điện tử đình đám hiện nay. Bạn có thể đến trực tiếp cửa hàng CellphoneS gần nhất tại TPHCM và HN để trải nghiệm sản phẩm, hoặc gọi đến hotline 1800.2097 để được hướng dẫn cách đặt trước Macbook Pro 14 inch.', 24, '2022-05-09 23:53:09', NULL, '2022-05-09 23:53:09'),
(4, 'Laptop HP 240 G8 3D0A4PA', '4hp.jpg', 16890000, 'Laptop HP 240 G8 3D0A4PA- Hiệu năng mạnh mẽ vượt trội\r\nLaptop HP 240 G8 3D0A4PA là dòng sản phẩm máy tính xách tay cao cấp được thiết kế với hiệu năng mạnh mẽ, hứa hẹn sẽ mang đến cho người dùng khám phá những giờ phút chơi game tuyệt vời và ngập tràn cảm hứng.\r\n\r\nTrọng lượng nhỏ gọn, thiết kế nguyên khối sang trọng\r\nLaptop HP 240 G8 3D0A4PA được thiết kế với thân máy mỏng, viền màn hình siêu mỏng mang đến cho người dùng sự tiện lợi khi được hãng thiết kế với kích thước nhỏ gọn chỉ 14 inch IPS Full HD. Nhờ đó mà trọng lượng của chiếc HP này khá nhỏ gọn với 1.47kg giúp người dùng dễ dàng di chuyển hơn.\r\n\r\nTrọng lượng nhỏ gọn, thiết kế nguyên khối sang trọng\r\n\r\nToàn bộ vỏ bọc bên ngoài chiếc laptop HP 240 G8 3D0A4PA được thiết kế nguyên khối với gam màu bạc mang lại sự sang trọng, hiện đại phù hợp với mọi không gian làm việc của bạn. Chiếc laptop được bảo vệ bởi lớp vỏ ngoài chắc chắn tránh được các tác động bên ngoài như va chạm, trầy xước,...\r\n\r\nHiệu năng mạnh mẽ vượt trội, hệ điều hành Windows 10\r\nLaptop HP 240 G8 3D0A4PA được chính hãng này trang bị cho con chip Intel thế hệ mới mang đến hiệu năng cực tốt. Với tốc độ xung nhịp cao hỗ trợ tối đa người dùng khi thao tác với các tác vụ nâng cao.\r\n\r\nLaptop HP 240 G8 3D0A4PA là một trong những sản phẩm laptop hoạt động mạnh mẽ được hãng thiết kế hỗ trợ bộ ram DDR4 có dung lượng vừa phải giúp bạn hoàn toàn có thể trải nghiệm được nhiều tính năng, phần mềm mượt mà.\r\n\r\nHiệu năng mạnh mẽ vượt trội, hệ điều hành Windows 10\r\n\r\nChiếc laptop HP 240 G8 3D0A4PA được trang bị  hệ điều hành Windows 10 giúp bạn có thể sử dụng những phần mềm game cao cấp.\r\n\r\nMua ngay Laptop HP 240 G8 3D0A4PA chính hãng tại CellphoneS\r\nLaptop HP 240 G8 3D0A4PA hiện đã được chính thức mở bán tại hệ thống cửa hàng CellphoneS với khá nhiều ưu đãi hấp dẫn. Khi mua hàng tại đây, bạn sẽ nhận được hỗ trợ bảo hành sản phẩm lâu dài. Vậy các bạn hãy ghé thăm cửa hàng của chúng tôi ngay từ bây giờ bạn nhé!', 20, '2022-05-10 01:41:13', NULL, '2022-05-10 01:41:13'),
(10, 'Laptop Asus gaming Rog Strix G15 G513IH-HN015W', '5.jpg', 18890000, 'Laptop Asus gaming Rog Strix G15 G513IH-HN015W - Cấu hình mạnh mẽ chiến game\nAsus ROG Strix G15 G513IH-HN015TW là chiếc laptop có cấu hình mạnh mẽ, đáp ứng được hầu hết các tựa game trên thị trường hiện nay. Ngay cả khi hoạt động trong nhiều giờ liền máy vẫn khá mát mẻ do có hệ thống tản nhiệt cao cấp. Nếu bạn là một game thủ hay người dùng muốn tìm máy có cấu hình cao thì đừng bỏ qua chiếc laptop Asus chất lượng này.\n\nThiết kế mạnh mẽ\nAsus ROG Strix G15 G513IH-HN015TW có ngoại hình vô cùng mạnh mẽ với màu sắc trang nhã. Khung máy có kích thước nhỏ hơn đến 7% so với thế hệ trước giúp bạn có thể chơi bất cứ tựa game nào mà bạn muốn. \n\nThiết kế mạnh mẽ\n\nNhững đường cắt hay biểu tượng trên máy cũng được thiết kế tinh tế. Dù đặt ở bất cứ vị trí nào máy cũng cực kỳ thu hút và ấn tượng. Hệ thống đèn chiếu sáng mặt đáy cùng hệ thống Aura Sync nổi bật từ logo kim loại của ROG càng khiến Asus ROG Strix G15 thu hút hơn.\n\nĐèn LED RGB tỏa sáng rực rỡ\nHệ thống đèn LED nhiều màu sắc vừa có khả năng tăng cường độ bảo mật đèn LED vừa tạo nên hiệu ứng ánh sáng nổi bật tại mắt đáy. Mặt lưng được làm bằng chất liệu nhôm cứng cáp cho cảm giác khung máy trở nên bóng bẩy hơn. Phần chiếu nghỉ tay được phủ bằng soft-touch cho cảm giác khá dễ chịu và thoải mái. \n\nĐèn LED RGB tỏa sáng rực rỡ\n\nHệ thống tản nhiệt tốt\nAsus ROG Strix G15 G513IH-HN015TW có hệ thống tản nhiệt siêu khủng. Với keo tản nhiệt kim loại lỏng trên CPU máy sở hữu khả năng làm mát vô cùng tuyệt vời. So với phương pháp làm mát truyền thống thì phương pháp này có tính vượt trội hơn nhiều lần.\n\nHệ thống tản nhiệt tốt\n\nChúng hoạt động theo nguyên tắc, đi lên đến 6 ống đồng và 4 khe tản nhiệt có kích thước lớn. Lúc này ROG Strix series  sẽ hoạt động mạnh, làm mát nhưng rất êm ái. Độ ồn ở mức khá thấp giúp cho game thủ không cảm thấy bị phân tâm. Ngay cả khi chơi liên tục trong nhiều giờ đồng hồ, máy cũng nóng lên không đáng kể. Đây là một trong những tính năng được rất nhiều game thủ yêu thích.\n\nBàn di chuột lớn hơn\nBàn di chuột của Asus ROG Strix G15 G513IH-HN015TW R7 có diện tích lớn hơn. Việc này thuận tiện hơn khi bạn cần sử máy hàng ngày. Thiết kế này giúp bạn có không gian lớn hơn để làm việc. Khi thực hiện các thao tác, động tác độ chính xác sẽ cao hơn và cảm giác bàn tay được thoải mái hơn nhiều lần. Bàn di chuột cứng được phủ một lớp nhám mang đến cảm giác mềm mại; mượt mà khi chạm vào. \n\nBàn di chuột lớn hơn\n\nChiến game siêu mượt\nKhả năng chiến game của Asus ROG Strix G15 G513IH-HN015TW được đánh giá rất xuất sắc. Với màn hình FHD 144Hz cùng Adaptive-Sync giúp loại bỏ hiện tượng xé viền. Không chỉ vậy, nhà sản xuất luôn chú trọng đến trải nghiệm cho người dùng khi thiết kế viền chỉ mỏng 4,5mm ở 3 cạnh. Bạn hoàn toàn tập trung vào những trận chiến mà không bị bất cứ yếu tố nào làm phân tâm.\n\nChiến game siêu mượt\n\nMua ngay laptop Asus ROG Strix G15 G513IH-HN015TW chính hãng tại CellphoneS\nVới thiết kế đẹp mắt, hiệu năng mạnh mẽ, hệ thống tản nhiệt siêu khủng... laptop Asus ROG Strix G15 G513IH-HN015TW là một trong những chiếc laptop gaming mà game thủ nào cũng mong muốn sở hữu. Nếu bạn đang quan tâm đến mẫu laptop này hãy đến ngay CellphoneS để trải nghiệm và mua được hàng chính hãng cùng hàng ngàn ưu đãi hấp dẫn khác.', 14, '2022-05-10 02:48:27', NULL, '2022-05-10 02:48:27'),
(11, 'Laptop Asus Vivobook A415EA EB1474W', '6.jpg', 15690000, 'Laptop Asus VivoBook A415EA EB1474W - Thiết kế hiện đại, hiệu năng tối ưu\r\nLaptop Asus VivoBook A415EA EB1474W được hãng Asus cho ra mắt đóng vai trò là người bạn đồng hành đắc lực trong laptop học tập - văn phòng. Được sở hữu lối thiết kế đơn giản nhưng cũng rất thanh lịch, với những thông số kỹ thuật khá ổn định, cùng mình tìm hiểu thêm ở bài viết dưới đây nhé.\r\n\r\nThiết kế gọn nhẹ và thanh lịch, nắp lưng chắc chắn\r\nLaptop Asus VivoBook A415EA EB1474W được sở hữu với thiết kế gọn nhẹ và thanh lịch có độ mỏng 17.9 mm và chỉ 1.4 kg sẽ khẳng định tiện lợi của sản phẩm, bạn dễ dàng bỏ vừa balo mang đi học tập hoặc đi làm việc khắp mọi nơi. Nắp lưng của laptop được hoàn thiện đơn giản chắc chắn nhưng vẫn có tính thẩm mỹ.\r\n\r\nThiết kế gọn nhẹ và thanh lịch, nắp lưng chắc chắn\r\n\r\nHiệu năng tối ưu nâng cao hiệu suất công việc, ổ cứng hiện đại  \r\nLaptop Asus VivoBook A415EA EB1474W có hiệu năng tối ưu cùng bộ CPU Intel Core i5 thế hệ thứ 11 hiện đại xung nhịp trung bình 2.4 GHz đạt tối ưu đến 4.2 GHz, mọi thao tác sẽ mượt mà và hiệu quả hơn, giúp nâng cao hiệu suất công việc.\r\n\r\nHiệu năng tối ưu nâng cao hiệu suất công việc, ổ cứng hiện đại  \r\n\r\nLaptop còn được trang bị ổ cứng hiện đại SSD 512GB NVMe PCIe giúp nâng cao tốc độ khởi động ứng dụng nhanh chóng, tiết kiệm được thời gian, hiệu quả năng suất của công việc sẽ được cải thiện rất đáng kể.\r\n\r\nMua laptop Asus VivoBook A415EA EB1474W chất lượng tại CellphoneS\r\nNếu bạn đang chọn tìm mua laptop Asus VivoBook A415EA EB1474W ở đâu uy tín, chất lượng thì của hàng hệ thống CellphoneS sẽ là nơi sáng giá dành cho bạn.', 14, '2022-05-10 02:50:33', NULL, '2022-05-10 02:50:33'),
(15, 'Laptop MSI Modern A5M 239VN', '7.jpg', 16690000, 'Laptop MSI Modern A5M 239VN  - Hiện đại, tản nhiệt mạnh mẽ\r\nLaptop MSI Modern A5M 239VN là sản phẩm thuộc thương hiệu MSI, do đó laptop sở hữu nhiều ưu điểm của thương hiệu laptop chất lượng này như thiết kế nhỏ gọn, hiệu năng vượt trội. Hãy cùng tìm hiểu chi tiết hơn về  Modern A5M 239VN qua bài viết.  \r\n\r\nThiết kế mỏng nhẹ, công nghệ tản nhiệt Cooler Boost 3 độc quyền\r\nLaptop MSI Modern A5M 239VN được trang bị cho mình một bộ vi xử lý AMD Ryzen 7 với 8 nhân đem lại một hiệu năng giúp máy hoạt động một cách mạnh mẽ hơn bao giờ hết, đặc biệt ở các tác vụ đa nhiệm.\r\n\r\nThiết kế mỏng nhẹ, công nghệ tản nhiệt Cooler Boost 3 độc quyền\r\n\r\nModern 15 được trang bị cho riêng mình công nghệ tản nhiệt Cooler Boost 3 độc quyền của MSI, với 2 quạt được thiết kế riêng biệt và 3 ống dẫn nhiệt, vượt trội hơn rất nhiều so với các đối thủ cạnh tranh trong phân khúc, giữ cho máy luôn mát mẻ ngay cả khi chạy các chương trình hay ứng dụng nặng.\r\n\r\nWi-Fi 6 ổn định, pin dung lượng lớn, hỗ trợ sạc nhanh\r\nLaptop MSI Modern A5M 239VN được trạng bị kết nối wifi chuẩn Wi-Fi 6 (802.11ax) mang lại khả năng kết nối mạng không dây ổn định hơn hết và với cùng tốc độ cao gấp 3 lần so với Wi-Fi 5. Ngoài ra,  Wi-Fi 6 còn giảm thiểu hiện tượng nghẽn kết nối khi có nhiều thiết bị cùng sử dụng cùng chung băng tần.\r\n\r\nWi-Fi 6 ổn định, pin dung lượng lớn, hỗ trợ sạc nhanh\r\n\r\nMSI cũng trang bị cho Modern A5M 239VN viên pin dung lượng lớn cùng công nghệ sạc nhanh giúp laptop có thể hoạt động nhiều giờ.\r\n\r\nMua ngay laptop MSI Modern A5M 239VN giá ưu đãi tại CellphoneS\r\nĐể có thể sở hữu ngay chiếc laptop MSI Modern A5M 239VN chất lượng này thì bạn cũng không nên bỏ qua một địa điểm mua hàng uy tín, chất lượng là CellphoneS nhé!', 23, '2022-05-14 21:57:11', NULL, '2022-05-14 21:57:11');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `advertise`
--
ALTER TABLE `advertise`
  ADD PRIMARY KEY (`id`),
  ADD KEY `manufacturer_id` (`manufacturer_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `product_lap_id` (`product_lap_id`);

--
-- Indexes for table `config_laptop`
--
ALTER TABLE `config_laptop`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `config_product_laptop`
--
ALTER TABLE `config_product_laptop`
  ADD PRIMARY KEY (`config_laptop_id`,`pro_laptop_id`),
  ADD KEY `pro_laptop_id` (`pro_laptop_id`);

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `forgot_password`
--
ALTER TABLE `forgot_password`
  ADD PRIMARY KEY (`customer_id`),
  ADD UNIQUE KEY `token` (`token`);

--
-- Indexes for table `manufactures`
--
ALTER TABLE `manufactures`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `orders_ibfk_1` (`customer_id`);

--
-- Indexes for table `order_detail`
--
ALTER TABLE `order_detail`
  ADD PRIMARY KEY (`product_id`,`order_id`,`product_lp_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`),
  ADD KEY `products_ibfk_1` (`manufacturer_id`);

--
-- Indexes for table `product_laptop`
--
ALTER TABLE `product_laptop`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_laptop_ibfk_1` (`manufacturer_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `advertise`
--
ALTER TABLE `advertise`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=147;

--
-- AUTO_INCREMENT for table `config_laptop`
--
ALTER TABLE `config_laptop`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;

--
-- AUTO_INCREMENT for table `manufactures`
--
ALTER TABLE `manufactures`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
