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

 Date: 07/12/2023 22:01:57
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for custom_bonusxp
-- ----------------------------
DROP TABLE IF EXISTS `custom_bonusxp`;
CREATE TABLE `custom_bonusxp`  (
  `guid` int UNSIGNED NOT NULL,
  `bonus_enabled` tinyint(1) NOT NULL,
  PRIMARY KEY (`guid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of custom_bonusxp
-- ----------------------------

SET FOREIGN_KEY_CHECKS = 1;
