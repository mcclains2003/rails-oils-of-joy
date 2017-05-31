class VolumeCostSerializer < ActiveModel::Serializer
  attributes :volume, :cost
  belongs_to :product
end
