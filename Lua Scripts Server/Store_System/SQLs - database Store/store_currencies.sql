/*
 Navicat Premium Data Transfer

 Source Server         : acore
 Source Server Type    : MySQL
 Source Server Version : 80034 (8.0.34)
 Source Host           : localhost:3306
 Source Schema         : store

 Target Server Type    : MySQL
 Target Server Version : 80034 (8.0.34)
 File Encoding         : 65001

 Date: 07/12/2023 22:12:34
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for store_currencies
-- ----------------------------
DROP TABLE IF EXISTS `store_currencies`;
CREATE TABLE `store_currencies`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `type` int UNSIGNED NOT NULL DEFAULT 1,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  `icon` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  `data` int NOT NULL DEFAULT 0,
  `tooltip` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of store_currencies
-- ----------------------------
INSERT INTO `store_currencies` VALUES (1, 1, 'Gold', 'Inv_misc_coin_02', 0, 'This is normal gold.');
INSERT INTO `store_currencies` VALUES (2, 2, 'Donate Points', 'Donate1', 61010, 'Moeda usada para comprar items na loja.');

SET FOREIGN_KEY_CHECKS = 1;
