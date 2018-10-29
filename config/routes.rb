Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'users/index'
  root 'users#index'

  resources :recipes, controller: "recipes"
   get "/users/:id" => "users#show"
  get "/recipes/user/:id" => "recipes#user_recipe", as: "user_recipe"
  get "/recipes/favourite/user/:id" => "recipes#favourite", as: "favourite_recipe"
  post "/favourite/:id" => "recipes#favourite_new", as: "favourite_new"
  delete "/favourite/:id" => "recipes#favourite_destroy", as: "favourite_destroy"
  delete "/recipes/:id" => "recipes#destroy", as: "destroy_recipe"

  get "/search" => "searches#_search", as: "searching"
  get "/advance_search" => "searches#advance_search"
  post "/advance_searching" => "searches#advance_searching"

  get "/login" => "users#login"
  get "/logout" => "users#logout"
  get "/signup" => "users#signup"
  post "/login" => "users#login_check", as: "login_check"
  post "/signup" => "users#signup_create", as: "signup_create"

  get "/admin/user_management" => "admins#user_management", as: "user_management"
  delete "/users/:id" => "admins#user_delete", as: "user_delete"
end
