--选择数据库
USE gjp;
--查看数据库表结构
DESCRIBE gjp_zhangwu;
--筛选所有数据
SELECT * FROM gjp_zhangwu;
--筛选别名为账户和日期的每条交易次数，使用group by子句分组账户和日期并按照次数倒序显示记录
SELECT zwcreatetime AS '日期', zwzhanghu AS '账户',COUNT(zwmoney) AS '次数' FROM gjp_zhangwu GROUP BY 账户,日期 ORDER BY 次数 DESC;
--筛选别名为账户和日期的每条交易次数，使用group by子句分组账户和日期并按照次数倒序显示次数大于1的记录
SELECT zwcreatetime AS '日期',zwzhanghu AS '账户',COUNT(zwmoney) AS '次数' FROM gjp_zhangwu GROUP BY 账户,日期 HAVING 次数 > 1  ORDER BY 次数 DESC;
--筛选别名为账户和日期的每条交易次数，使用group by子句分组账户和日期并按照次数倒序显示次数大于等于1且日期不为2016-10-28的记录
SELECT zwcreatetime AS '日期',zwzhanghu AS '账户',COUNT(zwmoney) AS '次数' FROM gjp_zhangwu WHERE zwcreatetime <> '2016-10-28' GROUP BY 账户,日期 HAVING 次数 >= 1 ORDER BY 次数 DESC; 
