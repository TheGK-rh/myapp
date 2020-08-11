require 'rails_helper'

RSpec.describe Task, type: :model do

  let(:task) { create(:task) }

  it 'タスク作成が可能である' do
    expect(task).to be_valid
  end

  describe '存在性の検証' do
    it 'タイトルがなければ作成できない' do
      task.title = ""
      task.valid?
      expect(task).to_not be_valid
    end
    it 'カテゴリーの選択がなければ作成できない' do
      task.category_id = nil
      task.valid?
      expect(task).to_not be_valid
    end
    it '期日は入力しなくてもタスク作成可能' do
      task.term = ""
      expect(task).to be_valid
    end
    it 'タグ付けなしでもタスク作成可能' do
      task.tag_ids = []
      expect(task).to be_valid
    end
  end

  describe '文字数の検証' do
    it 'タスクタイトルは20文字以内の場合、有効' do
      task.title = 't' * 20
      expect(task).to be_valid
    end
    it 'タスクタイトルは20文字以上の場合、無効' do
      task.title = 't' * 21
      expect(task).to_not be_valid
    end
  end

  describe '#search' do
    before do
      user = create(:user)
      @task = create(
        :task,
        user: user,
        title: 'RSpec検索テスト'
      )
      @other_task = create(
        :task,
        user: user,
        title: '問題なく動作している'
      )
    end

    context "caption: '検'で検索した場合、曖昧検索できているか" do
      it '@taskを返すこと' do
        expect(Task.search(search: '検')).to include(@task)
      end
    end

  end

end
