class NytService

  def self.best_sellers_hardcover_fiction
    response = parsed_response("/svc/books/v3/lists/current/hardcover-fiction.json?api-key=#{ENV['NYT_API_KEY']}")
  end

  private

  def self.conn
    conn = Faraday.new(url: "https://api.nytimes.com")
  end

  def self.parsed_response(url)
    response = conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end
end
