class CampSerializer < ActiveModel::Serializer
  attributes :id, :name, :state, :description, :created_at, :updated_at, :lat, :lng
  has_many :reviews
end
