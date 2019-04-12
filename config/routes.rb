Rails.application.routes.draw do

  root 'camps#index'
  resources :categories, only: :show
  resources :users, only: :show

  # ActiveRecord Scope Method Requirement
  get '/top_reviews', to: 'reviews#top_reviews'

  # SessionsController
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'

  # RegistrationsController
  get '/register', to: 'registrations#new'
  post '/register', to: 'registrations#create'

  # Nested Resources for Users/Reviews
  resources :camps do
    resources :reviews
  end

  # OmniAuth Callback
  get '/auth/:provider/callback', to: 'sessions#create'

end
