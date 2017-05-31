class ProductSerializer < ActiveModel::Serializer
  attributes :id, :name, :description
  has_many :oils
  has_many :volume_costs
end
