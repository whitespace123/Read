--选择数据库
USE gjp;
--显示所有表
SHOW TABLES;
--使用等值联结(内部联结)的方式筛选两个表中主键和外键一致的数据，升序显示前5条记录
SELECT vend_name,prod_name,prod_price FROM vendors,products WHERE vendors.vend_id = products.vend_id ORDER BY vend_name,prod_name LIMIT 0,5;
--使用内部联结的方式筛选两个表中主键和外键一致的数据，升序显示前5条记录(推荐写法)
SELECT vend_name,prod_name,prod_price FROM vendors INNER JOIN products ON vendors.vend_id = products.vend_id ORDER BY vend_name,prod_name LIMIT 0,5;
--使用内联结方式显示3个表中相关主外键一致的数据
SELECT prod_name,vend_name,prod_price,quantity FROM orderitems,products,vendors WHERE products.vend_id = vendors.vend_id AND orderitems.prod_id = products.prod_id AND order_num = 20005;
