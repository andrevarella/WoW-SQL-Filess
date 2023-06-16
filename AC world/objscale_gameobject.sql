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

 Date: 31/03/2023 18:16:26
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for objscale_gameobject
-- ----------------------------
DROP TABLE IF EXISTS `objscale_gameobject`;
CREATE TABLE `objscale_gameobject`  (
  `guid` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Global Unique Identifier',
  `scale` float NULL DEFAULT NULL,
  PRIMARY KEY (`guid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of objscale_gameobject
-- ----------------------------
INSERT INTO `objscale_gameobject` VALUES (2137906, 0.88);
INSERT INTO `objscale_gameobject` VALUES (2137909, 0.75);
INSERT INTO `objscale_gameobject` VALUES (2137912, 0.8);
INSERT INTO `objscale_gameobject` VALUES (2137916, 1.43);
INSERT INTO `objscale_gameobject` VALUES (2137917, 1.275);

SET FOREIGN_KEY_CHECKS = 1;
