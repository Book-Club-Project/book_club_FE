require 'rails_helper'

RSpec.describe 'Books Discover/Index' do
  it 'searches for book by keyword', :vcr do
    visit('/discover')
    expect(page).to have_button('Search')

    fill_in :search, with: 'pride'
    click_button 'Search'
    expect(current_path).to eq('/discover')

    expect(page).to have_content('Pride and Prejudice')
  end

  it 'fails search if no keyword is given', :vcr do
    visit('/discover')
    expect(page).to have_button('Search')

    fill_in :search, with: ""
    click_button 'Search'
    expect(current_path).to eq('/discover')
    expect(page).to have_content("We failed you or this book does not exist")
  end

  it 'checks if book title is a link and routes to show page', :vcr do
    visit('/discover')

    fill_in :search, with: 'pride'
    click_button 'Search'

    expect(page).to have_content('Pride and Prejudice')

    click_link "Pride and Prejudice"
    expect(current_path).to eq("/books/gwgON2IwgDUC")
  end
end
