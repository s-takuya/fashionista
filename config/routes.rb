Rails.application.routes.draw do
  root 'coordinates#index'

  resources :coordinates
end
