Rails.application.routes.draw do
  root 'home#top'
  get 'home/about'
  devise_for :users
  resources :users, only: [:show,:index,:edit,:update]
  resources :books, only: [:new, :create, :index, :show] do
  resources :post_comments, only: [:create, :destroy]
  end
  resources :books do
  resource :favorites, only: [:create, :destroy]
  end
end