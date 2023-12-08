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

 Date: 07/12/2023 22:02:26
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for custom_item_enchant_visuals
-- ----------------------------
DROP TABLE IF EXISTS `custom_item_enchant_visuals`;
CREATE TABLE `custom_item_enchant_visuals`  (
  `iguid` int UNSIGNED NOT NULL COMMENT 'item DB guid',
  `display` int UNSIGNED NOT NULL COMMENT 'enchantID',
  PRIMARY KEY (`iguid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of custom_item_enchant_visuals
-- ----------------------------

SET FOREIGN_KEY_CHECKS = 1;
