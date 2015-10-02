class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def login
    if session[:user_id].blank?
      redirect_to new_user_path
    end
    @user_id = session[:user_id]
  end

  def current_user
    User.find(@user_id)
  end
end
