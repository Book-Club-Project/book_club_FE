require 'rails_helper'

RSpec.describe ClubService do
  context 'class methods' do
    context '::club(club_id)' do
      it 'returns all club data for a single club', :vcr do
        response = ClubService.club(1)

        expect(response).to be_a Hash

        expect(response).to have_key :data

        expect(response[:data]).to have_key :id
        expect(response[:data][:id]).to be_a String

        expect(response[:data][:attributes]).to have_key :name
        expect(response[:data][:attributes][:name]).to be_a String

        expect(response[:data][:attributes]).to have_key :host_id
        expect(response[:data][:attributes][:host_id]).to be_an Integer

        expect(response[:data][:attributes]).to have_key :book_id
        expect(response[:data][:attributes][:book_id]).to be_an Integer
      end
    end

    context '::club_users(club_id)' do
      it 'returns all user data associated with the club', :vcr do
        response = ClubService.club_users(1)

        expect(response).to be_a Hash

        expect(response).to have_key :data

        expect(response[:data].first).to have_key :id
        expect(response[:data].first[:id]).to be_a String

        expect(response[:data].first[:attributes]).to have_key :username
        expect(response[:data].first[:attributes][:username]).to be_a String

        expect(response[:data].first[:attributes]).to have_key :email
        expect(response[:data].first[:attributes][:email]).to be_a String
      end
    end

    context '::club_comments(club_id)' do
      it 'returns all comment data associated with the club', :vcr do
        response = ClubService.club_comments(1)

        expect(response).to be_a Hash

        expect(response).to have_key :data

        expect(response[:data].first).to have_key :id
        expect(response[:data].first[:id]).to be_a String

        expect(response[:data].first[:attributes]).to have_key :title
        expect(response[:data].first[:attributes][:title]).to be_a String

        expect(response[:data].first[:attributes]).to have_key :body
        expect(response[:data].first[:attributes][:body]).to be_a String

        expect(response[:data].first[:attributes]).to have_key :user_id
        expect(response[:data].first[:attributes][:user_id]).to be_an Integer

        expect(response[:data].first[:attributes]).to have_key :club_id
        expect(response[:data].first[:attributes][:club_id]).to be_an Integer
      end
    end

    # context '::club_create(club_params, headers)' do
    #   it 'creates a new club in the database', :vcr do
    #     params = { name: "Cool Club",
    #       host_id: 1,
    #       book_id: 2 }
    #     response = ClubService.club_create(params)
    #     club = ClubService.club(2)
    #     require "pry"; binding.pry
    #   end
    # end
  end
end
