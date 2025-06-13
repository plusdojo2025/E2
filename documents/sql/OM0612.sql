-- --------------------------------------------------------
-- ホスト:                          127.0.0.1
-- サーバーのバージョン:                   8.0.26 - MySQL Community Server - GPL
-- サーバー OS:                      Win64
-- HeidiSQL バージョン:               12.11.0.7065
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- e2 のデータベース構造をダンプしています
CREATE DATABASE IF NOT EXISTS `e2` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `e2`;

--  テーブル e2.users の構造をダンプしています
CREATE TABLE IF NOT EXISTS `users` (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `user_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `password` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `config` text,
  `order_url` text,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--  テーブル e2.products の構造をダンプしています
CREATE TABLE IF NOT EXISTS `products` (
  `product_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `product_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `price` int NOT NULL,
  `is_sold_out` tinyint(1) NOT NULL,
  `allergy` binary(30) DEFAULT NULL,
  `product_detail` text,
  `image_url` text,
  `created_at` timestamp NOT NULL,
  PRIMARY KEY (`product_id`),
  KEY `FK_products_users` (`user_id`),
  CONSTRAINT `FK_products_users` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--  テーブル e2.orders の構造をダンプしています
CREATE TABLE IF NOT EXISTS `orders` (
  `order_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `order_code` varchar(13) NOT NULL DEFAULT '',
  `is_paid` tinyint(1) NOT NULL DEFAULT (0),
  `is_complete` tinyint(1) NOT NULL DEFAULT (0),
  `is_handed` tinyint(1) NOT NULL DEFAULT (0),
  `total_amount` int NOT NULL DEFAULT (0),
  `created_at` timestamp NOT NULL,
  PRIMARY KEY (`order_id`),
  KEY `FK_orders_users` (`user_id`),
  CONSTRAINT `FK_orders_users` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--  テーブル e2.ordered_products の構造をダンプしています
CREATE TABLE IF NOT EXISTS `ordered_products` (
  `ordered_product_id` int NOT NULL AUTO_INCREMENT,
  `order_id` int NOT NULL DEFAULT '0',
  `product_id` int NOT NULL DEFAULT '0',
  `pieces` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ordered_product_id`),
  KEY `FK__orders` (`order_id`),
  KEY `FK__products` (`product_id`),
  CONSTRAINT `FK__orders` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`),
  CONSTRAINT `FK__products` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;

-- サンプルデータ
-- ユーザーテーブル
INSERT INTO `users` (`user_name`, `password`, `config`, `order_url`, `created_at`) VALUES
('田中太郎', 'pass1234', 'アレルギーなし', 'https://example.com/order/1', NOW()),
('山田花子', 'securepass', 'ナッツアレルギー', 'https://example.com/order/2', NOW());

-- 商品テーブル（user_idは上記のID 1, 2 を使用）
INSERT INTO `products` (`user_id`, `product_name`, `price`, `is_sold_out`, `allergy`, `product_detail`, `image_url`, `created_at`) VALUES
(1, 'りんごジュース', 150, 0, NULL, '青森産のリンゴ使用', 'https://example.com/images/apple.jpg', NOW()),
(2, 'チョコレートケーキ', 450, 0, NULL, '濃厚なベルギー産チョコ使用', 'https://example.com/images/cake.jpg', NOW());

-- 注文テーブル（user_id 1 を使用）
INSERT INTO `orders` (`user_id`, `order_code`, `is_paid`, `is_complete`, `is_handed`, `total_amount`, `created_at`) VALUES
(1, 'ORD000000001', 1, 0, 0, 600, NOW());

-- 注文商品テーブル（order_id 1, product_id 1 と 2 を使用）
INSERT INTO `ordered_products` (`order_id`, `product_id`, `pieces`) VALUES
(1, 1, 2),
(1, 2, 1);