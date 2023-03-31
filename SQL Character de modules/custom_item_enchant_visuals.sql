/*
 Navicat Premium Data Transfer

 Source Server         : acore
 Source Server Type    : MySQL
 Source Server Version : 50739
 Source Host           : localhost:3306
 Source Schema         : 1acore_characters

 Target Server Type    : MySQL
 Target Server Version : 50739
 File Encoding         : 65001

 Date: 26/08/2022 06:02:26
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

SET FOREIGN_KEY_CHECKS = 1;
