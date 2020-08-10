require 'rails_helper'

RSpec.describe Comment, type: :model do

  let(:comment) { create(:comment) }

  it 'タスク詳細作成が可能である' do
    expect(comment).to be_valid
  end

end
