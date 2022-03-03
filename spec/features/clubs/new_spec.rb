require 'rails_helper'

RSpec.describe "New club page" do
  it "check for a create new club button", :vcr do
    visit("/books/gwgON2IwgDUC")

    click_button "Create Book Club"

    expect(current_path).to eq("/clubs/new")
  end

  it "checsk to see if we can create a new club", :vcr do
    visit("/books/gwgON2IwgDUC")

    click_button "Create Book Club"

    fill_in :club_name, with: "Hello123"

    click_button "Create"

    expect(current_path).to match('/clubs/')
  end
end
