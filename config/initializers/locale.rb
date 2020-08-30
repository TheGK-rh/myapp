#読み込まれる翻訳文のファイルパスとデフォルト言語(ロケール)の設定

# I18nライブラリに訳文の探索場所を指示する
I18n.load_path += Dir[Rails.root.join('lib', 'locale', '*.{rb,yml}')]

# アプリケーションでの利用を許可するロケールをホワイトリスト化する
I18n.available_locales = [:en, :ja]

# 上記の対応言語以外の言語が指定された場合、エラーとするかの設定
I18n.enforce_available_locales = true

# ロケールを:en以外に変更する
I18n.default_locale = :ja
