class UsersController < ApplicationController
  skip_before_action :verify_authenticity_token
  skip_before_action :ensure_user_logged_in

  def new
    render "users/new"
  end

  def index
    render plain: User.all.map { |user| user.to_pleasant_string }.join("\n")
  end

  def create
    user = User.create!(
      first_name: params[:first_name],
      last_name: params[:last_name],
      email: params[:email],
      password: params[:password],
    )
    session[:current_user_id] = user.id
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
