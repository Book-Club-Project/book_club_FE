require 'rails_helper'

RSpec.describe UserService do
  describe 'class methods' do
    it 'returns a user data', :vcr do
      response = UserService.get_user(1)
      expect(response).to be_a Hash


      expect(response).to have_key :id
      expect(response[:id]).to be_a String

      expect(response[:attributes]).to have_key :username
      expect(response[:attributes][:username]).to be_a String

      expect(response[:attributes]).to have_key :email
      expect(response[:attributes][:email]).to be_a String
    end
  end
end
