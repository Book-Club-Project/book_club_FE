class BookFacade
  def self.find_book(query)
    books = BookService.search_books(query)[:data]
    books.map do |data|
      Book.new(data)
    end
  end

  def self.book_show(book_id)
    book = BookService.book_info(book_id)[:data]

    Book.new(book)
  end
end
