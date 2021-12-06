
#先创建表，在创建数据

#①创建部门表
INSERT INTO departments(`department_name`) VALUES ("董事会"),("产品部"),("开发部"),("市场部"),("财务部"),("策划部"),("公关部"),("销售部"),("运维部"),("后勤部"),("人事部");

#②创建员工表
INSERT INTO employees(`employee_name`,`sex`,`ID_number`,`department_id`) VALUES ("李狗蛋",	'm',	"360531200006052937",'0001');
INSERT INTO employees(`employee_name`,`sex`,`ID_number`,`department_id`) VALUES ("王老虎",	'm',	"360531198802247875",'0005');
INSERT INTO employees(`employee_name`,`sex`,`ID_number`,`department_id`) VALUES ("小猪佩奇",	'w',	"360531200111157739",'0004');
INSERT INTO employees(`employee_name`,`sex`,`ID_number`,`department_id`) VALUES ("嘴强王者",	'w',	"360431202010221543",'0008');
INSERT INTO employees(`employee_name`,`sex`,`ID_number`,`department_id`) VALUES ("李易峰",	'm',	"340591200306152931",'0010');
INSERT INTO employees(`employee_name`,`sex`,`ID_number`,`department_id`) VALUES ("lisar",	'w',	"36053151001158989X",'0005');
INSERT INTO employees(`employee_name`,`sex`,`ID_number`,`department_id`) VALUES ("tomcat",	'm',	"360531207406152939",'0007');
INSERT INTO employees(`employee_name`,`sex`,`ID_number`,`department_id`) VALUES ("www",		'w',	"367231210006192939",'0003');
INSERT INTO employees(`employee_name`,`sex`,`ID_number`,`department_id`) VALUES ("nginx",	'm',	"367231210016197939",'0002');
INSERT INTO employees(`employee_name`,`sex`,`ID_number`,`department_id`) VALUES ("linux",	'm',	"366731210406192782",'0011');
INSERT INTO employees(`employee_name`,`sex`,`ID_number`,`department_id`) VALUES ("www",		'w',	"367231210006192939",'0002');
INSERT INTO employees(`employee_name`,`sex`,`ID_number`,`department_id`) VALUES ("利达",	'w',	"367231200106172939",'0006');
INSERT INTO employees(`employee_name`,`sex`,`ID_number`,`department_id`) VALUES ("迪迦",	'm',	"36723119991117727X",'0009');
INSERT INTO employees(`employee_name`,`sex`,`ID_number`) VALUES ("贝利亚",	'm',	"367231200802177933");

#③主管表
INSERT INTO managers(`employee_id`,`department_id`) VALUES("001008","0002");
INSERT INTO managers(`employee_id`,`department_id`) VALUES("001007","0003");
INSERT INTO managers(`employee_id`,`department_id`) VALUES("001002","0004");
INSERT INTO managers(`employee_id`,`department_id`) VALUES("001001","0005");
INSERT INTO managers(`employee_id`,`department_id`) VALUES("001011","0006");
INSERT INTO managers(`employee_id`,`department_id`) VALUES("001006","0007");
INSERT INTO managers(`employee_id`,`department_id`) VALUES("001003","0008");
INSERT INTO managers(`employee_id`,`department_id`) VALUES("001012","0009");
INSERT INTO managers(`employee_id`,`department_id`) VALUES("001004","0010");
INSERT INTO managers(`employee_id`,`department_id`) VALUES("001009","0011");

#④创建薪资表
INSERT INTO salary(`employee_id`,`basepay`) VALUES ("001000",20000);
INSERT INTO salary(`employee_id`,`basepay`,`bonus`,`fine`,`absenteeism`) VALUES ("001001",5000,2500,100,1);
INSERT INTO salary(`employee_id`,`basepay`,`bonus`,`fine`,`absenteeism`) VALUES ("001002",5000,2500,0,0);
INSERT INTO salary(`employee_id`,`basepay`,`bonus`,`fine`,`absenteeism`) VALUES ("001003",2000,14500,2000,2);
INSERT INTO salary(`employee_id`,`basepay`,`bonus`,`fine`,`absenteeism`) VALUES ("001004",4000,1000,0,1);
INSERT INTO salary(`employee_id`,`basepay`,`bonus`,`fine`,`absenteeism`) VALUES ("001005",4000,2500,200,0);
INSERT INTO salary(`employee_id`,`basepay`,`bonus`,`fine`,`absenteeism`) VALUES ("001006",4500,2500,0,1);
INSERT INTO salary(`employee_id`,`basepay`,`bonus`,`fine`,`absenteeism`) VALUES ("001007",5200,5500,0,8);
INSERT INTO salary(`employee_id`,`basepay`,`bonus`,`fine`,`absenteeism`) VALUES ("001008",4000,200,100,0);
INSERT INTO salary(`employee_id`,`basepay`,`bonus`,`fine`,`absenteeism`) VALUES ("001009",2500,1500,0,0);
INSERT INTO salary(`employee_id`,`basepay`,`bonus`,`fine`,`absenteeism`) VALUES ("001010",5000,1500,150,1);
INSERT INTO salary(`employee_id`,`basepay`,`bonus`,`fine`,`absenteeism`) VALUES ("001011",5000,1500,0,0);
INSERT INTO salary(`employee_id`,`basepay`,`bonus`,`fine`,`absenteeism`) VALUES ("001012",4500,1500,0,1);
INSERT INTO salary(`employee_id`,`basepay`,`bonus`,`fine`,`absenteeism`) VALUES ("001013",3500,1500,120,3);

