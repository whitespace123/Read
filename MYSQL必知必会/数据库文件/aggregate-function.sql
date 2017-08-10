--选择数据库
USE gjp;
--使用聚合函数计算zwmoney列的平均值
SELECT AVG(zwmoney) AS '金额平均值' FROM gjp_zhangwu;
--使用聚合函数计算zwmoney列符合特定条件的平均值
SELECT AVG(zwmoney) AS '金额平均值' FROM gjp_zhangwu WHERE zwzhanghu = '现金';
--使用聚合函数计算所有记录的数目
SELECT COUNT(*) AS '记录总数' FROM gjp_zhangwu;
--使用聚合函数对特定列计算所有记录且不为空的数目
SELECT COUNT(zwmoney) AS '记录总数' FROM gjp_zhangwu;
--使用聚合函数对特定列计算其中最大的值
SELECT MAX(zwmoney) AS '最大金额' FROM gjp_zhangwu;
SELECT MAX(zwcreatetime) AS '最后日期' FROM gjp_zhangwu;
--使用聚合函数对特定列计算其中最小的值
SELECT MIN(zwmoney) AS '最小金额' FROM gjp_zhangwu;
SELECT MIN(zwcreatetime) AS '最早日期' FROM gjp_zhangwu;
--使用聚合函数对特定列计算其中的所有不为空的记录的值的总和
SELECT SUM(zwmoney*10) AS '总和' FROM gjp_zhangwu;
--使用聚合函数对特定列计算其中所有不为空且不重复的值的总和
SELECT SUM(DISTINCT zwmoney*10) AS '去重总和' FROM gjp_zhangwu;
--使用聚合函数汇总数据
SELECT COUNT(zwmoney) AS '记录总数',AVG(zwmoney) AS '金额平均值' ,MAX(zwmoney) AS '最大金额', MIN(zwmoney) AS '最小金额' ,SUM(zwmoney) AS '总和',COUNT(DISTINCT zwmoney) AS "去重记录" FROM gjp_zhangwu;