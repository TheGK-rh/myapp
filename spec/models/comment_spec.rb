require 'rails_helper'

RSpec.describe Comment, type: :model do

  let(:comment) { create(:comment) }

  it 'コメント作成が可能である' do
    expect(comment).to be_valid
  end

  describe '文字数' do

    it '120文字以内は登録できる' do
      expect(build(:comment, body: "b" * 120)).to be_valid
    end

    it '120文字以上は登録できない' do
      expect(build(:comment, body: "a" * 121)).to_not be_valid
    end

  end



end
