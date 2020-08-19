require 'rails_helper'

RSpec.describe Subtask, type: :model do

  let(:subtask) { create(:subtask) }

  describe '有効性' do

    it 'サブタスク作成が可能である' do
      expect(subtask).to be_valid
    end

    context 'nameがnilの場合' do
      it '作成できない' do
        subtask.name = nil
        expect(subtask).to_not be_valid
      end
    end

    context 'task_idがnilの場合' do
      it '作成できない' do
        subtask.task_id = nil
        expect(subtask).to_not be_valid
      end
    end

    context 'user_idがnilの場合' do
      it '作成できない' do
        subtask.user_id = nil
        expect(subtask).to_not be_valid
      end
    end

    context '文字数が100文字以内' do
      it '登録できる' do
        expect(build(:subtask, name: "a" * 100)).to be_valid
      end
    end

    context '文字数が100文字以上' do
      it '登録できない' do
        expect(build(:subtask, name: "b" * 101)).to_not be_valid
      end
    end

  end

end
