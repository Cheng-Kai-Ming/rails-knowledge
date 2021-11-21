Rails.application.routes.draw do
  root "pages#index"
  
  get "/sign_up", to: "users#sign_up"
  post "/account_check", to: "users#account_check"

  get "/sign_in", to: "users#sign_in"
  post "/account_login", to: "users#account_login"

  get "/already_login", to: "users#already_login"
end
