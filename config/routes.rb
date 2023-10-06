Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations' }
  root to: "pages#home"
  get '/search', to: 'pages#search', as: 'search_pages'

  resources :customers, only: [:new, :create, :edit, :update]
  resources :items, only: :update
  resources :items, only: :destroy, as: 'delete'
  resources :restaurants, only: [:new, :create] do
    resources :reviews, only: [:index, :new, :create, :show]
  end
  resources :restaurants, only: [:new, :create] do
    resources :restaurant_menus, only: [:new, :create, :index]
  end

  resources :restaurants, only: [:index, :show, :edit, :update]
  resources :reviews, only: [:destroy]

  resources :restaurant_menus, only: [:show, :edit] do
    resources :items, only: [:create]
  end

  get 'restaurant_menus/:restaurant_menu_id/items', to: 'items#create_items', as: 'create_items'
  post '/upvote/:id', to: 'ratings#upvote', as: 'upvote'
  get '/leaderboard', to: 'ratings#leaderboard', as: 'leaderboard'
  get '/tesseract/:id', to: 'pages#tesseract', as: 'tess_pages'
end
