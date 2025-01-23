-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Mar 04, 2024 at 03:42 PM
-- Server version: 8.2.0
-- PHP Version: 8.2.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `food-order`
--

-- --------------------------------------------------------

--
-- Table structure for table `tbl_admin`
--

DROP TABLE IF EXISTS `tbl_admin`;
CREATE TABLE IF NOT EXISTS `tbl_admin` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `full_name` varchar(100) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `tbl_admin`
--

INSERT INTO `tbl_admin` (`id`, `full_name`, `username`, `password`) VALUES
(12, 'Administrator', 'admin', '21232f297a57a5a743894a0e4a801fc3');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_category`
--

DROP TABLE IF EXISTS `tbl_category`;
CREATE TABLE IF NOT EXISTS `tbl_category` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  `image_name` varchar(255) NOT NULL,
  `featured` varchar(10) NOT NULL,
  `active` varchar(10) NOT NULL,
  `Description` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `tbl_category`
--

INSERT INTO `tbl_category` (`id`, `title`, `image_name`, `featured`, `active`, `Description`) VALUES
(13, 'AUPP Restaurant', 'Food_Category_589.jpg', 'Yes', 'Yes', 'Journey to the heart of Cambodia with AUPP Restaurant! Their authentic dishes showcase the culinary traditions of the region, featuring fresh vegetables, fragrant herbs, and the subtle sweetness of coconut milk. From savory fish amok to vibrant mango sala'),
(14, 'RUPP Restaurant', 'Food_Category_73.jpg', 'Yes', 'Yes', 'Indulge in the culinary artistry of RUPP Restaurant! Their skilled chefs meticulously prepare each dish, using traditional techniques passed down through generations. Experience the perfect balance of sweet, salty, sour, and spicy flavors in every bite'),
(15, 'ITC Restaurant', 'Food_Category_852.jpg', 'Yes', 'Yes', 'Looking for a taste of adventure? ITC Restaurant delivers! Their diverse menu features dishes from all corners of Cambodia, showcasing the regional variations and culinary influences. Explore the unique flavors of Kampot pepper crab from the coast'),
(16, 'PRG Restaurant', 'Food_Category_379.jpg', 'Yes', 'Yes', 'Fuel your day with the nourishing power of authentic Khmer cuisine! PRG Restaurant uses fresh, healthy ingredients in their dishes, ensuring a delicious and satisfying meal. Savor the vibrant flavors of stir-fried vegetables with tofu'),
(17, 'NUM Restaurant', 'Food_Category_664.jpg', 'Yes', 'Yes', 'Share the joy of a communal meal with NUM Restaurant! Their generous portions are perfect for sharing with friends and family. Explore the variety of their rice dishes, served alongside an assortment of flavorful curries, vegetables, and stir-fries'),
(18, 'RULE Restaurant', 'Food_Category_586.jpg', 'Yes', 'Yes', 'Craving an explosion of authentic Khmer flavors? Look no further than RULE Restaurant!\r\nTheir dishes are prepared with the utmost care, using only the freshest ingredients sourced locally whenever possible. Every bite bursts with the vibrant spices ');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_feedback`
--

