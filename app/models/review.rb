class Review < ApplicationRecord
  belongs_to :user
  belongs_to :camp, dependent: :destroy

  validates_presence_of :rating, :comments

  def self.top_rated
    self.where(rating: 5).limit(10)
  end
end
