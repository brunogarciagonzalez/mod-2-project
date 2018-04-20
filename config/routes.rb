Rails.application.routes.draw do


  resources :reviews
  root to: "listings#index"
  get '/signin', to: 'sessions#new'
  get '/signout', to: 'sessions#signout'
  post '/signin', to: 'sessions#signin'

  get '/register', to: 'users#new'

  get '/users/:id/wallet/:operation/:currency', to: 'wallets#edit'

  post '/wallets/:id', to: "wallets#update"
  get '/wallets/:id', to: 'wallets#showuser'
  resources :wallets, only: [:edit, :update, :show]
  resources :listings
  resources :orders
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
