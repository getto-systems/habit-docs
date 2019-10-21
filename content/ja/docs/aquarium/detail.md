---
title: 詳細設計
linkTitle: 詳細設計
draft: true
date: GETTO_DOCS_CONTENT_DATE
weight: 1
description: >
  ドメインモデルの概要図とサービスまとめ
---

![概要](abstract.png)


## サービス

### コア

- ToImportant : 重要度を「大」に変更
- ToMiddle : 重要度を「中」に変更
- ToTrivial : 重要度を「小」に変更
- Attach : アイデアの着手
- Undo : アイデアの着手の取り消し
- ListFloating : 未着手アイデアを重要度の大きい順に列挙


### 詳細

#### Idea に関するサービス

- Register : アイデアの登録
- Unregister : アイデアの削除
- ChangeContent : アイデアの内容の変更
- ChangeProject : アイデアの所属するプロジェクトの変更


#### Project に関するサービス

- Register : プロジェクトの登録
- Unregister : プロジェクトの削除
- ChangeName : プロジェクト名の変更
- ChangeTeam : プロジェクトのチーム割り当ての変更
- ChangeClient : プロジェクトのクライアントの変更


#### Client に関するサービス

- Register : クライアントの登録
- Unregister : クライアントの削除
- ChangeName : クライアント名の変更
- ChangeColor : クライアントカラーの変更


## モデルオブジェクト

### Idea

`entity`

以下の要素の集約ルート。

- Importance : 重要度（大・中・小）
- State
  - attached（着手済）
  - floating（未着手）
- Content : 内容（タイトル・概要・詳細）
- ContentLog : 内容の変更ログ

以下のリポジトリでデータを取得、変更する。

- Book : Idea を記録する

以下の要素への参照を持つ。

- Project : このアイデアが属するプロジェクト

大まかな挙動については[概要]({{< relref "./" >}})参照。


#### Importance

`value`

以下の属性を持つ。

- importance : 重要度（大・中・小）


#### State

`value`

以下の属性を持つ。

- is_attached : 着手済みか


#### Content

`entity`

以下の属性を持つ。

- title : タイトル
- summary : 概要
- detail : 詳細


#### ContentLog

`entity`

以下の属性を持つ。

- changed_at : 変更日時
- moment : 変更後の Content データ


#### Book

- Idea データのリポジトリ


### Project

`entity`

以下の要素の集約ルート。

- Client : クライアント
- ProjectTeam : プロジェクトを担当するチーム

以下の属性を持つ。

- project_name : プロジェクト名

以下のリポジトリでデータを取得、変更する。

- Work : Project を記録する

以下の要素への参照を持つ。

- Client : このプロジェクトが属するクライアント


#### Client

`entity`

以下の属性を持つ。

- client_name : クライアント名
- client_color : クライアントカラー


#### ProjectTeam

`value`

以下の属性を持つ。

- project : プロジェクト
- team : チーム


#### Work

- Project データのリポジトリ

