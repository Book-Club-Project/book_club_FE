require 'rails_helper'

RSpec.describe UserService do
  describe 'class methods' do
    it 'returns a user', :vcr do
      user = UserService.get_user(1)

      expect(user).to be_a Hash
      expect(user[:data][:id]).to be_a String
      expect(user[:data][:attributes][:username]).to be_a String
      expect(user[:data][:attributes][:email]).to be_a String
    end
  end


  it 'creates a user', :vcr do
    user_params = {
      username: 'j@mail.com',
      email: 'j@mail.com'
    }
    user = UserService.post_user(user_params)

    # require "pry"; binding.pry
    expect(user).to be_a Hash
    expect(user[:data][:id]).to be_a String
    expect(user[:data][:attributes][:username]).to be_a String
    expect(user[:data][:attributes][:email]).to be_a String

  end
end
