class UsersController < ApplicationController
  before_action :validate_user

  def show
    render json: @user, status: 200
  end
end
