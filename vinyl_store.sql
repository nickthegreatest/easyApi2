-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1
-- Время создания: Июн 09 2026 г., 16:51
-- Версия сервера: 10.4.32-MariaDB
-- Версия PHP: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `vinyl_store`
--

-- --------------------------------------------------------

--
-- Структура таблицы `cart_items`
--

CREATE TABLE `cart_items` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL DEFAULT 1,
  `added_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `cart_items`
--

INSERT INTO `cart_items` (`id`, `user_id`, `product_id`, `quantity`, `added_at`) VALUES
(3, 6, 4, 1, '2026-06-07 18:48:36'),
(4, 6, 7, 1, '2026-06-07 18:48:55'),
(5, 6, 1, 1, '2026-06-08 14:08:25');

-- --------------------------------------------------------

--
-- Структура таблицы `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `slug` varchar(100) NOT NULL,
  `description` text DEFAULT NULL,
  `image_url` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `categories`
--

INSERT INTO `categories` (`id`, `name`, `slug`, `description`, `image_url`, `created_at`) VALUES
(1, 'Rock', 'rock', 'Классический и современный рок', NULL, '2026-06-07 09:01:36'),
(2, 'Pop', 'pop', 'Популярная музыка всех времён', NULL, '2026-06-07 09:01:36'),
(3, 'Jazz', 'jazz', 'Джазовые композиции', NULL, '2026-06-07 09:01:36'),
(4, 'Classical', 'classical', 'Классическая музыка', NULL, '2026-06-07 09:01:36'),
(5, 'Electronic', 'electronic', 'Электронная музыка', NULL, '2026-06-07 09:01:36'),
(6, 'Hip-Hop', 'hip-hop', 'Хип-хоп и рэп', NULL, '2026-06-07 09:01:36'),
(7, 'Blues', 'blues', 'Блюз', NULL, '2026-06-07 09:01:36'),
(8, 'Soul', 'soul', 'Соул и funk', NULL, '2026-06-07 09:01:36'),
(9, 'Metal', 'metal', 'Метал и хард-рок', NULL, '2026-06-07 09:01:36'),
(10, 'Indie', 'indie', 'Инди музыка', NULL, '2026-06-07 09:01:36');

-- --------------------------------------------------------

--
-- Структура таблицы `labels`
--

CREATE TABLE `labels` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `country` varchar(50) DEFAULT NULL,
  `founded_year` int(11) DEFAULT NULL,
  `logo_url` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `labels`
--

INSERT INTO `labels` (`id`, `name`, `country`, `founded_year`, `logo_url`) VALUES
(1, 'Columbia Records', 'USA', 1887, NULL),
(2, 'Capitol Records', 'USA', 1942, NULL),
(3, 'Atlantic Records', 'USA', 1947, NULL),
(4, 'Warner Bros. Records', 'USA', 1958, NULL),
(5, 'EMI', 'UK', 1931, NULL),
(6, 'Deutsche Grammophon', 'Germany', 1898, NULL),
(7, 'Blue Note Records', 'USA', 1939, NULL),
(8, 'Motown Records', 'USA', 1959, NULL),
(9, 'Sony Music', 'Japan', 1968, NULL),
(10, 'Universal Music Group', 'France', 1996, NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `order_number` varchar(20) NOT NULL,
  `status` enum('pending','confirmed','processing','shipped','delivered','cancelled','refunded') DEFAULT 'pending',
  `total_amount` decimal(10,2) NOT NULL,
  `discount_amount` decimal(10,2) DEFAULT 0.00,
  `shipping_cost` decimal(10,2) DEFAULT 0.00,
  `payment_method` enum('card','cash','online') DEFAULT 'card',
  `payment_status` enum('pending','paid','failed','refunded') DEFAULT 'pending',
  `shipping_address` text NOT NULL,
  `shipping_city` varchar(100) DEFAULT NULL,
  `shipping_postal_code` varchar(20) DEFAULT NULL,
  `shipping_country` varchar(50) DEFAULT 'Russia',
  `customer_phone` varchar(20) DEFAULT NULL,
  `customer_email` varchar(100) DEFAULT NULL,
  `notes` text DEFAULT NULL,
  `tracking_number` varchar(100) DEFAULT NULL,
  `shipped_at` timestamp NULL DEFAULT NULL,
  `delivered_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `orders`
--

INSERT INTO `orders` (`id`, `user_id`, `order_number`, `status`, `total_amount`, `discount_amount`, `shipping_cost`, `payment_method`, `payment_status`, `shipping_address`, `shipping_city`, `shipping_postal_code`, `shipping_country`, `customer_phone`, `customer_email`, `notes`, `tracking_number`, `shipped_at`, `delivered_at`, `created_at`, `updated_at`) VALUES
(1, 6, 'VV-260608-0001', 'pending', 5798.00, 0.00, 0.00, 'card', 'pending', 'Ул.Победы,д.37', 'С. Самойловка', '663743', 'Russia', '89135687301', 'nickgrebnev356@gmail.com', NULL, NULL, NULL, NULL, '2026-06-07 18:03:20', '2026-06-07 18:03:20');

-- --------------------------------------------------------

--
-- Структура таблицы `order_items`
--

CREATE TABLE `order_items` (
  `id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `title` varchar(200) NOT NULL,
  `artist` varchar(100) NOT NULL,
  `quantity` int(11) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `subtotal` decimal(10,2) NOT NULL,
  `image_url` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `order_items`
--

INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `title`, `artist`, `quantity`, `price`, `subtotal`, `image_url`) VALUES
(1, 1, 7, 'Nevermind', 'Nirvana', 2, 2899.00, 5798.00, 'https://upload.wikimedia.org/wikipedia/ru/b/b7/NirvanaNevermindalbumcover.jpg');

