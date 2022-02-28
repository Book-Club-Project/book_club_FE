require 'rails_helper'

RSpec.describe 'Books Show Page' do
  it 'shows the book details for Pride and Prejudice', :vcr do
    visit "/books/s1gVAAAAYAAJ"
    save_and_open_page
    expect(page).to have_content('Pride and Prejudice')
  end
end
