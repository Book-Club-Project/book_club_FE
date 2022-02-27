class Book
  attr_reader :title,
              :author,
              :summary,
              :reviews,
              :book_cover,
              :rating,
              :genre
  def initialize(data)
    @title = data[:data][:attributes][:title]
    @author = data[:data][:attributes][:authors][0]
    @summary = data[:data][:attributes][:description]
    # @reviews = data[:data][:attributes][:reviews]
    # @book_cover = data[:book_cover]
    @rating = data[:data][:attributes][:rating]
    @genre = data[:data][:attributes][:genres][0]
  end
end
