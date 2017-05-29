Rails.application.routes.draw do
devise_for :users
  root to: 'pages#home'

  resources :users, only: [:new, :create, :edit, :update, :show] do
    resources :bookings, only: [:index, :show]
  end

  namespace :admin do
    resources :articles, only: [:index]
  end

  resources :articles do
    resources :reviews, only: [:new, :create]
  end
end
