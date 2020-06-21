/* DATABASEの作成 */
DROP DATABASE IF EXISTS license_sys_db;
CREATE DATABASE license_sys_db CHARACTER SET utf8 COLLATE utf8_general_ci;


/* 部署マスタ */
CREATE TABLE license_sys_db.m_post(

	post_id INT PRIMARY KEY NOT NULL,
	post_name VARCHAR(20) NOT NULL
);


/* スキルレベルマスタ　*/
CREATE TABLE license_sys_db.m_skill_lv(

	skill_lv INT PRIMARY KEY NOT NULL,
	weight INT
);


/* 社員マスタ */
CREATE TABLE license_sys_db.m_emp(

	emp_cd CHAR(5) PRIMARY KEY NOT NULL,
	post_id INT NOT NULL,
	emp_name_kanji VARCHAR(100) NOT NULL,
	emp_name_kana VARCHAR(100),
	based_paid INT NOT NULL,
	FOREIGN KEY(post_id) REFERENCES m_post(post_id)
);

/* 資格マスタ　*/
CREATE TABLE license_sys_db.m_license(

	license_cd CHAR(5) PRIMARY KEY NOT NULL,
	license_name VARCHAR(100),
	skill_lv INT,
	FOREIGN KEY(skill_lv) REFERENCES m_skill_lv(skill_lv)
);

/*　資格取得テーブル　*/
CREATE TABLE license_sys_db.t_get_license(

	emp_cd CHAR(5) NOT NULL,
	license_cd CHAR(5) NOT NULL,
	get_license_date DATE,
	PRIMARY KEY(emp_cd, license_cd),
	FOREIGN KEY(emp_cd) REFERENCES m_emp(emp_cd),
	FOREIGN KEY(license_cd) REFERENCES m_license(license_cd)
);


/*　部署マスタ　*/
INSERT INTO license_sys_db.m_post VALUES(10, '経理部');
INSERT INTO license_sys_db.m_post VALUES(20, '調査部');
INSERT INTO license_sys_db.m_post VALUES(30, '営業部');
INSERT INTO license_sys_db.m_post VALUES(40, '総務部');



/*　スキルレベルマスタ　*/
INSERT INTO license_sys_db.m_skill_lv VALUES(1, 1);
INSERT INTO license_sys_db.m_skill_lv VALUES(2, 2);
INSERT INTO license_sys_db.m_skill_lv VALUES(3, 4);
INSERT INTO license_sys_db.m_skill_lv VALUES(4, 7);
INSERT INTO license_sys_db.m_skill_lv VALUES(5, 10);



/* 社員マスタ　*/
INSERT INTO license_sys_db.m_emp VALUES('21021', 30, '田中一郎','たなかいちろう', 1000);
INSERT INTO license_sys_db.m_emp VALUES('21024', 30, '山田花子','やまだはなこ', 2000);
INSERT INTO license_sys_db.m_emp VALUES('21042', 10, '鈴木正雄','すずきまさお', 1000);
INSERT INTO license_sys_db.m_emp VALUES('21047', 10, '高橋和男','たかはしかずお', 2000);
INSERT INTO license_sys_db.m_emp VALUES('21063', 40, '佐藤愛','さとうあい', 4000);
INSERT INTO license_sys_db.m_emp VALUES('21066', 20, '岡本美智子','おかもともみちこ', 5000);
INSERT INTO license_sys_db.m_emp VALUES('21085', 20, '太田豊','おおたゆたか', 1000);
INSERT INTO license_sys_db.m_emp VALUES('21086', 10, '渡辺浩志','わたなべひろし', 1000);


/*　資格マスタ　*/
INSERT INTO license_sys_db.m_license VALUES('L0001', 'ITパスポート', 1);
INSERT INTO license_sys_db.m_license VALUES('L0101', '基本情報', 2);
INSERT INTO license_sys_db.m_license VALUES('L0102', '応用情報', 3);
INSERT INTO license_sys_db.m_license VALUES('L0301', 'Oracle Master Bronze', 2);
INSERT INTO license_sys_db.m_license VALUES('L0302', 'Oracle Master Silver', 3);
INSERT INTO license_sys_db.m_license VALUES('L0303', 'Oracle Master Gold', 4);
INSERT INTO license_sys_db.m_license VALUES('L0401', 'OCJ-P', 2);
INSERT INTO license_sys_db.m_license VALUES('L0402', 'OCJ-WS', 3);
INSERT INTO license_sys_db.m_license VALUES('L0501', 'OCUP-F', 2);
INSERT INTO license_sys_db.m_license VALUES('L0502', 'OCUP-I', 3);
INSERT INTO license_sys_db.m_license VALUES('L0503', 'OCUP-A', 4);


/*　資格取得テーブル　*/
INSERT INTO license_sys_db.t_get_license VALUES('21021', 'L0001', '2010-02-10');
INSERT INTO license_sys_db.t_get_license VALUES('21024', 'L0101', '2010-05-04');
INSERT INTO license_sys_db.t_get_license VALUES('21047', 'L0102', '2010-01-14');
INSERT INTO license_sys_db.t_get_license VALUES('21063', 'L0301', '2010-08-31');
INSERT INTO license_sys_db.t_get_license VALUES('21066', 'L0402', '2012-10-11');
INSERT INTO license_sys_db.t_get_license VALUES('21085', 'L0501', '2010-03-02');
INSERT INTO license_sys_db.t_get_license VALUES('21086', 'L0502', '2010-07-01');
INSERT INTO license_sys_db.t_get_license VALUES('21024', 'L0503', '2011-06-21');
INSERT INTO license_sys_db.t_get_license VALUES('21063', 'L0001', '2012-04-22');
INSERT INTO license_sys_db.t_get_license VALUES('21066', 'L0101', '2013-10-08');
INSERT INTO license_sys_db.t_get_license VALUES('21047', 'L0501', '2013-09-19');