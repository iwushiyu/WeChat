/*
SQLyog Ultimate v12.5.0 (64 bit)
MySQL - 5.7.12 : Database - wechat
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

/*Table structure for table `account_name` */

DROP TABLE IF EXISTS `account_name`;

CREATE TABLE `account_name` (
  `id` int(20) NOT NULL DEFAULT '1',
  `name` char(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `account_name` */

insert  into `account_name`(`id`,`name`) values 
(1,'ceshi');

/*Table structure for table `news` */

DROP TABLE IF EXISTS `news`;

CREATE TABLE `news` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `Title` char(50) DEFAULT NULL,
  `Description` varchar(200) DEFAULT NULL,
  `PicUrl` varchar(200) DEFAULT NULL,
  `Url` varchar(200) DEFAULT NULL,
  `NewsMessageID` int(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

/*Data for the table `news` */

insert  into `news`(`id`,`Title`,`Description`,`PicUrl`,`Url`,`NewsMessageID`) values 
(1,'伪微信管理平台','介绍伪微信管理平台','http://23c32214i1.imwork.net/statics/resource/images/big.jpg','www.baidu.com',1),
(2,'图文消息回复','测试多图文消息回复','http://23c32214i1.imwork.net/statics/resource/images/1.jpg','https://mp.weixin.qq.com',1),
(3,'sda','sd','http://23c32214i1.imwork.net/statics/resource/images/1.jpg','dsa',2),
(4,'fgd','fd','fdg','sgf',2);

/*Table structure for table `system_menu` */

DROP TABLE IF EXISTS `system_menu`;

CREATE TABLE `system_menu` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `menu_name` varchar(200) DEFAULT NULL,
  `father_id` int(20) DEFAULT '0',
  `child_catalog` varchar(200) DEFAULT NULL,
  `menu_describe` varchar(1500) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `system_menu` */

insert  into `system_menu`(`id`,`menu_name`,`father_id`,`child_catalog`,`menu_describe`) values 
(2,'系统设置',0,NULL,'<a class=\"\" href=\"javascript:;\"><i class=\"layui-icon layui-icon-set-sm\" aria-hidden=\"true\"></i><span> 系统设置</span></a><dl class=\"layui-nav-child\"><dd><a href=\"javascript:;\" data-url=\"/User/list\" data-icon=\"&#xe770\" data-title=\"用户管理\" kit-target data-id=\'1\'><i class=\"layui-icon layui-icon-user\" aria-hidden=\"true\"></i><span> 用户管理</span></a></dd><dd><a href=\"javascript:;\" data-url=\"/System/accountInformation\" data-icon=\"&#xe655;\" data-title=\"公众号信息\" kit-target data-id=\'2\' ><i class=\"layui-icon\" aria-hidden=\"true\">&#xe655;</i><span> 公众号信息</span></a></dd></dl>');

/*Table structure for table `system_role` */

DROP TABLE IF EXISTS `system_role`;

CREATE TABLE `system_role` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `role_name` varchar(200) DEFAULT NULL,
  `role_describe` varchar(200) DEFAULT NULL,
  `create_time` bigint(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

/*Data for the table `system_role` */

insert  into `system_role`(`id`,`role_name`,`role_describe`,`create_time`) values 
(1,'超级管理员','系统管理员',NULL),
(2,'admin','管理员',NULL),
(3,'user','运营人员',NULL);

/*Table structure for table `system_role_menu` */

DROP TABLE IF EXISTS `system_role_menu`;

CREATE TABLE `system_role_menu` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `role_id` int(20) DEFAULT NULL,
  `menu_id` int(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

/*Data for the table `system_role_menu` */

insert  into `system_role_menu`(`id`,`role_id`,`menu_id`) values 
(1,1,2),
(12,2,2);

/*Table structure for table `system_user` */

DROP TABLE IF EXISTS `system_user`;

CREATE TABLE `system_user` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `username` char(50) DEFAULT NULL,
  `password` char(50) DEFAULT NULL,
  `true_name` char(50) DEFAULT NULL,
  `sex` int(8) DEFAULT NULL,
  `phone` char(50) DEFAULT NULL,
  `email` char(50) DEFAULT NULL,
  `role_id` int(20) DEFAULT NULL,
  `create_time` bigint(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=64 DEFAULT CHARSET=utf8;

/*Data for the table `system_user` */

insert  into `system_user`(`id`,`username`,`password`,`true_name`,`sex`,`phone`,`email`,`role_id`,`create_time`) values 
(1,'wechat','wechat','weixin',1,'18795453333','968434555@qq.com',1,1556526736383),
(26,'ceshicc','ceshicc','ceshi',1,'18795453333','968434555@qq.com',3,1556526736383),
(30,'ertyu','ertyu','ertyu',0,'18795453333','968434555@qq.com',1,1555930567095),
(53,'ppppppp','pppp','ppbb',2,'18797997979','869456683@qq.com',3,1556526736383),
(57,'nnnnnn','nnnnnn','nnnnnn',2,'18797993029','968734245@qq.com',3,1556005959539),
(60,'zhucecc','zhuce','zhuce',0,'18797992095','976864843@qq.com',1,1556008214230),
(61,'ccfawfa','gseegs','gseegs',2,'18697995463','913453433@qq.com',3,1556526786136),
(62,'trewq','trewq','trewq',2,'18797005074','913489875@qq.com',1,1557499659140),
(63,'newuser1','newuser1','newuser1',0,'18797445673','845435478@qq.com',3,1557564441149);

/*Table structure for table `text_message` */

DROP TABLE IF EXISTS `text_message`;

CREATE TABLE `text_message` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `title` varchar(120) DEFAULT NULL,
  `author` char(50) DEFAULT NULL,
  `content` varchar(200) DEFAULT NULL,
  `input_code` char(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `text_message` */

insert  into `text_message`(`id`,`title`,`author`,`content`,`input_code`) values 
(1,'ce','ceshi','ceshiceshi','1');

/*Table structure for table `user_account` */

DROP TABLE IF EXISTS `user_account`;

CREATE TABLE `user_account` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `user_id` int(20) DEFAULT NULL,
  `account_id` int(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=60 DEFAULT CHARSET=utf8;

/*Data for the table `user_account` */

insert  into `user_account`(`id`,`user_id`,`account_id`) values 
(1,1,23),
(2,1,24),
(3,1,25),
(4,26,23),
(5,26,46),
(6,26,47),
(32,49,50),
(33,1,53),
(34,1,54),
(36,1,56),
(37,1,57),
(42,1,62),
(45,1,65),
(46,1,66),
(47,61,23),
(48,49,25),
(49,26,25),
(56,62,23),
(57,62,25),
(59,63,23);

/*Table structure for table `weaccount_menu` */

DROP TABLE IF EXISTS `weaccount_menu`;

CREATE TABLE `weaccount_menu` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `type` char(50) DEFAULT NULL,
  `event_type` char(50) DEFAULT NULL,
  `name` char(50) DEFAULT NULL,
  `key` char(50) DEFAULT NULL,
  `url` varchar(500) DEFAULT NULL,
  `account` char(50) DEFAULT NULL,
  `sort` int(20) DEFAULT NULL,
  `perent_id` int(20) DEFAULT NULL,
  `message_id` int(20) DEFAULT NULL,
  `message_type` char(50) DEFAULT NULL,
  `create_time` bigint(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `weaccount_menu` */

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
) ENGINE=InnoDB AUTO_INCREMENT=67 DEFAULT CHARSET=utf8;

/*Data for the table `wechat_account` */

insert  into `wechat_account`(`id`,`name`,`account`,`appid`,`appsecret`,`url`,`token`,`create_time`) values 
(23,'ceshi','gh_7e68bfc3dc4c','wxdecdd9d51ea7ed5a','496e4ba6318090e9a0828f333b019619','http://23c32214i1.imwork.net/WeChat/validate','htzhs6knyy4rswd',1529655728859),
(24,'自己测试','dwadaagggg','wx4b2334691d17792b','327bfab9329ac10d78b10a21c59f822a','http://dea3e61a.ngrok.io/WeChat/validate','tokentoken',0),
(25,'自己的公众号','gh_9e67cb1ff649','wx4b2334691d17792b','5c26d4464c9d2030be0866badd36567d','http://23c32214i1.imwork.net/WeChat/validate','l58cbv0zcnmse6x',1529390117809),
(46,'tianjia','tianjia','tianjia','tianjia','http://54cac0b6.ngrok.io/WeChat/validate','px2tdcele48zzsy',1530684734966),
(47,'wwwww','wwwww','wwwww','wwww','http://23c32214i1.imwork.net/WeChat/validate','m60ay7nodevs5bb',1552875410019),
(48,'tianjiaceshi','457774ewd','fesfesfes','fsgrdgdrgdssf','http://23c32214i1.imwork.net/WeChat/validate','38x5ac4s',1556154789513),
(49,'textcccc','textcccc','textcccc','textcccc','http://23c32214i1.imwork.net/WeChat/validate','jogpvyxj',1556155225425),
(50,'cesefesf','cesefesf','cesefesf','cesefesf','http://23c32214i1.imwork.net/WeChat/validate','rocmxxsrm2fqoje',1556156382474),
(52,'thtthtd','thtthtd','thtthtd','thtthtd','http://23c32214i1.imwork.net/WeChat/validate','yh4jtjufjbfzbod',1556156676759),
(53,'ytjytjtj','ytjytjtj','ytjytjtj','ytjytjtj','http://23c32214i1.imwork.net/WeChat/validate','f1p0s82r4yej5w5',1556156949596),
(56,'ghsaljgse','ghsaljgse','ghsaljgse','ghsaljgse','http://23c32214i1.imwork.net/WeChat/validate','3ow829pxa8kguy5',1556157305750),
(57,'ada4444','adafagf','adafagf','adafagf','http://23c32214i1.imwork.net/WeChat/validate','mks9l30cmmb5u90',0),
(58,'wafagfswg','wafagfswg','wafagfswg','wafagfswg','http://23c32214i1.imwork.net/WeChat/validate','mkqaai7flftq9u1',1556157866005),
(62,'rsgsrh','rsgsrh','rsgsrh','rsgsrh','http://23c32214i1.imwork.net/WeChat/validate','lp7plnmfwuktk4b',1556158951978),
(65,'wgwsgt','wgwsgt','wgwsgt','wgwsgt','http://23c32214i1.imwork.net/WeChat/validate','htzhs6knyy4rswd',1556160056144),
(66,'rsgesegas','rsaaaaaaa','rsgesegas','rsgesegas','http://23c32214i1.imwork.net/WeChat/validate','2pwbv5lfo7gqwls',0);

/*Table structure for table `wechat_account_fans` */

DROP TABLE IF EXISTS `wechat_account_fans`;

CREATE TABLE `wechat_account_fans` (
  `id` int(50) NOT NULL AUTO_INCREMENT,
  `subscribe_status` int(8) DEFAULT NULL,
  `open_id` varchar(200) DEFAULT NULL,
  `nick_name` char(50) DEFAULT NULL,
  `sex` int(20) DEFAULT NULL COMMENT '值为1时是男性，值为2时是女性，值为0时是未知',
  `language` char(50) DEFAULT NULL,
  `account` char(50) DEFAULT NULL,
  `city` char(50) DEFAULT NULL,
  `province` char(50) DEFAULT NULL,
  `country` char(50) DEFAULT NULL,
  `subscribe_time` bigint(50) DEFAULT NULL,
  `head_image_url` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8;

/*Data for the table `wechat_account_fans` */

insert  into `wechat_account_fans`(`id`,`subscribe_status`,`open_id`,`nick_name`,`sex`,`language`,`account`,`city`,`province`,`country`,`subscribe_time`,`head_image_url`) values 
(16,1,'oV4wc1Jq3cMN2XMzPnce9iAyn26U','谢梦辉',1,'zh_CN','ceshi','南昌','江西','中国',1530604170060,'http://thirdwx.qlogo.cn/mmopen/ajNVdqHZLLAEmTMh8hFS31z0K5lyicwDw6YETzUpvkaCzWyGaxkyjQ5txT9WHvaoxQvrofOFymaLhjaM4AjoSyw/132'),
(29,1,'oV4wc1EPErkHAn4zlqcqTX4wDYZc','汐',0,'zh_CN','ceshi','','','',1557562873905,'http://thirdwx.qlogo.cn/mmopen/xIL2ssJ6pC4JNicI4alr1kbr4l1Rswic8ncfsHUPdSwowFxzpuhRITCy6KHkxv1llAkJphAb9qOtk8dVrkVzBJwZaEo8kiaAQib6/132');

/*Table structure for table `wechat_material_img` */

DROP TABLE IF EXISTS `wechat_material_img`;

CREATE TABLE `wechat_material_img` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `image_name` varchar(50) DEFAULT NULL,
  `account_name` varchar(200) DEFAULT NULL,
  `picture_url` varchar(200) DEFAULT NULL,
  `media_id` varchar(500) DEFAULT NULL,
  `img_url` varchar(200) DEFAULT NULL,
  `create_time` bigint(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=106 DEFAULT CHARSET=utf8;

/*Data for the table `wechat_material_img` */

insert  into `wechat_material_img`(`id`,`image_name`,`account_name`,`picture_url`,`media_id`,`img_url`,`create_time`) values 
(93,'图片2.jpg','ceshi','http://mmbiz.qpic.cn/mmbiz_jpg/BMc856GDrORBpqspHE1DMJriaVaxNaM42ravYQibVhA9ovv1uP5Qn9wFddeoyBlZmE85N7iabO8G3TjOJuHibplQsQ/0?wx_fmt=jpeg','1x_-M07I7I2_sMYdW2m5wQawOU2bfLY-u_p-VxMNCFw',NULL,1555833782874),
(99,'图片666.jpg','test','http://mmbiz.qpic.cn/mmbiz_jpg/BMc856GDrOTRragpkD1q61HC1ibO7j9jKicojia1Eh83WzLrskXT6libnazrZzDnDKhBYfic6y8IBU1NdSO7BRkGaww/0?wx_fmt=jpeg','1x_-M07I7I2_sMYdW2m5wUmuJREw0boPmZ1HJMiKqBs','H:\\Graduation_Project\\WeChat\\src\\main\\webapp\\statics\\materialResource\\test\\image\\1557244103087图片666.jpg',1557244109471),
(100,'图片111.jpg','test','http://mmbiz.qpic.cn/mmbiz_jpg/BMc856GDrOTRragpkD1q61HC1ibO7j9jKLQcUwc4c7H0ibpFibHuRicSkC89uNlLZuia2PNq4OHbuJgGj7OTY546ia2w/0?wx_fmt=jpeg','1x_-M07I7I2_sMYdW2m5weXXwC7_qkJbDgUOXO6Yg2s','H:\\Graduation_Project\\WeChat\\src\\main\\webapp\\statics\\materialResource\\test\\image\\1557244398373图片111.jpg',1557244406480),
(102,'图片11.JPG','ceshi','http://mmbiz.qpic.cn/mmbiz_jpg/BMc856GDrOSpH2eFAryXowfCiawPcJHD6doibH55hiclDEK0xiazcTxCo01aesNiclTexp56XzE1zb41VQoMZhRHE6g/0?wx_fmt=jpeg','1x_-M07I7I2_sMYdW2m5wWgyS1zTxaOdjRlxa21Hu9Q','H:\\Graduation_Project\\WeChat\\src\\main\\webapp\\statics\\materialResource\\ceshi\\image\\1557562030698图片11.JPG',1557562032770),
(103,'雪漫九曲桥.JPG','ceshi','http://mmbiz.qpic.cn/mmbiz_jpg/BMc856GDrOSpH2eFAryXowfCiawPcJHD6ymud9IxV5X5H38uyl2JHduhePBUiabameVXic60STicsKJjA7UkvQsjTw/0?wx_fmt=jpeg','1x_-M07I7I2_sMYdW2m5wYc3ekg-kEV4y4NRXpPw4yY','H:\\Graduation_Project\\WeChat\\src\\main\\webapp\\statics\\materialResource\\ceshi\\image\\15575881879884675D08C-6361-4E5E-ABE9-7AF4FC9E6344.JPG',1557588219731),
(104,'主楼.JPG','ceshi','http://mmbiz.qpic.cn/mmbiz_jpg/BMc856GDrOSpH2eFAryXowfCiawPcJHD6jfHG4LJasrmx2fXdLMxOvks5MnvqRibRu1zgWqAMNnAdnxez7oyUorQ/0?wx_fmt=jpeg','1x_-M07I7I2_sMYdW2m5waWKOjm44aPb_rVkbaEotWM','H:\\Graduation_Project\\WeChat\\src\\main\\webapp\\statics\\materialResource\\ceshi\\image\\1557588199916A8C6798C-0978-47AF-A129-B32BBAF1B6A0.JPG',1557588232658),
(105,'校门.JPG','ceshi','http://mmbiz.qpic.cn/mmbiz_jpg/BMc856GDrOSpH2eFAryXowfCiawPcJHD6omnaytjaxO2HHbqY5bHOZNQticNTMbru81F3flYqeHOO6LCS6kFRlEA/0?wx_fmt=jpeg','1x_-M07I7I2_sMYdW2m5wRn2RF4zExvJ3iAUa0g9Uhk','H:\\Graduation_Project\\WeChat\\src\\main\\webapp\\statics\\materialResource\\ceshi\\image\\1557588253290C089B83B-BEFF-469A-952F-B5E7E9FA8820.JPG',1557588275833);

/*Table structure for table `wechat_material_news` */

DROP TABLE IF EXISTS `wechat_material_news`;

CREATE TABLE `wechat_material_news` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `title` varchar(200) DEFAULT NULL,
  `account_name` varchar(200) DEFAULT NULL,
  `thumb_id` int(20) DEFAULT NULL,
  `media_id` varchar(500) DEFAULT NULL,
  `author` char(50) DEFAULT NULL,
  `digest` varchar(200) DEFAULT NULL,
  `show_cover_pic` int(8) DEFAULT NULL,
  `content` varchar(2000) DEFAULT NULL,
  `content_source_url` varchar(500) DEFAULT NULL,
  `create_time` bigint(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8;

/*Data for the table `wechat_material_news` */

insert  into `wechat_material_news`(`id`,`title`,`account_name`,`thumb_id`,`media_id`,`author`,`digest`,`show_cover_pic`,`content`,`content_source_url`,`create_time`) values 
(30,'ligang','ceshi',6,'1x_-M07I7I2_sMYdW2m5wUueTulYb1nwqS3vaE34KUs','ligang','图文添加测试图文添',1,'图文添加测试图文添加测试图文添加测试图文添加测试图文添加测试图文添加测试图文添加测试图文添加测试','http://www.baidu.com',1557578648680),
(31,'努力奋斗','ceshi',11,'1x_-M07I7I2_sMYdW2m5wWxmlfsGPRoH9bCiHOXPohQ','ligang','坚持学习，努力奋斗',1,'<p>坚持学习，努力奋斗，学习是终身的，奋斗是永久的！</p>','http://23c32214i1.imwork.net//jsp/previewNews.jsp?newsID=31',1557588812250),
(32,'学校','ceshi',9,'1x_-M07I7I2_sMYdW2m5wc58joSiXBAOS-Pd62BI8Gk','ligang','今年毕业了，发个图文留作纪念！',1,'马上就要毕业了，发个图文留作纪念！纪念！','http://23c32214i1.imwork.net//jsp/previewNews.jsp?newsID=32',1557588133884);

/*Table structure for table `wechat_material_thumb` */

DROP TABLE IF EXISTS `wechat_material_thumb`;

CREATE TABLE `wechat_material_thumb` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `thumb_name` varchar(50) DEFAULT NULL,
  `account_name` varchar(50) DEFAULT NULL,
  `media_id` varchar(200) DEFAULT NULL,
  `thumb_url` varchar(500) DEFAULT NULL,
  `img_url` varchar(500) DEFAULT NULL,
  `create_time` bigint(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

/*Data for the table `wechat_material_thumb` */

insert  into `wechat_material_thumb`(`id`,`thumb_name`,`account_name`,`media_id`,`thumb_url`,`img_url`,`create_time`) values 
(6,'封面222.jpg','ceshi','1x_-M07I7I2_sMYdW2m5wVfW-W_gsbnOEDHbNwAyMLY','http://mmbiz.qpic.cn/mmbiz_jpg/BMc856GDrOSpH2eFAryXowfCiawPcJHD6fdqeBmVrXyUTmn0ku9K9ohVheUL4x7MmwF1WJuODGne1u0bmBiaXXfg/0?wx_fmt=jpeg','H:\\Graduation_Project\\WeChat\\src\\main\\webapp\\statics\\materialResource\\ceshi\\thumb\\1557561311557封面222.jpg',1557561312673),
(7,'封面555.jpg','ceshi','1x_-M07I7I2_sMYdW2m5wRezFQUb9LDwuXxzIhuACKg','http://mmbiz.qpic.cn/mmbiz_jpg/BMc856GDrOSpH2eFAryXowfCiawPcJHD6FIwIjmanAZuSRIxLBkNHQibClWHQ13WiaLgSZMhnqbgaPx8oRqO1o8Iw/0?wx_fmt=jpeg','H:\\Graduation_Project\\WeChat\\src\\main\\webapp\\statics\\materialResource\\ceshi\\thumb\\1557561417972封面555.jpg',1557561418949),
(8,'封面333.jpg','ceshi','1x_-M07I7I2_sMYdW2m5wZ53bF5dyTnG1jNiQKhEux0','http://mmbiz.qpic.cn/mmbiz_jpg/BMc856GDrOSpH2eFAryXowfCiawPcJHD6UxvFhU9wxcQpYUlBbfRaQSor4UL4xicwDB5LbicXC1E1OluNZQlxmuaQ/0?wx_fmt=jpeg','H:\\Graduation_Project\\WeChat\\src\\main\\webapp\\statics\\materialResource\\ceshi\\thumb\\1557561426481封面333.jpg',1557561427538),
(9,'生态.JPG','ceshi','1x_-M07I7I2_sMYdW2m5wTh82RF8f4HDloVGKgAkXWI','http://mmbiz.qpic.cn/mmbiz_jpg/BMc856GDrOSpH2eFAryXowfCiawPcJHD64PPO0jay9h4IylYWsvLqUBiacSBBxp6L0EZG4iahYtPr7vQeAl9Hs3RQ/0?wx_fmt=jpeg','H:\\Graduation_Project\\WeChat\\src\\main\\webapp\\statics\\materialResource\\ceshi\\thumb\\1557562616998生态.JPG',1557562618114),
(10,'湖心亭韵.jpg','ceshi','1x_-M07I7I2_sMYdW2m5wbqpiWdLsZz8Eg6RVNB5lcA','http://mmbiz.qpic.cn/mmbiz_jpg/BMc856GDrOSpH2eFAryXowfCiawPcJHD6jrzSrNH7hz7RBJqZd6BQYrbYz6QicPTPxDpvkAcnsPyYbuhUlmq20gw/0?wx_fmt=jpeg','H:\\Graduation_Project\\WeChat\\src\\main\\webapp\\statics\\materialResource\\ceshi\\thumb\\1557588636689湖心亭韵.jpg',1557588637837),
(11,'校门.jpg','ceshi','1x_-M07I7I2_sMYdW2m5wQ_doRslEaVP3pyOsIkdvSg','http://mmbiz.qpic.cn/mmbiz_jpg/BMc856GDrOSpH2eFAryXowfCiawPcJHD6S40rFmJFIdL5urEQvTarQhiamtXd5ttlo6yZC1sKVLH2Ck3qaH5vB1Q/0?wx_fmt=jpeg','H:\\Graduation_Project\\WeChat\\src\\main\\webapp\\statics\\materialResource\\ceshi\\thumb\\1557588718558校门.jpg',1557588719978);

/*Table structure for table `wechat_material_video` */

DROP TABLE IF EXISTS `wechat_material_video`;

CREATE TABLE `wechat_material_video` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `video_name` varchar(50) DEFAULT NULL,
  `title` varchar(50) DEFAULT NULL,
  `account_name` varchar(50) DEFAULT NULL,
  `media_id` varchar(200) DEFAULT NULL,
  `description` varchar(500) DEFAULT NULL,
  `url` varchar(200) DEFAULT NULL,
  `create_time` bigint(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

/*Data for the table `wechat_material_video` */

insert  into `wechat_material_video`(`id`,`video_name`,`title`,`account_name`,`media_id`,`description`,`url`,`create_time`) values 
(9,'SeeYouAgain1.mp4','ceshitianjia','ceshi','1x_-M07I7I2_sMYdW2m5wbczRQVWJ4RGG3XBV1MQfHc','ceshitianjia111111','H:/Graduation_Project/WeChat/src/main/webapp/statics/materialResource/ceshi/video/1556517525152SeeYouAgain1.mp4',1556517538415),
(12,'SeeYouAgain1.mp4','klkll','ceshi','1x_-M07I7I2_sMYdW2m5wf_eg-MXqLg8mVLnzjSHFms','fesfeesa','H:\\Graduation_Project\\WeChat\\src\\main\\webapp\\statics\\materialResource\\ceshi\\video\\1556519994190SeeYouAgain1.mp4',1556520002968),
(13,'SeeYouAgain .mp4','视频素材','ceshi','1x_-M07I7I2_sMYdW2m5wfqqHjgNH-ZytuPLD9QFfoQ','SeeYouAgain测试','H:\\Graduation_Project\\WeChat\\src\\main\\webapp\\statics\\materialResource\\ceshi\\video\\1556587237111SeeYouAgain 1.mp4',1556587248159),
(14,'SeeYouAgain3.mp4','视频3333','ceshi','1x_-M07I7I2_sMYdW2m5wYgUD5tQMeiwI7oM_wXtqVo','seeyou3333','H:\\Graduation_Project\\WeChat\\src\\main\\webapp\\statics\\materialResource\\ceshi\\video\\1556589817397SeeYouAgain3.mp4',1556589826999);

/*Table structure for table `wechat_material_voice` */

DROP TABLE IF EXISTS `wechat_material_voice`;

CREATE TABLE `wechat_material_voice` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `title` char(50) DEFAULT NULL,
  `voice_name` char(50) DEFAULT NULL,
  `account_name` varchar(50) DEFAULT NULL,
  `media_id` varchar(200) DEFAULT NULL,
  `url` varchar(200) DEFAULT NULL,
  `description` varchar(200) DEFAULT NULL,
  `create_time` bigint(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

/*Data for the table `wechat_material_voice` */

insert  into `wechat_material_voice`(`id`,`title`,`voice_name`,`account_name`,`media_id`,`url`,`description`,`create_time`) values 
(3,'单词2的标题','voiceword2.mp3','ceshi','1x_-M07I7I2_sMYdW2m5wZRwapPboZy92e_DzYyza9E','H:\\Graduation_Project\\WeChat\\src\\main\\webapp\\statics\\materialResource\\ceshi\\voice\\1556591986783voiceword2.mp3','单词222aaaa',1557019404961),
(4,'22标题','voiceword2.mp3','ceshi','1x_-M07I7I2_sMYdW2m5wV-D3UZsmKZZZKlzSoWWUgg','H:\\Graduation_Project\\WeChat\\src\\main\\webapp\\statics\\materialResource\\ceshi\\voice\\1557019529521voiceword2.mp3','残敌房间爱老费劲啊',1557019531979),
(5,'我我我你你你你','voiceword1.mp3','ceshi','1x_-M07I7I2_sMYdW2m5wQvOgzJzuvyCB3pxZ5c_rho','H:\\Graduation_Project\\WeChat\\src\\main\\webapp\\statics\\materialResource\\ceshi\\voice\\1557020353183voiceword1.mp3','单词111111aaa',1557020579569),
(6,'语音素材','voiceword3.mp3','ceshi','1x_-M07I7I2_sMYdW2m5wZqszenFHc-Fc7BQb4VH4jU','H:\\Graduation_Project\\WeChat\\src\\main\\webapp\\statics\\materialResource\\ceshi\\voice\\1557021224493voiceword3.mp3','单词333333',1557021226522);

/*Table structure for table `wechat_message` */

DROP TABLE IF EXISTS `wechat_message`;

CREATE TABLE `wechat_message` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `account` char(20) DEFAULT NULL,
  `title` char(50) DEFAULT NULL,
  `input_code` char(50) DEFAULT NULL,
  `message_type` char(50) DEFAULT NULL,
  `create_time` bigint(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=106 DEFAULT CHARSET=utf8;

/*Data for the table `wechat_message` */

insert  into `wechat_message`(`id`,`account`,`title`,`input_code`,`message_type`,`create_time`) values 
(3,'ceshi','imagewww','3','image',1557588847323),
(7,'ceshi','video','7','video',1557566084456),
(8,'ceshi','news','8','news',1557565733373),
(18,'ceshi','xiugai','1223','text',1557285622296),
(33,'name','text','name','text',1529927302913),
(44,'ceshi','text','3333','text',1550759358974),
(50,'ceshi','20192019xx','2019','text',1557285643414),
(52,'ceshi','wwww','wwadw','text',1557565712910),
(67,'ceshi','dagea','2033','image',1557588837790),
(69,'ceshi','rgrg','grgdgrd','image',1557566103311),
(70,'ceshi','dawda','dad','image',1557588869209),
(71,'ceshi','ghth','jtfh','image',1555317343933),
(72,'ceshi','da','grgrsg','text',1557285659152),
(73,'ceshi','dafvgvsr','fbfgnf','text',1557285664367),
(75,'ceshi','大肥肉是','该跌不跌','image',1557566141526),
(76,'ceshi','丰富','大大','image',1557588887393),
(77,'ceshi','测试图片消息','图片','image',1556097326074),
(78,'ceshi','测试ttt','tupian','image',1556097542464),
(79,'ceshi','333333','343434','image',1556106421167),
(85,'ceshi','挖了图文','图文挖了','news',1556371239281),
(86,'ceshi','yyyyy','yyyy','news',1556377824641),
(87,'ceshi','带娃大无','吊袜带','text',1556503267424),
(88,'ceshi','shipo','shipinw','video',1556540316214),
(90,'ceshi','3242','4252','news',1556541414642),
(91,'ceshi','wqrqr','rwqrq','news',1556542120367),
(92,'ceshi','2314','ewfw','image',1556542275197),
(93,'ceshi','fqwf','qfqfq','video',1556542948845),
(94,'ceshi','ff','qfqfqdwad','video',1556542401299),
(95,'ceshi','语音单词1','33','voice',1557287329534),
(97,'ceshi','语音222','22','voice',1557287393918),
(98,'test','测试2222','987654','text',1557243416994),
(99,'test','图片消息测试','图片','image',1557244140844),
(100,'test','图片22222','2323','image',1557244431982),
(101,'ceshi','公众号介绍','1','text',1557284407444),
(102,'ceshi','公众号功能','2','text',1557284084325),
(103,'ceshi','菜单','?','text',1557285123433),
(104,'ceshi','菜单','？','text',1557285183312),
(105,'ceshi','彩蛋05','05','text',1557285713218);

/*Table structure for table `wechat_message_img` */

DROP TABLE IF EXISTS `wechat_message_img`;

CREATE TABLE `wechat_message_img` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `image_id` int(20) DEFAULT NULL,
  `base_id` int(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

/*Data for the table `wechat_message_img` */

insert  into `wechat_message_img`(`id`,`image_id`,`base_id`) values 
(1,104,3),
(3,101,2),
(4,1,1),
(7,103,67),
(9,102,69),
(10,105,70),
(11,96,71),
(13,93,75),
(14,104,76),
(15,0,77),
(16,94,78),
(17,0,79),
(18,0,92),
(19,99,99),
(20,100,100);

/*Table structure for table `wechat_message_img_music_video_voice` */

DROP TABLE IF EXISTS `wechat_message_img_music_video_voice`;

CREATE TABLE `wechat_message_img_music_video_voice` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `base_id` int(20) DEFAULT NULL,
  `text_id` int(20) DEFAULT NULL,
  `image_id` int(20) DEFAULT NULL,
  `musec_id` int(20) DEFAULT NULL,
  `video_id` int(20) DEFAULT NULL,
  `voice_id` int(20) DEFAULT NULL,
  `news_id` int(20) DEFAULT NULL,
  `create_time` bigint(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

/*Data for the table `wechat_message_img_music_video_voice` */

insert  into `wechat_message_img_music_video_voice`(`id`,`base_id`,`text_id`,`image_id`,`musec_id`,`video_id`,`voice_id`,`news_id`,`create_time`) values 
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
  `title` char(50) DEFAULT NULL,
  `description` varchar(200) DEFAULT NULL,
  `music_url` varchar(200) DEFAULT NULL,
  `hq_music_url` varchar(200) DEFAULT NULL,
  `thumbmediaid` varchar(200) DEFAULT NULL,
  `base_id` int(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `wechat_message_music` */

insert  into `wechat_message_music`(`id`,`title`,`description`,`music_url`,`hq_music_url`,`thumbmediaid`,`base_id`) values 
(1,'see you again','速度与激情7片尾曲','http://6805faf1.ngrok.io/resource/music/SeeYouAgain.mp3','http://6805faf1.ngrok.io/resource/music/SeeYouAgain.mp3','MQ4cHTCqij2qjCkZPG0qY6He9aMLqtiGgxDJlbpvPYc4l4nX28Mo9UWtKdEmkkTw',5);

/*Table structure for table `wechat_message_news` */

DROP TABLE IF EXISTS `wechat_message_news`;

CREATE TABLE `wechat_message_news` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `news_id` int(20) DEFAULT NULL,
  `base_id` int(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

/*Data for the table `wechat_message_news` */

insert  into `wechat_message_news`(`id`,`news_id`,`base_id`) values 
(1,32,8),
(3,30,85),
(4,31,86),
(5,0,90),
(6,0,91);

/*Table structure for table `wechat_message_text` */

DROP TABLE IF EXISTS `wechat_message_text`;

CREATE TABLE `wechat_message_text` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `title` char(20) DEFAULT NULL,
  `content` varchar(200) DEFAULT NULL,
  `base_id` int(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8;

/*Data for the table `wechat_message_text` */

insert  into `wechat_message_text`(`id`,`title`,`content`,`base_id`) values 
(7,'xiugai','恭喜您，砸中了彩蛋！！！！！！！！！',18),
(8,'content','content',19),
(16,'nameaccount','zchaksd',31),
(18,'namexiao','name公众号的消息',33),
(22,'content','cont222222222222222nt',37),
(23,'content','cont222222222222222nt',38),
(26,'wuyuwuyu','蹙额',41),
(29,'4444','1132131',44),
(30,'2019连','201920192019',47),
(31,'哒哒哒哒哒哒','哒哒哒哒哒哒',48),
(33,'20192019xx','恭喜您，砸中了彩蛋！！！！！',50),
(34,'吾问无为谓','吾问无为谓',51),
(35,'wwww','恭喜您，砸中了彩蛋！！！！！！！！',52),
(40,'da','恭喜您，砸中了彩蛋！！！！！',72),
(41,'dafvgvsr','恭喜您，砸中了彩蛋！！！！！',73),
(42,'带娃大无','达瓦大',87),
(43,'测试2222','987644测试',98),
(44,'公众号介绍','此公众号为毕业设计答辩项目演示公众号。\n欢迎各位老师、同学来关注测试本人的微信公众号管理平台，谢谢！',101),
(45,'公众号功能','此公众号为毕业设计答辩项目演示公众号，为了测试微信公众号管理平台的功能！',102),
(46,'菜单','欢迎您的关注，请按照菜单提示进行操作：\n\n回复“1”，公众号介绍；\n回复“2”，公众号功能；\n回复任意字符，寻找彩蛋；\n回复“？”，调出此菜单！',103),
(47,'菜单','欢迎您的关注，请按照菜单提示进行操作：\n\n回复“1”，公众号介绍；\n回复“2”，公众号功能；\n回复任意字符，寻找彩蛋；\n回复“？”，调出此菜单！',104),
(48,'彩蛋05','恭喜您，砸中了彩蛋！！！！！',105);

/*Table structure for table `wechat_message_video` */

DROP TABLE IF EXISTS `wechat_message_video`;

CREATE TABLE `wechat_message_video` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `base_id` int(20) DEFAULT NULL,
  `video_id` int(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

/*Data for the table `wechat_message_video` */

insert  into `wechat_message_video`(`id`,`base_id`,`video_id`) values 
(1,7,13),
(2,88,9),
(4,93,9),
(5,94,0);

/*Table structure for table `wechat_message_voice` */

DROP TABLE IF EXISTS `wechat_message_voice`;

CREATE TABLE `wechat_message_voice` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `base_id` int(20) DEFAULT NULL,
  `voice_id` int(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

/*Data for the table `wechat_message_voice` */

insert  into `wechat_message_voice`(`id`,`base_id`,`voice_id`) values 
(1,95,6),
(3,97,3);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
