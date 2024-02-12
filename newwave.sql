/*
 Navicat Premium Data Transfer


 Date: 08/08/2023 10:20:24
*/

CREATE DATABASE IF NOT EXISTS `newwave` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `newwave`;

-- ----------------------------
-- Table structure for smartphone_bank_invoices
-- ----------------------------
DROP TABLE IF EXISTS `smartphone_bank_invoices`;
CREATE TABLE `smartphone_bank_invoices`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `payee_id` int NOT NULL,
  `payer_id` int NOT NULL,
  `reason` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  `value` int NOT NULL,
  `paid` tinyint NOT NULL DEFAULT 0,
  `created_at` int NOT NULL,
  `updated_at` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for smartphone_blocks
-- ----------------------------
DROP TABLE IF EXISTS `smartphone_blocks`;
CREATE TABLE `smartphone_blocks`  (
  `user_id` int NOT NULL,
  `phone` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`user_id`, `phone`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for smartphone_calls
-- ----------------------------
DROP TABLE IF EXISTS `smartphone_calls`;
CREATE TABLE `smartphone_calls`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `initiator` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `target` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `duration` int NOT NULL DEFAULT 0,
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `video` tinyint NOT NULL DEFAULT 0,
  `anonymous` tinyint NOT NULL DEFAULT 0,
  `created_at` bigint NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `initiator_index`(`initiator` ASC) USING BTREE,
  INDEX `target_index`(`target` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for smartphone_contacts
-- ----------------------------
DROP TABLE IF EXISTS `smartphone_contacts`;
CREATE TABLE `smartphone_contacts`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `owner` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `owner_index`(`owner` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for smartphone_gallery
-- ----------------------------
DROP TABLE IF EXISTS `smartphone_gallery`;
CREATE TABLE `smartphone_gallery`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `folder` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '/',
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `created_at` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `user_id_index`(`user_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 30 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for smartphone_instagram
-- ----------------------------
DROP TABLE IF EXISTS `smartphone_instagram`;
CREATE TABLE `smartphone_instagram`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NULL DEFAULT NULL,
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `bio` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `avatarURL` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `verified` tinyint NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `user_id_index`(`user_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for smartphone_instagram_followers
-- ----------------------------
DROP TABLE IF EXISTS `smartphone_instagram_followers`;
CREATE TABLE `smartphone_instagram_followers`  (
  `follower_id` bigint NOT NULL,
  `profile_id` bigint NOT NULL,
  PRIMARY KEY (`follower_id`, `profile_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for smartphone_instagram_likes
-- ----------------------------
DROP TABLE IF EXISTS `smartphone_instagram_likes`;
CREATE TABLE `smartphone_instagram_likes`  (
  `post_id` bigint NOT NULL,
  `profile_id` bigint NOT NULL,
  PRIMARY KEY (`post_id`, `profile_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for smartphone_instagram_notifications
-- ----------------------------
DROP TABLE IF EXISTS `smartphone_instagram_notifications`;
CREATE TABLE `smartphone_instagram_notifications`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `profile_id` int NOT NULL,
  `author_id` int NOT NULL,
  `content` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `saw` tinyint NOT NULL DEFAULT 0,
  `created_at` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `profile_id_index`(`profile_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for smartphone_instagram_posts
-- ----------------------------
DROP TABLE IF EXISTS `smartphone_instagram_posts`;
CREATE TABLE `smartphone_instagram_posts`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `profile_id` bigint NOT NULL,
  `post_id` bigint NULL DEFAULT NULL,
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `content` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `created_at` bigint NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `profile_id_index`(`profile_id` ASC) USING BTREE,
  INDEX `post_id_index`(`post_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for smartphone_olx
-- ----------------------------
DROP TABLE IF EXISTS `smartphone_olx`;
CREATE TABLE `smartphone_olx`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `category` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `price` int NOT NULL,
  `description` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `images` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `created_at` bigint NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `user_id_index`(`user_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for smartphone_paypal_transactions
-- ----------------------------
DROP TABLE IF EXISTS `smartphone_paypal_transactions`;
CREATE TABLE `smartphone_paypal_transactions`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` bigint NOT NULL,
  `target` bigint NOT NULL,
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'payment',
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `value` bigint NOT NULL,
  `created_at` bigint NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `user_id_index`(`user_id` ASC) USING BTREE,
  INDEX `target_index`(`target` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for smartphone_tinder
-- ----------------------------
DROP TABLE IF EXISTS `smartphone_tinder`;
CREATE TABLE `smartphone_tinder`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `bio` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `age` tinyint NOT NULL,
  `gender` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `show_gender` tinyint NOT NULL,
  `tags` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `show_tags` tinyint NOT NULL,
  `target` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `user_id_index`(`user_id` ASC) USING BTREE,
  INDEX `gender_index`(`gender` ASC) USING BTREE,
  INDEX `target_index`(`target` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for smartphone_tinder_messages
-- ----------------------------
DROP TABLE IF EXISTS `smartphone_tinder_messages`;
CREATE TABLE `smartphone_tinder_messages`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `sender` int NOT NULL,
  `target` int NOT NULL,
  `content` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `liked` tinyint NOT NULL DEFAULT 0,
  `created_at` bigint NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `sender_index`(`sender` ASC) USING BTREE,
  INDEX `target_index`(`target` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for smartphone_tinder_rating
-- ----------------------------
DROP TABLE IF EXISTS `smartphone_tinder_rating`;
CREATE TABLE `smartphone_tinder_rating`  (
  `profile_id` int NOT NULL,
  `rated_id` int NOT NULL,
  `rating` tinyint NOT NULL DEFAULT 0,
  PRIMARY KEY (`profile_id`, `rated_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for smartphone_tor_messages
-- ----------------------------
DROP TABLE IF EXISTS `smartphone_tor_messages`;
CREATE TABLE `smartphone_tor_messages`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `channel` varchar(24) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'geral',
  `sender` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `image` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `content` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `created_at` bigint NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `channel_index`(`channel` ASC) USING BTREE,
  INDEX `sender_index`(`sender` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for smartphone_tor_payments
-- ----------------------------
DROP TABLE IF EXISTS `smartphone_tor_payments`;
CREATE TABLE `smartphone_tor_payments`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `sender` bigint NOT NULL,
  `target` bigint NOT NULL,
  `amount` int NOT NULL,
  `created_at` bigint NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `sender_index`(`sender` ASC) USING BTREE,
  INDEX `target_index`(`target` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for smartphone_twitter_followers
-- ----------------------------
DROP TABLE IF EXISTS `smartphone_twitter_followers`;
CREATE TABLE `smartphone_twitter_followers`  (
  `follower_id` bigint NOT NULL,
  `profile_id` bigint NOT NULL,
  INDEX `profile_id_index`(`profile_id` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for smartphone_twitter_likes
-- ----------------------------
DROP TABLE IF EXISTS `smartphone_twitter_likes`;
CREATE TABLE `smartphone_twitter_likes`  (
  `tweet_id` bigint NOT NULL,
  `profile_id` bigint NOT NULL,
  INDEX `tweet_id_index`(`tweet_id` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for smartphone_twitter_profiles
-- ----------------------------
DROP TABLE IF EXISTS `smartphone_twitter_profiles`;
CREATE TABLE `smartphone_twitter_profiles`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `avatarURL` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `bannerURL` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `bio` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `verified` tinyint NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `user_id_index`(`user_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for smartphone_twitter_tweets
-- ----------------------------
DROP TABLE IF EXISTS `smartphone_twitter_tweets`;
CREATE TABLE `smartphone_twitter_tweets`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `profile_id` int NOT NULL,
  `tweet_id` bigint NULL DEFAULT NULL,
  `content` varchar(280) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `created_at` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `profile_id_index`(`profile_id` ASC) USING BTREE,
  INDEX `tweet_id_index`(`tweet_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for smartphone_uber_trips
-- ----------------------------
DROP TABLE IF EXISTS `smartphone_uber_trips`;
CREATE TABLE `smartphone_uber_trips`  (
  `id` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `user_id` int NULL DEFAULT NULL,
  `driver_id` int NULL DEFAULT NULL,
  `total` int NULL DEFAULT NULL,
  `from` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `to` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `user_rate` tinyint NULL DEFAULT 0,
  `driver_rate` tinyint NULL DEFAULT 0,
  `created_at` int NULL DEFAULT NULL,
  `finished_at` int NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for smartphone_whatsapp
-- ----------------------------
DROP TABLE IF EXISTS `smartphone_whatsapp`;
CREATE TABLE `smartphone_whatsapp`  (
  `owner` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `avatarURL` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `read_receipts` tinyint NOT NULL DEFAULT 1,
  PRIMARY KEY (`owner`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for smartphone_whatsapp_channels
-- ----------------------------
DROP TABLE IF EXISTS `smartphone_whatsapp_channels`;
CREATE TABLE `smartphone_whatsapp_channels`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `sender` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `target` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `sender_index`(`sender` ASC) USING BTREE,
  INDEX `target_index`(`target` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for smartphone_whatsapp_groups
-- ----------------------------
DROP TABLE IF EXISTS `smartphone_whatsapp_groups`;
CREATE TABLE `smartphone_whatsapp_groups`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `avatarURL` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `owner` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `members` varchar(2048) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `created_at` bigint NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for smartphone_whatsapp_messages
-- ----------------------------
DROP TABLE IF EXISTS `smartphone_whatsapp_messages`;
CREATE TABLE `smartphone_whatsapp_messages`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `channel_id` bigint UNSIGNED NOT NULL,
  `sender` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `image` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `content` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `deleted_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `readed` tinyint NOT NULL DEFAULT 0,
  `saw_at` bigint NOT NULL DEFAULT 0,
  `created_at` bigint NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `sender_index`(`sender` ASC) USING BTREE,
  INDEX `channel_id_index`(`channel_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for summerz_accounts
-- ----------------------------
DROP TABLE IF EXISTS `summerz_accounts`;
CREATE TABLE `summerz_accounts`  (
  `discord` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '0',
  `whitelist` tinyint(1) NOT NULL DEFAULT 0,
  `chars` int NOT NULL DEFAULT 1,
  `gems` int NOT NULL DEFAULT 0,
  `premium` int NOT NULL DEFAULT 0,
  `priority` int NOT NULL DEFAULT 0,
  PRIMARY KEY (`discord`) USING BTREE,
  INDEX `steam`(`discord` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for summerz_banneds
-- ----------------------------
DROP TABLE IF EXISTS `summerz_banneds`;
CREATE TABLE `summerz_banneds`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `discord` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `time` int NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `id`(`id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for summerz_characters
-- ----------------------------
DROP TABLE IF EXISTS `summerz_characters`;
CREATE TABLE `summerz_characters`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `discord` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `phone` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `serial` varchar(6) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `name` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT 'Individuo',
  `name2` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT 'Indigente',
  `locate` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT 'Sul',
  `sex` varchar(1) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT 'M',
  `blood` int NOT NULL DEFAULT 1,
  `fines` int NOT NULL DEFAULT 0,
  `garage` int NOT NULL DEFAULT 3,
  `prison` int NOT NULL DEFAULT 0,
  `port` int NOT NULL DEFAULT 0,
  `deleted` int NOT NULL DEFAULT 0,
  `paypal` int NULL DEFAULT 0,
  `bank` int NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `id`(`id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 17 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for summerz_chests
-- ----------------------------
DROP TABLE IF EXISTS `summerz_chests`;
CREATE TABLE `summerz_chests`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `weight` int NOT NULL DEFAULT 0,
  `perm` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `logs` int NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `id`(`id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 31 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- Copiando dados para a tabela creative.summerz_chests: ~28 rows (aproximadamente)
/*!40000 ALTER TABLE `summerz_chests` DISABLE KEYS */;
INSERT INTO `summerz_chests` (`id`, `name`, `weight`, `perm`, `logs`) VALUES
	(1, 'State', 500, 'State', 1),
	(2, 'Corrections', 500, 'Corrections', 1),
	(3, 'Ranger', 500, 'Ranger', 1),
	(4, 'Lspd', 550, 'Lspd', 1),
	(5, 'Sheriff', 525, 'Sheriff', 1),
	(6, 'Paramedic', 250, 'Paramedic', 1),
	(7, 'Aztecas', 250, 'Aztecas', 0),
	(8, 'Bloods', 250, 'Bloods', 0),
	(9, 'Ballas', 250, 'Ballas', 0),
	(10, 'Vagos', 250, 'Vagos', 0),
	(11, 'Families', 250, 'Families', 0),
	(12, 'TheLost', 250, 'TheLost', 0),
	(13, 'Mechanic', 250, 'Mechanic', 0),
	(14, 'MotoClub', 250, 'MotoClub', 0),
	(15, 'Vanilla', 250, 'Vanilla', 1),
	(16, 'Triads', 250, 'Triads', 0),
	(17, 'Arcade', 250, 'Arcade', 0),
	(18, 'Desserts', 250, 'Desserts', 0),
	(19, 'Vinhedo', 250, 'Vinhedo', 0),
	(20, 'Playboy', 250, 'Playboy', 0),
	(21, 'EastSide', 250, 'EastSide', 0),
	(22, 'Salieris', 250, 'Salieris', 0),
	(23, 'trayShot', 10, 'trayShot', 0),
	(24, 'trayDesserts', 10, 'trayDesserts', 0),
	(25, 'trayPops', 10, 'trayPops', 0),
	(26, 'trayPizza', 10, 'trayPizza', 0),
	(27, 'Runners', 250, 'Runners', 0),
	(28, 'Angels', 250, 'Angels', 0);
/*!40000 ALTER TABLE `summerz_chests` ENABLE KEYS */;

-- ----------------------------
-- Table structure for summerz_entitydata
-- ----------------------------
DROP TABLE IF EXISTS `summerz_entitydata`;
CREATE TABLE `summerz_entitydata`  (
  `dkey` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `dvalue` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  PRIMARY KEY (`dkey`) USING BTREE,
  INDEX `dkey`(`dkey` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for summerz_fidentity
-- ----------------------------
DROP TABLE IF EXISTS `summerz_fidentity`;
CREATE TABLE `summerz_fidentity`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '',
  `name2` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '',
  `locate` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT 'Sul',
  `port` int NOT NULL DEFAULT 1,
  `blood` int NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `id`(`id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for summerz_playerdata
-- ----------------------------
DROP TABLE IF EXISTS `summerz_playerdata`;
CREATE TABLE `summerz_playerdata`  (
  `user_id` int NOT NULL,
  `dkey` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `dvalue` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  PRIMARY KEY (`user_id`, `dkey`) USING BTREE,
  INDEX `user_id`(`user_id` ASC) USING BTREE,
  INDEX `dkey`(`dkey` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for summerz_prison
-- ----------------------------
DROP TABLE IF EXISTS `summerz_prison`;
CREATE TABLE `summerz_prison`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `police` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT '0',
  `nuser_id` int NOT NULL DEFAULT 0,
  `services` int NOT NULL DEFAULT 0,
  `fines` int NOT NULL DEFAULT 0,
  `text` longtext CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `date` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `id`(`id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for summerz_propertys
-- ----------------------------
DROP TABLE IF EXISTS `summerz_propertys`;
CREATE TABLE `summerz_propertys`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT 'Homes0001',
  `interior` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT 'Middle',
  `tax` int NOT NULL DEFAULT 0,
  `user_id` int NOT NULL DEFAULT 0,
  `price` int NOT NULL DEFAULT 0,
  `residents` int NOT NULL DEFAULT 1,
  `vault` int NOT NULL DEFAULT 1,
  `fridge` int NOT NULL DEFAULT 1,
  `owner` int NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `id`(`id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for summerz_races
-- ----------------------------
DROP TABLE IF EXISTS `summerz_races`;
CREATE TABLE `summerz_races`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `raceid` int NOT NULL DEFAULT 0,
  `user_id` int NOT NULL DEFAULT 0,
  `name` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT 'Individuo Indigente',
  `vehicle` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT 'Sultan RS',
  `points` int NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `id`(`id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for summerz_vehicles
-- ----------------------------
DROP TABLE IF EXISTS `summerz_vehicles`;
CREATE TABLE `summerz_vehicles`  (
  `user_id` int NOT NULL,
  `vehicle` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `tax` int NOT NULL DEFAULT 0,
  `plate` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `rental` int NOT NULL DEFAULT 0,
  `rendays` int NOT NULL DEFAULT 0,
  `arrest` int NOT NULL DEFAULT 0,
  `engine` int NOT NULL DEFAULT 1000,
  `body` int NOT NULL DEFAULT 1000,
  `fuel` int NOT NULL DEFAULT 100,
  `nitro` int NOT NULL DEFAULT 0,
  `work` varchar(5) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT 'false',
  `doors` varchar(254) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `windows` varchar(254) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `tyres` varchar(254) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`user_id`, `vehicle`) USING BTREE,
  INDEX `user_id`(`user_id` ASC) USING BTREE,
  INDEX `vehicle`(`vehicle` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

SET FOREIGN_KEY_CHECKS = 1;
