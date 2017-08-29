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
