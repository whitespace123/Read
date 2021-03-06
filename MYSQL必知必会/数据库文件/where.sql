#选择数据库
USE gjp;

#展示表格的字段和结构
SHOW COLUMNS FROM gjp_zhangwu;
DESCRIBE gjp_zhangwu;

#通过过滤条件显示记录
SELECT ZWID,ZWNAME,ZWMONEY FROM gjp_zhangwu WHERE ZWID =1;

#通过过滤条件降序显示前5条记录
SELECT ZWID,ZWNAME,ZWMONEY FROM gjp_zhangwu 
WHERE ZWID<10 ORDER BY ZWMONEY DESC LIMIT 5;

#通过过滤条件!=降序显示前5条记录
SELECT * FROM gjp_zhangwu WHERE ZWNAME <> '股票收入' 
ORDER BY ZWMONEY DESC LIMIT 0,5;

#通过过滤条件between降序显示前5条记录
SELECT * FROM gjp_zhangwu WHERE ZWCREATETIME BETWEEN '2016-06-15' AND '2017-01-01' 
ORDER BY ZWMONEY DESC LIMIT 5;

#通过过滤条件is NOT NULL 降序显示前5条记录
SELECT * FROM gjp_zhangwu WHERE ZWID IS NOT NULL ORDER BY ZWMONEY DESC LIMIT 5;