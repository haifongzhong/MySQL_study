

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
  `bonus` DECIMAL(10,4) DEFAULT 0,
  `fine` DECIMAL(10,4) DEFAULT 0,
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

#数据库功能实现

##参看本月发工资信息（视图）
DROP VIEW IF EXISTS over_salary;
CREATE VIEW over_salary 
AS

SELECT sequence_id '发薪单号',sa.employee_id '员工编号',em.employee_name '员工姓名', (basepay - (basepay / 21.75) * absenteeism + bonus - fine) '实发工资'
FROM salary sa
JOIN employees em ON sa.employee_id = em.employee_id 
WHERE s_date BETWEEN DATE_ADD(CURDATE(), INTERVAL - DAY(CURDATE()) + 1 DAY) AND LAST_DAY(CURDATE());

SELECT * FROM over_salary;

##将员工设置为某部门的主管（存储过程）
DELIMITER $
DROP PROCEDURE IF EXISTS myp1$
CREATE PROCEDURE myp1(IN employee VARCHAR(6),IN department VARCHAR(4))
BEGIN
#开启事务不自动提交
#查看是否有该员工
#查看管理员表中是否存在该员工
#	|-存在  ；修改管理部门编号，修改员工表的部门编号
#	|-不存在：增加主管表表项，修改员工表的部门编号
#提交事物，开启事务自动提交
  DECLARE if_exist1 INT(4) DEFAULT 0;
  DECLARE if_exist2 INT(4) DEFAULT 0;
  SET autocommit=0;	#取消自动提交
  START TRANSACTION;
  SELECT COUNT(*) INTO if_exist1 FROM employees WHERE `employee_id` = employee;
  SELECT COUNT(*) INTO if_exist2 FROM managers WHERE `employee_id` = employee;
  IF if_exist1 = 0 THEN SELECT '没有该员工！';
  ELSEIF if_exist2 = 0 THEN 
    UPDATE employees SET `department_id` = department WHERE `employee_id` = employee;
    INSERT INTO managers (`employee_id`,`department_id`) VALUES (employee,department); 
  ELSE 
    UPDATE employees SET `department_id` = department WHERE `employee_id` = employee;
    UPDATE managers SET `department_id` = department WHERE `department_id` = department;
  END IF;
  COMMIT;  
  SET autocommit=1;
END $
DELIMITER ;
CALL myp1('001014','0011');

##参看项目到期时间（函数）
DELIMITER $
DROP FUNCTION IF EXISTS myf1$
CREATE FUNCTION myf1(project VARCHAR(10)) RETURNS TIMESTAMP
#READ SQL DATA
BEGIN
	DECLARE over_time TIMESTAMP;
	DECLARE start_time TIMESTAMP;
	DECLARE ranges INT(4) DEFAULT 0;
	SELECT project_time, construction_time INTO start_time, ranges FROM projects pro WHERE pro.`project_id` = project ;
	SELECT DATE_ADD(start_time, INTERVAL ranges DAY) INTO over_time; 
	RETURN over_time;
	
END $
DELIMITER ;
SELECT myf1('G-SNS1241E')'项目计划完工日期';