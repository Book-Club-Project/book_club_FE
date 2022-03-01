require 'rails_helper'

RSpec.describe ClubFacade do
  describe '::get_club(id)' do
    it 'returns the club matching the id params', :vcr do
      club = ClubFacade.get_club(1)
      expect(club).to be_a Club
    end
  end

  describe '::get_club_users(id)' do
    it 'returns the users in the club', :vcr do
      users = ClubFacade.get_club_users(1)

      expect(users).to be_an Array
      users.each do |user|
        expect(user).to be_a User
      end
    end
  end

  describe '::get_club_comments(id)' do
    it 'returns the comments in the club', :vcr do
      comments = ClubFacade.get_club_comments(1)

      expect(comments).to be_an Array
      comments.each do |comment|
        expect(comment).to be_a Comment
      end
    end
  end
end
