class ReviewsController < ApplicationController
  before_action :authenticate_user!, except: :top_rated

  def new
    @review = Review.new(camp_id: params[:camp_id])
  end

  def create
    @review = Review.new(reviews_params)
    @review.user = current_user

    if @review.save
      redirect_to camp_path(@review.camp)
    else
      render :new
    end
  end

  def show
    @review = Review.find(params[:id])
  end

  def edit
    @review = Review.find(params[:id])
  end

  def update
    @review = Review.find(params[:id])
    if @review.update(reviews_params)
      redirect_to user_path(current_user.id)
    else
      redirect_to edit_review_path
    end
  end

  def destroy
    if Review.find(params[:id]).destroy
      redirect_to profile_path
    else
      redirect_to profile_path
    end
  end

  def top_rated
    @reviews = Review.top_rated
  end

  private

  def reviews_params
    params.require(:review).permit(:rating, :comments, :camp_id)
  end
end
