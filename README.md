# Baukis2 - 顧客管理システム

## 説明

Baukis2は企業向けの顧客管理システム（Ruby on Rails 学習用サンプル）です。

## システム環境

 * Ubuntu 18.04
 * Ruby 2.6.4
 * PostgreSQL 11.2
 * Rails 6

## 設定ファイル等の取得

```
% git clone https://github.com/oiax/rails6-compose.git
% cd rails6-compose
```

## コンテナ群の構築


```
% ./setup.sh
```

## コンテナ群の起動

```
% docker-compose up -d
```

## Web コンテナにログイン

```
% docker-compose exec web bash
```

※ ログアウトするには `exit` コマンドを実行するか、`Ctrl-D` キーを入力してください。

## コンテナ群の停止

```
% docker-compose stop
```

## コンテナ群の破棄

```
% docker-compose down
```

