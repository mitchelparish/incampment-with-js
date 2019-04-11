class UsersController < ApplicationController
  before_action :validate_user

  def show
    @user = User.find_by(id: params[:id])
  end
end
