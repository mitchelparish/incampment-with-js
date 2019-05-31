class UsersController < ApplicationController
  before_action :validate_user

  def show
    respond_to do |format|
      format.html {
        render :show
      }
      format.json {
        render json: @user
      }
    end
  end
end
