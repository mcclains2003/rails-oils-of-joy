class OilSerializer < ActiveModel::Serializer
  attributes :id, :name, :description
  has_many :products
end
