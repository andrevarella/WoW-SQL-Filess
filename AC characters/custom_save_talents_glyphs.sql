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

 Date: 07/12/2023 22:03:01
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for custom_save_talents_glyphs
-- ----------------------------
DROP TABLE IF EXISTS `custom_save_talents_glyphs`;
CREATE TABLE `custom_save_talents_glyphs`  (
  `guid` int UNSIGNED NOT NULL,
  `glyph1` int UNSIGNED NOT NULL,
  `glyph2` int UNSIGNED NOT NULL,
  `glyph3` int UNSIGNED NOT NULL,
  `glyph4` int UNSIGNED NOT NULL,
  `glyph5` int UNSIGNED NOT NULL,
  `glyph6` int UNSIGNED NOT NULL,
  `BuildSlot` int UNSIGNED NOT NULL,
  PRIMARY KEY (`guid`, `BuildSlot`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of custom_save_talents_glyphs
-- ----------------------------

SET FOREIGN_KEY_CHECKS = 1;
