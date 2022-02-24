require 'rails_helper'

RSpec.describe 'Books Show Page' do
  it 'shows the book details for Pride and Prejudice' do
    json_response = File.read('spec/fixtures/pride_and_prejudice.json')
    stub_request(:get, 'https://www.googleapis.com/books/v1/volumes/s1gVAAAAYAAJ').to_return(status: 200, body: json_response)
    visit "/books/s1gVAAAAYAAJ"

    save_and_open_page
    expect(page).to have_content('Pride and Prejudice')
  end
end
