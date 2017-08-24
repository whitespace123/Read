#选择数据库
USE gjp;

#更改sql语句的分隔符
DELIMITER //
#创建存储过程
CREATE PROCEDURE processorders()
BEGIN
#创建游标
DECLARE ordernumbers CURSOR
FOR 
SELECT order_num FROM orders;
END//
#更改sql语句的分隔符
DELIMITER ;

#更改sql语句的分隔符
DELIMITER //
#创建存储过程
CREATE PROCEDURE processorders()
BEGIN
#创建游标
DECLARE ordernumbers CURSOR
FOR 
SELECT order_num FROM orders;
#打开游标
OPEN ordernumbers;
#关闭游标
CLOSE ordernumbers;
END//
DELIMITER ;

#更改sql语句的分隔符
DELIMITER //
#创建存储过程
CREATE PROCEDURE processorders()
BEGIN
#声明变量o和定义游标ordernumbers
DECLARE o INT;
DECLARE ordernumbers CURSOR
FOR 
SELECT order_num FROM orders;
OPEN ordernumbers;
#让游标向下移动，并将结果赋值给变量o
FETCH ordernumbers INTO o;
#关闭游标
CLOSE ordernumbers;
END//
#切换sql语句的分隔符
DELIMITER ;

#切换sql语句的分隔符
DELIMITER //
#创建存储过程
CREATE PROCEDURE processorders()
BEGIN
#声明变量o，定义变量done
DECLARE o INT;
DECLARE done BOOLEAN DEFAULT 0;
#定义游标
DECLARE ordernumbers CURSOR
FOR 
SELECT order_num FROM orders;
#声明控制条件，必须在游标之后
DECLARE CONTINUE HANDLER FOR SQLSTATE '02000' SET done=1;
#打开游标
OPEN ordernumbers;
#循环
REPEAT
#游标每次向后移动
FETCH ordernumbers INTO o;
#结束循环
UNTIL done END REPEAT;
#关闭游标
CLOSE ordernumbers;
END//
#切换sql语句的分隔符
DELIMITER ;

#切换sql语句分隔符
DELIMITER //
#创建无参无返回值存储过程
CREATE PROCEDURE processorders()
BEGIN
#定义变量done，并声明变量o和t
DECLARE done BOOLEAN DEFAULT 0;
DECLARE o INT;
DECLARE t DECIMAL(8,2);
#定义游标
DECLARE ordernumbers CURSOR
FOR
SELECT order_num FROM orders;
#声明控制条件
DECLARE CONTINUE HANDLER FOR SQLSTATE '02000' SET done = 1;
#创建表格
CREATE TABLE IF NOT EXISTS ordertotals(
order_num INT ,
total DECIMAL(8,2)
);
#打开游标
OPEN ordernumbers;
#循环
REPEAT
#游标向后移动
FETCH ordernumbers INTO o;
#调用ordertotal存储过程，并传入参数o和1，并用t接收返回值
CALL ordertotal(o,1,t);
#循环向ordertotals表格插入数据
INSERT INTO ordertotals(order_num,total)VALUES(o,t);
#结束循环
UNTIL done END REPEAT;
#关闭游标
CLOSE ordernumbers;
END//
DELIMITER ;
