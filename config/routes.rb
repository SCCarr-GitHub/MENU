Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations' }
  root to: "pages#home"

  resources :users do
    resources :customers, only: [:new, :create, :edit, :update]
    resources :restaurants, only: [:new, :create] do
      resources :reviews, only: [:index, :new, :create, :show]
    end
  end

  resources :restaurants, only: [:index, :show, :edit, :update]
  resources :reviews, only: [:destroy]

    # resources :menu, only: [:new, :create]

  # resources :menu, only: [:show, :edit] do
  #   resources :items
  # end
end
