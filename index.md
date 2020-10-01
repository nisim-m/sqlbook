# 基本がわかるSQL入門
——データベース&設計の基礎から楽しく学ぶ

[技術評論社](https://gihyo.jp/book/2020/978-4-297-11659-0)  
[Amazon](https://www.amazon.co.jp/dp/4297116596/)  
2020.10

<!-- TOC -->

1. [テスト環境](#テスト環境)
2. [サンプルデータ](#サンプルデータ)
   1. [本書で使用するサンプルデータベース](#本書で使用するサンプルデータベース)
   2. [本書で使用するサンプルデータ](#本書で使用するサンプルデータ)

<!-- /TOC -->

<a id="markdown-テスト環境" name="テスト環境"></a>
## テスト環境

本書に掲載しているSQL文を実行するためのテスト環境を導入する方法です。以下の3種類を紹介しています。ご自身が利用している環境とお好みに応じて選択してください。

<div>
おすすめルート：
[A]LinuxにMySQLとPostgreSQLを入れて試したい  
[VirtualBox ＋ Ubuntu](howto/install-ubuntu.md)を参照してひととおりインストール→[サンプルデータ](#サンプルデータ)をダウンロード→[Adminer](howto/import-adminer.md)でサンプルデータをインポート  
[B] GUIでさくっとインストールしてSQLを試したい  
[XAMPP (macOS, Windows)](howto/install-xampp.md)→[サンプルデータ](#サンプルデータ)をダウンロード→[phpMyAdminの場合](howto/import-phpmyadmin.md)でサンプルデータをインポート  
</div>

- [VirtualBox + Ubuntu](howto/install-ubuntu.md)  
仮想環境にUbuntuをインストールし、DBMSをインストールする （MySQL、PostgreSQL）  
テスト環境や勉強用の環境を作りたいときには、VirtualBoxのような「仮想化環境」が便利です。VirtualBoxを利用することで、普段使っているOSはそのままで、別途OSを動かし、そこでデータベースを動かすことができます。環境の作り直しも簡単で、テスト環境が不要になったら仮想環境ごと削除することもできます。Unix系OSでの導入を考えている場合、本番環境に近い環境で試すことができるというメリットがあります。  
なお、インストール解説ではApacheとPHPをインストールして、WebブラウザでSQL文を入力して試す方法も紹介しています。
  
- [XAMPP (macOS, Windows)](howto/install-xampp.md)  
すべてGUI操作でインストール可能（MariaDB）。手軽に試したい人向け  
XAMPPとはWeb環境用のプログラム開発やテストに使用するソフトウェアをまとめてインストールできるようにしたパッケージで、無償で入手できます。GUI操作のみで簡単にインストールできるというメリットがあります。データベースにはMariaDBが導入され、SQLの実行にはphpMyAdminが利用できます。phpMyAdminはXAMPP管理画面にあるMySQLの「Admin」より実行可能）が利用できます（MariaDBはMySQLを元に開発されており、XAMPPの管理画面には「MySQL」と表示されています）。
  
- [DBMSのみ（Windows）](howto/install-windows.md)  
Windows版のDBMSだけをインストール（MySQL 5.7、MySQL 8、MariaDB、PostgreSQL）、それぞれのコマンドラインクライアントでSQLを実行する（参考、コマンド操作に慣れている人向け）

<a id="sampledata" name="sampledata"></a>
<a id="markdown-サンプルデータ" name="サンプルデータ"></a>
## サンプルデータ

<a id="markdown-本書で使用するサンプルデータベース" name="本書で使用するサンプルデータベース"></a>
### 本書で使用するサンプルデータベース

サンプルデータベースおよびテスト用ユーザーの作成方法は、各テスト環境のページを参照してください。

|  データベース名  |  用途  |
| ---- | ---- |
| testdb |  第1章用のごく簡単なテストデータを登録するためのデータベース<br />※第2章のテーブルの作成と削除もこのデータベースでの実行を想定しています（本文参照）。 |
| sampledb | メインで使用する「フクロウ塾」のサンプルデータ、および、第6章で使用するサンプルデータ用のデータベース |
| sampledb2 | 第7章「ケーススタディ」で新たな定義を加えたフクロウ塾のサンプルデータ用のデータベース |

<a id="markdown-本書で使用するサンプルデータ" name="本書で使用するサンプルデータ"></a>
### 本書で使用するサンプルデータ

| ファイル名 | 内容 | インポート先 |
| ---- | ---- | ---- |
| [testdb.sql](sampledata/testdb.sql) | 第1章用サンプルデータ（生徒マスター、選択コース） | testdb |
| [sampledb-fukurou.sql](sampledata/sampledb-fukurou.sql) | 第2章～第6章用サンプルデータ（フクロウ塾） | sampledb |
| [sampledb-others.sql](sampledata/sampledb-others.sql) | 第6章用サンプルデータ | sampledb |
| [sampledb2.sql](sampledata/sampledb2.sql) | 第7章用サンプルデータ（フクロウ塾） | sampledb2 |

ファイル名をクリックするとダウンロードできます。
拡張子は「.sql」となっていますが、テキストファイルなのでメモ帳やテキストエディットなどで開いて内容を確認することができます。

#### サンプルデータをインポートするには
- [mysqlコマンドの場合（MySQL, MariaDB ※コマンド操作に慣れている人向け）](howto/import-mysql.md)
- [psqlコマンドの場合（PostgreSQL ※コマンド操作に慣れている人向け）](howto/import-psql.md)
- [phpMyAdminの場合（MySQL, MariaDB）](howto/import-phpmyadmin.md)
- [Adminerの場合（MySQL, MariaDB, PostgreSQL）](howto/import-adminer.md)

----
[基本がわかるSQL入門 <small>——データベース&設計の基礎から楽しく学ぶ</small> サポートページ](https://nisim-m.github.io/sqlbook/)
