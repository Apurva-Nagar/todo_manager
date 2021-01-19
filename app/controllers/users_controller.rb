class UsersController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    render plain: User.all.map { |user| user.to_pleasant_string }.join("\n")
  end

  def create
    name = params[:name]
    email = params[:email]
    password = params[:password]
    new_user = User.create!(
      name: name,
      email: email,
      password: password,
    )
    response_text = "New user created with id #{new_user.id}"
    render plain: response_text
  end

  def authenticate
    email = params[:email]
    password = params[:password]
    user = User.find_by email: email, password: password
    response_text = user ? "true" : "false"
    render plain: response_text
  end
end
