Rails.application.routes.draw do

 devise_for :admins, :controllers => {
    :sessions =>'admins/sessions'
  }

  devise_for :customers, :controllers => {
    :registrations => 'customers/registrations',
    :sessions => 'customers/sessions'
  }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'albums#index'




  # エンドユーザー
  resources :albums, only: [:show] do 
    resource :cart_albums, only: [:create, :destroy]
  end

  match 'cart_albums/edit' => 'cart_albums#update_all', :as => 'update_all', :via => :put

  resources :customers, only: [:show, :edit, :update]
  post 'customers/:id/delete' => 'customers#delete', as: 'customer_delete'

  namespace :customers do
    resources :orders, only: [:new, :create, :update] do
        collection do
        post :confirm
        get :complete
        end
    end
    resource :order_albums, only: [:create]
  end

  resources :contacts, only: [:new, :create] do 
    collection do 
      post :confirm
      get :complete
    end
  end


# 管理者

  namespace :admins do
    resources :customers, only: [:index, :show, :edit, :update]
    post 'customers/:id/delete' => 'customers#delete'
  end

  namespace :admins do
    namespace :customers do
      get 'orders/destroy'
      get 'orders/update' => 'orders#update', as: 'orderup'
    end
  end

  namespace :admins do
    resources :albums do
      collection do
        get :confirm
      end
    end
  end

    namespace :albums do
      resources :discs, only: [:create, :update, :destroy]
      namespace :discs do
        resources :songs, only: [:create, :update, :destroy]
        resources :singers, only: [:create, :update, :destroy]
      end
    end

    namespace :customers do
      resources :orders, only: [:destroy]
    end

    namespace :admins do
      resources :contacts, only: [:index, :show, :destroy]
    end

    match 'orders/edit' => 'admins/customers/orders#update', :as => 'orders_update_all', :via => :put

end
