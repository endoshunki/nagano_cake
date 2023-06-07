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
    get '/customers/mypage' => 'customers#show'
    get '/customers/mypage/edit' => 'customers#edit'
    patch '/customers/mypage/update' => 'customers#update'
    get '/customers/withdrawal_confirm' => 'customers#withdrawal_confirm'
    patch '/customers/withdrawal' => 'customers#withdrawal'
    resources :cart_items, only: [:index, :create, :update]
    delete '/cart_items/:id' => 'cart_items#destroy'
    delete '/cart_items/destroy_all' => 'cart_items#destroy_all'
  end
  # 管理者側のルーティング設定
  namespace :admin do
    root to: 'homes#top'
    
    resources :items
    resources :customers, only: [:index, :show, :edit, :update]
  end
  
  
end
