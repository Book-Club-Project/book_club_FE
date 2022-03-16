class NytFacade

  def self.best_sellers_hardcover_fiction
    data = NytService.best_sellers_hardcover_fiction

    books = data[:results][:books].first(5).map do |book|
      NytBook.new(book)
    end
  end

end
