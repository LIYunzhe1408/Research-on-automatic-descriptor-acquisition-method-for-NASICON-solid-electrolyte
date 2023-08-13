
SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for institution_info
-- ----------------------------
DROP TABLE IF EXISTS `sys_institution_info`;
CREATE TABLE `sys_institution_info` (
  `institution_id` varchar(32) DEFAULT NULL COMMENT '机构编号',
  `institution_name` varchar(255) DEFAULT NULL COMMENT '机构名称',
  `institution_detail` varchar(255) DEFAULT NULL COMMENT '机构详情',
  `institution_active` varchar(1) DEFAULT NULL COMMENT '0停1用'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='机构信息表';

-- ----------------------------
-- Records of institution_info
-- ----------------------------
INSERT INTO `sys_institution_info` VALUES ('1', '上海大学', '学校', '1');
INSERT INTO `sys_institution_info` VALUES ('0', '开发机构', 'xxx', '1');

-- ----------------------------
-- Table structure for log_info
-- ----------------------------
DROP TABLE IF EXISTS `sys_log_info`;
CREATE TABLE `sys_log_info` (
  `op_time` varchar(255) DEFAULT NULL COMMENT '操作时间',
  `op_user` varchar(255) DEFAULT NULL COMMENT '操作用户',
  `op_type` varchar(255) DEFAULT NULL COMMENT '操作种类',
  `op_describe` varchar(255) DEFAULT NULL COMMENT '操作描述',
  `op_instatution_id` varchar(255) DEFAULT NULL COMMENT '操作机构编号',
  `op_login_no` varchar(255) DEFAULT NULL COMMENT '操作人编号',
  `op_url` varchar(255) DEFAULT NULL COMMENT '请求url'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of log_info
-- ----------------------------
INSERT INTO `sys_log_info` VALUES ('2022-01-03 12:34:44', '11323124', 'user', '登录', '1', '222', '/user/login');
INSERT INTO `sys_log_info` VALUES ('2022-01-03 12:34:44', '11323124', 'user', '获取目录信息', '1', '222', '/user/getMenuData');
INSERT INTO `sys_log_info` VALUES ('2022-01-03 12:34:45', '11323124', 'user', '查看用户信息', '1', '222', '/user/getUserInfo');

-- ----------------------------
-- Table structure for menu_info
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu_info`;
CREATE TABLE `sys_menu_info` (
  `menu_id` varchar(10) DEFAULT NULL COMMENT '菜单编号',
  `menu_level` varchar(2) DEFAULT NULL COMMENT '菜单层级',
  `menu_name` varchar(255) DEFAULT NULL COMMENT '菜单名',
  `menu_father_id` varchar(10) DEFAULT NULL COMMENT '父菜单ID，一级菜单为0',
  `menu_active` varchar(1) DEFAULT NULL COMMENT '1激活0停用',
  `menu_path` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='菜单信息表';

-- ----------------------------
-- Records of menu_info
-- ----------------------------
INSERT INTO `sys_menu_info` VALUES ('1', '1', '系统管理', '0', '1', '');
INSERT INTO `sys_menu_info` VALUES ('11', '2', '机构管理', '1', '1', '/institutionManage');
INSERT INTO `sys_menu_info` VALUES ('12', '2', '用户管理', '1', '1', '/userManage');
INSERT INTO `sys_menu_info` VALUES ('13', '2', '用户信息', '1', '1', '/userInfo');
INSERT INTO `sys_menu_info` VALUES ('14', '2', '系统日志', '1', '1', '/logInfo');
INSERT INTO `sys_menu_info` VALUES ('15', '2', '菜单管理', '1', '1', '/menuManage');
INSERT INTO `sys_menu_info` VALUES ('16', '2', '操作管理', '1', '1', '/opManage');
INSERT INTO `sys_menu_info` VALUES ('2', '1', '样例', '0', '1', '');
INSERT INTO `sys_menu_info` VALUES ('21', '2', '专利上传', '2', '1', '/addPatent');
INSERT INTO `sys_menu_info` VALUES ('22', '2', '专利列表', '2', '1', '/patentInfo');

-- ----------------------------
-- Table structure for op_info
-- ----------------------------
DROP TABLE IF EXISTS `sys_op_info`;
CREATE TABLE `sys_op_info` (
  `op_url` varchar(255) DEFAULT NULL COMMENT '操作请求url',
  `op_type` varchar(255) DEFAULT NULL COMMENT '操作分属模块、操作类型',
  `op_describe` varchar(255) DEFAULT NULL COMMENT '操作简述'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='操作信息表';

-- ----------------------------
-- Records of op_info
-- ----------------------------
INSERT INTO `sys_op_info` VALUES ('/user/login', 'user', '登录');
INSERT INTO `sys_op_info` VALUES ('/user/getMenuData', 'user', '获取目录信息');
INSERT INTO `sys_op_info` VALUES ('/user/getUserInfo', 'user', '查看用户信息');
INSERT INTO `sys_op_info` VALUES ('/user/changeUserInfo', 'user', '更改用户信息');
INSERT INTO `sys_op_info` VALUES ('/user/resetPassword', 'user', '重置密码');
INSERT INTO `sys_op_info` VALUES ('/user/getInstitutionInfo', 'user', '查看机构信息');
INSERT INTO `sys_op_info` VALUES ('/user/institutionManagers', 'user', '查看机构管理员');
INSERT INTO `sys_op_info` VALUES ('/user/changeInstitutionDetail', 'user', '更改用户信息');
INSERT INTO `sys_op_info` VALUES ('/user/changeInstitutionStatus', 'user', '更改用户状态');
INSERT INTO `sys_op_info` VALUES ('/user/addNewInstitution', 'user', '新增机构');
INSERT INTO `sys_op_info` VALUES ('/user/changeUserStatus', 'user', '更改用户状态');
INSERT INTO `sys_op_info` VALUES ('/user/addNewManager', 'user', '新增机构管理员');
INSERT INTO `sys_op_info` VALUES ('/user/getOpLogInfo', 'user', '查看用户操作日志');
INSERT INTO `sys_op_info` VALUES ('/user/signOut', 'user', '登出');
INSERT INTO `sys_op_info` VALUES ('/user/getMenuManageData', 'user', '查看菜单管理');
INSERT INTO `sys_op_info` VALUES ('/user/addNewMenuMeb', 'user', '新增子菜单');
INSERT INTO `sys_op_info` VALUES ('/user/changeMenuStatus', 'user', '更改菜单状态');
INSERT INTO `sys_op_info` VALUES ('/user/getOPInfo', 'user', '查看操作功能信息');
INSERT INTO `sys_op_info` VALUES ('/user/addNewOP', 'user', '新增操作功能信息');
INSERT INTO `sys_op_info` VALUES ('/user/getInstitutionMenu', 'user', '查询机构可访问目录数据');
INSERT INTO `sys_op_info` VALUES ('/user/updateInstitutionMenu', 'user', '更新机构可访问目录数据');
INSERT INTO `sys_op_info` VALUES ('/user/getUserList', 'user', '查询机构普通用户列表');
INSERT INTO `sys_op_info` VALUES ('/user/addNewUser', 'user', '新增机构普通用户');
INSERT INTO `sys_op_info` VALUES ('/user/getUserMenu', 'user', '查询机构普通用户可访问目录');
INSERT INTO `sys_op_info` VALUES ('/user/updateUserMenu', 'user', '更新机构普通用户可访问目录');
INSERT INTO `sys_op_info` VALUES ('/user/addNewFMenuMeb', 'user', '新增一级菜单');

-- ----------------------------
-- Table structure for parameter_info
-- ----------------------------
DROP TABLE IF EXISTS `parameter_info`;
CREATE TABLE `parameter_info` (
  `para_type_en` varchar(255) DEFAULT NULL COMMENT '参数类型-英',
  `para_type_cn` varchar(255) DEFAULT NULL COMMENT '参数类型-中',
  `para_value` varchar(32) DEFAULT NULL COMMENT '参数值',
  `para_info` varchar(255) DEFAULT NULL COMMENT '参数信息'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='参数信息表';

-- ----------------------------
-- Records of parameter_info
-- ----------------------------

-- ----------------------------
-- Table structure for puser_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_puser_menu`;
CREATE TABLE `sys_puser_menu` (
  `login_no` varchar(20) DEFAULT NULL COMMENT '统一认证号',
  `menu_id` varchar(10) DEFAULT NULL COMMENT '菜单号'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户菜单对照表\r\n机构普通用户可访问模块菜单';

-- ----------------------------
-- Records of puser_menu
-- ----------------------------
INSERT INTO `sys_puser_menu` VALUES ('111111', '1');
INSERT INTO `sys_puser_menu` VALUES ('111111', '13');
INSERT INTO `sys_puser_menu` VALUES ('111111', '14');

-- ----------------------------
-- Table structure for role_info
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_info`;
CREATE TABLE `sys_role_info` (
  `role_id` varchar(32) DEFAULT NULL COMMENT '角色编号',
  `role_name` varchar(255) DEFAULT NULL COMMENT '角色名'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色信息表';

-- ----------------------------
-- Records of role_info
-- ----------------------------
INSERT INTO `sys_role_info` VALUES ('1', '开发人员');
INSERT INTO `sys_role_info` VALUES ('2', '机构管理员');
INSERT INTO `sys_role_info` VALUES ('3', '机构普通用户');

-- ----------------------------
-- Table structure for role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu` (
  `role_id` varchar(2) DEFAULT NULL COMMENT '角色号',
  `menu_id` varchar(10) DEFAULT NULL COMMENT '菜单号',
  `role_institution_id` varchar(32) DEFAULT NULL COMMENT '机构号'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色菜单对照表\r\n开发人员 可 机构管理-机构用户管理-可访问模块（即修改机构可用模块）\r\n机构管理人员 可 用户管理-可访问模块（即修改普通用户可访问模块）';

-- ----------------------------
-- Records of role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES ('1', '1', '0');
INSERT INTO `sys_role_menu` VALUES ('1', '11', '0');
INSERT INTO `sys_role_menu` VALUES ('1', '13', '0');
INSERT INTO `sys_role_menu` VALUES ('1', '14', '0');
INSERT INTO `sys_role_menu` VALUES ('1', '15', '0');
INSERT INTO `sys_role_menu` VALUES ('1', '16', '0');
INSERT INTO `sys_role_menu` VALUES ('2', '1', '1');
INSERT INTO `sys_role_menu` VALUES ('2', '12', '1');
INSERT INTO `sys_role_menu` VALUES ('2', '13', '1');
INSERT INTO `sys_role_menu` VALUES ('2', '14', '1');
INSERT INTO `sys_role_menu` VALUES ('1', '2', '0');
INSERT INTO `sys_role_menu` VALUES ('1', '21', '0');
INSERT INTO `sys_role_menu` VALUES ('1', '22', '0');

-- ----------------------------
-- Table structure for spring_session
-- ----------------------------
DROP TABLE IF EXISTS `spring_session`;
CREATE TABLE `spring_session` (
  `PRIMARY_ID` char(36) NOT NULL,
  `SESSION_ID` char(36) NOT NULL,
  `CREATION_TIME` bigint(20) NOT NULL,
  `LAST_ACCESS_TIME` bigint(20) NOT NULL,
  `MAX_INACTIVE_INTERVAL` int(11) NOT NULL,
  `EXPIRY_TIME` bigint(20) NOT NULL,
  `PRINCIPAL_NAME` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`PRIMARY_ID`),
  UNIQUE KEY `SPRING_SESSION_IX1` (`SESSION_ID`),
  KEY `SPRING_SESSION_IX2` (`EXPIRY_TIME`),
  KEY `SPRING_SESSION_IX3` (`PRINCIPAL_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of spring_session
-- ----------------------------

-- ----------------------------
-- Table structure for spring_session_attributes
-- ----------------------------
DROP TABLE IF EXISTS `spring_session_attributes`;
CREATE TABLE `spring_session_attributes` (
  `SESSION_PRIMARY_ID` char(36) NOT NULL,
  `ATTRIBUTE_NAME` varchar(200) NOT NULL,
  `ATTRIBUTE_BYTES` blob NOT NULL,
  PRIMARY KEY (`SESSION_PRIMARY_ID`,`ATTRIBUTE_NAME`),
  CONSTRAINT `SPRING_SESSION_ATTRIBUTES_FK` FOREIGN KEY (`SESSION_PRIMARY_ID`) REFERENCES `spring_session` (`PRIMARY_ID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of spring_session_attributes
-- ----------------------------

-- ----------------------------
-- Table structure for user_info
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_info`;
CREATE TABLE `sys_user_info` (
  `user_id` varchar(32) DEFAULT NULL COMMENT '唯一标识',
  `login_no` varchar(20) NOT NULL COMMENT '登录认证号(唯一)',
  `user_name` varchar(30) DEFAULT NULL COMMENT '用户名',
  `password` varchar(32) DEFAULT NULL COMMENT '密码',
  `role_id` varchar(32) DEFAULT NULL COMMENT '角色号',
  `user_info` varchar(255) DEFAULT NULL COMMENT '用户信息',
  `user_institution_id` varchar(32) DEFAULT NULL COMMENT '归属机构编号',
  `user_active` varchar(1) DEFAULT NULL COMMENT '1-激活，0-注销'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户信息表';

-- ----------------------------
-- Records of user_info
-- ----------------------------
INSERT INTO `sys_user_info` VALUES (null, '123', 'yuziyi', '698d51a19d8a121ce581499d7b701668', '1', '开发人员yzy！', '0', '1');
INSERT INTO `sys_user_info` VALUES (null, '111', '上海大学管理员', 'e10adc3949ba59abbe56e057f20f883e', '2', '', '1', '1');
INSERT INTO `sys_user_info` VALUES (null, '111111', '上大普通用户1', 'e10adc3949ba59abbe56e057f20f883e', '3', '', '1', '1');