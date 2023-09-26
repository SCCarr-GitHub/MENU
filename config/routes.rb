Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations' }
  root to: "pages#home"

  resources :users do
    resources :customers, only: [:new, :create, :edit, :update]
    resources :restaurant, only: [:index, :new, :create, :show, :edit, :update]
  end
end