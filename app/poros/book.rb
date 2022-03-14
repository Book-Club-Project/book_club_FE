class Book
  attr_reader :id,
              :title,
              :author,
              :summary,
              :rating,
              :genre,
              :image,
              :larger_image

  def initialize(data)
    @id = data[:id]
    @title = data[:attributes][:title]
    @author = data[:attributes][:authors]
    @summary = data[:attributes][:description]
    @rating = data[:attributes][:rating]
    @genre = data[:attributes][:genres]
    @image = data[:attributes][:image]
    @larger_image = data[:attributes][:larger_image]
  end

end
