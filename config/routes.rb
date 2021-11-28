Rails.application.routes.draw do
  get 'users/new'
  get 'users/login'
  get 'users/index'
  get 'users/create'
  get 'users/update'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root "lives#index"
  resources :login, only: [:index, :show]
  get "idols/index" => "idols#index"
  get "lives/index" => "lives#index"
  get "lives/search" => "lives#search"
  get "lives/create" => "lives#create"
end
