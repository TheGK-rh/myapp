require 'rails_helper'

RSpec.describe Comment, type: :model do

  let(:comment) { create(:comment) }

  it 'コメント作成が可能である' do
    expect(comment).to be_valid
  end

  it 'コメントが120文字以上は登録できない' do
    expect(build(:comment, body: "a" * 120)).to_not be_valid
  end



end
