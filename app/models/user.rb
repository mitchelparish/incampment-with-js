class User < ApplicationRecord
  has_many :reviews
  has_many :camps, through: :reviews

  has_secure_password
  validates :username, presence: true, uniqueness: true

  def self.find_or_create_by_omniauth(auth)
    self.where(:username => auth[:info][:nickname]).first_or_create do |user|
      user.password = SecureRandom.hex
    end
  end
end
