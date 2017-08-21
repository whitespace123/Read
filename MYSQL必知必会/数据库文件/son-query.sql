#选择数据库
USE gjp;

#使用子查询的结果集，再用主查询作为条件查询出结果,以cust_id倒序显示前5条记录
SELECT * FROM orders WHERE order_num IN (SELECT order_num FROM orderitems 
WHERE prod_id = 'TNT2') ORDER BY cust_id DESC LIMIT 5;

#使用子查询返回一列作为计算字段，再查询表中的字段进行列拼接，
#最终按照次数段倒序显示前5条记录
SELECT cust_name AS '顾客',cust_state AS '州',(SELECT COUNT(*) FROM orders 
WHERE orders.cust_id = customers.cust_id) AS '次数' 
FROM customers ORDER BY 次数 DESC LIMIT 0,5;

