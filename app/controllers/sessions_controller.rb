class SessionsController < ApplicationController
  skip_before_action :login_required, only: [:new, :create]

  def new
    redirect_to '/' if logged_in?
  end

  def create
    @user = User.find_by(user_name: params[:user_name])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to @user, :notice => "Welcome back, #{@user.first_name}"
    else
      flash.now.alert = "Invalid username or password"
      @user = User.new
      redirect_to '/'
    end
  end

  def destroy
    session.delete(:user_id)
    redirect_to root_path
  end

end
