Rails.application.routes.draw do
  resources :reviews
  resources :camps
  resources :categories
  resources :users

  # reviews will be nested under users
  # /users/1/reviews
   # root 'users#show'

end
