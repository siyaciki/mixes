/*
SQLyog Ultimate v12.08 (64 bit)
    
MySQL - 5.7.20-0ubuntu0.17.04.1 : Database - iWO_test
    
*********************************************************************
    
*/
/*!40101 SET NAMES utf8 */;
/*!40101 SET SQL_MODE=''*/;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;	
-- Table structure for 'connection_list'	
-- ----------------------------	
DROP TABLE IF EXISTS 'connection_list';	
CREATE TABLE `connection_list` (
  `id` int(13) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `ground_addr` varchar(50) NOT NULL COMMENT '地面地址',
  `flight_addr` varchar(50) NOT NULL COMMENT '机上地址',
  PRIMARY KEY (`id`),
  KEY `id` (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='网络信号表';	
	
-- Table structure for 'crew_device'	
-- ----------------------------	
DROP TABLE IF EXISTS 'crew_device';	
CREATE TABLE `crew_device` (
  `id` int(13) NOT NULL COMMENT '编号',
  `device_seral` varchar(11) NOT NULL COMMENT '设备编号'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='乘务员设备授权表';	
	
-- Table structure for 'crew_info'	
-- ----------------------------	
DROP TABLE IF EXISTS 'crew_info';	
CREATE TABLE `crew_info` (
  `id` int(50) NOT NULL AUTO_INCREMENT COMMENT '乘务编号',
  `name` varchar(50) NOT NULL COMMENT '姓名',
  `password` varchar(50) NOT NULL COMMENT '密码',
  `level` int(1) NOT NULL COMMENT '等级',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='乘务员信息表';	
	
-- Table structure for 'crew_login'	
-- ----------------------------	
DROP TABLE IF EXISTS 'crew_login';	
CREATE TABLE `crew_login` (
  `id` int(13) NOT NULL COMMENT '编号',
  `crew_id` int(11) NOT NULL COMMENT '登录用户',
  `device_seral` varchar(11) NOT NULL COMMENT '设备串号',
  `login_time` int(11) NOT NULL COMMENT '登录时间',
  `token` varchar(50) NOT NULL COMMENT '登录状态'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='乘务员登录表,\n只有登录信息，token包含 登录用户的id（判断请求合法性），登录设备（判断';	
	
-- Table structure for 'destination_info'	
-- ----------------------------	
DROP TABLE IF EXISTS 'destination_info';	
CREATE TABLE `destination_info` (
  `id` int(11) NOT NULL COMMENT '目的地编号',
  `destination` varchar(50) NOT NULL COMMENT '目的地',
  `weather` varchar(50) NOT NULL COMMENT '当地天气',
  `temperature` varchar(50) NOT NULL COMMENT '当地温度'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='目的地信息表';	
	
-- Table structure for 'event_record'	
-- ----------------------------	
DROP TABLE IF EXISTS 'event_record';	
CREATE TABLE `event_record` (
  `id` int(11) NOT NULL COMMENT '事件编号',
  `content` varchar(50) NOT NULL COMMENT '事件内容',
  `record_time` int(10) NOT NULL COMMENT '事件时间',
  `flight_id` varchar(50) NOT NULL COMMENT '航班编号',
  `crew_id` varchar(50) NOT NULL COMMENT '乘务编号'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='特殊事件日志记录';	
	
-- Table structure for 'flight_dispatch'	
-- ----------------------------	
DROP TABLE IF EXISTS 'flight_dispatch';	
CREATE TABLE `flight_dispatch` (
  `id` int(11) NOT NULL COMMENT '调度编号',
  `flight_id` varchar(50) NOT NULL COMMENT '航班编号',
  `dispatch_time` int(10) NOT NULL COMMENT '调度时间',
  `dispatch_content` varchar(50) NOT NULL COMMENT '调度内容',
  `crew_id` varchar(50) NOT NULL COMMENT '乘务编号'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='飞行调度表';	
	
-- Table structure for 'flight_info'	
-- ----------------------------	
DROP TABLE IF EXISTS 'flight_info';	
CREATE TABLE `flight_info` (
  `id` int(11) NOT NULL COMMENT '航班信息编号',
  `flight_id` varchar(50) NOT NULL COMMENT '航班编号',
  `origin` varchar(50) NOT NULL COMMENT '出发地',
  `ac_type` varchar(6) NOT NULL COMMENT '飞机型号',
  `takeoff_time` int(10) NOT NULL COMMENT '起飞时间',
  `fly_time` int(10) NOT NULL COMMENT '飞行时间',
  `tail_number` int(6) NOT NULL COMMENT '机尾号',
  `distance` int(10) NOT NULL COMMENT '飞行距离',
  `destination` varchar(50) NOT NULL COMMENT '目的地'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='航班信息表，\n航班编号为航班号及航班时间综合';	
	
-- Table structure for 'msg'	
-- ----------------------------	
DROP TABLE IF EXISTS 'msg';	
CREATE TABLE `msg` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '消息编号',
  `title` varchar(50) NOT NULL COMMENT '标题',
  `content` varchar(50) NOT NULL COMMENT '内容',
  `flight_id` varchar(50) NOT NULL COMMENT '航班编号',
  `push_time` varchar(10) NOT NULL COMMENT '推送时间',
  `crew_id` varchar(50) NOT NULL COMMENT '乘务编号',
  KEY `id` (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='乘务消息推送表';	
	
-- Table structure for 'passenger_info'	
-- ----------------------------	
DROP TABLE IF EXISTS 'passenger_info';	
CREATE TABLE `passenger_info` (
  `id` int(11) NOT NULL COMMENT '乘客编号',
  `name` varchar(50) NOT NULL COMMENT '乘客姓名',
  `type` int(1) NOT NULL COMMENT '乘客类型',
  `id_card` varchar(18) NOT NULL COMMENT '身份证号',
  `age` int(3) NOT NULL COMMENT '年龄',
  `seat` varchar(10) NOT NULL COMMENT '座位',
  `sex` varchar(2) NOT NULL COMMENT '性别',
  `telephone` int(11) NOT NULL COMMENT '电话',
  `birthday` varchar(50) NOT NULL COMMENT '生日',
  `level` int(1) NOT NULL COMMENT '会员等级',
  `special` int(1) NOT NULL COMMENT '特殊类型',
  `requirement` varchar(50) NOT NULL COMMENT '特殊需求',
  `hobby` varchar(50) NOT NULL COMMENT '爱好'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='乘客信息表';	
	
-- Table structure for 'passenger_notice'	
-- ----------------------------	
DROP TABLE IF EXISTS 'passenger_notice';	
CREATE TABLE `passenger_notice` (
  `id` int(11) NOT NULL COMMENT '公告id',
  `title` varchar(20) NOT NULL COMMENT '标题',
  `type` int(1) NOT NULL COMMENT '类型',
  `content_path` varchar(50) NOT NULL COMMENT '内容路径'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='乘客公告表';	
	
-- Table structure for 'passenger_request'	
-- ----------------------------	
DROP TABLE IF EXISTS 'passenger_request';	
CREATE TABLE `passenger_request` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '请求编号',
  `passenger_id` varchar(50) NOT NULL COMMENT '乘客编号',
  `name` varchar(50) NOT NULL COMMENT '乘客姓名',
  `seat` varchar(50) NOT NULL COMMENT '座位号',
  `content` varchar(50) NOT NULL COMMENT '请求内容',
  `response_status` int(1) NOT NULL COMMENT '响应状态',
  `requestTime` int(10) NOT NULL COMMENT '请求时间',
  `responseTime` int(10) NOT NULL COMMENT '响应时间',
  `crew_id` varchar(50) NOT NULL COMMENT '乘务编号',
  KEY `id` (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='乘客请求信息表，\nresponse_status  0 未处理，1';	
	
-- Table structure for 'scripts_exec'	
-- ----------------------------	
DROP TABLE IF EXISTS 'scripts_exec';	
CREATE TABLE `scripts_exec` (
  `id` int(13) NOT NULL COMMENT '编号',
  `token` varchar(50) NOT NULL COMMENT '脚本内容'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='脚本表';	

---- Data for the table 'connection_list'----

insert into 'connection_list'('id','ground_addr','flight_addr') values ('1','192.168.1.35','192.168.1.112');

---- Data for the table 'crew_info'----

insert into 'crew_info'('id','name','password','level') values ('1','cat','e10adc3949ba59abbe56e057f20f883e','0'),('2','admin','e10adc3949ba59abbe56e057f20f883e','1');

---- Data for the table 'msg'----

insert into 'msg'('id','title','content','flight_id','push_time','crew_id') values ('1','注意','12A需要喝水','A67112','1528356772','2');

---- Data for the table 'passenger_request'----

insert into 'passenger_request'('id','passenger_id','name','seat','content','response_status','requestTime','responseTime','crew_id') values ('1','02023','王小二','12A','喝水','0','1528356592','1528356772','1'),('2','02031','孙小小','14B','喝水','1','1528356772','1528356780','2');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;