--选择gjp数据库
USE gjp;
--展示gjp_zhangwu数据表中的字段的信息
SHOW COLUMNS FROM gjp_zhangwu;
--使用正则表达式来筛选zwmoney的数据，用升序显示前5条记录
SELECT * FROM gjp_zhangwu WHERE zwmoney REGEXP '.000' ORDER BY zwmoney ASC LIMIT 5;
--使用正则表达式来筛选匹配1000或者2000的值，用降序显示前5条记录
SELECT * FROM gjp_zhangwu WHERE zwmoney REGEXP '1000|2000' ORDER BY zwmoney DESC LIMIT 5;
--使用正则表达式来筛选匹配含有股票收入或者工资收入或者礼金收入的数据，用降序显示前5条记录
SELECT * FROM gjp_zhangwu WHERE zwname REGEXP '[股票工资礼金]收入' ORDER BY zwmoney DESC LIMIT 5;
--与上同理
SELECT * FROM gjp_zhangwu WHERE zwname REGEXP '股票|工资|礼金 收入'ORDER BY zwmoney DESC LIMIT 5;
--使用正则表达式来筛选匹配不含有工资收入和礼金收入的数据，用降序显示前5条记录
SELECT * FROM gjp_zhangwu WHERE zwname REGEXP '[^工资礼金]收入'ORDER BY zwmoney DESC LIMIT 5;
--使用正则表达式来筛选匹配含有5-9之间的数据,用降序显示前5条记录
SELECT * FROM gjp_zhangwu WHERE zwid REGEXP '[5-9]' ORDER BY zwmoney DESC LIMIT 5;
--可以直接测试正则表达式
SELECT 'hello' REGEXP '[0-9]';