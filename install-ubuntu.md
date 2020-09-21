[基本がわかるSQL入門 ——データベース&設計の基礎から楽しく学ぶ サポートページ](https://nisim-m.github.io/sqlbook/) ～テスト環境 その1～
# VirtualBox + Ubuntu

## VirtualBoxの設定とゲストOS（Ubuntu）のインストール

### 1. ファイルのダウンロード

#### (1) VirtualBox
https://www.virtualbox.org/wiki/Downloads  
**VirtualBox xx.xx.xx platform packages**にOS別のダウンロードリンクがあるので、
VistualBoxをインストールするOS（ホストOS）に合ったインストーラーをダウンロードしてください。

- Windows … Windows hosts
- macOS … OS X hosts
- Linux … Linux distributions

※ここでは、Windows版を使用。

#### (2) UbunutuのISOイメージ
https://www.ubuntulinux.jp/download  

※ここでは、「日本語 Remix イメージのダウンロード」より、Ubuntu 20.04.1 LTS（`ubuntu-ja-20.04.1-desktop-amd64.iso`）を使用。

### 2. VirtualBoxのインストール

VirtualBoxのインストーラーを実行し、画面に従ってインストールを行ってください。

### 3. 仮想マシンの作成

VirtualBoxを実行し、`仮想マシン(M)`→`新規(N)`で仮想マシンを作成します（作成および設定後、仮想マシンにゲストOSをインストールします）。

#### (1) 名前とオペレーションシステムを入力して`次へ(N)`をクリック

- 名前 … 任意
- マシンフォルダー … 仮想マシンを保存する場所（任意）
- タイプ … Linux
- バージョン … Ubuntu (64-bit)

※仮想マシンに`Ubuntu`を含んだ名前を付けると、タイプとバージョンが自動で設定される.

<a href="images/2020-09-22-05-54-01.png"><img src="images/2020-09-22-05-54-01.png" height="250" /></a>

#### (2) メモリーサイズを入力して`次へ(N)`をクリック

ゲストOSに割り当てるメモリーのサイズを入力します。たくさん割り当てることでゲストOSが快適に動作するようになりますが、その分、ホストOSの動作が犠牲になります。  
本書のサンプルを実行する場合、1024～2048MB程度で問題ありません。

<a href="images/2020-09-22-05-56-32.png"><img src="images/2020-09-22-05-56-32.png" height="250" /></a>

#### (3) ハードディスクの作成

1. `仮想ハードディスクを作成する(C)`（デフォルト）を選んで`作成`をクリック
1. `VDI(VirtualBox Disk Image)`（デフォルト）を選んで`次へ(N)`をクリック
1. `可変サイズ(D)`（デフォルト）を選んで`次へ(N)`をクリック
1. サイズを入力して`作成`をクリック
本書のサンプル程度であれば、デフォルトの10GBで十分実行できますが、他の操作なども試してみたい場合はもう少し大きくしておく方が扱いやすいでしょう。なお、「可変サイズ」を選択している場合、ホストOSのディスクを消費するのはゲストOSで実際に使用した分のみです。  
（ここで紹介しているソフトウェアおよびサンプルデータをインストールした状態で約7.5GB弱のディスクを使用します）

<a href="images/2020-09-22-05-57-21.png"><img src="images/2020-09-22-05-57-21.png" height="250" /></a>
<a href="images/2020-09-22-05-58-21.png"><img src="images/2020-09-22-05-58-21.png" height="250" /></a>
<a href="images/2020-09-22-05-58-44.png"><img src="images/2020-09-22-05-58-44.png" height="250" /></a>
<a href="images/2020-09-22-05-59-03.png"><img src="images/2020-09-22-05-59-03.png" height="250" /></a>

#### (4) グラフィックコントローラーの設定（`設定`→`ディスプレイ`）

ホストOSがWindowsの場合、ゲストOSにUbunutuのGUI環境をインストールすると起動時にエラーが出ることがあります（VirtualBox バージョン6.1.14）。  
グラフィックスコントローラーを変更しておくことで、この問題を回避できます。

`設定(S)`をクリックし、`ディスプレイ`画面の`グラフィックスコントローラー`を`VBoxSVGA`に変更

<a href="images/2020-09-22-05-59-25.png"><img src="images/2020-09-22-05-59-25.png" height="300" /></a>
<a href="images/2020-09-22-05-59-37.png"><img src="images/2020-09-22-05-59-37.png" height="300" /></a>

#### (5) ホストOSから接続するための設定

ホストOSからゲストOSのDBMSに接続してSQLを入力して実行したい場合は、下記を設定しておきます。

ネットワーク：NAT（デフォルト）  
ネットワークアダプターを有効化にチェックマーク（デフォルト）  

`高度`→`ポートフォワーディング(P)`で以下を設定
- Webブラウザ用（http）… ホストポート 8080、ゲストポート 80
- コマンドライン用（ssh）… ホストポート 2222、ゲストポート 22

<a href="images/2020-09-22-05-59-56.png"><img src="images/2020-09-22-05-59-56.png" height="300" /></a>
<a href="images/2020-09-22-06-00-18.png"><img src="images/2020-09-22-06-00-18.png" height="300" /></a>

#### (6) `起動`でUbuntuのISOイメージを選択してUbuntuのインストーラーを起動

`起動ハードディスクを選択`という画面が表示されるので、UbuntuのISOイメージを選択して`起動`をクリックします。

<a href="images/2020-09-22-06-01-04.png"><img src="images/2020-09-22-06-01-04.png" height="250" /></a>
<a href="images/2020-09-22-06-00-47.png"><img src="images/2020-09-22-06-00-47.png" height="300" /></a>

#### (7) Ubuntuのインストーラーが起動するので、画面に従ってインストールを実行

<a href="images/2020-09-22-06-01-35.png"><img src="images/2020-09-22-06-01-35.png" height="300" /></a>
<a href="images/2020-09-22-06-01-49.png"><img src="images/2020-09-22-06-01-49.png" height="300" /></a>
<a href="images/2020-09-22-06-03-13.png"><img src="images/2020-09-22-06-03-13.png" height="300" /></a>
<a href="images/2020-09-22-06-03-25.png"><img src="images/2020-09-22-06-03-25.png" height="300" /></a>
<a href="images/2020-09-22-06-03-49.png"><img src="images/2020-09-22-06-03-49.png" height="300" /></a>
<a href="images/2020-09-22-06-04-05.png"><img src="images/2020-09-22-06-04-05.png" height="300" /></a>
<a href="images/2020-09-22-06-04-21.png"><img src="images/2020-09-22-06-04-21.png" height="300" /></a>
<a href="images/2020-09-22-06-04-41.png"><img src="images/2020-09-22-06-04-41.png" height="300" /></a>
<a href="images/2020-09-22-06-04-53.png"><img src="images/2020-09-22-06-04-53.png" height="300" /></a>
<a href="images/2020-09-22-06-05-09.png"><img src="images/2020-09-22-06-05-09.png" height="300" /></a>
<a href="images/2020-09-22-06-05-25.png"><img src="images/2020-09-22-06-05-25.png" height="300" /></a>

#### (8) Ubuntuが起動するのでインストールの続きとアップデートを実行

<a href="images/2020-09-22-06-05-41.png"><img src="images/2020-09-22-06-05-41.png" height="300" /></a>
<a href="images/2020-09-22-06-05-53.png"><img src="images/2020-09-22-06-05-53.png" height="300" /></a>
<a href="images/2020-09-22-06-06-04.png"><img src="images/2020-09-22-06-06-04.png" height="300" /></a>
<a href="images/2020-09-22-06-06-15.png"><img src="images/2020-09-22-06-06-15.png" height="300" /></a>
<a href="images/2020-09-22-06-06-26.png"><img src="images/2020-09-22-06-06-26.png" height="300" /></a>
<a href="images/2020-09-22-06-06-40.png"><img src="images/2020-09-22-06-06-40.png" height="300" /></a>
<a href="images/2020-09-22-06-06-52.png"><img src="images/2020-09-22-06-06-52.png" height="300" /></a>
<a href="images/2020-09-22-06-07-03.png"><img src="images/2020-09-22-06-07-03.png" height="300" /></a>
<a href="images/2020-09-22-06-07-18.png"><img src="images/2020-09-22-06-07-18.png" height="300" /></a>

再起動したらログインし、Guest Additions のインストールを行います。
Guest AdditionsはVirtualBoxのゲストOS専用のソフトウェアで、インストールすることでゲストOSの画面が見やすくなったり、ゲストOSとホストOSでコピー＆ペーストができるようになるなど、操作性が向上します。

<a href="images/2020-09-22-06-08-30.png"><img src="images/2020-09-22-06-08-30.png" height="300" /></a>
<a href="images/2020-09-22-06-08-47.png"><img src="images/2020-09-22-06-08-47.png" height="300" /></a>
<a href="images/2020-09-22-06-08-57.png"><img src="images/2020-09-22-06-08-57.png" height="300" /></a>


>This system is currently not set up to build kernel modules.
>Please install the gcc make perl packages from your distribution.
というメッセージが出ている場合は、必要なコマンド類を別途インストールしてからあらためてGuest Additions をインストールしてください。
[メッセージが出ていない場合は](#ga_install_completed)、Guest Additions のインストールメディアを取り出して再起動します。

<a href="images/2020-09-22-06-09-14.png"><img src="images/2020-09-22-06-09-14.png" height="300" /></a>

コマンド入力のために`端末`を起動する。

<a href="images/2020-09-22-06-11-13.png"><img src="images/2020-09-22-06-11-13.png" height="300" /></a>
<a href="images/2020-09-22-06-11-26.png"><img src="images/2020-09-22-06-11-26.png" height="300" /></a>

以下のコマンドを実行、パスワードを入力して［Enter］
```
sudo apt install gcc make perl
```

<a href="images/2020-09-22-06-12-09.png"><img src="images/2020-09-22-06-12-09.png" height="300" /></a>

（確認メッセージが表示されるので［Enter］）

<a href="images/2020-09-22-06-13-46.png"><img src="images/2020-09-22-06-13-46.png" height="300" /></a>
<a href="images/2020-09-22-06-14-19.png"><img src="images/2020-09-22-06-14-19.png" height="300" /></a>

（メディアのアイコンから`ソフトウェアの実行`）

<a href="images/2020-09-22-06-15-28.png"><img src="images/2020-09-22-06-15-28.png" height="300" /></a>
<a href="images/2020-09-22-06-15-42.png"><img src="images/2020-09-22-06-15-42.png" height="300" /></a>
<a href="images/2020-09-22-06-15-54.png"><img src="images/2020-09-22-06-15-54.png" height="300" /></a>

<a name="ga_install_completed">（Guest Additionsがインストールできた）</a>

<a href="images/2020-09-22-06-16-06.png"><img src="images/2020-09-22-06-16-06.png" height="300" /></a>

（メディアを取り出して再起動）

<a href="images/2020-09-22-06-21-24.png"><img src="images/2020-09-22-06-21-24.png" height="300" /></a>
<a href="images/2020-09-22-06-21-55.png"><img src="images/2020-09-22-06-21-55.png" height="300" /></a>
<a href="images/2020-09-22-06-22-10.png"><img src="images/2020-09-22-06-22-10.png" height="300" /></a>

### Ubuntuの設定

Guest Additions をインストールして再起動したら、必要に応じ、画面のサイズなどを設定する。

#### 画面の解像度変更
<a href="images/2020-09-22-06-23-13.png"><img src="images/2020-09-22-06-23-13.png" height="300" /></a>
<a href="images/2020-09-22-06-23-27.png"><img src="images/2020-09-22-06-23-27.png" height="300" /></a>

#### クリップボードの共有

ゲストOSとホストOSの間で、文字列のコピーなどを行えるようにする。  

たとえば、ホストOSのWebブラウザで本ページを表示している場合、「ホストOSからゲストOSへ」（または「双方向」）を設定することで、Webブラウザに表示されているコマンド文字列を、端末に貼り付ける（端末で右クリック→貼り付け）ことができるようになります。  
端末に表示されているエラーメッセージなどを検索したい場合は、「ゲストOSからホストOSSへ」（または「双方向」）を設定しておくことで、マウスで端末の文字列を範囲選択して右クリック→コピーでコピーし、ホストOSのWebブラウザで検索するようなことができるようになります。

<a href="images/2020-09-22-06-24-21.png"><img src="images/2020-09-22-06-24-21.png" height="350" /></a>

