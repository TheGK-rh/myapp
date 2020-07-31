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
  resources :tasks
  root "tasks#index"

end
