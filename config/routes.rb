Rails.application.routes.draw do

 devise_for :customers, :controllers => {
  :sessions => 'customers/sessions',
  :passwords => 'customers/passwords',
  :registrations => 'customers/registrations',
  }

  devise_for :admins, :controllers => {
  :sessions => 'admins/sessions',
  :passwords => 'admins/passwords',
  :registrations => 'admins/registrations',
  }

  root to: "homes#top"

  namespace :admin do
    resources :orders, only: [:show]
    resources :customers, only: [:index, :show, :edit, :update]
    resources :genres, only: [:index, :edit, :create, :update]
    resources :items, only: [:index, :new, :create, :show, :edit, :update]
    resources :homes, only: [:top, :about]
  end

  namespace :public do
    get 'addresses/index'
    get 'addresses/edit'
  end
  namespace :public do
    get 'orders/new'
    get 'orders/index'
    get 'orders/show'
    get 'orders/complete'
  end
  namespace :public do
    get 'cart_items/index'
  end
  namespace :public do
    get 'customers/show'
    get 'customers/edit'
    get 'customers/confirm'
  end
  namespace :public do
    get 'sessions/new'
  end
  namespace :public do
    get 'registrations/new'
  end
  namespace :public do
    get 'items/show'
    get 'items/index'
  end
  namespace :public do
    get 'homes/top'
    get 'homes/about'
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
