class Product < ActiveRecord::Base
  belongs_to :category

  has_many :product_oils
  has_many :oils, through: :product_oils

  has_many :volume_costs, :dependent => :destroy

  validates :name, uniqueness: true
  validates :name, :description, presence: true

  before_save :naming_convention

  scope :hand_creams, -> { joins(:category).where('categories.name = ?', "Hand Creams") }
  scope :sprays, -> { joins(:category).where('categories.name = ?', "Sprays") }
  scope :lip_glosses, -> { joins(:category).where('categories.name = ?', "Lip Glosses") }
  scope :scrubs, -> { joins(:category).where('categories.name = ?', "Scrubs") }

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
    self.name = self.name.capitalize
  end

end