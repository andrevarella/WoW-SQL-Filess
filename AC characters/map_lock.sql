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

 Date: 07/12/2023 22:04:02
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for map_lock
-- ----------------------------
DROP TABLE IF EXISTS `map_lock`;
CREATE TABLE `map_lock`  (
  `id` tinyint UNSIGNED NOT NULL AUTO_INCREMENT,
  `mapId` smallint UNSIGNED NULL DEFAULT NULL,
  `zoneID` smallint UNSIGNED NULL DEFAULT NULL,
  `comment` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `mapId`(`mapId`) USING BTREE,
  UNIQUE INDEX `zoneID`(`zoneID`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of map_lock
-- ----------------------------

SET FOREIGN_KEY_CHECKS = 1;
