require 'rails_helper'

RSpec.describe Quote do
  let(:quote) { Quote.new({ attributes: {quote: 'This is a quote.', author: 'Me'} }) }

  it 'exists' do
    expect(quote).to be_a Quote
  end

  it 'has attributes' do
    expect(quote.author).to eq('Me')
    expect(quote.quote).to eq('This is a quote.')
  end
end
