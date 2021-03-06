Rails.application.routes.draw do
  devise_for :users
  get 'index', to: 'home#index', as: 'index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'home#index'
  resources :users, only: [:show,:edit,:update]
end
