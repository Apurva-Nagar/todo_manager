Rails.application.routes.draw do
  get "/", to: "home#index"
  resources :todos
  resources :users
  get "/signin" => "sessions#new", as: :new_session
  post "/signin" => "sessions#create", as: :session
  post "/users/login", to: "users#authenticate"
end
