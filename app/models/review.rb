class Review < ApplicationRecord
  belongs_to :user
  belongs_to :camp

  # validates_presence_of :rating, :comments
end
