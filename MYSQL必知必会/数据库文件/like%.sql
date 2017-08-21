#选择数据库
USE gjp;

#筛选zwzhanghu不包含银行字段且网银字段的记录，将序显示前5行
SELECT * FROM gjp_zhangwu 
WHERE NOT (zwzhanghu LIKE '%银行%' OR zwzhanghu = '网银') 
ORDER BY zwmoney DESC LIMIT 5;

#筛选zwzhanghu包含xx银行的记录，升序显示前5行
SELECT * FROM gjp_zhangwu 
WHERE zwzhanghu LIKE '__银行' 
ORDER BY zwmoney ASC LIMIT 5;