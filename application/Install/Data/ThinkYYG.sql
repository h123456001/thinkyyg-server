-- phpMyAdmin SQL Dump
-- version 4.1.8
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: 2015-12-22 14:43:12
-- 服务器版本： 5.6.21-log
-- PHP Version: 5.5.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `thinkyyg`
--

-- --------------------------------------------------------
--
-- 表的结构 `yyg_ad`
--

CREATE TABLE `yyg_ad` (
  `ad_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '广告id',
  `ad_name` varchar(255) NOT NULL COMMENT '广告名称',
  `ad_content` text COMMENT '广告内容',
  `status` int(2) NOT NULL DEFAULT '1' COMMENT '状态，1显示，0不显示',
  PRIMARY KEY (`ad_id`),
  KEY `ad_name` (`ad_name`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;


-- --------------------------------------------------------

--
-- 表的结构 `yyg_oauth_user`
--

CREATE TABLE `yyg_oauth_user` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `from` varchar(20) NOT NULL COMMENT '用户来源key',
  `name` varchar(30) NOT NULL COMMENT '第三方昵称',
  `head_img` varchar(200) NOT NULL COMMENT '头像',
  `uid` int(20) NOT NULL COMMENT '关联的本站用户id',
  `create_time` datetime NOT NULL COMMENT '绑定时间',
  `last_login_time` datetime NOT NULL COMMENT '最后登录时间',
  `last_login_ip` varchar(16) NOT NULL COMMENT '最后登录ip',
  `login_times` int(6) NOT NULL COMMENT '登录次数',
  `status` tinyint(2) NOT NULL,
  `access_token` varchar(512) NOT NULL,
  `expires_date` int(11) NOT NULL COMMENT 'access_token过期时间',
  `openid` varchar(40) NOT NULL COMMENT '第三方用户id',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='第三方用户表' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `yyg_links`
--

CREATE TABLE `yyg_links` (
  `link_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `link_url` varchar(255) NOT NULL COMMENT '友情链接地址',
  `link_name` varchar(255) NOT NULL COMMENT '友情链接名称',
  `link_image` varchar(255) DEFAULT NULL COMMENT '友情链接图标',
  `link_target` varchar(25) NOT NULL DEFAULT '_blank' COMMENT '友情链接打开方式',
  `link_description` text NOT NULL COMMENT '友情链接描述',
  `link_status` int(2) NOT NULL DEFAULT '1' COMMENT '状态，1显示，0不显示',
  `link_rating` int(11) NOT NULL DEFAULT '0' COMMENT '友情链接评级',
  `link_rel` varchar(255) DEFAULT NULL COMMENT '链接与网站的关系',
  `listorder` int(10) NOT NULL DEFAULT '0' COMMENT '排序',
  PRIMARY KEY (`link_id`),
  KEY `link_visible` (`link_status`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='友情链接表' AUTO_INCREMENT=2 ;
-- --------------------------------------------------------

--
-- 表的结构 `yyg_users`
--

CREATE TABLE IF NOT EXISTS `yyg_users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_login` varchar(60) NOT NULL DEFAULT '' COMMENT '用户名',
  `user_pass` varchar(64) NOT NULL DEFAULT '' COMMENT '登录密码；sp_password加密',
  `user_nicename` varchar(50) NOT NULL DEFAULT '' COMMENT '用户美名',
  `user_email` varchar(100) NOT NULL DEFAULT '' COMMENT '登录邮箱',
  `user_url` varchar(100) NOT NULL DEFAULT '' COMMENT '用户个人网站',
  `avatar` varchar(255) DEFAULT NULL COMMENT '用户头像，相对于upload/avatar目录',
  `sex` smallint(1) DEFAULT '0' COMMENT '性别；0：保密，1：男；2：女',
  `birthday` date DEFAULT NULL COMMENT '生日',
  `signature` varchar(255) DEFAULT NULL COMMENT '个性签名',
  `last_login_ip` varchar(16) DEFAULT NULL COMMENT '最后登录ip',
  `last_login_time` datetime NOT NULL DEFAULT '2000-01-01 00:00:00' COMMENT '最后登录时间',
  `create_time` datetime NOT NULL DEFAULT '2000-01-01 00:00:00' COMMENT '注册时间',
  `user_activation_key` varchar(60) NOT NULL DEFAULT '' COMMENT '激活码',
  `user_status` int(11) NOT NULL DEFAULT '1' COMMENT '用户状态 0：禁用； 1：正常 ；2：未验证',
  `score` int(11) NOT NULL DEFAULT '0' COMMENT '用户积分',
  `user_type` smallint(1) DEFAULT '1' COMMENT '用户类型，1:admin ;2:会员',
  `coin` int(11) NOT NULL DEFAULT '0' COMMENT '金币',
  `mobile` varchar(20) NOT NULL DEFAULT '' COMMENT '手机号',
  PRIMARY KEY (`id`),
  KEY `user_login_key` (`user_login`),
  KEY `user_nicename` (`user_nicename`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='用户表' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `yyg_route`
--

CREATE TABLE IF NOT EXISTS `yyg_route` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '路由id',
  `full_url` varchar(255) DEFAULT NULL COMMENT '完整url， 如：portal/list/index?id=1',
  `url` varchar(255) DEFAULT NULL COMMENT '实际显示的url',
  `listorder` int(5) DEFAULT '0' COMMENT '排序，优先级，越小优先级越高',
  `status` tinyint(1) DEFAULT '1' COMMENT '状态，1：启用 ;0：不启用',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='url路由表' AUTO_INCREMENT=1 ;


--
-- 表的结构 `yyg_posts`
--

CREATE TABLE IF NOT EXISTS `yyg_posts` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `post_author` bigint(20) unsigned DEFAULT '0' COMMENT '发表者id',
  `post_keywords` varchar(150) NOT NULL COMMENT 'seo keywords',
  `post_source` varchar(150) DEFAULT NULL COMMENT '转载文章的来源',
  `post_date` datetime DEFAULT '2000-01-01 00:00:00' COMMENT 'post创建日期，永久不变，一般不显示给用户',
  `post_content` longtext COMMENT 'post内容',
  `post_title` text COMMENT 'post标题',
  `post_excerpt` text COMMENT 'post摘要',
  `post_status` int(2) DEFAULT '1' COMMENT 'post状态，1已审核，0未审核',
  `comment_status` int(2) DEFAULT '1' COMMENT '评论状态，1允许，0不允许',
  `post_modified` datetime DEFAULT '2000-01-01 00:00:00' COMMENT 'post更新时间，可在前台修改，显示给用户',
  `post_content_filtered` longtext,
  `post_parent` bigint(20) unsigned DEFAULT '0' COMMENT 'post的父级post id,表示post层级关系',
  `post_type` int(2) DEFAULT NULL,
  `post_mime_type` varchar(100) DEFAULT '',
  `comment_count` bigint(20) DEFAULT '0',
  `smeta` text COMMENT 'post的扩展字段，保存相关扩展属性，如缩略图；格式为json',
  `post_hits` int(11) DEFAULT '0' COMMENT 'post点击数，查看数',
  `post_like` int(11) DEFAULT '0' COMMENT 'post赞数',
  `istop` tinyint(1) NOT NULL DEFAULT '0' COMMENT '置顶 1置顶； 0不置顶',
  `recommended` tinyint(1) NOT NULL DEFAULT '0' COMMENT '推荐 1推荐 0不推荐',
  PRIMARY KEY (`id`),
  KEY `type_status_date` (`post_type`,`post_status`,`post_date`,`id`),
  KEY `post_parent` (`post_parent`),
  KEY `post_author` (`post_author`),
  KEY `post_date` (`post_date`) USING BTREE
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='Portal文章表' AUTO_INCREMENT=1 ;

--
-- 表的结构 `yyg_terms`
--

CREATE TABLE IF NOT EXISTS `yyg_terms` (
  `term_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '分类id',
  `name` varchar(200) DEFAULT NULL COMMENT '分类名称',
  `slug` varchar(200) DEFAULT '',
  `taxonomy` varchar(32) DEFAULT NULL COMMENT '分类类型',
  `description` longtext COMMENT '分类描述',
  `parent` bigint(20) unsigned DEFAULT '0' COMMENT '分类父id',
  `count` bigint(20) DEFAULT '0' COMMENT '分类文章数',
  `path` varchar(500) DEFAULT NULL COMMENT '分类层级关系路径',
  `seo_title` varchar(500) DEFAULT NULL,
  `seo_keywords` varchar(500) DEFAULT NULL,
  `seo_description` varchar(500) DEFAULT NULL,
  `list_tpl` varchar(50) DEFAULT NULL COMMENT '分类列表模板',
  `one_tpl` varchar(50) DEFAULT NULL COMMENT '分类文章页模板',
  `listorder` int(5) NOT NULL DEFAULT '0' COMMENT '排序',
  `status` int(2) NOT NULL DEFAULT '1' COMMENT '状态，1发布，0不发布',
  PRIMARY KEY (`term_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='Portal 文章分类表' AUTO_INCREMENT=3 ;


--
-- 表的结构 `yyg_cates`
--

CREATE TABLE IF NOT EXISTS `yyg_cates` (
  `cate_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '分类id',
  `name` varchar(200) DEFAULT NULL COMMENT '分类名称',
  `slug` varchar(200) DEFAULT '',
  `description` longtext COMMENT '分类描述',
  `parent` bigint(20) unsigned DEFAULT '0' COMMENT '分类父id',
  `count` bigint(20) DEFAULT '0' COMMENT '分类商品数',
  `path` varchar(500) DEFAULT NULL COMMENT '分类层级关系路径',
  `seo_title` varchar(500) DEFAULT NULL,
  `seo_keywords` varchar(500) DEFAULT NULL,
  `seo_description` varchar(500) DEFAULT NULL,
  `list_tpl` varchar(50) DEFAULT NULL COMMENT '分类列表模板',
  `one_tpl` varchar(50) DEFAULT NULL COMMENT '分类文章页模板',
  `listorder` int(5) NOT NULL DEFAULT '0' COMMENT '排序',
  `status` int(2) NOT NULL DEFAULT '1' COMMENT '状态，1发布，0不发布',
  PRIMARY KEY (`cate_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='Portal 商品分类表' AUTO_INCREMENT=3 ;

--
-- 表的结构 `yyg_term_relationships`
--

CREATE TABLE IF NOT EXISTS `yyg_term_relationships` (
  `tid` bigint(20) NOT NULL AUTO_INCREMENT,
  `object_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT 'posts表里文章id',
  `term_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '分类id',
  `listorder` int(10) NOT NULL DEFAULT '0' COMMENT '排序',
  `status` int(2) NOT NULL DEFAULT '1' COMMENT '状态，1发布，0不发布',
  PRIMARY KEY (`tid`),
  KEY `term_taxonomy_id` (`term_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='Portal 文章分类对应表' AUTO_INCREMENT=1 ;
--
-- 表的结构 `yyg_role`
--

CREATE TABLE IF NOT EXISTS `yyg_role` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL COMMENT '角色名称',
  `pid` smallint(6) DEFAULT NULL COMMENT '父角色ID',
  `status` tinyint(1) unsigned DEFAULT NULL COMMENT '状态',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `listorder` int(3) NOT NULL DEFAULT '0' COMMENT '排序字段',
  PRIMARY KEY (`id`),
  KEY `parentId` (`pid`),
  KEY `status` (`status`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='角色表' AUTO_INCREMENT=2 ;

--
-- 导出表中的数据 `yyg_role`
--

INSERT INTO `yyg_role` VALUES (1, '超级管理员', 0, 1, '拥有网站最高管理员权限！', 1329633709, 1329633709, 0);
-- --------------------------------------------------------

--
-- 表的结构 `yyg_role_user`
--

CREATE TABLE IF NOT EXISTS `yyg_role_user` (
  `role_id` int(11) unsigned DEFAULT '0' COMMENT '角色 id',
  `user_id` int(11) DEFAULT '0' COMMENT '用户id',
  KEY `group_id` (`role_id`),
  KEY `user_id` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='用户角色对应表';

--
-- 导出表中的数据 `yyg_role_user`
--

-- ----------------------------
-- Table structure for sp_auth_access
-- ----------------------------
CREATE TABLE IF NOT EXISTS `yyg_auth_access` (
  `role_id` mediumint(8) unsigned NOT NULL COMMENT '角色',
  `rule_name` varchar(255) NOT NULL COMMENT '规则唯一英文标识,全小写',
  `type` varchar(30) DEFAULT NULL COMMENT '权限规则分类，请加应用前缀,如admin_',
  KEY `role_id` (`role_id`),
  KEY `rule_name` (`rule_name`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='权限授权表';

-- ----------------------------
-- Table structure for sp_auth_rule
-- ----------------------------
CREATE TABLE IF NOT EXISTS `yyg_auth_rule` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '规则id,自增主键',
  `module` varchar(20) NOT NULL COMMENT '规则所属module',
  `type` varchar(30) NOT NULL DEFAULT '1' COMMENT '权限规则分类，请加应用前缀,如admin_',
  `name` varchar(255) NOT NULL DEFAULT '' COMMENT '规则唯一英文标识,全小写',
  `param` varchar(255) DEFAULT NULL COMMENT '额外url参数',
  `title` varchar(20) NOT NULL DEFAULT '' COMMENT '规则中文描述',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否有效(0:无效,1:有效)',
  `condition` varchar(300) NOT NULL DEFAULT '' COMMENT '规则附加条件',
  PRIMARY KEY (`id`),
  KEY `module` (`module`,`status`,`type`)
) ENGINE=MyISAM AUTO_INCREMENT=156 DEFAULT CHARSET=utf8 COMMENT='权限规则表';

INSERT INTO `yyg_auth_rule` VALUES(1, 'Admin', 'admin_url', 'admin/content/default', NULL, '内容管理', 1, '');
INSERT INTO `yyg_auth_rule` VALUES(2, 'Api', 'admin_url', 'api/guestbookadmin/index', NULL, '所有留言', 1, '');
INSERT INTO `yyg_auth_rule` VALUES(3, 'Api', 'admin_url', 'api/guestbookadmin/delete', NULL, '删除网站留言', 1, '');
INSERT INTO `yyg_auth_rule` VALUES(4, 'Comment', 'admin_url', 'comment/commentadmin/index', NULL, '评论管理', 1, '');
INSERT INTO `yyg_auth_rule` VALUES(5, 'Comment', 'admin_url', 'comment/commentadmin/delete', NULL, '删除评论', 1, '');
INSERT INTO `yyg_auth_rule` VALUES(6, 'Comment', 'admin_url', 'comment/commentadmin/check', NULL, '评论审核', 1, '');
INSERT INTO `yyg_auth_rule` VALUES(7, 'Portal', 'admin_url', 'portal/adminpost/index', NULL, '文章管理', 1, '');
INSERT INTO `yyg_auth_rule` VALUES(8, 'Portal', 'admin_url', 'portal/adminpost/listorders', NULL, '文章排序', 1, '');
INSERT INTO `yyg_auth_rule` VALUES(9, 'Portal', 'admin_url', 'portal/adminpost/top', NULL, '文章置顶', 1, '');
INSERT INTO `yyg_auth_rule` VALUES(10, 'Portal', 'admin_url', 'portal/adminpost/recommend', NULL, '文章推荐', 1, '');
INSERT INTO `yyg_auth_rule` VALUES(11, 'Portal', 'admin_url', 'portal/adminpost/move', NULL, '批量移动', 1, '');
INSERT INTO `yyg_auth_rule` VALUES(12, 'Portal', 'admin_url', 'portal/adminpost/check', NULL, '文章审核', 1, '');
INSERT INTO `yyg_auth_rule` VALUES(13, 'Portal', 'admin_url', 'portal/adminpost/delete', NULL, '删除文章', 1, '');
INSERT INTO `yyg_auth_rule` VALUES(14, 'Portal', 'admin_url', 'portal/adminpost/edit', NULL, '编辑文章', 1, '');
INSERT INTO `yyg_auth_rule` VALUES(15, 'Portal', 'admin_url', 'portal/adminpost/edit_post', NULL, '提交编辑', 1, '');
INSERT INTO `yyg_auth_rule` VALUES(16, 'Portal', 'admin_url', 'portal/adminpost/add', NULL, '添加文章', 1, '');
INSERT INTO `yyg_auth_rule` VALUES(17, 'Portal', 'admin_url', 'portal/adminpost/add_post', NULL, '提交添加', 1, '');
INSERT INTO `yyg_auth_rule` VALUES(18, 'Portal', 'admin_url', 'portal/adminterm/index', NULL, '分类管理', 1, '');
INSERT INTO `yyg_auth_rule` VALUES(19, 'Portal', 'admin_url', 'portal/adminterm/listorders', NULL, '文章分类排序', 1, '');
INSERT INTO `yyg_auth_rule` VALUES(20, 'Portal', 'admin_url', 'portal/adminterm/delete', NULL, '删除分类', 1, '');
INSERT INTO `yyg_auth_rule` VALUES(21, 'Portal', 'admin_url', 'portal/adminterm/edit', NULL, '编辑分类', 1, '');
INSERT INTO `yyg_auth_rule` VALUES(22, 'Portal', 'admin_url', 'portal/adminterm/edit_post', NULL, '提交编辑', 1, '');
INSERT INTO `yyg_auth_rule` VALUES(23, 'Portal', 'admin_url', 'portal/adminterm/add', NULL, '添加分类', 1, '');
INSERT INTO `yyg_auth_rule` VALUES(24, 'Portal', 'admin_url', 'portal/adminterm/add_post', NULL, '提交添加', 1, '');
INSERT INTO `yyg_auth_rule` VALUES(25, 'Portal', 'admin_url', 'portal/adminpage/index', NULL, '页面管理', 1, '');
INSERT INTO `yyg_auth_rule` VALUES(26, 'Portal', 'admin_url', 'portal/adminpage/listorders', NULL, '页面排序', 1, '');
INSERT INTO `yyg_auth_rule` VALUES(27, 'Portal', 'admin_url', 'portal/adminpage/delete', NULL, '删除页面', 1, '');
INSERT INTO `yyg_auth_rule` VALUES(28, 'Portal', 'admin_url', 'portal/adminpage/edit', NULL, '编辑页面', 1, '');
INSERT INTO `yyg_auth_rule` VALUES(29, 'Portal', 'admin_url', 'portal/adminpage/edit_post', NULL, '提交编辑', 1, '');
INSERT INTO `yyg_auth_rule` VALUES(30, 'Portal', 'admin_url', 'portal/adminpage/add', NULL, '添加页面', 1, '');
INSERT INTO `yyg_auth_rule` VALUES(31, 'Portal', 'admin_url', 'portal/adminpage/add_post', NULL, '提交添加', 1, '');
INSERT INTO `yyg_auth_rule` VALUES(32, 'Admin', 'admin_url', 'admin/recycle/default', NULL, '回收站', 1, '');
INSERT INTO `yyg_auth_rule` VALUES(33, 'Portal', 'admin_url', 'portal/adminpost/recyclebin', NULL, '文章回收', 1, '');
INSERT INTO `yyg_auth_rule` VALUES(34, 'Portal', 'admin_url', 'portal/adminpost/restore', NULL, '文章还原', 1, '');
INSERT INTO `yyg_auth_rule` VALUES(35, 'Portal', 'admin_url', 'portal/adminpost/clean', NULL, '彻底删除', 1, '');
INSERT INTO `yyg_auth_rule` VALUES(36, 'Portal', 'admin_url', 'portal/adminpage/recyclebin', NULL, '页面回收', 1, '');
INSERT INTO `yyg_auth_rule` VALUES(37, 'Portal', 'admin_url', 'portal/adminpage/clean', NULL, '彻底删除', 1, '');
INSERT INTO `yyg_auth_rule` VALUES(38, 'Portal', 'admin_url', 'portal/adminpage/restore', NULL, '页面还原', 1, '');
INSERT INTO `yyg_auth_rule` VALUES(39, 'Admin', 'admin_url', 'admin/extension/default', NULL, '扩展工具', 1, '');
INSERT INTO `yyg_auth_rule` VALUES(40, 'Admin', 'admin_url', 'admin/backup/default', NULL, '备份管理', 1, '');
INSERT INTO `yyg_auth_rule` VALUES(41, 'Admin', 'admin_url', 'admin/backup/restore', NULL, '数据还原', 1, '');
INSERT INTO `yyg_auth_rule` VALUES(42, 'Admin', 'admin_url', 'admin/backup/index', NULL, '数据备份', 1, '');
INSERT INTO `yyg_auth_rule` VALUES(43, 'Admin', 'admin_url', 'admin/backup/index_post', NULL, '提交数据备份', 1, '');
INSERT INTO `yyg_auth_rule` VALUES(44, 'Admin', 'admin_url', 'admin/backup/download', NULL, '下载备份', 1, '');
INSERT INTO `yyg_auth_rule` VALUES(45, 'Admin', 'admin_url', 'admin/backup/del_backup', NULL, '删除备份', 1, '');
INSERT INTO `yyg_auth_rule` VALUES(46, 'Admin', 'admin_url', 'admin/backup/import', NULL, '数据备份导入', 1, '');
INSERT INTO `yyg_auth_rule` VALUES(47, 'Admin', 'admin_url', 'admin/plugin/index', NULL, '插件管理', 1, '');
INSERT INTO `yyg_auth_rule` VALUES(48, 'Admin', 'admin_url', 'admin/plugin/toggle', NULL, '插件启用切换', 1, '');
INSERT INTO `yyg_auth_rule` VALUES(49, 'Admin', 'admin_url', 'admin/plugin/setting', NULL, '插件设置', 1, '');
INSERT INTO `yyg_auth_rule` VALUES(50, 'Admin', 'admin_url', 'admin/plugin/setting_post', NULL, '插件设置提交', 1, '');
INSERT INTO `yyg_auth_rule` VALUES(51, 'Admin', 'admin_url', 'admin/plugin/install', NULL, '插件安装', 1, '');
INSERT INTO `yyg_auth_rule` VALUES(52, 'Admin', 'admin_url', 'admin/plugin/uninstall', NULL, '插件卸载', 1, '');
INSERT INTO `yyg_auth_rule` VALUES(53, 'Admin', 'admin_url', 'admin/slide/default', NULL, '幻灯片', 1, '');
INSERT INTO `yyg_auth_rule` VALUES(54, 'Admin', 'admin_url', 'admin/slide/index', NULL, '幻灯片管理', 1, '');
INSERT INTO `yyg_auth_rule` VALUES(55, 'Admin', 'admin_url', 'admin/slide/listorders', NULL, '幻灯片排序', 1, '');
INSERT INTO `yyg_auth_rule` VALUES(56, 'Admin', 'admin_url', 'admin/slide/toggle', NULL, '幻灯片显示切换', 1, '');
INSERT INTO `yyg_auth_rule` VALUES(57, 'Admin', 'admin_url', 'admin/slide/delete', NULL, '删除幻灯片', 1, '');
INSERT INTO `yyg_auth_rule` VALUES(58, 'Admin', 'admin_url', 'admin/slide/edit', NULL, '编辑幻灯片', 1, '');
INSERT INTO `yyg_auth_rule` VALUES(59, 'Admin', 'admin_url', 'admin/slide/edit_post', NULL, '提交编辑', 1, '');
INSERT INTO `yyg_auth_rule` VALUES(60, 'Admin', 'admin_url', 'admin/slide/add', NULL, '添加幻灯片', 1, '');
INSERT INTO `yyg_auth_rule` VALUES(61, 'Admin', 'admin_url', 'admin/slide/add_post', NULL, '提交添加', 1, '');
INSERT INTO `yyg_auth_rule` VALUES(62, 'Admin', 'admin_url', 'admin/slidecat/index', NULL, '幻灯片分类', 1, '');
INSERT INTO `yyg_auth_rule` VALUES(63, 'Admin', 'admin_url', 'admin/slidecat/delete', NULL, '删除分类', 1, '');
INSERT INTO `yyg_auth_rule` VALUES(64, 'Admin', 'admin_url', 'admin/slidecat/edit', NULL, '编辑分类', 1, '');
INSERT INTO `yyg_auth_rule` VALUES(65, 'Admin', 'admin_url', 'admin/slidecat/edit_post', NULL, '提交编辑', 1, '');
INSERT INTO `yyg_auth_rule` VALUES(66, 'Admin', 'admin_url', 'admin/slidecat/add', NULL, '添加分类', 1, '');
INSERT INTO `yyg_auth_rule` VALUES(67, 'Admin', 'admin_url', 'admin/slidecat/add_post', NULL, '提交添加', 1, '');
INSERT INTO `yyg_auth_rule` VALUES(68, 'Admin', 'admin_url', 'admin/ad/index', NULL, '网站广告', 1, '');
INSERT INTO `yyg_auth_rule` VALUES(69, 'Admin', 'admin_url', 'admin/ad/toggle', NULL, '广告显示切换', 1, '');
INSERT INTO `yyg_auth_rule` VALUES(70, 'Admin', 'admin_url', 'admin/ad/delete', NULL, '删除广告', 1, '');
INSERT INTO `yyg_auth_rule` VALUES(71, 'Admin', 'admin_url', 'admin/ad/edit', NULL, '编辑广告', 1, '');
INSERT INTO `yyg_auth_rule` VALUES(72, 'Admin', 'admin_url', 'admin/ad/edit_post', NULL, '提交编辑', 1, '');
INSERT INTO `yyg_auth_rule` VALUES(73, 'Admin', 'admin_url', 'admin/ad/add', NULL, '添加广告', 1, '');
INSERT INTO `yyg_auth_rule` VALUES(74, 'Admin', 'admin_url', 'admin/ad/add_post', NULL, '提交添加', 1, '');
INSERT INTO `yyg_auth_rule` VALUES(75, 'Admin', 'admin_url', 'admin/link/index', NULL, '友情链接', 1, '');
INSERT INTO `yyg_auth_rule` VALUES(76, 'Admin', 'admin_url', 'admin/link/listorders', NULL, '友情链接排序', 1, '');
INSERT INTO `yyg_auth_rule` VALUES(77, 'Admin', 'admin_url', 'admin/link/toggle', NULL, '友链显示切换', 1, '');
INSERT INTO `yyg_auth_rule` VALUES(78, 'Admin', 'admin_url', 'admin/link/delete', NULL, '删除友情链接', 1, '');
INSERT INTO `yyg_auth_rule` VALUES(79, 'Admin', 'admin_url', 'admin/link/edit', NULL, '编辑友情链接', 1, '');
INSERT INTO `yyg_auth_rule` VALUES(80, 'Admin', 'admin_url', 'admin/link/edit_post', NULL, '提交编辑', 1, '');
INSERT INTO `yyg_auth_rule` VALUES(81, 'Admin', 'admin_url', 'admin/link/add', NULL, '添加友情链接', 1, '');
INSERT INTO `yyg_auth_rule` VALUES(82, 'Admin', 'admin_url', 'admin/link/add_post', NULL, '提交添加', 1, '');
INSERT INTO `yyg_auth_rule` VALUES(83, 'Api', 'admin_url', 'api/oauthadmin/setting', NULL, '第三方登陆', 1, '');
INSERT INTO `yyg_auth_rule` VALUES(84, 'Api', 'admin_url', 'api/oauthadmin/setting_post', NULL, '提交设置', 1, '');
INSERT INTO `yyg_auth_rule` VALUES(85, 'Admin', 'admin_url', 'admin/menu/default', NULL, '菜单管理', 1, '');
INSERT INTO `yyg_auth_rule` VALUES(86, 'Admin', 'admin_url', 'admin/navcat/default1', NULL, '前台菜单', 1, '');
INSERT INTO `yyg_auth_rule` VALUES(87, 'Admin', 'admin_url', 'admin/nav/index', NULL, '菜单管理', 1, '');
INSERT INTO `yyg_auth_rule` VALUES(88, 'Admin', 'admin_url', 'admin/nav/listorders', NULL, '前台导航排序', 1, '');
INSERT INTO `yyg_auth_rule` VALUES(89, 'Admin', 'admin_url', 'admin/nav/delete', NULL, '删除菜单', 1, '');
INSERT INTO `yyg_auth_rule` VALUES(90, 'Admin', 'admin_url', 'admin/nav/edit', NULL, '编辑菜单', 1, '');
INSERT INTO `yyg_auth_rule` VALUES(91, 'Admin', 'admin_url', 'admin/nav/edit_post', NULL, '提交编辑', 1, '');
INSERT INTO `yyg_auth_rule` VALUES(92, 'Admin', 'admin_url', 'admin/nav/add', NULL, '添加菜单', 1, '');
INSERT INTO `yyg_auth_rule` VALUES(93, 'Admin', 'admin_url', 'admin/nav/add_post', NULL, '提交添加', 1, '');
INSERT INTO `yyg_auth_rule` VALUES(94, 'Admin', 'admin_url', 'admin/navcat/index', NULL, '菜单分类', 1, '');
INSERT INTO `yyg_auth_rule` VALUES(95, 'Admin', 'admin_url', 'admin/navcat/delete', NULL, '删除分类', 1, '');
INSERT INTO `yyg_auth_rule` VALUES(96, 'Admin', 'admin_url', 'admin/navcat/edit', NULL, '编辑分类', 1, '');
INSERT INTO `yyg_auth_rule` VALUES(97, 'Admin', 'admin_url', 'admin/navcat/edit_post', NULL, '提交编辑', 1, '');
INSERT INTO `yyg_auth_rule` VALUES(98, 'Admin', 'admin_url', 'admin/navcat/add', NULL, '添加分类', 1, '');
INSERT INTO `yyg_auth_rule` VALUES(99, 'Admin', 'admin_url', 'admin/navcat/add_post', NULL, '提交添加', 1, '');
INSERT INTO `yyg_auth_rule` VALUES(100, 'Admin', 'admin_url', 'admin/menu/index', NULL, '后台菜单', 1, '');
INSERT INTO `yyg_auth_rule` VALUES(101, 'Admin', 'admin_url', 'admin/menu/add', NULL, '添加菜单', 1, '');
INSERT INTO `yyg_auth_rule` VALUES(102, 'Admin', 'admin_url', 'admin/menu/add_post', NULL, '提交添加', 1, '');
INSERT INTO `yyg_auth_rule` VALUES(103, 'Admin', 'admin_url', 'admin/menu/listorders', NULL, '后台菜单排序', 1, '');
INSERT INTO `yyg_auth_rule` VALUES(104, 'Admin', 'admin_url', 'admin/menu/export_menu', NULL, '菜单备份', 1, '');
INSERT INTO `yyg_auth_rule` VALUES(105, 'Admin', 'admin_url', 'admin/menu/edit', NULL, '编辑菜单', 1, '');
INSERT INTO `yyg_auth_rule` VALUES(106, 'Admin', 'admin_url', 'admin/menu/edit_post', NULL, '提交编辑', 1, '');
INSERT INTO `yyg_auth_rule` VALUES(107, 'Admin', 'admin_url', 'admin/menu/delete', NULL, '删除菜单', 1, '');
INSERT INTO `yyg_auth_rule` VALUES(108, 'Admin', 'admin_url', 'admin/menu/lists', NULL, '所有菜单', 1, '');
INSERT INTO `yyg_auth_rule` VALUES(109, 'Admin', 'admin_url', 'admin/setting/default', NULL, '设置', 1, '');
INSERT INTO `yyg_auth_rule` VALUES(110, 'Admin', 'admin_url', 'admin/setting/userdefault', NULL, '个人信息', 1, '');
INSERT INTO `yyg_auth_rule` VALUES(111, 'Admin', 'admin_url', 'admin/user/userinfo', NULL, '修改信息', 1, '');
INSERT INTO `yyg_auth_rule` VALUES(112, 'Admin', 'admin_url', 'admin/user/userinfo_post', NULL, '修改信息提交', 1, '');
INSERT INTO `yyg_auth_rule` VALUES(113, 'Admin', 'admin_url', 'admin/setting/password', NULL, '修改密码', 1, '');
INSERT INTO `yyg_auth_rule` VALUES(114, 'Admin', 'admin_url', 'admin/setting/password_post', NULL, '提交修改', 1, '');
INSERT INTO `yyg_auth_rule` VALUES(115, 'Admin', 'admin_url', 'admin/setting/site', NULL, '网站信息', 1, '');
INSERT INTO `yyg_auth_rule` VALUES(116, 'Admin', 'admin_url', 'admin/setting/site_post', NULL, '提交修改', 1, '');
INSERT INTO `yyg_auth_rule` VALUES(117, 'Admin', 'admin_url', 'admin/route/index', NULL, '路由列表', 1, '');
INSERT INTO `yyg_auth_rule` VALUES(118, 'Admin', 'admin_url', 'admin/route/add', NULL, '路由添加', 1, '');
INSERT INTO `yyg_auth_rule` VALUES(119, 'Admin', 'admin_url', 'admin/route/add_post', NULL, '路由添加提交', 1, '');
INSERT INTO `yyg_auth_rule` VALUES(120, 'Admin', 'admin_url', 'admin/route/edit', NULL, '路由编辑', 1, '');
INSERT INTO `yyg_auth_rule` VALUES(121, 'Admin', 'admin_url', 'admin/route/edit_post', NULL, '路由编辑提交', 1, '');
INSERT INTO `yyg_auth_rule` VALUES(122, 'Admin', 'admin_url', 'admin/route/delete', NULL, '路由删除', 1, '');
INSERT INTO `yyg_auth_rule` VALUES(123, 'Admin', 'admin_url', 'admin/route/ban', NULL, '路由禁止', 1, '');
INSERT INTO `yyg_auth_rule` VALUES(124, 'Admin', 'admin_url', 'admin/route/open', NULL, '路由启用', 1, '');
INSERT INTO `yyg_auth_rule` VALUES(125, 'Admin', 'admin_url', 'admin/route/listorders', NULL, '路由排序', 1, '');
INSERT INTO `yyg_auth_rule` VALUES(126, 'Admin', 'admin_url', 'admin/mailer/default', NULL, '邮箱配置', 1, '');
INSERT INTO `yyg_auth_rule` VALUES(127, 'Admin', 'admin_url', 'admin/mailer/index', NULL, 'SMTP配置', 1, '');
INSERT INTO `yyg_auth_rule` VALUES(128, 'Admin', 'admin_url', 'admin/mailer/index_post', NULL, '提交配置', 1, '');
INSERT INTO `yyg_auth_rule` VALUES(129, 'Admin', 'admin_url', 'admin/mailer/active', NULL, '邮件模板', 1, '');
INSERT INTO `yyg_auth_rule` VALUES(130, 'Admin', 'admin_url', 'admin/mailer/active_post', NULL, '提交模板', 1, '');
INSERT INTO `yyg_auth_rule` VALUES(131, 'Admin', 'admin_url', 'admin/setting/clearcache', NULL, '清除缓存', 1, '');
INSERT INTO `yyg_auth_rule` VALUES(132, 'User', 'admin_url', 'user/indexadmin/default', NULL, '用户管理', 1, '');
INSERT INTO `yyg_auth_rule` VALUES(133, 'User', 'admin_url', 'user/indexadmin/default1', NULL, '用户组', 1, '');
INSERT INTO `yyg_auth_rule` VALUES(134, 'User', 'admin_url', 'user/indexadmin/index', NULL, '本站用户', 1, '');
INSERT INTO `yyg_auth_rule` VALUES(135, 'User', 'admin_url', 'user/indexadmin/ban', NULL, '拉黑会员', 1, '');
INSERT INTO `yyg_auth_rule` VALUES(136, 'User', 'admin_url', 'user/indexadmin/cancelban', NULL, '启用会员', 1, '');
INSERT INTO `yyg_auth_rule` VALUES(137, 'User', 'admin_url', 'user/oauthadmin/index', NULL, '第三方用户', 1, '');
INSERT INTO `yyg_auth_rule` VALUES(138, 'User', 'admin_url', 'user/oauthadmin/delete', NULL, '第三方用户解绑', 1, '');
INSERT INTO `yyg_auth_rule` VALUES(139, 'User', 'admin_url', 'user/indexadmin/default3', NULL, '管理组', 1, '');
INSERT INTO `yyg_auth_rule` VALUES(140, 'Admin', 'admin_url', 'admin/rbac/index', NULL, '角色管理', 1, '');
INSERT INTO `yyg_auth_rule` VALUES(141, 'Admin', 'admin_url', 'admin/rbac/member', NULL, '成员管理', 1, '');
INSERT INTO `yyg_auth_rule` VALUES(142, 'Admin', 'admin_url', 'admin/rbac/authorize', NULL, '权限设置', 1, '');
INSERT INTO `yyg_auth_rule` VALUES(143, 'Admin', 'admin_url', 'admin/rbac/authorize_post', NULL, '提交设置', 1, '');
INSERT INTO `yyg_auth_rule` VALUES(144, 'Admin', 'admin_url', 'admin/rbac/roleedit', NULL, '编辑角色', 1, '');
INSERT INTO `yyg_auth_rule` VALUES(145, 'Admin', 'admin_url', 'admin/rbac/roleedit_post', NULL, '提交编辑', 1, '');
INSERT INTO `yyg_auth_rule` VALUES(146, 'Admin', 'admin_url', 'admin/rbac/roledelete', NULL, '删除角色', 1, '');
INSERT INTO `yyg_auth_rule` VALUES(147, 'Admin', 'admin_url', 'admin/rbac/roleadd', NULL, '添加角色', 1, '');
INSERT INTO `yyg_auth_rule` VALUES(148, 'Admin', 'admin_url', 'admin/rbac/roleadd_post', NULL, '提交添加', 1, '');
INSERT INTO `yyg_auth_rule` VALUES(149, 'Admin', 'admin_url', 'admin/user/index', NULL, '管理员', 1, '');
INSERT INTO `yyg_auth_rule` VALUES(150, 'Admin', 'admin_url', 'admin/user/delete', NULL, '删除管理员', 1, '');
INSERT INTO `yyg_auth_rule` VALUES(151, 'Admin', 'admin_url', 'admin/user/edit', NULL, '管理员编辑', 1, '');
INSERT INTO `yyg_auth_rule` VALUES(152, 'Admin', 'admin_url', 'admin/user/edit_post', NULL, '编辑提交', 1, '');
INSERT INTO `yyg_auth_rule` VALUES(153, 'Admin', 'admin_url', 'admin/user/add', NULL, '管理员添加', 1, '');
INSERT INTO `yyg_auth_rule` VALUES(154, 'Admin', 'admin_url', 'admin/user/add_post', NULL, '添加提交', 1, '');
INSERT INTO `yyg_auth_rule` VALUES(155, 'Admin', 'admin_url', 'admin/plugin/update', NULL, '插件更新', 1, '');
INSERT INTO `yyg_auth_rule` VALUES(156, 'Admin', 'admin_url', 'admin/storage/index', NULL, '文件存储', 1, '');
INSERT INTO `yyg_auth_rule` VALUES(157, 'Admin', 'admin_url', 'admin/storage/setting_post', NULL, '文件存储设置提交', 1, '');
INSERT INTO `yyg_auth_rule` VALUES(158, 'Admin', 'admin_url', 'admin/slide/ban', NULL, '禁用幻灯片', 1, '');
INSERT INTO `yyg_auth_rule` VALUES(159, 'Admin', 'admin_url', 'admin/slide/cancelban', NULL, '启用幻灯片', 1, '');
INSERT INTO `yyg_auth_rule` VALUES(160, 'Admin', 'admin_url', 'admin/user/ban', NULL, '禁用管理员', 1, '');
INSERT INTO `yyg_auth_rule` VALUES(161, 'Admin', 'admin_url', 'admin/user/cancelban', NULL, '启用管理员', 1, '');

CREATE TABLE IF NOT EXISTS `yyg_plugins` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `name` varchar(50) NOT NULL COMMENT '插件名，英文',
  `title` varchar(50) NOT NULL DEFAULT '' COMMENT '插件名称',
  `description` text COMMENT '插件描述',
  `type` tinyint(2) DEFAULT '0' COMMENT '插件类型, 1:网站；8;微信',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态；1开启；',
  `config` text COMMENT '插件配置',
  `hooks` varchar(255) DEFAULT NULL COMMENT '实现的钩子;以“，”分隔',
  `has_admin` tinyint(2) DEFAULT '0' COMMENT '插件是否有后台管理界面',
  `author` varchar(50) DEFAULT '' COMMENT '插件作者',
  `version` varchar(20) DEFAULT '' COMMENT '插件版本号',
  `createtime` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '插件安装时间',
  `listorder` smallint(6) NOT NULL DEFAULT '0' COMMENT '排序',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COMMENT='插件表';

--
-- 导出表中的数据 `yyg_options`
--

INSERT INTO `yyg_options` VALUES (1, 'member_email_active', '{"title":"ThinkYYG\\u90ae\\u4ef6\\u6fc0\\u6d3b\\u901a\\u77e5.","template":"<p>\\u672c\\u90ae\\u4ef6\\u6765\\u81ea<a href=\\"http:\\/\\/www.thinkyyg.com\\">ThinkYYG<\\/a><br\\/><br\\/>&nbsp; &nbsp;<strong>---------------<\\/strong><br\\/>&nbsp; &nbsp;<strong>\\u5e10\\u53f7\\u6fc0\\u6d3b\\u8bf4\\u660e<\\/strong><br\\/>&nbsp; &nbsp;<strong>---------------<\\/strong><br\\/><br\\/>&nbsp; &nbsp; \\u5c0a\\u656c\\u7684<span style=\\"FONT-SIZE: 16px; FONT-FAMILY: Arial; COLOR: rgb(51,51,51); LINE-HEIGHT: 18px; BACKGROUND-COLOR: rgb(255,255,255)\\">#username#\\uff0c\\u60a8\\u597d\\u3002<\\/span>\\u5982\\u679c\\u60a8\\u662fThinkYYG\\u7684\\u65b0\\u7528\\u6237\\uff0c\\u6216\\u5728\\u4fee\\u6539\\u60a8\\u7684\\u6ce8\\u518cEmail\\u65f6\\u4f7f\\u7528\\u4e86\\u672c\\u5730\\u5740\\uff0c\\u6211\\u4eec\\u9700\\u8981\\u5bf9\\u60a8\\u7684\\u5730\\u5740\\u6709\\u6548\\u6027\\u8fdb\\u884c\\u9a8c\\u8bc1\\u4ee5\\u907f\\u514d\\u5783\\u573e\\u90ae\\u4ef6\\u6216\\u5730\\u5740\\u88ab\\u6ee5\\u7528\\u3002<br\\/>&nbsp; &nbsp; \\u60a8\\u53ea\\u9700\\u70b9\\u51fb\\u4e0b\\u9762\\u7684\\u94fe\\u63a5\\u5373\\u53ef\\u6fc0\\u6d3b\\u60a8\\u7684\\u5e10\\u53f7\\uff1a<br\\/>&nbsp; &nbsp; <a title=\\"\\" href=\\"http:\\/\\/#link#\\" target=\\"_self\\">http:\\/\\/#link#<\\/a><br\\/>&nbsp; &nbsp; (\\u5982\\u679c\\u4e0a\\u9762\\u4e0d\\u662f\\u94fe\\u63a5\\u5f62\\u5f0f\\uff0c\\u8bf7\\u5c06\\u8be5\\u5730\\u5740\\u624b\\u5de5\\u7c98\\u8d34\\u5230\\u6d4f\\u89c8\\u5668\\u5730\\u5740\\u680f\\u518d\\u8bbf\\u95ee)<br\\/>&nbsp; &nbsp; \\u611f\\u8c22\\u60a8\\u7684\\u8bbf\\u95ee\\uff0c\\u795d\\u60a8\\u4f7f\\u7528\\u6109\\u5feb\\uff01<br\\/><br\\/>&nbsp; &nbsp; \\u6b64\\u81f4<br\\/>&nbsp; &nbsp; ThinkYYG \\u7ba1\\u7406\\u56e2\\u961f.<\\/p>"}', 1);

-- --------------------------------------------------------

--
-- 表的结构 `yyg_slide`
--

CREATE TABLE IF NOT EXISTS `yyg_slide` (
  `slide_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `slide_cid` int(11) NOT NULL COMMENT '幻灯片分类 id',
  `slide_name` varchar(255) NOT NULL COMMENT '幻灯片名称',
  `slide_pic` varchar(255) DEFAULT NULL COMMENT '幻灯片图片',
  `slide_url` varchar(255) DEFAULT NULL COMMENT '幻灯片链接',
  `slide_des` varchar(255) DEFAULT NULL COMMENT '幻灯片描述',
  `slide_content` text COMMENT '幻灯片内容',
  `slide_status` int(2) NOT NULL DEFAULT '1' COMMENT '状态，1显示，0不显示',
  `listorder` int(10) DEFAULT '0' COMMENT '排序',
  PRIMARY KEY (`slide_id`),
  KEY `slide_cid` (`slide_cid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='幻灯片表' AUTO_INCREMENT=1 ;

--
-- 导出表中的数据 `yyg_slide`
--


-- --------------------------------------------------------

--
-- 表的结构 `yyg_slide_cat`
--

CREATE TABLE IF NOT EXISTS `yyg_slide_cat` (
  `cid` int(11) NOT NULL AUTO_INCREMENT,
  `cat_name` varchar(255) NOT NULL COMMENT '幻灯片分类',
  `cat_idname` varchar(255) NOT NULL COMMENT '幻灯片分类标识',
  `cat_remark` text COMMENT '分类备注',
  `cat_status` int(2) NOT NULL DEFAULT '1' COMMENT '状态，1显示，0不显示',
  PRIMARY KEY (`cid`),
  KEY `cat_idname` (`cat_idname`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='幻灯片分类表' AUTO_INCREMENT=1 ;

--
-- 导出表中的数据 `yyg_slide_cat`
--


-- --------------------------------------------------------
-- --------------------------------------------------------
--
-- 表的结构 `yyg_menu`
--

CREATE TABLE IF NOT EXISTS `yyg_menu` (
  `id` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `parentid` smallint(6) unsigned NOT NULL DEFAULT '0',
  `app` char(20) NOT NULL COMMENT '应用名称app',
  `model` char(20) NOT NULL COMMENT '控制器',
  `action` char(20) NOT NULL COMMENT '操作名称',
  `data` char(50) NOT NULL COMMENT '额外参数',
  `type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '菜单类型  1：权限认证+菜单；0：只作为菜单',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '状态，1显示，0不显示',
  `name` varchar(50) NOT NULL COMMENT '菜单名称',
  `icon` varchar(50) DEFAULT NULL COMMENT '菜单图标',
  `remark` varchar(255) NOT NULL COMMENT '备注',
  `listorder` smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '排序ID',
  PRIMARY KEY (`id`),
  KEY `status` (`status`),
  KEY `parentid` (`parentid`),
  KEY `model` (`model`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='后台菜单表' AUTO_INCREMENT=156 ;

-- 
-- 导出表中的数据 `yyg_menu`
-- 

INSERT INTO `yyg_menu` VALUES(1, 0, 'Admin', 'Content', 'default', '', 0, 1, '内容管理', 'th', '', 30);
INSERT INTO `yyg_menu` VALUES(2, 1, 'Api', 'Guestbookadmin', 'index', '', 1, 1, '所有留言', '', '', 0);
INSERT INTO `yyg_menu` VALUES(3, 2, 'Api', 'Guestbookadmin', 'delete', '', 1, 0, '删除网站留言', '', '', 0);
INSERT INTO `yyg_menu` VALUES(4, 1, 'Comment', 'Commentadmin', 'index', '', 1, 1, '评论管理', '', '', 0);
INSERT INTO `yyg_menu` VALUES(5, 4, 'Comment', 'Commentadmin', 'delete', '', 1, 0, '删除评论', '', '', 0);
INSERT INTO `yyg_menu` VALUES(6, 4, 'Comment', 'Commentadmin', 'check', '', 1, 0, '评论审核', '', '', 0);
INSERT INTO `yyg_menu` VALUES(7, 1, 'Portal', 'AdminPost', 'index', '', 1, 1, '文章管理', '', '', 1);
INSERT INTO `yyg_menu` VALUES(8, 7, 'Portal', 'AdminPost', 'listorders', '', 1, 0, '文章排序', '', '', 0);
INSERT INTO `yyg_menu` VALUES(9, 7, 'Portal', 'AdminPost', 'top', '', 1, 0, '文章置顶', '', '', 0);
INSERT INTO `yyg_menu` VALUES(10, 7, 'Portal', 'AdminPost', 'recommend', '', 1, 0, '文章推荐', '', '', 0);
INSERT INTO `yyg_menu` VALUES(11, 7, 'Portal', 'AdminPost', 'move', '', 1, 0, '批量移动', '', '', 1000);
INSERT INTO `yyg_menu` VALUES(12, 7, 'Portal', 'AdminPost', 'check', '', 1, 0, '文章审核', '', '', 1000);
INSERT INTO `yyg_menu` VALUES(13, 7, 'Portal', 'AdminPost', 'delete', '', 1, 0, '删除文章', '', '', 1000);
INSERT INTO `yyg_menu` VALUES(14, 7, 'Portal', 'AdminPost', 'edit', '', 1, 0, '编辑文章', '', '', 1000);
INSERT INTO `yyg_menu` VALUES(15, 14, 'Portal', 'AdminPost', 'edit_post', '', 1, 0, '提交编辑', '', '', 0);
INSERT INTO `yyg_menu` VALUES(16, 7, 'Portal', 'AdminPost', 'add', '', 1, 0, '添加文章', '', '', 1000);
INSERT INTO `yyg_menu` VALUES(17, 16, 'Portal', 'AdminPost', 'add_post', '', 1, 0, '提交添加', '', '', 0);
INSERT INTO `yyg_menu` VALUES(18, 1, 'Portal', 'AdminTerm', 'index', '', 0, 1, '分类管理', '', '', 2);
INSERT INTO `yyg_menu` VALUES(19, 18, 'Portal', 'AdminTerm', 'listorders', '', 1, 0, '文章分类排序', '', '', 0);
INSERT INTO `yyg_menu` VALUES(20, 18, 'Portal', 'AdminTerm', 'delete', '', 1, 0, '删除分类', '', '', 1000);
INSERT INTO `yyg_menu` VALUES(21, 18, 'Portal', 'AdminTerm', 'edit', '', 1, 0, '编辑分类', '', '', 1000);
INSERT INTO `yyg_menu` VALUES(22, 21, 'Portal', 'AdminTerm', 'edit_post', '', 1, 0, '提交编辑', '', '', 0);
INSERT INTO `yyg_menu` VALUES(23, 18, 'Portal', 'AdminTerm', 'add', '', 1, 0, '添加分类', '', '', 1000);
INSERT INTO `yyg_menu` VALUES(24, 23, 'Portal', 'AdminTerm', 'add_post', '', 1, 0, '提交添加', '', '', 0);
INSERT INTO `yyg_menu` VALUES(25, 1, 'Portal', 'AdminPage', 'index', '', 1, 1, '页面管理', '', '', 3);
INSERT INTO `yyg_menu` VALUES(26, 25, 'Portal', 'AdminPage', 'listorders', '', 1, 0, '页面排序', '', '', 0);
INSERT INTO `yyg_menu` VALUES(27, 25, 'Portal', 'AdminPage', 'delete', '', 1, 0, '删除页面', '', '', 1000);
INSERT INTO `yyg_menu` VALUES(28, 25, 'Portal', 'AdminPage', 'edit', '', 1, 0, '编辑页面', '', '', 1000);
INSERT INTO `yyg_menu` VALUES(29, 28, 'Portal', 'AdminPage', 'edit_post', '', 1, 0, '提交编辑', '', '', 0);
INSERT INTO `yyg_menu` VALUES(30, 25, 'Portal', 'AdminPage', 'add', '', 1, 0, '添加页面', '', '', 1000);
INSERT INTO `yyg_menu` VALUES(31, 30, 'Portal', 'AdminPage', 'add_post', '', 1, 0, '提交添加', '', '', 0);
INSERT INTO `yyg_menu` VALUES(32, 1, 'Admin', 'Recycle', 'default', '', 1, 1, '回收站', '', '', 4);
INSERT INTO `yyg_menu` VALUES(33, 32, 'Portal', 'AdminPost', 'recyclebin', '', 1, 1, '文章回收', '', '', 0);
INSERT INTO `yyg_menu` VALUES(34, 33, 'Portal', 'AdminPost', 'restore', '', 1, 0, '文章还原', '', '', 1000);
INSERT INTO `yyg_menu` VALUES(35, 33, 'Portal', 'AdminPost', 'clean', '', 1, 0, '彻底删除', '', '', 1000);
INSERT INTO `yyg_menu` VALUES(36, 32, 'Portal', 'AdminPage', 'recyclebin', '', 1, 1, '页面回收', '', '', 1);
INSERT INTO `yyg_menu` VALUES(37, 36, 'Portal', 'AdminPage', 'clean', '', 1, 0, '彻底删除', '', '', 1000);
INSERT INTO `yyg_menu` VALUES(38, 36, 'Portal', 'AdminPage', 'restore', '', 1, 0, '页面还原', '', '', 1000);
INSERT INTO `yyg_menu` VALUES(39, 0, 'Admin', 'Extension', 'default', '', 0, 1, '扩展工具', 'cloud', '', 40);
INSERT INTO `yyg_menu` VALUES(40, 39, 'Admin', 'Backup', 'default', '', 1, 1, '备份管理', '', '', 0);
INSERT INTO `yyg_menu` VALUES(41, 40, 'Admin', 'Backup', 'restore', '', 1, 1, '数据还原', '', '', 0);
INSERT INTO `yyg_menu` VALUES(42, 40, 'Admin', 'Backup', 'index', '', 1, 1, '数据备份', '', '', 0);
INSERT INTO `yyg_menu` VALUES(43, 42, 'Admin', 'Backup', 'index_post', '', 1, 0, '提交数据备份', '', '', 0);
INSERT INTO `yyg_menu` VALUES(44, 40, 'Admin', 'Backup', 'download', '', 1, 0, '下载备份', '', '', 1000);
INSERT INTO `yyg_menu` VALUES(45, 40, 'Admin', 'Backup', 'del_backup', '', 1, 0, '删除备份', '', '', 1000);
INSERT INTO `yyg_menu` VALUES(46, 40, 'Admin', 'Backup', 'import', '', 1, 0, '数据备份导入', '', '', 1000);
INSERT INTO `yyg_menu` VALUES(47, 39, 'Admin', 'Plugin', 'index', '', 1, 1, '插件管理', '', '', 0);
INSERT INTO `yyg_menu` VALUES(48, 47, 'Admin', 'Plugin', 'toggle', '', 1, 0, '插件启用切换', '', '', 0);
INSERT INTO `yyg_menu` VALUES(49, 47, 'Admin', 'Plugin', 'setting', '', 1, 0, '插件设置', '', '', 0);
INSERT INTO `yyg_menu` VALUES(50, 49, 'Admin', 'Plugin', 'setting_post', '', 1, 0, '插件设置提交', '', '', 0);
INSERT INTO `yyg_menu` VALUES(51, 47, 'Admin', 'Plugin', 'install', '', 1, 0, '插件安装', '', '', 0);
INSERT INTO `yyg_menu` VALUES(52, 47, 'Admin', 'Plugin', 'uninstall', '', 1, 0, '插件卸载', '', '', 0);
INSERT INTO `yyg_menu` VALUES(53, 39, 'Admin', 'Slide', 'default', '', 1, 1, '幻灯片', '', '', 1);
INSERT INTO `yyg_menu` VALUES(54, 53, 'Admin', 'Slide', 'index', '', 1, 1, '幻灯片管理', '', '', 0);
INSERT INTO `yyg_menu` VALUES(55, 54, 'Admin', 'Slide', 'listorders', '', 1, 0, '幻灯片排序', '', '', 0);
INSERT INTO `yyg_menu` VALUES(56, 54, 'Admin', 'Slide', 'toggle', '', 1, 0, '幻灯片显示切换', '', '', 0);
INSERT INTO `yyg_menu` VALUES(57, 54, 'Admin', 'Slide', 'delete', '', 1, 0, '删除幻灯片', '', '', 1000);
INSERT INTO `yyg_menu` VALUES(58, 54, 'Admin', 'Slide', 'edit', '', 1, 0, '编辑幻灯片', '', '', 1000);
INSERT INTO `yyg_menu` VALUES(59, 58, 'Admin', 'Slide', 'edit_post', '', 1, 0, '提交编辑', '', '', 0);
INSERT INTO `yyg_menu` VALUES(60, 54, 'Admin', 'Slide', 'add', '', 1, 0, '添加幻灯片', '', '', 1000);
INSERT INTO `yyg_menu` VALUES(61, 60, 'Admin', 'Slide', 'add_post', '', 1, 0, '提交添加', '', '', 0);
INSERT INTO `yyg_menu` VALUES(62, 53, 'Admin', 'Slidecat', 'index', '', 1, 1, '幻灯片分类', '', '', 0);
INSERT INTO `yyg_menu` VALUES(63, 62, 'Admin', 'Slidecat', 'delete', '', 1, 0, '删除分类', '', '', 1000);
INSERT INTO `yyg_menu` VALUES(64, 62, 'Admin', 'Slidecat', 'edit', '', 1, 0, '编辑分类', '', '', 1000);
INSERT INTO `yyg_menu` VALUES(65, 64, 'Admin', 'Slidecat', 'edit_post', '', 1, 0, '提交编辑', '', '', 0);
INSERT INTO `yyg_menu` VALUES(66, 62, 'Admin', 'Slidecat', 'add', '', 1, 0, '添加分类', '', '', 1000);
INSERT INTO `yyg_menu` VALUES(67, 66, 'Admin', 'Slidecat', 'add_post', '', 1, 0, '提交添加', '', '', 0);
INSERT INTO `yyg_menu` VALUES(68, 39, 'Admin', 'Ad', 'index', '', 1, 1, '网站广告', '', '', 2);
INSERT INTO `yyg_menu` VALUES(69, 68, 'Admin', 'Ad', 'toggle', '', 1, 0, '广告显示切换', '', '', 0);
INSERT INTO `yyg_menu` VALUES(70, 68, 'Admin', 'Ad', 'delete', '', 1, 0, '删除广告', '', '', 1000);
INSERT INTO `yyg_menu` VALUES(71, 68, 'Admin', 'Ad', 'edit', '', 1, 0, '编辑广告', '', '', 1000);
INSERT INTO `yyg_menu` VALUES(72, 71, 'Admin', 'Ad', 'edit_post', '', 1, 0, '提交编辑', '', '', 0);
INSERT INTO `yyg_menu` VALUES(73, 68, 'Admin', 'Ad', 'add', '', 1, 0, '添加广告', '', '', 1000);
INSERT INTO `yyg_menu` VALUES(74, 73, 'Admin', 'Ad', 'add_post', '', 1, 0, '提交添加', '', '', 0);
INSERT INTO `yyg_menu` VALUES(75, 39, 'Admin', 'Link', 'index', '', 0, 1, '友情链接', '', '', 3);
INSERT INTO `yyg_menu` VALUES(76, 75, 'Admin', 'Link', 'listorders', '', 1, 0, '友情链接排序', '', '', 0);
INSERT INTO `yyg_menu` VALUES(77, 75, 'Admin', 'Link', 'toggle', '', 1, 0, '友链显示切换', '', '', 0);
INSERT INTO `yyg_menu` VALUES(78, 75, 'Admin', 'Link', 'delete', '', 1, 0, '删除友情链接', '', '', 1000);
INSERT INTO `yyg_menu` VALUES(79, 75, 'Admin', 'Link', 'edit', '', 1, 0, '编辑友情链接', '', '', 1000);
INSERT INTO `yyg_menu` VALUES(80, 79, 'Admin', 'Link', 'edit_post', '', 1, 0, '提交编辑', '', '', 0);
INSERT INTO `yyg_menu` VALUES(81, 75, 'Admin', 'Link', 'add', '', 1, 0, '添加友情链接', '', '', 1000);
INSERT INTO `yyg_menu` VALUES(82, 81, 'Admin', 'Link', 'add_post', '', 1, 0, '提交添加', '', '', 0);
INSERT INTO `yyg_menu` VALUES(83, 39, 'Api', 'Oauthadmin', 'setting', '', 1, 1, '第三方登陆', 'leaf', '', 4);
INSERT INTO `yyg_menu` VALUES(84, 83, 'Api', 'Oauthadmin', 'setting_post', '', 1, 0, '提交设置', '', '', 0);
INSERT INTO `yyg_menu` VALUES(85, 0, 'Admin', 'Menu', 'default', '', 1, 1, '菜单管理', 'list', '', 20);
INSERT INTO `yyg_menu` VALUES(86, 85, 'Admin', 'Navcat', 'default1', '', 1, 1, '前台菜单', '', '', 0);
INSERT INTO `yyg_menu` VALUES(87, 86, 'Admin', 'Nav', 'index', '', 1, 1, '菜单管理', '', '', 0);
INSERT INTO `yyg_menu` VALUES(88, 87, 'Admin', 'Nav', 'listorders', '', 1, 0, '前台导航排序', '', '', 0);
INSERT INTO `yyg_menu` VALUES(89, 87, 'Admin', 'Nav', 'delete', '', 1, 0, '删除菜单', '', '', 1000);
INSERT INTO `yyg_menu` VALUES(90, 87, 'Admin', 'Nav', 'edit', '', 1, 0, '编辑菜单', '', '', 1000);
INSERT INTO `yyg_menu` VALUES(91, 90, 'Admin', 'Nav', 'edit_post', '', 1, 0, '提交编辑', '', '', 0);
INSERT INTO `yyg_menu` VALUES(92, 87, 'Admin', 'Nav', 'add', '', 1, 0, '添加菜单', '', '', 1000);
INSERT INTO `yyg_menu` VALUES(93, 92, 'Admin', 'Nav', 'add_post', '', 1, 0, '提交添加', '', '', 0);
INSERT INTO `yyg_menu` VALUES(94, 86, 'Admin', 'Navcat', 'index', '', 1, 1, '菜单分类', '', '', 0);
INSERT INTO `yyg_menu` VALUES(95, 94, 'Admin', 'Navcat', 'delete', '', 1, 0, '删除分类', '', '', 1000);
INSERT INTO `yyg_menu` VALUES(96, 94, 'Admin', 'Navcat', 'edit', '', 1, 0, '编辑分类', '', '', 1000);
INSERT INTO `yyg_menu` VALUES(97, 96, 'Admin', 'Navcat', 'edit_post', '', 1, 0, '提交编辑', '', '', 0);
INSERT INTO `yyg_menu` VALUES(98, 94, 'Admin', 'Navcat', 'add', '', 1, 0, '添加分类', '', '', 1000);
INSERT INTO `yyg_menu` VALUES(99, 98, 'Admin', 'Navcat', 'add_post', '', 1, 0, '提交添加', '', '', 0);
INSERT INTO `yyg_menu` VALUES(100, 85, 'Admin', 'Menu', 'index', '', 1, 1, '后台菜单', '', '', 0);
INSERT INTO `yyg_menu` VALUES(101, 100, 'Admin', 'Menu', 'add', '', 1, 0, '添加菜单', '', '', 0);
INSERT INTO `yyg_menu` VALUES(102, 101, 'Admin', 'Menu', 'add_post', '', 1, 0, '提交添加', '', '', 0);
INSERT INTO `yyg_menu` VALUES(103, 100, 'Admin', 'Menu', 'listorders', '', 1, 0, '后台菜单排序', '', '', 0);
INSERT INTO `yyg_menu` VALUES(104, 100, 'Admin', 'Menu', 'export_menu', '', 1, 0, '菜单备份', '', '', 1000);
INSERT INTO `yyg_menu` VALUES(105, 100, 'Admin', 'Menu', 'edit', '', 1, 0, '编辑菜单', '', '', 1000);
INSERT INTO `yyg_menu` VALUES(106, 105, 'Admin', 'Menu', 'edit_post', '', 1, 0, '提交编辑', '', '', 0);
INSERT INTO `yyg_menu` VALUES(107, 100, 'Admin', 'Menu', 'delete', '', 1, 0, '删除菜单', '', '', 1000);
INSERT INTO `yyg_menu` VALUES(108, 100, 'Admin', 'Menu', 'lists', '', 1, 0, '所有菜单', '', '', 1000);
INSERT INTO `yyg_menu` VALUES(109, 0, 'Admin', 'Setting', 'default', '', 0, 1, '设置', 'cogs', '', 0);
INSERT INTO `yyg_menu` VALUES(110, 109, 'Admin', 'Setting', 'userdefault', '', 0, 1, '个人信息', '', '', 0);
INSERT INTO `yyg_menu` VALUES(111, 110, 'Admin', 'User', 'userinfo', '', 1, 1, '修改信息', '', '', 0);
INSERT INTO `yyg_menu` VALUES(112, 111, 'Admin', 'User', 'userinfo_post', '', 1, 0, '修改信息提交', '', '', 0);
INSERT INTO `yyg_menu` VALUES(113, 110, 'Admin', 'Setting', 'password', '', 1, 1, '修改密码', '', '', 0);
INSERT INTO `yyg_menu` VALUES(114, 113, 'Admin', 'Setting', 'password_post', '', 1, 0, '提交修改', '', '', 0);
INSERT INTO `yyg_menu` VALUES(115, 109, 'Admin', 'Setting', 'site', '', 1, 1, '网站信息', '', '', 0);
INSERT INTO `yyg_menu` VALUES(116, 115, 'Admin', 'Setting', 'site_post', '', 1, 0, '提交修改', '', '', 0);
INSERT INTO `yyg_menu` VALUES(117, 115, 'Admin', 'Route', 'index', '', 1, 0, '路由列表', '', '', 0);
INSERT INTO `yyg_menu` VALUES(118, 115, 'Admin', 'Route', 'add', '', 1, 0, '路由添加', '', '', 0);
INSERT INTO `yyg_menu` VALUES(119, 118, 'Admin', 'Route', 'add_post', '', 1, 0, '路由添加提交', '', '', 0);
INSERT INTO `yyg_menu` VALUES(120, 115, 'Admin', 'Route', 'edit', '', 1, 0, '路由编辑', '', '', 0);
INSERT INTO `yyg_menu` VALUES(121, 120, 'Admin', 'Route', 'edit_post', '', 1, 0, '路由编辑提交', '', '', 0);
INSERT INTO `yyg_menu` VALUES(122, 115, 'Admin', 'Route', 'delete', '', 1, 0, '路由删除', '', '', 0);
INSERT INTO `yyg_menu` VALUES(123, 115, 'Admin', 'Route', 'ban', '', 1, 0, '路由禁止', '', '', 0);
INSERT INTO `yyg_menu` VALUES(124, 115, 'Admin', 'Route', 'open', '', 1, 0, '路由启用', '', '', 0);
INSERT INTO `yyg_menu` VALUES(125, 115, 'Admin', 'Route', 'listorders', '', 1, 0, '路由排序', '', '', 0);
INSERT INTO `yyg_menu` VALUES(126, 109, 'Admin', 'Mailer', 'default', '', 1, 1, '邮箱配置', '', '', 0);
INSERT INTO `yyg_menu` VALUES(127, 126, 'Admin', 'Mailer', 'index', '', 1, 1, 'SMTP配置', '', '', 0);
INSERT INTO `yyg_menu` VALUES(128, 127, 'Admin', 'Mailer', 'index_post', '', 1, 0, '提交配置', '', '', 0);
INSERT INTO `yyg_menu` VALUES(129, 126, 'Admin', 'Mailer', 'active', '', 1, 1, '邮件模板', '', '', 0);
INSERT INTO `yyg_menu` VALUES(130, 129, 'Admin', 'Mailer', 'active_post', '', 1, 0, '提交模板', '', '', 0);
INSERT INTO `yyg_menu` VALUES(131, 109, 'Admin', 'Setting', 'clearcache', '', 1, 1, '清除缓存', '', '', 1);
INSERT INTO `yyg_menu` VALUES(132, 0, 'User', 'Indexadmin', 'default', '', 1, 1, '用户管理', 'group', '', 10);
INSERT INTO `yyg_menu` VALUES(133, 132, 'User', 'Indexadmin', 'default1', '', 1, 1, '用户组', '', '', 0);
INSERT INTO `yyg_menu` VALUES(134, 133, 'User', 'Indexadmin', 'index', '', 1, 1, '本站用户', 'leaf', '', 0);
INSERT INTO `yyg_menu` VALUES(135, 134, 'User', 'Indexadmin', 'ban', '', 1, 0, '拉黑会员', '', '', 0);
INSERT INTO `yyg_menu` VALUES(136, 134, 'User', 'Indexadmin', 'cancelban', '', 1, 0, '启用会员', '', '', 0);
INSERT INTO `yyg_menu` VALUES(137, 133, 'User', 'Oauthadmin', 'index', '', 1, 1, '第三方用户', 'leaf', '', 0);
INSERT INTO `yyg_menu` VALUES(138, 137, 'User', 'Oauthadmin', 'delete', '', 1, 0, '第三方用户解绑', '', '', 0);
INSERT INTO `yyg_menu` VALUES(139, 132, 'User', 'Indexadmin', 'default3', '', 1, 1, '管理组', '', '', 0);
INSERT INTO `yyg_menu` VALUES(140, 139, 'Admin', 'Rbac', 'index', '', 1, 1, '角色管理', '', '', 0);
INSERT INTO `yyg_menu` VALUES(141, 140, 'Admin', 'Rbac', 'member', '', 1, 0, '成员管理', '', '', 1000);
INSERT INTO `yyg_menu` VALUES(142, 140, 'Admin', 'Rbac', 'authorize', '', 1, 0, '权限设置', '', '', 1000);
INSERT INTO `yyg_menu` VALUES(143, 142, 'Admin', 'Rbac', 'authorize_post', '', 1, 0, '提交设置', '', '', 0);
INSERT INTO `yyg_menu` VALUES(144, 140, 'Admin', 'Rbac', 'roleedit', '', 1, 0, '编辑角色', '', '', 1000);
INSERT INTO `yyg_menu` VALUES(145, 144, 'Admin', 'Rbac', 'roleedit_post', '', 1, 0, '提交编辑', '', '', 0);
INSERT INTO `yyg_menu` VALUES(146, 140, 'Admin', 'Rbac', 'roledelete', '', 1, 1, '删除角色', '', '', 1000);
INSERT INTO `yyg_menu` VALUES(147, 140, 'Admin', 'Rbac', 'roleadd', '', 1, 1, '添加角色', '', '', 1000);
INSERT INTO `yyg_menu` VALUES(148, 147, 'Admin', 'Rbac', 'roleadd_post', '', 1, 0, '提交添加', '', '', 0);
INSERT INTO `yyg_menu` VALUES(149, 139, 'Admin', 'User', 'index', '', 1, 1, '管理员', '', '', 0);
INSERT INTO `yyg_menu` VALUES(150, 149, 'Admin', 'User', 'delete', '', 1, 0, '删除管理员', '', '', 1000);
INSERT INTO `yyg_menu` VALUES(151, 149, 'Admin', 'User', 'edit', '', 1, 0, '管理员编辑', '', '', 1000);
INSERT INTO `yyg_menu` VALUES(152, 151, 'Admin', 'User', 'edit_post', '', 1, 0, '编辑提交', '', '', 0);
INSERT INTO `yyg_menu` VALUES(153, 149, 'Admin', 'User', 'add', '', 1, 0, '管理员添加', '', '', 1000);
INSERT INTO `yyg_menu` VALUES(154, 153, 'Admin', 'User', 'add_post', '', 1, 0, '添加提交', '', '', 0);
INSERT INTO `yyg_menu` VALUES(155, 47, 'Admin', 'Plugin', 'update', '', 1, 0, '插件更新', '', '', 0);
INSERT INTO `yyg_menu` VALUES(156, 39, 'Admin', 'Storage', 'index', '', 1, 1, '文件存储', '', '', 0);
INSERT INTO `yyg_menu` VALUES(157, 156, 'Admin', 'Storage', 'setting_post', '', 1, 0, '文件存储设置提交', '', '', 0);
INSERT INTO `yyg_menu` VALUES(158, 54, 'Admin', 'Slide', 'ban', '', 1, 0, '禁用幻灯片', '', '', 0);
INSERT INTO `yyg_menu` VALUES(159, 54, 'Admin', 'Slide', 'cancelban', '', 1, 0, '启用幻灯片', '', '', 0);
INSERT INTO `yyg_menu` VALUES(160, 149, 'Admin', 'User', 'ban', '', 1, 0, '禁用管理员', '', '', 0);
INSERT INTO `yyg_menu` VALUES(161, 149, 'Admin', 'User', 'cancelban', '', 1, 0, '启用管理员', '', '', 0);
-- --------------------------------------------------------
--
-- 表的结构 `yyg_ad_area`
--

CREATE TABLE IF NOT EXISTS `yyg_ad_area` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  `width` smallint(6) unsigned DEFAULT NULL,
  `height` smallint(6) unsigned DEFAULT NULL,
  `des` varchar(255) DEFAULT NULL,
  `checked` tinyint(1) DEFAULT '0' COMMENT '1表示通过',
  PRIMARY KEY (`id`),
  KEY `checked` (`checked`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='广告位' AUTO_INCREMENT=4 ;

--
-- 转存表中的数据 `yyg_ad_area`
--

INSERT INTO `yyg_ad_area` (`id`, `title`, `width`, `height`, `des`, `checked`) VALUES
(2, '&lt;div&gt;453453451&lt;/div&gt;', 750, 60, 'sd', 1),
(3, '546', 456, 456, '456', 1);

-- --------------------------------------------------------

--
-- 表的结构 `yyg_ad_data`
--

CREATE TABLE IF NOT EXISTS `yyg_ad_data` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `aid` int(10) unsigned NOT NULL,
  `title` varchar(100) NOT NULL,
  `type` char(10) DEFAULT NULL COMMENT 'code,text,img',
  `content` text,
  `checked` tinyint(1) DEFAULT '0' COMMENT '1表示通过',
  `addtime` int(10) unsigned NOT NULL,
  `endtime` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `type` (`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='广告' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------
--
-- 表的结构 `yyg_article`
--
CREATE TABLE IF NOT EXISTS `yyg_article` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '文章id',
  `cateid` char(30) NOT NULL COMMENT '文章父ID',
  `author` char(20) DEFAULT NULL,
  `title` char(100) NOT NULL COMMENT '标题',
  `title_style` varchar(100) DEFAULT NULL,
  `thumb` varchar(3) DEFAULT NULL,
  `picarr` text,
  `keywords` varchar(100) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `content` mediumtext COMMENT '内容',
  `hit` int(10) unsigned DEFAULT '0',
  `order` tinyint(3) unsigned DEFAULT NULL,
  `posttime` int(10) unsigned DEFAULT NULL COMMENT '添加时间',
  PRIMARY KEY (`id`),
  KEY `cateid` (`cateid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=15 ;

--
-- 转存表中的数据 `yyg_article`
--

INSERT INTO `yyg_article` (`id`, `cateid`, `author`, `title`, `title_style`, `thumb`, `picarr`, `keywords`, `description`, `content`, `hit`, `order`, `posttime`) VALUES
(1, '2', '', '了解云购', '', '', 'a:2:{i:0;s:33:"photo/20130902/41484375056924.jpg";i:1;s:33:"photo/20130902/26578125056924.jpg";}', '', '', '<p>	</p><p>345</p>', 1, 1, 1375862513),
(2, '2', '', '常见问题', '', '', 'a:0:{}', '', '', '<p>	</p><p>567567234234</p>', 0, 3, 1375862591),
(3, '2', '', '服务协议', '', '', 'a:0:{}', '', '', '<p>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;	9 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 56 &nbsp; 56</p>', 0, 0, 1375862644),
(4, '3', '', '购保障体系', '', '', 'a:0:{}', '', '', '<p>	</p><p>欢迎使用云购系统!56456</p>', 0, 0, 1375862690),
(5, '3', NULL, '正品保障', NULL, NULL, 'a:0:{}', NULL, NULL, '', 0, 0, 1375862702),
(6, '3', NULL, '安全支付', NULL, NULL, 'a:0:{}', NULL, NULL, '', 0, 0, 1375862712),
(7, '4', NULL, '商品配送', NULL, NULL, 'a:0:{}', NULL, NULL, '', 0, 0, 1375862725),
(8, '4', NULL, '配送费用', NULL, NULL, 'a:0:{}', NULL, NULL, '', 0, 0, 1375862737),
(9, '4', NULL, '商品验货与签收', NULL, NULL, 'a:0:{}', NULL, NULL, '', 0, 0, 1375862747),
(10, '4', NULL, '长时间未收到商品', NULL, '', 'a:0:{}', NULL, NULL, '', 0, 0, 1375862760),
(12, '3', '', '隐私声明', '', '', 'a:0:{}', '', '', '<p>	</p><p>欢迎使用云购系统</p><p>隐私声明</p>', 71, 1, 1378451819),
(13, '16', '疯狂的屠夫', '测试一下', '', '', 'a:0:{}', '测试', '测试', '<p>测试</p>', 82, 1, 1417758811),
(14, '1', '5115', '1512', '', 'pho', 'a:0:{}', '2', '', '<p>欢迎使用云购系统!</p>', 23, 1, 1417767065);

-- --------------------------------------------------------

--
-- 表的结构 `yyg_brand`
--

CREATE TABLE IF NOT EXISTS `yyg_brand` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `cateid` varchar(255) DEFAULT NULL COMMENT '所属栏目ID',
  `status` char(1) DEFAULT 'Y' COMMENT '显示隐藏',
  `name` varchar(255) DEFAULT NULL,
  `thumb` varchar(255) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `order` int(11) DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `status` (`status`),
  KEY `order` (`order`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='品牌表' AUTO_INCREMENT=9 ;

--
-- 转存表中的数据 `yyg_brand`
--

INSERT INTO `yyg_brand` (`id`, `cateid`, `status`, `name`, `thumb`, `url`, `order`) VALUES
(1, '5,13,6', 'Y', '洛基亚', NULL, NULL, 1),
(2, '5', 'Y', '苹果', NULL, NULL, 2),
(3, '5,6', 'Y', 'oppo', NULL, NULL, 1),
(4, '5', 'Y', '华为', NULL, NULL, 1),
(8, '5', 'Y', '苹果', NULL, NULL, 1);

-- --------------------------------------------------------

--
-- 表的结构 `yyg_caches`
--

CREATE TABLE IF NOT EXISTS `yyg_caches` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(100) NOT NULL,
  `value` text,
  PRIMARY KEY (`id`),
  KEY `key` (`key`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=11 ;

--
-- 转存表中的数据 `yyg_caches`
--

INSERT INTO `yyg_caches` (`id`, `key`, `value`) VALUES
(1, 'member_name_key', 'admin,administrator,云购官方'),
(2, 'shopcodes_table', '1'),
(3, 'goods_count_num', '56'),
(4, 'template_mobile_reg', '你好,你的注册验证码是:000000 '),
(5, 'template_mobile_shop', '恭喜你云购用户！您在1元云购网够买的商品已中奖,获得的云购码为：00000000 请登陆网站查看详情！请尽快联系管理员发货！'),
(6, 'template_email_reg', '你好,请在24小时内激活注册邮件，点击连接激活邮件：{地址}'),
(7, 'template_email_shop', '恭喜您：{用户名}，你在云购网够买的商品：{商品名称} 已中奖，中奖码是:{中奖码}'),
(8, 'pay_bank_type', 'tenpay'),
(9, 'template_mobile_pwd', '你好,你现在正在找回密码，你的验证码是【000000】。'),
(10, 'template_email_pwd', '请在24小时内激活邮件，点击连接激活邮件：{地址}');

-- --------------------------------------------------------

--
-- 表的结构 `yyg_category`
--

CREATE TABLE IF NOT EXISTS `yyg_category` (
  `cateid` smallint(6) unsigned NOT NULL AUTO_INCREMENT COMMENT '栏目id',
  `parentid` smallint(6) DEFAULT NULL COMMENT '父ID',
  `channel` tinyint(4) NOT NULL DEFAULT '0',
  `model` tinyint(1) DEFAULT NULL COMMENT '栏目模型',
  `name` varchar(255) DEFAULT NULL COMMENT '栏目名称',
  `catdir` char(20) DEFAULT NULL COMMENT '英文名',
  `url` varchar(255) DEFAULT NULL,
  `info` text,
  `order` smallint(6) unsigned DEFAULT '1' COMMENT '排序',
  PRIMARY KEY (`cateid`),
  KEY `name` (`name`),
  KEY `order` (`order`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='栏目表' AUTO_INCREMENT=20 ;

--
-- 转存表中的数据 `yyg_category`
--

INSERT INTO `yyg_category` (`cateid`, `parentid`, `channel`, `model`, `name`, `catdir`, `url`, `info`, `order`) VALUES
(1, 0, 0, 2, '帮助', 'help', '', 'a:7:{s:5:"thumb";s:0:"";s:3:"des";s:0:"";s:8:"template";N;s:7:"content";N;s:10:"meta_title";s:0:"";s:13:"meta_keywords";s:0:"";s:16:"meta_description";s:0:"";}', 1),
(2, 1, 0, 2, '新手指南', 'xinshouzhinan', '', 'a:7:{s:5:"thumb";s:0:"";s:3:"des";s:0:"";s:8:"template";N;s:7:"content";N;s:10:"meta_title";s:0:"";s:13:"meta_keywords";s:0:"";s:16:"meta_description";s:0:"";}', 1),
(3, 1, 0, 2, '云购保障', 'yunbaozhang', '', 'a:7:{s:5:"thumb";s:0:"";s:3:"des";s:30:"司法所发射点发射得分";s:8:"template";N;s:7:"content";s:0:"";s:10:"meta_title";s:0:"";s:13:"meta_keywords";s:0:"";s:16:"meta_description";s:0:"";}', 1),
(4, 1, 0, 2, '商品配送', 'peisong', '', 'a:7:{s:5:"thumb";s:0:"";s:3:"des";s:0:"";s:8:"template";N;s:7:"content";N;s:10:"meta_title";s:0:"";s:13:"meta_keywords";s:0:"";s:16:"meta_description";s:0:"";}', 1),
(5, 0, 0, 1, '手机', 'shouji', '', 'a:7:{s:5:"thumb";s:0:"";s:3:"des";s:0:"";s:8:"template";N;s:7:"content";N;s:10:"meta_title";s:0:"";s:13:"meta_keywords";s:0:"";s:16:"meta_description";s:0:"";}', 6),
(6, 0, 0, 1, '平板电脑', 'pingban', '', 'a:7:{s:5:"thumb";s:0:"";s:3:"des";s:0:"";s:8:"template";N;s:7:"content";N;s:10:"meta_title";s:0:"";s:13:"meta_keywords";s:0:"";s:16:"meta_description";s:0:"";}', 4),
(7, 0, 0, -1, '新手指南', 'newbie', '', 'a:7:{s:5:"thumb";s:0:"";s:3:"des";s:0:"";s:8:"template";s:22:"single_web.newbie.html";s:7:"content";s:0:"";s:10:"meta_title";s:0:"";s:13:"meta_keywords";s:0:"";s:16:"meta_description";s:0:"";}', 1),
(8, 0, 0, -1, '合作专区', 'business', '', 'a:7:{s:5:"thumb";s:0:"";s:3:"des";s:0:"";s:8:"template";s:24:"single_web.business.html";s:7:"content";s:34:"<p>输入栏目内容...567678</p>";s:10:"meta_title";s:0:"";s:13:"meta_keywords";s:0:"";s:16:"meta_description";s:0:"";}', 1),
(9, 0, 0, -1, '公益基金', 'fund', '', 'a:7:{s:5:"thumb";s:0:"";s:3:"des";s:0:"";s:8:"template";s:20:"single_web.fund.html";s:7:"content";s:28:"<p>输入栏目内容...</p>";s:10:"meta_title";s:0:"";s:13:"meta_keywords";s:0:"";s:16:"meta_description";s:0:"";}', 1),
(10, 0, 0, -1, '云购QQ群', 'qqgroup', '', 'a:7:{s:5:"thumb";s:0:"";s:3:"des";s:0:"";s:8:"template";s:23:"single_web.qqgroup.html";s:7:"content";s:40:"PHA+6L6T5YWl5qCP55uu5YaF5a65Li4uPC9wPg==";s:10:"meta_title";s:0:"";s:13:"meta_keywords";s:0:"";s:16:"meta_description";s:0:"";}', 1),
(11, 0, 0, -1, '邀请注册', 'pleasereg', '', 'a:7:{s:5:"thumb";s:0:"";s:3:"des";s:0:"";s:8:"template";s:25:"single_web.pleasereg.html";s:7:"content";s:28:"<p>输入栏目内容...</p>";s:10:"meta_title";s:0:"";s:13:"meta_keywords";s:0:"";s:16:"meta_description";s:0:"";}', 1),
(12, 0, 0, 1, '数码相机', 'shuma', '', 'a:7:{s:5:"thumb";s:0:"";s:3:"des";s:12:"数码相机";s:8:"template";s:0:"";s:7:"content";s:0:"";s:10:"meta_title";s:12:"数码相机";s:13:"meta_keywords";s:12:"数码相机";s:16:"meta_description";s:12:"数码相机";}', 3),
(13, 0, 0, 1, '电脑', 'diannao', '', 'a:7:{s:5:"thumb";s:0:"";s:3:"des";s:6:"电脑";s:8:"template";s:0:"";s:7:"content";s:0:"";s:10:"meta_title";s:6:"电脑";s:13:"meta_keywords";s:6:"电脑";s:16:"meta_description";s:6:"电脑";}', 5),
(14, 0, 0, 1, '钟表首饰', 'zhongbiao', '', 'a:7:{s:5:"thumb";s:0:"";s:3:"des";s:12:"钟表首饰";s:8:"template";s:0:"";s:7:"content";s:0:"";s:10:"meta_title";s:12:"钟表首饰";s:13:"meta_keywords";s:12:"钟表首饰";s:16:"meta_description";s:12:"钟表首饰";}', 2),
(15, 0, 0, 1, '其他商品', 'qita', '', 'a:7:{s:5:"thumb";s:0:"";s:3:"des";s:12:"其他商品";s:8:"template";s:0:"";s:7:"content";s:0:"";s:10:"meta_title";s:12:"其他商品";s:13:"meta_keywords";s:12:"其他商品";s:16:"meta_description";s:12:"其他商品";}', 1),
(16, 1, 0, 2, '云购基金', 'fund', '', 'a:7:{s:5:"thumb";s:0:"";s:3:"des";s:0:"";s:8:"template";s:0:"";s:7:"content";s:0:"";s:10:"meta_title";s:0:"";s:13:"meta_keywords";s:0:"";s:16:"meta_description";s:0:"";}', 1),
(17, 0, 0, -1, '123', '123', '', 'a:7:{s:5:"thumb";s:35:"cateimg/20150928/43373255422456.png";s:3:"des";s:0:"";s:8:"template";s:24:"single_web.business.html";s:7:"content";s:40:"PHA+6L6T5YWl5qCP55uu5YaF5a65Li4uPC9wPg==";s:10:"meta_title";s:0:"";s:13:"meta_keywords";s:0:"";s:16:"meta_description";s:0:"";}', 1),
(19, 0, 0, 2, '123654', '123456', '', 'a:7:{s:5:"thumb";s:0:"";s:3:"des";s:0:"";s:8:"template";s:0:"";s:7:"content";s:0:"";s:10:"meta_title";s:0:"";s:13:"meta_keywords";s:0:"";s:16:"meta_description";s:0:"";}', 1);

-- --------------------------------------------------------

--
-- 表的结构 `yyg_config`
--

CREATE TABLE IF NOT EXISTS `yyg_config` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  `value` mediumtext,
  `zhushi` text,
  PRIMARY KEY (`id`),
  KEY `name` (`name`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=26 ;

--
-- 转存表中的数据 `yyg_config`
--

INSERT INTO `yyg_config` (`id`, `name`, `value`, `zhushi`) VALUES
(1, 'web_name', '令鹿一元购', '网站名'),
(2, 'web_key', '令鹿,一元购', '网站关键字'),
(3, 'web_des', '令鹿一元购', '网站介绍'),
(4, 'web_path', '1yg.lirlu.com', '网站地址'),
(5, 'templates_edit', '1', '是否允许在线编辑模板'),
(6, 'templates_name', 'yungou', '当前模板方案'),
(7, 'charset', 'utf-8', '网站字符集'),
(8, 'timezone', 'Asia/Shanghai', '网站时区'),
(9, 'error', '0', '1、保存错误日志到 cache/error_log.php | 0、在页面直接显示'),
(10, 'gzip', '0', '是否Gzip压缩后输出,服务器没有gzip请不要启用'),
(11, 'lang', 'zh-cn', '网站语言包'),
(12, 'cache', '3600', '默认缓存时间'),
(13, 'web_off', '1', '网站是否开启'),
(14, 'web_off_text', '网站关闭。升级中....', '关闭原因'),
(15, 'tablepre', 'QCNf', NULL),
(16, 'index_name', '?', '隐藏首页文件名'),
(17, 'expstr', '/', 'url分隔符号'),
(18, 'admindir', 'admin', '后台管理文件夹'),
(19, 'qq', '1047493185', 'qq'),
(20, 'cell', '131-9822-0595', '联系电话'),
(21, 'web_logo', 'banner/20150928/80766791454598.png', 'logo'),
(22, 'web_copyright', '令鹿一元购', '版权'),
(23, 'web_name_two', '令鹿一元购', '短网站名'),
(24, 'qq_qun', '1047493185|1047493185', 'QQ群'),
(25, 'goods_end_time', '180', '开奖动画秒数(单位秒)');

-- --------------------------------------------------------

--
-- 表的结构 `yyg_egglotter_award`
--

CREATE TABLE IF NOT EXISTS `yyg_egglotter_award` (
  `award_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `user_id` int(11) DEFAULT NULL COMMENT '用户ID',
  `user_name` varchar(11) DEFAULT NULL COMMENT '用户名字',
  `rule_id` int(11) DEFAULT NULL COMMENT '活动ID',
  `subtime` int(11) DEFAULT NULL COMMENT '中奖时间',
  `spoil_id` int(11) DEFAULT NULL COMMENT '奖品等级',
  PRIMARY KEY (`award_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `yyg_egglotter_rule`
--

CREATE TABLE IF NOT EXISTS `yyg_egglotter_rule` (
  `rule_id` int(11) NOT NULL AUTO_INCREMENT,
  `rule_name` varchar(200) DEFAULT NULL,
  `starttime` int(11) DEFAULT NULL COMMENT '活动开始时间',
  `endtime` int(11) DEFAULT NULL COMMENT '活动结束时间',
  `subtime` int(11) DEFAULT NULL COMMENT '活动编辑时间',
  `lotterytype` int(11) DEFAULT NULL COMMENT '抽奖按币分类',
  `lotterjb` int(11) DEFAULT NULL COMMENT '每一次抽奖使用的金币',
  `ruledesc` text COMMENT '规则介绍',
  `startusing` tinyint(4) DEFAULT NULL COMMENT '启用',
  PRIMARY KEY (`rule_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `yyg_egglotter_spoil`
--

CREATE TABLE IF NOT EXISTS `yyg_egglotter_spoil` (
  `spoil_id` int(11) NOT NULL AUTO_INCREMENT,
  `rule_id` int(11) DEFAULT NULL,
  `spoil_name` text COMMENT '名称',
  `spoil_jl` int(11) DEFAULT NULL COMMENT '机率',
  `spoil_dj` int(11) DEFAULT NULL,
  `urlimg` varchar(200) DEFAULT NULL,
  `subtime` int(11) DEFAULT NULL COMMENT '提交时间',
  PRIMARY KEY (`spoil_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `yyg_fund`
--

CREATE TABLE IF NOT EXISTS `yyg_fund` (
  `id` int(10) unsigned NOT NULL,
  `fund_off` tinyint(4) unsigned NOT NULL DEFAULT '1',
  `fund_money` decimal(10,2) unsigned NOT NULL,
  `fund_count_money` decimal(12,2) DEFAULT NULL COMMENT '云购基金',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `yyg_fund`
--

INSERT INTO `yyg_fund` (`id`, `fund_off`, `fund_money`, `fund_count_money`) VALUES
(1, 1, '11.00', '5863.00');

-- --------------------------------------------------------

--
-- 表的结构 `yyg_link`
--

CREATE TABLE IF NOT EXISTS `yyg_link` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '友情链接ID',
  `type` tinyint(1) unsigned NOT NULL COMMENT '链接类型',
  `name` char(20) NOT NULL COMMENT '名称',
  `logo` varchar(250) NOT NULL COMMENT '图片',
  `url` varchar(50) NOT NULL COMMENT '地址',
  PRIMARY KEY (`id`),
  KEY `type` (`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `yyg_member`
--

CREATE TABLE IF NOT EXISTS `yyg_member` (
  `uid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` char(20) NOT NULL COMMENT '用户名',
  `email` varchar(50) DEFAULT NULL COMMENT '用户邮箱',
  `mobile` char(11) DEFAULT NULL COMMENT '用户手机',
  `password` char(32) DEFAULT NULL COMMENT '密码',
  `user_ip` varchar(255) DEFAULT NULL,
  `img` varchar(255) DEFAULT NULL COMMENT '用户头像',
  `qianming` varchar(255) DEFAULT NULL COMMENT '用户签名',
  `groupid` tinyint(4) unsigned DEFAULT '0' COMMENT '用户权限组',
  `addgroup` varchar(255) DEFAULT NULL COMMENT '用户加入的圈子组1|2|3',
  `money` decimal(10,2) unsigned DEFAULT '0.00' COMMENT '账户金额',
  `emailcode` char(21) DEFAULT '-1' COMMENT '邮箱认证码',
  `mobilecode` char(21) DEFAULT '-1' COMMENT '手机认证码',
  `passcode` char(21) DEFAULT '-1' COMMENT '找会密码认证码-1,1,码',
  `reg_key` varchar(100) DEFAULT NULL COMMENT '注册参数',
  `score` int(10) unsigned NOT NULL DEFAULT '0',
  `jingyan` int(10) unsigned DEFAULT '0',
  `yaoqing` int(10) unsigned DEFAULT NULL,
  `band` varchar(255) DEFAULT NULL,
  `time` int(10) unsigned DEFAULT '0',
  `login_time` int(10) unsigned DEFAULT '0',
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='会员表' AUTO_INCREMENT=36 ;

--
-- 转存表中的数据 `yyg_member`
--

INSERT INTO `yyg_member` (`uid`, `username`, `email`, `mobile`, `password`, `user_ip`, `img`, `qianming`, `groupid`, `addgroup`, `money`, `emailcode`, `mobilecode`, `passcode`, `reg_key`, `score`, `jingyan`, `yaoqing`, `band`, `time`, `login_time`) VALUES
(1, 'zbwyl', 'z471412539@163.com', '13980622590', 'e10adc3949ba59abbe56e057f20f883e', '四川省成都市,171.212.214.127', 'touimg/f0641f9d81d33e3567e6b5f14da694d9.png', '', 1, NULL, '1000000.00', '1', '1', '-1', NULL, 10000, 1000, NULL, NULL, 1446688912, 0),
(2, 'miyaxue', 'miyaxue@lirlu.com', '15982110107', 'e10adc3949ba59abbe56e057f20f883e', NULL, 'photo/member.jpg', '', 1, NULL, '1000.00', '-1', '-1', '-1', NULL, 100, 100, NULL, NULL, 1446629730, 0),
(5, '波波', '583027674@qq.com', '18780154496', 'e10adc3949ba59abbe56e057f20f883e', '四川省成都市,171.212.214.127', 'touimg/20151214/92711765098532.png', '我是波导', 6, NULL, '79.00', '1', '1', '-1', NULL, 2000, 1340, NULL, NULL, 1446790389, 0),
(30, '我的', '', '18200182250', 'e10adc3949ba59abbe56e057f20f883e', '四川省成都市,171.212.214.127', 'photo/member.jpg', '默默', 1, NULL, '1000.00', '-1', '1', '-1', '18200182250', 0, 0, 0, NULL, 1449578451, 0),
(31, '柠檬小姐', '770795672@qq.com', '15828067309', 'e10adc3949ba59abbe56e057f20f883e', '四川省成都市,171.88.59.253', 'touimg/', '一辈子很短', 2, NULL, '1000.00', '1', '1', '-1', NULL, 9300, 1000, NULL, NULL, 1449737958, 0),
(32, '', NULL, NULL, 'e10adc3949ba59abbe56e057f20f883e', NULL, 'photo/member.jpg', NULL, 0, NULL, '0.00', '-1', '898299|1450502772', '-1', '18728420441', 0, 0, 0, NULL, 1450502772, 0),
(33, '', NULL, NULL, 'e10adc3949ba59abbe56e057f20f883e', NULL, 'photo/member.jpg', NULL, 0, NULL, '0.00', '-1', '869136|1450504870', '-1', '18200214987', 0, 0, 0, NULL, 1450504870, 0),
(34, '', NULL, '18728420441', 'e10adc3949ba59abbe56e057f20f883e', NULL, NULL, NULL, 0, NULL, '0.00', '-1', '-1', '-1', NULL, 0, 0, NULL, NULL, 0, 0);

-- --------------------------------------------------------

--
-- 表的结构 `yyg_member_account`
--

CREATE TABLE IF NOT EXISTS `yyg_member_account` (
  `uid` int(10) unsigned NOT NULL COMMENT '用户id',
  `type` tinyint(1) DEFAULT NULL COMMENT '充值1/消费-1',
  `pay` char(20) DEFAULT NULL,
  `content` varchar(255) DEFAULT NULL COMMENT '详情',
  `money` mediumint(8) NOT NULL DEFAULT '0' COMMENT '金额',
  `time` char(20) NOT NULL,
  KEY `uid` (`uid`),
  KEY `type` (`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='会员账户明细';

--
-- 转存表中的数据 `yyg_member_account`
--

INSERT INTO `yyg_member_account` (`uid`, `type`, `pay`, `content`, `money`, `time`) VALUES
(5, -1, '账户', '云购了商品', 1, '1446790420'),
(5, 1, '福分', '云购了1人次商品', 20, '1446790420'),
(5, -1, '账户', '云购了商品', 1, '1446790432'),
(5, 1, '福分', '云购了1人次商品', 20, '1446790432'),
(5, -1, '账户', '云购了商品', 30, '1446793107'),
(5, 1, '福分', '云购了30人次商品', 600, '1446793107'),
(5, -1, '账户', '云购了商品', 1, '1446794479'),
(5, 1, '福分', '云购了1人次商品', 20, '1446794479'),
(5, -1, '账户', '云购了商品', 1, '1446794491'),
(5, 1, '福分', '云购了1人次商品', 20, '1446794491'),
(5, -1, '账户', '云购了商品', 1, '1446794516'),
(5, 1, '福分', '云购了1人次商品', 20, '1446794516'),
(5, -1, '账户', '云购了商品', 2, '1446794536'),
(5, 1, '福分', '云购了2人次商品', 40, '1446794536'),
(5, -1, '账户', '云购了商品', 3, '1446794548'),
(5, 1, '福分', '云购了3人次商品', 60, '1446794548'),
(5, -1, '账户', '云购了商品', 3, '1446794562'),
(5, 1, '福分', '云购了3人次商品', 60, '1446794562'),
(5, -1, '账户', '云购了商品', 5, '1446794620'),
(5, 1, '福分', '云购了5人次商品', 100, '1446794620'),
(5, -1, '福分', '云购了商品', 1000, '1446794698'),
(5, -1, '账户', '云购了商品', 3, '1446794807'),
(5, 1, '福分', '云购了3人次商品', 60, '1446794807'),
(1, -1, '账户', '云购了商品', 1, '1448891495'),
(1, 1, '福分', '云购了1人次商品', 20, '1448891495'),
(1, -1, '账户', '云购了商品', 1, '1448891537'),
(1, 1, '福分', '云购了1人次商品', 20, '1448891537'),
(1, -1, '账户', '云购了商品', 1, '1448891587'),
(1, 1, '福分', '云购了1人次商品', 20, '1448891587'),
(1, -1, '账户', '云购了商品', 1, '1448938708'),
(1, 1, '福分', '云购了1人次商品', 20, '1448938708'),
(5, 1, '福分', '完善昵称奖励', 10, '1450061104'),
(5, 1, '经验', '完善昵称奖励', 100, '1450061104');

-- --------------------------------------------------------

--
-- 表的结构 `yyg_member_addmoney_record`
--

CREATE TABLE IF NOT EXISTS `yyg_member_addmoney_record` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(10) unsigned NOT NULL,
  `code` char(20) NOT NULL,
  `money` decimal(10,2) unsigned NOT NULL,
  `pay_type` char(10) NOT NULL,
  `status` char(20) NOT NULL,
  `time` int(10) NOT NULL,
  `score` int(10) unsigned DEFAULT NULL,
  `scookies` text COMMENT '购物车cookie',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- 转存表中的数据 `yyg_member_addmoney_record`
--

INSERT INTO `yyg_member_addmoney_record` (`id`, `uid`, `code`, `money`, `pay_type`, `status`, `time`, `score`, `scookies`) VALUES
(1, 1, 'C14467964044928151', '10.00', '易宝支付', '未付款', 1446796404, 0, '0');

-- --------------------------------------------------------

--
-- 表的结构 `yyg_member_band`
--

CREATE TABLE IF NOT EXISTS `yyg_member_band` (
  `b_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `b_uid` int(10) DEFAULT NULL COMMENT '用户ID',
  `b_type` char(10) DEFAULT NULL COMMENT '绑定登陆类型',
  `b_code` varchar(100) DEFAULT NULL COMMENT '返回数据1',
  `b_data` varchar(100) DEFAULT NULL COMMENT '返回数据2',
  `b_time` int(10) DEFAULT NULL,
  PRIMARY KEY (`b_id`),
  KEY `b_uid` (`b_uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `yyg_member_cashout`
--

CREATE TABLE IF NOT EXISTS `yyg_member_cashout` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(10) unsigned NOT NULL COMMENT '用户id',
  `username` varchar(20) NOT NULL COMMENT '开户人',
  `bankname` varchar(255) NOT NULL COMMENT '银行名称',
  `branch` varchar(255) NOT NULL COMMENT '支行',
  `money` decimal(8,0) NOT NULL DEFAULT '0' COMMENT '申请提现金额',
  `time` char(20) NOT NULL COMMENT '申请时间',
  `banknumber` varchar(50) NOT NULL COMMENT '银行帐号',
  `linkphone` varchar(100) NOT NULL COMMENT '联系电话',
  `auditstatus` tinyint(4) NOT NULL COMMENT '1审核通过',
  `procefees` decimal(8,2) NOT NULL COMMENT '手续费',
  `reviewtime` char(20) NOT NULL COMMENT '审核通过时间',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`),
  KEY `type` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='会员账户明细' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `yyg_member_del`
--

CREATE TABLE IF NOT EXISTS `yyg_member_del` (
  `uid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` char(20) NOT NULL COMMENT '用户名',
  `email` varchar(50) DEFAULT NULL COMMENT '用户邮箱',
  `mobile` char(11) DEFAULT NULL COMMENT '用户手机',
  `password` char(32) DEFAULT NULL COMMENT '密码',
  `user_ip` varchar(255) DEFAULT NULL,
  `img` varchar(255) DEFAULT NULL COMMENT '用户头像',
  `qianming` varchar(255) DEFAULT NULL COMMENT '用户签名',
  `groupid` tinyint(4) unsigned DEFAULT '0' COMMENT '用户权限组',
  `addgroup` varchar(255) DEFAULT NULL COMMENT '用户加入的圈子组1|2|3',
  `money` decimal(10,2) unsigned DEFAULT '0.00' COMMENT '账户金额',
  `emailcode` char(21) DEFAULT '-1' COMMENT '邮箱认证码',
  `mobilecode` char(21) DEFAULT '-1' COMMENT '手机认证码',
  `passcode` char(21) DEFAULT '-1' COMMENT '找会密码认证码-1,1,码',
  `reg_key` varchar(100) DEFAULT NULL COMMENT '注册参数',
  `score` int(10) unsigned NOT NULL DEFAULT '0',
  `jingyan` int(10) unsigned DEFAULT '0',
  `yaoqing` int(10) unsigned DEFAULT NULL,
  `band` varchar(255) DEFAULT NULL,
  `time` int(10) unsigned DEFAULT '0',
  `login_time` int(10) unsigned DEFAULT '0',
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='会员表' AUTO_INCREMENT=30 ;

--
-- 转存表中的数据 `yyg_member_del`
--

INSERT INTO `yyg_member_del` (`uid`, `username`, `email`, `mobile`, `password`, `user_ip`, `img`, `qianming`, `groupid`, `addgroup`, `money`, `emailcode`, `mobilecode`, `passcode`, `reg_key`, `score`, `jingyan`, `yaoqing`, `band`, `time`, `login_time`) VALUES
(1, '231313', '729313637@qq.com', '18728449489', 'e10adc3949ba59abbe56e057f20f883e', '四川省成都市,118.114.220.49', 'photo/member.jpg', '', 1, NULL, '10000.00', '1', '1', '-1', NULL, 10000, 10000, NULL, NULL, 1443423812, 0),
(29, '', NULL, '18200182250', '0b4e7a0e5fe84ad35fb5f95b9ceeac79', '四川省成都市,118.112.163.185', 'photo/member.jpg', NULL, 0, NULL, '0.00', '-1', '1', '-1', '18200182250', 0, 0, 0, NULL, 1448969416, 0);

-- --------------------------------------------------------

--
-- 表的结构 `yyg_member_dizhi`
--

CREATE TABLE IF NOT EXISTS `yyg_member_dizhi` (
  `id` tinyint(4) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id',
  `uid` int(10) NOT NULL COMMENT '用户id',
  `sheng` varchar(15) DEFAULT NULL COMMENT '省',
  `shi` varchar(15) DEFAULT NULL COMMENT '市',
  `xian` varchar(15) DEFAULT NULL COMMENT '县',
  `jiedao` varchar(255) DEFAULT NULL COMMENT '街道地址',
  `youbian` mediumint(8) DEFAULT NULL COMMENT '邮编',
  `shouhuoren` varchar(15) DEFAULT NULL COMMENT '收货人',
  `mobile` char(11) DEFAULT NULL COMMENT '手机',
  `qq` char(11) DEFAULT NULL COMMENT 'QQ',
  `tell` varchar(15) DEFAULT NULL COMMENT '座机号',
  `default` char(1) DEFAULT 'N' COMMENT '是否默认',
  `time` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='会员地址表' AUTO_INCREMENT=70 ;

--
-- 转存表中的数据 `yyg_member_dizhi`
--

INSERT INTO `yyg_member_dizhi` (`id`, `uid`, `sheng`, `shi`, `xian`, `jiedao`, `youbian`, `shouhuoren`, `mobile`, `qq`, `tell`, `default`, `time`) VALUES
(1, 1, '四川省', '成都市', '金牛区', '群星路13号', 0, '代小林', '18200182250', NULL, '', 'Y', 1448937899),
(2, 5, '四川省', '成都市', '金牛区', '群星路13号', 609999, '杨总', '13888888888', '13522465625', '13888888888', 'N', 1448937899),
(3, 5, '四川省', '成都市', '高新区', '双楠15号', 610000, '杨哥', '81052547', '4513761321', '13888888888', 'N', 1448937899),
(36, 3, '北京市', '北京市', 'undefined', '营和巷52号', 0, '张兵文', '13980622590', NULL, NULL, 'N', 1450316814),
(66, 31, '黑龙江省', '哈尔滨市', '道里区', '皮皮拿了', 258963, '111', '15896324785', NULL, NULL, 'N', 1450341177),
(68, 31, '吉林省', '长春市', '南关区', '佛祖啦', 369258, '阿桔', '15825809635', NULL, NULL, 'N', 1450342020),
(69, 31, '河北省', '石家庄市', '长安区', '么思', 147258, '111', '15809632154', NULL, NULL, 'Y', 1450342044);

-- --------------------------------------------------------

--
-- 表的结构 `yyg_member_yyg_record`
--

CREATE TABLE IF NOT EXISTS `yyg_member_yyg_record` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `code` char(20) DEFAULT NULL COMMENT '订单号',
  `code_tmp` tinyint(3) unsigned DEFAULT NULL COMMENT '相同订单',
  `username` varchar(30) NOT NULL,
  `uphoto` varchar(255) DEFAULT NULL,
  `uid` int(10) unsigned NOT NULL COMMENT '会员id',
  `shopid` int(6) unsigned NOT NULL COMMENT '商品id',
  `shopname` varchar(255) NOT NULL COMMENT '商品名',
  `shopqishu` smallint(6) NOT NULL DEFAULT '0' COMMENT '期数',
  `gonumber` smallint(5) unsigned DEFAULT NULL COMMENT '购买次数',
  `goucode` longtext NOT NULL COMMENT '云购码',
  `moneycount` decimal(10,2) NOT NULL,
  `huode` char(50) NOT NULL DEFAULT '0' COMMENT '中奖码',
  `pay_type` char(10) DEFAULT NULL COMMENT '付款方式',
  `ip` varchar(255) DEFAULT NULL,
  `status` char(30) DEFAULT NULL COMMENT '订单状态',
  `time` char(21) NOT NULL COMMENT '购买时间',
  `company` int(10) unsigned NOT NULL,
  `company_code` int(10) unsigned NOT NULL,
  `company_money` int(10) unsigned NOT NULL,
  `default` enum('Y','N') CHARACTER SET armscii8 NOT NULL DEFAULT 'N',
  PRIMARY KEY (`id`,`default`),
  KEY `uid` (`uid`),
  KEY `shopid` (`shopid`),
  KEY `time` (`time`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='云购记录表' AUTO_INCREMENT=17 ;

--
-- 转存表中的数据 `yyg_member_yyg_record`
--

INSERT INTO `yyg_member_yyg_record` (`id`, `code`, `code_tmp`, `username`, `uphoto`, `uid`, `shopid`, `shopname`, `shopqishu`, `gonumber`, `goucode`, `moneycount`, `huode`, `pay_type`, `ip`, `status`, `time`, `company`, `company_code`, `company_money`, `default`) VALUES
(1, 'A14467904207158264', 0, 'mlsw', 'touimg/20151106/36911702790378.jpg', 5, 3, '电脑', 1, 1, '10000947', '1.00', '0', '账户', '四川省成都市,171.88.58.27', '已付款,未发货,未完成', '1446790421.036', 0, 0, 0, 'N'),
(2, 'A14467904320887068', 0, 'mlsw', 'touimg/20151106/36911702790378.jpg', 5, 3, '电脑', 1, 1, '10000590', '1.00', '0', '账户', '四川省成都市,171.88.58.27', '已付款,未发货,未完成', '1446790432.354', 0, 0, 0, 'N'),
(3, 'A14467931070754935', 0, 'mlsw', 'touimg/20151106/36911702790378.jpg', 5, 3, '电脑', 1, 30, '10000404,10000069,10000302,10000391,10000294,10000757,10000751,10000088,10000595,10000138,10000760,10000056,10000605,10000634,10000427,10000155,10000219,10000889,10000797,10000348,10000150,10000618,10000306,10000594,10000238,10000295,10000877,10000540,10000203,10000808', '30.00', '10000001', '账户', '四川省成都市,171.88.58.27', '已付款,未发货,未完成', '1446793108.380', 0, 0, 0, 'N'),
(4, 'A14467944796634157', 0, 'mlsw', 'touimg/20151106/36911702790378.jpg', 5, 341, '电脑', 2, 1, '10000002', '1.00', '0', '账户', '四川省成都市,171.88.58.27', '已付款,未发货,未完成', '1446794479.910', 0, 0, 0, 'Y'),
(5, 'A14467944914348618', 0, 'mlsw', 'touimg/20151106/36911702790378.jpg', 5, 341, '电脑', 2, 1, '10000005', '1.00', '0', '账户', '', '已付款,未发货,未完成', '1446794501.621', 0, 0, 0, 'Y'),
(6, 'A14467945167866966', 0, 'mlsw', 'touimg/20151106/36911702790378.jpg', 5, 341, '电脑', 2, 1, '10000018', '1.00', '0', '账户', '四川省成都市,171.88.58.27', '已付款,未发货,未完成', '1446794517.066', 0, 0, 0, 'Y'),
(7, 'A14467945369370379', 0, 'mlsw', 'touimg/20151106/36911702790378.jpg', 5, 341, '电脑', 2, 2, '10000010,10000009', '2.00', '0', '账户', '四川省成都市,171.88.58.27', '已付款,未发货,未完成', '1446794537.217', 0, 0, 0, 'Y'),
(8, 'A14467945487971195', 0, 'mlsw', 'touimg/20151106/36911702790378.jpg', 5, 341, '电脑', 2, 3, '10000015,10000008,10000012', '3.00', '0', '账户', '四川省成都市,171.88.58.27', '已付款,未发货,未完成', '1446794549.027', 0, 0, 0, 'Y'),
(9, 'A14467945629560848', 0, 'mlsw', 'touimg/20151106/36911702790378.jpg', 5, 341, '电脑', 2, 3, '10000006,10000014,10000004', '3.00', '0', '账户', '四川省成都市,171.88.58.27', '已付款,未发货,未完成', '1446794563.187', 0, 0, 0, 'Y'),
(10, 'A14467946205266817', 0, 'mlsw', 'touimg/20151106/36911702790378.jpg', 5, 341, '电脑', 2, 5, '10000017,10000007,10000011,10000003,10000020', '5.00', '0', '账户', '四川省成都市,171.88.58.27', '已付款,未发货,未完成', '1446794620.757', 0, 0, 0, 'Y'),
(11, 'A14467946984115279', 0, 'mlsw', 'touimg/20151106/36911702790378.jpg', 5, 341, '电脑', 2, 1, '10000001', '1.00', '10000001', '账户', '四川省成都市,171.88.58.27', '已付款,未发货,未完成', '1446794698.727', 0, 0, 0, 'Y'),
(12, 'A14467948077141713', 0, 'mlsw', 'touimg/20151106/36911702790378.jpg', 5, 341, '电脑', 2, 3, '10000019,10000016,10000013', '3.00', '0', '账户', '四川省成都市,171.88.58.27', '已付款,未发货,未完成', '1446794807.964', 0, 0, 0, 'Y'),
(13, 'A14488914950929345', 0, '小林', 'photo/member.jpg', 1, 322, '美国进口 Ocean Spray 优鲜沛经典原味蔓越莓汁饮料1.5L', 174, 1, '10000003', '1.00', '0', '账户', '四川省成都市,171.88.58.194', '已付款,未发货,未完成', '1448891495.240', 0, 0, 0, 'N'),
(14, 'A14488915378538656', 0, '小林', 'photo/member.jpg', 1, 322, '美国进口 Ocean Spray 优鲜沛经典原味蔓越莓汁饮料1.5L', 174, 1, '10000017', '1.00', '0', '账户', '四川省成都市,171.88.58.194', '已付款,未发货,未完成', '1448891537.985', 0, 0, 0, 'N'),
(15, 'A14488915876252980', 0, '小林', 'photo/member.jpg', 1, 322, '美国进口 Ocean Spray 优鲜沛经典原味蔓越莓汁饮料1.5L', 174, 1, '10000001', '1.00', '10000001', '账户', '四川省成都市,171.88.58.194', '已付款,已发货,已完成', '1448891587.741', 123123423, 23423423, 12, 'N'),
(16, 'A14489387088277677', 0, '小林', 'photo/member.jpg', 1, 343, 'Apple iPhone 6s (A1700) 16G 玫瑰金色 移动联通电信4G手机', 1, 1, '10000788', '1.00', '10000001', '账户', '四川省成都市,118.112.163.185', '已付款,未发货,未完成', '1448938708.991', 0, 0, 0, 'N');

-- --------------------------------------------------------

--
-- 表的结构 `yyg_apk_version`
--

CREATE TABLE IF NOT EXISTS `yyg_apk_version` (
  `id` tinyint(4) unsigned NOT NULL AUTO_INCREMENT,
  `version` char(255) NOT NULL COMMENT '版本号',
  `name`    char(255)  NOT NULL COMMENT '文件名',
  `time` timestamp COMMENT '上传时间',
  `type` char(1) NOT NULL DEFAULT 0 COMMENT '0是android，1是IOS',
  `url`   char(255) COMMENT '路径',  
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='版本号' AUTO_INCREMENT=7 ;

--
-- 转存表中的数据 `yyg_apk_version`
--

--
-- 表的结构 `yyg_member_group`
--

CREATE TABLE IF NOT EXISTS `yyg_member_group` (
  `groupid` tinyint(4) unsigned NOT NULL AUTO_INCREMENT,
  `name` char(15) NOT NULL COMMENT '会员组名',
  `jingyan_start` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '需要的经验值',
  `jingyan_end` int(10) NOT NULL,
  `icon` varchar(255) DEFAULT NULL COMMENT '图标',
  `type` char(1) NOT NULL DEFAULT 'N' COMMENT '是否是系统组',
  PRIMARY KEY (`groupid`),
  KEY `jingyan` (`jingyan_start`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='会员权限组' AUTO_INCREMENT=7 ;

--
-- 转存表中的数据 `yyg_member_group`
--

INSERT INTO `yyg_member_group` (`groupid`, `name`, `jingyan_start`, `jingyan_end`, `icon`, `type`) VALUES
(1, '云购新手', 0, 500, NULL, 'N'),
(2, '云购小将', 501, 1000, NULL, 'N'),
(3, '云购中将', 1001, 3000, NULL, 'N'),
(4, '云购上将', 3001, 6000, NULL, 'N'),
(5, '云购大将', 6001, 20000, NULL, 'N'),
(6, '云购将军', 20001, 40000, NULL, 'N');

-- --------------------------------------------------------

--
-- 表的结构 `yyg_member_hongbao`
--

CREATE TABLE IF NOT EXISTS `yyg_member_hongbao` (
  `uid` int(10) unsigned NOT NULL COMMENT '用户id',
  `type` tinyint(1) DEFAULT NULL COMMENT '获得1/消费-1',
  `pay` char(20) DEFAULT NULL,
  `content` varchar(255) DEFAULT NULL COMMENT '详情',
  `money` mediumint(8) NOT NULL DEFAULT '0' COMMENT '金额',
  `limitmoney` mediumint(8) NOT NULL DEFAULT '0' COMMENT '限制使用金额',
  `effective` char(20) NOT NULL COMMENT '有效期',
  `time` char(20) NOT NULL,
  KEY `uid` (`uid`),
  KEY `type` (`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='会员红包明细';

--
-- 转存表中的数据 `yyg_member_hongbao`
--

INSERT INTO `yyg_member_hongbao` (`uid`, `type`, `pay`, `content`, `money`, `limitmoney`, `effective`, `time`) VALUES
(1, 1, NULL, '通过分享注册账户', 5, 10, '1453350928', '1450758928'),
(1, 1, NULL, '通过分享信息', 5, 10, '1453350928', '1450758928'),
(34, 1, NULL, '通过分享注册账户', 5, 10, '1453357993', '1450765993'),
(34, 1, NULL, '通过分享信息', 5, 10, '1453357993', '1450765993');

-- --------------------------------------------------------

--
-- 表的结构 `yyg_member_hongbaotype`
--

CREATE TABLE IF NOT EXISTS `yyg_member_hongbaotype` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `hongbao` int(10) unsigned NOT NULL DEFAULT '5' COMMENT '红包大小',
  `hongbaotime` int(10) unsigned NOT NULL DEFAULT '30' COMMENT '红包有效期',
  `limitmoney` int(10) NOT NULL DEFAULT '10' COMMENT '限额',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='红包规则' AUTO_INCREMENT=2 ;

--
-- 转存表中的数据 `yyg_member_hongbaotype`
--

INSERT INTO `yyg_member_hongbaotype` (`id`, `hongbao`, `hongbaotime`, `limitmoney`) VALUES
(1, 5, 30, 10);

-- --------------------------------------------------------

--
-- 表的结构 `yyg_member_key`
--

CREATE TABLE IF NOT EXISTS `yyg_member_key` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `key` char(255) NOT NULL COMMENT '用户KEY',
  `time` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='用户KEY表' AUTO_INCREMENT=20 ;

--
-- 转存表中的数据 `yyg_member_key`
--

INSERT INTO `yyg_member_key` (`id`, `uid`, `key`, `time`) VALUES
(16, 5, '304cCQZSVgNUUwkBVlQABgpcAwxVUVJWVQcIAVYB', 1450693943),
(17, 31, '9f03VgUDAgJVAFRSAVMAUgYGUw9RUQIBVVQCUFBXAQ', 1450693143),
(18, 30, 'f9e5CAYEAAFUVFMCVgQHDlIEA1ICAVMGUgUCBAAACQ', 1450088666),
(19, 1, 'e1b5UwQGUggJUgQACF4GAlNYWgFRCQBcUQcBBFIB', 1450508548);

-- --------------------------------------------------------

--
-- 表的结构 `yyg_member_message`
--

CREATE TABLE IF NOT EXISTS `yyg_member_message` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(10) unsigned NOT NULL COMMENT '用户id',
  `type` tinyint(1) DEFAULT '0' COMMENT '消息来源,0系统,1私信',
  `sendid` int(10) unsigned DEFAULT '0' COMMENT '发送人ID',
  `sendname` char(20) DEFAULT NULL COMMENT '发送人名',
  `content` varchar(255) DEFAULT NULL COMMENT '发送内容',
  `time` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='会员消息表' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `yyg_member_mobilecode`
--

CREATE TABLE IF NOT EXISTS `yyg_member_mobilecode` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `mobile` char(20) DEFAULT NULL COMMENT '用户手机',
  `email` char(20) DEFAULT NULL COMMENT '用户邮箱',
  `code` char(10) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='用户mobilecode表' AUTO_INCREMENT=3 ;

--
-- 转存表中的数据 `yyg_member_mobilecode`
--

INSERT INTO `yyg_member_mobilecode` (`id`, `mobile`, `email`, `code`) VALUES
(2, '18728420441', NULL, '809704');

-- --------------------------------------------------------

--
-- 表的结构 `yyg_member_recodes`
--

CREATE TABLE IF NOT EXISTS `yyg_member_recodes` (
  `uid` int(10) unsigned NOT NULL COMMENT '用户id',
  `type` tinyint(1) NOT NULL COMMENT '收取1//充值-2/提现-3',
  `content` varchar(255) NOT NULL COMMENT '详情',
  `shopid` int(11) DEFAULT NULL COMMENT '商品id',
  `money` decimal(8,2) NOT NULL DEFAULT '0.00' COMMENT '佣金',
  `time` char(20) NOT NULL,
  `ygmoney` decimal(8,2) NOT NULL COMMENT '云购金额',
  `cashoutid` int(11) DEFAULT NULL COMMENT '申请提现记录表id',
  KEY `uid` (`uid`),
  KEY `type` (`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='会员账户明细';

-- --------------------------------------------------------

--
-- 表的结构 `yyg_member_red_envelope`
--

CREATE TABLE IF NOT EXISTS `yyg_member_red_envelope` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `mobile` char(11) DEFAULT NULL COMMENT '用户手机',
  `uid` int(10) unsigned NOT NULL COMMENT '会员id',
  `status` enum('0','1') DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='分享得红包信息表' AUTO_INCREMENT=4 ;

--
-- 转存表中的数据 `yyg_member_red_envelope`
--

INSERT INTO `yyg_member_red_envelope` (`id`, `mobile`, `uid`, `status`) VALUES
(1, '18728420441', 5, '1');

-- --------------------------------------------------------

--
-- 表的结构 `yyg_member_score`
--

CREATE TABLE IF NOT EXISTS `yyg_member_score` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(10) unsigned NOT NULL COMMENT '会员id',
  `score` int(10) unsigned NOT NULL COMMENT '福分',
  `content` varchar(255) DEFAULT NULL COMMENT '详情',
  `type` tinyint(1) NOT NULL COMMENT '获取1//使用-1',
  `time` char(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='福分详细' AUTO_INCREMENT=43 ;

--
-- 转存表中的数据 `yyg_member_score`
--

INSERT INTO `yyg_member_score` (`id`, `uid`, `score`, `content`, `type`, `time`) VALUES
(1, 1, 20, '分享获得商品', 1, '1450185295'),
(2, 5, 60, '分享数据', 1, '1450185295'),
(3, 5, 20, '使用金币', -1, '1450185295'),
(7, 1, 20, '晒单赚金币', 1, '1450185295'),
(8, 5, 40, '分享', 1, '1450185295'),
(9, 1, 20, '花费', -1, '1450185295'),
(10, 31, 0, '金币兑换', -1, '1450404876'),
(11, 31, 0, '金币兑换', -1, '1450404920'),
(12, 31, 0, '金币兑换', -1, '1450404961'),
(13, 31, 0, '金币兑换', -1, '1450405012'),
(14, 31, 0, '金币兑换', -1, '1450405015'),
(15, 31, 0, '金币兑换', -1, '1450405051'),
(16, 31, 0, '金币兑换', -1, '1450405064'),
(17, 31, 0, '金币兑换', -1, '1450405577'),
(18, 31, 0, '金币兑换', -1, '1450405921'),
(19, 31, 0, '金币兑换', -1, '1450406140'),
(20, 31, 0, '金币兑换', -1, '1450406921'),
(21, 31, 0, '金币兑换', -1, '1450406956'),
(22, 31, 0, '金币兑换', -1, '1450407126'),
(23, 31, 0, '金币兑换', -1, '1450407159'),
(24, 31, 0, '金币兑换', -1, '1450407225'),
(25, 31, 0, '金币兑换', -1, '1450407270'),
(26, 31, 0, '金币兑换', -1, '1450407286'),
(27, 31, 0, '金币兑换', -1, '1450407293'),
(28, 31, 0, '金币兑换', -1, '1450407566'),
(29, 31, 0, '金币兑换', -1, '1450407568'),
(30, 31, 0, '金币兑换', -1, '1450407569'),
(31, 31, 0, '金币兑换', -1, '1450407569'),
(32, 31, 0, '金币兑换', -1, '1450407569'),
(33, 31, 0, '金币兑换', -1, '1450407569'),
(34, 31, 0, '金币兑换', -1, '1450407614'),
(35, 31, 0, '金币兑换', -1, '1450407854'),
(36, 31, 100, '金币兑换', -1, '1450408390'),
(37, 31, 100, '金币兑换', -1, '1450408426'),
(38, 31, 100, '金币兑换', -1, '1450408985'),
(39, 31, 100, '金币兑换', -1, '1450409180'),
(40, 31, 100, '金币兑换', -1, '1450410015'),
(41, 31, 100, '金币兑换', -1, '1450410851'),
(42, 31, 100, '金币兑换', -1, '1450662327');

-- --------------------------------------------------------

--
-- 表的结构 `yyg_member_scoretype`
--

CREATE TABLE IF NOT EXISTS `yyg_member_scoretype` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `scoretype` int(10) unsigned NOT NULL DEFAULT '20' COMMENT '福分获得规则',
  `scoreexchange` int(10) unsigned NOT NULL DEFAULT '100' COMMENT '福分规则',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='福分规则表' AUTO_INCREMENT=2 ;

--
-- 转存表中的数据 `yyg_member_scoretype`
--

INSERT INTO `yyg_member_scoretype` (`id`, `scoretype`, `scoreexchange`) VALUES
(1, 20, 100);

-- --------------------------------------------------------

--
-- 表的结构 `yyg_model`
--

CREATE TABLE IF NOT EXISTS `yyg_model` (
  `modelid` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `name` char(10) NOT NULL,
  `table` char(20) NOT NULL,
  PRIMARY KEY (`modelid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='模型表' AUTO_INCREMENT=3 ;

--
-- 转存表中的数据 `yyg_model`
--

INSERT INTO `yyg_model` (`modelid`, `name`, `table`) VALUES
(1, '云购模型', 'shoplist'),
(2, '文章模型', 'article');

-- --------------------------------------------------------

--
-- 表的结构 `yyg_navigation`
--

CREATE TABLE IF NOT EXISTS `yyg_navigation` (
  `cid` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `parentid` smallint(6) unsigned DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `type` char(10) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `status` char(1) DEFAULT 'Y' COMMENT '显示/隐藏',
  `order` smallint(6) unsigned DEFAULT '1',
  PRIMARY KEY (`cid`),
  KEY `status` (`status`),
  KEY `order` (`order`),
  KEY `type` (`type`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=18 ;

--
-- 转存表中的数据 `yyg_navigation`
--

INSERT INTO `yyg_navigation` (`cid`, `parentid`, `name`, `type`, `url`, `status`, `order`) VALUES
(1, 0, '所有商品', 'index', '/goods_list', 'Y', 2),
(2, 0, '新手指南', 'index', '/single/newbie', 'Y', 2),
(3, 0, '云购圈', 'foot', '/group', 'Y', 2),
(4, 0, '关于云购', 'foot', '/help/1', 'Y', 1),
(5, 0, '隐私声明', 'foot', '/help/12', 'Y', 1),
(6, 0, '合作专区', 'foot', '/single/business', 'Y', 1),
(7, 0, '友情链接', 'foot', '/link', 'Y', 1),
(8, 0, '联系我们', 'foot', '/help/13', 'Y', 1),
(13, 0, '邀请', 'index', '/single/pleasereg', 'Y', 1),
(14, 0, '限时揭晓', 'index', '/go/autolottery', 'Y', 1),
(16, 0, '最新揭晓', 'index', '/goods_lottery', 'Y', 1),
(17, NULL, '最新分享', 'index', '', 'Y', 1);

-- --------------------------------------------------------

--
-- 表的结构 `yyg_pay`
--

CREATE TABLE IF NOT EXISTS `yyg_pay` (
  `pay_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `pay_name` char(20) NOT NULL,
  `pay_class` char(20) NOT NULL,
  `pay_type` tinyint(3) NOT NULL,
  `pay_thumb` varchar(255) DEFAULT NULL,
  `pay_des` text,
  `pay_start` tinyint(4) NOT NULL,
  `pay_key` text,
  PRIMARY KEY (`pay_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- 转存表中的数据 `yyg_pay`
--

INSERT INTO `yyg_pay` (`pay_id`, `pay_name`, `pay_class`, `pay_type`, `pay_thumb`, `pay_des`, `pay_start`, `pay_key`) VALUES
(1, '财付通', 'tenpay', 1, 'photo/cft.gif', '腾讯财付通	', 0, 'a:2:{s:2:"id";a:2:{s:4:"name";s:19:"财付通商户号:";s:3:"val";s:0:"";}s:3:"key";a:2:{s:4:"name";s:16:"财付通密钥:";s:3:"val";s:0:"";}}'),
(2, '支付宝', 'alipay', 1, 'photo/20130929/82028078450752.jpg', '支付宝支付', 1, 'a:3:{s:2:"id";a:2:{s:4:"name";s:19:"支付宝商户号:";s:3:"val";s:2:"aa";}s:3:"key";a:2:{s:4:"name";s:16:"支付宝密钥:";s:3:"val";s:2:"aa";}s:4:"user";a:2:{s:4:"name";s:16:"支付宝账号:";s:3:"val";s:2:"aa";}}'),
(3, '易宝支付', 'yeepay', 1, 'photo/20130929/93656812450898.jpg', '易宝支付', 1, 'a:2:{s:2:"id";a:2:{s:4:"name";s:16:"易宝商户号:";s:3:"val";s:0:"";}s:3:"key";a:2:{s:4:"name";s:13:"易宝密钥:";s:3:"val";s:0:"";}}'),
(4, '微信支付', 'wxpay', 0, '', '微信支付', 1, 'a:2:{s:2:"id";a:2:{s:4:"name";s:9:"商户号";s:3:"val";s:9:"234345234";}s:3:"key";a:2:{s:4:"name";s:6:"密匙";s:3:"val";s:15:"sdfs234234sdfsd";}}');

-- --------------------------------------------------------

--
-- 表的结构 `yyg_position`
--

CREATE TABLE IF NOT EXISTS `yyg_position` (
  `pos_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `pos_model` tinyint(3) unsigned NOT NULL,
  `pos_name` varchar(30) NOT NULL,
  `pos_num` tinyint(3) unsigned NOT NULL,
  `pos_maxnum` tinyint(3) unsigned NOT NULL,
  `pos_this_num` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `pos_time` int(10) unsigned NOT NULL,
  PRIMARY KEY (`pos_id`),
  KEY `pos_id` (`pos_id`),
  KEY `pos_model` (`pos_model`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `yyg_position_data`
--

CREATE TABLE IF NOT EXISTS `yyg_position_data` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `con_id` int(10) unsigned NOT NULL,
  `mod_id` tinyint(3) unsigned NOT NULL,
  `mod_name` char(20) NOT NULL,
  `pos_id` int(10) unsigned NOT NULL,
  `pos_data` mediumtext NOT NULL,
  `pos_order` int(10) unsigned NOT NULL DEFAULT '1',
  `pos_time` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `yyg_qqset`
--

CREATE TABLE IF NOT EXISTS `yyg_qqset` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `qq` varchar(11) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `type` varchar(20) DEFAULT NULL,
  `province` varchar(50) DEFAULT NULL,
  `city` varchar(50) DEFAULT NULL,
  `county` varchar(50) DEFAULT NULL,
  `qqurl` varchar(250) DEFAULT NULL,
  `full` varchar(6) DEFAULT NULL COMMENT '是否已满',
  `subtime` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=19 ;

--
-- 转存表中的数据 `yyg_qqset`
--

INSERT INTO `yyg_qqset` (`id`, `qq`, `name`, `type`, `province`, `city`, `county`, `qqurl`, `full`, `subtime`) VALUES
(18, '156556', '苏珊丹', '直属群', '省份', '地级市', '市、县级市', '<srcipt> alert(1)</script>', '未满', 1418873873);

-- --------------------------------------------------------

--
-- 表的结构 `yyg_quanzi`
--

CREATE TABLE IF NOT EXISTS `yyg_quanzi` (
  `id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `title` char(15) NOT NULL COMMENT '标题',
  `img` varchar(255) DEFAULT NULL COMMENT '图片地址',
  `chengyuan` mediumint(8) unsigned DEFAULT '0' COMMENT '成员数',
  `tiezi` mediumint(8) unsigned DEFAULT '0' COMMENT '帖子数',
  `guanli` mediumint(8) unsigned NOT NULL COMMENT '管理员',
  `jinhua` smallint(5) unsigned DEFAULT NULL COMMENT '精华帖',
  `jianjie` varchar(255) DEFAULT '暂无介绍' COMMENT '简介',
  `gongao` varchar(255) DEFAULT '暂无' COMMENT '公告',
  `jiaru` char(1) DEFAULT 'Y' COMMENT '申请加入',
  `glfatie` char(1) DEFAULT 'N' COMMENT '发帖权限',
  `shenhe` char(1) NOT NULL DEFAULT 'N',
  `huifu` char(1) NOT NULL DEFAULT 'Y',
  `time` int(11) NOT NULL COMMENT '时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `yyg_quanzi_hueifu`
--

CREATE TABLE IF NOT EXISTS `yyg_quanzi_hueifu` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `tzid` int(11) DEFAULT NULL COMMENT '帖子ID匹配',
  `hueifu` text COMMENT '回复内容',
  `hueiyuan` varchar(255) DEFAULT NULL COMMENT '会员',
  `hftime` int(11) DEFAULT NULL COMMENT '时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `yyg_quanzi_tiezi`
--

CREATE TABLE IF NOT EXISTS `yyg_quanzi_tiezi` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `qzid` int(10) unsigned DEFAULT NULL COMMENT '圈子ID匹配',
  `tiezi` int(10) unsigned NOT NULL DEFAULT '0',
  `hueiyuan` varchar(255) DEFAULT NULL COMMENT '会员信息',
  `title` varchar(255) DEFAULT NULL COMMENT '标题',
  `neirong` text COMMENT '内容',
  `hueifu` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '回复',
  `dianji` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '点击量',
  `zhiding` char(1) DEFAULT 'N' COMMENT '置顶',
  `jinghua` char(1) DEFAULT 'N' COMMENT '精华',
  `zuihou` varchar(255) DEFAULT NULL COMMENT '最后回复',
  `shenhe` char(1) NOT NULL DEFAULT 'Y' COMMENT '是否通过',
  `time` int(10) unsigned DEFAULT NULL COMMENT '时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `yyg_recom`
--

CREATE TABLE IF NOT EXISTS `yyg_recom` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '推荐位id',
  `img` varchar(50) DEFAULT NULL COMMENT '推荐位图片',
  `title` varchar(30) DEFAULT NULL COMMENT '推荐位标题',
  `link` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `yyg_send`
--

CREATE TABLE IF NOT EXISTS `yyg_send` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(10) unsigned NOT NULL,
  `gid` int(10) unsigned NOT NULL,
  `username` varchar(30) NOT NULL,
  `shoptitle` varchar(200) NOT NULL,
  `send_type` tinyint(4) NOT NULL,
  `send_time` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`),
  KEY `gid` (`gid`),
  KEY `send_type` (`send_type`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=8 ;

-- --------------------------------------------------------

--
-- 表的结构 `yyg_shaidan`
--

CREATE TABLE IF NOT EXISTS `yyg_shaidan` (
  `sd_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '晒单id',
  `sd_userid` int(10) unsigned DEFAULT NULL COMMENT '用户ID',
  `sd_shopid` int(10) unsigned DEFAULT NULL COMMENT '商品ID',
  `sd_shopsid` int(10) unsigned DEFAULT NULL,
  `sd_qishu` int(10) unsigned DEFAULT NULL,
  `sd_ip` varchar(255) DEFAULT NULL,
  `sd_title` varchar(255) DEFAULT NULL COMMENT '晒单标题',
  `sd_thumbs` varchar(255) DEFAULT NULL COMMENT '缩略图',
  `sd_content` text COMMENT '晒单内容',
  `sd_photolist` text COMMENT '晒单图片',
  `sd_zhan` int(10) unsigned DEFAULT '0' COMMENT '点赞',
  `sd_ping` int(10) unsigned DEFAULT '0' COMMENT '评论',
  `sd_time` int(10) unsigned DEFAULT NULL COMMENT '晒单时间',
  PRIMARY KEY (`sd_id`),
  KEY `sd_userid` (`sd_userid`),
  KEY `sd_shopid` (`sd_shopid`),
  KEY `sd_zhan` (`sd_zhan`),
  KEY `sd_ping` (`sd_ping`),
  KEY `sd_time` (`sd_time`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='晒单' AUTO_INCREMENT=11 ;

--
-- 转存表中的数据 `yyg_shaidan`
--

INSERT INTO `yyg_shaidan` (`sd_id`, `sd_userid`, `sd_shopid`, `sd_shopsid`, `sd_qishu`, `sd_ip`, `sd_title`, `sd_thumbs`, `sd_content`, `sd_photolist`, `sd_zhan`, `sd_ping`, `sd_time`) VALUES
(1, 5, 3, NULL, NULL, '四川省成都市,118.114.220.255', '真是很好啊', 'shaidan/20151211/37959524815857.png_22050.png', '<p>欢迎使用云购系统!</p>', 'shaidan/20151211/37959524815857.png;', 5, 0, 1449815861),
(2, 5, 3, NULL, 1, NULL, '', 'touimg/20151106/36911702790378.jpg', '好货上架', 'touimg/20151106/36911702790378.jpg', 0, 0, 1450162410),
(3, 5, 3, NULL, 1, NULL, '', 'touimg/20151106/36911702790378.jpg', '好货上架', 'touimg/20151106/36911702790378.jpg', 0, 0, 1450162414),
(4, 5, 3, NULL, 1, NULL, '', 'touimg/20151106/36911702790378.jpg', '好货上架', 'touimg/20151106/36911702790378.jpg', 0, 0, 1450162464),
(5, 5, 3, NULL, 1, NULL, '', 'touimg/20151106/36911702790378.jpg', '好货上架', 'touimg/20151106/36911702790378.jpg', 0, 0, 1450162466),
(6, 5, 3, NULL, 1, NULL, '', 'touimg/20151106/36911702790378.jpg', '好货上架', 'touimg/20151106/36911702790378.jpg', 0, 0, 1450162571),
(7, 5, 3, NULL, 1, NULL, '', 'touimg/20151106/36911702790378.jpg', '好货上架', 'touimg/20151106/36911702790378.jpg', 0, 0, 1450164197),
(8, 5, 341, NULL, 2, NULL, '分享赚金币', 'shopimg/20150928/53320312423252.png', '购物狂欢中，shopping更快乐', 'touimg/20151106/36911702790378.jpg', 8, 0, 1450165928),
(9, 5, 341, NULL, 2, NULL, '的精神肉体结合', 'touimg/20151106/36911702790378.jpg', '确认为天津回来请我；', 'touimg/20151106/36911702790378.jpg', 3, 0, 1450229609),
(10, 1, 322, NULL, NULL, '四川省成都市,171.212.214.127', 'frdwfgregrrewwgre', 'shaidan/20151221/20616841672904.jpg_22015.jpg', '<p>欢迎使用云购系统!</p>', 'shaidan/20151221/20616841672904.jpg;', 0, 0, 1450672919);

-- --------------------------------------------------------

--
-- 表的结构 `yyg_shaidan_hueifu`
--

CREATE TABLE IF NOT EXISTS `yyg_shaidan_hueifu` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `sdhf_id` int(11) NOT NULL COMMENT '晒单ID',
  `sdhf_userid` int(11) DEFAULT NULL COMMENT '晒单回复会员ID',
  `sdhf_content` text COMMENT '晒单回复内容',
  `sdhf_time` int(11) DEFAULT NULL,
  `sdhf_username` char(20) DEFAULT NULL,
  `sdhf_img` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- 转存表中的数据 `yyg_shaidan_hueifu`
--

INSERT INTO `yyg_shaidan_hueifu` (`id`, `sdhf_id`, `sdhf_userid`, `sdhf_content`, `sdhf_time`, `sdhf_username`, `sdhf_img`) VALUES
(1, 1, 1, '恭喜你啦', 1396810591, '123456', 'photo/member.jpg'),
(2, 1, 5, '羡慕嫉妒恨', 1450169039, 'sbfdj', NULL),
(3, 322, 5, '羡慕嫉妒恨', 1450169212, 'sbfdj', NULL),
(4, 322, 5, '羡慕嫉妒恨', 1450169756, 'sbfdj', NULL);

-- --------------------------------------------------------

--
-- 表的结构 `yyg_shopcodes_1`
--

CREATE TABLE IF NOT EXISTS `yyg_shopcodes_1` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `s_id` int(10) unsigned NOT NULL,
  `s_cid` smallint(5) unsigned NOT NULL,
  `s_len` smallint(5) DEFAULT NULL,
  `s_codes` text,
  `s_codes_tmp` text,
  PRIMARY KEY (`id`),
  KEY `s_id` (`s_id`),
  KEY `s_cid` (`s_cid`),
  KEY `s_len` (`s_len`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=15 ;

-- --------------------------------------------------------

--
-- 表的结构 `yyg_shoplist`
--

CREATE TABLE IF NOT EXISTS `yyg_shoplist` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '商品id',
  `sid` int(10) unsigned NOT NULL COMMENT '同一个商品',
  `cateid` smallint(6) unsigned DEFAULT NULL COMMENT '所属栏目ID',
  `brandid` smallint(6) unsigned DEFAULT NULL COMMENT '所属品牌ID',
  `title` varchar(100) DEFAULT NULL COMMENT '商品标题',
  `title_style` varchar(100) DEFAULT NULL,
  `title2` varchar(100) DEFAULT NULL COMMENT '副标题',
  `keywords` varchar(100) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `money` decimal(10,2) DEFAULT '0.00' COMMENT '金额',
  `yunjiage` decimal(4,2) unsigned DEFAULT '1.00' COMMENT '云购人次价格',
  `zongrenshu` int(10) unsigned DEFAULT '0' COMMENT '总需人数',
  `canyurenshu` int(10) unsigned DEFAULT '0' COMMENT '已参与人数',
  `shenyurenshu` int(10) unsigned DEFAULT NULL,
  `def_renshu` int(10) unsigned DEFAULT '0',
  `qishu` smallint(6) unsigned DEFAULT '0' COMMENT '期数',
  `maxqishu` smallint(5) unsigned DEFAULT '1' COMMENT ' 最大期数',
  `thumb` varchar(255) DEFAULT NULL,
  `picarr` text COMMENT '商品图片',
  `content` mediumtext COMMENT '商品内容详情',
  `codes_table` char(20) DEFAULT NULL,
  `xsjx_time` int(10) unsigned DEFAULT NULL,
  `pos` tinyint(4) unsigned DEFAULT NULL COMMENT '是否推荐',
  `renqi` tinyint(4) unsigned DEFAULT '0' COMMENT '是否人气商品0否1是',
  `time` int(10) unsigned DEFAULT NULL COMMENT '时间',
  `order` int(10) unsigned DEFAULT '1',
  `q_uid` int(10) unsigned DEFAULT NULL COMMENT '中奖人ID',
  `q_user` text COMMENT '中奖人信息',
  `q_user_code` char(20) DEFAULT NULL COMMENT '中奖码',
  `q_content` mediumtext COMMENT '揭晓内容',
  `q_counttime` char(20) DEFAULT NULL COMMENT '总时间相加',
  `q_end_time` char(20) DEFAULT NULL COMMENT '揭晓时间',
  `q_showtime` char(1) DEFAULT 'N' COMMENT 'Y/N揭晓动画',
  PRIMARY KEY (`id`),
  KEY `renqi` (`renqi`),
  KEY `order` (`yunjiage`),
  KEY `q_uid` (`q_uid`),
  KEY `sid` (`sid`),
  KEY `shenyurenshu` (`shenyurenshu`),
  KEY `q_showtime` (`q_showtime`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='商品表' AUTO_INCREMENT=345 ;

-- --------------------------------------------------------

--
-- 表的结构 `yyg_shoplist_del`
--

CREATE TABLE IF NOT EXISTS `yyg_shoplist_del` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `sid` int(10) NOT NULL COMMENT '同一个商品',
  `cateid` smallint(6) unsigned DEFAULT NULL,
  `brandid` smallint(6) unsigned DEFAULT NULL,
  `title` varchar(100) DEFAULT NULL,
  `title_style` varchar(100) DEFAULT NULL,
  `title2` varchar(100) DEFAULT NULL,
  `keywords` varchar(100) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `money` decimal(10,2) DEFAULT '0.00',
  `yunjiage` decimal(4,2) unsigned DEFAULT '1.00',
  `zongrenshu` int(10) unsigned DEFAULT '0',
  `canyurenshu` int(10) unsigned DEFAULT '0',
  `shenyurenshu` int(10) unsigned DEFAULT NULL,
  `def_renshu` int(10) unsigned DEFAULT '0',
  `qishu` smallint(6) unsigned DEFAULT '0',
  `maxqishu` smallint(5) unsigned DEFAULT '1',
  `thumb` varchar(255) DEFAULT NULL,
  `picarr` text,
  `content` mediumtext,
  `codes_table` char(20) DEFAULT NULL,
  `xsjx_time` int(10) unsigned DEFAULT NULL,
  `pos` tinyint(4) unsigned DEFAULT NULL,
  `renqi` tinyint(4) unsigned DEFAULT '0',
  `time` int(10) unsigned DEFAULT NULL,
  `order` int(10) unsigned DEFAULT '1',
  `q_uid` int(10) unsigned DEFAULT NULL,
  `q_user` text COMMENT '中奖人信息',
  `q_user_code` char(20) DEFAULT NULL,
  `q_content` mediumtext,
  `q_counttime` char(20) DEFAULT NULL,
  `q_end_time` char(20) DEFAULT NULL,
  `q_showtime` char(1) DEFAULT 'N' COMMENT 'Y/N揭晓动画',
  PRIMARY KEY (`id`),
  KEY `renqi` (`renqi`),
  KEY `order` (`yunjiage`),
  KEY `q_uid` (`q_uid`),
  KEY `sid` (`sid`),
  KEY `shenyurenshu` (`shenyurenshu`),
  KEY `q_showtime` (`q_showtime`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `yyg_template`
--

CREATE TABLE IF NOT EXISTS `yyg_template` (
  `template_name` char(25) NOT NULL,
  `template` char(25) NOT NULL,
  `des` varchar(100) DEFAULT NULL,
  KEY `template` (`template`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `yyg_vote_activer`
--

CREATE TABLE IF NOT EXISTS `yyg_vote_activer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `option_id` int(11) NOT NULL,
  `vote_id` int(11) DEFAULT NULL,
  `userid` int(11) DEFAULT NULL,
  `ip` char(20) DEFAULT NULL,
  `subtime` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `yyg_vote_option`
--

CREATE TABLE IF NOT EXISTS `yyg_vote_option` (
  `option_id` int(11) NOT NULL AUTO_INCREMENT,
  `vote_id` int(11) DEFAULT NULL,
  `option_title` varchar(100) DEFAULT NULL,
  `option_number` int(11) unsigned DEFAULT '0',
  PRIMARY KEY (`option_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `yyg_vote_subject`
--

CREATE TABLE IF NOT EXISTS `yyg_vote_subject` (
  `vote_id` int(11) NOT NULL AUTO_INCREMENT,
  `vote_title` varchar(100) DEFAULT NULL,
  `vote_starttime` int(11) DEFAULT NULL,
  `vote_endtime` int(11) DEFAULT NULL,
  `vote_sendtime` int(11) DEFAULT NULL,
  `vote_description` text,
  `vote_allowview` tinyint(1) DEFAULT NULL,
  `vote_allowguest` tinyint(1) DEFAULT NULL,
  `vote_interval` int(11) DEFAULT '0',
  `vote_enabled` tinyint(1) DEFAULT NULL,
  `vote_number` int(11) DEFAULT NULL,
  PRIMARY KEY (`vote_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `yyg_wap`
--

CREATE TABLE IF NOT EXISTS `yyg_wap` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `img` varchar(50) DEFAULT NULL COMMENT '幻灯片',
  `title` varchar(30) DEFAULT NULL,
  `color` varchar(30) DEFAULT NULL,
  `link` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `img` (`img`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='幻灯片表' AUTO_INCREMENT=5 ;

--
-- 转存表中的数据 `yyg_wap`
--

INSERT INTO `yyg_wap` (`id`, `img`, `title`, `color`, `link`) VALUES
(1, 'banner/20150929/48926694456575.jpg', '', '', 'goods/340'),
(2, 'banner/20150929/42877333456673.jpg', '', '', ''),
(3, 'banner/20151210/22841736719600.png', '3', '', ''),
(4, 'banner/20151210/85445836719650.png', '', '', 'goods/340');

--
-- 表的结构 `yyg_options`
--

CREATE TABLE IF NOT EXISTS `yyg_options` (
  `option_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `option_name` varchar(64) NOT NULL COMMENT '配置名',
  `option_value` longtext NOT NULL COMMENT '配置值',
  `autoload` int(2) NOT NULL DEFAULT '1' COMMENT '是否自动加载',
  PRIMARY KEY (`option_id`),
  UNIQUE KEY `option_name` (`option_name`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='全站配置表' AUTO_INCREMENT=2 ;

--
-- 导出表中的数据 `yyg_options`
--

INSERT INTO `yyg_options` VALUES (1, 'member_email_active', '{"title":"ThinkYYG\\u90ae\\u4ef6\\u6fc0\\u6d3b\\u901a\\u77e5.","template":"<p>\\u672c\\u90ae\\u4ef6\\u6765\\u81ea<a href=\\"http:\\/\\/www.thinkyyg.com\\">ThinkYYG<\\/a><br\\/><br\\/>&nbsp; &nbsp;<strong>---------------<\\/strong><br\\/>&nbsp; &nbsp;<strong>\\u5e10\\u53f7\\u6fc0\\u6d3b\\u8bf4\\u660e<\\/strong><br\\/>&nbsp; &nbsp;<strong>---------------<\\/strong><br\\/><br\\/>&nbsp; &nbsp; \\u5c0a\\u656c\\u7684<span style=\\"FONT-SIZE: 16px; FONT-FAMILY: Arial; COLOR: rgb(51,51,51); LINE-HEIGHT: 18px; BACKGROUND-COLOR: rgb(255,255,255)\\">#username#\\uff0c\\u60a8\\u597d\\u3002<\\/span>\\u5982\\u679c\\u60a8\\u662fThinkYYG\\u7684\\u65b0\\u7528\\u6237\\uff0c\\u6216\\u5728\\u4fee\\u6539\\u60a8\\u7684\\u6ce8\\u518cEmail\\u65f6\\u4f7f\\u7528\\u4e86\\u672c\\u5730\\u5740\\uff0c\\u6211\\u4eec\\u9700\\u8981\\u5bf9\\u60a8\\u7684\\u5730\\u5740\\u6709\\u6548\\u6027\\u8fdb\\u884c\\u9a8c\\u8bc1\\u4ee5\\u907f\\u514d\\u5783\\u573e\\u90ae\\u4ef6\\u6216\\u5730\\u5740\\u88ab\\u6ee5\\u7528\\u3002<br\\/>&nbsp; &nbsp; \\u60a8\\u53ea\\u9700\\u70b9\\u51fb\\u4e0b\\u9762\\u7684\\u94fe\\u63a5\\u5373\\u53ef\\u6fc0\\u6d3b\\u60a8\\u7684\\u5e10\\u53f7\\uff1a<br\\/>&nbsp; &nbsp; <a title=\\"\\" href=\\"http:\\/\\/#link#\\" target=\\"_self\\">http:\\/\\/#link#<\\/a><br\\/>&nbsp; &nbsp; (\\u5982\\u679c\\u4e0a\\u9762\\u4e0d\\u662f\\u94fe\\u63a5\\u5f62\\u5f0f\\uff0c\\u8bf7\\u5c06\\u8be5\\u5730\\u5740\\u624b\\u5de5\\u7c98\\u8d34\\u5230\\u6d4f\\u89c8\\u5668\\u5730\\u5740\\u680f\\u518d\\u8bbf\\u95ee)<br\\/>&nbsp; &nbsp; \\u611f\\u8c22\\u60a8\\u7684\\u8bbf\\u95ee\\uff0c\\u795d\\u60a8\\u4f7f\\u7528\\u6109\\u5feb\\uff01<br\\/><br\\/>&nbsp; &nbsp; \\u6b64\\u81f4<br\\/>&nbsp; &nbsp; ThinkYYG \\u7ba1\\u7406\\u56e2\\u961f.<\\/p>"}', 1);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
