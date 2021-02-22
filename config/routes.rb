Rails.application.routes.draw do
  
  scope module: :admin do
    devise_for :admins, skip: :all
    devise_scope :admin do
      get 'admin/sign_in' => 'sessions#new', as: :new_admin_session
      post 'admin/sign_in' => 'sessions#create', as: :admin_session
      delete 'admin/sign_out' => 'sessions#destroy', as: :destroy_admin_session
  end
end



  root 'homes#top'

  namespace :admin do
    resources :customers,except: [:create, :new, :destroy]

    resources :genres,except: [:new, :show, :destroy]

    resources :items,except: [:destroy]

    resources :orders,only: [:index, :show]
     patch '/admin/orders/:order_id/order_details/:id', to: 'order_details#update'
  end


  namespace :public,path: "" do
    resource :customers,only: [:edit, :update]
      get '/customers/my_page', to: 'customers#show'
      get '/customers/quit', to: 'customers#quit'
      patch '/customers/withdraw', to: 'customers#withdraw'

    resources :items,only: [:index, :show]

     delete '/cart_items/destroy_all', to: 'cart_items#destroy_all'
    resources :cart_items,only: [:index, :update, :create, :destroy]
      

    resources :orders,only: [:new, :create, :index, :show]
      get '/orders/thanks', to: 'orders#thanks'
      post '/orders/comfirm', to: 'orders#comfirm'

    resources :addresses,except: [:show, :new]


  end
  
    scope module: :customers do
    devise_for :customers
  end

    get 'top' => 'homes#top'
    get 'home/about' => 'homes#about'
    get 'search' => 'search#search'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end