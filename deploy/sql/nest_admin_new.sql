/*
 Navicat Premium Data Transfer

 Source Server         : www-mysql80
 Source Server Type    : MySQL
 Source Server Version : 80032 (8.0.32)
 Source Host           : 47.97.173.229:9307
 Source Schema         : nest_admin

 Target Server Type    : MySQL
 Target Server Version : 80032 (8.0.32)
 File Encoding         : 65001

 Date: 09/04/2024 09:34:57
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for article
-- ----------------------------
DROP TABLE IF EXISTS `article`;
CREATE TABLE `article`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `path` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `visitCount` int NULL DEFAULT 0,
  `created_at` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `updated_at` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of article
-- ----------------------------
INSERT INTO `article` VALUES (5, '默认标题10', '---\ntitle: 默认标题\nauthor: admin\ntags: [标签1,标签2]\ncategories: [分类1,分类2]\ndate: 2024-04-08 23:10:35\n---\n\n这是是测试10', NULL, 0, '2024-04-08 23:10:35.000000', '2024-04-08 23:52:40.833478');
INSERT INTO `article` VALUES (6, '默认标题10', '---\ntitle: 默认标题\nauthor: admin\ntags: [标签1,标签2]\ncategories: [分类1,分类2]\ndate: 2024-04-08 23:10:35\n---\n\n这是是测试10', NULL, 0, '2024-04-08 23:10:35.000000', '2024-04-08 23:52:40.833826');

-- ----------------------------
-- Table structure for migrations
-- ----------------------------
DROP TABLE IF EXISTS `migrations`;
CREATE TABLE `migrations`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `timestamp` bigint NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of migrations
-- ----------------------------
INSERT INTO `migrations` VALUES (1, 1707996695540, 'InitData1707996695540');

-- ----------------------------
-- Table structure for sys_captcha_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_captcha_log`;
CREATE TABLE `sys_captcha_log`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NULL DEFAULT NULL,
  `account` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `code` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `provider` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `created_at` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `updated_at` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_captcha_log
-- ----------------------------

-- ----------------------------
-- Table structure for sys_config
-- ----------------------------
DROP TABLE IF EXISTS `sys_config`;
CREATE TABLE `sys_config`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `key` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `value` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `created_at` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `updated_at` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `IDX_2c363c25cf99bcaab3a7f389ba`(`key` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 16 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_config
-- ----------------------------
INSERT INTO `sys_config` VALUES (1, 'sys_user_initPassword', '初始密码', '123456', '创建管理员账号的初始密码', '2023-11-10 00:31:44.154921', '2023-11-10 00:31:44.161263');
INSERT INTO `sys_config` VALUES (2, 'sys_api_token', 'API Token', 'xscope-admin', '用于请求 @ApiToken 的控制器', '2023-11-10 00:31:44.154921', '2024-03-31 13:32:17.000000');
INSERT INTO `sys_config` VALUES (11, 'hexo_visit_url', 'hexo的访问url', 'http://127.0.0.1/blog/', 'hexo的访问url,例: http://127.0.0.1/blog/', '2024-03-31 22:43:21.211123', '2024-03-31 22:47:23.000000');
INSERT INTO `sys_config` VALUES (12, 'hexo_admin_url', '博客后台管理url', 'http://127.0.0.1/admin/', '博客后台管理的访问url，例: http://127.0.0.1/admin/', '2024-03-31 22:44:00.503063', '2024-03-31 22:47:36.000000');
INSERT INTO `sys_config` VALUES (13, 'article_path', '文章目录', 'E:\\project\\vue\\vue3-antdv-admin\\docs', '文章的markdown文件目录，一般在hexo路径下的 source/_posts 文件夹', '2024-03-31 22:45:21.198453', '2024-04-04 00:33:07.370181');
INSERT INTO `sys_config` VALUES (14, 'hexo_path', 'hexo目录', '/opt/hexo-blog', 'hexo目录', '2024-03-31 22:46:13.470660', '2024-03-31 22:46:13.470660');
INSERT INTO `sys_config` VALUES (15, 'public_path', 'hexo发布路径', '/usr/share/nginx/html', '发布路径，即http服务器的访问路径', '2024-03-31 22:47:00.493963', '2024-03-31 22:47:00.493963');

-- ----------------------------
-- Table structure for sys_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `orderNo` int NULL DEFAULT 0,
  `mpath` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '',
  `parentId` int NULL DEFAULT NULL,
  `created_at` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `updated_at` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK_c75280b01c49779f2323536db67`(`parentId` ASC) USING BTREE,
  CONSTRAINT `FK_c75280b01c49779f2323536db67` FOREIGN KEY (`parentId`) REFERENCES `sys_dept` (`id`) ON DELETE SET NULL ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 18 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
INSERT INTO `sys_dept` VALUES (1, '武汉', 1, '1.', NULL, '2023-11-10 00:31:43.996025', '2024-03-31 13:40:32.000000');
INSERT INTO `sys_dept` VALUES (2, '研发部', 1, '1.2.', 1, '2023-11-10 00:31:43.996025', '2024-03-31 13:40:32.000000');
INSERT INTO `sys_dept` VALUES (3, '市场部', 2, '1.3.', 1, '2023-11-10 00:31:43.996025', '2024-03-31 13:40:32.000000');
INSERT INTO `sys_dept` VALUES (4, '商务部', 3, '1.4.', 1, '2023-11-10 00:31:43.996025', '2024-03-31 13:40:32.000000');
INSERT INTO `sys_dept` VALUES (5, '财务部', 4, '1.5.', 1, '2023-11-10 00:31:43.996025', '2024-03-31 13:40:32.000000');
INSERT INTO `sys_dept` VALUES (6, '北京', 2, '6.', NULL, '2023-11-10 00:31:43.996025', '2024-03-31 13:40:38.000000');
INSERT INTO `sys_dept` VALUES (7, '西北分部', 3, '7.', NULL, '2023-11-10 00:31:43.996025', '2023-11-10 00:31:44.008709');
INSERT INTO `sys_dept` VALUES (8, '研发部', 1, '6.8.', 6, '2023-11-10 00:31:43.996025', '2024-03-31 13:40:38.000000');
INSERT INTO `sys_dept` VALUES (9, '市场部', 1, '6.9.', 6, '2023-11-10 00:31:43.996025', '2024-03-31 13:40:38.000000');

-- ----------------------------
-- Table structure for sys_dict
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict`;
CREATE TABLE `sys_dict`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `created_at` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `updated_at` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `create_by` int NOT NULL COMMENT '创建者',
  `update_by` int NOT NULL COMMENT '更新者',
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `status` tinyint NOT NULL DEFAULT 1,
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `IDX_d112365748f740ee260b65ce91`(`name` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_dict
-- ----------------------------

-- ----------------------------
-- Table structure for sys_dict_item
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_item`;
CREATE TABLE `sys_dict_item`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `created_at` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `updated_at` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `create_by` int NOT NULL COMMENT '创建者',
  `update_by` int NOT NULL COMMENT '更新者',
  `label` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `value` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `order` int NULL DEFAULT NULL COMMENT '字典项排序',
  `status` tinyint NOT NULL DEFAULT 1,
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `type_id` int NULL DEFAULT NULL,
  `orderNo` int NULL DEFAULT NULL COMMENT '字典项排序',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK_d68ea74fcb041c8cfd1fd659844`(`type_id` ASC) USING BTREE,
  CONSTRAINT `FK_d68ea74fcb041c8cfd1fd659844` FOREIGN KEY (`type_id`) REFERENCES `sys_dict_type` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_dict_item
-- ----------------------------
INSERT INTO `sys_dict_item` VALUES (1, '2024-01-29 01:24:51.846135', '2024-01-29 02:23:19.000000', 1, 1, '男', '1', 0, 1, '性别男', 1, 3);
INSERT INTO `sys_dict_item` VALUES (2, '2024-01-29 01:32:58.458741', '2024-01-29 01:58:20.000000', 1, 1, '女', '0', 1, 1, '性别女', 1, 2);
INSERT INTO `sys_dict_item` VALUES (3, '2024-01-29 01:59:17.805394', '2024-01-29 14:37:18.000000', 1, 1, '人妖王', '3', NULL, 1, '安布里奥·伊万科夫', 1, 0);
INSERT INTO `sys_dict_item` VALUES (5, '2024-01-29 02:13:01.782466', '2024-01-29 02:13:01.782466', 1, 1, '显示', '1', NULL, 1, '显示菜单', 2, 0);
INSERT INTO `sys_dict_item` VALUES (6, '2024-01-29 02:13:31.134721', '2024-01-29 02:13:31.134721', 1, 1, '隐藏', '0', NULL, 1, '隐藏菜单', 2, 0);

-- ----------------------------
-- Table structure for sys_dict_type
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_type`;
CREATE TABLE `sys_dict_type`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `created_at` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `updated_at` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `create_by` int NOT NULL COMMENT '创建者',
  `update_by` int NOT NULL COMMENT '更新者',
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `status` tinyint NOT NULL DEFAULT 1,
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `IDX_74d0045ff7fab9f67adc0b1bda`(`code` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_dict_type
-- ----------------------------
INSERT INTO `sys_dict_type` VALUES (1, '2024-01-28 08:19:12.777447', '2024-02-08 13:05:10.000000', 1, 1, '性别', 1, '性别单选', 'sys_user_gender');
INSERT INTO `sys_dict_type` VALUES (2, '2024-01-28 08:38:41.235185', '2024-01-29 02:11:33.000000', 1, 1, '菜单显示状态', 1, '菜单显示状态', 'sys_show_hide');

-- ----------------------------
-- Table structure for sys_login_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_login_log`;
CREATE TABLE `sys_login_log`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `ip` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ua` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `provider` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `created_at` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `updated_at` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `user_id` int NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK_3029712e0df6a28edaee46fd470`(`user_id` ASC) USING BTREE,
  CONSTRAINT `FK_3029712e0df6a28edaee46fd470` FOREIGN KEY (`user_id`) REFERENCES `sys_user` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_login_log
-- ----------------------------
INSERT INTO `sys_login_log` VALUES (1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36 Edg/123.0.0.0', '内网IP', NULL, '2024-03-31 13:26:45.089899', '2024-03-31 13:26:45.089899', 1);
INSERT INTO `sys_login_log` VALUES (2, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36 Edg/123.0.0.0', '内网IP', NULL, '2024-03-31 13:32:50.997017', '2024-03-31 13:32:50.997017', 1);
INSERT INTO `sys_login_log` VALUES (3, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36 Edg/123.0.0.0', '内网IP', NULL, '2024-03-31 13:39:22.538970', '2024-03-31 13:39:22.538970', 1);
INSERT INTO `sys_login_log` VALUES (4, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36 Edg/123.0.0.0', '内网IP', NULL, '2024-04-03 23:00:57.811097', '2024-04-03 23:00:57.811097', 1);
INSERT INTO `sys_login_log` VALUES (5, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36 Edg/123.0.0.0', '内网IP', NULL, '2024-04-05 20:38:46.794865', '2024-04-05 20:38:46.794865', 1);
INSERT INTO `sys_login_log` VALUES (6, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36 Edg/123.0.0.0', '内网IP', NULL, '2024-04-06 21:18:54.945271', '2024-04-06 21:18:54.945271', 1);
INSERT INTO `sys_login_log` VALUES (7, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36 Edg/123.0.0.0', '内网IP', NULL, '2024-04-06 21:36:54.321027', '2024-04-06 21:36:54.321027', 1);
INSERT INTO `sys_login_log` VALUES (8, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36 Edg/123.0.0.0', '内网IP', NULL, '2024-04-06 21:38:45.529710', '2024-04-06 21:38:45.529710', 1);
INSERT INTO `sys_login_log` VALUES (9, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36 Edg/123.0.0.0', '内网IP', NULL, '2024-04-07 21:47:45.797366', '2024-04-07 21:47:45.797366', 1);
INSERT INTO `sys_login_log` VALUES (10, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36 Edg/123.0.0.0', '内网IP', NULL, '2024-04-08 21:22:41.375595', '2024-04-08 21:22:41.375595', 1);
INSERT INTO `sys_login_log` VALUES (11, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36 Edg/123.0.0.0', '内网IP', NULL, '2024-04-08 23:42:09.747617', '2024-04-08 23:42:09.747617', 1);

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `parent_id` int NULL DEFAULT NULL,
  `path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `permission` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `type` tinyint NOT NULL DEFAULT 0,
  `icon` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '',
  `order_no` int NULL DEFAULT 0,
  `component` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `keep_alive` tinyint NOT NULL DEFAULT 1,
  `show` tinyint NOT NULL DEFAULT 1,
  `status` tinyint NOT NULL DEFAULT 1,
  `created_at` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `updated_at` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `is_ext` tinyint NOT NULL DEFAULT 0,
  `ext_open_mode` tinyint NOT NULL DEFAULT 1,
  `active_menu` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 133 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES (1, NULL, '/system', '系统管理', '', 0, 'ant-design:setting-outlined', 254, '', 0, 1, 1, '2023-11-10 00:31:44.023393', '2024-02-28 22:05:52.102649', 0, 1, NULL);
INSERT INTO `sys_menu` VALUES (2, 1, '/system/user', '用户管理', 'system:user:list', 1, 'ant-design:user-outlined', 0, 'system/user/index', 0, 1, 1, '2023-11-10 00:31:44.023393', '2024-02-28 22:05:52.102649', 0, 1, NULL);
INSERT INTO `sys_menu` VALUES (3, 1, '/system/role', '角色管理', 'system:role:list', 1, 'ep:user', 1, 'system/role/index', 0, 1, 1, '2023-11-10 00:31:44.023393', '2024-02-28 22:05:52.102649', 0, 1, NULL);
INSERT INTO `sys_menu` VALUES (4, 1, '/system/menu', '菜单管理', 'system:menu:list', 1, 'ep:menu', 2, 'system/menu/index', 0, 1, 1, '2023-11-10 00:31:44.023393', '2024-02-28 22:05:52.102649', 0, 1, NULL);
INSERT INTO `sys_menu` VALUES (5, 1, '/system/monitor', '系统监控', '', 0, 'ep:monitor', 5, '', 0, 1, 1, '2023-11-10 00:31:44.023393', '2024-02-28 22:05:52.102649', 0, 1, NULL);
INSERT INTO `sys_menu` VALUES (6, 5, '/system/monitor/online', '在线用户', 'system:online:list', 1, '', 0, 'system/monitor/online/index', 0, 1, 1, '2023-11-10 00:31:44.023393', '2024-02-28 22:05:52.102649', 0, 1, NULL);
INSERT INTO `sys_menu` VALUES (7, 5, '/sys/monitor/login-log', '登录日志', 'system:log:login:list', 1, '', 0, 'system/monitor/log/login/index', 0, 1, 1, '2023-11-10 00:31:44.023393', '2024-02-28 22:05:52.102649', 0, 1, NULL);
INSERT INTO `sys_menu` VALUES (8, 5, '/system/monitor/serve', '服务监控', 'system:serve:stat', 1, '', 4, 'system/monitor/serve/index', 0, 1, 1, '2023-11-10 00:31:44.023393', '2024-02-28 22:05:52.102649', 0, 1, NULL);
INSERT INTO `sys_menu` VALUES (9, 1, '/system/schedule', '任务调度', '', 0, 'ant-design:schedule-filled', 6, '', 0, 1, 1, '2023-11-10 00:31:44.023393', '2024-02-28 22:05:52.102649', 0, 1, NULL);
INSERT INTO `sys_menu` VALUES (10, 9, '/system/task', '任务管理', '', 1, '', 0, 'system/schedule/task/index', 0, 1, 1, '2023-11-10 00:31:44.023393', '2024-02-28 22:05:52.102649', 0, 1, NULL);
INSERT INTO `sys_menu` VALUES (11, 9, '/system/task/log', '任务日志', 'system:task:list', 1, '', 0, 'system/schedule/log/index', 0, 1, 1, '2023-11-10 00:31:44.023393', '2024-02-28 22:05:52.102649', 0, 1, NULL);
INSERT INTO `sys_menu` VALUES (12, NULL, '/document', '文档', '', 0, 'ion:tv-outline', 2, '', 0, 1, 1, '2023-11-10 00:31:44.023393', '2024-02-28 22:05:52.102649', 0, 1, NULL);
INSERT INTO `sys_menu` VALUES (14, 12, 'https://www.typeorm.org/', 'Typeorm中文文档(外链)', NULL, 1, '', 3, NULL, 0, 1, 1, '2023-11-10 00:31:44.023393', '2024-02-28 22:05:52.102649', 1, 1, NULL);
INSERT INTO `sys_menu` VALUES (15, 12, 'https://docs.nestjs.cn/', 'Nest.js中文文档(内嵌)', '', 1, '', 4, NULL, 0, 1, 1, '2023-11-10 00:31:44.023393', '2024-02-28 22:05:52.102649', 1, 2, NULL);
INSERT INTO `sys_menu` VALUES (20, 2, NULL, '新增', 'system:user:create', 2, '', 0, NULL, 0, 1, 1, '2023-11-10 00:31:44.023393', '2024-02-28 22:05:52.102649', 0, 1, NULL);
INSERT INTO `sys_menu` VALUES (21, 2, '', '删除', 'system:user:delete', 2, '', 0, '', 0, 1, 1, '2023-11-10 00:31:44.023393', '2024-02-28 22:05:52.102649', 0, 1, NULL);
INSERT INTO `sys_menu` VALUES (22, 2, '', '更新', 'system:user:update', 2, '', 0, '', 0, 1, 1, '2023-11-10 00:31:44.023393', '2024-02-28 22:05:52.102649', 0, 1, NULL);
INSERT INTO `sys_menu` VALUES (23, 2, '', '查询', 'system:user:read', 2, '', 0, '', 0, 1, 1, '2023-11-10 00:31:44.023393', '2024-02-28 22:05:52.102649', 0, 1, NULL);
INSERT INTO `sys_menu` VALUES (24, 3, '', '新增', 'system:role:create', 2, '', 0, '', 0, 1, 1, '2023-11-10 00:31:44.023393', '2024-02-28 22:05:52.102649', 0, 1, NULL);
INSERT INTO `sys_menu` VALUES (25, 3, '', '删除', 'system:role:delete', 2, '', 0, '', 0, 1, 1, '2023-11-10 00:31:44.023393', '2024-02-28 22:05:52.102649', 0, 1, NULL);
INSERT INTO `sys_menu` VALUES (26, 3, '', '修改', 'system:role:update', 2, '', 0, '', 0, 1, 1, '2023-11-10 00:31:44.023393', '2024-02-28 22:05:52.102649', 0, 1, NULL);
INSERT INTO `sys_menu` VALUES (27, 3, '', '查询', 'system:role:read', 2, '', 0, '', 0, 1, 1, '2023-11-10 00:31:44.023393', '2024-02-28 22:05:52.102649', 0, 1, NULL);
INSERT INTO `sys_menu` VALUES (28, 4, NULL, '新增', 'system:menu:create', 2, NULL, 0, NULL, 0, 1, 1, '2023-11-10 00:31:44.023393', '2024-02-28 22:05:52.102649', 0, 1, NULL);
INSERT INTO `sys_menu` VALUES (29, 4, NULL, '删除', 'system:menu:delete', 2, NULL, 0, NULL, 0, 1, 1, '2023-11-10 00:31:44.023393', '2024-02-28 22:05:52.102649', 0, 1, NULL);
INSERT INTO `sys_menu` VALUES (30, 4, '', '修改', 'system:menu:update', 2, '', 0, '', 0, 1, 1, '2023-11-10 00:31:44.023393', '2024-02-28 22:05:52.102649', 0, 1, NULL);
INSERT INTO `sys_menu` VALUES (31, 4, NULL, '查询', 'system:menu:read', 2, NULL, 0, NULL, 0, 1, 1, '2023-11-10 00:31:44.023393', '2024-02-28 22:05:52.102649', 0, 1, NULL);
INSERT INTO `sys_menu` VALUES (32, 6, '', '下线', 'system:online:kick', 2, '', 0, '', 0, 1, 1, '2023-11-10 00:31:44.023393', '2024-02-28 22:05:52.102649', 0, 1, NULL);
INSERT INTO `sys_menu` VALUES (34, 10, '', '新增', 'system:task:create', 2, '', 0, '', 0, 1, 1, '2023-11-10 00:31:44.023393', '2024-02-28 22:05:52.102649', 0, 1, NULL);
INSERT INTO `sys_menu` VALUES (35, 10, '', '删除', 'system:task:delete', 2, '', 0, '', 0, 1, 1, '2023-11-10 00:31:44.023393', '2024-02-28 22:05:52.102649', 0, 1, NULL);
INSERT INTO `sys_menu` VALUES (36, 10, '', '执行一次', 'system:task:once', 2, '', 0, '', 0, 1, 1, '2023-11-10 00:31:44.023393', '2024-02-28 22:05:52.102649', 0, 1, NULL);
INSERT INTO `sys_menu` VALUES (37, 10, '', '查询', 'system:task:read', 2, '', 0, '', 0, 1, 1, '2023-11-10 00:31:44.023393', '2024-02-28 22:05:52.102649', 0, 1, NULL);
INSERT INTO `sys_menu` VALUES (38, 10, '', '运行', 'system:task:start', 2, '', 0, '', 0, 1, 1, '2023-11-10 00:31:44.023393', '2024-02-28 22:05:52.102649', 0, 1, NULL);
INSERT INTO `sys_menu` VALUES (39, 10, '', '暂停', 'system:task:stop', 2, '', 0, '', 0, 1, 1, '2023-11-10 00:31:44.023393', '2024-02-28 22:05:52.102649', 0, 1, NULL);
INSERT INTO `sys_menu` VALUES (40, 10, '', '更新', 'system:task:update', 2, '', 0, '', 0, 1, 1, '2023-11-10 00:31:44.023393', '2024-02-28 22:05:52.102649', 0, 1, NULL);
INSERT INTO `sys_menu` VALUES (41, 7, '', '查询登录日志', 'system:log:login:list', 2, '', 0, '', 0, 1, 1, '2023-11-10 00:31:44.023393', '2024-02-28 22:05:52.102649', 0, 1, NULL);
INSERT INTO `sys_menu` VALUES (42, 7, '', '查询任务日志', 'system:log:task:list', 2, '', 0, '', 0, 1, 1, '2023-11-10 00:31:44.023393', '2024-02-28 22:05:52.102649', 0, 1, NULL);
INSERT INTO `sys_menu` VALUES (43, NULL, '/about', '关于', '', 1, 'ant-design:info-circle-outlined', 260, 'account/about', 0, 1, 1, '2023-11-10 00:31:44.023393', '2024-02-28 22:05:52.102649', 0, 1, NULL);
INSERT INTO `sys_menu` VALUES (48, NULL, '/tool', '系统工具', NULL, 0, 'ant-design:tool-outlined', 254, '', 0, 1, 1, '2023-11-10 00:31:44.023393', '2024-02-28 22:05:52.102649', 0, 1, NULL);
INSERT INTO `sys_menu` VALUES (49, 48, '/tool/email', '邮件工具', 'system:tools:email', 1, 'ant-design:send-outlined', 1, 'tool/email/index', 0, 1, 1, '2023-11-10 00:31:44.023393', '2024-02-28 22:05:52.102649', 0, 1, NULL);
INSERT INTO `sys_menu` VALUES (50, 49, NULL, '发送邮件', 'tools:email:send', 2, '', 0, NULL, 0, 1, 1, '2023-11-10 00:31:44.023393', '2024-02-28 22:05:52.102649', 0, 1, NULL);
INSERT INTO `sys_menu` VALUES (51, 48, '/tool/storage', '存储管理', 'tool:storage:list', 1, 'ant-design:appstore-outlined', 2, 'tool/storage/index', 0, 1, 1, '2023-11-10 00:31:44.023393', '2024-02-28 22:05:52.102649', 0, 1, NULL);
INSERT INTO `sys_menu` VALUES (52, 51, NULL, '文件上传', 'upload:upload', 2, '', 0, NULL, 0, 1, 1, '2023-11-10 00:31:44.023393', '2024-02-28 22:05:52.102649', 0, 1, NULL);
INSERT INTO `sys_menu` VALUES (53, 51, NULL, '文件删除', 'tool:storage:delete', 2, '', 2, NULL, 0, 1, 1, '2023-11-10 00:31:44.023393', '2024-02-28 22:05:52.102649', 0, 1, NULL);
INSERT INTO `sys_menu` VALUES (54, 2, NULL, '修改密码', 'system:user:password', 2, '', 5, NULL, 0, 1, 1, '2023-11-10 00:31:44.023393', '2024-02-28 22:05:52.102649', 0, 1, NULL);
INSERT INTO `sys_menu` VALUES (56, 1, '/system/dict-type', '字典管理', 'system:dict-type:list', 1, 'ant-design:book-outlined', 4, 'system/dict-type/index', 0, 1, 1, '2023-11-10 00:31:44.023393', '2024-02-28 22:05:52.102649', 0, 1, NULL);
INSERT INTO `sys_menu` VALUES (57, 56, NULL, '新增', 'system:dict-type:create', 2, '', 1, NULL, 0, 1, 1, '2023-11-10 00:31:44.023393', '2024-02-28 22:05:52.102649', 0, 1, NULL);
INSERT INTO `sys_menu` VALUES (58, 56, NULL, '更新', 'system:dict-type:update', 2, '', 2, NULL, 0, 1, 1, '2023-11-10 00:31:44.023393', '2024-02-28 22:05:52.102649', 0, 1, NULL);
INSERT INTO `sys_menu` VALUES (59, 56, NULL, '删除', 'system:dict-type:delete', 2, '', 3, NULL, 0, 1, 1, '2023-11-10 00:31:44.023393', '2024-02-28 22:05:52.102649', 0, 1, NULL);
INSERT INTO `sys_menu` VALUES (60, 56, NULL, '查询', 'system:dict-type:info', 2, '', 4, NULL, 0, 1, 1, '2023-11-10 00:31:44.023393', '2024-02-28 22:05:52.102649', 0, 1, NULL);
INSERT INTO `sys_menu` VALUES (61, 1, '/system/dept', '部门管理', 'system:dept:list', 1, 'ant-design:deployment-unit-outlined', 3, 'system/dept/index', 0, 1, 1, '2023-11-10 00:31:44.023393', '2024-02-28 22:05:52.102649', 0, 1, NULL);
INSERT INTO `sys_menu` VALUES (62, 61, NULL, '新增', 'system:dept:create', 2, '', 1, NULL, 0, 1, 1, '2023-11-10 00:31:44.023393', '2024-02-28 22:05:52.102649', 0, 1, NULL);
INSERT INTO `sys_menu` VALUES (63, 61, NULL, '更新', 'system:dept:update', 2, '', 2, NULL, 0, 1, 1, '2023-11-10 00:31:44.023393', '2024-02-28 22:05:52.102649', 0, 1, NULL);
INSERT INTO `sys_menu` VALUES (64, 61, NULL, '删除', 'system:dept:delete', 2, '', 3, NULL, 0, 1, 1, '2023-11-10 00:31:44.023393', '2024-02-28 22:05:52.102649', 0, 1, NULL);
INSERT INTO `sys_menu` VALUES (65, 61, NULL, '查询', 'system:dept:read', 2, '', 4, NULL, 0, 1, 1, '2023-11-10 00:31:44.023393', '2024-02-28 22:05:52.102649', 0, 1, NULL);
INSERT INTO `sys_menu` VALUES (68, 5, '/health', '健康检查', '', 1, '', 4, '', 0, 0, 1, '2023-11-10 00:31:44.023393', '2024-02-28 22:05:52.102649', 0, 1, NULL);
INSERT INTO `sys_menu` VALUES (69, 68, NULL, '网络', 'app:health:network', 2, '', 0, NULL, 0, 1, 1, '2023-11-10 00:31:44.023393', '2024-02-28 22:05:52.102649', 0, 1, NULL);
INSERT INTO `sys_menu` VALUES (70, 68, NULL, '数据库', 'app:health: database', 2, '', 0, NULL, 0, 1, 1, '2023-11-10 00:31:44.023393', '2024-02-28 22:05:52.102649', 0, 1, NULL);
INSERT INTO `sys_menu` VALUES (86, 1, '/param-config', '参数配置', 'system:param-config:list', 1, 'ep:edit', 255, 'system/param-config/index', 0, 1, 1, '2024-01-10 17:34:52.569663', '2024-01-19 02:11:27.000000', 0, 1, NULL);
INSERT INTO `sys_menu` VALUES (87, 86, NULL, '查询', 'system:param-config:read', 2, '', 255, NULL, 0, 1, 1, '2024-01-10 17:39:20.983241', '2024-02-28 22:05:52.102649', 0, 1, NULL);
INSERT INTO `sys_menu` VALUES (88, 86, NULL, '新增', 'system:param-config:create', 2, '', 255, NULL, 0, 1, 1, '2024-01-10 17:39:57.543510', '2024-02-28 22:05:52.102649', 0, 1, NULL);
INSERT INTO `sys_menu` VALUES (89, 86, NULL, '更新', 'system:param-config:update', 2, '', 255, NULL, 0, 1, 1, '2024-01-10 17:40:27.355944', '2024-02-28 22:05:52.102649', 0, 1, NULL);
INSERT INTO `sys_menu` VALUES (92, 86, NULL, '删除', 'system:param-config:delete', 2, '', 255, NULL, 0, 1, 1, '2024-01-10 17:57:32.059887', '2024-02-28 22:05:52.102649', 0, 1, NULL);
INSERT INTO `sys_menu` VALUES (107, 1, 'system/dict-item/:id', '字典项管理', 'system:dict-item:list', 1, 'ant-design:facebook-outlined', 255, 'system/dict-item/index', 0, 0, 1, '2024-01-28 09:21:17.409532', '2024-01-30 13:09:47.000000', 0, 1, '字典管理');
INSERT INTO `sys_menu` VALUES (108, 107, NULL, '新增', 'system:dict-item:create', 2, '', 255, NULL, 0, 1, 1, '2024-01-28 09:22:39.401758', '2024-02-28 22:05:52.102649', 0, 1, NULL);
INSERT INTO `sys_menu` VALUES (109, 107, NULL, '更新', 'system:dict-item:update', 2, '', 255, NULL, 0, 1, 1, '2024-01-28 09:26:43.911886', '2024-02-28 22:05:52.102649', 0, 1, NULL);
INSERT INTO `sys_menu` VALUES (110, 107, NULL, '删除', 'system:dict-item:delete', 2, '', 255, NULL, 0, 1, 1, '2024-01-28 09:27:28.535225', '2024-02-28 22:05:52.102649', 0, 1, NULL);
INSERT INTO `sys_menu` VALUES (111, 107, NULL, '查询', 'system:dict-item:info', 2, '', 255, NULL, 0, 1, 1, '2024-01-28 09:27:43.894820', '2024-02-28 22:05:52.102649', 0, 1, NULL);
INSERT INTO `sys_menu` VALUES (112, 12, 'https://antdv.com/components/overview-cn', 'antdv文档(内嵌)', NULL, 1, '', 255, NULL, 0, 1, 1, '2024-01-29 09:23:08.407723', '2024-02-28 22:05:52.102649', 1, 2, NULL);
INSERT INTO `sys_menu` VALUES (115, NULL, 'netdisk', '网盘管理', NULL, 0, 'ant-design:cloud-server-outlined', 255, NULL, 0, 1, 1, '2024-02-10 08:00:02.394616', '2024-02-28 22:05:52.102649', 0, 1, NULL);
INSERT INTO `sys_menu` VALUES (116, 115, 'manage', '文件管理', 'netdisk:manage:list', 1, '', 252, 'netdisk/manage', 0, 1, 1, '2024-02-10 08:03:49.837348', '2024-02-10 09:34:41.000000', 0, 1, NULL);
INSERT INTO `sys_menu` VALUES (117, 116, NULL, '创建文件或文件夹', 'netdisk:manage:create', 2, '', 255, NULL, 0, 1, 1, '2024-02-10 08:40:22.317257', '2024-02-28 22:05:52.102649', 0, 1, NULL);
INSERT INTO `sys_menu` VALUES (118, 116, NULL, '查看文件', 'netdisk:manage:read', 2, '', 255, NULL, 0, 1, 1, '2024-02-10 08:41:22.008015', '2024-02-28 22:05:52.102649', 0, 1, NULL);
INSERT INTO `sys_menu` VALUES (119, 116, NULL, '更新', 'netdisk:manage:update', 2, '', 255, NULL, 0, 1, 1, '2024-02-10 08:41:50.691643', '2024-02-28 22:05:52.102649', 0, 1, NULL);
INSERT INTO `sys_menu` VALUES (120, 116, NULL, '删除', 'netdisk:manage:delete', 2, '', 255, NULL, 0, 1, 1, '2024-02-10 08:42:09.480601', '2024-02-28 22:05:52.102649', 0, 1, NULL);
INSERT INTO `sys_menu` VALUES (121, 116, NULL, '获取文件上传token', 'netdisk:manage:token', 2, '', 255, NULL, 0, 1, 1, '2024-02-10 08:42:57.688104', '2024-02-28 22:05:52.102649', 0, 1, NULL);
INSERT INTO `sys_menu` VALUES (122, 116, NULL, '添加文件备注', 'netdisk:manage:mark', 2, '', 255, NULL, 0, 1, 1, '2024-02-10 08:43:40.117321', '2024-02-28 22:05:52.102649', 0, 1, NULL);
INSERT INTO `sys_menu` VALUES (123, 116, NULL, '下载文件', 'netdisk:manage:download', 2, '', 255, NULL, 0, 1, 1, '2024-02-10 08:44:01.338984', '2024-02-28 22:05:52.102649', 0, 1, NULL);
INSERT INTO `sys_menu` VALUES (124, 116, NULL, '重命名文件或文件夹', 'netdisk:manage:rename', 2, '', 255, NULL, 0, 1, 1, '2024-02-10 08:44:27.233379', '2024-02-28 22:05:52.102649', 0, 1, NULL);
INSERT INTO `sys_menu` VALUES (125, 116, NULL, '复制文件或文件夹', 'netdisk:manage:copy', 2, '', 255, NULL, 0, 1, 1, '2024-02-10 08:44:44.725391', '2024-02-28 22:05:52.102649', 0, 1, NULL);
INSERT INTO `sys_menu` VALUES (126, 116, NULL, '剪切文件或文件夹', 'netdisk:manage:cut', 2, '', 255, NULL, 0, 1, 1, '2024-02-10 08:45:21.660511', '2024-02-28 22:05:52.102649', 0, 1, NULL);
INSERT INTO `sys_menu` VALUES (127, 115, 'overview', '网盘概览', 'netdisk:overview:desc', 1, '', 254, 'netdisk/overview', 0, 1, 1, '2024-02-10 09:32:56.981190', '2024-02-10 09:34:18.000000', 0, 1, NULL);
INSERT INTO `sys_menu` VALUES (128, NULL, '/article', '博客管理', NULL, 0, 'ep:notebook', 255, NULL, 1, 1, 1, '2024-03-31 14:04:00.950028', '2024-03-31 14:23:30.000000', 0, 1, NULL);
INSERT INTO `sys_menu` VALUES (129, 128, 'manage', '文章管理', 'article:manage:list', 1, 'ep:management', 255, 'article/manage', 0, 1, 1, '2024-03-31 14:07:23.653195', '2024-03-31 14:24:30.000000', 0, 1, NULL);
INSERT INTO `sys_menu` VALUES (130, 129, NULL, '创建文章', 'article:manage:create', 2, '', 261, NULL, 1, 1, 1, '2024-04-05 21:31:00.435930', '2024-04-06 21:41:50.000000', 0, 1, NULL);
INSERT INTO `sys_menu` VALUES (131, 129, NULL, '更新', 'article:manage:update', 2, '', 255, NULL, 1, 1, 1, '2024-04-06 23:03:57.109120', '2024-04-06 23:03:57.109120', 0, 1, NULL);
INSERT INTO `sys_menu` VALUES (132, 129, NULL, '删除', 'article:manage:delete', 2, '', 255, NULL, 1, 1, 1, '2024-04-06 23:04:36.546729', '2024-04-06 23:04:36.546729', 0, 1, NULL);

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `value` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `status` tinyint NULL DEFAULT 1,
  `created_at` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `updated_at` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `default` tinyint NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `IDX_223de54d6badbe43a5490450c3`(`name` ASC) USING BTREE,
  UNIQUE INDEX `IDX_05edc0a51f41bb16b7d8137da9`(`value` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES (1, 'admin', '管理员', '超级管理员', 1, '2023-11-10 00:31:44.058463', '2024-04-06 23:05:20.000000', NULL);
INSERT INTO `sys_role` VALUES (2, 'user', '用户', '', 1, '2023-11-10 00:31:44.058463', '2024-01-30 18:44:45.000000', 1);
INSERT INTO `sys_role` VALUES (9, 'test', '测试', NULL, 1, '2024-01-23 22:46:52.408827', '2024-01-30 01:04:52.000000', NULL);

-- ----------------------------
-- Table structure for sys_role_menus
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menus`;
CREATE TABLE `sys_role_menus`  (
  `role_id` int NOT NULL,
  `menu_id` int NOT NULL,
  PRIMARY KEY (`role_id`, `menu_id`) USING BTREE,
  INDEX `IDX_35ce749b04d57e226d059e0f63`(`role_id` ASC) USING BTREE,
  INDEX `IDX_2b95fdc95b329d66c18f5baed6`(`menu_id` ASC) USING BTREE,
  CONSTRAINT `FK_2b95fdc95b329d66c18f5baed6d` FOREIGN KEY (`menu_id`) REFERENCES `sys_menu` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `FK_35ce749b04d57e226d059e0f633` FOREIGN KEY (`role_id`) REFERENCES `sys_role` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_role_menus
-- ----------------------------
INSERT INTO `sys_role_menus` VALUES (1, 1);
INSERT INTO `sys_role_menus` VALUES (1, 2);
INSERT INTO `sys_role_menus` VALUES (1, 3);
INSERT INTO `sys_role_menus` VALUES (1, 4);
INSERT INTO `sys_role_menus` VALUES (1, 5);
INSERT INTO `sys_role_menus` VALUES (1, 6);
INSERT INTO `sys_role_menus` VALUES (1, 7);
INSERT INTO `sys_role_menus` VALUES (1, 8);
INSERT INTO `sys_role_menus` VALUES (1, 9);
INSERT INTO `sys_role_menus` VALUES (1, 10);
INSERT INTO `sys_role_menus` VALUES (1, 11);
INSERT INTO `sys_role_menus` VALUES (1, 12);
INSERT INTO `sys_role_menus` VALUES (1, 14);
INSERT INTO `sys_role_menus` VALUES (1, 15);
INSERT INTO `sys_role_menus` VALUES (1, 20);
INSERT INTO `sys_role_menus` VALUES (1, 21);
INSERT INTO `sys_role_menus` VALUES (1, 22);
INSERT INTO `sys_role_menus` VALUES (1, 23);
INSERT INTO `sys_role_menus` VALUES (1, 24);
INSERT INTO `sys_role_menus` VALUES (1, 25);
INSERT INTO `sys_role_menus` VALUES (1, 26);
INSERT INTO `sys_role_menus` VALUES (1, 27);
INSERT INTO `sys_role_menus` VALUES (1, 28);
INSERT INTO `sys_role_menus` VALUES (1, 29);
INSERT INTO `sys_role_menus` VALUES (1, 30);
INSERT INTO `sys_role_menus` VALUES (1, 31);
INSERT INTO `sys_role_menus` VALUES (1, 32);
INSERT INTO `sys_role_menus` VALUES (1, 34);
INSERT INTO `sys_role_menus` VALUES (1, 35);
INSERT INTO `sys_role_menus` VALUES (1, 36);
INSERT INTO `sys_role_menus` VALUES (1, 37);
INSERT INTO `sys_role_menus` VALUES (1, 38);
INSERT INTO `sys_role_menus` VALUES (1, 39);
INSERT INTO `sys_role_menus` VALUES (1, 40);
INSERT INTO `sys_role_menus` VALUES (1, 41);
INSERT INTO `sys_role_menus` VALUES (1, 42);
INSERT INTO `sys_role_menus` VALUES (1, 43);
INSERT INTO `sys_role_menus` VALUES (1, 48);
INSERT INTO `sys_role_menus` VALUES (1, 49);
INSERT INTO `sys_role_menus` VALUES (1, 50);
INSERT INTO `sys_role_menus` VALUES (1, 51);
INSERT INTO `sys_role_menus` VALUES (1, 52);
INSERT INTO `sys_role_menus` VALUES (1, 53);
INSERT INTO `sys_role_menus` VALUES (1, 54);
INSERT INTO `sys_role_menus` VALUES (1, 56);
INSERT INTO `sys_role_menus` VALUES (1, 57);
INSERT INTO `sys_role_menus` VALUES (1, 58);
INSERT INTO `sys_role_menus` VALUES (1, 59);
INSERT INTO `sys_role_menus` VALUES (1, 60);
INSERT INTO `sys_role_menus` VALUES (1, 61);
INSERT INTO `sys_role_menus` VALUES (1, 62);
INSERT INTO `sys_role_menus` VALUES (1, 63);
INSERT INTO `sys_role_menus` VALUES (1, 64);
INSERT INTO `sys_role_menus` VALUES (1, 65);
INSERT INTO `sys_role_menus` VALUES (1, 68);
INSERT INTO `sys_role_menus` VALUES (1, 69);
INSERT INTO `sys_role_menus` VALUES (1, 70);
INSERT INTO `sys_role_menus` VALUES (1, 86);
INSERT INTO `sys_role_menus` VALUES (1, 87);
INSERT INTO `sys_role_menus` VALUES (1, 88);
INSERT INTO `sys_role_menus` VALUES (1, 89);
INSERT INTO `sys_role_menus` VALUES (1, 92);
INSERT INTO `sys_role_menus` VALUES (1, 107);
INSERT INTO `sys_role_menus` VALUES (1, 108);
INSERT INTO `sys_role_menus` VALUES (1, 109);
INSERT INTO `sys_role_menus` VALUES (1, 110);
INSERT INTO `sys_role_menus` VALUES (1, 111);
INSERT INTO `sys_role_menus` VALUES (1, 128);
INSERT INTO `sys_role_menus` VALUES (1, 129);
INSERT INTO `sys_role_menus` VALUES (1, 130);
INSERT INTO `sys_role_menus` VALUES (1, 131);
INSERT INTO `sys_role_menus` VALUES (1, 132);
INSERT INTO `sys_role_menus` VALUES (2, 1);
INSERT INTO `sys_role_menus` VALUES (2, 5);
INSERT INTO `sys_role_menus` VALUES (2, 6);
INSERT INTO `sys_role_menus` VALUES (2, 7);
INSERT INTO `sys_role_menus` VALUES (2, 8);
INSERT INTO `sys_role_menus` VALUES (2, 9);
INSERT INTO `sys_role_menus` VALUES (2, 10);
INSERT INTO `sys_role_menus` VALUES (2, 11);
INSERT INTO `sys_role_menus` VALUES (2, 12);
INSERT INTO `sys_role_menus` VALUES (2, 14);
INSERT INTO `sys_role_menus` VALUES (2, 15);
INSERT INTO `sys_role_menus` VALUES (2, 32);
INSERT INTO `sys_role_menus` VALUES (2, 34);
INSERT INTO `sys_role_menus` VALUES (2, 35);
INSERT INTO `sys_role_menus` VALUES (2, 36);
INSERT INTO `sys_role_menus` VALUES (2, 37);
INSERT INTO `sys_role_menus` VALUES (2, 38);
INSERT INTO `sys_role_menus` VALUES (2, 39);
INSERT INTO `sys_role_menus` VALUES (2, 40);
INSERT INTO `sys_role_menus` VALUES (2, 41);
INSERT INTO `sys_role_menus` VALUES (2, 42);
INSERT INTO `sys_role_menus` VALUES (2, 43);
INSERT INTO `sys_role_menus` VALUES (2, 48);
INSERT INTO `sys_role_menus` VALUES (2, 49);
INSERT INTO `sys_role_menus` VALUES (2, 50);
INSERT INTO `sys_role_menus` VALUES (2, 51);
INSERT INTO `sys_role_menus` VALUES (2, 52);
INSERT INTO `sys_role_menus` VALUES (2, 53);
INSERT INTO `sys_role_menus` VALUES (2, 56);
INSERT INTO `sys_role_menus` VALUES (2, 57);
INSERT INTO `sys_role_menus` VALUES (2, 58);
INSERT INTO `sys_role_menus` VALUES (2, 59);
INSERT INTO `sys_role_menus` VALUES (2, 60);
INSERT INTO `sys_role_menus` VALUES (2, 68);
INSERT INTO `sys_role_menus` VALUES (2, 69);
INSERT INTO `sys_role_menus` VALUES (2, 70);
INSERT INTO `sys_role_menus` VALUES (2, 86);
INSERT INTO `sys_role_menus` VALUES (2, 87);
INSERT INTO `sys_role_menus` VALUES (2, 88);
INSERT INTO `sys_role_menus` VALUES (2, 89);
INSERT INTO `sys_role_menus` VALUES (2, 92);
INSERT INTO `sys_role_menus` VALUES (2, 107);
INSERT INTO `sys_role_menus` VALUES (2, 108);
INSERT INTO `sys_role_menus` VALUES (2, 109);
INSERT INTO `sys_role_menus` VALUES (2, 110);
INSERT INTO `sys_role_menus` VALUES (2, 111);
INSERT INTO `sys_role_menus` VALUES (2, 112);
INSERT INTO `sys_role_menus` VALUES (9, 1);
INSERT INTO `sys_role_menus` VALUES (9, 2);
INSERT INTO `sys_role_menus` VALUES (9, 3);
INSERT INTO `sys_role_menus` VALUES (9, 4);
INSERT INTO `sys_role_menus` VALUES (9, 5);
INSERT INTO `sys_role_menus` VALUES (9, 6);
INSERT INTO `sys_role_menus` VALUES (9, 7);
INSERT INTO `sys_role_menus` VALUES (9, 8);
INSERT INTO `sys_role_menus` VALUES (9, 9);
INSERT INTO `sys_role_menus` VALUES (9, 10);
INSERT INTO `sys_role_menus` VALUES (9, 11);
INSERT INTO `sys_role_menus` VALUES (9, 20);
INSERT INTO `sys_role_menus` VALUES (9, 21);
INSERT INTO `sys_role_menus` VALUES (9, 22);
INSERT INTO `sys_role_menus` VALUES (9, 23);
INSERT INTO `sys_role_menus` VALUES (9, 24);
INSERT INTO `sys_role_menus` VALUES (9, 25);
INSERT INTO `sys_role_menus` VALUES (9, 26);
INSERT INTO `sys_role_menus` VALUES (9, 27);
INSERT INTO `sys_role_menus` VALUES (9, 28);
INSERT INTO `sys_role_menus` VALUES (9, 29);
INSERT INTO `sys_role_menus` VALUES (9, 30);
INSERT INTO `sys_role_menus` VALUES (9, 31);
INSERT INTO `sys_role_menus` VALUES (9, 32);
INSERT INTO `sys_role_menus` VALUES (9, 34);
INSERT INTO `sys_role_menus` VALUES (9, 35);
INSERT INTO `sys_role_menus` VALUES (9, 36);
INSERT INTO `sys_role_menus` VALUES (9, 37);
INSERT INTO `sys_role_menus` VALUES (9, 38);
INSERT INTO `sys_role_menus` VALUES (9, 39);
INSERT INTO `sys_role_menus` VALUES (9, 40);
INSERT INTO `sys_role_menus` VALUES (9, 41);
INSERT INTO `sys_role_menus` VALUES (9, 42);
INSERT INTO `sys_role_menus` VALUES (9, 54);
INSERT INTO `sys_role_menus` VALUES (9, 56);
INSERT INTO `sys_role_menus` VALUES (9, 57);
INSERT INTO `sys_role_menus` VALUES (9, 58);
INSERT INTO `sys_role_menus` VALUES (9, 59);
INSERT INTO `sys_role_menus` VALUES (9, 60);
INSERT INTO `sys_role_menus` VALUES (9, 61);
INSERT INTO `sys_role_menus` VALUES (9, 62);
INSERT INTO `sys_role_menus` VALUES (9, 63);
INSERT INTO `sys_role_menus` VALUES (9, 64);
INSERT INTO `sys_role_menus` VALUES (9, 65);
INSERT INTO `sys_role_menus` VALUES (9, 68);
INSERT INTO `sys_role_menus` VALUES (9, 69);
INSERT INTO `sys_role_menus` VALUES (9, 70);
INSERT INTO `sys_role_menus` VALUES (9, 86);
INSERT INTO `sys_role_menus` VALUES (9, 87);
INSERT INTO `sys_role_menus` VALUES (9, 88);
INSERT INTO `sys_role_menus` VALUES (9, 89);
INSERT INTO `sys_role_menus` VALUES (9, 92);

-- ----------------------------
-- Table structure for sys_task
-- ----------------------------
DROP TABLE IF EXISTS `sys_task`;
CREATE TABLE `sys_task`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `service` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `type` tinyint NOT NULL DEFAULT 0,
  `status` tinyint NOT NULL DEFAULT 1,
  `start_time` datetime NULL DEFAULT NULL,
  `end_time` datetime NULL DEFAULT NULL,
  `limit` int NULL DEFAULT 0,
  `cron` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `every` int NULL DEFAULT NULL,
  `data` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `job_opts` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `created_at` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `updated_at` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `IDX_ef8e5ab5ef2fe0ddb1428439ef`(`name` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_task
-- ----------------------------
INSERT INTO `sys_task` VALUES (2, '定时清空登录日志', 'LogClearJob.clearLoginLog', 0, 0, NULL, NULL, 0, '0 0 3 ? * 1', 0, '', '{\"count\":1,\"key\":\"__default__:2:::0 0 3 ? * 1\",\"cron\":\"0 0 3 ? * 1\",\"jobId\":2}', '定时清空登录日志', '2023-11-10 00:31:44.197779', '2024-04-08 21:47:53.000000');
INSERT INTO `sys_task` VALUES (3, '定时清空任务日志', 'LogClearJob.clearTaskLog', 0, 1, NULL, NULL, 0, '0 0 3 ? * 1', 0, '', '{\"count\":1,\"key\":\"__default__:3:::0 0 3 ? * 1\",\"cron\":\"0 0 3 ? * 1\",\"jobId\":3}', '定时清空任务日志', '2023-11-10 00:31:44.197779', '2024-04-08 23:56:26.000000');
INSERT INTO `sys_task` VALUES (4, '访问百度首页', 'HttpRequestJob.handle', 0, 0, NULL, NULL, 1, '* * * * * ?', NULL, '{\"url\":\"https://www.baidu.com\",\"method\":\"get\"}', NULL, '访问百度首页', '2023-11-10 00:31:44.197779', '2023-11-10 00:31:44.206935');
INSERT INTO `sys_task` VALUES (5, '发送邮箱', 'EmailJob.send', 0, 0, NULL, NULL, -1, '0 0 0 1 * ?', NULL, '{\"subject\":\"这是标题\",\"to\":\"zeyu57@163.com\",\"content\":\"这是正文\"}', NULL, '每月发送邮箱', '2023-11-10 00:31:44.197779', '2023-11-10 00:31:44.206935');

-- ----------------------------
-- Table structure for sys_task_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_task_log`;
CREATE TABLE `sys_task_log`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `task_id` int NULL DEFAULT NULL,
  `status` tinyint NOT NULL DEFAULT 0,
  `detail` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `consume_time` int NULL DEFAULT 0,
  `created_at` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `updated_at` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK_f4d9c36052fdb188ff5c089454b`(`task_id` ASC) USING BTREE,
  CONSTRAINT `FK_f4d9c36052fdb188ff5c089454b` FOREIGN KEY (`task_id`) REFERENCES `sys_task` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_task_log
-- ----------------------------
INSERT INTO `sys_task_log` VALUES (1, 3, 1, NULL, 0, '2024-02-05 03:06:22.037448', '2024-02-05 03:06:22.037448');
INSERT INTO `sys_task_log` VALUES (2, 2, 1, NULL, 0, '2024-02-10 09:42:21.738712', '2024-02-10 09:42:21.738712');

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `psalt` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `status` tinyint NULL DEFAULT 1,
  `qq` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `created_at` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `updated_at` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `nickname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `dept_id` int NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `IDX_9e7164b2f1ea1348bc0eb0a7da`(`username` ASC) USING BTREE,
  INDEX `FK_96bde34263e2ae3b46f011124ac`(`dept_id` ASC) USING BTREE,
  CONSTRAINT `FK_96bde34263e2ae3b46f011124ac` FOREIGN KEY (`dept_id`) REFERENCES `sys_dept` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 27 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES (1, 'admin', 'a11571e778ee85e82caae2d980952546', 'https://thirdqq.qlogo.cn/g?b=qq&s=100&nk=1743369777', '1743369777@qq.com', '10086', '管理员', 'xQYCspvFb8cAW6GG1pOoUGTLqsuUSO3d', 1, '1743369777', '2023-11-10 00:31:44.104382', '2024-01-29 09:49:43.000000', 'bqy', 1);
INSERT INTO `sys_user` VALUES (2, 'user', 'dbd89546dec743f82bb9073d6ac39361', 'https://thirdqq.qlogo.cn/g?b=qq&s=100&nk=1743369777', 'luffy@qq.com', '10010', '王路飞', 'qlovDV7pL5dPYPI3QgFFo1HH74nP6sJe', 1, '1743369777', '2023-11-10 00:31:44.104382', '2024-01-29 09:49:57.000000', 'luffy', 8);
INSERT INTO `sys_user` VALUES (8, 'developer', 'f03fa2a99595127b9a39587421d471f6', '/upload/cfd0d14459bc1a47-202402032141838.jpeg', 'nami@qq.com', '10000', '小贼猫', 'NbGM1z9Vhgo7f4dd2I7JGaGP12RidZdE', 1, '1743369777', '2023-11-10 00:31:44.104382', '2024-02-03 21:41:18.000000', '娜美', 7);

-- ----------------------------
-- Table structure for sys_user_roles
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_roles`;
CREATE TABLE `sys_user_roles`  (
  `user_id` int NOT NULL,
  `role_id` int NOT NULL,
  PRIMARY KEY (`user_id`, `role_id`) USING BTREE,
  INDEX `IDX_96311d970191a044ec048011f4`(`user_id` ASC) USING BTREE,
  INDEX `IDX_6d61c5b3f76a3419d93a421669`(`role_id` ASC) USING BTREE,
  CONSTRAINT `FK_6d61c5b3f76a3419d93a4216695` FOREIGN KEY (`role_id`) REFERENCES `sys_role` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_96311d970191a044ec048011f44` FOREIGN KEY (`user_id`) REFERENCES `sys_user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_user_roles
-- ----------------------------
INSERT INTO `sys_user_roles` VALUES (1, 1);
INSERT INTO `sys_user_roles` VALUES (2, 2);
INSERT INTO `sys_user_roles` VALUES (8, 2);

-- ----------------------------
-- Table structure for todo
-- ----------------------------
DROP TABLE IF EXISTS `todo`;
CREATE TABLE `todo`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `value` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `user_id` int NULL DEFAULT NULL,
  `status` tinyint NOT NULL DEFAULT 0,
  `created_at` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `updated_at` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK_9cb7989853c4cb7fe427db4b260`(`user_id` ASC) USING BTREE,
  CONSTRAINT `FK_9cb7989853c4cb7fe427db4b260` FOREIGN KEY (`user_id`) REFERENCES `sys_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of todo
-- ----------------------------
INSERT INTO `todo` VALUES (1, 'nest.js', NULL, 0, '2023-11-10 00:31:44.139730', '2023-11-10 00:31:44.147629');

-- ----------------------------
-- Table structure for tool_storage
-- ----------------------------
DROP TABLE IF EXISTS `tool_storage`;
CREATE TABLE `tool_storage`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `created_at` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `updated_at` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '文件名',
  `fileName` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '真实文件名',
  `ext_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `size` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `user_id` int NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 79 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tool_storage
-- ----------------------------
INSERT INTO `tool_storage` VALUES (78, '2024-02-03 21:41:16.851178', '2024-02-03 21:41:16.851178', 'cfd0d14459bc1a47-202402032141838.jpeg', 'cfd0d14459bc1a47.jpeg', 'jpeg', '/upload/cfd0d14459bc1a47-202402032141838.jpeg', '图片', '33.92 KB', 1);

-- ----------------------------
-- Table structure for user_access_tokens
-- ----------------------------
DROP TABLE IF EXISTS `user_access_tokens`;
CREATE TABLE `user_access_tokens`  (
  `id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `expired_at` datetime NOT NULL COMMENT '令牌过期时间',
  `created_at` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) COMMENT '令牌创建时间',
  `user_id` int NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK_e9d9d0c303432e4e5e48c1c3e90`(`user_id` ASC) USING BTREE,
  CONSTRAINT `FK_e9d9d0c303432e4e5e48c1c3e90` FOREIGN KEY (`user_id`) REFERENCES `sys_user` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of user_access_tokens
-- ----------------------------
INSERT INTO `user_access_tokens` VALUES ('455ebfa2-996c-4d8f-b57a-333bde12e2c5', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1aWQiOjEsInB2IjoxLCJyb2xlcyI6WyJhZG1pbiJdLCJpYXQiOjE3MTI1ODI1NjMsImV4cCI6MTcxMjY2ODk2M30.fINkelku_7GT_rAghu4-Sxek1Fm_YxkwzXfmcO1WuOA', '2024-04-09 21:22:43', '2024-04-08 21:22:41.312905', 1);
INSERT INTO `user_access_tokens` VALUES ('c4bed03f-10c1-49c4-858e-9e8c4ce538d8', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1aWQiOjEsInB2IjoxLCJyb2xlcyI6WyJhZG1pbiJdLCJpYXQiOjE3MTIzMjA3MzAsImV4cCI6MTcxMjQwNzEzMH0.oNAiLvlCqlbbPJ3RC-C8ZKX5NC-M12V7FntmY5MzGBo', '2024-04-06 20:38:51', '2024-04-05 20:38:46.738018', 1);
INSERT INTO `user_access_tokens` VALUES ('c70e55db-8b4a-41d2-9859-263a02986ddc', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1aWQiOjEsInB2IjoxLCJyb2xlcyI6WyJhZG1pbiJdLCJpYXQiOjE3MTI1OTA5MjksImV4cCI6MTcxMjY3NzMyOX0.QMQ5wtI9GkuvXvN5ObJlEaTY6i_LE4Oxq8_u4NDADzA', '2024-04-09 23:42:10', '2024-04-08 23:42:09.693559', 1);
INSERT INTO `user_access_tokens` VALUES ('d713eede-f329-43ff-80ef-842edaa4de3f', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1aWQiOjEsInB2IjoxLCJyb2xlcyI6WyJhZG1pbiJdLCJpYXQiOjE3MTIxNTY0NTksImV4cCI6MTcxMjI0Mjg1OX0.YnTILtN9yznLynw6LFhefgwNUCjAM4wxxXGQ9enzIrA', '2024-04-04 23:01:00', '2024-04-03 23:00:57.755274', 1);
INSERT INTO `user_access_tokens` VALUES ('dabab5a4-0db8-4692-a485-4b058df5c997', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1aWQiOjEsInB2IjoxLCJyb2xlcyI6WyJhZG1pbiJdLCJpYXQiOjE3MTI0MTA3MjUsImV4cCI6MTcxMjQ5NzEyNX0.1n-CFngXhvJ1WyW6uHK11Ia8gPfTUy4htELbzDiH7O4', '2024-04-07 21:38:45', '2024-04-06 21:38:45.458093', 1);

-- ----------------------------
-- Table structure for user_refresh_tokens
-- ----------------------------
DROP TABLE IF EXISTS `user_refresh_tokens`;
CREATE TABLE `user_refresh_tokens`  (
  `id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `expired_at` datetime NOT NULL COMMENT '令牌过期时间',
  `created_at` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) COMMENT '令牌创建时间',
  `accessTokenId` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `REL_1dfd080c2abf42198691b60ae3`(`accessTokenId` ASC) USING BTREE,
  CONSTRAINT `FK_1dfd080c2abf42198691b60ae39` FOREIGN KEY (`accessTokenId`) REFERENCES `user_access_tokens` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of user_refresh_tokens
-- ----------------------------
INSERT INTO `user_refresh_tokens` VALUES ('0af9e820-73e9-4102-a84f-e4f3384127f3', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1dWlkIjoidmhhYVRIdFNkNzJWV1VaTEVZOXlRIiwiaWF0IjoxNzEyNTgyNTYzLCJleHAiOjE3MTI2Njg5NjN9.UD9fsxRKTSpFQvsq8g7TxwiteruDABy12daflQ6owjc', '2024-05-08 21:22:43', '2024-04-08 21:22:41.336469', '455ebfa2-996c-4d8f-b57a-333bde12e2c5');
INSERT INTO `user_refresh_tokens` VALUES ('32998f2c-6d97-4ac3-a063-167c54384efc', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1dWlkIjoiOV9IeVQyeUNBVG5pcGZGUUpEcnpiIiwiaWF0IjoxNzEyNTkwOTI5LCJleHAiOjE3MTI2NzczMjl9.f-dRJu49g4gRui2adNBRjPUQzXiXGddIqlLC8H-lG78', '2024-05-08 23:42:10', '2024-04-08 23:42:09.716041', 'c70e55db-8b4a-41d2-9859-263a02986ddc');
INSERT INTO `user_refresh_tokens` VALUES ('35e3f1e7-7c79-45c4-920b-a6450d6bd790', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1dWlkIjoib2hEbjFaWmVQRElocUV4WUI1NmltIiwiaWF0IjoxNzEyMTU2NDU5LCJleHAiOjE3MTIyNDI4NTl9.7HvWsLmZzIy1kKa7ZKE5M-i2p-jjXBVkJkjQsi2_8lw', '2024-05-03 23:01:00', '2024-04-03 23:00:57.781097', 'd713eede-f329-43ff-80ef-842edaa4de3f');
INSERT INTO `user_refresh_tokens` VALUES ('389218ee-d914-4ddd-9074-1ba5b01631ae', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1dWlkIjoiMWJLUmJGSjhISW83b21JZm9SNWdKIiwiaWF0IjoxNzEyMzIwNzMwLCJleHAiOjE3MTI0MDcxMzB9.ZMulMEgGWYt48igduk3MbcGEYHYvdEm4EwlgbUy2DUY', '2024-05-05 20:38:51', '2024-04-05 20:38:46.760689', 'c4bed03f-10c1-49c4-858e-9e8c4ce538d8');
INSERT INTO `user_refresh_tokens` VALUES ('74cf53b4-c5b8-42f3-bb49-3ec6d772ee7a', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1dWlkIjoiVDlrbHZDRVYtM2NrdzRnTHBxc2xxIiwiaWF0IjoxNzEyNDEwNzI1LCJleHAiOjE3MTI0OTcxMjV9.u0LPY7esiazZ2XUIZ8kKN63D4_ogsrJmbKLqqLo12OY', '2024-05-06 21:38:45', '2024-04-06 21:38:45.485166', 'dabab5a4-0db8-4692-a485-4b058df5c997');

SET FOREIGN_KEY_CHECKS = 1;
