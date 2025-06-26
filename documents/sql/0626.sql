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
CREATE DATABASE IF NOT EXISTS `e2` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `e2`;

--  テーブル e2.orders の構造をダンプしています
CREATE TABLE IF NOT EXISTS `orders` (
  `order_id` int NOT NULL AUTO_INCREMENT,
  `order_code` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  `is_paid` tinyint(1) NOT NULL DEFAULT (0),
  `is_complete` tinyint(1) NOT NULL DEFAULT (0),
  `is_handed` tinyint(1) NOT NULL DEFAULT '0',
  `total_amount` int NOT NULL DEFAULT (0),
  PRIMARY KEY (`order_id`)
) ENGINE=InnoDB AUTO_INCREMENT=92 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- テーブル e2.orders: ~5 rows (約) のデータをダンプしています
INSERT INTO `orders` (`order_id`, `order_code`, `is_paid`, `is_complete`, `is_handed`, `total_amount`) VALUES
	(1, '20250619-001', 1, 1, 1, 600),
	(2, '20250619-002', 1, 1, 0, 300),
	(3, '20250619-003', 1, 0, 0, 500),
	(4, '20250619-004', 0, 0, 0, 800),
	(5, '20250624-163308', 1, 1, 0, 14380);

--  テーブル e2.products の構造をダンプしています
CREATE TABLE IF NOT EXISTS `products` (
  `product_id` int NOT NULL AUTO_INCREMENT,
  `product_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `price` int NOT NULL,
  `is_sold_out` tinyint(1) NOT NULL,
  `product_detail` text COLLATE utf8mb4_general_ci,
  `image_url` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  PRIMARY KEY (`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- テーブル e2.products: ~7 rows (約) のデータをダンプしています
INSERT INTO `products` (`product_id`, `product_name`, `price`, `is_sold_out`, `product_detail`, `image_url`) VALUES
	(1, 'イチゴクレープ', 620, 0, '完熟いちごとふわふわ生クリーム', 'ichigo.png'),
	(2, 'チョコバナナクレープ', 620, 0, 'たっぷりバナナとチョコレートの組み合わせ！チョコチップが良いアクセント！', 'banana.png'),
	(3, '黒蜜抹茶アイスクレープ', 660, 0, '黒蜜抹茶の味わいをクレープで…！？', 'matcha.png'),
	(4, 'エッグアンドベジタブル', 600, 0, '卵と野菜をクレープで包んだ1品！トロトロの半熟卵があなたを惑わす！', 'tamabege.png'),
	(5, '<期間限定>モリ生アソート', 880, 0, '生クリーム好きのためのクレープ！', 'morinama.png'),
	(6, 'ウサギさんクレープ', 900, 0, 'ウサギさんがキュートに顔を覗かせるフルーツいっぱいクレープ。', 'usagi.png'),
	(7, 'パンダさんクレープ', 900, 0, 'キュートな癒しとリッチなハーモニー', 'panda.png');

--  テーブル e2.ordered_products の構造をダンプしています
CREATE TABLE IF NOT EXISTS `ordered_products` (
  `ordered_product_id` int NOT NULL AUTO_INCREMENT,
  `order_id` int NOT NULL DEFAULT '0',
  `product_id` int NOT NULL DEFAULT '0',
  `pieces` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ordered_product_id`),
  KEY `FK__orders` (`order_id`),
  KEY `FK__products` (`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=140 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- テーブル e2.ordered_products: ~9 rows (約) のデータをダンプしています
INSERT INTO `ordered_products` (`ordered_product_id`, `order_id`, `product_id`, `pieces`) VALUES
	(1, 1, 1, 2),
	(2, 1, 2, 1),
	(3, 2, 3, 3),
	(4, 3, 4, 1),
	(5, 4, 5, 5),
	(6, 4, 6, 2),
	(7, 4, 7, 1),
	(8, 5, 1, 20),
	(9, 5, 3, 3);

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
