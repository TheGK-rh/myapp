require 'rails_helper'

RSpec.describe Tag, type: :model do

  let(:tag) { create(:tag) }

  it 'タグ作成が可能である' do
    expect(tag).to be_valid
  end

  describe '文字数' do

    it '10文字以内は登録できる' do
      expect(build(:tag, name: "a" * 10)).to be_valid
    end

    it '10文字以上は登録できない' do
      expect(build(:tag, name: "b" * 11)).to_not be_valid
    end

  end

end
