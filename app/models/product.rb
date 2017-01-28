class Product < ActiveRecord::Base
  belongs_to :category

  has_many :product_oils
  has_many :oils, through: :product_oils

  has_many :product_variants
  has_many :variants, through: :product_variants
end
