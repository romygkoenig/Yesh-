Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :performances do
    resources :bookings, only: [:new, :create]
    resources :reviews, except: [ :show ]
  end

  namespace :account do
    resources :bookings, only: :index
  end

  resources :bookings, only: [:show, :edit, :update, :destroy]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
