require 'rails_helper'

RSpec.describe Tag, type: :model do

  let(:tag) { create(:tag) }

  it 'タグ作成が可能である' do
    expect(tag).to be_valid
  end

end
