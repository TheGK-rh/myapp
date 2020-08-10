require 'rails_helper'

RSpec.describe Subtask, type: :model do

  let(:subtask) { create(:subtask) }

  it 'サブタスク作成が可能である' do
    expect(subtask).to be_valid
  end

end
