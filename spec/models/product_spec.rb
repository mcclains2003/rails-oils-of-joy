require 'rails_helper'

RSpec.describe Product, type: :model do

  describe 'associations & validations' do 
    it { should belong_to(:category) }
    it { should have_many(:oils).through(:product_oils) }
    it { should have_many(:volume_costs) }
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:description) }
    it { should validate_presence_of(:category_id) }
    it { should validate_uniqueness_of(:name) }

    it "is invalid without an oil selected" do 
      product = Product.new(oil_ids: nil)
      product.valid?
      expect(product.errors[:oil_ids]).to include("must select at least one Oil")
    end
  end

end