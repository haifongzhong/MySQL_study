

#清除可能存在的同名数据库
DROP DATABASE IF EXISTS learnSQL;

#创建数据名为learnSQL的库，并选择该库
CREATE DATABASE learnSQL;
USE learnSQL;

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
) ENGINE=INNODB AUTO_INCREMENT=1 DEFAULT CHARSET=gb2312;

INSERT INTO departments(`department_name`) VALUES ("董事会"),("产品部"),("开发部"),("市场部"),("财务部"),("策划部"),("公关部"),("销售部");

#创建员工表
DROP TABLE IF EXISTS `employees`;
CREATE TABLE `employees` (
  `employee_id` INT(6) UNSIGNED ZEROFILL AUTO_INCREMENT,
  `employee_name` VARCHAR(20) NOT NULL,
  `sex` CHAR NOT NULL,
  `e-mail` VARCHAR(20) DEFAULT NULL,
  `phone_number` CHAR(11) DEFAULT NULL,
  `ID_number` CHAR(18) NOT NULL UNIQUE,
  `employee_address` VARCHAR(50) DEFAULT NULL,
  `hiredate` DATETIME DEFAULT  NOW(),
  `department_id` INT(4) UNSIGNED ZEROFILL DEFAULT NULL,
  PRIMARY KEY (`employee_id`),
  KEY `dept_id_fk1` (`department_id`),
  CONSTRAINT `dept_id_fk1` FOREIGN KEY (`department_id`) REFERENCES `departments` (`department_id`)
) ENGINE=INNODB AUTO_INCREMENT=1000 DEFAULT CHARSET=gb2312;

INSERT INTO employees(`employee_name`,`sex`,`ID_number`) VALUES ("钟海峰",'m',"360531200006152939");
INSERT INTO employees(`employee_name`,`sex`,`ID_number`) VALUES ("王老虎",'m',"36053119886287875");
INSERT INTO employees(`employee_name`,`sex`,`ID_number`) VALUES ("小猪佩奇",'w',"360531200111157739");
INSERT INTO employees(`employee_name`,`sex`,`ID_number`) VALUES ("嘴强王者",'w',"360431202010221543");
INSERT INTO employees(`employee_name`,`sex`,`ID_number`) VALUES ("李易峰",'m',"340591200306152931");
INSERT INTO employees(`employee_name`,`sex`,`ID_number`) VALUES ("lisar",'w',"36053151001158989");
INSERT INTO employees(`employee_name`,`sex`,`ID_number`) VALUES ("tomcat",'m',"360531207406152939");
INSERT INTO employees(`employee_name`,`sex`,`ID_number`) VALUES ("www",'w',"367231210006192939");

#主管表
DROP TABLE IF EXISTS `managers`;
CREATE TABLE `managers` (
  `manager_id` INT(4) UNSIGNED ZEROFILL AUTO_INCREMENT ,
  `employee_id` INT(8) UNSIGNED ZEROFILL NOT NULL,
  `department_id` INT(4) UNSIGNED ZEROFILL DEFAULT NULL,
  PRIMARY KEY (`manager_id`),
  KEY `emp_id_fk1` (`employee_id`),
  CONSTRAINT `emp_id_fk1` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`employee_id`),
  KEY `dept_id_fk2` (`department_id`),
  CONSTRAINT `dept_id_fk2` FOREIGN KEY (`department_id`) REFERENCES `departments` (`department_id`)
) ENGINE=INNODB AUTO_INCREMENT=50 DEFAULT CHARSET=gb2312;

INSERT INTO managers(`employee_id`) VALUES("001000");
#创建薪资表
DROP TABLE IF EXISTS `salary`;
CREATE TABLE `salary` (
  `employee_id` INT(8) UNSIGNED ZEROFILL,
  `basepay` DECIMAL(10,4) NOT NULL,
  `bonus` DECIMAL(10,4) DEFAULT NULL,
  `fine` DECIMAL(10,4) DEFAULT NULL,
  `s_date` DATETIME DEFAULT NOW(),
  `absenteeism` TINYINT UNSIGNED DEFAULT 0,
  PRIMARY KEY (`employee_id`),
  KEY `emp_id_fk2` (`employee_id`),
  CONSTRAINT `emp_id_fk2` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`employee_id`)
) ENGINE=INNODB DEFAULT CHARSET=gb2312;


#创建项目表


#创建员工参与表