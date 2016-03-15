Rails.application.routes.draw do

  get 'sessions/new'

  root to:'static_pages#home'
  get 'signup', to: 'users#new'
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  resources :relationships do
    member do
      get :following,:follower
    end
  end

  resources :users
  resources :microposts
  resources :sessions, only: [:new, :create, :destroy]
  resources :relationships, only: [:create, :destroy]
end
