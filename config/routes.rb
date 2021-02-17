Rails.application.routes.draw do
  get 'customers/show'
  scope module: :admin do
    devise_for :admins
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
    resources :customers
    get '/customers/my_page', to: 'customers#show'
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end