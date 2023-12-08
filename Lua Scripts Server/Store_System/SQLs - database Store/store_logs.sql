/*
 Navicat Premium Data Transfer

 Source Server         : acore
 Source Server Type    : MySQL
 Source Server Version : 80034 (8.0.34)
 Source Host           : localhost:3306
 Source Schema         : store

 Target Server Type    : MySQL
 Target Server Version : 80034 (8.0.34)
 File Encoding         : 65001

 Date: 07/12/2023 22:12:49
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for store_logs
-- ----------------------------
DROP TABLE IF EXISTS `store_logs`;
CREATE TABLE `store_logs`  (
  `account` int NULL DEFAULT NULL,
  `guid` int NULL DEFAULT NULL,
  `serviceId` int NULL DEFAULT NULL,
  `currencyId` int NULL DEFAULT NULL,
  `cost` int NULL DEFAULT NULL,
  `time` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of store_logs
-- ----------------------------

SET FOREIGN_KEY_CHECKS = 1;
