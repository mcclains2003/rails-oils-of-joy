class VolumeCostSerializer < ActiveModel::Serializer
  attributes :id, :volume, :cost, :category_id
  has_many :products
  belongs_to :category
end
