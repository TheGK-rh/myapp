require 'rails_helper'

RSpec.describe Description, type: :model do

  let(:description) { create(:description) }

  it 'タスク詳細作成が可能である' do
    expect(description).to be_valid
  end

  describe '文字数' do

    it '350文字以内は登録できる' do
      expect(build(:description, description: "a" * 350)).to be_valid
    end

    it '350文字以上は登録できない' do
      expect(build(:description, description: "b" * 351)).to_not be_valid
    end

  end

end
