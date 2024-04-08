/*
 Navicat Premium Data Transfer

 Source Server         : www-xscope
 Source Server Type    : MySQL
 Source Server Version : 50724 (5.7.24)
 Source Host           : 47.97.173.229:3306
 Source Schema         : TongShan

 Target Server Type    : MySQL
 Target Server Version : 50724 (5.7.24)
 File Encoding         : 65001

 Date: 08/04/2024 15:49:02
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for FaceFlow
-- ----------------------------
DROP TABLE IF EXISTS `FaceFlow`;
CREATE TABLE `FaceFlow`  (
  `id` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '人脸编号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of FaceFlow
-- ----------------------------

-- ----------------------------
-- Table structure for VehicleFlow
-- ----------------------------
DROP TABLE IF EXISTS `VehicleFlow`;
CREATE TABLE `VehicleFlow`  (
  `MotorVehicleID` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '车辆全局唯一标识',
  `InfoKind` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '信息分类-人工采集还是自动采集',
  `SourceID` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '来源图像标识',
  `TollgateID` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '关联卡口编号',
  `DeviceID` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '设备编码，自动采集必选',
  `StorageUrl1` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '近景照片-卡口相机所拍照片，自动采集必选，图像访问路径，采用 URI 命名规则',
  `StorageUrl2` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '车牌照片',
  `StorageUrl3` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '远景照片-全景相机所拍照片',
  `StorageUrl4` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '合成图',
  `StorageUrl5` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '缩略图',
  `HasPlate` bit(1) NULL DEFAULT NULL COMMENT '有无车牌',
  `PlateNo` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '车牌号-各类机动车号牌编号车牌全部无法识别的以“无\r\n车牌”标识，部分未识别的每个字符以半角‘-’代替',
  `VehicleClass` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '车辆类型',
  `VehicleBrand` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '车辆品牌',
  `VehicleModel` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '车辆型号',
  `NumOfPassenger` int(6) NULL DEFAULT NULL COMMENT '车内人数',
  `IsSuspicious` bit(1) NULL DEFAULT NULL COMMENT '是否可疑车',
  `SafetyBelt` int(6) NULL DEFAULT NULL COMMENT '安全带状态-0：未系；1：有系',
  `Calling` int(6) NULL DEFAULT NULL COMMENT '打电话状态-0：未打电话；1：打电话中',
  `PlateReliability` varchar(3) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '号牌识别可信度-整个号牌号码的识别可信度，以 0～100 数值表示百分比，数值越大可信度越高',
  `PlateCharReliabil
ity` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '每位号牌号码\r\n可信度-号牌号码的识别可信度，以 0～100 数值表示百分比，数值越大可信度越高。\r\n按“字符 1-可信度 1，字符 2-可信度 2”方式排\r\n列，中间为英文半角连接线、逗号；例如识别号\r\n牌号码为：苏 B12345，则取值为：”苏-80，B-90， 1-90，2-88，3-90，4-67，5-87”',
  `BrandReliability` varchar(3) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '品牌标志识别可信度-车辆品牌标志可信度；以 0～100 之间数值表示百分比，数值越大可信度越高',
  `SubImageList` json NULL COMMENT '可以包含 0 个或者多个子图像对象',
  PRIMARY KEY (`MotorVehicleID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of VehicleFlow
-- ----------------------------

SET FOREIGN_KEY_CHECKS = 1;
