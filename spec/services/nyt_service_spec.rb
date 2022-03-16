require 'rails_helper'

RSpec.describe NytService do
  describe 'class methods' do
    it 'returns the best sellers list for hardcover fiction', :vcr do
      search = NytService.best_sellers_hardcover_fiction

      expect(search).to be_a Hash
      expect(search).to have_key(:results)

      expect(search[:results]).to be_a Hash
      expect(search[:results]).to have_key(:books)

      expect(search[:results][:books]).to be_an Array

      search[:results][:books].first(5).each do |book|
        expect(book).to be_a Hash
        expect(book).to have_key(:rank)
        expect(book).to have_key(:primary_isbn10)
        expect(book).to have_key(:author)
        expect(book).to have_key(:title)
        expect(book).to have_key(:book_image)
        expect(book).to have_key(:description)
      end
    end
  end
end
