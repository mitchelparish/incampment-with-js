class SessionsController < ApplicationController

  def new
    @user = User.new
  end

  def create
    if auth = request.env["omniauth.auth"]
      @user = User.find_or_create_by_omniauth(auth)
      session[:user_id] = @user.id

      redirect_to root_path
    else
    @user = User.find_by(email: params[:user][:email])
      if @user && @user.authenticate(params[:user][:password])
        session[:user_id] = @user.id
        redirect_to camps_path
      else
        render :new
      end
    end
  end 

  def destroy
    session.destroy
    redirect_to login_path
  end
end
