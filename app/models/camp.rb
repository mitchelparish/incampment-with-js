class Camp < ApplicationRecord
  has_many :reviews
  has_many :users, through: :reviews
  has_many :camp_categories
  has_many :categories, through: :camp_categories



end
