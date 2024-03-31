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

 Date: 31/03/2024 00:22:32
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for custom_arena_log
-- ----------------------------
DROP TABLE IF EXISTS `custom_arena_log`;
CREATE TABLE `custom_arena_log`  (
  `fight_id` int UNSIGNED NOT NULL,
  `account` int UNSIGNED NOT NULL,
  `IP` char(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `date` datetime NOT NULL,
  `arenatype` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `duration` int UNSIGNED NOT NULL,
  `playername` char(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `playerguid` int UNSIGNED NOT NULL,
  `resultado` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `teamwinnerID` int UNSIGNED NOT NULL,
  `teamloserID` int UNSIGNED NOT NULL,
  `teamwinner` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `teamloser` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `personalRating` int UNSIGNED NOT NULL,
  `personalMMR` int UNSIGNED NOT NULL,
  `damage` int UNSIGNED NOT NULL,
  `heal` int UNSIGNED NOT NULL,
  `kblows` int UNSIGNED NOT NULL,
  `posmatch` tinyint UNSIGNED NOT NULL,
  PRIMARY KEY (`fight_id`, `posmatch`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of custom_arena_log
-- ----------------------------

SET FOREIGN_KEY_CHECKS = 1;