DROP TABLE IF EXISTS `tbl_feedback`;
CREATE TABLE IF NOT EXISTS `tbl_feedback` (
  `id` int NOT NULL AUTO_INCREMENT,
  `TextFeedback` varchar(255) NOT NULL,
  `is_deleted` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_food`
--

DROP TABLE IF EXISTS `tbl_food`;
CREATE TABLE IF NOT EXISTS `tbl_food` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  `description` text NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `image_name` varchar(255) NOT NULL,
  `category_id` int UNSIGNED NOT NULL,
  `featured` varchar(10) NOT NULL,
  `active` varchar(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `tbl_food`
--

INSERT INTO `tbl_food` (`id`, `title`, `description`, `price`, `image_name`, `category_id`, `featured`, `active`) VALUES
(37, 'Chicken Curry', 'Indulge in the rich flavors of our Chicken Curry – a taste of tradition, a journey of spices', 2.00, 'Food-Name-3830.jpg', 13, 'Yes', 'Yes'),
(38, 'Kuy Teav', 'Delicious simplicity in every bowl: Kuy Teav, Cambodian comfort food at its best', 2.50, 'Food-Name-8880.jpg', 14, 'Yes', 'Yes'),
(39, 'Lok Lak', 'Lok Lak - a perfect blend of tender beef, fresh veggies, and zesty flavors', 2.00, 'Food-Name-1856.jpg', 14, 'Yes', 'Yes'),
(40, 'Fry Fish', 'Our Fry Fish delights with every bite – a taste of the sea brought to your plate', 3.00, 'Food-Name-1128.jpg', 15, 'Yes', 'Yes'),
(41, 'Amok', 'Amok: Cambodian delicacy of fish or chicken in fragrant coconut curry, served with rice', 2.00, 'Food-Name-8723.jpg', 15, 'Yes', 'Yes'),
(42, 'Lort Cha', 'Cambodian stir-fry featuring fresh noodles, savory meats, and crisp vegetables, seasoned to perfection for a flavorful experience.', 2.00, 'Food-Name-6250.jpg', 16, 'Yes', 'Yes'),
(43, 'Coffee Latte', 'Caffe lattes are enjoyed worldwide and are known for their balanced flavor profile', 1.50, 'Food-Name-8457.jpg', 13, 'Yes', 'Yes'),
(44, 'LEMONGRASS CHICKEN STIR-FRY ', 'Chicken Stir-Fry - Where Flavor Meets Freshness', 4.00, 'Food-Name-2775.jpg', 16, 'Yes', 'Yes'),
(45, 'Fries Rice', 'Fry Rice: Taste the Crunchy Perfection!', 2.00, 'Food-Name-4470.jpg', 17, 'Yes', 'Yes'),
(46, 'Fried Noodle', 'Dive into our Crispy Fry Noodles!', 1.50, 'Food-Name-8695.jpg', 17, 'Yes', 'Yes'),
(47, 'Meat Ball', 'Indulge in Juicy Meatball Goodness!', 2.00, 'Food-Name-8729.jpg', 18, 'Yes', 'Yes'),
(48, 'Hot Dog', 'Hot Dogs: Sizzle into Satisfaction!', 1.50, 'Food-Name-5689.jpg', 18, 'Yes', 'Yes');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_order`
--

DROP TABLE IF EXISTS `tbl_order`;
CREATE TABLE IF NOT EXISTS `tbl_order` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `food` varchar(150) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `qty` int NOT NULL,
  `total` decimal(10,2) NOT NULL,
  `order_date` datetime NOT NULL,
  `status` varchar(50) NOT NULL,
  `u_id` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `tbl_order`
--

INSERT INTO `tbl_order` (`id`, `food`, `price`, `qty`, `total`, `order_date`, `status`, `u_id`) VALUES
(20, 'Kuy Teav', 2.50, 2, 5.00, '2024-03-03 06:04:33', 'Delivered', 25),
(21, 'Chicken Curry', 2.00, 2, 4.00, '2024-03-04 02:08:45', 'Delivered', 26),
(22, 'Chicken Curry', 2.00, 1, 2.00, '2024-03-04 02:38:46', 'Delivered', 25),
(23, 'Chicken Curry', 2.00, 1, 2.00, '2024-03-04 03:09:39', 'Ordered', 25);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `customer_name` varchar(150) NOT NULL,
  `customer_email` varchar(150) NOT NULL,
  `customer_contact` bigint NOT NULL,
  `customer_address` varchar(255) NOT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `customer_name`, `customer_email`, `customer_contact`, `customer_address`, `created_at`) VALUES
(25, 'costomerA', '$2y$10$f9qaksSQlrKv.Yp7S4JjAem3tqC4VPFtf12rPWuIvvJVebDC7TNhi', 'costomerA', 'ibciasbbc@gmail.com', 230924, 'Phnom Penh\r\nPhnom Penh', '2024-03-04 01:00:27'),
(26, 'sinaraseth', '$2y$10$lJy.keAz3whLhDRwKqu6huZ2po8CpvvNbKxZj1xlyoXuvZdwal.vi', 'Sinara Seth', 'sinaraseth@gmail.com', 9775510588, 'PreakLeap, Chroy Changva', '2024-03-04 09:07:53'),
(27, 'yuthkota', '$2y$10$q0M839IjxT4wxSkYqWYoeOgtbKalQbba1o9rPjoPFVvgXh5KcXsWO', 'Pa Kotthrayothe', 'kotthrayothe.pa@student.cadt.edu.kh', 87850077, 'Phnom Penh\r\nPhnom Penh', '2024-03-04 22:12:48');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
