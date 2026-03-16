drop database if exists `app_store`;

create database `app_store` default character set utf8mb4;

use `app_store`;

create table `app_info` (
`id` bigint(20) not null auto_increment comment 'auto-increment id, app id',
`app_name` varchar(255) default '' comment 'name',
`icon_url` varchar(255) default '' comment 'icon URL',
`version` varchar(32) default '' comment 'version',
`app_size` varchar(32) default '' comment 'package size',
`banner_info` varchar(4096) default '' comment 'banner information',
`developer_id` varchar(255) default '' comment 'developer id',
`summary` varchar(512) default '' comment 'summary',
`app_desc` text comment 'description',
`download_url` varchar(255) default '' comment 'download URL',
`price` int(10) default '0' comment 'price in cents',
`status` tinyint(4) unsigned default '0' comment 'status: 1 pending review, 2 approved, 3 offline',
`version_desc` varchar(4096) default '' comment '',
`create_time` datetime not null default '0000-00-00 00:00:00' comment 'created time',
`update_time` datetime not null default '0000-00-00 00:00:00' comment 'updated time',
primary key (`id`)
) engine=innodb auto_increment=100000 default charset=utf8mb4 comment='app basic information table';

create table `app_ext_info` (
`id` bigint(20) not null auto_increment comment 'auto-increment id',
`app_id` bigint(20) not null default '0' comment 'app_id',
`install_count` bigint(20) unsigned not null default '0' comment 'app install count',
`score` int(10) unsigned not null default '0' comment 'score',
`comment_count` int(10) unsigned not null default '0' comment 'comment count',
`create_time` int(10) not null default 0 comment 'created time',
`update_time` int(10) not null default 0 comment 'updated time',
primary key (`id`)
) engine=innodb default charset=utf8mb4 comment='app extension information table';

create table `app_category` (
`id` bigint(20) not null auto_increment comment 'auto-increment id',
`parent_id` bigint(20) not null default '0' comment 'parent category id',
`name` varchar(64) not null default '' comment 'category name',
`icon` varchar(512) not null default '' comment 'icon URL',
`category_desc` text comment 'category description',
`category_level` tinyint(4) unsigned not null default '0' comment 'category level',
`status` tinyint(4) unsigned not null default '0' comment 'current status, 1 active, hidden otherwise',
`display_order` int(10) unsigned not null default '0' comment 'sort order, larger values come first',
`create_time` int(10) not null default 0 comment 'created time',
`update_time` int(10) not null default 0 comment 'updated time',
primary key (`id`)
) engine=innodb default charset=utf8mb4 comment='category information table';

create table `app_category_rel` (
`id` bigint(20) not null auto_increment comment 'auto-increment id',
`app_id` bigint(20) not null default '0' comment 'app_id',
`category_id` bigint(20) unsigned not null default '0' comment 'leaf category id',
primary key (`id`),
unique key `idx_category_app` (`category_id`,`app_record_id`),
) engine=innodb default charset=utf8mb4 comment='app-category relation table';

create table `app_comment` (
`id` bigint(20) not null auto_increment comment 'auto-increment id',
`app_id` bigint(20) not null default '0' comment 'app_id',
`title` varchar(255) default '' comment 'comment title',
`content` varchar(2048) default '' comment 'comment content',
`parent_id` bigint(20) default '0' comment 'parent comment id',
`commenter_uid` bigint(20) default '0' comment 'comment user id',
`commenter_name` varchar(255) default '' comment 'comment user name',
`commenter_avatar` varchar(255) default '' comment 'comment user avatar',
`top_flag` tinyint(4) default '0' comment 'whether pinned',
`like_count` int(10) default '0' comment 'like count',
`status` tinyint(4) default '0' comment 'comment status',
`create_time` int(10) not null default 0 comment 'created time',
`update_time` int(10) not null default 0 comment 'updated time',
primary key (`id`),
key `idx_app_status` (`app_id`, `status`, `top_flag`)
) engine=innodb default charset=utf8mb4 comment='comment information table';

create table `user_app_relation` (
`id` bigint(20) not null auto_increment comment 'auto-increment id',
`user_id` bigint(20) unsigned not null default '0' comment 'user id',
`app_id` bigint(20) not null default '0' comment 'app_id',
`create_time` int(10) not null default 0 comment 'created time',
`update_time` int(10) not null default 0 comment 'updated time',
`is_del` tinyint(4) not null default '0' comment '1 deleted, 0 not deleted',
primary key (`id`),
key `idx_user_app` (`user_id`,`app_id`)
) engine=innodb auto_increment=8063 default charset=utf8mb4 comment='user purchase relation table';

create table `bot_score` (
`id` bigint(20) not null auto_increment comment 'auto-increment id',
`app_id` bigint(20) not null default '0' comment 'app_id',
`score` int(10) default '0' comment 'user score',
`commenter_uid` bigint(20) default '0' comment 'scoring user id',
`status` tinyint(4) default '0' comment 'score status',
`create_time` int(10) not null default 0 comment 'created time',
`update_time` int(10) not null default 0 comment 'updated time',
primary key (`id`),
unique key `idx_uid_score` (`app_id`,`commenter_uid`)
) engine=innodb default charset=utf8mb4 comment='app score table';
