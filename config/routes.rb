Rails.application.routes.draw do
  devise_for :users
    root to: "pages#home"

    resources :users do
      resources :restaurant, only: [:index, :new, :create, :show, :edit, :update]
    end
end
