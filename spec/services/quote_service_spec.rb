require 'rails_helper'

RSpec.describe QuoteService, type: :service do
  describe 'class methods' do
    describe 'get_quote' do
      it 'returns data for a single quote', :vcr do
        quote = QuoteService.get_quote

        expect(quote).to be_a Hash
        expect(quote).to have_key(:data)
        
        expect(quote[:data][:attributes]).to have_key(:author)
        expect(quote[:data][:attributes]).to have_key(:quote)
      end
    end
  end
end
