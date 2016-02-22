Rails.application.routes.draw do
  devise_for :users
  root 'owners#index'

  resources :coordinates

  resources :owners
  resources :favorites do
    post :remove, on: :collection
  end
  get '/sitemap' => redirect('https://s3-ap-northeast-1.amazonaws.com/styly/sitemaps/sitemap.xml.gz')
end
