#http_status = 200 : ok リクエストが成功したことを示す。
#http_status = 302 : found リクエストされたリソースのURLが一時的に変更されたことを示す。

require 'rails_helper'

RSpec.describe "Notifications", type: :request do
  let(:user) { create(:user) }

  describe 'GET notifications#index' do
    context 'ログインしていない' do
      it 'notifications_pathにアクセスできない http status = 302' do
        get notifications_path
        expect(response).to have_http_status 302
      end
    end
    context 'ログインしている' do
      it 'notifications_pathにアクセスできる http status = 200' do
        sign_in user
        get notifications_path
        expect(response).to have_http_status 200
      end
    end
  end

end
