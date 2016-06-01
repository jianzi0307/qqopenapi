# ************************************************************
# Sequel Pro SQL dump
# Version 4499
#
# http://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Host: 127.0.0.1 (MySQL 5.6.23-log)
# Database: db_ucenter
# Generation Time: 2016-06-01 15:28:25 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table app_cash
# ------------------------------------------------------------

DROP TABLE IF EXISTS `app_cash`;

CREATE TABLE `app_cash` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `userid` varchar(255) DEFAULT NULL COMMENT '用户ID',
  `goldtotal` bigint(20) DEFAULT '0' COMMENT '总元宝数/Q点',
  `rmbtotal` float DEFAULT '0' COMMENT '总人民币数（单位元）',
  `extratotal` bigint(20) DEFAULT '0',
  `createtime` int(11) DEFAULT NULL COMMENT '创建时间',
  `updatetime` int(11) DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `userid` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='充值表';



# Dump of table app_cash_logs
# ------------------------------------------------------------

DROP TABLE IF EXISTS `app_cash_logs`;

CREATE TABLE `app_cash_logs` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `orderno` varchar(255) DEFAULT NULL COMMENT '订单',
  `platform` varchar(50) DEFAULT NULL COMMENT '平台',
  `serverid` int(11) DEFAULT NULL COMMENT '服务器ID',
  `userid` varchar(255) DEFAULT NULL COMMENT '用户ID',
  `rmb` float DEFAULT '0' COMMENT '人民币单位（元）',
  `gold` int(11) DEFAULT '0' COMMENT '元宝数/Q点数',
  `extra` int(11) DEFAULT '0' COMMENT '元宝数/Q点数',
  `payitem` varchar(255) DEFAULT NULL COMMENT '支付项',
  `paytime` int(11) DEFAULT NULL COMMENT '支付时间',
  `createtime` int(11) DEFAULT NULL COMMENT '创建时间',
  `ip` varchar(15) DEFAULT NULL COMMENT 'ip地址',
  `rate` int(11) DEFAULT NULL COMMENT '充值比例',
  `token` varchar(255) NOT NULL COMMENT 'TOken',
  `status` tinyint(1) DEFAULT '0' COMMENT '0 订单产生， 1订单完成',
  `payamt_coins` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `token` (`token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='充值流水记录表';



# Dump of table app_user
# ------------------------------------------------------------

DROP TABLE IF EXISTS `app_user`;

CREATE TABLE `app_user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增ID作为用户ID',
  `platform` varchar(50) DEFAULT 'local' COMMENT '平台',
  `openid` varchar(255) DEFAULT NULL COMMENT '平台账号',
  `createtime` int(11) DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `openid` (`openid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;




/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
