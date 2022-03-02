require 'rails_helper'

RSpec.describe 'Books Show Page' do
  it 'shows the book details for Pride and Prejudice', :vcr do
    visit "/books/gwgON2IwgDUC"

    expect(page).to have_content('Pride and Prejudice')
    expect(page).to have_button('Create Book Club')
    expect(page).to have_content('Jane Austen')
    expect(page).to have_content('Fiction / Classics')
  end
end
