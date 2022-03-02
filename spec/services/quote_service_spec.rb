require 'rails_helper'

RSpec.describe QuoteService, type: :service do
  describe 'class methods' do
    describe 'get_quote' do
      it 'returns a single quote from the BE API', :vcr do
        quote = QuoteService.get_quote

        expect(quote).to be_a Hash
        expect(quote[:data][:attributes]).to have_key(:author)
        expect(quote[:data][:attributes]).to have_key(:quote)
      end
    end
  end
end
