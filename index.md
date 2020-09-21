# 基本がわかるSQL入門 ——データベース&設計の基礎から楽しく学ぶ

## テスト環境

- [VirtualBox + Ubuntu](install-ubuntu.md)  
仮想環境にUbuntuをインストールし、DBMSをインストールする （MySQL、PostgreSQL）  
ApacheとPHPをインストールすることで、WebブラウザでSQL文を入力して試すことができる  
本番環境に近い環境で試すことができる、

- [XAMPP (macOS, Windows)](install-xampp.md)  
すべてGUI操作でインストール可能（MariaDB）。手軽に試したい人向け。

- [Windows](install-windows.md)  
Windows版のDBMSだけをインストール（MySQL 5.7、MySQL 8、MariaDB、PostgreSQL）、それぞれのコマンド画面からSQLを実行（参考）

## サンプルデータ

### 本書で使用するサンプルデータベース

|  データベース名  |  用途  |
| ---- | ---- |
| testdb |  第1章用のごく簡単なテストデータを登録するためのデータベース<br />※第2章のテーブルの作成と削除もこのデータベースでの実行を想定しています（本文参照）。 |
| sampledb | メインで使用する「フクロウ塾」のサンプルデータ、および、第6章で使用するサンプルデータ用のデータベース |
| sampledb2 | 第7章「ケーススタディ」で新たな定義を加えたフクロウ塾のサンプルデータ用のデータベース ｜

### 本書で使用するサンプルデータ

| ファイル名 | 内容 | インポート先 |
| ---- | ---- | ---- |
| [testdb.sql](sampledata/testdb.sql) | 第1章用サンプルデータ（生徒マスター、選択コース） | testdb |
| [sample-fukurou.sql](sampledata/sample-fukurou.sql) | 第2章～第6章用サンプルデータ（フクロウ塾） | sampledb |
| [sample-othes.sql](sampledata/sample-othes.sql) | 第6章用サンプルデータ | sampledb |
| [sample2.sql](sampledata/sample2.sql) | 第7章用サンプルデータ（フクロウ塾） | sampledb2 |

コピー＆ペースト（上記「～.sql」の内容を選択してコピー、SQLを実行可能な画面にペースト）、または、ファイルをダウンロードしてインポートする。

#### ブラウザでSQLをコピーするには

ファイル名（～.sql）をクリックし、<code>Raw</code>ボタンをクリックすると、ファイルの内容だけが表示されるのでCtrl+A（macOSはcommand+A）で全体を選択してCtrl+C（macOSはcommand+C）でコピー。

#### ～.sqlファイルをダウンロードするには

[sampledata](sampledata/)をクリックしてファイルの一覧を表示し、ファイル名を右クリックして、名前を付けてリンク先を保存する。

#### インポートするには
- [mysqlコマンドの場合（MySQL, MariaDB）](import-mysql.md)
- [psqlコマンドの場合（PostgreSQL）](import-psql.md)
- [phpMyAdminの場合（MySQL, MariaDB）](import-phpmyqdmin.md)
- [Adminerの場合（MySQL, MariaDB, PostgreSQL）](import-adminer.md)
