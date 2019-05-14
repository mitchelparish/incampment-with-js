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


  resources :camps, only: [:index, :new, :create, :show, :edit, :update]
  resources :reviews



  # ActiveRecord Scope Method Requirement
  get '/top_rated', to: 'reviews#top_rated'

end
