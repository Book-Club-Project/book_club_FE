require 'rails_helper'

RSpec.describe BookFacade do
  it 'returns book by keyword', :vcr do
    book = BookFacade.find_book("pride")
    expect(book).to be_a(Array)
    expect(book.count).to eq(10)
  end

  it 'returns book by id', :vcr do
    book = BookFacade.book_show("ZV9DDwAAQBAJ")
    expect(book).to be_a(Book)
  end

  it 'returns a book by isbn', :vcr do
    book = BookFacade.book_by_isbn("0671027034")
    expect(book).to be_a Book
  end
end
