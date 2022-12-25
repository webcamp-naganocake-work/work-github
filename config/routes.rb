Rails.application.routes.draw do

  devise_for :customers,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
  }

  devise_for :admin,skip: [:registrations, :passwords], controllers: {
  sessions: "admin/sessions"
  }

  scope module: :public do
    resources :items, only: [:index,:show]
    resources :cart_items, only: [:index,:update,:create,:destroy]
    resources :orders, only: [:new,:create,:index,:show]
    resources :addresses, only: [:index,:edit,:create,:destroy,:update]
    root to: 'homes#top'
    get '/about' => 'homes#about'
    get '/customers/mypage' => 'customers#show'
    get '/customers/information/edit' => 'customers#edit',as: "edit_customer"
    patch '/customers' => 'customers#update'
    get '/customers/confirm' => 'customers#confirm'
    patch '/customers/withdrawal' => 'customers#withdrawal'
    delete '/cart_items/all_destroy' => 'cart_items#all_destroy'
    post '/orders/confirm' => 'orders#confirm'
    get '/orders/complete' => 'orders#complete'
  end

  namespace :admin do
    root to: 'homes#top'
    resources :homes
    resources :items, only: [:index,:new,:create,:show,:edit,:update]
    resources :genres, only: [:index,:create,:edit,:update]
    resources :customers, only: [:index,:show,:edit,:update]
    resources :orders, only: [:show,:update]
    resources :order_details, only: [:update]
  end

  #test
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
