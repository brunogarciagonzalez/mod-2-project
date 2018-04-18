Rails.application.routes.draw do


  root to: "listings#index"
  get '/signin', to: 'sessions#new'
  get '/signout', to: 'sessions#signout'
  post '/signin', to: 'sessions#signin'

  get '/register', to: 'users#new'

  resources :wallets
  resources :listings
  resources :orders
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
