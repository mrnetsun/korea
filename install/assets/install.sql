/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50525
Source Host           : localhost:3306
Source Database       : c3services

Target Server Type    : MYSQL
Target Server Version : 50525
File Encoding         : 65001

Date: 2014-04-25 09:59:51
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `app_cars`
-- ----------------------------
DROP TABLE IF EXISTS `app_cars`;
CREATE TABLE `app_cars` (
  `car_id` int(11) NOT NULL AUTO_INCREMENT,
  `memberId` int(11) DEFAULT NULL,
  `car_name` varchar(100) DEFAULT NULL,
  `VIN` varchar(50) DEFAULT NULL,
  `license_plate` varchar(50) DEFAULT NULL,
  `vehicle_model` varchar(50) DEFAULT NULL,
  `del_flag` tinyint(4) DEFAULT '0',
  `createdId` int(11) DEFAULT NULL,
  `createdTime` datetime DEFAULT NULL,
  `updatedId` int(11) DEFAULT NULL,
  `updatedTime` datetime DEFAULT NULL,
  PRIMARY KEY (`car_id`),
  KEY `memberId` (`memberId`),
  KEY `VIN` (`VIN`),
  KEY `license_plate` (`license_plate`),
  KEY `vehicle_model` (`vehicle_model`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of app_cars
-- ----------------------------
 

-- ----------------------------
-- Table structure for `app_car_type`
-- ----------------------------
DROP TABLE IF EXISTS `app_car_type`;
CREATE TABLE `app_car_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type_key` varchar(10) DEFAULT NULL,
  `model_description` tinytext,
  `car_type` varchar(10) DEFAULT NULL,
  `basic_type` varchar(10) DEFAULT NULL,
  `make` int(11) DEFAULT NULL,
  `type_of_product` int(11) DEFAULT NULL,
  `series_number` varchar(10) DEFAULT NULL,
  `e_series` varchar(10) DEFAULT NULL,
  `engine` varchar(10) DEFAULT NULL,
  `transmission` varchar(10) DEFAULT NULL,
  `no_of_doors` int(11) DEFAULT NULL,
  `steering` varchar(10) DEFAULT NULL,
  `us_id` varchar(10) DEFAULT NULL,
  `ckd_id` varchar(10) DEFAULT NULL,
  `bodywork_code` varchar(10) CHARACTER SET utf8 DEFAULT NULL,
  `del_flag` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `type_key` (`type_key`),
  KEY `series_number` (`series_number`)
) ENGINE=InnoDB AUTO_INCREMENT=5870 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for `app_car_vin`
-- ----------------------------
DROP TABLE IF EXISTS `app_car_vin`;
CREATE TABLE `app_car_vin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(10) DEFAULT NULL,
  `start_vin` varchar(10) DEFAULT NULL,
  `end_vin` varchar(10) DEFAULT NULL,
  `model` varchar(10) DEFAULT NULL,
  `time` varchar(10) DEFAULT NULL,
  `del_flag` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `code` (`code`),
  KEY `start_vin` (`start_vin`),
  KEY `end_vin` (`end_vin`),
  KEY `model` (`model`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of app_car_vin
-- ----------------------------
INSERT INTO `app_car_vin` VALUES ('1', 'FG011', 'AA00000', 'AA02487', 'AB11', '198901', '0');
INSERT INTO `app_car_vin` VALUES ('2', 'FG011', 'BT41080', 'BT41080', 'DD41', '199612', '0');
INSERT INTO `app_car_vin` VALUES ('3', 'FG011', 'CB08588', 'CB08589', 'EG21', '199107', '0');
INSERT INTO `app_car_vin` VALUES ('4', 'FG011', 'CB12822', 'CB12823', 'EG11', '199103', '0');
INSERT INTO `app_car_vin` VALUES ('5', 'FG011', 'CB22611', 'CB22615', 'AM43', '200006', '0');
INSERT INTO `app_car_vin` VALUES ('6', 'FG011', 'CB27083', 'CB27084', 'EG12', '199207', '0');
INSERT INTO `app_car_vin` VALUES ('7', 'FG011', 'CB37488', 'CB37503', 'DE92', '200209', '0');
INSERT INTO `app_car_vin` VALUES ('8', 'FG011', 'CB56001', 'CB56001', 'AY08', '199207', '0');
INSERT INTO `app_car_vin` VALUES ('9', 'FG011', 'CB57858', 'CB57875', 'EG22', '199207', '0');
INSERT INTO `app_car_vin` VALUES ('10', 'FG011', 'CB83001', 'CB83024', 'EY08', '200405', '0');
INSERT INTO `app_car_vin` VALUES ('11', 'FG011', 'CB84480', 'CB84481', 'DL82', '200211', '0');

-- ----------------------------
-- Table structure for `app_collection`
-- ----------------------------
DROP TABLE IF EXISTS `app_collection`;
CREATE TABLE `app_collection` (
  `categoryId` int(11) NOT NULL AUTO_INCREMENT,
  `cateName` varchar(145) DEFAULT NULL,
  `description` text,
  `image` varchar(200) DEFAULT NULL,
  `type` tinyint(4) DEFAULT '0',
  `status` tinyint(4) DEFAULT '0',
  `parentId` int(11) DEFAULT '0',
  `level` int(11) DEFAULT '1',
  `del_flag` tinyint(4) DEFAULT '0',
  `createdId` int(11) DEFAULT NULL,
  `createdTime` datetime DEFAULT NULL,
  `updatedId` int(11) DEFAULT NULL,
  `updatedTime` datetime DEFAULT NULL,
  `lang` varchar(10) DEFAULT NULL,
  `translation` text,
  PRIMARY KEY (`categoryId`),
  KEY `categoryId` (`categoryId`) USING BTREE,
  KEY `parentId` (`parentId`) USING BTREE,
  KEY `status` (`status`) USING BTREE,
  KEY `del_flag` (`del_flag`) USING BTREE,
  KEY `createdId` (`createdId`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of app_collection
-- ----------------------------
 
-- ----------------------------
-- Table structure for `app_collection_product`
-- ----------------------------
DROP TABLE IF EXISTS `app_collection_product`;
CREATE TABLE `app_collection_product` (
  `product_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_name` varchar(150) DEFAULT NULL,
  `code` varchar(100) DEFAULT NULL,
  `price` float(7,2) DEFAULT NULL,
  `collection_id` int(11) DEFAULT NULL,
  `image` mediumtext,
  `description` text,
  `lang` varchar(10) DEFAULT NULL,
  `translation` text,
  `del_flag` tinyint(4) DEFAULT '0',
  `status` tinyint(4) DEFAULT '0',
  `createdId` int(11) DEFAULT NULL,
  `createdTime` datetime DEFAULT NULL,
  `updatedId` int(11) DEFAULT NULL,
  `updatedTime` datetime DEFAULT NULL,
  PRIMARY KEY (`product_id`),
  KEY `product_name` (`product_name`),
  KEY `code` (`code`),
  KEY `price` (`price`),
  KEY `collection_id` (`collection_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of app_collection_product
-- ----------------------------
 
-- ----------------------------
-- Table structure for `app_dealer`
-- ----------------------------
DROP TABLE IF EXISTS `app_dealer`;
CREATE TABLE `app_dealer` (
  `dealer_id` int(11) NOT NULL AUTO_INCREMENT,
  `dealer_name` varchar(200) DEFAULT NULL,
  `logo` varchar(200) DEFAULT NULL,
  `GPS` varchar(50) DEFAULT NULL,
  `open_hours` varchar(200) DEFAULT NULL,
  `address` varchar(200) DEFAULT NULL,
  `descriptions` text,
  `tel` varchar(20) CHARACTER SET latin1 DEFAULT NULL,
  `email` varchar(100) CHARACTER SET latin1 DEFAULT NULL,
  `status` tinyint(4) DEFAULT '0',
  `lang` varchar(10) DEFAULT NULL,
  `translation` text,
  `del_flag` tinyint(4) DEFAULT '0',
  `createdId` int(11) DEFAULT NULL,
  `createdTime` datetime DEFAULT NULL,
  `updatedId` int(11) DEFAULT NULL,
  `updatedTime` datetime DEFAULT NULL,
  PRIMARY KEY (`dealer_id`),
  KEY `dealer_name` (`dealer_name`),
  KEY `email` (`email`),
  KEY `status` (`status`),
  KEY `del_flag` (`del_flag`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of app_dealer
-- ----------------------------
 
-- ----------------------------
-- Table structure for `app_dealer_service`
-- ----------------------------
DROP TABLE IF EXISTS `app_dealer_service`;
CREATE TABLE `app_dealer_service` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `services_id` int(11) DEFAULT NULL,
  `dealer_id` int(11) DEFAULT NULL,
  `status` tinyint(4) DEFAULT '0',
  `del_flag` tinyint(4) DEFAULT '0',
  `createdId` int(11) DEFAULT NULL,
  `createdTime` datetime DEFAULT NULL,
  `updatedId` int(11) DEFAULT NULL,
  `updatedTime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `services_id` (`services_id`),
  KEY `dealer_id` (`dealer_id`),
  KEY `status` (`status`),
  KEY `del_flag` (`del_flag`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of app_dealer_service
-- ----------------------------
 
-- ----------------------------
-- Table structure for `app_dealer_timeslot`
-- ----------------------------
DROP TABLE IF EXISTS `app_dealer_timeslot`;
CREATE TABLE `app_dealer_timeslot` (
  `dealer_slot_id` int(11) NOT NULL AUTO_INCREMENT,
  `slot_name` varchar(100) DEFAULT NULL,
  `slot_date` date DEFAULT NULL,
  `number` int(11) DEFAULT NULL,
  `booked` int(11) DEFAULT '0',
  `dealer_id` int(11) DEFAULT NULL,
  `status` tinyint(4) DEFAULT '0',
  `del_flag` tinyint(4) DEFAULT '0',
  `createdId` int(11) DEFAULT NULL,
  `createdTime` datetime DEFAULT NULL,
  `updatedId` int(11) DEFAULT NULL,
  `updatedTime` datetime DEFAULT NULL,
  PRIMARY KEY (`dealer_slot_id`),
  KEY `slot_name` (`slot_name`),
  KEY `slot_date` (`slot_date`),
  KEY `dealer_id` (`dealer_id`),
  KEY `status` (`status`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of app_dealer_timeslot
-- ----------------------------
 
-- ----------------------------
-- Table structure for `app_dealer_timeslot_default`
-- ----------------------------
DROP TABLE IF EXISTS `app_dealer_timeslot_default`;
CREATE TABLE `app_dealer_timeslot_default` (
  `slot_id` int(11) NOT NULL AUTO_INCREMENT,
  `slot_name` varchar(100) DEFAULT NULL,
  `dealer_id` int(11) DEFAULT NULL,
  `number` int(11) DEFAULT NULL,
  `status` tinyint(4) DEFAULT '0',
  `del_flag` tinyint(4) DEFAULT '0',
  `createdId` int(11) DEFAULT NULL,
  `createdTime` datetime DEFAULT NULL,
  `updatedId` int(11) DEFAULT NULL,
  `updatedTime` datetime DEFAULT NULL,
  PRIMARY KEY (`slot_id`),
  KEY `slot_name` (`slot_name`),
  KEY `dealer_id` (`dealer_id`),
  KEY `status` (`status`),
  KEY `del_flag` (`del_flag`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of app_dealer_timeslot_default
-- ----------------------------
 
-- ----------------------------
-- Table structure for `app_event`
-- ----------------------------
DROP TABLE IF EXISTS `app_event`;
CREATE TABLE `app_event` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `event_date` datetime NOT NULL,
  `event_name` varchar(200) NOT NULL,
  `slot_time` varchar(50) DEFAULT NULL,
  `detail` tinytext,
  `color` varchar(15) DEFAULT NULL,
  `process` int(11) DEFAULT '1',
  `history` text,
  `status` tinyint(4) DEFAULT '0',
  `del_flag` tinyint(4) DEFAULT '0',
  `dealer_id` int(11) DEFAULT NULL,
  `car_id` int(11) DEFAULT NULL,
  `service_id` int(11) DEFAULT NULL,
  `createdId` int(11) DEFAULT NULL,
  `createdTime` datetime DEFAULT NULL,
  `updatedId` int(11) DEFAULT NULL,
  `updatedTime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `event_date` (`event_date`) USING BTREE,
  KEY `event_name` (`event_name`),
  KEY `process` (`process`),
  KEY `status` (`status`),
  KEY `dealer_id` (`dealer_id`),
  KEY `service_id` (`service_id`),
  KEY `car_id` (`car_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of app_event
-- ----------------------------
 
-- ----------------------------
-- Table structure for `app_home_slide`
-- ----------------------------
DROP TABLE IF EXISTS `app_home_slide`;
CREATE TABLE `app_home_slide` (
  `slide_id` int(11) NOT NULL AUTO_INCREMENT,
  `image` varchar(150) DEFAULT NULL,
  `name` varchar(200) DEFAULT NULL,
  `descriptions` text,
  `status` tinyint(4) DEFAULT '0',
  `url` varchar(255) DEFAULT NULL,
  `del_flag` tinyint(4) DEFAULT '0' COMMENT '0:Normal; -1: Deleted',
  `createdId` int(11) DEFAULT NULL,
  `createdTime` datetime DEFAULT NULL,
  `updatedId` int(11) DEFAULT NULL,
  `updatedTime` datetime DEFAULT NULL,
  PRIMARY KEY (`slide_id`),
  KEY `id` (`slide_id`) USING BTREE,
  KEY `status` (`status`) USING BTREE,
  KEY `del_flag` (`del_flag`) USING BTREE,
  KEY `createdId` (`createdId`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of app_home_slide
-- ----------------------------
 
-- ----------------------------
-- Table structure for `app_message`
-- ----------------------------
DROP TABLE IF EXISTS `app_message`;
CREATE TABLE `app_message` (
  `message_id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(200) DEFAULT NULL,
  `content` text,
  `createdName` varchar(255) DEFAULT NULL,
  `createdId` int(11) DEFAULT NULL,
  `createdTime` datetime DEFAULT NULL,
  `updatedId` int(11) DEFAULT NULL,
  `updatedTime` datetime DEFAULT NULL,
  `recieptName` varchar(255) DEFAULT NULL,
  `recieptId` int(11) DEFAULT NULL,
  `recieptTime` datetime DEFAULT NULL,
  `type` tinyint(4) DEFAULT '0' COMMENT '0:Inbox;1:sent',
  `read_flag` tinyint(4) DEFAULT '0' COMMENT '0:normal; 1:read',
  `del_flag` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`message_id`),
  KEY `fk_app_message_app_sys_member1_idx` (`createdId`) USING BTREE,
  KEY `fk_app_message_app_sys_member2_idx` (`recieptId`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of app_message
-- ----------------------------

-- ----------------------------
-- Table structure for `app_partner`
-- ----------------------------
DROP TABLE IF EXISTS `app_partner`;
CREATE TABLE `app_partner` (
  `partnerId` int(11) NOT NULL AUTO_INCREMENT,
  `partnerName` varchar(150) DEFAULT NULL,
  `logo` varchar(150) DEFAULT NULL,
  `website` varchar(200) CHARACTER SET utf8 DEFAULT NULL,
  `status` tinyint(4) DEFAULT '0' COMMENT '0: normal; 1: Active',
  `del_flag` tinyint(4) DEFAULT '0' COMMENT '0: normal; -1: deleted',
  `createdId` int(11) DEFAULT NULL,
  `createdTime` datetime DEFAULT NULL,
  `updatedId` int(11) DEFAULT NULL,
  `updatedTime` datetime DEFAULT NULL,
  PRIMARY KEY (`partnerId`),
  KEY `status` (`status`) USING BTREE,
  KEY `del_flag` (`del_flag`) USING BTREE,
  KEY `createdId` (`createdId`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

 
-- ----------------------------
-- Table structure for `app_public`
-- ----------------------------
DROP TABLE IF EXISTS `app_public`;
CREATE TABLE `app_public` (
  `public_id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(150) DEFAULT NULL,
  `title` varchar(200) DEFAULT NULL,
  `media_type` varchar(30) DEFAULT NULL,
  `image_url` varchar(200) DEFAULT NULL,
  `video_url` varchar(200) DEFAULT NULL,
  `short` text,
  `description` text,
  `lang` varchar(10) DEFAULT NULL,
  `translation` text,
  `status` tinyint(4) DEFAULT '0',
  `del_flag` tinyint(4) DEFAULT '0',
  `createdId` int(11) DEFAULT NULL,
  `createdTime` datetime DEFAULT NULL,
  `updatedId` int(11) DEFAULT NULL,
  `updatedTime` datetime DEFAULT NULL,
  PRIMARY KEY (`public_id`),
  KEY `status` (`status`) USING BTREE,
  KEY `createdId` (`createdId`) USING BTREE,
  KEY `del_flag` (`del_flag`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of app_public
-- ----------------------------
 
-- ----------------------------
-- Table structure for `app_services`
-- ----------------------------
DROP TABLE IF EXISTS `app_services`;
CREATE TABLE `app_services` (
  `categoryId` int(11) NOT NULL AUTO_INCREMENT,
  `cateName` varchar(145) DEFAULT NULL,
  `description` text,
  `image` varchar(200) DEFAULT NULL,
  `type` tinyint(4) DEFAULT '0',
  `is_fastlane` tinyint(4) DEFAULT '0',
  `status` tinyint(4) DEFAULT '0',
  `parentId` int(11) DEFAULT '0',
  `level` int(11) DEFAULT '1',
  `del_flag` tinyint(4) DEFAULT '0',
  `createdId` int(11) DEFAULT NULL,
  `createdTime` datetime DEFAULT NULL,
  `updatedId` int(11) DEFAULT NULL,
  `updatedTime` datetime DEFAULT NULL,
  `lang` varchar(10) DEFAULT NULL,
  `translation` text,
  PRIMARY KEY (`categoryId`),
  KEY `categoryId` (`categoryId`) USING BTREE,
  KEY `parentId` (`parentId`) USING BTREE,
  KEY `status` (`status`) USING BTREE,
  KEY `del_flag` (`del_flag`) USING BTREE,
  KEY `createdId` (`createdId`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of app_services
-- ----------------------------
 
-- ----------------------------
-- Table structure for `app_shoutbox`
-- ----------------------------
DROP TABLE IF EXISTS `app_shoutbox`;
CREATE TABLE `app_shoutbox` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `code` varchar(50) CHARACTER SET latin1 DEFAULT NULL,
  `status` tinyint(4) DEFAULT '0',
  `del_flag` tinyint(4) DEFAULT '0',
  `createdId` int(11) NOT NULL,
  `createdTime` datetime DEFAULT NULL,
  `updatedId` int(11) DEFAULT NULL,
  `updatedTime` datetime DEFAULT NULL,
  `userInfo` tinytext NOT NULL,
  `message` tinytext NOT NULL,
  `documents` text,
  `comments` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of app_shoutbox
-- ----------------------------
 
-- ----------------------------
-- Table structure for `app_sys_config`
-- ----------------------------
DROP TABLE IF EXISTS `app_sys_config`;
CREATE TABLE `app_sys_config` (
  `configId` int(11) NOT NULL AUTO_INCREMENT,
  `moduleId` varchar(45) DEFAULT NULL,
  `configName` varchar(45) DEFAULT NULL,
  `configCode` varchar(45) DEFAULT NULL,
  `configValue` tinytext,
  `type` varchar(45) DEFAULT NULL,
  `params` tinytext,
  `del_flag` tinyint(4) DEFAULT '0' COMMENT '0: Normal\n-1: Deleted',
  `createdId` int(11) DEFAULT NULL,
  `createdTime` datetime DEFAULT NULL,
  `updatedId` int(11) DEFAULT NULL,
  `updatedTime` datetime DEFAULT NULL,
  PRIMARY KEY (`configId`),
  KEY `del_flag` (`del_flag`) USING BTREE,
  KEY `moduleId` (`moduleId`) USING BTREE,
  KEY `configCode` (`configCode`) USING BTREE,
  KEY `createdId` (`createdId`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for `app_sys_department`
-- ----------------------------
DROP TABLE IF EXISTS `app_sys_department`;
CREATE TABLE `app_sys_department` (
  `departmentId` int(11) NOT NULL AUTO_INCREMENT,
  `departmentName` varchar(100) DEFAULT NULL,
  `description` tinytext,
  `parentId` int(11) DEFAULT NULL,
  `status` tinyint(4) DEFAULT '0',
  `del_flag` tinyint(4) DEFAULT '0' COMMENT '0: Normal\n-1: Deleted',
  `createdId` int(11) DEFAULT NULL,
  `createdTime` datetime DEFAULT NULL,
  `updatedId` int(11) DEFAULT NULL,
  `updatedTime` datetime DEFAULT NULL,
  PRIMARY KEY (`departmentId`),
  KEY `parentId` (`parentId`) USING BTREE,
  KEY `status` (`status`) USING BTREE,
  KEY `del_flag` (`del_flag`) USING BTREE,
  KEY `createdId` (`createdId`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of app_sys_department
-- ----------------------------
 
-- ----------------------------
-- Table structure for `app_sys_dropdown`
-- ----------------------------
DROP TABLE IF EXISTS `app_sys_dropdown`;
CREATE TABLE `app_sys_dropdown` (
  `dropdownId` int(11) NOT NULL AUTO_INCREMENT,
  `moduleId` varchar(50) DEFAULT NULL,
  `dropdownName` varchar(45) DEFAULT NULL,
  `dropdownCode` varchar(50) DEFAULT NULL,
  `value` text COMMENT 'JSON Array String\n{["value":"1","text":"Text here"]}',
  `createdId` int(11) DEFAULT NULL,
  `createdTime` datetime DEFAULT NULL,
  `updatedId` int(11) DEFAULT NULL,
  `updatedTime` datetime DEFAULT NULL,
  `del_flag` tinyint(4) DEFAULT '0',
  `status` tinyint(4) DEFAULT '1' COMMENT '1: Active\n; 0: DeActive',
  PRIMARY KEY (`dropdownId`),
  KEY `moduleId` (`moduleId`) USING BTREE,
  KEY `dropdownCode` (`dropdownCode`) USING BTREE,
  KEY `createdId` (`createdId`) USING BTREE,
  KEY `status` (`status`) USING BTREE,
  KEY `del_flag` (`del_flag`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for `app_sys_history`
-- ----------------------------
DROP TABLE IF EXISTS `app_sys_history`;
CREATE TABLE `app_sys_history` (
  `historyId` int(11) NOT NULL AUTO_INCREMENT,
  `memberId` int(11) NOT NULL,
  `actionName` varchar(45) DEFAULT NULL,
  `actionType` varchar(45) DEFAULT NULL,
  `updateDate` datetime DEFAULT NULL,
  `note` text,
  PRIMARY KEY (`historyId`),
  KEY `fk_app_sys_history_app_sys_member1` (`memberId`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of app_sys_history
-- ----------------------------

-- ----------------------------
-- Table structure for `app_sys_member`
-- ----------------------------
DROP TABLE IF EXISTS `app_sys_member`;
CREATE TABLE `app_sys_member` (
  `memberId` int(11) NOT NULL AUTO_INCREMENT,
  `dealerId` int(11) DEFAULT NULL,
  `username` varchar(100) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  `firstName` varchar(45) DEFAULT NULL,
  `lastName` varchar(45) DEFAULT NULL,
  `sex` tinyint(4) DEFAULT '0',
  `tel` varchar(50) DEFAULT NULL,
  `address` varchar(150) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `departmentId` int(11) DEFAULT NULL,
  `roleId` varchar(200) DEFAULT NULL COMMENT 'JSON aray RoleID',
  `titleId` int(11) DEFAULT NULL,
  `del_flag` varchar(45) DEFAULT '0' COMMENT '0: Normal\n-1: Deleted',
  `createdId` int(11) DEFAULT NULL,
  `createdTime` datetime DEFAULT NULL,
  `updatedId` int(11) DEFAULT NULL,
  `updatedTime` datetime DEFAULT NULL,
  `status` tinyint(4) DEFAULT '1' COMMENT '1: Active\n; 0: DeActive',
  `activeKey` varchar(100) DEFAULT NULL,
  `color` varchar(10) DEFAULT NULL,
  `avatar` varchar(145) DEFAULT NULL,
  `isSA` tinyint(4) DEFAULT '0',
  `profiles` text,
  `facebook` varchar(255) DEFAULT NULL,
  `osType` varchar(50) DEFAULT 'ios' COMMENT 'ios/android',
  `machineCode` varchar(150) DEFAULT NULL,
  `website` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`memberId`),
  KEY `fk_app_sys_member_app_sys_department1` (`departmentId`) USING BTREE,
  KEY `email` (`email`) USING BTREE,
  KEY `username` (`username`) USING BTREE,
  KEY `password` (`password`) USING BTREE,
  KEY `firstName` (`firstName`) USING BTREE,
  KEY `lastName` (`lastName`) USING BTREE,
  KEY `createdId` (`createdId`) USING BTREE,
  KEY `del_flag` (`del_flag`) USING BTREE,
  KEY `status` (`status`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for `app_sys_menu`
-- ----------------------------
DROP TABLE IF EXISTS `app_sys_menu`;
CREATE TABLE `app_sys_menu` (
  `menuId` int(11) NOT NULL AUTO_INCREMENT,
  `moduleId` varchar(100) DEFAULT NULL,
  `menuName` varchar(100) DEFAULT NULL,
  `menuLink` varchar(150) DEFAULT NULL,
  `icon` varchar(45) DEFAULT NULL,
  `parentId` int(11) DEFAULT '0',
  `menuType` varchar(45) DEFAULT NULL,
  `status` tinyint(4) DEFAULT '0' COMMENT '0: Active\n-1: Deactive',
  `del_flag` tinyint(4) DEFAULT '0' COMMENT '0: Normal\n-1: Deleted',
  `createdId` int(11) DEFAULT NULL,
  `createdTime` datetime DEFAULT NULL,
  `updatedId` int(11) DEFAULT NULL,
  `updatedTime` datetime DEFAULT NULL,
  `position` int(11) DEFAULT NULL,
  PRIMARY KEY (`menuId`),
  KEY `moduleId` (`moduleId`) USING BTREE,
  KEY `parentId` (`parentId`) USING BTREE,
  KEY `menuName` (`menuName`) USING BTREE,
  KEY `status` (`status`) USING BTREE,
  KEY `del_flag` (`del_flag`) USING BTREE,
  KEY `createdId` (`createdId`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for `app_sys_module`
-- ----------------------------
DROP TABLE IF EXISTS `app_sys_module`;
CREATE TABLE `app_sys_module` (
  `moduleId` int(11) NOT NULL AUTO_INCREMENT,
  `moduleName` varchar(45) DEFAULT NULL,
  `modulePath` varchar(45) DEFAULT NULL,
  `moduleType` varchar(255) DEFAULT NULL,
  `description` tinytext,
  `status` tinyint(4) DEFAULT '1' COMMENT '1:Active; 0: Deactive;',
  `del_flag` tinyint(4) DEFAULT '0' COMMENT '0: Normal\n-1: Deleted',
  `createdId` int(11) DEFAULT NULL,
  `createdTime` datetime DEFAULT NULL,
  `updatedId` int(11) DEFAULT NULL,
  `updatedTime` datetime DEFAULT NULL,
  `position` int(11) DEFAULT NULL,
  PRIMARY KEY (`moduleId`),
  KEY `moduleName` (`moduleName`) USING BTREE,
  KEY `status` (`status`) USING BTREE,
  KEY `del_flag` (`del_flag`) USING BTREE,
  KEY `createdId` (`createdId`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;


-- ----------------------------
-- Table structure for `app_sys_resource`
-- ----------------------------
DROP TABLE IF EXISTS `app_sys_resource`;
CREATE TABLE `app_sys_resource` (
  `resource_id` int(11) NOT NULL AUTO_INCREMENT,
  `moduleId` varchar(100) DEFAULT NULL,
  `resource_name` varchar(150) DEFAULT NULL,
  `resource_code` varchar(150) DEFAULT NULL,
  `permissions` text,
  `status` tinyint(4) DEFAULT '0',
  `createdId` int(11) DEFAULT NULL,
  `createdTime` datetime DEFAULT NULL,
  `updatedId` int(11) DEFAULT NULL,
  `updatedTime` datetime DEFAULT NULL,
  `del_flag` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`resource_id`),
  KEY `moduleId` (`moduleId`) USING BTREE,
  KEY `resource_name` (`resource_name`) USING BTREE,
  KEY `resource_code` (`resource_code`) USING BTREE,
  KEY `status` (`status`) USING BTREE,
  KEY `createdId` (`createdId`) USING BTREE,
  KEY `del_flag` (`del_flag`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for `app_sys_role`
-- ----------------------------
DROP TABLE IF EXISTS `app_sys_role`;
CREATE TABLE `app_sys_role` (
  `roleId` int(11) NOT NULL AUTO_INCREMENT,
  `parentId` int(11) DEFAULT NULL,
  `roleName` varchar(45) DEFAULT NULL,
  `roleType` tinyint(4) DEFAULT '0' COMMENT '0: System Role\n1: Module Role',
  `moduleId` varchar(50) DEFAULT NULL,
  `status` tinyint(4) DEFAULT '0',
  `del_flag` tinyint(4) DEFAULT '0',
  `createdId` int(11) DEFAULT NULL,
  `createdTime` datetime DEFAULT NULL,
  `updatedId` int(11) DEFAULT NULL,
  `updatedTime` datetime DEFAULT NULL,
  PRIMARY KEY (`roleId`),
  KEY `parentId` (`parentId`) USING BTREE,
  KEY `roleName` (`roleName`) USING BTREE,
  KEY `moduleId` (`moduleId`) USING BTREE,
  KEY `status` (`status`) USING BTREE,
  KEY `del_flag` (`del_flag`) USING BTREE,
  KEY `createdId` (`createdId`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for `app_sys_team`
-- ----------------------------
DROP TABLE IF EXISTS `app_sys_team`;
CREATE TABLE `app_sys_team` (
  `teamId` int(11) NOT NULL AUTO_INCREMENT,
  `teamName` varchar(100) DEFAULT NULL,
  `description` tinytext,
  `teamMember` text COMMENT 'JSON memberId',
  `limitTime` tinyint(4) DEFAULT '0' COMMENT '0: no limit\n1: limit time betwen startdate & enddate',
  `startTime` datetime DEFAULT NULL,
  `endTime` datetime DEFAULT NULL,
  `createdId` int(11) DEFAULT NULL,
  `createdTime` datetime DEFAULT NULL,
  `updatedId` int(11) DEFAULT NULL,
  `updatedTime` datetime DEFAULT NULL,
  `del_flag` tinyint(4) DEFAULT '0' COMMENT '0: Normal\n-1: Deleted',
  PRIMARY KEY (`teamId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


-- ----------------------------
-- Records of app_car_type
-- ----------------------------
INSERT INTO `app_car_type` VALUES ('2', 'WY34', 'X3 XDRIVE 20D THA        ', 'WY31', 'WY31', '1', '1', 'G3', 'F25 ', 'N47T', 'S', '5', 'R', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3', '    ', 'MINI ONE RL A ALLRAD     ', 'ZA41', 'ZA41', '1', '1', 'P0', 'R60 ', 'N16 ', 'A', '5', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4', 'AB11', '316 I/2 KAT              ', 'AB11', 'AB11', '1', '1', '3', 'E30 ', 'M40 ', 'S', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5', 'AB12', '316 I/2 RL KAT           ', 'AB11', 'AB11', '1', '1', '3', 'E30 ', 'M40 ', 'S', '2', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('6', 'AB18', '316I/2 RL ZACKD          ', 'AB11', 'AB11', '1', '1', 'Z3', 'E30 ', 'M40 ', 'S', '2', 'R', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('7', 'AB21', '316 I/2 A KAT            ', 'AB21', 'AB21', '1', '1', '3', 'E30 ', 'M40 ', 'A', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('8', 'AB22', '316IA RHD 2-DOOR KAT     ', 'AB21', 'AB21', '1', '1', '3', 'E30 ', 'M40 ', 'A', '2', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('9', 'AC11', '316 I 4T. KATALYSATO     ', 'AB11', 'AB11', '1', '1', '3', 'E30 ', 'M40 ', 'S', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('10', 'AC12', '316I RHD 4-DOOR KAT.     ', 'AB11', 'AB11', '1', '1', '3', 'E30 ', 'M40 ', 'S', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('11', 'AC14', '316I/4RL THACKD          ', 'AB11', 'AB11', '1', '1', 'T3', 'E30 ', 'M40 ', 'S', '4', 'R', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('12', 'AC18', '316I/4 RL ZACKD          ', 'AB11', 'AB11', '1', '1', 'Z3', 'E30 ', 'M40 ', 'S', '4', 'R', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('13', 'AC21', '316 IA 4T. KATALYSAT     ', 'AB21', 'AB21', '1', '1', '3', 'E30 ', 'M40 ', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('14', 'AC22', '316IA RHD 4-DOOR KAT     ', 'AB21', 'AB21', '1', '1', '3', 'E30 ', 'M40 ', 'A', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('15', 'AC95', '320 IS 4-TUERIG          ', 'AC95', 'AC95', '1', '1', '3', 'E30 ', 'S14 ', 'S', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('16', 'AD01', '324 TD A 4-TUERIG        ', 'AD01', 'AD01', '1', '1', '3', 'E30 ', 'M21T', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('17', 'AD91', '324 TD 4-TUERIG          ', 'AD91', 'AD91', '1', '1', '3', 'E30 ', 'M21T', 'S', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('18', 'AF51', '318 I/2 KAT              ', 'AF51', 'AF51', '1', '1', '3', 'E30 ', 'M40 ', 'S', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('19', 'AF52', '318 I/2 RL KAT           ', 'AF51', 'AF51', '1', '1', '3', 'E30 ', 'M40 ', 'S', '2', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('20', 'AF55', '318I/2RLTHA CKD          ', 'AF51', 'AF51', '1', '1', 'T3', 'E30 ', 'M40 ', 'S', '2', 'R', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('21', 'AF61', '318 I/2 A KAT            ', 'AF61', 'AF61', '1', '1', '3', 'E30 ', 'M40 ', 'A', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('22', 'AF62', '318 I/2 ARL KAT          ', 'AF61', 'AF61', '1', '1', '3', 'E30 ', 'M40 ', 'A', '2', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('23', 'AF91', '318 I/2 S KAT            ', 'AF91', 'AF91', '1', '1', '3', 'E30 ', 'M42 ', 'S', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('24', 'AF92', '318 I/2 S RLKAT          ', 'AF91', 'AF91', '1', '1', '3', 'E30 ', 'M42 ', 'S', '2', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('25', 'AF93', '318 I/2 S USA            ', 'AF93', 'AF93', '1', '1', '3', 'E30 ', 'M42 ', 'S', '2', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('26', 'AG05', '325IX A KAT TOU          ', 'AG05', 'AG05', '1', '1', '3', 'E30 ', 'M20 ', 'A', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('27', 'AG51', '325 I KAT TOUR           ', 'AG51', 'AG51', '1', '1', '3', 'E30 ', 'M20 ', 'S', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('28', 'AG52', '325I RL KAT TOU          ', 'AG51', 'AG51', '1', '1', '3', 'E30 ', 'M20 ', 'S', '5', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('29', 'AG61', '325 I A KAT TOU          ', 'AG61', 'AG61', '1', '1', '3', 'E30 ', 'M20 ', 'A', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('30', 'AG62', '325I ARL KATTOU          ', 'AG61', 'AG61', '1', '1', '3', 'E30 ', 'M20 ', 'A', '5', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('31', 'AG71', '318 I KAT TOUR           ', 'AG71', 'AG71', '1', '1', '3', 'E30 ', 'M40 ', 'S', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('32', 'AG72', '318I RL KAT TOU          ', 'AG71', 'AG71', '1', '1', '3', 'E30 ', 'M40 ', 'S', '5', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('33', 'AG81', '318 I A KAT TOU          ', 'AG81', 'AG81', '1', '1', '3', 'E30 ', 'M40 ', 'A', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('34', 'AG82', '318IA RL KATTOU          ', 'AG81', 'AG81', '1', '1', '3', 'E30 ', 'M40 ', 'A', '5', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('35', 'AG95', '325 I X KAT TOU          ', 'AG95', 'AG95', '1', '1', '3', 'E30 ', 'M20 ', 'S', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('36', 'AH01', '324 TD A TOUR            ', 'AH01', 'AH01', '1', '1', '3', 'E30 ', 'M21T', 'A', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('37', 'AH51', '320 I KAT TOUR           ', 'AH51', 'AH51', '1', '1', '3', 'E30 ', 'M20 ', 'S', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('38', 'AH52', '320 I RL KATTOU          ', 'AH51', 'AH51', '1', '1', '3', 'E30 ', 'M20 ', 'S', '5', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('39', 'AH61', '320 I A KAT TOU          ', 'AH61', 'AH61', '1', '1', '3', 'E30 ', 'M20 ', 'A', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('40', 'AH62', '320 IARL KATTOU          ', 'AH61', 'AH61', '1', '1', '3', 'E30 ', 'M20 ', 'A', '5', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('41', 'AH71', '320 I TOURING            ', 'AH51', 'AH51', '1', '1', '3', 'E30 ', 'M20 ', 'S', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('42', 'AH81', '320 I A   TOURI          ', 'AH61', 'AH61', '1', '1', '3', 'E30 ', 'M20 ', 'A', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('43', 'AH91', '324 TD TOURING           ', 'AH91', 'AH91', '1', '1', '3', 'E30 ', 'M21T', 'S', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('44', 'AJ11', '316 I KAT TOUR           ', 'AJ11', 'AJ11', '1', '1', '3', 'E30 ', 'M40 ', 'S', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('45', 'AJ12', '316I RL KAT TOU          ', 'AJ11', 'AJ11', '1', '1', '3', 'E30 ', 'M40 ', 'S', '5', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('46', 'AJ21', '316 I A KAT TOU          ', 'AJ21', 'AJ21', '1', '1', '3', 'E30 ', 'M40 ', 'A', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('47', 'AJ22', '316IA RL KATTOU          ', 'AJ21', 'AJ21', '1', '1', '3', 'E30 ', 'M40 ', 'A', '5', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('48', 'AJ51', '318 I 4T. KATALYSATO     ', 'AF51', 'AF51', '1', '1', '3', 'E30 ', 'M40 ', 'S', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('49', 'AJ52', '318 I RHD 4-DOOR KAT     ', 'AF51', 'AF51', '1', '1', '3', 'E30 ', 'M40 ', 'S', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('50', 'AJ55', '318I/4RL THACKD          ', 'AF51', 'AF51', '1', '1', 'T3', 'E30 ', 'M40 ', 'S', '4', 'R', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('51', 'AJ56', '318I/4RL MALCKD          ', 'AF51', 'AF51', '1', '1', 'C3', 'E30 ', 'M40 ', 'S', '4', 'R', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('52', 'AJ57', '318I/4RL INDCKD          ', 'AF51', 'AF51', '1', '1', 'C3', 'E30 ', 'M40 ', 'S', '4', 'R', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('53', 'AJ58', '318I/4RL ZA CKD          ', 'AF51', 'AF51', '1', '1', 'C3', 'E30 ', 'M40 ', 'S', '4', 'R', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('54', 'AJ61', '318 IA 4T. KATALYSAT     ', 'AF61', 'AF61', '1', '1', '3', 'E30 ', 'M40 ', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('55', 'AJ62', '318 I/4 ARL KAT          ', 'AF61', 'AF61', '1', '1', '3', 'E30 ', 'M40 ', 'A', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('56', 'AJ65', '318I/4ARLTHACKD          ', 'AF61', 'AF61', '1', '1', 'T3', 'E30 ', 'M40 ', 'A', '4', 'R', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('57', 'AJ68', '318I/4ARLZA CKD          ', 'AF61', 'AF61', '1', '1', 'C3', 'E30 ', 'M40 ', 'A', '4', 'R', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('58', 'AJ93', '318 I/4 USA              ', 'AJ93', 'AJ93', '1', '1', '3', 'E30 ', 'M42 ', 'S', '4', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('59', 'AK95', '320IS/2 - S14            ', 'AC95', 'AC95', '1', '1', '3', 'E30 ', 'S14 ', 'S', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('60', 'AL01', '330D A                   ', 'AL01', 'AL01', '1', '1', '3', 'E46 ', 'M57 ', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('61', 'AL02', '330D RL A                ', 'AL01', 'AL01', '1', '1', '3', 'E46 ', 'M57 ', 'A', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('62', 'AL11', '316I                     ', 'AL11', 'AL11', '1', '1', '3', 'E46 ', 'M43 ', 'S', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('63', 'AL12', '316I RL                  ', 'AL11', 'AL11', '1', '1', '3', 'E46 ', 'M43 ', 'S', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('64', 'AL18', '318I VIE SKD             ', 'AL31', 'AL31', '1', '1', 'V3', 'E46 ', 'M43 ', 'S', '4', 'L', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('65', 'AL21', '316I A                   ', 'AL21', 'AL21', '1', '1', '3', 'E46 ', 'M43 ', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('66', 'AL22', '316I RL A                ', 'AL21', 'AL21', '1', '1', '3', 'E46 ', 'M43 ', 'A', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('67', 'AL28', '318I VIE SKD A           ', 'AL21', 'AL21', '1', '1', 'V3', 'E46 ', 'M43 ', 'A', '4', 'L', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('68', 'AL31', '318I                     ', 'AL31', 'AL31', '1', '1', '3', 'E46 ', 'M43 ', 'S', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('69', 'AL32', '318I RL                  ', 'AL31', 'AL31', '1', '1', '3', 'E46 ', 'M43 ', 'S', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('70', 'AL34', '318I RL MAL CKD          ', 'AL31', 'AL31', '1', '1', 'L3', 'E46 ', 'M43 ', 'S', '4', 'R', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('71', 'AL35', '318I RL THA CKD          ', 'AL31', 'AL31', '1', '1', 'T3', 'E46 ', 'M43 ', 'S', '4', 'R', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('72', 'AL36', '318I EGY CKD             ', 'AL31', 'AL31', '1', '1', 'Y3', 'E46 ', 'M43 ', 'S', '4', 'L', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('73', 'AL37', '318I RL IND CKD          ', 'AL31', 'AL31', '1', '1', 'D3', 'E46 ', 'M43 ', 'S', '4', 'R', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('74', 'AL39', '318I PHI CKD             ', 'AL31', 'AL31', '1', '1', 'P3', 'E46 ', 'M43 ', 'S', '4', 'L', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('75', 'AL41', '318I A                   ', 'AL41', 'AL41', '1', '1', '3', 'E46 ', 'M43 ', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('76', 'AL42', '318I RL A                ', 'AL41', 'AL41', '1', '1', '3', 'E46 ', 'M43 ', 'A', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('77', 'AL44', '318I RL MAL CKD A        ', 'AL41', 'AL41', '1', '1', 'L3', 'E46 ', 'M43 ', 'A', '4', 'R', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('78', 'AL45', '318I RL THA CKD A        ', 'AL41', 'AL41', '1', '1', 'T3', 'E46 ', 'M43 ', 'A', '4', 'R', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('79', 'AL46', '318I EGY CKD A           ', 'AL41', 'AL41', '1', '1', 'Y3', 'E46 ', 'M43 ', 'A', '4', 'L', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('80', 'AL47', '318I RL IND CKD A        ', 'AL41', 'AL41', '1', '1', 'D3', 'E46 ', 'M43 ', 'A', '4', 'R', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('81', 'AL49', '318I PHI CKD A           ', 'AL41', 'AL41', '1', '1', 'P3', 'E46 ', 'M43 ', 'A', '4', 'L', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('82', 'AL51', '316I                     ', 'AL11', 'AL11', '1', '1', '3', 'E46 ', 'M43 ', 'S', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('83', 'AL55', '316I PHI CKD             ', 'AL11', 'AL11', '1', '1', 'P3', 'E46 ', 'M43 ', 'S', '4', 'L', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('84', 'AL58', '318I RUS SKD             ', 'AL31', 'AL31', '1', '1', 'R3', 'E46 ', 'M43 ', 'S', '4', 'L', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('85', 'AL68', '318I RUS SKD A           ', 'AL41', 'AL41', '1', '1', 'R3', 'E46 ', 'M43 ', 'A', '4', 'L', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('86', 'AL71', '320D                     ', 'AL71', 'AL71', '1', '1', '3', 'E46 ', 'M47 ', 'S', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('87', 'AL72', '320D RL                  ', 'AL71', 'AL71', '1', '1', '3', 'E46 ', 'M47 ', 'S', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('88', 'AL81', '320D A                   ', 'AL81', 'AL81', '1', '1', '3', 'E46 ', 'M47 ', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('89', 'AL82', '320D RL A                ', 'AL81', 'AL81', '1', '1', '3', 'E46 ', 'M47 ', 'A', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('90', 'AL91', '330D                     ', 'AL91', 'AL91', '1', '1', '3', 'E46 ', 'M57 ', 'S', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('91', 'AL92', '330D RL                  ', 'AL91', 'AL91', '1', '1', '3', 'E46 ', 'M57 ', 'S', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('92', 'AM11', '320I                     ', 'AM11', 'AM11', '1', '1', '3', 'E46 ', 'M52 ', 'S', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('93', 'AM12', '320I RL                  ', 'AM11', 'AM11', '1', '1', '3', 'E46 ', 'M52 ', 'S', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('94', 'AM21', '320I A                   ', 'AM21', 'AM21', '1', '1', '3', 'E46 ', 'M52 ', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('95', 'AM22', '320I RL A                ', 'AM21', 'AM21', '1', '1', '3', 'E46 ', 'M52 ', 'A', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('96', 'AM31', '323I                     ', 'AM31', 'AM31', '1', '1', '3', 'E46 ', 'M52 ', 'S', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('97', 'AM32', '323I RL                  ', 'AM31', 'AM31', '1', '1', '3', 'E46 ', 'M52 ', 'S', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('98', 'AM33', '323I US                  ', 'AM33', 'AM33', '1', '1', '3', 'E46 ', 'M52 ', 'S', '4', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('99', 'AM35', '323I RL THA CKD          ', 'AM31', 'AM31', '1', '1', 'T3', 'E46 ', 'M52 ', 'S', '4', 'R', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('100', 'AM36', '323I VIE SKD             ', 'AM31', 'AM31', '1', '1', 'V3', 'E46 ', 'M52 ', 'S', '4', 'L', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('101', 'AM37', '323I RL IND CKD          ', 'AM31', 'AM31', '1', '1', 'D3', 'E46 ', 'M52 ', 'S', '4', 'R', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('102', 'AM38', '323I MEX SKD             ', 'AM31', 'AM31', '1', '1', 'X3', 'E46 ', 'M52 ', 'S', '4', 'L', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('103', 'AM39', '323I PHI CKD             ', 'AM31', 'AM31', '1', '1', 'P3', 'E46 ', 'M52 ', 'S', '4', 'L', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('104', 'AM41', '323I A                   ', 'AM41', 'AM41', '1', '1', '3', 'E46 ', 'M52 ', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('105', 'AM42', '323I RL A                ', 'AM41', 'AM41', '1', '1', '3', 'E46 ', 'M52 ', 'A', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('106', 'AM43', '323I US A                ', 'AM43', 'AM43', '1', '1', '3', 'E46 ', 'M52 ', 'A', '4', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('107', 'AM45', '323I RL THA CKD A        ', 'AM41', 'AM41', '1', '1', 'T3', 'E46 ', 'M52 ', 'A', '4', 'R', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('108', 'AM46', '323I VIE SKD A           ', 'AM41', 'AM41', '1', '1', 'V3', 'E46 ', 'M52 ', 'A', '4', 'L', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('109', 'AM47', '323I RL IND CKD A        ', 'AM41', 'AM41', '1', '1', 'D3', 'E46 ', 'M52 ', 'A', '4', 'R', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('110', 'AM48', '323I MEX SKD A           ', 'AM41', 'AM41', '1', '1', 'X3', 'E46 ', 'M52 ', 'A', '4', 'L', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('111', 'AM49', '323I PHI CKD A           ', 'AM41', 'AM41', '1', '1', 'P3', 'E46 ', 'M52 ', 'A', '4', 'L', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('112', 'AM51', '328I                     ', 'AM51', 'AM51', '1', '1', '3', 'E46 ', 'M52 ', 'S', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('113', 'AM52', '328I RL                  ', 'AM51', 'AM51', '1', '1', '3', 'E46 ', 'M52 ', 'S', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('114', 'AM53', '328I US                  ', 'AM53', 'AM53', '1', '1', '3', 'E46 ', 'M52 ', 'S', '4', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('115', 'AM54', '328I RL MAL CKD          ', 'AM51', 'AM51', '1', '1', 'L3', 'E46 ', 'M52 ', 'S', '4', 'R', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('116', 'AM57', '328I MEX SKD             ', 'AM51', 'AM51', '1', '1', 'X3', 'E46 ', 'M52 ', 'S', '4', 'L', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('117', 'AM61', '328I A                   ', 'AM61', 'AM61', '1', '1', '3', 'E46 ', 'M52 ', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('118', 'AM62', '328I RL A                ', 'AM61', 'AM61', '1', '1', '3', 'E46 ', 'M52 ', 'A', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('119', 'AM63', '328I US A                ', 'AM63', 'AM63', '1', '1', '3', 'E46 ', 'M52 ', 'A', '4', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('120', 'AM64', '328I RL MAL CKD A        ', 'AM61', 'AM61', '1', '1', 'L3', 'E46 ', 'M52 ', 'A', '4', 'R', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('121', 'AM67', '328I MEX SKD A           ', 'AM61', 'AM61', '1', '1', 'X3', 'E46 ', 'M52 ', 'A', '4', 'L', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('122', 'AN01', '318I A                   ', 'AL41', 'AL41', '1', '1', 'Z3', 'E46 ', 'M43 ', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('123', 'AN02', '318I RL A                ', 'AL41', 'AL41', '1', '1', 'Z3', 'E46 ', 'M43 ', 'A', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('124', 'AN11', '320I                     ', 'AM11', 'AM11', '1', '1', 'Z3', 'E46 ', 'M52 ', 'S', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('125', 'AN12', '320I RL                  ', 'AM11', 'AM11', '1', '1', 'Z3', 'E46 ', 'M52 ', 'S', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('126', 'AN15', '320I                     ', 'AV11', 'AV11', '1', '1', 'Z3', 'E46 ', 'M54 ', 'S', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('127', 'AN16', '320I RL                  ', 'AV11', 'AV11', '1', '1', 'Z3', 'E46 ', 'M54 ', 'S', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('128', 'AN21', '320I A                   ', 'AM21', 'AM21', '1', '1', 'Z3', 'E46 ', 'M52 ', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('129', 'AN22', '320I RL A                ', 'AM21', 'AM21', '1', '1', 'Z3', 'E46 ', 'M52 ', 'A', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('130', 'AN25', '320I A                   ', 'AV21', 'AV21', '1', '1', 'Z3', 'E46 ', 'M54 ', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('131', 'AN26', '320I RL A                ', 'AV21', 'AV21', '1', '1', 'Z3', 'E46 ', 'M54 ', 'A', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('132', 'AN31', '323I                     ', 'AM31', 'AM31', '1', '1', 'Z3', 'E46 ', 'M52 ', 'S', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('133', 'AN32', '323I RL                  ', 'AM31', 'AM31', '1', '1', 'Z3', 'E46 ', 'M52 ', 'S', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('134', 'AN33', '323I US                  ', 'AM33', 'AM33', '1', '1', '3', 'E46 ', 'M52 ', 'S', '4', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('135', 'AN35', '325I                     ', 'AV31', 'AV31', '1', '1', 'Z3', 'E46 ', 'M54 ', 'S', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('136', 'AN36', '325I RL                  ', 'AV31', 'AV31', '1', '1', 'Z3', 'E46 ', 'M54 ', 'S', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('137', 'AN37', '325I US                  ', 'AV33', 'AV33', '1', '1', '3', 'E46 ', 'M54 ', 'S', '4', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('138', 'AN41', '323I A                   ', 'AM41', 'AM41', '1', '1', 'Z3', 'E46 ', 'M52 ', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('139', 'AN42', '323I RL A                ', 'AM41', 'AM41', '1', '1', 'Z3', 'E46 ', 'M52 ', 'A', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('140', 'AN43', '323I US A                ', 'AM43', 'AM43', '1', '1', '3', 'E46 ', 'M52 ', 'A', '4', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('141', 'AN45', '325I A                   ', 'AV41', 'AV41', '1', '1', 'Z3', 'E46 ', 'M54 ', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('142', 'AN46', '325I RL A                ', 'AV41', 'AV41', '1', '1', 'Z3', 'E46 ', 'M54 ', 'A', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('143', 'AN47', '325I US A                ', 'AV43', 'AV43', '1', '1', '3', 'E46 ', 'M54 ', 'A', '4', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('144', 'AN51', '328I                     ', 'AM51', 'AM51', '1', '1', 'Z3', 'E46 ', 'M52 ', 'S', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('145', 'AN52', '328I RL                  ', 'AM51', 'AM51', '1', '1', 'Z3', 'E46 ', 'M52 ', 'S', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('146', 'AN55', '330I                     ', 'AV51', 'AV51', '1', '1', 'Z3', 'E46 ', 'M54 ', 'S', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('147', 'AN56', '330I RL                  ', 'AV51', 'AV51', '1', '1', 'Z3', 'E46 ', 'M54 ', 'S', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('148', 'AN61', '328I A                   ', 'AM61', 'AM61', '1', '1', 'Z3', 'E46 ', 'M52 ', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('149', 'AN62', '328I RL A                ', 'AM61', 'AM61', '1', '1', 'Z3', 'E46 ', 'M52 ', 'A', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('150', 'AN65', '330I A                   ', 'AV61', 'AV61', '1', '1', 'Z3', 'E46 ', 'M54 ', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('151', 'AN66', '330I RL A                ', 'AV61', 'AV61', '1', '1', 'Z3', 'E46 ', 'M54 ', 'A', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('152', 'AN71', '316I                     ', 'AL11', 'AL11', '1', '1', 'Z3', 'E46 ', 'M43 ', 'S', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('153', 'AN72', '316I RL                  ', 'AL11', 'AL11', '1', '1', 'Z3', 'E46 ', 'M43 ', 'S', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('154', 'AN81', '316I LIM ZA A            ', 'AL21', 'AL21', '1', '1', 'Z3', 'E46 ', 'M43 ', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('155', 'AN82', '316I RL A                ', 'AL21', 'AL21', '1', '1', 'Z3', 'E46 ', 'M43 ', 'A', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('156', 'AN91', '318I                     ', 'AL31', 'AL31', '1', '1', 'Z3', 'E46 ', 'M43 ', 'S', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('157', 'AN92', '318I RL                  ', 'AL31', 'AL31', '1', '1', 'Z3', 'E46 ', 'M43 ', 'S', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('158', 'AP01', '330D TO A                ', 'AP01', 'AP01', '1', '1', '3', 'E46 ', 'M57 ', 'A', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('159', 'AP02', '330D RL TO A             ', 'AP01', 'AP01', '1', '1', '3', 'E46 ', 'M57 ', 'A', '5', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('160', 'AP31', '318I TO                  ', 'AP31', 'AP31', '1', '1', '3', 'E46 ', 'M43 ', 'S', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('161', 'AP32', '318I RL TO               ', 'AP31', 'AP31', '1', '1', '3', 'E46 ', 'M43 ', 'S', '5', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('162', 'AP41', '318I TO A                ', 'AP41', 'AP41', '1', '1', '3', 'E46 ', 'M43 ', 'A', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('163', 'AP42', '318I RL TO A             ', 'AP41', 'AP41', '1', '1', '3', 'E46 ', 'M43 ', 'A', '5', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('164', 'AP51', '318D TO                  ', '    ', '    ', '1', '1', '3', 'E46 ', 'M47 ', 'S', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('165', 'AP71', '320D TO                  ', 'AP71', 'AP71', '1', '1', '3', 'E46 ', 'M47S', 'S', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('166', 'AP72', '320D RL TO               ', 'AP71', 'AP71', '1', '1', '3', 'E46 ', 'M47S', 'S', '5', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('167', 'AP81', '320D TO A                ', 'AP81', 'AP81', '1', '1', '3', 'E46 ', 'M47S', 'A', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('168', 'AP82', '320D RL TO A             ', 'AP81', 'AP81', '1', '1', '3', 'E46 ', 'M47S', 'A', '5', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('169', 'AP91', '330D TO                  ', 'AP91', 'AP91', '1', '1', '3', 'E46 ', 'M57 ', 'S', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('170', 'AP92', '330D RL TO               ', 'AP91', 'AP91', '1', '1', '3', 'E46 ', 'M57 ', 'S', '5', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('171', 'AR01', '330D TO A ALLRAD         ', 'AR01', 'AR01', '1', '1', '3', 'E46 ', 'M57 ', 'A', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('172', 'AR11', '320I TO                  ', 'AR11', 'AR11', '1', '1', '3', 'E46 ', 'M52 ', 'S', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('173', 'AR21', '320I TO A                ', 'AR21', 'AR21', '1', '1', '3', 'E46 ', 'M52 ', 'A', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('174', 'AR33', '323I US TO               ', 'AR33', 'AR33', '1', '1', '3', 'E46 ', 'M52 ', 'S', '5', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('175', 'AR43', '323I US TO A             ', 'AR43', 'AR43', '1', '1', '3', 'E46 ', 'M52 ', 'A', '5', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('176', 'AR51', '328I TO                  ', 'AR51', 'AR51', '1', '1', '3', 'E46 ', 'M52 ', 'S', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('177', 'AR52', '328I RL TO               ', 'AR51', 'AR51', '1', '1', '3', 'E46 ', 'M52 ', 'S', '5', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('178', 'AR61', '328I TO A                ', 'AR61', 'AR61', '1', '1', '3', 'E46 ', 'M52 ', 'A', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('179', 'AR62', '328I RL TO A             ', 'AR61', 'AR61', '1', '1', '3', 'E46 ', 'M52 ', 'A', '5', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('180', 'AR71', '325I TO ALLRAD           ', 'AR71', 'AR71', '1', '1', '3', 'E46 ', 'M54 ', 'S', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('181', 'AR73', '325I US TO ALLRAD        ', 'AR73', 'AR73', '1', '1', '3', 'E46 ', 'M54 ', 'S', '5', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('182', 'AR81', '325I TO A ALLRAD         ', 'AR81', 'AR81', '1', '1', '3', 'E46 ', 'M54 ', 'A', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('183', 'AR83', '325I US TO A ALLRAD      ', 'AR83', 'AR83', '1', '1', '3', 'E46 ', 'M54 ', 'A', '5', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('184', 'AR91', '330D TO ALLRAD           ', 'AR91', 'AR91', '1', '1', '3', 'E46 ', 'M57 ', 'S', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('185', 'AS11', '330D ALLRAD              ', 'AS11', 'AS11', '1', '1', '3', 'E46 ', 'M57 ', 'S', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('186', 'AS21', '330D A ALLRAD            ', 'AS21', 'AS21', '1', '1', '3', 'E46 ', 'M57 ', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('187', 'AS31', '325I ALLRAD              ', 'AS31', 'AS31', '1', '1', '3', 'E46 ', 'M54 ', 'S', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('188', 'AS33', '325I US ALLRAD           ', 'AS33', 'AS33', '1', '1', '3', 'E46 ', 'M54 ', 'S', '4', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('189', 'AS41', '325I A ALLRAD            ', 'AS41', 'AS41', '1', '1', '3', 'E46 ', 'M54 ', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('190', 'AS43', '325I US A ALLRAD         ', 'AS43', 'AS43', '1', '1', '3', 'E46 ', 'M54 ', 'A', '4', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('191', 'AS51', '318D                     ', '    ', '    ', '1', '1', '3', 'E46 ', 'M47 ', 'S', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('192', 'AS71', '320D                     ', 'AS71', 'AS71', '1', '1', '3', 'E46 ', 'M47S', 'S', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('193', 'AS72', '320D RL                  ', 'AS71', 'AS71', '1', '1', '3', 'E46 ', 'M47S', 'S', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('194', 'AS81', '320D A                   ', 'AS81', 'AS81', '1', '1', '3', 'E46 ', 'M47S', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('195', 'AS82', '320D RL A                ', 'AS81', 'AS81', '1', '1', '3', 'E46 ', 'M47S', 'A', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('196', 'AT11', '316TI KO                 ', 'AT11', 'AT11', '1', '1', '35', 'E46 ', 'N40 ', 'S', '3', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('197', 'AT21', '316TI KO A               ', 'AT21', 'AT21', '1', '1', '35', 'E46 ', 'N40 ', 'A', '3', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('198', 'AT31', '325TI KO                 ', 'AT31', 'AT31', '1', '1', '35', 'E46 ', 'M54 ', 'S', '3', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('199', 'AT32', '325TI RL KO              ', 'AT31', 'AT31', '1', '1', '35', 'E46 ', 'M54 ', 'S', '3', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('200', 'AT41', '325TI KO A               ', 'AT41', 'AT41', '1', '1', '35', 'E46 ', 'M54 ', 'A', '3', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('201', 'AT42', '325TI RL KO A            ', 'AT41', 'AT41', '1', '1', '35', 'E46 ', 'M54 ', 'A', '3', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('202', 'AT51', '316TI KO                 ', 'AT51', 'AT51', '1', '1', '35', 'E46 ', 'N42 ', 'S', '3', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('203', 'AT52', '316TI RL KO              ', 'AT51', 'AT51', '1', '1', '35', 'E46 ', 'N42 ', 'S', '3', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('204', 'AT61', '316TI KO A               ', 'AT61', 'AT61', '1', '1', '35', 'E46 ', 'N42 ', 'A', '3', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('205', 'AT62', '316TI RL KO A            ', 'AT61', 'AT61', '1', '1', '35', 'E46 ', 'N42 ', 'A', '3', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('206', 'AT71', '320TD KO                 ', 'AT71', 'AT71', '1', '1', '35', 'E46 ', 'M47S', 'S', '3', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('207', 'AT72', '320TD RL KO              ', 'AT71', 'AT71', '1', '1', '35', 'E46 ', 'M47S', 'S', '3', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('208', 'AT81', '320TD KO A               ', 'AT81', 'AT81', '1', '1', '35', 'E46 ', 'M47S', 'A', '3', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('209', 'AT82', '320TD RL KO A            ', 'AT81', 'AT81', '1', '1', '35', 'E46 ', 'M47S', 'A', '3', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('210', 'AT91', '318TD KO                 ', 'AT91', 'AT91', '1', '1', '35', 'E46 ', 'M47S', 'S', '3', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('211', 'AU13', '320TI US KO              ', '    ', '    ', '1', '1', '35', 'E46 ', 'M54 ', 'S', '3', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('212', 'AU23', '320TI US KO A            ', '    ', '    ', '1', '1', '35', 'E46 ', 'M54 ', 'A', '3', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('213', 'AU51', '318TI KO                 ', 'AU51', 'AU51', '1', '1', '35', 'E46 ', 'N42 ', 'S', '3', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('214', 'AU52', '318TI RL KO              ', 'AU51', 'AU51', '1', '1', '35', 'E46 ', 'N42 ', 'S', '3', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('215', 'AU61', '318TI KO A               ', 'AU61', 'AU61', '1', '1', '35', 'E46 ', 'N42 ', 'A', '3', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('216', 'AU62', '318TI RL KO A            ', 'AU61', 'AU61', '1', '1', '35', 'E46 ', 'N42 ', 'A', '3', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('217', 'AV11', '320I                     ', 'AV11', 'AV11', '1', '1', '3', 'E46 ', 'M54 ', 'S', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('218', 'AV12', '320I RL                  ', 'AV11', 'AV11', '1', '1', '3', 'E46 ', 'M54 ', 'S', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('219', 'AV13', '320I US                  ', 'AV13', 'AV13', '1', '1', '3', 'E46 ', 'M54 ', 'S', '4', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('220', 'AV21', '320I A                   ', 'AV21', 'AV21', '1', '1', '3', 'E46 ', 'M54 ', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('221', 'AV22', '320I RL A                ', 'AV21', 'AV21', '1', '1', '3', 'E46 ', 'M54 ', 'A', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('222', 'AV23', '320I US A                ', 'AV23', 'AV23', '1', '1', '3', 'E46 ', 'M54 ', 'A', '4', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('223', 'AV28', '320I RUS SKD A           ', 'AV21', 'AV21', '1', '1', 'R3', 'E46 ', 'M54 ', 'A', '4', 'L', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('224', 'AV31', '325I                     ', 'AV31', 'AV31', '1', '1', '3', 'E46 ', 'M54 ', 'S', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('225', 'AV32', '325I RL                  ', 'AV31', 'AV31', '1', '1', '3', 'E46 ', 'M54 ', 'S', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('226', 'AV33', '325I US                  ', 'AV33', 'AV33', '1', '1', '3', 'E46 ', 'M54 ', 'S', '4', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('227', 'AV41', '325I A                   ', 'AV41', 'AV41', '1', '1', '3', 'E46 ', 'M54 ', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('228', 'AV42', '325I RL A                ', 'AV41', 'AV41', '1', '1', '3', 'E46 ', 'M54 ', 'A', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('229', 'AV43', '325I US A                ', 'AV43', 'AV43', '1', '1', '3', 'E46 ', 'M54 ', 'A', '4', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('230', 'AV45', '325I MAL CKD A           ', 'AV41', 'AV41', '1', '1', 'L3', 'E46 ', 'M54 ', 'A', '4', 'R', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('231', 'AV46', '325I RL IND CKD A        ', 'AV41', 'AV41', '1', '1', 'D3', 'E46 ', 'M54 ', 'A', '4', 'R', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('232', 'AV47', '325I PHI CKD A           ', 'AV41', 'AV41', '1', '1', 'P3', 'E46 ', 'M54 ', 'A', '4', 'L', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('233', 'AV49', '325I MEX SKD A           ', 'AV41', 'AV41', '1', '1', 'X3', 'E46 ', 'M54 ', 'A', '4', 'L', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('234', 'AV51', '330I                     ', 'AV51', 'AV51', '1', '1', '3', 'E46 ', 'M54 ', 'S', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('235', 'AV52', '330I RL                  ', 'AV51', 'AV51', '1', '1', '3', 'E46 ', 'M54 ', 'S', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('236', 'AV53', '330I US                  ', 'AV53', 'AV53', '1', '1', '3', 'E46 ', 'M54 ', 'S', '4', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('237', 'AV61', '330I A                   ', 'AV61', 'AV61', '1', '1', '3', 'E46 ', 'M54 ', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('238', 'AV62', '330I RL A                ', 'AV61', 'AV61', '1', '1', '3', 'E46 ', 'M54 ', 'A', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('239', 'AV63', '330I US A                ', 'AV63', 'AV63', '1', '1', '3', 'E46 ', 'M54 ', 'A', '4', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('240', 'AV71', '320D                     ', 'AL71', 'AL71', '1', '1', '3', 'E46 ', 'M47 ', 'S', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('241', 'AV72', '320D RL                  ', 'AL71', 'AL71', '1', '1', '3', 'E46 ', 'M47 ', 'S', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('242', 'AV81', '320D LIM A               ', 'AL81', 'AL81', '1', '1', '3', 'E46 ', 'M47 ', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('243', 'AV82', '320D RL A                ', 'AL81', 'AL81', '1', '1', '3', 'E46 ', 'M47 ', 'A', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('244', 'AW11', '320I TO                  ', 'AW11', 'AW11', '1', '1', '3', 'E46 ', 'M54 ', 'S', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('245', 'AW12', '320I RL TO               ', 'AW11', 'AW11', '1', '1', '3', 'E46 ', 'M54 ', 'S', '5', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('246', 'AW21', '320I TO A                ', 'AW21', 'AW21', '1', '1', '3', 'E46 ', 'M54 ', 'A', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('247', 'AW22', '320I RL TO A             ', 'AW21', 'AW21', '1', '1', '3', 'E46 ', 'M54 ', 'A', '5', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('248', 'AW31', '325I TO                  ', 'AW31', 'AW31', '1', '1', '3', 'E46 ', 'M54 ', 'S', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('249', 'AW32', '325I RL TO               ', 'AW31', 'AW31', '1', '1', '3', 'E46 ', 'M54 ', 'S', '5', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('250', 'AW33', '325I US TO               ', 'AW33', 'AW33', '1', '1', '3', 'E46 ', 'M54 ', 'S', '5', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('251', 'AW41', '325I TO A                ', 'AW41', 'AW41', '1', '1', '3', 'E46 ', 'M54 ', 'A', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('252', 'AW42', '325I RL TO A             ', 'AW41', 'AW41', '1', '1', '3', 'E46 ', 'M54 ', 'A', '5', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('253', 'AW43', '325I US TO A             ', 'AW43', 'AW43', '1', '1', '3', 'E46 ', 'M54 ', 'A', '5', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('254', 'AW51', '330I TO                  ', 'AW51', 'AW51', '1', '1', '3', 'E46 ', 'M54 ', 'S', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('255', 'AW52', '330I RL TO               ', 'AW51', 'AW51', '1', '1', '3', 'E46 ', 'M54 ', 'S', '5', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('256', 'AW61', '330I TO A                ', 'AW61', 'AW61', '1', '1', '3', 'E46 ', 'M54 ', 'A', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('257', 'AW62', '330I RL TO A             ', 'AW61', 'AW61', '1', '1', '3', 'E46 ', 'M54 ', 'A', '5', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('258', 'AX23', '325I US TO A             ', 'AX23', 'AX23', '1', '1', '3', 'E46 ', 'M56 ', 'A', '5', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('259', 'AX31', '316I TO                  ', 'AX31', 'AX31', '1', '1', '3', 'E46 ', 'N42 ', 'S', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('260', 'AX32', '316I RL TO               ', 'AX31', 'AX31', '1', '1', '3', 'E46 ', 'N42 ', 'S', '5', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('261', 'AX41', '316I TO A                ', 'AX41', 'AX41', '1', '1', '3', 'E46 ', 'N42 ', 'A', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('262', 'AX42', '316I RL TO A             ', 'AX41', 'AX41', '1', '1', '3', 'E46 ', 'N42 ', 'A', '5', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('263', 'AX51', '318I TO                  ', 'AX51', 'AX51', '1', '1', '3', 'E46 ', 'N42 ', 'S', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('264', 'AX52', '318I RL TO               ', 'AX51', 'AX51', '1', '1', '3', 'E46 ', 'N42 ', 'S', '5', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('265', 'AX61', '318I TO A                ', 'AX61', 'AX61', '1', '1', '3', 'E46 ', 'N42 ', 'A', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('266', 'AX62', '318I RL TO A             ', 'AX61', 'AX61', '1', '1', '3', 'E46 ', 'N42 ', 'A', '5', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('267', 'AX71', '320D TO                  ', 'AX71', 'AX71', '1', '1', '3', 'E46 ', 'M47 ', 'S', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('268', 'AX72', '320D RL TO               ', 'AX71', 'AX71', '1', '1', '3', 'E46 ', 'M47 ', 'S', '5', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('269', 'AX81', '320D TO A                ', 'AX81', 'AX81', '1', '1', '3', 'E46 ', 'M47 ', 'A', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('270', 'AX82', '320D RL TO A             ', 'AX81', 'AX81', '1', '1', '3', 'E46 ', 'M47 ', 'A', '5', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('271', 'AY07', '318I CHN CKD A           ', 'AY81', 'AY81', '1', '1', '3C', 'E46 ', 'N42 ', 'A', '4', 'L', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('272', 'AY08', '318I RUS SKD A           ', 'AY81', 'AY81', '1', '1', 'R3', 'E46 ', 'N42 ', 'A', '4', 'L', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('273', 'AY11', '316I                     ', 'AY11', 'AY11', '1', '1', '3', 'E46 ', 'N40 ', 'S', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('274', 'AY15', '316I PHI CKD             ', 'AY11', 'AY11', '1', '1', 'P3', 'E46 ', 'N40 ', 'S', '4', 'L', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('275', 'AY31', '316I                     ', 'AY31', 'AY31', '1', '1', '3', 'E46 ', 'N42 ', 'S', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('276', 'AY32', '316I RL                  ', 'AY31', 'AY31', '1', '1', '3', 'E46 ', 'N42 ', 'S', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('277', 'AY41', '316I A                   ', 'AY41', 'AY41', '1', '1', '3', 'E46 ', 'N42 ', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('278', 'AY42', '316I RL A                ', 'AY41', 'AY41', '1', '1', '3', 'E46 ', 'N42 ', 'A', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('279', 'AY71', '318I                     ', 'AY71', 'AY71', '1', '1', '3', 'E46 ', 'N42 ', 'S', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('280', 'AY72', '318I RL                  ', 'AY71', 'AY71', '1', '1', '3', 'E46 ', 'N42 ', 'S', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('281', 'AY74', '318I RL MAL CKD          ', 'AY71', 'AY71', '1', '1', 'L3', 'E46 ', 'N42 ', 'S', '4', 'R', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('282', 'AY75', '318I RL THA CKD          ', 'AY71', 'AY71', '1', '1', 'T3', 'E46 ', 'N42 ', 'S', '4', 'R', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('283', 'AY76', '318I EGY CKD             ', 'AY71', 'AY71', '1', '1', 'Y3', 'E46 ', 'N42 ', 'S', '4', 'L', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('284', 'AY77', '318I RL IND CKD          ', 'AY71', 'AY71', '1', '1', 'D3', 'E46 ', 'N42 ', 'S', '4', 'R', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('285', 'AY78', '318I VIE SKD             ', 'AY71', 'AY71', '1', '1', 'V3', 'E46 ', 'N42 ', 'S', '4', 'L', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('286', 'AY79', '318I PHI CKD             ', 'AY71', 'AY71', '1', '1', 'P3', 'E46 ', 'N42 ', 'S', '4', 'L', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('287', 'AY81', '318I A                   ', 'AY81', 'AY81', '1', '1', '3', 'E46 ', 'N42 ', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('288', 'AY82', '318I RL A                ', 'AY81', 'AY81', '1', '1', '3', 'E46 ', 'N42 ', 'A', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('289', 'AY84', '318I RL MAL CKD A        ', 'AY81', 'AY81', '1', '1', 'L3', 'E46 ', 'N42 ', 'A', '4', 'R', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('290', 'AY85', '318I RL THA CKD A        ', 'AY81', 'AY81', '1', '1', 'T3', 'E46 ', 'N42 ', 'A', '4', 'R', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('291', 'AY86', '318I EGY CKD A           ', 'AY81', 'AY81', '1', '1', 'Y3', 'E46 ', 'N42 ', 'A', '4', 'L', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('292', 'AY87', '318I RL IND CKD A        ', 'AY81', 'AY81', '1', '1', 'D3', 'E46 ', 'N42 ', 'A', '4', 'R', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('293', 'AY88', '318I VIE SKD A           ', 'AY81', 'AY81', '1', '1', 'V3', 'E46 ', 'N42 ', 'A', '4', 'L', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('294', 'AY89', '318I PHI CKD A           ', 'AY81', 'AY81', '1', '1', 'P3', 'E46 ', 'N42 ', 'A', '4', 'L', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('295', 'AY97', '318I CHN CKD             ', 'AY71', 'AY71', '1', '1', '3C', 'E46 ', 'N42 ', 'S', '4', 'L', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('296', 'AY98', '318I RUS SKD             ', 'AY71', 'AY71', '1', '1', 'R3', 'E46 ', 'N42 ', 'S', '4', 'L', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('297', 'AZ06', '325I EGY CKD A           ', 'AV41', 'AV41', '1', '1', 'Y3', 'E46 ', 'M54 ', 'A', '4', 'L', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('298', 'AZ12', '320D RL                  ', 'AS71', 'AS71', '1', '1', 'Z3', 'E46 ', 'M47S', 'S', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('299', 'AZ22', '320D RL A                ', 'AS81', 'AS81', '1', '1', 'Z3', 'E46 ', 'M47S', 'A', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('300', 'AZ43', '325I US A                ', 'AZ43', 'AZ43', '1', '1', '3', 'E46 ', 'M56 ', 'A', '4', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('301', 'AZ71', '318I                     ', 'AY71', 'AY71', '1', '1', 'Z3', 'E46 ', 'N42 ', 'S', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('302', 'AZ72', '318I RL                  ', 'AY71', 'AY71', '1', '1', 'Z3', 'E46 ', 'N42 ', 'S', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('303', 'AZ81', '318I A                   ', 'AY81', 'AY81', '1', '1', 'Z3', 'E46 ', 'N42 ', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('304', 'AZ82', '318I RL A                ', 'AY81', 'AY81', '1', '1', 'Z3', 'E46 ', 'N42 ', 'A', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('305', 'AZ96', '325I EGY CKD             ', 'AV31', 'AV31', '1', '1', 'Y3', 'E46 ', 'M54 ', 'S', '4', 'L', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('306', 'BA11', '320 I KAT CABR           ', 'BA11', 'BA11', '1', '1', '3', 'E30 ', 'M20 ', 'S', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('307', 'BA12', '320 IRLKAT CABR          ', 'BA11', 'BA11', '1', '1', '3', 'E30 ', 'M20 ', 'S', '2', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('308', 'BA21', '320 IA KAT CABR          ', 'BA21', 'BA21', '1', '1', '3', 'E30 ', 'M20 ', 'A', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('309', 'BA22', '320 IARLKAT CAB          ', 'BA21', 'BA21', '1', '1', '3', 'E30 ', 'M20 ', 'A', '2', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('310', 'BA31', '320 I CABRIO             ', 'BA11', 'BA11', '1', '1', '3', 'E30 ', 'M20 ', 'S', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('311', 'BA32', '320 I CABRIO RHD         ', 'BA11', 'BA11', '1', '1', '3', 'E30 ', 'M20 ', 'S', '2', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('312', 'BA41', '320 I A CABRIO           ', 'BA21', 'BA21', '1', '1', '3', 'E30 ', 'M20 ', 'A', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('313', 'BA42', '320 I A CABRIO RHD       ', 'BA21', 'BA21', '1', '1', '3', 'E30 ', 'M20 ', 'A', '2', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('314', 'BA51', '318 I CABRIO             ', 'BA51', 'BA51', '1', '1', '3', 'E30 ', 'M40 ', 'S', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('315', 'BA52', '318 I RL CABRIO          ', 'BA51', 'BA51', '1', '1', '3', 'E30 ', 'M40 ', 'S', '2', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('316', 'BA61', '318 I A CABRIO           ', 'BA61', 'BA61', '1', '1', '3', 'E30 ', 'M40 ', 'A', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('317', 'BA62', '318I ARL CABRIO          ', 'BA61', 'BA61', '1', '1', '3', 'E30 ', 'M40 ', 'A', '2', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('318', 'BA73', '318 I USA CABRI          ', 'BA73', 'BA73', '1', '1', '3', 'E30 ', 'M42 ', 'S', '2', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('319', 'BA91', 'Z 1                      ', 'BA91', 'BA91', '1', '1', 'Z1', 'Z 1 ', 'M20 ', 'S', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('320', 'BB01', 'M 3 CABRIO               ', 'BB01', 'BB01', '1', '1', '3', 'E30 ', 'S14 ', 'S', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('321', 'BB05', 'M 3 KAT CABRIO           ', 'BB01', 'BB01', '1', '1', '3', 'E30 ', 'S14 ', 'S', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('322', 'BB11', '325 I KAT CABR           ', 'BB11', 'BB11', '1', '1', '3', 'E30 ', 'M20 ', 'S', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('323', 'BB12', '325IRL KAT CABR          ', 'BB11', 'BB11', '1', '1', '3', 'E30 ', 'M20 ', 'S', '2', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('324', 'BB13', '325 I USA CABR           ', 'BB13', 'BB13', '1', '1', '3', 'E30 ', 'M20 ', 'S', '2', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('325', 'BB21', '325 IA KAT CABR          ', 'BB21', 'BB21', '1', '1', '3', 'E30 ', 'M20 ', 'A', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('326', 'BB22', '325IARL KAT CAB          ', 'BB21', 'BB21', '1', '1', '3', 'E30 ', 'M20 ', 'A', '2', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('327', 'BB23', '325 I A USACABR          ', 'BB23', 'BB23', '1', '1', '3', 'E30 ', 'M20 ', 'A', '2', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('328', 'BB31', '325 I CABRIO             ', 'BB31', 'BB31', '1', '1', '3', 'E30 ', 'M20 ', 'S', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('329', 'BB32', '325 I   CABRIO RHD       ', 'BB31', 'BB31', '1', '1', '3', 'E30 ', 'M20 ', 'S', '2', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('330', 'BB41', '325 I A CABRIO           ', 'BB41', 'BB41', '1', '1', '3', 'E30 ', 'M20 ', 'A', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('331', 'BB42', '325 I A CABRIO RHD       ', 'BB41', 'BB41', '1', '1', '3', 'E30 ', 'M20 ', 'A', '2', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('332', 'BD01', '318CI CP A               ', 'BD01', 'BD01', '1', '1', '3', 'E46 ', 'N42 ', 'A', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('333', 'BD02', '318CI RL CP A            ', 'BD01', 'BD01', '1', '1', '3', 'E46 ', 'N42 ', 'A', '2', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('334', 'BD11', '320CI CP                 ', 'BD11', 'BD11', '1', '1', '3', 'E46 ', 'M54 ', 'S', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('335', 'BD12', '320CI RL CP              ', 'BD11', 'BD11', '1', '1', '3', 'E46 ', 'M54 ', 'S', '2', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('336', 'BD21', '320CI CP A               ', 'BD21', 'BD21', '1', '1', '3', 'E46 ', 'M54 ', 'A', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('337', 'BD22', '320CI RL CP A            ', 'BD21', 'BD21', '1', '1', '3', 'E46 ', 'M54 ', 'A', '2', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('338', 'BD31', '325CI CP                 ', 'BD31', 'BD31', '1', '1', '3', 'E46 ', 'M54 ', 'S', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('339', 'BD32', '325CI RL CP              ', 'BD31', 'BD31', '1', '1', '3', 'E46 ', 'M54 ', 'S', '2', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('340', 'BD33', '325CI US CP              ', 'BD33', 'BD33', '1', '1', '3', 'E46 ', 'M54 ', 'S', '2', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('341', 'BD41', '325CI CP A               ', 'BD41', 'BD41', '1', '1', '3', 'E46 ', 'M54 ', 'A', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('342', 'BD42', '325CI RL CP A            ', 'BD41', 'BD41', '1', '1', '3', 'E46 ', 'M54 ', 'A', '2', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('343', 'BD43', '325CI US CP A            ', 'BD43', 'BD43', '1', '1', '3', 'E46 ', 'M54 ', 'A', '2', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('344', 'BD51', '330CI CP                 ', 'BD51', 'BD51', '1', '1', '3', 'E46 ', 'M54 ', 'S', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('345', 'BD52', '330CI RL CP              ', 'BD51', 'BD51', '1', '1', '3', 'E46 ', 'M54 ', 'S', '2', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('346', 'BD53', '330CI US CP              ', 'BD53', 'BD53', '1', '1', '3', 'E46 ', 'M54 ', 'S', '2', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('347', 'BD61', '330CI CP A               ', 'BD61', 'BD61', '1', '1', '3', 'E46 ', 'M54 ', 'A', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('348', 'BD62', '330CI RL CP A            ', 'BD61', 'BD61', '1', '1', '3', 'E46 ', 'M54 ', 'A', '2', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('349', 'BD63', '330CI US CP A            ', 'BD63', 'BD63', '1', '1', '3', 'E46 ', 'M54 ', 'A', '2', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('350', 'BD71', '316CI CP                 ', 'BD71', 'BD71', '1', '1', '3', 'E46 ', 'N40 ', 'S', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('351', 'BD91', '318CI CP                 ', 'BD91', 'BD91', '1', '1', '3', 'E46 ', 'N42 ', 'S', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('352', 'BD92', '318CI RL CP              ', 'BD91', 'BD91', '1', '1', '3', 'E46 ', 'N42 ', 'S', '2', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('353', 'BE11', '316I COUPE               ', 'BE11', 'BE11', '1', '1', '3', 'E36 ', 'M43 ', 'S', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('354', 'BE12', '316I RL COUPE            ', 'BE11', 'BE11', '1', '1', '3', 'E36 ', 'M43 ', 'S', '2', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('355', 'BE21', '316I A COUPE             ', 'BE21', 'BE21', '1', '1', '3', 'E36 ', 'M43 ', 'A', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('356', 'BE22', '316I A RL COUPE          ', 'BE21', 'BE21', '1', '1', '3', 'E36 ', 'M43 ', 'A', '2', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('357', 'BE51', '318IS COUPE              ', 'BE51', 'BE51', '1', '1', '3', 'E36 ', 'M42 ', 'S', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('358', 'BE52', '318IS RL COUPE           ', 'BE51', 'BE51', '1', '1', '3', 'E36 ', 'M42 ', 'S', '2', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('359', 'BE53', '318IS US COUPE           ', 'BE53', 'BE53', '1', '1', '3', 'E36 ', 'M42 ', 'S', '2', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('360', 'BE61', '318IS A COUPE            ', 'BE61', 'BE61', '1', '1', '3', 'E36 ', 'M42 ', 'A', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('361', 'BE62', '318IS A RL COUP          ', 'BE61', 'BE61', '1', '1', '3', 'E36 ', 'M42 ', 'A', '2', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('362', 'BE63', '318IS A US COUP          ', 'BE63', 'BE63', '1', '1', '3', 'E36 ', 'M42 ', 'A', '2', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('363', 'BE71', '318IS COUPE              ', 'BE71', 'BE71', '1', '1', '3', 'E36 ', 'M44 ', 'S', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('364', 'BE72', '318IS RL COUPE           ', 'BE71', 'BE71', '1', '1', '3', 'E36 ', 'M44 ', 'S', '2', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('365', 'BE73', '318IS US COUPE           ', 'BE73', 'BE73', '1', '1', '3', 'E36 ', 'M44 ', 'S', '2', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('366', 'BE81', '318IS A COUPE            ', 'BE81', 'BE81', '1', '1', '3', 'E36 ', 'M44 ', 'A', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('367', 'BE82', '318IS A RL COUP          ', 'BE81', 'BE81', '1', '1', '3', 'E36 ', 'M44 ', 'A', '2', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('368', 'BE83', '318IS A US COUP          ', 'BE83', 'BE83', '1', '1', '3', 'E36 ', 'M44 ', 'A', '2', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('369', 'BF03', 'M3 A US COUPE            ', 'BF03', 'BF03', '1', '1', '3', 'E36 ', 'S50U', 'A', '2', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('370', 'BF11', '320I COUPE               ', 'BF11', 'BF11', '1', '1', '3', 'E36 ', 'M50 ', 'S', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('371', 'BF12', '320I RL COUPE            ', 'BF11', 'BF11', '1', '1', '3', 'E36 ', 'M50 ', 'S', '2', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('372', 'BF21', '320I A COUPE             ', 'BF21', 'BF21', '1', '1', '3', 'E36 ', 'M50 ', 'A', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('373', 'BF22', '320I A RL COUPE          ', 'BF21', 'BF21', '1', '1', '3', 'E36 ', 'M50 ', 'A', '2', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('374', 'BF31', '325I COUPE               ', 'BF31', 'BF31', '1', '1', '3', 'E36 ', 'M50 ', 'S', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('375', 'BF32', '325I RL COUPE            ', 'BF31', 'BF31', '1', '1', '3', 'E36 ', 'M50 ', 'S', '2', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('376', 'BF33', '325I US COUPE            ', 'BF33', 'BF33', '1', '1', '3', 'E36 ', 'M50 ', 'S', '2', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('377', 'BF38', '325IRL COZA SKD          ', 'BF31', 'BF31', '1', '1', 'C3', 'E36 ', 'M50 ', 'S', '2', 'R', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('378', 'BF41', '325I A COUPE             ', 'BF41', 'BF41', '1', '1', '3', 'E36 ', 'M50 ', 'A', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('379', 'BF42', '325I A RL COUPE          ', 'BF41', 'BF41', '1', '1', '3', 'E36 ', 'M50 ', 'A', '2', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('380', 'BF43', '325I A US COUPE          ', 'BF43', 'BF43', '1', '1', '3', 'E36 ', 'M50 ', 'A', '2', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('381', 'BF48', '325IARLCO ZASKD          ', 'BF41', 'BF41', '1', '1', 'C3', 'E36 ', 'M50 ', 'A', '2', 'R', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('382', 'BF51', '320I COUPE               ', 'BF51', 'BF51', '1', '1', '3', 'E36 ', 'M52 ', 'S', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('383', 'BF52', '320I RL COUPE            ', 'BF51', 'BF51', '1', '1', '3', 'E36 ', 'M52 ', 'S', '2', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('384', 'BF61', '320I A COUPE             ', 'BF61', 'BF61', '1', '1', '3', 'E36 ', 'M52 ', 'A', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('385', 'BF62', '320I A RL COUPE          ', 'BF61', 'BF61', '1', '1', '3', 'E36 ', 'M52 ', 'A', '2', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('386', 'BF71', '323I COUPE               ', 'BF71', 'BF71', '1', '1', '3', 'E36 ', 'M52 ', 'S', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('387', 'BF72', '323I RL COUPE            ', 'BF71', 'BF71', '1', '1', '3', 'E36 ', 'M52 ', 'S', '2', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('388', 'BF73', '323I USA COUPE           ', 'BF73', 'BF73', '1', '1', '3', 'E36 ', 'M52 ', 'S', '2', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('389', 'BF81', '323I A COUPE             ', 'BF81', 'BF81', '1', '1', '3', 'E36 ', 'M52 ', 'A', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('390', 'BF82', '323I A RL COUPE          ', 'BF81', 'BF81', '1', '1', '3', 'E36 ', 'M52 ', 'A', '2', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('391', 'BF83', '323I A USA COUP          ', 'BF83', 'BF83', '1', '1', '3', 'E36 ', 'M52 ', 'A', '2', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('392', 'BF91', 'M3 COUPE                 ', 'BF91', 'BF91', '1', '1', '3', 'E36 ', 'S50 ', 'S', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('393', 'BF92', 'M3 RL COUPE              ', 'BF91', 'BF91', '1', '1', '3', 'E36 ', 'S50 ', 'S', '2', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('394', 'BF93', 'M3 US COUPE              ', 'BF93', 'BF93', '1', '1', '3', 'E36 ', 'S50U', 'S', '2', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('395', 'BF98', 'M3 RL ZA SKD             ', 'BF91', 'BF91', '1', '1', 'C3', 'E36 ', 'S50 ', 'S', '2', 'R', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('396', 'BF99', 'M3 COUPE                 ', 'BF91', 'BF91', '1', '1', '3', 'E36 ', 'S50 ', 'S', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('397', 'BG11', '328I COUPE               ', 'BG11', 'BG11', '1', '1', '3', 'E36 ', 'M52 ', 'S', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('398', 'BG12', '328I RL COUPE            ', 'BG11', 'BG11', '1', '1', '3', 'E36 ', 'M52 ', 'S', '2', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('399', 'BG13', '328I US COUPE            ', 'BG13', 'BG13', '1', '1', '3', 'E36 ', 'M52 ', 'S', '2', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('400', 'BG21', '328I A COUPE             ', 'BG21', 'BG21', '1', '1', '3', 'E36 ', 'M52 ', 'A', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('401', 'BG22', '328I A RL COUPE          ', 'BG21', 'BG21', '1', '1', '3', 'E36 ', 'M52 ', 'A', '2', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('402', 'BG23', '328I A US COUPE          ', 'BG23', 'BG23', '1', '1', '3', 'E36 ', 'M52 ', 'A', '2', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('403', 'BG91', 'M3 COUPE                 ', 'BG91', 'BG91', '1', '1', '3', 'E36 ', 'S50 ', 'S', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('404', 'BG92', 'M3 RL COUPE              ', 'BG91', 'BG91', '1', '1', '3', 'E36 ', 'S50 ', 'S', '2', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('405', 'BG93', 'M3 US COUPE              ', 'BG93', 'BG93', '1', '1', '3', 'E36 ', 'S52 ', 'S', '2', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('406', 'BH31', '318I CABRIO              ', 'BH31', 'BH31', '1', '1', '3', 'E36 ', 'M43 ', 'S', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('407', 'BH32', '318I RL CABRIO           ', 'BH31', 'BH31', '1', '1', '3', 'E36 ', 'M43 ', 'S', '2', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('408', 'BH41', '318I A CABRIO            ', 'BH41', 'BH41', '1', '1', '3', 'E36 ', 'M43 ', 'A', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('409', 'BH42', '318I A RL CABR           ', 'BH41', 'BH41', '1', '1', '3', 'E36 ', 'M43 ', 'A', '2', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('410', 'BH73', '318IS US CABRIO          ', 'BH73', 'BH73', '1', '1', '3', 'E36 ', 'M44 ', 'S', '2', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('411', 'BH83', '318IS A US CABR          ', 'BH83', 'BH83', '1', '1', '3', 'E36 ', 'M44 ', 'A', '2', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('412', 'BJ11', '320I CABRIO              ', 'BJ11', 'BJ11', '1', '1', '3', 'E36 ', 'M50 ', 'S', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('413', 'BJ12', '320I RL CABRIO           ', 'BJ11', 'BJ11', '1', '1', '3', 'E36 ', 'M50 ', 'S', '2', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('414', 'BJ21', '320I A CABRIO            ', 'BJ21', 'BJ21', '1', '1', '3', 'E36 ', 'M50 ', 'A', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('415', 'BJ22', '320I A RL CABR           ', 'BJ21', 'BJ21', '1', '1', '3', 'E36 ', 'M50 ', 'A', '2', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('416', 'BJ31', '320I CABRIO              ', 'BJ31', 'BJ31', '1', '1', '3', 'E36 ', 'M52 ', 'S', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('417', 'BJ32', '320I RL CABRIO           ', 'BJ31', 'BJ31', '1', '1', '3', 'E36 ', 'M52 ', 'S', '2', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('418', 'BJ41', '320I A CABRIO            ', 'BJ41', 'BJ41', '1', '1', '3', 'E36 ', 'M52 ', 'A', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('419', 'BJ42', '320I A RL CABR           ', 'BJ41', 'BJ41', '1', '1', '3', 'E36 ', 'M52 ', 'A', '2', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('420', 'BJ51', '325I CABRIO              ', 'BJ51', 'BJ51', '1', '1', '3', 'E36 ', 'M50 ', 'S', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('421', 'BJ52', '325I RL CABRIO           ', 'BJ51', 'BJ51', '1', '1', '3', 'E36 ', 'M50 ', 'S', '2', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('422', 'BJ53', '325I US CABRIO           ', 'BJ53', 'BJ53', '1', '1', '3', 'E36 ', 'M50 ', 'S', '2', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('423', 'BJ61', '325I A CABRIO            ', 'BJ61', 'BJ61', '1', '1', '3', 'E36 ', 'M50 ', 'A', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('424', 'BJ62', '325I A RL CABR           ', 'BJ61', 'BJ61', '1', '1', '3', 'E36 ', 'M50 ', 'A', '2', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('425', 'BJ63', '325I A US CABR           ', 'BJ63', 'BJ63', '1', '1', '3', 'E36 ', 'M50 ', 'A', '2', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('426', 'BJ71', '323I CABRIO              ', 'BJ31', 'BJ31', '1', '1', '3', 'E36 ', 'M52 ', 'S', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('427', 'BJ72', '323I RL CABRIO           ', 'BJ31', 'BJ31', '1', '1', '3', 'E36 ', 'M52 ', 'S', '2', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('428', 'BJ73', '323I USA CABRIO          ', 'BJ73', 'BJ73', '1', '1', '3', 'E36 ', 'M52 ', 'S', '2', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('429', 'BJ81', '323I A CABRIO            ', 'BJ41', 'BJ41', '1', '1', '3', 'E36 ', 'M52 ', 'A', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('430', 'BJ82', '323I A RL CABR           ', 'BJ41', 'BJ41', '1', '1', '3', 'E36 ', 'M52 ', 'A', '2', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('431', 'BJ83', '323I A USA CABR          ', 'BJ83', 'BJ83', '1', '1', '3', 'E36 ', 'M52 ', 'A', '2', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('432', 'BJ91', 'M3 CABRIO                ', 'BJ91', 'BJ91', '1', '1', '3', 'E36 ', 'S50 ', 'S', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('433', 'BJ92', 'M3 RL CABRIO             ', 'BJ91', 'BJ91', '1', '1', '3', 'E36 ', 'S50 ', 'S', '2', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('434', 'BK03', 'M3 A US CABRIO           ', 'BK03', 'BK03', '1', '1', '3', 'E36 ', 'S52 ', 'A', '2', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('435', 'BK53', '318IS US CABRIO          ', 'BK53', 'BK53', '1', '1', '3', 'E36 ', 'M42 ', 'S', '2', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('436', 'BK63', '318IS A US CABR          ', 'BK63', 'BK63', '1', '1', '3', 'E36 ', 'M42 ', 'A', '2', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('437', 'BK71', '328I CABRIO              ', 'BK71', 'BK71', '1', '1', '3', 'E36 ', 'M52 ', 'S', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('438', 'BK72', '328I RL CABRIO           ', 'BK71', 'BK71', '1', '1', '3', 'E36 ', 'M52 ', 'S', '2', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('439', 'BK73', '328I US CABRIO           ', 'BK73', 'BK73', '1', '1', '3', 'E36 ', 'M52 ', 'S', '2', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('440', 'BK81', '328I A CABRIO            ', 'BK81', 'BK81', '1', '1', '3', 'E36 ', 'M52 ', 'A', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('441', 'BK82', '328I A RL CABR           ', 'BK81', 'BK81', '1', '1', '3', 'E36 ', 'M52 ', 'A', '2', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('442', 'BK83', '328I A US CABR           ', 'BK83', 'BK83', '1', '1', '3', 'E36 ', 'M52 ', 'A', '2', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('443', 'BK91', 'M3 CABRIO                ', 'BK91', 'BK91', '1', '1', '3', 'E36 ', 'S50 ', 'S', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('444', 'BK92', 'M3 RL CABRIO             ', 'BK91', 'BK91', '1', '1', '3', 'E36 ', 'S50 ', 'S', '2', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('445', 'BK93', 'M3 US CABRIO             ', 'BK93', 'BK93', '1', '1', '3', 'E36 ', 'S52 ', 'S', '2', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('446', 'BL31', '318CI CP                 ', 'BL31', 'BL31', '1', '1', '3', 'E46 ', 'M43 ', 'S', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('447', 'BL32', '318CI RL CP              ', 'BL31', 'BL31', '1', '1', '3', 'E46 ', 'M43 ', 'S', '2', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('448', 'BL41', '318CI CP A               ', 'BL41', 'BL41', '1', '1', '3', 'E46 ', 'M43 ', 'A', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('449', 'BL42', '318CI RL CP A            ', 'BL41', 'BL41', '1', '1', '3', 'E46 ', 'M43 ', 'A', '2', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('450', 'BL51', '316CI CP                 ', 'BL51', 'BL51', '1', '1', '3', 'E46 ', 'M43 ', 'S', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('451', 'BL91', 'M3 CP                    ', 'BL91', 'BL91', '1', '1', 'M3', 'E46 ', 'S54 ', 'S', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('452', 'BL92', 'M3 RL CP                 ', 'BL91', 'BL91', '1', '1', 'M3', 'E46 ', 'S54 ', 'S', '2', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('453', 'BL93', 'M3 US CP                 ', 'BL93', 'BL93', '1', '1', 'M3', 'E46 ', 'S54 ', 'S', '2', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('454', 'BL95', 'M3 CSL                   ', 'BL95', 'BL95', '1', '1', 'M3', 'E46 ', 'S54 ', 'S', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('455', 'BL96', 'M3 CSL RL                ', 'BL95', 'BL95', '1', '1', 'M3', 'E46 ', 'S54 ', 'S', '2', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('456', 'BM11', '320CI CP                 ', 'BM11', 'BM11', '1', '1', '3', 'E46 ', 'M52 ', 'S', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('457', 'BM21', '320CI CP A               ', 'BM21', 'BM21', '1', '1', '3', 'E46 ', 'M52 ', 'A', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('458', 'BM31', '323CI CP                 ', 'BM31', 'BM31', '1', '1', '3', 'E46 ', 'M52 ', 'S', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('459', 'BM32', '323CI RL CP              ', 'BM31', 'BM31', '1', '1', '3', 'E46 ', 'M52 ', 'S', '2', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('460', 'BM33', '323CI US CP              ', 'BM33', 'BM33', '1', '1', '3', 'E46 ', 'M52 ', 'S', '2', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('461', 'BM41', '323CI CP A               ', 'BM41', 'BM41', '1', '1', '3', 'E46 ', 'M52 ', 'A', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('462', 'BM42', '323CI RL CP A            ', 'BM41', 'BM41', '1', '1', '3', 'E46 ', 'M52 ', 'A', '2', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('463', 'BM43', '323CI US CP A            ', 'BM43', 'BM43', '1', '1', '3', 'E46 ', 'M52 ', 'A', '2', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('464', 'BM51', '328CI CP                 ', 'BM51', 'BM51', '1', '1', '3', 'E46 ', 'M52 ', 'S', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('465', 'BM52', '328CI RL CP              ', 'BM51', 'BM51', '1', '1', '3', 'E46 ', 'M52 ', 'S', '2', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('466', 'BM53', '328CI US CP              ', 'BM53', 'BM53', '1', '1', '3', 'E46 ', 'M52 ', 'S', '2', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('467', 'BM61', '328CI CP A               ', 'BM61', 'BM61', '1', '1', '3', 'E46 ', 'M52 ', 'A', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('468', 'BM62', '328CI RL CP A            ', 'BM61', 'BM61', '1', '1', '3', 'E46 ', 'M52 ', 'A', '2', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('469', 'BM63', '328CI US CP A            ', 'BM63', 'BM63', '1', '1', '3', 'E46 ', 'M52 ', 'A', '2', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('470', 'BM71', '316CI CP                 ', 'BM71', 'BM71', '1', '1', '3', 'E46 ', 'N40 ', 'S', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('471', 'BN11', '320CI CP                 ', 'BN11', 'BN11', '1', '1', '3', 'E46 ', 'M54 ', 'S', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('472', 'BN12', '320CI RL CP              ', 'BN11', 'BN11', '1', '1', '3', 'E46 ', 'M54 ', 'S', '2', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('473', 'BN21', '320CI CP A               ', 'BN21', 'BN21', '1', '1', '3', 'E46 ', 'M54 ', 'A', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('474', 'BN22', '320CI RL CP A            ', 'BN21', 'BN21', '1', '1', '3', 'E46 ', 'M54 ', 'A', '2', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('475', 'BN31', '325CI CP                 ', 'BN31', 'BN31', '1', '1', '3', 'E46 ', 'M54 ', 'S', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('476', 'BN32', '325CI RL CP              ', 'BN31', 'BN31', '1', '1', '3', 'E46 ', 'M54 ', 'S', '2', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('477', 'BN33', '325CI US CP              ', 'BN33', 'BN33', '1', '1', '3', 'E46 ', 'M54 ', 'S', '2', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('478', 'BN41', '325CI CP A               ', 'BN41', 'BN41', '1', '1', '3', 'E46 ', 'M54 ', 'A', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('479', 'BN42', '325CI RL CP A            ', 'BN41', 'BN41', '1', '1', '3', 'E46 ', 'M54 ', 'A', '2', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('480', 'BN43', '325CI US CP A            ', 'BN43', 'BN43', '1', '1', '3', 'E46 ', 'M54 ', 'A', '2', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('481', 'BN51', '330CI CP                 ', 'BN51', 'BN51', '1', '1', '3', 'E46 ', 'M54 ', 'S', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('482', 'BN52', '330CI RL CP              ', 'BN51', 'BN51', '1', '1', '3', 'E46 ', 'M54 ', 'S', '2', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('483', 'BN53', '330CI US CP              ', 'BN53', 'BN53', '1', '1', '3', 'E46 ', 'M54 ', 'S', '2', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('484', 'BN61', '330CI CP A               ', 'BN61', 'BN61', '1', '1', '3', 'E46 ', 'M54 ', 'A', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('485', 'BN62', '330CI RL CP A            ', 'BN61', 'BN61', '1', '1', '3', 'E46 ', 'M54 ', 'A', '2', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('486', 'BN63', '330CI US CP A            ', 'BN63', 'BN63', '1', '1', '3', 'E46 ', 'M54 ', 'A', '2', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('487', 'BN83', '325CI US CP A            ', 'BN83', 'BN83', '1', '1', '3', 'E46 ', 'M56 ', 'A', '2', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('488', 'BP71', '318CI CA                 ', 'BP71', 'BP71', '1', '1', '3', 'E46 ', 'N42 ', 'S', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('489', 'BP72', '318CI RL CA              ', 'BP71', 'BP71', '1', '1', '3', 'E46 ', 'N42 ', 'S', '2', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('490', 'BP81', '318CI CA A               ', 'BP81', 'BP81', '1', '1', '3', 'E46 ', 'N42 ', 'A', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('491', 'BP82', '318CI RL CA A            ', 'BP81', 'BP81', '1', '1', '3', 'E46 ', 'N42 ', 'A', '2', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('492', 'BR31', '323CI CA                 ', 'BR31', 'BR31', '1', '1', '3', 'E46 ', 'M52 ', 'S', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('493', 'BR32', '323CI RL CA              ', 'BR31', 'BR31', '1', '1', '3', 'E46 ', 'M52 ', 'S', '2', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('494', 'BR33', '323CI US CA              ', 'BR33', 'BR33', '1', '1', '3', 'E46 ', 'M52 ', 'S', '2', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('495', 'BR41', '323CI CA A               ', 'BR41', 'BR41', '1', '1', '3', 'E46 ', 'M52 ', 'A', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('496', 'BR42', '323CI RL CA A            ', 'BR41', 'BR41', '1', '1', '3', 'E46 ', 'M52 ', 'A', '2', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('497', 'BR43', '323CI US CA A            ', 'BR43', 'BR43', '1', '1', '3', 'E46 ', 'M52 ', 'A', '2', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('498', 'BR91', 'M3 CA                    ', 'BR91', 'BR91', '1', '1', 'M3', 'E46 ', 'S54 ', 'S', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('499', 'BR92', 'M3 RL CA                 ', 'BR91', 'BR91', '1', '1', 'M3', 'E46 ', 'S54 ', 'S', '2', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('500', 'BR93', 'M3 US CA                 ', 'BR93', 'BR93', '1', '1', 'M3', 'E46 ', 'S54 ', 'S', '2', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('501', 'BS11', '320CI CA                 ', 'BS11', 'BS11', '1', '1', '3', 'E46 ', 'M54 ', 'S', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('502', 'BS12', '320CI RL CA              ', 'BS11', 'BS11', '1', '1', '3', 'E46 ', 'M54 ', 'S', '2', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('503', 'BS21', '320CI CA A               ', 'BS21', 'BS21', '1', '1', '3', 'E46 ', 'M54 ', 'A', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('504', 'BS22', '320CI RL CA A            ', 'BS21', 'BS21', '1', '1', '3', 'E46 ', 'M54 ', 'A', '2', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('505', 'BS31', '325CI CA                 ', 'BS31', 'BS31', '1', '1', '3', 'E46 ', 'M54 ', 'S', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('506', 'BS32', '325CI RL CA              ', 'BS31', 'BS31', '1', '1', '3', 'E46 ', 'M54 ', 'S', '2', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('507', 'BS33', '325CI US CA              ', 'BS33', 'BS33', '1', '1', '3', 'E46 ', 'M54 ', 'S', '2', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('508', 'BS41', '325CI CA A               ', 'BS41', 'BS41', '1', '1', '3', 'E46 ', 'M54 ', 'A', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('509', 'BS42', '325CI RL CA A            ', 'BS41', 'BS41', '1', '1', '3', 'E46 ', 'M54 ', 'A', '2', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('510', 'BS43', '325CI US CA A            ', 'BS43', 'BS43', '1', '1', '3', 'E46 ', 'M54 ', 'A', '2', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('511', 'BS51', '330CI CA                 ', 'BS51', 'BS51', '1', '1', '3', 'E46 ', 'M54 ', 'S', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('512', 'BS52', '330CI RL CA              ', 'BS51', 'BS51', '1', '1', '3', 'E46 ', 'M54 ', 'S', '2', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('513', 'BS53', '330CI US CA              ', 'BS53', 'BS53', '1', '1', '3', 'E46 ', 'M54 ', 'S', '2', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('514', 'BS61', '330CI CA A               ', 'BS61', 'BS61', '1', '1', '3', 'E46 ', 'M54 ', 'A', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('515', 'BS62', '330CI RL CA A            ', 'BS61', 'BS61', '1', '1', '3', 'E46 ', 'M54 ', 'A', '2', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('516', 'BS63', '330CI US CA A            ', 'BS63', 'BS63', '1', '1', '3', 'E46 ', 'M54 ', 'A', '2', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('517', 'BS71', '320CD CA                 ', 'BS71', 'BS71', '1', '1', '3', 'E46 ', 'M47S', 'S', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('518', 'BS72', '320CD CA RL              ', 'BS71', 'BS71', '1', '1', '3', 'E46 ', 'M47S', 'S', '2', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('519', 'BT11', 'Z4 2 2 RO                ', 'BT11', 'BT11', '1', '1', 'Z4', 'E85 ', 'M54 ', 'S', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('520', 'BT12', 'Z4 2 2 RL RO             ', 'BT11', 'BT11', '1', '1', 'Z4', 'E85 ', 'M54 ', 'S', '2', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('521', 'BT21', 'Z4 2 2 RO A              ', 'BT21', 'BT21', '1', '1', 'Z4', 'E85 ', 'M54 ', 'A', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('522', 'BT22', 'Z4 2 2 RL RO A           ', 'BT21', 'BT21', '1', '1', 'Z4', 'E85 ', 'M54 ', 'A', '2', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('523', 'BT31', 'Z4 2 5 RO                ', 'BT31', 'BT31', '1', '1', 'Z4', 'E85 ', 'M54 ', 'S', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('524', 'BT32', 'Z4 2 5 RL RO             ', 'BT31', 'BT31', '1', '1', 'Z4', 'E85 ', 'M54 ', 'S', '2', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('525', 'BT33', 'Z4 2 5 US RO             ', 'BT33', 'BT33', '1', '1', 'Z4', 'E85 ', 'M54 ', 'S', '2', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('526', 'BT41', 'Z4 2 5 RO A              ', 'BT41', 'BT41', '1', '1', 'Z4', 'E85 ', 'M54 ', 'A', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('527', 'BT42', 'Z4 2 5 RL RO A           ', 'BT41', 'BT41', '1', '1', 'Z4', 'E85 ', 'M54 ', 'A', '2', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('528', 'BT43', 'Z4 2 5 US RO A           ', 'BT43', 'BT43', '1', '1', 'Z4', 'E85 ', 'M54 ', 'A', '2', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('529', 'BT51', 'Z4 3 0 RO                ', 'BT51', 'BT51', '1', '1', 'Z4', 'E85 ', 'M54 ', 'S', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('530', 'BT52', 'Z4 3 0 RL RO             ', 'BT51', 'BT51', '1', '1', 'Z4', 'E85 ', 'M54 ', 'S', '2', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('531', 'BT53', 'Z4 3 0 US RO             ', 'BT53', 'BT53', '1', '1', 'Z4', 'E85 ', 'M54 ', 'S', '2', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('532', 'BT61', 'Z4 3 0 RO A              ', 'BT61', 'BT61', '1', '1', 'Z4', 'E85 ', 'M54 ', 'A', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('533', 'BT62', 'Z4 3 0 RL RO A           ', 'BT61', 'BT61', '1', '1', 'Z4', 'E85 ', 'M54 ', 'A', '2', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('534', 'BT63', 'Z4 3 0 US RO A           ', 'BT63', 'BT63', '1', '1', 'Z4', 'E85 ', 'M54 ', 'A', '2', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('535', 'BT91', 'M ROADSTER               ', 'BT91', 'BT91', '1', '1', 'Z4', 'E85 ', 'S54 ', 'S', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('536', 'BT92', 'M ROADSTER               ', 'BT91', 'BT91', '1', '1', 'Z4', 'E85 ', 'S54 ', 'S', '2', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('537', 'BT93', 'M ROADSTER               ', 'BT93', 'BT93', '1', '1', 'Z4', 'E85 ', 'S54 ', 'S', '2', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('538', 'BU11', 'Z4 2 5 RO                ', 'BU11', 'BU11', '1', '1', 'Z4', 'E85 ', 'N52 ', 'S', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('539', 'BU12', 'Z4 2 5 RL RO             ', 'BU11', 'BU11', '1', '1', 'Z4', 'E85 ', 'N52 ', 'S', '2', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('540', 'BU21', 'Z4 2 5 RO A              ', 'BU21', 'BU21', '1', '1', 'Z4', 'E85 ', 'N52 ', 'A', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('541', 'BU22', 'Z4 2 5 RL RO A           ', 'BU21', 'BU21', '1', '1', 'Z4', 'E85 ', 'N52 ', 'A', '2', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('542', 'BU31', 'Z4 2 5SI RO              ', 'BU31', 'BU31', '1', '1', 'Z4', 'E85 ', 'N52 ', 'S', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('543', 'BU32', 'Z4 2 5SI RL RO           ', 'BU31', 'BU31', '1', '1', 'Z4', 'E85 ', 'N52 ', 'S', '2', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('544', 'BU33', 'Z4 3 0 US RO             ', 'BU33', 'BU33', '1', '1', 'Z4', 'E85 ', 'N52 ', 'S', '2', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('545', 'BU41', 'Z4 2 5SI RO A            ', 'BU41', 'BU41', '1', '1', 'Z4', 'E85 ', 'N52 ', 'A', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('546', 'BU42', 'Z4 2 5SI RL RO A         ', 'BU41', 'BU41', '1', '1', 'Z4', 'E85 ', 'N52 ', 'A', '2', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('547', 'BU43', 'Z4 3 0 US RO A           ', 'BU43', 'BU43', '1', '1', 'Z4', 'E85 ', 'N52 ', 'A', '2', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('548', 'BU51', 'Z4 3 0SI RO              ', 'BU51', 'BU51', '1', '1', 'Z4', 'E85 ', 'N52 ', 'S', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('549', 'BU52', 'Z4 3 0SI RL RO           ', 'BU51', 'BU51', '1', '1', 'Z4', 'E85 ', 'N52 ', 'S', '2', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('550', 'BU53', 'Z4 3 0SI US RO           ', 'BU53', 'BU53', '1', '1', 'Z4', 'E85 ', 'N52 ', 'S', '2', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('551', 'BU61', 'Z4 3 0SI RO A            ', 'BU61', 'BU61', '1', '1', 'Z4', 'E85 ', 'N52 ', 'A', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('552', 'BU62', 'Z4 3 0SI RL RO A         ', 'BU61', 'BU61', '1', '1', 'Z4', 'E85 ', 'N52 ', 'A', '2', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('553', 'BU63', 'Z4 3 0SI US RO A         ', 'BU63', 'BU63', '1', '1', 'Z4', 'E85 ', 'N52 ', 'A', '2', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('554', 'BV01', '330CD CP A               ', 'BV01', 'BV01', '1', '1', '3', 'E46 ', 'M57T', 'A', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('555', 'BV02', '330CD CP RL A            ', 'BV01', 'BV01', '1', '1', '3', 'E46 ', 'M57T', 'A', '2', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('556', 'BV23', '325CI US CP A            ', 'BV23', 'BV23', '1', '1', '3', 'E46 ', 'M56 ', 'A', '2', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('557', 'BV51', '320CD CP                 ', 'BV51', 'BV51', '1', '1', '3', 'E46 ', 'M47S', 'S', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('558', 'BV52', '320CD RL CP              ', 'BV51', 'BV51', '1', '1', '3', 'E46 ', 'M47S', 'S', '2', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('559', 'BV61', '320CD CP A               ', 'BV61', 'BV61', '1', '1', '3', 'E46 ', 'M47S', 'A', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('560', 'BV62', '320CD RL CP A            ', 'BV61', 'BV61', '1', '1', '3', 'E46 ', 'M47S', 'A', '2', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('561', 'BV71', '318CI CP                 ', 'BV71', 'BV71', '1', '1', '3', 'E46 ', 'N42 ', 'S', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('562', 'BV72', '318CI RL CP              ', 'BV71', 'BV71', '1', '1', '3', 'E46 ', 'N42 ', 'S', '2', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('563', 'BV81', '318CI CP A               ', 'BV81', 'BV81', '1', '1', '3', 'E46 ', 'N42 ', 'A', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('564', 'BV82', '318CI RL CP A            ', 'BV81', 'BV81', '1', '1', '3', 'E46 ', 'N42 ', 'A', '2', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('565', 'BV91', '330CD CP                 ', 'BV91', 'BV91', '1', '1', '3', 'E46 ', 'M57T', 'S', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('566', 'BV92', '330CD CP RL              ', 'BV91', 'BV91', '1', '1', '3', 'E46 ', 'M57T', 'S', '2', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('567', 'BW11', '320CI CA                 ', 'BW11', 'BW11', '1', '1', '3', 'E46 ', 'M54 ', 'S', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('568', 'BW12', '320CI RL CA              ', 'BW11', 'BW11', '1', '1', '3', 'E46 ', 'M54 ', 'S', '2', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('569', 'BW21', '320CI CA A               ', 'BW21', 'BW21', '1', '1', '3', 'E46 ', 'M54 ', 'A', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('570', 'BW22', '320CI RL CA A            ', 'BW21', 'BW21', '1', '1', '3', 'E46 ', 'M54 ', 'A', '2', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('571', 'BW31', '325CI CA                 ', 'BW31', 'BW31', '1', '1', '3', 'E46 ', 'M54 ', 'S', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('572', 'BW32', '325CI RL CA              ', 'BW31', 'BW31', '1', '1', '3', 'E46 ', 'M54 ', 'S', '2', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('573', 'BW33', '325CI US CA              ', 'BW33', 'BW33', '1', '1', '3', 'E46 ', 'M54 ', 'S', '2', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('574', 'BW41', '325CI CA A               ', 'BW41', 'BW41', '1', '1', '3', 'E46 ', 'M54 ', 'A', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('575', 'BW42', '325CI RL CA A            ', 'BW41', 'BW41', '1', '1', '3', 'E46 ', 'M54 ', 'A', '2', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('576', 'BW43', '325CI US CA A            ', 'BW43', 'BW43', '1', '1', '3', 'E46 ', 'M54 ', 'A', '2', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('577', 'BW51', '330CI CA                 ', 'BW51', 'BW51', '1', '1', '3', 'E46 ', 'M54 ', 'S', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('578', 'BW52', '330CI RL CA              ', 'BW51', 'BW51', '1', '1', '3', 'E46 ', 'M54 ', 'S', '2', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('579', 'BW53', '330CI US CA              ', 'BW53', 'BW53', '1', '1', '3', 'E46 ', 'M54 ', 'S', '2', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('580', 'BW61', '330CI CA A               ', 'BW61', 'BW61', '1', '1', '3', 'E46 ', 'M54 ', 'A', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('581', 'BW62', '330CI RL CA A            ', 'BW61', 'BW61', '1', '1', '3', 'E46 ', 'M54 ', 'A', '2', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('582', 'BW63', '330CI US CA A            ', 'BW63', 'BW63', '1', '1', '3', 'E46 ', 'M54 ', 'A', '2', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('583', 'BW71', '318CI CA                 ', 'BW71', 'BW71', '1', '1', '3', 'E46 ', 'N42 ', 'S', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('584', 'BW72', '318CI RL CA              ', 'BW71', 'BW71', '1', '1', '3', 'E46 ', 'N42 ', 'S', '2', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('585', 'BW81', '318CI CA A               ', 'BW81', 'BW81', '1', '1', '3', 'E46 ', 'N42 ', 'A', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('586', 'BW82', '318CI RL CA A            ', 'BW81', 'BW81', '1', '1', '3', 'E46 ', 'N42 ', 'A', '2', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('587', 'BW91', '330CD CA                 ', 'BW91', 'BW91', '1', '1', '3', 'E46 ', 'M57T', 'S', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('588', 'BW92', '330CD RL CA              ', 'BW91', 'BW91', '1', '1', '3', 'E46 ', 'M57T', 'S', '2', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('589', 'BX01', '318CI CP A               ', 'BX01', 'BX01', '1', '1', '3', 'E46 ', 'N46 ', 'A', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('590', 'BX02', '318CI RL CP A            ', 'BX01', 'BX01', '1', '1', '3', 'E46 ', 'N46 ', 'A', '2', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('591', 'BX71', '316CI CP                 ', 'BX71', 'BX71', '1', '1', '3', 'E46 ', 'N45 ', 'S', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('592', 'BX91', '318CI CP                 ', 'BX91', 'BX91', '1', '1', '3', 'E46 ', 'N46 ', 'S', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('593', 'BX92', '318CI RL CP              ', 'BX91', 'BX91', '1', '1', '3', 'E46 ', 'N46 ', 'S', '2', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('594', 'BY71', '318CI CA                 ', 'BY71', 'BY71', '1', '1', '3', 'E46 ', 'N46 ', 'S', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('595', 'BY72', '318CI RL CA              ', 'BY71', 'BY71', '1', '1', '3', 'E46 ', 'N46 ', 'S', '2', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('596', 'BY81', '318CI CA A               ', 'BY81', 'BY81', '1', '1', '3', 'E46 ', 'N46 ', 'A', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('597', 'BY82', '318CI RL CA A            ', 'BY81', 'BY81', '1', '1', '3', 'E46 ', 'N46 ', 'A', '2', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('598', 'BZ11', 'Z4 2 0                   ', 'BZ11', 'BZ11', '1', '1', 'Z4', 'E85 ', 'N46 ', 'S', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('599', 'BZ12', 'Z4 2 0 RL                ', 'BZ11', 'BZ11', '1', '1', 'Z4', 'E85 ', 'N46 ', 'S', '2', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('600', 'BZ21', 'Z4 2 0 A                 ', '    ', '    ', '1', '1', 'Z4', 'E85 ', 'N46 ', 'A', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('601', 'BZ22', 'Z4 2 0 RL A              ', '    ', '    ', '1', '1', 'Z4', 'E85 ', 'N46 ', 'A', '2', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('602', 'CA01', '318I A LIM               ', 'CA01', 'CA01', '1', '1', '3', 'E36 ', 'M43 ', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('603', 'CA02', '318I A RL LIM            ', 'CA01', 'CA01', '1', '1', '3', 'E36 ', 'M43 ', 'A', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('604', 'CA04', '318I A RLMALCKD          ', 'CA01', 'CA01', '1', '1', 'L3', 'E36 ', 'M43 ', 'A', '4', 'R', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('605', 'CA05', '318I A RLTHACKD          ', 'CA01', 'CA01', '1', '1', 'T3', 'E36 ', 'M43 ', 'A', '4', 'R', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('606', 'CA07', '318I A RLINDCKD          ', 'CA01', 'CA01', '1', '1', 'D3', 'E36 ', 'M43 ', 'A', '4', 'R', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('607', 'CA08', '318I A RL ZA             ', 'CA01', 'CA01', '1', '1', 'C3', 'E36 ', 'M43 ', 'A', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('608', 'CA09', '318I A RL ZACKD          ', 'CA01', 'CA01', '1', '1', 'C3', 'E36 ', 'M43 ', 'A', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('609', 'CA11', '316 I/4                  ', 'CA11', 'CA11', '1', '1', '3', 'E36 ', 'M40 ', 'S', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('610', 'CA12', '316 I/4 RL               ', 'CA11', 'CA11', '1', '1', '3', 'E36 ', 'M40 ', 'S', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('611', 'CA21', '316 I/4 A                ', 'CA21', 'CA21', '1', '1', '3', 'E36 ', 'M40 ', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('612', 'CA22', '316 I/4 A RL             ', 'CA21', 'CA21', '1', '1', '3', 'E36 ', 'M40 ', 'A', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('613', 'CA31', '318 I/4                  ', 'CA31', 'CA31', '1', '1', '3', 'E36 ', 'M40 ', 'S', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('614', 'CA32', '318 I/4 RL               ', 'CA31', 'CA31', '1', '1', '3', 'E36 ', 'M40 ', 'S', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('615', 'CA34', '318I/4RL MALCKD          ', 'CA31', 'CA31', '1', '1', 'L3', 'E36 ', 'M40 ', 'S', '4', 'R', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('616', 'CA35', '318I/4RL THACKD          ', 'CA31', 'CA31', '1', '1', 'T3', 'E36 ', 'M40 ', 'S', '4', 'R', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('617', 'CA37', '318I/4RL INDCKD          ', 'CA31', 'CA31', '1', '1', 'D3', 'E36 ', 'M40 ', 'S', '4', 'R', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('618', 'CA38', '318I/4 RL ZACKD          ', 'CA31', 'CA31', '1', '1', 'C3', 'E36 ', 'M40 ', 'S', '4', 'R', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('619', 'CA41', '318 I/4 A                ', 'CA41', 'CA41', '1', '1', '3', 'E36 ', 'M40 ', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('620', 'CA42', '318 I/4 A RL             ', 'CA41', 'CA41', '1', '1', '3', 'E36 ', 'M40 ', 'A', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('621', 'CA44', '318/I4ARLMALCKD          ', 'CA41', 'CA41', '1', '1', 'L3', 'E36 ', 'M40 ', 'A', '4', 'R', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('622', 'CA45', '318I/4ARLTHACKD          ', 'CA41', 'CA41', '1', '1', 'T3', 'E36 ', 'M40 ', 'A', '4', 'R', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('623', 'CA47', '318I/4ARLINDCKD          ', 'CA41', 'CA41', '1', '1', 'D3', 'E36 ', 'M40 ', 'A', '4', 'R', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('624', 'CA48', '318I/4 ARLZACKD          ', 'CA41', 'CA41', '1', '1', 'C3', 'E36 ', 'M40 ', 'A', '4', 'R', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('625', 'CA51', '318IS LIMOUSINE          ', 'CA51', 'CA51', '1', '1', '3', 'E36 ', 'M42 ', 'S', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('626', 'CA52', '318IS RL LIM             ', 'CA51', 'CA51', '1', '1', '3', 'E36 ', 'M42 ', 'S', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('627', 'CA53', '318IS US LIM             ', 'CA53', 'CA53', '1', '1', '3', 'E36 ', 'M42 ', 'S', '4', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('628', 'CA57', '318IS/4 RL IND CKD       ', 'CA51', 'CA51', '1', '1', 'I3', 'E36 ', 'M42 ', 'S', '4', 'R', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('629', 'CA58', '318IS RL ZA CKD          ', 'CA51', 'CA51', '1', '1', 'C3', 'E36 ', 'M42 ', 'S', '4', 'R', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('630', 'CA61', '318IS A LIM              ', 'CA61', 'CA61', '1', '1', '3', 'E36 ', 'M42 ', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('631', 'CA62', '318IS A RL LIM           ', 'CA61', 'CA61', '1', '1', '3', 'E36 ', 'M42 ', 'A', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('632', 'CA63', '318IS A US LIM           ', 'CA63', 'CA63', '1', '1', '3', 'E36 ', 'M42 ', 'A', '4', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('633', 'CA68', '318IS A RLZACKD          ', 'CA61', 'CA61', '1', '1', 'C3', 'E36 ', 'M42 ', 'A', '4', 'R', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('634', 'CA71', '316I LIMOUSINE           ', 'CA71', 'CA71', '1', '1', '3', 'E36 ', 'M43 ', 'S', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('635', 'CA72', '316I RL LIM              ', 'CA71', 'CA71', '1', '1', '3', 'E36 ', 'M43 ', 'S', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('636', 'CA79', '316I PHI CKD             ', 'CA71', 'CA71', '1', '1', 'P3', 'E36 ', 'M43 ', 'S', '4', 'L', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('637', 'CA81', '316I A LIM               ', 'CA81', 'CA81', '1', '1', '3', 'E36 ', 'M43 ', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('638', 'CA82', '316I A RL LIM            ', 'CA81', 'CA81', '1', '1', '3', 'E36 ', 'M43 ', 'A', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('639', 'CA91', '318I LIMOUSINE           ', 'CA91', 'CA91', '1', '1', '3', 'E36 ', 'M43 ', 'S', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('640', 'CA92', '318I RL LIM              ', 'CA91', 'CA91', '1', '1', '3', 'E36 ', 'M43 ', 'S', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('641', 'CA94', '318I RL MAL CKD          ', 'CA91', 'CA91', '1', '1', 'L3', 'E36 ', 'M43 ', 'S', '4', 'R', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('642', 'CA95', '318I RL THA CKD          ', 'CA91', 'CA91', '1', '1', 'T3', 'E36 ', 'M43 ', 'S', '4', 'R', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('643', 'CA97', '318I RL IND CKD          ', 'CA91', 'CA91', '1', '1', 'D3', 'E36 ', 'M43 ', 'S', '4', 'R', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('644', 'CA98', '318I RL ZA               ', 'CA91', 'CA91', '1', '1', 'C3', 'E36 ', 'M43 ', 'S', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('645', 'CA99', '318I RL ZA CKD           ', 'CA91', 'CA91', '1', '1', 'C3', 'E36 ', 'M43 ', 'S', '4', 'R', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('646', 'CB11', '320I LIMOUSINE           ', 'CB11', 'CB11', '1', '1', '3', 'E36 ', 'M50 ', 'S', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('647', 'CB12', '320I RL LIM              ', 'CB11', 'CB11', '1', '1', '3', 'E36 ', 'M50 ', 'S', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('648', 'CB13', '320I US LIM              ', 'CB33', 'CB33', '1', '1', '3', 'E36 ', 'M50 ', 'S', '4', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('649', 'CB16', '320I BRA CKD             ', 'CB11', 'CB11', '1', '1', 'B3', 'E36 ', 'M50 ', 'S', '4', 'L', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('650', 'CB17', '320I/4 RLINDCKD          ', 'CB11', 'CB11', '1', '1', 'D3', 'E36 ', 'M50 ', 'S', '4', 'R', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('651', 'CB18', '320I RL ZA CKD           ', 'CB11', 'CB11', '1', '1', 'C3', 'E36 ', 'M50 ', 'S', '4', 'R', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('652', 'CB21', '320I A LIM               ', 'CB21', 'CB21', '1', '1', '3', 'E36 ', 'M50 ', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('653', 'CB22', '320I A RL LIM            ', 'CB21', 'CB21', '1', '1', '3', 'E36 ', 'M50 ', 'A', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('654', 'CB23', '320I A US LIM            ', 'CB43', 'CB43', '1', '1', '3', 'E36 ', 'M50 ', 'A', '4', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('655', 'CB27', '320I/4ARLINDCKD          ', 'CB21', 'CB21', '1', '1', 'D3', 'E36 ', 'M50 ', 'A', '4', 'R', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('656', 'CB28', '320I A RL ZACKD          ', 'CB21', 'CB21', '1', '1', 'C3', 'E36 ', 'M50 ', 'A', '4', 'R', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('657', 'CB31', '325I LIMOUSINE           ', 'CB31', 'CB31', '1', '1', '3', 'E36 ', 'M50 ', 'S', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('658', 'CB32', '325I RL LIM              ', 'CB31', 'CB31', '1', '1', '3', 'E36 ', 'M50 ', 'S', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('659', 'CB33', '325I US LIM              ', 'CB33', 'CB33', '1', '1', '3', 'E36 ', 'M50 ', 'S', '4', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('660', 'CB34', '325I RL MAL CKD          ', 'CB31', 'CB31', '1', '1', 'L3', 'E36 ', 'M50 ', 'S', '4', 'R', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('661', 'CB35', '325I RL THA CKD          ', 'CB31', 'CB31', '1', '1', 'T3', 'E36 ', 'M50 ', 'S', '4', 'R', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('662', 'CB38', '325I RL ZA CKD           ', 'CB31', 'CB31', '1', '1', 'C3', 'E36 ', 'M50 ', 'S', '4', 'R', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('663', 'CB39', '325I/4 URU  CKD          ', 'CB31', 'CB31', '1', '1', 'C3', 'E36 ', 'M50 ', 'S', '4', 'L', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('664', 'CB41', '325I A LIM               ', 'CB41', 'CB41', '1', '1', '3', 'E36 ', 'M50 ', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('665', 'CB42', '325I A RL LIM            ', 'CB41', 'CB41', '1', '1', '3', 'E36 ', 'M50 ', 'A', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('666', 'CB43', '325I A US LIM            ', 'CB43', 'CB43', '1', '1', '3', 'E36 ', 'M50 ', 'A', '4', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('667', 'CB44', '325I A RLMALCKD          ', 'CB41', 'CB41', '1', '1', 'L3', 'E36 ', 'M50 ', 'A', '4', 'R', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('668', 'CB45', '325I A RLTHACKD          ', 'CB41', 'CB41', '1', '1', 'T3', 'E36 ', 'M50 ', 'A', '4', 'R', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('669', 'CB47', '325I A MEX SKD           ', 'CB41', 'CB41', '1', '1', 'X3', 'E36 ', 'M50 ', 'A', '4', 'L', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('670', 'CB48', '325I A RL ZACKD          ', 'CB41', 'CB41', '1', '1', 'C3', 'E36 ', 'M50 ', 'A', '4', 'R', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('671', 'CB51', '320I LIMOUSINE           ', 'CB51', 'CB51', '1', '1', '3', 'E36 ', 'M52 ', 'S', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('672', 'CB52', '320I RL LIM              ', 'CB51', 'CB51', '1', '1', '3', 'E36 ', 'M52 ', 'S', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('673', 'CB57', '320I RL IND CKD          ', 'CB51', 'CB51', '1', '1', 'D3', 'E36 ', 'M52 ', 'S', '4', 'R', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('674', 'CB59', '320I VIE SKD             ', 'CB51', 'CB51', '1', '1', 'V3', 'E36 ', 'M52 ', 'S', '4', 'L', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('675', 'CB61', '320I A LIM               ', 'CB61', 'CB61', '1', '1', '3', 'E36 ', 'M52 ', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('676', 'CB62', '320I A RL LIM            ', 'CB61', 'CB61', '1', '1', '3', 'E36 ', 'M52 ', 'A', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('677', 'CB67', '320I A RLINDCKD          ', 'CB61', 'CB61', '1', '1', 'D3', 'E36 ', 'M52 ', 'A', '4', 'R', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('678', 'CB69', '320I A PHI CKD           ', 'CB61', 'CB61', '1', '1', 'V3', 'E36 ', 'M52 ', 'A', '4', 'L', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('679', 'CB71', '323I LIMOUSINE           ', 'CB71', 'CB71', '1', '1', '3', 'E36 ', 'M52 ', 'S', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('680', 'CB72', '323I RL LIM              ', 'CB71', 'CB71', '1', '1', '3', 'E36 ', 'M52 ', 'S', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('681', 'CB75', '323I RL THA CKD          ', 'CB71', 'CB71', '1', '1', 'T3', 'E36 ', 'M52 ', 'S', '4', 'R', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('682', 'CB77', '323I RL IND CKD          ', 'CB71', 'CB71', '1', '1', 'D3', 'E36 ', 'M52 ', 'S', '4', 'R', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('683', 'CB78', '323I RL ZA               ', 'CB71', 'CB71', '1', '1', 'C3', 'E36 ', 'M52 ', 'S', '4', 'R', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('684', 'CB81', '323I A LIM               ', 'CB81', 'CB81', '1', '1', '3', 'E36 ', 'M52 ', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('685', 'CB82', '323I A RL LIM            ', 'CB81', 'CB81', '1', '1', '3', 'E36 ', 'M52 ', 'A', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('686', 'CB85', '323I A RLTHACKD          ', 'CB81', 'CB81', '1', '1', 'T3', 'E36 ', 'M52 ', 'A', '4', 'R', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('687', 'CB87', '323I A RLINDCKD          ', 'CB81', 'CB81', '1', '1', 'D3', 'E36 ', 'M52 ', 'A', '4', 'R', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('688', 'CB88', '323I A RL ZA             ', 'CB81', 'CB81', '1', '1', 'C3', 'E36 ', 'M52 ', 'A', '4', 'R', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('689', 'CB89', '323I A MEX SKD           ', 'CB81', 'CB81', '1', '1', 'X3', 'E36 ', 'M52 ', 'A', '4', 'L', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('690', 'CB91', 'M3 LIMOUSINE             ', 'CB91', 'CB91', '1', '1', '3', 'E36 ', 'S50 ', 'S', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('691', 'CB92', 'M3 RL LIMOUSINE          ', 'CB91', 'CB91', '1', '1', '3', 'E36 ', 'S50 ', 'S', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('692', 'CC03', '318IS A US LIM           ', 'CD83', 'CD83', '1', '1', '3', 'E36 ', 'M44 ', 'A', '4', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('693', 'CC11', '325TD LIMOUSINE          ', 'CC11', 'CC11', '1', '1', '3', 'E36 ', 'M51T', 'S', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('694', 'CC12', '325TD RL LIM             ', 'CC11', 'CC11', '1', '1', '3', 'E36 ', 'M51T', 'S', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('695', 'CC21', '325TD A LIM              ', 'CC21', 'CC21', '1', '1', '3', 'E36 ', 'M51T', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('696', 'CC22', '325TD A RL LIM           ', 'CC21', 'CC21', '1', '1', '3', 'E36 ', 'M51T', 'A', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('697', 'CC31', '325TDS LIM               ', 'CC31', 'CC31', '1', '1', '3', 'E36 ', 'M51S', 'S', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('698', 'CC32', '325TDS RL LIM            ', 'CC31', 'CC31', '1', '1', '3', 'E36 ', 'M51S', 'S', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('699', 'CC38', '325TDS RL ZA             ', 'CC31', 'CC31', '1', '1', 'C3', 'E36 ', 'M51S', 'S', '4', 'R', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('700', 'CC41', '325TDS A LIM             ', 'CC41', 'CC41', '1', '1', '3', 'E36 ', 'M51S', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('701', 'CC42', '325TDS A RL LIM          ', 'CC41', 'CC41', '1', '1', '3', 'E36 ', 'M51S', 'A', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('702', 'CC51', '318TDS LIM               ', 'CC51', 'CC51', '1', '1', '3', 'E36 ', 'M41 ', 'S', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('703', 'CC52', '318TDS RL LIM            ', 'CC51', 'CC51', '1', '1', '3', 'E36 ', 'M41 ', 'S', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('704', 'CC73', '318IS US LIM             ', 'CA53', 'CA53', '1', '1', '3', 'E36 ', 'M42 ', 'S', '4', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('705', 'CC83', '318IS A US LIM           ', 'CA63', 'CA63', '1', '1', '3', 'E36 ', 'M42 ', 'A', '4', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('706', 'CC93', '318IS US LIM             ', 'CD73', 'CD73', '1', '1', '3', 'E36 ', 'M44 ', 'S', '4', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('707', 'CD03', 'M3 A US LIM              ', 'CD03', 'CD03', '1', '1', '3', 'E36 ', 'S52 ', 'A', '4', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('708', 'CD11', '328I LIMOUSINE           ', 'CD11', 'CD11', '1', '1', '3', 'E36 ', 'M52 ', 'S', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('709', 'CD12', '328I RL LIM              ', 'CD11', 'CD11', '1', '1', '3', 'E36 ', 'M52 ', 'S', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('710', 'CD13', '328I US LIM              ', 'CD13', 'CD13', '1', '1', '3', 'E36 ', 'M52 ', 'S', '4', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('711', 'CD14', '328I RL MAL CKD          ', 'CD11', 'CD11', '1', '1', 'L3', 'E36 ', 'M52 ', 'S', '4', 'R', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('712', 'CD18', '328I RL ZA               ', 'CD11', 'CD11', '1', '1', 'C3', 'E36 ', 'M52 ', 'S', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('713', 'CD21', '328I A LIM               ', 'CD21', 'CD21', '1', '1', '3', 'E36 ', 'M52 ', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('714', 'CD22', '328I A RL LIM            ', 'CD21', 'CD21', '1', '1', '3', 'E36 ', 'M52 ', 'A', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('715', 'CD23', '328I A US LIM            ', 'CD23', 'CD23', '1', '1', '3', 'E36 ', 'M52 ', 'A', '4', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('716', 'CD24', '328I A RLMALCKD          ', 'CD21', 'CD21', '1', '1', 'L3', 'E36 ', 'M52 ', 'A', '4', 'R', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('717', 'CD27', '328I A MEX SKD           ', 'CD21', 'CD21', '1', '1', 'X3', 'E36 ', 'M52 ', 'A', '4', 'L', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('718', 'CD28', '328I A RL ZA             ', 'CD21', 'CD21', '1', '1', 'C3', 'E36 ', 'M52 ', 'A', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('719', 'CD33', '328I US LIM              ', 'CD13', 'CD13', '1', '1', '3', 'E36 ', 'M52 ', 'S', '4', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('720', 'CD43', '328I A US LIM            ', 'CD23', 'CD23', '1', '1', '3', 'E36 ', 'M52 ', 'A', '4', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('721', 'CD52', '318IS RL                 ', 'CD71', 'CD71', '1', '1', 'C3', 'E36 ', 'M44 ', 'S', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('722', 'CD62', '318IS A RL               ', 'CD81', 'CD81', '1', '1', 'C3', 'E36 ', 'M44 ', 'A', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('723', 'CD71', '318IS LIMOUSINE          ', 'CD71', 'CD71', '1', '1', '3', 'E36 ', 'M44 ', 'S', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('724', 'CD72', '318IS RL LIM             ', 'CD71', 'CD71', '1', '1', '3', 'E36 ', 'M44 ', 'S', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('725', 'CD73', '318IS US LIM             ', 'CD73', 'CD73', '1', '1', '3', 'E36 ', 'M44 ', 'S', '4', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('726', 'CD78', '318I RL ZA               ', 'CD71', 'CD71', '1', '1', 'C3', 'E36 ', 'M44 ', 'S', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('727', 'CD81', '318IS A LIM              ', 'CD81', 'CD81', '1', '1', '3', 'E36 ', 'M44 ', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('728', 'CD82', '318IS A RL LIM           ', 'CD81', 'CD81', '1', '1', '3', 'E36 ', 'M44 ', 'A', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('729', 'CD83', '318IS A US LIM           ', 'CD83', 'CD83', '1', '1', '3', 'E36 ', 'M44 ', 'A', '4', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('730', 'CD88', '318I A RL ZA             ', 'CD81', 'CD81', '1', '1', 'C3', 'E36 ', 'M44 ', 'A', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('731', 'CD91', 'M3 LIMOUSINE             ', 'CD91', 'CD91', '1', '1', '3', 'E36 ', 'S50 ', 'S', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('732', 'CD92', 'M3 RL LIMOUSINE          ', 'CD91', 'CD91', '1', '1', '3', 'E36 ', 'S50 ', 'S', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('733', 'CD93', 'M3 US LIMOUSINE          ', 'CD93', 'CD93', '1', '1', '3', 'E36 ', 'S52 ', 'S', '4', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('734', 'CD98', 'M3 RL ZA                 ', 'CD91', 'CD91', '1', '1', 'C3', 'E36 ', 'S50 ', 'S', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('735', 'CE11', '316I TOURING             ', 'CE11', 'CE11', '1', '1', '3', 'E36 ', 'M43 ', 'S', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('736', 'CE12', '316I RL TOURING          ', 'CE11', 'CE11', '1', '1', '3', 'E36 ', 'M43 ', 'S', '5', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('737', 'CE21', '316I A TOURING           ', 'CE21', 'CE21', '1', '1', '3', 'E36 ', 'M43 ', 'A', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('738', 'CE22', '316I A RL TOUR           ', 'CE21', 'CE21', '1', '1', '3', 'E36 ', 'M43 ', 'A', '5', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('739', 'CE31', '318I TOURING             ', 'CE31', 'CE31', '1', '1', '3', 'E36 ', 'M43 ', 'S', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('740', 'CE32', '318I RL TOURING          ', 'CE31', 'CE31', '1', '1', '3', 'E36 ', 'M43 ', 'S', '5', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('741', 'CE41', '318I A TOURING           ', 'CE41', 'CE41', '1', '1', '3', 'E36 ', 'M43 ', 'A', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('742', 'CE42', '318I A RL TOUR           ', 'CE41', 'CE41', '1', '1', '3', 'E36 ', 'M43 ', 'A', '5', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('743', 'CE51', '320I TOURING             ', 'CE51', 'CE51', '1', '1', '3', 'E36 ', 'M52 ', 'S', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('744', 'CE52', '320I RL TOURING          ', 'CE51', 'CE51', '1', '1', '3', 'E36 ', 'M52 ', 'S', '5', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('745', 'CE61', '320I A TOURING           ', 'CE61', 'CE61', '1', '1', '3', 'E36 ', 'M52 ', 'A', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('746', 'CE62', '320I A RL TOUR           ', 'CE61', 'CE61', '1', '1', '3', 'E36 ', 'M52 ', 'A', '5', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('747', 'CE71', '323I TOURING             ', 'CE71', 'CE71', '1', '1', '3', 'E36 ', 'M52 ', 'S', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('748', 'CE72', '323I RL TOUR             ', 'CE71', 'CE71', '1', '1', '3', 'E36 ', 'M52 ', 'S', '5', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('749', 'CE81', '323I A TOURING           ', 'CE81', 'CE81', '1', '1', '3', 'E36 ', 'M52 ', 'A', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('750', 'CE82', '323I A RL TOUR           ', 'CE81', 'CE81', '1', '1', '3', 'E36 ', 'M52 ', 'A', '5', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('751', 'CF01', '325TDS A TOUR            ', 'CF01', 'CF01', '1', '1', '3', 'E36 ', 'M51S', 'A', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('752', 'CF02', '325TDS A RLTOUR          ', 'CF01', 'CF01', '1', '1', '3', 'E36 ', 'M51S', 'A', '5', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('753', 'CF11', '328I TOURING             ', 'CF11', 'CF11', '1', '1', '3', 'E36 ', 'M52 ', 'S', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('754', 'CF12', '328I RL TOURING          ', 'CF11', 'CF11', '1', '1', '3', 'E36 ', 'M52 ', 'S', '5', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('755', 'CF21', '328I A TOURING           ', 'CF21', 'CF21', '1', '1', '3', 'E36 ', 'M52 ', 'A', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('756', 'CF22', '328I A RL TOUR           ', 'CF21', 'CF21', '1', '1', '3', 'E36 ', 'M52 ', 'A', '5', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('757', 'CF51', '318TDS TOURING           ', 'CF51', 'CF51', '1', '1', '3', 'E36 ', 'M41 ', 'S', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('758', 'CF52', '318TDS RL TOUR           ', 'CF51', 'CF51', '1', '1', '3', 'E36 ', 'M41 ', 'S', '5', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('759', 'CF91', '325TDS TOURING           ', 'CF91', 'CF91', '1', '1', '3', 'E36 ', 'M51S', 'S', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('760', 'CF92', '325TDS RL TOUR           ', 'CF91', 'CF91', '1', '1', '3', 'E36 ', 'M51S', 'S', '5', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('761', 'CG11', '316I KO                  ', 'CG11', 'CG11', '1', '1', '35', 'E36 ', 'M43 ', 'S', '3', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('762', 'CG12', '316I RL COMPACT          ', 'CG11', 'CG11', '1', '1', '35', 'E36 ', 'M43 ', 'S', '3', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('763', 'CG21', '316I A KO                ', 'CG21', 'CG21', '1', '1', '35', 'E36 ', 'M43 ', 'A', '3', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('764', 'CG22', '316I A RL COMP           ', 'CG21', 'CG21', '1', '1', '35', 'E36 ', 'M43 ', 'A', '3', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('765', 'CG31', '323TI COMPACT            ', 'CG31', 'CG31', '1', '1', '35', 'E36 ', 'M52 ', 'S', '3', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('766', 'CG41', '323TI A COMPACT          ', 'CG41', 'CG41', '1', '1', '35', 'E36 ', 'M52 ', 'A', '3', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('767', 'CG51', '318TI KOMPAKT            ', 'CG51', 'CG51', '1', '1', '35', 'E36 ', 'M42 ', 'S', '3', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('768', 'CG52', '318TI RL KOMP            ', 'CG51', 'CG51', '1', '1', '35', 'E36 ', 'M42 ', 'S', '3', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('769', 'CG53', '318TI US KOMP            ', 'CG53', 'CG53', '1', '1', '35', 'E36 ', 'M42 ', 'S', '3', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('770', 'CG61', '318TI A KOMPAKT          ', 'CG61', 'CG61', '1', '1', '35', 'E36 ', 'M42 ', 'A', '3', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('771', 'CG62', '318TI A RL KOMP          ', 'CG61', 'CG61', '1', '1', '35', 'E36 ', 'M42 ', 'A', '3', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('772', 'CG63', '318TI A US KOMP          ', 'CG63', 'CG63', '1', '1', '35', 'E36 ', 'M42 ', 'A', '3', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('773', 'CG71', '318TI COMPACT            ', 'CG71', 'CG71', '1', '1', '35', 'E36 ', 'M44 ', 'S', '3', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('774', 'CG72', '318TI RL KO              ', 'CG71', 'CG71', '1', '1', '35', 'E36 ', 'M44 ', 'S', '3', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('775', 'CG73', '318TI US COMP            ', 'CG73', 'CG73', '1', '1', '35', 'E36 ', 'M44 ', 'S', '3', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('776', 'CG81', '318TI A COMPACT          ', 'CG81', 'CG81', '1', '1', '35', 'E36 ', 'M44 ', 'A', '3', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('777', 'CG82', '318TI A RL KO            ', 'CG81', 'CG81', '1', '1', '35', 'E36 ', 'M44 ', 'A', '3', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('778', 'CG83', '318TI A US COMP          ', 'CG83', 'CG83', '1', '1', '35', 'E36 ', 'M44 ', 'A', '3', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('779', 'CH03', 'Z3 2 3 US RO A           ', 'CH03', 'CH03', '1', '1', '37', 'E36 ', 'M52 ', 'A', '2', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('780', 'CH11', '316G KO                  ', 'CG11', 'CG11', '1', '1', '35', 'E36 ', 'M43 ', 'S', '3', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('781', 'CH31', 'Z3 2 8 RO                ', 'CH31', 'CH31', '1', '1', '37', 'E36 ', 'M52 ', 'S', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('782', 'CH32', 'Z3 2 8 RL RO             ', 'CH31', 'CH31', '1', '1', '37', 'E36 ', 'M52 ', 'S', '2', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('783', 'CH33', 'Z3 2 8 US RO             ', 'CH33', 'CH33', '1', '1', '37', 'E36 ', 'M52 ', 'S', '2', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('784', 'CH41', 'Z3 2 8 RO A              ', 'CH41', 'CH41', '1', '1', '37', 'E36 ', 'M52 ', 'A', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('785', 'CH42', 'Z3 2 8 RL RO A           ', 'CH41', 'CH41', '1', '1', '37', 'E36 ', 'M52 ', 'A', '2', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('786', 'CH43', 'Z3 2 8 US RO A           ', 'CH43', 'CH43', '1', '1', '37', 'E36 ', 'M52 ', 'A', '2', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('787', 'CH71', 'Z3 1 9 ROADSTER          ', 'CH71', 'CH71', '1', '1', '37', 'E36 ', 'M44 ', 'S', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('788', 'CH72', 'Z3 1 9 RL ROAD           ', 'CH71', 'CH71', '1', '1', '37', 'E36 ', 'M44 ', 'S', '2', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('789', 'CH73', 'Z3 1 9 US ROAD           ', 'CH73', 'CH73', '1', '1', '37', 'E36 ', 'M44 ', 'S', '2', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('790', 'CH81', 'Z3 ROADSTER A            ', 'CH81', 'CH81', '1', '1', '37', 'E36 ', 'M44 ', 'A', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('791', 'CH82', 'Z3 1 9 RL ROAD A         ', 'CH81', 'CH81', '1', '1', '37', 'E36 ', 'M44 ', 'A', '2', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('792', 'CH83', 'Z3 1 9 US ROAD A         ', 'CH83', 'CH83', '1', '1', '37', 'E36 ', 'M44 ', 'A', '2', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('793', 'CH93', 'Z3 2 3 US RO             ', 'CH93', 'CH93', '1', '1', '37', 'E36 ', 'M52 ', 'S', '2', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('794', 'CJ11', 'Z3 1 8 ROADSTER          ', 'CJ11', 'CJ11', '1', '1', '37', 'E36 ', 'M43 ', 'S', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('795', 'CJ12', 'Z3 RL ROADSTER           ', 'CJ11', 'CJ11', '1', '1', '37', 'E36 ', 'M43 ', 'S', '2', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('796', 'CJ21', 'Z3 ROADSTER A            ', '    ', '    ', '1', '1', '37', 'E36 ', 'M43 ', 'A', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('797', 'CJ31', 'Z3 2 8 ROADSTER          ', 'CJ31', 'CJ31', '1', '1', '37', 'E36 ', 'M52 ', 'S', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('798', 'CJ32', 'Z3 2 8 RL ROAD           ', 'CJ31', 'CJ31', '1', '1', '37', 'E36 ', 'M52 ', 'S', '2', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('799', 'CJ33', 'Z3 2 8 US ROAD           ', 'CJ33', 'CJ33', '1', '1', '37', 'E36 ', 'M52 ', 'S', '2', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('800', 'CJ41', 'Z3 2 8 ROADSTER A        ', 'CJ41', 'CJ41', '1', '1', '37', 'E36 ', 'M52 ', 'A', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('801', 'CJ42', 'Z3 2 8 RL ROAD A         ', 'CJ41', 'CJ41', '1', '1', '37', 'E36 ', 'M52 ', 'A', '2', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('802', 'CJ43', 'Z3 2 8 US ROAD A         ', 'CJ43', 'CJ43', '1', '1', '37', 'E36 ', 'M52 ', 'A', '2', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('803', 'CJ51', '318TDS KO                ', 'CJ51', 'CJ51', '1', '1', '35', 'E36 ', 'M41 ', 'S', '3', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('804', 'CJ52', '318TDS RL KO             ', 'CJ51', 'CJ51', '1', '1', '35', 'E36 ', 'M41 ', 'S', '3', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('805', 'CK31', 'Z3C 2 8 COUPE            ', 'CK31', 'CK31', '1', '1', '37', 'E36 ', 'M52 ', 'S', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('806', 'CK32', 'Z3 C RL 2 8              ', 'CK31', 'CK31', '1', '1', '37', 'E36 ', 'M52 ', 'S', '2', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('807', 'CK33', 'Z3C 2 8 US COUP          ', 'CK33', 'CK33', '1', '1', '37', 'E36 ', 'M52 ', 'S', '2', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('808', 'CK41', 'Z3C 2 8 COUPE A          ', 'CK41', 'CK41', '1', '1', '37', 'E36 ', 'M52 ', 'A', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('809', 'CK42', 'Z3 2.8 COU A RL          ', 'CK41', 'CK41', '1', '1', '37', 'E36 ', 'M52 ', 'A', '2', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('810', 'CK43', 'Z3 2.8 US COU A          ', 'CK43', 'CK43', '1', '1', '37', 'E36 ', 'M52 ', 'A', '2', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('811', 'CK51', 'Z3 2 8 CP                ', 'CK51', 'CK51', '1', '1', '37', 'E36 ', 'M52 ', 'S', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('812', 'CK52', 'Z3 C RL 2 8              ', 'CK51', 'CK51', '1', '1', '37', 'E36 ', 'M52 ', 'S', '2', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('813', 'CK53', 'Z3 2 8 US CP             ', 'CK53', 'CK53', '1', '1', '37', 'E36 ', 'M52 ', 'S', '2', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('814', 'CK61', 'Z3 2 8 CP A              ', 'CK61', 'CK61', '1', '1', '37', 'E36 ', 'M52 ', 'A', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('815', 'CK62', 'Z3 2.8 COU A RL          ', 'CK61', 'CK61', '1', '1', '37', 'E36 ', 'M52 ', 'A', '2', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('816', 'CK63', 'Z3 2 8 US CP A           ', 'CK63', 'CK63', '1', '1', '37', 'E36 ', 'M52 ', 'A', '2', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('817', 'CK71', 'Z3 3 0 CP                ', 'CK71', 'CK71', '1', '1', '37', 'E36 ', 'M54 ', 'S', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('818', 'CK73', 'Z3 3 0 US CP             ', 'CK73', 'CK73', '1', '1', '37', 'E36 ', 'M54 ', 'S', '2', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('819', 'CK81', 'Z3 3 0 CP A              ', 'CK81', 'CK81', '1', '1', '37', 'E36 ', 'M54 ', 'A', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('820', 'CK83', 'Z3 3 0 US CP A           ', 'CK83', 'CK83', '1', '1', '37', 'E36 ', 'M54 ', 'A', '2', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('821', 'CK91', 'Z3 3 2 M-RO              ', 'CK91', 'CK91', '1', '1', '37', 'E36 ', 'S50 ', 'S', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('822', 'CK92', 'Z3 3 2 RL M-RO           ', 'CK91', 'CK91', '1', '1', '37', 'E36 ', 'S50 ', 'S', '2', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('823', 'CK93', 'Z3 3 2 US M-RO           ', 'CK93', 'CK93', '1', '1', '37', 'E36 ', 'S52 ', 'S', '2', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('824', 'CL31', 'Z3 2 0 RO                ', 'CL31', 'CL31', '1', '1', '37', 'E36 ', 'M52 ', 'S', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('825', 'CL32', 'Z3 2 0 RL RO             ', 'CL31', 'CL31', '1', '1', '37', 'E36 ', 'M52 ', 'S', '2', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('826', 'CL41', 'Z3 2 0 RO A              ', 'CL41', 'CL41', '1', '1', '37', 'E36 ', 'M52 ', 'A', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('827', 'CL42', 'Z3 2 0 RL RO A           ', 'CL41', 'CL41', '1', '1', '37', 'E36 ', 'M52 ', 'A', '2', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('828', 'CL91', 'Z3 3 2 M-RO              ', 'CL91', 'CL91', '1', '1', '37', 'E36 ', 'S54 ', 'S', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('829', 'CL92', 'Z3 3 2 RL M-RO           ', 'CL91', 'CL91', '1', '1', '37', 'E36 ', 'S54 ', 'S', '2', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('830', 'CL93', 'Z3 3 2 US M-RO           ', 'CL93', 'CL93', '1', '1', '37', 'E36 ', 'S54 ', 'S', '2', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('831', 'CM11', 'Z3 1 8 RO                ', 'CM11', 'CM11', '1', '1', '37', 'E36 ', 'M43 ', 'S', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('832', 'CM12', 'Z3 1 8 RL RO             ', 'CM11', 'CM11', '1', '1', '37', 'E36 ', 'M43 ', 'S', '2', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('833', 'CM91', 'Z3 3 2 M-CP              ', 'CM91', 'CM91', '1', '1', '37', 'E36 ', 'S50 ', 'S', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('834', 'CM92', 'Z3 3 2 RL M-CP           ', 'CM91', 'CM91', '1', '1', '37', 'E36 ', 'S50 ', 'S', '2', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('835', 'CM93', 'Z3 3 2 US M-CP           ', 'CM93', 'CM93', '1', '1', '37', 'E36 ', 'S52 ', 'S', '2', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('836', 'CN11', 'Z3 2 2 RO                ', 'CN11', 'CN11', '1', '1', '37', 'E36 ', 'M54 ', 'S', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('837', 'CN12', 'Z3 2 2 RL RO             ', 'CN11', 'CN11', '1', '1', '37', 'E36 ', 'M54 ', 'S', '2', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('838', 'CN13', 'Z3 2 2 US RO             ', '    ', '    ', '1', '1', '37', 'E36 ', 'M54 ', 'S', '2', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('839', 'CN21', 'Z3 2 2 RO A              ', 'CN21', 'CN21', '1', '1', '37', 'E36 ', 'M54 ', 'A', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('840', 'CN22', 'Z3 2 2 RL RO A           ', 'CN21', 'CN21', '1', '1', '37', 'E36 ', 'M54 ', 'A', '2', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('841', 'CN23', 'Z3 2 2 US RO A           ', '    ', '    ', '1', '1', '37', 'E36 ', 'M54 ', 'A', '2', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('842', 'CN33', 'Z3 2 5 US RO             ', 'CN33', 'CN33', '1', '1', '37', 'E36 ', 'M54 ', 'S', '2', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('843', 'CN43', 'Z3 2 5 US RO A           ', 'CN43', 'CN43', '1', '1', '37', 'E36 ', 'M54 ', 'A', '2', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('844', 'CN51', 'Z3 3 0 RO                ', 'CN51', 'CN51', '1', '1', '37', 'E36 ', 'M54 ', 'S', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('845', 'CN52', 'Z3 3 0 RL RO             ', 'CN51', 'CN51', '1', '1', '37', 'E36 ', 'M54 ', 'S', '2', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('846', 'CN53', 'Z3 3 0 US RO             ', 'CN53', 'CN53', '1', '1', '37', 'E36 ', 'M54 ', 'S', '2', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('847', 'CN61', 'Z3 3 0 RO A              ', 'CN61', 'CN61', '1', '1', '37', 'E36 ', 'M54 ', 'A', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('848', 'CN62', 'Z3 3 0 RL RO A           ', 'CN61', 'CN61', '1', '1', '37', 'E36 ', 'M54 ', 'A', '2', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('849', 'CN63', 'Z3 3 0 US RO A           ', 'CN63', 'CN63', '1', '1', '37', 'E36 ', 'M54 ', 'A', '2', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('850', 'CN91', 'Z3 3 2 M-CP              ', 'CN91', 'CN91', '1', '1', '37', 'E36 ', 'S54 ', 'S', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('851', 'CN92', 'Z3 3 2 RL M-CP           ', 'CN91', 'CN91', '1', '1', '37', 'E36 ', 'S54 ', 'S', '2', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('852', 'CN93', 'Z3 3 2 US M-CP           ', 'CN93', 'CN93', '1', '1', '37', 'E36 ', 'S54 ', 'S', '2', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('853', 'CP21', '316I A LIM               ', 'CA81', 'CA81', '1', '1', 'C3', 'E36 ', 'M43 ', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('854', 'CP31', '318I LIMOUSINE           ', 'CA91', 'CA91', '1', '1', 'C3', 'E36 ', 'M43 ', 'S', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('855', 'CP32', '318I RL LIM              ', 'CA91', 'CA91', '1', '1', 'C3', 'E36 ', 'M43 ', 'S', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('856', 'CP42', '318I A RL LIM            ', 'CA01', 'CA01', '1', '1', 'C3', 'E36 ', 'M43 ', 'A', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('857', 'CP71', '323I LIM                 ', 'CB71', 'CB71', '1', '1', 'C3', 'E36 ', 'M52 ', 'S', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('858', 'CP72', '323I RL LIM              ', 'CB71', 'CB71', '1', '1', 'C3', 'E36 ', 'M52 ', 'S', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('859', 'CP81', '323I A LIM               ', 'CB81', 'CB81', '1', '1', 'C3', 'E36 ', 'M52 ', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('860', 'CP82', '323I A RL LIM            ', 'CB81', 'CB81', '1', '1', 'C3', 'E36 ', 'M52 ', 'A', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('861', 'CS11', '316I KO                  ', 'CS11', 'CS11', '1', '1', '35', 'E36 ', 'M43 ', 'S', '3', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('862', 'CS12', '316I RL KO               ', 'CS11', 'CS11', '1', '1', '35', 'E36 ', 'M43 ', 'S', '3', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('863', 'CS21', '316I A KO                ', 'CS21', 'CS21', '1', '1', '35', 'E36 ', 'M43 ', 'A', '3', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('864', 'CS22', '316I A RL KO             ', 'CS21', 'CS21', '1', '1', '35', 'E36 ', 'M43 ', 'A', '3', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('865', 'CT31', '323TI KO                 ', 'CT31', 'CT31', '1', '1', '35', 'E36 ', 'M52 ', 'S', '3', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('866', 'CT41', '323TI A KO               ', 'CT41', 'CT41', '1', '1', '35', 'E36 ', 'M52 ', 'A', '3', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('867', 'CU11', '520LI                    ', 'CU11', 'CU11', '1', '1', '5C', 'F18 ', 'N20 ', 'S', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('868', 'CU21', '520LI A                  ', 'CU21', 'CU21', '1', '1', '5C', 'F18 ', 'N20 ', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('869', 'CU41', '525LI A                  ', 'CU41', 'CU41', '1', '1', '5C', 'F18 ', 'N20 ', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('870', 'CU61', '530LI CHN A              ', 'CU61', 'CU61', '1', '1', '5C', 'F18 ', 'N52T', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('871', 'CU81', '535LI CHN A              ', 'CU81', 'CU81', '1', '1', '5C', 'F18 ', 'N55 ', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('872', 'CZ31', 'ACTIVEE                  ', 'CZ31', 'CZ31', '1', '1', 'EC', 'M12 ', 'IB1 ', 'S', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('873', 'DC11', '535I KAT                 ', 'DC11', 'DC11', '1', '1', '5', 'E28 ', 'M30 ', 'S', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('874', 'DC12', '535I RL KAT              ', 'DC11', 'DC11', '1', '1', '5', 'E28 ', 'M30 ', 'S', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('875', 'DC21', '535I A KAT               ', 'DC21', 'DC21', '1', '1', '5', 'E28 ', 'M30 ', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('876', 'DC22', '535I A RL KAT            ', 'DC21', 'DC21', '1', '1', '5', 'E28 ', 'M30 ', 'A', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('877', 'DC29', '535I A JAP               ', 'DC29', 'DC29', '1', '1', '5', 'E28 ', 'M30 ', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('878', 'DC31', '535I                     ', 'DC11', 'DC11', '1', '1', '5', 'E28 ', 'M30 ', 'S', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('879', 'DC32', '535I RL                  ', 'DC11', 'DC11', '1', '1', '5', 'E28 ', 'M30 ', 'S', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('880', 'DC41', '535I A                   ', 'DC21', 'DC21', '1', '1', '5', 'E28 ', 'M30 ', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('881', 'DC42', '535I A RL                ', 'DC21', 'DC21', '1', '1', '5', 'E28 ', 'M30 ', 'A', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('882', 'DC51', '535I KAT                 ', 'DC51', 'DC51', '1', '1', '5', 'E28 ', 'M30 ', 'S', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('883', 'DC52', '535I RL KAT              ', 'DC51', 'DC51', '1', '1', '5', 'E28 ', 'M30 ', 'S', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('884', 'DC61', '535I A KAT               ', 'DC61', 'DC61', '1', '1', '5', 'E28 ', 'M30 ', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('885', 'DC71', 'M 535 I                  ', 'DC51', 'DC51', '1', '1', '5', 'E28 ', 'M30 ', 'S', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('886', 'DC72', '535I RL                  ', 'DC51', 'DC51', '1', '1', '5', 'E28 ', 'M30 ', 'S', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('887', 'DC74', '535 I USA                ', 'DC74', 'DC74', '1', '1', '5', 'E28 ', 'M30 ', 'S', '4', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('888', 'DC78', '535I RL ZA CKD           ', 'DC51', 'DC51', '1', '1', 'Z5', 'E28 ', 'M30 ', 'S', '4', 'R', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('889', 'DC81', '535I A                   ', 'DC61', 'DC61', '1', '1', '5', 'E28 ', 'M30 ', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('890', 'DC82', '535I A RL                ', 'DC61', 'DC61', '1', '1', '5', 'E28 ', 'M30 ', 'A', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('891', 'DC84', '535I A USA               ', 'DC29', 'DC29', '1', '1', '5', 'E28 ', 'M30 ', 'A', '4', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('892', 'DC88', '535I A RL ZA CKD         ', 'DC21', 'DC21', '1', '1', 'Z5', 'E28 ', 'M30 ', 'A', '4', 'R', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('893', 'DC89', '535I A JAP               ', 'DC29', 'DC29', '1', '1', '5', 'E28 ', 'M30 ', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('894', 'DC91', 'M 5                      ', 'DC91', 'DC91', '1', '1', '5', 'E28 ', 'S38 ', 'S', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('895', 'DC92', 'M5 RL                    ', 'DC91', 'DC91', '1', '1', '5', 'E28 ', 'S38 ', 'S', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('896', 'DC93', 'M5 US                    ', 'DC93', 'DC93', '1', '1', '5', 'E28 ', 'S38 ', 'S', '4', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('897', 'DD11', '520I                     ', 'DD11', 'DD11', '1', '1', '5', 'E39 ', 'M52 ', 'S', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('898', 'DD12', '520I RL                  ', 'DD11', 'DD11', '1', '1', '5', 'E39 ', 'M52 ', 'S', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('899', 'DD17', '520I RL IND CKD          ', 'DD11', 'DD11', '1', '1', 'C5', 'E39 ', 'M52 ', 'S', '4', 'R', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('900', 'DD21', '520I A                   ', 'DD21', 'DD21', '1', '1', '5', 'E39 ', 'M52 ', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('901', 'DD22', '520I A RL                ', 'DD21', 'DD21', '1', '1', '5', 'E39 ', 'M52 ', 'A', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('902', 'DD24', '520I A RLMALCKD          ', 'DD21', 'DD21', '1', '1', 'L5', 'E39 ', 'M52 ', 'A', '4', 'R', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('903', 'DD27', '520I A RLINDCKD          ', 'DD21', 'DD21', '1', '1', 'C5', 'E39 ', 'M52 ', 'A', '4', 'R', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('904', 'DD31', '523I                     ', 'DD31', 'DD31', '1', '1', '5', 'E39 ', 'M52 ', 'S', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('905', 'DD32', '523I RL                  ', 'DD31', 'DD31', '1', '1', '5', 'E39 ', 'M52 ', 'S', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('906', 'DD37', '523I RL IND CKD          ', 'DD31', 'DD31', '1', '1', 'C5', 'E39 ', 'M52 ', 'S', '4', 'R', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('907', 'DD41', '523I A                   ', 'DD41', 'DD41', '1', '1', '5', 'E39 ', 'M52 ', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('908', 'DD42', '523I A RL                ', 'DD41', 'DD41', '1', '1', '5', 'E39 ', 'M52 ', 'A', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('909', 'DD44', '523I A RLMALCKD          ', 'DD41', 'DD41', '1', '1', 'L5', 'E39 ', 'M52 ', 'A', '4', 'R', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('910', 'DD45', '523I A THA CKD           ', 'DD41', 'DD41', '1', '1', 'T5', 'E39 ', 'M52 ', 'A', '4', 'R', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('911', 'DD46', '523I A EGY CKD           ', 'DD41', 'DD41', '1', '1', 'Y5', 'E39 ', 'M52 ', 'A', '4', 'L', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('912', 'DD47', '523I A RLINDCKD          ', 'DD41', 'DD41', '1', '1', 'C5', 'E39 ', 'M52 ', 'A', '4', 'R', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('913', 'DD49', '523I A PHI SKD           ', 'DD41', 'DD41', '1', '1', 'P5', 'E39 ', 'M52 ', 'A', '4', 'L', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('914', 'DD51', '528I                     ', 'DD51', 'DD51', '1', '1', '5', 'E39 ', 'M52 ', 'S', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('915', 'DD52', '528I RL                  ', 'DD51', 'DD51', '1', '1', '5', 'E39 ', 'M52 ', 'S', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('916', 'DD53', '528I US                  ', 'DD53', 'DD53', '1', '1', '5', 'E39 ', 'M52 ', 'S', '4', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('917', 'DD56', '528I RL IND CKD          ', 'DD51', 'DD51', '1', '1', 'C5', 'E39 ', 'M52 ', 'S', '4', 'R', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('918', 'DD59', '528I VIE SKD             ', 'DD51', 'DD51', '1', '1', 'V5', 'E39 ', 'M52 ', 'S', '4', 'L', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('919', 'DD61', '528I A                   ', 'DD61', 'DD61', '1', '1', '5', 'E39 ', 'M52 ', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('920', 'DD62', '528I A RL                ', 'DD61', 'DD61', '1', '1', '5', 'E39 ', 'M52 ', 'A', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('921', 'DD63', '528I A US                ', 'DD63', 'DD63', '1', '1', '5', 'E39 ', 'M52 ', 'A', '4', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('922', 'DD64', '528I A RLMALCKD          ', 'DD61', 'DD61', '1', '1', 'L5', 'E39 ', 'M52 ', 'A', '4', 'R', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('923', 'DD66', '528I A RLINDCKD          ', 'DD61', 'DD61', '1', '1', 'C5', 'E39 ', 'M52 ', 'A', '4', 'R', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('924', 'DD67', '528I A MEX SKD           ', 'DD61', 'DD61', '1', '1', 'X5', 'E39 ', 'M52 ', 'A', '4', 'L', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('925', 'DE11', '535I                     ', 'DE11', 'DE11', '1', '1', '5', 'E39 ', 'M62 ', 'S', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('926', 'DE12', '535I RL                  ', 'DE11', 'DE11', '1', '1', '5', 'E39 ', 'M62 ', 'S', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('927', 'DE21', '535I A                   ', 'DE21', 'DE21', '1', '1', '5', 'E39 ', 'M62 ', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('928', 'DE22', '535I A RL                ', 'DE21', 'DE21', '1', '1', '5', 'E39 ', 'M62 ', 'A', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('929', 'DE51', '540I                     ', 'DE51', 'DE51', '1', '1', '5', 'E39 ', 'M62 ', 'S', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('930', 'DE52', '540I RL                  ', 'DE51', 'DE51', '1', '1', '5', 'E39 ', 'M62 ', 'S', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('931', 'DE53', '540I US                  ', 'DE53', 'DE53', '1', '1', '5', 'E39 ', 'M62 ', 'S', '4', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('932', 'DE61', '540I A                   ', 'DE61', 'DE61', '1', '1', '5', 'E39 ', 'M62 ', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('933', 'DE62', '540I A RL                ', 'DE61', 'DE61', '1', '1', '5', 'E39 ', 'M62 ', 'A', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('934', 'DE63', '540I A US                ', 'DE63', 'DE63', '1', '1', '5', 'E39 ', 'M62 ', 'A', '4', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('935', 'DE67', '540I A MEX SKD           ', 'DE61', 'DE61', '1', '1', 'X5', 'E39 ', 'M62 ', 'A', '4', 'L', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('936', 'DE81', '540I A                   ', 'DE81', 'DE81', '1', '1', '5', 'E39 ', 'M62 ', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('937', 'DE82', '540I A RL                ', 'DE81', 'DE81', '1', '1', '5', 'E39 ', 'M62 ', 'A', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('938', 'DE83', '540I A US                ', 'DE63', 'DE63', '1', '1', '5', 'E39 ', 'M62 ', 'A', '4', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('939', 'DE87', '540I A MEX SKD           ', 'DE81', 'DE81', '1', '1', 'X5', 'E39 ', 'M62 ', 'A', '4', 'L', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('940', 'DE91', 'M5                       ', 'DE91', 'DE91', '1', '1', 'M5', 'E39 ', 'S62 ', 'S', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('941', 'DE92', 'M5 RL                    ', 'DE91', 'DE91', '1', '1', 'M5', 'E39 ', 'S62 ', 'S', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('942', 'DE93', 'M5 US                    ', 'DE93', 'DE93', '1', '1', 'M5', 'E39 ', 'S62 ', 'S', '4', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('943', 'DF51', '525TD                    ', 'DF51', 'DF51', '1', '1', '5', 'E39 ', 'M51T', 'S', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('944', 'DF52', '525TD RL                 ', 'DF51', 'DF51', '1', '1', '5', 'E39 ', 'M51T', 'S', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('945', 'DF71', '525TDS                   ', 'DF71', 'DF71', '1', '1', '5', 'E39 ', 'M51S', 'S', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('946', 'DF72', '525TDS RL                ', 'DF71', 'DF71', '1', '1', '5', 'E39 ', 'M51S', 'S', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('947', 'DF81', '525TDS A                 ', 'DF81', 'DF81', '1', '1', '5', 'E39 ', 'M51S', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('948', 'DF82', '525TDS A RL              ', 'DF81', 'DF81', '1', '1', '5', 'E39 ', 'M51S', 'A', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('949', 'DG71', '525TDS TO                ', 'DG71', 'DG71', '1', '1', '5', 'E39 ', 'M51S', 'S', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('950', 'DG72', '525TDS RL TOUR           ', 'DG71', 'DG71', '1', '1', '5', 'E39 ', 'M51S', 'S', '5', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('951', 'DG81', '525TDS A TO              ', 'DG81', 'DG81', '1', '1', '5', 'E39 ', 'M51S', 'A', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('952', 'DG82', '525TDS A RLTOUR          ', 'DG81', 'DG81', '1', '1', '5', 'E39 ', 'M51S', 'A', '5', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('953', 'DH11', '520I TOURING             ', 'DH11', 'DH11', '1', '1', '5', 'E39 ', 'M52 ', 'S', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('954', 'DH12', '520I RL TOURING          ', 'DH11', 'DH11', '1', '1', '5', 'E39 ', 'M52 ', 'S', '5', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('955', 'DH21', '520I A TOURING           ', 'DH21', 'DH21', '1', '1', '5', 'E39 ', 'M52 ', 'A', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('956', 'DH22', '520I A RL TOUR           ', 'DH21', 'DH21', '1', '1', '5', 'E39 ', 'M52 ', 'A', '5', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('957', 'DH31', '523I TOURING             ', 'DH31', 'DH31', '1', '1', '5', 'E39 ', 'M52 ', 'S', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('958', 'DH32', '523I RL TOURING          ', 'DH31', 'DH31', '1', '1', '5', 'E39 ', 'M52 ', 'S', '5', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('959', 'DH41', '523I A TOURING           ', 'DH41', 'DH41', '1', '1', '5', 'E39 ', 'M52 ', 'A', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('960', 'DH42', '523I A RL TOUR           ', 'DH41', 'DH41', '1', '1', '5', 'E39 ', 'M52 ', 'A', '5', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('961', 'DH51', '528I TOURING             ', 'DH51', 'DH51', '1', '1', '5', 'E39 ', 'M52 ', 'S', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('962', 'DH52', '528I RL TOURING          ', 'DH51', 'DH51', '1', '1', '5', 'E39 ', 'M52 ', 'S', '5', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('963', 'DH61', '528I A TOURING           ', 'DH61', 'DH61', '1', '1', '5', 'E39 ', 'M52 ', 'A', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('964', 'DH62', '528I A RL TOUR           ', 'DH61', 'DH61', '1', '1', '5', 'E39 ', 'M52 ', 'A', '5', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('965', 'DJ51', '540I TOURING             ', 'DJ51', 'DJ51', '1', '1', '5', 'E39 ', 'M62 ', 'S', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('966', 'DJ52', '540I RL TOURING          ', 'DJ51', 'DJ51', '1', '1', '5', 'E39 ', 'M62 ', 'S', '5', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('967', 'DJ61', '540I A TOURING           ', 'DJ61', 'DJ61', '1', '1', '5', 'E39 ', 'M62 ', 'A', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('968', 'DJ62', '540I A RL TOUR           ', 'DJ61', 'DJ61', '1', '1', '5', 'E39 ', 'M62 ', 'A', '5', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('969', 'DL01', '525D A                   ', 'DL01', 'DL01', '1', '1', '5', 'E39 ', 'M57 ', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('970', 'DL02', '525D A RL                ', 'DL01', 'DL01', '1', '1', '5', 'E39 ', 'M57 ', 'A', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('971', 'DL38', '523I RUS SKD             ', 'DM31', 'DM31', '1', '1', 'R5', 'E39 ', 'M52 ', 'S', '4', 'L', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('972', 'DL48', '523I A RUS SKD           ', 'DM41', 'DM41', '1', '1', 'R5', 'E39 ', 'M52 ', 'A', '4', 'L', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('973', 'DL71', '530D                     ', 'DL71', 'DL71', '1', '1', '5', 'E39 ', 'M57 ', 'S', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('974', 'DL72', '530D RL                  ', 'DL71', 'DL71', '1', '1', '5', 'E39 ', 'M57 ', 'S', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('975', 'DL81', '530D A                   ', 'DL81', 'DL81', '1', '1', '5', 'E39 ', 'M57 ', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('976', 'DL82', '530D A RL                ', 'DL81', 'DL81', '1', '1', '5', 'E39 ', 'M57 ', 'A', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('977', 'DL91', '525D                     ', 'DL91', 'DL91', '1', '1', '5', 'E39 ', 'M57 ', 'S', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('978', 'DL92', '525D RL                  ', 'DL91', 'DL91', '1', '1', '5', 'E39 ', 'M57 ', 'S', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('979', 'DM11', '520I                     ', 'DM11', 'DM11', '1', '1', '5', 'E39 ', 'M52 ', 'S', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('980', 'DM12', '520I RL                  ', 'DM11', 'DM11', '1', '1', '5', 'E39 ', 'M52 ', 'S', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('981', 'DM21', '520I A                   ', 'DM21', 'DM21', '1', '1', '5', 'E39 ', 'M52 ', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('982', 'DM22', '520I A RL                ', 'DM21', 'DM21', '1', '1', '5', 'E39 ', 'M52 ', 'A', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('983', 'DM26', '520I EGY CKD             ', 'DM21', 'DM21', '1', '1', 'Y5', 'E39 ', 'M52 ', 'A', '4', 'L', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('984', 'DM31', '523I                     ', 'DM31', 'DM31', '1', '1', '5', 'E39 ', 'M52 ', 'S', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('985', 'DM32', '523I RL                  ', 'DM31', 'DM31', '1', '1', '5', 'E39 ', 'M52 ', 'S', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('986', 'DM41', '523I A                   ', 'DM41', 'DM41', '1', '1', '5', 'E39 ', 'M52 ', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('987', 'DM42', '523I A RL                ', 'DM41', 'DM41', '1', '1', '5', 'E39 ', 'M52 ', 'A', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('988', 'DM44', '523IARL MAL CKD          ', 'DM41', 'DM41', '1', '1', 'L5', 'E39 ', 'M52 ', 'A', '4', 'R', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('989', 'DM45', '523IARL THA CKD          ', 'DM41', 'DM41', '1', '1', 'T5', 'E39 ', 'M52 ', 'A', '4', 'R', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('990', 'DM46', '523I A EGY CKD           ', 'DM41', 'DM41', '1', '1', 'Y5', 'E39 ', 'M52 ', 'A', '4', 'L', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('991', 'DM49', '523I A PHI SKD           ', 'DM41', 'DM41', '1', '1', 'P5', 'E39 ', 'M52 ', 'A', '4', 'L', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('992', 'DM51', '528I                     ', 'DM51', 'DM51', '1', '1', '5', 'E39 ', 'M52 ', 'S', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('993', 'DM52', '528I RL                  ', 'DM51', 'DM51', '1', '1', '5', 'E39 ', 'M52 ', 'S', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('994', 'DM53', '528I US                  ', 'DM53', 'DM53', '1', '1', '5', 'E39 ', 'M52 ', 'S', '4', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('995', 'DM58', '528I RUS SKD             ', 'DM51', 'DM51', '1', '1', 'R5', 'E39 ', 'M52 ', 'S', '4', 'L', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('996', 'DM61', '528I A                   ', 'DM61', 'DM61', '1', '1', '5', 'E39 ', 'M52 ', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('997', 'DM62', '528I A RL                ', 'DM61', 'DM61', '1', '1', '5', 'E39 ', 'M52 ', 'A', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('998', 'DM63', '528I A US                ', 'DM63', 'DM63', '1', '1', '5', 'E39 ', 'M52 ', 'A', '4', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('999', 'DM64', '528IARL MAL CKD          ', 'DM61', 'DM61', '1', '1', 'L5', 'E39 ', 'M52 ', 'A', '4', 'R', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1000', 'DM66', '528IARL IND CKD          ', 'DM61', 'DM61', '1', '1', 'C5', 'E39 ', 'M52 ', 'A', '4', 'R', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1001', 'DM67', '528I A MEX SKD           ', 'DM61', 'DM61', '1', '1', 'X5', 'E39 ', 'M52 ', 'A', '4', 'L', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1002', 'DM68', '528I A RUS SKD           ', 'DM61', 'DM61', '1', '1', 'R5', 'E39 ', 'M52 ', 'A', '4', 'L', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1003', 'DM71', '520D                     ', 'DM71', 'DM71', '1', '1', '5', 'E39 ', 'M47 ', 'S', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1004', 'DM87', '528I A MEX SKD           ', 'DM61', 'DM61', '1', '1', 'X5', 'E39 ', 'M52 ', 'A', '4', 'L', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1005', 'DN11', '535I                     ', 'DN11', 'DN11', '1', '1', '5', 'E39 ', 'M62 ', 'S', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1006', 'DN12', '535I RL                  ', 'DN11', 'DN11', '1', '1', '5', 'E39 ', 'M62 ', 'S', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1007', 'DN21', '535I A                   ', 'DN21', 'DN21', '1', '1', '5', 'E39 ', 'M62 ', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1008', 'DN22', '535I A RL                ', 'DN21', 'DN21', '1', '1', '5', 'E39 ', 'M62 ', 'A', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1009', 'DN51', '540I                     ', 'DN51', 'DN51', '1', '1', '5', 'E39 ', 'M62 ', 'S', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1010', 'DN52', '540I RL                  ', 'DN51', 'DN51', '1', '1', '5', 'E39 ', 'M62 ', 'S', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1011', 'DN53', '540I US                  ', 'DN53', 'DN53', '1', '1', '5', 'E39 ', 'M62 ', 'S', '4', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1012', 'DN61', '540I A                   ', 'DN61', 'DN61', '1', '1', '5', 'E39 ', 'M62 ', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1013', 'DN62', '540I A RL                ', 'DN61', 'DN61', '1', '1', '5', 'E39 ', 'M62 ', 'A', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1014', 'DN63', '540I A US                ', 'DN63', 'DN63', '1', '1', '5', 'E39 ', 'M62 ', 'A', '4', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1015', 'DN67', '540I A MEX SKD           ', 'DN61', 'DN61', '1', '1', 'X5', 'E39 ', 'M62 ', 'A', '4', 'L', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1016', 'DN81', '540I A                   ', 'DN81', 'DN81', '1', '1', '5', 'E39 ', 'M62 ', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1017', 'DN82', '540I A RL                ', 'DN81', 'DN81', '1', '1', '5', 'E39 ', 'M62 ', 'A', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1018', 'DN83', '540I A US                ', '    ', '    ', '1', '1', '5', 'E39 ', 'M62 ', 'A', '4', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1019', 'DN87', '540I A MEX SKD           ', 'DN81', 'DN81', '1', '1', 'X5', 'E39 ', 'M62 ', 'A', '4', 'L', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1020', 'DP01', '525D A TO                ', 'DP01', 'DP01', '1', '1', '5', 'E39 ', 'M57 ', 'A', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1021', 'DP02', '525D A RL TO             ', 'DP01', 'DP01', '1', '1', '5', 'E39 ', 'M57 ', 'A', '5', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1022', 'DP51', '528I TO                  ', 'DP51', 'DP51', '1', '1', '5', 'E39 ', 'M52 ', 'S', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1023', 'DP52', '528I RL TO               ', 'DP51', 'DP51', '1', '1', '5', 'E39 ', 'M52 ', 'S', '5', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1024', 'DP53', '528I US TO               ', 'DP53', 'DP53', '1', '1', '5', 'E39 ', 'M52 ', 'S', '5', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1025', 'DP61', '528I A TO                ', 'DP61', 'DP61', '1', '1', '5', 'E39 ', 'M52 ', 'A', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1026', 'DP62', '528I A RL TO             ', 'DP61', 'DP61', '1', '1', '5', 'E39 ', 'M52 ', 'A', '5', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1027', 'DP63', '528I A US TO             ', 'DP63', 'DP63', '1', '1', '5', 'E39 ', 'M52 ', 'A', '5', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1028', 'DP71', '530D TO                  ', 'DP71', 'DP71', '1', '1', '5', 'E39 ', 'M57 ', 'S', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1029', 'DP72', '530D RL TO               ', 'DP71', 'DP71', '1', '1', '5', 'E39 ', 'M57 ', 'S', '5', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1030', 'DP81', '530D A TO                ', 'DP81', 'DP81', '1', '1', '5', 'E39 ', 'M57 ', 'A', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1031', 'DP82', '530D A RL TO             ', 'DP81', 'DP81', '1', '1', '5', 'E39 ', 'M57 ', 'A', '5', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1032', 'DP91', '525D TO                  ', 'DP91', 'DP91', '1', '1', '5', 'E39 ', 'M57 ', 'S', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1033', 'DP92', '525D RL TO               ', 'DP91', 'DP91', '1', '1', '5', 'E39 ', 'M57 ', 'S', '5', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1034', 'DR11', '520I TO                  ', 'DR11', 'DR11', '1', '1', '5', 'E39 ', 'M52 ', 'S', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1035', 'DR12', '520I RL TO               ', 'DR11', 'DR11', '1', '1', '5', 'E39 ', 'M52 ', 'S', '5', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1036', 'DR21', '520I A TO                ', 'DR21', 'DR21', '1', '1', '5', 'E39 ', 'M52 ', 'A', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1037', 'DR22', '520I A RL TO             ', 'DR21', 'DR21', '1', '1', '5', 'E39 ', 'M52 ', 'A', '5', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1038', 'DR31', '523I TO                  ', 'DR31', 'DR31', '1', '1', '5', 'E39 ', 'M52 ', 'S', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1039', 'DR32', '523I RL TO               ', 'DR31', 'DR31', '1', '1', '5', 'E39 ', 'M52 ', 'S', '5', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1040', 'DR41', '523I A TO                ', 'DR41', 'DR41', '1', '1', '5', 'E39 ', 'M52 ', 'A', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1041', 'DR42', '523I A RL TO             ', 'DR41', 'DR41', '1', '1', '5', 'E39 ', 'M52 ', 'A', '5', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1042', 'DR51', '540I TO                  ', 'DR51', 'DR51', '1', '1', '5', 'E39 ', 'M62 ', 'S', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1043', 'DR52', '540I RL TO               ', 'DR51', 'DR51', '1', '1', '5', 'E39 ', 'M62 ', 'S', '5', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1044', 'DR61', '540I A TO                ', 'DR61', 'DR61', '1', '1', '5', 'E39 ', 'M62 ', 'A', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1045', 'DR62', '540I A RL TO             ', 'DR61', 'DR61', '1', '1', '5', 'E39 ', 'M62 ', 'A', '5', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1046', 'DR63', '540I A US TO             ', 'DR63', 'DR63', '1', '1', '5', 'E39 ', 'M62 ', 'A', '5', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1047', 'DR71', '520D TO                  ', 'DR71', 'DR71', '1', '1', '5', 'E39 ', 'M47 ', 'S', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1048', 'DS11', '520I TO                  ', 'DS11', 'DS11', '1', '1', '5', 'E39 ', 'M54 ', 'S', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1049', 'DS12', '520I RL TO               ', 'DS11', 'DS11', '1', '1', '5', 'E39 ', 'M54 ', 'S', '5', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1050', 'DS21', '520I A TO                ', 'DS21', 'DS21', '1', '1', '5', 'E39 ', 'M54 ', 'A', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1051', 'DS22', '520I A RL TO             ', 'DS21', 'DS21', '1', '1', '5', 'E39 ', 'M54 ', 'A', '5', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1052', 'DS31', '525I TO                  ', 'DS31', 'DS31', '1', '1', '5', 'E39 ', 'M54 ', 'S', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1053', 'DS32', '525I RL TO               ', 'DS31', 'DS31', '1', '1', '5', 'E39 ', 'M54 ', 'S', '5', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1054', 'DS33', '525I US TO               ', 'DS33', 'DS33', '1', '1', '5', 'E39 ', 'M54 ', 'S', '5', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1055', 'DS41', '525I A TO                ', 'DS41', 'DS41', '1', '1', '5', 'E39 ', 'M54 ', 'A', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1056', 'DS42', '525I A RL TO             ', 'DS41', 'DS41', '1', '1', '5', 'E39 ', 'M54 ', 'A', '5', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1057', 'DS43', '525I A US TO             ', 'DS43', 'DS43', '1', '1', '5', 'E39 ', 'M54 ', 'A', '5', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1058', 'DS51', '530I TO                  ', 'DS51', 'DS51', '1', '1', '5', 'E39 ', 'M54 ', 'S', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1059', 'DS52', '530I RL TO               ', 'DS51', 'DS51', '1', '1', '5', 'E39 ', 'M54 ', 'S', '5', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1060', 'DS61', '530I A TO                ', 'DS61', 'DS61', '1', '1', '5', 'E39 ', 'M54 ', 'A', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1061', 'DS62', '530I A RL TO             ', 'DS61', 'DS61', '1', '1', '5', 'E39 ', 'M54 ', 'A', '5', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1062', 'DT11', '520I                     ', 'DT11', 'DT11', '1', '1', '5', 'E39 ', 'M54 ', 'S', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1063', 'DT12', '520I RL                  ', 'DT11', 'DT11', '1', '1', '5', 'E39 ', 'M54 ', 'S', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1064', 'DT21', '520I A                   ', 'DT21', 'DT21', '1', '1', '5', 'E39 ', 'M54 ', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1065', 'DT22', '520I A RL                ', 'DT21', 'DT21', '1', '1', '5', 'E39 ', 'M54 ', 'A', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1066', 'DT24', '520IARL MAL CKD          ', 'DT21', 'DT21', '1', '1', 'L5', 'E39 ', 'M54 ', 'A', '4', 'R', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1067', 'DT26', '520I EGY CKD             ', 'DT21', 'DT21', '1', '1', 'Y5', 'E39 ', 'M54 ', 'A', '4', 'L', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1068', 'DT27', '520I A IND CKD           ', 'DT21', 'DT21', '1', '1', 'C5', 'E39 ', 'M54 ', 'A', '4', 'R', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1069', 'DT31', '525I                     ', 'DT31', 'DT31', '1', '1', '5', 'E39 ', 'M54 ', 'S', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1070', 'DT32', '525I RL                  ', 'DT31', 'DT31', '1', '1', '5', 'E39 ', 'M54 ', 'S', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1071', 'DT33', '525I US                  ', 'DT33', 'DT33', '1', '1', '5', 'E39 ', 'M54 ', 'S', '4', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1072', 'DT35', '525I RUS SKD             ', 'DT31', 'DT31', '1', '1', 'R5', 'E39 ', 'M54 ', 'S', '4', 'L', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1073', 'DT41', '525I A                   ', 'DT41', 'DT41', '1', '1', '5', 'E39 ', 'M54 ', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1074', 'DT42', '525I A RL                ', 'DT41', 'DT41', '1', '1', '5', 'E39 ', 'M54 ', 'A', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1075', 'DT43', '525I A US                ', 'DT43', 'DT43', '1', '1', '5', 'E39 ', 'M54 ', 'A', '4', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1076', 'DT44', '525IARL MAL CKD          ', 'DT41', 'DT41', '1', '1', 'L5', 'E39 ', 'M54 ', 'A', '4', 'R', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1077', 'DT45', '525I A RUS SKD           ', 'DT41', 'DT41', '1', '1', 'R5', 'E39 ', 'M54 ', 'A', '4', 'L', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1078', 'DT46', '525I A EGY CKD           ', 'DT41', 'DT41', '1', '1', 'Y5', 'E39 ', 'M54 ', 'A', '4', 'L', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1079', 'DT47', '525IARL IND CKD          ', 'DT41', 'DT41', '1', '1', 'I5', 'E39 ', 'M54 ', 'A', '4', 'R', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1080', 'DT48', '525I A VIE CKD           ', 'DT41', 'DT41', '1', '1', 'V5', 'E39 ', 'M54 ', 'A', '4', 'L', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1081', 'DT51', '530I                     ', 'DT51', 'DT51', '1', '1', '5', 'E39 ', 'M54 ', 'S', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1082', 'DT52', '530I RL                  ', 'DT51', 'DT51', '1', '1', '5', 'E39 ', 'M54 ', 'S', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1083', 'DT53', '530I US                  ', 'DT53', 'DT53', '1', '1', '5', 'E39 ', 'M54 ', 'S', '4', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1084', 'DT61', '530I A                   ', 'DT61', 'DT61', '1', '1', '5', 'E39 ', 'M54 ', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1085', 'DT62', '530I A RL                ', 'DT61', 'DT61', '1', '1', '5', 'E39 ', 'M54 ', 'A', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1086', 'DT63', '530I A US                ', 'DT63', 'DT63', '1', '1', '5', 'E39 ', 'M54 ', 'A', '4', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1087', 'DT65', '530I A RUS SKD           ', 'DT61', 'DT61', '1', '1', 'R5', 'E39 ', 'M54 ', 'A', '4', 'L', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1088', 'DT66', '530IARL IND CKD          ', 'DT61', 'DT61', '1', '1', 'C5', 'E39 ', 'M54 ', 'A', '4', 'R', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1089', 'DT68', '530I A MAL CKD           ', 'DT61', 'DT61', '1', '1', 'L5', 'E39 ', 'M54 ', 'A', '4', 'R', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1090', 'DU51', 'Z4 3 0SI CP              ', 'DU51', 'DU51', '1', '1', 'Z4', 'E86 ', 'N52 ', 'S', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1091', 'DU52', 'Z4 3 0SI RL CP           ', 'DU51', 'DU51', '1', '1', 'Z4', 'E86 ', 'N52 ', 'S', '2', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1092', 'DU53', 'Z4 3 0SI US CP           ', 'DU53', 'DU53', '1', '1', 'Z4', 'E86 ', 'N52 ', 'S', '2', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1093', 'DU61', 'Z4 3 0SI CP A            ', 'DU61', 'DU61', '1', '1', 'Z4', 'E86 ', 'N52 ', 'A', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1094', 'DU62', 'Z4 3 0SI RL CP A         ', 'DU61', 'DU61', '1', '1', 'Z4', 'E86 ', 'N52 ', 'A', '2', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1095', 'DU63', 'Z4 3 0SI US CP A         ', 'DU63', 'DU63', '1', '1', 'Z4', 'E86 ', 'N52 ', 'A', '2', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1096', 'DU91', 'Z4 3 2 M-CP              ', 'DU91', 'DU91', '1', '1', 'Z4', 'E86 ', 'S54 ', 'S', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1097', 'DU92', 'Z4 3 2 RL M-CP           ', 'DU91', 'DU91', '1', '1', 'Z4', 'E86 ', 'S54 ', 'S', '2', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1098', 'DU93', 'Z4 3 2 US M-CP           ', 'DU93', 'DU93', '1', '1', 'Z4', 'E86 ', 'S54 ', 'S', '2', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1099', 'DV31', '320I CA                  ', 'DV31', 'DV31', '1', '1', '3', 'E93 ', 'N46T', 'S', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1100', 'DV32', '320I CA RL               ', 'DV31', 'DV31', '1', '1', '3', 'E93 ', 'N46T', 'S', '2', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1101', 'DV41', '320I CA A                ', 'DV41', 'DV41', '1', '1', '3', 'E93 ', 'N46T', 'A', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1102', 'DV42', '320I CA RL A             ', 'DV41', 'DV41', '1', '1', '3', 'E93 ', 'N46T', 'A', '2', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1103', 'DV51', '320I CA                  ', 'DV51', 'DV51', '1', '1', '3', 'E93 ', 'N43 ', 'S', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1104', 'DV52', '320I  CA RL              ', 'DV51', 'DV51', '1', '1', '3', 'E93 ', 'N43 ', 'S', '2', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1105', 'DV61', '320I CA A                ', 'DV61', 'DV61', '1', '1', '3', 'E93 ', 'N43 ', 'A', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1106', 'DV62', '320I  CA RL A            ', 'DV61', 'DV61', '1', '1', '3', 'E93 ', 'N43 ', 'A', '2', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1107', 'DV71', '318I CA                  ', 'DV71', 'DV71', '1', '1', '3', 'E93 ', 'N43 ', 'S', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1108', 'DW12', '323I CA RL               ', '    ', '    ', '1', '1', '3', 'E93 ', 'N52K', 'S', '2', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1109', 'DW22', '323I CA RL A             ', 'DW41', 'DW41', '1', '1', '3', 'E93 ', 'N52K', 'A', '2', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1110', 'DW31', '325I CA                  ', 'DW31', 'DW31', '1', '1', '3', 'E93 ', 'N52K', 'S', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1111', 'DW32', '325I CA RL               ', 'DW31', 'DW31', '1', '1', '3', 'E93 ', 'N52K', 'S', '2', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1112', 'DW33', '328I CA US               ', 'DW33', 'DW33', '1', '1', '3', 'E93 ', 'N52K', 'S', '2', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1113', 'DW41', '325I CA A                ', 'DW41', 'DW41', '1', '1', '3', 'E93 ', 'N52K', 'A', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1114', 'DW42', '325I CA RL A             ', 'DW41', 'DW41', '1', '1', '3', 'E93 ', 'N52K', 'A', '2', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1115', 'DW43', '328I CA US A             ', 'DW43', 'DW43', '1', '1', '3', 'E93 ', 'N52K', 'A', '2', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1116', 'DW51', '325I CA                  ', 'DW51', 'DW51', '1', '1', '3', 'E93 ', 'N53 ', 'S', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1117', 'DW52', '325I CA RL               ', 'DW51', 'DW51', '1', '1', '3', 'E93 ', 'N53 ', 'S', '2', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1118', 'DW61', '325I CA A                ', 'DW61', 'DW61', '1', '1', '3', 'E93 ', 'N53 ', 'A', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1119', 'DW62', '325I CA RL A             ', 'DW61', 'DW61', '1', '1', '3', 'E93 ', 'N53 ', 'A', '2', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1120', 'DW73', '328I CA US               ', 'DW73', 'DW73', '1', '1', '3', 'E93 ', 'N51 ', 'S', '2', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1121', 'DW81', '328I CA KOREA A          ', 'DW81', 'DW81', '1', '1', 'K3', 'E93 ', 'N51 ', 'A', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1122', 'DW83', '328I CA US A             ', 'DW83', 'DW83', '1', '1', '3', 'E93 ', 'N51 ', 'A', '2', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1123', 'DX13', '335IS US                 ', 'DX13', 'DX13', '1', '1', '3', 'E93 ', 'N54T', 'S', '2', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1124', 'DX31', '330I CA                  ', 'DX31', 'DX31', '1', '1', '3', 'E93 ', 'N52K', 'S', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1125', 'DX32', '330I CA RL               ', 'DX31', 'DX31', '1', '1', '3', 'E93 ', 'N52K', 'S', '2', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1126', 'DX41', '330I CA A                ', 'DX41', 'DX41', '1', '1', '3', 'E93 ', 'N52K', 'A', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1127', 'DX42', '330I CA RL A             ', 'DX41', 'DX41', '1', '1', '3', 'E93 ', 'N52K', 'A', '2', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1128', 'DX51', '330I CA                  ', 'DX51', 'DX51', '1', '1', '3', 'E93 ', 'N53 ', 'S', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1129', 'DX52', '330I CA RL               ', 'DX51', 'DX51', '1', '1', '3', 'E93 ', 'N53 ', 'S', '2', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1130', 'DX61', '330I CA A                ', 'DX61', 'DX61', '1', '1', '3', 'E93 ', 'N53 ', 'A', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1131', 'DX62', '330I CA RL A             ', 'DX61', 'DX61', '1', '1', '3', 'E93 ', 'N53 ', 'A', '2', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1132', 'DX71', '335I CA                  ', 'DX71', 'DX71', '1', '1', '3', 'E93 ', 'N55 ', 'S', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1133', 'DX72', '335I CA RL               ', 'DX71', 'DX71', '1', '1', '3', 'E93 ', 'N55 ', 'S', '2', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1134', 'DX73', '335I CA US               ', 'DX73', 'DX73', '1', '1', '3', 'E93 ', 'N55 ', 'S', '2', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1135', 'DX81', '335I CA A                ', 'DX81', 'DX81', '1', '1', '3', 'E93 ', 'N55 ', 'A', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1136', 'DX82', '335I CA RL A             ', 'DX81', 'DX81', '1', '1', '3', 'E93 ', 'N55 ', 'A', '2', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1137', 'DX83', '335I CA US A             ', 'DX83', 'DX83', '1', '1', '3', 'E93 ', 'N55 ', 'A', '2', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1138', 'DX91', 'M3 CA                    ', 'DX91', 'DX91', '1', '1', 'M3', 'E93 ', 'S65 ', 'S', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1139', 'DX92', 'M3 CA RL                 ', 'DX91', 'DX91', '1', '1', 'M3', 'E93 ', 'S65 ', 'S', '2', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1140', 'DX93', 'M3 CA US                 ', 'DX93', 'DX93', '1', '1', 'M3', 'E93 ', 'S65 ', 'S', '2', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1141', 'DY31', '320D CA                  ', 'DY31', 'DY31', '1', '1', '3', 'E93 ', 'N47T', 'S', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1142', 'DY32', '320D RL CA               ', 'DY31', 'DY31', '1', '1', '3', 'E93 ', 'N47T', 'S', '2', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1143', 'DY41', '320D CA A                ', 'DY41', 'DY41', '1', '1', '3', 'E93 ', 'N47T', 'A', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1144', 'DY42', '320D RL CA A             ', 'DY41', 'DY41', '1', '1', '3', 'E93 ', 'N47T', 'A', '2', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1145', 'DY51', '325D CA                  ', 'DY51', 'DY51', '1', '1', '3', 'E93 ', 'N57 ', 'S', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1146', 'DY52', '325D CA RL               ', 'DY51', 'DY51', '1', '1', '3', 'E93 ', 'N57 ', 'S', '2', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1147', 'DY61', '325D CA A                ', 'DY61', 'DY61', '1', '1', '3', 'E93 ', 'N57 ', 'A', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1148', 'DY62', '325D CA RL A             ', 'DY61', 'DY61', '1', '1', '3', 'E93 ', 'N57 ', 'A', '2', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1149', 'DY71', '330D CA                  ', 'DY71', 'DY71', '1', '1', '3', 'E93 ', 'N57 ', 'S', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1150', 'DY72', '330D CA RL               ', 'DY71', 'DY71', '1', '1', '3', 'E93 ', 'N57 ', 'S', '2', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1151', 'DY81', '330D CA A                ', 'DY81', 'DY81', '1', '1', '3', 'E93 ', 'N57 ', 'A', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1152', 'DY82', '330D CA RL A             ', 'DY81', 'DY81', '1', '1', '3', 'E93 ', 'N57 ', 'A', '2', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1153', 'EA11', '630I                     ', 'EA11', 'EA11', '1', '1', '6', 'E63 ', 'N52K', 'S', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1154', 'EA21', '630I A                   ', 'EA21', 'EA21', '1', '1', '6', 'E63 ', 'N52K', 'A', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1155', 'EA22', '630I RL A                ', 'EA21', 'EA21', '1', '1', '6', 'E63 ', 'N52K', 'A', '2', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1156', 'EA31', '630I                     ', 'EA31', 'EA31', '1', '1', '6', 'E63 ', 'N53 ', 'S', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1157', 'EA32', '630I RL                  ', 'EA31', 'EA31', '1', '1', '6', 'E63 ', 'N53 ', 'S', '2', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1158', 'EA41', '630I A                   ', 'EA41', 'EA41', '1', '1', '6', 'E63 ', 'N53 ', 'A', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1159', 'EA42', '630I RL A                ', 'EA41', 'EA41', '1', '1', '6', 'E63 ', 'N53 ', 'A', '2', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1160', 'EA51', '650I                     ', 'EA51', 'EA51', '1', '1', '6', 'E63 ', 'N62T', 'S', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1161', 'EA52', '650I RL                  ', 'EA51', 'EA51', '1', '1', '6', 'E63 ', 'N62T', 'S', '2', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1162', 'EA53', '650I US                  ', 'EA53', 'EA53', '1', '1', '6', 'E63 ', 'N62T', 'S', '2', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1163', 'EA61', '650I A                   ', 'EA61', 'EA61', '1', '1', '6', 'E63 ', 'N62T', 'A', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1164', 'EA62', '650I RL A                ', 'EA61', 'EA61', '1', '1', '6', 'E63 ', 'N62T', 'A', '2', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1165', 'EA63', '650I US A                ', 'EA63', 'EA63', '1', '1', '6', 'E63 ', 'N62T', 'A', '2', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1166', 'EA81', '635D A                   ', 'EA81', 'EA81', '1', '1', '6', 'E63 ', 'M57Y', 'A', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1167', 'EA82', '635D RL A                ', 'EA81', 'EA81', '1', '1', '6', 'E63 ', 'M57Y', 'A', '2', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1168', 'EB11', '630I CA                  ', 'EB11', 'EB11', '1', '1', '6', 'E64 ', 'N52K', 'S', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1169', 'EB12', '630I RL CA               ', '    ', '    ', '1', '1', '6', 'E64 ', 'N52K', 'S', '2', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1170', 'EB21', '630I CA A                ', 'EB21', 'EB21', '1', '1', '6', 'E64 ', 'N52K', 'A', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1171', 'EB22', '630I RL CA A             ', 'EB21', 'EB21', '1', '1', '6', 'E64 ', 'N52K', 'A', '2', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1172', 'EB31', '630I CA                  ', 'EB31', 'EB31', '1', '1', '6', 'E64 ', 'N53 ', 'S', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1173', 'EB32', '630I RL CA               ', 'EB31', 'EB31', '1', '1', '6', 'E64 ', 'N53 ', 'S', '2', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1174', 'EB41', '630I CA A                ', 'EB41', 'EB41', '1', '1', '6', 'E64 ', 'N53 ', 'A', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1175', 'EB42', '630I RL CA A             ', 'EB41', 'EB41', '1', '1', '6', 'E64 ', 'N53 ', 'A', '2', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1176', 'EB51', '650I CA                  ', 'EB51', 'EB51', '1', '1', '6', 'E64 ', 'N62T', 'S', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1177', 'EB52', '650I RL CA               ', 'EB51', 'EB51', '1', '1', '6', 'E64 ', 'N62T', 'S', '2', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1178', 'EB53', '650I US CA               ', 'EB53', 'EB53', '1', '1', '6', 'E64 ', 'N62T', 'S', '2', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1179', 'EB61', '650I CA A                ', 'EB61', 'EB61', '1', '1', '6', 'E64 ', 'N62T', 'A', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1180', 'EB62', '650I RL CA A             ', 'EB61', 'EB61', '1', '1', '6', 'E64 ', 'N62T', 'A', '2', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1181', 'EB63', '650I US CA A             ', 'EB63', 'EB63', '1', '1', '6', 'E64 ', 'N62T', 'A', '2', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1182', 'EB81', '635D CA A                ', 'EB81', 'EB81', '1', '1', '6', 'E64 ', 'M57Y', 'A', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1183', 'EB82', '635D RL CA A             ', 'EB81', 'EB81', '1', '1', '6', 'E64 ', 'M57Y', 'A', '2', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1184', 'ED01', '330D A                   ', 'ED01', 'ED01', '1', '1', '3', 'E46 ', 'M57T', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1185', 'ED02', '330D RL A                ', 'ED01', 'ED01', '1', '1', '3', 'E46 ', 'M57T', 'A', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1186', 'ED71', '330XD                    ', 'ED71', 'ED71', '1', '1', '3', 'E46 ', 'M57T', 'S', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1187', 'ED81', '330XD A                  ', 'ED81', 'ED81', '1', '1', '3', 'E46 ', 'M57T', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1188', 'ED91', '330D                     ', 'ED91', 'ED91', '1', '1', '3', 'E46 ', 'M57T', 'S', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1189', 'ED92', '330D RL                  ', 'ED91', 'ED91', '1', '1', '3', 'E46 ', 'M57T', 'S', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1190', 'EF11', '830 CI                   ', '    ', '    ', '1', '1', '8', 'E31 ', 'M60 ', 'S', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1191', 'EF21', '830 CI A                 ', '    ', '    ', '1', '1', '8', 'E31 ', 'M60 ', 'A', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1192', 'EF51', '840CI                    ', 'EF51', 'EF51', '1', '1', '8', 'E31 ', 'M60 ', 'S', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1193', 'EF52', '840CI RL                 ', 'EF51', 'EF51', '1', '1', '8', 'E31 ', 'M60 ', 'S', '2', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1194', 'EF61', '840CI A                  ', 'EF61', 'EF61', '1', '1', '8', 'E31 ', 'M60 ', 'A', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1195', 'EF62', '840CI A RL               ', 'EF61', 'EF61', '1', '1', '8', 'E31 ', 'M60 ', 'A', '2', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1196', 'EF63', '840CI A US               ', 'EF63', 'EF63', '1', '1', '8', 'E31 ', 'M60 ', 'A', '2', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1197', 'EF71', '840CI                    ', 'EF51', 'EF51', '1', '1', '8', 'E31 ', 'M62 ', 'S', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1198', 'EF72', '840CI RL                 ', 'EF51', 'EF51', '1', '1', '8', 'E31 ', 'M62 ', 'S', '2', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1199', 'EF81', '840CI A                  ', 'EF61', 'EF61', '1', '1', '8', 'E31 ', 'M62 ', 'A', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1200', 'EF82', '840CI A RL               ', 'EF61', 'EF61', '1', '1', '8', 'E31 ', 'M62 ', 'A', '2', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1201', 'EF83', '840CI A US               ', 'EF63', 'EF63', '1', '1', '8', 'E31 ', 'M62 ', 'A', '2', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1202', 'EG11', '850 CI                   ', 'EG11', 'EG11', '1', '1', '8', 'E31 ', 'M70 ', 'S', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1203', 'EG12', '850 CI RL                ', 'EG11', 'EG11', '1', '1', '8', 'E31 ', 'M70 ', 'S', '2', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1204', 'EG13', '850 CI USA               ', 'EG13', 'EG13', '1', '1', '8', 'E31 ', 'M70 ', 'S', '2', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1205', 'EG18', '850 CI RL ZASKD          ', 'EG11', 'EG11', '1', '1', 'C8', 'E31 ', 'M70 ', 'S', '2', 'R', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1206', 'EG21', '850 CI A                 ', 'EG21', 'EG21', '1', '1', '8', 'E31 ', 'M70 ', 'A', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1207', 'EG22', '850 CI A RL              ', 'EG21', 'EG21', '1', '1', '8', 'E31 ', 'M70 ', 'A', '2', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1208', 'EG23', '850 CI A USA             ', 'EG23', 'EG23', '1', '1', '8', 'E31 ', 'M70 ', 'A', '2', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1209', 'EG28', '850CIARL ZA SKD          ', 'EG21', 'EG21', '1', '1', 'C8', 'E31 ', 'M70 ', 'A', '2', 'R', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1210', 'EG41', '850CI A                  ', 'EG41', 'EG41', '1', '1', '8', 'E31 ', 'M73 ', 'A', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1211', 'EG42', '850CI A RL               ', 'EG41', 'EG41', '1', '1', '8', 'E31 ', 'M73 ', 'A', '2', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1212', 'EG43', '850CI A US               ', 'EG43', 'EG43', '1', '1', '8', 'E31 ', 'M73 ', 'A', '2', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1213', 'EG91', '850CSI                   ', 'EG91', 'EG91', '1', '1', '8', 'E31 ', 'S70 ', 'S', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1214', 'EG92', '850CSI RL                ', 'EG91', 'EG91', '1', '1', '8', 'E31 ', 'S70 ', 'S', '2', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1215', 'EG93', '850CSI US                ', 'EG93', 'EG93', '1', '1', '8', 'E31 ', 'S70 ', 'S', '2', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1216', 'EH11', '650I                     ', 'EH11', 'EH11', '1', '1', '6', 'E63 ', 'N62T', 'S', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1217', 'EH12', '650I RL                  ', 'EH11', 'EH11', '1', '1', '6', 'E63 ', 'N62T', 'S', '2', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1218', 'EH13', '650I US                  ', 'EH13', 'EH13', '1', '1', '6', 'E63 ', 'N62T', 'S', '2', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1219', 'EH21', '650I A                   ', 'EH21', 'EH21', '1', '1', '6', 'E63 ', 'N62T', 'A', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1220', 'EH22', '650I RL A                ', 'EH21', 'EH21', '1', '1', '6', 'E63 ', 'N62T', 'A', '2', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1221', 'EH23', '650I US A                ', 'EH23', 'EH23', '1', '1', '6', 'E63 ', 'N62T', 'A', '2', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1222', 'EH31', '630I                     ', 'EH31', 'EH31', '1', '1', '6', 'E63 ', 'N52 ', 'S', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1223', 'EH32', '630I RL                  ', 'EH31', 'EH31', '1', '1', '6', 'E63 ', 'N52 ', 'S', '2', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1224', 'EH41', '630I A                   ', 'EH41', 'EH41', '1', '1', '6', 'E63 ', 'N52 ', 'A', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1225', 'EH42', '630I RL A                ', 'EH41', 'EH41', '1', '1', '6', 'E63 ', 'N52 ', 'A', '2', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1226', 'EH71', '645CI                    ', 'EH71', 'EH71', '1', '1', '6', 'E63 ', 'N62 ', 'S', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1227', 'EH72', '645CI RL                 ', 'EH71', 'EH71', '1', '1', '6', 'E63 ', 'N62 ', 'S', '2', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1228', 'EH73', '645CI US                 ', 'EH73', 'EH73', '1', '1', '6', 'E63 ', 'N62 ', 'S', '2', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1229', 'EH81', '645CI A                  ', 'EH81', 'EH81', '1', '1', '6', 'E63 ', 'N62 ', 'A', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1230', 'EH82', '645CI RL A               ', 'EH81', 'EH81', '1', '1', '6', 'E63 ', 'N62 ', 'A', '2', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1231', 'EH83', '645CI US A               ', 'EH83', 'EH83', '1', '1', '6', 'E63 ', 'N62 ', 'A', '2', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1232', 'EH91', 'M6                       ', 'EH91', 'EH91', '1', '1', 'M6', 'E63 ', 'S85 ', 'S', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1233', 'EH92', 'M6 RL                    ', 'EH91', 'EH91', '1', '1', 'M6', 'E63 ', 'S85 ', 'S', '2', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1234', 'EH93', 'M6 US                    ', 'EH93', 'EH93', '1', '1', 'M6', 'E63 ', 'S85 ', 'S', '2', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1235', 'EJ02', '330D RL A                ', 'ED01', 'ED01', '1', '1', 'Z3', 'E46 ', 'M57T', 'A', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1236', 'EJ11', 'Z8 5 0                   ', 'EJ11', 'EJ11', '1', '1', 'Z8', 'E52 ', 'S62 ', 'S', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1237', 'EJ13', 'Z8 5 0 US                ', 'EJ13', 'EJ13', '1', '1', 'Z8', 'E52 ', 'S62 ', 'S', '2', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1238', 'EJ92', '330D RL                  ', 'ED91', 'ED91', '1', '1', 'Z3', 'E46 ', 'M57T', 'S', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1239', 'EK11', '650I CA                  ', 'EK11', 'EK11', '1', '1', '6', 'E64 ', 'N62T', 'S', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1240', 'EK12', '650I RL CA               ', 'EK11', 'EK11', '1', '1', '6', 'E64 ', 'N62T', 'S', '2', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1241', 'EK13', '650I US CA               ', 'EK13', 'EK13', '1', '1', '6', 'E64 ', 'N62T', 'S', '2', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1242', 'EK21', '650I CA A                ', 'EK21', 'EK21', '1', '1', '6', 'E64 ', 'N62T', 'A', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1243', 'EK22', '650I RL CA A             ', 'EK21', 'EK21', '1', '1', '6', 'E64 ', 'N62T', 'A', '2', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1244', 'EK23', '650I US CA A             ', 'EK23', 'EK23', '1', '1', '6', 'E64 ', 'N62T', 'A', '2', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1245', 'EK31', '630I CA                  ', 'EK31', 'EK31', '1', '1', '6', 'E64 ', 'N52 ', 'S', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1246', 'EK32', '630I CA RL               ', 'EK31', 'EK31', '1', '1', '6', 'E64 ', 'N52 ', 'S', '2', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1247', 'EK41', '630I CA A                ', 'EK41', 'EK41', '1', '1', '6', 'E64 ', 'N52 ', 'A', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1248', 'EK42', '630I CA RL A             ', 'EK41', 'EK41', '1', '1', '6', 'E64 ', 'N52 ', 'A', '2', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1249', 'EK71', '645CI CA                 ', 'EK71', 'EK71', '1', '1', '6', 'E64 ', 'N62 ', 'S', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1250', 'EK72', '645CI CA RL              ', 'EK71', 'EK71', '1', '1', '6', 'E64 ', 'N62 ', 'S', '2', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1251', 'EK73', '645CI CA US              ', 'EK73', 'EK73', '1', '1', '6', 'E64 ', 'N62 ', 'S', '2', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1252', 'EK81', '645CI CA A               ', 'EK81', 'EK81', '1', '1', '6', 'E64 ', 'N62 ', 'A', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1253', 'EK82', '645CI CA RL A            ', 'EK81', 'EK81', '1', '1', '6', 'E64 ', 'N62 ', 'A', '2', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1254', 'EK83', '645CI CA US A            ', 'EK83', 'EK83', '1', '1', '6', 'E64 ', 'N62 ', 'A', '2', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1255', 'EK91', 'M6 CA                    ', 'EK91', 'EK91', '1', '1', 'M6', 'E64 ', 'S85 ', 'S', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1256', 'EK92', 'M6 RL CA                 ', 'EK91', 'EK91', '1', '1', 'M6', 'E64 ', 'S85 ', 'S', '2', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1257', 'EK93', 'M6 US CA                 ', 'EK93', 'EK93', '1', '1', 'M6', 'E64 ', 'S85 ', 'S', '2', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1258', 'EL01', '330D TO A                ', 'EL01', 'EL01', '1', '1', '3', 'E46 ', 'M57 ', 'A', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1259', 'EL02', '330D RL TO A             ', 'EL01', 'EL01', '1', '1', '3', 'E46 ', 'M57 ', 'A', '5', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1260', 'EL51', '318D TO                  ', 'EL51', 'EL51', '1', '1', '3', 'E46 ', 'M47 ', 'S', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1261', 'EL71', '318D TO                  ', 'EL71', 'EL71', '1', '1', '3', 'E46 ', 'M47S', 'S', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1262', 'EL72', '318D RL TO               ', 'EL71', 'EL71', '1', '1', '3', 'E46 ', 'M47S', 'S', '5', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1263', 'EL81', '318D TO A                ', 'EL81', 'EL81', '1', '1', '3', 'E46 ', 'M47S', 'A', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1264', 'EL82', '318D RL TO A             ', 'EL81', 'EL81', '1', '1', '3', 'E46 ', 'M47S', 'A', '5', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1265', 'EL91', '330D TO                  ', 'EL91', 'EL91', '1', '1', '3', 'E46 ', 'M57 ', 'S', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1266', 'EL92', '330D RL TO               ', 'EL91', 'EL91', '1', '1', '3', 'E46 ', 'M57 ', 'S', '5', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1267', 'EM51', '330I TO ALLRAD           ', 'EM51', 'EM51', '1', '1', '3', 'E46 ', 'M54 ', 'S', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1268', 'EM61', '330I TO A ALLRAD         ', 'EM61', 'EM61', '1', '1', '3', 'E46 ', 'M54 ', 'A', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1269', 'EN11', '320I TO                  ', 'EN11', 'EN11', '1', '1', '3', 'E46 ', 'M54 ', 'S', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1270', 'EN12', '320I RL TO               ', 'EN11', 'EN11', '1', '1', '3', 'E46 ', 'M54 ', 'S', '5', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1271', 'EN21', '320I TO A                ', 'EN21', 'EN21', '1', '1', '3', 'E46 ', 'M54 ', 'A', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1272', 'EN22', '320I RL TO A             ', 'EN21', 'EN21', '1', '1', '3', 'E46 ', 'M54 ', 'A', '5', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1273', 'EN31', '325I TO                  ', 'EN31', 'EN31', '1', '1', '3', 'E46 ', 'M54 ', 'S', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1274', 'EN32', '325I RL TO               ', 'EN31', 'EN31', '1', '1', '3', 'E46 ', 'M54 ', 'S', '5', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1275', 'EN33', '325I US TO               ', 'EN33', 'EN33', '1', '1', '3', 'E46 ', 'M54 ', 'S', '5', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1276', 'EN41', '325I TO A                ', 'EN41', 'EN41', '1', '1', '3', 'E46 ', 'M54 ', 'A', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1277', 'EN42', '325I RL TO A             ', 'EN41', 'EN41', '1', '1', '3', 'E46 ', 'M54 ', 'A', '5', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1278', 'EN43', '325I US TO A             ', 'EN43', 'EN43', '1', '1', '3', 'E46 ', 'M54 ', 'A', '5', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1279', 'EN51', '330I TO                  ', 'EN51', 'EN51', '1', '1', '3', 'E46 ', 'M54 ', 'S', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1280', 'EN52', '330I RL TO               ', 'EN51', 'EN51', '1', '1', '3', 'E46 ', 'M54 ', 'S', '5', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1281', 'EN61', '330I TO A                ', 'EN61', 'EN61', '1', '1', '3', 'E46 ', 'M54 ', 'A', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1282', 'EN62', '330I RL TO A             ', 'EN61', 'EN61', '1', '1', '3', 'E46 ', 'M54 ', 'A', '5', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1283', 'EP31', '325XI TO                 ', 'EP31', 'EP31', '1', '1', '3', 'E46 ', 'M54 ', 'S', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1284', 'EP33', '325XI US TO              ', 'EP33', 'EP33', '1', '1', '3', 'E46 ', 'M54 ', 'S', '5', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1285', 'EP41', '325XI TO A               ', 'EP41', 'EP41', '1', '1', '3', 'E46 ', 'M54 ', 'A', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1286', 'EP43', '325XI US TO A            ', 'EP43', 'EP43', '1', '1', '3', 'E46 ', 'M54 ', 'A', '5', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1287', 'EP51', '330XI TO                 ', 'EP51', 'EP51', '1', '1', '3', 'E46 ', 'M54 ', 'S', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1288', 'EP61', '330XI TO A               ', 'EP61', 'EP61', '1', '1', '3', 'E46 ', 'M54 ', 'A', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1289', 'EP71', '330XD TO                 ', 'EP71', 'EP71', '1', '1', '3', 'E46 ', 'M57 ', 'S', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1290', 'EP81', '330XD TO A               ', 'EP81', 'EP81', '1', '1', '3', 'E46 ', 'M57 ', 'A', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1291', 'ER01', '330D A                   ', 'ER01', 'ER01', '1', '1', '3', 'E46 ', 'M57 ', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1292', 'ER02', '330D RL A                ', 'ER01', 'ER01', '1', '1', '3', 'E46 ', 'M57 ', 'A', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1293', 'ER11', '316I                     ', 'ER11', 'ER11', '1', '1', '3', 'E46 ', 'M43 ', 'S', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1294', 'ER12', '316I RL                  ', 'ER11', 'ER11', '1', '1', '3', 'E46 ', 'M43 ', 'S', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1295', 'ER21', '316I A                   ', 'ER21', 'ER21', '1', '1', '3', 'E46 ', 'M43 ', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1296', 'ER22', '316I RL A                ', 'ER21', 'ER21', '1', '1', '3', 'E46 ', 'M43 ', 'A', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1297', 'ER51', '316I                     ', 'ER11', 'ER11', '1', '1', '3', 'E46 ', 'M43 ', 'S', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1298', 'ER55', '316I PHI CKD             ', 'ER11', 'ER11', '1', '1', 'P3', 'E46 ', 'M43 ', 'S', '4', 'L', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1299', 'ER91', '330D                     ', 'ER91', 'ER91', '1', '1', '3', 'E46 ', 'M57 ', 'S', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1300', 'ER92', '330D RL                  ', 'ER91', 'ER91', '1', '1', '3', 'E46 ', 'M57 ', 'S', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1301', 'ES02', '330D RL A                ', 'ER01', 'ER01', '1', '1', '3', 'E46 ', 'M57 ', 'A', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1302', 'ES35', '323I RL THA CKD          ', 'AM31', 'AM31', '1', '1', 'T3', 'E46 ', 'M52 ', 'S', '4', 'R', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1303', 'ES45', '323I RL THA CKD A        ', 'AM41', 'AM41', '1', '1', 'T3', 'E46 ', 'M52 ', 'A', '4', 'R', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1304', 'ES51', '330I ALLRAD              ', 'ES51', 'ES51', '1', '1', '3', 'E46 ', 'M54 ', 'S', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1305', 'ES53', '330I US ALLRAD           ', 'ES53', 'ES53', '1', '1', '3', 'E46 ', 'M54 ', 'S', '4', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1306', 'ES61', '330I A ALLRAD            ', 'ES61', 'ES61', '1', '1', '3', 'E46 ', 'M54 ', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1307', 'ES63', '330I US A ALLRAD         ', 'ES63', 'ES63', '1', '1', '3', 'E46 ', 'M54 ', 'A', '4', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1308', 'ES92', '330D RL                  ', 'ER91', 'ER91', '1', '1', '3', 'E46 ', 'M57 ', 'S', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1309', 'ET16', '320I RL                  ', 'EV11', 'EV11', '1', '1', 'Z3', 'E46 ', 'M54 ', 'S', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1310', 'ET25', '320I A                   ', 'EV21', 'EV21', '1', '1', 'Z3', 'E46 ', 'M54 ', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1311', 'ET26', '320I RL A                ', 'EV21', 'EV21', '1', '1', 'Z3', 'E46 ', 'M54 ', 'A', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1312', 'ET35', '325I                     ', 'EV31', 'EV31', '1', '1', 'Z3', 'E46 ', 'M54 ', 'S', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1313', 'ET36', '325I RL                  ', 'EV31', 'EV31', '1', '1', 'Z3', 'E46 ', 'M54 ', 'S', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1314', 'ET37', '325I US                  ', 'EV33', 'EV33', '1', '1', 'Z3', 'E46 ', 'M54 ', 'S', '4', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1315', 'ET45', '325I A                   ', 'EV41', 'EV41', '1', '1', 'Z3', 'E46 ', 'M54 ', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1316', 'ET46', '325I RL A                ', 'EV41', 'EV41', '1', '1', 'Z3', 'E46 ', 'M54 ', 'A', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1317', 'ET47', '325I US A                ', 'EV43', 'EV43', '1', '1', 'Z3', 'E46 ', 'M54 ', 'A', '4', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1318', 'ET55', '330I                     ', 'EV51', 'EV51', '1', '1', 'Z3', 'E46 ', 'M54 ', 'S', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1319', 'ET56', '330I RL                  ', 'EV51', 'EV51', '1', '1', 'Z3', 'E46 ', 'M54 ', 'S', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1320', 'ET57', '330I US                  ', 'EV53', 'EV53', '1', '1', '3', 'E46 ', 'M54 ', 'S', '4', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1321', 'ET65', '330I A                   ', 'EV61', 'EV61', '1', '1', 'Z3', 'E46 ', 'M54 ', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1322', 'ET66', '330I RL A                ', 'EV61', 'EV61', '1', '1', 'Z3', 'E46 ', 'M54 ', 'A', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1323', 'ET67', '330I US A                ', 'EV63', 'EV63', '1', '1', '3', 'E46 ', 'M54 ', 'A', '4', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1324', 'ET75', '318I                     ', 'EY71', 'EY71', '1', '1', '3', 'E46 ', 'N46 ', 'S', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1325', 'ET76', '318I RL                  ', 'EY71', 'EY71', '1', '1', '3', 'E46 ', 'N46 ', 'S', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1326', 'ET85', '318I A                   ', 'EY81', 'EY81', '1', '1', '3', 'E46 ', 'N46 ', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1327', 'ET86', '318I RL A                ', 'EY81', 'EY81', '1', '1', '3', 'E46 ', 'N46 ', 'A', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1328', 'EU31', '325XI                    ', 'EU31', 'EU31', '1', '1', '3', 'E46 ', 'M54 ', 'S', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1329', 'EU33', '325XI US                 ', 'EU33', 'EU33', '1', '1', '3', 'E46 ', 'M54 ', 'S', '4', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1330', 'EU41', '325XI A                  ', 'EU41', 'EU41', '1', '1', '3', 'E46 ', 'M54 ', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1331', 'EU43', '325XI US A               ', 'EU43', 'EU43', '1', '1', '3', 'E46 ', 'M54 ', 'A', '4', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1332', 'EU51', '318D                     ', 'EU51', 'EU51', '1', '1', '3', 'E46 ', 'M47 ', 'S', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1333', 'EU71', '318D                     ', 'EU71', 'EU71', '1', '1', '3', 'E46 ', 'M47S', 'S', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1334', 'EU72', '318D RL                  ', 'EU71', 'EU71', '1', '1', '3', 'E46 ', 'M47S', 'S', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1335', 'EU81', '318D A                   ', 'EU81', 'EU81', '1', '1', '3', 'E46 ', 'M47S', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1336', 'EU82', '318D RL A                ', 'EU81', 'EU81', '1', '1', '3', 'E46 ', 'M47S', 'A', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1337', 'EV01', '330XD A                  ', 'EV01', 'EV01', '1', '1', '3', 'E46 ', 'M57 ', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1338', 'EV11', '320I                     ', 'EV11', 'EV11', '1', '1', '3', 'E46 ', 'M54 ', 'S', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1339', 'EV12', '320I RL                  ', 'EV11', 'EV11', '1', '1', '3', 'E46 ', 'M54 ', 'S', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1340', 'EV13', '320I US                  ', 'EV13', 'EV13', '1', '1', '3', 'E46 ', 'M54 ', 'S', '4', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1341', 'EV18', '320I RUS SKD             ', 'EV11', 'EV11', '1', '1', 'R3', 'E46 ', 'M54 ', 'S', '4', 'L', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1342', 'EV19', '325ICHN SKD/CKD          ', 'EV31', 'EV31', '1', '1', '3C', 'E46 ', 'M54 ', 'S', '4', 'L', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1343', 'EV21', '320I A                   ', 'EV21', 'EV21', '1', '1', '3', 'E46 ', 'M54 ', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1344', 'EV22', '320I RL A                ', 'EV21', 'EV21', '1', '1', '3', 'E46 ', 'M54 ', 'A', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1345', 'EV23', '320I US A                ', 'EV23', 'EV23', '1', '1', '3', 'E46 ', 'M54 ', 'A', '4', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1346', 'EV28', '320I RUS SKD A           ', 'EV21', 'EV21', '1', '1', 'R3', 'E46 ', 'M54 ', 'A', '4', 'L', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1347', 'EV29', '325ICHN SKD/CKD A        ', 'EV41', 'EV41', '1', '1', '3C', 'E46 ', 'M54 ', 'A', '4', 'L', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1348', 'EV31', '325I                     ', 'EV31', 'EV31', '1', '1', '3', 'E46 ', 'M54 ', 'S', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1349', 'EV32', '325I RL                  ', 'EV31', 'EV31', '1', '1', '3', 'E46 ', 'M54 ', 'S', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1350', 'EV33', '325I US                  ', 'EV33', 'EV33', '1', '1', '3', 'E46 ', 'M54 ', 'S', '4', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1351', 'EV34', '325I RLTHA CKD           ', 'EV31', 'EV31', '1', '1', 'T3', 'E46 ', 'M54 ', 'S', '4', 'R', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1352', 'EV35', '325I MAL CKD             ', 'EV31', 'EV31', '1', '1', 'L3', 'E46 ', 'M54 ', 'S', '4', 'R', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1353', 'EV36', '325I RL IND CKD          ', 'EV31', 'EV31', '1', '1', 'D3', 'E46 ', 'M54 ', 'S', '4', 'R', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1354', 'EV37', '325I PHI CKD             ', 'EV31', 'EV31', '1', '1', 'P3', 'E46 ', 'M54 ', 'S', '4', 'L', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1355', 'EV38', '325I VIE CKD             ', 'EV31', 'EV31', '1', '1', 'V3', 'E46 ', 'M54 ', 'S', '4', 'L', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1356', 'EV39', '325I MEX SKD             ', 'EV31', 'EV31', '1', '1', 'X3', 'E46 ', 'M54 ', 'S', '4', 'L', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1357', 'EV41', '325I A                   ', 'EV41', 'EV41', '1', '1', '3', 'E46 ', 'M54 ', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1358', 'EV42', '325I RL A                ', 'EV41', 'EV41', '1', '1', '3', 'E46 ', 'M54 ', 'A', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1359', 'EV43', '325I US A                ', 'EV43', 'EV43', '1', '1', '3', 'E46 ', 'M54 ', 'A', '4', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1360', 'EV44', '325I RLTHA CKD A         ', 'EV41', 'EV41', '1', '1', 'T3', 'E46 ', 'M54 ', 'A', '4', 'R', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1361', 'EV45', '325I MAL CKD A           ', 'EV41', 'EV41', '1', '1', 'L3', 'E46 ', 'M54 ', 'A', '4', 'R', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1362', 'EV46', '325I RL IND CKD A        ', 'EV41', 'EV41', '1', '1', 'D3', 'E46 ', 'M54 ', 'A', '4', 'R', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1363', 'EV47', '325I PHI CKD A           ', 'EV41', 'EV41', '1', '1', 'P3', 'E46 ', 'M54 ', 'A', '4', 'L', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1364', 'EV48', '325I VIE CKD A           ', 'EV41', 'EV41', '1', '1', 'V3', 'E46 ', 'M54 ', 'A', '4', 'L', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1365', 'EV49', '325I MEX SKD A           ', 'EV41', 'EV41', '1', '1', 'X3', 'E46 ', 'M54 ', 'A', '4', 'L', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1366', 'EV51', '330I                     ', 'EV51', 'EV51', '1', '1', '3', 'E46 ', 'M54 ', 'S', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1367', 'EV52', '330I RL                  ', 'EV51', 'EV51', '1', '1', '3', 'E46 ', 'M54 ', 'S', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1368', 'EV53', '330I US                  ', 'EV53', 'EV53', '1', '1', '3', 'E46 ', 'M54 ', 'S', '4', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1369', 'EV55', '330I RL THA CKD          ', 'EV51', 'EV51', '1', '1', 'T3', 'E46 ', 'M54 ', 'S', '4', 'R', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1370', 'EV61', '330I A                   ', 'EV61', 'EV61', '1', '1', '3', 'E46 ', 'M54 ', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1371', 'EV62', '330I RL A                ', 'EV61', 'EV61', '1', '1', '3', 'E46 ', 'M54 ', 'A', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1372', 'EV63', '330I US A                ', 'EV63', 'EV63', '1', '1', '3', 'E46 ', 'M54 ', 'A', '4', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1373', 'EV65', '330I RL THA CKD A        ', 'EV61', 'EV61', '1', '1', 'T3', 'E46 ', 'M54 ', 'A', '4', 'R', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1374', 'EV91', '330XD                    ', 'EV91', 'EV91', '1', '1', '3', 'E46 ', 'M57 ', 'S', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1375', 'EW51', '330XI                    ', 'EW51', 'EW51', '1', '1', '3', 'E46 ', 'M54 ', 'S', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1376', 'EW53', '330XI US                 ', 'EW53', 'EW53', '1', '1', '3', 'E46 ', 'M54 ', 'S', '4', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1377', 'EW61', '330XI A                  ', 'EW61', 'EW61', '1', '1', '3', 'E46 ', 'M54 ', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1378', 'EW63', '330XI US A               ', 'EW63', 'EW63', '1', '1', '3', 'E46 ', 'M54 ', 'A', '4', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1379', 'EX01', '330D TO A                ', 'EX01', 'EX01', '1', '1', '3', 'E46 ', 'M57T', 'A', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1380', 'EX02', '330D RL TO A             ', 'EX01', 'EX01', '1', '1', '3', 'E46 ', 'M57T', 'A', '5', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1381', 'EX31', '316I TO                  ', 'EX31', 'EX31', '1', '1', '3', 'E46 ', 'N46 ', 'S', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1382', 'EX32', '316I RL TO               ', 'EX31', 'EX31', '1', '1', '3', 'E46 ', 'N46 ', 'S', '5', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1383', 'EX41', '316I TO A                ', 'EX41', 'EX41', '1', '1', '3', 'E46 ', 'N46 ', 'A', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1384', 'EX42', '316I RL TO A             ', 'EX41', 'EX41', '1', '1', '3', 'E46 ', 'N46 ', 'A', '5', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1385', 'EX51', '318I TO                  ', 'EX51', 'EX51', '1', '1', '3', 'E46 ', 'N46 ', 'S', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1386', 'EX52', '318I RL TO               ', 'EX51', 'EX51', '1', '1', '3', 'E46 ', 'N46 ', 'S', '5', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1387', 'EX61', '318I TO A                ', 'EX61', 'EX61', '1', '1', '3', 'E46 ', 'N46 ', 'A', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1388', 'EX62', '318I RL TO A             ', 'EX61', 'EX61', '1', '1', '3', 'E46 ', 'N46 ', 'A', '5', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1389', 'EX71', '330XD TO                 ', 'EX71', 'EX71', '1', '1', '3', 'E46 ', 'M57T', 'S', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1390', 'EX81', '330XD TO A               ', 'EX81', 'EX81', '1', '1', '3', 'E46 ', 'M57T', 'A', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1391', 'EX91', '330D TO                  ', 'EX91', 'EX91', '1', '1', '3', 'E46 ', 'M57T', 'S', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1392', 'EX92', '330D RL TO               ', 'EX91', 'EX91', '1', '1', '3', 'E46 ', 'M57T', 'S', '5', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1393', 'EY07', '318I CHN CKD A           ', 'EY81', 'EY81', '1', '1', '3C', 'E46 ', 'N46 ', 'A', '4', 'L', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1394', 'EY08', '318I RUS SKD A           ', 'EY81', 'EY81', '1', '1', 'R3', 'E46 ', 'N46 ', 'A', '4', 'L', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1395', 'EY11', '316I                     ', 'EY11', 'EY11', '1', '1', '3', 'E46 ', 'N45 ', 'S', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1396', 'EY31', '316I                     ', 'EY31', 'EY31', '1', '1', '3', 'E46 ', 'N46 ', 'S', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1397', 'EY32', '316I RL                  ', 'EY31', 'EY31', '1', '1', '3', 'E46 ', 'N46 ', 'S', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1398', 'EY41', '316I A                   ', 'EY41', 'EY41', '1', '1', '3', 'E46 ', 'N46 ', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1399', 'EY42', '316I RL A                ', 'EY41', 'EY41', '1', '1', '3', 'E46 ', 'N46 ', 'A', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1400', 'EY71', '318I                     ', 'EY71', 'EY71', '1', '1', '3', 'E46 ', 'N46 ', 'S', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1401', 'EY72', '318I RL                  ', 'EY71', 'EY71', '1', '1', '3', 'E46 ', 'N46 ', 'S', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1402', 'EY74', '318I RL MAL CKD          ', 'EY71', 'EY71', '1', '1', 'L3', 'E46 ', 'N46 ', 'S', '4', 'R', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1403', 'EY75', '318I RL THA CKD          ', 'EY71', 'EY71', '1', '1', 'T3', 'E46 ', 'N46 ', 'S', '4', 'R', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1404', 'EY76', '318I EGY CKD             ', 'EY71', 'EY71', '1', '1', 'Y3', 'E46 ', 'N46 ', 'S', '4', 'L', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1405', 'EY77', '318I RL IND CKD          ', 'EY71', 'EY71', '1', '1', 'D3', 'E46 ', 'N46 ', 'S', '4', 'R', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1406', 'EY81', '318I A                   ', 'EY81', 'EY81', '1', '1', '3', 'E46 ', 'N46 ', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1407', 'EY82', '318I RL A                ', 'EY81', 'EY81', '1', '1', '3', 'E46 ', 'N46 ', 'A', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1408', 'EY84', '318I RL MAL CKD A        ', 'EY81', 'EY81', '1', '1', 'L3', 'E46 ', 'N46 ', 'A', '4', 'R', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1409', 'EY85', '318I RL THA CKD A        ', 'EY81', 'EY81', '1', '1', 'T3', 'E46 ', 'N46 ', 'A', '4', 'R', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1410', 'EY86', '318I EGY CKD A           ', 'EY81', 'EY81', '1', '1', 'Y3', 'E46 ', 'N46 ', 'A', '4', 'L', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1411', 'EY87', '318I RL IND CKD A        ', 'EY81', 'EY81', '1', '1', 'D3', 'E46 ', 'N46 ', 'A', '4', 'R', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1412', 'EY88', '318I VIE CKD A           ', 'EY81', 'EY81', '1', '1', 'V3', 'E46 ', 'N46 ', 'A', '4', 'L', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1413', 'EY97', '318I CHN CKD             ', 'EY71', 'EY71', '1', '1', '3C', 'E46 ', 'N46 ', 'S', '4', 'L', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1414', 'EY98', '318I RUS SKD             ', 'EY71', 'EY71', '1', '1', 'R3', 'E46 ', 'N46 ', 'S', '4', 'L', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1415', 'EZ31', '316TI KO                 ', 'EZ31', 'EZ31', '1', '1', '35', 'E46 ', 'N45 ', 'S', '3', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1416', 'EZ51', '316TI KO                 ', 'EZ51', 'EZ51', '1', '1', '35', 'E46 ', 'N46 ', 'S', '3', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1417', 'EZ52', '316TI RL KO              ', 'EZ51', 'EZ51', '1', '1', '35', 'E46 ', 'N46 ', 'S', '3', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1418', 'EZ61', '316TI KO A               ', 'EZ61', 'EZ61', '1', '1', '35', 'E46 ', 'N46 ', 'A', '3', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1419', 'EZ62', '316TI RL KO A            ', 'EZ61', 'EZ61', '1', '1', '35', 'E46 ', 'N46 ', 'A', '3', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1420', 'EZ71', '318TI KO                 ', 'EZ71', 'EZ71', '1', '1', '35', 'E46 ', 'N46 ', 'S', '3', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1421', 'EZ72', '318TI RL KO              ', 'EZ71', 'EZ71', '1', '1', '35', 'E46 ', 'N46 ', 'S', '3', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1422', 'EZ81', '318TI KO A               ', 'EZ81', 'EZ81', '1', '1', '35', 'E46 ', 'N46 ', 'A', '3', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1423', 'EZ82', '318TI RL KO A            ', 'EZ81', 'EZ81', '1', '1', '35', 'E46 ', 'N46 ', 'A', '3', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1424', 'FA01', 'X5 4 8IS A               ', 'FA01', 'FA01', '1', '1', 'G5', 'E53 ', 'N62 ', 'A', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1425', 'FA02', 'X5 4 8IS RL A            ', 'FA01', 'FA01', '1', '1', 'G5', 'E53 ', 'N62 ', 'A', '5', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1426', 'FA03', 'X5 4 8IS US A            ', 'FA03', 'FA03', '1', '1', 'G5', 'E53 ', 'N62 ', 'A', '5', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1427', 'FA11', 'X5 3 0                   ', 'FA11', 'FA11', '1', '1', 'G5', 'E53 ', 'M54 ', 'S', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1428', 'FA12', 'X5 3 0 RL                ', 'FA11', 'FA11', '1', '1', 'G5', 'E53 ', 'M54 ', 'S', '5', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1429', 'FA13', 'X5 3 0 US                ', 'FA13', 'FA13', '1', '1', 'G5', 'E53 ', 'M54 ', 'S', '5', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1430', 'FA21', 'X5 3 0 A                 ', 'FA21', 'FA21', '1', '1', 'G5', 'E53 ', 'M54 ', 'A', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1431', 'FA22', 'X5 3 0 RL A              ', 'FA21', 'FA21', '1', '1', 'G5', 'E53 ', 'M54 ', 'A', '5', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1432', 'FA23', 'X5 3 0 US A              ', 'FA23', 'FA23', '1', '1', 'G5', 'E53 ', 'M54 ', 'A', '5', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1433', 'FA51', 'X5 3 0                   ', 'FA51', 'FA51', '1', '1', 'G5', 'E53 ', 'M54 ', 'S', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1434', 'FA52', 'X5 3 0 RL                ', 'FA51', 'FA51', '1', '1', 'G5', 'E53 ', 'M54 ', 'S', '5', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1435', 'FA53', 'X5 3 0 US                ', 'FA53', 'FA53', '1', '1', 'G5', 'E53 ', 'M54 ', 'S', '5', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1436', 'FA61', 'X5 3 0 A                 ', 'FA61', 'FA61', '1', '1', 'G5', 'E53 ', 'M54 ', 'A', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1437', 'FA62', 'X5 3 0 RL A              ', 'FA61', 'FA61', '1', '1', 'G5', 'E53 ', 'M54 ', 'A', '5', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1438', 'FA63', 'X5 3 0 US A              ', 'FA63', 'FA63', '1', '1', 'G5', 'E53 ', 'M54 ', 'A', '5', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1439', 'FA71', 'X5 3 0D                  ', 'FA71', 'FA71', '1', '1', 'G5', 'E53 ', 'M57 ', 'S', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1440', 'FA72', 'X5 3 0D RL               ', 'FA71', 'FA71', '1', '1', 'G5', 'E53 ', 'M57 ', 'S', '5', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1441', 'FA81', 'X5 3 0D A                ', 'FA81', 'FA81', '1', '1', 'G5', 'E53 ', 'M57 ', 'A', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1442', 'FA82', 'X5 3 0D RL A             ', 'FA81', 'FA81', '1', '1', 'G5', 'E53 ', 'M57 ', 'A', '5', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1443', 'FB01', 'X5 4 6IS A               ', 'FB01', 'FB01', '1', '1', 'G5', 'E53 ', 'M62S', 'A', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1444', 'FB02', 'X5 4 6IS RL A            ', 'FB01', 'FB01', '1', '1', 'G5', 'E53 ', 'M62S', 'A', '5', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1445', 'FB03', 'X5 4 6IS US A            ', 'FB03', 'FB03', '1', '1', 'G5', 'E53 ', 'M62S', 'A', '5', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1446', 'FB41', 'X5 4 4 A                 ', 'FB41', 'FB41', '1', '1', 'G5', 'E53 ', 'M62 ', 'A', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1447', 'FB42', 'X5 4 4 RL A              ', 'FB41', 'FB41', '1', '1', 'G5', 'E53 ', 'M62 ', 'A', '5', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1448', 'FB43', 'X5 4 4 US A              ', 'FB43', 'FB43', '1', '1', 'G5', 'E53 ', 'M62 ', 'A', '5', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1449', 'FB61', 'X5 4 4 A                 ', 'FB61', 'FB61', '1', '1', 'G5', 'E53 ', 'N62 ', 'A', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1450', 'FB62', 'X5 4 4 RL A              ', 'FB61', 'FB61', '1', '1', 'G5', 'E53 ', 'N62 ', 'A', '5', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1451', 'FB63', 'X5 4 4 US A              ', 'FB63', 'FB63', '1', '1', 'G5', 'E53 ', 'N62 ', 'A', '5', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1452', 'FB71', 'X5 3 0D                  ', 'FB71', 'FB71', '1', '1', 'G5', 'E53 ', 'M57T', 'S', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1453', 'FB72', 'X5 3 0D RL               ', 'FB71', 'FB71', '1', '1', 'G5', 'E53 ', 'M57T', 'S', '5', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1454', 'FB81', 'X5 3 0D A                ', 'FB81', 'FB81', '1', '1', 'G5', 'E53 ', 'M57T', 'A', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1455', 'FB82', 'X5 3 0D RL A             ', 'FB81', 'FB81', '1', '1', 'G5', 'E53 ', 'M57T', 'A', '5', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1456', 'FE41', 'X5 XDRIVE30I             ', 'FE41', 'FE41', '1', '1', 'G5', 'E70 ', 'N52K', 'A', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1457', 'FE42', 'X5 XDRIVE30I RL          ', 'FE41', 'FE41', '1', '1', 'G5', 'E70 ', 'N52K', 'A', '5', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1458', 'FE43', 'X5 XDRIVE30I US          ', 'FE43', 'FE43', '1', '1', 'G5', 'E70 ', 'N52K', 'A', '5', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1459', 'FE81', 'X5 XDRIVE48I             ', 'FE81', 'FE81', '1', '1', 'G5', 'E70 ', 'N62T', 'A', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1460', 'FE82', 'X5 XDRIVE48I RL          ', 'FE81', 'FE81', '1', '1', 'G5', 'E70 ', 'N62T', 'A', '5', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1461', 'FE83', 'X5 XDRIVE48I US          ', 'FE83', 'FE83', '1', '1', 'G5', 'E70 ', 'N62T', 'A', '5', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1462', 'FF01', 'X5 XDRIVE35D             ', 'FF01', 'FF01', '1', '1', 'G5', 'E70 ', 'M57Y', 'A', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1463', 'FF02', 'X5 XDRIVE35D RL          ', 'FF01', 'FF01', '1', '1', 'G5', 'E70 ', 'M57Y', 'A', '5', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1464', 'FF03', 'X5 XDRIVE35D US          ', 'FF03', 'FF03', '1', '1', 'G5', 'E70 ', 'M57Y', 'A', '5', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1465', 'FF41', 'X5 XDRIVE30D             ', 'FF41', 'FF41', '1', '1', 'G5', 'E70 ', 'M57S', 'A', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1466', 'FF42', 'X5 XDRIVE30D RL          ', 'FF41', 'FF41', '1', '1', 'G5', 'E70 ', 'M57S', 'A', '5', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1467', 'FG01', 'X6 XDRIVE35D             ', 'FG01', 'FG01', '1', '1', 'G6', 'E71 ', 'M57Y', 'A', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1468', 'FG02', 'X6 XDRIVE35D RL          ', 'FG01', 'FG01', '1', '1', 'G6', 'E71 ', 'M57Y', 'A', '5', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1469', 'FG21', 'X6 XDRIVE35I             ', 'FG21', 'FG21', '1', '1', 'G6', 'E71 ', 'N55 ', 'A', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1470', 'FG22', 'X6 XDRIVE35I RL          ', 'FG21', 'FG21', '1', '1', 'G6', 'E71 ', 'N55 ', 'A', '5', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1471', 'FG23', 'X6 XDRIVE35I US          ', 'FG23', 'FG23', '1', '1', 'G6', 'E71 ', 'N55 ', 'A', '5', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1472', 'FG41', 'X6 XDRIVE35I             ', 'FG41', 'FG41', '1', '1', 'G6', 'E71 ', 'N54 ', 'A', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1473', 'FG42', 'X6 XDRIVE35I RL          ', 'FG41', 'FG41', '1', '1', 'G6', 'E71 ', 'N54 ', 'A', '5', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1474', 'FG43', 'X6 XDRIVE35I US          ', 'FG43', 'FG43', '1', '1', 'G6', 'E71 ', 'N54 ', 'A', '5', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1475', 'FG61', 'X6 XDRIVE30D             ', 'FG61', 'FG61', '1', '1', 'G6', 'E71 ', 'M57S', 'A', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1476', 'FG62', 'X6 XDRIVE30D RL          ', 'FG61', 'FG61', '1', '1', 'G6', 'E71 ', 'M57S', 'A', '5', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1477', 'FG81', 'X6 XDRIVE50I             ', 'FG81', 'FG81', '1', '1', 'G6', 'E71 ', 'N63 ', 'A', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1478', 'FG82', 'X6 XDRIVE50I RL          ', 'FG81', 'FG81', '1', '1', 'G6', 'E71 ', 'N63 ', 'A', '5', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1479', 'FG83', 'X6 XDRIVE50I US          ', 'FG83', 'FG83', '1', '1', 'G6', 'E71 ', 'N63 ', 'A', '5', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1480', 'FH01', 'X6 XDRIVE 40D            ', 'FH01', 'FH01', '1', '1', 'G6', 'E71 ', 'N57S', 'A', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1481', 'FH02', 'X6 XDRIVE 40D RL         ', 'FH01', 'FH01', '1', '1', 'G6', 'E71 ', 'N57S', 'A', '5', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1482', 'FH03', 'X6 XDRIVE50I HY          ', 'FH03', 'FH03', '1', '1', '6H', 'E72 ', 'N63 ', 'A', '5', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1483', 'FH21', 'X6 XDRIVE50I HY          ', 'FH21', 'FH21', '1', '1', '6H', 'E72 ', 'N63 ', 'A', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1484', 'FH61', 'X6 XDRIVE 30D            ', 'FH61', 'FH61', '1', '1', 'G6', 'E71 ', 'N57 ', 'A', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1485', 'FH62', 'X6 XDRIVE 30D RL         ', 'FH61', 'FH61', '1', '1', 'G6', 'E71 ', 'N57 ', 'A', '5', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1486', 'FH81', 'X6 M50D                  ', 'FH81', 'FH81', '1', '1', 'G6', 'E71 ', 'N57X', 'A', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1487', 'FH82', 'X6 M50D RL               ', 'FH81', 'FH81', '1', '1', 'G6', 'E71 ', 'N57X', 'A', '5', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1488', 'FJ01', 'PHANTOM EW               ', 'FJ01', 'FJ01', '1', '1', 'RR', 'RR1 ', 'N73R', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1489', 'FJ02', 'PHANTOM EW               ', 'FJ01', 'FJ01', '1', '1', 'RR', 'RR1 ', 'N73R', 'A', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1490', 'FJ03', 'PHANTOM EW               ', 'FJ03', 'FJ03', '1', '1', 'RR', 'RR1 ', 'N73R', 'A', '4', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1491', 'FJ21', 'PHANTOM C                ', 'FJ21', 'FJ21', '1', '1', 'RR', 'RR3 ', 'N73R', 'A', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1492', 'FJ22', 'PHANTOM C                ', 'FJ21', 'FJ21', '1', '1', 'RR', 'RR3 ', 'N73R', 'A', '2', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1493', 'FJ23', 'PHANTOM C                ', 'FJ23', 'FJ23', '1', '1', 'RR', 'RR3 ', 'N73R', 'A', '2', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1494', 'FJ61', 'PHANTOM                  ', 'FJ61', 'FJ61', '1', '1', 'RR', 'RR1 ', 'N73R', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1495', 'FJ62', 'PHANTOM                  ', 'FJ61', 'FJ61', '1', '1', 'RR', 'RR1 ', 'N73R', 'A', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1496', 'FJ63', 'PHANTOM                  ', 'FJ63', 'FJ63', '1', '1', 'RR', 'RR1 ', 'N73R', 'A', '4', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1497', 'FJ81', 'PHANTOM DC               ', 'FJ81', 'FJ81', '1', '1', 'RR', 'RR2 ', 'N73R', 'A', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1498', 'FJ82', 'PHANTOM DC               ', 'FJ81', 'FJ81', '1', '1', 'RR', 'RR2 ', 'N73R', 'A', '2', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1499', 'FJ83', 'PHANTOM DC               ', 'FJ83', 'FJ83', '1', '1', 'RR', 'RR2 ', 'N73R', 'A', '2', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1500', 'FK01', 'ROLLS ROYCE EWB          ', 'FK01', 'FK01', '1', '1', 'RR', 'RR1 ', 'N73R', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1501', 'FK02', 'ROLLS-ROYCE EWB          ', 'FK01', 'FK01', '1', '1', 'RR', 'RR1 ', 'N73R', 'A', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1502', 'FK03', 'ROLLS-ROYCE EWB          ', 'FK03', 'FK03', '1', '1', 'RR', 'RR1 ', 'N73R', 'A', '4', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1503', 'FK21', 'ROLLS-ROYCE              ', 'FK21', 'FK21', '1', '1', 'RR', 'RR3 ', 'N73R', 'A', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1504', 'FK22', 'ROLLS-ROYCE RL           ', 'FK21', 'FK21', '1', '1', 'RR', 'RR3 ', 'N73R', 'A', '2', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1505', 'FK23', 'ROLLS-ROYCE US           ', 'FK23', 'FK23', '1', '1', 'RR', 'RR3 ', 'N73R', 'A', '2', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1506', 'FK41', 'GHOST                    ', 'FK41', 'FK41', '1', '1', 'RR', 'RR4 ', 'N74R', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1507', 'FK42', 'GHOST                    ', 'FK41', 'FK41', '1', '1', 'RR', 'RR4 ', 'N74R', 'A', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1508', 'FK43', 'GHOST                    ', 'FK43', 'FK43', '1', '1', 'RR', 'RR4 ', 'N74R', 'A', '4', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1509', 'FK61', 'ROLLS-ROYCE              ', 'FK61', 'FK61', '1', '1', 'RR', 'RR1 ', 'N73R', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1510', 'FK62', 'ROLLS-ROYCE RL           ', 'FK61', 'FK61', '1', '1', 'RR', 'RR1 ', 'N73R', 'A', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1511', 'FK63', 'ROLLS-ROYCE US           ', 'FK63', 'FK63', '1', '1', 'RR', 'RR1 ', 'N73R', 'A', '4', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1512', 'FK81', 'ROLLS-ROYCE              ', 'FK81', 'FK81', '1', '1', 'RR', 'RR2 ', 'N73R', 'A', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1513', 'FK82', 'ROLLS-ROYCE RL           ', 'FK81', 'FK81', '1', '1', 'RR', 'RR2 ', 'N73R', 'A', '2', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1514', 'FK83', 'ROLLS-ROYCE US           ', 'FK83', 'FK83', '1', '1', 'RR', 'RR2 ', 'N73R', 'A', '2', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1515', 'FP15', '523I CKD RUS             ', 'FP15', 'FP15', '1', '1', 'R5', 'F10 ', 'N52T', 'S', '4', 'L', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1516', 'FP25', '523I CKD RUS A           ', 'FP41', 'FP41', '1', '1', 'R5', 'F10 ', 'N52T', 'A', '4', 'L', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1517', 'FP29', '520LI A CHN A            ', 'FP29', 'FP29', '1', '1', '5C', 'F18 ', 'N52T', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1518', 'FP41', '523I A                   ', 'FP41', 'FP41', '1', '1', '5', 'F10 ', 'N52T', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1519', 'FP42', '523I RL A                ', 'FP41', 'FP41', '1', '1', '5', 'F10 ', 'N52T', 'A', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1520', 'FP44', '523I MAL SKD RL A        ', 'FP41', 'FP41', '1', '1', 'L5', 'F10 ', 'N52T', 'A', '4', 'R', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1521', 'FP45', '523I IND SKD RL A        ', 'FP41', 'FP41', '1', '1', 'I5', 'F10 ', 'N52T', 'A', '4', 'R', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1522', 'FP46', '523I SKD EGY A           ', 'FP41', 'FP41', '1', '1', 'Y5', 'F10 ', 'N52T', 'A', '4', 'L', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1523', 'FP48', '523I THA SKD RL A        ', 'FP41', 'FP41', '1', '1', 'T5', 'F10 ', 'N52T', 'A', '4', 'R', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1524', 'FP49', '523LI A CHN A            ', 'FP49', 'FP49', '1', '1', '5C', 'F18 ', 'N52T', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1525', 'FR01', '550I A                   ', 'FR01', 'FR01', '1', '1', '5', 'F10 ', 'N63 ', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1526', 'FR02', '550I RL A                ', 'FR01', 'FR01', '1', '1', '5', 'F10 ', 'N63 ', 'A', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1527', 'FR03', '550I US A                ', 'FR03', 'FR03', '1', '1', '5', 'F10 ', 'N63 ', 'A', '4', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1528', 'FR15', '528I SKD RUS             ', '    ', '    ', '1', '1', 'R5', 'F10 ', 'N52T', 'S', '4', 'L', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1529', 'FR21', '530I A                   ', 'FR21', 'FR21', '1', '1', '5', 'F10 ', 'N52T', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1530', 'FR22', '530I RL A                ', 'FR21', 'FR21', '1', '1', '5', 'F10 ', 'N52T', 'A', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1531', 'FR23', '528I US A                ', 'FR23', 'FR23', '1', '1', '5', 'F10 ', 'N52T', 'A', '4', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1532', 'FR24', '528I MYS CKD RL A        ', 'FR21', 'FR21', '1', '1', 'L5', 'F10 ', 'N52T', 'A', '4', 'R', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1533', 'FR25', '528I SKD RUS A           ', 'FR21', 'FR21', '1', '1', 'R5', 'F10 ', 'N52T', 'A', '4', 'L', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1534', 'FR26', '528I SKD EGY A           ', 'FR21', 'FR21', '1', '1', 'Y5', 'F10 ', 'N52T', 'A', '4', 'L', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1535', 'FR29', '528LI A CHN A            ', 'FR29', 'FR29', '1', '1', '5C', 'F18 ', 'N52T', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1536', 'FR71', '535I                     ', 'FR71', 'FR71', '1', '1', '5', 'F10 ', 'N55 ', 'S', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1537', 'FR72', '535I RL                  ', 'FR71', 'FR71', '1', '1', '5', 'F10 ', 'N55 ', 'S', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1538', 'FR73', '535I US                  ', 'FR73', 'FR73', '1', '1', '5', 'F10 ', 'N55 ', 'S', '4', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1539', 'FR81', '535I A                   ', 'FR81', 'FR81', '1', '1', '5', 'F10 ', 'N55 ', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1540', 'FR82', '535I RL A                ', 'FR81', 'FR81', '1', '1', '5', 'F10 ', 'N55 ', 'A', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1541', 'FR83', '535I US A                ', 'FR83', 'FR83', '1', '1', '5', 'F10 ', 'N55 ', 'A', '4', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1542', 'FR86', '535I SKD EGY A           ', 'FR81', 'FR81', '1', '1', 'Y5', 'F10 ', 'N55 ', 'A', '4', 'L', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1543', 'FR89', '535LI A CHN A            ', 'FR89', 'FR89', '1', '1', '5C', 'F18 ', 'N55 ', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1544', 'FR93', '550I US                  ', 'FR93', 'FR93', '1', '1', '5', 'F10 ', 'N63 ', 'S', '4', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1545', 'FS11', '523I                     ', 'FS11', 'FS11', '1', '1', '5', 'F10 ', 'N53 ', 'S', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1546', 'FS12', '523I RL                  ', 'FS11', 'FS11', '1', '1', '5', 'F10 ', 'N53 ', 'S', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1547', 'FS21', '523I A                   ', 'FS21', 'FS21', '1', '1', '5', 'F10 ', 'N53 ', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1548', 'FS22', '523I RL A                ', 'FS21', 'FS21', '1', '1', '5', 'F10 ', 'N53 ', 'A', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1549', 'FS51', '528I                     ', 'FS51', 'FS51', '1', '1', '5', 'F10 ', 'N53 ', 'S', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1550', 'FS52', '528I RL                  ', 'FS51', 'FS51', '1', '1', '5', 'F10 ', 'N53 ', 'S', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1551', 'FS61', '528I A                   ', 'FS61', 'FS61', '1', '1', '5', 'F10 ', 'N53 ', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1552', 'FS62', '528I RL A                ', 'FS61', 'FS61', '1', '1', '5', 'F10 ', 'N53 ', 'A', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1553', 'FU01', '550I XDRIVE A            ', 'FU01', 'FU01', '1', '1', '5X', 'F10 ', 'N63 ', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1554', 'FU03', '550I XDRIVE US A         ', 'FU03', 'FU03', '1', '1', '5X', 'F10 ', 'N63 ', 'A', '4', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1555', 'FU81', '535I XDRIVE A            ', 'FU81', 'FU81', '1', '1', '5X', 'F10 ', 'N55 ', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1556', 'FU83', '535I XDRIVE US A         ', 'FU83', 'FU83', '1', '1', '5X', 'F10 ', 'N55 ', 'A', '4', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1557', 'FV15', '530D XDRIVE SKD RUS      ', '    ', '    ', '1', '1', '5R', 'F10 ', 'N57T', 'S', '4', 'L', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1558', 'FV25', '530D XDRIVE SKD RUSA     ', 'FV41', 'FV41', '1', '1', '5R', 'F10 ', 'N57T', 'A', '4', 'L', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1559', 'FV41', '530D XDRIVE A            ', 'FV41', 'FV41', '1', '1', '5X', 'F10 ', 'N57T', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1560', 'FV43', '535D XDRIVE A            ', 'FV43', 'FV43', '1', '1', '5X', 'F10 ', 'N57T', 'A', '4', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1561', 'FV81', 'M550D XDRIVE A           ', 'FV81', 'FV81', '1', '1', '5X', 'F10 ', 'N57X', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1562', 'FV91', 'M5                       ', 'FV91', 'FV91', '1', '1', 'M5', 'F10 ', 'S63T', 'S', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1563', 'FV92', 'M5 RL                    ', 'FV91', 'FV91', '1', '1', 'M5', 'F10 ', 'S63T', 'S', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1564', 'FV93', 'M5 US                    ', 'FV93', 'FV93', '1', '1', 'M5', 'F10 ', 'S63T', 'S', '4', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1565', 'FW11', '520D                     ', 'FW11', 'FW11', '1', '1', '5', 'F10 ', 'N47T', 'S', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1566', 'FW12', '520D RL                  ', 'FW11', 'FW11', '1', '1', '5', 'F10 ', 'N47T', 'S', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1567', 'FW21', '520D A                   ', 'FW21', 'FW21', '1', '1', '5', 'F10 ', 'N47T', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1568', 'FW22', '520D RL A                ', 'FW21', 'FW21', '1', '1', '5', 'F10 ', 'N47T', 'A', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1569', 'FW26', '520D RL A                ', 'FW21', 'FW21', '1', '1', 'C5', 'F10 ', 'N47T', 'A', '4', 'R', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1570', 'FW28', '520D THA SDK RL A        ', 'FW21', 'FW21', '1', '1', 'T5', 'F10 ', 'N47T', 'A', '4', 'R', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1571', 'FW31', '525D                     ', 'FW31', 'FW31', '1', '1', '5', 'F10 ', 'N57 ', 'S', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1572', 'FW32', '525D RL                  ', 'FW31', 'FW31', '1', '1', '5', 'F10 ', 'N57 ', 'S', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1573', 'FW41', '525D A                   ', 'FW41', 'FW41', '1', '1', '5', 'F10 ', 'N57 ', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1574', 'FW42', '525D RL A                ', 'FW41', 'FW41', '1', '1', '5', 'F10 ', 'N57 ', 'A', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1575', 'FW45', '525D IND SKD RL A        ', 'FW41', 'FW41', '1', '1', 'I5', 'F10 ', 'N57 ', 'A', '4', 'R', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1576', 'FW48', '525D SKD RL THA A        ', 'FW41', 'FW41', '1', '1', 'T5', 'F10 ', 'N57 ', 'A', '4', 'R', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1577', 'FW51', '530D                     ', 'FW51', 'FW51', '1', '1', '5', 'F10 ', 'N57 ', 'S', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1578', 'FW52', '530D RL                  ', 'FW51', 'FW51', '1', '1', '5', 'F10 ', 'N57 ', 'S', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1579', 'FW55', '530D SKD IND RL          ', 'FW51', 'FW51', '1', '1', 'C5', 'F10 ', 'N57 ', 'S', '4', 'R', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1580', 'FW61', '530D A                   ', 'FW61', 'FW61', '1', '1', '5', 'F10 ', 'N57 ', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1581', 'FW62', '530D RL A                ', 'FW61', 'FW61', '1', '1', '5', 'F10 ', 'N57 ', 'A', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1582', 'FW64', '520D SKD MYS RL A        ', 'FW21', 'FW21', '1', '1', 'L5', 'F10 ', 'N47T', 'A', '4', 'R', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1583', 'FW65', '530D SKD IND RL A        ', 'FW61', 'FW61', '1', '1', 'C5', 'F10 ', 'N57 ', 'A', '4', 'R', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1584', 'FW75', '520D SKD IND RL          ', 'FW11', 'FW11', '1', '1', 'C5', 'F10 ', 'N47T', 'S', '4', 'R', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1585', 'FW81', '535D A                   ', 'FW81', 'FW81', '1', '1', '5', 'F10 ', 'N57S', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1586', 'FW82', '535D RL A                ', 'FW81', 'FW81', '1', '1', '5', 'F10 ', 'N57S', 'A', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1587', 'FW85', '520D SKD IND RL A        ', 'FW21', 'FW21', '1', '1', 'C5', 'F10 ', 'N47T', 'A', '4', 'R', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1588', 'FW91', '520D EFFDYN EDITION      ', 'FW91', 'FW91', '1', '1', '5', 'F10 ', 'N47T', 'S', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1589', 'FW92', '520D RL EFFDYN EDITI     ', 'FW91', 'FW91', '1', '1', '5', 'F10 ', 'N47T', 'S', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1590', 'FZ01', '535IH ACTIVE HYBRIDA     ', 'FZ01', 'FZ01', '1', '1', '5', 'F10 ', 'N55 ', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1591', 'FZ02', '535IH ACTIVE HYBRIDA     ', 'FZ01', 'FZ01', '1', '1', '5', 'F10 ', 'N55 ', 'A', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1592', 'FZ03', '535IH ACTIVEHYBRID A     ', 'FZ03', 'FZ03', '1', '1', '5', 'F10 ', 'N55 ', 'A', '4', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1593', 'GA31', '730I                     ', 'GA31', 'GA31', '1', '1', '7', 'E32 ', 'M30 ', 'S', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1594', 'GA32', '730I RL                  ', 'GA31', 'GA31', '1', '1', '7', 'E32 ', 'M30 ', 'S', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1595', 'GA41', '730I A                   ', 'GA41', 'GA41', '1', '1', '7', 'E32 ', 'M30 ', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1596', 'GA42', '730I A RL                ', 'GA41', 'GA41', '1', '1', '7', 'E32 ', 'M30 ', 'A', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1597', 'GA48', '730IA RL ZA CKD          ', 'GA41', 'GA41', '1', '1', 'Z7', 'E32 ', 'M30 ', 'A', '4', 'R', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1598', 'GA71', '730 I KAT                ', 'GA31', 'GA31', '1', '1', '7', 'E32 ', 'M30 ', 'S', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1599', 'GA72', '730 I RHD KATALYSATO     ', 'GA31', 'GA31', '1', '1', '7', 'E32 ', 'M30 ', 'S', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1600', 'GA81', '730 I A KAT              ', 'GA41', 'GA41', '1', '1', '7', 'E32 ', 'M30 ', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1601', 'GA82', '730 I A RL KAT           ', 'GA41', 'GA41', '1', '1', '7', 'E32 ', 'M30 ', 'A', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1602', 'GA88', '730IA RL ZA CKD          ', 'GA41', 'GA41', '1', '1', 'Z7', 'E32 ', 'M30 ', 'A', '4', 'R', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1603', 'GB31', '735 I KAT                ', 'GB31', 'GB31', '1', '1', '7', 'E32 ', 'M30 ', 'S', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1604', 'GB32', '735 I RHD KATALYSATO     ', 'GB31', 'GB31', '1', '1', '7', 'E32 ', 'M30 ', 'S', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1605', 'GB33', '735 I USA                ', 'GB33', 'GB33', '1', '1', '7', 'E32 ', 'M30 ', 'S', '4', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1606', 'GB41', '735 I A KAT              ', 'GB41', 'GB41', '1', '1', '7', 'E32 ', 'M30 ', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1607', 'GB42', '735 I A RL KAT           ', 'GB41', 'GB41', '1', '1', '7', 'E32 ', 'M30 ', 'A', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1608', 'GB43', '735 I A USA              ', 'GB43', 'GB43', '1', '1', '7', 'E32 ', 'M30 ', 'A', '4', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1609', 'GB48', '735I ARL ZA CKD          ', 'GB41', 'GB41', '1', '1', 'Z7', 'E32 ', 'M30 ', 'A', '4', 'R', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1610', 'GB51', '735I                     ', 'GB31', 'GB31', '1', '1', '7', 'E32 ', 'M30 ', 'S', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1611', 'GB52', '735I RL                  ', 'GB31', 'GB31', '1', '1', '7', 'E32 ', 'M30 ', 'S', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1612', 'GB61', '735I                     ', 'GB41', 'GB41', '1', '1', '7', 'E32 ', 'M30 ', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1613', 'GB62', '735 I A RHD              ', 'GB41', 'GB41', '1', '1', '7', 'E32 ', 'M30 ', 'A', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1614', 'GB68', '735IA RL ZA CKD          ', 'GB41', 'GB41', '1', '1', 'Z7', 'E32 ', 'M30 ', 'A', '4', 'R', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1615', 'GB81', '750 I A KAT              ', 'GB81', 'GB81', '1', '1', '7', 'E32 ', 'M70 ', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1616', 'GB82', '750 I A RL KAT           ', 'GB81', 'GB81', '1', '1', '7', 'E32 ', 'M70 ', 'A', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1617', 'GC11', '730 I L KAT              ', 'GC31', 'GC31', '1', '1', '7', 'E32 ', 'M30 ', 'S', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1618', 'GC12', '730 I L RHD              ', 'GC31', 'GC31', '1', '1', '7', 'E32 ', 'M30 ', 'S', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1619', 'GC21', '730 I L A KAT            ', 'GC41', 'GC41', '1', '1', '7', 'E32 ', 'M30 ', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1620', 'GC22', '730 I L ARL KAT          ', 'GC41', 'GC41', '1', '1', '7', 'E32 ', 'M30 ', 'A', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1621', 'GC24', '730IL ARLMALCKD          ', 'GC41', 'GC41', '1', '1', 'L7', 'E32 ', 'M30 ', 'A', '4', 'R', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1622', 'GC31', '735 I L KAT              ', 'GC31', 'GC31', '1', '1', '7', 'E32 ', 'M30 ', 'S', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1623', 'GC32', '735 I L RHD KAT          ', 'GC31', 'GC31', '1', '1', '7', 'E32 ', 'M30 ', 'S', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1624', 'GC41', '735 I L A KAT            ', 'GC41', 'GC41', '1', '1', '7', 'E32 ', 'M30 ', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1625', 'GC42', '735 I L ARL KAT          ', 'GC41', 'GC41', '1', '1', '7', 'E32 ', 'M30 ', 'A', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1626', 'GC43', '735 I L A USA            ', 'GC43', 'GC43', '1', '1', '7', 'E32 ', 'M30 ', 'A', '4', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1627', 'GC48', '735IL ARL ZACKD          ', 'GC41', 'GC41', '1', '1', 'Z7', 'E32 ', 'M30 ', 'A', '4', 'R', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1628', 'GC51', '735IL                    ', 'GC31', 'GC31', '1', '1', '7', 'E32 ', 'M30 ', 'S', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1629', 'GC52', '735IL RL                 ', 'GC31', 'GC31', '1', '1', '7', 'E32 ', 'M30 ', 'S', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1630', 'GC61', '735IL A                  ', 'GC41', 'GC41', '1', '1', '7', 'E32 ', 'M30 ', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1631', 'GC62', '735IL A RL               ', 'GC41', 'GC41', '1', '1', '7', 'E32 ', 'M30 ', 'A', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1632', 'GC81', '750 I L A KAT            ', 'GC81', 'GC81', '1', '1', '7', 'E32 ', 'M70 ', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1633', 'GC82', '750 I L ARL KAT          ', 'GC81', 'GC81', '1', '1', '7', 'E32 ', 'M70 ', 'A', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1634', 'GC83', '750 I L A USA            ', 'GC83', 'GC83', '1', '1', '7', 'E32 ', 'M70 ', 'A', '4', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1635', 'GC85', '750 I L A KAT            ', 'GC85', 'GC85', '1', '1', '7', 'E32 ', 'M70 ', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1636', 'GC88', '750IL ARL ZACKD          ', 'GC81', 'GC81', '1', '1', 'Z7', 'E32 ', 'M70 ', 'A', '4', 'R', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1637', 'GD11', '730 I                    ', 'GD11', 'GD11', '1', '1', '7', 'E32 ', 'M60 ', 'S', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1638', 'GD21', '730 I A                  ', 'GD21', 'GD21', '1', '1', '7', 'E32 ', 'M60 ', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1639', 'GD22', '730 I A RL               ', 'GD21', 'GD21', '1', '1', '7', 'E32 ', 'M60 ', 'A', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1640', 'GD23', '730 I A USA              ', 'GD23', 'GD23', '1', '1', '7', 'E32 ', 'M60 ', 'A', '4', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1641', 'GD28', '730IA RL ZA CKD          ', 'GD21', 'GD21', '1', '1', 'Z7', 'E32 ', 'M60 ', 'A', '4', 'R', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1642', 'GD41', '740 I A KAT              ', 'GD41', 'GD41', '1', '1', '7', 'E32 ', 'M60 ', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1643', 'GD42', '740 I A RL               ', 'GD41', 'GD41', '1', '1', '7', 'E32 ', 'M60 ', 'A', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1644', 'GD43', '740 I A USA              ', 'GD43', 'GD43', '1', '1', '7', 'E32 ', 'M60 ', 'A', '4', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1645', 'GD48', '740IA RL ZA CKD          ', 'GD41', 'GD41', '1', '1', 'Z7', 'E32 ', 'M60 ', 'A', '4', 'R', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1646', 'GD51', '730 I L                  ', 'GD51', 'GD51', '1', '1', '7', 'E32 ', 'M60 ', 'S', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1647', 'GD61', '730 I L A                ', 'GD61', 'GD61', '1', '1', '7', 'E32 ', 'M60 ', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1648', 'GD62', '730 I L A RL             ', 'GD61', 'GD61', '1', '1', '7', 'E32 ', 'M60 ', 'A', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1649', 'GD81', '740 I L A                ', 'GD81', 'GD81', '1', '1', '7', 'E32 ', 'M60 ', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1650', 'GD82', '740 I L A RL             ', 'GD81', 'GD81', '1', '1', '7', 'E32 ', 'M60 ', 'A', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1651', 'GD83', '740 I L A USA            ', 'GD83', 'GD83', '1', '1', '7', 'E32 ', 'M60 ', 'A', '4', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1652', 'GD84', '740IL ARLMALCKD          ', 'GD81', 'GD81', '1', '1', 'L7', 'E32 ', 'M60 ', 'A', '4', 'R', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1653', 'GE01', '725TDS A                 ', 'GE01', 'GE01', '1', '1', '7', 'E38 ', 'M51S', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1654', 'GE11', '728I                     ', 'GE11', 'GE11', '1', '1', '7', 'E38 ', 'M52 ', 'S', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1655', 'GE21', '728I A                   ', 'GE21', 'GE21', '1', '1', '7', 'E38 ', 'M52 ', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1656', 'GE22', '728I A RL                ', 'GE21', 'GE21', '1', '1', '7', 'E38 ', 'M52 ', 'A', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1657', 'GE31', '728I                     ', 'GE31', 'GE31', '1', '1', '7', 'E38 ', 'M52 ', 'S', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1658', 'GE41', '728I A                   ', 'GE41', 'GE41', '1', '1', '7', 'E38 ', 'M52 ', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1659', 'GE42', '728I A RL                ', 'GE41', 'GE41', '1', '1', '7', 'E38 ', 'M52 ', 'A', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1660', 'GE61', '730D A                   ', 'GE61', 'GE61', '1', '1', '7', 'E38 ', 'M57 ', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1661', 'GE81', '740D A                   ', 'GE81', 'GE81', '1', '1', '7', 'E38 ', 'M67 ', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1662', 'GE91', '725TDS                   ', 'GE91', 'GE91', '1', '1', '7', 'E38 ', 'M51S', 'S', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1663', 'GF11', '730I                     ', 'GF11', 'GF11', '1', '1', '7', 'E38 ', 'M60 ', 'S', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1664', 'GF21', '730I A                   ', 'GF21', 'GF21', '1', '1', '7', 'E38 ', 'M60 ', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1665', 'GF22', '730I A RL                ', 'GF21', 'GF21', '1', '1', '7', 'E38 ', 'M60 ', 'A', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1666', 'GF25', '730I A RLTHACKD          ', 'GF21', 'GF21', '1', '1', 'T7', 'E38 ', 'M60 ', 'A', '4', 'R', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1667', 'GF31', '735I                     ', 'GF31', 'GF31', '1', '1', '7', 'E38 ', 'M62 ', 'S', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1668', 'GF41', '735I A                   ', 'GF41', 'GF41', '1', '1', '7', 'E38 ', 'M62 ', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1669', 'GF42', '735I A RL                ', 'GF41', 'GF41', '1', '1', '7', 'E38 ', 'M62 ', 'A', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1670', 'GF51', '740I                     ', 'GF51', 'GF51', '1', '1', '7', 'E38 ', 'M60 ', 'S', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1671', 'GF61', '740I A                   ', 'GF61', 'GF61', '1', '1', '7', 'E38 ', 'M60 ', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1672', 'GF62', '740I A RL                ', 'GF61', 'GF61', '1', '1', '7', 'E38 ', 'M60 ', 'A', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1673', 'GF63', '740I A US                ', 'GF63', 'GF63', '1', '1', '7', 'E38 ', 'M60 ', 'A', '4', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1674', 'GF65', '740I A RLTHACKD          ', 'GF61', 'GF61', '1', '1', 'T7', 'E38 ', 'M60 ', 'A', '4', 'R', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1675', 'GF71', '740I                     ', 'GF71', 'GF71', '1', '1', '7', 'E38 ', 'M62 ', 'S', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1676', 'GF81', '740I A                   ', 'GF81', 'GF81', '1', '1', '7', 'E38 ', 'M62 ', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1677', 'GF82', '740I A RL                ', 'GF81', 'GF81', '1', '1', '7', 'E38 ', 'M62 ', 'A', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1678', 'GF83', '740I A US                ', 'GF83', 'GF83', '1', '1', '7', 'E38 ', 'M62 ', 'A', '4', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1679', 'GG01', '750I A                   ', 'GG01', 'GG01', '1', '1', '7', 'E38 ', 'M73 ', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1680', 'GG02', '750I A RL                ', 'GG01', 'GG01', '1', '1', '7', 'E38 ', 'M73 ', 'A', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1681', 'GG21', '750I A                   ', 'GG21', 'GG21', '1', '1', '7', 'E38 ', 'M73 ', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1682', 'GG22', '750I A RL                ', 'GG21', 'GG21', '1', '1', '7', 'E38 ', 'M73 ', 'A', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1683', 'GG41', '735I A                   ', 'GG41', 'GG41', '1', '1', '7', 'E38 ', 'M62 ', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1684', 'GG42', '735I A RL                ', 'GG41', 'GG41', '1', '1', '7', 'E38 ', 'M62 ', 'A', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1685', 'GG81', '740I A                   ', 'GG81', 'GG81', '1', '1', '7', 'E38 ', 'M62 ', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1686', 'GG82', '740I A RL                ', 'GG81', 'GG81', '1', '1', '7', 'E38 ', 'M62 ', 'A', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1687', 'GG83', '740I A US                ', 'GG83', 'GG83', '1', '1', '7', 'E38 ', 'M62 ', 'A', '4', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1688', 'GH01', '740IL A                  ', 'GH01', 'GH01', '1', '1', '7', 'E38 ', 'M62 ', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1689', 'GH03', '740IL A US               ', 'GH03', 'GH03', '1', '1', '7', 'E38 ', 'M62 ', 'A', '4', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1690', 'GH21', '728IL A                  ', 'GH21', 'GH21', '1', '1', '7', 'E38 ', 'M52 ', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1691', 'GH22', '728IL A RL               ', 'GH21', 'GH21', '1', '1', '7', 'E38 ', 'M52 ', 'A', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1692', 'GH25', '728IL ARLTHACKD          ', 'GH21', 'GH21', '1', '1', 'T7', 'E38 ', 'M52 ', 'A', '4', 'R', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1693', 'GH41', '728IL A                  ', 'GH41', 'GH41', '1', '1', '7', 'E38 ', 'M52 ', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1694', 'GH61', '735IL A                  ', 'GH61', 'GH61', '1', '1', '7', 'E38 ', 'M62 ', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1695', 'GH62', '735IL A RL               ', 'GH61', 'GH61', '1', '1', '7', 'E38 ', 'M62 ', 'A', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1696', 'GH81', '740IL A                  ', 'GH81', 'GH81', '1', '1', '7', 'E38 ', 'M62 ', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1697', 'GH82', '740IL A RL               ', 'GH81', 'GH81', '1', '1', '7', 'E38 ', 'M62 ', 'A', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1698', 'GH83', '740IL A US               ', 'GH83', 'GH83', '1', '1', '7', 'E38 ', 'M62 ', 'A', '4', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1699', 'GJ01', '750IL A                  ', 'GJ01', 'GJ01', '1', '1', '7', 'E38 ', 'M73 ', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1700', 'GJ02', '750IL A RL               ', 'GJ01', 'GJ01', '1', '1', '7', 'E38 ', 'M73 ', 'A', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1701', 'GJ03', '750IL A US               ', 'GJ03', 'GJ03', '1', '1', '7', 'E38 ', 'M73 ', 'A', '4', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1702', 'GJ11', '730IL                    ', 'GJ11', 'GJ11', '1', '1', '7', 'E38 ', 'M60 ', 'S', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1703', 'GJ21', '730IL A                  ', 'GJ21', 'GJ21', '1', '1', '7', 'E38 ', 'M60 ', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1704', 'GJ22', '730IL A RL               ', 'GJ21', 'GJ21', '1', '1', '7', 'E38 ', 'M60 ', 'A', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1705', 'GJ27', '730IL ARLINDCKD          ', 'GJ21', 'GJ21', '1', '1', 'D7', 'E38 ', 'M60 ', 'A', '4', 'R', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1706', 'GJ41', '735IL A                  ', 'GJ41', 'GJ41', '1', '1', '7', 'E38 ', 'M62 ', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1707', 'GJ42', '735IL A RL               ', 'GJ41', 'GJ41', '1', '1', '7', 'E38 ', 'M62 ', 'A', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1708', 'GJ47', '735IL ARLINDCKD          ', 'GJ41', 'GJ41', '1', '1', 'D7', 'E38 ', 'M62 ', 'A', '4', 'R', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1709', 'GJ51', '740 I L                  ', '    ', '    ', '1', '1', '7', 'E38 ', 'M60 ', 'S', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1710', 'GJ61', '740IL A                  ', 'GJ61', 'GJ61', '1', '1', '7', 'E38 ', 'M60 ', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1711', 'GJ62', '740IL A RL               ', 'GJ61', 'GJ61', '1', '1', '7', 'E38 ', 'M60 ', 'A', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1712', 'GJ63', '740IL A US               ', 'GJ63', 'GJ63', '1', '1', '7', 'E38 ', 'M60 ', 'A', '4', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1713', 'GJ64', '740IL ARLMALCKD          ', 'GJ61', 'GJ61', '1', '1', 'L7', 'E38 ', 'M60 ', 'A', '4', 'R', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1714', 'GJ81', '740IL A                  ', 'GJ81', 'GJ81', '1', '1', '7', 'E38 ', 'M62 ', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1715', 'GJ82', '740IL A RL               ', 'GJ81', 'GJ81', '1', '1', '7', 'E38 ', 'M62 ', 'A', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1716', 'GJ83', '740IL A US               ', 'GJ83', 'GJ83', '1', '1', '7', 'E38 ', 'M62 ', 'A', '4', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1717', 'GJ84', '740IL ARLMALCKD          ', 'GJ81', 'GJ81', '1', '1', 'L7', 'E38 ', 'M62 ', 'A', '4', 'R', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1718', 'GJ85', '740IL ARLTHACKD          ', 'GJ81', 'GJ81', '1', '1', 'T7', 'E38 ', 'M62 ', 'A', '4', 'R', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1719', 'GJ87', '740IL A MEX SKD          ', 'GJ81', 'GJ81', '1', '1', 'X7', 'E38 ', 'M62 ', 'A', '4', 'L', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1720', 'GK01', '750IL A S                ', 'GK01', 'GK01', '1', '1', '7', 'E38 ', 'M73 ', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1721', 'GK02', '750IL A RL S             ', 'GK01', 'GK01', '1', '1', '7', 'E38 ', 'M73 ', 'A', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1722', 'GK21', '750IL A                  ', 'GK21', 'GK21', '1', '1', '7', 'E38 ', 'M73 ', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1723', 'GK22', '750IL A RL               ', 'GK21', 'GK21', '1', '1', '7', 'E38 ', 'M73 ', 'A', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1724', 'GK23', '750IL A US               ', 'GK23', 'GK23', '1', '1', '7', 'E38 ', 'M73 ', 'A', '4', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1725', 'GK41', '750IL A S                ', 'GK41', 'GK41', '1', '1', '7', 'E38 ', 'M73 ', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1726', 'GK42', '750IL A RL S             ', 'GK41', 'GK41', '1', '1', '7', 'E38 ', 'M73 ', 'A', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1727', 'GK61', '750IL A L7               ', 'GK61', 'GK61', '1', '1', '7', 'E38 ', 'M73 ', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1728', 'GK62', '750IL A RL L7            ', 'GK61', 'GK61', '1', '1', '7', 'E38 ', 'M73 ', 'A', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1729', 'GK81', '750IL A L7               ', 'GK81', 'GK81', '1', '1', '7', 'E38 ', 'M73 ', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1730', 'GK82', '750IL A RL L7            ', 'GK81', 'GK81', '1', '1', '7', 'E38 ', 'M73 ', 'A', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1731', 'GK91', '750IL A                  ', 'GK91', 'GK91', '1', '1', '7', 'E38 ', 'M73 ', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1732', 'GK93', '750IL A US               ', 'GK93', 'GK93', '1', '1', '7', 'E38 ', 'M73 ', 'A', '4', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1733', 'GL21', '730I                     ', 'GL21', 'GL21', '1', '1', '7', 'E65 ', 'M54 ', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1734', 'GL22', '730I RL                  ', 'GL21', 'GL21', '1', '1', '7', 'E65 ', 'M54 ', 'A', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1735', 'GL41', '735I                     ', 'GL41', 'GL41', '1', '1', '7', 'E65 ', 'N62 ', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1736', 'GL42', '735I RL                  ', 'GL41', 'GL41', '1', '1', '7', 'E65 ', 'N62 ', 'A', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1737', 'GL61', '745I                     ', 'GL61', 'GL61', '1', '1', '7', 'E65 ', 'N62 ', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1738', 'GL62', '745I RL                  ', 'GL61', 'GL61', '1', '1', '7', 'E65 ', 'N62 ', 'A', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1739', 'GL63', '745I US                  ', 'GL63', 'GL63', '1', '1', '7', 'E65 ', 'N62 ', 'A', '4', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1740', 'GL81', '760I                     ', 'GL81', 'GL81', '1', '1', '7', 'E65 ', 'N73 ', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1741', 'GL82', '760I RL                  ', 'GL81', 'GL81', '1', '1', '7', 'E65 ', 'N73 ', 'A', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1742', 'GL83', '760I US                  ', 'GL83', 'GL83', '1', '1', '7', 'E65 ', 'N73 ', 'A', '4', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1743', 'GM21', '730D                     ', 'GM21', 'GM21', '1', '1', '7', 'E65 ', 'M57T', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1744', 'GM22', '730D RL                  ', 'GM21', 'GM21', '1', '1', '7', 'E65 ', 'M57T', 'A', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1745', 'GM41', '740D                     ', 'GM41', 'GM41', '1', '1', '7', 'E65 ', 'M67 ', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1746', 'GN21', '730LI                    ', 'GN21', 'GN21', '1', '1', '7', 'E66 ', 'M54 ', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1747', 'GN22', '730LI RL                 ', 'GN21', 'GN21', '1', '1', '7', 'E66 ', 'M54 ', 'A', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1748', 'GN25', '730LIRLA THACKD          ', 'GN21', 'GN21', '1', '1', 'T7', 'E66 ', 'M54 ', 'A', '4', 'R', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1749', 'GN41', '735LI                    ', 'GN41', 'GN41', '1', '1', '7', 'E66 ', 'N62 ', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1750', 'GN42', '735LI RL                 ', 'GN41', 'GN41', '1', '1', '7', 'E66 ', 'N62 ', 'A', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1751', 'GN45', '735LIRLA THACKD          ', 'GN41', 'GN41', '1', '1', 'T7', 'E66 ', 'N62 ', 'A', '4', 'R', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1752', 'GN61', '745LI                    ', 'GN61', 'GN61', '1', '1', '7', 'E66 ', 'N62 ', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1753', 'GN62', '745LI RL                 ', 'GN61', 'GN61', '1', '1', '7', 'E66 ', 'N62 ', 'A', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1754', 'GN63', '745LI US                 ', 'GN63', 'GN63', '1', '1', '7', 'E66 ', 'N62 ', 'A', '4', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1755', 'GN81', '760LI                    ', 'GN81', 'GN81', '1', '1', '7', 'E66 ', 'N73 ', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1756', 'GN82', '760LI RL                 ', 'GN81', 'GN81', '1', '1', '7', 'E66 ', 'N73 ', 'A', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1757', 'GN83', '760LI US                 ', 'GN83', 'GN83', '1', '1', '7', 'E66 ', 'N73 ', 'A', '4', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1758', 'GP61', '745LI S                  ', 'GP61', 'GP61', '1', '1', '7', 'E67 ', 'N62 ', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1759', 'GP62', '745LI RL S               ', 'GP61', 'GP61', '1', '1', '7', 'E67 ', 'N62 ', 'A', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1760', 'GP81', '760LI S                  ', 'GP81', 'GP81', '1', '1', '7', 'E67 ', 'N73 ', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1761', 'GP82', '760LI RL S               ', 'GP81', 'GP81', '1', '1', '7', 'E67 ', 'N73 ', 'A', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1762', 'GX21', '750LI                    ', 'GX21', 'GX21', '1', '1', '7', 'F03 ', 'N63 ', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1763', 'GX81', 'H7                       ', 'GX81', 'GX81', '1', '1', '7', 'E68 ', 'N73H', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1764', 'GY01', 'X5 M                     ', 'GY01', 'GY01', '1', '1', 'A5', 'E70 ', 'S63 ', 'A', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1765', 'GY02', 'X5 M RL                  ', 'GY01', 'GY01', '1', '1', 'A5', 'E70 ', 'S63 ', 'A', '5', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1766', 'GY03', 'X5 M US                  ', 'GY03', 'GY03', '1', '1', 'A5', 'E70 ', 'S63 ', 'A', '5', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1767', 'GY21', 'X5 XDRIVE 40I            ', 'GY21', 'GY21', '1', '1', 'G5', 'E70 ', 'N55 ', 'A', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1768', 'GZ01', 'X6 M                     ', 'GZ01', 'GZ01', '1', '1', 'A6', 'E71 ', 'S63 ', 'A', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1769', 'GZ02', 'X6 M RL                  ', 'GZ01', 'GZ01', '1', '1', 'A6', 'E71 ', 'S63 ', 'A', '5', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1770', 'GZ03', 'X6 M US                  ', 'GZ03', 'GZ03', '1', '1', 'A6', 'E71 ', 'S63 ', 'A', '5', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1771', 'GZ21', 'X6 XDRIVE40I             ', 'GZ21', 'GZ21', '1', '1', 'G6', 'E71 ', 'N55 ', 'A', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1772', 'HA01', '525TDS A                 ', 'HA01', 'HA01', '1', '1', '5', 'E34 ', 'M51S', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1773', 'HA02', '525TDS A RL              ', 'HA01', 'HA01', '1', '1', '5', 'E34 ', 'M51S', 'A', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1774', 'HA11', '518 I KAT                ', 'HA11', 'HA11', '1', '1', '5', 'E34 ', 'M40 ', 'S', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1775', 'HA12', '518 I RL KAT             ', 'HA11', 'HA11', '1', '1', '5', 'E34 ', 'M40 ', 'S', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1776', 'HA17', '518I RL IND CKD          ', 'HA11', 'HA11', '1', '1', 'C5', 'E34 ', 'M40 ', 'S', '4', 'R', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1777', 'HA21', '518I A KAT               ', 'HA21', 'HA21', '1', '1', '5', 'E34 ', 'M40 ', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1778', 'HA22', '518I A RL KAT            ', 'HA21', 'HA21', '1', '1', '5', 'E34 ', 'M40 ', 'A', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1779', 'HA31', '518I                     ', 'HA31', 'HA31', '1', '1', '5', 'E34 ', 'M43 ', 'S', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1780', 'HA32', '518I RL                  ', 'HA31', 'HA31', '1', '1', '5', 'E34 ', 'M43 ', 'S', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1781', 'HA41', '518I A                   ', 'HA41', 'HA41', '1', '1', '5', 'E34 ', 'M43 ', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1782', 'HA42', '518I A RL                ', 'HA41', 'HA41', '1', '1', '5', 'E34 ', 'M43 ', 'A', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1783', 'HA51', '524 TD                   ', 'HA51', 'HA51', '1', '1', '5', 'E34 ', 'M21T', 'S', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1784', 'HA59', '524 TD URU CKD           ', 'HA51', 'HA51', '1', '1', 'C5', 'E34 ', 'M21T', 'S', '4', 'L', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1785', 'HA61', '524 TD A                 ', 'HA61', 'HA61', '1', '1', '5', 'E34 ', 'M21T', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1786', 'HA71', '525TD                    ', 'HA71', 'HA71', '1', '1', '5', 'E34 ', 'M51T', 'S', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1787', 'HA72', '525TD RL                 ', 'HA71', 'HA71', '1', '1', '5', 'E34 ', 'M51T', 'S', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1788', 'HA81', '525TD A                  ', 'HA81', 'HA81', '1', '1', '5', 'E34 ', 'M51T', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1789', 'HA82', '525TD A RL               ', 'HA81', 'HA81', '1', '1', '5', 'E34 ', 'M51T', 'A', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1790', 'HA91', '525TDS                   ', 'HA91', 'HA91', '1', '1', '5', 'E34 ', 'M51S', 'S', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1791', 'HA92', '525TDS RL                ', 'HA91', 'HA91', '1', '1', '5', 'E34 ', 'M51S', 'S', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1792', 'HA99', '525 TD URU CKD           ', 'HA91', 'HA91', '1', '1', 'C5', 'E34 ', 'M51S', 'S', '4', 'L', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1793', 'HB11', '520 I KATALYSAT          ', 'HB11', 'HB11', '1', '1', '5', 'E34 ', 'M20 ', 'S', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1794', 'HB12', '520 I RL KAT             ', 'HB11', 'HB11', '1', '1', '5', 'E34 ', 'M20 ', 'S', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1795', 'HB14', '520I RL MAL CKD          ', 'HB11', 'HB11', '1', '1', 'L5', 'E34 ', 'M20 ', 'S', '4', 'R', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1796', 'HB15', '520I RL THA CKD          ', 'HB11', 'HB11', '1', '1', 'T5', 'E34 ', 'M20 ', 'S', '4', 'R', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1797', 'HB17', '520I RL IND CKD          ', 'HB11', 'HB11', '1', '1', 'C5', 'E34 ', 'M20 ', 'S', '4', 'R', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1798', 'HB21', '520 I A KATALYS          ', 'HB21', 'HB21', '1', '1', '5', 'E34 ', 'M20 ', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1799', 'HB22', '520 I A RHD KAT          ', 'HB21', 'HB21', '1', '1', '5', 'E34 ', 'M20 ', 'A', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1800', 'HB31', '520 I LHD                ', 'HB11', 'HB11', '1', '1', '5', 'E34 ', 'M20 ', 'S', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1801', 'HB32', '520 I RHD                ', 'HB11', 'HB11', '1', '1', '5', 'E34 ', 'M20 ', 'S', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1802', 'HB41', '520 I KAT                ', 'HB21', 'HB21', '1', '1', '5', 'E34 ', 'M20 ', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1803', 'HB51', '520I                     ', 'HB51', 'HB51', '1', '1', '5', 'E34 ', 'M50 ', 'S', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1804', 'HB52', '520I RL                  ', 'HB51', 'HB51', '1', '1', '5', 'E34 ', 'M50 ', 'S', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1805', 'HB54', '520I RL MAL CKD          ', 'HB51', 'HB51', '1', '1', 'L5', 'E34 ', 'M50 ', 'S', '4', 'R', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1806', 'HB55', '520I RL THA CKD          ', 'HB51', 'HB51', '1', '1', 'T5', 'E34 ', 'M50 ', 'S', '4', 'R', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1807', 'HB57', '520I RL IND CKD          ', 'HB51', 'HB51', '1', '1', 'C5', 'E34 ', 'M50 ', 'S', '4', 'R', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1808', 'HB58', '520 I RL ZA CKD          ', 'HB51', 'HB51', '1', '1', 'Z5', 'E34 ', 'M50 ', 'S', '4', 'R', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1809', 'HB61', '520I A                   ', 'HB61', 'HB61', '1', '1', '5', 'E34 ', 'M50 ', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1810', 'HB62', '520I A RL                ', 'HB61', 'HB61', '1', '1', '5', 'E34 ', 'M50 ', 'A', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1811', 'HB64', '520I A RLMALCKD          ', 'HB61', 'HB61', '1', '1', 'L5', 'E34 ', 'M50 ', 'A', '4', 'R', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1812', 'HB65', '520I A RLTHACKD          ', 'HB61', 'HB61', '1', '1', 'T5', 'E34 ', 'M50 ', 'A', '4', 'R', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1813', 'HB67', '520I A RLINDCKD          ', 'HB61', 'HB61', '1', '1', 'C5', 'E34 ', 'M50 ', 'A', '4', 'R', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1814', 'HB68', '520I ARL ZA CKD          ', 'HB61', 'HB61', '1', '1', 'Z5', 'E34 ', 'M50 ', 'A', '4', 'R', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1815', 'HC11', '525 I KATALYSAT          ', 'HC11', 'HC11', '1', '1', '5', 'E34 ', 'M20 ', 'S', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1816', 'HC12', '525 I RHD KATAL          ', 'HC11', 'HC11', '1', '1', '5', 'E34 ', 'M20 ', 'S', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1817', 'HC13', '525 I USA                ', 'HC13', 'HC13', '1', '1', '5', 'E34 ', 'M20 ', 'S', '4', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1818', 'HC18', '525I RL ZA CKD           ', 'HC11', 'HC11', '1', '1', 'Z5', 'E34 ', 'M20 ', 'S', '4', 'R', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1819', 'HC19', '525I URU CKD             ', 'HC11', 'HC11', '1', '1', 'C5', 'E34 ', 'M20 ', 'S', '4', 'L', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1820', 'HC21', '525 I A KAT              ', 'HC21', 'HC21', '1', '1', '5', 'E34 ', 'M20 ', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1821', 'HC22', '525 I A RHD KAT          ', 'HC21', 'HC21', '1', '1', '5', 'E34 ', 'M20 ', 'A', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1822', 'HC23', '525 I A USA              ', 'HC23', 'HC23', '1', '1', '5', 'E34 ', 'M20 ', 'A', '4', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1823', 'HC24', '525I ARL MALCKD          ', 'HC21', 'HC21', '1', '1', 'L5', 'E34 ', 'M20 ', 'A', '4', 'R', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1824', 'HC28', '525I ARL ZA CKD          ', 'HC21', 'HC21', '1', '1', 'Z5', 'E34 ', 'M20 ', 'A', '4', 'R', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1825', 'HC51', '530 I KATALYSAT          ', 'HC51', 'HC51', '1', '1', '5', 'E34 ', 'M30 ', 'S', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1826', 'HC52', '530 I RHD KATALYSATO     ', 'HC51', 'HC51', '1', '1', '5', 'E34 ', 'M30 ', 'S', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1827', 'HC61', '530 I A KATALYS          ', 'HC61', 'HC61', '1', '1', '5', 'E34 ', 'M30 ', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1828', 'HC62', '530 I A RHD KATALYSA     ', 'HC61', 'HC61', '1', '1', '5', 'E34 ', 'M30 ', 'A', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1829', 'HC91', 'M5                       ', 'HC91', 'HC91', '1', '1', '5', 'E34 ', 'S38 ', 'S', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1830', 'HC92', 'M5 RL                    ', 'HC91', 'HC91', '1', '1', '5', 'E34 ', 'S38 ', 'S', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1831', 'HD11', '535 I KAT                ', 'HD11', 'HD11', '1', '1', '5', 'E34 ', 'M30 ', 'S', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1832', 'HD12', '535 I RL KAT             ', 'HD11', 'HD11', '1', '1', '5', 'E34 ', 'M30 ', 'S', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1833', 'HD13', '535 I USA                ', 'HD13', 'HD13', '1', '1', '5', 'E34 ', 'M30 ', 'S', '4', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1834', 'HD18', '535 I RL ZA CKD          ', 'HD11', 'HD11', '1', '1', 'Z5', 'E34 ', 'M30 ', 'S', '4', 'R', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1835', 'HD21', '535 I A KAT              ', 'HD21', 'HD21', '1', '1', '5', 'E34 ', 'M30 ', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1836', 'HD22', '535 I A RL KAT           ', 'HD21', 'HD21', '1', '1', '5', 'E34 ', 'M30 ', 'A', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1837', 'HD23', '535 I A USA              ', 'HD23', 'HD23', '1', '1', '5', 'E34 ', 'M30 ', 'A', '4', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1838', 'HD28', '535I ARL ZA CKD          ', 'HD21', 'HD21', '1', '1', 'Z5', 'E34 ', 'M30 ', 'A', '4', 'R', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1839', 'HD51', '525I                     ', 'HD51', 'HD51', '1', '1', '5', 'E34 ', 'M50 ', 'S', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1840', 'HD52', '525I RL                  ', 'HD51', 'HD51', '1', '1', '5', 'E34 ', 'M50 ', 'S', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1841', 'HD53', '525I US                  ', 'HD53', 'HD53', '1', '1', '5', 'E34 ', 'M50 ', 'S', '4', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1842', 'HD56', '525I BRA CKD             ', 'HD51', 'HD51', '1', '1', 'B5', 'E34 ', 'M50 ', 'S', '4', 'L', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1843', 'HD58', '525I RL ZA CKD           ', 'HD51', 'HD51', '1', '1', 'Z5', 'E34 ', 'M50 ', 'S', '4', 'R', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1844', 'HD59', '525 I URU CKD            ', 'HD51', 'HD51', '1', '1', 'C5', 'E34 ', 'M50 ', 'S', '4', 'L', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1845', 'HD61', '525I A                   ', 'HD61', 'HD61', '1', '1', '5', 'E34 ', 'M50 ', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1846', 'HD62', '525I A RL                ', 'HD61', 'HD61', '1', '1', '5', 'E34 ', 'M50 ', 'A', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1847', 'HD63', '525I A US                ', 'HD63', 'HD63', '1', '1', '5', 'E34 ', 'M50 ', 'A', '4', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1848', 'HD64', '525I A RLMALCKD          ', 'HD61', 'HD61', '1', '1', 'L5', 'E34 ', 'M50 ', 'A', '4', 'R', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1849', 'HD65', '525I A RLTHACKD          ', 'HD61', 'HD61', '1', '1', 'T5', 'E34 ', 'M50 ', 'A', '4', 'R', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1850', 'HD67', '525I ARL INDCKD          ', 'HD61', 'HD61', '1', '1', 'C5', 'E34 ', 'M50 ', 'A', '4', 'R', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1851', 'HD68', '525I A RL ZACKD          ', 'HD61', 'HD61', '1', '1', 'Z5', 'E34 ', 'M50 ', 'A', '4', 'R', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1852', 'HD69', '525I VIE SKD             ', 'HD51', 'HD51', '1', '1', 'V5', 'E34 ', 'M50 ', 'S', '4', 'L', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1853', 'HD71', '525IX                    ', 'HD71', 'HD71', '1', '1', '5', 'E34 ', 'M50 ', 'S', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1854', 'HD72', '525IX RL                 ', 'HD71', 'HD71', '1', '1', '5', 'E34 ', 'M50 ', 'S', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1855', 'HD81', '525IX A                  ', 'HD81', 'HD81', '1', '1', '5', 'E34 ', 'M50 ', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1856', 'HD82', '525IX A RL               ', 'HD81', 'HD81', '1', '1', '5', 'E34 ', 'M50 ', 'A', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1857', 'HD91', 'M 5 KAT                  ', 'HD91', 'HD91', '1', '1', '5', 'E34 ', 'S38 ', 'S', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1858', 'HD92', 'M 5 RL KAT               ', 'HD91', 'HD91', '1', '1', '5', 'E34 ', 'S38 ', 'S', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1859', 'HD93', 'M 5 USA                  ', 'HD93', 'HD93', '1', '1', '5', 'E34 ', 'S38 ', 'S', '4', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1860', 'HD98', 'M 5 RL ZA CKD            ', 'HD91', 'HD91', '1', '1', 'C5', 'E34 ', 'S38 ', 'S', '4', 'R', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1861', 'HE11', '530I                     ', 'HE11', 'HE11', '1', '1', '5', 'E34 ', 'M60 ', 'S', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1862', 'HE12', '530I RL                  ', 'HE11', 'HE11', '1', '1', '5', 'E34 ', 'M60 ', 'S', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1863', 'HE13', '530I US                  ', 'HE13', 'HE13', '1', '1', '5', 'E34 ', 'M60 ', 'S', '4', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1864', 'HE17', '530I RL INDCKD           ', 'HE11', 'HE11', '1', '1', 'C5', 'E34 ', 'M60 ', 'S', '4', 'R', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1865', 'HE18', '530I RL ZA CKD           ', 'HE11', 'HE11', '1', '1', 'Z5', 'E34 ', 'M60 ', 'S', '4', 'R', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1866', 'HE21', '530I A                   ', 'HE21', 'HE21', '1', '1', '5', 'E34 ', 'M60 ', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1867', 'HE22', '530I A RL                ', 'HE21', 'HE21', '1', '1', '5', 'E34 ', 'M60 ', 'A', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1868', 'HE23', '530I A US                ', 'HE23', 'HE23', '1', '1', '5', 'E34 ', 'M60 ', 'A', '4', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1869', 'HE27', '530I A RLINDCKD          ', 'HE21', 'HE21', '1', '1', 'C5', 'E34 ', 'M60 ', 'A', '4', 'R', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1870', 'HE28', '530I A RL ZACKD          ', 'HE21', 'HE21', '1', '1', 'Z5', 'E34 ', 'M60 ', 'A', '4', 'R', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1871', 'HE51', '540I                     ', 'HE51', 'HE51', '1', '1', '5', 'E34 ', 'M60 ', 'S', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1872', 'HE52', '540I RL                  ', 'HE51', 'HE51', '1', '1', '5', 'E34 ', 'M60 ', 'S', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1873', 'HE53', '540I US                  ', 'HE53', 'HE53', '1', '1', '5', 'E34 ', 'M60 ', 'S', '4', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1874', 'HE58', '540I RL ZA CKD           ', 'HE51', 'HE51', '1', '1', 'Z5', 'E34 ', 'M60 ', 'S', '4', 'R', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1875', 'HE61', '540I A                   ', 'HE61', 'HE61', '1', '1', '5', 'E34 ', 'M60 ', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1876', 'HE62', '540I A RL                ', 'HE61', 'HE61', '1', '1', '5', 'E34 ', 'M60 ', 'A', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1877', 'HE63', '540I A US                ', 'HE63', 'HE63', '1', '1', '5', 'E34 ', 'M60 ', 'A', '4', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1878', 'HE68', '540I A RL ZACKD          ', 'HE61', 'HE61', '1', '1', 'Z5', 'E34 ', 'M60 ', 'A', '4', 'R', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1879', 'HE98', '540I RL ZA CKD           ', 'HE51', 'HE51', '1', '1', 'Z5', 'E34 ', 'M60 ', 'S', '4', 'R', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1880', 'HG01', '525TD A TOURING          ', 'HG01', 'HG01', '1', '1', '5', 'E34 ', 'M51T', 'A', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1881', 'HG11', '518I TOURING             ', 'HG11', 'HG11', '1', '1', '5', 'E34 ', 'M43 ', 'S', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1882', 'HG12', '518I RL TOURING          ', 'HG11', 'HG11', '1', '1', '5', 'E34 ', 'M43 ', 'S', '5', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1883', 'HG31', '518 I TOURING            ', 'HG31', 'HG31', '1', '1', '5', 'E34 ', 'M40 ', 'S', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1884', 'HG51', '520I TOURING             ', 'HG51', 'HG51', '1', '1', '5', 'E34 ', 'M50 ', 'S', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1885', 'HG52', '520I RL TOURING          ', 'HG51', 'HG51', '1', '1', '5', 'E34 ', 'M50 ', 'S', '5', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1886', 'HG61', '520I A TOURING           ', 'HG61', 'HG61', '1', '1', '5', 'E34 ', 'M50 ', 'A', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1887', 'HG62', '520I A RL TOUR           ', 'HG61', 'HG61', '1', '1', '5', 'E34 ', 'M50 ', 'A', '5', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1888', 'HG71', '525TDS TOURING           ', 'HG71', 'HG71', '1', '1', '5', 'E34 ', 'M51S', 'S', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1889', 'HG72', '525TDS RL TOUR           ', 'HG71', 'HG71', '1', '1', '5', 'E34 ', 'M51S', 'S', '5', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1890', 'HG81', '525TDS A TOUR            ', 'HG81', 'HG81', '1', '1', '5', 'E34 ', 'M51S', 'A', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1891', 'HG82', '525TDS A RLTOUR          ', 'HG81', 'HG81', '1', '1', '5', 'E34 ', 'M51S', 'A', '5', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1892', 'HG91', '525TD TOURING            ', 'HG91', 'HG91', '1', '1', '5', 'E34 ', 'M51T', 'S', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1893', 'HH11', '518G TOURING             ', 'HG11', 'HG11', '1', '1', '5', 'E34 ', 'M43 ', 'S', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1894', 'HJ51', '525I TOURING             ', 'HJ51', 'HJ51', '1', '1', '5', 'E34 ', 'M50 ', 'S', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1895', 'HJ52', '525I RL TOURING          ', 'HJ51', 'HJ51', '1', '1', '5', 'E34 ', 'M50 ', 'S', '5', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1896', 'HJ58', '525IRLTOURZACKD          ', 'HJ51', 'HJ51', '1', '1', 'Z5', 'E34 ', 'M50 ', 'S', '5', 'R', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1897', 'HJ61', '525I A TOURING           ', 'HJ61', 'HJ61', '1', '1', '5', 'E34 ', 'M50 ', 'A', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1898', 'HJ62', '525I A RL TOUR           ', 'HJ61', 'HJ61', '1', '1', '5', 'E34 ', 'M50 ', 'A', '5', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1899', 'HJ63', '525I A US TOUR           ', 'HJ63', 'HJ63', '1', '1', '5', 'E34 ', 'M50 ', 'A', '5', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1900', 'HJ68', '525IARLTOUZACKD          ', 'HJ61', 'HJ61', '1', '1', 'Z5', 'E34 ', 'M50 ', 'A', '5', 'R', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1901', 'HJ71', '525IX TOURING            ', 'HJ71', 'HJ71', '1', '1', '5', 'E34 ', 'M50 ', 'S', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1902', 'HJ72', '525IX RL TOUR            ', 'HJ71', 'HJ71', '1', '1', '5', 'E34 ', 'M50 ', 'S', '5', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1903', 'HJ81', '525IX A TOUR             ', 'HJ81', 'HJ81', '1', '1', '5', 'E34 ', 'M50 ', 'A', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1904', 'HJ82', '525IX A RL TOUR          ', 'HJ81', 'HJ81', '1', '1', '5', 'E34 ', 'M50 ', 'A', '5', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1905', 'HJ91', 'M5 TOURING               ', 'HJ91', 'HJ91', '1', '1', '5', 'E34 ', 'S38 ', 'S', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1906', 'HK11', '530I TOURING             ', 'HK11', 'HK11', '1', '1', '5', 'E34 ', 'M60 ', 'S', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1907', 'HK12', '530I RL TOURING          ', 'HK11', 'HK11', '1', '1', '5', 'E34 ', 'M60 ', 'S', '5', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1908', 'HK21', '530I A TOURING           ', 'HK21', 'HK21', '1', '1', '5', 'E34 ', 'M60 ', 'A', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1909', 'HK22', '530I A RL TOUR           ', 'HK21', 'HK21', '1', '1', '5', 'E34 ', 'M60 ', 'A', '5', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1910', 'HK23', '530I A US TOUR           ', 'HK23', 'HK23', '1', '1', '5', 'E34 ', 'M60 ', 'A', '5', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1911', 'HK31', '540I TOURING             ', 'HK31', 'HK31', '1', '1', '5', 'E34 ', 'M60 ', 'S', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1912', 'HK32', '540I RL TOURING          ', 'HK31', 'HK31', '1', '1', '5', 'E34 ', 'M60 ', 'S', '5', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1913', 'HK41', '540I A TOURING           ', 'HK41', 'HK41', '1', '1', '5', 'E34 ', 'M60 ', 'A', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1914', 'HK42', '540I A RL TOUR           ', 'HK41', 'HK41', '1', '1', '5', 'E34 ', 'M60 ', 'A', '5', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1915', 'HL01', '760I                     ', 'HL01', 'HL01', '1', '1', '7', 'E65 ', 'N73 ', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1916', 'HL02', '760I RL                  ', 'HL01', 'HL01', '1', '1', '7', 'E65 ', 'N73 ', 'A', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1917', 'HL03', '760I US                  ', 'HL03', 'HL03', '1', '1', '7', 'E65 ', 'N73 ', 'A', '4', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1918', 'HL21', '730I                     ', 'HL21', 'HL21', '1', '1', '7', 'E65 ', 'N52 ', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1919', 'HL22', '730I RL                  ', 'HL21', 'HL21', '1', '1', '7', 'E65 ', 'N52 ', 'A', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1920', 'HL43', '750I US ALPINA           ', 'HL43', 'HL43', '1', '1', '7', 'E65 ', 'N62T', 'A', '4', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1921', 'HL61', '740I                     ', 'HL61', 'HL61', '1', '1', '7', 'E65 ', 'N62T', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1922', 'HL62', '740I RL                  ', 'HL61', 'HL61', '1', '1', '7', 'E65 ', 'N62T', 'A', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1923', 'HL81', '750I                     ', 'HL81', 'HL81', '1', '1', '7', 'E65 ', 'N62T', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1924', 'HL82', '750I RL                  ', 'HL81', 'HL81', '1', '1', '7', 'E65 ', 'N62T', 'A', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1925', 'HL83', '750I US                  ', 'HL83', 'HL83', '1', '1', '7', 'E65 ', 'N62T', 'A', '4', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1926', 'HM21', '730D                     ', 'HM21', 'HM21', '1', '1', '7', 'E65 ', 'M57S', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1927', 'HM22', '730D RL                  ', 'HM21', 'HM21', '1', '1', '7', 'E65 ', 'M57S', 'A', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1928', 'HM41', '730LD                    ', 'HM41', 'HM41', '1', '1', '7', 'E66 ', 'M57S', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1929', 'HM42', '730LD RL                 ', 'HM41', 'HM41', '1', '1', '7', 'E66 ', 'M57S', 'A', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1930', 'HM61', '745D                     ', 'HM61', 'HM61', '1', '1', '7', 'E65 ', 'M67T', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1931', 'HN01', '760LI                    ', 'HN01', 'HN01', '1', '1', '7', 'E66 ', 'N73 ', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1932', 'HN02', '760LI RL                 ', 'HN01', 'HN01', '1', '1', '7', 'E66 ', 'N73 ', 'A', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1933', 'HN03', '760LI US                 ', 'HN03', 'HN03', '1', '1', '7', 'E66 ', 'N73 ', 'A', '4', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1934', 'HN21', '730LI                    ', 'HN21', 'HN21', '1', '1', '7', 'E66 ', 'N52 ', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1935', 'HN22', '730LI RL                 ', 'HN21', 'HN21', '1', '1', '7', 'E66 ', 'N52 ', 'A', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1936', 'HN25', '730LI RL THACKD          ', 'HN21', 'HN21', '1', '1', 'T7', 'E66 ', 'N52 ', 'A', '4', 'R', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1937', 'HN61', '740LI                    ', 'HN61', 'HN61', '1', '1', '7', 'E66 ', 'N62T', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1938', 'HN62', '740LI RL                 ', 'HN61', 'HN61', '1', '1', '7', 'E66 ', 'N62T', 'A', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1939', 'HN65', '740LI RL THACKD          ', 'HN61', 'HN61', '1', '1', 'T7', 'E66 ', 'N62T', 'A', '4', 'R', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1940', 'HN66', '740LI EGY SKD            ', 'HN61', 'HN61', '1', '1', 'Y7', 'E66 ', 'N62T', 'A', '4', 'L', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1941', 'HN81', '750LI                    ', 'HN81', 'HN81', '1', '1', '7', 'E66 ', 'N62T', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1942', 'HN82', '750LI RL                 ', 'HN81', 'HN81', '1', '1', '7', 'E66 ', 'N62T', 'A', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1943', 'HN83', '750LI US                 ', 'HN83', 'HN83', '1', '1', '7', 'E66 ', 'N62T', 'A', '4', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1944', 'HP41', '760LI SECURITY           ', 'HP41', 'HP41', '1', '1', '7', 'F03 ', 'N74 ', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1945', 'HP42', '760LI SECURITY           ', 'HP41', 'HP41', '1', '1', '7', 'F03 ', 'N74 ', 'A', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1946', 'HP61', '745LI S                  ', 'HP61', 'HP61', '1', '1', '7', 'E67 ', 'N62 ', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1947', 'HP62', '745LI RL S               ', 'HP61', 'HP61', '1', '1', '7', 'E67 ', 'N62 ', 'A', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1948', 'HP81', '760LI S                  ', 'HP81', 'HP81', '1', '1', '7', 'E67 ', 'N73 ', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1949', 'HP82', '760LI RL S               ', 'HP81', 'HP81', '1', '1', '7', 'E67 ', 'N73 ', 'A', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1950', 'HR01', '550I A                   ', 'HR01', 'HR01', '1', '1', '5', 'F11 ', 'N63T', 'A', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1951', 'HR02', '550I RL A                ', 'HR01', 'HR01', '1', '1', '5', 'F11 ', 'N63T', 'A', '5', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1952', 'KA01', '760I                     ', 'KA01', 'KA01', '1', '1', '7', 'F01 ', 'N74 ', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1953', 'KA21', '730I                     ', 'KA21', 'KA21', '1', '1', '7', 'F01 ', 'N52T', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1954', 'KA41', '740I                     ', 'KA41', 'KA41', '1', '1', '7', 'F01 ', 'N54 ', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1955', 'KA42', '740I RL                  ', 'KA41', 'KA41', '1', '1', '7', 'F01 ', 'N54 ', 'A', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1956', 'KA43', '740I US                  ', 'KA43', 'KA43', '1', '1', '7', 'F01 ', 'N54 ', 'A', '4', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1957', 'KA73', '750I US                  ', 'KA73', 'KA73', '1', '1', '7', 'F01 ', 'N63 ', 'A', '4', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1958', 'KA81', '750I                     ', 'KA81', 'KA81', '1', '1', '7', 'F01 ', 'N63 ', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1959', 'KA82', '750I RL                  ', 'KA81', 'KA81', '1', '1', '7', 'F01 ', 'N63 ', 'A', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1960', 'KA83', '750I US                  ', 'KA83', 'KA83', '1', '1', '7', 'F01 ', 'N63 ', 'A', '4', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1961', 'KB01', '760LI                    ', 'KB01', 'KB01', '1', '1', '7', 'F02 ', 'N74 ', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1962', 'KB02', '760LI RL                 ', 'KB01', 'KB01', '1', '1', '7', 'F02 ', 'N74 ', 'A', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1963', 'KB03', '760LI US                 ', 'KB03', 'KB03', '1', '1', '7', 'F02 ', 'N74 ', 'A', '4', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1964', 'KB21', '730LI                    ', 'KB21', 'KB21', '1', '1', '7', 'F02 ', 'N52T', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1965', 'KB22', '730LI RL                 ', 'KB21', 'KB21', '1', '1', '7', 'F02 ', 'N52T', 'A', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1966', 'KB25', '730LI RL THASKD          ', 'KB21', 'KB21', '1', '1', 'T7', 'F02 ', 'N52T', 'A', '4', 'R', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1967', 'KB41', '740LI                    ', 'KB41', 'KB41', '1', '1', '7', 'F02 ', 'N54 ', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1968', 'KB42', '740LI RL                 ', 'KB41', 'KB41', '1', '1', '7', 'F02 ', 'N54 ', 'A', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1969', 'KB43', '740LI US                 ', 'KB43', 'KB43', '1', '1', '7', 'F02 ', 'N54 ', 'A', '4', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1970', 'KB45', '740LI THA SKD            ', 'KB41', 'KB41', '1', '1', 'T7', 'F02 ', 'N54 ', 'A', '4', 'R', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1971', 'KB66', '740LI SKD EGY            ', 'KB41', 'KB41', '1', '1', 'Y7', 'F02 ', 'N54 ', 'A', '4', 'L', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1972', 'KB73', '750LI US                 ', 'KB73', 'KB73', '1', '1', '7', 'F02 ', 'N63 ', 'A', '4', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1973', 'KB81', '750LI                    ', 'KB81', 'KB81', '1', '1', '7', 'F02 ', 'N63 ', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1974', 'KB82', '750LI RL                 ', 'KB81', 'KB81', '1', '1', '7', 'F02 ', 'N63 ', 'A', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1975', 'KB83', '750LI US                 ', 'KB83', 'KB83', '1', '1', '7', 'F02 ', 'N63 ', 'A', '4', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1976', 'KB86', '750LI CKD EGY            ', 'KB81', 'KB81', '1', '1', 'Y7', 'F02 ', 'N63 ', 'A', '4', 'L', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1977', 'KC01', '740D XDRIVE              ', 'KC01', 'KC01', '1', '1', '7X', 'F01 ', 'N57S', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1978', 'KC53', '750I XDRIVE US           ', 'KC53', 'KC53', '1', '1', '7X', 'F01 ', 'N63 ', 'A', '4', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1979', 'KC61', '750I XDRIVE              ', 'KC61', 'KC61', '1', '1', '7X', 'F01 ', 'N63 ', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1980', 'KC63', '750I XDRIVE US           ', 'KC63', 'KC63', '1', '1', '7X', 'F01 ', 'N63 ', 'A', '4', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1981', 'KC73', '750LI XDRIVE US          ', 'KC73', 'KC73', '1', '1', '7X', 'F02 ', 'N63 ', 'A', '4', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1982', 'KC81', '750LI XDRIVE             ', 'KC81', 'KC81', '1', '1', '7X', 'F02 ', 'N63 ', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1983', 'KC83', '750LI XDRIVE US          ', 'KC83', 'KC83', '1', '1', '7X', 'F02 ', 'N63 ', 'A', '4', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1984', 'KD11', '316I CP                  ', 'KD11', 'KD11', '1', '1', '3', 'E92 ', 'N43 ', 'S', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1985', 'KD12', '316I CP RL               ', 'KD11', 'KD11', '1', '1', '3', 'E92 ', 'N43 ', 'S', '2', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1986', 'KD51', '320I CP                  ', 'KD51', 'KD51', '1', '1', '3', 'E92 ', 'N46T', 'S', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1987', 'KD52', '320I CP RL               ', 'KD51', 'KD51', '1', '1', '3', 'E92 ', 'N46T', 'S', '2', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1988', 'KD61', '320I CP A                ', 'KD61', 'KD61', '1', '1', '3', 'E92 ', 'N46T', 'A', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1989', 'KD62', '320I CP RL A             ', 'KD61', 'KD61', '1', '1', '3', 'E92 ', 'N46T', 'A', '2', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1990', 'KD71', '320I CP                  ', 'KD71', 'KD71', '1', '1', '3', 'E92 ', 'N43 ', 'S', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1991', 'KD72', '320I CP RL               ', 'KD71', 'KD71', '1', '1', '3', 'E92 ', 'N43 ', 'S', '2', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1992', 'KD81', '320I CP A                ', 'KD81', 'KD81', '1', '1', '3', 'E92 ', 'N43 ', 'A', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1993', 'KD82', '320I CP RL A             ', 'KD81', 'KD81', '1', '1', '3', 'E92 ', 'N43 ', 'A', '2', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1994', 'KD91', '318I CP                  ', 'KD91', 'KD91', '1', '1', '3', 'E92 ', 'N43 ', 'S', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1995', 'KD92', '318I RL                  ', 'KD91', 'KD91', '1', '1', '3', 'E92 ', 'N43 ', 'S', '2', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1996', 'KE22', '323I CP RL A             ', 'WB21', 'WB21', '1', '1', '3', 'E92 ', 'N52K', 'A', '2', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1997', 'KE31', '325I CP                  ', 'KE31', 'KE31', '1', '1', '3', 'E92 ', 'N52K', 'S', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1998', 'KE32', '325I CP RL               ', 'KE31', 'KE31', '1', '1', '3', 'E92 ', 'N52K', 'S', '2', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('1999', 'KE33', '328I US CP               ', 'KE33', 'KE33', '1', '1', '3', 'E92 ', 'N52K', 'S', '2', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2000', 'KE41', '325I CP A                ', 'KE41', 'KE41', '1', '1', '3', 'E92 ', 'N52K', 'A', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2001', 'KE42', '325I CP RL A             ', 'KE41', 'KE41', '1', '1', '3', 'E92 ', 'N52K', 'A', '2', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2002', 'KE43', '328I US CP A             ', 'KE43', 'KE43', '1', '1', '3', 'E92 ', 'N52K', 'A', '2', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2003', 'KE51', '325I CP                  ', 'KE51', 'KE51', '1', '1', '3', 'E92 ', 'N53 ', 'S', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2004', 'KE52', '325I CP RL               ', 'KE51', 'KE51', '1', '1', '3', 'E92 ', 'N53 ', 'S', '2', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2005', 'KE53', '328I US CP               ', 'KE53', 'KE53', '1', '1', '3', 'E92 ', 'N51 ', 'S', '2', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2006', 'KE61', '325I CP A                ', 'KE61', 'KE61', '1', '1', '3', 'E92 ', 'N53 ', 'A', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2007', 'KE62', '325I CP RL A             ', 'KE61', 'KE61', '1', '1', '3', 'E92 ', 'N53 ', 'A', '2', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2008', 'KE63', '328I US CP A             ', 'KE63', 'KE63', '1', '1', '3', 'E92 ', 'N51 ', 'A', '2', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2009', 'KF01', '335I XDRIVE A            ', 'KF01', 'KF01', '1', '1', '3A', 'E92 ', 'N55 ', 'A', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2010', 'KF03', '335I XDRIVE US A         ', 'KF03', 'KF03', '1', '1', '3A', 'E92 ', 'N55 ', 'A', '2', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2011', 'KF31', '325I XDRIVE              ', 'KF31', 'KF31', '1', '1', '3A', 'E92 ', 'N52K', 'S', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2012', 'KF33', '328I XDRIVE US           ', 'KF33', 'KF33', '1', '1', '3A', 'E92 ', 'N52K', 'S', '2', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2013', 'KF41', '325I XDRIVE A            ', 'KF41', 'KF41', '1', '1', '3A', 'E92 ', 'N52K', 'A', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2014', 'KF43', '328I XDRIVE US A         ', 'KF43', 'KF43', '1', '1', '3A', 'E92 ', 'N52K', 'A', '2', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2015', 'KF51', '325I XDRIVE              ', 'KF51', 'KF51', '1', '1', '3A', 'E92 ', 'N53 ', 'S', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2016', 'KF53', '328I XDRIVE US           ', 'KF53', 'KF53', '1', '1', '3A', 'E92 ', 'N51 ', 'S', '2', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2017', 'KF61', '325I XDRIVE A            ', 'KF61', 'KF61', '1', '1', '3A', 'E92 ', 'N53 ', 'A', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2018', 'KF63', '328I XDRIVE US A         ', 'KF63', 'KF63', '1', '1', '3A', 'E92 ', 'N51 ', 'A', '2', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2019', 'KF71', '330I XDRIVE              ', 'KF71', 'KF71', '1', '1', '3A', 'E92 ', 'N53 ', 'S', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2020', 'KF81', '330I XDRIVE A            ', 'KF81', 'KF81', '1', '1', '3A', 'E92 ', 'N53 ', 'A', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2021', 'KF91', '335I XDRIVE              ', 'KF91', 'KF91', '1', '1', '3A', 'E92 ', 'N55 ', 'S', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2022', 'KF93', '335I XDRIVE US           ', 'KF93', 'KF93', '1', '1', '3A', 'E92 ', 'N55 ', 'S', '2', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2023', 'KG13', '335IS  US CP             ', 'KG13', 'KG13', '1', '1', '3', 'E92 ', 'N54T', 'S', '2', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2024', 'KG31', '330I CP                  ', 'KG31', 'KG31', '1', '1', '3', 'E92 ', 'N52K', 'S', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2025', 'KG41', '330I CP A                ', 'KG41', 'KG41', '1', '1', '3', 'E92 ', 'N52K', 'A', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2026', 'KG42', '330I CP RL A             ', 'KG41', 'KG41', '1', '1', '3', 'E92 ', 'N52K', 'A', '2', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2027', 'KG51', '330I CP                  ', 'KG51', 'KG51', '1', '1', '3', 'E92 ', 'N53 ', 'S', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2028', 'KG52', '330I CP RL               ', 'KG51', 'KG51', '1', '1', '3', 'E92 ', 'N53 ', 'S', '2', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2029', 'KG61', '330I CP A                ', 'KG61', 'KG61', '1', '1', '3', 'E92 ', 'N53 ', 'A', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2030', 'KG62', '330I CP RL A             ', 'KG61', 'KG61', '1', '1', '3', 'E92 ', 'N53 ', 'A', '2', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2031', 'KG71', '335I CP                  ', 'KG71', 'KG71', '1', '1', '3', 'E92 ', 'N55 ', 'S', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2032', 'KG72', '335I CP RL               ', 'KG71', 'KG71', '1', '1', '3', 'E92 ', 'N55 ', 'S', '2', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2033', 'KG73', '335I US CP               ', 'KG73', 'KG73', '1', '1', '3', 'E92 ', 'N55 ', 'S', '2', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2034', 'KG81', '335I CP A                ', 'KG81', 'KG81', '1', '1', '3', 'E92 ', 'N55 ', 'A', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2035', 'KG82', '335I CP RL A             ', 'KG81', 'KG81', '1', '1', '3', 'E92 ', 'N55 ', 'A', '2', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2036', 'KG83', '335I US CP A             ', 'KG83', 'KG83', '1', '1', '3', 'E92 ', 'N55 ', 'A', '2', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2037', 'KG91', 'M3 COUPE                 ', 'KG91', 'KG91', '1', '1', 'M3', 'E92 ', 'S65 ', 'S', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2038', 'KG92', 'M3  COUPE RL             ', 'KG91', 'KG91', '1', '1', 'M3', 'E92 ', 'S65 ', 'S', '2', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2039', 'KG93', 'M3 COUPE US              ', 'KG93', 'KG93', '1', '1', 'M3', 'E92 ', 'S65 ', 'S', '2', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2040', 'KH31', '320D XDRIVE              ', 'KH31', 'KH31', '1', '1', '3A', 'E92 ', 'N47T', 'S', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2041', 'KH41', '320D XDRIVE A            ', 'KH41', 'KH41', '1', '1', '3A', 'E92 ', 'N47T', 'A', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2042', 'KH51', '330D XDRIVE              ', 'KH51', 'KH51', '1', '1', '3A', 'E92 ', 'N57 ', 'S', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2043', 'KH61', '330D XDRIVE A            ', 'KH61', 'KH61', '1', '1', '3A', 'E92 ', 'N57 ', 'A', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2044', 'KK01', '335D CP A                ', 'KK01', 'KK01', '1', '1', '3', 'E92 ', 'M57Y', 'A', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2045', 'KK02', '335D RL CP A             ', 'KK01', 'KK01', '1', '1', '3', 'E92 ', 'M57Y', 'A', '2', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2046', 'KK31', '320D CP                  ', 'KK31', 'KK31', '1', '1', '3', 'E92 ', 'N47T', 'S', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2047', 'KK32', '320D CP RL               ', 'KK31', 'KK31', '1', '1', '3', 'E92 ', 'N47T', 'S', '2', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2048', 'KK41', '320D CP A                ', 'KK41', 'KK41', '1', '1', '3', 'E92 ', 'N47T', 'A', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2049', 'KK42', '320D CP RL A             ', 'KK41', 'KK41', '1', '1', '3', 'E92 ', 'N47T', 'A', '2', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2050', 'KK51', '325D CP                  ', 'KK51', 'KK51', '1', '1', '3', 'E92 ', 'N57 ', 'S', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2051', 'KK52', '325D CP RL               ', 'KK51', 'KK51', '1', '1', '3', 'E92 ', 'N57 ', 'S', '2', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2052', 'KK61', '325D CP A                ', 'KK61', 'KK61', '1', '1', '3', 'E92 ', 'N57 ', 'A', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2053', 'KK62', '325D CP RL A             ', 'KK61', 'KK61', '1', '1', '3', 'E92 ', 'N57 ', 'A', '2', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2054', 'KK71', '330D CP                  ', 'KK71', 'KK71', '1', '1', '3', 'E92 ', 'N57 ', 'S', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2055', 'KK72', '330D CP RL               ', 'KK71', 'KK71', '1', '1', '3', 'E92 ', 'N57 ', 'S', '2', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2056', 'KK81', '330D CP A                ', 'KK81', 'KK81', '1', '1', '3', 'E92 ', 'N57 ', 'A', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2057', 'KK82', '330D CP RL A             ', 'KK81', 'KK81', '1', '1', '3', 'E92 ', 'N57 ', 'A', '2', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2058', 'KM21', '730D                     ', 'KM21', 'KM21', '1', '1', '7', 'F01 ', 'N57 ', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2059', 'KM22', '730D RL                  ', 'KM21', 'KM21', '1', '1', '7', 'F01 ', 'N57 ', 'A', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2060', 'KM41', '730LD                    ', 'KM41', 'KM41', '1', '1', '7', 'F02 ', 'N57 ', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2061', 'KM42', '730LD RL                 ', 'KM41', 'KM41', '1', '1', '7', 'F02 ', 'N57 ', 'A', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2062', 'KM45', '730LD RL THASKD          ', 'KM41', 'KM41', '1', '1', 'T7', 'F02 ', 'N57 ', 'A', '4', 'R', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2063', 'KM47', '730LD RL                 ', 'KM41', 'KM41', '1', '1', 'C7', 'F02 ', 'N57 ', 'A', '4', 'R', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2064', 'KM81', '740D                     ', 'KM81', 'KM81', '1', '1', '7', 'F01 ', 'N57S', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2065', 'KM82', '740D RL                  ', 'KM81', 'KM81', '1', '1', '7', 'F01 ', 'N57S', 'A', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2066', 'KN01', '550I A                   ', 'KN01', 'KN01', '1', '1', '5', 'F10 ', 'N63T', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2067', 'KN02', '550I RL A                ', 'KN01', 'KN01', '1', '1', '5', 'F10 ', 'N63T', 'A', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2068', 'KN03', '550I US A                ', 'KN03', 'KN03', '1', '1', '5', 'F10 ', 'N63T', 'A', '4', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2069', 'KP01', '550I XDRIVE A            ', 'KP01', 'KP01', '1', '1', '5X', 'F10 ', 'N63T', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2070', 'KP03', '550I XDRIVE US A         ', 'KP03', 'KP03', '1', '1', '5X', 'F10 ', 'N63T', 'A', '4', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2071', 'KR01', 'X5 XDRIVE35I             ', 'KR01', 'KR01', '1', '1', 'G5', 'F15 ', 'N55 ', 'A', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2072', 'KR02', 'X5 XDRIVE35I             ', 'KR01', 'KR01', '1', '1', 'G5', 'F15 ', 'N55 ', 'A', '5', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2073', 'KR03', 'X5 XDRIVE35I             ', 'KR03', 'KR03', '1', '1', 'G5', 'F15 ', 'N55 ', 'A', '5', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2074', 'KR23', 'X5 SDRIVE35I             ', 'KR23', 'KR23', '1', '1', 'G5', 'F15 ', 'N55 ', 'A', '5', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2075', 'KR61', 'X5 XDRIVE50I             ', 'KR61', 'KR61', '1', '1', 'G5', 'F15 ', 'N63T', 'A', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2076', 'KR62', 'X5 XDRIVE50I             ', 'KR61', 'KR61', '1', '1', 'G5', 'F15 ', 'N63T', 'A', '5', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2077', 'KR63', 'X5 XDRIVE50I             ', 'KR63', 'KR63', '1', '1', 'G5', 'F15 ', 'N63T', 'A', '5', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2078', 'KR81', 'X5 XDRIVE50I             ', 'KR81', 'KR81', '1', '1', 'G5', 'F15 ', 'N63T', 'A', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2079', 'KS01', 'X5 SDRIVE25D             ', 'KS01', 'KS01', '1', '1', 'G5', 'F15 ', 'N47T', 'A', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2080', 'KS02', 'X5 SDRIVE25D             ', 'KS01', 'KS01', '1', '1', 'G5', 'F15 ', 'N47T', 'A', '5', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2081', 'KS21', 'X5 XDRIVE25D             ', 'KS21', 'KS21', '1', '1', 'G5', 'F15 ', 'N47T', 'A', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2082', 'KS22', 'X5 XDRIVE25D             ', 'KS21', 'KS21', '1', '1', 'G5', 'F15 ', 'N47T', 'A', '5', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2083', 'KS41', 'X5 XDRIVE30D             ', 'KS41', 'KS41', '1', '1', 'G5', 'F15 ', 'N57T', 'A', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2084', 'KS42', 'X5 XDRIVE30D             ', 'KS41', 'KS41', '1', '1', 'G5', 'F15 ', 'N57T', 'A', '5', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2085', 'KS43', 'X5 XDRIVE35D             ', 'KS43', 'KS43', '1', '1', 'G5', 'F15 ', 'N57T', 'A', '5', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2086', 'KS61', 'X5 XDRIVE40D             ', 'KS61', 'KS61', '1', '1', 'G5', 'F15 ', 'N57Z', 'A', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2087', 'KS81', 'X5 M50D                  ', 'KS81', 'KS81', '1', '1', 'G5', 'F15 ', 'N57X', 'A', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2088', 'KS82', 'X5 M50D                  ', 'KS81', 'KS81', '1', '1', 'G5', 'F15 ', 'N57X', 'A', '5', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2089', 'KX61', 'ACTIVEHYBRID 7 SWB       ', 'KX61', 'KX61', '1', '1', '7H', 'F04 ', 'N63 ', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2090', 'KX63', 'ACTIVEHYBRID 7 SWB       ', 'KX63', 'KX63', '1', '1', '7H', 'F04 ', 'N63 ', 'A', '4', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2091', 'KX81', 'ACTIVEHYBRID 7 LWB       ', 'KX81', 'KX81', '1', '1', '7H', 'F04 ', 'N63 ', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2092', 'KX83', 'ACTIVEHYBRID 7 LWB       ', 'KX83', 'KX83', '1', '1', '7H', 'F04 ', 'N63 ', 'A', '4', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2093', 'LK21', '750LI SECURITY           ', 'LK21', 'LK21', '1', '1', '7', 'F03 ', 'N63 ', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2094', 'LK22', '750LI SECURITY           ', 'LK21', 'LK21', '1', '1', '7', 'F03 ', 'N63 ', 'A', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2095', 'LK41', '760LI SECURITY           ', 'LK41', 'LK41', '1', '1', '7', 'F03 ', 'N74 ', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2096', 'LK42', '760LI SECURITY           ', 'LK41', 'LK41', '1', '1', '7', 'F03 ', 'N74 ', 'A', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2097', 'LL11', 'Z4 SDRIVE18I             ', 'LL11', 'LL11', '1', '1', 'Z4', 'E89 ', 'N20 ', 'S', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2098', 'LL12', 'Z4 SDRIVE18I             ', 'LL11', 'LL11', '1', '1', 'Z4', 'E89 ', 'N20 ', 'S', '2', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2099', 'LL21', 'Z4 SDRIVE18I A           ', 'LL21', 'LL21', '1', '1', 'Z4', 'E89 ', 'N20 ', 'A', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2100', 'LL22', 'Z4 SDRIVE18I A           ', 'LL21', 'LL21', '1', '1', 'Z4', 'E89 ', 'N20 ', 'A', '2', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2101', 'LL31', 'Z4 SDRIVE20I             ', 'LL31', 'LL31', '1', '1', 'Z4', 'E89 ', 'N20 ', 'S', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2102', 'LL32', 'Z4 SDRIVE20I RL          ', 'LL31', 'LL31', '1', '1', 'Z4', 'E89 ', 'N20 ', 'S', '2', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2103', 'LL41', 'Z4 SDRIVE20I A           ', 'LL41', 'LL41', '1', '1', 'Z4', 'E89 ', 'N20 ', 'A', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2104', 'LL42', 'Z4 SDRIVE20I RL A        ', 'LL41', 'LL41', '1', '1', 'Z4', 'E89 ', 'N20 ', 'A', '2', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2105', 'LL51', 'Z4 SDRIVE28I             ', 'LL51', 'LL51', '1', '1', 'Z4', 'E89 ', 'N20 ', 'S', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2106', 'LL52', 'Z4 SDRIVE28I RL          ', 'LL51', 'LL51', '1', '1', 'Z4', 'E89 ', 'N20 ', 'S', '2', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2107', 'LL53', 'Z4 SDRIVE28I US          ', 'LL53', 'LL53', '1', '1', 'Z4', 'E89 ', 'N20 ', 'S', '2', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2108', 'LL61', 'Z4 SDRIVE28I A           ', 'LL61', 'LL61', '1', '1', 'Z4', 'E89 ', 'N20 ', 'A', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2109', 'LL62', 'Z4 SDRIVE28I RL A        ', 'LL61', 'LL61', '1', '1', 'Z4', 'E89 ', 'N20 ', 'A', '2', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2110', 'LL63', 'Z4 SDRIVE28I US A        ', 'LL63', 'LL63', '1', '1', 'Z4', 'E89 ', 'N20 ', 'A', '2', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2111', 'LM11', 'Z4 SDRIVE35IS            ', 'LM11', 'LM11', '1', '1', 'Z4', 'E89 ', 'N54T', 'S', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2112', 'LM12', 'Z4 SDRIVE35IS  RL        ', 'LM11', 'LM11', '1', '1', 'Z4', 'E89 ', 'N54T', 'S', '2', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2113', 'LM13', 'Z4 SDRIVE35IS US         ', 'LM13', 'LM13', '1', '1', 'Z4', 'E89 ', 'N54T', 'S', '2', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2114', 'LM31', 'Z4 SDRIVE 23I            ', 'LM31', 'LM31', '1', '1', 'Z4', 'E89 ', 'N52K', 'S', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2115', 'LM32', 'Z4 SDRIVE 23I  RL        ', 'LM31', 'LM31', '1', '1', 'Z4', 'E89 ', 'N52K', 'S', '2', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2116', 'LM41', 'Z4 SDRIVE 23I A          ', 'LM41', 'LM41', '1', '1', 'Z4', 'E89 ', 'N52K', 'A', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2117', 'LM42', 'Z4 SDRIVE 23I  RL A      ', 'LM41', 'LM41', '1', '1', 'Z4', 'E89 ', 'N52K', 'A', '2', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2118', 'LM51', 'Z4 SDRIVE 30I            ', 'LM51', 'LM51', '1', '1', 'Z4', 'E89 ', 'N52K', 'S', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2119', 'LM52', 'Z4 SDRIVE 30I RL         ', 'LM51', 'LM51', '1', '1', 'Z4', 'E89 ', 'N52K', 'S', '2', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2120', 'LM53', 'Z4 SDRIVE 30I US         ', 'LM53', 'LM53', '1', '1', 'Z4', 'E89 ', 'N52K', 'S', '2', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2121', 'LM61', 'Z4 SDRIVE 30I A          ', 'LM61', 'LM61', '1', '1', 'Z4', 'E89 ', 'N52K', 'A', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2122', 'LM62', 'Z4 SDRIVE 30I RL A       ', 'LM61', 'LM61', '1', '1', 'Z4', 'E89 ', 'N52K', 'A', '2', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2123', 'LM63', 'Z4 SDRIVE 30I US A       ', 'LM63', 'LM63', '1', '1', 'Z4', 'E89 ', 'N52K', 'A', '2', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2124', 'LM71', 'Z4 SDRIVE 35I            ', 'LM71', 'LM71', '1', '1', 'Z4', 'E89 ', 'N54 ', 'S', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2125', 'LM72', 'Z4 SDRIVE35I RL          ', 'LM71', 'LM71', '1', '1', 'Z4', 'E89 ', 'N54 ', 'S', '2', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2126', 'LM73', 'Z4 SDRIVE 35I US         ', 'LM73', 'LM73', '1', '1', 'Z4', 'E89 ', 'N54 ', 'S', '2', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2127', 'LW01', '650I XDRIVE A            ', 'LW01', 'LW01', '1', '1', '6X', 'F12 ', 'N63T', 'A', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2128', 'LW41', '640I A                   ', 'LW41', 'LW41', '1', '1', '6', 'F13 ', 'N55 ', 'A', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2129', 'LW42', '640I RL A                ', 'LW41', 'LW41', '1', '1', '6', 'F13 ', 'N55 ', 'A', '2', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2130', 'LW43', '640I US A                ', 'LW43', 'LW43', '1', '1', '6', 'F13 ', 'N55 ', 'A', '2', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2131', 'LW81', '640I A                   ', 'LW81', 'LW81', '1', '1', '6', 'F12 ', 'N55 ', 'A', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2132', 'LW82', '640I RL A                ', 'LW81', 'LW81', '1', '1', '6', 'F12 ', 'N55 ', 'A', '2', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2133', 'LW83', '640I US A                ', 'LW83', 'LW83', '1', '1', '6', 'F12 ', 'N55 ', 'A', '2', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2134', 'LX33', '650I US                  ', 'LX33', 'LX33', '1', '1', '6', 'F13 ', 'N63 ', 'S', '2', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2135', 'LX41', '650I A                   ', 'LX41', 'LX41', '1', '1', '6', 'F13 ', 'N63 ', 'A', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2136', 'LX42', '650I RL A                ', 'LX41', 'LX41', '1', '1', '6', 'F13 ', 'N63 ', 'A', '2', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2137', 'LX43', '650I US A                ', 'LX43', 'LX43', '1', '1', '6', 'F13 ', 'N63 ', 'A', '2', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2138', 'LX61', '650I XDRIVE A            ', 'LX61', 'LX61', '1', '1', '6X', 'F13 ', 'N63 ', 'A', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2139', 'LX63', '650I XDRIVE US A         ', 'LX63', 'LX63', '1', '1', '6X', 'F13 ', 'N63 ', 'A', '2', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2140', 'LX81', '640D A                   ', 'LX81', 'LX81', '1', '1', '6', 'F13 ', 'N57Z', 'A', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2141', 'LX82', '640D RL A                ', 'LX81', 'LX81', '1', '1', '6', 'F13 ', 'N57Z', 'A', '2', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2142', 'LX91', 'M6 COUPE                 ', 'LX91', 'LX91', '1', '1', 'M6', 'F13 ', 'S63T', 'S', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2143', 'LX92', 'M6 COUPE RL              ', 'LX91', 'LX91', '1', '1', 'M6', 'F13 ', 'S63T', 'S', '2', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2144', 'LX93', 'M6 COUPE US              ', 'LX93', 'LX93', '1', '1', 'M6', 'F13 ', 'S63T', 'S', '2', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2145', 'LY21', '640I XDRIVE A            ', 'LY21', 'LY21', '1', '1', '6X', 'F13 ', 'N55 ', 'A', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2146', 'LY23', '640I XDRIVE A            ', 'LY23', 'LY23', '1', '1', '6X', 'F13 ', 'N55 ', 'A', '2', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2147', 'LZ33', '650I US                  ', 'LZ33', 'LZ33', '1', '1', '6', 'F12 ', 'N63 ', 'S', '2', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2148', 'LZ41', '650I A                   ', 'LZ41', 'LZ41', '1', '1', '6', 'F12 ', 'N63 ', 'A', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2149', 'LZ42', '650I RL A                ', 'LZ41', 'LZ41', '1', '1', '6', 'F12 ', 'N63 ', 'A', '2', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2150', 'LZ43', '650I US A                ', 'LZ43', 'LZ43', '1', '1', '6', 'F12 ', 'N63 ', 'A', '2', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2151', 'LZ61', '650I XDRIVE A            ', 'LZ61', 'LZ61', '1', '1', '6X', 'F12 ', 'N63 ', 'A', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2152', 'LZ63', '650I XDRIVE US A         ', 'LZ63', 'LZ63', '1', '1', '6X', 'F12 ', 'N63 ', 'A', '2', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2153', 'LZ81', '640D A                   ', 'LZ81', 'LZ81', '1', '1', '6', 'F12 ', 'N57Z', 'A', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2154', 'LZ82', '640D RL A                ', 'LZ81', 'LZ81', '1', '1', '6', 'F12 ', 'N57Z', 'A', '2', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2155', 'LZ91', 'M6                       ', 'LZ91', 'LZ91', '1', '1', 'M6', 'F12 ', 'S63T', 'S', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2156', 'LZ92', 'M6 RL                    ', 'LZ91', 'LZ91', '1', '1', 'M6', 'F12 ', 'S63T', 'S', '2', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2157', 'LZ93', 'M6 US                    ', 'LZ93', 'LZ93', '1', '1', 'M6', 'F12 ', 'S63T', 'S', '2', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2158', 'MT11', '523I                     ', 'MT11', 'MT11', '1', '1', '5', 'F11 ', 'N53 ', 'S', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2159', 'MT12', '523I RL                  ', 'MT11', 'MT11', '1', '1', '5', 'F11 ', 'N53 ', 'S', '5', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2160', 'MT21', '523I A                   ', 'MT21', 'MT21', '1', '1', '5', 'F11 ', 'N53 ', 'A', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2161', 'MT22', '523I RL A                ', 'MT21', 'MT21', '1', '1', '5', 'F11 ', 'N53 ', 'A', '5', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2162', 'MT61', '523I A                   ', 'MT61', 'MT61', '1', '1', '5', 'F11 ', 'N52T', 'A', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2163', 'MT62', '523I RL A                ', 'MT61', 'MT61', '1', '1', '5', 'F11 ', 'N52T', 'A', '5', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2164', 'MU01', '550I A                   ', 'MU01', 'MU01', '1', '1', '5', 'F11 ', 'N63 ', 'A', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2165', 'MU02', '550I RL A                ', 'MU01', 'MU01', '1', '1', '5', 'F11 ', 'N63 ', 'A', '5', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2166', 'MU41', '530I A                   ', 'MU41', 'MU41', '1', '1', '5', 'F11 ', 'N52T', 'A', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2167', 'MU42', '530I RL A                ', 'MU41', 'MU41', '1', '1', '5', 'F11 ', 'N52T', 'A', '5', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2168', 'MU71', '535I                     ', 'MU71', 'MU71', '1', '1', '5', 'F11 ', 'N55 ', 'S', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2169', 'MU72', '535I RL                  ', 'MU71', 'MU71', '1', '1', '5', 'F11 ', 'N55 ', 'S', '5', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2170', 'MU81', '535I A                   ', 'MU81', 'MU81', '1', '1', '5', 'F11 ', 'N55 ', 'A', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2171', 'MU82', '535I RL A                ', 'MU81', 'MU81', '1', '1', '5', 'F11 ', 'N55 ', 'A', '5', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2172', 'MW01', '530D XDRIVE A            ', 'MW01', 'MW01', '1', '1', '5X', 'F11 ', 'N57T', 'A', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2173', 'MW61', '535I XDRIVE A            ', 'MW61', 'MW61', '1', '1', '5X', 'F11 ', 'N55 ', 'A', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2174', 'MX11', '520D                     ', 'MX11', 'MX11', '1', '1', '5', 'F11 ', 'N47T', 'S', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2175', 'MX12', '520D RL                  ', 'MX11', 'MX11', '1', '1', '5', 'F11 ', 'N47T', 'S', '5', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2176', 'MX21', '520D A                   ', 'MX21', 'MX21', '1', '1', '5', 'F11 ', 'N47T', 'A', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2177', 'MX22', '520D RL A                ', 'MX21', 'MX21', '1', '1', '5', 'F11 ', 'N47T', 'A', '5', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2178', 'MX31', '525D                     ', 'MX31', 'MX31', '1', '1', '5', 'F11 ', 'N57 ', 'S', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2179', 'MX32', '525D RL                  ', 'MX31', 'MX31', '1', '1', '5', 'F11 ', 'N57 ', 'S', '5', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2180', 'MX41', '525D A                   ', 'MX41', 'MX41', '1', '1', '5', 'F11 ', 'N57 ', 'A', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2181', 'MX42', '525D RL A                ', 'MX41', 'MX41', '1', '1', '5', 'F11 ', 'N57 ', 'A', '5', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2182', 'MX51', '530D                     ', 'MX51', 'MX51', '1', '1', '5', 'F11 ', 'N57 ', 'S', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2183', 'MX52', '530D RL                  ', 'MX51', 'MX51', '1', '1', '5', 'F11 ', 'N57 ', 'S', '5', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2184', 'MX61', '530D A                   ', 'MX61', 'MX61', '1', '1', '5', 'F11 ', 'N57 ', 'A', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2185', 'MX62', '530D RL A                ', 'MX61', 'MX61', '1', '1', '5', 'F11 ', 'N57 ', 'A', '5', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2186', 'MX81', '535D A                   ', 'MX81', 'MX81', '1', '1', '5', 'F11 ', 'N57S', 'A', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2187', 'MX82', '535D RL A                ', 'MX81', 'MX81', '1', '1', '5', 'F11 ', 'N57S', 'A', '5', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2188', 'MY01', 'M550D XDRIVE A           ', 'MY01', 'MY01', '1', '1', '5X', 'F11 ', 'N57X', 'A', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2189', 'MY51', '528I                     ', 'MY51', 'MY51', '1', '1', '5', 'F11 ', 'N53 ', 'S', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2190', 'MY52', '528I RL                  ', 'MY51', 'MY51', '1', '1', '5', 'F11 ', 'N53 ', 'S', '5', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2191', 'MY61', '528I A                   ', 'MY61', 'MY61', '1', '1', '5', 'F11 ', 'N53 ', 'A', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2192', 'MY62', '528I RL A                ', 'MY61', 'MY61', '1', '1', '5', 'F11 ', 'N53 ', 'A', '5', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2193', 'MZ71', '530I                     ', 'MZ71', 'MZ71', '1', '1', '5', 'F11 ', 'N53 ', 'S', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2194', 'MZ81', '530I A                   ', 'MZ81', 'MZ81', '1', '1', '5', 'F11 ', 'N53 ', 'A', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2195', 'MZ82', '530I RL A                ', 'MZ81', 'MZ81', '1', '1', '5', 'F11 ', 'N53 ', 'A', '5', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2196', 'NA08', '525I A CHN CKD A         ', 'NA61', 'NA61', '1', '1', '5C', 'E60 ', 'M54 ', 'A', '4', 'L', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2197', 'NA09', '520I THA CKD A           ', 'NA41', 'NA41', '1', '1', 'T5', 'E60 ', 'M54 ', 'A', '4', 'R', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2198', 'NA31', '520I                     ', 'NA31', 'NA31', '1', '1', '5', 'E60 ', 'M54 ', 'S', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2199', 'NA32', '520I RL                  ', 'NA31', 'NA31', '1', '1', '5', 'E60 ', 'M54 ', 'S', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2200', 'NA34', '520I ARL MALCKD          ', 'NA31', 'NA31', '1', '1', 'L5', 'E60 ', 'M54 ', 'S', '4', 'R', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2201', 'NA38', '525I RL THA CKD          ', 'NA51', 'NA51', '1', '1', 'T5', 'E60 ', 'M54 ', 'S', '4', 'R', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2202', 'NA39', '520I A CHN CKD           ', 'NA31', 'NA31', '1', '1', '5C', 'E60 ', 'M54 ', 'S', '4', 'L', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2203', 'NA41', '520I A                   ', 'NA41', 'NA41', '1', '1', '5', 'E60 ', 'M54 ', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2204', 'NA42', '520I RL A                ', 'NA41', 'NA41', '1', '1', '5', 'E60 ', 'M54 ', 'A', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2205', 'NA44', '520I ARL MALCKD A        ', 'NA41', 'NA41', '1', '1', 'L5', 'E60 ', 'M54 ', 'A', '4', 'R', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2206', 'NA46', '520I EGY CKD A           ', 'NA41', 'NA41', '1', '1', 'Y5', 'E60 ', 'M54 ', 'A', '4', 'L', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2207', 'NA47', '520I RL IND CKD A        ', 'NA41', 'NA41', '1', '1', 'C5', 'E60 ', 'M54 ', 'A', '4', 'R', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2208', 'NA48', '525I RL THA CKD A        ', 'NA61', 'NA61', '1', '1', 'T5', 'E60 ', 'M54 ', 'A', '4', 'R', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2209', 'NA49', '520I A CHN CKD A         ', 'NA41', 'NA41', '1', '1', '5C', 'E60 ', 'M54 ', 'A', '4', 'L', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2210', 'NA51', '525I                     ', 'NA51', 'NA51', '1', '1', '5', 'E60 ', 'M54 ', 'S', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2211', 'NA52', '525I RL                  ', 'NA51', 'NA51', '1', '1', '5', 'E60 ', 'M54 ', 'S', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2212', 'NA53', '525I US                  ', 'NA53', 'NA53', '1', '1', '5', 'E60 ', 'M54 ', 'S', '4', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2213', 'NA54', '525I RL MAL CKD          ', 'NA51', 'NA51', '1', '1', 'L5', 'E60 ', 'M54 ', 'S', '4', 'R', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2214', 'NA58', '525I RUS SKD             ', 'NA51', 'NA51', '1', '1', 'R5', 'E60 ', 'M54 ', 'S', '4', 'L', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2215', 'NA61', '525I A                   ', 'NA61', 'NA61', '1', '1', '5', 'E60 ', 'M54 ', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2216', 'NA62', '525I RL A                ', 'NA61', 'NA61', '1', '1', '5', 'E60 ', 'M54 ', 'A', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2217', 'NA63', '525I US A                ', 'NA63', 'NA63', '1', '1', '5', 'E60 ', 'M54 ', 'A', '4', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2218', 'NA64', '525I RL MAL CKD A        ', 'NA61', 'NA61', '1', '1', 'L5', 'E60 ', 'M54 ', 'A', '4', 'R', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2219', 'NA66', '525I EGY CKD A           ', 'NA61', 'NA61', '1', '1', 'Y5', 'E60 ', 'M54 ', 'A', '4', 'L', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2220', 'NA68', '525I RUS SKD A           ', 'NA61', 'NA61', '1', '1', 'R5', 'E60 ', 'M54 ', 'A', '4', 'L', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2221', 'NA71', '530I                     ', 'NA71', 'NA71', '1', '1', '5', 'E60 ', 'M54 ', 'S', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2222', 'NA72', '530I RL                  ', 'NA71', 'NA71', '1', '1', '5', 'E60 ', 'M54 ', 'S', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2223', 'NA73', '530I US                  ', 'NA73', 'NA73', '1', '1', '5', 'E60 ', 'M54 ', 'S', '4', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2224', 'NA74', '530I RL MAL CKD          ', 'NA71', 'NA71', '1', '1', 'L5', 'E60 ', 'M54 ', 'S', '4', 'R', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2225', 'NA78', '530I RUS SKD             ', 'NA71', 'NA71', '1', '1', 'R5', 'E60 ', 'M54 ', 'S', '4', 'L', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2226', 'NA79', '530I A CHN CKD           ', 'NA71', 'NA71', '1', '1', '5C', 'E60 ', 'M54 ', 'S', '4', 'L', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2227', 'NA81', '530I A                   ', 'NA81', 'NA81', '1', '1', '5', 'E60 ', 'M54 ', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2228', 'NA82', '530I RL A                ', 'NA81', 'NA81', '1', '1', '5', 'E60 ', 'M54 ', 'A', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2229', 'NA83', '530I US A                ', 'NA83', 'NA83', '1', '1', '5', 'E60 ', 'M54 ', 'A', '4', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2230', 'NA84', '530I RL MAL CKD A        ', 'NA81', 'NA81', '1', '1', 'L5', 'E60 ', 'M54 ', 'A', '4', 'R', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2231', 'NA86', '530I EGY CKD A           ', 'NA81', 'NA81', '1', '1', 'Y5', 'E60 ', 'M54 ', 'A', '4', 'L', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2232', 'NA87', '530I RL IND CKD A        ', 'NA81', 'NA81', '1', '1', 'C5', 'E60 ', 'M54 ', 'A', '4', 'R', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2233', 'NA88', '530I RUS SKD A           ', 'NA81', 'NA81', '1', '1', 'R5', 'E60 ', 'M54 ', 'A', '4', 'L', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2234', 'NA89', '530I A CHN CKD A         ', 'NA81', 'NA81', '1', '1', '5C', 'E60 ', 'M54 ', 'A', '4', 'L', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2235', 'NA98', '525I A CHN CKD           ', 'NA51', 'NA51', '1', '1', '5C', 'E60 ', 'M54 ', 'S', '4', 'L', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2236', 'NA99', '520I THA CKD             ', 'NA71', 'NA71', '1', '1', 'T5', 'E60 ', 'M54 ', 'S', '4', 'R', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2237', 'NB11', '540I                     ', 'NB11', 'NB11', '1', '1', '5', 'E60 ', 'N62T', 'S', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2238', 'NB12', '540I RL                  ', 'NB11', 'NB11', '1', '1', '5', 'E60 ', 'N62T', 'S', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2239', 'NB21', '540I A                   ', 'NB21', 'NB21', '1', '1', '5', 'E60 ', 'N62T', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2240', 'NB22', '540I RL A                ', 'NB21', 'NB21', '1', '1', '5', 'E60 ', 'N62T', 'A', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2241', 'NB31', '545I                     ', 'NB31', 'NB31', '1', '1', '5', 'E60 ', 'N62 ', 'S', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2242', 'NB32', '545I RL                  ', 'NB31', 'NB31', '1', '1', '5', 'E60 ', 'N62 ', 'S', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2243', 'NB33', '545I US                  ', 'NB33', 'NB33', '1', '1', '5', 'E60 ', 'N62 ', 'S', '4', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2244', 'NB41', '545I A                   ', 'NB41', 'NB41', '1', '1', '5', 'E60 ', 'N62 ', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2245', 'NB42', '545I RL A                ', 'NB41', 'NB41', '1', '1', '5', 'E60 ', 'N62 ', 'A', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2246', 'NB43', '545I US A                ', 'NB43', 'NB43', '1', '1', '5', 'E60 ', 'N62 ', 'A', '4', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2247', 'NB51', '550I                     ', 'NB51', 'NB51', '1', '1', '5', 'E60 ', 'N62T', 'S', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2248', 'NB52', '550I RL                  ', 'NB51', 'NB51', '1', '1', '5', 'E60 ', 'N62T', 'S', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2249', 'NB53', '550I US                  ', 'NB53', 'NB53', '1', '1', '5', 'E60 ', 'N62T', 'S', '4', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2250', 'NB61', '550I A                   ', 'NB61', 'NB61', '1', '1', '5', 'E60 ', 'N62T', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2251', 'NB62', '550I RL A                ', 'NB61', 'NB61', '1', '1', '5', 'E60 ', 'N62T', 'A', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2252', 'NB63', '550I US A                ', 'NB63', 'NB63', '1', '1', '5', 'E60 ', 'N62T', 'A', '4', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2253', 'NB91', 'M5                       ', 'NB91', 'NB91', '1', '1', 'M5', 'E60 ', 'S85 ', 'S', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2254', 'NB92', 'M5 RL                    ', 'NB91', 'NB91', '1', '1', 'M5', 'E60 ', 'S85 ', 'S', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2255', 'NB93', 'M5 US                    ', 'NB93', 'NB93', '1', '1', 'M5', 'E60 ', 'S85 ', 'S', '4', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2256', 'NC01', '535D A                   ', 'NC01', 'NC01', '1', '1', '5', 'E60 ', 'M57X', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2257', 'NC02', '535D RL A                ', 'NC01', 'NC01', '1', '1', '5', 'E60 ', 'M57X', 'A', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2258', 'NC31', '520D                     ', 'NC31', 'NC31', '1', '1', '5', 'E60 ', 'M47S', 'S', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2259', 'NC32', '520D RL                  ', 'NC31', 'NC31', '1', '1', '5', 'E60 ', 'M47S', 'S', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2260', 'NC41', '520D A                   ', 'NC41', 'NC41', '1', '1', '5', 'E60 ', 'M47S', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2261', 'NC42', '520D RL A                ', 'NC41', 'NC41', '1', '1', '5', 'E60 ', 'M47S', 'A', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2262', 'NC47', '520D RL THA CKD A        ', 'NC41', 'NC41', '1', '1', 'T5', 'E60 ', 'M47S', 'A', '4', 'R', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2263', 'NC51', '525D                     ', 'NC51', 'NC51', '1', '1', '5', 'E60 ', 'M57T', 'S', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2264', 'NC52', '525D RL                  ', 'NC51', 'NC51', '1', '1', '5', 'E60 ', 'M57T', 'S', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2265', 'NC61', '525D A                   ', 'NC61', 'NC61', '1', '1', '5', 'E60 ', 'M57T', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2266', 'NC62', '525D RL A                ', 'NC61', 'NC61', '1', '1', '5', 'E60 ', 'M57T', 'A', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2267', 'NC71', '530D                     ', 'NC71', 'NC71', '1', '1', '5', 'E60 ', 'M57T', 'S', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2268', 'NC72', '530D RL                  ', 'NC71', 'NC71', '1', '1', '5', 'E60 ', 'M57T', 'S', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2269', 'NC81', '530D A                   ', 'NC81', 'NC81', '1', '1', '5', 'E60 ', 'M57T', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2270', 'NC82', '530D RL A                ', 'NC81', 'NC81', '1', '1', '5', 'E60 ', 'M57T', 'A', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2271', 'ND71', '530I                     ', 'ND71', 'ND71', '1', '1', '5', 'E60 ', 'N53 ', 'S', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2272', 'ND72', '530I RL                  ', 'ND71', 'ND71', '1', '1', '5', 'E60 ', 'N53 ', 'S', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2273', 'ND79', '530LI A CKD CHN          ', 'NZ61', 'NZ61', '1', '1', '5C', 'E60 ', 'N52K', 'S', '4', 'L', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2274', 'ND81', '530I A                   ', 'ND81', 'ND81', '1', '1', '5', 'E60 ', 'N53 ', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2275', 'ND82', '530I RL A                ', 'ND81', 'ND81', '1', '1', '5', 'E60 ', 'N53 ', 'A', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2276', 'ND85', '530I RL IND CKD A        ', 'NU01', 'NU01', '1', '1', 'I5', 'E60 ', 'N52K', 'A', '4', 'R', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2277', 'ND89', '530LI A CKD CHN A        ', 'NZ61', 'NZ61', '1', '1', '5C', 'E60 ', 'N52K', 'A', '4', 'L', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2278', 'NE08', '525I A CHN CKD A         ', 'NE61', 'NE61', '1', '1', '5C', 'E60 ', 'N52 ', 'A', '4', 'L', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2279', 'NE31', '523I                     ', 'NE31', 'NE31', '1', '1', '5', 'E60 ', 'N52 ', 'S', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2280', 'NE32', '523I RL                  ', 'NE31', 'NE31', '1', '1', '5', 'E60 ', 'N52 ', 'S', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2281', 'NE34', '523I RL MYS CKD          ', 'NE31', 'NE31', '1', '1', 'L5', 'E60 ', 'N52 ', 'S', '4', 'R', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2282', 'NE41', '523I A                   ', 'NE41', 'NE41', '1', '1', '5', 'E60 ', 'N52 ', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2283', 'NE42', '523I RL A                ', 'NE41', 'NE41', '1', '1', '5', 'E60 ', 'N52 ', 'A', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2284', 'NE44', '523I RL MYS CKD A        ', 'NE41', 'NE41', '1', '1', 'L5', 'E60 ', 'N52 ', 'A', '4', 'R', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2285', 'NE46', '523I EGY CKD A           ', 'NE41', 'NE41', '1', '1', 'Y5', 'E60 ', 'N52 ', 'A', '4', 'L', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2286', 'NE47', '523I RL IND CKD A        ', 'NE41', 'NE41', '1', '1', 'C5', 'E60 ', 'N52 ', 'A', '4', 'R', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2287', 'NE48', '523I THA CKD A           ', 'NE41', 'NE41', '1', '1', 'T5', 'E60 ', 'N52 ', 'A', '4', 'R', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2288', 'NE49', '523I A CHN CKD A         ', 'NE41', 'NE41', '1', '1', '5C', 'E60 ', 'N52 ', 'A', '4', 'L', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2289', 'NE51', '525I                     ', 'NE51', 'NE51', '1', '1', '5', 'E60 ', 'N52 ', 'S', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2290', 'NE52', '525I RL                  ', 'NE51', 'NE51', '1', '1', '5', 'E60 ', 'N52 ', 'S', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2291', 'NE53', '525I US                  ', 'NE53', 'NE53', '1', '1', '5', 'E60 ', 'N52 ', 'S', '4', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2292', 'NE54', '525I RL MYS CKD          ', 'NE51', 'NE51', '1', '1', 'L5', 'E60 ', 'N52 ', 'S', '4', 'R', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2293', 'NE56', '525I EGY CKD             ', 'NE51', 'NE51', '1', '1', 'Y5', 'E60 ', 'N52 ', 'S', '4', 'L', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2294', 'NE59', '525I RUS SKD             ', 'NE51', 'NE51', '1', '1', 'R5', 'E60 ', 'N52 ', 'S', '4', 'L', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2295', 'NE61', '525I A                   ', 'NE61', 'NE61', '1', '1', '5', 'E60 ', 'N52 ', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2296', 'NE62', '525I RL A                ', 'NE61', 'NE61', '1', '1', '5', 'E60 ', 'N52 ', 'A', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2297', 'NE63', '525I US A                ', 'NE63', 'NE63', '1', '1', '5', 'E60 ', 'N52 ', 'A', '4', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2298', 'NE64', '525I RL MYS CKD A        ', 'NE61', 'NE61', '1', '1', 'L5', 'E60 ', 'N52 ', 'A', '4', 'R', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2299', 'NE66', '525I EGY CKD A           ', 'NE61', 'NE61', '1', '1', 'Y5', 'E60 ', 'N52 ', 'A', '4', 'L', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2300', 'NE68', '525I RL THA CKD A        ', 'NE61', 'NE61', '1', '1', 'T5', 'E60 ', 'N52 ', 'A', '4', 'R', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2301', 'NE69', '525I RUS SKD A           ', 'NE61', 'NE61', '1', '1', 'R5', 'E60 ', 'N52 ', 'A', '4', 'L', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2302', 'NE71', '530I                     ', 'NE71', 'NE71', '1', '1', '5', 'E60 ', 'N52 ', 'S', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2303', 'NE72', '530I RL                  ', 'NE71', 'NE71', '1', '1', '5', 'E60 ', 'N52 ', 'S', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2304', 'NE73', '530I US                  ', 'NE73', 'NE73', '1', '1', '5', 'E60 ', 'N52 ', 'S', '4', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2305', 'NE74', '530I RL MYS CKD          ', 'NE71', 'NE71', '1', '1', 'L5', 'E60 ', 'N52 ', 'S', '4', 'R', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2306', 'NE76', '530I EGY CKD             ', 'NE71', 'NE71', '1', '1', 'Y5', 'E60 ', 'N52 ', 'S', '4', 'L', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2307', 'NE78', '530I RUS SKD             ', 'NE71', 'NE71', '1', '1', 'R5', 'E60 ', 'N52 ', 'S', '4', 'L', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2308', 'NE79', '530I A CHN CKD           ', 'NE71', 'NE71', '1', '1', '5C', 'E60 ', 'N52 ', 'S', '4', 'L', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2309', 'NE81', '530I A                   ', 'NE81', 'NE81', '1', '1', '5', 'E60 ', 'N52 ', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2310', 'NE82', '530I RL A                ', 'NE81', 'NE81', '1', '1', '5', 'E60 ', 'N52 ', 'A', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2311', 'NE83', '530I US A                ', 'NE83', 'NE83', '1', '1', '5', 'E60 ', 'N52 ', 'A', '4', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2312', 'NE84', '530I RL MYS CKD A        ', 'NE81', 'NE81', '1', '1', 'L5', 'E60 ', 'N52 ', 'A', '4', 'R', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2313', 'NE86', '530I EGY CKD A           ', 'NE81', 'NE81', '1', '1', 'Y5', 'E60 ', 'N52 ', 'A', '4', 'L', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2314', 'NE87', '530I RL IND CKD A        ', 'NE81', 'NE81', '1', '1', 'C5', 'E60 ', 'N52 ', 'A', '4', 'R', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2315', 'NE88', '530I RUS SKD A           ', 'NE81', 'NE81', '1', '1', 'R5', 'E60 ', 'N52 ', 'A', '4', 'L', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2316', 'NE89', '530I A CHN CKD A         ', 'NE81', 'NE81', '1', '1', '5C', 'E60 ', 'N52 ', 'A', '4', 'L', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2317', 'NE98', '525I A CHN CKD           ', 'NE81', 'NE81', '1', '1', '5C', 'E60 ', 'N52 ', 'S', '4', 'L', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2318', 'NF31', '525XI                    ', 'NF31', 'NF31', '1', '1', '5X', 'E60 ', 'N52 ', 'S', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2319', 'NF33', '525XI US                 ', 'NF33', 'NF33', '1', '1', '5X', 'E60 ', 'N52 ', 'S', '4', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2320', 'NF41', '525XI A                  ', 'NF41', 'NF41', '1', '1', '5X', 'E60 ', 'N52 ', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2321', 'NF43', '525XI US A               ', 'NF43', 'NF43', '1', '1', '5X', 'E60 ', 'N52 ', 'A', '4', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2322', 'NF71', '530XI                    ', 'NF71', 'NF71', '1', '1', '5X', 'E60 ', 'N52 ', 'S', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2323', 'NF73', '530XI US                 ', 'NF73', 'NF73', '1', '1', '5X', 'E60 ', 'N52 ', 'S', '4', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2324', 'NF78', '530XI RUS SKD            ', 'NF71', 'NF71', '1', '1', 'R5', 'E60 ', 'N52 ', 'S', '4', 'L', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2325', 'NF81', '530XI A                  ', 'NF81', 'NF81', '1', '1', '5X', 'E60 ', 'N52 ', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2326', 'NF83', '530XI US A               ', 'NF83', 'NF83', '1', '1', '5X', 'E60 ', 'N52 ', 'A', '4', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2327', 'NF88', '530XI RUS SKD A          ', 'NF81', 'NF81', '1', '1', 'R5', 'E60 ', 'N52 ', 'A', '4', 'L', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2328', 'NG51', '525I TO                  ', 'NG51', 'NG51', '1', '1', '5', 'E61 ', 'M54 ', 'S', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2329', 'NG52', '525I RL TO               ', 'NG51', 'NG51', '1', '1', '5', 'E61 ', 'M54 ', 'S', '5', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2330', 'NG61', '525I TO A                ', 'NG61', 'NG61', '1', '1', '5', 'E61 ', 'M54 ', 'A', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2331', 'NG62', '525I RL TO A             ', 'NG61', 'NG61', '1', '1', '5', 'E61 ', 'M54 ', 'A', '5', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2332', 'NG63', '525I US TO A             ', '    ', '    ', '1', '1', '5', 'E61 ', 'M54 ', 'A', '5', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2333', 'NH31', '545I TO                  ', 'NH31', 'NH31', '1', '1', '5', 'E61 ', 'N62 ', 'S', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2334', 'NH32', '545I RL TO               ', 'NH31', 'NH31', '1', '1', '5', 'E61 ', 'N62 ', 'S', '5', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2335', 'NH41', '545I TO A                ', 'NH41', 'NH41', '1', '1', '5', 'E61 ', 'N62 ', 'A', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2336', 'NH42', '545I RL TO A             ', 'NH41', 'NH41', '1', '1', '5', 'E61 ', 'N62 ', 'A', '5', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2337', 'NH43', '545I US TO A             ', '    ', '    ', '1', '1', '5', 'E61 ', 'N62 ', 'A', '5', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2338', 'NH51', '550I TO                  ', 'NH51', 'NH51', '1', '1', '5', 'E61 ', 'N62T', 'S', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2339', 'NH52', '550I RL TO               ', 'NH51', 'NH51', '1', '1', '5', 'E61 ', 'N62T', 'S', '5', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2340', 'NH61', '550I TO A                ', 'NH61', 'NH61', '1', '1', '5', 'E61 ', 'N62T', 'A', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2341', 'NH62', '550I RL TO A             ', 'NH61', 'NH61', '1', '1', '5', 'E61 ', 'N62T', 'A', '5', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2342', 'NJ01', '535D TO A                ', 'NJ01', 'NJ01', '1', '1', '5', 'E61 ', 'M57X', 'A', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2343', 'NJ02', '535D RL TO A             ', 'NJ01', 'NJ01', '1', '1', '5', 'E61 ', 'M57X', 'A', '5', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2344', 'NJ31', '520D TO                  ', 'NJ31', 'NJ31', '1', '1', '5', 'E61 ', 'M47S', 'S', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2345', 'NJ32', '520D RL TO               ', 'NJ31', 'NJ31', '1', '1', '5', 'E61 ', 'M47S', 'S', '5', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2346', 'NJ41', '520D TO A                ', 'NJ41', 'NJ41', '1', '1', '5', 'E61 ', 'M47S', 'A', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2347', 'NJ42', '520D RL TO A             ', 'NJ41', 'NJ41', '1', '1', '5', 'E61 ', 'M47S', 'A', '5', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2348', 'NJ51', '525D TO                  ', 'NJ51', 'NJ51', '1', '1', '5', 'E61 ', 'M57T', 'S', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2349', 'NJ52', '525D RL TO               ', 'NJ51', 'NJ51', '1', '1', '5', 'E61 ', 'M57T', 'S', '5', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2350', 'NJ61', '525D TO A                ', 'NJ61', 'NJ61', '1', '1', '5', 'E61 ', 'M57T', 'A', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2351', 'NJ62', '525D RL TO A             ', 'NJ61', 'NJ61', '1', '1', '5', 'E61 ', 'M57T', 'A', '5', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2352', 'NJ71', '530D TO                  ', 'NJ71', 'NJ71', '1', '1', '5', 'E61 ', 'M57T', 'S', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2353', 'NJ72', '530D RL TO               ', 'NJ71', 'NJ71', '1', '1', '5', 'E61 ', 'M57T', 'S', '5', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2354', 'NJ81', '530D TO A                ', 'NJ81', 'NJ81', '1', '1', '5', 'E61 ', 'M57T', 'A', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2355', 'NJ82', '530D RL TO A             ', 'NJ81', 'NJ81', '1', '1', '5', 'E61 ', 'M57T', 'A', '5', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2356', 'NK71', '530I TO                  ', 'NK71', 'NK71', '1', '1', '5', 'E61 ', 'N53 ', 'S', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2357', 'NK72', '530I RL TO               ', 'NK71', 'NK71', '1', '1', '5', 'E61 ', 'N53 ', 'S', '5', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2358', 'NK81', '530I TO A                ', 'NK81', 'NK81', '1', '1', '5', 'E61 ', 'N53 ', 'A', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2359', 'NK82', '530I RL TO A             ', 'NK81', 'NK81', '1', '1', '5', 'E61 ', 'N53 ', 'A', '5', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2360', 'NL31', '523I TO                  ', 'NL31', 'NL31', '1', '1', '5', 'E61 ', 'N52 ', 'S', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2361', 'NL32', '523I RL TO               ', 'NL31', 'NL31', '1', '1', '5', 'E61 ', 'N52 ', 'S', '5', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2362', 'NL41', '523I TO A                ', 'NL41', 'NL41', '1', '1', '5', 'E61 ', 'N52 ', 'A', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2363', 'NL42', '523I RL TO A             ', 'NL41', 'NL41', '1', '1', '5', 'E61 ', 'N52 ', 'A', '5', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2364', 'NL51', '525I TO                  ', 'NL51', 'NL51', '1', '1', '5', 'E61 ', 'N52 ', 'S', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2365', 'NL52', '525I RL TO               ', 'NL51', 'NL51', '1', '1', '5', 'E61 ', 'N52 ', 'S', '5', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2366', 'NL61', '525I TO A                ', 'NL61', 'NL61', '1', '1', '5', 'E61 ', 'N52 ', 'A', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2367', 'NL62', '525I RL TO A             ', 'NL61', 'NL61', '1', '1', '5', 'E61 ', 'N52 ', 'A', '5', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2368', 'NL71', '530I TO                  ', 'NL71', 'NL71', '1', '1', '5', 'E61 ', 'N52 ', 'S', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2369', 'NL72', '530I RL TO               ', 'NL71', 'NL71', '1', '1', '5', 'E61 ', 'N52 ', 'S', '5', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2370', 'NL81', '530I TO A                ', 'NL81', 'NL81', '1', '1', '5', 'E61 ', 'N52 ', 'A', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2371', 'NL82', '530I RL TO A             ', 'NL81', 'NL81', '1', '1', '5', 'E61 ', 'N52 ', 'A', '5', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2372', 'NM71', '530XD                    ', 'NM71', 'NM71', '1', '1', '5X', 'E60 ', 'M57S', 'S', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2373', 'NM81', '530XD A                  ', 'NM81', 'NM81', '1', '1', '5X', 'E60 ', 'M57S', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2374', 'NN51', '525XI TO                 ', 'NN51', 'NN51', '1', '1', '5X', 'E61 ', 'N52 ', 'S', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2375', 'NN61', '525XI TO A               ', 'NN61', 'NN61', '1', '1', '5X', 'E61 ', 'N52 ', 'A', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2376', 'NN71', '530XI TO                 ', 'NN71', 'NN71', '1', '1', '5X', 'E61 ', 'N52 ', 'S', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2377', 'NN73', '530XI US TO              ', 'NN73', 'NN73', '1', '1', '5X', 'E61 ', 'N52 ', 'S', '5', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2378', 'NN81', '530XI TO A               ', 'NN81', 'NN81', '1', '1', '5X', 'E61 ', 'N52 ', 'A', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2379', 'NN83', '530XI US TO A            ', 'NN83', 'NN83', '1', '1', '5X', 'E61 ', 'N52 ', 'A', '5', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2380', 'NP71', '530XD TO                 ', 'NP71', 'NP71', '1', '1', '5X', 'E61 ', 'M57S', 'S', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2381', 'NP81', '530XD TO A               ', 'NP81', 'NP81', '1', '1', '5X', 'E61 ', 'M57S', 'A', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2382', 'NR21', '523LI A                  ', 'NR21', 'NR21', '1', '1', '5', 'E60 ', 'N52 ', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2383', 'NR41', '525LI A                  ', 'NR41', 'NR41', '1', '1', '5', 'E60 ', 'N52 ', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2384', 'NR61', '530LI A                  ', 'NR61', 'NR61', '1', '1', '5', 'E60 ', 'N52 ', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2385', 'NR71', '530D                     ', 'NR71', 'NR71', '1', '1', '5', 'E60 ', 'M57S', 'S', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2386', 'NR72', '530D RL                  ', 'NR71', 'NR71', '1', '1', '5', 'E60 ', 'M57S', 'S', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2387', 'NR81', '530D A                   ', 'NR81', 'NR81', '1', '1', '5', 'E60 ', 'M57S', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2388', 'NR82', '530D RL A                ', 'NR81', 'NR81', '1', '1', '5', 'E60 ', 'M57S', 'A', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2389', 'NS71', '530D TO                  ', 'NS71', 'NS71', '1', '1', '5', 'E61 ', 'M57S', 'S', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2390', 'NS72', '530D RL TO               ', 'NS71', 'NS71', '1', '1', '5', 'E61 ', 'M57S', 'S', '5', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2391', 'NS81', '530D TO A                ', 'NS81', 'NS81', '1', '1', '5', 'E61 ', 'M57S', 'A', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2392', 'NS82', '530D RL TO A             ', 'NS81', 'NS81', '1', '1', '5', 'E61 ', 'M57S', 'A', '5', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2393', 'NT11', '520I                     ', 'NT11', 'NT11', '1', '1', '5', 'E60 ', 'N46T', 'S', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2394', 'NT12', '520I RL                  ', 'NT11', 'NT11', '1', '1', '5', 'E60 ', 'N46T', 'S', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2395', 'NT15', '520I A SKD RUS           ', 'NT11', 'NT11', '1', '1', 'R5', 'E60 ', 'N46T', 'S', '4', 'L', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2396', 'NT17', '520LI A CKD CHN          ', 'NT11', 'NT11', '1', '1', '5C', 'E60 ', 'N46T', 'S', '4', 'L', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2397', 'NT21', '520I A                   ', 'NT21', 'NT21', '1', '1', '5', 'E60 ', 'N46T', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2398', 'NT22', '520I RL A                ', 'NT21', 'NT21', '1', '1', '5', 'E60 ', 'N46T', 'A', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2399', 'NT25', '520I A SKD RUS A         ', 'NT21', 'NT21', '1', '1', 'R5', 'E60 ', 'N46T', 'A', '4', 'L', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2400', 'NT27', '520LI A CKD CHN A        ', 'NT21', 'NT21', '1', '1', '5C', 'E60 ', 'N46T', 'A', '4', 'L', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2401', 'NT31', '520I                     ', 'NT31', 'NT31', '1', '1', '5', 'E60 ', 'N43 ', 'S', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2402', 'NT32', '520I RL                  ', 'NT31', 'NT31', '1', '1', '5', 'E60 ', 'N43 ', 'S', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2403', 'NT41', '520I A                   ', 'NT41', 'NT41', '1', '1', '5', 'E60 ', 'N43 ', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2404', 'NT42', '520I RL A                ', 'NT41', 'NT41', '1', '1', '5', 'E60 ', 'N43 ', 'A', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2405', 'NU01', '530I A                   ', 'NU01', 'NU01', '1', '1', '5', 'E60 ', 'N52K', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2406', 'NU02', '530I RL A                ', 'NU01', 'NU01', '1', '1', '5', 'E60 ', 'N52K', 'A', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2407', 'NU04', '530I RL MYS SKD A        ', 'NU01', 'NU01', '1', '1', 'L5', 'E60 ', 'N52K', 'A', '4', 'R', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2408', 'NU05', '530I RUS SKD A           ', 'NU01', 'NU01', '1', '1', 'R5', 'E60 ', 'N52K', 'A', '4', 'L', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2409', 'NU06', '530I EGY CKD A           ', 'NU01', 'NU01', '1', '1', 'Y5', 'E60 ', 'N52K', 'A', '4', 'L', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2410', 'NU07', '530I RL IDN CKD A        ', 'NU01', 'NU01', '1', '1', 'C5', 'E60 ', 'N52K', 'A', '4', 'R', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2411', 'NU08', '530LI A CHN CKD A        ', 'NR61', 'NR61', '1', '1', '5C', 'E60 ', 'N52 ', 'A', '4', 'L', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2412', 'NU11', '523I                     ', 'NU11', 'NU11', '1', '1', '5', 'E60 ', 'N52K', 'S', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2413', 'NU12', '523I RL                  ', 'NU11', 'NU11', '1', '1', '5', 'E60 ', 'N52K', 'S', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2414', 'NU14', '523I RL MYS SKD          ', 'NU11', 'NU11', '1', '1', 'L5', 'E60 ', 'N52K', 'S', '4', 'R', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2415', 'NU15', '523LI A CHN CKD          ', 'NR21', 'NR21', '1', '1', '5C', 'E60 ', 'N52 ', 'S', '4', 'L', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2416', 'NU16', '523I EGY CKD             ', 'NU11', 'NU11', '1', '1', 'Y5', 'E60 ', 'N52K', 'S', '4', 'L', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2417', 'NU21', '523I A                   ', 'NU21', 'NU21', '1', '1', '5', 'E60 ', 'N52K', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2418', 'NU22', '523I RL A                ', 'NU21', 'NU21', '1', '1', '5', 'E60 ', 'N52K', 'A', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2419', 'NU24', '523I RL MYS SKD A        ', 'NU21', 'NU21', '1', '1', 'L5', 'E60 ', 'N52K', 'A', '4', 'R', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2420', 'NU25', '523LI A CHN CKD A        ', 'NR21', 'NR21', '1', '1', '5C', 'E60 ', 'N52 ', 'A', '4', 'L', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2421', 'NU26', '523I EGY CKD A           ', 'NU21', 'NU21', '1', '1', 'Y5', 'E60 ', 'N52K', 'A', '4', 'L', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2422', 'NU27', '523I RL IDN CKD A        ', 'NU21', 'NU21', '1', '1', 'C5', 'E60 ', 'N52K', 'A', '4', 'R', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2423', 'NU28', '523I RL THA CKD A        ', 'NU21', 'NU21', '1', '1', 'T5', 'E60 ', 'N52K', 'A', '4', 'R', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2424', 'NU31', '523I                     ', 'NU31', 'NU31', '1', '1', '5', 'E60 ', 'N53 ', 'S', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2425', 'NU32', '523I RL                  ', 'NU31', 'NU31', '1', '1', '5', 'E60 ', 'N53 ', 'S', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2426', 'NU39', '523LI A CKD CHN          ', 'NU11', 'NU11', '1', '1', '5C', 'E60 ', 'N52K', 'S', '4', 'L', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2427', 'NU41', '523I A                   ', 'NU41', 'NU41', '1', '1', '5', 'E60 ', 'N53 ', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2428', 'NU42', '523I RL A                ', 'NU41', 'NU41', '1', '1', '5', 'E60 ', 'N53 ', 'A', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2429', 'NU45', '523I RL IND CKD A        ', 'NU21', 'NU21', '1', '1', 'I5', 'E60 ', 'N52K', 'A', '4', 'R', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2430', 'NU49', '523LI A CKD CHN A        ', 'NZ21', 'NZ21', '1', '1', '5C', 'E60 ', 'N52K', 'A', '4', 'L', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2431', 'NU51', '525I                     ', 'NU51', 'NU51', '1', '1', '5', 'E60 ', 'N52K', 'S', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2432', 'NU52', '525I RL                  ', 'NU51', 'NU51', '1', '1', '5', 'E60 ', 'N52K', 'S', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2433', 'NU53', '528I US                  ', 'NU53', 'NU53', '1', '1', '5', 'E60 ', 'N52K', 'S', '4', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2434', 'NU54', '525I RL MYS SKD          ', 'NU51', 'NU51', '1', '1', 'L5', 'E60 ', 'N52K', 'S', '4', 'R', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2435', 'NU55', '525I RUS SKD             ', 'NU51', 'NU51', '1', '1', 'R5', 'E60 ', 'N52K', 'S', '4', 'L', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2436', 'NU56', '525I EGY CKD             ', 'NU51', 'NU51', '1', '1', 'Y5', 'E60 ', 'N52K', 'S', '4', 'L', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2437', 'NU57', '525LI A CHN CKD          ', 'NE51', 'NE51', '1', '1', '5C', 'E60 ', 'N52 ', 'S', '4', 'L', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2438', 'NU61', '525I A                   ', 'NU61', 'NU61', '1', '1', '5', 'E60 ', 'N52K', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2439', 'NU62', '525I RL A                ', 'NU61', 'NU61', '1', '1', '5', 'E60 ', 'N52K', 'A', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2440', 'NU63', '528I US A                ', 'NU63', 'NU63', '1', '1', '5', 'E60 ', 'N52K', 'A', '4', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2441', 'NU64', '525I RL MYS SKD A        ', 'NU61', 'NU61', '1', '1', 'L5', 'E60 ', 'N52K', 'A', '4', 'R', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2442', 'NU65', '525I RUS SKD A           ', 'NU61', 'NU61', '1', '1', 'R5', 'E60 ', 'N52K', 'A', '4', 'L', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2443', 'NU66', '525I EGY CKD A           ', 'NU61', 'NU61', '1', '1', 'Y5', 'E60 ', 'N52K', 'A', '4', 'L', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2444', 'NU67', '525LI A CHN CKD A        ', 'NE61', 'NE61', '1', '1', '5C', 'E60 ', 'N52 ', 'A', '4', 'L', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2445', 'NU68', '525I RL THA CKD A        ', 'NU61', 'NU61', '1', '1', 'T5', 'E60 ', 'N52K', 'A', '4', 'R', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2446', 'NU71', '525I                     ', 'NU71', 'NU71', '1', '1', '5', 'E60 ', 'N53 ', 'S', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2447', 'NU72', '525I RL                  ', 'NU71', 'NU71', '1', '1', '5', 'E60 ', 'N53 ', 'S', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2448', 'NU75', '525I RL IND CKD          ', 'NU51', 'NU51', '1', '1', 'I5', 'E60 ', 'N52K', 'S', '4', 'R', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2449', 'NU79', '525LI A CHN CKD          ', 'NU51', 'NU51', '1', '1', '5C', 'E60 ', 'N52K', 'S', '4', 'L', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2450', 'NU81', '525I A                   ', 'NU81', 'NU81', '1', '1', '5', 'E60 ', 'N53 ', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2451', 'NU82', '525I RL A                ', 'NU81', 'NU81', '1', '1', '5', 'E60 ', 'N53 ', 'A', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2452', 'NU85', '525I RL IND CKD A        ', 'NU61', 'NU61', '1', '1', 'I5', 'E60 ', 'N52K', 'A', '4', 'R', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2453', 'NU89', '525LI A CHN CKD A        ', 'NZ41', 'NZ41', '1', '1', '5C', 'E60 ', 'N52K', 'A', '4', 'L', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2454', 'NU91', '530I                     ', 'NU91', 'NU91', '1', '1', '5', 'E60 ', 'N52K', 'S', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2455', 'NU92', '530I RL                  ', 'NU91', 'NU91', '1', '1', '5', 'E60 ', 'N52K', 'S', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2456', 'NU94', '530I RL MYS SKD          ', 'NU91', 'NU91', '1', '1', 'L5', 'E60 ', 'N52K', 'S', '4', 'R', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2457', 'NU95', '530I RUS SKD             ', 'NU91', 'NU91', '1', '1', 'R5', 'E60 ', 'N52K', 'S', '4', 'L', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2458', 'NU96', '530I EGY CKD             ', 'NU91', 'NU91', '1', '1', 'Y5', 'E60 ', 'N52K', 'S', '4', 'L', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2459', 'NU98', '530LI A CHN CKD          ', 'NR61', 'NR61', '1', '1', '5C', 'E60 ', 'N52 ', 'S', '4', 'L', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2460', 'NV03', '535I XDRIVE US A         ', 'NV03', 'NV03', '1', '1', '5X', 'E60 ', 'N54 ', 'A', '4', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2461', 'NV13', '528I XDRIVE US           ', 'NV13', 'NV13', '1', '1', '5X', 'E60 ', 'N52K', 'S', '4', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2462', 'NV23', '528I XDRIVE US A         ', 'NV23', 'NV23', '1', '1', '5X', 'E60 ', 'N52K', 'A', '4', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2463', 'NV31', '525I XDRIVE              ', 'NV31', 'NV31', '1', '1', '5X', 'E60 ', 'N53 ', 'S', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2464', 'NV41', '525I XDRIVE A            ', 'NV41', 'NV41', '1', '1', '5X', 'E60 ', 'N53 ', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2465', 'NV45', '525I XDRIVE SKD RUSA     ', 'NV41', 'NV41', '1', '1', '5R', 'E60 ', 'N53 ', 'A', '4', 'L', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2466', 'NV51', '530I XDRIVE              ', 'NV51', 'NV51', '1', '1', '5X', 'E60 ', 'N52K', 'S', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2467', 'NV58', '530I XDRIVE SKD          ', 'NV51', 'NV51', '1', '1', '5R', 'E60 ', 'N52K', 'S', '4', 'L', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2468', 'NV61', '530I XDRIVE A            ', 'NV61', 'NV61', '1', '1', '5X', 'E60 ', 'N52K', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2469', 'NV68', '530I XDRIVE SKD A        ', 'NV61', 'NV61', '1', '1', '5R', 'E60 ', 'N52K', 'A', '4', 'L', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2470', 'NV71', '530I XDRIVE              ', 'NV71', 'NV71', '1', '1', '5X', 'E60 ', 'N53 ', 'S', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2471', 'NV81', '530I XDRIVE A            ', 'NV81', 'NV81', '1', '1', '5X', 'E60 ', 'N53 ', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2472', 'NV93', '535I XDRIVE US           ', 'NV93', 'NV93', '1', '1', '5X', 'E60 ', 'N54 ', 'S', '4', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2473', 'NW13', '535I US                  ', 'NW13', 'NW13', '1', '1', '5', 'E60 ', 'N54 ', 'S', '4', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2474', 'NW23', '535I US A                ', 'NW23', 'NW23', '1', '1', '5', 'E60 ', 'N54 ', 'A', '4', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2475', 'NW31', '540I                     ', 'NW31', 'NW31', '1', '1', '5', 'E60 ', 'N62T', 'S', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2476', 'NW32', '540I RL                  ', 'NW31', 'NW31', '1', '1', '5', 'E60 ', 'N62T', 'S', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2477', 'NW41', '540I A                   ', 'NW41', 'NW41', '1', '1', '5', 'E60 ', 'N62T', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2478', 'NW42', '540I RL A                ', 'NW41', 'NW41', '1', '1', '5', 'E60 ', 'N62T', 'A', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2479', 'NW51', '550I                     ', 'NW51', 'NW51', '1', '1', '5', 'E60 ', 'N62T', 'S', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2480', 'NW52', '550I RL                  ', 'NW51', 'NW51', '1', '1', '5', 'E60 ', 'N62T', 'S', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2481', 'NW53', '550I US                  ', 'NW53', 'NW53', '1', '1', '5', 'E60 ', 'N62T', 'S', '4', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2482', 'NW61', '550I A                   ', 'NW61', 'NW61', '1', '1', '5', 'E60 ', 'N62T', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2483', 'NW62', '550I RL A                ', 'NW61', 'NW61', '1', '1', '5', 'E60 ', 'N62T', 'A', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2484', 'NW63', '550I US A                ', 'NW63', 'NW63', '1', '1', '5', 'E60 ', 'N62T', 'A', '4', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2485', 'NX01', '535D A                   ', 'NX01', 'NX01', '1', '1', '5', 'E60 ', 'M57Y', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2486', 'NX02', '535D RL A                ', 'NX01', 'NX01', '1', '1', '5', 'E60 ', 'M57Y', 'A', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2487', 'NX11', '520D                     ', 'NX11', 'NX11', '1', '1', '5', 'E60 ', 'M47S', 'S', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2488', 'NX12', '520D RL                  ', 'NX11', 'NX11', '1', '1', '5', 'E60 ', 'M47S', 'S', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2489', 'NX21', '520D A                   ', 'NX21', 'NX21', '1', '1', '5', 'E60 ', 'M47S', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2490', 'NX22', '520D RL A                ', 'NX21', 'NX21', '1', '1', '5', 'E60 ', 'M47S', 'A', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2491', 'NX27', '520D RL THA CKD A        ', 'NX21', 'NX21', '1', '1', 'T5', 'E60 ', 'M47S', 'A', '4', 'R', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2492', 'NX31', '520D                     ', 'NX31', 'NX31', '1', '1', '5', 'E60 ', 'N47 ', 'S', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2493', 'NX32', '520D RL                  ', 'NX31', 'NX31', '1', '1', '5', 'E60 ', 'N47 ', 'S', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2494', 'NX41', '520D A                   ', 'NX41', 'NX41', '1', '1', '5', 'E60 ', 'N47 ', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2495', 'NX42', '520D RL A                ', 'NX41', 'NX41', '1', '1', '5', 'E60 ', 'N47 ', 'A', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2496', 'NX45', '520D A CKD IND A         ', 'NX41', 'NX41', '1', '1', 'I5', 'E60 ', 'N47 ', 'A', '4', 'R', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2497', 'NX47', '520D RL THA CKD A        ', 'NX41', 'NX41', '1', '1', 'T5', 'E60 ', 'N47 ', 'A', '4', 'R', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2498', 'NX51', '525D                     ', 'NX51', 'NX51', '1', '1', '5', 'E60 ', 'M57S', 'S', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2499', 'NX52', '525D RL                  ', 'NX51', 'NX51', '1', '1', '5', 'E60 ', 'M57S', 'S', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2500', 'NX55', '525D RL IND CKD          ', 'NX51', 'NX51', '1', '1', 'I5', 'E60 ', 'M57S', 'S', '4', 'R', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2501', 'NX61', '525D A                   ', 'NX61', 'NX61', '1', '1', '5', 'E60 ', 'M57S', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2502', 'NX62', '525D RL A                ', 'NX61', 'NX61', '1', '1', '5', 'E60 ', 'M57S', 'A', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2503', 'NX65', '525D RL IND CKD A        ', 'NX61', 'NX61', '1', '1', 'I5', 'E60 ', 'M57S', 'A', '4', 'R', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2504', 'NX71', '530D                     ', 'NX71', 'NX71', '1', '1', '5', 'E60 ', 'M57S', 'S', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2505', 'NX72', '530D RL                  ', 'NX71', 'NX71', '1', '1', '5', 'E60 ', 'M57S', 'S', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2506', 'NX81', '530D A                   ', 'NX81', 'NX81', '1', '1', '5', 'E60 ', 'M57S', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2507', 'NX82', '530D RL A                ', 'NX81', 'NX81', '1', '1', '5', 'E60 ', 'M57S', 'A', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2508', 'NX85', '530D A CKD IND A         ', 'NX81', 'NX81', '1', '1', 'I5', 'E60 ', 'M57S', 'A', '4', 'R', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2509', 'NY51', '525D XDRIVE              ', 'NY51', 'NY51', '1', '1', '5X', 'E60 ', 'M57S', 'S', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2510', 'NY61', '525D XDRIVE A            ', 'NY61', 'NY61', '1', '1', '5X', 'E60 ', 'M57S', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2511', 'NY71', '530D XDRIVE              ', 'NY71', 'NY71', '1', '1', '5X', 'E60 ', 'M57S', 'S', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2512', 'NY81', '530D XDRIVE A            ', 'NY81', 'NY81', '1', '1', '5X', 'E60 ', 'M57S', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2513', 'NZ21', '523LI A                  ', 'NZ21', 'NZ21', '1', '1', '5', 'E60 ', 'N52K', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2514', 'NZ41', '525LI A                  ', 'NZ41', 'NZ41', '1', '1', '5', 'E60 ', 'N52K', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2515', 'NZ61', '530LI A                  ', 'NZ61', 'NZ61', '1', '1', '5', 'E60 ', 'N52K', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2516', 'PA01', 'X3 3 0I A                ', 'PA01', 'PA01', '1', '1', 'G3', 'E83 ', 'M54 ', 'A', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2517', 'PA02', 'X3 3 0I RL A             ', 'PA01', 'PA01', '1', '1', 'G3', 'E83 ', 'M54 ', 'A', '5', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2518', 'PA03', 'X3 3 0I A                ', 'PA03', 'PA03', '1', '1', 'G3', 'E83 ', 'M54 ', 'A', '5', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2519', 'PA06', 'X3 3 0I EGY SKD A        ', 'PA01', 'PA01', '1', '1', 'Y3', 'E83 ', 'M54 ', 'A', '5', 'L', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2520', 'PA31', 'X3 2 0I                  ', 'PA31', 'PA31', '1', '1', 'G3', 'E83 ', 'N46 ', 'S', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2521', 'PA32', 'X3 2 0I RL               ', 'PA31', 'PA31', '1', '1', 'G3', 'E83 ', 'N46 ', 'S', '5', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2522', 'PA71', 'X3 2 5I                  ', 'PA71', 'PA71', '1', '1', 'G3', 'E83 ', 'M54 ', 'S', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2523', 'PA72', 'X3 2 5I RL               ', 'PA71', 'PA71', '1', '1', 'G3', 'E83 ', 'M54 ', 'S', '5', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2524', 'PA73', 'X3 2 5I US               ', 'PA73', 'PA73', '1', '1', 'G3', 'E83 ', 'M54 ', 'S', '5', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2525', 'PA75', 'X3 2 5I THA CKD          ', 'PA71', 'PA71', '1', '1', 'T3', 'E83 ', 'M54 ', 'S', '5', 'R', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2526', 'PA81', 'X3 2 5I A                ', 'PA81', 'PA81', '1', '1', 'G3', 'E83 ', 'M54 ', 'A', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2527', 'PA82', 'X3 2 5I RL A             ', 'PA81', 'PA81', '1', '1', 'G3', 'E83 ', 'M54 ', 'A', '5', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2528', 'PA83', 'X3 2 5I US A             ', 'PA83', 'PA83', '1', '1', 'G3', 'E83 ', 'M54 ', 'A', '5', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2529', 'PA85', 'X3 2 5I THA CKD A        ', 'PA81', 'PA81', '1', '1', 'T3', 'E83 ', 'M54 ', 'A', '5', 'R', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2530', 'PA91', 'X3 3 0I                  ', 'PA91', 'PA91', '1', '1', 'G3', 'E83 ', 'M54 ', 'S', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2531', 'PA93', 'X3 3 0I                  ', 'PA93', 'PA93', '1', '1', 'G3', 'E83 ', 'M54 ', 'S', '5', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2532', 'PA96', 'X3 3 0I EGY SKD          ', 'PA91', 'PA91', '1', '1', 'Y3', 'E83 ', 'M54 ', 'S', '5', 'L', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2533', 'PB11', 'X3 2 0D                  ', 'PB11', 'PB11', '1', '1', 'G3', 'E83 ', 'M47S', 'S', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2534', 'PB12', 'X3 2 0D RL               ', 'PB11', 'PB11', '1', '1', 'G3', 'E83 ', 'M47S', 'S', '5', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2535', 'PB51', 'X3 3 0D                  ', 'PB51', 'PB51', '1', '1', 'G3', 'E83 ', 'M57T', 'S', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2536', 'PB61', 'X3 3 0D A                ', 'PB61', 'PB61', '1', '1', 'G3', 'E83 ', 'M57T', 'A', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2537', 'PC01', 'X3 XDRIVE30I A           ', 'PC01', 'PC01', '1', '1', 'G3', 'E83 ', 'N52K', 'A', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2538', 'PC02', 'X3 XDRIVE30I RL A        ', 'PC01', 'PC01', '1', '1', 'G3', 'E83 ', 'N52K', 'A', '5', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2539', 'PC03', 'X3 XDRIVE30I US A        ', 'PC03', 'PC03', '1', '1', 'G3', 'E83 ', 'N52K', 'A', '5', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2540', 'PC06', 'X3 XDRIVE30I EGY SKA     ', 'PC01', 'PC01', '1', '1', 'Y3', 'E83 ', 'N52K', 'A', '5', 'L', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2541', 'PC08', 'X3 XDRIVE30I RUS SKA     ', 'PC01', 'PC01', '1', '1', 'R3', 'E83 ', 'N52K', 'A', '5', 'L', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2542', 'PC31', 'X3 XDRIVE20i             ', 'PC31', 'PC31', '1', '1', 'G3', 'E83 ', 'N46 ', 'S', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2543', 'PC32', 'X3 XDRIVE 20I RL         ', 'PC31', 'PC31', '1', '1', 'G3', 'E83 ', 'N46 ', 'S', '5', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2544', 'PC38', 'X3 XDRIVE20I RUS SKD     ', 'PC31', 'PC31', '1', '1', 'R3', 'E83 ', 'N46 ', 'S', '5', 'L', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2545', 'PC71', 'X3 XDRIVE25I             ', 'PC71', 'PC71', '1', '1', 'G3', 'E83 ', 'N52K', 'S', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2546', 'PC72', 'X3 XDRIVE25I RL          ', 'PC71', 'PC71', '1', '1', 'G3', 'E83 ', 'N52K', 'S', '5', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2547', 'PC73', 'X3 XDRIVE28I US          ', 'PC73', 'PC73', '1', '1', 'G3', 'E83 ', 'N52K', 'S', '5', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2548', 'PC78', 'X3 XDRIVE25I RUS SKD     ', 'PC71', 'PC71', '1', '1', 'R3', 'E83 ', 'N52K', 'S', '5', 'L', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2549', 'PC81', 'X3 XDRIVE25I A           ', 'PC81', 'PC81', '1', '1', 'G3', 'E83 ', 'N52K', 'A', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2550', 'PC82', 'X3 XDRIVE25I RL A        ', 'PC81', 'PC81', '1', '1', 'G3', 'E83 ', 'N52K', 'A', '5', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2551', 'PC83', 'X3 XDRIVE28I US A        ', 'PC83', 'PC83', '1', '1', 'G3', 'E83 ', 'N52K', 'A', '5', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2552', 'PC85', 'X3 XDRIVE25I THA CKA     ', 'PC81', 'PC81', '1', '1', 'T3', 'E83 ', 'N52K', 'A', '5', 'R', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2553', 'PC88', 'X3 XDRIVE25I RUS SKA     ', 'PC81', 'PC81', '1', '1', 'R3', 'E83 ', 'N52K', 'A', '5', 'L', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2554', 'PC91', 'X3 XDRIVE30I             ', 'PC91', 'PC91', '1', '1', 'G3', 'E83 ', 'N52K', 'S', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2555', 'PC92', 'X3 XDRIVE30I RL          ', 'PC91', 'PC91', '1', '1', 'G3', 'E83 ', 'N52K', 'S', '5', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2556', 'PC93', 'X3 XDRIVE30I US          ', 'PC93', 'PC93', '1', '1', 'G3', 'E83 ', 'N52K', 'S', '5', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2557', 'PC96', 'X3 XDRIVE30I EGY SKD     ', 'PC91', 'PC91', '1', '1', 'Y3', 'E83 ', 'N52K', 'S', '5', 'L', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2558', 'PC98', 'X3 XDRIVE30I RUS SKD     ', 'PC91', 'PC91', '1', '1', 'R3', 'E83 ', 'N52K', 'S', '5', 'L', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2559', 'PD01', 'X3 XDRIVE30D A           ', 'PD01', 'PD01', '1', '1', 'G3', 'E83 ', 'M57S', 'A', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2560', 'PD02', 'X3 XDRIVE30D RL A        ', 'PD01', 'PD01', '1', '1', 'G3', 'E83 ', 'M57S', 'A', '5', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2561', 'PD11', 'X3 2 0D                  ', 'PD11', 'PD11', '1', '1', 'G3', 'E83 ', 'M47S', 'S', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2562', 'PD12', 'X3 2 0D RL               ', 'PD11', 'PD11', '1', '1', 'G3', 'E83 ', 'M47S', 'S', '5', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2563', 'PD51', 'X3 3 0D                  ', 'PD51', 'PD51', '1', '1', 'G3', 'E83 ', 'M57S', 'S', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2564', 'PD52', 'X3 3 0D RL               ', 'PD51', 'PD51', '1', '1', 'G3', 'E83 ', 'M57S', 'S', '5', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2565', 'PD61', 'X3 3 0D A                ', 'PD61', 'PD61', '1', '1', 'G3', 'E83 ', 'M57S', 'A', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2566', 'PD62', 'X3 3 0D RL A             ', 'PD61', 'PD61', '1', '1', 'G3', 'E83 ', 'M57S', 'A', '5', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2567', 'PD81', 'X3 XDRIVE35D A           ', 'PD81', 'PD81', '1', '1', 'G3', 'E83 ', 'M57Y', 'A', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2568', 'PD82', 'X3 XDRIVE35D RL A        ', 'PD81', 'PD81', '1', '1', 'G3', 'E83 ', 'M57Y', 'A', '5', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2569', 'PD91', 'X3 XDRIVE30D             ', 'PD91', 'PD91', '1', '1', 'G3', 'E83 ', 'M57S', 'S', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2570', 'PD92', 'X3 XDRIVE30D RL          ', 'PD91', 'PD91', '1', '1', 'G3', 'E83 ', 'M57S', 'S', '5', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2571', 'PE11', 'X3 XDRIVE20D             ', 'PE11', 'PE11', '1', '1', 'G3', 'E83 ', 'N47 ', 'S', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2572', 'PE12', 'X3 XDRIVE20D RL          ', 'PE11', 'PE11', '1', '1', 'G3', 'E83 ', 'N47 ', 'S', '5', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2573', 'PE18', 'X3 XDRIVE20D RUS SKD     ', 'PE11', 'PE11', '1', '1', 'R3', 'E83 ', 'N47 ', 'S', '5', 'L', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2574', 'PE21', 'X3 XDRIVE20D A           ', 'PE21', 'PE21', '1', '1', 'G3', 'E83 ', 'N47 ', 'A', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2575', 'PE22', 'X3 XDRIVE20D RL A        ', 'PE21', 'PE21', '1', '1', 'G3', 'E83 ', 'N47 ', 'A', '5', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2576', 'PE25', 'X3 XDRIVE20D THA CKA     ', 'PE21', 'PE21', '1', '1', 'T3', 'E83 ', 'N47 ', 'A', '5', 'R', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2577', 'PE28', 'X3 XDRIVE20D RUS SKA     ', 'PE21', 'PE21', '1', '1', 'R3', 'E83 ', 'N47 ', 'A', '5', 'L', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2578', 'PE71', 'X3 XDRIVE18D             ', 'PE71', 'PE71', '1', '1', 'G3', 'E83 ', 'N47 ', 'S', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2579', 'PE72', 'X3 XDRIVE18D RL          ', 'PE71', 'PE71', '1', '1', 'G3', 'E83 ', 'N47 ', 'S', '5', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2580', 'PF11', '316I                     ', 'PF11', 'PF11', '1', '1', '3', 'E90 ', 'N45T', 'S', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2581', 'PF12', '316I RL                  ', 'PF11', 'PF11', '1', '1', '3', 'E90 ', 'N45T', 'S', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2582', 'PF21', '316I A                   ', 'PF21', 'PF21', '1', '1', '3', 'E90 ', 'N45T', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2583', 'PF31', '316I                     ', 'PF31', 'PF31', '1', '1', '3', 'E90 ', 'N43 ', 'S', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2584', 'PF32', '316I RL                  ', 'PF31', 'PF31', '1', '1', '3', 'E90 ', 'N43 ', 'S', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2585', 'PF42', '316I RL A                ', 'PF61', 'PF61', '1', '1', '3', 'E90 ', 'N43 ', 'A', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2586', 'PF51', '318I                     ', 'PF51', 'PF51', '1', '1', '3', 'E90 ', 'N43 ', 'S', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2587', 'PF52', '318I RL                  ', 'PF51', 'PF51', '1', '1', '3', 'E90 ', 'N43 ', 'S', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2588', 'PF61', '318I A                   ', 'PF61', 'PF61', '1', '1', '3', 'E90 ', 'N43 ', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2589', 'PF62', '318I RL A                ', 'PF61', 'PF61', '1', '1', '3', 'E90 ', 'N43 ', 'A', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2590', 'PF71', '318I                     ', 'PF71', 'PF71', '1', '1', '3', 'E90 ', 'N46T', 'S', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2591', 'PF72', '318I RL                  ', 'PF71', 'PF71', '1', '1', '3', 'E90 ', 'N46T', 'S', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2592', 'PF78', '318I SKD RUS             ', 'PF71', 'PF71', '1', '1', 'R3', 'E90 ', 'N46T', 'S', '4', 'L', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2593', 'PF81', '318I A                   ', 'PF81', 'PF81', '1', '1', '3', 'E90 ', 'N46T', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2594', 'PF82', '318I RL A                ', 'PF81', 'PF81', '1', '1', '3', 'E90 ', 'N46T', 'A', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2595', 'PF87', '318I RL THA SKD A        ', 'PF81', 'PF81', '1', '1', 'T3', 'E90 ', 'N46T', 'A', '4', 'R', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2596', 'PF88', '318I SKD RUS A           ', 'PF81', 'PF81', '1', '1', 'R3', 'E90 ', 'N46T', 'A', '4', 'L', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2597', 'PG05', '320I RL IND SKD A        ', 'PG61', 'PG61', '1', '1', 'I3', 'E90 ', 'N46T', 'A', '4', 'R', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2598', 'PG06', '320I CHN CKD A           ', 'PG61', 'PG61', '1', '1', '3C', 'E90 ', 'N46T', 'A', '4', 'L', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2599', 'PG07', '320I RL THA SKD A        ', 'PG61', 'PG61', '1', '1', 'T3', 'E90 ', 'N46T', 'A', '4', 'R', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2600', 'PG08', '320I RUS SKD A           ', 'PG61', 'PG61', '1', '1', 'R3', 'E90 ', 'N46T', 'A', '4', 'L', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2601', 'PG09', '320I EGY SKD A           ', 'PG61', 'PG61', '1', '1', 'Y3', 'E90 ', 'N46T', 'A', '4', 'L', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2602', 'PG11', '318D                     ', 'PG11', 'PG11', '1', '1', '3', 'E90 ', 'N47T', 'S', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2603', 'PG12', '318D RL                  ', 'PG11', 'PG11', '1', '1', '3', 'E90 ', 'N47T', 'S', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2604', 'PG21', '318D A                   ', 'PG21', 'PG21', '1', '1', '3', 'E90 ', 'N47T', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2605', 'PG22', '318D RL A                ', 'PG21', 'PG21', '1', '1', '3', 'E90 ', 'N47T', 'A', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2606', 'PG31', '320I                     ', 'PG31', 'PG31', '1', '1', '3', 'E90 ', 'N43 ', 'S', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2607', 'PG32', '320I RL                  ', 'PG31', 'PG31', '1', '1', '3', 'E90 ', 'N43 ', 'S', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2608', 'PG36', '320I RL                  ', 'PG31', 'PG31', '1', '1', '3', 'E90 ', 'N43 ', 'S', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2609', 'PG41', '320I A                   ', 'PG41', 'PG41', '1', '1', '3', 'E90 ', 'N43 ', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2610', 'PG42', '320I RL A                ', 'PG41', 'PG41', '1', '1', '3', 'E90 ', 'N43 ', 'A', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2611', 'PG46', '320I RL A                ', 'PG41', 'PG41', '1', '1', '3', 'E90 ', 'N43 ', 'A', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2612', 'PG51', '320I                     ', 'PG51', 'PG51', '1', '1', '3', 'E90 ', 'N46T', 'S', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2613', 'PG52', '320I RL                  ', 'PG51', 'PG51', '1', '1', '3', 'E90 ', 'N46T', 'S', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2614', 'PG54', '320I RL MAL SKD          ', 'PG51', 'PG51', '1', '1', 'L3', 'E90 ', 'N46T', 'S', '4', 'R', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2615', 'PG55', '320I                     ', 'PG51', 'PG51', '1', '1', '3', 'E90 ', 'N46T', 'S', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2616', 'PG56', '320I RL                  ', 'PG51', 'PG51', '1', '1', '3', 'E90 ', 'N46T', 'S', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2617', 'PG57', '320I RL IDN SKD          ', 'PG51', 'PG51', '1', '1', 'C3', 'E90 ', 'N46T', 'S', '4', 'R', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2618', 'PG58', '318I A CKD CHN           ', 'PG51', 'PG51', '1', '1', '3C', 'E90 ', 'N46T', 'S', '4', 'L', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2619', 'PG59', '318I A SKD EGY           ', 'PG51', 'PG51', '1', '1', 'Y3', 'E90 ', 'N46T', 'S', '4', 'L', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2620', 'PG61', '320I A                   ', 'PG61', 'PG61', '1', '1', '3', 'E90 ', 'N46T', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2621', 'PG62', '320I RL A                ', 'PG61', 'PG61', '1', '1', '3', 'E90 ', 'N46T', 'A', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2622', 'PG64', '320I RL MAL SKD A        ', 'PG61', 'PG61', '1', '1', 'L3', 'E90 ', 'N46T', 'A', '4', 'R', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2623', 'PG65', '320I A                   ', 'PG61', 'PG61', '1', '1', '3', 'E90 ', 'N46T', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2624', 'PG66', '320I RL A                ', 'PG61', 'PG61', '1', '1', '3', 'E90 ', 'N46T', 'A', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2625', 'PG67', '320I RL IDN SKD A        ', 'PG61', 'PG61', '1', '1', 'C3', 'E90 ', 'N46T', 'A', '4', 'R', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2626', 'PG68', '318I A CKD CHN A         ', 'PG61', 'PG61', '1', '1', '3C', 'E90 ', 'N46T', 'A', '4', 'L', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2627', 'PG69', '318I A SKD EGY A         ', 'PG61', 'PG61', '1', '1', 'Y3', 'E90 ', 'N46T', 'A', '4', 'L', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2628', 'PG71', '323I                     ', 'PG71', 'PG71', '1', '1', '3', 'E90 ', 'N52K', 'S', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2629', 'PG73', '323I US                  ', 'PG73', 'PG73', '1', '1', '3', 'E90 ', 'N52K', 'S', '4', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2630', 'PG74', '323I RL SKD MYS          ', 'PG71', 'PG71', '1', '1', 'C3', 'E90 ', 'N52K', 'S', '4', 'R', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2631', 'PG76', '323I RL                  ', 'PG71', 'PG71', '1', '1', '3', 'E90 ', 'N52K', 'S', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2632', 'PG77', '323I US                  ', 'PG73', 'PG73', '1', '1', '3', 'E90 ', 'N52K', 'S', '4', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2633', 'PG81', '323I A                   ', 'PG81', 'PG81', '1', '1', '3', 'E90 ', 'N52K', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2634', 'PG82', '323I RL A                ', 'PG81', 'PG81', '1', '1', '3', 'E90 ', 'N52K', 'A', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2635', 'PG83', '323I US A                ', 'PG83', 'PG83', '1', '1', '3', 'E90 ', 'N52K', 'A', '4', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2636', 'PG84', '323I RL SKD MYS A        ', 'PG81', 'PG81', '1', '1', 'C3', 'E90 ', 'N52K', 'A', '4', 'R', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2637', 'PG85', '323I A                   ', 'PG81', 'PG81', '1', '1', '3', 'E90 ', 'N52K', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2638', 'PG86', '323I RL A                ', 'PG81', 'PG81', '1', '1', '3', 'E90 ', 'N52K', 'A', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2639', 'PG87', '323I US A                ', 'PG83', 'PG83', '1', '1', '3', 'E90 ', 'N52K', 'A', '4', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2640', 'PG95', '320I RL IND SKD          ', 'PG51', 'PG51', '1', '1', 'I3', 'E90 ', 'N46T', 'S', '4', 'R', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2641', 'PG96', '320I CHN CKD             ', 'PG51', 'PG51', '1', '1', '3C', 'E90 ', 'N46T', 'S', '4', 'L', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2642', 'PG98', '320I RUS SKD             ', 'PG51', 'PG51', '1', '1', 'R3', 'E90 ', 'N46T', 'S', '4', 'L', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2643', 'PG99', '320I EGY SKD             ', 'PG51', 'PG51', '1', '1', 'Y3', 'E90 ', 'N46T', 'S', '4', 'L', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2644', 'PH05', '325I RL IND SKD A        ', 'PH21', 'PH21', '1', '1', 'I3', 'E90 ', 'N52K', 'A', '4', 'R', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2645', 'PH11', '325I                     ', 'PH11', 'PH11', '1', '1', '3', 'E90 ', 'N52K', 'S', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2646', 'PH12', '325I RL                  ', 'PH11', 'PH11', '1', '1', '3', 'E90 ', 'N52K', 'S', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2647', 'PH16', '325I RL                  ', 'PH11', 'PH11', '1', '1', '3', 'E90 ', 'N52K', 'S', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2648', 'PH18', '325I CHN                 ', 'PH11', 'PH11', '1', '1', '3C', 'E90 ', 'N52K', 'S', '4', 'L', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2649', 'PH21', '325I A                   ', 'PH21', 'PH21', '1', '1', '3', 'E90 ', 'N52K', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2650', 'PH22', '325I RL A                ', 'PH21', 'PH21', '1', '1', '3', 'E90 ', 'N52K', 'A', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2651', 'PH24', '325I RUS SKD A           ', 'PH21', 'PH21', '1', '1', 'R3', 'E90 ', 'N52K', 'A', '4', 'L', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2652', 'PH25', '325I A                   ', 'PH21', 'PH21', '1', '1', '3', 'E90 ', 'N52K', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2653', 'PH26', '325I RL A                ', 'PH21', 'PH21', '1', '1', '3', 'E90 ', 'N52K', 'A', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2654', 'PH27', '325I RL THA SKD A        ', 'PH21', 'PH21', '1', '1', 'T3', 'E90 ', 'N52K', 'A', '4', 'R', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2655', 'PH28', '325I CHN A               ', 'PH21', 'PH21', '1', '1', '3C', 'E90 ', 'N52K', 'A', '4', 'L', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2656', 'PH31', '325I                     ', 'PH31', 'PH31', '1', '1', '3', 'E90 ', 'N53 ', 'S', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2657', 'PH32', '325I RL                  ', 'PH31', 'PH31', '1', '1', '3', 'E90 ', 'N53 ', 'S', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2658', 'PH39', '325I RL MAL SKD          ', 'PH11', 'PH11', '1', '1', 'C3', 'E90 ', 'N52K', 'S', '4', 'R', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2659', 'PH41', '325I A                   ', 'PH41', 'PH41', '1', '1', '3', 'E90 ', 'N53 ', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2660', 'PH42', '325I RL A                ', 'PH41', 'PH41', '1', '1', '3', 'E90 ', 'N53 ', 'A', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2661', 'PH45', '325I A                   ', 'PH41', 'PH41', '1', '1', '3', 'E90 ', 'N53 ', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2662', 'PH46', '325I RL A                ', 'PH41', 'PH41', '1', '1', '3', 'E90 ', 'N53 ', 'A', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2663', 'PH47', '325I RL IDN SKD A        ', 'PH21', 'PH21', '1', '1', 'C3', 'E90 ', 'N52K', 'A', '4', 'R', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2664', 'PH49', '325I RL MAL SKD A        ', 'PH21', 'PH21', '1', '1', 'C3', 'E90 ', 'N52K', 'A', '4', 'R', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2665', 'PH53', '328I US                  ', 'PH53', 'PH53', '1', '1', '3', 'E90 ', 'N51 ', 'S', '4', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2666', 'PH57', '328I US                  ', 'PH53', 'PH53', '1', '1', '3', 'E90 ', 'N51 ', 'S', '4', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2667', 'PH61', '328I KOREA A             ', 'PH63', 'PH63', '1', '1', 'K3', 'E90 ', 'N51 ', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2668', 'PH63', '328I US A                ', 'PH63', 'PH63', '1', '1', '3', 'E90 ', 'N51 ', 'A', '4', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2669', 'PH65', '328I KOREA A             ', 'PH63', 'PH63', '1', '1', 'K3', 'E90 ', 'N51 ', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2670', 'PH67', '328I US A                ', 'PH63', 'PH63', '1', '1', '3', 'E90 ', 'N51 ', 'A', '4', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2671', 'PH73', '328I US                  ', 'PH73', 'PH73', '1', '1', '3', 'E90 ', 'N52K', 'S', '4', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2672', 'PH77', '328I US                  ', 'PH73', 'PH73', '1', '1', '3', 'E90 ', 'N52K', 'S', '4', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2673', 'PH83', '328I US A                ', 'PH83', 'PH83', '1', '1', '3', 'E90 ', 'N52K', 'A', '4', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2674', 'PH87', '328I US A                ', 'PH83', 'PH83', '1', '1', '3', 'E90 ', 'N52K', 'A', '4', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2675', 'PK11', '325I XDRIVE              ', 'PK11', 'PK11', '1', '1', '3X', 'E90 ', 'N52K', 'S', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2676', 'PK21', '325I XDRIVE A            ', 'PK21', 'PK21', '1', '1', '3X', 'E90 ', 'N52K', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2677', 'PK24', '325I XDRIVE SKD A        ', 'PK21', 'PK21', '1', '1', 'R3', 'E90 ', 'N52K', 'A', '4', 'L', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2678', 'PK31', '325I XDRIVE              ', 'PK31', 'PK31', '1', '1', '3X', 'E90 ', 'N53 ', 'S', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2679', 'PK41', '325I XDRIVE A            ', 'PK41', 'PK41', '1', '1', '3X', 'E90 ', 'N53 ', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2680', 'PK53', '328I XDRIVE US           ', 'PK53', 'PK53', '1', '1', '3X', 'E90 ', 'N51 ', 'S', '4', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2681', 'PK57', '328I XDRIVE US           ', 'PK53', 'PK53', '1', '1', '3X', 'E90 ', 'N51 ', 'S', '4', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2682', 'PK63', '328I XDRIVE US A         ', 'PK63', 'PK63', '1', '1', '3X', 'E90 ', 'N51 ', 'A', '4', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2683', 'PK67', '328I XDRIVE US A ALR     ', 'PK63', 'PK63', '1', '1', '3X', 'E90 ', 'N51 ', 'A', '4', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2684', 'PK73', '328I XDRIVE US           ', 'PK73', 'PK73', '1', '1', '3X', 'E90 ', 'N52K', 'S', '4', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2685', 'PK77', '328I XDRIVE US           ', 'PK73', 'PK73', '1', '1', '3X', 'E90 ', 'N52K', 'S', '4', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2686', 'PK83', '328I XDRIVE US A         ', 'PK83', 'PK83', '1', '1', '3X', 'E90 ', 'N52K', 'A', '4', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2687', 'PK87', '328I XDRIVE US A ALR     ', 'PK83', 'PK83', '1', '1', '3X', 'E90 ', 'N52K', 'A', '4', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2688', 'PK91', 'M3 GT                    ', 'PK91', 'PK91', '1', '1', 'M3', 'E90 ', 'S65 ', 'S', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2689', 'PK92', 'M3 GT                    ', 'PK91', 'PK91', '1', '1', 'M3', 'E90 ', 'S65 ', 'S', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2690', 'PL11', '330I XDRIVE              ', 'PL11', 'PL11', '1', '1', '3X', 'E90 ', 'N53 ', 'S', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2691', 'PL21', '330I XDRIVE A            ', 'PL21', 'PL21', '1', '1', '3X', 'E90 ', 'N53 ', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2692', 'PL31', '335I XDRIVE              ', 'PL31', 'PL31', '1', '1', '3X', 'E90 ', 'N54 ', 'S', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2693', 'PL33', '335I XDRIVE US           ', 'PL33', 'PL33', '1', '1', '3X', 'E90 ', 'N54 ', 'S', '4', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2694', 'PL41', '335I XDRIVE A            ', 'PL41', 'PL41', '1', '1', '3X', 'E90 ', 'N54 ', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2695', 'PL43', '335I XDRIVE US A         ', 'PL43', 'PL43', '1', '1', '3X', 'E90 ', 'N54 ', 'A', '4', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2696', 'PL51', '335I XDRIVE              ', 'PL51', 'PL51', '1', '1', '3X', 'E90 ', 'N55 ', 'S', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2697', 'PL53', '335I XDRIVE US           ', 'PL53', 'PL53', '1', '1', '3X', 'E90 ', 'N55 ', 'S', '4', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2698', 'PL57', '335I XDRIVE US           ', 'PL53', 'PL53', '1', '1', '3X', 'E90 ', 'N55 ', 'S', '4', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2699', 'PL61', '335I XDRIVE A            ', 'PL61', 'PL61', '1', '1', '3X', 'E90 ', 'N55 ', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2700', 'PL63', '335I XDRIVE US A         ', 'PL63', 'PL63', '1', '1', '3X', 'E90 ', 'N55 ', 'A', '4', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2701', 'PL67', '335I XDRIVE US A ALR     ', 'PL63', 'PL63', '1', '1', '3X', 'E90 ', 'N55 ', 'A', '4', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2702', 'PM11', '330I                     ', 'PM11', 'PM11', '1', '1', '3', 'E90 ', 'N53 ', 'S', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2703', 'PM12', '330I RL                  ', 'PM11', 'PM11', '1', '1', '3', 'E90 ', 'N53 ', 'S', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2704', 'PM21', '330I A                   ', 'PM21', 'PM21', '1', '1', '3', 'E90 ', 'N53 ', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2705', 'PM22', '330I RL A                ', 'PM21', 'PM21', '1', '1', '3', 'E90 ', 'N53 ', 'A', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2706', 'PM31', '330I                     ', 'PM31', 'PM31', '1', '1', '3', 'E90 ', 'N52K', 'S', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2707', 'PM36', '330I RL                  ', 'PM31', 'PM31', '1', '1', '3', 'E90 ', 'N52K', 'S', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2708', 'PM39', '330I A SKD EGY           ', 'PM31', 'PM31', '1', '1', 'Y3', 'E90 ', 'N52K', 'S', '4', 'L', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2709', 'PM41', '330I A                   ', 'PM41', 'PM41', '1', '1', '3', 'E90 ', 'N52K', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2710', 'PM42', '330I RL A                ', 'PM41', 'PM41', '1', '1', '3', 'E90 ', 'N52K', 'A', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2711', 'PM44', '330I RL SKD IND          ', 'PM41', 'PM41', '1', '1', 'I3', 'E90 ', 'N52K', 'A', '4', 'R', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2712', 'PM45', '330I A                   ', 'PM41', 'PM41', '1', '1', '3', 'E90 ', 'N52K', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2713', 'PM46', '330I RL A                ', 'PM41', 'PM41', '1', '1', '3', 'E90 ', 'N52K', 'A', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2714', 'PM49', '330I A SKD EGY A         ', 'PM41', 'PM41', '1', '1', 'Y3', 'E90 ', 'N52K', 'A', '4', 'L', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2715', 'PM51', '335I                     ', 'PM51', 'PM51', '1', '1', '3', 'E90 ', 'N55 ', 'S', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2716', 'PM52', '335I RL                  ', 'PM51', 'PM51', '1', '1', '3', 'E90 ', 'N55 ', 'S', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2717', 'PM53', '335I US                  ', 'PM53', 'PM53', '1', '1', '3', 'E90 ', 'N55 ', 'S', '4', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2718', 'PM56', '335I RL                  ', 'PM51', 'PM51', '1', '1', '3', 'E90 ', 'N55 ', 'S', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2719', 'PM57', '335I                     ', 'PM53', 'PM53', '1', '1', '3', 'E90 ', 'N55 ', 'S', '4', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2720', 'PM61', '335I A                   ', 'PM61', 'PM61', '1', '1', '3', 'E90 ', 'N55 ', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2721', 'PM62', '335I RL A                ', 'PM61', 'PM61', '1', '1', '3', 'E90 ', 'N55 ', 'A', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2722', 'PM63', '335I US A                ', 'PM63', 'PM63', '1', '1', '3', 'E90 ', 'N55 ', 'A', '4', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2723', 'PM65', '335I A                   ', 'PM61', 'PM61', '1', '1', '3', 'E90 ', 'N55 ', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2724', 'PM66', '335I RL A                ', 'PM61', 'PM61', '1', '1', '3', 'E90 ', 'N55 ', 'A', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2725', 'PM67', '335I A                   ', 'PM63', 'PM63', '1', '1', '3', 'E90 ', 'N55 ', 'A', '4', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2726', 'PM71', '335I                     ', 'PM71', 'PM71', '1', '1', '3', 'E90 ', 'N54 ', 'S', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2727', 'PM72', '335I RL                  ', 'PM71', 'PM71', '1', '1', '3', 'E90 ', 'N54 ', 'S', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2728', 'PM73', '335I US                  ', 'PM73', 'PM73', '1', '1', '3', 'E90 ', 'N54 ', 'S', '4', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2729', 'PM76', '335I RL                  ', 'PM71', 'PM71', '1', '1', '3', 'E90 ', 'N54 ', 'S', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2730', 'PM77', '335I US                  ', 'PM73', 'PM73', '1', '1', '3', 'E90 ', 'N54 ', 'S', '4', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2731', 'PM81', '335I A                   ', 'PM81', 'PM81', '1', '1', '3', 'E90 ', 'N54 ', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2732', 'PM82', '335I RL A                ', 'PM81', 'PM81', '1', '1', '3', 'E90 ', 'N54 ', 'A', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2733', 'PM83', '335I US A                ', 'PM83', 'PM83', '1', '1', '3', 'E90 ', 'N54 ', 'A', '4', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2734', 'PM85', '335I A                   ', 'PM81', 'PM81', '1', '1', '3', 'E90 ', 'N54 ', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2735', 'PM86', '335I RL A                ', 'PM81', 'PM81', '1', '1', '3', 'E90 ', 'N54 ', 'A', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2736', 'PM87', '335I US A                ', 'PM83', 'PM83', '1', '1', '3', 'E90 ', 'N54 ', 'A', '4', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2737', 'PM91', 'M3                       ', 'PM91', 'PM91', '1', '1', 'M3', 'E90 ', 'S65 ', 'S', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2738', 'PM92', 'M3 RL                    ', 'PM91', 'PM91', '1', '1', 'M3', 'E90 ', 'S65 ', 'S', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2739', 'PM93', 'M3 US                    ', 'PM93', 'PM93', '1', '1', 'M3', 'E90 ', 'S65 ', 'S', '4', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2740', 'PN01', '325D A                   ', 'PN01', 'PN01', '1', '1', '3', 'E90 ', 'N57 ', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2741', 'PN02', '325D RL A                ', 'PN01', 'PN01', '1', '1', '3', 'E90 ', 'N57 ', 'A', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2742', 'PN11', '318D                     ', 'PN11', 'PN11', '1', '1', '3', 'E90 ', 'N47 ', 'S', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2743', 'PN12', '318D RL                  ', 'PN11', 'PN11', '1', '1', '3', 'E90 ', 'N47 ', 'S', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2744', 'PN21', '318D A                   ', 'PN21', 'PN21', '1', '1', '3', 'E90 ', 'N47 ', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2745', 'PN22', '318D RL A                ', 'PN21', 'PN21', '1', '1', '3', 'E90 ', 'N47 ', 'A', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2746', 'PN31', '320D                     ', 'PN31', 'PN31', '1', '1', '3', 'E90 ', 'N47 ', 'S', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2747', 'PN32', '320D RL                  ', 'PN31', 'PN31', '1', '1', '3', 'E90 ', 'N47 ', 'S', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2748', 'PN34', '320D SKD MYS             ', 'PN31', 'PN31', '1', '1', 'C3', 'E90 ', 'N47 ', 'S', '4', 'R', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2749', 'PN36', '320D RL                  ', 'PN31', 'PN31', '1', '1', '3', 'E90 ', 'N47 ', 'S', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2750', 'PN41', '320D A                   ', 'PN41', 'PN41', '1', '1', '3', 'E90 ', 'N47 ', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2751', 'PN42', '320D RL A                ', 'PN41', 'PN41', '1', '1', '3', 'E90 ', 'N47 ', 'A', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2752', 'PN44', '320D SKD MYS A           ', 'PN41', 'PN41', '1', '1', 'C3', 'E90 ', 'N47 ', 'A', '4', 'R', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2753', 'PN45', '320D A                   ', 'PN41', 'PN41', '1', '1', '3', 'E90 ', 'N47 ', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2754', 'PN46', '320D RL A                ', 'PN41', 'PN41', '1', '1', '3', 'E90 ', 'N47 ', 'A', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2755', 'PN47', '320D RL IND SKD A        ', 'PN41', 'PN41', '1', '1', 'I3', 'E90 ', 'N47 ', 'A', '4', 'R', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2756', 'PN48', '320D RL SKD THA A        ', 'PN41', 'PN41', '1', '1', 'T3', 'E90 ', 'N47 ', 'A', '4', 'R', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2757', 'PN51', '325D                     ', 'PN51', 'PN51', '1', '1', '3', 'E90 ', 'M57S', 'S', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2758', 'PN52', '325D RL                  ', 'PN51', 'PN51', '1', '1', '3', 'E90 ', 'M57S', 'S', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2759', 'PN61', '325D A                   ', 'PN61', 'PN61', '1', '1', '3', 'E90 ', 'M57S', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2760', 'PN62', '325D RL A                ', 'PN61', 'PN61', '1', '1', '3', 'E90 ', 'M57S', 'A', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2761', 'PN81', '335D A                   ', 'PN81', 'PN81', '1', '1', '3', 'E90 ', 'M57Y', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2762', 'PN82', '335D RL A                ', 'PN81', 'PN81', '1', '1', '3', 'E90 ', 'M57Y', 'A', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2763', 'PN83', '335D US A                ', 'PN83', 'PN83', '1', '1', '3', 'E90 ', 'M57Y', 'A', '4', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2764', 'PN91', '325D                     ', 'PN91', 'PN91', '1', '1', '3', 'E90 ', 'N57 ', 'S', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2765', 'PN92', '325D RL                  ', 'PN91', 'PN91', '1', '1', '3', 'E90 ', 'N57 ', 'S', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2766', 'PP01', '330D XDRIVE A            ', 'PP01', 'PP01', '1', '1', '3X', 'E90 ', 'N57 ', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2767', 'PP11', '320D                     ', 'PP11', 'PP11', '1', '1', '3', 'E90 ', 'N47T', 'S', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2768', 'PP12', '320D RL                  ', 'PP11', 'PP11', '1', '1', '3', 'E90 ', 'N47T', 'S', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2769', 'PP16', '320D RL                  ', 'PP11', 'PP11', '1', '1', '3', 'E90 ', 'N47T', 'S', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2770', 'PP17', '320D RL IND SKD          ', 'PP11', 'PP11', '1', '1', 'I3', 'E90 ', 'N47T', 'S', '4', 'R', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2771', 'PP21', '320D A                   ', 'PP21', 'PP21', '1', '1', '3', 'E90 ', 'N47T', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2772', 'PP22', '320D RL A                ', 'PP21', 'PP21', '1', '1', '3', 'E90 ', 'N47T', 'A', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2773', 'PP24', '320D RL SKD THA A        ', 'PP21', 'PP21', '1', '1', 'T3', 'E90 ', 'N47T', 'A', '4', 'R', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2774', 'PP25', '320D A                   ', 'PP21', 'PP21', '1', '1', '3', 'E90 ', 'N47T', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2775', 'PP26', '320D RL A                ', 'PP21', 'PP21', '1', '1', '3', 'E90 ', 'N47T', 'A', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2776', 'PP27', '320D RL IND SKD A        ', 'PP21', 'PP21', '1', '1', 'I3', 'E90 ', 'N47T', 'A', '4', 'R', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2777', 'PP31', '320D XDRIVE              ', 'PP31', 'PP31', '1', '1', '3X', 'E90 ', 'N47T', 'S', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2778', 'PP41', '320D XDRIVE A            ', 'PP41', 'PP41', '1', '1', '3X', 'E90 ', 'N47T', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2779', 'PP44', '320D MYS SKD A           ', 'PP21', 'PP21', '1', '1', 'C3', 'E90 ', 'N47T', 'A', '4', 'R', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2780', 'PP51', '320D EFFDYN EDITION      ', 'PP51', 'PP51', '1', '1', '3', 'E90 ', 'N47T', 'S', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2781', 'PP52', '320D EFFDYN EDITION      ', 'PP51', 'PP51', '1', '1', '3', 'E90 ', 'N47T', 'S', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2782', 'PP71', '320D XDRIVE              ', 'PP71', 'PP71', '1', '1', '3X', 'E90 ', 'N47 ', 'S', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2783', 'PP81', '320D XDRIVE A            ', 'PP81', 'PP81', '1', '1', '3X', 'E90 ', 'N47 ', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2784', 'PP91', '330D XDRIVE              ', 'PP91', 'PP91', '1', '1', '3X', 'E90 ', 'N57 ', 'S', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2785', 'PR01', '330D A                   ', 'PR01', 'PR01', '1', '1', '3', 'E90 ', 'N57 ', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2786', 'PR02', '330D RL A                ', 'PR01', 'PR01', '1', '1', '3', 'E90 ', 'N57 ', 'A', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2787', 'PR06', '330D RL A                ', 'PR01', 'PR01', '1', '1', '3', 'E90 ', 'N57 ', 'A', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2788', 'PR31', '316D                     ', 'PR31', 'PR31', '1', '1', '3', 'E90 ', 'N47 ', 'S', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2789', 'PR32', '316D RL                  ', 'PR31', 'PR31', '1', '1', '3', 'E90 ', 'N47 ', 'S', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2790', 'PR51', '316D                     ', 'PR51', 'PR51', '1', '1', '3', 'E90 ', 'N47T', 'S', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2791', 'PR52', '316D RL                  ', 'PR51', 'PR51', '1', '1', '3', 'E90 ', 'N47T', 'S', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2792', 'PR91', '330D                     ', 'PR91', 'PR91', '1', '1', '3', 'E90 ', 'N57 ', 'S', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2793', 'PR92', '330D RL                  ', 'PR91', 'PR91', '1', '1', '3', 'E90 ', 'N57 ', 'S', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2794', 'PR96', '330D RL                  ', 'PR91', 'PR91', '1', '1', '3', 'E90 ', 'N57 ', 'S', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2795', 'PS41', '318I A CBU CHN A         ', 'PS41', 'PS41', '1', '1', '3U', 'E90 ', 'N46T', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2796', 'PS61', '320I CHN CBU A           ', 'PS61', 'PS61', '1', '1', '3U', 'E90 ', 'N46T', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2797', 'PS81', '325I CHN A               ', 'PS81', 'PS81', '1', '1', '3U', 'E90 ', 'N52K', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2798', 'PT11', '520I TO                  ', 'PT11', 'PT11', '1', '1', '5', 'E61 ', 'N43 ', 'S', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2799', 'PT21', '520I TO A                ', 'PT21', 'PT21', '1', '1', '5', 'E61 ', 'N43 ', 'A', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2800', 'PT22', '520I RL TO A             ', 'PT21', 'PT21', '1', '1', '5', 'E61 ', 'N43 ', 'A', '5', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2801', 'PT73', '535I XDRIVE TO           ', 'PT73', 'PT73', '1', '1', '5X', 'E61 ', 'N54 ', 'S', '5', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2802', 'PT83', '535I XDRIVE TO A         ', 'PT83', 'PT83', '1', '1', '5X', 'E61 ', 'N54 ', 'A', '5', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2803', 'PU01', '530I TO A                ', 'PU01', 'PU01', '1', '1', '5', 'E61 ', 'N52K', 'A', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2804', 'PU02', '530I RL TO A             ', 'PU01', 'PU01', '1', '1', '5', 'E61 ', 'N52K', 'A', '5', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2805', 'PU21', '523I TO A                ', 'PU21', 'PU21', '1', '1', '5', 'E61 ', 'N52K', 'A', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2806', 'PU22', '523I RL TO A             ', 'PU21', 'PU21', '1', '1', '5', 'E61 ', 'N52K', 'A', '5', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2807', 'PU31', '523I TO                  ', 'PU31', 'PU31', '1', '1', '5', 'E61 ', 'N53 ', 'S', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2808', 'PU32', '523I RL TO               ', 'PU31', 'PU31', '1', '1', '5', 'E61 ', 'N53 ', 'S', '5', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2809', 'PU41', '523I TO A                ', 'PU41', 'PU41', '1', '1', '5', 'E61 ', 'N53 ', 'A', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2810', 'PU42', '523I RL TO A             ', 'PU41', 'PU41', '1', '1', '5', 'E61 ', 'N53 ', 'A', '5', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2811', 'PU51', '525I TO                  ', 'PU51', 'PU51', '1', '1', '5', 'E61 ', 'N52K', 'S', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2812', 'PU61', '525I TO A                ', 'PU61', 'PU61', '1', '1', '5', 'E61 ', 'N52K', 'A', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2813', 'PU62', '525I RL TO A             ', 'PU61', 'PU61', '1', '1', '5', 'E61 ', 'N52K', 'A', '5', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2814', 'PU71', '525I TO                  ', 'PU71', 'PU71', '1', '1', '5', 'E61 ', 'N53 ', 'S', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2815', 'PU72', '525I RL TO               ', 'PU71', 'PU71', '1', '1', '5', 'E61 ', 'N53 ', 'S', '5', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2816', 'PU81', '525I TO A                ', 'PU81', 'PU81', '1', '1', '5', 'E61 ', 'N53 ', 'A', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2817', 'PU82', '525I RL TO A             ', 'PU81', 'PU81', '1', '1', '5', 'E61 ', 'N53 ', 'A', '5', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2818', 'PU91', '530I TO                  ', 'PU91', 'PU91', '1', '1', '5', 'E61 ', 'N52K', 'S', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2819', 'PV31', '525I XDRIVE TO           ', 'PV31', 'PV31', '1', '1', '5X', 'E61 ', 'N53 ', 'S', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2820', 'PV41', '525I XDRIVE TO A         ', 'PV41', 'PV41', '1', '1', '5X', 'E61 ', 'N53 ', 'A', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2821', 'PV51', '530I XDRIVE TO           ', 'PV51', 'PV51', '1', '1', '5X', 'E61 ', 'N52K', 'S', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2822', 'PV61', '530I XDRIVE TO A         ', 'PV61', 'PV61', '1', '1', '5X', 'E61 ', 'N52K', 'A', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2823', 'PV71', '530I XDRIVE TO           ', 'PV71', 'PV71', '1', '1', '5X', 'E61 ', 'N53 ', 'S', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2824', 'PV81', '530I XDRIVE TO A         ', 'PV81', 'PV81', '1', '1', '5X', 'E61 ', 'N53 ', 'A', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2825', 'PV91', 'M5 TO                    ', 'PV91', 'PV91', '1', '1', 'M5', 'E61 ', 'S85 ', 'S', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2826', 'PV92', 'M5 RL TO                 ', 'PV91', 'PV91', '1', '1', 'M5', 'E61 ', 'S85 ', 'S', '5', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2827', 'PW51', '550I TO                  ', 'PW51', 'PW51', '1', '1', '5', 'E61 ', 'N62T', 'S', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2828', 'PW52', '550I RL TO               ', 'PW51', 'PW51', '1', '1', '5', 'E61 ', 'N62T', 'S', '5', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2829', 'PW61', '550I TO A                ', 'PW61', 'PW61', '1', '1', '5', 'E61 ', 'N62T', 'A', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2830', 'PW62', '550I RL TO A             ', 'PW61', 'PW61', '1', '1', '5', 'E61 ', 'N62T', 'A', '5', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2831', 'PX01', '535D TO A                ', 'PX01', 'PX01', '1', '1', '5', 'E61 ', 'M57Y', 'A', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2832', 'PX02', '535D RL TO A             ', 'PX01', 'PX01', '1', '1', '5', 'E61 ', 'M57Y', 'A', '5', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2833', 'PX11', '520D TO                  ', 'PX11', 'PX11', '1', '1', '5', 'E61 ', 'M47S', 'S', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2834', 'PX12', '520D RL TO               ', 'PX11', 'PX11', '1', '1', '5', 'E61 ', 'M47S', 'S', '5', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2835', 'PX21', '520D TO A                ', 'PX21', 'PX21', '1', '1', '5', 'E61 ', 'M47S', 'A', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2836', 'PX22', '520D RL TO A             ', 'PX21', 'PX21', '1', '1', '5', 'E61 ', 'M47S', 'A', '5', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2837', 'PX31', '520D TO                  ', 'PX31', 'PX31', '1', '1', '5', 'E61 ', 'N47 ', 'S', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2838', 'PX32', '520D RL TO               ', 'PX31', 'PX31', '1', '1', '5', 'E61 ', 'N47 ', 'S', '5', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2839', 'PX41', '520D TO A                ', 'PX41', 'PX41', '1', '1', '5', 'E61 ', 'N47 ', 'A', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2840', 'PX42', '520D RL TO A             ', 'PX41', 'PX41', '1', '1', '5', 'E61 ', 'N47 ', 'A', '5', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2841', 'PX51', '525D TO                  ', 'PX51', 'PX51', '1', '1', '5', 'E61 ', 'M57S', 'S', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2842', 'PX52', '525D RL TO               ', 'PX51', 'PX51', '1', '1', '5', 'E61 ', 'M57S', 'S', '5', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2843', 'PX61', '525D TO A                ', 'PX61', 'PX61', '1', '1', '5', 'E61 ', 'M57S', 'A', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2844', 'PX62', '525D RL TO A             ', 'PX61', 'PX61', '1', '1', '5', 'E61 ', 'M57S', 'A', '5', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2845', 'PX71', '530D TO                  ', 'PX71', 'PX71', '1', '1', '5', 'E61 ', 'M57S', 'S', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2846', 'PX72', '530D RL TO               ', 'PX71', 'PX71', '1', '1', '5', 'E61 ', 'M57S', 'S', '5', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2847', 'PX81', '530D TO A                ', 'PX81', 'PX81', '1', '1', '5', 'E61 ', 'M57S', 'A', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2848', 'PX82', '530D RL TO A             ', 'PX81', 'PX81', '1', '1', '5', 'E61 ', 'M57S', 'A', '5', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2849', 'PY51', '525D XDRIVE TO           ', 'PY51', 'PY51', '1', '1', '5X', 'E61 ', 'M57S', 'S', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2850', 'PY61', '525D XDRIVE TO A         ', 'PY61', 'PY61', '1', '1', '5X', 'E61 ', 'M57S', 'A', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2851', 'PY71', '530D XDRIVE TO           ', 'PY71', 'PY71', '1', '1', '5X', 'E61 ', 'M57S', 'S', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2852', 'PY81', '530D XDRIVE TO A         ', 'PY81', 'PY81', '1', '1', '5X', 'E61 ', 'M57S', 'A', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2853', 'PZ21', '520LI A CHN A            ', 'PZ21', 'PZ21', '1', '1', '5C', 'E60 ', 'N46T', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2854', 'PZ41', '523LI A CHN A            ', 'PZ41', 'PZ41', '1', '1', '5C', 'E60 ', 'N52K', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2855', 'PZ61', '525LI A CHN A            ', 'PZ61', 'PZ61', '1', '1', '5C', 'E60 ', 'N52K', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2856', 'PZ81', '530LI A CHN A            ', 'PZ81', 'PZ81', '1', '1', '5C', 'E60 ', 'N52K', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2857', 'RJ51', 'COOPER D                 ', 'RJ51', 'RJ51', '1', '1', 'RM', 'R61 ', 'N47T', 'S', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2858', 'RJ52', 'COOPER D                 ', 'RJ51', 'RJ51', '1', '1', 'RM', 'R61 ', 'N47T', 'S', '2', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2859', 'RJ81', 'COOPER ALL4 A            ', 'RJ81', 'RJ81', '1', '1', 'RY', 'R61 ', 'N18 ', 'A', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2860', 'RS01', 'COOPER SD ALL4 A         ', 'RS01', 'RS01', '1', '1', 'QS', 'R61 ', 'N47T', 'A', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2861', 'RS02', 'COOPER SD ALL4 A         ', 'RS01', 'RS01', '1', '1', 'QS', 'R61 ', 'N47T', 'A', '2', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2862', 'RS21', 'COOPER D A               ', 'RS21', 'RS21', '1', '1', 'RM', 'R61 ', 'N47T', 'A', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2863', 'RS41', 'COOPER D ALL4 A          ', 'RS41', 'RS41', '1', '1', 'RG', 'R61 ', 'N47T', 'A', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2864', 'RS42', 'COOPER D ALL4 A          ', 'RS41', 'RS41', '1', '1', 'RG', 'R61 ', 'N47T', 'A', '2', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2865', 'RS51', 'COOPER D ALL4            ', 'RS51', 'RS51', '1', '1', 'RG', 'R61 ', 'N47T', 'S', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2866', 'RS52', 'COOPER D ALL4            ', 'RS51', 'RS51', '1', '1', 'RG', 'R61 ', 'N47T', 'S', '2', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2867', 'RS71', 'COOPER SD                ', 'RS71', 'RS71', '1', '1', 'RM', 'R61 ', 'N47T', 'S', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2868', 'RS72', 'COOPER SD                ', 'RS71', 'RS71', '1', '1', 'RM', 'R61 ', 'N47T', 'S', '2', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2869', 'RS81', 'COOPER SD A              ', 'RS81', 'RS81', '1', '1', 'RM', 'R61 ', 'N47T', 'A', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2870', 'RS91', 'COOPER SD ALL4           ', 'RS91', 'RS91', '1', '1', 'QS', 'R61 ', 'N47T', 'S', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2871', 'RS92', 'COOPER SD ALL4           ', 'RS91', 'RS91', '1', '1', 'QS', 'R61 ', 'N47T', 'S', '2', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2872', 'SN01', '550I GT                  ', 'SN01', 'SN01', '1', '1', 'GT', 'F07 ', 'N63T', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2873', 'SN02', '550I GT RL               ', 'SN01', 'SN01', '1', '1', 'GT', 'F07 ', 'N63T', 'A', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2874', 'SN03', '550I GT US               ', 'SN03', 'SN03', '1', '1', 'GT', 'F07 ', 'N63T', 'A', '4', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2875', 'SN21', '535I                     ', 'SN21', 'SN21', '1', '1', 'GT', 'F07 ', 'N55 ', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2876', 'SN22', '535I RL                  ', 'SN21', 'SN21', '1', '1', 'GT', 'F07 ', 'N55 ', 'A', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2877', 'SN23', '535I US                  ', 'SN23', 'SN23', '1', '1', 'GT', 'F07 ', 'N55 ', 'A', '4', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2878', 'SN41', '550I                     ', 'SN41', 'SN41', '1', '1', 'GT', 'F07 ', 'N63 ', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2879', 'SN42', '550I RL                  ', 'SN41', 'SN41', '1', '1', 'GT', 'F07 ', 'N63 ', 'A', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2880', 'SN43', '550I US                  ', 'SN43', 'SN43', '1', '1', 'GT', 'F07 ', 'N63 ', 'A', '4', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2881', 'SN61', '530D                     ', 'SN61', 'SN61', '1', '1', 'GT', 'F07 ', 'N57 ', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2882', 'SN62', '530D RL                  ', 'SN61', 'SN61', '1', '1', 'GT', 'F07 ', 'N57 ', 'A', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2883', 'SN81', '535D                     ', 'SN81', 'SN81', '1', '1', 'GT', 'F07 ', 'N57S', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2884', 'SN82', '535D RL                  ', 'SN81', 'SN81', '1', '1', 'GT', 'F07 ', 'N57S', 'A', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2885', 'SP01', '550I GT XDRIVE           ', 'SP01', 'SP01', '1', '1', 'GX', 'F07 ', 'N63T', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2886', 'SP03', '550I GT XDRIVE US        ', 'SP03', 'SP03', '1', '1', 'GX', 'F07 ', 'N63T', 'A', '4', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2887', 'SP21', '535I XDRIVE              ', 'SP21', 'SP21', '1', '1', 'GX', 'F07 ', 'N55 ', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2888', 'SP23', '535I XDRIVE US           ', 'SP23', 'SP23', '1', '1', 'GX', 'F07 ', 'N55 ', 'A', '4', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2889', 'SP41', '550I XDRIVE              ', 'SP41', 'SP41', '1', '1', 'GX', 'F07 ', 'N63 ', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2890', 'SP43', '550I XDRIVE US           ', 'SP43', 'SP43', '1', '1', 'GX', 'F07 ', 'N63 ', 'A', '4', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2891', 'SP61', '530D XDRIVE              ', 'SP61', 'SP61', '1', '1', 'GX', 'F07 ', 'N57 ', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2892', 'SP81', '535D XDRIVE              ', 'SP81', 'SP81', '1', '1', 'GX', 'F07 ', 'N57S', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2893', 'SS01', 'JOHN COOPER WORKS A      ', 'SS01', 'SS01', '1', '1', 'QS', 'R61 ', 'N18 ', 'A', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2894', 'SS02', 'JOHN COOPER WORKS A      ', 'SS01', 'SS01', '1', '1', 'QS', 'R61 ', 'N18 ', 'A', '2', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2895', 'SS03', 'JOHN COOPER WORKS A      ', 'SS03', 'SS03', '1', '1', 'QS', 'R61 ', 'N18 ', 'A', '2', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2896', 'SS11', 'COOPER                   ', 'SS11', 'SS11', '1', '1', 'RM', 'R61 ', 'N16 ', 'S', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2897', 'SS12', 'COOPER                   ', 'SS11', 'SS11', '1', '1', 'RM', 'R61 ', 'N16 ', 'S', '2', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2898', 'SS13', 'COOPER                   ', 'SS13', 'SS13', '1', '1', 'RM', 'R61 ', 'N16 ', 'S', '2', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2899', 'SS21', 'COOPER A                 ', 'SS21', 'SS21', '1', '1', 'RM', 'R61 ', 'N16 ', 'A', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2900', 'SS22', 'COOPER A                 ', 'SS21', 'SS21', '1', '1', 'RM', 'R61 ', 'N16 ', 'A', '2', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2901', 'SS23', 'COOPER A                 ', 'SS23', 'SS23', '1', '1', 'RM', 'R61 ', 'N16 ', 'A', '2', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2902', 'SS51', 'COOPER S                 ', 'SS51', 'SS51', '1', '1', 'RM', 'R61 ', 'N18 ', 'S', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2903', 'SS52', 'COOPER S                 ', 'SS51', 'SS51', '1', '1', 'RM', 'R61 ', 'N18 ', 'S', '2', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2904', 'SS53', 'COOPER S                 ', 'SS53', 'SS53', '1', '1', 'RM', 'R61 ', 'N18 ', 'S', '2', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2905', 'SS61', 'COOPER S A               ', 'SS61', 'SS61', '1', '1', 'RM', 'R61 ', 'N18 ', 'A', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2906', 'SS62', 'COOPER S A               ', 'SS61', 'SS61', '1', '1', 'RM', 'R61 ', 'N18 ', 'A', '2', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2907', 'SS63', 'COOPER S A               ', 'SS63', 'SS63', '1', '1', 'RM', 'R61 ', 'N18 ', 'A', '2', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2908', 'SS71', 'COOPER S ALL4            ', 'SS71', 'SS71', '1', '1', 'RQ', 'R61 ', 'N18 ', 'S', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2909', 'SS72', 'COOPER S ALL4            ', 'SS71', 'SS71', '1', '1', 'RQ', 'R61 ', 'N18 ', 'S', '2', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2910', 'SS73', 'COOPER S ALL4            ', 'SS73', 'SS73', '1', '1', 'RQ', 'R61 ', 'N18 ', 'S', '2', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2911', 'SS81', 'COOPER S ALL4 A          ', 'SS81', 'SS81', '1', '1', 'RQ', 'R61 ', 'N18 ', 'A', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2912', 'SS82', 'COOPER S ALL4 A          ', 'SS81', 'SS81', '1', '1', 'RQ', 'R61 ', 'N18 ', 'A', '2', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2913', 'SS83', 'COOPER S ALL4 A          ', 'SS83', 'SS83', '1', '1', 'RQ', 'R61 ', 'N18 ', 'A', '2', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2914', 'SS91', 'JOHN COOPER WORKS        ', 'SS91', 'SS91', '1', '1', 'QS', 'R61 ', 'N18 ', 'S', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2915', 'SS92', 'JOHN COOPER WORKS        ', 'SS91', 'SS91', '1', '1', 'QS', 'R61 ', 'N18 ', 'S', '2', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2916', 'SS93', 'JOHN COOPER WORKS        ', 'SS93', 'SS93', '1', '1', 'QS', 'R61 ', 'N18 ', 'S', '2', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2917', 'SZ01', '530D                     ', 'SZ01', 'SZ01', '1', '1', 'GT', 'F07 ', 'N57 ', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2918', 'SZ02', '525D RL                  ', 'SZ01', 'SZ01', '1', '1', 'GT', 'F07 ', 'N57 ', 'A', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2919', 'SZ41', '550I XDRIVE              ', 'SZ41', 'SZ41', '1', '1', 'GX', 'F07 ', 'N63T', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2920', 'SZ61', '528I                     ', 'SZ61', 'SZ61', '1', '1', 'GT', 'F07 ', 'N20 ', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2921', 'SZ62', '528I RL                  ', 'SZ61', 'SZ61', '1', '1', 'GT', 'F07 ', 'N20 ', 'A', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2922', 'UA11', '116I                     ', 'UA11', 'UA11', '1', '1', '1', 'E81 ', 'N45T', 'S', '3', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2923', 'UA12', '116I RL                  ', 'UA11', 'UA11', '1', '1', '1', 'E81 ', 'N45T', 'S', '3', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2924', 'UA21', '116I A                   ', 'UA21', 'UA21', '1', '1', '1', 'E81 ', 'N45T', 'A', '3', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2925', 'UA31', '118I                     ', 'UA31', 'UA31', '1', '1', '1', 'E81 ', 'N46T', 'S', '3', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2926', 'UA32', '118I RL                  ', 'UA31', 'UA31', '1', '1', '1', 'E81 ', 'N46T', 'S', '3', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2927', 'UA41', '118I A                   ', 'UA41', 'UA41', '1', '1', '1', 'E81 ', 'N46T', 'A', '3', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2928', 'UA42', '118I RL A                ', 'UA41', 'UA41', '1', '1', '1', 'E81 ', 'N46T', 'A', '3', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2929', 'UA51', '120I                     ', 'UA51', 'UA51', '1', '1', '1', 'E81 ', 'N46T', 'S', '3', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2930', 'UA52', '120I RL                  ', 'UA51', 'UA51', '1', '1', '1', 'E81 ', 'N46T', 'S', '3', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2931', 'UA61', '120I A                   ', 'UA61', 'UA61', '1', '1', '1', 'E81 ', 'N46T', 'A', '3', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2932', 'UA62', '120I RL A                ', 'UA61', 'UA61', '1', '1', '1', 'E81 ', 'N46T', 'A', '3', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2933', 'UA71', '120I                     ', 'UA71', 'UA71', '1', '1', '1', 'E81 ', 'N43 ', 'S', '3', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2934', 'UA72', '120I RL                  ', 'UA71', 'UA71', '1', '1', '1', 'E81 ', 'N43 ', 'S', '3', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2935', 'UA81', '120I A                   ', 'UA81', 'UA81', '1', '1', '1', 'E81 ', 'N43 ', 'A', '3', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2936', 'UA82', '120I RL A                ', 'UA81', 'UA81', '1', '1', '1', 'E81 ', 'N43 ', 'A', '3', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2937', 'UB01', '118I A                   ', 'UB01', 'UB01', '1', '1', '1', 'E81 ', 'N43 ', 'A', '3', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2938', 'UB02', '118I RL A                ', 'UB01', 'UB01', '1', '1', '1', 'E81 ', 'N43 ', 'A', '3', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2939', 'UB11', '130I                     ', 'UB11', 'UB11', '1', '1', '1', 'E81 ', 'N52K', 'S', '3', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2940', 'UB12', '130I RL                  ', 'UB11', 'UB11', '1', '1', '1', 'E81 ', 'N52K', 'S', '3', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2941', 'UB21', '130I A                   ', 'UB21', 'UB21', '1', '1', '1', 'E81 ', 'N52K', 'A', '3', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2942', 'UB22', '130I RL A                ', 'UB21', 'UB21', '1', '1', '1', 'E81 ', 'N52K', 'A', '3', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2943', 'UB31', '118D                     ', 'UB31', 'UB31', '1', '1', '1', 'E81 ', 'N47 ', 'S', '3', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2944', 'UB32', '118D RL                  ', 'UB31', 'UB31', '1', '1', '1', 'E81 ', 'N47 ', 'S', '3', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2945', 'UB41', '118D A                   ', 'UB41', 'UB41', '1', '1', '1', 'E81 ', 'N47 ', 'A', '3', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2946', 'UB42', '118D RL A                ', 'UB41', 'UB41', '1', '1', '1', 'E81 ', 'N47 ', 'A', '3', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2947', 'UB51', '120D                     ', 'UB51', 'UB51', '1', '1', '1', 'E81 ', 'N47 ', 'S', '3', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2948', 'UB52', '120D RL                  ', 'UB51', 'UB51', '1', '1', '1', 'E81 ', 'N47 ', 'S', '3', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2949', 'UB61', '120D A                   ', 'UB61', 'UB61', '1', '1', '1', 'E81 ', 'N47 ', 'A', '3', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2950', 'UB62', '120D RL A                ', 'UB61', 'UB61', '1', '1', '1', 'E81 ', 'N47 ', 'A', '3', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2951', 'UB71', '116I                     ', 'UB71', 'UB71', '1', '1', '1', 'E81 ', 'N43 ', 'S', '3', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2952', 'UB72', '116I RL                  ', 'UB71', 'UB71', '1', '1', '1', 'E81 ', 'N43 ', 'S', '3', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2953', 'UB81', '116I A                   ', 'UB81', 'UB81', '1', '1', '1', 'E81 ', 'N43 ', 'A', '3', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2954', 'UB82', '116I RL A                ', 'UB81', 'UB81', '1', '1', '1', 'E81 ', 'N43 ', 'A', '3', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2955', 'UB91', '118I                     ', 'UB91', 'UB91', '1', '1', '1', 'E81 ', 'N43 ', 'S', '3', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2956', 'UB92', '118I RL                  ', 'UB91', 'UB91', '1', '1', '1', 'E81 ', 'N43 ', 'S', '3', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2957', 'UC11', '120I                     ', 'UC11', 'UC11', '1', '1', '1', 'E82 ', 'N43 ', 'S', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2958', 'UC12', '120I RL                  ', 'UC11', 'UC11', '1', '1', '1', 'E82 ', 'N43 ', 'S', '2', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2959', 'UC21', '120I A                   ', 'UC21', 'UC21', '1', '1', '1', 'E82 ', 'N43 ', 'A', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2960', 'UC22', '120I RL A                ', 'UC21', 'UC21', '1', '1', '1', 'E82 ', 'N43 ', 'A', '2', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2961', 'UC31', '125I                     ', 'UC31', 'UC31', '1', '1', '1', 'E82 ', 'N52K', 'S', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2962', 'UC32', '125I RL                  ', 'UC31', 'UC31', '1', '1', '1', 'E82 ', 'N52K', 'S', '2', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2963', 'UC41', '125I A                   ', 'UC41', 'UC41', '1', '1', '1', 'E82 ', 'N52K', 'A', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2964', 'UC42', '125I RL A                ', 'UC41', 'UC41', '1', '1', '1', 'E82 ', 'N52K', 'A', '2', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2965', 'UC51', '120I                     ', 'UC51', 'UC51', '1', '1', '1', 'E82 ', 'N46T', 'S', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2966', 'UC52', '120I RL                  ', 'UC51', 'UC51', '1', '1', '1', 'E82 ', 'N46T', 'S', '2', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2967', 'UC61', '120I A                   ', 'UC61', 'UC61', '1', '1', '1', 'E82 ', 'N46T', 'A', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2968', 'UC62', '120I RL A                ', 'UC61', 'UC61', '1', '1', '1', 'E82 ', 'N46T', 'A', '2', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2969', 'UC71', '135I                     ', 'UC71', 'UC71', '1', '1', '1', 'E82 ', 'N54 ', 'S', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2970', 'UC72', '135I RL                  ', 'UC71', 'UC71', '1', '1', '1', 'E82 ', 'N54 ', 'S', '2', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2971', 'UC73', '135I US                  ', 'UC73', 'UC73', '1', '1', '1', 'E82 ', 'N54 ', 'S', '2', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2972', 'UC81', '135I A                   ', 'UC81', 'UC81', '1', '1', '1', 'E82 ', 'N54 ', 'A', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2973', 'UC82', '135I RL A                ', 'UC81', 'UC81', '1', '1', '1', 'E82 ', 'N54 ', 'A', '2', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2974', 'UC83', '135I US A                ', 'UC83', 'UC83', '1', '1', '1', 'E82 ', 'N54 ', 'A', '2', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2975', 'UC91', '135I                     ', 'UC91', 'UC91', '1', '1', '1', 'E82 ', 'N55 ', 'S', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2976', 'UC92', '135I RL                  ', 'UC91', 'UC91', '1', '1', '1', 'E82 ', 'N55 ', 'S', '2', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2977', 'UC93', '135I US                  ', 'UC93', 'UC93', '1', '1', '1', 'E82 ', 'N55 ', 'S', '2', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2978', 'UD01', '120D A                   ', 'UD01', 'UD01', '1', '1', '1', 'E87 ', 'N47 ', 'A', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2979', 'UD02', '120D RL A                ', 'UD01', 'UD01', '1', '1', '1', 'E87 ', 'N47 ', 'A', '5', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2980', 'UD11', '120I                     ', 'UD11', 'UD11', '1', '1', '1', 'E87 ', 'N43 ', 'S', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2981', 'UD12', '120I RL                  ', 'UD11', 'UD11', '1', '1', '1', 'E87 ', 'N43 ', 'S', '5', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2982', 'UD21', '120I A                   ', 'UD21', 'UD21', '1', '1', '1', 'E87 ', 'N43 ', 'A', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2983', 'UD22', '120I RL A                ', 'UD21', 'UD21', '1', '1', '1', 'E87 ', 'N43 ', 'A', '5', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2984', 'UD31', '120I                     ', 'UD31', 'UD31', '1', '1', '1', 'E87 ', 'N46T', 'S', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2985', 'UD32', '120I RL                  ', 'UD31', 'UD31', '1', '1', '1', 'E87 ', 'N46T', 'S', '5', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2986', 'UD41', '120I A                   ', 'UD41', 'UD41', '1', '1', '1', 'E87 ', 'N46T', 'A', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2987', 'UD42', '120I RL A                ', 'UD41', 'UD41', '1', '1', '1', 'E87 ', 'N46T', 'A', '5', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2988', 'UD51', '130I                     ', 'UD51', 'UD51', '1', '1', '1', 'E87 ', 'N52K', 'S', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2989', 'UD52', '130I RL                  ', 'UD51', 'UD51', '1', '1', '1', 'E87 ', 'N52K', 'S', '5', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2990', 'UD61', '130I A                   ', 'UD61', 'UD61', '1', '1', '1', 'E87 ', 'N52K', 'A', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2991', 'UD62', '130I RL A                ', 'UD61', 'UD61', '1', '1', '1', 'E87 ', 'N52K', 'A', '5', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2992', 'UD71', '118D                     ', 'UD71', 'UD71', '1', '1', '1', 'E87 ', 'N47 ', 'S', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2993', 'UD72', '118D RL                  ', 'UD71', 'UD71', '1', '1', '1', 'E87 ', 'N47 ', 'S', '5', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2994', 'UD81', '118D A                   ', 'UD81', 'UD81', '1', '1', '1', 'E87 ', 'N47 ', 'A', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2995', 'UD82', '118D RL A                ', 'UD81', 'UD81', '1', '1', '1', 'E87 ', 'N47 ', 'A', '5', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2996', 'UD91', '120D                     ', 'UD91', 'UD91', '1', '1', '1', 'E87 ', 'N47 ', 'S', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2997', 'UD92', '120D RL                  ', 'UD91', 'UD91', '1', '1', '1', 'E87 ', 'N47 ', 'S', '5', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2998', 'UE11', '116I                     ', 'UE11', 'UE11', '1', '1', '1', 'E87 ', 'N45T', 'S', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('2999', 'UE12', '116I RL                  ', 'UE11', 'UE11', '1', '1', '1', 'E87 ', 'N45T', 'S', '5', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3000', 'UE21', '116I A                   ', 'UE21', 'UE21', '1', '1', '1', 'E87 ', 'N45T', 'A', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3001', 'UE22', '116I RL A                ', 'UE21', 'UE21', '1', '1', '1', 'E87 ', 'N45T', 'A', '5', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3002', 'UE31', '116I                     ', 'UE31', 'UE31', '1', '1', '1', 'E87 ', 'N43 ', 'S', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3003', 'UE32', '116I RL                  ', 'UE31', 'UE31', '1', '1', '1', 'E87 ', 'N43 ', 'S', '5', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3004', 'UE41', '116I A                   ', 'UE41', 'UE41', '1', '1', '1', 'E87 ', 'N43 ', 'A', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3005', 'UE42', '116I RL A                ', 'UE41', 'UE41', '1', '1', '1', 'E87 ', 'N43 ', 'A', '5', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3006', 'UE51', '118I                     ', 'UE51', 'UE51', '1', '1', '1', 'E87 ', 'N43 ', 'S', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3007', 'UE52', '118I RL                  ', 'UE51', 'UE51', '1', '1', '1', 'E87 ', 'N43 ', 'S', '5', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3008', 'UE61', '118I A                   ', 'UE61', 'UE61', '1', '1', '1', 'E87 ', 'N43 ', 'A', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3009', 'UE62', '118I RL A                ', 'UE61', 'UE61', '1', '1', '1', 'E87 ', 'N43 ', 'A', '5', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3010', 'UE71', '118I                     ', 'UE71', 'UE71', '1', '1', '1', 'E87 ', 'N46T', 'S', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3011', 'UE72', '118I RL                  ', 'UE71', 'UE71', '1', '1', '1', 'E87 ', 'N46T', 'S', '5', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3012', 'UE81', '118I A                   ', 'UE81', 'UE81', '1', '1', '1', 'E87 ', 'N46T', 'A', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3013', 'UE82', '118I RL A                ', 'UE81', 'UE81', '1', '1', '1', 'E87 ', 'N46T', 'A', '5', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3014', 'UF01', '130I A                   ', 'UF01', 'UF01', '1', '1', '1', 'E87 ', 'N52 ', 'A', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3015', 'UF02', '130I RL A                ', 'UF01', 'UF01', '1', '1', '1', 'E87 ', 'N52 ', 'A', '5', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3016', 'UF11', '116I                     ', 'UF11', 'UF11', '1', '1', '1', 'E87 ', 'N45 ', 'S', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3017', 'UF12', '116I RL                  ', 'UF11', 'UF11', '1', '1', '1', 'E87 ', 'N45 ', 'S', '5', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3018', 'UF21', '116I A                   ', 'UF21', 'UF21', '1', '1', '1', 'E87 ', 'N45 ', 'A', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3019', 'UF22', '116I RL A                ', 'UF21', 'UF21', '1', '1', '1', 'E87 ', 'N45 ', 'A', '5', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3020', 'UF31', '118I                     ', 'UF31', 'UF31', '1', '1', '1', 'E87 ', 'N46 ', 'S', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3021', 'UF32', '118I RL                  ', 'UF31', 'UF31', '1', '1', '1', 'E87 ', 'N46 ', 'S', '5', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3022', 'UF41', '118I A                   ', 'UF41', 'UF41', '1', '1', '1', 'E87 ', 'N46 ', 'A', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3023', 'UF42', '118I RL A                ', 'UF41', 'UF41', '1', '1', '1', 'E87 ', 'N46 ', 'A', '5', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3024', 'UF51', '120I                     ', 'UF51', 'UF51', '1', '1', '1', 'E87 ', 'N46 ', 'S', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3025', 'UF52', '120I RL                  ', 'UF51', 'UF51', '1', '1', '1', 'E87 ', 'N46 ', 'S', '5', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3026', 'UF61', '120I A                   ', 'UF61', 'UF61', '1', '1', '1', 'E87 ', 'N46 ', 'A', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3027', 'UF62', '120I RL A                ', 'UF61', 'UF61', '1', '1', '1', 'E87 ', 'N46 ', 'A', '5', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3028', 'UF91', '130I                     ', 'UF91', 'UF91', '1', '1', '1', 'E87 ', 'N52 ', 'S', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3029', 'UF92', '130I RL                  ', 'UF91', 'UF91', '1', '1', '1', 'E87 ', 'N52 ', 'S', '5', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3030', 'UG31', '118D                     ', 'UG31', 'UG31', '1', '1', '1', 'E87 ', 'M47S', 'S', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3031', 'UG32', '118D RL                  ', 'UG31', 'UG31', '1', '1', '1', 'E87 ', 'M47S', 'S', '5', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3032', 'UG51', '120D                     ', 'UG51', 'UG51', '1', '1', '1', 'E87 ', 'M47S', 'S', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3033', 'UG52', '120D RL                  ', 'UG51', 'UG51', '1', '1', '1', 'E87 ', 'M47S', 'S', '5', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3034', 'UG61', '120D A                   ', 'UG61', 'UG61', '1', '1', '1', 'E87 ', 'M47S', 'A', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3035', 'UG62', '120D RL A                ', 'UG61', 'UG61', '1', '1', '1', 'E87 ', 'M47S', 'A', '5', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3036', 'UH11', '123D                     ', 'UH11', 'UH11', '1', '1', '1', 'E87 ', 'N47S', 'S', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3037', 'UH12', '123D RL                  ', 'UH11', 'UH11', '1', '1', '1', 'E87 ', 'N47S', 'S', '5', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3038', 'UH21', '123D A                   ', 'UH21', 'UH21', '1', '1', '1', 'E87 ', 'N47S', 'A', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3039', 'UH22', '123D RL A                ', 'UH21', 'UH21', '1', '1', '1', 'E87 ', 'N47S', 'A', '5', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3040', 'UH31', '116I                     ', 'UH31', 'UH31', '1', '1', '1', 'E87 ', 'N43 ', 'S', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3041', 'UH32', '116I RL                  ', 'UH31', 'UH31', '1', '1', '1', 'E87 ', 'N43 ', 'S', '5', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3042', 'UH41', '116I A                   ', 'UH41', 'UH41', '1', '1', '1', 'E87 ', 'N43 ', 'A', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3043', 'UH42', '116I RL A                ', 'UH41', 'UH41', '1', '1', '1', 'E87 ', 'N43 ', 'A', '5', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3044', 'UH51', '116D                     ', 'UH51', 'UH51', '1', '1', '1', 'E87 ', 'N47 ', 'S', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3045', 'UH52', '116D RL                  ', 'UH51', 'UH51', '1', '1', '1', 'E87 ', 'N47 ', 'S', '5', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3046', 'UK11', '123D                     ', 'UK11', 'UK11', '1', '1', '1', 'E81 ', 'N47S', 'S', '3', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3047', 'UK12', '123D RL                  ', 'UK11', 'UK11', '1', '1', '1', 'E81 ', 'N47S', 'S', '3', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3048', 'UK21', '123D A                   ', 'UK21', 'UK21', '1', '1', '1', 'E81 ', 'N47S', 'A', '3', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3049', 'UK22', '123D RL A                ', 'UK21', 'UK21', '1', '1', '1', 'E81 ', 'N47S', 'A', '3', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3050', 'UK31', '116I                     ', 'UK31', 'UK31', '1', '1', '1', 'E81 ', 'N43 ', 'S', '3', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3051', 'UK32', '116I RL                  ', 'UK31', 'UK31', '1', '1', '1', 'E81 ', 'N43 ', 'S', '3', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3052', 'UK41', '116I A                   ', 'UK41', 'UK41', '1', '1', '1', 'E81 ', 'N43 ', 'A', '3', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3053', 'UK42', '116I RL A                ', 'UK41', 'UK41', '1', '1', '1', 'E81 ', 'N43 ', 'A', '3', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3054', 'UK51', '116D                     ', 'UK51', 'UK51', '1', '1', '1', 'E81 ', 'N47 ', 'S', '3', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3055', 'UK52', '116D RL                  ', 'UB31', 'UB31', '1', '1', '1', 'E81 ', 'N47 ', 'S', '3', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3056', 'UL01', '125I A                   ', 'UL01', 'UL01', '1', '1', '1', 'E88 ', 'N52K', 'A', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3057', 'UL02', '125I RL A                ', 'UL01', 'UL01', '1', '1', '1', 'E88 ', 'N52K', 'A', '2', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3058', 'UL51', '120I                     ', 'UL51', 'UL51', '1', '1', '1', 'E88 ', 'N46T', 'S', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3059', 'UL52', '120I RL                  ', 'UL51', 'UL51', '1', '1', '1', 'E88 ', 'N46T', 'S', '2', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3060', 'UL61', '120I A                   ', 'UL61', 'UL61', '1', '1', '1', 'E88 ', 'N46T', 'A', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3061', 'UL62', '120I RL A                ', 'UL61', 'UL61', '1', '1', '1', 'E88 ', 'N46T', 'A', '2', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3062', 'UL73', '128I US                  ', 'UL73', 'UL73', '1', '1', '1', 'E88 ', 'N52K', 'S', '2', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3063', 'UL83', '128I US A                ', 'UL83', 'UL83', '1', '1', '1', 'E88 ', 'N52K', 'A', '2', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3064', 'UL91', '125I                     ', 'UL91', 'UL91', '1', '1', '1', 'E88 ', 'N52K', 'S', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3065', 'UL92', '125I RL                  ', 'UL91', 'UL91', '1', '1', '1', 'E88 ', 'N52K', 'S', '2', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3066', 'UM01', '118D A                   ', 'UM01', 'UM01', '1', '1', '1', 'E88 ', 'N47 ', 'A', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3067', 'UM02', '118D RL A                ', 'UM01', 'UM01', '1', '1', '1', 'E88 ', 'N47 ', 'A', '2', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3068', 'UM11', '118I                     ', 'UM11', 'UM11', '1', '1', '1', 'E88 ', 'N43 ', 'S', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3069', 'UM12', '118I RL                  ', 'UM11', 'UM11', '1', '1', '1', 'E88 ', 'N43 ', 'S', '2', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3070', 'UM21', '118I A                   ', 'UM21', 'UM21', '1', '1', '1', 'E88 ', 'N43 ', 'A', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3071', 'UM22', '118I RL A                ', 'UM21', 'UM21', '1', '1', '1', 'E88 ', 'N43 ', 'A', '2', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3072', 'UM31', '118I                     ', 'UM31', 'UM31', '1', '1', '1', 'E88 ', 'N46T', 'S', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3073', 'UM32', '118I RL                  ', 'UM31', 'UM31', '1', '1', '1', 'E88 ', 'N46T', 'S', '2', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3074', 'UM41', '118I A                   ', 'UM41', 'UM41', '1', '1', '1', 'E88 ', 'N46T', 'A', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3075', 'UM42', '118I RL A                ', 'UM41', 'UM41', '1', '1', '1', 'E88 ', 'N46T', 'A', '2', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3076', 'UM51', '120I                     ', 'UM51', 'UM51', '1', '1', '1', 'E88 ', 'N43 ', 'S', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3077', 'UM52', '120I RL                  ', 'UM51', 'UM51', '1', '1', '1', 'E88 ', 'N43 ', 'S', '2', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3078', 'UM61', '120I A                   ', 'UM61', 'UM61', '1', '1', '1', 'E88 ', 'N43 ', 'A', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3079', 'UM62', '120I RL A                ', 'UM61', 'UM61', '1', '1', '1', 'E88 ', 'N43 ', 'A', '2', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3080', 'UM71', '120D                     ', 'UM71', 'UM71', '1', '1', '1', 'E88 ', 'N47 ', 'S', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3081', 'UM72', '120D RL                  ', 'UM71', 'UM71', '1', '1', '1', 'E88 ', 'N47 ', 'S', '2', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3082', 'UM81', '120D A                   ', 'UM81', 'UM81', '1', '1', '1', 'E88 ', 'N47 ', 'A', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3083', 'UM82', '120D RL A                ', 'UM81', 'UM81', '1', '1', '1', 'E88 ', 'N47 ', 'A', '2', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3084', 'UM91', '118D                     ', 'UM91', 'UM91', '1', '1', '1', 'E88 ', 'N47 ', 'S', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3085', 'UM92', '118D RL                  ', 'UM91', 'UM91', '1', '1', '1', 'E88 ', 'N47 ', 'S', '2', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3086', 'UN01', '135I A                   ', 'UN01', 'UN01', '1', '1', '1', 'E88 ', 'N54 ', 'A', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3087', 'UN02', '135I RL A                ', 'UN01', 'UN01', '1', '1', '1', 'E88 ', 'N54 ', 'A', '2', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3088', 'UN03', '135I US A                ', 'UN03', 'UN03', '1', '1', '1', 'E88 ', 'N54 ', 'A', '2', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3089', 'UN13', '128I US                  ', 'UN13', 'UN13', '1', '1', '1', 'E88 ', 'N51 ', 'S', '2', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3090', 'UN23', '128I US A                ', 'UN23', 'UN23', '1', '1', '1', 'E88 ', 'N51 ', 'A', '2', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3091', 'UN71', '135I                     ', 'UN71', 'UN71', '1', '1', '1', 'E88 ', 'N55 ', 'S', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3092', 'UN72', '135I RL                  ', 'UN71', 'UN71', '1', '1', '1', 'E88 ', 'N55 ', 'S', '2', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3093', 'UN73', '135I US                  ', 'UN73', 'UN73', '1', '1', '1', 'E88 ', 'N55 ', 'S', '2', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3094', 'UN91', '135I                     ', 'UN91', 'UN91', '1', '1', '1', 'E88 ', 'N54 ', 'S', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3095', 'UN92', '135I RL                  ', 'UN91', 'UN91', '1', '1', '1', 'E88 ', 'N54 ', 'S', '2', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3096', 'UN93', '135I US                  ', 'UN93', 'UN93', '1', '1', '1', 'E88 ', 'N54 ', 'S', '2', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3097', 'UP03', '128I US A                ', 'UP03', 'UP03', '1', '1', '1', 'E82 ', 'N51 ', 'A', '2', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3098', 'UP11', '123D                     ', 'UP11', 'UP11', '1', '1', '1', 'E88 ', 'N47S', 'S', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3099', 'UP12', '123D RL                  ', 'UP11', 'UP11', '1', '1', '1', 'E88 ', 'N47S', 'S', '2', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3100', 'UP21', '123D A                   ', 'UP21', 'UP21', '1', '1', '1', 'E88 ', 'N47S', 'A', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3101', 'UP22', '123D RL A                ', 'UP21', 'UP21', '1', '1', '1', 'E88 ', 'N47S', 'A', '2', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3102', 'UP31', 'ACTIVE E                 ', 'UP31', 'UP31', '1', '1', 'E ', 'E82 ', 'IB1 ', 'S', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3103', 'UP33', 'ACTIVE E US              ', 'UP33', 'UP33', '1', '1', 'E ', 'E82 ', 'IB1 ', 'S', '2', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3104', 'UP73', '128I US                  ', 'UP73', 'UP73', '1', '1', '1', 'E82 ', 'N52K', 'S', '2', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3105', 'UP83', '128I US A                ', 'UP83', 'UP83', '1', '1', '1', 'E82 ', 'N52K', 'A', '2', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3106', 'UP93', '128I US                  ', 'UP93', 'UP93', '1', '1', '1', 'E82 ', 'N51 ', 'S', '2', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3107', 'UR11', '118D                     ', 'UR11', 'UR11', '1', '1', '1', 'E82 ', 'N47 ', 'S', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3108', 'UR12', '118D RL                  ', 'UR11', 'UR11', '1', '1', '1', 'E82 ', 'N47 ', 'S', '2', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3109', 'UR21', '118D A                   ', 'UR21', 'UR21', '1', '1', '1', 'E82 ', 'N47 ', 'A', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3110', 'UR22', '118D RL A                ', 'UR21', 'UR21', '1', '1', '1', 'E82 ', 'N47 ', 'A', '2', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3111', 'UR31', '120D                     ', 'UR31', 'UR31', '1', '1', '1', 'E82 ', 'N47 ', 'S', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3112', 'UR32', '120D RL                  ', 'UR31', 'UR31', '1', '1', '1', 'E82 ', 'N47 ', 'S', '2', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3113', 'UR41', '120D A                   ', 'UR41', 'UR41', '1', '1', '1', 'E82 ', 'N47 ', 'A', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3114', 'UR42', '120D RL A                ', 'UR41', 'UR41', '1', '1', '1', 'E82 ', 'N47 ', 'A', '2', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3115', 'UR51', '123D                     ', 'UR51', 'UR51', '1', '1', '1', 'E82 ', 'N47S', 'S', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3116', 'UR52', '123D RL                  ', 'UR51', 'UR51', '1', '1', '1', 'E82 ', 'N47S', 'S', '2', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3117', 'UR61', '123D A                   ', 'UR61', 'UR61', '1', '1', '1', 'E82 ', 'N47S', 'A', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3118', 'UR62', '123D RL A                ', 'UR61', 'UR61', '1', '1', '1', 'E82 ', 'N47S', 'A', '2', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3119', 'UR91', 'M COUPE                  ', 'UR91', 'UR91', '1', '1', 'M1', 'E82 ', 'N54T', 'S', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3120', 'UR92', 'M COUPE                  ', 'UR91', 'UR91', '1', '1', 'M1', 'E82 ', 'N54T', 'S', '2', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3121', 'UR93', 'M COUPE                  ', 'UR93', 'UR93', '1', '1', 'M1', 'E82 ', 'N54T', 'S', '2', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3122', 'US01', '320I TO A                ', 'US01', 'US01', '1', '1', '3', 'E91 ', 'N43 ', 'A', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3123', 'US02', '320I RL TO A             ', 'US01', 'US01', '1', '1', '3', 'E91 ', 'N43 ', 'A', '5', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3124', 'US11', '316I TO                  ', 'US11', 'US11', '1', '1', '3', 'E91 ', 'N43 ', 'S', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3125', 'US31', '318I TO                  ', 'US31', 'US31', '1', '1', '3', 'E91 ', 'N43 ', 'S', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3126', 'US32', '318I RL TO               ', 'US31', 'US31', '1', '1', '3', 'E91 ', 'N43 ', 'S', '5', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3127', 'US41', '318I TO A                ', 'US41', 'US41', '1', '1', '3', 'E91 ', 'N43 ', 'A', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3128', 'US42', '318I RL TO A             ', 'US41', 'US41', '1', '1', '3', 'E91 ', 'N43 ', 'A', '5', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3129', 'US51', '318I TO                  ', 'US51', 'US51', '1', '1', '3', 'E91 ', 'N46T', 'S', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3130', 'US61', '318I TO A                ', 'US61', 'US61', '1', '1', '3', 'E91 ', 'N46T', 'A', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3131', 'US62', '318I RL TO A             ', 'US61', 'US61', '1', '1', '3', 'E91 ', 'N46T', 'A', '5', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3132', 'US71', '320I TO                  ', 'US71', 'US71', '1', '1', '3', 'E91 ', 'N46T', 'S', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3133', 'US72', '320I RL TO               ', 'US71', 'US71', '1', '1', '3', 'E91 ', 'N46T', 'S', '5', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3134', 'US81', '320I TO A                ', 'US81', 'US81', '1', '1', '3', 'E91 ', 'N46T', 'A', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3135', 'US82', '320I RL TO A             ', 'US81', 'US81', '1', '1', '3', 'E91 ', 'N46T', 'A', '5', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3136', 'US91', '320I TO                  ', 'US91', 'US91', '1', '1', '3', 'E91 ', 'N43 ', 'S', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3137', 'US92', '320I RL TO               ', 'US91', 'US91', '1', '1', '3', 'E91 ', 'N43 ', 'S', '5', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3138', 'UT01', '325I TO A                ', 'UT01', 'UT01', '1', '1', '3', 'E91 ', 'N52K', 'A', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3139', 'UT02', '325I RL TO A             ', 'UT01', 'UT01', '1', '1', '3', 'E91 ', 'N52K', 'A', '5', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3140', 'UT03', '328I US TO A             ', 'UT03', 'UT03', '1', '1', '3', 'E91 ', 'N52K', 'A', '5', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3141', 'UT31', '318D TO                  ', 'UT31', 'UT31', '1', '1', '3', 'E91 ', 'N47T', 'S', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3142', 'UT32', '318D RL TO               ', 'UT31', 'UT31', '1', '1', '3', 'E91 ', 'N47T', 'S', '5', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3143', 'UT41', '318D TO A                ', 'UT41', 'UT41', '1', '1', '3', 'E91 ', 'N47T', 'A', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3144', 'UT42', '318D RL TO A             ', 'UT41', 'UT41', '1', '1', '3', 'E91 ', 'N47T', 'A', '5', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3145', 'UT62', '323I RL TO A             ', 'UT01', 'UT01', '1', '1', '3', 'E91 ', 'N52K', 'A', '5', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3146', 'UT71', '325I TO                  ', 'UT71', 'UT71', '1', '1', '3', 'E91 ', 'N53 ', 'S', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3147', 'UT72', '325I RL TO               ', 'UT71', 'UT71', '1', '1', '3', 'E91 ', 'N53 ', 'S', '5', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3148', 'UT81', '325I TO A                ', 'UT81', 'UT81', '1', '1', '3', 'E91 ', 'N53 ', 'A', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3149', 'UT82', '325I RL TO A             ', 'UT81', 'UT81', '1', '1', '3', 'E91 ', 'N53 ', 'A', '5', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3150', 'UT91', '325I TO                  ', 'UT91', 'UT91', '1', '1', '3', 'E91 ', 'N52K', 'S', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3151', 'UT93', '328I US TO               ', 'UT93', 'UT93', '1', '1', '3', 'E91 ', 'N52K', 'S', '5', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3152', 'UU01', '335I XDRIVE A            ', 'UU01', 'UU01', '1', '1', '3G', 'E91 ', 'N54 ', 'A', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3153', 'UU11', '335I XDRIVE              ', 'UU11', 'UU11', '1', '1', '3G', 'E91 ', 'N55 ', 'S', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3154', 'UU21', '335I XDRIVE A            ', 'UU21', 'UU21', '1', '1', '3G', 'E91 ', 'N55 ', 'A', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3155', 'UU31', '325I XDRIVE              ', 'UU31', 'UU31', '1', '1', '3G', 'E91 ', 'N52K', 'S', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3156', 'UU33', '328I XDRIVE US           ', 'UU33', 'UU33', '1', '1', '3G', 'E91 ', 'N52K', 'S', '5', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3157', 'UU41', '325I XDRIVE A            ', 'UU41', 'UU41', '1', '1', '3G', 'E91 ', 'N52K', 'A', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3158', 'UU43', '328I XDRIVE US A         ', 'UU43', 'UU43', '1', '1', '3G', 'E91 ', 'N52K', 'A', '5', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3159', 'UU51', '325I XDRIVE              ', 'UU51', 'UU51', '1', '1', '3G', 'E91 ', 'N53 ', 'S', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3160', 'UU61', '325I XDRIVE A            ', 'UU61', 'UU61', '1', '1', '3G', 'E91 ', 'N53 ', 'A', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3161', 'UU71', '330XI TO                 ', 'UU71', 'UU71', '1', '1', '3G', 'E91 ', 'N53 ', 'S', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3162', 'UU81', '330XI TO A               ', 'UU81', 'UU81', '1', '1', '3G', 'E91 ', 'N53 ', 'A', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3163', 'UU91', '335I XDRIVE              ', 'UU91', 'UU91', '1', '1', '3G', 'E91 ', 'N54 ', 'S', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3164', 'UV01', '335I TO A                ', 'UV01', 'UV01', '1', '1', '3', 'E91 ', 'N55 ', 'A', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3165', 'UV02', '335I RL TO A             ', 'UV01', 'UV01', '1', '1', '3', 'E91 ', 'N55 ', 'A', '5', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3166', 'UV32', '330I RL TO               ', '    ', '    ', '1', '1', '3', 'E91 ', 'N52K', 'S', '5', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3167', 'UV41', '330I TO A                ', 'UV41', 'UV41', '1', '1', '3', 'E91 ', 'N52K', 'A', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3168', 'UV42', '330I RL TO A             ', 'UV41', 'UV41', '1', '1', '3', 'E91 ', 'N52K', 'A', '5', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3169', 'UV51', '330I TO                  ', 'UV51', 'UV51', '1', '1', '3', 'E91 ', 'N53 ', 'S', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3170', 'UV52', '330I RL TO               ', 'UV51', 'UV51', '1', '1', '3', 'E91 ', 'N53 ', 'S', '5', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3171', 'UV61', '330I TO A                ', 'UV61', 'UV61', '1', '1', '3', 'E91 ', 'N53 ', 'A', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3172', 'UV62', '330I RL TO A             ', 'UV61', 'UV61', '1', '1', '3', 'E91 ', 'N53 ', 'A', '5', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3173', 'UV71', '335I TO                  ', 'UV71', 'UV71', '1', '1', '3', 'E91 ', 'N54 ', 'S', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3174', 'UV72', '335I RL TO               ', 'UV71', 'UV71', '1', '1', '3', 'E91 ', 'N54 ', 'S', '5', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3175', 'UV81', '335I TO A                ', 'UV81', 'UV81', '1', '1', '3', 'E91 ', 'N54 ', 'A', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3176', 'UV82', '335I RL TO A             ', 'UV81', 'UV81', '1', '1', '3', 'E91 ', 'N54 ', 'A', '5', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3177', 'UV91', '335I TO                  ', 'UV91', 'UV91', '1', '1', '3', 'E91 ', 'N55 ', 'S', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3178', 'UV92', '335I RL TO               ', 'UV91', 'UV91', '1', '1', '3', 'E91 ', 'N55 ', 'S', '5', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3179', 'UW01', '330D XDRIVE A            ', 'UW01', 'UW01', '1', '1', '3G', 'E91 ', 'N57 ', 'A', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3180', 'UW71', '320D XDRIVE              ', 'UW71', 'UW71', '1', '1', '3G', 'E91 ', 'N47 ', 'S', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3181', 'UW81', '320D XDRIVE A            ', 'UW81', 'UW81', '1', '1', '3G', 'E91 ', 'N47 ', 'A', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3182', 'UW91', '330D XDRIVE              ', 'UW91', 'UW91', '1', '1', '3G', 'E91 ', 'N57 ', 'S', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3183', 'UX01', '325D TO A                ', 'UX01', 'UX01', '1', '1', '3', 'E91 ', 'N57 ', 'A', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3184', 'UX02', '325D RL TO A             ', 'UX01', 'UX01', '1', '1', '3', 'E91 ', 'N57 ', 'A', '5', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3185', 'UX11', '318D TO                  ', 'UX11', 'UX11', '1', '1', '3', 'E91 ', 'N47 ', 'S', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3186', 'UX12', '318D RL TO               ', 'UX11', 'UX11', '1', '1', '3', 'E91 ', 'N47 ', 'S', '5', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3187', 'UX21', '318D TO A                ', 'UX21', 'UX21', '1', '1', '3', 'E91 ', 'N47 ', 'A', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3188', 'UX22', '318D RL TO A             ', 'UX21', 'UX21', '1', '1', '3', 'E91 ', 'N47 ', 'A', '5', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3189', 'UX31', '320D TO                  ', 'UX31', 'UX31', '1', '1', '3', 'E91 ', 'N47 ', 'S', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3190', 'UX32', '320D TO RL               ', 'UX31', 'UX31', '1', '1', '3', 'E91 ', 'N47 ', 'S', '5', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3191', 'UX41', '320D TO A                ', 'UX41', 'UX41', '1', '1', '3', 'E91 ', 'N47 ', 'A', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3192', 'UX42', '320D TO RL A             ', 'UX41', 'UX41', '1', '1', '3', 'E91 ', 'N47 ', 'A', '5', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3193', 'UX51', '325D TO                  ', 'UX51', 'UX51', '1', '1', '3', 'E91 ', 'M57S', 'S', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3194', 'UX52', '325D RL TO               ', 'UX51', 'UX51', '1', '1', '3', 'E91 ', 'M57S', 'S', '5', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3195', 'UX61', '325D TO A                ', 'UX61', 'UX61', '1', '1', '3', 'E91 ', 'M57S', 'A', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3196', 'UX62', '325D RL TO A             ', 'UX61', 'UX61', '1', '1', '3', 'E91 ', 'M57S', 'A', '5', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3197', 'UX81', '335D TO A                ', 'UX81', 'UX81', '1', '1', '3', 'E91 ', 'M57Y', 'A', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3198', 'UX82', '335D RL TO A             ', 'UX81', 'UX81', '1', '1', '3', 'E91 ', 'M57Y', 'A', '5', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3199', 'UX91', '325D TO                  ', 'UX91', 'UX91', '1', '1', '3', 'E91 ', 'N57 ', 'S', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3200', 'UX92', '325D RL TO               ', 'UX91', 'UX91', '1', '1', '3', 'E91 ', 'N57 ', 'S', '5', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3201', 'UY01', '330D TO A                ', 'UY01', 'UY01', '1', '1', '3', 'E91 ', 'N57 ', 'A', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3202', 'UY02', '330D RL TO A             ', 'UY01', 'UY01', '1', '1', '3', 'E91 ', 'N57 ', 'A', '5', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3203', 'UY11', '320D TO                  ', 'UY11', 'UY11', '1', '1', '3', 'E91 ', 'N47T', 'S', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3204', 'UY12', '320D RL TO               ', 'UY11', 'UY11', '1', '1', '3', 'E91 ', 'N47T', 'S', '5', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3205', 'UY21', '320D TO A                ', 'UY21', 'UY21', '1', '1', '3', 'E91 ', 'N47T', 'A', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3206', 'UY22', '320D RL TO A             ', 'UY21', 'UY21', '1', '1', '3', 'E91 ', 'N47T', 'A', '5', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3207', 'UY31', '320D XDRIVE              ', 'UY31', 'UY31', '1', '1', '3G', 'E91 ', 'N47T', 'S', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3208', 'UY41', '320D XDRIVE A            ', 'UY41', 'UY41', '1', '1', '3G', 'E91 ', 'N47T', 'A', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3209', 'UY51', '316D TO                  ', 'UY51', 'UY51', '1', '1', '3', 'E91 ', 'N47T', 'S', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3210', 'UY52', '316D TO RL               ', 'UY51', 'UY51', '1', '1', '3', 'E91 ', 'N47T', 'S', '5', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3211', 'UY71', '320D EFFDYN EDI          ', 'UY71', 'UY71', '1', '1', '3', 'E91 ', 'N47T', 'S', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3212', 'UY91', '330D TO                  ', 'UY91', 'UY91', '1', '1', '3', 'E91 ', 'N57 ', 'S', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3213', 'UY92', '330D RL TO               ', 'UY91', 'UY91', '1', '1', '3', 'E91 ', 'N57 ', 'S', '5', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3214', 'VA05', '320I RL IN SKD A         ', 'VA81', 'VA81', '1', '1', 'I3', 'E90 ', 'N46 ', 'A', '4', 'R', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3215', 'VA06', '320I A CHN CKD A         ', 'VA81', 'VA81', '1', '1', '3C', 'E90 ', 'N46 ', 'A', '4', 'L', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3216', 'VA07', '320I RL THA CKD A        ', 'VA81', 'VA81', '1', '1', 'T3', 'E90 ', 'N46 ', 'A', '4', 'R', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3217', 'VA08', '320I RUS SKD A           ', 'VA81', 'VA81', '1', '1', 'R3', 'E90 ', 'N46 ', 'A', '4', 'L', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3218', 'VA09', '320I EGY SKD A           ', 'VA81', 'VA81', '1', '1', 'Y3', 'E90 ', 'N46 ', 'A', '4', 'L', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3219', 'VA11', '316I LA                  ', 'VA11', 'VA11', '1', '1', '3', 'E90 ', 'N45 ', 'S', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3220', 'VA12', '316I RL                  ', 'VA11', 'VA11', '1', '1', '3', 'E90 ', 'N45 ', 'S', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3221', 'VA33', '328I US                  ', 'VA33', 'VA33', '1', '1', '3', 'E90 ', 'N52K', 'S', '4', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3222', 'VA37', '328I US                  ', 'VA33', 'VA33', '1', '1', '3', 'E90 ', 'N52K', 'S', '4', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3223', 'VA41', '328I KOREA A             ', 'VC63', 'VC63', '1', '1', 'K3', 'E90 ', 'N51 ', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3224', 'VA43', '328I US A                ', 'VA43', 'VA43', '1', '1', '3', 'E90 ', 'N52K', 'A', '4', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3225', 'VA47', '328I US A                ', 'VA43', 'VA43', '1', '1', '3', 'E90 ', 'N52K', 'A', '4', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3226', 'VA51', '318I                     ', 'VA51', 'VA51', '1', '1', '3', 'E90 ', 'N46 ', 'S', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3227', 'VA52', '318I RL                  ', 'VA51', 'VA51', '1', '1', '3', 'E90 ', 'N46 ', 'S', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3228', 'VA57', '318I RL THA CKD          ', 'VA51', 'VA51', '1', '1', 'T3', 'E90 ', 'N46 ', 'S', '4', 'R', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3229', 'VA61', '318I A                   ', 'VA61', 'VA61', '1', '1', '3', 'E90 ', 'N46 ', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3230', 'VA62', '318I RL A                ', 'VA61', 'VA61', '1', '1', '3', 'E90 ', 'N46 ', 'A', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3231', 'VA67', '318I RL THA CKD A        ', 'VA61', 'VA61', '1', '1', 'T3', 'E90 ', 'N46 ', 'A', '4', 'R', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3232', 'VA71', '320I                     ', 'VA71', 'VA71', '1', '1', '3', 'E90 ', 'N46 ', 'S', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3233', 'VA72', '320I RL                  ', 'VA71', 'VA71', '1', '1', '3', 'E90 ', 'N46 ', 'S', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3234', 'VA74', '320I RL MYS CKD          ', 'VA71', 'VA71', '1', '1', 'C3', 'E90 ', 'N46 ', 'S', '4', 'R', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3235', 'VA76', '320I RL                  ', 'VA71', 'VA71', '1', '1', '3', 'E90 ', 'N46 ', 'S', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3236', 'VA77', '320I RL IND CKD          ', 'VA71', 'VA71', '1', '1', 'C3', 'E90 ', 'N46 ', 'S', '4', 'R', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3237', 'VA81', '320I A                   ', 'VA81', 'VA81', '1', '1', '3', 'E90 ', 'N46 ', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3238', 'VA82', '320I RL A                ', 'VA81', 'VA81', '1', '1', '3', 'E90 ', 'N46 ', 'A', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3239', 'VA84', '320I RL MYS CKD A        ', 'VA81', 'VA81', '1', '1', 'C3', 'E90 ', 'N46 ', 'A', '4', 'R', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3240', 'VA85', '320I A                   ', 'VA81', 'VA81', '1', '1', '3', 'E90 ', 'N46 ', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3241', 'VA86', '320I RL A                ', 'VA81', 'VA81', '1', '1', '3', 'E90 ', 'N46 ', 'A', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3242', 'VA87', '320I RL IND CKD A        ', 'VA81', 'VA81', '1', '1', 'C3', 'E90 ', 'N46 ', 'A', '4', 'R', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3243', 'VA91', 'M3                       ', 'VA91', 'VA91', '1', '1', 'M3', 'E90 ', 'S65 ', 'S', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3244', 'VA92', 'M3 RL                    ', 'VA91', 'VA91', '1', '1', 'M3', 'E90 ', 'S65 ', 'S', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3245', 'VA93', 'M3 US                    ', 'VA93', 'VA93', '1', '1', 'M3', 'E90 ', 'S65 ', 'S', '4', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3246', 'VA96', '320I A CHN CKD           ', 'VA71', 'VA71', '1', '1', '3C', 'E90 ', 'N46 ', 'S', '4', 'L', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3247', 'VA97', '320I RL THA CKD          ', 'VA71', 'VA71', '1', '1', 'T3', 'E90 ', 'N46 ', 'S', '4', 'R', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3248', 'VA98', '320I RUS SKD             ', 'VA71', 'VA71', '1', '1', 'R3', 'E90 ', 'N46 ', 'S', '4', 'L', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3249', 'VA99', '320I EGY SKD             ', 'VA71', 'VA71', '1', '1', 'Y3', 'E90 ', 'N46 ', 'S', '4', 'L', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3250', 'VB05', '325I RL IN SKD A         ', 'VB21', 'VB21', '1', '1', 'I3', 'E90 ', 'N52 ', 'A', '4', 'R', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3251', 'VB07', '325I RL THA CKD A        ', 'VB21', 'VB21', '1', '1', 'T3', 'E90 ', 'N52 ', 'A', '4', 'R', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3252', 'VB09', '325I RL MYS CKD A        ', 'VB21', 'VB21', '1', '1', 'C3', 'E90 ', 'N52 ', 'A', '4', 'R', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3253', 'VB11', '325I                     ', 'VB11', 'VB11', '1', '1', '3', 'E90 ', 'N52 ', 'S', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3254', 'VB12', '325I RL                  ', 'VB11', 'VB11', '1', '1', '3', 'E90 ', 'N52 ', 'S', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3255', 'VB13', '325I US                  ', 'VB13', 'VB13', '1', '1', '3', 'E90 ', 'N52 ', 'S', '4', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3256', 'VB14', '325I A RUS SKD           ', 'VB11', 'VB11', '1', '1', 'R3', 'E90 ', 'N52 ', 'S', '4', 'L', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3257', 'VB15', '325I                     ', 'VB11', 'VB11', '1', '1', '3', 'E90 ', 'N52 ', 'S', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3258', 'VB16', '325I RL                  ', 'VB11', 'VB11', '1', '1', '3', 'E90 ', 'N52 ', 'S', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3259', 'VB17', '325I US                  ', 'VB13', 'VB13', '1', '1', '3', 'E90 ', 'N52 ', 'S', '4', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3260', 'VB19', '325I RL IND CKD          ', 'VB11', 'VB11', '1', '1', 'C3', 'E90 ', 'N52 ', 'S', '4', 'R', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3261', 'VB21', '325I A                   ', 'VB21', 'VB21', '1', '1', '3', 'E90 ', 'N52 ', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3262', 'VB22', '325I RL A                ', 'VB21', 'VB21', '1', '1', '3', 'E90 ', 'N52 ', 'A', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3263', 'VB23', '325I US A                ', 'VB23', 'VB23', '1', '1', '3', 'E90 ', 'N52 ', 'A', '4', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3264', 'VB24', '325I A RUS SKD A         ', 'VB21', 'VB21', '1', '1', 'R3', 'E90 ', 'N52 ', 'A', '4', 'L', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3265', 'VB25', '325I A                   ', 'VB21', 'VB21', '1', '1', '3', 'E90 ', 'N52 ', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3266', 'VB26', '325I RL A                ', 'VB21', 'VB21', '1', '1', '3', 'E90 ', 'N52 ', 'A', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3267', 'VB27', '325I US A                ', 'VB23', 'VB23', '1', '1', '3', 'E90 ', 'N52 ', 'A', '4', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3268', 'VB29', '325I RL IND CKD A        ', 'VB21', 'VB21', '1', '1', 'C3', 'E90 ', 'N52 ', 'A', '4', 'R', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3269', 'VB31', '330I                     ', 'VB31', 'VB31', '1', '1', '3', 'E90 ', 'N52 ', 'S', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3270', 'VB32', '330I RL                  ', 'VB31', 'VB31', '1', '1', '3', 'E90 ', 'N52 ', 'S', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3271', 'VB33', '330I US                  ', 'VB33', 'VB33', '1', '1', '3', 'E90 ', 'N52 ', 'S', '4', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3272', 'VB35', '330I                     ', 'VB31', 'VB31', '1', '1', '3', 'E90 ', 'N52 ', 'S', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3273', 'VB36', '330I RL                  ', 'VB31', 'VB31', '1', '1', '3', 'E90 ', 'N52 ', 'S', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3274', 'VB38', '330I RL THA CKD          ', 'VB31', 'VB31', '1', '1', 'T3', 'E90 ', 'N52 ', 'S', '4', 'R', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3275', 'VB41', '330I A                   ', 'VB41', 'VB41', '1', '1', '3', 'E90 ', 'N52 ', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3276', 'VB42', '330I RL A                ', 'VB41', 'VB41', '1', '1', '3', 'E90 ', 'N52 ', 'A', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3277', 'VB43', '330I US A                ', 'VB43', 'VB43', '1', '1', '3', 'E90 ', 'N52 ', 'A', '4', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3278', 'VB45', '330I A                   ', 'VB41', 'VB41', '1', '1', '3', 'E90 ', 'N52 ', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3279', 'VB46', '330I RL A                ', 'VB41', 'VB41', '1', '1', '3', 'E90 ', 'N52 ', 'A', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3280', 'VB48', '330I RL THA CKD A        ', 'VB41', 'VB41', '1', '1', 'T3', 'E90 ', 'N52 ', 'A', '4', 'R', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3281', 'VB51', '323I                     ', 'VB51', 'VB51', '1', '1', '3', 'E90 ', 'N52 ', 'S', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3282', 'VB53', '323I US                  ', 'VB53', 'VB53', '1', '1', '3', 'E90 ', 'N52 ', 'S', '4', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3283', 'VB56', '323I RL                  ', 'VB51', 'VB51', '1', '1', '3', 'E90 ', 'N52 ', 'S', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3284', 'VB59', '325I A CHN CKD           ', 'VB11', 'VB11', '1', '1', '3C', 'E90 ', 'N52 ', 'S', '4', 'L', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3285', 'VB61', '323I A                   ', 'VB61', 'VB61', '1', '1', '3', 'E90 ', 'N52 ', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3286', 'VB62', '323I RL A                ', 'VB61', 'VB61', '1', '1', '3', 'E90 ', 'N52 ', 'A', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3287', 'VB63', '323I US A                ', 'VB63', 'VB63', '1', '1', '3', 'E90 ', 'N52 ', 'A', '4', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3288', 'VB65', '323I A                   ', 'VB61', 'VB61', '1', '1', '3', 'E90 ', 'N52 ', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3289', 'VB66', '323I RL A                ', 'VB61', 'VB61', '1', '1', '3', 'E90 ', 'N52 ', 'A', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3290', 'VB69', '325I A CHN CKD A         ', 'VB21', 'VB21', '1', '1', '3C', 'E90 ', 'N52 ', 'A', '4', 'L', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3291', 'VB71', '335I                     ', 'VB71', 'VB71', '1', '1', '3', 'E90 ', 'N54 ', 'S', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3292', 'VB72', '335I RL                  ', 'VB71', 'VB71', '1', '1', '3', 'E90 ', 'N54 ', 'S', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3293', 'VB73', '335I US                  ', 'VB73', 'VB73', '1', '1', '3', 'E90 ', 'N54 ', 'S', '4', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3294', 'VB76', '335I RL                  ', 'VB71', 'VB71', '1', '1', '3', 'E90 ', 'N54 ', 'S', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3295', 'VB77', '335I US                  ', 'VB73', 'VB73', '1', '1', '3', 'E90 ', 'N54 ', 'S', '4', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3296', 'VB81', '335I A                   ', 'VB81', 'VB81', '1', '1', '3', 'E90 ', 'N54 ', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3297', 'VB82', '335I RL A                ', 'VB81', 'VB81', '1', '1', '3', 'E90 ', 'N54 ', 'A', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3298', 'VB83', '335I US A                ', 'VB83', 'VB83', '1', '1', '3', 'E90 ', 'N54 ', 'A', '4', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3299', 'VB85', '335I A                   ', 'VB81', 'VB81', '1', '1', '3', 'E90 ', 'N54 ', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3300', 'VB86', '335I RL A                ', 'VB81', 'VB81', '1', '1', '3', 'E90 ', 'N54 ', 'A', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3301', 'VB87', '335I US A                ', 'VB83', 'VB83', '1', '1', '3', 'E90 ', 'N54 ', 'A', '4', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3302', 'VB97', '325I RL THA CKD          ', 'VB11', 'VB11', '1', '1', 'T3', 'E90 ', 'N52 ', 'S', '4', 'R', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3303', 'VB99', '325I RL MYS CKD          ', 'VB11', 'VB11', '1', '1', 'C3', 'E90 ', 'N52 ', 'S', '4', 'R', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3304', 'VC01', '330D A                   ', 'VC01', 'VC01', '1', '1', '3', 'E90 ', 'M57S', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3305', 'VC02', '330D RL A                ', 'VC01', 'VC01', '1', '1', '3', 'E90 ', 'M57S', 'A', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3306', 'VC03', '328XI US A               ', 'VC03', 'VC03', '1', '1', '3X', 'E90 ', 'N52K', 'A', '4', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3307', 'VC06', '330D RL A                ', 'VC01', 'VC01', '1', '1', '3', 'E90 ', 'M57S', 'A', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3308', 'VC11', '318D                     ', 'VC11', 'VC11', '1', '1', '3', 'E90 ', 'M47S', 'S', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3309', 'VC12', '318D RL                  ', 'VC11', 'VC11', '1', '1', '3', 'E90 ', 'M47S', 'S', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3310', 'VC31', '320D                     ', 'VC31', 'VC31', '1', '1', '3', 'E90 ', 'M47S', 'S', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3311', 'VC32', '320D RL                  ', 'VC31', 'VC31', '1', '1', '3', 'E90 ', 'M47S', 'S', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3312', 'VC36', '320D RL                  ', 'VC31', 'VC31', '1', '1', '3', 'E90 ', 'M47S', 'S', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3313', 'VC41', '320D A                   ', 'VC41', 'VC41', '1', '1', '3', 'E90 ', 'M47S', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3314', 'VC42', '320D RL A                ', 'VC41', 'VC41', '1', '1', '3', 'E90 ', 'M47S', 'A', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3315', 'VC46', '320D RL A                ', 'VC41', 'VC41', '1', '1', '3', 'E90 ', 'M47S', 'A', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3316', 'VC47', '320D RL IN SKD A         ', 'VC41', 'VC41', '1', '1', 'I3', 'E90 ', 'M47S', 'A', '4', 'R', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3317', 'VC51', '325D                     ', 'VC51', 'VC51', '1', '1', '3', 'E90 ', 'M57S', 'S', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3318', 'VC52', '325D RL                  ', 'VC51', 'VC51', '1', '1', '3', 'E90 ', 'M57S', 'S', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3319', 'VC53', '328I US                  ', 'VC53', 'VC53', '1', '1', '3', 'E90 ', 'N51 ', 'S', '4', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3320', 'VC57', '328I US                  ', 'VC53', 'VC53', '1', '1', '3', 'E90 ', 'N51 ', 'S', '4', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3321', 'VC61', '325D A                   ', 'VC61', 'VC61', '1', '1', '3', 'E90 ', 'M57S', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3322', 'VC62', '325D RL A                ', 'VC61', 'VC61', '1', '1', '3', 'E90 ', 'M57S', 'A', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3323', 'VC63', '328I US A                ', 'VC63', 'VC63', '1', '1', '3', 'E90 ', 'N51 ', 'A', '4', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3324', 'VC67', '328I US A                ', 'VC63', 'VC63', '1', '1', '3', 'E90 ', 'N51 ', 'A', '4', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3325', 'VC73', '328XI US                 ', 'VC73', 'VC73', '1', '1', '3X', 'E90 ', 'N51 ', 'S', '4', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3326', 'VC83', '328XI US A               ', 'VC83', 'VC83', '1', '1', '3X', 'E90 ', 'N51 ', 'A', '4', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3327', 'VC91', '330D                     ', 'VC91', 'VC91', '1', '1', '3', 'E90 ', 'M57S', 'S', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3328', 'VC92', '330D RL                  ', 'VC91', 'VC91', '1', '1', '3', 'E90 ', 'M57S', 'S', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3329', 'VC93', '328XI US                 ', 'VC93', 'VC93', '1', '1', '3X', 'E90 ', 'N52K', 'S', '4', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3330', 'VC96', '330D RL                  ', 'VC91', 'VC91', '1', '1', '3', 'E90 ', 'M57S', 'S', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3331', 'VD01', '330XD A                  ', 'VD01', 'VD01', '1', '1', '3X', 'E90 ', 'M57S', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3332', 'VD11', '325XI                    ', 'VD11', 'VD11', '1', '1', '3X', 'E90 ', 'N52 ', 'S', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3333', 'VD13', '325XI US                 ', 'VD13', 'VD13', '1', '1', '3X', 'E90 ', 'N52 ', 'S', '4', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3334', 'VD21', '325XI A                  ', 'VD21', 'VD21', '1', '1', '3X', 'E90 ', 'N52 ', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3335', 'VD23', '325XI US A               ', 'VD23', 'VD23', '1', '1', '3X', 'E90 ', 'N52 ', 'A', '4', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3336', 'VD31', '330XI                    ', 'VD31', 'VD31', '1', '1', '3X', 'E90 ', 'N52 ', 'S', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3337', 'VD33', '330XI US                 ', 'VD33', 'VD33', '1', '1', '3X', 'E90 ', 'N52 ', 'S', '4', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3338', 'VD41', '330XI A                  ', 'VD41', 'VD41', '1', '1', '3X', 'E90 ', 'N52 ', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3339', 'VD43', '330XI US A               ', 'VD43', 'VD43', '1', '1', '3X', 'E90 ', 'N52 ', 'A', '4', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3340', 'VD51', '335XI                    ', 'VD51', 'VD51', '1', '1', '3X', 'E90 ', 'N54 ', 'S', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3341', 'VD53', '335XI US                 ', 'VD53', 'VD53', '1', '1', '3X', 'E90 ', 'N54 ', 'S', '4', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3342', 'VD61', '335XI A                  ', 'VD61', 'VD61', '1', '1', '3X', 'E90 ', 'N54 ', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3343', 'VD63', '335XI US A               ', 'VD63', 'VD63', '1', '1', '3X', 'E90 ', 'N54 ', 'A', '4', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3344', 'VD81', '335D A                   ', 'VD81', 'VD81', '1', '1', '3', 'E90 ', 'M57Y', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3345', 'VD82', '335D RL A                ', 'VD81', 'VD81', '1', '1', '3', 'E90 ', 'M57Y', 'A', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3346', 'VD91', '330XD                    ', 'VD91', 'VD91', '1', '1', '3X', 'E90 ', 'M57S', 'S', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3347', 'VE01', '330XI A                  ', 'VE01', 'VE01', '1', '1', '3X', 'E90 ', 'N53 ', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3348', 'VE31', '325I                     ', 'VE31', 'VE31', '1', '1', '3', 'E90 ', 'N53 ', 'S', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3349', 'VE32', '325I RL                  ', 'VE31', 'VE31', '1', '1', '3', 'E90 ', 'N53 ', 'S', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3350', 'VE41', '325I A                   ', 'VE41', 'VE41', '1', '1', '3', 'E90 ', 'N53 ', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3351', 'VE42', '325I RL A                ', 'VE41', 'VE41', '1', '1', '3', 'E90 ', 'N53 ', 'A', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3352', 'VE51', '325XI                    ', 'VE51', 'VE51', '1', '1', '3X', 'E90 ', 'N53 ', 'S', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3353', 'VE61', '325XI A                  ', 'VE61', 'VE61', '1', '1', '3X', 'E90 ', 'N53 ', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3354', 'VE71', '330I                     ', 'VE71', 'VE71', '1', '1', '3', 'E90 ', 'N53 ', 'S', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3355', 'VE72', '330I RL                  ', 'VE71', 'VE71', '1', '1', '3', 'E90 ', 'N53 ', 'S', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3356', 'VE81', '330I A                   ', 'VE81', 'VE81', '1', '1', '3', 'E90 ', 'N53 ', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3357', 'VE82', '330I RL A                ', 'VE81', 'VE81', '1', '1', '3', 'E90 ', 'N53 ', 'A', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3358', 'VE91', '330XI                    ', 'VE91', 'VE91', '1', '1', '3X', 'E90 ', 'N53 ', 'S', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3359', 'VF01', '320I A                   ', 'VF01', 'VF01', '1', '1', '3', 'E90 ', 'N43 ', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3360', 'VF02', '320I RL A                ', 'VF01', 'VF01', '1', '1', '3', 'E90 ', 'N43 ', 'A', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3361', 'VF11', '325XI                    ', 'VF11', 'VF11', '1', '1', '3X', 'E90 ', 'N52K', 'S', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3362', 'VF14', '325XI A RUS SKD          ', 'VF11', 'VF11', '1', '1', 'R3', 'E90 ', 'N52K', 'S', '4', 'L', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3363', 'VF21', '325XI A                  ', 'VF21', 'VF21', '1', '1', '3X', 'E90 ', 'N52K', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3364', 'VF24', '325XI A RUS SKD A        ', 'VF21', 'VF21', '1', '1', 'R3', 'E90 ', 'N52K', 'A', '4', 'L', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3365', 'VF31', '316I                     ', 'VF31', 'VF31', '1', '1', '3', 'E90 ', 'N43 ', 'S', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3366', 'VF32', '316I RL                  ', 'VF31', 'VF31', '1', '1', '3', 'E90 ', 'N43 ', 'S', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3367', 'VF41', '316I A                   ', 'VF41', 'VF41', '1', '1', '3', 'E90 ', 'N43 ', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3368', 'VF42', '316I RL A                ', 'VF41', 'VF41', '1', '1', '3', 'E90 ', 'N43 ', 'A', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3369', 'VF51', '318I                     ', 'VF51', 'VF51', '1', '1', '3', 'E90 ', 'N43 ', 'S', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3370', 'VF52', '318I RL                  ', 'VF51', 'VF51', '1', '1', '3', 'E90 ', 'N43 ', 'S', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3371', 'VF61', '318I A                   ', 'VF61', 'VF61', '1', '1', '3', 'E90 ', 'N43 ', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3372', 'VF62', '318I RL A                ', 'VF61', 'VF61', '1', '1', '3', 'E90 ', 'N43 ', 'A', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3373', 'VF71', '320SI                    ', 'VF71', 'VF71', '1', '1', '3', 'E90 ', 'N45 ', 'S', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3374', 'VF72', '320SI RL                 ', 'VF71', 'VF71', '1', '1', '3', 'E90 ', 'N45 ', 'S', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3375', 'VF91', '320I                     ', 'VF91', 'VF91', '1', '1', '3', 'E90 ', 'N43 ', 'S', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3376', 'VF92', '320I RL                  ', 'VF91', 'VF91', '1', '1', '3', 'E90 ', 'N43 ', 'S', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3377', 'VG01', '320D A                   ', 'VG01', 'VG01', '1', '1', '3', 'E90 ', 'N47 ', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3378', 'VG02', '320D RL A                ', 'VG01', 'VG01', '1', '1', '3', 'E90 ', 'N47 ', 'A', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3379', 'VG05', '320I RL IND SKD A        ', 'VG81', 'VG81', '1', '1', 'C3', 'E90 ', 'N46T', 'A', '4', 'R', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3380', 'VG06', '320D RL A                ', 'VG01', 'VG01', '1', '1', '3', 'E90 ', 'N47 ', 'A', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3381', 'VG07', '320I RL THA CKD A        ', 'VG81', 'VG81', '1', '1', 'T3', 'E90 ', 'N46T', 'A', '4', 'R', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3382', 'VG08', '320I RUS SKD A           ', 'VG81', 'VG81', '1', '1', 'R3', 'E90 ', 'N46T', 'A', '4', 'L', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3383', 'VG09', '320I EGY SKD A           ', 'VG81', 'VG81', '1', '1', 'Y3', 'E90 ', 'N46T', 'A', '4', 'L', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3384', 'VG11', '318D                     ', 'VG11', 'VG11', '1', '1', '3', 'E90 ', 'N47 ', 'S', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3385', 'VG12', '318D RL                  ', 'VG11', 'VG11', '1', '1', '3', 'E90 ', 'N47 ', 'S', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3386', 'VG31', '316I                     ', 'VG31', 'VG31', '1', '1', '3', 'E90 ', 'N45T', 'S', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3387', 'VG32', '316I RL                  ', 'VG31', 'VG31', '1', '1', '3', 'E90 ', 'N45T', 'S', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3388', 'VG47', '320D RL IND SKD A        ', 'VG01', 'VG01', '1', '1', 'I3', 'E90 ', 'N47 ', 'A', '4', 'R', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3389', 'VG48', '320D RL THA CKD A        ', 'VG01', 'VG01', '1', '1', 'T3', 'E90 ', 'N47 ', 'A', '4', 'R', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3390', 'VG51', '318I                     ', 'VG51', 'VG51', '1', '1', '3', 'E90 ', 'N46T', 'S', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3391', 'VG52', '318I RL                  ', 'VG51', 'VG51', '1', '1', '3', 'E90 ', 'N46T', 'S', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3392', 'VG61', '318I A                   ', 'VG61', 'VG61', '1', '1', '3', 'E90 ', 'N46T', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3393', 'VG62', '318I RL A                ', 'VG61', 'VG61', '1', '1', '3', 'E90 ', 'N46T', 'A', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3394', 'VG67', '318I RL THA CKD A        ', 'VG61', 'VG61', '1', '1', 'T3', 'E90 ', 'N46T', 'A', '4', 'R', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3395', 'VG68', '318I SKD RUS A           ', 'VG61', 'VG61', '1', '1', 'R3', 'E90 ', 'N46T', 'A', '4', 'L', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3396', 'VG71', '320I                     ', 'VG71', 'VG71', '1', '1', '3', 'E90 ', 'N46T', 'S', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3397', 'VG72', '320I RL                  ', 'VG71', 'VG71', '1', '1', '3', 'E90 ', 'N46T', 'S', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3398', 'VG74', '320I RL MYS SKD          ', 'VG71', 'VG71', '1', '1', 'C3', 'E90 ', 'N46T', 'S', '4', 'R', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3399', 'VG76', '320I RL                  ', 'VG71', 'VG71', '1', '1', '3', 'E90 ', 'N46T', 'S', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3400', 'VG79', '320I A CHN CKD           ', 'VG71', 'VG71', '1', '1', '3C', 'E90 ', 'N46T', 'S', '4', 'L', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3401', 'VG81', '320I A                   ', 'VG81', 'VG81', '1', '1', '3', 'E90 ', 'N46T', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3402', 'VG82', '320I RL A                ', 'VG81', 'VG81', '1', '1', '3', 'E90 ', 'N46T', 'A', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3403', 'VG84', '320I RL MYS SKD A        ', 'VG81', 'VG81', '1', '1', 'C3', 'E90 ', 'N46T', 'A', '4', 'R', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3404', 'VG85', '320I A                   ', 'VG81', 'VG81', '1', '1', '3', 'E90 ', 'N46T', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3405', 'VG86', '320I RL A                ', 'VG81', 'VG81', '1', '1', '3', 'E90 ', 'N46T', 'A', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3406', 'VG87', '320I RL IDN CKD A        ', 'VG81', 'VG81', '1', '1', 'C3', 'E90 ', 'N46T', 'A', '4', 'R', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3407', 'VG89', '320I A CHN CKD A         ', 'VG81', 'VG81', '1', '1', '3C', 'E90 ', 'N46T', 'A', '4', 'L', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3408', 'VG91', '320D                     ', 'VG91', 'VG91', '1', '1', '3', 'E90 ', 'N47 ', 'S', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3409', 'VG92', '320D RL                  ', 'VG91', 'VG91', '1', '1', '3', 'E90 ', 'N47 ', 'S', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3410', 'VG96', '320D RL                  ', 'VG91', 'VG91', '1', '1', '3', 'E90 ', 'N47 ', 'S', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3411', 'VG98', '320I RUS SKD             ', 'VG71', 'VG71', '1', '1', 'R3', 'E90 ', 'N46T', 'S', '4', 'L', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3412', 'VG99', '320I EGY SKD             ', 'VG71', 'VG71', '1', '1', 'Y3', 'E90 ', 'N46T', 'S', '4', 'L', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3413', 'VH05', '325I RL IND SKD A        ', 'VH41', 'VH41', '1', '1', 'C3', 'E90 ', 'N52K', 'A', '4', 'R', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3414', 'VH11', '323I                     ', 'VH11', 'VH11', '1', '1', '3', 'E90 ', 'N52K', 'S', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3415', 'VH12', '323I RL                  ', 'VH11', 'VH11', '1', '1', '3', 'E90 ', 'N52K', 'S', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3416', 'VH13', '323I US                  ', 'VH13', 'VH13', '1', '1', '3', 'E90 ', 'N52K', 'S', '4', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3417', 'VH16', '323I RL                  ', 'VH11', 'VH11', '1', '1', 'Z3', 'E90 ', 'N52K', 'S', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3418', 'VH21', '323I A                   ', 'VH21', 'VH21', '1', '1', '3', 'E90 ', 'N52K', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3419', 'VH22', '323I RL A                ', 'VH21', 'VH21', '1', '1', '3', 'E90 ', 'N52K', 'A', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3420', 'VH23', '323I US A                ', 'VH23', 'VH23', '1', '1', '3', 'E90 ', 'N52K', 'A', '4', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3421', 'VH25', '323I A                   ', 'VH21', 'VH21', '1', '1', 'Z3', 'E90 ', 'N52K', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3422', 'VH26', '323I RL A                ', 'VH21', 'VH21', '1', '1', 'Z3', 'E90 ', 'N52K', 'A', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3423', 'VH31', '325I                     ', 'VH31', 'VH31', '1', '1', '3', 'E90 ', 'N52K', 'S', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3424', 'VH32', '325I RL                  ', 'VH31', 'VH31', '1', '1', '3', 'E90 ', 'N52K', 'S', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3425', 'VH36', '325I RL                  ', 'VH31', 'VH31', '1', '1', 'Z3', 'E90 ', 'N52K', 'S', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3426', 'VH38', '325I A CHN CKD           ', 'VH31', 'VH31', '1', '1', '3C', 'E90 ', 'N52K', 'S', '4', 'L', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3427', 'VH41', '325I A                   ', 'VH41', 'VH41', '1', '1', '3', 'E90 ', 'N52K', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3428', 'VH42', '325I RL A                ', 'VH41', 'VH41', '1', '1', '3', 'E90 ', 'N52K', 'A', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3429', 'VH44', '325I A RUS SKD A         ', 'VH41', 'VH41', '1', '1', 'R3', 'E90 ', 'N52K', 'A', '4', 'L', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3430', 'VH45', '325I A                   ', 'VH41', 'VH41', '1', '1', 'Z3', 'E90 ', 'N52K', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3431', 'VH46', '325I RL A                ', 'VH41', 'VH41', '1', '1', 'Z3', 'E90 ', 'N52K', 'A', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3432', 'VH48', '325I A CHN CKD A         ', 'VH41', 'VH41', '1', '1', '3C', 'E90 ', 'N52K', 'A', '4', 'L', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3433', 'VH51', '330I                     ', 'VH51', 'VH51', '1', '1', '3', 'E90 ', 'N52K', 'S', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3434', 'VH52', '330I RL                  ', 'VH51', 'VH51', '1', '1', '3', 'E90 ', 'N52K', 'S', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3435', 'VH56', '330I RL                  ', 'VH51', 'VH51', '1', '1', 'Z3', 'E90 ', 'N52K', 'S', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3436', 'VH59', '325I RL MYS SKD          ', 'VH31', 'VH31', '1', '1', 'C3', 'E90 ', 'N52K', 'S', '4', 'R', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3437', 'VH61', '330I A                   ', 'VH61', 'VH61', '1', '1', '3', 'E90 ', 'N52K', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3438', 'VH62', '330I RL A                ', 'VH61', 'VH61', '1', '1', '3', 'E90 ', 'N52K', 'A', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3439', 'VH65', '330I A                   ', 'VH61', 'VH61', '1', '1', 'Z3', 'E90 ', 'N52K', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3440', 'VH66', '330I RL A                ', 'VH61', 'VH61', '1', '1', 'Z3', 'E90 ', 'N52K', 'A', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3441', 'VH69', '325I RL MYS SKD A        ', 'VH41', 'VH41', '1', '1', 'C3', 'E90 ', 'N52K', 'A', '4', 'R', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3442', 'VL01', 'X1 SDRIVE20I A           ', 'VL01', 'VL01', '1', '1', 'S1', 'E84 ', 'N20 ', 'A', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3443', 'VL02', 'X1 SDRIVE20I RL A        ', 'VL01', 'VL01', '1', '1', 'S1', 'E84 ', 'N20 ', 'A', '5', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3444', 'VL08', 'X1 SDRIVE20I A           ', 'VL01', 'VL01', '1', '1', 'L1', 'E84 ', 'N20 ', 'A', '5', 'R', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3445', 'VL11', 'SDRIVE 20I               ', 'VL11', 'VL11', '1', '1', 'S1', 'E84 ', 'N43 ', 'S', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3446', 'VL23', 'X1 XDRIVE28I A           ', 'VL23', 'VL23', '1', '1', 'G1', 'E84 ', 'N20 ', 'A', '5', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3447', 'VL31', 'X1 SDRIVE18I             ', 'VL31', 'VL31', '1', '1', 'S1', 'E84 ', 'N46T', 'S', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3448', 'VL32', 'X1 SDRIVE18I RL          ', 'VL31', 'VL31', '1', '1', 'S1', 'E84 ', 'N46T', 'S', '5', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3449', 'VL35', 'X1 SDRIVE18I EGY SKD     ', 'VL31', 'VL31', '1', '1', 'Y3', 'E84 ', 'N46T', 'S', '5', 'L', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3450', 'VL39', 'X1 SDRIVE 18I RUS SK     ', 'VL31', 'VL31', '1', '1', 'R3', 'E84 ', 'N46T', 'S', '5', 'L', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3451', 'VL41', 'X1 SDRIVE18I A           ', 'VL41', 'VL41', '1', '1', 'S1', 'E84 ', 'N46T', 'A', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3452', 'VL42', 'X1 SDRIVE18I RL A        ', 'VL41', 'VL41', '1', '1', 'S1', 'E84 ', 'N46T', 'A', '5', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3453', 'VL44', 'X1 SDRIVE18I THA SKA     ', 'VL41', 'VL41', '1', '1', 'T3', 'E84 ', 'N46T', 'A', '5', 'R', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3454', 'VL45', 'X1 SDRIVE18I EGY SKA     ', 'VL41', 'VL41', '1', '1', 'Y3', 'E84 ', 'N46T', 'A', '5', 'L', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3455', 'VL46', 'X1 SDRIVE18I RL A        ', 'VL41', 'VL41', '1', '1', 'D1', 'E84 ', 'N46T', 'A', '5', 'R', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3456', 'VL47', 'X1 SDRIVE18I IND SKA     ', 'VL41', 'VL41', '1', '1', 'I3', 'E84 ', 'N46T', 'A', '5', 'R', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3457', 'VL48', 'X1 SDRIVE18I MYS SKA     ', 'VL41', 'VL41', '1', '1', 'L1', 'E84 ', 'N46T', 'A', '5', 'R', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3458', 'VL49', 'X1 SDRIVE 18I RUS SA     ', 'VL41', 'VL41', '1', '1', 'R3', 'E84 ', 'N46T', 'A', '5', 'L', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3459', 'VL61', 'X1 XDRIVE25I A           ', 'VL61', 'VL61', '1', '1', 'G1', 'E84 ', 'N52K', 'A', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3460', 'VL62', 'X1 XDRIVE25I RL A        ', 'VL61', 'VL61', '1', '1', 'G1', 'E84 ', 'N52K', 'A', '5', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3461', 'VL63', 'X1 XDRIVE28I             ', '    ', '    ', '1', '1', 'G1', 'E84 ', 'N20 ', 'A', '5', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3462', 'VL91', 'X1 SDRIVE20I             ', 'VL91', 'VL91', '1', '1', 'S1', 'E84 ', 'N20 ', 'S', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3463', 'VL92', 'X1 SDRIVE20I RL          ', 'VL91', 'VL91', '1', '1', 'S1', 'E84 ', 'N20 ', 'S', '5', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3464', 'VM01', 'X1 XDRIVE20I A           ', 'VM01', 'VM01', '1', '1', 'G1', 'E84 ', 'N20 ', 'A', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3465', 'VM02', 'X1 XDRIVE20I RL A        ', 'VM01', 'VM01', '1', '1', 'G1', 'E84 ', 'N20 ', 'A', '5', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3466', 'VM09', 'X1 XDRIVE20I RUS SKA     ', 'VM01', 'VM01', '1', '1', 'R3', 'E84 ', 'N20 ', 'A', '5', 'L', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3467', 'VM11', 'X1 XDRIVE28I             ', 'VM11', 'VM11', '1', '1', 'G1', 'E84 ', 'N20 ', 'S', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3468', 'VM12', 'X1 XDRIVE28I RL          ', 'VM11', 'VM11', '1', '1', 'G1', 'E84 ', 'N20 ', 'S', '5', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3469', 'VM19', 'X1 XDRIVE28I RUS SKD     ', 'VM11', 'VM11', '1', '1', 'R3', 'E84 ', 'N20 ', 'S', '5', 'L', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3470', 'VM21', 'X1 XDRIVE28I A           ', 'VM21', 'VM21', '1', '1', 'G1', 'E84 ', 'N20 ', 'A', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3471', 'VM22', 'X1 XDRIVE28I RL A        ', 'VM21', 'VM21', '1', '1', 'G1', 'E84 ', 'N20 ', 'A', '5', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3472', 'VM23', 'X1 SDRIVE28I US A        ', 'VM23', 'VM23', '1', '1', 'S1', 'E84 ', 'N20 ', 'A', '5', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3473', 'VM29', 'X1 XDRIVE28I RUS SKA     ', 'VM21', 'VM21', '1', '1', 'R3', 'E84 ', 'N20 ', 'A', '5', 'L', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3474', 'VM41', 'X1 XDRIVE 28I A          ', 'VM41', 'VM41', '1', '1', 'G1', 'E84 ', 'N52K', 'A', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3475', 'VM63', 'X1 XDRIVE 35I US A       ', 'VM63', 'VM63', '1', '1', 'G1', 'E84 ', 'N55 ', 'A', '5', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3476', 'VM71', 'X1 XDRIVE25D             ', 'VM71', 'VM71', '1', '1', 'G1', 'E84 ', 'N47T', 'S', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3477', 'VM72', 'X1 XDRIVE25D RL          ', 'VM71', 'VM71', '1', '1', 'G1', 'E84 ', 'N47T', 'S', '5', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3478', 'VM81', 'X1 XDRIVE25D A           ', 'VM81', 'VM81', '1', '1', 'G1', 'E84 ', 'N47T', 'A', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3479', 'VM82', 'X1 XDRIVE25D RL A        ', 'VM81', 'VM81', '1', '1', 'G1', 'E84 ', 'N47T', 'A', '5', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3480', 'VM91', 'X1 XDRIVE20I             ', 'VM91', 'VM91', '1', '1', 'G1', 'E84 ', 'N20 ', 'S', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3481', 'VM92', 'X1 XDRIVE20I RL          ', 'VM91', 'VM91', '1', '1', 'G1', 'E84 ', 'N20 ', 'S', '5', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3482', 'VM99', 'X1 XDRIVE20I RUS SKD     ', 'VM91', 'VM91', '1', '1', 'R3', 'E84 ', 'N20 ', 'S', '5', 'L', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3483', 'VN01', 'X1 SDRIVE20D A           ', 'VN01', 'VN01', '1', '1', 'S1', 'E84 ', 'N47T', 'A', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3484', 'VN02', 'X1 SDRIVE20D RL A        ', 'VN01', 'VN01', '1', '1', 'S1', 'E84 ', 'N47T', 'A', '5', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3485', 'VN04', 'X1 SDRIVE20D A           ', 'VN01', 'VN01', '1', '1', 'T3', 'E84 ', 'N47T', 'A', '5', 'R', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3486', 'VN06', 'X1 SDRIVE20D RL A        ', 'VN01', 'VN01', '1', '1', 'D1', 'E84 ', 'N47T', 'A', '5', 'R', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3487', 'VN07', 'X1 SDRIVE20D IND SKA     ', 'VN01', 'VN01', '1', '1', 'I3', 'E84 ', 'N47T', 'A', '5', 'R', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3488', 'VN11', 'X1 SDRIVE18D             ', 'VN11', 'VN11', '1', '1', 'S1', 'E84 ', 'N47 ', 'S', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3489', 'VN12', 'X1 SDRIVE18D RL          ', 'VN11', 'VN11', '1', '1', 'S1', 'E84 ', 'N47 ', 'S', '5', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3490', 'VN21', 'X1 SDRIVE18D A           ', 'VN21', 'VN21', '1', '1', 'S1', 'E84 ', 'N47 ', 'A', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3491', 'VN31', 'X1 SDRIVE20D             ', 'VN31', 'VN31', '1', '1', 'S1', 'E84 ', 'N47 ', 'S', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3492', 'VN32', 'X1 SDRIVE20D RL          ', 'VN31', 'VN31', '1', '1', 'S1', 'E84 ', 'N47 ', 'S', '5', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3493', 'VN37', 'X1 SDRIVE20D IND SKD     ', 'VN31', 'VN31', '1', '1', 'I3', 'E84 ', 'N47 ', 'S', '5', 'R', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3494', 'VN41', 'X1 SDRIVE20D A           ', 'VN41', 'VN41', '1', '1', 'S1', 'E84 ', 'N47 ', 'A', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3495', 'VN42', 'X1 SDRIVE20D RL A        ', 'VN41', 'VN41', '1', '1', 'S1', 'E84 ', 'N47 ', 'A', '5', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3496', 'VN44', 'X1 SDRIVE20D A           ', 'VN41', 'VN41', '1', '1', 'T3', 'E84 ', 'N47 ', 'A', '5', 'R', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3497', 'VN46', 'X1 SDRIVE20D RL A        ', 'VN41', 'VN41', '1', '1', 'D1', 'E84 ', 'N47 ', 'A', '5', 'R', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3498', 'VN47', 'X1 SDRIVE20D IND SKA     ', 'VN41', 'VN41', '1', '1', 'I3', 'E84 ', 'N47 ', 'A', '5', 'R', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3499', 'VN71', 'X1 SDRIVE18D             ', 'VN71', 'VN71', '1', '1', 'S1', 'E84 ', 'N47T', 'S', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3500', 'VN72', 'X1 SDRIVE18D RL          ', 'VN71', 'VN71', '1', '1', 'S1', 'E84 ', 'N47T', 'S', '5', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3501', 'VN81', 'X1 SDRIVE18D A           ', 'VN81', 'VN81', '1', '1', 'S1', 'E84 ', 'N47T', 'A', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3502', 'VN82', 'X1 SDRIVE18D RL A        ', 'VN81', 'VN81', '1', '1', 'S1', 'E84 ', 'N47T', 'A', '5', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3503', 'VN91', 'X1 SDRIVE20D             ', 'VN91', 'VN91', '1', '1', 'S1', 'E84 ', 'N47T', 'S', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3504', 'VN92', 'X1 SDRIVE20D RL          ', 'VN91', 'VN91', '1', '1', 'S1', 'E84 ', 'N47T', 'S', '5', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3505', 'VP01', 'X1 XDRIVE20D A           ', 'VP01', 'VP01', '1', '1', 'G1', 'E84 ', 'N47T', 'A', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3506', 'VP02', 'X1 XDRIVE20D RL A        ', 'VP01', 'VP01', '1', '1', 'G1', 'E84 ', 'N47T', 'A', '5', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3507', 'VP09', 'X1 XDRIVE20D RUS SKA     ', 'VP01', 'VP01', '1', '1', 'R3', 'E84 ', 'N47T', 'A', '5', 'L', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3508', 'VP11', 'X1 XDRIVE18D             ', 'VP11', 'VP11', '1', '1', 'G1', 'E84 ', 'N47 ', 'S', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3509', 'VP12', 'X1 XDRIVE18D RL          ', 'VP11', 'VP11', '1', '1', 'G1', 'E84 ', 'N47 ', 'S', '5', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3510', 'VP21', 'X1 XDRIVE18D A           ', 'VP21', 'VP21', '1', '1', 'G1', 'E84 ', 'N47 ', 'A', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3511', 'VP31', 'X1 XDRIVE20D             ', 'VP31', 'VP31', '1', '1', 'G1', 'E84 ', 'N47 ', 'S', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3512', 'VP32', 'X1 XDRIVE20D RL          ', 'VP31', 'VP31', '1', '1', 'G1', 'E84 ', 'N47 ', 'S', '5', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3513', 'VP39', 'X1 XDRIVE20D RUS SKD     ', 'VP31', 'VP31', '1', '1', 'R3', 'E84 ', 'N47 ', 'S', '5', 'L', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3514', 'VP41', 'X1 XDRIVE20D A           ', 'VP41', 'VP41', '1', '1', 'G1', 'E84 ', 'N47 ', 'A', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3515', 'VP42', 'X1 XDRIVE20D RL A        ', 'VP41', 'VP41', '1', '1', 'G1', 'E84 ', 'N47 ', 'A', '5', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3516', 'VP48', 'X1 XDRIVE20D MYS SKA     ', 'VP41', 'VP41', '1', '1', 'C3', 'E84 ', 'N47 ', 'A', '5', 'R', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3517', 'VP49', 'X1 XDRIVE20D RUS SKA     ', 'VP41', 'VP41', '1', '1', 'R3', 'E84 ', 'N47 ', 'A', '5', 'L', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3518', 'VP51', 'X1 XDRIVE23D             ', 'VP51', 'VP51', '1', '1', 'G1', 'E84 ', 'N47S', 'S', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3519', 'VP52', 'X1 XDRIVE23D RL          ', 'VP51', 'VP51', '1', '1', 'G1', 'E84 ', 'N47S', 'S', '5', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3520', 'VP61', 'X1 XDRIVE23D A           ', 'VP61', 'VP61', '1', '1', 'G1', 'E84 ', 'N47S', 'A', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3521', 'VP62', 'X1 XDRIVE23D RL A        ', 'VP61', 'VP61', '1', '1', 'G1', 'E84 ', 'N47S', 'A', '5', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3522', 'VP71', 'X1 XDRIVE18D             ', 'VP71', 'VP71', '1', '1', 'G1', 'E84 ', 'N47T', 'S', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3523', 'VP72', 'X1 XDRIVE18D RL          ', 'VP71', 'VP71', '1', '1', 'G1', 'E84 ', 'N47T', 'S', '5', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3524', 'VP81', 'X1 XDRIVE18D A           ', 'VP81', 'VP81', '1', '1', 'G1', 'E84 ', 'N47T', 'A', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3525', 'VP82', 'X1 XDRIVE18D RL A        ', 'VP81', 'VP81', '1', '1', 'G1', 'E84 ', 'N47T', 'A', '5', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3526', 'VP91', 'X1 XDRIVE20D             ', 'VP91', 'VP91', '1', '1', 'G1', 'E84 ', 'N47T', 'S', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3527', 'VP92', 'X1 XDRIVE20D RL          ', 'VP91', 'VP91', '1', '1', 'G1', 'E84 ', 'N47T', 'S', '5', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3528', 'VR01', '320I TO A                ', 'VR01', 'VR01', '1', '1', '3', 'E91 ', 'N43 ', 'A', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3529', 'VR02', '320I RL TO A             ', 'VR01', 'VR01', '1', '1', '3', 'E91 ', 'N43 ', 'A', '5', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3530', 'VR31', '318I TO                  ', 'VR31', 'VR31', '1', '1', '3', 'E91 ', 'N43 ', 'S', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3531', 'VR32', '318I RL TO               ', 'VR31', 'VR31', '1', '1', '3', 'E91 ', 'N43 ', 'S', '5', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3532', 'VR41', '318I TO A                ', 'VR41', 'VR41', '1', '1', '3', 'E91 ', 'N43 ', 'A', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3533', 'VR42', '318I RL TO A             ', 'VR41', 'VR41', '1', '1', '3', 'E91 ', 'N43 ', 'A', '5', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3534', 'VR51', '318I TO                  ', 'VR51', 'VR51', '1', '1', '3', 'E91 ', 'N46 ', 'S', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3535', 'VR52', '318I RL TO               ', 'VR51', 'VR51', '1', '1', '3', 'E91 ', 'N46 ', 'S', '5', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3536', 'VR61', '318I TO A                ', 'VR61', 'VR61', '1', '1', '3', 'E91 ', 'N46 ', 'A', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3537', 'VR62', '318I RL TO A             ', 'VR61', 'VR61', '1', '1', '3', 'E91 ', 'N46 ', 'A', '5', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3538', 'VR71', '320I TO                  ', 'VR71', 'VR71', '1', '1', '3', 'E91 ', 'N46 ', 'S', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3539', 'VR72', '320I RL TO               ', 'VR71', 'VR71', '1', '1', '3', 'E91 ', 'N46 ', 'S', '5', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3540', 'VR81', '320I TO A                ', 'VR81', 'VR81', '1', '1', '3', 'E91 ', 'N46 ', 'A', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3541', 'VR82', '320I RL TO A             ', 'VR81', 'VR81', '1', '1', '3', 'E91 ', 'N46 ', 'A', '5', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3542', 'VR91', '320I TO                  ', 'VR91', 'VR91', '1', '1', '3', 'E91 ', 'N43 ', 'S', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3543', 'VR92', '320I RL TO               ', 'VR91', 'VR91', '1', '1', '3', 'E91 ', 'N43 ', 'S', '5', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3544', 'VS01', '335D TO A                ', 'VS01', 'VS01', '1', '1', '3', 'E91 ', 'M57Y', 'A', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3545', 'VS02', '335D RL TO A             ', 'VS01', 'VS01', '1', '1', '3', 'E91 ', 'M57Y', 'A', '5', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3546', 'VS11', '325I TO                  ', 'VS11', 'VS11', '1', '1', '3', 'E91 ', 'N52 ', 'S', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3547', 'VS12', '325I RL TO               ', 'VS11', 'VS11', '1', '1', '3', 'E91 ', 'N52 ', 'S', '5', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3548', 'VS13', '328I US TO               ', 'VS13', 'VS13', '1', '1', '3', 'E91 ', 'N52K', 'S', '5', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3549', 'VS21', '325I TO A                ', 'VS21', 'VS21', '1', '1', '3', 'E91 ', 'N52 ', 'A', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3550', 'VS22', '325I RL TO A             ', 'VS21', 'VS21', '1', '1', '3', 'E91 ', 'N52 ', 'A', '5', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3551', 'VS23', '328I US TO A             ', 'VS23', 'VS23', '1', '1', '3', 'E91 ', 'N52K', 'A', '5', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3552', 'VS31', '330I TO                  ', 'VS31', 'VS31', '1', '1', '3', 'E91 ', 'N52 ', 'S', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3553', 'VS32', '330I RL TO               ', 'VS31', 'VS31', '1', '1', '3', 'E91 ', 'N52 ', 'S', '5', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3554', 'VS41', '330I TO A                ', 'VS41', 'VS41', '1', '1', '3', 'E91 ', 'N52 ', 'A', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3555', 'VS42', '330I RL TO A             ', 'VS41', 'VS41', '1', '1', '3', 'E91 ', 'N52 ', 'A', '5', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3556', 'VS51', '323I TO                  ', 'VS51', 'VS51', '1', '1', '3', 'E91 ', 'N52 ', 'S', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3557', 'VS52', '323I RL TO               ', 'VS51', 'VS51', '1', '1', '3', 'E91 ', 'N52 ', 'S', '5', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3558', 'VS61', '323I TO A                ', 'VS61', 'VS61', '1', '1', '3', 'E91 ', 'N52 ', 'A', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3559', 'VS62', '323I RL TO A             ', 'VS61', 'VS61', '1', '1', '3', 'E91 ', 'N52 ', 'A', '5', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3560', 'VS71', '335I TO                  ', 'VS71', 'VS71', '1', '1', '3', 'E91 ', 'N54 ', 'S', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3561', 'VS72', '335I RL TO               ', 'VS71', 'VS71', '1', '1', '3', 'E91 ', 'N54 ', 'S', '5', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3562', 'VS81', '335I TO A                ', 'VS81', 'VS81', '1', '1', '3', 'E91 ', 'N54 ', 'A', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3563', 'VS82', '335I RL TO A             ', 'VS81', 'VS81', '1', '1', '3', 'E91 ', 'N54 ', 'A', '5', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3564', 'VT01', '330XD TO A               ', 'VT01', 'VT01', '1', '1', '3G', 'E91 ', 'M57S', 'A', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3565', 'VT11', '325XI TO                 ', 'VT11', 'VT11', '1', '1', '3G', 'E91 ', 'N52 ', 'S', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3566', 'VT13', '325XI US TO              ', 'VT13', 'VT13', '1', '1', '3G', 'E91 ', 'N52 ', 'S', '5', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3567', 'VT21', '325XI TO A               ', 'VT21', 'VT21', '1', '1', '3G', 'E91 ', 'N52 ', 'A', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3568', 'VT23', '325XI US TO A            ', 'VT23', 'VT23', '1', '1', '3G', 'E91 ', 'N52 ', 'A', '5', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3569', 'VT31', '330XI TO                 ', 'VT31', 'VT31', '1', '1', '3G', 'E91 ', 'N52 ', 'S', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3570', 'VT41', '330XI TO A               ', 'VT41', 'VT41', '1', '1', '3G', 'E91 ', 'N52 ', 'A', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3571', 'VT51', '335XI TO                 ', 'VT51', 'VT51', '1', '1', '3G', 'E91 ', 'N54 ', 'S', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3572', 'VT61', '335XI TO A               ', 'VT61', 'VT61', '1', '1', '3G', 'E91 ', 'N54 ', 'A', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3573', 'VT71', '325XI TO                 ', 'VT71', 'VT71', '1', '1', '3G', 'E91 ', 'N52K', 'S', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3574', 'VT73', '328XI US TO              ', 'VT73', 'VT73', '1', '1', '3G', 'E91 ', 'N52K', 'S', '5', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3575', 'VT81', '325XI TO A               ', 'VT81', 'VT81', '1', '1', '3G', 'E91 ', 'N52K', 'A', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3576', 'VT83', '328XI US TO A            ', 'VT83', 'VT83', '1', '1', '3G', 'E91 ', 'N52K', 'A', '5', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3577', 'VT91', '330XD TO                 ', 'VT91', 'VT91', '1', '1', '3G', 'E91 ', 'M57S', 'S', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3578', 'VU01', '330D TO A                ', 'VU01', 'VU01', '1', '1', '3', 'E91 ', 'M57S', 'A', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3579', 'VU02', '330D RL TO A             ', 'VU01', 'VU01', '1', '1', '3', 'E91 ', 'M57S', 'A', '5', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3580', 'VU11', '318D TO                  ', 'VU11', 'VU11', '1', '1', '3', 'E91 ', 'M47S', 'S', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3581', 'VU12', '318D RL TO               ', 'VU11', 'VU11', '1', '1', '3', 'E91 ', 'M47S', 'S', '5', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3582', 'VU31', '320D TO                  ', 'VU31', 'VU31', '1', '1', '3', 'E91 ', 'M47S', 'S', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3583', 'VU32', '320D RL TO               ', 'VU31', 'VU31', '1', '1', '3', 'E91 ', 'M47S', 'S', '5', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3584', 'VU41', '320D TO A                ', 'VU41', 'VU41', '1', '1', '3', 'E91 ', 'M47S', 'A', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3585', 'VU42', '320D RL TO A             ', 'VU41', 'VU41', '1', '1', '3', 'E91 ', 'M47S', 'A', '5', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3586', 'VU51', '320D TO                  ', 'VU51', 'VU51', '1', '1', '3', 'E91 ', 'N47 ', 'S', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3587', 'VU52', '320D RL TO               ', 'VU51', 'VU51', '1', '1', '3', 'E91 ', 'N47 ', 'S', '5', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3588', 'VU61', '320D TO A                ', 'VU61', 'VU61', '1', '1', '3', 'E91 ', 'N47 ', 'A', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3589', 'VU62', '320D RL TO A             ', 'VU61', 'VU61', '1', '1', '3', 'E91 ', 'N47 ', 'A', '5', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3590', 'VU71', '325D TO                  ', 'VU71', 'VU71', '1', '1', '3', 'E91 ', 'M57S', 'S', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3591', 'VU72', '325D RL TO               ', 'VU71', 'VU71', '1', '1', '3', 'E91 ', 'M57S', 'S', '5', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3592', 'VU81', '325D TO A                ', 'VU81', 'VU81', '1', '1', '3', 'E91 ', 'M57S', 'A', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3593', 'VU82', '325D RL TO A             ', 'VU81', 'VU81', '1', '1', '3', 'E91 ', 'M57S', 'A', '5', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3594', 'VU91', '330D TO                  ', 'VU91', 'VU91', '1', '1', '3', 'E91 ', 'M57S', 'S', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3595', 'VU92', '330D RL TO               ', 'VU91', 'VU91', '1', '1', '3', 'E91 ', 'M57S', 'S', '5', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3596', 'VV01', '330XI TO A               ', 'VV01', 'VV01', '1', '1', '3G', 'E91 ', 'N53 ', 'A', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3597', 'VV31', '325I TO                  ', 'VV31', 'VV31', '1', '1', '3', 'E91 ', 'N53 ', 'S', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3598', 'VV32', '325I RL TO               ', 'VV31', 'VV31', '1', '1', '3', 'E91 ', 'N53 ', 'S', '5', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3599', 'VV41', '325I TO A                ', 'VV41', 'VV41', '1', '1', '3', 'E91 ', 'N53 ', 'A', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3600', 'VV42', '325I RL TO A             ', 'VV41', 'VV41', '1', '1', '3', 'E91 ', 'N53 ', 'A', '5', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3601', 'VV51', '325XI TO                 ', 'VV51', 'VV51', '1', '1', '3G', 'E91 ', 'N53 ', 'S', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3602', 'VV61', '325XI TO A               ', 'VV61', 'VV61', '1', '1', '3G', 'E91 ', 'N53 ', 'A', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3603', 'VV71', '330I TO                  ', 'VV71', 'VV71', '1', '1', '3', 'E91 ', 'N53 ', 'S', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3604', 'VV72', '330I RL TO               ', 'VV71', 'VV71', '1', '1', '3', 'E91 ', 'N53 ', 'S', '5', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3605', 'VV81', '330I TO A                ', 'VV81', 'VV81', '1', '1', '3', 'E91 ', 'N53 ', 'A', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3606', 'VV82', '330I RL TO A             ', 'VV81', 'VV81', '1', '1', '3', 'E91 ', 'N53 ', 'A', '5', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3607', 'VV91', '330XI TO                 ', 'VV91', 'VV91', '1', '1', '3G', 'E91 ', 'N53 ', 'S', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3608', 'VW01', '325I TO A                ', 'VW01', 'VW01', '1', '1', '3', 'E91 ', 'N52K', 'A', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3609', 'VW02', '325I RL TO A             ', 'VW01', 'VW01', '1', '1', '3', 'E91 ', 'N52K', 'A', '5', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3610', 'VW11', '318D TO                  ', 'VW11', 'VW11', '1', '1', '3', 'E91 ', 'N47 ', 'S', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3611', 'VW12', '318D RL TO               ', 'VW11', 'VW11', '1', '1', '3', 'E91 ', 'N47 ', 'S', '5', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3612', 'VW31', '318I TO                  ', 'VW31', 'VW31', '1', '1', '3', 'E91 ', 'N46T', 'S', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3613', 'VW32', '318I RL TO               ', 'VW31', 'VW31', '1', '1', '3', 'E91 ', 'N46T', 'S', '5', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3614', 'VW41', '318I TO A                ', 'VW41', 'VW41', '1', '1', '3', 'E91 ', 'N46T', 'A', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3615', 'VW42', '318I RL TO A             ', 'VW41', 'VW41', '1', '1', '3', 'E91 ', 'N46T', 'A', '5', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3616', 'VW52', '323I RL TO               ', 'VW91', 'VW91', '1', '1', '3', 'E91 ', 'N52K', 'S', '5', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3617', 'VW62', '323I RL TO A             ', 'VW01', 'VW01', '1', '1', '3', 'E91 ', 'N52K', 'A', '5', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3618', 'VW71', '320I TO                  ', 'VW71', 'VW71', '1', '1', '3', 'E91 ', 'N46T', 'S', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3619', 'VW72', '320I RL TO               ', 'VW71', 'VW71', '1', '1', '3', 'E91 ', 'N46T', 'S', '5', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3620', 'VW81', '320I TO A                ', 'VW81', 'VW81', '1', '1', '3', 'E91 ', 'N46T', 'A', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3621', 'VW82', '320I RL TO A             ', 'VW81', 'VW81', '1', '1', '3', 'E91 ', 'N46T', 'A', '5', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3622', 'VW91', '325I TO                  ', 'VW91', 'VW91', '1', '1', '3', 'E91 ', 'N52K', 'S', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3623', 'VW92', '325I RL TO               ', 'VW91', 'VW91', '1', '1', '3', 'E91 ', 'N52K', 'S', '5', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3624', 'VX21', 'X1 SDRIVE16I A           ', 'VX21', 'VX21', '1', '1', 'S1', 'E84 ', 'N20 ', 'A', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3625', 'VY11', 'X1 SDRIVE16D             ', 'VY11', 'VY11', '1', '1', 'S1', 'E84 ', 'N47T', 'S', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3626', 'VY12', 'X1 SDRIVE16D             ', 'VY11', 'VY11', '1', '1', 'S1', 'E84 ', 'N47T', 'S', '5', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3627', 'VY21', 'X1 SDRIVE16D A           ', 'VY21', 'VY21', '1', '1', 'S1', 'E84 ', 'N47T', 'A', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3628', 'VY31', '330I TO                  ', 'VY31', 'VY31', '1', '1', '3', 'E91 ', 'N52K', 'S', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3629', 'VY32', '330I RL TO               ', 'VY31', 'VY31', '1', '1', '3', 'E91 ', 'N52K', 'S', '5', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3630', 'VY41', '330I TO A                ', 'VY41', 'VY41', '1', '1', '3', 'E91 ', 'N52K', 'A', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3631', 'VY42', '330I RL TO A             ', 'VY41', 'VY41', '1', '1', '3', 'E91 ', 'N52K', 'A', '5', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3632', 'VZ11', 'X1 SDRIVE18I             ', 'VL31', 'VL31', '1', '1', 'CY', 'E84 ', 'N46T', 'S', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3633', 'VZ21', 'X1 SDRIVE18I A           ', 'VL41', 'VL41', '1', '1', 'CY', 'E84 ', 'N46T', 'A', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3634', 'VZ41', 'X1 SDRIVE20I A           ', 'VL01', 'VL01', '1', '1', 'CY', 'E84 ', 'N20 ', 'A', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3635', 'VZ61', 'X1 XDRIVE20I A           ', 'VM01', 'VM01', '1', '1', 'CZ', 'E84 ', 'N20 ', 'A', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3636', 'VZ81', 'X1 XDRIVE28I A           ', 'VM21', 'VM21', '1', '1', 'CZ', 'E84 ', 'N20 ', 'A', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3637', 'VZ91', 'X1 SDRIVE20D ED          ', 'VZ91', 'VZ91', '1', '1', 'S1', 'E84 ', 'N47T', 'S', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3638', 'VZ92', 'X1 SDRIVE20D ED RL       ', 'VZ91', 'VZ91', '1', '1', 'S1', 'E84 ', 'N47T', 'S', '5', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3639', 'WA01', '330D CP A                ', 'WA01', 'WA01', '1', '1', '3', 'E92 ', 'N57 ', 'A', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3640', 'WA02', '330D RL CP A             ', 'WA01', 'WA01', '1', '1', '3', 'E92 ', 'N57 ', 'A', '2', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3641', 'WA11', '316I CP                  ', 'WA11', 'WA11', '1', '1', '3', 'E92 ', 'N43 ', 'S', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3642', 'WA12', '316I CP RL               ', 'WA11', 'WA11', '1', '1', '3', 'E92 ', 'N43 ', 'S', '2', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3643', 'WA51', '320I CP                  ', 'WA51', 'WA51', '1', '1', '3', 'E92 ', 'N46T', 'S', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3644', 'WA52', '320I RL CP               ', 'WA51', 'WA51', '1', '1', '3', 'E92 ', 'N46T', 'S', '2', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3645', 'WA61', '320I CP A                ', 'WA61', 'WA61', '1', '1', '3', 'E92 ', 'N46T', 'A', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3646', 'WA62', '320I RL CP A             ', 'WA61', 'WA61', '1', '1', '3', 'E92 ', 'N46T', 'A', '2', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3647', 'WA71', '320I CP                  ', 'WA71', 'WA71', '1', '1', '3', 'E92 ', 'N43 ', 'S', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3648', 'WA72', '320I RL CP               ', 'WA71', 'WA71', '1', '1', '3', 'E92 ', 'N43 ', 'S', '2', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3649', 'WA81', '320I CP A                ', 'WA81', 'WA81', '1', '1', '3', 'E92 ', 'N43 ', 'A', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3650', 'WA82', '320I RL CP A             ', 'WA81', 'WA81', '1', '1', '3', 'E92 ', 'N43 ', 'A', '2', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3651', 'WA91', '330D CP                  ', 'WA91', 'WA91', '1', '1', '3', 'E92 ', 'N57 ', 'S', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3652', 'WA92', '330D RL CP               ', 'WA91', 'WA91', '1', '1', '3', 'E92 ', 'N57 ', 'S', '2', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3653', 'WB01', '330D XDRIVE A            ', 'WB01', 'WB01', '1', '1', '3A', 'E92 ', 'N57 ', 'A', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3654', 'WB11', '323I CP                  ', 'WB11', 'WB11', '1', '1', '3', 'E92 ', 'N52K', 'S', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3655', 'WB12', '323I RL CP               ', 'WB11', 'WB11', '1', '1', '3', 'E92 ', 'N52K', 'S', '2', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3656', 'WB21', '323I CP A                ', 'WB21', 'WB21', '1', '1', '3', 'E92 ', 'N52K', 'A', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3657', 'WB22', '323I RL CP A             ', 'WB21', 'WB21', '1', '1', '3', 'E92 ', 'N52K', 'A', '2', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3658', 'WB31', '325I CP                  ', 'WB31', 'WB31', '1', '1', '3', 'E92 ', 'N52K', 'S', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3659', 'WB32', '325I RL CP               ', 'WB31', 'WB31', '1', '1', '3', 'E92 ', 'N52K', 'S', '2', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3660', 'WB33', '328I US CP               ', 'WB33', 'WB33', '1', '1', '3', 'E92 ', 'N52K', 'S', '2', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3661', 'WB41', '325I CP A                ', 'WB41', 'WB41', '1', '1', '3', 'E92 ', 'N52K', 'A', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3662', 'WB42', '325I RL CP A             ', 'WB41', 'WB41', '1', '1', '3', 'E92 ', 'N52K', 'A', '2', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3663', 'WB43', '328I US CP A             ', 'WB43', 'WB43', '1', '1', '3', 'E92 ', 'N52K', 'A', '2', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3664', 'WB51', '330I CP                  ', 'WB51', 'WB51', '1', '1', '3', 'E92 ', 'N52K', 'S', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3665', 'WB52', '330I RL CP               ', 'WB51', 'WB51', '1', '1', '3', 'E92 ', 'N52K', 'S', '2', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3666', 'WB61', '330I CP A                ', 'WB61', 'WB61', '1', '1', '3', 'E92 ', 'N52K', 'A', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3667', 'WB62', '330I RL CP A             ', 'WB61', 'WB61', '1', '1', '3', 'E92 ', 'N52K', 'A', '2', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3668', 'WB71', '335I CP                  ', 'WB71', 'WB71', '1', '1', '3', 'E92 ', 'N54 ', 'S', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3669', 'WB72', '335I RL CP               ', 'WB71', 'WB71', '1', '1', '3', 'E92 ', 'N54 ', 'S', '2', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3670', 'WB73', '335I US CP               ', 'WB73', 'WB73', '1', '1', '3', 'E92 ', 'N54 ', 'S', '2', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3671', 'WB81', '335I CP A                ', 'WB81', 'WB81', '1', '1', '3', 'E92 ', 'N54 ', 'A', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3672', 'WB82', '335I RL CP A             ', 'WB81', 'WB81', '1', '1', '3', 'E92 ', 'N54 ', 'A', '2', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3673', 'WB83', '335I US CP A             ', 'WB83', 'WB83', '1', '1', '3', 'E92 ', 'N54 ', 'A', '2', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3674', 'WB91', '330D XDRIVE              ', 'WB91', 'WB91', '1', '1', '3A', 'E92 ', 'N57 ', 'S', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3675', 'WC01', '330XD CP A               ', 'WC01', 'WC01', '1', '1', '3A', 'E92 ', 'M57S', 'A', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3676', 'WC11', '320D XDRIVE              ', 'WC11', 'WC11', '1', '1', '3A', 'E92 ', 'N47 ', 'S', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3677', 'WC21', '320D XDRIVE A            ', 'WC21', 'WC21', '1', '1', '3A', 'E92 ', 'N47 ', 'A', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3678', 'WC31', '325I XDRIVE              ', 'WC31', 'WC31', '1', '1', '3A', 'E92 ', 'N52K', 'S', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3679', 'WC33', '328I XDRIVE US           ', 'WC33', 'WC33', '1', '1', '3A', 'E92 ', 'N52K', 'S', '2', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3680', 'WC41', '325I XDRIVE A            ', 'WC41', 'WC41', '1', '1', '3A', 'E92 ', 'N52K', 'A', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3681', 'WC43', '328I XDRIVE US A         ', 'WC43', 'WC43', '1', '1', '3A', 'E92 ', 'N52K', 'A', '2', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3682', 'WC51', '330XI CP                 ', 'WC51', 'WC51', '1', '1', '3A', 'E92 ', 'N52K', 'S', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3683', 'WC61', '330XI CP A               ', 'WC61', 'WC61', '1', '1', '3A', 'E92 ', 'N52K', 'A', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3684', 'WC63', '330XI US CP A            ', 'WC61', 'WC61', '1', '1', '3A', 'E92 ', 'N52K', 'A', '2', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3685', 'WC71', '335I XDRIVE              ', 'WC71', 'WC71', '1', '1', '3A', 'E92 ', 'N54 ', 'S', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3686', 'WC73', '335I XDRIVE US           ', 'WC73', 'WC73', '1', '1', '3A', 'E92 ', 'N54 ', 'S', '2', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3687', 'WC81', '335I XDRIVE A            ', 'WC81', 'WC81', '1', '1', '3A', 'E92 ', 'N54 ', 'A', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3688', 'WC83', '335I XDRIVE US A         ', 'WC83', 'WC83', '1', '1', '3A', 'E92 ', 'N54 ', 'A', '2', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3689', 'WC91', '330XD CP                 ', 'WC91', 'WC91', '1', '1', '3A', 'E92 ', 'M57S', 'S', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3690', 'WD11', '320D CP                  ', 'WD11', 'WD11', '1', '1', '3', 'E92 ', 'N47 ', 'S', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3691', 'WD12', '320D RL CP               ', 'WD11', 'WD11', '1', '1', '3', 'E92 ', 'N47 ', 'S', '2', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3692', 'WD21', '320D CP A                ', 'WD21', 'WD21', '1', '1', '3', 'E92 ', 'N47 ', 'A', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3693', 'WD22', '320D RL CP A             ', 'WD21', 'WD21', '1', '1', '3', 'E92 ', 'N47 ', 'A', '2', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3694', 'WD31', '325D CP                  ', 'WD31', 'WD31', '1', '1', '3', 'E92 ', 'M57S', 'S', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3695', 'WD32', '325D RL CP               ', 'WD31', 'WD31', '1', '1', '3', 'E92 ', 'M57S', 'S', '2', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3696', 'WD41', '325D CP A                ', 'WD41', 'WD41', '1', '1', '3', 'E92 ', 'M57S', 'A', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3697', 'WD42', '325D RL CP A             ', 'WD41', 'WD41', '1', '1', '3', 'E92 ', 'M57S', 'A', '2', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3698', 'WD51', '330D CP                  ', 'WD51', 'WD51', '1', '1', '3', 'E92 ', 'M57S', 'S', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3699', 'WD52', '330D RL CP               ', 'WD51', 'WD51', '1', '1', '3', 'E92 ', 'M57S', 'S', '2', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3700', 'WD61', '330D CP A                ', 'WD61', 'WD61', '1', '1', '3', 'E92 ', 'M57S', 'A', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3701', 'WD62', '330D RL CP A             ', 'WD61', 'WD61', '1', '1', '3', 'E92 ', 'M57S', 'A', '2', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3702', 'WD81', '335D CP A                ', 'WD81', 'WD81', '1', '1', '3', 'E92 ', 'M57Y', 'A', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3703', 'WD82', '335D RL CP A             ', 'WD81', 'WD81', '1', '1', '3', 'E92 ', 'M57Y', 'A', '2', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3704', 'WD91', 'M3 COUPE                 ', 'WD91', 'WD91', '1', '1', 'M3', 'E92 ', 'S65 ', 'S', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3705', 'WD92', 'M3 COUPE RL              ', 'WD91', 'WD91', '1', '1', 'M3', 'E92 ', 'S65 ', 'S', '2', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3706', 'WD93', 'M3 COUPE US              ', 'WD93', 'WD93', '1', '1', 'M3', 'E92 ', 'S65 ', 'S', '2', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3707', 'WE01', '330I XDRIVE A            ', 'WE01', 'WE01', '1', '1', '3A', 'E92 ', 'N53 ', 'A', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3708', 'WE31', '325I CP                  ', 'WE31', 'WE31', '1', '1', '3', 'E92 ', 'N53 ', 'S', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3709', 'WE32', '325I RL CP               ', 'WE31', 'WE31', '1', '1', '3', 'E92 ', 'N53 ', 'S', '2', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3710', 'WE41', '325I CP A                ', 'WE41', 'WE41', '1', '1', '3', 'E92 ', 'N53 ', 'A', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3711', 'WE42', '325I RL CP A             ', 'WE41', 'WE41', '1', '1', '3', 'E92 ', 'N53 ', 'A', '2', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3712', 'WE51', '325I XDRIVE              ', 'WE51', 'WE51', '1', '1', '3A', 'E92 ', 'N53 ', 'S', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3713', 'WE61', '325I XDRIVE A            ', 'WE61', 'WE61', '1', '1', '3A', 'E92 ', 'N53 ', 'A', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3714', 'WE71', '330I CP                  ', 'WE71', 'WE71', '1', '1', '3', 'E92 ', 'N53 ', 'S', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3715', 'WE72', '330I RL CP               ', 'WE71', 'WE71', '1', '1', '3', 'E92 ', 'N53 ', 'S', '2', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3716', 'WE81', '330I CP A                ', 'WE81', 'WE81', '1', '1', '3', 'E92 ', 'N53 ', 'A', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3717', 'WE82', '330I RL CP A             ', 'WE81', 'WE81', '1', '1', '3', 'E92 ', 'N53 ', 'A', '2', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3718', 'WE91', '330I XDRIVE              ', 'WE91', 'WE91', '1', '1', '3A', 'E92 ', 'N53 ', 'S', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3719', 'WK51', '320I CA                  ', 'WK51', 'WK51', '1', '1', '3', 'E93 ', 'N46T', 'S', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3720', 'WK52', '320I RL CA               ', 'WK51', 'WK51', '1', '1', '3', 'E93 ', 'N46T', 'S', '2', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3721', 'WK61', '320I CA A                ', 'WK61', 'WK61', '1', '1', '3', 'E93 ', 'N46T', 'A', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3722', 'WK62', '320I RL CA A             ', 'WK61', 'WK61', '1', '1', '3', 'E93 ', 'N46T', 'A', '2', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3723', 'WK71', '320I CA                  ', 'WK71', 'WK71', '1', '1', '3', 'E93 ', 'N43 ', 'S', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3724', 'WK72', '320I RL CA               ', 'WK71', 'WK71', '1', '1', '3', 'E93 ', 'N43 ', 'S', '2', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3725', 'WK81', '320I CA A                ', 'WK81', 'WK81', '1', '1', '3', 'E93 ', 'N43 ', 'A', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3726', 'WK82', '320I RL CA A             ', 'WK81', 'WK81', '1', '1', '3', 'E93 ', 'N43 ', 'A', '2', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3727', 'WL11', '325I CA                  ', 'WL11', 'WL11', '1', '1', '3', 'E93 ', 'N52K', 'S', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3728', 'WL12', '325I RL CA               ', 'WL11', 'WL11', '1', '1', '3', 'E93 ', 'N52K', 'S', '2', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3729', 'WL13', '328I US CA               ', 'WL13', 'WL13', '1', '1', '3', 'E93 ', 'N52K', 'S', '2', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3730', 'WL21', '325I CA A                ', 'WL21', 'WL21', '1', '1', '3', 'E93 ', 'N52K', 'A', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3731', 'WL22', '325I RL CA A             ', 'WL21', 'WL21', '1', '1', '3', 'E93 ', 'N52K', 'A', '2', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3732', 'WL23', '328I US CA A             ', 'WL23', 'WL23', '1', '1', '3', 'E93 ', 'N52K', 'A', '2', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3733', 'WL32', '323I RL CA               ', 'WL11', 'WL11', '1', '1', '3', 'E93 ', 'N52K', 'S', '2', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3734', 'WL42', '323I RL CA A             ', 'WL21', 'WL21', '1', '1', '3', 'E93 ', 'N52K', 'A', '2', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3735', 'WL51', '330I CA                  ', 'WL51', 'WL51', '1', '1', '3', 'E93 ', 'N52K', 'S', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3736', 'WL52', '330I RL CA               ', 'WL51', 'WL51', '1', '1', '3', 'E93 ', 'N52K', 'S', '2', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3737', 'WL61', '330I CA A                ', 'WL61', 'WL61', '1', '1', '3', 'E93 ', 'N52K', 'A', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3738', 'WL62', '330I RL CA A             ', 'WL61', 'WL61', '1', '1', '3', 'E93 ', 'N52K', 'A', '2', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3739', 'WL71', '335I CA                  ', 'WL71', 'WL71', '1', '1', '3', 'E93 ', 'N54 ', 'S', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3740', 'WL72', '335I RL CA               ', 'WL71', 'WL71', '1', '1', '3', 'E93 ', 'N54 ', 'S', '2', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3741', 'WL73', '335I US CA               ', 'WL73', 'WL73', '1', '1', '3', 'E93 ', 'N54 ', 'S', '2', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3742', 'WL81', '335I CA A                ', 'WL81', 'WL81', '1', '1', '3', 'E93 ', 'N54 ', 'A', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3743', 'WL82', '335I RL CA A             ', 'WL81', 'WL81', '1', '1', '3', 'E93 ', 'N54 ', 'A', '2', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3744', 'WL83', '335I US CA A             ', 'WL83', 'WL83', '1', '1', '3', 'E93 ', 'N54 ', 'A', '2', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3745', 'WL91', 'M3 CABRIO                ', 'WL91', 'WL91', '1', '1', 'M3', 'E93 ', 'S65 ', 'S', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3746', 'WL92', 'M3 CABRIO RL             ', 'WL91', 'WL91', '1', '1', 'M3', 'E93 ', 'S65 ', 'S', '2', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3747', 'WL93', 'M3 CABRIO US             ', 'WL93', 'WL93', '1', '1', 'M3', 'E93 ', 'S65 ', 'S', '2', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3748', 'WM01', '330D CA A                ', 'WM01', 'WM01', '1', '1', '3', 'E93 ', 'N57 ', 'A', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3749', 'WM02', '330D RL CA A             ', 'WM01', 'WM01', '1', '1', '3', 'E93 ', 'N57 ', 'A', '2', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3750', 'WM31', '320D CA                  ', 'WM31', 'WM31', '1', '1', '3', 'E93 ', 'N47 ', 'S', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3751', 'WM32', '320D RL CA               ', 'WM31', 'WM31', '1', '1', '3', 'E93 ', 'N47 ', 'S', '2', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3752', 'WM41', '320D CA A                ', 'WM41', 'WM41', '1', '1', '3', 'E93 ', 'N47 ', 'A', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3753', 'WM42', '320D RL CA A             ', 'WM41', 'WM41', '1', '1', '3', 'E93 ', 'N47 ', 'A', '2', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3754', 'WM51', '330D CA                  ', 'WM51', 'WM51', '1', '1', '3', 'E93 ', 'M57S', 'S', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3755', 'WM52', '330D RL CA               ', 'WM51', 'WM51', '1', '1', '3', 'E93 ', 'M57S', 'S', '2', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3756', 'WM61', '330D CA A                ', 'WM61', 'WM61', '1', '1', '3', 'E93 ', 'M57S', 'A', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3757', 'WM62', '330D RL CA A             ', 'WM61', 'WM61', '1', '1', '3', 'E93 ', 'M57S', 'A', '2', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3758', 'WM71', '325D CA                  ', 'WM71', 'WM71', '1', '1', '3', 'E93 ', 'M57S', 'S', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3759', 'WM72', '325D RL CA               ', 'WM71', 'WM71', '1', '1', '3', 'E93 ', 'M57S', 'S', '2', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3760', 'WM81', '325D CA A                ', 'WM81', 'WM81', '1', '1', '3', 'E93 ', 'M57S', 'A', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3761', 'WM82', '325D RL CA A             ', 'WM81', 'WM81', '1', '1', '3', 'E93 ', 'M57S', 'A', '2', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3762', 'WM91', '330D CA                  ', 'WM91', 'WM91', '1', '1', '3', 'E93 ', 'N57 ', 'S', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3763', 'WM92', '330D RL CA               ', 'WM91', 'WM91', '1', '1', '3', 'E93 ', 'N57 ', 'S', '2', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3764', 'WN31', '325I CA                  ', 'WN31', 'WN31', '1', '1', '3', 'E93 ', 'N53 ', 'S', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3765', 'WN32', '325I RL CA               ', 'WN31', 'WN31', '1', '1', '3', 'E93 ', 'N53 ', 'S', '2', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3766', 'WN41', '325I CA A                ', 'WN41', 'WN41', '1', '1', '3', 'E93 ', 'N53 ', 'A', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3767', 'WN42', '325I RL CA A             ', 'WN41', 'WN41', '1', '1', '3', 'E93 ', 'N53 ', 'A', '2', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3768', 'WN71', '330I CA                  ', 'WN71', 'WN71', '1', '1', '3', 'E93 ', 'N53 ', 'S', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3769', 'WN72', '330I RL CA               ', 'WN71', 'WN71', '1', '1', '3', 'E93 ', 'N53 ', 'S', '2', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3770', 'WN81', '330I CA A                ', 'WN81', 'WN81', '1', '1', '3', 'E93 ', 'N53 ', 'A', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3771', 'WN82', '330I RL CA A             ', 'WN81', 'WN81', '1', '1', '3', 'E93 ', 'N53 ', 'A', '2', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3772', 'WR33', '328I US CA               ', 'WR33', 'WR33', '1', '1', '3', 'E93 ', 'N51 ', 'S', '2', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3773', 'WR41', '328I CA KOREA A          ', 'WR43', 'WR43', '1', '1', 'K3', 'E93 ', 'N51 ', 'A', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3774', 'WR43', '328I US CA A             ', 'WR43', 'WR43', '1', '1', '3', 'E93 ', 'N51 ', 'A', '2', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3775', 'WV13', '328I US CP               ', 'WV13', 'WV13', '1', '1', '3', 'E92 ', 'N51 ', 'S', '2', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3776', 'WV23', '328I US CP A             ', 'WV23', 'WV23', '1', '1', '3', 'E92 ', 'N51 ', 'A', '2', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3777', 'WV53', '328I XDRIVE US           ', 'WV53', 'WV53', '1', '1', '3A', 'E92 ', 'N51 ', 'S', '2', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3778', 'WV63', '328I XDRIVE US A         ', 'WV63', 'WV63', '1', '1', '3A', 'E92 ', 'N51 ', 'A', '2', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3779', 'WX01', 'X3 XDRIVE28I A           ', 'WX01', 'WX01', '1', '1', 'G3', 'F25 ', 'N20 ', 'A', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3780', 'WX02', 'X3 XDRIVE28I RL A        ', 'WX01', 'WX01', '1', '1', 'G3', 'F25 ', 'N20 ', 'A', '5', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3781', 'WX03', 'X3 XDRIVE28I US A        ', 'WX03', 'WX03', '1', '1', 'G3', 'F25 ', 'N20 ', 'A', '5', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3782', 'WX09', 'X3 XDRIVE28I RUS SKA     ', 'WX01', 'WX01', '1', '1', 'R3', 'F25 ', 'N20 ', 'A', '5', 'L', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3783', 'WX31', 'X3 XDRIVE20I             ', 'WX31', 'WX31', '1', '1', 'G3', 'F25 ', 'N20 ', 'S', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3784', 'WX32', 'X3 XDRIVE20I RL          ', 'WX31', 'WX31', '1', '1', 'G3', 'F25 ', 'N20 ', 'S', '5', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3785', 'WX41', 'X3 XDRIVE20I A           ', 'WX41', 'WX41', '1', '1', 'G3', 'F25 ', 'N20 ', 'A', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3786', 'WX42', 'X3 XDRIVE20I RL A        ', 'WX41', 'WX41', '1', '1', 'G3', 'F25 ', 'N20 ', 'A', '5', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3787', 'WX45', 'X3 XDRIVE20I A           ', 'WX41', 'WX41', '1', '1', 'Y3', 'F25 ', 'N20 ', 'A', '5', 'L', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3788', 'WX46', 'X3 XDRIVE20I RL A        ', 'WX41', 'WX41', '1', '1', 'D3', 'F25 ', 'N20 ', 'A', '5', 'R', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3789', 'WX48', 'X3 XDRIVE20I RL A        ', 'WX41', 'WX41', '1', '1', 'XM', 'F25 ', 'N20 ', 'A', '5', 'R', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3790', 'WX49', 'X3 XDRIVE20I A           ', 'WX41', 'WX41', '1', '1', 'R3', 'F25 ', 'N20 ', 'A', '5', 'L', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3791', 'WX59', 'X3 XDRIVE 28I RUS SK     ', '    ', '    ', '1', '1', 'R3', 'F25 ', 'N52T', 'S', '5', 'L', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3792', 'WX61', 'X3 XDRIVE 28I A          ', 'WX61', 'WX61', '1', '1', 'G3', 'F25 ', 'N52T', 'A', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3793', 'WX62', 'X3 XDRIVE 28I RL A       ', 'WX61', 'WX61', '1', '1', 'G3', 'F25 ', 'N52T', 'A', '5', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3794', 'WX63', 'X3 XDRIVE 28I US A       ', 'WX63', 'WX63', '1', '1', 'G3', 'F25 ', 'N52T', 'A', '5', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3795', 'WX69', 'X3 XDRIVE 28I RUS SA     ', 'WX61', 'WX61', '1', '1', 'R3', 'F25 ', 'N52T', 'A', '5', 'L', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3796', 'WX81', 'X3 XDRIVE35I A           ', 'WX81', 'WX81', '1', '1', 'G3', 'F25 ', 'N55 ', 'A', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3797', 'WX82', 'X3 XDRIVE35I A           ', 'WX81', 'WX81', '1', '1', 'G3', 'F25 ', 'N55 ', 'A', '5', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3798', 'WX83', 'X3 XDRIVE35I A           ', 'WX83', 'WX83', '1', '1', 'G3', 'F25 ', 'N55 ', 'A', '5', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3799', 'WX85', 'X3 XDRIVE 35I EGY SA     ', 'WX81', 'WX81', '1', '1', 'Y3', 'F25 ', 'N55 ', 'A', '5', 'L', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3800', 'WX89', 'X3 XDRIVE35I A           ', 'WX81', 'WX81', '1', '1', 'R3', 'F25 ', 'N55 ', 'A', '5', 'L', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3801', 'WY11', 'X3 SDRIVE18D             ', 'WY11', 'WY11', '1', '1', 'G3', 'F25 ', 'N47T', 'S', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3802', 'WY12', 'X3 SDRIVE18D RL          ', 'WY11', 'WY11', '1', '1', 'G3', 'F25 ', 'N47T', 'S', '5', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3803', 'WY21', 'X3 SDRIVE18D A           ', 'WY21', 'WY21', '1', '1', 'G3', 'F25 ', 'N47T', 'A', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3804', 'WY22', 'X3 SDRIVE18D RL A        ', 'WY21', 'WY21', '1', '1', 'G3', 'F25 ', 'N47T', 'A', '5', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3805', 'WY31', 'X3 XDRIVE20D             ', 'WY31', 'WY31', '1', '1', 'G3', 'F25 ', 'N47T', 'S', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3806', 'WY32', 'X3 XDRIVE 20D RL         ', 'WY31', 'WY31', '1', '1', 'G3', 'F25 ', 'N47T', 'S', '5', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3807', 'WY39', 'X3 XDRIVE20D             ', 'WY31', 'WY31', '1', '1', 'R3', 'F25 ', 'N47T', 'S', '5', 'L', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3808', 'WY41', 'X3 XDRIVE20D A           ', 'WY41', 'WY41', '1', '1', 'G3', 'F25 ', 'N47T', 'A', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3809', 'WY42', 'X3 XDRIVE 20D RL A       ', 'WY41', 'WY41', '1', '1', 'G3', 'F25 ', 'N47T', 'A', '5', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3810', 'WY44', 'X3 XDRIVE20D A           ', 'WY41', 'WY41', '1', '1', 'TX', 'F25 ', 'N47T', 'A', '5', 'R', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3811', 'WY46', 'X3 XDRIVE20D A           ', 'WY41', 'WY41', '1', '1', 'D3', 'F25 ', 'N47T', 'A', '5', 'R', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3812', 'WY47', 'X3 XDRIVE20D A           ', 'WY41', 'WY41', '1', '1', 'I3', 'F25 ', 'N47T', 'A', '5', 'R', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3813', 'WY49', 'X3 XDRIVE20D A           ', 'WY41', 'WY41', '1', '1', 'R3', 'F25 ', 'N47T', 'A', '5', 'L', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3814', 'WY59', 'X3 XDRIVE30D             ', '    ', '    ', '1', '1', 'R3', 'F25 ', 'N57T', 'S', '5', 'L', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3815', 'WY61', 'X3 XDRIVE30D A           ', 'WY61', 'WY61', '1', '1', 'G3', 'F25 ', 'N57T', 'A', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3816', 'WY62', 'X3 XDRIVE30D A           ', 'WY61', 'WY61', '1', '1', 'G3', 'F25 ', 'N57T', 'A', '5', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3817', 'WY67', 'X3 XDRIVE30D A           ', 'WY61', 'WY61', '1', '1', 'I3', 'F25 ', 'N57T', 'A', '5', 'R', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3818', 'WY69', 'X3 XDRIVE30D A           ', 'WY61', 'WY61', '1', '1', 'R3', 'F25 ', 'N57T', 'A', '5', 'L', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3819', 'WY81', 'X3 XDRIVE35D A           ', 'WY81', 'WY81', '1', '1', 'G3', 'F25 ', 'N57Z', 'A', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3820', 'WY82', 'X3 XDRIVE35D A           ', 'WY81', 'WY81', '1', '1', 'G3', 'F25 ', 'N57Z', 'A', '5', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3821', 'XA01', '535D XDRIVE A            ', 'XA01', 'XA01', '1', '1', '5X', 'F10 ', 'N57Z', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3822', 'XA15', '525D XDRIVE SKD RUS      ', '    ', '    ', '1', '1', '5R', 'F10 ', 'N47T', 'S', '4', 'L', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3823', 'XA21', '525D XDRIVE A            ', 'XA21', 'XA21', '1', '1', '5X', 'F10 ', 'N47T', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3824', 'XA25', '525D XDRIVE SKD RUSA     ', 'XA21', 'XA21', '1', '1', '5R', 'F10 ', 'N47T', 'A', '4', 'L', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3825', 'XA31', '525D                     ', 'XA31', 'XA31', '1', '1', '5', 'F10 ', 'N47T', 'S', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3826', 'XA32', '525D RL                  ', 'XA31', 'XA31', '1', '1', '5', 'F10 ', 'N47T', 'S', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3827', 'XA41', '525D A                   ', 'XA41', 'XA41', '1', '1', '5', 'F10 ', 'N47T', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3828', 'XA42', '525D RL A                ', 'XA41', 'XA41', '1', '1', '5', 'F10 ', 'N47T', 'A', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3829', 'XA51', '530D                     ', 'XA51', 'XA51', '1', '1', '5', 'F10 ', 'N57T', 'S', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3830', 'XA52', '530D RL                  ', 'XA51', 'XA51', '1', '1', '5', 'F10 ', 'N57T', 'S', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3831', 'XA61', '530D A                   ', 'XA61', 'XA61', '1', '1', '5', 'F10 ', 'N57T', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3832', 'XA62', '530D RL A                ', 'XA61', 'XA61', '1', '1', '5', 'F10 ', 'N57T', 'A', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3833', 'XA63', '535D A                   ', 'XA63', 'XA63', '1', '1', '5', 'F10 ', 'N57T', 'A', '4', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3834', 'XA65', '530D IND SKD RL A        ', 'XA61', 'XA61', '1', '1', 'C5', 'F10 ', 'N57T', 'A', '4', 'R', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3835', 'XA81', '535D A                   ', 'XA81', 'XA81', '1', '1', '5', 'F10 ', 'N57Z', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3836', 'XA82', '535D RL A                ', 'XA81', 'XA81', '1', '1', '5', 'F10 ', 'N57Z', 'A', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3837', 'XB01', '525D XDRIVE A            ', 'XB01', 'XB01', '1', '1', '5X', 'F11 ', 'N47T', 'A', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3838', 'XB21', '535D XDRIVE A            ', 'XB21', 'XB21', '1', '1', '5X', 'F11 ', 'N57Z', 'A', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3839', 'XB31', '525D                     ', 'XB31', 'XB31', '1', '1', '5', 'F11 ', 'N47T', 'S', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3840', 'XB32', '525D RL                  ', 'XB31', 'XB31', '1', '1', '5', 'F11 ', 'N47T', 'S', '5', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3841', 'XB41', '525D A                   ', 'XB41', 'XB41', '1', '1', '5', 'F11 ', 'N47T', 'A', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3842', 'XB42', '525D RL A                ', 'XB41', 'XB41', '1', '1', '5', 'F11 ', 'N47T', 'A', '5', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3843', 'XB51', '530D                     ', 'XB51', 'XB51', '1', '1', '5', 'F11 ', 'N57T', 'S', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3844', 'XB52', '530D RL                  ', 'XB51', 'XB51', '1', '1', '5', 'F11 ', 'N57T', 'S', '5', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3845', 'XB61', '530D A                   ', 'XB61', 'XB61', '1', '1', '5', 'F11 ', 'N57T', 'A', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3846', 'XB62', '530D RL A                ', 'XB61', 'XB61', '1', '1', '5', 'F11 ', 'N57T', 'A', '5', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3847', 'XB81', '535D A                   ', 'XB81', 'XB81', '1', '1', '5', 'F11 ', 'N57Z', 'A', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3848', 'XB82', '535D RL A                ', 'XB81', 'XB81', '1', '1', '5', 'F11 ', 'N57Z', 'A', '5', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3849', 'XC01', '520D GT                  ', 'XC01', 'XC01', '1', '1', 'GT', 'F07 ', 'N47T', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3850', 'XC02', '520D GT RL               ', 'XC01', 'XC01', '1', '1', 'GT', 'F07 ', 'N47T', 'A', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3851', 'XC21', '530D XDRIVE              ', 'XC21', 'XC21', '1', '1', 'GX', 'F07 ', 'N57T', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3852', 'XC41', '535D XDRIVE              ', 'XC41', 'XC41', '1', '1', 'GX', 'F07 ', 'N57Z', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3853', 'XC61', '530D                     ', 'XC61', 'XC61', '1', '1', 'GT', 'F07 ', 'N57T', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3854', 'XC62', '530D RL                  ', 'XC61', 'XC61', '1', '1', 'GT', 'F07 ', 'N57T', 'A', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3855', 'XC81', '535D                     ', 'XC81', 'XC81', '1', '1', 'GT', 'F07 ', 'N57Z', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3856', 'XC82', '535D RL                  ', 'XC81', 'XC81', '1', '1', 'GT', 'F07 ', 'N57Z', 'A', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3857', 'XD11', 'JOHN COOPER WORKS        ', 'XD11', 'XD11', '1', '1', 'QK', 'R60 ', 'N18 ', 'S', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3858', 'XD12', 'JOHN COOPER WORKS RL     ', 'XD11', 'XD11', '1', '1', 'QK', 'R60 ', 'N18 ', 'S', '5', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3859', 'XD13', 'JOHN COOPER WORKS US     ', 'XD13', 'XD13', '1', '1', 'QK', 'R60 ', 'N18 ', 'S', '5', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3860', 'XD21', 'JOHN COOPER WORKS A      ', 'XD21', 'XD21', '1', '1', 'QK', 'R60 ', 'N18 ', 'A', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3861', 'XD22', 'JOHN COOPER WORKS RA     ', 'XD21', 'XD21', '1', '1', 'QK', 'R60 ', 'N18 ', 'A', '5', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3862', 'XD23', 'JOHN COOPER WORKS UA     ', 'XD23', 'XD23', '1', '1', 'QK', 'R60 ', 'N18 ', 'A', '5', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3863', 'XD41', 'COOPER D A               ', 'XD41', 'XD41', '1', '1', 'RM', 'R60 ', 'N47T', 'A', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3864', 'XD42', 'COOPER D RL A            ', 'XD41', 'XD41', '1', '1', 'RM', 'R60 ', 'N47T', 'A', '5', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3865', 'XD61', 'COOPER D ALL4 A          ', 'XD61', 'XD61', '1', '1', 'RM', 'R60 ', 'N47T', 'A', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3866', 'XD62', 'COOPER D ALL4 RL A       ', 'XD61', 'XD61', '1', '1', 'RM', 'R60 ', 'N47T', 'A', '5', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3867', 'XD81', 'COOPER ALL4 A            ', 'XD81', 'XD81', '1', '1', 'RA', 'R60 ', 'N18 ', 'A', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3868', 'XD82', 'COOPER ALL4 A            ', 'XD81', 'XD81', '1', '1', 'RA', 'R60 ', 'N18 ', 'A', '5', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3869', 'XG11', '520I                     ', 'XG11', 'XG11', '1', '1', '5', 'F10 ', 'N20 ', 'S', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3870', 'XG12', '520I RL                  ', 'XG11', 'XG11', '1', '1', '5', 'F10 ', 'N20 ', 'S', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3871', 'XG16', '520I SKD EGY             ', 'XG11', 'XG11', '1', '1', 'Y5', 'F10 ', 'N20 ', 'S', '4', 'L', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3872', 'XG21', '520I A                   ', 'XG21', 'XG21', '1', '1', '5', 'F10 ', 'N20 ', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3873', 'XG22', '520I RL A                ', 'XG21', 'XG21', '1', '1', '5', 'F10 ', 'N20 ', 'A', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3874', 'XG24', '520I SKD MYS RL A        ', 'XG21', 'XG21', '1', '1', 'L5', 'F10 ', 'N20 ', 'A', '4', 'R', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3875', 'XG25', '520I SKD IND RL A        ', 'XG21', 'XG21', '1', '1', 'C5', 'F10 ', 'N20 ', 'A', '4', 'R', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3876', 'XG26', '520I SKD EGY A           ', 'XG21', 'XG21', '1', '1', 'Y5', 'F10 ', 'N20 ', 'A', '4', 'L', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3877', 'XG28', '520I SKD RL THA A        ', 'XG21', 'XG21', '1', '1', 'T5', 'F10 ', 'N20 ', 'A', '4', 'R', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3878', 'XG31', '528I                     ', 'XG31', 'XG31', '1', '1', '5', 'F10 ', 'N20 ', 'S', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3879', 'XG32', '528I RL                  ', 'XG31', 'XG31', '1', '1', '5', 'F10 ', 'N20 ', 'S', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3880', 'XG41', '528I A                   ', 'XG41', 'XG41', '1', '1', '5', 'F10 ', 'N20 ', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3881', 'XG42', '528I RL A                ', 'XG41', 'XG41', '1', '1', '5', 'F10 ', 'N20 ', 'A', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3882', 'XG44', '528I SKD MYS RL A        ', 'XG41', 'XG41', '1', '1', 'L5', 'F10 ', 'N20 ', 'A', '4', 'R', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3883', 'XG45', '525D SKD IND RL A        ', 'XA41', 'XA41', '1', '1', 'C5', 'F10 ', 'N47T', 'A', '4', 'R', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3884', 'XG46', '528I SKD EGY A           ', 'XG41', 'XG41', '1', '1', 'Y5', 'F10 ', 'N20 ', 'A', '4', 'L', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3885', 'XG48', '528I SKD RL THA A        ', 'XG41', 'XG41', '1', '1', 'T5', 'F10 ', 'N20 ', 'A', '4', 'R', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3886', 'XG55', '520I SKD RUS             ', 'XG11', 'XG11', '1', '1', 'R5', 'F10 ', 'N20 ', 'S', '4', 'L', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3887', 'XG63', '528I US A                ', 'XG63', 'XG63', '1', '1', '5', 'F10 ', 'N20 ', 'A', '4', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3888', 'XG65', '520I SKD RUS A           ', 'XG21', 'XG21', '1', '1', 'R5', 'F10 ', 'N20 ', 'A', '4', 'L', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3889', 'XG66', '520I RL A                ', 'XG21', 'XG21', '1', '1', 'C5', 'F10 ', 'N20 ', 'A', '4', 'R', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3890', 'XG68', '525D SKD RL THA A        ', 'XA41', 'XA41', '1', '1', 'T5', 'F10 ', 'N47T', 'A', '4', 'R', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3891', 'XG75', '528I SKD RUS             ', 'XG31', 'XG31', '1', '1', 'R5', 'F10 ', 'N20 ', 'S', '4', 'L', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3892', 'XG85', '528I SKD RUS A           ', 'XG41', 'XG41', '1', '1', 'R5', 'F10 ', 'N20 ', 'A', '4', 'L', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3893', 'XG86', '528I RL A                ', 'XG41', 'XG41', '1', '1', 'C5', 'F10 ', 'N20 ', 'A', '4', 'R', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3894', 'XH25', '528I XDRIVE SKD RUSA     ', 'XH41', 'XH41', '1', '1', '5R', 'F10 ', 'N20 ', 'A', '4', 'L', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3895', 'XH41', '528I XDRIVE A            ', 'XH41', 'XH41', '1', '1', '5X', 'F10 ', 'N20 ', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3896', 'XH63', '528I XDRIVE US A         ', 'XH63', 'XH63', '1', '1', '5X', 'F10 ', 'N20 ', 'A', '4', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3897', 'XH71', '530I                     ', 'XH71', 'XH71', '1', '1', '5', 'F10 ', 'N53 ', 'S', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3898', 'XH72', '530I RL                  ', 'XH71', 'XH71', '1', '1', '5', 'F10 ', 'N53 ', 'S', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3899', 'XH81', '530I A                   ', 'XH81', 'XH81', '1', '1', '5', 'F10 ', 'N53 ', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3900', 'XH82', '530I RL A                ', 'XH81', 'XH81', '1', '1', '5', 'F10 ', 'N53 ', 'A', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3901', 'XL11', '520I                     ', 'XL11', 'XL11', '1', '1', '5', 'F11 ', 'N20 ', 'S', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3902', 'XL12', '520I RL                  ', 'XL11', 'XL11', '1', '1', '5', 'F11 ', 'N20 ', 'S', '5', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3903', 'XL21', '520I A                   ', 'XL21', 'XL21', '1', '1', '5', 'F11 ', 'N20 ', 'A', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3904', 'XL22', '520I RL A                ', 'XL21', 'XL21', '1', '1', '5', 'F11 ', 'N20 ', 'A', '5', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3905', 'XL31', '528I                     ', 'XL31', 'XL31', '1', '1', '5', 'F11 ', 'N20 ', 'S', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3906', 'XL32', '528I RL                  ', 'XL31', 'XL31', '1', '1', '5', 'F11 ', 'N20 ', 'S', '5', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3907', 'XL41', '528I A                   ', 'XL41', 'XL41', '1', '1', '5', 'F11 ', 'N20 ', 'A', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3908', 'XL42', '528I RL A                ', 'XL41', 'XL41', '1', '1', '5', 'F11 ', 'N20 ', 'A', '5', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3909', 'XL61', '528I XDRIVE A            ', 'XL61', 'XL61', '1', '1', '5X', 'F11 ', 'N20 ', 'A', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3910', 'XZ01', 'WRAITH                   ', 'XZ01', 'XZ01', '1', '1', 'RR', 'RR5 ', 'N74R', 'A', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3911', 'XZ03', 'WRAITH                   ', 'XZ03', 'XZ03', '1', '1', 'RR', 'RR5 ', 'N74R', 'A', '2', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3912', 'XZ41', 'GHOST EW                 ', 'XZ41', 'XZ41', '1', '1', 'RR', 'RR4 ', 'N74R', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3913', 'XZ42', 'GHOST EW                 ', 'XZ41', 'XZ41', '1', '1', 'RR', 'RR4 ', 'N74R', 'A', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3914', 'XZ43', 'GHOST EW                 ', 'XZ43', 'XZ43', '1', '1', 'RR', 'RR4 ', 'N74R', 'A', '4', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3915', 'YA01', 'ACTIVE HYBRID 7          ', 'YA01', 'YA01', '1', '1', '7H', 'F01 ', 'N55 ', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3916', 'YA02', 'ACTIVE HYBRID 7          ', 'YA01', 'YA01', '1', '1', '7H', 'F01 ', 'N55 ', 'A', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3917', 'YA21', '730I                     ', 'YA21', 'YA21', '1', '1', '7', 'F01 ', 'N52T', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3918', 'YA41', '760I                     ', 'YA41', 'YA41', '1', '1', '7', 'F01 ', 'N74 ', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3919', 'YA61', '740I                     ', 'YA61', 'YA61', '1', '1', '7', 'F01 ', 'N55 ', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3920', 'YA62', '740I RL                  ', 'YA61', 'YA61', '1', '1', '7', 'F01 ', 'N55 ', 'A', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3921', 'YA63', '740I US                  ', 'YA63', 'YA63', '1', '1', '7', 'F01 ', 'N55 ', 'A', '4', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3922', 'YA73', '750I US ALPINA B7US      ', 'YA73', 'YA73', '1', '1', '7', 'F01 ', 'N63T', 'A', '4', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3923', 'YA81', '750I                     ', 'YA81', 'YA81', '1', '1', '7', 'F01 ', 'N63T', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3924', 'YA82', '750I RL                  ', 'YA81', 'YA81', '1', '1', '7', 'F01 ', 'N63T', 'A', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3925', 'YA83', '750I US                  ', 'YA83', 'YA83', '1', '1', '7', 'F01 ', 'N63T', 'A', '4', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3926', 'YB01', '740D XDRIVE              ', 'YB01', 'YB01', '1', '1', '7X', 'F01 ', 'N57Z', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3927', 'YB53', '750I XDRIVE US ALPI      ', 'YB53', 'YB53', '1', '1', '7X', 'F01 ', 'N63T', 'A', '4', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3928', 'YB61', '750I XDRIVE              ', 'YB61', 'YB61', '1', '1', '7X', 'F01 ', 'N63T', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3929', 'YB63', '750I XDRIVE US           ', 'YB63', 'YB63', '1', '1', '7X', 'F01 ', 'N63T', 'A', '4', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3930', 'YB81', '750D XDRIVE              ', 'YB81', 'YB81', '1', '1', '7X', 'F01 ', 'N57X', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3931', 'YC21', '730D                     ', 'YC21', 'YC21', '1', '1', '7', 'F01 ', 'N57T', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3932', 'YC22', '730D RL                  ', 'YC21', 'YC21', '1', '1', '7', 'F01 ', 'N57T', 'A', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3933', 'YC41', '730D XDRIVE              ', 'YC41', 'YC41', '1', '1', '7X', 'F01 ', 'N57T', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3934', 'YC81', '740D                     ', 'YC81', 'YC81', '1', '1', '7', 'F01 ', 'N57Z', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3935', 'YC82', '740D RL                  ', 'YC81', 'YC81', '1', '1', '7', 'F01 ', 'N57Z', 'A', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3936', 'YE01', 'ACTIVE HYBRID 7          ', 'YE01', 'YE01', '1', '1', '7H', 'F02 ', 'N55 ', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3937', 'YE02', 'ACTIVE HYBRID 7          ', 'YE01', 'YE01', '1', '1', '7H', 'F02 ', 'N55 ', 'A', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3938', 'YE03', 'ACTIVE HYBRID 7          ', 'YE03', 'YE03', '1', '1', '7H', 'F02 ', 'N55 ', 'A', '4', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3939', 'YE21', '730LI                    ', 'YE21', 'YE21', '1', '1', '7', 'F02 ', 'N52T', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3940', 'YE22', '730LI                    ', 'YE21', 'YE21', '1', '1', '7', 'F02 ', 'N52T', 'A', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3941', 'YE25', '730LI RL THA SKD         ', 'YE21', 'YE21', '1', '1', 'T7', 'F02 ', 'N52T', 'A', '4', 'R', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3942', 'YE41', '740LI                    ', 'YE41', 'YE41', '1', '1', '7', 'F02 ', 'N55 ', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3943', 'YE42', '740LI RL                 ', 'YE41', 'YE41', '1', '1', '7', 'F02 ', 'N55 ', 'A', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3944', 'YE43', '740LI US                 ', 'YE43', 'YE43', '1', '1', '7', 'F02 ', 'N55 ', 'A', '4', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3945', 'YE44', '740LI RL                 ', 'YE41', 'YE41', '1', '1', 'T7', 'F02 ', 'N55 ', 'A', '4', 'R', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3946', 'YE45', '740LI                    ', 'YE41', 'YE41', '1', '1', 'Y7', 'F02 ', 'N55 ', 'A', '4', 'L', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3947', 'YE73', '750LI US ALPINA B7US     ', 'YE73', 'YE73', '1', '1', '7', 'F02 ', 'N63T', 'A', '4', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3948', 'YE81', '750LI                    ', 'YE81', 'YE81', '1', '1', '7', 'F02 ', 'N63T', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3949', 'YE82', '750LI RL                 ', 'YE81', 'YE81', '1', '1', '7', 'F02 ', 'N63T', 'A', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3950', 'YE83', '750LI US                 ', 'YE83', 'YE83', '1', '1', '7', 'F02 ', 'N63T', 'A', '4', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3951', 'YF01', '750LI XDRIVE             ', 'YF01', 'YF01', '1', '1', '7X', 'F02 ', 'N63T', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3952', 'YF41', '740 LI XDRIVE            ', 'YF41', 'YF41', '1', '1', '7X', 'F02 ', 'N55 ', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3953', 'YF43', '740 LI XDRIVE            ', 'YF43', 'YF43', '1', '1', '7X', 'F02 ', 'N55 ', 'A', '4', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3954', 'YF61', '750LD XDRIVE             ', 'YF61', 'YF61', '1', '1', '7X', 'F02 ', 'N57X', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3955', 'YF73', '750LI XDRIVE US ALPI     ', 'YF73', 'YF73', '1', '1', '7X', 'F02 ', 'N63T', 'A', '4', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3956', 'YF81', '750LI XDRIVE             ', 'YF81', 'YF81', '1', '1', '7X', 'F02 ', 'N63T', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3957', 'YF83', '750LI XDRIVE US          ', 'YF83', 'YF83', '1', '1', '7X', 'F02 ', 'N63T', 'A', '4', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3958', 'YG01', '760LI                    ', 'YG01', 'YG01', '1', '1', '7', 'F02 ', 'N74 ', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3959', 'YG02', '760LI RL                 ', 'YG01', 'YG01', '1', '1', '7', 'F02 ', 'N74 ', 'A', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3960', 'YG03', '760LI US                 ', 'YG03', 'YG03', '1', '1', '7', 'F02 ', 'N74 ', 'A', '4', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3961', 'YG41', '730LD                    ', 'YG41', 'YG41', '1', '1', '7', 'F02 ', 'N57T', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3962', 'YG42', '730LD RL                 ', 'YG41', 'YG41', '1', '1', '7', 'F02 ', 'N57T', 'A', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3963', 'YG44', '730LD RL                 ', 'YG41', 'YG41', '1', '1', 'T7', 'F02 ', 'N57T', 'A', '4', 'R', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3964', 'YG47', '730LD RL                 ', 'YG41', 'YG41', '1', '1', 'C7', 'F02 ', 'N57T', 'A', '4', 'R', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3965', 'YM01', '650I A                   ', 'YM01', 'YM01', '1', '1', '6', 'F13 ', 'N63T', 'A', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3966', 'YM02', '650I RL A                ', 'YM01', 'YM01', '1', '1', '6', 'F13 ', 'N63T', 'A', '2', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3967', 'YM03', '650I US A                ', 'YM03', 'YM03', '1', '1', '6', 'F13 ', 'N63T', 'A', '2', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3968', 'YM21', '650I XDRIVE A            ', 'YM21', 'YM21', '1', '1', '6X', 'F13 ', 'N63T', 'A', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3969', 'YM23', '650I XDRIVE US A         ', 'YM23', 'YM23', '1', '1', '6X', 'F13 ', 'N63T', 'A', '2', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3970', 'YM41', '640D XDRIVE A            ', 'YM41', 'YM41', '1', '1', '6X', 'F13 ', 'N57Z', 'A', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3971', 'YM61', '650I XDRIVE A            ', 'YM61', 'YM61', '1', '1', '6X', 'F13 ', 'N63T', 'A', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3972', 'YM93', '650I US                  ', 'YM93', 'YM93', '1', '1', '6', 'F13 ', 'N63T', 'S', '2', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3973', 'YP01', '650I A                   ', 'YP01', 'YP01', '1', '1', '6', 'F12 ', 'N63T', 'A', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3974', 'YP02', '650I RL A                ', 'YP01', 'YP01', '1', '1', '6', 'F12 ', 'N63T', 'A', '2', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3975', 'YP03', '650I US A                ', 'YP03', 'YP03', '1', '1', '6', 'F12 ', 'N63T', 'A', '2', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3976', 'YP21', '650I XDRIVE A            ', 'YP21', 'YP21', '1', '1', '6X', 'F12 ', 'N63T', 'A', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3977', 'YP23', '650I XDRIVE US A         ', 'YP23', 'YP23', '1', '1', '6X', 'F12 ', 'N63T', 'A', '2', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3978', 'YP41', '640D XDRIVE A            ', 'YP41', 'YP41', '1', '1', '6X', 'F12 ', 'N57Z', 'A', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3979', 'YP61', '640I XDRIVE A            ', 'YP61', 'YP61', '1', '1', '6X', 'F12 ', 'N55 ', 'A', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3980', 'YP63', '640I XDRIVE US A         ', 'YP63', 'YP63', '1', '1', '6X', 'F12 ', 'N55 ', 'A', '2', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3981', 'YP93', '650I US                  ', 'YP93', 'YP93', '1', '1', '6', 'F12 ', 'N63T', 'S', '2', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3982', 'ZA31', 'MINI ONE                 ', 'ZA31', 'ZA31', '1', '1', 'RM', 'R60 ', 'N16 ', 'S', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3983', 'ZA32', 'MINI ONE RL              ', 'ZA31', 'ZA31', '1', '1', 'RM', 'R60 ', 'N16 ', 'S', '5', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3984', 'ZA41', 'MINI ONE A               ', 'ZA41', 'ZA41', '1', '1', 'RM', 'R60 ', 'N16 ', 'A', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3985', 'ZA42', 'MINI ONE RL A            ', 'ZA41', 'ZA41', '1', '1', 'RM', 'R60 ', 'N16 ', 'A', '5', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3986', 'ZB31', 'COOPER                   ', 'ZB31', 'ZB31', '1', '1', 'RM', 'R60 ', 'N16 ', 'S', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3987', 'ZB32', 'COOPER RL                ', 'ZB31', 'ZB31', '1', '1', 'RM', 'R60 ', 'N16 ', 'S', '5', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3988', 'ZB33', 'COOPER US                ', 'ZB33', 'ZB33', '1', '1', 'RM', 'R60 ', 'N16 ', 'S', '5', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3989', 'ZB41', 'COOPER A                 ', 'ZB41', 'ZB41', '1', '1', 'RM', 'R60 ', 'N16 ', 'A', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3990', 'ZB42', 'COOPER RL A              ', 'ZB41', 'ZB41', '1', '1', 'RM', 'R60 ', 'N16 ', 'A', '5', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3991', 'ZB43', 'COOPER US A              ', 'ZB43', 'ZB43', '1', '1', 'RM', 'R60 ', 'N16 ', 'A', '5', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3992', 'ZB51', 'COOPER ALL4              ', 'ZB51', 'ZB51', '1', '1', 'RA', 'R60 ', 'N16 ', 'S', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3993', 'ZB52', 'COOPER ALL4 RL           ', 'ZB51', 'ZB51', '1', '1', 'RA', 'R60 ', 'N16 ', 'S', '5', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3994', 'ZB71', 'COOPER SD                ', 'ZB71', 'ZB71', '1', '1', 'RD', 'R60 ', 'N47T', 'S', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3995', 'ZB72', 'COOPER SD RL             ', 'ZB71', 'ZB71', '1', '1', 'RD', 'R60 ', 'N47T', 'S', '5', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3996', 'ZB81', 'COOPER SD A              ', 'ZB81', 'ZB81', '1', '1', 'RD', 'R60 ', 'N47T', 'A', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3997', 'ZB82', 'COOPER SD RL A           ', 'ZB81', 'ZB81', '1', '1', 'RD', 'R60 ', 'N47T', 'A', '5', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3998', 'ZC31', 'COOPER S                 ', 'ZC31', 'ZC31', '1', '1', 'RD', 'R60 ', 'N18 ', 'S', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('3999', 'ZC32', 'COOPER S RL              ', 'ZC31', 'ZC31', '1', '1', 'RD', 'R60 ', 'N18 ', 'S', '5', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4000', 'ZC33', 'COOPER S US              ', 'ZC33', 'ZC33', '1', '1', 'RD', 'R60 ', 'N18 ', 'S', '5', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4001', 'ZC41', 'COOPER S A               ', 'ZC41', 'ZC41', '1', '1', 'RD', 'R60 ', 'N18 ', 'A', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4002', 'ZC42', 'COOPER S RL A            ', 'ZC41', 'ZC41', '1', '1', 'RD', 'R60 ', 'N18 ', 'A', '5', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4003', 'ZC43', 'COOPER S US A            ', 'ZC43', 'ZC43', '1', '1', 'RD', 'R60 ', 'N18 ', 'A', '5', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4004', 'ZC51', 'COOPER S ALL4            ', 'ZC51', 'ZC51', '1', '1', 'RD', 'R60 ', 'N18 ', 'S', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4005', 'ZC52', 'COOPER S ALL4 RL         ', 'ZC51', 'ZC51', '1', '1', 'RD', 'R60 ', 'N18 ', 'S', '5', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4006', 'ZC53', 'COOPER S ALL4 US         ', 'ZC53', 'ZC53', '1', '1', 'RD', 'R60 ', 'N18 ', 'S', '5', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4007', 'ZC61', 'COOPER S ALL4 A          ', 'ZC61', 'ZC61', '1', '1', 'RD', 'R60 ', 'N18 ', 'A', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4008', 'ZC62', 'COOPER S ALL4 RL A       ', 'ZC61', 'ZC61', '1', '1', 'RD', 'R60 ', 'N18 ', 'A', '5', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4009', 'ZC63', 'COOPER S ALL4 US A       ', 'ZC63', 'ZC63', '1', '1', 'RD', 'R60 ', 'N18 ', 'A', '5', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4010', 'ZD11', 'MINI ONE 1 6D            ', 'ZD11', 'ZD11', '1', '1', 'RM', 'R60 ', 'N47T', 'S', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4011', 'ZD12', 'MINI ONE 16D RL          ', 'ZD11', 'ZD11', '1', '1', 'RM', 'R60 ', 'N47T', 'S', '5', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4012', 'ZD31', 'COOPER 1 6D              ', 'ZD31', 'ZD31', '1', '1', 'RA', 'R60 ', 'N47T', 'S', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4013', 'ZD32', 'COOPER 1 6D RL           ', 'ZD31', 'ZD31', '1', '1', 'RA', 'R60 ', 'N47T', 'S', '5', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4014', 'ZD51', 'COOPER D ALL4            ', 'ZD51', 'ZD51', '1', '1', 'RM', 'R60 ', 'N47T', 'S', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4015', 'ZD52', 'COOPER D ALL4 RL         ', 'ZD51', 'ZD51', '1', '1', 'RM', 'R60 ', 'N47T', 'S', '5', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4016', 'ZD71', 'COOPER SD ALL4           ', 'ZD71', 'ZD71', '1', '1', 'RQ', 'R60 ', 'N47T', 'S', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4017', 'ZD72', 'COOPER SD ALL4           ', 'ZD71', 'ZD71', '1', '1', 'RQ', 'R60 ', 'N47T', 'S', '5', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4018', 'ZD81', 'COOPER SD ALL4 A         ', 'ZD81', 'ZD81', '1', '1', 'RQ', 'R60 ', 'N47T', 'A', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4019', 'ZD82', 'COOPER SD ALL4 A         ', 'ZD81', 'ZD81', '1', '1', 'RQ', 'R60 ', 'N47T', 'A', '5', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4020', 'ZV41', 'X5 XDRIVE35I             ', 'ZV41', 'ZV41', '1', '1', 'G5', 'E70 ', 'N55 ', 'A', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4021', 'ZV42', 'X5 XDRIVE35I RL          ', 'ZV41', 'ZV41', '1', '1', 'G5', 'E70 ', 'N55 ', 'A', '5', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4022', 'ZV43', 'X5 XDRIVE35I US          ', 'ZV43', 'ZV43', '1', '1', 'G5', 'E70 ', 'N55 ', 'A', '5', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4023', 'ZV81', 'X5 XDRIVE50I             ', 'ZV81', 'ZV81', '1', '1', 'G5', 'E70 ', 'N63 ', 'A', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4024', 'ZV82', 'X5 XDRIVE50I RL          ', 'ZV81', 'ZV81', '1', '1', 'G5', 'E70 ', 'N63 ', 'A', '5', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4025', 'ZV83', 'X5 XDRIVE50I US          ', 'ZV83', 'ZV83', '1', '1', 'G5', 'E70 ', 'N63 ', 'A', '5', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4026', 'ZW03', 'X5 XDRIVE35D US          ', 'ZW03', 'ZW03', '1', '1', 'G5', 'E70 ', 'M57Y', 'A', '5', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4027', 'ZW41', 'X5 XDRIVE30D             ', 'ZW41', 'ZW41', '1', '1', 'G5', 'E70 ', 'N57 ', 'A', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4028', 'ZW42', 'X5 XDRIVE30D RL          ', 'ZW41', 'ZW41', '1', '1', 'G5', 'E70 ', 'N57 ', 'A', '5', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4029', 'ZW61', 'X5 XDRIVE40D             ', 'ZW61', 'ZW61', '1', '1', 'G5', 'E70 ', 'N57S', 'A', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4030', 'ZW62', 'X5 XDRIVE40D RL          ', 'ZW61', 'ZW61', '1', '1', 'G5', 'E70 ', 'N57S', 'A', '5', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4031', 'ZW81', 'X5 M50D                  ', 'ZW81', 'ZW81', '1', '1', 'G5', 'E70 ', 'N57X', 'A', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4032', 'ZW82', 'X5 M50D RL               ', 'ZW81', 'ZW81', '1', '1', 'G5', 'E70 ', 'N57X', 'A', '5', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4033', '0A01', 'R 1200 GS                ', '0A01', '0A01', '1', '0', 'U1', 'K50 ', 'A74 ', 'S', '0', ' ', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4034', '0A11', 'R 1200 GS US             ', '0A01', '0A01', '1', '0', 'U1', 'K50 ', 'A74 ', 'S', '0', ' ', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4035', '0B01', 'F700GS                   ', '0B01', '0B01', '1', '0', 'U1', 'K70 ', 'A22 ', 'S', '0', ' ', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4036', '0B02', 'F800GS                   ', '0B02', '0B02', '1', '0', 'U1', 'K72 ', 'A21 ', 'S', '0', ' ', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4037', '0B03', 'F 800 GT                 ', '0B03', '0B03', '1', '0', 'U2', 'K71 ', 'A23 ', 'S', '0', ' ', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4038', '0B11', 'F700GS US                ', '0B01', '0B01', '1', '0', 'U1', 'K70 ', 'A22 ', 'S', '0', ' ', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4039', '0B12', 'F800GS US                ', '0B02', '0B02', '1', '0', 'U1', 'K72 ', 'A21 ', 'S', '0', ' ', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4040', '0B13', 'F 800 GT US              ', '0B03', '0B03', '1', '0', 'U2', 'K71 ', 'A23 ', 'S', '0', ' ', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4041', '0B22', 'F800GS CKD BRA           ', '0B22', '0B22', '1', '0', 'U1', 'K72 ', 'A21 ', 'S', '0', ' ', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4042', '0D01', 'HP4                      ', '0D01', '0D01', '1', '0', 'U2', 'K42 ', '4-ZY', 'S', '0', ' ', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4043', '0D11', 'HP4 US                   ', '0D01', '0D01', '1', '0', 'U2', 'K42 ', '4-ZY', 'S', '0', ' ', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4044', '131', 'C 600 SPORT              ', '131', '131', '1', '0', 'U3', 'K18 ', 'A27 ', 'A', '0', ' ', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4045', '132', 'C 600 SPORT US           ', '131', '131', '1', '0', 'U3', 'K18 ', 'A27 ', 'A', '0', ' ', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4046', '133', 'C 650 GT                 ', '133', '133', '1', '0', 'U3', 'K19 ', 'A27 ', 'A', '0', ' ', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4047', '134', 'C 650 GT US              ', '133', '133', '1', '0', 'U3', 'K19 ', 'A27 ', 'A', '0', ' ', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4048', '135', 'G 650 GS CKD BRA         ', '135', '135', '1', '0', 'U1', 'R13 ', 'A81 ', 'S', '0', ' ', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4049', '136', 'G 650 GS SERTAO          ', '136', '136', '1', '0', 'U1', 'R13 ', 'A81 ', 'S', '0', ' ', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4050', '137', 'G 650 GS SERTAO CKD      ', '137', '137', '1', '0', 'U1', 'R13 ', 'A81 ', 'S', '0', ' ', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4051', '141', 'G 650 X COUNTRY          ', '141', '141', '1', '0', '93', 'K15 ', '1-ZY', 'S', '0', ' ', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4052', '145', 'G 450 X                  ', '145', '145', '1', '0', '20', 'K16 ', '1-ZY', 'S', '0', ' ', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4053', '146', 'G 650 GS  US SERTAO      ', '136', '136', '1', '0', 'U1', 'R13 ', 'A81 ', 'S', '0', ' ', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4054', '151', 'G 650 X COUNTRY US       ', '141', '141', '1', '0', '93', 'K15 ', '1-ZY', 'S', '0', ' ', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4055', '155', 'G450X US                 ', '145', '145', '1', '0', '20', 'K16 ', '1-ZY', 'S', '0', ' ', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4056', '160', 'F 650 CKD                ', '161', '161', '1', '0', '93', 'E169', '1-ZY', 'S', '0', ' ', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4057', '161', 'F 650                    ', '161', '161', '1', '0', '93', 'E169', '1-ZY', 'S', '0', ' ', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4058', '162', 'F 650                    ', '161', '161', '1', '0', '93', 'E169', '1-ZY', 'S', '0', ' ', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4059', '163', 'F 650 ST                 ', '161', '161', '1', '0', '93', 'E169', '1-ZY', 'S', '0', ' ', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4060', '164', 'G 650 X Country          ', '164', '164', '1', '0', '93', 'K15 ', '1-ZY', 'S', '0', ' ', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4061', '165', 'G 650 X Challenge        ', '165', '165', '1', '0', '93', 'K15 ', '1-ZY', 'S', '0', ' ', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4062', '166', 'F 650 US                 ', '161', '161', '1', '0', '93', 'E169', '1-ZY', 'S', '0', ' ', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4063', '167', 'G 650 X Moto             ', '167', '167', '1', '0', '93', 'K15 ', '1-ZY', 'S', '0', ' ', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4064', '168', 'F 650 ST US              ', '161', '161', '1', '0', '93', 'E169', '1-ZY', 'S', '0', ' ', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4065', '171', 'G 650 GS CKD BRA         ', '178', '178', '1', '0', '93', 'R13 ', '1-ZY', 'S', '0', ' ', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4066', '172', 'F 650 GS                 ', '172', '172', '1', '0', '93', 'R13 ', '1-ZY', 'S', '0', ' ', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4067', '173', 'F 650 GS Dakar           ', '173', '173', '1', '0', '93', 'R13 ', '1-ZY', 'S', '0', ' ', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4068', '174', 'F 650 CS                 ', '174', '174', '1', '0', '93', 'K14 ', '1-ZY', 'S', '0', ' ', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4069', '175', 'F 650 GS M              ', '175', '175', '1', '0', '93', 'R13 ', '1-ZY', 'S', '0', ' ', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4070', '176', 'F 650 GS DAKAR M?        ', '176', '176', '1', '0', '93', 'R13 ', '1-ZY', 'S', '0', ' ', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4071', '177', 'F 650 CS M?              ', '177', '177', '1', '0', '93', 'K14 ', '1-ZY', 'S', '0', ' ', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4072', '178', 'G 650 GS                 ', '178', '178', '1', '0', '93', 'R13 ', '1-ZY', 'S', '0', ' ', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4073', '179', 'G 650 GS US              ', '178', '178', '1', '0', '93', 'R13 ', '1-ZY', 'S', '0', ' ', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4074', '180', 'G 650 GS                 ', '180', '180', '1', '0', '93', 'R13 ', '1-ZY', 'S', '0', ' ', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4075', '182', 'F 650 GS US              ', '172', '172', '1', '0', '93', 'R13 ', '1-ZY', 'S', '0', ' ', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4076', '183', 'F 650 GS US Dakar        ', '173', '173', '1', '0', '93', 'R13 ', '1-ZY', 'S', '0', ' ', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4077', '184', 'F 650 CS US              ', '174', '174', '1', '0', '93', 'K14 ', '1-ZY', 'S', '0', ' ', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4078', '185', 'F 650 GS US M?           ', '175', '175', '1', '0', '93', 'R13 ', '1-ZY', 'S', '0', ' ', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4079', '186', 'F 650 GS US DAKAR M?     ', '176', '176', '1', '0', '93', 'R13 ', '1-ZY', 'S', '0', ' ', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4080', '187', 'F 650 CS US M?           ', '177', '177', '1', '0', '93', 'K14 ', '1-ZY', 'S', '0', ' ', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4081', '188', 'G 650 GS                 ', '188', '188', '1', '0', '93', 'R13 ', 'A81 ', 'S', '0', ' ', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4082', '189', 'G 650 GS US              ', '188', '188', '1', '0', '93', 'R13 ', 'A81 ', 'S', '0', ' ', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4083', '194', 'G 650 X US Country       ', '164', '164', '1', '0', '93', 'K15 ', '1-ZY', 'S', '0', ' ', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4084', '195', 'G 650 X US Challenge     ', '165', '165', '1', '0', '93', 'K15 ', '1-ZY', 'S', '0', ' ', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4085', '197', 'G 650 X US Moto          ', '167', '167', '1', '0', '93', 'K15 ', '1-ZY', 'S', '0', ' ', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4086', '215', 'F 800 R CKD BRA          ', '215', '215', '1', '0', '70', 'K73 ', '2-ZY', 'S', '0', ' ', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4087', '216', 'F 800 S                  ', '216', '216', '1', '0', '70', 'K71 ', '2-ZY', 'S', '0', ' ', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4088', '217', 'F 800 R                  ', '217', '217', '1', '0', '70', 'K73 ', '2-ZY', 'S', '0', ' ', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4089', '218', 'F 650 GS                 ', '218', '218', '1', '0', '70', 'K72 ', '2-ZY', 'S', '0', ' ', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4090', '219', 'F 800 GS                 ', '219', '219', '1', '0', '70', 'K72 ', '2-ZY', 'S', '0', ' ', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4091', '225', 'F 800 GS CKD BRA         ', '225', '225', '1', '0', '70', 'K72 ', '2-ZY', 'S', '0', ' ', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4092', '226', 'F 800 S US               ', '216', '216', '1', '0', '70', 'K71 ', '2-ZY', 'S', '0', ' ', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4093', '227', 'F 800 R US               ', '217', '217', '1', '0', '70', 'K73 ', '2-ZY', 'S', '0', ' ', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4094', '228', 'F 650 GS US              ', '218', '218', '1', '0', '70', 'K72 ', '2-ZY', 'S', '0', ' ', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4095', '229', 'F 800 GS US              ', '219', '219', '1', '0', '70', 'K72 ', '2-ZY', 'S', '0', ' ', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4096', '234', 'F 800 ST                 ', '234', '234', '1', '0', '70', 'K71 ', '2-ZY', 'S', '0', ' ', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4097', '240', 'R 50/5                   ', '240', '240', '1', '0', '50', '    ', '    ', 'S', '0', ' ', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4098', '244', 'F 800 ST US              ', '234', '234', '1', '0', '70', 'K71 ', '2-ZY', 'S', '0', ' ', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4099', '250', 'R 60/5                   ', '250', '250', '1', '0', '60', '    ', '    ', 'S', '0', ' ', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4100', '251', 'R 60/6                   ', '251', '251', '1', '0', '60', '    ', '    ', 'S', '0', ' ', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4101', '253', 'R 60/6 USA               ', '251', '251', '1', '0', '60', '    ', '    ', 'S', '0', ' ', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4102', '255', 'R 60/6                   ', '251', '251', '1', '0', '60', '    ', '    ', 'S', '0', ' ', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4103', '257', 'R 60/6 USA               ', '251', '251', '1', '0', '60', '    ', '    ', 'S', '0', ' ', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4104', '260', 'R 75/5                   ', '260', '260', '1', '0', '80', '    ', '    ', 'S', '0', ' ', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4105', '261', 'R 75/6                   ', '261', '261', '1', '0', '80', '    ', '    ', 'S', '0', ' ', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4106', '263', 'R 75/6 USA               ', '261', '261', '1', '0', '80', '    ', '    ', 'S', '0', ' ', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4107', '265', 'R 75/6                   ', '261', '261', '1', '0', '80', '    ', '    ', 'S', '0', ' ', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4108', '267', 'R 75/6 USA               ', '261', '261', '1', '0', '80', '    ', '    ', 'S', '0', ' ', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4109', '271', 'R 90/6                   ', '271', '271', '1', '0', '75', '    ', '    ', 'S', '0', ' ', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4110', '272', 'R 90/S                   ', '272', '272', '1', '0', '75', '    ', '    ', 'S', '0', ' ', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4111', '273', 'R 90/6 USA               ', '271', '271', '1', '0', '75', '    ', '    ', 'S', '0', ' ', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4112', '274', 'R 90 S USA               ', '272', '272', '1', '0', '75', '    ', '    ', 'S', '0', ' ', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4113', '275', 'R 90/6                   ', '271', '271', '1', '0', '75', '    ', '    ', 'S', '0', ' ', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4114', '276', 'R 90/S                   ', '272', '272', '1', '0', '75', '    ', '    ', 'S', '0', ' ', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4115', '277', 'R 90/6 USA               ', '271', '271', '1', '0', '75', '    ', '    ', 'S', '0', ' ', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4116', '278', 'R 90 S USA               ', '272', '272', '1', '0', '75', '    ', '    ', 'S', '0', ' ', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4117', '281', 'R 60/6 /76               ', '251', '251', '1', '0', '60', '    ', '    ', 'S', '0', ' ', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4118', '282', 'R 75/6 /76               ', '261', '261', '1', '0', '80', '    ', '    ', 'S', '0', ' ', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4119', '283', 'R 90/6 /76               ', '271', '271', '1', '0', '75', '    ', '    ', 'S', '0', ' ', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4120', '284', 'R 90/S /76               ', '272', '272', '1', '0', '75', '    ', '    ', 'S', '0', ' ', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4121', '291', 'R 60/6 USA /76           ', '251', '251', '1', '0', '60', '    ', '    ', 'S', '0', ' ', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4122', '292', 'R 75/6 USA /76           ', '261', '261', '1', '0', '80', '    ', '    ', 'S', '0', ' ', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4123', '293', 'R 90/6 USA 76            ', '271', '271', '1', '0', '75', '    ', '    ', 'S', '0', ' ', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4124', '294', 'R 90 S USA 76            ', '272', '272', '1', '0', '75', '    ', '    ', 'S', '0', ' ', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4125', '301', 'R 60/7 /77               ', '301', '301', '1', '0', '60', '    ', '    ', 'S', '0', ' ', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4126', '302', 'R 75/7                   ', '302', '302', '1', '0', '80', '    ', '    ', 'S', '0', ' ', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4127', '303', 'R 1200 GS M             ', '303', '303', '1', '0', '20', 'K25 ', '2-ZY', 'S', '0', ' ', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4128', '304', 'R100/7                   ', '304', '304', '1', '0', '0', '    ', '    ', 'S', '0', ' ', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4129', '305', 'R100/S                   ', '305', '305', '1', '0', '0', '    ', '    ', 'S', '0', ' ', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4130', '306', 'R100/RS                  ', '306', '306', '1', '0', '0', '    ', '    ', 'S', '0', ' ', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4131', '307', 'R 1200 GS                ', '307', '307', '1', '0', '20', 'K25 ', '2-ZY', 'S', '0', ' ', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4132', '308', 'R 1150 R Rockster        ', '308', '308', '1', '0', '92', 'R28 ', '2-ZY', 'S', '0', ' ', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4133', '309', 'R 1200C MONTAUK          ', '309', '309', '1', '0', '92', '259C', '2-ZY', 'S', '0', ' ', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4134', '310', 'HP2 MEGA MOTO            ', '310', '310', '1', '0', '20', 'K25 ', '2-ZY', 'S', '0', ' ', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4135', '311', 'R 60/7 USA /77           ', '301', '301', '1', '0', '60', '    ', '    ', 'S', '0', ' ', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4136', '312', 'R 75/7 USA               ', '302', '302', '1', '0', '80', '    ', '    ', 'S', '0', ' ', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4137', '313', 'R 1200 GS US M          ', '303', '303', '1', '0', '20', 'K25 ', '2-ZY', 'S', '0', ' ', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4138', '314', 'R100/7 USA               ', '304', '304', '1', '0', '0', '    ', '    ', 'S', '0', ' ', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4139', '315', 'R100/S USA               ', '305', '305', '1', '0', '0', '    ', '    ', 'S', '0', ' ', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4140', '316', 'R100/RS USA              ', '306', '306', '1', '0', '0', '    ', '    ', 'S', '0', ' ', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4141', '317', 'R 1200 GS US             ', '307', '307', '1', '0', '20', 'K25 ', '2-ZY', 'S', '0', ' ', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4142', '318', 'R 1150 R US Rockster     ', '308', '308', '1', '0', '92', 'R28 ', '2-ZY', 'S', '0', ' ', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4143', '319', 'R 1200C US MONTAUK       ', '309', '309', '1', '0', '92', '259C', '2-ZY', 'S', '0', ' ', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4144', '320', 'HP2 MEGA MOTO US         ', '310', '310', '1', '0', '20', 'K25 ', '2-ZY', 'S', '0', ' ', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4145', '321', 'R 60/7 /78               ', '321', '321', '1', '0', '60', '    ', '    ', 'S', '0', ' ', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4146', '322', 'R 80/7 S                 ', '322', '322', '1', '0', '80', '    ', '    ', 'S', '0', ' ', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4147', '323', 'R100/7 /78               ', '323', '323', '1', '0', '0', '    ', '    ', 'S', '0', ' ', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4148', '324', 'R100/S /78               ', '305', '305', '1', '0', '0', '    ', '    ', 'S', '0', ' ', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4149', '325', 'R100/RS /78              ', '306', '306', '1', '0', '0', '    ', '    ', 'S', '0', ' ', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4150', '326', 'R 75/7                   ', '302', '302', '1', '0', '80', '    ', '    ', 'S', '0', ' ', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4151', '327', 'R 80/7 N                 ', '322', '322', '1', '0', '80', '    ', '    ', 'S', '0', ' ', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4152', '328', 'R1200ST                  ', '328', '328', '1', '0', '20', 'K28 ', '2-ZY', 'S', '0', ' ', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4153', '329', 'R 1200C MODELLPFLEGE     ', '329', '329', '1', '0', '92', '259C', '2-ZY', 'S', '0', ' ', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4154', '330', 'R 900 RT                 ', '330', '330', '1', '0', '20', 'K26 ', '2-ZY', 'S', '0', ' ', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4155', '331', 'R 60/7 USA /78           ', '321', '321', '1', '0', '60', '    ', '    ', 'S', '0', ' ', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4156', '332', 'R 80/7 USA               ', '322', '322', '1', '0', '80', '    ', '    ', 'S', '0', ' ', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4157', '333', 'R100/7 USA /78           ', '323', '323', '1', '0', '0', '    ', '    ', 'S', '0', ' ', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4158', '334', 'R100/S USA /78           ', '305', '305', '1', '0', '0', '    ', '    ', 'S', '0', ' ', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4159', '335', 'R100/RS USA /78          ', '306', '306', '1', '0', '0', '    ', '    ', 'S', '0', ' ', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4160', '338', 'R1200ST US               ', '328', '328', '1', '0', '20', 'K28 ', '2-ZY', 'S', '0', ' ', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4161', '339', 'R100 RT USA              ', '339', '339', '1', '0', '0', '    ', '    ', 'S', '0', ' ', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4162', '340', 'R 900 RT US              ', '330', '330', '1', '0', '20', 'K26 ', '2-ZY', 'S', '0', ' ', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4163', '341', 'R 60 T                   ', '321', '321', '1', '0', '60', '    ', '    ', 'S', '0', ' ', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4164', '342', 'R 80 TN                  ', '322', '322', '1', '0', '80', '    ', '    ', 'S', '0', ' ', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4165', '343', 'R 80 T                   ', '322', '322', '1', '0', '80', '    ', '    ', 'S', '0', ' ', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4166', '344', 'R100/7 T                 ', '323', '323', '1', '0', '0', '    ', '    ', 'S', '0', ' ', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4167', '345', 'R100 T                   ', '323', '323', '1', '0', '0', '    ', '    ', 'S', '0', ' ', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4168', '346', 'R 80 G/S                 ', '346', '346', '1', '0', '80', '247E', '2-ZY', 'S', '0', ' ', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4169', '347', 'R 80 ST                  ', '347', '347', '1', '0', '80', '247E', '2-ZY', 'S', '0', ' ', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4170', '348', 'R 80 G/S US              ', '346', '346', '1', '0', '80', '247E', '2-ZY', 'S', '0', ' ', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4171', '349', 'R 80 ST US               ', '347', '347', '1', '0', '80', '247E', '2-ZY', 'S', '0', ' ', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4172', '351', 'R 45                     ', '351', '351', '1', '0', '45', '    ', '    ', 'S', '0', ' ', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4173', '352', 'R 45 N                   ', '351', '351', '1', '0', '45', '    ', '    ', 'S', '0', ' ', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4174', '353', 'R 65                     ', '353', '353', '1', '0', '65', '    ', '    ', 'S', '0', ' ', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4175', '354', '475 20 KW                ', '354', '354', '1', '0', '45', '248', '    ', 'S', '0', ' ', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4176', '355', '475 26 KW                ', '354', '354', '1', '0', '45', '248', '    ', 'S', '0', ' ', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4177', '356', '475 20 KW TIC            ', '354', '354', '1', '0', '45', '248', '    ', 'S', '0', ' ', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4178', '357', '475 26 KW TIC            ', '354', '354', '1', '0', '45', '248', '    ', 'S', '0', ' ', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4179', '358', 'R 65                     ', '358', '358', '1', '0', '65', '248', '2-ZY', 'S', '0', ' ', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4180', '359', 'R 65                     ', '359', '359', '1', '0', '65', '248', '2-ZY', 'S', '0', ' ', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4181', '360', '650 37 KW TIC            ', '358', '358', '1', '0', '65', '248', '    ', 'S', '0', ' ', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4182', '362', 'R 1200C INDEPENDENT      ', '362', '362', '1', '0', '92', '259C', '2-ZY', 'S', '0', ' ', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4183', '363', 'R 65 USA                 ', '353', '353', '1', '0', '65', '    ', '    ', 'S', '0', ' ', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4184', '364', '650 US                   ', '358', '358', '1', '0', '65', '248', '    ', 'S', '0', ' ', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4185', '365', '650 LS US                ', '359', '359', '1', '0', '65', '248', '    ', 'S', '0', ' ', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4186', '366', 'R 1200 S                 ', '366', '366', '1', '0', '20', 'K29 ', '2-ZY', 'S', '0', ' ', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4187', '367', 'R 900 RT                 ', '368', '368', '1', '0', '20', 'K26 ', '2-ZY', 'S', '0', ' ', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4188', '368', 'R 1200 RT                ', '368', '368', '1', '0', '20', 'K26 ', '2-ZY', 'S', '0', ' ', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4189', '369', 'HP2 Enduro               ', '369', '369', '1', '0', '20', 'K25 ', '2-ZY', 'S', '0', ' ', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4190', '371', 'R 600 29 KW/7            ', '321', '321', '1', '0', '60', '    ', '    ', 'S', '0', ' ', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4191', '372', 'R 750 37 KW/7            ', '302', '302', '1', '0', '80', '    ', '    ', 'S', '0', ' ', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4192', '373', 'R 800 37 KW/7            ', '373', '373', '1', '0', '80', '    ', '    ', 'S', '0', ' ', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4193', '374', 'R 800 41 KW/7            ', '373', '373', '1', '0', '80', '    ', '    ', 'S', '0', ' ', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4194', '375', 'R1000   47 KW/7          ', '375', '375', '1', '0', '0', '    ', '    ', 'S', '0', ' ', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4195', '376', 'R1000   51 KW/S          ', '376', '376', '1', '0', '0', '    ', '    ', 'S', '0', ' ', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4196', '377', 'R1000   51 KW/RS         ', '377', '377', '1', '0', '0', '    ', '    ', 'S', '0', ' ', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4197', '378', 'R 1200 R                 ', '378', '378', '1', '0', '20', 'K27 ', '2-ZY', 'S', '0', ' ', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4198', '379', 'R 1200C US MODELLPFL     ', '329', '329', '1', '0', '92', '259C', '2-ZY', 'S', '0', ' ', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4199', '380', 'R 1200 GS Adv M         ', '380', '380', '1', '0', '20', 'K25 ', '2-ZY', 'S', '0', ' ', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4200', '381', 'R 600 29 KW/7 TIC        ', '321', '321', '1', '0', '60', '    ', '    ', 'S', '0', ' ', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4201', '382', 'R 1200 GS ADV            ', '382', '382', '1', '0', '20', 'K25 ', '2-ZY', 'S', '0', ' ', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4202', '383', 'R 800 37 KW/T            ', '373', '373', '1', '0', '80', '    ', '    ', 'S', '0', ' ', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4203', '384', 'R 800 41 KW/T            ', '373', '373', '1', '0', '80', '    ', '    ', 'S', '0', ' ', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4204', '385', 'R1000   47 KW/T          ', '375', '375', '1', '0', '0', '    ', '    ', 'S', '0', ' ', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4205', '386', 'R1000   51 KW/T          ', '339', '339', '1', '0', '0', '    ', '    ', 'S', '0', ' ', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4206', '387', 'R 900 RT US              ', '368', '368', '1', '0', '20', 'K26 ', '2-ZY', 'S', '0', ' ', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4207', '388', 'R 1200 RT US             ', '368', '368', '1', '0', '20', 'K26 ', '2-ZY', 'S', '0', ' ', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4208', '389', 'HP2 Enduro US            ', '369', '369', '1', '0', '20', 'K25 ', '2-ZY', 'S', '0', ' ', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4209', '390', 'R 1200 GS Adv US M      ', '380', '380', '1', '0', '20', 'K25 ', '2-ZY', 'S', '0', ' ', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4210', '391', 'R 1200C INDEPENDENT      ', '362', '362', '1', '0', '92', '259C', '2-ZY', 'S', '0', ' ', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4211', '392', 'R 800/7 USA 79           ', '373', '373', '1', '0', '80', '    ', '    ', 'S', '0', ' ', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4212', '393', 'R1000/7 USA 79           ', '375', '375', '1', '0', '0', '    ', '    ', 'S', '0', ' ', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4213', '394', 'R1000/S USA 79           ', '376', '376', '1', '0', '0', '    ', '    ', 'S', '0', ' ', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4214', '395', 'R1000/RS USA 79          ', '377', '377', '1', '0', '0', '    ', '    ', 'S', '0', ' ', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4215', '396', 'R 1200 S US              ', '366', '366', '1', '0', '20', 'K29 ', '2-ZY', 'S', '0', ' ', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4216', '397', 'R 1200 GS US ADV         ', '382', '382', '1', '0', '20', 'K25 ', '2-ZY', 'S', '0', ' ', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4217', '398', 'R 1200 R US              ', '378', '378', '1', '0', '20', 'K27 ', '2-ZY', 'S', '0', ' ', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4218', '399', 'R1000/RS T USA 79        ', '339', '339', '1', '0', '0', '    ', '    ', 'S', '0', ' ', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4219', '400', 'R 1200 R                 ', '400', '400', '1', '0', '20', 'K27 ', '2-ZY', 'S', '0', ' ', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4220', '401', 'R 850 R                  ', '402', '402', '1', '0', '92', '259R', '2-ZY', 'S', '0', ' ', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4221', '402', 'R 1100 R                 ', '402', '402', '1', '0', '92', '259R', '2-ZY', 'S', '0', ' ', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4222', '403', 'R 850 GS                 ', '404', '404', '1', '0', '92', '259E', '2-ZY', 'S', '0', ' ', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4223', '404', 'R 1100 GS                ', '404', '404', '1', '0', '92', '259E', '2-ZY', 'S', '0', ' ', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4224', '405', 'R 1200 C Independent     ', '405', '405', '1', '0', '92', '259C', '2-ZY', 'S', '0', ' ', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4225', '406', 'R 850 R US               ', '402', '402', '1', '0', '92', '259R', '2-ZY', 'S', '0', ' ', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4226', '407', 'R 1100 R US              ', '402', '402', '1', '0', '92', '259R', '2-ZY', 'S', '0', ' ', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4227', '408', 'R 850 GS US              ', '404', '404', '1', '0', '92', '259E', '2-ZY', 'S', '0', ' ', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4228', '409', 'R 1100 GS US             ', '404', '404', '1', '0', '92', '259E', '2-ZY', 'S', '0', ' ', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4229', '410', 'R 1100 GS CKD            ', '404', '404', '1', '0', '92', '259E', '2-ZY', 'S', '0', ' ', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4230', '411', 'R 1100 RS                ', '411', '411', '1', '0', '92', '259', '2-ZY', 'S', '0', ' ', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4231', '412', 'R 850 RT                 ', '413', '413', '1', '0', '92', '259', '2-ZY', 'S', '0', ' ', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4232', '413', 'R 1100 RT                ', '413', '413', '1', '0', '92', '259', '2-ZY', 'S', '0', ' ', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4233', '415', 'R 1150 GS                ', '415', '415', '1', '0', '92', 'R21 ', '2-ZY', 'S', '0', ' ', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4234', '416', 'R 1100 RS US             ', '411', '411', '1', '0', '92', '259', '2-ZY', 'S', '0', ' ', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4235', '417', 'R 850 RT                 ', '419', '419', '1', '0', '92', 'R22 ', '2-ZY', 'S', '0', ' ', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4236', '418', 'R 1100 RT US             ', '413', '413', '1', '0', '92', '259', '2-ZY', 'S', '0', ' ', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4237', '419', 'R 1150 RT                ', '419', '419', '1', '0', '92', 'R22 ', '2-ZY', 'S', '0', ' ', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4238', '420', 'R 1100 RS CKD            ', '411', '411', '1', '0', '92', '259', '2-ZY', 'S', '0', ' ', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4239', '421', 'R 850 C                  ', '424', '424', '1', '0', '92', '259C', '2-ZY', 'S', '0', ' ', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4240', '422', 'R 1100 S                 ', '422', '422', '1', '0', '92', '259S', '2-ZY', 'S', '0', ' ', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4241', '423', 'R 80                     ', '373', '373', '1', '0', '80', '247', '2-ZY', 'S', '0', ' ', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4242', '424', 'R 1200 C                 ', '424', '424', '1', '0', '92', '259C', '2-ZY', 'S', '0', ' ', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4243', '425', '1000 BASIS               ', '425', '425', '1', '0', '0', '247', '    ', 'S', '0', ' ', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4244', '426', 'R 100 CS                 ', '426', '426', '1', '0', '0', '247', '2-ZY', 'S', '0', ' ', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4245', '427', 'R 100 RS                 ', '427', '427', '1', '0', '0', '247', '2-ZY', 'S', '0', ' ', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4246', '428', 'R 850 R                  ', '429', '429', '1', '0', '92', 'R28 ', '2-ZY', 'S', '0', ' ', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4247', '429', 'R 1150 R                 ', '429', '429', '1', '0', '92', 'R28 ', '2-ZY', 'S', '0', ' ', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4248', '430', 'R 1200 RT                ', '430', '430', '1', '0', '20', 'K26 ', '2-ZY', 'S', '0', ' ', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4249', '431', 'R 850 C US               ', '424', '424', '1', '0', '92', '259C', '2-ZY', 'S', '0', ' ', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4250', '432', 'R 1100 S US              ', '422', '422', '1', '0', '92', '259S', '2-ZY', 'S', '0', ' ', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4251', '433', 'R 1200 C US Independ     ', '405', '405', '1', '0', '92', '259C', '2-ZY', 'S', '0', ' ', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4252', '434', 'R 1200 C US              ', '424', '424', '1', '0', '92', '259C', '2-ZY', 'S', '0', ' ', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4253', '435', '1000 BASIS US            ', '425', '425', '1', '0', '0', '247', '    ', 'S', '0', ' ', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4254', '436', '1000 CS US               ', '426', '426', '1', '0', '0', '247', '    ', 'S', '0', ' ', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4255', '437', '1000 RS US               ', '427', '427', '1', '0', '0', '247', '    ', 'S', '0', ' ', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4256', '438', 'R 850 R US               ', '429', '429', '1', '0', '92', 'R28 ', '2-ZY', 'S', '0', ' ', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4257', '439', 'R 1150 R US              ', '429', '429', '1', '0', '92', 'R28 ', '2-ZY', 'S', '0', ' ', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4258', '440', 'R 1200 RT US             ', '430', '430', '1', '0', '20', 'K26 ', '2-ZY', 'S', '0', ' ', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4259', '441', 'R 1150 GS Adventure      ', '441', '441', '1', '0', '92', 'R21 ', '2-ZY', 'S', '0', ' ', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4260', '442', 'R 1200 CL                ', '442', '442', '1', '0', '92', 'K30 ', '2-ZY', 'S', '0', ' ', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4261', '443', 'R 80 RT                  ', '443', '443', '1', '0', '80', '247', '2-ZY', 'S', '0', ' ', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4262', '444', '800 37 KW RT             ', '443', '443', '1', '0', '80', '247', '    ', 'S', '0', ' ', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4263', '445', '1000 BASIS TIC           ', '339', '339', '1', '0', '0', '247', '    ', 'S', '0', ' ', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4264', '446', 'R 100 RT                 ', '446', '446', '1', '0', '0', '247', '2-ZY', 'S', '0', ' ', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4265', '447', 'R 1150 RS                ', '447', '447', '1', '0', '92', 'R22 ', '2-ZY', 'S', '0', ' ', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4266', '448', '800 RT US                ', '443', '443', '1', '0', '80', '247', '    ', 'S', '0', ' ', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4267', '449', '1000 RT US               ', '446', '446', '1', '0', '0', '247', '    ', 'S', '0', ' ', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4268', '450', 'R 1200 GS                ', '450', '450', '1', '0', '20', 'K25 ', '2-ZY', 'S', '0', ' ', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4269', '451', 'R 65 20KW                ', '451', '451', '1', '0', '85', '247', '2-ZY', 'S', '0', ' ', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4270', '452', 'R 65                     ', '451', '451', '1', '0', '85', '247', '2-ZY', 'S', '0', ' ', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4271', '453', 'R 80                     ', '453', '453', '1', '0', '85', '247', '2-ZY', 'S', '0', ' ', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4272', '455', 'R 100 RS                 ', '455', '455', '1', '0', '85', '247', '2-ZY', 'S', '0', ' ', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4273', '456', 'R 65 Tic                 ', '456', '456', '1', '0', '85', '247', '2-ZY', 'S', '0', ' ', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4274', '457', 'R 80 RT                  ', '456', '456', '1', '0', '85', '247', '2-ZY', 'S', '0', ' ', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4275', '458', 'HP2 SPORT                ', '458', '458', '1', '0', '20', 'K29 ', '2-ZY', 'S', '0', ' ', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4276', '459', 'R 100 RT                 ', '459', '459', '1', '0', '85', '247', '2-ZY', 'S', '0', ' ', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4277', '460', 'R 1200 GS US             ', '450', '450', '1', '0', '20', 'K25 ', '2-ZY', 'S', '0', ' ', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4278', '461', 'R 100 US                 ', '453', '453', '1', '0', '85', '247', '2-ZY', 'S', '0', ' ', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4279', '462', 'R 65 US                  ', '453', '453', '1', '0', '85', '247', '2-ZY', 'S', '0', ' ', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4280', '463', 'R 80 US                  ', '453', '453', '1', '0', '85', '247', '2-ZY', 'S', '0', ' ', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4281', '464', 'R 80 RT US               ', '456', '456', '1', '0', '85', '247', '2-ZY', 'S', '0', ' ', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4282', '466', 'R 100 RS US              ', '455', '455', '1', '0', '85', '247', '2-ZY', 'S', '0', ' ', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4283', '467', 'R 80 R                   ', '467', '467', '1', '0', '91', '247E', '2-ZY', 'S', '0', ' ', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4284', '468', 'HP2 SPORT US             ', '458', '458', '1', '0', '20', 'K29 ', '2-ZY', 'S', '0', ' ', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4285', '469', 'R 100 RT US              ', '459', '459', '1', '0', '85', '247', '2-ZY', 'S', '0', ' ', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4286', '470', 'R 1200 GS ADV            ', '470', '470', '1', '0', '20', 'K25 ', '2-ZY', 'S', '0', ' ', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4287', '471', 'R 80 GS                  ', '471', '471', '1', '0', '88', '247E', '2-ZY', 'S', '0', ' ', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4288', '472', 'R 80 GS PD               ', '474', '474', '1', '0', '88', '247E', '2-ZY', 'S', '0', ' ', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4289', '473', 'R 100 GS                 ', '473', '473', '1', '0', '88', '247E', '2-ZY', 'S', '0', ' ', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4290', '474', 'R 100 GS PD              ', '474', '474', '1', '0', '88', '247E', '2-ZY', 'S', '0', ' ', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4291', '475', 'R 80 GS Basic            ', '475', '475', '1', '0', '91', '247E', '2-ZY', 'S', '0', ' ', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4292', '476', 'R 80 GS US               ', '471', '471', '1', '0', '88', '247E', '2-ZY', 'S', '0', ' ', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4293', '477', 'R 850 RT US              ', '419', '419', '1', '0', '92', 'R22 ', '2-ZY', 'S', '0', ' ', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4294', '478', 'R 100 GS US              ', '473', '473', '1', '0', '88', '247E', '2-ZY', 'S', '0', ' ', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4295', '479', 'R 100 GS US PD           ', '474', '474', '1', '0', '88', '247E', '2-ZY', 'S', '0', ' ', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4296', '480', 'R 1200 GS ADV US         ', '470', '470', '1', '0', '20', 'K25 ', '2-ZY', 'S', '0', ' ', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4297', '481', 'R 80 GS                  ', '481', '481', '1', '0', '91', '247E', '2-ZY', 'S', '0', ' ', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4298', '482', 'R 65 GS                  ', '482', '482', '1', '0', '80', '247E', '2-ZY', 'S', '0', ' ', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4299', '483', 'R 100 GS                 ', '483', '483', '1', '0', '91', '247E', '2-ZY', 'S', '0', ' ', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4300', '484', 'R 100 GS PD              ', '484', '484', '1', '0', '91', '247E', '2-ZY', 'S', '0', ' ', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4301', '485', 'R 80 GS PD               ', '484', '484', '1', '0', '91', '247E', '2-ZY', 'S', '0', ' ', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4302', '486', 'R 100 R                  ', '486', '486', '1', '0', '91', '247E', '2-ZY', 'S', '0', ' ', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4303', '487', 'R 100 R US               ', '486', '486', '1', '0', '91', '247E', '2-ZY', 'S', '0', ' ', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4304', '488', 'R 100 GS US              ', '483', '483', '1', '0', '91', '247E', '2-ZY', 'S', '0', ' ', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4305', '489', 'R 100 GS US PD           ', '484', '484', '1', '0', '91', '247E', '2-ZY', 'S', '0', ' ', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4306', '490', 'R 1200 R US              ', '400', '400', '1', '0', '20', 'K27 ', '2-ZY', 'S', '0', ' ', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4307', '491', 'R 80 M                   ', '486', '486', '1', '0', '91', '247E', '2-ZY', 'S', '0', ' ', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4308', '492', 'R 1150 GS US Adventu     ', '441', '441', '1', '0', '92', 'R21 ', '2-ZY', 'S', '0', ' ', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4309', '493', 'R 100 R Mystik           ', '486', '486', '1', '0', '91', '247E', '2-ZY', 'S', '0', ' ', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4310', '495', 'R 1150 GS US             ', '415', '415', '1', '0', '92', 'R21 ', '2-ZY', 'S', '0', ' ', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4311', '496', 'R 1200 CL US             ', '442', '442', '1', '0', '92', 'K30 ', '2-ZY', 'S', '0', ' ', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4312', '497', 'R 100 M US               ', '486', '486', '1', '0', '91', '247E', '2-ZY', 'S', '0', ' ', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4313', '498', 'R 1150 RS US             ', '447', '447', '1', '0', '92', 'R22 ', '2-ZY', 'S', '0', ' ', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4314', '499', 'R 1150 RT US             ', '419', '419', '1', '0', '92', 'R22 ', '2-ZY', 'S', '0', ' ', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4315', '501', 'K 100                    ', '501', '501', '1', '0', '58', 'K589', '4-ZY', 'S', '0', ' ', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4316', '502', 'K 100 RS                 ', '502', '502', '1', '0', '58', 'K589', '4-ZY', 'S', '0', ' ', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4317', '503', 'K 100 RS                 ', '502', '502', '1', '0', '58', 'K589', '4-ZY', 'S', '0', ' ', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4318', '504', 'K 100 RT                 ', '504', '504', '1', '0', '58', 'K589', '4-ZY', 'S', '0', ' ', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4319', '505', 'K 100 RT                 ', '504', '504', '1', '0', '58', 'K589', '4-ZY', 'S', '0', ' ', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4320', '506', 'K 100 LT                 ', '506', '506', '1', '0', '58', 'K589', '4-ZY', 'S', '0', ' ', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4321', '507', 'S 1000 RR                ', '507', '507', '1', '0', 'U2', 'K46 ', '4-ZY', 'S', '0', ' ', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4322', '508', 'K 1300 S                 ', '508', '508', '1', '0', '40', 'K40 ', '4-ZY', 'S', '0', ' ', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4323', '509', 'K 1300 S US              ', '508', '508', '1', '0', '40', 'K40 ', '4-ZY', 'S', '0', ' ', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4324', '511', 'K 100 US                 ', '501', '501', '1', '0', '58', 'K589', '4-ZY', 'S', '0', ' ', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4325', '513', 'K 100 RS US              ', '502', '502', '1', '0', '58', 'K589', '4-ZY', 'S', '0', ' ', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4326', '514', 'K 100 RT US              ', '504', '504', '1', '0', '58', 'K589', '4-ZY', 'S', '0', ' ', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4327', '516', 'K 100 LT US              ', '506', '506', '1', '0', '58', 'K589', '4-ZY', 'S', '0', ' ', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4328', '517', 'S 1000 RR US             ', '507', '507', '1', '0', 'U2', 'K46 ', '4-ZY', 'S', '0', ' ', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4329', '518', 'K 1300 R                 ', '518', '518', '1', '0', '40', 'K43 ', '4-ZY', 'S', '0', ' ', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4330', '519', 'K 1300 R US              ', '518', '518', '1', '0', '40', 'K43 ', '4-ZY', 'S', '0', ' ', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4331', '521', 'K 100                    ', '521', '521', '1', '0', '58', 'K589', '4-ZY', 'S', '0', ' ', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4332', '522', 'K 1100 RS                ', '522', '522', '1', '0', '89', 'K589', '4-ZY', 'S', '0', ' ', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4333', '523', 'K 100 RS                 ', '523', '523', '1', '0', '89', 'K589', '4-ZY', 'S', '0', ' ', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4334', '524', 'S 1000 RR                ', '524', '524', '1', '0', '40', 'K46 ', '4-ZY', 'S', '0', ' ', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4335', '525', 'K 1                      ', '525', '525', '1', '0', '89', 'K589', '4-ZY', 'S', '0', ' ', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4336', '526', 'K 1100 LT                ', '526', '526', '1', '0', '89', 'K589', '4-ZY', 'S', '0', ' ', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4337', '532', 'K 1100 RS US             ', '522', '522', '1', '0', '89', 'K589', '4-ZY', 'S', '0', ' ', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4338', '533', 'K 100 RS US              ', '523', '523', '1', '0', '89', 'K589', '4-ZY', 'S', '0', ' ', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4339', '534', 'S 1000 RR US             ', '524', '524', '1', '0', '40', 'K46 ', '4-ZY', 'S', '0', ' ', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4340', '535', 'K 1 US                   ', '525', '525', '1', '0', '89', 'K589', '4-ZY', 'S', '0', ' ', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4341', '536', 'K 1100 LT US             ', '526', '526', '1', '0', '89', 'K589', '4-ZY', 'S', '0', ' ', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4342', '538', 'K 1300 GT                ', '538', '538', '1', '0', '40', 'K44 ', '4-ZY', 'S', '0', ' ', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4343', '539', 'K 1300 GT US             ', '538', '538', '1', '0', '40', 'K44 ', '4-ZY', 'S', '0', ' ', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4344', '544', 'K 1200 RS                ', '544', '544', '1', '0', '89', 'K589', '4-ZY', 'S', '0', ' ', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4345', '545', 'K 1200 LT                ', '545', '545', '1', '0', '89', 'K589', '4-ZY', 'S', '0', ' ', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4346', '547', 'K 1200 RS                ', '547', '547', '1', '0', '89', 'K41 ', '4-ZY', 'S', '0', ' ', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4347', '548', 'K 1200 GT                ', '548', '548', '1', '0', '89', 'K41 ', '4-ZY', 'S', '0', ' ', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4348', '549', 'K 1200 LT M             ', '549', '549', '1', '0', '89', 'K589', '4-ZY', 'S', '0', ' ', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4349', '554', 'K 1200 RS US             ', '544', '544', '1', '0', '89', 'K589', '4-ZY', 'S', '0', ' ', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4350', '555', 'K 1200 LT US             ', '545', '545', '1', '0', '89', 'K589', '4-ZY', 'S', '0', ' ', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4351', '557', 'K 1200 RS US             ', '547', '547', '1', '0', '89', 'K41 ', '4-ZY', 'S', '0', ' ', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4352', '558', 'K 1200 GT US             ', '548', '548', '1', '0', '89', 'K41 ', '4-ZY', 'S', '0', ' ', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4353', '559', 'K 1200 LT US M          ', '549', '549', '1', '0', '89', 'K589', '4-ZY', 'S', '0', ' ', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4354', '561', 'K 75 Basis Beh.          ', '561', '561', '1', '0', '56', 'K569', '3-ZY', 'S', '0', ' ', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4355', '562', 'K 75 Basis               ', '562', '562', '1', '0', '56', 'K569', '3-ZY', 'S', '0', ' ', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4356', '563', 'K 75 S                   ', '563', '563', '1', '0', '56', 'K569', '3-ZY', 'S', '0', ' ', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4357', '564', 'K 75 C                   ', '561', '561', '1', '0', '56', 'K569', '3-ZY', 'S', '0', ' ', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4358', '565', 'K 75 RT                  ', '565', '565', '1', '0', '56', 'K569', '3-ZY', 'S', '0', ' ', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4359', '571', 'K 75 Basis US            ', '561', '561', '1', '0', '56', 'K569', '3-ZY', 'S', '0', ' ', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4360', '572', 'K 75 S US                ', '563', '563', '1', '0', '56', 'K569', '3-ZY', 'S', '0', ' ', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4361', '573', 'K 75 RT US               ', '565', '565', '1', '0', '56', 'K569', '3-ZY', 'S', '0', ' ', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4362', '574', 'K 75 C US                ', '561', '561', '1', '0', '56', 'K569', '3-ZY', 'S', '0', ' ', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4363', '581', 'K1200S                   ', '581', '581', '1', '0', '40', 'K40 ', '4-ZY', 'S', '0', ' ', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4364', '584', 'K 1200 R                 ', '584', '584', '1', '0', '40', 'K43 ', '4-ZY', 'S', '0', ' ', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4365', '585', 'K 1200R SPORT            ', '585', '585', '1', '0', '40', 'K43 ', '4-ZY', 'S', '0', ' ', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4366', '587', 'K 1200 GT                ', '587', '587', '1', '0', '40', 'K44 ', '4-ZY', 'S', '0', ' ', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4367', '591', 'K1200S US                ', '581', '581', '1', '0', '40', 'K40 ', '4-ZY', 'S', '0', ' ', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4368', '594', 'K 1200 R US              ', '584', '584', '1', '0', '40', 'K43 ', '4-ZY', 'S', '0', ' ', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4369', '595', 'K 1200 R SPORT US        ', '585', '585', '1', '0', '40', 'K43 ', '4-ZY', 'S', '0', ' ', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4370', '597', 'K 1200 GT US             ', '587', '587', '1', '0', '40', 'K44 ', '4-ZY', 'S', '0', ' ', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4371', '601', 'K1600GT                  ', '601', '601', '1', '0', 'U2', 'K48 ', '6-ZY', 'S', '0', ' ', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4372', '602', 'K1600GTL                 ', '602', '602', '1', '0', 'U2', 'K48 ', '6-ZY', 'S', '0', ' ', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4373', '611', 'K1600GT US               ', '601', '601', '1', '0', 'U2', 'K48 ', '6-ZY', 'S', '0', ' ', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4374', '612', 'K1600GTL US              ', '602', '602', '1', '0', 'U2', 'K48 ', '6-ZY', 'S', '0', ' ', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4375', '998', 'BOUTIQUE                 ', '998', '998', '1', '0', '98', 'EXX ', '????', 'S', '0', ' ', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4376', '1A01', 'M135I A                  ', '    ', '    ', '1', '1', '1', 'F20 ', 'N55 ', 'A', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4377', '1A11', '116I                     ', '1A11', '1A11', '1', '1', '1', 'F20 ', 'N13 ', 'S', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4378', '1A12', '116I RL                  ', '1A11', '1A11', '1', '1', '1', 'F20 ', 'N13 ', 'S', '5', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4379', '1A21', '116I A                   ', '1A21', '1A21', '1', '1', '1', 'F20 ', 'N13 ', 'A', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4380', '1A22', '116I RL A                ', '1A21', '1A21', '1', '1', '1', 'F20 ', 'N13 ', 'A', '5', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4381', '1A31', '118I                     ', '1A31', '1A31', '1', '1', '1', 'F20 ', 'N13 ', 'S', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4382', '1A32', '118I RL                  ', '1A31', '1A31', '1', '1', '1', 'F20 ', 'N13 ', 'S', '5', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4383', '1A41', '118I A                   ', '1A41', '1A41', '1', '1', '1', 'F20 ', 'N13 ', 'A', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4384', '1A42', '118I RL A                ', '1A41', '1A41', '1', '1', '1', 'F20 ', 'N13 ', 'A', '5', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4385', '1A51', '125I                     ', '1A51', '1A51', '1', '1', '1', 'F20 ', 'N20 ', 'S', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4386', '1A52', '125I RL                  ', '1A51', '1A51', '1', '1', '1', 'F20 ', 'N20 ', 'S', '5', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4387', '1A61', '125I A                   ', '1A61', '1A61', '1', '1', '1', 'F20 ', 'N20 ', 'A', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4388', '1A62', '125I RL A                ', '1A61', '1A61', '1', '1', '1', 'F20 ', 'N20 ', 'A', '5', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4389', '1B01', 'M135I XDRIVE A           ', '1B01', '1B01', '1', '1', '1X', 'F20 ', 'N55 ', 'A', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4390', '1B41', 'M135I XDRIVE A           ', '    ', '    ', '1', '1', '1X', 'F20 ', 'N55 ', 'A', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4391', '1B51', '120D XDRIVE              ', '1B51', '1B51', '1', '1', '1X', 'F20 ', 'N47T', 'S', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4392', '1B71', 'M135I                    ', '1B71', '1B71', '1', '1', '1', 'F20 ', 'N55 ', 'S', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4393', '1B72', 'M135I RL                 ', '1B71', '1B71', '1', '1', '1', 'F20 ', 'N55 ', 'S', '5', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4394', '1B81', 'M135I A                  ', '1B81', '1B81', '1', '1', '1', 'F20 ', 'N55 ', 'A', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4395', '1B82', 'M135I RL A               ', '1B81', '1B81', '1', '1', '1', 'F20 ', 'N55 ', 'A', '5', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4396', '1C11', '118D                     ', '1C11', '1C11', '1', '1', '1', 'F20 ', 'N47T', 'S', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4397', '1C12', '118D RL                  ', '1C11', '1C11', '1', '1', '1', 'F20 ', 'N47T', 'S', '5', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4398', '1C21', '118D A                   ', '1C21', '1C21', '1', '1', '1', 'F20 ', 'N47T', 'A', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4399', '1C22', '118D RL A                ', '1C21', '1C21', '1', '1', '1', 'F20 ', 'N47T', 'A', '5', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4400', '1C31', '120D                     ', '1C31', '1C31', '1', '1', '1', 'F20 ', 'N47T', 'S', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4401', '1C32', '120D RL                  ', '1C31', '1C31', '1', '1', '1', 'F20 ', 'N47T', 'S', '5', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4402', '1C41', '120D A                   ', '1C41', '1C41', '1', '1', '1', 'F20 ', 'N47T', 'A', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4403', '1C42', '120D RL A                ', '1C41', '1C41', '1', '1', '1', 'F20 ', 'N47T', 'A', '5', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4404', '1C51', '125D                     ', '1C51', '1C51', '1', '1', '1', 'F20 ', 'N47T', 'S', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4405', '1C52', '125D RL                  ', '1C51', '1C51', '1', '1', '1', 'F20 ', 'N47T', 'S', '5', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4406', '1C61', '125D A                   ', '1C61', '1C61', '1', '1', '1', 'F20 ', 'N47T', 'A', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4407', '1C62', '125D RL A                ', '1C61', '1C61', '1', '1', '1', 'F20 ', 'N47T', 'A', '5', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4408', '1C71', '116D                     ', '1C71', '1C71', '1', '1', '1', 'F20 ', 'N47T', 'S', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4409', '1C72', '116D RL                  ', '1C71', '1C71', '1', '1', '1', 'F20 ', 'N47T', 'S', '5', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4410', '1C81', '116D A                   ', '1C81', '1C81', '1', '1', '1', 'F20 ', 'N47T', 'A', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4411', '1C82', '116D RL A                ', '1C81', '1C81', '1', '1', '1', 'F20 ', 'N47T', 'A', '5', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4412', '1C91', '116D EFFDYN EDITION      ', '1C91', '1C91', '1', '1', '1F', 'F20 ', 'N47T', 'S', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4413', '1C92', '116D EFFDYN RL           ', '1C91', '1C91', '1', '1', '1F', 'F20 ', 'N47T', 'S', '5', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4414', '1D11', '116I                     ', '1D11', '1D11', '1', '1', '1', 'F21 ', 'N13 ', 'S', '3', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4415', '1D12', '116I RL                  ', '1D11', '1D11', '1', '1', '1', 'F21 ', 'N13 ', 'S', '3', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4416', '1D21', '116I A                   ', '1D21', '1D21', '1', '1', '1', 'F21 ', 'N13 ', 'A', '3', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4417', '1D22', '116I RL A                ', '1D21', '1D21', '1', '1', '1', 'F21 ', 'N13 ', 'A', '3', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4418', '1D31', '118I                     ', '1D31', '1D31', '1', '1', '1', 'F21 ', 'N13 ', 'S', '3', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4419', '1D32', '118I RL                  ', '1D31', '1D31', '1', '1', '1', 'F21 ', 'N13 ', 'S', '3', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4420', '1D41', '118I A                   ', '1D41', '1D41', '1', '1', '1', 'F21 ', 'N13 ', 'A', '3', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4421', '1D42', '118I RL A                ', '1D41', '1D41', '1', '1', '1', 'F21 ', 'N13 ', 'A', '3', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4422', '1D51', '125I                     ', '1D51', '1D51', '1', '1', '1', 'F21 ', 'N20 ', 'S', '3', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4423', '1D52', '125I RL                  ', '1D51', '1D51', '1', '1', '1', 'F21 ', 'N20 ', 'S', '3', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4424', '1D61', '125I A                   ', '1D61', '1D61', '1', '1', '1', 'F21 ', 'N20 ', 'A', '3', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4425', '1D62', '125I RL A                ', '1D61', '1D61', '1', '1', '1', 'F21 ', 'N20 ', 'A', '3', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4426', '1D71', 'M135I                    ', '    ', '    ', '1', '1', '1', 'F21 ', 'N55 ', 'S', '3', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4427', '1.00E+11', '118D                     ', '1.00E+11', '1.00E+11', '1', '1', '1', 'F21 ', 'N47T', 'S', '3', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4428', '1.00E+12', '118D RL                  ', '1.00E+11', '1.00E+11', '1', '1', '1', 'F21 ', 'N47T', 'S', '3', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4429', '1.00E+21', '118D A                   ', '1.00E+21', '1.00E+21', '1', '1', '1', 'F21 ', 'N47T', 'A', '3', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4430', '1.00E+22', '118D RL A                ', '1.00E+21', '1.00E+21', '1', '1', '1', 'F21 ', 'N47T', 'A', '3', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4431', '1.00E+31', '120D                     ', '1.00E+31', '1.00E+31', '1', '1', '1', 'F21 ', 'N47T', 'S', '3', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4432', '1.00E+32', '120D RL                  ', '1.00E+31', '1.00E+31', '1', '1', '1', 'F21 ', 'N47T', 'S', '3', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4433', '1.00E+41', '120D A                   ', '1.00E+41', '1.00E+41', '1', '1', '1', 'F21 ', 'N47T', 'A', '3', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4434', '1.00E+42', '120D RL A                ', '1.00E+41', '1.00E+41', '1', '1', '1', 'F21 ', 'N47T', 'A', '3', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4435', '1.00E+51', '120D XDRIVE              ', '1.00E+51', '1.00E+51', '1', '1', '1', 'F21 ', 'N47T', 'S', '3', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4436', '1.00E+71', '125D                     ', '1.00E+71', '1.00E+71', '1', '1', '1', 'F21 ', 'N47T', 'S', '3', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4437', '10.00E+71', '125D RL                  ', '1.00E+71', '1.00E+71', '1', '1', '1', 'F21 ', 'N47T', 'S', '3', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4438', '10.00E+80', '125D A                   ', '10.00E+80', '10.00E+80', '1', '1', '1', 'F21 ', 'N47T', 'A', '3', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4439', '1.00E+82', '125D RL A                ', '10.00E+80', '10.00E+80', '1', '1', '1', 'F21 ', 'N47T', 'A', '3', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4440', '1F03', '228I US A                ', '    ', '    ', '1', '1', '2', 'F22 ', 'N26 ', 'A', '2', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4441', '1F53', '228I US                  ', '1F53', '1F53', '1', '1', '2P', 'F22 ', 'N20 ', 'S', '2', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4442', '1F63', '228I US A                ', '1F63', '1F63', '1', '1', '2P', 'F22 ', 'N20 ', 'A', '2', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4443', '1H11', '220D                     ', '1H11', '1H11', '1', '1', '1', 'F22 ', 'N47T', 'S', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4444', '1H21', '220D A                   ', '1H21', '1H21', '1', '1', '1', 'F22 ', 'N47T', 'A', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4445', '1H31', '218D                     ', '    ', '    ', '1', '1', '1', 'F22 ', 'N47T', 'S', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4446', '1H41', '218D A                   ', '    ', '    ', '1', '1', '1', 'F22 ', 'N47T', 'A', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4447', '1H81', '225D A                   ', '    ', '    ', '1', '1', '1', 'F22 ', 'N47T', 'A', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4448', '1J11', '220I                     ', '1J11', '1J11', '1', '1', '2', 'F22 ', 'N20 ', 'S', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4449', '1J21', '220I A                   ', '1J21', '1J21', '1', '1', '2', 'F22 ', 'N20 ', 'A', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4450', '1J22', '220I A                   ', '1J21', '1J21', '1', '1', '2', 'F22 ', 'N20 ', 'A', '2', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4451', '1J71', 'M235I                    ', '1J71', '1J71', '1', '1', '1', 'F22 ', 'N55 ', 'S', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4452', '1J72', 'M235I                    ', '1J71', '1J71', '1', '1', '1', 'F22 ', 'N55 ', 'S', '2', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4453', '1J73', 'M235I US                 ', '1J73', '1J73', '1', '1', '1', 'F22 ', 'N55 ', 'S', '2', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4454', '1J81', 'M235I A                  ', '1J81', '1J81', '1', '1', '1', 'F22 ', 'N55 ', 'A', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4455', '1J83', 'M235I US A               ', '1J83', '1J83', '1', '1', '1', 'F22 ', 'N55 ', 'A', '2', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4456', '1N01', 'M135I XDRIVE A           ', '1N01', '1N01', '1', '1', '1X', 'F21 ', 'N55 ', 'A', '3', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4457', '1N11', '116D                     ', '1N11', '1N11', '1', '1', '1', 'F21 ', 'N47T', 'S', '3', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4458', '1N12', '116D RL                  ', '1N11', '1N11', '1', '1', '1', 'F21 ', 'N47T', 'S', '3', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4459', '1N21', '116D A                   ', '1N21', '1N21', '1', '1', '1', 'F21 ', 'N47T', 'A', '3', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4460', '1N22', '116D RL A                ', '1N21', '1N21', '1', '1', '1', 'F21 ', 'N47T', 'A', '3', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4461', '1N31', '116D EFFDYN EDITION      ', '1N31', '1N31', '1', '1', '1G', 'F21 ', 'N47T', 'S', '3', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4462', '1N32', '116D EFFDYN EDITION      ', '1N31', '1N31', '1', '1', '1G', 'F21 ', 'N47T', 'S', '3', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4463', '1N51', '114D                     ', '1N51', '1N51', '1', '1', '1', 'F21 ', 'N47T', 'S', '3', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4464', '1N52', '114D                     ', '1N51', '1N51', '1', '1', '1', 'F21 ', 'N47T', 'S', '3', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4465', '1N71', 'M135I                    ', '1N71', '1N71', '1', '1', '1', 'F21 ', 'N55 ', 'S', '3', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4466', '1N72', 'M135I                    ', '1N71', '1N71', '1', '1', '1', 'F21 ', 'N55 ', 'S', '3', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4467', '1N81', 'M135I A                  ', '1N81', '1N81', '1', '1', '1', 'F21 ', 'N55 ', 'A', '3', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4468', '1N82', 'M135I A                  ', '1N81', '1N81', '1', '1', '1', 'F21 ', 'N55 ', 'A', '3', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4469', '1P11', '114I                     ', '1P11', '1P11', '1', '1', '1', 'F21 ', 'N13 ', 'S', '3', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4470', '1P12', '114I                     ', '1P11', '1P11', '1', '1', '1', 'F21 ', 'N13 ', 'S', '3', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4471', '1R11', '114I                     ', '1R11', '1R11', '1', '1', '1', 'F20 ', 'N13 ', 'S', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4472', '1R12', '114I                     ', '1R11', '1R11', '1', '1', '1', 'F20 ', 'N13 ', 'S', '5', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4473', '1T51', '118D XDRIVE              ', '1T51', '1T51', '1', '1', '1X', 'F20 ', 'N47T', 'S', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4474', '1T72', '120D XDRIVE              ', '1B51', '1B51', '1', '1', '1X', 'F20 ', 'N47T', 'S', '5', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4475', '1T91', '114D                     ', '1T91', '1T91', '1', '1', '1', 'F20 ', 'N47T', 'S', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4476', '1T92', '114D                     ', '1T91', '1T91', '1', '1', '1', 'F20 ', 'N47T', 'S', '5', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4477', '1X51', '118D XDRIVE              ', '1X51', '1X51', '1', '1', '1X', 'F21 ', 'N47T', 'S', '3', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4478', '1Z21', 'I3                       ', '1Z21', '1Z21', '1', '1', 'I0', 'I01 ', 'IB1 ', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4479', '1Z23', 'I3                       ', '1Z23', '1Z23', '1', '1', 'I0', 'I01 ', 'IB1 ', 'A', '4', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4480', '1Z41', 'I3 (+ REX)               ', '1Z41', '1Z41', '1', '1', 'I0', 'I01 ', 'IB1 ', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4481', '1Z43', 'I3 (+ REX)               ', '1Z43', '1Z43', '1', '1', 'I0', 'I01 ', 'IB1 ', 'A', '4', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4482', '1001', 'M 3  2-TUERIG            ', '1001', '1001', '1', '1', '3', 'E30 ', 'S14 ', 'S', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4483', '1003', 'M 3                      ', '1003', '1003', '1', '1', '3', 'E30 ', 'S14 ', 'S', '2', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4484', '1005', 'M 3  2T  KATALY          ', '1001', '1001', '1', '1', '3', 'E30 ', 'S14 ', 'S', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4485', '1007', 'M 3 SPORT EVOLU          ', '1001', '1001', '1', '1', '3', 'E30 ', 'S14 ', 'S', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4486', '1011', '318I KAT                 ', '1011', '1011', '1', '1', '3', 'E30 ', 'M10 ', 'S', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4487', '1012', '318I RL KAT              ', '1011', '1011', '1', '1', '3', 'E30 ', 'M10 ', 'S', '2', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4488', '1015', '316 I 2T. KATALYSATO     ', '1015', '1015', '1', '1', '3', 'E30 ', 'M10 ', 'S', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4489', '1021', '318I A KAT               ', '1021', '1021', '1', '1', '3', 'E30 ', 'M10 ', 'A', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4490', '1022', '318I A RL KAT            ', '1021', '1021', '1', '1', '3', 'E30 ', 'M10 ', 'A', '2', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4491', '1025', '316I A KAT               ', '1025', '1025', '1', '1', '3', 'E30 ', 'M10 ', 'A', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4492', '1031', '318I                     ', '1011', '1011', '1', '1', '3', 'E30 ', 'M10 ', 'S', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4493', '1032', '318I RL                  ', '1011', '1011', '1', '1', '3', 'E30 ', 'M10 ', 'S', '2', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4494', '1035', '318I/2 RL THA CKD        ', '1011', '1011', '1', '1', 'T3', 'E30 ', 'M10 ', 'S', '2', 'R', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4495', '1038', '318I/2 RL ZA CKD         ', '1011', '1011', '1', '1', 'C3', 'E30 ', 'M10 ', 'S', '2', 'R', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4496', '1041', '318I A                   ', '1021', '1021', '1', '1', '3', 'E30 ', 'M10 ', 'A', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4497', '1042', '318I A RL                ', '1021', '1021', '1', '1', '3', 'E30 ', 'M10 ', 'A', '2', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4498', '1048', '318I/2 A RL ZA CKD       ', '1021', '1021', '1', '1', 'C3', 'E30 ', 'M10 ', 'A', '2', 'R', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4499', '1051', '316 2-TUERIG             ', '1051', '1051', '1', '1', '3', 'E30 ', 'M10 ', 'S', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4500', '1052', '316 RL                   ', '1051', '1051', '1', '1', '3', 'E30 ', 'M10 ', 'S', '2', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4501', '1055', '316/2 RL THA CKD         ', '1051', '1051', '1', '1', 'T3', 'E30 ', 'M10 ', 'S', '2', 'R', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4502', '1058', '316/2 RL ZA CKD          ', '1051', '1051', '1', '1', 'C3', 'E30 ', 'M10 ', 'S', '2', 'R', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4503', '1061', '316 A                    ', '1061', '1061', '1', '1', '3', 'E30 ', 'M10 ', 'A', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4504', '1062', '316 A RL                 ', '1061', '1061', '1', '1', '3', 'E30 ', 'M10 ', 'A', '2', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4505', '1071', '318I                     ', '1071', '1071', '1', '1', '3', 'E30 ', 'M10 ', 'S', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4506', '1072', '318I RL                  ', '1071', '1071', '1', '1', '3', 'E30 ', 'M10 ', 'S', '2', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4507', '1074', '318I USA 2-DOOR          ', '1074', '1074', '1', '1', '3', 'E30 ', 'M10 ', 'S', '2', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4508', '1079', '318I JAP                 ', '1074', '1074', '1', '1', '3', 'E30 ', 'M10 ', 'S', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4509', '1081', '318I A                   ', '1081', '1081', '1', '1', '3', 'E30 ', 'M10 ', 'A', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4510', '1082', '318I A RL                ', '1081', '1081', '1', '1', '3', 'E30 ', 'M10 ', 'A', '2', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4511', '1084', '318IA USA 2DOOR          ', '1084', '1084', '1', '1', '3', 'E30 ', 'M10 ', 'A', '2', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4512', '1089', '318I A JAP               ', '1084', '1084', '1', '1', '3', 'E30 ', 'M10 ', 'A', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4513', '1092', '318I RL JAP              ', '1074', '1074', '1', '1', '3', 'E30 ', 'M10 ', 'S', '2', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4514', '1094', '318I A RL JAP            ', '1084', '1084', '1', '1', '3', 'E30 ', 'M10 ', 'A', '2', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4515', '1111', '325 I/2 KAT              ', '1111', '1111', '1', '1', '3', 'E30 ', 'M20 ', 'S', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4516', '1112', '325 I RHD 2-DOOR KAT     ', '1111', '1111', '1', '1', '3', 'E30 ', 'M20 ', 'S', '2', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4517', '1113', '325 I/2 USA              ', '1113', '1113', '1', '1', '3', 'E30 ', 'M20 ', 'S', '2', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4518', '1121', '325 I/2 A KAT            ', '1121', '1121', '1', '1', '3', 'E30 ', 'M20 ', 'A', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4519', '1122', '325I A RL KAT            ', '1121', '1121', '1', '1', '3', 'E30 ', 'M20 ', 'A', '2', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4520', '1123', '325 I/2 A USA            ', '1123', '1123', '1', '1', '3', 'E30 ', 'M20 ', 'A', '2', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4521', '1131', '320 I 2-TUERIG           ', '1131', '1131', '1', '1', '3', 'E30 ', 'M20 ', 'S', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4522', '1132', '320I RL                  ', '1131', '1131', '1', '1', '3', 'E30 ', 'M20 ', 'S', '2', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4523', '1134', '320I/2 RL MAL CKD        ', '1131', '1131', '1', '1', 'C3', 'E30 ', 'M20 ', 'S', '2', 'R', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4524', '1137', '320I/2 URU CKD           ', '1131', '1131', '1', '1', 'C3', 'E30 ', 'M20 ', 'S', '2', 'L', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4525', '1138', '320I/2 RL ZA CKD         ', '1131', '1131', '1', '1', 'C3', 'E30 ', 'M20 ', 'S', '2', 'R', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4526', '1141', '320 I/2 A                ', '1141', '1141', '1', '1', '3', 'E30 ', 'M20 ', 'A', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4527', '1142', '320I A RL                ', '1141', '1141', '1', '1', '3', 'E30 ', 'M20 ', 'A', '2', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4528', '1148', '320I/2 A RL ZA CKD       ', '1141', '1141', '1', '1', 'C3', 'E30 ', 'M20 ', 'A', '2', 'R', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4529', '1151', '320 I/2 KAT              ', '1151', '1151', '1', '1', '3', 'E30 ', 'M20 ', 'S', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4530', '1152', '320 I/2 RL KAT           ', '1151', '1151', '1', '1', '3', 'E30 ', 'M20 ', 'S', '2', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4531', '1161', '320 I/2 A KAT            ', '1161', '1161', '1', '1', '3', 'E30 ', 'M20 ', 'A', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4532', '1162', '320I A RL KAT            ', '1161', '1161', '1', '1', '3', 'E30 ', 'M20 ', 'A', '2', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4533', '1171', '323I 2-TUERIG            ', '1171', '1171', '1', '1', '3', 'E30 ', 'M20 ', 'S', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4534', '1172', '323I RL                  ', '1171', '1171', '1', '1', '3', 'E30 ', 'M20 ', 'S', '2', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4535', '1178', '323I/2 RL ZA CKD         ', '1171', '1171', '1', '1', 'C3', 'E30 ', 'M20 ', 'S', '2', 'R', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4536', '1181', '323IA 2-TUERIG           ', '1181', '1181', '1', '1', '3', 'E30 ', 'M20 ', 'A', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4537', '1182', '323I A RL                ', '1181', '1181', '1', '1', '3', 'E30 ', 'M20 ', 'A', '2', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4538', '1188', '323I/2 A RL ZA CKD       ', '1181', '1181', '1', '1', 'C3', 'E30 ', 'M20 ', 'A', '2', 'R', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4539', '1201', '325 I/2 A X KAT          ', '1201', '1201', '1', '1', '3', 'E30 ', 'M20 ', 'A', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4540', '1203', '325 I/2 A X USA          ', '1203', '1203', '1', '1', '3', 'E30 ', 'M20 ', 'A', '2', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4541', '1231', '325 I 2-TUERIG           ', '1231', '1231', '1', '1', '3', 'E30 ', 'M20 ', 'S', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4542', '1232', '325I RL                  ', '1231', '1231', '1', '1', '3', 'E30 ', 'M20 ', 'S', '2', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4543', '1238', '325I/2RL ZA CKD          ', '1231', '1231', '1', '1', 'C3', 'E30 ', 'M20 ', 'S', '2', 'R', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4544', '1239', '325I/2 URU CKD           ', '1231', '1231', '1', '1', 'C3', 'E30 ', 'M20 ', 'S', '2', 'L', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4545', '1241', '325I A                   ', '1241', '1241', '1', '1', '3', 'E30 ', 'M20 ', 'A', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4546', '1242', '325I A RL                ', '1241', '1241', '1', '1', '3', 'E30 ', 'M20 ', 'A', '2', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4547', '1248', '325I/2ARLZA CKD          ', '1241', '1241', '1', '1', 'C3', 'E30 ', 'M20 ', 'A', '2', 'R', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4548', '1251', '325 E 2T. KATALYSATO     ', '1251', '1251', '1', '1', '3', 'E30 ', 'M20 ', 'S', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4549', '1252', '325E RL KAT              ', '1251', '1251', '1', '1', '3', 'E30 ', 'M20 ', 'S', '2', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4550', '1254', '325 E/2 USA              ', '1254', '1254', '1', '1', '3', 'E30 ', 'M20 ', 'S', '2', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4551', '1261', '325E A KAT               ', '1261', '1261', '1', '1', '3', 'E30 ', 'M20 ', 'A', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4552', '1262', '325E A RL KAT            ', '1261', '1261', '1', '1', '3', 'E30 ', 'M20 ', 'A', '2', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4553', '1264', '325A USA 2-DOOR          ', '1264', '1264', '1', '1', '3', 'E30 ', 'M20 ', 'A', '2', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4554', '1271', '325 IX 2-TUERIG          ', '1271', '1271', '1', '1', '3', 'E30 ', 'M20 ', 'S', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4555', '1281', '325IX A                  ', '1201', '1201', '1', '1', '3', 'E30 ', 'M20 ', 'A', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4556', '1291', '325 I/2 X KAT            ', '1291', '1291', '1', '1', '3', 'E30 ', 'M20 ', 'S', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4557', '1293', '325 I/2 X USA            ', '1293', '1293', '1', '1', '3', 'E30 ', 'M20 ', 'S', '2', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4558', '1315', '316I KAT                 ', '1015', '1015', '1', '1', '3', 'E30 ', 'M10 ', 'S', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4559', '1325', '316I A KAT               ', '1025', '1025', '1', '1', '3', 'E30 ', 'M10 ', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4560', '1331', '318 I 4T. KATALYSATO     ', '1331', '1331', '1', '1', '3', 'E30 ', 'M10 ', 'S', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4561', '1332', '318I RL KAT              ', '1331', '1331', '1', '1', '3', 'E30 ', 'M10 ', 'S', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4562', '1341', '318I A KAT               ', '1341', '1341', '1', '1', '3', 'E30 ', 'M10 ', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4563', '1342', '318I A RL KAT            ', '1341', '1341', '1', '1', '3', 'E30 ', 'M10 ', 'A', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4564', '1351', '316 4-TUERIG             ', '1351', '1351', '1', '1', '3', 'E30 ', 'M10 ', 'S', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4565', '1352', '316 RL                   ', '1351', '1351', '1', '1', '3', 'E30 ', 'M10 ', 'S', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4566', '1355', '316/4 RL THA CKD         ', '1351', '1351', '1', '1', 'T3', 'E30 ', 'M10 ', 'S', '4', 'R', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4567', '1358', '316/4 RL ZA CKD          ', '1351', '1351', '1', '1', 'C3', 'E30 ', 'M10 ', 'S', '4', 'R', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4568', '1361', '316A 4-TUERIG            ', '1361', '1361', '1', '1', '3', 'E30 ', 'M10 ', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4569', '1362', '316 A RL                 ', '1361', '1361', '1', '1', '3', 'E30 ', 'M10 ', 'A', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4570', '1371', '318I 4-TUERIG            ', '1331', '1331', '1', '1', '3', 'E30 ', 'M10 ', 'S', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4571', '1372', '318I RL                  ', '1331', '1331', '1', '1', '3', 'E30 ', 'M10 ', 'S', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4572', '1374', '318I USA 4-DOOR          ', '1374', '1374', '1', '1', '3', 'E30 ', 'M10 ', 'S', '4', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4573', '1375', '316I/4 RL THA CKD        ', '1015', '1015', '1', '1', 'T3', 'E30 ', 'M10 ', 'S', '4', 'R', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4574', '1376', '318I/4 RL MAL CKD        ', '1331', '1331', '1', '1', 'C3', 'E30 ', 'M10 ', 'S', '4', 'R', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4575', '1377', '318I/4 RL IND CKD        ', '1331', '1331', '1', '1', 'C3', 'E30 ', 'M10 ', 'S', '4', 'R', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4576', '1378', '318I/4 RL ZA CKD         ', '1331', '1331', '1', '1', 'C3', 'E30 ', 'M10 ', 'S', '4', 'R', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4577', '1381', '318I A                   ', '1341', '1341', '1', '1', '3', 'E30 ', 'M10 ', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4578', '1382', '318I A RL                ', '1341', '1341', '1', '1', '3', 'E30 ', 'M10 ', 'A', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4579', '1384', '318IA USA 4DOOR          ', '1384', '1384', '1', '1', '3', 'E30 ', 'M10 ', 'A', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4580', '1388', '318I/4 A RL ZA CKD       ', '1341', '1341', '1', '1', 'C3', 'E30 ', 'M10 ', 'A', '4', 'R', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4581', '1394', '318I A RL JAP            ', '1384', '1384', '1', '1', '3', 'E30 ', 'M10 ', 'A', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4582', '1411', '325 I 4T. KATALYSATO     ', '1111', '1111', '1', '1', '3', 'E30 ', 'M20 ', 'S', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4583', '1412', '325 I RHD 4-DOOR KAT     ', '1111', '1111', '1', '1', '3', 'E30 ', 'M20 ', 'S', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4584', '1413', '325 I/4 USA              ', '1413', '1413', '1', '1', '3', 'E30 ', 'M20 ', 'S', '4', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4585', '1421', '325 I/4 A KAT            ', '1121', '1121', '1', '1', '3', 'E30 ', 'M20 ', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4586', '1422', '325I A RL KAT            ', '1121', '1121', '1', '1', '3', 'E30 ', 'M20 ', 'A', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4587', '1423', '325 I/4 A USA            ', '1423', '1423', '1', '1', '3', 'E30 ', 'M20 ', 'A', '4', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4588', '1431', '320 I 4-TUERIG           ', '1431', '1431', '1', '1', '3', 'E30 ', 'M20 ', 'S', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4589', '1432', '320I RHD 4-DOOR          ', '1431', '1431', '1', '1', '3', 'E30 ', 'M20 ', 'S', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4590', '1434', '320I/4 RL MAL CKD        ', '1431', '1431', '1', '1', 'C3', 'E30 ', 'M20 ', 'S', '4', 'R', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4591', '1438', '320I/4 RLZA CKD          ', '1431', '1431', '1', '1', 'C3', 'E30 ', 'M20 ', 'S', '4', 'R', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4592', '1439', '320I/4 URU CKD           ', '1151', '1151', '1', '1', 'C3', 'E30 ', 'M20 ', 'S', '4', 'L', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4593', '1441', '320I A                   ', '1441', '1441', '1', '1', '3', 'E30 ', 'M20 ', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4594', '1442', '320I A RL                ', '1441', '1441', '1', '1', '3', 'E30 ', 'M20 ', 'A', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4595', '1444', '320I/4 A RL MAL CKD      ', '1441', '1441', '1', '1', 'C3', 'E30 ', 'M20 ', 'A', '4', 'R', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4596', '1448', '320I/4ARLZA CKD          ', '1441', '1441', '1', '1', 'C3', 'E30 ', 'M20 ', 'A', '4', 'R', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4597', '1451', '320 I 4T. KATALYSATO     ', '1151', '1151', '1', '1', '3', 'E30 ', 'M20 ', 'S', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4598', '1452', '320 I RHD 4-DOOR KAT     ', '1151', '1151', '1', '1', '3', 'E30 ', 'M20 ', 'S', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4599', '1461', '320 I/4 A KAT            ', '1161', '1161', '1', '1', '3', 'E30 ', 'M20 ', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4600', '1462', '320 I/4 ARL KAT          ', '1161', '1161', '1', '1', '3', 'E30 ', 'M20 ', 'A', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4601', '1471', '323I 4-TUERIG            ', '1471', '1471', '1', '1', '3', 'E30 ', 'M20 ', 'S', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4602', '1472', '323I RL                  ', '1471', '1471', '1', '1', '3', 'E30 ', 'M20 ', 'S', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4603', '1478', '323I/4 RL ZA CKD         ', '1471', '1471', '1', '1', 'C3', 'E30 ', 'M20 ', 'S', '4', 'R', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4604', '1481', '323I A                   ', '1481', '1481', '1', '1', '3', 'E30 ', 'M20 ', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4605', '1482', '323I A RL                ', '1481', '1481', '1', '1', '3', 'E30 ', 'M20 ', 'A', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4606', '1488', '323I/4 A RL ZA CKD       ', '1481', '1481', '1', '1', 'C3', 'E30 ', 'M20 ', 'A', '4', 'R', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4607', '1501', '325 IXA 4T. KATALYSA     ', '1201', '1201', '1', '1', '3', 'E30 ', 'M20 ', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4608', '1503', '325 I/4 A X USA          ', '1203', '1203', '1', '1', '3', 'E30 ', 'M20 ', 'A', '4', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4609', '1511', '324D                     ', '1511', '1511', '1', '1', '3', 'E30 ', 'M21S', 'S', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4610', '1519', '324D/4 URU CKD           ', '1511', '1511', '1', '1', 'C3', 'E30 ', 'M21S', 'S', '4', 'L', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4611', '1521', '324D A                   ', '1521', '1521', '1', '1', '3', 'E30 ', 'M21S', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4612', '1531', '325 I 4-TUERIG           ', '1231', '1231', '1', '1', '3', 'E30 ', 'M20 ', 'S', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4613', '1532', '325I RL                  ', '1231', '1231', '1', '1', '3', 'E30 ', 'M20 ', 'S', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4614', '1538', '325I/4RL ZA CKD          ', '1231', '1231', '1', '1', 'C3', 'E30 ', 'M20 ', 'S', '4', 'R', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4615', '1541', '325I A                   ', '1241', '1241', '1', '1', '3', 'E30 ', 'M20 ', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4616', '1542', '325I A RL                ', '1241', '1241', '1', '1', '3', 'E30 ', 'M20 ', 'A', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4617', '1548', '325I/4ARLZA CKD          ', '1241', '1241', '1', '1', 'C3', 'E30 ', 'M20 ', 'A', '4', 'R', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4618', '1551', '325 E 4T. KATALYSATO     ', '1251', '1251', '1', '1', '3', 'E30 ', 'M20 ', 'S', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4619', '1552', '325E RL KAT              ', '1251', '1251', '1', '1', '3', 'E30 ', 'M20 ', 'S', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4620', '1554', '325 USA 4-DOOR           ', '1554', '1554', '1', '1', '3', 'E30 ', 'M20 ', 'S', '4', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4621', '1561', '325E A 4T. KATALYSAT     ', '1261', '1261', '1', '1', '3', 'E30 ', 'M20 ', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4622', '1562', '325E A RL KAT            ', '1261', '1261', '1', '1', '3', 'E30 ', 'M20 ', 'A', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4623', '1564', '325A USA 4-DOOR          ', '1564', '1564', '1', '1', '3', 'E30 ', 'M20 ', 'A', '4', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4624', '1569', '325 I A JAP              ', '1564', '1564', '1', '1', '3', 'E30 ', 'M20 ', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4625', '1571', '325 IX 4-TUERIG          ', '1271', '1271', '1', '1', '3', 'E30 ', 'M20 ', 'S', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4626', '1581', '325IX A                  ', '1201', '1201', '1', '1', '3', 'E30 ', 'M20 ', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4627', '1591', '325 I/4 X KAT            ', '1291', '1291', '1', '1', '3', 'E30 ', 'M20 ', 'S', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4628', '1593', '325 I/4 X USA            ', '1293', '1293', '1', '1', '3', 'E30 ', 'M20 ', 'S', '4', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4629', '1701', '315', '1701', '1701', '1', '1', '3', 'E21 ', 'M10 ', 'S', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4630', '1702', '315 RL                   ', '1701', '1701', '1', '1', '3', 'E21 ', 'M10 ', 'S', '2', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4631', '1711', '316', '1701', '1701', '1', '1', '3', 'E21 ', 'M10 ', 'S', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4632', '1712', '316 RL                   ', '1701', '1701', '1', '1', '3', 'E21 ', 'M10 ', 'S', '2', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4633', '1715', '316/2 RL THA CKD         ', '1701', '1701', '1', '1', 'C3', 'E21 ', 'M10 ', 'S', '2', 'R', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4634', '1716', '316/2 POR CKD            ', '1701', '1701', '1', '1', 'C3', 'E21 ', 'M10 ', 'S', '2', 'L', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4635', '1721', '316 A                    ', '1701', '1701', '1', '1', '3', 'E21 ', 'M10 ', 'A', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4636', '1722', '316 A RL                 ', '1701', '1701', '1', '1', '3', 'E21 ', 'M10 ', 'A', '2', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4637', '1731', '318I                     ', '1731', '1731', '1', '1', '3', 'E21 ', 'M10 ', 'S', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4638', '1732', '318I RL                  ', '1731', '1731', '1', '1', '3', 'E21 ', 'M10 ', 'S', '2', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4639', '1733', '318I                     ', '1733', '1733', '1', '1', '3', 'E21 ', 'M10 ', 'S', '2', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4640', '1739', '318I JAP                 ', '1733', '1733', '1', '1', '3', 'E21 ', 'M10 ', 'S', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4641', '1741', '318I A                   ', '1741', '1741', '1', '1', '3', 'E21 ', 'M10 ', 'A', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4642', '1742', '318I A RL                ', '1741', '1741', '1', '1', '3', 'E21 ', 'M10 ', 'A', '2', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4643', '1743', '318I A US                ', '1743', '1743', '1', '1', '3', 'E21 ', 'M10 ', 'A', '2', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4644', '1749', '318I A JAP               ', '1743', '1743', '1', '1', '3', 'E21 ', 'M10 ', 'A', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4645', '1811', '320', '1811', '1811', '1', '1', '3', 'E21 ', 'M20 ', 'S', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4646', '1812', '320 RL                   ', '1811', '1811', '1', '1', '3', 'E21 ', 'M20 ', 'S', '2', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4647', '1814', '320/2 RL MAL CKD         ', '1811', '1811', '1', '1', 'C3', 'E21 ', 'M20 ', 'S', '2', 'R', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4648', '1815', '320/2 RL THA CKD         ', '1811', '1811', '1', '1', 'C3', 'E21 ', 'M20 ', 'S', '2', 'R', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4649', '1817', '320/2 URU CKD            ', '1811', '1811', '1', '1', 'C3', 'E21 ', 'M20 ', 'S', '2', 'L', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4650', '1821', '320 A                    ', '1821', '1821', '1', '1', '3', 'E21 ', 'M20 ', 'A', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4651', '1822', '320 A RL                 ', '1821', '1821', '1', '1', '3', 'E21 ', 'M20 ', 'A', '2', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4652', '1831', '323I                     ', '1831', '1831', '1', '1', '3', 'E21 ', 'M20 ', 'S', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4653', '1832', '323I RL                  ', '1831', '1831', '1', '1', '3', 'E21 ', 'M20 ', 'S', '2', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4654', '1841', '323I A                   ', '1841', '1841', '1', '1', '3', 'E21 ', 'M20 ', 'A', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4655', '1842', '323I A RL                ', '1841', '1841', '1', '1', '3', 'E21 ', 'M20 ', 'A', '2', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4656', '2001', '1502 L                   ', '2001', '2001', '1', '1', '14', '114', 'M10 ', 'S', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4657', '2002', '1502 L RL                ', '2001', '2001', '1', '1', '14', '114', 'M10 ', 'S', '2', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4658', '2004', '1502 L CKD PORTUGAL      ', '2001', '2001', '1', '1', '14', '114', 'M10 ', 'S', '2', 'L', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4659', '2011', '1602 L                   ', '2011', '2011', '1', '1', '14', '114', 'M10 ', 'S', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4660', '2012', '1602 L RL                ', '2011', '2011', '1', '1', '14', '114', 'M10 ', 'S', '2', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4661', '2016', '1602 CKD PORTUGAL        ', '2011', '2011', '1', '1', '14', '114', 'M10 ', 'S', '2', 'L', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4662', '2111', ' 1802 L                  ', '2111', '2111', '1', '1', '14', '114', 'M10 ', 'S', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4663', '2121', '1602 LA ORIENT           ', '2011', '2011', '1', '1', '14', '114', 'M10 ', 'A', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4664', '2211', ' 2002 L                  ', '2211', '2211', '1', '1', '14', '114', 'M10 ', 'S', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4665', '2212', ' 2002 L RL               ', '2211', '2211', '1', '1', '14', '114', 'M10 ', 'S', '2', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4666', '2213', ' 2002 L USA              ', '2211', '2211', '1', '1', '14', '114', 'M10 ', 'S', '2', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4667', '2214', ' 2002 L USA/75           ', '2211', '2211', '1', '1', '14', '114', 'M10 ', 'S', '2', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4668', '2215', '2002 L USA/76            ', '2211', '2211', '1', '1', '14', '114', 'M10 ', 'S', '2', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4669', '2216', ' 2002 CKD PORT           ', '2211', '2211', '1', '1', '14', '114', 'M10 ', 'S', '2', 'L', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4670', '2221', ' 2002 L A                ', '2221', '2221', '1', '1', '14', '114', 'M10 ', 'A', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4671', '2222', ' 2002 LA/RL              ', '2221', '2221', '1', '1', '14', '114', 'M10 ', 'A', '2', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4672', '2223', ' 2002 LA/USA             ', '2221', '2221', '1', '1', '14', '114', 'M10 ', 'A', '2', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4673', '2224', ' 2002 LA USA/75          ', '2221', '2221', '1', '1', '14', '114', 'M10 ', 'A', '2', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4674', '2225', '2002 L A USA/76          ', '2221', '2221', '1', '1', '14', '114', 'M10 ', 'A', '2', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4675', '2231', ' 2002 TII                ', '2231', '2231', '1', '1', '14', '114', 'M10 ', 'S', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4676', '2232', ' 2002 TII RL             ', '2231', '2231', '1', '1', '14', '114', 'M10 ', 'S', '2', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4677', '2233', ' 2002 TII USA            ', '2231', '2231', '1', '1', '14', '114', 'M10 ', 'S', '2', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4678', '2251', ' 2002 CAB M. UEB.        ', '2211', '2211', '1', '1', '14', '114', 'M10 ', 'S', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4679', '2252', ' 2002 CAB RL UEB.        ', '2211', '2211', '1', '1', '14', '114', 'M10 ', 'S', '2', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4680', '2291', '2002 TURBO               ', '    ', '    ', '1', '1', '14', '114', 'M10 ', 'S', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4681', '2311', ' 1800 TOURING            ', '2311', '2311', '1', '1', '14', '114', 'M10 ', 'S', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4682', '2411', ' 2000 TOURING            ', '2411', '2411', '1', '1', '14', '114', 'M10 ', 'S', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4683', '2412', ' 2000 TOURING RL         ', '2411', '2411', '1', '1', '14', '114', 'M10 ', 'S', '2', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4684', '2431', ' 2000 TII TOURING        ', '2431', '2431', '1', '1', '14', '114', 'M10 ', 'S', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4685', '2511', '1602 L                   ', '2011', '2011', '1', '1', '14', '114', 'M10 ', 'S', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4686', '2512', '1602 L RL                ', '2011', '2011', '1', '1', '14', '114', 'M10 ', 'S', '2', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4687', '2515', '1602 L US                ', '2011', '2011', '1', '1', '14', '114', 'M10 ', 'S', '2', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4688', '2521', '1602 SKD BELGIEN         ', '2011', '2011', '1', '1', '14', '114', 'M10 ', 'S', '2', 'L', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4689', '2523', '1602 TI SKD BELGIEN      ', '2011', '2011', '1', '1', '14', '114', 'M10 ', 'S', '2', 'L', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4690', '2525', '1602 CKD URUGUAY         ', '2011', '2011', '1', '1', '14', '114', 'M10 ', 'S', '2', 'L', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4691', '2526', '1602 CKD PORTUGAL        ', '2011', '2011', '1', '1', '14', '114', 'M10 ', 'S', '2', 'L', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4692', '2531', ' 1802 1600 MIT 1800M     ', '2111', '2111', '1', '1', '14', '114', 'M10 ', 'S', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4693', '2551', ' 2002 L                  ', '2211', '2211', '1', '1', '14', '114', 'M10 ', 'S', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4694', '2552', ' 2002 L/US               ', '2211', '2211', '1', '1', '14', '114', 'M10 ', 'S', '2', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4695', '2553', ' 2002 L/RL               ', '2211', '2211', '1', '1', '14', '114', 'M10 ', 'S', '2', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4696', '2556', ' 2002 LA                 ', '2221', '2221', '1', '1', '14', '114', 'M10 ', 'A', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4697', '2557', ' 2002 LA/RL              ', '2221', '2221', '1', '1', '14', '114', 'M10 ', 'A', '2', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4698', '2558', ' 2002 LA/USA             ', '2221', '2221', '1', '1', '14', '114', 'M10 ', 'A', '2', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4699', '2561', ' 2002 L SKD BELG.        ', '2211', '2211', '1', '1', '14', '114', 'M10 ', 'S', '2', 'L', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4700', '2565', ' 2002 LA CKD PORT.       ', '2221', '2221', '1', '1', '14', '114', 'M10 ', 'A', '2', 'L', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4701', '2567', ' 2002 L CKD URUG.        ', '2211', '2211', '1', '1', '14', '114', 'M10 ', 'S', '2', 'L', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4702', '2568', ' 2002 L CKD PORT.        ', '2211', '2211', '1', '1', '14', '114', 'M10 ', 'S', '2', 'L', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4703', '2573', ' 2002 CABRIO RL UEB      ', '2211', '2211', '1', '1', '14', '114', 'M10 ', 'S', '2', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4704', '2577', ' 2002 CABRIO MIT UEB     ', '2211', '2211', '1', '1', '14', '114', 'M10 ', 'S', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4705', '2579', '1602 L RL CKD SCHWED     ', '2011', '2011', '1', '1', '14', '114', 'M10 ', 'S', '2', 'R', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4706', '2581', ' 2002 TII                ', '2231', '2231', '1', '1', '14', '114', 'M10 ', 'S', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4707', '2582', ' 2002 TII RL             ', '2231', '2231', '1', '1', '14', '114', 'M10 ', 'S', '2', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4708', '2583', ' 2002 TII USA            ', '2231', '2231', '1', '1', '14', '114', 'M10 ', 'S', '2', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4709', '2611', ' 1600 TOURING            ', '2611', '2611', '1', '1', '14', '114', 'M10 ', 'S', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4710', '2631', ' 2000 TOURING            ', '2411', '2411', '1', '1', '14', '114', 'M10 ', 'S', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4711', '2632', ' 2000 TOURING RL         ', '2411', '2411', '1', '1', '14', '114', 'M10 ', 'S', '2', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4712', '2636', ' 2000 TOURING A          ', '2636', '2636', '1', '1', '14', '114', 'M10 ', 'A', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4713', '2651', ' 1800 TOURING            ', '2311', '2311', '1', '1', '14', '114', 'M10 ', 'S', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4714', '2661', ' 2000 TII TOURING        ', '2431', '2431', '1', '1', '14', '114', 'M10 ', 'S', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4715', '2711', '316', '2711', '2711', '1', '1', '3', 'E21 ', 'M10 ', 'S', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4716', '2712', '316 RL                   ', '2711', '2711', '1', '1', '3', 'E21 ', 'M10 ', 'S', '2', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4717', '2751', '316', '2711', '2711', '1', '1', '3', 'E21 ', 'M10 ', 'S', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4718', '2752', '316 RL                   ', '2711', '2711', '1', '1', '3', 'E21 ', 'M10 ', 'S', '2', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4719', '2756', '316/2 POR CKD            ', '2711', '2711', '1', '1', 'C3', 'E21 ', 'M10 ', 'S', '2', 'L', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4720', '2791', '316', '1701', '1701', '1', '1', '3', 'E21 ', 'M10 ', 'S', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4721', '2792', '316 RL                   ', '1701', '1701', '1', '1', '3', 'E21 ', 'M10 ', 'S', '2', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4722', '2795', '316/2 THA CKD            ', '2711', '2711', '1', '1', 'C3', 'E21 ', 'M10 ', 'S', '2', 'L', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4723', '2796', '316/2 POR CKD            ', '2711', '2711', '1', '1', 'C3', 'E21 ', 'M10 ', 'S', '2', 'L', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4724', '2811', '318', '2811', '2811', '1', '1', '3', 'E21 ', 'M10 ', 'S', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4725', '2821', '318 A                    ', '2821', '2821', '1', '1', '3', 'E21 ', 'M10 ', 'A', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4726', '2851', '318', '2811', '2811', '1', '1', '3', 'E21 ', 'M10 ', 'S', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4727', '2861', '318 A                    ', '2821', '2821', '1', '1', '3', 'E21 ', 'M10 ', 'A', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4728', '2891', '318', '2891', '2891', '1', '1', '3', 'E21 ', 'M10 ', 'S', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4729', '2893', '318 A                    ', '2893', '2893', '1', '1', '3', 'E21 ', 'M10 ', 'A', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4730', '2911', '320', '2911', '2911', '1', '1', '3', 'E21 ', 'M10 ', 'S', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4731', '2912', '320 RL                   ', '2911', '2911', '1', '1', '3', 'E21 ', 'M10 ', 'S', '2', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4732', '2917', '320/2 URU CKD            ', '2911', '2911', '1', '1', 'C3', 'E21 ', 'M20 ', 'S', '2', 'L', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4733', '2921', '320 A                    ', '2921', '2921', '1', '1', '3', 'E21 ', 'M10 ', 'A', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4734', '2922', '320 A RL                 ', '2921', '2921', '1', '1', '3', 'E21 ', 'M10 ', 'A', '2', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4735', '2931', '320I                     ', '2931', '2931', '1', '1', '3', 'E21 ', 'M10 ', 'S', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4736', '2932', '320I RL                  ', '2931', '2931', '1', '1', '3', 'E21 ', 'M10 ', 'S', '2', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4737', '2933', '320I US                  ', '2933', '2933', '1', '1', '3', 'E21 ', 'M10 ', 'S', '2', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4738', '2934', '320I US                  ', '2933', '2933', '1', '1', '3', 'E21 ', 'M10 ', 'S', '2', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4739', '2939', '320I JAP                 ', '2933', '2933', '1', '1', '3', 'E21 ', 'M10 ', 'S', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4740', '2943', '320I A US                ', '2943', '2943', '1', '1', '3', 'E21 ', 'M10 ', 'A', '2', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4741', '2944', '320I A US                ', '2943', '2943', '1', '1', '3', 'E21 ', 'M10 ', 'A', '2', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4742', '2949', '320I A JAP               ', '2943', '2943', '1', '1', '3', 'E21 ', 'M10 ', 'A', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4743', '2951', '320', '2951', '2951', '1', '1', '3', 'E21 ', 'M20 ', 'S', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4744', '2952', '320 RL                   ', '2951', '2951', '1', '1', '3', 'E21 ', 'M20 ', 'S', '2', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4745', '2957', '320/2 URU CKD            ', '2951', '2951', '1', '1', 'C3', 'E21 ', 'M20 ', 'S', '2', 'L', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4746', '2961', '320 A                    ', '2961', '2961', '1', '1', '3', 'E21 ', 'M20 ', 'A', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4747', '2962', '320 A RL                 ', '2961', '2961', '1', '1', '3', 'E21 ', 'M20 ', 'A', '2', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4748', '3A01', '335I A                   ', '3A01', '3A01', '1', '1', '3', 'F30 ', 'N55 ', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4749', '3A02', '335I RL A                ', '3A01', '3A01', '1', '1', '3', 'F30 ', 'N55 ', 'A', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4750', '3A03', '335I US A                ', '3A03', '3A03', '1', '1', '3', 'F30 ', 'N55 ', 'A', '4', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4751', '3A05', '335I A                   ', '3A01', '3A01', '1', '1', '3', 'F30 ', 'N55 ', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4752', '3A06', '335I RL A                ', '3A01', '3A01', '1', '1', '3', 'F30 ', 'N55 ', 'A', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4753', '3A07', '335I US A                ', '3A03', '3A03', '1', '1', '3', 'F30 ', 'N55 ', 'A', '4', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4754', '3A11', '316I                     ', '3A11', '3A11', '1', '1', '3', 'F30 ', 'N13 ', 'S', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4755', '3A12', '316I RL                  ', '3A11', '3A11', '1', '1', '3', 'F30 ', 'N13 ', 'S', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4756', '3A14', '316I                     ', '3A11', '3A11', '1', '1', '3C', 'F30 ', 'N13 ', 'S', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4757', '3A16', '316I RL                  ', '3A11', '3A11', '1', '1', '3', 'F30 ', 'N13 ', 'S', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4758', '3A21', '316I A                   ', '3A21', '3A21', '1', '1', '3', 'F30 ', 'N13 ', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4759', '3A22', '316I RL A                ', '3A21', '3A21', '1', '1', '3', 'F30 ', 'N13 ', 'A', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4760', '3A24', '316I A                   ', '3A21', '3A21', '1', '1', '3C', 'F30 ', 'N13 ', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4761', '3A25', '316I A                   ', '3A21', '3A21', '1', '1', '3', 'F30 ', 'N13 ', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4762', '3A26', '316I RL A                ', '3A21', '3A21', '1', '1', '3', 'F30 ', 'N13 ', 'A', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4763', '3A51', '328I                     ', '3A51', '3A51', '1', '1', '3', 'F30 ', 'N20 ', 'S', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4764', '3A52', '328I RL                  ', '3A51', '3A51', '1', '1', '3', 'F30 ', 'N20 ', 'S', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4765', '3A53', '328I US                  ', '3A53', '3A53', '1', '1', '3', 'F30 ', 'N20 ', 'S', '4', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4766', '3A56', '328I RL ZA               ', '3A51', '3A51', '1', '1', 'Z3', 'F30 ', 'N20 ', 'S', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4767', '3A57', '328I US ZA               ', '3A53', '3A53', '1', '1', 'Z3', 'F30 ', 'N20 ', 'S', '4', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4768', '3A58', '328I MY SKD RL           ', '3A51', '3A51', '1', '1', 'C3', 'F30 ', 'N20 ', 'S', '4', 'R', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4769', '3A59', '328I RU SKD              ', '3A51', '3A51', '1', '1', 'R3', 'F30 ', 'N20 ', 'S', '4', 'L', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4770', '3A61', '328I A                   ', '3A61', '3A61', '1', '1', '3', 'F30 ', 'N20 ', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4771', '3A62', '328I RL A                ', '3A61', '3A61', '1', '1', '3', 'F30 ', 'N20 ', 'A', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4772', '3A63', '328I US A                ', '3A63', '3A63', '1', '1', '3', 'F30 ', 'N20 ', 'A', '4', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4773', '3A64', '328I A                   ', '3A61', '3A61', '1', '1', '3U', 'F30 ', 'N20 ', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4774', '3A65', '328I ZA A                ', '3A61', '3A61', '1', '1', 'Z3', 'F30 ', 'N20 ', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4775', '3A66', '328I RL ZA A             ', '3A61', '3A61', '1', '1', 'Z3', 'F30 ', 'N20 ', 'A', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4776', '3A67', '328I US ZA A             ', '3A63', '3A63', '1', '1', 'Z3', 'F30 ', 'N20 ', 'A', '4', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4777', '3A68', '328I MY SKD RL A         ', '3A61', '3A61', '1', '1', 'C3', 'F30 ', 'N20 ', 'A', '4', 'R', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4778', '3A69', '328I RU SKD A            ', '3A61', '3A61', '1', '1', 'R3', 'F30 ', 'N20 ', 'A', '4', 'L', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4779', '3A91', '335I                     ', '3A91', '3A91', '1', '1', '3', 'F30 ', 'N55 ', 'S', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4780', '3A92', '335I RL                  ', '3A91', '3A91', '1', '1', '3', 'F30 ', 'N55 ', 'S', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4781', '3A93', '335I US                  ', '3A93', '3A93', '1', '1', '3', 'F30 ', 'N55 ', 'S', '4', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4782', '3A96', '335I RL                  ', '3A91', '3A91', '1', '1', '3', 'F30 ', 'N55 ', 'S', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4783', '3A97', '335I US                  ', '3A93', '3A93', '1', '1', '3', 'F30 ', 'N55 ', 'S', '4', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4784', '3B01', '335I XDRIVE A            ', '3B01', '3B01', '1', '1', '3X', 'F30 ', 'N55 ', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4785', '3B03', '335I XDRIVE US A         ', '3B03', '3B03', '1', '1', '3X', 'F30 ', 'N55 ', 'A', '4', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4786', '3B07', '335I XDRIVE US A         ', '3B03', '3B03', '1', '1', '3X', 'F30 ', 'N55 ', 'A', '4', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4787', '3B11', '320I                     ', '3B11', '3B11', '1', '1', '3', 'F30 ', 'N20 ', 'S', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4788', '3B12', '320I RL                  ', '3B11', '3B11', '1', '1', '3', 'F30 ', 'N20 ', 'S', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4789', '3B13', '320I US                  ', '3B13', '3B13', '1', '1', '3', 'F30 ', 'N20 ', 'S', '4', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4790', '3B16', '320I RL                  ', '3B11', '3B11', '1', '1', '3', 'F30 ', 'N20 ', 'S', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4791', '3B17', '320I US                  ', '3B13', '3B13', '1', '1', '3', 'F30 ', 'N20 ', 'S', '4', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4792', '3B19', '320I RU SKD              ', '3B11', '3B11', '1', '1', 'R3', 'F30 ', 'N20 ', 'S', '4', 'L', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4793', '3B21', '320I A                   ', '3B21', '3B21', '1', '1', '3', 'F30 ', 'N20 ', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4794', '3B22', '320I RL A                ', '3B21', '3B21', '1', '1', '3', 'F30 ', 'N20 ', 'A', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4795', '3B23', '320I US A                ', '3B23', '3B23', '1', '1', '3', 'F30 ', 'N20 ', 'A', '4', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4796', '3B24', '320I A                   ', '3B21', '3B21', '1', '1', '3C', 'F30 ', 'N20 ', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4797', '3B25', '320I A                   ', '3B21', '3B21', '1', '1', '3', 'F30 ', 'N20 ', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4798', '3B26', '320I RL A                ', '3B21', '3B21', '1', '1', '3', 'F30 ', 'N20 ', 'A', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4799', '3B27', '320I US A                ', '3B23', '3B23', '1', '1', '3', 'F30 ', 'N20 ', 'A', '4', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4800', '3B28', '320I MY SKD RL A         ', '3B21', '3B21', '1', '1', 'C3', 'F30 ', 'N20 ', 'A', '4', 'R', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4801', '3B29', '320I RU SKD A            ', '3B21', '3B21', '1', '1', 'R3', 'F30 ', 'N20 ', 'A', '4', 'L', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4802', '3B33', '328I XDRIVE US           ', '3B33', '3B33', '1', '1', '3X', 'F30 ', 'N20 ', 'S', '4', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4803', '3B43', '328I XDRIVE US A         ', '3B43', '3B43', '1', '1', '3X', 'F30 ', 'N20 ', 'A', '4', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4804', '3B47', '328I XDRIVE US A         ', '3B43', '3B43', '1', '1', '3X', 'F30 ', 'N20 ', 'A', '4', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4805', '3B51', '328I XDRIVE              ', '3B51', '3B51', '1', '1', '3X', 'F30 ', 'N20 ', 'S', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4806', '3B61', '328I XDRIVE A            ', '3B61', '3B61', '1', '1', '3X', 'F30 ', 'N20 ', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4807', '3B63', '328I XDRIVE US A         ', '3B63', '3B63', '1', '1', '3X', 'F30 ', 'N26 ', 'A', '4', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4808', '3B67', '328I XDRIVE US A         ', '3B63', '3B63', '1', '1', '3X', 'F30 ', 'N26 ', 'A', '4', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4809', '3B69', '328I XDRIVE RU SKD A     ', '3B61', '3B61', '1', '1', 'R3', 'F30 ', 'N20 ', 'A', '4', 'L', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4810', '3B91', '335I XDRIVE              ', '3B91', '3B91', '1', '1', '3X', 'F30 ', 'N55 ', 'S', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4811', '3B93', '335I XDRIVE US           ', '3B93', '3B93', '1', '1', '3X', 'F30 ', 'N55 ', 'S', '4', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4812', '3B97', '335I XDRIVE US           ', '3B93', '3B93', '1', '1', '3X', 'F30 ', 'N55 ', 'S', '4', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4813', '3C21', '328I A                   ', '3C21', '3C21', '1', '1', 'K3', 'F30 ', 'N26 ', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4814', '3C23', '328I US A                ', '3C23', '3C23', '1', '1', '3', 'F30 ', 'N26 ', 'A', '4', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4815', '3C25', '328I ZA A                ', '3C21', '3C21', '1', '1', 'K3', 'F30 ', 'N26 ', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4816', '3C27', '328I US ZA A             ', '3C23', '3C23', '1', '1', 'Z3', 'F30 ', 'N26 ', 'A', '4', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4817', '3C31', '320I XDRIVE              ', '3C31', '3C31', '1', '1', '3X', 'F30 ', 'N20 ', 'S', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4818', '3C32', '320I XDRIVE RL           ', '3C31', '3C31', '1', '1', '3X', 'F30 ', 'N20 ', 'S', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4819', '3C33', '320I XDRIVE US           ', '3C33', '3C33', '1', '1', '3X', 'F30 ', 'N20 ', 'S', '4', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4820', '3C41', '320I XDRIVE A            ', '3C41', '3C41', '1', '1', '3X', 'F30 ', 'N20 ', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4821', '3C42', '320I XDRIVE RL A         ', '3C41', '3C41', '1', '1', '3X', 'F30 ', 'N20 ', 'A', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4822', '3C43', '320I XDRIVE US A         ', '3C43', '3C43', '1', '1', '3X', 'F30 ', 'N20 ', 'A', '4', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4823', '3C46', '320I XDRIVE RL A         ', '3C41', '3C41', '1', '1', '3X', 'F30 ', 'N20 ', 'A', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4824', '3C47', '320I XDRIVE US A         ', '3C43', '3C43', '1', '1', '3X', 'F30 ', 'N20 ', 'A', '4', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4825', '3C91', 'M3                       ', '    ', '    ', '1', '1', 'M3', 'F80 ', 'S55 ', 'S', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4826', '3C92', 'M3                       ', '    ', '    ', '1', '1', 'M3', 'F80 ', 'S55 ', 'S', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4827', '3C93', 'M3                       ', '    ', '    ', '1', '1', 'M3', 'F80 ', 'S55 ', 'S', '4', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4828', '3D01', '316D A                   ', '3D01', '3D01', '1', '1', '3', 'F30 ', 'N47T', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4829', '3D02', '316D RL A                ', '3D01', '3D01', '1', '1', '3', 'F30 ', 'N47T', 'A', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4830', '3D11', '318D                     ', '3D11', '3D11', '1', '1', '3', 'F30 ', 'N47T', 'S', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4831', '3D12', '318D RL                  ', '3D11', '3D11', '1', '1', '3', 'F30 ', 'N47T', 'S', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4832', '3D16', '318D RL                  ', '3D11', '3D11', '1', '1', '3', 'F30 ', 'N47T', 'S', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4833', '3D21', '318D A                   ', '3D21', '3D21', '1', '1', '3', 'F30 ', 'N47T', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4834', '3D22', '318D RL A                ', '3D21', '3D21', '1', '1', '3', 'F30 ', 'N47T', 'A', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4835', '3D25', '318D LL A                ', '3D21', '3D21', '1', '1', '3', 'F30 ', 'N47T', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4836', '3D26', '318D RL A                ', '3D21', '3D21', '1', '1', '3', 'F30 ', 'N47T', 'A', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4837', '3D31', '320D                     ', '3D31', '3D31', '1', '1', '3', 'F30 ', 'N47T', 'S', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4838', '3D32', '320D RL                  ', '3D31', '3D31', '1', '1', '3', 'F30 ', 'N47T', 'S', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4839', '3D36', '320D RL                  ', '3D31', '3D31', '1', '1', '3', 'F30 ', 'N47T', 'S', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4840', '3D41', '320D A                   ', '3D41', '3D41', '1', '1', '3', 'F30 ', 'N47T', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4841', '3D42', '320D RL A                ', '3D41', '3D41', '1', '1', '3', 'F30 ', 'N47T', 'A', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4842', '3D43', '328D A                   ', '3D43', '3D43', '1', '1', '3', 'F30 ', 'N47T', 'A', '4', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4843', '3D45', '320D A                   ', '3D41', '3D41', '1', '1', '3', 'F30 ', 'N47T', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4844', '3D46', '320D RL A                ', '3D41', '3D41', '1', '1', '3', 'F30 ', 'N47T', 'A', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4845', '3D48', '320D MY SKD RL A         ', '3D41', '3D41', '1', '1', 'C3', 'F30 ', 'N47T', 'A', '4', 'R', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4846', '3D51', '320D XDRIVE              ', '3D51', '3D51', '1', '1', '3X', 'F30 ', 'N47T', 'S', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4847', '3D61', '320D XDRIVE A            ', '3D61', '3D61', '1', '1', '3X', 'F30 ', 'N47T', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4848', '3D63', '328D XDRIVE A            ', '3D63', '3D63', '1', '1', '3X', 'F30 ', 'N47T', 'A', '4', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4849', '3D69', '320D XDRIVE RU SKD A     ', '3D61', '3D61', '1', '1', 'R3', 'F30 ', 'N47T', 'A', '4', 'L', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4850', '3D71', '325D                     ', '3D71', '3D71', '1', '1', '3', 'F30 ', 'N47T', 'S', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4851', '3D72', '325D RL                  ', '3D71', '3D71', '1', '1', '3', 'F30 ', 'N47T', 'S', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4852', '3D81', '325D A                   ', '3D81', '3D81', '1', '1', '3', 'F30 ', 'N47T', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4853', '3D82', '325D RL A                ', '3D81', '3D81', '1', '1', '3', 'F30 ', 'N47T', 'A', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4854', '3D91', '316D                     ', '3D91', '3D91', '1', '1', '3', 'F30 ', 'N47T', 'S', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4855', '3D92', '316D RL                  ', '3D91', '3D91', '1', '1', '3', 'F30 ', 'N47T', 'S', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4856', '3.00E+11', '320D EFFDYN EDITION      ', '3.00E+11', '3.00E+11', '1', '1', '3F', 'F30 ', 'N47T', 'S', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4857', '3.00E+12', '320D EFFDYN EDITION      ', '3.00E+11', '3.00E+11', '1', '1', '3F', 'F30 ', 'N47T', 'S', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4858', '3.00E+16', '320D EFFDYN EDITION      ', '3.00E+11', '3.00E+11', '1', '1', '3F', 'F30 ', 'N47T', 'S', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4859', '3.00E+21', '320D EFFDYN EDITIONA     ', '3.00E+21', '3.00E+21', '1', '1', '3F', 'F30 ', 'N47T', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4860', '3.00E+22', '320D EFFDYN EDITIONA     ', '3.00E+21', '3.00E+21', '1', '1', '3F', 'F30 ', 'N47T', 'A', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4861', '3.00E+25', '320D EFFDYN EDITIONA     ', '3.00E+21', '3.00E+21', '1', '1', '3F', 'F30 ', 'N47T', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4862', '3.00E+26', '320D EFFDYN EDITIONA     ', '3.00E+21', '3.00E+21', '1', '1', '3F', 'F30 ', 'N47T', 'A', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4863', '3.00E+41', '330D XDRIVE A            ', '3.00E+41', '3.00E+41', '1', '1', '3X', 'F30 ', 'N57T', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4864', '3.00E+42', '330D XDRIVE RL A         ', '3.00E+41', '3.00E+41', '1', '1', '3X', 'F30 ', 'N57T', 'A', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4865', '3.00E+61', '330D A                   ', '3.00E+61', '3.00E+61', '1', '1', '3', 'F30 ', 'N57T', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4866', '3.00E+62', '330D RL A                ', '3.00E+61', '3.00E+61', '1', '1', '3', 'F30 ', 'N57T', 'A', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4867', '3.00E+66', '330D RL A                ', '3.00E+61', '3.00E+61', '1', '1', '3', 'F30 ', 'N57T', 'A', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4868', '3.00E+81', '335D A                   ', '    ', '    ', '1', '1', '3', 'F30 ', 'N57Z', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4869', '3F01', '335IH A                  ', '3F01', '3F01', '1', '1', '3', 'F30 ', 'N55 ', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4870', '3F02', '335IH RL A               ', '3F01', '3F01', '1', '1', '3', 'F30 ', 'N55 ', 'A', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4871', '3F03', '335IH US A               ', '3F03', '3F03', '1', '1', '3', 'F30 ', 'N55 ', 'A', '4', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4872', '3F17', '320D TH SKD RL           ', '3D31', '3D31', '1', '1', 'T3', 'F30 ', 'N47T', 'S', '4', 'R', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4873', '3F24', '316I TH SKD RL A         ', '3A21', '3A21', '1', '1', 'T3', 'F30 ', 'N13 ', 'A', '4', 'R', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4874', '3F25', '320I TH SKD RL A         ', '3B21', '3B21', '1', '1', 'T3', 'F30 ', 'N20 ', 'A', '4', 'R', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4875', '3F27', '320D TH SKD RL A         ', '3D41', '3D41', '1', '1', 'T3', 'F30 ', 'N47T', 'A', '4', 'R', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4876', '3F29', '320I RL A                ', '3B21', '3B21', '1', '1', 'C3', 'F30 ', 'N20 ', 'A', '4', 'R', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4877', '3F44', '320I IN SKD RL A         ', '3B21', '3B21', '1', '1', 'I3', 'F30 ', 'N20 ', 'A', '4', 'R', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4878', '3F45', '328I IN SKD RL A         ', '3A61', '3A61', '1', '1', 'I3', 'F30 ', 'N20 ', 'A', '4', 'R', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4879', '3F47', '320D IN SKD RL A         ', '3D41', '3D41', '1', '1', 'I3', 'F30 ', 'N47T', 'A', '4', 'R', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4880', '3F49', '328I RL A                ', '3A61', '3A61', '1', '1', 'T3', 'F30 ', 'N20 ', 'A', '4', 'R', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4881', '3F55', '328I EG SKD              ', '3A51', '3A51', '1', '1', 'Y3', 'F30 ', 'N20 ', 'S', '4', 'L', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4882', '3F64', '320I EG SKD A            ', '3B21', '3B21', '1', '1', 'Y3', 'F30 ', 'N20 ', 'A', '4', 'L', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4883', '3F65', '328I EG SKD A            ', '3A61', '3A61', '1', '1', 'Y3', 'F30 ', 'N20 ', 'A', '4', 'L', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4884', '3F66', '335I EG SKD A            ', '3A01', '3A01', '1', '1', 'Y3', 'F30 ', 'N55 ', 'A', '4', 'L', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4885', '3F69', '328I RL A                ', '3A61', '3A61', '1', '1', 'C3', 'F30 ', 'N20 ', 'A', '4', 'R', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4886', '3G01', '335I A                   ', '3G01', '3G01', '1', '1', '3', 'F31 ', 'N55 ', 'A', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4887', '3G02', '335I RL A                ', '3G01', '3G01', '1', '1', '3', 'F31 ', 'N55 ', 'A', '5', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4888', '3G11', '316I                     ', '3G11', '3G11', '1', '1', '3', 'F31 ', 'N13 ', 'S', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4889', '3G12', '316I RL                  ', '3G11', '3G11', '1', '1', '3', 'F31 ', 'N13 ', 'S', '5', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4890', '3G21', '316I A                   ', '3G21', '3G21', '1', '1', '3', 'F31 ', 'N13 ', 'A', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4891', '3G22', '316I RL A                ', '3G21', '3G21', '1', '1', '3', 'F31 ', 'N13 ', 'A', '5', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4892', '3G51', '328I                     ', '3G51', '3G51', '1', '1', '3', 'F31 ', 'N20 ', 'S', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4893', '3G52', '328I RL                  ', '3G51', '3G51', '1', '1', '3', 'F31 ', 'N20 ', 'S', '5', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4894', '3G53', '328I US                  ', '3G53', '3G53', '1', '1', '3', 'F31 ', 'N20 ', 'S', '5', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4895', '3G61', '328I A                   ', '3G61', '3G61', '1', '1', '3', 'F31 ', 'N20 ', 'A', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4896', '3G62', '328I RL A                ', '3G61', '3G61', '1', '1', '3', 'F31 ', 'N20 ', 'A', '5', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4897', '3G63', '328I US A                ', '3G63', '3G63', '1', '1', '3', 'F31 ', 'N20 ', 'A', '5', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4898', '3G71', '320I                     ', '3G71', '3G71', '1', '1', '3', 'F31 ', 'N20 ', 'S', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4899', '3G72', '320I RL                  ', '3G71', '3G71', '1', '1', '3', 'F31 ', 'N20 ', 'S', '5', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4900', '3G81', '320I A                   ', '3G81', '3G81', '1', '1', '3', 'F31 ', 'N20 ', 'A', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4901', '3G82', '320I RL A                ', '3G81', '3G81', '1', '1', '3', 'F31 ', 'N20 ', 'A', '5', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4902', '3G83', '328I XDRIVE US A         ', '3G83', '3G83', '1', '1', '3', 'F31 ', 'N20 ', 'A', '5', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4903', '3G91', '335I                     ', '3G91', '3G91', '1', '1', '3', 'F31 ', 'N55 ', 'S', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4904', '3G92', '335I RL                  ', '3G91', '3G91', '1', '1', '3', 'F31 ', 'N55 ', 'S', '5', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4905', '3H01', '335I XDRIVE A            ', '3H01', '3H01', '1', '1', '3G', 'F31 ', 'N55 ', 'A', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4906', '3H11', '320I XDRIVE              ', '3H11', '3H11', '1', '1', '3G', 'F31 ', 'N20 ', 'S', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4907', '3H12', '320I XDRIVE RL           ', '3H11', '3H11', '1', '1', '3G', 'F31 ', 'N20 ', 'S', '5', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4908', '3H21', '320I XDRIVE A            ', '3H21', '3H21', '1', '1', '3G', 'F31 ', 'N20 ', 'A', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4909', '3H22', '320I XDRIVE RL A         ', '3H21', '3H21', '1', '1', '3G', 'F31 ', 'N20 ', 'A', '5', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4910', '3H51', '328I XDRIVE              ', '3H51', '3H51', '1', '1', '3G', 'F31 ', 'N20 ', 'S', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4911', '3H61', '328I XDRIVE A            ', '3H61', '3H61', '1', '1', '3G', 'F31 ', 'N20 ', 'A', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4912', '3J01', '320I EFFDYN EDITIONA     ', '3J01', '3J01', '1', '1', '3F', 'F30 ', 'N13 ', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4913', '3J02', '320I EFFDYN EDITIONA     ', '3J01', '3J01', '1', '1', '3F', 'F30 ', 'N13 ', 'A', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4914', '3J31', '318D XDRIVE              ', '3J31', '3J31', '1', '1', '3X', 'F30 ', 'N47T', 'S', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4915', '3J81', '335D XDRIVE A            ', '3J81', '3J81', '1', '1', '3X', 'F30 ', 'N57Z', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4916', '3J82', '335D XDRIVE A            ', '3J81', '3J81', '1', '1', '3X', 'F30 ', 'N57Z', 'A', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4917', '3J91', '320I EFFDYN EDITION      ', '3J91', '3J91', '1', '1', '3F', 'F30 ', 'N13 ', 'S', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4918', '3J92', '320I EFFDYN EDITION      ', '3J91', '3J91', '1', '1', '3F', 'F30 ', 'N13 ', 'S', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4919', '3K01', '316D A                   ', '3K01', '3K01', '1', '1', '3', 'F31 ', 'N47T', 'A', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4920', '3K02', '316D RL A                ', '3K01', '3K01', '1', '1', '3', 'F31 ', 'N47T', 'A', '5', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4921', '3K11', '318D                     ', '3K11', '3K11', '1', '1', '3', 'F31 ', 'N47T', 'S', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4922', '3K12', '318D RL                  ', '3K11', '3K11', '1', '1', '3', 'F31 ', 'N47T', 'S', '5', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4923', '3K21', '318D A                   ', '3K21', '3K21', '1', '1', '3', 'F31 ', 'N47T', 'A', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4924', '3K22', '318D RL A                ', '3K21', '3K21', '1', '1', '3', 'F31 ', 'N47T', 'A', '5', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4925', '3K31', '320D                     ', '3K31', '3K31', '1', '1', '3', 'F31 ', 'N47T', 'S', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4926', '3K32', '320D RL                  ', '3K31', '3K31', '1', '1', '3', 'F31 ', 'N47T', 'S', '5', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4927', '3K41', '320D A                   ', '3K41', '3K41', '1', '1', '3', 'F31 ', 'N47T', 'A', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4928', '3K42', '320D RL A                ', '3K41', '3K41', '1', '1', '3', 'F31 ', 'N47T', 'A', '5', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4929', '3K43', '328D A                   ', '3K43', '3K43', '1', '1', '3', 'F31 ', 'N47T', 'A', '5', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4930', '3K51', '320D XDRIVE              ', '3K51', '3K51', '1', '1', '3G', 'F31 ', 'N47T', 'S', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4931', '3K52', '320D XDRIVE RL           ', '3K51', '3K51', '1', '1', '3G', 'F31 ', 'N47T', 'S', '5', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4932', '3K61', '320D XDRIVE A            ', '3K61', '3K61', '1', '1', '3G', 'F31 ', 'N47T', 'A', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4933', '3K62', '320D XDRIVE RL A         ', '3K61', '3K61', '1', '1', '3G', 'F31 ', 'N47T', 'A', '5', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4934', '3K63', '328D XDRIVE A            ', '3K63', '3K63', '1', '1', '3G', 'F31 ', 'N47T', 'A', '5', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4935', '3K71', '325D                     ', '3K71', '3K71', '1', '1', '3', 'F31 ', 'N47T', 'S', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4936', '3K72', '325D RL                  ', '3K71', '3K71', '1', '1', '3', 'F31 ', 'N47T', 'S', '5', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4937', '3K81', '325D A                   ', '3K81', '3K81', '1', '1', '3', 'F31 ', 'N47T', 'A', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4938', '3K82', '325D RL A                ', '3K81', '3K81', '1', '1', '3', 'F31 ', 'N47T', 'A', '5', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4939', '3K91', '316D                     ', '3K91', '3K91', '1', '1', '3', 'F31 ', 'N47T', 'S', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4940', '3K92', '316D RL                  ', '3K91', '3K91', '1', '1', '3', 'F31 ', 'N47T', 'S', '5', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4941', '3L11', '320D DYNEFF EDITION      ', '3L11', '3L11', '1', '1', '3H', 'F31 ', 'N47T', 'S', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4942', '3L12', '320D EFFDYN EDITION      ', '3L11', '3L11', '1', '1', '3H', 'F31 ', 'N47T', 'S', '5', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4943', '3L21', '320D DYNEFF EDITIONA     ', '3L21', '3L21', '1', '1', '3H', 'F31 ', 'N47T', 'A', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4944', '3L22', '320D EFFDYN EDITIONA     ', '3L21', '3L21', '1', '1', '3H', 'F31 ', 'N47T', 'A', '5', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4945', '3L41', '330D XDRIVE A            ', '3L41', '3L41', '1', '1', '3G', 'F31 ', 'N57T', 'A', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4946', '3L42', '330D XDRIVE A            ', '3L41', '3L41', '1', '1', '3G', 'F31 ', 'N57T', 'A', '5', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4947', '3L61', '330D A                   ', '3L61', '3L61', '1', '1', '3', 'F31 ', 'N57T', 'A', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4948', '3L62', '330D RL A                ', '3L61', '3L61', '1', '1', '3', 'F31 ', 'N57T', 'A', '5', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4949', '3L81', '335D A                   ', '    ', '    ', '1', '1', '3', 'F31 ', 'N57Z', 'A', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4950', '3M21', '320LI                    ', '3M21', '3M21', '1', '1', '3C', 'F35 ', 'N20 ', 'S', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4951', '3M41', '328LI                    ', '3M41', '3M41', '1', '1', '3C', 'F35 ', 'N20 ', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4952', '3M61', '335LI                    ', '3M61', '3M61', '1', '1', '3C', 'F35 ', 'N55 ', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4953', '3N03', '428I XDRIVE A            ', '3N03', '3N03', '1', '1', '3A', 'F32 ', 'N26 ', 'A', '2', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4954', '3N31', '428I                     ', '3N31', '3N31', '1', '1', '4', 'F32 ', 'N20 ', 'S', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4955', '3N32', '428I                     ', '3N31', '3N31', '1', '1', '4', 'F32 ', 'N20 ', 'S', '2', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4956', '3N33', '428I                     ', '3N33', '3N33', '1', '1', '4', 'F32 ', 'N20 ', 'S', '2', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4957', '3N41', '428I A                   ', '3N41', '3N41', '1', '1', '4', 'F32 ', 'N20 ', 'A', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4958', '3N42', '428I A                   ', '3N41', '3N41', '1', '1', '4', 'F32 ', 'N20 ', 'A', '2', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4959', '3N43', '428I A                   ', '3N43', '3N43', '1', '1', '4', 'F32 ', 'N20 ', 'A', '2', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4960', '3N51', '428I XDRIVE              ', '3N51', '3N51', '1', '1', '3A', 'F32 ', 'N20 ', 'S', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4961', '3N61', '428I XDRIVE A            ', '3N61', '3N61', '1', '1', '3A', 'F32 ', 'N20 ', 'A', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4962', '3N63', '428I XDRIVE A            ', '3N63', '3N63', '1', '1', '3A', 'F32 ', 'N20 ', 'A', '2', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4963', '3N81', '428I A                   ', '3N81', '3N81', '1', '1', '4', 'F32 ', 'N26 ', 'A', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4964', '3N83', '428I A                   ', '3N83', '3N83', '1', '1', '4', 'F32 ', 'N26 ', 'A', '2', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4965', '3P11', '420D                     ', '3P11', '3P11', '1', '1', '4', 'F32 ', 'N47T', 'S', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4966', '3P12', '420D                     ', '3P11', '3P11', '1', '1', '4', 'F32 ', 'N47T', 'S', '2', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4967', '3P21', '420D A                   ', '3P21', '3P21', '1', '1', '4', 'F32 ', 'N47T', 'A', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4968', '3P22', '420D A                   ', '3P21', '3P21', '1', '1', '4', 'F32 ', 'N47T', 'A', '2', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4969', '3P31', '420D XDRIVE              ', '3P31', '3P31', '1', '1', '4X', 'F32 ', 'N47T', 'S', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4970', '3P41', '420D XDRIVE A            ', '3P41', '3P41', '1', '1', '4X', 'F32 ', 'N47T', 'A', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4971', '3P61', '425D A                   ', '    ', '    ', '1', '1', '4', 'F32 ', 'N47T', 'A', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4972', '3P81', '430D A                   ', '3P81', '3P81', '1', '1', '4', 'F32 ', 'N57T', 'A', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4973', '3R11', '435I                     ', '3R11', '3R11', '1', '1', '4', 'F32 ', 'N55 ', 'S', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4974', '3R12', '435I                     ', '3R11', '3R11', '1', '1', '4', 'F32 ', 'N55 ', 'S', '2', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4975', '3R13', '435I                     ', '3R13', '3R13', '1', '1', '4', 'F32 ', 'N55 ', 'S', '2', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4976', '3R21', '435I A                   ', '3R21', '3R21', '1', '1', '4', 'F32 ', 'N55 ', 'A', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4977', '3R22', '435I A                   ', '3R21', '3R21', '1', '1', '4', 'F32 ', 'N55 ', 'A', '2', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4978', '3R23', '435I A                   ', '3R23', '3R23', '1', '1', '4', 'F32 ', 'N55 ', 'A', '2', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4979', '3R51', '435I XDRIVE              ', '3R51', '3R51', '1', '1', '3A', 'F32 ', 'N55 ', 'S', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4980', '3R53', '435I XDRIVE              ', '3R53', '3R53', '1', '1', '3A', 'F32 ', 'N55 ', 'S', '2', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4981', '3R61', '435I XDRIVE A            ', '3R61', '3R61', '1', '1', '3A', 'F32 ', 'N55 ', 'A', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4982', '3R63', '435I XDRIVE A            ', '3R63', '3R63', '1', '1', '3A', 'F32 ', 'N55 ', 'A', '2', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4983', '3S01', '435D XDRIVE A            ', '3S01', '3S01', '1', '1', '4X', 'F32 ', 'N57Z', 'A', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4984', '3S41', '430D XDRIVE A            ', '    ', '    ', '1', '1', '3A', 'F32 ', 'N57T', 'A', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4985', '3W21', '320LI A                  ', '3W21', '3W21', '1', '1', '3C', 'F35 ', 'N20 ', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4986', '3W52', '320D XDRIVE RL           ', '3D51', '3D51', '1', '1', '3X', 'F30 ', 'N47T', 'S', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4987', '3W62', '320D XDRIVE RL A         ', '3D61', '3D61', '1', '1', '3X', 'F30 ', 'N47T', 'A', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4988', '3X01', '335I XDRIVE A            ', '3X01', '3X01', '1', '1', '3D', 'F34 ', 'N55 ', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4989', '3X03', '335I XDRIVE US A         ', '3X03', '3X03', '1', '1', '3D', 'F34 ', 'N55 ', 'A', '4', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4990', '3X11', '320I                     ', '3X11', '3X11', '1', '1', '3S', 'F34 ', 'N20 ', 'S', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4991', '3X21', '320I A                   ', '3X21', '3X21', '1', '1', '3S', 'F34 ', 'N20 ', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4992', '3X22', '320I RL A                ', '3X21', '3X21', '1', '1', '3S', 'F34 ', 'N20 ', 'A', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4993', '3X31', '328I                     ', '3X31', '3X31', '1', '1', '3S', 'F34 ', 'N20 ', 'S', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4994', '3X33', '328I US                  ', '3X33', '3X33', '1', '1', '3S', 'F34 ', 'N20 ', 'S', '4', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4995', '3X41', '328I A                   ', '3X41', '3X41', '1', '1', '3S', 'F34 ', 'N20 ', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4996', '3X42', '328I RL A                ', '3X41', '3X41', '1', '1', '3S', 'F34 ', 'N20 ', 'A', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4997', '3X43', '328I US A                ', '3X43', '3X43', '1', '1', '3S', 'F34 ', 'N20 ', 'A', '4', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4998', '3X61', '328I XDRIVE A            ', '3X61', '3X61', '1', '1', '3D', 'F34 ', 'N20 ', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('4999', '3X63', '328I XDRIVE US A         ', '3X63', '3X63', '1', '1', '3D', 'F34 ', 'N20 ', 'A', '4', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5000', '3X71', '335I                     ', '3X71', '3X71', '1', '1', '3S', 'F34 ', 'N55 ', 'S', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5001', '3X73', '335I US                  ', '3X73', '3X73', '1', '1', '3S', 'F34 ', 'N55 ', 'S', '4', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5002', '3X81', '335I A                   ', '3X81', '3X81', '1', '1', '3S', 'F34 ', 'N55 ', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5003', '3X82', '335I RL A                ', '3X81', '3X81', '1', '1', '3S', 'F34 ', 'N55 ', 'A', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5004', '3X83', '335I US A                ', '3X83', '3X83', '1', '1', '3S', 'F34 ', 'N55 ', 'A', '4', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5005', '3Y11', '318D                     ', '3Y11', '3Y11', '1', '1', '3S', 'F34 ', 'N47T', 'S', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5006', '3Y12', '318D                     ', '3Y11', '3Y11', '1', '1', '3S', 'F34 ', 'N47T', 'S', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5007', '3Y21', '318D A                   ', '3Y21', '3Y21', '1', '1', '3S', 'F34 ', 'N47T', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5008', '3Y31', '320D                     ', '3Y31', '3Y31', '1', '1', '3S', 'F34 ', 'N47T', 'S', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5009', '3Y32', '320D                     ', '3Y31', '3Y31', '1', '1', '3S', 'F34 ', 'N47T', 'S', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5010', '3Y41', '320D A                   ', '3Y41', '3Y41', '1', '1', '3S', 'F34 ', 'N47T', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5011', '3Y42', '320D A                   ', '3Y41', '3Y41', '1', '1', '3S', 'F34 ', 'N47T', 'A', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5012', '3Y51', '320D XDRIVE              ', '3Y51', '3Y51', '1', '1', '3D', 'F34 ', 'N47T', 'S', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5013', '3Y61', '320D XDRIVE A            ', '3Y61', '3Y61', '1', '1', '3D', 'F34 ', 'N47T', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5014', '3Y71', '325D                     ', '3Y71', '3Y71', '1', '1', '3S', 'F34 ', 'N47T', 'S', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5015', '3Y81', '325D A                   ', '3Y81', '3Y81', '1', '1', '3S', 'F34 ', 'N47T', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5016', '3Z71', '320I XDRIVE              ', '3Z71', '3Z71', '1', '1', '3D', 'F34 ', 'N20 ', 'S', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5017', '3Z81', '320I XDRIVE A            ', '3Z81', '3Z81', '1', '1', '3D', 'F34 ', 'N20 ', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5018', '3071', '323I                     ', '3071', '3071', '1', '1', '3', 'E21 ', 'M20 ', 'S', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5019', '3072', '323I RL                  ', '3071', '3071', '1', '1', '3', 'E21 ', 'M20 ', 'S', '2', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5020', '3081', '323I A                   ', '1841', '1841', '1', '1', '3', 'E21 ', 'M20 ', 'A', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5021', '3082', '323I A RL                ', '1841', '1841', '1', '1', '3', 'E21 ', 'M20 ', 'A', '2', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5022', '3151', '320', '2911', '2911', '1', '1', '3', 'E21 ', 'M10 ', 'S', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5023', '3155', '320/2 THA CKD            ', '2911', '2911', '1', '1', 'C3', 'E21 ', 'M20 ', 'S', '2', 'L', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5024', '3161', '320 A                    ', '2921', '2921', '1', '1', '3', 'E21 ', 'M10 ', 'A', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5025', '3162', '320 A RL                 ', '2921', '2921', '1', '1', '3', 'E21 ', 'M10 ', 'A', '2', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5026', '3171', '320I                     ', '2931', '2931', '1', '1', '3', 'E21 ', 'M10 ', 'S', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5027', '3172', '320I RL                  ', '2931', '2931', '1', '1', '3', 'E21 ', 'M10 ', 'S', '2', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5028', '3173', '320I US                  ', '2933', '2933', '1', '1', '3', 'E21 ', 'M10 ', 'S', '2', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5029', '3174', '320I US                  ', '2933', '2933', '1', '1', '3', 'E21 ', 'M10 ', 'S', '2', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5030', '3179', '320I JAP                 ', '2933', '2933', '1', '1', '3', 'E21 ', 'M10 ', 'S', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5031', '3183', '320I A US                ', '2943', '2943', '1', '1', '3', 'E21 ', 'M10 ', 'A', '2', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5032', '3184', '320I A US                ', '2943', '2943', '1', '1', '3', 'E21 ', 'M10 ', 'A', '2', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5033', '3189', '320I A JAP               ', '2943', '2943', '1', '1', '3', 'E21 ', 'M10 ', 'A', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5034', '3431', ' 3.0 CS                  ', '3431', '3431', '1', '1', 'E9', 'E09 ', 'M30 ', 'S', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5035', '3432', ' 3.0 CS A                ', '3432', '3432', '1', '1', 'E9', 'E09 ', 'M30 ', 'A', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5036', '3435', ' 3.0 CS USA              ', '3431', '3431', '1', '1', 'E9', 'E09 ', 'M30 ', 'S', '2', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5037', '3436', ' 3.0 CS A USA            ', '3432', '3432', '1', '1', 'E9', 'E09 ', 'M30 ', 'A', '2', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5038', '3441', ' 3.0 CSI                 ', '3441', '3441', '1', '1', 'E9', 'E09 ', 'M30 ', 'S', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5039', '3611', '518', '3611', '3611', '1', '1', '5', 'E12 ', 'M10 ', 'S', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5040', '3612', '518 RL                   ', '3611', '3611', '1', '1', '5', 'E12 ', 'M10 ', 'S', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5041', '3618', '518 ZA CKD               ', '3611', '3611', '1', '1', 'Z5', 'E12 ', 'M10 ', 'S', '4', 'L', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5042', '3621', '518 A                    ', '3611', '3611', '1', '1', '5', 'E12 ', 'M10 ', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5043', '3651', '518', '3651', '3651', '1', '1', '5', 'E12 ', 'M10 ', 'S', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5044', '3652', '518 RL                   ', '3651', '3651', '1', '1', '5', 'E12 ', 'M10 ', 'S', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5045', '3658', '518L ZA CKD              ', '3651', '3651', '1', '1', 'Z5', 'E12 ', 'M10 ', 'S', '4', 'L', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5046', '3659', '518L ZA CKD              ', '3651', '3651', '1', '1', 'Z5', 'E12 ', 'M10 ', 'S', '4', 'L', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5047', '3661', '518 A                    ', '3661', '3661', '1', '1', '5', 'E12 ', 'M10 ', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5048', '3662', '518 A RL                 ', '3661', '3661', '1', '1', '5', 'E12 ', 'M10 ', 'A', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5049', '3668', '518L A RL ZA CKD         ', '3661', '3661', '1', '1', 'Z5', 'E12 ', 'M10 ', 'A', '4', 'R', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5050', '3706', '520 RL ZA SKD            ', '3706', '3706', '1', '1', 'C5', 'E12 ', 'M10 ', 'S', '4', 'R', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5051', '3707', '520 RL ZA CKD            ', '3706', '3706', '1', '1', 'C5', 'E12 ', 'M10 ', 'S', '4', 'R', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5052', '3708', '520 A RL ZA CKD          ', '3708', '3708', '1', '1', 'C5', 'E12 ', 'M10 ', 'A', '4', 'R', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5053', '3711', '520 (4-ZYL)              ', '3706', '3706', '1', '1', '5', 'E12 ', 'M10 ', 'S', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5054', '3712', '520 RL (4-ZYL)           ', '3706', '3706', '1', '1', '5', 'E12 ', 'M10 ', 'S', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5055', '3715', '520 THA CKD              ', '3706', '3706', '1', '1', 'C5', 'E12 ', 'M10 ', 'S', '4', 'L', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5056', '3716', '520 POR CKD              ', '3706', '3706', '1', '1', 'C5', 'E12 ', 'M10 ', 'S', '4', 'L', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5057', '3718', '520 ERA CKD              ', '3706', '3706', '1', '1', 'C5', 'E12 ', 'M10 ', 'S', '4', 'L', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5058', '3721', '520 A (4-ZYL)            ', '3708', '3708', '1', '1', '5', 'E12 ', 'M10 ', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5059', '3722', '520 A RL (4-ZYL)         ', '3708', '3708', '1', '1', '5', 'E12 ', 'M10 ', 'A', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5060', '3728', '520 A ERA CKD            ', '3708', '3708', '1', '1', 'C5', 'E12 ', 'M10 ', 'A', '4', 'L', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5061', '3731', '520I (4-ZYL)             ', '3731', '3731', '1', '1', '5', 'E12 ', 'M10 ', 'S', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5062', '3732', '520I RL (4-ZYL)          ', '3731', '3731', '1', '1', '5', 'E12 ', 'M10 ', 'S', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5063', '3751', '520', '3706', '3706', '1', '1', '5', 'E12 ', 'M10 ', 'S', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5064', '3752', '520 RL (4-ZYL)           ', '3706', '3706', '1', '1', '5', 'E12 ', 'M10 ', 'S', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5065', '3755', '520 THA CKD              ', '3706', '3706', '1', '1', 'C5', 'E12 ', 'M20 ', 'S', '4', 'L', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5066', '3757', '520 IND CKD              ', '3706', '3706', '1', '1', 'C5', 'E12 ', 'M20 ', 'S', '4', 'L', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5067', '3758', '520 ZA CKD               ', '3706', '3706', '1', '1', 'C5', 'E12 ', 'M20 ', 'S', '4', 'L', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5068', '3761', '520 A (4-ZYL)            ', '3708', '3708', '1', '1', '5', 'E12 ', 'M10 ', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5069', '3762', '520 A RL (4-ZYL)         ', '3708', '3708', '1', '1', '5', 'E12 ', 'M10 ', 'A', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5070', '3768', '520 A ZA CKD             ', '3708', '3708', '1', '1', 'C5', 'E12 ', 'M20 ', 'A', '4', 'L', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5071', '3771', '520I (4-ZYL)             ', '3731', '3731', '1', '1', '5', 'E12 ', 'M10 ', 'S', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5072', '3772', '520I RL (4-ZYL)          ', '3731', '3731', '1', '1', '5', 'E12 ', 'M10 ', 'S', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5073', '3811', '525', '3811', '3811', '1', '1', '5', 'E12 ', 'M30 ', 'S', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5074', '3812', '525 RL                   ', '3811', '3811', '1', '1', '5', 'E12 ', 'M30 ', 'S', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5075', '3818', '525 ZA CKD               ', '3811', '3811', '1', '1', 'Z5', 'E12 ', 'M30 ', 'S', '4', 'L', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5076', '3821', '525 A                    ', '3821', '3821', '1', '1', '5', 'E12 ', 'M30 ', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5077', '3822', '525 A RL                 ', '3821', '3821', '1', '1', '5', 'E12 ', 'M30 ', 'A', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5078', '3828', '525 A ZA CKD             ', '3821', '3821', '1', '1', 'Z5', 'E12 ', 'M30 ', 'A', '4', 'L', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5079', '3833', '530I USA                 ', '3833', '3833', '1', '1', '5', 'E12 ', 'M30 ', 'S', '4', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5080', '3843', '530I A USA               ', '3843', '3843', '1', '1', '5', 'E12 ', 'M30 ', 'A', '4', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5081', '3851', '525', '3851', '3851', '1', '1', '5', 'E12 ', 'M30 ', 'S', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5082', '3852', '525 RL                   ', '3851', '3851', '1', '1', '5', 'E12 ', 'M30 ', 'S', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5083', '3858', '525 ZA CKD               ', '3851', '3851', '1', '1', 'Z5', 'E12 ', 'M30 ', 'S', '4', 'L', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5084', '3861', '525 A                    ', '3861', '3861', '1', '1', '5', 'E12 ', 'M30 ', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5085', '3862', '525 A RL                 ', '3861', '3861', '1', '1', '5', 'E12 ', 'M30 ', 'A', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5086', '3868', '525 A ZA CKD             ', '3861', '3861', '1', '1', 'Z5', 'E12 ', 'M30 ', 'A', '4', 'L', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5087', '3911', '528', '3911', '3911', '1', '1', '5', 'E12 ', 'M30 ', 'S', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5088', '3912', '528 RL                   ', '3911', '3911', '1', '1', '5', 'E12 ', 'M30 ', 'S', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5089', '3921', '528 A                    ', '3921', '3921', '1', '1', '5', 'E12 ', 'M30 ', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5090', '3922', '528 A RL                 ', '3921', '3921', '1', '1', '5', 'E12 ', 'M30 ', 'A', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5091', '3928', '528 A ZA CKD             ', '3921', '3921', '1', '1', 'Z5', 'E12 ', 'M30 ', 'A', '4', 'L', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5092', '3933', '530I USA/76              ', '3833', '3833', '1', '1', '5', 'E12 ', 'M30 ', 'S', '4', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5093', '3943', '530I A USA/76            ', '3843', '3843', '1', '1', '5', 'E12 ', 'M30 ', 'A', '4', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5094', '3951', '528', '3911', '3911', '1', '1', '5', 'E12 ', 'M30 ', 'S', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5095', '3952', '528 RL                   ', '3911', '3911', '1', '1', '5', 'E12 ', 'M30 ', 'S', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5096', '3961', '528 A                    ', '3921', '3921', '1', '1', '5', 'E12 ', 'M30 ', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5097', '3962', '528 A RL                 ', '3921', '3921', '1', '1', '5', 'E12 ', 'M30 ', 'A', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5098', '3968', '528 A ZA CKD             ', '3921', '3921', '1', '1', 'Z5', 'E12 ', 'M30 ', 'A', '4', 'L', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5099', '3971', '528I                     ', '3971', '3971', '1', '1', '5', 'E12 ', 'M30 ', 'S', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5100', '3972', '528I RL                  ', '3971', '3971', '1', '1', '5', 'E12 ', 'M30 ', 'S', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5101', '3973', '530I USA KAL/77          ', '3833', '3833', '1', '1', '5', 'E12 ', 'M30 ', 'S', '4', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5102', '3974', '530I USA 49S/77          ', '3833', '3833', '1', '1', '5', 'E12 ', 'M30 ', 'S', '4', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5103', '3975', '530I USA KAL/78          ', '3833', '3833', '1', '1', '5', 'E12 ', 'M30 ', 'S', '4', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5104', '3976', '530I USA 49S/78          ', '3833', '3833', '1', '1', '5', 'E12 ', 'M30 ', 'S', '4', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5105', '3978', '528I ZA CKD              ', '3971', '3971', '1', '1', 'Z5', 'E12 ', 'M30 ', 'S', '4', 'L', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5106', '3981', '528I A                   ', '3981', '3981', '1', '1', '5', 'E12 ', 'M30 ', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5107', '3982', '528I A RL                ', '3981', '3981', '1', '1', '5', 'E12 ', 'M30 ', 'A', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5108', '3983', '530I A USA KAL/77        ', '3843', '3843', '1', '1', '5', 'E12 ', 'M30 ', 'A', '4', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5109', '3984', '530I A USA 49S/77        ', '3843', '3843', '1', '1', '5', 'E12 ', 'M30 ', 'A', '4', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5110', '3985', '530I A USA KAL/78        ', '3843', '3843', '1', '1', '5', 'E12 ', 'M30 ', 'A', '4', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5111', '3986', '530I A USA 49S/78        ', '3843', '3843', '1', '1', '5', 'E12 ', 'M30 ', 'A', '4', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5112', '3988', '528I A ZA CKD            ', '3981', '3981', '1', '1', 'Z5', 'E12 ', 'M30 ', 'A', '4', 'L', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5113', '3989', '530I A JAP               ', '3843', '3843', '1', '1', '5', 'E12 ', 'M30 ', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5114', '3991', '528I USA/79              ', '3991', '3991', '1', '1', '5', 'E12 ', 'M30 ', 'S', '4', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5115', '3993', '528 E                    ', '3993', '3993', '1', '1', '5', 'E12 ', 'M30 ', 'A', '4', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5116', '3995', '528I USA/80              ', '3991', '3991', '1', '1', '5', 'E12 ', 'M30 ', 'S', '4', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5117', '3996', '528I RL ZA CKD           ', '3971', '3971', '1', '1', 'Z5', 'E12 ', 'M30 ', 'S', '4', 'R', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5118', '3997', '528I A USA/80            ', '3993', '3993', '1', '1', '5', 'E12 ', 'M30 ', 'A', '4', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5119', '3998', '528I A RL ZA CKD         ', '3981', '3981', '1', '1', 'Z5', 'E12 ', 'M30 ', 'A', '4', 'R', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5120', '3999', '528I A JAP               ', '3993', '3993', '1', '1', '5', 'E12 ', 'M30 ', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5121', '4011', '518', '4011', '4011', '1', '1', '5', 'E28 ', 'M10 ', 'S', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5122', '4012', '518 RL                   ', '4011', '4011', '1', '1', '5', 'E28 ', 'M10 ', 'S', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5123', '4031', '520 I                    ', '4031', '4031', '1', '1', '5', 'E28 ', 'M20 ', 'S', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5124', '4035', '518 I SWE                ', '4011', '4011', '1', '1', '5', 'E28 ', 'M10 ', 'S', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5125', '4041', '520 I A KAT              ', '4041', '4041', '1', '1', '5', 'E28 ', 'M20 ', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5126', '4049', '518 I A JAP              ', '4011', '4011', '1', '1', '5', 'E28 ', 'M10 ', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5127', '4051', '520 I                    ', '4031', '4031', '1', '1', '5', 'E28 ', 'M20 ', 'S', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5128', '4052', '520 I RL                 ', '4031', '4031', '1', '1', '5', 'E28 ', 'M20 ', 'S', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5129', '4054', '520I RL MAL CKD          ', '4031', '4031', '1', '1', 'L5', 'E28 ', 'M20 ', 'S', '4', 'R', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5130', '4055', '520I RL THA CKD          ', '4031', '4031', '1', '1', 'T5', 'E28 ', 'M20 ', 'S', '4', 'R', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5131', '4057', '520I RL IND CKD          ', '4031', '4031', '1', '1', 'C5', 'E28 ', 'M20 ', 'S', '4', 'R', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5132', '4058', '520I RL ZA CKD           ', '4031', '4031', '1', '1', 'Z5', 'E28 ', 'M20 ', 'S', '4', 'R', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5133', '4059', '520I URU CKD             ', '4031', '4031', '1', '1', 'C5', 'E28 ', 'M20 ', 'S', '4', 'L', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5134', '4061', '520 I A                  ', '4041', '4041', '1', '1', '5', 'E28 ', 'M20 ', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5135', '4062', '520 I A RL               ', '4041', '4041', '1', '1', '5', 'E28 ', 'M20 ', 'A', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5136', '4064', '520I A RL MAL CKD        ', '4041', '4041', '1', '1', 'L5', 'E28 ', 'M20 ', 'A', '4', 'R', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5137', '4065', '520I A RL THA CKD        ', '4041', '4041', '1', '1', 'T5', 'E28 ', 'M20 ', 'A', '4', 'R', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5138', '4067', '520I A RL IND CKD        ', '4041', '4041', '1', '1', 'C5', 'E28 ', 'M20 ', 'A', '4', 'R', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5139', '4068', '520I A RL ZA CKD         ', '4041', '4041', '1', '1', 'Z5', 'E28 ', 'M20 ', 'A', '4', 'R', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5140', '4071', '520 I                    ', '4071', '4071', '1', '1', '5', 'E28 ', 'M20 ', 'S', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5141', '4072', '520 I RL                 ', '4071', '4071', '1', '1', '5', 'E28 ', 'M20 ', 'S', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5142', '4073', '528 E USA                ', '4073', '4073', '1', '1', '5', 'E28 ', 'M20 ', 'S', '4', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5143', '4074', '520I RL MAL CKD          ', '4071', '4071', '1', '1', 'L5', 'E28 ', 'M20 ', 'S', '4', 'R', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5144', '4077', '520I RL IND CKD          ', '4071', '4071', '1', '1', 'C5', 'E28 ', 'M20 ', 'S', '4', 'R', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5145', '4079', '520I URU CKD             ', '4071', '4071', '1', '1', 'C5', 'E28 ', 'M20 ', 'S', '4', 'L', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5146', '4081', '520 I A                  ', '4081', '4081', '1', '1', '5', 'E28 ', 'M20 ', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5147', '4082', '520 I A RL               ', '4081', '4081', '1', '1', '5', 'E28 ', 'M20 ', 'A', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5148', '4083', '528 E A USA              ', '4083', '4083', '1', '1', '5', 'E28 ', 'M20 ', 'A', '4', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5149', '4089', '528 E A JAP              ', '4083', '4083', '1', '1', '5', 'E28 ', 'M20 ', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5150', '4091', '518 I                    ', '4091', '4091', '1', '1', '5', 'E28 ', 'M10 ', 'S', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5151', '4092', '518 I RL                 ', '4091', '4091', '1', '1', '5', 'E28 ', 'M10 ', 'S', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5152', '4093', '518 I A                  ', '4091', '4091', '1', '1', '5', 'E28 ', 'M10 ', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5153', '4099', '518 I A JAP              ', '4091', '4091', '1', '1', '5', 'E28 ', 'M10 ', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5154', '4131', '525 I                    ', '4131', '4131', '1', '1', '5', 'E28 ', 'M30 ', 'S', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5155', '4132', '525 I RL                 ', '4131', '4131', '1', '1', '5', 'E28 ', 'M30 ', 'S', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5156', '4141', '525 I A                  ', '4141', '4141', '1', '1', '5', 'E28 ', 'M30 ', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5157', '4142', '525 I A RL               ', '4141', '4141', '1', '1', '5', 'E28 ', 'M30 ', 'A', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5158', '4171', '528 I                    ', '4171', '4171', '1', '1', '5', 'E28 ', 'M30 ', 'S', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5159', '4172', '528 I                    ', '4171', '4171', '1', '1', '5', 'E28 ', 'M30 ', 'S', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5160', '4174', '528I RL MAL CKD          ', '4171', '4171', '1', '1', 'L5', 'E28 ', 'M30 ', 'S', '4', 'R', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5161', '4178', '528I RL ZA CKD           ', '4171', '4171', '1', '1', 'Z5', 'E28 ', 'M30 ', 'S', '4', 'R', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5162', '4181', '528 I A                  ', '4181', '4181', '1', '1', '5', 'E28 ', 'M30 ', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5163', '4182', '528 I A RL               ', '4181', '4181', '1', '1', '5', 'E28 ', 'M30 ', 'A', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5164', '4188', '528I A RL ZA CKD         ', '4181', '4181', '1', '1', 'Z5', 'E28 ', 'M30 ', 'A', '4', 'R', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5165', '4211', '524 TD                   ', '4211', '4211', '1', '1', '5', 'E28 ', 'M21T', 'S', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5166', '4214', '524 TD USA               ', '4214', '4214', '1', '1', '5', 'E28 ', 'M21T', 'S', '4', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5167', '4219', '524TD URU CKD            ', '4211', '4211', '1', '1', 'C5', 'E28 ', 'M21T', 'S', '4', 'L', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5168', '4221', '524 TD A                 ', '4221', '4221', '1', '1', '5', 'E28 ', 'M21T', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5169', '4224', '524 TD A USA             ', '4214', '4214', '1', '1', '5', 'E28 ', 'M21T', 'A', '4', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5170', '4229', '524 TD A JAP             ', '4214', '4214', '1', '1', '5', 'E28 ', 'M21T', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5171', '4231', '525 E KATALYSATOR        ', '4231', '4231', '1', '1', '5', 'E28 ', 'M20 ', 'S', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5172', '4232', '525 E RL KAT             ', '4231', '4231', '1', '1', '5', 'E28 ', 'M20 ', 'S', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5173', '4241', '525 E A KAT              ', '4241', '4241', '1', '1', '5', 'E28 ', 'M20 ', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5174', '4242', '525 E A RL KAT           ', '4241', '4241', '1', '1', '5', 'E28 ', 'M20 ', 'A', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5175', '4251', '525 E                    ', '4231', '4231', '1', '1', '5', 'E28 ', 'M20 ', 'S', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5176', '4252', '525 E RL                 ', '4231', '4231', '1', '1', '5', 'E28 ', 'M20 ', 'S', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5177', '4258', '525E RL ZA CKD           ', '4231', '4231', '1', '1', 'Z5', 'E28 ', 'M20 ', 'S', '4', 'R', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5178', '4261', '525 E A                  ', '4241', '4241', '1', '1', '5', 'E28 ', 'M20 ', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5179', '4262', '525 E A RL               ', '4241', '4241', '1', '1', '5', 'E28 ', 'M20 ', 'A', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5180', '4268', '525E A RL ZA CKD         ', '4241', '4241', '1', '1', 'Z5', 'E28 ', 'M20 ', 'A', '4', 'R', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5181', '4274', '533 I USA                ', '4274', '4274', '1', '1', '5', 'E28 ', 'M30 ', 'S', '4', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5182', '4284', '533 I A USA              ', '4284', '4284', '1', '1', '5', 'E28 ', 'M30 ', 'A', '4', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5183', '4289', '533 I A JAP              ', '4284', '4284', '1', '1', '5', 'E28 ', 'M30 ', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5184', '4291', '524D                     ', '4211', '4211', '1', '1', '5', 'E28 ', 'M21S', 'S', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5185', '4310', ' 2500 L                  ', '4310', '4310', '1', '1', 'E3', 'E03 ', 'M30 ', 'S', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5186', '4320', ' 2500 L/RL               ', '4310', '4310', '1', '1', 'E3', 'E03 ', 'M30 ', 'S', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5187', '4328', ' 2500 L RL CKD           ', '4310', '4310', '1', '1', 'E3', 'E03 ', 'M30 ', 'S', '4', 'R', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5188', '4330', ' 2500 LA                 ', '4330', '4330', '1', '1', 'E3', 'E03 ', 'M30 ', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5189', '4340', ' 2500 LA/RL              ', '4330', '4330', '1', '1', 'E3', 'E03 ', 'M30 ', 'A', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5190', '4401', ' 2800 L MOD. 71          ', '4401', '4401', '1', '1', 'E3', 'E03 ', 'M30 ', 'S', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5191', '4402', ' 2800 LA MOD. 71         ', '4402', '4402', '1', '1', 'E3', 'E03 ', 'M30 ', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5192', '4428', ' 2800 L/RL CKD ZA        ', '4401', '4401', '1', '1', 'E3', 'E03 ', 'M30 ', 'S', '4', 'R', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5193', '4510', ' 3.0 S                   ', '4510', '4510', '1', '1', 'E3', 'E03 ', 'M30 ', 'S', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5194', '4512', ' 3.0 S BAVARIA           ', '4510', '4510', '1', '1', 'E3', 'E03 ', 'M30 ', 'S', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5195', '4530', ' 3.0 S A                 ', '4530', '4530', '1', '1', 'E3', 'E03 ', 'M30 ', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5196', '4532', ' 3.0 S A BAVARIA         ', '4530', '4530', '1', '1', 'E3', 'E03 ', 'M30 ', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5197', '4540', ' 3.0 S A/RL              ', '4530', '4530', '1', '1', 'E3', 'E03 ', 'M30 ', 'A', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5198', '4548', ' 3.0 S RL A CKD          ', '4530', '4530', '1', '1', 'E3', 'E03 ', 'M30 ', 'A', '4', 'R', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5199', '4560', ' 3.0 SI                  ', '4560', '4560', '1', '1', 'E3', 'E03 ', 'M30 ', 'S', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5200', '4570', ' 3.0 SI RL               ', '4560', '4560', '1', '1', 'E3', 'E03 ', 'M30 ', 'S', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5201', '4611', '518', '3651', '3651', '1', '1', '5', 'E12 ', 'M10 ', 'S', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5202', '4612', '518 RL                   ', '3651', '3651', '1', '1', '5', 'E12 ', 'M10 ', 'S', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5203', '4631', '518I SWE                 ', '3651', '3651', '1', '1', '5', 'E12 ', 'M10 ', 'S', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5204', '4638', '518I RL ZA CKD           ', '3651', '3651', '1', '1', 'Z5', 'E28 ', 'M10 ', 'S', '4', 'R', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5205', '4648', '518I A RL ZA CKD         ', '3661', '3661', '1', '1', 'Z5', 'E28 ', 'M10 ', 'A', '4', 'R', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5206', '4649', '518 I A JAP              ', '3661', '3661', '1', '1', '5', 'E12 ', 'M10 ', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5207', '4701', 'M535I                    ', '3971', '3971', '1', '1', '5', 'E12 ', 'M30 ', 'S', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5208', '4702', 'M535I RL                 ', '3971', '3971', '1', '1', '5', 'E12 ', 'M30 ', 'S', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5209', '4708', '535I ZA CKD              ', '3971', '3971', '1', '1', 'Z5', 'E28 ', 'M30 ', 'S', '4', 'L', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5210', '4709', '535I RL ZA CKD           ', '3971', '3971', '1', '1', 'Z5', 'E28 ', 'M30 ', 'S', '4', 'R', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5211', '4711', '520', '4711', '4711', '1', '1', '5', 'E12 ', 'M20 ', 'S', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5212', '4712', '520 RL                   ', '4711', '4711', '1', '1', '5', 'E12 ', 'M20 ', 'S', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5213', '4713', '520 ZA CKD               ', '4711', '4711', '1', '1', 'Z5', 'E12 ', 'M20 ', 'S', '4', 'L', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5214', '4715', '520 THA CKD              ', '4711', '4711', '1', '1', 'T5', 'E12 ', 'M20 ', 'S', '4', 'L', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5215', '4717', '520 IND CKD              ', '4711', '4711', '1', '1', 'C5', 'E12 ', 'M20 ', 'S', '4', 'L', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5216', '4718', '520 ZA CKD               ', '4711', '4711', '1', '1', 'Z5', 'E12 ', 'M20 ', 'S', '4', 'L', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5217', '4719', '520 URU CKD              ', '4711', '4711', '1', '1', 'C5', 'E12 ', 'M20 ', 'S', '4', 'L', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5218', '4721', '520 A                    ', '4721', '4721', '1', '1', '5', 'E12 ', 'M20 ', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5219', '4722', '520 A RL                 ', '4721', '4721', '1', '1', '5', 'E12 ', 'M20 ', 'A', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5220', '4723', '520 A ZA CKD             ', '4721', '4721', '1', '1', 'Z5', 'E12 ', 'M20 ', 'A', '4', 'L', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5221', '4728', '520 A ZA CKD             ', '4721', '4721', '1', '1', 'Z5', 'E12 ', 'M20 ', 'A', '4', 'L', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5222', '4738', '520I RL ZA CKD           ', '4711', '4711', '1', '1', 'Z5', 'E28 ', 'M20 ', 'S', '4', 'R', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5223', '4748', '520I A RL ZA CKD         ', '4721', '4721', '1', '1', 'Z5', 'E28 ', 'M20 ', 'A', '4', 'R', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5224', '5A11', '520I                     ', '5A11', '5A11', '1', '1', '5', 'F10 ', 'N20 ', 'S', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5225', '5A21', '520I A                   ', '5A21', '5A21', '1', '1', '5', 'F10 ', 'N20 ', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5226', '5A31', '520I                     ', '5A31', '5A31', '1', '1', '5', 'F10 ', 'N20 ', 'S', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5227', '5A41', '520I A                   ', '5A41', '5A41', '1', '1', '5', 'F10 ', 'N20 ', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5228', '5A42', '520I A                   ', '5A41', '5A41', '1', '1', '5', 'F10 ', 'N20 ', 'A', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5229', '5A51', '528I                     ', '5A51', '5A51', '1', '1', '5', 'F10 ', 'N20 ', 'S', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5230', '5A61', '528I A                   ', '5A61', '5A61', '1', '1', '5', 'F10 ', 'N20 ', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5231', '5A63', '528I A                   ', '5A63', '5A63', '1', '1', '5', 'F10 ', 'N20 ', 'A', '4', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5232', '5A81', '528I XDRIVE A            ', '5A81', '5A81', '1', '1', '5X', 'F10 ', 'N20 ', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5233', '5B01', '520D XDRIVE A            ', '5B01', '5B01', '1', '1', '5X', 'F10 ', 'N47T', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5234', '5B11', '535I                     ', '5B11', '5B11', '1', '1', '5', 'F10 ', 'N55 ', 'S', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5235', '5B13', '535I US                  ', '5B13', '5B13', '1', '1', '5', 'F10 ', 'N55 ', 'S', '4', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5236', '5B21', '535I A                   ', '5B21', '5B21', '1', '1', '5', 'F10 ', 'N55 ', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5237', '5B23', '535I US A                ', '5B23', '5B23', '1', '1', '5', 'F10 ', 'N55 ', 'A', '4', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5238', '5B41', '535I XDRIVE A            ', '5B41', '5B41', '1', '1', '5X', 'F10 ', 'N55 ', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5239', '5B91', '520D XDRIVE              ', '5B91', '5B91', '1', '1', '5X', 'F10 ', 'N47T', 'S', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5240', '5C01', '525D XDRIVE A            ', '5C01', '5C01', '1', '1', '5X', 'F10 ', 'N47T', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5241', '5C11', '518D                     ', '5C11', '5C11', '1', '1', '5', 'F10 ', 'N47T', 'S', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5242', '5C21', '518D A                   ', '5C21', '5C21', '1', '1', '5', 'F10 ', 'N47T', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5243', '5C31', '520D                     ', '5C31', '5C31', '1', '1', '5', 'F10 ', 'N47T', 'S', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5244', '5C41', '520D A                   ', '5C41', '5C41', '1', '1', '5', 'F10 ', 'N47T', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5245', '5C42', '520D A                   ', '5C41', '5C41', '1', '1', '5', 'F10 ', 'N47T', 'A', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5246', '5C71', '525D                     ', '5C71', '5C71', '1', '1', '5', 'F10 ', 'N47T', 'S', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5247', '5C81', '525D A                   ', '5C81', '5C81', '1', '1', '5', 'F10 ', 'N47T', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5248', '5D01', 'M550D XDRIVE A           ', '5D01', '5D01', '1', '1', '5X', 'F10 ', 'N57X', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5249', '5D11', '530D                     ', '5D11', '5D11', '1', '1', '5', 'F10 ', 'N57T', 'S', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5250', '5D41', '530D XDRIVE A            ', '5D41', '5D41', '1', '1', '5X', 'F10 ', 'N57T', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5251', '5D61', '535D A                   ', '5D61', '5D61', '1', '1', '5', 'F10 ', 'N57Z', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5252', '5D81', '535D XDRIVE A            ', '5D81', '5D81', '1', '1', '5X', 'F10 ', 'N57Z', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5253', '5.00E+11', '535IH ACTIVE HYBRID      ', '5.00E+11', '5.00E+11', '1', '1', '5H', 'F10 ', 'N55 ', 'S', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5254', '5.00E+13', '535IH ACTIVE HYBRID      ', '5.00E+13', '5.00E+13', '1', '1', '5H', 'F10 ', 'N55 ', 'S', '4', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5255', '5.00E+21', '535IH ACTIVE HYBRIDA     ', '5.00E+21', '5.00E+21', '1', '1', '5H', 'F10 ', 'N55 ', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5256', '5G21', '520I A                   ', '5G21', '5G21', '1', '1', '5', 'F11 ', 'N20 ', 'A', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5257', '5G22', '520I A                   ', '5G21', '5G21', '1', '1', '5', 'F11 ', 'N20 ', 'A', '5', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5258', '5G51', '528I                     ', '5G51', '5G51', '1', '1', '5', 'F11 ', 'N20 ', 'S', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5259', '5G61', '528I A                   ', '5G61', '5G61', '1', '1', '5', 'F11 ', 'N20 ', 'A', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5260', '5G62', '528I A                   ', '5G61', '5G61', '1', '1', '5', 'F11 ', 'N20 ', 'A', '5', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5261', '5G81', '528I XDRIVE A            ', '5G81', '5G81', '1', '1', '5X', 'F11 ', 'N20 ', 'A', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5262', '5H11', '535I                     ', '5H11', '5H11', '1', '1', '5', 'F11 ', 'N55 ', 'S', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5263', '5H21', '535I A                   ', '5H21', '5H21', '1', '1', '5', 'F11 ', 'N55 ', 'A', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5264', '5J01', '525D XDRIVE A            ', '5J01', '5J01', '1', '1', '5X', 'F11 ', 'N47T', 'A', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5265', '5J21', '518D A                   ', '5J21', '5J21', '1', '1', '5', 'F11 ', 'N47T', 'A', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5266', '5J31', '520D                     ', '5J31', '5J31', '1', '1', '5', 'F11 ', 'N47T', 'S', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5267', '5J41', '520D A                   ', '5J41', '5J41', '1', '1', '5', 'F11 ', 'N47T', 'A', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5268', '5J42', '520D A                   ', '5J41', '5J41', '1', '1', '5', 'F11 ', 'N47T', 'A', '5', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5269', '5J51', '520D XDRIVE              ', '5J51', '5J51', '1', '1', '5X', 'F11 ', 'N47T', 'S', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5270', '5J61', '520D XDRIVE A            ', '5J61', '5J61', '1', '1', '5X', 'F11 ', 'N47T', 'A', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5271', '5J71', '525D                     ', '5J71', '5J71', '1', '1', '5', 'F11 ', 'N47T', 'S', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5272', '5J81', '525D A                   ', '5J81', '5J81', '1', '1', '5', 'F11 ', 'N47T', 'A', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5273', '5K01', 'M550D XDRIVE A           ', '5K01', '5K01', '1', '1', '5X', 'F11 ', 'N57X', 'A', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5274', '5K11', '530D                     ', '5K11', '5K11', '1', '1', '5', 'F11 ', 'N57T', 'S', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5275', '5K41', '530D XDRIVE A            ', '5K41', '5K41', '1', '1', '5X', 'F11 ', 'N57T', 'A', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5276', '5K61', '535D A                   ', '5K61', '5K61', '1', '1', '5', 'F11 ', 'N57Z', 'A', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5277', '5M01', '550I GT XDRIVE           ', '5M01', '5M01', '1', '1', 'GX', 'F07 ', 'N63T', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5278', '5M03', '550I GT XDRIVE           ', '5M03', '5M03', '1', '1', 'GX', 'F07 ', 'N63T', 'A', '4', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5279', '5M21', '535I                     ', '5M21', '5M21', '1', '1', '5S', 'F07 ', 'N55 ', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5280', '5M23', '535I                     ', '5M23', '5M23', '1', '1', '5S', 'F07 ', 'N55 ', 'A', '4', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5281', '5M41', '535I XDRIVE              ', '5M41', '5M41', '1', '1', '5D', 'F07 ', 'N55 ', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5282', '5M61', '550I GT                  ', '5M61', '5M61', '1', '1', 'GT', 'F07 ', 'N63T', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5283', '5M63', '550I GT                  ', '5M63', '5M63', '1', '1', 'GT', 'F07 ', 'N63T', 'A', '4', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5284', '5M81', '550I XDRIVE              ', '5M81', '5M81', '1', '1', '5D', 'F07 ', 'N63T', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5285', '5N01', '535D XDRIVE              ', '5N01', '5N01', '1', '1', '5D', 'F07 ', 'N57Z', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5286', '5N21', '520D GT                  ', '5N21', '5N21', '1', '1', 'GT', 'F07 ', 'N47T', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5287', '5N41', '530D                     ', '5N41', '5N41', '1', '1', '5S', 'F07 ', 'N57T', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5288', '5N61', '530D XDRIVE              ', '5N61', '5N61', '1', '1', '5D', 'F07 ', 'N57T', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5289', '5N81', '535D                     ', '5N81', '5N81', '1', '1', '5S', 'F07 ', 'N57Z', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5290', '5S11', '520LI                    ', '5S11', '5S11', '1', '1', '5C', 'F18 ', 'N20 ', 'S', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5291', '5S21', '520LI A                  ', '5S21', '5S21', '1', '1', '5C', 'F18 ', 'N20 ', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5292', '5S41', '525LI A                  ', '5S41', '5S41', '1', '1', '5C', 'F18 ', 'N20 ', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5293', '5S61', '530LI CHN A              ', '5S61', '5S61', '1', '1', '5C', 'F18 ', 'N52T', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5294', '5S71', '535LI CHN                ', '5S71', '5S71', '1', '1', '5C', 'F18 ', 'N55 ', 'S', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5295', '5111', '630CS                    ', '5111', '5111', '1', '1', '6', 'E24 ', 'M30 ', 'S', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5296', '5121', '630CS A                  ', '5121', '5121', '1', '1', '6', 'E24 ', 'M30 ', 'A', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5297', '5131', '628 CSI                  ', '5131', '5131', '1', '1', '6', 'E24 ', 'M30 ', 'S', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5298', '5132', '628 CSI RL               ', '5131', '5131', '1', '1', '6', 'E24 ', 'M30 ', 'S', '2', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5299', '5133', '630 CSI USA/77 KA        ', '5133', '5133', '1', '1', '6', 'E24 ', 'M30 ', 'S', '2', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5300', '5134', '630 CSI USA 49S/77       ', '5133', '5133', '1', '1', '6', 'E24 ', 'M30 ', 'S', '2', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5301', '5141', '628 CSI A                ', '5141', '5141', '1', '1', '6', 'E24 ', 'M30 ', 'A', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5302', '5142', '628 CSI A RL             ', '5141', '5141', '1', '1', '6', 'E24 ', 'M30 ', 'A', '2', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5303', '5143', '630CSI A USA/77          ', '5143', '5143', '1', '1', '6', 'E24 ', 'M30 ', 'A', '2', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5304', '5144', '630CSI A USA/77          ', '5143', '5143', '1', '1', '6', 'E24 ', 'M30 ', 'A', '2', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5305', '5171', '628 CSI                  ', '5171', '5171', '1', '1', '6', 'E24 ', 'M30 ', 'S', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5306', '5172', '628 CSI RL               ', '5171', '5171', '1', '1', '6', 'E24 ', 'M30 ', 'S', '2', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5307', '5181', '628 CSI A                ', '5181', '5181', '1', '1', '6', 'E24 ', 'M30 ', 'A', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5308', '5182', '628 CSI A RL             ', '5181', '5181', '1', '1', '6', 'E24 ', 'M30 ', 'A', '2', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5309', '5207', '633 CSI A JAP            ', '5207', '5207', '1', '1', '6', 'E24 ', 'M30 ', 'A', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5310', '5209', '633CSI A JAP             ', '5207', '5207', '1', '1', '6', 'E24 ', 'M30 ', 'A', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5311', '5231', '633 CSI                  ', '5231', '5231', '1', '1', '6', 'E24 ', 'M30 ', 'S', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5312', '5232', '633CSI RL                ', '5231', '5231', '1', '1', '6', 'E24 ', 'M30 ', 'S', '2', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5313', '5233', '633CSI USA KAL/78        ', '5233', '5233', '1', '1', '6', 'E24 ', 'M30 ', 'S', '2', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5314', '5234', '633CSI USA 49S/78        ', '5233', '5233', '1', '1', '6', 'E24 ', 'M30 ', 'S', '2', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5315', '5235', '633CSI USA/79            ', '5235', '5235', '1', '1', '6', 'E24 ', 'M30 ', 'S', '2', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5316', '5236', '633 CSI USA              ', '5235', '5235', '1', '1', '6', 'E24 ', 'M30 ', 'S', '2', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5317', '5241', '633 CSI A                ', '5241', '5241', '1', '1', '6', 'E24 ', 'M30 ', 'A', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5318', '5242', '633CSI A RL              ', '5241', '5241', '1', '1', '6', 'E24 ', 'M30 ', 'A', '2', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5319', '5243', '633CSI A USA/78          ', '5243', '5243', '1', '1', '6', 'E24 ', 'M30 ', 'A', '2', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5320', '5244', '633CSI A USA/78          ', '5243', '5243', '1', '1', '6', 'E24 ', 'M30 ', 'A', '2', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5321', '5245', '633CSI A USA/79          ', '5207', '5207', '1', '1', '6', 'E24 ', 'M30 ', 'A', '2', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5322', '5246', '633 CSI A USA            ', '5207', '5207', '1', '1', '6', 'E24 ', 'M30 ', 'A', '2', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5323', '5249', '633CSI A JAP             ', '5243', '5243', '1', '1', '6', 'E24 ', 'M30 ', 'A', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5324', '5274', '633 CSI USA              ', '5274', '5274', '1', '1', '6', 'E24 ', 'M30 ', 'S', '2', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5325', '5284', '633 CSI A USA            ', '5284', '5284', '1', '1', '6', 'E24 ', 'M30 ', 'A', '2', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5326', '5289', '633 CSI A JAP            ', '5284', '5284', '1', '1', '6', 'E24 ', 'M30 ', 'A', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5327', '5331', '635 CSI                  ', '5331', '5331', '1', '1', '6', 'E24 ', 'M30 ', 'S', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5328', '5332', '635 CSI RL               ', '5331', '5331', '1', '1', '6', 'E24 ', 'M30 ', 'S', '2', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5329', '5341', '635 CSI A                ', '5341', '5341', '1', '1', '6', 'E24 ', 'M30 ', 'A', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5330', '5342', '635 CSI A RL             ', '5341', '5341', '1', '1', '6', 'E24 ', 'M30 ', 'A', '2', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5331', '5351', '635 CSI KATALYS          ', '5351', '5351', '1', '1', '6', 'E24 ', 'M30 ', 'S', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5332', '5352', '635 CSI RL KAT           ', '5351', '5351', '1', '1', '6', 'E24 ', 'M30 ', 'S', '2', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5333', '5361', '635 CSI A KAT            ', '5361', '5361', '1', '1', '6', 'E24 ', 'M30 ', 'A', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5334', '5362', '635 CSI ARL KAT          ', '5361', '5361', '1', '1', '6', 'E24 ', 'M30 ', 'A', '2', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5335', '5371', '635 CSI                  ', '5351', '5351', '1', '1', '6', 'E24 ', 'M30 ', 'S', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5336', '5372', '635 CSI RL               ', '5351', '5351', '1', '1', '6', 'E24 ', 'M30 ', 'S', '2', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5337', '5374', '635 CSI USA              ', '5374', '5374', '1', '1', '6', 'E24 ', 'M30 ', 'S', '2', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5338', '5381', '635 CSI A                ', '5361', '5361', '1', '1', '6', 'E24 ', 'M30 ', 'A', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5339', '5382', '635 CSI A RL             ', '5361', '5361', '1', '1', '6', 'E24 ', 'M30 ', 'A', '2', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5340', '5384', '635 CSI A USA            ', '5384', '5384', '1', '1', '6', 'E24 ', 'M30 ', 'A', '2', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5341', '5389', '635 CSI A JAP            ', '5384', '5384', '1', '1', '6', 'E24 ', 'M30 ', 'A', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5342', '5511', 'M 635 CSI KATAL          ', '5511', '5511', '1', '1', '6', 'E24 ', 'S38 ', 'S', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5343', '5514', '635 CSI USA S38          ', '5514', '5514', '1', '1', '6', 'E24 ', 'S38 ', 'S', '2', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5344', '5519', '635 CSI JAP S38          ', '5514', '5514', '1', '1', '6', 'E24 ', 'S38 ', 'S', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5345', '5531', 'M 635 CSI                ', '5511', '5511', '1', '1', '6', 'E24 ', 'S38 ', 'S', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5346', '5532', '635 CSI RL S38           ', '5511', '5511', '1', '1', '6', 'E24 ', 'S38 ', 'S', '2', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5347', '5991', 'M 1                      ', '5991', '5991', '1', '1', 'M1', 'E26 ', 'S38 ', 'S', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5348', '6A01', '640I                     ', '6A01', '6A01', '1', '1', '6', 'F06 ', 'N55 ', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5349', '6A02', '640I RL                  ', '6A01', '6A01', '1', '1', '6', 'F06 ', 'N55 ', 'A', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5350', '6A03', '640I US                  ', '6A03', '6A03', '1', '1', '6', 'F06 ', 'N55 ', 'A', '4', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5351', '6A61', '640D                     ', '6A61', '6A61', '1', '1', '6', 'F06 ', 'N57Z', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5352', '6A62', '640D RL                  ', '6A61', '6A61', '1', '1', '6', 'F06 ', 'N57Z', 'A', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5353', '6A81', '640D XDRIVE              ', '6A81', '6A81', '1', '1', '6X', 'F06 ', 'N57Z', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5354', '6B21', '650I                     ', '6B21', '6B21', '1', '1', '6', 'F06 ', 'N63T', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5355', '6B22', '650I RL                  ', '6B21', '6B21', '1', '1', '6', 'F06 ', 'N63T', 'A', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5356', '6B23', '650I US                  ', '6B23', '6B23', '1', '1', '6', 'F06 ', 'N63T', 'A', '4', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5357', '6B41', '650I XDRIVE              ', '6B41', '6B41', '1', '1', '6', 'F06 ', 'N63T', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5358', '6B43', '650I XDRIVE US           ', '6B43', '6B43', '1', '1', '6X', 'F06 ', 'N63T', 'A', '4', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5359', '6B61', '650I XDRIVE              ', '6B61', '6B61', '1', '1', '6X', 'F06 ', 'N63T', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5360', '6B81', '640I XDRIVE              ', '6B81', '6B81', '1', '1', '6X', 'F06 ', 'N55 ', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5361', '6B83', '640I XDRIVE US           ', '6B83', '6B83', '1', '1', '6X', 'F06 ', 'N55 ', 'A', '4', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5362', '6C91', 'M6                       ', '6C91', '6C91', '1', '1', 'M6', 'F06 ', 'S63T', 'S', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5363', '6C92', 'M6 RL                    ', '6C91', '6C91', '1', '1', 'M6', 'F06 ', 'S63T', 'S', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5364', '6C93', 'M6 US                    ', '6C93', '6C93', '1', '1', 'M6', 'F06 ', 'S63T', 'S', '4', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5365', '6011', ' 2500 L                  ', '4310', '4310', '1', '1', 'E3', 'E03 ', 'M30 ', 'S', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5366', '6012', ' 2500 L/RL               ', '4310', '4310', '1', '1', 'E3', 'E03 ', 'M30 ', 'S', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5367', '6018', ' 2500 L RL CKD           ', '4310', '4310', '1', '1', 'E3', 'E03 ', 'M30 ', 'S', '4', 'R', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5368', '6021', ' 2500 LA                 ', '4330', '4330', '1', '1', 'E3', 'E03 ', 'M30 ', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5369', '6022', ' 2500 LA  RL             ', '4330', '4330', '1', '1', 'E3', 'E03 ', 'M30 ', 'A', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5370', '6101', ' 2.8 L LANG              ', '4401', '4401', '1', '1', 'E3', 'E03 ', 'M30 ', 'S', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5371', '6103', ' 2.8 LA LANG             ', '4402', '4402', '1', '1', 'E3', 'E03 ', 'M30 ', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5372', '6111', ' 2800 L                  ', '4401', '4401', '1', '1', 'E3', 'E03 ', 'M30 ', 'S', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5373', '6121', ' 2800 LA                 ', '4402', '4402', '1', '1', 'E3', 'E03 ', 'M30 ', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5374', '6201', ' 3.0 L LANG              ', '4510', '4510', '1', '1', 'E3', 'E03 ', 'M30 ', 'S', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5375', '6202', ' 3.0 LA LANG             ', '4530', '4530', '1', '1', 'E3', 'E03 ', 'M30 ', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5376', '6204', ' 3.0 LA RL LANG          ', '4530', '4530', '1', '1', 'E3', 'E03 ', 'M30 ', 'A', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5377', '6208', ' 3.0 A RL CKD ZA         ', '4530', '4530', '1', '1', 'E3', 'E03 ', 'M30 ', 'A', '4', 'R', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5378', '6211', ' 3.0 S                   ', '4510', '4510', '1', '1', 'E3', 'E03 ', 'M30 ', 'S', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5379', '6213', ' 3.0 S   BAVARIA         ', '4510', '4510', '1', '1', 'E3', 'E03 ', 'M30 ', 'S', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5380', '6214', ' 3.0 S USA               ', '4510', '4510', '1', '1', 'E3', 'E03 ', 'M30 ', 'S', '4', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5381', '6221', ' 3.0 SA                  ', '4530', '4530', '1', '1', 'E3', 'E03 ', 'M30 ', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5382', '6222', ' 3.0 SA RL               ', '4530', '4530', '1', '1', 'E3', 'E03 ', 'M30 ', 'A', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5383', '6223', ' 3.0 SA BAVARIA          ', '4530', '4530', '1', '1', 'E3', 'E03 ', 'M30 ', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5384', '6224', ' 3.0 SA USA              ', '4530', '4530', '1', '1', 'E3', 'E03 ', 'M30 ', 'A', '4', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5385', '6228', ' 3.0 S RL A CKD          ', '4530', '4530', '1', '1', 'E3', 'E03 ', 'M30 ', 'A', '4', 'R', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5386', '6231', ' 3.0 SI                  ', '4560', '4560', '1', '1', 'E3', 'E03 ', 'M30 ', 'S', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5387', '6232', ' 3.0 SI RL               ', '4560', '4560', '1', '1', 'E3', 'E03 ', 'M30 ', 'S', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5388', '6234', ' 3.0 SI USA              ', '4560', '4560', '1', '1', 'E3', 'E03 ', 'M30 ', 'S', '4', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5389', '6235', ' 3.0 SI USA/76           ', '4560', '4560', '1', '1', 'E3', 'E03 ', 'M30 ', 'S', '4', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5390', '6241', ' 3.0 SI A                ', '4560', '4560', '1', '1', 'E3', 'E03 ', 'M30 ', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5391', '6244', ' 3.0 SI A USA            ', '4560', '4560', '1', '1', 'E3', 'E03 ', 'M30 ', 'A', '4', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5392', '6245', ' 3.0 SI A USA/76         ', '4560', '4560', '1', '1', 'E3', 'E03 ', 'M30 ', 'A', '4', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5393', '6291', ' 3.3 S LANG              ', '4510', '4510', '1', '1', 'E3', 'E03 ', 'M30 ', 'S', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5394', '6292', ' 3.3 S A LANG            ', '4530', '4530', '1', '1', 'E3', 'E03 ', 'M30 ', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5395', '6293', ' 3.3 A RL LANG           ', '4530', '4530', '1', '1', 'E3', 'E03 ', 'M30 ', 'A', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5396', '6294', ' 3.3 A RL LANG           ', '4530', '4530', '1', '1', 'E3', 'E03 ', 'M30 ', 'A', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5397', '6305', ' 3.3 I LANG              ', '4560', '4560', '1', '1', 'E3', 'E03 ', 'M30 ', 'S', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5398', '6307', ' 3.3 I A LANG            ', '    ', '    ', '1', '1', 'E3', 'E03 ', 'M30 ', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5399', '6308', ' 3.3 I A/RL LANG         ', '    ', '    ', '1', '1', 'E3', 'E03 ', 'M30 ', 'A', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5400', '6403', '730/2.5 A                ', '6501', '6501', '1', '1', '7', 'E23 ', 'M30 ', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5401', '6411', '725 BEHOERDE             ', '6501', '6501', '1', '1', '7', 'E23 ', 'M30 ', 'S', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5402', '6421', '725 A BEHOERDE           ', '6503', '6503', '1', '1', '7', 'E23 ', 'M30 ', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5403', '6431', '725 I                    ', '6531', '6531', '1', '1', '7', 'E23 ', 'M30 ', 'S', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5404', '6441', '725 I A                  ', '6541', '6541', '1', '1', '7', 'E23 ', 'M30 ', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5405', '6471', '725 I                    ', '6571', '6571', '1', '1', '7', 'E23 ', 'M30 ', 'S', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5406', '6481', '725 I A                  ', '6581', '6581', '1', '1', '7', 'E23 ', 'M30 ', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5407', '6501', '728 FRA                  ', '6501', '6501', '1', '1', '7', 'E23 ', 'M30 ', 'S', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5408', '6503', '728 A FRA                ', '6503', '6503', '1', '1', '7', 'E23 ', 'M30 ', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5409', '6511', '728', '6501', '6501', '1', '1', '7', 'E23 ', 'M30 ', 'S', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5410', '6512', '728 RL                   ', '6501', '6501', '1', '1', '7', 'E23 ', 'M30 ', 'S', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5411', '6518', '728 ZA CKD               ', '6501', '6501', '1', '1', 'Z7', 'E23 ', 'M30 ', 'S', '4', 'L', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5412', '6521', '728 A                    ', '6503', '6503', '1', '1', '7', 'E23 ', 'M30 ', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5413', '6522', '728 A RL                 ', '6503', '6503', '1', '1', '7', 'E23 ', 'M30 ', 'A', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5414', '6528', '728 A ZA CKD             ', '6503', '6503', '1', '1', 'Z7', 'E23 ', 'M30 ', 'A', '4', 'L', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5415', '6531', '728 I                    ', '6531', '6531', '1', '1', '7', 'E23 ', 'M30 ', 'S', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5416', '6532', '728 I RL                 ', '6531', '6531', '1', '1', '7', 'E23 ', 'M30 ', 'S', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5417', '6538', '728 I RL ZA CKD          ', '6531', '6531', '1', '1', 'Z7', 'E23 ', 'M30 ', 'S', '4', 'R', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5418', '6541', '728 I A                  ', '6541', '6541', '1', '1', '7', 'E23 ', 'M30 ', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5419', '6542', '728 I A RL               ', '6541', '6541', '1', '1', '7', 'E23 ', 'M30 ', 'A', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5420', '6548', '728IA RL ZA CKD          ', '6541', '6541', '1', '1', 'Z7', 'E23 ', 'M30 ', 'A', '4', 'R', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5421', '6571', '728 I                    ', '6571', '6571', '1', '1', '7', 'E23 ', 'M30 ', 'S', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5422', '6572', '728 I RL                 ', '6571', '6571', '1', '1', '7', 'E23 ', 'M30 ', 'S', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5423', '6578', '728 I RL ZA CKD          ', '6571', '6571', '1', '1', 'Z7', 'E23 ', 'M30 ', 'S', '4', 'R', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5424', '6581', '728 I A                  ', '6581', '6581', '1', '1', '7', 'E23 ', 'M30 ', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5425', '6582', '728 I A RHD              ', '6581', '6581', '1', '1', '7', 'E23 ', 'M30 ', 'A', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5426', '6588', '728IA RL ZA CKD          ', '6581', '6581', '1', '1', 'Z7', 'E23 ', 'M30 ', 'A', '4', 'R', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5427', '6603', ' 3.2 IA CRC  CKD         ', '6641', '6641', '1', '1', 'E3', 'E09 ', 'M30 ', 'A', '4', 'L', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5428', '6607', '730 A ZA CKD             ', '6607', '6607', '1', '1', 'Z7', 'E23 ', 'M30 ', 'A', '4', 'L', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5429', '6611', '730', '6611', '6611', '1', '1', '7', 'E23 ', 'M30 ', 'S', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5430', '6612', '730 RL                   ', '6611', '6611', '1', '1', '7', 'E23 ', 'M30 ', 'S', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5431', '6621', '730 A                    ', '6607', '6607', '1', '1', '7', 'E23 ', 'M30 ', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5432', '6622', '730 A RL                 ', '6607', '6607', '1', '1', '7', 'E23 ', 'M30 ', 'A', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5433', '6628', '730 A ZA CKD             ', '6607', '6607', '1', '1', 'Z7', 'E23 ', 'M30 ', 'A', '4', 'L', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5434', '6631', '732 I                    ', '6631', '6631', '1', '1', '7', 'E23 ', 'M30 ', 'S', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5435', '6632', '732 I RL                 ', '6631', '6631', '1', '1', '7', 'E23 ', 'M30 ', 'S', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5436', '6633', '733I USA/80              ', '6633', '6633', '1', '1', '7', 'E23 ', 'M30 ', 'S', '4', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5437', '6634', '732 I USA                ', '6634', '6634', '1', '1', '7', 'E23 ', 'M30 ', 'S', '4', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5438', '6638', '732I  RL ZA CKD          ', '6631', '6631', '1', '1', 'Z7', 'E23 ', 'M30 ', 'S', '4', 'R', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5439', '6641', '732 I A                  ', '6641', '6641', '1', '1', '7', 'E23 ', 'M30 ', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5440', '6642', '732 I A RL               ', '6641', '6641', '1', '1', '7', 'E23 ', 'M30 ', 'A', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5441', '6643', '733I A USA/80            ', '6643', '6643', '1', '1', '7', 'E23 ', 'M30 ', 'A', '4', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5442', '6644', '732 I A USA              ', '6644', '6644', '1', '1', '7', 'E23 ', 'M30 ', 'A', '4', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5443', '6647', '732 I A JAP              ', '6644', '6644', '1', '1', '7', 'E23 ', 'M30 ', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5444', '6648', '732IA RL ZA CKD          ', '6641', '6641', '1', '1', 'Z7', 'E23 ', 'M30 ', 'A', '4', 'R', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5445', '6649', '732 I A JAP              ', '6643', '6643', '1', '1', '7', 'E23 ', 'M30 ', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5446', '6671', '732 I                    ', '6671', '6671', '1', '1', '7', 'E23 ', 'M30 ', 'S', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5447', '6672', '732 I RL                 ', '6671', '6671', '1', '1', '7', 'E23 ', 'M30 ', 'S', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5448', '6674', '733 I USA                ', '6634', '6634', '1', '1', '7', 'E23 ', 'M30 ', 'S', '4', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5449', '6678', '732I  RL ZA CKD          ', '6671', '6671', '1', '1', 'Z7', 'E23 ', 'M30 ', 'S', '4', 'R', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5450', '6681', '732 I A                  ', '6681', '6681', '1', '1', '7', 'E23 ', 'M30 ', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5451', '6682', '732 I A RL               ', '6681', '6681', '1', '1', '7', 'E23 ', 'M30 ', 'A', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5452', '6684', '732 I A USA              ', '6644', '6644', '1', '1', '7', 'E23 ', 'M30 ', 'A', '4', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5453', '6688', '732IA RL ZA CKD          ', '6681', '6681', '1', '1', 'Z7', 'E23 ', 'M30 ', 'A', '4', 'R', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5454', '6689', '732 I A JAP              ', '6644', '6644', '1', '1', '7', 'E23 ', 'M30 ', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5455', '6721', '735 I A KAT HL           ', '6721', '6721', '1', '1', '7', 'E23 ', 'M30 ', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5456', '6724', '735 I A USA HL           ', '6724', '6724', '1', '1', '7', 'E23 ', 'M30 ', 'A', '4', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5457', '6731', '733I                     ', '6731', '6731', '1', '1', '7', 'E23 ', 'M30 ', 'S', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5458', '6732', '733I RL                  ', '6731', '6731', '1', '1', '7', 'E23 ', 'M30 ', 'S', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5459', '6733', '733I USA KAL/78          ', '6733', '6733', '1', '1', '7', 'E23 ', 'M30 ', 'S', '4', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5460', '6734', '733I USA                 ', '6733', '6733', '1', '1', '7', 'E23 ', 'M30 ', 'S', '4', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5461', '6741', '733I A                   ', '6741', '6741', '1', '1', '7', 'E23 ', 'M30 ', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5462', '6742', '733I A RL                ', '6741', '6741', '1', '1', '7', 'E23 ', 'M30 ', 'A', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5463', '6743', '733I A USA KAL/78        ', '6743', '6743', '1', '1', '7', 'E23 ', 'M30 ', 'A', '4', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5464', '6744', '733I A USA 49S/78        ', '6743', '6743', '1', '1', '7', 'E23 ', 'M30 ', 'A', '4', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5465', '6745', '733 I A SWE              ', '6745', '6745', '1', '1', '7', 'E23 ', 'M30 ', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5466', '6746', '733 I A RL AUS           ', '6745', '6745', '1', '1', '7', 'E23 ', 'M30 ', 'A', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5467', '6748', '733I A ZA CKD            ', '6741', '6741', '1', '1', 'Z7', 'E23 ', 'M30 ', 'A', '4', 'L', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5468', '6749', '733 I A JAP              ', '6743', '6743', '1', '1', '7', 'E23 ', 'M30 ', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5469', '6781', '735 I A HL               ', '6721', '6721', '1', '1', '7', 'E23 ', 'M30 ', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5470', '6831', '735 I                    ', '6831', '6831', '1', '1', '7', 'E23 ', 'M30 ', 'S', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5471', '6832', '735 I RL                 ', '6831', '6831', '1', '1', '7', 'E23 ', 'M30 ', 'S', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5472', '6838', '735I  RL ZA CKD          ', '6831', '6831', '1', '1', 'Z7', 'E23 ', 'M30 ', 'S', '4', 'R', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5473', '6841', '735 I                    ', '6745', '6745', '1', '1', '7', 'E23 ', 'M30 ', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5474', '6842', '735 I A RL               ', '6745', '6745', '1', '1', '7', 'E23 ', 'M30 ', 'A', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5475', '6848', '735IA RL ZA CKD          ', '6745', '6745', '1', '1', 'Z7', 'E23 ', 'M30 ', 'A', '4', 'R', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5476', '6851', '735 I KAT                ', '6851', '6851', '1', '1', '7', 'E23 ', 'M30 ', 'S', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5477', '6861', '735 I A KATALYSATOR      ', '6721', '6721', '1', '1', '7', 'E23 ', 'M30 ', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5478', '6871', '735 I                    ', '6851', '6851', '1', '1', '7', 'E23 ', 'M30 ', 'S', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5479', '6872', '735 I RL                 ', '6851', '6851', '1', '1', '7', 'E23 ', 'M30 ', 'S', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5480', '6874', '735 I USA                ', '6874', '6874', '1', '1', '7', 'E23 ', 'M30 ', 'S', '4', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5481', '6878', '735I  RL ZA CKD          ', '6851', '6851', '1', '1', 'Z7', 'E23 ', 'M30 ', 'S', '4', 'R', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5482', '6881', '735 I A                  ', '6721', '6721', '1', '1', '7', 'E23 ', 'M30 ', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5483', '6882', '735 I A RL               ', '6721', '6721', '1', '1', '7', 'E23 ', 'M30 ', 'A', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5484', '6884', '735 I A USA              ', '6724', '6724', '1', '1', '7', 'E23 ', 'M30 ', 'A', '4', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5485', '6888', '735IA RL ZA CKD          ', '6721', '6721', '1', '1', 'Z7', 'E23 ', 'M30 ', 'A', '4', 'R', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5486', '6889', '735 I A JAP              ', '6724', '6724', '1', '1', '7', 'E23 ', 'M30 ', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5487', '6928', '735I A RL ZA CKD         ', '6928', '6928', '1', '1', 'Z7', 'E23 ', 'S38 ', 'A', '4', 'R', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5488', '6931', '745 I                    ', '6931', '6931', '1', '1', '7', 'E23 ', 'M30 ', 'S', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5489', '6941', '745 I A                  ', '6931', '6931', '1', '1', '7', 'E23 ', 'M30 ', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5490', '6961', '745 I A HL               ', '6961', '6961', '1', '1', '7', 'E23 ', 'M30 ', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5491', '6969', '745 I A JAP HL           ', '6961', '6961', '1', '1', '7', 'E23 ', 'M30 ', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5492', '6981', '745 I A                  ', '6931', '6931', '1', '1', '7', 'E23 ', 'M30 ', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5493', '6991', '745 I A                  ', '6961', '6961', '1', '1', '7', 'E23 ', 'M30 ', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5494', '6999', '745 I A JAP              ', '6961', '6961', '1', '1', '7', 'E23 ', 'M30 ', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5495', '7001', ' 2.5 CS                  ', '    ', '    ', '1', '1', 'E9', 'E09 ', 'M30 ', 'S', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5496', '7003', ' 2.5 CSA                 ', '    ', '    ', '1', '1', 'E9', 'E09 ', 'M30 ', 'A', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5497', '7011', ' 3.0 CS                  ', '3431', '3431', '1', '1', 'E9', 'E09 ', 'M30 ', 'S', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5498', '7013', ' 3.0 CS   USA            ', '3431', '3431', '1', '1', 'E9', 'E09 ', 'M30 ', 'S', '2', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5499', '7021', ' 3.0 CS A                ', '3432', '3432', '1', '1', 'E9', 'E09 ', 'M30 ', 'A', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5500', '7022', ' 3.0 CS A RL             ', '3432', '3432', '1', '1', 'E9', 'E09 ', 'M30 ', 'A', '2', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5501', '7023', ' 3.0 CS A USA            ', '3432', '3432', '1', '1', 'E9', 'E09 ', 'M30 ', 'A', '2', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5502', '7031', ' 3.0 CSI                 ', '3441', '3441', '1', '1', 'E9', 'E09 ', 'M30 ', 'S', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5503', '7032', ' 3.0 CSI  RL             ', '3441', '3441', '1', '1', 'E9', 'E09 ', 'M30 ', 'S', '2', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5504', '7071', ' 3.0 CSI LEICHTB.        ', '    ', '    ', '1', '1', 'E9', 'E09 ', 'M30 ', 'S', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5505', '8J31', '318D XDRIVE              ', '8J31', '8J31', '1', '1', '3G', 'F31 ', 'N47T', 'S', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5506', '9011', 'WESTFALIA-ANHAENGER      ', '    ', '    ', '1', '1', 'AH', 'HAEN', '    ', ' ', '0', ' ', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5507', 'XG38', '528I RL THA A            ', 'XG41', 'XG41', '1', '1', 'T5', 'F10 ', 'N20 ', 'A', '4', 'R', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5508', 'XG58', '525D RL THA A            ', 'XA41', 'XA41', '1', '1', 'T5', 'F10 ', 'N47T', 'A', '4', 'R', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5509', 'XG18', '520I SKD RL THA          ', 'XG11', 'XG11', '1', '1', 'T5', 'F10 ', 'N20 ', 'A', '4', 'R', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5510', '3F39', '328I RL A                ', '3A61', '3A61', '1', '1', 'T3', 'F30 ', 'N20 ', 'A', '4', 'R', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5511', '3F15', '320I TH SKD RL           ', '3B21', '3B21', '1', '1', 'T3', 'F30 ', 'N20 ', 'A', '4', 'R', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5512', 'VN94', 'X1 SDRIVE20D A           ', 'VN01', 'VN01', '1', '1', 'T3', 'E84 ', 'N47T', 'A', '5', 'R', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5513', 'RS22', 'COOPER D A               ', 'RS21', 'RS21', '1', '1', 'RM', 'R61 ', 'N47T', 'A', '2', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5514', 'RS82', 'COOPER SD A              ', 'RS81', 'RS81', '1', '1', 'RM', 'R61 ', 'N47T', 'A', '2', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5515', 'SS31', 'COOPER ALL4              ', 'SS31', 'SS31', '1', '1', 'RG', 'R61 ', 'N16 ', 'S', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5516', 'VL34', 'X1 SDRIVE18I THA SKD     ', '    ', '    ', '1', '1', 'T3', 'E84 ', 'N46T', 'S', '5', 'R', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5517', 'WX44', 'X3 XDRIVE20I THA SKA     ', 'WX41', 'WX41', '1', '1', 'TX', 'F25 ', 'N20 ', 'A', '5', 'R', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5518', 'XZ02', 'WRAITH                   ', 'XZ01', 'XZ01', '1', '1', 'RR', 'RR5 ', 'N74R', 'A', '2', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5519', '1H22', '220D RL A                ', '1H21', '1H21', '1', '1', '1', 'F22 ', 'N47T', 'A', '2', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5520', '1J12', '220I                     ', '1J11', '1J11', '1', '1', '2', 'F22 ', 'N20 ', 'S', '2', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5521', '1J82', 'M235I A                  ', '1J81', '1J81', '1', '1', '1', 'F22 ', 'N55 ', 'A', '2', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5522', '1Z22', 'I3                       ', '1Z21', '1Z21', '1', '1', 'I0', 'I01 ', 'IB1 ', 'A', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5523', '1Z42', 'I3 (+ REX)               ', '1Z41', '1Z41', '1', '1', 'I0', 'I01 ', 'IB1 ', 'A', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5524', '2Z21', 'I8                       ', '    ', '    ', '1', '1', 'VE', 'I12 ', 'B38T', 'A', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5525', '3R91', 'M4                       ', '    ', '    ', '1', '1', 'M4', 'F82 ', 'S55 ', 'S', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5526', '3R92', 'M4                       ', '    ', '    ', '1', '1', 'M4', 'F82 ', 'S55 ', 'S', '2', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5527', '3R93', 'M4                       ', '    ', '    ', '1', '1', 'M4', 'F82 ', 'S55 ', 'S', '2', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5528', '5A83', '528I XDRIVE A            ', '5A83', '5A83', '1', '1', '5X', 'F10 ', 'N20 ', 'A', '4', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5529', '5C22', '518D A                   ', '5C21', '5C21', '1', '1', '5', 'F10 ', 'N47T', 'A', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5530', '5.00E+23', '535IH ACTIVE HYBRIDA     ', '5.00E+23', '5.00E+23', '1', '1', '5H', 'F10 ', 'N55 ', 'A', '4', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5531', '5G11', '520I                     ', '5G11', '5G11', '1', '1', '5', 'F11 ', 'N20 ', 'S', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5532', '5H41', '535I XDRIVE A            ', '5H41', '5H41', '1', '1', '5X', 'F11 ', 'N55 ', 'A', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5533', '5J82', '525D A                   ', '5J81', '5J81', '1', '1', '5', 'F11 ', 'N47T', 'A', '5', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5534', '5M43', '535I XDRIVE              ', '5M43', '5M43', '1', '1', '5D', 'F07 ', 'N55 ', 'A', '4', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5535', '5M62', '550I GT                  ', '5M61', '5M61', '1', '1', 'GT', 'F07 ', 'N63T', 'A', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5536', '5N22', '520D GT                  ', '5N21', '5N21', '1', '1', 'GT', 'F07 ', 'N47T', 'A', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5537', '5S81', '535LI CHN A              ', '5S81', '5S81', '1', '1', '5C', 'F18 ', 'N55 ', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5538', 'EC67', 'COOPER D A               ', 'XD41', 'XD41', '1', '1', 'RM', 'R60 ', 'N47T', 'A', '5', 'R', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5539', 'MZ72', '530I RL                  ', 'MZ71', 'MZ71', '1', '1', '5', 'F11 ', 'N53 ', 'S', '5', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5540', 'XN31', 'COOPER D                 ', 'XN31', 'XN31', '1', '1', 'RM', 'F56 ', 'B37U', 'S', '3', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5541', '0B05', 'F800GS ADVENTURE         ', '0B05', '0B05', '1', '0', 'U1', 'K75 ', 'A21 ', 'S', '0', ' ', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5542', '0B15', 'F800GS ADVENTURE US      ', '0B05', '0B05', '1', '0', 'U1', 'K75 ', 'A21 ', 'S', '0', ' ', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5543', '1F31', '225I                     ', '    ', '    ', '1', '1', '2P', 'F22 ', 'N20 ', 'S', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5544', '1F41', '225I A                   ', '    ', '    ', '1', '1', '2P', 'F22 ', 'N20 ', 'A', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5545', '1F83', '228I XDRIVE A            ', '    ', '    ', '1', '1', '1X', 'F22 ', 'N20 ', 'A', '2', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5546', '1G03', '228I XDRIVE US A         ', '    ', '    ', '1', '1', '2X', 'F22 ', 'N26 ', 'A', '2', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5547', '1J01', 'M235I XDRIVE A           ', '    ', '    ', '1', '1', '2X', 'F22 ', 'N55 ', 'A', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5548', '1J03', 'M235I XDRIVE US A        ', '    ', '    ', '1', '1', '2X', 'F22 ', 'N55 ', 'A', '2', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5549', '2Z22', 'I8                       ', '    ', '    ', '1', '1', 'VE', 'I12 ', 'B38T', 'A', '2', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5550', '2Z23', 'I8                       ', '    ', '    ', '1', '1', 'VE', 'I12 ', 'B38T', 'A', '2', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5551', '3A29', '316I RU SKD A            ', '3A21', '3A21', '1', '1', 'R3', 'F30 ', 'N13 ', 'A', '4', 'L', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5552', '3S61', '420I XDRIVE A            ', '3S61', '3S61', '1', '1', '4X', 'F32 ', 'N20 ', 'A', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5553', '3T31', '435I                     ', '3T31', '3T31', '1', '1', '4', 'F33 ', 'N55 ', 'S', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5554', '3T41', '435I A                   ', '3T41', '3T41', '1', '1', '4', 'F33 ', 'N55 ', 'A', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5555', '3T42', '435I A                   ', '3T41', '3T41', '1', '1', '4', 'F33 ', 'N55 ', 'A', '2', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5556', '3T43', '435I A                   ', '3T43', '3T43', '1', '1', '4', 'F33 ', 'N55 ', 'A', '2', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5557', '3U11', '420D                     ', '3U11', '3U11', '1', '1', '4', 'F33 ', 'N47T', 'S', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5558', '3U21', '420D A                   ', '3U21', '3U21', '1', '1', '4', 'F33 ', 'N47T', 'A', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5559', '3U22', '420D A                   ', '3U21', '3U21', '1', '1', '4', 'F33 ', 'N47T', 'A', '2', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5560', '3V31', '428I                     ', '3V31', '3V31', '1', '1', '4', 'F33 ', 'N20 ', 'S', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5561', '3V41', '428I A                   ', '3V41', '3V41', '1', '1', '4', 'F33 ', 'N20 ', 'A', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5562', '3V53', '428I                     ', '3V53', '3V53', '1', '1', '4', 'F33 ', 'N20 ', 'S', '2', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5563', '3V83', '428I A                   ', '3V83', '3V83', '1', '1', '4', 'F33 ', 'N26 ', 'A', '2', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5564', '3X12', '320I RL                  ', '3X11', '3X11', '1', '1', '3S', 'F34 ', 'N20 ', 'S', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5565', '3Y22', '318D A                   ', '3Y21', '3Y21', '1', '1', '3S', 'F34 ', 'N47T', 'A', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5566', '3Y82', '325D A                   ', '3Y81', '3Y81', '1', '1', '3S', 'F34 ', 'N47T', 'A', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5567', '3Z72', '320I XDRIVE              ', '3Z71', '3Z71', '1', '1', '3D', 'F34 ', 'N20 ', 'S', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5568', '3Z82', '320I XDRIVE A            ', '3Z81', '3Z81', '1', '1', '3D', 'F34 ', 'N20 ', 'A', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5569', '5A62', '528I A                   ', '5A61', '5A61', '1', '1', '5', 'F10 ', 'N20 ', 'A', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5570', '5B43', '535I XDRIVE A            ', '5B43', '5B43', '1', '1', '5X', 'F10 ', 'N55 ', 'A', '4', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5571', '5C32', '520D                     ', '5C31', '5C31', '1', '1', '5', 'F10 ', 'N47T', 'S', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5572', '5D22', '530D A                   ', '5D21', '5D21', '1', '1', '5', 'F10 ', 'N57T', 'A', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5573', '5J12', '518D                     ', '5J11', '5J11', '1', '1', '5', 'F11 ', 'N47T', 'S', '5', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5574', '5K21', '530D A                   ', '5K21', '5K21', '1', '1', '5', 'F11 ', 'N57T', 'A', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5575', '5K81', '535D XDRIVE A            ', '5K81', '5K81', '1', '1', '5X', 'F11 ', 'N57Z', 'A', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5576', '5N42', '530D                     ', '5N41', '5N41', '1', '1', '5S', 'F07 ', 'N57T', 'A', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5577', '5N82', '535D                     ', '5N81', '5N81', '1', '1', '5S', 'F07 ', 'N57Z', 'A', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5578', '5T21', '528LI XDRIVE A           ', '    ', '    ', '1', '1', '5C', 'F18 ', 'N20 ', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5579', 'EC27', 'MINI ONE A               ', 'ZA41', 'ZA41', '1', '1', 'RM', 'R60 ', 'N16 ', 'A', '5', 'R', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5580', 'KT61', 'X5 M                     ', '    ', '    ', '1', '1', 'M5', 'F85 ', 'S63R', 'A', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5581', 'KT63', 'X5 M                     ', '    ', '    ', '1', '1', 'A5', 'F85 ', 'S63R', 'A', '5', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5582', 'XM51', 'COOPER                   ', 'XM51', 'XM51', '1', '1', 'RM', 'F56 ', 'B38M', 'S', '3', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5583', 'XM53', 'COOPER                   ', 'XM53', 'XM53', '1', '1', 'RM', 'F56 ', 'B38M', 'S', '3', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5584', 'XM61', 'COOPER A                 ', 'XM61', 'XM61', '1', '1', 'RM', 'F56 ', 'B38M', 'A', '3', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5585', 'XM63', 'COOPER A                 ', 'XM63', 'XM63', '1', '1', 'RM', 'F56 ', 'B38M', 'A', '3', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5586', 'XM71', 'COOPER S                 ', 'XM71', 'XM71', '1', '1', 'RM', 'F56 ', 'B48M', 'S', '3', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5587', 'XM73', 'COOPER S US              ', 'XM73', 'XM73', '1', '1', 'RM', 'F56 ', 'B48M', 'S', '3', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5588', 'XM81', 'COOPER S A               ', 'XM81', 'XM81', '1', '1', 'RM', 'F56 ', 'B48M', 'A', '3', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5589', 'XM83', 'COOPER S US A            ', 'XM83', 'XM83', '1', '1', 'RM', 'F56 ', 'B48M', 'A', '3', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5590', 'XN32', 'COOPER D                 ', 'XN31', 'XN31', '1', '1', 'RM', 'F56 ', 'B37U', 'S', '3', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5591', 'XN41', 'COOPER D A               ', 'XN41', 'XN41', '1', '1', 'RM', 'F56 ', 'B37U', 'A', '3', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5592', '3N21', '420I A                   ', '3N21', '3N21', '1', '1', '4', 'F32 ', 'N20 ', 'A', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5593', '3P42', '420D XDRIVE A            ', '3P41', '3P41', '1', '1', '4X', 'F32 ', 'N47T', 'A', '2', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5594', '3S51', '420I XDRIVE              ', '3S51', '3S51', '1', '1', '4X', 'F32 ', 'N20 ', 'S', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5595', '3T33', '435I                     ', '3T33', '3T33', '1', '1', '4', 'F33 ', 'N55 ', 'S', '2', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5596', '3V63', '428I A                   ', '3V63', '3V63', '1', '1', '4', 'F33 ', 'N20 ', 'A', '2', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5597', '5D21', '530D A                   ', '5D21', '5D21', '1', '1', '5', 'F10 ', 'N57T', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5598', '5J11', '518D                     ', '5J11', '5J11', '1', '1', '5', 'F11 ', 'N47T', 'S', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5599', '5S01', '530LE A                  ', '    ', '    ', '1', '1', '5C', 'F18 ', 'N20 ', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5600', '8J81', '335D XDRIVE A            ', '8J81', '8J81', '1', '1', '3G', 'F31 ', 'N57Z', 'A', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5601', 'EC88', 'COOPER RL A              ', 'ZA41', 'ZA41', '1', '1', 'RB', 'R60 ', 'N16 ', 'A', '5', 'R', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5602', 'EE28', 'COOPER S ALL4 RL A       ', 'XD81', 'XD81', '1', '1', 'RB', 'R60 ', 'N18 ', 'A', '5', 'R', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5603', 'XM62', 'COOPER A                 ', 'XM61', 'XM61', '1', '1', 'RM', 'F56 ', 'B38M', 'A', '3', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5604', 'XM82', 'COOPER S A               ', 'XM81', 'XM81', '1', '1', 'RM', 'F56 ', 'B48M', 'A', '3', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5605', 'XW41', 'X4 XDRIVE28I A           ', '    ', '    ', '1', '1', 'G4', 'F26 ', 'N20 ', 'A', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5606', 'XW63', 'X4 XDRIVE35I A           ', '    ', '    ', '1', '1', 'G4', 'F26 ', 'N55 ', 'A', '5', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5607', 'XX61', 'X4 XDRIVE35D A           ', '    ', '    ', '1', '1', 'G4', 'F26 ', 'N57Z', 'A', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5608', '1H12', '220D RL                  ', '1H11', '1H11', '1', '1', '1', 'F22 ', 'N47T', 'S', '2', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5609', '3F48', '320D RL A                ', '3D41', '3D41', '1', '1', 'D3', 'F30 ', 'N47T', 'A', '4', 'R', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5610', '3N11', '420I                     ', '3N11', '3N11', '1', '1', '4', 'F32 ', 'N20 ', 'S', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5611', '3N22', '420I A                   ', '3N21', '3N21', '1', '1', '4', 'F32 ', 'N20 ', 'A', '2', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5612', '3P32', '420D XDRIVE              ', '3P31', '3P31', '1', '1', '4X', 'F32 ', 'N47T', 'S', '2', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5613', '3P82', '430D A                   ', '3P81', '3P81', '1', '1', '4', 'F32 ', 'N57T', 'A', '2', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5614', '3S02', '435D XDRIVE A            ', '3S01', '3S01', '1', '1', '4X', 'F32 ', 'N57Z', 'A', '2', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5615', '3U91', 'M4                       ', '    ', '    ', '1', '1', 'M4', 'F83 ', 'S55 ', 'S', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5616', '5T41', '528LI A                  ', '    ', '    ', '1', '1', '5C', 'F18 ', 'N20 ', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5617', '8J82', '335D XDRIVE A            ', '8J81', '8J81', '1', '1', '3G', 'F31 ', 'N57Z', 'A', '5', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5618', 'EC04', 'COOPER SD ALL4 A         ', 'ZD81', 'ZD81', '1', '1', 'RF', 'R60 ', 'N47T', 'A', '5', 'R', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5619', 'EC64', 'COOPER D A               ', 'XD41', 'XD41', '1', '1', 'RF', 'R60 ', 'N47T', 'A', '5', 'R', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5620', 'EC84', 'COOPER RL A              ', 'ZA41', 'ZA41', '1', '1', 'RF', 'R60 ', 'N16 ', 'A', '5', 'R', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5621', 'KT62', 'X5 M                     ', '    ', '    ', '1', '1', 'M5', 'F85 ', 'S63R', 'A', '5', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5622', 'RJ82', 'COOPER ALL4 A            ', 'RJ81', 'RJ81', '1', '1', 'RY', 'R61 ', 'N18 ', 'A', '2', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5623', 'SS32', 'COOPER ALL4              ', 'SS31', 'SS31', '1', '1', 'RG', 'R61 ', 'N16 ', 'S', '2', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5624', 'UG71', 'X1 SDRIVE18I             ', '    ', '    ', '1', '1', 'SC', 'E84 ', 'N20 ', 'S', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5625', 'UG81', 'X1 SDRIVE18I A           ', '    ', '    ', '1', '1', 'SC', 'E84 ', 'N20 ', 'A', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5626', 'WW21', 'X3 SDRIVE20I A           ', '    ', '    ', '1', '1', 'G3', 'F25 ', 'N20 ', 'A', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5627', 'WY01', 'X3 SDRIVE20I A           ', '    ', '    ', '1', '1', 'G3', 'F25 ', 'N20 ', 'A', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5628', 'WY43', 'X3 XDRIVE28D A           ', '    ', '    ', '1', '1', 'G3', 'F25 ', 'N47T', 'A', '5', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5629', 'WY48', 'X3 XDRIVE20D A           ', 'WY41', 'WY41', '1', '1', 'XM', 'F25 ', 'N47T', 'A', '5', 'R', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5630', 'WY91', 'X3 SDRIVE20I             ', '    ', '    ', '1', '1', 'G3', 'F25 ', 'N20 ', 'S', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5631', 'WZ31', 'X3 SDRIVE18D             ', '    ', '    ', '1', '1', 'G3', 'F25 ', 'B47O', 'S', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5632', 'WZ32', 'X3 SDRIVE18D             ', '    ', '    ', '1', '1', 'G3', 'F25 ', 'B47O', 'S', '5', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5633', 'WZ41', 'X3 SDRIVE18D A           ', '    ', '    ', '1', '1', 'G3', 'F25 ', 'B47O', 'A', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5634', 'WZ51', 'X3 XDRIVE20D             ', '    ', '    ', '1', '1', 'G3', 'F25 ', 'B47O', 'S', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5635', 'WZ61', 'X3 XDRIVE20D A           ', '    ', '    ', '1', '1', 'G3', 'F25 ', 'B47O', 'A', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5636', 'WZ83', 'X3 SDRIVE28I US A        ', '    ', '    ', '1', '1', 'G3', 'F25 ', 'N20 ', 'A', '5', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5637', 'XM52', 'COOPER                   ', 'XM51', 'XM51', '1', '1', 'RM', 'F56 ', 'B38M', 'S', '3', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5638', 'XM72', 'COOPER S                 ', 'XM71', 'XM71', '1', '1', 'RM', 'F56 ', 'B48M', 'S', '3', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5639', 'XN11', 'ONE D                    ', '    ', '    ', '1', '1', 'RM', 'F56 ', 'B37K', 'S', '3', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5640', 'XN12', 'ONE D                    ', '    ', '    ', '1', '1', 'RM', 'F56 ', 'B37K', 'S', '3', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5641', 'XN42', 'COOPER D A               ', 'XN41', 'XN41', '1', '1', 'RM', 'F56 ', 'B37U', 'A', '3', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5642', 'XN71', 'ONE                      ', '    ', '    ', '1', '1', 'RM', 'F56 ', 'B38U', 'S', '3', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5643', 'XN72', 'ONE                      ', '    ', '    ', '1', '1', 'RM', 'F56 ', 'B38U', 'S', '3', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5644', 'XN81', 'ONE A                    ', '    ', '    ', '1', '1', 'RM', 'F56 ', 'B38U', 'A', '3', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5645', 'XN82', 'ONE A                    ', '    ', '    ', '1', '1', 'RM', 'F56 ', 'B38U', 'A', '3', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5646', 'XW11', 'X4 XDRIVE20I             ', '    ', '    ', '1', '1', 'G4', 'F26 ', 'N20 ', 'S', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5647', 'XW43', 'X4 XDRIVE28I A           ', '    ', '    ', '1', '1', 'G4', 'F26 ', 'N20 ', 'A', '5', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5648', 'XW61', 'X4 XDRIVE35I A           ', '    ', '    ', '1', '1', 'G4', 'F26 ', 'N55 ', 'A', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5649', 'XW62', 'X4 XDRIVE35I A           ', '    ', '    ', '1', '1', 'G4', 'F26 ', 'N55 ', 'A', '5', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5650', 'XX11', 'X4 XDRIVE20D             ', '    ', '    ', '1', '1', 'G4', 'F26 ', 'B47O', 'S', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5651', 'XX41', 'X4 XDRIVE30D A           ', '    ', '    ', '1', '1', 'G4', 'F26 ', 'N57T', 'A', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5652', 'YG63', '740LD XDRIVE             ', '    ', '    ', '1', '1', '7X', 'F02 ', 'N57T', 'A', '4', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5653', '3A28', '316I MY SKD RL A         ', '3A21', '3A21', '1', '1', 'C3', 'F30 ', 'N13 ', 'A', '4', 'R', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5654', '3B64', '328I XDRIVE A            ', '3B61', '3B61', '1', '1', 'CZ', 'F30 ', 'N20 ', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5655', '3M81', '328LI XDRIVE             ', '    ', '    ', '1', '1', '3Y', 'F35 ', 'N20 ', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5656', '3P51', '425D                     ', '    ', '    ', '1', '1', '4', 'F32 ', 'N47T', 'S', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5657', '3T23', '428I XDRIVE A            ', '    ', '    ', '1', '1', '3K', 'F33 ', 'N26 ', 'A', '2', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5658', '3U12', '420D                     ', '3U11', '3U11', '1', '1', '4', 'F33 ', 'N47T', 'S', '2', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5659', '3U92', 'M4                       ', '    ', '    ', '1', '1', 'M4', 'F83 ', 'S55 ', 'S', '2', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5660', '3U93', 'M4                       ', '    ', '    ', '1', '1', 'M4', 'F83 ', 'S55 ', 'S', '2', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5661', '3V03', '428I XDRIVE A            ', '    ', '    ', '1', '1', '3K', 'F33 ', 'N20 ', 'A', '2', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5662', '3V42', '428I A                   ', '3V41', '3V41', '1', '1', '4', 'F33 ', 'N20 ', 'A', '2', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5663', '3V61', '428I XDRIVE A            ', '    ', '    ', '1', '1', '4Y', 'F33 ', 'N20 ', 'A', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5664', '3V81', '428I A                   ', '3V81', '3V81', '1', '1', 'K3', 'F33 ', 'N26 ', 'A', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5665', '3X32', '328I RL                  ', '3X31', '3X31', '1', '1', '3S', 'F34 ', 'N20 ', 'S', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5666', '3X72', '335I RL                  ', '3X71', '3X71', '1', '1', '3S', 'F34 ', 'N55 ', 'S', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5667', '3Y01', '330D A                   ', '    ', '    ', '1', '1', '3S', 'F34 ', 'N57T', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5668', '3Y72', '325D                     ', '3Y71', '3Y71', '1', '1', '3S', 'F34 ', 'N47T', 'S', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5669', '3Z01', '335D XDRIVE A            ', '    ', '    ', '1', '1', '3D', 'F34 ', 'N57Z', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5670', '3Z61', '330D XDRIVE A            ', '    ', '    ', '1', '1', '3D', 'F34 ', 'N57T', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5671', '4A03', '428I A                   ', '    ', '    ', '1', '1', '4P', 'F36 ', 'N26 ', 'A', '5', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5672', '4A11', '420I                     ', '    ', '    ', '1', '1', '4P', 'F36 ', 'N20 ', 'S', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5673', '4A51', '428I                     ', '    ', '    ', '1', '1', '4P', 'F36 ', 'N20 ', 'S', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5674', '4A61', '428I A                   ', '    ', '    ', '1', '1', '4P', 'F36 ', 'N20 ', 'A', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5675', '4A63', '428I A                   ', '    ', '    ', '1', '1', '4P', 'F36 ', 'N20 ', 'A', '5', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5676', '4A71', '428I XDRIVE              ', '    ', '    ', '1', '1', '4X', 'F36 ', 'N20 ', 'S', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5677', '4A83', '428I XDRIVE A            ', '    ', '    ', '1', '1', '4X', 'F36 ', 'N20 ', 'A', '5', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5678', '4B11', '435I                     ', '    ', '    ', '1', '1', '4P', 'F36 ', 'N55 ', 'S', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5679', '4B21', '435I A                   ', '    ', '    ', '1', '1', '4P', 'F36 ', 'N55 ', 'A', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5680', '4B23', '435I A                   ', '    ', '    ', '1', '1', '4P', 'F36 ', 'N55 ', 'A', '5', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5681', '4B51', '420D                     ', '    ', '    ', '1', '1', '4P', 'F36 ', 'N47T', 'S', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5682', '4B61', '420D A                   ', '    ', '    ', '1', '1', '4P', 'F36 ', 'N47T', 'A', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5683', '4B81', '420D XDRIVE A            ', '    ', '    ', '1', '1', '4X', 'F36 ', 'N47T', 'A', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5684', '4C03', '428I XDRIVE A            ', '    ', '    ', '1', '1', '4X', 'F36 ', 'N26 ', 'A', '5', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5685', '4D62', '418D A                   ', '    ', '    ', '1', '1', '4P', 'F36 ', 'N47T', 'A', '5', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5686', '5A32', '520I                     ', '5A31', '5A31', '1', '1', '5', 'F10 ', 'N20 ', 'S', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5687', '5A49', '520I A                   ', '5A41', '5A41', '1', '1', 'R5', 'F10 ', 'N20 ', 'A', '4', 'L', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5688', '5A52', '528I                     ', '5A51', '5A51', '1', '1', '5', 'F10 ', 'N20 ', 'S', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5689', '5A89', '528I XDRIVE A            ', '5A81', '5A81', '1', '1', '5R', 'F10 ', 'N20 ', 'A', '4', 'L', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5690', '5B22', '535I A                   ', '5B21', '5B21', '1', '1', '5', 'F10 ', 'N55 ', 'A', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5691', '5C09', '525D XDRIVE A            ', '5C01', '5C01', '1', '1', '5R', 'F10 ', 'N47T', 'A', '4', 'L', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5692', '5C12', '518D                     ', '5C11', '5C11', '1', '1', '5', 'F10 ', 'N47T', 'S', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5693', '5C49', '520D A                   ', '5C41', '5C41', '1', '1', 'R5', 'F10 ', 'N47T', 'A', '4', 'L', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5694', '5C72', '525D                     ', '5C71', '5C71', '1', '1', '5', 'F10 ', 'N47T', 'S', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5695', '5C82', '525D A                   ', '5C81', '5C81', '1', '1', '5', 'F10 ', 'N47T', 'A', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5696', '5D49', '530D XDRIVE A            ', '5D41', '5D41', '1', '1', '5R', 'F10 ', 'N57T', 'A', '4', 'L', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5697', '5D62', '535D A                   ', '5D61', '5D61', '1', '1', '5', 'F10 ', 'N57Z', 'A', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5698', '5.00E+12', '535IH ACTIVE HYBRID      ', '5.00E+11', '5.00E+11', '1', '1', '5H', 'F10 ', 'N55 ', 'S', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5699', '5.00E+22', '535IH ACTIVE HYBRIDA     ', '5.00E+21', '5.00E+21', '1', '1', '5H', 'F10 ', 'N55 ', 'A', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5700', '5G12', '520I                     ', '5G11', '5G11', '1', '1', '5', 'F11 ', 'N20 ', 'S', '5', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5701', '5G52', '528I                     ', '5G51', '5G51', '1', '1', '5', 'F11 ', 'N20 ', 'S', '5', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5702', '5H22', '535I A                   ', '5H21', '5H21', '1', '1', '5', 'F11 ', 'N55 ', 'A', '5', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5703', '5J22', '518D A                   ', '5J21', '5J21', '1', '1', '5', 'F11 ', 'N47T', 'A', '5', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5704', '5J32', '520D                     ', '5J31', '5J31', '1', '1', '5', 'F11 ', 'N47T', 'S', '5', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5705', '5J72', '525D                     ', '5J71', '5J71', '1', '1', '5', 'F11 ', 'N47T', 'S', '5', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5706', '5K22', '530D A                   ', '5K21', '5K21', '1', '1', '5', 'F11 ', 'N57T', 'A', '5', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5707', '5K62', '535D A                   ', '5K61', '5K61', '1', '1', '5', 'F11 ', 'N57Z', 'A', '5', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5708', '5M22', '535I                     ', '5M21', '5M21', '1', '1', '5S', 'F07 ', 'N55 ', 'A', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5709', 'KS62', 'X5 XDRIVE40D             ', 'KS61', 'KS61', '1', '1', 'G5', 'F15 ', 'N57Z', 'A', '5', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5710', 'KT01', 'X5 XDRIVE40E             ', '    ', '    ', '1', '1', '5H', 'F15 ', 'N20 ', 'A', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5711', 'KT02', 'X5 XDRIVE40E             ', '    ', '    ', '1', '1', '5H', 'F15 ', 'N20 ', 'A', '5', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5712', 'KT03', 'X5 XDRIVE40E             ', '    ', '    ', '1', '1', '5H', 'F15 ', 'N20 ', 'A', '5', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5713', 'VP08', 'X1 XDRIVE20D MYS SKA     ', 'VP01', 'VP01', '1', '1', 'C3', 'E84 ', 'N47T', 'A', '5', 'R', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5714', 'WW11', 'X3 SDRIVE20I             ', '    ', '    ', '1', '1', 'G3', 'F25 ', 'N20 ', 'S', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5715', 'WY33', 'X3 XDRIVE28D             ', '    ', '    ', '1', '1', 'G3', 'F25 ', 'N47T', 'S', '5', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5716', 'WZ42', 'X3 SDRIVE18D A           ', '    ', '    ', '1', '1', 'G3', 'F25 ', 'B47O', 'A', '5', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5717', 'XW42', 'X4 XDRIVE28I A           ', '    ', '    ', '1', '1', 'G4', 'F26 ', 'N20 ', 'A', '5', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5718', 'XX62', 'X4 XDRIVE35D A           ', '    ', '    ', '1', '1', 'G4', 'F26 ', 'N57Z', 'A', '5', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5719', '1A27', '116I A                   ', '1A21', '1A21', '1', '1', 'I1', 'F20 ', 'N13 ', 'A', '5', 'R', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5720', '1C27', '118D A                   ', '1C21', '1C21', '1', '1', 'I1', 'F20 ', 'N47T', 'A', '5', 'R', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5721', '2G01', '220D XDRIVE A            ', '    ', '    ', '1', '1', '2X', 'F22 ', 'B47O', 'A', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5722', '2G71', '220D                     ', '    ', '    ', '1', '1', '2', 'F22 ', 'B47O', 'S', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5723', '2G81', '220D A                   ', '    ', '    ', '1', '1', '2', 'F22 ', 'B47O', 'A', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5724', '3F28', '325D TH SKD RL A         ', '3D81', '3D81', '1', '1', 'T3', 'F30 ', 'N47T', 'A', '4', 'R', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5725', '3N12', '420I                     ', '3N11', '3N11', '1', '1', '4', 'F32 ', 'N20 ', 'S', '2', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5726', '3S62', '420I XDRIVE A            ', '3S61', '3S61', '1', '1', '4X', 'F32 ', 'N20 ', 'A', '2', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5727', '3T32', '435I                     ', '3T31', '3T31', '1', '1', '4', 'F33 ', 'N55 ', 'S', '2', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5728', '4A21', '420I A                   ', '    ', '    ', '1', '1', '4P', 'F36 ', 'N20 ', 'A', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5729', '4A81', '428I XDRIVE A            ', '    ', '    ', '1', '1', '4X', 'F36 ', 'N20 ', 'A', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5730', '4B22', '435I A                   ', '    ', '    ', '1', '1', '4P', 'F36 ', 'N55 ', 'A', '5', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5731', '4B71', '420D XDRIVE              ', '    ', '    ', '1', '1', '4X', 'F36 ', 'N47T', 'S', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5732', '4D51', '418D                     ', '    ', '    ', '1', '1', '4P', 'F36 ', 'N47T', 'S', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5733', '4D61', '418D A                   ', '    ', '    ', '1', '1', '4P', 'F36 ', 'N47T', 'A', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5734', '5A45', '520I A                   ', '5A41', '5A41', '1', '1', 'Y5', 'F10 ', 'N20 ', 'A', '4', 'L', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5735', '5A64', '528I A                   ', '5A61', '5A61', '1', '1', 'T5', 'F10 ', 'N20 ', 'A', '4', 'R', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5736', '5A65', '528I A                   ', '5A61', '5A61', '1', '1', 'Y5', 'F10 ', 'N20 ', 'A', '4', 'L', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5737', '5A68', '528I A                   ', '5A61', '5A61', '1', '1', 'L5', 'F10 ', 'N20 ', 'A', '4', 'R', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5738', '5C37', '520D                     ', '    ', '    ', '1', '1', 'I5', 'F10 ', 'N47T', 'S', '4', 'R', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5739', '5C48', '520D A                   ', '5C41', '5C41', '1', '1', 'L5', 'F10 ', 'N47T', 'A', '4', 'R', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5740', '5C84', '525D A                   ', '5C81', '5C81', '1', '1', 'T5', 'F10 ', 'N47T', 'A', '4', 'R', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5741', '5D27', '530D A                   ', '5D21', '5D21', '1', '1', 'I5', 'F10 ', 'N57T', 'A', '4', 'R', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5742', '5D29', '530D A                   ', '5D21', '5D21', '1', '1', 'R5', 'F10 ', 'N57T', 'A', '4', 'L', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5743', 'KU03', 'X6 SDRIVE35I             ', '    ', '    ', '1', '1', 'G6', 'F16 ', 'N55 ', 'A', '5', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5744', 'KU23', 'X6 XDRIVE35I             ', '    ', '    ', '1', '1', 'G6', 'F16 ', 'N55 ', 'A', '5', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5745', 'KU41', 'X6 XDRIVE50I             ', '    ', '    ', '1', '1', 'G6', 'F16 ', 'N63T', 'A', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5746', 'KU61', 'X6 XDRIVE50I             ', '    ', '    ', '1', '1', 'G6', 'F16 ', 'N63T', 'A', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5747', 'KU62', 'X6 XDRIVE50I             ', '    ', '    ', '1', '1', 'G6', 'F16 ', 'N63T', 'A', '5', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5748', 'KU63', 'X6 XDRIVE50I             ', '    ', '    ', '1', '1', 'G6', 'F16 ', 'N63T', 'A', '5', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5749', 'KV21', 'X6 XDRIVE30D             ', '    ', '    ', '1', '1', 'G6', 'F16 ', 'N57T', 'A', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5750', 'KV61', 'X6 M50D                  ', '    ', '    ', '1', '1', 'G6', 'F16 ', 'N57X', 'A', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5751', 'KV62', 'X6 M50D                  ', '    ', '    ', '1', '1', 'G6', 'F16 ', 'N57X', 'A', '5', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5752', 'KW81', 'X6 M                     ', '    ', '    ', '1', '1', 'M6', 'F86 ', 'S63R', 'A', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5753', 'KW83', 'X6 M                     ', '    ', '    ', '1', '1', 'M6', 'F86 ', 'S63R', 'A', '5', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5754', 'WZ62', 'X3 XDRIVE20D A           ', '    ', '    ', '1', '1', 'G3', 'F25 ', 'B47O', 'A', '5', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5755', 'XN01', 'COOPER SD A              ', '    ', '    ', '1', '1', 'RM', 'F56 ', 'B47O', 'A', '3', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5756', 'XN91', 'COOPER SD                ', '    ', '    ', '1', '1', 'RM', 'F56 ', 'B47O', 'S', '3', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5757', 'XP73', 'COOPER S US              ', '    ', '    ', '1', '1', 'RM', 'F56 ', 'B46M', 'S', '3', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5758', 'XP83', 'COOPER S US A            ', '    ', '    ', '1', '1', 'RM', 'F56 ', 'B46M', 'A', '3', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5759', 'XS51', 'COOPER                   ', '    ', '    ', '1', '1', 'O2', 'F55 ', 'B38M', 'S', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5760', 'XS53', 'COOPER                   ', '    ', '    ', '1', '1', 'RM', 'F55 ', 'B38M', 'S', '5', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5761', 'XS61', 'COOPER A                 ', '    ', '    ', '1', '1', 'O2', 'F55 ', 'B38M', 'A', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5762', 'XS62', 'COOPER A                 ', '    ', '    ', '1', '1', 'O2', 'F55 ', 'B38M', 'A', '5', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5763', 'XS63', 'COOPER A                 ', '    ', '    ', '1', '1', 'RM', 'F55 ', 'B38M', 'A', '5', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5764', 'XS71', 'COOPER S                 ', '    ', '    ', '1', '1', 'RM', 'F55 ', 'B48M', 'S', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5765', 'XS72', 'COOPER S                 ', '    ', '    ', '1', '1', 'RM', 'F55 ', 'B48M', 'S', '5', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5766', 'XS73', 'COOPER S                 ', '    ', '    ', '1', '1', 'RM', 'F55 ', 'B48M', 'S', '5', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5767', 'XS81', 'COOPER S A               ', '    ', '    ', '1', '1', 'RM', 'F55 ', 'B48M', 'A', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5768', 'XS83', 'COOPER S A               ', '    ', '    ', '1', '1', 'RM', 'F55 ', 'B48M', 'A', '5', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5769', 'XT31', 'COOPER D                 ', '    ', '    ', '1', '1', 'RM', 'F55 ', 'B37U', 'S', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5770', 'XT32', 'COOPER D                 ', '    ', '    ', '1', '1', 'RM', 'F55 ', 'B37U', 'S', '5', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5771', 'XT41', 'COOPER D A               ', '    ', '    ', '1', '1', 'RM', 'F55 ', 'B37U', 'A', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5772', 'XT71', 'COOPER SD                ', '    ', '    ', '1', '1', 'RM', 'F55 ', 'B47O', 'S', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5773', 'XT81', 'COOPER SD A              ', '    ', '    ', '1', '1', 'RM', 'F55 ', 'B47O', 'A', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5774', 'XW12', 'X4 XDRIVE20I             ', '    ', '    ', '1', '1', 'G4', 'F26 ', 'N20 ', 'S', '5', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5775', 'XX12', 'X4 XDRIVE20D             ', '    ', '    ', '1', '1', 'G4', 'F26 ', 'B47O', 'S', '5', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5776', 'XX42', 'X4 XDRIVE30D A           ', '    ', '    ', '1', '1', 'G4', 'F26 ', 'N57T', 'A', '5', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5777', '0A02', 'R 1200 GS ADV            ', '0A02', '0A02', '1', '0', 'U1', 'K51 ', 'A74 ', 'S', '0', ' ', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5778', '0A03', 'R 1200 RT                ', '0A03', '0A03', '1', '0', 'U1', 'K52 ', 'A74 ', 'S', '0', ' ', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5779', '0A06', 'R1200                    ', '0A06', '0A06', '1', '0', 'U1', 'K21 ', '2-ZY', 'S', '0', ' ', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5780', '0A12', 'R 1200 GS ADV US         ', '0A02', '0A02', '1', '0', 'U1', 'K51 ', 'A74 ', 'S', '0', ' ', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5781', '0A13', 'R 1200 RT US             ', '0A03', '0A03', '1', '0', 'U1', 'K52 ', 'A74 ', 'S', '0', ' ', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5782', '0A16', 'R1200 US                 ', '0A06', '0A06', '1', '0', 'U1', 'K21 ', '2-ZY', 'S', '0', ' ', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5783', '0B25', 'F 800 GS ADVENTURE C     ', '0B05', '0B05', '1', '0', 'U1', 'K75 ', 'A21 ', 'S', '0', ' ', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5784', '0D02', 'S 1000 R                 ', '0D02', '0D02', '1', '0', 'U2', 'K47 ', 'A14 ', 'S', '0', ' ', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5785', '0D12', 'S1000R US                ', '0D02', '0D02', '1', '0', 'U2', 'K47 ', 'A14 ', 'S', '0', ' ', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5786', '603', 'K1600GTL EXCLUSIVE       ', '603', '603', '1', '0', 'U2', 'K48 ', '6-ZY', 'S', '0', ' ', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5787', '613', 'K1600GTL EXCLUSIVE U     ', '603', '603', '1', '0', 'U2', 'K48 ', '6-ZY', 'S', '0', ' ', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5788', '1A14', '116I                     ', '1A11', '1A11', '1', '1', 'T1', 'F20 ', 'N13 ', 'S', '5', 'R', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5789', '1A28', '116I A                   ', '1A21', '1A21', '1', '1', 'L1', 'F20 ', 'N13 ', 'A', '5', 'R', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5790', '1A48', '118I A                   ', '1A41', '1A41', '1', '1', 'L1', 'F20 ', 'N13 ', 'A', '5', 'R', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5791', '1H32', '218D RL                  ', '    ', '    ', '1', '1', '1', 'F22 ', 'N47T', 'S', '2', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5792', '1H42', '218D RL A                ', '    ', '    ', '1', '1', '1', 'F22 ', 'N47T', 'A', '2', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5793', '1H82', '225D RL A                ', '    ', '    ', '1', '1', '1', 'F22 ', 'N47T', 'A', '2', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5794', '3M01', '316LI                    ', '    ', '    ', '1', '1', '3C', 'F35 ', 'N13 ', 'S', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5795', '3M91', '316LI A                  ', '    ', '    ', '1', '1', '3C', 'F35 ', 'N13 ', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5796', '3P52', '425D                     ', '    ', '    ', '1', '1', '4', 'F32 ', 'N47T', 'S', '2', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5797', '3P62', '425D A                   ', '    ', '    ', '1', '1', '4', 'F32 ', 'N47T', 'A', '2', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5798', '3S42', '430D XDRIVE A            ', '    ', '    ', '1', '1', '3A', 'F32 ', 'N57T', 'A', '2', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5799', '3S52', '420I XDRIVE              ', '3S51', '3S51', '1', '1', '4X', 'F32 ', 'N20 ', 'S', '2', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5800', '3Y02', '330D A                   ', '    ', '    ', '1', '1', '3S', 'F34 ', 'N57T', 'A', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5801', '4A22', '420I A                   ', '    ', '    ', '1', '1', '4P', 'F36 ', 'N20 ', 'A', '5', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5802', '4A53', '428I                     ', '    ', '    ', '1', '1', '4P', 'F36 ', 'N20 ', 'S', '5', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5803', '4A62', '428I A                   ', '    ', '    ', '1', '1', '4P', 'F36 ', 'N20 ', 'A', '5', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5804', '4B62', '420D A                   ', '    ', '    ', '1', '1', '4P', 'F36 ', 'N47T', 'A', '5', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5805', '4C82', '420D XDRIVE A            ', '    ', '    ', '1', '1', '4X', 'F36 ', 'N47T', 'A', '5', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5806', '5A38', '520I                     ', '    ', '    ', '1', '1', 'L5', 'F10 ', 'N20 ', 'S', '4', 'R', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5807', '5A44', '520I A                   ', '5A41', '5A41', '1', '1', 'T5', 'F10 ', 'N20 ', 'A', '4', 'R', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5808', '5C44', '520D A                   ', '5C41', '5C41', '1', '1', 'T5', 'F10 ', 'N47T', 'A', '4', 'R', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5809', '5C87', '525D A                   ', '5C81', '5C81', '1', '1', 'I5', 'F10 ', 'N47T', 'A', '4', 'R', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5810', '5.00E+31', '518D                     ', '    ', '    ', '1', '1', '5', 'F10 ', 'B47O', 'S', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5811', '5.00E+51', '520D                     ', '    ', '    ', '1', '1', '5', 'F10 ', 'B47O', 'S', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5812', '5.00E+61', '520D A                   ', '    ', '    ', '1', '1', '5', 'F10 ', 'B47O', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5813', '5.00E+81', '520D XDRIVE A            ', '    ', '    ', '1', '1', '5X', 'F10 ', 'B47O', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5814', '5L31', '520D                     ', '    ', '    ', '1', '1', '5', 'F11 ', 'B47O', 'S', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5815', '5L41', '520D A                   ', '    ', '    ', '1', '1', '5', 'F11 ', 'B47O', 'A', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5816', '5L51', '520D XDRIVE              ', '    ', '    ', '1', '1', '5X', 'F11 ', 'B47O', 'S', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5817', '6B33', '650I XDRIVE US ALPIN     ', '    ', '    ', '1', '1', '6X', 'F06 ', 'N63T', 'A', '4', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5818', 'KW82', 'X6 M                     ', '    ', '    ', '1', '1', 'M6', 'F86 ', 'S63R', 'A', '5', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5819', 'WY02', 'X3 SDRIVE20I RL A        ', '    ', '    ', '1', '1', 'G3', 'F25 ', 'N20 ', 'A', '5', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5820', 'XN92', 'COOPER SD RL             ', '    ', '    ', '1', '1', 'RM', 'F56 ', 'B47O', 'S', '3', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5821', 'XP11', 'ONE                      ', '    ', '    ', '1', '1', 'RM', 'F56 ', 'B38U', 'S', '3', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5822', 'XP12', 'ONE                      ', '    ', '    ', '1', '1', 'RM', 'F56 ', 'B38U', 'S', '3', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5823', 'XP81', 'COOPER S A               ', '    ', '    ', '1', '1', 'O3', 'F56 ', 'B46M', 'A', '3', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5824', 'XW21', 'X4 XDRIVE20I A           ', '    ', '    ', '1', '1', 'G4', 'F26 ', 'N20 ', 'A', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5825', 'XW22', 'X4 XDRIVE20I A           ', '    ', '    ', '1', '1', 'G4', 'F26 ', 'N20 ', 'A', '5', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5826', 'XX21', 'X4 XDRIVE20D A           ', '    ', '    ', '1', '1', 'G4', 'F26 ', 'B47O', 'A', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5827', 'XX22', 'X4 XDRIVE20D A           ', '    ', '    ', '1', '1', 'G4', 'F26 ', 'B47O', 'A', '5', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5828', '0C03', 'ELEKTRO SCOOTER          ', '0C03', '0C03', '1', '0', 'U3', 'K17 ', 'IA0 ', 'A', '0', ' ', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5829', '1A24', '116I A                   ', '1A21', '1A21', '1', '1', 'T1', 'F20 ', 'N13 ', 'A', '5', 'R', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5830', '1F51', '228I                     ', '    ', '    ', '1', '1', '2P', 'F22 ', 'N20 ', 'S', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5831', '1F61', '228I A                   ', '    ', '    ', '1', '1', '2P', 'F22 ', 'N20 ', 'A', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5832', '1F62', '228I A                   ', '    ', '    ', '1', '1', '2P', 'F22 ', 'N20 ', 'A', '2', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5833', '2A31', '216I                     ', '    ', '    ', '1', '1', '2S', 'F45 ', 'B38M', 'S', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5834', '2A41', '216I A                   ', '    ', '    ', '1', '1', '2S', 'F45 ', 'B38M', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5835', '2A42', '216I A                   ', '    ', '    ', '1', '1', '2S', 'F45 ', 'B38M', 'A', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5836', '2A81', '225I A                   ', '    ', '    ', '1', '1', '2S', 'F45 ', 'B48O', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5837', '2C11', '218D                     ', '    ', '    ', '1', '1', '2S', 'F45 ', 'B47U', 'S', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5838', '2C21', '218D A                   ', '    ', '    ', '1', '1', '2S', 'F45 ', 'B47U', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5839', '3D59', '320D XDRIVE RU SKD       ', '3D51', '3D51', '1', '1', 'R3', 'F30 ', 'N47T', 'S', '4', 'L', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5840', '3T71', '435I XDRIVE              ', '    ', '    ', '1', '1', '3K', 'F33 ', 'N55 ', 'S', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5841', '3T81', '435I XDRIVE A            ', '    ', '    ', '1', '1', '3K', 'F33 ', 'N55 ', 'A', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5842', '3T83', '435I XDRIVE A            ', '    ', '    ', '1', '1', '3K', 'F33 ', 'N55 ', 'A', '2', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5843', '3U31', '425D                     ', '    ', '    ', '1', '1', '4', 'F33 ', 'N47T', 'S', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5844', '3U41', '425D A                   ', '    ', '    ', '1', '1', '4', 'F33 ', 'N47T', 'A', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5845', '3U61', '430D A                   ', '    ', '    ', '1', '1', '4', 'F33 ', 'N57T', 'A', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5846', '3U62', '430D A                   ', '    ', '    ', '1', '1', '4', 'F33 ', 'N57T', 'A', '2', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5847', '3V11', '420I                     ', '    ', '    ', '1', '1', '4', 'F33 ', 'N20 ', 'S', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5848', '3V21', '420I A                   ', '    ', '    ', '1', '1', '4', 'F33 ', 'N20 ', 'A', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5849', '3Z62', '330D XDRIVE RL A         ', '    ', '    ', '1', '1', '3D', 'F34 ', 'N57T', 'A', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5850', '4A31', '420I XDRIVE              ', '    ', '    ', '1', '1', '4X', 'F36 ', 'N20 ', 'S', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5851', '4A41', '420I XDRIVE A            ', '    ', '    ', '1', '1', '4X', 'F36 ', 'N20 ', 'A', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5852', '4B31', '435I XDRIVE              ', '    ', '    ', '1', '1', '4X', 'F36 ', 'N55 ', 'S', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5853', '4B41', '435I XDRIVE A            ', '    ', '    ', '1', '1', '4X', 'F36 ', 'N55 ', 'A', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5854', '4B43', '435I XDRIVE A            ', '    ', '    ', '1', '1', '4X', 'F36 ', 'N55 ', 'A', '5', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5855', '4C21', '430D A                   ', '    ', '    ', '1', '1', '4P', 'F36 ', 'N57T', 'A', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5856', '4C41', '430D XDRIVE A            ', '    ', '    ', '1', '1', '4X', 'F36 ', 'N57T', 'A', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5857', '4G21', '435D XDRIVE A            ', '    ', '    ', '1', '1', '4X', 'F36 ', 'N57Z', 'A', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5858', '4T21', '435D XDRIVE A            ', '    ', '    ', '1', '1', '4Y', 'F33 ', 'N57Z', 'A', '2', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5859', '5A46', '520I A                   ', '    ', '    ', '1', '1', 'D5', 'F10 ', 'N20 ', 'A', '4', 'R', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5860', '5A48', '520I A                   ', '5A41', '5A41', '1', '1', 'L5', 'F10 ', 'N20 ', 'A', '4', 'R', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5861', '5A66', '528I A                   ', '5A61', '5A61', '1', '1', 'D5', 'F10 ', 'N20 ', 'A', '4', 'R', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5862', '5B25', '535I A                   ', '5B21', '5B21', '1', '1', 'Y5', 'F10 ', 'N55 ', 'A', '4', 'L', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5863', '5C46', '520D A                   ', '5C41', '5C41', '1', '1', 'D5', 'F10 ', 'N47T', 'A', '4', 'R', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5864', '5C47', '520D A                   ', '5C41', '5C41', '1', '1', 'I5', 'F10 ', 'N47T', 'A', '4', 'R', ' ', 'J', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5865', '5E32', '518D                     ', '    ', '    ', '1', '1', '5', 'F10 ', 'B47O', 'S', '4', 'R', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5866', '5E41', '518D A                   ', '    ', '    ', '1', '1', '5', 'F10 ', 'B47O', 'A', '4', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5867', '5L61', '520D XDRIVE A            ', '    ', '    ', '1', '1', '5X', 'F11 ', 'B47O', 'A', '5', 'L', ' ', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5868', '8Z43', '328I A                   ', '    ', '    ', '1', '1', '3S', 'F34 ', 'N26 ', 'A', '4', 'L', 'U', 'N', ' ', '0');
INSERT INTO `app_car_type` VALUES ('5869', '8Z63', '328I XDRIVE A            ', '    ', '    ', '1', '1', '3D', 'F34 ', 'N26 ', 'A', '4', 'L', 'U', 'N', ' ', '0');



-- ----------------------------
-- Records of app_sys_config
-- ----------------------------
INSERT INTO `app_sys_config` VALUES ('1', null, 'Phone', 'SYS_CONTACT_PHONE', '0986 188 787', null, null, '0', '3', '2013-09-13 15:15:41', '5', '2014-03-06 16:52:57');
INSERT INTO `app_sys_config` VALUES ('2', null, 'Contact Email', 'SYS_CONTACT_EMAIL', 'dtluc@cmc.com.vn', null, null, '0', '3', '2013-09-13 15:16:22', '5', '2014-03-07 11:20:37');
INSERT INTO `app_sys_config` VALUES ('3', null, 'SOS', 'SOS_NUMBER', '[[\"Roadside Service\",\"1-1111-1111\"],[\"Millennium Auto Call Center\",\"2-3333-3333\"],[\"BMW Mobility Service\",\"3-4444-4444\"]]', 'json', '[\"Name\",\"Number\"]', '0', '5', '2014-03-03 03:50:39', '5', '2014-03-12 21:24:02');
INSERT INTO `app_sys_config` VALUES ('4', null, 'Logo', 'LOGO', '{\"real_name\":\"uploads\\/53425b171d21b.png\",\"client_name\":\"BMW_logo.png\"}', 'upload_image', null, '0', '5', '2014-04-07 13:13:51', '5', '2014-04-07 10:00:24');
INSERT INTO `app_sys_config` VALUES ('5', null, 'App Name', 'APP_NAME', 'BMW Car Services', null, null, '0', '5', '2014-04-07 13:14:33', null, null);


-- ----------------------------
-- Records of app_sys_dropdown
-- ----------------------------
INSERT INTO `app_sys_dropdown` VALUES ('1', '3', 'Status', 'STATUS', '[{\"value\":\"0\",\"text\":\"Disactive\"},{\"value\":\"1\",\"text\":\"Active\"}]', '3', '2013-06-23 05:11:23', '1', '2013-10-28 05:21:36', '0', '0');
INSERT INTO `app_sys_dropdown` VALUES ('2', '3', 'Delete', 'DELETE', '[{\"value\":\"0\",\"text\":\"Normal\"},{\"value\":\"-1\",\"text\":\"Deleted\"},{\"value\":\"1\",\"text\":\"Lock\"}]', '3', '2013-06-23 05:13:26', '24', '2013-09-09 14:59:38', '0', '0');
INSERT INTO `app_sys_dropdown` VALUES ('3', '3', 'Menu Type', 'MENUTYPE', '[{\"value\":\"main\",\"text\":\"Main Menu\"},{\"value\":\"admin\",\"text\":\"Admin\"},{\"value\":\"member\",\"text\":\"Dealer\"},{\"value\":\"customer\",\"text\":\"Customer\"},{\"value\":\"isSa\",\"text\":\"Supper Admin\"}]', '3', '2013-07-14 08:02:51', '5', '2014-02-26 09:48:02', '0', '1');
INSERT INTO `app_sys_dropdown` VALUES ('4', '3', 'Roles', 'MEMBER_ROLE', '[{\"value\":\"1\",\"text\":\"Administrator\"},{\"value\":\"2\",\"text\":\"Dealer\"},{\"value\":\"3\",\"text\":\"Customer\"}]', '3', '2013-09-10 13:21:29', '5', '2014-02-26 09:38:36', '0', '1');
INSERT INTO `app_sys_dropdown` VALUES ('5', '13', 'Status', 'Closed', '[{\"value\":\"Closed\",\"text\":\"Canceled\"},{\"value\":\"Open\",\"text\":\"Pending\"}]', '1', '2013-10-28 05:03:45', null, null, '-1', '1');
INSERT INTO `app_sys_dropdown` VALUES ('6', '13', 'ProjectDropdown', 'ProjectDropdown', '[{\"value\":\"1\",\"text\":\"Member\"},{\"value\":\"2\",\"text\":\"PM\"}]', '1', '2013-11-27 04:48:04', null, null, '0', '1');
INSERT INTO `app_sys_dropdown` VALUES ('7', '5', 'Process', 'SCHEDULE_PROCESS', '[{\"value\":\"1\",\"text\":\"New Request\"},{\"value\":\"2\",\"text\":\"Confirmed\"},{\"value\":\"3\",\"text\":\"Pending\"},{\"value\":\"4\",\"text\":\"Completed\"},{\"value\":\"5\",\"text\":\"Cancelled\"}]', '1', '2013-12-04 08:44:10', '5', '2014-03-20 05:40:19', '0', '1');
INSERT INTO `app_sys_dropdown` VALUES ('8', '3', 'Priority Color', 'PRIORITY_COLOR', '[{\"value\":\"FFA8A8\",\"text\":\"Critical\"},{\"value\":\"D698FE\",\"text\":\"High\"},{\"value\":\"A5D3CA\",\"text\":\"Medium\"},{\"value\":\"93EEAA\",\"text\":\"Low\"}]', '5', '2014-01-11 12:43:58', '4', '2014-02-07 09:58:18', '0', '1');



-- ----------------------------
-- Records of app_sys_member
-- ----------------------------
INSERT INTO `app_sys_member` VALUES ('1', '0', 'admin', '8449bad225c8ac6d17fe71cec95bc4ce', 'Admin', 'User', '0', null, null, 'admin@johnsonoh.com', '1', '1', null, '0', '1', '2013-10-24 04:50:52', '5', '2014-03-04 16:11:06', '1', null, null, 'uploads/member/avatar/avatar_52cf5d227d269.jpg', '0', '', '', 'ios', null, null);


-- ----------------------------
-- Records of app_sys_menu
-- ----------------------------
INSERT INTO `app_sys_menu` VALUES ('1', 'system', 'Module', 'system/module', null, '0', 'isSa', '1', '0', '1', '2013-10-24 04:25:02', '1', '2013-10-24 04:27:40', '1');
INSERT INTO `app_sys_menu` VALUES ('2', 'system', 'Menu', 'system/menu', null, '0', 'isSa', '1', '0', '1', '2013-10-24 04:25:36', null, null, '2');
INSERT INTO `app_sys_menu` VALUES ('3', 'system', 'Dropdows', 'system/dropdown', null, '0', 'isSa', '1', '0', '1', '2013-10-24 04:26:26', '1', '2013-10-24 04:26:45', '3');
INSERT INTO `app_sys_menu` VALUES ('4', 'system', 'Resource', 'system/resource', null, '0', 'isSa', '1', '0', '1', '2013-10-24 04:27:12', null, null, '4');
INSERT INTO `app_sys_menu` VALUES ('5', 'system', 'Config', 'system/config', null, '0', 'isSa', '1', '0', '1', '2013-10-24 04:27:33', null, null, '5');
INSERT INTO `app_sys_menu` VALUES ('6', 'system', 'Department', 'system/department', null, '0', 'isSa', '1', '0', '1', '2013-10-24 04:30:32', null, null, '6');
INSERT INTO `app_sys_menu` VALUES ('7', 'member', 'Members', 'member', null, '0', 'admin', '1', '0', '4', '2013-10-24 04:47:16', '1', '2013-12-06 03:04:59', '3');
INSERT INTO `app_sys_menu` VALUES ('31', 'admin', 'Articles', 'admin/article', null, '0', 'admin', '1', '0', '5', '2014-02-24 05:32:41', null, null, '2');
INSERT INTO `app_sys_menu` VALUES ('32', 'admin', 'Services', 'admin/services', null, '0', 'admin', '1', '0', '5', '2014-02-24 07:40:36', null, null, '3');
INSERT INTO `app_sys_menu` VALUES ('33', 'schedule', 'Schedule', 'schedule', null, '0', 'admin', '1', '0', '5', '2014-02-24 10:06:17', null, null, '5');
INSERT INTO `app_sys_menu` VALUES ('34', 'admin', 'Collections', 'admin/collection', null, '0', 'admin', '1', '0', '5', '2014-02-25 09:41:45', null, null, '4');
INSERT INTO `app_sys_menu` VALUES ('35', 'admin', 'Category', 'admin/collection', null, '34', 'admin', '1', '0', '5', '2014-02-25 09:42:23', null, null, '1');
INSERT INTO `app_sys_menu` VALUES ('36', 'admin', 'Products', 'admin/product', null, '34', 'admin', '1', '0', '5', '2014-02-25 09:42:53', null, null, '2');
INSERT INTO `app_sys_menu` VALUES ('37', 'dealer', 'Dealers', 'dealer', null, '0', 'admin', '1', '0', '5', '2014-02-25 10:01:00', '5', '2014-02-26 07:15:43', '3');
INSERT INTO `app_sys_menu` VALUES ('38', 'dealer', 'Dealer', 'dealer/data', null, '0', 'member', '1', '0', '5', '2014-02-26 09:49:31', '5', '2014-02-26 09:50:11', '1');
INSERT INTO `app_sys_menu` VALUES ('39', 'dealer', 'Services', 'dealer/service', null, '0', 'member', '1', '0', '5', '2014-02-26 09:50:04', null, null, '2');
INSERT INTO `app_sys_menu` VALUES ('40', 'dealer', 'Schedule', 'dealer/schedule', null, '0', 'member', '1', '0', '5', '2014-02-26 09:50:43', null, null, '3');
INSERT INTO `app_sys_menu` VALUES ('41', 'system', 'Config', 'system/config', null, '0', 'admin', '1', '0', '2', '2014-02-28 08:21:26', null, null, '7');
INSERT INTO `app_sys_menu` VALUES ('42', 'dealer', 'Time Slot', 'dealer/slot', null, '0', 'member', '1', '0', '5', '2014-04-15 08:22:03', '5', '2014-04-15 08:23:15', '4');
INSERT INTO `app_sys_menu` VALUES ('43', 'dealer', 'Default Settings', 'dealer/slot', null, '42', 'member', '1', '0', '5', '2014-04-15 08:25:20', '5', '2014-04-15 08:31:22', '1');
INSERT INTO `app_sys_menu` VALUES ('44', 'dealer', 'Slot by Date', 'dealer/myslot', null, '42', 'member', '1', '0', '5', '2014-04-15 08:27:35', null, null, '2');


-- ----------------------------
-- Records of app_sys_module
-- ----------------------------
INSERT INTO `app_sys_module` VALUES ('1', 'Common', 'common', 'core', 'Common', '0', '0', '1', '2013-05-28 23:15:54', '3', '2013-06-26 06:02:20', '1');
INSERT INTO `app_sys_module` VALUES ('2', 'Members', 'member', 'core', 'Member', '1', '0', '1', '2013-05-28 23:49:59', '20', '2013-09-06 13:30:40', '2');
INSERT INTO `app_sys_module` VALUES ('3', 'Systems', 'system', 'core', 'System', '1', '0', '1', '2013-06-10 20:57:17', '3', '2013-06-26 05:15:07', '99');
INSERT INTO `app_sys_module` VALUES ('4', 'Home', 'home', 'extend', 'Home', '1', '0', '3', '2013-06-20 12:38:06', '3', '2013-06-22 12:20:31', null);
INSERT INTO `app_sys_module` VALUES ('5', 'Admin', 'admin', 'extend', 'for Admin module', '1', '0', '3', '2013-08-04 12:12:10', '3', '2013-08-04 12:44:09', null);
INSERT INTO `app_sys_module` VALUES ('19', 'Schedule', 'schedule', 'extend', 'Schedule', '1', '0', '5', '2014-02-24 10:05:12', null, null, null);
INSERT INTO `app_sys_module` VALUES ('20', 'Dealer', 'dealer', 'extend', 'Dealer', '1', '0', '5', '2014-02-25 10:00:03', null, null, null);



-- ----------------------------
-- Records of app_sys_resource
-- ----------------------------
INSERT INTO `app_sys_resource` VALUES ('1', 'system', 'Resource', 'system/resource', '[\"1\"]', '1', '1', '2013-10-24 10:56:44', '5', '2014-02-28 08:41:22', '0');
INSERT INTO `app_sys_resource` VALUES ('2', 'system', 'Menu', 'system/menu', '[\"1\"]', '1', '1', '2013-10-24 10:57:06', '5', '2014-02-28 08:40:50', '0');
INSERT INTO `app_sys_resource` VALUES ('3', 'system', 'Roles', 'system/roles', '[\"1\"]', '1', '1', '2013-10-24 10:57:48', null, null, '0');
INSERT INTO `app_sys_resource` VALUES ('4', 'system', 'System Config', 'system/config', '[\"1\"]', '1', '1', '2013-10-24 10:58:09', null, null, '0');
INSERT INTO `app_sys_resource` VALUES ('5', 'system', 'Module', 'system/module', '[\"1\"]', '1', '1', '2013-10-24 10:58:29', null, null, '0');
INSERT INTO `app_sys_resource` VALUES ('6', 'system', 'Department', 'system/department', '[\"1\"]', '1', '1', '2013-10-24 10:58:59', null, null, '0');
INSERT INTO `app_sys_resource` VALUES ('7', 'member', 'Member', 'member/member', '[\"1\"]', '1', '1', '2013-10-24 11:00:17', null, null, '0');
INSERT INTO `app_sys_resource` VALUES ('8', 'member', 'Profile', 'member/profile', '[\"1\",\"2\",\"3\"]', '1', '1', '2013-10-24 11:00:37', null, null, '0');
INSERT INTO `app_sys_resource` VALUES ('9', 'home', 'home', 'home/home', '[\"1\",\"2\",\"3\"]', '1', '1', '2013-10-24 11:01:51', null, null, '0');
INSERT INTO `app_sys_resource` VALUES ('10', 'system', 'Dropdown', 'system/dropdown', '[\"1\"]', '1', '5', '2013-10-24 11:02:42', null, null, '0');
INSERT INTO `app_sys_resource` VALUES ('11', 'dealer', 'Update dealer data', 'dealer/data', '[\"2\"]', '1', '5', '2014-02-28 08:42:26', null, null, '0');
INSERT INTO `app_sys_resource` VALUES ('12', 'dealer', 'Dealer Management', 'dealer/dealer', '[\"1\"]', '1', '5', '2014-02-28 08:43:01', null, null, '0');
INSERT INTO `app_sys_resource` VALUES ('13', 'dealer', 'Dealer Schedule', 'dealer/schedule', '[\"2\"]', '1', '5', '2014-02-28 08:43:32', null, null, '0');
INSERT INTO `app_sys_resource` VALUES ('14', 'dealer', 'Dealer Services', 'dealer/service', '[\"2\"]', '1', '5', '2014-02-28 08:43:54', null, null, '0');
INSERT INTO `app_sys_resource` VALUES ('15', 'home', 'Cars', 'home/car', '[\"1\"]', '1', '5', '2014-02-28 08:44:19', null, null, '0');
INSERT INTO `app_sys_resource` VALUES ('16', 'schedule', 'Admin Schedule', 'schedule/schedule', '[\"1\"]', '1', '5', '2014-02-28 08:45:03', null, null, '0');
INSERT INTO `app_sys_resource` VALUES ('17', 'admin', 'Admin Services', 'admin/services', '[\"1\"]', '1', '5', '2014-02-28 09:11:07', '5', '2014-02-28 09:11:34', '0');
INSERT INTO `app_sys_resource` VALUES ('18', 'admin', 'Admin Collection', 'admin/collection', '[\"1\"]', '1', '5', '2014-02-28 09:12:24', null, null, '0');
INSERT INTO `app_sys_resource` VALUES ('19', 'admin', 'Admin Product', 'admin/product', '[\"1\"]', '1', '5', '2014-02-28 09:12:55', null, null, '0');
INSERT INTO `app_sys_resource` VALUES ('20', 'admin', 'Articles', 'admin/article', '[\"1\"]', '1', '5', '2014-02-28 09:45:47', null, null, '0');
INSERT INTO `app_sys_resource` VALUES ('21', 'dealer', 'Time Slot Default', 'dealer/slot', '[\"1\",\"2\"]', '1', '5', '2014-04-15 08:33:19', null, null, '0');
INSERT INTO `app_sys_resource` VALUES ('22', 'dealer', 'My Time Slot', 'dealer/myslot', '[\"1\",\"2\"]', '1', '5', '2014-04-15 08:33:46', null, null, '0');

-- ----------------------------
-- Records of app_sys_role
-- ----------------------------
INSERT INTO `app_sys_role` VALUES ('1', null, 'Administrator', '0', 'system', '1', '0', '1', '2013-10-24 03:43:16', null, null);
INSERT INTO `app_sys_role` VALUES ('2', null, 'Dealer', '0', 'system', '1', '0', '1', '2013-10-24 03:43:59', '5', '2014-02-26 09:41:04');
INSERT INTO `app_sys_role` VALUES ('3', null, 'Customer', '0', 'system', '1', '0', '1', '2013-10-24 03:44:06', '1', '2013-10-24 04:18:51');

-- ----------------------------
-- Records of app_sys_team
-- ----------------------------

SET FOREIGN_KEY_CHECKS=1;