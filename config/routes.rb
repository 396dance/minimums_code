Rails.application.routes.draw do

# 顧客側
  scope module: :public do
    devise_for :users, skip: [:passwords],  controllers: {
      registrations: "public/registrations",
      sessions: 'public/sessions'
    }
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
