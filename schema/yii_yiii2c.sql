-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: 2014-11-14 11:22:46
-- 服务器版本： 5.6.17
-- PHP Version: 5.5.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `yii_yiii2c`
--

-- --------------------------------------------------------

--
-- 表的结构 `admin`
--

CREATE TABLE IF NOT EXISTS `admin` (
  `admin_id` int(32) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(64) NOT NULL DEFAULT '',
  `password_hash` varchar(64) NOT NULL DEFAULT '',
  `password_reset_token` varchar(64) DEFAULT NULL,
  `auth_key` varchar(64) NOT NULL,
  `email` varchar(256) NOT NULL DEFAULT '',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `created_at` int(32) unsigned DEFAULT NULL,
  `updated_at` int(32) unsigned DEFAULT NULL,
  PRIMARY KEY (`admin_id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='管理员' AUTO_INCREMENT=2 ;

--
-- 转存表中的数据 `admin`
--

INSERT INTO `admin` (`admin_id`, `username`, `password_hash`, `password_reset_token`, `auth_key`, `email`, `status`, `created_at`, `updated_at`) VALUES
(1, 'admin', '$2y$13$JfKXfW9EsPIpiCMxvvolGukBupXW7aHC.L6A/ONdhP/nbEo34Wc1m', '6RLM7Yyp1QbQ7Lh5CanaF6xRYsE9IoHj_1414552757', 'rMkzfyB-2Cz03Zug5XE7bMgjNFPyacEG', 'song_de_qiang@sina.com', 1, 1414551874, 1415958858);

-- --------------------------------------------------------

--
-- 表的结构 `admin_assignment`
--

CREATE TABLE IF NOT EXISTS `admin_assignment` (
  `item_name` varchar(64) NOT NULL,
  `user_id` varchar(64) NOT NULL,
  `created_at` int(32) unsigned NOT NULL,
  PRIMARY KEY (`item_name`,`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `admin_item`
--

CREATE TABLE IF NOT EXISTS `admin_item` (
  `name` varchar(64) NOT NULL,
  `type` int(11) NOT NULL,
  `description` text,
  `rule_name` varchar(64) DEFAULT NULL,
  `data` text,
  `created_at` int(32) unsigned NOT NULL,
  `updated_at` int(32) unsigned NOT NULL,
  PRIMARY KEY (`name`),
  KEY `rule_name` (`rule_name`),
  KEY `type` (`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `admin_item`
--

INSERT INTO `admin_item` (`name`, `type`, `description`, `rule_name`, `data`, `created_at`, `updated_at`) VALUES
('Administrator', 1, 'Administrator', NULL, NULL, 1415257803, 1415257803),
('Guest', 1, 'Guest', NULL, NULL, 1415257853, 1415257853),
('Super', 1, 'Super Administrator', NULL, NULL, 1415257762, 1415257762);

-- --------------------------------------------------------

--
-- 表的结构 `admin_item_child`
--

CREATE TABLE IF NOT EXISTS `admin_item_child` (
  `parent` varchar(64) NOT NULL,
  `child` varchar(64) NOT NULL,
  PRIMARY KEY (`parent`,`child`),
  KEY `child` (`child`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `admin_item_child`
--

INSERT INTO `admin_item_child` (`parent`, `child`) VALUES
('Super', 'Administrator'),
('Administrator', 'Guest');

-- --------------------------------------------------------

--
-- 表的结构 `admin_rule`
--

CREATE TABLE IF NOT EXISTS `admin_rule` (
  `name` varchar(64) NOT NULL,
  `data` text,
  `created_at` int(32) unsigned NOT NULL,
  `updated_at` int(32) unsigned NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `contact`
--

CREATE TABLE IF NOT EXISTS `contact` (
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='联络我们' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `content`
--

CREATE TABLE IF NOT EXISTS `content` (
  `content_id` int(32) unsigned NOT NULL,
  `parent_id` int(32) unsigned DEFAULT NULL,
  `sort_order` int(32) unsigned NOT NULL DEFAULT '0',
  `created_at` int(32) unsigned NOT NULL,
  `updated_at` int(32) unsigned NOT NULL,
  PRIMARY KEY (`content_id`),
  UNIQUE KEY `information_id` (`content_id`),
  KEY `parent_id` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='静态页';

-- --------------------------------------------------------

--
-- 表的结构 `content_i18n`
--

CREATE TABLE IF NOT EXISTS `content_i18n` (
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='静态页语言' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `customer`
--

CREATE TABLE IF NOT EXISTS `customer` (
  `customer_id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_type_id` int(32) unsigned DEFAULT '1',
  `username` varchar(64) NOT NULL,
  `password_hash` varchar(64) NOT NULL,
  `password_reset_token` varchar(64) DEFAULT NULL,
  `auth_key` varchar(64) NOT NULL,
  `email` varchar(256) NOT NULL,
  `status` tinyint(1) unsigned NOT NULL DEFAULT '10',
  `created_at` int(32) unsigned NOT NULL,
  `updated_at` int(32) unsigned NOT NULL,
  PRIMARY KEY (`customer_id`),
  KEY `customer_type_id` (`customer_type_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='客户' AUTO_INCREMENT=3 ;

--
-- 转存表中的数据 `customer`
--

INSERT INTO `customer` (`customer_id`, `customer_type_id`, `username`, `password_hash`, `password_reset_token`, `auth_key`, `email`, `status`, `created_at`, `updated_at`) VALUES
(2, 1, 'admin', '$2y$13$JfKXfW9EsPIpiCMxvvolGukBupXW7aHC.L6A/ONdhP/nbEo34Wc1m', '6RLM7Yyp1QbQ7Lh5CanaF6xRYsE9IoHj_1414552757', 'rMkzfyB-2Cz03Zug5XE7bMgjNFPyacEG', 'song_de_qiang@sina.com', 1, 1414551874, 1414552757);

-- --------------------------------------------------------

--
-- 表的结构 `customer_type`
--

CREATE TABLE IF NOT EXISTS `customer_type` (
  `customer_type_id` int(32) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `sort_order` int(32) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `created_at` int(32) unsigned NOT NULL,
  `updated_at` int(32) unsigned NOT NULL,
  PRIMARY KEY (`customer_type_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='客户类型' AUTO_INCREMENT=2 ;

--
-- 转存表中的数据 `customer_type`
--

INSERT INTO `customer_type` (`customer_type_id`, `name`, `sort_order`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Default', 0, 1, 1414461361, 1414461361);

-- --------------------------------------------------------

--
-- 表的结构 `information`
--

CREATE TABLE IF NOT EXISTS `information` (
  `information_id` int(32) unsigned NOT NULL,
  `sort_order` int(32) unsigned NOT NULL DEFAULT '0',
  `created_at` int(32) unsigned NOT NULL,
  `updated_at` int(32) unsigned NOT NULL,
  PRIMARY KEY (`information_id`),
  UNIQUE KEY `information_id` (`information_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='讯息页';

-- --------------------------------------------------------

--
-- 表的结构 `information_i18n`
--

CREATE TABLE IF NOT EXISTS `information_i18n` (
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
  KEY `resource_id` (`resource_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='讯息页语言' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `information_to_type`
--

CREATE TABLE IF NOT EXISTS `information_to_type` (
  `information_to_type_id` int(64) unsigned NOT NULL,
  `information_type_id` int(32) unsigned NOT NULL,
  `information_id` int(32) unsigned NOT NULL,
  PRIMARY KEY (`information_to_type_id`),
  KEY `information_id` (`information_id`),
  KEY `information_type_id` (`information_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='讯息页分类关系';

-- --------------------------------------------------------

--
-- 表的结构 `information_type`
--

CREATE TABLE IF NOT EXISTS `information_type` (
  `information_type_id` int(32) unsigned NOT NULL AUTO_INCREMENT,
  `sort_order` int(32) unsigned NOT NULL DEFAULT '0',
  `created_at` int(32) unsigned NOT NULL,
  `updated_at` int(32) unsigned NOT NULL,
  PRIMARY KEY (`information_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='讯息页分类' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `information_type_i18n`
--

CREATE TABLE IF NOT EXISTS `information_type_i18n` (
  `information_type_i18n_id` int(64) unsigned NOT NULL AUTO_INCREMENT,
  `information_type_id` int(32) unsigned NOT NULL,
  `language_id` int(32) unsigned NOT NULL,
  `title` varchar(256) NOT NULL,
  `keywords` varchar(1024) NOT NULL,
  `description` text NOT NULL,
  PRIMARY KEY (`information_type_i18n_id`),
  KEY `information_type_id` (`information_type_id`),
  KEY `language_id` (`language_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='讯息页分类语言' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `language`
--

CREATE TABLE IF NOT EXISTS `language` (
  `language_id` int(32) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(8) NOT NULL,
  `name` varchar(64) NOT NULL,
  `sort_order` int(32) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`language_id`),
  UNIQUE KEY `code_UNIQUE` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='语言' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `picture`
--

CREATE TABLE IF NOT EXISTS `picture` (
  `picture_id` int(32) unsigned NOT NULL AUTO_INCREMENT,
  `picture_type_id` int(32) unsigned NOT NULL,
  `sort_order` int(32) unsigned NOT NULL DEFAULT '0',
  `created_at` int(32) unsigned NOT NULL,
  `updated_at` int(32) unsigned NOT NULL,
  PRIMARY KEY (`picture_id`),
  KEY `picture_type_id` (`picture_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='图片' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `picture_i18n`
--

CREATE TABLE IF NOT EXISTS `picture_i18n` (
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
  KEY `resouce_id` (`resouce_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='图片语言' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `picture_type`
--

CREATE TABLE IF NOT EXISTS `picture_type` (
  `picture_type_id` int(32) unsigned NOT NULL AUTO_INCREMENT,
  `sort_order` int(32) unsigned NOT NULL DEFAULT '0',
  `created_at` int(32) unsigned NOT NULL,
  `updated_at` int(32) unsigned NOT NULL,
  PRIMARY KEY (`picture_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='图片分组' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `picture_type_i18n`
--

CREATE TABLE IF NOT EXISTS `picture_type_i18n` (
  `picture_type_i18n_id` int(64) unsigned NOT NULL AUTO_INCREMENT,
  `picture_type_id` int(32) unsigned NOT NULL,
  `language_id` int(32) unsigned NOT NULL,
  `title` varchar(256) DEFAULT NULL,
  PRIMARY KEY (`picture_type_i18n_id`),
  KEY `picture_type_id` (`picture_type_id`),
  KEY `language_id` (`language_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='图片分类语言' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `product`
--

CREATE TABLE IF NOT EXISTS `product` (
  `product_id` int(32) unsigned NOT NULL AUTO_INCREMENT,
  `sort_order` int(32) NOT NULL,
  `created_at` int(32) unsigned NOT NULL,
  `updated_at` int(32) unsigned NOT NULL,
  PRIMARY KEY (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商品' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `product_i18n`
--

CREATE TABLE IF NOT EXISTS `product_i18n` (
  `product_i18n_id` int(64) unsigned NOT NULL AUTO_INCREMENT,
  `product_id` int(32) unsigned NOT NULL,
  `language_id` int(32) unsigned NOT NULL,
  `title` varchar(256) NOT NULL,
  `keywords` varchar(1024) NOT NULL,
  `description` text NOT NULL,
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`product_i18n_id`),
  KEY `product_id` (`product_id`),
  KEY `language_id` (`language_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商品语言' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `product_image`
--

CREATE TABLE IF NOT EXISTS `product_image` (
  `product_image_id` int(64) NOT NULL AUTO_INCREMENT,
  `product_id` int(32) unsigned NOT NULL,
  `resource_id` int(65) unsigned NOT NULL,
  PRIMARY KEY (`product_image_id`),
  KEY `product_id` (`product_id`),
  KEY `resource_id` (`resource_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商品图片' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `product_to_type`
--

CREATE TABLE IF NOT EXISTS `product_to_type` (
  `product_to_type_id` int(64) unsigned NOT NULL AUTO_INCREMENT,
  `product_type_id` int(32) unsigned NOT NULL,
  `product_id` int(32) unsigned NOT NULL,
  PRIMARY KEY (`product_to_type_id`),
  KEY `product_type_id` (`product_type_id`),
  KEY `product_id` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商品分类关系' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `product_type`
--

CREATE TABLE IF NOT EXISTS `product_type` (
  `product_type_id` int(32) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int(32) DEFAULT NULL,
  `sort_order` int(32) unsigned NOT NULL,
  `created_at` int(32) unsigned NOT NULL,
  `updated_at` int(32) unsigned NOT NULL,
  PRIMARY KEY (`product_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商品分类' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `product_type_i18n`
--

CREATE TABLE IF NOT EXISTS `product_type_i18n` (
  `product_type_i18n_id` int(64) unsigned NOT NULL AUTO_INCREMENT,
  `product_type_id` int(32) unsigned NOT NULL,
  `language_id` int(32) unsigned NOT NULL,
  `title` varchar(256) NOT NULL,
  `keywords` varchar(1024) NOT NULL,
  `description` text NOT NULL,
  PRIMARY KEY (`product_type_i18n_id`),
  KEY `product_type_id` (`product_type_id`),
  KEY `language_id` (`language_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商品分类语言' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `resource`
--

CREATE TABLE IF NOT EXISTS `resource` (
  `resource_id` int(64) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(1024) NOT NULL COMMENT '原始档名',
  `url` varchar(256) NOT NULL COMMENT '路径',
  PRIMARY KEY (`resource_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='统一存储' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `system`
--

CREATE TABLE IF NOT EXISTS `system` (
  `key` varchar(64) NOT NULL,
  `value` text NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='系统配置';

--
-- 限制导出的表
--

--
-- 限制表 `admin_assignment`
--
ALTER TABLE `admin_assignment`
  ADD CONSTRAINT `admin_assignment_ibfk_1` FOREIGN KEY (`item_name`) REFERENCES `admin_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- 限制表 `admin_item`
--
ALTER TABLE `admin_item`
  ADD CONSTRAINT `admin_item_ibfk_1` FOREIGN KEY (`rule_name`) REFERENCES `admin_rule` (`name`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- 限制表 `admin_item_child`
--
ALTER TABLE `admin_item_child`
  ADD CONSTRAINT `admin_item_child_ibfk_1` FOREIGN KEY (`parent`) REFERENCES `admin_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `admin_item_child_ibfk_2` FOREIGN KEY (`child`) REFERENCES `admin_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- 限制表 `content`
--
ALTER TABLE `content`
  ADD CONSTRAINT `content_ibfk_1` FOREIGN KEY (`parent_id`) REFERENCES `content` (`content_id`) ON UPDATE CASCADE;

--
-- 限制表 `customer`
--
ALTER TABLE `customer`
  ADD CONSTRAINT `customer_type+id` FOREIGN KEY (`customer_type_id`) REFERENCES `customer_type` (`customer_type_id`) ON UPDATE CASCADE;

--
-- 限制表 `information_i18n`
--
ALTER TABLE `information_i18n`
  ADD CONSTRAINT `information_id` FOREIGN KEY (`information_id`) REFERENCES `information` (`information_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `language_id` FOREIGN KEY (`language_id`) REFERENCES `language` (`language_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `resource_id` FOREIGN KEY (`resource_id`) REFERENCES `resource` (`resource_id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- 限制表 `information_to_type`
--
ALTER TABLE `information_to_type`
  ADD CONSTRAINT `information_to_type_ibfk_1` FOREIGN KEY (`information_id`) REFERENCES `information` (`information_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `information_to_type_ibfk_2` FOREIGN KEY (`information_type_id`) REFERENCES `information_type` (`information_type_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- 限制表 `information_type_i18n`
--
ALTER TABLE `information_type_i18n`
  ADD CONSTRAINT `information_type_i18n_ibfk_1` FOREIGN KEY (`information_type_id`) REFERENCES `information_type` (`information_type_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `information_type_i18n_ibfk_2` FOREIGN KEY (`language_id`) REFERENCES `language` (`language_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- 限制表 `picture`
--
ALTER TABLE `picture`
  ADD CONSTRAINT `picture_ibfk_1` FOREIGN KEY (`picture_type_id`) REFERENCES `picture_type` (`picture_type_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- 限制表 `picture_i18n`
--
ALTER TABLE `picture_i18n`
  ADD CONSTRAINT `picture_i18n_ibfk_1` FOREIGN KEY (`picture_id`) REFERENCES `picture` (`picture_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `picture_i18n_ibfk_2` FOREIGN KEY (`language_id`) REFERENCES `language` (`language_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `picture_i18n_ibfk_3` FOREIGN KEY (`resouce_id`) REFERENCES `resource` (`resource_id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- 限制表 `picture_type_i18n`
--
ALTER TABLE `picture_type_i18n`
  ADD CONSTRAINT `picture_type_i18n_ibfk_1` FOREIGN KEY (`picture_type_id`) REFERENCES `picture_type` (`picture_type_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `picture_type_i18n_ibfk_2` FOREIGN KEY (`language_id`) REFERENCES `language` (`language_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- 限制表 `product_i18n`
--
ALTER TABLE `product_i18n`
  ADD CONSTRAINT `product_i18n_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `product_i18n_ibfk_2` FOREIGN KEY (`language_id`) REFERENCES `language` (`language_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- 限制表 `product_image`
--
ALTER TABLE `product_image`
  ADD CONSTRAINT `product_image_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `product_image_ibfk_2` FOREIGN KEY (`resource_id`) REFERENCES `resource` (`resource_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- 限制表 `product_to_type`
--
ALTER TABLE `product_to_type`
  ADD CONSTRAINT `product_to_type_ibfk_1` FOREIGN KEY (`product_type_id`) REFERENCES `product_type` (`product_type_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `product_to_type_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- 限制表 `product_type_i18n`
--
ALTER TABLE `product_type_i18n`
  ADD CONSTRAINT `product_type_i18n_ibfk_1` FOREIGN KEY (`product_type_id`) REFERENCES `product_type` (`product_type_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `product_type_i18n_ibfk_2` FOREIGN KEY (`language_id`) REFERENCES `language` (`language_id`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
