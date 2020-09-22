/*
  2020.9.22 rev.0
  サンプルデータ（sampledb、2～6章で使用）
*/

-- ビュー権限サンプル
DROP VIEW IF EXISTS view2, view1;

/*
# 商品・仕入先・倉庫テーブル
  第4正規形、第5正規形、ドメイン正規形サンプル
 （第6章用にアルファベット名によるテーブルに変更）
*/
DROP TABLE IF EXISTS 商品仕入先倉庫表_dk;
DROP TABLE IF EXISTS 商品仕入先表_dk;
DROP TABLE IF EXISTS 商品仕入先倉庫表;
DROP TABLE IF EXISTS 商品仕入先表;
DROP TABLE IF EXISTS 商品倉庫表;
DROP TABLE IF EXISTS 仕入先倉庫表;
DROP TABLE IF EXISTS 商品マスター;
DROP TABLE IF EXISTS 仕入先マスター;
DROP TABLE IF EXISTS 倉庫マスター;

-- マスターテーブル（商品、倉庫、仕入先）
CREATE TABLE 商品マスター (
    商品 CHAR(3) NOT NULL PRIMARY KEY,
    商品名称 VARCHAR(255) NOT NULL
);

INSERT INTO 商品マスター VALUES
('001','商品001'),
('002','商品002'),
('003','商品003'),
('004','商品004');

CREATE TABLE 仕入先マスター (
    仕入先 CHAR(3) NOT NULL PRIMARY KEY,
    仕入先名称 VARCHAR(255) NOT NULL
);

INSERT INTO 仕入先マスター VALUES
('S01','仕入先01'),
('S02','仕入先02'),
('S03','仕入先03'),
('S04','仕入先04');

CREATE TABLE 倉庫マスター (
    倉庫 CHAR(2) NOT NULL PRIMARY KEY
);

INSERT INTO 倉庫マスター VALUES
('X1'),
('X2'),
('Y1'),
('Y2'),
('Z1'),
('Z2');


-- 商品と仕入先と倉庫（元のテーブル）
CREATE TABLE 商品仕入先倉庫表 (
    商品 CHAR(3) NOT NULL,
    仕入先 CHAR(3) NOT NULL,
    倉庫 CHAR(2) NOT NULL,
    PRIMARY KEY(商品, 仕入先, 倉庫),
    FOREIGN KEY(商品) REFERENCES 商品マスター (商品),
    FOREIGN KEY(仕入先) REFERENCES 仕入先マスター (仕入先),
    FOREIGN KEY(倉庫) REFERENCES 倉庫マスター (倉庫)
);

INSERT INTO 商品仕入先倉庫表 VALUES
('001', 'S01', 'X1'),
('001', 'S01', 'Y1'),
('001', 'S01', 'Z1'),
('001', 'S01', 'X2'),
('001', 'S02', 'X1'),
('001', 'S02', 'Y1'),
('002', 'S01', 'Z1'),
('002', 'S01', 'X2'),
('003', 'S03', 'X1'),
('003', 'S02', 'X1');

-- 商品と仕入先（第4正規形）
CREATE TABLE 商品仕入先表 (
    商品 CHAR(3) NOT NULL,
    仕入先 CHAR(3) NOT NULL,
    PRIMARY KEY(商品, 仕入先),
    FOREIGN KEY(商品) REFERENCES 商品マスター (商品),
    FOREIGN KEY(仕入先) REFERENCES 仕入先マスター (仕入先)
);

-- 元データから商品と仕入先の組み合わせを生成して登録
INSERT INTO 商品仕入先表
SELECT DISTINCT 商品, 仕入先 FROM 商品仕入先倉庫表;

-- 商品と倉庫（第4正規形）
CREATE TABLE 商品倉庫表 (
    商品 CHAR(3) NOT NULL,
    倉庫 CHAR(2) NOT NULL,
    PRIMARY KEY(商品, 倉庫),
    FOREIGN KEY(商品) REFERENCES 商品マスター (商品),
    FOREIGN KEY(倉庫) REFERENCES 倉庫マスター (倉庫)
);

-- 元データから商品と倉庫の組み合わせを生成して登録
INSERT INTO 商品倉庫表
SELECT DISTINCT 商品, 倉庫 FROM 商品仕入先倉庫表;

