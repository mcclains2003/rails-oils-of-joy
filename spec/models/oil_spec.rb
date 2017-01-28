require 'rails_helper'

RSpec.describe Oil, type: :model do

  describe 'associations & validations' do 
    it { should have_many(:products).through(:product_oils) }
  end

end