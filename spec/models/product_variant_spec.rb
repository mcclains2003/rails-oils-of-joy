require 'rails_helper'

RSpec.describe ProductVariant, type: :model do

  describe 'associations & validations' do 
    it { should belong_to(:product) }
    it { should belong_to(:variant) }
  end

end
