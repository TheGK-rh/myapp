require 'rails_helper'

RSpec.describe Description, type: :model do

  let(:description) { create(:description) }

  describe '有効性' do

    it 'タスク詳細作成が可能である' do
      expect(description).to be_valid
    end

    context 'descriptionがnilの場合' do
      it '作成できない' do
        description.description = nil
        expect(description).to_not be_valid
      end
    end

    context 'task_idがnilの場合' do
      it '作成できない' do
        description.task_id = nil
        expect(description).to_not be_valid
      end
    end

    context 'user_idがnilの場合' do
      it '作成できない' do
        description.user_id = nil
        expect(description).to_not be_valid
      end
    end

    context '文字数が350文字以内' do
      it '登録できる' do
        expect(build(:description, description: "a" * 350)).to be_valid
      end
    end

    context '文字数が350文字以上' do
      it '登録できない' do
        expect(build(:description, description: "b" * 351)).to_not be_valid
      end
    end

  end

end
