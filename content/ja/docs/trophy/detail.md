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

- Pending : attached を pending にして理由を設定
- Block : attached を blocked にして理由を設定
- Restart : pending / blocked を attached に変更
- Done : attached を measuring に変更
- Complete : measuring を completed に変更
- Close : attached / pending / blocked / measuring を closed に変更
- ListTask : 特定の状態の Task を価値の大きい順に列挙


### 詳細

#### Aquarium に開示するサービス

- Register : Attach した時 Task を登録する
- Unregister : Undo した時 Task を削除する


#### Cockpit に開示するサービス

- ListAttached : attached な Task を着手順に列挙する
- ListMeasuring : measuring な Task を完了順に列挙する
- ListPending : pending な Task を着手順に列挙する
- SumUpCompleted : completed な Task を期間ごとに集計する


## モデルオブジェクト

### Task

`entity`

以下の要素の集約ルート。

- Trophy : タスクの価値
- State : attached / pending / blocked / measuring / completed / closed
- StateLog : 状態の変更ログ

以下のリポジトリでデータを取得、変更する。

- Rack : Task を記録する

以下の要素への参照を持つ。

- Idea : Aquarium の Idea データ

大まかな挙動については[概要]({{< relref "./" >}})参照。


#### Trophy

`value`

以下の属性を持つ。

- name : 名称
- number : 順列


##### 定義する Trophy

- bronze : 1
- silver : 2
- gold : 3
- platinum : 4


#### State

`value`

以下の属性を持つ。

- state
  - attached（着手済）
  - pending（保留）
  - blocked（中断）
  - measuring（計測中）
  - completed（完了）
  - closed（終了）


#### StateLog

`entity`

以下の属性を持つ。

- changed_at : 変更日時
- state : 変更後の状態
- reason : 変更理由


#### Rack

- Task データのリポジトリ

