require 'rails_helper'

RSpec.describe SessionsController, type: :controller do
  let(:user) { create :user }
  let(:params) do
    {
      email: user.email,
      password: user.password
    }
  end

  context "when I use an incorrect login" do 
    let(:params) do
      { 
        password: 'garbage' 
      }
    end

    it 'shows me the login page again' do
      send_login_request

      expect(response).to redirect_to(login_path)
    end
  end

  context 'when I use a correct login' do

    it 'it takes me to the home page' do
      send_login_request

      expect(response).to redirect_to(root_path)
    end

    it 'logs me out when click logout' do 
      send_login_request
  
      delete :destroy

      expect(response).to redirect_to(root_path)
    end
  end

  def send_login_request
    post :create, params
  end

end