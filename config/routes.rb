Rails.application.routes.draw do

  resources :camps
  resources :categories

  root 'camps#index'


  # SessionsController
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'

  # RegistrationsController
  get '/register', to: 'registrations#new'
  post '/register', to: 'registrations#create'

  # Nested Resources for Users/Reviews
  resources :users, only: [:show] do
    resources :reviews, only: [:new, :create, :show, :update, :destroy]
  end



  # reviews will be nested under users
  # /users/1/reviews

end
