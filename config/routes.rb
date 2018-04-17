Rails.application.routes.draw do


  root to: "listings#index"
  get '/login', to: 'sessions#new'
  post '/signin', to: 'sessions#signin'
  resources :wallets
  resources :listings
  resources :orders
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
