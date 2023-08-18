Rails.application.routes.draw do
  root "public/homes#top"
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
  namespace :admin do
    get "/admin" => "admin#top"
    resources :orders, only: [:show]
    resources :customers, only: [:index, :show, :edit, :update]
    resources :genres, only: [:index, :edit, :create, :update]
    resources :items, only: [:index, :new, :create, :show, :edit, :update]
    resources :order_details, only: [:update]
  end
 namespace :public do
    get "/about" => "homes#about"
    get "orders/confirm" => "orders#confirm"
    get "/orders/confirm" => "orders#confirm"
    post "/orders/confirm" => "orders#confirm"
    get "/customers/confirm" => "customers#confirm"
    patch "/customers/withdrawal" => "customers#withdrawal"
    resources :items, only:[:show, :index]
    resources :cart_items, only:[:index, :create, :update, :destroy] do
      collection do
        delete "destroy_all"
      end
    end
    resources :orders, only:[:new, :create, :index, :show]
    resources :addresses, only:[:index, :create, :destroy, :show, :update, :edit]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
