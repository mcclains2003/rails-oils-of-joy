require 'rails_helper'

RSpec.describe Oil, type: :model do

  describe 'associations & validations' do 
    it { should have_many(:products).through(:product_oils) }
    it { should validate_presence_of(:name) }
    it { should validate_uniqueness_of(:name) }
  end

end