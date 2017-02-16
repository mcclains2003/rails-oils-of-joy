class Product < ActiveRecord::Base
  belongs_to :category

  has_many :product_oils
  has_many :oils, through: :product_oils

  has_many :volume_costs

  def volume_costs_attributes=(volume_costs_hashes)
    volume_costs_hashes.each do |i, attributes|
      self.volume_costs.build(volume: attributes[:volume], cost: attributes[:cost])
    end
  end

end
