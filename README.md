## ながのCAKE

![welcome_nagano_cake](https://github.com/dwc-2307-i-takeout/Nagano-Cake/assets/138280990/81bacad8-3dc9-4fd4-9219-e9c5dd8e813b)

## 案件概要

長野県にある小さな洋菓子店「ながのCAKE」の商品を通販するためのECサイト開発。

## 案件の背景

元々近隣住民が顧客だったが、昨年始めたInstagramから人気となり、全国から注文が来るようになった。
InstagramのDMやメールで通販の注文を受けていたが、情報管理が煩雑になってきたため、管理機能を含んだ通販サイトを開設しようと思い至った。

## 通販について

- 通販では注文に応じて製作する受注生産型としている。
- 現在通販での注文量は十分に対応可能な量のため、1日の受注量に制限は設けない。
- 送料は1配送につき全国一律800円。
- 友人や家族へのプレゼントなど、注文者の住所以外にも商品を発送できる。
- 支払方法はクレジットカード、銀行振込から選択できる。

## 実装機能

- 会員側

  - ログイン / ログアウト機能

  - 商品一覧表示機能

  - 商品詳細表示機能

  - カート追加 / 一覧表示 / 編集機能

  - 商品検索機能（キーワード or ジャンル）

  - 注文機能

  - 会員情報編集機能

  - 退会機能

  - 会員情報編集機能

  - 配送先追加 / 編集機能

  - 注文履歴一覧 / 詳細表示機能

- 管理者側

  - ログイン / ログアウト機能

  - 注文履歴一覧 / 詳細表示機能

  - 顧客一覧 / 詳細情報表示機能

  - 商品一覧 / 詳細情報表示機能

  - 商品検索機能（キーワード）

  - 商品情報編集機能

  - ジャンル設定機能

## 設計書

- [ER図](https://drive.google.com/file/d/1FEnMbSdGQCzyJRzWRFpfa2Me7nnZfmKX/view?usp=sharing)

- [テーブル定義書](https://docs.google.com/spreadsheets/d/1alIFfwM6UT90XGyBh4zNcboRvbjB5jZ4SrWyXBzU6I4/edit?usp=sharing)

- [アプリケーション詳細設計書](https://docs.google.com/spreadsheets/d/1UpoKhIayDta3MgNeKeXHLYqDg78y7KlZU3vAnmvk1xc/edit?usp=sharing)

## 環境構築に必要な手順

クローンの作成

    $ git clone git@github.com:dwc-2307-i-takeout/Nagano-Cake.git

必要なGemパッケージのインストール

    $ bundle install

migrationファイルの内容をDBへ投射

    $ rails db:migrate

管理者アカウントの作成（mail: admin@gmail.com / pass: admin1234）

    $ rails db:seed

Railsアプリケーションへアクセス

    $ rails s

## 開発環境

- Ruby 3.1.2

- Rails 6.1.7.4

## Gem

- devise

- enum_help

- bootstrap

- kaminari 1.2.1'

- pry-byebug

- pry-rails

- image_processing 1.2

## 開発チーム（テイクアウト）

- メンバー（4名）

  - ミケチャン（リーダー）

  - ジュンチャン（ムードメーカー）

  - ななみん（作業早い）

  - Z O N O