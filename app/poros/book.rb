class Book
  attr_reader :title,
              :author,
              :summary,
              :reviews,
              :book_cover,
              :rating,
              :subject #this is for genre and may need to move
  def initialize(data)
    @title = data[:title]
    @author = data[:author]
    @summary = data[:summary]
    @reviews = data[:reviews]
    @book_cover = data[:book_cover]
    @rating = data[:rating]
    @subject = data[:subject]
  end
end
