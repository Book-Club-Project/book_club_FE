class Book
  attr_reader :title,
              :author,
              :summary,
              :reviews,
              :book_cover,
              :rating,
              :genre
  def initialize(data)
    @title = data[:title]
    @author = data[:author]
    @summary = data[:summary]
    @reviews = data[:reviews]
    @book_cover = data[:book_cover]
    @rating = data[:rating]
    @genre = data[:genre]
  end
end
