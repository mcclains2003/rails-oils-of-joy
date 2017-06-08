class ProductSerializer < ActiveModel::Serializer
  attributes :id, :name, :description
  has_many :oils
  has_many :volume_costs
  belongs_to :category
end
