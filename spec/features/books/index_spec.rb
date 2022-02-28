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
end
