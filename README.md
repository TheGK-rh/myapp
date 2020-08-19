# Lemonfish

![スクリーンショット 2020-08-18 14 54 32 1](https://user-images.githubusercontent.com/61115238/90475690-e730c880-e162-11ea-9196-d90ded70e0e4.png)
Lemonfishは日常の用事はもちろんですが、仕事上のタスクを管理するToDoListサービスです。
開発にはRuby/Ruby on Rails、インフラにはAWSを使用しています。（詳細は後述）


## URL
https://lemonfish.link

- AWS: ALB、ACMでSSL化しています。
- ログイン画面の「簡単ログイン」をクリックすると、入力なしでログインすることが可能です。


## 使用技術
- Ruby 2.6.6/Ruby on Rails 5.2.4.3
- MySQL 5.7
- Nginx, Unicorn
- AWS (VPC, EC2, RDS, Route53, ALB、ACM, S3)
- CircleCI (CI/CDパイプライン構築)
- Capistrano
- Rspec/Rubocop
- Docker/docker-compose
- git/github(pull requestやissueなどの機能を使っています)


## インフラ構成図

![c67949ed-41fb-4bea-92b8-451d2c2c4b24](https://user-images.githubusercontent.com/61115238/90270115-a9971b80-de94-11ea-9942-c4660275e041.png)
- ※開発環境でDocker/docker-composeを使用しているので、CapistranoでのデプロイからECS/ECRへ変更するべく勉強しています。
- 構成図はLucidchartで作成。


## 機能一覧

- ユーザー機能
  - Gem: Deviseを使用
  - 新規ユーザー登録、ログイン、ログアウト機能
  - マイページ、登録情報変更、アカウント削除機能
  - 簡単ログイン機能(※ゲストユーザーは編集・削除できません)

- タスク機能
  - タスク作成・削除機能(ajax使用)
  - タスク一覧(カテゴリー別に表示)、詳細表示・編集機能
  - タスクのカテゴリー(ToDoList、作業中、完了)をワンクリックで変更可能
  - タグ付け、タグ作成・削除機能
  - 画像ファイル等のアップロード・ダウンロード機能(Gem: Carrierwave使用)
  - フォロワーとタスク共有可能
  - タスク検索機能

- フォロー機能(※後述しておりますが、機能的に不自然なため変更作業中です。)
  - 非同期でフォロー・アンフォロー（ajax使用）
  - フォロー、フォロワー一覧表示機能
  - ユーザー一覧表示・検索・ページネーション機能(Gem: Kaminari使用)

- アクティビティログ・通知機能
  - 他ユーザーがフォローした場合、通知（未読通知有り無しで表示切り替え）
  - ユーザーの他ユーザーフォロー、タスク作成等のユーザーアクティビティのログを表示　

## 参考サイト
  - Trello、Todoist

## 課題
- UI/UXのブラッシュアップ、フロント側のスキル・知識アップ
  - 「一目でわかる」、「クリック回数を少なく」、「非同期」など意識して製作は進めたものの、技術・知識不足から満足いく形にはなっていないので、JSなどの知識を高めていきたい。
- テストが十分に書かれていない。（継続してRSpecのスキルアップを行なっています。）
- ※フォロワーとのタスク共有は機能的に不自然なため、フォロー機能をリクエスト型のフレンド機能(ユーザーがリクエスト、他ユーザー承認など)へ変更すべき。
