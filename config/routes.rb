Rails.application.routes.draw do
  # get "todos", to: "todos#index"
  # post "todos", to: "todos#create"
  # get "todos/:id", to: "todos#show"
  resources :todos
  resources :users
  post "/users/login", to: "users#authenticate"
end
