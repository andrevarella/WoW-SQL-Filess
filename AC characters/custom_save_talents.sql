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

 Date: 07/12/2023 22:02:57
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
  `BuildSlot` int UNSIGNED NOT NULL,
  `BuildName` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of custom_save_talents
-- ----------------------------

SET FOREIGN_KEY_CHECKS = 1;
