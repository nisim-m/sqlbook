[基本がわかるSQL入門 サポートページ](https://nisim-m.github.io/sqlbook/) 

## MariaDBのインストール（Windows環境）
テスト環境 その3 [DBMSのみ（Windows）](install-windows.md#mariadb-install)より  
以下は`mariadb-10.5.5-winx64.msi`による実行例です。

インストーラーが起動するので「Next」をクリック  
<a href="images/2020-10-01-13-41-04.png"><img src="images/2020-10-01-13-41-04.png" width="400" /></a>

ライセンスに合意して「Next」をクリック  
<a href="images/2020-10-01-13-42-35.png"><img src="images/2020-10-01-13-42-35.png" width="400" /></a>

セットアップ内容を確認して「Next」をクリック（デフォルトのままで良い）  
<a href="images/2020-10-01-13-43-07.png"><img src="images/2020-10-01-13-43-07.png" width="400" /></a>

※参考（データベースサーバーだけで良い場合）  
<a href="images/2020-10-01-13-44-05.png"><img src="images/2020-10-01-13-44-05.png" width="400" /></a>

データベース管理者（root）のパスワードを入力、「Use UTF8…」を有効にして「Next」をクリック  
<a href="images/2020-10-01-13-44-59.png"><img src="images/2020-10-01-13-44-59.png" width="400" /></a>

必要に応じ、**ポート番号を変更**する  
MySQLサーバーなどと共存させたい場合は、異なるポート番号にする（1024から49451の範囲で指定、デフォルトは3306）  
デフォルトではMariaDBサーバーがWindowsサービスとして起動する（実行状態はタスクマネージャーの詳細→サービスで確認、同画面の「サービス管理ツールを開く」で自動起動の設定を変更できる）  
<a href="images/2020-10-01-13-49-09.png"><img src="images/2020-10-01-13-49-09.png" width="400" /></a>

「Install」でインストールが開始される    
<a href="images/2020-10-01-13-55-45.png"><img src="images/2020-10-01-13-55-45.png" width="400" /></a>
<a href="images/2020-10-01-13-56-20.png"><img src="images/2020-10-01-13-56-20.png" width="400" /></a>
<a href="images/2020-10-01-13-57-12.png"><img src="images/2020-10-01-13-57-12.png" width="400" /></a>

→ テスト環境 その3 [DBMSのみ（Windows）](install-windows.md#mariadb-install)に戻る

----
[基本がわかるSQL入門 <small>——データベース&設計の基礎から楽しく学ぶ</small> サポートページ](https://nisim-m.github.io/sqlbook/)