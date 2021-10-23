-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 23, 2021 at 11:54 AM
-- Server version: 10.1.38-MariaDB
-- PHP Version: 7.3.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ecommerceapp`
--

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `current_team_id` bigint(20) UNSIGNED DEFAULT NULL,
  `profile_photo_path` text COLLATE utf8_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `current_team_id`, `profile_photo_path`, `created_at`, `updated_at`) VALUES
(1, 'Admin', 'admin@admin.com', '2021-10-11 22:39:00', 'admin1234', NULL, NULL, NULL, '2021-07-06 18:30:00', '2021-07-06 18:30:00');

-- --------------------------------------------------------

--
-- Table structure for table `brands`
--

CREATE TABLE `brands` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `brand_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `brand_slug` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `brand_image` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `brands`
--

INSERT INTO `brands` (`id`, `brand_name`, `brand_slug`, `brand_image`, `created_at`, `updated_at`) VALUES
(2, 'Huawai', 'huawai', 'upload/brand/616fe4941c222.png', NULL, '2021-10-20 04:37:06'),
(3, 'sumsung', 'sumsung', 'upload/brand/616fec6752041.png', NULL, NULL),
(4, 'apple', 'apple', 'upload/brand/616fec808ed00.png', NULL, NULL),
(5, 'oppo f9', 'oppo-f9', 'upload/brand/617274f61d164.png', NULL, '2021-10-22 02:53:18');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `category_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `category_slug` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `category_icon` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `category_name`, `category_slug`, `category_icon`, `created_at`, `updated_at`) VALUES
(4, 'Electronics', 'electronics', 'fa fa-phone', NULL, '2021-10-22 02:38:41'),
(5, 'clothing', 'clothing', 'fa fa-shirtsinbulk', NULL, '2021-10-22 02:39:35'),
(7, 'Home & Garden', 'home-&-garden', 'fa fa-home', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `connection` text COLLATE utf8_unicode_ci NOT NULL,
  `queue` text COLLATE utf8_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2021_02_02_212221_create_admins_table', 1),
(6, '2021_02_09_111701_create_categories_table', 2),
(7, '2021_02_09_121910_create_sub_categories_table', 3),
(8, '2021_02_16_183944_create_sub_sub_categories_table', 4),
(9, '2021_02_20_204829_create_sliders_table', 5),
(10, '2021_02_09_054528_create_brands_table', 6),
(11, '2021_02_16_204006_create_products_table', 7),
(12, '2021_10_21_082234_create_products_table', 8),
(13, '2021_02_16_205349_create_multi_imgs_table', 9),
(14, '2021_03_24_223430_create_site_settings_table', 10),
(15, '2021_03_26_194141_create_seos_table', 11);

-- --------------------------------------------------------

--
-- Table structure for table `multi_imgs`
--

CREATE TABLE `multi_imgs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` int(11) NOT NULL,
  `photo_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `multi_imgs`
--

