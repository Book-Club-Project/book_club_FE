require 'rails_helper'

RSpec.describe NytFacade do
  describe 'class methods' do
    describe 'best_sellers_hardcover_fiction' do
      it 'returns 5 nyt_book objects from the best seller list', :vcr do
        books = NytFacade.best_sellers_hardcover_fiction

        expect(books.count).to eq(5)

        books.each do |book|
          expect(book).to be_a NytBook
        end
      end
    end
  end
end
