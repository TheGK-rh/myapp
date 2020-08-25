#http_status = 200 : ok リクエストが成功したことを示す。
#http_status = 302 : found リクエストされたリソースのURLが一時的に変更されたことを示す。

require 'rails_helper'

RSpec.describe "Tags", type: :request do
  let(:user) { create(:user) }
  
  describe 'GET tags#index' do
    context 'ログインしていない' do
      it 'tags_pathにアクセスできない http status = 302' do
        get tags_path
        expect(response).to have_http_status 302
      end
    end
    context 'ログインしている' do
      it 'tags_pathにアクセスできる http status = 200' do
        sign_in user
        get tags_path
        expect(response).to have_http_status 200
      end
    end
  end

end
