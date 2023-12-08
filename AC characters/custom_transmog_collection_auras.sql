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

 Date: 07/12/2023 22:03:10
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for custom_transmog_collection_auras
-- ----------------------------
DROP TABLE IF EXISTS `custom_transmog_collection_auras`;
CREATE TABLE `custom_transmog_collection_auras`  (
  `itemguid` int NOT NULL,
  `comment` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `humanAura` int NOT NULL,
  `dwarfAura` int NOT NULL,
  `nightElfAura` int NOT NULL,
  `gnomeAura` int NOT NULL,
  `draeneiAura` int NOT NULL,
  `OrcAura` int NOT NULL,
  `UndeadAura` int NOT NULL,
  `taurenAura` int NOT NULL,
  `trollAura` int NOT NULL,
  `bloodelfAura` int NOT NULL,
  PRIMARY KEY (`itemguid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of custom_transmog_collection_auras
-- ----------------------------
INSERT INTO `custom_transmog_collection_auras` VALUES (72074, 'Diablo Wings Red', 82029, 82078, 82029, 82029, 82029, 82029, 82029, 82029, 82029, 82029);

SET FOREIGN_KEY_CHECKS = 1;
