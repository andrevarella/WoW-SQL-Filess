/*
 Navicat Premium Data Transfer

 Source Server         : acore
 Source Server Type    : MySQL
 Source Server Version : 80034 (8.0.34)
 Source Host           : localhost:3306
 Source Schema         : acore_world

 Target Server Type    : MySQL
 Target Server Version : 80034 (8.0.34)
 File Encoding         : 65001

 Date: 22/10/2023 22:20:55
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for playercreateinfo
-- ----------------------------
DROP TABLE IF EXISTS `playercreateinfo`;
CREATE TABLE `playercreateinfo`  (
  `race` tinyint UNSIGNED NOT NULL DEFAULT 0,
  `class` tinyint UNSIGNED NOT NULL DEFAULT 0,
  `map` smallint UNSIGNED NOT NULL DEFAULT 0,
  `zone` int UNSIGNED NOT NULL DEFAULT 0,
  `position_x` float NOT NULL DEFAULT 0,
  `position_y` float NOT NULL DEFAULT 0,
  `position_z` float NOT NULL DEFAULT 0,
  `orientation` float NOT NULL DEFAULT 0,
  PRIMARY KEY (`race`, `class`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of playercreateinfo
-- ----------------------------
INSERT INTO `playercreateinfo` VALUES (1, 1, 0, 12, -8949.95, -132.493, 83.5312, 0);
INSERT INTO `playercreateinfo` VALUES (1, 2, 0, 12, -8949.95, -132.493, 83.5312, 0);
INSERT INTO `playercreateinfo` VALUES (1, 4, 0, 12, -8949.95, -132.493, 83.5312, 0);
INSERT INTO `playercreateinfo` VALUES (1, 5, 0, 12, -8949.95, -132.493, 83.5312, 0);
INSERT INTO `playercreateinfo` VALUES (1, 6, 609, 4298, 2355.84, -5664.77, 426.028, 3.65997);
INSERT INTO `playercreateinfo` VALUES (1, 8, 0, 12, -8949.95, -132.493, 83.5312, 0);
INSERT INTO `playercreateinfo` VALUES (1, 9, 0, 12, -8949.95, -132.493, 83.5312, 0);
INSERT INTO `playercreateinfo` VALUES (2, 1, 1, 14, -618.518, -4251.67, 38.718, 0);
INSERT INTO `playercreateinfo` VALUES (2, 3, 1, 14, -618.518, -4251.67, 38.718, 0);
INSERT INTO `playercreateinfo` VALUES (2, 4, 1, 14, -618.518, -4251.67, 38.718, 0);
INSERT INTO `playercreateinfo` VALUES (2, 6, 609, 4298, 2358.44, -5666.9, 426.023, 3.65997);
INSERT INTO `playercreateinfo` VALUES (2, 7, 1, 14, -618.518, -4251.67, 38.718, 0);
INSERT INTO `playercreateinfo` VALUES (2, 9, 1, 14, -618.518, -4251.67, 38.718, 0);
INSERT INTO `playercreateinfo` VALUES (3, 1, 0, 1, -6240.32, 331.033, 382.758, 6.17716);
INSERT INTO `playercreateinfo` VALUES (3, 2, 0, 1, -6240.32, 331.033, 382.758, 6.17716);
INSERT INTO `playercreateinfo` VALUES (3, 3, 0, 1, -6240.32, 331.033, 382.758, 6.17716);
INSERT INTO `playercreateinfo` VALUES (3, 4, 0, 1, -6240.32, 331.033, 382.758, 6.17716);
INSERT INTO `playercreateinfo` VALUES (3, 5, 0, 1, -6240.32, 331.033, 382.758, 6.17716);
INSERT INTO `playercreateinfo` VALUES (3, 6, 609, 4298, 2358.44, -5666.9, 426.023, 3.65997);
INSERT INTO `playercreateinfo` VALUES (4, 1, 1, 141, 10311.3, 832.463, 1326.41, 5.69632);
INSERT INTO `playercreateinfo` VALUES (4, 3, 1, 141, 10311.3, 832.463, 1326.41, 5.69632);
INSERT INTO `playercreateinfo` VALUES (4, 4, 1, 141, 10311.3, 832.463, 1326.41, 5.69632);
INSERT INTO `playercreateinfo` VALUES (4, 5, 1, 141, 10311.3, 832.463, 1326.41, 5.69632);
INSERT INTO `playercreateinfo` VALUES (4, 6, 609, 4298, 2356.21, -5662.21, 426.026, 3.65997);
INSERT INTO `playercreateinfo` VALUES (4, 8, 1, 141, 10311.3, 832.463, 1326.41, 5.69632);
INSERT INTO `playercreateinfo` VALUES (4, 11, 1, 141, 10311.3, 832.463, 1326.41, 5.69632);
INSERT INTO `playercreateinfo` VALUES (5, 1, 0, 85, 1676.71, 1678.31, 121.67, 2.70526);
INSERT INTO `playercreateinfo` VALUES (5, 3, 0, 85, 1676.71, 1678.31, 121.67, 2.70526);
INSERT INTO `playercreateinfo` VALUES (5, 4, 0, 85, 1676.71, 1678.31, 121.67, 2.70526);
INSERT INTO `playercreateinfo` VALUES (5, 5, 0, 85, 1676.71, 1678.31, 121.67, 2.70526);
INSERT INTO `playercreateinfo` VALUES (5, 6, 609, 4298, 2356.21, -5662.21, 426.026, 3.65997);
INSERT INTO `playercreateinfo` VALUES (5, 8, 0, 85, 1676.71, 1678.31, 121.67, 2.70526);
INSERT INTO `playercreateinfo` VALUES (5, 9, 0, 85, 1676.71, 1678.31, 121.67, 2.70526);
INSERT INTO `playercreateinfo` VALUES (6, 1, 1, 215, -2917.58, -257.98, 52.9968, 0);
INSERT INTO `playercreateinfo` VALUES (6, 2, 1, 215, -2917.58, -257.98, 52.9968, 0);
INSERT INTO `playercreateinfo` VALUES (6, 3, 1, 215, -2917.58, -257.98, 52.9968, 0);
INSERT INTO `playercreateinfo` VALUES (6, 6, 609, 4298, 2358.17, -5663.21, 426.027, 3.65997);
INSERT INTO `playercreateinfo` VALUES (6, 7, 1, 215, -2917.58, -257.98, 52.9968, 0);
INSERT INTO `playercreateinfo` VALUES (6, 11, 1, 215, -2917.58, -257.98, 52.9968, 0);
INSERT INTO `playercreateinfo` VALUES (7, 1, 0, 1, -6240.32, 331.033, 382.758, 0);
INSERT INTO `playercreateinfo` VALUES (7, 4, 0, 1, -6240, 331, 383, 0);
INSERT INTO `playercreateinfo` VALUES (7, 5, 0, 1, -6240.32, 331.033, 382.758, 0);
INSERT INTO `playercreateinfo` VALUES (7, 6, 609, 4298, 2355.05, -5661.7, 426.026, 3.65997);
INSERT INTO `playercreateinfo` VALUES (7, 8, 0, 1, -6240, 331, 383, 0);
INSERT INTO `playercreateinfo` VALUES (7, 9, 0, 1, -6240, 331, 383, 0);
INSERT INTO `playercreateinfo` VALUES (8, 1, 1, 14, -618.518, -4251.67, 38.718, 0);
INSERT INTO `playercreateinfo` VALUES (8, 3, 1, 14, -618.518, -4251.67, 38.718, 0);
INSERT INTO `playercreateinfo` VALUES (8, 4, 1, 14, -618.518, -4251.67, 38.718, 0);
INSERT INTO `playercreateinfo` VALUES (8, 5, 1, 14, -618.518, -4251.67, 38.718, 0);
INSERT INTO `playercreateinfo` VALUES (8, 6, 609, 4298, 2355.05, -5661.7, 426.026, 3.65997);
INSERT INTO `playercreateinfo` VALUES (8, 7, 1, 14, -618.518, -4251.67, 38.718, 0);
INSERT INTO `playercreateinfo` VALUES (8, 8, 1, 14, -618.518, -4251.67, 38.718, 0);
INSERT INTO `playercreateinfo` VALUES (8, 9, 1, 14, -618.518, -4251.67, 38.718, 0);
INSERT INTO `playercreateinfo` VALUES (8, 11, 1, 14, -618.518, -4251.67, 38.718, 0);
INSERT INTO `playercreateinfo` VALUES (10, 2, 530, 3431, 10349.6, -6357.29, 33.4026, 5.31605);
INSERT INTO `playercreateinfo` VALUES (10, 3, 530, 3431, 10349.6, -6357.29, 33.4026, 5.31605);
INSERT INTO `playercreateinfo` VALUES (10, 4, 530, 3431, 10349.6, -6357.29, 33.4026, 5.31605);
INSERT INTO `playercreateinfo` VALUES (10, 5, 530, 3431, 10349.6, -6357.29, 33.4026, 5.31605);
INSERT INTO `playercreateinfo` VALUES (10, 6, 609, 4298, 2355.84, -5664.77, 426.028, 3.65997);
INSERT INTO `playercreateinfo` VALUES (10, 8, 530, 3431, 10349.6, -6357.29, 33.4026, 5.31605);
INSERT INTO `playercreateinfo` VALUES (10, 9, 530, 3431, 10349.6, -6357.29, 33.4026, 5.31605);
INSERT INTO `playercreateinfo` VALUES (11, 1, 530, 3526, -3961.64, -13931.2, 100.615, 2.08364);
INSERT INTO `playercreateinfo` VALUES (11, 2, 530, 3526, -3961.64, -13931.2, 100.615, 2.08364);
INSERT INTO `playercreateinfo` VALUES (11, 3, 530, 3526, -3961.64, -13931.2, 100.615, 2.08364);
INSERT INTO `playercreateinfo` VALUES (11, 5, 530, 3526, -3961.64, -13931.2, 100.615, 2.08364);
INSERT INTO `playercreateinfo` VALUES (11, 6, 609, 4298, 2358.17, -5663.21, 426.027, 3.65997);
INSERT INTO `playercreateinfo` VALUES (11, 7, 530, 3526, -3961.64, -13931.2, 100.615, 2.08364);
INSERT INTO `playercreateinfo` VALUES (11, 8, 530, 3526, -3961.64, -13931.2, 100.615, 2.08364);

SET FOREIGN_KEY_CHECKS = 1;
