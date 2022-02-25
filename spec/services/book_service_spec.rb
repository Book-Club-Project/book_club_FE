require 'rails_helper'

RSpec.describe BookService do
  describe 'class methods' do
    describe 'search_books(search)' do
      it 'returns list of books data that matches the search params' do
        json_response = File.read("spec/fixtures/pride_and_prejudice.json")
        stub_request(:get, "http://localhost:3000/books/search?title=Pride").
        with(
          headers: {
         'Accept'=>'*/*',
         'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
         'User-Agent'=>'Faraday v2.2.0'
          }).
        to_return(status: 200, body: "", headers: {})

        search = BookService.search_books("Pride")

        expect(search).to be_an Array

        expect(search.first).to have_key :id
        expect(search.first[:id]).to be_a String

        expect(search.first).to have_key :volumeInfo
        expect(search.first[:volumeInfo]).to be_a Hash

        expect(search.first[:volumeInfo]).to have_key :title
        expect(search.first[:volumeInfo][:title]).to be_a String

        expect(search.first[:volumeInfo]).to have_key :authors
        expect(search.first[:volumeInfo][:authors]).to be_an Array

        expect(search.first[:volumeInfo]).to have_key :description
        expect(search.first[:volumeInfo][:description]).to be_a String

        expect(search.first[:volumeInfo]).to have_key :averageRating
        expect(search.first[:volumeInfo][:averageRating]).to be_an Integer

        expect(search.first[:volumeInfo]).to have_key :categories
        expect(search.first[:volumeInfo][:categories]).to be_an Array

        expect(search.first[:volumeInfo]).to have_key :imageLinks
        expect(search.first[:volumeInfo][:imageLinks]).to have_key :thumbnail
        expect(search.first[:volumeInfo][:imageLinks][:thumbnail]).to be_a String
      end

      describe 'book_info(book_id)' do
        it 'returns book data for a single volume' do
          json_response = File.read("spec/fixtures/pride.json")
          stub_request(:get, "http://localhost:3000/books/ZV9DDwAAQBAJ").
           with(
             headers: {
            'Accept'=>'*/*',
            'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
            'User-Agent'=>'Faraday v2.2.0'
             }).
           to_return(status: 200, body: json_response)
          book_data = BookService.book_info("ZV9DDwAAQBAJ")

          expect(book_data).to be_a Hash

          expect(book_data).to have_key(:id)
          expect(book_data[:id]).to be_a String

          expect(book_data).to have_key(:volumeInfo)
          expect(book_data[:volumeInfo]).to be_a Hash

          expect(book_data).to have_key(:volumeInfo)
          expect(book_data[:volumeInfo]).to be_a Hash

          expect(book_data[:volumeInfo]).to have_key :title
          expect(book_data[:volumeInfo][:title]).to be_a String

          expect(book_data[:volumeInfo]).to have_key :authors
          expect(book_data[:volumeInfo][:authors]).to be_an Array

          expect(book_data[:volumeInfo]).to have_key :description
          expect(book_data[:volumeInfo][:description]).to be_a String

          expect(book_data[:volumeInfo]).to have_key :averageRating
          expect(book_data[:volumeInfo][:averageRating]).to be_an Integer

          expect(book_data[:volumeInfo]).to have_key :categories
          expect(book_data[:volumeInfo][:categories]).to be_an Array

          expect(book_data[:volumeInfo]).to have_key :imageLinks
          expect(book_data[:volumeInfo][:imageLinks]).to have_key :thumbnail
          expect(book_data[:volumeInfo][:imageLinks][:thumbnail]).to be_a String
        end
      end
    end
  end
end
