require 'rails_helper'

RSpec.describe VolumeCost, type: :model do

  describe 'associations & validations' do 
    it { should belong_to(:product) }
    it { should validate_presence_of(:cost) }
    it { should validate_presence_of(:volume) }
    it { should validate_numericality_of(:cost) }
    it { should validate_numericality_of(:volume) }
  end

end