/*
SQLyog  v12.2.6 (64 bit)
MySQL - 5.7.19-log : Database - wechat
*********************************************************************
*/


/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`wechat` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `wechat`;

/*Table structure for table `TextMessage` */

DROP TABLE IF EXISTS `TextMessage`;

CREATE TABLE `TextMessage` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `Title` varchar(120) DEFAULT NULL,
  `Author` char(50) DEFAULT NULL,
  `Content` varchar(200) DEFAULT NULL,
  `InputCode` char(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `TextMessage` */

insert  into `TextMessage`(`id`,`Title`,`Author`,`Content`,`InputCode`) values 

(1,'ce','ceshi','ceshiceshi','1');

/*Table structure for table `accountName` */

DROP TABLE IF EXISTS `accountName`;

CREATE TABLE `accountName` (
  `id` int(20) NOT NULL DEFAULT '1',
  `name` char(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `accountName` */

insert  into `accountName`(`id`,`name`) values

(1,'ceshi');

/*Table structure for table `message` */

DROP TABLE IF EXISTS `message`;

CREATE TABLE `message` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `Account` char(20) DEFAULT NULL,
  `InputCode` char(50) DEFAULT NULL,
  `MsgType` char(50) DEFAULT NULL,
  `createTime` bigint(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8;

/*Data for the table `message` */

insert  into `message`(`id`,`Account`,`InputCode`,`MsgType`,`createTime`) values

(3,'ceshi','3','image',NULL),

(4,'ceshi','5','image',NULL),

(5,'ceshi','4','music',NULL),

(6,'ceshi','6','voice',NULL),

(7,'ceshi','7','video',NULL),

(8,'ceshi','8','news',NULL),

(9,'ceshi','9','news',NULL),

(18,'ceshi','amnb','text',1529834254980),

(21,'ceshi','add','text',1529842187697),

(25,'ceshi','21','text',1529848026773),

(33,'name','name','text',1529927302913),

(36,'ceshi','添加','text',1529981656848),

(39,'ceshi','1234','text',1530171838928),

(40,'ceshi','g888','text',1530171892161),

(42,'ceshi','wuyu','text',1530521177024),

(43,'ceshi','tianjia','text',1530684984230);

/*Table structure for table `news` */

DROP TABLE IF EXISTS `news`;

CREATE TABLE `news` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `Title` char(50) DEFAULT NULL,
  `Description` varchar(200) DEFAULT NULL,
  `picUrl` varchar(200) DEFAULT NULL,
  `Url` varchar(200) DEFAULT NULL,
  `NewsMessageID` int(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

/*Data for the table `news` */

insert  into `news`(`id`,`Title`,`Description`,`picUrl`,`Url`,`NewsMessageID`) values

(1,'伪微信管理平台','介绍伪微信管理平台','http://6805faf1.ngrok.io/resource/images/big.jpg','www.baidu.com',1),

(2,'图文消息回复','测试多图文消息回复','http://6805faf1.ngrok.io/resource/images/1.jpg','https://mp.weixin.qq.com',1),

(3,'sda','sd','dsa','dsa',2),

(4,'fgd','fdgfd','fdg','sgf',2);

/*Table structure for table `systemuser` */

DROP TABLE IF EXISTS `systemuser`;

CREATE TABLE `systemuser` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `username` char(50) DEFAULT NULL,
  `password` char(50) DEFAULT NULL,
  `true_name` char(50) DEFAULT NULL,
  `sex` char(20) DEFAULT NULL,
  `phone` char(50) DEFAULT NULL,
  `email` char(50) DEFAULT NULL,
  `flag` int(12) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8;

/*Data for the table `systemuser` */

insert  into `systemuser`(`id`,`username`,`password`,`true_name`,`sex`,`phone`,`email`,`flag`) values 

(1,'wechat','wechat','weixin','man','12345678912','123456789@qq.com',1),

(26,'ceshi1','ceshi1','ceshi1','man','12345678977','123@qq.com',2);

/*Table structure for table `weaccount_menu` */

DROP TABLE IF EXISTS `weaccount_menu`;

CREATE TABLE `weaccount_menu` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `Type` char(50) DEFAULT NULL,
  `EventType` char(50) DEFAULT NULL,
  `Name` char(50) DEFAULT NULL,
  `Key` char(50) DEFAULT NULL,
  `URL` varchar(200) DEFAULT NULL,
  `Account` char(50) DEFAULT NULL,
  `Sort` int(20) DEFAULT NULL,
  `PerentID` int(20) DEFAULT NULL,
  `MsgID` int(20) DEFAULT NULL,
  `MsgType` char(50) DEFAULT NULL,
  `createTime` bigint(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `weaccount_menu` */

/*Table structure for table `wechat_message_img` */

DROP TABLE IF EXISTS `wechat_message_img`;

CREATE TABLE `wechat_message_img` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `mediaId` varchar(200) DEFAULT NULL,
  `baseID` int(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `wechat_message_img` */

insert  into `wechat_message_img`(`id`,`mediaId`,`baseID`) values

(1,'C4muTGhOGBn6dPh95WpRiYeS57RcDnTAu7ETQIFHF3A1JOL4RMfHHEKLexTUP9A4',3),

(2,'dhkjsajdla',4);

/*Table structure for table `wechat_message_img_music_video_voice` */

DROP TABLE IF EXISTS `wechat_message_img_music_video_voice`;

CREATE TABLE `wechat_message_img_music_video_voice` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `baseID` int(20) DEFAULT NULL,
  `TextID` int(20) DEFAULT NULL,
  `imageID` int(20) DEFAULT NULL,
  `MusicID` int(20) DEFAULT NULL,
  `VideoID` int(20) DEFAULT NULL,
  `VoiceID` int(20) DEFAULT NULL,
  `NewsID` int(20) DEFAULT NULL,
  `createTime` bigint(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

/*Data for the table `wechat_message_img_music_video_voice` */

insert  into `wechat_message_img_music_video_voice`(`id`,`baseID`,`TextID`,`imageID`,`MusicID`,`VideoID`,`VoiceID`,`NewsID`,`createTime`) values

(1,3,NULL,1,NULL,NULL,NULL,NULL,NULL),

(2,4,NULL,1,NULL,NULL,NULL,NULL,NULL),

(3,5,NULL,NULL,1,NULL,NULL,NULL,NULL),

(4,7,NULL,NULL,NULL,1,NULL,NULL,NULL),

(5,6,NULL,NULL,NULL,NULL,1,NULL,NULL),

(6,1,1,NULL,NULL,NULL,NULL,NULL,NULL),

(7,2,2,NULL,NULL,NULL,NULL,NULL,NULL),

(8,8,NULL,NULL,NULL,NULL,NULL,1,NULL);

/*Table structure for table `wechat_message_music` */

DROP TABLE IF EXISTS `wechat_message_music`;

CREATE TABLE `wechat_message_music` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `Title` char(50) DEFAULT NULL,
  `Description` varchar(200) DEFAULT NULL,
  `MusicUrl` varchar(200) DEFAULT NULL,
  `HQMusicUrl` varchar(200) DEFAULT NULL,
  `ThumbmediaId` varchar(200) DEFAULT NULL,
  `baseID` int(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `wechat_message_music` */

insert  into `wechat_message_music`(`id`,`Title`,`Description`,`MusicUrl`,`HQMusicUrl`,`ThumbmediaId`,`baseID`) values

(1,'see you again','速度与激情7片尾曲','http://6805faf1.ngrok.io/resource/music/SeeYouAgain.mp3','http://6805faf1.ngrok.io/resource/music/SeeYouAgain.mp3','MQ4cHTCqij2qjCkZPG0qY6He9aMLqtiGgxDJlbpvPYc4l4nX28Mo9UWtKdEmkkTw',5);

/*Table structure for table `wechat_message_news` */

DROP TABLE IF EXISTS `wechat_message_news`;

CREATE TABLE `wechat_message_news` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `ArticleCount` int(20) DEFAULT NULL,
  `baseID` int(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `wechat_message_news` */

insert  into `wechat_message_news`(`id`,`ArticleCount`,`baseID`) values

(1,5,8),

(2,3,9);

/*Table structure for table `wechat_message_text` */

DROP TABLE IF EXISTS `wechat_message_text`;

CREATE TABLE `wechat_message_text` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `Title` char(20) DEFAULT NULL,
  `Content` varchar(200) DEFAULT NULL,
  `baseID` int(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;

/*Data for the table `wechat_message_text` */

insert  into `wechat_message_text`(`id`,`Title`,`Content`,`baseID`) values

(7,'xiugai','contentcontentcontentcontent',18),

(8,'content','content',19),

(9,'ceshiADDTEXT','addaddaddaddaddadd',21),

(10,'content','content',25),

(16,'nameaccount','zchaksd',31),

(18,'namexiao','name公众号的消息',33),

(21,'天机123','天天天天天',36),

(22,'content','cont222222222222222nt',37),

(23,'content','cont222222222222222nt',38),

(24,'dsw234','fsgdgsgs',39),

(25,'dsf6666','88888',40),

(26,'wuyuwuyu','wuyu',41),

(27,'wuyu','wuyu',42),

(28,'tianjia','tianjiatianjia',43);

/*Table structure for table `wechat_message_video` */

DROP TABLE IF EXISTS `wechat_message_video`;

CREATE TABLE `wechat_message_video` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `InputCode` char(50) DEFAULT NULL,
  `mediaId` varchar(200) DEFAULT NULL,
  `Title` char(50) DEFAULT NULL,
  `Description` varchar(200) DEFAULT NULL,
  `baseID` int(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `wechat_message_video` */

insert  into `wechat_message_video`(`id`,`InputCode`,`mediaId`,`Title`,`Description`,`baseID`) values

(1,'7','dadksakh','video','video',7);

/*Table structure for table `wechat_message_voice` */

DROP TABLE IF EXISTS `wechat_message_voice`;

CREATE TABLE `wechat_message_voice` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `InputCode` char(50) DEFAULT NULL,
  `mediaId` varchar(200) DEFAULT NULL,
  `createTime` bigint(50) DEFAULT NULL,
  `baseID` int(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `wechat_message_voice` */

insert  into `wechat_message_voice`(`id`,`InputCode`,`mediaId`,`createTime`,`baseID`) values

(1,'6','9cN2OLzfwGNgrmMrpL_FrPDPU7IbZK9RdpzPzt00T62wfSmosFd1LNU0FbqTGdwq',NULL,6);

/*Table structure for table `wechat_account` */

DROP TABLE IF EXISTS `wechat_account`;

CREATE TABLE `wechat_account` (
  `id` int(12) NOT NULL AUTO_INCREMENT,
  `name` char(20) DEFAULT NULL,
  `account` varchar(50) NOT NULL,
  `appid` varchar(50) DEFAULT NULL,
  `appsecret` varchar(120) DEFAULT NULL,
  `url` varchar(120) NOT NULL,
  `token` varchar(120) NOT NULL,
  `create_time` bigint(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8;

/*Data for the table `wechat_account` */

insert  into `wechat_account`(`id`,`name`,`account`,`appid`,`appsecret`,`url`,`token`,`create_time`) values

(23,'ceshi','gh_7e68bfc3dc4c','wxdecdd9d51ea7ed5a','496e4ba6318090e9a0828f333b019619','http://54cac0b6.ngrok.io/WeChat/validate','jgdli43fe83sgqk',1529655728859),

(24,'name','account','wx4b2334691d17792b','327bfab9329ac10d78b10a21c59f822a','http://dea3e61a.ngrok.io/WeChat/validate','tokentoken',1529749185108),

(25,'ligang','gh_7e68bfc3dc4c','wxdecdd9d51ea7ed5a','496e4ba6318090e9a0828f333b019619','http://9c15db9e.ngrok.io/WeChat/validate','l58cbv0zcnmse6x',1529390117809),

(44,'ccc','ccc','ccc','ccc','http://dea3e61a.ngrok.io/WeChat/validate','dp8bo5yqgh67t3s',1530676695901),

(46,'tianjia','tianjia','tianjia','tianjia','http://54cac0b6.ngrok.io/WeChat/validate','px2tdcele48zzsy',1530684734966),

(47,'tianjia','tianjia','tianjia','tianjia','http://54cac0b6.ngrok.io/WeChat/validate','t45vt4jocaidmww',1530684757331);

/*Table structure for table `wechat_account_fans` */

DROP TABLE IF EXISTS `wechat_account_fans`;

CREATE TABLE `wechat_account_fans` (
  `id` int(50) NOT NULL AUTO_INCREMENT,
  `subscribeStatus` int(8) DEFAULT NULL,
  `openID` varchar(200) DEFAULT NULL,
  `nickName` char(50) DEFAULT NULL,
  `sex` int(20) DEFAULT NULL COMMENT '值为1时是男性，值为2时是女性，值为0时是未知',
  `language` char(50) DEFAULT NULL,
  `account` char(50) DEFAULT NULL,
  `city` char(50) DEFAULT NULL,
  `province` char(50) DEFAULT NULL,
  `country` char(50) DEFAULT NULL,
  `subscribeTime` bigint(50) DEFAULT NULL,
  `headimageURL` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

/*Data for the table `wechat_account_fans` */

insert  into `wechat_account_fans`(`id`,`subscribeStatus`,`openID`,`nickName`,`sex`,`language`,`account`,`city`,`province`,`country`,`subscribeTime`,`headimageURL`) values

(8,1,'oV4wc1FPwme8gv1B3O6oxA01_UT4','吴仕宇',1,'en','ceshi','吉安','江西','中国',1529834254980,'http://thirdwx.qlogo.cn/mmopen/gg9HgSMnC0Nv1jWtdIJ6uib91TES69R2MzXibUFb89N8YTSqe3fXuwxJhfWRAcHqfsvCaAt2Bw0Qcju9mCh7RWpIr65OlXEkox/132'),

(16,1,'oV4wc1Jq3cMN2XMzPnce9iAyn26U','谢梦辉',1,'zh_CN','ceshi','南昌','江西','中国',1530604170060,'http://thirdwx.qlogo.cn/mmopen/ajNVdqHZLLAEmTMh8hFS31z0K5lyicwDw6YETzUpvkaCzWyGaxkyjQ5txT9WHvaoxQvrofOFymaLhjaM4AjoSyw/132'),

(17,1,'oV4wc1ARMh9OegqYeavYXcBqcvXM','潇潇暮雨',1,'zh_CN','ceshi','','江西','中国',1530604173163,'http://thirdwx.qlogo.cn/mmopen/2pOb9UNWSyPaJk8bbz6SDibR1pKIJftVmCj6b24wiatrVWC7PLmicuvvT5KQGQianEBD7C6IU2o7ruPiaBv7z7E3ncwpBicaXIrGXJ/132'),

(18,1,'oV4wc1EPErkHAn4zlqcqTX4wDYZc','汐',0,'zh_CN','ceshi','','','',1530685794215,'http://thirdwx.qlogo.cn/mmopen/xIL2ssJ6pC4JNicI4alr1kbr4l1Rswic8ncfsHUPdSwowFxzpuhRITCy6KHkxv1llAkJphAb9qOtk8dVrkVzBJwZaEo8kiaAQib6/132');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
