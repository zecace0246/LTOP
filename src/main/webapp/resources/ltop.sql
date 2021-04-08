CREATE TABLE `bcg` (
  `bno` int(11) NOT NULL DEFAULT '0',
  `mat_id` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `respiration_rate` int(5) DEFAULT NULL,
  `heart_rate` int(5) DEFAULT NULL,
  `heart_rate_variability` float DEFAULT NULL,
  `sleep_mode` varchar(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `reg_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `reg_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`bno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci


CREATE TABLE `mat_alarm` (
  `alarm_no` int(11) NOT NULL DEFAULT '0',
  `mat_id` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `event_num` varchar(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `value` int(5) DEFAULT NULL,
  `reg_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `reg_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `confirm_yn` varchar(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `confirm_date` timestamp NULL DEFAULT NULL,
  `confirm_id` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`alarm_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci


CREATE TABLE `persistent_logins` (
  `username` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `series` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `last_used` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`series`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci


CREATE TABLE `tbl_agency` (
  `agency_no` int(11) NOT NULL,
  `agency_name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(1000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `adm_id` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `use_yn` varchar(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `reg_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`agency_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci


CREATE TABLE `tbl_agency_math` (
  `agency_no` int(11) NOT NULL,
  `mat_id` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(1000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `use_yn` varchar(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `reg_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `userid` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`agency_no`,`mat_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci


CREATE TABLE `tbl_alarm_property` (
  `category` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `category_sub` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `alarm_type` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(1000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `basis_min` varchar(5) COLLATE utf8_unicode_ci NOT NULL,
  `alarm_from` int(5) DEFAULT NULL,
  `alarm_to` int(5) DEFAULT NULL,
  `alert_yn` varchar(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `reg_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`category`,`category_sub`,`alarm_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci


CREATE TABLE `tbl_attach` (
  `uuid` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `uploadPath` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `fileName` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `filetype` char(1) COLLATE utf8_unicode_ci DEFAULT 'I',
  `bno` int(11) DEFAULT NULL,
  PRIMARY KEY (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci


CREATE TABLE `tbl_board` (
  `bno` int(11) DEFAULT NULL,
  `title` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `content` varchar(2000) COLLATE utf8_unicode_ci NOT NULL,
  `writer` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `regdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedate` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci


CREATE TABLE `tbl_code` (
  `code` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `p_code` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `code_name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `use_yn` varchar(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `reg_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`code`,`p_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci


CREATE TABLE `tbl_mat_info` (
  `mat_no` int(11) NOT NULL,
  `mat_id` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(1000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `use_yn` varchar(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `reg_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `attr1` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `attr2` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `attr3` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `attr4` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `attr5` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `attr6` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `attr7` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `attr8` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `attr9` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `attr10` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `regid` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`mat_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci


CREATE TABLE `tbl_member` (
  `userid` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `userpw` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `username` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `regdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedate` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `enabled` char(1) COLLATE utf8_unicode_ci DEFAULT '1',
  `birthday` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `mat_id` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL,
  `height` varchar(3) COLLATE utf8_unicode_ci DEFAULT NULL,
  `weight` varchar(3) COLLATE utf8_unicode_ci DEFAULT NULL,
  `tel` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `reguserid` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci


CREATE TABLE `tbl_member_auth` (
  `userid` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `auth` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  KEY `fk_member_auth` (`userid`),
  CONSTRAINT `fk_member_auth` FOREIGN KEY (`userid`) REFERENCES `tbl_member` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci