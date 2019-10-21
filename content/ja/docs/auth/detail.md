---
title: 詳細設計
linkTitle: 詳細設計
draft: true
date: GETTO_DOCS_CONTENT_DATE
weight: 1000
description: >
  ドメインモデルの概要図とサービスまとめ
---

![概要](abstract.png)


## サービス

### コア

- GetUser : ユーザーの情報を取得

## モデルオブジェクト

### User

`entity`

以下の属性を持つ。

- token : API の通信に使用するトークン
- user_id : 全ユーザーで一意な識別子（作成後変更されない）
- user_name : ユーザー名
- user_email : ユーザーのメールアドレス（アイコンの表示）
- teams : ユーザーの所属するチーム


#### Team

`entity`

以下の属性を持つ。

- team_id : 全チームで一意な識別子（作成後変更されない）
- team_name : チーム名

