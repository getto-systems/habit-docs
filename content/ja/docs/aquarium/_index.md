---
title: Aquarium
linkTitle: Aquarium
date: GETTO_DOCS_CONTENT_DATE
weight: 2
description: >
  アイデアのストック
---

## 概要

アイデアに重要度をつけ、重要な順に着手できるようにする。

- 重要度 : 大・中・小
- 状態 : 着手済・未着手
- 内容 : タイトル・概要・詳細
- プロジェクト
- 変更ログ


### アイデアの表示

- 重要度が大きくなるほど詳細情報を表示
  - 表示領域が大きくなり、目立つようになる
- プロジェクト名を表示
- プロジェクトの属するクライアントカラーで色分けして表示


### アイデアの着手

- Trophy の Task を作成して attached にする
  - 重要度が大きいほど価値を大きく設定する


### アイデアの所属

- プロジェクトに対してチームを設定
- １つのプロジェクトに対して複数のチームを設定できる
- １つのチームが複数のクライアントのプロジェクトを担当することはできない
- ユーザーは自分の所属するチームのプロジェクトに対してアイデアを登録、参照できる


### 取り消し操作

- 登録の取り消し : 単純に削除
- 削除の取り消し : 単純に再作成
- 変更の取り消し : 変更前のデータで上書き
- 着手の取り消し : Trophy の Task を削除して floating に戻す
  - Task が完了している場合は戻せない


### 変更ログ

- 内容の変更記録

