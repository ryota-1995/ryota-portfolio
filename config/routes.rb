Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root "homes#index"
  get "idols/index" => "idols#index"
  get "homes/search" => "homes#search"
  post "homes/create" => "homes#create"
  get "/" => "homes#index"
  get "homes/new" => "homes#new"
  get "users/new" => "users#new"
  get "users/create" => "users#create"

  get "login" => "users#login_form"
  post "login" => "users#login"
  get "logout" => "users#logout"

  post "auth/:provider/callback", to: "users#googlecreate"
  get "auth/failure", to: redirect("/")
  get "signout", to: "users#googledestroy", as: "signout"
end
