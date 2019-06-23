Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :performances do
    resources :bookings, only: [:new, :create, :edit, :update]
    resources :reviews
  end

  namespace :users do
    resources :bookings, only: [:index]
  end

  resources :bookings, only: [:destroy]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
