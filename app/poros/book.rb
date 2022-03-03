class Book
  attr_reader :id,
              :title,
              :author,
              :summary,
              :rating,
              :genre,
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
