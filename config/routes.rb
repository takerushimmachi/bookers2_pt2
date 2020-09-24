Rails.application.routes.draw do
  root 'home#top'
  get 'home/about'
  devise_for :users
  resources :users, only: [:show,:index,:edit,:update]
  resources :books, only: [:new, :create, :index, :show] do
  resources :post_comments, only: [:create, :destroy]
  end
  resources :relationships, only: [:create, :destroy]
  resources :books do
  resource :favorites, only: [:create, :destroy]
  resources :users do
    member do
     get :following, :followers
    end
  end
  end
end