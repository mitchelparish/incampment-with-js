class ReviewsController < ApplicationController

  def new
    @review = Review.new(camp_id: params[:camp_id])
  end

  def create
    @review = Review.new(review_params)
    if @review.save
      redirect_to @review
    else
    # add flash alert for unsuccessful form submission
    # Don't forget to assign the user
      render :new
    end
  end







  private

  def reviews_params
    params.require(:review).permit(:rating, :comments, :camp_id)
  end
end
