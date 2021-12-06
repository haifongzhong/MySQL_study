

#清除可能存在的同名数据库
DROP DATABASE IF EXISTS learnSQL;

#创建数据名为learnSQL的库，并选择该库
CREATE DATABASE learnSQL;
USE learnSQL;

#删除所有表
DROP TABLE IF EXISTS `participation`;
DROP TABLE IF EXISTS `projects`;
DROP TABLE IF EXISTS `salary`;
DROP TABLE IF EXISTS `managers`;
DROP TABLE IF EXISTS `employees`;
DROP TABLE IF EXISTS `departments`;

#①创建部门表
DROP TABLE IF EXISTS `departments`;
CREATE TABLE `departments` (
  `department_id` INT(4) UNSIGNED ZEROFILL AUTO_INCREMENT ,
  `department_name` VARCHAR(30) NOT NULL,
  `location` VARCHAR(50) DEFAULT '江西省吉安市青原区井冈山大学',
  PRIMARY KEY (`department_id`)
) ENGINE=INNODB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

#②创建员工表
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

#③主管表
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
) ENGINE=INNODB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8

#④创建薪资表
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

#⑤创建项目表
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

#⑥创建员工参与表
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

