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

 Date: 31/03/2023 18:30:17
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for mod_morphsummon_felguard_weapon
-- ----------------------------
DROP TABLE IF EXISTS `mod_morphsummon_felguard_weapon`;
CREATE TABLE `mod_morphsummon_felguard_weapon`  (
  `PlayerGUIDLow` int(10) UNSIGNED NOT NULL,
  `FelguardItemID` int(10) UNSIGNED NOT NULL COMMENT 'Item ID for Felguard virtual item slot 0',
  PRIMARY KEY (`PlayerGUIDLow`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'mod-morphsummon; used for custom Felguard weapons' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of mod_morphsummon_felguard_weapon
-- ----------------------------

SET FOREIGN_KEY_CHECKS = 1;
