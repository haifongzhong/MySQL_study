#标识列
/*
又称为自增长列
含义：可以不用手动的插入值，系统提供默认的序列值


特点：
1、标识列必须和主键搭配吗？不一定，但要求是一个key
2、一个表可以有几个标识列？至多一个！
3、标识列的类型只能是数值型
4、标识列可以通过 SET auto_increment_increment=3;设置步长
可以通过 手动插入值，设置起始值


*/

#一、创建表时设置标识列


DROP TABLE IF EXISTS tab_identity;
CREATE TABLE tab_identity(
	userId INT(7) zerofill primary key auto_increment ,
	userName varchar(20) not null
);
TRUNCATE TABLE tab_identity;		
delete  from tab_identity;

INSERT INTO tab_identity(userId,userName) VALUES(null,'john');
INSERT INTO tab_identity(userName) VALUES('lucy');
SELECT * FROM tab_identity;

# 查询auto_increment的起始值以及步长值
SHOW VARIABLES LIKE '%auto_increment%';

# mysql中不支持设置起始变量，但支持偏移量（步长），一般不推荐修改
SET auto_increment_increment=3;

# 更改其实值的代替方式
INSERT INTO tab_identity(userId,userName) VALUES(10,'john');
INSERT INTO tab_identity(userId,userName) VALUES(NULL,'john');

#二、修改表时设置标识列

alter table tab_identity modify column userId int AUTO_INCREMENT;

#三、修改表时删除标识列

ALTER TABLE tab_identity MODIFY COLUMN userId INT ;



