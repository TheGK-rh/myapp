require 'rails_helper'

RSpec.describe Relationship, type: :model do
  let(:relationship) { create(:relationship) }

  before do
    user1 = create(:user, id:1)
    user2 = create(:user, id:2)
  end

  describe '有効性' do

    it 'relationshipが作成できる' do
      expect(relationship).to be_valid
    end

    it 'follower_idがなければ作成できない' do
      relationship.follower_id = nil
      expect(relationship).to_not be_valid
    end

    it 'following_idがなければ作成できない' do
      relationship.following_id = nil
      expect(relationship).to_not be_valid
    end

  end

end
