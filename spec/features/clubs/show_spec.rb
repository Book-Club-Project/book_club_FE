require 'rails_helper'

RSpec.describe 'Club show page' do
  context 'As an authenticated user', :vcr do
    let!(:user) { User.new({ id: '1', attributes: { name: "Raccoon22", email: "happy22@example.com" } }) }

    before(:each) do
      OmniAuth.config.test_mode = true

      # Silence CSRF attack warnings
      OmniAuth.config.silence_get_warning = true

      # Mock OAuth user authentication
      OmniAuth.config.add_mock(:google, {:uid => '12345'})
      Rails.application.env_config["omniauth.auth"] = OmniAuth.config.mock_auth[:google_oauth2]

      # Set current user
      allow_any_instance_of(ApplicationController)
          .to receive(:current_user).and_return(user)

      visit "/auth/google_oauth2"
    end

    context 'Content displays for authenticated user' do
      before(:each) do
        visit '/books/gwgON2IwgDUC'
        click_button "Create Book Club"

        within '#form' do
          fill_in :name, with: "Hello123"
          click_button "Create Book Club"
        end
      end

      scenario 'I am on a club show page' do
        expect(current_path).to match('/clubs/')
      end

      # Navbar behavior is tested in welcome/index_spec.rb
      scenario 'I see the nav bar links for authenticated user' do
        expect(page).to have_link('Home', href: '/')
        expect(page).to have_link('Discover Books', href: '/discover')

        expect(page).to_not have_link('Login', href: '/login')
        expect(page).to_not have_link('Register', href: '/register')

        expect(page).to have_link('Logout')
        expect(page).to have_link('My Dashboard')
      end

      # Skipped to not blow out API rate limit
      xscenario 'I see a random quote' do
        expect(page).to have_css('#random-quote')
      end

      scenario "I see the club details" do
        expect(page).to have_content("Hello123")
        expect(page).to have_content("Club Book:")
        expect(page).to have_content("Pride and Prejudice")
      end

      scenario "I see the host and users who have been added" do
        visit("/clubs/1")

        expect(page).to have_content("1 (Host) - 1@mail.com")
        expect(page).to have_content("2 - 2@mail.com")
        expect(page).to have_content("3 - 3@mail.com")
        expect(page).to have_content("4 - 4@mail.com")
        expect(page).not_to have_content("5 - 5@mail.com")
      end

      scenario "I see comments members have made" do
        visit("/clubs/1")

        expect(page).to have_content("Comments")
        expect(page).to have_content("Comment by: 1")
        expect(page).to have_content("Hello-- Blah")
        expect(page).to have_content("Comment by: 3")
      end

      scenario 'I can create new comments' do
        visit("/clubs/1")

        fill_in :title, with: 'My title'
        fill_in :body, with: 'My body'

        click_button "Submit"

        expect(current_path).to eq("/clubs/1")
        expect(page).to have_content('My title')
      end
    end
  end
end
