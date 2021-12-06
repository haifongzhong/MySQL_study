

#清除可能存在的同名数据库
DROP DATABASE IF EXISTS learnSQL;

#创建数据名为learnSQL的库，并选择该库
CREATE DATABASE learnSQL;
USE learnSQL;

#删除所以表
DROP TABLE IF EXISTS `participation`;
DROP TABLE IF EXISTS `projects`;
DROP TABLE IF EXISTS `salary`;
DROP TABLE IF EXISTS `managers`;
DROP TABLE IF EXISTS `employees`;
DROP TABLE IF EXISTS `departments`;


#创建部门表
DROP TABLE IF EXISTS `departments`;
CREATE TABLE `departments` (
  `department_id` INT(4) UNSIGNED ZEROFILL AUTO_INCREMENT ,
  `department_name` VARCHAR(30) NOT NULL,
  `location` VARCHAR(50) DEFAULT '江西省吉安市青原区井冈山大学',
  PRIMARY KEY (`department_id`)
) ENGINE=INNODB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

#创建员工表
DROP TABLE IF EXISTS `employees`;
CREATE TABLE `employees` (
  `employee_id` INT(6) UNSIGNED ZEROFILL AUTO_INCREMENT,
  `employee_name` VARCHAR(20) NOT NULL,
  `sex` CHAR NOT NULL COMMENT 'm:表示男性，w:表示女性',
  `e-mail` VARCHAR(20) DEFAULT NULL,
  `phone_number` CHAR(11) DEFAULT NULL,
  `ID_number` CHAR(18) NOT NULL UNIQUE,
  `employee_address` VARCHAR(50) DEFAULT NULL,
  `hiredate` DATETIME DEFAULT  NOW(),
  `department_id` INT(4) UNSIGNED ZEROFILL DEFAULT NULL,
  PRIMARY KEY (`employee_id`),
  KEY `dept_id_fk1` (`department_id`),
  CONSTRAINT `dept_id_fk1` FOREIGN KEY (`department_id`) REFERENCES `departments` (`department_id`)
) ENGINE=INNODB AUTO_INCREMENT=1000 DEFAULT CHARSET=utf8;

INSERT INTO employees(`employee_name`,`sex`,`ID_number`) VALUES ("李狗蛋",	'm',	"360531200006052937");
INSERT INTO employees(`employee_name`,`sex`,`ID_number`) VALUES ("王老虎",	'm',	"36053119886287875");
INSERT INTO employees(`employee_name`,`sex`,`ID_number`) VALUES ("小猪佩奇",	'w',	"360531200111157739");
INSERT INTO employees(`employee_name`,`sex`,`ID_number`) VALUES ("嘴强王者",	'w',	"360431202010221543");
INSERT INTO employees(`employee_name`,`sex`,`ID_number`) VALUES ("李易峰",	'm',	"340591200306152931");
INSERT INTO employees(`employee_name`,`sex`,`ID_number`) VALUES ("lisar",	'w',	"36053151001158989X");
INSERT INTO employees(`employee_name`,`sex`,`ID_number`) VALUES ("tomcat",	'm',	"360531207406152939");
INSERT INTO employees(`employee_name`,`sex`,`ID_number`) VALUES ("www",		'w',	"367231210006192939");
INSERT INTO employees(`employee_name`,`sex`,`ID_number`) VALUES ("nginx",	'm',	"367231210016197939");
INSERT INTO employees(`employee_name`,`sex`,`ID_number`) VALUES ("linux",	'm',	"366731210406192782");
INSERT INTO employees(`employee_name`,`sex`,`ID_number`) VALUES ("www",		'w',	"367231210006192939");
INSERT INTO employees(`employee_name`,`sex`,`ID_number`) VALUES ("利达",	'w',	"367231200106172939");
INSERT INTO employees(`employee_name`,`sex`,`ID_number`) VALUES ("迪迦",	'm',	"36723119991117727X");
INSERT INTO employees(`employee_name`,`sex`,`ID_number`) VALUES ("贝利亚",	'm',	"367231200802177933");

#主管表
DROP TABLE IF EXISTS `managers`;
CREATE TABLE `managers` (
  `manager_id` INT(4) UNSIGNED ZEROFILL AUTO_INCREMENT ,
  `employee_id` INT(8) UNSIGNED ZEROFILL NOT NULL,
  `department_id` INT(4) UNSIGNED ZEROFILL NOT NULL,
  PRIMARY KEY (`manager_id`),
  KEY `emp_id_fk1` (`employee_id`),
  CONSTRAINT `emp_id_fk1` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`employee_id`),
  KEY `dept_id_fk2` (`department_id`),
  CONSTRAINT `dept_id_fk2` FOREIGN KEY (`department_id`) REFERENCES `departments` (`department_id`)
) ENGINE=INNODB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8;

