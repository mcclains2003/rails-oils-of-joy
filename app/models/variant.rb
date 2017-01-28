class Variant < ActiveRecord::Base
  has_many :product_variants
  has_many :products, through: :product_variants
end
