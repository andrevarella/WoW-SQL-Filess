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

 Date: 07/12/2023 22:02:18
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for custom_druid_form_display
-- ----------------------------
DROP TABLE IF EXISTS `custom_druid_form_display`;
CREATE TABLE `custom_druid_form_display`  (
  `player_guid` int NOT NULL,
  `DisplayCatForm` int NULL DEFAULT NULL,
  `DisplayBearForm` int NULL DEFAULT NULL,
  `DisplayTravelForm` int NULL DEFAULT NULL,
  `DisplayMoonkinForm` int NULL DEFAULT NULL,
  `DisplayAquaticForm` int NULL DEFAULT NULL,
  `DisplayTreeForm` int NULL DEFAULT NULL,
  `DisplayFlightForm` int NULL DEFAULT NULL,
  `DisplayGhostWolfForm` int NULL DEFAULT NULL,
  PRIMARY KEY (`player_guid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of custom_druid_form_display
-- ----------------------------

SET FOREIGN_KEY_CHECKS = 1;
