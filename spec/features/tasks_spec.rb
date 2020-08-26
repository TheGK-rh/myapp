require 'rails_helper'

RSpec.feature "Tasks", type: :feature do
  background do
    User.create(name: "ログインテスト", email: "login@test.jp", password: "logintest", password_confirmation: "logintest")
    Category.create(name: 'ToDoList')
  end

  scenario 'ログインしタスクを作成する' do

    # ログインページへ
    visit new_user_session_path
    # ログインフォームに名前、Email、パスワードを入力する
    fill_in '名前：', with: 'ログインテスト'
    fill_in 'メールアドレス：', with: 'login@test.jp'
    fill_in 'パスワード：', with: 'logintest'
    # ログインボタンをクリックする
    click_button 'ログイン'
    # ログインに成功したことを検証する
    expect(current_path).to eq root_path
    expect(page).to have_content 'ログインしました。'

    #タスク作成をクリックする
    click_button 'タスク作成'
    #タイトルを入力する
    fill_in 'タイトル：', with: 'タスク作成テスト'
    #カテゴリーを選択する
    select 'ToDoList', from: 'カテゴリー：'
    #作成するをクリックする
    #click_button '作成する'
    #expect(Task.count).to eq 1

  end

end
