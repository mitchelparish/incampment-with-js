class CampsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update]

  # think about custom 403 forbidden pages

  def index
    @camps = Camp.all
  end

  def new
    @camp = Camp.new
  end

  def create
    @camp = Camp.new(camp_params)
    if @camp.save
      redirect_to @camp
    else
  # add flash alert for unsuccessful form submission
      render :new
    end
  end

  def show
    @camp = Camp.find(params[:id])
  end

  def edit
    @camp = Camp.find(params[:id])
  end

  def update
    @camp = Camp.find(params[:id])
    if @camp.update(camp_params)
      redirect_to @camp
    else
  # add flash alert for unsuccessful edit submission
      redirect_to edit_camp_path
    end
  end

  private

  def camp_params
    params.require(:camp).permit(:name, :state, :description, :lat, :lng)
  end
end
