Rails.application.routes.draw do

  root "homes#top"
  get "/about" => "homes#about"
  get '/search', to: 'searchs#search'
  #---customer側で指定したいルーティング---
  namespace :customer do
    resources :customers,only: [:show,:index,:edit,:update] do
      resources :relationships, only: [:create, :destroy]
      get 'followings' => 'relationships#followings', as: 'followings'
      get 'followers' => 'relationships#followers', as: 'followers'
    end  
    resources :todolists do
      resource :favorites, only: [:create, :destroy]
      resources :post_comments, only: [:create, :destroy]
    end
  end
  #---------------------------------------
  # 顧客用
  # URL /customers/sign_in ...
  devise_for :customers,skip: [:passwords,], controllers: {
  registrations: "customer/registrations",
  sessions: 'customer/sessions'
  }

  # 管理者用
  # URL /admin/sign_in ...
  devise_for :admin,skip: [:registrations, :passwords], controllers: {
  sessions: "admin/sessions"
  }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  #---admin側で指定したいルーティング---
  namespace :admin do
  get "homes/top" => "homes#top"
   resources :lists
   resources :genres
   resources :customers
  end
  #-------------------------------------

end
