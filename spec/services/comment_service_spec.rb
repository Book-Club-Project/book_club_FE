require 'rails_helper'

  RSpec.describe CommentService do
    describe 'class methods' do
      describe '::create_comment(data)' do

        let!(:user) { User.new({ id: '1', attributes: { name: "Raccoon22", email: "happy22@example.com" } }) }

        it 'Creates a comment with the given data', :vcr do

          data = {:title=>"Test123", :body=>"My comment", :user_id=> user.id, :club_id=> "1"}

          response = CommentService.create_comment(data)

          expect(response).to be_a Hash
          expect(response).to have_key :data

          expect(response[:data]).to have_key :id
          expect(response[:data][:id]).to be_a String

          expect(response[:data]).to have_key :attributes
          expect(response[:data][:attributes]).to be_a Hash

          expect(response[:data][:attributes]).to have_key :title
          expect(response[:data][:attributes][:title]).to be_a String

          expect(response[:data][:attributes]).to have_key :body
          expect(response[:data][:attributes][:body]).to be_a String

          expect(response[:data][:attributes]).to have_key :user_id
          expect(response[:data][:attributes][:user_id]).to be_an Integer

          expect(response[:data][:attributes]).to have_key :club_id
          expect(response[:data][:attributes][:club_id]).to be_an Integer
        end
      end
    end
  end
