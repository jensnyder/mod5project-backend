Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, only: [:create]
  resources :assignments, only: [:create, :update, :destroy]
  post '/login', to: 'auth#create'
  get '/profile', to: 'users#profile'
end
