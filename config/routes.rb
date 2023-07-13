Rails.application.routes.draw do
  root 'organisations#index'  # Set the root route to the organisations index page

  resources :users, only: [:create]
  resources :sessions, only: [:create, :destroy]
  resources :organisations do
    member do
      put 'join'
    end
  end
  

  get '/signup', to: 'users#new', as: :signup
  get '/login', to: 'sessions#new', as: :login
  get '/logout', to: 'sessions#destroy', as: :logout
end
