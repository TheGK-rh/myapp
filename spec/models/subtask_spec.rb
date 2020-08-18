require 'rails_helper'

RSpec.describe Subtask, type: :model do

  let(:subtask) { create(:subtask) }

  it 'サブタスク作成が可能である' do
    expect(subtask).to be_valid
  end

  describe '文字数' do

    it '20文字以内は登録できる' do
      expect(build(:subtask, name: "a" * 20)).to be_valid
    end

    it '20文字以上は登録できない' do
      expect(build(:subtask, name: "b" * 20)).to_not be_valid
    end

  end

end
