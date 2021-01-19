Rails.application.routes.draw do
  resources :todos
  resources :users
  post "/users/login", to: "users#authenticate"
end
