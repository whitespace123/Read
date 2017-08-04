--选择gjp数据库
USE gjp;
--筛选满足条件zwzhanghu为现金且zwmoney小于1900的记录，用倒序方式显示前5条
SELECT * FROM gjp_zhangwu WHERE zwzhanghu ='现金' AND zwmoney<1900 ORDER BY zwmoney DESC LIMIT 5;
--筛选满足条件zwzhanghu为现金或者zwmoney小于1900的记录，用倒序方式显示前5条
SELECT * FROM gjp_zhangwu WHERE zwzhanghu ='现金' OR zwmoney<1900 ORDER BY zwmoney DESC LIMIT 5;
--筛选满足条件zwmoney大于10000或者小于1000且zwzhanghu为现金的记录，用升序方式显示前5条
SELECT * FROM gjp_zhangwu WHERE (zwmoney > 10000 OR zwmoney <1000) AND zwzhanghu='现金' ORDER BY zwmoney LIMIT 5;
--筛选满足条件zwzhanghu为工商银行或者现金的记录，用升序方式显示前5条
SELECT * FROM gjp_zhangwu WHERE zwzhanghu IN ('工商银行','现金') ORDER BY zwmoney ASC LIMIT 5;
--筛选zwzhanghu不为工商银行或者现金的记录，用倒序方式显示前5条
SELECT * FROM gjp_zhangwu WHERE zwzhanghu NOT IN ('工商银行','现金') ORDER BY zwmoney DESC LIMIT 5;
--筛选zwmoney不在1000和10000范围内的记录，用倒序的方式显示前5条
SELECT * FROM gjp_zhangwu WHERE zwmoney NOT BETWEEN 1000 AND 10000 ORDER BY zwmoney DESC LIMIT 5;