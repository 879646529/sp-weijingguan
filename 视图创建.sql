use wjg;

SELECT * FROM ymyfocus;
SELECT * FROM iuser;

# 话题视图
CREATE VIEW view_topic AS
SELECT t.Tid AS 'id', t.Ytitle AS 'title', t.Cbrief AS 'brief'
FROM ftopic AS t;

SELECT * FROM ftopic;

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