--选择数据库
USE gjp;
--使用表别名形式联结多个表筛选出数据
SELECT cust_name,cust_contact FROM customers AS c,orders AS o,orderitems AS oi WHERE c.cust_id = o.cust_id AND o.order_num = oi.order_num AND oi.prod_id = 'TNT2';
--使用子查询方式筛选数据
SELECT prod_id,prod_name FROM products WHERE vend_id IN(SELECT vend_id FROM products WHERE prod_id = 'DTNTR');
--结果同上，使用表别名给一个表创建两个副本，这种方式叫做自联结（推荐使用）
SELECT p1.prod_id,p1.prod_name FROM products AS p1,products AS p2 WHERE p1.vend_id = p2.vend_id AND p2.prod_id = 'DTNTR';
--使用表别名筛选出匹配的记录，所有列在联结的表中只出现一次叫做自然联结
SELECT c.*,o.order_num,o.order_date,oi.prod_id,oi.quantity,oi.item_price FROM customers AS c,orders AS o,orderitems AS oi WHERE c.cust_id= o.cust_id;
--使用内联结筛选出匹配的记录(所有值匹配)
SELECT customers.cust_id,orders.order_num FROM customers INNER JOIN orders ON customers.cust_id = orders.cust_id;
--使用左外联结按照左边customers的表的cust_id的所有记录匹配右表的值，如果没有值的记录显示为null
SELECT customers.cust_id,orders.order_num FROM customers LEFT OUTER JOIN orders ON customers.cust_id = orders.cust_id;
--使用右外联结按照右边orders的表的order_num的所有记录匹配左表的值，如果没有值的记录显示为null
SELECT customers.cust_id,orders.order_num FROM customers RIGHT OUTER JOIN orders ON customers.cust_id = orders.cust_id;
--使用聚合函数和左外联结配合，内外键关联，按照左表字段分组显示，没有值的显示0(聚合函数值为数值不为null)
SELECT c.cust_name AS 客户名,c.cust_id AS 客户ID,COUNT(o.order_num) AS 客户订单 FROM customers AS c LEFT OUTER JOIN orders AS o ON c.cust_id = o.cust_id GROUP BY 客户名 ORDER BY 客户订单 DESC;
