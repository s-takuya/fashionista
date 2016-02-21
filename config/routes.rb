Rails.application.routes.draw do
  devise_for :users
  root 'owners#index'

  resources :coordinates

  resources :owners
  resources :favorites do
    post :remove, on: :collection
  end
end
