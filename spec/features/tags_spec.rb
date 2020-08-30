require 'rails_helper'

RSpec.feature "Tags", type: :feature do
  background do
    User.create(name: "ログインテスト", email: "login@test.jp", password: "logintest", password_confirmation: "logintest")
  end

  scenario 'ログインしタグを作成する' do

    # ログインページへ
    visit new_user_session_path
    # ログインフォームに名前、Email、パスワードを入力する
    fill_in '名前：', with: 'ログインテスト'
    fill_in 'メールアドレス：', with: 'login@test.jp'
    fill_in 'パスワード：', with: 'logintest'
    # ログインボタンをクリックする
    click_button 'ログイン'
    # ログインに成功したことを検証する
    expect(page).to have_content 'ログインしました。'

    #タグ作成をクリック
    click_link 'タグ作成'
    #tagsへアクセス
    expect(current_path).to eq "/ja/tags"
    #入力フォームに入力
    fill_in '新しいタグを作成', with: 'タグ作成テスト'
    #作成をクリック
    click_button '作成'
    #タグが作成されているか検証
    expect(page).to have_content 'タグ作成テスト'
    expect(Tag.count).to eq (1)

  end

end
