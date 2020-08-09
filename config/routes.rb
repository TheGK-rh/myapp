Rails.application.routes.draw do

  devise_for :users, controllers:{
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }
  devise_scope :user do
    get 'profile/:id/' => 'users/registrations#profile', as: 'profile'
    get 'profile/:id/following', to: 'users/registrations#following', as: 'following'
    get 'profile/:id/followers', to: 'users/registrations#followers', as: 'followers'
  end
  resources :relationships, only: [:create, :destroy]
  resources :tags, except: [:show]
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

  root "tasks#index"

end
