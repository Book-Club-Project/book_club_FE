require 'rails_helper'

RSpec.describe 'Books Show Page' do
  it 'shows the book details for Pride and Prejudice', :vcr do
    visit "/books/gwgON2IwgDUC"
    expect(page).to have_content('Pride and Prejudice')
  end
end
