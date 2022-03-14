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
        genres: "Historical Fiction",
        image: "http://books.google.com/books/publisher/content?id=ZV9DDwAAQBAJ&printsec=frontcover&img=1&zoom=5&edge=curl&imgtk=AFLRE710vah13TyV0fgjfeudOnVYaP3yNeaKEyHqda-BEpDz33sg3mZBn7ONkw-IiUspxCwbK18NQWIW52guRcpMEz8Qhx2Y0zrIsLcLTotaRUWTec_mp3Ye3G9y_bjjIColsk4KctMe&source=gbs_api",
        larger_image: "http://books.google.com/books/content?id=ZV9DDwAAQBAJ&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api"
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
    expect(book.image).to eq("http://books.google.com/books/publisher/content?id=ZV9DDwAAQBAJ&printsec=frontcover&img=1&zoom=5&edge=curl&imgtk=AFLRE710vah13TyV0fgjfeudOnVYaP3yNeaKEyHqda-BEpDz33sg3mZBn7ONkw-IiUspxCwbK18NQWIW52guRcpMEz8Qhx2Y0zrIsLcLTotaRUWTec_mp3Ye3G9y_bjjIColsk4KctMe&source=gbs_api")
    expect(book.larger_image).to eq("http://books.google.com/books/content?id=ZV9DDwAAQBAJ&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api")
  end
end
