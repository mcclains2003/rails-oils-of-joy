require 'rails_helper'

RSpec.describe User, type: :model do

  describe 'associations & validations' do 
    it { should have_secure_password }
    it { should validate_confirmation_of(:password) }
    it { should validate_presence_of(:password_confirmation) }
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:email) }
    it { should validate_uniqueness_of(:email) }
    it { should allow_value('shaun@shaun.com', 'shaun.mcclain@mcclain.com').for(:email) }
    it { should_not allow_value('shaunmcclain.com', '@mcclain.com', 'shaun@michael.mcclain').for(:email) }
  end

end