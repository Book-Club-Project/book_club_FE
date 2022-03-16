class NytBook
  attr_reader :rank,
              :title,
              :author,
              :description,
              :isbn,
              :image

  def initialize(data)
    @rank = data[:rank]
    @title = data[:title]
    @author = data[:author]
    @description = data[:description]
    @isbn = data[:primary_isbn10]
    @image = data[:book_image]
  end

end
