require 'rails_helper'

RSpec.describe Variant, type: :model do

  describe 'associations & validations' do 
    it { should have_many(:products).through(:product_variants) }
  end

end
