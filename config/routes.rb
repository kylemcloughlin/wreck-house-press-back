Rails.application.routes.draw do
  # resources :raw_users
  get :fire, to: "raw_users#index"
  post :legacy, to: "raw_users#create"
  resources :subscriptions
  resources :users
  resources :sessions
  post :customers, to: "customers#create"
  delete :cancel, to: "customers#destroy"
  delete :logout, to: "sessions#destroy"
  get :logged_in, to: "sessions#logged_in"
  post :about, to: "contact#create"
  post :rescue, to: "users#rescue"
  post :reset, to: "users#reset"
  resources :articles
  resources :subcategorizations
  resources :categorizations, param: :name

  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

