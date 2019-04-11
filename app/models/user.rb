class User < ApplicationRecord
  has_many :reviews
  has_many :camps, through: :reviews

  has_secure_password
  validates_presence_of :first_name, :last_name, :email
  validates :email, uniqueness: true



end
