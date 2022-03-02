require 'rails_helper'

RSpec.describe 'Club show page' do
  it "checks that page exists ", :vcr do
    visit("/clubs/1")
  end

  it "checks for the clubs details", :vcr do
    visit("/clubs/1")

    expect(page).to have_content("Cool Cats")
    # expect(page).to have_content("Club Book: Book Title")
  end

  it "checks for the club users", :vcr do
    visit("/clubs/1")

    expect(page).to have_content("1 (Host) - 1@mail.com")
    expect(page).to have_content("2 - 2@mail.com")
    expect(page).to have_content("3 - 3@mail.com")
    expect(page).to have_content("4 - 4@mail.com")
    expect(page).not_to have_content("5 - 5@mail.com")
  end

  it "checks for the clubs comments", :vcr do
    visit("/clubs/1")

    expect(page).to have_content("Comments")
    expect(page).to have_content("Comment by: 1")
    expect(page).to have_content("Hello-- Blah")
    expect(page).to have_content("Comment by: 3")

  end
end
