# Lemonfish

![スクリーンショット 2020-09-08 1 49 23](https://user-images.githubusercontent.com/61115238/92407489-aaf6f380-f175-11ea-9601-53b14928b96f.png)
Lemonfishは日常の用事はもちろんですが、仕事上のタスクを管理するToDoListサービスです。
開発にはRuby/Ruby on Rails、インフラにはAWSを使用しています。（詳細は後述）


## URL
https://lemonfish.link
- (2020/09/30サーバー停止)
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
  - 他ユーザーがユーザーをフォローした場合やタスクにコメントした場合、通知（未読通知有り無しで表示切り替え）
  - ユーザーが他ユーザーフォロー、タスクにコメント等を行なったアクティビティログを表示

- 日・英　言語切り替え機能
- レスポンシブデザイン

## 学習方法・参考サイト
  - ProgateとUdemyで基礎学習の後、それぞれの公式ガイド、QiitaやStackoverflowなどを参考に作成。
  - 参考サイト：Trello、Todoist

## 課題
  - UI/UXのブラッシュアップ、フロント側のスキル・知識アップ
    - 「一目でわかる」、「クリック回数を少なく」などを意識して製作は進めたものの、一部にajaxをしようしたのみで技術・知識不足から満足いく形にはなっていないので、JSなどの知識も高めていきたいと考えています。
    - 現在JavaScript/Vue.jsを学習しています。
  - テストが少ないと感じており、RSpecのスキルアップが必要。  
  - ※フォロワーとのタスク共有は機能的に不自然なため、フォロー機能をリクエスト型のフレンド機能(ユーザーがリクエスト、他ユーザー承認など)へ変更すべきだと考えています。
