require 'rails_helper'

RSpec.describe BackendService do
  describe 'class methods' do
    describe '::conn' do
      it 'makes the connection to the API' do
        connection = BackendService.conn
        expect(connection).to be_a Faraday::Connection
      end
    end

    describe '::parsed_response' do
      it 'parses the response from an example call to the Users API', :vcr do
        response = BackendService.parsed_response('/api/v1/users')
        expect(response).to be_a Hash
        expect(response).to have_key(:data)
      end
    end

    describe '::parsed_club_post_response' do
    let!(:user) { User.new({ id: '1', attributes: { username: "Raccoon22", email: "happy22@example.com" } }) }
    let!(:club) { Club.new({ id: '1', attributes: { name: "Cool Club", book_id: "gwgON2IwgDUC", host_id: '1' } }) }
      it 'parses the response from an example call to the Clubs API', :vcr do
        data = {club: {:id=> '1', :name=>"Hello123", :host_id=> '1', :book_id=>"gwgON2IwgDUC"}}

        response = BackendService.parsed_club_post_response('/api/v1/clubs', data)
        expect(response).to be_a Hash
      end
    end

    describe '::parsed_post_response' do
    let!(:user) { User.new({ id: '1', attributes: { username: "Raccoon22", email: "happy22@example.com" } }) }
    let!(:club) { Club.new({ id: '1', attributes: { name: "Cool Club", book_id: "gwgON2IwgDUC", user_id: '1' } }) }
      it 'parses the response from an example call to post a Club', :vcr do
        data = {comment: {:title=>"Test123", :body=>"My comment", :user_id=> user.id, :club_id=> club.id}}

        response = BackendService.parsed_post_response("/api/v1/comments", data)

        expect(response).to be_a Hash
      end
    end
  end
end
