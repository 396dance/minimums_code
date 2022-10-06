Rails.application.routes.draw do

  namespace :public do
    get 'outfits/index'
    get 'outfits/show'
  end
# 顧客側
  devise_scope :user do
    post '/users/guest_sign_in', to: 'users/sessions#guest_sign_in'
  end

  scope module: :public do
    devise_for :users, skip: [:passwords],  controllers: {
      registrations: "public/registrations",
      sessions: 'public/sessions'
    }
    root to: "homes#top"
    resources :outfits, only: [ :index, :show, :create]
    get "about" => "homes#about"
    get '/users/mypage' =>'users#show'
    # get 'outfits' => 'outfits#index'
  end

# 管理者側
  devise_for :admins, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
  }

  # 管理者側urlにadminを入れる記述(後で必要なものだけにする)
  namespace :admin do
    resources :outfits, only: [ :index, :show]
    resources :users,   only: [ :index, :edit, :update]
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
