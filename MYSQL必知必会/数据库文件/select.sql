#选择数据库
USE gjp;

#筛选出符合表的记录
SELECT * FROM gjp_zhangwu;

#使用特定字段筛选符合表的记录
SELECT zwid,zwname,zwmoney FROM gjp_zhangwu;

#使用特定字段筛选去重的记录
SELECT DISTINCT zwname FROM gjp_zhangwu;

#筛选表中的前5条记录(0,5]
SELECT * FROM gjp_zhangwu LIMIT 5;

#筛选表中从第6条记录开始的后5条记录(5,10]
SELECT * FROM gjp_zhangwu LIMIT 5,5;

#筛选表中第1条记录，此处遵循0开始原则(包尾不包头)(0,1]
SELECT * FROM gjp_zhangwu LIMIT 0,1;

#使用完全限定的字段和表来筛选记录
SELECT gjp_zhangwu.zwname FROM gjp.gjp_zhangwu;