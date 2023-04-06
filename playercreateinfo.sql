/*
 Navicat Premium Data Transfer

 Source Server         : acore
 Source Server Type    : MySQL
 Source Server Version : 50739
 Source Host           : localhost:3306
 Source Schema         : 1acore_world

 Target Server Type    : MySQL
 Target Server Version : 50739
 File Encoding         : 65001

 Date: 06/04/2023 16:26:39
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for playercreateinfo
-- ----------------------------
DROP TABLE IF EXISTS `playercreateinfo`;
CREATE TABLE `playercreateinfo`  (
  `race` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `class` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `map` smallint(5) UNSIGNED NOT NULL DEFAULT 0,
  `zone` mediumint(8) UNSIGNED NOT NULL DEFAULT 0,
  `position_x` float NOT NULL DEFAULT 0,
  `position_y` float NOT NULL DEFAULT 0,
  `position_z` float NOT NULL DEFAULT 0,
  `orientation` float NOT NULL DEFAULT 0,
  PRIMARY KEY (`race`, `class`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = FIXED;

-- ----------------------------
-- Records of playercreateinfo
-- ----------------------------
INSERT INTO `playercreateinfo` VALUES (11, 8, 571, 394, 2787.87, -2732.06, 89.6718, 0.410484);
INSERT INTO `playercreateinfo` VALUES (11, 7, 571, 394, 2787.87, -2732.06, 89.6718, 0.410484);
INSERT INTO `playercreateinfo` VALUES (11, 6, 609, 4298, 2358.17, -5663.21, 426.027, 3.65997);
INSERT INTO `playercreateinfo` VALUES (11, 5, 571, 394, 2787.87, -2732.06, 89.6718, 0.410484);
INSERT INTO `playercreateinfo` VALUES (11, 3, 571, 394, 2787.87, -2732.06, 89.6718, 0.410484);
INSERT INTO `playercreateinfo` VALUES (11, 2, 571, 394, 2787.87, -2732.06, 89.6718, 0.410484);
INSERT INTO `playercreateinfo` VALUES (11, 1, 571, 394, 2787.87, -2732.06, 89.6718, 0.410484);
INSERT INTO `playercreateinfo` VALUES (10, 9, 571, 394, 2787.87, -2732.06, 89.6718, 0.410484);
INSERT INTO `playercreateinfo` VALUES (10, 8, 571, 394, 2787.87, -2732.06, 89.6718, 0.410484);
INSERT INTO `playercreateinfo` VALUES (10, 6, 609, 4298, 2355.84, -5664.77, 426.028, 3.65997);
INSERT INTO `playercreateinfo` VALUES (10, 5, 571, 394, 2787.87, -2732.06, 89.6718, 0.410484);
INSERT INTO `playercreateinfo` VALUES (10, 4, 571, 394, 2787.87, -2732.06, 89.6718, 0.410484);
INSERT INTO `playercreateinfo` VALUES (10, 3, 571, 394, 2787.87, -2732.06, 89.6718, 0.410484);
INSERT INTO `playercreateinfo` VALUES (10, 2, 571, 394, 2787.87, -2732.06, 89.6718, 0.410484);
INSERT INTO `playercreateinfo` VALUES (8, 8, 571, 394, 2787.87, -2732.06, 89.6718, 0.410484);
INSERT INTO `playercreateinfo` VALUES (8, 7, 571, 394, 2787.87, -2732.06, 89.6718, 0.410484);
INSERT INTO `playercreateinfo` VALUES (8, 6, 609, 4298, 2355.05, -5661.7, 426.026, 3.65997);
INSERT INTO `playercreateinfo` VALUES (8, 5, 571, 394, 2787.87, -2732.06, 89.6718, 0.410484);
INSERT INTO `playercreateinfo` VALUES (8, 4, 571, 394, 2787.87, -2732.06, 89.6718, 0.410484);
INSERT INTO `playercreateinfo` VALUES (8, 3, 571, 394, 2787.87, -2732.06, 89.6718, 0.410484);
INSERT INTO `playercreateinfo` VALUES (8, 1, 571, 394, 2787.87, -2732.06, 89.6718, 0.410484);
INSERT INTO `playercreateinfo` VALUES (7, 9, 571, 394, 2787.87, -2732.06, 89.6718, 0.410484);
INSERT INTO `playercreateinfo` VALUES (7, 8, 571, 394, 2787.87, -2732.06, 89.6718, 0.410484);
INSERT INTO `playercreateinfo` VALUES (7, 6, 609, 4298, 2355.05, -5661.7, 426.026, 3.65997);
INSERT INTO `playercreateinfo` VALUES (7, 4, 571, 394, 2787.87, -2732.06, 89.6718, 0.410484);
INSERT INTO `playercreateinfo` VALUES (7, 1, 571, 394, 2787.87, -2732.06, 89.6718, 0.410484);
INSERT INTO `playercreateinfo` VALUES (6, 11, 571, 394, 2787.87, -2732.06, 89.6718, 0.410484);
INSERT INTO `playercreateinfo` VALUES (6, 7, 571, 394, 2787.87, -2732.06, 89.6718, 0.410484);
INSERT INTO `playercreateinfo` VALUES (6, 6, 609, 4298, 2358.17, -5663.21, 426.027, 3.65997);
INSERT INTO `playercreateinfo` VALUES (6, 3, 571, 394, 2787.87, -2732.06, 89.6718, 0.410484);
INSERT INTO `playercreateinfo` VALUES (6, 1, 571, 394, 2787.87, -2732.06, 89.6718, 0.410484);
INSERT INTO `playercreateinfo` VALUES (5, 9, 571, 394, 2787.87, -2732.06, 89.6718, 0.410484);
INSERT INTO `playercreateinfo` VALUES (5, 8, 571, 394, 2787.87, -2732.06, 89.6718, 0.410484);
INSERT INTO `playercreateinfo` VALUES (5, 6, 609, 4298, 2356.21, -5662.21, 426.026, 3.65997);
INSERT INTO `playercreateinfo` VALUES (5, 5, 571, 394, 2787.87, -2732.06, 89.6718, 0.410484);
INSERT INTO `playercreateinfo` VALUES (5, 4, 571, 394, 2787.87, -2732.06, 89.6718, 0.410484);
INSERT INTO `playercreateinfo` VALUES (5, 1, 571, 394, 2787.87, -2732.06, 89.6718, 0.410484);
INSERT INTO `playercreateinfo` VALUES (4, 11, 571, 394, 2787.87, -2732.06, 89.6718, 0.410484);
INSERT INTO `playercreateinfo` VALUES (4, 6, 609, 4298, 2356.21, -5662.21, 426.026, 3.65997);
INSERT INTO `playercreateinfo` VALUES (4, 5, 571, 394, 2787.87, -2732.06, 89.6718, 0.410484);
INSERT INTO `playercreateinfo` VALUES (4, 4, 571, 394, 2787.87, -2732.06, 89.6718, 0.410484);
INSERT INTO `playercreateinfo` VALUES (4, 3, 571, 394, 2787.87, -2732.06, 89.6718, 0.410484);
INSERT INTO `playercreateinfo` VALUES (4, 1, 571, 394, 2787.87, -2732.06, 89.6718, 0.410484);
INSERT INTO `playercreateinfo` VALUES (3, 6, 609, 4298, 2358.44, -5666.9, 426.023, 3.65997);
INSERT INTO `playercreateinfo` VALUES (3, 5, 571, 394, 2787.87, -2732.06, 89.6718, 0.410484);
INSERT INTO `playercreateinfo` VALUES (3, 4, 571, 394, 2787.87, -2732.06, 89.6718, 0.410484);
INSERT INTO `playercreateinfo` VALUES (3, 3, 571, 394, 2787.87, -2732.06, 89.6718, 0.410484);
INSERT INTO `playercreateinfo` VALUES (3, 2, 571, 394, 2787.87, -2732.06, 89.6718, 0.410484);
INSERT INTO `playercreateinfo` VALUES (3, 1, 571, 394, 2787.87, -2732.06, 89.6718, 0.410484);
INSERT INTO `playercreateinfo` VALUES (2, 9, 571, 394, 2787.87, -2732.06, 89.6718, 0.410484);
INSERT INTO `playercreateinfo` VALUES (2, 7, 571, 394, 2787.87, -2732.06, 89.6718, 0.410484);
INSERT INTO `playercreateinfo` VALUES (2, 6, 609, 4298, 2358.44, -5666.9, 426.023, 3.65997);
INSERT INTO `playercreateinfo` VALUES (2, 4, 571, 394, 2787.87, -2732.06, 89.6718, 0.410484);
INSERT INTO `playercreateinfo` VALUES (2, 3, 571, 394, 2787.87, -2732.06, 89.6718, 0.410484);
INSERT INTO `playercreateinfo` VALUES (2, 1, 571, 394, 2787.87, -2732.06, 89.6718, 0.410484);
INSERT INTO `playercreateinfo` VALUES (1, 9, 571, 394, 2787.87, -2732.06, 89.6718, 0.410484);
INSERT INTO `playercreateinfo` VALUES (1, 8, 571, 394, 2787.87, -2732.06, 89.6718, 0.410484);
INSERT INTO `playercreateinfo` VALUES (1, 6, 609, 4298, 2355.84, -5664.77, 426.028, 3.65997);
INSERT INTO `playercreateinfo` VALUES (1, 5, 571, 394, 2787.87, -2732.06, 89.6718, 0.410484);
INSERT INTO `playercreateinfo` VALUES (1, 4, 571, 394, 2787.87, -2732.06, 89.6718, 0.410484);
INSERT INTO `playercreateinfo` VALUES (1, 2, 571, 394, 2787.87, -2732.06, 89.6718, 0.410484);
INSERT INTO `playercreateinfo` VALUES (1, 1, 571, 394, 2787.87, -2732.06, 89.6718, 0.410484);
INSERT INTO `playercreateinfo` VALUES (4, 8, 571, 394, 2787.87, -2732.06, 89.6718, 0.410484);
INSERT INTO `playercreateinfo` VALUES (5, 3, 571, 394, 2787.87, -2732.06, 89.6718, 0.410484);
INSERT INTO `playercreateinfo` VALUES (8, 9, 571, 394, 2787.87, -2732.06, 89.6718, 0.410484);
INSERT INTO `playercreateinfo` VALUES (6, 2, 571, 394, 2787.87, -2732.06, 89.6718, 0.410484);
INSERT INTO `playercreateinfo` VALUES (7, 5, 571, 394, 2787.87, -2732.06, 89.6718, 0.410484);

SET FOREIGN_KEY_CHECKS = 1;
