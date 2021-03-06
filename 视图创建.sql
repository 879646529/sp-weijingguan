use wjg;

SELECT * FROM ymyfocus;
SELECT * FROM iuser;

# 设备信息视图
CREATE VIEW view_device AS
SELECT d.Ocode AS 'code', d.Lpicture AS 'alterPic',
p.Pid AS 'pid', p.Cname AS 'name', p.Ksname AS 'sname', p.Ypicture AS 'picture',
d. Uaccount AS 'account'
FROM ndevice AS d LEFT JOIN nplant AS p
ON d.Ipid = p.Pid;

SELECT * FROM view_device;

# 检测数据视图
CREATE VIEW view_record AS
SELECT r.Vdate AS 'date', r.Ntemperature AS 'temperature', r.Wmoisture AS 'moisture',
r.Eillumination AS 'illumination', r.Ofertility AS 'fertility', r.Haccount AS 'account'
FROM jrecord AS r;

SELECT * FROM view_record;

# 周历史记录视图
CREATE VIEW view_report_week AS
SELECT rd.Hdate AS 'date', rd.Bcount AS 'count', rd.Ctemperature AS 'temperature', rd.Imoisture AS 'moisture', 
rd.Pillumination AS 'illumination', rd.Mfertility AS 'fertility', rd.Kaccount AS 'account'
FROM nreportday AS rd ORDER BY rd.Hdate DESC;

SELECT * FROM view_report_week;

# 月历史记录视图
CREATE VIEW view_report_month AS
SELECT rm.Vdate AS 'start', rm.Ncount AS 'count', rm.Gtemperature AS 'temperature', rm.Hmoisture AS 'moisture', 
rm.Jillumination AS 'illumination', rm.Sfertility AS 'fertility', rm.Qaccount AS 'account'
FROM mreportmonth AS rm ORDER BY rm.Vdate DESC;

SELECT * FROM view_report_month;

# 植物种类视图
CREATE VIEW view_plant_kind AS
SELECT p.Pid AS 'id', p.Cname AS 'name'
FROM nplant AS p;

SELECT * FROM nplant;
# 今日植物挑选视图
CREATE VIEW view_plant_today_select AS
SELECT p.Pid AS 'id'
FROM nplant AS p LEFT JOIN btoday AS t
ON p.Pid = t.Dpid WHERE t.Dpid IS NULL;

SELECT * FROM view_plant_today_select;

# 今日植物视图
CREATE VIEW view_plant_today AS
SELECT p.Pid AS 'id', p.Cname AS 'name', p.Ksname AS 'sname', p.Ypicture AS 'picture',
p.Hcharacteristics AS 'characteristics', p.Rflang AS 'flang', t.Udate AS 'date'
FROM btoday AS t LEFT JOIN nplant AS p
ON t.Dpid = p.Pid;

SELECT * FROM view_plant_today;

# 热门搜索视图
CREATE VIEW view_plant_popular AS
SELECT p.Pid AS 'id', p.Cname AS 'name', p.Ypicture AS 'picture'
FROM jpopularsearch AS ps LEFT JOIN nplant AS p
ON ps.Epid = p.Pid ORDER BY ps.Ycount DESC LIMIT 0, 20;

SELECT * FROM view_plant_popular;

# 植物分类视图
CREATE VIEW view_plant_type AS
SELECT pt.Ptid AS 'id', pt.Jname AS 'name', pt.Tbrief AS 'brief'
FROM kplanttype AS pt;

SELECT * FROM view_plant_type;

# 话题视图
CREATE VIEW view_topic AS
SELECT t.Tid AS 'id', t.Ytitle AS 'title', t.Cbrief AS 'brief'
FROM ftopic AS t;

SELECT * FROM ftopic;

# 用户信息视图
SELECT * FROM iuser;

CREATE VIEW view_user AS
SELECT u.Hwxkey AS 'wxkey', u.Jaccount AS 'account', u.Uhead AS 'head', u.Onickname AS 'nickname',
u.Nfocus AS 'countFocus', u.Mfans AS 'countFans', u.Hcollect AS 'countCollect', u.Darticle AS 'countArticle',
u.Tdate AS 'date'
FROM iuser AS u;

