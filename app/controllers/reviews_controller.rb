class ReviewsController < ApplicationController

  def new
    @review = Review.new(camp_id: params[:camp_id])
  end

  def create
    @review = Review.new(reviews_params)
    @review.user = current_user

    if @review.save
      redirect_to camp_path(@review.camp)
      # redirect_to camp_review_path(@review.camp, @review) - Specific review show page NO!
    else
    # add flash alert for unsuccessful form submission
    # Don't forget to assign the user
      render :new
    end
  end

  def show
    @review = Review.find(params[:id])
  end







  private

  def reviews_params
    params.require(:review).permit(:rating, :comments, :camp_id)
  end
end
