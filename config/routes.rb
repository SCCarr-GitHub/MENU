Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations' }
  root to: "pages#home"

  resources :users do
    resources :customers, only: [:new, :create, :edit, :update]
  end
  resources :users do
    resources :restaurants, only: [:new, :create]
  end
  resources :restaurants, only: [:index, :show, :edit, :update] do
    resources :restaurant_menus, only: [:new, :create]
  end
  resources :restaurant_menus, only: [:show, :edit]
  #   resources :items
  # end
end
