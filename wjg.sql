-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: 2018-07-15 11:13:07
-- 服务器版本： 10.1.21-MariaDB
-- PHP Version: 5.6.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `wjg`
--
CREATE DATABASE IF NOT EXISTS `wjg` DEFAULT CHARACTER SET utf8 COLLATE utf8_bin;
USE `wjg`;

-- --------------------------------------------------------

--
-- 表的结构 `ftopic`
--

CREATE TABLE `ftopic` (
  `Tid` int(2) NOT NULL COMMENT '话题号',
  `Ytitle` varchar(10) COLLATE utf8_bin NOT NULL COMMENT '话题名称',
  `Cbrief` varchar(128) COLLATE utf8_bin NOT NULL COMMENT '话题简介'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='记录话题信息';

--
-- 转存表中的数据 `ftopic`
--

INSERT INTO `ftopic` (`Tid`, `Ytitle`, `Cbrief`) VALUES
(1, '植物养护', '植物养护相关的文章'),
(2, '冷门植物小知识', '一些比较冷门的植物小知识');

-- --------------------------------------------------------

--
-- 表的结构 `gmycollection`
--

CREATE TABLE `gmycollection` (
  `Haid` char(32) COLLATE utf8_bin NOT NULL COMMENT '文章号',
  `Udate` char(16) COLLATE utf8_bin NOT NULL COMMENT '收藏日期',
  `Wuser` char(20) COLLATE utf8_bin NOT NULL COMMENT '收藏者'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='记录用户的文章收藏情况';

-- --------------------------------------------------------

--
-- 表的结构 `iuser`
--

CREATE TABLE `iuser` (
  `Hwxkey` char(28) COLLATE utf8_bin NOT NULL COMMENT '微信用户标识号',
  `Jaccount` char(20) COLLATE utf8_bin NOT NULL COMMENT '用户账号',
  `Uhead` varchar(32) COLLATE utf8_bin NOT NULL COMMENT '用户头像',
  `Onickname` varchar(12) COLLATE utf8_bin NOT NULL COMMENT '用户昵称',
  `Nfocus` int(11) DEFAULT '0' COMMENT '关注数',
  `Mfans` int(11) DEFAULT '0' COMMENT '粉丝数',
  `Hcollect` int(11) DEFAULT '0' COMMENT '收藏数',
  `Darticle` int(11) DEFAULT '0' COMMENT '文章数'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='记录用户信息';

--
-- 转存表中的数据 `iuser`
--

INSERT INTO `iuser` (`Hwxkey`, `Jaccount`, `Uhead`, `Onickname`, `Nfocus`, `Mfans`, `Hcollect`, `Darticle`) VALUES
('o8Cqe4h8OtYHf5MdhQ8egzce3oQo', 'SZLPaPMX\\NpdQ`247834', '', '岁末的温染', 2, 1, 2, 2),
('o8Cqe4qtrNqUL7iN5wEyLi8JCJx0', 'SZLr`cA[V_ZAFT611879', '', '棋三不惑', 2, 2, 1, 1),
('o8Cqe4qtrNqU_jiNW7EyLi8JCJx0', 'SZLr`cd[G_ZAFT518319', '', '大屁二', 1, 2, 1, 0);

-- --------------------------------------------------------

--
-- 表的结构 `jmythumbsup`
--

CREATE TABLE `jmythumbsup` (
  `Ntid` char(32) COLLATE utf8_bin NOT NULL COMMENT '文章号',
  `Iuser` char(20) COLLATE utf8_bin NOT NULL COMMENT '用户账号'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='记录用户点赞文章信息';

-- --------------------------------------------------------

--
-- 表的结构 `jrecord`
--

CREATE TABLE `jrecord` (
  `Vdate` char(19) COLLATE utf8_bin NOT NULL COMMENT '检测时间',
  `Ntemperature` varchar(10) COLLATE utf8_bin NOT NULL COMMENT '平均温度',
  `Wmoisture` varchar(10) COLLATE utf8_bin NOT NULL COMMENT '平均水份',
  `Eillumination` varchar(10) COLLATE utf8_bin NOT NULL COMMENT '平均光照',
  `Ofertility` varchar(10) COLLATE utf8_bin NOT NULL COMMENT '平均肥力'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='记录每次检测获取的传感器数据';

-- --------------------------------------------------------

--
-- 表的结构 `kplanttype`
--

CREATE TABLE `kplanttype` (
  `Ptid` int(2) NOT NULL COMMENT '植物分类号',
  `Jname` varchar(10) COLLATE utf8_bin NOT NULL COMMENT '植物分类名',
  `Tbrief` varchar(128) COLLATE utf8_bin DEFAULT NULL COMMENT '植物分类简介'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='记录植物百科中植物的分类';

--
-- 转存表中的数据 `kplanttype`
--

INSERT INTO `kplanttype` (`Ptid`, `Jname`, `Tbrief`) VALUES
(1, '一、二年生花卉', NULL),
(2, '宿根花卉', NULL),
(3, '球根花卉', NULL),
(4, '多浆植物', NULL),
(5, '兰科花卉', NULL),
(6, '水生花卉', NULL),
(7, '高山花卉及岩生植物', NULL),
(8, '木本植物', NULL),
(9, '蕨类植物', NULL),
(10, '苔藓植物', NULL);

-- --------------------------------------------------------

--
-- 表的结构 `lcomment`
--

CREATE TABLE `lcomment` (
  `Cid` char(32) COLLATE utf8_bin NOT NULL COMMENT '评论号',
  `Oaid` char(32) COLLATE utf8_bin NOT NULL COMMENT '文章号',
  `Ycontent` varchar(512) COLLATE utf8_bin NOT NULL COMMENT '评论内容',
  `Udate` char(16) COLLATE utf8_bin NOT NULL COMMENT '评论日期',
  `Tpicture` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '图片地址',
  `Xaccount` varchar(20) COLLATE utf8_bin NOT NULL COMMENT '用户账号',
  `Klike` int(3) DEFAULT '0' COMMENT '点赞数'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='记录文章评论信息';

-- --------------------------------------------------------

--
-- 表的结构 `mreportmonth`
--

CREATE TABLE `mreportmonth` (
  `Vdate` char(10) COLLATE utf8_bin NOT NULL COMMENT '起始日期',
  `Ncount` int(3) NOT NULL COMMENT '检测次数',
  `Gtemperature` varchar(10) COLLATE utf8_bin NOT NULL COMMENT '平均温度',
  `Hmoisture` varchar(10) COLLATE utf8_bin NOT NULL COMMENT '平均水份',
  `Jillumination` varchar(10) COLLATE utf8_bin NOT NULL COMMENT '平均光照',
  `Sfertility` varchar(10) COLLATE utf8_bin NOT NULL COMMENT '平均肥力'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='记录每周的数据报告';

-- --------------------------------------------------------

--
-- 表的结构 `ndevice`
--

CREATE TABLE `ndevice` (
  `Ocode` char(13) COLLATE utf8_bin NOT NULL COMMENT '标识码',
  `Ipid` int(6) NOT NULL COMMENT '植物号',
  `Uaccount` varchar(20) COLLATE utf8_bin NOT NULL COMMENT '用户账号',
  `Lpicture` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '自定义图片'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='记录智能设备详情';

-- --------------------------------------------------------

--
-- 表的结构 `nplant`
--

CREATE TABLE `nplant` (
  `Pid` int(6) NOT NULL COMMENT '植物号',
  `Ptid` int(2) NOT NULL COMMENT '植物分类号',
  `Cname` varchar(12) COLLATE utf8_bin NOT NULL COMMENT '植物名称',
  `ksname` varchar(20) COLLATE utf8_bin NOT NULL COMMENT '植物学名',
  `uoname` varchar(48) COLLATE utf8_bin NOT NULL COMMENT '植物别名',
  `Dlauraceae` varchar(16) COLLATE utf8_bin NOT NULL COMMENT '植物科属',
  `Ndistribution` varchar(128) COLLATE utf8_bin NOT NULL COMMENT '产地与分布',
  `Hcharacteristics` varchar(128) COLLATE utf8_bin NOT NULL COMMENT '生物学特性',
  `Sadvice` varchar(128) COLLATE utf8_bin NOT NULL COMMENT '养护建议',
  `Rflang` varchar(16) COLLATE utf8_bin DEFAULT NULL COMMENT '花语',
  `Xtemperature` varchar(16) COLLATE utf8_bin NOT NULL COMMENT '适宜温度',
  `Wmoisture` varchar(16) COLLATE utf8_bin NOT NULL COMMENT '适宜水份',
  `Mfertility` varchar(16) COLLATE utf8_bin NOT NULL COMMENT '适宜肥力',
  `Ulight` varchar(16) COLLATE utf8_bin NOT NULL COMMENT '适宜光照'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='记录植物的详细属性';

--
-- 转存表中的数据 `nplant`
--

INSERT INTO `nplant` (`Pid`, `Ptid`, `Cname`, `ksname`, `uoname`, `Dlauraceae`, `Ndistribution`, `Hcharacteristics`, `Sadvice`, `Rflang`, `Xtemperature`, `Wmoisture`, `Mfertility`, `Ulight`) VALUES
(1, 1, '一串红', 'Salvia splendens', '墙下红、草象牙红、爆竹红、西洋红', '唇形科鼠尾草属', '原产南美巴西，各地广为栽培', '一串红不耐寒，生育适温24℃，喜阳光充足，稍耐半阴，喜疏松肥沃的土壤', '建议种植于南面阳台，每周浇100ml的水，浇水要掌握见干见湿的原则，保持土壤60%左右的土壤含水量', '恋爱的心，象征男女之间纯洁的爱情', '22|24', '200|300', '30|48', '50|60');

-- --------------------------------------------------------

--
-- 表的结构 `nreportday`
--

CREATE TABLE `nreportday` (
  `Hdate` char(10) COLLATE utf8_bin NOT NULL COMMENT '检测日期',
  `Bcount` int(2) NOT NULL COMMENT '检测次数',
  `Ctemperature` varchar(10) COLLATE utf8_bin NOT NULL COMMENT '平均温度',
  `Imoisture` varchar(10) COLLATE utf8_bin NOT NULL COMMENT '平均水份',
  `Pillumination` varchar(10) COLLATE utf8_bin NOT NULL COMMENT '平均光照',
  `Mfertility` varchar(10) COLLATE utf8_bin NOT NULL COMMENT '平均肥力'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='记录每日的数据报告';

-- --------------------------------------------------------

--
-- 表的结构 `oreply`
--

CREATE TABLE `oreply` (
  `Rid` char(32) COLLATE utf8_bin NOT NULL COMMENT '回复号',
  `Hcid` char(32) COLLATE utf8_bin NOT NULL COMMENT '评论号',
  `Jnickname` varchar(12) COLLATE utf8_bin NOT NULL COMMENT '回复用户昵称',
  `Xcontent` varchar(512) COLLATE utf8_bin NOT NULL COMMENT '回复内容',
  `Adate` char(16) COLLATE utf8_bin NOT NULL COMMENT '回复日期',
  `Epicture` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '图片地址',
  `Waccount` char(20) COLLATE utf8_bin NOT NULL COMMENT '用户账号',
  `Qlike` int(3) DEFAULT '0' COMMENT '点赞数'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='记录文章评论的回复信息';

-- --------------------------------------------------------

--
-- 表的结构 `tmymessage`
--

CREATE TABLE `tmymessage` (
  `Uaccount` char(20) COLLATE utf8_bin NOT NULL COMMENT '消息发送者',
  `Qdate` char(16) COLLATE utf8_bin NOT NULL COMMENT '发送日期',
  `Ptype` char(1) COLLATE utf8_bin NOT NULL COMMENT '消息类型',
  `Baid` char(32) COLLATE utf8_bin NOT NULL COMMENT '文章号',
  `Lcomment` varchar(512) COLLATE utf8_bin NOT NULL COMMENT '评论内容',
  `Muser` char(20) COLLATE utf8_bin NOT NULL COMMENT '消息接收者'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='记录用户消息情况';

-- --------------------------------------------------------

--
-- 替换视图以便查看 `view_user_fans`
-- (See below for the actual view)
--
CREATE TABLE `view_user_fans` (
`account` char(20)
,`head` varchar(32)
,`nickname` varchar(12)
,`user` char(20)
);

-- --------------------------------------------------------

--
-- 替换视图以便查看 `view_user_focus`
-- (See below for the actual view)
--
CREATE TABLE `view_user_focus` (
`account` char(20)
,`head` varchar(32)
,`nickname` varchar(12)
,`user` char(20)
);

-- --------------------------------------------------------

--
-- 表的结构 `warticle`
--

CREATE TABLE `warticle` (
  `Aid` char(32) COLLATE utf8_bin NOT NULL COMMENT '文章号',
  `Maccount` char(20) COLLATE utf8_bin NOT NULL COMMENT '作者账号',
  `Itopic` int(2) NOT NULL COMMENT '话题号',
  `Htitle` varchar(20) COLLATE utf8_bin NOT NULL COMMENT '文章标题',
  `Dcontent` varchar(4096) COLLATE utf8_bin NOT NULL COMMENT '文章内容',
  `Kdate` char(16) COLLATE utf8_bin NOT NULL COMMENT '文章日期',
  `Opicture` varchar(128) COLLATE utf8_bin DEFAULT NULL COMMENT '图片地址',
  `Jread` int(6) DEFAULT '0' COMMENT '阅读数',
  `Gcollect` int(5) DEFAULT '0' COMMENT '收藏数',
  `Ycomment` int(5) DEFAULT '0' COMMENT '评论数',
  `Elike` int(5) DEFAULT '0' COMMENT '点赞数'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- 表的结构 `ymyfocus`
--

CREATE TABLE `ymyfocus` (
  `Fid` char(32) COLLATE utf8_bin NOT NULL COMMENT '关注号',
  `Gaccount` char(20) COLLATE utf8_bin NOT NULL COMMENT '被关注者',
  `Yuser` char(20) COLLATE utf8_bin NOT NULL COMMENT '关注者'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='记录用户之间的关注信息';

--
-- 转存表中的数据 `ymyfocus`
--

INSERT INTO `ymyfocus` (`Fid`, `Gaccount`, `Yuser`) VALUES
('SZLPaPMX\\NpdQ`247834180713151214', 'SZLr`cA[V_ZAFT611879', 'SZLPaPMX\\NpdQ`247834'),
('SZLPaPMX\\NpdQ`247834180713175423', 'SZLr`cd[G_ZAFT518319', 'SZLPaPMX\\NpdQ`247834'),
('SZLr`cA[V_ZAFT611879180713184536', 'SZLr`cd[G_ZAFT518319', 'SZLr`cA[V_ZAFT611879'),
('SZLr`cA[V_ZAFT611879180714231547', 'SZLPaPMX\\NpdQ`247834', 'SZLr`cA[V_ZAFT611879'),
('SZLr`cd[G_ZAFT518319180703152442', 'SZLr`cA[V_ZAFT611879', 'SZLr`cd[G_ZAFT518319');

-- --------------------------------------------------------

--
-- 视图结构 `view_user_fans`
--
DROP TABLE IF EXISTS `view_user_fans`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_user_fans`  AS  select `u`.`Jaccount` AS `account`,`u`.`Uhead` AS `head`,`u`.`Onickname` AS `nickname`,`mf`.`Gaccount` AS `user` from (`ymyfocus` `mf` left join `iuser` `u` on((`mf`.`Yuser` = `u`.`Jaccount`))) ;

-- --------------------------------------------------------

--
-- 视图结构 `view_user_focus`
--
DROP TABLE IF EXISTS `view_user_focus`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_user_focus`  AS  select `u`.`Jaccount` AS `account`,`u`.`Uhead` AS `head`,`u`.`Onickname` AS `nickname`,`mf`.`Yuser` AS `user` from (`ymyfocus` `mf` left join `iuser` `u` on((`mf`.`Gaccount` = `u`.`Jaccount`))) ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `ftopic`
--
ALTER TABLE `ftopic`
  ADD PRIMARY KEY (`Tid`),
  ADD UNIQUE KEY `Ytitle` (`Ytitle`);

--
-- Indexes for table `gmycollection`
--
ALTER TABLE `gmycollection`
  ADD PRIMARY KEY (`Haid`,`Wuser`),
  ADD KEY `mycollection_account` (`Wuser`);

--
-- Indexes for table `iuser`
--
ALTER TABLE `iuser`
  ADD PRIMARY KEY (`Hwxkey`),
  ADD UNIQUE KEY `Jaccount` (`Jaccount`);

--
-- Indexes for table `jmythumbsup`
--
ALTER TABLE `jmythumbsup`
  ADD PRIMARY KEY (`Ntid`);

--
-- Indexes for table `kplanttype`
--
ALTER TABLE `kplanttype`
  ADD PRIMARY KEY (`Ptid`),
  ADD UNIQUE KEY `Jname` (`Jname`);

--
-- Indexes for table `lcomment`
--
ALTER TABLE `lcomment`
  ADD PRIMARY KEY (`Cid`),
  ADD KEY `comment_account` (`Xaccount`),
  ADD KEY `comment_aid` (`Oaid`);

--
-- Indexes for table `ndevice`
--
ALTER TABLE `ndevice`
  ADD KEY `device_pid` (`Ipid`),
  ADD KEY `device_account` (`Uaccount`);

--
-- Indexes for table `nplant`
--
ALTER TABLE `nplant`
  ADD PRIMARY KEY (`Pid`),
  ADD UNIQUE KEY `Cname` (`Cname`),
  ADD KEY `plant_ptid` (`Ptid`);

--
-- Indexes for table `oreply`
--
ALTER TABLE `oreply`
  ADD PRIMARY KEY (`Rid`),
  ADD KEY `reply_account` (`Waccount`),
  ADD KEY `reply_cid` (`Hcid`);

--
-- Indexes for table `tmymessage`
--
ALTER TABLE `tmymessage`
  ADD KEY `mymessage_account` (`Uaccount`),
  ADD KEY `mymessage_user` (`Muser`);

--
-- Indexes for table `warticle`
--
ALTER TABLE `warticle`
  ADD PRIMARY KEY (`Aid`),
  ADD KEY `article_account` (`Maccount`),
  ADD KEY `article_topic` (`Itopic`);

--
-- Indexes for table `ymyfocus`
--
ALTER TABLE `ymyfocus`
  ADD PRIMARY KEY (`Fid`),
  ADD KEY `focus_account` (`Gaccount`),
  ADD KEY `focus_user` (`Yuser`);

--
-- 在导出的表使用AUTO_INCREMENT
--

--
-- 使用表AUTO_INCREMENT `ftopic`
--
ALTER TABLE `ftopic`
  MODIFY `Tid` int(2) NOT NULL AUTO_INCREMENT COMMENT '话题号', AUTO_INCREMENT=3;
--
-- 使用表AUTO_INCREMENT `kplanttype`
--
ALTER TABLE `kplanttype`
  MODIFY `Ptid` int(2) NOT NULL AUTO_INCREMENT COMMENT '植物分类号', AUTO_INCREMENT=11;
--
-- 使用表AUTO_INCREMENT `nplant`
--
ALTER TABLE `nplant`
  MODIFY `Pid` int(6) NOT NULL AUTO_INCREMENT COMMENT '植物号', AUTO_INCREMENT=2;
--
-- 限制导出的表
--

--
-- 限制表 `gmycollection`
--
ALTER TABLE `gmycollection`
  ADD CONSTRAINT `mycollection_account` FOREIGN KEY (`Wuser`) REFERENCES `iuser` (`Jaccount`);

--
-- 限制表 `lcomment`
--
ALTER TABLE `lcomment`
  ADD CONSTRAINT `comment_account` FOREIGN KEY (`Xaccount`) REFERENCES `iuser` (`Jaccount`),
  ADD CONSTRAINT `comment_aid` FOREIGN KEY (`Oaid`) REFERENCES `warticle` (`Aid`);

--
-- 限制表 `ndevice`
--
ALTER TABLE `ndevice`
  ADD CONSTRAINT `device_account` FOREIGN KEY (`Uaccount`) REFERENCES `iuser` (`Jaccount`),
  ADD CONSTRAINT `device_pid` FOREIGN KEY (`Ipid`) REFERENCES `nplant` (`Pid`);

--
-- 限制表 `nplant`
--
ALTER TABLE `nplant`
  ADD CONSTRAINT `plant_ptid` FOREIGN KEY (`Ptid`) REFERENCES `kplanttype` (`Ptid`);

--
-- 限制表 `oreply`
--
ALTER TABLE `oreply`
  ADD CONSTRAINT `reply_account` FOREIGN KEY (`Waccount`) REFERENCES `iuser` (`Jaccount`),
  ADD CONSTRAINT `reply_cid` FOREIGN KEY (`Hcid`) REFERENCES `lcomment` (`Cid`);

--
-- 限制表 `tmymessage`
--
ALTER TABLE `tmymessage`
  ADD CONSTRAINT `mymessage_account` FOREIGN KEY (`Uaccount`) REFERENCES `iuser` (`Jaccount`),
  ADD CONSTRAINT `mymessage_user` FOREIGN KEY (`Muser`) REFERENCES `iuser` (`Jaccount`);

--
-- 限制表 `warticle`
--
ALTER TABLE `warticle`
  ADD CONSTRAINT `article_account` FOREIGN KEY (`Maccount`) REFERENCES `iuser` (`Jaccount`),
  ADD CONSTRAINT `article_topic` FOREIGN KEY (`Itopic`) REFERENCES `ftopic` (`Tid`);

--
-- 限制表 `ymyfocus`
--
ALTER TABLE `ymyfocus`
  ADD CONSTRAINT `focus_account` FOREIGN KEY (`Gaccount`) REFERENCES `iuser` (`Jaccount`) ON UPDATE CASCADE,
  ADD CONSTRAINT `focus_user` FOREIGN KEY (`Yuser`) REFERENCES `iuser` (`Jaccount`) ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
