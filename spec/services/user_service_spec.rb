require 'rails_helper'

RSpec.describe UserService do
  describe 'class methods' do
    it 'returns a user' do
      user = UserService.get_user(user_id)
    end
  end
end
