class Benefit < ActiveRecord::Base
  has_many :oil_benefits
  has_many :oils, through: :oil_benefits
end