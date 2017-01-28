require 'rails_helper'

RSpec.describe ProductOil, type: :model do

  describe 'associations & validations' do 
    it { should belong_to(:product) }
    it { should belong_to(:oil) }
  end

end