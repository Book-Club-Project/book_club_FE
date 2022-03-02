class Book
  attr_reader :title,
              :author,
              :summary,
              :reviews,
              :book_cover,
              :rating,
              :genre,
              :id,
              :image

  def initialize(data)
    @id = data[:id]
    @title = data[:attributes][:title]
    @author = data[:attributes][:authors]
    @summary = data[:attributes][:description]
    @rating = data[:attributes][:rating]
    @genre = data[:attributes][:genres]
    @image = data[:attributes][:image]
  end

end
