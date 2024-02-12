/*
 Navicat Premium Data Transfer


 Date: 12/02/2024 10:23:34
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
INSERT INTO `gregos_organizacao` VALUES ('Policia', 'Bem vindos', '20');
INSERT INTO `gregos_organizacao` VALUES ('Mechanic', 'Bem Vindos', '20');
INSERT INTO `gregos_organizacao` VALUES ('Paramedic', 'Bem Vindos', '20');
INSERT INTO `gregos_organizacao` VALUES ('Ballas', 'Bem Vindos', '20');
INSERT INTO `gregos_organizacao` VALUES ('EastSide', 'Bem Vindos', '20');
INSERT INTO `gregos_organizacao` VALUES ('Vagos', 'Bem Vindos', '20');
INSERT INTO `gregos_organizacao` VALUES ('Families', 'Bem Vindos', '20');
INSERT INTO `gregos_organizacao` VALUES ('Aztecas', 'Bem Vindos', '20');
INSERT INTO `gregos_organizacao` VALUES ('Bloods', 'Bem Vindos', '20');
INSERT INTO `gregos_organizacao` VALUES ('TheLost', 'Bem Vindos', '20');
INSERT INTO `gregos_organizacao` VALUES ('Vinhedo', 'Bem Vindos', '20');
INSERT INTO `gregos_organizacao` VALUES ('Vanilla', 'Bem Vindos', '20');
INSERT INTO `gregos_organizacao` VALUES ('Runners', 'Bem Vindos', '20');
INSERT INTO `gregos_organizacao` VALUES ('PopsDiner', 'Bem Vindos', '20');
INSERT INTO `gregos_organizacao` VALUES ('BurgerShot', 'Bem Vindos', '20');
INSERT INTO `gregos_organizacao` VALUES ('PizzaThis', 'Bem Vindos', '20');
INSERT INTO `gregos_organizacao` VALUES ('Arcade', 'Bem Vindos', '20');
INSERT INTO `gregos_organizacao` VALUES ('Desserts', 'Bem Vindos', '20');
INSERT INTO `gregos_organizacao` VALUES ('Playboy', 'Bem Vindos', '20');
INSERT INTO `gregos_organizacao` VALUES ('Favela01', 'Bem Vindos', '20');
INSERT INTO `gregos_organizacao` VALUES ('Triads', 'Bem Vindos', '20');
INSERT INTO `gregos_organizacao` VALUES ('Favela02', 'Bem Vindos', '20');
INSERT INTO `gregos_organizacao` VALUES ('Favela03', 'Bem Vindos', '20');
INSERT INTO `gregos_organizacao` VALUES ('Favela04', 'Bem Vindos', '20');
INSERT INTO `gregos_organizacao` VALUES ('Garden', 'Bem Vindos', '20');
INSERT INTO `gregos_organizacao` VALUES ('Salieris', 'Bem Vindos', '20');

