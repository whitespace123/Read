#选择gjp数据库
USE gjp;

#筛选原字段和函数处理后的字段(值变为大写)别名为账户和账户大写，倒序显示第11条到15条记录
SELECT zwid ,zwname AS '账户',UPPER(zwname) AS '账户大写' 
FROM gjp_zhangwu ORDER BY zwmoney DESC LIMIT 10,5;

#筛选函数处理后(同音字识别)的记录
SELECT * FROM gjp_zhangwu WHERE SOUNDEX(zwzhanghu) = SOUNDEX('Lee');

#筛选函数处理后(识别日期不识别时间)的数据，正序显示记录
SELECT * FROM gjp_zhangwu 
WHERE DATE(zwcreatetime) = '2016-10-28' ORDER BY zwmoney ASC;

#筛选出表中日期在某一段时间，按照金额的大小倒序显示前5条记录
SELECT CONCAT(zwname,'(',zwdesc,')') AS '来源/描述',
zwmoney AS '金额',
zwzhanghu AS '账户',
zwcreatetime AS '日期' 
FROM gjp_zhangwu WHERE DATE(zwcreatetime) BETWEEN '2016-01-01' AND '2017-10-01' 
ORDER BY 金额 DESC LIMIT 5;

#筛选利用函数处理后的数据(日期年月份处理),显示记录
SELECT * FROM gjp_zhangwu 
WHERE YEAR(zwcreatetime) = '2016' AND MONTH(zwcreatetime) = 10;