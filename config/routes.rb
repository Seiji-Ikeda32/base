Rails.application.routes.draw do
  root to: 'toppages#index'
  
  get 'toppages/index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  get 'login', to: 'sessions#new'
  post 'login', to: 'shares#index'
  delete 'logout', to: 'sessions#destroy'

  
  get 'signup', to: 'users#new'
  
  
  resources :users, only: [:index, :show, :new, :create]
  resources :sessions
  resources :shares

  # post '/guests/guest_sign_in', to: 'shares#index'
end