SELECT * FROM view_user;

# 我的关注视图
DROP VIEW view_user_focus;
CREATE VIEW view_user_focus AS
SELECT u.Jaccount AS 'account', u.Uhead AS 'head', u.Onickname AS 'nickname',
mf.Yuser AS 'user'
FROM ymyfocus AS mf LEFT JOIN iuser AS u
ON mf.Gaccount = u.Jaccount;

SELECT * FROM view_user_focus;

# 我的粉丝视图
CREATE VIEW view_user_fans AS
SELECT u.Jaccount AS 'account', u.Uhead AS 'head', u.Onickname AS 'nickname',
mf.Gaccount AS 'user'
FROM ymyfocus AS mf LEFT JOIN iuser AS u
ON mf.Yuser = u.Jaccount;

SELECT * FROM view_user_fans;

# 我的收藏视图
CREATE VIEW view_user_collect AS
SELECT a.Aid AS 'id', a.Htitle As 'title',
c.Udate AS 'date', c.Wuser AS 'account'
FROM gmycollection AS c LEFT JOIN warticle AS a
ON c.Haid = a.Aid ORDER BY c.Udate DESC;

SELECT * FROM view_user_collect;

# 我的文章视图
CREATE VIEW view_user_article AS
SELECT a.Aid AS 'id', a.Htitle AS 'title', a.Kdate AS 'date', a.Maccount AS 'account'
FROM warticle AS a ORDER BY a.Kdate DESC;

SELECT * FROM view_user_article;

# 我的消息视图
CREATE VIEW view_message AS
SELECT u.Jaccount AS 'sender', u.Uhead AS 'head', u.Onickname AS 'nickname',
a.Aid AS 'aid', a.Htitle AS 'title',
m.Qdate AS 'date', m.Ptype AS 'type', m.Lcomment AS 'comment', m.Muser AS 'account'
FROM tmymessage AS m 
LEFT JOIN iuser AS u ON m.Uaccount = u.Jaccount 
LEFT JOIN warticle AS a ON m.Baid = a.Aid 
ORDER BY m.Qdate DESC;

SELECT * FROM view_message;

# 关注判断视图 ~新增
CREATE VIEW view_judge_focus AS
SELECT y.Fid AS 'id', y.Gaccount AS 'account', y.Yuser AS 'user'
FROM ymyfocus AS f;

SELECT * FROM M view_judge_focus;

# 文章评论视图
CREATE VIEW view_comment AS
SELECT c.Cid AS 'id', c.Oaid AS 'aid', c.Ycontent AS 'content', 
c.Udate AS 'date', c.Tpicture AS 'picture', c.Klike AS 'countLike',
u.Jaccount AS 'account', u.Uhead AS 'head', u.Onickname AS 'nickname'
FROM lcomment AS c LEFT JOIN iuser AS u
ON c.Xaccount = u.Jaccount ORDER BY c.Udate DESC;

SELECT * FROM view_comment;

# 文章一级评论中的回复视图
CREATE VIEW view_comment_reply AS
SELECT r.Rid AS 'id', r.Hcid AS 'cid', r.Xcontent AS 'content',
r.Adate AS 'date', r.Epicture AS 'picture', r.Jnickname AS 'nickname',
u.Jaccount AS 'account', u.Onickname AS 'userNickname'
FROM oreply AS r LEFT JOIN iuser AS u
ON r.Waccount = u.Jaccount ORDER BY r.Adate DESC;

SELECT * FROM view_comment_reply;

# 文章二级评论中的回复视图
CREATE VIEW view_reply AS
SELECT r.Rid AS 'id', r.Hcid AS 'cid',  r.Xcontent AS 'content', r.Adate AS 'date',
r.Epicture AS 'picture', r.Qlike AS 'countLike', r.Jnickname AS 'nickname',
u.Jaccount AS 'account', u.Uhead AS 'head', u.Onickname AS 'userNickname'
FROM oreply AS r LEFT JOIN iuser AS u
ON r.Waccount = u.Jaccount ORDER BY r.Adate DESC;

SELECT * FROM view_reply;
select * from oreply;