Rails.application.routes.draw do
  get "/", to: "home#index"
  resources :todos
  resources :users
  post "/users/login", to: "users#authenticate"
end
