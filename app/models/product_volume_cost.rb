class ProductVolumeCost < ActiveRecord::Base
  belongs_to :product
  belongs_to :volume_cost
end
