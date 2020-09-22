[基本がわかるSQL入門 ——データベース&設計の基礎から楽しく学ぶ サポートページ](https://nisim-m.github.io/sqlbook/) ～テスト環境 その2～
# XAMPP (macOS, Windows)

## ダウンロード

https://www.apachefriends.org/jp/download.html からインストーラーをダウンロードする。
PHPのバージョンに合わせて複数のバージョンが公開されているが、通常は最新版で良い。

ダウンロードしたファイルを実行し、画面に従ってインストールする。

### テスト用のユーザーおよびサンプル用データベースの作成

DBMSはMariaDBがインストールされる。
MariaDBはMySQLから派生する形で開発されたDBMSで、XAMPPの画面でも「MySQL」と表示されているが、管理画面であるphpMyAdminでMariaDBであることがわかる。
ターミナルで使用するクライアントコマンドも、MySQLと同じ名前の`mysql`コマンドを使用。

ユーザーおよびデータベースの追加はphpMyAdminで行う。
ホスト名は「ローカル」、認証は「ネイティブMySQL認証」


## macOS環境の場合

「XAMPP-VM stack manager」という管理プログラムと「XAMPP-VM」という仮想環境がインストールされる
仮想環境はLinuxで構築されており、ターミナルを実行するとプロンプトにDebianと表示される。


アプリケーションの「XAMPP」を実行
「General」タブでStartをクリックし、Statusの表示がグリーンになってIPアドレスが表示されたら
ApacheやMySQL（MariaDB）の停止や再起動は「Service」タブで行う。

### Adminerを追加するには

XAMPPの「Open Terminal」メニューでターミナルを開き、`wget`コマンドでファイルをダウンロードして`/opt/lamp/htdocs`に`adminer.php`という名前で移動する。

```
wget https://github.com/vrana/adminer/releases/download/v4.7.7/adminer-4.7.7.php
sudo mv adminer-4.7.7.php /opt/lamp/htdocs/adminer.php
```

## Windows環境の場合

