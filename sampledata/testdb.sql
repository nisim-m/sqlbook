/*
  2020.9.22 rev.0
  生徒マスター、選択コースの作成
  ※フクロウ塾（sampledb）の一部を使用
  ※最低限の参照制約のみ設定しており、
    校舎や科目のマスターや入力の制約は使用していない
*/

DROP TABLE IF EXISTS 選択コース;
DROP TABLE IF EXISTS 生徒マスター;

CREATE TABLE 生徒マスター (
    生徒番号 CHAR(5) PRIMARY KEY,
    氏名 VARCHAR(255),
    校舎 VARCHAR(255)
);

INSERT INTO 生徒マスター(生徒番号, 氏名, 校舎) VALUES
('C0001', '谷内 ミケ', '渋谷'),
('C0002', '山村 つくね', '池袋'),
('C0003', '北川 ジョン', '新宿'),
('C0011', '泉 観音', '新宿'),
('C0018', '神谷 かりん', '品川');

CREATE TABLE 選択コース(
    生徒番号 CHAR(5),
    コース VARCHAR(255),
    PRIMARY KEY (生徒番号, コース),
    FOREIGN KEY (生徒番号) REFERENCES 生徒マスター (生徒番号)
);

INSERT INTO 選択コース VALUES ('C0001','国語'),('C0001','英語'),('C0001','数学');
INSERT INTO 選択コース VALUES ('C0002','英語'),('C0002','数学');
INSERT INTO 選択コース VALUES ('C0003','国語'),('C0003','英語'),('C0003','数学');
INSERT INTO 選択コース VALUES ('C0011','国語'),('C0011','英語'),('C0011','数学');
INSERT INTO 選択コース VALUES ('C0018','英語');
