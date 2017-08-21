#选择数据库
USE gjp;

#查看表结构
DESCRIBE customers;

#查看表中的所有记录
SELECT * FROM customers;

#插入记录到表中
INSERT INTO customers
(cust_name,cust_contact,cust_email,cust_address,cust_city,cust_state,cust_zip,cust_country)
VALUES
('Pep E.LaPew',NULL,NULL,'100 Main Street','Los Angeles','CA','90046','USA');

#插入多条记录到表中
INSERT INTO customers
(cust_name,cust_address,cust_city,cust_state,cust_zip,cust_country)
VALUES
('Pep E.LaPew','100 Main Street','Los Angeles','CA','90046','USA'),
('M. Martian','42 Galaxy Way','New York','NY','11213','USA');

#使用LOW_PRIORITY低优先级insert into并将另外一个表的所有记录插入到表中
INSERT LOW_PRIORITY INTO customers
(cust_name,cust_address,cust_city,cust_state,cust_zip,cust_country)
SELECT cust_name,cust_address,cust_city,cust_state,cust_zip,cust_country
FROM custnew;

#使用LOW_PRIORITY低优先级insert into并将另外一个表的符合条件的记录插入到表中
INSERT LOW_PRIORITY INTO customers
(cust_name,cust_address,cust_city,cust_state,cust_zip,cust_country)
SELECT cust_name,cust_address,cust_city,cust_state,cust_zip,cust_country
FROM custnew
WHERE cust_id = 100;