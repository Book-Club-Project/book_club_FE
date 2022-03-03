require 'rails_helper'

RSpec.describe BackendService do
  describe 'class methods' do
    describe '::conn' do
      it 'makes the connection to the API' do
        connection = BackendService.conn
        expect(connection).to be_a Faraday::Connection
      end

    describe '::parsed_response'
      it 'parses the response from an example call to the Users API', :vcr do
        response = BackendService.parsed_response('/api/v1/users')
        expect(response).to be_a Hash
        expect(response).to have_key(:data)
      end
    end

    describe '::parsed_post_response'
      it 'parses the response from an example call to post a Club', :vcr do
        data = {club: {:name=>"Hello123", :book_id=>"gwgON2IwgDUC", :host_id=>3}}

        response = BackendService.parsed_post_response("/api/v1/clubs", data)
        expect(response).to be_a Hash
      end
    end
  end
