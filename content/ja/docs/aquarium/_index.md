---
title: Aquarium
linkTitle: Aquarium
date: GETTO_DOCS_CONTENT_DATE
weight: 2
description: >
  アイデアのストック
---

## 概要

![概要](abstract.png)


### サービス

#### Idea に関するサービス

- Register : アイデアの登録
- Unregister : アイデアの削除
- ChangeImportance : アイデアの重要度の変更
- ChangeContent : アイデアの内容の変更
- Attach : アイデアの着手
- Undo : アイデアの着手の取り消し
- ListFloating : 未着手アイデアの列挙


#### Project に関するサービス

- Register : プロジェクトの登録
- Unregister : プロジェクトの削除
- ChangeName : プロジェクト名の変更


#### Client に関するサービス

- Register : クライアントの登録
- Unregister : クライアントの削除
- ChangeName : クライアント名の変更
- ChangeColor : クライアントカラーの変更


### Idea

`entity`

以下の要素の集約ルート。

- Importance : 重要度（大・中・小）
- State : attached（着手済） / floating（未着手）
- Content : 内容（タイトル・概要・詳細）
- Log : 変更ログ

以下のリポジトリでデータを取得、変更する。

- Book : Idea を記録する

以下の要素への参照を持つ。

- Team : このアイデアが属するチーム
- Project : このアイデアが属するプロジェクト


##### アイデアの表示について

- 重要度が大きくなるほど詳細情報を表示
- クライアントカラーで色分けして表示


##### アイデアの着手について

- Trophy の Task を作成して attached にする


##### アイデアの取り消し操作について

- 登録の取り消し : 単純に削除
- 削除の取り消し : 単純に再作成
- 変更の取り消し : 変更前のデータで上書き
- 着手の取り消し : Trophy の Task を削除して floating に戻す
  Task が完了している場合は戻せない


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


#### Log

`entity`

以下の属性を持つ。

- changed_at : 変更日時
- content : 変更内容


#### Book

- Idea データのリポジトリ


### Project

`entity`

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


#### Work

- Project・Client データのリポジトリ

