class ApplicationController < ActionController::Base
  helper_method :current_user, :logged_in?
  # Make these methods (defined below) available to views
  
  def logged_in?
   !!session[:user_id]
  end

  def current_user
   user ||= User.find(session[:user_id])
  end

  def login_required
   redirect_to :root unless logged_in?
  end

  def permission_required
   return head(:forbidden) unless current_user == @user
  end
end