-- 仕入先と倉庫（第5正規形）
CREATE TABLE 仕入先倉庫表 (
    仕入先 CHAR(3) NOT NULL,
    倉庫 CHAR(2) NOT NULL,
    PRIMARY KEY(仕入先, 倉庫)
);

-- 元データから仕入先と倉庫の組み合わせを生成して登録
INSERT INTO 仕入先倉庫表
SELECT DISTINCT 仕入先, 倉庫 FROM 商品仕入先倉庫表;

-- 商品仕入先表テーブル（ドメインキー正規形）
CREATE TABLE 商品仕入先表_dk (
    商品 CHAR(3) NOT NULL,
    仕入先 CHAR(3) NOT NULL,
    FOREIGN KEY(商品) REFERENCES 商品マスター (商品),
    FOREIGN KEY(仕入先) REFERENCES 仕入先マスター (仕入先),
    PRIMARY KEY(商品, 仕入先)
);

-- 元データから商品と仕入先の組み合わせを生成して登録
INSERT INTO 商品仕入先表_dk
SELECT DISTINCT 商品, 仕入先 FROM 商品仕入先倉庫表;

-- 商品仕入先倉庫表テーブル（ドメインキー正規形、外部キー追加）
CREATE TABLE 商品仕入先倉庫表_dk (
    商品 CHAR(3) NOT NULL,
    仕入先 CHAR(3) NOT NULL,
    倉庫 CHAR(2) NOT NULL,
    PRIMARY KEY(商品, 仕入先, 倉庫),
    FOREIGN KEY(商品) REFERENCES 商品マスター (商品),
    FOREIGN KEY(仕入先) REFERENCES 仕入先マスター (仕入先),
    FOREIGN KEY(倉庫) REFERENCES 倉庫マスター (倉庫),
    FOREIGN KEY(商品, 仕入先) REFERENCES 商品仕入先表_dk(商品, 仕入先)
);

-- 元データを登録
-- （商品仕入先表テーブルにない組み合わせは登録できなくなっている）
INSERT INTO 商品仕入先倉庫表_dk
SELECT * FROM 商品仕入先倉庫表;

/*
# 外部結合用サンプル（c1, c2, c3）
*/
DROP TABLE IF EXISTS c1, c2;

CREATE TABLE c1(
    code INTEGER PRIMARY KEY,
    color VARCHAR(255)
);
INSERT INTO c1 VALUES(1, '赤'),(2, '白'),(3, '青');

CREATE TABLE c2(
    code INTEGER PRIMARY KEY,
    size CHAR
);
INSERT INTO c2 VALUES(2, 'S'),(4, 'L');

/*
# 自己結合サンプル（membersテーブル）
*/

DROP TABLE IF EXISTS members;
CREATE TABLE members (
    id CHAR(3) PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    manager_id CHAR(3)
);

-- (補足)自分のテーブルに対する参照の場合CREATE TABLEでは設定できないので
-- ALTER TABLEを使用する
-- ※設定していなくても自己結合のテストは可能
ALTER TABLE members
ADD FOREIGN KEY (manager_id) REFERENCES members (id);

INSERT INTO members VALUES
('001', '岡本 にゃん吉',  NULL),
('002', '戸川 ちゃつね', '001'),
('003', '森川 リリィ',   '002'),
('004', '森川 エミリ',   '002'),
('005', '山本 蘭々',     '004');


/*
# 3つのテーブルによるJOINのサンプル
*/

DROP TABLE IF EXISTS t2room;
DROP TABLE IF EXISTS t2teacher;
DROP TABLE IF EXISTS t2;
DROP TABLE IF EXISTS t3;
DROP TABLE IF EXISTS t1;
CREATE TABLE t1(
    code CHAR(2) PRIMARY KEY,
    name VARCHAR(255) NOT NULL
);
INSERT INTO t1 VALUES ('P1', '一郎'),('P2', '次郎'),('P3', '三郎');
-- 外部結合用
INSERT INTO t1 VALUES ('P4','史郎');


CREATE TABLE t2(
    code CHAR(2) NOT NULL,
    subject VARCHAR(255) NOT NULL,
    PRIMARY KEY (code, subject),
    FOREIGN KEY (code) REFERENCES t1 (code)
);
INSERT INTO t2 VALUES ('P1', '歴史'),('P1', '哲学'),('P2', '物理'),('P3', '地学');
-- 外部結合用
INSERT INTO t2 VALUES('P4','地学');


