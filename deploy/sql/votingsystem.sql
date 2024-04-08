/*
 Navicat Premium Data Transfer

 Source Server         : www-xscope
 Source Server Type    : MySQL
 Source Server Version : 50724 (5.7.24)
 Source Host           : 47.97.173.229:3306
 Source Schema         : votingsystem

 Target Server Type    : MySQL
 Target Server Version : 50724 (5.7.24)
 File Encoding         : 65001

 Date: 08/04/2024 15:49:11
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin`  (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Account` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `Password` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `Name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `Power` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `PhotoPath` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`Id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES (1, 'root', '1', 'mao', '1', '1');
INSERT INTO `admin` VALUES (2, 'admin', '1', 'lei', '管理员', '/Source/headPhoto/2021-04-01-15-04-31.png');

-- ----------------------------
-- Table structure for content
-- ----------------------------
DROP TABLE IF EXISTS `content`;
CREATE TABLE `content`  (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `ProjectId` int(11) NOT NULL,
  `Result` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `FirstPrizeNum` int(11) NULL DEFAULT NULL,
  `SecondPrizeNum` int(11) NULL DEFAULT NULL,
  `ThirdPrizeNum` int(11) NULL DEFAULT NULL,
  `GiveupNum` int(11) NULL DEFAULT NULL,
  `Score` int(11) NULL DEFAULT NULL,
  `Number` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `Name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`Id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 112 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of content
-- ----------------------------
INSERT INTO `content` VALUES (1, 5, NULL, 2, 0, 0, 0, 0, '1', '路飞');
INSERT INTO `content` VALUES (2, 5, NULL, 2, 0, 0, 0, 0, '2', '索隆');
INSERT INTO `content` VALUES (3, 5, NULL, 1, 1, 0, 0, 0, '3', '鹰眼');
INSERT INTO `content` VALUES (4, 5, NULL, 1, 1, 0, 0, 0, '4', '多弗朗明哥');
INSERT INTO `content` VALUES (5, 5, NULL, 1, 1, 0, 0, 0, '5', '甚平');
INSERT INTO `content` VALUES (6, 5, NULL, 1, 0, 1, 0, 0, '6', '凯多');
INSERT INTO `content` VALUES (7, 5, NULL, 1, 0, 1, 0, 0, '7', '克洛克达尔');
INSERT INTO `content` VALUES (8, 5, NULL, 1, 0, 1, 0, 0, '8', '香吉士');
INSERT INTO `content` VALUES (9, 5, NULL, 1, 1, 0, 0, 0, '9', '乔巴');
INSERT INTO `content` VALUES (10, 5, NULL, 1, 0, 1, 0, 0, '10', '罗宾');
INSERT INTO `content` VALUES (11, 5, NULL, 1, 1, 0, 0, 0, '11', 'BigMom');
INSERT INTO `content` VALUES (12, 5, NULL, 1, 1, 0, 0, 0, '12', '白胡子');
INSERT INTO `content` VALUES (13, 5, NULL, 1, 0, 1, 0, 0, '13', '黑胡子');
INSERT INTO `content` VALUES (14, 5, NULL, 1, 0, 1, 0, 0, '14', '小丑巴其');
INSERT INTO `content` VALUES (15, 5, NULL, 1, 0, 1, 0, 0, '15', '赤犬');
INSERT INTO `content` VALUES (16, 5, NULL, 1, 0, 1, 0, 0, '16', '青稚');
INSERT INTO `content` VALUES (17, 5, NULL, 1, 0, 1, 0, 0, '17', '黄猿');
INSERT INTO `content` VALUES (18, 5, NULL, 1, 0, 0, 1, 0, '18', '战国');
INSERT INTO `content` VALUES (19, 5, NULL, 1, 1, 0, 0, 0, '19', '绿牛');
INSERT INTO `content` VALUES (20, 5, NULL, 1, 1, 0, 0, 0, '20', '藤虎');
INSERT INTO `content` VALUES (21, 5, NULL, 1, 1, 0, 0, 0, '21', '杰克');
INSERT INTO `content` VALUES (22, 5, NULL, 1, 1, 0, 0, 0, '22', '奎因');
INSERT INTO `content` VALUES (32, 7, NULL, 0, 0, 0, 0, 0, '1', '路飞');
INSERT INTO `content` VALUES (33, 7, NULL, 0, 0, 0, 0, 0, '2', '索隆');
INSERT INTO `content` VALUES (34, 7, NULL, 0, 0, 0, 0, 0, '3', '鹰眼');
INSERT INTO `content` VALUES (35, 7, NULL, 0, 0, 0, 0, 0, '4', '多弗朗明哥');
INSERT INTO `content` VALUES (36, 7, NULL, 0, 0, 0, 0, 0, '5', '甚平');
INSERT INTO `content` VALUES (37, 7, NULL, 0, 0, 0, 0, 0, '6', '凯多');
INSERT INTO `content` VALUES (38, 7, NULL, 0, 0, 0, 0, 0, '7', '克洛克达尔');
INSERT INTO `content` VALUES (39, 7, NULL, 0, 0, 0, 0, 0, '8', '香吉士');
INSERT INTO `content` VALUES (40, 7, NULL, 0, 0, 0, 0, 0, '9', '乔巴');
INSERT INTO `content` VALUES (41, 7, NULL, 0, 0, 0, 0, 0, '10', '罗宾');
INSERT INTO `content` VALUES (42, 7, NULL, 0, 0, 0, 0, 0, '11', 'BigMom');
INSERT INTO `content` VALUES (43, 7, NULL, 0, 0, 0, 0, 0, '12', '白胡子');
INSERT INTO `content` VALUES (44, 7, NULL, 0, 0, 0, 0, 0, '13', '黑胡子');
INSERT INTO `content` VALUES (45, 7, NULL, 0, 0, 0, 0, 0, '14', '小丑巴其');
INSERT INTO `content` VALUES (46, 7, NULL, 0, 0, 0, 0, 0, '15', '赤犬');
INSERT INTO `content` VALUES (47, 7, NULL, 0, 0, 0, 0, 0, '16', '青稚');
INSERT INTO `content` VALUES (48, 7, NULL, 0, 0, 0, 0, 0, '17', '黄猿');
INSERT INTO `content` VALUES (49, 7, NULL, 0, 0, 0, 0, 0, '18', '战国');
INSERT INTO `content` VALUES (50, 7, NULL, 0, 0, 0, 0, 0, '19', '绿牛');
INSERT INTO `content` VALUES (51, 7, NULL, 0, 0, 0, 0, 0, '20', '藤虎');
INSERT INTO `content` VALUES (52, 7, NULL, 0, 0, 0, 0, 0, '21', '杰克');
INSERT INTO `content` VALUES (53, 7, NULL, 0, 0, 0, 0, 0, '22', '奎因');
INSERT INTO `content` VALUES (63, 8, NULL, 1, 0, 0, 0, 0, '1', '孙悟空');
INSERT INTO `content` VALUES (64, 8, NULL, 1, 0, 0, 0, 0, '2', '猪八戒');
INSERT INTO `content` VALUES (65, 8, NULL, 1, 0, 0, 0, 0, '3', '唐僧');
INSERT INTO `content` VALUES (66, 8, NULL, 1, 0, 0, 0, 0, '4', '沙僧');
INSERT INTO `content` VALUES (67, 8, NULL, 1, 0, 0, 0, 0, '', '');
INSERT INTO `content` VALUES (68, 8, NULL, 1, 0, 0, 0, 0, '', '');
INSERT INTO `content` VALUES (69, 8, NULL, 1, 0, 0, 0, 0, '', '');
INSERT INTO `content` VALUES (70, 8, NULL, 1, 0, 0, 0, 0, '', '');
INSERT INTO `content` VALUES (71, 8, NULL, 1, 0, 0, 0, 0, '', '');
INSERT INTO `content` VALUES (72, 8, NULL, 1, 0, 0, 0, 0, '', '');
INSERT INTO `content` VALUES (73, 8, NULL, 1, 0, 0, 0, 0, '', '');
INSERT INTO `content` VALUES (74, 8, NULL, 1, 0, 0, 0, 0, '', '');
INSERT INTO `content` VALUES (75, 8, NULL, 1, 0, 0, 0, 0, '', '');
INSERT INTO `content` VALUES (76, 8, NULL, 1, 0, 0, 0, 0, '', '');
INSERT INTO `content` VALUES (77, 8, NULL, 1, 0, 0, 0, 0, '', '');
INSERT INTO `content` VALUES (78, 8, NULL, 1, 0, 0, 0, 0, '', '');
INSERT INTO `content` VALUES (79, 8, NULL, 1, 0, 0, 0, 0, '', '');
INSERT INTO `content` VALUES (80, 8, NULL, 1, 0, 0, 0, 0, '', '');
INSERT INTO `content` VALUES (81, 8, NULL, 1, 0, 0, 0, 0, '', '');
INSERT INTO `content` VALUES (82, 8, NULL, 1, 0, 0, 0, 0, '', '');
INSERT INTO `content` VALUES (83, 8, NULL, 1, 0, 0, 0, 0, '', '');
INSERT INTO `content` VALUES (84, 8, NULL, 1, 0, 0, 0, 0, '', '');
INSERT INTO `content` VALUES (94, 9, NULL, 0, 0, 0, 0, 1, '1', '孙悟空');
INSERT INTO `content` VALUES (95, 9, NULL, 0, 0, 0, 0, 0, '2', '猪八戒');
INSERT INTO `content` VALUES (96, 9, NULL, 0, 0, 0, 0, 0, '3', '唐僧');
INSERT INTO `content` VALUES (97, 9, NULL, 0, 0, 0, 0, 0, '4', '沙僧');
INSERT INTO `content` VALUES (101, 10, NULL, 1, 0, 0, 0, 0, '1', '孙悟空');
INSERT INTO `content` VALUES (102, 10, NULL, 1, 0, 0, 0, 0, '2', '猪八戒');
INSERT INTO `content` VALUES (103, 10, NULL, 0, 1, 0, 0, 0, '3', '唐僧');
INSERT INTO `content` VALUES (104, 10, NULL, 0, 1, 0, 0, 0, '4', '沙僧');
INSERT INTO `content` VALUES (108, 11, NULL, 0, 0, 0, 0, 0, '1', '孙悟空');
INSERT INTO `content` VALUES (109, 11, NULL, 0, 0, 0, 0, 0, '2', '猪八戒');
INSERT INTO `content` VALUES (110, 11, NULL, 0, 0, 0, 0, 0, '3', '唐僧');
INSERT INTO `content` VALUES (111, 11, NULL, 0, 0, 0, 0, 0, '4', '沙僧');

-- ----------------------------
-- Table structure for expert
-- ----------------------------
DROP TABLE IF EXISTS `expert`;
CREATE TABLE `expert`  (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `ProjectId` int(11) NOT NULL,
  `Status` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `Account` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `Password` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `Name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `CodePath` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`Id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of expert
-- ----------------------------
INSERT INTO `expert` VALUES (1, 5, '已投票', '1', '8figR', '1-1号评委', '/Source/QRCode/1-1号评委.png');
INSERT INTO `expert` VALUES (2, 5, '已投票', '2', 'lRc2R', '1-2号评委', '/Source/QRCode/1-2号评委.png');
INSERT INTO `expert` VALUES (4, 7, '未投票', '1', 'Hwuwr', '12-1号评委', '/Source/QRCode/12-1号评委.png');
INSERT INTO `expert` VALUES (5, 8, '已投票', '1', 'o2pBH', '测试项目-1号评委', '/Source/QRCode/测试项目-1号评委.png');
INSERT INTO `expert` VALUES (6, 9, '已投票', '1', 'GeyKx', 'aaaa-1号评委', '/Source/QRCode/aaaa-1号评委.png');
INSERT INTO `expert` VALUES (7, 10, '已投票', '1', '5HwJ3', 'bbb-1号评委', '/Source/QRCode/bbb-1号评委.png');
INSERT INTO `expert` VALUES (8, 11, '未投票', '1', 'jihPR', '评分项目-1号评委', '/Source/QRCode/评分项目-1号评委.png');

-- ----------------------------
-- Table structure for project
-- ----------------------------
DROP TABLE IF EXISTS `project`;
CREATE TABLE `project`  (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `Remark` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `Method` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `StartTime` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `EndTime` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `Status` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `ExpertCount` int(11) NOT NULL,
  `FilePath` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `ContentNum` int(11) NOT NULL,
  `HasVote` int(11) NOT NULL,
  PRIMARY KEY (`Id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of project
-- ----------------------------
INSERT INTO `project` VALUES (4, 'a', 'a', '投票', '2021-04-01', '2021-04-01', '进行中', 3, '/Source/ProjectFile/2021-04-01-15-34-20.xlsx', 0, 0);
INSERT INTO `project` VALUES (5, '1', '1', '投票', '2021-04-01', '2021-04-01', '结束投票', 2, '/Source/ProjectFile/2021-04-01-15-37-45.xlsx', 22, 2);
INSERT INTO `project` VALUES (7, '12', '1213', '投票', '2021-04-03', '2021-04-03', '进行中', 1, '/Source/ProjectFile/2021-04-03-21-47-18.xlsx', 22, 0);
INSERT INTO `project` VALUES (8, '测试项目', '测试项目备注', '投票', '2021-04-03', '2021-04-03', '结束投票', 1, '/Source/ProjectFile/2021-04-03-22-31-26.xlsx', 22, 1);
INSERT INTO `project` VALUES (9, 'aaaa', 'aaaa', '评分', '2021-04-03', '2021-04-03', '结束投票', 1, '/Source/ProjectFile/2021-04-03-22-50-15.xlsx', 4, 1);
INSERT INTO `project` VALUES (10, 'bbb', 'bbb', '投票', '2021-04-03', '2021-04-03', '结束投票', 1, '/Source/ProjectFile/2021-04-03-22-54-25.xlsx', 4, 1);
INSERT INTO `project` VALUES (11, '评分项目', '1', '评分', '2021-04-03', '2021-04-03', '进行中', 1, '/Source/ProjectFile/2021-04-03-23-01-56.xlsx', 4, 0);

-- ----------------------------
-- Table structure for record
-- ----------------------------
DROP TABLE IF EXISTS `record`;
CREATE TABLE `record`  (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `ContentId` int(11) NOT NULL,
  `ExpertId` int(11) NOT NULL,
  `Value` int(11) NOT NULL,
  PRIMARY KEY (`Id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 85 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of record
-- ----------------------------
INSERT INTO `record` VALUES (1, 1, 1, 1);
INSERT INTO `record` VALUES (2, 2, 1, 1);
INSERT INTO `record` VALUES (3, 3, 1, 1);
INSERT INTO `record` VALUES (4, 4, 1, 1);
INSERT INTO `record` VALUES (5, 8, 1, 1);
INSERT INTO `record` VALUES (6, 7, 1, 1);
INSERT INTO `record` VALUES (7, 10, 1, 1);
INSERT INTO `record` VALUES (8, 9, 1, 1);
INSERT INTO `record` VALUES (9, 6, 1, 1);
INSERT INTO `record` VALUES (10, 5, 1, 1);
INSERT INTO `record` VALUES (11, 20, 1, 1);
INSERT INTO `record` VALUES (12, 19, 1, 1);
INSERT INTO `record` VALUES (13, 18, 1, 1);
INSERT INTO `record` VALUES (14, 17, 1, 1);
INSERT INTO `record` VALUES (15, 15, 1, 1);
INSERT INTO `record` VALUES (16, 16, 1, 1);
INSERT INTO `record` VALUES (17, 14, 1, 1);
INSERT INTO `record` VALUES (18, 13, 1, 1);
INSERT INTO `record` VALUES (19, 12, 1, 1);
INSERT INTO `record` VALUES (20, 11, 1, 1);
INSERT INTO `record` VALUES (21, 22, 1, 1);
INSERT INTO `record` VALUES (22, 21, 1, 1);
INSERT INTO `record` VALUES (23, 32, 4, 1);
INSERT INTO `record` VALUES (24, 33, 4, 1);
INSERT INTO `record` VALUES (25, 34, 4, 1);
INSERT INTO `record` VALUES (26, 35, 4, 1);
INSERT INTO `record` VALUES (27, 36, 4, 1);
INSERT INTO `record` VALUES (28, 38, 4, 1);
INSERT INTO `record` VALUES (29, 39, 4, 1);
INSERT INTO `record` VALUES (30, 40, 4, 1);
INSERT INTO `record` VALUES (31, 41, 4, 1);
INSERT INTO `record` VALUES (32, 1, 2, 1);
INSERT INTO `record` VALUES (33, 2, 2, 1);
INSERT INTO `record` VALUES (34, 3, 2, 2);
INSERT INTO `record` VALUES (35, 4, 2, 2);
INSERT INTO `record` VALUES (36, 5, 2, 2);
INSERT INTO `record` VALUES (37, 6, 2, 3);
INSERT INTO `record` VALUES (38, 7, 2, 3);
INSERT INTO `record` VALUES (39, 8, 2, 3);
INSERT INTO `record` VALUES (40, 9, 2, 2);
INSERT INTO `record` VALUES (41, 10, 2, 3);
INSERT INTO `record` VALUES (42, 20, 2, 2);
INSERT INTO `record` VALUES (43, 19, 2, 2);
INSERT INTO `record` VALUES (44, 18, 2, 4);
INSERT INTO `record` VALUES (45, 17, 2, 3);
INSERT INTO `record` VALUES (46, 16, 2, 3);
INSERT INTO `record` VALUES (47, 14, 2, 3);
INSERT INTO `record` VALUES (48, 15, 2, 3);
INSERT INTO `record` VALUES (49, 12, 2, 2);
INSERT INTO `record` VALUES (50, 11, 2, 2);
INSERT INTO `record` VALUES (51, 13, 2, 3);
INSERT INTO `record` VALUES (52, 22, 2, 2);
INSERT INTO `record` VALUES (53, 21, 2, 2);
INSERT INTO `record` VALUES (54, 66, 5, 1);
INSERT INTO `record` VALUES (55, 67, 5, 1);
INSERT INTO `record` VALUES (56, 68, 5, 1);
INSERT INTO `record` VALUES (57, 69, 5, 1);
INSERT INTO `record` VALUES (58, 70, 5, 1);
INSERT INTO `record` VALUES (59, 71, 5, 1);
INSERT INTO `record` VALUES (60, 72, 5, 1);
INSERT INTO `record` VALUES (61, 65, 5, 1);
INSERT INTO `record` VALUES (62, 64, 5, 1);
INSERT INTO `record` VALUES (63, 63, 5, 1);
INSERT INTO `record` VALUES (64, 82, 5, 1);
INSERT INTO `record` VALUES (65, 81, 5, 1);
INSERT INTO `record` VALUES (66, 80, 5, 1);
INSERT INTO `record` VALUES (67, 78, 5, 1);
INSERT INTO `record` VALUES (68, 79, 5, 1);
INSERT INTO `record` VALUES (69, 76, 5, 1);
INSERT INTO `record` VALUES (70, 77, 5, 1);
INSERT INTO `record` VALUES (71, 75, 5, 1);
INSERT INTO `record` VALUES (72, 74, 5, 1);
INSERT INTO `record` VALUES (73, 73, 5, 1);
INSERT INTO `record` VALUES (74, 84, 5, 1);
INSERT INTO `record` VALUES (75, 83, 5, 1);
INSERT INTO `record` VALUES (76, 94, 6, 1);
INSERT INTO `record` VALUES (77, 95, 6, 0);
INSERT INTO `record` VALUES (78, 96, 6, 0);
INSERT INTO `record` VALUES (79, 97, 6, 0);
INSERT INTO `record` VALUES (80, 101, 7, 1);
INSERT INTO `record` VALUES (81, 102, 7, 1);
INSERT INTO `record` VALUES (82, 103, 7, 2);
INSERT INTO `record` VALUES (83, 108, 8, 3);
INSERT INTO `record` VALUES (84, 104, 7, 2);

SET FOREIGN_KEY_CHECKS = 1;
