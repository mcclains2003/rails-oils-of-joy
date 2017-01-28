require 'rails_helper'

RSpec.describe Product, type: :model do

  describe 'associations & validations' do 
    it { should belong_to(:category) }

    it { should have_many(:oils).through(:product_oils) }
    it { should have_many(:variants).through(:product_variants) }
  end

end