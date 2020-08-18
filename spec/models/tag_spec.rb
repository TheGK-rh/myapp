require 'rails_helper'

RSpec.describe Tag, type: :model do

  let(:tag) { create(:tag) }

  describe '有効性' do

    it 'タグ作成が可能である' do
      expect(tag).to be_valid
    end

    context 'tag.nameがnilの場合' do
      it '作成できない' do
        tag.name = nil
        expect(tag).to_not be_valid
      end
    end

    context 'user_idがnilの場合' do
      it '作成できない' do
        tag.user_id = nil
        expect(tag).to_not be_valid
      end
    end

    context '文字数が10文字以内' do
      it '作成できる' do
        expect(build(:tag, name: "a" * 10)).to be_valid
      end
    end

    context '文字数が10文字以上の場合' do
      it '作成できない' do
        expect(build(:tag, name: "b" * 11)).to_not be_valid
      end
    end

  end

end
