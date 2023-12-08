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

 Date: 07/12/2023 22:01:51
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for custom_black_market_logs
-- ----------------------------
DROP TABLE IF EXISTS `custom_black_market_logs`;
CREATE TABLE `custom_black_market_logs`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `data` datetime NULL DEFAULT NULL,
  `itemid` int NULL DEFAULT NULL,
  `bid` int NULL DEFAULT NULL,
  `playername` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `playerguid` int NULL DEFAULT NULL,
  `received` int NULL DEFAULT 0,
  `dayspassed` int NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `data`(`data` ASC, `itemid` ASC, `playerguid` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 569 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of custom_black_market_logs
-- ----------------------------

SET FOREIGN_KEY_CHECKS = 1;
