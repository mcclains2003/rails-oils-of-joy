class Product < ActiveRecord::Base
  belongs_to :category

  has_many :product_oils
  has_many :oils, through: :product_oils

  has_many :product_volume_costs
  has_many :volume_costs, through: :product_volume_costs

  validates :name, uniqueness: true
  validates :name, :description, :category_id, presence: true
  validates :oil_ids, :presence => {:message => "must select at least one Oil" }

  before_save :naming_convention

  scope :sort_alpha, -> { order(:name) }

  def volumes_with_data
    volume_costs.where('volume > ? AND cost > ?', 0, 0).order(:volume)
  end

  def naming_convention
    self.name = self.name.capitalize
  end

end