Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'users/index'
  root 'users#index'

  get "/login" => "users#login"
  get "/logout" => "users#logout"
  get "/signup" => "users#signup"
  post "/login" => "users#login_check", as: "login_check"
  post "/signup" => "users#signup_create", as: "signup_create"
end
