Rails.application.routes.draw do

# 会員側
  # ゲストログイン
  devise_scope :user do
    post '/users/guest_sign_in', to: 'users/sessions#guest_sign_in'
  end

  # 会員側
  scope module: :public do
    devise_for :users, skip: [:passwords],  controllers: {
      registrations: "public/registrations",
      sessions: 'public/sessions'
    }
    root to: "homes#top"
    get "about" => "homes#about"
    resources :outfits, only: [:index, :show, :create, :destroy] do
      resource :favorites, only: [:create, :destroy]
      resources :outfit_comments, only: [:create, :destroy]
    end
    resources :users, only: [:show, :edit, :update]
  end

# 管理者側
  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
  }

  # 管理者側urlにadminを入れる記述(後で必要なものだけにする)
  namespace :admin do
    resources :outfits, only: [ :index, :show, :destroy] do
      resources :outfit_comments, only: [:destroy]
    end
    resources :users,   only: [ :index, :show, :edit, :update]
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
