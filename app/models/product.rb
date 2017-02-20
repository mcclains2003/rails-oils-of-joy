class Product < ActiveRecord::Base
  belongs_to :category

  has_many :product_oils
  has_many :oils, through: :product_oils

  has_many :volume_costs, :dependent => :destroy

  validates :name, uniqueness: true

  before_save :naming_convention

  scope :hand_cream, -> { joins(:category).where('categories.name = ?', "Hand Cream") }

  def volume_costs_attributes=(volume_costs_hashes)
    vc = []
    volume_costs_hashes.each do |i, attributes|
      vc << VolumeCost.find_or_create_by(attributes).id
    end
    self.volume_cost_ids = vc
  end

  def volumes_with_data
    volume_costs.where('volume > ? AND cost > ?', 0, 0)
  end

  def naming_convention
    self.attributes[name] = self.attributes[name].capitalize
  end

end