INSERT INTO `multi_imgs` (`id`, `product_id`, `photo_name`, `created_at`, `updated_at`) VALUES
(4, 3, 'upload/products/multi-image/617128a377729.jpeg', '2021-10-21 03:15:23', NULL),
(5, 3, 'upload/products/multi-image/61713eb94e338.jpeg', '2021-10-21 03:15:24', '2021-10-21 04:49:37'),
(6, 4, 'upload/products/multi-image/617275e8edb40.jpeg', '2021-10-22 02:57:21', NULL),
(7, 4, 'upload/products/multi-image/617275e97cb16.jpeg', '2021-10-22 02:57:21', NULL),
(8, 5, 'upload/products/multi-image/61727a4c2a333.jpg', '2021-10-22 03:16:04', NULL),
(9, 6, 'upload/products/multi-image/6172dd04b626d.jpg', '2021-10-22 10:17:17', NULL),
(10, 6, 'upload/products/multi-image/6172dd05311d3.jpg', '2021-10-22 10:17:17', NULL),
(11, 7, 'upload/products/multi-image/6172de15094c5.jpeg', '2021-10-22 10:21:49', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `brand_id` int(11) DEFAULT NULL,
  `category_id` int(11) NOT NULL,
  `subcategory_id` int(11) DEFAULT NULL,
  `subsubcategory_id` int(11) DEFAULT NULL,
  `product_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `product_slug` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `product_code` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `product_qty` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `product_tags` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `product_size` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `product_color` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `selling_price` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `discount_price` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `short_descp` varchar(300) COLLATE utf8_unicode_ci NOT NULL,
  `long_descp` varchar(2000) COLLATE utf8_unicode_ci NOT NULL,
  `product_thambnail` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `hot_deals` int(11) DEFAULT NULL,
  `featured` int(11) DEFAULT NULL,
  `special_offer` int(11) DEFAULT NULL,
  `special_deals` int(11) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `brand_id`, `category_id`, `subcategory_id`, `subsubcategory_id`, `product_name`, `product_slug`, `product_code`, `product_qty`, `product_tags`, `product_size`, `product_color`, `selling_price`, `discount_price`, `short_descp`, `long_descp`, `product_thambnail`, `hot_deals`, `featured`, `special_offer`, `special_deals`, `status`, `created_at`, `updated_at`) VALUES
(1, 2, 4, 1, 1, 'man t-shirt', 'man-t-shirt', '1001', '100', 'Lorem,Ipsum,Amet', 'Small,Midium,Large', 'red,Black,Amet', '1000', '750', 'thius hyibgbdf ghgb  gdhh byiherbg ruyfberjhgb jherb fyier ei ug bedruguerihg .', '<p><strong>Long Descriptirdgon</strong></p>\r\n\r\n<p>dfgydrgr erhgdfgb dr hbdf gbdf ghiudffgb nbjkdfbiufrhrgjb&nbsp; rugb ierg hurh gj fierje rgujhe rug erffh ufhierg hfj nsif herug heur g.&nbsp;</p>\r\n\r\n<p>iugiyugger guer ui erhdj bghriuer ui&nbsp; oiruhf hroui o uriu gh r oir hg r hgo erhgsekjfn errdu ru er.&nbsp;</p>', 'upload/products/thambnail/617125fe16e36.jpeg', 1, 1, 1, 1, 1, '2021-10-21 03:04:06', NULL),
(3, 2, 5, 3, 2, 'man t-shirt New', 'man-t-shirt-new', '1003', '100', 'Lorem,Ipsum,Amet', 'Small,Midium,Large', 'red,Black,Amet', '800', '670', 'njfnh rt jrt  oihrt digjtg roigjtrg droignrt tijen grtngjndg grtnh hnfh.', '<p><strong>Long Description</strong></p>\r\n\r\n<p>gyerger rhigbsf fb uifbef b ndfgniubggf gbg fghbdfg frrguirt guhbf gdfgbdfgbdfg dfgbrigdf gdbgdff g dfgdfbgjdfg ttgbdgbndfg.</p>', 'upload/products/thambnail/61713d6088231.jpeg', 1, 1, 1, 1, 1, '2021-10-21 04:23:31', '2021-10-21 04:57:55'),
(4, 4, 5, 3, 2, 'man t-shirt', 'man-t-shirt', '1005', '20', 'men,tshirt', 'Small,Midium,Large', 'red,Black,Amet', '600', '510', 'this is man tshirt with various colors.', '<h2><strong>T-shirts for men</strong></h2>\r\n\r\n<p><strong>this is t-shirt for men. This t-shirt has some featuers</strong></p>\r\n\r\n<ol>\r\n	<li><strong>warm</strong></li>\r\n	<li><strong>good looking</strong></li>\r\n</ol>', 'upload/products/thambnail/617275e85095e.jpeg', 1, 1, 1, 1, 1, '2021-10-22 02:57:20', NULL),
(5, NULL, 7, 8, NULL, 'Fresh Vegitable Gobi', 'fresh-vegitable-gobi', '2000', '60', 'vegitable', NULL, NULL, '50', '49', 'get fresh vegetable.', '<p>get frewsh vegiatjhg rg hjbdfg dfug hdg dfgbdfg df gudfsbng jdf gd fgjbdfg&nbsp; dshgbkdg bktrsbg kjbdgb dk gbksr trbg bnkjg&nbsp; bntjieru ghse bjk bkjxdgbnguiosrt ng kjst bgjk snetg. jfh ui er hgjt biugb esujg iufd hug dhu jghdf kjg dku jghujd fhgoig oirstrjgoirtjho udlgjk tguoirth uogh roth.&nbsp;</p>', 'upload/products/thambnail/61727a4bafb6e.jpg', 1, 1, NULL, NULL, 1, '2021-10-22 06:18:09', '2021-10-22 06:18:10'),
(6, NULL, 7, 8, NULL, 'Floral Print Buttoned 1KG', 'floral-print-buttoned-1kg', '1010', '30', 'floral,vegitable', NULL, NULL, '50', '47', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', '<p><br />\r\nLorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>\r\n\r\n<p>Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>', 'upload/products/thambnail/6172dd041c9c3.jpg', NULL, 1, NULL, NULL, 1, '2021-10-22 10:17:16', NULL),
(7, 3, 4, 4, 14, 'Sumsung 21 Inch Monitor', 'sumsung-21-inch-monitor', '1011', '35', 'monitor,sumsung,desktop', NULL, NULL, '22000', '19000', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', '<p><br />\r\nLorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>\r\n\r\n<p>Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>', 'upload/products/thambnail/6172de1481390.jpeg', 1, NULL, 1, NULL, 1, '2021-10-22 10:21:48', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `seos`
--

CREATE TABLE `seos` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `meta_title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `meta_author` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `meta_keyword` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `meta_description` text COLLATE utf8_unicode_ci,
  `google_analytics` text COLLATE utf8_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `seos`
--

INSERT INTO `seos` (`id`, `meta_title`, `meta_author`, `meta_keyword`, `meta_description`, `google_analytics`, `created_at`, `updated_at`) VALUES
(1, 'Myshop - Buy goods online from retail', 'MyShop', 'ecommerce website, myshop, purchase goods online, purchase online', 'This is an ecommerce website of myshop. Here you can do shopping from any where you want to shop.', NULL, NULL, '2021-10-21 12:51:10');

-- --------------------------------------------------------

--
-- Table structure for table `site_settings`
--

CREATE TABLE `site_settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `logo` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone_one` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone_two` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `company_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `company_address` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `facebook` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `twitter` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `linkedin` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `youtube` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `site_settings`
--

INSERT INTO `site_settings` (`id`, `logo`, `phone_one`, `phone_two`, `email`, `company_name`, `company_address`, `facebook`, `twitter`, `linkedin`, `youtube`, `created_at`, `updated_at`) VALUES
(1, 'logo.png', '01234567890', '0987654321', 'skemail@gmail.com', 'EShop', 'Puratanchwak', 'facebook.com', 'twitter.com', 'linkedin.com', 'youtube.com', NULL, '2021-10-21 07:05:06');

-- --------------------------------------------------------

--
-- Table structure for table `sliders`
--

CREATE TABLE `sliders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `slider_img` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `status` int(11) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `sliders`
--

INSERT INTO `sliders` (`id`, `slider_img`, `title`, `description`, `status`, `created_at`, `updated_at`) VALUES
(3, 'upload/slider/616fd5e21f3b9.jpg', 'slider 1', 'this is slider 1', 1, NULL, '2021-10-21 06:40:44'),
(4, 'upload/slider/61727469cc161.jpg', 'slider 2', 'This is slider 2', 1, NULL, NULL),
(5, 'upload/slider/61727485c6d75.jpg', 'slider 3', 'this is slider 3', 1, NULL, NULL),
(6, 'upload/slider/617274a1518a0.jpg', 'slider 4', 'this is slider 4', 1, NULL, NULL),
(7, 'upload/slider/617274b770889.jpg', 'slider 5', 'this is slider 5', 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sub_categories`
--

CREATE TABLE `sub_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `category_id` int(11) NOT NULL,
  `subcategory_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `subcategory_slug` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `sub_categories`
--

INSERT INTO `sub_categories` (`id`, `category_id`, `subcategory_name`, `subcategory_slug`, `created_at`, `updated_at`) VALUES
(1, 4, 'Laptop', 'laptop', NULL, '2021-10-22 02:42:55'),
(3, 5, 'Men', 'men', NULL, NULL),
(4, 4, 'desktop', 'desktop', NULL, '2021-10-22 02:43:17'),
(5, 5, 'women', 'women', NULL, NULL),
(6, 5, 'kids', 'kids', NULL, NULL),
(7, 4, 'mobile', 'mobile', NULL, NULL),
(8, 7, 'vegitables', 'vegitables', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sub_sub_categories`
--

CREATE TABLE `sub_sub_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `category_id` int(11) NOT NULL,
  `subcategory_id` int(11) NOT NULL,
  `subsubcategory_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `subsubcategory_slug` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `sub_sub_categories`
--

INSERT INTO `sub_sub_categories` (`id`, `category_id`, `subcategory_id`, `subsubcategory_name`, `subsubcategory_slug`, `created_at`, `updated_at`) VALUES
(1, 4, 1, 'gaming', 'gaming', NULL, '2021-10-22 02:46:43'),
(2, 5, 3, 'tshirt', 'tshirt', NULL, '2021-10-22 02:45:01'),
(3, 5, 3, 'shoes', 'shoes', NULL, '2021-10-22 02:45:27'),
(4, 5, 3, 'sunglass', 'sunglass', NULL, NULL),
(5, 4, 1, 'dell', 'dell', NULL, NULL),
(6, 4, 1, 'hp', 'hp', NULL, NULL),
(7, 4, 4, 'cpu', 'cpu', NULL, NULL),
(8, 4, 4, 'ram', 'ram', NULL, NULL),
(9, 4, 7, 'apple', 'apple', NULL, NULL),
(10, 4, 7, 'samsung', 'samsung', NULL, NULL),
(11, 4, 7, 'lg', 'lg', NULL, NULL),
(12, 4, 4, 'hp', 'hp', NULL, NULL),
(13, 4, 4, 'dell', 'dell', NULL, NULL),
(14, 4, 4, 'monitor', 'monitor', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `admins_email_unique` (`email`);

--
-- Indexes for table `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `multi_imgs`
--
ALTER TABLE `multi_imgs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `seos`
--
ALTER TABLE `seos`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `site_settings`
--
ALTER TABLE `site_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sliders`
--
ALTER TABLE `sliders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sub_categories`
--
ALTER TABLE `sub_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sub_sub_categories`
--
ALTER TABLE `sub_sub_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `brands`
--
ALTER TABLE `brands`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `multi_imgs`
--
ALTER TABLE `multi_imgs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `seos`
--
ALTER TABLE `seos`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `site_settings`
--
ALTER TABLE `site_settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `sliders`
--
ALTER TABLE `sliders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `sub_categories`
--
ALTER TABLE `sub_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `sub_sub_categories`
--
ALTER TABLE `sub_sub_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
