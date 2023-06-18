class SessionsController < ApplicationController
  skip_before_action :authorized, only: [:new, :create, :welcome]

  def new
  end

  def create
    @user = User.find_by(email: params[:email])
    if @user && @user.authenticate(params[:password])
        session[:user_id] = @user.id
        redirect_to welcome_path
    else
        redirect_to login_path
    end
  end

  def welcome
    if params[:search] 
      @repositories = Repository.where("name LIKE ? OR description LIKE ?", "%#{params[:search]}%","%#{params[:search]}%")
    else
      @repositories = Repository.all
    end
  end

  def logout
    session[:user_id] = nil
  end

  def page_requires_login
  end
end
