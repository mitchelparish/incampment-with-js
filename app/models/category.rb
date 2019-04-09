class Category < ApplicationRecord
  has_many :camp_categories
  has_many :camps, through: :camp_categories
end
