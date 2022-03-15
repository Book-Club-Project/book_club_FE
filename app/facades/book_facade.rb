class BookFacade
  def self.find_book(query)
    books = BookService.search_books(query)[:data]
    if books != nil
      books.map do |data|
        Book.new(data)
      end
    end
  end

  def self.book_show(book_id)
    book = BookService.book_info(book_id)[:data]
    Book.new(book)
  end

  def self.book_by_isbn(isbn)
    book = BookService.book_by_isbn(isbn)[:data]
    Book.new(book)
  end
end
