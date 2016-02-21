Rails.application.routes.draw do
  devise_for :users
  root 'owners#index'

  resources :coordinates

  resources :owners
end
