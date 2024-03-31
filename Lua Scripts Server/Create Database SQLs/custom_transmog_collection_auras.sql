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

 Date: 31/03/2024 00:26:17
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for custom_transmog_collection_auras
-- ----------------------------
DROP TABLE IF EXISTS `custom_transmog_collection_auras`;
CREATE TABLE `custom_transmog_collection_auras`  (
  `itemguid` int NOT NULL,
  `itemslot` int NULL DEFAULT NULL,
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
INSERT INTO `custom_transmog_collection_auras` VALUES (71857, 3, 'Mantle of Crimson Blades', 82011, 82011, 82011, 82011, 82011, 82011, 82011, 82011, 82011, 82011);
INSERT INTO `custom_transmog_collection_auras` VALUES (72048, 3, 'Discordant Wings of the Ascended', 82000, 82000, 82000, 82000, 82000, 82000, 82000, 82000, 82000, 82000);
INSERT INTO `custom_transmog_collection_auras` VALUES (72052, 3, 'Halo of the Harmonious', 82004, 82004, 82004, 82004, 82004, 82004, 82004, 82004, 82004, 82004);
INSERT INTO `custom_transmog_collection_auras` VALUES (72074, 3, 'Diablo Wings Red', 82029, 82078, 82029, 82029, 82029, 82029, 82029, 82029, 82029, 82029);
INSERT INTO `custom_transmog_collection_auras` VALUES (72075, 3, 'Blazing Wings', 82030, 82030, 82030, 82030, 82030, 82030, 82030, 82030, 82030, 82030);
INSERT INTO `custom_transmog_collection_auras` VALUES (72080, 3, 'Black Dragonscale Backpack', 82034, 82034, 82034, 82034, 82034, 82034, 82034, 82034, 82034, 82034);
INSERT INTO `custom_transmog_collection_auras` VALUES (80792, 3, 'Ren\'Dorei Wings', 82085, 82085, 82085, 82085, 82085, 82085, 82085, 82085, 82085, 82085);

SET FOREIGN_KEY_CHECKS = 1;