#⑤创建项目表
INSERT INTO projects(`project_id`,`principal_id`) VALUES ('G-SNS1352D','001000');
INSERT INTO projects(`project_id`,`principal_id`) VALUES ('G-SNS1287B','001001');
INSERT INTO projects(`project_id`,`project_name`,`principal_id`) VALUES ('G-SNS1382E',"腾讯——黎明计划1",'001007');
INSERT INTO projects(`project_id`,`project_name`,`principal_id`) VALUES ('G-SNS1372E',"腾讯——黎明计划2",'001007');
INSERT INTO projects(`project_id`,`project_name`,`principal_id`) VALUES ('G-SNS1312E',"腾讯——黎明计划3",'001007');
INSERT INTO projects(`project_id`,`project_name`,`principal_id`) VALUES ('G-SNS1462E',"腾讯——黎明计划4",'001002');
INSERT INTO projects(`project_id`,`project_name`,`principal_id`) VALUES ('G-SNS1282E',"腾讯——黎明计划5",'001007');
INSERT INTO projects(`project_id`,`project_name`,`principal_id`) VALUES ('G-SNS7382E',"腾讯——黎明计划6",'001007');
INSERT INTO projects(`project_id`,`project_name`,`principal_id`) VALUES ('G-SNS1395E',"腾讯——黎明计划7",'001007');
INSERT INTO projects(`project_id`,`project_name`,`principal_id`) VALUES ('G-SNS1751E',"腾讯——黎明计划8",'001007');
INSERT INTO projects(`project_id`,`project_name`,`principal_id`) VALUES ('G-SNS8423E',"腾讯——黎明计划9",'001002');
INSERT INTO projects(`project_id`,`project_name`,`principal_id`) VALUES ('G-SNS7842E',"腾讯——黎明计划A",'001007');
INSERT INTO projects(`project_id`,`project_name`,`principal_id`) VALUES ('G-SNS7846E',"腾讯——黎明计划B",'001002');
INSERT INTO projects(`project_id`,`project_name`,`principal_id`) VALUES ('G-SNS1241E',"腾讯——黎明计划C",'001007');
INSERT INTO projects(`project_id`,`project_name`,`principal_id`) VALUES ('G-SNS1785E',"腾讯——黎明计划D",'001002');
INSERT INTO projects(`project_id`,`project_name`,`principal_id`) VALUES ('G-SNS4551E',"腾讯——黎明计划E",'001002');
INSERT INTO projects(`project_id`,`project_name`,`principal_id`) VALUES ('G-SNS3225E',"腾讯——黎明计划F",'001004');
INSERT INTO projects(`project_id`,`project_name`,`principal_id`) VALUES ('G-SNS7844E',"腾讯——黎明计划G",'001001');
INSERT INTO projects(`project_id`,`project_name`,`principal_id`) VALUES ('G-SNS1542E',"腾讯——黎明计划H",'001002');
INSERT INTO projects(`project_id`,`project_name`,`principal_id`) VALUES ('G-SNS7775E',"腾讯——黎明计划I",'001000');
INSERT INTO projects(`project_id`,`project_name`,`principal_id`) VALUES ('G-SNS3299E',"腾讯——黎明计划J",'001007');
INSERT INTO projects(`project_id`,`project_name`,`principal_id`) VALUES ('G-SNS5642E',"腾讯——黎明计划K",'001002');

#⑥创建员工参与表
INSERT INTO participation(`project_id`,`employee_id`) VALUES ('G-SNS1352D','001000');
INSERT INTO participation(`project_id`,`employee_id`) VALUES ('G-SNS1287B','001001');
INSERT INTO participation(`project_id`,`employee_id`) VALUES ('G-SNS1382E','001002');
INSERT INTO participation(`project_id`,`employee_id`) VALUES ('G-SNS1352D','001003');
INSERT INTO participation(`project_id`,`employee_id`) VALUES ('G-SNS1287B','001004');
INSERT INTO participation(`project_id`,`employee_id`) VALUES ('G-SNS1382E','001004');


