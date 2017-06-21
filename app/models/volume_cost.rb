class VolumeCost < ActiveRecord::Base
  has_many :product_volume_costs
  has_many :products, through: :product_volume_costs
  belongs_to :category

  validates :volume, :cost, presence: true
  validates :volume, :cost, numericality: true

end
