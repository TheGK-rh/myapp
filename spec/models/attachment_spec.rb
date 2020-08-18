require 'rails_helper'

RSpec.describe Attachment, type: :model do

  let(:attachment) { create(:attachment) }

  describe '有効性' do

    it '画像アップロードが可能である' do
      expect(attachment).to be_valid
    end

    context 'ファイルの添付なし' do
      it '登録できない' do
        attachment.image = nil
        expect(attachment).to_not be_valid
      end
    end

    context 'task_idがnilの場合' do
      it '作成できない' do
        attachment.task_id = nil
        expect(attachment).to_not be_valid
      end
    end

    context 'user_idがnilの場合' do
      it '作成できない' do
        attachment.user_id = nil
        expect(attachment).to_not be_valid
      end
    end

  end

end
