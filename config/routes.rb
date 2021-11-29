Rails.application.routes.draw do
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root "homes#index"
  resources :login, only: [:index, :show]
  resources :homes, only: [:index, :create]
  get "idols/index" => "idols#index"
  get "homes/search" => "homes#search"
end
