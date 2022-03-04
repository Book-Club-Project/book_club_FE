require 'rails_helper'

RSpec.describe UserFacade do
  describe 'class methods' do
    describe 'find_user' do
      it 'returns a user object', :vcr do
        user = UserFacade.find_user('1')

        expect(user).to be_a User
        expect(user.email).to eq('1@mail.com')
        expect(user.id).to eq('1')
        expect(user.username).to eq('1')
      end
    end

    describe 'all_users' do
      it 'returns all users in the database', :vcr do
        users = UserFacade.all_users

        users.each do |user|
          expect(user).to be_a User
          expect(user.email).to_not be_nil
          expect(user.id).to_not be_nil
          expect(user.username).to_not be_nil
        end
      end
    end
  end
end
