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


  namespace :admins do
    get 'customers/index'
    get 'customers/edit'
    get 'customers/show'
  end


  # エンドユーザー
  resources :albums, only: [:show]

  resources :customers, only: [:show, :edit, :update]

  namespace :customers do
    resources :orders, only: [:new, :create] do
        collection do
        post :confirm
        get :complete
        end
    end
  end

  resources :albums, only: [:create, :update, :destroy]
  resources :contacts, only: [:new, :create] do
    collection do
      post :confirm
      get :complete
    end
  end


# 管理者

  namespace :admins do
    namespace :customers do
      get 'orders/destroy'
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

end