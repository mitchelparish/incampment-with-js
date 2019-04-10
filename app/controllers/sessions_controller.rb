class SessionsController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.find_by(email: params[:user][:email])
    if @user && @user.authenticate(params[:user][:password])
      session[:user_id] = @user.id
      redirect_to camps_path # @camps?
    else
      render :new
    end
  end

  def destroy
    session.destroy
    redirect_to login_path
  end
end
