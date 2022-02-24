require 'rails_helper'

RSpec.describe  'Book Club Landing/Welcome page' do
  it 'shows the landing page' do
    visit ('/')

    expect(page).to have_content('Book Club')

    # This will be filled with Brad's Quote API
    expect(page).to have_content('To Be or Not To Be')

    click_link 'Discover Books'
    expect(current_path).to eq('/discover')
  end
end
