Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  root 'mens#index'

  resources :coordinates
  resources :mens
  resources :women
  resources :owners
  resources :favorites do
    post :remove, on: :collection
  end
  resources :mens_coordinates
  resources :women_coordinates
  get '/sitemap' => redirect('https://s3-ap-northeast-1.amazonaws.com/styly/sitemaps/sitemap.xml.gz')
end
