#http_status = 200 : ok リクエストが成功したことを示す。
#http_status = 302 : found リクエストされたリソースのURLが一時的に変更されたことを示す。

require 'rails_helper'

RSpec.describe "Tasks", type: :request do
  let(:user) { create(:user) }
  let(:base_title) { 'LemonFish' }

  describe 'GET /' do
    context 'ログインしていない' do
      it 'http status = 302' do
        get root_path
        expect(response).to have_http_status 302
      end
    end
    context 'ログインしている' do
      it 'http status = 200' do
        sign_in user
        get root_path
        expect(response).to have_http_status 200
        expect(response.body).to match(/<title>#{base_title}<\/title>/i)
      end
    end
  end

  describe 'GET users/registrations#profile' do
    before do
      sign_in user
    end
    context 'ユーザーページにアクセス' do
      it 'リクエストが成功すること' do
        get profile_path(user.id)
        expect(response).to have_http_status 200
      end
    end
  end

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

  describe 'GET activities#index' do
    context 'ログインしていない' do
      it 'activities_pathにアクセスできない http status = 302' do
        get activities_path
        expect(response).to have_http_status 302
      end
    end
    context 'ログインしている' do
      it 'activities_pathにアクセスできる http status = 200' do
        sign_in user
        get activities_path
        expect(response).to have_http_status 200
      end
    end
  end

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
