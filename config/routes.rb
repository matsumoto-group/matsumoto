Rails.application.routes.draw do
  
  get '/customer/:id' => 'customers#show', as: 'customer'
  namespace :admins do
    namespace :customers do
      get 'orders/destroy'
    end
  end
  namespace :admins do
    get 'customers/index'
    get 'customers/edit'
    get 'customers/show'
  end
  devise_for :admins, :controllers => {
    :sessions =>'admins/sessions'
  }

  devise_for :customers, :controllers => {
    :registrations => 'customers/registrations',
    :sessions => 'customers/sessions'
  }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  root 'albums#index'
  
  # 管理者
  namespace :admins do
    resources :albums do
      collection do
        get :confirm
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
    resources :customers, only: [:index, :edit, :show, :update]
    resources :contacts, only: [:index, :show, :update, :destroy]

  end


  # エンドユーザー
  resources :albums, only: [:show]
  resources :orders, only: [:destroy, :create] do
    collection do
      get :confirm
      get :complete
    end
  end
  resources :albums, only: [:create, :update, :destroy]
  resources :contacts, only: [:new, :create] do
    collection do
      get :confirm
      get :complete
    end
  end
  resources :customers, only: [:edit, :update]
  
  
end
