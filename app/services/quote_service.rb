class QuoteService < BackendService
  def self.get_quote
    response = parsed_response("/api/v1/quote")
  end
end
