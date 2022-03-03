require 'rails_helper'

RSpec.describe QuoteFacade, type: :facade do
  describe 'class methods' do
    describe 'get_quote' do
      it 'returns a single quote object', :vcr do
        quote = QuoteFacade.get_quote

        expect(quote).to be_a Quote
        expect(quote.author).to_not be_nil
        expect(quote.author).to be_a(String)
        expect(quote.quote).to_not be_nil
        expect(quote.quote).to be_a(String)
      end
    end
  end
end
