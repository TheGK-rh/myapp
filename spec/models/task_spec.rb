require 'rails_helper'

RSpec.describe Task, type: :model do

  let(:task) { create(:task) }

  it 'タスク作成が可能である' do
    expect(task).to be_valid
  end

  it 'タイトルがなければ作成できない' do
    expect(build(:task, title:"")).to_not be_valid
  end

  it 'カテゴリーの選択がなければ作成できない' do
    expect(build(:task, category_id:"")).to_not be_valid
  end

  it 'タイトルが20文字以上は登録できない' do
    expect(build(:task, title: "a" * 21)).to_not be_valid
    expect(create(:task, title: "b" * 10)).to be_valid
  end

  it '期日は入力しなくてもタスク作成可能' do
    expect(create(:task, term: "")).to be_valid
  end

end
