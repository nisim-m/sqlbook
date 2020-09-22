[基本がわかるSQL入門 サポートページ](https://nisim-m.github.io/sqlbook/) ～テスト環境 その3～

※準備中※

# DBMSのみ（Windows環境）

Windows版のDBMSだけをインストール（MySQL 5.7、MySQL 8、MariaDB、PostgreSQL）、それぞれのコマンド画面からSQLを実行（参考）

インストール時に、
- ポート番号を重複しないよう変更する
- テスト接続用のユーザーを追加（ユーザー名とパスワードを設定、Hostは`localhost`にする

インストールすると、スタートメニューにそれぞれのクライアントが登録される。

## MySQL

MySQLのダウンロードページ [https://www.mysql.com/jp/downloads/](https://www.mysql.com/jp/downloads/) より、「MySQL Cluster CGE」の下にある「[MySQL Community (GPL) Downloads »](https://dev.mysql.com/downloads/)」をクリックします。

続いて、[MySQL Installer for Windows](https://dev.mysql.com/downloads/installer/)をクリックします。

インストーラーは2種類あります。

「mysql-installer-web-community」は、インストール実行中に必要なファイルをダウンロードします。インターネットに接続できる環境でインストールを実行するのであればこちらがお奨めです。

「mysql-installer-community」は、インストールに必要なファイルが入っているパッケージで、サイズが400MB以上あります。オフライン環境でインストールする場合や、複数のPCにインストールする場合はこちらがお奨めです。

「Download」ボタンをクリックすると、現在の開発・公開元であるOracleのアカウントでログインまたはサインアップを促す画面が表示されます。

画面下部の「No thanks, just start my download.」をクリックするとダウンロードが始まります。

### インストール

上記でダウンロードしたファイルを実行し、画面に従ってインストールを進めます。

以下は`mysql-installer-web-community-8.0.21.0.msi`による実行例です。

#### ユーザの追加
#### ポート番号

### クライアント


## MariaDB

MariaDBのダウンロードページ [https://mariadb.com/downloads/](https://mariadb.com/downloads/) より、「MariaDB Platform」の「MariaDB Community Server」で「Virsion」と「OS」を選択して「Download」をクリックします。

さまざまなバージョンが公開されていますが、通常は、最新版で問題ありません。なお、「Show All Files」で、選択肢に出ていないOSやバージョンのファイルもダウンロードできます。

### インストール

上記でダウンロードしたファイルを実行し、画面に従ってインストールを進めます。




----
[基本がわかるSQL入門 <small>——データベース&設計の基礎から楽しく学ぶ</small> サポートページ](https://nisim-m.github.io/sqlbook/)
