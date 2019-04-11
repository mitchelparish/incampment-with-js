Rails.application.routes.draw do

  root 'camps#index'
  resources :categories
  resources :users

  # SessionsController
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'

  # RegistrationsController
  get '/register', to: 'registrations#new'
  post '/register', to: 'registrations#create'

  # Nested Resources for Users/Reviews
  resources :camps do
    resources :reviews, only: [:new, :create, :show, :update, :destroy]
  end

  # OmniAuth Callback
  get '/auth/:provider/callback', to: 'sessions#create'

end
