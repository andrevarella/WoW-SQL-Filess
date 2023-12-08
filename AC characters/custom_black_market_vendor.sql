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

 Date: 07/12/2023 22:00:04
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for custom_black_market_vendor
-- ----------------------------
DROP TABLE IF EXISTS `custom_black_market_vendor`;
CREATE TABLE `custom_black_market_vendor`  (
  `item` int UNSIGNED NOT NULL,
  `count` int UNSIGNED NOT NULL,
  `incrtime` int UNSIGNED NOT NULL,
  `extended` int UNSIGNED NOT NULL,
  `comment` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of custom_black_market_vendor
-- ----------------------------
INSERT INTO `custom_black_market_vendor` VALUES (10050, 1, 9000, 0, 'bag');
INSERT INTO `custom_black_market_vendor` VALUES (43951, 1, 9000, 0, 'bag');
INSERT INTO `custom_black_market_vendor` VALUES (43345, 1, 9000, 0, 'bag');
INSERT INTO `custom_black_market_vendor` VALUES (45120, 1, 9000, 0, 'bag');
INSERT INTO `custom_black_market_vendor` VALUES (6948, 1, 9000, 0, 'bag');
INSERT INTO `custom_black_market_vendor` VALUES (70003, 1, 9000, 0, 'bag');
INSERT INTO `custom_black_market_vendor` VALUES (22416, 1, 9000, 0, 'bag');
INSERT INTO `custom_black_market_vendor` VALUES (22417, 1, 9000, 0, 'bag');
INSERT INTO `custom_black_market_vendor` VALUES (22418, 1, 9000, 0, 'bag');
INSERT INTO `custom_black_market_vendor` VALUES (22419, 1, 9000, 0, 'bag');
INSERT INTO `custom_black_market_vendor` VALUES (22420, 1, 9000, 0, 'bag');

SET FOREIGN_KEY_CHECKS = 1;