CREATE TABLE t3(
    code CHAR(2) NOT NULL,
    club VARCHAR(255) NOT NULL,
    PRIMARY KEY (code, club),
    FOREIGN KEY (code) REFERENCES t1 (code)
);
INSERT INTO t3 VALUES ('P1', '音楽'),('P2', '映画'),('P3', '音楽'),('P3', '映画');

-- 二つの列によるJOINサンプル
CREATE TABLE t2room (
    code CHAR(2) NOT NULL,
    subject VARCHAR(255) NOT NULL,
    room VARCHAR(255) NOT NULL,
    PRIMARY KEY (code, subject),
    FOREIGN KEY (code) REFERENCES t1 (code),
    FOREIGN KEY (code, subject) REFERENCES t2 (code, subject)
);

INSERT INTO t2room(code,subject,room) VALUES
('P1','哲学','T1'),
('P1','歴史','R1'),
('P2','物理','B1'),
('P3','地学','C1'),
('P4','地学','C2');

CREATE TABLE t2teacher (
    code CHAR(2) NOT NULL,
    subject VARCHAR(255) NOT NULL,
    teacher VARCHAR(255) NOT NULL,
    PRIMARY KEY (code, subject),
    FOREIGN KEY (code) REFERENCES t1 (code),
    FOREIGN KEY (code, subject) REFERENCES t2 (code, subject)
);

INSERT INTO t2teacher(code,subject,teacher) VALUES
('P1','哲学','ジョナサン'),
('P1','歴史','山本'),
('P2','物理','田中'),
('P3','地学','岡田'),
('P4','地学','シバタ');

/*
# NULLIF、COALESCEサンプル（members_carテーブル、members_telテーブル）
※実行サンプルなのでイメージしやすいよう各テーブルにnameを入れていますが
  このように、複数のテーブルにnameを入れるのは更新不整合の元になります。
*/

DROP TABLE IF EXISTS members_car;
CREATE TABLE members_car (
    id CHAR(3) PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    mycar VARCHAR(255)
);

INSERT INTO members_car VALUES
('001', '岡本 にゃん吉', '14-5'),
('002', '戸川 ちゃつね', NULL),
('003', '森川 リリィ',   '32-1'),
('004', '森川 エミリ',   ''),
('005', '山本 蘭々',     '26-8');

DROP TABLE IF EXISTS members_tel;
CREATE TABLE members_tel (
    id CHAR(3) PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    mobile VARCHAR(255),
    home VARCHAR(255)
);

INSERT INTO members_tel VALUES
('001', '岡本 にゃん吉', NULL, '033552104X'),
('002', '戸川 ちゃつね', '0803075953X', '037700269X'),
('003', '森川 リリィ',   '0801764195X', NULL),
('004', '森川 エミリ',   '0901793519X', NULL),
('005', '山本 蘭々',     NULL, NULL);

/*
# 集約関数のテスト
*/
DROP TABLE IF EXISTS groupby_test;
CREATE TABLE groupby_test (
    name CHAR(1) PRIMARY KEY,
    price INTEGER
);
INSERT INTO groupby_test VALUES
('A', 100),
('B', 20),
('C', 0),
('D', NULL);

/*
# UNION用サンプル（staff, mentor）
*/

DROP TABLE IF EXISTS staff;
CREATE TABLE staff(
    staff_id CHAR(5) PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    course_subject VARCHAR(255) NOT NULL,
    tel VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL UNIQUE
    -- subject_masterテーブルについてはケーススタディ参照（sampledb3）
    -- ,FOREIGN KEY (course_subject) REFERENCES sampledb3.subject_master(course_subject)
);

INSERT INTO staff VALUES
('S0101','森 茶太郎','国語','0809169251X','mori_fukurou@fk.example.jp'),
('S0102','花村 ささめ','英語','0907264800X','hana_fukurou@fk.example.jp'),
('S0103','西野 蓮','英語','0801303011X','nisren_fukurou@fk.example.jp'),
('S0104','大崎 ジョン','数学','0802854730X','john_fukurou@fk.example.jp'),
('S0105','田村 真由子','数学','0803589347X','mayu_fukurou@fk.example.jp');

