require 'rails_helper'

RSpec.describe Quote do
  it 'exists and has attributes' do
    data = {
      attributes: {
        quote: 'This is a quote.',
        author: 'Me'
      }
    }

    quote = Quote.new(data)

    expect(quote).to be_a Quote
    expect(quote.author).to eq('Me')
    expect(quote.quote).to eq('This is a quote.')
  end
end