-- --------------------------------------------------------

--
-- Структура таблицы `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `title` varchar(200) NOT NULL,
  `artist` varchar(100) NOT NULL,
  `slug` varchar(200) NOT NULL,
  `description` text DEFAULT NULL,
  `price` decimal(10,2) NOT NULL,
  `old_price` decimal(10,2) DEFAULT NULL,
  `stock_quantity` int(11) DEFAULT 0,
  `category_id` int(11) DEFAULT NULL,
  `label_id` int(11) DEFAULT NULL,
  `release_year` int(11) DEFAULT NULL,
  `country` varchar(50) DEFAULT NULL,
  `format` varchar(50) DEFAULT 'LP',
  `weight_grams` int(11) DEFAULT 180,
  `speed_rpm` enum('33','45','78') DEFAULT '33',
  `color` varchar(50) DEFAULT 'Black',
  `is_limited` tinyint(1) DEFAULT 0,
  `is_new` tinyint(1) DEFAULT 0,
  `image_url` varchar(255) DEFAULT NULL,
  `image_gallery` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`image_gallery`)),
  `rating` decimal(3,2) DEFAULT 0.00,
  `review_count` int(11) DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `products`
--

INSERT INTO `products` (`id`, `title`, `artist`, `slug`, `description`, `price`, `old_price`, `stock_quantity`, `category_id`, `label_id`, `release_year`, `country`, `format`, `weight_grams`, `speed_rpm`, `color`, `is_limited`, `is_new`, `image_url`, `image_gallery`, `rating`, `review_count`, `created_at`, `updated_at`) VALUES
(1, 'Abbey Road', 'The Beatles', 'abbey-road-beatles', 'Легендарный альбом The Beatles, записанный на знаменитой студии Abbey Road.', 2999.00, 3499.00, 50, 1, 5, 1969, 'UK', 'LP', 180, '33', 'Black', 0, 0, 'https://ir.ozone.ru/s3/multimedia-1/6721691005.jpg', NULL, 4.90, 0, '2026-06-07 09:01:36', '2026-06-07 19:10:31'),
(2, 'Thriller', 'Michael Jackson', 'thriller-michael-jackson', 'Самый продаваемый альбом всех времён.', 2799.00, NULL, 30, 2, 1, 1982, 'USA', 'LP', 180, '33', 'Black', 0, 0, 'https://avatars.mds.yandex.net/get-mpic/12225658/2a000001953f9bc840028ddbf9621048bcbe/orig', NULL, 4.80, 0, '2026-06-07 09:01:36', '2026-06-07 19:11:05'),
(3, 'Kind of Blue', 'Miles Davis', 'kind-of-blue-miles-davis', 'Величайший джазовый альбом в истории.', 3199.00, NULL, 25, 3, 7, 1959, 'USA', 'LP', 180, '33', 'Black', 0, 0, 'https://doctorhead.ru/upload/dev2fun.imagecompress/webp/iblock/48a/w15hmo5hgj60fbu8nssc6azli2hgbtup/dh_music_2023_000442.webp', NULL, 5.00, 0, '2026-06-07 09:01:36', '2026-06-07 19:11:27'),
(4, 'Dark Side of the Moon', 'Pink Floyd', 'dark-side-moon-pink-floyd', 'Культовый прогрессив-рок альбом.', 3499.00, 3999.00, 40, 1, 5, 1973, 'UK', 'LP', 180, '33', 'Black', 0, 0, 'https://upload.wikimedia.org/wikipedia/ru/1/15/The_Dark_Side_of_the_Moon.png', NULL, 4.90, 0, '2026-06-07 09:01:36', '2026-06-07 19:11:52'),
(5, 'Back to Black', 'Amy Winehouse', 'back-to-black-amy', 'Последний студийный альбом Эми Уайнхаус.', 2599.00, NULL, 35, 2, 5, 2006, 'UK', 'LP', 180, '33', 'Black', 0, 0, 'https://upload.wikimedia.org/wikipedia/ru/7/7b/Back-to-black.jpg', NULL, 4.70, 0, '2026-06-07 09:01:36', '2026-06-07 19:12:14'),
(6, 'Random Access Memories', 'Daft Punk', 'random-access-memories-daft-punk', 'Грэмми-альбом электронной музыки.', 3299.00, NULL, 20, 5, 1, 2013, 'France', 'LP', 180, '33', 'Black', 0, 0, 'https://avatars.mds.yandex.net/get-mpic/15585232/2a0000019b2807832f6314fe2cdcb7d8f991/orig', NULL, 4.80, 0, '2026-06-07 09:01:36', '2026-06-07 19:13:03'),
(7, 'Nevermind', 'Nirvana', 'nevermind-nirvana', 'Альбом, изменивший музыку 90-х.', 2899.00, NULL, 43, 1, 2, 1991, 'USA', 'LP', 180, '33', 'Black', 0, 0, 'https://upload.wikimedia.org/wikipedia/ru/b/b7/NirvanaNevermindalbumcover.jpg', NULL, 4.80, 0, '2026-06-07 09:01:36', '2026-06-07 18:03:20'),
(8, 'Good Kid, M.A.A.D City', 'Kendrick Lamar', 'good-kendrick-lamar', 'Дебютный студийный альбом Кендрика Ламара.', 2999.00, NULL, 25, 6, 1, 2012, 'USA', 'LP', 180, '33', 'Black', 0, 0, 'https://ir.ozone.ru/s3/multimedia-1-2/9724209986.jpg', NULL, 4.70, 0, '2026-06-07 09:01:36', '2026-06-07 19:14:06'),
(9, 'Rumours', 'Fleetwood Mac', 'rumours-fleetwood-mac', 'Классика рок-музыки 70-х.', 2699.00, 3199.00, 30, 1, 5, 1977, 'UK', 'LP', 180, '33', 'Black', 0, 0, 'https://avatars.mds.yandex.net/get-mpic/15242005/2a0000019b44d96baac0505b947176c1a309/orig', NULL, 4.80, 0, '2026-06-07 09:01:36', '2026-06-07 19:14:34'),
(10, 'The Dark Side', 'Ed Sheeran', 'dark-side-ed-sheeran', 'Последний альбом Эда Ширана.', 2499.00, NULL, 50, 2, 1, 2024, 'UK', 'LP', 180, '33', 'Black', 0, 1, 'https://avatars.mds.yandex.net/get-entity_search/30356/1245445931/S600xU_2x', NULL, 4.50, 0, '2026-06-07 09:01:36', '2026-06-07 19:16:25');

-- --------------------------------------------------------

--
-- Структура таблицы `promo_codes`
--

CREATE TABLE `promo_codes` (
  `id` int(11) NOT NULL,
  `code` varchar(50) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `discount_type` enum('percent','fixed') DEFAULT 'percent',
  `discount_value` decimal(10,2) NOT NULL,
  `min_order_amount` decimal(10,2) DEFAULT 0.00,
  `max_uses` int(11) DEFAULT NULL,
  `used_count` int(11) DEFAULT 0,
  `valid_from` date DEFAULT NULL,
  `valid_until` date DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `promo_codes`
--

INSERT INTO `promo_codes` (`id`, `code`, `description`, `discount_type`, `discount_value`, `min_order_amount`, `max_uses`, `used_count`, `valid_from`, `valid_until`, `is_active`, `created_at`) VALUES
(1, 'VINYL20', 'Скидка 20% на первый заказ', 'percent', 20.00, 0.00, NULL, 0, NULL, '2026-12-31', 1, '2026-06-07 09:01:36'),
(2, 'NEW2024', 'Скидка 500₽ на заказы от 5000₽', 'fixed', 500.00, 0.00, NULL, 0, NULL, '2026-06-30', 1, '2026-06-07 09:01:36');

-- --------------------------------------------------------

--
-- Структура таблицы `reviews`
--

CREATE TABLE `reviews` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `rating` tinyint(4) NOT NULL CHECK (`rating` between 1 and 5),
  `title` varchar(200) DEFAULT NULL,
  `content` text NOT NULL,
  `is_verified` tinyint(1) DEFAULT 0,
  `is_approved` tinyint(1) DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `reviews`
--

INSERT INTO `reviews` (`id`, `product_id`, `user_id`, `rating`, `title`, `content`, `is_verified`, `is_approved`, `created_at`) VALUES
(1, 7, 6, 5, 'ИМБА', 'Лучший альбом и любимая група моя любимя песня смелс лак тин спирт', 0, 1, '2026-06-07 19:07:00');

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` enum('user','manager','admin') DEFAULT 'user',
  `first_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `users`
--

INSERT INTO `users` (`id`, `username`, `email`, `password`, `role`, `first_name`, `last_name`, `phone`, `address`, `created_at`, `updated_at`) VALUES
(2, 'manager', 'manager@vinylvault.com', '$2b$12$LQv3c1yqBWVHxkd0LHAkCOYz6TtxMQJqhN8/X4.G.2fM8uM7fZL1K', 'manager', 'Manager', 'User', NULL, NULL, '2026-06-07 09:01:36', '2026-06-07 09:01:36'),
(3, 'customer', 'customer@example.com', '$2b$12$LQv3c1yqBWVHxkd0LHAkCOYz6TtxMQJqhN8/X4.G.2fM8uM7fZL1K', 'user', 'John', 'Doe', NULL, NULL, '2026-06-07 09:01:36', '2026-06-07 09:01:36'),
(4, 'admin', 'admin@gmail.com', 'scrypt:32768:8:1$DY90G5mEUEV7HCvp$0dd1e4e47ccffc0fb8d0eecde49eb0f0a2e8e1d734092c7a4de42fa65f1331306d732bcb67c6b9d00ce4f37c2ba4f1480424ab20a6edc91a98cd5e3a327bc60f', 'admin', 'Admin', 'Adminsky', NULL, NULL, '2026-06-07 09:39:00', '2026-06-07 09:39:17'),
(6, 'test1', 'test1@gmail.com', 'scrypt:32768:8:1$UA9DmhlHpPbA9cV6$9a3593e6b9ef167c4a4397c32ad04f3679b37cbacb64303c71f61e55562d6e003cce7ddeb19920177372058bb3d3950849d06cfd0e50224bd045aa7b097ff351', 'user', 'User', '1', NULL, NULL, '2026-06-07 17:23:17', '2026-06-07 17:23:17');

-- --------------------------------------------------------

--
-- Структура таблицы `view_history`
--

CREATE TABLE `view_history` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `product_id` int(11) NOT NULL,
  `viewed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `view_history`
