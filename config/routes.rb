Rails.application.routes.draw do
  resources :reviews
  resources :camps
  resources :categories
  resources :users

  # SessionsController
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'

  # RegistrationsController
  get '/register', to: 'registrations#new'
  post '/register', to: 'registrations#create'





  # reviews will be nested under users
  # /users/1/reviews
   # root 'users#show'

end
