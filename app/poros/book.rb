class Book
  attr_reader :title,
              :author,
              :summary,
              :reviews,
              :book_cover,
              :rating,
              :genre
  def initialize(data)
    @title = data[:attributes][:title]
    @author = data[:attributes][:authors][0]
    @summary = data[:attributes][:description]
    # @reviews = data[:attributes][:reviews]
    # @book_cover = data[:book_cover]
    @rating = data[:attributes][:rating]
    @genre = data[:attributes][:genres]#[0]
  end
end
