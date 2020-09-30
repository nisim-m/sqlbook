[基本がわかるSQL入門 サポートページ](https://nisim-m.github.io/sqlbook/) ～テスト環境 その3～

※準備中※

<!-- TOC -->

1. [MySQL](#mysql)
   1. [インストール](#インストール)
   2. [コマンドラインクライアント（mysqlコマンド）の起動](#コマンドラインクライアントmysqlコマンドの起動)
   3. [データベースの作成](#データベースの作成)
2. [MariaDB](#mariadb)
   1. [インストール](#インストール-1)
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

<a href="images/2020-09-30-19-41-00.png"><img src="images/2020-09-30-19-41-00.png" width="300" /></a>
<a href="images/2020-09-30-19-43-33.png"><img src="images/2020-09-30-19-43-33.png" width="300" /></a>  
<a href="images/2020-09-30-23-51-24.png"><img src="images/2020-09-30-23-51-24.png" width="400" /></a>
<a href="images/2020-09-30-19-43-49.png"><img src="images/2020-09-30-19-43-49.png" width="300" /></a>

アップデートのメッセージが出ていた場合は「OK」をクリック
<a href="images/2020-09-30-19-44-03.png"><img src="images/2020-09-30-19-44-03.png" width="300" /></a>

サーバーだけで良い場合や複数バージョンをインストールしたい場合は「Custom」を選択  
<a href="images/2020-09-30-19-44-25.png"><img src="images/2020-09-30-19-44-25.png" width="400" /></a>
サーバーを選んで右矢印をクリックして追加  
<a href="images/2020-09-30-19-45-43.png"><img src="images/2020-09-30-19-45-43.png" width="400" /></a>
（他のバージョンが必要な場合は追加）  
<a href="images/2020-09-30-19-46-49.png"><img src="images/2020-09-30-19-46-49.png" width="400" /></a>

必要なバージョンが選択できたら「Next」をクリック（後で追加することも可能）
<a href="images/2020-09-30-19-47-55.png"><img src="images/2020-09-30-19-47-55.png" width="400" /></a>

バージョンによっては追加ソフトウェア（Microsoft Visual C++のライブラリ）が必要になることがあります。**「Execute」**をクリックすることでインストールできます。
<a href="images/2020-09-30-19-48-26.png"><img src="images/2020-09-30-19-48-26.png" width="400" /></a>
（Microsoft Visual C++ 2013 ※MySQL 5.7用）
<a href="images/2020-09-30-19-49-45.png"><img src="images/2020-09-30-19-49-45.png" width="300" /></a>
<a href="images/2020-09-30-19-49-54.png"><img src="images/2020-09-30-19-49-54.png" width="300" /></a>

<a href="images/2020-09-30-19-50-26.png"><img src="images/2020-09-30-19-50-26.png" width="400" /></a>

「Read to download」と表示されたら「Execute」をクリック  
<a href="images/2020-09-30-19-51-55.png"><img src="images/2020-09-30-19-51-55.png" width="400" /></a>
ダウンロード開始  
<a href="images/2020-09-30-19-56-59.png"><img src="images/2020-09-30-19-56-59.png" width="400" /></a>

※ダウンロードできなかった場合「Error」と表示されるので「Try again」をクリック  
<a href="images/2020-09-30-20-00-19.png"><img src="images/2020-09-30-20-00-19.png" width="400" /></a>

ダウンロードが終わると「Complete」と表示されるので「Next」で進める
<a href="images/2020-09-30-19-54-04.png"><img src="images/2020-09-30-19-54-04.png" width="400" /></a>
<a href="images/2020-09-30-19-54-53.png"><img src="images/2020-09-30-19-54-53.png" width="400" /></a>

「Type and Networking」画面で**ポート番号を設定**する  
複数バージョンをインストールする場合は、バージョン毎にポート番号を変えておく（1024から49451の範囲で指定、デフォルトは3306）  
<a href="images/2020-09-30-20-20-02.png"><img src="images/2020-09-30-20-20-02.png" width="400" /></a>

管理者用のパスワードを入力し、「Add User」でテスト用のユーザーを追加する  
<a href="images/2020-09-30-20-26-53.png"><img src="images/2020-09-30-20-26-53.png" width="400" /></a>
ユーザー名を入力（任意、ここでは「study」）して、ホストは「localhost」にする  
データベースの作成やデータのインポートを行うユーザーの場合、ロールは「DB Admin」にする  
パスワードを入力して「OK」をクリック（自分専用のローカルPCで使用する場合は簡単なパスワードでも良い）   
<a href="images/2020-09-30-21-36-11.png"><img src="images/2020-09-30-21-36-11.png" width="250" /></a>
ユーザーを追加したら「Next」で進める  
<a href="images/2020-09-30-20-31-56.png"><img src="images/2020-09-30-20-31-56.png" width="400" /></a>
デフォルトでは、Windows起動時にMySQLサーバーがWindowsサービスとして起動する（変更可能）  
<a href="images/2020-09-30-20-33-15.png"><img src="images/2020-09-30-20-33-15.png" width="400" /></a>
「Execute」でインストールを実行（設定を修正したい場合は「Back」で戻る）  
<a href="images/2020-09-30-20-33-49.png"><img src="images/2020-09-30-20-33-49.png" width="400" /></a>
<a href="images/2020-09-30-20-34-15.png"><img src="images/2020-09-30-20-34-15.png" width="400" /></a>

複数バージョンをインストールする場合は「Product Configuration」が再度表示されるので「Next」をクリック  
<a href="images/2020-09-30-20-34-43.png"><img src="images/2020-09-30-20-34-43.png" width="400" /></a>
同様に設定を行う  
<a href="images/2020-09-30-20-37-03.png"><img src="images/2020-09-30-20-37-03.png" width="400" /></a>
MySQL 8.0の場合、「Authentication Method」画面が表示される  
通常は新しい認証方式（デフォルト）を使用。他システム（Microsoft Accessなど）と組み合わせて使用したい場合など、状況によっては古い認証方式にするケースがある（※本ページでは扱っていません）  
<a href="images/2020-09-30-20-37-44.png"><img src="images/2020-09-30-20-37-44.png" width="400" /></a>

サーバー管理者用のパスワードを設定し、テスト用のユーザーを追加する  
<a href="images/2020-09-30-20-39-38.png"><img src="images/2020-09-30-20-39-38.png" width="400" /></a>
<a href="images/2020-09-30-20-41-38.png"><img src="images/2020-09-30-20-41-38.png" width="250" /></a>
<a href="images/2020-09-30-20-43-43.png"><img src="images/2020-09-30-20-43-43.png" width="400" /></a>
<a href="images/2020-09-30-20-45-25.png"><img src="images/2020-09-30-20-45-25.png" width="400" /></a>
<a href="images/2020-09-30-20-45-50.png"><img src="images/2020-09-30-20-45-50.png" width="400" /></a>
<a href="images/2020-09-30-20-46-18.png"><img src="images/2020-09-30-20-46-18.png" width="400" /></a>
<a href="images/2020-09-30-20-47-06.png"><img src="images/2020-09-30-20-47-06.png" width="400" /></a>

完了すると「Installation Complete」と表示されるので「Finish」をクリック
<a href="images/2020-09-30-20-47-36.png"><img src="images/2020-09-30-20-47-36.png" width="400" /></a>

<a id="markdown-コマンドラインクライアントmysqlコマンドの起動" name="コマンドラインクライアントmysqlコマンドの起動"></a>
### コマンドラインクライアント（mysqlコマンド）の起動

コマンドラインクライアントはスタートメニューの「MySQL」グループから起動する
<a href="images/2020-09-30-20-51-29.png"><img src="images/2020-09-30-20-51-29.png" width="500" /></a>

クライアントを実行すると「Enter password:」と表示されるので
テスト用ユーザーのパスワードを入力してEnterして接続  
「mysql>」というパスワードが表示されるので、SQL文を入力する

実行画面およびプロンプトは各バージョン共通  
バージョン8.0.x：  
<a href="images/2020-09-30-20-58-11.png"><img src="images/2020-09-30-20-58-11.png" width="600" /></a>

バージョン5.7.x：  
<a href="images/2020-09-30-20-57-43.png"><img src="images/2020-09-30-20-57-43.png" width="600" /></a>

<a id="markdown-データベースの作成" name="データベースの作成"></a>
### データベースの作成

スタートメニューで「MySQL 8.0 Command Line Client - Unicode」を実行するとmysqlコマンド（mysql.exe）が起動し、`mysql>`というプロンプトが表示されるので、以下のコマンドを実行します。

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
