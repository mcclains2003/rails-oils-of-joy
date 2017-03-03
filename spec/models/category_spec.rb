require 'rails_helper'

RSpec.describe Category, type: :model do

  describe 'associations & validations' do 
    it { should have_many(:products) }
    it { should validate_presence_of(:name) }
    it { should validate_uniqueness_of(:name) }
  end

  describe 'methods' do 
    it "returns the name of the category capitalized and plural" do
      category = Category.new(name: 'fresh flower')
      expect(category.naming_convention).to eq 'Fresh Flowers'
    end
  end

end