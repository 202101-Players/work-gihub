Rails.application.routes.draw do
  get 'customers/show'
  scope module: :admin do
    devise_for :admins
  end

  namespace :admin do
    resources :customers
  end
  
  scope module: :customers do
    devise_for :customers
  end
  # ↓↓保留中↓↓↓
  # devise_for :publics
  # devise_for :users
  # ↑↑保留中↑↑↑

  root 'homes#top'

  namespace :public,path: "" do
    resource :customers,only: [:edit, :update]
    get '/customers/my_page', to: 'customers#show'
    get '/customers/quit', to: 'customers#quit'
    patch 'customers/withdraw', to: 'customers#withdraw'
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end