--

INSERT INTO `view_history` (`id`, `user_id`, `product_id`, `viewed_at`) VALUES
(1, NULL, 7, '2026-06-07 16:48:51'),
(2, NULL, 4, '2026-06-07 17:00:28'),
(3, NULL, 4, '2026-06-07 17:12:12'),
(4, NULL, 3, '2026-06-07 17:14:14'),
(5, NULL, 7, '2026-06-07 17:14:19'),
(6, NULL, 7, '2026-06-07 17:14:51'),
(7, NULL, 7, '2026-06-07 17:17:45'),
(8, NULL, 7, '2026-06-07 17:20:56'),
(9, NULL, 7, '2026-06-07 17:24:09'),
(10, NULL, 7, '2026-06-07 17:24:34'),
(11, NULL, 7, '2026-06-07 17:26:07'),
(12, NULL, 7, '2026-06-07 17:28:44'),
(13, NULL, 7, '2026-06-07 17:32:09'),
(14, NULL, 7, '2026-06-07 17:55:25'),
(15, 6, 7, '2026-06-07 17:57:01'),
(16, 6, 7, '2026-06-07 17:57:10'),
(17, 6, 7, '2026-06-07 18:02:18'),
(18, 6, 7, '2026-06-07 18:02:18'),
(19, 6, 7, '2026-06-07 18:02:22'),
(20, 6, 3, '2026-06-07 18:26:56'),
(21, 6, 3, '2026-06-07 18:26:56'),
(22, 6, 3, '2026-06-07 18:30:21'),
(23, 6, 7, '2026-06-07 18:41:16'),
(24, 6, 4, '2026-06-07 18:48:35'),
(25, 6, 7, '2026-06-07 18:48:54'),
(26, 6, 7, '2026-06-07 19:06:25'),
(27, 4, 7, '2026-06-07 19:08:12'),
(28, 4, 7, '2026-06-07 19:08:12'),
(29, 4, 10, '2026-06-08 11:24:52'),
(30, 4, 7, '2026-06-08 11:25:12'),
(31, NULL, 7, '2026-06-08 11:26:19'),
(32, NULL, 7, '2026-06-08 11:32:04'),
(33, NULL, 7, '2026-06-08 11:34:42'),
(34, NULL, 3, '2026-06-08 11:35:12'),
(35, NULL, 3, '2026-06-08 11:35:14'),
(36, NULL, 2, '2026-06-08 11:35:15'),
(37, NULL, 3, '2026-06-08 11:35:15'),
(38, NULL, 2, '2026-06-08 11:35:18'),
(39, NULL, 2, '2026-06-08 11:36:01'),
(40, NULL, 4, '2026-06-08 11:36:44'),
(41, NULL, 2, '2026-06-08 11:39:47'),
(42, NULL, 2, '2026-06-08 11:41:59'),
(43, NULL, 2, '2026-06-08 11:43:09'),
(44, NULL, 2, '2026-06-08 11:45:58'),
(45, 6, 7, '2026-06-08 12:47:24'),
(46, 4, 4, '2026-06-08 13:46:18'),
(47, NULL, 1, '2026-06-08 13:49:57'),
(48, NULL, 1, '2026-06-08 16:49:24');

