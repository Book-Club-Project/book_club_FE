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
    @author = data[:attributes][:authors]
    @summary = data[:attributes][:description]
    # @reviews = data[:data][:attributes][:reviews]
    # @book_cover = data[:book_cover]
    @rating = data[:attributes][:rating]
    @genre = data[:attributes][:genres]

#     @title = data[:attributes][:title]
#     @author = data[:attributes][:authors]
#     @summary = data[:attributes][:description]
#     # @reviews = data[:attributes][:reviews]
#     # @book_cover = data[:book_cover]
#     @rating = data[:attributes][:rating]
#     @genre = data[:attributes][:genres]

  end

end
