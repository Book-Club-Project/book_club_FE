require 'rails_helper'

RSpec.describe 'Books Discover/Index' do
  xit 'has links for Best Seller and Search' do
    visit('/discover')

    expect(page).to have_button('Best Sellers')
    click_button 'Best Sellers'
    expect(current_path).to eq('/bookresults')
  end

  it 'searches for book by keyword', :vcr do
    visit('/discover')
    expect(page).to have_button('Search')

    fill_in :query, with: 'pride'
    click_button 'Search'
    expect(current_path).to eq('/bookresults')
    expect(page).to have_content('Pride and Prejudice')
  end
end
