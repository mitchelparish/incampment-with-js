class Review < ApplicationRecord
  belongs_to :user
  belongs_to :camp

  validates_presence_of :rating, :comments

  def top_reviews
    Review.where(rating: 5)
  end
end
