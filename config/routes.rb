Rails.application.routes.draw do
  devise_for :users
  get 'home/index'

  root to: 'home#index'
  resources :users, only: [:show, :edit, :update] do
    member do
      get :following, :followers
    end
  end
  resources :posts, only: [:new, :create, :show, :destroy]
  resources :follows, only: [:create, :destroy]
  resources :comments, only: [:create, :destroy]
end