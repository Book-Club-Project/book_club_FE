class BookService < BackendService
  def self.search_books(query)
    response = parsed_response("/api/v1/books/search?title=#{query}")
  end

  def self.book_info(book_id)
    response = parsed_response("api/v1/books/#{book_id}")
  end
end
