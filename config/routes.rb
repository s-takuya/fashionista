Rails.application.routes.draw do
  devise_for :users
  root 'coordinates#index'

  resources :coordinates do
    get :show_more, on: :collection
  end
end