DROP TABLE IF EXISTS mentor;
CREATE TABLE mentor(
    -- mentor_id CHAR(3) PRIMARY KEY, -- テスト用にstaff_idとは異なるデータ型を使用
    mentor_no INTEGER PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    branch VARCHAR(255) NOT NULL,
    tel VARCHAR(255) NOT NULL
    -- , FOREIGN KEY (branch) REFERENCES sampledb3.branch_master(branch)
);

INSERT INTO mentor VALUES
(2,'山村 つみれ','池袋','0903421788X'),
(4,'大崎 ジョン','新宿','0802854730X'),
(5,'土谷 礼奈','池袋','0809184295X'),
(8,'香坂 理恵子','新宿','0804063145X'),
(12,'矢田 たつまる','渋谷','0903621248X'),
(16,'石本 りんりん','渋谷','0902643023X'),
(17,'中山 隆之介','品川','0907004567X'),
(18,'長崎 ごん','品川','0802214770X');

/*
# CASE式用サンプル（members_tsukin、members_color）
*/

-- members_tsukin
DROP TABLE IF EXISTS members_tsukin;
CREATE TABLE members_tsukin (
    id CHAR(3) PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    tsukin_kubun INTEGER NOT NULL
);

INSERT INTO members_tsukin VALUES
('001','岡本 にゃん吉','2'),
('002','戸川 ちゃつね','1'),
('003','森川 リリィ','2'),
('004','森川 エミリ','0'),
('005','山本 蘭々','2');

-- members_color
DROP TABLE IF EXISTS members_color;
CREATE TABLE members_color (
    id CHAR(3) PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    c1 VARCHAR(255),
    c2 VARCHAR(255),
    c3 VARCHAR(255)
);

INSERT INTO members_color VALUES
('001','岡本 にゃん吉','yellow',NULL,'red'),
('002','戸川 ちゃつね',NULL,'yellow','green'),
('003','森川 リリィ','red','blue',NULL),
('004','森川 エミリ',NULL,'green','red'),
('005','山本 蘭々','blue',NULL,'yellow');


/*
# サブクエリ用サンプル（bungu, hanbai_header, hanbai）
*/
DROP TABLE IF EXISTS hanbai;
DROP TABLE IF EXISTS hanbai_header;
DROP TABLE IF EXISTS bungu;
CREATE TABLE bungu(
bungu_code CHAR(3) PRIMARY KEY,
bungu_name VARCHAR(255) NOT NULL,
std_price INTEGER -- NOT NULL
);

INSERT INTO bungu VALUES
('S01','notebook A',120),
('S02','notebook B',250),
('S03','marker yellow',100),
('S04','marker red',280),
('S05','marker green',300);

CREATE TABLE hanbai_header(
    order_code CHAR(6) PRIMARY KEY,
    tokui_code CHAR(3) NOT NULL
);

INSERT INTO hanbai_header VALUES
('XX0011', 'T01'),
('XX0012', 'T02'),
('XX0013', 'T03'),
('XX0014', 'T01'),
('XX0015', 'T02');

CREATE TABLE hanbai(
    order_code CHAR(6) NOT NULL,
    bungu_code CHAR(3) NOT NULL,
    act_price INTEGER NOT NULL, -- 実売価格
    qty INTEGER NOT NULL, -- 販売個数
    PRIMARY KEY (order_code, bungu_code),
    FOREIGN KEY (order_code) REFERENCES hanbai_header(order_code),
    FOREIGN KEY (bungu_code) REFERENCES bungu(bungu_code)
);

INSERT INTO hanbai VALUES
('XX0011','S01',120,10),
('XX0011','S02',225,5),
('XX0012','S01',96,150),
('XX0012','S02',200,150),
('XX0012','S03',80,100),
('XX0013','S02',225,10),
('XX0013','S04',252,10),
('XX0014','S01',96,100),
('XX0014','S04',224,100),
('XX0015','S03',100,25),
('XX0015','S04',252,25),
('XX0015','S05',270,50);

/*
# 直積サンプル（学生マスターと専攻科目）
*/
DROP TABLE IF EXISTS 専攻科目;
DROP TABLE IF EXISTS 学生マスター;

CREATE TABLE 学生マスター(
    code CHAR(2) NOT NULL,
    name VARCHAR(255) NOT NULL
);

CREATE TABLE 専攻科目(
    code CHAR(2) NOT NULL,
    subject VARCHAR(255) NOT NULL
);

