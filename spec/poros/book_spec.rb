require 'rails_helper'

RSpec.describe Book do
  it 'exists with attributes' do
    data = { title: "Pride and Prejudice",
             author: "Jane Austen",
             summary: "marriage plot",
             reviews: "wow, so good",
             book_cover: "cover_art_path",
             rating: 8.5,
             genre: "Historical Fiction"
           }


    book = Book.new(data)
    expect(book).to be_a(Book)
    expect(book.title).to eq("Pride and Prejudice")
    expect(book.author).to eq("Jane Austen")
    expect(book.summary).to eq("marriage plot")
    expect(book.reviews).to eq("wow, so good")
    expect(book.rating).to eq(8.5)
    expect(book.genre).to eq("Historical Fiction")
  end
end
