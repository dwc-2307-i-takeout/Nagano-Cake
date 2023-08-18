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


    get 'addresses/index'
    get 'addresses/edit'


    get 'orders/new'
    get 'orders/index'
    get 'orders/show'
    get 'orders/complete'


    get 'cart_items/index'


    get 'customers/show'
    get 'customers/edit'
    get 'customers/confirm'

    get 'sessions/new'

    get 'registrations/new'

    get 'items/show'
    get 'items/index'

    get 'homes/top'
    get 'homes/about'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
