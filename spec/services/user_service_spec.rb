require 'rails_helper'

RSpec.describe UserService do
  describe 'class methods' do
    it 'returns a user data', :vcr do
      response = UserService.get_user(1)
      expect(response).to be_a Hash

      expect(response).to have_key :data

      expect(response[:data]).to have_key :id
      expect(response[:data][:id]).to be_a String

      expect(response[:data][:attributes]).to have_key :username
      expect(response[:data][:attributes][:username]).to be_a String

      expect(response[:data][:attributes]).to have_key :email
      expect(response[:data][:attributes][:email]).to be_a String
    end
  end
end
