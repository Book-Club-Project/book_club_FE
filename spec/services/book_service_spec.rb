require 'rails_helper'

RSpec.describe BookService do
  describe 'class methods' do
    describe 'search_books(search)' do
      it 'returns list of books data that matches the search params', :vcr do

        search = BookService.search_books("Pride")[:data]

        expect(search).to be_an Array

        expect(search.first).to have_key :id
        expect(search.first[:id]).to be_a String

        expect(search.first[:attributes]).to have_key :title
        expect(search.first[:attributes][:title]).to be_a String

        expect(search.first[:attributes]).to have_key :authors
        expect(search.first[:attributes][:authors]).to be_an Array

        expect(search.first[:attributes]).to have_key :description
        expect(search.first[:attributes][:description]).to be_a String

        expect(search.first[:attributes]).to have_key :genres
        expect(search.first[:attributes][:genres]).to be_a Array

        expect(search.first[:attributes]).to have_key :rating
        expect(search.first[:attributes][:rating]).to be_a Integer

        # expect(search.first[:volumeInfo]).to have_key :categories
        # expect(search.first[:volumeInfo][:categories]).to be_an Array
        #
        # expect(search.first[:volumeInfo]).to have_key :imageLinks
        # expect(search.first[:volumeInfo][:imageLinks]).to have_key :thumbnail
        # expect(search.first[:volumeInfo][:imageLinks][:thumbnail]).to be_a String
      end

      describe 'book_info(book_id)' do
        it 'returns book data for a single volume', :vcr do
          book_data = BookService.book_info("ZV9DDwAAQBAJ")[:data]

          expect(book_data).to be_a Hash

          expect(book_data).to have_key(:id)
          expect(book_data[:id]).to be_a String

          expect(book_data[:attributes]).to have_key :title
          expect(book_data[:attributes][:title]).to be_a String

          expect(book_data[:attributes]).to have_key :authors
          expect(book_data[:attributes][:authors]).to be_an Array

          expect(book_data[:attributes]).to have_key :description
          expect(book_data[:attributes][:description]).to be_a String

          expect(book_data[:attributes]).to have_key :rating
          expect(book_data[:attributes][:rating]).to be_an Integer

          # expect(book_data[:volumeInfo]).to have_key :categories
          # expect(book_data[:volumeInfo][:categories]).to be_an Array
          #
          # expect(book_data[:volumeInfo]).to have_key :imageLinks
          # expect(book_data[:volumeInfo][:imageLinks]).to have_key :thumbnail
          # expect(book_data[:volumeInfo][:imageLinks][:thumbnail]).to be_a String
        end
      end
    end
  end
end
