class Category < ActiveRecord::Base
  has_many :products

  validates :name, uniqueness: true
  validates :name, presence: true

  before_save :naming_convention

  def naming_convention
    self.name = self.name.titleize.pluralize
  end

end