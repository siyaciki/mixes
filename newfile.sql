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
-- Table structure for 'FlightPlan'	
-- ----------------------------	
DROP TABLE IF EXISTS 'FlightPlan';	
CREATE TABLE `FlightPlan` (
  `name` varchar(50) DEFAULT NULL COMMENT '乘务员名',
  `flightNumber` varchar(50) DEFAULT NULL COMMENT '飞行航班号',
  `flightTime` varchar(50) DEFAULT NULL COMMENT '飞行时间',
  `startAirport` varchar(50) DEFAULT NULL COMMENT '起飞机场',
  `endAirport` varchar(50) DEFAULT NULL COMMENT '目的机场'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='飞行计划表';	
	
-- Table structure for 'FlightStatus'	
-- ----------------------------	
DROP TABLE IF EXISTS 'FlightStatus';	
CREATE TABLE `FlightStatus` (
  `speed` varchar(50) DEFAULT NULL COMMENT '飞行速度',
  `hight` varchar(50) DEFAULT NULL COMMENT '飞行高度',
  `lng` varchar(50) DEFAULT NULL COMMENT '当前经度',
  `lat` varchar(50) DEFAULT NULL COMMENT '当前维度',
  `outsideTemp` varchar(50) DEFAULT NULL COMMENT '舱外温度'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='飞行状态表';	
	
-- Table structure for 'FlyInfoMsg'	
-- ----------------------------	
DROP TABLE IF EXISTS 'FlyInfoMsg';	
CREATE TABLE `FlyInfoMsg` (
  `flightLeg` varchar(50) DEFAULT NULL COMMENT '飞行航段',
  `flightPhase` varchar(50) DEFAULT NULL COMMENT '飞行阶段',
  `icaoAircraftID` varchar(50) DEFAULT NULL COMMENT 'ICAO飞行标识号',
  `currentDate` varchar(50) DEFAULT NULL COMMENT '当前日期',
  `currentTime` varchar(50) DEFAULT NULL COMMENT '当前时间',
  `aircraftRegistration` varchar(50) DEFAULT NULL COMMENT '飞机注册号',
  `flightNumber` varchar(50) DEFAULT NULL COMMENT '飞机航班号',
  `startAirport` varchar(50) DEFAULT NULL COMMENT '起飞机场',
  `endAirport` varchar(50) DEFAULT NULL COMMENT '目的机场',
  `acType` varchar(50) DEFAULT NULL COMMENT '飞机型号编码',
  `fleetIdentification` varchar(50) DEFAULT NULL COMMENT '飞机编队标识号',
  `aircraftManufacturerSN` varchar(50) DEFAULT NULL COMMENT '飞机制造商序列号',
  `takeoffTime` varchar(50) DEFAULT NULL COMMENT '起飞时间',
  `flyTime` varchar(50) DEFAULT NULL COMMENT '已飞行时间',
  `leftTime` varchar(50) DEFAULT NULL COMMENT '剩余飞行时间',
  `TBD` varchar(50) DEFAULT NULL COMMENT '行李转盘号',
  `arrivalTime` varchar(50) DEFAULT NULL COMMENT '预计到达时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='航班信息表，\n飞行信息通知广播表,\nCCS给IFE的飞行信息通知类广播消息 ';	
	
-- Table structure for 'GroundNotice'	
-- ----------------------------	
DROP TABLE IF EXISTS 'GroundNotice';	
CREATE TABLE `GroundNotice` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) DEFAULT NULL COMMENT '标题',
  `content` varchar(50) DEFAULT NULL COMMENT '内容',
  `time` varchar(50) DEFAULT NULL COMMENT '生成时间',
  `userView` varchar(50) DEFAULT NULL COMMENT '查看状态',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='地面通告表';	
	
-- Table structure for 'GuestRequet'	
-- ----------------------------	
DROP TABLE IF EXISTS 'GuestRequet';	
CREATE TABLE `GuestRequet` (
  `name` varchar(50) DEFAULT NULL COMMENT '乘客姓名',
  `seat` varchar(50) DEFAULT NULL COMMENT '座位号',
  `requestTime` varchar(50) DEFAULT NULL COMMENT '请求时间',
  `content` varchar(50) DEFAULT NULL COMMENT '请求内容',
  `status` varchar(50) DEFAULT NULL COMMENT '响应状态',
  `responseUser` varchar(50) DEFAULT NULL COMMENT '响应乘务员姓名',
  `responseTime` varchar(50) DEFAULT NULL COMMENT '响应时间',
  `cover` varchar(50) DEFAULT NULL COMMENT '屏蔽'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='乘客请求信息表';	
	
-- Table structure for 'Guestinfo'	
-- ----------------------------	
DROP TABLE IF EXISTS 'Guestinfo';	
CREATE TABLE `Guestinfo` (
  `name` varchar(50) DEFAULT NULL COMMENT '乘客姓名',
  `type` varchar(50) DEFAULT NULL COMMENT '乘客级别类型',
  `IDCard` varchar(50) DEFAULT NULL COMMENT '身份证号',
  `age` varchar(50) DEFAULT NULL COMMENT '年龄',
  `seat` varchar(50) DEFAULT NULL COMMENT '座位',
  `sex` varchar(50) DEFAULT NULL COMMENT '性别',
  `telephone` varchar(50) DEFAULT NULL COMMENT '电话',
  `birthday` varchar(50) DEFAULT NULL COMMENT '生日',
  `membergrade` varchar(50) DEFAULT NULL COMMENT '会员等级',
  `specialType` varchar(50) DEFAULT NULL COMMENT '特殊类型',
  `specialNeeds` varchar(50) DEFAULT NULL COMMENT '特殊需求',
  `likes` varchar(50) DEFAULT NULL COMMENT '爱好'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='乘客信息表';	
	
-- Table structure for 'GuideInfoMsg'	
-- ----------------------------	
DROP TABLE IF EXISTS 'GuideInfoMsg';	
CREATE TABLE `GuideInfoMsg` (
  `altitude` varchar(50) NOT NULL COMMENT '修正飞行高度',
  `destinationAirport` varchar(50) NOT NULL COMMENT '目的机场',
  `distance2Go` varchar(50) NOT NULL COMMENT '到目的机场距离',
  `groundSpeed` varchar(50) NOT NULL COMMENT '地速',
  `mach` varchar(50) NOT NULL COMMENT '马赫数',
  `originAirport` varchar(50) NOT NULL COMMENT '起飞机场',
  `latitude` varchar(50) NOT NULL COMMENT '当前经度',
  `longitude` varchar(50) NOT NULL COMMENT '当前纬度',
  `staticAirTemperature` varchar(50) NOT NULL COMMENT '大气静温',
  `time2Go` varchar(50) NOT NULL COMMENT '到目的机场时间',
  `trueAirSpeed` varchar(50) NOT NULL COMMENT '真空速',
  `trueTackAngle` varchar(50) NOT NULL COMMENT '真航迹角',
  `trueWindDirection` varchar(50) NOT NULL COMMENT '真风向',
  `windSpeed` varchar(50) NOT NULL COMMENT '风速'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='导航信息通知广播表，\nCCS给IFE的导航信息通知类广播消息 ';	
	
-- Table structure for 'SpecialCase'	
-- ----------------------------	
DROP TABLE IF EXISTS 'SpecialCase';	
CREATE TABLE `SpecialCase` (
  `id` varchar(50) NOT NULL COMMENT '事件编号',
  `time` varchar(50) DEFAULT NULL COMMENT '时间',
  `site` varchar(50) DEFAULT NULL COMMENT '座位号',
  `content` varchar(50) DEFAULT NULL COMMENT '内容',
  `flightNumber` varchar(50) NOT NULL COMMENT '飞行航班号',
  `user` varchar(50) DEFAULT NULL COMMENT '处理乘务人员',
  `result` varchar(50) DEFAULT NULL COMMENT '处理结果',
  `startTime` varchar(50) DEFAULT NULL COMMENT '开始时间',
  `endTime` varchar(50) DEFAULT NULL COMMENT '结束时间',
  `flightStatus` varchar(50) DEFAULT NULL COMMENT '飞行状况',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='特殊事件';	
	
-- Table structure for 'UserInfo'	
-- ----------------------------	
DROP TABLE IF EXISTS 'UserInfo';	
CREATE TABLE `UserInfo` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `name` varchar(50) DEFAULT NULL COMMENT '姓名',
  `password` varchar(50) DEFAULT NULL COMMENT '密码',
  `level` varchar(50) DEFAULT NULL COMMENT '等级',
  `statusView` varchar(50) DEFAULT NULL COMMENT '登录状态',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='乘务员信息';	
	
-- Table structure for 'html_test'	
-- ----------------------------	
DROP TABLE IF EXISTS 'html_test';	
CREATE TABLE `html_test` (
  `loginname` varchar(20) DEFAULT NULL,
  `name` varchar(20) DEFAULT NULL,
  `tel` varchar(20) DEFAULT NULL,
  `mail` varchar(20) DEFAULT NULL,
  `regtime` varchar(20) DEFAULT NULL,
  `status` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;	
	
-- Table structure for 'login_test'	
-- ----------------------------	
DROP TABLE IF EXISTS 'login_test';	
CREATE TABLE `login_test` (
  `id` int(4) NOT NULL AUTO_INCREMENT COMMENT '编码',
  `username` varchar(10) NOT NULL COMMENT '用户名',
  `password` varchar(10) NOT NULL COMMENT '密码',
  `session_id` int(4) DEFAULT NULL COMMENT '状态编号',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=92 DEFAULT CHARSET=utf8;	
	
-- Table structure for 'msg'	
-- ----------------------------	
DROP TABLE IF EXISTS 'msg';	
CREATE TABLE `msg` (
  `title` varchar(50) DEFAULT NULL COMMENT '标题',
  `content` varchar(200) DEFAULT NULL COMMENT '内容',
  `time` varchar(50) DEFAULT NULL COMMENT '时间',
  `name` varchar(50) DEFAULT NULL COMMENT '发布者'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='消息推送';	
	
-- Table structure for 'user'	
-- ----------------------------	
DROP TABLE IF EXISTS 'user';	
CREATE TABLE `user` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;	

---- Data for the table 'GroundNotice'----

insert into 'GroundNotice'('id','title','content','time','userView') values ('1','关于4月份报销发放延迟的通知','2018年4月20日的报销发放延迟到4月27日发放','select','0'),('2','吃饭','中午吃饭','2018年4月18日','0'),('3','吃饭','晚饭吃面','2018年4月18日','0');

---- Data for the table 'UserInfo'----

insert into 'UserInfo'('id','name','password','level','statusView') values ('1','cat','123456','1','0'),('2','王乘务','123456','1','0'),('3','张机长','123456','1','1');

---- Data for the table 'html_test'----

insert into 'html_test'('loginname','name','tel','mail','regtime','status') values ('2','13','34','dsf','sdf','df'),('f','s','d','s','s','s'),('f','g','d','f','e','r'),('g','x','f','x','v','e'),('g','f','h','r','e','w'),('sd','sd','s','sdf','df','sf'),('df','s','s','f','sdfsd','sdf'),('fs','df','s','f','s','s'),('df','a','fs','f','f','s');

---- Data for the table 'login_test'----

insert into 'login_test'('id','username','password','session_id') values ('2','cat','123456','2'),('3','cad','123456','3'),('4','sad','654321','4'),('5','user','pass','9');

---- Data for the table 'msg'----

insert into 'msg'('title','content','time','name') values ('关于4月份报销发放延迟的通知2','2018年4月20日的报销发放延迟到4月27日发放','2018年4月18日','财务部'),('关于2018年劳动节放假安排的通知','2018年4月29日（星期日）至5月1日（星期二）放假调休，共3天','2018年4月11日','行政外联部'),('关于4月份报销发放延迟的通知2','2018年4月20日的报销发放延迟到4月27日发放','2018年4月18日','财务部'),('关于4月份报销发放延迟的通知2','2018年4月20日的报销发放延迟到4月27日发放','2018年4月18日','财务部'),('关于4月份报销发放延迟的通知2','2018年4月20日的报销发放延迟到4月27日发放','2018年4月18日','财务部'),('关于4月份报销发放延迟的通知2','2018年4月20日的报销发放延迟到4月27日发放','2018年4月18日','财务部'),('关于4月份报销发放延迟的通知2','2018年4月20日的报销发放延迟到4月27日发放','2018年4月18日','财务部'),('关于4月份报销发放延迟的通知2','2018年4月20日的报销发放延迟到4月27日发放','2018年4月18日','财务部'),('关于4月份报销发放延迟的通知2','2018年4月20日的报销发放延迟到4月27日发放','2018年4月18日','财务部'),('关于4月份报销发放延迟的通知','2018年4月20日的报销发放延迟到4月27日发放','2018年4月18日','财务部'),('关于4月份报销发放延迟的通知','2018年4月20日的报销发放延迟到4月27日发放','2018年4月18日','财务部'),('关于4月份报销发放延迟的通知','2018年4月20日的报销发放延迟到4月27日发放','2018年4月18日','财务部'),('关于4月份报销发放延迟的通知','2018年4月20日的报销发放延迟到4月27日发放','2018年4月18日','财务部'),('关于4月份报销发放延迟的通知','2018年4月20日的报销发放延迟到4月27日发放','2018年4月18日','财务部'),('关于4月份报销发放延迟的通知','2018年4月20日的报销发放延迟到4月27日发放','2018年4月18日','财务部'),('关于4月份报销发放延迟的通知','2018年4月20日的报销发放延迟到4月27日发放','2018年4月18日','财务部'),('关于4月份报销发放延迟的通知','2018年4月20日的报销发放延迟到4月27日发放','2018年4月18日','财务部'),('关于4月份报销发放延迟的通知','2018年4月20日的报销发放延迟到4月27日发放','2018年4月18日','财务部'),('关于4月份报销发放延迟的通知','2018年4月20日的报销发放延迟到4月27日发放','2018年4月18日','财务部'),('关于4月份报销发放延迟的通知','2018年4月20日的报销发放延迟到4月27日发放','2018年4月18日','财务部'),('关于4月份报销发放延迟的通知','2018年4月20日的报销发放延迟到4月27日发放','2018年4月18日','财务部'),('关于4月份报销发放延迟的通知','2018年4月20日的报销发放延迟到4月27日发放','2018年4月18日','财务部'),('关于4月份报销发放延迟的通知','2018年4月20日的报销发放延迟到4月27日发放','2018年4月18日','财务部'),('关于4月份报销发放延迟的通知','2018年4月20日的报销发放延迟到4月27日发放','2018年4月18日','财务部'),('关于4月份报销发放延迟的通知','2018年4月20日的报销发放延迟到4月27日发放','2018年4月18日','财务部'),('关于4月份报销发放延迟的通知','2018年4月20日的报销发放延迟到4月27日发放','2018年4月18日','财务部'),('关于4月份报销发放延迟的通知','2018年4月20日的报销发放延迟到4月27日发放','2018年4月18日','财务部'),('关于4月份报销发放延迟的通知','2018年4月20日的报销发放延迟到4月27日发放','2018年4月18日','财务部'),('关于4月份报销发放延迟的通知','2018年4月20日的报销发放延迟到4月27日发放','2018年4月18日','财务部'),('关于4月份报销发放延迟的通知','2018年4月20日的报销发放延迟到4月27日发放','2018年4月18日','财务部'),('关于4月份报销发放延迟的通知','2018年4月20日的报销发放延迟到4月27日发放','2018年4月18日','财务部'),('关于4月份报销发放延迟的通知','2018年4月20日的报销发放延迟到4月27日发放','2018年4月18日','财务部');

---- Data for the table 'user'----

insert into 'user'('id','username','password') values ('1','tom','123456'),('2','cat','123456'),('3','red','123456');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;