#1.	下面的语句是否可以执行成功  
SELECT last_name , job_id , salary AS sal
FROM employees; 

#2.下面的语句是否可以执行成功  
SELECT  *  FROM employees; 


#3.找出下面语句中的错误 
SELECT employee_id , last_name,
salary * 12 AS "ANNUAL  SALARY"
FROM employees;



#4.显示表departments的结构，并查询其中的全部数据

DESC departments;
SELECT * FROM `departments`;

#5.显示出表employees中的全部job_id（不能重复）
SELECT DISTINCT job_id FROM employees;

#6.显示出表employees的全部列，各个列之间用逗号连接，列头显示成OUT_PUT

SELECT 
	IFNULL(commission_pct,0) AS 奖金率,
	commission_pct
FROM 
	employees;
	
	
#-------------------------------------------

/*
	concat（） 函数的拼接字符串中不能有null ，所以需要判断字符段中是否有null，使用
	ifnull（）函数判断是否存在null，如果有null，可以设置一个默认值
*/

SELECT
	CONCAT(`first_name`,',',`last_name`,',',`job_id`,',',IFNULL(commission_pct,0)) AS out_put
FROM
	employees;
	
	
	








