Rails.application.routes.draw do
  resources :subscriptions
  resources :users
  resources :sessions
  delete :logout, to: "sessions#destroy"
  get :logged_in, to: "sessions#logged_in"
  resources :articles
  resources :subcategorizations
  resources :categorizations
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
