class ReviewSerializer < ActiveModel::Serializer
  attributes :id, :rating, :comments, :user_id, :camp_id, :created_at, :updated_at
  belongs_to :camp
end
