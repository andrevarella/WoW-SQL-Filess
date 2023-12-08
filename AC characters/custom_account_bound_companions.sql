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

 Date: 07/12/2023 21:59:36
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for custom_account_bound_companions
-- ----------------------------
DROP TABLE IF EXISTS `custom_account_bound_companions`;
CREATE TABLE `custom_account_bound_companions`  (
  `account_id` int UNSIGNED NOT NULL,
  `spell_id` mediumint UNSIGNED NOT NULL,
  `allowable_race` int NOT NULL,
  `comment` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`account_id`, `spell_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of custom_account_bound_companions
-- ----------------------------

SET FOREIGN_KEY_CHECKS = 1;
