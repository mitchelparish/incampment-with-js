class ReviewsController < ApplicationController
  before_action :authenticate_user!, except: :top_rated

  def index
    camp = Camp.find(params[:camp_id])
    @reviews = camp.reviews
    render json: @reviews, status: 200
  end

  def create
    @review = Review.new(reviews_params)
    @review.user = current_user
    if @review.save
      render json: @review, status: 201
    else
      render :new
    end
  end

  def edit
    @review = Review.find(params[:id])

    if @review.user != current_user
      redirect_to camp_path(@review.camp)
    end
  end

  def update
    @review = Review.find(params[:id])
    if @review.update(reviews_params)
      redirect_to profile_path
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
