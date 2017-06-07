Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  root 'home#index'
  resources :requests, only: [:new, :create]
  resources :requestlogs, only: [:index, :show]
  resources :sessions, only: [:new, :create, :destroy]
end
