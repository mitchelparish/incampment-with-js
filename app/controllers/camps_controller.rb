class CampsController < ApplicationController

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
      render :new
    end
  end

  def edit
  end

  def show
    @camp = Camp.find_by(id: params[:id])
  end

  private

  def camp_params
    params.require(:camp).permit(:name, :state, :description, :lat, :lng)
  end
end
