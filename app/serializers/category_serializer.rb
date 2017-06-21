class CategorySerializer < ActiveModel::Serializer
  attributes :id, :name
  has_many :products
  has_many :volume_costs
end
