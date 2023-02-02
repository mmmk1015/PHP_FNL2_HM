-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- ホスト: localhost
-- 生成日時: 2023 年 2 月 02 日 13:05
-- サーバのバージョン： 10.4.27-MariaDB
-- PHP のバージョン: 8.1.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- データベース: `gsf_d12_02`
--

-- --------------------------------------------------------

--
-- テーブルの構造 `creditcard`
--

CREATE TABLE `creditcard` (
  `id` int(11) NOT NULL,
  `name` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- --------------------------------------------------------

--
-- テーブルの構造 `diary_table`
--

CREATE TABLE `diary_table` (
  `id` int(11) NOT NULL,
  `title` varchar(45) NOT NULL,
  `category` tinyint(1) NOT NULL,
  `difficulty` tinyint(1) NOT NULL DEFAULT 2,
  `voltage` mediumint(9) NOT NULL,
  `howto` text NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- テーブルのデータのダンプ `diary_table`
--

INSERT INTO `diary_table` (`id`, `title`, `category`, `difficulty`, `voltage`, `howto`, `created_at`, `updated_at`, `deleted_at`) VALUES
(7, 'あああああ', 1, 2, 100, 'っっっっw', '2023-01-19 08:23:44', '2023-01-19 08:23:44', NULL),
(8, 'aaaa', 2, 2, 11, 'aa', '2023-02-02 21:01:28', '2023-02-02 21:01:28', NULL),
(9, 'aaaaa', 2, 2, 1, 'aaaa', '2023-02-02 21:01:45', '2023-02-02 21:01:45', NULL);

-- --------------------------------------------------------

--
-- テーブルの構造 `dlike_table`
--

CREATE TABLE `dlike_table` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `diary_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- テーブルのデータのダンプ `dlike_table`
--

INSERT INTO `dlike_table` (`id`, `user_id`, `diary_id`, `created_at`) VALUES
(11, 6, 7, '2023-02-02 21:04:09'),
(12, 6, 8, '2023-02-02 21:04:09'),
(13, 6, 9, '2023-02-02 21:04:10');

-- --------------------------------------------------------

--
-- テーブルの構造 `images`
--

CREATE TABLE `images` (
  `id` int(11) NOT NULL,
  `user` text NOT NULL,
  `file_name` varchar(255) NOT NULL,
  `create_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `update_date` datetime NOT NULL,
  `delete_date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- テーブルのデータのダンプ `images`
--

INSERT INTO `images` (`id`, `user`, `file_name`, `create_date`, `update_date`, `delete_date`) VALUES
(1, 'megumi', '326449781_1516681838854463_8869951435867052690_n.jpg', '2023-02-02 11:13:42', '2023-02-02 12:12:58', NULL);

-- --------------------------------------------------------

--
-- テーブルの構造 `income_category`
--

CREATE TABLE `income_category` (
  `id` int(11) NOT NULL,
  `name` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- --------------------------------------------------------

--
-- テーブルの構造 `like_table`
--

CREATE TABLE `like_table` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `todo_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- テーブルのデータのダンプ `like_table`
--

INSERT INTO `like_table` (`id`, `user_id`, `todo_id`, `created_at`) VALUES
(7, 6, 10, '2023-01-21 15:44:02'),
(19, 5, 5, '2023-01-21 15:50:39'),
(20, 5, 13, '2023-01-21 15:50:40'),
(21, 5, 2, '2023-01-21 15:50:41'),
(22, 5, 7, '2023-01-21 15:50:42');

-- --------------------------------------------------------

--
-- テーブルの構造 `payment_method`
--

CREATE TABLE `payment_method` (
  `id` int(11) NOT NULL,
  `name` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- --------------------------------------------------------

--
-- テーブルの構造 `qr`
--

CREATE TABLE `qr` (
  `id` int(11) NOT NULL,
  `name` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- --------------------------------------------------------

--
-- テーブルの構造 `records`
--

CREATE TABLE `records` (
  `id` int(11) NOT NULL,
  `date` text NOT NULL,
  `title` text NOT NULL,
  `amount` int(11) NOT NULL,
  `spending_category` int(11) NOT NULL,
  `income_category` int(11) NOT NULL,
  `type` int(11) NOT NULL,
  `payment_method` int(11) NOT NULL,
  `credit` int(11) NOT NULL,
  `qr` int(11) NOT NULL,
  `memo` text NOT NULL,
  `input_time` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- --------------------------------------------------------

--
-- テーブルの構造 `spending_category`
--

CREATE TABLE `spending_category` (
  `id` int(11) NOT NULL,
  `name` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- --------------------------------------------------------

--
-- テーブルの構造 `todo_table`
--

CREATE TABLE `todo_table` (
  `id` int(11) NOT NULL,
  `todo` varchar(128) NOT NULL,
  `deadline` date NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- テーブルのデータのダンプ `todo_table`
--

INSERT INTO `todo_table` (`id`, `todo`, `deadline`, `created_at`, `updated_at`, `deleted_at`) VALUES
(2, 'SQL練習', '2023-01-05', '2022-12-24 15:48:59', '2022-12-24 15:48:59', NULL),
(5, '練習', '2023-01-03', '2022-12-24 15:53:24', '2022-12-24 15:53:24', NULL),
(7, '猫と遊ぶ', '2023-01-01', '2022-12-24 15:53:24', '2023-01-19 14:00:38', '2023-01-11 21:54:33'),
(9, '資格勉強', '2023-01-25', '2022-12-24 15:55:17', '2022-12-24 15:55:17', NULL),
(10, '勉強', '2023-01-15', '2022-12-24 15:55:17', '2022-12-24 15:55:17', NULL),
(13, 'ぶりしゃぶP/U', '2023-01-03', '2022-12-24 17:05:56', '2022-12-24 17:05:56', NULL),
(14, 'PHP', '2023-01-20', '2023-01-07 15:39:37', '2023-01-07 15:39:37', NULL),
(15, 'aaaaaa', '2023-01-11', '2023-01-14 12:06:41', '2023-01-14 12:06:41', NULL),
(16, 'aaaaaa', '2023-02-04', '2023-01-21 15:39:14', '2023-01-21 15:39:14', NULL);

-- --------------------------------------------------------

--
-- テーブルの構造 `users_table`
--

CREATE TABLE `users_table` (
  `id` int(11) NOT NULL,
  `username` varchar(128) NOT NULL,
  `password` varchar(128) NOT NULL,
  `is_admin` int(1) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- テーブルのデータのダンプ `users_table`
--

INSERT INTO `users_table` (`id`, `username`, `password`, `is_admin`, `created_at`, `updated_at`, `deleted_at`) VALUES
(2, 'aaaaa', 'aaaaaa', 0, '2023-01-14 15:59:29', '2023-01-14 15:59:29', NULL),
(3, 'meg_kaneko', 'megumi', 0, '2023-01-14 16:01:33', '2023-01-14 16:01:33', NULL),
(4, 'megumi.kaneko1015@gmail.com', 'nn', 0, '2023-01-14 16:11:19', '2023-01-14 16:11:19', NULL),
(5, 'aaaa', 'megumi', 0, '2023-01-18 22:47:38', '2023-01-18 22:47:38', NULL),
(6, 'eeee', 'eeee', 0, '2023-01-19 14:00:27', '2023-01-19 14:00:27', NULL);

--
-- ダンプしたテーブルのインデックス
--

--
-- テーブルのインデックス `creditcard`
--
ALTER TABLE `creditcard`
  ADD PRIMARY KEY (`id`);

--
-- テーブルのインデックス `diary_table`
--
ALTER TABLE `diary_table`
  ADD PRIMARY KEY (`id`);

--
-- テーブルのインデックス `dlike_table`
--
ALTER TABLE `dlike_table`
  ADD PRIMARY KEY (`id`);

--
-- テーブルのインデックス `images`
--
ALTER TABLE `images`
  ADD PRIMARY KEY (`id`);

--
-- テーブルのインデックス `income_category`
--
ALTER TABLE `income_category`
  ADD PRIMARY KEY (`id`);

--
-- テーブルのインデックス `like_table`
--
ALTER TABLE `like_table`
  ADD PRIMARY KEY (`id`);

--
-- テーブルのインデックス `payment_method`
--
ALTER TABLE `payment_method`
  ADD PRIMARY KEY (`id`);

--
-- テーブルのインデックス `qr`
--
ALTER TABLE `qr`
  ADD PRIMARY KEY (`id`);

--
-- テーブルのインデックス `records`
--
ALTER TABLE `records`
  ADD PRIMARY KEY (`id`);

--
-- テーブルのインデックス `spending_category`
--
ALTER TABLE `spending_category`
  ADD PRIMARY KEY (`id`);

--
-- テーブルのインデックス `todo_table`
--
ALTER TABLE `todo_table`
  ADD PRIMARY KEY (`id`);

--
-- テーブルのインデックス `users_table`
--
ALTER TABLE `users_table`
  ADD PRIMARY KEY (`id`);

--
-- ダンプしたテーブルの AUTO_INCREMENT
--

--
-- テーブルの AUTO_INCREMENT `creditcard`
--
ALTER TABLE `creditcard`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- テーブルの AUTO_INCREMENT `diary_table`
--
ALTER TABLE `diary_table`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- テーブルの AUTO_INCREMENT `dlike_table`
--
ALTER TABLE `dlike_table`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- テーブルの AUTO_INCREMENT `images`
--
ALTER TABLE `images`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- テーブルの AUTO_INCREMENT `income_category`
--
ALTER TABLE `income_category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- テーブルの AUTO_INCREMENT `like_table`
--
ALTER TABLE `like_table`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=70;

--
-- テーブルの AUTO_INCREMENT `payment_method`
--
ALTER TABLE `payment_method`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- テーブルの AUTO_INCREMENT `qr`
--
ALTER TABLE `qr`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- テーブルの AUTO_INCREMENT `records`
--
ALTER TABLE `records`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- テーブルの AUTO_INCREMENT `spending_category`
--
ALTER TABLE `spending_category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- テーブルの AUTO_INCREMENT `todo_table`
--
ALTER TABLE `todo_table`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- テーブルの AUTO_INCREMENT `users_table`
--
ALTER TABLE `users_table`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
