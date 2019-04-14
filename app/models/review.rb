class Review < ApplicationRecord
  belongs_to :user
  belongs_to :camp

  validates_presence_of :rating, :comments

  def self.top_rated
    self.where(rating: 5).limit(10)
  end
end
