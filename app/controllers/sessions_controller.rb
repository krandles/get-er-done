class SessionsController < ApplicationController
  # skip_before_action :login_required, only: [:new, :create]

  def new
    @user = User.new
  end

  def create
    @user = User.find_by(user_name: params[:user_name])
    # byebug
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to @user, :notice => "Welcome back, #{@user.first_name}"
    else
      flash.now.alert = "Invalid username or password"
      @user = User.new
      render :new
    end
  end

  def destroy
    session.delete(:user_id)
    redirect_to root_path
  end

  # private

  # def login(user)
  #   session[:user_id] = nil
  # end
end
