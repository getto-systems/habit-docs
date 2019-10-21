---
title: Context Map
linkTitle: Context Map
draft: true
date: GETTO_DOCS_CONTENT_DATE
weight: 2
description: >
  コンテキストマップ
---

## 概要

![コンテキストマップ](abstract.png)


### Auth

- User の管理
- Team の管理
- コアドメインへの User、Team データの提供


### Team

- Auth からの User、Team データは Aquarium、Trophy、Cockpit で共有する


### Aquarium

- Idea のストック
- Trophy への Idea データの提供


### Trophy

- タスクの価値の評価
- Cockpit への Task データの提供


### Cockpit

- タスクの価値の概観

