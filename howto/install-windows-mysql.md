[基本がわかるSQL入門 サポートページ](https://nisim-m.github.io/sqlbook/) 

## MySQLのインストール（Windows環境）
テスト環境 その3 [DBMSのみ（Windows）](install-windows.md#mysql-install)より  
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

バージョンによっては追加ソフトウェア（Microsoft Visual C++のライブラリ）が必要になることがあります。
**「Execute」をクリック**することでインストールできます。  
<a href="images/2020-09-30-19-48-26.png"><img src="images/2020-09-30-19-48-26.png" width="400" /></a>

（Microsoft Visual C++ 2013 ※MySQL 5.7用）  
<a href="images/2020-09-30-19-49-45.png"><img src="images/2020-09-30-19-49-45.png" width="300" /></a>
<a href="images/2020-09-30-19-49-54.png"><img src="images/2020-09-30-19-49-54.png" width="300" /></a>

追加ソフトウェアのインストールが完了したら「Next」をクリック  
<a href="images/2020-09-30-19-50-26.png"><img src="images/2020-09-30-19-50-26.png" width="400" /></a>

「Read to download」と表示されたら「Execute」をクリック  
<a href="images/2020-09-30-19-51-55.png"><img src="images/2020-09-30-19-51-55.png" width="400" /></a>

ダウンロード開始  
<a href="images/2020-09-30-19-56-59.png"><img src="images/2020-09-30-19-56-59.png" width="400" /></a>

※ダウンロードできなかった場合「Error」と表示されるので「Try again」をクリック  
<a href="images/2020-09-30-20-00-19.png"><img src="images/2020-09-30-20-00-19.png" width="400" /></a>

ダウンロードが終わると「Complete」と表示されるので「Next」で進める  
<a href="images/2020-09-30-19-54-04.png"><img src="images/2020-09-30-19-54-04.png" width="400" /></a>

「Ready to configure」と表示されるので「Next」で設定を開始する  
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

デフォルトでは、Windows起動時にMySQLサーバーがWindowsサービスとして起動する（変更可能、実行状態はタスクマネージャーの詳細→サービスで確認できる）  
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

→ テスト環境 その3 [DBMSのみ（Windows）](install-windows.md#mysql-install)に戻る

----
[基本がわかるSQL入門 <small>——データベース&設計の基礎から楽しく学ぶ</small> サポートページ](https://nisim-m.github.io/sqlbook/)