class CampsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update]

  def index
    @camps = Camp.all
    @categories = Category.all
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

  def show
    @review = Review.new
    @camp = Camp.find(params[:id])
    respond_to do |f|
      f.html {render :show}
      f.json {render json: @camp}
    end
  end

  def edit
    @camp = Camp.find(params[:id])
  end

  def update
    @camp = Camp.find(params[:id])
    if @camp.update(camp_params)
      redirect_to @camp
    else
      redirect_to edit_camp_path
    end
  end

  private

  def camp_params
    params.require(:camp).permit(:name, :state, :description, :lat, :lng, category_ids:[])
  end
end
