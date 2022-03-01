class Book
  attr_reader :title,
              :author,
              :summary,
              :reviews,
              :book_cover,
              :rating,
              :genre,
              :id
  def initialize(data)
    @id = data[:id]
    @title = data[:attributes][:title]
    @author = data[:attributes][:author]
    @summary = data[:attributes][:description]
    # @reviews = data[:attributes][:reviews]
    # @book_cover = data[:book_cover]
    @rating = data[:attributes][:rating]
    @genre = data[:attributes][:genre]
  end

end
