class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  # before_action :login_required
  helper_method :current_user, :logged_in?

  def login_required
    return head(:forbidden) unless session.include? :user_id
  end

  def logged_in?
    !!current_user
  end

  def current_user
    if session[:user_id]
      @current_user = User.find(session[:user_id])
      @current_user
    else
      false
    end
  end

end
