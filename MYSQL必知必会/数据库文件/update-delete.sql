#选择数据库
USE gjp; 

#查询表中的所有记录
SELECT * FROM customers;

#更新cust_id为10005的记录
UPDATE customers 
SET cust_name='The Fudds',cust_email = 'elmer@fudd.com' 
WHERE cust_id = 10005;

#使用子查询的结果作为数据更新cust_id为10005的记录
UPDATE customers
SET cust_name = (SELECT cust_name FROM custnew WHERE cust_id =104)
WHERE cust_id = 10005;

#更新cust_id为10005的邮箱数据，将其置为null
UPDATE customers SET cust_email = NULL WHERE cust_id =10005;

#删除表中匹配的记录
DELETE FROM gjp_zhangwu WHERE zwname = '空记录';