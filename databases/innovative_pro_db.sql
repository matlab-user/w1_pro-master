#-----------------------CREATE DATABASE innovative-----------------------
CREATE DATABASE IF NOT EXISTS `innovative_pro_db` DEFAULT CHARACTER SET `utf8`;

#-----------------------CREATE TABLE p_info_T------系统人员表----------------------
CREATE TABLE IF NOT EXISTS innovative_pro_db.p_info_t (
`u_id` BIGINT NOT NULL AUTO_INCREMENT,
`name` VARCHAR(64) NOT NULL,
`sex` ENUM('M','F') NOT NULL,
`photo` VARCHAR(128) NOT NULL, 
`sid` CHAR(16) NOT NULL UNIQUE,
`major` CHAR(64),
`id` CHAR(19) NOT NULL UNIQUE,
`com` VARCHAR(64),
`email` CHAR(64) NOT NULL UNIQUE,
`key` CHAR(128) NOT NULL,
`identity` ENUM('root','admin','member','chief','individual','expert','investor','tutor') NOT NULL DEFAULT 'individual',
`b_auth` ENUM('none','approve','review','publish','enter','browse') NOT NULL DEFAULT 'none',
`reg_t` DOUBLE NOT NULL,
`state` ENUM ('enable','disable') NOT NULL DEFAULT 'enable',
PRIMARY KEY (`u_id`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

#------------------------CREATE TABLE team_info_t--------团队信息表------------------
CREATE TABLE IF NOT EXISTS innovative_pro_db.team_info_t (
`t_id` CHAR(19) NOT NULL UNIQUE,
`t_name` CHAR(64) NOT NULL,
`reg_t` DOUBLE NOT NULL,
`chief` BIGINT NOT NULL,
`state` ENUM ('disband','active','ban') NOT NULL DEFAULT 'active',
PRIMARY KEY (`t_id`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

#--------------------------CREATE TABLE team_mem_t---------团队成员表----------------
CREATE TABLE IF NOT EXISTS innovative_pro_db.team_mem_t(
`t_id` CHAR(19) NOT NULL UNIQUE,
`m_id` BIGINT NOT NULL,
`state` ENUM ('in','remove') NOT NULL DEFAULT 'in',
PRIMARY KEY (`T_ID`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

#--------------------------CREATE TABLE affair_pro_flow_t-----事务处理流程表---------
CREATE TABLE IF NOT EXISTS innovative_pro_db.affar_pro_flow_t(
`a_id` BIGINT NOT NULL UNIQUE,
`a_name` VARCHAR(128) NOT NULL,
`set` INT,
`people` VARCHAR(256),
`weight` VARCHAR(128),
`st` BIGINT,
`et` BIGINT,
`pro_t` VARCHAR(32) DEFAULT 'now',
`pass` VARCHAR(64) DEFAULT 'd',
`res_fb` VARCHAR(128) DEFAULT 'd',
PRIMARY KEY (`a_id`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

#---------------------------CREATE TABLIE affair_t----------事务申请表-------------
CREATE TABLE IF NOT EXISTS innovative_pro_db.affair_t(
`id` BIGINT NOT NULL UNIQUE,
`a_id` BIGINT NOT NULL,
`apply_t` BIGINT NOT NULL,
`proposer` BIGINT NOT NULL,
`content` VARCHAR(1024),
`res` VARCHAR(32) NOT NULL,
`r_t` BIGINT NOT NULL,
PRIMARY KEY (`id`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

#--------------------------CREATE TABLE field_info_t---------场地信息表-------------
CREATE TABLE IF NOT EXISTS innovative_pro_db.field_info_t(
`id` INT NOT NULL UNIQUE,
`com` VARCHAR(64) NOT NULL,
`campus` VARCHAR(64) NOT NULL,
`buliding` VARCHAR(64) NOT NULL,
`room` VARCHAR(32) NOT NULL,
`acc` INT,
`rek` VARCHAR(256),
`close` VARCHAR(64),
`map` VARCHAR(256),
PRIMARY KEY (`id`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

#-------------------------CREATE TABLE field_use_t---------场地使用信息表---------
CREATE TABLE  IF NOT EXISTS innovative_pro_db.field_use_t(
`id` INT NOT NULL,
`time` VARCHAR(64),
`date` BIGINT NOT NULL,
`proposer` BIGINT NOT NULL,
`reason` VARCHAR(1024),
`state` ENUM('volid','valid') NOT NULL DEFAULT 'valid',
PRIMARY KEY (`id`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

#--------------------------CREATE TABLE affair_pro_t---------数据处理表------------
CREATE TABLE IF NOT EXISTS innovative_pro_db.affair_pro_t(
`id` BIGINT NOT NULL UNIQUE,
`o_id` BIGINT NOT NULL UNIQUE,
`a_id` BIGINT NOT NULL,
`step` int NOT NULL,
`proposer` BIGINT NOT NULL,
`processor` BIGINT NOT NULL,
`content` VARCHAR(1024),
`rec_t` BIGINT NOT NULL,
`end_t` BIGINT NOT NULL,
`comment` VARCHAR(1024),
`res` ENUM('pass','refuse','none') NOT NULL DEFAULT 'none',
PRIMARY KEY (`id`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;