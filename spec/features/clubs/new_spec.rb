require 'rails_helper'

RSpec.describe "New club page" do
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
  
  it "check for a create new club button", :vcr do
    visit("/books/gwgON2IwgDUC")

    click_button "Create Book Club"

    expect(current_path).to eq("/clubs/new")
  end

  it "checks to see if we can create a new club", :vcr do
    visit("/books/gwgON2IwgDUC")

    click_button "Create Book Club"

    fill_in :club_name, with: "Hello123"

    click_button "Create"

    expect(current_path).to match('/clubs/')
  end
end
