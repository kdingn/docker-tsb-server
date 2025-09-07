# 🐳Docker for The Skyblessing🪽

Minecraft の配布マップ「[The Skyblessing](https://tsb.scriptarts.jp)」を Docker を利用して起動するための非公式レポジトリです。[クリエイターのみなさま](https://tsb.scriptarts.jp/creator)に感謝して利用しましょう。

## 概要

この Dockerfile は、Minecraft サーバーをセットアップし、指定されたバージョンの The Skyblessing ワールドデータを導入します。

- **Minecraft Version:** 1.20.4
- **The Skyblessing Version:** 1.0.4

⚠️[最新版](https://tsb.scriptarts.jp/%E3%83%9B%E3%83%BC%E3%83%A0/download)への追従は気が向いたらやります。多分やりません。

## 動作要件

- Docker がインストールされていること。
- マルチプレイで遊ぶ場合はご自身の環境でポート開放ができること（通常の Minecraft サーバーと同様です）。

## 利用方法

1. このリポジトリをクローンまたはダウンロードします。
2. ターミナルでリポジトリのルートディレクトリに移動します。
3. 以下のコマンドを実行して、サーバーを起動します。

```bash
docker compose up --build -d
```

サーバーがバックグラウンドで起動します。

## ワールドのバックアップ

ワールドデータのバックアップは `docker cp` コマンドを使用して行います。コンテナが起動している状態で、以下のコマンドを実行してください。

**コマンド例:**
```bash
docker cp docker-tsb-server-minecraft-1:/data/world ./world_backup
```
これにより、ホストマシン（コマンドを実行した場所）の `world_backup` ディレクトリにワールドデータがコピーされます。

## ライセンス

本レポジトリの利用に特に制限はないですが[公式ライセンスページ](https://tsb.scriptarts.jp/%E3%83%9B%E3%83%BC%E3%83%A0/license)は確認しましょう。
