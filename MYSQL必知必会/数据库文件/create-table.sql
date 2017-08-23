#选择数据库
USE jdbcstudy;

#创建表
CREATE TABLE IF NOT EXISTS customers
(
cust_id INT AUTO_INCREMENT,
cust_name CHAR(50) NOT NULL,
cust_address CHAR(50),
cust_city CHAR(50),
cust_state CHAR(50),
cust_zip CHAR(50),
cust_country CHAR(50),
cust_contact CHAR(50),
cust_email CHAR(255) NULL,
PRIMARY KEY (cust_id)
)ENGINE = INNODB;

#删除表
DROP TABLE customers;

#更新表添加列
ALTER TABLE customers ADD id INT;

#更新表删除列
ALTER TABLE customers DROP COLUMN id;

#主外键关联
ALTER TABLE customers 
ADD CONSTRAINT fk_customers_users FOREIGN KEY(id)REFERENCES users(id);

#更改表名称
RENAME TABLE customers2 TO customers;

#更改表的字段名
ALTER TABLE jdbcstudy.customers CHANGE zip cust_zip CHAR(50);