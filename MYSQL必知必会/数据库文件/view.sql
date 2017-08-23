#选择数据库
USE gjp;

#创建视图
CREATE VIEW productcustomers AS 
SELECT cust_name,cust_contact,prod_id
FROM customers,orders,orderitems
WHERE customers.cust_id = orders.cust_id
AND orderitems.order_num = orders.order_num;

#筛选视图中的记录
SELECT cust_name,cust_contact
FROM productcustomers
WHERE prod_id = 'TNT2';

#使用计算字段创建视图
CREATE VIEW vendorlocations AS 
SELECT CONCAT(vend_name,'[',vend_country,']')
AS '名称[国家]'
FROM vendors
ORDER BY vend_name;

#删除视图
DROP VIEW vendorlocations;

#显示视图中的所有记录
SELECT * FROM vendorlocations;

#创建视图筛选掉null的记录
CREATE VIEW customeremaillist AS
SELECT cust_id,cust_name,cust_email
FROM customers
WHERE cust_email IS NOT NULL;

#显示视图中的所有记录
SELECT * FROM customeremaillist;

#使用计算字段创建视图
CREATE VIEW orderitemsexpanded AS
SELECT order_num,prod_id,quantity,item_price,
quantity*item_price AS expanded_price
FROM orderitems;