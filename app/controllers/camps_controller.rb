class CampsController < ApplicationController

  def index
    @camps = Camp.all
  end

  def show
    @camp = Camp.find(params[:id])
  end

  def new
    @camp = Camp.new
  end

  def create
    camp = Camp.create
    redirect_to @camp
  end

  private

  def post_params
    # params.require(:post).permit(:title, :content, category_ids:[], categories_attributes: [:name])
  end
end
