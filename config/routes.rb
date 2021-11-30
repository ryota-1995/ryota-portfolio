Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root "homes#index"
  get "idols/index" => "idols#index"
  get "homes/index" => "homes#index"
  get "homes/search" => "homes#search"
  post "homes/create" => "homes#create"
  get "homes/new" => "homes#new"
  get "users/new" => "users#new"
  get "users/create" => "users#create"
end
