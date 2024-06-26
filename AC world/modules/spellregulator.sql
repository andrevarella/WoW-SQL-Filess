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

 Date: 07/12/2023 20:45:23
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for spellregulator
-- ----------------------------
DROP TABLE IF EXISTS `spellregulator`;
CREATE TABLE `spellregulator`  (
  `spellId` int UNSIGNED NOT NULL,
  `percentage` float NOT NULL DEFAULT 100,
  `nome da spell` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`spellId`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of spellregulator
-- ----------------------------
INSERT INTO `spellregulator` VALUES (11111, 100, 'shadowflame');
INSERT INTO `spellregulator` VALUES (11112, 100, 'Searing Pain');
INSERT INTO `spellregulator` VALUES (11113, 100, 'Avengers Shield');
INSERT INTO `spellregulator` VALUES (11114, 100, 'Hammer');
INSERT INTO `spellregulator` VALUES (11115, 100, 'UA');
INSERT INTO `spellregulator` VALUES (11116, 100, 'Chaos Bolt');
INSERT INTO `spellregulator` VALUES (11117, 100, 'Lava Burst');
INSERT INTO `spellregulator` VALUES (26654, 50, 'Sweeping Strikes (dmg bizarro)');
INSERT INTO `spellregulator` VALUES (31117, 136.5, 'Dispel UA R5 (scalling diminuído SP 1,8 > 1,3)');
INSERT INTO `spellregulator` VALUES (51963, 183, 'Ebon Gargoyle Coeficiente nerfado (dmg tava baixo)');
INSERT INTO `spellregulator` VALUES (60103, 165, 'Lava Lash');
INSERT INTO `spellregulator` VALUES (83245, 50, 'Lava Burst Custom (Proc on Proc)');

SET FOREIGN_KEY_CHECKS = 1;
