require 'rails_helper'

RSpec.describe Comment, type: :model do

  let(:comment) { create(:comment) }

  describe '有効性' do

    it 'コメント作成が可能である' do
      expect(comment).to be_valid
    end

    context 'bodyがnilの場合' do
      it '作成できない' do
        comment.body = nil
        expect(comment).to_not be_valid
      end
    end

    context 'task_idがnilの場合' do
      it '作成できない' do
        comment.task_id = nil
        expect(comment).to_not be_valid
      end
    end

    context 'user_idがnilの場合' do
      it '作成できない' do
        comment.user_id = nil
        expect(comment).to_not be_valid
      end
    end

    context '文字数が300文字以内' do
      it '登録できる' do
        expect(build(:comment, body: "b" * 300)).to be_valid
      end
    end

    context '文字数が300文字以上' do
      it '登録できない' do
        expect(build(:comment, body: "a" * 301)).to_not be_valid
      end
    end

  end

end
