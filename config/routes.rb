Rails.application.routes.draw do
  devise_for :customers
  devise_for :admins

  # ↓↓保留中↓↓↓
  # devise_for :publics
  # devise_for :users
  # ↑↑保留中↑↑↑

  root 'homes#top'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end