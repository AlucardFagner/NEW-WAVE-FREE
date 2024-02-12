/*
 Navicat Premium Data Transfer

 Source Server         : alucard
 Source Server Type    : MySQL
 Source Server Version : 100432
 Source Host           : localhost:3306
 Source Schema         : newwave

 Target Server Type    : MySQL
 Target Server Version : 100432
 File Encoding         : 65001

 Date: 29/01/2024 18:42:28
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for gregos_members
-- ----------------------------
DROP TABLE IF EXISTS `gregos_members`;
CREATE TABLE `gregos_members`  (
  `user_id` int NOT NULL,
  `name` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `cargo` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `status` varchar(3) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `organizacao` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = DYNAMIC;


-- ----------------------------
-- Table structure for gregos_organizacao
-- ----------------------------
DROP TABLE IF EXISTS `gregos_organizacao`;
CREATE TABLE `gregos_organizacao`  (
  `organizacao` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `mensagem` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `membros` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of gregos_organizacao
-- ----------------------------
INSERT INTO `gregos_organizacao` VALUES ('Policia', 'Alucard O Fagner', '20');
INSERT INTO `gregos_organizacao` VALUES ('Triads', 'Bem Vindos', '20');
INSERT INTO `gregos_organizacao` VALUES ('Ballas', 'Bem Vindos', '20');

SET FOREIGN_KEY_CHECKS = 1;
