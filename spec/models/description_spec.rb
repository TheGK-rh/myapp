require 'rails_helper'

RSpec.describe Description, type: :model do

  let(:description) { create(:description) }

  it 'タスク詳細作成が可能である' do
    expect(description).to be_valid
  end

end