INSERT INTO managers(`employee_id`,`department_id`) VALUES("001000","0001");
INSERT INTO managers(`employee_id`,`department_id`) VALUES("001001","0001");
INSERT INTO managers(`employee_id`,`department_id`) VALUES("001001","0002");
INSERT INTO managers(`employee_id`,`department_id`) VALUES("001002","0001");
INSERT INTO managers(`employee_id`,`department_id`) VALUES("001002","0003");
INSERT INTO managers(`employee_id`,`department_id`) VALUES("001003","0007");
INSERT INTO managers(`employee_id`,`department_id`) VALUES("001004","0005");
INSERT INTO managers(`employee_id`,`department_id`) VALUES("001005","0002");
INSERT INTO managers(`employee_id`,`department_id`) VALUES("001006","0004");
INSERT INTO managers(`employee_id`,`department_id`) VALUES("001007","0005");
INSERT INTO managers(`employee_id`,`department_id`) VALUES("001008","0008");
INSERT INTO managers(`employee_id`,`department_id`) VALUES("001009","0009");
INSERT INTO managers(`employee_id`,`department_id`) VALUES("001010","0010");
INSERT INTO managers(`employee_id`,`department_id`) VALUES("001011","0011");
INSERT INTO managers(`employee_id`,`department_id`) VALUES("001012","0004");

#创建薪资表
DROP TABLE IF EXISTS `salary`;
CREATE TABLE `salary` (
  `sequence_id` INT(11) UNSIGNED ZEROFILL AUTO_INCREMENT,
  `employee_id` INT(8) UNSIGNED ZEROFILL NOT NULL,
  `basepay` DECIMAL(10,4) NOT NULL,
  `bonus` DECIMAL(10,4) DEFAULT NULL,
  `fine` DECIMAL(10,4) DEFAULT NULL,
  `s_date` DATETIME DEFAULT NOW(),
  `absenteeism` TINYINT UNSIGNED DEFAULT 0,
  PRIMARY KEY (`sequence_id`),
  KEY `emp_id_fk2` (`employee_id`),
  CONSTRAINT `emp_id_fk2` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`employee_id`)
) ENGINE=INNODB AUTO_INCREMENT=1000 DEFAULT CHARSET=utf8;

INSERT INTO salary(`employee_id`,`basepay`) VALUES ("001000",5500);
INSERT INTO salary(`employee_id`,`basepay`) VALUES ("001002",5000);
INSERT INTO salary(`employee_id`,`basepay`) VALUES ("001003",4000);

#创建项目表
DROP TABLE IF EXISTS `projects`;
CREATE TABLE `projects` (
  `project_id` VARCHAR(10),
  `project_name` VARCHAR(50) DEFAULT '***机密***',
  `principal_id` INT(8) UNSIGNED ZEROFILL NOT NULL,
  `construction_time` INT(4) UNSIGNED DEFAULT 40 COMMENT '工期默认是40天',
  `project_time` TIMESTAMP DEFAULT NOW() COMMENT '项目成立时间',
  PRIMARY KEY (`project_id`),
  KEY `fk_emp_principal` (`principal_id`),
  CONSTRAINT `fk_emp_principal` FOREIGN KEY (`principal_id`) REFERENCES `employees` (`employee_id`)
) ENGINE=INNODB DEFAULT CHARSET=utf8;

INSERT INTO projects(`project_id`,`principal_id`) VALUES ('G-SNS1352D','001000');
INSERT INTO projects(`project_id`,`principal_id`) VALUES ('G-SNS1287B','001001');
INSERT INTO projects(`project_id`,`project_name`,`principal_id`) VALUES ('G-SNS1382E',"腾讯——黎明计划",'001002');

#创建员工参与表
DROP TABLE IF EXISTS `participation`;
CREATE TABLE `participation` (
  `project_id` VARCHAR(10),
  `employee_id` INT(8) UNSIGNED ZEROFILL,
  `join_date` TIMESTAMP DEFAULT NOW(),
  PRIMARY KEY (`project_id`,`employee_id`),
  KEY `proj_id_fk1` (`project_id`),
  CONSTRAINT `proj_id_fk1` FOREIGN KEY (`project_id`) REFERENCES `projects` (`project_id`),
  KEY `emp_id_fk3` (`employee_id`),
  CONSTRAINT `emp_id_fk3` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`employee_id`)
) ENGINE=INNODB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8;


INSERT INTO participation(`project_id`,`employee_id`) VALUES ('G-SNS1352D','001000');
INSERT INTO participation(`project_id`,`employee_id`) VALUES ('G-SNS1287B','001001');
INSERT INTO participation(`project_id`,`employee_id`) VALUES ('G-SNS1382E','001002');
INSERT INTO participation(`project_id`,`employee_id`) VALUES ('G-SNS1352D','001003');
INSERT INTO participation(`project_id`,`employee_id`) VALUES ('G-SNS1287B','001004');
INSERT INTO participation(`project_id`,`employee_id`) VALUES ('G-SNS1382E','001004');


