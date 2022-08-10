/*
 Navicat Premium Data Transfer

 Source Server         : acore
 Source Server Type    : MySQL
 Source Server Version : 50737
 Source Host           : localhost:3306
 Source Schema         : acore_characters

 Target Server Type    : MySQL
 Target Server Version : 50737
 File Encoding         : 65001

 Date: 22/07/2022 00:42:07
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for custom_item_enchant_visuals
-- ----------------------------
DROP TABLE IF EXISTS `custom_item_enchant_visuals`;
CREATE TABLE `custom_item_enchant_visuals`  (
  `iguid` int(10) UNSIGNED NOT NULL COMMENT 'item DB guid',
  `display` int(10) UNSIGNED NOT NULL COMMENT 'enchantID',
  PRIMARY KEY (`iguid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of custom_item_enchant_visuals
-- ----------------------------
INSERT INTO `custom_item_enchant_visuals` VALUES (365, 4013);

SET FOREIGN_KEY_CHECKS = 1;
