#选择数据库
USE gjp;

#查询该表中的所有记录
SELECT * FROM productnotes;

#使用全文本搜索查询出note_text字段含有rabbit的记录
SELECT note_text FROM productnotes WHERE MATCH(note_text) AGAINST ('rabbit');

#使用模糊查询出note_text字段含有rabbit的记录
SELECT note_text FROM productnotes WHERE note_text LIKE '%rabbit%';

#将全文本搜索作为计算字段显示每条记录匹配该计算字段的权值
SELECT note_text,MATCH(note_text) AGAINST('rabbit') AS rank FROM productnotes;

#使用扩展查询查询出匹配和可能相关的记录
SELECT note_text FROM productnotes 
WHERE MATCH(note_text) AGAINST('anvils' WITH QUERY EXPANSION);

#使用布尔文本搜索，不过目前返回结果和有没有in BOOLEAN mode没有关系
SELECT note_text FROM productnotes 
WHERE MATCH(note_text) AGAINST('heavy' IN BOOLEAN MODE);

#使用布尔文本搜索，含有heavy不包含含有rope开头的记录
SELECT note_text FROM productnotes 
WHERE MATCH(note_text) AGAINST('heavy -rope*' IN BOOLEAN MODE);

#使用布尔文本搜索出包含rabbit或bait的记录(||，符合其一既满足)
SELECT note_text FROM productnotes 
WHERE MATCH(note_text) AGAINST('rabbit bait' IN BOOLEAN MODE);

#使用布尔文本搜索出含有rabbit和bait的记录(&&，都符合既满足)
SELECT note_text FROM productnotes 
WHERE MATCH(note_text) AGAINST('+rabbit +bait' IN BOOLEAN MODE);

#使用布尔文本搜索出含有rabbit和bait的记录，并增加rabbit的权重，减少bait的权重
SELECT note_text FROM productnotes 
WHERE MATCH(note_text) AGAINST('>rabbit <bait' IN BOOLEAN MODE);

#使用布尔文本搜索出含有safe和combination的记录，并减少combination的权重
SELECT note_text FROM productnotes 
WHERE MATCH(note_text) AGAINST('+safe +(<combination)' IN BOOLEAN MODE);