-- --------------------------------------------------------

--
-- Структура таблицы `wishlist`
--

CREATE TABLE `wishlist` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `wishlist`
--

INSERT INTO `wishlist` (`id`, `user_id`, `product_id`, `created_at`) VALUES
(1, 6, 7, '2026-06-07 17:57:12');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `cart_items`
--
ALTER TABLE `cart_items`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_user_product` (`user_id`,`product_id`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `idx_cart_user` (`user_id`);

--
-- Индексы таблицы `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `slug` (`slug`);

--
-- Индексы таблицы `labels`
--
ALTER TABLE `labels`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `order_number` (`order_number`),
  ADD KEY `idx_orders_status` (`status`),
  ADD KEY `idx_orders_user` (`user_id`),
  ADD KEY `idx_orders_created` (`created_at`);

--
-- Индексы таблицы `order_items`
--
ALTER TABLE `order_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_id` (`order_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Индексы таблицы `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `slug` (`slug`),
  ADD KEY `idx_products_category` (`category_id`),
  ADD KEY `idx_products_label` (`label_id`),
  ADD KEY `idx_products_price` (`price`),
  ADD KEY `idx_products_rating` (`rating`),
  ADD KEY `idx_products_artist` (`artist`),
  ADD KEY `idx_products_release_year` (`release_year`);

--
-- Индексы таблицы `promo_codes`
--
ALTER TABLE `promo_codes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `code` (`code`);

--
-- Индексы таблицы `reviews`
--
ALTER TABLE `reviews`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Индексы таблицы `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Индексы таблицы `view_history`
--
ALTER TABLE `view_history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Индексы таблицы `wishlist`
--
ALTER TABLE `wishlist`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_wishlist` (`user_id`,`product_id`),
  ADD KEY `product_id` (`product_id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `cart_items`
--
ALTER TABLE `cart_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT для таблицы `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT для таблицы `labels`
--
ALTER TABLE `labels`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT для таблицы `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `order_items`
--
ALTER TABLE `order_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT для таблицы `promo_codes`
--
ALTER TABLE `promo_codes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `reviews`
--
ALTER TABLE `reviews`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT для таблицы `view_history`
--
ALTER TABLE `view_history`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT для таблицы `wishlist`
--
ALTER TABLE `wishlist`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `cart_items`
--
ALTER TABLE `cart_items`
  ADD CONSTRAINT `cart_items_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `cart_items_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Ограничения внешнего ключа таблицы `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Ограничения внешнего ключа таблицы `order_items`
--
ALTER TABLE `order_items`
  ADD CONSTRAINT `order_items_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `order_items_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`);

--
-- Ограничения внешнего ключа таблицы `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`),
  ADD CONSTRAINT `products_ibfk_2` FOREIGN KEY (`label_id`) REFERENCES `labels` (`id`);

--
-- Ограничения внешнего ключа таблицы `reviews`
--
ALTER TABLE `reviews`
  ADD CONSTRAINT `reviews_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `reviews_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Ограничения внешнего ключа таблицы `view_history`
--
ALTER TABLE `view_history`
  ADD CONSTRAINT `view_history_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `view_history_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Ограничения внешнего ключа таблицы `wishlist`
--
ALTER TABLE `wishlist`
  ADD CONSTRAINT `wishlist_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `wishlist_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
