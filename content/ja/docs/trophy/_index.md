---
title: Trophy
linkTitle: Trophy
date: GETTO_DOCS_CONTENT_DATE
weight: 3
description: >
  タスクの価値の評価
---

## 概要

![概要](abstract.png)


### サービス

#### Task に関するサービス

- Pending : attached を pending にして理由を設定する
- Block : attached を blocked にして理由を設定する
- Restart : pending / blocked を attached にする
- Done : attached を measuring にする
- Complete : measuring を completed にして価値を設定する
- Close : attached / pending / blocked / measuring を closed にする
- ListActive : completed、closed を除く Task を列挙する
- ListCompleted : completed な Task を列挙する
- ListClosed : closed な Task を列挙する


#### Aquarium に開示するサービス

- Register : Attach した時 Task を登録する
- Unregister : Undo した時 Task を削除する


#### Cockpit に開示するサービス

- ListAttached : attached な Task を列挙する
- ListMeasuring : measuring な Task を列挙する
- ListPending : pending な Task を列挙する
- ListCompleted : completed な Task を列挙する


### Task

`entity`

以下の要素の集約ルート。

- Trophy : タスクの価値
- State : attached / pending / blocked / measuring / completed / closed
- Log : 変更ログ

以下のリポジトリでデータを取得、変更する。

- Rack : Task を記録する

以下の要素への参照を持つ。

- Idea : Aquarium の Idea データ


##### タスクの表示について

- completed、closed のタスクは非表示
- pending、blocked は理由も表示
- completed は価値も表示


##### タスクの取り消し操作について

- 状態の変更の取り消し : 前の状態に変更


#### Trophy

`value`

以下の属性を持つ。

- name : 名称
- number : 順列
- value : 価値


##### 定義する Trophy

- bronze : 1
- silver : 3
- gold : 9
- platinum : 27


###### 価値の数値について

- `3^(n - 1)`（n = number）
- 前の 3倍


#### State

`value`

以下の属性を持つ。

- state
  - attached（着手済）
  - pending（保留）
  - blocked（中断）
  - measuring（測定中）
  - completed（完了）
  - closed（終了）


#### Log

`entity`

以下の属性を持つ。

- changed_at : 変更日時
- content : 変更内容
- reason : 変更理由


#### Rack

- Task データのリポジトリ

