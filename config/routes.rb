Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations' }
  root to: "pages#home"
  get '/search', to: 'pages#search', as: 'search_pages'

    resources :customers, only: [:new, :create, :edit, :update]
    resources :restaurants, only: [:new, :create] do
      resources :reviews, only: [:index, :new, :create, :show]
    end
    resources :restaurants, only: [:new, :create] do
      resources :restaurant_menus, only: [:new, :create]
    end
  resources :restaurants, only: [:index, :show, :edit, :update]
  resources :reviews, only: [:destroy]
  resources :restaurant_menus, only: [:show, :edit]
end
