#选择数据库
USE gjp;

#筛选表中的数据并以某个字段排序显示
SELECT * FROM gjp_zhangwu ORDER BY zwmoney;

#筛选表中的数据，首先按照zwmoney排序，再此基础按照zwcreatetime的排序显示
SELECT * FROM gjp_zhangwu ORDER BY zwmoney,zwcreatetime;

#筛选表中的数据，首先按照zwmoney降序，再次基础按照zwcreatetime的排序显示
SELECT * FROM gjp_zhangwu ORDER BY zwmoney DESC,zwcreatetime;

#按照zwmoney降序，再次基础按照zwcreatetime的排序显示前5条记录
SELECT * FROM gjp_zhangwu ORDER BY zwmoney DESC,zwcreatetime LIMIT 5;