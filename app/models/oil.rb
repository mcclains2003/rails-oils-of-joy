class Oil < ActiveRecord::Base
  has_many :product_oils
  has_many :products, through: :product_oils

  has_many :oil_benefits
  has_many :benefits, through: :oil_benefits

  validates :name, uniqueness: true
  validates :name, presence: true
end
