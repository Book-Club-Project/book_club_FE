require 'rails_helper'

RSpec.describe BookFacade do
  it 'returns book by keyword', :vcr do
    book = BookFacade.find_book("pride")
    expect(book).to be_a(Array)
    expect(book.count).to eq(10)
  end

  it 'returns book by id', :vcr do
    books = BookFacade.book_show("ZV9DDwAAQBAJ")
    expect(books).to be_a(Book)
  end
end
