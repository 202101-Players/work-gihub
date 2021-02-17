Rails.application.routes.draw do
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
  
  
  
  
  
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end