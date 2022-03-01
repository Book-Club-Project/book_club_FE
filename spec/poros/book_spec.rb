require 'rails_helper'

RSpec.describe Book do
  it 'exists with attributes' do
    data = {
      id: "gwgON2IwgDUC",
      attributes: {
             title: "Pride and Prejudice",
             authors: "Jane Austen",
             description: "marriage plot",
             reviews: "wow, so good",
             book_cover: "cover_art_path",
             rating: 8.5,
             genres: "Historical Fiction"
           }
         }

    book = Book.new(data)
    expect(book).to be_a(Book)
    expect(book.id).to eq("gwgON2IwgDUC")
    expect(book.title).to eq("Pride and Prejudice")
    expect(book.author).to eq("Jane Austen")
    expect(book.summary).to eq("marriage plot")
    expect(book.rating).to eq(8.5)
    expect(book.genre).to eq("Historical Fiction")
  end
end
