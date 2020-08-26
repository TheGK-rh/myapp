Rails.application.routes.draw do
  scope "(:locale)", locale: /en|ja/ do

    #ユーザー機能：Devise(including Follow function)
    devise_for :users, controllers:{
      registrations: 'users/registrations',
      sessions: 'users/sessions',
      passwords: 'users/passwords'
    }
    devise_scope :user do
      post 'users/guest_sign_in', to: 'users/sessions#new_guest'
      get 'profile/:id/' => 'users/registrations#profile', as: 'profile'
      get 'profile/:id/following', to: 'users/registrations#following', as: 'following'
      get 'profile/:id/followers', to: 'users/registrations#followers', as: 'followers'
    end
    #フォロー機能
    resources :relationships, only: [:create, :destroy]
    #タグ機能
    resources :tags, except: :show
    #アクティビティ・通知機能
    resources :notifications, only: :index
    resources :activities, only: :index
    #基本機能（タスク関連）
    resources :tasks do
      member do
        patch :gotowork
        patch :gotocomplete
        patch :backtodolist
      end
      resources :descriptions, only: [:create, :edit, :update, :destroy]
      resources :comments, only: [:create, :destroy]
      resources :attachments, only: [:create, :destroy] do
        member do
          get :download
        end
      end
      resources :subtasks, only: [:create, :destroy] do
        member do
          patch :complete
          patch :purge
        end
      end
    end
    get '/:locale' => 'static_pages#home'
    #Home page
    root "tasks#index"
  end
end
