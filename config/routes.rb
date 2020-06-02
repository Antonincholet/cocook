Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  # get '/offers', to: 'offers#index'
  # get '/offers/:id', to: 'offers#show', as: 'offer'
  # get '/offers/new', to: 'offers#new'
  # post '/offers', to: 'offers#create'
  # update
  # destroy
  resources :offers, except: [ :edit, :update ] do
    resources :reservations, only: [:new, :create]
  end
  resources :reservations, only: [:destroy]
  get '/dashboard', to: 'pages#dashboard', as: 'dashboard'
end
