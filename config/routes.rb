Rails.application.routes.draw do
  
  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
  }
  
  devise_for :customers,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
  }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
  # 会員側のルーティング設定
  scope module: :public do
    root to: 'homes#top'
    get '/homes/about' => 'homes#about'
    resources :items, only: [:index, :show]
  end
  # 管理者側のルーティング設定
  namespace :admin do
    get 'items' => 'items#index'
  end
  
  
end
