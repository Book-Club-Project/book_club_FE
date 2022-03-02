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
  end
end
