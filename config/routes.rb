Rails.application.routes.draw do
  devise_for :users
  root 'coordinates#index'

  resources :coordinates
end
