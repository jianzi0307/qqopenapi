/*
SQLyog Ultimate v12.08 (64 bit)
MySQL - 5.6.23-log : Database - db_ucenter
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`db_ucenter` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `db_ucenter`;

/*Table structure for table `app_cash` */

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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='充值表';

/*Table structure for table `app_cash_logs` */

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
  `paytime` int(11) DEFAULT NULL COMMENT '支付时间',
  `createtime` int(11) DEFAULT NULL COMMENT '创建时间',
  `ip` varchar(15) DEFAULT NULL COMMENT 'ip地址',
  `rate` int(11) DEFAULT NULL COMMENT '充值比例',
  `token` varchar(255) NOT NULL COMMENT 'TOken',
  `status` tinyint(1) DEFAULT '0' COMMENT '0 订单产生， 1订单完成',
  PRIMARY KEY (`id`),
  KEY `token` (`token`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COMMENT='充值流水记录表';

/*Table structure for table `app_user` */

DROP TABLE IF EXISTS `app_user`;

CREATE TABLE `app_user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增ID作为用户ID',
  `platform` varchar(50) DEFAULT 'local' COMMENT '平台',
  `openid` varchar(255) DEFAULT NULL COMMENT '平台账号',
  `createtime` int(11) DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `openid` (`openid`)
) ENGINE=InnoDB AUTO_INCREMENT=10003 DEFAULT CHARSET=utf8;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
