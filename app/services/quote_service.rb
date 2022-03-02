class QuoteService

  def self.conn
    conn = Faraday.new(url: "http://localhost:3000/")
  end

  def self.parsed_response(url)
    response = conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.get_quote
    response = parsed_response("/api/v1/quote")
  end
end
