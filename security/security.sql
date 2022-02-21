/*
 Navicat Premium Data Transfer

 Source Server         : 腾讯云mysql-2025年3月过期
 Source Server Type    : MySQL
 Source Server Version : 80024
 Source Host           : 140.143.239.2:3307
 Source Schema         : security

 Target Server Type    : MySQL
 Target Server Version : 80024
 File Encoding         : 65001

 Date: 26/10/2021 02:01:27
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for persistent_logins
-- ----------------------------
DROP TABLE IF EXISTS `persistent_logins`;
CREATE TABLE `persistent_logins`  (
  `username` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `series` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `token` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `last_used` timestamp NOT NULL,
  PRIMARY KEY (`series`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of persistent_logins
-- ----------------------------
INSERT INTO `persistent_logins` VALUES ('wangwu', 'bXu2hbXJtRpmoaSNBeBl+Q==', 'MhuWLAg+zwpdugYkYWsmLg==', '2021-05-04 11:28:22');

-- ----------------------------
-- Table structure for t_admin
-- ----------------------------
DROP TABLE IF EXISTS `t_admin`;
CREATE TABLE `t_admin`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `loginacct` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `userpswd` char(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `createtime` char(19) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 16 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_admin
-- ----------------------------
INSERT INTO `t_admin` VALUES (1, 'superadmin', 'e10adc3949ba59abbe56e057f20f883e', '超级管理员', 'admin@atguigu.com', '2019-01-12 17:18:00');
INSERT INTO `t_admin` VALUES (3, 'lisi', 'e10adc3949ba59abbe56e057f20f883e', 'lisi', 'lisi@atguigu.com', '2019-01-12 17:18:00');
INSERT INTO `t_admin` VALUES (4, 'wangwu', '$2a$10$CDOuIuNV.uvCdVUM4Z6gtOL2t9erag2U..unte1nzalVOJ6bfXGU6', 'wangwu', 'wangwu@163.com', '2019-01-12 17:18:00');
INSERT INTO `t_admin` VALUES (8, 'zhangsan', '123456', 'zhangsan', 'aaa@atguigu.com', '2019-01-12 17:18:00');
INSERT INTO `t_admin` VALUES (12, 'xxxx', 'e10adc3949ba59abbe56e057f20f883e', 'xxxx', 'xxxx@163.com', '2019-01-21 10:54:36');
INSERT INTO `t_admin` VALUES (13, 'yy', '$2a$10$LDUykcKoOIVYnHHy3oWpPOJFDmRfWlBoZhzW/lnglGECCjhR6PkC6', 'yy', 'yy@atguigu.com', '2019-01-21 10:56:49');
INSERT INTO `t_admin` VALUES (14, 'qqq', '$2a$10$LDUykcKoOIVYnHHy3oWpPOJFDmRfWlBoZhzW/lnglGECCjhR6PkC6', 'qqqq', 'qqq@atguigu.com', '2019-01-21 11:00:01');
INSERT INTO `t_admin` VALUES (15, 'zhangwuji', '$2a$10$LDUykcKoOIVYnHHy3oWpPOJFDmRfWlBoZhzW/lnglGECCjhR6PkC6', '测试中文123', 'qqq654@atguigu.com', '2019-01-21 11:15:53');

-- ----------------------------
-- Table structure for t_admin_role
-- ----------------------------
DROP TABLE IF EXISTS `t_admin_role`;
CREATE TABLE `t_admin_role`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `adminid` int NULL DEFAULT NULL,
  `roleid` int NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK_Reference_1`(`adminid`) USING BTREE,
  INDEX `FK_Reference_2`(`roleid`) USING BTREE,
  CONSTRAINT `FK_Reference_1` FOREIGN KEY (`adminid`) REFERENCES `t_admin` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_Reference_2` FOREIGN KEY (`roleid`) REFERENCES `t_role` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 15 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_admin_role
-- ----------------------------
INSERT INTO `t_admin_role` VALUES (2, 1, 2);
INSERT INTO `t_admin_role` VALUES (9, 1, 4);
INSERT INTO `t_admin_role` VALUES (11, 1, 8);
INSERT INTO `t_admin_role` VALUES (12, 13, 1);
INSERT INTO `t_admin_role` VALUES (13, 13, 2);
INSERT INTO `t_admin_role` VALUES (14, 15, 12);

-- ----------------------------
-- Table structure for t_menu
-- ----------------------------
DROP TABLE IF EXISTS `t_menu`;
CREATE TABLE `t_menu`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `pid` int NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `icon` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 24 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_menu
-- ----------------------------
INSERT INTO `t_menu` VALUES (1, 0, '控制面板', 'glyphicon glyphicon-dashboard', 'main.html');
INSERT INTO `t_menu` VALUES (2, 0, '权限管理', 'glyphicon glyphicon glyphicon-tasks', NULL);
INSERT INTO `t_menu` VALUES (3, 2, '用户维护', 'glyphicon glyphicon-user', 'admin/index.html');
INSERT INTO `t_menu` VALUES (4, 2, '角色维护', 'glyphicon glyphicon-king', 'role/index.html');
INSERT INTO `t_menu` VALUES (5, 2, '权限维护', 'glyphicon glyphicon-lock', 'permission/index.html');
INSERT INTO `t_menu` VALUES (6, 2, '菜单维护', 'glyphicon glyphicon-th-list', 'menu/index.html');
INSERT INTO `t_menu` VALUES (7, 0, '业务审核', 'glyphicon glyphicon-ok', NULL);
INSERT INTO `t_menu` VALUES (8, 7, '实名认证审核', 'glyphicon glyphicon-check', 'auth_cert/index.html');
INSERT INTO `t_menu` VALUES (9, 7, '广告审核', 'glyphicon glyphicon-check', 'auth_adv/index.html');
INSERT INTO `t_menu` VALUES (10, 7, '项目审核', 'glyphicon glyphicon-check', 'auth_project/index.html');
INSERT INTO `t_menu` VALUES (11, 0, '业务管理', 'glyphicon glyphicon-th-large', NULL);
INSERT INTO `t_menu` VALUES (12, 11, '资质维护', 'glyphicon glyphicon-picture', 'cert/index.html');
INSERT INTO `t_menu` VALUES (13, 11, '分类管理', 'glyphicon glyphicon-equalizer', 'certtype/index.html');
INSERT INTO `t_menu` VALUES (14, 11, '流程管理', 'glyphicon glyphicon-random', 'process/index.html');
INSERT INTO `t_menu` VALUES (15, 11, '广告管理', 'glyphicon glyphicon-hdd', 'advert/index.html');
INSERT INTO `t_menu` VALUES (16, 11, '消息模板', 'glyphicon glyphicon-comment', 'message/index.html');
INSERT INTO `t_menu` VALUES (17, 11, '项目分类', 'glyphicon glyphicon-list', 'projectType/index.html');
INSERT INTO `t_menu` VALUES (18, 11, '项目标签', 'glyphicon glyphicon-tags', 'tag/index.html');
INSERT INTO `t_menu` VALUES (19, 0, '参数管理', 'glyphicon glyphicon-list-alt', 'param/index.html');

-- ----------------------------
-- Table structure for t_permission
-- ----------------------------
DROP TABLE IF EXISTS `t_permission`;
CREATE TABLE `t_permission`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `icon` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `pid` int NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 23 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_permission
-- ----------------------------
INSERT INTO `t_permission` VALUES (1, NULL, '用户模块', 'glyphicon glyphicon-user', 0);
INSERT INTO `t_permission` VALUES (2, 'user:add', '新增', 'glyphicon glyphicon-plus', 1);
INSERT INTO `t_permission` VALUES (3, 'user:delete', '删除', 'glyphicon glyphicon-remove', 1);
INSERT INTO `t_permission` VALUES (4, 'user:update', '更新', 'glyphicon glyphicon-pencil', 1);
INSERT INTO `t_permission` VALUES (5, 'user:get', '查询', 'glyphicon glyphicon-zoom-in', 1);
INSERT INTO `t_permission` VALUES (6, 'user:assign:role', '授予角色', 'glyphicon glyphicon-user', 1);
INSERT INTO `t_permission` VALUES (7, NULL, '角色模块', 'glyphicon glyphicon-heart', 0);
INSERT INTO `t_permission` VALUES (8, 'role:add', '新增', 'glyphicon glyphicon-plus', 7);
INSERT INTO `t_permission` VALUES (9, 'role:delete', '删除', 'glyphicon glyphicon-remove', 7);
INSERT INTO `t_permission` VALUES (10, 'role:get', '查询', 'glyphicon glyphicon-zoom-in', 7);
INSERT INTO `t_permission` VALUES (11, 'role:update', '修改', 'glyphicon glyphicon-pencil', 7);
INSERT INTO `t_permission` VALUES (12, 'role:assign:permission', '授予权限', 'glyphicon glyphicon-user', 7);
INSERT INTO `t_permission` VALUES (13, NULL, '菜单模块', 'glyphicon glyphicon-th-list', 0);
INSERT INTO `t_permission` VALUES (14, 'menu:add', '新增', 'glyphicon glyphicon-plus', 13);
INSERT INTO `t_permission` VALUES (15, 'menu:delete', '删除', 'glyphicon glyphicon-remove', 13);
INSERT INTO `t_permission` VALUES (16, 'menu:update', '修改', 'glyphicon glyphicon-pencil', 13);
INSERT INTO `t_permission` VALUES (17, 'menu:get', '查询', 'glyphicon glyphicon-zoom-in', 13);
INSERT INTO `t_permission` VALUES (18, 'menu:assign:permission', '授予权限', 'glyphicon glyphicon-user', 13);
INSERT INTO `t_permission` VALUES (21, 'xuetu:luohan', '罗汉拳', 'glyphicon glyphicon-user', 1);
INSERT INTO `t_permission` VALUES (22, 'xuetu:wudang', '武当长拳', 'glyphicon glyphicon-user', 1);

-- ----------------------------
-- Table structure for t_permission_menu
-- ----------------------------
DROP TABLE IF EXISTS `t_permission_menu`;
CREATE TABLE `t_permission_menu`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `menuid` int NULL DEFAULT NULL,
  `permissionid` int NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK_Reference_10`(`menuid`) USING BTREE,
  INDEX `FK_Reference_9`(`permissionid`) USING BTREE,
  CONSTRAINT `FK_Reference_10` FOREIGN KEY (`menuid`) REFERENCES `t_menu` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_Reference_9` FOREIGN KEY (`permissionid`) REFERENCES `t_permission` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 19 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_permission_menu
-- ----------------------------
INSERT INTO `t_permission_menu` VALUES (7, 2, 1);
INSERT INTO `t_permission_menu` VALUES (8, 2, 2);
INSERT INTO `t_permission_menu` VALUES (9, 2, 3);
INSERT INTO `t_permission_menu` VALUES (10, 2, 4);
INSERT INTO `t_permission_menu` VALUES (11, 2, 5);
INSERT INTO `t_permission_menu` VALUES (12, 2, 6);
INSERT INTO `t_permission_menu` VALUES (13, 2, 7);
INSERT INTO `t_permission_menu` VALUES (14, 2, 8);
INSERT INTO `t_permission_menu` VALUES (15, 2, 9);
INSERT INTO `t_permission_menu` VALUES (16, 2, 10);
INSERT INTO `t_permission_menu` VALUES (17, 2, 11);
INSERT INTO `t_permission_menu` VALUES (18, 2, 12);

-- ----------------------------
-- Table structure for t_role
-- ----------------------------
DROP TABLE IF EXISTS `t_role`;
CREATE TABLE `t_role`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 44 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_role
-- ----------------------------
INSERT INTO `t_role` VALUES (1, 'PM - 项目经理');
INSERT INTO `t_role` VALUES (2, 'SE - 软件工程师');
INSERT INTO `t_role` VALUES (3, 'PG - 程序员');
INSERT INTO `t_role` VALUES (4, 'TL - 组长');
INSERT INTO `t_role` VALUES (5, 'GL - 组长');
INSERT INTO `t_role` VALUES (6, 'QA - 品质保证');
INSERT INTO `t_role` VALUES (7, 'QC - 品质控制');
INSERT INTO `t_role` VALUES (8, 'SA - 软件架构师');
INSERT INTO `t_role` VALUES (9, 'CMO / CMS - 配置管理员');
INSERT INTO `t_role` VALUES (10, '测试工程师');
INSERT INTO `t_role` VALUES (11, '审批人员');
INSERT INTO `t_role` VALUES (12, '学徒');

-- ----------------------------
-- Table structure for t_role_permission
-- ----------------------------
DROP TABLE IF EXISTS `t_role_permission`;
CREATE TABLE `t_role_permission`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `roleid` int NULL DEFAULT NULL,
  `permissionid` int NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK_Reference_3`(`roleid`) USING BTREE,
  INDEX `FK_Reference_4`(`permissionid`) USING BTREE,
  CONSTRAINT `FK_Reference_3` FOREIGN KEY (`roleid`) REFERENCES `t_role` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_Reference_4` FOREIGN KEY (`permissionid`) REFERENCES `t_permission` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 15 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_role_permission
-- ----------------------------
INSERT INTO `t_role_permission` VALUES (7, 1, 1);
INSERT INTO `t_role_permission` VALUES (8, 1, 2);
INSERT INTO `t_role_permission` VALUES (9, 1, 6);
INSERT INTO `t_role_permission` VALUES (10, 1, 13);
INSERT INTO `t_role_permission` VALUES (11, 1, 16);
INSERT INTO `t_role_permission` VALUES (12, 1, 17);
INSERT INTO `t_role_permission` VALUES (13, 12, 21);
INSERT INTO `t_role_permission` VALUES (14, 12, 22);

SET FOREIGN_KEY_CHECKS = 1;
