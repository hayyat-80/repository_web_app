class UsersController < ApplicationController
  skip_before_action :authorized, only: [:new, :create]

  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    session[:user_id] = @user.id
    redirect_to welcome_path
  end

  private 
  def user_params
    params.require(:user).permit(:first_name,:last_name, :email, :password)
  end
end
