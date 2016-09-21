/*
Navicat MySQL Data Transfer

Source Server         : 本机数据库
Source Server Version : 50714
Source Host           : localhost:3306
Source Database       : jhac_dev2

Target Server Type    : MYSQL
Target Server Version : 50714
File Encoding         : 65001

Date: 2016-09-07 16:24:38
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for account
-- ----------------------------
DROP TABLE IF EXISTS `account`;
CREATE TABLE `account` (
  `a_id` int(10) NOT NULL AUTO_INCREMENT,
  `a_amount` decimal(10,2) DEFAULT NULL,
  `a_remark` varchar(50) DEFAULT NULL,
  `a_date` datetime DEFAULT NULL,
  PRIMARY KEY (`a_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of account
-- ----------------------------

-- ----------------------------
-- Table structure for card
-- ----------------------------
DROP TABLE IF EXISTS `card`;
CREATE TABLE `card` (
  `card_id` int(10) NOT NULL AUTO_INCREMENT,
  `card_no` varchar(30) DEFAULT NULL,
  `card_bank` varchar(30) DEFAULT NULL,
  `card_type` varchar(10) DEFAULT NULL,
  `card_add_date` datetime DEFAULT NULL,
  PRIMARY KEY (`card_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of card
-- ----------------------------

-- ----------------------------
-- Table structure for cash
-- ----------------------------
DROP TABLE IF EXISTS `cash`;
CREATE TABLE `cash` (
  `cash_id` int(10) NOT NULL AUTO_INCREMENT,
  `cash_amount` decimal(10,2) DEFAULT NULL,
  `cash_card_id` int(10) DEFAULT NULL,
  `cash_fate` double(5,5) DEFAULT NULL,
  `cash_date` datetime DEFAULT NULL,
  PRIMARY KEY (`cash_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cash
-- ----------------------------

-- ----------------------------
-- Table structure for jhac_admin
-- ----------------------------
DROP TABLE IF EXISTS `jhac_admin`;
CREATE TABLE `jhac_admin` (
  `admin_id` int(10) NOT NULL AUTO_INCREMENT,
  `admin_username` varchar(40) DEFAULT NULL,
  `admin_password` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`admin_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of jhac_admin
-- ----------------------------
INSERT INTO `jhac_admin` VALUES ('1', 'admin', '21232f297a57a5a743894a0e4a801fc3');

-- ----------------------------
-- Table structure for jhac_api
-- ----------------------------
DROP TABLE IF EXISTS `jhac_api`;
CREATE TABLE `jhac_api` (
  `a_id` int(10) NOT NULL AUTO_INCREMENT,
  `a_name` varchar(50) DEFAULT NULL,
  `a_url` varchar(100) DEFAULT NULL,
  `a_type` varchar(20) DEFAULT NULL,
  `a_param` varchar(100) DEFAULT NULL,
  `a_description` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`a_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of jhac_api
-- ----------------------------
INSERT INTO `jhac_api` VALUES ('1', '查询cash接口', '/api/cash/query.do', 'GET', 'page(非必须有)', '');
INSERT INTO `jhac_api` VALUES ('2', 'cash数据写入接口', '/api/cash/save.do', 'POST', 'cash对象[cashAmount、cashCardId、cashFate]', '');
INSERT INTO `jhac_api` VALUES ('3', '查询card数据接口', '/api/card/query.do', 'GET', 'page(非必须有)', '');
INSERT INTO `jhac_api` VALUES ('4', 'card数据写入接口', '/api/card/save.do', 'POST', 'card对象[cardNo、cardBank、cardType]', '');

-- ----------------------------
-- Table structure for jhac_enum
-- ----------------------------
DROP TABLE IF EXISTS `jhac_enum`;
CREATE TABLE `jhac_enum` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `enum_key` varchar(32) DEFAULT NULL,
  `enum_value` varchar(50) DEFAULT NULL,
  `enum_code` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of jhac_enum
-- ----------------------------
INSERT INTO `jhac_enum` VALUES ('1', '0', '男', 'ENUM001');
INSERT INTO `jhac_enum` VALUES ('2', '1', '女', 'ENUM001');
INSERT INTO `jhac_enum` VALUES ('3', '0', '总经办', 'ENUM002');
INSERT INTO `jhac_enum` VALUES ('4', '1', '财务部', 'ENUM002');
INSERT INTO `jhac_enum` VALUES ('5', '2', '销售部', 'ENUM002');
INSERT INTO `jhac_enum` VALUES ('6', '3', '区域网点', 'ENUM002');
INSERT INTO `jhac_enum` VALUES ('7', '4', '总公司仓库', 'ENUM002');
INSERT INTO `jhac_enum` VALUES ('8', '0', '高中及以下', 'ENUM003');
INSERT INTO `jhac_enum` VALUES ('9', '1', '大学专科', 'ENUM003');
INSERT INTO `jhac_enum` VALUES ('10', '2', '大学本科', 'ENUM003');
INSERT INTO `jhac_enum` VALUES ('11', '3', '研究生', 'ENUM003');
INSERT INTO `jhac_enum` VALUES ('12', '4', '博士生', 'ENUM003');
INSERT INTO `jhac_enum` VALUES ('13', '1', '整套产品', 'ENUM004');
INSERT INTO `jhac_enum` VALUES ('14', '2', '产品主机', 'ENUM004');
INSERT INTO `jhac_enum` VALUES ('15', '3', '产品钥匙', 'ENUM004');
INSERT INTO `jhac_enum` VALUES ('16', '4', '安装配件', 'ENUM004');
INSERT INTO `jhac_enum` VALUES ('17', '0', '已申请，未处理', 'ENUM005');
INSERT INTO `jhac_enum` VALUES ('18', '1', '审核通过，配货中', 'ENUM005');
INSERT INTO `jhac_enum` VALUES ('19', '2', '已发货，运途中', 'ENUM005');
INSERT INTO `jhac_enum` VALUES ('20', '3', '订单完成', 'ENUM005');
INSERT INTO `jhac_enum` VALUES ('21', '4', '已取消', 'ENUM005');
INSERT INTO `jhac_enum` VALUES ('22', '5', '审核拒绝', 'ENUM005');
INSERT INTO `jhac_enum` VALUES ('23', '1', '按天', 'ENUM006');
INSERT INTO `jhac_enum` VALUES ('24', '2', '按月', 'ENUM006');
INSERT INTO `jhac_enum` VALUES ('25', '1', '审核通过', 'ENUM007');
INSERT INTO `jhac_enum` VALUES ('26', '0', '审核不通过', 'ENUM007');
INSERT INTO `jhac_enum` VALUES ('27', '2', '未审核', 'ENUM007');

-- ----------------------------
-- Table structure for jhac_user
-- ----------------------------
DROP TABLE IF EXISTS `jhac_user`;
CREATE TABLE `jhac_user` (
  `u_id` int(10) NOT NULL AUTO_INCREMENT,
  `u_name` varchar(50) DEFAULT NULL,
  `u_password` varchar(32) DEFAULT NULL,
  `u_truename` varchar(50) DEFAULT NULL,
  `u_telephone` varchar(11) DEFAULT NULL,
  `u_email` varchar(50) DEFAULT NULL,
  `u_role_id` int(10) DEFAULT NULL,
  `u_lastlogin_time` datetime DEFAULT NULL,
  `u_register_time` datetime DEFAULT NULL,
  `u_network_code` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`u_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of jhac_user
-- ----------------------------
INSERT INTO `jhac_user` VALUES ('1', 'admin', '21232f297a57a5a743894a0e4a801fc3', '测试用户', '18694054311', '402864040@qq.com', '2', '2016-09-07 15:23:45', '2016-06-23 21:36:14', 'JZ');

-- ----------------------------
-- Table structure for jhac_user_info
-- ----------------------------
DROP TABLE IF EXISTS `jhac_user_info`;
CREATE TABLE `jhac_user_info` (
  `ui_id` int(10) NOT NULL AUTO_INCREMENT,
  `ui_user_id` int(10) DEFAULT NULL,
  `ui_birthday` varchar(20) DEFAULT NULL,
  `ui_sex` char(2) DEFAULT NULL,
  `ui_entry_date` date DEFAULT NULL,
  `ui_department` varchar(40) DEFAULT NULL,
  `ui_leader` varchar(40) DEFAULT NULL,
  `ui_job` varchar(40) DEFAULT NULL,
  `ui_address` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`ui_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of jhac_user_info
-- ----------------------------
INSERT INTO `jhac_user_info` VALUES ('1', '1', '1988-03-11', '男', '2016-07-01', '区域', '占三', '区域员工', '湖北省武汉市');

-- ----------------------------
-- Table structure for max_code
-- ----------------------------
DROP TABLE IF EXISTS `max_code`;
CREATE TABLE `max_code` (
  `name` varchar(10) DEFAULT NULL,
  `max` int(5) DEFAULT NULL,
  `date` varchar(30) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of max_code
-- ----------------------------
INSERT INTO `max_code` VALUES ('WH', '32', '20160701');
INSERT INTO `max_code` VALUES ('OR', '7', '20160701');
INSERT INTO `max_code` VALUES ('GR', '4', '20160701');
INSERT INTO `max_code` VALUES ('MQ', '3', '20160701');
INSERT INTO `max_code` VALUES ('HR', '28', '20160701');
INSERT INTO `max_code` VALUES ('JZ', '2', '20160701');
INSERT INTO `max_code` VALUES ('OD', '53', '20160702');
INSERT INTO `max_code` VALUES ('OD', '19', '20160703');
INSERT INTO `max_code` VALUES ('OD', '2', '20160704');
INSERT INTO `max_code` VALUES ('OD', '1', '20160705');
INSERT INTO `max_code` VALUES ('OD', '6', '20160706');
INSERT INTO `max_code` VALUES ('OD', '2', '20160707');
INSERT INTO `max_code` VALUES ('OD', '11', '20160709');
INSERT INTO `max_code` VALUES ('SA', '27', '20160712');
INSERT INTO `max_code` VALUES ('SA', '63', '20160713');
INSERT INTO `max_code` VALUES ('OD', '3', '20160713');
INSERT INTO `max_code` VALUES ('SA', '8', '20160714');
INSERT INTO `max_code` VALUES ('OD', '7', '20160714');
INSERT INTO `max_code` VALUES ('SA', '7', '20160715');
INSERT INTO `max_code` VALUES ('OD', '4', '20160715');
INSERT INTO `max_code` VALUES ('OD', '3', '20160717');
INSERT INTO `max_code` VALUES ('SA', '4', '20160718');
INSERT INTO `max_code` VALUES ('OD', '4', '20160718');
INSERT INTO `max_code` VALUES ('OD', '13', '20160719');
INSERT INTO `max_code` VALUES ('OD', '8', '20160720');
INSERT INTO `max_code` VALUES ('OD', '2', '20160721');
INSERT INTO `max_code` VALUES ('OD', '2', '20160728');
INSERT INTO `max_code` VALUES ('SA', '1', '20160728');
INSERT INTO `max_code` VALUES ('OD', '2', '20160731');
INSERT INTO `max_code` VALUES ('SA', '2', '20160731');
INSERT INTO `max_code` VALUES ('OD', '1', '20160810');
INSERT INTO `max_code` VALUES ('OD', '1', '20160814');

-- ----------------------------
-- Table structure for menu
-- ----------------------------
DROP TABLE IF EXISTS `menu`;
CREATE TABLE `menu` (
  `menu_id` int(10) NOT NULL AUTO_INCREMENT,
  `menu_name` varchar(50) DEFAULT NULL,
  `menu_url` varchar(100) DEFAULT NULL,
  `menu_parent` int(10) DEFAULT NULL,
  PRIMARY KEY (`menu_id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of menu
-- ----------------------------
INSERT INTO `menu` VALUES ('33', '理财助手', 'finaceHelper.do', null);
INSERT INTO `menu` VALUES ('34', '银行卡信息', 'card/query.do', '33');
INSERT INTO `menu` VALUES ('35', '套现信息', 'cash/query.do', '33');
INSERT INTO `menu` VALUES ('36', '流水账信息', 'account/query.do', '33');

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role` (
  `role_id` int(10) NOT NULL AUTO_INCREMENT,
  `role_name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES ('1', '总经理');
INSERT INTO `role` VALUES ('2', '区域总监');

-- ----------------------------
-- Table structure for role_menu
-- ----------------------------
DROP TABLE IF EXISTS `role_menu`;
CREATE TABLE `role_menu` (
  `rm_id` int(10) NOT NULL AUTO_INCREMENT,
  `rm_role_id` int(10) DEFAULT NULL,
  `rm_menu_id` int(10) DEFAULT NULL,
  PRIMARY KEY (`rm_id`)
) ENGINE=InnoDB AUTO_INCREMENT=259 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of role_menu
-- ----------------------------
INSERT INTO `role_menu` VALUES ('66', '1', '5');
INSERT INTO `role_menu` VALUES ('67', '1', '6');
INSERT INTO `role_menu` VALUES ('68', '1', '19');
INSERT INTO `role_menu` VALUES ('69', '1', '1');
INSERT INTO `role_menu` VALUES ('70', '1', '21');
INSERT INTO `role_menu` VALUES ('71', '1', '22');
INSERT INTO `role_menu` VALUES ('72', '1', '23');
INSERT INTO `role_menu` VALUES ('73', '1', '24');
INSERT INTO `role_menu` VALUES ('190', '5', '1');
INSERT INTO `role_menu` VALUES ('191', '5', '6');
INSERT INTO `role_menu` VALUES ('192', '5', '7');
INSERT INTO `role_menu` VALUES ('193', '5', '8');
INSERT INTO `role_menu` VALUES ('194', '5', '21');
INSERT INTO `role_menu` VALUES ('213', '6', '1');
INSERT INTO `role_menu` VALUES ('214', '6', '21');
INSERT INTO `role_menu` VALUES ('215', '6', '4');
INSERT INTO `role_menu` VALUES ('216', '6', '17');
INSERT INTO `role_menu` VALUES ('217', '6', '31');
INSERT INTO `role_menu` VALUES ('218', '4', '4');
INSERT INTO `role_menu` VALUES ('219', '4', '17');
INSERT INTO `role_menu` VALUES ('220', '4', '18');
INSERT INTO `role_menu` VALUES ('221', '4', '31');
INSERT INTO `role_menu` VALUES ('222', '8', '1');
INSERT INTO `role_menu` VALUES ('223', '8', '6');
INSERT INTO `role_menu` VALUES ('224', '8', '7');
INSERT INTO `role_menu` VALUES ('225', '8', '8');
INSERT INTO `role_menu` VALUES ('226', '8', '21');
INSERT INTO `role_menu` VALUES ('227', '8', '2');
INSERT INTO `role_menu` VALUES ('228', '8', '9');
INSERT INTO `role_menu` VALUES ('229', '8', '10');
INSERT INTO `role_menu` VALUES ('230', '8', '11');
INSERT INTO `role_menu` VALUES ('231', '8', '12');
INSERT INTO `role_menu` VALUES ('232', '8', '13');
INSERT INTO `role_menu` VALUES ('233', '8', '3');
INSERT INTO `role_menu` VALUES ('234', '8', '14');
INSERT INTO `role_menu` VALUES ('235', '8', '15');
INSERT INTO `role_menu` VALUES ('236', '8', '16');
INSERT INTO `role_menu` VALUES ('237', '8', '28');
INSERT INTO `role_menu` VALUES ('238', '8', '29');
INSERT INTO `role_menu` VALUES ('239', '8', '30');
INSERT INTO `role_menu` VALUES ('240', '3', '3');
INSERT INTO `role_menu` VALUES ('241', '3', '15');
INSERT INTO `role_menu` VALUES ('242', '3', '28');
INSERT INTO `role_menu` VALUES ('243', '3', '30');
INSERT INTO `role_menu` VALUES ('244', '3', '4');
INSERT INTO `role_menu` VALUES ('245', '3', '17');
INSERT INTO `role_menu` VALUES ('246', '3', '31');
INSERT INTO `role_menu` VALUES ('247', '3', '5');
INSERT INTO `role_menu` VALUES ('248', '3', '19');
INSERT INTO `role_menu` VALUES ('255', '2', '33');
INSERT INTO `role_menu` VALUES ('256', '2', '34');
INSERT INTO `role_menu` VALUES ('257', '2', '35');
INSERT INTO `role_menu` VALUES ('258', '2', '36');
