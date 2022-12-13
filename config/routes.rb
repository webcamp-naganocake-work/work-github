Rails.application.routes.draw do

  devise_for :customers,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
  }

  devise_for :admins,skip: [:registrations, :passwords], controllers: {
  sessions: "admin/sessions"
  }

  scope module: :public do
    resources :homes
    resources :items
    resources :customers
    resources :cart_items
    resources :orders
    resources :addresses
    root to: 'homes#top'
    get '/about' => 'homes#about'
    get '/customers/mypage' => 'customers#show'
    get '/customers/information/edit' => 'customers#edit'
    get '/customers/confirm' => 'customers#confirm'
    patch '/customers/withdrawal' => 'customers#withdrawal'
    delete '/cart_items/all_destroy' => 'cart_items#all_destroy'
    post '/orders/confirm' => 'orders#confirm'
    get '/orders/complete' => 'orders#complete'
  end

  namespace :admin do
    resources :homes
    resources :items
    resources :genres
    resources :customers
    resources :orders
    resources :order_details
  end

  #test
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
