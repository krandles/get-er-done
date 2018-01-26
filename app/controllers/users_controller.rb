class UsersController < ApplicationController
  skip_before_action :login_required, only: [:new, :create]
  # before_action :skip_password_attribute, only: :update
  before_action :user_params, only: [:create, :update]

  def show
    @user = User.find_by_id(params[:id])

    redirect_to '/404' if @user.blank?
  end

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.valid?
      @user.level = 1
      @user.experience = 0
      @user.next_level = 5
      @user.save
      if !current_user
        session[:user_id] = @user.id
      end
      redirect_to @user
    else
      flash[:errors] = @user.errors.full_messages
      redirect_to new_user_path
    end
  end

  def edit
    @user = User.find(params[:id])

    redirect_to '/404' if @user.blank?
  end

  def update
    @user = User.find(params[:id])
    if params[:user][:password].blank? && params[:user][:password_confirmation].blank?
      params[:user].delete(:password)
      params[:user].delete(:password_confirmation)
      @user.skip_password_validation = true
    end
    @user.update_attributes(user_params)
    if @user.valid?
      @user.save
      redirect_to @user
    else
      flash[:errors] = @user.errors.full_messages
      redirect_to edit_user_path(@user.id)
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to root_path
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :user_name, :email, :password, :password_confirmation, :next_level, :experience, :level, :admin)
  end

  # def skip_password_attribute
  #   if params[:user][:password].blank? && params[:user][:password_confirmation].blank?
  #     params.except(:password, :password_validation)
  #   end
  # end

end
