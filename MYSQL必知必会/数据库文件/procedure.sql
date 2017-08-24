#选择数据库
USE gjp;

#更改语句分隔符为//
DELIMITER //
#创建无参数存储过程
CREATE PROCEDURE productpricing()
BEGIN
SELECT AVG(prod_price) AS priceaverage
FROM products;
END//
#更改回语句分隔符为;
DELIMITER ;

#调用存储过程
CALL productpricing();

#删除存储过程
DROP PROCEDURE IF EXISTS productpricing;

#创建带返回值的存储过程
DELIMITER //
CREATE PROCEDURE productpricing(
OUT pl DECIMAL(8,2),
OUT ph DECIMAL(8,2),
OUT pa DECIMAL(8,2)
)
BEGIN
SELECT MIN(prod_price)
FROM products
INTO pl;
SELECT MAX(prod_price)
FROM products
INTO ph;
SELECT AVG(prod_price)
FROM products
INTO pa;
END//
DELIMITER ;

#调用存储过程传入变量，并使用变量接收返回值，不会显示记录
CALL productpricing(@pricelow,@pricehigh,@priceaverage);

#调用变量显示记录
SELECT @pricelow AS '最小值',@pricehigh AS '最大值',@priceaverage AS '平均值';

#创建带参数和返回值的存储过程
DELIMITER //
CREATE PROCEDURE ordertotal(
IN onumber INT,
OUT ototal DECIMAL(8,2)
)
BEGIN
SELECT SUM(item_price*quantity)
FROM orderitems
WHERE order_num = onumber
INTO ototal;
END//
DELIMITER ;

#调用存储过程传入常量和变量，变量接收返回值
CALL ordertotal(20005,@total);

#调用变量显示记录
SELECT @total;

#如果需要查询其他条件的，需要再次调用存储过程
CALL ordertotal(20009,@total);

#调用变量显示记录
SELECT @total;


DELIMITER //
#创建智能存储过程
CREATE PROCEDURE ordertotal(
#创建两个形参onumber、taxable，一个返回值ototal
IN onumber INT,
IN taxable BOOLEAN,
OUT ototal DECIMAL(8,2)
)COMMENT 'Obtain order total,optionally adding tax'
BEGIN
#创建两个局部变量
DECLARE total DECIMAL(8,2);
DECLARE taxrate INT DEFAULT 6;
#将select的值存入到局部变量中
SELECT SUM(item_price*quantity)
FROM orderitems
WHERE order_num = onumber
INTO total;
#如果taxable为真，则将计算后的值存入到局部变量中
IF taxable THEN
SELECT total+(total/100*taxrate) INTO total;
#最后将局部变量的值存入到返回值中
END IF;
SELECT total INTO ototal;
END//
DELIMITER ;

#调用存储过程并添加实参20005和0赋值，变量total接收返回值
CALL ordertotal(20005,0,@total);

#调用变量显示记录
SELECT @total;

#显示智能存储过程的语句
SHOW CREATE PROCEDURE ordertotal;

#显示智能存储过程的信息
SHOW PROCEDURE STATUS LIKE 'ordertotal';