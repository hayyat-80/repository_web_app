Rails.application.routes.draw do
  root to: 'sessions#welcome'
  resources :repositories
  resources :users, only: [:new, :create]
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#logout'
  get 'welcome', to: 'sessions#welcome'
  get 'authorized', to: 'sessions#page_requires_login'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
