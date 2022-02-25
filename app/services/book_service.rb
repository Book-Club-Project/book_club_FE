class BookService
  def self.conn
    conn = Faraday.new(url: "http://localhost:3000")
  end

  def self.parsed_response(url)
    response = conn.get(url)
    binding.pry
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.search_books(query)
    response = parsed_response("/api/v1/books/search?title=#{query}")
  end

  def self.book_info(book_id)
    response = parsed_response("/books/#{book_id}")
  end

end
