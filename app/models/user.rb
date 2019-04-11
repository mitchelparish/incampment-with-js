class User < ApplicationRecord
  has_many :reviews
  has_many :camps, through: :reviews

  has_secure_password
  # validates_presence_of :first_name, :last_name, :email
  # validates :email, uniqueness: true

  def self.find_or_create_by_omniauth(auth)
    self.where(:email => auth[:info][:email]).first_or_create do |user|
      user.password = SecureRandom.hex
    end
  end
end
