[基本がわかるSQL入門 サポートページ](https://nisim-m.github.io/sqlbook/) ～テスト環境 その3～

<!-- TOC -->

1. [MySQL](#mysql)
   1. [インストール](#インストール)
   2. [コマンドラインクライアント（mysqlコマンド）の起動](#コマンドラインクライアントmysqlコマンドの起動)
   3. [データベースの作成（mysqlコマンド）](#データベースの作成mysqlコマンド)
2. [MariaDB](#mariadb)
   1. [インストール](#インストール-1)
   2. [データベースの作成（mysqlコマンド）](#データベースの作成mysqlコマンド-1)
3. [PostgreSQL](#postgresql)
   1. [インストール](#インストール-2)

<!-- /TOC -->

# DBMSのみ（Windows環境）

Windows版のDBMSだけをインストール（MySQL 5.7、MySQL 8、MariaDB、PostgreSQL）、それぞれのコマンド画面からSQLを実行（参考）

インストール時に、
- ポート番号を重複しないよう変更する
- テスト接続用のユーザーを追加（ユーザー名とパスワードを設定、Hostは`localhost`にする

インストールすると、スタートメニューにそれぞれのクライアントが登録される。

<a id="markdown-mysql" name="mysql"></a>
## MySQL

MySQLのダウンロードページ [https://www.mysql.com/jp/downloads/](https://www.mysql.com/jp/downloads/) より、「MySQL Cluster CGE」の下にある「[MySQL Community (GPL) Downloads »](https://dev.mysql.com/downloads/)」をクリックします。

続いて、[MySQL Installer for Windows](https://dev.mysql.com/downloads/installer/)をクリックします。

インストーラーは「mysql-installer-web-community」と「mysql-installer-community」の2種類です。

「mysql-installer-web-community」は、インストール実行中に必要なファイルをダウンロードします。
最新版（8.0.x）のMySQLサーバーの他、バージョン5.6やバージョン5.7を同時にインストールすることも可能です。

「mysql-installer-community」は、インストールに必要なファイルが入っているパッケージで、サイズが400MB以上あります。オフライン環境でインストールする場合や、複数のPCにインストールする場合はこちらがお奨めです。

「Download」ボタンをクリックすると、現在の公開元であるOracleのアカウントでログインまたはサインアップを促す画面が表示されます。

画面下部の「No thanks, just start my download.」をクリックするとダウンロードが始まります。

<a id="markdown-インストール" name="インストール"></a>
### インストール

上記でダウンロードしたファイルを実行し、画面に従ってインストールを進めます。

メモ：
- サーバーとコマンドラインクライアントだけで良い場合は「Custom」を使用
- 複数のバージョンを同時にインストールすることができる
- バージョンによっては別のソフトウェアが必要になる場合があるので、画面に表示されたら「Execute」でインストールする
- 複数バージョンをインストールする場合はバージョンごとにポート番号を変更する
- 各バージョンごとにテスト用ユーザーを追加する（同じ名前でも良い）

以下は`mysql-installer-web-community-8.0.21.0.msi`による実行例です。  
<a id="mysql-install" name="mysql-install"></a>[MySQLのインストールサンプル（Windows環境）](install-windows-mysql.md)

<a id="markdown-コマンドラインクライアントmysqlコマンドの起動" name="コマンドラインクライアントmysqlコマンドの起動"></a>
### コマンドラインクライアント（mysqlコマンド）の起動

MySQLサーバーをインストールすると、コマンドラインクライアント（mysql.exe）がインストールされます。  
コマンドラインクライアントは、スタートメニューの「MySQL」グループから起動することができます。  
<a href="images/2020-09-30-20-51-29.png"><img src="images/2020-09-30-20-51-29.png" width="500" /></a>

クライアントを実行すると「Enter password:」と表示されるので、
インストール時に設定したテスト用ユーザーのパスワードを入力してEnterして接続してください。
接続できると「mysql>」というプロンプトが表示されます。ここで、SQL文を入力して実行します。

実行画面およびプロンプトは各バージョン共通です。  
バージョン8.0.x：  
<a href="images/2020-09-30-20-58-11.png"><img src="images/2020-09-30-20-58-11.png" width="600" /></a>

バージョン5.7.x：  
<a href="images/2020-09-30-20-57-43.png"><img src="images/2020-09-30-20-57-43.png" width="600" /></a>

<a id="markdown-データベースの作成mysqlコマンド" name="データベースの作成mysqlコマンド"></a>
### データベースの作成（mysqlコマンド）

スタートメニューで「MySQL 8.0 Command Line Client - Unicode」を実行するとmysqlコマンド（mysql.exe）が起動し、`mysql>`というプロンプトが表示されるので、以下のコマンドを実行します。

コピー＆ペーストでも実行できます。この場合、7行まとめて選択してコピーし、プロンプト（`mysql>`）で右クリックしてペーストします。
一度実行した内容は、上下矢印キーで再度表示し、左右の矢印キーでカーソルを動かして編集することもできます。  

```
-- サンプルデータベース用のデータベース3つを作成
CREATE DATABASE testdb default character set utf8mb4;
CREATE DATABASE sampledb default character set utf8mb4;
CREATE DATABASE sampledb2 default character set utf8mb4;

--確認（MySQLで管理しているデータベースが一覧表示される）
SHOW DATABASES; 
```

実行イメージ  
<a href="images/2020-10-01-01-04-54.png"><img src="images/2020-10-01-01-04-54.png" /></a>

<a id="markdown-mariadb" name="mariadb"></a>
## MariaDB 

※準備中
MariaDBのダウンロードページ [https://mariadb.com/downloads/](https://mariadb.com/downloads/) より、「MariaDB Platform」の「MariaDB Community Server」で「Version」と「OS」を選択して「Download」をクリックします。

さまざまなバージョンが公開されていますが、通常は、最新版良いでしょう。なお、「Show All Files」で、選択肢に出ていないOSやバージョンのファイルもダウンロードできます。

<a id="markdown-インストール-1" name="インストール-1"></a>
### インストール

上記でダウンロードしたファイルを実行し、画面に従ってインストールを進めます。

<a id="markdown-データベースの作成mysqlコマンド-1" name="データベースの作成mysqlコマンド-1"></a>
### データベースの作成（mysqlコマンド）

MariaDBのコマンドラインクライアントもmysqlコマンド（mysql.exe）です。使い方も同じです。


<a id="markdown-postgresql" name="postgresql"></a>
## PostgreSQL

※準備中
日本PostgreSQLユーザー会のダウンロードページ [https://www.postgresql.jp/download](https://www.postgresql.jp/download) にダウンロードリンクとインストールガイドが掲載されています。Windows用のダウンロードリンク（[https://www.postgresql.org/download/windows/](https://www.postgresql.org/download/windows/)）で「Download the installer」をクリックし、「Download」をクリックします。

さまざまなバージョンが公開されていますが、通常は、最新版が良いでしょう。

<a id="markdown-インストール-2" name="インストール-2"></a>
### インストール

上記でダウンロードしたファイルを実行し、画面に従ってインストールを進めます。


[→サンプルデータ](../index.md#sampledata)

----
[基本がわかるSQL入門 <small>——データベース&設計の基礎から楽しく学ぶ</small> サポートページ](https://nisim-m.github.io/sqlbook/)
