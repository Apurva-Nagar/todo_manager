class UsersController < ApplicationController
  skip_before_action :verify_authenticity_token

  def new
    render "users/new"
  end

  def index
    render plain: User.all.map { |user| user.to_pleasant_string }.join("\n")
  end

  def create
    User.create!(
      first_name: params[:first_name],
      last_name: params[:last_name],
      email: params[:email],
      password: params[:password],
    )
    redirect_to "/"
  end

  def authenticate
    email = params[:email]
    password = params[:password]
    user = User.find_by email: email, password: password
    response_text = user ? "true" : "false"
    render plain: response_text
  end
end
