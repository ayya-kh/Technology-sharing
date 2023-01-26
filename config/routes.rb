Rails.application.routes.draw do
  # ユーザー用
  devise_for :users,skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }

  #ゲストログイン機能の設定
  devise_scope :user do
    post 'users/guest_sign_in', to: 'public/sessions#guest_sign_in'
  end

  # 管理者用
  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
    sessions: "admin/sessions"
  }

  scope module: "public" do
    root :to => "homes#top"
    get "about" => "homes#about"
    resources :registrations, only: [:new, :create]
    resources :sessions, only: [:new, :create, :destroy]

    get 'users/my_page' => "users#show"
    get 'users/information/edit' => "users#edit"
    patch 'users/information' => "users#update"
    get 'users/unsubscribe' => "users#unsubscribe"
    patch 'users/withdraw' => "users#withdraw"
    get 'users/favorites' => 'users#favorites'

    resources :contributions, only: [:new, :index, :show, :edit, :update, :destroy] do
      resources :favorites, only: [:create, :destroy]
      resources :comments, only: [:create]
    end

    post "contributions" => "contributions#create"
    get "contributions" => "contributions#search"
    resources :comments, only: [:create, :update, :edit, :destroy]
    patch "comments" => "commentss#update"
  end

  namespace :admin do
    root "homes#top"
    resources :users, only: [:index, :show, :edit, :update, :destroy]
    resources :comments, only: [:index, :update, :destroy]
  end
end
