# chat-app

# hackathon-begginers-sample
ハッカソンの初級者コース用のChatAppです。

**最初に環境変数ファイル（.env）を作成します**
- Mac、Windows(PowerShell、Git Bash)の場合
```
cp .env.example .env
```
- Windows(コマンドプロンプト)の場合
```
copy .env.example .env
```

**起動方法**
1. イメージのビルド

```.sh
docker compose build
```
- `docker-compose.yml`の内容に従って、コンテナイメージをビルドします。
- 初回または依存パッケージを更新したときに実行してください。

2. コンテナの起動

```.sh
docker compose up
```
- コンテナを起動します。
- `-d`オプションをつけるとバックグラウンドで起動します

停止したいときは`Ctrl + C`または以下のコマンドを使ってください：
```.sh
docker compose down
```

**ブラウザで確認**
```
http://localhost:55000
```


### ディレクトリ構成
```
.
├── ChatApp              # サンプルアプリ用ディレクトリ
│   ├── __init__.py
│   ├── app.py
│   ├── models.py
│   ├── static          # 静的ファイル用ディレクトリ
│   ├── templates       # Template(HTML)用ディレクトリ
│   └── util
├── Docker
│   ├── Flask
│   │   └── Dockerfile # Flask(Python)用Dockerファイル
│   └── MySQL
│       ├── Dockerfile  # MySQL用Dockerファイル
│       ├── init.sql    # MySQL初期設定ファイル
│       └── my.cnf
├── .env.example         # 環境変数ファイル（.env）を作成する為のサンプルファイル
├── docker-compose.yml   # Docker-composeファイル
└── requirements.txt     # 使用モジュール記述ファイル
```