INSERT INTO 学生マスター VALUES
('P1', '一郎'),
('P1', '次郎');

INSERT INTO 専攻科目 VALUES
('P1', '歴史'),
('P1', '哲学'),
('P2', '物理');

/*
# 射影サンプル
*/
DROP TABLE IF EXISTS 仕入伝票;
CREATE TABLE 仕入伝票 (
    伝票番号 CHAR(6) NOT NULL,
    商品コード CHAR(3) NOT NULL,
    単価 INTEGER NOT NULL,
    個数 INTEGER NOT NULL
);

INSERT INTO 仕入伝票 VALUES
('XX0011','001',120,10),
('XX0011','002',225,5),
('XX0012','001',96,150),
('XX0012','002',200,150),
('XX0012','003',80,100),
('XX0013','002',225,10),
('XX0013','004',252,10),
('XX0014','001',96,100),
('XX0014','004',224,100),
('XX0015','003',100,25),
('XX0015','004',252,25);

/*
# 関係除算サンプル（品揃えリスト）
*/

DROP TABLE IF EXISTS 品揃えリスト;
CREATE TABLE 品揃えリスト(
    店名 VARCHAR(255),
    商品 VARCHAR(255)
);
INSERT INTO 品揃えリスト VALUES
('A店','野菜'),
('Y店','洋服'),
('Y店','くつ'),
('Y店','加工食品'),
('Y店','クスリ'),
('S店','野菜'),
('S店','鮮魚'),
('S店','加工食品'),
('P店','洋服'),
('P店','画材'),
('P店','野菜'),
('P店','クスリ'),
('P店','加工食品');

DROP TABLE IF EXISTS ほしい物リスト;
CREATE TABLE ほしい物リスト(
    商品 VARCHAR(255)
);
INSERT INTO ほしい物リスト VALUES
('野菜'),
('加工食品');

/*
# 年次月次変換（UNION、INSERT、CASE）
*/

DROP TABLE IF EXISTS phase_results;
CREATE TABLE phase_results(
    phase INTEGER PRIMARY KEY,
    r01 INTEGER,
    r02 INTEGER,
    r03 INTEGER,
    r04 INTEGER,
    r05 INTEGER,
    r06 INTEGER,
    r07 INTEGER,
    r08 INTEGER,
    r09 INTEGER,
    r10 INTEGER,
    r11 INTEGER,
    r12 INTEGER
);

INSERT INTO phase_results VALUES
(1,15,14,20,30,28,41,28,49,18,59,37,30),
(2,30,14,20,23,20,50,13,35,9,60,55,22),
(3,40,23,35,35,40,48,17,56,41,36,24,30),
(4,55,40,61,50,60,57,45,NULL,NULL,NULL,NULL,NULL);

DROP TABLE IF EXISTS month_results;
CREATE TABLE month_results(
    phase INTEGER NOT NULL CHECK (phase>0),
    month INTEGER NOT NULL CHECK (month BETWEEN 1 AND 12),
    results INTEGER NOT NULL,
    PRIMARY KEY(phase, month)
);
INSERT INTO month_results(phase, month, results)
SELECT phase,  1, r01 FROM phase_results WHERE r01 IS NOT NULL
UNION ALL
SELECT phase,  2, r02 FROM phase_results WHERE r02 IS NOT NULL
UNION ALL
SELECT phase,  3, r03 FROM phase_results WHERE r03 IS NOT NULL
UNION ALL
SELECT phase,  4, r04 FROM phase_results WHERE r04 IS NOT NULL
UNION ALL
SELECT phase,  5, r05 FROM phase_results WHERE r05 IS NOT NULL
UNION ALL
SELECT phase,  6, r06 FROM phase_results WHERE r06 IS NOT NULL
UNION ALL
SELECT phase,  7, r07 FROM phase_results WHERE r07 IS NOT NULL
UNION ALL
SELECT phase,  8, r08 FROM phase_results WHERE r08 IS NOT NULL
UNION ALL
SELECT phase,  9, r09 FROM phase_results WHERE r09 IS NOT NULL
UNION ALL
SELECT phase, 10, r10 FROM phase_results WHERE r10 IS NOT NULL
UNION ALL
SELECT phase, 11, r11 FROM phase_results WHERE r11 IS NOT NULL
UNION ALL
SELECT phase, 12, r12 FROM phase_results WHERE r12 IS NOT NULL
;



