Rails.application.routes.draw do
  resources :users
  resources :sessions
  resources :articles
  resources :subcategorizations
  resources :categorizations
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
