class Product < ActiveRecord::Base
  belongs_to :category

  has_many :product_oils
  has_many :oils, through: :product_oils

  has_many :volume_costs, :dependent => :destroy

  validates :name, uniqueness: true

  def volume_costs_attributes=(volume_costs_hashes)
    volume_costs_hashes.each do |i, attributes|
      unless attributes[:volume] == "0" && attributes[:cost] == "0"
        self.volume_costs.build(attributes)
      end
    end
  end

  def volumes_with_data
    volume_costs.where('volume > ? AND cost > ?', 0, 0)
  end

end