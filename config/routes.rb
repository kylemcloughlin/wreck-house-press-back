Rails.application.routes.draw do
  resources :advertisements
  resources :email_lists
  resources :editions
  # resources :raw_users
  get :fire, to: "raw_users#index"
  post :legacy, to: "raw_users#create"
  resources :subscriptions
  resources :users
  resources :sessions
  post :over_ride, to: "users#over_ride"
  post :over_ride_update, to: "users#over_ride_update"
  post :customers, to: "customers#create"
  delete :cancel, to: "customers#destroy"
  delete :logout, to: "sessions#destroy"
  get :logged_in, to: "sessions#logged_in"
  get :search, to: "articles#search" 
  post :about, to: "contact#create"
  post :rescue, to: "users#rescue"
  post :reset, to: "users#reset"
  post :set, to: "email_lists#set"
  post :new_email, to: "raw_users#new_email"
  resources :articles
  resources :subcategorizations
  resources :categorizations, param: :name

  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

