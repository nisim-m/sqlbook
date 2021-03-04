# 基本がわかるSQL入門
<a id="markdown-%E5%9F%BA%E6%9C%AC%E3%81%8C%E3%82%8F%E3%81%8B%E3%82%8Bsql%E5%85%A5%E9%96%80" name="%E5%9F%BA%E6%9C%AC%E3%81%8C%E3%82%8F%E3%81%8B%E3%82%8Bsql%E5%85%A5%E9%96%80"></a>
——データベース&設計の基礎から楽しく学ぶ

[技術評論社](https://gihyo.jp/book/2020/978-4-297-11659-0)  
[Amazon](https://www.amazon.co.jp/dp/4297116596/)  
2020.10

<!-- TOC -->

- [テスト環境](#%E3%83%86%E3%82%B9%E3%83%88%E7%92%B0%E5%A2%83)
- [サンプルデータ](#%E3%82%B5%E3%83%B3%E3%83%97%E3%83%AB%E3%83%87%E3%83%BC%E3%82%BF)
    - [本書で使用するサンプルデータベース](#%E6%9C%AC%E6%9B%B8%E3%81%A7%E4%BD%BF%E7%94%A8%E3%81%99%E3%82%8B%E3%82%B5%E3%83%B3%E3%83%97%E3%83%AB%E3%83%87%E3%83%BC%E3%82%BF%E3%83%99%E3%83%BC%E3%82%B9)
    - [本書で使用するサンプルデータ](#%E6%9C%AC%E6%9B%B8%E3%81%A7%E4%BD%BF%E7%94%A8%E3%81%99%E3%82%8B%E3%82%B5%E3%83%B3%E3%83%97%E3%83%AB%E3%83%87%E3%83%BC%E3%82%BF)
- [正誤表](#%E6%AD%A3%E8%AA%A4%E8%A1%A8)
- [履歴](#%E5%B1%A5%E6%AD%B4)

<!-- /TOC -->

## テスト環境
<a id="markdown-%E3%83%86%E3%82%B9%E3%83%88%E7%92%B0%E5%A2%83" name="%E3%83%86%E3%82%B9%E3%83%88%E7%92%B0%E5%A2%83"></a>

本書に掲載しているSQL文を実行するためのテスト環境を導入する方法です。以下の3種類を紹介しています。ご自身が利用している環境とお好みに応じて選択してください。
- [VirtualBox + Ubuntu](howto/install-ubuntu.md)  
仮想環境にUbuntuをインストールし、DBMSをインストールする （MySQL、PostgreSQL）  
テスト環境や勉強用の環境を作りたいときには、VirtualBoxのような「仮想化環境」が便利です。VirtualBoxを利用することで、普段使っているOSはそのままで、別途OSを動かし、そこでデータベースを動かすことができます。環境の作り直しも簡単で、テスト環境が不要になったら仮想環境ごと削除することもできます。Unix系OSでの導入を考えている場合、本番環境に近い環境で試すことができるというメリットがあります。  
なお、インストール解説ではApacheとPHPをインストールして、WebブラウザでSQL文を入力して試す方法も紹介しています。
  
- [XAMPP (macOS, Windows)](howto/install-xampp.md)  
すべてGUI操作でインストール可能（MariaDB）。手軽に試したい人向け  
XAMPPとはWeb環境用のプログラム開発やテストに使用するソフトウェアをまとめてインストールできるようにしたパッケージで、無償で入手できます。GUI操作のみで簡単にインストールできるというメリットがあります。データベースにはMariaDBが導入され、SQLの実行にはphpMyAdminが利用できます。phpMyAdminはXAMPP管理画面にあるMySQLの「Admin」より実行可能）が利用できます（MariaDBはMySQLを元に開発されており、XAMPPの管理画面には「MySQL」と表示されています）。
  
- [DBMSのみ（Windows）](howto/install-windows.md)  
Windows版のDBMSだけをインストール（MySQL 5.7、MySQL 8、MariaDB、PostgreSQL）、それぞれのコマンドラインクライアントでSQLを実行する（参考、コマンド操作に慣れている人向け）

#### 🚀おすすめルート🚀
**LinuxにMySQLとPostgreSQLを入れて試したい**  
1. [VirtualBox ＋ Ubuntu](howto/install-ubuntu.md)を参照してひととおりインストール
1. [サンプルデータ](#サンプルデータ)をダウンロード
1. [Adminer](howto/import-adminer.md)でサンプルデータをインポート

**GUIでさくっとインストールしてSQLを試したい**    
1. [XAMPP](howto/install-xampp.md)をインストール
1. [サンプルデータ](#サンプルデータ)をダウンロード
1. [phpMyAdminの場合](howto/import-phpmyadmin.md)でサンプルデータをインポート

<a id="sampledata" name="sampledata"></a>
## サンプルデータ
<a id="markdown-%E3%82%B5%E3%83%B3%E3%83%97%E3%83%AB%E3%83%87%E3%83%BC%E3%82%BF" name="%E3%82%B5%E3%83%B3%E3%83%97%E3%83%AB%E3%83%87%E3%83%BC%E3%82%BF"></a>

### 本書で使用するサンプルデータベース
<a id="markdown-%E6%9C%AC%E6%9B%B8%E3%81%A7%E4%BD%BF%E7%94%A8%E3%81%99%E3%82%8B%E3%82%B5%E3%83%B3%E3%83%97%E3%83%AB%E3%83%87%E3%83%BC%E3%82%BF%E3%83%99%E3%83%BC%E3%82%B9" name="%E6%9C%AC%E6%9B%B8%E3%81%A7%E4%BD%BF%E7%94%A8%E3%81%99%E3%82%8B%E3%82%B5%E3%83%B3%E3%83%97%E3%83%AB%E3%83%87%E3%83%BC%E3%82%BF%E3%83%99%E3%83%BC%E3%82%B9"></a>

サンプルデータベースおよびテスト用ユーザーの作成方法は、各テスト環境のページを参照してください。

|  データベース名  |  用途  |
| ---- | ---- |
| testdb |  第1章用のごく簡単なテストデータを登録するためのデータベース<br />※第2章のテーブルの作成と削除もこのデータベースでの実行を想定しています（本文参照）。 |
| sampledb | メインで使用する「フクロウ塾」のサンプルデータ、および、第6章で使用するサンプルデータ用のデータベース |
| sampledb2 | 第7章「ケーススタディ」で新たな定義を加えたフクロウ塾のサンプルデータ用のデータベース |

### 本書で使用するサンプルデータ
<a id="markdown-%E6%9C%AC%E6%9B%B8%E3%81%A7%E4%BD%BF%E7%94%A8%E3%81%99%E3%82%8B%E3%82%B5%E3%83%B3%E3%83%97%E3%83%AB%E3%83%87%E3%83%BC%E3%82%BF" name="%E6%9C%AC%E6%9B%B8%E3%81%A7%E4%BD%BF%E7%94%A8%E3%81%99%E3%82%8B%E3%82%B5%E3%83%B3%E3%83%97%E3%83%AB%E3%83%87%E3%83%BC%E3%82%BF"></a>

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

## 正誤表
<a id="markdown-%E6%AD%A3%E8%AA%A4%E8%A1%A8" name="%E6%AD%A3%E8%AA%A4%E8%A1%A8"></a>

| ページ | 内容 |
| ---- | ---- |
| 3.6(p.85) | 本文とサンプルでフィールド名に食い違いがありました（本文：標準単価、サンプル：在庫）。<br>本文「テーブルを作成した後に、❶「<del>標準価格</del><ins>在庫</ins>」という列の追加、（略）❸「<del>標準価格</del><ins>在庫</ins>」は0<del>円</del>以上となるような～」|
| 4.3(p.106) | 図4.8 2段目の表に誤りがありました。正しくは <a href="images/fig4-8.png">図（リンク）</a>の通りです。|
| 4.4(p.111) | 図4.11 「多値従属を取り除いて第4正規形にする（失敗例）」の6件目の仕入先が「S01」となっていますが、正しくは「S02」です（<a href="images/fig4-11.png">図</a>）。|

## 履歴
<a id="markdown-%E7%B7%A8%E9%9B%86%E5%B1%A5%E6%AD%B4" name="%E7%B7%A8%E9%9B%86%E5%B1%A5%E6%AD%B4"></a>

- 2020.10 サポートページ公開
- 2020.11.4 正誤表追加（図4.8, 図4.11）
- 2021.3.4 正誤表追加（p.85）

----
[基本がわかるSQL入門 <small>——データベース&設計の基礎から楽しく学ぶ</small> サポートページ](https://nisim-m.github.io/sqlbook/)
