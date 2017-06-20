class Product < ActiveRecord::Base
  belongs_to :category

  has_many :product_oils
  has_many :oils, through: :product_oils

  has_many :volume_costs, :dependent => :destroy

  validates :name, uniqueness: true
  validates :name, :description, :category_id, presence: true
  validates :oil_ids, :presence => {:message => "must select at least one Oil" }

  before_save :naming_convention

  scope :sort_alpha, -> { order(:name) }
  # scope :hand_creams, -> { joins(:category).where('categories.name = ?', "Hand Creams") }
  # scope :sprays, -> { joins(:category).where('categories.name = ?', "Sprays") }
  # scope :lip_glosses, -> { joins(:category).where('categories.name = ?', "Lip Glosses") }
  # scope :scrubs, -> { joins(:category).where('categories.name = ?', "Scrubs") }

  def volume_costs_attributes=(volume_costs_attributes)
    self.volume_costs.destroy_all

    volume_costs_attributes.each do |attributes|
      next if attributes["volume"] === "0.0" || attributes["cost"] === "0.0"

      self.volume_costs << VolumeCost.find_or_create_by(attributes)
    end
  end

  def volumes_with_data
    volume_costs.where('volume > ? AND cost > ?', 0, 0)
  end

  def naming_convention
    self.name = self.name.capitalize
  end

end