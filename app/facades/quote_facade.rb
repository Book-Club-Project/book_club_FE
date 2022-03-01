class QuoteFacade

  def self.get_quote
    data = QuoteService.get_quote
    Quote.new(data[:data])
  end
end
