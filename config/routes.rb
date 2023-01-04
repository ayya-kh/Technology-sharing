Rails.application.routes.draw do
  # 顧客用
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
    resources :users, only: [:show, :edit, :update, :unsubscribe, :withdraw]
    resources :contributions, only: [:new, :index, :show, :edit, :update]
    post "contributions" => "contributions#create"

    resources :comments, only: [:create, :update]
    resources :likes, only: [:index, :show, :destroy]
  end

  namespace :admin do
    root "homes#top"
    resources :users, only: [:index, :show, :edit, :update]
    resources :comments, only: [:index, :update, :destroy]
  end
end
