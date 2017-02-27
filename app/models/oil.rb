class Oil < ActiveRecord::Base
  has_many :product_oils
  has_many :products, through: :product_oils

  validates :name, uniqueness: true
  validates :name, presence: true
end
