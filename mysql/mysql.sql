use license_sys_db;
SELECT e.emp_cd as 社員コード, e.emp_name_kanji as "社員名(漢字)", p.post_id as 部署ID, p.post_name as 部署名
FROM (m_emp e 
INNER JOIN m_post p 
ON e.post_id = p.post_id)
WHERE e.post_id = 30;

use license_sys_db;
SELECT e.emp_cd as 社員コード, e.emp_name_kanji as "社員名(漢字)", p.post_id as 部署ID, p.post_name as 部署名, e.based_paid as 手当基礎額
FROM (m_emp e 
INNER JOIN m_post p 
ON e.post_id = p.post_id)
WHERE e.based_paid <= 2000;



SELECT e.emp_cd as 社員コード, e.emp_name_kanji as "社員名(漢字)", p.post_id as 部署ID, p.post_name as 部署名, e.based_paid as 手当基礎額
FROM (m_post p 
INNER JOIN m_emp e 
ON e.post_id = p.post_id)
WHERE p.post_id = 20 OR e.based_paid > 2000
ORDER BY e.emp_cd;


use license_sys_db;

SELECT e.emp_cd as 社員コード, e.emp_name_kanji as "社員名(漢字)", p.post_name as 部署名, l.license_cd as 資格コード, l.license_name as 資格名
FROM ((m_post p 
INNER JOIN m_emp e ON e.post_id = p.post_id) 
LEFT OUTER JOIN t_get_license t ON t.emp_cd = e.emp_cd) 
LEFT OUTER JOIN m_license l ON t.license_cd = l.license_cd
WHERE p.post_name = '経理部' OR l.license_name = 'ITパスポート';

use license_sys_db;

UPDATE m_emp
SET emp_name_kana = NULL
WHERE emp_cd = '21066';



SELECT AVG(based_paid) as 社員マスタの手当基礎額の平均値
FROM m_emp;




SELECT m.license_name as 資格名, count(t.license_cd) as 取得者数
FROM t_get_license t
INNER JOIN m_license m
ON m.license_cd = t.license_cd
GROUP BY t.license_cd;



SELECT e.emp_name_kanji as "社員名(漢字)", count(t.emp_cd) as 資格の個数
FROM t_get_license t
INNER JOIN m_emp e
ON t.emp_cd = e.emp_cd
GROUP BY t.emp_cd
HAVING count(t.emp_cd) >= 2;


use license_sys_db;
/*
SELECT l.license_name, s.weight
FROM m_license l
INNER JOIN m_skill_lv s
ON l.skill_lv = s.skill_lv;
*/

SELECT e.emp_name_kanji as "社員名(漢字)", l.license_name as 資格名, e.based_paid * l.weight as 報奨金額
FROM (t_get_license t
INNER JOIN m_emp e
ON t.emp_cd = e.emp_cd)
INNER JOIN (SELECT l.license_cd, l.license_name, s.weight
FROM m_license l
INNER JOIN m_skill_lv s
ON l.skill_lv = s.skill_lv) l
ON l.license_cd = t.license_cd
ORDER BY e.emp_name_kanji;


UPDATE m_emp
SET based_paid = based_paid + 500;


INSERT INTO m_license
VALUES ('L0304', 'Oracle Master Platinum', 5);



DELETE FROM m_emp
WHERE emp_cd = '21042';
