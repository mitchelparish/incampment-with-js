class Camp < ApplicationRecord
  has_many :reviews
  has_many :users, through: :reviews
  has_many :camp_categories
  has_many :categories, through: :camp_categories

  validates_presence_of :name, :state, :description, :lat, :lng
  validates :name, uniqueness: true
  validates :lat , numericality: { greater_than_or_equal_to:  -90, less_than_or_equal_to:  90 }
  validates :lng, numericality: { greater_than_or_equal_to: -180, less_than_or_equal_to: 180 }
end
