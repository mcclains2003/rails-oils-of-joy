class VolumeCostSerializer < ActiveModel::Serializer
  attributes :volume, :cost, :category_type
  has_many :products
end
