[基本がわかるSQL入門 サポートページ](https://nisim-m.github.io/sqlbook/) 
# サンプルデータのインポート（Adminer）

事前に、[サンプルデータのファイル（*.sql）をダウンロード](/#sampledata)しておいてください。ここでは、testdb.sqlを使用します。

以下のURLでAdminerを開き、左ペインでデータベースを選択してから、「インポート」をクリックし、ファイルを選択して「実行」ボタンをクリックします。

| 設定項目 | 値<small>（デフォルト設定と共通）</small> |
| ---- | ---- |
| ファイルの文字セット | utf-8 |
| フォーマット | SQL |

- [VirtualBox](install-ubuntu.md)環境：
    - ゲストOSの場合  
    http://localhost/adminer.php  
    - ホストOSの場合  
    http://localhost:8080//adminer.php  
- [XAMPP](install-xampp.md)環境：  
    - http://localhost:8080//adminer.php  

データのインポート  
<a href="images/2020-09-30-15-47-37.png"><img src="images/2020-09-30-15-47-37.png" width="600" /></a>
<a href="images/2020-09-30-15-49-10.png"><img src="images/2020-09-30-15-49-10.png" width="600" /></a>

実行結果  
<a href="images/2020-09-30-15-50-06.png"><img src="images/2020-09-30-15-50-06.png" width="600" /></a>
<a href="images/2020-09-30-15-54-20.png"><img src="images/2020-09-30-15-54-20.png" width="600" /></a>

----
[基本がわかるSQL入門 <small>——データベース&設計の基礎から楽しく学ぶ</small> サポートページ](https://nisim-m.github.io/sqlbook/)
