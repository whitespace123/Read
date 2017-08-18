--选择数据库
USE gjp;
--筛选出prod_price小于等于5或者vend_id为1001或1002的记录(去重)
SELECT vend_id,prod_id,prod_price FROM products WHERE prod_price <=5 OR vend_id IN (1001,1002) ORDER BY vend_id DESC LIMIT 0,5;
--使用组合查询显示以上sql语句一致的效果(去重)
SELECT vend_id,prod_id,prod_price FROM products WHERE prod_price <=5 UNION SELECT vend_id,prod_id,prod_price FROM products WHERE vend_id IN (1001,1002) ORDER BY vend_id DESC LIMIT 0,5;
--与以上效果相似(不去重)
SELECT vend_id,prod_id,prod_price FROM products WHERE prod_price <=5 UNION ALL SELECT vend_id,prod_id,prod_price FROM products WHERE vend_id IN (1001,1002) ORDER BY vend_id DESC;
