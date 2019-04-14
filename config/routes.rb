Rails.application.routes.draw do

  root 'camps#index'
  get 'profile', to: 'users#show'
  resources :categories, only: :show

  # RegistrationsController
  get '/register', to: 'registrations#new'
  post '/register', to: 'registrations#create'

  # SessionsController
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'

  # OmniAuth Callback
  get '/auth/:provider/callback', to: 'sessions#create'

  # Nested Resources for Users/Reviews
  resources :camps, only: [:new, :create, :show, :edit, :update] do
    resources :reviews, only: [:new, :create, :edit, :update, :destroy]
  end

  # ActiveRecord Scope Method Requirement
  get '/top_rated', to: 'reviews#top_rated'

end
