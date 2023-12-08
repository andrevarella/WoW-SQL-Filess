/*
 Navicat Premium Data Transfer

 Source Server         : acore
 Source Server Type    : MySQL
 Source Server Version : 80034 (8.0.34)
 Source Host           : localhost:3306
 Source Schema         : acore_characters

 Target Server Type    : MySQL
 Target Server Version : 80034 (8.0.34)
 File Encoding         : 65001

 Date: 12/11/2023 21:00:16
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for custom_save_talents
-- ----------------------------
DROP TABLE IF EXISTS `custom_save_talents`;
CREATE TABLE `custom_save_talents`  (
  `guid` bigint UNSIGNED NOT NULL,
  `spell` int UNSIGNED NOT NULL,
  `BuildSlot` int UNSIGNED NOT NULL
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of custom_save_talents
-- ----------------------------
INSERT INTO `custom_save_talents` VALUES (448, 19419, 1);
INSERT INTO `custom_save_talents` VALUES (448, 19423, 1);
INSERT INTO `custom_save_talents` VALUES (448, 19431, 1);
INSERT INTO `custom_save_talents` VALUES (448, 19434, 1);
INSERT INTO `custom_save_talents` VALUES (448, 19456, 1);
INSERT INTO `custom_save_talents` VALUES (448, 19466, 1);
INSERT INTO `custom_save_talents` VALUES (448, 19490, 1);
INSERT INTO `custom_save_talents` VALUES (448, 19506, 1);
INSERT INTO `custom_save_talents` VALUES (448, 19556, 1);
INSERT INTO `custom_save_talents` VALUES (448, 19584, 1);
INSERT INTO `custom_save_talents` VALUES (448, 23989, 1);
INSERT INTO `custom_save_talents` VALUES (448, 24691, 1);
INSERT INTO `custom_save_talents` VALUES (448, 35030, 1);
INSERT INTO `custom_save_talents` VALUES (448, 35102, 1);
INSERT INTO `custom_save_talents` VALUES (448, 53622, 1);

SET FOREIGN_KEY_CHECKS = 1;
