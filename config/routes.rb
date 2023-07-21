Rails.application.routes.draw do
  root 'sessions#new'  # Set the root route to the sessions new page

  resources :users, only: [:create]
  resources :sessions, only: [:create, :destroy]
  
  resources :organisations, except: [:new] do
    resources :shifts  # This generates /organisations/:id/shifts for all CRUD operations
    member do
      post 'join'
    end
  end
  
  post '/sendlogin', to: 'sessions#create'

  get '/signup', to: 'users#new', as: :signup
  get '/login', to: 'sessions#new', as: :login
  get '/logout', to: 'sessions#destroy', as: :logout
end
