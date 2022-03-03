require 'rails_helper'

RSpec.describe 'Club show page' do

  before(:each) do
  user = User.new({ id: '1', attributes: { name: "Raccoon22", email: "happy22@example.com" } })

  OmniAuth.config.test_mode = true

  #we are getting CSRF get vs. post errors, and have chosen to ignore them
  OmniAuth.config.silence_get_warning = true

  OmniAuth.config.add_mock(:google, {:uid => '12345'})
  Rails.application.env_config["omniauth.auth"] = OmniAuth.config.mock_auth[:google_oauth2]

  allow_any_instance_of(ApplicationController)
      .to receive(:current_user).and_return(user)
      visit "/auth/google_oauth2"
  end
  it "checks that page exists ", :vcr do
    visit("/clubs/1")
  end

  it "checks for the clubs details", :vcr do
    visit("/clubs/1")

    expect(page).to have_content("Cool Cats")
    expect(page).to have_content("Club Book: Pride")
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

  it 'can create new comments', :vcr do

    visit("/clubs/1")

    fill_in :title, with: 'My title'
    fill_in :body, with: 'My body'

    click_button "Submit"

    expect(current_path).to eq("/clubs/1")
    # within "#comment-17" do
    expect(page).to have_content('My title')
    # end
  end
end
