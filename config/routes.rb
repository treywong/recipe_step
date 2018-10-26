Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'users/index'
  root 'users#index'

  resources :recipes, controller: "recipes"
  get "/recipes/user/:id" => "recipes#user_recipe", as: "user_recipe"
  get "/recipes/favourite/user/:id" => "recipes#favourite", as: "favourite_recipe"

  get "/search" => "searches#_search", as: "searching"
  get "/advance_search" => "searches#advance_search"
  post "/advance_searching" => "searches#advance_searching", as: "advance_searching"

  get "/login" => "users#login"
  get "/logout" => "users#logout"
  get "/signup" => "users#signup"
  post "/login" => "users#login_check", as: "login_check"
  post "/signup" => "users#signup_create", as: "signup_create"

  get "/admin/user_management" => "admin#user_management", as: "user_management"
end
