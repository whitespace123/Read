#选择数据库
USE gjp;

#通过concat函数拼接值显示升序显示前5条记录
SELECT CONCAT(zwname,' [',zwmoney,']') FROM gjp_zhangwu ORDER BY zwmoney ASC LIMIT 5;

#通过concat函数拼接值，并用trim函数去除左右空格降序显示前5条记录
SELECT CONCAT(TRIM(zwname),' (',TRIM(zwmoney),')') FROM gjp_zhangwu 
ORDER BY zwmoney DESC LIMIT 5;

#通过concat函数拼接字段值，并用trim函数去除空格将合并的字段别名为账务/数额，
#筛选后降序显示前5条记录
SELECT CONCAT(TRIM(zwname),' (',TRIM(zwmoney),')')AS '账务/数额' FROM gjp_zhangwu 
ORDER BY zwmoney DESC LIMIT 5;

#通过concat函数拼接字段值，并将zwmoney字段的值加10，用作别名花费，
#筛选其中zwmoney为247的记录
SELECT CONCAT(zwname,zwmoney+10,'元')AS '花费' FROM gjp_zhangwu WHERE zwmoney =247;

#通过别名机制筛选zwmoney大于1000的且按别名花费升序显示前5条记录
SELECT zwname AS '名称',zwmoney AS '花费' FROM gjp_zhangwu 
WHERE zwmoney > 1000 ORDER BY 花费 ASC LIMIT 5;

#测试运算符
SELECT 3 *2 AS '乘积';