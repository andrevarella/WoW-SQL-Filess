/*
 Navicat Premium Data Transfer

 Source Server         : 127.0.0.1
 Source Server Type    : MySQL
 Source Server Version : 80034 (8.0.34)
 Source Host           : localhost:3306
 Source Schema         : store

 Target Server Type    : MySQL
 Target Server Version : 80034 (8.0.34)
 File Encoding         : 65001

 Date: 19/09/2023 21:30:21
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
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of store_logs
-- ----------------------------
INSERT INTO `store_logs` VALUES (1, 1, 12, 1, 10, '2023-04-07 00:03:06');
INSERT INTO `store_logs` VALUES (1, 1, 12, 1, 5, '2023-04-07 00:04:23');
INSERT INTO `store_logs` VALUES (1, 1, 13, 1, 10, '2023-04-07 00:20:42');
INSERT INTO `store_logs` VALUES (1, 1, 8, 1, 30, '2023-04-07 00:25:36');
INSERT INTO `store_logs` VALUES (1, 1, 12, 2, 5, '2023-04-07 17:04:22');
INSERT INTO `store_logs` VALUES (1, 1, 12, 2, 5, '2023-04-07 17:07:47');
INSERT INTO `store_logs` VALUES (1, 1, 12, 2, 5, '2023-04-07 17:07:50');
INSERT INTO `store_logs` VALUES (1, 1, 12, 2, 5, '2023-04-07 17:10:04');
INSERT INTO `store_logs` VALUES (1, 1, 12, 2, 5, '2023-04-07 17:21:48');
INSERT INTO `store_logs` VALUES (1, 1, 12, 2, 5, '2023-04-07 17:22:01');
INSERT INTO `store_logs` VALUES (1, 1, 12, 2, 5, '2023-04-07 17:22:38');
INSERT INTO `store_logs` VALUES (1, 1, 12, 2, 5, '2023-04-07 17:23:45');
INSERT INTO `store_logs` VALUES (1, 1, 12, 2, 5, '2023-04-07 17:26:19');
INSERT INTO `store_logs` VALUES (1, 1, 13, 1, 10, '2023-04-07 22:14:35');
INSERT INTO `store_logs` VALUES (1, 1, 1, 1, 10, '2023-04-07 22:22:52');
INSERT INTO `store_logs` VALUES (1, 1, 1, 1, 10, '2023-04-07 22:24:07');
INSERT INTO `store_logs` VALUES (1, 1, 1, 1, 10, '2023-04-07 22:25:51');
INSERT INTO `store_logs` VALUES (1, 1, 4, 1, 5, '2023-04-07 22:35:36');
INSERT INTO `store_logs` VALUES (1, 1, 16, 1, 10, '2023-04-07 22:41:41');
INSERT INTO `store_logs` VALUES (1, 1, 16, 1, 10, '2023-04-07 22:44:49');
INSERT INTO `store_logs` VALUES (1, 1, 5, 1, 10, '2023-04-08 01:45:17');
INSERT INTO `store_logs` VALUES (1, 1, 1, 1, 10, '2023-04-08 16:50:20');
INSERT INTO `store_logs` VALUES (1, 1, 1, 1, 10, '2023-04-08 16:51:13');
INSERT INTO `store_logs` VALUES (1, 1, 12, 1, 5, '2023-04-08 16:52:20');
INSERT INTO `store_logs` VALUES (1, 1, 12, 1, 5, '2023-04-08 16:55:03');
INSERT INTO `store_logs` VALUES (1, 1, 12, 1, 5, '2023-04-08 19:23:33');
INSERT INTO `store_logs` VALUES (1, 1, 12, 1, 5, '2023-04-08 20:19:16');
INSERT INTO `store_logs` VALUES (1, 1, 1, 1, 10, '2023-04-08 23:02:07');
INSERT INTO `store_logs` VALUES (1, 1, 1, 2, 10, '2023-04-08 23:06:11');
INSERT INTO `store_logs` VALUES (1, 1, 5, 1, 10, '2023-04-08 23:34:41');
INSERT INTO `store_logs` VALUES (1, 1, 15, 1, 1, '2023-04-09 00:01:37');
INSERT INTO `store_logs` VALUES (1, 1, 18, 1, 50, '2023-04-09 00:29:32');
INSERT INTO `store_logs` VALUES (1, 1, 16, 1, 10, '2023-09-16 07:10:29');
INSERT INTO `store_logs` VALUES (1, 1, 15, 1, 1, '2023-09-16 07:17:50');
INSERT INTO `store_logs` VALUES (1, 1, 18, 1, 50, '2023-09-16 07:22:27');
INSERT INTO `store_logs` VALUES (1, 1, 18, 1, 50, '2023-09-16 07:22:59');
INSERT INTO `store_logs` VALUES (1, 1, 18, 1, 50, '2023-09-16 07:23:12');
INSERT INTO `store_logs` VALUES (1, 1, 13, 1, 10, '2023-09-16 07:23:29');
INSERT INTO `store_logs` VALUES (1, 1, 2, 1, 5, '2023-09-16 07:32:31');
INSERT INTO `store_logs` VALUES (1, 1, 2, 3, 5, '2023-09-16 07:34:48');
INSERT INTO `store_logs` VALUES (1, 1, 1, 2, 10, '2023-09-16 07:41:09');
INSERT INTO `store_logs` VALUES (1, 1, 1, 2, 10, '2023-09-16 07:41:41');
INSERT INTO `store_logs` VALUES (1, 275, 8, 1, 30, '2023-09-16 07:51:55');
INSERT INTO `store_logs` VALUES (1, 275, 1, 2, 10, '2023-09-16 08:06:58');
INSERT INTO `store_logs` VALUES (1, 275, 1, 2, 10, '2023-09-16 08:07:10');
INSERT INTO `store_logs` VALUES (1, 275, 1, 2, 10, '2023-09-16 08:10:06');
INSERT INTO `store_logs` VALUES (1, 275, 1, 2, 10, '2023-09-16 08:10:12');
INSERT INTO `store_logs` VALUES (1, 275, 1, 2, 10, '2023-09-16 08:10:22');
INSERT INTO `store_logs` VALUES (1, 275, 1, 2, 10, '2023-09-16 08:10:25');
INSERT INTO `store_logs` VALUES (1, 275, 14, 1, 20, '2023-09-16 08:11:23');
INSERT INTO `store_logs` VALUES (1, 275, 14, 1, 20, '2023-09-16 08:11:50');
INSERT INTO `store_logs` VALUES (1, 275, 14, 1, 20, '2023-09-16 08:11:59');
INSERT INTO `store_logs` VALUES (1, 275, 14, 1, 20, '2023-09-16 08:12:04');
INSERT INTO `store_logs` VALUES (1, 275, 14, 1, 20, '2023-09-16 08:12:18');
INSERT INTO `store_logs` VALUES (1, 275, 14, 1, 20, '2023-09-16 08:13:34');
INSERT INTO `store_logs` VALUES (1, 275, 14, 1, 20, '2023-09-16 08:13:38');
INSERT INTO `store_logs` VALUES (1, 275, 1, 2, 10, '2023-09-16 08:15:57');
INSERT INTO `store_logs` VALUES (1, 275, 14, 2, 20, '2023-09-16 08:16:22');
INSERT INTO `store_logs` VALUES (1, 275, 17, 2, 40, '2023-09-16 08:16:31');
INSERT INTO `store_logs` VALUES (1, 275, 19, 2, 50, '2023-09-16 08:17:55');
INSERT INTO `store_logs` VALUES (1, 275, 19, 2, 50, '2023-09-16 08:19:28');
INSERT INTO `store_logs` VALUES (1, 275, 1, 2, 10, '2023-09-16 08:19:58');
INSERT INTO `store_logs` VALUES (1, 275, 1, 2, 10, '2023-09-16 08:20:05');
INSERT INTO `store_logs` VALUES (1, 275, 1, 2, 10, '2023-09-16 08:29:20');
INSERT INTO `store_logs` VALUES (1, 275, 1, 2, 10, '2023-09-16 08:43:05');
INSERT INTO `store_logs` VALUES (2, 111, 8, 1, 30, '2023-09-17 06:57:41');
INSERT INTO `store_logs` VALUES (2, 276, 100, 1, 10, '2023-09-17 12:50:47');
INSERT INTO `store_logs` VALUES (2, 276, 10, 2, 10, '2023-09-17 13:44:40');
INSERT INTO `store_logs` VALUES (2, 276, 4, 2, 3, '2023-09-17 13:59:28');
INSERT INTO `store_logs` VALUES (2, 276, 90, 1, 50, '2023-09-17 14:28:10');
INSERT INTO `store_logs` VALUES (2, 276, 90, 1, 50, '2023-09-17 14:30:17');
INSERT INTO `store_logs` VALUES (2, 276, 90, 1, 50, '2023-09-17 14:30:59');
INSERT INTO `store_logs` VALUES (2, 276, 90, 1, 50, '2023-09-17 14:34:19');
INSERT INTO `store_logs` VALUES (2, 276, 133, 1, 10, '2023-09-17 14:34:40');
INSERT INTO `store_logs` VALUES (2, 276, 100, 1, 10, '2023-09-17 14:34:58');
INSERT INTO `store_logs` VALUES (2, 276, 90, 1, 50, '2023-09-17 14:35:50');
INSERT INTO `store_logs` VALUES (2, 276, 90, 1, 50, '2023-09-17 14:38:22');
INSERT INTO `store_logs` VALUES (2, 276, 90, 1, 50, '2023-09-17 14:39:16');
INSERT INTO `store_logs` VALUES (2, 276, 100, 1, 10, '2023-09-17 15:12:29');
INSERT INTO `store_logs` VALUES (2, 276, 11004, 1, 50, '2023-09-17 15:20:36');
INSERT INTO `store_logs` VALUES (2, 276, 11004, 1, 50, '2023-09-17 15:21:02');
INSERT INTO `store_logs` VALUES (2, 276, 99000, 1, 50, '2023-09-17 15:23:53');
INSERT INTO `store_logs` VALUES (2, 276, 3003, 2, 5, '2023-09-17 15:36:56');
INSERT INTO `store_logs` VALUES (2, 276, 3003, 2, 5, '2023-09-17 15:39:43');
INSERT INTO `store_logs` VALUES (2, 277, 11005, 2, 50, '2023-09-18 05:05:49');
INSERT INTO `store_logs` VALUES (2, 276, 20001, 2, 10, '2023-09-18 07:40:16');
INSERT INTO `store_logs` VALUES (3, 272, 3003, 2, 30, '2023-09-18 15:32:20');
INSERT INTO `store_logs` VALUES (3, 123, 3004, 2, 30, '2023-09-18 16:05:08');
INSERT INTO `store_logs` VALUES (3, 123, 3004, 2, 30, '2023-09-18 16:22:27');
INSERT INTO `store_logs` VALUES (3, 123, 3004, 2, 30, '2023-09-18 16:23:14');
INSERT INTO `store_logs` VALUES (3, 123, 3003, 2, 30, '2023-09-18 16:53:30');
INSERT INTO `store_logs` VALUES (3, 123, 3003, 2, 30, '2023-09-18 16:54:37');
INSERT INTO `store_logs` VALUES (3, 123, 3003, 2, 30, '2023-09-18 17:04:11');
INSERT INTO `store_logs` VALUES (3, 123, 3004, 2, 30, '2023-09-18 17:06:07');
INSERT INTO `store_logs` VALUES (3, 123, 3004, 2, 30, '2023-09-18 17:06:32');
INSERT INTO `store_logs` VALUES (3, 122, 11005, 2, 50, '2023-09-19 07:40:25');
INSERT INTO `store_logs` VALUES (3, 122, 11005, 2, 50, '2023-09-19 07:48:43');
INSERT INTO `store_logs` VALUES (3, 122, 11004, 2, 50, '2023-09-19 07:53:27');
INSERT INTO `store_logs` VALUES (3, 122, 11003, 2, 30, '2023-09-19 07:53:29');
INSERT INTO `store_logs` VALUES (3, 122, 11003, 2, 30, '2023-09-19 07:54:04');

SET FOREIGN_KEY_CHECKS = 1;
