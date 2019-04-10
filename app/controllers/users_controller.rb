class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    if current_user == session[:user_id]
  end 

  end
end
