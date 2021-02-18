Rails.application.routes.draw do

  # scope module: :admin do
    devise_for :admin
  # end

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
      patch '/customers/withdraw', to: 'customers#withdraw'

    resources :items,only: [:index, :show]

    resources :cart_items,only: [:index, :update, :create, :destroy]
      delete '/cart_items/destroy_all', to: 'cart_items#destroy_all'

    resources :orders,only: [:new, :create, :index, :show]
      get '/orders/thanks', to: 'orders#thanks'
      post '/orders/comfirm', to: 'orders#comfirm'

    resources :addresses,except: [:show, :new]


  end

  namespace :admin do
    resources :customers,except: [:create, :new, :destroy]

    resources :generes,except: [:new, :show, :destroy]

    resources :items,except: [:destroy]

    resources :orders,only: [:show]
     patch '/admin/orders/:order_id/order_details/:id', to: 'order_details#update'
  end



  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end