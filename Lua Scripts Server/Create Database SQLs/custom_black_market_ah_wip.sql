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

 Date: 31/03/2024 00:23:05
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for custom_black_market_ah_wip
-- ----------------------------
DROP TABLE IF EXISTS `custom_black_market_ah_wip`;
CREATE TABLE `custom_black_market_ah_wip`  (
  `itemID` int NOT NULL,
  `Buyoutprice` int NOT NULL,
  `startBid` int NOT NULL,
  `comment` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`itemID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of custom_black_market_ah_wip
-- ----------------------------

SET FOREIGN_KEY_CHECKS = 1;
