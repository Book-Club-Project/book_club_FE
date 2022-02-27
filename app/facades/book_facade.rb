class BookFacade

def self.book_show(book_id)
  Book.new(BookService.book_info(book_id))
end
end
