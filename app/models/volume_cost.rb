class VolumeCost < ActiveRecord::Base
  belongs_to :product

  validates :volume, :cost, numericality: true
end
