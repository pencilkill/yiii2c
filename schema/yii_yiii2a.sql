/*
Navicat MySQL Data Transfer

Source Server         : 127.0.0.1_3306
Source Server Version : 50617
Source Host           : 127.0.0.1:3306
Source Database       : yii_yiii2a

Target Server Type    : MYSQL
Target Server Version : 50617
File Encoding         : 65001

Date: 2014-10-28 19:07:08
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `admin_id` int(32) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(64) NOT NULL DEFAULT '',
  `password` varchar(64) NOT NULL DEFAULT '',
  `salt` varchar(32) NOT NULL,
  `email` varchar(256) NOT NULL DEFAULT '',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `create_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `update_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`admin_id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='管理员';

-- ----------------------------
-- Records of admin
-- ----------------------------

-- ----------------------------
-- Table structure for admin_assignment
-- ----------------------------
DROP TABLE IF EXISTS `admin_assignment`;
CREATE TABLE `admin_assignment` (
  `item_name` varchar(64) NOT NULL,
  `user_id` varchar(64) NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`item_name`,`user_id`),
  CONSTRAINT `admin_assignment_ibfk_1` FOREIGN KEY (`item_name`) REFERENCES `admin_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of admin_assignment
-- ----------------------------

-- ----------------------------
-- Table structure for admin_item
-- ----------------------------
DROP TABLE IF EXISTS `admin_item`;
CREATE TABLE `admin_item` (
  `name` varchar(64) NOT NULL,
  `type` int(11) NOT NULL,
  `description` text,
  `rule_name` varchar(64) DEFAULT NULL,
  `data` text,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`name`),
  KEY `rule_name` (`rule_name`),
  KEY `type` (`type`),
  CONSTRAINT `admin_item_ibfk_1` FOREIGN KEY (`rule_name`) REFERENCES `admin_rule` (`name`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of admin_item
-- ----------------------------

-- ----------------------------
-- Table structure for admin_item_child
-- ----------------------------
DROP TABLE IF EXISTS `admin_item_child`;
CREATE TABLE `admin_item_child` (
  `parent` varchar(64) NOT NULL,
  `child` varchar(64) NOT NULL,
  PRIMARY KEY (`parent`,`child`),
  KEY `child` (`child`),
  CONSTRAINT `admin_item_child_ibfk_1` FOREIGN KEY (`parent`) REFERENCES `admin_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `admin_item_child_ibfk_2` FOREIGN KEY (`child`) REFERENCES `admin_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of admin_item_child
-- ----------------------------

-- ----------------------------
-- Table structure for admin_rule
-- ----------------------------
DROP TABLE IF EXISTS `admin_rule`;
CREATE TABLE `admin_rule` (
  `name` varchar(64) NOT NULL,
  `data` text,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of admin_rule
-- ----------------------------

-- ----------------------------
-- Table structure for content
-- ----------------------------
DROP TABLE IF EXISTS `content`;
CREATE TABLE `content` (
  `content_id` int(32) unsigned NOT NULL,
  `parent_id` int(32) unsigned DEFAULT NULL,
  `sort_order` int(32) unsigned NOT NULL DEFAULT '0',
  `create_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `update_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`content_id`),
  UNIQUE KEY `information_id` (`content_id`),
  KEY `parent_id` (`parent_id`),
  CONSTRAINT `content_ibfk_1` FOREIGN KEY (`parent_id`) REFERENCES `content` (`content_id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='静态页';

-- ----------------------------
-- Records of content
-- ----------------------------

-- ----------------------------
-- Table structure for content_i18n
-- ----------------------------
DROP TABLE IF EXISTS `content_i18n`;
CREATE TABLE `content_i18n` (
  `content_i18n_id` int(64) unsigned NOT NULL AUTO_INCREMENT,
  `content_id` int(32) unsigned NOT NULL,
  `language_id` int(32) unsigned NOT NULL,
  `title` varchar(256) NOT NULL DEFAULT '',
  `keywords` varchar(1024) NOT NULL DEFAULT '',
  `description` text NOT NULL,
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`content_i18n_id`),
  KEY `information_id` (`content_id`),
  KEY `language_id` (`language_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='静态页语言';

-- ----------------------------
-- Records of content_i18n
-- ----------------------------

-- ----------------------------
-- Table structure for customer
-- ----------------------------
DROP TABLE IF EXISTS `customer`;
CREATE TABLE `customer` (
  `customer_id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_type_id` int(32) unsigned NOT NULL,
  `username` varchar(64) NOT NULL,
  `password` varchar(64) NOT NULL,
  `salt` varchar(32) NOT NULL,
  `email` varchar(256) NOT NULL,
  `first_name` varchar(64) NOT NULL DEFAULT '',
  `last_name` varchar(64) NOT NULL DEFAULT '',
  `approval` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `create_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `update_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`customer_id`),
  KEY `customer_type_id` (`customer_type_id`),
  CONSTRAINT `customer_type+id` FOREIGN KEY (`customer_type_id`) REFERENCES `customer_type` (`customer_type_id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='客户';

-- ----------------------------
-- Records of customer
-- ----------------------------

-- ----------------------------
-- Table structure for customer_type
-- ----------------------------
DROP TABLE IF EXISTS `customer_type`;
CREATE TABLE `customer_type` (
  `customer_type_id` int(32) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `sort_order` int(32) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `create_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `update_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`customer_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='客户类型';

-- ----------------------------
-- Records of customer_type
-- ----------------------------

-- ----------------------------
-- Table structure for information
-- ----------------------------
DROP TABLE IF EXISTS `information`;
CREATE TABLE `information` (
  `information_id` int(32) unsigned NOT NULL,
  `sort_order` int(32) unsigned NOT NULL DEFAULT '0',
  `create_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `update_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`information_id`),
  UNIQUE KEY `information_id` (`information_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='讯息页';

-- ----------------------------
-- Records of information
-- ----------------------------

-- ----------------------------
-- Table structure for information_i18n
-- ----------------------------
DROP TABLE IF EXISTS `information_i18n`;
CREATE TABLE `information_i18n` (
  `information_i18n_id` int(64) unsigned NOT NULL AUTO_INCREMENT,
  `information_id` int(32) unsigned NOT NULL,
  `language_id` int(32) unsigned NOT NULL,
  `title` varchar(256) NOT NULL DEFAULT '',
  `keywords` varchar(1024) NOT NULL DEFAULT '',
  `description` text NOT NULL,
  `resource_id` int(64) unsigned DEFAULT NULL,
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`information_i18n_id`),
  KEY `information_id` (`information_id`),
  KEY `language_id` (`language_id`),
  KEY `resource_id` (`resource_id`),
  CONSTRAINT `information_id` FOREIGN KEY (`information_id`) REFERENCES `information` (`information_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `language_id` FOREIGN KEY (`language_id`) REFERENCES `language` (`language_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `resource_id` FOREIGN KEY (`resource_id`) REFERENCES `resource` (`resource_id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='讯息页语言';

-- ----------------------------
-- Records of information_i18n
-- ----------------------------

-- ----------------------------
-- Table structure for information_to_type
-- ----------------------------
DROP TABLE IF EXISTS `information_to_type`;
CREATE TABLE `information_to_type` (
  `information_to_type_id` int(64) unsigned NOT NULL,
  `information_type_id` int(32) unsigned NOT NULL,
  `information_id` int(32) unsigned NOT NULL,
  PRIMARY KEY (`information_to_type_id`),
  KEY `information_id` (`information_id`),
  KEY `information_type_id` (`information_type_id`),
  CONSTRAINT `information_to_type_ibfk_1` FOREIGN KEY (`information_id`) REFERENCES `information` (`information_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `information_to_type_ibfk_2` FOREIGN KEY (`information_type_id`) REFERENCES `information_type` (`information_type_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='讯息页分类关系';

-- ----------------------------
-- Records of information_to_type
-- ----------------------------

-- ----------------------------
-- Table structure for information_type
-- ----------------------------
DROP TABLE IF EXISTS `information_type`;
CREATE TABLE `information_type` (
  `information_type_id` int(32) unsigned NOT NULL AUTO_INCREMENT,
  `sort_order` int(32) unsigned NOT NULL DEFAULT '0',
  `create_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`information_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='讯息页分类';

-- ----------------------------
-- Records of information_type
-- ----------------------------

-- ----------------------------
-- Table structure for information_type_i18n
-- ----------------------------
DROP TABLE IF EXISTS `information_type_i18n`;
CREATE TABLE `information_type_i18n` (
  `information_type_i18n_id` int(64) unsigned NOT NULL AUTO_INCREMENT,
  `information_type_id` int(32) unsigned NOT NULL,
  `language_id` int(32) unsigned NOT NULL,
  `title` varchar(256) NOT NULL,
  `keywords` varchar(1024) NOT NULL,
  `description` text NOT NULL,
  PRIMARY KEY (`information_type_i18n_id`),
  KEY `information_type_id` (`information_type_id`),
  KEY `language_id` (`language_id`),
  CONSTRAINT `information_type_i18n_ibfk_1` FOREIGN KEY (`information_type_id`) REFERENCES `information_type` (`information_type_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `information_type_i18n_ibfk_2` FOREIGN KEY (`language_id`) REFERENCES `language` (`language_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='讯息页分类语言';

-- ----------------------------
-- Records of information_type_i18n
-- ----------------------------

-- ----------------------------
-- Table structure for language
-- ----------------------------
DROP TABLE IF EXISTS `language`;
CREATE TABLE `language` (
  `language_id` int(32) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(8) NOT NULL,
  `name` varchar(64) NOT NULL,
  `sort_order` int(32) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`language_id`),
  UNIQUE KEY `code_UNIQUE` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='语言';

-- ----------------------------
-- Records of language
-- ----------------------------

-- ----------------------------
-- Table structure for message
-- ----------------------------
DROP TABLE IF EXISTS `message`;
CREATE TABLE `message` (
  `message_id` int(64) unsigned NOT NULL AUTO_INCREMENT,
  `first_name` varchar(256) NOT NULL,
  `last_name` varchar(256) NOT NULL,
  `gender` tinyint(1) unsigned NOT NULL,
  `email` varchar(256) NOT NULL,
  `cellphone` varchar(32) NOT NULL,
  `telephone` varchar(32) NOT NULL,
  `address` varchar(1024) NOT NULL,
  `message` text NOT NULL,
  PRIMARY KEY (`message_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='联络我们';

-- ----------------------------
-- Records of message
-- ----------------------------

-- ----------------------------
-- Table structure for picture
-- ----------------------------
DROP TABLE IF EXISTS `picture`;
CREATE TABLE `picture` (
  `picture_id` int(32) unsigned NOT NULL AUTO_INCREMENT,
  `picture_type_id` int(32) unsigned NOT NULL,
  `sort_order` int(32) unsigned NOT NULL DEFAULT '0',
  `create_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `update_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`picture_id`),
  KEY `picture_type_id` (`picture_type_id`),
  CONSTRAINT `picture_ibfk_1` FOREIGN KEY (`picture_type_id`) REFERENCES `picture_type` (`picture_type_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='图片';

-- ----------------------------
-- Records of picture
-- ----------------------------

-- ----------------------------
-- Table structure for picture_i18n
-- ----------------------------
DROP TABLE IF EXISTS `picture_i18n`;
CREATE TABLE `picture_i18n` (
  `picture_i18n_id` int(64) unsigned NOT NULL AUTO_INCREMENT,
  `picture_id` int(32) unsigned NOT NULL,
  `language_id` int(32) unsigned NOT NULL,
  `title` varchar(256) DEFAULT NULL,
  `keywords` varchar(1024) DEFAULT NULL,
  `description` text,
  `resouce_id` int(64) unsigned DEFAULT NULL,
  `target` varchar(32) NOT NULL,
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`picture_i18n_id`),
  KEY `picture_id` (`picture_id`),
  KEY `langage_id` (`language_id`),
  KEY `resouce_id` (`resouce_id`),
  CONSTRAINT `picture_i18n_ibfk_1` FOREIGN KEY (`picture_id`) REFERENCES `picture` (`picture_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `picture_i18n_ibfk_2` FOREIGN KEY (`language_id`) REFERENCES `language` (`language_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `picture_i18n_ibfk_3` FOREIGN KEY (`resouce_id`) REFERENCES `resource` (`resource_id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='图片语言';

-- ----------------------------
-- Records of picture_i18n
-- ----------------------------

-- ----------------------------
-- Table structure for picture_type
-- ----------------------------
DROP TABLE IF EXISTS `picture_type`;
CREATE TABLE `picture_type` (
  `picture_type_id` int(32) unsigned NOT NULL AUTO_INCREMENT,
  `sort_order` int(32) unsigned NOT NULL DEFAULT '0',
  `create_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `update_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`picture_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='图片分组';

-- ----------------------------
-- Records of picture_type
-- ----------------------------

-- ----------------------------
-- Table structure for picture_type_i18n
-- ----------------------------
DROP TABLE IF EXISTS `picture_type_i18n`;
CREATE TABLE `picture_type_i18n` (
  `picture_type_i18n_id` int(64) unsigned NOT NULL AUTO_INCREMENT,
  `picture_type_id` int(32) unsigned NOT NULL,
  `language_id` int(32) unsigned NOT NULL,
  `title` varchar(256) DEFAULT NULL,
  PRIMARY KEY (`picture_type_i18n_id`),
  KEY `picture_type_id` (`picture_type_id`),
  KEY `language_id` (`language_id`),
  CONSTRAINT `picture_type_i18n_ibfk_1` FOREIGN KEY (`picture_type_id`) REFERENCES `picture_type` (`picture_type_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `picture_type_i18n_ibfk_2` FOREIGN KEY (`language_id`) REFERENCES `language` (`language_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='图片分类语言';

-- ----------------------------
-- Records of picture_type_i18n
-- ----------------------------

-- ----------------------------
-- Table structure for product
-- ----------------------------
DROP TABLE IF EXISTS `product`;
CREATE TABLE `product` (
  `product_id` int(32) unsigned NOT NULL AUTO_INCREMENT,
  `sort_order` int(32) NOT NULL,
  `create_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商品';

-- ----------------------------
-- Records of product
-- ----------------------------

-- ----------------------------
-- Table structure for product_i18n
-- ----------------------------
DROP TABLE IF EXISTS `product_i18n`;
CREATE TABLE `product_i18n` (
  `product_i18n_id` int(64) unsigned NOT NULL AUTO_INCREMENT,
  `product_id` int(32) unsigned NOT NULL,
  `language_id` int(32) unsigned NOT NULL,
  `title` varchar(256) NOT NULL,
  `keywords` varchar(1024) NOT NULL,
  `description` text NOT NULL,
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`product_i18n_id`),
  KEY `product_id` (`product_id`),
  KEY `language_id` (`language_id`),
  CONSTRAINT `product_i18n_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `product_i18n_ibfk_2` FOREIGN KEY (`language_id`) REFERENCES `language` (`language_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商品语言';

-- ----------------------------
-- Records of product_i18n
-- ----------------------------

-- ----------------------------
-- Table structure for product_image
-- ----------------------------
DROP TABLE IF EXISTS `product_image`;
CREATE TABLE `product_image` (
  `product_image_id` int(64) NOT NULL AUTO_INCREMENT,
  `product_id` int(32) unsigned NOT NULL,
  `resource_id` int(65) unsigned NOT NULL,
  PRIMARY KEY (`product_image_id`),
  KEY `product_id` (`product_id`),
  KEY `resource_id` (`resource_id`),
  CONSTRAINT `product_image_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `product_image_ibfk_2` FOREIGN KEY (`resource_id`) REFERENCES `resource` (`resource_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商品图片';

-- ----------------------------
-- Records of product_image
-- ----------------------------

-- ----------------------------
-- Table structure for product_to_type
-- ----------------------------
DROP TABLE IF EXISTS `product_to_type`;
CREATE TABLE `product_to_type` (
  `product_to_type_id` int(64) unsigned NOT NULL AUTO_INCREMENT,
  `product_type_id` int(32) unsigned NOT NULL,
  `product_id` int(32) unsigned NOT NULL,
  PRIMARY KEY (`product_to_type_id`),
  KEY `product_type_id` (`product_type_id`),
  KEY `product_id` (`product_id`),
  CONSTRAINT `product_to_type_ibfk_1` FOREIGN KEY (`product_type_id`) REFERENCES `product_type` (`product_type_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `product_to_type_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商品分类关系';

-- ----------------------------
-- Records of product_to_type
-- ----------------------------

-- ----------------------------
-- Table structure for product_type
-- ----------------------------
DROP TABLE IF EXISTS `product_type`;
CREATE TABLE `product_type` (
  `product_type_id` int(32) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int(32) DEFAULT NULL,
  `sort_order` int(32) unsigned NOT NULL,
  `create_at` timestamp NOT NULL,
  `update_at` timestamp NOT NULL,
  PRIMARY KEY (`product_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商品分类';

-- ----------------------------
-- Records of product_type
-- ----------------------------

-- ----------------------------
-- Table structure for product_type_i18n
-- ----------------------------
DROP TABLE IF EXISTS `product_type_i18n`;
CREATE TABLE `product_type_i18n` (
  `product_type_i18n_id` int(64) unsigned NOT NULL AUTO_INCREMENT,
  `product_type_id` int(32) unsigned NOT NULL,
  `language_id` int(32) unsigned NOT NULL,
  `title` varchar(256) NOT NULL,
  `keywords` varchar(1024) NOT NULL,
  `description` text NOT NULL,
  PRIMARY KEY (`product_type_i18n_id`),
  KEY `product_type_id` (`product_type_id`),
  KEY `language_id` (`language_id`),
  CONSTRAINT `product_type_i18n_ibfk_1` FOREIGN KEY (`product_type_id`) REFERENCES `product_type` (`product_type_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `product_type_i18n_ibfk_2` FOREIGN KEY (`language_id`) REFERENCES `language` (`language_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商品分类语言';

-- ----------------------------
-- Records of product_type_i18n
-- ----------------------------

-- ----------------------------
-- Table structure for resource
-- ----------------------------
DROP TABLE IF EXISTS `resource`;
CREATE TABLE `resource` (
  `resource_id` int(64) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(1024) NOT NULL COMMENT '原始档名',
  `url` varchar(256) NOT NULL COMMENT '路径',
  PRIMARY KEY (`resource_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='统一存储';

-- ----------------------------
-- Records of resource
-- ----------------------------

-- ----------------------------
-- Table structure for system
-- ----------------------------
DROP TABLE IF EXISTS `system`;
CREATE TABLE `system` (
  `key` varchar(64) NOT NULL,
  `value` text NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='系统配置';

-- ----------------------------
-- Records of system
-- ----------------------------
